@implementation SCDAPowerAssertionManager

- (SCDAPowerAssertionManager)initWithIdentifier:(id)a3
{
  id v4;
  SCDAPowerAssertionManager *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  OS_dispatch_queue *queue;
  SCDAAssertionCoordinator *v10;
  SCDAAssertionCoordinator *assertionCoordinator;
  NSObject *v12;
  NSString *v13;
  objc_super v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  SCDAPowerAssertionManager *v19;
  __int16 v20;
  NSString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SCDAPowerAssertionManager;
  v5 = -[SCDAPowerAssertionManager init](&v15, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "length"))
    {
      v6 = objc_msgSend(v4, "copy");
      identifier = v5->_identifier;
      v5->_identifier = (NSString *)v6;
    }
    else
    {
      identifier = v5->_identifier;
      v5->_identifier = (NSString *)CFSTR("com.apple.assistant.scda.power-assertion-manager");
    }

    SCDADispatchSerialQueueWithRelativePriority((const char *)objc_msgSend(CFSTR("com.apple.assistant.scda.power-assertion-manager"), "UTF8String"), QOS_CLASS_DEFAULT, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v8;

    v10 = -[SCDAAssertionCoordinator initWithIdentifier:queue:delegate:]([SCDAAssertionCoordinator alloc], "initWithIdentifier:queue:delegate:", CFSTR("com.apple.assistant.scda.power-assertion-manager"), v5->_queue, v5);
    assertionCoordinator = v5->_assertionCoordinator;
    v5->_assertionCoordinator = v10;

    v5->_powerAssertion = 0;
    v12 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      v13 = v5->_identifier;
      *(_DWORD *)buf = 136315650;
      v17 = "-[SCDAPowerAssertionManager initWithIdentifier:]";
      v18 = 2048;
      v19 = v5;
      v20 = 2112;
      v21 = v13;
      _os_log_impl(&dword_246211000, v12, OS_LOG_TYPE_INFO, "%s %p (%@)", buf, 0x20u);
    }
  }

  return v5;
}

- (void)takePowerAssertionWithName:(id)a3
{
  __CFString *v4;
  NSObject *v5;
  NSString *identifier;
  __CFString *v7;
  __CFString *v8;
  SCDAAssertionCoordinator *assertionCoordinator;
  uint64_t v10;
  __CFString *v11;
  id v12;
  void *v13;
  NSObject *queue;
  __CFString *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  __CFString *v19;
  _QWORD v20[4];
  __CFString *v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  SCDAPowerAssertionManager *v25;
  __int16 v26;
  NSString *v27;
  __int16 v28;
  __CFString *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = (__CFString *)a3;
  v5 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    identifier = self->_identifier;
    *(_DWORD *)buf = 136315906;
    v23 = "-[SCDAPowerAssertionManager takePowerAssertionWithName:]";
    v24 = 2048;
    v25 = self;
    v26 = 2112;
    v27 = identifier;
    v28 = 2112;
    v29 = v4;
    _os_log_impl(&dword_246211000, v5, OS_LOG_TYPE_INFO, "%s %p (%@) name = %@", buf, 0x2Au);
  }
  v7 = CFSTR("default");
  if (v4)
    v7 = v4;
  v8 = v7;
  assertionCoordinator = self->_assertionCoordinator;
  v10 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __56__SCDAPowerAssertionManager_takePowerAssertionWithName___block_invoke;
  v20[3] = &unk_25174A408;
  v11 = v8;
  v21 = v11;
  v12 = +[SCDAAssertionContext newWithBuilder:](SCDAAssertionContext, "newWithBuilder:", v20);
  -[SCDAAssertionCoordinator acquireRelinquishableAssertionWithContext:relinquishmentHandler:](assertionCoordinator, "acquireRelinquishableAssertionWithContext:relinquishmentHandler:", v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  queue = self->_queue;
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __56__SCDAPowerAssertionManager_takePowerAssertionWithName___block_invoke_2;
  v17[3] = &unk_25174A648;
  v17[4] = self;
  v18 = v13;
  v19 = v11;
  v15 = v11;
  v16 = v13;
  dispatch_async(queue, v17);

}

