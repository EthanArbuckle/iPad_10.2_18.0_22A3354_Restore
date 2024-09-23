void sub_100002B6C(id a1)
{
  ChargeDurationPredictor *v1;
  void *v2;

  v1 = objc_alloc_init(ChargeDurationPredictor);
  v2 = (void *)qword_10001BDB0;
  qword_10001BDB0 = (uint64_t)v1;

}

void sub_100002F78(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  _QWORD v13[5];
  id v14;
  uint64_t v15;
  id v16;
  uint8_t buf[4];
  void *v18;

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "log"));
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40)));
    *(_DWORD *)buf = 138412290;
    v18 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Querying model for scheme %@", buf, 0xCu);

  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "predictor"));
  v6 = (_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 40);
  v16 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "chargePredictionOutputOfScheme:withError:", v5, &v16));
  v8 = v16;

  v9 = *(void **)(a1 + 32);
  if (v8)
  {
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "log"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_10000CE24(v6, (uint64_t)v8, v10);

  }
  else
  {
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mainQueue"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10000312C;
    v13[3] = &unk_1000143B8;
    v12 = *(_QWORD *)(a1 + 40);
    v13[4] = *(_QWORD *)(a1 + 32);
    v15 = v12;
    v14 = v7;
    dispatch_async(v11, v13);

  }
}

id sub_10000312C(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("predictorOutput"));
  v2 = *(_QWORD *)(a1 + 40);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "predictorOutput"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48)));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, v4);

  return objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("predictorOutput"));
}

void sub_100003760(id a1)
{
  AnalyticsLogger *v1;
  void *v2;

  v1 = objc_alloc_init(AnalyticsLogger);
  v2 = (void *)qword_10001BDC0;
  qword_10001BDC0 = (uint64_t)v1;

}

void sub_100003960(id *a1)
{
  _QWORD v2[4];
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100003A38;
  v2[3] = &unk_100014428;
  v3 = a1[4];
  v4 = a1[5];
  v5 = a1[6];
  v6 = a1[7];
  v7 = a1[8];
  v8 = a1[9];
  AnalyticsSendEventLazy(CFSTR("com.apple.powerexperienced.powermodes.event"), v2);

}

id sub_100003A38(uint64_t a1)
{
  double v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[5];
  _QWORD v8[2];
  __int128 v9;
  uint64_t v10;

  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceDate:", *(_QWORD *)(a1 + 40));
  v7[0] = CFSTR("Duration");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", (uint64_t)v2));
  v4 = *(_QWORD *)(a1 + 48);
  v8[0] = v3;
  v8[1] = v4;
  v7[1] = CFSTR("PowerMode");
  v7[2] = CFSTR("ExitReason");
  v9 = *(_OWORD *)(a1 + 56);
  v7[3] = CFSTR("StartingBatteryLevel");
  v7[4] = CFSTR("EndingBatteryLevel");
  v10 = *(_QWORD *)(a1 + 72);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v8, v7, 5));

  return v5;
}

void sub_100003C98(id a1)
{
  InUseChargingMode *v1;
  void *v2;

  v1 = objc_alloc_init(InUseChargingMode);
  v2 = (void *)qword_10001BDD8;
  qword_10001BDD8 = (uint64_t)v1;

}

void sub_100004288(id a1)
{
  LongChargingMode *v1;
  void *v2;

  v1 = objc_alloc_init(LongChargingMode);
  v2 = (void *)qword_10001BDE8;
  qword_10001BDE8 = (uint64_t)v1;

}

void sub_100004920(id a1)
{
  RestrictedPerfMode *v1;
  void *v2;

  v1 = objc_alloc_init(RestrictedPerfMode);
  v2 = (void *)qword_10001BE00;
  qword_10001BE00 = (uint64_t)v1;

}

void sub_100005440(id a1)
{
  AcceleratedChargingMode *v1;
  void *v2;

  v1 = objc_alloc_init(AcceleratedChargingMode);
  v2 = (void *)qword_10001BE10;
  qword_10001BE10 = (uint64_t)v1;

}

const __CFString *sub_10000588C(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 4)
    return CFSTR("Unknown");
  else
    return off_1000144F0[a1 - 1];
}

void sub_1000064C0(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  ResourceHintWithProperties *v11;
  void *v12;
  ResourceHintWithProperties *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  id v23;

  v2 = (void *)os_transaction_create("com.apple.powerexperienced.resourcehint");
  objc_msgSend(*(id *)(a1 + 32), "setTransaction:", v2);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v3 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithInteger:", (int)objc_msgSend(v16, "processIdentifier"));
  v4 = qword_10001BE18;
  if (os_log_type_enabled((os_log_t)qword_10001BE18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "restoring resources from %@", buf, 0xCu);
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = *(id *)(a1 + 40);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v9);
        v11 = [ResourceHintWithProperties alloc];
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v10));
        v13 = -[ResourceHintWithProperties initWithResourceHint:andPid:](v11, "initWithResourceHint:andPid:", v12, v3);

        if (v13)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "resourceHints"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[ResourceHintWithProperties description](v13, "description"));
          objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, v15);

        }
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  objc_msgSend(*(id *)(a1 + 32), "evaluatePowerModes");
  objc_msgSend(*(id *)(a1 + 32), "setTransaction:", 0);

}

