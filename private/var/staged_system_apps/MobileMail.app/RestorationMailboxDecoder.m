@implementation RestorationMailboxDecoder

+ (id)decoderWithDaemonInterface:(id)a3 log:(id)a4
{
  id v5;
  id v6;
  RestorationMailboxDecoder *v7;

  v5 = a3;
  v6 = a4;
  v7 = -[RestorationMailboxDecoder initWithDaemonInterface:log:]([RestorationMailboxDecoder alloc], "initWithDaemonInterface:log:", v5, v6);

  return v7;
}

- (RestorationMailboxDecoder)initWithDaemonInterface:(id)a3 log:(id)a4
{
  id v6;
  RestorationMailboxDecoder *v7;
  RestorationMailboxDecoder *v8;
  id v9;
  OS_os_log *v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RestorationMailboxDecoder;
  v7 = -[RestorationMailboxDecoder init](&v12, "init");
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_daemonInterface, v6);
    if (a4)
    {
      v8->_log = (OS_os_log *)a4;
    }
    else
    {
      v9 = sub_1001D0850();
      v10 = (OS_os_log *)objc_claimAutoreleasedReturnValue(v9);
      v8->_log = v10;

    }
  }

  return v8;
}

- (id)decodeMailboxData:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;

  v4 = a3;
  v5 = v4;
  if (!v4 || !objc_msgSend(v4, "length"))
  {
    v14 = (id)objc_claimAutoreleasedReturnValue(-[RestorationMailboxDecoder log](self, "log"));
    v12 = objc_claimAutoreleasedReturnValue(+[NSError mf_restorationMailboxNotAvailableErrorWithUnderlyingError:](NSError, "mf_restorationMailboxNotAvailableErrorWithUnderlyingError:", 0));
    v7 = v14;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(-[NSObject ef_publicDescription](v12, "ef_publicDescription"));
      sub_100395298();
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[EFFuture futureWithError:](EFFuture, "futureWithError:", v12));
    v8 = v7;
    goto LABEL_14;
  }
  v6 = objc_claimAutoreleasedReturnValue(-[RestorationMailboxDecoder log](self, "log"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v21 = objc_msgSend(v5, "length");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "RestorationMailboxDecoder: Decoding mailbox from data of length %lu", buf, 0xCu);
  }

  v19 = 0;
  v7 = objc_msgSend(objc_alloc((Class)NSKeyedUnarchiver), "initForReadingFromData:error:", v5, &v19);
  v8 = v19;
  if (!v8)
  {
    v16 = -[NSObject decodeIntegerForKey:](v7, "decodeIntegerForKey:", CFSTR("SerializationType"));
    if (v16 == (id)1)
    {
      v17 = objc_claimAutoreleasedReturnValue(-[RestorationMailboxDecoder _decodeGenericMailbox:](self, "_decodeGenericMailbox:", v7));
    }
    else if (v16 == (id)2)
    {
      v17 = objc_claimAutoreleasedReturnValue(-[RestorationMailboxDecoder _decodeSmartMailbox:](self, "_decodeSmartMailbox:", v7));
    }
    else
    {
      if (v16 != (id)3)
      {
        v18 = (id)objc_claimAutoreleasedReturnValue(-[RestorationMailboxDecoder log](self, "log"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError mf_restorationMailboxNotAvailableErrorWithUnderlyingError:](NSError, "mf_restorationMailboxNotAvailableErrorWithUnderlyingError:", 0));
        v12 = v18;
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "ef_publicDescription"));
          sub_1003952E4();
        }
        goto LABEL_10;
      }
      v17 = objc_claimAutoreleasedReturnValue(-[RestorationMailboxDecoder _decodeUnifiedMailbox:](self, "_decodeUnifiedMailbox:", v7));
    }
    v13 = (void *)v17;
    goto LABEL_15;
  }
  v9 = objc_claimAutoreleasedReturnValue(-[RestorationMailboxDecoder log](self, "log"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    objc_claimAutoreleasedReturnValue(-[NSObject ef_publicDescription](v8, "ef_publicDescription"));
    sub_10039537C();
  }

  v10 = (id)objc_claimAutoreleasedReturnValue(-[RestorationMailboxDecoder log](self, "log"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError mf_restorationMailboxNotAvailableErrorWithUnderlyingError:](NSError, "mf_restorationMailboxNotAvailableErrorWithUnderlyingError:", 0));
  v12 = v10;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "ef_publicDescription"));
    sub_100395330();
  }
LABEL_10:

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[EFFuture futureWithError:](EFFuture, "futureWithError:", v11));
LABEL_14:

LABEL_15:
  return v13;
}

- (id)_decodeGenericMailbox:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  _QWORD v16[4];
  NSObject *v17;
  _QWORD v18[4];
  NSObject *v19;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[RestorationMailboxDecoder log](self, "log"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_100395420();
  v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(EMMailboxObjectID), CFSTR("ObjectID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (v7)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      sub_1003953F4();
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RestorationMailboxDecoder daemonInterface](self, "daemonInterface"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mailboxRepository"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mailboxForObjectID:", v7));

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1001D17F8;
    v18[3] = &unk_100521AC0;
    v11 = v5;
    v19 = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "recover:", v18));

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1001D1900;
    v16[3] = &unk_10051D070;
    v17 = v11;
    objc_msgSend(v12, "addSuccessBlock:", v16);

    v13 = v19;
  }
  else
  {
    v13 = objc_claimAutoreleasedReturnValue(+[NSError mf_invalidRestorationDataErrorWithUnderlyingError:](NSError, "mf_invalidRestorationDataErrorWithUnderlyingError:", 0));
    v14 = v5;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(-[NSObject ef_publicDescription](v13, "ef_publicDescription"));
      sub_1003953B8();
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[EFFuture futureWithError:](EFFuture, "futureWithError:", v13));
  }

  return v12;
}

