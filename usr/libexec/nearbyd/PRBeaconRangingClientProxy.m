@implementation PRBeaconRangingClientProxy

- (PRBeaconRangingClientProxy)initWithConnection:(id)a3 queue:(id)a4
{
  id v7;
  id v8;
  PRBeaconRangingClientProxy *v9;
  PRBeaconRangingClientProxy *v10;
  void *v11;
  PRNSXPCConnection *v12;
  void *v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  NSObject *v17;
  PRBeaconRangingClientProxy *v18;
  void *v20;
  __int128 buf;
  objc_super v22;
  PRBeaconRangingClientProxy *v23;

  v23 = self;
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRBeaconRangingClientProxy.mm"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("connection"));

  }
  v22.receiver = self;
  v22.super_class = (Class)PRBeaconRangingClientProxy;
  v23 = 0;
  v9 = -[PRBeaconRangingClientProxy init](&v22, "init");
  v10 = v9;
  v23 = v9;
  if (v9)
  {
    *((_BYTE *)v9 + 44) = 0;
    v11 = (void *)*((_QWORD *)v9 + 4);
    *((_QWORD *)v9 + 4) = 0;

    v12 = -[PRNSXPCConnection initWithConnection:]([PRNSXPCConnection alloc], "initWithConnection:", v7);
    v13 = (void *)*((_QWORD *)v10 + 1);
    *((_QWORD *)v10 + 1) = v12;

    sub_10003DFA4((void **)&v23, &buf);
    sub_1000145E8((uint64_t)v23 + 16, &buf);
    v14 = (std::__shared_weak_count *)*((_QWORD *)&buf + 1);
    if (*((_QWORD *)&buf + 1))
    {
      v15 = (unint64_t *)(*((_QWORD *)&buf + 1) + 8);
      do
        v16 = __ldaxr(v15);
      while (__stlxr(v16 - 1, v15));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
        std::__shared_weak_count::__release_weak(v14);
      }
    }
    *((_DWORD *)v23 + 10) = 0;
  }
  v17 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "PRBeaconRangingClientProxy init", (uint8_t *)&buf, 2u);
  }
  v18 = v23;

  return v18;
}

- (void)connectWithClientInfo:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  unsigned int v12;

  v5 = a3;
  v6 = (id)qword_10085F520;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", PRProcessNameKey));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", PRProcessIdentifierKey));
    v9 = 138412546;
    v10 = v7;
    v11 = 1024;
    v12 = objc_msgSend(v8, "intValue");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PRBeaconRanging: XPC connection created. Process name: %@, pid: %d", (uint8_t *)&v9, 0x12u);

  }
  objc_storeStrong((id *)self + 4, a3);
  -[PRBeaconRangingClientProxy activate](self, "activate");

}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  if (!*((_BYTE *)self + 44))
    -[PRBeaconRangingClientProxy terminate](self, "terminate");
  objc_msgSend(*((id *)self + 1), "invalidate");
  v3 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "PRBeaconRangingClientProxy dealloc", buf, 2u);
  }
  v4.receiver = self;
  v4.super_class = (Class)PRBeaconRangingClientProxy;
  -[PRBeaconRangingClientProxy dealloc](&v4, "dealloc");
}

