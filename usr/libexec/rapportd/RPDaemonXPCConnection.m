@implementation RPDaemonXPCConnection

- (RPDaemonXPCConnection)initWithDaemon:(id)a3 xpcConnection:(id)a4
{
  id v7;
  id v8;
  RPDaemonXPCConnection *v9;
  RPDaemonXPCConnection *v10;
  RPDaemonXPCConnection *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)RPDaemonXPCConnection;
  v9 = -[RPDaemonXPCConnection init](&v13, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_daemon, a3);
    objc_storeStrong((id *)&v10->_xpcCnx, a4);
    v11 = v10;
  }

  return v10;
}

- (void)connectionInvalidated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100130728 <= 20 && (dword_100130728 != -1 || _LogCategory_Initialize(&dword_100130728, 20)))
    LogPrintF(&dword_100130728, "-[RPDaemonXPCConnection connectionInvalidated]", 20, "XPC connection invalidated from %#{pid}\n", -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"));
  -[RPDaemonXPCConnection _invalidateAssertions](self, "_invalidateAssertions");
}

- (BOOL)_entitledForLabel:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;

  v6 = a3;
  if (self->_entitledClient)
  {
    v7 = 1;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection cuValueForEntitlementNoCache:](self->_xpcCnx, "cuValueForEntitlementNoCache:", CFSTR("com.apple.rapport.Client")));
    v9 = objc_msgSend(v8, "isEqual:", &__kCFBooleanTrue);

    if (v9)
    {
      v7 = 1;
      self->_entitledClient = 1;
    }
    else
    {
      v16 = RPErrorF(4294896128, (uint64_t)"Missing entitlement '%@' for %@", v10, v11, v12, v13, v14, v15, (uint64_t)CFSTR("com.apple.rapport.Client"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      if (dword_100130728 <= 60
        && (dword_100130728 != -1 || _LogCategory_Initialize(&dword_100130728, 60)))
      {
        LogPrintF(&dword_100130728, "-[RPDaemonXPCConnection _entitledForLabel:error:]", 60, "### %#{pid} %{error}\n", -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"), v17);
      }
      if (a4)
        *a4 = objc_retainAutorelease(v17);

      v7 = 0;
    }
  }

  return v7;
}

- (void)activateAssertionWithIdentifier:(id)a3
{
  unsigned int v4;
  void *v5;
  id v6;
  NSMutableSet *assertions;
  NSMutableSet *v8;
  NSMutableSet *v9;
  NSUInteger v10;
  NSCountedSet *v11;
  NSCountedSet *v12;
  RPDaemon *daemon;
  NSCountedSet *v14;
  id v15;

  v15 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v4 = -[RPDaemonXPCConnection _entitledForLabel:error:](self, "_entitledForLabel:error:", CFSTR("ActivateAssertion"), 0);
  v5 = v15;
  if (v4)
  {
    v6 = v15;
    if (v6)
    {
      if (-[NSMutableSet containsObject:](self->_assertions, "containsObject:", v6))
      {
        if (dword_100130728 <= 30
          && (dword_100130728 != -1 || _LogCategory_Initialize(&dword_100130728, 30)))
        {
          LogPrintF(&dword_100130728, "-[RPDaemonXPCConnection activateAssertionWithIdentifier:]", 30, "Ignoring duplicate assertion '%@'\n", v6);
        }
      }
      else
      {
        assertions = self->_assertions;
        if (!assertions)
        {
          v8 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
          v9 = self->_assertions;
          self->_assertions = v8;

          assertions = self->_assertions;
        }
        -[NSMutableSet addObject:](assertions, "addObject:", v6);
        v10 = -[NSCountedSet countForObject:](self->_daemon->_assertions, "countForObject:", v6);
        v11 = self->_daemon->_assertions;
        if (!v11)
        {
          v12 = (NSCountedSet *)objc_alloc_init((Class)NSCountedSet);
          daemon = self->_daemon;
          v14 = daemon->_assertions;
          daemon->_assertions = v12;

          v11 = self->_daemon->_assertions;
        }
        -[NSCountedSet addObject:](v11, "addObject:", v6);
        if (dword_100130728 <= 30
          && (dword_100130728 != -1 || _LogCategory_Initialize(&dword_100130728, 30)))
        {
          LogPrintF(&dword_100130728, "-[RPDaemonXPCConnection activateAssertionWithIdentifier:]", 30, "Activate assertion '%@': %d -> %d\n", v6, v10, (v10 + 1));
        }
        if (!v10
          && (objc_msgSend(v6, "isEqual:", CFSTR("com.apple.rapport.KeepAlive")) & 1) == 0
          && dword_100130728 <= 30
          && (dword_100130728 != -1 || _LogCategory_Initialize(&dword_100130728, 30)))
        {
          LogPrintF(&dword_100130728, "-[RPDaemonXPCConnection activateAssertionWithIdentifier:]", 30, "Ignoring add unknown assertion '%@'\n", v6);
        }
      }
    }

    v5 = v15;
  }

}

- (void)addOrUpdateIdentity:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, id);
  unsigned __int8 v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;

  v6 = a3;
  v7 = (void (**)(id, id))a4;
  v13 = 0;
  v8 = -[RPDaemonXPCConnection _entitledForLabel:error:](self, "_entitledForLabel:error:", CFSTR("AddOrUpdateIdentity"), &v13);
  v9 = v13;
  if ((v8 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[RPPeopleDaemon sharedPeopleDaemon](RPPeopleDaemon, "sharedPeopleDaemon"));
    v12 = v9;
    objc_msgSend(v10, "addOrUpdateIdentity:error:", v6, &v12);
    v11 = v12;

    v9 = v11;
  }
  if (v7)
    v7[2](v7, v9);

}

