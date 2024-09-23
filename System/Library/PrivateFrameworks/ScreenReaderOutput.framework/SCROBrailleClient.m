@implementation SCROBrailleClient

- (SCROBrailleClient)init
{
  return -[SCROBrailleClient initWithDelegate:](self, "initWithDelegate:", 0);
}

- (SCROBrailleClient)initWithDelegate:(id)a3
{
  id v4;
  SCROBrailleClient *v5;
  NSLock *v6;
  NSLock *lock;
  id v8;
  objc_class *v9;
  void *v10;
  uint64_t v11;
  SCRCThreadKey *threadKey;
  uint64_t v13;
  SCRCTargetSelectorTimer *deathTimer;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SCROBrailleClient;
  v5 = -[SCROBrailleClient init](&v16, sel_init);
  if (v5)
  {
    v6 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    lock = v5->_lock;
    v5->_lock = v6;

    v8 = objc_alloc(MEMORY[0x24BE843C0]);
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "initWithDescription:", v10);
    threadKey = v5->_threadKey;
    v5->_threadKey = (SCRCThreadKey *)v11;

    v13 = objc_msgSend(objc_alloc(MEMORY[0x24BE843B8]), "initWithTarget:selector:threadKey:", v5, sel__deathTimerHandler, v5->_threadKey);
    deathTimer = v5->_deathTimer;
    v5->_deathTimer = (SCRCTargetSelectorTimer *)v13;

    -[SCROBrailleClient setDelegate:](v5, "setDelegate:", v4);
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[NSLock lock](self->_lock, "lock");
  -[SCROConnection invalidate](self->_connection, "invalidate");
  -[SCRCTargetSelectorTimer invalidate](self->_deathTimer, "invalidate");
  -[SCRCTargetSelectorTimer invalidate](self->_deathTimer, "invalidate");
  -[NSLock unlock](self->_lock, "unlock");
  v3.receiver = self;
  v3.super_class = (Class)SCROBrailleClient;
  -[SCROBrailleClient dealloc](&v3, sel_dealloc);
}

- (void)_deviceConnected:(id)a3
{
  id v3;

  v3 = -[SCROBrailleClient _lazyConnection](self, "_lazyConnection", a3);
}

- (void)setKeepConnectionAlive:(BOOL)a3
{
  _BOOL4 v3;
  SCRCTargetSelectorTimer *deathTimer;
  id v6;

  v3 = a3;
  -[NSLock lock](self->_lock, "lock");
  if (self->_keepConnectionAlive != v3)
  {
    self->_keepConnectionAlive = v3;
    deathTimer = self->_deathTimer;
    if (!v3)
    {
      -[SCRCTargetSelectorTimer dispatchAfterDelay:](deathTimer, "dispatchAfterDelay:", 5.0);
      -[NSLock unlock](self->_lock, "unlock");
      return;
    }
    -[SCRCTargetSelectorTimer cancel](deathTimer, "cancel");
    -[NSLock unlock](self->_lock, "unlock");
LABEL_6:
    v6 = -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
    return;
  }
  -[NSLock unlock](self->_lock, "unlock");
  if (v3)
    goto LABEL_6;
}

- (BOOL)keepConnectionAlive
{
  return self->_keepConnectionAlive;
}

- (void)_deathTimerHandler
{
  SCROConnection *connection;
  void *v4;
  SCROConnection *v5;

  if (SCROBrailleClientLogMaskKey)
    NSLog(CFSTR("Attempting to close braille connection..."), a2);
  -[NSLock lock](self->_lock, "lock");
  connection = self->_connection;
  if (connection && !self->_keepConnectionAlive)
  {
    -[SCROConnection handlerValueForKey:](connection, "handlerValueForKey:", 64);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v4, "BOOLValue") & 1) == 0)
    {
      -[SCROConnection invalidate](self->_connection, "invalidate");
      v5 = self->_connection;
      self->_connection = 0;

      self->_isReady = 0;
      if (SCROBrailleClientLogMaskKey)
        NSLog(CFSTR("Braille connection closed."));
    }
    else
    {
      -[SCRCTargetSelectorTimer dispatchAfterDelay:](self->_deathTimer, "dispatchAfterDelay:", 5.0);
    }

  }
  -[NSLock unlock](self->_lock, "unlock");
}

- (Class)connectionClass
{
  return (Class)objc_opt_class();
}