- (void)activate
{
  void *v3;
  std::__shared_weak_count *v4;
  unint64_t *v5;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  void *v10;
  unint64_t *v11;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;

  v3 = sub_1002CA108();
  sub_10001ADBC(&v17, (_QWORD *)(*((_QWORD *)self + 2) + 8));
  v18 = v17;
  v17 = 0uLL;
  sub_1002CE308((uint64_t)v3, (unint64_t *)&v18);
  v4 = (std::__shared_weak_count *)*((_QWORD *)&v18 + 1);
  if (*((_QWORD *)&v18 + 1))
  {
    v5 = (unint64_t *)(*((_QWORD *)&v18 + 1) + 8);
    do
      v6 = __ldaxr(v5);
    while (__stlxr(v6 - 1, v5));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  v7 = (std::__shared_weak_count *)*((_QWORD *)&v17 + 1);
  if (*((_QWORD *)&v17 + 1))
  {
    v8 = (unint64_t *)(*((_QWORD *)&v17 + 1) + 8);
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  v10 = sub_1002CA108();
  sub_10001ADBC(&v17, (_QWORD *)(*((_QWORD *)self + 2) + 8));
  v16 = v17;
  if (*((_QWORD *)&v17 + 1))
  {
    v11 = (unint64_t *)(*((_QWORD *)&v17 + 1) + 16);
    do
      v12 = __ldxr(v11);
    while (__stxr(v12 + 1, v11));
  }
  sub_1002CA79C((uint64_t)v10, (uint64_t *)&v16);
  if (*((_QWORD *)&v16 + 1))
    std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v16 + 1));
  v13 = (std::__shared_weak_count *)*((_QWORD *)&v17 + 1);
  if (*((_QWORD *)&v17 + 1))
  {
    v14 = (unint64_t *)(*((_QWORD *)&v17 + 1) + 8);
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
}

- (void)terminate
{
  void *v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  std::__shared_weak_count *v12;

  v3 = sub_1002CA108();
  v4 = (std::__shared_weak_count *)*((_QWORD *)self + 3);
  v11 = *((_QWORD *)self + 2);
  v12 = v4;
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v6 = __ldxr(p_shared_owners);
    while (__stxr(v6 + 1, p_shared_owners));
  }
  sub_1002CE3E0((uint64_t)v3, &v11);
  v7 = v12;
  if (v12)
  {
    v8 = (unint64_t *)&v12->__shared_owners_;
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  *((_BYTE *)self + 44) = 1;
  v10 = (void *)*((_QWORD *)self + 18);
  *((_QWORD *)self + 18) = 0;

}

- (void)didFailWithError:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = (void *)*((_QWORD *)self + 1);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003B9AC;
  v7[3] = &unk_1007FA308;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "actOnRemoteObjectAndScheduleBarrierBlock:", v7);

}

- (void)didReceiveNewSolutions:(id)a3
{
  void *v4;
  double v5;
  double v6;
  id v7;
  id v8;
  double v9;
  uint64_t v10;
  void *i;
  void *v12;
  char v13;
  NSObject *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[2];
  _BYTE buf[22];
  _BYTE v27[128];

  v18 = a3;
  v4 = (void *)*((_QWORD *)self + 18);
  v25[0] = (char *)self + 144;
  v25[1] = voucher_adopt(v4);
  if (*((_WORD *)self + 20))
  {
    v5 = sub_10000883C();
    v6 = *((double *)self + 6);
    std::mutex::lock((std::mutex *)((char *)self + 80));
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v7 = v18;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    if (v8)
    {
      v9 = v5 - v6;
      v10 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
          *(_QWORD *)buf = objc_msgSend(v12, "mac_addr");
          *(double *)&buf[8] = v9;
          sub_10003E050((uint64_t **)self + 7, (unint64_t *)buf, (uint64_t *)buf);
          if ((v13 & 1) != 0)
          {
            v14 = (id)qword_10085F520;
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              v15 = objc_msgSend(v12, "mac_addr");
              *(_DWORD *)buf = 134283777;
              *(_QWORD *)&buf[4] = v15;
              *(_WORD *)&buf[12] = 2050;
              *(double *)&buf[14] = v9;
              _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "PtsSession, responder, %{private}llx, latency, %{public}0.3f", buf, 0x16u);
            }

          }
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
      }
      while (v8);
    }

    std::mutex::unlock((std::mutex *)((char *)self + 80));
  }
  v16 = (void *)*((_QWORD *)self + 1);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10003BCF4;
  v19[3] = &unk_1007FA308;
  v17 = v18;
  v20 = v17;
  objc_msgSend(v16, "actOnRemoteObjectAndScheduleBarrierBlock:", v19);

  sub_10001AE30((uint64_t)v25);
}

- (void)rangingServiceDidUpdateState:(unint64_t)a3 cause:(int64_t)a4
{
  void *v4;
  _QWORD v5[6];

  v4 = (void *)*((_QWORD *)self + 1);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003BDD4;
  v5[3] = &unk_1007FA350;
  v5[4] = a3;
  v5[5] = a4;
  objc_msgSend(v4, "actOnRemoteObjectAndScheduleBarrierBlock:", v5);
}

