@implementation NSUserDefaults

- (BOOL)rc_deletionIsImmediate
{
  return -[NSUserDefaults _deletionMatchesWindow:](self, "_deletionMatchesWindow:", 0);
}

- (BOOL)rc_deletionIsNever
{
  return -[NSUserDefaults _deletionMatchesWindow:](self, "_deletionMatchesWindow:", -1);
}

- (BOOL)_deletionMatchesWindow:(int64_t)a3
{
  return -[NSUserDefaults rc_recentlyDeletedWindow](self, "rc_recentlyDeletedWindow") == a3;
}

- (int64_t)rc_recentlyDeletedWindow
{
  void *v2;
  void *v3;
  int64_t v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](self, "objectForKey:", CFSTR("RCVoiceMemosRecentlyDeletedWindowKey")));
  v3 = v2;
  if (v2)
    v4 = (int64_t)objc_msgSend(v2, "integerValue");
  else
    v4 = 30;

  return v4;
}

- (void)rc_setRecentlyDeletedWindow:(int64_t)a3
{
  -[NSUserDefaults setInteger:forKey:](self, "setInteger:forKey:", a3, CFSTR("RCVoiceMemosRecentlyDeletedWindowKey"));
  -[NSUserDefaults settingsChangedPostNotification](self, "settingsChangedPostNotification");
}

- (int64_t)rc_audioQuality
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](self, "objectForKey:", CFSTR("RCVoiceMemosAudioQualityKey")));
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = 0;

  return (int64_t)v4;
}

- (void)rc_setAudioQuality:(int64_t)a3
{
  -[NSUserDefaults setInteger:forKey:](self, "setInteger:forKey:", a3, CFSTR("RCVoiceMemosAudioQualityKey"));
  -[NSUserDefaults settingsChangedPostNotification](self, "settingsChangedPostNotification");
}

- (BOOL)rc_useLocationBasedNaming
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](self, "objectForKey:", CFSTR("RCVoiceMemosUseLocationBasedNaming")));
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 1;

  return v4;
}

- (void)rc_setUseLocationBasedNaming:(BOOL)a3
{
  -[NSUserDefaults setBool:forKey:](self, "setBool:forKey:", a3, CFSTR("RCVoiceMemosUseLocationBasedNaming"));
  -[NSUserDefaults settingsChangedPostNotification](self, "settingsChangedPostNotification");
}

- (BOOL)rc_useStereoRecording
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](self, "objectForKey:", CFSTR("RCVoiceMemosStereoRecordingKey")));
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (void)rc_setUseStereoRecording:(BOOL)a3
{
  -[NSUserDefaults setBool:forKey:](self, "setBool:forKey:", a3, CFSTR("RCVoiceMemosStereoRecordingKey"));
  -[NSUserDefaults settingsChangedPostNotification](self, "settingsChangedPostNotification");
}

- (void)settingsChangedPostNotification
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
  objc_msgSend(v2, "postNotificationName:object:userInfo:deliverImmediately:", CFSTR("RCVoiceMemosSettingsDidChangeNotification"), 0, 0, 1);

}

@end
