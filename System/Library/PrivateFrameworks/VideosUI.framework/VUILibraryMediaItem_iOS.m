@implementation VUILibraryMediaItem_iOS

+ (void)initialize
{
  if (initialize_onceToken_9 != -1)
    dispatch_once(&initialize_onceToken_9, &__block_literal_global_108);
}

- (VUILibraryMediaItem_iOS)initWithMPMediaItem:(id)a3
{
  id v5;
  VUILibraryMediaItem_iOS *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  ML3Track *ml3Track;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VUILibraryMediaItem_iOS;
  v6 = -[TVPBaseMediaItem init](&v13, sel_init);
  if (v6)
  {
    if (v5)
    {
      v6->_persistentID = objc_msgSend(v5, "persistentID");
      objc_storeStrong((id *)&v6->_mpMediaItem, a3);
      objc_msgSend(v5, "mediaLibrary");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v7, "ml3Library");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v8 = 0;
      }
      v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0D512C8]), "initWithPersistentID:inLibrary:", v6->_persistentID, v8);
      ml3Track = v6->_ml3Track;
      v6->_ml3Track = (ML3Track *)v10;

    }
    else
    {
      v9 = (void *)sLogObject_17;
      if (os_log_type_enabled((os_log_t)sLogObject_17, OS_LOG_TYPE_ERROR))
        -[VUILibraryMediaItem_iOS initWithMPMediaItem:].cold.1(v9);
    }
  }

  return v6;
}

- (TVImageLoader)imageLoader
{
  void *v2;
  void *v3;

  +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deviceMediaLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (TVImageLoader *)v3;
}

- (BOOL)isEqualToMediaItem:(id)a3
{
  VUILibraryMediaItem_iOS *v4;
  VUILibraryMediaItem_iOS *v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = (VUILibraryMediaItem_iOS *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_8;
  if (self == v4)
  {
LABEL_7:
    v7 = 1;
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_8:
    v7 = 0;
    goto LABEL_14;
  }
  v6 = -[VUILibraryMediaItem_iOS persistentID](v5, "persistentID");
  if (-[VUILibraryMediaItem_iOS persistentID](self, "persistentID")
    && v6
    && -[VUILibraryMediaItem_iOS persistentID](self, "persistentID") == v6)
  {
    goto LABEL_7;
  }
  v8 = *MEMORY[0x1E0DB1CB8];
  -[VUILibraryMediaItem_iOS mediaItemMetadataForProperty:](self, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1CB8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUILibraryMediaItem_iOS mediaItemMetadataForProperty:](v5, "mediaItemMetadataForProperty:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length") && objc_msgSend(v10, "length"))
    v7 = objc_msgSend(v9, "isEqualToString:", v10);
  else
    v7 = 0;

LABEL_14:
  return v7;
}

- (id)mediaItemURL
{
  void *v3;
  void *v4;

  -[VUILibraryMediaItem_iOS mediaItemURLInternal](self, "mediaItemURLInternal");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[VUILibraryMediaItem_iOS _localPlaybackFilePathURL](self, "_localPlaybackFilePathURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUILibraryMediaItem_iOS setMediaItemURLInternal:](self, "setMediaItemURLInternal:", v4);

  }
  return -[VUILibraryMediaItem_iOS mediaItemURLInternal](self, "mediaItemURLInternal");
}

- (BOOL)hasTrait:(id)a3
{
  id v4;
  unsigned __int8 v5;
  char v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  void *v12;
  objc_super v13;

  v4 = a3;
  if (!objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB1D98]))
  {
    if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB1DA0]) & 1) != 0
      || (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB1D88]) & 1) != 0)
    {
      v6 = 1;
      goto LABEL_12;
    }
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB1D58]))
    {
      -[VUILibraryMediaItem_iOS ml3Track](self, "ml3Track");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = (_QWORD *)MEMORY[0x1E0D50E70];
    }
    else
    {
      if (!objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB1D48]))
      {
        if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB1D68]))
        {
          -[VUILibraryMediaItem_iOS _localPlaybackFilePathURL](self, "_localPlaybackFilePathURL");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = v12 != 0;

          goto LABEL_12;
        }
        v13.receiver = self;
        v13.super_class = (Class)VUILibraryMediaItem_iOS;
        v5 = -[TVPBaseMediaItem hasTrait:](&v13, sel_hasTrait_, v4);
        goto LABEL_3;
      }
      -[VUILibraryMediaItem_iOS ml3Track](self, "ml3Track");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = (_QWORD *)MEMORY[0x1E0D50E00];
    }
    objc_msgSend(v7, "valueForProperty:", *v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v10, "BOOLValue");

    goto LABEL_12;
  }
  v5 = -[VUILibraryMediaItem_iOS _supportsBookmarks](self, "_supportsBookmarks");
