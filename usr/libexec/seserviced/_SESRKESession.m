@implementation _SESRKESession

- (_SESRKESession)initWithRemoteObject:(id)a3 subscriptionRange:(_NSRange)a4 queue:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  _SESRKESession *v7;
  _SESRKESession *v8;
  NSSet *allowlistedVehicleIdentifiers;
  NSUUID *currentPeerUUID;
  uint64_t v11;
  NSString *sessionID;
  objc_super v14;

  length = a4.length;
  location = a4.location;
  v14.receiver = self;
  v14.super_class = (Class)_SESRKESession;
  v7 = -[_SESSession initWithRemoteObject:queue:](&v14, "initWithRemoteObject:queue:", a3, a5);
  v8 = v7;
  if (v7)
  {
    v7->_subscriptionRange.location = location;
    v7->_subscriptionRange.length = length;
    allowlistedVehicleIdentifiers = v7->_allowlistedVehicleIdentifiers;
    v7->_allowlistedVehicleIdentifiers = 0;

    currentPeerUUID = v8->_currentPeerUUID;
    v8->_currentPeerUUID = 0;

    v11 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v8));
    sessionID = v8->_sessionID;
    v8->_sessionID = (NSString *)v11;

  }
  return v8;
}

+ (id)validateEntitlements:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_SESSessionClientInfo withConnection:](_SESSessionClientInfo, "withConnection:", a3));
  v4 = objc_msgSend(v3, "rkeSessionEntitlement");
  if ((v4 & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    v7 = SESDefaultLogObject(v4, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = SESErrorDomain;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "clientName"));
    v10 = SESCreateAndLogError(0, v8, v9, 5, CFSTR("Client %@ missing entitlement %@"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v10);

  }
  return v6;
}

- (void)setDidEndCallback:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_SESRKESession;
  -[_SESSession setDidEndCallback:](&v3, "setDidEndCallback:", a3);
}

- (void)releaseRemoteObject
{
  NSObject *v3;
  objc_super v4;

  v3 = objc_claimAutoreleasedReturnValue(-[_SESSession queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  v4.receiver = self;
  v4.super_class = (Class)_SESRKESession;
  -[_SESSession releaseRemoteObject](&v4, "releaseRemoteObject");
}

- (void)start
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  NSSet *allowlistedVehicleIdentifiers;
  NSSet *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  _SESRKESession *v33;

  v3 = objc_claimAutoreleasedReturnValue(-[_SESSession queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  v6 = SESDefaultLogObject(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v33 = self;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "SESRKESession start %@", buf, 0xCu);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[_SESRKESession updateAllowlistedVehicles](self, "updateAllowlistedVehicles"));
  if (v9)
  {
    -[_SESRKESession endSessionInternal:](self, "endSessionInternal:", v9);
  }
  else
  {
    v10 = SESDefaultLogObject(0, v8);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      allowlistedVehicleIdentifiers = self->_allowlistedVehicleIdentifiers;
      *(_DWORD *)buf = 138412290;
      v33 = (_SESRKESession *)allowlistedVehicleIdentifiers;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Allowed vehicle identifiers %@", buf, 0xCu);
    }

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v13 = self->_allowlistedVehicleIdentifiers;
    v14 = -[NSSet countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(_QWORD *)v28 != v16)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[AlishaExternal shared](_TtC10seserviced14AlishaExternal, "shared"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "getEndpointWithReaderIdentifier:", v18));

          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "bleUUID"));
          if (v21)
          {
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "bleUUID"));
            v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID ses_withUUIDString:](NSUUID, "ses_withUUIDString:", v22));

            v24 = (void *)objc_claimAutoreleasedReturnValue(+[AlishaExternal shared](_TtC10seserviced14AlishaExternal, "shared"));
            objc_msgSend(v24, "resetDisconnectionHistoryFor:", v23);

            if (self->_subscriptionRange.location && self->_subscriptionRange.length)
            {
              v25 = (void *)objc_claimAutoreleasedReturnValue(+[AlishaExternal shared](_TtC10seserviced14AlishaExternal, "shared"));
              objc_msgSend(v25, "subscribeToVehicleFunctionStatusEventsWithRange:peerUUID:", self->_subscriptionRange.location, self->_subscriptionRange.length, v23);

            }
          }

        }
        v15 = -[NSSet countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v15);
    }

    v26.receiver = self;
    v26.super_class = (Class)_SESRKESession;
    -[_SESSession start](&v26, "start");
    v9 = 0;
  }

}