- (id)_lazyConnection
{
  NSLock *lock;
  void *v4;
  void *v5;
  SCROConnection *connection;
  SCROConnection *v7;
  SCROConnection *v8;
  SCROConnection *v9;

  lock = self->_lock;
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateByAddingTimeInterval:", 30.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(lock) = -[NSLock lockBeforeDate:](lock, "lockBeforeDate:", v5);

  if ((_DWORD)lock)
  {
    connection = self->_connection;
    if (!connection)
    {
      self->_isReady = 0;
      if (SCROBrailleClientLogMaskKey)
        NSLog(CFSTR("Attempting to open a braille connection..."));
      v7 = (SCROConnection *)objc_msgSend(objc_alloc(-[SCROBrailleClient connectionClass](self, "connectionClass")), "initWithHandlerType:delegate:", 1, self);
      v8 = self->_connection;
      self->_connection = v7;

      connection = self->_connection;
    }
    v9 = connection;
    if (!self->_keepConnectionAlive)
      -[SCRCTargetSelectorTimer dispatchAfterDelay:](self->_deathTimer, "dispatchAfterDelay:", 5.0);
    -[NSLock unlock](self->_lock, "unlock");
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (void)_registerDelegate
{
  id *p_delegate;
  id WeakRetained;
  NSObject *v5;
  id v6;
  char v7;
  id v8;
  char v9;
  id v10;
  char v11;
  id v12;
  char v13;
  id v14;
  char v15;
  id v16;
  char v17;
  id v18;
  char v19;
  id v20;
  char v21;
  id v22;
  char v23;
  id v24;
  char v25;
  id v26;
  char v27;
  id v28;
  char v29;
  id v30;
  char v31;
  id v32;
  char v33;
  id v34;
  char v35;
  id v36;
  char v37;
  id v38;
  char v39;
  id v40;
  char v41;
  id v42;
  char v43;
  id v44;
  char v45;
  id v46;
  char v47;
  id v48;
  char v49;
  id v50;
  char v51;
  id v52;
  char v53;
  id v54;
  char v55;
  id v56;
  char v57;
  uint8_t v58[16];

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained(&self->_delegate);

  if (WeakRetained)
  {
    -[NSLock lock](self->_lock, "lock");
    -[SCROConnection registerHandlerCallbackForKey:](self->_connection, "registerHandlerCallbackForKey:", 74);
    -[SCROConnection registerHandlerCallbackForKey:](self->_connection, "registerHandlerCallbackForKey:", 76);
    _SCROD_LOG();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v58 = 0;
      _os_log_impl(&dword_2115BB000, v5, OS_LOG_TYPE_DEFAULT, "-[SCROBrailleClient _registerDelegate] Register callback: 'Display Configuration Changed'", v58, 2u);
    }

    -[SCROConnection registerHandlerCallbackForKey:](self->_connection, "registerHandlerCallbackForKey:", 72);
    v6 = objc_loadWeakRetained(p_delegate);
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
      self->_wantsDisconnectMessage = 1;
    v8 = objc_loadWeakRetained(p_delegate);
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
      self->_wantsReconnectMessage = 1;
    v10 = objc_loadWeakRetained(p_delegate);
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
      self->_wantsDisplayConfigurationChanged = 1;
    v12 = objc_loadWeakRetained(p_delegate);
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0)
      self->_delegateWantsKeypresses = 1;
    v14 = objc_loadWeakRetained(p_delegate);
    v15 = objc_opt_respondsToSelector();

    if ((v15 & 1) != 0)
      self->_delegateWantsReplaceTextRange = 1;
    v16 = objc_loadWeakRetained(p_delegate);
    v17 = objc_opt_respondsToSelector();

    if ((v17 & 1) != 0)
      -[SCROConnection registerHandlerCallbackForKey:](self->_connection, "registerHandlerCallbackForKey:", 77);
    v18 = objc_loadWeakRetained(p_delegate);
    v19 = objc_opt_respondsToSelector();

    if ((v19 & 1) != 0)
      -[SCROConnection registerHandlerCallbackForKey:](self->_connection, "registerHandlerCallbackForKey:", 75);
    v20 = objc_loadWeakRetained(p_delegate);
    v21 = objc_opt_respondsToSelector();

    if ((v21 & 1) != 0)
      -[SCROConnection registerHandlerCallbackForKey:](self->_connection, "registerHandlerCallbackForKey:", 78);
    v22 = objc_loadWeakRetained(p_delegate);
    v23 = objc_opt_respondsToSelector();

    if ((v23 & 1) != 0)
      -[SCROConnection registerHandlerCallbackForKey:](self->_connection, "registerHandlerCallbackForKey:", 79);
    v24 = objc_loadWeakRetained(p_delegate);
    v25 = objc_opt_respondsToSelector();

    if ((v25 & 1) != 0)
      -[SCROConnection registerHandlerCallbackForKey:](self->_connection, "registerHandlerCallbackForKey:", 80);
    v26 = objc_loadWeakRetained(p_delegate);
    v27 = objc_opt_respondsToSelector();

    if ((v27 & 1) != 0)
      -[SCROConnection registerHandlerCallbackForKey:](self->_connection, "registerHandlerCallbackForKey:", 81);
    v28 = objc_loadWeakRetained(p_delegate);
    v29 = objc_opt_respondsToSelector();

    if ((v29 & 1) != 0)
      -[SCROConnection registerHandlerCallbackForKey:](self->_connection, "registerHandlerCallbackForKey:", 82);
    v30 = objc_loadWeakRetained(p_delegate);
    v31 = objc_opt_respondsToSelector();

    if ((v31 & 1) != 0)
      -[SCROConnection registerHandlerCallbackForKey:](self->_connection, "registerHandlerCallbackForKey:", 83);
    v32 = objc_loadWeakRetained(p_delegate);
    v33 = objc_opt_respondsToSelector();

    if ((v33 & 1) != 0)
      -[SCROConnection registerHandlerCallbackForKey:](self->_connection, "registerHandlerCallbackForKey:", 84);
    v34 = objc_loadWeakRetained(p_delegate);
    v35 = objc_opt_respondsToSelector();

    if ((v35 & 1) != 0)
      -[SCROConnection registerHandlerCallbackForKey:](self->_connection, "registerHandlerCallbackForKey:", 85);
    v36 = objc_loadWeakRetained(p_delegate);
    v37 = objc_opt_respondsToSelector();

    if ((v37 & 1) != 0)
      -[SCROConnection registerHandlerCallbackForKey:](self->_connection, "registerHandlerCallbackForKey:", 86);
    v38 = objc_loadWeakRetained(p_delegate);
    v39 = objc_opt_respondsToSelector();

    if ((v39 & 1) != 0)
      -[SCROConnection registerHandlerCallbackForKey:](self->_connection, "registerHandlerCallbackForKey:", 87);
    v40 = objc_loadWeakRetained(p_delegate);
    v41 = objc_opt_respondsToSelector();

    if ((v41 & 1) != 0)
      -[SCROConnection registerHandlerCallbackForKey:](self->_connection, "registerHandlerCallbackForKey:", 90);
    v42 = objc_loadWeakRetained(p_delegate);
    v43 = objc_opt_respondsToSelector();

    if ((v43 & 1) != 0)
      -[SCROConnection registerHandlerCallbackForKey:](self->_connection, "registerHandlerCallbackForKey:", 88);
    v44 = objc_loadWeakRetained(p_delegate);
    v45 = objc_opt_respondsToSelector();

    if ((v45 & 1) != 0)
      -[SCROConnection registerHandlerCallbackForKey:](self->_connection, "registerHandlerCallbackForKey:", 89);
    v46 = objc_loadWeakRetained(p_delegate);
    v47 = objc_opt_respondsToSelector();

    if ((v47 & 1) != 0)
      -[SCROConnection registerHandlerCallbackForKey:](self->_connection, "registerHandlerCallbackForKey:", 91);
    v48 = objc_loadWeakRetained(p_delegate);
    v49 = objc_opt_respondsToSelector();

    if ((v49 & 1) != 0)
      -[SCROConnection registerHandlerCallbackForKey:](self->_connection, "registerHandlerCallbackForKey:", 73);
    v50 = objc_loadWeakRetained(p_delegate);
    v51 = objc_opt_respondsToSelector();

    if ((v51 & 1) != 0)
      -[SCROConnection registerHandlerCallbackForKey:](self->_connection, "registerHandlerCallbackForKey:", 92);
    v52 = objc_loadWeakRetained(p_delegate);
    v53 = objc_opt_respondsToSelector();

    if ((v53 & 1) != 0)
      -[SCROConnection registerHandlerCallbackForKey:](self->_connection, "registerHandlerCallbackForKey:", 93);
    v54 = objc_loadWeakRetained(p_delegate);
    v55 = objc_opt_respondsToSelector();

    if ((v55 & 1) != 0)
      -[SCROConnection registerHandlerCallbackForKey:](self->_connection, "registerHandlerCallbackForKey:", 94);
    v56 = objc_loadWeakRetained(p_delegate);
    v57 = objc_opt_respondsToSelector();

    if ((v57 & 1) != 0)
      -[SCROConnection registerHandlerCallbackForKey:](self->_connection, "registerHandlerCallbackForKey:", 95);
    -[NSLock unlock](self->_lock, "unlock");
  }
}

