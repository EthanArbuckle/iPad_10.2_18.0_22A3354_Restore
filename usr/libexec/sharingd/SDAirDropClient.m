@implementation SDAirDropClient

- (SDAirDropClient)initWithPerson:(__SFNode *)a3 items:(id)a4 forDiscovery:(BOOL)a5
{
  id v9;
  SDAirDropClient *v10;
  SDAirDropClient *v11;
  NSURLResponse *askResponse;
  NSURLSessionUploadTask *askTask;
  NSString *clientBundleID;
  NSString *connectionKey;
  uint64_t v16;
  NSProgress *conversionProgress;
  NSDictionary *discoveryMetrics;
  NSURLResponse *discoverResponse;
  NSURLSessionUploadTask *discoverTask;
  NSMutableArray *v21;
  NSMutableArray *filesToCleanup;
  NSMutableArray *v23;
  NSMutableArray *fileURLs;
  NSMutableDictionary *v25;
  NSMutableDictionary *fileURLToConversionNeeded;
  NSMutableSet *v27;
  NSMutableSet *generatedFiles;
  NSMutableArray *v29;
  NSMutableArray *mediaFormatConversionDestinations;
  id AssociatedObject;
  uint64_t v32;
  SDAirDropPeerMetric *metric;
  uint64_t v34;
  SDStatusMonitor *monitor;
  NSMutableArray *v36;
  NSMutableArray *otherStuff;
  NSProgress *progress;
  NSMutableDictionary *v39;
  NSMutableDictionary *properties;
  NSMutableData *v41;
  NSMutableData *receiverData;
  SDBonjourResolver *resolver;
  NSURL *serverURL;
  NSProgress *v45;
  NSProgress *transferProgress;
  NSURLResponse *uploadResponse;
  NSURLSessionUploadTask *uploadTask;
  SDAirDropFileZipper *zipper;
  SDXPCHelperConnection *v50;
  SDXPCHelperConnection *xpcHelperConnection;
  SDXPCHelperConnection *v52;
  SDAirDropClient *v53;
  _QWORD v55[5];
  objc_super v56;

  v9 = a4;
  v56.receiver = self;
  v56.super_class = (Class)SDAirDropClient;
  v10 = -[SDAirDropClient init](&v56, "init");
  v11 = v10;
  if (v10)
  {
    askResponse = v10->_askResponse;
    v10->_askResponse = 0;

    askTask = v11->_askTask;
    v11->_askTask = 0;

    clientBundleID = v11->_clientBundleID;
    v11->_clientBundleID = 0;

    v11->_clientPid = 0;
    connectionKey = v11->_connectionKey;
    v11->_connectionKey = 0;

    v16 = objc_claimAutoreleasedReturnValue(+[NSProgress discreteProgressWithTotalUnitCount:](NSProgress, "discreteProgressWithTotalUnitCount:", 0));
    conversionProgress = v11->_conversionProgress;
    v11->_conversionProgress = (NSProgress *)v16;

    objc_storeWeak((id *)&v11->_delegate, 0);
    v11->_discover = a5;
    discoveryMetrics = v11->_discoveryMetrics;
    v11->_discoveryMetrics = (NSDictionary *)&__NSDictionary0__struct;

    discoverResponse = v11->_discoverResponse;
    v11->_discoverResponse = 0;

    discoverTask = v11->_discoverTask;
    v11->_discoverTask = 0;

    v11->_failCount = 0;
    v11->_fileIcon = 0;
    v21 = objc_opt_new(NSMutableArray);
    filesToCleanup = v11->_filesToCleanup;
    v11->_filesToCleanup = v21;

    v23 = objc_opt_new(NSMutableArray);
    fileURLs = v11->_fileURLs;
    v11->_fileURLs = v23;

    v25 = objc_opt_new(NSMutableDictionary);
    fileURLToConversionNeeded = v11->_fileURLToConversionNeeded;
    v11->_fileURLToConversionNeeded = v25;

    v27 = objc_opt_new(NSMutableSet);
    generatedFiles = v11->_generatedFiles;
    v11->_generatedFiles = v27;

    v11->_identity = 0;
    objc_storeStrong((id *)&v11->_items, a4);
    v11->_lastEvent = 1;
    v29 = objc_opt_new(NSMutableArray);
    mediaFormatConversionDestinations = v11->_mediaFormatConversionDestinations;
    v11->_mediaFormatConversionDestinations = v29;

    AssociatedObject = objc_getAssociatedObject(a3, CFSTR("SDAirDropPeerMetric"));
    v32 = objc_claimAutoreleasedReturnValue(AssociatedObject);
    metric = v11->_metric;
    v11->_metric = (SDAirDropPeerMetric *)v32;

    v34 = objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
    monitor = v11->_monitor;
    v11->_monitor = (SDStatusMonitor *)v34;

    v36 = objc_opt_new(NSMutableArray);
    otherStuff = v11->_otherStuff;
    v11->_otherStuff = v36;

    v11->_p2pRetained = 0;
    v11->_person = (__SFNode *)SFNodeCreateCopy(0, a3);
    v11->_personAdded = 0;
    v11->_powerAssertionID = 0;
    progress = v11->_progress;
    v11->_progress = 0;

    v39 = objc_opt_new(NSMutableDictionary);
    properties = v11->_properties;
    v11->_properties = v39;

    v11->_providedStream = 0;
    objc_storeStrong((id *)&v11->_queue, &_dispatch_main_q);
    v11->_queueSuspended = 0;
    v41 = objc_opt_new(NSMutableData);
    receiverData = v11->_receiverData;
    v11->_receiverData = v41;

    resolver = v11->_resolver;
    v11->_resolver = 0;

    serverURL = v11->_serverURL;
    *(_OWORD *)&v11->_serverTrust = 0u;

    v11->_shouldPublishProgress = 1;
    v11->_transactionStarted = 0;
    *(_OWORD *)&v11->_smallFileIcon = 0u;
    v45 = (NSProgress *)objc_alloc_init((Class)NSProgress);
    transferProgress = v11->_transferProgress;
    v11->_transferProgress = v45;

    v11->_uploadFinished = 0;
    uploadResponse = v11->_uploadResponse;
    v11->_uploadResponse = 0;

    uploadTask = v11->_uploadTask;
    v11->_uploadTask = 0;

    zipper = v11->_zipper;
    v11->_zipper = 0;

    v11->_zipperFinished = 0;
    -[SDAirDropClient addObservers](v11, "addObservers");
    v50 = -[SDXPCHelperConnection initWithQueue:]([SDXPCHelperConnection alloc], "initWithQueue:", 0);
    xpcHelperConnection = v11->_xpcHelperConnection;
    v11->_xpcHelperConnection = v50;

    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472;
    v55[2] = sub_100065944;
    v55[3] = &unk_1007146D8;
    v55[4] = v11;
    v52 = v11->_xpcHelperConnection;
    v53 = v11;
    -[SDXPCHelperConnection setInvalidationHandler:](v52, "setInvalidationHandler:", v55);

  }
  return v11;
}

- (void)dealloc
{
  SDXPCHelperConnection *xpcHelperConnection;
  __SecIdentity *identity;
  CGImage *fileIcon;
  __SecTrust *serverTrust;
  CGImage *smallFileIcon;
  NSURL *tmpDirectoryToCleanUp;
  objc_super v9;

  -[SDXPCHelperConnection invalidate](self->_xpcHelperConnection, "invalidate");
  xpcHelperConnection = self->_xpcHelperConnection;
  self->_xpcHelperConnection = 0;

  if (self->_shouldPublishProgress)
    -[NSProgress _unpublish](self->_progress, "_unpublish");
  if (self->_conversionObserver)
    -[NSProgress removeObserver:forKeyPath:](self->_conversionProgress, "removeObserver:forKeyPath:", self, CFSTR("fractionCompleted"));
  -[SDAirDropClient removeObservers](self, "removeObservers");
  identity = self->_identity;
  if (identity)
    CFRelease(identity);
  fileIcon = self->_fileIcon;
  if (fileIcon)
    CFRelease(fileIcon);
  serverTrust = self->_serverTrust;
  if (serverTrust)
    CFRelease(serverTrust);
  smallFileIcon = self->_smallFileIcon;
  if (smallFileIcon)
    CFRelease(smallFileIcon);
  tmpDirectoryToCleanUp = self->_tmpDirectoryToCleanUp;
  if (tmpDirectoryToCleanUp)
    sub_10019BB20(tmpDirectoryToCleanUp);
  CFRelease(self->_person);
  v9.receiver = self;
  v9.super_class = (Class)SDAirDropClient;
  -[SDAirDropClient dealloc](&v9, "dealloc");
}

- (void)systemWillSleep:(id)a3
{
  id v4;
  id v5;

  v4 = sub_10005081C(-8, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue(v4);
  -[SDAirDropClient notifyClientForEvent:withProperty:](self, "notifyClientForEvent:withProperty:", 10, v5);

}

- (void)wirelessPowerChanged:(id)a3
{
  id v4;
  id v5;

  if (!-[SDStatusMonitor wirelessEnabled](self->_monitor, "wirelessEnabled", a3))
  {
    v4 = sub_10005081C(-7, 0);
    v5 = (id)objc_claimAutoreleasedReturnValue(v4);
    -[SDAirDropClient notifyClientForEvent:withProperty:](self, "notifyClientForEvent:withProperty:", 10, v5);

  }
}

- (void)addObservers
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "systemWillSleep:", CFSTR("com.apple.sharingd.SystemWillSleep"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "wirelessPowerChanged:", CFSTR("com.apple.sharingd.WirelessPowerChanged"), 0);

}

- (void)removeObservers
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

}

- (BOOL)requireAWDL
{
  if (-[SDStatusMonitor forceAWDL](self->_monitor, "forceAWDL"))
    return 1;
  else
    return !-[SDStatusMonitor browseAllInterfaces](self->_monitor, "browseAllInterfaces");
}

- (void)createSession
{
  void *v3;
  NSMutableDictionary *v4;
  const __CFString *v5;
  uint64_t v6;
  double v7;
  void *v8;
  void *v9;
  NSURLSession *v10;
  NSURLSession *session;
  const __CFString *v12;
  const __CFString *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSessionConfiguration ephemeralSessionConfiguration](NSURLSessionConfiguration, "ephemeralSessionConfiguration"));
  v4 = objc_opt_new(NSMutableDictionary);
  if (!sub_10019CA64() && !-[SDStatusMonitor enableDemoMode](self->_monitor, "enableDemoMode"))
  {
    if (-[SDAirDropClient requireAWDL](self, "requireAWDL"))
    {
      v5 = CFSTR("awdl0");
      v6 = kCFStreamPropertyBoundInterfaceIdentifier;
    }
    else
    {
      v6 = _kCFStreamPropertyProhibitInfraWiFi;
      v5 = (const __CFString *)&__kCFBooleanTrue;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v5, v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, _kCFStreamPropertyDNSIncludeAWDL);
  }
  if (!self->_discover)
    objc_msgSend(v3, "set_sourceApplicationSecondaryIdentifier:", CFSTR("com.apple.airdrop"));
  objc_msgSend(v3, "set_socketStreamProperties:", v4);
  v7 = 120.0;
  if (self->_discover)
    v7 = 15.0;
  objc_msgSend(v3, "setTimeoutIntervalForRequest:", v7);
  objc_msgSend(v3, "setRequestCachePolicy:", 1);
  objc_msgSend(v3, "set_connectionCachePurgeTimeout:", 86400.0);
  objc_msgSend(v3, "setConnectionProxyDictionary:", &__NSDictionary0__struct);
  if (!-[SDStatusMonitor disablePipelining](self->_monitor, "disablePipelining") && sub_10004FFC4())
  {
    objc_msgSend(v3, "setHTTPMaximumConnectionsPerHost:", 1);
    objc_msgSend(v3, "setHTTPShouldUsePipelining:", 1);
  }
  objc_msgSend(v3, "set_allowsTCPFastOpen:", 0);
  objc_msgSend(v3, "setTLSMaximumSupportedProtocol:", 10);
  v12 = CFSTR("User-Agent");
  v13 = CFSTR("AirDrop/1.0");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
  objc_msgSend(v3, "setHTTPAdditionalHeaders:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
  v10 = (NSURLSession *)objc_claimAutoreleasedReturnValue(+[NSURLSession sessionWithConfiguration:delegate:delegateQueue:](NSURLSession, "sessionWithConfiguration:delegate:delegateQueue:", v3, self, v9));
  session = self->_session;
  self->_session = v10;

}

- (double)getTransferRate
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", kSFOperationTotalBytesKey));
  v4 = v3;
  if (v3)
  {
    v5 = (double)(uint64_t)objc_msgSend(v3, "longLongValue");
    v6 = v5 / (CFAbsoluteTimeGetCurrent() - self->_startTime);
  }
  else
  {
    v6 = -1.0;
  }

  return v6;
}

- (double)getTransferSize
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", kSFOperationTotalBytesKey));
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = -1.0;
  }

  return v5;
}

- (void)releaseIdleSleepAssertion
{
  uint64_t v3;
  NSObject *v4;
  unsigned int powerAssertionID;
  unsigned int v6;
  dispatch_time_t v7;
  NSObject *queue;
  OS_os_transaction *transaction;
  _QWORD block[4];
  unsigned int v11;
  uint8_t buf[4];
  unsigned int v13;

  if (self->_powerAssertionID)
  {
    v3 = airdrop_log(self);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      powerAssertionID = self->_powerAssertionID;
      *(_DWORD *)buf = 67109120;
      v13 = powerAssertionID;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Power assertion released (%d)", buf, 8u);
    }

    v6 = self->_powerAssertionID;
    self->_powerAssertionID = 0;
    v7 = sub_10019AAC0(3.0);
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100066020;
    block[3] = &unk_100715630;
    v11 = v6;
    dispatch_after(v7, queue, block);
  }
  transaction = self->_transaction;
  self->_transaction = 0;

}

