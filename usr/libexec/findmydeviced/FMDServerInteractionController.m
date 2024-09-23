@implementation FMDServerInteractionController

- (FMDServerInteractionController)initWithChannels:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  FMDServerInteractionController *v9;
  FMDServerInteractionController *v10;
  uint64_t v11;
  NSMutableArray *requests;
  NSRecursiveLock *v13;
  NSRecursiveLock *requestModifierLock;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)FMDServerInteractionController;
  v9 = -[FMDServerInteractionController init](&v16, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_channels, a3);
    v11 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    requests = v10->_requests;
    v10->_requests = (NSMutableArray *)v11;

    v13 = objc_opt_new(NSRecursiveLock);
    requestModifierLock = v10->_requestModifierLock;
    v10->_requestModifierLock = v13;

    objc_storeStrong((id *)&v10->_delegate, a4);
  }

  return v10;
}

- (BOOL)enqueueRequest:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  BOOL v18;
  void *v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *i;
  uint64_t v29;
  id v30;
  uint64_t v31;
  void *j;
  void *v33;
  id v34;
  NSObject *v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  void *v39;
  FMDServerInteractionController *v40;
  id v41;
  void *v42;
  void *v43;
  id obj;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t buf[4];
  id v55;
  __int16 v56;
  id v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  id v61;
  _BYTE v62[128];
  _BYTE v63[128];

  v4 = a3;
  if ((objc_msgSend(v4, "type") & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "authId"));
    if (v6 && (v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "authToken"))) != 0)
    {

    }
    else
    {
      v8 = objc_opt_class(v4, v5);
      v10 = objc_opt_class(FMDRequestFMIPUnregister, v9);
      if (v6)

      if (v8 != v10)
      {
        v11 = sub_1000031B8();
        v12 = objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v55 = (id)objc_opt_class(v4, v13);
          v56 = 2048;
          v57 = v4;
          v14 = v55;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@ (0x%lX) No credentials found. Not sending the request", buf, 0x16u);

        }
        goto LABEL_14;
      }
    }
  }
  if (objc_msgSend(v4, "cancelled"))
  {
    v15 = sub_1000031B8();
    v12 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v55 = (id)objc_opt_class(v4, v16);
      v56 = 2048;
      v57 = v4;
      v17 = v55;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@ (0x%lX) Enqueueing request already cancelled", buf, 0x16u);

    }
LABEL_14:

    v18 = 0;
    goto LABEL_36;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServerInteractionController requestModifierLock](self, "requestModifierLock"));
  objc_msgSend(v19, "lock");

  v20 = sub_1000031B8();
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v55 = (id)objc_opt_class(v4, v22);
    v56 = 2048;
    v57 = v4;
    v23 = v55;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%@ (0x%lX) Enqueueing request", buf, 0x16u);

  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServerInteractionController requests](self, "requests"));
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
  if (v26)
  {
    v27 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v26; i = (char *)i + 1)
      {
        if (*(_QWORD *)v51 != v27)
          objc_enumerationMutation(v25);
        v29 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v4, "canReplace:", v29))
          objc_msgSend(v24, "addObject:", v29);
      }
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
    }
    while (v26);
  }

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = v24;
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v62, 16);
  if (v30)
  {
    v31 = *(_QWORD *)v47;
    do
    {
      for (j = 0; j != v30; j = (char *)j + 1)
      {
        if (*(_QWORD *)v47 != v31)
          objc_enumerationMutation(obj);
        v33 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)j);
        v34 = sub_1000031B8();
        v35 = objc_claimAutoreleasedReturnValue(v34);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          v37 = (id)objc_opt_class(v33, v36);
          v39 = (void *)objc_opt_class(v4, v38);
          *(_DWORD *)buf = 138413058;
          v55 = v37;
          v56 = 2048;
          v57 = v33;
          v58 = 2112;
          v59 = v39;
          v60 = 2048;
          v61 = v4;
          v40 = self;
          v41 = v39;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%@ (0x%lX) is being replaced with %@ (0x%lX)", buf, 0x2Au);

          self = v40;
        }

        -[FMDServerInteractionController cancelRequest:](self, "cancelRequest:", v33);
      }
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v62, 16);
    }
    while (v30);
  }

  v42 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServerInteractionController requests](self, "requests"));
  objc_msgSend(v42, "addObject:", v4);

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServerInteractionController requestModifierLock](self, "requestModifierLock"));
  objc_msgSend(v43, "unlock");

  -[FMDServerInteractionController _sendRequest:](self, "_sendRequest:", v4);
  v18 = 1;
