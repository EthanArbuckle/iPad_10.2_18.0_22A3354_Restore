@implementation PRContactAllowlist

- (PRContactAllowlist)init
{
  PRContactAllowlist *v2;
  os_log_t v3;
  OS_os_log *logger;
  NSMutableArray *v5;
  NSMutableArray *allowlist;
  PRBeaconListener *v7;
  PRBeaconListener *nearbyDaemonSession;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PRContactAllowlist;
  v2 = -[PRContactAllowlist init](&v10, sel_init);
  if (v2)
  {
    v3 = os_log_create("com.apple.proximity", "PRContactAllowlist");
    logger = v2->_logger;
    v2->_logger = (OS_os_log *)v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    allowlist = v2->_allowlist;
    v2->_allowlist = v5;

    if (+[PRRangingDevice isSupported](PRRangingDevice, "isSupported"))
    {
      v7 = -[PRBeaconListener initWithDelegate:queue:]([PRBeaconListener alloc], "initWithDelegate:queue:", v2, 0);
      nearbyDaemonSession = v2->_nearbyDaemonSession;
      v2->_nearbyDaemonSession = v7;

    }
    v2->_needToRestart = 0;
  }
  return v2;
}

- (void)addTrustedContact:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  PRRemoteDevice *v8;
  void *v9;
  PRRemoteDevice *v10;
  NSObject *logger;
  NSObject *v12;
  void *v13;
  unint64_t v14;
  OS_os_log *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  const __CFString *v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  v8 = [PRRemoteDevice alloc];
  objc_msgSend(v6, "contactKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PRRemoteDevice initWithBTAdvAddress:](v8, "initWithBTAdvAddress:", v9);

  if (-[NSMutableArray containsObject:](self->_allowlist, "containsObject:", v10))
  {
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
    {
      v12 = logger;
      objc_msgSend(v6, "contactKey");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v21 = v13;
      _os_log_impl(&dword_19BF46000, v12, OS_LOG_TYPE_DEFAULT, "Attempted to add existing contact: %@", buf, 0xCu);

    }
    v7[2](v7, 1, 0);
  }
  else
  {
    v14 = -[NSMutableArray count](self->_allowlist, "count");
    v15 = self->_logger;
    if (v14 < 5)
    {
      if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG))
        -[PRContactAllowlist addTrustedContact:withCompletionHandler:].cold.2(v15);
      -[NSMutableArray addObject:](self->_allowlist, "addObject:", v10);
      -[PRBeaconListener pushBeaconAllowlist:completionHandler:](self->_nearbyDaemonSession, "pushBeaconAllowlist:completionHandler:", self->_allowlist, v7);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR))
        -[PRContactAllowlist addTrustedContact:withCompletionHandler:].cold.1(v15);
      v18 = *MEMORY[0x1E0CB2D50];
      v19 = CFSTR("Contact allowlist full");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      PRErrorWithCodeAndUserInfo(400, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, uint64_t, void *))v7)[2](v7, 0, v17);

    }
  }

}

- (void)removeTrustedContact:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  PRRemoteDevice *v8;
  void *v9;
  PRRemoteDevice *v10;
  NSObject *logger;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  const __CFString *v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  v8 = [PRRemoteDevice alloc];
  objc_msgSend(v6, "contactKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PRRemoteDevice initWithBTAdvAddress:](v8, "initWithBTAdvAddress:", v9);

  if (-[NSMutableArray containsObject:](self->_allowlist, "containsObject:", v10))
  {
    -[NSMutableArray removeObject:](self->_allowlist, "removeObject:", v10);
    if (-[NSMutableArray count](self->_allowlist, "count"))
      -[PRBeaconListener pushBeaconAllowlist:completionHandler:](self->_nearbyDaemonSession, "pushBeaconAllowlist:completionHandler:", self->_allowlist, v7);
    else
      -[PRContactAllowlist clear:](self, "clear:", v7);
  }
  else
  {
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
    {
      v12 = logger;
      objc_msgSend(v6, "contactKey");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v19 = v13;
      _os_log_impl(&dword_19BF46000, v12, OS_LOG_TYPE_DEFAULT, "Attempted to remove unknown contact: %@", buf, 0xCu);

    }
    v16 = *MEMORY[0x1E0CB2D50];
    v17 = CFSTR("Attempted to remove unknown contact");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PRErrorWithCodeAndUserInfo(401, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v15);

  }
}

- (void)clear:(id)a3
{
  NSMutableArray *allowlist;
  id v5;

  allowlist = self->_allowlist;
  v5 = a3;
  -[NSMutableArray removeAllObjects](allowlist, "removeAllObjects");
  -[PRBeaconListener clearBeaconAllowlistWithCompletionHandler:](self->_nearbyDaemonSession, "clearBeaconAllowlistWithCompletionHandler:", v5);

}

