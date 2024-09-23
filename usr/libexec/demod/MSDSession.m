@implementation MSDSession

- (MSDSession)init
{
  return -[MSDSession initWithCellularAccess:](self, "initWithCellularAccess:", 1);
}

- (MSDSession)initWithCellularAccess:(BOOL)a3
{
  _BOOL8 v3;
  MSDSession *v4;
  void *v5;
  void *v6;
  void *v7;
  MSDSessionTaskManager *v8;
  dispatch_queue_t v9;
  id v10;
  NSObject *v11;
  void *v12;
  MSDSession *v13;
  id v14;
  void *v15;
  id v16;
  MSDSession *v17;
  id v18;
  NSObject *v19;
  _QWORD v21[4];
  MSDSession *v22;
  id v23;
  _QWORD v24[4];
  MSDSession *v25;
  id v26;
  id location;
  objc_super v28;

  v3 = a3;
  v28.receiver = self;
  v28.super_class = (Class)MSDSession;
  v4 = -[MSDSession init](&v28, "init");
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSessionConfiguration defaultSessionConfiguration](NSURLSessionConfiguration, "defaultSessionConfiguration"));
    objc_msgSend(v5, "setURLCache:", 0);
    objc_msgSend(v5, "setRequestCachePolicy:", 1);
    objc_msgSend(v5, "set_timingDataOptions:", 2);
    objc_msgSend(v5, "setAllowsCellularAccess:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSession sessionWithConfiguration:delegate:delegateQueue:](NSURLSession, "sessionWithConfiguration:delegate:delegateQueue:", v5, v4, 0));
    -[MSDSession setSession:](v4, "setSession:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSession session](v4, "session"));
    if (v7)
    {
      v8 = objc_alloc_init(MSDSessionTaskManager);
      -[MSDSession setTaskManager:](v4, "setTaskManager:", v8);

      v9 = dispatch_queue_create("com.apple.msdconnection-demux", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
      -[MSDSession setDemuxQueue:](v4, "setDemuxQueue:", v9);

      -[MSDSession setRequestTimeoutCount:](v4, "setRequestTimeoutCount:", 0);
      -[MSDSession setIsDownloadPaused:](v4, "setIsDownloadPaused:", 0);
      v10 = sub_100060640();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      -[MSDSession setSignpostId:](v4, "setSignpostId:", os_signpost_id_generate(v11));

      objc_initWeak(&location, v4);
      if (-[MSDSession getIsFileDownload](v4, "getIsFileDownload"))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_10006AF9C;
        v24[3] = &unk_10013F0B8;
        v13 = v4;
        v25 = v13;
        objc_copyWeak(&v26, &location);
        v14 = objc_msgSend(v12, "addObserverForName:object:queue:usingBlock:", CFSTR("MSDNotificationPauseDownload"), 0, 0, v24);

        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_10006B08C;
        v21[3] = &unk_10013F0B8;
        v22 = v13;
        objc_copyWeak(&v23, &location);
        v16 = objc_msgSend(v15, "addObserverForName:object:queue:usingBlock:", CFSTR("MSDNotificationAbortDownload"), 0, 0, v21);

        objc_destroyWeak(&v23);
        objc_destroyWeak(&v26);

      }
      v17 = v4;
      objc_destroyWeak(&location);
    }
    else
    {
      v18 = sub_1000604F0();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        sub_1000C2B64();

      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)invalidate
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[MSDSession session](self, "session"));
  objc_msgSend(v2, "invalidateAndCancel");

}

