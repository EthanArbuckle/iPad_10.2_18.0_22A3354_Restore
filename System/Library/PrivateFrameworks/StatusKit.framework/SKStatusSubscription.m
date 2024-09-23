@implementation SKStatusSubscription

- (SKStatusSubscription)initWithSubscriptionMetadata:(id)a3 daemonConnection:(id)a4
{
  id v7;
  id v8;
  SKStatusSubscription *v9;
  SKStatusSubscription *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SKStatusSubscription;
  v9 = -[SKStatusSubscription init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_subscriptionMetadata, a3);
    objc_storeStrong((id *)&v10->_daemonConnection, a4);
  }

  return v10;
}

- (void)retainTransientSubscriptionAssertionWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SKStatusSubscriptionMetadata subscriptionIdentifier](self->_subscriptionMetadata, "subscriptionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKStatusSubscriptionMetadata statusTypeIdentifier](self->_subscriptionMetadata, "statusTypeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKStatusSubscription logger](SKStatusSubscription, "logger");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v5;
    _os_log_impl(&dword_213251000, v7, OS_LOG_TYPE_DEFAULT, "Retaining transient subscription assertion for subscriptionIdentifier %@", buf, 0xCu);
  }

  -[SKStatusSubscription daemonConnection](self, "daemonConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "asynchronousRemoteDaemonWithErrorHandler:", &__block_literal_global_6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __75__SKStatusSubscription_retainTransientSubscriptionAssertionWithCompletion___block_invoke_1;
  v12[3] = &unk_24CF73820;
  v13 = v5;
  v14 = v4;
  v10 = v4;
  v11 = v5;
  objc_msgSend(v9, "retainTransientSubscriptionAssertionForSubscriptionIdentifier:statusTypeIdentifier:completion:", v11, v6, v12);

}

void __75__SKStatusSubscription_retainTransientSubscriptionAssertionWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[SKStatusSubscription logger](SKStatusSubscription, "logger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __75__SKStatusSubscription_retainTransientSubscriptionAssertionWithCompletion___block_invoke_cold_1();

}

void __75__SKStatusSubscription_retainTransientSubscriptionAssertionWithCompletion___block_invoke_1(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  +[SKStatusSubscription logger](SKStatusSubscription, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __75__SKStatusSubscription_retainTransientSubscriptionAssertionWithCompletion___block_invoke_1_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_213251000, v5, OS_LOG_TYPE_DEFAULT, "Successfully retained transient subscription assertion for subscription identifier %@", (uint8_t *)&v8, 0xCu);
  }

  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);

}

- (void)releaseTransientSubscriptionAssertionWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SKStatusSubscriptionMetadata subscriptionIdentifier](self->_subscriptionMetadata, "subscriptionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKStatusSubscriptionMetadata statusTypeIdentifier](self->_subscriptionMetadata, "statusTypeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKStatusSubscription logger](SKStatusSubscription, "logger");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v5;
    _os_log_impl(&dword_213251000, v7, OS_LOG_TYPE_DEFAULT, "Releasing transient subscription assertion for subscriptionIdentifier %@", buf, 0xCu);
  }

  -[SKStatusSubscription daemonConnection](self, "daemonConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "asynchronousRemoteDaemonWithErrorHandler:", &__block_literal_global_2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __76__SKStatusSubscription_releaseTransientSubscriptionAssertionWithCompletion___block_invoke_3;
  v12[3] = &unk_24CF73820;
  v13 = v5;
  v14 = v4;
  v10 = v4;
  v11 = v5;
  objc_msgSend(v9, "releaseTransientSubscriptionAssertionForSubscriptionIdentifier:statusTypeIdentifier:completion:", v11, v6, v12);

}

void __76__SKStatusSubscription_releaseTransientSubscriptionAssertionWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[SKStatusSubscription logger](SKStatusSubscription, "logger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __76__SKStatusSubscription_releaseTransientSubscriptionAssertionWithCompletion___block_invoke_cold_1();

}