- (void)releasePowerAssertionWithName:(id)a3
{
  __CFString *v4;
  NSObject *v5;
  NSString *identifier;
  __CFString *v7;
  __CFString *v8;
  NSObject *queue;
  __CFString *v10;
  _QWORD v11[5];
  __CFString *v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  SCDAPowerAssertionManager *v16;
  __int16 v17;
  NSString *v18;
  __int16 v19;
  __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = (__CFString *)a3;
  v5 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    identifier = self->_identifier;
    *(_DWORD *)buf = 136315906;
    v14 = "-[SCDAPowerAssertionManager releasePowerAssertionWithName:]";
    v15 = 2048;
    v16 = self;
    v17 = 2112;
    v18 = identifier;
    v19 = 2112;
    v20 = v4;
    _os_log_impl(&dword_246211000, v5, OS_LOG_TYPE_INFO, "%s %p (%@) name = %@", buf, 0x2Au);
  }
  v7 = CFSTR("default");
  if (v4)
    v7 = v4;
  v8 = v7;
  queue = self->_queue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __59__SCDAPowerAssertionManager_releasePowerAssertionWithName___block_invoke;
  v11[3] = &unk_25174A620;
  v11[4] = self;
  v12 = v8;
  v10 = v8;
  dispatch_async(queue, v11);

}

- (void)releaseAllPowerAssertions
{
  NSObject *v3;
  NSString *identifier;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  SCDAPowerAssertionManager *v10;
  __int16 v11;
  NSString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    identifier = self->_identifier;
    *(_DWORD *)buf = 136315650;
    v8 = "-[SCDAPowerAssertionManager releaseAllPowerAssertions]";
    v9 = 2048;
    v10 = self;
    v11 = 2112;
    v12 = identifier;
    _os_log_impl(&dword_246211000, v3, OS_LOG_TYPE_INFO, "%s %p (%@)", buf, 0x20u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__SCDAPowerAssertionManager_releaseAllPowerAssertions__block_invoke;
  block[3] = &unk_25174AD68;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)dealloc
{
  NSObject *v3;
  NSString *identifier;
  objc_super v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  SCDAPowerAssertionManager *v9;
  __int16 v10;
  NSString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    identifier = self->_identifier;
    *(_DWORD *)buf = 136315650;
    v7 = "-[SCDAPowerAssertionManager dealloc]";
    v8 = 2048;
    v9 = self;
    v10 = 2112;
    v11 = identifier;
    _os_log_impl(&dword_246211000, v3, OS_LOG_TYPE_INFO, "%s %p (%@)", buf, 0x20u);
  }
  -[SCDAPowerAssertionManager _releasePowerAssertion](self, "_releasePowerAssertion");
  v5.receiver = self;
  v5.super_class = (Class)SCDAPowerAssertionManager;
  -[SCDAPowerAssertionManager dealloc](&v5, sel_dealloc);
}

