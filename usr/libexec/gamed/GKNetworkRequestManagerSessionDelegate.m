@implementation GKNetworkRequestManagerSessionDelegate

- (GKNetworkRequestManagerSessionDelegate)initWithNetworkManager:(id)a3
{
  id v4;
  GKNetworkRequestManagerSessionDelegate *v5;
  GKNetworkRequestManagerSessionDelegate *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GKNetworkRequestManagerSessionDelegate;
  v5 = -[GKNetworkRequestManagerSessionDelegate init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_networkManager, v4);

  return v6;
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didResumeAtOffset:(int64_t)a5 expectedTotalBytes:(int64_t)a6
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  int v16;
  int64_t v17;
  __int16 v18;
  int64_t v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;

  v9 = a3;
  v10 = a4;
  v11 = objc_autoreleasePoolPush();
  v13 = v11;
  if (!os_log_GKGeneral)
    v14 = (id)GKOSLoggers(v11, v12);
  v15 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    v16 = 134218754;
    v17 = a5;
    v18 = 2048;
    v19 = a6;
    v20 = 2112;
    v21 = v9;
    v22 = 2112;
    v23 = v10;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "GKNetworkRequestManager Download resumed at offset %lld bytes out of an expected %lld bytes. Session %@ task %@\n", (uint8_t *)&v16, 0x2Au);
  }
  objc_autoreleasePoolPop(v13);

}

