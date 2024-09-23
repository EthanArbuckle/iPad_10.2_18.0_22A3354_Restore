@implementation SharingDaemon

+ (id)sharedDaemon
{
  if (qword_1007C6A10 != -1)
    dispatch_once(&qword_1007C6A10, &stru_100718178);
  return (id)qword_1007C6A18;
}

- (SharingDaemon)init
{
  SharingDaemon *v2;
  NSMutableSet *v3;
  NSMutableSet *activeObjects;
  NSMutableDictionary *v5;
  NSMutableDictionary *exportedOperations;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SharingDaemon;
  v2 = -[SharingDaemon init](&v8, "init");
  if (v2)
  {
    v3 = objc_opt_new(NSMutableSet);
    activeObjects = v2->_activeObjects;
    v2->_activeObjects = v3;

    v5 = objc_opt_new(NSMutableDictionary);
    exportedOperations = v2->_exportedOperations;
    v2->_exportedOperations = v5;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[SharingDaemon stop](self, "stop");
  v3.receiver = self;
  v3.super_class = (Class)SharingDaemon;
  -[SharingDaemon dealloc](&v3, "dealloc");
}

- (id)xpcObjectForSFOperationResults:(id)a3
{
  id v3;
  xpc_object_t v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  xpc_object_t v14;
  BOOL v15;
  const char *string_ptr;
  __CFData *v17;
  __CFData *v18;
  int64_t Code;
  CFErrorDomain Domain;
  void *v21;
  const __CFDictionary *v22;
  const __CFDictionary *v23;
  __CFDictionary *MutableCopy;
  void *v25;
  id v26;
  CFStringRef key;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  xpc_object_t v32;
  uint64_t v33;
  uint64_t v34;
  id obj;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];

  v3 = a3;
  v4 = xpc_dictionary_create(0, 0, 0);
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allKeys"));
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v37;
    v8 = kSFOperationNodeKey;
    v34 = kSFOperationSenderNodeKey;
    v33 = kSFOperationFileIconKey;
    v31 = kSFOperationSmallFileIconKey;
    v30 = kSFOperationErrorKey;
    key = kCFErrorUnderlyingErrorKey;
    v32 = v4;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v37 != v7)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v10, key));

        v12 = (void *)_CFXPCCreateXPCObjectFromCFObject(v10);
        if ((objc_msgSend(v10, "isEqual:", v8) & 1) != 0
          || objc_msgSend(v10, "isEqual:", v34))
        {
          v13 = _SFNodeXPCObjectCreate(v11);
        }
        else
        {
          if ((objc_msgSend(v10, "isEqual:", v33) & 1) != 0
            || objc_msgSend(v10, "isEqual:", v31))
          {
            v17 = sub_1000CE5B0(v11, 0);
            if (!v17)
            {
              v14 = 0;
              v4 = v32;
              goto LABEL_15;
            }
            v18 = v17;
            v14 = (xpc_object_t)_CFXPCCreateXPCObjectFromCFObject(v17);
            CFRelease(v18);
            goto LABEL_30;
          }
          if (objc_msgSend(v10, "isEqual:", v30))
          {
            v14 = xpc_dictionary_create(0, 0, 0);
            Code = CFErrorGetCode((CFErrorRef)v11);
            Domain = CFErrorGetDomain((CFErrorRef)v11);
            v21 = (void *)_CFXPCCreateXPCObjectFromCFObject(Domain);
            xpc_dictionary_set_int64(v14, "Code", Code);
            if (v21)
              xpc_dictionary_set_value(v14, "Domain", v21);
            v22 = CFErrorCopyUserInfo((CFErrorRef)v11);
            if (v22)
            {
              v23 = v22;
              v29 = v21;
              MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v22);
              CFDictionaryRemoveValue(MutableCopy, key);
              v25 = (void *)_CFXPCCreateXPCObjectFromCFObject(MutableCopy);
              if (v25)
                xpc_dictionary_set_value(v14, "UserInfo", v25);
              CFRelease(MutableCopy);
              CFRelease(v23);

              v21 = v29;
            }

LABEL_30:
            v4 = v32;
            goto LABEL_10;
          }
          v13 = _CFXPCCreateXPCObjectFromCFObject(v11);
        }
        v14 = (xpc_object_t)v13;
LABEL_10:
        if (v12)
          v15 = v14 == 0;
        else
          v15 = 1;
        if (!v15)
        {
          string_ptr = xpc_string_get_string_ptr(v12);
          xpc_dictionary_set_value(v4, string_ptr, v14);
        }
LABEL_15:

        v9 = (char *)v9 + 1;
      }
      while (v6 != v9);
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      v6 = v26;
    }
    while (v26);
  }

  return v4;
}

- (id)stringFromXPCObject:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  CFTypeID v7;
  CFTypeID TypeID;
  uint64_t v9;
  NSObject *v10;

  v3 = a3;
  v4 = v3;
  if (!v3)
  {
LABEL_7:
    v6 = 0;
    goto LABEL_8;
  }
  v5 = (void *)_CFXPCCreateCFObjectFromXPCObject(v3);
  v6 = v5;
  if (v5)
  {
    v7 = CFGetTypeID(v5);
    TypeID = CFStringGetTypeID();
    if (v7 != TypeID)
    {
      v9 = daemon_log(TypeID);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_10012AA60();

      CFRelease(v6);
      goto LABEL_7;
    }
  }
LABEL_8:

  return v6;
}

- (id)arrayFromXPCObject:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  CFTypeID v7;
  CFTypeID TypeID;
  uint64_t v9;
  NSObject *v10;

  v3 = a3;
  v4 = v3;
  if (!v3)
  {
LABEL_7:
    v6 = 0;
    goto LABEL_8;
  }
  v5 = (void *)_CFXPCCreateCFObjectFromXPCObject(v3);
  v6 = v5;
  if (v5)
  {
    v7 = CFGetTypeID(v5);
    TypeID = CFArrayGetTypeID();
    if (v7 != TypeID)
    {
      v9 = daemon_log(TypeID);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_10012AA8C();

      CFRelease(v6);
      goto LABEL_7;
    }
  }
LABEL_8:

  return v6;
}

