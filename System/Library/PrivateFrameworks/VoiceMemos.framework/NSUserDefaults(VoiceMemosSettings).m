@implementation NSUserDefaults(VoiceMemosSettings)

- (uint64_t)rc_deletionIsImmediate
{
  return objc_msgSend(a1, "_deletionMatchesWindow:", 0);
}

- (uint64_t)rc_deletionIsNever
{
  return objc_msgSend(a1, "_deletionMatchesWindow:", -1);
}

- (BOOL)_deletionMatchesWindow:()VoiceMemosSettings
{
  return objc_msgSend(a1, "rc_recentlyDeletedWindow") == a3;
}

- (uint64_t)rc_recentlyDeletedWindow
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "objectForKey:", CFSTR("RCVoiceMemosRecentlyDeletedWindowKey"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "integerValue");
  else
    v3 = 30;

  return v3;
}

- (uint64_t)rc_setRecentlyDeletedWindow:()VoiceMemosSettings
{
  objc_msgSend(a1, "setInteger:forKey:", a3, CFSTR("RCVoiceMemosRecentlyDeletedWindowKey"));
  return objc_msgSend(a1, "settingsChangedPostNotification");
}

- (uint64_t)rc_audioQuality
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "objectForKey:", CFSTR("RCVoiceMemosAudioQualityKey"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "integerValue");
  else
    v3 = 0;

  return v3;
}

- (uint64_t)rc_setAudioQuality:()VoiceMemosSettings
{
  objc_msgSend(a1, "setInteger:forKey:", a3, CFSTR("RCVoiceMemosAudioQualityKey"));
  return objc_msgSend(a1, "settingsChangedPostNotification");
}

- (uint64_t)rc_useLocationBasedNaming
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "objectForKey:", CFSTR("RCVoiceMemosUseLocationBasedNaming"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "BOOLValue");
  else
    v3 = 1;

  return v3;
}

- (uint64_t)rc_setUseLocationBasedNaming:()VoiceMemosSettings
{
  objc_msgSend(a1, "setBool:forKey:", a3, CFSTR("RCVoiceMemosUseLocationBasedNaming"));
  return objc_msgSend(a1, "settingsChangedPostNotification");
}

- (uint64_t)rc_useStereoRecording
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "objectForKey:", CFSTR("RCVoiceMemosStereoRecordingKey"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (uint64_t)rc_setUseStereoRecording:()VoiceMemosSettings
{
  objc_msgSend(a1, "setBool:forKey:", a3, CFSTR("RCVoiceMemosStereoRecordingKey"));
  return objc_msgSend(a1, "settingsChangedPostNotification");
}

- (void)settingsChangedPostNotification
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:userInfo:deliverImmediately:", CFSTR("RCVoiceMemosSettingsDidChangeNotification"), 0, 0, 1);

}

@end
