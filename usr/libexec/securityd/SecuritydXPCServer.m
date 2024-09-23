@implementation SecuritydXPCServer

- (void)SecItemAddAndNotifyOnSync:(id)a3 syncCallback:(id)a4 complete:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  SecOSTransactionHolder *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD *v21;
  SecurityClient *p_client;
  CFTypeRef v23;
  __int128 v24;
  __int128 v25;
  CFTypeID v26;
  CFTypeRef v27;
  CFTypeRef v28;
  CFTypeRef v29;
  CFTypeID v30;
  void *v31;
  void *v32;
  __int128 v33;
  CFTypeRef v34[2];
  __int128 v35;
  __int128 v36;
  _QWORD v37[4];
  id v38;
  id v39;
  CFTypeRef v40;
  CFTypeRef cf;
  _QWORD v42[4];
  id v43;

  v8 = a3;
  v9 = a4;
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_10002EA7C;
  v42[3] = &unk_1002DADA8;
  v10 = a5;
  v43 = v10;
  v11 = objc_retainBlock(v42);
  cf = 0;
  if (-[SecuritydXPCServer clientHasBooleanEntitlement:](self, "clientHasBooleanEntitlement:", CFSTR("com.apple.private.keychain.deny")))
  {
    sub_100019F20(-25291, (__CFString **)&cf, CFSTR("SecItemAddAndNotifyOnSync: %@ has entitlement %@"), self->_client.task, CFSTR("com.apple.private.keychain.deny"));
    goto LABEL_21;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSViewManager manager](CKKSViewManager, "manager"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "completedSecCKKSInitialize"));
  objc_msgSend(v13, "wait:", 10);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", kSecAttrDeriveSyncIDFromItemAttributes));
  if (v14
    || (v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", kSecAttrPCSPlaintextServiceIdentifier))) != 0
    || (v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", kSecAttrPCSPlaintextPublicKey))) != 0)
  {

  }
  else
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", kSecAttrPCSPlaintextPublicIdentity));

    if (!v31)
      goto LABEL_8;
  }
  if (!-[SecuritydXPCServer clientHasBooleanEntitlement:](self, "clientHasBooleanEntitlement:", CFSTR("com.apple.private.ckks.plaintextfields")))
  {
    sub_100019F20(-34018, (__CFString **)&cf, CFSTR("SecItemAddAndNotifyOnSync: %@ does not have entitlement %@, but is using SPI anyway"), self->_client.task, CFSTR("com.apple.private.ckks.plaintextfields"));
    goto LABEL_21;
  }
LABEL_8:
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", kSecDataInetExtraNotes));
  if (v15
    || (v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", kSecDataInetExtraHistory))) != 0
    || (v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", kSecDataInetExtraClientDefined0))) != 0
    || (v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", kSecDataInetExtraClientDefined1))) != 0
    || (v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", kSecDataInetExtraClientDefined2))) != 0)
  {

  }
  else
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", kSecDataInetExtraClientDefined3));

    if (!v32)
      goto LABEL_15;
  }
  if (!-[SecuritydXPCServer clientHasBooleanEntitlement:](self, "clientHasBooleanEntitlement:", CFSTR("com.apple.private.keychain.inet_expansion_fields")))
  {
    sub_100019F20(-34018, (__CFString **)&cf, CFSTR("SecItemAddAndNotifyOnSync: %@ does not have entitlement %@"), self->_client.task, CFSTR("com.apple.private.keychain.inet_expansion_fields"));
LABEL_21:
    ((void (*)(_QWORD *, _QWORD, _QWORD, CFTypeRef))v11[2])(v11, 0, 0, cf);
    v23 = cf;
    if (cf)
    {
      cf = 0;
      CFRelease(v23);
    }
    goto LABEL_23;
  }
LABEL_15:
  v40 = 0;
  v16 = objc_msgSend(v8, "mutableCopy");
  v17 = [SecOSTransactionHolder alloc];
  v18 = (void *)os_transaction_create("com.apple.securityd.SecItemAddAndNotifyOnSync-callback");
  v19 = -[SecOSTransactionHolder init:](v17, "init:", v18);

  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_10002EAF4;
  v37[3] = &unk_1002DADD0;
  v38 = v9;
  v20 = v19;
  v39 = v20;
  v21 = objc_retainBlock(v37);
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v21, CFSTR("f_ckkscallback"));

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  *(_OWORD *)v34 = 0u;
  if (qword_1003412C8 != -1)
    dispatch_once(&qword_1003412C8, &stru_1002E7860);
  p_client = &self->_client;
  if (byte_1003412C0)
  {
    SecSecurityFixUpClientWithPersona(p_client, &v33);
  }
  else
  {
    v24 = *(_OWORD *)&self->_client.allowSystemKeychain;
    v33 = *(_OWORD *)&p_client->task;
    *(_OWORD *)v34 = v24;
    v25 = *(_OWORD *)&self->_client.applicationIdentifier;
    v35 = *(_OWORD *)&self->_client.keybag;
    v36 = v25;
  }
  sub_10001C1F0((const __CFDictionary *)v16, (uint64_t)&v33, (uint64_t)&v40, (__CFString **)&cf);
  if (v40)
  {
    v26 = CFGetTypeID(v40);
    if (v26 == CFDictionaryGetTypeID())
    {
      ((void (*)(_QWORD *, CFTypeRef, _QWORD, CFTypeRef))v11[2])(v11, v40, 0, cf);
    }
    else
    {
      v30 = CFGetTypeID(v40);
      if (v30 == CFArrayGetTypeID())
        ((void (*)(_QWORD *, _QWORD, CFTypeRef, CFTypeRef))v11[2])(v11, 0, v40, cf);
      else
        ((void (*)(_QWORD *, _QWORD, _QWORD, _QWORD))v11[2])(v11, 0, 0, 0);
    }
  }
  else
  {
    ((void (*)(_QWORD *, _QWORD, _QWORD, CFTypeRef))v11[2])(v11, 0, 0, cf);
  }
  v27 = v40;
  if (v40)
  {
    v40 = 0;
    CFRelease(v27);
  }
  v28 = cf;
  if (cf)
  {
    cf = 0;
    CFRelease(v28);
  }
  if (qword_1003412C8 != -1)
    dispatch_once(&qword_1003412C8, &stru_1002E7860);
  if (byte_1003412C0)
  {
    v29 = v34[1];
    if (v34[1])
    {
      v34[1] = 0;
      CFRelease(v29);
    }
  }

LABEL_23:
}

- (void)secItemSetCurrentItemAcrossAllDevices:(id)a3 newCurrentItemHash:(id)a4 accessGroup:(id)a5 identifier:(id)a6 viewHint:(id)a7 oldCurrentItemReference:(id)a8 oldCurrentItemHash:(id)a9 complete:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD *v23;
  CFTypeRef v24;
  __CFString *v25;
  id v26;
  SecurityClient *p_client;
  __CFArray *accessGroups;
  void *v29;
  void *v30;
  id v31;
  const void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  const void *v37;
  NSObject *v38;
  void *v39;
  id v40;
  const __CFString *v41;
  uint8_t buf[16];
  CFTypeRef cf;
  _QWORD v44[4];
  id v45;

  v16 = a3;
  v17 = a4;
  v41 = (const __CFString *)a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_10002EA34;
  v44[3] = &unk_1002DEF60;
  v22 = a10;
  v45 = v22;
  v23 = objc_retainBlock(v44);
  cf = 0;
  if (-[SecuritydXPCServer clientHasBooleanEntitlement:](self, "clientHasBooleanEntitlement:", CFSTR("com.apple.private.keychain.deny")))
  {
    sub_100019F20(-25291, (__CFString **)&cf, CFSTR("SecItemSetCurrentItemAcrossAllDevices: %@ has entitlement %@"), self->_client.task, CFSTR("com.apple.private.keychain.deny"));
    ((void (*)(_QWORD *, CFTypeRef))v23[2])(v23, cf);
    v24 = cf;
    v25 = (__CFString *)v41;
    if (!cf)
      goto LABEL_14;
    goto LABEL_13;
  }
  v40 = v21;
  v26 = v19;
  p_client = &self->_client;
  if (-[SecuritydXPCServer clientHasBooleanEntitlement:](self, "clientHasBooleanEntitlement:", CFSTR("com.apple.private.ckks.currentitempointers_write")))
  {
    accessGroups = self->_client.accessGroups;
    v25 = (__CFString *)v41;
    if ((sub_100014DCC(accessGroups, v41, (uint64_t)p_client) & 1) != 0)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSViewManager manager](CKKSViewManager, "manager"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "completedSecCKKSInitialize"));
      v31 = objc_msgSend(v30, "wait:", 10);

      if (v31)
      {
        v32 = sub_10000EF14("SecError");
        v33 = objc_claimAutoreleasedReturnValue(v32);
        v19 = v26;
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "SecItemSetCurrentItemAcrossAllDevices: CKKSViewManager not initialized?", buf, 2u);
        }

        v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("CKKSErrorDomain"), 9, CFSTR("CKKS not yet initialized")));
        ((void (*)(_QWORD *, void *))v23[2])(v23, v34);

        v21 = v40;
        v25 = (__CFString *)v41;
      }
      else
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSViewManager manager](CKKSViewManager, "manager"));
        v36 = v35;
        v19 = v26;
        if (v35)
        {
          v21 = v40;
          objc_msgSend(v35, "setCurrentItemForAccessGroup:hash:accessGroup:identifier:viewHint:replacing:hash:complete:", v16, v17, v41, v18, v19, v20, v40, v23);
        }
        else
        {
          v37 = sub_10000EF14("SecError");
          v38 = objc_claimAutoreleasedReturnValue(v37);
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "SecItemSetCurrentItemAcrossAllDevices: no view manager?", buf, 2u);
          }

          v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("CKKSErrorDomain"), 9, CFSTR("No view manager, cannot forward request")));
          ((void (*)(_QWORD *, void *))v23[2])(v23, v39);

          v21 = v40;
        }

        v25 = (__CFString *)v41;
      }
      goto LABEL_14;
    }
    sub_100019F20(-34018, (__CFString **)&cf, CFSTR("SecItemSetCurrentItemAcrossAllDevices: client is missing access-group %@: %@"), v41, p_client->task);
    ((void (*)(_QWORD *, CFTypeRef))v23[2])(v23, cf);
    v24 = cf;
  }
  else
  {
    sub_100019F20(-34018, (__CFString **)&cf, CFSTR("SecItemSetCurrentItemAcrossAllDevices: %@ does not have entitlement %@"), p_client->task, CFSTR("com.apple.private.ckks.currentitempointers_write"));
    ((void (*)(_QWORD *, CFTypeRef))v23[2])(v23, cf);
    v24 = cf;
    v25 = (__CFString *)v41;
  }
  v21 = v40;
  if (v24)
  {
LABEL_13:
    cf = 0;
    CFRelease(v24);
  }