- (id)numberFromXPCObject:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  CFTypeID v7;
  CFTypeID v8;
  CFTypeID TypeID;
  uint64_t v10;
  NSObject *v11;

  v3 = a3;
  v4 = v3;
  if (!v3)
  {
LABEL_8:
    v6 = 0;
    goto LABEL_9;
  }
  v5 = (void *)_CFXPCCreateCFObjectFromXPCObject(v3);
  v6 = v5;
  if (v5)
  {
    v7 = CFGetTypeID(v5);
    if (v7 != CFNumberGetTypeID())
    {
      v8 = CFGetTypeID(v6);
      TypeID = CFBooleanGetTypeID();
      if (v8 != TypeID)
      {
        v10 = daemon_log(TypeID);
        v11 = objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          sub_10012AAB8();

        CFRelease(v6);
        goto LABEL_8;
      }
    }
  }
LABEL_9:

  return v6;
}

- (id)xpcArrayForSFNodeArray:(id)a3
{
  id v3;
  xpc_object_t v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = a3;
  v4 = xpc_array_create(0, 0);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)_SFNodeXPCObjectCreate(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v9));
        if (v10)
          xpc_array_append_value(v4, v10);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)networkBrowser:(id)a3 nodesChangedForParent:(__SFNode *)a4 protocol:(id)a5 error:(int)a6
{
  void *v6;
  id v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  xpc_object_t v16;
  void *v17;
  void *v18;
  unsigned int v19;
  uint64_t has_entitlement;
  void *v21;
  void *v22;
  unsigned __int8 v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  int IsRoot;
  uint64_t v30;
  void *v31;
  void *v32;
  _xpc_connection_s *v33;
  int v34;
  id v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  __SFNode *v39;
  __int16 v40;
  int v41;

  v11 = a3;
  v12 = a5;
  v13 = daemon_log(v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "kind"));
    v34 = 134218754;
    v35 = v11;
    v36 = 2112;
    v37 = v15;
    v38 = 2048;
    v39 = a4;
    v40 = 1024;
    v41 = a6;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "SFBrowserCallBack (<%p>{kind = %@}, node = %p, error = %d)", (uint8_t *)&v34, 0x26u);

  }
  v16 = xpc_dictionary_create(0, 0, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "isEntitled"));

  if (!v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "kind"));
    v19 = objc_msgSend(v18, "isEqual:", kSFBrowserKindAirDrop);
    if (v19)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "connection"));
      has_entitlement = xpc_connection_has_entitlement(v6, "com.apple.private.airdrop.discovery");
    }
    else
    {
      has_entitlement = 1;
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", has_entitlement));
    objc_msgSend(v11, "setIsEntitled:", v21);

    if (v19)
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "isEntitled"));
  v23 = objc_msgSend(v22, "BOOLValue");

  if ((v23 & 1) != 0)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "childrenForNode:", a4));
    if (!v25)
      goto LABEL_18;
    v26 = objc_claimAutoreleasedReturnValue(-[SharingDaemon xpcArrayForSFNodeArray:](self, "xpcArrayForSFNodeArray:", v25));
    if (v26)
      xpc_dictionary_set_value(v16, "Children", v26);
  }
  else
  {
    v27 = airdrop_log(v24);
    v26 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      sub_10012AAE4(v11, v26);
    v25 = 0;
  }

LABEL_18:
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "kind"));
  if (!objc_msgSend(v28, "isEqual:", kSFBrowserKindNetwork))
  {
    v30 = (uint64_t)v25;
LABEL_24:

    v25 = (void *)v30;
    goto LABEL_25;
  }
  IsRoot = SFNodeIsRoot(a4);

  if (!IsRoot)
    goto LABEL_25;
  v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "sidebarChildren"));

  if (v30)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[SharingDaemon xpcArrayForSFNodeArray:](self, "xpcArrayForSFNodeArray:", v30));
    if (v28)
      xpc_dictionary_set_value(v16, "Sidebar", v28);
    goto LABEL_24;
  }
  v25 = 0;
LABEL_25:
  v31 = (void *)_SFNodeXPCObjectCreate(a4);
  if (v31)
    xpc_dictionary_set_value(v16, "Node", v31);
  if (v12)
  {
    v32 = (void *)_CFXPCCreateXPCObjectFromCFObject(v12);
    if (v32)
      xpc_dictionary_set_value(v16, "Protocol", v32);

  }
  xpc_dictionary_set_int64(v16, "Error", a6);
  v33 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "connection"));
  xpc_connection_send_message(v33, v16);

}

- (void)networkOperation:(id)a3 event:(int64_t)a4 withResults:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  xpc_object_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  SDNetworkOperation *v24;
  SDNetworkOperation *v25;
  SDNetworkOperation *v26;
  void *v27;
  unsigned int v28;
  _BOOL8 v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  const __CFString *v39;
  __int16 v40;
  id v41;

  v8 = a3;
  v9 = a5;
  v10 = daemon_log(v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "kind"));
    v13 = (void *)v12;
    if ((unint64_t)(a4 - 1) > 0xE)
      v14 = CFSTR("?");
    else
      v14 = off_100718220[a4 - 1];
    *(_DWORD *)buf = 134218754;
    v35 = v8;
    v36 = 2112;
    v37 = v12;
    v38 = 2112;
    v39 = v14;
    v40 = 2048;
    v41 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "SFOperationCallBack (<%p>{kind = %@}, event = %@, results = %p)", buf, 0x2Au);

  }
  v15 = xpc_dictionary_create(0, 0, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SharingDaemon xpcObjectForSFOperationResults:](self, "xpcObjectForSFOperationResults:", v9));
  xpc_dictionary_set_uint64(v15, "Events", a4);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "connection"));
  if (v16)
  {
    if (a4 == 1)
    {
      v18 = kSFOperationHTTPServerConnectionKey;
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", kSFOperationHTTPServerConnectionKey));

      if (v19)
      {
        v33 = v18;
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "UUIDString"));

        v32 = kSFOperationContactsOnlyKey;
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:"));
        v23 = objc_retainAutorelease(v21);
        xpc_dictionary_set_string(v16, "Operation", (const char *)objc_msgSend(v23, "UTF8String"));
        v24 = [SDNetworkOperation alloc];
        v25 = -[SDNetworkOperation initWithKind:](v24, "initWithKind:", kSFOperationKindReceiver);
        v26 = v25;
        if (v22)
          -[SDNetworkOperation setProperty:forKey:](v25, "setProperty:forKey:", v22, v32);
        -[SDNetworkOperation setProperty:forKey:](v26, "setProperty:forKey:", sub_10019CD60(v17), kSFOperationBundleIDKey);
        -[SDNetworkOperation setProperty:forKey:](v26, "setProperty:forKey:", v19, v33);
        -[SDNetworkOperation setProperty:forKey:](v26, "setProperty:forKey:", v23, kSFOperationSessionIDKey);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_exportedOperations, "setObject:forKeyedSubscript:", v26, v23);
        -[NSMutableSet addObject:](self->_activeObjects, "addObject:", v26);
        -[SDNetworkOperation setObjectKey:](v26, "setObjectKey:", v23);
        -[SDNetworkOperation setDelegate:](v26, "setDelegate:", self);
        -[SDNetworkOperation resume](v26, "resume");

      }
    }
    xpc_dictionary_set_value(v15, "Results", v16);
  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "kind"));
  v28 = objc_msgSend(v27, "isEqualToString:", kSFOperationKindController);

  if (v28 && !(v29 = -[SharingDaemon canAccessAirDropSettings:](self, "canAccessAirDropSettings:", v17)))
  {
    v30 = airdrop_log(v29);
    v31 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      sub_10012ABD4(v17, v31);

  }
  else
  {
    xpc_connection_send_message((xpc_connection_t)v17, v15);
  }

}

