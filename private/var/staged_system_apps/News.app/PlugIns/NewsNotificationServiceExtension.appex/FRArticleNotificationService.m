@implementation FRArticleNotificationService

- (FRArticleNotificationService)init
{
  FRArticleNotificationService *v2;
  FRArticleNotificationFeedPersonalizerFactory *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  FRArticleNotificationPersonalizer *v9;
  FRArticleNotificationPersonalizer *personalizer;
  FRArticleNotificationPostProcessingCoordinator *v11;
  FRArticleNotificationPostProcessingCoordinator *postProcessCoordinator;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)FRArticleNotificationService;
  v2 = -[FRArticleNotificationService init](&v14, "init");
  if (v2)
  {
    v3 = -[FRArticleNotificationFeedPersonalizerFactory initWithTranslationProvider:]([FRArticleNotificationFeedPersonalizerFactory alloc], "initWithTranslationProvider:", 0);
    v4 = FCURLForAppConfigurationMirror();
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[FCAppleAccount sharedAccount](FCAppleAccount, "sharedAccount"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "supportedContentStoreFrontID"));

    v8 = objc_msgSend(objc_alloc((Class)FCFileCoordinatedAppConfigurationManager), "initWithFileURL:storefrontID:", v5, v7);
    v9 = -[FRArticleNotificationPersonalizer initWithAppConfigurationManager:feedPersonalizerFactory:]([FRArticleNotificationPersonalizer alloc], "initWithAppConfigurationManager:feedPersonalizerFactory:", v8, v3);
    personalizer = v2->_personalizer;
    v2->_personalizer = v9;

    v11 = objc_alloc_init(FRArticleNotificationPostProcessingCoordinator);
    postProcessCoordinator = v2->_postProcessCoordinator;
    v2->_postProcessCoordinator = v11;

  }
  return v2;
}

- (BOOL)supportsHandling:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "content"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", FCNotificationPayloadApsKey));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", FCNotificationPayloadCategoryKey));
  LOBYTE(v4) = objc_msgSend(v6, "isEqualToString:", FCNotificationArticleCategory);

  return (char)v4;
}

- (void)didReceive:(id)a3 withContentHandler:(id)a4
{
  id v6;
  id v7;
  FRArticleNotificationServiceArticleSource *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  unsigned int v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  int v21;
  void *v22;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(FRArticleNotificationServiceArticleSource);
  -[FRArticleNotificationService setArticleSource:](self, "setArticleSource:", v8);

  -[FRArticleNotificationService setContentHandler:](self, "setContentHandler:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "content"));
  v10 = objc_msgSend(v9, "mutableCopy");
  -[FRArticleNotificationService setBestAttemptContent:](self, "setBestAttemptContent:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "content"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "userInfo"));
  v13 = objc_msgSend(v12, "mutableCopy");

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", FCNotificationPayloadApsKey));
  v15 = objc_msgSend(v14, "mutableCopy");

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", FCNotificationPayloadCategoryKey));
  v17 = objc_msgSend(v16, "isEqualToString:", FCNotificationArticleCategory);
  v18 = FRArticleNotificationServiceSharedLog();
  v19 = objc_claimAutoreleasedReturnValue(v18);
  v20 = v19;
  if (v17)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      LOWORD(v21) = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "extension-article category notification received.", (uint8_t *)&v21, 2u);
    }

    -[FRArticleNotificationService processDidReceiveSingleArticleNotificationRequest:withContentHandler:](self, "processDidReceiveSingleArticleNotificationRequest:withContentHandler:", v6, v7);
  }
  else
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v21 = 138412290;
      v22 = v16;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "FRArticleNotificationService cannot preprocess a notification of this category: %@", (uint8_t *)&v21, 0xCu);
    }

  }
}