- (void)launchTaskWithInfo:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;

  v4 = a3;
  v5 = -[MSDSessionTask initFromTaskInfo:]([MSDSessionTask alloc], "initFromTaskInfo:", v4);

  v6 = objc_claimAutoreleasedReturnValue(-[MSDSession demuxQueue](self, "demuxQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006B260;
  block[3] = &unk_10013DE28;
  block[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_sync(v6, block);

}

- (BOOL)getIsFileDownload
{
  return 0;
}

- (void)authenticate:(id)a3 forTask:(id)a4 completion:(id)a5
{
  (*((void (**)(id, uint64_t, _QWORD))a5 + 2))(a5, 1, 0);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  void (**v11)(id, _QWORD);
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  NSObject *v37;
  id v38;
  unsigned int v39;
  id v40;
  id v41;
  NSObject *v42;
  int v43;
  id v44;
  __int16 v45;
  const __CFString *v46;

  v9 = a4;
  v10 = a5;
  v11 = (void (**)(id, _QWORD))a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSession taskManager](self, "taskManager"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "getSessionTask:", v9));

  if (!v13)
  {
    v40 = sub_1000604F0();
    v37 = objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      sub_1000C2B90();
    v16 = 0;
    v20 = 0;
    goto LABEL_26;
  }
  v15 = objc_opt_class(NSHTTPURLResponse, v14);
  if ((objc_opt_isKindOfClass(v10, v15) & 1) == 0)
  {
    v41 = sub_1000604F0();
    v42 = objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      sub_1000C2BF0();

    v28 = 0;
    v20 = 0;
    v16 = 0;
    goto LABEL_20;
  }
  v16 = v10;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "info"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "savePath"));

  if (v18)
  {
    if (objc_msgSend(v16, "statusCode") != (id)200 && objc_msgSend(v16, "statusCode") != (id)206)
    {
      v28 = objc_msgSend(v16, "statusCode") == (id)416;
      if (objc_msgSend(v16, "statusCode") == (id)403 || objc_msgSend(v16, "statusCode") == (id)404)
        objc_msgSend(v13, "setState:", 3);
      v20 = 0;
      goto LABEL_20;
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "allHeaderFields"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKey:", CFSTR("Content-Range")));

    if (!v20)
    {
      v29 = sub_1000604F0();
      v30 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "info"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "savePath"));
        v43 = 138543618;
        v44 = v32;
        v45 = 2114;
        v46 = CFSTR("Content-Range");
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "HTTP response header for %{public}@ does not contain key %{public}@; cannot proceed with download",
          (uint8_t *)&v43,
          0x16u);

      }
      v20 = 0;
      v28 = 1;
      goto LABEL_20;
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "contentRange"));
    objc_msgSend(v21, "processServerRangeResponse:", v20);

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "contentRange"));
    v23 = objc_msgSend(v22, "isDownloadComplete");

    if (v23)
    {
      v24 = sub_1000604F0();
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "info"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "savePath"));
        v43 = 138543362;
        v44 = v27;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Download for %{public}@ is already complete, no need to continue with download task", (uint8_t *)&v43, 0xCu);

      }
      v28 = 0;
LABEL_20:
      if (objc_msgSend(v13, "state") != 3)
        objc_msgSend(v13, "setState:", 2);
      if (v28)
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "info"));
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "savePath"));
        objc_msgSend(v33, "removeItemAtPath:error:", v35, 0);

        objc_msgSend(v13, "resetFileHandle");
      }
      v36 = sub_1000604F0();
      v37 = objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        v38 = objc_msgSend(v16, "statusCode");
        v39 = objc_msgSend(v13, "state");
        v43 = 134218240;
        v44 = v38;
        v45 = 1024;
        LODWORD(v46) = v39 == 2;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Cancelling download task on status code: %ld; should retry=%d",
          (uint8_t *)&v43,
          0x12u);
      }
LABEL_26:

      v11[2](v11, 0);
      goto LABEL_27;
    }
  }
  else
  {
    v20 = 0;
  }
  v11[2](v11, 1);
LABEL_27:

}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  NSObject *v21;
  id v22;
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_autoreleasePoolPush();
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "response"));
  v13 = objc_msgSend(v12, "statusCode");
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSession taskManager](self, "taskManager"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "getSessionTask:", v9));

  if (!v15)
  {
    v20 = sub_1000604F0();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_1000C2B90();
    v19 = 0;
    goto LABEL_15;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "info"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "savePath"));
  if (!v17)
  {

LABEL_8:
    v19 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "outData"));
    objc_msgSend(v19, "appendData:", v10);
    goto LABEL_9;
  }

  if (v13 != (id)206 && v13 != (id)200)
    goto LABEL_8;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "fileHandle"));
  v23 = 0;
  objc_msgSend(v18, "writeData:error:", v10, &v23);
  v19 = v23;

  if (v19)
  {
    objc_msgSend(v15, "setError:", v19);
    v22 = sub_1000604F0();
    v21 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_1000C2C1C(v15, (uint64_t)v19, v21);
LABEL_15:

    objc_msgSend(v9, "cancel");
    goto LABEL_9;
  }
  v19 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "contentRange"));
  objc_msgSend(v19, "appendDownloadedFileSize:", objc_msgSend(v10, "length"));
