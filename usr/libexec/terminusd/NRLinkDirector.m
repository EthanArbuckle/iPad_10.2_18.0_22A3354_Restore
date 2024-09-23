@implementation NRLinkDirector

- (void)linkIsAvailable:(id)a3
{
  NSObject *v4;
  NSMutableDictionary *conductors;
  NSMutableDictionary *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  int IsLevelEnabled;
  void *v17;
  id v18;

  v18 = a3;
  v4 = sub_10014CFBC();
  dispatch_assert_queue_V2(v4);

  if (v18)
  {
    if (self)
      conductors = self->_conductors;
    else
      conductors = 0;
    v6 = conductors;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "nrUUID"));
    v8 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", v7));

    if (v8)
    {
      objc_msgSend(v8, "linkIsAvailable:", v18);
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "nrUUID"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUIDString"));
      sub_1000A25C4((uint64_t)self, 1014, CFSTR("linkAvailable %@ %@"), v10, v11, v12, v13, v14, (uint64_t)v18);

      v8 = 0;
    }
  }
  else
  {
    v15 = sub_1000A2640();
    IsLevelEnabled = _NRLogIsLevelEnabled(v15, 17);

    if (!IsLevelEnabled)
      goto LABEL_8;
    v8 = sub_1000A2640();
    _NRLogWithArgs(v8, 17, "%s called with null link", "-[NRLinkDirector linkIsAvailable:]");
  }

LABEL_8:
}

- (void)linkIsReady:(id)a3
{
  NSObject *v4;
  NSMutableDictionary *conductors;
  NSMutableDictionary *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  int IsLevelEnabled;
  void *v17;
  id v18;

  v18 = a3;
  v4 = sub_10014CFBC();
  dispatch_assert_queue_V2(v4);

  if (v18)
  {
    if (self)
      conductors = self->_conductors;
    else
      conductors = 0;
    v6 = conductors;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "nrUUID"));
    v8 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", v7));

    if (v8)
    {
      objc_msgSend(v8, "linkIsReady:", v18);
      sub_1000A26B0((uint64_t)self);
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "nrUUID"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUIDString"));
      sub_1000A25C4((uint64_t)self, 1014, CFSTR("linkReady %@ %@"), v10, v11, v12, v13, v14, (uint64_t)v18);

      v8 = 0;
    }
  }
  else
  {
    v15 = sub_1000A2640();
    IsLevelEnabled = _NRLogIsLevelEnabled(v15, 17);

    if (!IsLevelEnabled)
      goto LABEL_8;
    v8 = sub_1000A2640();
    _NRLogWithArgs(v8, 17, "%s called with null link", "-[NRLinkDirector linkIsReady:]");
  }

LABEL_8:
}

- (void)linkIsSuspended:(id)a3
{
  NSObject *v4;
  NSMutableDictionary *conductors;
  NSMutableDictionary *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  int IsLevelEnabled;
  void *v17;
  id v18;

  v18 = a3;
  v4 = sub_10014CFBC();
  dispatch_assert_queue_V2(v4);

  if (v18)
  {
    if (self)
      conductors = self->_conductors;
    else
      conductors = 0;
    v6 = conductors;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "nrUUID"));
    v8 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", v7));

    if (v8)
    {
      objc_msgSend(v8, "linkIsSuspended:", v18);
      sub_1000A26B0((uint64_t)self);
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "nrUUID"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUIDString"));
      sub_1000A25C4((uint64_t)self, 1014, CFSTR("linkSuspended %@ %@"), v10, v11, v12, v13, v14, (uint64_t)v18);

      v8 = 0;
    }
  }
  else
  {
    v15 = sub_1000A2640();
    IsLevelEnabled = _NRLogIsLevelEnabled(v15, 17);

    if (!IsLevelEnabled)
      goto LABEL_8;
    v8 = sub_1000A2640();
    _NRLogWithArgs(v8, 17, "%s called with null link", "-[NRLinkDirector linkIsSuspended:]");
  }

LABEL_8:
}