- (void)URLSession:(id)a3 task:(id)a4 _willSendRequestForEstablishedConnection:(id)a5 completionHandler:(id)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD *v14;
  void (**v15)(_QWORD);
  void *v16;
  id v17;
  NSObject *v18;
  _QWORD v19[4];
  id v20;
  void (**v21)(_QWORD);
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;

  v8 = a5;
  v9 = a6;
  v10 = v8;
  +[GKStoreBag addAuthHeadersToRequest:](GKStoreBag, "addAuthHeadersToRequest:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "valueForHTTPHeaderField:", CFSTR("x-gk-sap-signature")));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000C7640;
  v22[3] = &unk_1002BB568;
  v23 = v10;
  v12 = v23;
  v24 = v12;
  v13 = v9;
  v25 = v13;
  v14 = objc_retainBlock(v22);
  v15 = (void (**)(_QWORD))v14;
  if (v11)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManagerSessionDelegate networkManager](self, "networkManager"));
    if (v16)
    {
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_1000C7744;
      v19[3] = &unk_1002C1940;
      v20 = v12;
      v21 = v15;
      objc_msgSend(v16, "getFairPlaySession:", v19);

    }
    else
    {
      if (!os_log_GKGeneral)
        v17 = (id)GKOSLoggers(0);
      v18 = os_log_GKError;
      if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
        sub_1000C860C(v18);
      v15[2](v15);
    }

  }
  else
  {
    ((void (*)(_QWORD *))v14[2])(v14);
  }

}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  GKNetworkRequestManager **p_networkManager;
  id WeakRetained;
  id v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  id v35;
  NSObject *v36;
  id v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  char *v42;
  id v43;
  BOOL v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  void *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  BOOL v61;
  void *v62;
  void *v63;
  uint64_t v64;
  id v65;
  NSObject *v66;
  void *v67;
  id v68;
  NSObject *v69;
  id v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  NSObject *log;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  __CFString *v82;
  void *v83;
  uint8_t buf[4];
  id v85;
  __int16 v86;
  id v87;
  __int16 v88;
  void *v89;
  __int16 v90;
  id v91;
  __int16 v92;
  void *v93;
  __int16 v94;
  void *v95;
  __int16 v96;
  void *v97;
  _QWORD v98[3];
  _QWORD v99[3];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_autoreleasePoolPush();
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "response"));
  p_networkManager = &self->_networkManager;
  WeakRetained = objc_loadWeakRetained((id *)&self->_networkManager);

  if (!v9 || !WeakRetained)
  {
    if (!os_log_GKGeneral)
      v20 = (id)GKOSLoggers(v15);
    v21 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v85 = v8;
      v86 = 2112;
      v87 = v9;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "GKNetworkRequestManager Download manager or task is nil. Session %@ task %@", buf, 0x16u);
    }
    goto LABEL_82;
  }
  if (!v10 || (v15 = objc_msgSend(v10, "code"), v15 != (id)-999))
  {
    if (!v12)
    {
      if (!os_log_GKGeneral)
        v37 = (id)GKOSLoggers(v15);
      v38 = os_log_GKDaemon;
      if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v85 = v8;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "GKNetworkRequestManager Session %@ Task completed but repsonse was nil, going to retry", buf, 0xCu);
      }
      v18 = objc_claimAutoreleasedReturnValue(+[GKNetworkRequestManager dictionaryFromTaskDescription:](GKNetworkRequestManager, "dictionaryFromTaskDescription:", v9));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "originalRequest"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[GKNetworkRequestManager taskWithRequest:description:session:](GKNetworkRequestManager, "taskWithRequest:description:session:", v39, v18, v8));

      objc_msgSend(v19, "resume");
      goto LABEL_29;
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[GKNetworkRequestManager uuidFromTask:](GKNetworkRequestManager, "uuidFromTask:", v9));
    if (v22)
    {
      v23 = objc_loadWeakRetained((id *)p_networkManager);
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "resultsLocation"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "pathToTempFile:fileName:", v24, v22));

      v26 = objc_loadWeakRetained((id *)p_networkManager);
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "resultsLocation"));
      v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "filePathToTempFile:fileName:", v27, v22));

      v28 = v25;
      if (v25)
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "absoluteString"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:", v29));

        if (v30)
        {
          v31 = v30;
          v78 = v22;
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKey:", CFSTR("status")));
          v33 = objc_msgSend(v32, "longValue");

          v81 = v31;
          v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKey:", CFSTR("message")));
          v82 = (__CFString *)v34;
          v28 = v25;
          v80 = (uint64_t)v33;
          if (v33)
          {
            if (!os_log_GKGeneral)
              v35 = (id)GKOSLoggers(v34);
            v36 = os_log_GKDaemon;
            if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 134217984;
              v85 = v33;
              _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "GKNetworkRequestManager serverError %ld", buf, 0xCu);
            }
          }
          v22 = v78;
          if (v82)
          {
LABEL_34:
            v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
            v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "path"));
            objc_msgSend(v40, "removeItemAtPath:error:", v41, 0);

            v42 = (char *)objc_msgSend(v12, "statusCode");
            if (v42 == (char *)520)
            {
              v43 = objc_loadWeakRetained((id *)p_networkManager);
              objc_msgSend(v43, "handleRetryAfter:", v9);
LABEL_81:

              goto LABEL_82;
            }
            v46 = v42 != (char *)401 && v42 != (char *)200 && v42 != (char *)413 && (unint64_t)(v42 - 433) > 1;
            v77 = v28;
            if (v46 || v80 != 5000)
            {
              v61 = v42 != (char *)200 && v42 != (char *)304 && v42 != (char *)206;
              if (!v10 && !v61 && v80 < 1)
                goto LABEL_76;
              v98[0] = CFSTR("statusCode");
              v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v42));
              v99[0] = v62;
              v98[1] = CFSTR("serverResult");
              v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", v80));
              v98[2] = CFSTR("serverMessage");
              v99[1] = v63;
              v99[2] = v82;
              v43 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v99, v98, 3));

              if (!os_log_GKGeneral)
                v65 = (id)GKOSLoggers(v64);
              v66 = os_log_GKDaemon;
              if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v85 = v43;
                _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_INFO, "GKNetworkRequestManager sending event %@", buf, 0xCu);
              }
              v67 = (void *)objc_claimAutoreleasedReturnValue(+[GKReporter reporter](GKReporter, "reporter"));
              objc_msgSend(v67, "reportEvent:type:payload:", GKReporterDomainNetworkRequests, GKNetworkRequestFailure, v43);

              v28 = v77;
            }
            else
            {
              v43 = (id)objc_claimAutoreleasedReturnValue(+[GKNetworkRequestManager dictionaryFromTaskDescription:](GKNetworkRequestManager, "dictionaryFromTaskDescription:", v9));
              v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("_gkAuthRetries")));
              v48 = (uint64_t)objc_msgSend(v47, "longValue");

              if (v48 <= 9)
              {
                v50 = v48 + 1;
                if (!os_log_GKGeneral)
                  v51 = (id)GKOSLoggers(v49);
                v52 = (void *)os_log_GKDaemon;
                if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
                {
                  v53 = v52;
                  v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v50));
                  *(_DWORD *)buf = 138412546;
                  v85 = v54;
                  v86 = 2112;
                  v87 = v43;
                  _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_INFO, "GKNetworkRequestManager auth failure, retry %@: for request: %@", buf, 0x16u);

                }
                v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v50));
                objc_msgSend(v43, "setObject:forKeyedSubscript:", v55, CFSTR("_gkAuthRetries"));

                v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "originalRequest"));
                +[GKStoreBag addAuthHeadersToRequest:](GKStoreBag, "addAuthHeadersToRequest:", v56);

                v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "originalRequest"));
                v58 = (void *)objc_claimAutoreleasedReturnValue(+[GKNetworkRequestManager taskWithRequest:description:session:](GKNetworkRequestManager, "taskWithRequest:description:session:", v57, v43, v8));

                objc_msgSend(v58, "resume");
                v28 = v77;
                goto LABEL_81;
              }
              if (!os_log_GKGeneral)
                v68 = (id)GKOSLoggers(v49);
              v69 = os_log_GKDaemon;
              v28 = v77;
              if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v85 = v43;
                _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_INFO, "GKNetworkRequestManager request exceeded maximum amount of auth retries: %@", buf, 0xCu);
              }
            }