void sub_100006844(uint64_t a1)
{
  id v2;
  ResourceHintWithProperties *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;

  v2 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithInteger:", (int)objc_msgSend(*(id *)(a1 + 32), "processIdentifier"));
  v3 = -[ResourceHintWithProperties initWithResourceHint:andPid:]([ResourceHintWithProperties alloc], "initWithResourceHint:andPid:", *(_QWORD *)(a1 + 40), v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "resourceHints"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "description"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, v5);

  v6 = (void *)qword_10001BE18;
  if (os_log_type_enabled((os_log_t)qword_10001BE18, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(void **)(a1 + 40);
    v8 = v6;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "description"));
    v10 = *(_QWORD *)(a1 + 56);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ResourceHintWithProperties pid](v3, "pid"));
    v14 = 138413058;
    v15 = v9;
    v16 = 2112;
    v17 = v10;
    v18 = 2112;
    v19 = v11;
    v20 = 2048;
    v21 = -[ResourceHintWithProperties state](v3, "state");
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "ResourceManager: creating resource %@ with UUID %@ for pid %@ with state: %lu", (uint8_t *)&v14, 0x2Au);

  }
  objc_msgSend(*(id *)(a1 + 48), "evaluatePowerModes");
  objc_msgSend(*(id *)(a1 + 48), "saveState:", v3);
  v12 = *(void **)(a1 + 48);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ResourceHintWithProperties pid](v3, "pid"));
  objc_msgSend(v12, "monitorProcessExit:", objc_msgSend(v13, "intValue"));

  objc_msgSend(*(id *)(a1 + 48), "setTransaction:", 0);
}

void sub_100006B14(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  ResourceHintWithProperties *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  int v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;

  v2 = (void *)os_transaction_create("com.apple.powerexperienced.resourcehint");
  objc_msgSend(*(id *)(a1 + 32), "setTransaction:", v2);

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "resourceHints"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "description"));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v4));

  v6 = (ResourceHintWithProperties *)v5;
  if (!v5)
  {
    v7 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithInteger:", (int)objc_msgSend(*(id *)(a1 + 48), "processIdentifier"));
    v6 = -[ResourceHintWithProperties initWithResourceHint:andPid:]([ResourceHintWithProperties alloc], "initWithResourceHint:andPid:", *(_QWORD *)(a1 + 40), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "resourceHints"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ResourceHintWithProperties description](v6, "description"));
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, v9);

    v10 = (void *)qword_10001BE18;
    if (os_log_type_enabled((os_log_t)qword_10001BE18, OS_LOG_TYPE_INFO))
    {
      v11 = *(void **)(a1 + 40);
      v12 = v10;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "description"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[ResourceHintWithProperties uuid](v6, "uuid"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[ResourceHintWithProperties pid](v6, "pid"));
      v27 = 138413058;
      v28 = v13;
      v29 = 2112;
      v30 = v14;
      v31 = 2112;
      v32 = v15;
      v33 = 2048;
      v34 = -[ResourceHintWithProperties state](v6, "state");
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "ResourceManager: updateResourceHint creating resource %@ with UUID %@ for pid %@ with state: %lu", (uint8_t *)&v27, 0x2Au);

    }
    v16 = *(void **)(a1 + 32);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ResourceHintWithProperties pid](v6, "pid"));
    objc_msgSend(v16, "monitorProcessExit:", objc_msgSend(v17, "intValue"));

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  v18 = objc_msgSend(*(id *)(a1 + 40), "state");
  v19 = -[ResourceHintWithProperties state](v6, "state");
  if (!v5 || v18 != v19)
  {
    v20 = (void *)qword_10001BE18;
    if (os_log_type_enabled((os_log_t)qword_10001BE18, OS_LOG_TYPE_DEFAULT))
    {
      v21 = *(void **)(a1 + 40);
      v22 = v20;
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "uuid"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "description"));
      v25 = -[ResourceHintWithProperties state](v6, "state");
      v26 = objc_msgSend(*(id *)(a1 + 40), "state");
      v27 = 138413058;
      v28 = v23;
      v29 = 2112;
      v30 = v24;
      v31 = 2048;
      v32 = v25;
      v33 = 2048;
      v34 = v26;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "updating resource state for %@:%@ from %lu to %lu", (uint8_t *)&v27, 0x2Au);

    }
    -[ResourceHintWithProperties setState:](v6, "setState:", objc_msgSend(*(id *)(a1 + 40), "state"));
    objc_msgSend(*(id *)(a1 + 32), "evaluatePowerModes");
    objc_msgSend(*(id *)(a1 + 32), "saveState:", v6);
  }
  objc_msgSend(*(id *)(a1 + 32), "setTransaction:", 0);

}

