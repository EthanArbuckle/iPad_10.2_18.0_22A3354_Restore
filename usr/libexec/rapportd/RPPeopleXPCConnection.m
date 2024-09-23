@implementation RPPeopleXPCConnection

- (RPPeopleXPCConnection)initWithDaemon:(id)a3 xpcCnx:(id)a4
{
  id v7;
  id v8;
  RPPeopleXPCConnection *v9;
  RPPeopleXPCConnection *v10;
  RPPeopleXPCConnection *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)RPPeopleXPCConnection;
  v9 = -[RPPeopleXPCConnection init](&v13, "init");
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
  RPPeopleDiscovery *activatedDiscovery;
  NSXPCConnection *xpcCnx;
  RPPeopleDiscovery *v5;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100131788 <= 20 && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 20)))
    LogPrintF(&dword_100131788, "-[RPPeopleXPCConnection connectionInvalidated]", 20, "XPC connection invalidated from %#{pid}\n", -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"));
  v5 = self->_activatedDiscovery;
  if (v5)
    -[NSMutableSet removeObject:](self->_daemon->_discoveryClients, "removeObject:", v5);
  -[RPPeopleDiscovery invalidate](self->_activatedDiscovery, "invalidate");
  activatedDiscovery = self->_activatedDiscovery;
  self->_activatedDiscovery = 0;

  xpcCnx = self->_xpcCnx;
  self->_xpcCnx = 0;

}

- (BOOL)_entitledAndReturnError:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  unsigned __int8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection cuValueForEntitlementNoCache:](self->_xpcCnx, "cuValueForEntitlementNoCache:", v6));
  v8 = objc_msgSend(v7, "isEqual:", &__kCFBooleanTrue);

  if ((v8 & 1) == 0)
  {
    if (dword_100131788 <= 90
      && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 90)))
    {
      LogPrintF(&dword_100131788, "-[RPPeopleXPCConnection _entitledAndReturnError:error:]", 90, "### %#{pid} missing entitlement '%@'\n", -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"), v6);
    }
    if (a4)
    {
      v15 = RPErrorF(4294896128, (uint64_t)"Missing entitlement '%@'", v9, v10, v11, v12, v13, v14, (uint64_t)v6);
      *a4 = (id)objc_claimAutoreleasedReturnValue(v15);
    }
  }

  return v8;
}

- (void)clientDeviceFound:(id)a3 report:(BOOL)a4
{
  _BOOL4 v4;
  RPPeopleDiscovery *v6;
  unsigned int v7;
  char v8;
  void *v9;
  void *v10;
  __CFString *v11;
  NSMutableDictionary *discoveredDevices;
  NSMutableDictionary *v13;
  NSMutableDictionary *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;
  NSMutableDictionary *discoveredPeople;
  NSMutableDictionary *v22;
  NSMutableDictionary *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;

  v4 = a4;
  v27 = a3;
  v6 = self->_activatedDiscovery;
  if (v6)
  {
    v7 = objc_msgSend(v27, "flags");
    if ((self->_discoveryDeviceFlags & v7) != 0)
    {
      v8 = v7;
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "identifier"));
      if (!v9)
      {
LABEL_35:

        goto LABEL_36;
      }
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_discoveredDevices, "objectForKeyedSubscript:", v9));
      if (v10)
      {
        if ((v8 & 1) == 0)
          goto LABEL_6;
      }
      else
      {
        discoveredDevices = self->_discoveredDevices;
        if (!discoveredDevices)
        {
          v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          v14 = self->_discoveredDevices;
          self->_discoveredDevices = v13;

          discoveredDevices = self->_discoveredDevices;
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](discoveredDevices, "setObject:forKeyedSubscript:", v27, v9);
        if ((v8 & 1) == 0)
        {
LABEL_6:
          v11 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "accountID"));
          if (!v11)
          {
            if ((self->_discoveryDeviceFlags & 0x1000) == 0)
            {
              if (dword_100131788 <= 60
                && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 60)))
              {
                LogPrintF(&dword_100131788, "-[RPPeopleXPCConnection clientDeviceFound:report:]", 60, "### Device found without accountID: %@\n", v27);
              }
              goto LABEL_34;
            }
            v11 = v9;
          }