- (void)assertionCoordinator:(id)a3 didActivateAssertion:(id)a4 isFirstAssertion:(BOOL)a5
{
  _BOOL4 v5;
  SCDAAssertionCoordinator *v8;
  SCDAAssertionCoordinator *v9;
  SCDAAssertionCoordinator *assertionCoordinator;
  NSObject *v11;
  NSString *v12;
  NSString *identifier;
  int v14;
  const char *v15;
  __int16 v16;
  SCDAPowerAssertionManager *v17;
  __int16 v18;
  NSString *v19;
  __int16 v20;
  SCDAAssertionCoordinator *v21;
  __int16 v22;
  SCDAAssertionCoordinator *v23;
  uint64_t v24;

  v5 = a5;
  v24 = *MEMORY[0x24BDAC8D0];
  v8 = (SCDAAssertionCoordinator *)a3;
  v9 = (SCDAAssertionCoordinator *)a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  assertionCoordinator = self->_assertionCoordinator;
  v11 = SCDALogContextCore;
  if (assertionCoordinator == v8)
  {
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
    {
      identifier = self->_identifier;
      v14 = 136316162;
      v15 = "-[SCDAPowerAssertionManager assertionCoordinator:didActivateAssertion:isFirstAssertion:]";
      v16 = 2048;
      v17 = self;
      v18 = 2112;
      v19 = identifier;
      v20 = 2112;
      v21 = v9;
      v22 = 1024;
      LODWORD(v23) = v5;
      _os_log_debug_impl(&dword_246211000, v11, OS_LOG_TYPE_DEBUG, "%s %p (%@) assertion = %@, isFirstAssertion = %d", (uint8_t *)&v14, 0x30u);
      if (!v5)
        goto LABEL_7;
    }
    else if (!v5)
    {
      goto LABEL_7;
    }
    -[SCDAPowerAssertionManager _createPowerAssertion](self, "_createPowerAssertion");
    goto LABEL_7;
  }
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_ERROR))
  {
    v12 = self->_identifier;
    v14 = 136316162;
    v15 = "-[SCDAPowerAssertionManager assertionCoordinator:didActivateAssertion:isFirstAssertion:]";
    v16 = 2048;
    v17 = self;
    v18 = 2112;
    v19 = v12;
    v20 = 2112;
    v21 = assertionCoordinator;
    v22 = 2112;
    v23 = v8;
    _os_log_error_impl(&dword_246211000, v11, OS_LOG_TYPE_ERROR, "%s %p (%@) Expected assertion coordinator is %@, actual assertion coordinator is %@.", (uint8_t *)&v14, 0x34u);
  }
LABEL_7:

}

- (void)assertionCoordinator:(id)a3 didDeactivateAssertion:(id)a4 isLastAssertion:(BOOL)a5
{
  _BOOL4 v5;
  SCDAAssertionCoordinator *v8;
  SCDAAssertionCoordinator *v9;
  SCDAAssertionCoordinator *assertionCoordinator;
  NSObject *v11;
  NSString *v12;
  NSString *identifier;
  int v14;
  const char *v15;
  __int16 v16;
  SCDAPowerAssertionManager *v17;
  __int16 v18;
  NSString *v19;
  __int16 v20;
  SCDAAssertionCoordinator *v21;
  __int16 v22;
  SCDAAssertionCoordinator *v23;
  uint64_t v24;

  v5 = a5;
  v24 = *MEMORY[0x24BDAC8D0];
  v8 = (SCDAAssertionCoordinator *)a3;
  v9 = (SCDAAssertionCoordinator *)a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  assertionCoordinator = self->_assertionCoordinator;
  v11 = SCDALogContextCore;
  if (assertionCoordinator == v8)
  {
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
    {
      identifier = self->_identifier;
      v14 = 136316162;
      v15 = "-[SCDAPowerAssertionManager assertionCoordinator:didDeactivateAssertion:isLastAssertion:]";
      v16 = 2048;
      v17 = self;
      v18 = 2112;
      v19 = identifier;
      v20 = 2112;
      v21 = v9;
      v22 = 1024;
      LODWORD(v23) = v5;
      _os_log_debug_impl(&dword_246211000, v11, OS_LOG_TYPE_DEBUG, "%s %p (%@) assertion = %@, isLastAssertion = %d", (uint8_t *)&v14, 0x30u);
      if (!v5)
        goto LABEL_7;
    }
    else if (!v5)
    {
      goto LABEL_7;
    }
    -[SCDAPowerAssertionManager _releasePowerAssertion](self, "_releasePowerAssertion");
    goto LABEL_7;
  }
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_ERROR))
  {
    v12 = self->_identifier;
    v14 = 136316162;
    v15 = "-[SCDAPowerAssertionManager assertionCoordinator:didDeactivateAssertion:isLastAssertion:]";
    v16 = 2048;
    v17 = self;
    v18 = 2112;
    v19 = v12;
    v20 = 2112;
    v21 = assertionCoordinator;
    v22 = 2112;
    v23 = v8;
    _os_log_error_impl(&dword_246211000, v11, OS_LOG_TYPE_ERROR, "%s %p (%@) Expected assertion coordinator is %@, actual assertion coordinator is %@.", (uint8_t *)&v14, 0x34u);
  }