void sub_100007010(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  v2 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithInteger:", *(int *)(a1 + 40));
  objc_msgSend(v1, "handleProcessExit:", v2);

}

id sub_1000078D0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "evaluatePowerModes");
}

void sub_100007B60(id a1)
{
  ResourceManager *v1;
  void *v2;

  v1 = objc_alloc_init(ResourceManager);
  v2 = (void *)qword_10001BE20;
  qword_10001BE20 = (uint64_t)v1;

}

void sub_100007E0C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

id sub_1000083A0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleBatteryLevelChange");
}

id sub_1000083A8(uint64_t a1, uint64_t a2)
{
  NSNumber *v3;
  void *v4;
  void *v5;

  v3 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", IOPSDrawingUnlimitedPower(a1, a2));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "currentContext"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("kPluggedInContext"));

  return objc_msgSend(*(id *)(a1 + 32), "handleBatteryLevelChange");
}

void sub_10000853C(id a1)
{
  DeviceContext *v1;
  void *v2;

  v1 = objc_alloc_init(DeviceContext);
  v2 = (void *)qword_10001BE40;
  qword_10001BE40 = (uint64_t)v1;

}

void sub_1000086DC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100008734(id a1)
{
  os_log_t v1;
  void *v2;
  PowerModesService *v3;
  void *v4;

  v1 = os_log_create("com.apple.powerexperienced", "powermodesserice");
  v2 = (void *)qword_10001BE60;
  qword_10001BE60 = (uint64_t)v1;

  v3 = objc_alloc_init(PowerModesService);
  v4 = (void *)qword_10001BE50;
  qword_10001BE50 = (uint64_t)v3;

}

void sub_100008A70(uint64_t a1)
{
  void *v2;
  id v3;
  __int128 v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  _QWORD v20[5];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  int v30;
  _BYTE v31[128];

  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "clients"));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v22;
    *(_QWORD *)&v4 = 138412802;
    v19 = v4;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "interestedModes", v19));
        v10 = objc_msgSend(v9, "containsObject:", *(_QWORD *)(a1 + 40));

        if (v10)
        {
          v11 = (void *)qword_10001BE60;
          if (os_log_type_enabled((os_log_t)qword_10001BE60, OS_LOG_TYPE_DEFAULT))
          {
            v12 = v11;
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifer"));
            v14 = *(_QWORD *)(a1 + 40);
            v15 = *(unsigned __int8 *)(a1 + 48);
            *(_DWORD *)buf = v19;
            v26 = v13;
            v27 = 2112;
            v28 = v14;
            v29 = 1024;
            v30 = v15;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Updating client %@ for mode %@:%d", buf, 0x1Cu);

          }
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "connection"));

          if (v16)
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "connection"));
            v20[0] = _NSConcreteStackBlock;
            v20[1] = 3221225472;
            v20[2] = sub_100008CA8;
            v20[3] = &unk_100014670;
            v20[4] = v8;
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "remoteObjectProxyWithErrorHandler:", v20));
            objc_msgSend(v18, "updateState:forMode:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));

          }
        }
      }
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
    }
    while (v5);
  }

}

void sub_100008CA8(uint64_t a1)
{
  NSObject *v2;

  v2 = qword_10001BE60;
  if (os_log_type_enabled((os_log_t)qword_10001BE60, OS_LOG_TYPE_ERROR))
    sub_10000D134(a1, v2);
}

void sub_100008DD8(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  PowerModesClient *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;

  v2 = qword_10001BE60;
  if (os_log_type_enabled((os_log_t)qword_10001BE60, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v7 = 138412546;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Registering client %@ for modes %@", (uint8_t *)&v7, 0x16u);
  }
  v5 = -[PowerModesClient initWithConnection:identifier:interestedModes:]([PowerModesClient alloc], "initWithConnection:identifier:interestedModes:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "clients"));
  objc_msgSend(v6, "addObject:", v5);

}

void start()
{
  void *v0;
  id v1;
  uint64_t v2;
  void *v3;
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;

  v0 = objc_autoreleasePoolPush();
  v1 = sub_1000090D4();
  v2 = objc_claimAutoreleasedReturnValue(v1);
  v3 = (void *)qword_10001BEF0;
  qword_10001BEF0 = v2;

  v4 = sub_1000090D4();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  dispatch_sync(v5, &stru_1000146B8);

  v6 = sub_1000090D4();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  xpc_set_event_stream_handler("com.apple.notifyd.matching", v7, &stru_1000146F8);

  dispatch_main();
}

id sub_1000090D4()
{
  if (qword_10001BE68 != -1)
    dispatch_once(&qword_10001BE68, &stru_100014718);
  return (id)qword_10001BEF0;
}

void sub_100009114(id a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[ResourceManager sharedInstance](ResourceManager, "sharedInstance"));
  objc_msgSend(v5, "start");
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[SignalMonitor sharedInstance](SignalMonitor, "sharedInstance"));
  objc_msgSend(v1, "start");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[DeviceContext sharedInstance](DeviceContext, "sharedInstance"));
  objc_msgSend(v2, "start");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PowerModesService sharedInstance](PowerModesService, "sharedInstance"));
  objc_msgSend(v3, "start");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[PowerModesManager sharedInstance](PowerModesManager, "sharedInstance"));
  objc_msgSend(v4, "start");

}

