@implementation CarDataClient

- (CarDataClient)initWithPluginID:(id)a3
{
  id v5;
  CarDataClient *v6;
  CarDataClient *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *transactions;
  NSMutableDictionary *v10;
  NSMutableDictionary *cachedValues;
  dispatch_queue_attr_t v12;
  NSObject *v13;
  dispatch_queue_attr_t v14;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *processingQueue;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CarDataClient;
  v6 = -[CarDataClient init](&v19, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_pluginID, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    transactions = v7->_transactions;
    v7->_transactions = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    cachedValues = v7->_cachedValues;
    v7->_cachedValues = v10;

    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    v14 = dispatch_queue_attr_make_with_qos_class(v13, QOS_CLASS_DEFAULT, 0);
    v15 = objc_claimAutoreleasedReturnValue(v14);

    v16 = dispatch_queue_create("com.apple.caraccessoryd.CarDataClient.Processing", v15);
    processingQueue = v7->_processingQueue;
    v7->_processingQueue = (OS_dispatch_queue *)v16;

  }
  return v7;
}

- (void)sendCommand:(id)a3 errors:(id)a4 transactionID:(id)a5 priority:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = CAFDClientLogging();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarDataClient pluginID](self, "pluginID"));
    *(_DWORD *)buf = 138413314;
    v18 = v16;
    v19 = 2112;
    v20 = v10;
    v21 = 2112;
    v22 = v12;
    v23 = 2112;
    v24 = v13;
    v25 = 2048;
    v26 = objc_msgSend(v11, "count");
    _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Send pluginID: %@ command: %@ transactionID: %@ with priority: %@ errors with %ld entries", buf, 0x34u);

  }
  -[CarDataClient sendCommand:values:errors:error:transactionID:priority:withResponse:](self, "sendCommand:values:errors:error:transactionID:priority:withResponse:", v10, 0, v11, 0, v12, v13, 0);

}

- (void)sendCommand:(id)a3 error:(id)a4 transactionID:(id)a5 priority:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = CAFDClientLogging();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarDataClient pluginID](self, "pluginID"));
    *(_DWORD *)buf = 138413314;
    v18 = v16;
    v19 = 2112;
    v20 = v10;
    v21 = 2112;
    v22 = v12;
    v23 = 2112;
    v24 = v13;
    v25 = 2112;
    v26 = v11;
    _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Send pluginID: %@ command: %@ transactionID: %@ with priority: %@ error: %@", buf, 0x34u);

  }
  -[CarDataClient sendCommand:values:errors:error:transactionID:priority:withResponse:](self, "sendCommand:values:errors:error:transactionID:priority:withResponse:", v10, 0, 0, v11, v12, v13, 0);

}

- (void)sendCommand:(id)a3 values:(id)a4 transactionID:(id)a5 priority:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  NSObject *v20;
  uint32_t v21;
  uint64_t v22;
  char isKindOfClass;
  uint64_t v24;
  _BOOL4 v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v11)
  {
    v14 = objc_opt_class(NSArray);
    if ((objc_opt_isKindOfClass(v11, v14) & 1) != 0)
    {
      v15 = CAFDClientLogging();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[CarDataClient pluginID](self, "pluginID"));
        *(_DWORD *)buf = 138413314;
        v27 = v17;
        v28 = 2112;
        v29 = v10;
        v30 = 2112;
        v31 = v12;
        v32 = 2112;
        v33 = v13;
        v34 = 2048;
        v35 = objc_msgSend(v11, "count");
        v18 = "Send pluginID: %@ command: %@ transactionID: %@ with priority: %@ values array with %ld entries";
LABEL_12:
        v20 = v16;
        v21 = 52;
        goto LABEL_13;
      }
    }
    else
    {
      v22 = objc_opt_class(NSDictionary);
      isKindOfClass = objc_opt_isKindOfClass(v11, v22);
      v24 = CAFDClientLogging();
      v16 = objc_claimAutoreleasedReturnValue(v24);
      v25 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);
      if ((isKindOfClass & 1) != 0)
      {
        if (v25)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[CarDataClient pluginID](self, "pluginID"));
          *(_DWORD *)buf = 138413314;
          v27 = v17;
          v28 = 2112;
          v29 = v10;
          v30 = 2112;
          v31 = v12;
          v32 = 2112;
          v33 = v13;
          v34 = 2048;
          v35 = objc_msgSend(v11, "count");
          v18 = "Send pluginID: %@ command: %@ transactionID: %@ with priority: %@ values dictionary with %ld entries";
          goto LABEL_12;
        }
      }
      else if (v25)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[CarDataClient pluginID](self, "pluginID"));
        *(_DWORD *)buf = 138413314;
        v27 = v17;
        v28 = 2112;
        v29 = v10;
        v30 = 2112;
        v31 = v12;
        v32 = 2112;
        v33 = v13;
        v34 = 2112;
        v35 = v11;
        v18 = "Send pluginID: %@ command: %@ transactionID: %@ with priority: %@ values: %@";
        goto LABEL_12;
      }
    }
  }
  else
  {
    v19 = CAFDClientLogging();
    v16 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[CarDataClient pluginID](self, "pluginID"));
      *(_DWORD *)buf = 138413058;
      v27 = v17;
      v28 = 2112;
      v29 = v10;
      v30 = 2112;
      v31 = v12;
      v32 = 2112;
      v33 = v13;
      v18 = "Send pluginID: %@ command: %@ transactionID: %@ with priority: %@ without values";
      v20 = v16;
      v21 = 42;
LABEL_13:
      _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, v18, buf, v21);

    }
  }

  -[CarDataClient sendCommand:values:errors:error:transactionID:priority:withResponse:](self, "sendCommand:values:errors:error:transactionID:priority:withResponse:", v10, v11, 0, 0, v12, v13, 0);
}

- (void)sendCommand:(id)a3 values:(id)a4 priority:(id)a5 withResponse:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  id v20;
  const char *v21;
  uint64_t v22;
  NSObject *v23;
  uint32_t v24;
  uint64_t v25;
  char isKindOfClass;
  uint64_t v27;
  _BOOL4 v28;
  id v29;
  uint64_t v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  NSObject *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v30 = 0;
  if (!RandomBytes(&v30, 8))
  {
    v15 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v30));
    if (v11)
    {
      v16 = objc_opt_class(NSArray);
      if ((objc_opt_isKindOfClass(v11, v16) & 1) != 0)
      {
        v17 = CAFDClientLogging();
        v18 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[CarDataClient pluginID](self, "pluginID"));
          v20 = objc_msgSend(v11, "count");
          *(_DWORD *)buf = 138413314;
          v32 = v19;
          v33 = 2112;
          v34 = v10;
          v35 = 2112;
          v36 = v15;
          v37 = 2112;
          v38 = v12;
          v39 = 2048;
          v40 = v20;
          v21 = "Send pluginID: %@ command: %@ transactionID: %@ with priority: %@ values array with %ld entries";
LABEL_15:
          v23 = v18;
          v24 = 52;
          goto LABEL_16;
        }
      }
      else
      {
        v25 = objc_opt_class(NSDictionary);
        isKindOfClass = objc_opt_isKindOfClass(v11, v25);
        v27 = CAFDClientLogging();
        v18 = objc_claimAutoreleasedReturnValue(v27);
        v28 = os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG);
        if ((isKindOfClass & 1) != 0)
        {
          if (v28)
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue(-[CarDataClient pluginID](self, "pluginID"));
            v29 = objc_msgSend(v11, "count");
            *(_DWORD *)buf = 138413314;
            v32 = v19;
            v33 = 2112;
            v34 = v10;
            v35 = 2112;
            v36 = v15;
            v37 = 2112;
            v38 = v12;
            v39 = 2048;
            v40 = v29;
            v21 = "Send pluginID: %@ command: %@ transactionID: %@ with priority: %@ values dictionary with %ld entries";
            goto LABEL_15;
          }
        }
        else if (v28)
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[CarDataClient pluginID](self, "pluginID"));
          *(_DWORD *)buf = 138413314;
          v32 = v19;
          v33 = 2112;
          v34 = v10;
          v35 = 2112;
          v36 = v15;
          v37 = 2112;
          v38 = v12;
          v39 = 2112;
          v40 = v11;
          v21 = "Send pluginID: %@ command: %@ transactionID: %@ with priority: %@ values: %@";
          goto LABEL_15;
        }
      }
    }
    else
    {
      v22 = CAFDClientLogging();
      v18 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[CarDataClient pluginID](self, "pluginID"));
        *(_DWORD *)buf = 138413058;
        v32 = v19;
        v33 = 2112;
        v34 = v10;
        v35 = 2112;
        v36 = v15;
        v37 = 2112;
        v38 = v12;
        v21 = "Send pluginID: %@ command: %@ transactionID: %@ with priority: %@ without values";
        v23 = v18;
        v24 = 42;
LABEL_16:
        _os_log_debug_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, v21, buf, v24);

      }
    }

    -[CarDataClient sendCommand:values:errors:error:transactionID:priority:withResponse:](self, "sendCommand:values:errors:error:transactionID:priority:withResponse:", v10, v11, 0, 0, v15, v12, v13);
    goto LABEL_18;
  }
  v14 = CAFDClientLogging();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    -[CarDataClient sendCommand:values:priority:withResponse:].cold.1();
LABEL_18:

}

- (void)sendCommand:(id)a3 values:(id)a4 errors:(id)a5 error:(id)a6 transactionID:(id)a7 priority:(id)a8 withResponse:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  CarDataClient *v36;
  id v37;
  id v38;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = objc_claimAutoreleasedReturnValue(-[CarDataClient processingQueue](self, "processingQueue"));
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = __85__CarDataClient_sendCommand_values_errors_error_transactionID_priority_withResponse___block_invoke;
  v30[3] = &unk_100031008;
  v31 = v15;
  v32 = v19;
  v33 = v16;
  v34 = v17;
  v35 = v18;
  v36 = self;
  v37 = v20;
  v38 = v21;
  v23 = v21;
  v24 = v20;
  v25 = v18;
  v26 = v17;
  v27 = v16;
  v28 = v19;
  v29 = v15;
  dispatch_async(v22, v30);

}

