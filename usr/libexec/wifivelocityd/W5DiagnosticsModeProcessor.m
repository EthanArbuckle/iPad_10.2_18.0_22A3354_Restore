@implementation W5DiagnosticsModeProcessor

- (W5DiagnosticsModeProcessor)initWithCurrentPeer:(id)a3
{
  W5DiagnosticsModePeer *v4;
  W5DiagnosticsModeProcessor *v5;
  W5DiagnosticsModeProcessor *v6;
  NSOperationQueue *v7;
  NSOperationQueue *queue;
  NSOperationQueue *v9;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  objc_super v14;
  int v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;

  v4 = (W5DiagnosticsModePeer *)a3;
  v14.receiver = self;
  v14.super_class = (Class)W5DiagnosticsModeProcessor;
  v5 = -[W5DiagnosticsModeProcessor init](&v14, "init");
  v6 = v5;
  if (!v5)
    goto LABEL_9;
  if (!v4)
  {
    v11 = sub_10008F56C();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 136315906;
      v16 = "-[W5DiagnosticsModeProcessor initWithCurrentPeer:]";
      v17 = 2080;
      v18 = "W5DiagnosticsModeProcessor.m";
      v19 = 1024;
      v20 = 32;
      v21 = 2080;
      v22 = "-[W5DiagnosticsModeProcessor initWithCurrentPeer:]";
      LODWORD(v13) = 38;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v12, 0, "[wifivelocity] %s (%s:%u) %s: [DM] currentPeer is nil", (const char *)&v15, v13, LODWORD(v14.receiver), (const char *)v14.super_class);
    }

    goto LABEL_9;
  }
  v5->_currentPeer = v4;
  v7 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
  queue = v6->_queue;
  v6->_queue = v7;

  v9 = v6->_queue;
  if (!v9)
  {
LABEL_9:

    v6 = 0;
    goto LABEL_5;
  }
  -[NSOperationQueue setMaxConcurrentOperationCount:](v9, "setMaxConcurrentOperationCount:", 1);
LABEL_5:

  return v6;
}

