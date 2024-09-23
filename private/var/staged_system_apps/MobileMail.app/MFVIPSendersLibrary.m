@implementation MFVIPSendersLibrary

+ (id)log
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C4720;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005AA4B8 != -1)
    dispatch_once(&qword_1005AA4B8, block);
  return (id)qword_1005AA4B0;
}

+ (id)defaultInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C4804;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005AA4C8 != -1)
    dispatch_once(&qword_1005AA4C8, block);
  return (id)qword_1005AA4C0;
}

+ (id)defaultMessageLibrary
{
  return +[MFMailMessageLibrary defaultInstance](MFMailMessageLibrary, "defaultInstance");
}

- (MFVIPSendersLibrary)initWithLibrary:(id)a3
{
  id v6;
  MFVIPSendersLibrary *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *addressBookQueue;
  dispatch_queue_t v10;
  OS_dispatch_queue *pendingAddressQueue;
  EAEmailAddressSet *v12;
  EAEmailAddressSet *pendingAdds;
  EAEmailAddressSet *v14;
  EAEmailAddressSet *pendingRemoves;
  uint64_t v16;
  VIPManager *vipManager;
  id v18;
  void *v19;
  id v20;
  EAEmailAddressSet *v21;
  void *v22;
  EAEmailAddressSet *v23;
  void *v24;
  void *v25;
  EAEmailAddressSet *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  MFVIPSendersLibrary *v31;
  void *v33;
  objc_super v34;

  v6 = a3;
  if ((+[MFMailMessageLibrary canUsePersistence](MFMailMessageLibrary, "canUsePersistence") & 1) == 0)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFVIPSendersLibrary.m"), 70, CFSTR("App is in daemon mode, but accessing database"));

  }
  v34.receiver = self;
  v34.super_class = (Class)MFVIPSendersLibrary;
  v7 = -[MFVIPSendersLibrary init](&v34, "init");
  if (v7)
  {
    v8 = dispatch_queue_create("com.apple.mobilemail.vipaddressbook", 0);
    addressBookQueue = v7->_addressBookQueue;
    v7->_addressBookQueue = (OS_dispatch_queue *)v8;

    v10 = dispatch_queue_create("com.apple.mobilemail.vipsenders.pendingaddresses", 0);
    pendingAddressQueue = v7->_pendingAddressQueue;
    v7->_pendingAddressQueue = (OS_dispatch_queue *)v10;

    v12 = (EAEmailAddressSet *)objc_alloc_init((Class)EAEmailAddressSet);
    pendingAdds = v7->_pendingAdds;
    v7->_pendingAdds = v12;

    v14 = (EAEmailAddressSet *)objc_alloc_init((Class)EAEmailAddressSet);
    pendingRemoves = v7->_pendingRemoves;
    v7->_pendingRemoves = v14;

    v16 = objc_claimAutoreleasedReturnValue(+[VIPManager defaultInstance](VIPManager, "defaultInstance"));
    vipManager = v7->_vipManager;
    v7->_vipManager = (VIPManager *)v16;

    v18 = objc_alloc((Class)NSDictionary);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MFVIPSendersLibrary _pendingVIPChangesPath](v7, "_pendingVIPChangesPath"));
    v20 = objc_msgSend(v18, "initWithContentsOfFile:", v19);

    v21 = v7->_pendingAdds;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKey:", CFSTR("to-add")));
    -[EAEmailAddressSet addObjectsFromArray:](v21, "addObjectsFromArray:", v22);

    v23 = v7->_pendingRemoves;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKey:", CFSTR("to-remove")));
    -[EAEmailAddressSet addObjectsFromArray:](v23, "addObjectsFromArray:", v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    if ((objc_msgSend(v25, "BOOLForKey:", CFSTR("set-initial-vip-flags")) & 1) == 0)
    {
      v26 = v7->_pendingAdds;
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[VIPManager allVIPEmailAddresses](v7->_vipManager, "allVIPEmailAddresses"));
      -[EAEmailAddressSet unionSet:](v26, "unionSet:", v27);

      objc_msgSend(v25, "setBool:forKey:", 1, CFSTR("set-initial-vip-flags"));
    }
    objc_storeStrong((id *)&v7->_library, a3);
    if (!-[MFMailMessageLibrary protectedDataAvailability](v7->_library, "protectedDataAvailability"))
      -[MFVIPSendersLibrary _performTasksAfterProtectedDataBecomesAvailable](v7, "_performTasksAfterProtectedDataBecomesAvailable");
    if (-[EAEmailAddressSet count](v7->_pendingAdds, "count")
      || -[EAEmailAddressSet count](v7->_pendingRemoves, "count"))
    {
      -[MFVIPSendersLibrary _libraryDidFinishReconciliation:](v7, "_libraryDidFinishReconciliation:", 0);
    }
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "persistence"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "hookRegistry"));
    objc_msgSend(v29, "registerMessageChangeHookResponder:", v7);

    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v30, "addObserver:selector:name:object:", v7, "_libraryDidFinishReconciliation:", MailMessageLibraryDidFinishReconciliation, v7->_library);
    objc_msgSend(v30, "addObserver:selector:name:object:", v7, "_vipsDidChange:", EMVIPsDidChangeNotification, v7->_vipManager);
    v31 = v7;

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  void *addressBook;
  NSObject *addressBookQueue;
  objc_super v6;
  _QWORD block[6];
  _QWORD v8[4];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  addressBook = self->_addressBook;
  if (addressBook)
  {
    v8[0] = 0;
    v8[1] = v8;
    v8[2] = 0x2020000000;
    v8[3] = addressBook;
    addressBookQueue = self->_addressBookQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001C4D5C;
    block[3] = &unk_10051EE98;
    block[4] = v8;
    block[5] = self;
    dispatch_sync(addressBookQueue, block);
    _Block_object_dispose(v8, 8);
  }
  v6.receiver = self;
  v6.super_class = (Class)MFVIPSendersLibrary;
  -[MFVIPSendersLibrary dealloc](&v6, "dealloc");
}