- (void)handleBrowserMessage:(id)a3 forConnection:(id)a4
{
  id v6;
  _xpc_connection_s *v7;
  const char *string;
  const char *v9;
  void *context;
  NSObject *v11;
  xpc_object_t v12;
  NSObject *v13;
  const void *v14;
  uint64_t v15;
  xpc_object_t value;
  xpc_object_t v17;
  uint64_t v18;
  NSObject *v19;
  const void *v20;
  SDNetworkBrowser *v21;
  uint64_t v22;
  xpc_object_t dictionary;
  void *v24;
  NSObject *v25;
  xpc_object_t v26;
  uint64_t uint64;
  void *v28;
  id v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  id v39;
  uint64_t v40;

  v6 = a3;
  v7 = (_xpc_connection_s *)a4;
  string = xpc_dictionary_get_string(v6, "Function");
  if (string)
  {
    v9 = string;
    if (!strcmp(string, "Create"))
    {
      value = xpc_dictionary_get_value(v6, "Kind");
      v11 = objc_claimAutoreleasedReturnValue(value);
      v13 = objc_claimAutoreleasedReturnValue(-[SharingDaemon stringFromXPCObject:](self, "stringFromXPCObject:", v11));
      if (v13)
      {
        v17 = xpc_dictionary_get_value(v6, "Node");
        v18 = objc_claimAutoreleasedReturnValue(v17);
        v19 = v18;
        if (v18 && (v18 = _SFNodeCreateWithXPCObject(0, v18)) != 0)
        {
          v20 = (const void *)v18;
          v21 = -[SDNetworkBrowser initWithKind:rootNode:]([SDNetworkBrowser alloc], "initWithKind:rootNode:", v13, v18);
          xpc_connection_set_context(v7, v21);
          -[NSMutableSet addObject:](self->_activeObjects, "addObject:", v21);
          -[SDNetworkBrowser setConnection:](v21, "setConnection:", v7);
          -[SDNetworkBrowser setBoostMessage:](v21, "setBoostMessage:", v6);
          -[SDNetworkBrowser setDelegate:](v21, "setDelegate:", self);
          CFRelease(v20);

        }
        else
        {
          v32 = daemon_log(v18);
          v33 = objc_claimAutoreleasedReturnValue(v32);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            sub_10012ACAC();

        }
      }
      else
      {
        v34 = daemon_log(0);
        v19 = objc_claimAutoreleasedReturnValue(v34);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          sub_10012AC80();
      }

      goto LABEL_45;
    }
    context = xpc_connection_get_context(v7);
    v11 = objc_claimAutoreleasedReturnValue(context);
    if (!v11)
    {
      v22 = daemon_log(0);
      v13 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_10012ACD8();
      goto LABEL_45;
    }
    v12 = xpc_dictionary_get_value(v6, "Node");
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (v13)
      v14 = (const void *)_SFNodeCreateWithXPCObject(0, v13);
    else
      v14 = 0;
    if (!strcmp(v9, "OpenNode"))
    {
      v26 = xpc_dictionary_get_value(v6, "Protocol");
      v25 = objc_claimAutoreleasedReturnValue(v26);
      uint64 = xpc_dictionary_get_uint64(v6, "Flags");
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[SharingDaemon stringFromXPCObject:](self, "stringFromXPCObject:", v25));
      v29 = -[NSObject openNode:forProtocol:flags:](v11, "openNode:forProtocol:flags:", v14, v28, uint64);
      if ((_DWORD)v29)
      {
        v30 = daemon_log(v29);
        v31 = objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          sub_10012AD04();

      }
    }
    else if (!strcmp(v9, "CloseNode"))
    {
      v35 = -[NSObject closeNode:](v11, "closeNode:", v14);
      if (!(_DWORD)v35)
        goto LABEL_43;
      v36 = daemon_log(v35);
      v25 = objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        sub_10012AD64();
    }
    else if (!strcmp(v9, "AddNode"))
    {
      v37 = -[NSObject addNode:](v11, "addNode:", v14);
      if (!(_DWORD)v37)
        goto LABEL_43;
      v38 = daemon_log(v37);
      v25 = objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        sub_10012ADC4();
    }
    else if (!strcmp(v9, "RemoveNode"))
    {
      v39 = -[NSObject removeNode:](v11, "removeNode:", v14);
      if (!(_DWORD)v39)
        goto LABEL_43;
      v40 = daemon_log(v39);
      v25 = objc_claimAutoreleasedReturnValue(v40);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        sub_10012AE24();
    }
    else
    {
      if (!strcmp(v9, "SetMode"))
      {
        -[NSObject setMode:](v11, "setMode:", xpc_dictionary_get_uint64(v6, "Mode"));
        if (!v14)
          goto LABEL_45;
        goto LABEL_44;
      }
      if (strcmp(v9, "SetOptions"))
      {
LABEL_43:
        if (!v14)
        {
LABEL_45:

          goto LABEL_46;
        }
LABEL_44:
        CFRelease(v14);
        goto LABEL_45;
      }
      dictionary = xpc_dictionary_get_dictionary(v6, "Options");
      v24 = (void *)objc_claimAutoreleasedReturnValue(dictionary);
      v25 = _CFXPCCreateCFObjectFromXPCObject(v24);

      -[NSObject setOptions:](v11, "setOptions:", v25);
    }

    goto LABEL_43;
  }
  v15 = daemon_log(0);
  v11 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    sub_10012AC54();