LABEL_14:

}

- (void)secItemUnsetCurrentItemsAcrossAllDevices:(id)a3 identifiers:(id)a4 viewHint:(id)a5 complete:(id)a6
{
  __CFString *v10;
  id v11;
  id v12;
  id v13;
  _QWORD *v14;
  SecurityClient *p_client;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  const void *v20;
  NSObject *v21;
  const __CFString *v22;
  const __CFString *v23;
  CFTypeRef v24;
  const void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  const __CFString *task;
  uint8_t buf[16];
  CFTypeRef cf;
  _QWORD v32[4];
  id v33;

  v10 = (__CFString *)a3;
  v11 = a4;
  v12 = a5;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_10002E9EC;
  v32[3] = &unk_1002DEF60;
  v13 = a6;
  v33 = v13;
  v14 = objc_retainBlock(v32);
  cf = 0;
  if (-[SecuritydXPCServer clientHasBooleanEntitlement:](self, "clientHasBooleanEntitlement:", CFSTR("com.apple.private.keychain.deny")))
  {
    sub_100019F20(-25291, (__CFString **)&cf, CFSTR("SecItemUnsetCurrentItemsAcrossAllDevices: %@ has entitlement %@"), self->_client.task, CFSTR("com.apple.private.keychain.deny"));
    goto LABEL_13;
  }
  p_client = &self->_client;
  if (-[SecuritydXPCServer clientHasBooleanEntitlement:](self, "clientHasBooleanEntitlement:", CFSTR("com.apple.private.ckks.currentitempointers_write")))
  {
    if ((sub_100014DCC(self->_client.accessGroups, v10, (uint64_t)&self->_client) & 1) != 0)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSViewManager manager](CKKSViewManager, "manager"));
      v17 = v16;
      if (v16)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "completedSecCKKSInitialize"));
        v19 = objc_msgSend(v18, "wait:", 10);

        if (!v19)
        {
          objc_msgSend(v17, "unsetCurrentItemsForAccessGroup:identifiers:viewHint:complete:", v10, v11, v12, v14);
          goto LABEL_21;
        }
        v20 = sub_10000EF14("SecError");
        v21 = objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "SecItemUnsetCurrentItemsAcrossAllDevices: CKKSViewManager not initialized?", buf, 2u);
        }

        v22 = CFSTR("CKKS not yet initialized");
      }
      else
      {
        v25 = sub_10000EF14("SecError");
        v26 = objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "SecItemUnsetCurrentItemsAcrossAllDevices: no view manager?", buf, 2u);
        }

        v22 = CFSTR("No view manager, cannot forward request");
      }
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("CKKSErrorDomain"), 9, v22));
      ((void (*)(_QWORD *, void *))v14[2])(v14, v27);

