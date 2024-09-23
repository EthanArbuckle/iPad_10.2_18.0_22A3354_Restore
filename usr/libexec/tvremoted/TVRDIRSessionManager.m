@implementation TVRDIRSessionManager

- (TVRDIRSessionManager)init
{
  TVRDIRSessionManager *v2;
  TVRDIRSessionManager *v3;
  uint64_t v4;
  NSMutableDictionary *identifierToCandidateMap;
  uint64_t v6;
  NSMutableDictionary *identifierToDeviceMap;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TVRDIRSessionManager;
  v2 = -[TVRDIRSessionManager init](&v9, "init");
  v3 = v2;
  if (v2)
  {
    -[TVRDIRSessionManager _setupSession](v2, "_setupSession");
    v4 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    identifierToCandidateMap = v3->_identifierToCandidateMap;
    v3->_identifierToCandidateMap = (NSMutableDictionary *)v4;

    v6 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    identifierToDeviceMap = v3->_identifierToDeviceMap;
    v3->_identifierToDeviceMap = (NSMutableDictionary *)v6;

  }
  return v3;
}

- (void)_setupSession
{
  IRSession *v3;
  IRSession *irSession;

  if (!self->_irSession)
  {
    v3 = (IRSession *)objc_alloc_init((Class)IRSession);
    irSession = self->_irSession;
    self->_irSession = v3;

    -[IRSession setDelegate:](self->_irSession, "setDelegate:", self);
  }
}

- (void)_fetchServiceTokenWithCompletionHandler:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  IRServiceToken *serviceToken;
  void *v7;
  void *v8;
  id v9;
  IRServiceToken *v10;
  id v11;
  IRServiceToken *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  IRServiceToken *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  void (**v20)(_QWORD, _QWORD, _QWORD);
  id v21;
  uint8_t buf[4];
  IRServiceToken *v23;

  v4 = a3;
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))v4;
  serviceToken = self->_serviceToken;
  if (serviceToken)
  {
    (*((void (**)(id, IRServiceToken *, _QWORD))v4 + 2))(v4, serviceToken, 0);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dataForKey:", CFSTR("irServiceToken")));
    if (v8)
    {
      v21 = 0;
      v9 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(IRServiceToken), v8, &v21);
      v10 = (IRServiceToken *)objc_claimAutoreleasedReturnValue(v9);
      v11 = v21;
      v12 = self->_serviceToken;
      self->_serviceToken = v10;

      v13 = _TVRDIRLog();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      v15 = v14;
      if (v11)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          -[TVRDIRSessionManager _fetchServiceTokenWithCompletionHandler:].cold.1();

        ((void (**)(_QWORD, _QWORD, id))v5)[2](v5, 0, v11);
      }
      else
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v16 = self->_serviceToken;
          *(_DWORD *)buf = 138412290;
          v23 = v16;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Found token %@", buf, 0xCu);
        }

        v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDIRSessionManager serviceToken](self, "serviceToken"));
        ((void (**)(_QWORD, void *, _QWORD))v5)[2](v5, v17, 0);

      }
    }
    else
    {
      v11 = objc_msgSend(objc_alloc((Class)IRServiceParameters), "initWithServicePackage:", 1);
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = __64__TVRDIRSessionManager__fetchServiceTokenWithCompletionHandler___block_invoke;
      v18[3] = &unk_10001C670;
      v20 = v5;
      v19 = v7;
      +[IRSession createServiceWithParameters:reply:](IRSession, "createServiceWithParameters:reply:", v11, v18);

    }
  }

}

void __64__TVRDIRSessionManager__fetchServiceTokenWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __64__TVRDIRSessionManager__fetchServiceTokenWithCompletionHandler___block_invoke_2;
  v8[3] = &unk_10001C648;
  v9 = a3;
  v12 = *(id *)(a1 + 40);
  v10 = v5;
  v11 = *(id *)(a1 + 32);
  v6 = v5;
  v7 = v9;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);

}