- (void)linkIsUnavailable:(id)a3
{
  NSObject *v4;
  NSMutableDictionary *conductors;
  NSMutableDictionary *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  int IsLevelEnabled;
  void *v17;
  id v18;

  v18 = a3;
  v4 = sub_10014CFBC();
  dispatch_assert_queue_V2(v4);

  if (v18)
  {
    if (self)
      conductors = self->_conductors;
    else
      conductors = 0;
    v6 = conductors;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "nrUUID"));
    v8 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", v7));

    if (v8)
    {
      objc_msgSend(v8, "linkIsUnavailable:", v18);
      sub_1000A26B0((uint64_t)self);
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "nrUUID"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUIDString"));
      sub_1000A25C4((uint64_t)self, 1014, CFSTR("linkUnavailable %@ %@"), v10, v11, v12, v13, v14, (uint64_t)v18);

      v8 = 0;
    }
  }
  else
  {
    v15 = sub_1000A2640();
    IsLevelEnabled = _NRLogIsLevelEnabled(v15, 17);

    if (!IsLevelEnabled)
      goto LABEL_8;
    v8 = sub_1000A2640();
    _NRLogWithArgs(v8, 17, "%s called with null link", "-[NRLinkDirector linkIsUnavailable:]");
  }

LABEL_8:
}

- (void)linkDidReceiveData:(id)a3 data:(id)a4
{
  id v6;
  NSObject *v7;
  NSMutableDictionary *conductors;
  NSMutableDictionary *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  int v19;
  id v20;
  int IsLevelEnabled;
  void *v22;
  id v23;

  v23 = a3;
  v6 = a4;
  v7 = sub_10014CFBC();
  dispatch_assert_queue_V2(v7);

  if (v23)
  {
    if (v6)
    {
      if (self)
        conductors = self->_conductors;
      else
        conductors = 0;
      v9 = conductors;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "nrUUID"));
      v11 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", v10));

      if (v11)
      {
        objc_msgSend(v11, "linkDidReceiveData:data:", v23, v6);
      }
      else
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "nrUUID"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "UUIDString"));
        sub_1000A25C4((uint64_t)self, 1014, CFSTR("linkDidReceiveData %@ %@"), v13, v14, v15, v16, v17, (uint64_t)v23);

        v11 = 0;
      }
    }
    else
    {
      v20 = sub_1000A2640();
      IsLevelEnabled = _NRLogIsLevelEnabled(v20, 17);

      if (!IsLevelEnabled)
        goto LABEL_9;
      v11 = sub_1000A2640();
      _NRLogWithArgs(v11, 17, "%s called with null data");
    }
  }
  else
  {
    v18 = sub_1000A2640();
    v19 = _NRLogIsLevelEnabled(v18, 17);

    if (!v19)
      goto LABEL_9;
    v11 = sub_1000A2640();
    _NRLogWithArgs(v11, 17, "%s called with null link");
  }

LABEL_9:
}

- (void)linkPeerIsAsleep:(id)a3 isAsleep:(BOOL)a4
{
  _BOOL8 v4;
  NSObject *v6;
  NSMutableDictionary *conductors;
  NSMutableDictionary *v8;
  void *v9;
  id v10;
  const char *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  int IsLevelEnabled;
  void *v20;
  id v21;

  v4 = a4;
  v21 = a3;
  v6 = sub_10014CFBC();
  dispatch_assert_queue_V2(v6);

  if (v21)
  {
    if (self)
      conductors = self->_conductors;
    else
      conductors = 0;
    v8 = conductors;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "nrUUID"));
    v10 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", v9));

    if (v10)
    {
      objc_msgSend(v10, "linkPeerIsAsleep:isAsleep:", v21, v4);
    }
    else
    {
      if (v4)
        v11 = "";
      else
        v11 = " not";
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "nrUUID"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "UUIDString"));
      sub_1000A25C4((uint64_t)self, 1014, CFSTR("peer%s asleep %@ %@"), v13, v14, v15, v16, v17, (uint64_t)v11);

      v10 = 0;
    }
  }
  else
  {
    v18 = sub_1000A2640();
    IsLevelEnabled = _NRLogIsLevelEnabled(v18, 17);

    if (!IsLevelEnabled)
      goto LABEL_11;
    v10 = sub_1000A2640();
    _NRLogWithArgs(v10, 17, "%s called with null link", "-[NRLinkDirector linkPeerIsAsleep:isAsleep:]");
  }

LABEL_11:
}

