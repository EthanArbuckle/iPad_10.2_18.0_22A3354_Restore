@implementation GetMailboxIntentHandler

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000269C;
  block[3] = &unk_10000C3A0;
  block[4] = a1;
  if (qword_100012328 != -1)
    dispatch_once(&qword_100012328, block);
  return (OS_os_log *)(id)qword_100012320;
}

+ (OS_os_log)signpostLog
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100002780;
  block[3] = &unk_10000C3A0;
  block[4] = a1;
  if (qword_100012338 != -1)
    dispatch_once(&qword_100012338, block);
  return (OS_os_log *)(id)qword_100012330;
}

- (unint64_t)signpostID
{
  id v3;
  NSObject *v4;
  os_signpost_id_t v5;

  v3 = objc_msgSend((id)objc_opt_class(self), "signpostLog");
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = os_signpost_id_make_with_pointer(v4, self);

  return v5;
}

- (EMDaemonInterface)daemonInterface
{
  EMDaemonInterface *daemonInterface;
  EMDaemonInterface *v4;
  EMDaemonInterface *v5;

  daemonInterface = self->_daemonInterface;
  if (!daemonInterface)
  {
    v4 = (EMDaemonInterface *)objc_alloc_init((Class)EMDaemonInterface);
    v5 = self->_daemonInterface;
    self->_daemonInterface = v4;

    daemonInterface = self->_daemonInterface;
  }
  return daemonInterface;
}

- (void)provideMailboxOptionsCollectionForMFGetMailbox:(id)a3 withCompletion:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  uint8_t buf[16];
  void *v22;
  _QWORD v23[2];

  v5 = a4;
  v6 = objc_claimAutoreleasedReturnValue(+[GetMailboxIntentHandler log](GetMailboxIntentHandler, "log"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Provide Mailbox Options Collection", buf, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[EMMailbox predicateForMailboxType:](EMMailbox, "predicateForMailboxType:", 7));
  v23[0] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[EMMailbox predicateForMailboxType:](EMMailbox, "predicateForMailboxType:", 0));
  v23[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v23, 2));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate orPredicateWithSubpredicates:](NSCompoundPredicate, "orPredicateWithSubpredicates:", v9));

  v11 = objc_alloc((Class)EMQuery);
  v12 = objc_opt_class(EMMailbox);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[EMMailbox sortDescriptorForDisplayOrder](EMMailbox, "sortDescriptorForDisplayOrder"));
  v22 = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1));
  v15 = objc_msgSend(v11, "initWithTargetClass:predicate:sortDescriptors:queryOptions:label:", v12, v10, v14, 8, CFSTR("GetMailboxIntentHandler"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[GetMailboxIntentHandler daemonInterface](self, "daemonInterface"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "mailboxRepository"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100002B2C;
  v19[3] = &unk_10000C518;
  v19[4] = self;
  v18 = v5;
  v20 = v18;
  objc_msgSend(v17, "performQuery:completionHandler:", v15, v19);

}

- (id)defaultMailboxForMFGetMailbox:(id)a3
{
  NSObject *v4;
  os_signpost_id_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  id v11;
  NSObject *v12;
  MFIntentMailbox *v13;
  void *v14;
  void *v15;
  void *v16;
  MFIntentMailbox *v17;
  NSObject *v18;
  MFIntentMailbox *v19;
  void *v20;
  void *v21;
  void *v22;
  int v24;
  id v25;

  v4 = objc_claimAutoreleasedReturnValue(+[GetMailboxIntentHandler signpostLog](GetMailboxIntentHandler, "signpostLog", a3));
  v5 = -[GetMailboxIntentHandler signpostID](self, "signpostID");
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    LOWORD(v24) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_BEGIN, v5, "VIP FOR DEFAULT WIDGET MAILBOX", "Begin get VIPs", (uint8_t *)&v24, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GetMailboxIntentHandler daemonInterface](self, "daemonInterface"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "vipManager"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allVIPWaitForResult"));
  v9 = objc_claimAutoreleasedReturnValue(+[GetMailboxIntentHandler signpostLog](GetMailboxIntentHandler, "signpostLog"));
  v10 = -[GetMailboxIntentHandler signpostID](self, "signpostID");
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    v11 = objc_msgSend(v8, "count");
    v24 = 134217984;
    v25 = v11;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, v10, "VIP FOR DEFAULT WIDGET MAILBOX", "End get VIPs (count=%lu)", (uint8_t *)&v24, 0xCu);
  }

  if (objc_msgSend(v8, "count"))
  {
    v12 = objc_claimAutoreleasedReturnValue(+[GetMailboxIntentHandler log](GetMailboxIntentHandler, "log"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Default Mailbox: VIP", (uint8_t *)&v24, 2u);
    }

    v13 = [MFIntentMailbox alloc];
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("VIP"), &stru_10000C818, 0));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[INImage systemImageNamed:](INImage, "systemImageNamed:", CFSTR("star")));
    v17 = -[MFIntentMailbox initWithIdentifier:displayString:subtitleString:displayImage:](v13, "initWithIdentifier:displayString:subtitleString:displayImage:", CFSTR("VIP"), v15, 0, v16);

    -[MFIntentMailbox setKind:](v17, "setKind:", 5);
  }
  else
  {
    v18 = objc_claimAutoreleasedReturnValue(+[GetMailboxIntentHandler log](GetMailboxIntentHandler, "log"));
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24) = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Default Mailbox: All Inboxes", (uint8_t *)&v24, 2u);
    }

    v19 = [MFIntentMailbox alloc];
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("ALL_INBOXES"), &stru_10000C818, 0));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[INImage systemImageNamed:](INImage, "systemImageNamed:", CFSTR("tray.2")));
    v17 = -[MFIntentMailbox initWithIdentifier:displayString:subtitleString:displayImage:](v19, "initWithIdentifier:displayString:subtitleString:displayImage:", CFSTR("ALL_INBOXES"), v21, 0, v22);

    -[MFIntentMailbox setKind:](v17, "setKind:", 1);
  }

  return v17;
}