LABEL_36:

  return v18;
}

- (void)cancelAllRequests
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *i;
  id v12;
  id v13;
  uint64_t v14;
  void *j;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServerInteractionController requestModifierLock](self, "requestModifierLock"));
  objc_msgSend(v3, "lock");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServerInteractionController requests](self, "requests"));
  v5 = objc_msgSend(v4, "copy");

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  -[FMDServerInteractionController setRequests:](self, "setRequests:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServerInteractionController requestModifierLock](self, "requestModifierLock"));
  objc_msgSend(v7, "unlock");

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServerInteractionController channels](self, "channels"));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i), "cancelAllRequests");
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v9);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v12 = v5;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v17;
    do
    {
      for (j = 0; j != v13; j = (char *)j + 1)
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v12);
        -[FMDServerInteractionController _markRequestCancelled:](self, "_markRequestCancelled:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)j), (_QWORD)v16);
      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v13);
  }

}

- (void)_sendRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void (**v19)(_QWORD, _QWORD);
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v34;
  uint64_t v35;
  void *v36;
  id v37;
  id v38;
  NSObject *v39;
  uint64_t v40;
  void *v41;
  id v42;
  id v43;
  NSObject *v44;
  uint64_t v45;
  void *v46;
  id v47;
  id v48;
  NSObject *v49;
  id v50;
  void *v51;
  id v52;
  void *v53;
  id v54;
  NSObject *v55;
  id v56;
  NSObject *v57;
  id v58;
  void *v59;
  _QWORD v60[4];
  NSObject *v61;
  FMDServerInteractionController *v62;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint8_t buf[4];
  void *v69;
  __int16 v70;
  id v71;
  __int16 v72;
  id v73;
  _BYTE v74[128];

  v4 = a3;
  if ((objc_msgSend(v4, "inProgress") & 1) == 0
    && (objc_msgSend(v4, "cancelled") & 1) == 0
    && (objc_msgSend(v4, "completed") & 1) == 0
    && objc_msgSend(v4, "willRetry"))
  {
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServerInteractionController channels](self, "channels"));
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v64, v74, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v65;
LABEL_7:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v65 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * v9);
        if (objc_msgSend(v10, "isActive"))
        {
          if ((objc_msgSend(v10, "supportsRequestType:", objc_msgSend(v4, "type")) & 1) != 0)
            break;
        }
        if (v7 == (id)++v9)
        {
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v64, v74, 16);
          if (v7)
            goto LABEL_7;
          goto LABEL_14;
        }
      }
      v11 = v10;

      if (!v11)
        goto LABEL_46;
      v12 = sub_1000031B8();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v15 = (void *)objc_opt_class(v4, v14);
        v16 = v15;
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "fm_logID"));
        *(_DWORD *)buf = 138412802;
        v69 = v15;
        v70 = 2048;
        v71 = v4;
        v72 = 2112;
        v73 = v17;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%@ (0x%lX) Sending to channel %@", buf, 0x20u);

      }
      objc_msgSend(v4, "setInProgress:", 1);
      objc_msgSend(v4, "setAlertFromServerResponse:", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "willSendHandler"));

      if (v18)
      {
        v19 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "willSendHandler"));
        ((void (**)(_QWORD, id))v19)[2](v19, v4);

      }
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "requestUrl"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServerInteractionController redirectedURL:](self, "redirectedURL:", v20));
      v22 = v21;
      if (v21)
      {
        v23 = v21;
      }
      else
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "urlTemplateType"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServerInteractionController udid](self, "udid"));
        v23 = (id)objc_claimAutoreleasedReturnValue(-[FMDServerInteractionController redirectedRequestURLForType:udid:](self, "redirectedRequestURLForType:udid:", v24, v25));

      }
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "requestBody"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "requestBodyData"));
      if (v27)
        goto LABEL_24;
      if (!v26)
      {
LABEL_44:

        goto LABEL_45;
      }
      v63 = 0;
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v26, 0, &v63));
      v50 = v63;
      v27 = v50;
      if (v29)
      {
        if (!v50)
        {
          v27 = v29;
LABEL_24:
          v28 = v23;
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "requestHeaders", v26));
          v30 = objc_msgSend(v29, "mutableCopy");
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("Authorization")));

          if (v31)
            objc_msgSend(v30, "setObject:forKeyedSubscript:", CFSTR("REDACTED"), CFSTR("Authorization"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v27, 0, 0));
          v33 = sub_100052FCC();
          v34 = objc_claimAutoreleasedReturnValue(v33);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            v36 = (void *)objc_opt_class(v4, v35);
            *(_DWORD *)buf = 138412802;
            v69 = v36;
            v70 = 2048;
            v71 = v4;
            v72 = 2112;
            v73 = v28;
            v37 = v36;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%@ (0x%lX) Sending to url %@ ", buf, 0x20u);

          }
          v38 = sub_100052FCC();
          v39 = objc_claimAutoreleasedReturnValue(v38);
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            v41 = (void *)objc_opt_class(v4, v40);
            *(_DWORD *)buf = 138412802;
            v69 = v41;
            v70 = 2048;
            v71 = v4;
            v72 = 2112;
            v73 = v30;
            v42 = v41;
            _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "%@ (0x%lX) Sending headers: \n%@ ", buf, 0x20u);

          }
          v43 = sub_100052FCC();
          v44 = objc_claimAutoreleasedReturnValue(v43);
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          {
            v46 = (void *)objc_opt_class(v4, v45);
            *(_DWORD *)buf = 138412802;
            v69 = v46;
            v70 = 2048;
            v71 = v4;
            v72 = 2112;
            v73 = v32;
            v47 = v46;
            _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "%@ (0x%lX) Sending with body dict : \n%@ ", buf, 0x20u);

          }
          if (objc_msgSend(v4, "cancelled"))
          {
            v48 = sub_1000031B8();
            v49 = objc_claimAutoreleasedReturnValue(v48);
            v23 = v28;
            if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
              sub_10022588C((uint64_t)v4, (uint64_t)v49);
          }
          else
          {
            -[FMDServerInteractionController _enablePowerAssertionForRequest:](self, "_enablePowerAssertionForRequest:", v4);
            v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "retryHelper"));
            v52 = objc_msgSend(v51, "totalRetryCount");

            v23 = v28;
            if (!v52)
              -[FMDServerInteractionController _beginXPCTransactionForRequest:](self, "_beginXPCTransactionForRequest:", v4);
            v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "requestId"));
            v60[0] = _NSConcreteStackBlock;
            v60[1] = 3221225472;
            v60[2] = sub_100009E5C;
            v60[3] = &unk_1002C12B0;
            v61 = v4;
            v62 = self;
            objc_msgSend(v11, "sendRequestWithId:toURL:withHeaders:body:completion:", v53, v28, v29, v27, v60);

            v49 = v61;
          }
          v26 = v59;