void __85__CarDataClient_sendCommand_values_errors_error_transactionID_priority_withResponse___block_invoke(uint64_t a1)
{
  NSMutableDictionary *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD v36[5];
  id v37;
  id v38;
  id v39;
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  id v48;

  v2 = objc_opt_new(NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), kCarDataProtocolKeyCommand);
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v3, kCarDataProtocolKeyTransactionID);
  v4 = *(_QWORD *)(a1 + 48);
  if (v4)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v4, kCarDataProtocolKeyValues);
  v5 = *(_QWORD *)(a1 + 56);
  if (v5)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v5, kCarDataProtocolKeyErrors);
  v6 = *(void **)(a1 + 64);
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v6, "code")));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v7, kCarDataProtocolKeyError);

  }
  v40 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSData CAF_encodeCarDataFrom:error:](NSData, "CAF_encodeCarDataFrom:error:", v2, &v40));
  v9 = v40;
  if (v9)
  {
    v10 = CAFDClientLogging();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 72), "pluginID"));
      v31 = *(_QWORD *)(a1 + 40);
      v32 = *(_QWORD *)(a1 + 80);
      *(_DWORD *)buf = 138413058;
      v42 = v30;
      v43 = 2112;
      v44 = v31;
      v45 = 2112;
      v46 = v32;
      v47 = 2112;
      v48 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Unable to serialize command for pluginID: %@ transactionID: %@ with priority: %@ with error: %@", buf, 0x2Au);

    }
    v12 = *(_QWORD *)(a1 + 88);
    if (v12)
    {
      v13 = objc_msgSend(objc_alloc((Class)CAFResponse), "initWithError:", v9);
      (*(void (**)(uint64_t, id))(v12 + 16))(v12, v13);

    }
  }
  else if (v8)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 72), "clientDelegate"));

    if (!v14)
    {
      v15 = CAFDClientLogging();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 72), "pluginID"));
        v34 = *(_QWORD *)(a1 + 40);
        v35 = *(_QWORD *)(a1 + 80);
        *(_DWORD *)buf = 138412802;
        v42 = v33;
        v43 = 2112;
        v44 = v34;
        v45 = 2112;
        v46 = v35;
        _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Client delegate for pluginID: %@ transactionID: %@ with priority: %@ missing", buf, 0x20u);

      }
      v17 = *(_QWORD *)(a1 + 88);
      if (v17)
      {
        v18 = objc_alloc((Class)CAFResponse);
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.caraccessoryframework.cardata"), 3, 0));
        v20 = objc_msgSend(v18, "initWithError:", v19);
        (*(void (**)(uint64_t, id))(v17 + 16))(v17, v20);

      }
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 72), "clientDelegate"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 72), "pluginID"));
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = __85__CarDataClient_sendCommand_values_errors_error_transactionID_priority_withResponse___block_invoke_22;
    v36[3] = &unk_100030FE0;
    v23 = *(_QWORD *)(a1 + 80);
    v36[4] = *(_QWORD *)(a1 + 72);
    v37 = *(id *)(a1 + 40);
    v38 = *(id *)(a1 + 80);
    v39 = *(id *)(a1 + 88);
    objc_msgSend(v21, "sendToPluginID:payload:priority:completion:", v22, v8, v23, v36);

  }
  else
  {
    v24 = CAFDClientLogging();
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      __85__CarDataClient_sendCommand_values_errors_error_transactionID_priority_withResponse___block_invoke_cold_1();

    v26 = *(_QWORD *)(a1 + 88);
    if (v26)
    {
      v27 = objc_alloc((Class)CAFResponse);
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.caraccessoryframework.cardata"), 3, 0));
      v29 = objc_msgSend(v27, "initWithError:", v28);
      (*(void (**)(uint64_t, id))(v26 + 16))(v26, v29);

    }
  }

}

void __85__CarDataClient_sendCommand_values_errors_error_transactionID_priority_withResponse___block_invoke_22(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;

  v3 = a2;
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "processingQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __85__CarDataClient_sendCommand_values_errors_error_transactionID_priority_withResponse___block_invoke_2;
  block[3] = &unk_100030D60;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v9 = v3;
  v10 = v5;
  v11 = v6;
  v12 = *(id *)(a1 + 48);
  v13 = *(id *)(a1 + 56);
  v7 = v3;
  dispatch_async(v4, block);

}

void __85__CarDataClient_sendCommand_values_errors_error_transactionID_priority_withResponse___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  if (*(_QWORD *)(a1 + 32))
  {
    v2 = CAFDClientLogging();
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __85__CarDataClient_sendCommand_values_errors_error_transactionID_priority_withResponse___block_invoke_2_cold_1(a1);

    v4 = *(_QWORD *)(a1 + 64);
    if (v4)
    {
      v5 = objc_msgSend(objc_alloc((Class)CAFResponse), "initWithError:", *(_QWORD *)(a1 + 32));
      (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);

    }
  }
  else
  {
    v6 = *(void **)(a1 + 64);
    if (v6)
    {
      v8 = objc_retainBlock(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "transactions"));
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, *(_QWORD *)(a1 + 48));

    }
  }
}

- (id)parseValues:(id)a3 errors:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  id v16;

  v6 = a4;
  v7 = a3;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __36__CarDataClient_parseValues_errors___block_invoke;
  v15[3] = &unk_100031030;
  v15[4] = self;
  v8 = objc_alloc_init((Class)NSMutableDictionary);
  v16 = v8;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v15);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __36__CarDataClient_parseValues_errors___block_invoke_28;
  v13[3] = &unk_100031030;
  v13[4] = self;
  v9 = v8;
  v14 = v9;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v13);

  v10 = v14;
  v11 = v9;

  return v11;
}

void __36__CarDataClient_parseValues_errors___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;

  v5 = a2;
  v6 = a3;
  v7 = objc_opt_class(NSNumber);
  v8 = v5;
  v9 = v8;
  if (v8 && (objc_opt_isKindOfClass(v8, v7) & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    if (objc_msgSend(v6, "isEqual:", v10))
      v11 = 0;
    else
      v11 = v6;
    v12 = v11;

    v13 = objc_msgSend(objc_alloc((Class)CAFCharacteristicValue), "initWithValue:error:", v12, 0);
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v13, v9);

    v14 = v9;
  }
  else
  {

    v16 = CAFDLogging(v15);
    v14 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      __36__CarDataClient_parseValues_errors___block_invoke_cold_1();
  }

}

void __36__CarDataClient_parseValues_errors___block_invoke_28(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  id v23;
  void *v24;
  NSObject *v25;
  void *v26;
  int v27;
  void *v28;
  __int16 v29;
  NSObject *v30;
  __int16 v31;
  NSObject *v32;

  v5 = a2;
  v6 = a3;
  v7 = objc_opt_class(NSNumber);
  v8 = v5;
  v9 = v8;
  if (v8 && (objc_opt_isKindOfClass(v8, v7) & 1) != 0)
  {
    v10 = objc_opt_class(NSNumber);
    v11 = v6;
    v12 = v11;
    if (v11 && (objc_opt_isKindOfClass(v11, v10) & 1) != 0)
    {
      v13 = -[NSObject integerValue](v12, "integerValue");
      if (v13)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, v13, 0));
        v15 = CAFDLogging(v14);
        v16 = objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "pluginID"));
          v27 = 138412802;
          v28 = v26;
          v29 = 2112;
          v30 = v9;
          v31 = 2112;
          v32 = v12;
          _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Received characteristic value from pluginID: %@ instanceID: %@ with error %@", (uint8_t *)&v27, 0x20u);

        }
      }
      else
      {
        v14 = 0;
      }
      v23 = objc_msgSend(objc_alloc((Class)CAFCharacteristicValue), "initWithValue:error:", 0, v14);
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v23, v9);

    }
    else
    {

      v21 = CAFDLogging(v20);
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "pluginID"));
        v27 = 138412802;
        v28 = v24;
        v29 = 2112;
        v30 = v9;
        v31 = 2112;
        v32 = objc_opt_class(v12);
        v25 = v32;
        _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Parsing characteristic value from pluginID: %@ instanceID: %@ failed with wrong error data type %@", (uint8_t *)&v27, 0x20u);

      }
      v12 = v22;
    }

    v19 = v9;
  }
  else
  {

    v18 = CAFDLogging(v17);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      __36__CarDataClient_parseValues_errors___block_invoke_cold_1();
  }

}

- (void)cacheValues:(id)a3
{
  _QWORD v3[5];

  if (self->_cachedValues)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = __29__CarDataClient_cacheValues___block_invoke;
    v3[3] = &unk_100031058;
    v3[4] = self;
    objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v3);
  }
}

void __29__CarDataClient_cacheValues___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v5 = *(void **)(a1 + 32);
  v6 = a2;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cachedValues"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v6));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "value"));
    objc_msgSend(v8, "setValue:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "error"));
    objc_msgSend(v8, "setError:", v10);

  }
}

- (void)addRegistrationFromCache:(id)a3 priority:(id)a4 withResponse:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_claimAutoreleasedReturnValue(-[CarDataClient processingQueue](self, "processingQueue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __64__CarDataClient_addRegistrationFromCache_priority_withResponse___block_invoke;
  v15[3] = &unk_100030F50;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

void __64__CarDataClient_addRegistrationFromCache_priority_withResponse___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "cachedValues"));
  if (v2
    && (v3 = (void *)v2,
        v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "clientDelegate")),
        v4,
        v3,
        v4))
  {
    v5 = objc_alloc_init((Class)NSMutableArray);
    v6 = objc_alloc_init((Class)NSMutableDictionary);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = __64__CarDataClient_addRegistrationFromCache_priority_withResponse___block_invoke_2;
    v24[3] = &unk_100031080;
    v7 = *(void **)(a1 + 40);
    v24[4] = *(_QWORD *)(a1 + 32);
    v8 = v6;
    v25 = v8;
    v9 = v5;
    v26 = v9;
    v10 = CAFDClientLogging(objc_msgSend(v7, "enumerateObjectsUsingBlock:", v24));
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "pluginID"));
      v18 = objc_msgSend(*(id *)(a1 + 40), "count");
      v19 = objc_msgSend(v8, "count");
      v20 = objc_msgSend(v9, "count");
      *(_DWORD *)buf = 138413058;
      v28 = v17;
      v29 = 2048;
      v30 = v18;
      v31 = 2048;
      v32 = v19;
      v33 = 2048;
      v34 = v20;
      _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Add registration from cache pluginID: %@ total: %ld cached: %ld missing: %ld", buf, 0x2Au);

    }
    v12 = *(_QWORD *)(a1 + 56);
    if (v12)
    {
      v13 = objc_msgSend(objc_alloc((Class)CAFResponse), "initWithValues:", v8);
      (*(void (**)(uint64_t, id))(v12 + 16))(v12, v13);

    }
    v14 = objc_msgSend(v9, "count");
    if (v14)
    {
      v15 = CAFDClientLogging(v14);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "pluginID"));
        v22 = objc_msgSend(v9, "count");
        v23 = *(void **)(a1 + 48);
        *(_DWORD *)buf = 138412802;
        v28 = v21;
        v29 = 2048;
        v30 = v22;
        v31 = 2112;
        v32 = v23;
        _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Add registration pluginID: %@ instanceID count: %ld with priority: %@", buf, 0x20u);

      }
      objc_msgSend(*(id *)(a1 + 32), "sendCommand:values:priority:withResponse:", kCarDataProtocolCmdKeyRegisterRequest, v9, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "sendCommand:values:priority:withResponse:", kCarDataProtocolCmdKeyRegisterRequest, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
}

