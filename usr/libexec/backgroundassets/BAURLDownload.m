@implementation BAURLDownload

- (void)dealloc
{
  os_unfair_lock_s *v3;
  objc_super v4;

  v3 = -[BADownload downloadLock](self, "downloadLock");
  os_unfair_lock_lock(v3);
  -[BADownload _removeActivityAndPowerAssertion](self, "_removeActivityAndPowerAssertion");
  os_unfair_lock_unlock(v3);
  v4.receiver = self;
  v4.super_class = (Class)BAURLDownload;
  -[BAURLDownload dealloc](&v4, "dealloc");
}

- (BOOL)startDownloadWithDelegate:(id)a3 error:(id *)a4
{
  id v6;
  os_unfair_lock_s *v7;

  v6 = a3;
  v7 = -[BADownload downloadLock](self, "downloadLock");
  os_unfair_lock_lock(v7);
  LOBYTE(a4) = -[BAURLDownload _startDownloadWithDelegate:error:](self, "_startDownloadWithDelegate:error:", v6, a4);
  os_unfair_lock_unlock(v7);

  return (char)a4;
}

- (BOOL)_startDownloadWithDelegate:(id)a3 error:(id *)a4
{
  id v5;
  unsigned int v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  char isKindOfClass;
  void *v22;
  id v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *i;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  unsigned int v37;
  id v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  BOOL v48;
  void *v49;
  _BOOL4 v50;
  void *v51;
  unsigned int v52;
  uint64_t v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  BAURLSession *v58;
  void *v59;
  void *v60;
  void *v61;
  unsigned int v62;
  id *v63;
  BAURLSession *v64;
  unsigned int v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  char v71;
  NSObject *v72;
  void *v73;
  int64_t v74;
  void *v75;
  void *v76;
  double v77;
  void *v78;
  void *v79;
  id v80;
  id v81;
  NSObject *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  id v89;
  void *v91;
  unsigned int v92;
  id obj;
  id obja;
  unsigned int v95;
  void *v96;
  _QWORD v98[5];
  char v99;
  _QWORD v100[4];
  id v101;
  _QWORD block[5];
  _QWORD v103[4];
  id v104;
  _QWORD v105[4];
  id v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  uint8_t v111[128];
  uint8_t buf[4];
  BAURLDownload *v113;

  v5 = a3;
  os_unfair_lock_assert_owner(-[BADownload downloadLock](self, "downloadLock"));
  v96 = v5;
  -[BADownload setDelegate:](self, "setDelegate:", v5);
  sub_10002FBB8(self, 2);
  -[BADownload setDownloadError:](self, "setDownloadError:", 0);
  -[BAURLDownload setBailError:](self, "setBailError:", 0);
  v6 = -[BADownload isForegroundDownload](self, "isForegroundDownload");
  if ((id)-[BAURLDownload stopRequest](self, "stopRequest") == (id)6)
  {
    v7 = sub_100012A44();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v113 = self;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Download timed out awaiting connectivity. Restarting Download: %{public}@", buf, 0xCu);
    }

    v95 = 0;
  }
  else
  {
    v95 = v6;
  }
  -[BAURLDownload setStopRequest:](self, "setStopRequest:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BAURLDownload request](self, "request"));
  v10 = objc_msgSend(v9, "mutableCopy");

  v12 = objc_opt_class(NSMutableURLRequest, v11);
  if ((objc_opt_isKindOfClass(v10, v12) & 1) == 0)
    goto LABEL_27;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "URL"));
  v15 = objc_opt_class(NSURL, v14);
  if ((objc_opt_isKindOfClass(v13, v15) & 1) == 0)
  {

    goto LABEL_27;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "URL"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "scheme"));
  v18 = objc_msgSend(v17, "caseInsensitiveCompare:", CFSTR("https")) == 0;

  if (!v18)
  {
LABEL_27:
    if (!a4)
    {
LABEL_59:
      v48 = 0;
      goto LABEL_60;
    }
    v47 = sub_1000272FC(-205);
    v48 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue(v47);
    goto LABEL_60;
  }
  v20 = objc_opt_class(BAManifestDownload, v19);
  isKindOfClass = objc_opt_isKindOfClass(self, v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload applicationInfo](self, "applicationInfo"));

  v92 = isKindOfClass & 1;
  if (v22)
  {
    v23 = sub_100012A44();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v113 = self;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Download %{public}@ is restricted, validating.", buf, 0xCu);
    }

    v25 = objc_claimAutoreleasedReturnValue(-[BAURLDownload request](self, "request"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v25, "URL"));
    v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "host"));

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload applicationInfo](self, "applicationInfo"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "allowedDownloadDomains"));
    LOBYTE(v25) = objc_msgSend(v28, "containsObject:", v91);

    if ((v25 & 1) == 0)
    {
      v109 = 0u;
      v110 = 0u;
      v107 = 0u;
      v108 = 0u;
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload applicationInfo](self, "applicationInfo"));
      obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "allowedDownloadDomainWildcards"));

      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v107, v111, 16);
      if (v30)
      {
        v31 = *(_QWORD *)v108;
        while (2)
        {
          for (i = 0; i != v30; i = (char *)i + 1)
          {
            if (*(_QWORD *)v108 != v31)
              objc_enumerationMutation(obj);
            v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v107 + 1) + 8 * (_QWORD)i), "substringFromIndex:", 1, v91));
            v34 = (void *)objc_claimAutoreleasedReturnValue(-[BAURLDownload request](self, "request"));
            v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "URL"));
            v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "host"));
            v37 = objc_msgSend(v36, "hasSuffix:", v33);

            if (v37)
            {

              goto LABEL_30;
            }
          }
          v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v107, v111, 16);
          if (v30)
            continue;
          break;
        }
      }

      if ((v92 & 1) == 0)
      {
        v38 = sub_100012A44();
        v39 = objc_claimAutoreleasedReturnValue(v38);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          sub_100034E10((uint64_t)self, v39, v40, v41, v42, v43, v44, v45);

        if (!a4)
          goto LABEL_58;
        v46 = 202;
LABEL_57:
        v89 = sub_1000272FC(v46);
        *a4 = (id)objc_claimAutoreleasedReturnValue(v89);
LABEL_58:

        goto LABEL_59;
      }
    }