- (void)_handleAddressBookNotification
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  int *p_addressBookResetCount;
  unsigned int v8;
  dispatch_time_t v9;
  NSObject *addressBookQueue;
  void *v11;
  _QWORD block[5];
  uint8_t buf[16];

  v4 = pthread_main_np();
  if ((_DWORD)v4 != 1)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFVIPSendersLibrary.m"), 144, CFSTR("Current thread must be main"));

  }
  v5 = MFLogGeneral(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "#MailServices got address book change notification", buf, 2u);
  }

  p_addressBookResetCount = &self->_addressBookResetCount;
  do
    v8 = __ldxr((unsigned int *)p_addressBookResetCount);
  while (__stxr(v8 + 1, (unsigned int *)p_addressBookResetCount));
  v9 = dispatch_time(0, 1000000000);
  addressBookQueue = self->_addressBookQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C4F70;
  block[3] = &unk_10051AA98;
  block[4] = self;
  dispatch_after(v9, addressBookQueue, block);
}

- (void)checkForAddressBookChanges
{
  void *v4;
  NSObject *addressBookQueue;
  void *v6;
  _QWORD v7[5];
  CFErrorRef error;

  if (pthread_main_np() != 1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFVIPSendersLibrary.m"), 158, CFSTR("Current thread must be main"));

  }
  if (!self->_addressBook)
  {
    error = 0;
    v4 = (void *)ABAddressBookCreateWithOptions(0, &error);
    self->_addressBook = v4;
    if (v4)
    {
      ABAddressBookRegisterChangeCallback(v4, sub_1001C4E3C, self);
      ABAddressBookRegisterExternalChangeCallback(self->_addressBook, (ABExternalChangeCallback)sub_1001C4E3C, self);
    }
    if (error)
      CFRelease(error);
  }
  addressBookQueue = self->_addressBookQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001C50B0;
  v7[3] = &unk_10051AA98;
  v7[4] = self;
  dispatch_async(addressBookQueue, v7);
}