- (id)_smartMailboxesWithInboxes:(id)a3 hasVIPs:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v5;
  MFIntentMailbox *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  MFIntentMailbox *v12;
  void *v13;
  MFIntentMailbox *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  MFIntentMailbox *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  MFIntentMailbox *v26;
  MFIntentMailbox *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  MFIntentMailbox *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *i;
  void *v45;
  id v46;
  id v47;
  void *v48;
  id v49;
  void *v50;
  id v51;
  MFIntentMailbox *v53;
  MFIntentMailbox *v54;
  id v55;
  MFIntentMailbox *v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id obj;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  _QWORD v68[2];
  uint8_t buf[4];
  id v70;
  __int16 v71;
  _BOOL4 v72;

  v4 = a4;
  v55 = a3;
  v5 = objc_claimAutoreleasedReturnValue(+[GetMailboxIntentHandler log](GetMailboxIntentHandler, "log"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v70 = objc_msgSend(v55, "count");
    v71 = 1024;
    v72 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Get smart mailboxes for %lu inboxes, hasVIPs: %{BOOL}d", buf, 0x12u);
  }

  v57 = objc_alloc_init((Class)NSMutableArray);
  if ((unint64_t)objc_msgSend(v55, "count") >= 2)
  {
    v6 = [MFIntentMailbox alloc];
    v7 = NSStringFromEMSmartMailboxType(8, 7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("ALL_INBOXES"), &stru_10000C818, 0));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[INImage systemImageNamed:](INImage, "systemImageNamed:", CFSTR("tray.2")));
    v12 = -[MFIntentMailbox initWithIdentifier:displayString:subtitleString:displayImage:](v6, "initWithIdentifier:displayString:subtitleString:displayImage:", v8, v10, 0, v11);

    -[MFIntentMailbox setKind:](v12, "setKind:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "ef_map:", &stru_10000C558));
    -[MFIntentMailbox setSerializedRepresentations:](v12, "setSerializedRepresentations:", v13);

    objc_msgSend(v57, "addObject:", v12);
  }
  v14 = [MFIntentMailbox alloc];
  v15 = NSStringFromEMSmartMailboxType(1, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("FLAGGED"), &stru_10000C818, 0));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[INImage systemImageNamed:](INImage, "systemImageNamed:", CFSTR("flag")));
  v53 = -[MFIntentMailbox initWithIdentifier:displayString:subtitleString:displayImage:](v14, "initWithIdentifier:displayString:subtitleString:displayImage:", v16, v18, 0, v19);

  -[MFIntentMailbox setKind:](v53, "setKind:", 3);
  objc_msgSend(v57, "addObject:", v53);
  if (v4)
  {
    v20 = [MFIntentMailbox alloc];
    v21 = NSStringFromEMSmartMailboxType(0, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("VIP"), &stru_10000C818, 0));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[INImage systemImageNamed:](INImage, "systemImageNamed:", CFSTR("star")));
    v26 = -[MFIntentMailbox initWithIdentifier:displayString:subtitleString:displayImage:](v20, "initWithIdentifier:displayString:subtitleString:displayImage:", v22, v24, 0, v25);

    -[MFIntentMailbox setKind:](v26, "setKind:", 5);
    objc_msgSend(v57, "addObject:", v26);

  }
  v27 = [MFIntentMailbox alloc];
  v28 = NSStringFromEMSmartMailboxType(2, 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("UNREAD"), &stru_10000C818, 0));
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[INImage systemImageNamed:](INImage, "systemImageNamed:", CFSTR("envelope.badge")));
  v56 = -[MFIntentMailbox initWithIdentifier:displayString:subtitleString:displayImage:](v27, "initWithIdentifier:displayString:subtitleString:displayImage:", v29, v31, 0, v32);

  -[MFIntentMailbox setKind:](v56, "setKind:", 4);
  v33 = [MFIntentMailbox alloc];
  v34 = NSStringFromEMSmartMailboxType(6, 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("TODAY"), &stru_10000C818, 0));
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[INImage systemImageNamed:](INImage, "systemImageNamed:", CFSTR("calendar")));
  v54 = -[MFIntentMailbox initWithIdentifier:displayString:subtitleString:displayImage:](v33, "initWithIdentifier:displayString:subtitleString:displayImage:", v35, v37, 0, v38);

  -[MFIntentMailbox setKind:](v54, "setKind:", 6);
  v68[0] = v56;
  v68[1] = v54;
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v68, 2));
  objc_msgSend(v57, "addObjectsFromArray:", v39);

  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  obj = v57;
  v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
  if (v40)
  {
    v41 = *(_QWORD *)v64;
    v61 = (void *)MFCombinedMailboxToday;
    v60 = (void *)MFCombinedMailboxVIP;
    v59 = (void *)MFCombinedMailboxUnread;
    v58 = (void *)MFCombinedMailboxFlagged;
    v42 = (void *)MFCombinedMailboxAllInbox;
    v43 = EMAppleMailboxURLScheme;
    do
    {
      for (i = 0; i != v40; i = (char *)i + 1)
      {
        if (*(_QWORD *)v64 != v41)
          objc_enumerationMutation(obj);
        v45 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * (_QWORD)i);
        v46 = objc_msgSend(v45, "kind", v53);
        v47 = 0;
        v48 = v42;
        switch((unint64_t)v46)
        {
          case 1uLL:
            goto LABEL_17;
          case 3uLL:
            v48 = v58;
            goto LABEL_17;
          case 4uLL:
            v48 = v59;
            goto LABEL_17;
          case 5uLL:
            v48 = v60;
            goto LABEL_17;
          case 6uLL:
            v48 = v61;
LABEL_17:
            v47 = v48;
            break;
          default:
            break;
        }
        v49 = objc_alloc_init((Class)NSURLComponents);
        objc_msgSend(v49, "setScheme:", v43);
        objc_msgSend(v49, "setHost:", v47);
        v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "URL"));

        objc_msgSend(v45, "setUrl:", v50);
      }
      v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
    }
    while (v40);
  }

  v51 = objc_msgSend(obj, "copy");
  return v51;
}