LABEL_30:
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload applicationInfo](self, "applicationInfo", v91));
    v50 = objc_msgSend(v49, "remainingDownloadAllowanceWithNecessity:isManifest:", -[BADownload necessity](self, "necessity"), v92) == 0;

    if (v50)
    {
      v81 = sub_100012A44();
      v82 = objc_claimAutoreleasedReturnValue(v81);
      if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
        sub_100034DAC((uint64_t)self, v82, v83, v84, v85, v86, v87, v88);

      if (!a4)
        goto LABEL_58;
      v46 = 203;
      goto LABEL_57;
    }

  }
  if (-[BADownload isForegroundDownload](self, "isForegroundDownload"))
  {
    obja = (id)objc_claimAutoreleasedReturnValue(+[NSURLSessionConfiguration defaultSessionConfiguration](NSURLSessionConfiguration, "defaultSessionConfiguration"));
    objc_msgSend(obja, "setAllowsExpensiveNetworkAccess:", 1);
    objc_msgSend(obja, "setTimeoutIntervalForRequest:", 60.0);
    objc_msgSend(obja, "setWaitsForConnectivity:", v95);
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload applicationInfo](self, "applicationInfo"));
    if (v51)
    {
      v52 = -[BADownload permitInitialCellularDownload](self, "permitInitialCellularDownload");

      if (v52)
        objc_msgSend(obja, "setAllowsCellularAccess:", 1);
    }
    v53 = 7;
  }
  else
  {
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload uniqueIdentifier](self, "uniqueIdentifier"));
    obja = (id)objc_claimAutoreleasedReturnValue(+[NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:](NSURLSessionConfiguration, "backgroundSessionConfigurationWithIdentifier:", v54));

    objc_msgSend(obja, "setAllowsCellularAccess:", 0);
    objc_msgSend(obja, "setAllowsExpensiveNetworkAccess:", 0);
    objc_msgSend(obja, "set_allowsRetryForBackgroundDataTasks:", 0);
    objc_msgSend(v10, "setAllowsCellularAccess:", objc_msgSend(obja, "allowsCellularAccess"));
    objc_msgSend(v10, "setAllowsExpensiveNetworkAccess:", objc_msgSend(obja, "allowsExpensiveNetworkAccess"));
    objc_msgSend(v10, "setNetworkServiceType:", 3);
    v53 = 3;
  }
  sub_10002FBB8(self, v53);
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload applicationIdentifier](self, "applicationIdentifier"));
  objc_msgSend(obja, "set_sourceApplicationBundleIdentifier:", v55);

  v56 = objc_msgSend(v10, "copy");
  -[BAURLDownload setRequest:](self, "setRequest:", v56);

  objc_initWeak((id *)buf, self);
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload resumeData](self, "resumeData"));

  v58 = [BAURLSession alloc];
  if (v57)
  {
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload resumeData](self, "resumeData"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload downloadCachePath](self, "downloadCachePath"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v60, 1));
    v62 = -[BADownload isForegroundDownload](self, "isForegroundDownload");
    v105[0] = _NSConcreteStackBlock;
    v105[1] = 3221225472;
    v105[2] = sub_10000621C;
    v105[3] = &unk_100058970;
    v63 = &v106;
    objc_copyWeak(&v106, (id *)buf);
    v64 = -[BAURLSession initWithResumeData:withDestinationDirectory:inBackground:withAuthenticationHandler:withRedirectResponseHandler:](v58, "initWithResumeData:withDestinationDirectory:inBackground:withAuthenticationHandler:withRedirectResponseHandler:", v59, v61, v62 ^ 1, v105, 0);
    -[BADownload setSession:](self, "setSession:", v64);
  }
  else
  {
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[BAURLDownload request](self, "request"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload downloadCachePath](self, "downloadCachePath"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v60, 1));
    v65 = -[BADownload isForegroundDownload](self, "isForegroundDownload");
    v103[0] = _NSConcreteStackBlock;
    v103[1] = 3221225472;
    v103[2] = sub_100006280;
    v103[3] = &unk_100058970;
    v63 = &v104;
    objc_copyWeak(&v104, (id *)buf);
    v64 = -[BAURLSession initWithURLRequest:withDestinationDirectory:inBackground:withAuthenticationHandler:](v58, "initWithURLRequest:withDestinationDirectory:inBackground:withAuthenticationHandler:", v59, v61, v65 ^ 1, v103);
    -[BADownload setSession:](self, "setSession:", v64);
  }

  objc_destroyWeak(v63);
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload session](self, "session"));
  v48 = v66 != 0;

  if (v48)
  {
    v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    -[BADownload setDownloadStartDate:](self, "setDownloadStartDate:", v67);

    v68 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload uniqueIdentifier](self, "uniqueIdentifier"));
    -[BADownload _addActivityWithIdentifier:takePowerAssertion:](self, "_addActivityWithIdentifier:takePowerAssertion:", v68, -[BADownload isForegroundDownload](self, "isForegroundDownload"));

    v69 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload delegate](self, "delegate"));
    if (v69)
    {
      v70 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload delegate](self, "delegate"));
      v71 = objc_opt_respondsToSelector(v70, "downloadDidBegin:");

      if ((v71 & 1) != 0)
      {
        v72 = objc_claimAutoreleasedReturnValue(-[BADownload responseQueue](self, "responseQueue"));
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1000062E4;
        block[3] = &unk_100058998;
        block[4] = self;
        dispatch_async(v72, block);

      }
    }
    v73 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload session](self, "session"));
    objc_msgSend(v73, "setUseUniqueFileName:", 1);

    if (v95)
    {
      v74 = -[BADownload necessity](self, "necessity");
      v75 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload session](self, "session"));
      v76 = v75;
      v77 = 60.0;
      if (v74 == 1)
        v77 = 10.0;
      objc_msgSend(v75, "setInitialConnectivityTimeout:", v77);

    }
    v78 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload session](self, "session"));
    v79 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload responseQueue](self, "responseQueue"));
    v100[0] = _NSConcreteStackBlock;
    v100[1] = 3221225472;
    v100[2] = sub_100006324;
    v100[3] = &unk_1000589C0;
    objc_copyWeak(&v101, (id *)buf);
    v98[0] = _NSConcreteStackBlock;
    v98[1] = 3221225472;
    v98[2] = sub_100006380;
    v98[3] = &unk_1000589E8;
    v98[4] = self;
    v99 = v92;
    objc_msgSend(v78, "startAsyncDownloadNotifyingOnQueue:sessionConfiguration:bytesReceivedHandler:completionHandler:", v79, obja, v100, v98);

    objc_destroyWeak(&v101);
  }
  else if (a4)
  {
    v80 = sub_1000272FC(-200);
    *a4 = (id)objc_claimAutoreleasedReturnValue(v80);
  }
  objc_destroyWeak((id *)buf);

