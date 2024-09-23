@implementation UNCRemoteNotificationServer

uint64_t __97__UNCRemoteNotificationServer_requestRemoteNotificationTokenWithEnvironment_forBundleIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_registerApplicationWithBundleIdentifier:forEnvironment:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)didChangeNotificationSettings:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __81__UNCRemoteNotificationServer_didChangeNotificationSettings_forBundleIdentifier___block_invoke;
  block[3] = &unk_251AE0250;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (void)_queue_didChangeNotificationSettings:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  int v8;
  int v9;
  os_log_t *v10;
  NSObject *v11;
  NSObject *v12;
  _BOOL4 v13;
  int v14;
  NSObject *v15;
  _BOOL4 v16;
  NSObject *v17;
  int v18;
  id v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "hasEnabledSettings");
  v9 = v8 ^ -[NSMutableSet containsObject:](self->_userNotificationEnabledBundleIdentifiers, "containsObject:", v7);
  v10 = (os_log_t *)MEMORY[0x24BDF89E8];
  if (v9 == 1)
  {
    v11 = *MEMORY[0x24BDF89E8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89E8], OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138543618;
      v19 = v7;
      v20 = 1024;
      v21 = v8;
      _os_log_impl(&dword_2499A5000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Update enabled user notifications for remote notifications: %{BOOL}d", (uint8_t *)&v18, 0x12u);
    }
    v12 = *v10;
    v13 = os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v13)
      {
        v18 = 138543362;
        v19 = v7;
        _os_log_impl(&dword_2499A5000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Enable user notifications for remote notifications", (uint8_t *)&v18, 0xCu);
      }
      -[NSMutableSet addObject:](self->_userNotificationEnabledBundleIdentifiers, "addObject:", v7);
    }
    else
    {
      if (v13)
      {
        v18 = 138543362;
        v19 = v7;
        _os_log_impl(&dword_2499A5000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Disable user notifications for remote notifications", (uint8_t *)&v18, 0xCu);
      }
      -[NSMutableSet removeObject:](self->_userNotificationEnabledBundleIdentifiers, "removeObject:", v7);
    }
  }
  v14 = objc_msgSend(v6, "hasEnabledAlertSettings");
  if (v14 == -[NSMutableSet containsObject:](self->_visibleUserNotificationEnabledBundleIdentifiers, "containsObject:", v7))
  {
    if (!v9)
      goto LABEL_24;
  }
  else
  {
    v15 = *MEMORY[0x24BDF89C8];
    v16 = os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89C8], OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v16)
      {
        v18 = 138543362;
        v19 = v7;
        _os_log_impl(&dword_2499A5000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Enabled visible user notifications for remote notifications", (uint8_t *)&v18, 0xCu);
      }
      -[NSMutableSet addObject:](self->_visibleUserNotificationEnabledBundleIdentifiers, "addObject:", v7);
    }
    else
    {
      if (v16)
      {
        v18 = 138543362;
        v19 = v7;
        _os_log_impl(&dword_2499A5000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Disable visible user notifications for remote notifications", (uint8_t *)&v18, 0xCu);
      }
      -[NSMutableSet removeObject:](self->_visibleUserNotificationEnabledBundleIdentifiers, "removeObject:", v7);
    }
  }
  v17 = *v10;
  if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v18) = 0;
    _os_log_impl(&dword_2499A5000, v17, OS_LOG_TYPE_DEFAULT, "Calcualate topics because user notification settings authorization changed", (uint8_t *)&v18, 2u);
  }
  -[UNCRemoteNotificationServer _queue_calculateTopics](self, "_queue_calculateTopics");
LABEL_24:

}

- (void)_queue_applicationDidBecomeBackground:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NSMutableSet removeObject:](self->_foregroundBundleIdentifiers, "removeObject:", v4);
  -[NSMutableDictionary objectForKey:](self->_bundleIdentifierToRegistration, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (-[UNCRemoteNotificationServer _queue_shouldBoostTopicToEnabled:](self, "_queue_shouldBoostTopicToEnabled:", v4))
    {
      v6 = *MEMORY[0x24BDF89E8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89E8], OS_LOG_TYPE_DEFAULT))
      {
        v9 = 138543362;
        v10 = v4;
        v7 = "[%{public}@] Leaving topic enabled for application becoming background";
LABEL_7:
        _os_log_impl(&dword_2499A5000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v9, 0xCu);
      }
    }
    else
    {
      if (-[UNCRemoteNotificationServer _queue_isUserNotificationEnabledForApplication:](self, "_queue_isUserNotificationEnabledForApplication:", v4))
      {
        v8 = 1;
      }
      else
      {
        v8 = 3;
      }
      -[UNCRemoteNotificationServer _queue_moveTopicsForApplication:fromList:toList:](self, "_queue_moveTopicsForApplication:fromList:toList:", v4, 0, v8);
    }
  }
  else
  {
    v6 = *MEMORY[0x24BDF89E8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89E8], OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138543362;
      v10 = v4;
      v7 = "[%{public}@] Ignore becoming background for application without push registration";
      goto LABEL_7;
    }
  }

}

- (void)requestRemoteNotificationTokenWithEnvironment:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __97__UNCRemoteNotificationServer_requestRemoteNotificationTokenWithEnvironment_forBundleIdentifier___block_invoke;
  block[3] = &unk_251AE0250;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(queue, block);

}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *queue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __78__UNCRemoteNotificationServer_connection_didReceiveToken_forTopic_identifier___block_invoke;
  block[3] = &unk_251AE0418;
  block[4] = self;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  dispatch_async(queue, block);

}

- (BOOL)_queue_isApplicationRunning:(id)a3
{
  UNCRemoteNotificationServer *v3;
  NSObject *queue;
  id v5;

  v3 = self;
  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  LOBYTE(v3) = -[NSMutableSet containsObject:](v3->_runningBundleIdentifiers, "containsObject:", v5);

  return (char)v3;
}

- (BOOL)_queue_isApplicationForeground:(id)a3
{
  UNCRemoteNotificationServer *v3;
  NSObject *queue;
  id v5;

  v3 = self;
  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  LOBYTE(v3) = -[NSMutableSet containsObject:](v3->_foregroundBundleIdentifiers, "containsObject:", v5);

  return (char)v3;
}

- (void)_queue_applicationDidLaunch:(id)a3
{
  NSObject *queue;
  id v5;

  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  -[NSMutableSet addObject:](self->_runningBundleIdentifiers, "addObject:", v5);

}

- (void)_queue_applicationDidBecomeForeground:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NSMutableSet addObject:](self->_foregroundBundleIdentifiers, "addObject:", v4);
  -[NSMutableDictionary objectForKey:](self->_bundleIdentifierToRegistration, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (-[UNCRemoteNotificationServer _queue_isUserNotificationEnabledForApplication:](self, "_queue_isUserNotificationEnabledForApplication:", v4))
    {
      v6 = 1;
    }
    else
    {
      v6 = 3;
    }
    -[UNCRemoteNotificationServer _queue_moveTopicsForApplication:fromList:toList:](self, "_queue_moveTopicsForApplication:fromList:toList:", v4, v6, 0);
  }
  else
  {
    v7 = *MEMORY[0x24BDF89E8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89E8], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138543362;
      v9 = v4;
      _os_log_impl(&dword_2499A5000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Ignore becoming foreground for application without push registration", (uint8_t *)&v8, 0xCu);
    }
  }

}

- (void)_queue_moveTopicsForApplication:(id)a3 fromList:(unint64_t)a4 toList:(unint64_t)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  const __CFString *v15;
  const __CFString *v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  NSMutableDictionary *obj;
  uint64_t v25;
  UNCRemoteNotificationServer *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t v35[128];
  uint8_t buf[4];
  const __CFString *v37;
  __int16 v38;
  const __CFString *v39;
  __int16 v40;
  void *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v23 = v8;
  -[UNCRemoteNotificationServer _queue_allTopicsForApplication:](self, "_queue_allTopicsForApplication:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v26 = self;
  obj = self->_environmentsToConnections;
  v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v31, v42, 16);
  if (v10)
  {
    v11 = v10;
    v25 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v32 != v25)
          objc_enumerationMutation(obj);
        -[NSMutableDictionary objectForKey:](v26->_environmentsToConnections, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)*MEMORY[0x24BDF89E8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89E8], OS_LOG_TYPE_DEFAULT))
        {
          v15 = CFSTR("Unknown");
          if (a4 <= 3)
            v15 = off_251AE0488[a4];
          v16 = CFSTR("Unknown");
          if (a5 <= 3)
            v16 = off_251AE0488[a5];
          *(_DWORD *)buf = 138543874;
          v37 = v15;
          v38 = 2114;
          v39 = v16;
          v40 = 2114;
          v41 = v9;
          v17 = v14;
          _os_log_impl(&dword_2499A5000, v17, OS_LOG_TYPE_DEFAULT, "Move topics from %{public}@ to %{public}@: %{public}@", buf, 0x20u);

        }
        v29 = 0u;
        v30 = 0u;
        v27 = 0u;
        v28 = 0u;
        v18 = v9;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v28;
          do
          {
            for (j = 0; j != v20; ++j)
            {
              if (*(_QWORD *)v28 != v21)
                objc_enumerationMutation(v18);
              objc_msgSend(v13, "moveTopic:fromList:toList:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * j), a4, a5);
            }
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
          }
          while (v20);
        }

      }
      v11 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v31, v42, 16);
    }
    while (v11);
  }

}

- (BOOL)_queue_isUserNotificationEnabledForApplication:(id)a3
{
  UNCRemoteNotificationServer *v3;
  NSObject *queue;
  id v5;

  v3 = self;
  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  LOBYTE(v3) = -[NSMutableSet containsObject:](v3->_userNotificationEnabledBundleIdentifiers, "containsObject:", v5);

  return (char)v3;
}

- (id)_queue_allTopicsForApplication:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableSet containsObject:](self->_cloudKitBundleIdentifiers, "containsObject:", v4))
  {
    objc_msgSend(CFSTR("com.apple.icloud-container."), "stringByAppendingString:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

  }
  return v5;
}