- (void)_invalidateAssertions
{
  NSMutableSet *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  NSUInteger v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = self->_assertions;
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        v9 = -[NSCountedSet countForObject:](self->_daemon->_assertions, "countForObject:", v8);
        -[NSCountedSet removeObject:](self->_daemon->_assertions, "removeObject:", v8);
        if (dword_100130728 <= 30
          && (dword_100130728 != -1 || _LogCategory_Initialize(&dword_100130728, 30)))
        {
          LogPrintF(&dword_100130728, "-[RPDaemonXPCConnection _invalidateAssertions]", 30, "Invalidate assertion '%@': %d -> %d\n", v8, v9, (v9 - 1));
        }
        if (v9 == 1
          && (objc_msgSend(v8, "isEqual:", CFSTR("com.apple.rapport.KeepAlive")) & 1) == 0
          && dword_100130728 <= 30
          && (dword_100130728 != -1 || _LogCategory_Initialize(&dword_100130728, 30)))
        {
          LogPrintF(&dword_100130728, "-[RPDaemonXPCConnection _invalidateAssertions]", 30, "Ignoring remove unknown assertion '%@'\n", v8);
        }
      }
      v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  -[NSMutableSet removeAllObjects](self->_assertions, "removeAllObjects");
}

- (void)diagnosticCommand:(id)a3 params:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, id);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  NSMutableArray *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *i;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  id v36;
  _BYTE v37[128];

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, id))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v36 = 0;
  -[RPDaemonXPCConnection _entitledForLabel:error:](self, "_entitledForLabel:error:", CFSTR("DiagnosticCommand"), &v36);
  v17 = v36;
  if (v17)
  {
    if (v10)
      v10[2](v10, 0, v17);
    goto LABEL_19;
  }
  if (!v8)
  {
    if (!v10)
      goto LABEL_19;
    v29 = RPErrorF(4294960589, (uint64_t)"Null command", v11, v12, v13, v14, v15, v16, v31);
    goto LABEL_22;
  }
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v18 = self->_daemon->_subDaemons;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v33;
    while (2)
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(_QWORD *)v33 != v21)
          objc_enumerationMutation(v18);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i), "diagnosticCommand:params:", v8, v9) & 1) != 0)
        {

          goto LABEL_17;
        }
      }
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      if (v20)
        continue;
      break;
    }
  }

  if (!-[RPDaemon diagnosticCommand:params:](self->_daemon, "diagnosticCommand:params:", v8, v9))
  {
    if (!v10)
      goto LABEL_19;
    v29 = RPErrorF(4294960561, (uint64_t)"Unsupported command '%@'", v23, v24, v25, v26, v27, v28, (uint64_t)v8);
LABEL_22:
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    v10[2](v10, 0, v30);

    goto LABEL_19;
  }