LABEL_46:

}

- (void)handleOperationMessage:(id)a3 forConnection:(id)a4
{
  id v6;
  _xpc_connection_s *v7;
  const char *string;
  const char *v9;
  void *context;
  NSObject *v11;
  xpc_object_t v12;
  void *v13;
  id v14;
  const void *v15;
  xpc_object_t v16;
  SDNetworkOperation *v17;
  uint64_t v18;
  CGImageRef v19;
  uint64_t v20;
  const char *v21;
  NSMutableDictionary *exportedOperations;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  xpc_object_t value;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  const __CFData *v32;
  const __CFData *v33;
  CFTypeID v34;
  CFTypeID TypeID;
  uint64_t v36;
  NSObject *v37;
  _BOOL8 v38;
  uint64_t v39;
  NSObject *v40;

  v6 = a3;
  v7 = (_xpc_connection_s *)a4;
  string = xpc_dictionary_get_string(v6, "Function");
  if (!string)
  {
    v20 = daemon_log(0);
    v11 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_10012AE84();
    goto LABEL_54;
  }
  v9 = string;
  if (!strcmp(string, "Create"))
  {
    v21 = xpc_dictionary_get_string(v6, "Operation");
    if (!v21)
    {
      value = xpc_dictionary_get_value(v6, "Kind");
      v11 = objc_claimAutoreleasedReturnValue(value);
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[SharingDaemon stringFromXPCObject:](self, "stringFromXPCObject:", v11));
      if (!v13)
      {
        v29 = daemon_log(0);
        v30 = objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          sub_10012AEB0();

        goto LABEL_53;
      }
      v17 = -[SDNetworkOperation initWithKind:]([SDNetworkOperation alloc], "initWithKind:", v13);
      xpc_connection_set_context(v7, v17);
      -[NSMutableSet addObject:](self->_activeObjects, "addObject:", v17);
      -[SDNetworkOperation setConnection:](v17, "setConnection:", v7);
      -[SDNetworkOperation setBoostMessage:](v17, "setBoostMessage:", v6);
      -[SDNetworkOperation setDelegate:](v17, "setDelegate:", self);
LABEL_52:

LABEL_53:
      goto LABEL_54;
    }
    exportedOperations = self->_exportedOperations;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v21));
    v11 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](exportedOperations, "objectForKeyedSubscript:", v23));

    if (v11)
    {
      xpc_connection_set_context(v7, v11);
      -[NSObject setBoostMessage:](v11, "setBoostMessage:", v6);
      -[NSObject setConnection:](v11, "setConnection:", v7);
      goto LABEL_54;
    }
    v28 = daemon_log(v24);
    v26 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      sub_10012AEDC();
LABEL_23:

    goto LABEL_54;
  }
  context = xpc_connection_get_context(v7);
  v11 = objc_claimAutoreleasedReturnValue(context);
  if (!v11)
  {
    v25 = daemon_log(0);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      sub_10012AF08();
    goto LABEL_23;
  }
  if (!strcmp(v9, "Resume"))
  {
    -[NSObject resume](v11, "resume");
  }
  else if (!strcmp(v9, "SetProperty"))
  {
    v12 = xpc_dictionary_get_value(v6, "Name");
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = -[SharingDaemon stringFromXPCObject:](self, "stringFromXPCObject:", v13);
    if (!v14)
    {
      v31 = daemon_log(0);
      v17 = (SDNetworkOperation *)objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(&v17->super, OS_LOG_TYPE_ERROR))
        sub_10012AF34();
      goto LABEL_52;
    }
    v15 = v14;
    v16 = xpc_dictionary_get_value(v6, "Value");
    v17 = (SDNetworkOperation *)objc_claimAutoreleasedReturnValue(v16);
    if (v17)
    {
      if (CFEqual(v15, kSFOperationNodeKey))
      {
        v18 = _SFNodeCreateWithXPCObject(0, v17);
LABEL_10:
        v19 = (CGImageRef)v18;
LABEL_39:
        if ((CFEqual(v15, kSFOperationDiscoverableModeKey)
           || CFEqual(v15, kSFOperationLegacyModeEnabledKey)
           || CFEqual(v15, kSFOperationWirelessEnabledKey)
           || CFEqual(v15, kSFOperationBluetoothEnabledKey)
           || CFEqual(v15, kSFOperationWirelessAccessPointKey)
           || CFEqual(v15, kSFOperationAirplaneModeEnabledKey))
          && !(v38 = -[SharingDaemon canAccessAirDropSettings:](self, "canAccessAirDropSettings:", v7)))
        {
          v39 = airdrop_log(v38);
          v40 = objc_claimAutoreleasedReturnValue(v39);
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
            sub_10012AF60(v7, v40);

        }
        else
        {
          -[NSObject setProperty:forKey:](v11, "setProperty:forKey:", v19, v15);
        }
        if (v19)
          CFRelease(v19);
        goto LABEL_52;
      }
      if (!CFEqual(v15, kSFOperationFileIconKey) && !CFEqual(v15, kSFOperationSmallFileIconKey))
      {
        v18 = _CFXPCCreateCFObjectFromXPCObject(v17);
        goto LABEL_10;
      }
      v32 = (const __CFData *)_CFXPCCreateCFObjectFromXPCObject(v17);
      if (v32)
      {
        v33 = v32;
        v34 = CFGetTypeID(v32);
        TypeID = CFDataGetTypeID();
        if (v34 == TypeID)
        {
          v19 = sub_1000CE310(v33);
        }
        else
        {
          v36 = daemon_log(TypeID);
          v37 = objc_claimAutoreleasedReturnValue(v36);
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
            sub_10012AFE0();

          v19 = 0;
        }
        CFRelease(v33);
        goto LABEL_39;
      }
    }
    v19 = 0;
    goto LABEL_39;
  }