+ (BOOL)isDebugAllowAllEndpointsEnabled
{
  int v2;
  id v3;
  unsigned __int8 v4;

  v2 = SESInternalVariant(a1);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.seserviced"));
    v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("debug.carkey.allow.all.endpoints"));

    LOBYTE(v2) = v4;
  }
  return v2;
}

+ (id)_debugGetReaderIdentifiersForAllEndpoints:(id *)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AlishaExternal shared](_TtC10seserviced14AlishaExternal, "shared", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "getAllEndpoints"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allObjects"));
  v6 = TransformIf(v5, &stru_100304718);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v7));
  return v8;
}

+ (id)getAllowedVehicleIdentifiersForConnection:(id)a3 error:(id *)a4
{
  id v5;
  _BOOL8 v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  PKPassLibrary *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  NSMutableSet *v19;
  id v20;
  char v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  void *i;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  id v45;
  PKPassLibrary *v46;
  void *v47;
  id v48;
  id obj;
  uint64_t v50;
  id v51;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _QWORD v61[4];
  id v62;
  uint8_t buf[4];
  void *v64;
  _BYTE v65[128];
  _BYTE v66[128];

  v5 = a3;
  v6 = +[PKPassLibrary isPassLibraryAvailable](PKPassLibrary, "isPassLibraryAvailable");
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[_SESSessionClientInfo withConnection:](_SESSessionClientInfo, "withConnection:", v5));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "clientName"));

    if (v9)
    {
      v12 = objc_opt_new(PKPassLibrary);
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "clientName"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[PKPassLibrary passUniqueIDsForAssociatedApplicationIdentifier:](v12, "passUniqueIDsForAssociatedApplicationIdentifier:", v13));

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[PKPassLibrary passes](v12, "passes"));
      v61[0] = _NSConcreteStackBlock;
      v61[1] = 3221225472;
      v61[2] = sub_10003C1BC;
      v61[3] = &unk_100304740;
      v16 = v14;
      v62 = v16;
      v17 = TransformIf(v15, v61);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

      v19 = objc_opt_new(NSMutableSet);
      v57 = 0u;
      v58 = 0u;
      v59 = 0u;
      v60 = 0u;
      v20 = v18;
      v51 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
      if (v51)
      {
        v48 = v5;
        obj = v20;
        v45 = v16;
        v46 = v12;
        v47 = v8;
        v21 = 0;
        v50 = *(_QWORD *)v58;
        do
        {
          v22 = 0;
          do
          {
            if (*(_QWORD *)v58 != v50)
              objc_enumerationMutation(obj);
            v52 = v22;
            v23 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v22);
            v53 = 0u;
            v54 = 0u;
            v55 = 0u;
            v56 = 0u;
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "devicePrimaryPaymentApplication", v45, v46, v47, v48));
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "subcredentials"));

            v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
            if (v26)
            {
              v27 = v26;
              v28 = *(_QWORD *)v54;
              do
              {
                for (i = 0; i != v27; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v54 != v28)
                    objc_enumerationMutation(v25);
                  v30 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)i);
                  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "pairedReaderIdentifier"));
                  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "hexStringAsData"));

                  if (v32)
                  {
                    -[NSMutableSet addObject:](v19, "addObject:", v32);
                  }
                  else
                  {
                    v35 = SESDefaultLogObject(v33, v34);
                    v36 = objc_claimAutoreleasedReturnValue(v35);
                    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
                    {
                      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "asDictionary"));
                      *(_DWORD *)buf = 138412290;
                      v64 = v37;
                      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "Skipping credential with invalid paired reader ID %@", buf, 0xCu);

                    }
                    v21 = 1;
                  }

                }
                v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
              }
              while (v27);
            }

            v22 = v52 + 1;
          }
          while ((id)(v52 + 1) != v51);
          v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
        }
        while (v51);
        v20 = obj;

        v8 = v47;
        v5 = v48;
        v16 = v45;
        v12 = v46;
        if ((v21 & 1) != 0)
          +[SESTapToRadar requestTapToRadar:client:](SESTapToRadar, "requestTapToRadar:client:", CFSTR("Car Key pass with invalid paired reader ID"), CFSTR("PassNoPairedReaderID"));
      }
      else
      {

      }
    }
    else
    {
      if (a4)
      {
        v41 = SESDefaultLogObject(v10, v11);
        v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
        v43 = SESCreateAndLogError(0, v42, SESErrorDomain, 0, CFSTR("Missing client name"));
        *a4 = (id)objc_claimAutoreleasedReturnValue(v43);

      }
      v19 = 0;
    }

  }
  else
  {
    if (a4)
    {
      v38 = SESDefaultLogObject(v6, v7);
      v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
      v40 = SESCreateAndLogError(0, v39, SESErrorDomain, 0, CFSTR("PKPassLibrary is unavailable"));
      *a4 = (id)objc_claimAutoreleasedReturnValue(v40);

    }
    v19 = 0;
  }

  return v19;
}

