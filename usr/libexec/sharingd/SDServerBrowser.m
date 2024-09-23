@implementation SDServerBrowser

+ (id)sharedBrowser
{
  if (qword_1007C6970 != -1)
    dispatch_once(&qword_1007C6970, &stru_1007178F8);
  return (id)qword_1007C6978;
}

- (SDServerBrowser)init
{
  SDServerBrowser *v2;
  SDServerBrowser *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *odiskBrowsers;
  NSMutableDictionary *v6;
  NSMutableDictionary *bonjourBrowsers;
  NSMutableDictionary *v8;
  NSMutableDictionary *windowsBrowsers;
  NSMutableDictionary *v10;
  NSMutableDictionary *airDropBrowsers;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SDServerBrowser;
  v2 = -[SDServerBrowser init](&v14, "init");
  v3 = v2;
  if (v2)
  {
    v2->_mode = 0;
    v4 = objc_opt_new(NSMutableDictionary);
    odiskBrowsers = v3->_odiskBrowsers;
    v3->_odiskBrowsers = v4;

    v6 = objc_opt_new(NSMutableDictionary);
    bonjourBrowsers = v3->_bonjourBrowsers;
    v3->_bonjourBrowsers = v6;

    v8 = objc_opt_new(NSMutableDictionary);
    windowsBrowsers = v3->_windowsBrowsers;
    v3->_windowsBrowsers = v8;

    v10 = objc_opt_new(NSMutableDictionary);
    airDropBrowsers = v3->_airDropBrowsers;
    v3->_airDropBrowsers = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v12, "addObserver:selector:name:object:", v3, "airDropTransferRequested:", CFSTR("com.apple.sharingd.AirDropTransferInitiated"), 0);

  }
  return v3;
}

- (void)postNotification:(id)a3 forNeighborhood:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  id v11;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v10 = CFSTR("NeighborhoodName");
    v11 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));
  }
  else
  {
    v8 = 0;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v9, "postNotificationName:object:userInfo:", v5, 0, v8);

}

- (void)airDropTransferRequested:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD block[5];
  uint8_t buf[16];

  v4 = airdrop_log(self);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "SDServerBrowser: AirDrop transfer requested notification received", buf, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_airDropBrowsers, "objectForKeyedSubscript:", CFSTR("local")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Browser")));
  if ((objc_msgSend(v7, "startCalled") & 1) == 0)
  {
    objc_msgSend(v7, "start");
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000F5868;
    block[3] = &unk_1007146D8;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }

}

- (void)bonjourNodesDidChange:(id)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "types"));
  if (objc_msgSend(v4, "containsObject:", CFSTR("_afpovertcp._tcp.")))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "domain"));
    v6 = CFSTR("com.apple.sharingd.BonjourChanged");
LABEL_7:
    -[SDServerBrowser postNotification:forNeighborhood:](self, "postNotification:forNeighborhood:", v6, v5);

    goto LABEL_8;
  }
  if (objc_msgSend(v4, "containsObject:", sub_1000CEC14()))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "domain"));
    v6 = CFSTR("com.apple.sharingd.AirDropChanged");
    goto LABEL_7;
  }
  if (objc_msgSend(v4, "containsObject:", CFSTR("_odisk._tcp.")))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "domain"));
    v6 = CFSTR("com.apple.sharingd.ODisksChanged");
    goto LABEL_7;
  }
LABEL_8:

}

- (void)windowsNodesDidChange:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "workgroup"));
  -[SDServerBrowser postNotification:forNeighborhood:](self, "postNotification:forNeighborhood:", CFSTR("com.apple.sharingd.WindowsChanged"), v4);

}