- (void)notifyClientForEvent:(int64_t)a3 withProperty:(void *)a4
{
  unint64_t lastEvent;
  BOOL v5;
  uint64_t v6;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  double v13;
  SDAirDropClient *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSProgress *transferProgress;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  double v22;
  double v23;
  NSProgress *progress;
  void *v25;
  NSString *clientBundleID;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  NSString *v36;
  void *v37;
  double v38;
  double v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  NSObject *v43;
  const void *v44;
  CFErrorDomain Domain;
  uint64_t v46;
  id v47;
  void *v48;
  NSProgress *v49;
  void *v50;
  void *v51;
  id WeakRetained;

  lastEvent = self->_lastEvent;
  v5 = lastEvent > 0xA;
  v6 = (1 << lastEvent) & 0x610;
  if (v5 || v6 == 0)
  {
    v11 = objc_opt_new(NSMutableDictionary);
    v12 = v11;
    switch(a3)
    {
      case 3:
        -[NSMutableDictionary addEntriesFromDictionary:](v11, "addEntriesFromDictionary:", self->_properties);
        if (self->_shouldPublishProgress)
        {
          -[NSProgress setSf_transferState:](self->_progress, "setSf_transferState:", 2);
          v13 = 0.0;
          v14 = self;
          v15 = 3;
          goto LABEL_35;
        }
        break;
      case 4:
        -[NSMutableDictionary addEntriesFromDictionary:](v11, "addEntriesFromDictionary:", self->_properties);
        if (self->_shouldPublishProgress)
        {
          -[NSProgress setSf_transferState:](self->_progress, "setSf_transferState:", 4);
          -[SDAirDropClient postNotificationForTransferStatus:progress:](self, "postNotificationForTransferStatus:progress:", 4, 0.0);
        }
        v16 = (void *)SFNodeCopyKinds(self->_person);
        if (objc_msgSend(v16, "containsObject:", kSFNodeKindClassroom))
          -[SDAirDropClient cancelSendingClassroom](self, "cancelSendingClassroom");
        else
          -[SDAirDropClient invalidate](self, "invalidate");

        break;
      case 5:
        -[NSMutableDictionary addEntriesFromDictionary:](v11, "addEntriesFromDictionary:", self->_properties);
        if (self->_shouldPublishProgress)
        {
          -[NSProgress setSf_transferState:](self->_progress, "setSf_transferState:", 3);
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", kSFOperationTotalBytesKey));
          -[NSProgress setTotalUnitCount:](self->_transferProgress, "setTotalUnitCount:", objc_msgSend(v17, "longLongValue"));

          transferProgress = self->_transferProgress;
          goto LABEL_38;
        }
        break;
      case 7:
        v19 = kSFOperationBytesCopiedKey;
        -[SDAirDropClient storePropertyValue:forKey:](self, "storePropertyValue:forKey:", a4, kSFOperationBytesCopiedKey);
        v20 = kSFOperationTimeRemainingKey;
        -[SDAirDropClient storePropertyValue:forKey:](self, "storePropertyValue:forKey:", a4, kSFOperationTimeRemainingKey);
        if (a4)
          sub_1000500BC((__CFDictionary *)self->_properties, (CFDictionaryRef)a4);
        -[NSMutableDictionary addEntriesFromDictionary:](v12, "addEntriesFromDictionary:", self->_properties);
        if (self->_shouldPublishProgress)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", v19));
          -[NSProgress setCompletedUnitCount:](self->_transferProgress, "setCompletedUnitCount:", objc_msgSend(v21, "longLongValue"));

          LODWORD(v21) = self->_conversionNotified;
          -[NSProgress fractionCompleted](self->_transferProgress, "fractionCompleted");
          v23 = v22 * 100.0;
          if ((_DWORD)v21)
            v23 = v23 * 0.8 + 20.0;
          -[NSProgress setCompletedUnitCount:](self->_progress, "setCompletedUnitCount:", (uint64_t)v23);
          progress = self->_progress;
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", v20));
          -[NSProgress setUserInfoObject:forKey:](progress, "setUserInfoObject:forKey:", v25, NSProgressEstimatedTimeRemainingKey);

          v13 = (double)-[NSProgress completedUnitCount](self->_progress, "completedUnitCount");
          v14 = self;
          v15 = 7;
          goto LABEL_35;
        }
        break;
      case 9:
        -[SDAirDropClient setSpotlightMetadata:](self, "setSpotlightMetadata:", self->_fileURLs);
        -[NSMutableDictionary addEntriesFromDictionary:](v12, "addEntriesFromDictionary:", self->_properties);
        if (!self->_discover)
        {
          -[SDAirDropClient donateTransferInteractionToDuet](self, "donateTransferInteractionToDuet");
          clientBundleID = self->_clientBundleID;
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", kSFOperationReceiverModelNameKey));
          -[SDAirDropClient getTransferRate](self, "getTransferRate");
          v29 = v28;
          -[SDAirDropClient getTransferSize](self, "getTransferSize");
          v31 = v30;
          v32 = -[SDStatusMonitor discoverableLevel](self->_monitor, "discoverableLevel");
          v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", kSFOperationFromShareSheet));
          sub_1000443E0(clientBundleID, v27, 1, v32, (uint64_t)objc_msgSend(v33, "BOOLValueSafe"), self->_discoveryMetrics, v29, v31);

          sub_100044AF8(1, -[NSArray count](self->_items, "count"));
          v34 = (void *)objc_claimAutoreleasedReturnValue(+[SDServerBrowser sharedBrowser](SDServerBrowser, "sharedBrowser"));
          objc_msgSend(v34, "incrementTransfersCompleted");

        }
        if (self->_shouldPublishProgress)
        {
          -[NSProgress setSf_transferState:](self->_progress, "setSf_transferState:", 6);
          v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSProgress sf_personRealName](self->_progress, "sf_personRealName"));

          if (v35)
          {
            v13 = 0.0;
            v14 = self;
            v15 = 9;
            goto LABEL_35;
          }
        }
        break;
      case 10:
        if (!self->_discover)
        {
          v36 = self->_clientBundleID;
          v37 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", kSFOperationReceiverModelNameKey));
          -[SDAirDropClient getTransferSize](self, "getTransferSize");
          v39 = v38;
          v40 = -[SDStatusMonitor discoverableLevel](self->_monitor, "discoverableLevel");
          v41 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", kSFOperationFromShareSheet));
          sub_100044784(v36, v37, 1, (__CFError *)a4, v40, objc_msgSend(v41, "BOOLValueSafe"), self->_discoveryMetrics, v39);

        }
        v42 = airdrop_log(v11);
        v43 = objc_claimAutoreleasedReturnValue(v42);
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          sub_10006D058();

        v44 = (const void *)kCFErrorDomainSFOperation;
        Domain = CFErrorGetDomain((CFErrorRef)a4);
        if (CFEqual(v44, Domain))
        {
          v46 = kSFOperationErrorKey;
          -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", a4, kSFOperationErrorKey);
        }
        else
        {
          v47 = sub_10005081C(-1, a4);
          v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
          v46 = kSFOperationErrorKey;
          -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v48, kSFOperationErrorKey);

        }
        -[NSMutableDictionary addEntriesFromDictionary:](v12, "addEntriesFromDictionary:", self->_properties);
        if (self->_shouldPublishProgress)
        {
          v49 = self->_progress;
          v50 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", v46));
          v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "localizedDescription"));
          -[NSProgress sf_failedWithError:](v49, "sf_failedWithError:", v51);

          -[SDAirDropClient postNotificationForTransferStatus:progress:](self, "postNotificationForTransferStatus:progress:", 10, 0.0);
        }
        -[SDAirDropClient invalidate](self, "invalidate");
        break;
      case 11:
        if (self->_shouldPublishProgress)
        {
          -[NSProgress setSf_transferState:](self->_progress, "setSf_transferState:", 2);
          v13 = 0.0;
          v14 = self;
          v15 = 11;
LABEL_35:
          -[SDAirDropClient postNotificationForTransferStatus:progress:](v14, "postNotificationForTransferStatus:progress:", v15, v13);
        }
        break;
      case 14:
        break;
      case 15:
        if (self->_shouldPublishProgress)
        {
          -[NSProgress setSf_transferState:](self->_progress, "setSf_transferState:", 1);
          transferProgress = self->_progress;
LABEL_38:
          -[NSProgress setCompletedUnitCount:](transferProgress, "setCompletedUnitCount:", 0);
        }
        break;
      default:
        -[NSMutableDictionary addEntriesFromDictionary:](v11, "addEntriesFromDictionary:", self->_properties);
        break;
    }
    self->_lastEvent = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "airDropClient:event:withResults:", self, a3, v12);

  }
}

- (void)postNotificationForTransferStatus:(int64_t)a3 progress:(double)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  _QWORD v16[4];

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSProgress sf_personRealName](self->_progress, "sf_personRealName"));
  v8 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", kSFOperationSessionIDKey));
  v9 = (void *)v8;
  if (v6)
    v10 = v7 == 0;
  else
    v10 = 1;
  if (!v10 && v8 != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v15[0] = CFSTR("TransferProgress");
    v15[1] = CFSTR("RealName");
    v16[0] = v6;
    v16[1] = v7;
    v16[2] = v9;
    v15[2] = CFSTR("SessionID");
    v15[3] = CFSTR("TransferText");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", a3));
    v16[3] = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v15, 4));
    objc_msgSend(v12, "postNotificationName:object:userInfo:", CFSTR("TransferUpdated"), self, v14);

  }
}

- (void)didStartSendingAskBodyData
{
  if (-[SDStatusMonitor disableTLS](self->_monitor, "disableTLS"))
    -[SDAirDropClient notifyClientForEvent:withProperty:](self, "notifyClientForEvent:withProperty:", 3, 0);
  if (-[NSMutableArray count](self->_fileURLs, "count")
    && !-[SDStatusMonitor disablePipelining](self->_monitor, "disablePipelining"))
  {
    if (sub_10004FFC4())
      -[SDAirDropClient startZipping](self, "startZipping");
  }
}

- (void)didFinishSendingAskBodyData
{
  if (!-[NSMutableArray count](self->_fileURLs, "count"))
    -[SDAirDropClient releaseIdleSleepAssertion](self, "releaseIdleSleepAssertion");
}

- (id)whereFromInfo
{
  NSMutableArray *v3;
  void *v4;
  void *v5;

  v3 = objc_opt_new(NSMutableArray);
  v4 = (void *)SFNodeCopyDisplayName(self->_person);
  v5 = (void *)SFNodeCopyComputerName(self->_person);
  if (v4)
    -[NSMutableArray addObject:](v3, "addObject:", v4);
  if (v5 && (objc_msgSend(v4, "isEqualToString:", v5) & 1) == 0)
    -[NSMutableArray addObject:](v3, "addObject:", v5);

  return v3;
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v9;
  void (**v10)(id, uint64_t);
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  const __CFURL *v15;
  CFStringRef v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  const char *v23;
  NSErrorDomain v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;

  v9 = a5;
  v10 = (void (**)(id, uint64_t))a6;
  v11 = (uint64_t)objc_msgSend(v9, "statusCode");
  v12 = v11;
  if (v11 <= 400)
  {
    if (v11 != 200 && v11 != 204)
    {
      if (v11 != 400)
        goto LABEL_20;
      goto LABEL_26;
    }
    v15 = (const __CFURL *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "URL"));
    v16 = CFURLCopyStrictPath(v15, 0);

    if (!v16)
    {
      v28 = airdrop_log(v17);
      v29 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        sub_10006D118();

LABEL_26:
      v24 = NSPOSIXErrorDomain;
      v25 = 94;
      goto LABEL_27;
    }
    v18 = CFEqual(v16, CFSTR("Discover"));
    if ((_DWORD)v18)
    {
      if (v12 == 200)
      {
        objc_storeStrong((id *)&self->_discoverResponse, a5);
        v20 = airdrop_log(v19);
        v21 = objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropClient personID](self, "personID"));
          LODWORD(v41) = 138412290;
          *(_QWORD *)((char *)&v41 + 4) = v22;
          v23 = "Got Discover response from %@";
LABEL_39:
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v23, (uint8_t *)&v41, 0xCu);

          goto LABEL_40;
        }
        goto LABEL_40;
      }
      v34 = airdrop_log(v18);
      v35 = objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        sub_10006D19C();
    }
    else
    {
      v31 = CFEqual(v16, CFSTR("Ask"));
      if ((_DWORD)v31)
      {
        if (v12 == 200)
        {
          -[SDAirDropClient logInterfaceUsedForSending:](self, "logInterfaceUsedForSending:", v9);
          objc_storeStrong((id *)&self->_askResponse, a5);
          v33 = airdrop_log(v32);
          v21 = objc_claimAutoreleasedReturnValue(v33);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            v22 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropClient personID](self, "personID"));
            LODWORD(v41) = 138412290;
            *(_QWORD *)((char *)&v41 + 4) = v22;
            v23 = "Got Ask response from %@";
            goto LABEL_39;
          }