- (void)processDidReceiveSingleArticleNotificationRequest:(id)a3 withContentHandler:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  unsigned __int8 v11;
  uint64_t v12;
  void *v13;
  unsigned int v14;
  unsigned int v15;
  void *v16;
  unsigned int v17;
  int v18;
  id v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  _BOOL4 v23;
  void *v24;
  _BOOL4 v25;
  id v26;
  NSObject *v27;
  const char *v28;
  void *v29;
  _BOOL4 v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  NSObject *v37;
  void *v38;
  id v39;
  NSObject *v40;
  void *v41;
  id v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  BOOL v48;
  void *v49;
  void *v50;
  _QWORD v52[5];
  id v53;
  id v54;
  BOOL v55;
  _QWORD v56[5];
  _QWORD v57[5];
  _QWORD v58[5];
  _QWORD v59[5];
  uint8_t buf[4];
  _BYTE v61[10];
  void *v62;
  _BYTE v63[10];
  __int16 v64;
  void *v65;
  __int16 v66;
  void *v67;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "content"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userInfo"));

  v50 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", FCNotificationPayloadNewsKey));
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[UNUserNotificationCenter currentNotificationCenter](UNUserNotificationCenter, "currentNotificationCenter"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "notificationSettings"));
  v9 = objc_msgSend(v8, "scheduledDeliverySetting");
  v48 = v9 == (id)2;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", FCNotificationPayloadNotificationBehaviorFlagsKey));
  v11 = objc_msgSend(v10, "intValue");

  v12 = NewsCoreUserDefaults();
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = objc_msgSend(v13, "BOOLForKey:", CFSTR("notificationEnableAssetPrefetching"));
  v15 = objc_msgSend(v13, "BOOLForKey:", CFSTR("notificationAssetPrefetchingRequiresWatch"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance"));
  v17 = objc_msgSend(v16, "isPaired");

  v18 = v11 & 1;
  v19 = FRArticleNotificationServiceSharedLog();
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67110144;
    *(_DWORD *)v61 = v14;
    *(_WORD *)&v61[4] = 1024;
    *(_DWORD *)&v61[6] = v15;
    LOWORD(v62) = 1024;
    *(_DWORD *)((char *)&v62 + 2) = v9 == (id)2;
    HIWORD(v62) = 1024;
    *(_DWORD *)v63 = v18;
    *(_WORD *)&v63[4] = 1024;
    *(_DWORD *)&v63[6] = v17;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "isAssetPrefetchingEnabled=%d, doesAssetPrefetchingRequireWatch=%d, isKettleDigestEnabled=%d, isBehaviorFlagSetToDisableFetchingKettleImage=%d, doesDeviceHaveWatchPaired=%d", buf, 0x20u);
  }

  v21 = FRArticleNotificationServiceSharedLog();
  v22 = objc_claimAutoreleasedReturnValue(v21);
  v23 = os_log_type_enabled(v22, OS_LOG_TYPE_INFO);
  if (v9 != (id)2)
  {
    if (v23)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Running Kettle-disabled logic to determine whether to fetch assets.", buf, 2u);
    }

    if ((v14 & 1) == 0)
    {
      v57[0] = _NSConcreteStackBlock;
      v57[1] = 3221225472;
      v57[2] = sub_1000054A0;
      v57[3] = &unk_100024C18;
      v57[4] = self;
      sub_1000054A0((uint64_t)v57);
      goto LABEL_40;
    }
    if (((v15 ^ 1 | v17) & 1) == 0)
    {
      v56[0] = _NSConcreteStackBlock;
      v56[1] = 3221225472;
      v56[2] = sub_10000552C;
      v56[3] = &unk_100024C18;
      v56[4] = self;
      sub_10000552C((uint64_t)v56);
      goto LABEL_40;
    }
    v26 = FRArticleNotificationServiceSharedLog();
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      goto LABEL_27;
    *(_WORD *)buf = 0;
    v28 = "Continuing with prefetch since device does have watch paired or that check is not required by config";
    goto LABEL_26;
  }
  if (v23)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Running Kettle-enabled logic to determine whether to fetch assets.", buf, 2u);
  }

  if (v18)
  {
    v59[0] = _NSConcreteStackBlock;
    v59[1] = 3221225472;
    v59[2] = sub_100005388;
    v59[3] = &unk_100024C18;
    v59[4] = self;
    sub_100005388((uint64_t)v59);
    goto LABEL_40;
  }
  if (objc_msgSend(v8, "timeSensitiveSetting") == (id)2)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "content"));
    v25 = objc_msgSend(v24, "interruptionLevel") == (id)2;

  }
  else
  {
    v25 = 0;
  }
  if (objc_msgSend(v8, "criticalAlertSetting") == (id)2)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "content"));
    v30 = objc_msgSend(v29, "interruptionLevel") == (id)3;

  }
  else
  {
    v30 = 0;
  }
  if (v30 || v25)
  {
    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472;
    v58[2] = sub_100005414;
    v58[3] = &unk_100024C18;
    v58[4] = self;
    sub_100005414((uint64_t)v58);
    goto LABEL_40;
  }
  v31 = FRArticleNotificationServiceSharedLog();
  v27 = objc_claimAutoreleasedReturnValue(v31);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    v28 = "Continuing with kettle image prefetch";