LABEL_60:
  return v48;
}

- (void)_handleDownloadFailureWithError:(id)a3 resumeData:(id)a4 response:(id)a5
{
  id v8;
  id v9;
  id v10;
  os_unfair_lock_s *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  unsigned __int8 v27;
  id v28;
  id v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[BADownload downloadLock](self, "downloadLock");
  os_unfair_lock_lock(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload session](self, "session"));
  objc_msgSend(v12, "invalidate");

  -[BADownload setSession:](self, "setSession:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BAURLDownload bailError](self, "bailError"));

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BAURLDownload bailError](self, "bailError"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "userInfo"));
    v16 = objc_msgSend(v15, "mutableCopy");

    objc_msgSend(v16, "setObject:forKey:", v8, NSUnderlyingErrorKey);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[BAURLDownload bailError](self, "bailError"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "domain"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[BAURLDownload bailError](self, "bailError"));
    v20 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v18, objc_msgSend(v19, "code"), v16));

    v8 = (id)v20;
  }
  v21 = -[BAURLDownload stopRequest](self, "stopRequest");
  v23 = 0;
  v24 = 0;
  switch(v21)
  {
    case 1:
      goto LABEL_13;
    case 2:
      v23 = 1;
      goto LABEL_13;
    case 3:
      goto LABEL_6;
    case 4:
      v24 = 1;
      goto LABEL_8;
    case 5:
LABEL_8:
      -[BADownload setIsForegroundDownload:](self, "setIsForegroundDownload:", v24, 0);
      goto LABEL_9;
    case 6:
LABEL_9:
      -[BADownload setResumeData:](self, "setResumeData:", v9, v23);
      -[BAURLDownload _informDelegateOfPausedDownloadWithWillImmediatelyResume:](self, "_informDelegateOfPausedDownloadWithWillImmediatelyResume:", 1);
      v25 = objc_autoreleasePoolPush();
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload delegate](self, "delegate"));
      v29 = 0;
      v27 = -[BAURLDownload _startDownloadWithDelegate:error:](self, "_startDownloadWithDelegate:error:", v26, &v29);
      v28 = v29;

      objc_autoreleasePoolPop(v25);
      if ((v27 & 1) == 0)
        -[BAURLDownload _informDelegateOfFailedDownloadWithError:silentFailure:](self, "_informDelegateOfFailedDownloadWithError:silentFailure:", v28, 0);

      break;
    default:
      if ((objc_msgSend((id)objc_opt_class(self, v22), "_cellularNetworkProhibitsDownloadUsingError:", v8) & 1) != 0)
      {
LABEL_6:
        -[BADownload setResumeData:](self, "setResumeData:", v9, v23);
        -[BAURLDownload _informDelegateOfPausedDownloadWithWillImmediatelyResume:](self, "_informDelegateOfPausedDownloadWithWillImmediatelyResume:", 0);
      }
      else
      {
        v23 = 0;
LABEL_13:
        -[BAURLDownload _informDelegateOfFailedDownloadWithError:silentFailure:](self, "_informDelegateOfFailedDownloadWithError:silentFailure:", v8, v23);
      }
      -[BADownload _removeActivityAndPowerAssertion](self, "_removeActivityAndPowerAssertion");
      break;
  }
  os_unfair_lock_unlock(v11);

}

