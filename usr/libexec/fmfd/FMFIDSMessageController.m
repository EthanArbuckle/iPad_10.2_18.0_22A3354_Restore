@implementation FMFIDSMessageController

+ (id)sharedInstance
{
  if (qword_1000B37A0 != -1)
    dispatch_once(&qword_1000B37A0, &stru_10009A230);
  return (id)qword_1000B3798;
}

+ (unint64_t)defaultTimeout
{
  return dispatch_time(0, 10000000000);
}

- (FMFIDSMessageController)init
{
  FMFIDSMessageController *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  IDSService *v5;
  IDSService *fmfIDSService;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FMFIDSMessageController;
  v2 = -[FMFIDSMessageController init](&v8, "init");
  if (v2)
  {
    v3 = dispatch_queue_create(off_1000B3090, 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = (IDSService *)objc_msgSend(objc_alloc((Class)IDSService), "initWithService:", CFSTR("com.apple.private.alloy.fmf"));
    fmfIDSService = v2->_fmfIDSService;
    v2->_fmfIDSService = v5;

    -[IDSService addDelegate:queue:](v2->_fmfIDSService, "addDelegate:queue:", v2, v2->_queue);
  }
  return v2;
}

- (id)IDSRecipientFromHandle:(id)a3
{
  id v3;
  void *v4;
  _BOOL4 IsEmail;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));
  IsEmail = FMFStringIsEmail(v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));
  if (IsEmail)
    v7 = IDSCopyIDForEmailAddress(v6);
  else
    v7 = IDSCopyIDForPhoneNumber(v6);
  v8 = (void *)v7;

  return v8;
}

- (BOOL)_sendMessage:(id)a3 toHandle:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;

  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", a4));
  LOBYTE(a5) = -[FMFIDSMessageController _sendMessage:toHandles:error:](self, "_sendMessage:toHandles:error:", v8, v9, a5);

  return (char)a5;
}

- (BOOL)_sendMessage:(id)a3 toHandles:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v17;
  id v18;
  BOOL v19;
  id v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  id v25;
  id v26;
  _QWORD v27[5];
  uint8_t buf[4];
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMFIDSMessageController fmfIDSService](self, "fmfIDSService"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "accounts"));

  if (objc_msgSend(v11, "count") && v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "anyObject"));
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10002F760;
    v27[3] = &unk_10009A258;
    v27[4] = self;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "fm_map:", v27));
    v14 = sub_100011D0C();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      v29 = v12;
      v30 = 2112;
      v31 = v9;
      v32 = 2112;
      v33 = v8;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Sending IDS message over account: %@, to handles: %@ with payload: %@", buf, 0x20u);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[FMFIDSMessageController fmfIDSService](self, "fmfIDSService"));
    v25 = 0;
    v26 = 0;
    objc_msgSend(v16, "sendMessage:toDestinations:priority:options:identifier:error:", v8, v13, 300, 0, &v26, &v25);
    v17 = v26;
    v18 = v25;

    v19 = v18 == 0;
    if (v18)
    {
      v20 = sub_100011D0C();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v29 = v18;
        v30 = 2112;
        v31 = v9;
        v32 = 2112;
        v33 = v8;
        _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Error (%@) sending IDS message to handles: %@ with payload: %@", buf, 0x20u);
      }

      if (a5)
        *a5 = objc_retainAutorelease(v18);
    }

  }
  else
  {
    v22 = sub_100011D0C();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Error no IDS Accounts on this device.", buf, 2u);
    }

    v19 = 0;
    if (a5)
      *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", FMFErrorDomain, 1017, 0));
  }

  return v19;
}

- (int64_t)checkIDSStatusOfRecipientForService:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  int64_t v12;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v4 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[FMFIDSMessageController checkIDSStatusOfRecipientForService:]"));
  v6 = objc_msgSend(objc_alloc((Class)FMFSynchronizer), "initWithDescription:andTimeout:", v5, 10.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[IDSIDQueryController sharedInstance](IDSIDQueryController, "sharedInstance"));
  v8 = &_dispatch_main_q;
  objc_msgSend(v7, "addDelegate:forService:listenerID:queue:", self, CFSTR("com.apple.private.alloy.fmf"), CFSTR("com.apple.private.alloy.fmf"), &_dispatch_main_q);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[IDSIDQueryController sharedInstance](IDSIDQueryController, "sharedInstance"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10002F934;
  v14[3] = &unk_10009A280;
  v10 = v4;
  v15 = v10;
  v17 = &v18;
  v11 = v6;
  v16 = v11;
  objc_msgSend(v9, "refreshIDStatusForDestination:service:listenerID:queue:completionBlock:", v10, CFSTR("com.apple.private.alloy.fmf"), CFSTR("com.apple.private.alloy.fmf"), &_dispatch_main_q, v14);

  objc_msgSend(v11, "wait");
  v12 = v19[3];

  _Block_object_dispose(&v18, 8);
  return v12;
}