LABEL_21:
      goto LABEL_15;
    }
    v28 = v10;
    task = (const __CFString *)p_client->task;
    v23 = CFSTR("SecItemUnsetCurrentItemsAcrossAllDevices: client is missing access-group %@: %@");
  }
  else
  {
    v28 = p_client->task;
    task = CFSTR("com.apple.private.ckks.currentitempointers_write");
    v23 = CFSTR("SecItemUnsetCurrentItemsAcrossAllDevices: %@ does not have entitlement %@");
  }
  sub_100019F20(-34018, (__CFString **)&cf, v23, v28, task);
LABEL_13:
  ((void (*)(_QWORD *, CFTypeRef))v14[2])(v14, cf);
  v24 = cf;
  if (cf)
  {
    cf = 0;
    CFRelease(v24);
  }
LABEL_15:

}

- (void)secItemFetchCurrentItemAcrossAllDevices:(id)a3 identifier:(id)a4 viewHint:(id)a5 fetchCloudValue:(BOOL)a6 complete:(id)a7
{
  _BOOL4 v8;
  __CFString *v12;
  id v13;
  id v14;
  id v15;
  _QWORD *v16;
  SecurityClient *p_client;
  void *v18;
  void *v19;
  id v20;
  const void *v21;
  NSObject *v22;
  void *v23;
  CFTypeRef v24;
  SecurityClient *v25;
  void *v26;
  _BOOL4 v27;
  void *v28;
  _QWORD v29[4];
  __CFString *v30;
  id v31;
  SecuritydXPCServer *v32;
  _QWORD *v33;
  SecurityClient *v34;
  uint8_t buf[8];
  CFTypeRef cf;
  _QWORD v37[4];
  id v38;

  v8 = a6;
  v12 = (__CFString *)a3;
  v13 = a4;
  v14 = a5;
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_10002E5E4;
  v37[3] = &unk_1002DADF8;
  v15 = a7;
  v38 = v15;
  v16 = objc_retainBlock(v37);
  cf = 0;
  if (-[SecuritydXPCServer clientHasBooleanEntitlement:](self, "clientHasBooleanEntitlement:", CFSTR("com.apple.private.keychain.deny")))
  {
    sub_100019F20(-25291, (__CFString **)&cf, CFSTR("SecItemFetchCurrentItemAcrossAllDevices: %@ has entitlement %@"), self->_client.task, CFSTR("com.apple.private.keychain.deny"));
    goto LABEL_10;
  }
  p_client = &self->_client;
  if (!-[SecuritydXPCServer clientHasBooleanEntitlement:](self, "clientHasBooleanEntitlement:", CFSTR("com.apple.private.ckks.currentitempointers_read")))
  {
    sub_100019F20(-25291, (__CFString **)&cf, CFSTR("SecItemFetchCurrentItemAcrossAllDevices: %@ does not have entitlement %@"), p_client->task, CFSTR("com.apple.private.ckks.currentitempointers_read"));
    goto LABEL_10;
  }
  if ((sub_100014DCC(self->_client.accessGroups, v12, (uint64_t)&self->_client) & 1) == 0)
  {
    sub_100019F20(-34018, (__CFString **)&cf, CFSTR("SecItemFetchCurrentItemAcrossAllDevices: client is missing access-group %@: %@"), v12, p_client->task);
LABEL_10:
    ((void (*)(_QWORD *, _QWORD, _QWORD, CFTypeRef))v16[2])(v16, 0, 0, cf);
    v24 = cf;
    if (cf)
    {
      cf = 0;
      CFRelease(v24);
    }
    goto LABEL_12;
  }
  v27 = v8;
  v28 = v13;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSViewManager manager](CKKSViewManager, "manager"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "completedSecCKKSInitialize"));
  v20 = objc_msgSend(v19, "wait:", 10);

  if (v20)
  {
    v21 = sub_10000EF14("SecError");
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "SecItemFetchCurrentItemAcrossAllDevices: CKKSViewManager not initialized?", buf, 2u);
    }

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("CKKSErrorDomain"), 9, CFSTR("CKKS not yet initialized")));
    ((void (*)(_QWORD *, _QWORD, _QWORD, void *))v16[2])(v16, 0, 0, v23);

    v13 = v28;
  }
  else
  {
    if (qword_1003412C8 != -1)
      dispatch_once(&qword_1003412C8, &stru_1002E7860);
    if (byte_1003412C0)
    {
      v25 = (SecurityClient *)malloc_type_malloc(0x40uLL, 0x1060040B1A58C1AuLL);
      SecSecurityFixUpClientWithPersona(&self->_client, v25);
      p_client = v25;
    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSViewManager manager](CKKSViewManager, "manager"));
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10002E65C;
    v29[3] = &unk_1002DAE48;
    v30 = v12;
    v31 = v28;
    v33 = v16;
    v34 = p_client;
    v32 = self;
    objc_msgSend(v26, "getCurrentItemForAccessGroup:identifier:viewHint:fetchCloudValue:complete:", v30, v31, v14, v27, v29);

    v13 = v28;
  }