void sub_1000091C8(id a1, OS_xpc_object *a2)
{
  OS_xpc_object *v2;
  void *v3;
  id v4;

  v2 = a2;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[SignalMonitor sharedInstance](SignalMonitor, "sharedInstance"));
  objc_msgSend(v4, "handleXPCEvent:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[DeviceContext sharedInstance](DeviceContext, "sharedInstance"));
  objc_msgSend(v3, "handleXPCEvent:", v2);

}

void sub_100009238(id a1)
{
  dispatch_queue_attr_t v1;
  dispatch_queue_t v2;
  void *v3;
  NSObject *v4;

  v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = objc_claimAutoreleasedReturnValue(v1);
  v2 = dispatch_queue_create("com.apple.powerexperieced.mainQueue", v4);
  v3 = (void *)qword_10001BEF0;
  qword_10001BEF0 = (uint64_t)v2;

}

void sub_1000092C8(id a1)
{
  SMCSensorExchangeHelper *v1;
  void *v2;

  v1 = objc_alloc_init(SMCSensorExchangeHelper);
  v2 = (void *)qword_10001BE78;
  qword_10001BE78 = (uint64_t)v1;

}

void sub_1000096D0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_100009780(uint64_t a1)
{
  CameraMonitor *v1;
  void *v2;

  v1 = -[CameraMonitor initWithQueue:]([CameraMonitor alloc], "initWithQueue:", *(_QWORD *)(a1 + 32));
  v2 = (void *)qword_10001BE98;
  qword_10001BE98 = (uint64_t)v1;

}

void sub_100009B04(id a1)
{
  SignalMonitor *v1;
  void *v2;

  v1 = objc_alloc_init(SignalMonitor);
  v2 = (void *)qword_10001BEA0;
  qword_10001BEA0 = (uint64_t)v1;

}

id sub_100009D18(uint64_t a1)
{
  const char *string;
  id result;

  string = xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 32), _xpc_event_key_name);
  if (!strcmp(string, "com.apple.request.hipuncap"))
    return objc_msgSend(*(id *)(a1 + 40), "handleNFCSession");
  result = (id)strcmp(string, "com.apple.coreaudio.IORunning");
  if (!(_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 40), "handleAudioSession");
  return result;
}

