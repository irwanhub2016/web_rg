Before do |scenario|
  $feature = scenario.feature.name
  $scenario = scenario.name
  @api_endpoint ||= DataMagic.load 'api_endpoint.yml'
  $base_url = ENV['BASE_URL']
  @step_list = []
  @count_step = 0
  # init_report_automation_json_file unless ENV['TEST_ENV_NUMBER'].nil?
  scenario.test_steps.each { |x| @step_list << x.text unless x.text.include? 'hook' }
  p "Will run scenario #{$scenario} from feature #{$feature}"
  $current_step = @step_list[@count_step]
end

AfterStep do
  @count_step += 1
  $current_step = @step_list[@count_step]
end

After do |scenario|
  scenario_id = if scenario.respond_to?('scenario_outline')
                  scenario.scenario_outline.cell_values.first
                else
                  scenario.name.split('-')[0].strip
                end
  p "FAILED in scenario #{scenario.name}" if scenario.failed?
end