- (void)_handleDownloadCompletionWithFileLocation:(id)a3 response:(id)a4
{
  char *v5;
  const char *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  id v13;

  v5 = (char *)a3;
  os_unfair_lock_lock(-[BADownload downloadLock](self, "downloadLock"));
  sub_10002FC00(self, v5);

  sub_10002FBB8(self, 8);
  -[BADownload setDownloadError:](self, "setDownloadError:", 0);
  -[BADownload setResumeData:](self, "setResumeData:", 0);
  v7 = sub_100030230(self, v6);
  v13 = (id)objc_claimAutoreleasedReturnValue(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[BAURLDownload amountDownloaded](self, "amountDownloaded")));
  -[BADownload setDownloadedFileSize:](self, "setDownloadedFileSize:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload session](self, "session"));
  objc_msgSend(v9, "invalidate");

  -[BADownload setSession:](self, "setSession:", 0);
  -[BADownload _removeActivityAndPowerAssertion](self, "_removeActivityAndPowerAssertion");
  os_unfair_lock_unlock(-[BADownload downloadLock](self, "downloadLock"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload delegate](self, "delegate"));
  v11 = objc_opt_respondsToSelector(v10, "download:finishedWithFileURL:");

  if ((v11 & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload delegate](self, "delegate"));
    objc_msgSend(v12, "download:finishedWithFileURL:", self, v13);

  }
}

