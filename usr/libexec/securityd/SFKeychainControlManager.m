@implementation SFKeychainControlManager

- (id)_init
{
  SFKeychainControlManager *v2;
  uint64_t v3;
  NSXPCListener *listener;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFKeychainControlManager;
  v2 = -[SFKeychainControlManager init](&v6, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSXPCListener anonymousListener](NSXPCListener, "anonymousListener"));
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v3;

    -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
    -[NSXPCListener resume](v2->_listener, "resume");
  }
  return v2;
}

- (id)xpcControlEndpoint
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCListener endpoint](self->_listener, "endpoint"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_endpoint"));

  return v3;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  BOOL v10;
  const void *v11;
  NSObject *v12;
  _DWORD v14[2];
  __int16 v15;
  const __CFString *v16;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForEntitlement:", CFSTR("com.apple.private.keychain.keychaincontrol")));
  v7 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0 && (objc_msgSend(v6, "BOOLValue") & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SecXPCHelper safeErrorClasses](SecXPCHelper, "safeErrorClasses"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___SFKeychainControl));
    v10 = 1;
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v8, "rpcFindCorruptedItemsWithReply:", 1, 1);
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v8, "rpcDeleteCorruptedItemsWithReply:", 1, 1);
    objc_msgSend(v5, "setExportedInterface:", v9);
    objc_msgSend(v5, "setExportedObject:", self);
    objc_msgSend(v5, "resume");

  }
  else
  {
    v11 = sub_10000EF14("SecError");
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v14[0] = 67109378;
      v14[1] = objc_msgSend(v5, "processIdentifier");
      v15 = 2112;
      v16 = CFSTR("com.apple.private.keychain.keychaincontrol");
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "SFKeychainControl: Client pid (%d) doesn't have entitlement: %@", (uint8_t *)v14, 0x12u);
    }

    v10 = 0;
  }

  return v10;
}

- (id)findCorruptedItemsWithError:(id *)a3
{
  id v3;
  OSStatus v4;
  __CFString *v5;
  OSStatus v6;
  __CFString *v7;
  const __CFDictionary *v8;
  OSStatus v9;
  OSStatus v10;
  __CFString *v11;
  id v12;
  _QWORD *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  const __CFDictionary *v21;
  id v22;
  const __CFDictionary *v23;
  const __CFDictionary *v24;
  _QWORD v26[4];
  id v27;
  OSStatus v28;
  __CFString *v29;
  CFTypeRef v30;
  CFTypeRef v31;
  __CFString *v32;
  CFTypeRef v33;
  __CFString *v34;
  CFTypeRef result;
  _QWORD v36[3];
  _QWORD v37[3];
  _QWORD v38[4];
  _QWORD v39[4];
  _QWORD v40[4];
  _QWORD v41[4];
  _QWORD v42[4];
  _QWORD v43[4];
  _QWORD v44[4];
  _QWORD v45[4];

  v22 = objc_alloc_init((Class)NSMutableArray);
  v3 = objc_alloc_init((Class)NSMutableArray);
  result = 0;
  v44[0] = kSecClass;
  v44[1] = kSecReturnPersistentRef;
  v45[0] = kSecClassGenericPassword;
  v45[1] = &__kCFBooleanTrue;
  v44[2] = kSecUseDataProtectionKeychain;
  v44[3] = kSecMatchLimit;
  v45[2] = &__kCFBooleanTrue;
  v45[3] = kSecMatchLimitAll;
  v24 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v45, v44, 4));
  v4 = SecItemCopyMatching(v24, &result);
  v34 = 0;
  if (v4 != -25300)
  {
    sub_100019F20(v4, &v34, CFSTR("generic password query failed"));
    v5 = v34;
    if (v34)
    {
      objc_msgSend(v3, "addObject:", v34);

    }
  }
  v33 = 0;
  v42[0] = kSecClass;
  v42[1] = kSecReturnPersistentRef;
  v43[0] = kSecClassInternetPassword;
  v43[1] = &__kCFBooleanTrue;
  v42[2] = kSecUseDataProtectionKeychain;
  v42[3] = kSecMatchLimit;
  v43[2] = &__kCFBooleanTrue;
  v43[3] = kSecMatchLimitAll;
  v23 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v43, v42, 4));
  v6 = SecItemCopyMatching(v23, &v33);
  v32 = 0;
  if (v6 != -25300)
  {
    sub_100019F20(v6, &v32, CFSTR("internet password query failed"));
    v7 = v32;
    if (v32)
    {
      objc_msgSend(v3, "addObject:", v32);

    }
  }
  v31 = 0;
  v40[0] = kSecClass;
  v40[1] = kSecReturnPersistentRef;
  v41[0] = kSecClassKey;
  v41[1] = &__kCFBooleanTrue;
  v40[2] = kSecUseDataProtectionKeychain;
  v40[3] = kSecMatchLimit;
  v41[2] = &__kCFBooleanTrue;
  v41[3] = kSecMatchLimitAll;
  v21 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v41, v40, 4));
  SecItemCopyMatching(v21, &v31);
  v30 = 0;
  v38[0] = kSecClass;
  v38[1] = kSecReturnPersistentRef;
  v39[0] = kSecClassCertificate;
  v39[1] = &__kCFBooleanTrue;
  v38[2] = kSecUseDataProtectionKeychain;
  v38[3] = kSecMatchLimit;
  v39[2] = &__kCFBooleanTrue;
  v39[3] = kSecMatchLimitAll;
  v8 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v39, v38, 4));
  v9 = SecItemCopyMatching(v8, &v30);
  v10 = v9;
  v29 = 0;
  if (v9 != -25300)
  {
    sub_100019F20(v9, &v29, CFSTR("certificate query failed"));
    v11 = v29;
    if (v29)
    {
      objc_msgSend(v3, "addObject:", v29);

    }
  }
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1000781C4;
  v26[3] = &unk_1002DC3E0;
  v28 = v10;
  v12 = v22;
  v27 = v12;
  v13 = objc_retainBlock(v26);
  ((void (*)(_QWORD *, CFTypeRef, const CFStringRef))v13[2])(v13, result, kSecClassGenericPassword);
  ((void (*)(_QWORD *, CFTypeRef, const CFStringRef))v13[2])(v13, v33, kSecClassInternetPassword);
  ((void (*)(_QWORD *, CFTypeRef, const CFStringRef))v13[2])(v13, v31, kSecClassKey);
  ((void (*)(_QWORD *, CFTypeRef, const CFStringRef))v13[2])(v13, v30, kSecClassCertificate);
  v14 = objc_msgSend(v3, "count");
  if (a3 && v14)
  {
    v36[0] = NSLocalizedDescriptionKey;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("encountered %d errors searching for corrupted items"), objc_msgSend(v3, "count")));
    v37[0] = v15;
    v36[1] = NSUnderlyingErrorKey;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));
    v37[1] = v16;
    v36[2] = CFSTR("searchingErrorCount");
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "count")));
    v37[2] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v37, v36, 3));
    *a3 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.security.keychainhealth"), 1, v18));

  }
  v19 = v12;

  return v19;
}