LABEL_17:
  if (v10)
    ((void (**)(id, void *, id))v10)[2](v10, &__NSDictionary0__struct, 0);
LABEL_19:

}

- (void)diagnosticLogControl:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v17 = 0;
  -[RPDaemonXPCConnection _entitledForLabel:error:](self, "_entitledForLabel:error:", CFSTR("DiagnosticLogControl"), &v17);
  v8 = v17;
  v9 = v8;
  if (v8)
  {
    if (v7)
    {
      v10 = NSPrintF("### Error: %{error}\n", v8);
LABEL_4:
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v7[2](v7, v11);

    }
  }
  else
  {
    if (v6)
    {
      v12 = LogControl(objc_msgSend(objc_retainAutorelease(v6), "UTF8String"));
      if ((_DWORD)v12)
      {
        if (!v7)
          goto LABEL_5;
        v10 = NSPrintF("### Control error: %#m\n", v12);
        goto LABEL_4;
      }
    }
    v16 = 0;
    v13 = LogShow(&v16);
    v14 = v16;
    if (!v16)
    {
      if (!v7)
        goto LABEL_5;
      v10 = NSPrintF("### Show error: %#m\n", v13);
      goto LABEL_4;
    }
    if (!v7
      || (v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:")),
          v7[2](v7, v15),
          v15,
          (v14 = v16) != 0))
    {
      free(v14);
    }
  }
LABEL_5:

}

- (void)diagnosticShow:(id)a3 level:(int)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unsigned int v14;
  RPDaemon *daemon;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;

  v8 = a3;
  v9 = (void (**)(id, void *))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v22 = 0;
  -[RPDaemonXPCConnection _entitledForLabel:error:](self, "_entitledForLabel:error:", CFSTR("DiagnosticShow"), &v22);
  v10 = v22;
  v11 = v10;
  if (!v10)
  {
    if (v8 && objc_msgSend(v8, "rangeOfString:options:", CFSTR("ident"), 9) != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
      v19 = CUDescriptionWithLevel(v18, 0x800000);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v19);

      if (!v9)
      {
LABEL_14:

        goto LABEL_15;
      }
    }
    else
    {
      v14 = objc_msgSend(v8, "isEqual:", CFSTR("kc"));
      daemon = self->_daemon;
      if (v14)
      {
        v16 = objc_claimAutoreleasedReturnValue(-[RPDaemon keychainStateString](daemon, "keychainStateString"));
      }
      else
      {
        v17 = CUDescriptionWithLevel(daemon, a4 | 0x800000u);
        v16 = objc_claimAutoreleasedReturnValue(v17);
      }
      v13 = (void *)v16;
      if (!v9)
        goto LABEL_14;
    }
    if (!v13)
    {
      v20 = NSPrintF("### Generate output failed\n");
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      v9[2](v9, v21);

      goto LABEL_14;
    }
LABEL_13:
    v9[2](v9, v13);
    goto LABEL_14;
  }
  if (v9)
  {
    v12 = NSPrintF("### Error: %{error}\n", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    goto LABEL_13;
  }
LABEL_15:

}