LABEL_54:

}

- (void)handleNewConnection:(id)a3
{
  _xpc_connection_s *v4;
  _xpc_connection_s *v5;
  _QWORD v6[4];
  _xpc_connection_s *v7;
  SharingDaemon *v8;

  v4 = (_xpc_connection_s *)a3;
  xpc_connection_set_target_queue(v4, (dispatch_queue_t)&_dispatch_main_q);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100129920;
  v6[3] = &unk_1007181A0;
  v7 = v4;
  v8 = self;
  v5 = v4;
  xpc_connection_set_event_handler(v5, v6);
  xpc_connection_resume(v5);

}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  SDAirDropService_objc *airDropService;
  void *v11;
  id v12;
  id v13;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;

  v19 = 0;
  NSAppendPrintF(&v19, "\n");
  v3 = v19;
  v18 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "deviceInformation"));
  NSAppendPrintF(&v18, "Device Information: %@\n", v5);
  v6 = v18;

  v17 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDServerBrowser sharedBrowser](SDServerBrowser, "sharedBrowser"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "description"));
  NSAppendPrintF(&v17, "%@\n", v8);
  v9 = v17;

  airDropService = self->_airDropService;
  if (airDropService)
  {
    v16 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropService_objc description](airDropService, "description"));
    NSAppendPrintF(&v16, "%@\n", v11);
    v12 = v16;

    v9 = v12;
  }
  v15 = v9;
  NSAppendPrintF(&v15, "SharingDaemon State End\n");
  v13 = v15;

  return (NSString *)v13;
}