LABEL_43:

          goto LABEL_44;
        }
      }
      else
      {
        v54 = sub_1000031B8();
        v55 = objc_claimAutoreleasedReturnValue(v54);
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
          sub_100225804((uint64_t)v4, v55);

        if (!v27)
          goto LABEL_44;
      }
      v56 = sub_1000031B8();
      v57 = objc_claimAutoreleasedReturnValue(v56);
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
        sub_10022578C();

      v58 = sub_100052FCC();
      v49 = objc_claimAutoreleasedReturnValue(v58);
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        sub_100225714();
      goto LABEL_43;
    }
LABEL_14:
    v11 = v5;
LABEL_45:

  }
LABEL_46:

}

- (void)_handleResponseForRequest:(id)a3 withStatus:(int64_t)a4 headers:(id)a5 body:(id)a6 location:(id)a7 error:(id)a8
{
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  NSObject *v38;
  uint64_t v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
  NSObject *v46;
  id v47;
  uint64_t v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  BOOL v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  NSObject *v66;
  uint64_t v67;
  void *v68;
  id v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  NSObject *v74;
  void (**v75)(_QWORD, _QWORD);
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  unsigned int v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  id v88;
  NSObject *v89;
  uint64_t v90;
  void *v91;
  id v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  id v97;
  void *v98;
  id v99;
  id v100;
  id v101;
  uint8_t buf[4];
  void *v103;
  __int16 v104;
  id v105;
  __int16 v106;
  int64_t v107;
  __int16 v108;
  void *v109;
  __int16 v110;
  id v111;

  v14 = a3;
  v100 = a5;
  v15 = a6;
  v97 = a7;
  v99 = a8;
  v16 = sub_100052FCC();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v19 = (void *)objc_opt_class(v14, v18);
    v20 = v19;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "domain", v97));
    *(_DWORD *)buf = 138413314;
    v103 = v19;
    v104 = 2048;
    v105 = v14;
    v106 = 2048;
    v107 = a4;
    v108 = 2112;
    v109 = v21;
    v110 = 2048;
    v111 = objc_msgSend(v99, "code");
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%@ (0x%lX) received response with status %ld, error %@:%ld", buf, 0x34u);

  }
  v22 = sub_100052FCC();
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v25 = (void *)objc_opt_class(v14, v24);
    v26 = v25;
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "objectForKeyedSubscript:", CFSTR("X-Apple-Request-UUID")));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "objectForKeyedSubscript:", CFSTR("X-Request-UUID")));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "objectForKeyedSubscript:", CFSTR("X-Responding-Instance")));
    *(_DWORD *)buf = 138413314;
    v103 = v25;
    v104 = 2048;
    v105 = v14;
    v106 = 2114;
    v107 = (int64_t)v27;
    v108 = 2114;
    v109 = v28;
    v110 = 2114;
    v111 = v29;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%@ (0x%lX) X-Apple-Request-UUID: %{public}@, X-Request-UUID: %{public}@, X-Apple-Responding-Instance : %{public}@", buf, 0x34u);

  }
  v30 = sub_100052FCC();
  v31 = objc_claimAutoreleasedReturnValue(v30);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    v33 = (void *)objc_opt_class(v14, v32);
    v34 = v33;
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "description"));
    *(_DWORD *)buf = 138412802;
    v103 = v33;
    v104 = 2048;
    v105 = v14;
    v106 = 2112;
    v107 = (int64_t)v35;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%@ (0x%lX) received headers: \n%@", buf, 0x20u);

  }
  if (v15)
    v36 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v15, 4);
  else
    v36 = 0;
  v37 = sub_100052FCC();
  v38 = objc_claimAutoreleasedReturnValue(v37);
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    v40 = (void *)objc_opt_class(v14, v39);
    *(_DWORD *)buf = 138412802;
    v103 = v40;
    v104 = 2048;
    v105 = v14;
    v106 = 2112;
    v107 = (int64_t)v36;
    v41 = v40;
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "%@ (0x%lX) raw response body : %@", buf, 0x20u);

  }
  objc_msgSend(v14, "setHttpResponseStatus:", a4);
  objc_msgSend(v14, "setHttpResponseHeaders:", v100);
  objc_msgSend(v14, "setHttpResponseError:", v99);
  if (objc_msgSend(v15, "length"))
  {
    v101 = 0;
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v15, 0, &v101));
    v43 = v101;
    v44 = v43;
    if (v42 || !v43)
    {
      objc_msgSend(v14, "setHttpResponseBody:", v42);
      if (!v42)
      {
LABEL_21:

        goto LABEL_22;
      }
      v47 = sub_100052FCC();
      v46 = objc_claimAutoreleasedReturnValue(v47);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        v49 = (void *)objc_opt_class(v14, v48);
        v50 = v49;
        v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "description"));
        *(_DWORD *)buf = 138412802;
        v103 = v49;
        v104 = 2048;
        v105 = v14;
        v106 = 2112;
        v107 = (int64_t)v51;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "%@ (0x%lX) response body dict : \n%@", buf, 0x20u);

      }
    }
    else
    {
      v45 = sub_1000031B8();
      v46 = objc_claimAutoreleasedReturnValue(v45);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        sub_100225980();
    }

    goto LABEL_21;
  }