- (void)getIdentitiesWithFlags:(unsigned int)a3 completion:(id)a4
{
  __int16 v4;
  void (**v6)(id, id, _QWORD);
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;

  v4 = a3;
  v6 = (void (**)(id, id, _QWORD))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v35 = 0;
  -[RPDaemonXPCConnection _entitledForLabel:error:](self, "_entitledForLabel:error:", CFSTR("GetIdentities"), &v35);
  v7 = v35;
  if (!v7)
  {
    v8 = objc_alloc_init((Class)NSMutableArray);
    if ((v4 & 1) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identityOfSelfAndReturnError:", 0));

      if (v10)
        objc_msgSend(v8, "addObject:", v10);

      if ((v4 & 2) == 0)
      {
LABEL_5:
        if ((v4 & 4) == 0)
          goto LABEL_6;
        goto LABEL_23;
      }
    }
    else if ((v4 & 2) == 0)
    {
      goto LABEL_5;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identitiesOfType:error:", 2, 0));

    if (v12)
      objc_msgSend(v8, "addObjectsFromArray:", v12);

    if ((v4 & 4) == 0)
    {
LABEL_6:
      if ((v4 & 8) == 0)
        goto LABEL_7;
      goto LABEL_26;
    }
LABEL_23:
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identitiesOfType:error:", 3, 0));

    if (v14)
      objc_msgSend(v8, "addObjectsFromArray:", v14);

    if ((v4 & 8) == 0)
    {
LABEL_7:
      if ((v4 & 0x10) == 0)
        goto LABEL_8;
      goto LABEL_29;
    }
LABEL_26:
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identitiesOfType:error:", 4, 0));

    if (v16)
      objc_msgSend(v8, "addObjectsFromArray:", v16);

    if ((v4 & 0x10) == 0)
    {
LABEL_8:
      if ((v4 & 0x20) == 0)
        goto LABEL_9;
      goto LABEL_32;
    }
LABEL_29:
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "identitiesOfType:error:", 5, 0));

    if (v18)
      objc_msgSend(v8, "addObjectsFromArray:", v18);

    if ((v4 & 0x20) == 0)
    {
LABEL_9:
      if ((v4 & 0x100) == 0)
        goto LABEL_10;
      goto LABEL_35;
    }
LABEL_32:
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "identitiesOfType:error:", 6, 0));

    if (v20)
      objc_msgSend(v8, "addObjectsFromArray:", v20);

    if ((v4 & 0x100) == 0)
    {
LABEL_10:
      if ((v4 & 0x400) == 0)
        goto LABEL_11;
      goto LABEL_38;
    }
LABEL_35:
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "identitiesOfType:error:", 9, 0));

    if (v22)
      objc_msgSend(v8, "addObjectsFromArray:", v22);

    if ((v4 & 0x400) == 0)
    {
LABEL_11:
      if ((v4 & 0x40) == 0)
        goto LABEL_12;
      goto LABEL_44;
    }
LABEL_38:
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "identitiesOfType:error:", 12, 0));

    if (v24)
    {
      objc_msgSend(v8, "addObjectsFromArray:", v24);
      if (dword_100130728 < 31
        && (dword_100130728 != -1 || _LogCategory_Initialize(&dword_100130728, 30)))
      {
        LogPrintF(&dword_100130728, "-[RPDaemonXPCConnection getIdentitiesWithFlags:completion:]", 30, "Loaded %lu SharedTVUser identities\n", objc_msgSend(v24, "count"));
      }
    }

    if ((v4 & 0x40) == 0)
    {
LABEL_12:
      if ((v4 & 0x80) == 0)
        goto LABEL_13;
      goto LABEL_47;
    }
LABEL_44:
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "identitiesOfType:error:", 7, 0));

    if (v26)
      objc_msgSend(v8, "addObjectsFromArray:", v26);

    if ((v4 & 0x80) == 0)
    {
LABEL_13:
      if ((v4 & 0x800) == 0)
        goto LABEL_14;
      goto LABEL_50;
    }
LABEL_47:
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "identitiesOfType:error:", 8, 0));

    if (v28)
      objc_msgSend(v8, "addObjectsFromArray:", v28);

    if ((v4 & 0x800) == 0)
    {
LABEL_14:
      if ((v4 & 0x2000) == 0)
        goto LABEL_15;
      goto LABEL_53;
    }