LABEL_3:
  v6 = v5;
LABEL_12:

  return v6;
}

- (id)mediaItemMetadataForProperty:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  __int16 v12;
  VUILibraryMediaItem_iOS **v13;
  uint64_t v14;
  void **v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  id *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  objc_class *v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  void *v44;
  _QWORD *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  __int16 v55;
  objc_super v56;
  VUILibraryMediaItem_iOS *v57;
  __objc2_class *v58;
  VUILibraryMediaItem_iOS *v59;
  __objc2_class *v60;
  VUILibraryMediaItem_iOS *v61;
  __objc2_class *v62;
  VUILibraryMediaItem_iOS *v63;
  __objc2_class *v64;
  objc_super v65;
  VUILibraryMediaItem_iOS *v66;
  __objc2_class *v67;
  VUILibraryMediaItem_iOS *v68;
  __objc2_class *v69;

  v4 = a3;
  v5 = *MEMORY[0x1E0DB1CC8];
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB1CC8]))
  {
    -[VUILibraryMediaItem_iOS ml3Track](self, "ml3Track");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[VUILibraryMediaItem_iOS ml3Track](self, "ml3Track");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "valueForProperty:", *MEMORY[0x1E0D51168]);
      v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_46:
      v33 = v8;
LABEL_47:

      goto LABEL_48;
    }
    v68 = self;
    v69 = VUILibraryMediaItem_iOS;
    v13 = &v68;
    goto LABEL_23;
  }
  v5 = *MEMORY[0x1E0DB1B90];
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB1B90]))
  {
    -[VUILibraryMediaItem_iOS ml3Track](self, "ml3Track");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v65.receiver = self;
      v65.super_class = (Class)VUILibraryMediaItem_iOS;
      v13 = (VUILibraryMediaItem_iOS **)&v65;
      goto LABEL_23;
    }
    -[VUILibraryMediaItem_iOS ml3Track](self, "ml3Track");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "valueForProperty:", *MEMORY[0x1E0D50F30]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "unsignedIntValue");

    if ((v12 & 0x200) != 0)
    {
      v24 = (id *)MEMORY[0x1E0DB1DD8];
    }
    else if ((v12 & 0x2000) != 0)
    {
      v24 = (id *)MEMORY[0x1E0DB1DB8];
    }
    else
    {
      if ((v12 & 0x800) == 0)
      {
        v66 = self;
        v67 = VUILibraryMediaItem_iOS;
        v13 = &v66;
LABEL_23:
        objc_msgSendSuper2((objc_super *)v13, sel_mediaItemMetadataForProperty_, v5, v56.receiver, v56.super_class, v57, v58, v59, v60, v61, v62, v63, v64, v65.receiver, v65.super_class, v66, v67, v68, v69);
LABEL_24:
        v23 = (id)objc_claimAutoreleasedReturnValue();
LABEL_38:
        v33 = v23;
        goto LABEL_48;
      }
      -[VUILibraryMediaItem_iOS ml3Track](self, "ml3Track");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "valueForProperty:", *MEMORY[0x1E0D50EE0]);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "BOOLValue");

      if (v41)
        v24 = (id *)MEMORY[0x1E0DB1DD0];
      else
        v24 = (id *)MEMORY[0x1E0DB1DC0];
    }