- (void)_queue_connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  char v16;
  int v17;
  os_log_t *v18;
  void *v19;
  _BOOL4 v20;
  NSObject *v21;
  const char *v22;
  NSObject *v23;
  int v24;
  NSMutableSet *bundleIdentifiersNeedingToken;
  int v26;
  os_log_t v27;
  _BOOL4 v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  os_log_t v35;
  NSMutableSet *v36;
  NSObject *v37;
  uint64_t v38;
  _BYTE v39[24];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v8)
  {
    if (v9)
    {
      if (objc_msgSend(v9, "hasPrefix:", CFSTR("com.apple.icloud-container.")))
      {
        v10 = *MEMORY[0x24BDF89E8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89E8], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v39 = 138543362;
          *(_QWORD *)&v39[4] = v9;
          _os_log_impl(&dword_2499A5000, v10, OS_LOG_TYPE_DEFAULT, "Do not deliver per-app token for CloudKit topic %{public}@", v39, 0xCu);
        }
        goto LABEL_34;
      }
      -[NSMutableDictionary objectForKey:](self->_bundleIdentifierToRegistration, "objectForKey:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (!v12)
      {
        v23 = *MEMORY[0x24BDF89E8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89E8], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v39 = 138543362;
          *(_QWORD *)&v39[4] = v9;
          _os_log_impl(&dword_2499A5000, v23, OS_LOG_TYPE_DEFAULT, "Received per-app token for topic %{public}@ for unregistered app", v39, 0xCu);
        }
        goto LABEL_33;
      }
      objc_msgSend(v12, "token");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqual:", v8);
      v16 = v15;
      v17 = v15 ^ 1;

      v18 = (os_log_t *)MEMORY[0x24BDF89E8];
      v19 = (void *)*MEMORY[0x24BDF89E8];
      v20 = os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89E8], OS_LOG_TYPE_DEFAULT);
      if ((v16 & 1) != 0)
      {
        if (!v20)
          goto LABEL_19;
        v21 = v19;
        *(_DWORD *)v39 = 134349314;
        *(_QWORD *)&v39[4] = objc_msgSend(v8, "length");
        *(_WORD *)&v39[12] = 2114;
        *(_QWORD *)&v39[14] = v9;
        v22 = "Received same per-app token [%{public}lu] for topic %{public}@";
      }
      else
      {
        if (!v20)
          goto LABEL_19;
        v21 = v19;
        *(_DWORD *)v39 = 134349314;
        *(_QWORD *)&v39[4] = objc_msgSend(v8, "length");
        *(_WORD *)&v39[12] = 2114;
        *(_QWORD *)&v39[14] = v9;
        v22 = "Received new per-app token [%{public}lu] for topic %{public}@";
      }
      _os_log_impl(&dword_2499A5000, v21, OS_LOG_TYPE_DEFAULT, v22, v39, 0x16u);

LABEL_19:
      v24 = -[NSMutableSet containsObject:](self->_bundleIdentifiersNeedingToken, "containsObject:", v9, *(_OWORD *)v39, *(_QWORD *)&v39[16], v40) | v17;
      -[NSMutableSet removeObject:](self->_bundleIdentifiersNeedingToken, "removeObject:", v9);
      if (!-[NSMutableSet count](self->_bundleIdentifiersNeedingToken, "count"))
      {
        bundleIdentifiersNeedingToken = self->_bundleIdentifiersNeedingToken;
        self->_bundleIdentifiersNeedingToken = 0;

      }
      if (!v24)
        goto LABEL_31;
      v26 = -[NSMutableSet containsObject:](self->_installedBundleIdentifiers, "containsObject:", v9);
      v27 = *v18;
      v28 = os_log_type_enabled(*v18, OS_LOG_TYPE_DEFAULT);
      if (v26)
      {
        if (v28)
        {
          v29 = v27;
          v30 = objc_msgSend(v8, "length");
          *(_DWORD *)v39 = 134349314;
          *(_QWORD *)&v39[4] = v30;
          *(_WORD *)&v39[12] = 2114;
          *(_QWORD *)&v39[14] = v9;
          _os_log_impl(&dword_2499A5000, v29, OS_LOG_TYPE_DEFAULT, "Send per-app token [%{public}lu] to client for topic %{public}@", v39, 0x16u);

        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
          -[UNCRemoteNotificationServerObserver didReceiveDeviceToken:forBundleIdentifier:](self->_observer, "didReceiveDeviceToken:forBundleIdentifier:", v8, v9);
        objc_msgSend(v13, "environment");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "tokenIdentifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        +[UNCPushRegistration pushRegistrationWithEnvironment:tokenIdentifier:token:](UNCPushRegistration, "pushRegistrationWithEnvironment:tokenIdentifier:token:", v31, v32, v8);
        v33 = objc_claimAutoreleasedReturnValue();

        -[UNCRemoteNotificationServer _queue_setPushRegistration:forBundleIdentifier:](self, "_queue_setPushRegistration:forBundleIdentifier:", v33, v9);
      }
      else
      {
        if (!v28)
          goto LABEL_31;
        v33 = v27;
        v34 = objc_msgSend(v8, "length");
        *(_DWORD *)v39 = 134349314;
        *(_QWORD *)&v39[4] = v34;
        *(_WORD *)&v39[12] = 2114;
        *(_QWORD *)&v39[14] = v9;
        _os_log_impl(&dword_2499A5000, v33, OS_LOG_TYPE_DEFAULT, "Do not send per-app token [%{public}lu] to client for topic %{public}@", v39, 0x16u);
      }

LABEL_31:
      v35 = *v18;
      if (os_log_type_enabled(*v18, OS_LOG_TYPE_DEFAULT))
      {
        v36 = self->_bundleIdentifiersNeedingToken;
        v37 = v35;
        v38 = -[NSMutableSet count](v36, "count");
        *(_DWORD *)v39 = 134217984;
        *(_QWORD *)&v39[4] = v38;
        _os_log_impl(&dword_2499A5000, v37, OS_LOG_TYPE_DEFAULT, "%lu apps waiting for tokens", v39, 0xCu);

      }
LABEL_33:

      goto LABEL_34;
    }
    v11 = (void *)*MEMORY[0x24BDF89E8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89E8], OS_LOG_TYPE_ERROR))
      -[UNCRemoteNotificationServer _queue_connection:didReceiveToken:forTopic:identifier:].cold.2(v11);
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89E8], OS_LOG_TYPE_ERROR))
  {
    -[UNCRemoteNotificationServer _queue_connection:didReceiveToken:forTopic:identifier:].cold.1();
  }
LABEL_34:

}

- (void)_queue_setPushRegistration:(id)a3 forBundleIdentifier:(id)a4
{
  NSMutableDictionary *bundleIdentifierToRegistration;
  id v7;
  id v8;

  bundleIdentifierToRegistration = self->_bundleIdentifierToRegistration;
  v7 = a4;
  v8 = a3;
  -[NSMutableDictionary setObject:forKey:](bundleIdentifierToRegistration, "setObject:forKey:", v8, v7);
  -[UNCPushRegistrationRepository setRegistration:forBundleIdentifier:](self->_pushRegistrationRepository, "setRegistration:forBundleIdentifier:", v8, v7);

}