void __64__CarDataClient_addRegistrationFromCache_priority_withResponse___block_invoke_2(id *a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "cachedValues"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v8));

  if (v4)
  {
    objc_msgSend(a1[5], "setObject:forKeyedSubscript:", v4, v8);
  }
  else
  {
    v5 = objc_msgSend(objc_alloc((Class)CAFCharacteristicValue), "initWithValue:error:", 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "cachedValues"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v8);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    objc_msgSend(a1[5], "setObject:forKeyedSubscript:", v7, v8);

    objc_msgSend(a1[6], "addObject:", v8);
  }

}

- (void)removeRegistrationFromCache:(id)a3 priority:(id)a4 withResponse:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_claimAutoreleasedReturnValue(-[CarDataClient processingQueue](self, "processingQueue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __67__CarDataClient_removeRegistrationFromCache_priority_withResponse___block_invoke;
  v15[3] = &unk_100030F50;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

void __67__CarDataClient_removeRegistrationFromCache_priority_withResponse___block_invoke(uint64_t a1)
{
  id *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  uint64_t v24;

  v2 = (id *)(a1 + 32);
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "cachedValues"));
  if (v3
    && (v4 = (void *)v3,
        v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v2, "clientDelegate")),
        v5,
        v4,
        v5))
  {
    v7 = CAFDClientLogging(v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __67__CarDataClient_removeRegistrationFromCache_priority_withResponse___block_invoke_cold_1();

    v9 = *(void **)(a1 + 40);
    if (v9 && (v10 = objc_msgSend(v9, "count")) != 0)
    {
      v11 = CAFDClientLogging(v10);
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "pluginID"));
        v17 = objc_msgSend(*(id *)(a1 + 40), "count");
        v18 = *(_QWORD *)(a1 + 48);
        v19 = 138412802;
        v20 = v16;
        v21 = 2048;
        v22 = v17;
        v23 = 2112;
        v24 = v18;
        _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Remove registration pluginID: %@ instanceID count: %ld with priority: %@", (uint8_t *)&v19, 0x20u);

      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "cachedValues"));
      objc_msgSend(v13, "removeObjectsForKeys:", *(_QWORD *)(a1 + 40));

      objc_msgSend(*(id *)(a1 + 32), "sendCommand:values:priority:withResponse:", kCarDataProtocolCmdKeyUnregisterRequest, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    }
    else
    {
      v14 = *(_QWORD *)(a1 + 56);
      if (v14)
      {
        v15 = objc_msgSend(objc_alloc((Class)CAFResponse), "initWithValuesAndError:error:", 0, 0);
        (*(void (**)(uint64_t, id))(v14 + 16))(v14, v15);

      }
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "sendCommand:values:priority:withResponse:", kCarDataProtocolCmdKeyUnregisterRequest, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
}

- (void)readFromCache:(id)a3 priority:(id)a4 withResponse:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_claimAutoreleasedReturnValue(-[CarDataClient processingQueue](self, "processingQueue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __53__CarDataClient_readFromCache_priority_withResponse___block_invoke;
  v15[3] = &unk_100030F50;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

void __53__CarDataClient_readFromCache_priority_withResponse___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "cachedValues"));
  if (v2
    && (v3 = (void *)v2,
        v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "clientDelegate")),
        v4,
        v3,
        v4))
  {
    v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithArray:", *(_QWORD *)(a1 + 40));
    v6 = objc_alloc_init((Class)NSMutableDictionary);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = __53__CarDataClient_readFromCache_priority_withResponse___block_invoke_2;
    v24[3] = &unk_100031080;
    v7 = *(void **)(a1 + 40);
    v24[4] = *(_QWORD *)(a1 + 32);
    v8 = v6;
    v25 = v8;
    v9 = v5;
    v26 = v9;
    v10 = CAFDClientLogging(objc_msgSend(v7, "enumerateObjectsUsingBlock:", v24));
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "pluginID"));
      v18 = objc_msgSend(*(id *)(a1 + 40), "count");
      v19 = objc_msgSend(v8, "count");
      v20 = objc_msgSend(v9, "count");
      *(_DWORD *)buf = 138413058;
      v28 = v17;
      v29 = 2048;
      v30 = v18;
      v31 = 2048;
      v32 = v19;
      v33 = 2048;
      v34 = v20;
      _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Read values pluginID: %@ total: %ld from cache: %ld missing: %ld", buf, 0x2Au);

    }
    v12 = objc_msgSend(v8, "count");
    if (v12)
    {
      v13 = CAFDClientLogging(v12);
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "pluginID"));
        v22 = objc_msgSend(*(id *)(a1 + 40), "count");
        v23 = *(void **)(a1 + 48);
        *(_DWORD *)buf = 138412802;
        v28 = v21;
        v29 = 2048;
        v30 = v22;
        v31 = 2112;
        v32 = v23;
        _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Read values pluginID: %@ instanceID count: %ld with priority: %@", buf, 0x20u);

      }
      v15 = *(_QWORD *)(a1 + 56);
      if (v15)
      {
        v16 = objc_msgSend(objc_alloc((Class)CAFResponse), "initWithValues:", v8);
        (*(void (**)(uint64_t, id))(v15 + 16))(v15, v16);

      }
    }
    if (objc_msgSend(v9, "count"))
      objc_msgSend(*(id *)(a1 + 32), "sendCommand:values:priority:withResponse:", kCarDataProtocolCmdKeyReadRequest, v9, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "sendCommand:values:priority:withResponse:", kCarDataProtocolCmdKeyReadRequest, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
}

void __53__CarDataClient_readFromCache_priority_withResponse___block_invoke_2(id *a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "cachedValues"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v5));

  if (v4)
  {
    objc_msgSend(a1[5], "setObject:forKeyedSubscript:", v4, v5);
    objc_msgSend(a1[6], "removeObject:", v5);
  }

}

- (int64_t)handleCommand:(id)a3 transactionID:(id)a4 values:(id)a5 errors:(id)a6 priority:(unint64_t)a7
{
  os_signpost_id_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  os_signpost_id_t v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  uint64_t isKindOfClass;
  char v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  CarDataClient *v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  id v37;
  id WeakRetained;
  id v39;
  void *v40;
  int64_t v41;
  void *v42;
  void *v43;
  id v44;
  const char *v45;
  id v46;
  uint64_t v47;
  NSObject *v48;
  void *v49;
  void (**v50)(_QWORD, _QWORD);
  id v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  NSObject *v58;
  uint64_t v59;
  NSObject *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  NSObject *v64;
  uint64_t v65;
  void *v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  NSObject *v71;
  uint64_t v72;
  NSObject *v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  NSObject *v77;
  CarDataClient *v78;
  id v79;
  uint64_t v80;
  void *v81;
  id v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  NSObject *v88;
  uint64_t v89;
  NSObject *v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  NSObject *v94;
  void *v95;
  void (**v96)(_QWORD, _QWORD);
  id v97;
  uint64_t v98;
  NSObject *v99;
  id v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  NSObject *v104;
  uint64_t v105;
  NSObject *v106;
  void *v107;
  uint64_t v108;
  uint64_t v109;
  NSObject *v110;
  id v111;
  void *v112;
  id v113;
  uint64_t v114;
  void *v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  uint64_t v119;
  void *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  NSObject *v124;
  uint64_t v125;
  NSObject *v126;
  void *v127;
  uint64_t v128;
  uint64_t v129;
  NSObject *v130;
  void *v131;
  id v132;
  id v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  char v137;
  uint64_t v138;
  NSObject *v139;
  id v140;
  void *v141;
  uint64_t v142;
  void *v143;
  uint64_t v144;
  uint64_t v145;
  NSObject *v146;
  void *v147;
  void *v148;
  uint64_t v149;
  void *v150;
  uint64_t v151;
  void *v152;
  id v153;
  uint64_t v154;
  uint64_t v155;
  char v156;
  uint64_t v157;
  NSObject *v158;
  id v159;
  void *v160;
  id v161;
  id v162;
  void *v163;
  uint64_t v164;
  void *v165;
  void *v166;
  id v167;
  void *v169;
  id v170;
  id v171;
  void *v172;
  id v173;
  void *v174;
  void *v175;
  id v176;
  void *v177;
  id v178;
  void *v179;
  _QWORD v180[5];
  _QWORD v181[5];
  id v182;
  unint64_t v183;
  uint8_t buf[4];
  id v185;
  __int16 v186;
  id v187;
  __int16 v188;
  id v189;
  __int16 v190;
  id v191;

  v12 = 0xEEEEB0B5B2B2EEEELL;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = CARSignpostLogForCategory(1);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  v19 = 0xEEEEB0B5B2B2EEEELL;
  if (!self
    || (v20 = CARSignpostLogForCategory(1),
        v21 = objc_claimAutoreleasedReturnValue(v20),
        v19 = os_signpost_id_make_with_pointer(v21, self),
        v21,
        v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL))
  {
    if (os_signpost_enabled(v18))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[CarDataClient pluginID](self, "pluginID"));
      *(_DWORD *)buf = 138543874;
      v185 = v13;
      v186 = 2114;
      v187 = v22;
      v188 = 2112;
      v189 = v14;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_EVENT, v19, "CAFd-RecieveCommand", "%{public}@ plugin: %{public}@ transactionID: %@", buf, 0x20u);

    }
  }

  if (objc_msgSend(v13, "isEqualToString:", kCarDataProtocolCmdKeyUpdateNotify))
  {
    v23 = objc_opt_class(NSDictionary);
    isKindOfClass = objc_opt_isKindOfClass(v15, v23);
    v25 = isKindOfClass;
    v26 = CAFDClientLogging(isKindOfClass);
    v27 = objc_claimAutoreleasedReturnValue(v26);
    v28 = v27;
    if ((v25 & 1) != 0)
    {
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        v112 = (void *)objc_claimAutoreleasedReturnValue(-[CarDataClient pluginID](self, "pluginID"));
        v113 = objc_msgSend(v15, "count");
        *(_DWORD *)buf = 138412802;
        v185 = v112;
        v186 = 2112;
        v187 = v14;
        v188 = 2048;
        v189 = v113;
        _os_log_debug_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "Received pluginID: %@ transactionID: %@ update values count: %lu", buf, 0x20u);

      }
      v29 = self;
      v30 = v15;
      v31 = 0;
LABEL_18:
      v37 = (id)objc_claimAutoreleasedReturnValue(-[CarDataClient parseValues:errors:](v29, "parseValues:errors:", v30, v31));
      -[CarDataClient cacheValues:](self, "cacheValues:", v37);
      WeakRetained = objc_loadWeakRetained((id *)&self->clientDelegate);

      if (!WeakRetained)
      {
LABEL_21:

LABEL_22:
        v41 = 0;
        goto LABEL_142;
      }
      v39 = objc_loadWeakRetained((id *)&self->clientDelegate);
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[CarDataClient pluginID](self, "pluginID"));
      objc_msgSend(v39, "didReceiveUpdateFromPluginID:values:", v40, v37);