LABEL_7:

}

- (void)_createPowerAssertion
{
  uint64_t v3;
  NSString *identifier;
  const char *v5;
  NSObject *v6;
  uint32_t v7;
  NSObject *v8;
  NSString *v9;
  IOPMAssertionID v10;
  uint64_t v11;
  NSString *v12;
  IOPMAssertionID AssertionID;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  SCDAPowerAssertionManager *v17;
  __int16 v18;
  NSString *v19;
  __int16 v20;
  IOPMAssertionID v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (self->_powerAssertion)
  {
    v3 = SCDALogContextCore;
    if (!os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
      return;
    identifier = self->_identifier;
    *(_DWORD *)buf = 136315650;
    v15 = "-[SCDAPowerAssertionManager _createPowerAssertion]";
    v16 = 2048;
    v17 = self;
    v18 = 2112;
    v19 = identifier;
    v5 = "%s %p (%@) powerAssertion != kIOPMNullAssertionID";
    v6 = v3;
    v7 = 32;
    goto LABEL_4;
  }
  AssertionID = 0;
  if (IOPMAssertionCreateWithName(CFSTR("PreventUserIdleSystemSleep"), 0xFFu, (CFStringRef)self->_identifier, &AssertionID))
  {
    v8 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_ERROR))
    {
      v9 = self->_identifier;
      *(_DWORD *)buf = 136315650;
      v15 = "-[SCDAPowerAssertionManager _createPowerAssertion]";
      v16 = 2048;
      v17 = self;
      v18 = 2112;
      v19 = v9;
      _os_log_error_impl(&dword_246211000, v8, OS_LOG_TYPE_ERROR, "%s %p (%@) Failed to create power assertion.", buf, 0x20u);
    }
  }
  else
  {
    v10 = AssertionID;
    self->_powerAssertion = AssertionID;
    v11 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      v12 = self->_identifier;
      *(_DWORD *)buf = 136315906;
      v15 = "-[SCDAPowerAssertionManager _createPowerAssertion]";
      v16 = 2048;
      v17 = self;
      v18 = 2112;
      v19 = v12;
      v20 = 1024;
      v21 = v10;
      v5 = "%s %p (%@) Created power assertion with ID %u.";
      v6 = v11;
      v7 = 38;
LABEL_4:
      _os_log_impl(&dword_246211000, v6, OS_LOG_TYPE_INFO, v5, buf, v7);
    }
  }
}