- (void)startBrowsingDomain:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  SDBonjourBrowser *v10;
  _QWORD v11[4];

  v4 = a3;
  v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_bonjourBrowsers, "objectForKeyedSubscript:", v4));
  if (v5)
  {
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("Count")));
    v8 = objc_msgSend(v7, "intValue") + 1;

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v8));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v9, CFSTR("Count"));
  }
  else
  {
    v11[0] = CFSTR("_afpovertcp._tcp.");
    v11[1] = CFSTR("_smb._tcp.");
    v11[2] = CFSTR("_rfb._tcp.");
    v11[3] = CFSTR("_adisk._tcp.");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 4));
    v10 = -[SDBonjourBrowser initWithDomain:types:]([SDBonjourBrowser alloc], "initWithDomain:types:", v4, v9);
    v6 = objc_opt_new(NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", &off_10074B7C0, CFSTR("Count"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v10, CFSTR("Browser"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_bonjourBrowsers, "setObject:forKeyedSubscript:", v6, v4);
    -[SDBonjourBrowser setDelegate:](v10, "setDelegate:", self);
    -[SDBonjourBrowser setMode:](v10, "setMode:", self->_mode);
    -[SDBonjourBrowser start](v10, "start");

  }
}

- (void)setBonjourBrowserMode:(int64_t)a3
{
  void *v4;
  id v5;

  if (self->_mode != a3)
  {
    self->_mode = a3;
    v5 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_bonjourBrowsers, "objectForKeyedSubscript:", CFSTR("local")));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Browser")));
    objc_msgSend(v4, "setMode:", a3);

  }
}

- (id)bonjourNodesForDomain:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_bonjourBrowsers, "objectForKeyedSubscript:", a3));
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Browser")));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "nodes"));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)stopBrowsingDomain:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_bonjourBrowsers, "objectForKeyedSubscript:"));
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Count")));
    v7 = objc_msgSend(v6, "intValue") - 1;

    if ((_DWORD)v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v7));
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("Count"));

    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Browser")));
      objc_msgSend(v9, "invalidate");

      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Browser")));
      objc_msgSend(v10, "setDelegate:", 0);

      -[NSMutableDictionary removeObjectForKey:](self->_bonjourBrowsers, "removeObjectForKey:", v11);
    }
  }

}

- (void)startODiskBrowsing:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  SDBonjourBrowser *v10;
  const __CFString *v11;

  v4 = a3;
  v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_odiskBrowsers, "objectForKeyedSubscript:", v4));
  if (v5)
  {
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("Count")));
    v8 = objc_msgSend(v7, "intValue") + 1;

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v8));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v9, CFSTR("Count"));
  }
  else
  {
    v11 = CFSTR("_odisk._tcp.");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
    v10 = -[SDBonjourBrowser initWithDomain:types:]([SDBonjourBrowser alloc], "initWithDomain:types:", v4, v9);
    v6 = objc_opt_new(NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", &off_10074B7C0, CFSTR("Count"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v10, CFSTR("Browser"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_odiskBrowsers, "setObject:forKeyedSubscript:", v6, v4);
    -[SDBonjourBrowser setDelegate:](v10, "setDelegate:", self);
    -[SDBonjourBrowser start](v10, "start");

  }
}

- (id)odiskNodesForDomain:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_odiskBrowsers, "objectForKeyedSubscript:", a3));
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Browser")));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "nodes"));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)stopODiskBrowsing:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_odiskBrowsers, "objectForKeyedSubscript:"));
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Count")));
    v7 = objc_msgSend(v6, "intValue") - 1;

    if ((_DWORD)v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v7));
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("Count"));

    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Browser")));
      objc_msgSend(v9, "invalidate");

      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Browser")));
      objc_msgSend(v10, "setDelegate:", 0);

      -[NSMutableDictionary removeObjectForKey:](self->_odiskBrowsers, "removeObjectForKey:", v11);
    }
  }

}