- (void)setDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _SCROD_LOG();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_2115BB000, v5, OS_LOG_TYPE_DEFAULT, "[SCROBrailleClient setDelegate:%@]", (uint8_t *)&v7, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (WeakRetained != v4)
  {
    objc_storeWeak(&self->_delegate, v4);
    -[SCROBrailleClient _registerDelegate](self, "_registerDelegate");
  }

}

- (id)delegate
{
  return objc_loadWeakRetained(&self->_delegate);
}

- (void)loadDisplayWithBluetoothDeviceAddress:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHandlerValue:forKey:", v4, 24);

}

- (void)loadTactileGraphicsDisplayWithBLEIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHandlerValue:forKey:", v4, 26);

}

- (void)removeDisplayWithBluetoothDeviceAddress:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHandlerValue:forKey:", v4, 25);

}

- (void)setTableIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHandlerValue:forKey:", v4, 27);

}

- (void)setInputTableIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHandlerValue:forKey:", v4, 28);

}

- (void)setAlwaysUsesNemethCodeForTechnicalText:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHandlerValue:forKey:", v4, 29);

}

- (BOOL)alwaysUsesNemethCodeForTechnicalText
{
  void *v2;
  void *v3;
  char v4;

  -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handlerValueForKey:", 29);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)isConfigured
{
  void *v2;
  void *v3;
  char v4;

  -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handlerValueForKey:", 64);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (id)driverConfiguration
{
  void *v2;
  void *v3;

  -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handlerArrayValueForKey:", 66);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setMainAttributedString:(id)a3
{
  uint64_t v4;
  NSMutableAttributedString *v5;
  NSMutableAttributedString *mainStringPending;
  id v7;

  v7 = a3;
  if ((unint64_t)objc_msgSend(v7, "length") > 0x1000)
  {
    objc_msgSend(v7, "attributedSubstringFromRange:", 0, 4096);
    v4 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v4;
  }
  -[NSLock lock](self->_lock, "lock");
  self->_needsDisplay = -[NSMutableAttributedString isEqual:](self->_mainStringPending, "isEqual:", v7) ^ 1;
  v5 = (NSMutableAttributedString *)objc_msgSend(v7, "mutableCopy");
  mainStringPending = self->_mainStringPending;
  self->_mainStringPending = v5;

  -[NSLock unlock](self->_lock, "unlock");
}

- (id)pendingMainAttributedString
{
  void *v3;

  -[NSLock lock](self->_lock, "lock");
  v3 = (void *)-[NSMutableAttributedString copy](self->_mainStringPending, "copy");
  -[NSLock unlock](self->_lock, "unlock");
  return v3;
}

- (id)mainAttributedString
{
  void *v2;
  void *v3;
  void *v4;

  -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handlerValueForKey:", 30);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithAttributedString:", v3);
  else
    v4 = 0;

  return v4;
}

- (void)setAnnouncementString:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "length"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", v5);
    -[SCROBrailleClient setAttributedAnnouncementString:](self, "setAttributedAnnouncementString:", v4);

  }
}

- (void)setAttributedAnnouncementString:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
    -[SCROBrailleClient setMainAttributedString:](self, "setMainAttributedString:", v4);

}

- (void)setAlertString:(id)a3 timeout:(double)a4 priority:(int)a5
{
  uint64_t v5;
  void *v8;
  id v9;

  v5 = *(_QWORD *)&a5;
  v9 = a3;
  if (objc_msgSend(v9, "length"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", v9);
    -[SCROBrailleClient _setMutableAttributedAlertString:timeout:priority:](self, "_setMutableAttributedAlertString:timeout:priority:", v8, v5, a4);

  }
}

- (void)setAttributedAlertString:(id)a3 timeout:(double)a4 priority:(int)a5
{
  uint64_t v5;
  id v8;

  v5 = *(_QWORD *)&a5;
  v8 = (id)objc_msgSend(a3, "mutableCopy");
  -[SCROBrailleClient _setMutableAttributedAlertString:timeout:priority:](self, "_setMutableAttributedAlertString:timeout:priority:", v8, v5, a4);

}

- (void)_setMutableAttributedAlertString:(id)a3 timeout:(double)a4 priority:(int)a5
{
  uint64_t v5;
  __CFString *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  id v12;

  v5 = *(_QWORD *)&a5;
  v12 = a3;
  if (objc_msgSend(v12, "length"))
  {
    objc_msgSend(v12, "addAttribute:value:range:", kSCROAlertAttribute[0], MEMORY[0x24BDBD1C8], 0, 1);
    v8 = kSCROAlertTimeoutAttribute[0];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addAttribute:value:range:", v8, v9, 0, 1);

    v10 = kSCROAlertPriorityAttribute[0];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addAttribute:value:range:", v10, v11, 0, 1);

    -[SCROBrailleClient setMainAttributedString:](self, "setMainAttributedString:", v12);
  }

}

- (void)clearTimeoutAlert
{
  id v2;

  -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performHandlerActionForKey:", 12);

}

- (void)setAggregatedStatus:(id)a3
{
  NSData *v4;
  NSData *aggregatedStatusPending;
  NSData *v6;

  v4 = (NSData *)a3;
  -[NSLock lock](self->_lock, "lock");
  self->_needsDisplay = -[NSData isEqual:](self->_aggregatedStatusPending, "isEqual:", v4) ^ 1;
  aggregatedStatusPending = self->_aggregatedStatusPending;
  self->_aggregatedStatusPending = v4;
  v6 = v4;

  -[NSLock unlock](self->_lock, "unlock");
}

- (id)pendingAggregatedStatus
{
  void *v3;

  -[NSLock lock](self->_lock, "lock");
  v3 = (void *)-[NSData copy](self->_aggregatedStatusPending, "copy");
  -[NSLock unlock](self->_lock, "unlock");
  return v3;
}

- (id)aggregatedStatus
{
  void *v2;
  void *v3;

  -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handlerValueForKey:", 39);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setVirtualStatusAlignment:(int)a3
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)&a3;
  -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHandlerValue:forKey:", v4, 40);

}

