@implementation WLContext

- (WLContext)init
{
  WLContext *v2;
  WLContext *v3;
  WLImportContext *v4;
  WLImportContext *v5;
  WLImportContext *v6;
  WLImportContext *v7;
  WLImportContext *v8;
  WLImportContext *v9;
  WLImportContext *v10;
  WLImportContext *v11;
  WLImportContext *v12;
  WLImportContext *v13;
  WLImportContext *v14;
  WLImportContext *v15;
  WLImportContext *v16;
  WLImportContext *v17;
  WLImportContext *v18;
  WLImportContext *v19;
  WLImportContext *v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)WLContext;
  v2 = -[WLContext init](&v22, sel_init);
  v3 = v2;
  if (v2)
  {
    -[WLContext setIsEnabled:](v2, "setIsEnabled:", 1);
    v4 = objc_alloc_init(WLImportContext);
    -[WLContext setApplication:](v3, "setApplication:", v4);

    v5 = objc_alloc_init(WLImportContext);
    -[WLContext setAccount:](v3, "setAccount:", v5);

    v6 = objc_alloc_init(WLImportContext);
    -[WLContext setMessage:](v3, "setMessage:", v6);

    v7 = objc_alloc_init(WLImportContext);
    -[WLContext setContact:](v3, "setContact:", v7);

    v8 = objc_alloc_init(WLImportContext);
    -[WLContext setCallHistory:](v3, "setCallHistory:", v8);

    v9 = objc_alloc_init(WLImportContext);
    -[WLContext setCalendar:](v3, "setCalendar:", v9);

    v10 = objc_alloc_init(WLImportContext);
    -[WLContext setBookmark:](v3, "setBookmark:", v10);

    v11 = objc_alloc_init(WLImportContext);
    -[WLContext setFile:](v3, "setFile:", v11);

    v12 = objc_alloc_init(WLImportContext);
    -[WLContext setImage:](v3, "setImage:", v12);

    v13 = objc_alloc_init(WLImportContext);
    -[WLContext setVideo:](v3, "setVideo:", v13);

    v14 = objc_alloc_init(WLImportContext);
    -[WLContext setAlbum:](v3, "setAlbum:", v14);

    v15 = objc_alloc_init(WLImportContext);
    -[WLContext setVoiceMemo:](v3, "setVoiceMemo:", v15);

    v16 = objc_alloc_init(WLImportContext);
    -[WLContext setContainer:](v3, "setContainer:", v16);

    v17 = objc_alloc_init(WLImportContext);
    -[WLContext setAccessibilitySetting:](v3, "setAccessibilitySetting:", v17);

    v18 = objc_alloc_init(WLImportContext);
    -[WLContext setDisplaySetting:](v3, "setDisplaySetting:", v18);

    v19 = objc_alloc_init(WLImportContext);
    -[WLContext setPlaceholder:](v3, "setPlaceholder:", v19);

    v20 = objc_alloc_init(WLImportContext);
    -[WLContext setSim:](v3, "setSim:", v20);

  }
  return v3;
}

