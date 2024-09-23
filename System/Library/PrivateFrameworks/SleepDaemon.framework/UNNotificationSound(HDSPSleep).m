@implementation UNNotificationSound(HDSPSleep)

+ (id)hdsp_bedtimeReminderSound
{
  void *v0;

  objc_msgSend(MEMORY[0x24BDF8810], "soundWithAlertType:", 13);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setShouldRepeat:", 0);
  objc_msgSend(v0, "setAlertTopic:", *MEMORY[0x24BEB8CE8]);
  return v0;
}

+ (id)hdsp_chargingReminderSound
{
  void *v0;

  objc_msgSend(MEMORY[0x24BDF8810], "soundWithAlertType:", 17);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setShouldRepeat:", 0);
  objc_msgSend(v0, "setAlertTopic:", *MEMORY[0x24BEB8D00]);
  return v0;
}

+ (id)hdsp_wakeUpResultsSound
{
  void *v0;

  objc_msgSend(MEMORY[0x24BDF8810], "soundWithAlertType:", 25);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setShouldRepeat:", 0);
  return v0;
}

+ (id)hdsp_wakeDetectionSound
{
  void *v0;

  objc_msgSend(MEMORY[0x24BDF8810], "soundWithAlertType:", 26);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setShouldRepeat:", 0);
  objc_msgSend(v0, "setAlertTopic:", *MEMORY[0x24BEB8D28]);
  return v0;
}

@end