- (void)startAirDropBrowsing:(id)a3 bundleID:(id)a4 sessionID:(id)a5 helperConnection:(id)a6 delayBonjour:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSMutableDictionary *v16;
  NSMutableDictionary *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  SDBonjourBrowser *v21;
  id v22;
  uint64_t v23;
  NSObject *v24;
  uint8_t v25[8];
  _QWORD block[5];
  const __CFString *v27;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_airDropBrowsers, "objectForKeyedSubscript:", v12));
  if (v16)
  {
    v17 = v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", CFSTR("Count")));
    v19 = objc_msgSend(v18, "intValue") + 1;

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v19));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v20, CFSTR("Count"));
  }
  else
  {
    v27 = sub_1000CEC14();
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v27, 1));
    v21 = -[SDBonjourBrowser initWithDomain:types:]([SDBonjourBrowser alloc], "initWithDomain:types:", v12, v20);
    -[SDBonjourBrowser setHelperConnection:](v21, "setHelperConnection:", v15);
    v17 = objc_opt_new(NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", &off_10074B7C0, CFSTR("Count"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v21, CFSTR("Browser"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_airDropBrowsers, "setObject:forKeyedSubscript:", v17, v12);
    -[SDBonjourBrowser setBundleID:](v21, "setBundleID:", v13);
    -[SDBonjourBrowser setSessionID:](v21, "setSessionID:", v14);
    v22 = -[SDBonjourBrowser setDelegate:](v21, "setDelegate:", self);
    if (a7)
    {
      v23 = airdrop_log(v22);
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v25 = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Delayed Bonjour browsing requested", v25, 2u);
      }

    }
    else
    {
      -[SDBonjourBrowser start](v21, "start");
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000F62B4;
      block[3] = &unk_1007146D8;
      block[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }

  }
}

- (void)startAirDropBrowsing:(id)a3 connection:(id)a4 sessionID:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  SDBonjourBrowser *v17;
  _QWORD v18[5];
  _QWORD block[5];
  const __CFString *v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_airDropBrowsers, "objectForKeyedSubscript:", v8));
  if (v11)
  {
    v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", CFSTR("Count")));
    v14 = objc_msgSend(v13, "intValue") + 1;

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v14));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v15, CFSTR("Count"));

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("Browser")));
    if ((objc_msgSend(v16, "startCalled") & 1) == 0)
    {
      objc_msgSend(v16, "start");
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_1000F6544;
      v18[3] = &unk_1007146D8;
      v18[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v18);
    }
  }
  else
  {
    v20 = sub_1000CEC14();
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
    v17 = -[SDBonjourBrowser initWithDomain:types:]([SDBonjourBrowser alloc], "initWithDomain:types:", v8, v16);
    v12 = objc_opt_new(NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", &off_10074B7C0, CFSTR("Count"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v17, CFSTR("Browser"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_airDropBrowsers, "setObject:forKeyedSubscript:", v12, v8);
    -[SDBonjourBrowser setXpcConnection:](v17, "setXpcConnection:", v9);
    -[SDBonjourBrowser setSessionID:](v17, "setSessionID:", v10);
    -[SDBonjourBrowser setDelegate:](v17, "setDelegate:", self);
    -[SDBonjourBrowser start](v17, "start");
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000F6530;
    block[3] = &unk_1007146D8;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  }
}

- (void)setIconData:(id)a3 iconHash:(id)a4 forPerson:(__SFNode *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_airDropBrowsers, "objectForKeyedSubscript:", CFSTR("local")));
  v10 = v9;
  if (v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Browser")));
    objc_msgSend(v11, "setIconData:iconHash:forPerson:", v12, v8, a5);

  }
}

- (void)incrementTransfersInitiated
{
  void *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_airDropBrowsers, "objectForKeyedSubscript:", CFSTR("local")));
  v4 = v2;
  if (v2)
  {
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("Browser")));
    -[NSObject setTransfersInitiated:](v5, "setTransfersInitiated:", -[NSObject transfersInitiated](v5, "transfersInitiated") + 1);
  }
  else
  {
    v6 = browser_log(0, v3);
    v5 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1000F7378(v5);
  }

}

- (void)incrementTransfersCompleted
{
  void *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint8_t v7[16];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_airDropBrowsers, "objectForKeyedSubscript:", CFSTR("local")));
  v4 = v2;
  if (v2)
  {
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("Browser")));
    -[NSObject setTransfersCompleted:](v5, "setTransfersCompleted:", -[NSObject transfersCompleted](v5, "transfersCompleted") + 1);
  }
  else
  {
    v6 = browser_log(0, v3);
    v5 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "incrementTransfersCompleted: No AirDrop browsers are running", v7, 2u);
    }
  }

}

- (id)airDropNodesForDomain:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_airDropBrowsers, "objectForKeyedSubscript:", a3));
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Browser")));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "nodes"));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isAirDropEnabled
{
  return -[NSMutableDictionary count](self->_airDropBrowsers, "count") != 0;
}

