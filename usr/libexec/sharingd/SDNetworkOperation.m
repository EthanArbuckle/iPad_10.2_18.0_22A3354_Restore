@implementation SDNetworkOperation

- (SDNetworkOperation)initWithKind:(id)a3
{
  id v5;
  SDNetworkOperation *v6;
  SDNetworkOperation *v7;
  id operation;
  OS_xpc_object *connection;
  NSMutableArray *v10;
  NSMutableArray *activities;
  NSMutableDictionary *v12;
  NSMutableDictionary *properties;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SDNetworkOperation;
  v6 = -[SDNetworkOperation init](&v15, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_kind, a3);
    operation = v7->_operation;
    v7->_operation = 0;

    connection = v7->_connection;
    v7->_connection = 0;

    v7->_connectionScheduled = 0;
    v10 = objc_opt_new(NSMutableArray);
    activities = v7->_activities;
    v7->_activities = v10;

    v12 = objc_opt_new(NSMutableDictionary);
    properties = v7->_properties;
    v7->_properties = v12;

    v7->_sandboxExtensionHandle = 0;
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[SDNetworkOperation invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SDNetworkOperation;
  -[SDNetworkOperation dealloc](&v3, "dealloc");
}

- (void)setProperty:(void *)a3 forKey:(id)a4
{
  NSMutableDictionary *properties;
  id v7;

  v7 = a4;
  if ((objc_msgSend(v7, "isEqual:", kSFOperationKindKey) & 1) == 0)
  {
    if ((-[NSString isEqual:](self->_kind, "isEqual:", kSFOperationKindController) & 1) != 0
      || -[NSString isEqual:](self->_kind, "isEqual:", kSFOperationKindInformation))
    {
      objc_msgSend(self->_operation, "setProperty:forKey:", a3, v7);
    }
    properties = self->_properties;
    if (a3)
      -[NSMutableDictionary setObject:forKeyedSubscript:](properties, "setObject:forKeyedSubscript:", a3, v7);
    else
      -[NSMutableDictionary removeObjectForKey:](properties, "removeObjectForKey:", v7);
  }

}

- (void)copyPropertyForKey:(id)a3
{
  id v4;
  NSString *v5;
  NSString *v6;

  v4 = a3;
  if (objc_msgSend(v4, "isEqual:", kSFOperationKindKey))
    v5 = self->_kind;
  else
    v5 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", v4));
  v6 = v5;

  return v6;
}

- (void)airDropStatus:(id)a3 didChange:(id)a4
{
  SDNetworkOperationDelegate **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "networkOperation:event:withResults:", self, 12, v6);

}

- (void)airDropInformation:(id)a3 didChange:(id)a4
{
  SDNetworkOperationDelegate **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "networkOperation:event:withResults:", self, 12, v6);

}

- (void)airDropController:(id)a3 didChange:(id)a4
{
  SDNetworkOperationDelegate **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "networkOperation:event:withResults:", self, 12, v6);

}

- (void)airDropSession:(id)a3 event:(int64_t)a4 withResults:(id)a5
{
  SDNetworkOperationDelegate **p_delegate;
  id v8;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v8 = a5;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "networkOperation:event:withResults:", self, a4, v8);

}

- (void)airDropServer:(id)a3 event:(int64_t)a4 withResults:(id)a5
{
  SDNetworkOperationDelegate **p_delegate;
  id v8;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v8 = a5;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "networkOperation:event:withResults:", self, a4, v8);

}

- (void)networkEjecter:(id)a3 event:(int64_t)a4 withResults:(id)a5
{
  SDNetworkOperationDelegate **p_delegate;
  id v8;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v8 = a5;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "networkOperation:event:withResults:", self, a4, v8);

}

- (void)networkResolver:(id)a3 event:(int64_t)a4 withResults:(id)a5
{
  SDNetworkOperationDelegate **p_delegate;
  id v8;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v8 = a5;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "networkOperation:event:withResults:", self, a4, v8);

}

- (void)airDropConnection:(id)a3 event:(int64_t)a4 withResults:(id)a5
{
  SDNetworkOperationDelegate **p_delegate;
  id v8;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v8 = a5;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "networkOperation:event:withResults:", self, a4, v8);

}