LABEL_40:

          v30 = 0;
          goto LABEL_46;
        }
        v39 = airdrop_log(v31);
        v35 = objc_claimAutoreleasedReturnValue(v39);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          sub_10006D170();
      }
      else
      {
        v36 = CFEqual(v16, CFSTR("Upload"));
        if ((_DWORD)v36)
        {
          objc_storeStrong((id *)&self->_uploadResponse, a5);
          v38 = airdrop_log(v37);
          v21 = objc_claimAutoreleasedReturnValue(v38);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            v22 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropClient personID](self, "personID"));
            LODWORD(v41) = 138412290;
            *(_QWORD *)((char *)&v41 + 4) = v22;
            v23 = "Got Upload response from %@";
            goto LABEL_39;
          }
          goto LABEL_40;
        }
        v40 = airdrop_log(v36);
        v35 = objc_claimAutoreleasedReturnValue(v40);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          sub_10006D144();
      }
    }

    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 94, 0));
LABEL_46:
    CFRelease(v16);
    if (v30)
      goto LABEL_29;
    goto LABEL_47;
  }
  if (v11 <= 499)
  {
    if (v11 != 401)
    {
      if (v11 != 417)
        goto LABEL_20;
      goto LABEL_12;
    }
    -[SDAirDropClient notifyClientForEvent:withProperty:](self, "notifyClientForEvent:withProperty:", 4, 0);
LABEL_47:
    v10[2](v10, 1);
    goto LABEL_48;
  }
  if (v11 != 500)
  {
    if (v11 != 507)
    {
LABEL_20:
      v26 = airdrop_log(v11);
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        sub_10006D0B8();

      v24 = NSPOSIXErrorDomain;
      v25 = 100;
      goto LABEL_27;
    }
LABEL_12:
    v13 = sub_10005081C(-2, 0);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    goto LABEL_28;
  }
  v24 = NSPOSIXErrorDomain;
  v25 = 32;
LABEL_27:
  v14 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v24, v25, 0));
LABEL_28:
  v30 = (void *)v14;
  if (!v14)
    goto LABEL_47;
LABEL_29:
  -[SDAirDropClient notifyClientForEvent:withProperty:](self, "notifyClientForEvent:withProperty:", 10, v30, v41);
  v10[2](v10, 0);

LABEL_48:
}

- (void)setProperty:(id)a3 forKey:(id)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:", a3, a4);
}

- (void)storePropertyValue:(void *)a3 forKey:(__CFString *)a4
{
  CFTypeID v7;
  const __CFString *v8;
  NSMutableDictionary *properties;
  const __CFString *v10;
  CFStringRef v11;
  CFTypeID TypeID;
  uint64_t v13;
  NSObject *v14;

  v7 = CFGetTypeID(a3);
  if (CFHTTPMessageGetTypeID() == v7)
  {
    v8 = CFHTTPMessageCopyHeaderFieldValue((CFHTTPMessageRef)a3, a4);
    properties = self->_properties;
    if (v8)
    {
      v10 = v8;
      v11 = CFURLCreateStringByReplacingPercentEscapes(0, v8, &stru_10072FE60);
      sub_10019ABE0((__CFDictionary *)properties, a4, v11);
      CFRelease(v10);
    }
    else
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](properties, "setObject:forKeyedSubscript:", 0, a4);
    }
  }
  else
  {
    TypeID = CFDictionaryGetTypeID();
    if (TypeID == v7)
    {
      -[SDAirDropClient setProperty:forKey:](self, "setProperty:forKey:", CFDictionaryGetValue((CFDictionaryRef)a3, a4), a4);
    }
    else
    {
      v13 = airdrop_log(TypeID);
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        sub_10006D1C8();

    }
  }
}

- (void)storeDataValue:(__CFDictionary *)a3 forKey:(__CFString *)a4
{
  const void *Value;
  CFTypeID TypeID;
  CFTypeID v8;
  uint64_t v9;
  NSObject *v10;

  Value = CFDictionaryGetValue(a3, a4);
  if (Value && (TypeID = CFDataGetTypeID(), v8 = CFGetTypeID(Value), TypeID != v8))
  {
    v9 = airdrop_log(v8);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_10006D228();

  }
  else
  {
    -[SDAirDropClient setProperty:forKey:](self, "setProperty:forKey:", Value, a4);
  }
}

- (void)storeStringValue:(__CFDictionary *)a3 forKey:(__CFString *)a4
{
  const void *Value;
  CFTypeID TypeID;
  CFTypeID v8;
  uint64_t v9;
  NSObject *v10;

  Value = CFDictionaryGetValue(a3, a4);
  if (Value && (TypeID = CFStringGetTypeID(), v8 = CFGetTypeID(Value), TypeID != v8))
  {
    v9 = airdrop_log(v8);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_10006D288();

  }
  else
  {
    -[SDAirDropClient setProperty:forKey:](self, "setProperty:forKey:", Value, a4);
  }
}

- (BOOL)parseAskResponse:(__CFError *)a3
{
  CFTypeID v3;
  CFPropertyListRef v5;
  const void *v6;
  CFTypeID TypeID;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;

  v3 = (CFTypeID)a3;
  v5 = CFPropertyListCreateWithData(0, (CFDataRef)self->_receiverData, 0, 0, a3);
  if (v5)
  {
    v6 = v5;
    v3 = CFGetTypeID(v5);
    TypeID = CFDictionaryGetTypeID();
    LOBYTE(v3) = v3 == TypeID;
    if ((_BYTE)v3)
    {
      -[SDAirDropClient storeDataValue:forKey:](self, "storeDataValue:forKey:", v6, kSFOperationReceiverIconKey);
      -[SDAirDropClient storeDataValue:forKey:](self, "storeDataValue:forKey:", v6, kSFOperationReceiverRecordDataKey);
      -[SDAirDropClient storeStringValue:forKey:](self, "storeStringValue:forKey:", v6, kSFOperationReceiverIconHashKey);
      -[SDAirDropClient storeStringValue:forKey:](self, "storeStringValue:forKey:", v6, kSFOperationReceiverModelNameKey);
      -[SDAirDropClient storeStringValue:forKey:](self, "storeStringValue:forKey:", v6, kSFOperationReceiverComputerNameKey);
    }
    else
    {
      v10 = airdrop_log(TypeID);
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        sub_10006D34C();

    }
    CFRelease(v6);
  }
  else if (v3)
  {
    v8 = airdrop_log(0);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_10006D2E8();

    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)parseDiscoverResponse:(__CFError *)a3
{
  CFTypeID v3;
  CFPropertyListRef v5;
  const void *v6;
  CFTypeID TypeID;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;

  v3 = (CFTypeID)a3;
  v5 = CFPropertyListCreateWithData(0, (CFDataRef)self->_receiverData, 0, 0, a3);
  if (v5)
  {
    v6 = v5;
    v3 = CFGetTypeID(v5);
    TypeID = CFDictionaryGetTypeID();
    LOBYTE(v3) = v3 == TypeID;
    if ((_BYTE)v3)
    {
      -[SDAirDropClient storeDataValue:forKey:](self, "storeDataValue:forKey:", v6, kSFOperationReceiverRecordDataKey);
      -[SDAirDropClient storeDataValue:forKey:](self, "storeDataValue:forKey:", v6, kSFOperationReceiverMediaCapabilitiesKey);
      -[SDAirDropClient storeStringValue:forKey:](self, "storeStringValue:forKey:", v6, kSFOperationReceiverModelNameKey);
      -[SDAirDropClient storeStringValue:forKey:](self, "storeStringValue:forKey:", v6, kSFOperationReceiverComputerNameKey);
      -[SDAirDropClient storeDataValue:forKey:](self, "storeDataValue:forKey:", v6, kSFOperationReceiverDeviceIRKDataKey);
      -[SDAirDropClient storeDataValue:forKey:](self, "storeDataValue:forKey:", v6, kSFOperationReceiverEdPKDataKey);
      -[SDAirDropClient storeStringValue:forKey:](self, "storeStringValue:forKey:", v6, kSFOperationReceiverIDSDeviceIDKey);
      -[SDAirDropClient storeStringValue:forKey:](self, "storeStringValue:forKey:", v6, kSFOperationSendersKnownAliasKey);
    }
    else
    {
      v10 = airdrop_log(TypeID);
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        sub_10006D34C();

    }
    CFRelease(v6);
  }
  else if (v3)
  {
    v8 = airdrop_log(0);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_10006D378();

    LOBYTE(v3) = 0;
  }
  return v3;
}

- (void)notifyClientOfBytesCopied:(id)a3 timeRemaining:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  SDAirDropClient *v14;

  v6 = a3;
  v7 = a4;
  usleep(0x186A0u);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000672DC;
  block[3] = &unk_100715138;
  v12 = v6;
  v13 = v7;
  v14 = self;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (void)finishOperation
{
  dispatch_queue_global_t v3;
  NSObject *v4;
  _QWORD block[5];

  v3 = sub_10019AB98();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000673BC;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)retryRequestForError:(id)a3
{
  id v4;
  int v5;
  long double v6;
  dispatch_time_t v7;
  NSObject *queue;
  _QWORD block[5];

  v4 = a3;
  v5 = self->_failCount + 1;
  self->_failCount = v5;
  if (v5 == 10 || self->_cancelled)
  {
    -[SDAirDropClient notifyClientForEvent:withProperty:](self, "notifyClientForEvent:withProperty:", 10, v4);
  }
  else
  {
    v6 = exp((double)v5);
    v7 = dispatch_time(0, (uint64_t)(v6 * 0.125 * 1000000000.0));
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000676E8;
    block[3] = &unk_1007146D8;
    block[4] = self;
    dispatch_after(v7, queue, block);
  }

}

- (void)didFinishLoading
{
  NSURLResponse *askResponse;
  NSURLResponse *uploadResponse;
  CFTypeRef cf;

  cf = 0;
  if (self->_askResponse)
  {
    if (-[SDAirDropClient parseAskResponse:](self, "parseAskResponse:", &cf))
    {
      -[SDAirDropClient notifyClientForEvent:withProperty:](self, "notifyClientForEvent:withProperty:", 6, 0);
      if (-[NSMutableArray count](self->_fileURLs, "count"))
      {
        if (-[SDStatusMonitor disablePipelining](self->_monitor, "disablePipelining") || !sub_10004FFC4())
        {
          -[SDAirDropClient startZipping](self, "startZipping");
        }
        else if (!self->_zipperFinished)
        {
          self->_startTime = CFAbsoluteTimeGetCurrent();
          -[SDAirDropClient notifyClientForEvent:withProperty:](self, "notifyClientForEvent:withProperty:", 5, 0);
        }
      }
      else
      {
        -[SDAirDropClient finishOperation](self, "finishOperation");
      }
    }
    else
    {
      -[SDAirDropClient retryRequestForError:](self, "retryRequestForError:", cf);
      CFRelease(cf);
    }
    askResponse = self->_askResponse;
    self->_askResponse = 0;
    goto LABEL_21;
  }
  if (self->_discoverResponse)
  {
    if (-[SDAirDropClient parseDiscoverResponse:](self, "parseDiscoverResponse:", &cf))
    {
      -[SDAirDropClient notifyClientForEvent:withProperty:](self, "notifyClientForEvent:withProperty:", 9, 0);
    }
    else
    {
      -[SDAirDropClient retryRequestForError:](self, "retryRequestForError:", cf);
      CFRelease(cf);
    }
    askResponse = self->_discoverResponse;
    self->_discoverResponse = 0;
LABEL_21:

    return;
  }
  if (self->_uploadResponse)
  {
    self->_uploadFinished = 1;
    if (self->_zipperFinished)
    {
      if (self->_startTime == 0.0)
        -[SDAirDropClient finishOperation](self, "finishOperation");
      else
        -[SDAirDropClient notifyClientForEvent:withProperty:](self, "notifyClientForEvent:withProperty:", 9, 0);
    }
    uploadResponse = self->_uploadResponse;
    self->_uploadResponse = 0;

  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v6;

  -[NSMutableData appendData:](self->_receiverData, "appendData:", a5, a4);
  if (-[NSMutableData length](self->_receiverData, "length") > 0x100000)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 27, 0));
    -[SDAirDropClient notifyClientForEvent:withProperty:](self, "notifyClientForEvent:withProperty:", 10, v6);

  }
}

- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7
{
  NSURLSessionUploadTask *v12;
  id v13;

  v13 = a3;
  v12 = (NSURLSessionUploadTask *)a4;
  if (self->_askTask == v12)
  {
    if (a5 == a6)
    {
      -[SDAirDropClient didStartSendingAskBodyData](self, "didStartSendingAskBodyData");
    }
    else if (a6 >= a7)
    {
      -[SDAirDropClient didFinishSendingAskBodyData](self, "didFinishSendingAskBodyData");
    }
  }

}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "domain"));
    if (objc_msgSend(v11, "isEqual:", NSURLErrorDomain))
    {
      v12 = objc_msgSend(v10, "code");

      if (v12 == (id)-999)
        goto LABEL_8;
    }
    else
    {

    }
    -[SDAirDropClient didFail:](self, "didFail:", v10);
  }
  else
  {
    -[SDAirDropClient didFinishLoading](self, "didFinishLoading");
  }
LABEL_8:

}

- (BOOL)shouldCancelTransferForError:(id)a3
{
  id v3;
  unint64_t v4;
  void *v5;
  BOOL v6;
  BOOL v7;
  unsigned __int8 v8;

  v3 = a3;
  v4 = (unint64_t)objc_msgSend(v3, "code");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));

  if (objc_msgSend(v5, "isEqual:", kCFErrorDomainCFNetwork))
  {
    v6 = v4 == 303 || v4 == -1017;
    goto LABEL_7;
  }
  if (objc_msgSend(v5, "isEqual:", NSURLErrorDomain))
  {
    v6 = (v4 & 0xFFFFFFFFFFFFFFEFLL) == -1021;
LABEL_7:
    v7 = v6;
    goto LABEL_13;
  }
  v8 = objc_msgSend(v5, "isEqual:", NSPOSIXErrorDomain);
  if (v4 == 54)
    v7 = v8;
  else
    v7 = 0;