- (void)endSessionInternal:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *j;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  unsigned int v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  NSUUID *currentPeerUUID;
  void *v44;
  NSSet *obj;
  _SESRKESession *v46;
  void *v47;
  NSObject *v48;
  uint64_t v49;
  id v50;
  void *v51;
  void *v52;
  objc_super v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD v58[4];
  NSObject *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t buf[4];
  _BYTE v65[24];
  _BYTE v66[128];
  _BYTE v67[128];

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[_SESSession queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  v8 = SESDefaultLogObject(v6, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)v65 = self;
    *(_WORD *)&v65[8] = 2112;
    *(_QWORD *)&v65[10] = v4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "SESRKESession endSessionInternal %@ error %@", buf, 0x16u);
  }
  v44 = v4;

  sub_10004C548((uint64_t)self->_rbsAssertionTimer);
  -[RBSAssertion invalidate](self->_rbsAssertion, "invalidate");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[AlishaExternal shared](_TtC10seserviced14AlishaExternal, "shared"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "getEnduringRKERequestsInProgress"));

  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  obj = self->_allowlistedVehicleIdentifiers;
  v50 = -[NSSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v60, v67, 16);
  if (v50)
  {
    v49 = *(_QWORD *)v61;
    v46 = self;
    do
    {
      for (i = 0; i != v50; i = (char *)i + 1)
      {
        if (*(_QWORD *)v61 != v49)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[AlishaExternal shared](_TtC10seserviced14AlishaExternal, "shared"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "getEndpointWithReaderIdentifier:", v12));

        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bleUUID"));
        if (v15)
        {
          v52 = i;
          v58[0] = _NSConcreteStackBlock;
          v58[1] = 3221225472;
          v58[2] = sub_10003C7B4;
          v58[3] = &unk_100304768;
          v51 = v14;
          v48 = v14;
          v59 = v48;
          v18 = Filter(v47, v58);
          v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
          v54 = 0u;
          v55 = 0u;
          v56 = 0u;
          v57 = 0u;
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
          if (v20)
          {
            v21 = v20;
            v22 = *(_QWORD *)v55;
            do
            {
              for (j = 0; j != v21; j = (char *)j + 1)
              {
                if (*(_QWORD *)v55 != v22)
                  objc_enumerationMutation(v19);
                v24 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)j);
                v25 = (void *)objc_claimAutoreleasedReturnValue(+[AlishaExternal shared](_TtC10seserviced14AlishaExternal, "shared"));
                v26 = objc_msgSend(v24, "functionIdentifier");
                v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "keyIdentifier"));
                v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "cancelRKERequestWithFunctionIdentifier:keyIdentifier:", v26, v27));

                v31 = SESDefaultLogObject(v29, v30);
                v32 = objc_claimAutoreleasedReturnValue(v31);
                if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
                {
                  v33 = objc_msgSend(v24, "functionIdentifier");
                  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "keyIdentifier"));
                  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "asHexString"));
                  *(_DWORD *)buf = 67109634;
                  *(_DWORD *)v65 = v33;
                  *(_WORD *)&v65[4] = 2112;
                  *(_QWORD *)&v65[6] = v35;
                  *(_WORD *)&v65[14] = 2112;
                  *(_QWORD *)&v65[16] = v28;
                  _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "Cancelled function 0x%X key %@ error %@", buf, 0x1Cu);

                }
              }
              v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
            }
            while (v21);
          }
          self = v46;
          if (v46->_subscriptionRange.location && v46->_subscriptionRange.length)
          {
            v36 = (void *)objc_claimAutoreleasedReturnValue(+[AlishaExternal shared](_TtC10seserviced14AlishaExternal, "shared"));
            v37 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject bleUUID](v48, "bleUUID"));
            v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID ses_withUUIDString:](NSUUID, "ses_withUUIDString:", v37));
            objc_msgSend(v36, "subscribeToVehicleFunctionStatusEventsWithRange:peerUUID:", 0, 0, v38);

          }
          v39 = v59;
          v14 = v51;
          i = v52;
        }
        else
        {
          v40 = SESDefaultLogObject(v16, v17);
          v39 = objc_claimAutoreleasedReturnValue(v40);
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "asHexString"));
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v65 = v41;
            _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "Couldn't find endpoint for vehicle ID %@", buf, 0xCu);

          }
        }

      }
      v50 = -[NSSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v60, v67, 16);
    }
    while (v50);
  }

  if (self->_currentPeerUUID)
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[AlishaExternal shared](_TtC10seserviced14AlishaExternal, "shared"));
    objc_msgSend(v42, "removeHighPriorityRequestFor:client:", self->_currentPeerUUID, self->_sessionID);

    currentPeerUUID = self->_currentPeerUUID;
    self->_currentPeerUUID = 0;

  }
  v53.receiver = self;
  v53.super_class = (Class)_SESRKESession;
  -[_SESSession endSessionInternal:](&v53, "endSessionInternal:", v44);

}