- (void)notifyClientWithPosixError:(int64_t)a3
{
  _QWORD v3[6];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000EA248;
  v3[3] = &unk_100716108;
  v3[4] = self;
  v3[5] = a3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
}

- (void)resume
{
  id operation;
  SDNetworkOperation *v4;
  uint64_t v5;
  SDAirDropServer *v6;
  id v7;
  OS_xpc_object *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  __objc2_class *v18;
  id v19;
  SDAirDropSession *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  id v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  void *v37;
  OS_xpc_object *connection;
  void *v39;
  id v40;
  void *v41;
  const void *Value;
  const void *v43;
  CFTypeID v44;
  uint64_t TypeID;
  void *v46;
  SDAirDropConnection *v47;
  id v48;
  id v49;
  id v50;
  uint64_t v51;
  NSObject *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  SDAirDropLogger *v60;
  id v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  __objc2_class *v72;
  id v73;
  id v74;
  id v75;
  _OWORD v76[2];
  __int128 v77;
  __int128 v78;

  if (-[NSString isEqual:](self->_kind, "isEqual:", kSFOperationKindSender))
  {
    operation = self->_operation;
    if (operation)
    {
      if ((objc_msgSend(operation, "send") & 1) == 0)
      {
        v4 = self;
        v5 = 37;
LABEL_5:
        -[SDNetworkOperation notifyClientWithPosixError:](v4, "notifyClientWithPosixError:", v5);
        return;
      }
    }
    else
    {
      v12 = kSFOperationItemsKey;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", kSFOperationItemsKey));
      v14 = v13;
      if (v13)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v12));
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", kSFOperationNodeKey));

        if (v15)
          v17 = v16 == 0;
        else
          v17 = 1;
        if (v17)
        {
          -[SDNetworkOperation notifyClientWithPosixError:](self, "notifyClientWithPosixError:", 22);
        }
        else
        {
          v19 = objc_msgSend(v14, "mutableCopy");
          objc_msgSend(v19, "removeObjectForKey:", v12);
          v20 = -[SDAirDropSession initWithPerson:items:sandboxExtensions:]([SDAirDropSession alloc], "initWithPerson:items:sandboxExtensions:", v16, v15, v19);
          v21 = self->_operation;
          self->_operation = v20;

          v22 = self->_operation;
          v23 = kSFOperationFileIconKey;
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", kSFOperationFileIconKey));
          objc_msgSend(v22, "setProperty:forKey:", v24, v23);

          v25 = self->_operation;
          v26 = kSFOperationSessionIDKey;
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", kSFOperationSessionIDKey));
          objc_msgSend(v25, "setProperty:forKey:", v27, v26);

          v28 = self->_operation;
          v29 = kSFOperationSmallFileIconKey;
          v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", kSFOperationSmallFileIconKey));
          objc_msgSend(v28, "setProperty:forKey:", v30, v29);

          v31 = self->_operation;
          v32 = kSFOperationItemsDescriptionKey;
          v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", kSFOperationItemsDescriptionKey));
          objc_msgSend(v31, "setProperty:forKey:", v33, v32);

          v34 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", kSFOperationBundleIDKey));
          objc_msgSend(self->_operation, "setClientBundleID:", v34);

          v35 = self->_operation;
          v36 = kSFOperationFromShareSheet;
          v37 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", kSFOperationFromShareSheet));
          objc_msgSend(v35, "setProperty:forKey:", v37, v36);

          connection = self->_connection;
          if (connection)
          {
            v77 = 0u;
            v78 = 0u;
            xpc_connection_get_audit_token(connection, &v77);
            v76[0] = v77;
            v76[1] = v78;
            objc_msgSend(self->_operation, "setAuditToken:", v76);
            objc_msgSend(self->_operation, "setClientPid:", xpc_connection_get_pid(self->_connection));
            v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(self->_operation, "clientBundleID"));

            if (!v39)
            {
              v40 = sub_10019CD60(self->_connection);
              v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
              objc_msgSend(self->_operation, "setClientBundleID:", v41);

            }
          }
          objc_msgSend(self->_operation, "setDelegate:", self);
          objc_msgSend(self->_operation, "start");

        }
      }
      else
      {
        -[SDNetworkOperation notifyClientWithPosixError:](self, "notifyClientWithPosixError:", 22);
      }

    }
    return;
  }
  if (-[NSString isEqual:](self->_kind, "isEqual:", kSFOperationKindListener))
  {
    v6 = objc_alloc_init(SDAirDropServer);
    v7 = self->_operation;
    self->_operation = v6;

    v8 = self->_connection;
    if (v8)
    {
      objc_msgSend(self->_operation, "setClientPid:", xpc_connection_get_pid(v8));
      v9 = sub_10019CD60(self->_connection);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      objc_msgSend(self->_operation, "setClientBundleID:", v10);

    }
    objc_msgSend(self->_operation, "setDelegate:", self);
    objc_msgSend(self->_operation, "activate");
    return;
  }
  if (!-[NSString isEqual:](self->_kind, "isEqual:", kSFOperationKindReceiver))
  {
    if (-[NSString isEqual:](self->_kind, "isEqual:", kSFOperationKindController))
    {
      v18 = SDAirDropController;
LABEL_39:
      v49 = objc_alloc_init(v18);
      v50 = self->_operation;
      self->_operation = v49;

      objc_msgSend(self->_operation, "setDelegate:", self);
      objc_msgSend(self->_operation, "start");
      return;
    }
    if (-[NSString isEqual:](self->_kind, "isEqual:", kSFOperationKindInformation))
    {
      v18 = SDAirDropInformation;
      goto LABEL_39;
    }
    if (-[NSString isEqual:](self->_kind, "isEqual:", kSFOperationKindStatus))
    {
      ++dword_1007D7F38;
      v18 = SDAirDropStatus;
      goto LABEL_39;
    }
    if (-[NSString isEqual:](self->_kind, "isEqual:", kSFOperationKindLogger))
    {
      v60 = objc_alloc_init(SDAirDropLogger);
      v61 = self->_operation;
      self->_operation = v60;

      v75 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", kSFOperationSessionIDKey));
      v62 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", kSFOperationProtocolKey));
      objc_msgSend(self->_operation, "logActivityType:sessionID:", v62, v75);

LABEL_56:
      return;
    }
    if (-[NSString isEqual:](self->_kind, "isEqual:", kSFOperationKindResolver))
    {
      v71 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", kSFOperationNodeKey));

      if (v71)
      {
        v75 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", kSFOperationFlagsKey));
        v46 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", kSFOperationProtocolKey));
        v72 = SDNetworkResolver;
LABEL_54:
        v73 = objc_msgSend([v72 alloc], "initWithNode:", v71);
        v74 = self->_operation;
        self->_operation = v73;

        objc_msgSend(self->_operation, "setProtocol:", v46);
        objc_msgSend(self->_operation, "setDelegate:", self);
        objc_msgSend(self->_operation, "setFlags:", v75);
        objc_msgSend(self->_operation, "start");
        goto LABEL_55;
      }
    }
    else if (-[NSString isEqual:](self->_kind, "isEqual:", kSFOperationKindEjecter))
    {
      v71 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", kSFOperationNodeKey));

      if (v71)
      {
        v75 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", kSFOperationFlagsKey));
        v46 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", kSFOperationProtocolKey));
        v72 = SDNetworkEjecter;
        goto LABEL_54;
      }
    }
    v4 = self;
    v5 = 22;
    goto LABEL_5;
  }
  v11 = self->_operation;
  if (!v11)
  {
    Value = CFDictionaryGetValue((CFDictionaryRef)self->_properties, kSFOperationHTTPServerConnectionKey);
    if (Value)
    {
      v43 = Value;
      v44 = CFGetTypeID(Value);
      TypeID = _CFHTTPServerConnectionGetTypeID();
      if (v44 == TypeID)
      {
        v75 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", kSFOperationSessionIDKey));
        v46 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", kSFOperationContactsOnlyKey));
        v47 = -[SDAirDropConnection initWithConnection:]([SDAirDropConnection alloc], "initWithConnection:", v43);
        v48 = self->_operation;
        self->_operation = v47;

        objc_msgSend(self->_operation, "setContactsOnly:", objc_msgSend(v46, "BOOLValue"));
        objc_msgSend(self->_operation, "setSessionID:", v75);
        objc_msgSend(self->_operation, "setDelegate:", self);
        objc_msgSend(self->_operation, "start");
LABEL_55:

        goto LABEL_56;
      }
      v63 = airdrop_log(TypeID);
      v52 = objc_claimAutoreleasedReturnValue(v63);
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        sub_1000EAE14(v52, v64, v65, v66, v67, v68, v69, v70);
    }
    else
    {
      v51 = airdrop_log(0);
      v52 = objc_claimAutoreleasedReturnValue(v51);
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        sub_1000EADE0(v52, v53, v54, v55, v56, v57, v58, v59);
    }

    return;
  }
  if (self->_connectionScheduled)
  {
    if ((objc_msgSend(v11, "accept") & 1) == 0)
    {
      v4 = self;
      v5 = 1;
      goto LABEL_5;
    }
  }
  else
  {
    self->_connectionScheduled = 1;
    _objc_msgSend(v11, "schedule");
  }
}