void __76__SKStatusSubscription_releaseTransientSubscriptionAssertionWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  +[SKStatusSubscription logger](SKStatusSubscription, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __76__SKStatusSubscription_releaseTransientSubscriptionAssertionWithCompletion___block_invoke_3_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_213251000, v5, OS_LOG_TYPE_DEFAULT, "Successfully released transient subscription assertion for subscription identifier %@", (uint8_t *)&v8, 0xCu);
  }

  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);

}

- (void)retainPersistentSubscriptionAssertionForApplicationIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[SKStatusSubscriptionMetadata subscriptionIdentifier](self->_subscriptionMetadata, "subscriptionIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKStatusSubscriptionMetadata statusTypeIdentifier](self->_subscriptionMetadata, "statusTypeIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKStatusSubscription logger](SKStatusSubscription, "logger");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v21 = v8;
    v22 = 2112;
    v23 = v6;
    _os_log_impl(&dword_213251000, v10, OS_LOG_TYPE_DEFAULT, "Retaining persistent subscription assertion for subscriptionIdentifier %@ applicationIdentifier %@", buf, 0x16u);
  }

  -[SKStatusSubscription daemonConnection](self, "daemonConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "asynchronousRemoteDaemonWithErrorHandler:", &__block_literal_global_4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __97__SKStatusSubscription_retainPersistentSubscriptionAssertionForApplicationIdentifier_completion___block_invoke_5;
  v16[3] = &unk_24CF73698;
  v17 = v8;
  v18 = v6;
  v19 = v7;
  v13 = v7;
  v14 = v6;
  v15 = v8;
  objc_msgSend(v12, "retainPersistentSubscriptionAssertionForSubscriptionIdentifier:statusTypeIdentifier:applicationIdentifier:completion:", v15, v9, v14, v16);

}

void __97__SKStatusSubscription_retainPersistentSubscriptionAssertionForApplicationIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[SKStatusSubscription logger](SKStatusSubscription, "logger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __97__SKStatusSubscription_retainPersistentSubscriptionAssertionForApplicationIdentifier_completion___block_invoke_cold_1();

}

void __97__SKStatusSubscription_retainPersistentSubscriptionAssertionForApplicationIdentifier_completion___block_invoke_5(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  +[SKStatusSubscription logger](SKStatusSubscription, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __97__SKStatusSubscription_retainPersistentSubscriptionAssertionForApplicationIdentifier_completion___block_invoke_5_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = a1[4];
    v7 = a1[5];
    v9 = 138412546;
    v10 = v6;
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_213251000, v5, OS_LOG_TYPE_DEFAULT, "Successfully retained persistent subscription assertion for subscription identifier %@ applicationIdentifier %@", (uint8_t *)&v9, 0x16u);
  }

  v8 = a1[6];
  if (v8)
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v3);

}

- (void)releasePersistentSubscriptionAssertionForApplicationIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[SKStatusSubscriptionMetadata subscriptionIdentifier](self->_subscriptionMetadata, "subscriptionIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKStatusSubscriptionMetadata statusTypeIdentifier](self->_subscriptionMetadata, "statusTypeIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKStatusSubscription logger](SKStatusSubscription, "logger");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v21 = v8;
    v22 = 2112;
    v23 = v6;
    _os_log_impl(&dword_213251000, v10, OS_LOG_TYPE_DEFAULT, "Releasing persistent subscription assertion for subscriptionIdentifier %@ applicationIdentifier %@", buf, 0x16u);
  }

  -[SKStatusSubscription daemonConnection](self, "daemonConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "asynchronousRemoteDaemonWithErrorHandler:", &__block_literal_global_6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __98__SKStatusSubscription_releasePersistentSubscriptionAssertionForApplicationIdentifier_completion___block_invoke_7;
  v16[3] = &unk_24CF73698;
  v17 = v8;
  v18 = v6;
  v19 = v7;
  v13 = v7;
  v14 = v6;
  v15 = v8;
  objc_msgSend(v12, "releasePersistentSubscriptionAssertionForSubscriptionIdentifier:statusTypeIdentifier:applicationIdentifier:completion:", v15, v9, v14, v16);

}