- (void)endSession:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[_SESSession queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003C8AC;
  v7[3] = &unk_100303078;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)isPassiveEntryAvailable:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[_SESSession queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003CA24;
  block[3] = &unk_1003030E0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)sendRKEFunction:(unint64_t)a3 action:(unint64_t)a4 readerIdentifier:(id)a5 authorization:(id)a6 isEnduring:(BOOL)a7 isHandlingExternal:(BOOL)a8 completion:(id)a9
{
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  _QWORD block[5];
  id v23;
  id v24;
  id v25;
  unint64_t v26;
  unint64_t v27;
  BOOL v28;
  BOOL v29;

  v15 = a5;
  v16 = a6;
  v17 = a9;
  v18 = objc_claimAutoreleasedReturnValue(-[_SESSession queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003CD3C;
  block[3] = &unk_1003047E0;
  v26 = a3;
  v27 = a4;
  block[4] = self;
  v23 = v15;
  v28 = a7;
  v29 = a8;
  v24 = v16;
  v25 = v17;
  v19 = v17;
  v20 = v16;
  v21 = v15;
  dispatch_async(v18, block);

}

- (void)cancelRKEFunction:(unint64_t)a3 readerIdentifier:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unint64_t v16;

  v8 = a4;
  v9 = a5;
  v10 = objc_claimAutoreleasedReturnValue(-[_SESSession queue](self, "queue"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10003D3EC;
  v13[3] = &unk_100304808;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a3;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

- (void)continueExecutingRKEFunction:(unint64_t)a3 action:(unint64_t)a4 arbitraryData:(id)a5 readerIdentifier:(id)a6 reply:(id)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  unint64_t v23;
  unint64_t v24;

  v12 = a5;
  v13 = a6;
  v14 = a7;
  v15 = objc_claimAutoreleasedReturnValue(-[_SESSession queue](self, "queue"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10003D79C;
  v19[3] = &unk_100304830;
  v23 = a3;
  v24 = a4;
  v19[4] = self;
  v20 = v12;
  v21 = v13;
  v22 = v14;
  v16 = v14;
  v17 = v13;
  v18 = v12;
  dispatch_async(v15, v19);

}

- (void)sendPassthroughMessage:(id)a3 readerIdentifier:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_claimAutoreleasedReturnValue(-[_SESSession queue](self, "queue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10003DBC4;
  v15[3] = &unk_100304530;
  v15[4] = self;
  v16 = v9;
  v17 = v8;
  v18 = v10;
  v12 = v8;
  v13 = v10;
  v14 = v9;
  dispatch_async(v11, v15);

}

- (void)getVehicleReports:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[_SESSession queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003E044;
  v7[3] = &unk_100303078;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)sign:(id)a3 readerIdentifier:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_claimAutoreleasedReturnValue(-[_SESSession queue](self, "queue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10003E3FC;
  v15[3] = &unk_100302B30;
  v15[4] = self;
  v16 = v9;
  v17 = v8;
  v18 = v10;
  v12 = v8;
  v13 = v9;
  v14 = v10;
  dispatch_async(v11, v15);

}

- (BOOL)isReaderAllowed:(id)a3
{
  return -[NSSet containsObject:](self->_allowlistedVehicleIdentifiers, "containsObject:", a3);
}

- (id)updateAllowlistedVehicles
{
  _SESRKESession *v2;
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  NSSet *allowlistedVehicleIdentifiers;
  uint64_t v10;
  NSSet *v11;
  id v13;
  id v14;
  uint8_t buf[16];

  v2 = self;
  objc_sync_enter(v2);
  v3 = +[_SESRKESession isDebugAllowAllEndpointsEnabled](_SESRKESession, "isDebugAllowAllEndpointsEnabled");
  if (v3)
  {
    v5 = SESDefaultLogObject(v3, v4);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Setting all endpoints as allowed", buf, 2u);
    }

    v14 = 0;
    v7 = objc_claimAutoreleasedReturnValue(+[_SESRKESession _debugGetReaderIdentifiersForAllEndpoints:](_SESRKESession, "_debugGetReaderIdentifiersForAllEndpoints:", &v14));
    v8 = v14;
    allowlistedVehicleIdentifiers = v2->_allowlistedVehicleIdentifiers;
    v2->_allowlistedVehicleIdentifiers = (NSSet *)v7;
  }
  else
  {
    allowlistedVehicleIdentifiers = (NSSet *)objc_claimAutoreleasedReturnValue(-[_SESSession connection](v2, "connection"));
    v13 = 0;
    v10 = objc_claimAutoreleasedReturnValue(+[_SESRKESession getAllowedVehicleIdentifiersForConnection:error:](_SESRKESession, "getAllowedVehicleIdentifiersForConnection:error:", allowlistedVehicleIdentifiers, &v13));
    v8 = v13;
    v11 = v2->_allowlistedVehicleIdentifiers;
    v2->_allowlistedVehicleIdentifiers = (NSSet *)v10;

  }
  objc_sync_exit(v2);

  return v8;
}

- (void)didInvalidateWithError:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  int v11;
  _SESRKESession *v12;
  __int16 v13;
  id v14;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[_SESSession queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  v8 = SESDefaultLogObject(v6, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v11 = 138412546;
    v12 = self;
    v13 = 2112;
    v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "SESRKESession %@ didInvalidateWithError %@", (uint8_t *)&v11, 0x16u);
  }

  if (-[_SESSession isActive](self, "isActive"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[_SESSession remoteObject](self, "remoteObject"));
    objc_msgSend(v10, "didInvalidateWithError:", v4);

  }
  -[_SESRKESession endSessionInternal:](self, "endSessionInternal:", v4);

}

- (void)didCreateKey:(id)a3
{
  _SESRKESession *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  _SESRKESession *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSSet *allowlistedVehicleIdentifiers;
  void *v15;
  unsigned __int8 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  int v31;
  _SESRKESession *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;

  v4 = (_SESRKESession *)a3;
  v5 = objc_claimAutoreleasedReturnValue(-[_SESSession queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  if (-[_SESSession isActive](self, "isActive"))
  {
    v6 = objc_claimAutoreleasedReturnValue(-[_SESRKESession updateAllowlistedVehicles](self, "updateAllowlistedVehicles"));
    v8 = (_SESRKESession *)v6;
    if (v6)
    {
      v9 = SESDefaultLogObject(v6, v7);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v31 = 138412290;
        v32 = v8;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to update list of allowlisted vehicles %@", (uint8_t *)&v31, 0xCu);
      }
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[AlishaExternal shared](_TtC10seserviced14AlishaExternal, "shared"));
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "getEndpointWithKeyIdentifier:", v4));

      if (v10)
      {
        allowlistedVehicleIdentifiers = self->_allowlistedVehicleIdentifiers;
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject readerIdentifier](v10, "readerIdentifier"));
        v16 = -[NSSet containsObject:](allowlistedVehicleIdentifiers, "containsObject:", v15);

        v19 = SESDefaultLogObject(v17, v18);
        v20 = objc_claimAutoreleasedReturnValue(v19);
        v21 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);
        if ((v16 & 1) != 0)
        {
          if (v21)
          {
            v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject publicKeyIdentifier](v10, "publicKeyIdentifier"));
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "asHexString"));
            v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject readerIdentifier](v10, "readerIdentifier"));
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "asHexString"));
            v31 = 138412802;
            v32 = self;
            v33 = 2112;
            v34 = v23;
            v35 = 2112;
            v36 = v25;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Calling client of %@ to handle new key %@ readerIdentifier %@", (uint8_t *)&v31, 0x20u);

          }
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[_SESSession remoteObject](self, "remoteObject"));
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject publicKeyIdentifier](v10, "publicKeyIdentifier"));
          v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject readerIdentifier](v10, "readerIdentifier"));
          objc_msgSend(v26, "didCreateKey:forVehicle:", v27, v28);

          -[_SESRKESession wakeUpClientIfBackgrounded](self, "wakeUpClientIfBackgrounded");
        }
        else
        {
          if (v21)
          {
            v31 = 138412290;
            v32 = self;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Dropping notification due to vehicle not allowed in the active session %@", (uint8_t *)&v31, 0xCu);
          }

        }
      }
      else
      {
        v29 = SESDefaultLogObject(v12, v13);
        v30 = objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          v31 = 138412290;
          v32 = v4;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "Dropping notification due to missing endpoint %@", (uint8_t *)&v31, 0xCu);
        }

      }
    }

  }
}

