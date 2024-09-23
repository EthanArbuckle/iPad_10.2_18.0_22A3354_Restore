@implementation MSDPairedWatchProxy

+ (id)sharedInstance
{
  if (qword_100175208 != -1)
    dispatch_once(&qword_100175208, &stru_10013E228);
  return (id)qword_100175200;
}

- (MSDPairedWatchProxy)init
{
  MSDPairedWatchProxy *v2;
  MSDCompanionIDSHandler *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MSDPairedWatchProxy;
  v2 = -[MSDPairedDeviceProxy init](&v5, "init");
  if (v2)
  {
    v3 = -[MSDIDSHandler initWithDelegate:]([MSDCompanionIDSHandler alloc], "initWithDelegate:", v2);
    -[MSDPairedWatchProxy setIdsHandler:](v2, "setIdsHandler:", v3);

  }
  return v2;
}

- (void)bootstrap
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MSDPairedWatchProxy;
  -[MSDPairedDeviceProxy bootstrap](&v7, "bootstrap");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDPairedWatchProxy idsHandler](self, "idsHandler"));
  objc_msgSend(v3, "start");

  -[MSDPairedWatchProxy setSyncState:](self, "setSyncState:", 0);
  v4 = objc_alloc_init((Class)PSYSyncSessionObserver);
  -[MSDPairedWatchProxy setSyncSessionObserver:](self, "setSyncSessionObserver:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDPairedWatchProxy syncSessionObserver](self, "syncSessionObserver"));
  objc_msgSend(v5, "setDelegate:", self);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDPairedWatchProxy syncSessionObserver](self, "syncSessionObserver"));
  objc_msgSend(v6, "startObservingSyncSessionsWithCompletion:", &stru_10013E268);

}

- (BOOL)canUpdateContent
{
  void *v3;
  const __CFString *v5;
  void *v6;

  v5 = CFSTR("ForDryRun");
  v6 = &__kCFBooleanTrue;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1));
  LOBYTE(self) = -[MSDPairedWatchProxy _sendIDSRequestMessageOfType:withPayload:](self, "_sendIDSRequestMessageOfType:withPayload:", 0, v3);

  return (char)self;
}

- (BOOL)canLockSnapshot
{
  void *v3;
  _QWORD v5[2];
  _QWORD v6[2];

  v5[0] = CFSTR("SnapshotAction");
  v5[1] = CFSTR("ForDryRun");
  v6[0] = &off_10014D820;
  v6[1] = &__kCFBooleanTrue;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v6, v5, 2));
  LOBYTE(self) = -[MSDPairedWatchProxy _sendIDSRequestMessageOfType:withPayload:](self, "_sendIDSRequestMessageOfType:withPayload:", 1, v3);

  return (char)self;
}

- (BOOL)canUnlockSnapshot
{
  void *v3;
  _QWORD v5[2];
  _QWORD v6[2];

  v5[0] = CFSTR("SnapshotAction");
  v5[1] = CFSTR("ForDryRun");
  v6[0] = &off_10014D838;
  v6[1] = &__kCFBooleanTrue;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v6, v5, 2));
  LOBYTE(self) = -[MSDPairedWatchProxy _sendIDSRequestMessageOfType:withPayload:](self, "_sendIDSRequestMessageOfType:withPayload:", 1, v3);

  return (char)self;
}

- (BOOL)canRevertSnapshot
{
  void *v3;
  _QWORD v5[2];
  _QWORD v6[2];

  v5[0] = CFSTR("SnapshotAction");
  v5[1] = CFSTR("ForDryRun");
  v6[0] = &off_10014D850;
  v6[1] = &__kCFBooleanTrue;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v6, v5, 2));
  LOBYTE(self) = -[MSDPairedWatchProxy _sendIDSRequestMessageOfType:withPayload:](self, "_sendIDSRequestMessageOfType:withPayload:", 1, v3);

  return (char)self;
}

- (BOOL)canUnenrollWithObliteration:(BOOL)a3
{
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[2];

  v7[0] = CFSTR("ForDryRun");
  v7[1] = CFSTR("WithObliteration");
  v8[0] = &__kCFBooleanTrue;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a3));
  v8[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v8, v7, 2));

  LOBYTE(self) = -[MSDPairedWatchProxy _sendIDSRequestMessageOfType:withPayload:](self, "_sendIDSRequestMessageOfType:withPayload:", 3, v5);
  return (char)self;
}

