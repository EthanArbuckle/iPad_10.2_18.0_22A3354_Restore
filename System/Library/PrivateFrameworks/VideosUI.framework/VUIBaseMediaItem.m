@implementation VUIBaseMediaItem

- (id)mediaItemMetadataForProperty:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  objc_super v20;
  objc_super v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)VUIBaseMediaItem;
  -[TVPBaseMediaItem mediaItemMetadataForProperty:](&v21, sel_mediaItemMetadataForProperty_, v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0DB1CA0];
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB1CA0]))
  {
    if (v5)
    {
      v7 = sLogObject_15;
      if (os_log_type_enabled((os_log_t)sLogObject_15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v5;
        _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "Returning manually set start time of %@", buf, 0xCu);
      }
      goto LABEL_18;
    }
    -[VUIBaseMediaItem startTimeCollection](self, "startTimeCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "preferredStartTimeInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)sLogObject_15;
    if (os_log_type_enabled((os_log_t)sLogObject_15, OS_LOG_TYPE_DEFAULT))
    {
      v13 = v12;
      -[VUIBaseMediaItem startTimeCollection](self, "startTimeCollection");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "allStartTimeInfos");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v23 = v15;
      _os_log_impl(&dword_1D96EE000, v13, OS_LOG_TYPE_DEFAULT, "All start time infos: %@", buf, 0xCu);

    }
    v16 = sLogObject_15;
    if (os_log_type_enabled((os_log_t)sLogObject_15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v11;
      _os_log_impl(&dword_1D96EE000, v16, OS_LOG_TYPE_DEFAULT, "Preferred start time info: %@", buf, 0xCu);
    }
    if (v11)
    {
      objc_msgSend(v11, "startTime");
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
    goto LABEL_17;
  }
  if (!objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB1CA8]))
  {
LABEL_18:
    v5 = v5;
    v9 = v5;
    goto LABEL_19;
  }
  v20.receiver = self;
  v20.super_class = (Class)VUIBaseMediaItem;
  -[TVPBaseMediaItem mediaItemMetadataForProperty:](&v20, sel_mediaItemMetadataForProperty_, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    -[VUIBaseMediaItem startTimeCollection](self, "startTimeCollection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "preferredStartTimeInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v11, "type") == 1);
      v18 = objc_claimAutoreleasedReturnValue();

      v5 = (id)v18;
    }
LABEL_17:

    goto LABEL_18;
  }
  v9 = (void *)MEMORY[0x1E0C9AAA0];
LABEL_19:

  return v9;
}

void __30__VUIBaseMediaItem_initialize__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.AppleTV.playback", "VUIBaseMediaItem");
  v1 = (void *)sLogObject_15;
  sLogObject_15 = (uint64_t)v0;

}

- (VUIMediaStartTimeCollection)startTimeCollection
{
  VUIMediaStartTimeCollection *startTimeCollection;
  VUIMediaStartTimeCollection *v4;
  VUIMediaStartTimeCollection *v5;

  startTimeCollection = self->_startTimeCollection;
  if (!startTimeCollection)
  {
    v4 = objc_alloc_init(VUIMediaStartTimeCollection);
    v5 = self->_startTimeCollection;
    self->_startTimeCollection = v4;

    startTimeCollection = self->_startTimeCollection;
  }
  return startTimeCollection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startTimeCollection, 0);
}

+ (void)initialize
{
  if (initialize_onceToken_8 != -1)
    dispatch_once(&initialize_onceToken_8, &__block_literal_global_104);
}

- (void)setStartTimeCollection:(id)a3
{
  objc_storeStrong((id *)&self->_startTimeCollection, a3);
}

@end