- (void)performStartOperationsWithConfiguration:(id)a3 handler:(id)a4 completion:(id)a5
{
  void (**v8)(id, _QWORD, void *);
  uint64_t v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  void *v20;
  void *v21;
  BOOL v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  id v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *i;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  NSObject *v40;
  uint64_t v41;
  NSObject *v42;
  id v43;
  void *v44;
  id v45;
  uint64_t v46;
  void *j;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  NSObject *v52;
  id v53;
  void *v54;
  id v55;
  uint64_t v56;
  void *k;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  char *v66;
  void *v67;
  char *v68;
  id v69;
  id v70;
  id obj;
  id v72;
  _QWORD v73[4];
  void (**v74)(id, _QWORD, void *);
  id v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  id v88;
  _QWORD v89[2];
  _QWORD v90[2];
  _QWORD v91[2];
  _QWORD v92[2];
  const __CFString *v93;
  void *v94;
  const __CFString *v95;
  void *v96;
  _BYTE v97[128];
  const __CFString *v98;
  void *v99;
  _BYTE v100[128];
  const __CFString *v101;
  void *v102;
  _BYTE v103[128];
  char *v104;
  NSErrorUserInfoKey v105;
  const __CFString *v106;
  void *v107;
  _BYTE location[12];
  __int16 v109;
  const char *v110;
  __int16 v111;
  int v112;
  __int16 v113;
  const char *v114;
  __int16 v115;
  char *v116;

  v68 = (char *)a3;
  v72 = a4;
  v8 = (void (**)(id, _QWORD, void *))a5;
  v9 = sub_10008F56C();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)location = 136316162;
    *(_QWORD *)&location[4] = "-[W5DiagnosticsModeProcessor performStartOperationsWithConfiguration:handler:completion:]";
    v109 = 2080;
    v110 = "W5DiagnosticsModeProcessor.m";
    v111 = 1024;
    v112 = 53;
    v113 = 2080;
    v114 = "-[W5DiagnosticsModeProcessor performStartOperationsWithConfiguration:handler:completion:]";
    v115 = 2114;
    v116 = v68;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v10, 0, "[wifivelocity] %s (%s:%u) %s: [DM] configuration='%{public}@'", location, 48);
  }

  v11 = objc_msgSend(objc_alloc((Class)W5DiagnosticsMode), "initWithConfiguration:", v68);
  -[W5DiagnosticsModeProcessor setMode:](self, "setMode:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor mode](self, "mode"));
  LODWORD(v11) = v12 == 0;

  if ((_DWORD)v11)
  {
    v23 = sub_10008F56C();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)location = 136315906;
      *(_QWORD *)&location[4] = "-[W5DiagnosticsModeProcessor performStartOperationsWithConfiguration:handler:completion:]";
      v109 = 2080;
      v110 = "W5DiagnosticsModeProcessor.m";
      v111 = 1024;
      v112 = 57;
      v113 = 2114;
      v114 = v68;
      LODWORD(v65) = 38;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v24, 0, "[wifivelocity] %s (%s:%u) [DM] unable to create diagnostics mode from provided configuration='%{public}@'", location, v65);
    }

    v105 = NSLocalizedFailureReasonErrorKey;
    v106 = CFSTR("W5ParamErr");
    v66 = (char *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v106, &v105, 1));
    v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 1, v66));
    v107 = v67;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v107, 1));
    v8[2](v8, 0, v25);

  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor mode](self, "mode"));
    v88 = 0;
    v14 = -[W5DiagnosticsModeProcessor _canStartMode:error:](self, "_canStartMode:error:", v13, &v88);
    v66 = (char *)v88;

    if ((v14 & 1) != 0)
    {
      -[W5DiagnosticsModeProcessor setConfiguration:](self, "setConfiguration:", v68);
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor mode](self, "mode"));
      objc_msgSend(v15, "setState:", 3);

      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      -[W5DiagnosticsModeProcessor setOperationErrors:](self, "setOperationErrors:", v16);

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor mode](self, "mode"));
      v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "peers"));

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor currentPeer](self, "currentPeer"));
      v19 = objc_msgSend(v18, "role");

      if ((v19 & 8) != 0)
      {
        v28 = sub_100086BCC(v67, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
        obj = v29;
        if (v29)
        {
          v86 = 0u;
          v87 = 0u;
          v84 = 0u;
          v85 = 0u;
          v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v84, v103, 16);
          if (v30)
          {
            v31 = *(_QWORD *)v85;
            do
            {
              for (i = 0; i != v30; i = (char *)i + 1)
              {
                if (*(_QWORD *)v85 != v31)
                  objc_enumerationMutation(obj);
                v33 = *(_QWORD *)(*((_QWORD *)&v84 + 1) + 8 * (_QWORD)i);
                v101 = CFSTR("DiagnosticsMode");
                v34 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor mode](self, "mode"));
                v102 = v34;
                v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v102, &v101, 1));
                -[W5DiagnosticsModeProcessor _runAction:peer:info:handler:completion:](self, "_runAction:peer:info:handler:completion:", 3, v33, v35, v72, v8);

              }
              v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v103, 16);
            }
            while (v30);
          }
        }
        else
        {
          v41 = sub_10008F56C();
          v42 = objc_claimAutoreleasedReturnValue(v41);
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)location = 136315138;
            *(_QWORD *)&location[4] = "-[W5DiagnosticsModeProcessor performStartOperationsWithConfiguration:handler:completion:]";
            _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v42, 0, "[wifivelocity] %s: [DM] no primary peers found in peer list", location);
          }

        }
        v43 = sub_100086BCC(v67, 2);
        v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
        v70 = v44;
        if (v44)
        {
          v82 = 0u;
          v83 = 0u;
          v80 = 0u;
          v81 = 0u;
          v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v80, v100, 16);
          if (v45)
          {
            v46 = *(_QWORD *)v81;
            do
            {
              for (j = 0; j != v45; j = (char *)j + 1)
              {
                if (*(_QWORD *)v81 != v46)
                  objc_enumerationMutation(v70);
                v48 = *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * (_QWORD)j);
                v98 = CFSTR("DiagnosticsMode");
                v49 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor mode](self, "mode"));
                v99 = v49;
                v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v99, &v98, 1));
                -[W5DiagnosticsModeProcessor _runAction:peer:info:handler:completion:](self, "_runAction:peer:info:handler:completion:", 4, v48, v50, v72, v8);

              }
              v45 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v80, v100, 16);
            }
            while (v45);
          }
        }
        else
        {
          v51 = sub_10008F56C();
          v52 = objc_claimAutoreleasedReturnValue(v51);
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)location = 136315138;
            *(_QWORD *)&location[4] = "-[W5DiagnosticsModeProcessor performStartOperationsWithConfiguration:handler:completion:]";
            _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v52, 0, "[wifivelocity] %s: [DM] no secondary peers found in peer list", location);
          }

        }
        v53 = sub_100086BCC(v67, 4);
        v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
        v69 = v54;
        if (v54)
        {
          v78 = 0u;
          v79 = 0u;
          v76 = 0u;
          v77 = 0u;
          v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v76, v97, 16);
          if (v55)
          {
            v56 = *(_QWORD *)v77;
            do
            {
              for (k = 0; k != v55; k = (char *)k + 1)
              {
                if (*(_QWORD *)v77 != v56)
                  objc_enumerationMutation(v69);
                v58 = *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * (_QWORD)k);
                v95 = CFSTR("DiagnosticsMode");
                v59 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor mode](self, "mode"));
                v96 = v59;
                v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v96, &v95, 1));
                -[W5DiagnosticsModeProcessor _runAction:peer:info:handler:completion:](self, "_runAction:peer:info:handler:completion:", 0, v58, v60, v72, v8);

                v93 = CFSTR("DiagnosticsMode");
                v61 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor mode](self, "mode"));
                v94 = v61;
                v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v94, &v93, 1));
                -[W5DiagnosticsModeProcessor _runAction:peer:info:handler:completion:](self, "_runAction:peer:info:handler:completion:", 5, v58, v62, v72, v8);

              }
              v55 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v76, v97, 16);
            }
            while (v55);
          }
          goto LABEL_54;
        }
        v63 = sub_10008F56C();
        v40 = objc_claimAutoreleasedReturnValue(v63);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)location = 136315138;
          *(_QWORD *)&location[4] = "-[W5DiagnosticsModeProcessor performStartOperationsWithConfiguration:handler:completion:]";
          _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v40, 0, "[wifivelocity] %s: [DM] no sniffers found in peer list", location);
        }
        v69 = 0;
      }
      else
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor currentPeer](self, "currentPeer"));
        if ((objc_msgSend(v20, "role") & 1) != 0)
        {

        }
        else
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor currentPeer](self, "currentPeer"));
          v22 = ((unint64_t)objc_msgSend(v21, "role") & 2) == 0;

          if (v22)
            goto LABEL_55;
        }
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor currentPeer](self, "currentPeer"));
        v91[0] = CFSTR("event");
        v37 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithInt:", 0);
        v91[1] = CFSTR("DiagnosticsMode");
        v92[0] = v37;
        v38 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor mode](self, "mode"));
        v92[1] = v38;
        v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v92, v91, 2));
        -[W5DiagnosticsModeProcessor _runAction:peer:info:handler:completion:](self, "_runAction:peer:info:handler:completion:", 6, v36, v39, v72, v8);

        obj = (id)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor currentPeer](self, "currentPeer"));
        v89[0] = CFSTR("event");
        v70 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithInt:", 0);
        v89[1] = CFSTR("DiagnosticsMode");
        v90[0] = v70;
        v69 = (id)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor mode](self, "mode"));
        v90[1] = v69;
        v40 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v90, v89, 2));
        -[W5DiagnosticsModeProcessor _runAction:peer:info:handler:completion:](self, "_runAction:peer:info:handler:completion:", 11, obj, v40, v72, v8);
      }

