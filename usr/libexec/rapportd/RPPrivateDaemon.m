@implementation RPPrivateDaemon

+ (id)sharedPrivateDaemon
{
  if (qword_1001322E8 != -1)
    dispatch_once(&qword_1001322E8, &stru_100114708);
  return (id)qword_1001322E0;
}

- (RPPrivateDaemon)init
{
  RPPrivateDaemon *v2;
  RPPrivateDaemon *v3;
  RPPrivateDaemon *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RPPrivateDaemon;
  v2 = -[RPPrivateDaemon init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, &_dispatch_main_q);
    objc_storeStrong(&gRPPrivateDaemon, v3);
    v4 = v3;
  }

  return v3;
}

- (id)descriptionWithLevel:(int)a3
{
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  NSMutableSet *obj;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  id v34;
  _BYTE v35[128];

  if (a3 >= 11)
    v4 = 50;
  else
    v4 = 30;
  v34 = 0;
  NSAppendPrintF(&v34, "-- RPPrivateDaemon: %d XPC --\n", -[NSMutableSet count](self->_xpcConnections, "count"));
  v5 = v34;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = self->_xpcConnections;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v31 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v10, "direct"))
        {
          v29 = v5;
          NSAppendPrintF(&v29, "    direct");
          v11 = v29;
        }
        else
        {
          v28 = v5;
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "xpcCnx"));
          NSAppendPrintF(&v28, "    %#{pid}", objc_msgSend(v12, "processIdentifier"));
          v11 = v28;

          v5 = v12;
        }

        v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "activatedAdvertiser"));
        v14 = (void *)v13;
        if (v13)
        {
          v27 = v11;
          v15 = CUDescriptionWithLevel(v13, v4);
          v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
          NSAppendPrintF(&v27, ", %@", v16);
          v17 = v27;

          v11 = v17;
        }

        v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "activatedDiscovery"));
        v19 = (void *)v18;
        if (v18)
        {
          v26 = v11;
          v20 = CUDescriptionWithLevel(v18, v4);
          v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
          NSAppendPrintF(&v26, ", %@", v21);
          v22 = v26;

          v11 = v22;
        }

        v25 = v11;
        NSAppendPrintF(&v25, "\n");
        v5 = v25;

      }
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v7);
  }

  return v5;
}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100094360;
  block[3] = &unk_1001110F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100094480;
  block[3] = &unk_1001110F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  NSXPCListener *xpcListener;

  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    if (dword_1001318E8 <= 30
      && (dword_1001318E8 != -1 || _LogCategory_Initialize(&dword_1001318E8, 30)))
    {
      LogPrintF(&dword_1001318E8, "-[RPPrivateDaemon _invalidate]", 30, "Invalidate\n");
    }
    -[NSXPCListener invalidate](self->_xpcListener, "invalidate");
    xpcListener = self->_xpcListener;
    self->_xpcListener = 0;

    -[RPPrivateDaemon _invalidated](self, "_invalidated");
  }
}

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone && !self->_xpcListener)
  {
    self->_invalidateDone = 1;
    if (dword_1001318E8 <= 30
      && (dword_1001318E8 != -1 || _LogCategory_Initialize(&dword_1001318E8, 30)))
    {
      LogPrintF(&dword_1001318E8, "-[RPPrivateDaemon _invalidated]", 30, "Invalidated\n");
    }
  }
}

- (void)_update
{
  if (self->_prefPrivateDiscoveryEnabled)
    -[RPPrivateDaemon _ensureStarted](self, "_ensureStarted");
  else
    -[RPPrivateDaemon _ensureStopped](self, "_ensureStopped");
}

- (void)_processPacketPtr:(const char *)a3 end:(const char *)a4
{
  const char *v4;
  char v5;
  int v6;

  if (a4 - a3 <= 0)
  {
    if (dword_1001318E8 <= 30
      && (dword_1001318E8 != -1 || _LogCategory_Initialize(&dword_1001318E8, 30)))
    {
      LogPrintF(&dword_1001318E8, "-[RPPrivateDaemon _processPacketPtr:end:]", 30, "No header\n");
    }
  }
  else
  {
    v5 = *a3;
    v4 = a3 + 1;
    v6 = v5 & 0x1F;
    switch(v5 & 0x1F)
    {
      case 1:
        -[RPPrivateDaemon _processProbePtr:end:](self, "_processProbePtr:end:", v4);
        break;
      case 2:
        -[RPPrivateDaemon _processResponsePtr:end:](self, "_processResponsePtr:end:", v4);
        break;
      case 3:
        -[RPPrivateDaemon _processAnnouncementPtr:end:](self, "_processAnnouncementPtr:end:", v4);
        break;
      case 4:
        -[RPPrivateDaemon _processQueryPtr:end:](self, "_processQueryPtr:end:", v4);
        break;
      case 5:
        -[RPPrivateDaemon _processAnswerPtr:end:](self, "_processAnswerPtr:end:", v4);
        break;
      default:
        if (dword_1001318E8 <= 30
          && (dword_1001318E8 != -1 || _LogCategory_Initialize(&dword_1001318E8, 30)))
        {
          LogPrintF(&dword_1001318E8, "-[RPPrivateDaemon _processPacketPtr:end:]", 30, "Unknown message type: %d\n", v6);
        }
        break;
    }
  }
}

