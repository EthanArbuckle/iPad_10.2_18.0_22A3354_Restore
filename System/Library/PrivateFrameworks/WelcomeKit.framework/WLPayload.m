@implementation WLPayload

- (WLPayload)init
{
  WLPayload *v2;
  WLPayload *v3;
  WLFeaturePayload *v4;
  WLFeaturePayload *v5;
  WLFeaturePayload *v6;
  WLFeaturePayload *v7;
  WLFeaturePayload *v8;
  WLFeaturePayload *v9;
  WLFeaturePayload *v10;
  WLFeaturePayload *v11;
  WLFeaturePayload *v12;
  WLFeaturePayload *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)WLPayload;
  v2 = -[WLPayload init](&v15, sel_init);
  v3 = v2;
  if (v2)
  {
    -[WLPayload setAndroidAPILevel:](v2, "setAndroidAPILevel:", CFSTR("?"));
    -[WLPayload setAndroidBrand:](v3, "setAndroidBrand:", CFSTR("?"));
    -[WLPayload setAndroidLocale:](v3, "setAndroidLocale:", CFSTR("?"));
    -[WLPayload setAndroidModel:](v3, "setAndroidModel:", CFSTR("?"));
    -[WLPayload setAndroidOSVersion:](v3, "setAndroidOSVersion:", CFSTR("?"));
    -[WLPayload setAndroidVersion:](v3, "setAndroidVersion:", CFSTR("?"));
    -[WLPayload setAndroidVersionCode:](v3, "setAndroidVersionCode:", CFSTR("?"));
    -[WLPayload setState:](v3, "setState:", CFSTR("?"));
    v4 = objc_alloc_init(WLFeaturePayload);
    -[WLPayload setMessages:](v3, "setMessages:", v4);

    v5 = objc_alloc_init(WLFeaturePayload);
    -[WLPayload setPhotos:](v3, "setPhotos:", v5);

    v6 = objc_alloc_init(WLFeaturePayload);
    -[WLPayload setVideos:](v3, "setVideos:", v6);

    v7 = objc_alloc_init(WLFeaturePayload);
    -[WLPayload setContacts:](v3, "setContacts:", v7);

    v8 = objc_alloc_init(WLFeaturePayload);
    -[WLPayload setCalendars:](v3, "setCalendars:", v8);

    v9 = objc_alloc_init(WLFeaturePayload);
    -[WLPayload setBookmarks:](v3, "setBookmarks:", v9);

    v10 = objc_alloc_init(WLFeaturePayload);
    -[WLPayload setAccounts:](v3, "setAccounts:", v10);

    v11 = objc_alloc_init(WLFeaturePayload);
    -[WLPayload setFiles:](v3, "setFiles:", v11);

    v12 = objc_alloc_init(WLFeaturePayload);
    -[WLPayload setAccessibilitySettings:](v3, "setAccessibilitySettings:", v12);

    v13 = objc_alloc_init(WLFeaturePayload);
    -[WLPayload setDisplaySettings:](v3, "setDisplaySettings:", v13);

  }
  return v3;
}

- (id)dictionary
{
  id v3;
  WLFeaturePayload *calendars;
  WLFeaturePayload *bookmarks;
  WLFeaturePayload *displaySettings;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  WLPayload *v31;
  void *v32;
  unint64_t v33;
  unint64_t v34;
  WLFeaturePayload *messages;
  __int128 v36;
  WLFeaturePayload *contacts;
  WLFeaturePayload *v38;
  WLFeaturePayload *v39;
  __int128 v40;
  WLFeaturePayload *accessibilitySettings;
  WLFeaturePayload *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v3, "setObject:forKey:", self->_androidAPILevel, CFSTR("android_api_level"));
  objc_msgSend(v3, "setObject:forKey:", self->_androidBrand, CFSTR("android_brand"));
  objc_msgSend(v3, "setObject:forKey:", self->_androidLocale, CFSTR("android_locale"));
  objc_msgSend(v3, "setObject:forKey:", self->_androidModel, CFSTR("android_model"));
  objc_msgSend(v3, "setObject:forKey:", self->_androidOSVersion, CFSTR("android_os_version"));
  objc_msgSend(v3, "setObject:forKey:", self->_androidVersion, CFSTR("android_version"));
  objc_msgSend(v3, "setObject:forKey:", self->_androidVersionCode, CFSTR("android_version_code"));
  objc_msgSend(v3, "setObject:forKey:", self->_state, CFSTR("state"));
  messages = self->_messages;
  v36 = *(_OWORD *)&self->_photos;
  calendars = self->_calendars;
  bookmarks = self->_bookmarks;
  contacts = self->_contacts;
  v38 = calendars;
  v39 = bookmarks;
  v40 = *(_OWORD *)&self->_accounts;
  displaySettings = self->_displaySettings;
  accessibilitySettings = self->_accessibilitySettings;
  v42 = displaySettings;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &messages, 10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0x24BDD1000uLL;
  if (objc_msgSend(v7, "count"))
  {
    v31 = self;
    v32 = v7;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    do
    {
      objc_msgSend(&unk_24EFCF280, "objectAtIndexedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndexedSubscript:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");
      v15 = objc_msgSend(v13, "size");
      v33 = v15 >> 30;
      v34 = objc_msgSend(v13, "elapsedTime") / 0x3CuLL;
      v10 += v15;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v13, "enabled"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_enabled"), v12);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v16, v17);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v14);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v12);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v18, v19);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v33);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_size"), v12);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v20, v21);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v34);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_elapsed_time"), v12);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v22, v23);

      objc_msgSend(v13, "state");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v9 += v14;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_state"), v12);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v24, v25);

      v7 = v32;
      ++v11;
    }
    while (v11 < objc_msgSend(v32, "count"));
    v26 = v10 >> 30;
    self = v31;
    v8 = 0x24BDD1000;
  }
  else
  {
    v26 = 0;
    v9 = 0;
  }
  objc_msgSend(*(id *)(v8 + 1760), "numberWithUnsignedLongLong:", v9);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("data"));

  objc_msgSend(*(id *)(v8 + 1760), "numberWithUnsignedLongLong:", v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("data_size"));

  objc_msgSend(*(id *)(v8 + 1760), "numberWithUnsignedLongLong:", self->_elapsedTime / 0x3C);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("elapsed_time"));

  return v3;
}