- (void)_queue_registerApplicationWithBundleIdentifier:(id)a3 forEnvironment:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  int v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSMutableSet *v18;
  NSMutableSet *bundleIdentifiersNeedingToken;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  int v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NSMutableDictionary objectForKey:](self->_bundleIdentifierToRegistration, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = v8;
    objc_msgSend(v8, "environment");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqual:", v7);

    if ((v11 & 1) != 0)
    {
      v12 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v9, "tokenIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v7;
    v15 = v13;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v7;
    v15 = v9;
  }
  +[UNCPushRegistration pushRegistrationWithEnvironment:tokenIdentifier:token:](UNCPushRegistration, "pushRegistrationWithEnvironment:tokenIdentifier:token:", v14, v15, 0);
  v16 = objc_claimAutoreleasedReturnValue();

  -[UNCRemoteNotificationServer _queue_setPushRegistration:forBundleIdentifier:](self, "_queue_setPushRegistration:forBundleIdentifier:", v16, v6);
  v12 = 1;
  v9 = (void *)v16;
LABEL_7:
  -[NSMutableDictionary objectForKey:](self->_environmentsToConnections, "objectForKey:", v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    -[UNCRemoteNotificationServer _queue_calculateTopics](self, "_queue_calculateTopics");
    -[NSMutableDictionary objectForKey:](self->_environmentsToConnections, "objectForKey:", v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (!self->_bundleIdentifiersNeedingToken)
  {
    v18 = (NSMutableSet *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", 1);
    bundleIdentifiersNeedingToken = self->_bundleIdentifiersNeedingToken;
    self->_bundleIdentifiersNeedingToken = v18;

  }
  objc_msgSend(v9, "tokenIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)*MEMORY[0x24BDF89E8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89E8], OS_LOG_TYPE_DEFAULT))
  {
    v22 = v21;
    objc_msgSend(v9, "tokenIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138543618;
    v25 = v6;
    v26 = 2114;
    v27 = v23;
    _os_log_impl(&dword_2499A5000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@] Request per-app token with token identifier %{public}@", (uint8_t *)&v24, 0x16u);

  }
  -[NSMutableSet addObject:](self->_bundleIdentifiersNeedingToken, "addObject:", v6);
  objc_msgSend(v17, "requestTokenForTopic:identifier:", v6, v20);
  if (v12)
    -[UNCRemoteNotificationServer _queue_calculateTopics](self, "_queue_calculateTopics");

}

uint64_t __78__UNCRemoteNotificationServer_connection_didReceiveToken_forTopic_identifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_connection:didReceiveToken:forTopic:identifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

uint64_t __81__UNCRemoteNotificationServer_didChangeNotificationSettings_forBundleIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_didChangeNotificationSettings:forBundleIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (UNCRemoteNotificationServer)initWithNotificationRepository:(id)a3 attachmentsService:(id)a4 pushRegistrationRepository:(id)a5 platform:(id)a6
{
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  dispatch_queue_t v16;
  NSObject *v17;
  dispatch_queue_t v18;
  void *v19;
  UNCNotificationServiceExtensionManager *v20;
  UNCRemoteNotificationServer *v21;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = dispatch_queue_create("com.apple.usernotificationsserver.RemoteNotificationServer", v11);

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = dispatch_queue_create("com.apple.usernotificationsserver.RemoteNotificationServer.APSConnection", v17);

  objc_msgSend(MEMORY[0x24BE2E228], "scheduler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_alloc_init(UNCNotificationServiceExtensionManager);
  v21 = -[UNCRemoteNotificationServer _initWithNotificationRepository:attachmentsService:pushRegistrationRepository:platform:queue:apsQueue:duetActivityScheduler:serviceExtensionManager:](self, "_initWithNotificationRepository:attachmentsService:pushRegistrationRepository:platform:queue:apsQueue:duetActivityScheduler:serviceExtensionManager:", v15, v14, v13, v12, v16, v18, v19, v20);

  return v21;
}

- (id)_initWithNotificationRepository:(id)a3 attachmentsService:(id)a4 pushRegistrationRepository:(id)a5 platform:(id)a6 queue:(id)a7 apsQueue:(id)a8 duetActivityScheduler:(id)a9 serviceExtensionManager:(id)a10
{
  id v17;
  UNCRemoteNotificationServer *v18;
  UNCRemoteNotificationServer *v19;
  NSMutableSet *v20;
  NSMutableSet *cloudKitBundleIdentifiers;
  NSMutableSet *v22;
  NSMutableSet *contentAvailableBundleIdentifiers;
  NSMutableSet *v24;
  NSMutableSet *quietServiceExtensionBundleIdentifiers;
  NSMutableSet *v26;
  NSMutableSet *foregroundBundleIdentifiers;
  NSMutableSet *v28;
  NSMutableSet *installedBundleIdentifiers;
  NSMutableSet *v30;
  NSMutableSet *restrictedBundleIdentifiers;
  NSMutableSet *v32;
  NSMutableSet *runningBundleIdentifiers;
  NSMutableSet *v34;
  NSMutableSet *userNotificationEnabledBundleIdentifiers;
  NSMutableSet *v36;
  NSMutableSet *visibleUserNotificationEnabledBundleIdentifiers;
  NSMutableDictionary *v38;
  NSMutableDictionary *bundleIdentifierToRegistration;
  NSMutableDictionary *v40;
  NSMutableDictionary *environmentsToConnections;
  UNCBlueListMonitor *v42;
  UNCBlueListMonitor *blueListMonitor;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  objc_super v52;

  v51 = a3;
  v50 = a4;
  v49 = a5;
  v48 = a6;
  v47 = a7;
  v46 = a8;
  v45 = a9;
  v17 = a10;
  v52.receiver = self;
  v52.super_class = (Class)UNCRemoteNotificationServer;
  v18 = -[UNCRemoteNotificationServer init](&v52, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_notificationRepository, a3);
    objc_storeStrong((id *)&v19->_attachmentsService, a4);
    objc_storeStrong((id *)&v19->_pushRegistrationRepository, a5);
    objc_storeStrong((id *)&v19->_platform, a6);
    objc_storeStrong((id *)&v19->_duetActivityScheduler, a9);
    objc_storeStrong((id *)&v19->_serviceExtensionManager, a10);
    objc_storeStrong((id *)&v19->_queue, a7);
    objc_storeStrong((id *)&v19->_apsQueue, a8);
    v20 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    cloudKitBundleIdentifiers = v19->_cloudKitBundleIdentifiers;
    v19->_cloudKitBundleIdentifiers = v20;

    v22 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    contentAvailableBundleIdentifiers = v19->_contentAvailableBundleIdentifiers;
    v19->_contentAvailableBundleIdentifiers = v22;

    v24 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    quietServiceExtensionBundleIdentifiers = v19->_quietServiceExtensionBundleIdentifiers;
    v19->_quietServiceExtensionBundleIdentifiers = v24;

    v26 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    foregroundBundleIdentifiers = v19->_foregroundBundleIdentifiers;
    v19->_foregroundBundleIdentifiers = v26;

    v28 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    installedBundleIdentifiers = v19->_installedBundleIdentifiers;
    v19->_installedBundleIdentifiers = v28;

    v30 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    restrictedBundleIdentifiers = v19->_restrictedBundleIdentifiers;
    v19->_restrictedBundleIdentifiers = v30;

    v32 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    runningBundleIdentifiers = v19->_runningBundleIdentifiers;
    v19->_runningBundleIdentifiers = v32;

    v34 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    userNotificationEnabledBundleIdentifiers = v19->_userNotificationEnabledBundleIdentifiers;
    v19->_userNotificationEnabledBundleIdentifiers = v34;

    v36 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    visibleUserNotificationEnabledBundleIdentifiers = v19->_visibleUserNotificationEnabledBundleIdentifiers;
    v19->_visibleUserNotificationEnabledBundleIdentifiers = v36;

    v38 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    bundleIdentifierToRegistration = v19->_bundleIdentifierToRegistration;
    v19->_bundleIdentifierToRegistration = v38;

    v40 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    environmentsToConnections = v19->_environmentsToConnections;
    v19->_environmentsToConnections = v40;

    v42 = objc_alloc_init(UNCBlueListMonitor);
    blueListMonitor = v19->_blueListMonitor;
    v19->_blueListMonitor = v42;

  }
  return v19;
}

- (void)dealloc
{
  objc_super v3;

  -[UNCRemoteNotificationServer setObserver:](self, "setObserver:", 0);
  v3.receiver = self;
  v3.super_class = (Class)UNCRemoteNotificationServer;
  -[UNCRemoteNotificationServer dealloc](&v3, sel_dealloc);
}

- (void)didChangeProcessState:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__UNCRemoteNotificationServer_didChangeProcessState_forBundleIdentifier___block_invoke;
  block[3] = &unk_251AE0250;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

uint64_t __73__UNCRemoteNotificationServer_didChangeProcessState_forBundleIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_didChangeProcessState:forBundleIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)didCompleteInitialization
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__UNCRemoteNotificationServer_didCompleteInitialization__block_invoke;
  block[3] = &unk_251AE02A0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __56__UNCRemoteNotificationServer_didCompleteInitialization__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_didCompleteInitialization");
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__UNCRemoteNotificationServer_connection_didReceivePublicToken___block_invoke;
  block[3] = &unk_251AE0250;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

uint64_t __64__UNCRemoteNotificationServer_connection_didReceivePublicToken___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_connection:didReceivePublicToken:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_queue_connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NSMutableDictionary *bundleIdentifierToRegistration;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  uint64_t v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSMutableSet *runningBundleIdentifiers;
  NSObject *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t j;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  int v54;
  void *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  id v62;
  void *v63;
  void *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  uint8_t v74[128];
  uint8_t buf[4];
  uint64_t v76;
  __int16 v77;
  uint64_t v78;
  uint64_t v79;

  v79 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NSMutableDictionary allKeysForObject:](self->_environmentsToConnections, "allKeysForObject:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastObject");
  v9 = objc_claimAutoreleasedReturnValue();

  v10 = (void *)*MEMORY[0x24BDF89E8];
  v64 = (void *)v9;
  v11 = *MEMORY[0x24BDF89E8];
  if (v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v10;
      *(_DWORD *)buf = 134349314;
      v76 = objc_msgSend(v7, "length");
      v77 = 2114;
      v78 = v9;
      _os_log_impl(&dword_2499A5000, v12, OS_LOG_TYPE_DEFAULT, "Received new public token [%{public}lu] for environment %{public}@", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryForKey:", CFSTR("SBEnvironmentsToLastKnownTokens"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (id)objc_msgSend(v14, "mutableCopy");

    objc_msgSend(v15, "objectForKey:", v9);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    if ((id)v16 == v7 || v16 && objc_msgSend(v7, "isEqualToData:", v16))
    {
      v18 = (void *)*MEMORY[0x24BDF89E8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89E8], OS_LOG_TYPE_DEFAULT))
      {
        v19 = v18;
        v20 = objc_msgSend(v7, "length");
        *(_DWORD *)buf = 134349056;
        v76 = v20;
        _os_log_impl(&dword_2499A5000, v19, OS_LOG_TYPE_DEFAULT, "Received same public token [%{public}lu]", buf, 0xCu);

      }
    }
    else
    {
      v59 = v17;
      v21 = (void *)*MEMORY[0x24BDF89E8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89E8], OS_LOG_TYPE_DEFAULT))
      {
        v22 = v21;
        v23 = objc_msgSend(v7, "length");
        *(_DWORD *)buf = 134349056;
        v76 = v23;
        _os_log_impl(&dword_2499A5000, v22, OS_LOG_TYPE_DEFAULT, "Received new public token [%{public}lu]", buf, 0xCu);

      }
      if (!v15)
        v15 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      v63 = v6;
      if (v7)
        objc_msgSend(v15, "setObject:forKey:", v7, v9);
      else
        objc_msgSend(v15, "removeObjectForKey:", v9);
      v62 = v7;
      objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults", v59);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = v15;
      objc_msgSend(v24, "setValue:forKey:", v15, CFSTR("SBEnvironmentsToLastKnownTokens"));

      v25 = (void *)*MEMORY[0x24BDF89E8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89E8], OS_LOG_TYPE_DEFAULT))
      {
        bundleIdentifierToRegistration = self->_bundleIdentifierToRegistration;
        v27 = v25;
        v28 = -[NSMutableDictionary count](bundleIdentifierToRegistration, "count");
        *(_DWORD *)buf = 134349056;
        v76 = v28;
        _os_log_impl(&dword_2499A5000, v27, OS_LOG_TYPE_DEFAULT, "Flush per-app tokens for %{public}lu apps", buf, 0xCu);

      }
      v71 = 0u;
      v72 = 0u;
      v69 = 0u;
      v70 = 0u;
      -[NSMutableDictionary allKeys](self->_bundleIdentifierToRegistration, "allKeys");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v69, v74, 16);
      if (v30)
      {
        v31 = v30;
        v32 = *(_QWORD *)v70;
        do
        {
          for (i = 0; i != v31; ++i)
          {
            if (*(_QWORD *)v70 != v32)
              objc_enumerationMutation(v29);
            v34 = *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * i);
            -[NSMutableDictionary objectForKey:](self->_bundleIdentifierToRegistration, "objectForKey:", v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "environment");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = objc_msgSend(v36, "isEqualToString:", v64);

            if (v37)
            {
              objc_msgSend(v35, "environment");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "tokenIdentifier");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              +[UNCPushRegistration pushRegistrationWithEnvironment:tokenIdentifier:token:](UNCPushRegistration, "pushRegistrationWithEnvironment:tokenIdentifier:token:", v38, v39, 0);
              v40 = (void *)objc_claimAutoreleasedReturnValue();

              -[UNCRemoteNotificationServer _queue_setPushRegistration:forBundleIdentifier:](self, "_queue_setPushRegistration:forBundleIdentifier:", v40, v34);
            }

          }
          v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v69, v74, 16);
        }
        while (v31);
      }

      v41 = (void *)*MEMORY[0x24BDF89E8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89E8], OS_LOG_TYPE_DEFAULT))
      {
        runningBundleIdentifiers = self->_runningBundleIdentifiers;
        v43 = v41;
        v44 = -[NSMutableSet count](runningBundleIdentifiers, "count");
        *(_DWORD *)buf = 134217984;
        v76 = v44;
        _os_log_impl(&dword_2499A5000, v43, OS_LOG_TYPE_DEFAULT, "Request per-app tokens for %lu running apps", buf, 0xCu);

      }
      v67 = 0u;
      v68 = 0u;
      v65 = 0u;
      v66 = 0u;
      -[NSMutableSet allObjects](self->_runningBundleIdentifiers, "allObjects");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
      v6 = v63;
      if (v46)
      {
        v47 = v46;
        v48 = *(_QWORD *)v66;
        do
        {
          for (j = 0; j != v47; ++j)
          {
            if (*(_QWORD *)v66 != v48)
              objc_enumerationMutation(v45);
            v50 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * j);
            -[NSMutableDictionary objectForKey:](self->_bundleIdentifierToRegistration, "objectForKey:", v50);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = v51;
            if (v51)
            {
              objc_msgSend(v51, "environment");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              v54 = objc_msgSend(v53, "isEqual:", v64);

              if (v54)
              {
                v55 = (void *)*MEMORY[0x24BDF89E8];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89E8], OS_LOG_TYPE_DEFAULT))
                {
                  v56 = v55;
                  objc_msgSend(v52, "tokenIdentifier");
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v76 = v50;
                  v77 = 2114;
                  v78 = (uint64_t)v57;
                  _os_log_impl(&dword_2499A5000, v56, OS_LOG_TYPE_DEFAULT, "Request per-app token with topic %{public}@ identifier %{public}@", buf, 0x16u);

                }
                objc_msgSend(v52, "tokenIdentifier");
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v63, "requestTokenForTopic:identifier:", v50, v58);

              }
            }

          }
          v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
        }
        while (v47);
      }

      v15 = v61;
      v7 = v62;
      v17 = v60;
    }

  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    -[UNCRemoteNotificationServer _queue_connection:didReceivePublicToken:].cold.1(v10);
  }

}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __68__UNCRemoteNotificationServer_connection_didReceiveIncomingMessage___block_invoke;
  v8[3] = &unk_251AE01A0;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

uint64_t __68__UNCRemoteNotificationServer_connection_didReceiveIncomingMessage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_didReceiveIncomingMessage:", *(_QWORD *)(a1 + 40));
}