LABEL_12:

}

- (void)secItemFetchCurrentItemOutOfBand:(id)a3 forceFetch:(BOOL)a4 complete:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  _QWORD *v10;
  void *v11;
  __CFString *v12;
  CFTypeRef v13;
  void *v14;
  void *v15;
  id v16;
  const void *v17;
  NSObject *v18;
  void *v19;
  void *p_client;
  CFTypeRef v21;
  void *v22;
  __CFString *v23;
  _QWORD v24[4];
  id v25;
  _QWORD *v26;
  void *v27;
  uint8_t buf[8];
  CFTypeRef cf;
  _QWORD v30[4];
  id v31;

  v6 = a4;
  v8 = a3;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10002E420;
  v30[3] = &unk_1002DEFD8;
  v9 = a5;
  v31 = v9;
  v10 = objc_retainBlock(v30);
  cf = 0;
  if (-[SecuritydXPCServer clientHasBooleanEntitlement:](self, "clientHasBooleanEntitlement:", CFSTR("com.apple.private.keychain.deny")))
  {
    sub_100019F20(-25291, (__CFString **)&cf, CFSTR("secItemFetchCurrentItemOutOfBand: %@ has entitlement %@"), self->_client.task, CFSTR("com.apple.private.keychain.deny"));
    goto LABEL_9;
  }
  if (-[SecuritydXPCServer clientHasBooleanEntitlement:](self, "clientHasBooleanEntitlement:", CFSTR("com.apple.private.ckks.currentitempointers_read")))
  {
    if (objc_msgSend(v8, "count")
      && (v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", 0)),
          v12 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "accessGroup")),
          v11,
          v12))
    {
      if ((sub_100014DCC(self->_client.accessGroups, v12, (uint64_t)&self->_client) & 1) == 0)
      {
        sub_100019F20(-34018, (__CFString **)&cf, CFSTR("secItemFetchCurrentItemOutOfBand: client is missing access-group %@: %@"), v12, self->_client.task);
        ((void (*)(_QWORD *, _QWORD, CFTypeRef))v10[2])(v10, 0, cf);
        v21 = cf;
        if (cf)
        {
          cf = 0;
          CFRelease(v21);
        }
        goto LABEL_24;
      }
      v23 = v12;
    }
    else
    {
      v23 = 0;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSViewManager manager](CKKSViewManager, "manager"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "completedSecCKKSInitialize"));
    v16 = objc_msgSend(v15, "wait:", 10);

    if (v16)
    {
      v17 = sub_10000EF14("SecError");
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "secItemFetchCurrentItemOutOfBand: CKKSViewManager not initialized?", buf, 2u);
      }

      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("CKKSErrorDomain"), 9, CFSTR("CKKS not yet initialized")));
      ((void (*)(_QWORD *, _QWORD, void *))v10[2])(v10, 0, v19);

      v12 = v23;
    }
    else
    {
      if (qword_1003412C8 != -1)
        dispatch_once(&qword_1003412C8, &stru_1002E7860);
      v12 = v23;
      if (byte_1003412C0)
      {
        p_client = malloc_type_malloc(0x40uLL, 0x1060040B1A58C1AuLL);
        SecSecurityFixUpClientWithPersona(&self->_client, p_client);
      }
      else
      {
        p_client = &self->_client;
      }
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSViewManager manager](CKKSViewManager, "manager"));
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_10002E484;
      v24[3] = &unk_1002DAE70;
      v25 = v8;
      v26 = v10;
      v27 = p_client;
      objc_msgSend(v22, "getCurrentItemOutOfBand:forceFetch:complete:", v25, v6, v24);

    }
LABEL_24:

    goto LABEL_25;
  }
  sub_100019F20(-25291, (__CFString **)&cf, CFSTR("secItemFetchCurrentItemOutOfBand: %@ does not have entitlement %@"), self->_client.task, CFSTR("com.apple.private.ckks.currentitempointers_read"));
LABEL_9:
  ((void (*)(_QWORD *, _QWORD, CFTypeRef))v10[2])(v10, 0, cf);
  v13 = cf;
  if (cf)
  {
    cf = 0;
    CFRelease(v13);
  }
LABEL_25:

}

