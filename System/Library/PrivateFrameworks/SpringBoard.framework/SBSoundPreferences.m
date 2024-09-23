@implementation SBSoundPreferences

+ (id)_soundDefaults
{
  if (_soundDefaults___once != -1)
    dispatch_once(&_soundDefaults___once, &__block_literal_global_34);
  return (id)_soundDefaults___instance;
}

void __36__SBSoundPreferences__soundDefaults__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "soundDefaults");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_soundDefaults___instance;
  _soundDefaults___instance = v0;

}

+ (id)calendarAlarmPath
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "_soundDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "calendarAlarmPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)ringtoneIdentifier
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DBF740], "sharedToneManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentToneIdentifierForAlertType:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)ringtonePath
{
  void *v2;
  void *v3;
  void *v4;

  +[SBSoundPreferences ringtoneIdentifier](SBSoundPreferences, "ringtoneIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DBF740], "sharedToneManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filePathForToneIdentifier:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)vibrateWhenRinging
{
  void *v2;
  char v3;

  objc_msgSend(a1, "_soundDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "vibrateWhenRinging");

  return v3;
}

+ (BOOL)vibrateWhenSilent
{
  void *v2;
  char v3;

  objc_msgSend(a1, "_soundDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "vibrateWhenSilent");

  return v3;
}

@end