- (void)pipeDidConnectForNRUUID:(BOOL)a3 nrUUID:(id)a4
{
  _BOOL8 v4;
  NSObject *v6;
  NSMutableDictionary *conductors;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;

  v4 = a3;
  v17 = a4;
  v6 = sub_10014CFBC();
  dispatch_assert_queue_V2(v6);

  if (self)
    conductors = self->_conductors;
  else
    conductors = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](conductors, "objectForKeyedSubscript:", v17));
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "pipeDidConnectForNRUUID:nrUUID:", v4, v17);
  }
  else
  {
    if (v4)
      v10 = "";
    else
      v10 = " not";
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "UUIDString"));
    sub_1000A25C4((uint64_t)self, 1014, CFSTR("peer%s nearby %@"), v11, v12, v13, v14, v15, (uint64_t)v10);

  }
}

- (void)peerDidUnpairBluetooth:(BOOL)a3 nrUUID:(id)a4
{
  _BOOL8 v4;
  NSObject *v6;
  NSMutableDictionary *conductors;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;

  v4 = a3;
  v17 = a4;
  v6 = sub_10014CFBC();
  dispatch_assert_queue_V2(v6);

  if (self)
    conductors = self->_conductors;
  else
    conductors = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](conductors, "objectForKeyedSubscript:", v17));
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "peerDidUnpairBluetooth:nrUUID:", v4, v17);
  }
  else
  {
    if (v4)
      v10 = "";
    else
      v10 = "not ";
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "UUIDString"));
    sub_1000A25C4((uint64_t)self, 1014, CFSTR("peer did%s unregister %@"), v11, v12, v13, v14, v15, (uint64_t)v10);

  }
}

- (void)deviceHasPhoneCallRelayRequest:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  NRLinkManagerBluetooth *bluetoothManager;
  NSObject *v7;
  NRLinkManagerBluetooth *v8;
  NSObject *v9;
  NSMutableDictionary *conductors;
  NSMutableDictionary *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v3 = a3;
  v5 = sub_10014CFBC();
  dispatch_assert_queue_V2(v5);

  if (v3)
  {
    if (self)
    {
      bluetoothManager = self->_bluetoothManager;
      if (bluetoothManager)
      {
        v7 = bluetoothManager->super._queue;
        dispatch_assert_queue_V2(v7);

        if (bluetoothManager->_pipeManager)
        {
          bluetoothManager->_pipeRegistrationForIsochronous.flags |= 4u;
          bluetoothManager->_p2pPipeRegistrationForIsochronous.flags |= 4u;
          sub_10002BE24((uint64_t)bluetoothManager, 3, 0);
          sub_10002BE24((uint64_t)bluetoothManager, 3, 1);
        }
      }
LABEL_10:
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      conductors = self->_conductors;
      goto LABEL_11;
    }
  }
  else if (self)
  {
    v8 = self->_bluetoothManager;
    if (v8)
    {
      v9 = v8->super._queue;
      dispatch_assert_queue_V2(v9);

      if (v8->_pipeManager)
      {
        v8->_pipeRegistrationForIsochronous.flags &= ~4u;
        v8->_p2pPipeRegistrationForIsochronous.flags &= ~4u;
        sub_10002A358((uint64_t)v8, 3, 0);
        sub_10002A358((uint64_t)v8, 3, 1);
      }
    }
    goto LABEL_10;
  }
  conductors = 0;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
LABEL_11:
  v11 = conductors;
  v12 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    if (self)
    {
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(v11);
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_conductors, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v15), (_QWORD)v19));
          objc_msgSend(v16, "deviceHasPhoneCallRelayRequest:", v3);

          v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        v13 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v13);
    }
    else
    {
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(v11);
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(0, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v17), (_QWORD)v19));
          objc_msgSend(v18, "deviceHasPhoneCallRelayRequest:", v3);

          v17 = (char *)v17 + 1;
        }
        while (v13 != v17);
        v13 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v13);
    }
  }

}

- (void)apsIsConnected:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  NSMutableDictionary *conductors;
  NSMutableDictionary *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = a3;
  v5 = sub_10014CFBC();
  dispatch_assert_queue_V2(v5);

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  if (self)
    conductors = self->_conductors;
  else
    conductors = 0;
  v7 = conductors;
  v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    if (self)
    {
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_conductors, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v11), (_QWORD)v15));
          objc_msgSend(v12, "apsIsConnected:", v3);

          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }
    else
    {
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(0, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v13), (_QWORD)v15));
          objc_msgSend(v14, "apsIsConnected:", v3);

          v13 = (char *)v13 + 1;
        }
        while (v9 != v13);
        v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }
  }

}