+ (void)_receivedFenceTriggerMessage:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  NSSet *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint8_t buf[16];

  v3 = a3;
  v4 = objc_msgSend(v3, "objectForKey:ofClass:", CFSTR("fenceID"), objc_opt_class(NSString));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (v5)
  {
    v6 = objc_msgSend(v3, "objectForKey:ofClass:", CFSTR("uuid"), objc_opt_class(NSString));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (v7)
    {
      v8 = objc_msgSend(v3, "objectForKey:ofClass:", CFSTR("triggerStatus"), objc_opt_class(NSString));
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (v9)
      {
        v10 = objc_msgSend(v3, "objectForKey:ofClass:", CFSTR("date"), objc_opt_class(NSNumber));
        v11 = objc_claimAutoreleasedReturnValue(v10);
        v12 = v11;
        if (v11)
        {
          -[NSObject doubleValue](v11, "doubleValue");
          v13 = objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:"));
          v14 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v7);
          v15 = objc_msgSend(v3, "objectForKey:ofClass:", CFSTR("location"), objc_opt_class(NSData));
          v16 = objc_claimAutoreleasedReturnValue(v15);
          v31 = v14;
          v30 = (void *)v16;
          if (v16)
          {
            v17 = v16;
            v18 = +[NSSet setWithObject:](NSSet, "setWithObject:", objc_opt_class(CLLocation));
            v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
            v32 = 0;
            v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver _strictlyUnarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "_strictlyUnarchivedObjectOfClasses:fromData:error:", v19, v17, &v32));
            v27 = v32;

          }
          else
          {
            v27 = 0;
            v29 = 0;
          }
          v24 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance", v27));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "fenceSequencer"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "fenceManager"));
          objc_msgSend(v26, "receiveTriggerWithUUID:forFenceWithID:withStatus:atDate:triggerLocation:", v31, v5, v9, v13, v29);

        }
        else
        {
          v23 = sub_100011D0C();
          v13 = objc_claimAutoreleasedReturnValue(v23);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "No fence trigger time interval", buf, 2u);
          }
        }

      }
      else
      {
        v22 = sub_100011D0C();
        v12 = objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "No fence trigger status", buf, 2u);
        }
      }

    }
    else
    {
      v21 = sub_100011D0C();
      v9 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "No UUIDString received", buf, 2u);
      }
    }

  }
  else
  {
    v20 = sub_100011D0C();
    v7 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "No fenceID received", buf, 2u);
    }
  }

}

+ (void)_receivedShareInvitationMessage:(id)a3 fromID:(id)a4
{
  id v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  uint8_t v12[16];
  uint8_t buf[16];

  v4 = a3;
  v5 = objc_msgSend(v4, "objectForKey:ofClass:", CFSTR("p1"), objc_opt_class(NSString));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (v6)
  {
    v7 = objc_msgSend(v4, "objectForKey:ofClass:", CFSTR("p0"), objc_opt_class(NSString));
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (v8)
    {
      v9 = objc_claimAutoreleasedReturnValue(+[FMFCloudKitManager sharedInstance](FMFCloudKitManager, "sharedInstance"));
      -[NSObject handleReceiveCKShareWithURLString:invitationTokenBase64String:](v9, "handleReceiveCKShareWithURLString:invitationTokenBase64String:", v6, v8);
    }
    else
    {
      v11 = sub_100011D0C();
      v9 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "No param0 received", v12, 2u);
      }
    }

  }
  else
  {
    v10 = sub_100011D0C();
    v8 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "No param1 received", buf, 2u);
    }
  }

}

