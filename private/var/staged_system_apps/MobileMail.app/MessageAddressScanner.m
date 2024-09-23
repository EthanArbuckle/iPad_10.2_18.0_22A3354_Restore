@implementation MessageAddressScanner

+ (id)coreRecentsMetadataForMessage:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  id v38;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstSender"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "emailAddressValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "simpleAddress"));
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringValue"));
  v9 = v8;

  v10 = v4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "emailAddressValue"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "displayName"));
  v13 = v12;
  if (v12)
    v14 = v12;
  else
    v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringValue"));
  v15 = v14;

  if (objc_msgSend(v15, "isEqualToString:", v9))
  {

    v15 = 0;
  }
  if (v9)
  {
    v38 = v3;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v17 = off_1005A0770();
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v9, v18);

    v19 = off_1005A0778();
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v21 = off_1005A0780();
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v20, v22);

    if (objc_msgSend(v15, "length"))
    {
      v23 = off_1005A0788();
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v24);

    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v26 = off_1005A0790();
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v16, v27);

    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "subject"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "subjectWithoutPrefix"));

    if (objc_msgSend(v29, "length"))
    {
      v30 = off_1005A0798();
      v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
      objc_msgSend(v25, "setObject:forKeyedSubscript:", v29, v31);

    }
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "globalMessageURL"));
    v33 = v32;
    if (v32)
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "absoluteString"));
      v35 = off_1005A0768();
      v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
      objc_msgSend(v25, "setObject:forKeyedSubscript:", v34, v36);

    }
    v3 = v38;
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

+ (id)weightForMessage:(id)a3 addressBook:(void *)a4 vipManager:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t PersonMatchingEmailAddress;
  uint64_t (**v17)();
  NSNumber *v18;

  v7 = a5;
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "firstSender"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "emailAddressValue"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "simpleAddress"));
  v11 = v10;
  if (v10)
    v12 = v10;
  else
    v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringValue"));
  v13 = v12;

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allVIPEmailAddresses"));
    if ((objc_msgSend(v14, "containsObject:", v13) & 1) != 0)
    {

LABEL_10:
      v17 = &off_1005A07A0;
LABEL_13:
      v18 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (uint64_t)((double (__cdecl *)())*v17)());
      v15 = (void *)objc_claimAutoreleasedReturnValue(v18);
      goto LABEL_14;
    }
    if (a4)
    {
      PersonMatchingEmailAddress = ABAddressBookFindPersonMatchingEmailAddress(a4, v13, 0);

      if (PersonMatchingEmailAddress)
        goto LABEL_10;
    }
    else
    {

    }
    v17 = &off_1005A07A8;
    goto LABEL_13;
  }
  v15 = 0;
LABEL_14:

  return v15;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100105F24;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005A9E88 != -1)
    dispatch_once(&qword_1005A9E88, block);
  return (id)qword_1005A9E80;
}

- (MessageAddressScanner)init
{
  MessageAddressScanner *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  MessageAddressScanner *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MessageAddressScanner;
  v2 = -[MessageAddressScanner init](&v9, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("MessageAddressScanner", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = v2;
  }

  return v2;
}

- (void)dealloc
{
  void *ab;
  void *v4;
  __DDScanner *scanner;
  objc_super v6;
  _QWORD v7[6];
  _QWORD v8[4];

  ab = self->_ab;
  if (ab)
  {
    v8[0] = 0;
    v8[1] = v8;
    v8[2] = 0x2020000000;
    v8[3] = self;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1001060E8;
    v7[3] = &unk_10051EE98;
    v7[4] = v8;
    v7[5] = ab;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
    objc_msgSend(v4, "performBlock:", v7);

    _Block_object_dispose(v8, 8);
  }
  scanner = self->_scanner;
  if (scanner)
    CFRelease(scanner);
  v6.receiver = self;
  v6.super_class = (Class)MessageAddressScanner;
  -[MessageAddressScanner dealloc](&v6, "dealloc");
}

- (void)_scheduleRemovalOfDetectedAddressesInMessages:(id)a3
{
  id v4;
  _MessageAddressScannerQueue *v5;
  _MessageAddressScannerQueue *pendingRemovalQueue;
  _MessageAddressScannerQueue *v7;
  void *v8;
  dispatch_time_t v9;
  NSObject *queue;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD block[5];
  _BYTE v21[128];

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_pendingRemovalQueue)
  {
    v5 = objc_alloc_init(_MessageAddressScannerQueue);
    pendingRemovalQueue = self->_pendingRemovalQueue;
    self->_pendingRemovalQueue = v5;

    v7 = self->_pendingRemovalQueue;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MessageAddressScanner recentsLibrary](self, "recentsLibrary"));
    -[_MessageAddressScannerQueue setRecentsLibrary:](v7, "setRecentsLibrary:", v8);

    -[_MessageAddressScannerQueue setTargetQueue:](self->_pendingRemovalQueue, "setTargetQueue:", self->_queue);
  }
  if ((*((_BYTE *)self + 40) & 1) == 0)
  {
    *((_BYTE *)self + 40) |= 1u;
    v9 = dispatch_time(0, 2000000000);
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100106328;
    block[3] = &unk_10051AA98;
    block[4] = self;
    dispatch_after(v9, queue, block);
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = v4;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v11);
        v15 = objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i), "messageIDHash", (_QWORD)v16);
        if (v15)
          -[_MessageAddressScannerQueue addHash:](self->_pendingRemovalQueue, "addHash:", v15);
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v12);
  }

}

- (id)recentsLibrary
{
  return -[objc_class defaultInstance](off_1005A07B0(), "defaultInstance");
}