LABEL_15:
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_discoveredPeople, "objectForKeyedSubscript:", v11));
          v16 = v15;
          if (v15)
          {
            v17 = objc_msgSend(v15, "updateWithRPDevice:", v27);
            if ((-[RPPeopleDiscovery changeFlags](self->_activatedDiscovery, "changeFlags") & v17) == 0)
              goto LABEL_33;
            if (dword_100131788 <= 30
              && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
            {
              v18 = CUDescriptionWithLevel(v16, 30);
              v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
              LogPrintF(&dword_100131788, "-[RPPeopleXPCConnection clientDeviceFound:report:]", 30, "Person changed: %@, %#{flags}\n", v19, v17, &unk_10010B2B4);

            }
            if (!v4)
              goto LABEL_33;
            v20 = (id)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy"));
            objc_msgSend(v20, "xpcPersonChanged:changes:", v16, v17);
          }
          else
          {
            v20 = objc_alloc_init((Class)RPPerson);
            objc_msgSend(v20, "setIdentifier:", v11);
            objc_msgSend(v20, "updateWithRPDevice:", v27);
            discoveredPeople = self->_discoveredPeople;
            if (!discoveredPeople)
            {
              v22 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
              v23 = self->_discoveredPeople;
              self->_discoveredPeople = v22;

              discoveredPeople = self->_discoveredPeople;
            }
            -[NSMutableDictionary setObject:forKeyedSubscript:](discoveredPeople, "setObject:forKeyedSubscript:", v20, v11);
            if (dword_100131788 <= 30
              && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
            {
              v24 = CUDescriptionWithLevel(v20, 30);
              v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
              LogPrintF(&dword_100131788, "-[RPPeopleXPCConnection clientDeviceFound:report:]", 30, "Person found: %@\n", v25);

            }
            if (v4)
            {
              v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy"));
              objc_msgSend(v26, "xpcPersonFound:", v20);

            }
          }

LABEL_33:
LABEL_34:

          goto LABEL_35;
        }
      }
      v11 = CFSTR("$icloud");
      goto LABEL_15;
    }
  }
LABEL_36:

}

- (void)clientDeviceLost:(id)a3
{
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "identifier"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_discoveredDevices, "objectForKeyedSubscript:", v4));
    if (!v5)
    {
LABEL_31:

      goto LABEL_32;
    }
    if ((objc_msgSend(v17, "flags") & 1) != 0)
    {
      v6 = CFSTR("$icloud");
    }
    else
    {
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "accountID"));
      if (!v6)
      {
        if ((self->_discoveryDeviceFlags & 0x1000) == 0)
        {
          if (dword_100131788 <= 60
            && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 60)))
          {
            LogPrintF(&dword_100131788, "-[RPPeopleXPCConnection clientDeviceLost:]", 60, "### Device lost without accountID: %@\n", v17);
          }
          goto LABEL_31;
        }
        v6 = v4;
      }
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_discoveredPeople, "objectForKeyedSubscript:", v6));
    v8 = v7;
    if (!v7)
    {
      if (dword_100131788 <= 60
        && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 60)))
      {
        LogPrintF(&dword_100131788, "-[RPPeopleXPCConnection clientDeviceLost:]", 60, "### Device lost without person: %@\n", v17);
      }
      goto LABEL_30;
    }
    v9 = objc_msgSend(v7, "removeRPDevice:", v17);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "devices"));
    v11 = objc_msgSend(v10, "count");

    if (v11)
    {
      if ((-[RPPeopleDiscovery changeFlags](self->_activatedDiscovery, "changeFlags") & v9) == 0)
      {
LABEL_30:

        goto LABEL_31;
      }
      if (dword_100131788 <= 30
        && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
      {
        v12 = CUDescriptionWithLevel(v8, 30);
        v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        LogPrintF(&dword_100131788, "-[RPPeopleXPCConnection clientDeviceLost:]", 30, "Person changed: %@, %#{flags}\n", v13, v9, &unk_10010B2B4);

      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy"));
      objc_msgSend(v16, "xpcPersonChanged:changes:", v8, v9);
    }
    else
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_discoveredPeople, "setObject:forKeyedSubscript:", 0, v6);
      if (dword_100131788 <= 30
        && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
      {
        v14 = CUDescriptionWithLevel(v8, 30);
        v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        LogPrintF(&dword_100131788, "-[RPPeopleXPCConnection clientDeviceLost:]", 30, "Person lost: %@, %#{flags}\n", v15, v9, &unk_10010B2B4);

      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy"));
      objc_msgSend(v16, "xpcPersonLost:", v8);
    }

    goto LABEL_30;
  }
LABEL_32:

}