- (int)virtualStatusAlignment
{
  void *v2;
  void *v3;
  int v4;

  -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handlerValueForKey:", 40);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (void)setMasterStatusCellIndex:(int64_t)a3
{
  void *v4;
  id v5;

  -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHandlerValue:forKey:", v4, 41);

}

- (int64_t)masterStatusCellIndex
{
  void *v2;
  void *v3;
  int64_t v4;

  -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handlerValueForKey:", 41);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (void)setShowDotsSevenAndEight:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHandlerValue:forKey:", v4, 32);

}

- (BOOL)showDotsSevenAndEight
{
  void *v2;
  void *v3;
  char v4;

  -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handlerValueForKey:", 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)setContractionMode:(int)a3
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)&a3;
  -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHandlerValue:forKey:", v4, 36);

}

- (int)contractionMode
{
  void *v2;
  void *v3;
  int v4;

  -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handlerValueForKey:", 36);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (void)setInputEightDotBraille:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHandlerValue:forKey:", v4, 34);

}

- (BOOL)inputEightDotBraille
{
  void *v2;
  void *v3;
  char v4;

  -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handlerValueForKey:", 34);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)setShowEightDotBraille:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHandlerValue:forKey:", v4, 33);

}

- (BOOL)showEightDotBraille
{
  void *v2;
  void *v3;
  char v4;

  -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handlerValueForKey:", 33);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)setInputContractionMode:(int)a3
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)&a3;
  -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHandlerValue:forKey:", v4, 37);

}

- (int)inputContractionMode
{
  void *v2;
  void *v3;
  int v4;

  -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handlerValueForKey:", 37);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (void)setAutomaticBrailleTranslationEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHandlerValue:forKey:", v4, 35);

}

- (BOOL)automaticBrailleTranslationEnabled
{
  void *v2;
  void *v3;
  char v4;

  -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handlerValueForKey:", 35);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)setWordWrapEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHandlerValue:forKey:", v4, 43);

}

- (BOOL)wordWrapEnabled
{
  void *v2;
  void *v3;
  char v4;

  -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handlerValueForKey:", 43);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)setPanWithTextCursorEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHandlerValue:forKey:", v4, 44);

}

- (BOOL)panWithTextCursorEnabled
{
  void *v2;
  void *v3;
  char v4;

  -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handlerValueForKey:", 44);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)setAutoAdvanceEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHandlerValue:forKey:", v4, 45);

}

- (BOOL)autoAdvanceEnabled
{
  void *v2;
  void *v3;
  char v4;

  -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handlerValueForKey:", 45);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)setAutoAdvanceDuration:(double)a3
{
  void *v4;
  id v5;

  -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHandlerValue:forKey:", v4, 46);

}

- (double)autoAdvanceDuration
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handlerValueForKey:", 46);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (void)setBlinkEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHandlerValue:forKey:", v4, 47);

}

- (BOOL)blinkEnabled
{
  void *v2;
  void *v3;
  char v4;

  -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handlerValueForKey:", 47);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)setTactileGraphicsImageData:(id)a3
{
  id v5;
  NSData **p_brailleMapCache;
  void *v7;
  NSObject *v8;
  uint8_t v9[16];

  v5 = a3;
  p_brailleMapCache = &self->_brailleMapCache;
  if ((objc_msgSend(v5, "isEqualToData:", self->_brailleMapCache) & 1) == 0)
  {
    -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHandlerValue:forKey:", v5, 49);

    objc_storeStrong((id *)p_brailleMapCache, a3);
    _SCROD_LOG();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_2115BB000, v8, OS_LOG_TYPE_INFO, "Sending image braille data", v9, 2u);
    }

  }
}

- (void)setBrailleMap:(id)a3
{
  id v4;
  void *v5;
  double v6;
  unint64_t v7;
  double v8;
  double v9;
  double v10;
  unint64_t v11;
  float v12;
  double v13;
  double v14;
  char v15;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dimensions");
  if (v6 > 0.0)
  {
    v7 = 0;
    v8 = 0.0;
    do
    {
      objc_msgSend(v4, "dimensions");
      if (v9 > 0.0)
      {
        v10 = 0.0;
        v11 = 1;
        do
        {
          v15 = 0;
          objc_msgSend(v4, "heightAtPoint:", v10, v8);
          v15 = (int)v12;
          objc_msgSend(v5, "appendBytes:length:", &v15, 1);
          v10 = (double)v11;
          objc_msgSend(v4, "dimensions");
          ++v11;
        }
        while (v13 > v10);
      }
      v8 = (double)++v7;
      objc_msgSend(v4, "dimensions");
    }
    while (v14 > (double)v7);
  }
  -[SCROBrailleClient setTactileGraphicsImageData:](self, "setTactileGraphicsImageData:", v5);

}

- (void)setPlanarData:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = a3;
  -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHandlerValue:forKey:", v4, 50);

  _SCROD_LOG();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_2115BB000, v6, OS_LOG_TYPE_INFO, "Sending 2D Braille data", v7, 2u);
  }

}

- (unint64_t)numberOfTextLinesInPlanarBraille
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handlerValueForKey:", 71);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (int)displayMode
{
  void *v2;
  void *v3;
  int v4;

  -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handlerValueForKey:", 67);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (unsigned)persistentKeyModifiers
{
  void *v2;
  void *v3;
  unsigned int v4;

  -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handlerValueForKey:", 42);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (void)setPersistentKeyModifiers:(unsigned int)a3
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)&a3;
  -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHandlerValue:forKey:", v4, 42);

}