LABEL_13:

  return v7;
}

- (void)didFail:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;

  v4 = a3;
  v5 = SFNodeCopyServiceName(self->_person);
  v6 = (void *)v5;
  if (self->_discover
    || (v5 = -[SDAirDropClient shouldCancelTransferForError:](self, "shouldCancelTransferForError:", v4), !(_DWORD)v5))
  {
    v9 = airdrop_log(v5);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_10006D3DC();

    if (self->_discover)
    {
      -[SDAirDropClient retryRequestForError:](self, "retryRequestForError:", v4);
      goto LABEL_20;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domain"));
    if ((objc_msgSend(v11, "isEqual:", kCFErrorDomainCFNetwork) & 1) != 0
      || objc_msgSend(v11, "isEqual:", NSURLErrorDomain))
    {
      v12 = objc_msgSend(v4, "code");
      if (v12 == (id)-1004)
      {
        -[SDAirDropClient retryRequestForError:](self, "retryRequestForError:", v4);
        goto LABEL_19;
      }
      if (v12 == (id)-1202)
      {
        v13 = (void *)SFNodeCopySecondaryName(self->_person);
        if (!v13)
          v13 = (void *)SFNodeCopyDisplayName(self->_person);
        v14 = sub_10005081C(-3, v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        -[SDAirDropClient notifyClientForEvent:withProperty:](self, "notifyClientForEvent:withProperty:", 10, v15);

        goto LABEL_19;
      }
    }
    -[SDAirDropClient notifyClientForEvent:withProperty:](self, "notifyClientForEvent:withProperty:", 10, v4);
LABEL_19:

    goto LABEL_20;
  }
  v7 = airdrop_log(v5);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412546;
    v17 = v6;
    v18 = 2112;
    v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Connection to %@ canceled (%@)", (uint8_t *)&v16, 0x16u);
  }

  -[SDAirDropClient notifyClientForEvent:withProperty:](self, "notifyClientForEvent:withProperty:", 4, 0);
LABEL_20:

}

- (void)evaluateReceiverTrust:(__SecTrust *)a3 completion:(id)a4
{
  id v6;
  void *v7;
  __CFArray *v8;
  __CFArray *v9;
  void *v10;
  OS_dispatch_queue *queue;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v6)
  {
    v7 = (void *)SFNodeCopyAppleID(self->_person);
    if (v7 && (v8 = sub_10004F238(a3)) != 0)
    {
      v9 = v8;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor verifiedIdentityForAppleID:](self->_monitor, "verifiedIdentityForAppleID:", v7));
      queue = self->_queue;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100067EE0;
      v12[3] = &unk_100715658;
      v13 = v6;
      sub_10020A34C(v9, v10, queue, v12);

    }
    else
    {
      (*((void (**)(id, BOOL))v6 + 2))(v6, v7 == 0);
    }

  }
}

- (BOOL)connectionOverP2P:(__CFData *)a3
{
  const UInt8 *BytePtr;
  unsigned int v5;
  char *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  int v16;
  void *v17;
  __int16 v18;
  char *v19;
  char v20[8];
  uint64_t v21;

  BytePtr = CFDataGetBytePtr(a3);
  if (BytePtr[1] != 30)
  {
    v12 = airdrop_log(BytePtr);
    v9 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropClient personID](self, "personID"));
      v16 = 138412290;
      v17 = v13;
      v14 = "AirDrop sending to %@ over IPv4";
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v16, 0xCu);

    }
LABEL_14:

    return 0;
  }
  v5 = *((_DWORD *)BytePtr + 6);
  if (!v5)
  {
    v15 = airdrop_log(BytePtr);
    v9 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropClient personID](self, "personID"));
      v16 = 138412290;
      v17 = v13;
      v14 = "AirDrop sending to %@ over IPv6";
      goto LABEL_11;
    }
    goto LABEL_14;
  }
  *(_QWORD *)v20 = 0;
  v21 = 0;
  v6 = if_indextoname(v5, v20);
  v7 = airdrop_log(v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (!v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10006D468(v5, v9);
    goto LABEL_14;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropClient personID](self, "personID"));
    v16 = 138412546;
    v17 = v10;
    v18 = 2080;
    v19 = v20;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "AirDrop sending to %@ over %s", (uint8_t *)&v16, 0x16u);

  }
  return strncasecmp(v20, "p2p", 3uLL) == 0;
}

- (void)releasePeerToPeerIfPossible:(id)a3
{
  id v4;
  const void *v5;
  id v6;

  v4 = a3;
  if (self->_p2pRetained)
  {
    v6 = v4;
    v5 = (const void *)CFURLResponseCopyPeerAddress(objc_msgSend(v4, "_CFURLResponse"));
    v4 = v6;
    if (v5)
    {
      if (!-[SDAirDropClient connectionOverP2P:](self, "connectionOverP2P:", v5))
      {
        sub_10019ABA4();
        self->_p2pRetained = 0;
      }
      CFRelease(v5);
      v4 = v6;
    }
  }

}

- (void)logInterfaceUsedForSending:(id)a3
{
  uint64_t v4;
  const void *v5;

  v4 = CFURLResponseCopyPeerAddress(objc_msgSend(a3, "_CFURLResponse"));
  if (v4)
  {
    v5 = (const void *)v4;
    -[SDAirDropClient connectionOverP2P:](self, "connectionOverP2P:", v4);
    CFRelease(v5);
  }
}

- (__SecTrust)secTrustRef
{
  return self->_serverTrust;
}

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
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
  int v31;
  id v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;

  v6 = a5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "transactionMetrics"));
  v8 = objc_msgSend(v7, "count");

  if (v8 != (id)1)
  {
    v10 = airdrop_log(v9);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v31 = 134217984;
      v32 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "NSURLSessionTaskTransactionMetrics count %lu is not expected, expecting 1", (uint8_t *)&v31, 0xCu);
    }

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "transactionMetrics"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject"));

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "_remoteAddressAndPort"));
    if (v14)
    {

    }
    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "_localAddressAndPort"));

      if (!v16)
      {
LABEL_12:
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "secureConnectionStartDate"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "fetchStartDate"));
        objc_msgSend(v22, "timeIntervalSinceDate:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
        -[SDAirDropPeerMetric setTcpConnectionComplete:](self->_metric, "setTcpConnectionComplete:", v24);

        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "secureConnectionEndDate"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "secureConnectionStartDate"));
        objc_msgSend(v25, "timeIntervalSinceDate:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
        -[SDAirDropPeerMetric setTlsHandshakeComplete:](self->_metric, "setTlsHandshakeComplete:", v27);

        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "responseEndDate"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "secureConnectionEndDate"));
        objc_msgSend(v28, "timeIntervalSinceDate:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
        -[SDAirDropPeerMetric setIdentityQueryComplete:](self->_metric, "setIdentityQueryComplete:", v30);

        goto LABEL_13;
      }
    }
    v17 = airdrop_log(v15);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropClient personID](self, "personID"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "_localAddressAndPort"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "_remoteAddressAndPort"));
      v31 = 138412802;
      v32 = v19;
      v33 = 2112;
      v34 = v20;
      v35 = 2112;
      v36 = v21;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Connected to %@ from [%@] => [%@]", (uint8_t *)&v31, 0x20u);

    }
    goto LABEL_12;
  }
LABEL_13:

}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  __SecTrust *serverTrust;
  id v12;
  __SecCertificate *v13;
  __SecCertificate *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  __SecIdentity *identity;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[5];
  id v30;
  id v31;
  __SecCertificate *v32;
  uint8_t buf[4];
  void *v34;

  v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "protectionSpace"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "authenticationMethod"));
  if (objc_msgSend(v9, "isEqual:", NSURLAuthenticationMethodServerTrust))
  {
    v10 = objc_msgSend(v8, "serverTrust");
    if (v10)
    {
      serverTrust = self->_serverTrust;
      if (serverTrust)
        CFRelease(serverTrust);
      self->_serverTrust = (__SecTrust *)CFRetain(v10);
    }
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100068814;
    v29[3] = &unk_100715680;
    v29[4] = self;
    v30 = v7;
    v31 = v10;
    -[SDAirDropClient evaluateReceiverTrust:completion:](self, "evaluateReceiverTrust:completion:", v10, v29);

    goto LABEL_21;
  }
  v12 = objc_msgSend(v9, "isEqual:", NSURLAuthenticationMethodClientCertificate);
  if ((_DWORD)v12)
  {
    if (self->_identity)
    {
      v13 = -[SDStatusMonitor copyMyAppleIDIntermediateCertificate](self->_monitor, "copyMyAppleIDIntermediateCertificate");
      if (v13)
      {
        v14 = v13;
        v15 = airdrop_log(v13);
        v16 = objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropClient personID](self, "personID"));
          *(_DWORD *)buf = 138412290;
          v34 = v17;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "SDAirDropClient: sending client certificate to %@", buf, 0xCu);

        }
        identity = self->_identity;
        v32 = v14;
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v32, 1));
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLCredential credentialWithIdentity:certificates:persistence:](NSURLCredential, "credentialWithIdentity:certificates:persistence:", identity, v19, 1));

        (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v20);
        CFRelease(v14);

        goto LABEL_21;
      }
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor myAppleID](self->_monitor, "myAppleID"));
      SFMetricsLogUnexpectedEvent(7, 0, v26);

      v28 = airdrop_log(v27);
      v24 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        sub_10006D4D8(self, v24);
    }
    else
    {
      v23 = airdrop_log(v12);
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropClient personID](self, "personID"));
        *(_DWORD *)buf = 138412290;
        v34 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "SDAirDropClient: identity not available. Sending to %@ with no Apple ID certificate", buf, 0xCu);

      }
    }

    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
    goto LABEL_21;
  }
  v21 = airdrop_log(v12);
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    sub_10006D558();

  (*((void (**)(id, uint64_t, _QWORD))v7 + 2))(v7, 3, 0);
LABEL_21:

}

- (void)URLSession:(id)a3 task:(id)a4 needNewBodyStream:(id)a5
{
  id v8;
  NSURLSessionUploadTask *v9;
  id v10;
  void (**v11)(_QWORD, _QWORD);
  uint64_t v12;
  NSObject *v13;
  SDAirDropFileZipper *zipper;
  __CFReadStream *v15;
  int v16;
  NSURLSessionUploadTask *v17;

  v8 = a3;
  v9 = (NSURLSessionUploadTask *)a4;
  v10 = a5;
  v11 = (void (**)(_QWORD, _QWORD))v10;
  if (self->_providedStream)
    goto LABEL_6;
  if (self->_uploadTask != v9)
  {
    v12 = airdrop_log(v10);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412290;
      v17 = v9;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "SDAirDropClient: needNewBodyStream invoked for task %@", (uint8_t *)&v16, 0xCu);
    }

    goto LABEL_6;
  }
  zipper = self->_zipper;
  if (!zipper)
  {
LABEL_6:
    v11[2](v11, 0);
    goto LABEL_7;
  }
  v15 = -[SDAirDropFileZipper copyReadStream](zipper, "copyReadStream");
  self->_providedStream = 1;
  ((void (**)(_QWORD, __CFReadStream *))v11)[2](v11, v15);
  if (v15)
    CFRelease(v15);
LABEL_7:

}

- (void)fileZipper:(id)a3 event:(int64_t)a4 withProperty:(void *)a5
{
  id v8;
  void *v9;
  char v10;
  SDAirDropClient *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v8 = a3;
  v9 = v8;
  switch(a4)
  {
    case 5:
      v14 = v8;
      -[SDAirDropClient storePropertyValue:forKey:](self, "storePropertyValue:forKey:", a5, kSFOperationTotalBytesKey);
      -[SDAirDropClient sendRequest:](self, "sendRequest:", CFSTR("Upload"));
      if (-[SDStatusMonitor disablePipelining](self->_monitor, "disablePipelining")
        || (v10 = sub_10004FFC4(), v9 = v14, (v10 & 1) == 0))
      {
        self->_startTime = CFAbsoluteTimeGetCurrent();
        v11 = self;
        v12 = 5;
        v13 = 0;
        goto LABEL_12;
      }
      break;
    case 7:
      if (self->_startTime != 0.0)
      {
        v11 = self;
        v12 = 7;
        goto LABEL_11;
      }
      break;
    case 9:
      v14 = v8;
      self->_zipperFinished = 1;
      if (self->_uploadFinished)
      {
        if (self->_startTime == 0.0)
          -[SDAirDropClient finishOperation](self, "finishOperation");
        else
          -[SDAirDropClient notifyClientForEvent:withProperty:](self, "notifyClientForEvent:withProperty:", 9, a5);
      }
      -[SDAirDropClient releaseIdleSleepAssertion](self, "releaseIdleSleepAssertion");
      goto LABEL_15;
    case 10:
      v11 = self;
      v12 = 10;
LABEL_11:
      v13 = a5;
      v14 = v9;
LABEL_12:
      -[SDAirDropClient notifyClientForEvent:withProperty:](v11, "notifyClientForEvent:withProperty:", v12, v13);
LABEL_15:
      v9 = v14;
      break;
    default:
      break;
  }

}