void __98__SKStatusSubscription_releasePersistentSubscriptionAssertionForApplicationIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[SKStatusSubscription logger](SKStatusSubscription, "logger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __98__SKStatusSubscription_releasePersistentSubscriptionAssertionForApplicationIdentifier_completion___block_invoke_cold_1();

}

void __98__SKStatusSubscription_releasePersistentSubscriptionAssertionForApplicationIdentifier_completion___block_invoke_7(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  +[SKStatusSubscription logger](SKStatusSubscription, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __98__SKStatusSubscription_releasePersistentSubscriptionAssertionForApplicationIdentifier_completion___block_invoke_7_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = a1[4];
    v7 = a1[5];
    v9 = 138412546;
    v10 = v6;
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_213251000, v5, OS_LOG_TYPE_DEFAULT, "Successfully released persistent subscription assertion for subscription identifier %@ applicationIdentifier %@", (uint8_t *)&v9, 0x16u);
  }

  v8 = a1[6];
  if (v8)
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v3);

}

- (void)deleteSubscriptionWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SKStatusSubscriptionMetadata subscriptionIdentifier](self->_subscriptionMetadata, "subscriptionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKStatusSubscriptionMetadata statusTypeIdentifier](self->_subscriptionMetadata, "statusTypeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKStatusSubscription logger](SKStatusSubscription, "logger");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v5;
    _os_log_impl(&dword_213251000, v7, OS_LOG_TYPE_DEFAULT, "Deleting subscription with subscriptionIdentifier %@", buf, 0xCu);
  }

  -[SKStatusSubscription daemonConnection](self, "daemonConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "asynchronousRemoteDaemonWithErrorHandler:", &__block_literal_global_8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __57__SKStatusSubscription_deleteSubscriptionWithCompletion___block_invoke_9;
  v12[3] = &unk_24CF73820;
  v13 = v5;
  v14 = v4;
  v10 = v4;
  v11 = v5;
  objc_msgSend(v9, "deleteSubscriptionWithIdentifier:statusTypeIdentifier:completion:", v11, v6, v12);

}

void __57__SKStatusSubscription_deleteSubscriptionWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[SKStatusSubscription logger](SKStatusSubscription, "logger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __98__SKStatusSubscription_releasePersistentSubscriptionAssertionForApplicationIdentifier_completion___block_invoke_cold_1();

}

void __57__SKStatusSubscription_deleteSubscriptionWithCompletion___block_invoke_9(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  +[SKStatusSubscription logger](SKStatusSubscription, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __57__SKStatusSubscription_deleteSubscriptionWithCompletion___block_invoke_9_cold_1(a1, (uint64_t)v3, v5);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_213251000, v5, OS_LOG_TYPE_DEFAULT, "Successfully deleting subscription with identifier %@", (uint8_t *)&v8, 0xCu);
  }

  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);

}

- (NSString)subscriptionIdentifier
{
  return -[SKStatusSubscriptionMetadata subscriptionIdentifier](self->_subscriptionMetadata, "subscriptionIdentifier");
}

- (BOOL)isPersonalStatusSubscription
{
  return -[SKStatusSubscriptionMetadata isPersonalStatusSubscription](self->_subscriptionMetadata, "isPersonalStatusSubscription");
}

- (SKPublishedStatus)currentStatus
{
  return -[SKStatusSubscriptionMetadata currentStatus](self->_subscriptionMetadata, "currentStatus");
}

- (NSArray)ownerHandles
{
  return -[SKStatusSubscriptionMetadata ownerHandles](self->_subscriptionMetadata, "ownerHandles");
}