- (BOOL)preferWiFiRequestAvailable
{
  NSObject *v3;
  NSMutableDictionary *conductors;
  NSMutableDictionary *v5;
  id v6;
  id v7;
  uint64_t v8;
  char v9;
  void *i;
  void *v11;
  unsigned __int8 v12;
  void *j;
  void *v15;
  unsigned __int8 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v3 = sub_10014CFBC();
  dispatch_assert_queue_V2(v3);

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  if (self)
    conductors = self->_conductors;
  else
    conductors = 0;
  v5 = conductors;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    v9 = 1;
    if (self)
    {
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(v5);
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_conductors, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i), (_QWORD)v17));
          v12 = objc_msgSend(v11, "preferWiFiRequestAvailable");

          v9 &= v12;
        }
        v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v7);
    }
    else
    {
      do
      {
        for (j = 0; j != v7; j = (char *)j + 1)
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(v5);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(0, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)j), (_QWORD)v17));
          v16 = objc_msgSend(v15, "preferWiFiRequestAvailable");

          v9 &= v16;
        }
        v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v7);
    }
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (BOOL)preferWiFiRequestUnavailable
{
  NSObject *v3;
  NSMutableDictionary *conductors;
  NSMutableDictionary *v5;
  id v6;
  id v7;
  uint64_t v8;
  char v9;
  void *i;
  void *v11;
  unsigned __int8 v12;
  void *j;
  void *v15;
  unsigned __int8 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v3 = sub_10014CFBC();
  dispatch_assert_queue_V2(v3);

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  if (self)
    conductors = self->_conductors;
  else
    conductors = 0;
  v5 = conductors;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    v9 = 1;
    if (self)
    {
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(v5);
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_conductors, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i), (_QWORD)v17));
          v12 = objc_msgSend(v11, "preferWiFiRequestUnavailable");

          v9 &= v12;
        }
        v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v7);
    }
    else
    {
      do
      {
        for (j = 0; j != v7; j = (char *)j + 1)
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(v5);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(0, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)j), (_QWORD)v17));
          v16 = objc_msgSend(v15, "preferWiFiRequestUnavailable");

          v9 &= v16;
        }
        v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v7);
    }
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (BOOL)preferWiFiP2PRequestUpdated
{
  NSObject *v3;
  NSMutableDictionary *conductors;
  NSMutableDictionary *v5;
  id v6;
  id v7;
  uint64_t v8;
  char v9;
  void *i;
  void *v11;
  unsigned __int8 v12;
  void *j;
  void *v15;
  unsigned __int8 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v3 = sub_10014CFBC();
  dispatch_assert_queue_V2(v3);

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  if (self)
    conductors = self->_conductors;
  else
    conductors = 0;
  v5 = conductors;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    v9 = 1;
    if (self)
    {
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(v5);
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_conductors, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i), (_QWORD)v17));
          v12 = objc_msgSend(v11, "preferWiFiP2PRequestUpdated");

          v9 &= v12;
        }
        v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v7);
    }
    else
    {
      do
      {
        for (j = 0; j != v7; j = (char *)j + 1)
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(v5);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(0, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)j), (_QWORD)v17));
          v16 = objc_msgSend(v15, "preferWiFiP2PRequestUpdated");

          v9 &= v16;
        }
        v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v7);
    }
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (void)directToCloudRequestAvailable
{
  NSMutableDictionary *conductors;
  NSMutableDictionary *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *j;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  if (self)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    conductors = self->_conductors;
  }
  else
  {
    dispatch_assert_queue_V2(0);
    conductors = 0;
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
  }
  v4 = conductors;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    if (self)
    {
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_conductors, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), (_QWORD)v12));
          objc_msgSend(v9, "directToCloudRequestAvailable");

        }
        v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);
    }
    else
    {
      do
      {
        for (j = 0; j != v6; j = (char *)j + 1)
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(0, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)j), (_QWORD)v12));
          objc_msgSend(v11, "directToCloudRequestAvailable");

        }
        v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);
    }
  }

}