- (void)secItemFetchPCSIdentityByKeyOutOfBand:(id)a3 forceFetch:(BOOL)a4 complete:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  _QWORD *v10;
  CFTypeRef v11;
  void *v12;
  __CFString *v13;
  CFTypeRef v14;
  void *v15;
  void *v16;
  id v17;
  const void *v18;
  NSObject *v19;
  void *v20;
  void *p_client;
  void *v22;
  _QWORD v23[4];
  id v24;
  _QWORD *v25;
  void *v26;
  uint8_t buf[8];
  CFTypeRef cf;
  _QWORD v29[4];
  id v30;

  v6 = a4;
  v8 = a3;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10002E25C;
  v29[3] = &unk_1002DEFD8;
  v9 = a5;
  v30 = v9;
  v10 = objc_retainBlock(v29);
  cf = 0;
  if (!-[SecuritydXPCServer clientHasBooleanEntitlement:](self, "clientHasBooleanEntitlement:", CFSTR("com.apple.private.keychain.deny")))
  {
    if (objc_msgSend(v8, "count"))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", 0));
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "accessGroup"));

      if (v13 && (sub_100014DCC(self->_client.accessGroups, v13, (uint64_t)&self->_client) & 1) == 0)
      {
        sub_100019F20(-34018, (__CFString **)&cf, CFSTR("secItemFetchPCSIdentityByKeyOutOfBand: client is missing access-group %@: %@"), v13, self->_client.task);
        ((void (*)(_QWORD *, _QWORD, CFTypeRef))v10[2])(v10, 0, cf);
        v14 = cf;
        if (cf)
        {
          cf = 0;
          CFRelease(v14);
        }
LABEL_20:

        goto LABEL_21;
      }
    }
    else
    {
      v13 = 0;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSViewManager manager](CKKSViewManager, "manager"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "completedSecCKKSInitialize"));
    v17 = objc_msgSend(v16, "wait:", 10);

    if (v17)
    {
      v18 = sub_10000EF14("SecError");
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "secItemFetchPCSIdentityByKeyOutOfBand: CKKSViewManager not initialized?", buf, 2u);
      }

      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("CKKSErrorDomain"), 9, CFSTR("CKKS not yet initialized")));
      ((void (*)(_QWORD *, _QWORD, void *))v10[2])(v10, 0, v20);

    }
    else
    {
      if (qword_1003412C8 != -1)
        dispatch_once(&qword_1003412C8, &stru_1002E7860);
      if (byte_1003412C0)
      {
        p_client = malloc_type_malloc(0x40uLL, 0x1060040B1A58C1AuLL);
        SecSecurityFixUpClientWithPersona(&self->_client, p_client);
      }
      else
      {
        p_client = &self->_client;
      }
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSViewManager manager](CKKSViewManager, "manager"));
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_10002E2C0;
      v23[3] = &unk_1002DAE70;
      v24 = v8;
      v25 = v10;
      v26 = p_client;
      objc_msgSend(v22, "fetchPCSIdentityOutOfBand:forceFetch:complete:", v24, v6, v23);

    }
    goto LABEL_20;
  }
  sub_100019F20(-25291, (__CFString **)&cf, CFSTR("secItemFetchPCSIdentityByKeyOutOfBand: %@ has entitlement %@"), self->_client.task, CFSTR("com.apple.private.keychain.deny"));
  ((void (*)(_QWORD *, _QWORD, CFTypeRef))v10[2])(v10, 0, cf);
  v11 = cf;
  if (cf)
  {
    cf = 0;
    CFRelease(v11);
  }
LABEL_21:

}

- (void)findItemPersistentRefByUUID:(id)a3 extraLoggingString:(id)a4 client:(SecurityClient *)a5 complete:(id)a6
{
  __CFString **v9;
  __CFString ***v10;
  uint64_t v11;
  CFTypeRef v12;
  __CFString **v13;
  const void *v14;
  NSObject *v15;
  void *v16;
  const void *v17;
  CFTypeRef v18;
  CFTypeRef v19;
  _QWORD *v20;
  id v21;
  id v22;
  id v23;
  CFTypeRef v24;
  CFTypeRef cf;
  _QWORD v26[4];
  id v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  CFTypeRef v33;
  __int16 v34;
  CFTypeRef v35;
  _QWORD v36[5];
  _QWORD v37[5];

  v23 = a3;
  v22 = a4;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10002E1F8;
  v26[3] = &unk_1002DAE98;
  v21 = a6;
  v27 = v21;
  v20 = objc_retainBlock(v26);
  v24 = 0;
  cf = 0;
  v9 = &off_1002E2190;
  v10 = off_1002E4320;
  v11 = kSecAttrUUID;
  while (1)
  {
    if (*((_BYTE *)v9 + 8))
    {
      v12 = cf;
      if (cf)
      {
        cf = 0;
        CFRelease(v12);
      }
      v36[0] = kSecClass;
      v37[0] = **(v10 - 1);
      v37[1] = kSecAttrSynchronizableAny;
      v36[1] = kSecAttrSynchronizable;
      v36[2] = kSecMatchLimit;
      v37[2] = kSecMatchLimitOne;
      v37[3] = v23;
      v36[3] = v11;
      v36[4] = kSecReturnPersistentRef;
      v37[4] = &__kCFBooleanTrue;
      sub_1000109C4((const __CFDictionary *)+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v37, v36, 5), (uint64_t)a5, (uint64_t *)&v24, (__CFString **)&cf);
      if (!cf)
      {
        if (v24)
          goto LABEL_15;
        goto LABEL_10;
      }
      if (CFErrorGetCode((CFErrorRef)cf) != -25300 || v24)
        break;
    }
LABEL_10:
    v13 = *v10++;
    v9 = v13;
    if (!v13)
      goto LABEL_11;
  }
  if (!v24 || cf)
  {
LABEL_11:
    v14 = sub_10000EF14("SecError");
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      v16 = v22;
      v29 = v22;
      v30 = 2112;
      v31 = v23;
      v32 = 2112;
      v33 = v24;
      v34 = 2112;
      v35 = cf;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "ckkscurrent: No current item for (%@,%@): %@ %@", buf, 0x2Au);
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_15:
  v17 = sub_10000EF14("ckkscurrent");
  v15 = objc_claimAutoreleasedReturnValue(v17);
  if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
LABEL_16:
    v16 = v22;
    goto LABEL_17;
  }
  *(_DWORD *)buf = 138412546;
  v16 = v22;
  v29 = v22;
  v30 = 2112;
  v31 = v23;
  _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Found current item for (%@: %@)", buf, 0x16u);
LABEL_17:

  ((void (*)(_QWORD *, CFTypeRef, CFTypeRef))v20[2])(v20, v24, cf);
  v18 = v24;
  if (v24)
  {
    v24 = 0;
    CFRelease(v18);
  }
  v19 = cf;
  if (cf)
  {
    cf = 0;
    CFRelease(v19);
  }

}

