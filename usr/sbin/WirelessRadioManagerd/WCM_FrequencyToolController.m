@implementation WCM_FrequencyToolController

- (WCM_FrequencyToolController)init
{
  WCM_FrequencyToolController *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WCM_FrequencyToolController;
  v2 = -[WCM_Controller init](&v4, "init");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("FrequencyToolController Init"));
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("FrequencyToolController Dealloc"));
  v3.receiver = self;
  v3.super_class = (Class)WCM_FrequencyToolController;
  -[WCM_Controller dealloc](&v3, "dealloc");
}

@end