LABEL_20:
      goto LABEL_21;
    }
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[CarDataClient pluginID](self, "pluginID"));
      v43 = (void *)objc_opt_class(v15);
      *(_DWORD *)buf = 138412802;
      v185 = v42;
      v186 = 2112;
      v187 = v14;
      v188 = 2112;
      v189 = v43;
      v44 = v43;
      v45 = "Error pluginID: %@ transactionID: %@ wrong update data type %@";
LABEL_60:
      _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, v45, buf, 0x20u);

      goto LABEL_141;
    }
    goto LABEL_141;
  }
  v32 = (uint64_t)objc_msgSend(v13, "isEqualToString:", kCarDataProtocolCmdKeyRegisterResponse);
  if ((_DWORD)v32)
  {
    if (v15
      && (v33 = objc_opt_class(NSDictionary), v32 = objc_opt_isKindOfClass(v15, v33), (v32 & 1) == 0))
    {
      v65 = CAFDClientLogging(v32);
      v28 = objc_claimAutoreleasedReturnValue(v65);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v42 = (void *)objc_claimAutoreleasedReturnValue(-[CarDataClient pluginID](self, "pluginID"));
        v66 = (void *)objc_opt_class(v15);
        *(_DWORD *)buf = 138412802;
        v185 = v42;
        v186 = 2112;
        v187 = v14;
        v188 = 2112;
        v189 = v66;
        v44 = v66;
        v45 = "Error pluginID: %@ transactionID: %@ wrong register repsonse values type %@";
        goto LABEL_60;
      }
    }
    else
    {
      if (!v16
        || (v34 = objc_opt_class(NSDictionary), v32 = objc_opt_isKindOfClass(v16, v34), (v32 & 1) != 0))
      {
        v35 = CAFDClientLogging(v32);
        v36 = objc_claimAutoreleasedReturnValue(v35);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        {
          v131 = (void *)objc_claimAutoreleasedReturnValue(-[CarDataClient pluginID](self, "pluginID"));
          v132 = objc_msgSend(v15, "count");
          v133 = objc_msgSend(v16, "count");
          *(_DWORD *)buf = 138413058;
          v185 = v131;
          v186 = 2112;
          v187 = v14;
          v188 = 2048;
          v189 = v132;
          v190 = 2048;
          v191 = v133;
          _os_log_debug_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEBUG, "Received pluginID: %@ transactionID: %@ register response values count: %ld errors count: %ld", buf, 0x2Au);

        }
        v29 = self;
        v30 = v15;
        v31 = v16;
        goto LABEL_18;
      }
      v80 = CAFDClientLogging(v32);
      v28 = objc_claimAutoreleasedReturnValue(v80);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v42 = (void *)objc_claimAutoreleasedReturnValue(-[CarDataClient pluginID](self, "pluginID"));
        v81 = (void *)objc_opt_class(v16);
        *(_DWORD *)buf = 138412802;
        v185 = v42;
        v186 = 2112;
        v187 = v14;
        v188 = 2112;
        v189 = v81;
        v44 = v81;
        v45 = "Error pluginID: %@ transactionID: %@ wrong register repsonse errors type %@";
        goto LABEL_60;
      }
    }
LABEL_141:

    v41 = 8;
    goto LABEL_142;
  }
  v46 = objc_msgSend(v13, "isEqualToString:", kCarDataProtocolCmdKeyUnregisterResponse);
  if ((_DWORD)v46)
  {
    v47 = CAFDClientLogging(v46);
    v48 = objc_claimAutoreleasedReturnValue(v47);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
      -[CarDataClient handleCommand:transactionID:values:errors:priority:].cold.1();
    goto LABEL_28;
  }
  v52 = objc_msgSend(v13, "isEqualToString:", kCarDataProtocolCmdKeyReadResponse);
  if ((_DWORD)v52)
  {
    if (v14)
    {
      if (v15)
      {
        v53 = objc_opt_class(NSDictionary);
        v54 = objc_opt_isKindOfClass(v15, v53);
        if ((v54 & 1) == 0)
        {
          v114 = CAFDClientLogging(v54);
          v28 = objc_claimAutoreleasedReturnValue(v114);
          if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            goto LABEL_141;
          v42 = (void *)objc_claimAutoreleasedReturnValue(-[CarDataClient pluginID](self, "pluginID"));
          v115 = (void *)objc_opt_class(v15);
          *(_DWORD *)buf = 138412802;
          v185 = v42;
          v186 = 2112;
          v187 = v14;
          v188 = 2112;
          v189 = v115;
          v44 = v115;
          v45 = "Error pluginID: %@ transactionID: %@ wrong read response values type %@";
          goto LABEL_60;
        }
      }
      if (v16)
      {
        v55 = objc_opt_class(NSDictionary);
        v56 = objc_opt_isKindOfClass(v16, v55);
        if ((v56 & 1) == 0)
        {
          v119 = CAFDClientLogging(v56);
          v28 = objc_claimAutoreleasedReturnValue(v119);
          if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            goto LABEL_141;
          v42 = (void *)objc_claimAutoreleasedReturnValue(-[CarDataClient pluginID](self, "pluginID"));
          v120 = (void *)objc_opt_class(v16);
          *(_DWORD *)buf = 138412802;
          v185 = v42;
          v186 = 2112;
          v187 = v14;
          v188 = 2112;
          v189 = v120;
          v44 = v120;
          v45 = "Error pluginID: %@ transactionID: %@ wrong read repsonse errors type %@";
          goto LABEL_60;
        }
      }
      v57 = CARSignpostLogForCategory(1);
      v58 = objc_claimAutoreleasedReturnValue(v57);
      if (!self
        || (v59 = CARSignpostLogForCategory(1),
            v60 = objc_claimAutoreleasedReturnValue(v59),
            v12 = os_signpost_id_make_with_pointer(v60, self),
            v60,
            v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL))
      {
        if (os_signpost_enabled(v58))
        {
          v61 = (void *)objc_claimAutoreleasedReturnValue(-[CarDataClient pluginID](self, "pluginID"));
          *(_DWORD *)buf = 138543618;
          v185 = v61;
          v186 = 2114;
          v187 = v14;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v58, OS_SIGNPOST_EVENT, v12, "Get", "Receive plugin read response pluginID: %{public}@ transactionID: %{public}@", buf, 0x16u);

        }
      }

      v63 = CAFDClientLogging(v62);
      v64 = objc_claimAutoreleasedReturnValue(v63);
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
      {
        v160 = (void *)objc_claimAutoreleasedReturnValue(-[CarDataClient pluginID](self, "pluginID"));
        v161 = objc_msgSend(v15, "count");
        v162 = objc_msgSend(v16, "count");
        *(_DWORD *)buf = 138413058;
        v185 = v160;
        v186 = 2112;
        v187 = v14;
        v188 = 2048;
        v189 = v161;
        v190 = 2048;
        v191 = v162;
        _os_log_debug_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEBUG, "Received pluginID: %@ transactionID: %@ read response values count: %ld errors count: %ld", buf, 0x2Au);

      }
      v37 = (id)objc_claimAutoreleasedReturnValue(-[CarDataClient parseValues:errors:](self, "parseValues:errors:", v15, v16));
      -[CarDataClient cacheValues:](self, "cacheValues:", v37);
      goto LABEL_75;
    }
    v98 = CAFDClientLogging(v52);
    v99 = objc_claimAutoreleasedReturnValue(v98);
    if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
      -[CarDataClient handleCommand:transactionID:values:errors:priority:].cold.2(self);
LABEL_121:

    v41 = 6;
    goto LABEL_142;
  }
  v67 = objc_msgSend(v13, "isEqualToString:", kCarDataProtocolCmdKeyWriteResponse);
  if ((_DWORD)v67)
  {
    if (!v14)
    {
      v116 = CAFDClientLogging(v67);
      v99 = objc_claimAutoreleasedReturnValue(v116);
      if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
        -[CarDataClient handleCommand:transactionID:values:errors:priority:].cold.3(self);
      goto LABEL_121;
    }
    v68 = objc_opt_class(NSDictionary);
    v69 = objc_opt_isKindOfClass(v16, v68);
    if ((v69 & 1) == 0)
    {
      v117 = CAFDClientLogging(v69);
      v28 = objc_claimAutoreleasedReturnValue(v117);
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        goto LABEL_141;
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[CarDataClient pluginID](self, "pluginID"));
      v118 = (void *)objc_opt_class(v16);
      *(_DWORD *)buf = 138412802;
      v185 = v42;
      v186 = 2112;
      v187 = v14;
      v188 = 2112;
      v189 = v118;
      v44 = v118;
      v45 = "Error pluginID: %@ transactionID: %@ wrong write response errors type %@";
      goto LABEL_60;
    }
    v70 = CARSignpostLogForCategory(1);
    v71 = objc_claimAutoreleasedReturnValue(v70);
    if (!self
      || (v72 = CARSignpostLogForCategory(1),
          v73 = objc_claimAutoreleasedReturnValue(v72),
          v12 = os_signpost_id_make_with_pointer(v73, self),
          v73,
          v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL))
    {
      if (os_signpost_enabled(v71))
      {
        v74 = (void *)objc_claimAutoreleasedReturnValue(-[CarDataClient pluginID](self, "pluginID"));
        *(_DWORD *)buf = 138543618;
        v185 = v74;
        v186 = 2114;
        v187 = v14;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v71, OS_SIGNPOST_EVENT, v12, "Set", "Receive plugin write response pluginID: %{public}@ transactionID: %{public}@", buf, 0x16u);

      }
    }

    v76 = CAFDClientLogging(v75);
    v77 = objc_claimAutoreleasedReturnValue(v76);
    if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG))
    {
      v166 = (void *)objc_claimAutoreleasedReturnValue(-[CarDataClient pluginID](self, "pluginID"));
      v167 = objc_msgSend(v16, "count");
      *(_DWORD *)buf = 138412802;
      v185 = v166;
      v186 = 2112;
      v187 = v14;
      v188 = 2048;
      v189 = v167;
      _os_log_debug_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_DEBUG, "Received pluginID: %@ transactionID: %@ write response result count: %ld", buf, 0x20u);

    }
    v78 = self;
    v79 = 0;
LABEL_74:
    v37 = (id)objc_claimAutoreleasedReturnValue(-[CarDataClient parseValues:errors:](v78, "parseValues:errors:", v79, v16));
