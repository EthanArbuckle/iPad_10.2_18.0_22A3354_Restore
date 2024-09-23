@implementation VUIStoreAuxMediaItem

- (BOOL)hasTrait:(id)a3
{
  id v4;
  char v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unsigned __int8 v9;
  void *v11;
  void *v12;
  objc_super v13;

  v4 = a3;
  if (!objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB1D50]))
  {
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB1D98]))
    {
      -[VUIStoreAuxMediaItem bookmarkID](self, "bookmarkID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "length");

      if (!v7)
      {
        -[VUIStoreAuxMediaItem videoManagedObject](self, "videoManagedObject");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
        v5 = v8 != 0;

        goto LABEL_14;
      }
LABEL_10:
      v5 = 1;
      goto LABEL_14;
    }
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB1D38]))
    {
      v9 = -[VUIStoreAuxMediaItem disableResumeMenu](self, "disableResumeMenu");
LABEL_13:
      v5 = v9;
      goto LABEL_14;
    }
    if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB1D58]) & 1) != 0)
      goto LABEL_10;
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB1D48]))
    {
      v9 = -[VUIStoreAuxMediaItem isHLS](self, "isHLS");
      goto LABEL_13;
    }
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB1D68]))
    {
      -[VUIStoreAuxMediaItem videoManagedObject](self, "videoManagedObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        -[VUIStoreAuxMediaItem videoManagedObject](self, "videoManagedObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v12, "downloadState") == 2;

      }
      else
      {
        v5 = 0;
      }
      goto LABEL_23;
    }
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB1D90]))
    {
      v5 = -[VUIStoreAuxMediaItem playbackType](self, "playbackType") == 1;
      goto LABEL_14;
    }
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB1D40]))
    {
      v9 = -[VUIStoreAuxMediaItem disableScrubbing](self, "disableScrubbing");
      goto LABEL_13;
    }
    if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB1DA8]) & 1) != 0)
      goto LABEL_10;
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB1D70]))
    {
      -[VUIStoreAuxMediaItem mediaItemMetadataForProperty:](self, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1BF8]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB1D60]))
    {
      if (-[VUIStoreAuxMediaItem isLiveContent](self, "isLiveContent"))
        goto LABEL_10;
    }
    else
    {
      if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB1D88]))
      {
        -[VUIStoreAuxMediaItem mediaItemMetadataForProperty:](self, "mediaItemMetadataForProperty:", CFSTR("VUIContentMetadataDisableSpeculativeLoading"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v11, "BOOLValue");
LABEL_23:

        goto LABEL_14;
      }
      if (!objc_msgSend(v4, "isEqualToString:", VUIMediaItemTraitIsSportingEvent))
      {
        v13.receiver = self;
        v13.super_class = (Class)VUIStoreAuxMediaItem;
        v9 = -[TVPBaseMediaItem hasTrait:](&v13, sel_hasTrait_, v4);
        goto LABEL_13;
      }
    }
    v9 = -[VUIStoreAuxMediaItem isSportingEvent](self, "isSportingEvent");
    goto LABEL_13;
  }
  v5 = -[VUIStoreAuxMediaItem playbackContext](self, "playbackContext") != 8;
LABEL_14:

  return v5;
}

- (void)setMediaItemMetadata:(id)a3 forProperty:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  objc_super v14;
  id v15;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0DB1A70]))
  {
    -[VUIStoreAuxMediaItem videoManagedObject](self, "videoManagedObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v6;
    if (objc_msgSend(v9, "count") && objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v9))
    {
      v15 = 0;
      objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v9, 0, &v15);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v15;
      if (objc_msgSend(v10, "length"))
      {
        objc_msgSend(v8, "setDownloadQOSMetricsJSONData:", v10);
        +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "sidebandMediaLibrary");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "saveChangesToManagedObjects");

      }
      else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        -[VUIStoreMediaItem_iOS setMediaItemMetadata:forProperty:].cold.1();
      }

    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)VUIStoreAuxMediaItem;
    -[TVPBaseMediaItem setMediaItemMetadata:forProperty:](&v14, sel_setMediaItemMetadata_forProperty_, v6, v7);
  }

}

- (id)mediaItemMetadataForProperty:(id)a3
{
  id v4;
  id v5;
  VUISidebandMediaEntityImageLoadParams *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  uint64_t v12;
  void *v13;
  void *v14;
  VUISidebandMediaEntityImageLoadParams *v16;
  void *v17;
  VUISidebandMediaEntityImageLoadParams *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  unint64_t v22;
  VUISidebandMediaEntityImageLoadParams *v23;
  objc_class *v24;
  VUISidebandMediaEntityImageLoadParams *v25;
  void *v26;
  VUISidebandMediaEntityImageLoadParams *v27;
  void *v28;
  uint64_t v29;
  VUISidebandMediaEntityImageLoadParams *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  _BOOL8 v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  objc_super v46;

  v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)VUIStoreAuxMediaItem;
  -[VUIBaseMediaItem mediaItemMetadataForProperty:](&v46, sel_mediaItemMetadataForProperty_, v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
    goto LABEL_30;
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB1B78]) & 1) != 0)
  {
LABEL_3:
    v5 = 0;
    goto LABEL_30;
  }
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB1B10]))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend((id)objc_opt_class(), "mediaUserAgent");
    v6 = (VUISidebandMediaEntityImageLoadParams *)objc_claimAutoreleasedReturnValue();
    -[VUIStoreAuxMediaItem mediaItemMetadataForProperty:](self, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1A50]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("User-Agent"));
    if (v8 && -[VUIStoreAuxMediaItem playbackContext](self, "playbackContext") != 8)
      objc_msgSend(v5, "setObject:forKey:", v8, CFSTR("X-Dsid"));
    objc_msgSend(v5, "setObject:forKey:", CFSTR("https://tv.apple.com"), CFSTR("Referer"));
    if (!objc_msgSend(v5, "count"))
    {

      v5 = 0;
    }
    goto LABEL_12;
  }
  if (!objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB1C70]))
  {
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB1B80]))
    {
      -[VUIStoreAuxMediaItem videoManagedObject](self, "videoManagedObject");
      v6 = (VUISidebandMediaEntityImageLoadParams *)objc_claimAutoreleasedReturnValue();
      if (v6
        && (-[VUIStoreAuxMediaItem mediaItemMetadataForProperty:](self, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1AE8]), v10 = (void *)objc_claimAutoreleasedReturnValue(), v11 = objc_msgSend(v10, "BOOLValue"), v10, (v11 & 1) == 0))
      {
        -[VUIStoreAuxMediaItem videoManagedObject](self, "videoManagedObject");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "downloadState");

        if (v22 < 3)
          v12 = v22 + 1;
        else
          v12 = 0;
      }
      else
      {
        v12 = 1;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB1A78]))
    {
      -[VUIStoreAuxMediaItem videoManagedObject](self, "videoManagedObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "downloadTaskIdentifier");
      v5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_29:

      goto LABEL_30;
    }
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB19D8]))
    {
      -[VUIStoreAuxMediaItem videoManagedObject](self, "videoManagedObject");
      v5 = (id)objc_claimAutoreleasedReturnValue();

      if (!v5)
        goto LABEL_30;
      v16 = [VUISidebandMediaEntityImageLoadParams alloc];
      -[VUIStoreAuxMediaItem videoManagedObject](self, "videoManagedObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v16;
      v19 = v17;
      v20 = 0;
      goto LABEL_41;
    }
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB19D0]))
    {
      -[VUIStoreAuxMediaItem videoManagedObject](self, "videoManagedObject");
      v5 = (id)objc_claimAutoreleasedReturnValue();

      if (!v5)
        goto LABEL_30;
      v23 = [VUISidebandMediaEntityImageLoadParams alloc];
      -[VUIStoreAuxMediaItem videoManagedObject](self, "videoManagedObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v23;
      v19 = v17;
      v20 = 1;
LABEL_41:
      v6 = -[VUISidebandMediaEntityImageLoadParams initWithVideoManagedObject:imageType:](v18, "initWithVideoManagedObject:imageType:", v19, v20);

      v24 = (objc_class *)MEMORY[0x1E0DB1870];
LABEL_49:
      v31 = [v24 alloc];
      +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "sidebandMediaLibrary");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (id)objc_msgSend(v31, "initWithObject:imageLoader:groupType:", v6, v8, 0);
LABEL_12:

LABEL_13:
LABEL_14:

      goto LABEL_30;
    }
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("VUIMediaItemMetadataArtworkEpisodePreviewVUIImageProxy")))
    {
      -[VUIStoreAuxMediaItem videoManagedObject](self, "videoManagedObject");
      v5 = (id)objc_claimAutoreleasedReturnValue();

      if (!v5)
        goto LABEL_30;
      v25 = [VUISidebandMediaEntityImageLoadParams alloc];
      -[VUIStoreAuxMediaItem videoManagedObject](self, "videoManagedObject");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v25;
      v28 = v26;
      v29 = 1;
      goto LABEL_48;
    }
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("VUIMediaItemMetadataPostPlayVUIImageProxy")))
    {
      -[VUIStoreAuxMediaItem videoManagedObject](self, "videoManagedObject");
      v5 = (id)objc_claimAutoreleasedReturnValue();

      if (!v5)
        goto LABEL_30;
      v30 = [VUISidebandMediaEntityImageLoadParams alloc];
      -[VUIStoreAuxMediaItem videoManagedObject](self, "videoManagedObject");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v30;
      v28 = v26;
      v29 = 2;
LABEL_48:
      v6 = -[VUISidebandMediaEntityImageLoadParams initWithVideoManagedObject:imageType:](v27, "initWithVideoManagedObject:imageType:", v28, v29);

      v24 = (objc_class *)MEMORY[0x1E0DC6A10];
      goto LABEL_49;
    }
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB19B8]))
    {
      v6 = (VUISidebandMediaEntityImageLoadParams *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      -[VUIStoreAuxMediaItem mediaItemMetadataForProperty:](self, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1B88]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "count"))
      {
        -[VUISidebandMediaEntityImageLoadParams addEntriesFromDictionary:](v6, "addEntriesFromDictionary:", v7);
        -[VUIStoreAuxMediaItem mediaItemMetadataForProperty:](self, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB19F0]);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v32, "length"))
          -[VUISidebandMediaEntityImageLoadParams setObject:forKey:](v6, "setObject:forKey:", v32, *MEMORY[0x1E0C8AD48]);

      }
      if (-[VUISidebandMediaEntityImageLoadParams count](v6, "count"))
        v5 = (id)-[VUISidebandMediaEntityImageLoadParams copy](v6, "copy");
      else
        v5 = 0;
      goto LABEL_13;
    }
    if (!objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB1A70]))
      goto LABEL_3;
    -[VUIStoreAuxMediaItem videoManagedObject](self, "videoManagedObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "downloadQOSMetricsJSONData");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v33, "length"))
    {
      v5 = 0;
LABEL_70:

      goto LABEL_29;
    }
    v45 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v33, 0, &v45);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v45;
    if (v34)
    {
      objc_opt_class();
      v36 = v34;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v5 = v34;
LABEL_69:

        goto LABEL_70;
      }
      v37 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
      if (v37)
        -[VUIStoreMediaItem_iOS mediaItemMetadataForProperty:].cold.2(v37, v38, v39, v40, v41, v42, v43, v44);
    }
    else
    {
      v36 = 0;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[VUIStoreMediaItem_iOS mediaItemMetadataForProperty:].cold.1();
    }
    v5 = 0;
    goto LABEL_69;
  }
  if (-[VUIStoreAuxMediaItem isAudioOnly](self, "isAudioOnly"))
  {
    v9 = (void *)*MEMORY[0x1E0C92570];
  }
  else
  {
    v9 = (void *)*MEMORY[0x1E0C92568];
    -[VUIStoreAuxMediaItem mediaItemMetadataForProperty:](self, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1B90]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DB1DC0]) & 1) == 0
      && objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DB1DD8]))
    {
      v9 = (void *)*MEMORY[0x1E0C92578];
    }

  }
  v5 = v9;
