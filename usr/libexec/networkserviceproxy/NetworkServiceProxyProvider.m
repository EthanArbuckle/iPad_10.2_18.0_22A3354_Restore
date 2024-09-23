@implementation NetworkServiceProxyProvider

- (NetworkServiceProxyProvider)init
{
  NetworkServiceProxyProvider *v2;
  uint64_t default_evaluator;
  OS_nw_path_evaluator *defaultEvaluator;
  uint64_t v5;
  OS_nw_context *nwContext;
  OS_nw_context *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  objc_super v12;
  _QWORD v13[5];

  v12.receiver = self;
  v12.super_class = (Class)NetworkServiceProxyProvider;
  v2 = -[NetworkServiceProxyProvider init](&v12, "init");
  if (v2)
  {
    default_evaluator = nw_path_create_default_evaluator();
    defaultEvaluator = v2->_defaultEvaluator;
    v2->_defaultEvaluator = (OS_nw_path_evaluator *)default_evaluator;

    v5 = nw_context_create("com.apple.networksrviceproxy.flow-divert");
    nwContext = v2->_nwContext;
    v2->_nwContext = (OS_nw_context *)v5;

    v7 = v2->_nwContext;
    v9 = NPGetInternalQueue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100007658;
    v13[3] = &unk_1000F5720;
    v13[4] = v2;
    nw_context_set_idle_handler(v7, v10, v13);

    nw_context_set_isolate_protocol_cache(v2->_nwContext, 1);
  }
  return v2;
}

- (void)startProxyWithOptions:(id)a3 completionHandler:(id)a4
{
  void (**v5)(id, _QWORD);
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  NetworkServiceProxyProvider *v11;

  v5 = (void (**)(id, _QWORD))a4;
  v6 = NPGetInternalQueue();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  dispatch_assert_queue_V2(v7);

  v8 = nplog_obj();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = 138412290;
    v11 = self;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%@ startProxyWithOptions", (uint8_t *)&v10, 0xCu);
  }

  v5[2](v5, 0);
}

- (void)stopProxyWithReason:(int64_t)a3 completionHandler:(id)a4
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  void *v14;
  int v15;
  NetworkServiceProxyProvider *v16;

  v5 = a4;
  v6 = NPGetInternalQueue(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  dispatch_assert_queue_V2(v7);

  v11 = nplog_obj(v8, v9, v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v15 = 138412290;
    v16 = self;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%@ stopProxyWithReason", (uint8_t *)&v15, 0xCu);
  }

  if (self)
    objc_setProperty_atomic(self, v13, 0, 32);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSPManager sharedManager](NSPManager, "sharedManager"));
  objc_msgSend(v14, "stopWithCompletionHandler:", v5);

}