LABEL_22:
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "httpResponseBody", v97));
  v53 = v52 == 0;

  if (!v53)
  {
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "httpResponseBody"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "objectForKeyedSubscript:", CFSTR("alert")));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "fm_nullToNil"));
    objc_msgSend(v14, "setAlertFromServerResponse:", v56);

  }
  objc_msgSend(v14, "setCompleted:", objc_msgSend(v14, "responseErrorType") == 0);
  if (objc_msgSend(v14, "responseErrorType") == (id)1025)
  {
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "httpResponseHeaders"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "stringForCaseInsensitiveStringKey:", CFSTR("X-Apple-MMe-Host")));

    if (v58)
    {
      v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "urlTemplateType"));
      v60 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServerInteractionController udid](self, "udid"));
      v61 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServerInteractionController redirectedRequestURLForType:udid:](self, "redirectedRequestURLForType:udid:", v59, v60));
      v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "host"));

      v63 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServerInteractionController account](self, "account"));
      v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "authId"));
      +[FMDRealmSupport setRedirectedHost:forHost:withContext:](FMDRealmSupport, "setRedirectedHost:forHost:withContext:", v58, v62, v64);

      v65 = sub_1000031B8();
      v66 = objc_claimAutoreleasedReturnValue(v65);
      if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
      {
        v68 = (void *)objc_opt_class(v14, v67);
        v69 = v68;
        v70 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServerInteractionController account](self, "account"));
        v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "authId"));
        *(_DWORD *)buf = 138413314;
        v103 = v68;
        v104 = 2048;
        v105 = v14;
        v106 = 2112;
        v107 = (int64_t)v62;
        v108 = 2112;
        v109 = v58;
        v110 = 2112;
        v111 = v71;
        _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "%@ (0x%lX) Realm redirection from %@ to %@ for %@", buf, 0x34u);

      }
    }

  }
  -[FMDServerInteractionController _evaluateRetriesForRequest:](self, "_evaluateRetriesForRequest:", v14);
  objc_msgSend(v14, "setInProgress:", 0);
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "completionHandler"));

  if (v72)
  {
    v73 = sub_100052FCC();
    v74 = objc_claimAutoreleasedReturnValue(v73);
    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
      sub_100225904((uint64_t)v14, (uint64_t)v74);

    v75 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "completionHandler"));
    ((void (**)(_QWORD, id))v75)[2](v75, v14);

  }
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "alertFromServerResponse"));

  if (v76)
  {
    v77 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServerInteractionController delegate](self, "delegate"));
    objc_msgSend(v77, "didReceiveServerAlertForRequest:", v14);

  }
  v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "httpResponseHeaders"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "stringForCaseInsensitiveStringKey:", CFSTR("X-Apple-Force-Register")));
  if (objc_msgSend(v79, "isEqualToString:", CFSTR("true")))
  {

  }
  else
  {
    v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "httpResponseHeaders"));
    v81 = objc_msgSend(v80, "BOOLForCaseInsensitiveStringKey:", CFSTR("X-Apple-Force-Register"));

    if (!v81)
      goto LABEL_40;
  }
  v82 = (void *)objc_claimAutoreleasedReturnValue(+[FMDServiceProvider activeServiceProvider](FMDServiceProvider, "activeServiceProvider"));
  objc_msgSend(v82, "registerDeviceWithCause:force:", CFSTR("ForcedServerRegister"), 1);