LABEL_30:

  return v5;
}

- (void)setSendsMescalHeaderToPlaybackKeyServer:(BOOL)a3
{
  self->_sendsMescalHeaderToPlaybackKeyServer = a3;
}

- (void)setSendsLocationToPlaybackKeyServerWhenOptedIn:(BOOL)a3
{
  self->_sendsLocationToPlaybackKeyServerWhenOptedIn = a3;
}

- (void)setPlaybackContext:(unint64_t)a3
{
  self->_playbackContext = a3;
}

- (void)setIsiTunesPurchasedOrRentedContent:(BOOL)a3
{
  self->_isiTunesPurchasedOrRentedContent = a3;
}

- (void)setIsSportingEvent:(BOOL)a3
{
  self->_isSportingEvent = a3;
}

- (void)setIsLiveContent:(BOOL)a3
{
  self->_isLiveContent = a3;
}

- (void)setIsFamilySharingContent:(BOOL)a3
{
  self->_isFamilySharingContent = a3;
}

- (void)setFpsKeyServerURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setFpsCertificateURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setFpsAdditionalServerParams:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setDisableScrubbing:(BOOL)a3
{
  self->_disableScrubbing = a3;
}

- (void)setDisableResumeMenu:(BOOL)a3
{
  self->_disableResumeMenu = a3;
}

- (void)setBookmarkID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (VUIStoreAuxMediaItem)initWithURL:(id)a3
{
  id v4;
  VUIStoreAuxMediaItem *v5;
  uint64_t v6;
  NSURL *url;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  VUIStoreAuxMediaItem *v14;
  id v15;
  id v16;
  _QWORD v18[4];
  VUIStoreAuxMediaItem *v19;
  id v20;
  id v21;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)VUIStoreAuxMediaItem;
  v5 = -[TVPBaseMediaItem init](&v22, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    url = v5->_url;
    v5->_url = (NSURL *)v6;

    objc_msgSend(v4, "pathExtension");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("m3u8")) & 1) != 0
      || (objc_msgSend(v8, "isEqualToString:", CFSTR("m3u")) & 1) != 0)
    {
      v9 = 1;
    }
    else
    {
      v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("movpkg"));
    }
    v5->_isHLS = v9;
    objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "ams_activeiTunesAccount");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "ams_DSID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "ams_storefront");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __36__VUIStoreAuxMediaItem_initWithURL___block_invoke;
    v18[3] = &unk_1E9F99840;
    v14 = v5;
    v19 = v14;
    v20 = v12;
    v21 = v13;
    v15 = v13;
    v16 = v12;
    -[TVPBaseMediaItem performMediaItemMetadataTransactionWithBlock:](v14, "performMediaItemMetadataTransactionWithBlock:", v18);
    -[VUIStoreAuxMediaItem resetReportingEventCollection](v14, "resetReportingEventCollection");

  }
  return v5;
}

- (void)resetReportingEventCollection
{
  uint64_t v3;
  id v4;

  v4 = objc_alloc_init(MEMORY[0x1E0DB1948]);
  objc_msgSend(v4, "addStartEventWithName:", *MEMORY[0x1E0DB1F10]);
  objc_msgSend(v4, "addStartEventWithName:", *MEMORY[0x1E0DB1F28]);
  if (-[VUIStoreAuxMediaItem isHLS](self, "isHLS"))
    v3 = 2;
  else
    v3 = 1;
  objc_msgSend(v4, "setVideoType:", v3);
  -[VUIStoreAuxMediaItem setMediaItemMetadata:forProperty:](self, "setMediaItemMetadata:forProperty:", v4, *MEMORY[0x1E0DB1D28]);

}

- (BOOL)isHLS
{
  return self->_isHLS;
}

uint64_t __36__VUIStoreAuxMediaItem_initWithURL___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setMediaItemMetadata:forProperty:", *(_QWORD *)(a1 + 40), *MEMORY[0x1E0DB1A50]);
  return objc_msgSend(*(id *)(a1 + 32), "setMediaItemMetadata:forProperty:", *(_QWORD *)(a1 + 48), *MEMORY[0x1E0DB1CB0]);
}

void __52__VUIStoreAuxMediaItem__populateUTSMetadataIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    v4 = sLogObject_23;
    if (os_log_type_enabled((os_log_t)sLogObject_23, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138412546;
      v7 = v5;
      v8 = 2112;
      v9 = v3;
      _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "Received UTS metadata for %@ - %@", (uint8_t *)&v6, 0x16u);
    }
  }

}

void __34__VUIStoreAuxMediaItem_initialize__block_invoke()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;

  v0 = os_log_create("com.apple.AppleTV.playback", "VUIStoreAuxMediaItem");
  v1 = (void *)sLogObject_23;
  sLogObject_23 = (uint64_t)v0;

  v2 = os_log_create("com.apple.AppleTV.playback", "SecureKeyDelivery");
  v3 = (void *)sSecureKeyDeliveryLogObject_0;
  sSecureKeyDeliveryLogObject_0 = (uint64_t)v2;

}

- (VUIVideoManagedObject)videoManagedObject
{
  return self->_videoManagedObject;
}

- (NSURL)url
{
  return self->_url;
}

- (VUIStoreFPSKeyLoader)storeFPSKeyLoader
{
  return self->_storeFPSKeyLoader;
}

- (void)setPlaybackType:(int64_t)a3
{
  self->_playbackType = a3;
}

- (void)setFpsKeyError:(id)a3
{
  objc_storeStrong((id *)&self->_fpsKeyError, a3);
}

