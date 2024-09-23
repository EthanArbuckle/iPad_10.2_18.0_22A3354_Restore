@implementation NIServerFindingServicePool

- (NIServerFindingServicePool)init
{
  NIServerFindingServicePool *v2;
  NSMutableDictionary *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  _QWORD v8[4];
  NIServerFindingServicePool *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NIServerFindingServicePool;
  v2 = -[NIServerFindingServicePool init](&v10, "init");
  if (v2)
  {
    v3 = objc_opt_new(NSMutableDictionary);
    v4 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v3;

    sub_1001C4AA4((_QWORD *)v2 + 2, 0x32uLL);
    sub_1001C4AA4((_QWORD *)v2 + 8, 6uLL);
    *((_DWORD *)v2 + 60) = 0;
    if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild")
      || (v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults")),
          v6 = objc_msgSend(v5, "BOOLForKey:", CFSTR("EnableStateDump")),
          v5,
          v6))
    {
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_1001EBFDC;
      v8[3] = &unk_10080A8A0;
      v9 = v2;
      os_state_add_handler(&_dispatch_main_q, v8);

    }
  }
  return v2;
}

+ (id)sharedInstance
{
  if (qword_100859098 != -1)
    dispatch_once(&qword_100859098, &stru_10080E070);
  return (id)qword_100859090;
}

- (void)setService:(id)a3 forToken:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  id v14;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    std::mutex::lock((std::mutex *)((char *)self + 112));
    if (!v6)
    {
      v11 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 138543362;
        v14 = v7;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#find-ses,FindingServicePool remove service for token: %{public}@", (uint8_t *)&v13, 0xCu);
      }
      objc_msgSend(*((id *)self + 1), "removeObjectForKey:", v7);
      goto LABEL_13;
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)self + 1), "objectForKeyedSubscript:", v7));

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)self + 1), "objectForKeyedSubscript:", v7));
      v10 = objc_msgSend(v9, "isEqual:", v6);

      if ((v10 & 1) != 0)
      {
LABEL_13:
        std::mutex::unlock((std::mutex *)((char *)self + 112));
        goto LABEL_14;
      }
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
        sub_1003DAF6C();
    }
    else
    {
      v12 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 138543362;
        v14 = v7;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#find-ses,FindingServicePool replace nil service for token: %{public}@. Race condition (OK)", (uint8_t *)&v13, 0xCu);
      }
    }
    objc_msgSend(*((id *)self + 1), "setObject:forKey:", v6, v7);
    goto LABEL_13;
  }
LABEL_14:

}

- (id)serviceForToken:(id)a3 createIfNotExists:(BOOL)a4
{
  id v6;
  std::mutex *v7;
  NSObject *v8;
  id *v9;
  void *v10;
  _BOOL4 v11;
  uint64_t v12;
  void *v13;
  NIServerFindingService *v14;
  void *v15;
  uint8_t buf[4];
  id v18;

  v6 = a3;
  v7 = (std::mutex *)((char *)self + 112);
  std::mutex::lock((std::mutex *)((char *)self + 112));
  if (a4)
  {
    v8 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#find-ses,FindingServicePool provide service for token: %{public}@", buf, 0xCu);
    }
    v9 = (id *)((char *)self + 8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)self + 1), "objectForKeyedSubscript:", v6));
    v11 = v10 == 0;

    if (v11)
    {
      v12 = *((unsigned int *)self + 60);
      *((_DWORD *)self + 60) = v12 + 1;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.nearbyd.finding.service-%d"), v12));
      if (*((int *)self + 60) >= 100)
        *((_DWORD *)self + 60) = 0;
      v14 = -[NIServerFindingService initWithLabel:]([NIServerFindingService alloc], "initWithLabel:", v13);
      objc_msgSend(*v9, "setObject:forKeyedSubscript:", v14, v6);

    }
  }
  else
  {
    v9 = (id *)((char *)self + 8);
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v9, "objectForKeyedSubscript:", v6));
  std::mutex::unlock(v7);

  return v15;
}

- (void)logSessionEvent:(id)a3
{
  id v4;

  v4 = a3;
  std::mutex::lock((std::mutex *)((char *)self + 176));
  sub_1002B6BBC(v4, (_QWORD *)self + 2);
  std::mutex::unlock((std::mutex *)((char *)self + 176));

}

- (void)logSessionSummary:(id)a3
{
  id v4;

  v4 = a3;
  std::mutex::lock((std::mutex *)((char *)self + 176));
  sub_1002B6BBC(v4, (_QWORD *)self + 8);
  std::mutex::unlock((std::mutex *)((char *)self + 176));

}