LABEL_9:

  objc_autoreleasePoolPop(v11);
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  void (**v11)(id, uint64_t, _QWORD);
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  int v22;
  id v23;

  v9 = a4;
  v10 = a5;
  v11 = (void (**)(id, uint64_t, _QWORD))a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSession taskManager](self, "taskManager"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "getSessionTask:", v9));

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "protectionSpace"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "authenticationMethod"));

    v16 = sub_1000604F0();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      sub_1000C2D1C(v13);

    if ((objc_msgSend(v15, "isEqualToString:", NSURLAuthenticationMethodServerTrust) & 1) != 0)
    {
      -[MSDSession authenticate:forTask:completion:](self, "authenticate:forTask:completion:", v10, v13, v11);
    }
    else
    {
      v20 = sub_1000604F0();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        sub_1000C2CBC();

      v11[2](v11, 2, 0);
    }

  }
  else
  {
    v18 = sub_1000604F0();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 138543362;
      v23 = v9;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Untracked task: %{public}@; canceling...",
        (uint8_t *)&v22,
        0xCu);
    }

    v11[2](v11, 2, 0);
  }

}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  id v10;
  id v11;
  void (**v12)(id, void *);
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  int v23;
  id v24;

  v10 = a4;
  v11 = a6;
  v12 = (void (**)(id, void *))a7;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSession taskManager](self, "taskManager"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "getSessionTask:", v10));

  if (v14)
  {
    objc_msgSend(v14, "setRedirected:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "URL"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableURLRequest requestWithURL:cachePolicy:timeoutInterval:](NSMutableURLRequest, "requestWithURL:cachePolicy:timeoutInterval:", v15, 1, 30.0));

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "info"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "savePath"));

    if (v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "contentRange"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "getRangeHeaderForDownload"));

      if (v20)
        objc_msgSend(v16, "setValue:forHTTPHeaderField:", v20, CFSTR("Range"));

    }
    v12[2](v12, v16);

  }
  else
  {
    v21 = sub_1000604F0();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 138543362;
      v24 = v10;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Untracked task: %{public}@; canceling...",
        (uint8_t *)&v23,
        0xCu);
    }

    objc_msgSend(v10, "cancel");
    v12[2](v12, 0);
  }

}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  unsigned __int8 v14;
  id v15;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  NSObject *v22;
  unint64_t v23;
  os_signpost_id_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  int v30;
  _BOOL4 v31;
  id v32;
  NSObject *v33;
  id v34;
  id v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  unsigned int v41;
  id v42;
  NSObject *v43;
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
  id v58;
  NSObject *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  unsigned __int8 v65;
  id v66;
  NSObject *v67;
  id v68;
  NSObject *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  id v76;
  id v77;
  void *v78;
  id v79;
  void *v80;
  id v81;
  id v82;
  NSObject *v83;
  void *v84;
  void *v85;
  id v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  id v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void (**v102)(_QWORD, _QWORD, _QWORD);
  void *v103;
  unsigned int v104;
  id v105;
  NSObject *v106;
  void *v107;
  id v108;
  id v109;
  void *v110;
  void *v111;
  uint64_t v112;
  void *v113;
  void *v114;
  uint64_t v115;
  id v116;
  MSDSession *v117;
  void *v118;
  id v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  uint8_t buf[4];
  uint64_t v126;
  __int16 v127;
  id v128;
  __int16 v129;
  id v130;

  v7 = a4;
  v119 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSession taskManager](self, "taskManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "getSessionTask:", v7));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "response"));
  v11 = (uint64_t)objc_msgSend(v10, "statusCode");
  v12 = objc_alloc_init((Class)NSMutableDictionary);
  if (!v9)
  {
    v32 = sub_1000604F0();
    v33 = objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v126 = (uint64_t)v7;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Untracked task: %{public}@ done.", buf, 0xCu);
    }

    v29 = 0;
    goto LABEL_77;
  }
  if (!-[MSDSession getIsFileDownload](self, "getIsFileDownload") || objc_msgSend(v9, "state") != 1)
  {
    if (objc_msgSend(v119, "code") == (id)-999 && objc_msgSend(v9, "state") != 3)
    {
      v113 = v10;
      v116 = v12;
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "info"));
      v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "savePath"));
      if (v37)
      {
        v38 = (void *)v37;
        v39 = v11;
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contentRange"));
        v41 = objc_msgSend(v40, "isDownloadComplete");

        v11 = v39;
        if (v41)
        {
          v42 = sub_1000604F0();
          v43 = objc_claimAutoreleasedReturnValue(v42);
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "info"));
            v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "description"));
            v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "info"));
            v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "savePath"));
            *(_DWORD *)buf = 138543618;
            v126 = (uint64_t)v45;
            v127 = 2114;
            v128 = v47;
            _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "SessionTask %{public}@ for file %{public}@ is cancelled but it is already complete, ignoring cancellation", buf, 0x16u);

            v11 = v39;
          }

          v29 = 0;
          v30 = 0;
          v31 = 0;
          v10 = v113;
          v12 = v116;
          goto LABEL_61;
        }
      }
      else
      {

      }
      v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "error"));
      if (v60)
        v61 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "error"));
      else
        v61 = v119;
      v29 = v61;
      v10 = v113;

      v30 = 0;
      v31 = objc_msgSend(v9, "state") == 2;
      goto LABEL_46;
    }
    if (!v10)
    {
      if (v119)
      {
        v117 = self;
        v34 = v7;
        v35 = v12;
        v29 = v119;
        v31 = 1;
LABEL_58:
        v68 = sub_1000604F0();
        v69 = objc_claimAutoreleasedReturnValue(v68);
        if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
        {
          v114 = v10;
          v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "info"));
          v71 = v11;
          v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "description"));
          v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "localizedDescription"));
          v74 = objc_msgSend(v29, "code");
          *(_DWORD *)buf = 138543874;
          v126 = (uint64_t)v72;
          v127 = 2114;
          v128 = v73;
          v129 = 2048;
          v130 = v74;
          _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "Session task %{public}@ did fail with error: %{public}@(0x%tx)", buf, 0x20u);

          v10 = v114;
          v11 = v71;
        }

        v30 = 0;
        v12 = v35;
        v7 = v34;
        self = v117;
        goto LABEL_61;
      }
      v48 = 0;
      v58 = sub_1000604F0();
      v59 = objc_claimAutoreleasedReturnValue(v58);
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
        sub_1000C2D9C();

      v56 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSession getServerErrorMessage:withDefault:](self, "getServerErrorMessage:withDefault:", v9, CFSTR("Unexpected server response.")));
      v120 = 0;
      sub_1000B63A4(&v120, 3727744512, (uint64_t)v56);
      v57 = v120;