- (void)prepareForLoadingWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  unsigned int v10;
  const __CFString *v11;
  uint64_t v12;
  NSObject *v13;
  __CFString *v14;
  NSObject *v15;
  const char *v16;
  BOOL v17;
  char v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  __CFString *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  __CFString *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  VUIBookmarkKey *v49;
  void *v50;
  _BOOL4 v51;
  VUIBookmarkKey *v52;
  void *v53;
  VUIMutableBookmark *v54;
  double v55;
  VUIMediaStartTimeInfo *v56;
  void *v57;
  void *v58;
  void *v59;
  VUIMediaStartTimeInfo *v60;
  void *v61;
  void *v62;
  BOOL v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  _QWORD v73[4];
  void (**v74)(id, uint64_t, _QWORD);
  id v75;
  void *v76;
  uint8_t buf[4];
  const __CFString *v78;
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  -[VUIStoreAuxMediaItem setFpsKeyError:](self, "setFpsKeyError:", 0);
  -[VUIStoreAuxMediaItem storeFPSKeyLoader](self, "storeFPSKeyLoader");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllEntriesFromKeyIdentifierPenaltyBox");

  -[VUIStoreAuxMediaItem videoManagedObject](self, "videoManagedObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "downloadState");
  -[VUIStoreAuxMediaItem mediaItemMetadataForProperty:](self, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1AE8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  v10 = ((unint64_t)(v7 - 3) < 0xFFFFFFFFFFFFFFFELL) & ~-[VUIStoreAuxMediaItem isForStartingDownload](self, "isForStartingDownload");
  if (v10)
    v11 = CFSTR("Streaming");
  else
    v11 = CFSTR("Downloading or Downloaded");
  if (v10)
    v12 = 1;
  else
    v12 = 2;
  if ((v10 & 1) != 0 || !v9)
    goto LABEL_18;
  v13 = sLogObject_23;
  if (os_log_type_enabled((os_log_t)sLogObject_23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D96EE000, v13, OS_LOG_TYPE_DEFAULT, "Force streaming is set; configuring for streaming",
      buf,
      2u);
  }
  -[VUIStoreAuxMediaItem streamingOverrideURLForDownload](self, "streamingOverrideURLForDownload");
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = sLogObject_23;
    if (os_log_type_enabled((os_log_t)sLogObject_23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v78 = v14;
      v16 = "Using streaming override URL: %@";
LABEL_16:
      _os_log_impl(&dword_1D96EE000, v15, OS_LOG_TYPE_DEFAULT, v16, buf, 0xCu);
    }
  }
  else
  {
    objc_msgSend(v6, "playbackURL");
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v15 = sLogObject_23;
    if (os_log_type_enabled((os_log_t)sLogObject_23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v78 = v14;
      v16 = "Using download's original URL: %@";
      goto LABEL_16;
    }
  }
  -[VUIStoreAuxMediaItem setUrl:](self, "setUrl:", v14);

  v11 = CFSTR("Streaming");
  v12 = 1;
LABEL_18:
  if (v6)
    v17 = v7 == 2;
  else
    v17 = 0;
  if (v17)
    v18 = v9;
  else
    v18 = 1;
  if ((v18 & 1) == 0)
  {
    -[VUIStoreAuxMediaItem mediaItemMetadataForProperty:](self, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1D28]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setIsDownloaded:", 1);

    v20 = objc_alloc_init(MEMORY[0x1E0CB3620]);
    -[VUIStoreAuxMediaItem url](self, "url");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "path");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22 || (objc_msgSend(v20, "fileExistsAtPath:", v22) & 1) == 0)
    {
      v23 = sLogObject_23;
      if (os_log_type_enabled((os_log_t)sLogObject_23, OS_LOG_TYPE_ERROR))
        -[VUIStoreAuxMediaItem prepareForLoadingWithCompletion:].cold.1(v23, v24, v25, v26, v27, v28, v29, v30);
      +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "sidebandMediaLibrary");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "removeDownloadedMediaForVideoManagedObject:markAsDeleted:invalidateImmediately:", v6, 0, 1);

    }
  }
  -[VUIStoreAuxMediaItem mediaItemMetadataForProperty:](self, "mediaItemMetadataForProperty:", CFSTR("VUIContentMetadataGroupActivityDay"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v33, "length"))
  {
    -[VUIStoreAuxMediaItem url](self, "url");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v34;
    if (v34)
    {
      if ((objc_msgSend(v34, "isFileURL") & 1) == 0)
      {
        objc_msgSend(v35, "vui_URLByAddingQueryParamWithName:value:", CFSTR("groupActivityDay"), v33);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIStoreAuxMediaItem setUrl:](self, "setUrl:", v36);

        v37 = (void *)sLogObject_23;
        if (os_log_type_enabled((os_log_t)sLogObject_23, OS_LOG_TYPE_DEFAULT))
        {
          v38 = v37;
          -[VUIStoreAuxMediaItem url](self, "url");
          v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v78 = v39;
          _os_log_impl(&dword_1D96EE000, v38, OS_LOG_TYPE_DEFAULT, "Added groupActivityDay param to playback URL: %@", buf, 0xCu);

        }
      }
    }

  }
  if (-[VUIStoreAuxMediaItem ignoreStartOverParam](self, "ignoreStartOverParam"))
  {
    -[VUIStoreAuxMediaItem url](self, "url");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "vui_URLByRemovingQueryParamWithName:", CFSTR("startOver"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    -[VUIStoreAuxMediaItem setUrl:](self, "setUrl:", v41);
    v42 = (void *)sLogObject_23;
    if (os_log_type_enabled((os_log_t)sLogObject_23, OS_LOG_TYPE_DEFAULT))
    {
      v43 = v42;
      -[VUIStoreAuxMediaItem url](self, "url");
      v44 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v78 = v44;
      _os_log_impl(&dword_1D96EE000, v43, OS_LOG_TYPE_DEFAULT, "Removed startOver param from playback URL: %@", buf, 0xCu);

    }
  }
  v45 = sLogObject_23;
  if (os_log_type_enabled((os_log_t)sLogObject_23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v78 = v11;
    _os_log_impl(&dword_1D96EE000, v45, OS_LOG_TYPE_DEFAULT, "Setting playback type to %@", buf, 0xCu);
  }
  -[VUIStoreAuxMediaItem setPlaybackType:](self, "setPlaybackType:", v12);
  -[VUIStoreAuxMediaItem mediaItemMetadataForProperty:](self, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1C28]);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (v46)
  {
    v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DB1968]), "initWithName:", CFSTR("Scrub AVPlayerItem loader"));
    objc_msgSend(v47, "setUpdatesMediaRemoteInfoAutomatically:", 0);
    objc_msgSend(v47, "setSendsPlayerReports:", 0);
    objc_msgSend(v47, "setUpdatesBookmarks:", 0);
    objc_msgSend(v47, "setCreatesPlayerItemButDoesNotEnqueue:", 1);
    objc_msgSend(v47, "setCurrentMediaItem:", v46);
    objc_msgSend(v47, "setIFramePrefetchMaxSize:", 400.0, 400.0);
    -[VUIStoreAuxMediaItem setScrubPlayer:](self, "setScrubPlayer:", v47);
    objc_msgSend(v47, "pause");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "addObserver:selector:name:object:", self, sel__scrubPlayerItemDidLoad_, *MEMORY[0x1E0DB1FA0], v47);

  }
  -[VUIStoreAuxMediaItem bookmarkID](self, "bookmarkID");
  v49 = (VUIBookmarkKey *)objc_claimAutoreleasedReturnValue();
  if (-[VUIBookmarkKey length](v49, "length"))
  {
    -[VUIStoreAuxMediaItem bookmark](self, "bookmark");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v50 == 0;

    if (!v51)
      goto LABEL_51;
    v52 = [VUIBookmarkKey alloc];
    -[VUIStoreAuxMediaItem bookmarkID](self, "bookmarkID");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = -[VUIBookmarkKey initWithIdentifier:keyType:](v52, "initWithIdentifier:keyType:", v53, 2);

    v54 = -[VUIBookmark initWithKey:]([VUIMutableBookmark alloc], "initWithKey:", v49);
    -[VUIBookmark bookmarkTime](v54, "bookmarkTime");
    if (v55 != 0.0)
    {
      v56 = [VUIMediaStartTimeInfo alloc];
      v57 = (void *)MEMORY[0x1E0CB37E8];
      -[VUIBookmark bookmarkTime](v54, "bookmarkTime");
      objc_msgSend(v57, "numberWithDouble:");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIBookmark bookmarkTimestamp](v54, "bookmarkTimestamp");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = -[VUIMediaStartTimeInfo initWithStartTime:timestamp:type:source:](v56, "initWithStartTime:timestamp:type:source:", v58, v59, 0, CFSTR("Store Bookkeeper"));

      -[VUIBaseMediaItem startTimeCollection](self, "startTimeCollection");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "addStartTimeInfo:", v60);

    }
    -[VUIStoreAuxMediaItem setBookmark:](self, "setBookmark:", v54);

  }
LABEL_51:
  -[VUIStoreAuxMediaItem _populateUTSMetadataIfNeeded](self, "_populateUTSMetadataIfNeeded");
  -[VUIStoreAuxMediaItem bookmark](self, "bookmark");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = v62 == 0;

  if (v63)
  {
    if (v4)
      v4[2](v4, 1, 0);
  }
  else
  {
    +[VideosExtrasBookmarkController sharedInstance](VideosExtrasBookmarkController, "sharedInstance");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "setMinimumBookmarkUpdateInterval:", 0.0);

    v65 = *MEMORY[0x1E0DB1D28];
    -[VUIStoreAuxMediaItem mediaItemMetadataForProperty:](self, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1D28]);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "addStartEventWithName:", *MEMORY[0x1E0DB1E58]);

    -[VUIStoreAuxMediaItem mediaItemMetadataForProperty:](self, "mediaItemMetadataForProperty:", v65);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "addSingleShotEventWithName:value:", *MEMORY[0x1E0DB1E60], MEMORY[0x1E0C9AAB0]);

    objc_initWeak((id *)buf, self);
    +[VideosExtrasBookmarkController sharedInstance](VideosExtrasBookmarkController, "sharedInstance");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIStoreAuxMediaItem bookmark](self, "bookmark");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "key");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "identifier");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = v71;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v76, 1);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73[0] = MEMORY[0x1E0C809B0];
    v73[1] = 3221225472;
    v73[2] = __56__VUIStoreAuxMediaItem_prepareForLoadingWithCompletion___block_invoke;
    v73[3] = &unk_1E9FA4F38;
    objc_copyWeak(&v75, (id *)buf);
    v74 = v4;
    objc_msgSend(v68, "pullBookmarksForIdentifiers:completionBlock:", v72, v73);

    objc_destroyWeak(&v75);
    objc_destroyWeak((id *)buf);
  }

}

- (unint64_t)playbackContext
{
  return self->_playbackContext;
}

- (void)mediaItem:(id)a3 didChangeFromPlaybackState:(id)a4 toPlaybackState:(id)a5 updatedRate:(double)a6 player:(id)a7
{
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;

  v13 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0DB1958], "stopped");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = v13;
  if (v10 == v13)
    goto LABEL_4;
  objc_msgSend(MEMORY[0x1E0DB1958], "stopped");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12 == v9)
  {
    -[VUIStoreAuxMediaItem storeFPSKeyLoader](self, "storeFPSKeyLoader");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sendStreamingStopRequestIfNecessary");
LABEL_4:

  }
}

- (BOOL)isSportingEvent
{
  return self->_isSportingEvent;
}

- (BOOL)isForStartingDownload
{
  return self->_isForStartingDownload;
}

