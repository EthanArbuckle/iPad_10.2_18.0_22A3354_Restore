@implementation VUIStoreMediaItem_iOS

+ (void)initialize
{
  if (initialize_onceToken_7 != -1)
    dispatch_once(&initialize_onceToken_7, &__block_literal_global_96);
}

- (VUIStoreMediaItem_iOS)initWithAdamID:(int64_t)a3 videoManagedObject:(id)a4 isForStartingDownload:(BOOL)a5
{
  _BOOL8 v5;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  VUIStoreMediaItem_iOS *v13;

  v5 = a5;
  v8 = (void *)MEMORY[0x1E0CC23F0];
  v9 = (void *)MEMORY[0x1E0CB37E8];
  v10 = a4;
  objc_msgSend(v9, "numberWithLongLong:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "vui_mediaItemForStoreIdentifier:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[VUIStoreMediaItem_iOS initWithMPMediaItem:videoManagedObject:isForStartingDownload:](self, "initWithMPMediaItem:videoManagedObject:isForStartingDownload:", v12, v10, v5);
  return v13;
}

- (VUIStoreMediaItem_iOS)initWithMPMediaItem:(id)a3 videoManagedObject:(id)a4 isForStartingDownload:(BOOL)a5
{
  id v9;
  VUIStoreMediaItem_iOS *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSURL *fpsCertificateURL;
  uint64_t v17;
  NSURL *fpsKeyServerURL;
  uint64_t v19;
  NSDictionary *fpsAdditionalServerParams;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  VUIMediaStartTimeInfo *v25;
  void *v26;
  VUIMediaStartTimeInfo *v27;
  void *v28;
  void *v29;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t);
  void *v34;
  VUIStoreMediaItem_iOS *v35;
  id v36;
  objc_super v37;

  v9 = a4;
  v37.receiver = self;
  v37.super_class = (Class)VUIStoreMediaItem_iOS;
  v10 = -[VUILibraryMediaItem_iOS initWithMPMediaItem:](&v37, sel_initWithMPMediaItem_, a3);
  if (v10)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0DB1948]);
    objc_msgSend(v11, "addStartEventWithName:", *MEMORY[0x1E0DB1F10]);
    objc_msgSend(v11, "addStartEventWithName:", *MEMORY[0x1E0DB1F28]);
    -[VUIStoreMediaItem_iOS setMediaItemMetadata:forProperty:](v10, "setMediaItemMetadata:forProperty:", v11, *MEMORY[0x1E0DB1D28]);
    objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "ams_activeiTunesAccount");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "ams_DSID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIStoreMediaItem_iOS setMediaItemMetadata:forProperty:](v10, "setMediaItemMetadata:forProperty:", v14, *MEMORY[0x1E0DB1A50]);

    v10->_isForStartingDownload = a5;
    if (v9)
    {
      objc_storeStrong((id *)&v10->_videoManagedObject, a4);
      objc_msgSend(v9, "fpsCertificateURL");
      v15 = objc_claimAutoreleasedReturnValue();
      fpsCertificateURL = v10->_fpsCertificateURL;
      v10->_fpsCertificateURL = (NSURL *)v15;

      objc_msgSend(v9, "fpsKeyServerURL");
      v17 = objc_claimAutoreleasedReturnValue();
      fpsKeyServerURL = v10->_fpsKeyServerURL;
      v10->_fpsKeyServerURL = (NSURL *)v17;

      objc_msgSend(v9, "additionalFPSRequestParams");
      v19 = objc_claimAutoreleasedReturnValue();
      fpsAdditionalServerParams = v10->_fpsAdditionalServerParams;
      v10->_fpsAdditionalServerParams = (NSDictionary *)v19;

      objc_msgSend(v9, "bookmarkTime");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "bookmarkTimeStamp");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "mainContentRelativeBookmarkTime");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "mainContentRelativeBookmarkTimeStamp");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        v25 = -[VUIMediaStartTimeInfo initWithStartTime:timestamp:type:source:]([VUIMediaStartTimeInfo alloc], "initWithStartTime:timestamp:type:source:", v21, v22, 0, CFSTR("Sideband Library"));
        -[VUIBaseMediaItem startTimeCollection](v10, "startTimeCollection");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "addStartTimeInfo:", v25);

      }
      if (v23)
      {
        v27 = -[VUIMediaStartTimeInfo initWithStartTime:timestamp:type:source:]([VUIMediaStartTimeInfo alloc], "initWithStartTime:timestamp:type:source:", v23, v24, 1, CFSTR("Sideband Library"));
        -[VUIBaseMediaItem startTimeCollection](v10, "startTimeCollection");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "addStartTimeInfo:", v27);

      }
      v31 = MEMORY[0x1E0C809B0];
      v32 = 3221225472;
      v33 = __86__VUIStoreMediaItem_iOS_initWithMPMediaItem_videoManagedObject_isForStartingDownload___block_invoke;
      v34 = &unk_1E9F98FD8;
      v35 = v10;
      v36 = v9;
      -[TVPBaseMediaItem performMediaItemMetadataTransactionWithBlock:](v35, "performMediaItemMetadataTransactionWithBlock:", &v31);

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", v31, v32, v33, v34);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addObserver:selector:name:object:", v10, sel__externalPlaybackTypeDidChange_, *MEMORY[0x1E0DB1F90], 0);

  }
  return v10;
}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  objc_super v5;
  uint8_t buf[16];

  v3 = sLogObject_14;
  if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_DEFAULT, "VUIStoreMediaItem_iOS deallocated", buf, 2u);
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)VUIStoreMediaItem_iOS;
  -[VUIStoreMediaItem_iOS dealloc](&v5, sel_dealloc);
}

- (void)resetReportingEventCollection
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0DB1948]);
  objc_msgSend(v3, "addStartEventWithName:", *MEMORY[0x1E0DB1F10]);
  objc_msgSend(v3, "addStartEventWithName:", *MEMORY[0x1E0DB1F28]);
  -[VUIStoreMediaItem_iOS setMediaItemMetadata:forProperty:](self, "setMediaItemMetadata:forProperty:", v3, *MEMORY[0x1E0DB1D28]);

}

- (BOOL)isEqualToMediaItem:(id)a3
{
  id v4;
  _BOOL4 v5;
  int v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VUIStoreMediaItem_iOS;
  if (-[VUILibraryMediaItem_iOS isEqualToMediaItem:](&v8, sel_isEqualToMediaItem_, v4)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = -[VUIStoreMediaItem_iOS isForStartingDownload](self, "isForStartingDownload");
    v6 = v5 ^ objc_msgSend(v4, "isForStartingDownload") ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)hasTrait:(id)a3
{
  id v4;
  BOOL v5;
  unsigned __int8 v6;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  _BOOL4 v20;
  const char *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  objc_super v29;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB1D80]))
    goto LABEL_4;
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB1D50]) & 1) != 0)
    goto LABEL_9;
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB1D90]))
  {
LABEL_4:
    v5 = -[VUIStoreMediaItem_iOS playbackType](self, "playbackType") == 2;
    goto LABEL_5;
  }
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB1D88]) & 1) != 0)
  {
LABEL_9:
    v6 = 1;
    goto LABEL_10;
  }
  if (!objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB1DB0]))
  {
    v8 = *MEMORY[0x1E0DB1D70];
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB1D70]))
    {
      -[VUILibraryMediaItem_iOS ml3Track](self, "ml3Track");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        -[VUILibraryMediaItem_iOS ml3Track](self, "ml3Track");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "valueForProperty:", *MEMORY[0x1E0D50EE0]);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v11, "BOOLValue");
LABEL_16:

LABEL_33:
        goto LABEL_10;
      }
      -[VUIStoreMediaItem_iOS videoManagedObject](self, "videoManagedObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        -[VUIStoreMediaItem_iOS videoManagedObject](self, "videoManagedObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "rentalID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v23 != 0;

        goto LABEL_33;
      }
      -[VUIStoreMediaItem_iOS mediaItemMetadataForProperty:](self, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1BF8]);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_40:
      v6 = v24 != 0;

      goto LABEL_10;
    }
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB1D30]))
    {
      -[VUILibraryMediaItem_iOS ml3Track](self, "ml3Track");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        -[VUILibraryMediaItem_iOS ml3Track](self, "ml3Track");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "valueForProperty:", *MEMORY[0x1E0D50E00]);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "BOOLValue");

        v6 = v15 ^ 1;
        goto LABEL_10;
      }
    }
    else
    {
      if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB1DA8]) & 1) != 0)
        goto LABEL_9;
      if (!objc_msgSend(v4, "isEqualToString:", VUIMediaItemTraitStopWhenPausedForTooLong))
      {
        if (!objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB1D68]))
        {
          v29.receiver = self;
          v29.super_class = (Class)VUIStoreMediaItem_iOS;
          v6 = -[VUILibraryMediaItem_iOS hasTrait:](&v29, sel_hasTrait_, v4);
          goto LABEL_10;
        }
        -[VUIStoreMediaItem_iOS videoManagedObject](self, "videoManagedObject");
        v25 = objc_claimAutoreleasedReturnValue();
        if (v25)
        {
          v26 = (void *)v25;
          -[VUIStoreMediaItem_iOS videoManagedObject](self, "videoManagedObject");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "downloadState");

          if (v28 == 2)
            goto LABEL_9;
        }
        -[VUILibraryMediaItem_iOS _localPlaybackFilePathURL](self, "_localPlaybackFilePathURL");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_40;
      }
      if (-[VUIStoreMediaItem_iOS hasTrait:](self, "hasTrait:", v8)
        && (-[VUIStoreMediaItem_iOS playbackType](self, "playbackType") == 2
         || -[VUIStoreMediaItem_iOS playbackType](self, "playbackType") == 1))
      {
        -[VUIStoreMediaItem_iOS mediaItemMetadataForProperty:](self, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1BF0]);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10)
        {
          v6 = 0;
          goto LABEL_33;
        }
        v16 = sLogObject_14;
        if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v31 = v10;
          _os_log_impl(&dword_1D96EE000, v16, OS_LOG_TYPE_DEFAULT, "Evaluating for VUIMediaItemTraitStopWhenPausedForTooLong.  Rental expiration is %@", buf, 0xCu);
        }
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "dateByAddingTimeInterval:", 3600.0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "laterDate:", v11);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = sLogObject_14;
        v20 = os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT);
        v6 = v18 == v10;
        if (v6)
        {
          if (!v20)
            goto LABEL_16;
          *(_WORD *)buf = 0;
          v21 = "Rental is not expired and not expiring in the next hour.  Will stop after being paused for too long to a"
                "llow other devices to play rental.";
        }
        else
        {
          if (!v20)
            goto LABEL_16;
          *(_WORD *)buf = 0;
          v21 = "Rental is either expired or expiring in the next hour.  Will not stop after being paused for too long";
        }
        _os_log_impl(&dword_1D96EE000, v19, OS_LOG_TYPE_DEFAULT, v21, buf, 2u);
        goto LABEL_16;
      }
    }
    v6 = 0;
    goto LABEL_10;
  }
  v5 = -[VUIStoreMediaItem_iOS playbackType](self, "playbackType") == 1;
LABEL_5:
  v6 = v5;
LABEL_10:

  return v6;
}

- (id)mediaItemMetadataForProperty:(id)a3
{
  id v4;
  id v5;
  VUISidebandMediaEntityImageLoadParams *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  _BOOL4 v26;
  __CFString **v27;
  __CFString **v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  __CFString *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  int64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  void *v56;
  char isKindOfClass;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  id v63;
  uint64_t v64;
  void *v65;
  char v66;
  id *v67;
  uint64_t v68;
  VUISidebandMediaEntityImageLoadParams *v69;
  void *v70;
  VUISidebandMediaEntityImageLoadParams *v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  VUISidebandMediaEntityImageLoadParams *v75;
  objc_class *v76;
  id v77;
  void *v78;
  _BOOL8 v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  VUISidebandMediaEntityImageLoadParams *v87;
  void *v88;
  VUISidebandMediaEntityImageLoadParams *v89;
  void *v90;
  uint64_t v91;
  void *v92;
  char v93;
  void *v94;
  void *v95;
  id v96;
  VUISidebandMediaEntityImageLoadParams *v97;
  uint64_t v98;
  void *v99;
  char v100;
  uint64_t v101;
  void *v102;
  char v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  void *v107;
  char v108;
  objc_super v109;
  objc_super v110;
  objc_super v111;
  objc_super v112;
  objc_super v113;
  objc_super v114;
  objc_super v115;
  objc_super v116;
  objc_super v117;
  objc_super v118;
  objc_super v119;
  id v120;
  objc_super v121;
  objc_super v122;
  objc_super v123;
  objc_super v124;
  objc_super v125;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB1B10]))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[VUIStoreAuxMediaItem mediaUserAgent](VUIStoreAuxMediaItem, "mediaUserAgent");
    v6 = (VUISidebandMediaEntityImageLoadParams *)objc_claimAutoreleasedReturnValue();
    -[VUIStoreMediaItem_iOS mediaItemMetadataForProperty:](self, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1A50]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[VUISidebandMediaEntityImageLoadParams length](v6, "length"))
      objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("User-Agent"));
    if (objc_msgSend(v8, "length"))
      objc_msgSend(v5, "setObject:forKey:", v8, CFSTR("X-Dsid"));
    objc_msgSend(v5, "setObject:forKey:", CFSTR("https://tv.apple.com"), CFSTR("Referer"));
    if (!objc_msgSend(v5, "count"))
    {

      v5 = 0;
    }

    goto LABEL_9;
  }
  v9 = *MEMORY[0x1E0DB1CB8];
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB1CB8]) & 1) != 0
    || objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB1AB0]))
  {
    -[VUILibraryMediaItem_iOS mpMediaItem](self, "mpMediaItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[VUILibraryMediaItem_iOS mpMediaItem](self, "mpMediaItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "valueForProperty:", *MEMORY[0x1E0CC1FA0]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v12, "longLongValue"))
      {
        objc_msgSend(v12, "stringValue");
        v13 = objc_claimAutoreleasedReturnValue();
LABEL_17:
        v5 = (id)v13;
LABEL_108:

        goto LABEL_109;
      }
