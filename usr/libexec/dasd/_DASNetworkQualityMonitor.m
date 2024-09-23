@implementation _DASNetworkQualityMonitor

- (_DASNetworkQualityMonitor)initWithInterface:(int64_t)a3 interfaceSubtype:(int64_t)a4 onChange:(id)a5
{
  id v8;
  _DASNetworkQualityMonitor *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *noiManagerQueue;
  NWNetworkOfInterestManager *v12;
  NWNetworkOfInterestManager *noiManager;
  id v14;
  id callback;
  objc_super v17;

  v8 = a5;
  v17.receiver = self;
  v17.super_class = (Class)_DASNetworkQualityMonitor;
  v9 = -[_DASNetworkQualityMonitor init](&v17, "init");
  if (v9)
  {
    v10 = dispatch_queue_create("com.apple.duetknowledgecollector.networkQualityMonitorQueue", 0);
    noiManagerQueue = v9->_noiManagerQueue;
    v9->_noiManagerQueue = (OS_dispatch_queue *)v10;

    v12 = (NWNetworkOfInterestManager *)objc_alloc_init((Class)NWNetworkOfInterestManager);
    noiManager = v9->_noiManager;
    v9->_noiManager = v12;

    -[NWNetworkOfInterestManager setQueue:](v9->_noiManager, "setQueue:", v9->_noiManagerQueue);
    -[NWNetworkOfInterestManager setDelegate:](v9->_noiManager, "setDelegate:", v9);
    if (a4)
    {
      v9->_interfaceSubtype = a4;
      -[NWNetworkOfInterestManager trackNOIAnyForInterfaceSubtype:options:](v9->_noiManager, "trackNOIAnyForInterfaceSubtype:options:", a4, 0);
    }
    else
    {
      v9->_interface = a3;
      -[NWNetworkOfInterestManager trackNOIAnyForInterfaceType:options:](v9->_noiManager, "trackNOIAnyForInterfaceType:options:", a3, 0);
    }
    v14 = objc_retainBlock(v8);
    callback = v9->_callback;
    v9->_callback = v14;

  }
  return v9;
}

+ (id)monitorForInterface:(int64_t)a3 interfaceSubtype:(int64_t)a4 onChange:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  v9 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1)), "initWithInterface:interfaceSubtype:onChange:", a3, a4, v8);

  return v9;
}

- (int64_t)linkQuality
{
  return (int64_t)-[NWNetworkOfInterest linkQuality](self->_noi, "linkQuality");
}

- (void)didStartTrackingNOI:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  NWNetworkOfInterest *noi;
  NSObject *v9;
  NWNetworkOfInterest *v10;
  id v11;
  int64_t interface;
  int64_t interfaceSubtype;
  int v14;
  NWNetworkOfInterest *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  int64_t v19;
  __int16 v20;
  int64_t v21;

  v5 = a3;
  v6 = v5;
  if (!self->_noi)
  {
    if (objc_msgSend(v5, "interface") == (id)self->_interface
      || objc_msgSend(v6, "interfaceSubtype") == (id)self->_interfaceSubtype)
    {
      objc_storeStrong((id *)&self->_noi, a3);
      v7 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("nw")));
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        noi = self->_noi;
        v14 = 138412546;
        v15 = noi;
        v16 = 2048;
        v17 = -[NWNetworkOfInterest linkQuality](noi, "linkQuality");
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Saving noi: %@ (%ld)", (uint8_t *)&v14, 0x16u);
      }

      -[NWNetworkOfInterest addObserver:forKeyPath:options:context:](self->_noi, "addObserver:forKeyPath:options:context:", self, CFSTR("linkQuality"), 1, 0);
    }
    else
    {
      v9 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("nw")));
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v10 = (NWNetworkOfInterest *)objc_msgSend(v6, "interface");
        v11 = objc_msgSend(v6, "interfaceSubtype");
        interface = self->_interface;
        interfaceSubtype = self->_interfaceSubtype;
        v14 = 134218752;
        v15 = v10;
        v16 = 2048;
        v17 = v11;
        v18 = 2048;
        v19 = interface;
        v20 = 2048;
        v21 = interfaceSubtype;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Interface and subtype (%ld, %ld) do not match expected (%ld, %ld)", (uint8_t *)&v14, 0x2Au);
      }

    }
  }

}