- (void)rangingRequestDidUpdateStatus:(unint64_t)a3
{
  void *v4;
  char *v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[2];

  v5 = (char *)self + 144;
  v4 = (void *)*((_QWORD *)self + 18);
  v8[0] = (char *)self + 144;
  v8[1] = voucher_adopt(v4);
  v6 = (void *)*((_QWORD *)v5 - 17);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003BEF4;
  v7[3] = &unk_1007FA370;
  v7[4] = a3;
  objc_msgSend(v6, "actOnRemoteObjectAndScheduleBarrierBlock:", v7);
  sub_10001AE30((uint64_t)v8);
}

- (void)startBeaconing:(int64_t)a3 options:(id)a4 reply:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD, void *);
  NSObject *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  NSErrorUserInfoKey v17;
  const __CFString *v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  unsigned int v22;

  v8 = a4;
  v9 = (void (**)(id, _QWORD, void *))a5;
  v10 = (id)qword_10085F520;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)self + 4), "objectForKey:", PRProcessNameKey));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)self + 4), "objectForKey:", PRProcessIdentifierKey));
    *(_DWORD *)buf = 138412546;
    v20 = v11;
    v21 = 1024;
    v22 = objc_msgSend(v12, "intValue");
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "PRBeaconRanging: XPC command - startBeaconing. Process name: %@, pid: %d", buf, 0x12u);

  }
  if (a3 == 1)
  {
    v13 = voucher_copy(-[PRBeaconRangingClientProxy enablePTSInitiating:reply:](self, "enablePTSInitiating:reply:", v8, v9));
    v14 = (void *)*((_QWORD *)self + 18);
    *((_QWORD *)self + 18) = v13;
  }
  else
  {
    v17 = NSLocalizedDescriptionKey;
    v18 = CFSTR("Asked to enable unsupported ranging subtype.");
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
    v16 = PRErrorWithCodeAndUserInfo(100, v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v16);

    v9[2](v9, 0, v14);
  }

}

- (void)stopBeaconing:(int64_t)a3 reply:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSErrorUserInfoKey v14;
  const __CFString *v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  unsigned int v19;

  v6 = (void (**)(id, _QWORD, void *))a4;
  v7 = (id)qword_10085F520;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)self + 4), "objectForKey:", PRProcessNameKey));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)self + 4), "objectForKey:", PRProcessIdentifierKey));
    *(_DWORD *)buf = 138412546;
    v17 = v8;
    v18 = 1024;
    v19 = objc_msgSend(v9, "intValue");
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "PRBeaconRanging: XPC command - stopBeaconing. Process name: %@, pid: %d", buf, 0x12u);

  }
  v10 = (void *)*((_QWORD *)self + 18);
  *((_QWORD *)self + 18) = 0;

  if (a3 == 1)
  {
    -[PRBeaconRangingClientProxy disablePTSInitiating:](self, "disablePTSInitiating:", v6);
  }
  else
  {
    v14 = NSLocalizedDescriptionKey;
    v15 = CFSTR("Asked to disable unsupported ranging subtype.");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
    v12 = PRErrorWithCodeAndUserInfo(100, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

    v6[2](v6, 0, v13);
  }

}