LABEL_75:
    v95 = (void *)objc_claimAutoreleasedReturnValue(-[CarDataClient transactions](self, "transactions"));
    v96 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "objectForKeyedSubscript:", v14));

    if (v96)
    {
      v97 = objc_msgSend(objc_alloc((Class)CAFResponse), "initWithValues:", v37);
      ((void (**)(_QWORD, id))v96)[2](v96, v97);

    }
    goto LABEL_77;
  }
  v82 = objc_msgSend(v13, "isEqualToString:", kCarDataProtocolCmdKeyControlResponse);
  if ((_DWORD)v82)
  {
    if (!v14)
    {
      v134 = CAFDClientLogging(v82);
      v99 = objc_claimAutoreleasedReturnValue(v134);
      if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
        -[CarDataClient handleCommand:transactionID:values:errors:priority:].cold.4(self);
      goto LABEL_121;
    }
    if (v16)
    {
      v83 = objc_opt_class(NSDictionary);
      v84 = objc_opt_isKindOfClass(v16, v83);
      if ((v84 & 1) == 0)
      {
        v142 = CAFDClientLogging(v84);
        v28 = objc_claimAutoreleasedReturnValue(v142);
        if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          goto LABEL_141;
        v42 = (void *)objc_claimAutoreleasedReturnValue(-[CarDataClient pluginID](self, "pluginID"));
        v143 = (void *)objc_opt_class(v16);
        *(_DWORD *)buf = 138412802;
        v185 = v42;
        v186 = 2112;
        v187 = v14;
        v188 = 2112;
        v189 = v143;
        v44 = v143;
        v45 = "Error pluginID: %@ transactionID: %@ wrong control response errors type %@";
        goto LABEL_60;
      }
    }
    if (v15)
    {
      v85 = objc_opt_class(NSDictionary);
      v86 = objc_opt_isKindOfClass(v15, v85);
      if ((v86 & 1) == 0)
      {
        v149 = CAFDClientLogging(v86);
        v28 = objc_claimAutoreleasedReturnValue(v149);
        if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          goto LABEL_141;
        v42 = (void *)objc_claimAutoreleasedReturnValue(-[CarDataClient pluginID](self, "pluginID"));
        v150 = (void *)objc_opt_class(v15);
        *(_DWORD *)buf = 138412802;
        v185 = v42;
        v186 = 2112;
        v187 = v14;
        v188 = 2112;
        v189 = v150;
        v44 = v150;
        v45 = "Error pluginID: %@ transactionID: %@ wrong control response values type %@";
        goto LABEL_60;
      }
    }
    v87 = CARSignpostLogForCategory(1);
    v88 = objc_claimAutoreleasedReturnValue(v87);
    if (!self
      || (v89 = CARSignpostLogForCategory(1),
          v90 = objc_claimAutoreleasedReturnValue(v89),
          v12 = os_signpost_id_make_with_pointer(v90, self),
          v90,
          v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL))
    {
      if (os_signpost_enabled(v88))
      {
        v91 = (void *)objc_claimAutoreleasedReturnValue(-[CarDataClient pluginID](self, "pluginID"));
        *(_DWORD *)buf = 138543618;
        v185 = v91;
        v186 = 2114;
        v187 = v14;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v88, OS_SIGNPOST_EVENT, v12, "Control", "Receive plugin control response pluginID: %{public}@ transactionID: %{public}@", buf, 0x16u);

      }
    }

    v93 = CAFDClientLogging(v92);
    v94 = objc_claimAutoreleasedReturnValue(v93);
    if (os_log_type_enabled(v94, OS_LOG_TYPE_DEBUG))
    {
      v169 = (void *)objc_claimAutoreleasedReturnValue(-[CarDataClient pluginID](self, "pluginID"));
      v170 = objc_msgSend(v15, "count");
      v171 = objc_msgSend(v16, "count");
      *(_DWORD *)buf = 138413058;
      v185 = v169;
      v186 = 2112;
      v187 = v14;
      v188 = 2048;
      v189 = v170;
      v190 = 2048;
      v191 = v171;
      _os_log_debug_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_DEBUG, "Received pluginID: %@ transactionID: %@ control response values count: %ld errors count: %ld", buf, 0x2Au);

    }
    v78 = self;
    v79 = v15;
    goto LABEL_74;
  }
  v100 = objc_msgSend(v13, "isEqualToString:", kCarDataProtocolCmdKeyControlRequest);
  if ((_DWORD)v100)
  {
    if (!v14)
    {
      v144 = CAFDClientLogging(v100);
      v99 = objc_claimAutoreleasedReturnValue(v144);
      if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
        -[CarDataClient handleCommand:transactionID:values:errors:priority:].cold.5(self);
      goto LABEL_121;
    }
    v101 = objc_opt_class(NSDictionary);
    v102 = objc_opt_isKindOfClass(v15, v101);
    if ((v102 & 1) != 0)
    {
      v103 = CARSignpostLogForCategory(1);
      v104 = objc_claimAutoreleasedReturnValue(v103);
      if (!self
        || (v105 = CARSignpostLogForCategory(1),
            v106 = objc_claimAutoreleasedReturnValue(v105),
            v12 = os_signpost_id_make_with_pointer(v106, self),
            v106,
            v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL))
      {
        if (os_signpost_enabled(v104))
        {
          v107 = (void *)objc_claimAutoreleasedReturnValue(-[CarDataClient pluginID](self, "pluginID"));
          *(_DWORD *)buf = 138543618;
          v185 = v107;
          v186 = 2114;
          v187 = v14;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v104, OS_SIGNPOST_EVENT, v12, "Control", "Receive plugin control request pluginID: %{public}@ transactionID: %{public}@", buf, 0x16u);

        }
      }

      v109 = CAFDClientLogging(v108);
      v110 = objc_claimAutoreleasedReturnValue(v109);
      if (os_log_type_enabled(v110, OS_LOG_TYPE_DEBUG))
      {
        v172 = (void *)objc_claimAutoreleasedReturnValue(-[CarDataClient pluginID](self, "pluginID"));
        v173 = objc_msgSend(v15, "count");
        *(_DWORD *)buf = 138412802;
        v185 = v172;
        v186 = 2112;
        v187 = v14;
        v188 = 2048;
        v189 = v173;
        _os_log_debug_impl((void *)&_mh_execute_header, v110, OS_LOG_TYPE_DEBUG, "Received pluginID: %@ transactionID: %@ control request values count: %ld", buf, 0x20u);

      }
      v111 = objc_loadWeakRetained((id *)&self->clientDelegate);

      if (v111)
      {
        v181[0] = _NSConcreteStackBlock;
        v181[1] = 3221225472;
        v181[2] = __68__CarDataClient_handleCommand_transactionID_values_errors_priority___block_invoke;
        v181[3] = &unk_1000310D0;
        v181[4] = self;
        v182 = v14;
        v183 = a7;
        objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v181);

        goto LABEL_22;
      }
      v37 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.caraccessoryframework.cardata"), 10, 0));
      v39 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a7));
      -[CarDataClient responseTransactionID:error:priority:](self, "responseTransactionID:error:priority:", v14, v37, v39);
      goto LABEL_20;
    }
    v145 = CAFDClientLogging(v102);
    v146 = objc_claimAutoreleasedReturnValue(v145);
    if (os_log_type_enabled(v146, OS_LOG_TYPE_ERROR))
    {
      v174 = (void *)objc_claimAutoreleasedReturnValue(-[CarDataClient pluginID](self, "pluginID"));
      v175 = (void *)objc_opt_class(v15);
      *(_DWORD *)buf = 138412802;
      v185 = v174;
      v186 = 2112;
      v187 = v14;
      v188 = 2112;
      v189 = v175;
      v176 = v175;
      _os_log_error_impl((void *)&_mh_execute_header, v146, OS_LOG_TYPE_ERROR, "Error pluginID: %@ transactionID: %@ wrong control request values type %@", buf, 0x20u);

    }
    v41 = 8;
    v147 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.caraccessoryframework.cardata"), 8, 0));
    v148 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a7));
    -[CarDataClient responseTransactionID:error:priority:](self, "responseTransactionID:error:priority:", v14, v147, v148);

  }
  else
  {
    if (!objc_msgSend(v13, "isEqualToString:", kCarDataProtocolCmdKeyControlNotify))
    {
      if (objc_msgSend(v13, "isEqualToString:", kCarDataProtocolCmdKeyConfigResponse))
      {
        v135 = objc_opt_class(NSDictionary);
        v136 = objc_opt_isKindOfClass(v15, v135);
        v137 = v136;
        v138 = CAFDClientLogging(v136);
        v139 = objc_claimAutoreleasedReturnValue(v138);
        v28 = v139;
        if ((v137 & 1) == 0)
        {
          if (!os_log_type_enabled(v139, OS_LOG_TYPE_ERROR))
            goto LABEL_141;
          v42 = (void *)objc_claimAutoreleasedReturnValue(-[CarDataClient pluginID](self, "pluginID"));
          v163 = (void *)objc_opt_class(v15);
          *(_DWORD *)buf = 138412802;
          v185 = v42;
          v186 = 2112;
          v187 = v14;
          v188 = 2112;
          v189 = v163;
          v44 = v163;
          v45 = "Error pluginID: %@ transactionID: %@ wrong config response values type %@";
          goto LABEL_60;
        }
        if (os_log_type_enabled(v139, OS_LOG_TYPE_DEBUG))
          -[CarDataClient handleCommand:transactionID:values:errors:priority:].cold.6();

        v140 = objc_loadWeakRetained((id *)&self->clientDelegate);
        if (!v140)
        {
LABEL_29:
          if (v14)
          {
            v49 = (void *)objc_claimAutoreleasedReturnValue(-[CarDataClient transactions](self, "transactions"));
            v50 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "objectForKeyedSubscript:", v14));

            if (v50)
            {
              v51 = objc_msgSend(objc_alloc((Class)CAFResponse), "initWithValuesAndError:error:", 0, 0);
              ((void (**)(_QWORD, id))v50)[2](v50, v51);

            }
          }
          goto LABEL_22;
        }
        v48 = objc_loadWeakRetained((id *)&self->clientDelegate);
        v141 = (void *)objc_claimAutoreleasedReturnValue(-[CarDataClient pluginID](self, "pluginID"));
        -[NSObject didReceiveConfigFromPluginID:config:](v48, "didReceiveConfigFromPluginID:config:", v141, v15);

LABEL_28:
        goto LABEL_29;
      }
      v153 = objc_msgSend(v13, "isEqualToString:", kCarDataProtocolCmdKeyConfigNotify);
      if (!(_DWORD)v153)
      {
        v164 = CAFDClientLogging(v153);
        v28 = objc_claimAutoreleasedReturnValue(v164);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          v165 = (void *)objc_claimAutoreleasedReturnValue(-[CarDataClient pluginID](self, "pluginID"));
          *(_DWORD *)buf = 138412802;
          v185 = v165;
          v186 = 2112;
          v187 = v14;
          v188 = 2112;
          v189 = v13;
          _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Error pluginID: %@ transactionID: %@ unknown command %@", buf, 0x20u);

        }
        goto LABEL_141;
      }
      v154 = objc_opt_class(NSDictionary);
      v155 = objc_opt_isKindOfClass(v15, v154);
      v156 = v155;
      v157 = CAFDClientLogging(v155);
      v158 = objc_claimAutoreleasedReturnValue(v157);
      v28 = v158;
      if ((v156 & 1) == 0)
      {
        if (!os_log_type_enabled(v158, OS_LOG_TYPE_ERROR))
          goto LABEL_141;
        v42 = (void *)objc_claimAutoreleasedReturnValue(-[CarDataClient pluginID](self, "pluginID"));
        v179 = (void *)objc_opt_class(v15);
        *(_DWORD *)buf = 138412802;
        v185 = v42;
        v186 = 2112;
        v187 = v14;
        v188 = 2112;
        v189 = v179;
        v44 = v179;
        v45 = "Error pluginID: %@ transactionID: %@ wrong config notify values type %@";
        goto LABEL_60;
      }
      if (os_log_type_enabled(v158, OS_LOG_TYPE_DEBUG))
        -[CarDataClient handleCommand:transactionID:values:errors:priority:].cold.7();

      v159 = objc_loadWeakRetained((id *)&self->clientDelegate);
      if (!v159)
        goto LABEL_22;
      v37 = objc_loadWeakRetained((id *)&self->clientDelegate);
      v96 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[CarDataClient pluginID](self, "pluginID"));
      objc_msgSend(v37, "didReceiveConfigFromPluginID:config:", v96, v15);
