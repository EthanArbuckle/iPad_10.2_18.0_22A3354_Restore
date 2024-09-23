@implementation NDAVAssetDownloadSessionWrapper

- (BOOL)doesAVAssetDownloadSessionSupportMultipleDownloads
{
  return objc_opt_respondsToSelector(AVAssetDownloadSession, "assetDownloadSessionWithAsset:mediaSelections:destinationURL:options:") & 1;
}

- (NDAVAssetDownloadSessionWrapper)initWithURL:(id)a3 destinationURL:(id)a4 options:(id)a5 delegate:(id)a6 queue:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  NDAVAssetDownloadSessionWrapper *v17;
  NDAVAssetDownloadSessionWrapper *v18;
  uint64_t v19;
  AVAssetDownloadSession *downloadSession;
  dispatch_queue_attr_t v21;
  NSObject *v22;
  dispatch_queue_t v23;
  OS_dispatch_queue *callbackQueue;
  id v26;
  objc_super v27;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v26 = a7;
  v27.receiver = self;
  v27.super_class = (Class)NDAVAssetDownloadSessionWrapper;
  v17 = -[NDAVAssetDownloadSessionWrapper init](&v27, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_URL, a3);
    objc_storeStrong((id *)&v18->_destinationURL, a4);
    objc_storeStrong((id *)&v18->_options, a5);
    objc_storeWeak((id *)&v18->_delegate, v16);
    objc_storeStrong((id *)&v18->_delegateQueue, a7);
    v19 = objc_claimAutoreleasedReturnValue(+[AVAssetDownloadSession assetDownloadSessionWithURL:destinationURL:options:](AVAssetDownloadSession, "assetDownloadSessionWithURL:destinationURL:options:", v13, v14, v15));
    downloadSession = v18->_downloadSession;
    v18->_downloadSession = (AVAssetDownloadSession *)v19;

    if (v18->_downloadSession)
    {
      v21 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v22 = objc_claimAutoreleasedReturnValue(v21);
      v23 = dispatch_queue_create("com.apple.nsurlsessionf.avassetdownloadersessionwrappercallback", v22);
      callbackQueue = v18->_callbackQueue;
      v18->_callbackQueue = (OS_dispatch_queue *)v23;

      -[AVAssetDownloadSession setDelegate:queue:](v18->_downloadSession, "setDelegate:queue:", v18, v18->_callbackQueue);
      v18->_downloadToken = (unint64_t)-[AVAssetDownloadSession downloadToken](v18->_downloadSession, "downloadToken");
    }
    else
    {

      v18 = 0;
    }
  }

  return v18;
}