- (void)sendEvent:(id)a3 keyIdentifier:(id)a4
{
  _SESRKESession *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  _BOOL8 v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  _BOOL8 v20;
  uint64_t v21;
  NSObject *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  _SESRKESession *v30;
  uint64_t v31;
  int v32;
  _SESRKESession *v33;

  v6 = (_SESRKESession *)a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[_SESSession queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  v11 = SESDefaultLogObject(v9, v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v32 = 138412290;
    v33 = self;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "SESRKESession %@ sendEvent", (uint8_t *)&v32, 0xCu);
  }

  v13 = -[_SESSession isActive](self, "isActive");
  if (v13)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[AlishaExternal shared](_TtC10seserviced14AlishaExternal, "shared"));
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "getEndpointWithKeyIdentifier:", v7));

    if (v16)
    {
      v19 = objc_claimAutoreleasedReturnValue(-[NSObject readerIdentifier](v16, "readerIdentifier"));
      v20 = -[NSSet containsObject:](self->_allowlistedVehicleIdentifiers, "containsObject:", v19);
      if (v20)
      {
        if (qword_10034BBA8 != -1)
          dispatch_once(&qword_10034BBA8, &stru_1003048C8);
        v22 = objc_claimAutoreleasedReturnValue(-[_SESRKESession objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("xpcEventName")));
        v23 = objc_msgSend((id)qword_10034BBA0, "containsObject:", v22);
        if ((_DWORD)v23)
        {
          v25 = SESDefaultLogObject(v23, v24);
          v26 = objc_claimAutoreleasedReturnValue(v25);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            v32 = 138412290;
            v33 = v6;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Sending event via session delegate %@", (uint8_t *)&v32, 0xCu);
          }

          v27 = (void *)objc_claimAutoreleasedReturnValue(-[_SESSession remoteObject](self, "remoteObject"));
          objc_msgSend(v27, "sendEvent:fromVehicle:", v6, v19);

          -[_SESRKESession wakeUpClientIfBackgrounded](self, "wakeUpClientIfBackgrounded");
        }
      }
      else
      {
        v31 = SESDefaultLogObject(v20, v21);
        v22 = objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          LOWORD(v32) = 0;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Dropping event due to vehicle not in the active session", (uint8_t *)&v32, 2u);
        }
      }

    }
    else
    {
      v29 = SESDefaultLogObject(v17, v18);
      v19 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v30 = (_SESRKESession *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "asHexString"));
        v32 = 138412290;
        v33 = v30;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Dropping event due to missing endpoint %@", (uint8_t *)&v32, 0xCu);

      }
    }

  }
  else
  {
    v28 = SESDefaultLogObject(v13, v14);
    v16 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v32 = 138412290;
      v33 = v6;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Dropping event due to session not active %@", (uint8_t *)&v32, 0xCu);
    }
  }

}