- (BOOL)isEqualToMediaItem:(id)a3
{
  VUIStoreAuxMediaItem *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (VUIStoreAuxMediaItem *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[VUIStoreAuxMediaItem url](self, "url");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIStoreAuxMediaItem url](v4, "url");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (BOOL)isAudioOnly
{
  return self->_isAudioOnly;
}

- (BOOL)ignoreStartOverParam
{
  return self->_ignoreStartOverParam;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  v3 = sLogObject_23;
  if (os_log_type_enabled((os_log_t)sLogObject_23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_DEFAULT, "VUIStoreAuxMediaItem deallocated", buf, 2u);
  }
  v4.receiver = self;
  v4.super_class = (Class)VUIStoreAuxMediaItem;
  -[VUIStoreAuxMediaItem dealloc](&v4, sel_dealloc);
}

- (VUIMutableBookmark)bookmark
{
  return self->_bookmark;
}

- (NSString)bookmarkID
{
  return self->_bookmarkID;
}

- (void)_populateUTSMetadataIfNeeded
{
  void *v3;
  void *v4;
  _BOOL8 v5;
  _QWORD v6[4];
  id v7;

  -[VUIStoreAuxMediaItem mediaItemMetadataForProperty:](self, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1A08]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIStoreAuxMediaItem mediaItemMetadataForProperty:](self, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1B90]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = -[VUIStoreAuxMediaItem isSportingEvent](self, "isSportingEvent");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __52__VUIStoreAuxMediaItem__populateUTSMetadataIfNeeded__block_invoke;
    v6[3] = &unk_1E9F9E150;
    v7 = v3;
    +[VUIJSMetadataInterface getMediaItemMetadataForCanonicalId:entityType:isSportingEvent:completion:](VUIJSMetadataInterface, "getMediaItemMetadataForCanonicalId:entityType:isSportingEvent:completion:", v7, v4, v5, v6);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoManagedObject, 0);
  objc_storeStrong((id *)&self->_parentReportingToken, 0);
  objc_storeStrong((id *)&self->_fpsKeyError, 0);
  objc_storeStrong((id *)&self->_storeFPSKeyLoader, 0);
  objc_storeStrong((id *)&self->_scrubPlayer, 0);
  objc_storeStrong((id *)&self->_bookmark, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_bookmarkID, 0);
  objc_storeStrong((id *)&self->_fpsAdditionalServerParams, 0);
  objc_storeStrong((id *)&self->_fpsKeyServerURL, 0);
  objc_storeStrong((id *)&self->_fpsCertificateURL, 0);
  objc_storeStrong((id *)&self->_streamingOverrideURLForDownload, 0);
}

+ (NSString)mediaUserAgent
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CFDCA8];
  objc_msgSend(MEMORY[0x1E0CFDBD0], "currentProcess");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userAgentForProcessInfo:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

+ (void)initialize
{
  if (initialize_onceToken_11 != -1)
    dispatch_once(&initialize_onceToken_11, &__block_literal_global_159);
}

- (VUIStoreAuxMediaItem)initWithVideoManagedObject:(id)a3 isForStartingDownload:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  _BOOL4 v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  _BOOL4 v23;
  const char *v24;
  NSObject *v25;
  VUIStoreAuxMediaItem *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  VUIMediaStartTimeInfo *v40;
  void *v41;
  VUIMediaStartTimeInfo *v42;
  void *v43;
  void *v44;
  VUIStoreAuxMediaItem *v45;
  id v46;
  id v47;
  VUIStoreAuxMediaItem *v48;
  VUIStoreAuxMediaItem *v49;
  void *v51;
  void *v52;
  _QWORD v53[4];
  VUIStoreAuxMediaItem *v54;
  id v55;
  id v56;
  VUIStoreAuxMediaItem *v57;
  id v58;
  uint8_t buf[16];

  v4 = a4;
  v6 = a3;
  if (!v6)
  {
    v7 = sLogObject_23;
    if (os_log_type_enabled((os_log_t)sLogObject_23, OS_LOG_TYPE_ERROR))
      -[VUIStoreAuxMediaItem initWithVideoManagedObject:isForStartingDownload:].cold.2(v7, v8, v9, v10, v11, v12, v13, v14);
  }
  v15 = objc_msgSend(v6, "downloadState");
  if (!v4)
  {
    v16 = v15;
    if (v15 != 1)
    {
      v17 = sLogObject_23;
      v18 = os_log_type_enabled((os_log_t)sLogObject_23, OS_LOG_TYPE_DEFAULT);
      if (v16 == 2)
      {
        if (v18)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D96EE000, v17, OS_LOG_TYPE_DEFAULT, "Media item is fully downloaded.  Using file path URL", buf, 2u);
        }
        objc_msgSend(v6, "localPlaybackURL");
        v19 = objc_claimAutoreleasedReturnValue();
        goto LABEL_21;
      }
      if (v18)
      {
        *(_WORD *)buf = 0;
        v24 = "Media item is not being used for downloading.  Using streaming URL";
        v25 = v17;
LABEL_19:
        _os_log_impl(&dword_1D96EE000, v25, OS_LOG_TYPE_DEFAULT, v24, buf, 2u);
        goto LABEL_20;
      }
      goto LABEL_20;
    }
  }
  v20 = sLogObject_23;
  if (os_log_type_enabled((os_log_t)sLogObject_23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D96EE000, v20, OS_LOG_TYPE_DEFAULT, "Media item will start downloading or is already being downloaded", buf, 2u);
  }
  objc_msgSend(v6, "downloadURL");
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = sLogObject_23;
  v23 = os_log_type_enabled((os_log_t)sLogObject_23, OS_LOG_TYPE_DEFAULT);
  if (!v21)
  {
    if (v23)
    {
      *(_WORD *)buf = 0;
      v24 = "Using streaming URL for download since download URL is not available";
      v25 = v22;
      goto LABEL_19;
    }
LABEL_20:
    objc_msgSend(v6, "playbackURL");
    v19 = objc_claimAutoreleasedReturnValue();
LABEL_21:
    v21 = v19;
    goto LABEL_22;
  }
  if (v23)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D96EE000, v22, OS_LOG_TYPE_DEFAULT, "Using download URL", buf, 2u);
  }
LABEL_22:
  v26 = -[VUIStoreAuxMediaItem initWithURL:](self, "initWithURL:", v21);
  -[VUIStoreAuxMediaItem setIsForStartingDownload:](v26, "setIsForStartingDownload:", v4);
  -[VUIStoreAuxMediaItem setVideoManagedObject:](v26, "setVideoManagedObject:", v6);
  objc_msgSend(v6, "fpsCertificateURL");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIStoreAuxMediaItem setFpsCertificateURL:](v26, "setFpsCertificateURL:", v27);

  objc_msgSend(v6, "fpsKeyServerURL");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIStoreAuxMediaItem setFpsKeyServerURL:](v26, "setFpsKeyServerURL:", v28);

  objc_msgSend(v6, "additionalFPSRequestParams");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIStoreAuxMediaItem setFpsAdditionalServerParams:](v26, "setFpsAdditionalServerParams:", v29);

  -[VUIStoreAuxMediaItem setIsSportingEvent:](v26, "setIsSportingEvent:", objc_msgSend(v6, "isSportingEvent"));
  objc_msgSend(v6, "vpafMetricsJSONData");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v30;
  v52 = (void *)v21;
  if (!objc_msgSend(v30, "length"))
  {
    v33 = 0;
    goto LABEL_31;
  }
  v58 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v30, 0, &v58);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v58;
  if (!v31)
  {
    if (os_log_type_enabled((os_log_t)sLogObject_23, OS_LOG_TYPE_ERROR))
      -[VUIStoreAuxMediaItem initWithVideoManagedObject:isForStartingDownload:].cold.1();
    goto LABEL_29;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_29:
    v33 = 0;
    goto LABEL_30;
  }
  v33 = v31;
LABEL_30:

LABEL_31:
  objc_msgSend(v6, "bookmarkTime");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bookmarkTimeStamp");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mainContentRelativeBookmarkTime");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mainContentRelativeBookmarkTimeStamp");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34)
  {
    v38 = v37;
    v39 = v35;
    v40 = -[VUIMediaStartTimeInfo initWithStartTime:timestamp:type:source:]([VUIMediaStartTimeInfo alloc], "initWithStartTime:timestamp:type:source:", v34, v35, 0, CFSTR("Sideband Library"));
    -[VUIBaseMediaItem startTimeCollection](v26, "startTimeCollection");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "addStartTimeInfo:", v40);

    v35 = v39;
    v37 = v38;
  }
  if (v36)
  {
    v42 = -[VUIMediaStartTimeInfo initWithStartTime:timestamp:type:source:]([VUIMediaStartTimeInfo alloc], "initWithStartTime:timestamp:type:source:", v36, v37, 1, CFSTR("Sideband Library"));
    -[VUIBaseMediaItem startTimeCollection](v26, "startTimeCollection");
    v43 = v35;
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "addStartTimeInfo:", v42);

    v35 = v43;
  }
  v53[0] = MEMORY[0x1E0C809B0];
  v53[1] = 3221225472;
  v53[2] = __73__VUIStoreAuxMediaItem_initWithVideoManagedObject_isForStartingDownload___block_invoke;
  v53[3] = &unk_1E9F99DB0;
  v54 = v26;
  v55 = v6;
  v56 = v33;
  v45 = v54;
  v57 = v45;
  v46 = v6;
  v47 = v33;
  -[TVPBaseMediaItem performMediaItemMetadataTransactionWithBlock:](v45, "performMediaItemMetadataTransactionWithBlock:", v53);
  v48 = v57;
  v49 = v45;

  return v49;
}