- (void)clientDeviceChanged:(id)a3 changes:(unsigned int)a4
{
  __int16 v4;
  void *v6;
  void *v7;
  unsigned int v8;
  __CFString *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;

  v4 = a4;
  v16 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "identifier"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_discoveredDevices, "objectForKeyedSubscript:", v6));
    if (v7)
    {
      v8 = objc_msgSend(v16, "flags");
      if ((v8 & 1) != 0)
      {
        v9 = CFSTR("$icloud");
      }
      else
      {
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "accountID"));
        if (!v9)
        {
          if ((self->_discoveryDeviceFlags & 0x1000) == 0)
          {
            if (dword_100131788 <= 60
              && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 60)))
            {
              LogPrintF(&dword_100131788, "-[RPPeopleXPCConnection clientDeviceChanged:changes:]", 60, "### Device changed without accountID: %@\n", v16);
            }
            goto LABEL_23;
          }
          v9 = v6;
        }
      }
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_discoveredPeople, "objectForKeyedSubscript:", v9));
      v11 = v10;
      if (v10)
      {
        if ((self->_discoveryDeviceFlags & v8) != 0)
        {
          v12 = objc_msgSend(v10, "updateWithRPDevice:", v16) | ((v4 & 0x25B) != 0);
          if ((-[RPPeopleDiscovery changeFlags](self->_activatedDiscovery, "changeFlags") & v12) != 0)
          {
            if (dword_100131788 <= 30
              && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
            {
              v13 = CUDescriptionWithLevel(v11, 30);
              v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
              LogPrintF(&dword_100131788, "-[RPPeopleXPCConnection clientDeviceChanged:changes:]", 30, "Person changed: %@, %#{flags}\n", v14, v12, &unk_10010B2B4);

            }
            v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy"));
            objc_msgSend(v15, "xpcPersonChanged:changes:", v11, v12);

          }
        }
        else
        {
          -[RPPeopleXPCConnection clientDeviceLost:](self, "clientDeviceLost:", v16);
        }
      }
      else
      {
        -[RPPeopleXPCConnection clientDeviceFound:report:](self, "clientDeviceFound:report:", v16, 1);
      }

      goto LABEL_23;
    }
    -[RPPeopleXPCConnection clientDeviceFound:report:](self, "clientDeviceFound:report:", v16, 1);
LABEL_23:

  }
}

- (void)clientDevice:(id)a3 updatedMeasurement:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_discoveredDevices, "objectForKeyedSubscript:", v7));
    if (v8)
    {
      if ((objc_msgSend(v12, "flags") & 1) != 0)
      {
        v9 = CFSTR("$icloud");
      }
      else
      {
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "accountID"));
        if (!v9)
          goto LABEL_10;
      }
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_discoveredPeople, "objectForKeyedSubscript:", v9));
      if (v10)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy"));
        objc_msgSend(v11, "xpcPersonID:deviceID:updatedMeasurement:", v9, v7, v6);

      }
    }
LABEL_10:

  }
}