- (void)handleAppMessage:(id)a3 completionHandler:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (**v10)(_QWORD, _QWORD);
  uint64_t v11;
  uint64_t isKindOfClass;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void ***v17;
  void *v18;
  void ***v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  id v30;
  SEL v31;
  _QWORD *v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  NSObject *v36;
  void **v37;
  uint64_t v38;
  void (*v39)(uint64_t, uint64_t);
  void *v40;
  void (**v41)(_QWORD, _QWORD);
  _QWORD v42[4];
  void ***v43;
  uint8_t buf[8];
  uint64_t v45;
  void (*v46)(uint64_t, uint64_t);
  void *v47;
  NetworkServiceProxyProvider *v48;
  id v49;

  v6 = a3;
  v7 = (uint64_t)a4;
  v10 = (void (**)(_QWORD, _QWORD))v7;
  if (v6 && (v11 = objc_opt_class(NSData), v7 = objc_opt_isKindOfClass(v6, v11), (v7 & 1) != 0))
  {
    isKindOfClass = objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v6, 0, 0, 0));
    v15 = (void *)isKindOfClass;
    if (isKindOfClass
      && (v16 = objc_opt_class(NSDictionary),
          isKindOfClass = objc_opt_isKindOfClass(v15, v16),
          (isKindOfClass & 1) != 0))
    {
      v37 = _NSConcreteStackBlock;
      v38 = 3221225472;
      v39 = sub_100008580;
      v40 = &unk_1000F54F0;
      v41 = v10;
      v17 = objc_retainBlock(&v37);
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("MessageType"), v37, v38, v39, v40));
      if (objc_msgSend(v18, "integerValue") == (id)1)
      {
        v19 = v17;
        if (self)
        {
          v20 = v15;
          v21 = NPGetInternalQueue(v20);
          v22 = objc_claimAutoreleasedReturnValue(v21);
          dispatch_assert_queue_V2(v22);

          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("Force")));
          v24 = objc_opt_class(NSNumber);
          if ((objc_opt_isKindOfClass(v23, v24) & 1) == 0)
          {

            v23 = 0;
          }
          objc_msgSend(v23, "BOOLValue");
          v42[0] = _NSConcreteStackBlock;
          v42[1] = 3221225472;
          v42[2] = sub_100008078;
          v42[3] = &unk_1000F54C8;
          v43 = v19;
          v25 = v42;
          v28 = nplog_obj(v25, v26, v27);
          v29 = objc_claimAutoreleasedReturnValue(v28);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Starting Tuscany refresh", buf, 2u);
          }

          v30 = objc_alloc_init((Class)NSMutableString);
          objc_setProperty_atomic(self, v31, v30, 48);

          *(_QWORD *)buf = _NSConcreteStackBlock;
          v45 = 3221225472;
          v46 = sub_100008124;
          v47 = &unk_1000F56A8;
          v32 = v25;
          v48 = self;
          v49 = v32;
          sub_100007BA0((uint64_t)self, buf);

        }
      }
      else
      {
        ((void (*)(void ***, _QWORD))v17[2])(v17, 0);
      }

    }
    else
    {
      v35 = nplog_obj(isKindOfClass, v13, v14);
      v36 = objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "Failed to convert a message to a dictionary", buf, 2u);
      }

      if (v10)
        v10[2](v10, 0);
    }

  }
  else
  {
    v33 = nplog_obj(v7, v8, v9);
    v34 = objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "Received invalid message", buf, 2u);
    }

    if (v10)
      v10[2](v10, 0);
  }

}

- (BOOL)handleNewFlow:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t isKindOfClass;
  char v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD block[5];

  v4 = a3;
  kdebug_trace(732954636, 0, 0, 0, 0);
  v5 = objc_opt_class(NEAppProxyTCPFlow);
  isKindOfClass = objc_opt_isKindOfClass(v4, v5);
  v7 = isKindOfClass;
  if ((isKindOfClass & 1) != 0)
  {
    if (self)
    {
      v8 = NPGetInternalQueue(isKindOfClass);
      v9 = objc_claimAutoreleasedReturnValue(v8);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000078C0;
      block[3] = &unk_1000F5450;
      block[4] = self;
      dispatch_async(v9, block);

    }
  }

  return v7 & 1;
}

- (BOOL)hasNetworkPath
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NetworkServiceProxyProvider defaultPath](self, "defaultPath"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NetworkServiceProxyProvider defaultPath](self, "defaultPath"));
    v5 = objc_msgSend(v4, "status") == (id)1;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)waldoGetCurrentConfiguration
{
  uint64_t v2;
  NSObject *v3;
  id v4;
  _QWORD *v5;
  void *v6;
  _QWORD *v7;

  v2 = NPGetInternalQueue(self);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  dispatch_assert_queue_V2(v3);

  v4 = sub_1000549E8();
  v5 = (_QWORD *)objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (v5)
    v5 = (_QWORD *)v5[5];
  v7 = v5;

  return v7;
}

- (void)waldoNeedsPolicyReset
{
  uint64_t v2;
  NSObject *v3;
  id v4;

  v2 = NPGetInternalQueue(self);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  dispatch_assert_queue_V2(v3);

  v4 = sub_1000549E8();
}