LABEL_77:

      goto LABEL_21;
    }
    v121 = objc_opt_class(NSDictionary);
    v122 = objc_opt_isKindOfClass(v15, v121);
    if ((v122 & 1) == 0)
    {
      v151 = CAFDClientLogging(v122);
      v28 = objc_claimAutoreleasedReturnValue(v151);
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        goto LABEL_141;
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[CarDataClient pluginID](self, "pluginID"));
      v152 = (void *)objc_opt_class(v15);
      *(_DWORD *)buf = 138412802;
      v185 = v42;
      v186 = 2112;
      v187 = v14;
      v188 = 2112;
      v189 = v152;
      v44 = v152;
      v45 = "Error pluginID: %@ transactionID: %@ wrong control notify values type %@";
      goto LABEL_60;
    }
    v123 = CARSignpostLogForCategory(1);
    v124 = objc_claimAutoreleasedReturnValue(v123);
    if (!self
      || (v125 = CARSignpostLogForCategory(1),
          v126 = objc_claimAutoreleasedReturnValue(v125),
          v12 = os_signpost_id_make_with_pointer(v126, self),
          v126,
          v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL))
    {
      if (os_signpost_enabled(v124))
      {
        v127 = (void *)objc_claimAutoreleasedReturnValue(-[CarDataClient pluginID](self, "pluginID"));
        *(_DWORD *)buf = 138543362;
        v185 = v127;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v124, OS_SIGNPOST_EVENT, v12, "Control", "Receive plugin control notify pluginID: %{public}@", buf, 0xCu);

      }
    }

    v129 = CAFDClientLogging(v128);
    v130 = objc_claimAutoreleasedReturnValue(v129);
    if (os_log_type_enabled(v130, OS_LOG_TYPE_DEBUG))
    {
      v177 = (void *)objc_claimAutoreleasedReturnValue(-[CarDataClient pluginID](self, "pluginID"));
      v178 = objc_msgSend(v15, "count");
      *(_DWORD *)buf = 138412802;
      v185 = v177;
      v186 = 2112;
      v187 = v14;
      v188 = 2048;
      v189 = v178;
      _os_log_debug_impl((void *)&_mh_execute_header, v130, OS_LOG_TYPE_DEBUG, "Received pluginID: %@ transactionID: %@ control notify values count: %lu", buf, 0x20u);

    }
    v41 = (int64_t)objc_loadWeakRetained((id *)&self->clientDelegate);

    if (v41)
    {
      v180[0] = _NSConcreteStackBlock;
      v180[1] = 3221225472;
      v180[2] = __68__CarDataClient_handleCommand_transactionID_values_errors_priority___block_invoke_34;
      v180[3] = &unk_1000310F8;
      v180[4] = self;
      objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v180);
      goto LABEL_22;
    }
  }
LABEL_142:

  return v41;
}

void __68__CarDataClient_handleCommand_transactionID_values_errors_priority___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  id v20;
  void *v21;
  uint64_t v22;
  id WeakRetained;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  _QWORD v32[5];
  id v33;
  id v34;
  uint64_t v35;

  v5 = a2;
  v6 = a3;
  v7 = objc_opt_class(NSNumber);
  v8 = v5;
  v9 = v8;
  if (v8 && (objc_opt_isKindOfClass(v8, v7) & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v11 = objc_msgSend(v6, "isEqual:", v10);

    if ((v11 & 1) != 0)
    {
      v12 = 0;
LABEL_13:
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "pluginID"));
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = __68__CarDataClient_handleCommand_transactionID_values_errors_priority___block_invoke_32;
      v32[3] = &unk_1000310A8;
      v32[4] = *(_QWORD *)(a1 + 32);
      v18 = v9;
      v33 = v18;
      v25 = *(id *)(a1 + 40);
      v26 = *(_QWORD *)(a1 + 48);
      v34 = v25;
      v35 = v26;
      objc_msgSend(WeakRetained, "didReceiveRequestFromPluginID:instanceID:value:withResponse:", v24, v18, v12, v32);

      goto LABEL_14;
    }
    v19 = objc_opt_class(NSDictionary);
    v20 = v6;
    v21 = v20;
    if (v20 && (objc_opt_isKindOfClass(v20, v19) & 1) != 0)
      v12 = v21;
    else
      v12 = 0;

    if (v12)
      goto LABEL_13;
    v27 = CAFDLogging(v22);
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      __68__CarDataClient_handleCommand_transactionID_values_errors_priority___block_invoke_cold_2();

    v29 = *(void **)(a1 + 32);
    v12 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.caraccessoryframework.cardata"), 8, 0));
    v30 = *(_QWORD *)(a1 + 40);
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48)));
    objc_msgSend(v29, "responseInstanceID:error:transactionID:priority:", v9, v12, v30, v31);

    v18 = v9;
  }
  else
  {

    v14 = CAFDLogging(v13);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      __68__CarDataClient_handleCommand_transactionID_values_errors_priority___block_invoke_cold_1();

    v16 = *(void **)(a1 + 32);
    v17 = *(_QWORD *)(a1 + 40);
    v18 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.caraccessoryframework.cardata"), 7, 0));
    v12 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48)));
    objc_msgSend(v16, "responseTransactionID:error:priority:", v17, v18, v12);
  }
LABEL_14:

}

void __68__CarDataClient_handleCommand_transactionID_values_errors_priority___block_invoke_32(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  v6 = (void *)a1[4];
  v7 = a1[5];
  v8 = a1[6];
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a1[7]));
  if (v5)
    objc_msgSend(v6, "responseInstanceID:error:transactionID:priority:", v7, v5, v8, v9);
  else
    objc_msgSend(v6, "responseInstanceID:value:transactionID:priority:", v7, v10, v8, v9);

}

void __68__CarDataClient_handleCommand_transactionID_values_errors_priority___block_invoke_34(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  unsigned __int8 v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  id WeakRetained;
  void *v21;
  uint64_t v22;

  v5 = a2;
  v6 = a3;
  v7 = objc_opt_class(NSNumber);
  v8 = v5;
  v9 = v8;
  if (v8 && (objc_opt_isKindOfClass(v8, v7) & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v11 = objc_msgSend(v6, "isEqual:", v10);

    if ((v11 & 1) != 0)
    {
      v12 = 0;
    }
    else
    {
      v16 = objc_opt_class(NSDictionary);
      v17 = v6;
      v18 = v17;
      if (v17 && (objc_opt_isKindOfClass(v17, v16) & 1) != 0)
        v12 = v18;
      else
        v12 = 0;

      if (!v12)
      {
        v22 = CAFDLogging(v19);
        v12 = objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          __68__CarDataClient_handleCommand_transactionID_values_errors_priority___block_invoke_34_cold_2();
        goto LABEL_13;
      }
    }
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "pluginID"));
    objc_msgSend(WeakRetained, "didReceiveNotificationFromPluginID:instanceID:value:", v21, v9, v12);

LABEL_13:
    v15 = v9;
    goto LABEL_14;
  }

  v14 = CAFDLogging(v13);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    __68__CarDataClient_handleCommand_transactionID_values_errors_priority___block_invoke_34_cold_1();
LABEL_14:

}

- (void)receiveData:(id)a3 priority:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  CarDataClient *v11;
  unint64_t v12;

  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(-[CarDataClient processingQueue](self, "processingQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __38__CarDataClient_receiveData_priority___block_invoke;
  block[3] = &unk_100031120;
  v10 = v6;
  v11 = self;
  v12 = a4;
  v8 = v6;
  dispatch_async(v7, block);

}

void __38__CarDataClient_receiveData_priority___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  NSObject *v24;
  const __CFString *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void (**v35)(_QWORD, _QWORD);
  id v36;
  void *v37;
  void *v38;
  id v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  NSObject *v45;

  v2 = objc_opt_class(NSDictionary);
  v3 = *(void **)(a1 + 32);
  v39 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "CAF_decodeCarData:", &v39));
  v5 = v39;
  v6 = v4;
  v7 = v6;
  if (v6 && (objc_opt_isKindOfClass(v6, v2) & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  if (!v5)
  {
    v12 = objc_opt_class(NSNumber);
    v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", kCarDataProtocolKeyTransactionID));
    v14 = v13;
    if (v13 && (objc_opt_isKindOfClass(v13, v12) & 1) != 0)
      v15 = v14;
    else
      v15 = 0;

    v16 = objc_opt_class(NSString);
    v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", kCarDataProtocolKeyCommand));
    v18 = v17;
    if (v17 && (objc_opt_isKindOfClass(v17, v16) & 1) != 0)
      v19 = v18;
    else
      v19 = 0;

    if (!v19)
    {
      v26 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.caraccessoryframework.cardata"), 5, 0));
      v11 = v26;
      if (v26)
      {
LABEL_30:
        v30 = CAFDClientLogging(v26);
        v31 = objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "pluginID"));
          *(_DWORD *)buf = 138412802;
          v41 = v38;
          v42 = 2112;
          v43 = v15;
          v44 = 2112;
          v45 = v11;
          _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Received pluginID: %@ transactionID: %@ error: %@", buf, 0x20u);

        }
        if (objc_msgSend(v19, "isEqualToString:", kCarDataProtocolCmdKeyGeneralError))
        {
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "clientDelegate"));
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "pluginID"));
          objc_msgSend(v32, "didReceiveErrorFromPluginID:error:", v33, v11);

        }
        if (!v15)
          goto LABEL_39;
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "transactions"));
        v35 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKeyedSubscript:", v15));

        if (v35)
        {
          v36 = objc_msgSend(objc_alloc((Class)CAFResponse), "initWithError:", v11);
          ((void (**)(_QWORD, id))v35)[2](v35, v36);

        }
LABEL_38:
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "transactions"));
        objc_msgSend(v37, "removeObjectForKey:", v15);

LABEL_39:
        goto LABEL_40;
      }