- (NDAVAssetDownloadSessionWrapper)initWithURLAsset:(id)a3 destinationURL:(id)a4 options:(id)a5 delegate:(id)a6 queue:(id)a7
{
  id v13;
  id v14;
  NDAVAssetDownloadSessionWrapper *v15;
  void *v16;
  BOOL v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *i;
  id v24;
  void *v25;
  BOOL v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  void *j;
  id v32;
  void *v33;
  BOOL v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  BOOL v40;
  void *v41;
  uint64_t v42;
  AVAssetDownloadSession *downloadSession;
  dispatch_queue_attr_t v44;
  NSObject *v45;
  dispatch_queue_t v46;
  OS_dispatch_queue *callbackQueue;
  void *v49;
  void *v50;
  id v51;
  id v52;
  id v53;
  id v54;
  NDAVAssetDownloadSessionWrapper *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  objc_super v64;
  _BYTE v65[128];
  _BYTE v66[128];

  v13 = a3;
  v53 = a4;
  v14 = a5;
  v54 = a6;
  v52 = a7;
  v64.receiver = self;
  v64.super_class = (Class)NDAVAssetDownloadSessionWrapper;
  v15 = -[NDAVAssetDownloadSessionWrapper init](&v64, "init");
  v55 = v15;
  if (!v15)
    goto LABEL_34;
  objc_storeStrong((id *)&v15->_asset, a3);
  objc_storeStrong((id *)&v55->_destinationURL, a4);
  if (v14)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("AVAssetDownloadSessionMediaSelectionArrayKey")));
    v17 = v16 == 0;

    if (v17)
    {
      v19 = 0;
    }
    else
    {
      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", CFSTR("AVAssetDownloadSessionMediaSelectionArrayKey")));
      v18 = objc_msgSend(v14, "mutableCopy");
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      v62 = 0u;
      v63 = 0u;
      v60 = 0u;
      v61 = 0u;
      v20 = v50;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
      if (v21)
      {
        v22 = *(_QWORD *)v61;
        do
        {
          for (i = 0; i != v21; i = (char *)i + 1)
          {
            if (*(_QWORD *)v61 != v22)
              objc_enumerationMutation(v20);
            v24 = objc_msgSend(objc_alloc((Class)AVMediaSelection), "initWithAsset:propertyList:", v13, *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * (_QWORD)i));
            if (v24)
              objc_msgSend(v19, "addObject:", v24);

          }
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
        }
        while (v21);
      }

      objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, CFSTR("AVAssetDownloadSessionMediaSelectionArrayKey"));
      if (!v18)
        goto LABEL_30;
      v14 = v18;
    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("AVAssetDownloadTaskMediaSelectionsForMultichannelKey")));
    v26 = v25 == 0;

    if (v26)
      goto LABEL_28;
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("AVAssetDownloadTaskMediaSelectionsForMultichannelKey")));
    v51 = objc_msgSend(v14, "mutableCopy");
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v28 = v49;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
    if (v29)
    {
      v30 = *(_QWORD *)v57;
      do
      {
        for (j = 0; j != v29; j = (char *)j + 1)
        {
          if (*(_QWORD *)v57 != v30)
            objc_enumerationMutation(v28);
          v32 = objc_msgSend(objc_alloc((Class)AVMediaSelection), "initWithAsset:propertyList:", v13, *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * (_QWORD)j));
          if (v32)
            objc_msgSend(v27, "addObject:", v32);

        }
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
      }
      while (v29);
    }

    objc_msgSend(v51, "setObject:forKeyedSubscript:", v27, CFSTR("AVAssetDownloadTaskMediaSelectionsForMultichannelKey"));
    v14 = v51;
    if (v51)
    {
LABEL_28:
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("AVAssetDownloadTaskMediaSelectionKey")));
      v34 = v33 == 0;

      if (v34)
      {
        v36 = v14;
      }
      else
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("AVAssetDownloadTaskMediaSelectionKey")));
        v36 = objc_msgSend(v14, "mutableCopy");
        v37 = objc_msgSend(objc_alloc((Class)AVMediaSelection), "initWithAsset:propertyList:", v13, v35);
        objc_msgSend(v36, "setObject:forKeyedSubscript:", v37, AVAssetDownloadSessionMediaSelectionKey);
        objc_msgSend(v36, "removeObjectForKey:", CFSTR("AVAssetDownloadTaskMediaSelectionKey"));

      }
      goto LABEL_31;
    }
  }
  else
  {
    v19 = 0;
  }
LABEL_30:
  v36 = 0;