- (void)secItemDigest:(id)a3 accessGroup:(id)a4 complete:(id)a5
{
  id v8;
  __CFString *v9;
  void (**v10)(id, _QWORD, __CFString *);
  SecurityClient *p_client;
  __CFArray *accessGroups;
  __CFArray *v13;
  const __CFDictionary *v14;
  __CFString *v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  const void **v19;
  const void *v20;
  __CFString *v21;
  CFTypeRef v22;
  __CFString *v23;
  CFTypeRef v24;
  _QWORD v25[8];
  __int128 v26;
  CFTypeRef cf[2];
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __CFString **v35;
  uint64_t v36;
  __CFString *v37;
  _QWORD v38[4];
  _QWORD v39[4];
  CFRange v40;

  v8 = a3;
  v9 = (__CFString *)a4;
  v10 = (void (**)(id, _QWORD, __CFString *))a5;
  p_client = &self->_client;
  accessGroups = self->_client.accessGroups;
  v34 = 0;
  v35 = (__CFString **)&v34;
  v36 = 0x2020000000;
  v37 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  if (!v8 || !v9)
  {
    sub_100019F20(-50, &v37, CFSTR("parameter missing: %@"), p_client->task);
    v10[2](v10, 0, v35[3]);
    v15 = v35[3];
    if (!v15)
      goto LABEL_38;
LABEL_18:
    v35[3] = 0;
    CFRelease(v15);
    goto LABEL_38;
  }
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("inet")) & 1) == 0
    && (objc_msgSend(v8, "isEqualToString:", CFSTR("genp")) & 1) == 0)
  {
    sub_100019F20(-50, v35 + 3, CFSTR("class %@ is not supported: %@"), v8, p_client->task);
    v10[2](v10, 0, v35[3]);
    v15 = v35[3];
    if (!v15)
      goto LABEL_38;
    goto LABEL_18;
  }
  if ((sub_100014DCC(accessGroups, v9, (uint64_t)p_client) & 1) == 0)
  {
    sub_100019F20(-34018, v35 + 3, CFSTR("Client is missing access-group %@: %@"), v9, p_client->task);
    v10[2](v10, 0, v35[3]);
    v15 = v35[3];
    if (!v15)
      goto LABEL_38;
    goto LABEL_18;
  }
  v40.length = CFArrayGetCount(accessGroups);
  v40.location = 0;
  if (CFArrayContainsValue(accessGroups, v40, CFSTR("*")))
    v13 = 0;
  else
    v13 = accessGroups;
  v38[0] = kSecClass;
  v38[1] = kSecAttrAccessGroup;
  v39[0] = v8;
  v39[1] = v9;
  v38[2] = kSecAttrSynchronizable;
  v38[3] = kSecReturnPersistentRef;
  v39[2] = kSecAttrSynchronizableAny;
  v39[3] = &__kCFBooleanTrue;
  v14 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v39, v38, 4));
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  *(_OWORD *)cf = 0u;
  if (qword_1003412C8 != -1)
    dispatch_once(&qword_1003412C8, &stru_1002E7860);
  if (byte_1003412C0)
  {
    SecSecurityFixUpClientWithPersona(p_client, &v26);
  }
  else
  {
    v16 = *(_OWORD *)&p_client->allowSystemKeychain;
    v26 = *(_OWORD *)&p_client->task;
    *(_OWORD *)cf = v16;
    v17 = *(_OWORD *)&p_client->applicationIdentifier;
    v28 = *(_OWORD *)&p_client->keybag;
    v29 = v17;
  }
  v18 = sub_1000112B0(v14, cf[1], 0, (uint64_t)&v26, v35 + 3);
  if (v18)
  {
    v19 = (const void **)v18;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10002E154;
    v25[3] = &unk_1002DAEC0;
    v25[6] = v18;
    v25[7] = v13;
    v25[4] = &v30;
    v25[5] = &v34;
    sub_100011A30(0, 1, 0, (uint64_t)(v35 + 3), (uint64_t)v25);
    v10[2](v10, v31[3], v35[3]);
    sub_100011108(v19, (CFErrorRef *)v35 + 3);
    v20 = (const void *)v31[3];
    if (v20)
    {
      v31[3] = 0;
      CFRelease(v20);
    }
    v21 = v35[3];
    if (v21)
    {
      v35[3] = 0;
      CFRelease(v21);
    }
    if (qword_1003412C8 != -1)
      dispatch_once(&qword_1003412C8, &stru_1002E7860);
    if (byte_1003412C0)
    {
      v22 = cf[1];
      if (cf[1])
      {
        cf[1] = 0;
        CFRelease(v22);
      }
    }
  }
  else
  {
    sub_100019F20(-50, v35 + 3, CFSTR("failed to build query: %@"), (_QWORD)v26);
    v10[2](v10, 0, v35[3]);
    v23 = v35[3];
    if (v23)
    {
      v35[3] = 0;
      CFRelease(v23);
    }
    if (qword_1003412C8 != -1)
      dispatch_once(&qword_1003412C8, &stru_1002E7860);
    if (byte_1003412C0)
    {
      v24 = cf[1];
      if (cf[1])
      {
        cf[1] = 0;
        CFRelease(v24);
      }
    }
  }

LABEL_38:
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);

}

- (void)secKeychainDeleteMultiuser:(id)a3 complete:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, __CFString *);
  __CFString *v8;
  id v9;
  __CFString **v10;
  uint64_t v11;
  __CFString *v12;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  __CFString **v17;
  uint64_t v18;
  uint64_t v19;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, __CFString *))a4;
  v16 = 0;
  v17 = (__CFString **)&v16;
  v18 = 0x2020000000;
  v19 = 0;
  if (-[SecuritydXPCServer clientHasBooleanEntitlement:](self, "clientHasBooleanEntitlement:", CFSTR("com.apple.keychain.multiuser-admin")))
  {
    sub_100019F20(-25291, v17 + 3, CFSTR("secKeychainDeleteMultiuser: %@ need entitlement %@"), self->_client.task, CFSTR("com.apple.keychain.multiuser-admin"));
    v7[2](v7, 0, v17[3]);
    v8 = v17[3];
    if (v8)
      goto LABEL_9;
  }
  else
  {
    v9 = objc_msgSend(v6, "length");
    v10 = v17;
    if (v9 == (id)16)
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_10002E138;
      v13[3] = &unk_1002DAEE8;
      v14 = v6;
      v15 = &v16;
      v11 = sub_100011A30(1, 1, 0, (uint64_t)(v10 + 3), (uint64_t)v13);
      v7[2](v7, v11, v17[3]);
      v12 = v17[3];
      if (v12)
      {
        v17[3] = 0;
        CFRelease(v12);
      }

    }
    else
    {
      sub_100019F20(-25291, v17 + 3, CFSTR("secKeychainDeleteMultiuser: %@ uuid have wrong length: %d"), self->_client.task, objc_msgSend(v6, "length"));
      v7[2](v7, 0, v17[3]);
      v8 = v17[3];
      if (v8)
      {
LABEL_9:
        v17[3] = 0;
        CFRelease(v8);
      }
    }
  }
  _Block_object_dispose(&v16, 8);

}