LABEL_37:
    v23 = *v24;
    goto LABEL_38;
  }
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB1C70]))
  {
    -[VUILibraryMediaItem_iOS mediaItemMetadataForProperty:](self, "mediaItemMetadataForProperty:", v5);
    v14 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v14;
    if (v14 == *MEMORY[0x1E0DB1DC0] || v14 == *MEMORY[0x1E0DB1DD0])
    {
      v16 = (void **)MEMORY[0x1E0C92568];
    }
    else
    {
      if (v14 != *MEMORY[0x1E0DB1DD8])
      {
        if (v14 == *MEMORY[0x1E0DB1DB8])
          v25 = (void *)*MEMORY[0x1E0C92560];
        else
          v25 = 0;
        goto LABEL_45;
      }
      v16 = (void **)MEMORY[0x1E0C92578];
    }
    v25 = *v16;
LABEL_45:
    v8 = v25;
    goto LABEL_46;
  }
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB19D8]))
  {
    -[VUILibraryMediaItem_iOS mpMediaItem](self, "mpMediaItem");
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = (void *)v17;
      -[VUILibraryMediaItem_iOS imageLoader](self, "imageLoader");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        -[VUILibraryMediaItem_iOS mpMediaItem](self, "mpMediaItem");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20;
        v22 = 0;
LABEL_34:
        objc_msgSend(v20, "vui_imageLoadParamsWithImageType:", v22);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        v30 = (objc_class *)MEMORY[0x1E0DB1870];
LABEL_35:
        v31 = [v30 alloc];
        -[VUILibraryMediaItem_iOS imageLoader](self, "imageLoader");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = (void *)objc_msgSend(v31, "initWithObject:imageLoader:groupType:", v29, v32, 0);

        goto LABEL_48;
      }
    }
    goto LABEL_70;
  }
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB19D0]))
  {
    -[VUILibraryMediaItem_iOS mpMediaItem](self, "mpMediaItem");
    v26 = objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      v27 = (void *)v26;
      -[VUILibraryMediaItem_iOS imageLoader](self, "imageLoader");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28)
      {
        -[VUILibraryMediaItem_iOS mpMediaItem](self, "mpMediaItem");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20;
        v22 = 1;
        goto LABEL_34;
      }
    }
LABEL_70:
    v33 = 0;
    goto LABEL_48;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("VUIMediaItemMetadataArtworkEpisodePreviewVUIImageProxy")))
  {
    -[VUILibraryMediaItem_iOS mpMediaItem](self, "mpMediaItem");
    v34 = objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      v35 = (void *)v34;
      -[VUILibraryMediaItem_iOS imageLoader](self, "imageLoader");
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (v36)
      {
        -[VUILibraryMediaItem_iOS mpMediaItem](self, "mpMediaItem");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "vui_imageLoadParamsWithImageType:", 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        v30 = (objc_class *)MEMORY[0x1E0DC6A10];
        goto LABEL_35;
      }
    }
    goto LABEL_70;
  }
  v5 = *MEMORY[0x1E0DB1A98];
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB1A98]))
  {
    -[VUILibraryMediaItem_iOS mpMediaItem](self, "mpMediaItem");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v42)
    {
      v63 = self;
      v64 = VUILibraryMediaItem_iOS;
      v13 = &v63;
      goto LABEL_23;
    }
    -[VUILibraryMediaItem_iOS mpMediaItem](self, "mpMediaItem");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v43;
    v45 = (_QWORD *)MEMORY[0x1E0CC1DF8];
  }
  else
  {
    v5 = *MEMORY[0x1E0DB1C40];
    if (!objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB1C40]))
    {
      v5 = *MEMORY[0x1E0DB1A40];
      if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB1A40]))
      {
        -[VUILibraryMediaItem_iOS mpMediaItem](self, "mpMediaItem");
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        if (v48)
        {
          -[VUILibraryMediaItem_iOS mpMediaItem](self, "mpMediaItem");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "valueForProperty:", *MEMORY[0x1E0CC1DD8]);
          v7 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v7, "vui_stringForKey:", CFSTR("ratingLevel"));
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = v50;
          if (v50)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v50, "integerValue"));
            v33 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v33 = 0;
          }

          goto LABEL_47;
        }
        v59 = self;
        v60 = VUILibraryMediaItem_iOS;
        v13 = &v59;
        goto LABEL_23;
      }
      v5 = *MEMORY[0x1E0DB1A28];
      if (!objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB1A28]))
      {
        -[VUIBaseMediaItem mediaItemMetadataForProperty:](&v56, sel_mediaItemMetadataForProperty_, v4, self, VUILibraryMediaItem_iOS, v57, v58, v59, v60, v61, v62, v63, v64, v65.receiver, v65.super_class, v66, v67, v68, v69);
        goto LABEL_24;
      }
      -[VUILibraryMediaItem_iOS ml3Track](self, "ml3Track");
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v52)
      {
        v57 = self;
        v58 = VUILibraryMediaItem_iOS;
        v13 = &v57;
        goto LABEL_23;
      }
      -[VUILibraryMediaItem_iOS ml3Track](self, "ml3Track");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "valueForProperty:", *MEMORY[0x1E0D50F30]);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend(v54, "unsignedIntValue");

      if ((v55 & 0x200) != 0)
      {
        v24 = (id *)MEMORY[0x1E0DB1A38];
        goto LABEL_37;
      }
      if ((v55 & 0x800) != 0)
      {
        v24 = (id *)MEMORY[0x1E0DB1A30];
        goto LABEL_37;
      }
      goto LABEL_70;
    }
    -[VUILibraryMediaItem_iOS mpMediaItem](self, "mpMediaItem");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v46)
    {
      v61 = self;
      v62 = VUILibraryMediaItem_iOS;
      v13 = &v61;
      goto LABEL_23;
    }
    -[VUILibraryMediaItem_iOS mpMediaItem](self, "mpMediaItem");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v43;
    v45 = (_QWORD *)MEMORY[0x1E0CC1F40];
  }
  objc_msgSend(v43, "valueForProperty:", *v45);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
    v47 = v33;