- (void)stopAirDropBrowsing:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD block[5];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_airDropBrowsers, "objectForKeyedSubscript:", v4));
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Count")));
    v8 = objc_msgSend(v7, "intValue") - 1;

    if ((_DWORD)v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v8));
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("Count"));

    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Browser")));
      objc_msgSend(v10, "invalidate");

      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Browser")));
      objc_msgSend(v11, "setDelegate:", 0);

      -[NSMutableDictionary removeObjectForKey:](self->_airDropBrowsers, "removeObjectForKey:", v4);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000F690C;
      block[3] = &unk_1007146D8;
      block[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }

}

- (void)startBrowsingWorkgroup:(id)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;
  void *v6;
  uint64_t v7;
  SDWindowsBrowser *v8;
  id v9;

  v9 = a3;
  v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_windowsBrowsers, "objectForKeyedSubscript:"));
  if (v4)
  {
    v5 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("Count")));
    v7 = objc_msgSend(v6, "intValue") + 1;

    v8 = (SDWindowsBrowser *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v7));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v8, CFSTR("Count"));
  }
  else
  {
    v8 = -[SDWindowsBrowser initWithWorkgroup:]([SDWindowsBrowser alloc], "initWithWorkgroup:", v9);
    v5 = objc_opt_new(NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", &off_10074B7C0, CFSTR("Count"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v8, CFSTR("Browser"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_windowsBrowsers, "setObject:forKeyedSubscript:", v5, v9);
    -[SDWindowsBrowser setDelegate:](v8, "setDelegate:", self);
    -[SDWindowsBrowser start](v8, "start");
  }

}

- (id)windowsNodesForWorkgroup:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_windowsBrowsers, "objectForKeyedSubscript:", a3));
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Browser")));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "nodes"));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)stopBrowsingWorkgroup:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_windowsBrowsers, "objectForKeyedSubscript:"));
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Count")));
    v7 = objc_msgSend(v6, "intValue") - 1;

    if ((_DWORD)v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v7));
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("Count"));
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Browser")));
      objc_msgSend(v8, "stop");
      objc_msgSend(v8, "setDelegate:", 0);
      -[NSMutableDictionary removeObjectForKey:](self->_windowsBrowsers, "removeObjectForKey:", v9);
    }

  }
}

- (id)stringForBrowserMode:(int64_t)a3
{
  int v3;
  uint64_t v5;
  NSObject *v6;
  _DWORD v7[2];

  v3 = a3;
  if ((unint64_t)a3 < 3)
    return off_100717918[a3];
  v5 = browser_log(self, a2);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Unrecognized browser mode %d", (uint8_t *)v7, 8u);
  }

  return 0;
}