- (void)_checkForAddressBookChangesNeedingRevert:(BOOL)a3
{
  MFVIPSendersLibrary *v3;
  void *addressBook;
  const __CFDictionary *Mutable;
  __int128 v6;
  void *v7;
  id v8;
  const void *Value;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  id v17;
  const __CFArray *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *j;
  const void *v23;
  CFTypeRef v24;
  const void *v25;
  CFArrayRef v26;
  void *v27;
  unsigned __int8 v28;
  id v29;
  id v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  void *v34;
  __int128 v35;
  id v36;
  id v37;
  CFArrayRef v38;
  id obj;
  MFVIPSendersLibrary *v40;
  void *v41;
  uint64_t v42;
  id v43;
  void *v44;
  void *i;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t v54[128];
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  void *v58;
  _BYTE v59[128];

  v3 = self;
  if (a3)
  {
    addressBook = self->_addressBook;
    if (addressBook)
      ABAddressBookRevert(addressBook);
  }
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, 0, &kCFTypeDictionaryValueCallBacks);
  v37 = objc_alloc_init((Class)NSMutableSet);
  v36 = objc_alloc_init((Class)NSMutableSet);
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[MFVIPSendersLibrary vipManager](v3, "vipManager"));
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "allVIPs"));
  v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
  if (v43)
  {
    v42 = *(_QWORD *)v51;
    *(_QWORD *)&v6 = 138412546;
    v35 = v6;
    v40 = v3;
    do
    {
      for (i = 0; i != v43; i = (char *)i + 1)
      {
        if (*(_QWORD *)v51 != v42)
          objc_enumerationMutation(obj);
        if (v3->_addressBook)
        {
          v7 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)i);
          v8 = objc_msgSend(v41, "existingPersonForVIP:usingAddressBook:", v7);
          if (v8)
          {
            Value = CFDictionaryGetValue(Mutable, v8);
            v10 = objc_claimAutoreleasedReturnValue(Value);
            v44 = (void *)v10;
            if (v10)
            {
              v11 = MFLogGeneral(v10);
              v12 = objc_claimAutoreleasedReturnValue(v11);
              if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = v35;
                v56 = v7;
                v57 = 2112;
                v58 = v44;
                _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "#MailServices merging VIPs that mapped to the same AB record (%@ -> %@)", buf, 0x16u);
              }

              v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "emailAddresses"));
              v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "emailAddresses"));
              v15 = objc_msgSend(v13, "isSubsetOfSet:", v14);

              if ((v15 & 1) == 0)
              {
                v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "emailAddresses"));
                v17 = -[MFVIPSendersLibrary _newVIPFromVIP:byAddingEmailAddresses:](v40, "_newVIPFromVIP:byAddingEmailAddresses:", v44, v16);

                objc_msgSend(v36, "addObject:", v17);
              }
              v18 = (const __CFArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier", v35));
              objc_msgSend(v37, "addObject:", v18);
            }
            else
            {
              v38 = ABPersonCopyArrayOfAllLinkedPeople(v8);
              v19 = objc_alloc_init((Class)EAEmailAddressSet);
              v48 = 0u;
              v49 = 0u;
              v46 = 0u;
              v47 = 0u;
              v18 = v38;
              v20 = -[__CFArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
              if (v20)
              {
                v21 = *(_QWORD *)v47;
                do
                {
                  for (j = 0; j != v20; j = (char *)j + 1)
                  {
                    if (*(_QWORD *)v47 != v21)
                      objc_enumerationMutation(v18);
                    v23 = *(const void **)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)j);
                    CFDictionarySetValue(Mutable, v23, v7);
                    v24 = ABRecordCopyValue(v23, kABPersonEmailProperty);
                    v25 = v24;
                    if (v24)
                    {
                      v26 = ABMultiValueCopyArrayOfAllValues(v24);
                      CFRelease(v25);
                      objc_msgSend(v19, "addObjectsFromArray:", v26);

                    }
                  }
                  v20 = -[__CFArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
                }
                while (v20);
              }

              v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "emailAddresses"));
              v28 = objc_msgSend(v19, "isSubsetOfSet:", v27);

              if ((v28 & 1) == 0)
              {
                v29 = -[MFVIPSendersLibrary _newVIPFromVIP:byAddingEmailAddresses:](v40, "_newVIPFromVIP:byAddingEmailAddresses:", v7, v19);
                objc_msgSend(v36, "addObject:", v29);

              }
            }

            v3 = v40;
          }
        }
      }
      v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
    }
    while (v43);
  }

  if (objc_msgSend(v36, "count"))
    objc_msgSend(v41, "saveVIPs:", v36);
  v30 = objc_msgSend(v37, "count", v35);
  if (v30)
  {
    v31 = MFLogGeneral(v30);
    v32 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "allObjects"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "componentsJoinedByString:", CFSTR(",")));
      *(_DWORD *)buf = 138412290;
      v56 = v34;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "#MailServices removing VIPs from cloud with identifiers {%@}", buf, 0xCu);

    }
    objc_msgSend(v41, "removeVIPsWithIdentifiers:", v37);
  }
  if (Mutable)
    CFRelease(Mutable);

}