LABEL_107:
      v5 = 0;
      goto LABEL_108;
    }
    -[VUIStoreMediaItem_iOS videoManagedObject](self, "videoManagedObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[VUIStoreMediaItem_iOS videoManagedObject](self, "videoManagedObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "adamID");
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
    v125.receiver = self;
    v125.super_class = (Class)VUIStoreMediaItem_iOS;
    -[VUILibraryMediaItem_iOS mediaItemMetadataForProperty:](&v125, sel_mediaItemMetadataForProperty_, v9);
    goto LABEL_25;
  }
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB19C0]))
  {
    if (-[VUIStoreMediaItem_iOS playbackType](self, "playbackType") == 1)
    {
      -[VUIStoreMediaItem_iOS sinfsDict](self, "sinfsDict");
      v15 = (id)objc_claimAutoreleasedReturnValue();
LABEL_30:
      v5 = v15;
      goto LABEL_109;
    }
LABEL_162:
    v5 = 0;
    goto LABEL_109;
  }
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB1AE0]))
  {
    -[VUIStoreMediaItem_iOS fileSize](self, "fileSize");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_30;
  }
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB1A80]))
  {
    -[VUIStoreMediaItem_iOS downloadToken](self, "downloadToken");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_30;
  }
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB1A68]))
  {
    -[VUIStoreMediaItem_iOS downloadDestinationURL](self, "downloadDestinationURL");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_30;
  }
  v16 = *MEMORY[0x1E0DB1BF8];
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB1BF8]))
  {
    v124.receiver = self;
    v124.super_class = (Class)VUIStoreMediaItem_iOS;
    -[VUILibraryMediaItem_iOS mediaItemMetadataForProperty:](&v124, sel_mediaItemMetadataForProperty_, v16);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (v5)
      goto LABEL_109;
    -[VUILibraryMediaItem_iOS ml3Track](self, "ml3Track");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      -[VUIStoreMediaItem_iOS videoManagedObject](self, "videoManagedObject");
      v5 = (id)objc_claimAutoreleasedReturnValue();

      if (!v5)
        goto LABEL_109;
      -[VUIStoreMediaItem_iOS videoManagedObject](self, "videoManagedObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "rentalID");
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
    -[VUILibraryMediaItem_iOS ml3Track](self, "ml3Track");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "valueForProperty:", *MEMORY[0x1E0D50EE0]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "BOOLValue");

    if (!v20)
      goto LABEL_162;
    -[VUILibraryMediaItem_iOS ml3Track](self, "ml3Track");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v21;
    v22 = (_QWORD *)MEMORY[0x1E0D51108];
LABEL_46:
    objc_msgSend(v21, "valueForProperty:", *v22);
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB1C50]))
  {
    -[VUIStoreMediaItem_iOS mediaItemMetadataForProperty:](self, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1B90]);
    v23 = objc_claimAutoreleasedReturnValue();
    v6 = (VUISidebandMediaEntityImageLoadParams *)v23;
    if (v23 == *MEMORY[0x1E0DB1DD0])
    {
      v26 = -[VUIStoreMediaItem_iOS isForStartingDownload](self, "isForStartingDownload");
      v27 = VUIStoreMediaItemRTCServiceIdentifierMovieRental_iOS_cloud;
      v28 = VUIStoreMediaItemRTCServiceIdentifierMovieRental_iOS_download;
    }
    else if (v23 == *MEMORY[0x1E0DB1DC0])
    {
      v26 = -[VUIStoreMediaItem_iOS isForStartingDownload](self, "isForStartingDownload");
      v27 = VUIStoreMediaItemRTCServiceIdentifierMoviePurchase_iOS_cloud;
      v28 = VUIStoreMediaItemRTCServiceIdentifierMoviePurchase_iOS_download;
    }
    else
    {
      if (v23 != *MEMORY[0x1E0DB1DD8])
      {
LABEL_40:
        v5 = 0;
LABEL_9:

        goto LABEL_109;
      }
      v26 = -[VUIStoreMediaItem_iOS isForStartingDownload](self, "isForStartingDownload");
      v27 = VUIStoreMediaItemRTCServiceIdentifierTVShowPurchase_iOS_cloud;
      v28 = VUIStoreMediaItemRTCServiceIdentifierTVShowPurchase_iOS_download;
    }
    if (v26)
      v27 = v28;
    v33 = *v27;
LABEL_59:
    v5 = v33;
    goto LABEL_9;
  }
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB1D08]))
  {
    -[VUIStoreMediaItem_iOS _iTunesStoreContentInfo](self, "_iTunesStoreContentInfo");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_30;
  }
  v24 = *MEMORY[0x1E0DB1A00];
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB1A00]))
  {
    -[VUILibraryMediaItem_iOS ml3Track](self, "ml3Track");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      -[VUILibraryMediaItem_iOS ml3Track](self, "ml3Track");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v21;
      v22 = (_QWORD *)MEMORY[0x1E0D51140];
      goto LABEL_46;
    }
    -[VUIStoreMediaItem_iOS videoManagedObject](self, "videoManagedObject");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      -[VUIStoreMediaItem_iOS videoManagedObject](self, "videoManagedObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "buyParams");
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
    v123.receiver = self;
    v123.super_class = (Class)VUIStoreMediaItem_iOS;
    -[VUILibraryMediaItem_iOS mediaItemMetadataForProperty:](&v123, sel_mediaItemMetadataForProperty_, v24);
LABEL_25:
    v15 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_30;
  }
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB1AC8]))
  {
    -[VUILibraryMediaItem_iOS ml3Track](self, "ml3Track");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "valueForProperty:", *MEMORY[0x1E0D510E0]);
    v6 = (VUISidebandMediaEntityImageLoadParams *)objc_claimAutoreleasedReturnValue();

    if (!-[VUISidebandMediaEntityImageLoadParams length](v6, "length"))
      goto LABEL_40;
    -[VUILibraryMediaItem_iOS ml3Track](self, "ml3Track");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "valueForProperty:", *MEMORY[0x1E0D50EE0]);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "BOOLValue");

    if ((v32 & 1) != 0)
      goto LABEL_40;
    v33 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v6);
    goto LABEL_59;
  }
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB1CB0]))
  {
    -[VUIStoreMediaItem_iOS mediaItemMetadataForProperty:](self, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1A50]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
      goto LABEL_107;
    objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "ams_iTunesAccountWithDSID:", v12);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "ams_storefront");
    v5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_63:
    goto LABEL_108;
  }
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB1BF0]))
  {
    -[VUIStoreMediaItem_iOS _rentalExpirationDate](self, "_rentalExpirationDate");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_30;
  }
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB1C00]))
  {
    -[VUILibraryMediaItem_iOS ml3Track](self, "ml3Track");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v37)
    {
      v5 = &unk_1EA0BBD28;
      goto LABEL_109;
    }
    -[VUILibraryMediaItem_iOS ml3Track](self, "ml3Track");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v21;
    v22 = (_QWORD *)MEMORY[0x1E0D50F90];
    goto LABEL_46;
  }
  v38 = *MEMORY[0x1E0DB19F0];
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB19F0]))
  {
    v15 = (id)*MEMORY[0x1E0DC88E0];
    goto LABEL_30;
  }
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB1B80]))
  {
    v39 = -[VUIStoreMediaItem_iOS playbackType](self, "playbackType");
    if ((unint64_t)(v39 - 1) > 5)
      v40 = 0;
    else
      v40 = qword_1DA1C21B8[v39 - 1];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v40);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_30;
  }
  v41 = *MEMORY[0x1E0DB1C08];
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB1C08]))
  {
    -[VUILibraryMediaItem_iOS ml3Track](self, "ml3Track");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42)
    {
      -[VUILibraryMediaItem_iOS ml3Track](self, "ml3Track");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "valueForProperty:", *MEMORY[0x1E0D50F98]);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "doubleValue");
      v46 = v45;

      if (v46 != 0.0)
      {
        v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", v46);
        goto LABEL_30;
      }
      goto LABEL_162;
    }
    -[VUIStoreMediaItem_iOS videoManagedObject](self, "videoManagedObject");
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    if (v51)
    {
      -[VUIStoreMediaItem_iOS videoManagedObject](self, "videoManagedObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "rentalPlaybackStartDate");
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
    v122.receiver = self;
    v122.super_class = (Class)VUIStoreMediaItem_iOS;
    -[VUILibraryMediaItem_iOS mediaItemMetadataForProperty:](&v122, sel_mediaItemMetadataForProperty_, v41);
    goto LABEL_25;
  }
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB19B8]))
  {
    v6 = (VUISidebandMediaEntityImageLoadParams *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[VUIStoreMediaItem_iOS mediaItemMetadataForProperty:](self, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1B88]);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v47, "count"))
    {
      -[VUISidebandMediaEntityImageLoadParams addEntriesFromDictionary:](v6, "addEntriesFromDictionary:", v47);
      -[VUIStoreMediaItem_iOS mediaItemMetadataForProperty:](self, "mediaItemMetadataForProperty:", v38);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v48, "length"))
        -[VUISidebandMediaEntityImageLoadParams setObject:forKey:](v6, "setObject:forKey:", v48, *MEMORY[0x1E0C8AD48]);

    }
    if (-[VUISidebandMediaEntityImageLoadParams count](v6, "count"))
      v5 = (id)-[VUISidebandMediaEntityImageLoadParams copy](v6, "copy");
    else
      v5 = 0;
    goto LABEL_99;
  }
  v49 = *MEMORY[0x1E0DB1C48];
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB1C48]))
  {
    -[VUILibraryMediaItem_iOS mpMediaItem](self, "mpMediaItem");
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    if (v50)
    {
      -[VUILibraryMediaItem_iOS mpMediaItem](self, "mpMediaItem");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v21;
      v22 = (_QWORD *)MEMORY[0x1E0CC1F48];
      goto LABEL_46;
    }
    -[VUIStoreMediaItem_iOS videoManagedObject](self, "videoManagedObject");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      v121.receiver = self;
      v121.super_class = (Class)VUIStoreMediaItem_iOS;
      -[VUILibraryMediaItem_iOS mediaItemMetadataForProperty:](&v121, sel_mediaItemMetadataForProperty_, v49);
      goto LABEL_25;
    }
    -[VUIStoreMediaItem_iOS videoManagedObject](self, "videoManagedObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "series");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "title");
    v58 = objc_claimAutoreleasedReturnValue();
    goto LABEL_112;
  }
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB1A78]))
  {
    -[VUIStoreMediaItem_iOS videoManagedObject](self, "videoManagedObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "downloadTaskIdentifier");
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB1A70]))
  {
    -[VUIStoreMediaItem_iOS videoManagedObject](self, "videoManagedObject");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v52;
    if (!v52)
      goto LABEL_107;
    objc_msgSend(v52, "downloadQOSMetricsJSONData");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v34, "length"))
    {
      v5 = 0;
      goto LABEL_63;
    }
    v120 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v34, 0, &v120);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = v120;
    if (v53)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v5 = v53;