LABEL_54:
LABEL_55:
      objc_initWeak((id *)location, self);
      v64 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor queue](self, "queue"));
      v73[0] = _NSConcreteStackBlock;
      v73[1] = 3221225472;
      v73[2] = sub_100086D14;
      v73[3] = &unk_1000D74E0;
      objc_copyWeak(&v75, (id *)location);
      v74 = v8;
      objc_msgSend(v64, "addBarrierBlock:", v73);

      objc_destroyWeak(&v75);
      objc_destroyWeak((id *)location);
      goto LABEL_56;
    }
    v26 = sub_10008F56C();
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)location = 136316162;
      *(_QWORD *)&location[4] = "-[W5DiagnosticsModeProcessor performStartOperationsWithConfiguration:handler:completion:]";
      v109 = 2080;
      v110 = "W5DiagnosticsModeProcessor.m";
      v111 = 1024;
      v112 = 65;
      v113 = 2080;
      v114 = "-[W5DiagnosticsModeProcessor performStartOperationsWithConfiguration:handler:completion:]";
      v115 = 2114;
      v116 = v66;
      LODWORD(v65) = 48;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v27, 0, "[wifivelocity] %s (%s:%u) %s: [DM] start preflight checks failed error='%{public}@'", location, v65);
    }

    v104 = v66;
    v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v104, 1));
    v8[2](v8, 0, v67);
  }
LABEL_56:

}

- (BOOL)_canStartMode:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  id v15;
  BOOL v16;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  NSErrorUserInfoKey v23;
  const __CFString *v24;
  _BYTE v25[128];

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "peers"));
  v6 = sub_100086BCC(v5, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if (v7)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v8);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i), "info", (_QWORD)v19));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("PrimaryChannel")));

          if (!v14)
          {
            v23 = NSLocalizedFailureReasonErrorKey;
            v24 = CFSTR("W5ParamErr");
            v16 = 1;
            v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));
            v15 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 1, v18));

            if (a4 && v15)
            {
              v15 = objc_retainAutorelease(v15);
              v16 = 0;
              *a4 = v15;
            }
            goto LABEL_12;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
        if (v10)
          continue;
        break;
      }
    }

  }
  v15 = 0;
  v16 = 1;
LABEL_12:

  return v16;
}