- (void)didReceivePassthroughMessage:(id)a3 keyIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  _BOOL8 v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  _BOOL8 v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  const char *v26;
  NSObject *v27;
  os_log_type_t v28;
  uint32_t v29;
  uint64_t v30;
  int v31;
  _SESRKESession *v32;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[_SESSession queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  v11 = SESDefaultLogObject(v9, v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v31 = 138412290;
    v32 = self;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "SESRKESession %@ didReceivePassthroughMessage", (uint8_t *)&v31, 0xCu);
  }

  v13 = -[_SESSession isActive](self, "isActive");
  if (v13)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[AlishaExternal shared](_TtC10seserviced14AlishaExternal, "shared"));
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "getEndpointWithKeyIdentifier:", v7));

    if (v16)
    {
      v19 = objc_claimAutoreleasedReturnValue(-[NSObject readerIdentifier](v16, "readerIdentifier"));
      v20 = -[NSSet containsObject:](self->_allowlistedVehicleIdentifiers, "containsObject:", v19);
      if (v20)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[_SESSession remoteObject](self, "remoteObject"));
        objc_msgSend(v22, "didReceivePassthroughMessage:fromVehicle:", v6, v19);

        -[_SESRKESession wakeUpClientIfBackgrounded](self, "wakeUpClientIfBackgrounded");