void __64__TVRDIRSessionManager__fetchServiceTokenWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  NSObject *v18;
  id v19;
  id v20;
  uint8_t buf[4];
  uint64_t v22;

  v2 = a1 + 32;
  if (*(_QWORD *)(a1 + 32))
  {
    v3 = _TVRDIRLog();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __64__TVRDIRSessionManager__fetchServiceTokenWithCompletionHandler___block_invoke_2_cold_2(v2, v4, v5, v6, v7, v8, v9, v10);

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else if (*(_QWORD *)(a1 + 40))
  {
    v11 = _TVRDIRLog();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v22 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Obtained new token %@", buf, 0xCu);
    }

    v14 = *(_QWORD *)(a1 + 40);
    v20 = 0;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v14, 1, &v20));
    v16 = v20;
    if (v16)
    {
      v17 = _TVRDIRLog();
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        __64__TVRDIRSessionManager__fetchServiceTokenWithCompletionHandler___block_invoke_2_cold_1();
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "setObject:forKey:", v15, CFSTR("irServiceToken"));
      v19 = _TVRDIRLog();
      v18 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Stored token in user defaults", buf, 2u);
      }
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

- (void)pause
{
  void *v3;
  unsigned int v4;
  id v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDIRSessionManager irSession](self, "irSession"));
  if (v3)
  {
    v4 = -[TVRDIRSessionManager hasStarted](self, "hasStarted");

    if (v4)
    {
      v5 = _TVRDIRLog();
      v6 = objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDIRSessionManager irSession](self, "irSession"));
        *(_DWORD *)buf = 138543362;
        v11 = v7;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Pausing %{public}@", buf, 0xCu);

      }
      objc_initWeak((id *)buf, self);
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = __29__TVRDIRSessionManager_pause__block_invoke;
      v8[3] = &unk_10001C698;
      objc_copyWeak(&v9, (id *)buf);
      -[TVRDIRSessionManager _fetchServiceTokenWithCompletionHandler:](self, "_fetchServiceTokenWithCompletionHandler:", v8);
      objc_destroyWeak(&v9);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __29__TVRDIRSessionManager_pause__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *WeakRetained;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  uint8_t v13[16];

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = _TVRDIRLog();
    WeakRetained = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
      __29__TVRDIRSessionManager_pause__block_invoke_cold_1();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      v9 = objc_msgSend(objc_alloc((Class)IRConfiguration), "initWithServiceToken:", v5);
      objc_msgSend(v9, "setMode:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject irSession](WeakRetained, "irSession"));
      objc_msgSend(v10, "runWithConfiguration:", v9);

      v11 = _TVRDIRLog();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Updated config mode to paused", v13, 2u);
      }

    }
  }

}

- (void)invalidate
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;

  v3 = _TVRDIRLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDIRSessionManager irSession](self, "irSession"));
    v6 = 138543362;
    v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Invalidating %{public}@", (uint8_t *)&v6, 0xCu);

  }
  -[TVRDIRSessionManager _invalidate](self, "_invalidate");
}

- (id)_candidateForDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDIRSessionManager identifierToCandidateMap](self, "identifierToCandidateMap"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v5));

  if (!v7)
  {
    v7 = objc_msgSend(objc_alloc((Class)IRCandidate), "initWithCandidateIdentifier:", v5);
    v8 = objc_alloc_init((Class)IRNode);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_impl"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "alternateIdentifiers"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", TVRCMediaRemoteIDKey));
    objc_msgSend(v8, "setAvOutpuDeviceIdentifier:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "idsIdentifier"));
    objc_msgSend(v8, "setIdsIdentifier:", v12);

    if (objc_msgSend(v4, "connectionType") == (id)1)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_impl"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
      objc_msgSend(v8, "setRapportIdentifier:", v14);

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v8));
    objc_msgSend(v7, "updateNodes:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDIRSessionManager identifierToCandidateMap](self, "identifierToCandidateMap"));
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v7, v5);

  }
  return v7;
}