LABEL_50:
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "identitiesOfType:error:", 13, 0));

    if (v30)
      objc_msgSend(v8, "addObjectsFromArray:", v30);

    if ((v4 & 0x2000) == 0)
    {
LABEL_15:
      if ((v4 & 0x4000) == 0)
      {
LABEL_59:
        v6[2](v6, v8, 0);

        goto LABEL_60;
      }
LABEL_56:
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "identitiesOfType:error:", 15, 0));

      if (v34)
        objc_msgSend(v8, "addObjectsFromArray:", v34);

      goto LABEL_59;
    }
LABEL_53:
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "identityOfTemporarySelfAndReturnError:", 0));

    if (v32)
      objc_msgSend(v8, "addObject:", v32);

    if ((v4 & 0x4000) == 0)
      goto LABEL_59;
    goto LABEL_56;
  }
  ((void (**)(id, id, id))v6)[2](v6, 0, v7);
LABEL_60:

}

- (void)regenerateTemporarySelfIdentityWithCompletion:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void (**v15)(id, _QWORD);

  v15 = (void (**)(id, _QWORD))a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection cuValueForEntitlementNoCache:](self->_xpcCnx, "cuValueForEntitlementNoCache:", CFSTR("com.apple.rapport.RegenerateIdentity")));
  v5 = objc_msgSend(v4, "isEqual:", &__kCFBooleanTrue);

  if ((v5 & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
    objc_msgSend(v12, "regenerateTemporarySelfIdentity");

    v15[2](v15, 0);
  }
  else
  {
    v13 = RPErrorF(4294896128, (uint64_t)"Missing entitlement '%@' for %@", v6, v7, v8, v9, v10, v11, (uint64_t)CFSTR("com.apple.rapport.RegenerateIdentity"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    if (dword_100130728 <= 60
      && (dword_100130728 != -1 || _LogCategory_Initialize(&dword_100130728, 60)))
    {
      LogPrintF(&dword_100130728, "-[RPDaemonXPCConnection regenerateTemporarySelfIdentityWithCompletion:]", 60, "### %#{pid} %{error}\n", -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"), v14);
    }
    ((void (**)(id, void *))v15)[2](v15, v14);

  }
}

- (void)primaryAccountSignedInWithCompletion:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void (**v15)(id, _QWORD);

  v15 = (void (**)(id, _QWORD))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection cuValueForEntitlementNoCache:](self->_xpcCnx, "cuValueForEntitlementNoCache:", CFSTR("com.apple.rapport.Client")));
  v5 = objc_msgSend(v4, "isEqual:", &__kCFBooleanTrue);

  if ((v5 & 1) != 0)
  {
    if (dword_100130728 <= 30
      && (dword_100130728 != -1 || _LogCategory_Initialize(&dword_100130728, 30)))
    {
      LogPrintF(&dword_100130728, "-[RPDaemonXPCConnection primaryAccountSignedInWithCompletion:]", 30, "Primary account signed in from %#{pid}\n", -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"));
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[RPDaemon sharedDaemon](RPDaemon, "sharedDaemon"));
    objc_msgSend(v14, "postDaemonInfoChanges:", 64);

    v15[2](v15, 0);
  }
  else
  {
    v12 = RPErrorF(4294896128, (uint64_t)"Missing entitlement '%@' for %@", v6, v7, v8, v9, v10, v11, (uint64_t)CFSTR("com.apple.rapport.Client"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    if (dword_100130728 <= 60
      && (dword_100130728 != -1 || _LogCategory_Initialize(&dword_100130728, 60)))
    {
      LogPrintF(&dword_100130728, "-[RPDaemonXPCConnection primaryAccountSignedInWithCompletion:]", 60, "### %#{pid} %{error}\n", -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"), v13);
    }
    ((void (**)(id, void *))v15)[2](v15, v13);

  }
}

- (void)primaryAccountSignedOutWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  unsigned __int8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *i;
  uint64_t v24;
  unsigned int v25;
  id v26;
  BOOL v27;
  void *v28;
  void *v29;
  void (**v30)(id, void *);
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  id v36;
  _BYTE v37[128];

  v4 = (void (**)(id, void *))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection cuValueForEntitlementNoCache:](self->_xpcCnx, "cuValueForEntitlementNoCache:", CFSTR("com.apple.rapport.Client")));
  v6 = objc_msgSend(v5, "isEqual:", &__kCFBooleanTrue);

  if ((v6 & 1) != 0)
  {
    if (dword_100130728 <= 30
      && (dword_100130728 != -1 || _LogCategory_Initialize(&dword_100130728, 30)))
    {
      LogPrintF(&dword_100130728, "-[RPDaemonXPCConnection primaryAccountSignedOutWithCompletion:]", 30, "Primary account signed out from %#{pid}\n", -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"));
    }
    v15 = objc_alloc_init((Class)CUKeychainItem);
    objc_msgSend(v15, "setAccessGroup:", CFSTR("com.apple.rapport"));
    objc_msgSend(v15, "setSyncType:", 3);
    v16 = objc_alloc_init((Class)CUKeychainManager);
    v36 = 0;
    v29 = v15;
    v17 = objc_msgSend(v16, "copyItemsMatchingItem:flags:error:", v15, 10, &v36);
    v18 = v36;
    if (v18
      && dword_100130728 <= 90
      && (dword_100130728 != -1 || _LogCategory_Initialize(&dword_100130728, 90)))
    {
      LogPrintF(&dword_100130728, "-[RPDaemonXPCConnection primaryAccountSignedOutWithCompletion:]", 90, "### Get keychain items to delete failed: %{error}\n", v18);
    }
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v19 = v17;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    v30 = v4;
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(_QWORD *)v33 != v22)
            objc_enumerationMutation(v19);
          v24 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
          if (dword_100130728 <= 30
            && (dword_100130728 != -1 || _LogCategory_Initialize(&dword_100130728, 30)))
          {
            LogPrintF(&dword_100130728, "-[RPDaemonXPCConnection primaryAccountSignedOutWithCompletion:]", 30, "Removing %@\n", v24);
          }

          v31 = 0;
          v25 = objc_msgSend(v16, "removeItemMatchingItem:error:", v24, &v31);
          v26 = v31;
          v18 = v26;
          if (v25)
            v27 = v26 == 0;
          else
            v27 = 0;
          if (!v27
            && dword_100130728 <= 90
            && (dword_100130728 != -1 || _LogCategory_Initialize(&dword_100130728, 90)))
          {
            LogPrintF(&dword_100130728, "-[RPDaemonXPCConnection primaryAccountSignedOutWithCompletion:]", 90, "### Remove failed: %@, %{error}\n", v24, v18);
          }
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      }
      while (v21);
    }

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[RPDaemon sharedDaemon](RPDaemon, "sharedDaemon"));
    objc_msgSend(v28, "postDaemonInfoChanges:", 16);

    v4 = v30;
    v30[2](v30, 0);

  }
  else
  {
    v13 = RPErrorF(4294896128, (uint64_t)"Missing entitlement '%@' for %@", v7, v8, v9, v10, v11, v12, (uint64_t)CFSTR("com.apple.rapport.Client"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    if (dword_100130728 <= 60
      && (dword_100130728 != -1 || _LogCategory_Initialize(&dword_100130728, 60)))
    {
      LogPrintF(&dword_100130728, "-[RPDaemonXPCConnection primaryAccountSignedOutWithCompletion:]", 60, "### %#{pid} %{error}\n", -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"), v14);
    }
    v4[2](v4, v14);

  }
}

- (void)serverCreateDeviceMappingInternal:(int)a3 applicationService:(id)a4 deviceID:(id)a5 endpointID:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  void (**v15)(id, void *, id);
  unsigned __int8 v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  const char *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  id v41;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = (void (**)(id, void *, id))a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v41 = 0;
  v16 = -[RPDaemonXPCConnection _entitledForLabel:error:](self, "_entitledForLabel:error:", CFSTR("createDeviceMapping"), &v41);
  v17 = v41;
  if ((v16 & 1) != 0)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[RPCompanionLinkDaemon sharedCompanionLinkDaemon](RPCompanionLinkDaemon, "sharedCompanionLinkDaemon"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "findDeviceFromID:", v13));

    if (v19)
    {
      switch(a3)
      {
        case 2:
          +[RPNWListener queryDeviceToApplicationServiceMapping:device:completion:](RPNWListener, "queryDeviceToApplicationServiceMapping:device:completion:", v12, v19, v15);
          break;
        case 1:
          v36 = +[RPNWListener addDeviceToApplicationServiceMapping:device:completion:](RPNWListener, "addDeviceToApplicationServiceMapping:device:completion:", v12, v19, v15);
          break;
        case 0:
          if (!+[RPNWEndpoint addEndpointMapping:endpointID:applicationService:discoverySessionID:shouldAutomapListener:](RPNWEndpoint, "addEndpointMapping:endpointID:applicationService:discoverySessionID:shouldAutomapListener:", v19, v14, v12, 0, 0))
          {
            v32 = RPErrorF(4294960569, (uint64_t)"Failed to add endpoint mapping", v26, v27, v28, v29, v30, v31, v40);
            v33 = objc_claimAutoreleasedReturnValue(v32);

            v17 = (id)v33;
          }
          if (v15)
          {
            v34 = (void *)objc_claimAutoreleasedReturnValue(+[RPNWNetworkAgent sharedNetworkAgent](RPNWNetworkAgent, "sharedNetworkAgent"));
            v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "networkAgentID"));
            v15[2](v15, v35, v17);

          }
          break;
        default:
          v37 = "Invalid mapping type";
          goto LABEL_21;
      }