LABEL_40:
  v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "httpResponseHeaders"));
  v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "objectForKey:", CFSTR("X-Apple-Ctx")));

  if (v84)
  {
    v85 = (void *)objc_claimAutoreleasedReturnValue(+[FMDProtectedContextManager sharedManager](FMDProtectedContextManager, "sharedManager"));
    objc_msgSend(v85, "cleanupAllContextsForKey:", CFSTR("serverContextHeaderContext"));

    v86 = (void *)objc_claimAutoreleasedReturnValue(+[FMDProtectedContextManager sharedManager](FMDProtectedContextManager, "sharedManager"));
    v87 = objc_msgSend(v86, "saveContext:forContextKey:dataProtectionClass:", v84, CFSTR("serverContextHeaderContext"), 4);

  }
  if ((objc_msgSend(v14, "willRetry") & 1) == 0)
  {
    v88 = sub_1000031B8();
    v89 = objc_claimAutoreleasedReturnValue(v88);
    if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
    {
      v91 = (void *)objc_opt_class(v14, v90);
      *(_DWORD *)buf = 138412546;
      v103 = v91;
      v104 = 2048;
      v105 = v14;
      v92 = v91;
      _os_log_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_DEFAULT, "%@ (0x%lX) Removing from the queue as it was completed or it exhausted its retries", buf, 0x16u);

    }
    objc_msgSend(v14, "deinitializeRequest");
    v93 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServerInteractionController requestModifierLock](self, "requestModifierLock"));
    objc_msgSend(v93, "lock");

    v94 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServerInteractionController requests](self, "requests"));
    objc_msgSend(v94, "removeObject:", v14);

    v95 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServerInteractionController requestModifierLock](self, "requestModifierLock"));
    objc_msgSend(v95, "unlock");

    -[FMDServerInteractionController _endXPCTransactionForRequest:](self, "_endXPCTransactionForRequest:", v14);
  }
  if (objc_msgSend(v14, "responseErrorType") == (id)257)
  {
    v96 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServerInteractionController delegate](self, "delegate"));
    objc_msgSend(v96, "didReceiveAuthFailureForRequest:", v14);

  }
  -[FMDServerInteractionController _disablePowerAssertionForRequest:](self, "_disablePowerAssertionForRequest:", v14);

}