- (id)_convertMailboxesIntoSections:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  GetMailboxIntentHandler *v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "keyEnumerator"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allObjects"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sortedArrayUsingComparator:", &stru_10000C598));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100003E50;
  v11[3] = &unk_10000C5E8;
  v8 = v4;
  v12 = v8;
  v13 = self;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ef_compactMap:", v11));

  return v9;
}

- (id)_intentMailboxFromMailbox:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  MFIntentMailbox *v12;
  void *v13;
  void *v14;
  void *v15;
  MFIntentMailbox *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  MFIntentAccount *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = v3;
    v6 = -2;
    v7 = v5;
    do
    {
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "parent"));

      ++v6;
      v7 = (void *)v8;
    }
    while (v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("  "), "ef_repeatedStringTimes:", v6));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v9, v10));

    v12 = [MFIntentMailbox alloc];
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "url"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "absoluteString"));
    v16 = -[MFIntentMailbox initWithIdentifier:displayString:](v12, "initWithIdentifier:displayString:", v15, v11);

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectID"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "serializedRepresentation"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "base64EncodedStringWithOptions:", 0));
    v33 = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v33, 1));
    -[MFIntentMailbox setSerializedRepresentations:](v16, "setSerializedRepresentations:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
    -[MFIntentMailbox setName:](v16, "setName:", v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "externalURL"));
    -[MFIntentMailbox setUrl:](v16, "setUrl:", v22);

    v23 = objc_msgSend(v5, "type");
    if (v23)
    {
      if (v23 == (id)7)
      {
        -[MFIntentMailbox setKind:](v16, "setKind:", 2);
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[INImage systemImageNamed:](INImage, "systemImageNamed:", CFSTR("tray")));
      }
      else
      {
        -[MFIntentMailbox setKind:](v16, "setKind:", 7);
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[INImage systemImageNamed:](INImage, "systemImageNamed:", CFSTR("folder")));
      }
      -[MFIntentMailbox setDisplayImage:](v16, "setDisplayImage:", v24);
    }
    else
    {
      -[MFIntentMailbox setKind:](v16, "setKind:", 7);
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[INImage systemImageNamed:](INImage, "systemImageNamed:", CFSTR("folder")));
      -[MFIntentMailbox setDisplayImage:](v16, "setDisplayImage:", v24);
    }

    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "account"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "name"));

    if (v26)
    {
      v27 = -[MFIntentAccount initWithIdentifier:displayString:]([MFIntentAccount alloc], "initWithIdentifier:displayString:", v26, v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "account"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectID"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "serializedRepresentation"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "base64EncodedStringWithOptions:", 0));
      -[MFIntentAccount setSerializedRepresentation:](v27, "setSerializedRepresentation:", v31);

      -[MFIntentMailbox setAccount:](v16, "setAccount:", v27);
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)setDaemonInterface:(id)a3
{
  objc_storeStrong((id *)&self->_daemonInterface, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemonInterface, 0);
}

@end