LABEL_48:
  return v33;
}

- (void)prepareForLoadingWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  VUIMediaStartTimeInfo *v13;
  void *v14;
  VUIMediaStartTimeInfo *v15;
  void *v16;
  void (**v17)(id, uint64_t, _QWORD);

  v17 = (void (**)(id, uint64_t, _QWORD))a3;
  -[VUILibraryMediaItem_iOS ml3Track](self, "ml3Track");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForProperty:", *MEMORY[0x1E0D50C18]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "doubleValue");
    v7 = v6 / 1000.0;
    if (v6 / 1000.0 > 0.0)
    {
      -[VUILibraryMediaItem_iOS ml3Track](self, "ml3Track");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "valueForProperty:", *MEMORY[0x1E0D51080]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9 && (objc_msgSend(v9, "doubleValue"), v10 > 0.0))
      {
        v11 = (void *)MEMORY[0x1E0C99D68];
        objc_msgSend(v9, "doubleValue");
        objc_msgSend(v11, "dateWithTimeIntervalSinceReferenceDate:");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = 0;
      }
      v13 = [VUIMediaStartTimeInfo alloc];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[VUIMediaStartTimeInfo initWithStartTime:timestamp:type:source:](v13, "initWithStartTime:timestamp:type:source:", v14, v12, 0, CFSTR("Media Library"));

      -[VUIBaseMediaItem startTimeCollection](self, "startTimeCollection");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addStartTimeInfo:", v15);

    }
  }
  if (v17)
    v17[2](v17, 1, 0);

}

- (void)updateBookmarkWithSuggestedTime:(double)a3 forElapsedTime:(double)a4 duration:(double)a5 playbackOfMediaItemIsEnding:(BOOL)a6
{
  void *v8;
  void *v9;
  void *v10;
  VUIPlaybackPositionInfo *v11;

  -[VUILibraryMediaItem_iOS playbackPositionInfo](self, "playbackPositionInfo", a6, a3, a4, a5);
  v11 = (VUIPlaybackPositionInfo *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v11 = objc_alloc_init(VUIPlaybackPositionInfo);
    -[VUILibraryMediaItem_iOS _schedulePlaybackPositionInfoPersistence](self, "_schedulePlaybackPositionInfoPersistence");
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIPlaybackPositionInfo setBookmarkTime:](v11, "setBookmarkTime:", v8);

  -[VUILibraryMediaItem_iOS setPlaybackPositionInfo:](self, "setPlaybackPositionInfo:", v11);
  -[VUILibraryMediaItem_iOS mpMediaItem](self, "mpMediaItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setValue:forProperty:withCompletionBlock:", v10, *MEMORY[0x1E0CC1DB8], 0);

}