- (void)secItemDeleteForAppClipApplicationIdentifier:(id)a3 completion:(id)a4
{
  void (**v6)(id, uint64_t);
  uint64_t v7;
  id v8;

  v8 = a3;
  v6 = (void (**)(id, uint64_t))a4;
  if (-[SecuritydXPCServer clientHasBooleanEntitlement:](self, "clientHasBooleanEntitlement:", CFSTR("com.apple.private.keychain.appclipdeletion")))
  {
    v7 = sub_10012F430((uint64_t)v8);
  }
  else
  {
    v7 = 4294933278;
  }
  v6[2](v6, v7);

}

- (void)secItemPersistKeychainWritesAtHighPerformanceCost:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  const void *v5;
  NSObject *v6;
  const void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  const void *v11;
  uint64_t v12;
  const void *v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint8_t buf[4];
  uint64_t v20;

  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  if (-[SecuritydXPCServer clientHasBooleanEntitlement:](self, "clientHasBooleanEntitlement:", CFSTR("com.apple.private.keychain.performance_impacting_api")))
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x2020000000;
    v18 = 0;
    v5 = sub_10000EF14("item");
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Performing keychain database checkpoint", buf, 2u);
    }

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10002E0E4;
    v14[3] = &unk_1002DAF10;
    v14[4] = &v15;
    if ((sub_100011A30(1, 1, 0, (uint64_t)(v16 + 3), (uint64_t)v14) & 1) != 0)
    {
      v7 = sub_10000EF14("item");
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Keychain database checkpoint succeeded", buf, 2u);
      }
      v9 = 0;
    }
    else
    {
      v11 = sub_10000EF14("SecError");
      v8 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v12 = v16[3];
        *(_DWORD *)buf = 138412290;
        v20 = v12;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "item: keychain database checkpoint failed: %@", buf, 0xCu);
      }
      v9 = 4294941020;
    }

    v4[2](v4, v9, v16[3]);
    v13 = (const void *)v16[3];
    if (v13)
    {
      v16[3] = 0;
      CFRelease(v13);
    }
    _Block_object_dispose(&v15, 8);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, -34018, 0));
    ((void (**)(id, uint64_t, void *))v4)[2](v4, 4294933278, v10);

  }
}

- (void)secItemPromoteItemsForAppClip:(id)a3 toParentApp:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, uint64_t);
  NSObject *v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  CFDictionaryRef v25;
  char v26;
  char v27;
  const void *v28;
  int v29;
  NSObject *v30;
  _BOOL4 v31;
  uint64_t Code;
  uint64_t v33;
  const void *v34;
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  __CFDictionary *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  uint8_t v48[4];
  uint64_t v49;
  _BYTE buf[24];
  void *v51;
  uint64_t *v52;
  uint64_t *v53;
  uint64_t *v54;
  CFDictionaryRef v55;

  v35 = a3;
  v8 = a4;
  v9 = (void (**)(id, uint64_t))a5;
  if (-[SecuritydXPCServer clientHasBooleanEntitlement:](self, "clientHasBooleanEntitlement:", CFSTR("com.apple.private.keychain.appclipdeletion")))
  {
    v10 = sub_10000EF14("item");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v35;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Request to promote keychain items for app clip '%@' to parent app '%@'", buf, 0x16u);
    }
    v44 = 0;
    v45 = &v44;
    v46 = 0x2000000000;
    v47 = 0;
    v40 = 0;
    v41 = &v40;
    v42 = 0x2000000000;
    v43 = 1;
    v36 = 0;
    v37 = &v36;
    v38 = 0x2000000000;
    v39 = (__CFDictionary *)0xAAAAAAAAAAAAAAAALL;
    v39 = sub_100104F4C(kCFAllocatorDefault, v11, v12, v13, v14, v15, v16, v17, (void *)kSecAttrAccessGroup, (uint64_t)v35);
    v25 = sub_10012E96C(kCFAllocatorDefault, v18, v19, v20, v21, v22, v23, v24, (uint64_t)CFSTR("clip"), (uint64_t)kCFBooleanFalse);
    *(_QWORD *)buf = _NSConcreteStackBlock;
    *(_QWORD *)&buf[8] = 0x40000000;
    *(_QWORD *)&buf[16] = sub_10012F824;
    v51 = &unk_1002DFA70;
    v52 = &v44;
    v53 = &v36;
    v54 = &v40;
    v55 = v25;
    v26 = sub_100011A30(1, 1, 0, (uint64_t)(v45 + 3), (uint64_t)buf);
    if (*((_BYTE *)v41 + 24))
      v27 = v26;
    else
      v27 = 0;
    *((_BYTE *)v41 + 24) = v27;
    v28 = (const void *)v37[3];
    if (v28)
    {
      v37[3] = 0;
      CFRelease(v28);
    }
    if (v25)
      CFRelease(v25);
    v29 = *((unsigned __int8 *)v41 + 24);
    v30 = sub_10000EF14("item");
    v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
    if (v29)
    {
      if (v31)
      {
        *(_WORD *)v48 = 0;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Promotion reports success, now deleting leftover app clip items", v48, 2u);
      }
      Code = sub_10012F430((uint64_t)v35);
    }
    else
    {
      if (v31)
      {
        v33 = v45[3];
        *(_DWORD *)v48 = 138412290;
        v49 = v33;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "App clip item promotion failed: %@", v48, 0xCu);
      }
      Code = CFErrorGetCode((CFErrorRef)v45[3]);
      v34 = (const void *)v45[3];
      if (v34)
      {
        v45[3] = 0;
        CFRelease(v34);
      }
    }
    _Block_object_dispose(&v36, 8);
    _Block_object_dispose(&v40, 8);
    _Block_object_dispose(&v44, 8);
  }
  else
  {
    Code = 4294933278;
  }
  v9[2](v9, Code);

}