- (void)pushBeaconAllowlist:(id)a3 reply:(id)a4
{
  NSObject *v6;
  id v7;
  void *v8;
  PRBeaconRangingClientProxy *v9;
  NSObject *v10;
  unsigned __int8 v11;
  id v12;
  void *v13;
  NSObject *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  id v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  void *v23;
  char *v24;
  char *v25;
  char v26;
  void *v28;
  _QWORD *v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void (**v39)(id, _QWORD, void *);
  id v40;
  int v41;
  char v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  id v47;
  id v48;
  _QWORD v49[3];
  _QWORD *v50;
  NSErrorUserInfoKey v51;
  const __CFString *v52;
  _BYTE v53[128];
  uint8_t buf[24];
  NSErrorUserInfoKey v55;
  const __CFString *v56;

  v40 = a3;
  v39 = (void (**)(id, _QWORD, void *))a4;
  v48 = v39;
  v6 = (id)qword_10085F520;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)self + 4), "objectForKey:", PRProcessNameKey));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)self + 4), "objectForKey:", PRProcessIdentifierKey));
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v7;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = objc_msgSend(v8, "intValue");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PRBeaconRanging: XPC command - pushBeaconAllowlist. Process name: %@, pid: %d", buf, 0x12u);

  }
  if (!objc_msgSend(v40, "count"))
  {
    v55 = NSLocalizedDescriptionKey;
    v56 = CFSTR("Must provide at least one beacon to allowlist.");
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1));
    v32 = PRErrorWithCodeAndUserInfo(106, v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
    v39[2](v39, 0, v33);

LABEL_31:
    v37 = v39;
    goto LABEL_38;
  }
  v9 = self;
  objc_sync_enter(v9);
  if (*((_WORD *)v9 + 21))
    goto LABEL_9;
  v10 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "No beacon listener job defined. Creating.", buf, 2u);
  }
  v47 = 0;
  v11 = -[PRBeaconRangingClientProxy createBeaconListenerJob:](v9, "createBeaconListenerJob:", &v47);
  v12 = v47;
  v13 = v12;
  if ((v11 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003CBA9C();
    v39[2](v39, 0, v13);

    objc_sync_exit(v9);
    goto LABEL_31;
  }

LABEL_9:
  objc_sync_exit(v9);

  v14 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v40;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "PRBeaconClient: allowlist the following devices: %@", buf, 0xCu);
  }
  memset(buf, 0, sizeof(buf));
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v15 = v40;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v44;
    while (2)
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v44 != v17)
          objc_enumerationMutation(v15);
        v19 = *(id *)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)i);
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "btAdvAddress"));
        if (!v20
          || (v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "btAdvAddress")),
              v22 = objc_msgSend(v21, "length") == (id)6,
              v21,
              v20,
              !v22))
        {
          v51 = NSLocalizedDescriptionKey;
          v52 = CFSTR("Beacon has invalid BT Adv Address.");
          v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1, v9));
          v35 = PRErrorWithCodeAndUserInfo(106, v34);
          v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
          v39[2](v39, 0, v36);

          goto LABEL_35;
        }
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "btAdvAddress"));
        objc_msgSend(v23, "getBytes:length:", &v41, 6);

        v24 = (char *)&v41 + 1;
        v25 = &v42;
        do
        {
          v26 = *(v24 - 1);
          *(v24 - 1) = *v25;
          *v25-- = v26;
        }
        while (v24++ < v25);
        sub_10003CA08((void **)buf, &v41);

      }
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
      if (v16)
        continue;
      break;
    }
  }

  v28 = sub_1002CA108();
  v49[0] = off_1007FADC8;
  v49[1] = &v48;
  v50 = v49;
  sub_1002CC8DC((uint64_t)v28, (uint64_t)buf, (uint64_t)v49);
  v29 = v50;
  if (v50 == v49)
  {
    v30 = 4;
    v29 = v49;
  }
  else
  {
    if (!v50)
      goto LABEL_34;
    v30 = 5;
  }
  v29 = (_QWORD *)(*(uint64_t (**)(void))(*v29 + 8 * v30))();
LABEL_34:
  v38 = voucher_copy(v29);
  v15 = (id)*((_QWORD *)v9 + 18);
  *((_QWORD *)v9 + 18) = v38;
LABEL_35:

  if (*(_QWORD *)buf)
  {
    *(_QWORD *)&buf[8] = *(_QWORD *)buf;
    operator delete(*(void **)buf);
  }
  v37 = v48;
LABEL_38:

}