+ (void)_receivedDeletedFenceInformationMessage:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSSet *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint8_t v16[16];
  uint8_t buf[16];

  v3 = a3;
  v4 = objc_msgSend(v3, "objectForKey:ofClass:", CFSTR("fenceID"), objc_opt_class(NSString));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (v5)
  {
    v6 = objc_msgSend(v3, "objectForKey:ofClass:", CFSTR("ckRecordID"), objc_opt_class(NSData));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (v7)
    {
      v8 = +[NSSet setWithObject:](NSSet, "setWithObject:", objc_opt_class(CKRecordID));
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v15 = 0;
      v10 = objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver _strictlyUnarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "_strictlyUnarchivedObjectOfClasses:fromData:error:", v9, v7, &v15));

      v11 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "fenceSequencer"));
      objc_msgSend(v12, "cleanupRemovedFenceInformationWithFenceID:ckRecordID:", v5, v10);

    }
    else
    {
      v14 = sub_100011D0C();
      v10 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "No recordIDData received", v16, 2u);
      }
    }

  }
  else
  {
    v13 = sub_100011D0C();
    v7 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "No fenceID received", buf, 2u);
    }
  }

}

- (BOOL)sendTriggerWithUUID:(id)a3 forFenceWithID:(id)a4 withStatus:(id)a5 forDate:(id)a6 triggerLocation:(id)a7 toHandles:(id)a8 error:(id *)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  id v28;
  _QWORD v29[7];
  _QWORD v30[7];

  v28 = 0;
  v15 = a8;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", a7, 1, &v28));
  v21 = v28;
  v30[0] = CFSTR("fenceTrigger");
  v29[0] = CFSTR("kFMFServicePayloadKey");
  v29[1] = CFSTR("uuid");
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "UUIDString"));

  v30[1] = v22;
  v30[2] = v18;
  v29[2] = CFSTR("fenceID");
  v29[3] = CFSTR("triggerStatus");
  v30[3] = v17;
  v29[4] = CFSTR("date");
  objc_msgSend(v16, "timeIntervalSince1970");
  v24 = v23;

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v24));
  v30[4] = v25;
  v30[5] = v20;
  v29[5] = CFSTR("location");
  v29[6] = CFSTR("v");
  v30[6] = CFSTR("1");
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v30, v29, 7));

  LOBYTE(v25) = -[FMFIDSMessageController _sendMessage:toHandles:error:](self, "_sendMessage:toHandles:error:", v26, v15, a9);
  return (char)v25;
}

- (BOOL)sendDeletedFenceMessageWithFenceID:(id)a3 ckRecordID:(id)a4 toHandles:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  BOOL v14;
  id v16;

  v10 = a3;
  v11 = a5;
  if (a4)
  {
    v16 = 0;
    a4 = (id)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", a4, 1, &v16));
    v12 = v16;
  }
  else
  {
    v12 = 0;
  }
  v13 = objc_alloc_init((Class)NSMutableDictionary);
  objc_msgSend(v13, "fm_safeSetObject:forKey:", CFSTR("deletedFenceInformation"), CFSTR("kFMFServicePayloadKey"));
  objc_msgSend(v13, "fm_safeSetObject:forKey:", v10, CFSTR("fenceID"));
  objc_msgSend(v13, "fm_safeSetObject:forKey:", a4, CFSTR("ckRecordID"));
  v14 = -[FMFIDSMessageController _sendMessage:toHandles:error:](self, "_sendMessage:toHandles:error:", v13, v11, a6);

  return v14;
}

- (void)sendMappingPacket:(id)a3 toHandle:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[3];
  _QWORD v10[3];

  v9[0] = CFSTR("p");
  v9[1] = CFSTR("kFMFServicePayloadKey");
  v10[0] = a3;
  v10[1] = CFSTR("mappingPacket");
  v9[2] = CFSTR("v");
  v10[2] = CFSTR("1");
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 3));

  -[FMFIDSMessageController _sendMessage:toHandle:error:](self, "_sendMessage:toHandle:error:", v8, v6, 0);
}

- (BOOL)sendMessage:(id)a3 toIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;

  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[FMFHandle handleWithId:](FMFHandle, "handleWithId:", a4));
  LOBYTE(a5) = -[FMFIDSMessageController _sendMessage:toHandle:error:](self, "_sendMessage:toHandle:error:", v8, v9, a5);

  return (char)a5;
}

- (void)updateIDSStatusForHandle:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMFIDSMessageController IDSRecipientFromHandle:](self, "IDSRecipientFromHandle:", v6));
  objc_msgSend(v6, "setIdsStatus:", -[FMFIDSMessageController checkIDSStatusOfRecipientForService:](self, "checkIDSStatusOfRecipientForService:", v4));
  v5 = (void *)IDSCopyRawAddressForDestination(v4);
  if (objc_msgSend(v5, "length"))
    objc_msgSend(v6, "setQualifiedIdentifier:", v5);

}

