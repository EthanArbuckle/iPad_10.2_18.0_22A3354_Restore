@implementation ICInternalSettingsStateHandler

+ (void)registerStateHandler
{
  +[ICStateHandler addStateHandlerWithName:sysdiagnoseOnly:stateBlock:](ICStateHandler, "addStateHandlerWithName:sysdiagnoseOnly:stateBlock:", "InternalSettings", 1, &stru_100551B38);
}

@end