- (void)secKeychainForceUpgradeIfNeeded:(id)a3
{
  void (**v3)(id, uint64_t);
  const void *v4;
  NSObject *v5;
  const void *v6;
  NSObject *v7;
  uint64_t v8;
  const void *v9;
  uint64_t v10;
  uint8_t buf[4];
  uint64_t v12;

  v10 = 0;
  v3 = (void (**)(id, uint64_t))a3;
  v4 = sub_10000EF14("secKeychainForceUpgradeIfNeeded");
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Performing keychain database upgrade if needed", buf, 2u);
  }

  if ((sub_100011A30(0, 1, 0, (uint64_t)&v10, (uint64_t)&stru_1002DAF50) & 1) != 0)
  {
    v6 = sub_10000EF14("secKeychainForceUpgradeIfNeeded");
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "succeeded", buf, 2u);
    }
    v8 = 0;
  }
  else
  {
    v9 = sub_10000EF14("SecError");
    v7 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v10;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "secKeychainForceUpgradeIfNeeded: failed: %@", buf, 0xCu);
    }
    v8 = 4294941020;
  }

  v3[2](v3, v8);
}

- (SecuritydXPCServer)initWithConnection:(id)a3
{
  id v4;
  SecuritydXPCServer *v5;
  SecuritydXPCServer *v6;
  int v7;
  SecuritydXPCServer *v8;
  objc_super v10[2];
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SecuritydXPCServer;
  v5 = -[SecuritydXPCServer init](&v11, "init");
  v6 = v5;
  if (!v5)
    goto LABEL_6;
  objc_storeWeak((id *)&v5->_connection, v4);
  v7 = objc_msgSend(v4, "effectiveUserIdentifier");
  if (v4)
    objc_msgSend(v4, "auditToken");
  else
    memset(v10, 0, sizeof(v10));
  if (!sub_10000F094((uint64_t)&v6->_client, v7, v10))
    v8 = 0;
  else
LABEL_6:
    v8 = v6;

  return v8;
}

- (SecuritydXPCServer)initWithSecurityClient:(SecurityClient *)a3
{
  void *v3;
  SecuritydXPCServer *v4;
  SecuritydXPCServer *v5;
  __SecTask *v6;
  __CFArray *v7;
  unsigned int v8;
  __CFData *v9;
  __CFString *v10;
  objc_super v12;

  v3 = a3;
  if (a3)
  {
    v12.receiver = self;
    v12.super_class = (Class)SecuritydXPCServer;
    v4 = -[SecuritydXPCServer init](&v12, "init");
    v5 = v4;
    if (v4)
    {
      objc_storeWeak((id *)&v4->_connection, 0);
      v6 = *(__SecTask **)v3;
      if (*(_QWORD *)v3)
        CFRetain(*(CFTypeRef *)v3);
      v5->_client.task = v6;
      v7 = (__CFArray *)*((_QWORD *)v3 + 1);
      if (v7)
        CFRetain(*((CFTypeRef *)v3 + 1));
      v5->_client.accessGroups = v7;
      v8 = *((_DWORD *)v3 + 5);
      *(_DWORD *)&v5->_client.allowSystemKeychain = *((_DWORD *)v3 + 4);
      v5->_client.uid = v8;
      v9 = (__CFData *)*((_QWORD *)v3 + 3);
      if (v9)
        CFRetain(*((CFTypeRef *)v3 + 3));
      v5->_client.musr = v9;
      v5->_client.keybag = *((_DWORD *)v3 + 8);
      v5->_client.inEduMode = *((_BYTE *)v3 + 36);
      v5->_client.activeUser = *((_DWORD *)v3 + 10);
      v10 = (__CFString *)*((_QWORD *)v3 + 6);
      if (v10)
        CFRetain(*((CFTypeRef *)v3 + 6));
      v5->_client.applicationIdentifier = v10;
      v5->_client.isAppClip = *((_BYTE *)v3 + 44);
      v5->_client.allowKeychainSharing = *((_BYTE *)v3 + 57);
    }
    self = v5;
    v3 = self;
  }

  return (SecuritydXPCServer *)v3;
}

- (BOOL)clientHasBooleanEntitlement:(id)a3
{
  return sub_10000FA3C(self->_client.task, (const __CFString *)a3);
}

- (void)dealloc
{
  __SecTask *task;
  __CFArray *accessGroups;
  __CFData *musr;
  __CFString *applicationIdentifier;
  objc_super v7;

  task = self->_client.task;
  if (task)
  {
    self->_client.task = 0;
    CFRelease(task);
  }
  accessGroups = self->_client.accessGroups;
  if (accessGroups)
  {
    self->_client.accessGroups = 0;
    CFRelease(accessGroups);
  }
  musr = self->_client.musr;
  if (musr)
  {
    self->_client.musr = 0;
    CFRelease(musr);
  }
  applicationIdentifier = self->_client.applicationIdentifier;
  if (applicationIdentifier)
  {
    self->_client.applicationIdentifier = 0;
    CFRelease(applicationIdentifier);
  }
  v7.receiver = self;
  v7.super_class = (Class)SecuritydXPCServer;
  -[SecuritydXPCServer dealloc](&v7, "dealloc");
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_loadWeakRetained((id *)&self->_connection);
}

- (void)setConnection:(id)a3
{
  objc_storeWeak((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_connection);
}

@end