- (BOOL)updateContentWithDeadline:(int)a3
{
  void *v4;
  void *v5;
  const __CFString *v7;
  void *v8;

  v7 = CFSTR("CompleteBy");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(_QWORD *)&a3));
  v8 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1));

  LOBYTE(self) = -[MSDPairedWatchProxy _sendIDSRequestMessageOfType:withPayload:](self, "_sendIDSRequestMessageOfType:withPayload:", 0, v5);
  return (char)self;
}

- (BOOL)lockSnapshot
{
  void *v3;
  const __CFString *v5;
  _UNKNOWN **v6;

  v5 = CFSTR("SnapshotAction");
  v6 = &off_10014D820;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1));
  LOBYTE(self) = -[MSDPairedWatchProxy _sendIDSRequestMessageOfType:withPayload:](self, "_sendIDSRequestMessageOfType:withPayload:", 1, v3);

  return (char)self;
}

- (BOOL)unlockSnapshot
{
  void *v3;
  const __CFString *v5;
  _UNKNOWN **v6;

  v5 = CFSTR("SnapshotAction");
  v6 = &off_10014D838;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1));
  LOBYTE(self) = -[MSDPairedWatchProxy _sendIDSRequestMessageOfType:withPayload:](self, "_sendIDSRequestMessageOfType:withPayload:", 1, v3);

  return (char)self;
}

- (BOOL)revertSnapshot
{
  void *v3;
  const __CFString *v5;
  _UNKNOWN **v6;

  v5 = CFSTR("SnapshotAction");
  v6 = &off_10014D850;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1));
  LOBYTE(self) = -[MSDPairedWatchProxy _sendIDSRequestMessageOfType:withPayload:](self, "_sendIDSRequestMessageOfType:withPayload:", 1, v3);

  return (char)self;
}

- (BOOL)reboot
{
  return -[MSDPairedWatchProxy _sendIDSRequestMessageOfType:withPayload:](self, "_sendIDSRequestMessageOfType:withPayload:", 2, 0);
}

- (BOOL)unenrollWithObliteration:(BOOL)a3 callUnregister:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[2];

  v4 = a4;
  v10[0] = CFSTR("WithObliteration");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a3));
  v11[0] = v6;
  v10[1] = CFSTR("CallUnregister");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4));
  v11[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 2));

  LOBYTE(v7) = -[MSDPairedWatchProxy _sendIDSRequestMessageOfType:withPayload:](self, "_sendIDSRequestMessageOfType:withPayload:", 3, v8);
  return (char)v7;
}

- (BOOL)cancelOperation
{
  return -[MSDPairedWatchProxy _sendIDSRequestMessageOfType:withPayload:](self, "_sendIDSRequestMessageOfType:withPayload:", 4, 0);
}

- (BOOL)signalContentUpdateCompletion:(BOOL)a3 andError:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;

  v4 = a3;
  v6 = a4;
  v7 = objc_alloc_init((Class)NSMutableDictionary);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4));
  objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("ContentUpdateCompleted"));

  if (v6)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v6, "code")));
    objc_msgSend(v7, "setObject:forKey:", v9, CFSTR("ErrorCode"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedDescription"));
    objc_msgSend(v7, "setObject:forKey:", v10, CFSTR("ErrorMessage"));

  }
  v11 = -[MSDPairedWatchProxy _sendIDSRequestMessageOfType:withPayload:](self, "_sendIDSRequestMessageOfType:withPayload:", 0, v7);

  return v11;
}

- (void)syncSessionObserver:(id)a3 receivedSyncSession:(id)a4
{
  -[MSDPairedWatchProxy _updateSyncStatusFromSyncSession:](self, "_updateSyncStatusFromSyncSession:", a4);
}

- (void)syncSessionObserver:(id)a3 didReceiveUpdate:(id)a4
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "updatedSession", a3));
  -[MSDPairedWatchProxy _updateSyncStatusFromSyncSession:](self, "_updateSyncStatusFromSyncSession:", v5);

}

- (void)syncSessionObserver:(id)a3 didInvalidateSyncSession:(id)a4
{
  -[MSDPairedWatchProxy _updateSyncStatusFromSyncSession:](self, "_updateSyncStatusFromSyncSession:", a4);
}