- (id)_decodeSmartMailbox:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  _BYTE v28[24];

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[RestorationMailboxDecoder log](self, "log"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_100395600();
  v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("SmartMailboxSourceType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (!v7)
  {
    v16 = v5;
    v13 = objc_claimAutoreleasedReturnValue(+[NSError mf_restorationMailboxNotAvailableErrorWithUnderlyingError:](NSError, "mf_restorationMailboxNotAvailableErrorWithUnderlyingError:", 0));
    v12 = v16;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(-[NSObject ef_publicDescription](v13, "ef_publicDescription"));
      sub_1003954C4();
    }

    v15 = objc_claimAutoreleasedReturnValue(+[EFFuture futureWithError:](EFFuture, "futureWithError:", v13));
    goto LABEL_14;
  }
  v9 = objc_msgSend(v7, "unsignedIntegerValue");
  if ((_MSSourceTypeIsValid(v9) & 1) == 0)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Decoded smart mailbox source type (%lu) is invalid."), v9));
    v19 = v5;
    v20 = v18;
    v21 = objc_claimAutoreleasedReturnValue(+[NSError mf_restorationMailboxNotAvailableErrorWithUnderlyingError:](NSError, "mf_restorationMailboxNotAvailableErrorWithUnderlyingError:", 0));
    v13 = v19;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject ef_publicDescription](v21, "ef_publicDescription"));
      sub_100395510((uint64_t)v20, v22, (uint64_t)v28);
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[EFFuture futureWithError:](EFFuture, "futureWithError:", v21));
    v12 = v20;
    goto LABEL_21;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_100395594((uint64_t)v9, v5, v10);
  v11 = objc_claimAutoreleasedReturnValue(+[SharedMailboxController sharedInstanceForSourceType:](SharedMailboxController, "sharedInstanceForSourceType:", v9));
  v12 = v11;
  if (!v11)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("No SharedMailboxController found for source type (%lu)"), v9));
    v24 = v5;
    v21 = v23;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSError mf_restorationMailboxNotAvailableErrorWithUnderlyingError:](NSError, "mf_restorationMailboxNotAvailableErrorWithUnderlyingError:", 0));
    v20 = v24;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "ef_publicDescription"));
      sub_100395510((uint64_t)v21, v26, (uint64_t)v28);
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[EFFuture futureWithError:](EFFuture, "futureWithError:", v25));
    v13 = v21;
LABEL_21:

    goto LABEL_22;
  }
  v13 = objc_claimAutoreleasedReturnValue(-[NSObject mailbox](v11, "mailbox"));
  v14 = v5;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    objc_claimAutoreleasedReturnValue(-[NSObject ef_publicDescription](v13, "ef_publicDescription"));
    sub_100395558();
  }

  v15 = objc_claimAutoreleasedReturnValue(+[EFFuture futureWithResult:](EFFuture, "futureWithResult:", v13));
LABEL_14:
  v17 = (void *)v15;
LABEL_22:

  return v17;
}

- (id)_decodeUnifiedMailbox:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[RestorationMailboxDecoder log](self, "log"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_100395798();
  if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("UnifiedMailboxType")) & 1) != 0)
  {
    v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UnifiedMailboxType"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      sub_1003956E0((uint64_t)v6, v5, v7);
    v8 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("UnifiedMailboxName"));
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (v6 == (id)5)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        sub_1003956B4();
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[LocalAccount localAccount](LocalAccount, "localAccount"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "transientDraftsFolder"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "URL"));

      v13 = (void *)objc_claimAutoreleasedReturnValue(+[EMMessageListItemPredicates predicateForExcludingMessagesInMailboxWithURL:](EMMessageListItemPredicates, "predicateForExcludingMessagesInMailboxWithURL:", v12));
    }
    else
    {
      v13 = 0;
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[EMSmartMailbox unifiedMailboxOfType:name:additionalPredicate:](EMSmartMailbox, "unifiedMailboxOfType:name:additionalPredicate:", v6, v9, v13));
    v17 = v5;
    v18 = v17;
    if (v16)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "ef_publicDescription"));
        sub_100395678();
      }

      v15 = (void *)objc_claimAutoreleasedReturnValue(+[EFFuture futureWithResult:](EFFuture, "futureWithResult:", v16));
    }
    else
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSError mf_restorationMailboxNotAvailableErrorWithUnderlyingError:](NSError, "mf_restorationMailboxNotAvailableErrorWithUnderlyingError:", 0));
      v20 = v18;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "ef_publicDescription"));
        sub_10039562C();
      }

      v15 = (void *)objc_claimAutoreleasedReturnValue(+[EFFuture futureWithError:](EFFuture, "futureWithError:", v19));
    }

  }
  else
  {
    v14 = v5;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError mf_restorationMailboxNotAvailableErrorWithUnderlyingError:](NSError, "mf_restorationMailboxNotAvailableErrorWithUnderlyingError:", 0));
    v9 = v14;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "ef_publicDescription"));
      sub_10039574C();
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[EFFuture futureWithError:](EFFuture, "futureWithError:", v13));
  }

  return v15;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  self->_log = (OS_os_log *)a3;
}

- (EMDaemonInterface)daemonInterface
{
  return (EMDaemonInterface *)objc_loadWeakRetained((id *)&self->_daemonInterface);
}

- (void)setDaemonInterface:(id)a3
{
  objc_storeWeak((id *)&self->_daemonInterface, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_daemonInterface);
}

@end