LABEL_56:
      v29 = v57;

      v31 = 1;
      if (v29)
        goto LABEL_57;
      goto LABEL_52;
    }
    if (v11 <= 205)
    {
      v31 = 0;
      v29 = 0;
      v30 = 1;
      if ((unint64_t)(v11 - 200) < 3 || v11 == 204)
        goto LABEL_61;
      goto LABEL_53;
    }
    if (v11 > 403)
    {
      if (v11 != 404)
      {
        if (v11 == 408)
        {
          v48 = v10;
          v56 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSession getServerErrorMessage:withDefault:](self, "getServerErrorMessage:withDefault:", v9, CFSTR("Connection with server is broken.")));
          v122 = 0;
          sub_1000B63A4(&v122, 3727740931, (uint64_t)v56);
          v57 = v122;
          goto LABEL_56;
        }
        goto LABEL_53;
      }
      v48 = v10;
      v49 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSession getServerErrorMessage:withDefault:](self, "getServerErrorMessage:withDefault:", v9, CFSTR("Requested asset not found")));
      v123 = 0;
      sub_1000B63A4(&v123, 3727740934, (uint64_t)v49);
      v50 = v123;
      goto LABEL_51;
    }
    if (v11 != 206)
    {
      if (v11 != 403)
      {
LABEL_53:
        v48 = v10;
        v66 = sub_1000604F0();
        v67 = objc_claimAutoreleasedReturnValue(v66);
        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v126 = v11;
          _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "Unrecognized status code %ld; will attempt to retry task",
            buf,
            0xCu);
        }

        v56 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSession getServerErrorMessage:withDefault:](self, "getServerErrorMessage:withDefault:", v9, CFSTR("Unexpected server response.")));
        v121 = 0;
        sub_1000B63A4(&v121, 3727744512, (uint64_t)v56);
        v57 = v121;
        goto LABEL_56;
      }
      v48 = v10;
      v49 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSession getServerErrorMessage:withDefault:](self, "getServerErrorMessage:withDefault:", v9, CFSTR("Cannot authenticate with server.")));
      v124 = 0;
      sub_1000B63A4(&v124, 3727740933, (uint64_t)v49);
      v50 = v124;
LABEL_51:
      v29 = v50;

      v31 = 0;
      if (v29)
      {
LABEL_57:
        v117 = self;
        v34 = v7;
        v35 = v12;
        v10 = v48;
        goto LABEL_58;
      }
LABEL_52:
      v30 = 0;
      v10 = v48;
      goto LABEL_61;
    }
    v48 = v10;
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "info"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "savePath"));

    if (v63)
    {
      v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contentRange"));
      v65 = objc_msgSend(v64, "isDownloadComplete");

      if ((v65 & 1) != 0)
      {
        v31 = 0;
        goto LABEL_83;
      }
      v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contentRange"));
      v104 = objc_msgSend(v103, "didProgress");

      if (v104)
      {
        v105 = sub_1000604F0();
        v106 = objc_claimAutoreleasedReturnValue(v105);
        if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
        {
          v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "info"));
          v108 = v7;
          v109 = v12;
          v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "savePath"));
          *(_DWORD *)buf = 138543362;
          v126 = (uint64_t)v110;
          _os_log_impl((void *)&_mh_execute_header, v106, OS_LOG_TYPE_DEFAULT, "Allowing partial download of %{public}@ to progress without retry penalty", buf, 0xCu);

          v12 = v109;
          v7 = v108;
        }

        objc_msgSend(v9, "setCurrentRetry:", (char *)objc_msgSend(v9, "currentRetry") - 1);
        v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contentRange"));
        objc_msgSend(v111, "recordDownloadedBytes");

      }
    }
    v31 = 1;
LABEL_83:
    v29 = v119;
    if (v29)
      goto LABEL_57;
    goto LABEL_52;
  }
  v116 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contentRange"));
  v14 = objc_msgSend(v13, "isDownloadComplete");

  v15 = sub_1000604F0();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if ((v14 & 1) == 0)
  {
    if (v17)
    {
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "info"));
      v52 = v10;
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "description"));
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "info"));
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "savePath"));
      *(_DWORD *)buf = 138543618;
      v126 = (uint64_t)v53;
      v127 = 2114;
      v128 = v55;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "SessionTask %{public}@ with savePath: %{public}@ paused, waiting to be resumed", buf, 0x16u);

      v10 = v52;
    }

    v29 = 0;
    v12 = v116;
    goto LABEL_77;
  }
  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "info"));
    v19 = v11;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "savePath"));
    *(_DWORD *)buf = 138543362;
    v126 = (uint64_t)v20;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Not pausing task for %{public}@ because download is already complete", buf, 0xCu);

    v11 = v19;
  }

  v21 = sub_100060640();
  v22 = objc_claimAutoreleasedReturnValue(v21);
  v23 = -[MSDSession signpostId](self, "signpostId");
  if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v24 = v23;
    if (os_signpost_enabled(v22))
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "info"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "description"));
      v112 = v11;
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "info"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "savePath"));
      *(_DWORD *)buf = 138412546;
      v126 = (uint64_t)v26;
      v127 = 2112;
      v128 = v28;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_EVENT, v24, "Resume Session Task", "Not Pausing Completed Session Task: %{xcode:string}@ with save path: %{xcode:string}@", buf, 0x16u);

      v11 = v112;
    }
  }

  v29 = 0;
  v30 = 0;
  v31 = 0;
