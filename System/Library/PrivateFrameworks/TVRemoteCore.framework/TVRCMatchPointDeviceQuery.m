@implementation TVRCMatchPointDeviceQuery

- (TVRCMatchPointDeviceQuery)init
{
  TVRCMatchPointDeviceQuery *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *wrapperToIdentifierMapping;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TVRCMatchPointDeviceQuery;
  v2 = -[TVRCMatchPointDeviceQuery init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    wrapperToIdentifierMapping = v2->_wrapperToIdentifierMapping;
    v2->_wrapperToIdentifierMapping = v3;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[TVRCMatchPointDeviceQuery stop](self, "stop");
  v3.receiver = self;
  v3.super_class = (Class)TVRCMatchPointDeviceQuery;
  -[TVRCMatchPointDeviceQuery dealloc](&v3, sel_dealloc);
}

- (void)start
{
  NSObject *v3;
  void *v4;
  void *v5;
  HMHomeManager *v6;
  HMHomeManager *homeManager;
  NSObject *v8;
  NSObject *homekitActiveAssertion;
  uint8_t v10[16];

  _TVRCHomeKitLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_21A51B000, v3, OS_LOG_TYPE_DEFAULT, "Starting query for HomeKit services", v10, 2u);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__matchPointServiceAdded_, CFSTR("TVRCMatchPointServiceAddedNotification"), 0);
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__matchPointServiceRemoved_, CFSTR("TVRCMatchPointServiceRemovedNotification"), 0);
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__matchPointServiceNameChanged_, CFSTR("TVRCMatchPointServiceNameChangedNotification"), 0);
  if (!self->_homeManager)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD7838]), "initWithOptions:cachePolicy:", 1024, 1);
    objc_msgSend(v5, "setAdaptive:", 1);
    v6 = (HMHomeManager *)objc_msgSend(objc_alloc(MEMORY[0x24BDD76D8]), "initWithConfiguration:", v5);
    homeManager = self->_homeManager;
    self->_homeManager = v6;

    -[HMHomeManager setDelegate:](self->_homeManager, "setDelegate:", self);
    -[HMHomeManager _beginActiveAssertionWithReason:](self->_homeManager, "_beginActiveAssertionWithReason:", CFSTR("foreground"));
    v8 = objc_claimAutoreleasedReturnValue();
    homekitActiveAssertion = self->_homekitActiveAssertion;
    self->_homekitActiveAssertion = v8;

  }
}

- (void)stop
{
  NSObject *v3;
  NSObject *homekitActiveAssertion;
  HMHomeManager *homeManager;
  void *v6;
  void *v7;
  uint8_t v8[16];

  _TVRCHomeKitLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_21A51B000, v3, OS_LOG_TYPE_DEFAULT, "Stopping query for HomeKit services", v8, 2u);
  }

  if (self->_homekitActiveAssertion)
  {
    -[HMHomeManager _endActiveAssertion:](self->_homeManager, "_endActiveAssertion:");
    homekitActiveAssertion = self->_homekitActiveAssertion;
    self->_homekitActiveAssertion = 0;

  }
  -[HMHomeManager setDelegate:](self->_homeManager, "setDelegate:", 0);
  homeManager = self->_homeManager;
  self->_homeManager = 0;

  -[NSMutableDictionary removeAllObjects](self->_wrapperToIdentifierMapping, "removeAllObjects");
  +[TVRCHMHomeObserver sharedInstance](TVRCHMHomeObserver, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCurrentHome:", 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:name:object:", self, CFSTR("TVRCMatchPointServiceAddedNotification"), 0);
  objc_msgSend(v7, "removeObserver:name:object:", self, CFSTR("TVRCMatchPointServiceRemovedNotification"), 0);
  objc_msgSend(v7, "removeObserver:name:object:", self, CFSTR("TVRCMatchPointServiceNameChangedNotification"), 0);

}

- (void)homeManagerDidUpdateHomes:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  _TVRCHomeKitLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_21A51B000, v4, OS_LOG_TYPE_DEFAULT, "HomeKit informed us that it updated homes", (uint8_t *)&v8, 2u);
  }

  objc_msgSend(v3, "currentHome");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    +[TVRCHMHomeObserver sharedInstance](TVRCHMHomeObserver, "sharedInstance");
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject setCurrentHome:](v6, "setCurrentHome:", v5);
  }
  else
  {
    _TVRCHomeKitLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "homes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412546;
      v9 = v3;
      v10 = 2112;
      v11 = v7;
      _os_log_impl(&dword_21A51B000, v6, OS_LOG_TYPE_DEFAULT, "No current home found for manager %@. All homes - %@", (uint8_t *)&v8, 0x16u);

    }
  }

}