- (void)clientPeopleStatusChanged:(unsigned int)a3
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)&a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy"));
  objc_msgSend(v4, "xpcPeopleStatusChanged:", v3);

}

- (void)xpcPeopleAddAppleID:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  id v8;
  BOOL v9;
  RPCloudMessageContext *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  if (self->_entitledFriendAccount)
  {
    v8 = 0;
    goto LABEL_4;
  }
  v14 = 0;
  v9 = -[RPPeopleXPCConnection _entitledAndReturnError:error:](self, "_entitledAndReturnError:error:", CFSTR("com.apple.rapport.FriendAccount"), &v14);
  v8 = v14;
  self->_entitledFriendAccount = v9;
  if (v9)
  {
LABEL_4:
    dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
    if (dword_100131788 <= 40
      && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 40)))
    {
      LogPrintF(&dword_100131788, "-[RPPeopleXPCConnection xpcPeopleAddAppleID:completion:]", 40, "AddAppleID: '%{mask}'\n", v6);
    }
    -[RPPeopleDaemon _updateFriendIdentityWithAppleID:contactID:sendersKnownAlias:userAdded:updateDateRequested:suggestedContactIDs:](self->_daemon, "_updateFriendIdentityWithAppleID:contactID:sendersKnownAlias:userAdded:updateDateRequested:suggestedContactIDs:", v6, 0, 0, 1, 0, 0);
    if (dword_100131788 <= 30
      && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
    {
      LogPrintF(&dword_100131788, "-[RPPeopleXPCConnection xpcPeopleAddAppleID:completion:]", 30, "Friend identity has been manually added. Sending friend request immediately.");
    }
    v10 = objc_alloc_init(RPCloudMessageContext);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_daemon->_friendAccountIdentityMap, "objectForKeyedSubscript:", v6));
    v12 = v11;
    if (v11)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "sendersKnownAlias"));
      -[RPCloudMessageContext setSendersKnownAlias:](v10, "setSendersKnownAlias:", v13);

    }
    -[RPPeopleDaemon _sendCloudIdentityFrameType:destinationID:flags:msgCtx:](self->_daemon, "_sendCloudIdentityFrameType:destinationID:flags:msgCtx:", 64, v6, 1, v10);
    if (v7)
      v7[2](v7, 0);

    goto LABEL_19;
  }
  if (v7)
    ((void (**)(id, id))v7)[2](v7, v8);
LABEL_19:

}

- (void)xpcPeopleRemoveAppleID:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, id);
  id v8;
  BOOL v9;
  uint64_t v10;
  BOOL v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  void (**v33)(id, id);
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  id v38;
  _BYTE v39[128];

  v6 = a3;
  v7 = (void (**)(id, id))a4;
  if (self->_entitledFriendAccount)
  {
    v8 = 0;
    goto LABEL_4;
  }
  v38 = 0;
  v9 = -[RPPeopleXPCConnection _entitledAndReturnError:error:](self, "_entitledAndReturnError:error:", CFSTR("com.apple.rapport.FriendAccount"), &v38);
  v8 = v38;
  self->_entitledFriendAccount = v9;
  if (v9)
  {
LABEL_4:
    if (dword_100131788 <= 40
      && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 40)))
    {
      LogPrintF(&dword_100131788, "-[RPPeopleXPCConnection xpcPeopleRemoveAppleID:completion:]", 40, "RemoveAppleID: '%{mask}'\n", v6);
    }
    v10 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_daemon->_friendAccountIdentityMap, "objectForKeyedSubscript:", v6));
    v11 = v10 != 0;
    if (v10)
    {
      if (dword_100131788 <= 40
        && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 40)))
      {
        LogPrintF(&dword_100131788, "-[RPPeopleXPCConnection xpcPeopleRemoveAppleID:completion:]", 40, "RemoveAppleID account: %@\n", v10);
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_daemon->_friendAccountIdentityMap, "setObject:forKeyedSubscript:", 0, v6);
      self->_daemon->_needsFriendAccountUpdate = 1;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
      objc_msgSend(v12, "removeIdentity:error:", v10, 0);

    }
    v31 = (void *)v10;
    v32 = v8;
    v33 = v7;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_daemon->_friendDeviceIdentityMap, "allKeys"));
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(_QWORD *)v35 != v16)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_daemon->_friendDeviceIdentityMap, "objectForKeyedSubscript:", v18));
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "accountID"));
          if (objc_msgSend(v20, "isEqual:", v6))
          {
            if (dword_100131788 <= 40
              && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 40)))
            {
              LogPrintF(&dword_100131788, "-[RPPeopleXPCConnection xpcPeopleRemoveAppleID:completion:]", 40, "RemoveAppleID device: %@\n", v19);
            }
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_daemon->_friendDeviceIdentityMap, "setObject:forKeyedSubscript:", 0, v18);
            v21 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
            objc_msgSend(v21, "removeIdentity:error:", v19, 0);

            v11 = 1;
          }

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v15);
    }

    v8 = v32;
    v7 = v33;
    if (v33)
    {
      if (v11)
      {
        v33[2](v33, 0);
      }
      else
      {
        v28 = RPErrorF(4294960569, (uint64_t)"No account or device found to remove", v22, v23, v24, v25, v26, v27, v30);
        v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
        v33[2](v33, v29);

      }
    }

    goto LABEL_34;
  }
  if (v7)
    v7[2](v7, v8);
