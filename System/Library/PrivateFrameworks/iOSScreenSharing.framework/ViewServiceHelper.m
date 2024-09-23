@implementation ViewServiceHelper

- (ViewServiceHelper)init
{
  ViewServiceHelper *v2;
  void *v3;
  uint64_t v4;
  NSXPCListener *listener;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ViewServiceHelper;
  v2 = -[ViewServiceHelper init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[ViewServiceHelper setConnections:](v2, "setConnections:", v3);

    v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1998]), "initWithMachServiceName:", CFSTR("com.apple.ScreenSharingViewServiceHelper"));
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v4;

    -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
  }
  return v2;
}

- (void)run
{
  NSObject *v3;
  _QWORD block[5];

  dispatch_get_global_queue(9, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __24__ViewServiceHelper_run__block_invoke;
  block[3] = &unk_24D527578;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __24__ViewServiceHelper_run__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "resume");
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  __SecTask *v8;
  __SecTask *v9;
  CFTypeRef v10;
  CFTypeID v11;
  BOOL v12;
  _BOOL8 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const __CFString *v21;
  CFTypeRef v22;
  CFTypeID v23;
  BOOL v24;
  void *v25;
  void *v26;
  ViewServiceHelper *v27;
  void *v28;
  void *v29;
  BOOL v30;
  CFErrorRef error;
  audit_token_t buf;
  _QWORD v34[2];
  _QWORD v35[2];
  audit_token_t token;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf.val[0]) = 0;
    _os_log_impl(&dword_216334000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "start listener:shouldAcceptNewConnection:", (uint8_t *)&buf, 2u);
  }
  memset(&buf, 0, sizeof(buf));
  if (v7)
    objc_msgSend(v7, "auditToken");
  token = buf;
  v8 = SecTaskCreateWithAuditToken(0, &token);
  v9 = v8;
  if (!v8)
  {
    v13 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v13)
      -[ViewServiceHelper listener:shouldAcceptNewConnection:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);
    goto LABEL_29;
  }
  error = 0;
  v10 = SecTaskCopyValueForEntitlement(v8, CFSTR("com.apple.private.screensharing.xpcaccepted"), &error);
  if (error)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      token.val[0] = 138412290;
      *(_QWORD *)&token.val[1] = error;
      _os_log_impl(&dword_216334000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Unable to get entitlement (com.apple.private.screensharing.xpcaccepted) for client task. Error: %@", (uint8_t *)&token, 0xCu);
    }
    CFRelease(error);
    error = 0;
  }
  if (!v10)
  {
LABEL_17:
    v21 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], "com.apple.springboard.activateawayviewplugins", 0x8000100u);
    v22 = SecTaskCopyValueForEntitlement(v9, v21, &error);
    if (error)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        token.val[0] = 138412546;
        *(_QWORD *)&token.val[1] = v21;
        LOWORD(token.val[3]) = 2112;
        *(_QWORD *)((char *)&token.val[3] + 2) = error;
        _os_log_impl(&dword_216334000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Unable to get entitlement %@ for client task. Error: %@", (uint8_t *)&token, 0x16u);
      }
      CFRelease(error);
      error = 0;
    }
    CFRelease(v21);
    if (v22)
    {
      v23 = CFGetTypeID(v22);
      if (v23 == CFBooleanGetTypeID())
      {
        v24 = CFBooleanGetValue((CFBooleanRef)v22) == 0;
        CFRelease(v22);
        CFRelease(v9);
        if (!v24)
          goto LABEL_24;
      }
      else
      {
        CFRelease(v22);
        CFRelease(v9);
      }
    }
    else
    {
      CFRelease(v9);
    }
LABEL_29:
    v30 = 0;
    goto LABEL_30;
  }
  v11 = CFGetTypeID(v10);
  if (v11 != CFBooleanGetTypeID())
  {
    CFRelease(v10);
    goto LABEL_17;
  }
  v12 = CFBooleanGetValue((CFBooleanRef)v10) == 0;
  CFRelease(v10);
  if (v12)
    goto LABEL_17;
  CFRelease(v9);
LABEL_24:
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254E377A8);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setExportedInterface:", v25);

  objc_msgSend(v7, "setExportedObject:", self);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254E37BE8);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRemoteObjectInterface:", v26);

  v27 = self;
  objc_sync_enter(v27);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(token.val[0]) = 0;
    _os_log_impl(&dword_216334000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "adding connection", (uint8_t *)&token, 2u);
  }
  -[ViewServiceHelper connections](v27, "connections");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = CFSTR("NSXPCConnection");
  v34[1] = CFSTR("bundleIdentifier");
  v35[0] = v7;
  v35[1] = &stru_24D5276D8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addObject:", v29);

  objc_sync_exit(v27);
  objc_msgSend(v7, "resume");
  v30 = 1;