- (void)performStopOperationsForMode:(id)a3 handler:(id)a4 completion:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
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
  unsigned __int8 v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  NSObject *v43;
  id v44;
  uint64_t v45;
  void *i;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  NSObject *v51;
  id v52;
  uint64_t v53;
  void *j;
  uint64_t v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  BOOL v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  unsigned __int8 v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  unsigned __int8 v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  BOOL v89;
  void *v90;
  void *v91;
  uint64_t v92;
  NSObject *v93;
  void *v94;
  void *v95;
  void *v96;
  uint64_t v97;
  void *v98;
  void *v99;
  NSObject *obj;
  uint64_t v101;
  id v102;
  uint64_t v103;
  void *v104;
  id v105;
  id v106;
  void *v107;
  id v108;
  _QWORD v110[4];
  id v111;
  id v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  NSErrorUserInfoKey v125;
  const __CFString *v126;
  void *v127;
  _BYTE location[12];
  __int16 v129;
  const char *v130;
  __int16 v131;
  int v132;
  __int16 v133;
  id v134;
  __int16 v135;
  id v136;
  const __CFString *v137;
  void *v138;
  const __CFString *v139;
  void *v140;
  const __CFString *v141;
  void *v142;
  const __CFString *v143;
  void *v144;
  const __CFString *v145;
  void *v146;
  _QWORD v147[2];
  _QWORD v148[2];
  _QWORD v149[2];
  _QWORD v150[2];
  const __CFString *v151;
  void *v152;
  _BYTE v153[128];
  const __CFString *v154;
  void *v155;
  _BYTE v156[128];
  const __CFString *v157;
  id v158;
  const __CFString *v159;
  NSObject *v160;
  const __CFString *v161;
  void *v162;
  _BYTE v163[128];

  v7 = a3;
  v105 = a4;
  v106 = a5;
  v99 = v7;
  if (objc_msgSend(v7, "state") == (id)3 || objc_msgSend(v7, "state") == (id)4 || objc_msgSend(v7, "state") == (id)5)
  {
    -[W5DiagnosticsModeProcessor setMode:](self, "setMode:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    -[W5DiagnosticsModeProcessor setOperationErrors:](self, "setOperationErrors:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor mode](self, "mode"));
    objc_msgSend(v9, "setState:", 10);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor currentPeer](self, "currentPeer"));
    if ((objc_msgSend(v10, "role") & 8) != 0)
    {

    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor currentPeer](self, "currentPeer"));
      v12 = objc_msgSend(v11, "role");

      if ((v12 & 1) == 0)
        goto LABEL_52;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor mode](self, "mode"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "peers"));
    v15 = sub_100086BCC(v14, 4);
    v98 = (void *)objc_claimAutoreleasedReturnValue(v15);

    if (!v98)
    {
      v33 = sub_10008F56C();
      obj = objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(obj, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)location = 136315138;
        *(_QWORD *)&location[4] = "-[W5DiagnosticsModeProcessor performStopOperationsForMode:handler:completion:]";
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, obj, 0, "[wifivelocity] %s: [DM] no sniffers found in peer list", location);
      }
LABEL_25:

      v34 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor mode](self, "mode"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "peers"));
      v36 = sub_100086BCC(v35, 1);
      v37 = (void *)objc_claimAutoreleasedReturnValue(v36);

      v38 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor mode](self, "mode"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "peers"));
      v40 = sub_100086BCC(v39, 2);
      v41 = (void *)objc_claimAutoreleasedReturnValue(v40);

      v108 = objc_alloc_init((Class)NSMutableArray);
      if (v37)
        objc_msgSend(v108, "addObjectsFromArray:", v37);
      if (v41)
        objc_msgSend(v108, "addObjectsFromArray:", v41);
      v157 = CFSTR("peers");
      v158 = v108;
      v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v158, &v157, 1));
      -[W5DiagnosticsModeProcessor _runAction:peer:info:handler:completion:](self, "_runAction:peer:info:handler:completion:", 12, 0, v42, v105, v106);

      if (v37)
      {
        v119 = 0u;
        v120 = 0u;
        v117 = 0u;
        v118 = 0u;
        v43 = v37;
        v44 = -[NSObject countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v117, v156, 16);
        if (v44)
        {
          v45 = *(_QWORD *)v118;
          do
          {
            for (i = 0; i != v44; i = (char *)i + 1)
            {
              if (*(_QWORD *)v118 != v45)
                objc_enumerationMutation(v43);
              v47 = *(_QWORD *)(*((_QWORD *)&v117 + 1) + 8 * (_QWORD)i);
              v154 = CFSTR("DiagnosticsMode");
              v48 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor mode](self, "mode"));
              v155 = v48;
              v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v155, &v154, 1));
              -[W5DiagnosticsModeProcessor _runAction:peer:info:handler:completion:](self, "_runAction:peer:info:handler:completion:", 3, v47, v49, v105, v106);

            }
            v44 = -[NSObject countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v117, v156, 16);
          }
          while (v44);
        }
      }
      else
      {
        v50 = sub_10008F56C();
        v43 = objc_claimAutoreleasedReturnValue(v50);
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)location = 136315138;
          *(_QWORD *)&location[4] = "-[W5DiagnosticsModeProcessor performStopOperationsForMode:handler:completion:]";
          _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v43, 0, "[wifivelocity] %s: [DM] no primary peers found in peer list", location);
        }
      }

      if (v41)
      {
        v115 = 0u;
        v116 = 0u;
        v113 = 0u;
        v114 = 0u;
        v51 = v41;
        v52 = -[NSObject countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v113, v153, 16);
        if (v52)
        {
          v53 = *(_QWORD *)v114;
          do
          {
            for (j = 0; j != v52; j = (char *)j + 1)
            {
              if (*(_QWORD *)v114 != v53)
                objc_enumerationMutation(v51);
              v55 = *(_QWORD *)(*((_QWORD *)&v113 + 1) + 8 * (_QWORD)j);
              v151 = CFSTR("DiagnosticsMode");
              v56 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor mode](self, "mode"));
              v152 = v56;
              v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v152, &v151, 1));
              -[W5DiagnosticsModeProcessor _runAction:peer:info:handler:completion:](self, "_runAction:peer:info:handler:completion:", 4, v55, v57, v105, v106);

            }
            v52 = -[NSObject countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v113, v153, 16);
          }
          while (v52);
        }
      }
      else
      {
        v58 = sub_10008F56C();
        v51 = objc_claimAutoreleasedReturnValue(v58);
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)location = 136315138;
          *(_QWORD *)&location[4] = "-[W5DiagnosticsModeProcessor performStopOperationsForMode:handler:completion:]";
          _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v51, 0, "[wifivelocity] %s: [DM] no secondary peers found in peer list", location);
        }
      }