- (void)setLastUserInteractionTime:(double)a3
{
  void *v4;
  id v5;

  -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHandlerValue:forKey:", v4, 48);

}

- (void)setExpandedStatusDisplayModeWithStatus:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;

  if (a3)
  {
    v4 = (objc_class *)MEMORY[0x24BDD1688];
    v5 = a3;
    v6 = (id)objc_msgSend([v4 alloc], "initWithString:", CFSTR(" "));
    objc_msgSend(v6, "addAttribute:value:range:", kSCROStatusAttribute[0], v5, 0, 1);

    -[SCROBrailleClient setMainAttributedString:](self, "setMainAttributedString:", v6);
  }
}

- (void)setAnnouncementsDisplayMode
{
  id v2;

  -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performHandlerActionForKey:", 6);

}

- (void)exitCurrentDisplayMode
{
  id v2;

  -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performHandlerActionForKey:", 9);

}

- (void)setDisplayDescriptorCallbackEnabled:(BOOL)a3
{
  _BOOL8 v3;
  SCROConnection *connection;
  NSLock *lock;
  BOOL v7;
  SCROConnection *v8;
  void *v9;
  id v10;

  v3 = a3;
  -[NSLock lock](self->_lock, "lock");
  self->_displayDescriptorCallbackEnabled = v3;
  connection = self->_connection;
  lock = self->_lock;
  if (connection)
    v7 = 1;
  else
    v7 = !v3;
  if (!v7)
  {
    -[NSLock unlock](self->_lock, "unlock");
    -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setHandlerValue:forKey:", v9, 38);

LABEL_8:
    return;
  }
  if (connection)
  {
    v8 = connection;
    -[NSLock unlock](lock, "unlock");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[SCROConnection setHandlerValue:forKey:](v8, "setHandlerValue:forKey:", v10, 38);

    goto LABEL_8;
  }
  -[NSLock unlock](self->_lock, "unlock");
}

- (BOOL)displayDescriptorCallbackEnabled
{
  SCROConnection *connection;
  NSLock *lock;
  SCROConnection *v5;
  void *v6;

  -[NSLock lock](self->_lock, "lock");
  connection = self->_connection;
  lock = self->_lock;
  v5 = connection;
  -[NSLock unlock](lock, "unlock");
  -[SCROConnection handlerValueForKey:](v5, "handlerValueForKey:", 38);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v6, "BOOLValue");
  return (char)v5;
}

- (int64_t)tokenForRouterIndex:(int64_t)a3 location:(int64_t *)a4 appToken:(id *)a5 forDisplayWithToken:(int)a6
{
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int64_t v19;

  v11 = objc_alloc(MEMORY[0x24BDBCE70]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v11, "initWithObjectsAndKeys:", v12, CFSTR("index"), v13, CFSTR("displayToken"), 0);

  -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handlerValueForKey:withObject:", 65, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "objectForKey:", kSCROBrailleRouterKeyLocation);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  *a4 = objc_msgSend(v17, "integerValue");

  objc_msgSend(v16, "objectForKey:", kSCROBrailleRouterKeyAppToken[0]);
  *a5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKey:", kSCROBrailleRouterKeyToken[0]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "integerValue");

  return v19;
}