LABEL_46:
  v12 = v116;
LABEL_61:
  v75 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSession taskManager](self, "taskManager"));
  objc_msgSend(v75, "removeSessionTask:", v9);

  -[MSDSession collectTimingDataForTask:withNetworkError:](self, "collectTimingDataForTask:withNetworkError:", v9, v119);
  if (v31)
  {
    v115 = v11;
    v76 = v7;
    v77 = v12;
    v78 = v10;
    v79 = objc_msgSend(v9, "currentRetry");
    v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "info"));
    v81 = objc_msgSend(v80, "maxRetry");

    if ((uint64_t)v79 <= (uint64_t)v81)
    {
      -[MSDSession retrySessionTask:](self, "retrySessionTask:", v9);
      v10 = v78;
      v12 = v77;
      v7 = v76;
      goto LABEL_77;
    }
    v82 = sub_1000604F0();
    v83 = objc_claimAutoreleasedReturnValue(v82);
    if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
    {
      v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "info"));
      v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "description"));
      v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "info"));
      v86 = objc_msgSend(v85, "maxRetry");
      *(_DWORD *)buf = 138543618;
      v126 = (uint64_t)v84;
      v127 = 2048;
      v128 = v86;
      _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_DEFAULT, "%{public}@ exceeded maximum retry %ld", buf, 0x16u);

    }
    v10 = v78;
    v12 = v77;
    v7 = v76;
    v11 = v115;
  }
  v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v11));
  objc_msgSend(v12, "setObject:forKey:", v87, CFSTR("statusCode"));

  if (v30)
  {
    v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allHeaderFields"));
    v89 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSession parseResponseHeader:statusCode:](self, "parseResponseHeader:statusCode:", v88, v11));
    objc_msgSend(v12, "addEntriesFromDictionary:", v89);

  }
  v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "outData"));

  if (v90)
  {
    v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "outData"));
    objc_msgSend(v12, "setObject:forKey:", v91, CFSTR("data"));

  }
  v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "info"));
  v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "savePath"));

  if (v93)
  {
    v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contentRange"));
    v95 = objc_msgSend(v94, "downloadedBytes");

    v96 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v95));
    objc_msgSend(v12, "setObject:forKey:", v96, CFSTR("fileSize"));

  }
  v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "fileHandle"));

  if (v97)
  {
    v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "fileHandle"));
    objc_msgSend(v98, "closeFile");

  }
  v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "info"));
  v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "handler"));

  if (v100)
  {
    v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "info"));
    v102 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "handler"));
    ((void (**)(_QWORD, id, id))v102)[2](v102, v29, v12);

  }
LABEL_77:

}

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  -[MSDSession collectMetricsData:](self, "collectMetricsData:", a5, a4);
}