- (void)_handleProgressWithBytesReceived:(unint64_t)a3 totalBytesRecieved:(unint64_t)a4 totalDownloadSize:(int64_t)a5 resuming:(BOOL)a6
{
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  char isKindOfClass;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  void *v25;
  id v26;
  void *v27;
  unsigned __int8 v28;
  id v29;
  uint64_t v30;
  id v31;
  void *v32;

  os_unfair_lock_lock(-[BADownload downloadLock](self, "downloadLock"));
  if (sub_1000301A8(self) == 3)
    sub_10002FBB8(self, 7);
  -[BAURLDownload setAmountDownloaded:](self, "setAmountDownloaded:", a4);
  os_unfair_lock_unlock(-[BADownload downloadLock](self, "downloadLock"));
  v11 = objc_claimAutoreleasedReturnValue(-[BADownload delegate](self, "delegate"));
  v12 = (void *)v11;
  if (a6)
  {
    if (v11)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload delegate](self, "delegate"));
      v14 = objc_opt_respondsToSelector(v13, "download:didResumeAtOffset:expectedTotalBytes:");

      if ((v14 & 1) != 0)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload delegate](self, "delegate"));
        objc_msgSend(v15, "download:didResumeAtOffset:expectedTotalBytes:", self, a4, a5);
LABEL_10:

      }
    }
  }
  else if (v11)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload delegate](self, "delegate"));
    v17 = objc_opt_respondsToSelector(v16, "download:didWriteBytes:totalBytesWritten:totalBytesExpectedToWrite:");

    if ((v17 & 1) != 0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload delegate](self, "delegate"));
      objc_msgSend(v15, "download:didWriteBytes:totalBytesWritten:totalBytesExpectedToWrite:", self, a3, a4, a5);
      goto LABEL_10;
    }
  }
  os_unfair_lock_lock(-[BADownload downloadLock](self, "downloadLock"));
  v19 = objc_opt_class(BAManifestDownload, v18);
  isKindOfClass = objc_opt_isKindOfClass(self, v19);
  if (a6)
    goto LABEL_16;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload applicationInfo](self, "applicationInfo"));

  if (!v21)
    goto LABEL_16;
  v23 = objc_opt_class(BAManifestDownload, v22);
  v24 = objc_opt_isKindOfClass(self, v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload applicationInfo](self, "applicationInfo"));
  v26 = objc_msgSend(v25, "remainingDownloadAllowanceWithNecessity:isManifest:", -[BADownload necessity](self, "necessity"), v24 & 1);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload applicationInfo](self, "applicationInfo"));
  v28 = objc_msgSend(v27, "consumeAllowanceShouldStopWithAdditionalBytes:downloadNecessity:isManifest:", a3, -[BADownload necessity](self, "necessity"), isKindOfClass & 1);

  if ((v28 & 1) != 0 || !v26)
  {
    v31 = sub_1000272FC(204);
    v30 = objc_claimAutoreleasedReturnValue(v31);
  }
  else
  {
LABEL_16:
    if (!sub_1000301EC(self) && ((isKindOfClass & 1) != 0 || (id)-[BADownload necessity](self, "necessity") != (id)1)
      || sub_1000301EC(self) >= a4)
    {
      os_unfair_lock_unlock(-[BADownload downloadLock](self, "downloadLock"));
      return;
    }
    v29 = sub_1000273E4(CFSTR("BAURLDownloadErrorDomain"), 101);
    v30 = objc_claimAutoreleasedReturnValue(v29);
  }
  v32 = (void *)v30;
  -[BAURLDownload setBailError:](self, "setBailError:", v30);

  os_unfair_lock_unlock(-[BADownload downloadLock](self, "downloadLock"));
  -[BAURLDownload cancelDownload](self, "cancelDownload");
}

- (void)_handleChallenge:(id)a3 authenticationHandler:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v6 = (void (**)(id, _QWORD, void *))a4;
  v7 = objc_claimAutoreleasedReturnValue(-[BADownload delegate](self, "delegate"));
  if (v7)
  {
    v8 = (void *)v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload delegate](self, "delegate"));
    v10 = objc_opt_respondsToSelector(v9, "download:didReceiveChallenge:completionHandler:");

    if ((v10 & 1) != 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload delegate](self, "delegate"));
      objc_msgSend(v11, "download:didReceiveChallenge:completionHandler:", self, v17, v6);
LABEL_7:

      goto LABEL_12;
    }
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "protectionSpace"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "authenticationMethod"));
  if (objc_msgSend(v13, "isEqualToString:", NSURLAuthenticationMethodServerTrust))
  {
    v14 = objc_msgSend(v17, "previousFailureCount");

    if (!v14)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "protectionSpace"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLCredential credentialForTrust:](NSURLCredential, "credentialForTrust:", objc_msgSend(v11, "serverTrust")));
      v6[2](v6, 0, v15);

      goto LABEL_7;
    }
  }
  else
  {

  }
  if (objc_msgSend(v17, "previousFailureCount"))
  {
    v6[2](v6, 1, 0);
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "proposedCredential"));
    v6[2](v6, 0, v16);

  }