- (void)waldo:(id)a3 fetchDayPassForURL:(id)a4 ifExpired:(id)a5 session:(id)a6 dataHandler:(id)a7 completionHandler:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  id v23;

  v23 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = a8;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "delegate"));
  if (v17)
  {
    v18 = sub_1000549E8();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    v20 = (void *)v19;
    if (v19)
      v21 = *(void **)(v19 + 40);
    else
      v21 = 0;
    v22 = v21;
    objc_msgSend(v17, "setIgnoreInvalidCerts:", objc_msgSend(v22, "ignoreInvalidCerts"));

  }
  sub_1000087D8((uint64_t)self, v23, v13, v14, v15, v16);

}

- (void)waldoDidSaveToKeychain:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  id v5;
  id v6;

  v3 = NPGetInternalQueue(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  dispatch_assert_queue_V2(v4);

  v5 = sub_1000549E8();
  v6 = (id)objc_claimAutoreleasedReturnValue(v5);
  sub_100062748((uint64_t)v6);

}

- (void)waldo:(id)a3 didFinishProbingWithSuccess:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  _BOOL4 v17;

  v4 = a4;
  v5 = a3;
  v6 = NPGetInternalQueue(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  dispatch_assert_queue_V2(v7);

  v11 = nplog_obj(v8, v9, v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
    v14 = 138412546;
    v15 = v13;
    v16 = 1024;
    v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@: Probing finished with success: %d", (uint8_t *)&v14, 0x12u);

  }
}

- (void)waldo:(id)a3 didFinishSampleProbingWithSuccess:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  _BOOL4 v17;

  v4 = a4;
  v5 = a3;
  v6 = NPGetInternalQueue(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  dispatch_assert_queue_V2(v7);

  v11 = nplog_obj(v8, v9, v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
    v14 = 138412546;
    v15 = v13;
    v16 = 1024;
    v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@: One sample probing finished with success: %d", (uint8_t *)&v14, 0x12u);

  }
}

- (id)waldoRequiresTFO:(id)a3
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id obj;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v3 = a3;
  v4 = NPGetInternalQueue(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  dispatch_assert_queue_V2(v5);

  v6 = sub_1000549E8();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)v7;
  if (v7)
    v9 = *(void **)(v7 + 40);
  else
    v9 = 0;
  v10 = v9;

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "appRules"));
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v11)
  {
    v12 = v11;
    v22 = 0;
    v13 = *(_QWORD *)v24;
    while (1)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "getEdgeSetForAppRule:", v15));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "identifier"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));
        if ((objc_msgSend(v17, "isEqualToString:", v18) & 1) != 0)
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "requireTFO"));

          if (!v19)
            goto LABEL_13;
          v17 = v22;
          v22 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "requireTFO"));
        }
        else
        {

        }
LABEL_13:

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (!v12)
        goto LABEL_17;
    }
  }
  v22 = 0;
LABEL_17:

  return v22;
}