LABEL_31:
  v38 = objc_msgSend(v36, "mutableCopy");
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("AVAssetDownloadTaskMinimumRequiredMediaBitrateKey")));
  v40 = v39 == 0;

  if (!v40)
  {
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("AVAssetDownloadTaskMinimumRequiredMediaBitrateKey")));
    objc_msgSend(v38, "setObject:forKeyedSubscript:", v41, AVAssetDownloadSessionMinimumRequiredMediaBitrateKey);

    objc_msgSend(v38, "removeObjectForKey:", CFSTR("AVAssetDownloadTaskMinimumRequiredMediaBitrateKey"));
  }
  v14 = v38;

  objc_storeStrong((id *)&v55->_options, v38);
  objc_storeWeak((id *)&v55->_delegate, v54);
  objc_storeStrong((id *)&v55->_delegateQueue, a7);
  v42 = objc_claimAutoreleasedReturnValue(+[AVAssetDownloadSession assetDownloadSessionWithAsset:mediaSelections:destinationURL:options:](AVAssetDownloadSession, "assetDownloadSessionWithAsset:mediaSelections:destinationURL:options:", v13, v19, v53, v14));
  downloadSession = v55->_downloadSession;
  v55->_downloadSession = (AVAssetDownloadSession *)v42;

  v44 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v45 = objc_claimAutoreleasedReturnValue(v44);
  v46 = dispatch_queue_create("com.apple.nsurlsessionf.avassetdownloadersessionwrappercallback", v45);
  callbackQueue = v55->_callbackQueue;
  v55->_callbackQueue = (OS_dispatch_queue *)v46;

  -[AVAssetDownloadSession setDelegate:queue:](v55->_downloadSession, "setDelegate:queue:", v55, v55->_callbackQueue);
  v55->_downloadToken = (unint64_t)-[AVAssetDownloadSession downloadToken](v55->_downloadSession, "downloadToken");

LABEL_34:
  return v55;
}

- (void)disavowSession
{
  NSObject *v3;
  OS_dispatch_queue *callbackQueue;
  int v5;
  NDAVAssetDownloadSessionWrapper *v6;

  -[NDAVAssetDownloadSessionWrapper releasePowerAssertion](self, "releasePowerAssertion");
  v3 = qword_1000C7158;
  if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 134217984;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%p Disavowing AVAssetDownloadSession", (uint8_t *)&v5, 0xCu);
  }
  -[NDAVAssetDownloadSessionWrapper setDownloadSession:](self, "setDownloadSession:", 0);
  callbackQueue = self->_callbackQueue;
  self->_callbackQueue = 0;

}

- (void)takePowerAssertion
{
  NDAVAssetDownloadSessionWrapper *v2;
  NSObject *v3;
  unint64_t downloadToken;
  unint64_t taskIdentifier;
  void *v6;
  void *v7;
  const __CFDictionary *v8;
  NSObject *v9;
  unint64_t v10;
  unint64_t v11;
  IOPMAssertionID AssertionID;
  _QWORD v13[5];
  _QWORD v14[5];
  uint8_t buf[4];
  unint64_t v16;
  __int16 v17;
  unint64_t v18;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_powerAssertion)
  {
    v3 = qword_1000C7158;
    if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
    {
      downloadToken = v2->_downloadToken;
      taskIdentifier = v2->_taskIdentifier;
      *(_DWORD *)buf = 134218240;
      v16 = downloadToken;
      v17 = 2048;
      v18 = taskIdentifier;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Taking power assertion for AVAssetDownloadSessionWrapper %llu with taskIdentifier %lu", buf, 0x16u);
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v2->_options, "objectForKeyedSubscript:", AVAssetDownloadSessionClientBundleIdentifierKey));
    v13[0] = CFSTR("AssertType");
    v13[1] = CFSTR("AssertLevel");
    v14[0] = CFSTR("PreventUserIdleSystemSleep");
    v14[1] = &off_1000B4970;
    v13[2] = CFSTR("AssertName");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("AVAssetDownloadSessionWrapper %llu (%@)"), v2->_downloadToken, v6));
    v14[2] = v7;
    v14[3] = &off_1000B4988;
    v13[3] = CFSTR("TimeoutSeconds");
    v13[4] = CFSTR("TimeoutAction");
    v14[4] = CFSTR("TimeoutActionTurnOff");
    v8 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 5));

    AssertionID = 0;
    if (IOPMAssertionCreateWithProperties(v8, &AssertionID))
    {
      v9 = qword_1000C7158;
      if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
      {
        v10 = v2->_downloadToken;
        v11 = v2->_taskIdentifier;
        *(_DWORD *)buf = 134218240;
        v16 = v10;
        v17 = 2048;
        v18 = v11;
        _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to take power assertion for AVAssetDownloadSessionWrapper %llu with taskIdentifier %lu", buf, 0x16u);
      }
    }
    else
    {
      v2->_powerAssertion = AssertionID;
    }

  }
  objc_sync_exit(v2);

}