- (id)_ownerHandlesDescription
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[SKStatusSubscription ownerHandles](self, "ownerHandles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "handleString");
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = (void *)v9;
        if (v9)
          v11 = (__CFString *)v9;
        else
          v11 = CFSTR("<nil>");
        v12 = v11;

        objc_msgSend(v3, "addObject:", v12);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }
  v13 = (void *)objc_msgSend(v3, "copy");

  return v13;
}

- (id)description
{
  _BOOL4 v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = -[SKStatusSubscription isPersonalStatusSubscription](self, "isPersonalStatusSubscription");
  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = objc_opt_class();
  -[SKStatusSubscription subscriptionIdentifier](self, "subscriptionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[SKStatusSubscription currentStatus](self, "currentStatus");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p; subscriptionID = \"%@\"; personal = YES; status = \"%@\">"),
      v5,
      self,
      v6,
      v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SKStatusSubscription _ownerHandlesDescription](self, "_ownerHandlesDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKStatusSubscription currentStatus](self, "currentStatus");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p; subscriptionID = \"%@\"; owners = \"%@\"; status = \"%@\">"),
      v5,
      self,
      v6,
      v7,
      v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

+ (id)logger
{
  if (logger_onceToken_6 != -1)
    dispatch_once(&logger_onceToken_6, &__block_literal_global_18);
  return (id)logger__logger_6;
}

void __30__SKStatusSubscription_logger__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.StatusKit", "SKStatusSubscription");
  v1 = (void *)logger__logger_6;
  logger__logger_6 = (uint64_t)v0;

}

- (SKStatusSubscriptionMetadata)subscriptionMetadata
{
  return self->_subscriptionMetadata;
}

- (SKStatusSubscriptionDaemonConnection)daemonConnection
{
  return self->_daemonConnection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemonConnection, 0);
  objc_storeStrong((id *)&self->_subscriptionMetadata, 0);
}

- (SKHandle)ownerHandle
{
  void *v2;
  void *v3;

  -[SKStatusSubscriptionMetadata ownerHandles](self->_subscriptionMetadata, "ownerHandles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SKHandle *)v3;
}

void __75__SKStatusSubscription_retainTransientSubscriptionAssertionWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_213251000, v0, v1, "XPC Error retaining transient subscription assertion. Error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __75__SKStatusSubscription_retainTransientSubscriptionAssertionWithCompletion___block_invoke_1_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_213251000, v0, v1, "Error retaining transient subscription assertion. Error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __76__SKStatusSubscription_releaseTransientSubscriptionAssertionWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_213251000, v0, v1, "XPC Error releasing transient subscription assertion. Error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __76__SKStatusSubscription_releaseTransientSubscriptionAssertionWithCompletion___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_213251000, v0, v1, "Error releasing transient subscription assertion. Error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __97__SKStatusSubscription_retainPersistentSubscriptionAssertionForApplicationIdentifier_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_213251000, v0, v1, "XPC Error retaining persistent subscription assertion. Error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __97__SKStatusSubscription_retainPersistentSubscriptionAssertionForApplicationIdentifier_completion___block_invoke_5_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_213251000, v0, v1, "Error retaining persistent subscription assertion. Error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __98__SKStatusSubscription_releasePersistentSubscriptionAssertionForApplicationIdentifier_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_213251000, v0, v1, "XPC Error releasing persistent subscription assertion. Error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __98__SKStatusSubscription_releasePersistentSubscriptionAssertionForApplicationIdentifier_completion___block_invoke_7_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_213251000, v0, v1, "Error releasing persistent subscription assertion. Error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __57__SKStatusSubscription_deleteSubscriptionWithCompletion___block_invoke_9_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  _os_log_error_impl(&dword_213251000, log, OS_LOG_TYPE_ERROR, "Error deleting subscription with identifier %@. Error: %{public}@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_5();
}

@end