- (void)didStopTrackingNOI:(id)a3
{
  id v4;
  NWNetworkOfInterest *noi;
  NSObject *v6;
  int v7;
  id v8;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqual:", self->_noi) & 1) != 0)
  {
    -[NWNetworkOfInterest removeObserver:forKeyPath:](self->_noi, "removeObserver:forKeyPath:", self, CFSTR("linkQuality"));
    noi = self->_noi;
    self->_noi = 0;

  }
  else
  {
    v6 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("nw")));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = 138412290;
      v8 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Stopped tracking noi %@", (uint8_t *)&v7, 0xCu);
    }

  }
}

- (void)didStopTrackingAllNOIs:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  int64_t interface;
  NWNetworkOfInterestManager *noiManager;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        -[_DASNetworkQualityMonitor didStopTrackingNOI:](self, "didStopTrackingNOI:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v8));
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  interface = self->_interface;
  noiManager = self->_noiManager;
  if (interface)
    -[NWNetworkOfInterestManager trackNOIAnyForInterfaceType:options:](noiManager, "trackNOIAnyForInterfaceType:options:", interface, 0);
  else
    -[NWNetworkOfInterestManager trackNOIAnyForInterfaceSubtype:options:](noiManager, "trackNOIAnyForInterfaceSubtype:options:", self->_interfaceSubtype, 0);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7;
  unsigned __int8 v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;

  v7 = a4;
  v8 = objc_msgSend(v7, "isEqual:", self->_noi);
  v9 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("nw")));
  v10 = v9;
  if ((v8 & 1) != 0)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[NWNetworkOfInterest interface](self->_noi, "interface")));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v7, "interfaceSubtype")));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[NWNetworkOfInterest linkQuality](self->_noi, "linkQuality")));
      v14 = 138412802;
      v15 = v11;
      v16 = 2112;
      v17 = v12;
      v18 = 2112;
      v19 = v13;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Link Quality for %@/%@ is now %@", (uint8_t *)&v14, 0x20u);

    }
    (*((void (**)(void))self->_callback + 2))();
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v14 = 138412290;
      v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Unexpected noi %@", (uint8_t *)&v14, 0xCu);
    }

  }
}

- (OS_dispatch_queue)noiManagerQueue
{
  return self->_noiManagerQueue;
}

- (void)setNoiManagerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_noiManagerQueue, a3);
}

- (int64_t)interface
{
  return self->_interface;
}

- (void)setInterface:(int64_t)a3
{
  self->_interface = a3;
}

- (int64_t)interfaceSubtype
{
  return self->_interfaceSubtype;
}

- (void)setInterfaceSubtype:(int64_t)a3
{
  self->_interfaceSubtype = a3;
}

- (NWNetworkOfInterestManager)noiManager
{
  return self->_noiManager;
}

- (void)setNoiManager:(id)a3
{
  objc_storeStrong((id *)&self->_noiManager, a3);
}

- (NWNetworkOfInterest)noi
{
  return self->_noi;
}

- (void)setNoi:(id)a3
{
  objc_storeStrong((id *)&self->_noi, a3);
}

- (int64_t)quality
{
  return self->_quality;
}

- (void)setQuality:(int64_t)a3
{
  self->_quality = a3;
}

- (id)callback
{
  return self->_callback;
}

- (void)setCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_noi, 0);
  objc_storeStrong((id *)&self->_noiManager, 0);
  objc_storeStrong((id *)&self->_noiManagerQueue, 0);
}

@end