- (void)handleDownloadPaused:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *i;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  unint64_t v22;
  os_signpost_id_t v23;
  void *v24;
  MSDSession *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v34;
  void *v35;
  id v36;
  NSObject *v37;
  id v38;
  __int128 v39;
  id v40;
  uint64_t v41;
  const char *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  NSObject *v47;
  void *v48;
  void *v49;
  id v50;
  NSObject *v51;
  unint64_t v52;
  os_signpost_id_t v53;
  void *v54;
  uint64_t v55;
  MSDSession *v56;
  const char *v57;
  void *v58;
  void *v59;
  __int128 v60;
  id v61;
  uint64_t v62;
  id obj;
  NSObject *obja;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint8_t v74[128];
  uint8_t buf[4];
  MSDSession *v76;
  __int16 v77;
  void *v78;
  _BYTE v79[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("kMSDDownloadPausedKey")));
  v5 = objc_msgSend(v4, "BOOLValue");

  v6 = sub_1000604F0();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v76 = self;
    v77 = 1024;
    LODWORD(v78) = (_DWORD)v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Session received background download paused notification; pause=%d",
      buf,
      0x12u);
  }

  if ((_DWORD)v5 == -[MSDSession isDownloadPaused](self, "isDownloadPaused"))
  {
    v33 = sub_1000604F0();
    v34 = objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v76 = self;
      v77 = 1024;
      LODWORD(v78) = (_DWORD)v5;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%{public}@: downloadPaused = %d, ignoring notification...", buf, 0x12u);
    }
    v13 = v34;
  }
  else
  {
    -[MSDSession setIsDownloadPaused:](self, "setIsDownloadPaused:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSession taskManager](self, "taskManager"));
    v9 = v8;
    if ((_DWORD)v5)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "getTaskInState:", 0));

      v11 = sub_1000604F0();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        sub_1000C2DD4((uint64_t)self, v10);

      v72 = 0u;
      v73 = 0u;
      v70 = 0u;
      v71 = 0u;
      v13 = v10;
      obj = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v70, v79, 16);
      if (obj)
      {
        v62 = *(_QWORD *)v71;
        do
        {
          for (i = 0; i != obj; i = (char *)i + 1)
          {
            if (*(_QWORD *)v71 != v62)
              objc_enumerationMutation(v13);
            v15 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * (_QWORD)i);
            v16 = sub_1000604F0();
            v17 = objc_claimAutoreleasedReturnValue(v16);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "info"));
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "description"));
              *(_DWORD *)buf = 138543618;
              v76 = self;
              v77 = 2114;
              v78 = v19;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: Canceling task %{public}@", buf, 0x16u);

            }
            v20 = sub_100060640();
            v21 = objc_claimAutoreleasedReturnValue(v20);
            v22 = -[MSDSession signpostId](self, "signpostId");
            if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
            {
              v23 = v22;
              if (os_signpost_enabled(v21))
              {
                v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "info"));
                v25 = (MSDSession *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "description"));
                v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "info"));
                v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "savePath"));
                *(_DWORD *)buf = 138412546;
                v76 = v25;
                v77 = 2112;
                v78 = v27;
                _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v21, OS_SIGNPOST_EVENT, v23, "Pause Session Task", "Pause Session Task: %{xcode:string}@ with save path: %{xcode:string}@", buf, 0x16u);

              }
            }

            objc_msgSend(v15, "setState:", 1);
            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "task"));
            objc_msgSend(v28, "cancel");

            if (os_variant_has_internal_content("com.apple.mobilestoredemod"))
            {
              v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "info"));
              v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "savePath"));
              v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "contentRange"));
              objc_msgSend(v31, "setFileDownloading:", v30);

              v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "contentRange"));
              objc_msgSend(v32, "pushToTestLog:", 0);

            }
          }
          obj = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v70, v79, 16);
        }
        while (obj);
      }
    }
    else
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "getTaskInState:", 1));

      v36 = sub_1000604F0();
      v37 = objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        sub_1000C2E40((uint64_t)self, v35);

      v68 = 0u;
      v69 = 0u;
      v66 = 0u;
      v67 = 0u;
      obja = v35;
      v38 = -[NSObject countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
      if (v38)
      {
        v40 = v38;
        v41 = *(_QWORD *)v67;
        v42 = "%{public}@: Relaunching task %{public}@ to resume";
        *(_QWORD *)&v39 = 138412546;
        v60 = v39;
        do
        {
          v43 = 0;
          v61 = v40;
          do
          {
            if (*(_QWORD *)v67 != v41)
              objc_enumerationMutation(obja);
            v44 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * (_QWORD)v43);
            v45 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSession taskManager](self, "taskManager", v60));
            objc_msgSend(v45, "removeSessionTask:", v44);

            objc_msgSend(v44, "setState:", 0);
            objc_msgSend(v44, "setCurrentRetry:", 0);
            v46 = sub_1000604F0();
            v47 = objc_claimAutoreleasedReturnValue(v46);
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "info"));
              v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "description"));
              *(_DWORD *)buf = 138543618;
              v76 = self;
              v77 = 2114;
              v78 = v49;
              _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, v42, buf, 0x16u);

            }
            v50 = sub_100060640();
            v51 = objc_claimAutoreleasedReturnValue(v50);
            v52 = -[MSDSession signpostId](self, "signpostId");
            if (v52 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
            {
              v53 = v52;
              if (os_signpost_enabled(v51))
              {
                v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "info"));
                v55 = v41;
                v56 = (MSDSession *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "description"));
                v57 = v42;
                v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "info"));
                v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "savePath"));
                *(_DWORD *)buf = v60;
                v76 = v56;
                v77 = 2112;
                v78 = v59;
                _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v51, OS_SIGNPOST_EVENT, v53, "Resume Session Task", "Resuming Session Task: %{xcode:string}@ with save path: %{xcode:string}@", buf, 0x16u);

                v42 = v57;
                v41 = v55;
                v40 = v61;
              }
            }

            -[MSDSession dispatchSessionTask:](self, "dispatchSessionTask:", v44);
            v43 = (char *)v43 + 1;
          }
          while (v40 != v43);
          v40 = -[NSObject countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
        }
        while (v40);
      }
      v13 = obja;
    }

  }
}