- (void)_processProbePtr:(const char *)a3 end:(const char *)a4
{
  const char *v6;
  unsigned int v7;
  const char *v8;

  if (a4 - a3 <= 31 || a4 - a3 - 32 <= 3)
  {
    if (dword_1001318E8 > 30 || dword_1001318E8 == -1 && !_LogCategory_Initialize(&dword_1001318E8, 30))
      return;
    v8 = "No EPK1\n";
LABEL_15:
    LogPrintF(&dword_1001318E8, "-[RPPrivateDaemon _processProbePtr:end:]", 30, v8);
    return;
  }
  v6 = a3 + 36;
  if (a4 - (a3 + 36) <= 63)
  {
    if (dword_1001318E8 > 30 || dword_1001318E8 == -1 && !_LogCategory_Initialize(&dword_1001318E8, 30))
      return;
    v8 = "No SIG1\n";
    goto LABEL_15;
  }
  if (dword_1001318E8 <= 30)
  {
    v7 = *((_DWORD *)a3 + 8);
    if (dword_1001318E8 != -1 || _LogCategory_Initialize(&dword_1001318E8, 30))
      LogPrintF(&dword_1001318E8, "-[RPPrivateDaemon _processProbePtr:end:]", 30, "Probe: EPK1 <%H>, TS1 %u, SIG1 <%H>, Extra %td\n", a3, 32, 8, bswap32(v7), v6, 64, 8, a4 - (a3 + 100));
  }
}

- (void)_processResponsePtr:(const char *)a3 end:(const char *)a4
{
  const char *v6;
  const char *v7;

  if (a4 - a3 <= 31)
  {
    if (dword_1001318E8 > 30 || dword_1001318E8 == -1 && !_LogCategory_Initialize(&dword_1001318E8, 30))
      return;
    v7 = "No EPK2\n";
LABEL_14:
    LogPrintF(&dword_1001318E8, "-[RPPrivateDaemon _processResponsePtr:end:]", 30, v7);
    return;
  }
  v6 = a3 + 32;
  if (a4 - (a3 + 32) <= 95)
  {
    if (dword_1001318E8 > 30 || dword_1001318E8 == -1 && !_LogCategory_Initialize(&dword_1001318E8, 30))
      return;
    v7 = "No ESIG2\n";
    goto LABEL_14;
  }
  if (dword_1001318E8 <= 30 && (dword_1001318E8 != -1 || _LogCategory_Initialize(&dword_1001318E8, 30)))
    LogPrintF(&dword_1001318E8, "-[RPPrivateDaemon _processResponsePtr:end:]", 30, "Response: EPK2 <%H>, ESIG2 <%H>, Extra %td\n", a3, 32, 8, v6, 96, 8, a4 - (a3 + 128));
}

- (void)_processAnnouncementPtr:(const char *)a3 end:(const char *)a4
{
  const char *v6;
  unsigned int v7;
  const char *v8;

  if (a4 - a3 <= 31 || a4 - a3 - 32 <= 3)
  {
    if (dword_1001318E8 > 30 || dword_1001318E8 == -1 && !_LogCategory_Initialize(&dword_1001318E8, 30))
      return;
    v8 = "No EPK1\n";
LABEL_15:
    LogPrintF(&dword_1001318E8, "-[RPPrivateDaemon _processAnnouncementPtr:end:]", 30, v8);
    return;
  }
  v6 = a3 + 36;
  if (a4 - (a3 + 36) <= 63)
  {
    if (dword_1001318E8 > 30 || dword_1001318E8 == -1 && !_LogCategory_Initialize(&dword_1001318E8, 30))
      return;
    v8 = "No SIG1\n";
    goto LABEL_15;
  }
  if (dword_1001318E8 <= 30)
  {
    v7 = *((_DWORD *)a3 + 8);
    if (dword_1001318E8 != -1 || _LogCategory_Initialize(&dword_1001318E8, 30))
      LogPrintF(&dword_1001318E8, "-[RPPrivateDaemon _processAnnouncementPtr:end:]", 30, "Announcement: EPK1 <%H>, TS1 %u, SIG1 <%H>, Extra %td\n", a3, 32, 8, bswap32(v7), v6, 64, 8, a4 - (a3 + 100));
  }
}