- (void)_queue_didReceiveIncomingMessage:(id)a3
{
  id v4;
  id v5;
  NSObject *activity;
  _QWORD block[4];
  id v8;
  UNCRemoteNotificationServer *v9;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  activity = _os_activity_create(&dword_2499A5000, "PushNotification", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__UNCRemoteNotificationServer__queue_didReceiveIncomingMessage___block_invoke;
  block[3] = &unk_251AE01A0;
  v8 = v4;
  v9 = self;
  v5 = v4;
  os_activity_apply(activity, block);

}

void __64__UNCRemoteNotificationServer__queue_didReceiveIncomingMessage___block_invoke(uint64_t a1)
{
  void *v2;
  os_log_t *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  int v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  int v23;
  os_log_t v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  char v31;
  void *v32;
  int v33;
  int v34;
  os_log_t v35;
  NSObject *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  os_log_t v40;
  void *v41;
  NSObject *v42;
  void *v43;
  _BOOL4 v44;
  _BOOL4 v45;
  int v46;
  char log;
  NSObject *loga;
  uint64_t v49;
  unsigned int v50;
  int v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  int v57;
  __int16 v58;
  int v59;
  __int16 v60;
  _BOOL4 v61;
  __int16 v62;
  _BOOL4 v63;
  __int16 v64;
  int v65;
  __int16 v66;
  int v67;
  __int16 v68;
  void *v69;
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "unc_bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (os_log_t *)MEMORY[0x24BDF89E8];
  v4 = (void *)*MEMORY[0x24BDF89E8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89E8], OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(void **)(a1 + 32);
    v6 = v4;
    objc_msgSend(v5, "topic");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(*(id *)(a1 + 32), "priority");
    *(_DWORD *)buf = 138543618;
    v53 = v7;
    v54 = 2048;
    v55 = v8;
    _os_log_impl(&dword_2499A5000, v6, OS_LOG_TYPE_DEFAULT, "Received incoming message on topic %{public}@ at priority %ld", buf, 0x16u);

  }
  v9 = objc_msgSend(*(id *)(a1 + 40), "_queue_canDeliverMessageToBundle:", v2);
  v10 = objc_msgSend(*(id *)(a1 + 40), "_queue_messageIsValidForDelivery:", *(_QWORD *)(a1 + 32));
  if (v9)
    v11 = v10 == 0;
  else
    v11 = 1;
  if (!v11)
  {
    v12 = (void *)MEMORY[0x24BDF8858];
    objc_msgSend(*(id *)(a1 + 32), "correlationIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "userInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "requestWithIdentifier:pushPayload:bundleIdentifier:", v13, v14, v2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      v40 = *v3;
      if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
      {
        v41 = *(void **)(a1 + 32);
        v42 = v40;
        objc_msgSend(v41, "topic");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v53 = v43;
        _os_log_impl(&dword_2499A5000, v42, OS_LOG_TYPE_DEFAULT, "Received invalid remote notification request on topic %{public}@", buf, 0xCu);

      }
      goto LABEL_24;
    }
    log = objc_msgSend(*(id *)(a1 + 32), "pushFlags");
    objc_msgSend(v15, "content");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v16, "unc_willAlertUser");

    objc_msgSend(v15, "trigger");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "content");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "badge");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "content");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "sound");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v46 = objc_msgSend(v17, "isContentAvailable");
    v22 = objc_msgSend(v17, "isMutableContent");
    v50 = objc_msgSend(*(id *)(a1 + 40), "_queue_enforcePushTypeForMessage:", *(_QWORD *)(a1 + 32));
    v49 = objc_msgSend(*(id *)(a1 + 32), "pushType");
    v23 = objc_msgSend(*(id *)(a1 + 40), "_queue_allowServiceExtensionFilteringForMessage:", *(_QWORD *)(a1 + 32));
    v24 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
    {
      v44 = v19 != 0;
      v45 = v21 != 0;
      v25 = v17;
      v26 = log & 1;
      loga = v24;
      objc_msgSend(v15, "identifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "un_logDigest");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "unc_pushTypeDescription");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138545410;
      v53 = v2;
      v54 = 2114;
      v55 = (uint64_t)v28;
      v56 = 1024;
      v57 = v26;
      v17 = v25;
      v58 = 1024;
      v59 = v51;
      v60 = 1024;
      v61 = v45;
      v62 = 1024;
      v63 = v44;
      v64 = 1024;
      v65 = v46;
      v66 = 1024;
      v67 = v22;
      v68 = 2114;
      v69 = v29;
      _os_log_impl(&dword_2499A5000, loga, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received remote notification request %{public}@ [ waking: %d, hasAlertContent: %d, hasSound: %d hasBadge: %d hasContentAvailable: %d hasMutableContent: %d pushType: %{public}@]", buf, 0x44u);

      v3 = (os_log_t *)MEMORY[0x24BDF89E8];
    }
    v30 = v50;
    if (v49 == 8)
      v31 = 0;
    else
      v31 = v50;
    v32 = *(void **)(a1 + 40);
    if (((v51 | v23) & v22) != 1 || (v31 & 1) != 0)
    {
      v39 = *(_QWORD *)(a1 + 32);
    }
    else
    {
      v33 = objc_msgSend(v32, "_queue_isVisibleUserNotificationEnabledForApplication:", v2);
      v34 = v33 | v23 & objc_msgSend(*(id *)(a1 + 40), "_queue_isUserNotificationEnabledForApplication:", v2);
      v35 = *v3;
      if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
      {
        v36 = v35;
        objc_msgSend(v15, "identifier");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "un_logDigest");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v53 = v2;
        v54 = 2114;
        v55 = (uint64_t)v38;
        v56 = 1024;
        v57 = v34;
        _os_log_impl(&dword_2499A5000, v36, OS_LOG_TYPE_DEFAULT, "[%{public}@] Remote notification request %{public}@ can be modified: %d", buf, 0x1Cu);

        v30 = v50;
      }
      v39 = *(_QWORD *)(a1 + 32);
      v32 = *(void **)(a1 + 40);
      if (v34)
      {
        objc_msgSend(v32, "_queue_tryToModifyNotificationRequest:bundleIdentifier:message:enforcePushType:", v15, v2, v39, v30);
LABEL_23:

LABEL_24:
        goto LABEL_25;
      }
    }
    objc_msgSend(v32, "_queue_deliverNotificationRequest:bundleIdentifier:message:enforcePushType:", v15, v2, v39, v30);
    goto LABEL_23;
  }
LABEL_25:

}

- (BOOL)_queue_canDeliverMessageToBundle:(id)a3
{
  id v4;
  NSObject *v5;
  BOOL v6;
  const char *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSMutableSet *contentAvailableBundleIdentifiers;
  NSObject *v12;
  int v14;
  id v15;
  __int16 v16;
  int v17;
  __int16 v18;
  _BOOL4 v19;
  __int16 v20;
  _BOOL4 v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ((-[NSMutableSet containsObject:](self->_installedBundleIdentifiers, "containsObject:", v4) & 1) != 0)
  {
    if (-[NSMutableSet containsObject:](self->_restrictedBundleIdentifiers, "containsObject:", v4))
    {
      v5 = *MEMORY[0x24BDF89E8];
      v6 = 0;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89E8], OS_LOG_TYPE_DEFAULT))
      {
        v14 = 138543362;
        v15 = v4;
        v7 = "[%{public}@] Received incoming message for restricted app";
LABEL_7:
        _os_log_impl(&dword_2499A5000, v5, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v14, 0xCu);
        v6 = 0;
        goto LABEL_17;
      }
      goto LABEL_17;
    }
    -[NSMutableDictionary objectForKey:](self->_bundleIdentifierToRegistration, "objectForKey:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      if (-[UNCRemoteNotificationServer _queue_isPushEnabledForApplication:](self, "_queue_isPushEnabledForApplication:", v4))
      {
        v6 = 1;
LABEL_16:

        goto LABEL_17;
      }
      v10 = (void *)*MEMORY[0x24BDF89E8];
      v6 = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89E8], OS_LOG_TYPE_DEFAULT))
        goto LABEL_16;
      contentAvailableBundleIdentifiers = self->_contentAvailableBundleIdentifiers;
      v12 = v10;
      v14 = 138544130;
      v15 = v4;
      v16 = 1024;
      v17 = -[NSMutableSet containsObject:](contentAvailableBundleIdentifiers, "containsObject:", v4);
      v18 = 1024;
      v19 = -[UNCRemoteNotificationServer _queue_isBackgroundAppRefreshAllowedForBundleIdentifier:](self, "_queue_isBackgroundAppRefreshAllowedForBundleIdentifier:", v4);
      v20 = 1024;
      v21 = -[UNCRemoteNotificationServer _queue_isUserNotificationEnabledForApplication:](self, "_queue_isUserNotificationEnabledForApplication:", v4);
      _os_log_impl(&dword_2499A5000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received incoming message for push disabled app [ supportsContentAvailableRemoteNotification: %{BOOL}d; backgroundRefreshEnabled: %{BOOL}d; allowsUserNotifications: %{BOOL}d ]",
        (uint8_t *)&v14,
        0x1Eu);

    }
    else
    {
      v9 = *MEMORY[0x24BDF89E8];
      v6 = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89E8], OS_LOG_TYPE_DEFAULT))
        goto LABEL_16;
      v14 = 138543362;
      v15 = v4;
      _os_log_impl(&dword_2499A5000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received incoming message for unregistered app", (uint8_t *)&v14, 0xCu);
    }
    v6 = 0;
    goto LABEL_16;
  }
  v5 = *MEMORY[0x24BDF89E8];
  v6 = 0;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89E8], OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138543362;
    v15 = v4;
    v7 = "[%{public}@] Received incoming message for uninstalled app";
    goto LABEL_7;
  }
LABEL_17:

  return v6;
}

- (BOOL)_queue_enforcePushTypeForMessage:(id)a3
{
  BSPlatform *platform;
  id v4;
  BOOL v5;
  uint64_t v6;

  platform = self->_platform;
  v4 = a3;
  v5 = -[BSPlatform deviceClass](platform, "deviceClass") == 4;
  v6 = objc_msgSend(v4, "pushType");

  if (v6 == 8 || v6 == 4)
    return 1;
  return v5;
}

- (BOOL)_queue_messageIsValidForDelivery:(id)a3
{
  id v4;
  unint64_t v5;
  BOOL v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "pushType");
  if (-[BSPlatform deviceClass](self->_platform, "deviceClass") == 4)
  {
    v6 = 1;
    if (v5 != 4 && v5 != 8)
    {
      v7 = (void *)*MEMORY[0x24BDF89E8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89E8], OS_LOG_TYPE_ERROR))
        -[UNCRemoteNotificationServer _queue_messageIsValidForDelivery:].cold.1(v7, v4);
LABEL_11:
      v6 = 0;
    }
  }
  else
  {
    if (v5 > 8 || ((1 << v5) & 0x111) == 0)
    {
      v8 = (void *)*MEMORY[0x24BDF89E8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89E8], OS_LOG_TYPE_ERROR))
        -[UNCRemoteNotificationServer _queue_messageIsValidForDelivery:].cold.2(v8, v4);
      goto LABEL_11;
    }
    v6 = 1;
  }

  return v6;
}