- (void)processNewDevices:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  id v24;
  id v25;
  NSObject *v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  void *j;
  void *v32;
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint8_t v50[128];
  uint8_t buf[4];
  id v52;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDIRSessionManager identifierToDeviceMap](self, "identifierToDeviceMap"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allValues"));
  v7 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v6));

  v40 = v4;
  v8 = objc_msgSend(v4, "mutableCopy");
  v39 = (void *)v7;
  objc_msgSend(v8, "minusSet:", v7);
  v9 = _TVRDIRLog();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v52 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "New devices %@", buf, 0xCu);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v12 = v8;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v46 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i);
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDIRSessionManager _candidateForDevice:](self, "_candidateForDevice:", v17));
        objc_msgSend(v11, "addObject:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDIRSessionManager identifierToDeviceMap](self, "identifierToDeviceMap"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "identifier"));
        objc_msgSend(v19, "setValue:forKey:", v17, v20);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    }
    while (v14);
  }

  v21 = _TVRDIRLog();
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v52 = v11;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Updating candidates %@", buf, 0xCu);
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDIRSessionManager irSession](self, "irSession"));
  objc_msgSend(v23, "updateCandidates:", v11);

  v24 = objc_msgSend(v39, "mutableCopy");
  objc_msgSend(v24, "minusSet:", v40);
  v25 = _TVRDIRLog();
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v52 = v24;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Devices to be removed %@", buf, 0xCu);
  }

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v27 = v24;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v42;
    do
    {
      for (j = 0; j != v29; j = (char *)j + 1)
      {
        if (*(_QWORD *)v42 != v30)
          objc_enumerationMutation(v27);
        v32 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)j);
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDIRSessionManager _candidateForDevice:](self, "_candidateForDevice:", v32));
        if (v33)
        {
          v34 = _TVRDIRLog();
          v35 = objc_claimAutoreleasedReturnValue(v34);
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v52 = v33;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Removing candidate %@", buf, 0xCu);
          }

          v36 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDIRSessionManager irSession](self, "irSession"));
          objc_msgSend(v36, "deleteCandidate:", v33);

        }
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDIRSessionManager identifierToDeviceMap](self, "identifierToDeviceMap"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "identifier"));
        objc_msgSend(v37, "removeObjectForKey:", v38);

      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    }
    while (v29);
  }

}

- (void)removeDevice:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;

  v4 = a3;
  v5 = _TVRDIRLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Delete candidate %@", (uint8_t *)&v11, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDIRSessionManager _candidateForDevice:](self, "_candidateForDevice:", v4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDIRSessionManager irSession](self, "irSession"));
  objc_msgSend(v8, "deleteCandidate:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDIRSessionManager identifierToCandidateMap](self, "identifierToCandidateMap"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  objc_msgSend(v9, "removeObjectForKey:", v10);

}

- (void)updateDevice:(id)a3 withConnectionContext:(int64_t)a4
{
  uint64_t v5;

  if (a4 == 2)
    v5 = 1;
  else
    v5 = 2 * (a4 == 3);
  -[TVRDIRSessionManager _donateEventWithEventType:forDevice:](self, "_donateEventWithEventType:forDevice:", v5, a3);
}

- (void)didInteractWithDevice:(id)a3
{
  -[TVRDIRSessionManager _donateEventWithEventType:forDevice:](self, "_donateEventWithEventType:forDevice:", 3, a3);
}

- (void)_donateEventWithEventType:(int64_t)a3 forDevice:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;

  v6 = a4;
  v7 = objc_msgSend(objc_alloc((Class)IRAppleTVControlEvent), "initWithEventType:eventSubType:", a3, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDIRSessionManager identifierToCandidateMap](self, "identifierToCandidateMap"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v9));
  if (v10)
  {
    v11 = IRAppleTVControlEventTypeToString(a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    if (objc_msgSend(v12, "hasPrefix:", CFSTR("AppleTVControl")))
    {
      v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "substringFromIndex:", 14));

      v12 = (void *)v13;
    }
    v14 = _TVRDIRLog();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412546;
      v18 = v12;
      v19 = 2112;
      v20 = v10;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Donating %@ for %@", (uint8_t *)&v17, 0x16u);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDIRSessionManager irSession](self, "irSession"));
    objc_msgSend(v16, "addEvent:forCandidate:", v7, v10);

  }
}