void __73__VUIStoreAuxMediaItem_initWithVideoManagedObject_isForStartingDownload___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t i;
  void *v67;
  void *v68;
  int v69;
  uint64_t v70;
  void *v71;
  id v72;
  __CFString *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  __CFString *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  _BYTE v99[128];
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "canonicalID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setMediaItemMetadata:forProperty:", v3, *MEMORY[0x1E0DB1A08]);

  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMediaItemMetadata:forProperty:", v5, *MEMORY[0x1E0DB1CC8]);

  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "externalID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMediaItemMetadata:forProperty:", v7, *MEMORY[0x1E0DB1AB0]);

  v8 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "adamID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMediaItemMetadata:forProperty:", v9, *MEMORY[0x1E0DB1CB8]);

  v10 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "rtcServiceIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMediaItemMetadata:forProperty:", v11, *MEMORY[0x1E0DB1C50]);

  v12 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "brandID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setMediaItemMetadata:forProperty:", v13, *MEMORY[0x1E0DB19F0]);

  v14 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "brandName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setMediaItemMetadata:forProperty:", v15, *MEMORY[0x1E0DB19F8]);

  v16 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "contentRatingRank");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setMediaItemMetadata:forProperty:", v17, *MEMORY[0x1E0DB1A40]);

  v18 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "dsid");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setMediaItemMetadata:forProperty:", v19, *MEMORY[0x1E0DB1A50]);

  v20 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "referenceID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setMediaItemMetadata:forProperty:", v21, *MEMORY[0x1E0DB1BE8]);

  v22 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "genreName");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setMediaItemMetadata:forProperty:", v23, *MEMORY[0x1E0DB1AF8]);

  v24 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "releaseDate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setMediaItemMetadata:forProperty:", v25, *MEMORY[0x1E0DB1A58]);

  v26 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "isAdultContent"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setMediaItemMetadata:forProperty:", v27, *MEMORY[0x1E0DB1B48]);

  objc_msgSend(*(id *)(a1 + 32), "setMediaItemMetadata:forProperty:", *(_QWORD *)(a1 + 48), *MEMORY[0x1E0DB1CE8]);
  v28 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "mediaMetrics");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setMediaItemMetadata:forProperty:", v29, *MEMORY[0x1E0DB1B88]);

  v30 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "playbackModes");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setMediaItemMetadata:forProperty:", v31, CFSTR("VUIContentMetadataPlaybackModes"));

  v32 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "requiredAgeForPlayback");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setMediaItemMetadata:forProperty:", v33, *MEMORY[0x1E0DB1C10]);

  v34 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "frequencyOfAgeConfirmation");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setMediaItemMetadata:forProperty:", v35, *MEMORY[0x1E0DB1AF0]);

  v36 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "expirationDate");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setMediaItemMetadata:forProperty:", v37, CFSTR("VUIContentMetadataDownloadExpirationDate"));

  v38 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "availabilityEndDate");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setMediaItemMetadata:forProperty:", v39, CFSTR("VUIContentMetadataAvailabilityEndDate"));

  v40 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "allowsManualRenewal"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setMediaItemMetadata:forProperty:", v41, CFSTR("VUIContentMetadataDownloadAllowsManualRenewal"));

  v42 = (void *)MEMORY[0x1E0CB37E8];
  v43 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "offlineKeyRenewalPolicy");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "numberWithInt:", objc_msgSend(v44, "integerValue") == 1);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setMediaItemMetadata:forProperty:", v45, CFSTR("VUIContentMetadataDownloadRenewsKeysAutomatically"));

  objc_msgSend(*(id *)(a1 + 32), "setMediaItemMetadata:forProperty:", *(_QWORD *)(a1 + 40), CFSTR("VUIContentMetadataDownloadVideoManagedObject"));
  v46 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "shareURL");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setMediaItemMetadata:forProperty:", v47, *MEMORY[0x1E0DB1B58]);

  v48 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "rentalID");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setMediaItemMetadata:forProperty:", v49, *MEMORY[0x1E0DB1BF8]);

  v50 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "buyParams");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setMediaItemMetadata:forProperty:", v51, *MEMORY[0x1E0DB1A00]);

  v52 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "rentalPlaybackStartDate");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setMediaItemMetadata:forProperty:", v53, *MEMORY[0x1E0DB1C08]);

  v54 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "downloadedPlaybackMode");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setMediaItemMetadata:forProperty:", v55, CFSTR("VUIContentMetadataDownloadedPlaybackMode"));

  v56 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "playablePassThrough");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setMediaItemMetadata:forProperty:", v57, CFSTR("VUIMediaItemMetadataPlayablePassThrough"));

  objc_msgSend(*(id *)(a1 + 40), "programID");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v58)
  {
    objc_msgSend(*(id *)(a1 + 40), "downloadURL");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    if (v59)
    {
      v94 = v59;
      v93 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", v59, 0);
      objc_msgSend(v93, "queryItems");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = (void *)objc_msgSend(v60, "mutableCopy");

      v97 = 0u;
      v98 = 0u;
      v95 = 0u;
      v96 = 0u;
      v62 = v61;
      v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v95, v99, 16);
      if (v63)
      {
        v64 = v63;
        v58 = 0;
        v65 = *(_QWORD *)v96;
        do
        {
          for (i = 0; i != v64; ++i)
          {
            if (*(_QWORD *)v96 != v65)
              objc_enumerationMutation(v62);
            v67 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * i);
            objc_msgSend(v67, "name");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            v69 = objc_msgSend(v68, "isEqualToString:", CFSTR("id"));

            if (v69)
            {
              objc_msgSend(v67, "value");
              v70 = objc_claimAutoreleasedReturnValue();

              v58 = (void *)v70;
            }
          }
          v64 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v95, v99, 16);
        }
        while (v64);
      }
      else
      {
        v58 = 0;
      }

      v59 = v94;
    }
    else
    {
      v58 = 0;
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "setMediaItemMetadata:forProperty:", v58, *MEMORY[0x1E0DB1B08]);
  objc_msgSend(*(id *)(a1 + 40), "contentRatingDomain");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v72 = *(id *)(a1 + 40);
    if (!objc_msgSend(v71, "length"))
    {
      v73 = CFSTR("Show");

      v71 = v73;
    }
    objc_msgSend(*(id *)(a1 + 32), "setMediaItemMetadata:forProperty:", *MEMORY[0x1E0DB1DD8], *MEMORY[0x1E0DB1B90]);
    v74 = *(void **)(a1 + 32);
    objc_msgSend(v72, "series");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "title");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "setMediaItemMetadata:forProperty:", v76, *MEMORY[0x1E0DB1C48]);

    v77 = *(void **)(a1 + 32);
    objc_msgSend(v72, "series");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "canonicalID");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "setMediaItemMetadata:forProperty:", v79, *MEMORY[0x1E0DB1C60]);

    v80 = *(void **)(a1 + 32);
    objc_msgSend(v72, "season");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "canonicalID");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "setMediaItemMetadata:forProperty:", v82, *MEMORY[0x1E0DB1C38]);

    v83 = *(void **)(a1 + 32);
    objc_msgSend(v72, "season");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "seasonNumber");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "setMediaItemMetadata:forProperty:", v85, *MEMORY[0x1E0DB1C40]);

    v86 = *(void **)(a1 + 32);
    objc_msgSend(v72, "episodeNumberInSeason");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "setMediaItemMetadata:forProperty:", v87, *MEMORY[0x1E0DB1A98]);

    v88 = *(void **)(a1 + 32);
    objc_msgSend(v72, "episodeNumberInSeries");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "setMediaItemMetadata:forProperty:", v89, *MEMORY[0x1E0DB1A90]);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (!objc_msgSend(v71, "length"))
      {
        v90 = CFSTR("Movie");

        v71 = v90;
      }
      objc_msgSend(*(id *)(a1 + 32), "setMediaItemMetadata:forProperty:", *MEMORY[0x1E0DB1DC0], *MEMORY[0x1E0DB1B90]);
    }
  }
  v91 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 56), "_tvpRatingDomainFromUTSRatingDomain:", v71);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "setMediaItemMetadata:forProperty:", v92, *MEMORY[0x1E0DB1A28]);

}

- (id)_tvpRatingDomainFromUTSRatingDomain:(id)a3
{
  id v4;
  id v5;

  v4 = (id)*MEMORY[0x1E0DB1A30];
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("Show")))
  {
    v5 = (id)*MEMORY[0x1E0DB1A38];

    v4 = v5;
  }
  return v4;
}

void __56__VUIStoreAuxMediaItem_prepareForLoadingWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  id v7;

  v4 = a3;
  objc_copyWeak(&v7, (id *)(a1 + 40));
  v5 = v4;
  v6 = *(id *)(a1 + 32);
  TVPPerformBlockOnMainThreadIfNeeded();

  objc_destroyWeak(&v7);
}

void __56__VUIStoreAuxMediaItem_prepareForLoadingWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(WeakRetained, "bookmark");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "doubleValue");
    objc_msgSend(v3, "setBookmarkTime:");

  }
  objc_msgSend(WeakRetained, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1D28]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEndEventWithName:", *MEMORY[0x1E0DB1E58]);

  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v5 + 16))(v5, 1, 0);

}