- (BOOL)_queue_allowServiceExtensionFilteringForMessage:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "unc_bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[NSMutableSet containsObject:](self->_quietServiceExtensionBundleIdentifiers, "containsObject:", v5))
  {
LABEL_6:
    v6 = 0;
    goto LABEL_7;
  }
  if (objc_msgSend(v4, "pushType") != 8)
  {
    v7 = (void *)*MEMORY[0x24BDF89E8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89E8], OS_LOG_TYPE_ERROR))
      -[UNCRemoteNotificationServer _queue_allowServiceExtensionFilteringForMessage:].cold.1((uint64_t)v5, v7, v4);
    goto LABEL_6;
  }
  v6 = 1;
LABEL_7:

  return v6;
}

- (void)_queue_tryToModifyNotificationRequest:(id)a3 bundleIdentifier:(id)a4 message:(id)a5 enforcePushType:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  UNCNotificationServiceExtensionManager *serviceExtensionManager;
  void *v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;
  BOOL v24;
  id v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v6 = a6;
  v28 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  serviceExtensionManager = self->_serviceExtensionManager;
  v25 = 0;
  -[UNCNotificationServiceExtensionManager extensionForBundleIdentifier:error:](serviceExtensionManager, "extensionForBundleIdentifier:error:", v11, &v25);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v25;
  if (v14)
  {
    objc_msgSend(v14, "queue");
    v16 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __110__UNCRemoteNotificationServer__queue_tryToModifyNotificationRequest_bundleIdentifier_message_enforcePushType___block_invoke;
    block[3] = &unk_251AE0440;
    block[4] = self;
    v20 = v10;
    v21 = v11;
    v22 = v12;
    v23 = v14;
    v24 = v6;
    dispatch_async(v16, block);

  }
  else
  {
    v17 = *MEMORY[0x24BDF89E8];
    v18 = *MEMORY[0x24BDF89E8];
    if (v15)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[UNCRemoteNotificationServer _queue_tryToModifyNotificationRequest:bundleIdentifier:message:enforcePushType:].cold.1();
    }
    else if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v27 = v11;
      _os_log_impl(&dword_2499A5000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notification request was marked as mutable but no service extension is available", buf, 0xCu);
    }
    -[UNCRemoteNotificationServer _queue_deliverNotificationRequest:bundleIdentifier:message:enforcePushType:](self, "_queue_deliverNotificationRequest:bundleIdentifier:message:enforcePushType:", v10, v11, v12, v6);
  }

}

uint64_t __110__UNCRemoteNotificationServer__queue_tryToModifyNotificationRequest_bundleIdentifier_message_enforcePushType___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_extensionQueue_modifyNotificationRequest:bundleIdentifier:message:extension:enforcePushType:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 72));
}

- (void)_extensionQueue_modifyNotificationRequest:(id)a3 bundleIdentifier:(id)a4 message:(id)a5 extension:(id)a6 enforcePushType:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  _BOOL4 v18;
  id v19;
  void *v20;
  const __CFString *v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  UNCAttachmentsService *attachmentsService;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  void *v58;
  void *v59;
  void *v60;
  NSObject *v61;
  void *v62;
  void *v63;
  void *v64;
  NSObject *queue;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  NSObject *v72;
  BOOL v73;
  BOOL v74;
  BOOL v75;
  __CFString *v76;
  void *v77;
  void *v78;
  id v79;
  UNCRemoteNotificationServer *v80;
  _QWORD block[5];
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  BOOL v88;
  id v89;
  IOPMAssertionID AssertionID;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  id v93;
  __int16 v94;
  void *v95;
  __int16 v96;
  double v97;
  __int16 v98;
  double v99;
  uint64_t v100;

  v100 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  objc_msgSend(v15, "queue");
  v16 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v16);

  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v17 = _os_activity_create(&dword_2499A5000, "PushNotificationModification", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v17, &state);
  v80 = self;
  v77 = v14;
  v18 = -[UNCRemoteNotificationServer _queue_allowServiceExtensionFilteringForMessage:](self, "_queue_allowServiceExtensionFilteringForMessage:", v14);
  v19 = v12;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.NSE-runtime"), v13);
  v21 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  AssertionID = 0;
  objc_msgSend(v15, "serviceTime");
  v76 = (__CFString *)v21;
  IOPMAssertionCreateWithDescription(CFSTR("NoIdleSleepAssertion"), v21, 0, 0, 0, v22 + v22, CFSTR("TimeoutActionRelease"), &AssertionID);
  v89 = 0;
  objc_msgSend(v15, "mutateContentForNotificationRequest:error:", v19, &v89);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = v89;
  if (AssertionID)
    IOPMAssertionRelease(AssertionID);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "timeIntervalSinceReferenceDate");
  v26 = v25;
  objc_msgSend(v20, "timeIntervalSinceReferenceDate");
  v28 = v26 - v27;
  v78 = v23;
  if (v23)
  {
    if (objc_msgSend(v23, "unc_willAlertUser"))
    {
      v72 = v17;
      v29 = (void *)MEMORY[0x24BDF8858];
      objc_msgSend(v19, "identifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "trigger");
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = v23;
      v33 = (void *)v31;
      objc_msgSend(v29, "requestWithIdentifier:content:trigger:", v30, v32, v31);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      attachmentsService = v80->_attachmentsService;
      objc_msgSend(v15, "proxy");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[UNCAttachmentsService resolveAttachmentsSkippingErrorsForRequest:bundleIdentifier:fromBundleProxyForServiceExtension:](attachmentsService, "resolveAttachmentsSkippingErrorsForRequest:bundleIdentifier:fromBundleProxyForServiceExtension:", v34, v13, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v37, "content");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "attachments");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "count");

      v41 = (void *)*MEMORY[0x24BDF89E8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89E8], OS_LOG_TYPE_DEFAULT))
      {
        v42 = v41;
        objc_msgSend(v19, "identifier");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "un_logDigest");
        v73 = a7;
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v93 = v13;
        v94 = 2114;
        v95 = v44;
        v96 = 2048;
        v97 = *(double *)&v40;
        v98 = 2048;
        v99 = v28;
        _os_log_impl(&dword_2499A5000, v42, OS_LOG_TYPE_DEFAULT, "[%{public}@] Will deliver mutated notification content; notificationRequest=%{public}@, attachmentCount=%lu, runtime: %f",
          buf,
          0x2Au);

        a7 = v73;
      }
      v17 = v72;
      goto LABEL_19;
    }
    if (v18)
    {
      v53 = (void *)MEMORY[0x24BDF8858];
      objc_msgSend(v19, "identifier");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "trigger");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "requestWithIdentifier:content:trigger:", v54, v78, v55);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      v56 = (void *)*MEMORY[0x24BDF89E8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89E8], OS_LOG_TYPE_DEFAULT))
      {
        v57 = v56;
        objc_msgSend(v19, "identifier");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "un_logDigest");
        v75 = a7;
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v93 = v13;
        v94 = 2114;
        v95 = v59;
        v96 = 2114;
        v97 = *(double *)&v79;
        v98 = 2048;
        v99 = v28;
        _os_log_impl(&dword_2499A5000, v57, OS_LOG_TYPE_DEFAULT, "[%{public}@] Mutated notification request will not visibly alert the user, will supress original content; noti"
          "ficationRequest=%{public}@, error=%{public}@, runtime: %f",
          buf,
          0x2Au);

        a7 = v75;
      }
      goto LABEL_19;
    }
    v64 = (void *)*MEMORY[0x24BDF89E8];
    v37 = v19;
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89E8], OS_LOG_TYPE_ERROR))
      goto LABEL_19;
    v61 = v64;
    objc_msgSend(v19, "identifier");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "un_logDigest");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v93 = v13;
    v94 = 2114;
    v95 = v63;
    v96 = 2048;
    v97 = v28;
    _os_log_error_impl(&dword_2499A5000, v61, OS_LOG_TYPE_ERROR, "[%{public}@] Mutated notification request will not visibly alert the user, will deliver original content; notifica"
      "tionRequest=%{public}@, runtime: %f",
      buf,
      0x20u);
LABEL_17:

    v37 = v19;
    goto LABEL_19;
  }
  if (!v18)
  {
    v60 = (void *)*MEMORY[0x24BDF89E8];
    v37 = v19;
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89E8], OS_LOG_TYPE_DEFAULT))
      goto LABEL_19;
    v61 = v60;
    objc_msgSend(v19, "identifier");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "un_logDigest");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v93 = v13;
    v94 = 2114;
    v95 = v63;
    v96 = 2114;
    v97 = *(double *)&v79;
    v98 = 2048;
    v99 = v28;
    _os_log_impl(&dword_2499A5000, v61, OS_LOG_TYPE_DEFAULT, "[%{public}@] Did not mutate content for notification request, will deliver original content; notificationRequest=%"
      "{public}@, error=%{public}@, runtime: %f",
      buf,
      0x2Au);
    goto LABEL_17;
  }
  v74 = a7;
  v45 = (void *)MEMORY[0x24BDF8858];
  objc_msgSend(v19, "identifier");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_alloc_init(MEMORY[0x24BDF8848]);
  objc_msgSend(v19, "trigger");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "requestWithIdentifier:content:trigger:", v46, v47, v48);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v49 = (void *)*MEMORY[0x24BDF89E8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89E8], OS_LOG_TYPE_DEFAULT))
  {
    v50 = v49;
    objc_msgSend(v19, "identifier");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "un_logDigest");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v93 = v13;
    v94 = 2114;
    v95 = v52;
    v96 = 2114;
    v97 = *(double *)&v79;
    v98 = 2048;
    v99 = v28;
    _os_log_impl(&dword_2499A5000, v50, OS_LOG_TYPE_DEFAULT, "[%{public}@] Mutated notification request is nil, will supress original content; notificationRequest=%{public}@, e"
      "rror=%{public}@, runtime: %f",
      buf,
      0x2Au);

  }
  a7 = v74;
LABEL_19:
  os_activity_scope_leave(&state);
  queue = v80->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __124__UNCRemoteNotificationServer__extensionQueue_modifyNotificationRequest_bundleIdentifier_message_extension_enforcePushType___block_invoke;
  block[3] = &unk_251AE0468;
  block[4] = v80;
  v82 = v37;
  v83 = v13;
  v84 = v77;
  v88 = a7;
  v85 = v20;
  v86 = v24;
  v87 = v15;
  v66 = v15;
  v67 = v24;
  v68 = v20;
  v69 = v77;
  v70 = v13;
  v71 = v37;
  dispatch_async(queue, block);

}

void __124__UNCRemoteNotificationServer__extensionQueue_modifyNotificationRequest_bundleIdentifier_message_extension_enforcePushType___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_queue_deliverNotificationRequest:bundleIdentifier:message:enforcePushType:extensionStart:extensionEnd:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 88), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  objc_msgSend(*(id *)(a1 + 80), "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __124__UNCRemoteNotificationServer__extensionQueue_modifyNotificationRequest_bundleIdentifier_message_extension_enforcePushType___block_invoke_2;
  block[3] = &unk_251AE02A0;
  v4 = *(id *)(a1 + 80);
  dispatch_async(v2, block);

}

uint64_t __124__UNCRemoteNotificationServer__extensionQueue_modifyNotificationRequest_bundleIdentifier_message_extension_enforcePushType___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cleanUp");
}

- (void)_queue_deliverNotificationRequest:(id)a3 bundleIdentifier:(id)a4 message:(id)a5 enforcePushType:(BOOL)a6
{
  -[UNCRemoteNotificationServer _queue_deliverNotificationRequest:bundleIdentifier:message:enforcePushType:extensionStart:extensionEnd:](self, "_queue_deliverNotificationRequest:bundleIdentifier:message:enforcePushType:extensionStart:extensionEnd:", a3, a4, a5, a6, 0, 0);
}