- (NSString)androidAPILevel
{
  return self->_androidAPILevel;
}

- (void)setAndroidAPILevel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)androidBrand
{
  return self->_androidBrand;
}

- (void)setAndroidBrand:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)androidLocale
{
  return self->_androidLocale;
}

- (void)setAndroidLocale:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)androidModel
{
  return self->_androidModel;
}

- (void)setAndroidModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)androidOSVersion
{
  return self->_androidOSVersion;
}

- (void)setAndroidOSVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)androidVersion
{
  return self->_androidVersion;
}

- (void)setAndroidVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)androidVersionCode
{
  return self->_androidVersionCode;
}

- (void)setAndroidVersionCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (unint64_t)data
{
  return self->_data;
}

- (void)setData:(unint64_t)a3
{
  self->_data = a3;
}

- (unint64_t)dataSize
{
  return self->_dataSize;
}

- (void)setDataSize:(unint64_t)a3
{
  self->_dataSize = a3;
}

- (unint64_t)elapsedTime
{
  return self->_elapsedTime;
}

- (void)setElapsedTime:(unint64_t)a3
{
  self->_elapsedTime = a3;
}

- (NSString)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (WLFeaturePayload)messages
{
  return self->_messages;
}

- (void)setMessages:(id)a3
{
  objc_storeStrong((id *)&self->_messages, a3);
}

- (WLFeaturePayload)photos
{
  return self->_photos;
}

- (void)setPhotos:(id)a3
{
  objc_storeStrong((id *)&self->_photos, a3);
}

- (WLFeaturePayload)videos
{
  return self->_videos;
}

- (void)setVideos:(id)a3
{
  objc_storeStrong((id *)&self->_videos, a3);
}

- (WLFeaturePayload)voiceMemos
{
  return self->_voiceMemos;
}

- (WLFeaturePayload)contacts
{
  return self->_contacts;
}

- (void)setContacts:(id)a3
{
  objc_storeStrong((id *)&self->_contacts, a3);
}

- (WLFeaturePayload)callHistory
{
  return self->_callHistory;
}

- (WLFeaturePayload)calendars
{
  return self->_calendars;
}

- (void)setCalendars:(id)a3
{
  objc_storeStrong((id *)&self->_calendars, a3);
}

- (WLFeaturePayload)bookmarks
{
  return self->_bookmarks;
}

- (void)setBookmarks:(id)a3
{
  objc_storeStrong((id *)&self->_bookmarks, a3);
}

- (WLFeaturePayload)accounts
{
  return self->_accounts;
}

- (void)setAccounts:(id)a3
{
  objc_storeStrong((id *)&self->_accounts, a3);
}

- (WLFeaturePayload)files
{
  return self->_files;
}

- (void)setFiles:(id)a3
{
  objc_storeStrong((id *)&self->_files, a3);
}

- (WLFeaturePayload)accessibilitySettings
{
  return self->_accessibilitySettings;
}

- (void)setAccessibilitySettings:(id)a3
{
  objc_storeStrong((id *)&self->_accessibilitySettings, a3);
}

- (WLFeaturePayload)displaySettings
{
  return self->_displaySettings;
}

- (void)setDisplaySettings:(id)a3
{
  objc_storeStrong((id *)&self->_displaySettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displaySettings, 0);
  objc_storeStrong((id *)&self->_accessibilitySettings, 0);
  objc_storeStrong((id *)&self->_files, 0);
  objc_storeStrong((id *)&self->_accounts, 0);
  objc_storeStrong((id *)&self->_bookmarks, 0);
  objc_storeStrong((id *)&self->_calendars, 0);
  objc_storeStrong((id *)&self->_callHistory, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
  objc_storeStrong((id *)&self->_voiceMemos, 0);
  objc_storeStrong((id *)&self->_videos, 0);
  objc_storeStrong((id *)&self->_photos, 0);
  objc_storeStrong((id *)&self->_messages, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_androidVersionCode, 0);
  objc_storeStrong((id *)&self->_androidVersion, 0);
  objc_storeStrong((id *)&self->_androidOSVersion, 0);
  objc_storeStrong((id *)&self->_androidModel, 0);
  objc_storeStrong((id *)&self->_androidLocale, 0);
  objc_storeStrong((id *)&self->_androidBrand, 0);
  objc_storeStrong((id *)&self->_androidAPILevel, 0);
}

@end