- (id)replacementErrorForPlaybackError:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (-[VUIStoreAuxMediaItem isiTunesPurchasedOrRentedContent](self, "isiTunesPurchasedOrRentedContent"))
    -[VUIStoreAuxMediaItem _replacementErrorForITunesPlaybackError:](self, "_replacementErrorForITunesPlaybackError:", v4);
  else
    -[VUIStoreAuxMediaItem _replacementErrorForPlaybackError:](self, "_replacementErrorForPlaybackError:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_replacementErrorForPlaybackError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;

  v4 = a3;
  -[VUIStoreAuxMediaItem fpsKeyError](self, "fpsKeyError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v4;
  if (v5)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v7, "setObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0DB1D20]);
    -[VUIStoreAuxMediaItem fpsKeyError](self, "fpsKeyError");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, *MEMORY[0x1E0CB3388]);

    -[VUIStoreAuxMediaItem fpsKeyError](self, "fpsKeyError");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "code");

    if (v10 == -345015)
    {
      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringForKey:", CFSTR("ContentNotAuthorizedErrorDescription"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:", v12, *MEMORY[0x1E0CB2D80]);

      v13 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v14 = 811;
    }
    else
    {
      -[VUIStoreAuxMediaItem fpsKeyError](self, "fpsKeyError");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "code");

      if (v16 == -345014)
      {
        -[VUIStoreAuxMediaItem mediaItemMetadataForProperty:](self, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB19F8]);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIStoreAuxMediaItem mediaItemMetadataForProperty:](self, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1B90]);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[VUIStoreAuxMediaItem hasTrait:](self, "hasTrait:", *MEMORY[0x1E0DB1D60]))
        {
          v19 = (void *)MEMORY[0x1E0CB3940];
          +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v20;
          v22 = CFSTR("TOO_MANY_DEVICES_STREAMING_VIDEO_ERROR_FORMAT");
        }
        else
        {
          v27 = objc_msgSend(v18, "isEqualToString:", *MEMORY[0x1E0DB1DD8]);
          v19 = (void *)MEMORY[0x1E0CB3940];
          +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v20;
          if (v27)
            v22 = CFSTR("TOO_MANY_DEVICES_STREAMING_EPISODE_ERROR_FORMAT");
          else
            v22 = CFSTR("TOO_MANY_DEVICES_STREAMING_MOVIE_ERROR_FORMAT");
        }
        objc_msgSend(v20, "localizedStringForKey:", v22);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v30, CFSTR("%@"), 0, v17);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        v32 = (void *)MEMORY[0x1E0CB3940];
        +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "localizedStringForKey:", CFSTR("TOO_MANY_DEVICES_STREAMING_TITLE_FORMAT"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v34, CFSTR("%@"), 0, v17);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "setObject:forKey:", v31, *MEMORY[0x1E0CB2D80]);
        objc_msgSend(v7, "setObject:forKey:", v35, *MEMORY[0x1E0CB2D50]);
        v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TVPlaybackErrorDomain"), 810, v7);

        goto LABEL_17;
      }
      -[VUIStoreAuxMediaItem fpsKeyError](self, "fpsKeyError");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "code");

      if (v24 == -345023)
      {
        +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "localizedStringForKey:", CFSTR("VIDEO_UNAVAILABLE_IN_THIS_REGION_ERROR"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKey:", v26, *MEMORY[0x1E0CB2D80]);

        v13 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v14 = 828;
      }
      else
      {
        -[VUIStoreAuxMediaItem fpsKeyError](self, "fpsKeyError");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "code");

        v13 = objc_alloc(MEMORY[0x1E0CB35C8]);
        if (v29 == -345028)
          v14 = 827;
        else
          v14 = 820;
      }
    }
    v6 = (void *)objc_msgSend(v13, "initWithDomain:code:userInfo:", CFSTR("TVPlaybackErrorDomain"), v14, v7);
    v17 = v4;
LABEL_17:

  }
  return v6;
}

- (id)_replacementErrorForITunesPlaybackError:(id)a3
{
  __CFString *v4;
  void *v5;
  __CFString *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  __CFString *v16;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;

  v4 = (__CFString *)a3;
  -[VUIStoreAuxMediaItem fpsKeyError](self, "fpsKeyError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v4;
  if (v5)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v7, "setObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0DB1D20]);
    -[VUIStoreAuxMediaItem fpsKeyError](self, "fpsKeyError");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, *MEMORY[0x1E0CB3388]);

    -[VUIStoreAuxMediaItem fpsKeyError](self, "fpsKeyError");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "code") == -345015)
    {

    }
    else
    {
      -[VUIStoreAuxMediaItem fpsKeyError](self, "fpsKeyError");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "code");

      if (v11 != -345017)
      {
        -[VUIStoreAuxMediaItem fpsKeyError](self, "fpsKeyError");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "code");

        if (v19 == -345014)
        {
          -[VUIStoreAuxMediaItem mediaItemMetadataForProperty:](self, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1CC8]);
          v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (!-[__CFString length](v16, "length"))
          {

            v16 = &stru_1E9FF3598;
          }
          v20 = (void *)MEMORY[0x1E0CB3940];
          +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "localizedStringForKey:", CFSTR("TOO_MANY_STREAMS_FORMAT_PURCHASE"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "stringWithValidatedFormat:validFormatSpecifiers:error:", v22, CFSTR("%@"), 0, v16);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v7, "setObject:forKey:", v23, *MEMORY[0x1E0CB2D80]);
          v24 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v25 = 810;
        }
        else
        {
          -[VUIStoreAuxMediaItem fpsKeyError](self, "fpsKeyError");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "code");

          if (v27 != -345016)
          {
            -[VUIStoreAuxMediaItem fpsKeyError](self, "fpsKeyError");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend(v31, "code");

            v14 = objc_alloc(MEMORY[0x1E0CB35C8]);
            if (v32 == -345028)
              v15 = 827;
            else
              v15 = 820;
            goto LABEL_6;
          }
          -[VUIStoreAuxMediaItem mediaItemMetadataForProperty:](self, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1CC8]);
          v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (!-[__CFString length](v16, "length"))
          {

            v16 = &stru_1E9FF3598;
          }
          v28 = (void *)MEMORY[0x1E0CB3940];
          +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "localizedStringForKey:", CFSTR("TOO_MANY_STREAMS_FORMAT"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "stringWithValidatedFormat:validFormatSpecifiers:error:", v30, CFSTR("%@"), 0, v16);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v7, "setObject:forKey:", v23, *MEMORY[0x1E0CB2D80]);
          v24 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v25 = 812;
        }
        v6 = (__CFString *)objc_msgSend(v24, "initWithDomain:code:userInfo:", CFSTR("TVPlaybackErrorDomain"), v25, v7);

        goto LABEL_7;
      }
    }
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:", CFSTR("ContentNotAuthorizedErrorDescription"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v13, *MEMORY[0x1E0CB2D80]);

    v14 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v15 = 811;
LABEL_6:
    v6 = (__CFString *)objc_msgSend(v14, "initWithDomain:code:userInfo:", CFSTR("TVPlaybackErrorDomain"), v15, v7);
    v16 = v4;
LABEL_7:

  }
  return v6;
}

- (void)updateBookmarkWithSuggestedTime:(double)a3 forElapsedTime:(double)a4 duration:(double)a5 playbackOfMediaItemIsEnding:(BOOL)a6
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  BOOL v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;

  -[VUIStoreAuxMediaItem bookmark](self, "bookmark", a6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[VUIStoreAuxMediaItem bookmark](self, "bookmark");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBookmarkTime:", a3);

    -[VUIStoreAuxMediaItem bookmark](self, "bookmark");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBookmarkTimestamp:", v13);

    objc_msgSend(MEMORY[0x1E0DB1960], "playedThresholdTimeForDuration:", a5);
    v15 = v14;
    if (-[VUIStoreAuxMediaItem isFamilySharingContent](self, "isFamilySharingContent"))
    {
      v16 = objc_alloc(MEMORY[0x1E0CC2528]);
      -[VUIStoreAuxMediaItem bookmarkID](self, "bookmarkID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = (id)objc_msgSend(v16, "initWithUbiquitousIdentifier:", v17);

      objc_msgSend(v37, "setBookmarkTime:", a3);
      objc_msgSend(v37, "setBookmarkTimestamp:", CFAbsoluteTimeGetCurrent());
      objc_msgSend(MEMORY[0x1E0CC2520], "sharedUbiquitousPlaybackPositionController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "persistPlaybackPositionMetadataEntity:isCheckpoint:completion:", v37, 0, 0);
    }
    else
    {
      +[VideosExtrasBookmarkController sharedInstance](VideosExtrasBookmarkController, "sharedInstance");
      v37 = (id)objc_claimAutoreleasedReturnValue();
      -[VUIStoreAuxMediaItem bookmark](self, "bookmark");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "key");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "identifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "pushBookmarkForIdentifier:bookmarkTime:playedToNominalLength:", v25, v15 <= a4, a4);

    }
LABEL_17:

    return;
  }
  -[VUIStoreAuxMediaItem videoManagedObject](self, "videoManagedObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v37 = (id)objc_claimAutoreleasedReturnValue();
    -[VUIStoreAuxMediaItem mediaItemMetadataForProperty:](self, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1AD8]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIStoreAuxMediaItem mediaItemMetadataForProperty:](self, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1AD0]);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v20;
    if (v18)
      v22 = v20 == 0;
    else
      v22 = 1;
    if (v22)
    {
      v23 = 0;
    }
    else
    {
      objc_msgSend(v18, "doubleValue");
      v27 = fmax(a3 - v26, 0.0);
      objc_msgSend(v21, "doubleValue");
      if (v27 >= v28)
      {
        objc_msgSend(v21, "doubleValue");
        v27 = v29;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v27);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[VUIStoreAuxMediaItem videoManagedObject](self, "videoManagedObject");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setBookmarkTime:", v31);

    -[VUIStoreAuxMediaItem videoManagedObject](self, "videoManagedObject");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setBookmarkTimeStamp:", v37);

    -[VUIStoreAuxMediaItem videoManagedObject](self, "videoManagedObject");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setMainContentRelativeBookmarkTime:", v23);

    -[VUIStoreAuxMediaItem videoManagedObject](self, "videoManagedObject");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setMainContentRelativeBookmarkTimeStamp:", v37);

    +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "sidebandMediaLibrary");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "saveChangesToManagedObjects");

    goto LABEL_17;
  }
}

- (void)cleanUpMediaItem
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  -[VUIStoreAuxMediaItem storeFPSKeyLoader](self, "storeFPSKeyLoader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendStreamingStopRequestIfNecessary");

  -[VUIStoreAuxMediaItem setPlaybackType:](self, "setPlaybackType:", 0);
  -[VUIStoreAuxMediaItem setMediaItemMetadata:forProperty:](self, "setMediaItemMetadata:forProperty:", 0, *MEMORY[0x1E0DB1D28]);
  -[VUIStoreAuxMediaItem setBookmark:](self, "setBookmark:", 0);
  -[VUIStoreAuxMediaItem scrubPlayer](self, "scrubPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x1E0DB1FA0];
    -[VUIStoreAuxMediaItem scrubPlayer](self, "scrubPlayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:name:object:", self, v6, v7);

    -[VUIStoreAuxMediaItem scrubPlayer](self, "scrubPlayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "invalidate");

    -[VUIStoreAuxMediaItem setScrubPlayer:](self, "setScrubPlayer:", 0);
  }
  -[VUIStoreAuxMediaItem setParentReportingToken:](self, "setParentReportingToken:", 0);
}