LABEL_24:
      if (!v15)
        goto LABEL_39;
      goto LABEL_38;
    }
    v20 = objc_opt_class(NSNumber);
    v21 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", kCarDataProtocolKeyError));
    v22 = v21;
    if (v21 && (objc_opt_isKindOfClass(v21, v20) & 1) != 0)
      v23 = v22;
    else
      v23 = 0;

    if (v23)
    {
      v24 = objc_msgSend(v23, "integerValue");
      v25 = (const __CFString *)NSOSStatusErrorDomain;
    }
    else
    {
      v27 = *(void **)(a1 + 40);
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", kCarDataProtocolKeyValues));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", kCarDataProtocolKeyErrors));
      v11 = objc_msgSend(v27, "handleCommand:transactionID:values:errors:priority:", v19, v15, v28, v29, *(_QWORD *)(a1 + 48));

      if (!v11)
        goto LABEL_29;
      v25 = CFSTR("com.apple.caraccessoryframework.cardata");
      v24 = v11;
    }
    v11 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v25, v24, 0));
LABEL_29:

    if (v11)
      goto LABEL_30;
    goto LABEL_24;
  }
  v10 = CAFDClientLogging(v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    __38__CarDataClient_receiveData_priority___block_invoke_cold_1();
LABEL_40:

}

- (void)requestConfigurationWithPriority:(id)a3 withResponse:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;

  v6 = a3;
  v7 = a4;
  v8 = CAFDClientLogging(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[CarDataClient requestConfigurationWithPriority:withResponse:].cold.1();

  -[CarDataClient sendCommand:values:priority:withResponse:](self, "sendCommand:values:priority:withResponse:", kCarDataProtocolCmdKeyConfigRequest, 0, v6, v7);
}

- (void)registerAllWithPriority:(id)a3 withResponse:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;

  v6 = a3;
  v7 = a4;
  v8 = CAFDClientLogging(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[CarDataClient registerAllWithPriority:withResponse:].cold.1();

  -[CarDataClient sendCommand:values:priority:withResponse:](self, "sendCommand:values:priority:withResponse:", kCarDataProtocolCmdKeyRegisterRequest, kCarDataProtocolValueWildcard, v6, v7);
}

- (void)unregisterAllWithPriority:(id)a3 withResponse:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;

  v6 = a3;
  v7 = a4;
  v8 = CAFDClientLogging(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[CarDataClient unregisterAllWithPriority:withResponse:].cold.1();

  -[CarDataClient sendCommand:values:priority:withResponse:](self, "sendCommand:values:priority:withResponse:", kCarDataProtocolCmdKeyUnregisterRequest, kCarDataProtocolValueWildcard, v6, v7);
}

- (void)registerInstanceIDs:(id)a3 priority:(id)a4 withResponse:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, id);
  uint64_t v11;
  NSObject *v12;
  id v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, id))a5;
  v11 = CAFDClientLogging(v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarDataClient pluginID](self, "pluginID"));
    v15 = 138412802;
    v16 = v14;
    v17 = 2048;
    v18 = objc_msgSend(v8, "count");
    v19 = 2112;
    v20 = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Request pluginID: %@ add registration for instanceIDs count: %ld with priority: %@", (uint8_t *)&v15, 0x20u);

  }
  if (v8 && objc_msgSend(v8, "count"))
  {
    -[CarDataClient addRegistrationFromCache:priority:withResponse:](self, "addRegistrationFromCache:priority:withResponse:", v8, v9, v10);
  }
  else if (v10)
  {
    v13 = objc_msgSend(objc_alloc((Class)CAFResponse), "initWithValues:", &__NSDictionary0__struct);
    v10[2](v10, v13);

  }
}

- (void)unregisterInstanceIDs:(id)a3 priority:(id)a4 withResponse:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, id);
  uint64_t v11;
  NSObject *v12;
  id v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, id))a5;
  v11 = CAFDClientLogging(v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarDataClient pluginID](self, "pluginID"));
    v15 = 138412802;
    v16 = v14;
    v17 = 2048;
    v18 = objc_msgSend(v8, "count");
    v19 = 2112;
    v20 = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Request pluginID: %@ remove registration for instanceIDs count: %ld with priority: %@", (uint8_t *)&v15, 0x20u);

  }
  if (v8 && objc_msgSend(v8, "count"))
  {
    -[CarDataClient removeRegistrationFromCache:priority:withResponse:](self, "removeRegistrationFromCache:priority:withResponse:", v8, v9, v10);
  }
  else if (v10)
  {
    v13 = objc_msgSend(objc_alloc((Class)CAFResponse), "initWithValuesAndError:error:", 0, 0);
    v10[2](v10, v13);

  }
}

- (void)readInstanceIDs:(id)a3 priority:(id)a4 withResponse:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, id);
  uint64_t v11;
  NSObject *v12;
  id v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, id))a5;
  v11 = CAFDClientLogging(v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarDataClient pluginID](self, "pluginID"));
    v15 = 138412802;
    v16 = v14;
    v17 = 2048;
    v18 = objc_msgSend(v8, "count");
    v19 = 2112;
    v20 = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Request pluginID: %@ read for instanceIDs count: %ld with priority: %@", (uint8_t *)&v15, 0x20u);

  }
  if (v8 && objc_msgSend(v8, "count"))
  {
    -[CarDataClient readFromCache:priority:withResponse:](self, "readFromCache:priority:withResponse:", v8, v9, v10);
  }
  else if (v10)
  {
    v13 = objc_msgSend(objc_alloc((Class)CAFResponse), "initWithValues:", &__NSDictionary0__struct);
    v10[2](v10, v13);

  }
}

- (void)writeValues:(id)a3 priority:(id)a4 withResponse:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, id);
  uint64_t v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  int v20;
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, id))a5;
  v11 = CAFDClientLogging(v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CarDataClient pluginID](self, "pluginID"));
    v20 = 138412802;
    v21 = v17;
    v22 = 2048;
    v23 = objc_msgSend(v8, "count");
    v24 = 2112;
    v25 = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Request pluginID: %@ write for values count: %ld with priority: %@", (uint8_t *)&v20, 0x20u);

  }
  if (v8 && (v13 = objc_msgSend(v8, "count")) != 0)
  {
    v14 = CAFDClientLogging(v13);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[CarDataClient pluginID](self, "pluginID"));
      v19 = objc_msgSend(v8, "count");
      v20 = 138412802;
      v21 = v18;
      v22 = 2048;
      v23 = v19;
      v24 = 2112;
      v25 = v9;
      _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Write values pluginID: %@ instanceID count: %ld with priority: %@", (uint8_t *)&v20, 0x20u);

    }
    -[CarDataClient sendCommand:values:priority:withResponse:](self, "sendCommand:values:priority:withResponse:", kCarDataProtocolCmdKeyWriteRequest, v8, v9, v10);
  }
  else if (v10)
  {
    v16 = objc_msgSend(objc_alloc((Class)CAFResponse), "initWithValues:", &__NSDictionary0__struct);
    v10[2](v10, v16);

  }
}

- (void)requestInstanceID:(id)a3 value:(id)a4 priority:(id)a5 withResponse:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  const __CFString *v23;
  _QWORD v24[4];
  id v25;
  CarDataClient *v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  const __CFString *v36;
  __int16 v37;
  id v38;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = CAFDClientLogging(v13);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CarDataClient pluginID](self, "pluginID"));
    v23 = CFSTR("YES");
    *(_DWORD *)buf = 138413058;
    v32 = v22;
    if (!v11)
      v23 = CFSTR("NO");
    v33 = 2112;
    v34 = v10;
    v35 = 2112;
    v36 = v23;
    v37 = 2112;
    v38 = v12;
    _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Request pluginID: %@ instanceID: %@ with value: %@ and priority: %@", buf, 0x2Au);

  }
  v16 = kCarDataProtocolCmdKeyControlRequest;
  v29 = v10;
  v17 = v11;
  if (!v11)
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v30 = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = __63__CarDataClient_requestInstanceID_value_priority_withResponse___block_invoke;
  v24[3] = &unk_100031148;
  v25 = v10;
  v26 = self;
  v27 = v12;
  v28 = v13;
  v19 = v12;
  v20 = v10;
  v21 = v13;
  -[CarDataClient sendCommand:values:priority:withResponse:](self, "sendCommand:values:priority:withResponse:", v16, v18, v19, v24);

  if (!v11)
}

void __63__CarDataClient_requestInstanceID_value_priority_withResponse___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  const __CFString *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  uint64_t v26;

  v3 = a2;
  v4 = v3;
  if (!*(_QWORD *)(a1 + 56))
    goto LABEL_12;
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "error"));
  if (v5)
  {
    v6 = (void *)v5;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "values"));

    if (v6)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "values"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32)));

      if (v9)
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "error"));
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "value"));
      }
      else
      {
        v6 = 0;
        v7 = 0;
      }

      goto LABEL_10;
    }
  }
  v7 = 0;
LABEL_10:
  v10 = CAFDClientLogging(v5);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "pluginID"));
    v13 = (void *)v12;
    v14 = *(_QWORD *)(a1 + 32);
    v15 = CFSTR("YES");
    v16 = *(_QWORD *)(a1 + 48);
    v17 = 138413314;
    if (!v7)
      v15 = CFSTR("NO");
    v18 = v12;
    v19 = 2112;
    v20 = v14;
    v21 = 2112;
    v22 = v15;
    v23 = 2112;
    v24 = v6;
    v25 = 2112;
    v26 = v16;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Response pluginID: %@ instanceID: %@ control with value: %@ error: %@ and priority: %@", (uint8_t *)&v17, 0x34u);

  }
  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56));

LABEL_12:
}

- (void)notifyInstanceID:(id)a3 value:(id)a4 priority:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  id v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  id v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = CAFDClientLogging(v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarDataClient pluginID](self, "pluginID"));
    v17 = CFSTR("YES");
    *(_DWORD *)buf = 138413058;
    v21 = v16;
    if (!v9)
      v17 = CFSTR("NO");
    v22 = 2112;
    v23 = v8;
    v24 = 2112;
    v25 = v17;
    v26 = 2112;
    v27 = v10;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Notify pluginID: %@ instanceID: %@ with value: %@ and priority: %@", buf, 0x2Au);

  }
  v13 = kCarDataProtocolCmdKeyControlNotify;
  v18 = v8;
  v14 = v9;
  if (!v9)
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null", v18));
  v19 = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));
  -[CarDataClient sendCommand:values:priority:withResponse:](self, "sendCommand:values:priority:withResponse:", v13, v15, v10, 0);

  if (!v9)
}

- (void)responseInstanceID:(id)a3 value:(id)a4 transactionID:(id)a5 priority:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  id v21;
  void *v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  const __CFString *v30;
  __int16 v31;
  id v32;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = CAFDClientLogging(v13);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CarDataClient pluginID](self, "pluginID"));
    *(_DWORD *)buf = 138413314;
    v20 = CFSTR("YES");
    v24 = v19;
    if (!v11)
      v20 = CFSTR("NO");
    v25 = 2112;
    v26 = v10;
    v27 = 2112;
    v28 = v12;
    v29 = 2112;
    v30 = v20;
    v31 = 2112;
    v32 = v13;
    _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Response pluginID: %@ instanceID: %@ transactionID: %@ with value: %@ and priority: %@", buf, 0x34u);

  }
  v16 = kCarDataProtocolCmdKeyControlResponse;
  v21 = v10;
  v17 = v11;
  if (!v11)
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null", v21));
  v22 = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
  -[CarDataClient sendCommand:values:transactionID:priority:](self, "sendCommand:values:transactionID:priority:", v16, v18, v12, v13);

  if (!v11)
}