LABEL_26:
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, v28, buf, 2u);
  }
LABEL_27:

  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", FCNotificationPayloadThumbnailURLKey));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", FCNotificationPayloadPublisherLogoURLKey));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", FCNotificationPayloadPublisherLogoMaskURLKey));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", FCNotificationPayloadPublisherLogoCompactURLKey));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", FCNotificationPayloadFlintDocumentAssetURLKey));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[FRArticleNotificationService cachesDirectory](self, "cachesDirectory"));
  v36 = FRArticleNotificationServiceSharedLog();
  v37 = objc_claimAutoreleasedReturnValue(v36);
  if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "absoluteString"));
    *(_DWORD *)buf = 138413314;
    *(_QWORD *)v61 = v32;
    *(_WORD *)&v61[8] = 2112;
    v62 = v33;
    *(_WORD *)v63 = 2112;
    *(_QWORD *)&v63[2] = v47;
    v64 = 2112;
    v65 = v34;
    v66 = 2112;
    v67 = v38;
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "Fetching the thumbnail and publisherLogo using the provided URLs, thumbnailURL: %@, publisherLogoURL: %@, publisherLogoMaskURLString: %@, publisherLogoCompactURL: %@, cachesDirectory: %@", buf, 0x34u);

  }
  if (v35 && (v32 || v33 || v34))
  {
    v42 = FRArticleNotificationServiceSharedLog();
    v43 = objc_claimAutoreleasedReturnValue(v42);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[FRArticleNotificationService articleSource](self, "articleSource"));
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v61 = v44;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "Using article source %@", buf, 0xCu);

    }
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[FRArticleNotificationService articleSource](self, "articleSource"));
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_1000055B8;
    v52[3] = &unk_100024C40;
    v52[4] = self;
    v55 = v48;
    v53 = v7;
    v54 = v50;
    objc_msgSend(v45, "fetchAssetsWithCachesDirectory:thumbnailURLString:publisherLogoURLString:publisherLogoMaskURLString:publisherLogoCompactURLString:flintDocumentURLString:completion:", v35, v32, v33, v47, v34, v46, v52);

  }
  else
  {
    v39 = FRArticleNotificationServiceSharedLog();
    v40 = objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "Skipping prefetch since thumbnailURLString, publisherLogoURLString & publisherLogoCompactURLString are all nil.", buf, 2u);
    }

    v41 = (void *)objc_claimAutoreleasedReturnValue(-[FRArticleNotificationService bestAttemptContent](self, "bestAttemptContent"));
    -[FRArticleNotificationService finalizeContent:](self, "finalizeContent:", v41);

  }
LABEL_40:

}