- (void)mediaItem:(id)a3 errorDidOccur:(id)a4 player:(id)a5
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(v6, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C8A2F8]))
  {
LABEL_16:

    goto LABEL_17;
  }
  v8 = objc_msgSend(v6, "code");

  if (v8 == -11800)
  {
    objc_msgSend(v6, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0CB3388]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "code") == -42803 || objc_msgSend(v7, "code") == -42799)
    {
      -[VUIStoreAuxMediaItem videoManagedObject](self, "videoManagedObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        v11 = sLogObject_23;
        if (os_log_type_enabled((os_log_t)sLogObject_23, OS_LOG_TYPE_ERROR))
          -[VUIStoreAuxMediaItem mediaItem:errorDidOccur:player:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);
        v32 = 0u;
        v33 = 0u;
        v30 = 0u;
        v31 = 0u;
        -[VUIStoreAuxMediaItem videoManagedObject](self, "videoManagedObject", 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "fpsKeyInfo");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v31;
          do
          {
            for (i = 0; i != v22; ++i)
            {
              if (*(_QWORD *)v31 != v23)
                objc_enumerationMutation(v20);
              v25 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
              objc_msgSend(v25, "setIsInvalid:", 1);
              objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "setRenewalDate:", v26);

            }
            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
          }
          while (v22);
        }

        +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "sidebandMediaLibrary");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "saveChangesToManagedObjects");

        +[VUIOfflineKeyRenewalManager sharedInstance](VUIOfflineKeyRenewalManager, "sharedInstance");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "updateKeyRenewalAndExpiration");

      }
    }
    goto LABEL_16;
  }
LABEL_17:

}

- (void)loadFairPlayStreamingKeyRequests:(id)a3
{
  -[VUIStoreAuxMediaItem loadFairPlayStreamingKeyRequests:completion:](self, "loadFairPlayStreamingKeyRequests:completion:", a3, 0);
}

- (void)loadFairPlayStreamingKeyRequests:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  VUIStoreFPSKeyLoader *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  id v34;
  void (**v35)(_QWORD);
  id v36;
  _QWORD v37[5];
  void (**v38)(_QWORD);
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t v47[128];
  uint8_t buf[4];
  void *v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v34 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v36 = v6;
  if (-[VUIStoreAuxMediaItem playbackType](self, "playbackType") == 2)
  {
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v44 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          if (objc_msgSend(v13, "type", v34))
          {
            if (objc_msgSend(v13, "type") == 2)
            {
              -[VUIStoreAuxMediaItem _offlineKeyDataForKeyRequest:](self, "_offlineKeyDataForKeyRequest:", v13);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = sSecureKeyDeliveryLogObject_0;
              if (v14)
              {
                if (os_log_type_enabled((os_log_t)sSecureKeyDeliveryLogObject_0, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v49 = v13;
                  _os_log_impl(&dword_1D96EE000, v15, OS_LOG_TYPE_DEFAULT, "Using existing offline key data for request %@", buf, 0xCu);
                }
                objc_msgSend(v13, "setKeyResponseData:", v14);
                objc_msgSend(v13, "finish");
              }
              else
              {
                if (os_log_type_enabled((os_log_t)sSecureKeyDeliveryLogObject_0, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v49 = v13;
                  _os_log_error_impl(&dword_1D96EE000, v15, OS_LOG_TYPE_ERROR, "Offline key data does not exist for request %@", buf, 0xCu);
                }
                objc_msgSend(v7, "addObject:", v13);
              }

            }
            else
            {
              objc_msgSend(v7, "addObject:", v13);
            }
          }
          else
          {
            objc_msgSend(v13, "finishByRequestingOfflineKeysIfPossible");
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
      }
      while (v10);
    }

    v6 = v36;
  }
  else
  {
    objc_msgSend(v7, "addObjectsFromArray:", v6);
  }
  if (objc_msgSend(v7, "count", v34))
  {
    -[VUIStoreAuxMediaItem storeFPSKeyLoader](self, "storeFPSKeyLoader");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      -[VUIStoreAuxMediaItem fpsCertificateURL](self, "fpsCertificateURL");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIStoreAuxMediaItem fpsKeyServerURL](self, "fpsKeyServerURL");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[VUIStoreFPSKeyLoader initWithCertificateURL:keyServerURL:]([VUIStoreFPSKeyLoader alloc], "initWithCertificateURL:keyServerURL:", v17, v18);
      -[VUIStoreFPSKeyLoader setSendsMescalHeader:](v19, "setSendsMescalHeader:", -[VUIStoreAuxMediaItem sendsMescalHeaderToPlaybackKeyServer](self, "sendsMescalHeaderToPlaybackKeyServer"));
      -[VUIStoreFPSKeyLoader setSendsLocationWhenOptedIn:](v19, "setSendsLocationWhenOptedIn:", -[VUIStoreAuxMediaItem sendsLocationToPlaybackKeyServerWhenOptedIn](self, "sendsLocationToPlaybackKeyServerWhenOptedIn"));
      if (-[VUIStoreAuxMediaItem hasTrait:](self, "hasTrait:", *MEMORY[0x1E0DB1D70]))
      {
        -[VUIStoreAuxMediaItem mediaItemMetadataForProperty:](self, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1BF8]);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIStoreFPSKeyLoader setRentalID:](v19, "setRentalID:", v20);
        -[VUIStoreFPSKeyLoader setDidSkipRentalCheckout:](v19, "setDidSkipRentalCheckout:", 1);

      }
      -[VUIStoreAuxMediaItem mediaItemMetadataForProperty:](self, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1D28]);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIStoreFPSKeyLoader setEventCollection:](v19, "setEventCollection:", v21);

      -[VUIStoreFPSKeyLoader setDelegate:](v19, "setDelegate:", self);
      -[VUIStoreAuxMediaItem setStoreFPSKeyLoader:](self, "setStoreFPSKeyLoader:", v19);

    }
    -[VUIStoreAuxMediaItem fpsAdditionalServerParams](self, "fpsAdditionalServerParams");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v23 = v7;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v40;
      v27 = *MEMORY[0x1E0DB1CB8];
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v40 != v26)
            objc_enumerationMutation(v23);
          v29 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * j);
          objc_msgSend(v29, "setAdditionalRequestParams:", v22);
          -[VUIStoreAuxMediaItem mediaItemMetadataForProperty:](self, "mediaItemMetadataForProperty:", v27);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setAdamID:", v30);

        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
      }
      while (v25);
    }

    v31 = sLogObject_23;
    if (os_log_type_enabled((os_log_t)sLogObject_23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v31, OS_LOG_TYPE_DEFAULT, "Keeping media item alive until key response(s) are received", buf, 2u);
    }
    -[VUIStoreAuxMediaItem storeFPSKeyLoader](self, "storeFPSKeyLoader");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __68__VUIStoreAuxMediaItem_loadFairPlayStreamingKeyRequests_completion___block_invoke;
    v37[3] = &unk_1E9F99D58;
    v37[4] = self;
    v33 = v35;
    v38 = v35;
    objc_msgSend(v32, "loadFairPlayStreamingKeyRequests:completion:", v23, v37);

    v6 = v36;
  }
  else
  {
    v33 = v35;
    if (v35)
      v35[2](v35);
  }

}

uint64_t __68__VUIStoreAuxMediaItem_loadFairPlayStreamingKeyRequests_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t result;
  uint8_t v6[16];

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "storeFPSKeyLoader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_keepKeyLoaderAlive:", v3);

  v4 = sLogObject_23;
  if (os_log_type_enabled((os_log_t)sLogObject_23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "Received response for key request(s)", v6, 2u);
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)updateOfflineKeyWithIdentifier:(id)a3 updatedOfflineKeyData:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
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
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = sLogObject_23;
  if (os_log_type_enabled((os_log_t)sLogObject_23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v36 = v6;
    _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, "Offline key data was updated for video with playback expiration policy.  Key identifier is %@", buf, 0xCu);
  }
  -[VUIStoreAuxMediaItem videoManagedObject](self, "videoManagedObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6 && v9)
  {
    v11 = objc_msgSend(v7, "length");

    if (v11)
    {
      +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "sidebandMediaLibrary");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIStoreAuxMediaItem videoManagedObject](self, "videoManagedObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "fpsKeyInfoForVideo:keyURI:createIfNeeded:wasCreated:", v14, v6, 0, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v15;
      objc_msgSend(v15, "playbackDuration");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v7;
      if (v17)
      {
        v18 = v17;
        objc_msgSend(v17, "doubleValue");
        v19 = v16;
        objc_msgSend(v16, "dateByAddingTimeInterval:");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v18 = 0;
        v19 = v16;
        v20 = 0;
      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIStoreAuxMediaItem videoManagedObject](self, "videoManagedObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "postNotificationName:object:", CFSTR("VUIVideoManagedObjectPlaybackExpirationWillChangeNotification"), v23);

      v24 = (void *)sLogObject_23;
      if (os_log_type_enabled((os_log_t)sLogObject_23, OS_LOG_TYPE_DEFAULT))
      {
        v25 = v24;
        objc_msgSend(v18, "doubleValue");
        *(_DWORD *)buf = 138412802;
        v36 = v19;
        v37 = 2112;
        v38 = v20;
        v39 = 2048;
        v40 = v26;
        _os_log_impl(&dword_1D96EE000, v25, OS_LOG_TYPE_DEFAULT, "Updating playback start date to %@, expiration date to %@ based on playback duration %f", buf, 0x20u);

      }
      v7 = v34;
      if (v20)
        objc_msgSend(v33, "setExpirationDate:", v20);
      objc_msgSend(v33, "setPlaybackExpirationStartDate:", v19);
      objc_msgSend(v33, "setKeyData:", v34);
      +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "sidebandMediaLibrary");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "saveChangesToManagedObjects");

      +[VUIOfflineKeyRenewalManager sharedInstance](VUIOfflineKeyRenewalManager, "sharedInstance");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "updateKeyRenewalAndExpiration");

      if (_os_feature_enabled_impl())
      {
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIStoreAuxMediaItem videoManagedObject](self, "videoManagedObject");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "objectID");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "postNotificationName:object:", CFSTR("VUIVideoManagedObjectPlaybackExpirationDidChangeNotification"), v32);

      }
      goto LABEL_19;
    }
  }
  else
  {

  }
  if (os_log_type_enabled((os_log_t)sLogObject_23, OS_LOG_TYPE_ERROR))
    -[VUIStoreAuxMediaItem updateOfflineKeyWithIdentifier:updatedOfflineKeyData:].cold.1();