- (void)_updateSyncStatusFromSyncSession:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  int v17;
  void *v18;

  v4 = a3;
  if (objc_msgSend(v4, "syncSessionType") != (id)1)
  {
    v5 = objc_msgSend(v4, "syncSessionState");
    v6 = objc_msgSend(v4, "syncSessionType");
    v7 = NSStringfromPSYSyncSessionType();
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    if (v5 == (id)2)
    {
      if (-[MSDPairedWatchProxy syncState](self, "syncState") == 2)
        goto LABEL_18;
      -[MSDPairedWatchProxy setSyncState:](self, "setSyncState:", 2);
      v11 = sub_1000604F0();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 138543362;
        v18 = v8;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Paired device sync just completed! Type: %{public}@", (uint8_t *)&v17, 0xCu);
      }

      v13 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](MSDTargetDevice, "sharedInstance"));
      objc_msgSend(v13, "setWaitingForCommand:", 1);

      if (v6)
        goto LABEL_18;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[MSDProgressUpdater sharedInstance](MSDProgressUpdater, "sharedInstance"));
      objc_msgSend(v14, "updateStage:", 100);

      v10 = objc_claimAutoreleasedReturnValue(+[MSDUIHelper sharedInstance](MSDUIHelper, "sharedInstance"));
      -[NSObject startFullScreenUIWith:allowCancel:](v10, "startFullScreenUIWith:allowCancel:", CFSTR("IN_PROGRESS"), 1);
    }
    else if (v5 == (id)1)
    {
      if (-[MSDPairedWatchProxy syncState](self, "syncState") == 1)
      {
LABEL_18:

        goto LABEL_19;
      }
      -[MSDPairedWatchProxy setSyncState:](self, "setSyncState:", 1);
      v15 = sub_1000604F0();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 138543362;
        v18 = v8;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Paired device sync has started! Type: %{public}@", (uint8_t *)&v17, 0xCu);
      }

      v10 = objc_claimAutoreleasedReturnValue(+[MSDProgressUpdater sharedInstance](MSDProgressUpdater, "sharedInstance"));
      -[NSObject updateStage:](v10, "updateStage:", 32);
    }
    else
    {
      if (v5 || !-[MSDPairedWatchProxy syncState](self, "syncState"))
        goto LABEL_18;
      -[MSDPairedWatchProxy setSyncState:](self, "setSyncState:", 0);
      v9 = sub_1000604F0();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 138543362;
        v18 = v8;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Paired device sync is inactive! Type: %{public}@", (uint8_t *)&v17, 0xCu);
      }
    }

    goto LABEL_18;
  }
LABEL_19:

}

- (BOOL)_sendIDSRequestMessageOfType:(unsigned __int16)a3 withPayload:(id)a4
{
  uint64_t v4;
  id v6;
  dispatch_semaphore_t v7;
  void *v8;
  NSObject *v9;
  BOOL v10;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[4];
  NSObject *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;

  v4 = a3;
  v6 = a4;
  v7 = dispatch_semaphore_create(0);
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDPairedWatchProxy idsHandler](self, "idsHandler"));
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10002CC44;
  v29[3] = &unk_10013E290;
  v31 = &v32;
  v9 = v7;
  v30 = v9;
  LOBYTE(v4) = objc_msgSend(v8, "sendRequestMessageOfType:withPayload:andResponseHandler:", v4, v6, v29);

  if ((v4 & 1) == 0)
  {
    v12 = sub_1000604F0();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1000BB5B4(v13, v14, v15, v16, v17, v18, v19, v20);
    goto LABEL_9;
  }
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  if (!*((_BYTE *)v33 + 24))
  {
    v21 = sub_1000604F0();
    v13 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1000BB580(v13, v22, v23, v24, v25, v26, v27, v28);
LABEL_9:

    v10 = 0;
    goto LABEL_4;
  }
  v10 = 1;
LABEL_4:

  _Block_object_dispose(&v32, 8);
  return v10;
}

- (MSDCompanionIDSHandler)idsHandler
{
  return self->_idsHandler;
}

- (void)setIdsHandler:(id)a3
{
  objc_storeStrong((id *)&self->_idsHandler, a3);
}

- (unsigned)syncState
{
  return self->_syncState;
}

- (void)setSyncState:(unsigned __int8)a3
{
  self->_syncState = a3;
}

- (PSYSyncSessionObserver)syncSessionObserver
{
  return self->_syncSessionObserver;
}

- (void)setSyncSessionObserver:(id)a3
{
  objc_storeStrong((id *)&self->_syncSessionObserver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncSessionObserver, 0);
  objc_storeStrong((id *)&self->_idsHandler, 0);
}

@end