- (void)clearBeaconAllowlist:(id)a3
{
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[3];
  _QWORD *v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  unsigned int v17;

  v11 = a3;
  v4 = (id)qword_10085F520;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)self + 4), "objectForKey:", PRProcessNameKey));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)self + 4), "objectForKey:", PRProcessIdentifierKey));
    *(_DWORD *)buf = 138412546;
    v15 = v5;
    v16 = 1024;
    v17 = objc_msgSend(v6, "intValue");
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "PRBeaconRanging: XPC command - clearBeaconAllowlist. Process name: %@, pid: %d", buf, 0x12u);

  }
  v7 = (void *)*((_QWORD *)self + 18);
  *((_QWORD *)self + 18) = 0;

  v8 = sub_1002CA108();
  v12[0] = off_1007FAE58;
  v12[1] = &v11;
  v13 = v12;
  sub_1002CCB10((uint64_t)v8, (uint64_t)v12);
  v9 = v13;
  if (v13 == v12)
  {
    v10 = 4;
    v9 = v12;
    goto LABEL_7;
  }
  if (v13)
  {
    v10 = 5;
LABEL_7:
    (*(void (**)(void))(*v9 + 8 * v10))();
  }

}

- (void)enablePTSInitiating:(id)a3 reply:(id)a4
{
  void (**v5)(id, _QWORD, void *);
  void *v6;
  uint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  char v18;
  id v19;
  void *v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  int v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  std::mutex *v28;
  _QWORD *v29;
  _QWORD *v30;
  NSObject *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  unint64_t *v41;
  unint64_t v42;
  __int128 v43;
  id v44;
  char v45;
  __int16 v46;
  uint64_t v47;
  std::__shared_weak_count *v48;
  NSErrorUserInfoKey v49;
  const __CFString *v50;
  __int128 buf;
  _BYTE v52[96];
  unsigned __int8 v53[408];
  NSErrorUserInfoKey v54;
  const __CFString *v55;
  NSErrorUserInfoKey v56;
  const __CFString *v57;

  v5 = (void (**)(id, _QWORD, void *))a4;
  v6 = sub_1002CA108();
  v7 = *((_QWORD *)v6 + 406);
  v8 = (std::__shared_weak_count *)*((_QWORD *)v6 + 407);
  v47 = v7;
  v48 = v8;
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v10 = __ldxr(p_shared_owners);
    while (__stxr(v10 + 1, p_shared_owners));
  }
  if (v7)
  {
    v46 = 0;
    if (sub_1002A4728(v7, &v45, (unsigned __int8 *)&v46, 0))
    {
      sub_100162A48(&v45, (uint64_t)v52);
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "URLForKey:", CFSTR("P2SConfigPlistPath")));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfURL:](NSDictionary, "dictionaryWithContentsOfURL:", v12));

      if (v13)
      {
        v14 = qword_10085F520;
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "============================================", (uint8_t *)&buf, 2u);
        }
        v15 = (id)qword_10085F520;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "description"));
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v16;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "PRBeaconRangingClientProxy options dict:\n%@", (uint8_t *)&buf, 0xCu);

        }
        v17 = qword_10085F520;
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "============================================", (uint8_t *)&buf, 2u);
        }
        v44 = 0;
        v18 = sub_100010BA8(v13, v53, &v44);
        v19 = v44;
        v20 = v19;
        if ((v18 & 1) == 0)
        {
          if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
            sub_1003CBAC8();
          v5[2](v5, 0, v20);

LABEL_36:
          v8 = v48;
          if (!v48)
            goto LABEL_41;
          goto LABEL_37;
        }

      }
      v21 = (std::__shared_weak_count *)sub_1002CA108();
      sub_10001ADBC(&buf, (_QWORD *)(*((_QWORD *)self + 2) + 8));
      v43 = buf;
      if (*((_QWORD *)&buf + 1))
      {
        v22 = (unint64_t *)(*((_QWORD *)&buf + 1) + 16);
        do
          v23 = __ldxr(v22);
        while (__stxr(v23 + 1, v22));
      }
      v24 = sub_1002CA950(v21, (uint64_t *)&v43, (uint64_t)v52);
      if (*((_QWORD *)&v43 + 1))
        std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v43 + 1));
      v25 = (std::__shared_weak_count *)*((_QWORD *)&buf + 1);
      if (*((_QWORD *)&buf + 1))
      {
        v26 = (unint64_t *)(*((_QWORD *)&buf + 1) + 8);
        do
          v27 = __ldaxr(v26);
        while (__stlxr(v27 - 1, v26));
        if (!v27)
        {
          ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
          std::__shared_weak_count::__release_weak(v25);
        }
      }
      if ((v24 & 0xFF0000) != 0)
      {
        *((double *)self + 6) = sub_10000883C();
        v28 = (std::mutex *)((char *)self + 80);
        std::mutex::lock((std::mutex *)((char *)self + 80));
        v30 = (_QWORD *)*((_QWORD *)self + 8);
        v29 = (_QWORD *)((char *)self + 64);
        sub_10003E3F0((uint64_t)(v29 - 1), v30);
        *(v29 - 1) = v29;
        *v29 = 0;
        v29[1] = 0;
        std::mutex::unlock(v28);
        *((_WORD *)v29 - 12) = v24;
        v5[2](v5, 1, 0);
        v31 = qword_10085F520;
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "PtsSession, start", (uint8_t *)&buf, 2u);
        }
      }
      else
      {
        v49 = NSLocalizedDescriptionKey;
        v50 = CFSTR("Register for service failed");
        v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1, (_QWORD)v43));
        v39 = PRErrorWithCodeAndUserInfo(101, v38);
        v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
        v5[2](v5, 0, v40);

      }
      goto LABEL_36;
    }
    v54 = NSLocalizedDescriptionKey;
    v55 = CFSTR("Failed to prepare service request.");
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1));
    v36 = PRErrorWithCodeAndUserInfo(101, v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
    v5[2](v5, 0, v37);

  }
  else
  {
    v56 = NSLocalizedDescriptionKey;
    v57 = CFSTR("Configuration Manager Error.");
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1));
    v33 = PRErrorWithCodeAndUserInfo(999, v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    v5[2](v5, 0, v34);

  }
  if (!v8)
    goto LABEL_41;