LABEL_19:

}

- (void)storeFPSKeyLoader:(id)a3 willFailWithError:(id)a4 forKeyRequest:(id)a5
{
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[VUIStoreAuxMediaItem fpsKeyError](self, "fpsKeyError");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[VUIStoreAuxMediaItem setFpsKeyError:](self, "setFpsKeyError:", v6);
    if (TVPErrorIsFatalSKDError())
    {
      if (objc_msgSend(v6, "code") != -345015)
      {
        v8 = v6;
        objc_msgSend(v8, "domain");
        v9 = (id)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0DB1FB0]))
        {
          v10 = objc_msgSend(v8, "code");

          if (v10 != -345018)
          {
LABEL_8:
            v14 = *MEMORY[0x1E0DB1D18];
            v22[0] = *MEMORY[0x1E0DB1D20];
            v22[1] = v14;
            v23[0] = MEMORY[0x1E0C9AAB0];
            v23[1] = v8;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "postNotificationName:object:userInfo:", *MEMORY[0x1E0DB1D10], self, v15);

            goto LABEL_9;
          }
          v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          objc_msgSend(v9, "setObject:forKey:", v8, *MEMORY[0x1E0CB3388]);
          +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "localizedStringForKey:", CFSTR("SignInToWatchThisVideoErrorDescription"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKey:", v12, *MEMORY[0x1E0CB2D80]);

          v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TVPlaybackErrorDomain"), 813, v9);
          -[VUIStoreAuxMediaItem setFpsKeyError:](self, "setFpsKeyError:", 0);
          v8 = (id)v13;
        }

        goto LABEL_8;
      }
    }
  }
LABEL_9:
  if (-[VUIStoreAuxMediaItem playbackType](self, "playbackType") == 2)
  {
    v17 = *MEMORY[0x1E0DB1D18];
    v20[0] = *MEMORY[0x1E0DB1D20];
    v20[1] = v17;
    v21[0] = MEMORY[0x1E0C9AAB0];
    v21[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "postNotificationName:object:userInfo:", *MEMORY[0x1E0DB1D10], self, v18);

  }
}

- (void)storeFPSKeyLoader:(id)a3 didLoadOfflineKeyData:(id)a4 forKeyRequest:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  objc_msgSend(v8, "keyIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIStoreAuxMediaItem videoManagedObject](self, "videoManagedObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10 || !v9)
  {
LABEL_10:

    goto LABEL_11;
  }
  v11 = objc_msgSend(v7, "length");

  if (v11)
  {
    v12 = sLogObject_23;
    if (os_log_type_enabled((os_log_t)sLogObject_23, OS_LOG_TYPE_DEFAULT))
    {
      v26 = 138412290;
      v27 = v8;
      _os_log_impl(&dword_1D96EE000, v12, OS_LOG_TYPE_DEFAULT, "Saving offline key data to database: %@", (uint8_t *)&v26, 0xCu);
    }
    +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sidebandMediaLibrary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIStoreAuxMediaItem videoManagedObject](self, "videoManagedObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "fpsKeyInfoForVideo:keyURI:createIfNeeded:wasCreated:", v15, v9, 1, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[VUIStoreAuxMediaItem videoManagedObject](self, "videoManagedObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "populateFromKeyRequest:video:", v8, v16);

    +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "sidebandMediaLibrary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "saveChangesToManagedObjects");

    +[VUIOfflineKeyRenewalManager sharedInstance](VUIOfflineKeyRenewalManager, "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "updateKeyRenewalAndExpiration");

    -[VUIStoreAuxMediaItem videoManagedObject](self, "videoManagedObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "downloadState");

    if (!v21)
    {
      v22 = sLogObject_23;
      if (os_log_type_enabled((os_log_t)sLogObject_23, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v26) = 0;
        _os_log_impl(&dword_1D96EE000, v22, OS_LOG_TYPE_DEFAULT, "Offline keys received for an item that is no longer downloading or downloaded.  Invalidating keys.", (uint8_t *)&v26, 2u);
      }
      +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "sidebandMediaLibrary");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIStoreAuxMediaItem videoManagedObject](self, "videoManagedObject");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "removeDownloadedMediaForVideoManagedObject:markAsDeleted:invalidateImmediately:", v25, 0, 1);

    }
    goto LABEL_10;
  }
LABEL_11:

}

- (void)_scrubPlayerItemDidLoad:(id)a3
{
  void *v4;
  id v5;

  -[VUIStoreAuxMediaItem scrubPlayer](self, "scrubPlayer", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unqueuedPlayerItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[VUIStoreAuxMediaItem setMediaItemMetadata:forProperty:](self, "setMediaItemMetadata:forProperty:", v5, *MEMORY[0x1E0DB1C30]);
}

- (id)_offlineKeyDataForKeyRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  if (-[VUIStoreAuxMediaItem ignoreExistingOfflineKeyData](self, "ignoreExistingOfflineKeyData"))
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v4, "keyIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIStoreAuxMediaItem videoManagedObject](self, "videoManagedObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = 0;
    if (v7 && v6)
    {
      +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "sidebandMediaLibrary");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIStoreAuxMediaItem videoManagedObject](self, "videoManagedObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "fpsKeyInfoForVideo:keyURI:createIfNeeded:wasCreated:", v10, v6, 0, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "keyData");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v5;
}

- (NSURL)streamingOverrideURLForDownload
{
  return self->_streamingOverrideURLForDownload;
}

- (void)setStreamingOverrideURLForDownload:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSURL)fpsCertificateURL
{
  return self->_fpsCertificateURL;
}

- (NSURL)fpsKeyServerURL
{
  return self->_fpsKeyServerURL;
}

- (NSDictionary)fpsAdditionalServerParams
{
  return self->_fpsAdditionalServerParams;
}

- (void)setIsAudioOnly:(BOOL)a3
{
  self->_isAudioOnly = a3;
}

- (BOOL)disableResumeMenu
{
  return self->_disableResumeMenu;
}

- (BOOL)disableScrubbing
{
  return self->_disableScrubbing;
}

- (BOOL)isiTunesPurchasedOrRentedContent
{
  return self->_isiTunesPurchasedOrRentedContent;
}

- (BOOL)ignoreExistingOfflineKeyData
{
  return self->_ignoreExistingOfflineKeyData;
}

- (void)setIgnoreExistingOfflineKeyData:(BOOL)a3
{
  self->_ignoreExistingOfflineKeyData = a3;
}

- (BOOL)isFamilySharingContent
{
  return self->_isFamilySharingContent;
}

- (BOOL)isLiveContent
{
  return self->_isLiveContent;
}

- (BOOL)sendsLocationToPlaybackKeyServerWhenOptedIn
{
  return self->_sendsLocationToPlaybackKeyServerWhenOptedIn;
}

- (BOOL)sendsMescalHeaderToPlaybackKeyServer
{
  return self->_sendsMescalHeaderToPlaybackKeyServer;
}

- (void)setIgnoreStartOverParam:(BOOL)a3
{
  self->_ignoreStartOverParam = a3;
}

- (void)setUrl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void)setBookmark:(id)a3
{
  objc_storeStrong((id *)&self->_bookmark, a3);
}

- (TVPPlayer)scrubPlayer
{
  return self->_scrubPlayer;
}

- (void)setScrubPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_scrubPlayer, a3);
}

- (void)setStoreFPSKeyLoader:(id)a3
{
  objc_storeStrong((id *)&self->_storeFPSKeyLoader, a3);
}

- (NSError)fpsKeyError
{
  return self->_fpsKeyError;
}

- (NSObject)parentReportingToken
{
  return self->_parentReportingToken;
}

- (void)setParentReportingToken:(id)a3
{
  objc_storeStrong((id *)&self->_parentReportingToken, a3);
}

- (int64_t)playbackType
{
  return self->_playbackType;
}

- (void)setIsHLS:(BOOL)a3
{
  self->_isHLS = a3;
}

- (void)setVideoManagedObject:(id)a3
{
  objc_storeStrong((id *)&self->_videoManagedObject, a3);
}

- (void)setIsForStartingDownload:(BOOL)a3
{
  self->_isForStartingDownload = a3;
}

- (void)initWithVideoManagedObject:isForStartingDownload:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_14();
  OUTLINED_FUNCTION_1_10(&dword_1D96EE000, v0, v1, "Unable to deserialize vpafMetrics: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_9();
}

- (void)initWithVideoManagedObject:(uint64_t)a3 isForStartingDownload:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, a1, a3, "Unable to use nil videosManagedObject", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_14();
}

- (void)prepareForLoadingWithCompletion:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, a1, a3, "Resetting managed object download state since download is missing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_14();
}

- (void)mediaItem:(uint64_t)a3 errorDidOccur:(uint64_t)a4 player:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, a1, a3, "Offline playback keys are invalid.  Setting key renewal date to distant past to force key refresh in order to get new keys", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_14();
}

- (void)updateOfflineKeyWithIdentifier:updatedOfflineKeyData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_14();
  OUTLINED_FUNCTION_1_10(&dword_1D96EE000, v0, v1, "Unable to save offline key data for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_9();
}

@end
