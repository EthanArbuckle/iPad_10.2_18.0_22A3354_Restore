@implementation WatchDebugController

+ (id)navigationDestinationTitle
{
  return CFSTR("Paired Watch");
}

- (WatchDebugController)init
{
  WatchDebugController *v2;
  NSXPCConnection *v3;
  NSXPCConnection *connection;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  WatchDebugController *v9;
  id v10;
  _QWORD *v11;
  NSXPCConnection *v12;
  _QWORD *v13;
  void *v14;
  _QWORD *v15;
  id v16;
  WatchDebugController *v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  WatchDebugController *v26;
  id v27;
  id v28;
  id location;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)WatchDebugController;
  v2 = -[AuxiliaryDebugViewController init](&v30, "init");
  if (v2)
  {
    v3 = (NSXPCConnection *)objc_msgSend(objc_alloc((Class)NSXPCConnection), "initWithMachServiceName:options:", CFSTR("com.apple.nanomaps.xpc.Maps"), 0);
    connection = v2->_connection;
    v2->_connection = v3;

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___NanoCompanionXPCDaemonControlling));
    -[NSXPCConnection setRemoteObjectInterface:](v2->_connection, "setRemoteObjectInterface:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___NanoCompanionXPCAppControlling));
    -[NSXPCConnection setExportedInterface:](v2->_connection, "setExportedInterface:", v6);

    -[NSXPCConnection setExportedObject:](v2->_connection, "setExportedObject:", v2);
    -[NSXPCConnection resume](v2->_connection, "resume");
    v7 = objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 100);
    objc_msgSend(v7, "sizeToFit");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[WatchDebugController tableView](v2, "tableView"));
    objc_msgSend(v8, "setTableHeaderView:", v7);

    objc_msgSend(v7, "startAnimating");
    objc_initWeak(&location, v2);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10085A510;
    v25[3] = &unk_1011AE5B8;
    objc_copyWeak(&v28, &location);
    v9 = v2;
    v26 = v9;
    v10 = v7;
    v27 = v10;
    v11 = objc_retainBlock(v25);
    v12 = v2->_connection;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10085A6A8;
    v23[3] = &unk_1011AE218;
    v13 = v11;
    v24 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](v12, "remoteObjectProxyWithErrorHandler:", v23));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10085A748;
    v19[3] = &unk_1011D9358;
    objc_copyWeak(&v22, &location);
    v15 = v13;
    v21 = v15;
    v16 = v10;
    v20 = v16;
    objc_msgSend(v14, "_debug_fetchServerConfiguration:", v19);

    v17 = v9;
    objc_destroyWeak(&v22);

    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);

  }
  return v2;
}

- (void)dealloc
{
  NSXPCConnection *connection;
  objc_super v4;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  connection = self->_connection;
  self->_connection = 0;

  v4.receiver = self;
  v4.super_class = (Class)WatchDebugController;
  -[MapsDebugValuesViewController dealloc](&v4, "dealloc");
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2 * (self->_debugInfo != 0);
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if (a4)
    return 0;
  else
    return CFSTR("Active Tile Group");
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v6;
  __CFString *v7;

  v6 = a3;
  if (a4 == 1)
  {
    v7 = CFSTR("Copy diagnostic information to the pasteboard. Maps must be in the foreground on the paired Watch");
  }
  else if (a4)
  {
    v7 = 0;
  }
  else
  {
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue(-[GEOActiveTileGroup uniqueIdentifier](self->_activeTileGroup, "uniqueIdentifier"));
  }

  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if ((unint64_t)a4 > 2)
    return 0;
  else
    return qword_100E3C2D8[a4];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = objc_msgSend(a4, "section", a3);
  if (v5 == (id)1)
  {
    v6 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 0, 0);
    objc_msgSend(v6, "setAccessoryView:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "textLabel"));
    objc_msgSend(v13, "setTextColor:", v12);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "textLabel"));
    objc_msgSend(v9, "setText:", CFSTR("Copy Diagnostics"));
  }
  else
  {
    if (v5)
    {
      v6 = 0;
      return v6;
    }
    v6 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 0, 0);
    objc_msgSend(v6, "setAccessoryView:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "textLabel"));
    objc_msgSend(v8, "setTextColor:", v7);

    objc_msgSend(v6, "setSelectionStyle:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[GEOActiveTileGroup releaseInfo](self->_activeTileGroup, "releaseInfo"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ - %i"), v9, -[GEOActiveTileGroup identifier](self->_activeTileGroup, "identifier")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "textLabel"));
    objc_msgSend(v11, "setText:", v10);

  }
  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD *v12;
  NSXPCConnection *connection;
  _QWORD *v14;
  void *v15;
  _QWORD *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  WatchDebugController *v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  WatchDebugController *v30;
  id v31;
  id location[2];

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
  if (objc_msgSend(v7, "section") == (id)1)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cellForRowAtIndexPath:", v7));
    v9 = objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 100);
    objc_msgSend(v9, "sizeToFit");
    objc_msgSend(v8, "setAccessoryView:", v9);
    objc_msgSend(v9, "startAnimating");
    objc_initWeak(location, self);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10085AE60;
    v27[3] = &unk_1011D9380;
    objc_copyWeak(&v31, location);
    v10 = v9;
    v28 = v10;
    v11 = v8;
    v29 = v11;
    v30 = self;
    v12 = objc_retainBlock(v27);
    connection = self->_connection;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10085AF48;
    v25[3] = &unk_1011AE218;
    v14 = v12;
    v26 = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v25));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10085AFE8;
    v19[3] = &unk_1011D93D0;
    objc_copyWeak(&v24, location);
    v16 = v14;
    v23 = v16;
    v17 = v10;
    v20 = v17;
    v18 = v11;
    v21 = v18;
    v22 = self;
    objc_msgSend(v15, "_debug_fetchDiagnosticsString:", v19);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&v31);
    objc_destroyWeak(location);

  }
}

- (void)updateDirectionsStatusWithCompletionHandler:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_activeTileGroup, 0);
  objc_storeStrong((id *)&self->_debugInfo, 0);
}

@end