LABEL_52:
      v59 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor currentPeer](self, "currentPeer"));
      if ((objc_msgSend(v59, "role") & 1) != 0)
      {

      }
      else
      {
        v60 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor currentPeer](self, "currentPeer"));
        v61 = ((unint64_t)objc_msgSend(v60, "role") & 2) == 0;

        if (v61)
          goto LABEL_57;
      }
      v62 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor currentPeer](self, "currentPeer"));
      v149[0] = CFSTR("event");
      v63 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithInt:", 1);
      v150[0] = v63;
      v149[1] = CFSTR("DiagnosticsMode");
      v64 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor mode](self, "mode"));
      v150[1] = v64;
      v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v150, v149, 2));
      -[W5DiagnosticsModeProcessor _runAction:peer:info:handler:completion:](self, "_runAction:peer:info:handler:completion:", 6, v62, v65, v105, v106);

      v66 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor currentPeer](self, "currentPeer"));
      v147[0] = CFSTR("event");
      v67 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithInt:", 1);
      v147[1] = CFSTR("DiagnosticsMode");
      v148[0] = v67;
      v148[1] = v99;
      v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v148, v147, 2));
      -[W5DiagnosticsModeProcessor _runAction:peer:info:handler:completion:](self, "_runAction:peer:info:handler:completion:", 11, v66, v68, v105, v106);

      v69 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor currentPeer](self, "currentPeer"));
      v145 = CFSTR("DiagnosticsMode");
      v70 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor mode](self, "mode"));
      v146 = v70;
      v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v146, &v145, 1));
      -[W5DiagnosticsModeProcessor _runAction:peer:info:handler:completion:](self, "_runAction:peer:info:handler:completion:", 8, v69, v71, v105, v106);

      v72 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor currentPeer](self, "currentPeer"));
      v143 = CFSTR("DiagnosticsMode");
      v73 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor mode](self, "mode"));
      v144 = v73;
      v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v144, &v143, 1));
      -[W5DiagnosticsModeProcessor _runAction:peer:info:handler:completion:](self, "_runAction:peer:info:handler:completion:", 10, v72, v74, v105, v106);

LABEL_57:
      v75 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor currentPeer](self, "currentPeer"));
      v76 = objc_msgSend(v75, "role");

      if ((v76 & 1) != 0)
      {
        v77 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor currentPeer](self, "currentPeer"));
        v141 = CFSTR("DiagnosticsMode");
        v78 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor mode](self, "mode"));
        v142 = v78;
        v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v142, &v141, 1));
        -[W5DiagnosticsModeProcessor _runAction:peer:info:handler:completion:](self, "_runAction:peer:info:handler:completion:", 7, v77, v79, v105, v106);

      }
      v80 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor currentPeer](self, "currentPeer"));
      v81 = objc_msgSend(v80, "role");

      if ((v81 & 4) != 0)
      {
        v82 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor currentPeer](self, "currentPeer"));
        v139 = CFSTR("DiagnosticsMode");
        v83 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor mode](self, "mode"));
        v140 = v83;
        v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v140, &v139, 1));
        -[W5DiagnosticsModeProcessor _runAction:peer:info:handler:completion:](self, "_runAction:peer:info:handler:completion:", 8, v82, v84, v105, v106);

        v85 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor currentPeer](self, "currentPeer"));
        v137 = CFSTR("DiagnosticsMode");
        v138 = v99;
        v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v138, &v137, 1));
        -[W5DiagnosticsModeProcessor _runAction:peer:info:handler:completion:](self, "_runAction:peer:info:handler:completion:", 9, v85, v86, v105, v106);

      }
      v87 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor operationErrors](self, "operationErrors"));
      if (v87)
      {
        v88 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor operationErrors](self, "operationErrors"));
        v89 = objc_msgSend(v88, "count") == 0;

        if (!v89)
        {
          v90 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor mode](self, "mode"));
          objc_msgSend(v90, "setState:", 5);

        }
      }
      objc_initWeak((id *)location, self);
      v91 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor queue](self, "queue"));
      v110[0] = _NSConcreteStackBlock;
      v110[1] = 3221225472;
      v110[2] = sub_100087F28;
      v110[3] = &unk_1000D74E0;
      objc_copyWeak(&v112, (id *)location);
      v111 = v106;
      objc_msgSend(v91, "addBarrierBlock:", v110);

      objc_destroyWeak(&v112);
      objc_destroyWeak((id *)location);
      goto LABEL_65;
    }
    v123 = 0u;
    v124 = 0u;
    v121 = 0u;
    v122 = 0u;
    obj = v98;
    v102 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v121, v163, 16);
    if (!v102)
      goto LABEL_25;
    v101 = *(_QWORD *)v122;