- (WLContext)initWithCoder:(id)a3
{
  id v4;
  WLContext *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)WLContext;
  v5 = -[WLContext init](&v24, sel_init);
  if (v5)
  {
    -[WLContext setIsEnabled:](v5, "setIsEnabled:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("is_enabled")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("application"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WLContext setApplication:](v5, "setApplication:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("account"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WLContext setAccount:](v5, "setAccount:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("message"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WLContext setMessage:](v5, "setMessage:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contact"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WLContext setContact:](v5, "setContact:", v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("call_history"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WLContext setCallHistory:](v5, "setCallHistory:", v10);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("calendar"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WLContext setCalendar:](v5, "setCalendar:", v11);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bookmark"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WLContext setBookmark:](v5, "setBookmark:", v12);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("file"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WLContext setFile:](v5, "setFile:", v13);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("image"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WLContext setImage:](v5, "setImage:", v14);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("video"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WLContext setVideo:](v5, "setVideo:", v15);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("album"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[WLContext setAlbum:](v5, "setAlbum:", v16);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("voice_memo"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[WLContext setVoiceMemo:](v5, "setVoiceMemo:", v17);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("container"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[WLContext setContainer:](v5, "setContainer:", v18);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessibility_setting"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[WLContext setAccessibilitySetting:](v5, "setAccessibilitySetting:", v19);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("display_setting"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[WLContext setDisplaySetting:](v5, "setDisplaySetting:", v20);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("placeholder"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[WLContext setPlaceholder:](v5, "setPlaceholder:", v21);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sim"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[WLContext setSim:](v5, "setSim:", v22);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 isEnabled;
  id v5;

  isEnabled = self->_isEnabled;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", isEnabled, CFSTR("is_enabled"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_application, CFSTR("application"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_account, CFSTR("account"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_message, CFSTR("message"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_contact, CFSTR("contact"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_callHistory, CFSTR("call_history"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_calendar, CFSTR("calendar"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bookmark, CFSTR("bookmark"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_file, CFSTR("file"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_image, CFSTR("image"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_video, CFSTR("video"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_album, CFSTR("album"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_voiceMemo, CFSTR("voice_memo"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_container, CFSTR("container"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accessibilitySetting, CFSTR("accessibility_setting"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_displaySetting, CFSTR("display_setting"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_placeholder, CFSTR("placeholder"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sim, CFSTR("sim"));

}

- (BOOL)isEnabled
{
  __int128 v3;
  WLImportContext *voiceMemo;
  WLImportContext *accessibilitySetting;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  char v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  __int128 v20;
  WLImportContext *message;
  __int128 v22;
  WLImportContext *calendar;
  __int128 v24;
  __int128 v25;
  WLImportContext *album;
  WLImportContext *v27;
  WLImportContext *container;
  WLImportContext *v29;
  __int128 v30;
  WLImportContext *sim;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v20 = *(_OWORD *)&self->_application;
  message = self->_message;
  v22 = *(_OWORD *)&self->_contact;
  calendar = self->_calendar;
  v3 = *(_OWORD *)&self->_image;
  v24 = *(_OWORD *)&self->_bookmark;
  v25 = v3;
  voiceMemo = self->_voiceMemo;
  album = self->_album;
  v27 = voiceMemo;
  accessibilitySetting = self->_accessibilitySetting;
  container = self->_container;
  v29 = accessibilitySetting;
  v30 = *(_OWORD *)&self->_displaySetting;
  sim = self->_sim;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v20, 17);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v11, "importCount", (_QWORD)v15) || objc_msgSend(v11, "importErrorCount"))
        {
          v12 = 1;
          goto LABEL_13;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      v12 = 0;
      if (v8)
        continue;
      break;
    }
  }
  else
  {
    v12 = 0;
  }
LABEL_13:

  if (self->_isEnabled)
    v13 = v12;
  else
    v13 = 0;

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setIsEnabled:(BOOL)a3
{
  self->_isEnabled = a3;
}

- (WLImportContext)application
{
  return self->_application;
}

- (void)setApplication:(id)a3
{
  objc_storeStrong((id *)&self->_application, a3);
}

- (WLImportContext)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (WLImportContext)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_storeStrong((id *)&self->_message, a3);
}

- (WLImportContext)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
}

- (WLImportContext)callHistory
{
  return self->_callHistory;
}

- (void)setCallHistory:(id)a3
{
  objc_storeStrong((id *)&self->_callHistory, a3);
}

- (WLImportContext)calendar
{
  return self->_calendar;
}

- (void)setCalendar:(id)a3
{
  objc_storeStrong((id *)&self->_calendar, a3);
}

- (WLImportContext)bookmark
{
  return self->_bookmark;
}

- (void)setBookmark:(id)a3
{
  objc_storeStrong((id *)&self->_bookmark, a3);
}

- (WLImportContext)file
{
  return self->_file;
}

- (void)setFile:(id)a3
{
  objc_storeStrong((id *)&self->_file, a3);
}

- (WLImportContext)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (WLImportContext)video
{
  return self->_video;
}

- (void)setVideo:(id)a3
{
  objc_storeStrong((id *)&self->_video, a3);
}

- (WLImportContext)voiceMemo
{
  return self->_voiceMemo;
}

- (void)setVoiceMemo:(id)a3
{
  objc_storeStrong((id *)&self->_voiceMemo, a3);
}

- (WLImportContext)album
{
  return self->_album;
}

- (void)setAlbum:(id)a3
{
  objc_storeStrong((id *)&self->_album, a3);
}

- (WLImportContext)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
  objc_storeStrong((id *)&self->_container, a3);
}

- (WLImportContext)accessibilitySetting
{
  return self->_accessibilitySetting;
}

- (void)setAccessibilitySetting:(id)a3
{
  objc_storeStrong((id *)&self->_accessibilitySetting, a3);
}

- (WLImportContext)displaySetting
{
  return self->_displaySetting;
}

- (void)setDisplaySetting:(id)a3
{
  objc_storeStrong((id *)&self->_displaySetting, a3);
}

- (WLImportContext)placeholder
{
  return self->_placeholder;
}

- (void)setPlaceholder:(id)a3
{
  objc_storeStrong((id *)&self->_placeholder, a3);
}

- (WLImportContext)sim
{
  return self->_sim;
}

- (void)setSim:(id)a3
{
  objc_storeStrong((id *)&self->_sim, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sim, 0);
  objc_storeStrong((id *)&self->_placeholder, 0);
  objc_storeStrong((id *)&self->_displaySetting, 0);
  objc_storeStrong((id *)&self->_accessibilitySetting, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_album, 0);
  objc_storeStrong((id *)&self->_voiceMemo, 0);
  objc_storeStrong((id *)&self->_video, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_file, 0);
  objc_storeStrong((id *)&self->_bookmark, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_callHistory, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_application, 0);
}

@end