- (BOOL)deleteCorruptedItemsWithError:(id *)a3
{
  void *v4;
  id v5;
  BOOL v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  OSStatus v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  id v25;
  NSErrorUserInfoKey v26;
  void *v27;
  _BYTE v28[128];

  v25 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SFKeychainControlManager findCorruptedItemsWithError:](self, "findCorruptedItemsWithError:", &v25));
  v5 = v25;
  v6 = v5 == 0;
  v7 = objc_alloc_init((Class)NSMutableArray);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v13 = SecItemDelete(*(CFDictionaryRef *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i));
        if (v13)
        {
          v20 = 0;
          sub_100019F20(v13, &v20, CFSTR("failed to delete corrupted item"));
          v14 = v20;
          objc_msgSend(v7, "addObject:", v20);

          v6 = 0;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
    }
    while (v10);
  }

  if (a3 && (v5 || objc_msgSend(v7, "count")))
  {
    v26 = NSLocalizedDescriptionKey;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userInfo"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("searchingErrorCount")));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("encountered %@ errors searching for corrupted items and %d errors attempting to delete corrupted items"), v16, objc_msgSend(v7, "count")));
    v27 = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1));
    *a3 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.security.keychainhealth"), 2, v18));

  }
  return v6;
}

- (void)rpcFindCorruptedItemsWithReply:(id)a3
{
  void (**v4)(id, void *, id);
  void *v5;
  id v6;
  id v7;

  v7 = 0;
  v4 = (void (**)(id, void *, id))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SFKeychainControlManager findCorruptedItemsWithError:](self, "findCorruptedItemsWithError:", &v7));
  v6 = v7;
  v4[2](v4, v5, v6);

}

- (void)rpcDeleteCorruptedItemsWithReply:(id)a3
{
  void (**v4)(id, _BOOL8, id);
  _BOOL8 v5;
  id v6;
  id v7;

  v7 = 0;
  v4 = (void (**)(id, _BOOL8, id))a3;
  v5 = -[SFKeychainControlManager deleteCorruptedItemsWithError:](self, "deleteCorruptedItemsWithError:", &v7);
  v6 = v7;
  v4[2](v4, v5, v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
}

+ (id)sharedManager
{
  if (qword_100340F48 != -1)
    dispatch_once(&qword_100340F48, &stru_1002DC3B8);
  return (id)qword_100340F40;
}

@end