- (void)handleUsageReport:(id)a3 fromClient:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int v22;
  void *v23;
  unsigned int v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  unsigned int v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  int v38;
  id v39;
  __int16 v40;
  _BYTE v41[10];

  v6 = a3;
  v7 = a4;
  v8 = NPGetInternalQueue(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  dispatch_assert_queue_V2(v9);

  v10 = sub_1000549E8();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)v11;
  if (v11)
    v13 = *(void **)(v11 + 40);
  else
    v13 = 0;
  v14 = v13;

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "getEdgeSetForSigningIdentifier:", v7));
  v18 = v15;
  if (v15)
  {
    if (objc_msgSend(v15, "source") != (id)2)
    {
      v19 = objc_msgSend(v18, "hasEdges");
      if (!(_DWORD)v19
        || objc_msgSend(v6, "waldoTimestamp")
        && (v22 = objc_msgSend(v6, "waldoTimestamp"),
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "timestamp")),
            v24 = objc_msgSend(v23, "unsignedIntValue"),
            v23,
            v22 != v24))
      {
        v25 = nplog_obj(v19, v20, v21);
        v26 = objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "identifier"));
          v28 = objc_msgSend(v6, "waldoTimestamp");
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "timestamp"));
          v38 = 138412802;
          v39 = v27;
          v40 = 1024;
          *(_DWORD *)v41 = v28;
          *(_WORD *)&v41[4] = 1024;
          *(_DWORD *)&v41[6] = objc_msgSend(v29, "unsignedIntValue");
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%@: Refreshing Waldo because there are no edges or because the timestamp reported by the client (%u) is not equal to the current timestamp (%u)", (uint8_t *)&v38, 0x18u);

        }
        sub_100007BA0((uint64_t)self, 0);
      }
    }
    v30 = objc_msgSend(v18, "hasEdges");
    if ((_DWORD)v30)
    {
      v33 = nplog_obj(v30, v31, v32);
      v34 = objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "identifier"));
        v38 = 138412546;
        v39 = v35;
        v40 = 2112;
        *(_QWORD *)v41 = v7;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%@: Handling a usage report from %@", (uint8_t *)&v38, 0x16u);

      }
      objc_msgSend(v18, "handleUsageReport:", v6);
    }
  }
  else
  {
    v36 = nplog_obj(0, v16, v17);
    v37 = objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      v38 = 138412290;
      v39 = v7;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Failed to find an edge set for %@", (uint8_t *)&v38, 0xCu);
    }

  }
}

- (id)copyStateForClient:(id)a3 withPeerEndpoint:(id)a4 outWaldoInfo:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  unsigned __int8 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  void *v39;
  uint64_t v40;
  NSObject *v41;
  void *v42;
  unsigned int v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  BOOL v49;
  uint64_t v50;
  NSObject *v51;
  uint64_t v52;
  const char *v53;
  id v54;
  void *v55;
  id v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  NSObject *v63;
  _BOOL4 v64;
  void *v65;
  void *v66;
  NSObject *v67;
  void *v68;
  double v69;
  double v70;
  const __CFString *v71;
  void *v72;
  NSObject *v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  NSObject *v79;
  void *v80;
  id v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  NSObject *v88;
  id v89;
  NSString *v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  const void *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  const void *v102;
  uint64_t Property;
  NSObject *v104;
  uint64_t v105;
  double v106;
  void *v107;
  uint64_t v109;
  NSObject *v110;
  uint64_t v111;
  const char *v112;
  void *v113;
  uint64_t v114;
  void *v115;
  void *v116;
  void *v117;
  id *v118;
  NetworkServiceProxyProvider *selfa;
  void *v120;
  id v121;
  id v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  uint8_t v127[4];
  _BYTE v128[18];
  uint8_t buf[4];
  id v130;
  __int16 v131;
  void *v132;

  v8 = a4;
  v9 = a3;
  v10 = NPGetInternalQueue(v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  dispatch_assert_queue_V2(v11);

  v12 = sub_1000549E8();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)v13;
  v118 = a5;
  if (v13)
    v15 = *(void **)(v13 + 40);
  else
    v15 = 0;
  v16 = v15;

  v17 = objc_alloc_init((Class)NSMutableDictionary);
  v122 = objc_alloc_init((Class)NSMutableDictionary);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "getEdgeSetForSigningIdentifier:", v9));
  v19 = v9;
  v120 = v16;
  v121 = v17;
  selfa = self;
  if (self)
  {
    v20 = sub_1000549E8();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    v22 = (void *)v21;
    v23 = v8;
    if (v21)
      v24 = *(void **)(v21 + 40);
    else
      v24 = 0;
    v25 = v24;
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "appRules"));

    v125 = 0u;
    v126 = 0u;
    v123 = 0u;
    v124 = 0u;
    v27 = v26;
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v123, buf, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v124;
LABEL_8:
      v31 = 0;
      while (1)
      {
        if (*(_QWORD *)v124 != v30)
          objc_enumerationMutation(v27);
        v32 = *(void **)(*((_QWORD *)&v123 + 1) + 8 * v31);
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "matchSigningIdentifier"));
        v34 = objc_msgSend(v33, "isEqualToString:", v19);

        if ((v34 & 1) != 0)
          break;
        if (v29 == (id)++v31)
        {
          v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v123, buf, 16);
          if (v29)
            goto LABEL_8;
          goto LABEL_14;
        }
      }
      v38 = v32;

      if (!v38)
        goto LABEL_22;
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "locationBundlePath"));

      v8 = v23;
      if (v39)
      {
        v40 = nplog_obj(v35, v36, v37);
        v41 = objc_claimAutoreleasedReturnValue(v40);
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
        {
          v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "label"));
          v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "locationBundlePath"));
          *(_DWORD *)v127 = 138412546;
          *(_QWORD *)v128 = v115;
          *(_WORD *)&v128[8] = 2112;
          *(_QWORD *)&v128[10] = v116;
          _os_log_debug_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEBUG, "Checking if location services are enabled for %@ using bundle %@", v127, 0x16u);

        }
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "locationBundlePath"));
        v43 = +[CLLocationManager authorizationStatusForBundlePath:](CLLocationManager, "authorizationStatusForBundlePath:", v42);

        v47 = nplog_obj(v44, v45, v46);
        v48 = objc_claimAutoreleasedReturnValue(v47);
        v17 = v121;
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
        {
          v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "locationBundlePath"));
          *(_DWORD *)v127 = 67109378;
          *(_DWORD *)v128 = v43;
          *(_WORD *)&v128[4] = 2112;
          *(_QWORD *)&v128[6] = v117;
          _os_log_debug_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEBUG, "Got authorization status %d for bundle %@", v127, 0x12u);

        }
        v49 = v43 - 3 < 2;
        goto LABEL_26;
      }
    }
    else
    {
LABEL_14:

      v38 = 0;
LABEL_22:
      v8 = v23;
    }
    v50 = nplog_obj(v35, v36, v37);
    v51 = objc_claimAutoreleasedReturnValue(v50);
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v127 = 138412290;
      *(_QWORD *)v128 = v19;
      _os_log_debug_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEBUG, "App %@ does not have a location bundle path", v127, 0xCu);
    }

    v49 = 0;
    v17 = v121;