- (void)handleDownloadAborted:(id)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  MSDSession *v11;
  __int16 v12;
  unsigned int v13;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("kMSDDownloadAbortedKey")));
  v6 = objc_msgSend(v5, "BOOLValue");

  v7 = sub_1000604F0();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543618;
    v11 = self;
    v12 = 1024;
    v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Session received timer expired notification; timerExpired=%d",
      (uint8_t *)&v10,
      0x12u);
  }

  if (v6)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSession taskManager](self, "taskManager"));
    objc_msgSend(v9, "cancelAndRemoveAllSessionTask");

  }
}

- (void)dispatchSessionTask:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  id v28;
  NSObject *v29;
  unint64_t v30;
  os_signpost_id_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  NSObject *v37;
  id v38;
  const __CFString *v39;
  id *v40;
  uint64_t v41;
  id v42;
  NSObject *v43;
  id v44;
  NSObject *v45;
  void *v46;
  void *v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  uint64_t v51;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "info"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "postData"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "info"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "postFile"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "info"));
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "getRequestForTimeout:", 30.0));
  v13 = objc_msgSend((id)v12, "mutableCopy");

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "info"));
  LOBYTE(v12) = objc_msgSend(v14, "isValid");

  if ((v12 & 1) == 0)
  {
    v36 = sub_1000604F0();
    v37 = objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      sub_1000C2FCC();
    goto LABEL_32;
  }
  if (!v13)
  {
    v38 = sub_1000604F0();
    v37 = objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      sub_1000C2EAC();
LABEL_32:

    v39 = CFSTR("Input is invalid");
    v40 = a4;
    v41 = 3727744769;
LABEL_39:
    sub_1000B63A4(v40, v41, (uint64_t)v39);
    goto LABEL_26;
  }
  objc_msgSend(v6, "resetData");
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "info"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "savePath"));

  if (!v16)
  {
    v19 = 0;
    goto LABEL_9;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fileHandle"));

  if (!v17)
  {
    v44 = sub_1000604F0();
    v45 = objc_claimAutoreleasedReturnValue(v44);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      sub_1000C2FA0();

    v41 = 3727740944;
    v39 = CFSTR("Cannot write file.");
    v40 = a4;
    goto LABEL_39;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contentRange"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "getRangeHeaderForDownload"));

  if (v19)
    objc_msgSend(v13, "setValue:forHTTPHeaderField:", v19, CFSTR("Range"));
  -[MSDSession logDownloadTaskLaunch:](self, "logDownloadTaskLaunch:", v6);
LABEL_9:
  objc_msgSend(v6, "setCurrentRetry:", (char *)objc_msgSend(v6, "currentRetry") + 1);
  if (v8)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSession session](self, "session"));
    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "uploadTaskWithRequest:fromData:", v13, v8));
  }
  else
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSession session](self, "session"));
    v20 = v23;
    if (v10)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v10));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "uploadTaskWithRequest:fromFile:", v13, v22));
      objc_msgSend(v6, "setTask:", v24);

      goto LABEL_14;
    }
    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "dataTaskWithRequest:", v13));
  }
  v22 = (void *)v21;
  objc_msgSend(v6, "setTask:", v21);
LABEL_14:

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "task"));
  if (v25)
  {
    if (-[MSDSession isDownloadPaused](self, "isDownloadPaused")
      && -[MSDSession getIsFileDownload](self, "getIsFileDownload"))
    {
      v26 = sub_1000604F0();
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        sub_1000C2F04(v6, v27);

      v28 = sub_100060640();
      v29 = objc_claimAutoreleasedReturnValue(v28);
      v30 = -[MSDSession signpostId](self, "signpostId");
      if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v31 = v30;
        if (os_signpost_enabled(v29))
        {
          v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "info"));
          v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "description"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "info"));
          *(_DWORD *)buf = 138412546;
          v49 = v46;
          v50 = 2112;
          v51 = objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "savePath"));
          v33 = (void *)v51;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v29, OS_SIGNPOST_EVENT, v31, "Pause Session Task", "Launching Session Task: %{xcode:string}@ with save path: %{xcode:string}@ as paused", buf, 0x16u);

        }
      }

      objc_msgSend(v6, "setState:", 1);
    }
    else
    {
      objc_msgSend(v6, "setState:", 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "task"));
      objc_msgSend(v34, "resume");

    }
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSession taskManager](self, "taskManager"));
    objc_msgSend(v35, "addSessionTask:", v6);

  }
  else
  {
    v42 = sub_1000604F0();
    v43 = objc_claimAutoreleasedReturnValue(v42);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      sub_1000C2ED8();

    sub_1000B63A4(a4, 3727744515, (uint64_t)CFSTR("Cannot dispatch network task or create session"));
  }

LABEL_26:
}

- (void)dispatchSessionTask:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  id v10;

  v4 = a3;
  v10 = 0;
  -[MSDSession dispatchSessionTask:withError:](self, "dispatchSessionTask:withError:", v4, &v10);
  v5 = v10;
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "info"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "handler"));

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "info"));
      v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "handler"));
      ((void (**)(_QWORD, id, _QWORD))v9)[2](v9, v5, 0);

    }
  }

}