- (void)_releasePowerAssertion
{
  NSObject *v3;
  NSString *identifier;
  IOPMAssertionID powerAssertion;
  NSObject *v6;
  NSString *v7;
  int v8;
  const char *v9;
  __int16 v10;
  SCDAPowerAssertionManager *v11;
  __int16 v12;
  NSString *v13;
  __int16 v14;
  IOPMAssertionID v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    identifier = self->_identifier;
    v8 = 136315650;
    v9 = "-[SCDAPowerAssertionManager _releasePowerAssertion]";
    v10 = 2048;
    v11 = self;
    v12 = 2112;
    v13 = identifier;
    _os_log_impl(&dword_246211000, v3, OS_LOG_TYPE_INFO, "%s %p (%@)", (uint8_t *)&v8, 0x20u);
  }
  powerAssertion = self->_powerAssertion;
  if (powerAssertion)
  {
    v6 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      v7 = self->_identifier;
      v8 = 136315906;
      v9 = "-[SCDAPowerAssertionManager _releasePowerAssertion]";
      v10 = 2048;
      v11 = self;
      v12 = 2112;
      v13 = v7;
      v14 = 1024;
      v15 = powerAssertion;
      _os_log_impl(&dword_246211000, v6, OS_LOG_TYPE_INFO, "%s %p (%@) Released power assertion ID %u.", (uint8_t *)&v8, 0x26u);
      powerAssertion = self->_powerAssertion;
    }
    IOPMAssertionRelease(powerAssertion);
    self->_powerAssertion = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertionsByName, 0);
  objc_storeStrong((id *)&self->_assertionCoordinator, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

uint64_t __54__SCDAPowerAssertionManager_releaseAllPowerAssertions__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[5];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 40);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __54__SCDAPowerAssertionManager_releaseAllPowerAssertions__block_invoke_2;
  v7[3] = &unk_25174A430;
  v7[4] = v2;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v7);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_releasePowerAssertion");
}

void __54__SCDAPowerAssertionManager_releaseAllPowerAssertions__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(v8 + 8);
    v10 = 136316162;
    v11 = "-[SCDAPowerAssertionManager releaseAllPowerAssertions]_block_invoke_2";
    v12 = 2048;
    v13 = v8;
    v14 = 2112;
    v15 = v9;
    v16 = 2112;
    v17 = v5;
    v18 = 2112;
    v19 = v6;
    _os_log_debug_impl(&dword_246211000, v7, OS_LOG_TYPE_DEBUG, "%s %p (%@), name = %@, assertion = %@", (uint8_t *)&v10, 0x34u);
  }
  objc_msgSend(v6, "relinquishWithContext:options:", 0, 0);

}

void __59__SCDAPowerAssertionManager_releasePowerAssertionWithName___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(_QWORD *)(v6 + 8);
      v8 = 136315906;
      v9 = "-[SCDAPowerAssertionManager releasePowerAssertionWithName:]_block_invoke";
      v10 = 2048;
      v11 = v6;
      v12 = 2112;
      v13 = v7;
      v14 = 2112;
      v15 = v2;
      _os_log_debug_impl(&dword_246211000, v3, OS_LOG_TYPE_DEBUG, "%s %p (%@) assertion = %@", (uint8_t *)&v8, 0x2Au);
    }
    objc_msgSend(v2, "relinquishWithContext:options:", 0, 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count"))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(void **)(v4 + 40);
      *(_QWORD *)(v4 + 40) = 0;

    }
  }

}

void __56__SCDAPowerAssertionManager_takePowerAssertionWithName___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v6 = CFSTR("effectiveName");
  v7[0] = v2;
  v3 = (void *)MEMORY[0x24BDBCE70];
  v4 = a2;
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserInfo:", v5);

}

uint64_t __56__SCDAPowerAssertionManager_takePowerAssertionWithName___block_invoke_2(_QWORD *a1)
{
  NSObject *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
  {
    v8 = a1[4];
    v9 = a1[5];
    v10 = *(_QWORD *)(v8 + 8);
    v11 = 136315906;
    v12 = "-[SCDAPowerAssertionManager takePowerAssertionWithName:]_block_invoke_2";
    v13 = 2048;
    v14 = v8;
    v15 = 2112;
    v16 = v10;
    v17 = 2112;
    v18 = v9;
    _os_log_debug_impl(&dword_246211000, v2, OS_LOG_TYPE_DEBUG, "%s %p (%@) assertion = %@", (uint8_t *)&v11, 0x2Au);
  }
  v3 = *(void **)(a1[4] + 40);
  if (!v3)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v5 = a1[4];
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    v3 = *(void **)(a1[4] + 40);
  }
  return objc_msgSend(v3, "setObject:forKey:", a1[5], a1[6]);
}

@end