LABEL_22:

      goto LABEL_23;
    }
    if (dword_100130728 <= 90
      && (dword_100130728 != -1 || _LogCategory_Initialize(&dword_100130728, 90)))
    {
      LogPrintF(&dword_100130728, "-[RPDaemonXPCConnection serverCreateDeviceMappingInternal:applicationService:deviceID:endpointID:completion:]", 90, "Failed to find device with deviceID=%@\n", v13);
    }
    if (!v15)
      goto LABEL_22;
    v37 = "Failed to find device for mapping";
LABEL_21:
    v38 = RPErrorF(4294960569, (uint64_t)v37, v20, v21, v22, v23, v24, v25, v40);
    v39 = objc_claimAutoreleasedReturnValue(v38);

    v15[2](v15, 0, (id)v39);
    v17 = (id)v39;
    goto LABEL_22;
  }
  if (v15)
    v15[2](v15, 0, v17);
LABEL_23:

}

- (void)serverSetAutoMappingInternal:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = a4;
  +[RPNWListener setAutoMapping:](RPNWListener, "setAutoMapping:", v4);
  v5 = v6;
  if (v6)
  {
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
    v5 = v6;
  }

}

- (void)removeSessionPairedIdentity:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, id);
  id v8;
  void *v9;
  id v10;

  v6 = a3;
  v7 = (void (**)(id, id))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v10 = 0;
  -[RPDaemonXPCConnection _entitledForLabel:error:](self, "_entitledForLabel:error:", CFSTR("removeSessionPairedIdentity"), &v10);
  v8 = v10;
  if (v8)
  {
    if (v7)
      v7[2](v7, v8);
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
    objc_msgSend(v9, "removeSessionPairedIdentityWithIdentifier:", v6);

    if (v7)
      v7[2](v7, 0);
  }

}

- (NSMutableSet)assertions
{
  return self->_assertions;
}

- (void)setAssertions:(id)a3
{
  objc_storeStrong((id *)&self->_assertions, a3);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (NSXPCConnection)xpcCnx
{
  return self->_xpcCnx;
}

- (void)setXpcCnx:(id)a3
{
  objc_storeStrong((id *)&self->_xpcCnx, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_assertions, 0);
  objc_storeStrong((id *)&self->_daemon, 0);
}

@end