LABEL_37:
  v41 = (unint64_t *)&v8->__shared_owners_;
  do
    v42 = __ldaxr(v41);
  while (__stlxr(v42 - 1, v41));
  if (!v42)
  {
    ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
    std::__shared_weak_count::__release_weak(v8);
  }
LABEL_41:

}

- (void)disablePTSInitiating:(id)a3
{
  double v4;
  double v5;
  double v6;
  int v7;
  NSObject *v8;
  char *v9;
  char *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  BOOL v16;
  void *v17;
  void *v18;
  unint64_t *v19;
  unint64_t v20;
  BOOL v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  PRBeaconRangingClientProxy *v30;
  std::mutex *v31;
  id v32;
  uint64_t v33;
  std::__shared_weak_count *v34;
  _QWORD v35[5];
  int v36;
  _QWORD v37[5];
  int v38;
  NSErrorUserInfoKey v39;
  const __CFString *v40;
  NSErrorUserInfoKey v41;
  const __CFString *v42;
  _BYTE buf[18];

  v32 = a3;
  v4 = sub_10000883C();
  v5 = *((double *)self + 6);
  std::mutex::lock((std::mutex *)((char *)self + 80));
  v31 = (std::mutex *)((char *)self + 80);
  v6 = v4 - v5;
  v7 = *((_DWORD *)self + 18);
  v8 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&buf[4] = v7;
    *(_WORD *)&buf[8] = 2048;
    *(double *)&buf[10] = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "PtsMetric, session, numOfResponders, %d, sessionDuration, %0.3f", buf, 0x12u);
  }
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_10003D7B4;
  v37[3] = &unk_1007FAD98;
  v38 = v7;
  *(double *)&v37[4] = v6;
  AnalyticsSendEventLazy(CFSTR("com.apple.nearbyd.PointToShareSession"), v37);
  v9 = (char *)*((_QWORD *)self + 7);
  v30 = self;
  v10 = (char *)self + 64;
  if (v9 != v10)
  {
    do
    {
      v11 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        v12 = *((_QWORD *)v9 + 5);
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)&buf[4] = v12;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v7;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "PtsMetric, responderLatency, %0.3f, numOfResponders, %d", buf, 0x12u);
      }
      v13 = *((_QWORD *)v9 + 5);
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_10003D8A8;
      v35[3] = &unk_1007FAD98;
      v35[4] = v13;
      v36 = v7;
      AnalyticsSendEventLazy(CFSTR("com.apple.nearbyd.PointToShareResponderLatency"), v35);
      v14 = (char *)*((_QWORD *)v9 + 1);
      if (v14)
      {
        do
        {
          v15 = v14;
          v14 = *(char **)v14;
        }
        while (v14);
      }
      else
      {
        do
        {
          v15 = (char *)*((_QWORD *)v9 + 2);
          v16 = *(_QWORD *)v15 == (_QWORD)v9;
          v9 = v15;
        }
        while (!v16);
      }
      v9 = v15;
    }
    while (v15 != v10);
  }
  std::mutex::unlock(v31);
  if (!*((_WORD *)v30 + 20))
  {
    v17 = v32;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003CBB28();
    v41 = NSLocalizedDescriptionKey;
    v42 = CFSTR("Asked to cancel, but no point to share initiator job defined");
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1));
    v26 = PRErrorWithCodeAndUserInfo(999, v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);

    (*((void (**)(id, _QWORD, void *))v32 + 2))(v32, 0, v27);
    goto LABEL_29;
  }
  v17 = v32;
  v18 = sub_1002CA108();
  sub_10001ADBC(buf, (_QWORD *)(*((_QWORD *)v30 + 2) + 8));
  v33 = *(_QWORD *)buf;
  v34 = *(std::__shared_weak_count **)&buf[8];
  if (*(_QWORD *)&buf[8])
  {
    v19 = (unint64_t *)(*(_QWORD *)&buf[8] + 16);
    do
      v20 = __ldxr(v19);
    while (__stxr(v20 + 1, v19));
  }
  v21 = sub_1002CAF88((uint64_t)v18, &v33, *((unsigned __int16 *)v30 + 20));
  if (v34)
    std::__shared_weak_count::__release_weak(v34);
  v22 = *(std::__shared_weak_count **)&buf[8];
  if (*(_QWORD *)&buf[8])
  {
    v23 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
    do
      v24 = __ldaxr(v23);
    while (__stlxr(v24 - 1, v23));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
      if (v21)
        goto LABEL_23;
      goto LABEL_28;
    }
  }
  if (!v21)
  {
LABEL_28:
    v39 = NSLocalizedDescriptionKey;
    v40 = CFSTR("Unregistering for service failed");
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1));
    v28 = PRErrorWithCodeAndUserInfo(999, v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    (*((void (**)(id, _QWORD, void *))v32 + 2))(v32, 0, v29);

LABEL_29:
    goto LABEL_30;
  }