- (NSString)description
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *j;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  void *k;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  void *m;
  uint64_t v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  NSMutableDictionary *obj;
  NSMutableDictionary *obja;
  NSMutableDictionary *objb;
  NSMutableDictionary *objc;
  id v52;
  id v53;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  id v59;
  id v60;
  id v61;
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  id v67;
  id v68;
  id v69;
  id v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  id v75;
  id v76;
  id v77;
  id v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  id v83;
  id v84;
  id v85;
  id v86;
  _BYTE v87[128];
  _BYTE v88[128];
  _BYTE v89[128];
  _BYTE v90[128];

  v86 = 0;
  NSAppendPrintF(&v86, "ServerBrowser\n");
  v3 = v86;
  v85 = v3;
  NSAppendPrintF(&v85, "--------------\n");
  v4 = v85;

  v84 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDServerBrowser stringForBrowserMode:](self, "stringForBrowserMode:", self->_mode));
  NSAppendPrintF(&v84, "Mode:                                %@\n", v5);
  v6 = v84;

  if (-[NSMutableDictionary count](self->_bonjourBrowsers, "count"))
  {
    v83 = v6;
    NSAppendPrintF(&v83, "Bonjour Browsers:\n");
    v7 = v83;

    v81 = 0u;
    v82 = 0u;
    v79 = 0u;
    v80 = 0u;
    obj = self->_bonjourBrowsers;
    v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v79, v90, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v80;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v80 != v10)
            objc_enumerationMutation(obj);
          v12 = *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * (_QWORD)i);
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_bonjourBrowsers, "objectForKeyedSubscript:", v12));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("Browser")));
          v78 = v7;
          NSAppendPrintF(&v78, "Domain:                              %@\n", v12);
          v15 = v78;

          v77 = v15;
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "description"));
          NSAppendPrintF(&v77, "%@", v16);
          v7 = v77;

        }
        v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v79, v90, 16);
      }
      while (v9);
    }

    v76 = v7;
    NSAppendPrintF(&v76, "\n");
    v6 = v76;

  }
  if (-[NSMutableDictionary count](self->_airDropBrowsers, "count"))
  {
    v75 = v6;
    NSAppendPrintF(&v75, "AirDrop Browsers:\n");
    v17 = v75;

    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    obja = self->_airDropBrowsers;
    v18 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v71, v89, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v72;
      do
      {
        for (j = 0; j != v19; j = (char *)j + 1)
        {
          if (*(_QWORD *)v72 != v20)
            objc_enumerationMutation(obja);
          v22 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * (_QWORD)j);
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_airDropBrowsers, "objectForKeyedSubscript:", v22));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("Browser")));
          v70 = v17;
          NSAppendPrintF(&v70, "Domain:                              %@\n", v22);
          v25 = v70;

          v69 = v25;
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "description"));
          NSAppendPrintF(&v69, "%@", v26);
          v17 = v69;

        }
        v19 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v71, v89, 16);
      }
      while (v19);
    }

    v68 = v17;
    NSAppendPrintF(&v68, "\n");
    v6 = v68;

  }
  if (-[NSMutableDictionary count](self->_windowsBrowsers, "count"))
  {
    v67 = v6;
    NSAppendPrintF(&v67, "Windows Browsers:\n");
    v27 = v67;

    v65 = 0u;
    v66 = 0u;
    v64 = 0u;
    v63 = 0u;
    objb = self->_windowsBrowsers;
    v28 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](objb, "countByEnumeratingWithState:objects:count:", &v63, v88, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v64;
      do
      {
        for (k = 0; k != v29; k = (char *)k + 1)
        {
          if (*(_QWORD *)v64 != v30)
            objc_enumerationMutation(objb);
          v32 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * (_QWORD)k);
          v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_windowsBrowsers, "objectForKeyedSubscript:", v32));
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("Browser")));
          v62 = v27;
          NSAppendPrintF(&v62, "Domain:                              %@\n", v32);
          v35 = v62;

          v61 = v35;
          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "description"));
          NSAppendPrintF(&v61, "%@", v36);
          v27 = v61;

        }
        v29 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](objb, "countByEnumeratingWithState:objects:count:", &v63, v88, 16);
      }
      while (v29);
    }

    v60 = v27;
    NSAppendPrintF(&v60, "\n");
    v6 = v60;

  }
  if (-[NSMutableDictionary count](self->_odiskBrowsers, "count"))
  {
    v59 = v6;
    NSAppendPrintF(&v59, "ODisk Browsers:\n");
    v37 = v59;

    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    objc = self->_odiskBrowsers;
    v38 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](objc, "countByEnumeratingWithState:objects:count:", &v55, v87, 16);
    if (v38)
    {
      v39 = v38;
      v40 = *(_QWORD *)v56;
      do
      {
        for (m = 0; m != v39; m = (char *)m + 1)
        {
          if (*(_QWORD *)v56 != v40)
            objc_enumerationMutation(objc);
          v42 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)m);
          v43 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_odiskBrowsers, "objectForKeyedSubscript:", v42));
          v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("Browser")));
          v54 = v37;
          NSAppendPrintF(&v54, "Domain:                              %@\n", v42);
          v45 = v54;

          v53 = v45;
          v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "description"));
          NSAppendPrintF(&v53, "%@", v46);
          v37 = v53;

        }
        v39 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](objc, "countByEnumeratingWithState:objects:count:", &v55, v87, 16);
      }
      while (v39);
    }

    v52 = v37;
    NSAppendPrintF(&v52, "\n");
    v6 = v52;

  }
  return (NSString *)v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_airDropBrowsers, 0);
  objc_storeStrong((id *)&self->_windowsBrowsers, 0);
  objc_storeStrong((id *)&self->_bonjourBrowsers, 0);
  objc_storeStrong((id *)&self->_odiskBrowsers, 0);
}

@end