LABEL_26:
    v127[0] = v49;

    v52 = v127[0];
  }
  else
  {
    v52 = 0;
  }

  if (v18)
  {
    v54 = objc_msgSend(v18, "copyStateIncludeDistance:", v52);
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "edgeContainingOnRamp:", v8));
    if (v54)
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v54, CFSTR("edges"));
    v56 = objc_msgSend(v18, "copyEdgeSelectionTelemetry");
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v56, CFSTR("edgeSelection"));

    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "tag"));
    if (v57)
    {
      v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "tag"));
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v61, CFSTR("config"));

    }
    v62 = nplog_obj(v58, v59, v60);
    v63 = objc_claimAutoreleasedReturnValue(v62);
    v64 = os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG);
    if (!(_DWORD)v52)
    {
      if (v64)
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEBUG, "Not including location information in telemetry", buf, 2u);
      }
      goto LABEL_46;
    }
    if (v64)
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEBUG, "Including location information in telemetry", buf, 2u);
    }

    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "locationManager"));
    v63 = objc_msgSend(v65, "copyCurrentGeohash");

    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "locationManager"));
    v67 = objc_msgSend(v66, "copyCurrentGeohashFromServer");

    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "locationManager"));
    objc_msgSend(v68, "dislocation");
    v70 = v69;

    if (!v63 || v67)
    {
      if (!v67)
      {
LABEL_43:
        if (v70 > 0.0)
        {
          v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v70));
          objc_msgSend(v122, "setObject:forKeyedSubscript:", v74, CFSTR("dislocation"));

        }