- (os_state_data_s)stateCapture
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  os_state_data_s *v6;
  os_state_data_s *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SharingDaemon description](self, "description"));
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v2, 200, 0, 0));
    v4 = v3;
    if (v3)
    {
      v5 = objc_msgSend(v3, "length");
      v6 = (os_state_data_s *)malloc_type_calloc(1uLL, (size_t)v5 + 200, 0xED4D4DCDuLL);
      v7 = v6;
      if (v6)
      {
        v6->var0 = 1;
        v6->var1.var1 = v5;
        __strlcpy_chk(v6->var3, "SharingDaemon State", 64, 64);
        memcpy(v7->var4, objc_msgSend(objc_retainAutorelease(v4), "bytes"), (size_t)v5);
      }
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)start
{
  void *v3;
  OS_xpc_object *mach_service;
  OS_xpc_object *listener;
  OS_xpc_object *v6;
  void *v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint64_t v14;
  SDUnlockKeyManager *v15;
  SDUnlockKeyManager *unlockKeyManager;
  SDActivityAdvertiser *v17;
  SDActivityAdvertiser *activityAdvertiser;
  SDActivityScanner *v19;
  SDActivityScanner *activityScanner;
  SDActivityEncryptionManager *v21;
  SDActivityEncryptionManager *encryptionManager;
  SDActivityPayloadManager *v23;
  SDActivityPayloadManager *payloadManager;
  uint64_t v25;
  SDAirDropService_objc *v26;
  SDAirDropService_objc *airDropService;
  SDShareSheetSlotManager *v28;
  SDShareSheetSlotManager *sharesheetManager;
  SDShareSheetUserDefaultsServer *v30;
  SDShareSheetUserDefaultsServer *sharesheetUserDefaultsServer;
  SDAccessibilityServer *v32;
  SDAccessibilityServer *accessibilityServer;
  SDShareSheetRecipientServer *v34;
  SDShareSheetRecipientServer *sharesheetRecipientServer;
  SDCollaborationUserDefaultsServer *v36;
  SDCollaborationUserDefaultsServer *collaborationUserDefaultsServer;
  SDSubCredentialAgent *v38;
  SDSubCredentialAgent *subCredentialAgent;
  SDBroadwayAgent *v40;
  SDBroadwayAgent *broadwayAgent;
  SDAutoUnlockSessionManager *v42;
  SDAutoUnlockSessionManager *autoUnlockSessionManager;
  SDHotspotAgent *v44;
  SDHotspotAgent *hotspotAgent;
  SDDeviceAssetMonitor *v46;
  SDDeviceAssetMonitor *deviceAssetMonitor;
  SDPairedDeviceAgent *v48;
  SDPairedDeviceAgent *pairedDeviceAgent;
  SDXPCServer *v50;
  SDXPCServer *xpcServer;
  uint64_t Int64;
  uint64_t v53;
  BOOL v54;
  char v55;
  uint64_t v56;
  NSObject *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  _TtC16DaemoniOSLibrary21SDAirDropAlertManager *v62;
  _TtC16DaemoniOSLibrary21SDAirDropAlertManager *airdropAlertManager;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  uint64_t v69;
  NSObject *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  __CFNotificationCenter *DarwinNotifyCenter;
  _QWORD v80[5];
  _QWORD handler[5];
  uint8_t v82[8];
  uint8_t *v83;
  uint64_t v84;
  uint64_t v85;
  __int128 buf;
  Class (*v87)(uint64_t);
  void *v88;
  uint8_t *v89;

  +[NSURLSession _disableAppSSO](NSURLSession, "_disableAppSSO");
  gSFRunningInSharingD = 1;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDXPCSession sharedSession](SDXPCSession, "sharedSession"));
  objc_msgSend(v3, "start");

  if (!self->_listener)
  {
    mach_service = xpc_connection_create_mach_service("com.apple.sharingd", (dispatch_queue_t)&_dispatch_main_q, 1uLL);
    listener = self->_listener;
    self->_listener = mach_service;

    v6 = self->_listener;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10012A58C;
    handler[3] = &unk_1007181C8;
    handler[4] = self;
    xpc_connection_set_event_handler(v6, handler);
    xpc_connection_resume(self->_listener);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v8 = SFIsDeviceAudioAccessory(v7);
  v9 = v8;
  v10 = daemon_log(v8);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "deviceInformation"));
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Device Information: %@", (uint8_t *)&buf, 0xCu);

  }
  if ((v9 & 1) == 0)
  {
    if (!self->_unlockKeyManager)
    {
      v15 = (SDUnlockKeyManager *)objc_claimAutoreleasedReturnValue(+[SDUnlockKeyManager sharedKeyManager](SDUnlockKeyManager, "sharedKeyManager"));
      unlockKeyManager = self->_unlockKeyManager;
      self->_unlockKeyManager = v15;

    }
    if (!self->_activityAdvertiser)
    {
      v17 = (SDActivityAdvertiser *)objc_claimAutoreleasedReturnValue(+[SDActivityAdvertiser sharedAdvertiser](SDActivityAdvertiser, "sharedAdvertiser"));
      activityAdvertiser = self->_activityAdvertiser;
      self->_activityAdvertiser = v17;

      v13 = -[SDActivityAdvertiser start](self->_activityAdvertiser, "start");
    }
    if (!self->_activityScanner)
    {
      v19 = (SDActivityScanner *)objc_claimAutoreleasedReturnValue(+[SDActivityScanner sharedScanner](SDActivityScanner, "sharedScanner"));
      activityScanner = self->_activityScanner;
      self->_activityScanner = v19;

      v13 = -[SDActivityScanner start](self->_activityScanner, "start");
    }
    if (!self->_encryptionManager)
    {
      v21 = (SDActivityEncryptionManager *)objc_claimAutoreleasedReturnValue(+[SDActivityEncryptionManager sharedEncryptionManager](SDActivityEncryptionManager, "sharedEncryptionManager"));
      encryptionManager = self->_encryptionManager;
      self->_encryptionManager = v21;

    }
    if (!self->_payloadManager)
    {
      v23 = (SDActivityPayloadManager *)objc_claimAutoreleasedReturnValue(+[SDActivityPayloadManager sharedPayloadManager](SDActivityPayloadManager, "sharedPayloadManager"));
      payloadManager = self->_payloadManager;
      self->_payloadManager = v23;

    }
    if (GestaltGetDeviceClass(v13, v14) == 6)
      v25 = _os_feature_enabled_impl("Sharing", "BoopToAction");
    else
      v25 = 1;
    if (!self->_airDropService && (_DWORD)v25)
    {
      v26 = objc_alloc_init(SDAirDropService_objc);
      airDropService = self->_airDropService;
      self->_airDropService = v26;

      v25 = (uint64_t)-[SDAirDropService_objc start](self->_airDropService, "start");
    }
    if (!self->_sharesheetManager)
    {
      v28 = (SDShareSheetSlotManager *)objc_claimAutoreleasedReturnValue(+[SDShareSheetSlotManager sharedManager](SDShareSheetSlotManager, "sharedManager"));
      sharesheetManager = self->_sharesheetManager;
      self->_sharesheetManager = v28;

      v25 = (uint64_t)-[SDShareSheetSlotManager activate](self->_sharesheetManager, "activate");
    }
    if (!self->_sharesheetUserDefaultsServer)
    {
      v30 = objc_alloc_init(SDShareSheetUserDefaultsServer);
      sharesheetUserDefaultsServer = self->_sharesheetUserDefaultsServer;
      self->_sharesheetUserDefaultsServer = v30;

      v25 = (uint64_t)-[SDShareSheetUserDefaultsServer activate](self->_sharesheetUserDefaultsServer, "activate");
    }
    if (!self->_accessibilityServer)
    {
      v32 = objc_alloc_init(SDAccessibilityServer);
      accessibilityServer = self->_accessibilityServer;
      self->_accessibilityServer = v32;

      v25 = (uint64_t)-[SDAccessibilityServer activate](self->_accessibilityServer, "activate");
    }
    if (!self->_sharesheetRecipientServer)
    {
      v34 = objc_alloc_init(SDShareSheetRecipientServer);
      sharesheetRecipientServer = self->_sharesheetRecipientServer;
      self->_sharesheetRecipientServer = v34;

      v25 = (uint64_t)-[SDShareSheetRecipientServer activate](self->_sharesheetRecipientServer, "activate");
    }
    if (!self->_collaborationUserDefaultsServer)
    {
      v36 = objc_alloc_init(SDCollaborationUserDefaultsServer);
      collaborationUserDefaultsServer = self->_collaborationUserDefaultsServer;
      self->_collaborationUserDefaultsServer = v36;

      v25 = (uint64_t)-[SDXPCDaemon _activate](self->_collaborationUserDefaultsServer, "_activate");
    }
    if (!self->_subCredentialAgent)
    {
      v38 = (SDSubCredentialAgent *)objc_claimAutoreleasedReturnValue(+[SDSubCredentialAgent sharedAgent](SDSubCredentialAgent, "sharedAgent"));
      subCredentialAgent = self->_subCredentialAgent;
      self->_subCredentialAgent = v38;

      v25 = (uint64_t)-[SDSubCredentialAgent activate](self->_subCredentialAgent, "activate");
    }
    if (!self->_broadwayAgent)
    {
      v40 = (SDBroadwayAgent *)objc_claimAutoreleasedReturnValue(+[SDBroadwayAgent sharedAgent](SDBroadwayAgent, "sharedAgent"));
      broadwayAgent = self->_broadwayAgent;
      self->_broadwayAgent = v40;

      v25 = (uint64_t)-[SDBroadwayAgent activate](self->_broadwayAgent, "activate");
    }
    if (!self->_autoUnlockSessionManager)
    {
      v42 = (SDAutoUnlockSessionManager *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockSessionManager sharedManager](SDAutoUnlockSessionManager, "sharedManager"));
      autoUnlockSessionManager = self->_autoUnlockSessionManager;
      self->_autoUnlockSessionManager = v42;

      v25 = (uint64_t)-[SDAutoUnlockSessionManager start](self->_autoUnlockSessionManager, "start");
    }
    if (!self->_hotspotAgent && (SFIsDeviceAppleTV(v25) & 1) == 0)
    {
      v44 = (SDHotspotAgent *)objc_claimAutoreleasedReturnValue(+[SDHotspotAgent sharedAgent](SDHotspotAgent, "sharedAgent"));
      hotspotAgent = self->_hotspotAgent;
      self->_hotspotAgent = v44;

      -[SDHotspotAgent activate](self->_hotspotAgent, "activate");
    }
    if (!self->_deviceAssetMonitor)
    {
      v46 = (SDDeviceAssetMonitor *)objc_claimAutoreleasedReturnValue(+[SDDeviceAssetMonitor sharedAssetMonitor](SDDeviceAssetMonitor, "sharedAssetMonitor"));
      deviceAssetMonitor = self->_deviceAssetMonitor;
      self->_deviceAssetMonitor = v46;

    }
    if (!self->_pairedDeviceAgent)
    {
      v48 = (SDPairedDeviceAgent *)objc_claimAutoreleasedReturnValue(+[SDPairedDeviceAgent sharedAgent](SDPairedDeviceAgent, "sharedAgent"));
      pairedDeviceAgent = self->_pairedDeviceAgent;
      self->_pairedDeviceAgent = v48;

      -[SDPairedDeviceAgent activate](self->_pairedDeviceAgent, "activate");
    }

  }
  if (!self->_xpcServer)
  {
    v50 = objc_alloc_init(SDXPCServer);
    xpcServer = self->_xpcServer;
    self->_xpcServer = v50;

    LODWORD(buf) = 0;
    Int64 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("highPriorityQueue"), &buf);
    if ((_DWORD)buf)
    {
      v54 = Int64 != 0;
      Int64 = GestaltGetDeviceClass(Int64, v53);
      v55 = (_DWORD)Int64 == 6 || v54;
      if ((v55 & 1) == 0)
        goto LABEL_57;
    }
    else if (!Int64)
    {
LABEL_57:
      -[SDXPCServer activate](self->_xpcServer, "activate");
      goto LABEL_58;
    }
    v56 = daemon_log(Int64);
    v57 = objc_claimAutoreleasedReturnValue(v56);
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v82 = 0;
      _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "SharingServices using high priority queue", v82, 2u);
    }

    v60 = SFHighPriorityQueue(v58, v59);
    v61 = (void *)objc_claimAutoreleasedReturnValue(v60);
    -[SDXPCServer setDispatchQueue:](self->_xpcServer, "setDispatchQueue:", v61);

    goto LABEL_57;
  }