LABEL_139:

        goto LABEL_63;
      }
      v79 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
      if (v79)
        -[VUIStoreMediaItem_iOS mediaItemMetadataForProperty:].cold.2(v79, v80, v81, v82, v83, v84, v85, v86);
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      -[VUIStoreMediaItem_iOS mediaItemMetadataForProperty:].cold.1();
    }
    v5 = 0;
    goto LABEL_139;
  }
  v59 = *MEMORY[0x1E0DB1CC8];
  if (!objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB1CC8]))
  {
    v64 = *MEMORY[0x1E0DB1B90];
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB1B90]))
    {
      v118.receiver = self;
      v118.super_class = (Class)VUIStoreMediaItem_iOS;
      -[VUILibraryMediaItem_iOS mediaItemMetadataForProperty:](&v118, sel_mediaItemMetadataForProperty_, v64);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "length"))
        goto LABEL_109;
      -[VUIStoreMediaItem_iOS videoManagedObject](self, "videoManagedObject");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v66 = objc_opt_isKindOfClass();

      if ((v66 & 1) != 0)
      {
        v67 = (id *)MEMORY[0x1E0DB1DD8];
      }
      else
      {
        -[VUIStoreMediaItem_iOS videoManagedObject](self, "videoManagedObject");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v93 = objc_opt_isKindOfClass();

        if ((v93 & 1) == 0)
          goto LABEL_109;
        -[VUIStoreMediaItem_iOS videoManagedObject](self, "videoManagedObject");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v94, "rentalID");
        v95 = (void *)objc_claimAutoreleasedReturnValue();

        v67 = (id *)MEMORY[0x1E0DB1DD0];
        if (!v95)
          v67 = (id *)MEMORY[0x1E0DB1DC0];
      }
      goto LABEL_147;
    }
    v68 = *MEMORY[0x1E0DB19D8];
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB19D8]))
    {
      v117.receiver = self;
      v117.super_class = (Class)VUIStoreMediaItem_iOS;
      -[VUILibraryMediaItem_iOS mediaItemMetadataForProperty:](&v117, sel_mediaItemMetadataForProperty_, v68);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      if (v5)
        goto LABEL_109;
      -[VUIStoreMediaItem_iOS videoManagedObject](self, "videoManagedObject");
      v5 = (id)objc_claimAutoreleasedReturnValue();

      if (!v5)
        goto LABEL_109;
      v69 = [VUISidebandMediaEntityImageLoadParams alloc];
      -[VUIStoreMediaItem_iOS videoManagedObject](self, "videoManagedObject");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = v69;
      v72 = v70;
      v73 = 0;
    }
    else
    {
      v74 = *MEMORY[0x1E0DB19D0];
      if (!objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB19D0]))
      {
        if (objc_msgSend(v4, "isEqualToString:", CFSTR("VUIMediaItemMetadataArtworkEpisodePreviewVUIImageProxy")))
        {
          v115.receiver = self;
          v115.super_class = (Class)VUIStoreMediaItem_iOS;
          -[VUILibraryMediaItem_iOS mediaItemMetadataForProperty:](&v115, sel_mediaItemMetadataForProperty_, CFSTR("VUIMediaItemMetadataArtworkEpisodePreviewVUIImageProxy"));
          v5 = (id)objc_claimAutoreleasedReturnValue();
          if (v5)
            goto LABEL_109;
          -[VUIStoreMediaItem_iOS videoManagedObject](self, "videoManagedObject");
          v5 = (id)objc_claimAutoreleasedReturnValue();

          if (!v5)
            goto LABEL_109;
          v87 = [VUISidebandMediaEntityImageLoadParams alloc];
          -[VUIStoreMediaItem_iOS videoManagedObject](self, "videoManagedObject");
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          v89 = v87;
          v90 = v88;
          v91 = 1;
        }
        else
        {
          if (!objc_msgSend(v4, "isEqualToString:", CFSTR("VUIMediaItemMetadataPostPlayVUIImageProxy")))
          {
            v98 = *MEMORY[0x1E0DB1A98];
            if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB1A98]))
            {
              v113.receiver = self;
              v113.super_class = (Class)VUIStoreMediaItem_iOS;
              -[VUILibraryMediaItem_iOS mediaItemMetadataForProperty:](&v113, sel_mediaItemMetadataForProperty_, v98);
              v5 = (id)objc_claimAutoreleasedReturnValue();
              if (v5)
                goto LABEL_109;
              -[VUIStoreMediaItem_iOS videoManagedObject](self, "videoManagedObject");
              v99 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              v100 = objc_opt_isKindOfClass();

              if ((v100 & 1) != 0)
              {
                -[VUIStoreMediaItem_iOS videoManagedObject](self, "videoManagedObject");
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "episodeNumberInSeries");
                v13 = objc_claimAutoreleasedReturnValue();
                goto LABEL_17;
              }
              goto LABEL_162;
            }
            v101 = *MEMORY[0x1E0DB1C40];
            if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB1C40]))
            {
              v112.receiver = self;
              v112.super_class = (Class)VUIStoreMediaItem_iOS;
              -[VUILibraryMediaItem_iOS mediaItemMetadataForProperty:](&v112, sel_mediaItemMetadataForProperty_, v101);
              v5 = (id)objc_claimAutoreleasedReturnValue();
              if (v5)
                goto LABEL_109;
              -[VUIStoreMediaItem_iOS videoManagedObject](self, "videoManagedObject");
              v102 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              v103 = objc_opt_isKindOfClass();

              if ((v103 & 1) == 0)
                goto LABEL_162;
              -[VUIStoreMediaItem_iOS videoManagedObject](self, "videoManagedObject");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "season");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "seasonNumber");
              v58 = objc_claimAutoreleasedReturnValue();
LABEL_112:
              v5 = (id)v58;
              goto LABEL_63;
            }
            v104 = *MEMORY[0x1E0DB1A40];
            if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB1A40]))
            {
              v111.receiver = self;
              v111.super_class = (Class)VUIStoreMediaItem_iOS;
              -[VUILibraryMediaItem_iOS mediaItemMetadataForProperty:](&v111, sel_mediaItemMetadataForProperty_, v104);
              v5 = (id)objc_claimAutoreleasedReturnValue();
              if (v5)
                goto LABEL_109;
              -[VUIStoreMediaItem_iOS videoManagedObject](self, "videoManagedObject");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "contentRatingRank");
              v13 = objc_claimAutoreleasedReturnValue();
              goto LABEL_17;
            }
            v105 = *MEMORY[0x1E0DB1A28];
            if (!objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB1A28]))
            {
              v109.receiver = self;
              v109.super_class = (Class)VUIStoreMediaItem_iOS;
              -[VUILibraryMediaItem_iOS mediaItemMetadataForProperty:](&v109, sel_mediaItemMetadataForProperty_, v4);
              goto LABEL_25;
            }
            v110.receiver = self;
            v110.super_class = (Class)VUIStoreMediaItem_iOS;
            -[VUILibraryMediaItem_iOS mediaItemMetadataForProperty:](&v110, sel_mediaItemMetadataForProperty_, v105);
            v5 = (id)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v5, "length"))
              goto LABEL_109;
            -[VUIStoreMediaItem_iOS videoManagedObject](self, "videoManagedObject");
            v106 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v106)
              goto LABEL_109;
            -[VUIStoreMediaItem_iOS videoManagedObject](self, "videoManagedObject");
            v107 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v108 = objc_opt_isKindOfClass();

            v67 = (id *)MEMORY[0x1E0DB1A38];
            if ((v108 & 1) == 0)
              v67 = (id *)MEMORY[0x1E0DB1A30];
LABEL_147:
            v63 = *v67;
            goto LABEL_148;
          }
          v114.receiver = self;
          v114.super_class = (Class)VUIStoreMediaItem_iOS;
          -[VUILibraryMediaItem_iOS mediaItemMetadataForProperty:](&v114, sel_mediaItemMetadataForProperty_, CFSTR("VUIMediaItemMetadataPostPlayVUIImageProxy"));
          v5 = (id)objc_claimAutoreleasedReturnValue();
          if (v5)
            goto LABEL_109;
          -[VUIStoreMediaItem_iOS videoManagedObject](self, "videoManagedObject");
          v5 = (id)objc_claimAutoreleasedReturnValue();

          if (!v5)
            goto LABEL_109;
          v97 = [VUISidebandMediaEntityImageLoadParams alloc];
          -[VUIStoreMediaItem_iOS videoManagedObject](self, "videoManagedObject");
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          v89 = v97;
          v90 = v88;
          v91 = 2;
        }
        v6 = -[VUISidebandMediaEntityImageLoadParams initWithVideoManagedObject:imageType:](v89, "initWithVideoManagedObject:imageType:", v90, v91);

        v76 = (objc_class *)MEMORY[0x1E0DC6A10];
LABEL_135:
        v77 = [v76 alloc];
        +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "sidebandMediaLibrary");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = (id)objc_msgSend(v77, "initWithObject:imageLoader:groupType:", v6, v78, 0);

LABEL_99:
        goto LABEL_9;
      }
      v116.receiver = self;
      v116.super_class = (Class)VUIStoreMediaItem_iOS;
      -[VUILibraryMediaItem_iOS mediaItemMetadataForProperty:](&v116, sel_mediaItemMetadataForProperty_, v74);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      if (v5)
        goto LABEL_109;
      -[VUIStoreMediaItem_iOS videoManagedObject](self, "videoManagedObject");
      v5 = (id)objc_claimAutoreleasedReturnValue();

      if (!v5)
        goto LABEL_109;
      v75 = [VUISidebandMediaEntityImageLoadParams alloc];
      -[VUIStoreMediaItem_iOS videoManagedObject](self, "videoManagedObject");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = v75;
      v72 = v70;
      v73 = 1;
    }
    v6 = -[VUISidebandMediaEntityImageLoadParams initWithVideoManagedObject:imageType:](v71, "initWithVideoManagedObject:imageType:", v72, v73);

    v76 = (objc_class *)MEMORY[0x1E0DB1870];
    goto LABEL_135;
  }
  -[VUILibraryMediaItem_iOS ml3Track](self, "ml3Track");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "valueForProperty:", *MEMORY[0x1E0D51168]);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v5, "length"))
  {
    -[VUIStoreMediaItem_iOS videoManagedObject](self, "videoManagedObject");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "title");
    v62 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v62;
  }
  if (!objc_msgSend(v5, "length"))
  {
    v119.receiver = self;
    v119.super_class = (Class)VUIStoreMediaItem_iOS;
    -[VUILibraryMediaItem_iOS mediaItemMetadataForProperty:](&v119, sel_mediaItemMetadataForProperty_, v59);
    v63 = (id)objc_claimAutoreleasedReturnValue();
LABEL_148:
    v96 = v63;

    v5 = v96;
  }
LABEL_109:

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
    -[VUIStoreMediaItem_iOS videoManagedObject](self, "videoManagedObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
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

  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)VUIStoreMediaItem_iOS;
    -[TVPBaseMediaItem setMediaItemMetadata:forProperty:](&v14, sel_setMediaItemMetadata_forProperty_, v6, v7);
  }

}

- (void)prepareForLoadingWithCompletion:(id)a3
{
  id v4;
  id v5;
  objc_super v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__VUIStoreMediaItem_iOS_prepareForLoadingWithCompletion___block_invoke;
  v7[3] = &unk_1E9F9FF70;
  v5 = v4;
  v8 = v5;
  objc_copyWeak(&v9, &location);
  v6.receiver = self;
  v6.super_class = (Class)VUIStoreMediaItem_iOS;
  -[VUILibraryMediaItem_iOS prepareForLoadingWithCompletion:](&v6, sel_prepareForLoadingWithCompletion_, v7);
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
}

- (void)prepareForPlaybackInitiationWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  char v8;
  _QWORD aBlock[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  if (-[VUIStoreMediaItem_iOS hasTrait:](self, "hasTrait:", *MEMORY[0x1E0DB1D70]))
  {
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __68__VUIStoreMediaItem_iOS_prepareForPlaybackInitiationWithCompletion___block_invoke;
    aBlock[3] = &unk_1E9F9FF48;
    objc_copyWeak(&v11, &location);
    v10 = v4;
    v5 = _Block_copy(aBlock);
    if (-[VUIStoreMediaItem_iOS playbackType](self, "playbackType") == 1)
    {
      -[VUIStoreMediaItem_iOS setNeedsRentalCheckin:](self, "setNeedsRentalCheckin:", 1);
      -[VUIStoreMediaItem_iOS mediaItemMetadataForProperty:](self, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1D28]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addStartEventWithName:", *MEMORY[0x1E0DB1F08]);
      v7 = 2;
    }
    else
    {
      if (!-[VUIStoreMediaItem_iOS needsRentalCheckoutPriorToPlayback](self, "needsRentalCheckoutPriorToPlayback")
        && -[VUIStoreMediaItem_iOS playbackType](self, "playbackType") != 3
        && -[VUIStoreMediaItem_iOS playbackType](self, "playbackType") != 4)
      {
        v8 = 0;
LABEL_11:

        objc_destroyWeak(&v11);
        objc_destroyWeak(&location);
        if (!v4)
          goto LABEL_14;
        goto LABEL_12;
      }
      -[VUIStoreMediaItem_iOS setNeedsRentalCheckoutPriorToPlayback:](self, "setNeedsRentalCheckoutPriorToPlayback:", 0);
      -[VUIStoreMediaItem_iOS setNeedsRentalCheckin:](self, "setNeedsRentalCheckin:", 0);
      -[VUIStoreMediaItem_iOS mediaItemMetadataForProperty:](self, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1D28]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addStartEventWithName:", *MEMORY[0x1E0DB1F08]);
      v7 = 1;
    }

    -[VUIStoreMediaItem_iOS _checkoutRentalWithCheckoutType:startPlaybackClock:completion:](self, "_checkoutRentalWithCheckoutType:startPlaybackClock:completion:", v7, 0, v5);
    v8 = 1;
    goto LABEL_11;
  }
  v8 = 0;
  if (!v4)
    goto LABEL_14;
LABEL_12:
  if ((v8 & 1) == 0)
    (*((void (**)(id, uint64_t, _QWORD))v4 + 2))(v4, 1, 0);
LABEL_14:

}