LABEL_30:

  return v30;
}

- (void)handleStatusBarTap
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  uint8_t buf[8];
  _QWORD v21[3];
  _QWORD v22[3];
  _QWORD v23[5];
  _QWORD v24[6];

  v24[5] = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_216334000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "status bar tapped", buf, 2u);
  }
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ViewServiceHelper delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[ViewServiceHelper delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "performSelector:withObject:", sel_sessionState_, v3);

  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_216334000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "sessionState not supported", buf, 2u);
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("viewerName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("paused"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("paused"));
  else
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("screenLocked"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("screenLocked"));
  else
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = *MEMORY[0x24BEB0D70];
  v23[0] = *MEMORY[0x24BEB0D88];
  v23[1] = v12;
  v13 = MEMORY[0x24BDBD1C8];
  v24[0] = CFSTR("SSActiveViewController");
  v24[1] = MEMORY[0x24BDBD1C8];
  v23[2] = *MEMORY[0x24BEB0D78];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *MEMORY[0x24BEB0D68];
  v24[2] = v14;
  v24[3] = v13;
  v16 = *MEMORY[0x24BEB0D80];
  v23[3] = v15;
  v23[4] = v16;
  v21[0] = CFSTR("isPaused");
  v21[1] = CFSTR("isScreenLocked");
  v22[0] = v9;
  v22[1] = v11;
  v21[2] = CFSTR("viewerName");
  v22[2] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24[4] = v17;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = SBSUIActivateRemoteAlertWithLifecycleNotifications();
  syslog(5, "RemoteAlert: %d", v19);

}

void __39__ViewServiceHelper_handleStatusBarTap__block_invoke(uint64_t a1, int a2)
{
  syslog(5, "activated:%d", a2);
}

void __39__ViewServiceHelper_handleStatusBarTap__block_invoke_2(uint64_t a1, int a2)
{
  syslog(5, "deactivated:%d", a2);
}

- (void)termsAndConditionsResponse:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "description");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  syslog(5, "termsAndConditionsResponse %s", (const char *)objc_msgSend(v4, "UTF8String"));

  -[ViewServiceHelper delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[ViewServiceHelper delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "performSelector:withObject:", sel_termsAndConditionsResult_, v8);

  }
}

- (void)pauseResumeResponse:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_216334000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "pauseResumeResponse", buf, 2u);
  }
  -[ViewServiceHelper delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[ViewServiceHelper delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "performSelector:withObject:", sel_pauseResumeResult_, v4);

  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_216334000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "does not respond", v8, 2u);
  }

}

- (void)pidNotification:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  uint8_t v8[16];

  v4 = a3;
  -[ViewServiceHelper delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[ViewServiceHelper delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "performSelector:withObject:", sel_pidNotification_, v4);

  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_216334000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "pidNotification not supported", v8, 2u);
  }

}

- (void)sendSessionInfoToClient
{
  OUTLINED_FUNCTION_0(&dword_216334000, MEMORY[0x24BDACB70], a3, "viewServerHelper delegate does not support sessionState message", a5, a6, a7, a8, 0);
}

void __44__ViewServiceHelper_sendSessionInfoToClient__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = (id)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performSelector:withObject:", sel_sessionState_, v14);

  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("paused"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("paused"));
  else
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("screenLocked"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("screenLocked"));
  else
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("viewerName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("isAppleSupportRequest"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setObject:forKey:", v4, CFSTR("isPaused"));
  objc_msgSend(v9, "setObject:forKey:", v6, CFSTR("isScreenLocked"));
  if (v7)
    objc_msgSend(v9, "setObject:forKey:", v7, CFSTR("viewerName"));
  objc_msgSend(v9, "setObject:forKey:", v8, CFSTR("isAppleSupportRequest"));
  objc_msgSend(*(id *)(a1 + 32), "connections");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lastObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "objectForKey:", CFSTR("NSXPCConnection"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "remoteObjectProxy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setUserInfo:", v9);

}

- (ViewServiceHelperDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (ViewServiceHelperDelegate *)a3;
}

- (NSXPCListener)listener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 16, 1);
}

- (void)setListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSMutableArray)connections
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setConnections:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)listener:(uint64_t)a3 shouldAcceptNewConnection:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_216334000, MEMORY[0x24BDACB70], a3, "Unable to create security task from audit token", a5, a6, a7, a8, 0);
}

@end