- (id)_newVIPFromVIP:(id)a3 byAddingEmailAddresses:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "emailAddresses"));
  v8 = objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v8, "unionSet:", v6);
  v9 = objc_alloc((Class)EMVIP);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
  v12 = objc_msgSend(v9, "initWithIdentifier:name:emailAddresses:", v10, v11, v8);

  return v12;
}

- (void)persistenceWillAddMessage:(id)a3 fromExistingMessage:(BOOL)a4
{
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  _BOOL4 v28;
  _BOOL4 v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];

  v7 = a3;
  v8 = objc_opt_class(MFMailMessage);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) == 0)
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFVIPSendersLibrary.m"), 248, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[message isKindOfClass:MFMailMessage.class]"));

    if (a4)
      goto LABEL_35;
    goto LABEL_3;
  }
  if (!a4)
  {
LABEL_3:
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstSender"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "emailAddressValue"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "simpleAddress"));
    v12 = v11;
    if (v11)
      v13 = v11;
    else
      v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringValue"));
    v14 = v13;

    v38 = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MFVIPSendersLibrary vipManager](self, "vipManager"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "allVIPEmailAddresses"));

    v39 = v16;
    if ((objc_msgSend(v16, "containsObject:", v14) & 1) != 0)
    {
      v17 = 1;
    }
    else
    {
      v18 = objc_msgSend(v14, "mf_copyIDNAEncodedEmailAddress");
      if ((objc_msgSend(v16, "containsObject:", v18) & 1) != 0)
      {
        v17 = 1;
      }
      else
      {
        v19 = objc_msgSend(v14, "mf_copyIDNADecodedEmailAddress");
        v17 = objc_msgSend(v16, "containsObject:", v19);

      }
    }
    v20 = (uint64_t)objc_msgSend(v7, "messageFlags");
    if (v17)
      v21 = v20 | 0x1000000;
    else
      v21 = v20;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "account"));
    v23 = objc_msgSend(v22, "copyReceivingEmailAddresses");

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "to"));
    v37 = v21;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cc"));
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v26 = v23;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    if (!v27)
    {

      v33 = v38;
      v34 = v39;
      v35 = v21;
      goto LABEL_34;
    }
    v28 = 0;
    v29 = 0;
    v30 = *(_QWORD *)v41;