- (void)_queue_deliverNotificationRequest:(id)a3 bundleIdentifier:(id)a4 message:(id)a5 enforcePushType:(BOOL)a6 extensionStart:(id)a7 extensionEnd:(id)a8
{
  _BOOL4 v10;
  id v14;
  id v15;
  id v16;
  os_log_t *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  _BOOL4 v24;
  int v25;
  int v26;
  os_log_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  _BOOL4 v31;
  int v32;
  void *v33;
  id v34;
  _BOOL4 v35;
  void *v36;
  void *v37;
  UNCRemoteNotificationServer *v38;
  _BOOL4 v39;
  void *v40;
  void *v41;
  void *v42;
  char v43;
  int v44;
  int v45;
  int v46;
  char v47;
  void *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  _BOOL4 v54;
  void *v55;
  int v56;
  void *v57;
  uint64_t v58;
  void *v59;
  id v60;
  id v61;
  void *v62;
  void *v63;
  uint8_t buf[4];
  id v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  void *v69;
  __int16 v70;
  int v71;
  uint64_t v72;

  v10 = a6;
  v72 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v61 = a7;
  v60 = a8;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v17 = (os_log_t *)MEMORY[0x24BDF89E8];
  v18 = (void *)*MEMORY[0x24BDF89E8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89E8], OS_LOG_TYPE_DEFAULT))
  {
    v19 = v18;
    objc_msgSend(v14, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "un_logDigest");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v65 = v15;
    v66 = 2114;
    v67 = v21;
    _os_log_impl(&dword_2499A5000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] Process delivery of push notification %{public}@", buf, 0x16u);

  }
  v58 = objc_msgSend(v16, "pushType");
  objc_msgSend(v14, "content");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "unc_willNotifyUser");

  v24 = -[UNCRemoteNotificationServer _queue_allowServiceExtensionFilteringForMessage:](self, "_queue_allowServiceExtensionFilteringForMessage:", v16);
  objc_msgSend(v14, "trigger");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v59, "isContentAvailable"))
  {
    v25 = v23 | v24;
    if (v58 != 8)
      v25 = 0;
    if (!v10 || v58 == 4 || v25)
    {
      -[UNCRemoteNotificationServer _scheduleContentAvailablePushActivityForMessage:bundleIdentifier:](self, "_scheduleContentAvailablePushActivityForMessage:bundleIdentifier:", v16, v15);
    }
    else
    {
      if (v58 == 8)
        v26 = v23;
      else
        v26 = 1;
      if (((v26 | v24) & 1) == 0)
      {
        v27 = *v17;
        if (os_log_type_enabled(*v17, OS_LOG_TYPE_ERROR))
        {
          v28 = v27;
          objc_msgSend(v14, "identifier");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "un_logDigest");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "unc_pushTypeDescription");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v65 = v15;
          v66 = 2114;
          v67 = v29;
          v68 = 2114;
          v69 = v30;
          v70 = 1024;
          v71 = 0;
          _os_log_error_impl(&dword_2499A5000, v28, OS_LOG_TYPE_ERROR, "[%{public}@] NOT requesting DUET deliver content-available, non-notifiying push notification %{public}@ [pushType: %{public}@ willNotifyUser: %d]", buf, 0x26u);

        }
      }
    }
  }
  v31 = v24;
  v32 = v23;
  v33 = v16;
  v34 = v15;
  v35 = v10;
  v63 = v14;
  objc_msgSend(v14, "content");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "userInfo");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = self;
  v39 = -[UNCRemoteNotificationServer _requestContainsDisallowedPrivateUserInfo:](self, "_requestContainsDisallowedPrivateUserInfo:", v37);

  if (!v39)
  {
    v43 = !v35;
    v44 = v58 == 8 || !v35;
    v45 = v44 & v32;
    if ((v44 & v32) == 1)
    {
      v42 = v34;
      -[UNCNotificationRepository saveNotificationRequest:shouldRepost:withMessage:forBundleIdentifier:](self->_notificationRepository, "saveNotificationRequest:shouldRepost:withMessage:forBundleIdentifier:", v63, 1, v33, v34);
LABEL_36:
      v53 = objc_msgSend(v33, "pushFlags") & 1;
      v54 = -[UNCRemoteNotificationServer _queue_isVisibleUserNotificationEnabledForApplication:](self, "_queue_isVisibleUserNotificationEnabledForApplication:", v42);
      v41 = v60;
      v40 = v61;
      UNCPowerLogUserNotificationExtendedTriggerEvent(v42, 3u, v53, v61, v60, v45 & v54);
      goto LABEL_37;
    }
    v46 = v32;
    if (v58 == 8)
      v47 = v32;
    else
      v47 = 1;
    v42 = v34;
    if ((v47 & 1) != 0 || !v31)
    {
      if (v58 == 4)
        v43 = 1;
      if ((v43 & 1) != 0)
        goto LABEL_36;
      v52 = (void *)*MEMORY[0x24BDF89E8];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89E8], OS_LOG_TYPE_ERROR))
        goto LABEL_36;
      v49 = v52;
      objc_msgSend(v63, "identifier");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "un_logDigest");
      v56 = v46;
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "unc_pushTypeDescription");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v65 = v34;
      v66 = 2114;
      v67 = v51;
      v68 = 2114;
      v69 = v57;
      v70 = 1024;
      v71 = v56;
      self = v38;
      _os_log_error_impl(&dword_2499A5000, v49, OS_LOG_TYPE_ERROR, "[%{public}@] NOT delivering non-notifying push notification %{public}@ [pushType: %{public}@ willNotifyUser: %d]", buf, 0x26u);

    }
    else
    {
      v48 = (void *)*MEMORY[0x24BDF89E8];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89E8], OS_LOG_TYPE_DEFAULT))
        goto LABEL_36;
      v49 = v48;
      objc_msgSend(v63, "identifier");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "un_logDigest");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v65 = v34;
      v66 = 2114;
      v67 = v51;
      _os_log_impl(&dword_2499A5000, v49, OS_LOG_TYPE_DEFAULT, "[%{public}@] NOT delivering filtered push notification %{public}@", buf, 0x16u);

    }
    goto LABEL_36;
  }
  v41 = v60;
  v40 = v61;
  v42 = v34;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89E8], OS_LOG_TYPE_ERROR))
    -[UNCRemoteNotificationServer _queue_deliverNotificationRequest:bundleIdentifier:message:enforcePushType:extensionStart:extensionEnd:].cold.1();
LABEL_37:

}

- (BOOL)_requestContainsDisallowedPrivateUserInfo:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  if (os_variant_has_internal_content())
  {
    objc_msgSend(v3, "allKeys");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "containsObject:", CFSTR("com.apple.private.untool.override"));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_scheduleContentAvailablePushActivityForMessage:(id)a3 bundleIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x24BDF89E8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89E8], OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138543362;
    v15 = v7;
    _os_log_impl(&dword_2499A5000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Request DUET delivers content-available push notification to application", (uint8_t *)&v14, 0xCu);
  }
  v9 = objc_msgSend(v6, "priority") > 9;
  v10 = (void *)MEMORY[0x24BE2E218];
  objc_msgSend(v6, "topic");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "userInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "launchForRemoteNotificationWithTopic:withPayload:highPriority:", v11, v12, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[_DASActivityScheduler submitActivity:](self->_duetActivityScheduler, "submitActivity:", v13);
}

- (void)notificationSourcesDidInstall:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  UNCRemoteNotificationServer *v9;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__UNCRemoteNotificationServer_notificationSourcesDidInstall___block_invoke;
  block[3] = &unk_251AE01A0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __61__UNCRemoteNotificationServer_notificationSourcesDidInstall___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v19 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v7, "bundleIdentifier", (_QWORD)v18);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 112), "addObject:", v8);
        v9 = objc_msgSend(v7, "isRestricted");
        v10 = *(void **)(*(_QWORD *)(a1 + 40) + 120);
        if (v9)
          objc_msgSend(v10, "addObject:", v8);
        else
          objc_msgSend(v10, "removeObject:", v8);
        v11 = objc_msgSend(v7, "usesCloudKit");
        v12 = *(void **)(*(_QWORD *)(a1 + 40) + 80);
        if (v11)
          objc_msgSend(v12, "addObject:", v8);
        else
          objc_msgSend(v12, "removeObject:", v8);
        v13 = objc_msgSend(v7, "supportsContentAvailableRemoteNotifications");
        v14 = *(void **)(*(_QWORD *)(a1 + 40) + 88);
        if (v13)
          objc_msgSend(v14, "addObject:", v8);
        else
          objc_msgSend(v14, "removeObject:", v8);
        v15 = objc_msgSend(v7, "allowServiceExtensionFiltering");
        v16 = *(void **)(*(_QWORD *)(a1 + 40) + 96);
        if (v15)
          objc_msgSend(v16, "addObject:", v8);
        else
          objc_msgSend(v16, "removeObject:", v8);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(a1 + 40), "_queue_calculateTopics");
}

- (void)notificationSourcesDidUninstall:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  UNCRemoteNotificationServer *v9;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__UNCRemoteNotificationServer_notificationSourcesDidUninstall___block_invoke;
  block[3] = &unk_251AE01A0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __63__UNCRemoteNotificationServer_notificationSourcesDidUninstall___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v6), "bundleIdentifier", (_QWORD)v9);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "removeObject:", v7);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 88), "removeObject:", v7);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 96), "removeObject:", v7);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 112), "removeObject:", v7);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 120), "removeObject:", v7);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 136), "removeObject:", v7);
        objc_msgSend(*(id *)(a1 + 40), "_queue_invalidateTokenForBundleIdentifier:", v7);
        objc_msgSend(*(id *)(a1 + 40), "_queue_removeRegistrationForBundleIdentifier:", v7);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(a1 + 40), "_queue_calculateTopics");
}

- (void)_queue_reloadRegistrations
{
  NSMutableDictionary *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSMutableDictionary *bundleIdentifierToRegistration;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  -[UNCPushRegistrationRepository allBundleIdentifiers](self->_pushRegistrationRepository, "allBundleIdentifiers");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8);
        v10 = (void *)MEMORY[0x24BCFE9BC](v5);
        -[UNCPushRegistrationRepository registrationForBundleIdentifier:](self->_pushRegistrationRepository, "registrationForBundleIdentifier:", v9, (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v11, v9);

        objc_autoreleasePoolPop(v10);
        ++v8;
      }
      while (v6 != v8);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v6 = v5;
    }
    while (v5);
  }

  bundleIdentifierToRegistration = self->_bundleIdentifierToRegistration;
  self->_bundleIdentifierToRegistration = v3;

}

