@implementation BMClockAlarm(SearchUIExtension)

- (void)getEnabledStatusWithCompletion:()SearchUIExtension
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "alarmID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[SearchUIMobileTimerUtilities getEnablementStatusForAlarmWithIdentifier:completion:](SearchUIMobileTimerUtilities, "getEnablementStatusForAlarmWithIdentifier:completion:", v5, v4);

}

@end
