@implementation RPPrivateXPCConnection

- (BOOL)_entitledAndReturnError:(id *)a3
{
  BOOL result;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;

  if (self->_entitled)
    return 1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection cuValueForEntitlementNoCache:](self->_xpcCnx, "cuValueForEntitlementNoCache:", CFSTR("com.apple.rapport")));
  v7 = objc_msgSend(v6, "isEqual:", &__kCFBooleanTrue);

  if (v7)
  {
    result = 1;
    self->_entitled = 1;
  }
  else
  {
    if (dword_1001318E8 <= 90
      && (dword_1001318E8 != -1 || _LogCategory_Initialize(&dword_1001318E8, 90)))
    {
      LogPrintF(&dword_1001318E8, "-[RPPrivateXPCConnection _entitledAndReturnError:]", 90, "### Missing entitlement: %#{pid}, '%@'\n", -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"), CFSTR("com.apple.rapport"));
    }
    if (a3)
    {
      v14 = RPErrorF(4294896128, (uint64_t)"Missing entitlement '%@'", v8, v9, v10, v11, v12, v13, (uint64_t)CFSTR("com.apple.rapport"));
      v15 = (id)objc_claimAutoreleasedReturnValue(v14);
      result = 0;
      *a3 = v15;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)xpcConnectionInvalidated
{
  RPPrivateAdvertiser *v3;
  RPPrivateAdvertiser *activatedAdvertiser;
  RPPrivateDiscovery *v5;
  RPPrivateDiscovery *activatedDiscovery;
  NSXPCConnection *xpcCnx;

  v3 = self->_activatedAdvertiser;
  if (v3)
  {
    if (dword_1001318E8 < 31
      && (dword_1001318E8 != -1 || _LogCategory_Initialize(&dword_1001318E8, 30)))
    {
      LogPrintF(&dword_1001318E8, "-[RPPrivateXPCConnection xpcConnectionInvalidated]", 30, "Invalidate: %@, from %#{pid}\n", v3, -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"));
    }
    if (!self->_direct)
      -[RPPrivateAdvertiser invalidate](v3, "invalidate");
    activatedAdvertiser = self->_activatedAdvertiser;
    self->_activatedAdvertiser = 0;

  }
  v5 = self->_activatedDiscovery;
  if (v5)
  {
    if (dword_1001318E8 < 31
      && (dword_1001318E8 != -1 || _LogCategory_Initialize(&dword_1001318E8, 30)))
    {
      LogPrintF(&dword_1001318E8, "-[RPPrivateXPCConnection xpcConnectionInvalidated]", 30, "Invalidate: %@, from %#{pid}\n", v5, -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"));
    }
    if (!self->_direct)
      -[RPPrivateDiscovery invalidate](v5, "invalidate");
    activatedDiscovery = self->_activatedDiscovery;
    self->_activatedDiscovery = 0;

  }
  xpcCnx = self->_xpcCnx;
  self->_xpcCnx = 0;

}

- (void)xpcPrivateAdvertiserActivate:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, _QWORD);
  unsigned int v9;
  id v10;
  id v11;
  id v12;

  v7 = a3;
  v8 = (void (**)(id, _QWORD))a4;
  v12 = 0;
  v9 = -[RPPrivateXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v12);
  v10 = v12;
  v11 = v10;
  if (v9)
  {
    if (dword_1001318E8 <= 30
      && (dword_1001318E8 != -1 || _LogCategory_Initialize(&dword_1001318E8, 30)))
    {
      LogPrintF(&dword_1001318E8, "-[RPPrivateXPCConnection xpcPrivateAdvertiserActivate:completion:]", 30, "Activate: %@, from %#{pid}\n", v7, -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"));
    }
    objc_storeStrong((id *)&self->_activatedAdvertiser, a3);
    v11 = 0;
  }
  ((void (**)(id, id))v8)[2](v8, v11);

}

- (void)xpcPrivateAdvertiserUpdate:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  unsigned int v8;
  id v9;
  id v10;
  id v11;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v11 = 0;
  v8 = -[RPPrivateXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v11);
  v9 = v11;
  v10 = v9;
  if (v8)
  {
    if (dword_1001318E8 <= 30
      && (dword_1001318E8 != -1 || _LogCategory_Initialize(&dword_1001318E8, 30)))
    {
      LogPrintF(&dword_1001318E8, "-[RPPrivateXPCConnection xpcPrivateAdvertiserUpdate:completion:]", 30, "Update: %@, from %#{pid}\n", v6, -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"));
    }
    v10 = 0;
  }
  ((void (**)(id, id))v7)[2](v7, v10);

}

- (void)xpcPrivateDiscoveryActivate:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, _QWORD);
  unsigned int v9;
  id v10;
  id v11;
  id v12;

  v7 = a3;
  v8 = (void (**)(id, _QWORD))a4;
  v12 = 0;
  v9 = -[RPPrivateXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v12);
  v10 = v12;
  v11 = v10;
  if (v9)
  {
    if (dword_1001318E8 <= 30
      && (dword_1001318E8 != -1 || _LogCategory_Initialize(&dword_1001318E8, 30)))
    {
      LogPrintF(&dword_1001318E8, "-[RPPrivateXPCConnection xpcPrivateDiscoveryActivate:completion:]", 30, "Activate: %@, from %#{pid}\n", v7, -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"));
    }
    objc_storeStrong((id *)&self->_activatedDiscovery, a3);
    v11 = 0;
  }
  ((void (**)(id, id))v8)[2](v8, v11);

}

- (void)xpcPrivateDiscoveryUpdate:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  unsigned int v8;
  id v9;
  id v10;
  id v11;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v11 = 0;
  v8 = -[RPPrivateXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v11);
  v9 = v11;
  v10 = v9;
  if (v8)
  {
    if (dword_1001318E8 <= 30
      && (dword_1001318E8 != -1 || _LogCategory_Initialize(&dword_1001318E8, 30)))
    {
      LogPrintF(&dword_1001318E8, "-[RPPrivateXPCConnection xpcPrivateDiscoveryUpdate:completion:]", 30, "Update: %@, from %#{pid}\n", v6, -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"));
    }
    v10 = 0;
  }
  ((void (**)(id, id))v7)[2](v7, v10);

}

- (RPPrivateAdvertiser)activatedAdvertiser
{
  return self->_activatedAdvertiser;
}

- (RPPrivateDiscovery)activatedDiscovery
{
  return self->_activatedDiscovery;
}

- (RPPrivateDaemon)daemon
{
  return self->_daemon;
}

- (void)setDaemon:(id)a3
{
  objc_storeStrong((id *)&self->_daemon, a3);
}

- (BOOL)direct
{
  return self->_direct;
}

- (void)setDirect:(BOOL)a3
{
  self->_direct = a3;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (BOOL)entitled
{
  return self->_entitled;
}

- (void)setEntitled:(BOOL)a3
{
  self->_entitled = a3;
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
  objc_storeStrong((id *)&self->_daemon, 0);
  objc_storeStrong((id *)&self->_activatedDiscovery, 0);
  objc_storeStrong((id *)&self->_activatedAdvertiser, 0);
}

@end