- (void)retrySessionTask:(id)a3
{
  id v4;
  double v5;
  double v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  dispatch_time_t v15;
  NSObject *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  double v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;

  v4 = a3;
  v5 = exp2((double)(uint64_t)objc_msgSend(v4, "currentRetry"));
  v6 = (double)arc4random_uniform(0x1F4u) + v5 * 1000.0;
  v7 = sub_1000604F0();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "info"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "description"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "info"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "savePath"));
    v13 = objc_msgSend(v4, "currentRetry");
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "info"));
    *(_DWORD *)buf = 138544386;
    v21 = v10;
    v22 = 2114;
    v23 = v12;
    v24 = 2048;
    v25 = v6;
    v26 = 2048;
    v27 = v13;
    v28 = 2048;
    v29 = objc_msgSend(v14, "maxRetry");
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Retrying task %{public}@ with savePath: %{public}@ after %f ms; attempt %ld/%ld...",
      buf,
      0x34u);

  }
  v15 = dispatch_time(0, (uint64_t)(v6 * 1000000.0));
  v16 = objc_claimAutoreleasedReturnValue(-[MSDSession demuxQueue](self, "demuxQueue"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10006D8E8;
  v18[3] = &unk_10013DE28;
  v18[4] = self;
  v19 = v4;
  v17 = v4;
  dispatch_after(v15, v16, v18);

}

- (id)parseResponseHeader:(id)a3 statusCode:(int64_t)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = objc_alloc_init((Class)NSMutableDictionary);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("X-Protocol-Version")));
  if (v7)
    objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("protocolVersion"));
  if (a4 == 202)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("Retry-After")));
    if (v8)
    {
      v9 = v8;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v8, "intValue")));
      objc_msgSend(v6, "setObject:forKey:", v10, CFSTR("retryAfter"));

    }
  }

  return v6;
}

- (id)getServerErrorMessage:(id)a3 withDefault:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "outData"));
  if (!v6)
  {
    v9 = 0;
    v8 = 0;
    goto LABEL_10;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v6, 0, 0));
  v8 = v7;
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("error_message")));
    if (v9)
      goto LABEL_7;
    v10 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v8));
  }
  else
  {
    v10 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v6, 4);
  }
  v9 = v10;
  if (!v10)
  {
LABEL_10:
    v11 = v5;
    goto LABEL_11;
  }
LABEL_7:
  if (!objc_msgSend(v9, "length"))
    goto LABEL_10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingFormat:", CFSTR(": %@"), v9));

LABEL_11:
  return v11;
}

- (void)logDownloadTaskLaunch:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  unint64_t v17;
  os_signpost_id_t v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentRange"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getRangeHeaderForDownload"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentRange"));
  v8 = objc_msgSend(v7, "downloadedBytes");

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentRange"));
  v10 = objc_msgSend(v9, "existingFileSize");

  if ((uint64_t)v8 + (uint64_t)v10 >= 1)
  {
    v11 = sub_1000604F0();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "info"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "savePath"));
      v21 = 138544130;
      v22 = v14;
      v23 = 2048;
      v24 = v10;
      v25 = 2048;
      v26 = v8;
      v27 = 2114;
      v28 = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "File %{public}@ is partially downloaded with existing size = %ld, downloaded bytes = %ld; using range header %{public}@",
        (uint8_t *)&v21,
        0x2Au);

    }
    v15 = sub_100060640();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    v17 = -[MSDSession signpostId](self, "signpostId");
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v18 = v17;
      if (os_signpost_enabled(v16))
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "info"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "savePath"));
        v21 = 138413058;
        v22 = v20;
        v23 = 2048;
        v24 = v10;
        v25 = 2048;
        v26 = v8;
        v27 = 2112;
        v28 = v6;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_EVENT, v18, "Resume Partial Download", "Resuming partial download for: %{xcode:string}@, existing size = %{xcode:size-in-bytes}lu; downloaded bytes = "
          "%{xcode:size-in-bytes}lu; range header = %{xcode:string}@",
          (uint8_t *)&v21,
          0x2Au);

      }
    }

  }
}

- (NSURLSession)session
{
  return (NSURLSession *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSession:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (BOOL)isDownloadPaused
{
  return self->_isDownloadPaused;
}

- (void)setIsDownloadPaused:(BOOL)a3
{
  self->_isDownloadPaused = a3;
}

- (MSDSessionTaskManager)taskManager
{
  return (MSDSessionTaskManager *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTaskManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (OS_dispatch_queue)demuxQueue
{
  return self->_demuxQueue;
}

- (void)setDemuxQueue:(id)a3
{
  objc_storeStrong((id *)&self->_demuxQueue, a3);
}

- (int64_t)requestTimeoutCount
{
  return self->_requestTimeoutCount;
}

- (void)setRequestTimeoutCount:(int64_t)a3
{
  self->_requestTimeoutCount = a3;
}

- (unint64_t)signpostId
{
  return self->_signpostId;
}

- (void)setSignpostId:(unint64_t)a3
{
  self->_signpostId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_demuxQueue, 0);
  objc_storeStrong((id *)&self->_taskManager, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end