- (void)_queue_reloadBackgroundAppRefreshDisabledList
{
  NSSet *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  char v12;
  NSSet *backgroundAppRefreshDisabledList;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v3 = (NSSet *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)CFPreferencesCopyAppValue(CFSTR("KeepAppsUpToDateAppList"), CFSTR("com.apple.mt"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v4, "allKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "BOOLValue");

        if ((v12 & 1) == 0)
          -[NSSet addObject:](v3, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  backgroundAppRefreshDisabledList = self->_backgroundAppRefreshDisabledList;
  self->_backgroundAppRefreshDisabledList = v3;

}

- (void)_queue_backgroundRefreshApplicationsDidChange
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  os_log_t *v10;
  uint64_t i;
  uint64_t v12;
  int v13;
  NSObject *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  uint64_t v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)-[NSSet copy](self->_backgroundAppRefreshDisabledList, "copy");
  -[UNCRemoteNotificationServer _queue_reloadBackgroundAppRefreshDisabledList](self, "_queue_reloadBackgroundAppRefreshDisabledList");
  v4 = (void *)-[NSSet copy](self->_backgroundAppRefreshDisabledList, "copy");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[NSMutableDictionary allKeys](self->_bundleIdentifierToRegistration, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v17;
    v10 = (os_log_t *)MEMORY[0x24BDF89E8];
    *(_QWORD *)&v7 = 138543362;
    v15 = v7;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v5);
        v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        v13 = objc_msgSend(v3, "containsObject:", v12, v15);
        if (v13 != objc_msgSend(v4, "containsObject:", v12))
        {
          v14 = *v10;
          if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v15;
            v21 = v12;
            _os_log_impl(&dword_2499A5000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] Calcualate push topics because backgound refresh was changed", buf, 0xCu);
          }
          -[UNCRemoteNotificationServer _queue_calculateTopics](self, "_queue_calculateTopics");
        }
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    }
    while (v8);
  }

}

- (BOOL)_canMoveTopic:(id)a3 fromList:(unint64_t)a4 toList:(unint64_t)a5 connection:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;

  v9 = a3;
  v10 = a6;
  -[UNCRemoteNotificationServer _topicsForList:connection:](self, "_topicsForList:connection:", a4, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNCRemoteNotificationServer _topicsForList:connection:](self, "_topicsForList:connection:", a5, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a4) = 0;
  if (v11 && v12)
  {
    if (objc_msgSend(v11, "containsObject:", v9))
      LODWORD(a4) = objc_msgSend(v12, "containsObject:", v9) ^ 1;
    else
      LOBYTE(a4) = 0;
  }

  return a4;
}

- (id)_topicsForList:(unint64_t)a3 connection:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v5 = a4;
  v6 = v5;
  switch(a3)
  {
    case 0uLL:
      objc_msgSend(v5, "enabledTopics");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 1uLL:
      objc_msgSend(v5, "opportunisticTopics");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2uLL:
      objc_msgSend(v5, "ignoredTopics");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 3uLL:
      objc_msgSend(v5, "nonWakingTopics");
      v7 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v8 = (void *)v7;
      break;
    default:
      v8 = 0;
      break;
  }

  return v8;
}

- (void)_queue_didChangeProcessState:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  void *v11;
  int v12;
  int v13;
  int v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v8 = *MEMORY[0x24BDF89E8];
  v9 = *MEMORY[0x24BDF89E8];
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138543874;
      v16 = v7;
      v17 = 2114;
      v18 = v7;
      v19 = 2114;
      v20 = v6;
      _os_log_impl(&dword_2499A5000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] %{public}@ application state changed to %{public}@", (uint8_t *)&v15, 0x20u);
    }
    v10 = -[UNCRemoteNotificationServer _queue_isApplicationForeground:](self, "_queue_isApplicationForeground:", v7);
    if ((objc_msgSend(v6, "isRunning") & 1) != 0)
    {
      objc_msgSend(v6, "endowmentNamespaces");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "containsObject:", CFSTR("com.apple.frontboard.visibility"));

      if (v10 == v12)
        goto LABEL_12;
      if (v12)
      {
        -[UNCRemoteNotificationServer _queue_applicationDidBecomeForeground:](self, "_queue_applicationDidBecomeForeground:", v7);
        goto LABEL_12;
      }
    }
    else if ((v10 & 1) == 0)
    {
      goto LABEL_12;
    }
    -[UNCRemoteNotificationServer _queue_applicationDidBecomeBackground:](self, "_queue_applicationDidBecomeBackground:", v7);
LABEL_12:
    v13 = -[UNCRemoteNotificationServer _queue_isApplicationRunning:](self, "_queue_isApplicationRunning:", v7);
    v14 = objc_msgSend(v6, "isRunning");
    if (v13 != v14)
    {
      if (v14)
        -[UNCRemoteNotificationServer _queue_applicationDidLaunch:](self, "_queue_applicationDidLaunch:", v7);
      else
        -[UNCRemoteNotificationServer _queue_applicationDidTerminate:](self, "_queue_applicationDidTerminate:", v7);
    }
    goto LABEL_16;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    -[UNCRemoteNotificationServer _queue_didChangeProcessState:forBundleIdentifier:].cold.1(v8);
LABEL_16:

}

- (void)_queue_applicationDidTerminate:(id)a3
{
  NSObject *queue;
  id v5;

  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  -[NSMutableSet removeObject:](self->_runningBundleIdentifiers, "removeObject:", v5);

}

- (BOOL)_queue_isBackgroundAppRefreshAllowedForBundleIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  v4 = (void *)CFPreferencesCopyAppValue(CFSTR("KeepAppsUpToDateAppList"), CFSTR("com.apple.mt"));
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "BOOLValue"))
    v6 = objc_msgSend(v5, "BOOLValue");
  else
    v6 = 1;

  return v6;
}

- (BOOL)_queue_isPushEnabledForApplication:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_bundleIdentifierToRegistration, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5
    && (-[NSMutableSet containsObject:](self->_contentAvailableBundleIdentifiers, "containsObject:", v4)
     && -[UNCRemoteNotificationServer _queue_isBackgroundAppRefreshAllowedForBundleIdentifier:](self, "_queue_isBackgroundAppRefreshAllowedForBundleIdentifier:", v4)|| -[UNCRemoteNotificationServer _queue_isUserNotificationEnabledForApplication:](self, "_queue_isUserNotificationEnabledForApplication:", v4));

  return v6;
}

- (BOOL)_queue_shouldBoostTopicToEnabled:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = -[NSMutableSet containsObject:](self->_userNotificationEnabledBundleIdentifiers, "containsObject:", v4)&& (-[NSMutableSet containsObject:](self->_quietServiceExtensionBundleIdentifiers, "containsObject:", v4) & 1) == 0&& -[UNCBlueListMonitor shouldBoostOpportunisticTopicsToEnabled](self->_blueListMonitor, "shouldBoostOpportunisticTopicsToEnabled");

  return v5;
}

- (BOOL)_queue_isVisibleUserNotificationEnabledForApplication:(id)a3
{
  UNCRemoteNotificationServer *v3;
  NSObject *queue;
  id v5;

  v3 = self;
  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  LOBYTE(v3) = -[NSMutableSet containsObject:](v3->_visibleUserNotificationEnabledBundleIdentifiers, "containsObject:", v5);

  return (char)v3;
}

- (void)_queue_calculateTopics
{
  NSMutableDictionary *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  _BOOL4 v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  NSMutableDictionary *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  uint64_t v33;
  uint64_t k;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t m;
  void *v49;
  void *v50;
  NSObject *v51;
  __int128 v52;
  NSMutableDictionary *v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  _BOOL4 v59;
  _BOOL4 v60;
  _BOOL4 v61;
  uint64_t v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint8_t v75[128];
  uint8_t buf[4];
  void *v77;
  __int16 v78;
  void *v79;
  __int16 v80;
  void *v81;
  __int16 v82;
  void *v83;
  __int16 v84;
  void *v85;
  _BYTE v86[128];
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_initializationCompleted)
  {
    v58 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v57 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v56 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v55 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v54 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    v3 = self->_bundleIdentifierToRegistration;
    v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v71, v87, 16);
    if (v4)
    {
      v6 = v4;
      v7 = *(_QWORD *)v72;
      *(_QWORD *)&v5 = 138543362;
      v52 = v5;
      v53 = v3;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v72 != v7)
            objc_enumerationMutation(v3);
          v9 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
          if (-[NSMutableSet containsObject:](self->_installedBundleIdentifiers, "containsObject:", v9, v52)&& (-[NSMutableSet containsObject:](self->_restrictedBundleIdentifiers, "containsObject:", v9) & 1) == 0)
          {
            -[NSMutableDictionary objectForKey:](self->_bundleIdentifierToRegistration, "objectForKey:", v9);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = v10;
            if (v10)
            {
              objc_msgSend(v10, "environment");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              if (v12)
              {
                v13 = -[UNCRemoteNotificationServer _queue_isApplicationForeground:](self, "_queue_isApplicationForeground:", v9);
                v14 = -[UNCRemoteNotificationServer _queue_isUserNotificationEnabledForApplication:](self, "_queue_isUserNotificationEnabledForApplication:", v9);
                v61 = v13;
                v60 = v14
                   && -[UNCRemoteNotificationServer _queue_shouldBoostTopicToEnabled:](self, "_queue_shouldBoostTopicToEnabled:", v9);
                v59 = -[UNCRemoteNotificationServer _queue_isPushEnabledForApplication:](self, "_queue_isPushEnabledForApplication:", v9);
                v17 = objc_msgSend(v58, "indexOfObject:", v12);
                if (v17 == 0x7FFFFFFFFFFFFFFFLL)
                {
                  v17 = objc_msgSend(v58, "count");
                  objc_msgSend(v58, "addObject:", v12);
                  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v57, "addObject:", v18);

                  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v56, "addObject:", v19);

                  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v55, "addObject:", v20);

                  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v54, "addObject:", v21);

                }
                -[UNCRemoteNotificationServer _queue_allTopicsForApplication:](self, "_queue_allTopicsForApplication:", v9);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v23 = v56;
                if (!v14)
                  v23 = v55;
                v24 = v57;
                if (!v61 && !v60)
                  v24 = v23;
                if (v59)
                  v25 = v24;
                else
                  v25 = v54;
                objc_msgSend(v25, "objectAtIndex:", v17);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "addObjectsFromArray:", v22);

                v3 = v53;
              }
              else
              {
                v16 = *MEMORY[0x24BDF89E8];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89E8], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = v52;
                  v77 = v9;
                  _os_log_error_impl(&dword_2499A5000, v16, OS_LOG_TYPE_ERROR, "[%{public}@] Push registration with a nil environment was encountered, will ignore", buf, 0xCu);
                }
              }

            }
            else
            {
              v15 = *MEMORY[0x24BDF89E8];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89E8], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v52;
                v77 = v9;
                _os_log_error_impl(&dword_2499A5000, v15, OS_LOG_TYPE_ERROR, "[%{public}@] Missing push registration was encountered, will ignore", buf, 0xCu);
              }
            }

          }
        }
        v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v71, v87, 16);
      }
      while (v6);
    }

    v27 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v28 = self->_environmentsToConnections;
    v29 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v67, v86, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v68;
      do
      {
        for (j = 0; j != v30; ++j)
        {
          if (*(_QWORD *)v68 != v31)
            objc_enumerationMutation(v28);
          v33 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * j);
          if ((objc_msgSend(v58, "containsObject:", v33) & 1) == 0)
            objc_msgSend(v27, "addObject:", v33);
        }
        v30 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v67, v86, 16);
      }
      while (v30);
    }

    v62 = objc_msgSend(v58, "count");
    if (v62 >= 1)
    {
      for (k = 0; k != v62; ++k)
      {
        objc_msgSend(v58, "objectAtIndex:", k);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "objectAtIndex:", k);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "objectAtIndex:", k);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "objectAtIndex:", k);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "objectAtIndex:", k);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKey:](self->_environmentsToConnections, "objectForKey:", v35);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v40)
        {
          -[UNCRemoteNotificationServer _portNameForEnvironmentName:](self, "_portNameForEnvironmentName:", v35);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = (void *)objc_msgSend((id)objc_opt_class(), "_newPushServiceConnectionWithEnvironmentName:namedDelegatePort:queue:", v35, v41, self->_apsQueue);
          objc_msgSend(v40, "setDelegate:", self);
          -[NSMutableDictionary setObject:forKey:](self->_environmentsToConnections, "setObject:forKey:", v40, v35);

        }
        v42 = *MEMORY[0x24BDF89E8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89E8], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138544386;
          v77 = v35;
          v78 = 2114;
          v79 = v36;
          v80 = 2114;
          v81 = v39;
          v82 = 2114;
          v83 = v37;
          v84 = 2114;
          v85 = v38;
          _os_log_impl(&dword_2499A5000, v42, OS_LOG_TYPE_DEFAULT, "Setting topics for environment %{public}@:\nenabled: %{public}@\nignored: %{public}@\nopportunistic:%{public}@\nnonWakingOpportunistic:%{public}@", buf, 0x34u);
        }
        objc_msgSend(v40, "setEnabledTopics:ignoredTopics:opportunisticTopics:nonWakingTopics:", v36, v39, v37, v38);

      }
    }
    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    v43 = v27;
    v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
    if (v44)
    {
      v45 = v44;
      v46 = *(_QWORD *)v64;
      v47 = MEMORY[0x24BDBD1A8];
      do
      {
        for (m = 0; m != v45; ++m)
        {
          if (*(_QWORD *)v64 != v46)
            objc_enumerationMutation(v43);
          v49 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * m);
          -[NSMutableDictionary objectForKey:](self->_environmentsToConnections, "objectForKey:", v49);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = *MEMORY[0x24BDF89E8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89E8], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v77 = v49;
            _os_log_impl(&dword_2499A5000, v51, OS_LOG_TYPE_DEFAULT, "Setting no enabled, ignored or opportunistic topics for environment %{public}@", buf, 0xCu);
          }
          objc_msgSend(v50, "setEnabledTopics:ignoredTopics:opportunisticTopics:nonWakingTopics:", v47, v47, v47, v47);

        }
        v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
      }
      while (v45);
    }

    -[NSMutableDictionary removeObjectsForKeys:](self->_environmentsToConnections, "removeObjectsForKeys:", v43);
  }
}