LABEL_46:

        v78 = nplog_obj(v75, v76, v77);
        v79 = objc_claimAutoreleasedReturnValue(v78);
        if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
        {
          v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "label"));
          *(_DWORD *)buf = 138412546;
          v130 = v8;
          v131 = 2112;
          v132 = v113;
          _os_log_debug_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEBUG, "Mapped connection endpoint %@ to edge %@", buf, 0x16u);

        }
        v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "label"));
        v81 = objc_msgSend(v80, "length");

        if (v81)
        {
          v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "label"));
          objc_msgSend(v122, "setObject:forKeyedSubscript:", v82, CFSTR("peer"));

        }
        v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "telemetryURL"));

        if (v83)
        {
          v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "telemetryURL"));
          v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "host"));
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v85, CFSTR("host"));

        }
        *v118 = objc_retainAutorelease(v18);

        goto LABEL_53;
      }
      v71 = CFSTR("surfaced_at");
      v72 = v122;
      v73 = v67;
    }
    else
    {
      v71 = CFSTR("geohash");
      v72 = v122;
      v73 = v63;
    }
    objc_msgSend(v72, "setObject:forKeyedSubscript:", v73, v71);
    goto LABEL_43;
  }
LABEL_53:
  if (selfa)
    objc_getProperty(selfa, v53, 56, 1);
  v86 = nw_path_evaluator_copy_path();
  v87 = (void *)v86;
  if (!v86)
  {
    v88 = 0;
    goto LABEL_66;
  }
  v88 = nw_path_copy_interface(v86);
  if (!v88)
  {
LABEL_66:
    v92 = 0;
    goto LABEL_67;
  }
  v89 = +[NPUtilities interfaceTypeOfInterface:](NPUtilities, "interfaceTypeOfInterface:", v88);
  v90 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", nw_interface_get_name(v88));
  v91 = objc_claimAutoreleasedReturnValue(v90);
  v92 = (void *)v91;
  if (v89 == (id)1 && v91)
  {
    v93 = WiFiManagerClientCreate(kCFAllocatorDefault, 0);
    if (v93)
    {
      v96 = (const void *)v93;
      if (WiFiManagerClientGetDevice(v93, v92))
      {
        v99 = WiFiDeviceClientCopyCurrentNetwork();
        if (v99)
        {
          v102 = (const void *)v99;
          Property = WiFiNetworkGetProperty(v99, kWiFiScaledRSSIKey);
          v104 = objc_claimAutoreleasedReturnValue(Property);
          v105 = objc_opt_class(NSNumber);
          if ((objc_opt_isKindOfClass(v104, v105) & 1) != 0)
          {
            -[NSObject doubleValue](v104, "doubleValue");
            v107 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)(int)(v106 * 1000.0) / 1000.0));
            objc_msgSend(v122, "setObject:forKeyedSubscript:", v107, CFSTR("signal_wifi"));

          }
          CFRelease(v102);
          v17 = v121;
          goto LABEL_76;
        }
        v114 = nplog_obj(0, v100, v101);
        v104 = objc_claimAutoreleasedReturnValue(v114);
        if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v112 = "Failed to copy the current WiFi network";
          goto LABEL_75;
        }
      }
      else
      {
        v111 = nplog_obj(0, v97, v98);
        v104 = objc_claimAutoreleasedReturnValue(v111);
        if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v112 = "Failed to get the WiFi device";
LABEL_75:
          _os_log_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_DEFAULT, v112, buf, 2u);
        }
      }
LABEL_76:

      CFRelease(v96);
      goto LABEL_67;
    }
    v109 = nplog_obj(0, v94, v95);
    v110 = objc_claimAutoreleasedReturnValue(v109);
    if (os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v110, OS_LOG_TYPE_DEFAULT, "Failed to create a WiFi manager", buf, 2u);
    }

  }
LABEL_67:
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v122, CFSTR("connection"));

  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nwContextIdlnessCheckTimer, 0);
  objc_storeStrong((id *)&self->_sharedNetworkTransaction, 0);
  objc_storeStrong((id *)&self->_nwContext, 0);
  objc_storeStrong((id *)&self->_defaultEvaluator, 0);
  objc_storeStrong((id *)&self->_requestLog, 0);
  objc_storeStrong((id *)&self->_resurrectionTimer, 0);
  objc_storeStrong((id *)&self->_currentNetworkCharacteristics, 0);
  objc_storeStrong((id *)&self->_manager, 0);
}

@end