- (void)_processQueryPtr:(const char *)a3 end:(const char *)a4
{
  int64_t v4;

  v4 = a4 - a3;
  if (a4 - a3 <= 31)
  {
    if (dword_1001318E8 <= 30
      && (dword_1001318E8 != -1 || _LogCategory_Initialize(&dword_1001318E8, 30)))
    {
      LogPrintF(&dword_1001318E8, "-[RPPrivateDaemon _processQueryPtr:end:]", 30, "No EMSG1\n");
    }
  }
  else if (dword_1001318E8 <= 30
         && (dword_1001318E8 != -1 || _LogCategory_Initialize(&dword_1001318E8, 30)))
  {
    LogPrintF(&dword_1001318E8, "-[RPPrivateDaemon _processQueryPtr:end:]", 30, "Query: EMSG1 <%H>\n", a3, v4, 16);
  }
}

- (void)_processAnswerPtr:(const char *)a3 end:(const char *)a4
{
  int64_t v4;

  v4 = a4 - a3;
  if (a4 - a3 <= 31)
  {
    if (dword_1001318E8 <= 30
      && (dword_1001318E8 != -1 || _LogCategory_Initialize(&dword_1001318E8, 30)))
    {
      LogPrintF(&dword_1001318E8, "-[RPPrivateDaemon _processAnswerPtr:end:]", 30, "No EMSG2\n");
    }
  }
  else if (dword_1001318E8 <= 30
         && (dword_1001318E8 != -1 || _LogCategory_Initialize(&dword_1001318E8, 30)))
  {
    LogPrintF(&dword_1001318E8, "-[RPPrivateDaemon _processAnswerPtr:end:]", 30, "Query: EMSG2 <%H>\n", a3, v4, 16);
  }
}

- (BOOL)diagnosticCommand:(id)a3 params:(id)a4
{
  return 0;
}

- (BOOL)addXPCMatchingToken:(unint64_t)a3 event:(id)a4 handler:(id)a5
{
  return 0;
}

- (BOOL)removeXPCMatchingToken:(unint64_t)a3
{
  return 0;
}

- (void)addAdvertiser:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100094E0C;
  block[3] = &unk_100114730;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

- (void)removeAdvertiser:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100094F60;
  block[3] = &unk_100114730;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

- (void)addDiscovery:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009515C;
  block[3] = &unk_100114730;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

- (void)removeDiscovery:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000952B0;
  block[3] = &unk_100114730;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  RPPrivateXPCConnection *v6;
  NSMutableSet *xpcConnections;
  NSMutableSet *v8;
  NSMutableSet *v9;
  void *v10;
  void *v11;
  _QWORD v13[6];

  v5 = a4;
  v6 = objc_alloc_init(RPPrivateXPCConnection);
  -[RPPrivateXPCConnection setDaemon:](v6, "setDaemon:", self);
  -[RPPrivateXPCConnection setDispatchQueue:](v6, "setDispatchQueue:", self->_dispatchQueue);
  -[RPPrivateXPCConnection setXpcCnx:](v6, "setXpcCnx:", v5);
  xpcConnections = self->_xpcConnections;
  if (!xpcConnections)
  {
    v8 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v9 = self->_xpcConnections;
    self->_xpcConnections = v8;

    xpcConnections = self->_xpcConnections;
  }
  -[NSMutableSet addObject:](xpcConnections, "addObject:", v6);
  objc_msgSend(v5, "_setQueue:", self->_dispatchQueue);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___RPPrivateDiscoveryXPCDaemonInterface));
  objc_msgSend(v5, "setExportedInterface:", v10);

  objc_msgSend(v5, "setExportedObject:", v6);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000955B4;
  v13[3] = &unk_100111928;
  v13[4] = self;
  v13[5] = v6;
  objc_msgSend(v5, "setInvalidationHandler:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___RPPrivateDiscoveryXPCClientInterface));
  objc_msgSend(v5, "setRemoteObjectInterface:", v11);

  objc_msgSend(v5, "resume");
  if (dword_1001318E8 <= 20 && (dword_1001318E8 != -1 || _LogCategory_Initialize(&dword_1001318E8, 20)))
    LogPrintF(&dword_1001318E8, "-[RPPrivateDaemon listener:shouldAcceptNewConnection:]", 20, "XPC connection started: %#{pid}\n", objc_msgSend(v5, "processIdentifier"));

  return 1;
}

- (void)_xpcConnectionInvalidated:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (dword_1001318E8 <= 20)
  {
    if (dword_1001318E8 != -1 || (v6 = _LogCategory_Initialize(&dword_1001318E8, 20), v4 = v7, v6))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "xpcCnx"));
      LogPrintF(&dword_1001318E8, "-[RPPrivateDaemon _xpcConnectionInvalidated:]", 20, "XPC connection ended: %#{pid}\n", objc_msgSend(v5, "processIdentifier"));

      v4 = v7;
    }
  }
  objc_msgSend(v4, "xpcConnectionInvalidated");
  -[NSMutableSet removeObject:](self->_xpcConnections, "removeObject:", v7);
  -[RPPrivateDaemon _update](self, "_update");

}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_xpcConnections, 0);
}

@end