- (void)hasIDSFenceCapabilityForHandle:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD *v17;
  _QWORD v18[3];
  char v19;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMFIDSMessageController IDSRecipientFromHandle:](self, "IDSRecipientFromHandle:", v6));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[IDSIDQueryController sharedInstance](IDSIDQueryController, "sharedInstance"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v8, 0));
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v19 = 0;
  v11 = &_dispatch_main_q;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000306B4;
  v14[3] = &unk_10009A2A8;
  v12 = v8;
  v15 = v12;
  v17 = v18;
  v13 = v7;
  v16 = v13;
  objc_msgSend(v9, "currentRemoteDevicesForDestinations:service:listenerID:queue:completionBlock:", v10, CFSTR("com.apple.private.alloy.fmf"), CFSTR("com.apple.private.alloy.fmf"), &_dispatch_main_q, v14);

  _Block_object_dispose(v18, 8);
}

- (void)senderIsValid:(id)a3 idsSenderRequirement:(int64_t)a4 fenceId:(id)a5 ckRecordName:(id)a6 withCompletion:(id)a7
{
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  dispatch_queue_global_t global_queue;
  NSObject *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  _QWORD block[4];
  id v37;
  id v38;
  id v39;
  __int128 *v40;
  _QWORD v41[5];
  id v42;
  NSObject *v43;
  __int128 *p_buf;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t v49[128];
  __int128 buf;
  uint64_t v51;
  char v52;

  v11 = a3;
  v34 = a5;
  v33 = a6;
  v32 = a7;
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "senderCorrelationIdentifier"));
  v12 = sub_100011D0C();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "senderCorrelationIdentifier"));
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "FMFIDSMessageController: sender correlationID: %@", (uint8_t *)&buf, 0xCu);

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v51 = 0x2020000000;
  v52 = 0;
  if (a4 == 2)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "followerHandles"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "followingHandles"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "setByAddingObjectsFromSet:", v20));

  }
  else
  {
    if (a4 == 1)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
      v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "followingHandles"));
    }
    else
    {
      v15 = 0;
      if (a4)
        goto LABEL_11;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
      v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "followerHandles"));
    }
    v15 = (void *)v17;
  }

LABEL_11:
  v21 = dispatch_group_create();
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v22 = v15;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
  if (v23)
  {
    v24 = *(_QWORD *)v46;
LABEL_13:
    v25 = 0;
    while (1)
    {
      if (*(_QWORD *)v46 != v24)
        objc_enumerationMutation(v22);
      v26 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v25);
      dispatch_group_enter(v21);
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472;
      v41[2] = sub_100030C10;
      v41[3] = &unk_10009A2D0;
      v41[4] = v26;
      v42 = v35;
      p_buf = &buf;
      v43 = v21;
      objc_msgSend(v26, "idsCorrelationIdentifierWithCompletion:", v41);
      LOBYTE(v26) = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24) == 0;

      if ((v26 & 1) == 0)
        break;
      if (v23 == (id)++v25)
      {
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
        if (v23)
          goto LABEL_13;
        break;
      }
    }
  }

  global_queue = dispatch_get_global_queue(0, 0);
  v28 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100030D0C;
  block[3] = &unk_10009A320;
  v39 = v32;
  v40 = &buf;
  v37 = v34;
  v38 = v33;
  v29 = v33;
  v30 = v32;
  v31 = v34;
  dispatch_group_notify(v21, v28, block);

  _Block_object_dispose(&buf, 8);
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  void *v26;
  FMFIDSMessageController *v27;
  id v28;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v15 = objc_msgSend(v12, "objectForKey:ofClass:", CFSTR("kFMFServicePayloadKey"), objc_opt_class(NSString));
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCommandManager sharedInstance](FMFCommandManager, "sharedInstance"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000312EC;
  v22[3] = &unk_10009A398;
  v23 = v11;
  v24 = v12;
  v25 = v13;
  v26 = v16;
  v27 = self;
  v28 = v14;
  v18 = v14;
  v19 = v13;
  v20 = v12;
  v21 = v11;
  objc_msgSend(v17, "refreshForSession:withReason:withCompletion:", 0, 3, v22);

}

- (IDSService)fmfIDSService
{
  return self->_fmfIDSService;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSMutableSet)servicesRegistered
{
  return self->_servicesRegistered;
}

- (void)setServicesRegistered:(id)a3
{
  objc_storeStrong((id *)&self->_servicesRegistered, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_servicesRegistered, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_fmfIDSService, 0);
}

@end