- (void)bonjourResolverDidChange:(id)a3
{
  id v4;
  signed int v5;
  NSURL *v6;
  NSURL *serverURL;
  void *v8;
  void *v9;
  void *v10;
  double Current;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  const char *v25;
  void *v26;
  __CFString **v27;
  SDBonjourResolver *resolver;
  SDBonjourResolver *v29;
  NSErrorDomain v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;

  v4 = a3;
  v5 = objc_msgSend(v4, "error");
  if (v5 == -65568)
  {
    v30 = NSPOSIXErrorDomain;
    v31 = 60;
  }
  else
  {
    if (!v5)
    {
      v6 = (NSURL *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "url"));
      serverURL = self->_serverURL;
      self->_serverURL = v6;

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL host](self->_serverURL, "host"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL port](self->_serverURL, "port"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[%@:%@]"), v8, v9));

      Current = CFAbsoluteTimeGetCurrent();
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropPeerMetric bonjourResolveComplete](self->_metric, "bonjourResolveComplete"));
      objc_msgSend(v12, "doubleValue");
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", Current - v13));
      -[SDAirDropPeerMetric setBonjourResolveComplete:](self->_metric, "setBonjourResolveComplete:", v14);

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropPeerMetric bonjourResolveComplete](self->_metric, "bonjourResolveComplete"));
      objc_msgSend(v15, "doubleValue");
      v17 = v16;

      v19 = airdrop_log(v18);
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = (char *)objc_claimAutoreleasedReturnValue(-[SDAirDropClient personID](self, "personID"));
        *(_DWORD *)buf = 138412546;
        v35 = v21;
        v36 = 1024;
        LODWORD(v37) = (int)(v17 * 1000.0);
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Bonjour resolved %@ in %d ms", buf, 0x12u);

      }
      v23 = airdrop_log(v22);
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        if (self->_discover)
          v25 = "Connecting to";
        else
          v25 = "Sending to";
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropClient personID](self, "personID"));
        *(_DWORD *)buf = 136315650;
        v35 = v25;
        v36 = 2112;
        v37 = v26;
        v38 = 2112;
        v39 = v10;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%s %@ at %@", buf, 0x20u);

      }
      v27 = &off_100714DC8;
      if (!self->_discover)
        v27 = &off_100714DB8;
      -[SDAirDropClient sendRequest:](self, "sendRequest:", *v27);
      resolver = self->_resolver;
      if (resolver)
      {
        -[SDBonjourResolver setDelegate:](resolver, "setDelegate:", 0);
        -[SDBonjourResolver cancel](self->_resolver, "cancel");
        v29 = self->_resolver;
        self->_resolver = 0;

      }
      goto LABEL_19;
    }
    v30 = NSOSStatusErrorDomain;
    v31 = v5;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v30, v31, 0));
  v32 = airdrop_log(v10);
  v33 = objc_claimAutoreleasedReturnValue(v32);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    sub_10006D6C8(v4, (uint64_t)v10, v33);

  -[SDAirDropClient retryRequestForError:](self, "retryRequestForError:", v10);
LABEL_19:

}

- (void)addHashesAndValidationRecordToRequest:(id)a3
{
  __SecIdentity *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = -[SDStatusMonitor copyMyAppleIDSecIdentity](self->_monitor, "copyMyAppleIDSecIdentity");
  self->_identity = v4;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor myAppleIDValidationRecord](self->_monitor, "myAppleIDValidationRecord"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("AppleIDAccountValidationRecordData")));
    if (v6)
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, kSFOperationSenderRecordDataKey);

  }
}

- (id)askRequestClientBundleID
{
  __CFString *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  int v7;
  const __CFString *v8;

  v2 = self->_clientBundleID;
  if (-[__CFString isEqualToString:](v2, "isEqualToString:", CFSTR("com.apple.Passwords.remoteservice")))
  {

    v4 = airdrop_log(v3);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = CFSTR("com.apple.Preferences");
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Ask request sender bundle ID: %@", (uint8_t *)&v7, 0xCu);
    }

    v2 = CFSTR("com.apple.Preferences");
  }
  return v2;
}

- (id)askBodyDataInFormat:(int64_t)a3
{
  NSMutableDictionary *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  CGImage *fileIcon;
  __CFData *v15;
  CGImage *smallFileIcon;
  __CFData *v17;
  uint64_t v18;
  void *v19;
  CFDataRef Data;

  v5 = objc_opt_new(NSMutableDictionary);
  -[SDAirDropClient addHashesAndValidationRecordToRequest:](self, "addHashesAndValidationRecordToRequest:", v5);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", self->_otherStuff, kSFOperationItemsKey);
  v6 = kSFOperationFilesKey;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", kSFOperationFilesKey));
  if (v7)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor modelName](self->_monitor, "modelName"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v8, kSFOperationSenderModelNameKey);

  v9 = kSFOperationItemsDescriptionKey;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", kSFOperationItemsDescriptionKey));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropClient askRequestClientBundleID](self, "askRequestClientBundleID"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v11, kSFOperationBundleIDKey);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor someComputerName](self->_monitor, "someComputerName"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v12, kSFOperationSenderComputerNameKey);

  v13 = (__CFString *)sub_10004DA00(0, 0);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v13, kSFOperationSenderIDKey);

  if (v10)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v10, v9);
  fileIcon = self->_fileIcon;
  if (fileIcon)
  {
    v15 = sub_1000CE5B0(fileIcon, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v15, kSFOperationFileIconKey);

  }
  smallFileIcon = self->_smallFileIcon;
  if (smallFileIcon)
  {
    v17 = sub_1000CE5B0(smallFileIcon, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v17, kSFOperationSmallFileIconKey);

  }
  v18 = kSFOperationConvertMediaFormatsKey;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", kSFOperationConvertMediaFormatsKey));
  if (v19)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v19, v18);
  Data = CFPropertyListCreateData(0, v5, (CFPropertyListFormat)a3, 0, 0);

  return Data;
}

- (id)discoverBodyDataInFormat:(int64_t)a3
{
  NSMutableDictionary *v5;
  CFDataRef Data;

  v5 = objc_opt_new(NSMutableDictionary);
  -[SDAirDropClient addHashesAndValidationRecordToRequest:](self, "addHashesAndValidationRecordToRequest:", v5);
  Data = CFPropertyListCreateData(0, v5, (CFPropertyListFormat)a3, 0, 0);

  return Data;
}

- (void)sendRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  __CFString **v10;
  uint64_t v11;
  SDAirDropClient *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __CFString **v19;
  id v20;
  id v21;
  NSURLSessionUploadTask *v22;
  NSURLSessionUploadTask *discoverTask;
  id v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  id v28;
  uint64_t v29;
  NSObject *v30;
  int v31;
  id v32;
  __int16 v33;
  void *v34;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSData data](NSData, "data"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL URLByAppendingPathComponent:isDirectory:](self->_serverURL, "URLByAppendingPathComponent:isDirectory:", v4, 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableURLRequest requestWithURL:](NSMutableURLRequest, "requestWithURL:", v6));
  objc_msgSend(v7, "setHTTPMethod:", CFSTR("POST"));
  if (objc_msgSend(v4, "isEqual:", CFSTR("Discover")))
  {
    v8 = -[SDStatusMonitor enableXML](self->_monitor, "enableXML");
    if (v8)
      v9 = 100;
    else
      v9 = 200;
    v10 = off_100719BE0;
    if (!v8)
      v10 = off_100719BD8;
    objc_msgSend(v7, "setValue:forHTTPHeaderField:", *v10, CFSTR("Content-Type"));
    v11 = objc_claimAutoreleasedReturnValue(-[SDAirDropClient discoverBodyDataInFormat:](self, "discoverBodyDataInFormat:", v9));

    objc_msgSend(v7, "setValue:forHTTPHeaderField:", CFSTR("close"), CFSTR("Connection"));
    goto LABEL_18;
  }
  if (objc_msgSend(v4, "isEqual:", CFSTR("Ask")))
  {
    if (-[SDStatusMonitor enableXML](self->_monitor, "enableXML"))
    {
      objc_msgSend(v7, "setValue:forHTTPHeaderField:", CFSTR("text/xml"), CFSTR("Content-Type"));
      v12 = self;
      v13 = 100;
    }
    else
    {
      objc_msgSend(v7, "setValue:forHTTPHeaderField:", CFSTR("application/octet-stream"), CFSTR("Content-Type"));
      v12 = self;
      v13 = 200;
    }
    v11 = objc_claimAutoreleasedReturnValue(-[SDAirDropClient askBodyDataInFormat:](v12, "askBodyDataInFormat:", v13));

LABEL_18:
    v5 = (void *)v11;
    goto LABEL_19;
  }
  if (objc_msgSend(v4, "isEqual:", CFSTR("Upload")))
  {
    v14 = kSFOperationTotalBytesKey;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", kSFOperationTotalBytesKey));
    v16 = v15;
    if (v15)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringValue"));
      objc_msgSend(v7, "setValue:forHTTPHeaderField:", v17, v14);

    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropFileZipper zipCompressionType](self->_zipper, "zipCompressionType"));
    if (objc_msgSend(v18, "isEqualToString:", CFSTR("pkzip")))
    {
      v19 = off_100719BC0;
    }
    else if (objc_msgSend(v18, "isEqualToString:", CFSTR("dvzip")))
    {
      v19 = off_100719BD0;
    }
    else
    {
      v28 = objc_msgSend(v18, "isEqualToString:", CFSTR("gzip"));
      if (!(_DWORD)v28)
      {
        v29 = airdrop_log(v28);
        v30 = objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
          sub_10006D774();

      }
      v19 = off_100719BC8;
    }
    objc_msgSend(v7, "setValue:forHTTPHeaderField:", *v19, CFSTR("Content-Type"));
    if (-[SDStatusMonitor disablePipelining](self->_monitor, "disablePipelining") || (sub_10004FFC4() & 1) == 0)
      objc_msgSend(v7, "setValue:forHTTPHeaderField:", CFSTR("100-continue"), CFSTR("Expect"));
    objc_msgSend(v7, "setValue:forHTTPHeaderField:", CFSTR("close"), CFSTR("Connection"));

  }
LABEL_19:
  if (!-[SDStatusMonitor disablePipelining](self->_monitor, "disablePipelining") && sub_10004FFC4())
  {
    v20 = objc_retainAutorelease(v7);
    CFURLRequestSetShouldPipelineHTTP(objc_msgSend(v20, "_CFURLRequest"), 1, 0);
    v21 = objc_retainAutorelease(v20);
    _CFURLRequestSetShouldSkipPipelineProbe(objc_msgSend(v21, "_CFURLRequest"), 1);
    _CFURLRequestSetShouldPipelineNonIdempotentHTTP(objc_msgSend(objc_retainAutorelease(v21), "_CFURLRequest"), 1);
  }
  if (objc_msgSend(v4, "isEqual:", CFSTR("Discover")))
  {
    v22 = (NSURLSessionUploadTask *)(id)objc_claimAutoreleasedReturnValue(-[NSURLSession uploadTaskWithRequest:fromData:](self->_session, "uploadTaskWithRequest:fromData:", v7, v5));
    discoverTask = self->_discoverTask;
    self->_discoverTask = v22;
LABEL_28:

    goto LABEL_29;
  }
  if (objc_msgSend(v4, "isEqual:", CFSTR("Ask")))
  {
    v22 = (NSURLSessionUploadTask *)(id)objc_claimAutoreleasedReturnValue(-[NSURLSession uploadTaskWithRequest:fromData:](self->_session, "uploadTaskWithRequest:fromData:", v7, v5));
    discoverTask = self->_askTask;
    self->_askTask = v22;
    goto LABEL_28;
  }
  v24 = objc_msgSend(v4, "isEqual:", CFSTR("Upload"));
  if ((_DWORD)v24)
  {
    v22 = (NSURLSessionUploadTask *)(id)objc_claimAutoreleasedReturnValue(-[NSURLSession uploadTaskWithStreamedRequest:](self->_session, "uploadTaskWithStreamedRequest:", v7));
    discoverTask = self->_uploadTask;
    self->_uploadTask = v22;
    goto LABEL_28;
  }
  v22 = 0;
LABEL_29:
  v25 = airdrop_log(v24);
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropClient personID](self, "personID"));
    v31 = 138412546;
    v32 = v4;
    v33 = 2112;
    v34 = v27;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Sending %@ request to %@", (uint8_t *)&v31, 0x16u);

  }
  -[NSURLSessionUploadTask resume](v22, "resume");

}

- (void)startZipping
{
  SDAirDropFileZipper *v3;
  SDAirDropFileZipper *zipper;
  __int128 v5;
  _OWORD v6[2];

  if (!self->_zipper)
  {
    v3 = objc_alloc_init(SDAirDropFileZipper);
    zipper = self->_zipper;
    self->_zipper = v3;

    v5 = *(_OWORD *)&self->_auditToken.val[4];
    v6[0] = *(_OWORD *)self->_auditToken.val;
    v6[1] = v5;
    -[SDAirDropFileZipper setAuditToken:](self->_zipper, "setAuditToken:", v6);
    -[SDAirDropFileZipper setSkipReadableCheckFiles:](self->_zipper, "setSkipReadableCheckFiles:", self->_generatedFiles);
    -[SDAirDropFileZipper setDisableAdaptiveCompressionForZipping:](self->_zipper, "setDisableAdaptiveCompressionForZipping:", !self->_receiverSupportsDVZip);
    -[SDAirDropFileZipper setSourceFiles:](self->_zipper, "setSourceFiles:", self->_fileURLs);
    -[SDAirDropFileZipper setClientPid:](self->_zipper, "setClientPid:", self->_clientPid);
    -[SDAirDropFileZipper setDelegate:](self->_zipper, "setDelegate:", self);
    -[SDAirDropFileZipper zip](self->_zipper, "zip");
  }
}