LABEL_23:
  *((_WORD *)v30 + 20) = 0;
  (*((void (**)(id, uint64_t, _QWORD))v32 + 2))(v32, 1, 0);
LABEL_30:

}

- (BOOL)createBeaconListenerJob:(id *)a3
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  int v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  unint64_t *v31;
  unint64_t v32;
  __int128 v34;
  char v35;
  __int16 v36;
  uint64_t v37;
  std::__shared_weak_count *v38;
  NSErrorUserInfoKey v39;
  const __CFString *v40;
  __int128 v41;
  uint8_t buf[96];
  unsigned __int8 v43[408];
  NSErrorUserInfoKey v44;
  const __CFString *v45;
  NSErrorUserInfoKey v46;
  const __CFString *v47;

  v5 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PRBeaconRangingClientProxy::createBeaconListenerJob", buf, 2u);
  }
  v6 = sub_1002CA108();
  v7 = *((_QWORD *)v6 + 406);
  v8 = (std::__shared_weak_count *)*((_QWORD *)v6 + 407);
  v37 = v7;
  v38 = v8;
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v10 = __ldxr(p_shared_owners);
    while (__stxr(v10 + 1, p_shared_owners));
  }
  if (!v7)
  {
    if (!a3)
      goto LABEL_35;
    v46 = NSLocalizedDescriptionKey;
    v47 = CFSTR("Configuration Manager Error.");
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1));
    v26 = PRErrorWithCodeAndUserInfo(999, v25);
    *a3 = (id)objc_claimAutoreleasedReturnValue(v26);

    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003CBB54();
    goto LABEL_34;
  }
  v36 = 0;
  if (sub_1002A4728(v7, &v35, (unsigned __int8 *)&v36, 0))
  {
    sub_100162E8C(&v35, (uint64_t)buf);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "URLForKey:", CFSTR("P2SConfigPlistPath")));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfURL:](NSDictionary, "dictionaryWithContentsOfURL:", v12));

    if (!v13)
      goto LABEL_16;
    v14 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v41) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "============================================", (uint8_t *)&v41, 2u);
    }
    v15 = (id)qword_10085F520;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "description"));
      LODWORD(v41) = 138412290;
      *(_QWORD *)((char *)&v41 + 4) = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "PRBeaconRangingClientProxy responder options dict:\n%@", (uint8_t *)&v41, 0xCu);

    }
    v17 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v41) = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "============================================", (uint8_t *)&v41, 2u);
    }
    if ((sub_100010BA8(v13, v43, a3) & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003CBBAC();
    }
    else
    {
LABEL_16:
      v18 = (std::__shared_weak_count *)sub_1002CA108();
      sub_10001ADBC(&v41, (_QWORD *)(*((_QWORD *)self + 2) + 8));
      v34 = v41;
      if (*((_QWORD *)&v41 + 1))
      {
        v19 = (unint64_t *)(*((_QWORD *)&v41 + 1) + 16);
        do
          v20 = __ldxr(v19);
        while (__stxr(v20 + 1, v19));
      }
      v21 = sub_1002CA950(v18, (uint64_t *)&v34, (uint64_t)buf);
      if (*((_QWORD *)&v34 + 1))
        std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v34 + 1));
      v22 = (std::__shared_weak_count *)*((_QWORD *)&v41 + 1);
      if (*((_QWORD *)&v41 + 1))
      {
        v23 = (unint64_t *)(*((_QWORD *)&v41 + 1) + 8);
        do
          v24 = __ldaxr(v23);
        while (__stlxr(v24 - 1, v23));
        if (!v24)
        {
          ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
          std::__shared_weak_count::__release_weak(v22);
        }
      }
      if ((v21 & 0xFF0000) != 0)
      {
        *((_WORD *)self + 21) = v21;
        LOBYTE(a3) = 1;
        goto LABEL_44;
      }
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003CBB80();
      if (!a3)
      {
LABEL_44:

        v8 = v38;
        if (!v38)
          return (char)a3;
        goto LABEL_45;
      }
      v39 = NSLocalizedDescriptionKey;
      v40 = CFSTR("Failed to register for job: point to share responder");
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1));
      v30 = PRErrorWithCodeAndUserInfo(101, v29);
      *a3 = (id)objc_claimAutoreleasedReturnValue(v30);

    }
    LOBYTE(a3) = 0;
    goto LABEL_44;
  }
  if (a3)
  {
    v44 = NSLocalizedDescriptionKey;
    v45 = CFSTR("Failed to prepare service request.");
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1));
    v28 = PRErrorWithCodeAndUserInfo(101, v27);
    *a3 = (id)objc_claimAutoreleasedReturnValue(v28);

    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003CBB54();