- (id)_getWorkingString
{
  NSMutableAttributedString *mainStringPending;
  void *v4;

  -[NSLock lock](self->_lock, "lock");
  mainStringPending = self->_mainStringPending;
  if (mainStringPending || (mainStringPending = self->_mainStringCache) != 0)
    v4 = (void *)-[NSMutableAttributedString copy](mainStringPending, "copy");
  else
    v4 = 0;
  -[NSLock unlock](self->_lock, "unlock");
  if (!v4)
  {
    -[SCROBrailleClient mainAttributedString](self, "mainAttributedString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)tokenArray
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;

  -[SCROBrailleClient _getWorkingString](self, "_getWorkingString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "length");
  v10 = 0;
  v11 = 0;
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    do
    {
      objc_msgSend(v2, "attribute:atIndex:longestEffectiveRange:inRange:", kSCROTokenAttribute[0], v6, &v10, v6, v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        objc_msgSend(v3, "addObject:", v7);
      v8 = v11 + v10;
      v5 = v6 + v5 - (v11 + v10);

      v6 = v8;
    }
    while (v5);
  }

  return v3;
}

- (_NSRange)rangeOfCellRepresentingCharacterAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  _NSRange result;

  -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handlerValueForKey:withObject:", 68, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "rangeValue");
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.length = v11;
  result.location = v10;
  return result;
}

- (void)setSelection:(_NSRange)a3 forToken:(int64_t)a4
{
  NSUInteger length;
  NSUInteger location;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  NSRange v12;
  NSRange v13;
  NSRange v14;
  __CFString **v15;
  __CFString *v16;
  NSRange v17;

  length = a3.length;
  location = a3.location;
  v17.location = 0;
  v17.length = 0;
  -[SCROBrailleClient _getWorkingString](self, "_getWorkingString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  v10 = kSCROTokenAttribute[0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = objc_msgSend(v9, "getRange:ofAttribute:withValue:", &v17, v10, v11);

  if ((_DWORD)v10)
  {
    objc_msgSend(v9, "removeAttribute:range:", kSCROSelectionAttribute[0], v17.location, v17.length);
    objc_msgSend(v9, "removeAttribute:range:", kSCROCursorAttribute[0], v17.location, v17.length);
    v12 = v17;
    if (length <= 1)
      v13.length = 1;
    else
      v13.length = length;
    v13.location = v17.location + location;
    v14 = NSIntersectionRange(v13, v12);
    if (length)
      v15 = kSCROSelectionAttribute;
    else
      v15 = kSCROCursorAttribute;
    v16 = *v15;
    if (v14.length)
      objc_msgSend(v9, "addAttribute:value:range:", v16, MEMORY[0x24BDBD1C8], v14.location, v14.length);
    -[SCROBrailleClient setMainAttributedString:](self, "setMainAttributedString:", v9);

  }
}

- (void)selectAllForToken:(int64_t)a3
{
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  v9 = 0;
  v10 = 0;
  -[SCROBrailleClient _getWorkingString](self, "_getWorkingString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v7 = kSCROTokenAttribute[0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v6, "getRange:ofAttribute:withValue:", &v9, v7, v8);

  if ((_DWORD)v7)
  {
    objc_msgSend(v6, "addAttribute:value:range:", kSCROSelectionAttribute[0], MEMORY[0x24BDBD1C8], v9, v10);
    -[SCROBrailleClient setMainAttributedString:](self, "setMainAttributedString:", v6);
  }

}

- (void)unselectAllForToken:(int64_t)a3
{
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  v9 = 0;
  v10 = 0;
  -[SCROBrailleClient _getWorkingString](self, "_getWorkingString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v7 = kSCROTokenAttribute[0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v6, "getRange:ofAttribute:withValue:", &v9, v7, v8);

  if ((_DWORD)v7)
  {
    objc_msgSend(v6, "removeAttribute:range:", kSCROCursorAttribute[0], v9, v10);
    objc_msgSend(v6, "removeAttribute:range:", kSCROSelectionAttribute[0], v9, v10);
    -[SCROBrailleClient setMainAttributedString:](self, "setMainAttributedString:", v6);
  }

}

- (void)setFocused:(BOOL)a3 forToken:(int64_t)a4
{
  _BOOL4 v5;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;

  v5 = a3;
  v11 = 0;
  v12 = 0;
  -[SCROBrailleClient _getWorkingString](self, "_getWorkingString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  v9 = kSCROTokenAttribute[0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v8, "getRange:ofAttribute:withValue:", &v11, v9, v10);

  if ((_DWORD)v9)
  {
    if (v5)
      objc_msgSend(v8, "addAttribute:value:range:", kSCROFocusedAttribute[0], MEMORY[0x24BDBD1C8], v11, v12);
    else
      objc_msgSend(v8, "removeAttribute:range:", kSCROFocusedAttribute[0], v11, v12);
    -[SCROBrailleClient setMainAttributedString:](self, "setMainAttributedString:", v8);
  }

}

- (BOOL)needsDisplay
{
  return self->_needsDisplay;
}

- (void)displayIfNeeded
{
  if (-[SCROBrailleClient needsDisplay](self, "needsDisplay"))
    -[SCROBrailleClient display](self, "display");
}

- (void)display
{
  NSMutableAttributedString *mainStringPending;
  NSMutableAttributedString *v4;
  NSData *aggregatedStatusPending;
  NSData *v6;
  void *v7;
  id v8;

  v8 = -[SCROEvent initForHandlerType:]([SCROEvent alloc], "initForHandlerType:", 1);
  -[NSLock lock](self->_lock, "lock");
  mainStringPending = self->_mainStringPending;
  if (mainStringPending)
  {
    objc_msgSend(v8, "requestSetValue:forKey:", self->_mainStringPending, 30);
    objc_storeStrong((id *)&self->_mainStringCache, self->_mainStringPending);
    v4 = self->_mainStringPending;
    self->_mainStringPending = 0;

  }
  aggregatedStatusPending = self->_aggregatedStatusPending;
  if (aggregatedStatusPending)
  {
    objc_msgSend(v8, "requestSetValue:forKey:", aggregatedStatusPending, 39);
    objc_storeStrong((id *)&self->_aggregatedStatusCache, self->_aggregatedStatusPending);
    v6 = self->_aggregatedStatusPending;
    self->_aggregatedStatusPending = 0;

    -[NSLock unlock](self->_lock, "unlock");
LABEL_6:
    -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sendEvent:", v8);

    goto LABEL_7;
  }
  -[NSLock unlock](self->_lock, "unlock");
  if (mainStringPending)
    goto LABEL_6;
LABEL_7:

}

- (void)simulateKeypress:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHandlerValue:forKey:", v4, 56);

}

- (void)panDisplayLeft:(int)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHandlerValue:forKey:", v5, 52);

}

- (void)panDisplayRight:(int)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHandlerValue:forKey:", v5, 53);

}

- (void)panDisplayBeginning:(int)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHandlerValue:forKey:", v5, 54);

}

- (void)panDisplayEnd:(int)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHandlerValue:forKey:", v5, 55);

}

- (void)planarPanDisplayLeft:(int)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHandlerValue:forKey:", v5, 62);

}

- (void)planarPanDisplayRight:(int)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHandlerValue:forKey:", v5, 63);

}

- (void)showPreviousAnnouncement
{
  id v2;

  -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performHandlerActionForKey:", 8);

}

- (void)showNextAnnouncement
{
  id v2;

  -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performHandlerActionForKey:", 7);

}

- (BOOL)isCandidateSelectionOn
{
  void *v2;
  void *v3;
  char v4;

  -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handlerValueForKey:", 69);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)cancelCandidateSelection
{
  id v2;

  -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performHandlerActionForKey:", 13);

}

- (void)showPreviousCandidate
{
  id v2;

  -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performHandlerActionForKey:", 14);

}

- (void)showNextCandidate
{
  id v2;

  -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performHandlerActionForKey:", 15);

}

- (BOOL)isWordDescriptionOn
{
  void *v2;
  void *v3;
  char v4;

  -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handlerValueForKey:", 70);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)showPreviousWordDescription
{
  id v2;

  -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performHandlerActionForKey:", 16);

}

- (void)showNextWordDescription
{
  id v2;

  -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performHandlerActionForKey:", 17);

}

- (unint64_t)loadVirtualDisplayWithMainSize:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;

  -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handlerValueForKey:withObject:", 19, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  return v7;
}

- (void)unloadVirtualDisplay:(unint64_t)a3
{
  void *v4;
  id v5;

  -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHandlerValue:forKey:", v4, 18);

}

- (id)mainCellsForVirtualDisplay:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handlerValueForKey:withObject:", 20, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)virtualDisplay:(unint64_t)a3 pressButton:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v10[0] = CFSTR("displayToken");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = CFSTR("button");
  v11[0] = v6;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHandlerValue:forKey:", v8, 21);

}

- (void)virtualDisplay:(unint64_t)a3 pressKeyChord:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v10[0] = CFSTR("displayToken");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = CFSTR("keyChord");
  v11[0] = v6;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHandlerValue:forKey:", v8, 22);

}