id sub_10000A1C4(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v5[16];

  v2 = qword_10001BEB0;
  if (os_log_type_enabled((os_log_t)qword_10001BEB0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "NFC session ended. Dropping the resource hint", v5, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "setNfcActive:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "nfcResourceHint"));
  objc_msgSend(v3, "updateState:", 0);

  return objc_msgSend(*(id *)(a1 + 32), "setNfcTransaction:", 0);
}

void sub_10000A368(id a1)
{
  CLPCPolicyInterfaceHelper *v1;
  void *v2;

  v1 = objc_alloc_init(CLPCPolicyInterfaceHelper);
  v2 = (void *)qword_10001BEC8;
  qword_10001BEC8 = (uint64_t)v1;

}

void sub_10000A7CC(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;

  v2 = objc_alloc_init((Class)NSMutableDictionary);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[RestrictedPerfMode powerModeInstance](RestrictedPerfMode, "powerModeInstance"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKeyedSubscript:", v5, CFSTR("RestrictedPerfMode"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[InUseChargingMode powerModeInstance](InUseChargingMode, "powerModeInstance"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKeyedSubscript:", v6, CFSTR("InUseChargingMode"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[AcceleratedChargingMode powerModeInstance](AcceleratedChargingMode, "powerModeInstance"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKeyedSubscript:", v7, CFSTR("AcceleratedChargingMode"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[LongChargingMode powerModeInstance](LongChargingMode, "powerModeInstance"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKeyedSubscript:", v8, CFSTR("LongChargingMode"));

  v9 = qword_10001BED8;
  if (os_log_type_enabled((os_log_t)qword_10001BED8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v11 = 138412290;
    v12 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Initialized power modes %@", (uint8_t *)&v11, 0xCu);
  }
}

void sub_10000A99C(id a1)
{
  os_log_t v1;
  void *v2;
  PowerModesManager *v3;
  void *v4;

  v1 = os_log_create("com.apple.powerexperienced", "powermodesmanager");
  v2 = (void *)qword_10001BED8;
  qword_10001BED8 = (uint64_t)v1;

  v3 = objc_alloc_init(PowerModesManager);
  v4 = (void *)qword_10001BEE0;
  qword_10001BEE0 = (uint64_t)v3;

}

id sub_10000AB7C(uint64_t a1, uint64_t a2)
{
  int v3;
  void *v4;

  v3 = MKBDeviceUnlockedSinceBoot(a1, a2);
  v4 = *(void **)(a1 + 32);
  if (v3)
    return objc_msgSend(v4, "restoreState");
  else
    return objc_msgSend(v4, "clearState");
}

id sub_10000AE70(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;

  v2 = qword_10001BED8;
  if (os_log_type_enabled((os_log_t)qword_10001BED8, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Evaluating power modes for device context change %@", (uint8_t *)&v5, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 40), "evaluatePowerModes");
}

void sub_10000B3A4(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  int v17;
  void *v18;
  __int16 v19;
  uint64_t v20;

  objc_msgSend(*(id *)(a1 + 32), "setPendingDelayedEntryTimer:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "overridePresent"));

  if (!v2)
  {
    v3 = (void *)qword_10001BED8;
    if (os_log_type_enabled((os_log_t)qword_10001BED8, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 48);
      v5 = v3;
      v6 = (objc_class *)objc_opt_class(v4);
      v7 = NSStringFromClass(v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      v9 = *(_QWORD *)(a1 + 56);
      v17 = 138412546;
      v18 = v8;
      v19 = 2048;
      v20 = v9;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Evaluating %@ after entry delay %f seconds", (uint8_t *)&v17, 0x16u);

    }
    v10 = *(void **)(a1 + 48);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "resourceManager"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "resourceHints"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "deviceContext"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "currentContext"));
    LODWORD(v10) = objc_msgSend(v10, "evaluatePowerModeWithResourceHints:andContext:", v12, v14);

    v15 = *(void **)(a1 + 40);
    v16 = *(_QWORD *)(a1 + 48);
    if ((_DWORD)v10)
      objc_msgSend(v15, "enterMode:", v16);
    else
      objc_msgSend(v15, "exitMode:", v16);
  }
}

id sub_10000B988(uint64_t a1)
{
  id result;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;

  result = objc_msgSend(*(id *)(a1 + 32), "getState");
  if ((_DWORD)result)
  {
    v3 = (void *)qword_10001BED8;
    if (os_log_type_enabled((os_log_t)qword_10001BED8, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = v3;
      v6 = (objc_class *)objc_opt_class(v4);
      v7 = NSStringFromClass(v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      v9 = *(_QWORD *)(a1 + 48);
      v10 = 138412546;
      v11 = v8;
      v12 = 2048;
      v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Exiting mode %@ after max engagement duration %f", (uint8_t *)&v10, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "updateExitReason:", 4);
    return objc_msgSend(*(id *)(a1 + 40), "exitMode:", *(_QWORD *)(a1 + 32));
  }
  return result;
}

void sub_10000C1B8(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void (*v5)(void);
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v2 = a1 + 40;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "getModeFromName:", *(_QWORD *)(a1 + 40)));
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "disablePowerMode");
    objc_msgSend(*(id *)(a1 + 32), "exitMode:", v4);
    v5 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    v6 = qword_10001BED8;
    if (os_log_type_enabled((os_log_t)qword_10001BED8, OS_LOG_TYPE_ERROR))
      sub_10000D4B8(v2, v6, v7, v8, v9, v10, v11, v12);
    v5 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  v5();

}

void sub_10000C310(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void (*v5)(void);
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v2 = a1 + 40;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "getModeFromName:", *(_QWORD *)(a1 + 40)));
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "enablePowerMode");
    v5 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    v6 = qword_10001BED8;
    if (os_log_type_enabled((os_log_t)qword_10001BED8, OS_LOG_TYPE_ERROR))
      sub_10000D4B8(v2, v6, v7, v8, v9, v10, v11, v12);
    v5 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  v5();

}

void sub_10000C46C(uint64_t a1)
{
  uint64_t *v2;
  void *v3;
  int v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(void);
  uint64_t v18;
  int v19;
  uint64_t v20;

  v2 = (uint64_t *)(a1 + 40);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "getModeFromName:", *(_QWORD *)(a1 + 40)));
  if (v3)
  {
    v4 = *(unsigned __int8 *)(a1 + 56);
    v5 = qword_10001BED8;
    v6 = os_log_type_enabled((os_log_t)qword_10001BED8, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v6)
      {
        v7 = *v2;
        v19 = 138412290;
        v20 = v7;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "OVERRIDE: Entering %@", (uint8_t *)&v19, 0xCu);
      }
      objc_msgSend(*(id *)(a1 + 32), "enterMode:", v3);
      v8 = *(void **)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 40);
    }
    else
    {
      if (v6)
      {
        v18 = *v2;
        v19 = 138412290;
        v20 = v18;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "OVERRIDE: Exiting %@", (uint8_t *)&v19, 0xCu);
      }
      objc_msgSend(*(id *)(a1 + 32), "exitMode:", v3);
      v8 = *(void **)(a1 + 32);
      v9 = 0;
    }
    objc_msgSend(v8, "setOverridePresent:", v9);
    v17 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    v10 = qword_10001BED8;
    if (os_log_type_enabled((os_log_t)qword_10001BED8, OS_LOG_TYPE_ERROR))
      sub_10000D4B8((uint64_t)v2, v10, v11, v12, v13, v14, v15, v16);
    v17 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  v17();

}