- (BOOL)shouldRetryPlaybackForError:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  NSObject *v12;
  uint8_t v13[16];

  v4 = a3;
  if (!-[VUIStoreMediaItem_iOS hasTrait:](self, "hasTrait:", *MEMORY[0x1E0DB1D70])
    || -[VUIStoreMediaItem_iOS playbackType](self, "playbackType") != 5
    && -[VUIStoreMediaItem_iOS playbackType](self, "playbackType") != 6)
  {
    goto LABEL_10;
  }
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isEqualToString:", CFSTR("TVPlaybackErrorDomain")))
  {

    goto LABEL_10;
  }
  v6 = objc_msgSend(v4, "code");

  if (v6 != 811)
  {
LABEL_10:
    v10 = 0;
    goto LABEL_11;
  }
  -[VUIStoreMediaItem_iOS _rentalExpirationDate](self, "_rentalExpirationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7
    || (objc_msgSend(MEMORY[0x1E0C99D68], "date"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "laterDate:", v8),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        v8,
        v9 == v7))
  {
    v12 = sLogObject_14;
    if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1D96EE000, v12, OS_LOG_TYPE_DEFAULT, "Downloaded rental is not authorized for playback even though it hasn't expired.  Will retry playback and perform rental checkout", v13, 2u);
    }
    v10 = 1;
    -[VUIStoreMediaItem_iOS setNeedsRentalCheckoutPriorToPlayback:](self, "setNeedsRentalCheckoutPriorToPlayback:", 1);
  }
  else
  {
    v10 = 0;
  }

LABEL_11:
  return v10;
}

- (id)replacementErrorForPlaybackError:(id)a3
{
  __CFString *v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  void *v8;
  uint64_t v9;
  __CFString *v10;
  id v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  NSObject *v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  uint8_t buf[8];
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v4 = (__CFString *)a3;
  -[__CFString domain](v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isEqualToString:", CFSTR("TVPlaybackErrorDomain")))
  {

LABEL_7:
    -[VUIStoreMediaItem_iOS fpsKeyError](self, "fpsKeyError");
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      v7 = v4;
      if (!TVPErrorIsSKDError())
        goto LABEL_26;
      v10 = v4;
      if (!v10)
      {
        v7 = 0;
        goto LABEL_26;
      }
    }
    v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v11, "setObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0DB1D20]);
    objc_msgSend(v11, "setObject:forKey:", v10, *MEMORY[0x1E0CB3388]);
    if (-[__CFString code](v10, "code") == -345014)
    {
      -[VUIStoreMediaItem_iOS mediaItemMetadataForProperty:](self, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1CC8]);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (!-[__CFString length](v12, "length"))
      {

        v12 = &stru_1E9FF3598;
      }
      v13 = (void *)MEMORY[0x1E0CB3940];
      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringForKey:", CFSTR("TOO_MANY_STREAMS_FORMAT_PURCHASE"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithValidatedFormat:validFormatSpecifiers:error:", v15, CFSTR("%@"), 0, v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "setObject:forKey:", v16, *MEMORY[0x1E0CB2D80]);
      v17 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v18 = 810;
    }
    else
    {
      if (-[__CFString code](v10, "code") != -345016)
      {
        if (-[__CFString code](v10, "code") == -345015 || -[__CFString code](v10, "code") == -345017)
        {
          v22 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v23 = 811;
        }
        else
        {
          v28 = -[__CFString code](v10, "code");
          v22 = objc_alloc(MEMORY[0x1E0CB35C8]);
          if (v28 == -345028)
            v23 = 827;
          else
            v23 = 820;
        }
        v7 = (__CFString *)objc_msgSend(v22, "initWithDomain:code:userInfo:", CFSTR("TVPlaybackErrorDomain"), v23, v11);
        v12 = v4;
        goto LABEL_24;
      }
      -[VUIStoreMediaItem_iOS mediaItemMetadataForProperty:](self, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1CC8]);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (!-[__CFString length](v12, "length"))
      {

        v12 = &stru_1E9FF3598;
      }
      v19 = (void *)MEMORY[0x1E0CB3940];
      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringForKey:", CFSTR("TOO_MANY_STREAMS_FORMAT"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringWithValidatedFormat:validFormatSpecifiers:error:", v21, CFSTR("%@"), 0, v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "setObject:forKey:", v16, *MEMORY[0x1E0CB2D80]);
      v17 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v18 = 812;
    }
    v7 = (__CFString *)objc_msgSend(v17, "initWithDomain:code:userInfo:", CFSTR("TVPlaybackErrorDomain"), v18, v11);

LABEL_24:
    goto LABEL_25;
  }
  v6 = -[__CFString code](v4, "code");

  if (v6 != 827)
    goto LABEL_7;
  v7 = v4;
  if (-[VUIStoreMediaItem_iOS hasTrait:](self, "hasTrait:", *MEMORY[0x1E0DB1D70]))
  {
    -[__CFString userInfo](v4, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x1E0CB3388];
    objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0CB3388]);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v30 = v9;
      v31[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
    if (-[VUIStoreMediaItem_iOS playbackType](self, "playbackType") == 1)
    {
      v25 = sLogObject_14;
      if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D96EE000, v25, OS_LOG_TYPE_DEFAULT, "AirPlay of streaming CRABS rental failed because device does not support playback.  Video must be downloaded in order to AirPlay", buf, 2u);
      }
      v26 = 831;
LABEL_36:
      v7 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TVPlaybackErrorDomain"), v26, v11);

      goto LABEL_25;
    }
    v7 = v4;
    if (-[VUIStoreMediaItem_iOS playbackType](self, "playbackType") == 3)
    {
      v27 = sLogObject_14;
      if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D96EE000, v27, OS_LOG_TYPE_DEFAULT, "AirPlay of downloading CRABS rental failed because device does not support playback.  Video must be fully downloaded in order to AirPlay", buf, 2u);
      }
      v26 = 832;
      goto LABEL_36;
    }
LABEL_25:

  }
LABEL_26:

  return v7;
}

- (void)updateBookmarkWithSuggestedTime:(double)a3 forElapsedTime:(double)a4 duration:(double)a5 playbackOfMediaItemIsEnding:(BOOL)a6
{
  _BOOL8 v6;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_super v29;

  v6 = a6;
  -[VUIStoreMediaItem_iOS videoManagedObject](self, "videoManagedObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIStoreMediaItem_iOS mediaItemMetadataForProperty:](self, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1AD8]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIStoreMediaItem_iOS mediaItemMetadataForProperty:](self, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1AD0]);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v13)
      v16 = v14 == 0;
    else
      v16 = 1;
    if (v16)
    {
      v17 = 0;
    }
    else
    {
      objc_msgSend(v13, "doubleValue");
      v19 = fmax(a3 - v18, 0.0);
      objc_msgSend(v15, "doubleValue");
      if (v19 >= v20)
      {
        objc_msgSend(v15, "doubleValue");
        v19 = v21;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v19);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[VUIStoreMediaItem_iOS videoManagedObject](self, "videoManagedObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setBookmarkTime:", v23);

    -[VUIStoreMediaItem_iOS videoManagedObject](self, "videoManagedObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setBookmarkTimeStamp:", v12);

    -[VUIStoreMediaItem_iOS videoManagedObject](self, "videoManagedObject");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setMainContentRelativeBookmarkTime:", v17);

    -[VUIStoreMediaItem_iOS videoManagedObject](self, "videoManagedObject");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setMainContentRelativeBookmarkTimeStamp:", v12);

    +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "sidebandMediaLibrary");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "saveChangesToManagedObjects");

  }
  v29.receiver = self;
  v29.super_class = (Class)VUIStoreMediaItem_iOS;
  -[VUILibraryMediaItem_iOS updateBookmarkWithSuggestedTime:forElapsedTime:duration:playbackOfMediaItemIsEnding:](&v29, sel_updateBookmarkWithSuggestedTime_forElapsedTime_duration_playbackOfMediaItemIsEnding_, v6, a3, a4, a5);
}

- (void)processFinishedDownloadWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  int v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  id v39;
  __CFString *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  _QWORD v44[4];
  void (**v45)(id, void *);
  id v46;
  unsigned __int8 v47;
  uint64_t v48;
  void *v49;
  uint8_t buf[4];
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  v5 = sLogObject_14;
  if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "processFinishedDownloadWithCompletion", buf, 2u);
  }
  -[VUIStoreMediaItem_iOS videoManagedObject](self, "videoManagedObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localPlaybackURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v47 = 0;
  objc_msgSend(v7, "pathExtension");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "isEqualToString:", CFSTR("movpkg")))
    goto LABEL_19;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "fileExistsAtPath:isDirectory:", v10, &v47))
    goto LABEL_17;
  v11 = v47;

  if (!v11)
  {
    v12 = sLogObject_14;
    if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v51 = v7;
      _os_log_impl(&dword_1D96EE000, v12, OS_LOG_TYPE_DEFAULT, "After downloading, CRABS download has incorrect file extension of .movpkg: %@", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "BOOLForKey:", CFSTR("DisableCRABSMovpkgWorkound"));

    if ((v14 & 1) == 0)
    {
      -[VUIStoreMediaItem_iOS videoManagedObject](self, "videoManagedObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "playbackURL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "pathExtension");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v9, "length"))
      {
LABEL_18:

LABEL_19:
        goto LABEL_20;
      }
      objc_msgSend(v7, "URLByDeletingPathExtension");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "URLByAppendingPathExtension:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = sLogObject_14;
      if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v51 = v10;
        _os_log_impl(&dword_1D96EE000, v17, OS_LOG_TYPE_DEFAULT, "Correcting CRABS download file URL to %@", buf, 0xCu);
      }
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = 0;
      v19 = objc_msgSend(v18, "moveItemAtURL:toURL:error:", v7, v10, &v46);
      v20 = v46;

      if (v19)
      {
        -[VUIStoreMediaItem_iOS videoManagedObject](self, "videoManagedObject");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setLocalPlaybackURL:", v10);

        +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "sidebandMediaLibrary");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "saveChangesToManagedObjects");

        v24 = v10;
        v7 = v24;
      }
      else if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_ERROR))
      {
        -[VUIStoreMediaItem_iOS processFinishedDownloadWithCompletion:].cold.2();
      }

LABEL_17:
      goto LABEL_18;
    }
  }
LABEL_20:
  -[VUIStoreMediaItem_iOS videoManagedObject](self, "videoManagedObject");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "localPlaybackURL");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "pathExtension");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "isEqualToString:", CFSTR("movpkg"));

  if ((v28 & 1) == 0)
  {
    -[VUIStoreMediaItem_iOS videoManagedObject](self, "videoManagedObject");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "redownloadProductResponseDictionary");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v30, "objectForKey:", CFSTR("sinfs"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v33 = v32;
    if (v31)
      objc_msgSend(v32, "setObject:forKey:", v31, *MEMORY[0x1E0D0D538]);
    v34 = sLogObject_14;
    if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v34, OS_LOG_TYPE_DEFAULT, "Processing sinfs", buf, 2u);
    }
    objc_msgSend(MEMORY[0x1E0D0D558], "fileProcessor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "path");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "processPurchasedItem:withAttributes:", v36, v33);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    v38 = sLogObject_14;
    if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v38, OS_LOG_TYPE_DEFAULT, "Done processing sinfs", buf, 2u);
    }
    if (v37)
    {
      if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_ERROR))
      {
        -[VUIStoreMediaItem_iOS processFinishedDownloadWithCompletion:].cold.1();
        if (v4)
          goto LABEL_30;
      }
      else if (v4)
      {
LABEL_30:
        v39 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v40 = VUIStoreMediaItemErrorDomain;
        v48 = *MEMORY[0x1E0CB3388];
        v49 = v37;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = (void *)objc_msgSend(v39, "initWithDomain:code:userInfo:", v40, -123009, v41);

        v4[2](v4, v42);
        goto LABEL_39;
      }
    }

  }
  if (-[VUIStoreMediaItem_iOS hasTrait:](self, "hasTrait:", *MEMORY[0x1E0DB1D70]))
  {
    v43 = sLogObject_14;
    if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v43, OS_LOG_TYPE_DEFAULT, "Checking out rental since download is complete", buf, 2u);
    }
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __63__VUIStoreMediaItem_iOS_processFinishedDownloadWithCompletion___block_invoke;
    v44[3] = &unk_1E9F99C68;
    v45 = v4;
    -[VUIStoreMediaItem_iOS _checkoutRentalWithCheckoutType:startPlaybackClock:completion:](self, "_checkoutRentalWithCheckoutType:startPlaybackClock:completion:", 1, 0, v44);

  }
  else if (v4)
  {
    v4[2](v4, 0);
  }