- (id)notificationAttachmentsWithThumbnailFileURL:(id)a3 publisherLogoFileURL:(id)a4 publisherLogoMaskFileURL:(id)a5 publisherLogoCompactFileURL:(id)a6 isKettleDigestEnabled:(BOOL)a7
{
  id v10;
  id v11;
  id v12;
  void *v13;
  _UNKNOWN **v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  NSObject *v26;
  id v27;
  id v29;
  id v30;
  _QWORD v31[2];
  _QWORD v32[2];
  uint8_t buf[4];
  id v34;
  _QWORD v35[2];
  _QWORD v36[2];
  NSString *v37;
  CFStringRef v38;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v14 = &_s10Foundation11JSONDecoderC6decode_4fromxxm_AA4DataVtKSeRzlFTj_ptr;
  if (v10)
  {
    v37 = UNNotificationAttachmentOptionsTypeHintKey;
    v38 = kUTTypeJPEG;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1));
    if (!a7)
    {
      v35[0] = UNNotificationAttachmentOptionsTypeHintKey;
      v35[1] = UNNotificationAttachmentOptionsThumbnailHiddenKey;
      v36[0] = kUTTypeJPEG;
      v36[1] = &__kCFBooleanTrue;
      v16 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v36, v35, 2));

      v15 = (void *)v16;
    }
    v14 = &_s10Foundation11JSONDecoderC6decode_4fromxxm_AA4DataVtKSeRzlFTj_ptr;
    v30 = 0;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationAttachment attachmentWithIdentifier:URL:options:error:](UNNotificationAttachment, "attachmentWithIdentifier:URL:options:error:", CFSTR("thumbnail-attachment"), v10, v15, &v30));
    v18 = v30;
    if (v17)
    {
      objc_msgSend(v13, "addObject:", v17);
      v19 = FRArticleNotificationServiceSharedLog();
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v10;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Added an attachment for the thumbnail. %@", buf, 0xCu);
      }

      v14 = &_s10Foundation11JSONDecoderC6decode_4fromxxm_AA4DataVtKSeRzlFTj_ptr;
    }

  }
  if (v12)
  {
    v31[0] = UNNotificationAttachmentOptionsTypeHintKey;
    v31[1] = UNNotificationAttachmentOptionsThumbnailHiddenKey;
    v32[0] = kUTTypePNG;
    v32[1] = &__kCFBooleanTrue;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v32, v31, 2));
    v22 = v14[205];
    v29 = 0;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "attachmentWithIdentifier:URL:options:error:", CFSTR("publisherLogoCompact-attachment"), v12, v21, &v29));
    v24 = v29;
    if (v23)
    {
      objc_msgSend(v13, "addObject:", v23);
      v25 = FRArticleNotificationServiceSharedLog();
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v11;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Added an attachment for the publisher COMPACT logo. %@", buf, 0xCu);
      }

    }
  }
  v27 = objc_msgSend(v13, "copy");

  return v27;
}

- (id)cachesDirectory
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  unsigned int v11;
  id v12;
  id v13;
  NSObject *v14;
  _BOOL4 v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "containerURLForSecurityApplicationGroupIdentifier:", CFSTR("group.com.apple.news")));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("Notifications")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "path"));
  v6 = FRArticleNotificationServiceSharedLog();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Using cache directory at %@", buf, 0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v9 = objc_msgSend(v8, "fileExistsAtPath:", v5);

  if ((v9 & 1) == 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v20 = 0;
    v11 = objc_msgSend(v10, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v5, 1, 0, &v20);
    v12 = v20;

    v13 = FRArticleNotificationServiceSharedLog();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
    if (v11)
    {
      if (v15)
      {
        *(_DWORD *)buf = 138412290;
        v22 = v5;
        v16 = "Created cache directory at %@";
        v17 = v14;
        v18 = 12;
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, v16, buf, v18);
      }
    }
    else if (v15)
    {
      *(_DWORD *)buf = 138412546;
      v22 = v5;
      v23 = 2112;
      v24 = v12;
      v16 = "Failed to create directory at %@ due to %@";
      v17 = v14;
      v18 = 22;
      goto LABEL_9;
    }

  }
  return v4;
}