LABEL_11:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v122 != v101)
      {
        v17 = v16;
        objc_enumerationMutation(obj);
        v16 = v17;
      }
      v103 = v16;
      v107 = *(void **)(*((_QWORD *)&v121 + 1) + 8 * v16);
      v161 = CFSTR("DiagnosticsMode");
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor mode](self, "mode"));
      v162 = v18;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v162, &v161, 1));
      -[W5DiagnosticsModeProcessor _runAction:peer:info:handler:completion:](self, "_runAction:peer:info:handler:completion:", 1, v107, v19, v105, v106);

      v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "peer"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "peerID"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor currentPeer](self, "currentPeer"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "peer"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "peerID"));
      if (v20 == v23)
        break;
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "peer"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "peerID"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor currentPeer](self, "currentPeer"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "peer"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "peerID"));
      v29 = objc_msgSend(v25, "isEqual:", v28);

      if ((v29 & 1) != 0)
        goto LABEL_18;
      v159 = CFSTR("DiagnosticsMode");
      v30 = objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor mode](self, "mode"));
      v160 = v30;
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v160, &v159, 1));
      -[W5DiagnosticsModeProcessor _runAction:peer:info:handler:completion:](self, "_runAction:peer:info:handler:completion:", 5, v107, v31, v105, v106);

LABEL_20:
      v16 = v103 + 1;
      if (v102 == (id)(v103 + 1))
      {
        v102 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v121, v163, 16);
        if (!v102)
          goto LABEL_25;
        goto LABEL_11;
      }
    }

LABEL_18:
    v32 = sub_10008F56C();
    v30 = objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)location = 136315394;
      *(_QWORD *)&location[4] = "-[W5DiagnosticsModeProcessor performStopOperationsForMode:handler:completion:]";
      v129 = 2112;
      v130 = (const char *)v107;
      LODWORD(v97) = 22;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v30, 0, "[wifivelocity] %s: [DM] skipping local peer (%@) set sniffer action", location, v97);
    }
    goto LABEL_20;
  }
  v92 = sub_10008F56C();
  v93 = objc_claimAutoreleasedReturnValue(v92);
  if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
  {
    *(_QWORD *)&location[4] = "-[W5DiagnosticsModeProcessor performStopOperationsForMode:handler:completion:]";
    v129 = 2080;
    *(_DWORD *)location = 136316162;
    v130 = "W5DiagnosticsModeProcessor.m";
    v131 = 1024;
    v132 = 351;
    v133 = 2048;
    v134 = objc_msgSend(v7, "state");
    v135 = 2114;
    v136 = v7;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v93, 0, "[wifivelocity] %s (%s:%u) [DM] invalid state (state=%ld) provided for stopping diagnostics mode='%{public}@'", location, 48);
  }

  v125 = NSLocalizedFailureReasonErrorKey;
  v126 = CFSTR("W5ParamErr");
  v94 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v126, &v125, 1));
  v95 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 1, v94));
  v127 = v95;
  v96 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v127, 1));
  (*((void (**)(id, _QWORD, void *))v106 + 2))(v106, 0, v96);

LABEL_65:
}