LABEL_58:
  if (!self->_stateHandle)
  {
    v80[0] = _NSConcreteStackBlock;
    v80[1] = 3221225472;
    v80[2] = sub_10012A65C;
    v80[3] = &unk_100714CC0;
    v80[4] = self;
    self->_stateHandle = os_state_add_handler(&_dispatch_main_q, v80);
  }
  if (objc_msgSend(v7, "isAirDropAvailable") && !self->_airdropAlertManager)
  {
    v62 = objc_opt_new(_TtC16DaemoniOSLibrary21SDAirDropAlertManager);
    airdropAlertManager = self->_airdropAlertManager;
    self->_airdropAlertManager = v62;

    -[SDAirDropAlertManager activate](self->_airdropAlertManager, "activate");
  }
  v64 = (void *)objc_claimAutoreleasedReturnValue(+[SDB332SetupAgent shared](_TtC16DaemoniOSLibrary16SDB332SetupAgent, "shared"));
  objc_msgSend(v64, "activate");

  v65 = (void *)objc_claimAutoreleasedReturnValue(+[SDB389SetupAgent shared](_TtC16DaemoniOSLibrary16SDB389SetupAgent, "shared"));
  objc_msgSend(v65, "activate");

  v66 = (void *)objc_claimAutoreleasedReturnValue(+[SDHUDManager shared](SDHUDManager, "shared"));
  objc_msgSend(v66, "start");

  *(_QWORD *)v82 = 0;
  v83 = v82;
  v84 = 0x2050000000;
  v67 = (void *)qword_1007C6A28;
  v85 = qword_1007C6A28;
  if (!qword_1007C6A28)
  {
    *(_QWORD *)&buf = _NSConcreteStackBlock;
    *((_QWORD *)&buf + 1) = 3221225472;
    v87 = sub_10012A984;
    v88 = &unk_100714258;
    v89 = v82;
    sub_10012A984((uint64_t)&buf);
    v67 = (void *)*((_QWORD *)v83 + 3);
  }
  v68 = objc_retainAutorelease(v67);
  _Block_object_dispose(v82, 8);
  if (qword_1007C6A20 == -1)
  {
    if (!v68)
      goto LABEL_70;
  }
  else
  {
    dispatch_once(&qword_1007C6A20, &stru_1007181E8);
    if (!v68)
      goto LABEL_70;
  }
  if (byte_1007B21B8)
  {
    v70 = objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "sharedInstance"));
    -[NSObject start](v70, "start");
    goto LABEL_72;
  }
LABEL_70:
  v71 = daemon_log(v69);
  v70 = objc_claimAutoreleasedReturnValue(v71);
  if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
    sub_10012B190(v70, v72, v73, v74, v75, v76, v77, v78);
LABEL_72:

  -[SharingDaemon _performMigrations](self, "_performMigrations");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.sharingd.daemon.started"), 0, 0, 1u);

}

- (void)_performMigrations
{
  +[_UIActivityUserDefaults migrateUserActivityOrderIfNecessary](_UIActivityUserDefaults, "migrateUserActivityOrderIfNecessary");
}

