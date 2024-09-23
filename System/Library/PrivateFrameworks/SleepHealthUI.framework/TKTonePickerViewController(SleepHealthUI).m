@implementation TKTonePickerViewController(SleepHealthUI)

+ (uint64_t)hksh_alarmPickerWithToneIdentifier:()SleepHealthUI vibrationIdentifier:
{
  return objc_msgSend(a1, "hksh_alarmPickerWithToneIdentifier:vibrationIdentifier:styleProvider:", a3, a4, 0);
}

+ (id)hksh_alarmPickerWithToneIdentifier:()SleepHealthUI vibrationIdentifier:styleProvider:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_msgSend([a1 alloc], "_initWithAlertType:tableViewStyle:", 13, 2);
  objc_msgSend(v11, "setTopic:", *MEMORY[0x1E0DBF760]);
  objc_msgSend(v11, "setShowsNone:", 0);
  objc_msgSend(v11, "setShowsVibrations:", 1);
  HKSHUILocalizedString(CFSTR("SCHEDULE_OCCURRENCE_ALARM_SOUND_TITLE"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTitle:", v12);

  if (v8)
    objc_msgSend(v11, "setSelectedToneIdentifier:", v8);
  if (v9)
    objc_msgSend(v11, "setSelectedVibrationIdentifier:", v9);
  objc_msgSend(v11, "setStyleProvider:", v10);

  return v11;
}

@end