- (void)homeManagerDidUpdateCurrentHome:(id)a3
{
  HMHomeManager *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  int v11;
  HMHomeManager *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = (HMHomeManager *)a3;
  _TVRCHomeKitLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "HomeKit informed us that it updated current home", (uint8_t *)&v11, 2u);
  }

  if (self->_homeManager == v4)
  {
    -[HMHomeManager currentHome](v4, "currentHome");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      +[TVRCHMHomeObserver sharedInstance](TVRCHMHomeObserver, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "currentHome");
      v8 = objc_claimAutoreleasedReturnValue();

      if (v8 == v6)
        goto LABEL_12;
      +[TVRCHMHomeObserver sharedInstance](TVRCHMHomeObserver, "sharedInstance");
      v9 = objc_claimAutoreleasedReturnValue();
      -[NSObject setCurrentHome:](v9, "setCurrentHome:", v6);
    }
    else
    {
      _TVRCHomeKitLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        -[HMHomeManager homes](v4, "homes");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138412546;
        v12 = v4;
        v13 = 2112;
        v14 = v10;
        _os_log_impl(&dword_21A51B000, v9, OS_LOG_TYPE_DEFAULT, "No current home found for manager %@. All homes - %@", (uint8_t *)&v11, 0x16u);

      }
    }

    goto LABEL_12;
  }
  _TVRCHomeKitLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_21A51B000, v6, OS_LOG_TYPE_DEFAULT, "HomeKit home manager does not match", (uint8_t *)&v11, 2u);
  }
LABEL_12:

}

- (void)_matchPointServiceAdded:(id)a3
{
  void *v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _TVRCHomeKitLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138543618;
    v13 = (id)objc_opt_class();
    v14 = 2112;
    v15 = v4;
    v6 = v13;
    _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ got notification that MatchPoint service added %@", (uint8_t *)&v12, 0x16u);

  }
  objc_msgSend(v4, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKey:](self->_wrapperToIdentifierMapping, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  _TVRCHomeKitLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      v12 = 138412290;
      v13 = v4;
      _os_log_impl(&dword_21A51B000, v10, OS_LOG_TYPE_DEFAULT, "Found existing mapping for service: %@", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    if (v11)
    {
      v12 = 138412290;
      v13 = v4;
      _os_log_impl(&dword_21A51B000, v10, OS_LOG_TYPE_DEFAULT, "Creating mapping for service %@", (uint8_t *)&v12, 0xCu);
    }

    +[TVRCHMServiceWrapper wrapperWithService:](TVRCHMServiceWrapper, "wrapperWithService:", v4);
    v10 = objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](self->_wrapperToIdentifierMapping, "setObject:forKey:", v10, v8);
    -[TVRCMatchPointDeviceQuery _notifyAddedService:](self, "_notifyAddedService:", v10);
  }

}

- (void)_matchPointServiceRemoved:(id)a3
{
  void *v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _TVRCHomeKitLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543618;
    v11 = (id)objc_opt_class();
    v12 = 2112;
    v13 = v4;
    v6 = v11;
    _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ got notification that MatchPoint service removed %@", (uint8_t *)&v10, 0x16u);

  }
  objc_msgSend(v4, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKey:](self->_wrapperToIdentifierMapping, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_wrapperToIdentifierMapping, "removeObjectForKey:", v8);
    -[TVRCMatchPointDeviceQuery _notifyRemovedService:](self, "_notifyRemovedService:", v9);
  }

}

- (void)_matchPointServiceNameChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKey:](self->_wrapperToIdentifierMapping, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _TVRCHomeKitLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_opt_class();
    v10 = v9;
    objc_msgSend(v4, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543874;
    v13 = v9;
    v14 = 2112;
    v15 = v4;
    v16 = 2112;
    v17 = v11;
    _os_log_impl(&dword_21A51B000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ got notification that service updated name %@. New name : %@", (uint8_t *)&v12, 0x20u);

  }
  if (v7)
  {
    -[TVRCMatchPointDeviceQuery _notifyRemovedService:](self, "_notifyRemovedService:", v7);
    -[TVRCMatchPointDeviceQuery _notifyAddedService:](self, "_notifyAddedService:", v7);
  }

}

- (void)_notifyAddedService:(id)a3
{
  id v4;
  id WeakRetained;
  char v6;
  NSObject *v7;
  id v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    _TVRCHomeKitLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v4;
      _os_log_impl(&dword_21A51B000, v7, OS_LOG_TYPE_DEFAULT, "Informing delegate we added MatchPoint service, %@", (uint8_t *)&v9, 0xCu);
    }

    v8 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v8, "matchpointDeviceQuery:addedService:", self, v4);

  }
}

- (void)_notifyRemovedService:(id)a3
{
  id v4;
  id WeakRetained;
  char v6;
  NSObject *v7;
  id v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    _TVRCHomeKitLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v4;
      _os_log_impl(&dword_21A51B000, v7, OS_LOG_TYPE_DEFAULT, "Informing delegate we removed MatchPoint service, %@", (uint8_t *)&v9, 0xCu);
    }

    v8 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v8, "matchpointDeviceQuery:removedService:", self, v4);

  }
}

- (_TVRCMatchPointDeviceQueryDelegate)delegate
{
  return (_TVRCMatchPointDeviceQueryDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HMHomeManager)homeManager
{
  return self->_homeManager;
}

- (void)setHomeManager:(id)a3
{
  objc_storeStrong((id *)&self->_homeManager, a3);
}

- (NSObject)homekitActiveAssertion
{
  return self->_homekitActiveAssertion;
}

- (void)setHomekitActiveAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_homekitActiveAssertion, a3);
}

- (NSMutableDictionary)wrapperToIdentifierMapping
{
  return self->_wrapperToIdentifierMapping;
}

- (void)setWrapperToIdentifierMapping:(id)a3
{
  objc_storeStrong((id *)&self->_wrapperToIdentifierMapping, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrapperToIdentifierMapping, 0);
  objc_storeStrong((id *)&self->_homekitActiveAssertion, 0);
  objc_storeStrong((id *)&self->_homeManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