- (void)beaconListener:(id)a3 didChangeState:(unint64_t)a4
{
  id v6;
  NSObject *logger;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  PRBeaconListener *nearbyDaemonSession;
  NSMutableArray *allowlist;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  id buf[2];

  v6 = a3;
  switch(a4)
  {
    case 0uLL:
      logger = self->_logger;
      if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_19BF46000, logger, OS_LOG_TYPE_DEFAULT, "PRBeaconListenerStateUnknown", (uint8_t *)buf, 2u);
      }
      if (-[NSMutableArray count](self->_allowlist, "count"))
      {
        v8 = self->_logger;
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          goto LABEL_24;
        LOWORD(buf[0]) = 0;
        goto LABEL_23;
      }
      break;
    case 1uLL:
      v9 = self->_logger;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_19BF46000, v9, OS_LOG_TYPE_DEFAULT, "PRBeaconListenerStateIdle", (uint8_t *)buf, 2u);
      }
      if (self->_needToRestart)
      {
        if (-[NSMutableArray count](self->_allowlist, "count"))
        {
          v10 = self->_logger;
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(buf[0]) = 0;
            _os_log_impl(&dword_19BF46000, v10, OS_LOG_TYPE_DEFAULT, "Attempting to re-establish allowlist", (uint8_t *)buf, 2u);
          }
          objc_initWeak(buf, self);
          allowlist = self->_allowlist;
          nearbyDaemonSession = self->_nearbyDaemonSession;
          v16[0] = MEMORY[0x1E0C809B0];
          v16[1] = 3221225472;
          v16[2] = __52__PRContactAllowlist_beaconListener_didChangeState___block_invoke;
          v16[3] = &unk_1E3D04538;
          objc_copyWeak(&v17, buf);
          -[PRBeaconListener pushBeaconAllowlist:completionHandler:](nearbyDaemonSession, "pushBeaconAllowlist:completionHandler:", allowlist, v16);
          objc_destroyWeak(&v17);
          objc_destroyWeak(buf);
        }
        else if (self->_needToRestart)
        {
          v13 = self->_logger;
          if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            goto LABEL_17;
          LOWORD(buf[0]) = 0;
          v14 = "needToRestart set but allowlist size is 0; clearing needToRestart";
          goto LABEL_16;
        }
      }
      break;
    case 2uLL:
      v13 = self->_logger;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        v14 = "PRBeaconListenerStateListening";
LABEL_16:
        _os_log_impl(&dword_19BF46000, v13, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)buf, 2u);
      }
LABEL_17:
      self->_needToRestart = 0;
      break;
    case 3uLL:
      v15 = self->_logger;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_19BF46000, v15, OS_LOG_TYPE_DEFAULT, "PRBeaconListenerStateUnavailable", (uint8_t *)buf, 2u);
      }
      if (-[NSMutableArray count](self->_allowlist, "count"))
      {
        v8 = self->_logger;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf[0]) = 0;
LABEL_23:
          _os_log_impl(&dword_19BF46000, v8, OS_LOG_TYPE_DEFAULT, "Need to restart!", (uint8_t *)buf, 2u);
        }
LABEL_24:
        self->_needToRestart = 1;
      }
      break;
    default:
      break;
  }

}

void __52__PRContactAllowlist_beaconListener_didChangeState___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject **WeakRetained;
  NSObject **v7;
  NSObject *v8;
  NSObject *v9;
  _BOOL4 v10;
  __int16 v11[8];

  v5 = a3;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if ((a2 & 1) != 0)
  {
    v8 = WeakRetained[1];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v11[0] = 0;
      _os_log_impl(&dword_19BF46000, v8, OS_LOG_TYPE_DEFAULT, "successfully re-allowlisted.", (uint8_t *)v11, 2u);
    }
  }
  else
  {
    v9 = WeakRetained[1];
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (v5)
    {
      if (v10)
        __52__PRContactAllowlist_beaconListener_didChangeState___block_invoke_cold_2(v9);
    }
    else if (v10)
    {
      __52__PRContactAllowlist_beaconListener_didChangeState___block_invoke_cold_1(v9);
    }
  }

}

- (void)beaconListener:(id)a3 didFailWithError:(id)a4
{
  NSObject *logger;

  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR))
    -[PRContactAllowlist beaconListener:didFailWithError:].cold.1(logger);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nearbyDaemonSession, 0);
  objc_storeStrong((id *)&self->_allowlist, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

- (void)addTrustedContact:(void *)a1 withCompletionHandler:.cold.1(void *a1)
{
  NSObject *v1;
  void *v2;
  _DWORD v3[2];
  __int16 v4;
  void *v5;

  OUTLINED_FUNCTION_2_0(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "contactKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = 67109378;
  v3[1] = 5;
  v4 = 2112;
  v5 = v2;
  _os_log_error_impl(&dword_19BF46000, v1, OS_LOG_TYPE_ERROR, "Allowlist full! (limit %d) Attempted to add contact: %@", (uint8_t *)v3, 0x12u);

  OUTLINED_FUNCTION_0_1();
}

- (void)addTrustedContact:(void *)a1 withCompletionHandler:.cold.2(void *a1)
{
  NSObject *v1;
  void *v2;
  int v3;
  void *v4;

  OUTLINED_FUNCTION_2_0(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "contactKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl(&dword_19BF46000, v1, OS_LOG_TYPE_DEBUG, "Allowlisting contact: %@", (uint8_t *)&v3, 0xCu);

  OUTLINED_FUNCTION_0_1();
}

void __52__PRContactAllowlist_beaconListener_didChangeState___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_19BF46000, log, OS_LOG_TYPE_ERROR, "unknown ERROR during attempted restart.", v1, 2u);
}

void __52__PRContactAllowlist_beaconListener_didChangeState___block_invoke_cold_2(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_2_0(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "localizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0(&dword_19BF46000, v3, v4, "ERROR during attempted restart: %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_0_1();
}

- (void)beaconListener:(void *)a1 didFailWithError:.cold.1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_2_0(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "localizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0(&dword_19BF46000, v3, v4, "ERROR: %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_0_1();
}

@end