void sub_10000C6BC(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "getModeFromName:", *(_QWORD *)(a1 + 40)));
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "allowOnCharger:", *(unsigned __int8 *)(a1 + 56));
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "evaluatePowerModes");

}

void sub_10000C7F4(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "getModeFromName:", *(_QWORD *)(a1 + 40)));
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "updateEntryDelay:", *(double *)(a1 + 56));
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void sub_10000C924(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "getModeFromName:", *(_QWORD *)(a1 + 40)));
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "updateMaxEngagementDuration:", *(double *)(a1 + 56));
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void sub_10000CB2C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_10000CDE4(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to initialize predictor", v1, 2u);
}

void sub_10000CE24(_QWORD *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", *a1));
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Failed to fetch prediction for scheme %@: %@", (uint8_t *)&v6, 0x16u);

}

void sub_10000CEE0(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error creating CLPC User Client %@", (uint8_t *)&v2, 0xCu);
}

void sub_10000CF54(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "No powerlog identifier found", v1, 2u);
}

void sub_10000CF94(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007E0C((void *)&_mh_execute_header, a2, a3, "removing resourcehint %@", a5, a6, a7, a8, 2u);
}

void sub_10000CFFC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007E0C((void *)&_mh_execute_header, a2, a3, "savedResourcesMutable %@", a5, a6, a7, a8, 2u);
}

void sub_10000D064(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "failed to init mach service", v1, 2u);
}

void sub_10000D0A4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000086DC((void *)&_mh_execute_header, a1, a3, "Failed to register for battery level updates", a5, a6, a7, a8, 0);
  sub_1000086EC();
}

void sub_10000D0D4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000086DC((void *)&_mh_execute_header, a1, a3, "Failed to register for power source updates", a5, a6, a7, a8, 0);
  sub_1000086EC();
}

void sub_10000D104(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000086DC((void *)&_mh_execute_header, a1, a3, "Failed to register for lock state update", a5, a6, a7, a8, 0);
  sub_1000086EC();
}

void sub_10000D134(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unable to update client %@", (uint8_t *)&v3, 0xCu);
}

void sub_10000D1AC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000096D0((void *)&_mh_execute_header, a2, a3, "Failed to write SDRC key. Error 0x%x", a5, a6, a7, a8, 0);
  sub_1000086EC();
}

void sub_10000D210(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000096D0((void *)&_mh_execute_header, a2, a3, "Failed to connect to SMC 0x%x", a5, a6, a7, a8, 0);
  sub_1000086EC();
}

void sub_10000D274(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Key not found", v1, 2u);
  sub_1000086EC();
}

void sub_10000D2B0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000A31C();
  sub_1000086DC((void *)&_mh_execute_header, v0, v1, "Failed to register for Audio notifications", v2, v3, v4, v5, v6);
  sub_1000086EC();
}

void sub_10000D2DC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000A31C();
  sub_1000086DC((void *)&_mh_execute_header, v0, v1, "Failed to get current audio status", v2, v3, v4, v5, v6);
  sub_1000086EC();
}

void sub_10000D308()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000A31C();
  sub_1000086DC((void *)&_mh_execute_header, v0, v1, "Failed to register for NFC notifications", v2, v3, v4, v5, v6);
  sub_1000086EC();
}

void sub_10000D334()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000A31C();
  sub_1000086DC((void *)&_mh_execute_header, v0, v1, "Failed to get current nfc status", v2, v3, v4, v5, v6);
  sub_1000086EC();
}

void sub_10000D360(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "CLPC client not initialized", v1, 2u);
}

void sub_10000D3A0(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;

  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to update CLPC with power target for mode %@. Error: %@", (uint8_t *)&v3, 0x16u);
}

void sub_10000D424(void *a1, void *a2)
{
  NSObject *v3;
  _DWORD v4[2];

  v3 = a1;
  v4[0] = 67109120;
  v4[1] = objc_msgSend(a2, "processIdentifier");
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "PowerModesManager: rejected new connection from pid %d. Not entitled", (uint8_t *)v4, 8u);

  sub_10000CB3C();
}

void sub_10000D4B8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000CB2C((void *)&_mh_execute_header, a2, a3, "Unable to find mode %@", a5, a6, a7, a8, 2u);
  sub_10000CB3C();
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUID");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUIDString");
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activate");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObserver_forKeyPath_options_context_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:forKeyPath:options:context:");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allKeys");
}

id objc_msgSend_allowOnCharger(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allowOnCharger");
}

id objc_msgSend_allowOnCharger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allowOnCharger:");
}