- (void)stop
{
  SDXPCServer *xpcServer;
  SDXPCServer *v4;
  SDDeviceAssetMonitor *deviceAssetMonitor;
  SDPairedDeviceAgent *pairedDeviceAgent;
  SDActivityScanner *activityScanner;
  SDActivityScanner *v8;
  SDActivityAdvertiser *activityAdvertiser;
  SDActivityAdvertiser *v10;
  SDActivityEncryptionManager *encryptionManager;
  SDActivityPayloadManager *payloadManager;
  SDBroadwayAgent *broadwayAgent;
  SDBroadwayAgent *v14;
  SDAirDropService_objc *airDropService;
  SDAirDropService_objc *v16;
  SDShareSheetSlotManager *sharesheetManager;
  SDShareSheetSlotManager *v18;
  SDAccessibilityServer *accessibilityServer;
  SDAccessibilityServer *v20;
  SDShareSheetUserDefaultsServer *sharesheetUserDefaultsServer;
  SDShareSheetUserDefaultsServer *v22;
  SDShareSheetRecipientServer *sharesheetRecipientServer;
  SDShareSheetRecipientServer *v24;
  SDCollaborationUserDefaultsServer *collaborationUserDefaultsServer;
  SDCollaborationUserDefaultsServer *v26;
  OS_xpc_object *listener;
  OS_xpc_object *v28;
  unint64_t stateHandle;

  xpcServer = self->_xpcServer;
  if (xpcServer)
  {
    -[SDXPCServer invalidate](xpcServer, "invalidate");
    v4 = self->_xpcServer;
    self->_xpcServer = 0;

  }
  deviceAssetMonitor = self->_deviceAssetMonitor;
  if (deviceAssetMonitor)
  {
    self->_deviceAssetMonitor = 0;

  }
  pairedDeviceAgent = self->_pairedDeviceAgent;
  if (pairedDeviceAgent)
  {
    self->_pairedDeviceAgent = 0;

    -[SDPairedDeviceAgent invalidate](self->_pairedDeviceAgent, "invalidate");
  }
  activityScanner = self->_activityScanner;
  if (activityScanner)
  {
    -[SDActivityScanner stop](activityScanner, "stop");
    v8 = self->_activityScanner;
    self->_activityScanner = 0;

  }
  activityAdvertiser = self->_activityAdvertiser;
  if (activityAdvertiser)
  {
    -[SDActivityAdvertiser stop](activityAdvertiser, "stop");
    v10 = self->_activityAdvertiser;
    self->_activityAdvertiser = 0;

  }
  encryptionManager = self->_encryptionManager;
  if (encryptionManager)
  {
    self->_encryptionManager = 0;

  }
  payloadManager = self->_payloadManager;
  if (payloadManager)
  {
    self->_payloadManager = 0;

  }
  broadwayAgent = self->_broadwayAgent;
  if (broadwayAgent)
  {
    -[SDBroadwayAgent invalidate](broadwayAgent, "invalidate");
    v14 = self->_broadwayAgent;
    self->_broadwayAgent = 0;

  }
  airDropService = self->_airDropService;
  if (airDropService)
  {
    -[SDAirDropService_objc stop](airDropService, "stop");
    v16 = self->_airDropService;
    self->_airDropService = 0;

  }
  sharesheetManager = self->_sharesheetManager;
  if (sharesheetManager)
  {
    -[SDShareSheetSlotManager invalidate](sharesheetManager, "invalidate");
    v18 = self->_sharesheetManager;
    self->_sharesheetManager = 0;

  }
  accessibilityServer = self->_accessibilityServer;
  if (accessibilityServer)
  {
    -[SDAccessibilityServer invalidate](accessibilityServer, "invalidate");
    v20 = self->_accessibilityServer;
    self->_accessibilityServer = 0;

  }
  sharesheetUserDefaultsServer = self->_sharesheetUserDefaultsServer;
  if (sharesheetUserDefaultsServer)
  {
    -[SDShareSheetUserDefaultsServer invalidate](sharesheetUserDefaultsServer, "invalidate");
    v22 = self->_sharesheetUserDefaultsServer;
    self->_sharesheetUserDefaultsServer = 0;

  }
  sharesheetRecipientServer = self->_sharesheetRecipientServer;
  if (sharesheetRecipientServer)
  {
    -[SDShareSheetRecipientServer invalidate](sharesheetRecipientServer, "invalidate");
    v24 = self->_sharesheetRecipientServer;
    self->_sharesheetRecipientServer = 0;

  }
  collaborationUserDefaultsServer = self->_collaborationUserDefaultsServer;
  if (collaborationUserDefaultsServer)
  {
    -[SDXPCDaemon _invalidate](collaborationUserDefaultsServer, "_invalidate");
    v26 = self->_collaborationUserDefaultsServer;
    self->_collaborationUserDefaultsServer = 0;

  }
  listener = self->_listener;
  if (listener)
  {
    xpc_connection_cancel(listener);
    v28 = self->_listener;
    self->_listener = 0;

  }
  stateHandle = self->_stateHandle;
  if (stateHandle)
  {
    os_state_remove_handler(stateHandle, a2);
    self->_stateHandle = 0;
  }
  -[NSMutableSet removeAllObjects](self->_activeObjects, "removeAllObjects");
}

- (BOOL)canAccessAirDropSettings:(id)a3
{
  return xpc_connection_has_entitlement(a3, "com.apple.private.airdrop.settings");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_helperConnection, 0);
  objc_storeStrong((id *)&self->_xpcServer, 0);
  objc_storeStrong((id *)&self->_unlockLockManager, 0);
  objc_storeStrong((id *)&self->_unlockKeyManager, 0);
  objc_storeStrong((id *)&self->_payloadManager, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_pairedDeviceAgent, 0);
  objc_storeStrong((id *)&self->_airdropAlertManager, 0);
  objc_storeStrong((id *)&self->_deviceAssetMonitor, 0);
  objc_storeStrong((id *)&self->_hotspotAgent, 0);
  objc_storeStrong((id *)&self->_exportedOperations, 0);
  objc_storeStrong((id *)&self->_encryptionManager, 0);
  objc_storeStrong((id *)&self->_autoUnlockSessionManager, 0);
  objc_storeStrong((id *)&self->_sharesheetManager, 0);
  objc_storeStrong((id *)&self->_broadwayAgent, 0);
  objc_storeStrong((id *)&self->_subCredentialAgent, 0);
  objc_storeStrong((id *)&self->_collaborationUserDefaultsServer, 0);
  objc_storeStrong((id *)&self->_sharesheetRecipientServer, 0);
  objc_storeStrong((id *)&self->_accessibilityServer, 0);
  objc_storeStrong((id *)&self->_sharesheetUserDefaultsServer, 0);
  objc_storeStrong((id *)&self->_airDropService, 0);
  objc_storeStrong((id *)&self->_activityScanner, 0);
  objc_storeStrong((id *)&self->_activityAdvertiser, 0);
  objc_storeStrong((id *)&self->_activeObjects, 0);
}

@end