- (void)updatePlayCountForElapsedTime:(double)a3 duration:(double)a4
{
  void *v7;
  void *v8;
  uint64_t v9;
  double v10;
  void *v11;
  VUIPlaybackPositionInfo *v12;

  -[VUILibraryMediaItem_iOS playbackPositionInfo](self, "playbackPositionInfo");
  v12 = (VUIPlaybackPositionInfo *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v12 = objc_alloc_init(VUIPlaybackPositionInfo);
    -[VUILibraryMediaItem_iOS _schedulePlaybackPositionInfoPersistence](self, "_schedulePlaybackPositionInfoPersistence");
  }
  -[VUILibraryMediaItem_iOS ml3Track](self, "ml3Track");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForProperty:", *MEMORY[0x1E0D50F50]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  objc_msgSend(MEMORY[0x1E0DB1960], "playedThresholdTimeForDuration:", a4);
  if (v10 < a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9 + 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIPlaybackPositionInfo setPlayCount:](v12, "setPlayCount:", v11);

  }
  if (a3 > 5.0)
    -[VUIPlaybackPositionInfo setHasBeenPlayed:](v12, "setHasBeenPlayed:", MEMORY[0x1E0C9AAB0]);
  -[VUILibraryMediaItem_iOS setPlaybackPositionInfo:](self, "setPlaybackPositionInfo:", v12);

}

- (void)cleanUpMediaItem
{
  -[VUILibraryMediaItem_iOS setMediaItemURLInternal:](self, "setMediaItemURLInternal:", 0);
}

- (id)_localPlaybackFilePathURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  -[VUILibraryMediaItem_iOS ml3Track](self, "ml3Track");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForProperty:", *MEMORY[0x1E0D50D40]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[VUILibraryMediaItem_iOS ml3Track](self, "ml3Track");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForProperty:", *MEMORY[0x1E0D50E90]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  -[VUILibraryMediaItem_iOS ml3Track](self, "ml3Track");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForProperty:", *MEMORY[0x1E0D50EF8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  v11 = 0;
  if (v7 && (v10 & 1) == 0)
  {
    if ((unint64_t)objc_msgSend(v4, "length") < 2)
    {
      v11 = 0;
    }
    else
    {
      CPSharedResourcesDirectory();
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      if (v12)
      {
        v14 = (void *)MEMORY[0x1E0CB3940];
        v18[0] = v12;
        v18[1] = CFSTR("Media");
        v18[2] = v4;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 3);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "pathWithComponents:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v16, 0);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v11 = 0;
        }

      }
      else
      {
        v11 = 0;
      }

    }
  }

  return v11;
}

- (void)_schedulePlaybackPositionInfoPersistence
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__VUILibraryMediaItem_iOS__schedulePlaybackPositionInfoPersistence__block_invoke;
  block[3] = &unk_1E9F98DF0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (BOOL)_supportsBookmarks
{
  return !-[VUILibraryMediaItem_iOS bookmarkDisabled](self, "bookmarkDisabled");
}

- (int64_t)persistentID
{
  return self->_persistentID;
}

- (void)setPersistentID:(int64_t)a3
{
  self->_persistentID = a3;
}

- (MPMediaItem)mpMediaItem
{
  return self->_mpMediaItem;
}

- (void)setMpMediaItem:(id)a3
{
  objc_storeStrong((id *)&self->_mpMediaItem, a3);
}

- (MPMediaLibrary)mpMediaLibrary
{
  return self->_mpMediaLibrary;
}

- (BOOL)bookmarkDisabled
{
  return self->_bookmarkDisabled;
}

- (void)setBookmarkDisabled:(BOOL)a3
{
  self->_bookmarkDisabled = a3;
}

- (ML3Track)ml3Track
{
  return self->_ml3Track;
}

- (void)setMl3Track:(id)a3
{
  objc_storeStrong((id *)&self->_ml3Track, a3);
}

- (VUIPlaybackPositionInfo)playbackPositionInfo
{
  return self->_playbackPositionInfo;
}

- (void)setPlaybackPositionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_playbackPositionInfo, a3);
}

- (NSURL)mediaItemURLInternal
{
  return self->_mediaItemURLInternal;
}

- (void)setMediaItemURLInternal:(id)a3
{
  objc_storeStrong((id *)&self->_mediaItemURLInternal, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaItemURLInternal, 0);
  objc_storeStrong((id *)&self->_playbackPositionInfo, 0);
  objc_storeStrong((id *)&self->_ml3Track, 0);
  objc_storeStrong((id *)&self->_mpMediaLibrary, 0);
  objc_storeStrong((id *)&self->_mpMediaItem, 0);
}

- (void)initWithMPMediaItem:(void *)a1 .cold.1(void *a1)
{
  NSObject *v1;
  objc_class *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1D96EE000, v1, OS_LOG_TYPE_ERROR, "%@ created with nil MPMediaItem", (uint8_t *)&v4, 0xCu);

}

@end