- (id)printableState
{
  NSMutableArray *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  char v18;
  _QWORD *v19;
  __int128 v20;
  void *v21;
  char v22;
  void **v23;
  void *v24;
  unint64_t v25;
  void *v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  _QWORD *v31;
  __int128 v32;
  void **v33;
  void *v34;
  unint64_t v35;
  void *v37;
  void *__p[2];
  uint64_t v39;

  v3 = objc_opt_new(NSMutableArray);
  std::mutex::lock((std::mutex *)((char *)self + 112));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Active sessions (%d)"), objc_msgSend(*((id *)self + 1), "count")));
  -[NSMutableArray addObject:](v3, "addObject:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)self + 1), "allKeys"));
  v6 = sub_1002B6FA8(v5, 10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  -[NSMutableArray addObjectsFromArray:](v3, "addObjectsFromArray:", v7);

  std::mutex::unlock((std::mutex *)((char *)self + 112));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerFindingServiceObserverRelay sharedInstance](NIServerFindingServiceObserverRelay, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "observerTokens"));

  v37 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Observers (%d)"), objc_msgSend(v9, "count")));
  -[NSMutableArray addObject:](v3, "addObject:", v10);

  v11 = sub_1002B6FA8(v9, 10, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  -[NSMutableArray addObjectsFromArray:](v3, "addObjectsFromArray:", v12);

  std::mutex::lock((std::mutex *)((char *)self + 176));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Session summaries (max %d)"), *((_QWORD *)self + 13)));
  -[NSMutableArray addObject:](v3, "addObject:", v13);

  v14 = *((_QWORD *)self + 9);
  if (*((_QWORD *)self + 10) != v14)
  {
    v15 = *((_QWORD *)self + 12);
    v16 = *(_QWORD *)(v14 + 8 * (v15 / 0xAA)) + 24 * (v15 % 0xAA);
    v17 = *(_QWORD *)(v14 + 8 * ((*((_QWORD *)self + 13) + v15) / 0xAA)) + 24 * ((*((_QWORD *)self + 13) + v15) % 0xAA);
    if (v16 != v17)
    {
      v18 = 0;
      v19 = (_QWORD *)(v14 + 8 * (v15 / 0xAA));
      do
      {
        if (*(char *)(v16 + 23) < 0)
        {
          sub_100004678(__p, *(void **)v16, *(_QWORD *)(v16 + 8));
        }
        else
        {
          v20 = *(_OWORD *)v16;
          v39 = *(_QWORD *)(v16 + 16);
          *(_OWORD *)__p = v20;
        }
        v21 = (void *)HIBYTE(v39);
        v22 = HIBYTE(v39);
        if (v39 < 0)
          v21 = __p[1];
        if (v21)
        {
          -[NSMutableArray addObject:](v3, "addObject:", CFSTR("-----"));
          if (v39 >= 0)
            v23 = __p;
          else
            v23 = (void **)__p[0];
          v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), v23));
          -[NSMutableArray addObject:](v3, "addObject:", v24);

          v18 = 1;
          v22 = HIBYTE(v39);
        }
        if (v22 < 0)
          operator delete(__p[0]);
        v16 += 24;
        if (v16 - *v19 == 4080)
        {
          v25 = v19[1];
          ++v19;
          v16 = v25;
        }
      }
      while (v16 != v17);
      if ((v18 & 1) != 0)
        -[NSMutableArray addObject:](v3, "addObject:", CFSTR("-----"));
    }
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Session events (max %d)"), *((_QWORD *)self + 7)));
  -[NSMutableArray addObject:](v3, "addObject:", v26);

  v27 = *((_QWORD *)self + 3);
  if (*((_QWORD *)self + 4) != v27)
  {
    v28 = *((_QWORD *)self + 6);
    v29 = *(_QWORD *)(v27 + 8 * (v28 / 0xAA)) + 24 * (v28 % 0xAA);
    v30 = *(_QWORD *)(v27 + 8 * ((*((_QWORD *)self + 7) + v28) / 0xAA)) + 24 * ((*((_QWORD *)self + 7) + v28) % 0xAA);
    if (v29 != v30)
    {
      v31 = (_QWORD *)(v27 + 8 * (v28 / 0xAA));
      do
      {
        if (*(char *)(v29 + 23) < 0)
        {
          sub_100004678(__p, *(void **)v29, *(_QWORD *)(v29 + 8));
        }
        else
        {
          v32 = *(_OWORD *)v29;
          v39 = *(_QWORD *)(v29 + 16);
          *(_OWORD *)__p = v32;
        }
        if (SHIBYTE(v39) < 0)
        {
          if (!__p[1])
            goto LABEL_33;
          v33 = (void **)__p[0];
        }
        else
        {
          if (!HIBYTE(v39))
            goto LABEL_34;
          v33 = __p;
        }
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("    %s"), v33));
        -[NSMutableArray addObject:](v3, "addObject:", v34);

        if (SHIBYTE(v39) < 0)
LABEL_33:
          operator delete(__p[0]);
LABEL_34:
        v29 += 24;
        if (v29 - *v31 == 4080)
        {
          v35 = v31[1];
          ++v31;
          v29 = v35;
        }
      }
      while (v29 != v30);
    }
  }
  std::mutex::unlock((std::mutex *)((char *)self + 176));

  return v3;
}

- (void).cxx_destruct
{
  std::mutex::~mutex((std::mutex *)((char *)self + 176));
  std::mutex::~mutex((std::mutex *)((char *)self + 112));
  sub_1001CCC90((_QWORD *)self + 8);
  sub_1001CCC90((_QWORD *)self + 2);
  objc_storeStrong((id *)self + 1, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((_QWORD *)self + 14) = 850045863;
  *(_OWORD *)((char *)self + 120) = 0u;
  *(_OWORD *)((char *)self + 136) = 0u;
  *(_OWORD *)((char *)self + 152) = 0u;
  *((_QWORD *)self + 21) = 0;
  *((_QWORD *)self + 22) = 850045863;
  *(_OWORD *)((char *)self + 184) = 0u;
  *(_OWORD *)((char *)self + 200) = 0u;
  *(_OWORD *)((char *)self + 216) = 0u;
  *((_QWORD *)self + 29) = 0;
  return self;
}

@end