- (void)requestCurrentRecommendedDevices
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;

  v3 = _TVRDIRLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDIRSessionManager irSession](self, "irSession"));
    v7 = 138412290;
    v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Requesting current context from IRSession: %@", (uint8_t *)&v7, 0xCu);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDIRSessionManager irSession](self, "irSession"));
  objc_msgSend(v6, "requestCurrentContext");

}

- (void)_activateWithCompletion:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  id *v10;
  id v11;
  NSObject *v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[8];
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  if (-[TVRDIRSessionManager hasStarted](self, "hasStarted"))
  {
    v5 = _TVRDIRLog();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "IRSession is already active. Setting Configuration mode to OnEvents.", buf, 2u);
    }

    -[TVRDIRSessionManager setSuggestedDevices:](self, "setSuggestedDevices:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDIRSessionManager identifierToDeviceMap](self, "identifierToDeviceMap"));
    objc_msgSend(v7, "removeAllObjects");

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDIRSessionManager identifierToCandidateMap](self, "identifierToCandidateMap"));
    objc_msgSend(v8, "removeAllObjects");

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = __48__TVRDIRSessionManager__activateWithCompletion___block_invoke;
    v15[3] = &unk_10001C6C0;
    v9 = v15;
    v15[4] = v4;
    v10 = &v16;
    objc_copyWeak(&v16, &location);
    -[TVRDIRSessionManager _fetchServiceTokenWithCompletionHandler:](self, "_fetchServiceTokenWithCompletionHandler:", v15);
  }
  else
  {
    v11 = _TVRDIRLog();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Starting IRSession", buf, 2u);
    }

    -[TVRDIRSessionManager _setupSession](self, "_setupSession");
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = __48__TVRDIRSessionManager__activateWithCompletion___block_invoke_17;
    v13[3] = &unk_10001C6C0;
    v9 = v13;
    v13[4] = v4;
    v10 = &v14;
    objc_copyWeak(&v14, &location);
    -[TVRDIRSessionManager _fetchServiceTokenWithCompletionHandler:](self, "_fetchServiceTokenWithCompletionHandler:", v13);
  }
  objc_destroyWeak(v10);

  objc_destroyWeak(&location);
}

void __48__TVRDIRSessionManager__activateWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id WeakRetained;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint8_t v11[16];

  v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      v7 = objc_msgSend(objc_alloc((Class)IRConfiguration), "initWithServiceToken:", v5);
      objc_msgSend(v7, "setMode:", 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "irSession"));
      objc_msgSend(v8, "runWithConfiguration:", v7);

      v9 = _TVRDIRLog();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Updated config mode to OnEvents", v11, 2u);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }

  }
}

void __48__TVRDIRSessionManager__activateWithCompletion___block_invoke_17(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;

  v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v6 = objc_msgSend(objc_alloc((Class)IRConfiguration), "initWithServiceToken:", v5);
    objc_msgSend(v6, "setMode:", 1);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v8 = WeakRetained;
    if (WeakRetained)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "irSession"));
      objc_msgSend(v9, "runWithConfiguration:", v6);

      objc_msgSend(v8, "setHasStarted:", 1);
      v10 = _TVRDIRLog();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "irSession"));
        v13 = 138412290;
        v14 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Started %@", (uint8_t *)&v13, 0xCu);

      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }

  }
}

- (void)_invalidate
{
  IRSession *irSession;
  IRServiceToken *serviceToken;
  TVRXDeviceQuery *query;
  id filteredDeviceListHandler;

  -[IRSession invalidate](self->_irSession, "invalidate");
  -[IRSession setDelegate:](self->_irSession, "setDelegate:", 0);
  irSession = self->_irSession;
  self->_irSession = 0;

  serviceToken = self->_serviceToken;
  self->_serviceToken = 0;

  query = self->_query;
  self->_query = 0;

  filteredDeviceListHandler = self->_filteredDeviceListHandler;
  self->_filteredDeviceListHandler = 0;

  self->_hasStarted = 0;
  -[NSMutableDictionary removeAllObjects](self->_identifierToCandidateMap, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_identifierToDeviceMap, "removeAllObjects");
}