LABEL_76:
            if (!os_log_GKGeneral)
              v70 = (id)GKOSLoggers(v42);
            v71 = (void *)os_log_GKDaemon;
            if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
            {
              v79 = v22;
              log = v71;
              v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v12, "statusCode")));
              v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", v80));
              v73 = (void *)objc_claimAutoreleasedReturnValue(+[GKNetworkRequestManager dictionaryFromTaskDescription:](GKNetworkRequestManager, "dictionaryFromTaskDescription:", v9));
              v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "allHeaderFields"));
              *(_DWORD *)buf = 138413826;
              v85 = v9;
              v86 = 2112;
              v87 = v75;
              v88 = 2112;
              v89 = v72;
              v90 = 2112;
              v91 = v10;
              v92 = 2112;
              v93 = v73;
              v94 = 2112;
              v95 = v74;
              v96 = 2112;
              v97 = v81;
              _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "GKNetworkRequestManager Task completed: %@ code:%@ serverCode:%@ error: %@ descriptor: %@ , headers: %@ resultsPlist: %@", buf, 0x48u);

              v22 = v79;
              v28 = v77;

            }
            v43 = objc_loadWeakRetained((id *)p_networkManager);
            objc_msgSend(v43, "handleTaskFinished:", v9);
            goto LABEL_81;
          }
        }
        else
        {
          v80 = -1;
          v81 = 0;
          v28 = v25;
        }
LABEL_33:
        v82 = &stru_1002CE2A8;
        goto LABEL_34;
      }
      v81 = 0;
    }
    else
    {
      v81 = 0;
      v28 = 0;
      v83 = 0;
    }
    v80 = -1;
    goto LABEL_33;
  }
  if (!os_log_GKGeneral)
    v16 = (id)GKOSLoggers(-999);
  v17 = (void *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    v18 = v17;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[GKNetworkRequestManager dictionaryFromTaskDescription:](GKNetworkRequestManager, "dictionaryFromTaskDescription:", v9));
    *(_DWORD *)buf = 138412290;
    v85 = v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "GKNetworkRequestManager task was explicitly cancelled: %@", buf, 0xCu);
LABEL_29:

  }
LABEL_82:

  objc_autoreleasePoolPop(v11);
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  NSObject *v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  id v23;
  NSObject *v24;
  id v25;
  NSObject *v26;
  id v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;

  v7 = a5;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKNetworkRequestManager uuidFromTask:](GKNetworkRequestManager, "uuidFromTask:", v8));

  if (v10)
  {
    v12 = objc_loadWeakRetained((id *)&self->_networkManager);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "resultsLocation"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "filePathToTempFile:fileName:", v13, v10));

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "path"));
    objc_msgSend(v9, "removeItemAtPath:error:", v15, 0);

    v27 = 0;
    LODWORD(v13) = objc_msgSend(v9, "moveItemAtURL:toURL:error:", v7, v14, &v27);
    v16 = v27;
    v17 = v16;
    if ((_DWORD)v13)
    {
      if (!os_log_GKGeneral)
        v18 = (id)GKOSLoggers(v16);
      v19 = os_log_GKDaemon;
      if (!os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
        goto LABEL_16;
      *(_DWORD *)buf = 138412546;
      v29 = v7;
      v30 = 2112;
      v31 = v14;
      v20 = "GKNetworkRequestManager moved %@ to %@";
      v21 = v19;
      v22 = 22;
    }
    else
    {
      if (!os_log_GKGeneral)
        v25 = (id)GKOSLoggers(v16);
      v26 = os_log_GKDaemon;
      if (!os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
        goto LABEL_16;
      *(_DWORD *)buf = 138412802;
      v29 = v7;
      v30 = 2112;
      v31 = v14;
      v32 = 2112;
      v33 = v17;
      v20 = "GKNetworkRequestManager failed to move %@ to %@ error:%@";
      v21 = v26;
      v22 = 32;
    }
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, v20, buf, v22);
LABEL_16:

    goto LABEL_17;
  }
  if (!os_log_GKGeneral)
    v23 = (id)GKOSLoggers(v11);
  v24 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "GKNetworkRequestManager cannot move file into place there was no uuid in the task description", buf, 2u);
  }
LABEL_17:

}

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint8_t v14[16];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (!os_log_GKGeneral)
    v11 = (id)GKOSLoggers(v9);
  v12 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "GKNetworkRequestManager finished collecting metrics for background task", v14, 2u);
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[GKAMPController controller](GKAMPController, "controller"));
  objc_msgSend(v13, "reportURLSessionEventWithTask:metrics:", v8, v10);

}

- (GKNetworkRequestManager)networkManager
{
  return (GKNetworkRequestManager *)objc_loadWeakRetained((id *)&self->_networkManager);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_networkManager);
}

@end