- (id)_portNameForEnvironmentName:(id)a3
{
  id v3;
  const __CFString *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE08720]) & 1) != 0)
  {
    v4 = CFSTR("com.apple.aps.usernotifications");
  }
  else if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE08718]))
  {
    v4 = CFSTR("com.apple.aps.usernotifications.dev");
  }
  else
  {
    v4 = 0;
  }

  return (id)v4;
}

- (void)invalidateTokenForRemoteNotificationsForBundleIdentifier:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __88__UNCRemoteNotificationServer_invalidateTokenForRemoteNotificationsForBundleIdentifier___block_invoke;
  v7[3] = &unk_251AE01A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __88__UNCRemoteNotificationServer_invalidateTokenForRemoteNotificationsForBundleIdentifier___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_invalidateTokenForBundleIdentifier:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_queue_removeRegistrationForBundleIdentifier:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_queue_calculateTopics");
}

- (void)backgroundRefreshApplicationsDidChange
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__UNCRemoteNotificationServer_backgroundRefreshApplicationsDidChange__block_invoke;
  block[3] = &unk_251AE02A0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __69__UNCRemoteNotificationServer_backgroundRefreshApplicationsDidChange__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_backgroundRefreshApplicationsDidChange");
}

- (void)bluelistStatusChanged
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__UNCRemoteNotificationServer_bluelistStatusChanged__block_invoke;
  block[3] = &unk_251AE02A0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __52__UNCRemoteNotificationServer_bluelistStatusChanged__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  v2 = *MEMORY[0x24BDF89E8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89E8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2499A5000, v2, OS_LOG_TYPE_DEFAULT, "Calculate push topics because bluelist status changed", v4, 2u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_queue_calculateTopics");
}

- (BOOL)allowsRemoteNotificationsForBundleIdentifier:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __76__UNCRemoteNotificationServer_allowsRemoteNotificationsForBundleIdentifier___block_invoke;
  block[3] = &unk_251AE0278;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

uint64_t __76__UNCRemoteNotificationServer_allowsRemoteNotificationsForBundleIdentifier___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_queue_isPushEnabledForApplication:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (void)_queue_invalidateTokenForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_bundleIdentifierToRegistration, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "environment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "tokenIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_environmentsToConnections, "objectForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "invalidateTokenForTopic:identifier:", v4, v7);

  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89E8], OS_LOG_TYPE_ERROR))
  {
    -[UNCRemoteNotificationServer _queue_invalidateTokenForBundleIdentifier:].cold.1();
  }

}

- (void)_queue_removeRegistrationForBundleIdentifier:(id)a3
{
  NSMutableDictionary *bundleIdentifierToRegistration;
  id v5;

  bundleIdentifierToRegistration = self->_bundleIdentifierToRegistration;
  v5 = a3;
  -[NSMutableDictionary removeObjectForKey:](bundleIdentifierToRegistration, "removeObjectForKey:", v5);
  -[UNCPushRegistrationRepository removeRegistrationForBundleIdentifier:](self->_pushRegistrationRepository, "removeRegistrationForBundleIdentifier:", v5);

}

- (void)_queue_didCompleteInitialization
{
  NSObject *v3;
  uint8_t v4[16];

  self->_initializationCompleted = 1;
  -[UNCRemoteNotificationServer _queue_reloadRegistrations](self, "_queue_reloadRegistrations");
  -[UNCRemoteNotificationServer _queue_reloadBackgroundAppRefreshDisabledList](self, "_queue_reloadBackgroundAppRefreshDisabledList");
  -[UNCRemoteNotificationServer _queue_calculateTopics](self, "_queue_calculateTopics");
  -[UNCBlueListMonitor setDelegate:](self->_blueListMonitor, "setDelegate:", self);
  v3 = *MEMORY[0x24BDF89E8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89E8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2499A5000, v3, OS_LOG_TYPE_DEFAULT, "Notify APS that all connections are configured", v4, 2u);
  }
  objc_msgSend(MEMORY[0x24BE08738], "notifySafeToSendFilter");
}

+ (id)_newPushServiceConnectionWithEnvironmentName:(id)a3 namedDelegatePort:(id)a4 queue:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;

  v7 = (objc_class *)MEMORY[0x24BE08738];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([v7 alloc], "initWithEnvironmentName:namedDelegatePort:queue:", v10, v9, v8);

  return v11;
}

- (UNCRemoteNotificationServerObserver)observer
{
  return self->_observer;
}

- (void)setObserver:(id)a3
{
  self->_observer = (UNCRemoteNotificationServerObserver *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifiersNeedingToken, 0);
  objc_storeStrong((id *)&self->_environmentsToConnections, 0);
  objc_storeStrong((id *)&self->_bundleIdentifierToRegistration, 0);
  objc_storeStrong((id *)&self->_backgroundAppRefreshDisabledList, 0);
  objc_storeStrong((id *)&self->_visibleUserNotificationEnabledBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_userNotificationEnabledBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_runningBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_restrictedBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_installedBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_foregroundBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_quietServiceExtensionBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_contentAvailableBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_cloudKitBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_apsQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_serviceExtensionManager, 0);
  objc_storeStrong((id *)&self->_blueListMonitor, 0);
  objc_storeStrong((id *)&self->_duetActivityScheduler, 0);
  objc_storeStrong((id *)&self->_pushRegistrationRepository, 0);
  objc_storeStrong((id *)&self->_attachmentsService, 0);
  objc_storeStrong((id *)&self->_notificationRepository, 0);
}

- (void)_queue_connection:didReceiveToken:forTopic:identifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_2499A5000, v0, v1, "Received invalid per-app token for topic %{public}@", v2);
  OUTLINED_FUNCTION_6();
}

- (void)_queue_connection:(void *)a1 didReceiveToken:forTopic:identifier:.cold.2(void *a1)
{
  NSObject *v1;
  uint64_t v2;
  uint8_t v3[24];

  OUTLINED_FUNCTION_5(a1);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_2499A5000, v1, v2, "Received per-app token [%{public}lu] for invalid topic", v3);

  OUTLINED_FUNCTION_8();
}

- (void)_queue_connection:(void *)a1 didReceivePublicToken:.cold.1(void *a1)
{
  NSObject *v1;
  uint64_t v2;
  uint8_t v3[24];

  OUTLINED_FUNCTION_5(a1);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_2499A5000, v1, v2, "Received new public token [%{public}lu] for unknown connection ", v3);

  OUTLINED_FUNCTION_8();
}

- (void)_queue_messageIsValidForDelivery:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];

  v3 = OUTLINED_FUNCTION_5(a1);
  objc_msgSend(a2, "unc_pushTypeDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "topic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_2499A5000, v3, v6, "Received invalid remote notification push type %{public}@ on topic %{public}@", v7);

  OUTLINED_FUNCTION_1();
}

- (void)_queue_messageIsValidForDelivery:(void *)a1 .cold.2(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];

  v3 = OUTLINED_FUNCTION_5(a1);
  objc_msgSend(a2, "unc_pushTypeDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "topic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_2499A5000, v3, v6, "Received remote notification for non-UNC push type %{public}@ on topic %{public}@", v7);

  OUTLINED_FUNCTION_1();
}

- (void)_queue_allowServiceExtensionFilteringForMessage:(void *)a3 .cold.1(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(a3, "unc_pushTypeDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138543618;
  v9 = a1;
  v10 = 2114;
  v11 = v6;
  OUTLINED_FUNCTION_2(&dword_2499A5000, v5, v7, "[%{public}@] Notification filtering will not be allowed because the push type '%{public}@' is not 'Alert'", (uint8_t *)&v8);

  OUTLINED_FUNCTION_1();
}

- (void)_queue_tryToModifyNotificationRequest:bundleIdentifier:message:enforcePushType:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  v3 = 2114;
  v4 = v0;
  OUTLINED_FUNCTION_2(&dword_2499A5000, v1, (uint64_t)v1, "[%{public}@] Error was encountered trying to find service extension: error=%{public}@", v2);
  OUTLINED_FUNCTION_6();
}

- (void)_queue_deliverNotificationRequest:bundleIdentifier:message:enforcePushType:extensionStart:extensionEnd:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_2499A5000, v0, v1, "[%{public}@] NOT delivering push notification contains Apple private user info!", v2);
  OUTLINED_FUNCTION_6();
}

- (void)_queue_didChangeProcessState:(os_log_t)log forBundleIdentifier:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2499A5000, log, OS_LOG_TYPE_ERROR, "Ignore application state change for process without bundle identifier", v1, 2u);
}

- (void)_queue_invalidateTokenForBundleIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_2499A5000, v0, v1, "[%{public}@] Push registration with a nil environment was encountered, will not invalidate token", v2);
  OUTLINED_FUNCTION_6();
}

@end