LABEL_39:

}

- (void)cleanUpMediaItem
{
  void *v3;
  void *v4;
  objc_super v5;

  -[VUIStoreMediaItem_iOS setLoadingContext:](self, "setLoadingContext:", -[VUIStoreMediaItem_iOS loadingContext](self, "loadingContext") + 1);
  if (-[VUIStoreMediaItem_iOS needsRentalCheckin](self, "needsRentalCheckin"))
  {
    -[VUIStoreMediaItem_iOS setNeedsRentalCheckin:](self, "setNeedsRentalCheckin:", 0);
    -[VUIStoreMediaItem_iOS _checkInRental](self, "_checkInRental");
  }
  -[VUIStoreMediaItem_iOS playbackURL](self, "playbackURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIStoreMediaItem_iOS _deleteDownloadKeyCookieForURL:](self, "_deleteDownloadKeyCookieForURL:", v3);

  -[VUIStoreMediaItem_iOS setPlaybackType:](self, "setPlaybackType:", 0);
  -[VUIStoreMediaItem_iOS setPlaybackURL:](self, "setPlaybackURL:", 0);
  -[VUIStoreMediaItem_iOS setSinfsDict:](self, "setSinfsDict:", 0);
  -[VUIStoreMediaItem_iOS setFileSize:](self, "setFileSize:", 0);
  -[VUIStoreMediaItem_iOS setDownloadDestinationURL:](self, "setDownloadDestinationURL:", 0);
  -[VUIStoreMediaItem_iOS setDownloadToken:](self, "setDownloadToken:", 0);
  -[VUIStoreMediaItem_iOS setDownloadMonitor:](self, "setDownloadMonitor:", 0);
  -[VUIStoreMediaItem_iOS setParentReportingToken:](self, "setParentReportingToken:", 0);
  -[VUIStoreMediaItem_iOS storeFPSKeyLoader](self, "storeFPSKeyLoader");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendStreamingStopRequestIfNecessary");

  -[VUIStoreMediaItem_iOS setStoreFPSKeyLoader:](self, "setStoreFPSKeyLoader:", 0);
  -[VUIStoreMediaItem_iOS setMediaItemMetadata:forProperty:](self, "setMediaItemMetadata:forProperty:", 0, *MEMORY[0x1E0DB1D28]);
  v5.receiver = self;
  v5.super_class = (Class)VUIStoreMediaItem_iOS;
  -[VUILibraryMediaItem_iOS cleanUpMediaItem](&v5, sel_cleanUpMediaItem);
}

- (void)mediaItemAllInitialLoadingComplete:(id)a3 totalTime:(double)a4 player:(id)a5
{
  id v7;
  id v8;
  void (**v9)(void *, uint64_t, _QWORD);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id location;

  v7 = a3;
  v8 = a5;
  if (-[VUIStoreMediaItem_iOS hasTrait:](self, "hasTrait:", *MEMORY[0x1E0DB1D70]))
  {
    objc_initWeak(&location, self);
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __77__VUIStoreMediaItem_iOS_mediaItemAllInitialLoadingComplete_totalTime_player___block_invoke;
    v14 = &unk_1E9F9C6F8;
    objc_copyWeak(&v15, &location);
    v9 = (void (**)(void *, uint64_t, _QWORD))_Block_copy(&v11);
    if (-[VUIStoreMediaItem_iOS playbackType](self, "playbackType", v11, v12, v13, v14) == 1)
    {
      v10 = 2;
    }
    else
    {
      if (-[VUIStoreMediaItem_iOS playbackType](self, "playbackType") != 3
        && -[VUIStoreMediaItem_iOS playbackType](self, "playbackType") != 4)
      {
        if (-[VUIStoreMediaItem_iOS playbackType](self, "playbackType") == 5
          || -[VUIStoreMediaItem_iOS playbackType](self, "playbackType") == 6)
        {
          -[VUIStoreMediaItem_iOS _checkoutRentalWithCheckoutType:startPlaybackClock:completion:](self, "_checkoutRentalWithCheckoutType:startPlaybackClock:completion:", 1, 1, 0);
          v9[2](v9, 1, 0);
        }
        goto LABEL_8;
      }
      v10 = 1;
    }
    -[VUIStoreMediaItem_iOS _checkoutRentalWithCheckoutType:startPlaybackClock:completion:](self, "_checkoutRentalWithCheckoutType:startPlaybackClock:completion:", v10, 1, v9);
LABEL_8:

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

}

- (void)loadFairPlayStreamingKeyRequests:(id)a3
{
  -[VUIStoreMediaItem_iOS loadFairPlayStreamingKeyRequests:completion:](self, "loadFairPlayStreamingKeyRequests:completion:", a3, 0);
}

- (void)loadFairPlayStreamingKeyRequests:(id)a3 completion:(id)a4
{
  id v6;
  int64_t v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  VUIStoreFPSKeyLoader *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void (**v35)(_QWORD);
  id v36;
  _QWORD v37[4];
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
  v35 = (void (**)(_QWORD))a4;
  v7 = -[VUIStoreMediaItem_iOS playbackType](self, "playbackType");
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9 = v8;
  v36 = v6;
  if ((unint64_t)(v7 - 4) > 2)
  {
    objc_msgSend(v8, "addObjectsFromArray:", v6);
  }
  else
  {
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v44 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          if (objc_msgSend(v15, "type"))
          {
            if (objc_msgSend(v15, "type") == 2)
            {
              -[VUIStoreMediaItem_iOS _offlineKeyDataForKeyRequest:](self, "_offlineKeyDataForKeyRequest:", v15);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = sSecureKeyDeliveryLogObject;
              if (v16)
              {
                if (os_log_type_enabled((os_log_t)sSecureKeyDeliveryLogObject, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v49 = v15;
                  _os_log_impl(&dword_1D96EE000, v17, OS_LOG_TYPE_DEFAULT, "Using existing offline key data for request %@", buf, 0xCu);
                }
                objc_msgSend(v15, "setKeyResponseData:", v16);
                objc_msgSend(v15, "finish");
              }
              else
              {
                if (os_log_type_enabled((os_log_t)sSecureKeyDeliveryLogObject, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v49 = v15;
                  _os_log_error_impl(&dword_1D96EE000, v17, OS_LOG_TYPE_ERROR, "Offline key data does not exist for request %@", buf, 0xCu);
                }
                objc_msgSend(v9, "addObject:", v15);
              }

            }
            else
            {
              objc_msgSend(v9, "addObject:", v15);
            }
          }
          else
          {
            objc_msgSend(v15, "finishByRequestingOfflineKeysIfPossible");
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
      }
      while (v12);
    }

    v6 = v36;
  }
  if (objc_msgSend(v9, "count"))
  {
    -[VUIStoreMediaItem_iOS storeFPSKeyLoader](self, "storeFPSKeyLoader");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      -[VUIStoreMediaItem_iOS fpsCertificateURL](self, "fpsCertificateURL");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIStoreMediaItem_iOS fpsKeyServerURL](self, "fpsKeyServerURL");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[VUIStoreFPSKeyLoader initWithCertificateURL:keyServerURL:]([VUIStoreFPSKeyLoader alloc], "initWithCertificateURL:keyServerURL:", v19, v20);
      if (-[VUIStoreMediaItem_iOS hasTrait:](self, "hasTrait:", *MEMORY[0x1E0DB1D70]))
      {
        -[VUIStoreMediaItem_iOS mediaItemMetadataForProperty:](self, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1BF8]);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIStoreFPSKeyLoader setRentalID:](v21, "setRentalID:", v22);
        if (-[VUIStoreMediaItem_iOS playbackType](self, "playbackType") == 2)
          -[VUIStoreFPSKeyLoader setDidSkipRentalCheckout:](v21, "setDidSkipRentalCheckout:", 1);

      }
      -[VUIStoreFPSKeyLoader setDelegate:](v21, "setDelegate:", self);
      -[VUIStoreMediaItem_iOS mediaItemMetadataForProperty:](self, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1D28]);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIStoreFPSKeyLoader setEventCollection:](v21, "setEventCollection:", v23);

      -[VUIStoreMediaItem_iOS setStoreFPSKeyLoader:](self, "setStoreFPSKeyLoader:", v21);
    }
    -[VUIStoreMediaItem_iOS fpsAdditionalServerParams](self, "fpsAdditionalServerParams");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v25 = v9;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v40;
      v29 = *MEMORY[0x1E0DB1CB8];
      do
      {
        for (j = 0; j != v27; ++j)
        {
          if (*(_QWORD *)v40 != v28)
            objc_enumerationMutation(v25);
          v31 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * j);
          objc_msgSend(v31, "setAdditionalRequestParams:", v24);
          -[VUIStoreMediaItem_iOS mediaItemMetadataForProperty:](self, "mediaItemMetadataForProperty:", v29);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setAdamID:", v32);

        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
      }
      while (v27);
    }

    -[VUIStoreMediaItem_iOS storeFPSKeyLoader](self, "storeFPSKeyLoader");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __69__VUIStoreMediaItem_iOS_loadFairPlayStreamingKeyRequests_completion___block_invoke;
    v37[3] = &unk_1E9F98E68;
    v34 = v35;
    v38 = v35;
    objc_msgSend(v33, "loadFairPlayStreamingKeyRequests:completion:", v25, v37);

    v6 = v36;
  }
  else
  {
    v34 = v35;
    if (v35)
      v35[2](v35);
  }

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
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[VUIStoreMediaItem_iOS fpsKeyError](self, "fpsKeyError");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (!v7)
    {
      -[VUIStoreMediaItem_iOS setFpsKeyError:](self, "setFpsKeyError:", v6);
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
LABEL_9:
              v14 = *MEMORY[0x1E0DB1D18];
              v17[0] = *MEMORY[0x1E0DB1D20];
              v17[1] = v14;
              v18[0] = MEMORY[0x1E0C9AAB0];
              v18[1] = v8;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "postNotificationName:object:userInfo:", *MEMORY[0x1E0DB1D10], self, v15);

              goto LABEL_10;
            }
            v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            objc_msgSend(v9, "setObject:forKey:", v8, *MEMORY[0x1E0CB3388]);
            +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "localizedStringForKey:", CFSTR("SignInToWatchThisVideoErrorDescription"));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "setObject:forKey:", v12, *MEMORY[0x1E0CB2D80]);

            v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TVPlaybackErrorDomain"), 813, v9);
            -[VUIStoreMediaItem_iOS setFpsKeyError:](self, "setFpsKeyError:", 0);
            v8 = (id)v13;
          }

          goto LABEL_9;
        }
      }
    }
  }
LABEL_10:

}

- (void)storeFPSKeyLoader:(id)a3 didLoadOfflineKeyData:(id)a4 forKeyRequest:(id)a5
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  v9 = (void *)sLogObject_14;
  if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    v11 = 134218240;
    v12 = objc_msgSend(v7, "length");
    v13 = 2048;
    v14 = objc_msgSend(v8, "requestID");
    _os_log_impl(&dword_1D96EE000, v10, OS_LOG_TYPE_DEFAULT, "Received offline key data with length %lu for id %lu", (uint8_t *)&v11, 0x16u);

  }
  -[VUIStoreMediaItem_iOS _persistOfflineKeyData:forKeyRequest:](self, "_persistOfflineKeyData:forKeyRequest:", v7, v8);

}

- (void)storeFPSKeyLoader:(id)a3 didReceiveUpdatedRentalExpirationDate:(id)a4 playbackStartDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = sLogObject_14;
  if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412290;
    v14 = v9;
    _os_log_impl(&dword_1D96EE000, v11, OS_LOG_TYPE_DEFAULT, "Received updated rental expiration date from FPS loader: %@", (uint8_t *)&v13, 0xCu);
  }
  v12 = sLogObject_14;
  if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412290;
    v14 = v10;
    _os_log_impl(&dword_1D96EE000, v12, OS_LOG_TYPE_DEFAULT, "Received updated rental playback start date from FPS loader: %@", (uint8_t *)&v13, 0xCu);
  }
  -[VUIStoreMediaItem_iOS _updateRentalPlaybackStartDate:](self, "_updateRentalPlaybackStartDate:", v10);

}