- (void)cancelRequest:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;

  v4 = a3;
  v5 = sub_1000031B8();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v24 = (id)objc_opt_class(v4, v7);
    v25 = 2048;
    v26 = v4;
    v8 = v24;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Cancelling request %@ (0x%lX)", buf, 0x16u);

  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServerInteractionController channels](self, "channels", 0));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "requestId"));
        objc_msgSend(v13, "cancelRequestWithId:", v14);

      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  -[FMDServerInteractionController _markRequestCancelled:](self, "_markRequestCancelled:", v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServerInteractionController requestModifierLock](self, "requestModifierLock"));
  objc_msgSend(v15, "lock");

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServerInteractionController requests](self, "requests"));
  objc_msgSend(v16, "removeObject:", v4);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServerInteractionController requestModifierLock](self, "requestModifierLock"));
  objc_msgSend(v17, "unlock");

}

- (void)_markRequestCancelled:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD);
  _BYTE v11[24];

  v4 = a3;
  v5 = sub_1000031B8();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v11 = 138412546;
    *(_QWORD *)&v11[4] = objc_opt_class(v4, v7);
    *(_WORD *)&v11[12] = 2048;
    *(_QWORD *)&v11[14] = v4;
    v8 = *(id *)&v11[4];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Marking request cancelled %@ (0x%lX)", v11, 0x16u);

  }
  objc_msgSend(v4, "setCancelled:", 1);
  objc_msgSend(v4, "setInProgress:", 0);
  -[FMDServerInteractionController _evaluateRetriesForRequest:](self, "_evaluateRetriesForRequest:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "completionHandler"));

  if (v9)
  {
    v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "completionHandler"));
    ((void (**)(_QWORD, id))v10)[2](v10, v4);

  }
  objc_msgSend(v4, "deinitializeRequest", *(_OWORD *)v11, *(_QWORD *)&v11[16]);
  -[FMDServerInteractionController _endXPCTransactionForRequest:](self, "_endXPCTransactionForRequest:", v4);
  -[FMDServerInteractionController _disablePowerAssertionForRequest:](self, "_disablePowerAssertionForRequest:", v4);

}

- (void)_evaluateRetriesForRequest:(id)a3
{
  id v4;
  void *v5;
  FMDRequestRetryHelper *v6;
  FMDRequestRetryHelper *v7;
  void *v8;
  void **v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id v14;
  id from;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "retryHelper"));

  if (!v5)
  {
    objc_initWeak(&location, self);
    objc_initWeak(&from, v4);
    v6 = [FMDRequestRetryHelper alloc];
    v9 = _NSConcreteStackBlock;
    v10 = 3221225472;
    v11 = sub_10000AE3C;
    v12 = &unk_1002C12D8;
    objc_copyWeak(&v13, &location);
    objc_copyWeak(&v14, &from);
    v7 = -[FMDRequestRetryHelper initWithRequest:retryAction:](v6, "initWithRequest:retryAction:", v4, &v9);
    objc_msgSend(v4, "setRetryHelper:", v7, v9, v10, v11, v12);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "retryHelper"));
  objc_msgSend(v8, "checkAndScheduleRetries");

}

