@implementation SSRVoiceProfileStorePrefs

- (void)saveKnownUserVoiceProfiles:(id)a3
{
  id value;

  value = a3;
  CFPreferencesAppSynchronize(CFSTR("com.apple.speakerrecognition"));
  CFPreferencesSetAppValue(CFSTR("Known User Voice Profiles"), value, CFSTR("com.apple.speakerrecognition"));

}

- (void)setVoiceProfileStoreVersion:(unint64_t)a3
{
  id v4;

  CFPreferencesAppSynchronize(CFSTR("com.apple.speakerrecognition"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  CFPreferencesSetAppValue(CFSTR("Voice Profile Store Version"), v4, CFSTR("com.apple.speakerrecognition"));

}

- (id)loadKnownUserVoiceProfiles
{
  CFPreferencesAppSynchronize(CFSTR("com.apple.speakerrecognition"));
  return (id)(id)CFPreferencesCopyAppValue(CFSTR("Known User Voice Profiles"), CFSTR("com.apple.speakerrecognition"));
}

- (int64_t)getVoiceProfileStoreVersion
{
  void *v2;
  void *v3;
  int64_t v4;

  CFPreferencesAppSynchronize(CFSTR("com.apple.speakerrecognition"));
  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("Voice Profile Store Version"), CFSTR("com.apple.speakerrecognition"));
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "unsignedIntegerValue");
  else
    v4 = -1;

  return v4;
}

- (id)getAllContentsOfVoiceProfileStorePrefs
{
  void *v3;
  int64_t v4;
  SSRVoiceProfileStoreData *v5;
  void *v6;
  SSRVoiceProfileStoreData *v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  NSObject *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  CFPreferencesAppSynchronize(CFSTR("com.apple.speakerrecognition"));
  -[SSRVoiceProfileStorePrefs loadKnownUserVoiceProfiles](self, "loadKnownUserVoiceProfiles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = -[SSRVoiceProfileStorePrefs getVoiceProfileStoreVersion](self, "getVoiceProfileStoreVersion");
    v5 = [SSRVoiceProfileStoreData alloc];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[SSRVoiceProfileStoreData initWithVoiceProfileArray:withVersion:](v5, "initWithVoiceProfileArray:withVersion:", v3, v6);

    v16 = 0;
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, &v16);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v16;
    if (v9 || !v8)
    {
      v12 = (void *)*MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
      {
        v14 = v12;
        objc_msgSend(v9, "localizedDescription");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v18 = "-[SSRVoiceProfileStorePrefs getAllContentsOfVoiceProfileStorePrefs]";
        v19 = 2112;
        v20 = v15;
        _os_log_error_impl(&dword_2117D4000, v14, OS_LOG_TYPE_ERROR, "%s Failed to serialize dict with err %@", buf, 0x16u);

      }
      v10 = 0;
    }
    else
    {
      v10 = v8;
    }

  }
  else
  {
    v11 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "-[SSRVoiceProfileStorePrefs getAllContentsOfVoiceProfileStorePrefs]";
      _os_log_error_impl(&dword_2117D4000, v11, OS_LOG_TYPE_ERROR, "%s Empty known users", buf, 0xCu);
    }
    v10 = 0;
  }

  return v10;
}

- (void)applyContentsToVoiceProfileStorePrefs:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  BOOL v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDD1620];
  v5 = a3;
  v19 = 0;
  objc_msgSend(v4, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v5, &v19);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v19;
  if (v7)
    v8 = 1;
  else
    v8 = v6 == 0;
  if (v8)
  {
    v9 = (void *)*MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      v10 = v9;
      objc_msgSend(v7, "localizedDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v21 = "-[SSRVoiceProfileStorePrefs applyContentsToVoiceProfileStorePrefs:]";
      v22 = 2112;
      v23 = v11;
      _os_log_error_impl(&dword_2117D4000, v10, OS_LOG_TYPE_ERROR, "%s Unable to decode blob, not restoring with error %@", buf, 0x16u);

    }
  }
  else
  {
    objc_msgSend(v6, "vpArray");
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12
      && (v13 = (void *)v12,
          objc_msgSend(v6, "vpArray"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v15 = objc_msgSend(v14, "count"),
          v14,
          v13,
          v15))
    {
      objc_msgSend(v6, "version");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSRVoiceProfileStorePrefs setVoiceProfileStoreVersion:](self, "setVoiceProfileStoreVersion:", objc_msgSend(v16, "integerValue"));

      objc_msgSend(v6, "vpArray");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSRVoiceProfileStorePrefs saveKnownUserVoiceProfiles:](self, "saveKnownUserVoiceProfiles:", v17);

    }
    else
    {
      v18 = *MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v21 = "-[SSRVoiceProfileStorePrefs applyContentsToVoiceProfileStorePrefs:]";
        _os_log_error_impl(&dword_2117D4000, v18, OS_LOG_TYPE_ERROR, "%s Empty known users, not restoring", buf, 0xCu);
      }
    }
  }

}

+ (id)sharedStorePrefs
{
  if (sharedStorePrefs_onceToken != -1)
    dispatch_once(&sharedStorePrefs_onceToken, &__block_literal_global_7351);
  return (id)sharedStorePrefs_sharedStorePrefs;
}

uint64_t __45__SSRVoiceProfileStorePrefs_sharedStorePrefs__block_invoke()
{
  SSRVoiceProfileStorePrefs *v0;
  void *v1;

  v0 = objc_alloc_init(SSRVoiceProfileStorePrefs);
  v1 = (void *)sharedStorePrefs_sharedStorePrefs;
  sharedStorePrefs_sharedStorePrefs = (uint64_t)v0;

  return SSRLogInitIfNeeded();
}

@end