- (void)releasePowerAssertion
{
  NDAVAssetDownloadSessionWrapper *v2;
  IOPMAssertionID powerAssertion;
  NSObject *v4;
  unint64_t downloadToken;
  unint64_t taskIdentifier;
  int v7;
  unint64_t v8;
  __int16 v9;
  unint64_t v10;

  v2 = self;
  objc_sync_enter(v2);
  powerAssertion = v2->_powerAssertion;
  if (powerAssertion)
  {
    v4 = qword_1000C7158;
    if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
    {
      downloadToken = v2->_downloadToken;
      taskIdentifier = v2->_taskIdentifier;
      v7 = 134218240;
      v8 = downloadToken;
      v9 = 2048;
      v10 = taskIdentifier;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Releasing power assertion for AVAssetDownloadSessionWrapper %llu with taskIdentifier %lu", (uint8_t *)&v7, 0x16u);
      powerAssertion = v2->_powerAssertion;
    }
    IOPMAssertionRelease(powerAssertion);
    v2->_powerAssertion = 0;
  }
  objc_sync_exit(v2);

}

- (void)resume
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  -[NDAVAssetDownloadSessionWrapper takePowerAssertion](self, "takePowerAssertion");
  v3 = qword_1000C7158;
  if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting AVAssetDownloadSession", v5, 2u);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NDAVAssetDownloadSessionWrapper downloadSession](self, "downloadSession"));
  objc_msgSend(v4, "start");

}

- (void)suspend
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NDAVAssetDownloadSessionWrapper downloadSession](self, "downloadSession"));
  objc_msgSend(v3, "pause");

  -[NDAVAssetDownloadSessionWrapper releasePowerAssertion](self, "releasePowerAssertion");
}

- (void)cancel
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NDAVAssetDownloadSessionWrapper downloadSession](self, "downloadSession"));
  objc_msgSend(v3, "stop");

  -[NDAVAssetDownloadSessionWrapper disavowSession](self, "disavowSession");
}

- (void)cancelAndDeliverError:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  -[NDAVAssetDownloadSessionWrapper cancel](self, "cancel");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "NDAVAssetDownloadSessionWrapper:didCompleteWithError:", self, v5);

}

- (void)startLoadingMetadata
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[NDAVAssetDownloadSessionWrapper downloadSession](self, "downloadSession"));
  objc_msgSend(v2, "startLoadingMetadata");

}

- (void)assetDownloadSessionDidFinishDownload:(id)a3
{
  NSObject *v4;
  NSObject *delegateQueue;
  _QWORD block[5];
  uint8_t buf[16];

  v4 = qword_1000C7158;
  if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "AVAssetDownloadSession download complete", buf, 2u);
  }
  delegateQueue = self->_delegateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002F058;
  block[3] = &unk_1000B23A0;
  block[4] = self;
  dispatch_async(delegateQueue, block);
}

- (void)assetDownloadSession:(id)a3 didFailWithError:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *delegateQueue;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[16];

  v5 = a4;
  v6 = qword_1000C7158;
  if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "AVAssetDownloadSession download failed", buf, 2u);
  }
  delegateQueue = self->_delegateQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002EFFC;
  v9[3] = &unk_1000B23F0;
  v9[4] = self;
  v10 = v5;
  v8 = v5;
  dispatch_async(delegateQueue, v9);

}