- (void)performUpdateOperationsForMode:(id)a3 incomingMode:(id)a4 handler:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  unsigned __int8 v25;
  void *v26;
  void *v27;
  void *v28;
  unsigned __int8 v29;
  void *v30;
  void *v31;
  void *v32;
  unsigned __int8 v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  BOOL v38;
  uint64_t v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  unsigned __int8 v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  const char *v62;
  id v63;
  id v64;
  _QWORD v65[4];
  id v66;
  id v67;
  id v68;
  const __CFString *v69;
  id v70;
  const __CFString *v71;
  id v72;
  const __CFString *v73;
  void *v74;
  const __CFString *v75;
  id v76;
  _QWORD v77[2];
  _QWORD v78[2];
  _QWORD v79[2];
  _QWORD v80[2];
  const __CFString *v81;
  id v82;
  const __CFString *v83;
  id v84;
  NSErrorUserInfoKey v85;
  const __CFString *v86;
  void *v87;
  _BYTE location[12];
  __int16 v89;
  const char *v90;
  __int16 v91;
  int v92;
  __int16 v93;
  id v94;
  const __CFString *v95;
  id v96;
  _QWORD v97[2];
  _QWORD v98[2];
  _QWORD v99[2];
  _QWORD v100[2];

  v64 = a3;
  v10 = a4;
  v63 = a5;
  v11 = a6;
  -[W5DiagnosticsModeProcessor setMode:](self, "setMode:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  -[W5DiagnosticsModeProcessor setOperationErrors:](self, "setOperationErrors:", v12);

  if (objc_msgSend(v10, "state") != (id)3)
    goto LABEL_13;
  if (!v64)
  {
    v13 = sub_10008F56C();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)location = 136315650;
      *(_QWORD *)&location[4] = "-[W5DiagnosticsModeProcessor performUpdateOperationsForMode:incomingMode:handler:completion:]";
      v89 = 2080;
      v90 = "W5DiagnosticsModeProcessor.m";
      v91 = 1024;
      v92 = 369;
      LODWORD(v62) = 28;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v14, 0, "[wifivelocity] %s (%s:%u) [DM] No existing mode exists. Adopting incoming mode", location, v62, (_DWORD)v63);
    }

    v64 = v10;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor currentPeer](self, "currentPeer"));
  if ((objc_msgSend(v15, "role") & 1) != 0)
  {

    goto LABEL_10;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor currentPeer](self, "currentPeer"));
  v17 = ((unint64_t)objc_msgSend(v16, "role") & 2) == 0;

  if (!v17)
  {
LABEL_10:
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor currentPeer](self, "currentPeer"));
    v99[0] = CFSTR("event");
    v19 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithInt:", 0);
    v99[1] = CFSTR("DiagnosticsMode");
    v100[0] = v19;
    v100[1] = v64;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v100, v99, 2));
    -[W5DiagnosticsModeProcessor _runAction:peer:info:handler:completion:](self, "_runAction:peer:info:handler:completion:", 6, v18, v20, v63, v11);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor currentPeer](self, "currentPeer"));
    v97[0] = CFSTR("event");
    v22 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithInt:", 0);
    v97[1] = CFSTR("DiagnosticsMode");
    v98[0] = v22;
    v98[1] = v64;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v98, v97, 2));
    -[W5DiagnosticsModeProcessor _runAction:peer:info:handler:completion:](self, "_runAction:peer:info:handler:completion:", 11, v21, v23, v63, v11);

  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor currentPeer](self, "currentPeer"));
  v25 = objc_msgSend(v24, "role");

  if ((v25 & 4) != 0)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor currentPeer](self, "currentPeer"));
    v95 = CFSTR("DiagnosticsMode");
    v96 = v64;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v96, &v95, 1));
    -[W5DiagnosticsModeProcessor _runAction:peer:info:handler:completion:](self, "_runAction:peer:info:handler:completion:", 5, v26, v27, v63, v11);

  }