LABEL_17:
    v31 = 0;
    while (1)
    {
      if (*(_QWORD *)v41 != v30)
        objc_enumerationMutation(v26);
      v32 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v31);
      if (!v28 && v24 != 0)
        v28 = objc_msgSend(v24, "mf_indexOfRecipientWithEmailAddress:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v31)) != (id)0x7FFFFFFFFFFFFFFFLL;
      if (!v29 && v25 != 0)
        v29 = objc_msgSend(v25, "mf_indexOfRecipientWithEmailAddress:", v32) != (id)0x7FFFFFFFFFFFFFFFLL;
      if (v28 && v29)
        break;
      if (v27 == (id)++v31)
      {
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
        if (v27)
          goto LABEL_17;

        v33 = v38;
        v34 = v39;
        v35 = v37;
        if (v28)
          v35 = v37 | 0x8000000000;
        if (!v29)
        {
LABEL_34:
          objc_msgSend(v7, "setMessageFlags:", v35);

          goto LABEL_35;
        }
LABEL_32:
        v35 |= 0x10000000000uLL;
        goto LABEL_34;
      }
    }

    v33 = v38;
    v34 = v39;
    v35 = v37 | 0x8000000000;
    goto LABEL_32;
  }
LABEL_35:

}

- (id)_pendingVIPChangesPath
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = MFMailDirectory(self, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("PendingVIPChanges")));

  return v4;
}

- (void)_savePendingVIPChanges_nts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];
  _QWORD v8[2];

  v7[0] = CFSTR("to-add");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[EAEmailAddressSet allObjects](self->_pendingAdds, "allObjects"));
  v7[1] = CFSTR("to-remove");
  v8[0] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[EAEmailAddressSet allObjects](self->_pendingRemoves, "allObjects"));
  v8[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v8, v7, 2));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFVIPSendersLibrary _pendingVIPChangesPath](self, "_pendingVIPChangesPath"));
  objc_msgSend(v5, "writeToFile:atomically:", v6, 1);

}

- (void)_removePendingVIPChanges
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFVIPSendersLibrary _pendingVIPChangesPath](self, "_pendingVIPChangesPath"));
  objc_msgSend(v4, "removeItemAtPath:error:", v3, 0);

}

- (EMUserProfileProvider)userProfileProvider
{
  return (EMUserProfileProvider *)+[MFUserProfileProvider_iOS defaultProvider](MFUserProfileProvider_iOS, "defaultProvider");
}

- (void)_performTasksAfterProtectedDataBecomesAvailable
{
  void *v3;
  unsigned __int8 v4;
  dispatch_queue_global_t global_queue;
  NSObject *v6;
  _QWORD block[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("ToCcMigrationCompleted"));

  if ((v4 & 1) == 0)
  {
    global_queue = dispatch_get_global_queue(-32768, 0);
    v6 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001C5F2C;
    block[3] = &unk_10051AA98;
    block[4] = self;
    dispatch_async(v6, block);

  }
}

- (void)_libraryDidFinishReconciliation:(id)a3
{
  NSObject *pendingAddressQueue;
  _QWORD block[5];

  -[MFVIPSendersLibrary _performTasksAfterProtectedDataBecomesAvailable](self, "_performTasksAfterProtectedDataBecomesAvailable", a3);
  pendingAddressQueue = self->_pendingAddressQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C660C;
  block[3] = &unk_10051AA98;
  block[4] = self;
  dispatch_async(pendingAddressQueue, block);
}