- (void)serviceExtensionTimeWillExpire
{
  id v3;
  NSObject *v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  uint8_t v7[16];

  v3 = FRArticleNotificationServiceSharedLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "The operation took too long, serviceExtensionTimeWillExpire was called", v7, 2u);
  }

  v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[FRArticleNotificationService contentHandler](self, "contentHandler"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FRArticleNotificationService bestAttemptContent](self, "bestAttemptContent"));
  ((void (**)(_QWORD, void *))v5)[2](v5, v6);

}

- (void)finalizeContent:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  FRArticleNotificationService *v20;
  _QWORD v21[5];
  uint8_t buf[16];
  _QWORD v23[6];
  id v24;

  v4 = a3;
  v5 = objc_msgSend(v4, "mutableCopy");
  -[FRArticleNotificationService setBestAttemptContent:](self, "setBestAttemptContent:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", FCNotificationPayloadNewsKey));

  v8 = objc_msgSend(objc_alloc((Class)FCNotificationArticleHeadline), "initWithArticlePayload:sourceChannel:assetManager:", v7, 0, 0);
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", FCNotificationPayloadNotificationBehaviorFlagsKey));
    v10 = objc_msgSend(v9, "intValue");

    if ((v10 & 2) != 0)
    {
      v13 = FRArticleNotificationServiceSharedLog();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Skipping personalizer to assign highest score.", buf, 2u);
      }

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[FRArticleNotificationService bestAttemptContent](self, "bestAttemptContent"));
      objc_msgSend(v15, "setRelevanceScore:", 1.0);

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[FRArticleNotificationService postProcessCoordinator](self, "postProcessCoordinator"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[FRArticleNotificationService bestAttemptContent](self, "bestAttemptContent"));
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_1000060AC;
      v21[3] = &unk_100024C18;
      v21[4] = self;
      objc_msgSend(v16, "notificationArrived:completionHandler:", v17, v21);

    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[FRArticleNotificationService personalizer](self, "personalizer"));
      v24 = v8;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v24, 1));
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100006164;
      v18[3] = &unk_100024C90;
      v19 = v8;
      v20 = self;
      objc_msgSend(v11, "sortItems:completion:", v12, v18);

    }
  }
  else
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100006024;
    v23[3] = &unk_100024C68;
    v23[4] = self;
    v23[5] = v4;
    sub_100006024((uint64_t)v23);
  }

}

- (id)contentHandler
{
  return self->_contentHandler;
}

- (void)setContentHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (UNMutableNotificationContent)bestAttemptContent
{
  return self->_bestAttemptContent;
}

- (void)setBestAttemptContent:(id)a3
{
  objc_storeStrong((id *)&self->_bestAttemptContent, a3);
}

- (FRArticleNotificationServiceArticleSource)articleSource
{
  return self->_articleSource;
}

- (void)setArticleSource:(id)a3
{
  objc_storeStrong((id *)&self->_articleSource, a3);
}

- (FRArticleNotificationPersonalizer)personalizer
{
  return self->_personalizer;
}

- (void)setPersonalizer:(id)a3
{
  objc_storeStrong((id *)&self->_personalizer, a3);
}

- (FRArticleNotificationPostProcessingCoordinator)postProcessCoordinator
{
  return self->_postProcessCoordinator;
}

- (void)setPostProcessCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_postProcessCoordinator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postProcessCoordinator, 0);
  objc_storeStrong((id *)&self->_personalizer, 0);
  objc_storeStrong((id *)&self->_articleSource, 0);
  objc_storeStrong((id *)&self->_bestAttemptContent, 0);
  objc_storeStrong(&self->_contentHandler, 0);
}

@end