- (void)_restartIRSession
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id location;

  v3 = objc_retainBlock(self->_filteredDeviceListHandler);
  -[TVRDIRSessionManager _invalidate](self, "_invalidate");
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __41__TVRDIRSessionManager__restartIRSession__block_invoke;
  v5[3] = &unk_10001C6E8;
  objc_copyWeak(&v7, &location);
  v4 = v3;
  v6 = v4;
  -[TVRDIRSessionManager _activateWithCompletion:](self, "_activateWithCompletion:", v5);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __41__TVRDIRSessionManager__restartIRSession__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  id WeakRetained;

  v3 = a2;
  if (v3)
  {
    v4 = _TVRDIRLog();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __41__TVRDIRSessionManager__restartIRSession__block_invoke_cold_1();

  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "setFilteredDeviceListHandler:", *(_QWORD *)(a1 + 32));

  }
}

- (void)session:(id)a3 didFailWithError:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a4;
  v6 = _TVRDIRLog();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[TVRDIRSessionManager session:didFailWithError:].cold.1();

  -[TVRDIRSessionManager _restartIRSession](self, "_restartIRSession");
}

- (void)session:(id)a3 didUpdateContext:(id)a4
{
  id v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v5 = a4;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __49__TVRDIRSessionManager_session_didUpdateContext___block_invoke;
  block[3] = &unk_10001C4E0;
  objc_copyWeak(&v9, &location);
  v8 = v5;
  v6 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __49__TVRDIRSessionManager_session_didUpdateContext___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  uint64_t v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  void *v20;
  const __CFString *v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  void (**v31)(_QWORD, _QWORD);
  void *v32;
  void *v33;
  id v34;
  id v35;
  id obj;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  NSObject *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  _BYTE v48[128];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", IRContextAppleTVControlKey));
    v4 = _TVRDIRLog();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __49__TVRDIRSessionManager_session_didUpdateContext___block_invoke_cold_1(v3, v5);

    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v33 = v3;
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "candidateResults"));
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v39;
      v9 = CFSTR("OneTapSuggestion");
      v34 = WeakRetained;
      do
      {
        v10 = 0;
        v35 = v7;
        do
        {
          if (*(_QWORD *)v39 != v8)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)v10);
          v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "candidate"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "identifierToDeviceMap"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject candidateIdentifier](v12, "candidateIdentifier"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v14));

          if (v15)
          {
            objc_msgSend(v15, "setClassification:", objc_msgSend(WeakRetained, "_deviceClassificationFromIRClassification:", objc_msgSend(v11, "classification")));
            v16 = IRCandidateClassificationToString(objc_msgSend(v11, "classification"));
            v17 = objc_claimAutoreleasedReturnValue(v16);
            if (-[NSObject isEqualToString:](v17, "isEqualToString:", v9))
            {

              v17 = CFSTR("OneTap");
            }
            v18 = _TVRDIRLog();
            v19 = objc_claimAutoreleasedReturnValue(v18);
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "name"));
              v21 = v9;
              v22 = v8;
              v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));
              *(_DWORD *)buf = 138412802;
              v43 = v17;
              v44 = 2112;
              v45 = v20;
              v46 = 2114;
              v47 = v23;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Update context: %10@, %22@, %{public}@", buf, 0x20u);

              v8 = v22;
              v9 = v21;

              WeakRetained = v34;
              v7 = v35;
            }

            if (objc_msgSend(v11, "classification") == (id)2
              || objc_msgSend(v11, "classification") == (id)3
              || objc_msgSend(v11, "classification") == (id)4)
            {
              objc_msgSend(v37, "addObject:", v15);
            }
          }
          else
          {
            v24 = _TVRDIRLog();
            v17 = objc_claimAutoreleasedReturnValue(v24);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v43 = v12;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "No device found for candidate: %@", buf, 0xCu);
            }
          }

          v10 = (char *)v10 + 1;
        }
        while (v7 != v10);
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
      }
      while (v7);
    }

    objc_msgSend(v37, "sortUsingComparator:", &__block_literal_global_2);
    objc_msgSend(WeakRetained, "setSuggestedDevices:", v37);
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "suggestedDevices"));
    v26 = objc_msgSend(v25, "count");

    if (v26)
    {
      v27 = _TVRDIRLog();
      v28 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "suggestedDevices"));
        *(_DWORD *)buf = 138543362;
        v43 = v29;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Suggested devices: %{public}@", buf, 0xCu);

      }
    }
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "filteredDeviceListHandler"));

    if (v30)
    {
      v31 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "filteredDeviceListHandler"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "suggestedDevices"));
      ((void (**)(_QWORD, void *))v31)[2](v31, v32);

    }
  }

}