- (void)_beginXPCTransactionForRequest:(id)a3
{
  id v3;
  uint64_t v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  v5 = (objc_class *)objc_opt_class(v3, v4);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-0x%p"), v7, v3));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[FMXPCTransactionManager sharedInstance](FMXPCTransactionManager, "sharedInstance"));
  objc_msgSend(v8, "beginTransaction:", v9);

}

- (void)_endXPCTransactionForRequest:(id)a3
{
  id v3;
  uint64_t v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  v5 = (objc_class *)objc_opt_class(v3, v4);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-0x%p"), v7, v3));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[FMXPCTransactionManager sharedInstance](FMXPCTransactionManager, "sharedInstance"));
  objc_msgSend(v8, "endTransaction:", v9);

}

- (void)_enablePowerAssertionForRequest:(id)a3
{
  id v3;
  uint64_t v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  v5 = (objc_class *)objc_opt_class(v3, v4);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-0x%p"), v7, v3));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[FMDPowerMgr sharedInstance](FMDPowerMgr, "sharedInstance"));
  objc_msgSend(v8, "powerAssertionEnableWithReason:", v9);

}

- (void)_disablePowerAssertionForRequest:(id)a3
{
  id v3;
  uint64_t v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  v5 = (objc_class *)objc_opt_class(v3, v4);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-0x%p"), v7, v3));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[FMDPowerMgr sharedInstance](FMDPowerMgr, "sharedInstance"));
  objc_msgSend(v8, "powerAssertionDisableWithReason:", v9);

}

- (id)requestUrlForType:(id)a3 udid:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  RequestTemplateURL *v10;
  void *v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[FMDServerConfig sharedInstance](FMDServerConfig, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "urlTemplateForRequestType:", v7));

  v10 = objc_alloc_init(RequestTemplateURL);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServerInteractionController account](self, "account"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RequestTemplateURL urlFromTemplate:account:udid:](v10, "urlFromTemplate:account:udid:", v9, v11, v6));

  return v12;
}

- (id)redirectedRequestURLForType:(id)a3 udid:(id)a4
{
  void *v5;
  void *v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServerInteractionController requestUrlForType:udid:](self, "requestUrlForType:udid:", a3, a4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServerInteractionController redirectedURL:](self, "redirectedURL:", v5));

  return v6;
}

- (id)redirectedURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "host"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServerInteractionController account](self, "account"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "authId"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[FMDRealmSupport redirectedHostForHost:withContext:](FMDRealmSupport, "redirectedHostForHost:withContext:", v6, v8));

    v10 = v5;
    if (v9)
    {
      v10 = v5;
      if ((objc_msgSend(v6, "isEqualToString:", v9) & 1) == 0)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URLByReplacingHost:", v9));

      }
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)account
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServerInteractionController requestAccount](self, "requestAccount"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServerInteractionController requestAccount](self, "requestAccount"));
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServerInteractionController delegate](self, "delegate"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "accountForServerInteractionController:", self));

  }
  return v4;
}

- (NSString)udid
{
  void *v3;
  NSString *v4;
  NSString *udid;
  NSString *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v4 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "deviceUDID"));

  if (self->_udid)
    udid = self->_udid;
  else
    udid = v4;
  v6 = udid;

  return v6;
}

- (void)setUdid:(id)a3
{
  objc_storeStrong((id *)&self->_udid, a3);
}

- (FMDAccount)requestAccount
{
  return self->_requestAccount;
}

- (void)setRequestAccount:(id)a3
{
  objc_storeStrong((id *)&self->_requestAccount, a3);
}

- (NSRecursiveLock)requestModifierLock
{
  return self->_requestModifierLock;
}

- (void)setRequestModifierLock:(id)a3
{
  objc_storeStrong((id *)&self->_requestModifierLock, a3);
}

- (NSArray)channels
{
  return self->_channels;
}

- (void)setChannels:(id)a3
{
  objc_storeStrong((id *)&self->_channels, a3);
}

- (NSMutableArray)requests
{
  return self->_requests;
}

- (void)setRequests:(id)a3
{
  objc_storeStrong((id *)&self->_requests, a3);
}

- (FMDServerInteractionControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_channels, 0);
  objc_storeStrong((id *)&self->_requestModifierLock, 0);
  objc_storeStrong((id *)&self->_requestAccount, 0);
  objc_storeStrong((id *)&self->_udid, 0);
}

@end