- (void)responseInstanceID:(id)a3 error:(id)a4 transactionID:(id)a5 priority:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  int64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = CAFDClientLogging(v13);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CarDataClient pluginID](self, "pluginID"));
    *(_DWORD *)buf = 138413314;
    v24 = v20;
    v25 = 2112;
    v26 = v10;
    v27 = 2112;
    v28 = v12;
    v29 = 2112;
    v30 = v11;
    v31 = 2112;
    v32 = v13;
    _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Response pluginID: %@ instanceID: %@ transactionID: %@ with error: %@ and priority: %@", buf, 0x34u);

  }
  v16 = +[CarDataClient osStatusFromCarDataError:](CarDataClient, "osStatusFromCarDataError:", objc_msgSend(v11, "code"));
  v17 = kCarDataProtocolCmdKeyControlResponse;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v16, v10));
  v22 = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
  -[CarDataClient sendCommand:errors:transactionID:priority:](self, "sendCommand:errors:transactionID:priority:", v17, v19, v12, v13);

}

- (void)responseTransactionID:(id)a3 error:(id)a4 priority:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = CAFDClientLogging(v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarDataClient pluginID](self, "pluginID"));
    v15 = 138413058;
    v16 = v14;
    v17 = 2112;
    v18 = v8;
    v19 = 2112;
    v20 = v9;
    v21 = 2112;
    v22 = v10;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Response pluginID: %@ transactionID: %@ with error: %@ and priority: %@", (uint8_t *)&v15, 0x2Au);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, +[CarDataClient osStatusFromCarDataError:](CarDataClient, "osStatusFromCarDataError:", objc_msgSend(v9, "code")), 0));
  -[CarDataClient sendCommand:error:transactionID:priority:](self, "sendCommand:error:transactionID:priority:", kCarDataProtocolCmdKeyControlResponse, v13, v8, v10);

}

- (id)cachedValueForInstanceID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  v5 = objc_claimAutoreleasedReturnValue(-[CarDataClient processingQueue](self, "processingQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __42__CarDataClient_cachedValueForInstanceID___block_invoke;
  block[3] = &unk_100031170;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __42__CarDataClient_cachedValueForInstanceID___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "cachedValues"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40)));
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "value"));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

+ (int64_t)osStatusFromCarDataError:(unint64_t)a3
{
  if (a3 > 0xA)
    return -6700;
  else
    return qword_100025DF0[a3];
}

- (CarDataClientDelegate)clientDelegate
{
  return (CarDataClientDelegate *)objc_loadWeakRetained((id *)&self->clientDelegate);
}

- (void)setClientDelegate:(id)a3
{
  objc_storeWeak((id *)&self->clientDelegate, a3);
}

- (NSNumber)pluginID
{
  return self->_pluginID;
}

- (void)setPluginID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSMutableDictionary)transactions
{
  return self->_transactions;
}

- (void)setTransactions:(id)a3
{
  objc_storeStrong((id *)&self->_transactions, a3);
}

- (NSMutableDictionary)cachedValues
{
  return self->_cachedValues;
}

- (void)setCachedValues:(id)a3
{
  objc_storeStrong((id *)&self->_cachedValues, a3);
}

- (OS_dispatch_queue)processingQueue
{
  return self->_processingQueue;
}

- (void)setProcessingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_processingQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_cachedValues, 0);
  objc_storeStrong((id *)&self->_transactions, 0);
  objc_storeStrong((id *)&self->_pluginID, 0);
  objc_destroyWeak((id *)&self->clientDelegate);
}

- (void)sendCommand:values:priority:withResponse:.cold.1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_5_0();
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v0, "pluginID"));
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_0((void *)&_mh_execute_header, v2, v3, "Failed to generate transactionID for pluginID: %@ command: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_10();
}

void __85__CarDataClient_sendCommand_values_errors_error_transactionID_priority_withResponse___block_invoke_cold_1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_5_0();
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v0 + 72), "pluginID"));
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_11_0((void *)&_mh_execute_header, v2, v3, "Unable to package command for pluginID: %@ transactionID: %@ with priority: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_12_0();
}

void __85__CarDataClient_sendCommand_values_errors_error_transactionID_priority_withResponse___block_invoke_2_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "pluginID"));
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_11_0((void *)&_mh_execute_header, v2, v3, "Unable to send command for pluginID: %@ transactionID: %@ with priority: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_12_0();
}

void __36__CarDataClient_parseValues_errors___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_5_0();
  v2 = objc_msgSend((id)OUTLINED_FUNCTION_10_0(v1), "pluginID");
  objc_claimAutoreleasedReturnValue(v2);
  v3 = (void *)OUTLINED_FUNCTION_7_0();
  v4 = OUTLINED_FUNCTION_3_1(v3);
  OUTLINED_FUNCTION_1_0((void *)&_mh_execute_header, v5, v6, "Parsing characteristic value from pluginID: %@ failed with wrong instanceID data type %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_10();
}

void __67__CarDataClient_removeRegistrationFromCache_priority_withResponse___block_invoke_cold_1()
{
  uint64_t v0;
  id *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_5_0();
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v1, "pluginID"));
  objc_msgSend(*(id *)(v0 + 40), "count");
  OUTLINED_FUNCTION_4_1((void *)&_mh_execute_header, v3, v4, "Remove registration from cache pluginID: %@ instanceID count: %ld", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_10();
}

- (void)handleCommand:transactionID:values:errors:priority:.cold.1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_5_0();
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v0, "pluginID"));
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4_1((void *)&_mh_execute_header, v2, v3, "Received pluginID: %@ transactionID: %@ unregister response result: OK", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_10();
}

- (void)handleCommand:(void *)a1 transactionID:values:errors:priority:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "pluginID"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6_0((void *)&_mh_execute_header, v2, v3, "Error pluginID: %@ read response missing transactionID", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_13();
}

- (void)handleCommand:(void *)a1 transactionID:values:errors:priority:.cold.3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "pluginID"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6_0((void *)&_mh_execute_header, v2, v3, "Error pluginID: %@ write response missing transactionID", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_13();
}

- (void)handleCommand:(void *)a1 transactionID:values:errors:priority:.cold.4(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "pluginID"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6_0((void *)&_mh_execute_header, v2, v3, "Error pluginID: %@ control response missing transactionID", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_13();
}

- (void)handleCommand:(void *)a1 transactionID:values:errors:priority:.cold.5(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "pluginID"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6_0((void *)&_mh_execute_header, v2, v3, "Error pluginID: %@ control request missing transactionID", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_13();
}

- (void)handleCommand:transactionID:values:errors:priority:.cold.6()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_5_0();
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v0, "pluginID"));
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4_1((void *)&_mh_execute_header, v2, v3, "Received pluginID: %@ transactionID: %@ config response", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_10();
}

- (void)handleCommand:transactionID:values:errors:priority:.cold.7()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_5_0();
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v0, "pluginID"));
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4_1((void *)&_mh_execute_header, v2, v3, "Received pluginID: %@ transactionID: %@ config notify", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_10();
}

void __68__CarDataClient_handleCommand_transactionID_values_errors_priority___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_5_0();
  v2 = objc_msgSend((id)OUTLINED_FUNCTION_10_0(v1), "pluginID");
  objc_claimAutoreleasedReturnValue(v2);
  v3 = (void *)OUTLINED_FUNCTION_7_0();
  v4 = OUTLINED_FUNCTION_3_1(v3);
  OUTLINED_FUNCTION_1_0((void *)&_mh_execute_header, v5, v6, "Parsing control request value from pluginID: %@ failed with wrong instanceID data type %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_10();
}

void __68__CarDataClient_handleCommand_transactionID_values_errors_priority___block_invoke_cold_2()
{
  void *v0;
  uint64_t v1;
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_5_0();
  v2 = objc_msgSend((id)OUTLINED_FUNCTION_10_0(v1), "pluginID");
  objc_claimAutoreleasedReturnValue(v2);
  v3 = (void *)OUTLINED_FUNCTION_7_0();
  v4 = OUTLINED_FUNCTION_3_1(v3);
  OUTLINED_FUNCTION_1_0((void *)&_mh_execute_header, v5, v6, "Parsing control request value from pluginID: %@ failed with wrong request data type %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_10();
}

void __68__CarDataClient_handleCommand_transactionID_values_errors_priority___block_invoke_34_cold_1()
{
  void *v0;
  uint64_t v1;
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_5_0();
  v2 = objc_msgSend((id)OUTLINED_FUNCTION_10_0(v1), "pluginID");
  objc_claimAutoreleasedReturnValue(v2);
  v3 = (void *)OUTLINED_FUNCTION_7_0();
  v4 = OUTLINED_FUNCTION_3_1(v3);
  OUTLINED_FUNCTION_1_0((void *)&_mh_execute_header, v5, v6, "Parsing control notify value from pluginID: %@ failed with wrong instanceID data type %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_10();
}

void __68__CarDataClient_handleCommand_transactionID_values_errors_priority___block_invoke_34_cold_2()
{
  void *v0;
  uint64_t v1;
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_5_0();
  v2 = objc_msgSend((id)OUTLINED_FUNCTION_10_0(v1), "pluginID");
  objc_claimAutoreleasedReturnValue(v2);
  v3 = (void *)OUTLINED_FUNCTION_7_0();
  v4 = OUTLINED_FUNCTION_3_1(v3);
  OUTLINED_FUNCTION_1_0((void *)&_mh_execute_header, v5, v6, "Parsing control notify value from pluginID: %@ failed with wrong notification data type %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_10();
}

void __38__CarDataClient_receiveData_priority___block_invoke_cold_1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_5_0();
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v0 + 40), "pluginID"));
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_0((void *)&_mh_execute_header, v2, v3, "Error parsing pluginID: %@ data with error: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_10();
}

- (void)requestConfigurationWithPriority:withResponse:.cold.1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_5_0();
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v0, "pluginID"));
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4_1((void *)&_mh_execute_header, v2, v3, "Request pluginID: %@ config with priority: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_10();
}

- (void)registerAllWithPriority:withResponse:.cold.1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_5_0();
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v0, "pluginID"));
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4_1((void *)&_mh_execute_header, v2, v3, "Request pluginID: %@ to register all with priority: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_10();
}

- (void)unregisterAllWithPriority:withResponse:.cold.1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_5_0();
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v0, "pluginID"));
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4_1((void *)&_mh_execute_header, v2, v3, "Request pluginID: %@ to unregister all with priority: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_10();
}

@end