LABEL_12:

}

- (void)_informDelegateOfPausedDownloadWithWillImmediatelyResume:(BOOL)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  _QWORD block[5];

  os_unfair_lock_assert_owner(-[BADownload downloadLock](self, "downloadLock"));
  sub_10002FBB8(self, 5);
  v5 = objc_claimAutoreleasedReturnValue(-[BADownload delegate](self, "delegate"));
  if (v5)
  {
    v6 = (void *)v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload delegate](self, "delegate"));
    v8 = objc_opt_respondsToSelector(v7, "downloadDidPause:");

    if ((v8 & 1) != 0)
    {
      v9 = objc_claimAutoreleasedReturnValue(-[BADownload responseQueue](self, "responseQueue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100006FC0;
      block[3] = &unk_100058998;
      block[4] = self;
      dispatch_async(v9, block);

    }
  }
  if (!a3)
    -[BADownload _removeActivityAndPowerAssertion](self, "_removeActivityAndPowerAssertion");
}

- (void)_informDelegateOfFailedDownloadWithError:(id)a3
{
  -[BAURLDownload _informDelegateOfFailedDownloadWithError:silentFailure:](self, "_informDelegateOfFailedDownloadWithError:silentFailure:", a3, 0);
}

- (void)_informDelegateOfFailedDownloadWithError:(id)a3 silentFailure:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  NSObject *v12;
  _QWORD block[5];

  v4 = a4;
  v6 = a3;
  os_unfair_lock_assert_owner(-[BADownload downloadLock](self, "downloadLock"));
  if (v4)
    v7 = -2;
  else
    v7 = -1;
  sub_10002FBB8(self, v7);
  -[BADownload setDownloadError:](self, "setDownloadError:", v6);

  v8 = objc_claimAutoreleasedReturnValue(-[BADownload delegate](self, "delegate"));
  if (v8)
  {
    v9 = (void *)v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload delegate](self, "delegate"));
    v11 = objc_opt_respondsToSelector(v10, "download:failedWithError:");

    if ((v11 & 1) != 0)
    {
      v12 = objc_claimAutoreleasedReturnValue(-[BADownload responseQueue](self, "responseQueue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100007104;
      block[3] = &unk_100058998;
      block[4] = self;
      dispatch_async(v12, block);

    }
  }
  -[BADownload _removeActivityAndPowerAssertion](self, "_removeActivityAndPowerAssertion");
}

- (void)cancelDownload
{
  -[BAURLDownload _cancelDownload:](self, "_cancelDownload:", 0);
}

- (void)cancelDownloadSilently
{
  -[BAURLDownload _cancelDownload:](self, "_cancelDownload:", 1);
}

- (void)_cancelDownload:(BOOL)a3
{
  _BOOL8 v3;
  os_unfair_lock_s *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = a3;
  v5 = -[BADownload downloadLock](self, "downloadLock");
  os_unfair_lock_lock(v5);
  if (sub_1000301A8(self) != 8)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload session](self, "session"));

    if (v6)
    {
      if (v3)
        v7 = 2;
      else
        v7 = 1;
      -[BAURLDownload setStopRequest:](self, "setStopRequest:", v7);
      sub_10002FBB8(self, 6);
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload session](self, "session"));
      objc_msgSend(v8, "cancel");
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSURLErrorDomain, -999, 0));
      -[BAURLDownload _informDelegateOfFailedDownloadWithError:silentFailure:](self, "_informDelegateOfFailedDownloadWithError:silentFailure:", v8, v3);
    }

  }
  os_unfair_lock_unlock(v5);
}

- (void)pauseDownload
{
  os_unfair_lock_s *v3;
  void *v4;
  void *v5;

  v3 = -[BADownload downloadLock](self, "downloadLock");
  os_unfair_lock_lock(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload session](self, "session"));

  if (v4)
  {
    -[BAURLDownload setStopRequest:](self, "setStopRequest:", 3);
    sub_10002FBB8(self, 4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload session](self, "session"));
    objc_msgSend(v5, "cancel");

  }
  os_unfair_lock_unlock(v3);
}

