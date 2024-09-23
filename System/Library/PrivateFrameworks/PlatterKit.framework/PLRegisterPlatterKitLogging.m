@implementation PLRegisterPlatterKitLogging

void __PLRegisterPlatterKitLogging_block_invoke()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;
  os_log_t v4;
  void *v5;

  v0 = os_log_create((const char *)PLLogSubsystem, "General");
  v1 = (void *)PLLogGeneral;
  PLLogGeneral = (uint64_t)v0;

  v2 = os_log_create((const char *)PLLogSubsystem, "Transition");
  v3 = (void *)PLLogTransition;
  PLLogTransition = (uint64_t)v2;

  v4 = os_log_create((const char *)PLLogSubsystem, "Interaction");
  v5 = (void *)PLLogInteraction;
  PLLogInteraction = (uint64_t)v4;

}

@end
