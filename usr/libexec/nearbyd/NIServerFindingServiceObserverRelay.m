@implementation NIServerFindingServiceObserverRelay

+ (id)sharedInstance
{
  if (qword_1008590A8 != -1)
    dispatch_once(&qword_1008590A8, &stru_10080E1A8);
  return (id)qword_1008590A0;
}

- (NIServerFindingServiceObserverRelay)init
{
  NIServerFindingServiceObserverRelay *v2;
  uint64_t v3;
  void *v4;
  NSMutableDictionary *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NIServerFindingServiceObserverRelay;
  v2 = -[NIServerFindingServiceObserverRelay init](&v8, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToWeakObjectsMapTable](NSMapTable, "strongToWeakObjectsMapTable"));
    v4 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v3;

    v5 = objc_opt_new(NSMutableDictionary);
    v6 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v5;

  }
  return v2;
}

- (void)addObserver:(id)a3 identifier:(id)a4 token:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  std::mutex::lock((std::mutex *)((char *)self + 24));
  -[NIServerFindingServiceObserverRelay _cleanupStaleObservers](self, "_cleanupStaleObservers");
  v11 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138543362;
    v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#find-ses,Add observer to relay: %{public}@", (uint8_t *)&v14, 0xCu);
  }
  objc_msgSend(*((id *)self + 1), "setObject:forKey:", v8, v9);
  objc_msgSend(*((id *)self + 2), "setObject:forKey:", v10, v9);
  std::mutex::unlock((std::mutex *)((char *)self + 24));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerFindingServicePool sharedInstance](NIServerFindingServicePool, "sharedInstance"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "serviceForToken:createIfNotExists:", v10, 0));
  objc_msgSend(v13, "relayInfoToNewObserver:", v8);

}

- (void)removeObserverWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int v7;
  id v8;

  v4 = a3;
  std::mutex::lock((std::mutex *)((char *)self + 24));
  -[NIServerFindingServiceObserverRelay _cleanupStaleObservers](self, "_cleanupStaleObservers");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)self + 2), "objectForKey:", v4));

  if (v5)
  {
    v6 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138543362;
      v8 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#find-ses,Remove observer from relay: %{public}@", (uint8_t *)&v7, 0xCu);
    }
    objc_msgSend(*((id *)self + 1), "removeObjectForKey:", v4);
    objc_msgSend(*((id *)self + 2), "removeObjectForKey:", v4);
  }
  std::mutex::unlock((std::mutex *)((char *)self + 24));

}

- (id)observerTokens
{
  std::mutex *v3;
  void *v4;

  v3 = (std::mutex *)((char *)self + 24);
  std::mutex::lock((std::mutex *)((char *)self + 24));
  -[NIServerFindingServiceObserverRelay _cleanupStaleObservers](self, "_cleanupStaleObservers");
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)self + 2), "allValues"));
  std::mutex::unlock(v3);
  return v4;
}

- (void)relayToObserversForToken:(id)a3 blockToRelay:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  void *i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = (void (**)(id, void *))a4;
  std::mutex::lock((std::mutex *)((char *)self + 24));
  -[NIServerFindingServiceObserverRelay _cleanupStaleObservers](self, "_cleanupStaleObservers");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)self + 1), "keyEnumerator"));
  for (i = 0; ; i = (void *)v9)
  {
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "nextObject"));

    if (!v9)
      break;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)self + 1), "objectForKey:", v9));
    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)self + 2), "objectForKey:", v9));
      v12 = v11;
      if (v11)
      {
        if (objc_msgSend(v11, "isEqual:", v13))
          v6[2](v6, v10);
      }

    }
  }

  std::mutex::unlock((std::mutex *)((char *)self + 24));
}

- (void)_cleanupStaleObservers
{
  void *v3;
  void *v4;
  _QWORD v5[5];
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  NSMutableArray *v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_1001ECF94;
  v11 = sub_1001ECFA4;
  v12 = objc_opt_new(NSMutableArray);
  v3 = (void *)*((_QWORD *)self + 2);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1001F508C;
  v6[3] = &unk_10080E1D0;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v6);
  v4 = (void *)v8[5];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001F5104;
  v5[3] = &unk_10080AD38;
  v5[4] = self;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);
  _Block_object_dispose(&v7, 8);

}

- (void).cxx_destruct
{
  std::mutex::~mutex((std::mutex *)((char *)self + 24));
  objc_storeStrong((id *)self + 2, 0);
  objc_storeStrong((id *)self + 1, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 850045863;
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_QWORD *)self + 10) = 0;
  return self;
}

@end