- (BOOL)splitOutFileURLs
{
  unint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSMutableArray *fileURLs;
  void *v10;
  void *v11;
  NSMutableArray *otherStuff;
  void *v13;
  void *v14;
  NSMutableArray *filesToCleanup;
  void *v16;
  unsigned __int8 v17;

  v3 = sub_10004FF34();
  v5 = (void *)SFNodeCopyRealName(self->_person, v4);
  v6 = (void *)SFNodeCopyKinds(self->_person);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDAirDropLegacyHelper preprocessItems:forClientBundleID:receiverIdentifier:receiverSupportsURLs:receiverIsUnknown:](SDAirDropLegacyHelper, "preprocessItems:forClientBundleID:receiverIdentifier:receiverSupportsURLs:receiverIsUnknown:", self->_items, self->_clientBundleID, v5, v3, objc_msgSend(v6, "containsObject:", kSFNodeKindUnknown)));
  if (objc_msgSend(v7, "success"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "files"));

    if (v8)
    {
      fileURLs = self->_fileURLs;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "files"));
      -[NSMutableArray addObjectsFromArray:](fileURLs, "addObjectsFromArray:", v10);

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "otherStuff"));

    if (v11)
    {
      otherStuff = self->_otherStuff;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "otherStuff"));
      -[NSMutableArray addObjectsFromArray:](otherStuff, "addObjectsFromArray:", v13);

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "filesToCleanup"));

    if (v14)
    {
      filesToCleanup = self->_filesToCleanup;
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "filesToCleanup"));
      -[NSMutableArray addObjectsFromArray:](filesToCleanup, "addObjectsFromArray:", v16);

    }
  }
  v17 = objc_msgSend(v7, "success");

  return v17;
}

- (void)validateAirDropItemsWithCompletionHandler:(id)a3
{
  id v4;
  NSUInteger v5;
  uint64_t v6;
  NSObject *v7;
  NSUInteger v8;
  NSArray *items;
  uint64_t v10;
  id v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  NSUInteger v16;
  __int16 v17;
  NSArray *v18;

  v4 = a3;
  v5 = -[NSArray count](self->_items, "count");
  if (v5 && self->_items)
  {
    v6 = airdrop_log(v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = -[NSArray count](self->_items, "count");
      items = self->_items;
      *(_DWORD *)buf = 134218242;
      v16 = v8;
      v17 = 2112;
      v18 = items;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Validating %lu items to send: %@", buf, 0x16u);
    }
  }
  else
  {
    v10 = airdrop_log(v5);
    v7 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10006D7E0();
  }

  if (-[NSMutableArray count](self->_fileURLs, "count"))
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100069B6C;
    v13[3] = &unk_100714F40;
    v13[4] = self;
    v14 = v4;
    -[SDAirDropClient convertMediaItemsWithCompletionHandler:](self, "convertMediaItemsWithCompletionHandler:", v13);

  }
  else if (-[NSMutableArray count](self->_otherStuff, "count"))
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }
  else
  {
    v11 = sub_10005081C(-4, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    (*((void (**)(id, void *))v4 + 2))(v4, v12);

  }
}

- (void)appendFileURL:(id)a3 withBase:(id)a4 toItems:(id)a5
{
  id v8;
  const __CFURL *v9;
  id v10;
  unsigned int v11;
  id v12;
  id v13;
  void *v14;
  NSMutableDictionary *v15;
  NSNumber *v16;
  void *v17;
  __CFString *v18;
  id v19;
  uint64_t v20;
  __CFString *v21;
  __CFString *v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  id v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  id v31;
  __CFString *v32;
  __CFString *v33;
  unsigned __int8 v34;
  id v35;
  void *v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  __CFString *v45;
  id v46;
  SDAirDropClient *v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;

  v8 = a3;
  v9 = (const __CFURL *)a4;
  v10 = a5;
  v54 = 0;
  v53 = 0;
  v11 = objc_msgSend(v8, "getResourceValue:forKey:error:", &v54, NSURLNameKey, &v53);
  v12 = v54;
  v13 = v53;
  v14 = v13;
  if (v11)
  {
    v47 = self;
    v15 = objc_opt_new(NSMutableDictionary);
    v16 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", sub_10019A9F0((const __CFURL *)v8));
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v17, kSFOperationFileIsDirectoryKey);

    -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v12, kSFOperationFileNameKey);
    v52 = 0;
    v51 = 0;
    LODWORD(v17) = objc_msgSend(v8, "getResourceValue:forKey:error:", &v52, NSURLTypeIdentifierKey, &v51);
    v18 = (__CFString *)v52;
    v19 = v51;

    if (!(_DWORD)v17)
    {
      v24 = airdrop_log(v20);
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        sub_10006D904();
      goto LABEL_31;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v18, kSFOperationFileTypeKey);
    if (!-[__CFString isEqual:](v18, "isEqual:", kUTTypePhotosAssetBundle))
    {
      v26 = -[__CFString isEqual:](v18, "isEqual:", kUTTypeLivePhoto);
      if ((v26 & 1) == 0)
      {
        v26 = (id)UTTypeConformsTo(v18, kUTTypeLivePhoto);
        if (!(_DWORD)v26)
          goto LABEL_32;
      }
      v45 = v18;
      v27 = airdrop_log(v26);
      v28 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
        sub_10006D8CC();

      v46 = objc_msgSend(objc_alloc((Class)PFVideoComplement), "initWithBundleAtURL:", v8);
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "imagePath"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v29));
      v48 = 0;
      objc_msgSend(v30, "getResourceValue:forKey:error:", &v48, NSURLTypeIdentifierKey, 0);
      v31 = v48;

      LODWORD(v29) = objc_msgSend(v31, "isEqual:", kUTTypeJPEG);
      v32 = CFSTR("public.heic");
      if ((_DWORD)v29)
        v32 = (__CFString *)kUTTypeJPEG;
      v25 = v32;
LABEL_29:

      if (v25)
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v25, kSFOperationtFileSubTypeKey);
LABEL_31:

      }
LABEL_32:
      v39 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v47->_fileURLToConversionNeeded, "objectForKeyedSubscript:", v8, v45));
      v40 = (void *)v39;
      if (v39)
        v41 = (void *)v39;
      else
        v41 = &__kCFBooleanFalse;
      -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v41, kSFOperationConvertMediaFormatsKey);

      v42 = sub_10019AF1C(v8, v9);
      if (v42)
      {
        v43 = v42;
        v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v42));
        if (v44)
          -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v44, kSFOperationFileBomPathKey);
        free(v43);

      }
      objc_msgSend(v10, "addObject:", v15);

      goto LABEL_40;
    }
    v46 = objc_msgSend(objc_alloc((Class)PFAssetBundle), "initWithAssetBundleAtURL:", v8);
    if (objc_msgSend(v46, "mediaType") == (id)2)
    {
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "fullSizeVideoURL"));
      if (!v21)
      {
        v22 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "videoURL"));
        goto LABEL_22;
      }
    }
    else
    {
      if (objc_msgSend(v46, "mediaType") != (id)1)
        goto LABEL_28;
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "fullSizePhotoURL"));
      if (!v21)
      {
        v22 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "photoURL"));
LABEL_22:
        v33 = v22;

        if (v33)
        {
          v49 = 0;
          v50 = 0;
          v45 = v33;
          v34 = -[__CFString getResourceValue:forKey:error:](v33, "getResourceValue:forKey:error:", &v50, NSURLTypeIdentifierKey, &v49);
          v25 = v50;
          v35 = v49;
          v36 = v35;
          if ((v34 & 1) == 0)
          {
            v37 = airdrop_log(v35);
            v38 = objc_claimAutoreleasedReturnValue(v37);
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
              sub_10006D86C();

          }
          goto LABEL_29;
        }
LABEL_28:
        v25 = 0;
        goto LABEL_29;
      }
    }
    v22 = v21;
    v21 = v22;
    goto LABEL_22;
  }
  v23 = airdrop_log(v13);
  v15 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(&v15->super.super, OS_LOG_TYPE_ERROR))
    sub_10006D964();
  v19 = v14;
LABEL_40:

}

- (void)removeFileIconsFromProperties
{
  uint64_t v3;
  CGImage *v4;
  uint64_t v5;
  CGImage *v6;
  CGImage *fileIcon;
  CGImage *smallFileIcon;

  v3 = kSFOperationFileIconKey;
  v4 = (CGImage *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", kSFOperationFileIconKey));
  self->_fileIcon = v4;

  v5 = kSFOperationSmallFileIconKey;
  v6 = (CGImage *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", kSFOperationSmallFileIconKey));
  self->_smallFileIcon = v6;

  fileIcon = self->_fileIcon;
  if (fileIcon)
  {
    CFRetain(fileIcon);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:", 0, v3);
  }
  smallFileIcon = self->_smallFileIcon;
  if (smallFileIcon)
  {
    CFRetain(smallFileIcon);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:", 0, v5);
  }
}

- (void)startPublishingProgress
{
  void *v3;
  void *v4;
  id v5;
  NSString *clientBundleID;
  void *v7;
  NSProgress *v8;
  NSProgress *progress;
  uint64_t v10;
  NSObject *v11;
  void **v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;

  if (!self->_progress)
  {
    if (self->_clientBundleID)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropClient personID](self, "personID"));

      if (v3)
      {
        v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", kSFOperationSessionIDKey));
        if (v4)
        {
          location = 0;
          objc_initWeak(&location, self);
          v5 = objc_alloc((Class)NSProgress);
          clientBundleID = self->_clientBundleID;
          v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropClient personID](self, "personID"));
          v8 = (NSProgress *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sf_initWithAppBundle:sessionID:andPersonRealName:", clientBundleID, v4, v7));
          progress = self->_progress;
          self->_progress = v8;

          -[NSProgress setTotalUnitCount:](self->_progress, "setTotalUnitCount:", 100);
          v12 = _NSConcreteStackBlock;
          v13 = 3221225472;
          v14 = sub_10006A5A8;
          v15 = &unk_1007145D0;
          objc_copyWeak(&v16, &location);
          -[NSProgress setCancellationHandler:](self->_progress, "setCancellationHandler:", &v12);
          -[NSProgress _publish](self->_progress, "_publish", v12, v13, v14, v15);
          objc_destroyWeak(&v16);
          objc_destroyWeak(&location);
        }
        else
        {
          v10 = airdrop_log(0);
          v11 = objc_claimAutoreleasedReturnValue(v10);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            sub_10006D9C4();

        }
      }
    }
  }
}

- (void)startSendingClassroom
{
  CGImage *fileIcon;
  NSMutableDictionary *properties;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSUUID *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  NSMutableDictionary *v14;
  void *v15;
  NSString *clientBundleID;
  id WeakRetained;
  id v18;

  fileIcon = self->_fileIcon;
  properties = self->_properties;
  v5 = kSFOperationFileIconKey;
  if (fileIcon)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](properties, "setObject:forKeyedSubscript:", fileIcon, kSFOperationFileIconKey);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](properties, "objectForKeyedSubscript:", kSFOperationFileIconKey));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:", v6, v5);

  }
  v7 = kSFOperationSessionIDKey;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", kSFOperationSessionIDKey));
  if (v8)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:", v8, v7);
  }
  else
  {
    v9 = objc_opt_new(NSUUID);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v9, "UUIDString"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:", v10, v7);

  }
  v11 = -[NSMutableArray count](self->_otherStuff, "count");
  v12 = 184;
  if (!v11)
    v12 = 112;
  v13 = *(id *)((char *)&self->super.isa + v12);
  v18 = (id)objc_claimAutoreleasedReturnValue(+[SDClassroomBrowser sharedBrowser](SDClassroomBrowser, "sharedBrowser"));
  v14 = self->_properties;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropClient personID](self, "personID"));
  clientBundleID = self->_clientBundleID;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v18, "startSendingItems:withProperties:toPersonWithID:clientBundleID:airDropClientDelegate:", v13, v14, v15, clientBundleID, WeakRetained);

}

- (void)cancelSendingClassroom
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", kSFOperationSessionIDKey));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDClassroomBrowser sharedBrowser](SDClassroomBrowser, "sharedBrowser"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropClient personID](self, "personID"));
  objc_msgSend(v3, "cancelSendingItemsToPersonWithID:sessionID:clientBundleID:", v4, v5, self->_clientBundleID);

}

- (void)startSending
{
  void *v3;
  unsigned __int8 v4;
  unsigned __int8 v5;
  id WeakRetained;
  _QWORD v7[5];
  unsigned __int8 v8;

  v3 = (void *)SFNodeCopyKinds(self->_person);
  v4 = objc_msgSend(v3, "containsObject:", kSFNodeKindClassroom);
  v5 = v4;
  if (!self->_shouldPublishProgress || (v4 & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "startProgress");

  }
  else
  {
    -[SDAirDropClient startPublishingProgress](self, "startPublishingProgress");
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10006A894;
  v7[3] = &unk_1007156A8;
  v7[4] = self;
  v8 = v5;
  -[SDAirDropClient validateAirDropItemsWithCompletionHandler:](self, "validateAirDropItemsWithCompletionHandler:", v7);

}

- (void)activate
{
  _BOOL8 v3;
  id v4;
  NSMutableArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  _QWORD v20[4];
  id v21;
  SDAirDropClient *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  _BYTE v29[128];

  -[SDXPCHelperConnection activate](self->_xpcHelperConnection, "activate");
  -[SDAirDropClient createSession](self, "createSession");
  if (self->_discover)
  {
    -[SDAirDropClient resolve](self, "resolve");
  }
  else
  {
    v3 = -[SDAirDropClient splitOutFileURLs](self, "splitOutFileURLs");
    if (v3)
    {
      if (-[NSMutableArray count](self->_fileURLs, "count"))
      {
        v4 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_fileURLs, "count"));
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v5 = self->_fileURLs;
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
        if (v6)
        {
          v7 = v6;
          v8 = *(_QWORD *)v24;
          do
          {
            for (i = 0; i != v7; i = (char *)i + 1)
            {
              if (*(_QWORD *)v24 != v8)
                objc_enumerationMutation(v5);
              v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileAccessIntent readingIntentWithURL:options:](NSFileAccessIntent, "readingIntentWithURL:options:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i), 131074));
              objc_msgSend(v4, "addObject:", v10);

            }
            v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
          }
          while (v7);
        }

        v12 = airdrop_log(v11);
        v13 = objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropClient personID](self, "personID"));
          *(_DWORD *)buf = 138412290;
          v28 = v14;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Starting file coordination for %@", buf, 0xCu);

        }
        v15 = objc_msgSend(objc_alloc((Class)NSFileCoordinator), "initWithFilePresenter:", 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_10006AF38;
        v20[3] = &unk_1007156D0;
        v21 = v4;
        v22 = self;
        v17 = v4;
        objc_msgSend(v15, "coordinateAccessWithIntents:queue:byAccessor:", v17, v16, v20);

      }
      else
      {
        -[SDAirDropClient startSending](self, "startSending");
      }
    }
    else
    {
      v18 = airdrop_log(v3);
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        sub_10006DA64();

    }
  }
}