- (void)_updateRentalPlaybackStartDate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  int v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[VUILibraryMediaItem_iOS mpMediaItem](self, "mpMediaItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x1E0CC1F20];
    objc_msgSend(v5, "valueForProperty:", *MEMORY[0x1E0CC1F20]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7
      || (objc_msgSend(v7, "doubleValue"), v8 <= 0.0)
      || (v9 = (void *)MEMORY[0x1E0C99D68],
          objc_msgSend(v7, "doubleValue"),
          objc_msgSend(v9, "dateWithTimeIntervalSinceReferenceDate:"),
          (v10 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      -[VUIStoreMediaItem_iOS videoManagedObject](self, "videoManagedObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "rentalPlaybackStartDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
        goto LABEL_7;
    }
    objc_msgSend(v10, "timeIntervalSinceDate:", v4);
    if (fabs(v12) <= 5.0)
    {
      v19 = sLogObject_14;
      if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_1D96EE000, v19, OS_LOG_TYPE_DEFAULT, "Not updating MPMediaItem with new rental playback start date since it's close to existing start date", (uint8_t *)&v20, 2u);
      }
    }
    else
    {
LABEL_7:
      v13 = sLogObject_14;
      if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
      {
        v20 = 138412290;
        v21 = v4;
        _os_log_impl(&dword_1D96EE000, v13, OS_LOG_TYPE_DEFAULT, "Updating MPMediaItem with new rental playback start date: %@", (uint8_t *)&v20, 0xCu);
      }
      -[VUILibraryMediaItem_iOS mpMediaItem](self, "mpMediaItem");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v4, "timeIntervalSinceReferenceDate");
      objc_msgSend(v15, "numberWithDouble:");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setValue:forProperty:withCompletionBlock:", v16, v6, 0);

      -[VUIStoreMediaItem_iOS videoManagedObject](self, "videoManagedObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setRentalPlaybackStartDate:", v18);

    }
  }

}

- (void)_configureForLocalPlaybackWithURL:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void (**v14)(id, uint64_t, _QWORD);

  v14 = (void (**)(id, uint64_t, _QWORD))a4;
  v6 = a3;
  objc_msgSend(v6, "pathExtension");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("movpkg"));

  -[VUIStoreMediaItem_iOS setPlaybackURL:](self, "setPlaybackURL:", v6);
  if (v8)
    v9 = 6;
  else
    v9 = 5;
  if (v8)
    v10 = 2;
  else
    v10 = 1;
  -[VUIStoreMediaItem_iOS setPlaybackType:](self, "setPlaybackType:", v9);
  v11 = *MEMORY[0x1E0DB1D28];
  -[VUIStoreMediaItem_iOS mediaItemMetadataForProperty:](self, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1D28]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setIsDownloaded:", 1);

  -[VUIStoreMediaItem_iOS mediaItemMetadataForProperty:](self, "mediaItemMetadataForProperty:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setVideoType:", v10);

  v14[2](v14, 1, 0);
}

- (void)_configureForPlaybackFromExistingDownload:(id)a3 downloadManager:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  VUIStoreDownloadMonitor *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18[2];
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[VUIStoreDownloadMonitor initWithDownload:downloadManager:]([VUIStoreDownloadMonitor alloc], "initWithDownload:downloadManager:", v8, v9);
  -[VUIStoreMediaItem_iOS setDownloadMonitor:](self, "setDownloadMonitor:", v11);
  v12 = -[VUIStoreMediaItem_iOS loadingContext](self, "loadingContext");
  objc_initWeak(&location, self);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __94__VUIStoreMediaItem_iOS__configureForPlaybackFromExistingDownload_downloadManager_completion___block_invoke;
  v15[3] = &unk_1E9F9FFC0;
  objc_copyWeak(v18, &location);
  v18[1] = v12;
  v13 = v10;
  v17 = v13;
  v14 = v8;
  v16 = v14;
  -[VUIStoreDownloadMonitor waitForDownloadToBecomePlayableWithCompletion:](v11, "waitForDownloadToBecomePlayableWithCompletion:", v15);

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);

}

- (void)_configureForStreamingPlaybackWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  NSObject *v11;
  char v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  _BOOL4 v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  id v33[2];
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint8_t buf[4];
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[VUILibraryMediaItem_iOS ml3Track](self, "ml3Track");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D50DD0];
  objc_msgSend(v5, "valueForProperty:", *MEMORY[0x1E0D50DD0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[VUIStoreMediaItem_iOS hlsPlaybackURL](self, "hlsPlaybackURL");
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLForKey:", CFSTR("ForceCRABS"));

  if (v10)
  {
    v11 = sLogObject_14;
    if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v11, OS_LOG_TYPE_DEFAULT, "Will attempt CRABS playback since ForceCRABS defaults key is set", buf, 2u);
    }
  }
  if (objc_msgSend(v7, "length") | v8)
    v12 = v10;
  else
    v12 = 1;
  if ((v12 & 1) != 0)
  {
    v13 = -[VUIStoreMediaItem_iOS loadingContext](self, "loadingContext");
    objc_initWeak((id *)buf, self);
    v14 = *MEMORY[0x1E0DB1D28];
    -[VUIStoreMediaItem_iOS mediaItemMetadataForProperty:](self, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1D28]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSingleShotEventWithName:value:", *MEMORY[0x1E0DB1E70], MEMORY[0x1E0C9AAB0]);

    -[VUIStoreMediaItem_iOS mediaItemMetadataForProperty:](self, "mediaItemMetadataForProperty:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addStartEventWithName:", *MEMORY[0x1E0DB1E68]);

    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __70__VUIStoreMediaItem_iOS__configureForStreamingPlaybackWithCompletion___block_invoke;
    v31[3] = &unk_1E9F9FFE8;
    objc_copyWeak(v33, (id *)buf);
    v33[1] = v13;
    v34 = v10;
    v32 = v4;
    -[VUIStoreMediaItem_iOS _performRedownloadWithType:completion:](self, "_performRedownloadWithType:completion:", 0, v31);

    objc_destroyWeak(v33);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v17 = sLogObject_14;
    if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v17, OS_LOG_TYPE_DEFAULT, "HLS URL is available; skipping redownload", buf, 2u);
    }
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v7);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[VUIStoreMediaItem_iOS _url:hasSameAdamIDAsURL:](self, "_url:hasSameAdamIDAsURL:", v8, v18);

      if (v19)
      {
        v20 = sLogObject_14;
        if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v38 = v8;
          _os_log_impl(&dword_1D96EE000, v20, OS_LOG_TYPE_DEFAULT, "Updating ML3Track's HLS playlist URL with value from UTS: %@", buf, 0xCu);
        }
        -[VUILibraryMediaItem_iOS ml3Track](self, "ml3Track");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v8;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v6;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setValues:forProperties:async:withCompletionBlock:", v22, v23, 1, 0);

      }
      v24 = (id)v8;
    }
    else
    {
      v24 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v7);
    }
    v25 = v24;
    -[VUIStoreMediaItem_iOS _hlsURLEnsuringDsidQueryParamIsPresentFromURL:](self, "_hlsURLEnsuringDsidQueryParamIsPresentFromURL:", v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[VUIStoreMediaItem_iOS isBingeWatched](self, "isBingeWatched"))
    {
      objc_msgSend(v26, "vui_URLByAddingQueryParamWithName:value:", CFSTR("bingeWatching"), CFSTR("true"));
      v27 = objc_claimAutoreleasedReturnValue();

      v26 = (void *)v27;
    }
    -[VUIStoreMediaItem_iOS setPlaybackURL:](self, "setPlaybackURL:", v26);
    -[VUIStoreMediaItem_iOS setPlaybackType:](self, "setPlaybackType:", 2);
    v28 = *MEMORY[0x1E0DB1D28];
    -[VUIStoreMediaItem_iOS mediaItemMetadataForProperty:](self, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1D28]);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setVideoType:", 2);

    -[VUIStoreMediaItem_iOS mediaItemMetadataForProperty:](self, "mediaItemMetadataForProperty:", v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addSingleShotEventWithName:value:", *MEMORY[0x1E0DB1E70], MEMORY[0x1E0C9AAA0]);

    (*((void (**)(id, uint64_t, _QWORD))v4 + 2))(v4, 1, 0);
  }

}

- (void)_configureForDownloadingWithCompletion:(id)a3
{
  id v4;
  _BOOL4 v5;
  NSObject *v6;
  _BOOL4 v7;
  const char *v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16[2];
  char v17;
  id buf[2];

  v4 = a3;
  v5 = -[VUIStoreMediaItem_iOS isForStartingDownload](self, "isForStartingDownload");
  v6 = sLogObject_14;
  v7 = os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      LOWORD(buf[0]) = 0;
      v8 = "Media item will start downloading";
LABEL_6:
      _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)buf, 2u);
    }
  }
  else if (v7)
  {
    LOWORD(buf[0]) = 0;
    v8 = "Media item being downloaded";
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLForKey:", CFSTR("ForceCRABS"));

  if (v10)
  {
    v11 = sLogObject_14;
    if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1D96EE000, v11, OS_LOG_TYPE_DEFAULT, "Will attempt CRABS download since ForceCRABS defaults key is set", (uint8_t *)buf, 2u);
    }
  }
  v12 = -[VUIStoreMediaItem_iOS loadingContext](self, "loadingContext");
  objc_initWeak(buf, self);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __64__VUIStoreMediaItem_iOS__configureForDownloadingWithCompletion___block_invoke;
  v14[3] = &unk_1E9F9FFE8;
  objc_copyWeak(v16, buf);
  v16[1] = v12;
  v17 = v10;
  v13 = v4;
  v15 = v13;
  -[VUIStoreMediaItem_iOS _performRedownloadWithType:completion:](self, "_performRedownloadWithType:completion:", 1, v14);

  objc_destroyWeak(v16);
  objc_destroyWeak(buf);

}

- (void)_performRedownloadWithType:(int64_t)a3 completion:(id)a4
{
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  v6 = *MEMORY[0x1E0DB1A00];
  v7 = a4;
  -[VUIStoreMediaItem_iOS mediaItemMetadataForProperty:](self, "mediaItemMetadataForProperty:", v6);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CFDA08], "buyParamsWithString:", v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!a3)
    {
      objc_msgSend(v8, "setParameter:forKey:", CFSTR("1"), CFSTR("playback"));
      objc_msgSend(v9, "setParameter:forKey:", CFSTR("1"), CFSTR("lightweight"));
      if (-[VUIStoreMediaItem_iOS hasTrait:](self, "hasTrait:", *MEMORY[0x1E0DB1D70]))
        objc_msgSend(v9, "setParameter:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("streamingRental"));
    }
    +[VUIRedownloadEndpointManager sharedInstance](VUIRedownloadEndpointManager, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "performRedownloadWithType:buyParams:completion:", a3, v9, v7);

    v7 = v10;
  }
  else
  {
    v11 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v9 = (void *)objc_msgSend(v11, "initWithDomain:code:userInfo:", VUIStoreMediaItemErrorDomain, -123001, 0);
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v9);
  }

}

- (BOOL)_loadingCancelled:(unint64_t)a3
{
  return -[VUIStoreMediaItem_iOS loadingContext](self, "loadingContext") != a3;
}

- (id)_iTunesStoreContentPurchasedMediaKind
{
  void *v2;
  const __CFString *v3;
  const __CFString *v4;

  -[VUIStoreMediaItem_iOS mediaItemMetadataForProperty:](self, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1B90]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 == (void *)*MEMORY[0x1E0DB1DD8])
    v3 = CFSTR("tvshow");
  else
    v3 = 0;
  if (v2 == (void *)*MEMORY[0x1E0DB1DC0])
    v4 = CFSTR("movie");
  else
    v4 = v3;

  return (id)v4;
}

- (void)_setDownloadKeyCookieWithURL:(id)a3 downloadKey:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  _QWORD v17[6];

  v17[5] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = v5;
  if (a3 && v5)
  {
    v7 = a3;
    objc_msgSend(v7, "host");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 && v9)
    {
      v10 = (void *)MEMORY[0x1E0CB3670];
      v11 = *MEMORY[0x1E0CB2BC0];
      v16[0] = *MEMORY[0x1E0CB2B90];
      v16[1] = v11;
      v17[0] = CFSTR("downloadKey");
      v17[1] = v6;
      v12 = *MEMORY[0x1E0CB2BA0];
      v16[2] = *MEMORY[0x1E0CB2B78];
      v16[3] = v12;
      v17[2] = v8;
      v17[3] = v9;
      v16[4] = *MEMORY[0x1E0CB2BC8];
      v17[4] = CFSTR("0");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "cookieWithProperties:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3678], "sharedHTTPCookieStorage");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setCookie:", v14);

    }
  }

}

- (void)_deleteDownloadKeyCookieForURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(MEMORY[0x1E0CB3678], "sharedHTTPCookieStorage", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cookiesForURL:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_msgSend(v10, "name");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("downloadKey"));

          if (v12)
          {
            objc_msgSend(MEMORY[0x1E0CB3678], "sharedHTTPCookieStorage");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "deleteCookie:", v10);

          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

  }
}