- (BOOL)_clearVIPSenderFlagForSenders:(id)a3 retryFailedSenders:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *pendingAddressQueue;
  BOOL v13;
  _QWORD block[5];
  id v16;
  BOOL v17;

  v4 = a4;
  v6 = a3;
  v17 = 0;
  v7 = objc_autoreleasePoolPush();
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFVIPSendersLibrary _messagesForSenders:success:](self, "_messagesForSenders:success:", v6, &v17));
  v9 = v8;
  if (v17)
  {
    if (objc_msgSend(v8, "count"))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailMessageLibrary persistence](self->_library, "persistence"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "messageChangeManager"));
      objc_msgSend(v11, "applyVIPStatus:forMessages:", 0, v9);

    }
  }
  else if (v4)
  {
    pendingAddressQueue = self->_pendingAddressQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001C67E8;
    block[3] = &unk_10051A910;
    block[4] = self;
    v16 = v6;
    dispatch_async(pendingAddressQueue, block);

  }
  objc_autoreleasePoolPop(v7);
  v13 = v17;

  return v13;
}

- (BOOL)_setVIPSenderFlagForSenders:(id)a3 retryFailedSenders:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *pendingAddressQueue;
  BOOL v13;
  _QWORD block[5];
  id v16;
  BOOL v17;

  v4 = a4;
  v6 = a3;
  v17 = 0;
  v7 = objc_autoreleasePoolPush();
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFVIPSendersLibrary _messagesForSenders:success:](self, "_messagesForSenders:success:", v6, &v17));
  v9 = v8;
  if (v17)
  {
    if (objc_msgSend(v8, "count"))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailMessageLibrary persistence](self->_library, "persistence"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "messageChangeManager"));
      objc_msgSend(v11, "applyVIPStatus:forMessages:", 1, v9);

    }
  }
  else if (v4)
  {
    pendingAddressQueue = self->_pendingAddressQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001C6970;
    block[3] = &unk_10051A910;
    block[4] = self;
    v16 = v6;
    dispatch_async(pendingAddressQueue, block);

  }
  objc_autoreleasePoolPop(v7);
  v13 = v17;

  return v13;
}

- (void)_vipsDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  dispatch_queue_global_t global_queue;
  NSObject *v8;
  void *v9;
  dispatch_queue_global_t v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  MFVIPSendersLibrary *v14;
  _QWORD block[4];
  id v16;
  MFVIPSendersLibrary *v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", EMVIPsUpdatedKey));
  if (objc_msgSend(v6, "count"))
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v8 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001C6B38;
    block[3] = &unk_10051A910;
    v16 = v6;
    v17 = self;
    dispatch_async(v8, block);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", EMVIPsRemovedKey));
  if (objc_msgSend(v9, "count"))
  {
    v10 = dispatch_get_global_queue(0, 0);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1001C6CA0;
    v12[3] = &unk_10051A910;
    v13 = v9;
    v14 = self;
    dispatch_async(v11, v12);

  }
}

- (id)_messagesForSenders:(id)a3 success:(BOOL *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  BOOL v14;

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allObjects"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[EMMessageListItemPredicates predicateForMessagesWithSenders:](EMMessageListItemPredicates, "predicateForMessagesWithSenders:", v7));

    v9 = objc_msgSend(objc_alloc((Class)EMQuery), "initWithTargetClass:predicate:sortDescriptors:", objc_opt_class(EMMessage), v8, &__NSArray0__struct);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailMessageLibrary persistence](self->_library, "persistence"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "messagePersistence"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "persistedMessagesMatchingQuery:limit:requireProtectedData:", v9, 0x7FFFFFFFFFFFFFFFLL, 1));

    if (!a4)
      goto LABEL_10;
  }
  else
  {
    v12 = 0;
    if (!a4)
      goto LABEL_10;
  }
  v14 = !objc_msgSend(v6, "count") || objc_msgSend(v12, "count") || EFContentProtectionGetObservedState(0, v13) == 0;
  *a4 = v14;
LABEL_10:

  return v12;
}

- (VIPManager)vipManager
{
  return self->_vipManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vipManager, 0);
  objc_storeStrong((id *)&self->_pendingRemoves, 0);
  objc_storeStrong((id *)&self->_pendingAdds, 0);
  objc_storeStrong((id *)&self->_pendingAddressQueue, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_addressBookQueue, 0);
}

@end