- (void)virtualDisplay:(unint64_t)a3 pressRouterWithIndex:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v10[0] = CFSTR("displayToken");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = CFSTR("index");
  v11[0] = v6;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHandlerValue:forKey:", v8, 23);

}

- (void)setPrepareToMemorizeNextKey:(BOOL)a3 immediate:(BOOL)a4 forDisplayWithToken:(int)a5
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a4;
  v7 = a3;
  v9 = objc_alloc(MEMORY[0x24BDBCE70]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v9, "initWithObjectsAndKeys:", v10, CFSTR("prepare"), v11, CFSTR("immediate"), v12, CFSTR("displayToken"), 0);

  -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setHandlerValue:forKey:", v14, 57);

}

- (void)setPrimaryBrailleDisplay:(int)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHandlerValue:forKey:", v5, 58);

}

- (void)resetEditingManager
{
  id v2;

  -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performHandlerActionForKey:", 11);

}

- (void)handleCallback:(id)a3
{
  id v4;
  int v5;
  NSObject *v6;
  _BOOL4 wantsDisplayConfigurationChanged;
  void *v8;
  id WeakRetained;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  SCROConnection *v32;
  SCROConnection *connection;
  _DWORD v34[2];
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "key");
  switch(v5)
  {
    case 'H':
      -[NSLock lock](self->_lock, "lock");
      if (!self->_keepConnectionAlive)
        -[SCRCTargetSelectorTimer dispatchAfterDelay:](self->_deathTimer, "dispatchAfterDelay:", 5.0);
      -[NSLock unlock](self->_lock, "unlock");
      _SCROD_LOG();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        wantsDisplayConfigurationChanged = self->_wantsDisplayConfigurationChanged;
        objc_msgSend(v4, "object");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v34[0] = 67109378;
        v34[1] = wantsDisplayConfigurationChanged;
        v35 = 2112;
        v36 = v8;
        _os_log_impl(&dword_2115BB000, v6, OS_LOG_TYPE_DEFAULT, "-[SCROBrailleClient handleCallback:] Call delegate's config change handler; Delegate wants == %d, isConfigured == %@",
          (uint8_t *)v34,
          0x12u);

      }
      if (self->_wantsDisplayConfigurationChanged)
      {
        WeakRetained = objc_loadWeakRetained(&self->_delegate);
        objc_msgSend(v4, "object");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "handleBrailleConfigurationChanged:", v10);
        goto LABEL_40;
      }
      goto LABEL_45;
    case 'I':
      WeakRetained = objc_loadWeakRetained(&self->_delegate);
      objc_msgSend(v4, "object");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "handleBrailleTableFailedToLoad:", v10);
      goto LABEL_40;
    case 'J':
      if (!self->_delegateWantsKeypresses)
        goto LABEL_45;
      WeakRetained = objc_loadWeakRetained(&self->_delegate);
      objc_msgSend(v4, "object");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "handleBrailleKeypress:", v10);
      goto LABEL_40;
    case 'K':
      WeakRetained = objc_loadWeakRetained(&self->_delegate);
      objc_msgSend(WeakRetained, "handleUserEventOccured");
      goto LABEL_41;
    case 'L':
      if (!self->_delegateWantsReplaceTextRange)
        goto LABEL_45;
      objc_msgSend(v4, "object");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", kSCROBrailleCallbackReplaceTextRange_RangeKey);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "rangeValue");
      v15 = v14;

      objc_msgSend(v11, "objectForKeyedSubscript:", kSCROBrailleCallbackReplaceTextRange_StringKey);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", kSCROBrailleCallbackReplaceTextRange_CursorKey);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "unsignedIntegerValue");

      v19 = objc_loadWeakRetained(&self->_delegate);
      objc_msgSend(v19, "handleBrailleReplaceTextRange:withString:cursor:", v13, v15, v16, v18);
      goto LABEL_22;
    case 'M':
      WeakRetained = objc_loadWeakRetained(&self->_delegate);
      objc_msgSend(WeakRetained, "handleBrailleStartEditing");
      goto LABEL_41;
    case 'N':
      objc_msgSend(v4, "object");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", kSCROBrailleCallbackSpeechFeedback_SpokenTextKey);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", kSCROBrailleCallbackSpeechFeedback_SpeakLiterallyKey);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "BOOLValue");

      v19 = objc_loadWeakRetained(&self->_delegate);
      objc_msgSend(v19, "handleBrailleInsertedUntranslatedText:speakLiterally:", v16, v21);
      goto LABEL_22;
    case 'O':
      objc_msgSend(v4, "object");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_44;
      objc_msgSend(v11, "objectForKeyedSubscript:", kSCROBrailleCallbackSpeechFeedback_SpokenTextKey);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", kSCROBrailleCallbackSpeechFeedback_SpeakLiterallyKey);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "BOOLValue");

      v19 = objc_loadWeakRetained(&self->_delegate);
      objc_msgSend(v19, "handleBrailleDeletedUntranslatedText:speakLiterally:", v16, v23);
LABEL_22:

LABEL_24:
      goto LABEL_44;
    case 'P':
      objc_msgSend(v4, "object");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", kSCROBrailleCallbackSpeechFeedback_SpokenTextKey);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", kSCROBrailleCallbackSpeechFeedback_LanguageKey);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_loadWeakRetained(&self->_delegate);
      objc_msgSend(v25, "handleBrailleSpeechRequest:language:", v16, v24);

      goto LABEL_24;
    case 'Q':
      WeakRetained = objc_loadWeakRetained(&self->_delegate);
      objc_msgSend(v4, "object");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "handleBrailleKeyWillMemorize:", v10);
      goto LABEL_40;
    case 'R':
      WeakRetained = objc_loadWeakRetained(&self->_delegate);
      objc_msgSend(v4, "object");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "handleBrailleKeyMemorize:", v10);
      goto LABEL_40;
    case 'S':
      WeakRetained = objc_loadWeakRetained(&self->_delegate);
      objc_msgSend(v4, "object");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "handleBrailleDidDisplay:", v10);
      goto LABEL_40;
    case 'T':
      objc_msgSend(v4, "object");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_loadWeakRetained(&self->_delegate);
      objc_msgSend(v11, "objectForKey:", CFSTR("success"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:", CFSTR("token"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:", CFSTR("appToken"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("lineOffset"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleBrailleDidPanLeft:elementToken:appToken:lineOffset:", v27, v28, v29, v30);
      goto LABEL_30;
    case 'U':
      objc_msgSend(v4, "object");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_loadWeakRetained(&self->_delegate);
      objc_msgSend(v11, "objectForKey:", CFSTR("success"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:", CFSTR("token"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:", CFSTR("appToken"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("lineOffset"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleBrailleDidPanRight:elementToken:appToken:lineOffset:", v27, v28, v29, v30);
LABEL_30:

      goto LABEL_43;
    case 'V':
      WeakRetained = objc_loadWeakRetained(&self->_delegate);
      objc_msgSend(v4, "object");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "handleBrailleDidShowPreviousAnnouncement:", v10);
      goto LABEL_40;
    case 'W':
      WeakRetained = objc_loadWeakRetained(&self->_delegate);
      objc_msgSend(v4, "object");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "handleBrailleDidShowNextAnnouncement:", v10);
      goto LABEL_40;
    case 'X':
      WeakRetained = objc_loadWeakRetained(&self->_delegate);
      objc_msgSend(WeakRetained, "handleBraillePlayBorderHitSound");
      goto LABEL_41;
    case 'Y':
      WeakRetained = objc_loadWeakRetained(&self->_delegate);
      objc_msgSend(WeakRetained, "handleBraillePlayCommandNotSupportedSound");
      goto LABEL_41;
    case 'Z':
      WeakRetained = objc_loadWeakRetained(&self->_delegate);
      objc_msgSend(v4, "object");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "handleBraillePlayDisplayConnectionSound:", v10);
      goto LABEL_40;
    case '[':
      WeakRetained = objc_loadWeakRetained(&self->_delegate);
      objc_msgSend(v4, "object");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "handleFailedToLoadBluetoothDevice:", v10);
      goto LABEL_40;
    case '\\':
      WeakRetained = objc_loadWeakRetained(&self->_delegate);
      objc_msgSend(v4, "object");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "handleDisplayModeChanged:", v10);
      goto LABEL_40;
    case ']':
      WeakRetained = objc_loadWeakRetained(&self->_delegate);
      objc_msgSend(v4, "object");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "handleBrailleDisplayCopyStringToClipboard:", v10);
      goto LABEL_40;
    case '^':
      WeakRetained = objc_loadWeakRetained(&self->_delegate);
      objc_msgSend(v4, "object");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "handleTactileGraphicsCanvasDidChange:", v10);
LABEL_40:

LABEL_41:
      goto LABEL_45;
    case '_':
      objc_msgSend(v4, "object");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_loadWeakRetained(&self->_delegate);
      objc_msgSend(v4, "object");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handlePlanarPanFailedIsLeft:", objc_msgSend(v27, "BOOLValue"));
LABEL_43:

      goto LABEL_44;
    default:
      if (v5 == 3)
      {
        _SCROD_LOG();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v34[0]) = 0;
          _os_log_impl(&dword_2115BB000, v31, OS_LOG_TYPE_DEFAULT, "[SCROBrailleClient handleCallback:] for key CallbackConnect", (uint8_t *)v34, 2u);
        }

        -[NSLock lock](self->_lock, "lock");
        objc_msgSend(v4, "object");
        v32 = (SCROConnection *)objc_claimAutoreleasedReturnValue();
        connection = self->_connection;

        -[NSLock unlock](self->_lock, "unlock");
        if (v32 == connection)
        {
          self->_isReady = 1;
          -[SCROBrailleClient _registerDelegate](self, "_registerDelegate");
          -[SCROBrailleClient _refreshAfterReconnect](self, "_refreshAfterReconnect");
          if (self->_wantsReconnectMessage)
          {
            v11 = objc_loadWeakRetained(&self->_delegate);
            objc_msgSend(v11, "handleBrailleDidReconnect:", self);
            goto LABEL_44;
          }
        }
      }
      else if (v5 == 4)
      {
        self->_isReady = 0;
        if (self->_wantsDisconnectMessage)
        {
          v11 = objc_loadWeakRetained(&self->_delegate);
          objc_msgSend(v11, "handleBrailleDidDisconnect:", self);
LABEL_44:

        }
      }
LABEL_45:

      return;
  }
}

- (void)_refreshAfterReconnect
{
  _BOOL4 displayDescriptorCallbackEnabled;

  -[NSLock lock](self->_lock, "lock");
  if (!self->_mainStringPending)
    objc_storeStrong((id *)&self->_mainStringPending, self->_mainStringCache);
  if (!self->_aggregatedStatusPending)
    objc_storeStrong((id *)&self->_aggregatedStatusPending, self->_aggregatedStatusCache);
  displayDescriptorCallbackEnabled = self->_displayDescriptorCallbackEnabled;
  -[NSLock unlock](self->_lock, "unlock");
  -[SCROBrailleClient display](self, "display");
  if (displayDescriptorCallbackEnabled)
    -[SCROBrailleClient setDisplayDescriptorCallbackEnabled:](self, "setDisplayDescriptorCallbackEnabled:", 1);
}

- (BOOL)isConnected
{
  return self->_isReady;
}

- (void)setSingleLetterInputIsOn:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHandlerValue:forKey:", v4, 59);

}

- (void)setTextSearchModeIsOn:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHandlerValue:forKey:", v4, 60);

}

- (void)setBrailleChordDebounceTimeout:(double)a3
{
  void *v4;
  id v5;

  -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHandlerValue:forKey:", v4, 61);

}

+ (id)statusAttributeDotText
{
  void *v2;
  uint64_t i;

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 8; ++i)
    objc_msgSend(v2, "addObject:", kSCROStatusAttributeDotText[i]);
  return v2;
}

- (void)translateBrailleToClipboard
{
  id v2;

  -[SCROBrailleClient _lazyConnection](self, "_lazyConnection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performHandlerActionForKey:", 10);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_brailleMapCache, 0);
  objc_storeStrong((id *)&self->_deathTimer, 0);
  objc_storeStrong((id *)&self->_threadKey, 0);
  objc_storeStrong((id *)&self->_aggregatedStatusCache, 0);
  objc_storeStrong((id *)&self->_aggregatedStatusPending, 0);
  objc_storeStrong((id *)&self->_mainStringCache, 0);
  objc_storeStrong((id *)&self->_mainStringPending, 0);
  objc_destroyWeak(&self->_delegate);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