- (id)_downloadForThisMediaItemReturningDownloadManager:(id *)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  int v21;
  BOOL v22;
  void *v24;
  void *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  id obj;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[2];
  _BYTE v39[128];
  _QWORD v40[3];
  _QWORD v41[4];

  v41[2] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MEMORY[0x1E0DAF4E0]);
  v5 = *MEMORY[0x1E0DAF868];
  v41[0] = *MEMORY[0x1E0DAF828];
  v41[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDownloadKinds:", v6);

  objc_msgSend(v4, "setShouldFilterExternalOriginatedDownloads:", 0);
  v7 = *MEMORY[0x1E0DAF990];
  v8 = *MEMORY[0x1E0DAF9D0];
  v40[0] = *MEMORY[0x1E0DAF990];
  v40[1] = v8;
  v40[2] = *MEMORY[0x1E0DAF948];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPrefetchedDownloadProperties:", v9);

  v26 = v4;
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAF4C8]), "initWithManagerOptions:", v4);
  objc_msgSend(v24, "downloads");
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v33)
  {
    v28 = 0;
    v32 = *(_QWORD *)v35;
    v31 = *MEMORY[0x1E0D51100];
    v29 = *MEMORY[0x1E0DAF8C8];
    v27 = *MEMORY[0x1E0DAF8D0];
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v35 != v32)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v10);
      v38[0] = v7;
      v38[1] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "vui_valuesForProperties:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "objectForKey:", v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKey:", v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUILibraryMediaItem_iOS ml3Track](self, "ml3Track");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "valueForProperty:", v31);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = objc_msgSend(v14, "longLongValue");
      if (v18 == -[VUILibraryMediaItem_iOS persistentID](self, "persistentID")
        || (v15 ? (v22 = v17 == 0) : (v22 = 1), !v22 && objc_msgSend(v15, "isEqualToNumber:", v17)))
      {
        objc_msgSend(v11, "downloadPhaseIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v19, "isEqualToString:", v29) & 1) == 0
          && (objc_msgSend(v19, "isEqualToString:", v27) & 1) == 0)
        {
          v20 = v11;

          v28 = v20;
        }

        v21 = 0;
      }
      else
      {
        v21 = 1;
      }

      if (!v21)
        break;
      if (v33 == ++v10)
      {
        v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
        if (v33)
          goto LABEL_3;
        break;
      }
    }
  }
  else
  {
    v28 = 0;
  }

  if (a3)
    *a3 = objc_retainAutorelease(v24);

  return v28;
}

- (id)_videoPlaybackTypeDescription
{
  unint64_t v2;

  v2 = -[VUIStoreMediaItem_iOS playbackType](self, "playbackType");
  if (v2 > 6)
    return 0;
  else
    return off_1E9FA0008[v2];
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
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v23;

  v4 = a3;
  if (!-[VUIStoreMediaItem_iOS useSidebandLibraryForPlaybackKeys](self, "useSidebandLibraryForPlaybackKeys"))
  {
    -[VUILibraryMediaItem_iOS ml3Track](self, "ml3Track");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "valueForProperty:", *MEMORY[0x1E0D50DC8]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v7 = 0;
      goto LABEL_17;
    }
    v13 = (void *)MEMORY[0x1E0CB3710];
    v14 = (void *)MEMORY[0x1E0C99E60];
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    objc_msgSend(v13, "unarchivedObjectOfClasses:fromData:error:", v17, v5, &v23);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v23;

    if (v19 && os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_ERROR))
    {
      -[VUIStoreMediaItem_iOS _offlineKeyDataForKeyRequest:].cold.1();
      if (v18)
        goto LABEL_9;
    }
    else if (v18)
    {
LABEL_9:
      objc_msgSend(v4, "keyIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "absoluteString");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        objc_msgSend(v18, "objectForKey:", v21);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = 0;
      }

      goto LABEL_16;
    }
    v7 = 0;
LABEL_16:

    goto LABEL_17;
  }
  objc_msgSend(v4, "keyIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIStoreMediaItem_iOS videoManagedObject](self, "videoManagedObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0;
  if (v6 && v5)
  {
    +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sidebandMediaLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIStoreMediaItem_iOS videoManagedObject](self, "videoManagedObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fpsKeyInfoForVideo:keyURI:createIfNeeded:wasCreated:", v10, v5, 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "keyData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_17:

  return v7;
}

- (void)_persistOfflineKeyData:(id)a3 forKeyRequest:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  void *v39;
  uint8_t buf[4];
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[VUIStoreMediaItem_iOS useSidebandLibraryForPlaybackKeys](self, "useSidebandLibraryForPlaybackKeys"))
  {
    objc_msgSend(v7, "keyIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIStoreMediaItem_iOS videoManagedObject](self, "videoManagedObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9 || !v8)
    {
LABEL_9:

      goto LABEL_22;
    }
    v10 = objc_msgSend(v6, "length");

    if (v10)
    {
      -[VUIStoreMediaItem_iOS videoManagedObject](self, "videoManagedObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "downloadState");

      v13 = sLogObject_14;
      v14 = os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT);
      if (v12)
      {
        if (v14)
        {
          *(_DWORD *)buf = 138412290;
          v41 = v7;
          _os_log_impl(&dword_1D96EE000, v13, OS_LOG_TYPE_DEFAULT, "Saving offline key data to database: %@", buf, 0xCu);
        }
        +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "sidebandMediaLibrary");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIStoreMediaItem_iOS videoManagedObject](self, "videoManagedObject");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "fpsKeyInfoForVideo:keyURI:createIfNeeded:wasCreated:", v17, v8, 1, 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        -[VUIStoreMediaItem_iOS videoManagedObject](self, "videoManagedObject");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "populateFromKeyRequest:video:", v7, v18);

        +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "sidebandMediaLibrary");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "saveChangesToManagedObjects");

        goto LABEL_9;
      }
      if (v14)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D96EE000, v13, OS_LOG_TYPE_DEFAULT, "Offline keys received for an item that is no longer downloading or downloaded.  Not saving keys.", buf, 2u);
      }
    }
  }
  else
  {
    -[VUILibraryMediaItem_iOS ml3Track](self, "ml3Track");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *MEMORY[0x1E0D50DC8];
    objc_msgSend(v21, "valueForProperty:", *MEMORY[0x1E0D50DC8]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      goto LABEL_15;
    v23 = (void *)MEMORY[0x1E0CB3710];
    v24 = (void *)MEMORY[0x1E0C99E60];
    v25 = objc_opt_class();
    v26 = objc_opt_class();
    objc_msgSend(v24, "setWithObjects:", v25, v26, objc_opt_class(), 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0;
    objc_msgSend(v23, "unarchivedObjectOfClasses:fromData:error:", v27, v8, &v37);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v37;

    if (v29 && os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_ERROR))
      -[VUIStoreMediaItem_iOS _offlineKeyDataForKeyRequest:].cold.1();
    v30 = (id)objc_msgSend(v28, "mutableCopy");

    if (!v30)
LABEL_15:
      v30 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v7, "keyIdentifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "absoluteString");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "length") && v32)
    {
      objc_msgSend(v30, "setObject:forKey:", v6, v32);
      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v30, 1, 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (v33)
      {
        -[VUILibraryMediaItem_iOS ml3Track](self, "ml3Track");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = v33;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v22;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setValues:forProperties:async:withCompletionBlock:", v35, v36, 1, 0);

      }
    }

  }
LABEL_22:

}

- (void)_checkoutRentalWithCheckoutType:(unint64_t)a3 startPlaybackClock:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;

  v5 = a4;
  v8 = a5;
  -[VUIStoreMediaItem_iOS mediaItemMetadataForProperty:](self, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1BF8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIStoreMediaItem_iOS mediaItemMetadataForProperty:](self, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1A50]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  +[VUIRentalManager sharedInstance](VUIRentalManager, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __87__VUIStoreMediaItem_iOS__checkoutRentalWithCheckoutType_startPlaybackClock_completion___block_invoke;
  v13[3] = &unk_1E9F9FF48;
  objc_copyWeak(&v15, &location);
  v12 = v8;
  v14 = v12;
  objc_msgSend(v11, "checkOutRentalWithID:dsid:checkoutType:startPlaybackClock:completion:", v9, v10, a3, v5, v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

- (void)_checkInRental
{
  void *v3;
  void *v4;
  id v5;

  -[VUIStoreMediaItem_iOS mediaItemMetadataForProperty:](self, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1BF8]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[VUIStoreMediaItem_iOS mediaItemMetadataForProperty:](self, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1A50]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIRentalManager sharedInstance](VUIRentalManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "checkInRentalWithID:dsid:completion:", v5, v3, 0);

}

- (void)_externalPlaybackTypeDidChange:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD *v11;
  _QWORD *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint8_t v17[8];
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentMediaItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToMediaItem:", self);

  if (v6
    && objc_msgSend(v4, "externalPlaybackType") == 1
    && -[VUIStoreMediaItem_iOS hasTrait:](self, "hasTrait:", *MEMORY[0x1E0DB1D70]))
  {
    if (-[VUIStoreMediaItem_iOS playbackType](self, "playbackType") == 1)
    {
      v7 = sLogObject_14;
      if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "Not allowing AirPlay playback of streaming CRABS rental", v17, 2u);
      }
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TVPlaybackErrorDomain"), 831, 0);
      v9 = *MEMORY[0x1E0DB1D18];
      v20[0] = *MEMORY[0x1E0DB1D20];
      v20[1] = v9;
      v21[0] = MEMORY[0x1E0C9AAB0];
      v21[1] = v8;
      v10 = (void *)MEMORY[0x1E0C99D80];
      v11 = v21;
      v12 = v20;
LABEL_12:
      objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v11, v12, 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "postNotificationName:object:userInfo:", *MEMORY[0x1E0DB1D10], self, v15);

      goto LABEL_13;
    }
    if (-[VUIStoreMediaItem_iOS playbackType](self, "playbackType") == 3)
    {
      v13 = sLogObject_14;
      if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_1D96EE000, v13, OS_LOG_TYPE_DEFAULT, "Not allowing AirPlay playback of downloading CRABS rental", v17, 2u);
      }
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TVPlaybackErrorDomain"), 832, 0);
      v14 = *MEMORY[0x1E0DB1D18];
      v18[0] = *MEMORY[0x1E0DB1D20];
      v18[1] = v14;
      v19[0] = MEMORY[0x1E0C9AAB0];
      v19[1] = v8;
      v10 = (void *)MEMORY[0x1E0C99D80];
      v11 = v19;
      v12 = v18;
      goto LABEL_12;
    }
  }
LABEL_13:

}

- (id)_iTunesStoreContentInfo
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[VUIStoreMediaItem_iOS mediaItemMetadataForProperty:](self, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1CB8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v4, "longLongValue"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  -[VUILibraryMediaItem_iOS ml3Track](self, "ml3Track");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[VUILibraryMediaItem_iOS ml3Track](self, "ml3Track");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "valueForProperty:", *MEMORY[0x1E0D50DD0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[VUIStoreMediaItem_iOS videoManagedObject](self, "videoManagedObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "playbackURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "absoluteString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (!objc_msgSend(v8, "length"))
  {
    -[VUIStoreMediaItem_iOS hlsPlaybackURL](self, "hlsPlaybackURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "absoluteString");
    v11 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v11;
  }
  if (objc_msgSend(v8, "length"))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v8);
    -[VUIStoreMediaItem_iOS _hlsURLEnsuringDsidQueryParamIsPresentFromURL:](self, "_hlsURLEnsuringDsidQueryParamIsPresentFromURL:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[VUIStoreMediaItem_iOS isBingeWatched](self, "isBingeWatched"))
    {
      objc_msgSend(v13, "vui_URLByAddingQueryParamWithName:value:", CFSTR("bingeWatching"), CFSTR("true"));
      v14 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v14;
    }
    objc_msgSend(v13, "absoluteString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "length"))
    {
      v16 = v15;

      v8 = v16;
    }
    objc_msgSend(v3, "setObject:forKey:", v8, *MEMORY[0x1E0C8ADD8]);

  }
  if (-[VUIStoreMediaItem_iOS hasTrait:](self, "hasTrait:", *MEMORY[0x1E0DB1D70]))
  {
    -[VUIStoreMediaItem_iOS mediaItemMetadataForProperty:](self, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1BF8]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
      objc_msgSend(v3, "setObject:forKey:", v17, *MEMORY[0x1E0C8ADF0]);
  }
  else
  {
    if (!v5)
      goto LABEL_29;
    objc_msgSend(v3, "setObject:forKey:", v5, *MEMORY[0x1E0C8ADE0]);
    objc_msgSend(v3, "setObject:forKey:", CFSTR("purchaseHistory"), *MEMORY[0x1E0C8ADF8]);
    -[VUIStoreMediaItem_iOS _iTunesStoreContentPurchasedMediaKind](self, "_iTunesStoreContentPurchasedMediaKind");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
      objc_msgSend(v3, "setObject:forKey:", v17, *MEMORY[0x1E0C8ADE8]);
    v18 = (void *)MEMORY[0x1E0CFDCA8];
    objc_msgSend(MEMORY[0x1E0CFDBD0], "currentProcess");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "userAgentForProcessInfo:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
      objc_msgSend(v3, "setObject:forKey:", v20, *MEMORY[0x1E0C8AE00]);
    -[VUIStoreMediaItem_iOS mediaItemMetadataForProperty:](self, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1A50]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
      objc_msgSend(v3, "setObject:forKey:", v21, *MEMORY[0x1E0C8ADC8]);
    -[VUIStoreMediaItem_iOS mediaItemMetadataForProperty:](self, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1A00]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
      objc_msgSend(v3, "setObject:forKey:", v22, *MEMORY[0x1E0C8ADD0]);

  }
LABEL_29:
  if (objc_msgSend(v3, "count"))
    v23 = (void *)objc_msgSend(v3, "copy");
  else
    v23 = 0;

  return v23;
}

- (id)_rentalEndDate
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;

  -[VUILibraryMediaItem_iOS ml3Track](self, "ml3Track");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dateByAddingTimeInterval:", 2592000.0);
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  -[VUILibraryMediaItem_iOS ml3Track](self, "ml3Track");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForProperty:", *MEMORY[0x1E0D50FA0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  if (v7 == 0.0)
  {
    v13 = 0;
    return v13;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUILibraryMediaItem_iOS ml3Track](self, "ml3Track");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "valueForProperty:", *MEMORY[0x1E0D50F80]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doubleValue");
  v12 = v11;

  v13 = 0;
  if (v8 && v12 != 0.0)
  {
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeInterval:sinceDate:", v8, v12);
LABEL_7:
    v13 = (void *)v14;
  }

  return v13;
}

- (id)_rentalPlaybackEndDate
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  id v14;
  double v15;
  void *v16;

  -[VUILibraryMediaItem_iOS ml3Track](self, "ml3Track");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[VUIStoreMediaItem_iOS videoManagedObject](self, "videoManagedObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "rentalPlaybackStartDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v13 = 0;
      goto LABEL_11;
    }
    v14 = objc_alloc(MEMORY[0x1E0C99D68]);
    v15 = 172800.0;
LABEL_8:
    v13 = (void *)objc_msgSend(v14, "initWithTimeInterval:sinceDate:", v8, v15);
LABEL_11:

    return v13;
  }
  -[VUILibraryMediaItem_iOS ml3Track](self, "ml3Track");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForProperty:", *MEMORY[0x1E0D50F98]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  if (v7 != 0.0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUILibraryMediaItem_iOS ml3Track](self, "ml3Track");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "valueForProperty:", *MEMORY[0x1E0D50F90]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    v12 = v11;

    v13 = 0;
    if (!v8 || v12 == 0.0)
      goto LABEL_11;
    v14 = objc_alloc(MEMORY[0x1E0C99D68]);
    v15 = v12;
    goto LABEL_8;
  }
  v13 = 0;
  return v13;
}