- (void)directToCloudRequestUnavailable
{
  NSMutableDictionary *conductors;
  NSMutableDictionary *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *j;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  if (self)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    conductors = self->_conductors;
  }
  else
  {
    dispatch_assert_queue_V2(0);
    conductors = 0;
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
  }
  v4 = conductors;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    if (self)
    {
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_conductors, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), (_QWORD)v12));
          objc_msgSend(v9, "directToCloudRequestUnavailable");

        }
        v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);
    }
    else
    {
      do
      {
        for (j = 0; j != v6; j = (char *)j + 1)
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(0, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)j), (_QWORD)v12));
          objc_msgSend(v11, "directToCloudRequestUnavailable");

        }
        v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);
    }
  }

}

- (void)localAWDLEndpointChanged:(id)a3
{
  id v4;
  NSMutableDictionary *conductors;
  NSMutableDictionary *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  if (self)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    conductors = self->_conductors;
  }
  else
  {
    dispatch_assert_queue_V2(0);
    conductors = 0;
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
  }
  v6 = conductors;
  v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    if (self)
    {
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_conductors, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v10), (_QWORD)v14));
          objc_msgSend(v11, "localAWDLEndpointChanged:", v4);

          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }
    else
    {
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(0, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v12), (_QWORD)v14));
          objc_msgSend(v13, "localAWDLEndpointChanged:", v4);

          v12 = (char *)v12 + 1;
        }
        while (v8 != v12);
        v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }
  }

}

- (BOOL)perpetualStandaloneMeadowEnabledForNRUUID:(id)a3
{
  id v4;
  NSMutableDictionary *conductors;
  _BYTE *v6;
  BOOL v7;

  v4 = a3;
  if (_NRIsAppleInternal(v4))
  {
    if (self)
      conductors = self->_conductors;
    else
      conductors = 0;
    v6 = (_BYTE *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](conductors, "objectForKeyedSubscript:", v4));
    if (v6)
      v7 = v6[11] & 1;
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsDeviceIDCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_appVPNAppUUIDs, 0);
  objc_storeStrong((id *)&self->_appVPNAgentUUID, 0);
  objc_storeStrong((id *)&self->_appVPNEvaluator, 0);
  objc_storeStrong((id *)&self->_perpetualStandaloneMeadowCellObserver, 0);
  objc_storeStrong((id *)&self->_perpetualStandaloneMeadowWiFiObserver, 0);
  objc_storeStrong((id *)&self->_fdUsageMonitorSource, 0);
  objc_storeStrong((id *)&self->_xpcCommExecUUID, 0);
  objc_storeStrong((id *)&self->_wifiManagerAvailableBlocks, 0);
  objc_storeStrong((id *)&self->_ephemeralDeviceConnections, 0);
  objc_storeStrong((id *)&self->_orphanedDevicePreferencesConnections, 0);
  objc_storeStrong((id *)&self->_orphanedDeviceMonitorConnections, 0);
  objc_storeStrong((id *)&self->_conductors, 0);
  objc_storeStrong((id *)&self->_phoneCallRelayAgent, 0);
  objc_storeStrong((id *)&self->_testServer, 0);
  objc_storeStrong((id *)&self->_onDemandLinkSetupManager, 0);
  objc_storeStrong((id *)&self->_fixedInterfaceManager, 0);
  objc_storeStrong((id *)&self->_shoesProxyAnalytics, 0);
  objc_storeStrong((id *)&self->_shoesProxyAnalyticsTimerSource, 0);
  objc_storeStrong((id *)&self->_masqueProxyTokenCache, 0);
  objc_storeStrong((id *)&self->_masqueServer, 0);
  objc_storeStrong((id *)&self->_socksServer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_tlsIdentityMASQUEProxyServer, 0);
  objc_storeStrong((id *)&self->_spkiMASQUEProxyServer, 0);
  objc_storeStrong((id *)&self->_preferWiFiAgent, 0);
  objc_storeStrong((id *)&self->_fixedInterfacePeerIDSDeviceID, 0);
  objc_storeStrong((id *)&self->_fixedInterfacePeerAddressStr, 0);
  objc_storeStrong((id *)&self->_fixedInterfaceName, 0);
  objc_storeStrong((id *)&self->_wiredManager, 0);
  objc_storeStrong((id *)&self->_quickRelayManager, 0);
  objc_storeStrong((id *)&self->_wifiManager, 0);
  objc_storeStrong((id *)&self->_bluetoothManager, 0);
}

@end