- (void)invalidate
{
  id operation;
  int64_t sandboxExtensionHandle;

  if (!self->_operation)
    goto LABEL_15;
  if (-[NSString isEqual:](self->_kind, "isEqual:", kSFOperationKindSender))
    goto LABEL_13;
  if (!-[NSString isEqual:](self->_kind, "isEqual:", kSFOperationKindListener))
  {
    if (!-[NSString isEqual:](self->_kind, "isEqual:", kSFOperationKindReceiver)
      && !-[NSString isEqual:](self->_kind, "isEqual:", kSFOperationKindController))
    {
      if (-[NSString isEqual:](self->_kind, "isEqual:", kSFOperationKindStatus))
      {
        objc_msgSend(self->_operation, "setDelegate:", 0);
        objc_msgSend(self->_operation, "stop");
        --dword_1007D7F38;
        goto LABEL_14;
      }
      if (!-[NSString isEqual:](self->_kind, "isEqual:", kSFOperationKindInformation))
      {
        if ((-[NSString isEqual:](self->_kind, "isEqual:", kSFOperationKindLogger) & 1) != 0)
          goto LABEL_14;
        if (!-[NSString isEqual:](self->_kind, "isEqual:", kSFOperationKindEjecter)
          && !-[NSString isEqual:](self->_kind, "isEqual:", kSFOperationKindResolver))
        {
          goto LABEL_15;
        }
      }
    }
LABEL_13:
    objc_msgSend(self->_operation, "setDelegate:", 0);
    objc_msgSend(self->_operation, "stop");
    goto LABEL_14;
  }
  objc_msgSend(self->_operation, "setDelegate:", 0);
  objc_msgSend(self->_operation, "invalidate");
LABEL_14:
  operation = self->_operation;
  self->_operation = 0;

LABEL_15:
  sandboxExtensionHandle = self->_sandboxExtensionHandle;
  if (sandboxExtensionHandle)
    sandbox_extension_release(sandboxExtensionHandle);
}

- (NSString)description
{
  id operation;
  uint64_t v4;
  void *v5;
  id v6;
  id v8;

  operation = self->_operation;
  if (!operation)
    return (NSString *)0;
  v4 = objc_opt_class(SDAirDropServer, a2);
  if ((objc_opt_isKindOfClass(operation, v4) & 1) == 0)
    return (NSString *)0;
  v8 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(self->_operation, "description"));
  NSAppendPrintF(&v8, "%@\n", v5);
  v6 = v8;

  return (NSString *)v6;
}

- (NSString)kind
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)objectKey
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setObjectKey:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (OS_xpc_object)boostMessage
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 64, 1);
}

- (void)setBoostMessage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSMutableArray)activities
{
  return (NSMutableArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setActivities:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (OS_xpc_object)connection
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 24, 1);
}

- (void)setConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (SDNetworkOperationDelegate)delegate
{
  return (SDNetworkOperationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_activities, 0);
  objc_storeStrong((id *)&self->_boostMessage, 0);
  objc_storeStrong((id *)&self->_objectKey, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong(&self->_operation, 0);
}

@end