LABEL_13:
  if (objc_msgSend(v10, "state") != (id)10)
  {
LABEL_29:
    objc_initWeak((id *)location, self);
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor queue](self, "queue"));
    v65[0] = _NSConcreteStackBlock;
    v65[1] = 3221225472;
    v65[2] = sub_1000889B8;
    v65[3] = &unk_1000D7508;
    v67 = v11;
    v66 = v10;
    objc_copyWeak(&v68, (id *)location);
    objc_msgSend(v61, "addBarrierBlock:", v65);

    objc_destroyWeak(&v68);
    objc_destroyWeak((id *)location);
    goto LABEL_30;
  }
  if (v64)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor currentPeer](self, "currentPeer"));
    v29 = objc_msgSend(v28, "role");

    if ((v29 & 1) != 0)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor currentPeer](self, "currentPeer"));
      v83 = CFSTR("DiagnosticsMode");
      v84 = v64;
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v84, &v83, 1));
      -[W5DiagnosticsModeProcessor _runAction:peer:info:handler:completion:](self, "_runAction:peer:info:handler:completion:", 7, v30, v31, v63, v11);

    }
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor currentPeer](self, "currentPeer"));
    v33 = objc_msgSend(v32, "role");

    if ((v33 & 2) != 0)
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor currentPeer](self, "currentPeer"));
      v81 = CFSTR("DiagnosticsMode");
      v82 = v64;
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v82, &v81, 1));
      -[W5DiagnosticsModeProcessor _runAction:peer:info:handler:completion:](self, "_runAction:peer:info:handler:completion:", 9, v34, v35, v63, v11);

    }
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor currentPeer](self, "currentPeer"));
    if ((objc_msgSend(v36, "role") & 1) != 0)
    {

    }
    else
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor currentPeer](self, "currentPeer"));
      v38 = ((unint64_t)objc_msgSend(v37, "role") & 2) == 0;

      if (v38)
      {
LABEL_27:
        v55 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor currentPeer](self, "currentPeer"));
        v56 = objc_msgSend(v55, "role");

        if ((v56 & 4) != 0)
        {
          v57 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor currentPeer](self, "currentPeer"));
          v71 = CFSTR("DiagnosticsMode");
          v72 = v64;
          v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v72, &v71, 1));
          -[W5DiagnosticsModeProcessor _runAction:peer:info:handler:completion:](self, "_runAction:peer:info:handler:completion:", 8, v57, v58, v63, v11);

          v59 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor currentPeer](self, "currentPeer"));
          v69 = CFSTR("DiagnosticsMode");
          v70 = v64;
          v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1));
          -[W5DiagnosticsModeProcessor _runAction:peer:info:handler:completion:](self, "_runAction:peer:info:handler:completion:", 9, v59, v60, v63, v11);

        }
        goto LABEL_29;
      }
    }
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor currentPeer](self, "currentPeer"));
    v79[0] = CFSTR("event");
    v45 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithInt:", 1);
    v79[1] = CFSTR("DiagnosticsMode");
    v80[0] = v45;
    v80[1] = v64;
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v80, v79, 2));
    -[W5DiagnosticsModeProcessor _runAction:peer:info:handler:completion:](self, "_runAction:peer:info:handler:completion:", 6, v44, v46, v63, v11);

    v47 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor currentPeer](self, "currentPeer"));
    v77[0] = CFSTR("event");
    v48 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithInt:", 1);
    v77[1] = CFSTR("DiagnosticsMode");
    v78[0] = v48;
    v78[1] = v64;
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v78, v77, 2));
    -[W5DiagnosticsModeProcessor _runAction:peer:info:handler:completion:](self, "_runAction:peer:info:handler:completion:", 11, v47, v49, v63, v11);

    v50 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor currentPeer](self, "currentPeer"));
    v75 = CFSTR("DiagnosticsMode");
    v76 = v64;
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1));
    -[W5DiagnosticsModeProcessor _runAction:peer:info:handler:completion:](self, "_runAction:peer:info:handler:completion:", 8, v50, v51, v63, v11);

    v52 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor currentPeer](self, "currentPeer"));
    v73 = CFSTR("DiagnosticsMode");
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor mode](self, "mode"));
    v74 = v53;
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v74, &v73, 1));
    -[W5DiagnosticsModeProcessor _runAction:peer:info:handler:completion:](self, "_runAction:peer:info:handler:completion:", 10, v52, v54, v63, v11);

    goto LABEL_27;
  }
  v39 = sub_10008F56C();
  v40 = objc_claimAutoreleasedReturnValue(v39);
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)location = 136315906;
    *(_QWORD *)&location[4] = "-[W5DiagnosticsModeProcessor performUpdateOperationsForMode:incomingMode:handler:completion:]";
    v89 = 2080;
    v90 = "W5DiagnosticsModeProcessor.m";
    v91 = 1024;
    v92 = 404;
    v93 = 2112;
    v94 = v10;
    LODWORD(v62) = 38;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v40, 0, "[wifivelocity] %s (%s:%u) [DM] No existing mode matches dm=%@. Returning.", location, v62);
  }

  v85 = NSLocalizedFailureReasonErrorKey;
  v86 = CFSTR("W5ParamErr");
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v86, &v85, 1));
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 1, v41));
  v87 = v42;
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v87, 1));
  (*((void (**)(id, _QWORD, void *))v11 + 2))(v11, 0, v43);

LABEL_30:
}

- (void)_runAction:(int64_t)a3 peer:(id)a4 info:(id)a5 handler:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24[2];
  id location;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  objc_initWeak(&location, self);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor queue](self, "queue"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100088C3C;
  v20[3] = &unk_1000D7530;
  v17 = v14;
  v23 = v17;
  v24[1] = (id)a3;
  v18 = v12;
  v21 = v18;
  v19 = v13;
  v22 = v19;
  objc_copyWeak(v24, &location);
  objc_msgSend(v16, "addOperationWithBlock:", v20);

  objc_destroyWeak(v24);
  objc_destroyWeak(&location);

}

- (void)_cleanup
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeProcessor queue](self, "queue"));
  objc_msgSend(v2, "cancelAllOperations");

}

- (NSDictionary)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (W5DiagnosticsMode)mode
{
  return self->_mode;
}

- (void)setMode:(id)a3
{
  objc_storeStrong((id *)&self->_mode, a3);
}

- (W5DiagnosticsModePeer)currentPeer
{
  return self->_currentPeer;
}

- (void)setCurrentPeer:(id)a3
{
  self->_currentPeer = (W5DiagnosticsModePeer *)a3;
}

- (NSMutableArray)operationErrors
{
  return self->_operationErrors;
}

- (void)setOperationErrors:(id)a3
{
  objc_storeStrong((id *)&self->_operationErrors, a3);
}

- (NSOperationQueue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_operationErrors, 0);
  objc_storeStrong((id *)&self->_mode, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