- (void)resolve
{
  id WeakRetained;
  void *v4;
  NSNumber *v5;
  void *v6;
  SDBonjourResolver *v7;
  SDBonjourResolver *resolver;
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    v9 = (id)SFNodeCopyDomain(self->_person);
    v4 = (void *)SFNodeCopyServiceName(self->_person);
    v5 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", CFAbsoluteTimeGetCurrent());
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    -[SDAirDropPeerMetric setBonjourResolveComplete:](self->_metric, "setBonjourResolveComplete:", v6);

    v7 = -[SDBonjourResolver initWithName:type:domain:path:timeout:]([SDBonjourResolver alloc], "initWithName:type:domain:path:timeout:", v4, sub_1000CEC14(), v9, 0, 1);
    resolver = self->_resolver;
    self->_resolver = v7;

    -[SDBonjourResolver setDelegate:](self->_resolver, "setDelegate:", self);
    -[SDBonjourResolver resolve](self->_resolver, "resolve");

  }
}

- (BOOL)send
{
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  OS_os_transaction *v8;
  OS_os_transaction *transaction;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  unsigned int powerAssertionID;
  int v14;
  void *v15;

  if (self->_transactionStarted || self->_cancelled)
    return 0;
  v4 = (void *)SFNodeCopyComputerName(self->_person);
  v5 = airdrop_log(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412290;
    v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Start transaction to \"%@\", (uint8_t *)&v14, 0xCu);
  }

  self->_transactionStarted = 1;
  -[SDStatusMonitor airDropTransactionBegin:](self->_monitor, "airDropTransactionBegin:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDServerBrowser sharedBrowser](SDServerBrowser, "sharedBrowser"));
  objc_msgSend(v7, "incrementTransfersInitiated");

  v8 = (OS_os_transaction *)os_transaction_create("SDAirDropClient");
  transaction = self->_transaction;
  self->_transaction = v8;

  v10 = sub_1000501FC();
  self->_powerAssertionID = v10;
  v11 = airdrop_log(v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    powerAssertionID = self->_powerAssertionID;
    v14 = 67109120;
    LODWORD(v15) = powerAssertionID;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Power assertion retained (%d)", (uint8_t *)&v14, 8u);
  }

  -[SDAirDropClient notifyClientForEvent:withProperty:](self, "notifyClientForEvent:withProperty:", 11, 0);
  -[SDAirDropClient resolve](self, "resolve");

  return 1;
}

- (NSString)personID
{
  return (NSString *)(id)SFNodeCopyRealName(self->_person, a2);
}

- (void)invalidate
{
  NSURLSessionUploadTask *askTask;
  NSURLSessionUploadTask *uploadTask;
  NSURLSessionUploadTask *discoverTask;
  NSURLSession *session;
  SDAirDropFileZipper *zipper;
  SDBonjourResolver *resolver;
  SDXPCHelperConnection *xpcHelperConnection;
  void *v10;
  NSMutableArray *filesToCleanup;
  NSMutableArray *v12;
  id v13;
  __int128 v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  const __CFURL *v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  NSMutableArray *v25;
  PHMediaFormatConversionManager *conversionManager;
  double v27;
  dispatch_time_t v28;
  NSObject *queue;
  id v30;
  NSObject *v31;
  dispatch_time_t v32;
  NSObject *v33;
  __int128 v34;
  _QWORD v35[5];
  _QWORD block[5];
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  const __CFURL *v43;
  __int16 v44;
  id v45;
  _BYTE v46[128];

  self->_cancelled = 1;
  -[NSURLSessionUploadTask cancel](self->_askTask, "cancel");
  askTask = self->_askTask;
  self->_askTask = 0;

  -[NSURLSessionUploadTask cancel](self->_uploadTask, "cancel");
  uploadTask = self->_uploadTask;
  self->_uploadTask = 0;

  -[NSURLSessionUploadTask cancel](self->_discoverTask, "cancel");
  discoverTask = self->_discoverTask;
  self->_discoverTask = 0;

  -[NSURLSession finishTasksAndInvalidate](self->_session, "finishTasksAndInvalidate");
  session = self->_session;
  self->_session = 0;

  -[SDAirDropFileZipper setDelegate:](self->_zipper, "setDelegate:", 0);
  -[SDAirDropFileZipper stop](self->_zipper, "stop");
  zipper = self->_zipper;
  self->_zipper = 0;

  -[SDBonjourResolver setDelegate:](self->_resolver, "setDelegate:", 0);
  -[SDBonjourResolver cancel](self->_resolver, "cancel");
  resolver = self->_resolver;
  self->_resolver = 0;

  -[SDXPCHelperConnection invalidate](self->_xpcHelperConnection, "invalidate");
  xpcHelperConnection = self->_xpcHelperConnection;
  self->_xpcHelperConnection = 0;

  if (self->_personAdded)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDConnectedBrowser sharedBrowser](SDConnectedBrowser, "sharedBrowser"));
    objc_msgSend(v10, "removeAirDropPerson:", self->_person);

    self->_personAdded = 0;
  }
  filesToCleanup = self->_filesToCleanup;
  if (filesToCleanup)
  {
    v41 = 0u;
    v39 = 0u;
    v40 = 0u;
    v38 = 0u;
    v12 = filesToCleanup;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    if (v13)
    {
      v15 = v13;
      v16 = 0;
      v17 = *(_QWORD *)v39;
      *(_QWORD *)&v14 = 138412546;
      v34 = v14;
      do
      {
        v18 = 0;
        v19 = v16;
        do
        {
          if (*(_QWORD *)v39 != v17)
            objc_enumerationMutation(v12);
          v20 = *(const __CFURL **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)v18);
          v37 = v19;
          v21 = sub_10019BB74(v20, &v37);
          v16 = v37;

          if (!v21)
          {
            v23 = airdrop_log(v22);
            v24 = objc_claimAutoreleasedReturnValue(v23);
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v34;
              v43 = v20;
              v44 = 2112;
              v45 = v16;
              _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "SDAirDropClient: removeObjectAtURL(%@) failed %@", buf, 0x16u);
            }

          }
          v18 = (char *)v18 + 1;
          v19 = v16;
        }
        while (v15 != v18);
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
      }
      while (v15);
    }
    else
    {
      v16 = 0;
    }

    v25 = self->_filesToCleanup;
    self->_filesToCleanup = 0;

  }
  -[PHMediaFormatConversionManager invalidate](self->_conversionManager, "invalidate", v34);
  conversionManager = self->_conversionManager;
  self->_conversionManager = 0;

  if (self->_p2pRetained)
  {
    v27 = 1.5;
    v28 = sub_10019AAC0(1.5);
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006B688;
    block[3] = &unk_1007146D8;
    block[4] = self;
    dispatch_after(v28, queue, block);
    self->_p2pRetained = 0;
  }
  else
  {
    v27 = 0.0;
    if (!self->_queueSuspended)
      goto LABEL_23;
    sub_10004DE48(self);
    v30 = sub_10004D994();
    v31 = objc_claimAutoreleasedReturnValue(v30);
    dispatch_resume(v31);

  }
  self->_queueSuspended = 0;
LABEL_23:
  if (self->_transactionStarted)
  {
    self->_transactionStarted = 0;
    v32 = sub_10019AAC0(v27);
    v33 = self->_queue;
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_10006B6CC;
    v35[3] = &unk_1007146D8;
    v35[4] = self;
    dispatch_after(v32, v33, v35);
  }
  -[SDAirDropClient releaseIdleSleepAssertion](self, "releaseIdleSleepAssertion");
}

- (void)generatePreviewForFileURL:(id)a3
{
  const __CFURL *v3;
  _QWORD *v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  void *i;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  char *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  const void *v42;
  char j;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  uint64_t v47;
  void *v48;
  id v49;
  NSObject *v50;
  __CFData *v51;
  const __CFData *v52;
  NSObject *v53;
  CGImageRef v54;
  CGImageRef v55;
  _QWORD *v56;
  uint64_t v57;
  uint64_t v58;
  NSObject *v59;
  id v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  NSObject *v65;
  _QWORD v67[5];
  _QWORD v68[5];
  id v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  id v74;
  id propertyValueTypeRefPtr;
  _QWORD v76[5];
  CFErrorRef error;
  uint8_t v78;
  _BYTE v79[15];
  _QWORD v80[2];
  _QWORD v81[2];
  _QWORD v82[4];
  _QWORD v83[4];
  _BYTE v84[128];

  v3 = (const __CFURL *)a3;
  v76[4] = 0;
  error = 0;
  v76[0] = _NSConcreteStackBlock;
  v76[1] = 3221225472;
  v76[2] = sub_10006BFC8;
  v76[3] = &unk_100715590;
  v4 = objc_retainBlock(v76);
  propertyValueTypeRefPtr = 0;
  v5 = CFURLCopyResourcePropertyForKey(v3, kCFURLTypeIdentifierKey, &propertyValueTypeRefPtr, &error);
  if ((_DWORD)v5)
  {
    v65 = objc_claimAutoreleasedReturnValue(-[__CFURL pathExtension](v3, "pathExtension"));
    v6 = SFIsCalendarEvent(propertyValueTypeRefPtr);
    if ((-[NSString isEqual:](self->_clientBundleID, "isEqual:", CFSTR("com.apple.mobilephone")) & 1) != 0
      || (-[NSString isEqual:](self->_clientBundleID, "isEqual:", CFSTR("com.apple.MobileAddressBook")) & 1) != 0)
    {
      v7 = 0;
    }
    else
    {
      v7 = SFIsContact(propertyValueTypeRefPtr, v65);
    }
    if (((v6 | v7) & 1) != 0)
    {
      v74 = 0;
      v9 = objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:options:error:](NSData, "dataWithContentsOfURL:options:error:", v3, 0, &v74));
      v10 = v74;
      v63 = (void *)v9;
      v64 = v10;
      if (!v9)
      {
        v25 = airdrop_log(v10);
        v26 = objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          sub_10006DBBC();
        goto LABEL_66;
      }
      v62 = kSFOperationItemsDescriptionKey;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:"));
      v12 = v11;
      if (v6)
      {
        v13 = objc_msgSend(objc_alloc((Class)EKEventStore), "initWithOptions:path:", 16, CFSTR(":memory:"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "defaultCalendarForNewEvents"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "importICSData:intoCalendar:options:", v63, v14, 0));
        v61 = v13;

        v72 = 0u;
        v73 = 0u;
        v70 = 0u;
        v71 = 0u;
        v16 = v15;
        v17 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v70, v84, 16);
        if (v17)
        {
          v18 = *(_QWORD *)v71;
          while (2)
          {
            for (i = 0; i != v17; i = (char *)i + 1)
            {
              if (*(_QWORD *)v71 != v18)
                objc_enumerationMutation(v16);
              if (v12)
              {
                v20 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * (_QWORD)i);
                v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "title"));
                if (v21)
                {
                  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "startDate"));
                  v23 = v22 == 0;

                  if (!v23)
                  {
                    v83[0] = v12;
                    v82[0] = CFSTR("SFAirDropActivitySubjectMain");
                    v82[1] = CFSTR("SFAirDropActivitySubjectEventTitle");
                    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "title"));
                    v83[1] = v31;
                    v82[2] = CFSTR("SFAirDropActivitySubjectEventStartDate");
                    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "startDate"));
                    v33 = SFDateToStringRFC3339();
                    v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
                    v83[2] = v34;
                    v82[3] = CFSTR("SFAirDropActivitySubjectEventIsAllDay");
                    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v20, "isAllDay")));
                    v83[3] = v35;
                    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v83, v82, 4));

                    goto LABEL_30;
                  }
                }
              }
            }
            v17 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v70, v84, 16);
            if (v17)
              continue;
            break;
          }
        }
        v24 = 0;