LABEL_34:
    LOBYTE(a3) = 0;
  }
LABEL_35:
  if (!v8)
    return (char)a3;
LABEL_45:
  v31 = (unint64_t *)&v8->__shared_owners_;
  do
    v32 = __ldaxr(v31);
  while (__stlxr(v32 - 1, v31));
  if (!v32)
  {
    ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
    std::__shared_weak_count::__release_weak(v8);
  }
  return (char)a3;
}

- (NSDictionary)clientInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (unsigned)pointToShareInitiatorServiceId
{
  return *((_WORD *)self + 76);
}

- (void)setPointToShareInitiatorServiceId:(unsigned __int16)a3
{
  *((_WORD *)self + 76) = a3;
}

- (void).cxx_destruct
{

  std::mutex::~mutex((std::mutex *)((char *)self + 80));
  sub_10003E3F0((uint64_t)self + 56, *((_QWORD **)self + 8));
  objc_storeStrong((id *)self + 4, 0);
  sub_10001AE68((uint64_t)self + 16);
  objc_storeStrong((id *)self + 1, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 7) = (char *)self + 64;
  *((_QWORD *)self + 9) = 0;
  *((_QWORD *)self + 10) = 850045863;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  *(_OWORD *)((char *)self + 120) = 0u;
  *(_OWORD *)((char *)self + 136) = 0u;
  return self;
}

@end