LABEL_34:

}

- (void)xpcPeopleDiscoveryActivate:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, void *, _QWORD);
  id v9;
  BOOL v10;
  unsigned int v11;
  int v12;
  unsigned int v13;
  NSMutableSet *discoveryClients;
  NSMutableSet *v15;
  RPPeopleDaemon *daemon;
  NSMutableSet *v17;
  NSMutableDictionary *discoveredDevices;
  uint64_t v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  id v23;

  v7 = a3;
  v8 = (void (**)(id, void *, _QWORD))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_entitledPeople)
  {
    v9 = 0;
    goto LABEL_4;
  }
  v23 = 0;
  v10 = -[RPPeopleXPCConnection _entitledAndReturnError:error:](self, "_entitledAndReturnError:error:", CFSTR("com.apple.rapport.people"), &v23);
  v9 = v23;
  self->_entitledPeople = v10;
  if (v10)
  {
LABEL_4:
    if (self->_activatedDiscovery)
    {
      if (dword_100131788 <= 30
        && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
      {
        LogPrintF(&dword_100131788, "-[RPPeopleXPCConnection xpcPeopleDiscoveryActivate:completion:]", 30, "RPPeopleDiscovery activate when already activated\n");
      }
      if (v8)
        v8[2](v8, &__NSArray0__struct, 0);
      goto LABEL_31;
    }
    v11 = objc_msgSend(v7, "discoveryMode");
    if (v11 == 200)
    {
      v12 = 2;
    }
    else
    {
      if (v11 != 400)
        goto LABEL_15;
      v12 = 16;
    }
    objc_msgSend(v7, "setDiscoveryFlags:", objc_msgSend(v7, "discoveryFlags") | v12);
LABEL_15:
    if (dword_100131788 <= 30
      && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
    {
      LogPrintF(&dword_100131788, "-[RPPeopleXPCConnection xpcPeopleDiscoveryActivate:completion:]", 30, "RPPeopleDiscovery activate from %#{pid}, %@\n", -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"), v7);
    }
    objc_msgSend(v7, "setDispatchQueue:", self->_dispatchQueue);
    v13 = objc_msgSend(v7, "discoveryFlags");
    self->_discoveryDeviceFlags = (v13 >> 1) & 0x10 | v13 & 0xA | (v13 >> 2) & 4 | (v13 >> 1) & 0x20 | (v13 >> 2) & 1 | (v13 >> 1) & 0xC0 | (((v13 >> 10) & 1) << 12);
    objc_storeStrong((id *)&self->_activatedDiscovery, a3);
    discoveryClients = self->_daemon->_discoveryClients;
    if (!discoveryClients)
    {
      v15 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      daemon = self->_daemon;
      v17 = daemon->_discoveryClients;
      daemon->_discoveryClients = v15;

      discoveryClients = self->_daemon->_discoveryClients;
    }
    -[NSMutableSet addObject:](discoveryClients, "addObject:", v7);
    discoveredDevices = self->_daemon->_discoveredDevices;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100093A7C;
    v22[3] = &unk_100114618;
    v22[4] = self;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](discoveredDevices, "enumerateKeysAndObjectsUsingBlock:", v22);
    if (v8)
    {
      v19 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_discoveredPeople, "allValues"));
      v20 = (void *)v19;
      if (v19)
        v21 = (void *)v19;
      else
        v21 = &__NSArray0__struct;
      v8[2](v8, v21, 0);

    }
    -[RPPeopleDaemon _update](self->_daemon, "_update");
    goto LABEL_31;
  }
  if (v8)
    ((void (**)(id, void *, id))v8)[2](v8, 0, v9);