- (void)promoteToForeground
{
  os_unfair_lock_s *v3;
  void *v4;
  void *v5;

  v3 = -[BADownload downloadLock](self, "downloadLock");
  os_unfair_lock_lock(v3);
  if (!-[BADownload isForegroundDownload](self, "isForegroundDownload"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload session](self, "session"));

    if (v4)
    {
      -[BAURLDownload setStopRequest:](self, "setStopRequest:", 4);
      sub_10002FBB8(self, 4);
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload session](self, "session"));
      objc_msgSend(v5, "cancel");

    }
  }
  os_unfair_lock_unlock(v3);
}

- (void)demoteToBackground
{
  os_unfair_lock_s *v3;
  void *v4;
  void *v5;

  v3 = -[BADownload downloadLock](self, "downloadLock");
  os_unfair_lock_lock(v3);
  if (-[BADownload isForegroundDownload](self, "isForegroundDownload"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload session](self, "session"));

    if (v4)
    {
      -[BAURLDownload setStopRequest:](self, "setStopRequest:", 5);
      sub_10002FBB8(self, 4);
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload session](self, "session"));
      objc_msgSend(v5, "cancel");

    }
  }
  os_unfair_lock_unlock(v3);
}

+ (BOOL)_cellularNetworkProhibitsDownloadUsingError:(id)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  id v7;
  NSObject *v8;
  const char *v9;
  BOOL v10;
  id v11;
  int v13;
  id v14;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", NSURLErrorNetworkUnavailableReasonKey));

  if (v5)
  {
    v6 = objc_msgSend(v5, "intValue");
    if (v6 == 1)
    {
      v11 = sub_100012A44();
      v8 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 138543362;
        v14 = a1;
        v9 = "Pausing download %{public}@ because our network is expensive.";
        goto LABEL_9;
      }
LABEL_10:

      v10 = 1;
      goto LABEL_11;
    }
    if (!v6)
    {
      v7 = sub_100012A44();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 138543362;
        v14 = a1;
        v9 = "Pausing download %{public}@ because we are on cellular.";
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v13, 0xCu);
        goto LABEL_10;
      }
      goto LABEL_10;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (int64_t)stopRequest
{
  id AssociatedObject;
  void *v3;
  id v4;

  AssociatedObject = objc_getAssociatedObject(self, "stopRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  v4 = objc_msgSend(v3, "integerValue");

  return (int64_t)v4;
}

- (void)setStopRequest:(int64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  objc_setAssociatedObject(self, "stopRequest", v4, (void *)1);

}

- (NSError)bailError
{
  return (NSError *)objc_getAssociatedObject(self, "bailError");
}

- (void)setBailError:(id)a3
{
  objc_setAssociatedObject(self, "bailError", a3, (void *)1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BAURLDownload)init
{
  BAURLDownload *result;
  int v3;
  const char *v4;

  result = (BAURLDownload *)os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
  if ((_DWORD)result)
  {
    v3 = 136315138;
    v4 = "BAURLDownload cannot be constructed using -init.";
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "BUG IN CLIENT OF BackgroundAssets: %s", (uint8_t *)&v3, 0xCu);
  }
  qword_1000654C8 = (uint64_t)"BUG IN CLIENT OF BackgroundAssets: BAURLDownload cannot be constructed using -init.";
  __break(1u);
  return result;
}

- (BAURLDownload)initWithIdentifier:(NSString *)identifier request:(NSURLRequest *)request fileSize:(NSUInteger)fileSize applicationGroupIdentifier:(NSString *)applicationGroupIdentifier
{
  return -[BAURLDownload initWithIdentifier:request:essential:fileSize:applicationGroupIdentifier:priority:](self, "initWithIdentifier:request:essential:fileSize:applicationGroupIdentifier:priority:", identifier, request, 0, fileSize, applicationGroupIdentifier, 0);
}

- (BAURLDownload)initWithIdentifier:(NSString *)identifier request:(NSURLRequest *)request essential:(BOOL)essential fileSize:(NSUInteger)fileSize applicationGroupIdentifier:(NSString *)applicationGroupIdentifier priority:(BADownloaderPriority)priority
{
  _BOOL4 v11;
  NSString *v14;
  NSURLRequest *v15;
  NSString *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  char isKindOfClass;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  NSExceptionName v27;
  const __CFString *v28;
  void *v29;
  BAURLDownload *v30;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  id v36;
  void *v37;
  objc_super v38;

  v11 = essential;
  v14 = identifier;
  v15 = request;
  v16 = applicationGroupIdentifier;
  v18 = objc_opt_class(NSURLRequest, v17);
  if ((objc_opt_isKindOfClass(v15, v18) & 1) == 0)
  {
    v27 = NSInvalidArgumentException;
    v28 = CFSTR("request must be a URLRequest.");
    goto LABEL_7;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLRequest URL](v15, "URL"));
  v21 = objc_opt_class(NSURL, v20);
  isKindOfClass = objc_opt_isKindOfClass(v19, v21);

  if ((isKindOfClass & 1) == 0)
  {
    v27 = NSInvalidArgumentException;
    v28 = CFSTR("request must have a valid URL.");
    goto LABEL_7;
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLRequest URL](v15, "URL"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "scheme"));
  v25 = objc_msgSend(v24, "caseInsensitiveCompare:", CFSTR("https"));

  if (v25)
  {
    v27 = NSInvalidArgumentException;
    v28 = CFSTR("request can only download over HTTPS.");
LABEL_7:
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", v27, v28, 0));
    objc_msgSend(v29, "raise");

    v30 = 0;
    goto LABEL_8;
  }
  if ((objc_msgSend((id)objc_opt_class(v15, v26), "supportsSecureCoding") & 1) == 0)
  {
    v27 = NSInvalidArgumentException;
    v28 = CFSTR("request must be secure coding compliant.");
    goto LABEL_7;
  }
  if (!v14)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInvalidArgumentException, CFSTR("identifier can not be nil"), 0));
    objc_msgSend(v33, "raise");

  }
  v34 = objc_opt_class(NSString, v32);
  if ((objc_opt_isKindOfClass(v14, v34) & 1) == 0)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInvalidArgumentException, CFSTR("identifier must be a string."), 0));
    objc_msgSend(v35, "raise");

  }
  v38.receiver = self;
  v38.super_class = (Class)BAURLDownload;
  v36 = -[BADownload initPrivatelyWithApplicationGroupIdentifier:](&v38, "initPrivatelyWithApplicationGroupIdentifier:", v16);
  v37 = v36;
  if (v36)
  {
    objc_msgSend(v36, "setRequest:", v15);
    objc_msgSend(v37, "setIdentifier:", v14);
    objc_msgSend(v37, "setNecessity:", v11);
    objc_msgSend(v37, "setPriority:", priority);
    sub_10002FC14(v37, fileSize);
  }
  self = v37;
  v30 = self;