id objc_msgSend_appliesChargingPolicy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appliesChargingPolicy");
}

id objc_msgSend_appliesPowerTarget(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appliesPowerTarget");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_audioResourceHint(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "audioResourceHint");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_cameraResourceHint(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cameraResourceHint");
}

id objc_msgSend_cameraViewfinder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cameraViewfinder");
}

id objc_msgSend_chargePredictionOutputOfScheme_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "chargePredictionOutputOfScheme:withError:");
}

id objc_msgSend_chargingPredictor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "chargingPredictor");
}

id objc_msgSend_clientResponsible(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientResponsible");
}

id objc_msgSend_clients(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clients");
}

id objc_msgSend_clpcClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clpcClient");
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connection");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createClient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createClient:");
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentConnection");
}

id objc_msgSend_currentContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentContext");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateWithTimeIntervalSinceNow:");
}

id objc_msgSend_defaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaults");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_deviceContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceContext");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_disablePowerMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disablePowerMode");
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "distantFuture");
}

id objc_msgSend_enablePowerMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enablePowerMode");
}

id objc_msgSend_enabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enabled");
}

id objc_msgSend_endingSOC(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endingSOC");
}

id objc_msgSend_enterMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enterMode:");
}

id objc_msgSend_enterPowerMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enterPowerMode");
}

id objc_msgSend_evaluatePowerModeWithResourceHints_andContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "evaluatePowerModeWithResourceHints:andContext:");
}

id objc_msgSend_evaluatePowerModes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "evaluatePowerModes");
}

id objc_msgSend_evaluatePowerModes_withContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "evaluatePowerModes:withContext:");
}

id objc_msgSend_exitMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "exitMode:");
}

id objc_msgSend_exitPowerMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "exitPowerMode");
}

id objc_msgSend_exitReason(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "exitReason");
}

id objc_msgSend_getEntryDelay(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getEntryDelay");
}

id objc_msgSend_getMaxEngagementDuration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getMaxEngagementDuration");
}

id objc_msgSend_getModeFromName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getModeFromName:");
}

id objc_msgSend_getSavedExitDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getSavedExitDate:");
}

id objc_msgSend_getState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getState");
}

id objc_msgSend_handleLockStateChange(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleLockStateChange");
}

id objc_msgSend_handleProcessExit_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleProcessExit:");
}

id objc_msgSend_handleXPCEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleXPCEvent:");
}

id objc_msgSend_identifer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifer");
}

id objc_msgSend_inTypicalUsageEnvironment(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inTypicalUsageEnvironment");
}

id objc_msgSend_initAudioHandling(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initAudioHandling");
}

id objc_msgSend_initNFCHandling(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initNFCHandling");
}

id objc_msgSend_initPowerSourceChange(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initPowerSourceChange");
}

id objc_msgSend_initWithConnection_identifier_interestedModes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithConnection:identifier:interestedModes:");
}

id objc_msgSend_initWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithInt:");
}

id objc_msgSend_initWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithInteger:");
}

id objc_msgSend_initWithProperties_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithProperties:");
}

id objc_msgSend_initWithQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithQueue:");
}

id objc_msgSend_initWithResourceHint_andPid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithResourceHint:andPid:");
}

id objc_msgSend_initWithResourceType_andState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithResourceType:andState:");
}

id objc_msgSend_initWithSuiteName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSuiteName:");
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUUIDString:");
}

id objc_msgSend_initializeAllModes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initializeAllModes");
}

id objc_msgSend_initializeMonitors(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initializeMonitors");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_interestedModes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interestedModes");
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEnabled");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToDate:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isSupportedPlatform(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSupportedPlatform");
}

id objc_msgSend_lastEntryTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastEntryTime");
}

id objc_msgSend_lastExitTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastExitTime");
}

id objc_msgSend_lastPluggedInState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastPluggedInState");
}

id objc_msgSend_log(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "log");
}

id objc_msgSend_logCAEventforMode_startDate_endDate_startingSOC_endingSOC_exitReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logCAEventforMode:startDate:endDate:startingSOC:endingSOC:exitReason:");
}

id objc_msgSend_logStatusToPowerLog(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logStatusToPowerLog");
}

id objc_msgSend_logger(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logger");
}

id objc_msgSend_longChargeExpected(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "longChargeExpected");
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainQueue");
}

id objc_msgSend_meetsSystemConfidenceThreshold(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "meetsSystemConfidenceThreshold");
}

id objc_msgSend_monitorProcessExit_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "monitorProcessExit:");
}

id objc_msgSend_monitorWithQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "monitorWithQueue:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_nfcActive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nfcActive");
}

id objc_msgSend_nfcResourceHint(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nfcResourceHint");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithLong:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_overridePresent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "overridePresent");
}

id objc_msgSend_pendingDelayedEntryTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pendingDelayedEntryTimer");
}

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pid");
}

