@implementation ICRegisterStateHandlersLaunchTask

- (void)runLaunchTask
{
  +[ICCloudContext registerStateHandler](ICCloudContext, "registerStateHandler");
  +[ICAccountUtilities registerStateHandler](ICAccountUtilities, "registerStateHandler");
  +[ICInternalSettingsStateHandler registerStateHandler](ICInternalSettingsStateHandler, "registerStateHandler");
  +[ICIndexerStateHandler registerStateHandler](ICIndexerStateHandler, "registerStateHandler");
}

@end