LABEL_15:

        goto LABEL_16;
      }
      v30 = SESDefaultLogObject(v20, v21);
      v25 = objc_claimAutoreleasedReturnValue(v30);
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
LABEL_14:

        goto LABEL_15;
      }
      LOWORD(v31) = 0;
      v26 = "Dropping passthrough message due to vehicle not in the active session";
      v27 = v25;
      v28 = OS_LOG_TYPE_INFO;
      v29 = 2;
    }
    else
    {
      v24 = SESDefaultLogObject(v17, v18);
      v19 = objc_claimAutoreleasedReturnValue(v24);
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        goto LABEL_15;
      v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "asHexString"));
      v31 = 138412290;
      v32 = (_SESRKESession *)v25;
      v26 = "No endpoint matching key %@";
      v27 = v19;
      v28 = OS_LOG_TYPE_ERROR;
      v29 = 12;
    }
    _os_log_impl((void *)&_mh_execute_header, v27, v28, v26, (uint8_t *)&v31, v29);
    goto LABEL_14;
  }
  v23 = SESDefaultLogObject(v13, v14);
  v16 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    LOWORD(v31) = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Ignoring passthrough message received with no active session", (uint8_t *)&v31, 2u);
  }
LABEL_16:

}

- (void)didReceiveContinuationRequestFor:(id)a3 actionIdentifier:(id)a4 arbitraryData:(id)a5 keyIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  _BOOL8 v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  int v30;
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  _BOOL4 v37;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_claimAutoreleasedReturnValue(-[_SESSession queue](self, "queue"));
  dispatch_assert_queue_V2(v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[AlishaExternal shared](_TtC10seserviced14AlishaExternal, "shared"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "getEndpointWithKeyIdentifier:", v13));

  if (v16)
  {
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "readerIdentifier"));
    v20 = -[NSSet containsObject:](self->_allowlistedVehicleIdentifiers, "containsObject:", v19);
    v21 = v20;
    v23 = SESDefaultLogObject(v20, v22);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    v25 = os_log_type_enabled(v24, OS_LOG_TYPE_INFO);
    if (v21)
    {
      if (v25)
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject asHexString](v19, "asHexString"));
        v30 = 138413058;
        v31 = v26;
        v32 = 2112;
        v33 = v10;
        v34 = 2112;
        v35 = v11;
        v36 = 1024;
        v37 = v12 != 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Calling client to handle continuation request for %@ function %@ action %@ with arbitraryData %d", (uint8_t *)&v30, 0x26u);

      }
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[_SESSession remoteObject](self, "remoteObject"));
      objc_msgSend(v27, "didReceiveContinuationRequestFor:actionIdentifier:arbitraryData:fromVehicle:", v10, v11, v12, v19);

      -[_SESRKESession wakeUpClientIfBackgrounded](self, "wakeUpClientIfBackgrounded");
    }
    else
    {
      if (v25)
      {
        LOWORD(v30) = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Dropping confirmation request due to vehicle not in the active session", (uint8_t *)&v30, 2u);
      }

    }
  }
  else
  {
    v28 = SESDefaultLogObject(v17, v18);
    v19 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "asHexString"));
      v30 = 138412290;
      v31 = v29;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "No endpoint matching key %@", (uint8_t *)&v30, 0xCu);

    }
  }

}