id objc_msgSend_powerModeInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "powerModeInstance");
}

id objc_msgSend_powerModes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "powerModes");
}

id objc_msgSend_powerModesService(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "powerModesService");
}

id objc_msgSend_powerlogIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "powerlogIdentifier");
}

id objc_msgSend_predictionAvailableForScheme_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predictionAvailableForScheme:");
}

id objc_msgSend_predictionQueryQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predictionQueryQueue");
}

id objc_msgSend_predictor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predictor");
}

id objc_msgSend_predictorOutput(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predictorOutput");
}

id objc_msgSend_predictorReady(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predictorReady");
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processIdentifier");
}

id objc_msgSend_processMonitors(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processMonitors");
}

id objc_msgSend_queryModelForScheme_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queryModelForScheme:");
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queue");
}

id objc_msgSend_remoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeResourceHint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeResourceHint:");
}

id objc_msgSend_removeState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeState:");
}

id objc_msgSend_resourceHints(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resourceHints");
}

id objc_msgSend_resourceManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resourceManager");
}

id objc_msgSend_resourceType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resourceType");
}

id objc_msgSend_restoreState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "restoreState");
}

id objc_msgSend_restoreState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "restoreState:");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_saveState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveState");
}

id objc_msgSend_saveState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveState:");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "set");
}

id objc_msgSend_setAllowOnCharger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowOnCharger:");
}

id objc_msgSend_setAppliesChargingPolicy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAppliesChargingPolicy:");
}

id objc_msgSend_setAppliesPowerTarget_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAppliesPowerTarget:");
}

id objc_msgSend_setAudioActive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAudioActive:");
}

id objc_msgSend_setAudioResourceHint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAudioResourceHint:");
}

id objc_msgSend_setCameraResourceHint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCameraResourceHint:");
}

id objc_msgSend_setClientResponsible_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClientResponsible:");
}

id objc_msgSend_setClients_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClients:");
}

id objc_msgSend_setClpcClient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClpcClient:");
}

id objc_msgSend_setContextualPowerMode_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContextualPowerMode:options:error:");
}

id objc_msgSend_setCurrentActiveMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentActiveMode:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDelegate_queue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:queue:");
}

id objc_msgSend_setEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEnabled:");
}

id objc_msgSend_setEndingSOC_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEndingSOC:");
}

id objc_msgSend_setEntryDelay_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEntryDelay:");
}

id objc_msgSend_setExitReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExitReason:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setHotInPocketMode_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHotInPocketMode:options:error:");
}

id objc_msgSend_setLastEntryTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastEntryTime:");
}

id objc_msgSend_setLastExitTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastExitTime:");
}

id objc_msgSend_setLastPluggedInState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastPluggedInState:");
}

id objc_msgSend_setLog_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLog:");
}

id objc_msgSend_setMaxEngagementDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMaxEngagementDuration:");
}

id objc_msgSend_setNfcActive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNfcActive:");
}

id objc_msgSend_setNfcResourceHint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNfcResourceHint:");
}

id objc_msgSend_setNfcTransaction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNfcTransaction:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOverridePresent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOverridePresent:");
}

id objc_msgSend_setPendingDelayedEntryTimer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPendingDelayedEntryTimer:");
}

id objc_msgSend_setPid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPid:");
}

id objc_msgSend_setPowerlogIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPowerlogIdentifier:");
}

id objc_msgSend_setQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setQueue:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setResourceType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setResourceType:");
}

id objc_msgSend_setStartingSOC_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStartingSOC:");
}

id objc_msgSend_setState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setState:");
}

id objc_msgSend_setSupportedPlatform_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSupportedPlatform:");
}

id objc_msgSend_setTransaction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTransaction:");
}

id objc_msgSend_setUuid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUuid:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_shortChargeExpected(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shortChargeExpected");
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "start");
}

id objc_msgSend_startWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startWithOptions:");
}

id objc_msgSend_startingSOC(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startingSOC");
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "state");
}

id objc_msgSend_supportedPlatform(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportedPlatform");
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceNow");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntValue");
}

id objc_msgSend_updateCLTMChargingPolicy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateCLTMChargingPolicy:");
}

id objc_msgSend_updateChargingPolicy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateChargingPolicy");
}

id objc_msgSend_updateClientsforMode_withState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateClientsforMode:withState:");
}

id objc_msgSend_updateEntryDelay_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateEntryDelay:");
}

id objc_msgSend_updateExitReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateExitReason:");
}

id objc_msgSend_updateMaxEngagementDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateMaxEngagementDuration:");
}

id objc_msgSend_updatePowerTarget(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updatePowerTarget");
}

id objc_msgSend_updatePowerTargetForMode_withState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updatePowerTargetForMode:withState:");
}

id objc_msgSend_updateState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateState:");
}

id objc_msgSend_updateState_forMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateState:forMode:");
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uuid");
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_willChangeValueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "willChangeValueForKey:");
}