LABEL_31:

}

- (void)xpcPeopleDiscoveryUpdate:(id)a3
{
  unsigned int v4;
  int v5;
  id v6;
  id v7;
  unsigned int v8;
  id v9;

  v9 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_activatedDiscovery)
  {
    if (dword_100131788 <= 90
      && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 90)))
    {
      LogPrintF(&dword_100131788, "-[RPPeopleXPCConnection xpcPeopleDiscoveryUpdate:]", 90, "### RPPeopleDiscovery update when not in use\n");
    }
    goto LABEL_23;
  }
  v4 = objc_msgSend(v9, "discoveryMode");
  if (v4 == 200)
  {
    v5 = 2;
    goto LABEL_9;
  }
  if (v4 == 400)
  {
    v5 = 16;
LABEL_9:
    objc_msgSend(v9, "setDiscoveryFlags:", objc_msgSend(v9, "discoveryFlags") | v5);
  }
  v6 = -[RPPeopleDiscovery discoveryFlags](self->_activatedDiscovery, "discoveryFlags");
  v7 = objc_msgSend(v9, "discoveryFlags");
  if ((_DWORD)v7 != (_DWORD)v6)
  {
    if (dword_100131788 <= 30
      && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
    {
      LogPrintF(&dword_100131788, "-[RPPeopleXPCConnection xpcPeopleDiscoveryUpdate:]", 30, "RPPeopleDiscovery discoveryFlags changed: %#{flags} -> %#{flags}\n", v6, &unk_10010B2DE, v7, &unk_10010B2DE);
    }
    -[RPPeopleDiscovery setDiscoveryFlags:](self->_activatedDiscovery, "setDiscoveryFlags:", v7);
  }
  v8 = (v7 >> 1) & 0x10 | v7 & 0xA | (v7 >> 2) & 4 | (v7 >> 1) & 0x20 | (v7 >> 2) & 1 | (v7 >> 1) & 0xC0 | (((v7 >> 10) & 1) << 12);
  if (v8 == self->_discoveryDeviceFlags)
  {
    if ((_DWORD)v7 == (_DWORD)v6)
      goto LABEL_23;
  }
  else
  {
    self->_discoveryDeviceFlags = v8;
  }
  -[RPPeopleDaemon _update](self->_daemon, "_update");
LABEL_23:

}

- (RPPeopleDiscovery)activatedDiscovery
{
  return self->_activatedDiscovery;
}

- (RPPeopleDaemon)daemon
{
  return self->_daemon;
}

- (BOOL)entitledFriendAccount
{
  return self->_entitledFriendAccount;
}

- (BOOL)entitledPeople
{
  return self->_entitledPeople;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_daemon, 0);
  objc_storeStrong((id *)&self->_activatedDiscovery, 0);
  objc_storeStrong((id *)&self->_discoveredPeople, 0);
  objc_storeStrong((id *)&self->_discoveredDevices, 0);
}

@end
