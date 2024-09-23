@implementation VTUILogInitIfNeeded

void __VTUILogInitIfNeeded_block_invoke()
{
  os_log_t v0;
  void *v1;
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  NSLog(CFSTR("::: Initializing VoiceTriggerUI logging..."));
  v0 = os_log_create((const char *)VTUILoggingSubsystem, (const char *)kVTUILoggingContextFramework);
  v1 = (void *)VTUILogContextFacility;
  VTUILogContextFacility = (uint64_t)v0;

  v2 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136315138;
    v4 = "VTUILogInitIfNeeded_block_invoke";
    _os_log_impl(&dword_229EF7000, v2, OS_LOG_TYPE_DEFAULT, "%s ::: VoiceTriggerUI logging initialized", (uint8_t *)&v3, 0xCu);
  }
}

@end
