@implementation STSystemStatusLogObservation

void __STSystemStatusLogObservation_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create(STSystemStatusLoggingSubsystem, "Observation");
  v1 = (void *)STSystemStatusLogObservation___logObj;
  STSystemStatusLogObservation___logObj = (uint64_t)v0;

}

@end
