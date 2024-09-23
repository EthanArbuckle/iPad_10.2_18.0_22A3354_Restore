@implementation WFActionSkipList

void __WFActionSkipList_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("is.workflow.actions.timer.start"), CFSTR("com.apple.mobiletimer-framework.MobileTimerIntents.MTCreateAlarmIntent"), CFSTR("com.apple.mobiletimer-framework.MobileTimerIntents.MTToggleAlarmIntent"), CFSTR("com.apple.mobiletimer-framework.MobileTimerIntents.MTGetAlarmsIntent"), CFSTR("com.apple.musicrecognition.RecognizeMusicIntent"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)WFActionSkipList_skipList;
  WFActionSkipList_skipList = v0;

}

@end