- (__DDScanner)scanner
{
  __DDScanner **p_scanner;
  __DDScanner *result;
  const void *v4;
  uint64_t v6;
  NSObject *v7;
  const void *v8;
  uint8_t buf[4];
  const void *v10;

  p_scanner = &self->_scanner;
  result = (__DDScanner *)atomic_load((unint64_t *)&self->_scanner);
  if (!result)
  {
    v8 = 0;
    v4 = (const void *)DDScannerCreate(0, 0, &v8);
    if (v4)
    {
      while (!__ldaxr((unint64_t *)p_scanner))
      {
        if (!__stlxr((unint64_t)v4, (unint64_t *)p_scanner))
          return *p_scanner;
      }
      __clrex();
    }
    else
    {
      v6 = MFLogGeneral();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v10 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#Warning failed to create scanner: %@", buf, 0xCu);
      }

      v4 = v8;
      if (!v8)
        return *p_scanner;
    }
    CFRelease(v4);
    return *p_scanner;
  }
  return result;
}

- (void)addressBook
{
  void **p_ab;
  ABAddressBookRef v6;
  void *v8;
  uint64_t v9;

  p_ab = &self->_ab;
  if (!atomic_load((unint64_t *)&self->_ab))
  {
    v6 = ABAddressBookCreateWithOptions(0, 0);
    if (v6)
    {
      while (!__ldaxr((unint64_t *)p_ab))
      {
        if (!__stlxr((unint64_t)v6, (unint64_t *)p_ab))
        {
          v8 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler", _NSConcreteStackBlock, 3221225472, sub_100106534, &unk_10051ABD8, self, v6));
          objc_msgSend(v8, "performBlock:", &v9);

          return *p_ab;
        }
      }
      __clrex();
      CFRelease(v6);
    }
  }
  return *p_ab;
}

- (void)setLibrary:(id)a3
{
  MFMailMessageLibrary *v5;
  MFMailMessageLibrary **p_library;
  void *v7;
  void *v8;
  MFMailMessageLibrary *v9;

  v5 = (MFMailMessageLibrary *)a3;
  p_library = &self->_library;
  if (self->_library != v5)
  {
    v9 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v8 = v7;
    if (*p_library)
    {
      objc_msgSend(v7, "removeObserver:name:object:", self, MailMessageStoreMessageFlagsChanged);
      objc_msgSend(v8, "removeObserver:name:object:", self, MailMessageStoreMessagesWillBeCompacted, self->_library);
      objc_msgSend(v8, "removeObserver:name:object:", self, MailMessageStoreMessagesCompacted, self->_library);
    }
    objc_storeStrong((id *)&self->_library, a3);
    if (*p_library)
    {
      objc_msgSend(v8, "addObserver:selector:name:object:", self, "_messagesFlagsChanged:", MailMessageStoreMessageFlagsChanged);
      objc_msgSend(v8, "addObserver:selector:name:object:", self, "_messagesWillBeCompacted:", MailMessageStoreMessagesWillBeCompacted, self->_library);
      objc_msgSend(v8, "addObserver:selector:name:object:", self, "_messagesWereCompacted:", MailMessageStoreMessagesCompacted, self->_library);
    }

    v5 = v9;
  }

}

- (void)_messagesFlagsChanged:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  MessageAddressScanner *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100106714;
  v7[3] = &unk_10051A910;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)_messagesWillBeCompacted:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  MessageAddressScanner *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100106884;
  v7[3] = &unk_10051A910;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)_messagesWereCompacted:(id)a3
{
  -[MessageAddressScanner _messagesWillBeCompacted:](self, "_messagesWillBeCompacted:", a3);
}

- (void)handleAddressBookChange
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100106960;
  block[3] = &unk_10051AA98;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)scanSummary:(id)a3 forMessage:(id)a4
{
  id v6;
  id v7;
  __DDScanner *v8;
  CFAbsoluteTime Current;
  NSObject *queue;
  _QWORD block[4];
  id v12;
  id v13;
  MessageAddressScanner *v14;
  CFAbsoluteTime v15;
  __DDScanner *v16;

  v6 = a3;
  v7 = a4;
  v8 = -[MessageAddressScanner scanner](self, "scanner");
  if (v8)
  {
    Current = CFAbsoluteTimeGetCurrent();
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100106A64;
    block[3] = &unk_10051EEC0;
    v12 = v7;
    v15 = Current;
    v16 = v8;
    v13 = v6;
    v14 = self;
    dispatch_async(queue, block);

  }
}

- (void)_addAddressDetectorResult:(__DDResult *)a3 forMessage:(id)a4
{
  id v6;
  uint64_t MatchedString;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  Class v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;

  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  MatchedString = DDResultGetMatchedString(a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue(MatchedString);
  v9 = objc_msgSend((id)objc_opt_class(self), "coreRecentsMetadataForMessage:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MessageAddressScanner library](self, "library"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "persistence"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "vipManager"));

  v14 = objc_msgSend((id)objc_opt_class(self), "weightForMessage:addressBook:vipManager:", v6, -[MessageAddressScanner addressBook](self, "addressBook"), v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  if (v15 && v10)
  {
    v16 = off_1005A07B0();
    v17 = off_1005A07B8();
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dateReceived"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class recentEventForAddress:displayName:kind:date:weight:metadata:options:](v16, "recentEventForAddress:displayName:kind:date:weight:metadata:options:", v8, 0, v18, v19, v15, v10, 0));

    if (v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[MessageAddressScanner recentsLibrary](self, "recentsLibrary"));
      v25 = v20;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v25, 1));
      v23 = off_1005A0760();
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      objc_msgSend(v21, "recordContactEvents:recentsDomain:sendingAddress:completion:", v22, v24, 0, 0);

    }
  }

}

- (MFMailMessageLibrary)library
{
  return self->_library;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_pendingRemovalQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