LABEL_30:

        v36 = 0;
        goto LABEL_51;
      }
      if (!v7)
      {
        v24 = 0;
        v36 = 0;
LABEL_53:
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:", v12, v62, v60);
        v50 = v36;
        v26 = v50;
        if (v50)
        {
          v51 = sub_1000CE720((uint64_t)-[NSObject CGImage](objc_retainAutorelease(v50), "CGImage"), 0x20000);
          v52 = v51;
          if (v51)
          {
            v68[0] = _NSConcreteStackBlock;
            v68[1] = 3221225472;
            v68[2] = sub_10006BFD8;
            v68[3] = &unk_100715590;
            v68[4] = v51;
            v53 = objc_retainBlock(v68);
            v54 = sub_1000CE310(v52);
            v55 = v54;
            if (v54)
            {
              v67[0] = _NSConcreteStackBlock;
              v67[1] = 3221225472;
              v67[2] = sub_10006BFE0;
              v67[3] = &unk_100715590;
              v67[4] = v54;
              v56 = objc_retainBlock(v67);
              -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:", v55, kSFOperationFileIconKey);
              ((void (*)(_QWORD *))v56[2])(v56);

            }
            else
            {
              v58 = airdrop_log(0);
              v59 = objc_claimAutoreleasedReturnValue(v58);
              if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
                sub_10006DC48();

              -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:", 0, kSFOperationFileIconKey);
            }
            ((void (*))v53[2].isa)(v53);
          }
          else
          {
            v57 = airdrop_log(0);
            v53 = objc_claimAutoreleasedReturnValue(v57);
            if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
              sub_10006DC1C();
          }

        }
        else
        {
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:", 0, kSFOperationFileIconKey);
        }

LABEL_66:
        goto LABEL_67;
      }

      v69 = v64;
      v61 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactVCardSerialization contactsWithData:error:](CNContactVCardSerialization, "contactsWithData:error:", v9, &v69));
      v60 = v69;

      v27 = (char *)objc_msgSend(v61, "count");
      if (!v27)
      {
        v37 = airdrop_log(0);
        v16 = objc_claimAutoreleasedReturnValue(v37);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "localizedDescription"));
          sub_10006DC74(v38, (uint64_t)&v78, v16);
        }
        v36 = 0;
        v24 = 0;
        v12 = 0;
        goto LABEL_50;
      }
      v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "firstObject"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactFormatter stringFromContact:style:](CNContactFormatter, "stringFromContact:style:", v16, 0));
      v12 = v28;
      if (!v28)
      {
        v36 = 0;
        v24 = 0;
LABEL_49:

LABEL_50:
        v64 = v60;
LABEL_51:

        if (v24)
        {
          v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v24, 0, 0));
          v49 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v48, 4);

          v12 = v49;
        }
        goto LABEL_53;
      }
      v29 = v28;
      if ((unint64_t)v27 < 2)
      {
        v24 = 0;
      }
      else
      {
        v80[0] = CFSTR("SFAirDropActivitySubjectMain");
        v80[1] = CFSTR("SFAirDropActivitySubjectOtherContactsCount");
        v81[0] = v29;
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v27 - 1));
        v81[1] = v30;
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v81, v80, 2));

      }
      v39 = objc_claimAutoreleasedReturnValue(-[SDXPCHelperConnection monogramImageDataForContact:style:diameter:monogramsAsFlatImages:isContactImage:](self->_xpcHelperConnection, "monogramImageDataForContact:style:diameter:monogramsAsFlatImages:isContactImage:", v16, 2, 1, 0, 70.0, v60));
      v40 = (void *)v39;
      if (v39)
      {
        v41 = SFCreateCGImageFromData(v39);
        v42 = (const void *)v41;
        v36 = 0;
        for (j = 1; v42 && (j & 1) != 0; j = 0)
        {
          v44 = objc_claimAutoreleasedReturnValue(+[UIImage imageWithCGImage:](UIImage, "imageWithCGImage:", v42));

          CFRelease(v42);
          v36 = (void *)v44;
        }
        if (v36)
          goto LABEL_48;
        v45 = airdrop_log(v41);
        v46 = objc_claimAutoreleasedReturnValue(v45);
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          sub_10006DCF4(&v78, v79, v46);
      }
      else
      {
        v47 = airdrop_log(0);
        v46 = objc_claimAutoreleasedReturnValue(v47);
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          sub_10006DCC0(&v78, v79, v46);
      }

      v36 = 0;
LABEL_48:

      goto LABEL_49;
    }
  }
  else
  {
    v8 = airdrop_log(v5);
    v65 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      sub_10006DB58();
  }
LABEL_67:

  ((void (*)(_QWORD *))v4[2])(v4);
}

- (void)convertMediaItemsWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  char v7;
  NSMutableArray *fileURLs;
  NSString *clientBundleID;
  PHMediaFormatConversionManager *conversionManager;
  OS_dispatch_queue *queue;
  id v12;
  uint64_t v13;
  unsigned int v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropClient receiverMediaCapabilities](self, "receiverMediaCapabilities"));
  v14 = sub_10004FFF4();
  v6 = sub_10005006C();
  v7 = sub_100050024();
  fileURLs = self->_fileURLs;
  clientBundleID = self->_clientBundleID;
  conversionManager = self->_conversionManager;
  queue = self->_queue;
  v16 = v4;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10006C11C;
  v17[3] = &unk_1007156F8;
  v17[4] = self;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10006C230;
  v15[3] = &unk_100715748;
  v15[4] = self;
  v12 = v4;
  LOBYTE(v13) = v7;
  +[SDAirDropLegacyHelper convertMediaItemsWithFileURLs:clientBundleID:conversionManager:mediaCapabilities:supportsLivePhoto:supportsAssetBundles:supportsWideGamut:queue:progressHandler:completionHandler:](SDAirDropLegacyHelper, "convertMediaItemsWithFileURLs:clientBundleID:conversionManager:mediaCapabilities:supportsLivePhoto:supportsAssetBundles:supportsWideGamut:queue:progressHandler:completionHandler:", fileURLs, clientBundleID, conversionManager, v5, v14, v6, v13, queue, v17, v15);

}

- (id)receiverMediaCapabilities
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v7;
  _UNKNOWN **v8;

  v3 = (void *)SFNodeCopyMediaCapabilities(self->_person, a2);
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc((Class)PFMediaCapabilities), "initWithOpaqueRepresentation:", v3);
    if (-[SDAirDropClient receiverDeviceModelNameSuggestsMacPlatform](self, "receiverDeviceModelNameSuggestsMacPlatform"))
    {
      v7 = PFMediaCapabilitiesOutOfBandHintsPlatformKey;
      v8 = &off_10074B358;
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1));
      objc_msgSend(v4, "setOutOfBandHints:", v5);

    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)receiverDeviceModelNameSuggestsMacPlatform
{
  void *v2;
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v2 = (void *)SFNodeCopyModel(self->_person, a2);
  v3 = v2;
  if (v2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lowercaseString"));
    v5 = objc_msgSend(v4, "containsString:", CFSTR("mac"));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  double v17;
  _QWORD block[5];
  id v19;
  id v20;
  id v21;
  void *v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread mainThread](NSThread, "mainThread"));

  if (v13)
  {
    v15 = objc_opt_class(NSProgress, v14);
    if ((objc_opt_isKindOfClass(v11, v15) & 1) != 0)
    {
      v16 = v11;
      if (!self->_conversionNotified)
      {
        self->_conversionNotified = 1;
        -[SDAirDropClient notifyClientForEvent:withProperty:](self, "notifyClientForEvent:withProperty:", 15, 0);
      }
      objc_msgSend(v16, "fractionCompleted");
      -[NSProgress setCompletedUnitCount:](self->_progress, "setCompletedUnitCount:", (uint64_t)(v17 * 100.0 * 0.2));
      -[SDAirDropClient postNotificationForTransferStatus:progress:](self, "postNotificationForTransferStatus:progress:", 15, (double)-[NSProgress completedUnitCount](self->_progress, "completedUnitCount"));

    }
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006C888;
    block[3] = &unk_100714490;
    block[4] = self;
    v19 = v10;
    v20 = v11;
    v21 = v12;
    v22 = a6;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  }
}

- (void)donateTransferInteractionToDuet
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  id v17;
  __CFString *v18;
  __CFString *PreferredIdentifierForTag;
  const __CFString *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  SDAirDropClient *v32;
  void *v33;
  id v34;
  NSMutableArray *obj;
  NSMutableArray *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  void *v41;
  _BYTE v42[128];
  id v43;

  v3 = objc_alloc_init((Class)_CDInteraction);
  objc_msgSend(v3, "setBundleId:", self->_clientBundleID);
  objc_msgSend(v3, "setTargetBundleId:", UIActivityTypeAirDrop);
  objc_msgSend(v3, "setDirection:", 1);
  objc_msgSend(v3, "setMechanism:", 13);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v3, "setEndDate:", v4);

  v5 = objc_alloc((Class)_CDContact);
  v6 = (void *)SFNodeCopyAppleID(self->_person);
  v7 = (void *)SFNodeCopyDisplayName(self->_person);
  v8 = (void *)SFNodeCopyContactIdentifier(self->_person);
  v9 = objc_msgSend(v5, "initWithIdentifier:type:displayName:personId:personIdType:", v6, 2, v7, v8, 3);

  v31 = v9;
  v43 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v43, 1));
  v33 = v3;
  objc_msgSend(v3, "setRecipients:", v10);

  v36 = objc_opt_new(NSMutableArray);
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v32 = self;
  obj = self->_fileURLs;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v38;
    v14 = kUTTagClassFilenameExtension;
    do
    {
      v15 = 0;
      v34 = v12;
      do
      {
        if (*(_QWORD *)v38 != v13)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)v15);
        v17 = objc_alloc_init((Class)_CDAttachment);
        v18 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "pathExtension"));
        PreferredIdentifierForTag = (__CFString *)UTTypeCreatePreferredIdentifierForTag(v14, v18, 0);
        objc_msgSend(v17, "setUti:", PreferredIdentifierForTag);
        if (-[__CFString isEqualToString:](v18, "isEqualToString:", CFSTR("txt")))
        {
          v20 = v14;
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "path"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithContentsOfFile:encoding:error:](NSString, "stringWithContentsOfFile:encoding:error:", v21, 4, 0));

          if (v22)
            objc_msgSend(v17, "setContentText:", v22);

          v14 = v20;
          v12 = v34;
        }
        -[NSMutableArray addObject:](v36, "addObject:", v17);

        v15 = (char *)v15 + 1;
      }
      while (v12 != v15);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v12);
  }

  if (-[NSMutableArray count](v32->_otherStuff, "count"))
  {
    v23 = 0;
    do
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v32->_otherStuff, "objectAtIndexedSubscript:", v23));
      v26 = objc_opt_class(NSString, v25);
      if ((objc_opt_isKindOfClass(v24, v26) & 1) != 0)
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v24));
        if (v27)
        {
          v28 = objc_alloc_init((Class)_CDAttachment);
          objc_msgSend(v28, "setContentURL:", v27);
          objc_msgSend(v28, "setUti:", kUTTypeURL);
          -[NSMutableArray addObject:](v36, "addObject:", v28);

        }
      }

      ++v23;
    }
    while ((unint64_t)-[NSMutableArray count](v32->_otherStuff, "count") > v23);
  }
  objc_msgSend(v33, "setAttachments:", v36);
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[_CDInteractionRecorder interactionRecorder](_CDInteractionRecorder, "interactionRecorder"));
  v41 = v33;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v41, 1));
  objc_msgSend(v29, "recordInteractions:completionHandler:", v30, &stru_100715768);

}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  $115C4C562B26FF47E01F9F4EA65B5887 *result;

  objc_copyStruct(retstr, &self->_auditToken, 32, 1, 0);
  return result;
}

- (void)setAuditToken:(id *)a3
{
  objc_copyStruct(&self->_auditToken, a3, 32, 1, 0);
}

- (int)clientPid
{
  return self->_clientPid;
}

- (void)setClientPid:(int)a3
{
  self->_clientPid = a3;
}

- (NSString)clientBundleID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setClientBundleID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSDictionary)discoveryMetrics
{
  return (NSDictionary *)objc_getProperty(self, a2, 424, 1);
}

- (void)setDiscoveryMetrics:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 424);
}

- (BOOL)shouldPublishProgress
{
  return self->_shouldPublishProgress;
}

- (void)setShouldPublishProgress:(BOOL)a3
{
  self->_shouldPublishProgress = a3;
}

- (SDAirDropClientDelegate)delegate
{
  return (SDAirDropClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_discoveryMetrics, 0);
  objc_storeStrong((id *)&self->_zipper, 0);
  objc_storeStrong((id *)&self->_xpcHelperConnection, 0);
  objc_storeStrong((id *)&self->_filesToCleanup, 0);
  objc_storeStrong((id *)&self->_uploadTask, 0);
  objc_storeStrong((id *)&self->_uploadResponse, 0);
  objc_storeStrong((id *)&self->_transferProgress, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_tmpDirectoryToCleanUp, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_serverURL, 0);
  objc_storeStrong((id *)&self->_sendingLivePhotoJPEGs, 0);
  objc_storeStrong((id *)&self->_resolver, 0);
  objc_storeStrong((id *)&self->_receiverData, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_otherStuff, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
  objc_storeStrong((id *)&self->_metric, 0);
  objc_storeStrong((id *)&self->_mediaFormatConversionDestinations, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_generatedFiles, 0);
  objc_storeStrong((id *)&self->_fileURLToConversionNeeded, 0);
  objc_storeStrong((id *)&self->_fileURLs, 0);
  objc_storeStrong((id *)&self->_discoverTask, 0);
  objc_storeStrong((id *)&self->_discoverResponse, 0);
  objc_storeStrong((id *)&self->_conversionProgress, 0);
  objc_storeStrong((id *)&self->_conversionManager, 0);
  objc_storeStrong((id *)&self->_connectionKey, 0);
  objc_storeStrong((id *)&self->_clientBundleID, 0);
  objc_storeStrong((id *)&self->_askTask, 0);
  objc_storeStrong((id *)&self->_askResponse, 0);
}

@end