int64_t __49__TVRDIRSessionManager_session_didUpdateContext___block_invoke_24(id a1, TVRXDevice *a2, TVRXDevice *a3)
{
  TVRXDevice *v4;
  TVRXDevice *v5;
  id v6;
  int64_t v7;
  id v8;

  v4 = a2;
  v5 = a3;
  if (-[TVRXDevice classification](v4, "classification"))
  {
    if (-[TVRXDevice classification](v5, "classification")
      && (v6 = -[TVRXDevice classification](v4, "classification"),
          (uint64_t)v6 >= (uint64_t)-[TVRXDevice classification](v5, "classification")))
    {
      v8 = -[TVRXDevice classification](v4, "classification");
      v7 = (uint64_t)v8 > (uint64_t)-[TVRXDevice classification](v5, "classification");
    }
    else
    {
      v7 = -1;
    }
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (int64_t)_deviceClassificationFromIRClassification:(int64_t)a3
{
  if ((unint64_t)a3 > 4)
    return 5;
  else
    return qword_1000151E8[a3];
}

- (IRSession)irSession
{
  return self->_irSession;
}

- (void)setIrSession:(id)a3
{
  objc_storeStrong((id *)&self->_irSession, a3);
}

- (NSArray)suggestedDevices
{
  return self->_suggestedDevices;
}

- (void)setSuggestedDevices:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedDevices, a3);
}

- (id)filteredDeviceListHandler
{
  return self->_filteredDeviceListHandler;
}

- (void)setFilteredDeviceListHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)hasStarted
{
  return self->_hasStarted;
}

- (void)setHasStarted:(BOOL)a3
{
  self->_hasStarted = a3;
}

- (IRServiceToken)serviceToken
{
  return self->_serviceToken;
}

- (void)setServiceToken:(id)a3
{
  objc_storeStrong((id *)&self->_serviceToken, a3);
}

- (TVRXDeviceQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
  objc_storeStrong((id *)&self->_query, a3);
}

- (NSMutableDictionary)identifierToCandidateMap
{
  return self->_identifierToCandidateMap;
}

- (void)setIdentifierToCandidateMap:(id)a3
{
  objc_storeStrong((id *)&self->_identifierToCandidateMap, a3);
}

- (NSMutableDictionary)identifierToDeviceMap
{
  return self->_identifierToDeviceMap;
}

- (void)setIdentifierToDeviceMap:(id)a3
{
  objc_storeStrong((id *)&self->_identifierToDeviceMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifierToDeviceMap, 0);
  objc_storeStrong((id *)&self->_identifierToCandidateMap, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_serviceToken, 0);
  objc_storeStrong(&self->_filteredDeviceListHandler, 0);
  objc_storeStrong((id *)&self->_suggestedDevices, 0);
  objc_storeStrong((id *)&self->_irSession, 0);
}

- (void)_fetchServiceTokenWithCompletionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Failed to unarchive service token %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __64__TVRDIRSessionManager__fetchServiceTokenWithCompletionHandler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Failed to archive service token %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __64__TVRDIRSessionManager__fetchServiceTokenWithCompletionHandler___block_invoke_2_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, a2, a3, "Failed to obtain token %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __29__TVRDIRSessionManager_pause__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Error fetching service token to update configuration mode: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __41__TVRDIRSessionManager__restartIRSession__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "IRSessionManager activate failed %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)session:didFailWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "IRSession didFailWithError %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __49__TVRDIRSessionManager_session_didUpdateContext___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "candidateResults"));
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Found potential candidates %@", v4, 0xCu);

}

@end