- (void)wakeUpClientIfBackgrounded
{
  NSObject *v3;
  unsigned __int8 v4;
  RBSAssertion *rbsAssertion;
  RBSAssertion *v6;
  SESTimer *rbsAssertionTimer;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  uint64_t v13;
  void *v14;

  v3 = objc_claimAutoreleasedReturnValue(-[_SESSession queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  sub_10004C548((uint64_t)self->_rbsAssertionTimer);
  v4 = -[_SESSession isBackgrounded](self, "isBackgrounded");
  rbsAssertion = self->_rbsAssertion;
  if ((v4 & 1) != 0)
  {
    if (rbsAssertion)
    {
      sub_10004C410((uint64_t)self->_rbsAssertionTimer, 1.0);
    }
    else
    {
      v13 = FBSOpenApplicationOptionKeyActivateSuspended;
      v14 = &__kCFBooleanTrue;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[FBSOpenApplicationOptions optionsWithDictionary:](FBSOpenApplicationOptions, "optionsWithDictionary:", v8));

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[FBSOpenApplicationService serviceWithDefaultShellEndpoint](FBSOpenApplicationService, "serviceWithDefaultShellEndpoint"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[_SESRKESession clientBundleIdentifier](self, "clientBundleIdentifier"));
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10003FC00;
      v12[3] = &unk_100304918;
      v12[4] = self;
      objc_msgSend(v10, "openApplication:withOptions:completion:", v11, v9, v12);

    }
  }
  else if (rbsAssertion)
  {
    -[RBSAssertion invalidate](rbsAssertion, "invalidate");
    v6 = self->_rbsAssertion;
    self->_rbsAssertion = 0;

    rbsAssertionTimer = self->_rbsAssertionTimer;
    self->_rbsAssertionTimer = 0;

  }
}

- (_NSRange)subscriptionRange
{
  _NSRange *p_subscriptionRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_subscriptionRange = &self->_subscriptionRange;
  location = self->_subscriptionRange.location;
  length = p_subscriptionRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setSubscriptionRange:(_NSRange)a3
{
  self->_subscriptionRange = a3;
}

- (NSString)clientBundleIdentifier
{
  return self->_clientBundleIdentifier;
}

- (void)setClientBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_clientBundleIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_rbsAssertionTimer, 0);
  objc_storeStrong((id *)&self->_rbsAssertion, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_currentPeerUUID, 0);
  objc_storeStrong((id *)&self->_allowlistedVehicleIdentifiers, 0);
}

@end