- (id)_rentalExpirationDate
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  -[VUIStoreMediaItem_iOS _rentalPlaybackEndDate](self, "_rentalPlaybackEndDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIStoreMediaItem_iOS _rentalEndDate](self, "_rentalEndDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 && v4)
  {
    objc_msgSend(v3, "earlierDate:", v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if (v3)
  {
    v6 = v3;
  }
  else if (v4)
  {
    v6 = v4;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  return v7;
}

- (id)_hlsURLEnsuringDsidQueryParamIsPresentFromURL:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4 && (objc_msgSend(v4, "vui_containsQueryParamWithName:", CFSTR("dsid")) & 1) == 0)
  {
    v8 = sLogObject_14;
    if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412290;
      v16 = v5;
      _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, "dsid query param is missing from HLS URL: %@", (uint8_t *)&v15, 0xCu);
    }
    -[VUIStoreMediaItem_iOS mediaItemMetadataForProperty:](self, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1A50]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v5;
    if (objc_msgSend(v10, "length"))
    {
      objc_msgSend(v5, "vui_URLByAddingQueryParamWithName:value:", CFSTR("dsid"), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v7 = v5;
      if (v11)
      {
        v7 = v11;

        v13 = sLogObject_14;
        if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
        {
          v15 = 138412290;
          v16 = v7;
          _os_log_impl(&dword_1D96EE000, v13, OS_LOG_TYPE_DEFAULT, "HLS URL after adding dsid param: %@", (uint8_t *)&v15, 0xCu);
        }
      }

    }
  }
  else
  {
    v6 = sLogObject_14;
    v7 = v5;
    if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412290;
      v16 = v5;
      _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "dsid query param is present in HLS URL: %@", (uint8_t *)&v15, 0xCu);
      v7 = v5;
    }
  }

  return v7;
}

- (BOOL)_url:(id)a3 hasSameAdamIDAsURL:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", v5, 0);
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", v7, 0);
    v11 = (void *)v10;
    v8 = 0;
    if (v9)
      v12 = v10 == 0;
    else
      v12 = 1;
    if (!v12)
    {
      v37 = v9;
      v38 = v7;
      objc_msgSend(v9, "queryItems");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "queryItems");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      v46 = 0u;
      v15 = v13;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
      v36 = v11;
      if (v16)
      {
        v17 = v16;
        v34 = v14;
        v18 = *(_QWORD *)v44;
        while (2)
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v44 != v18)
              objc_enumerationMutation(v15);
            v20 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
            objc_msgSend(v20, "name");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "caseInsensitiveCompare:", CFSTR("a"));

            if (!v22)
            {
              objc_msgSend(v20, "value");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_17;
            }
          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
          if (v17)
            continue;
          break;
        }
        v35 = 0;
LABEL_17:
        v14 = v34;
      }
      else
      {
        v35 = 0;
      }

      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v23 = v14;
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v40;
        while (2)
        {
          for (j = 0; j != v25; ++j)
          {
            if (*(_QWORD *)v40 != v26)
              objc_enumerationMutation(v23);
            v28 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * j);
            objc_msgSend(v28, "name");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(v29, "caseInsensitiveCompare:", CFSTR("a"));

            if (!v30)
            {
              objc_msgSend(v28, "value");
              v31 = (void *)objc_claimAutoreleasedReturnValue();

              v8 = 0;
              v32 = v35;
              if (v35)
              {
                v9 = v37;
                v7 = v38;
                v11 = v36;
                if (v31)
                  v8 = objc_msgSend(v35, "isEqualToString:", v31);
              }
              else
              {
                v9 = v37;
                v7 = v38;
                v11 = v36;
              }
              goto LABEL_32;
            }
          }
          v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
          if (v25)
            continue;
          break;
        }
      }

      v31 = 0;
      v8 = 0;
      v9 = v37;
      v7 = v38;
      v32 = v35;
      v11 = v36;
LABEL_32:

    }
  }

  return v8;
}

- (NSURL)fpsCertificateURL
{
  return self->_fpsCertificateURL;
}

- (void)setFpsCertificateURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSURL)fpsKeyServerURL
{
  return self->_fpsKeyServerURL;
}

- (void)setFpsKeyServerURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSDictionary)fpsAdditionalServerParams
{
  return self->_fpsAdditionalServerParams;
}

- (void)setFpsAdditionalServerParams:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (BOOL)isBingeWatched
{
  return self->_isBingeWatched;
}

- (void)setIsBingeWatched:(BOOL)a3
{
  self->_isBingeWatched = a3;
}

- (NSURL)hlsPlaybackURL
{
  return self->_hlsPlaybackURL;
}

- (void)setHlsPlaybackURL:(id)a3
{
  objc_storeStrong((id *)&self->_hlsPlaybackURL, a3);
}

- (unint64_t)loadingContext
{
  return self->_loadingContext;
}

- (void)setLoadingContext:(unint64_t)a3
{
  self->_loadingContext = a3;
}

- (NSDictionary)sinfsDict
{
  return self->_sinfsDict;
}

- (void)setSinfsDict:(id)a3
{
  objc_storeStrong((id *)&self->_sinfsDict, a3);
}

- (NSNumber)fileSize
{
  return self->_fileSize;
}

- (void)setFileSize:(id)a3
{
  objc_storeStrong((id *)&self->_fileSize, a3);
}

- (NSURL)downloadDestinationURL
{
  return self->_downloadDestinationURL;
}

- (void)setDownloadDestinationURL:(id)a3
{
  objc_storeStrong((id *)&self->_downloadDestinationURL, a3);
}

- (NSNumber)downloadToken
{
  return self->_downloadToken;
}

- (void)setDownloadToken:(id)a3
{
  objc_storeStrong((id *)&self->_downloadToken, a3);
}

- (VUIStoreFPSKeyLoader)storeFPSKeyLoader
{
  return self->_storeFPSKeyLoader;
}

- (void)setStoreFPSKeyLoader:(id)a3
{
  objc_storeStrong((id *)&self->_storeFPSKeyLoader, a3);
}

- (int64_t)playbackType
{
  return self->_playbackType;
}

- (void)setPlaybackType:(int64_t)a3
{
  self->_playbackType = a3;
}

- (NSURL)playbackURL
{
  return self->_playbackURL;
}

- (void)setPlaybackURL:(id)a3
{
  objc_storeStrong((id *)&self->_playbackURL, a3);
}

- (VUIStoreDownloadMonitor)downloadMonitor
{
  return self->_downloadMonitor;
}

- (void)setDownloadMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_downloadMonitor, a3);
}

- (BOOL)needsRentalCheckin
{
  return self->_needsRentalCheckin;
}

- (void)setNeedsRentalCheckin:(BOOL)a3
{
  self->_needsRentalCheckin = a3;
}

- (NSObject)parentReportingToken
{
  return self->_parentReportingToken;
}

- (void)setParentReportingToken:(id)a3
{
  objc_storeStrong((id *)&self->_parentReportingToken, a3);
}

- (NSError)fpsKeyError
{
  return self->_fpsKeyError;
}

- (void)setFpsKeyError:(id)a3
{
  objc_storeStrong((id *)&self->_fpsKeyError, a3);
}

- (BOOL)needsRentalCheckoutPriorToPlayback
{
  return self->_needsRentalCheckoutPriorToPlayback;
}

- (void)setNeedsRentalCheckoutPriorToPlayback:(BOOL)a3
{
  self->_needsRentalCheckoutPriorToPlayback = a3;
}

- (VUIVideoManagedObject)videoManagedObject
{
  return self->_videoManagedObject;
}

- (void)setVideoManagedObject:(id)a3
{
  objc_storeStrong((id *)&self->_videoManagedObject, a3);
}

- (BOOL)isForStartingDownload
{
  return self->_isForStartingDownload;
}

- (void)setIsForStartingDownload:(BOOL)a3
{
  self->_isForStartingDownload = a3;
}

- (BOOL)useSidebandLibraryForPlaybackKeys
{
  return self->_useSidebandLibraryForPlaybackKeys;
}

- (void)setUseSidebandLibraryForPlaybackKeys:(BOOL)a3
{
  self->_useSidebandLibraryForPlaybackKeys = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoManagedObject, 0);
  objc_storeStrong((id *)&self->_fpsKeyError, 0);
  objc_storeStrong((id *)&self->_parentReportingToken, 0);
  objc_storeStrong((id *)&self->_downloadMonitor, 0);
  objc_storeStrong((id *)&self->_playbackURL, 0);
  objc_storeStrong((id *)&self->_storeFPSKeyLoader, 0);
  objc_storeStrong((id *)&self->_downloadToken, 0);
  objc_storeStrong((id *)&self->_downloadDestinationURL, 0);
  objc_storeStrong((id *)&self->_fileSize, 0);
  objc_storeStrong((id *)&self->_sinfsDict, 0);
  objc_storeStrong((id *)&self->_hlsPlaybackURL, 0);
  objc_storeStrong((id *)&self->_fpsAdditionalServerParams, 0);
  objc_storeStrong((id *)&self->_fpsKeyServerURL, 0);
  objc_storeStrong((id *)&self->_fpsCertificateURL, 0);
}

- (void)mediaItemMetadataForProperty:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6_14();
  OUTLINED_FUNCTION_1_10(&dword_1D96EE000, MEMORY[0x1E0C81028], v0, "Unable to deserialize qosMetrics: %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4_9();
}

- (void)mediaItemMetadataForProperty:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, MEMORY[0x1E0C81028], a3, "qosMetrics is not a dictionary", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_14();
}

- (void)setMediaItemMetadata:forProperty:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6_14();
  OUTLINED_FUNCTION_1_10(&dword_1D96EE000, MEMORY[0x1E0C81028], v0, "Unable to serialize qosMetrics data: %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4_9();
}

- (void)processFinishedDownloadWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_14();
  OUTLINED_FUNCTION_1_10(&dword_1D96EE000, v0, v1, "Error processings sinfs: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_9();
}

- (void)processFinishedDownloadWithCompletion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_14();
  OUTLINED_FUNCTION_1_10(&dword_1D96EE000, v0, v1, "Error renaming file URL: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_9();
}

- (void)_offlineKeyDataForKeyRequest:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_14();
  OUTLINED_FUNCTION_1_10(&dword_1D96EE000, v0, v1, "Unable to unarchive offline key data: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_9();
}

@end