- (void)assetDownloadSession:(id)a3 didLoadTimeRange:(id *)a4 totalTimeRangesLoaded:(id)a5 timeRangeExpectedToLoad:(id *)a6 forMediaSelection:(id)a7
{
  id v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  NSObject *delegateQueue;
  __int128 v17;
  id v18;
  id v19;
  _QWORD block[5];
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;

  v11 = a5;
  v12 = a7;
  block[1] = 3221225472;
  v13 = *(_OWORD *)&a4->var0.var3;
  v23 = *(_OWORD *)&a4->var0.var0;
  v24 = v13;
  v14 = *(_OWORD *)&a6->var0.var0;
  v15 = *(_OWORD *)&a6->var0.var3;
  v25 = *(_OWORD *)&a4->var1.var1;
  v26 = v14;
  delegateQueue = self->_delegateQueue;
  block[0] = _NSConcreteStackBlock;
  block[2] = sub_10002EEF4;
  block[3] = &unk_1000B10F8;
  v17 = *(_OWORD *)&a6->var1.var1;
  v27 = v15;
  v28 = v17;
  block[4] = self;
  v21 = v11;
  v22 = v12;
  v18 = v12;
  v19 = v11;
  dispatch_async(delegateQueue, block);

}

- (void)assetDownloadSession:(id)a3 didFinishDownloadForMediaSelection:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *delegateQueue;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[16];

  v5 = a4;
  v6 = qword_1000C7158;
  if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "AVAssetDownloadSession download finished for media selection", buf, 2u);
  }
  delegateQueue = self->_delegateQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002EE78;
  v9[3] = &unk_1000B23F0;
  v9[4] = self;
  v10 = v5;
  v8 = v5;
  dispatch_async(delegateQueue, v9);

}

- (void)assetDownloadSession:(id)a3 didResolveMediaSelection:(id)a4
{
  id v5;
  NSObject *delegateQueue;
  id v7;
  _QWORD v8[4];
  id v9;
  NDAVAssetDownloadSessionWrapper *v10;

  v5 = a4;
  delegateQueue = self->_delegateQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10002EDE4;
  v8[3] = &unk_1000B23F0;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(delegateQueue, v8);

}

- (void)assetDownloadSession:(id)a3 didUpdateProgressWithExpectedBytes:(unint64_t)a4 bytesDownloaded:(unint64_t)a5
{
  NSObject *delegateQueue;
  _QWORD block[7];

  delegateQueue = self->_delegateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002ED38;
  block[3] = &unk_1000B1120;
  block[4] = self;
  block[5] = a5;
  block[6] = a4;
  dispatch_async(delegateQueue, block);
}

- (void)assetDownloadSession:(id)a3 willDownloadVariants:(id)a4
{
  id v5;
  NSObject *delegateQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  delegateQueue = self->_delegateQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10002ECE4;
  v8[3] = &unk_1000B23F0;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(delegateQueue, v8);

}

- (AVAssetDownloadSession)downloadSession
{
  return (AVAssetDownloadSession *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDownloadSession:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NDAVAssetDownloadSessionWrapperDelegate)delegate
{
  return (NDAVAssetDownloadSessionWrapperDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (OS_dispatch_queue)delegateQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 64, 1);
}

- (NSURL)URL
{
  return (NSURL *)objc_getProperty(self, a2, 72, 1);
}

- (NSURL)destinationURL
{
  return (NSURL *)objc_getProperty(self, a2, 80, 1);
}

- (NSDictionary)options
{
  return (NSDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (unint64_t)downloadToken
{
  return self->_downloadToken;
}

- (unint64_t)countOfBytesWritten
{
  return self->_countOfBytesWritten;
}

- (void)setCountOfBytesWritten:(unint64_t)a3
{
  self->_countOfBytesWritten = a3;
}

- (unint64_t)countOfBytesExpectedToWrite
{
  return self->_countOfBytesExpectedToWrite;
}

- (void)setCountOfBytesExpectedToWrite:(unint64_t)a3
{
  self->_countOfBytesExpectedToWrite = a3;
}

- (unint64_t)taskIdentifier
{
  return self->_taskIdentifier;
}

- (void)setTaskIdentifier:(unint64_t)a3
{
  self->_taskIdentifier = a3;
}

- (BOOL)progressTimerRunning
{
  return self->_progressTimerRunning;
}

- (void)setProgressTimerRunning:(BOOL)a3
{
  self->_progressTimerRunning = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_destinationURL, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_downloadSession, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

@end