LABEL_8:

  return v30;
}

- (BAURLDownload)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  BAURLDownload *v6;
  id v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BAURLDownload;
  v6 = -[BADownload initWithCoder:](&v10, "initWithCoder:", v4);
  if (v6)
  {
    v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSURLRequest, v5), CFSTR("request"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[BAURLDownload setRequest:](v6, "setRequest:", v8);

  }
  return v6;
}

- (BAURLDownload)initWithIdentifier:(NSString *)identifier request:(NSURLRequest *)request applicationGroupIdentifier:(NSString *)applicationGroupIdentifier
{
  return -[BAURLDownload initWithIdentifier:request:essential:fileSize:applicationGroupIdentifier:priority:](self, "initWithIdentifier:request:essential:fileSize:applicationGroupIdentifier:priority:", identifier, request, 0, 0, applicationGroupIdentifier, 0);
}

- (BAURLDownload)initWithIdentifier:(NSString *)identifier request:(NSURLRequest *)request applicationGroupIdentifier:(NSString *)applicationGroupIdentifier priority:(BADownloaderPriority)priority
{
  return -[BAURLDownload initWithIdentifier:request:essential:fileSize:applicationGroupIdentifier:priority:](self, "initWithIdentifier:request:essential:fileSize:applicationGroupIdentifier:priority:", identifier, request, 0, 0, applicationGroupIdentifier, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BAURLDownload;
  v4 = -[BADownload copyWithZone:](&v7, "copyWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BAURLDownload request](self, "request"));
  objc_msgSend(v4, "setRequest:", v5);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BAURLDownload request](self, "request"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("request"));

  v6.receiver = self;
  v6.super_class = (Class)BAURLDownload;
  -[BADownload encodeWithCoder:](&v6, "encodeWithCoder:", v4);

}

- (id)debugDescription
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BAURLDownload;
  v3 = -[BADownload debugDescription](&v9, "debugDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v4, "mutableCopy");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BAURLDownload request](self, "request"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "URL"));
  objc_msgSend(v5, "appendFormat:", CFSTR("URL: %@\n"), v7);

  return v5;
}

- (NSURLRequest)request
{
  return (NSURLRequest *)objc_getProperty(self, a2, 176, 1);
}

- (void)setRequest:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (unint64_t)amountDownloaded
{
  return self->_amountDownloaded;
}

- (void)setAmountDownloaded:(unint64_t)a3
{
  self->_amountDownloaded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
}

@end
