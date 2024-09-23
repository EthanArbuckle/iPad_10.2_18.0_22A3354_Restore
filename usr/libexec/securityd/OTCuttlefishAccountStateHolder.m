@implementation OTCuttlefishAccountStateHolder

- (OTCuttlefishAccountStateHolder)initWithQueue:(id)a3 container:(id)a4 context:(id)a5 personaAdapter:(id)a6 activeAccount:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  OTCuttlefishAccountStateHolder *v17;
  OTCuttlefishAccountStateHolder *v18;
  dispatch_queue_t v19;
  OS_dispatch_queue *notifyQueue;
  uint64_t v21;
  NSMutableSet *monitors;
  id v24;
  objc_super v25;

  v24 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v25.receiver = self;
  v25.super_class = (Class)OTCuttlefishAccountStateHolder;
  v17 = -[OTCuttlefishAccountStateHolder init](&v25, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_queue, a3);
    v19 = dispatch_queue_create("OTCuttlefishAccountStateHolderNotifier", 0);
    notifyQueue = v18->_notifyQueue;
    v18->_notifyQueue = (OS_dispatch_queue *)v19;

    objc_storeStrong((id *)&v18->_containerName, a4);
    objc_storeStrong((id *)&v18->_contextID, a5);
    v21 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    monitors = v18->_monitors;
    v18->_monitors = (NSMutableSet *)v21;

    objc_storeStrong((id *)&v18->_personaAdapter, a6);
    objc_storeStrong((id *)&v18->_activeAccount, a7);
  }

  return v18;
}

- (void)registerNotification:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[OTCuttlefishAccountStateHolder monitors](self, "monitors"));
  objc_msgSend(v5, "addObject:", v4);

}

- (id)loadOrCreateAccountMetadata:(id *)a3
{
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD block[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_1001C0BD8;
  v20 = sub_1001C0BE8;
  v21 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = sub_1001C0BD8;
  v14 = sub_1001C0BE8;
  v15 = 0;
  v5 = objc_claimAutoreleasedReturnValue(-[OTCuttlefishAccountStateHolder queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C0DFC;
  block[3] = &unk_1002EAEE8;
  block[4] = self;
  block[5] = &v16;
  block[6] = &v10;
  dispatch_sync(v5, block);

  if (a3)
  {
    v6 = (void *)v11[5];
    if (v6)
      *a3 = objc_retainAutorelease(v6);
  }
  v7 = (id)v17[5];
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  return v7;
}

- (id)_onqueueLoadOrCreateAccountMetadata:(id *)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  OTAccountMetadataClassC *v11;
  id v12;
  void *v13;
  id v14;
  OTAccountMetadataClassC *v15;
  OTAccountMetadataClassC *v16;
  id v18;

  v5 = objc_claimAutoreleasedReturnValue(-[OTCuttlefishAccountStateHolder queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishAccountStateHolder containerName](self, "containerName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishAccountStateHolder contextID](self, "contextID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishAccountStateHolder personaAdapter](self, "personaAdapter"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishAccountStateHolder activeAccount](self, "activeAccount"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "personaUniqueString"));
  v18 = 0;
  v11 = (OTAccountMetadataClassC *)objc_claimAutoreleasedReturnValue(+[OTAccountMetadataClassC loadFromKeychainForContainer:contextID:personaAdapter:personaUniqueString:error:](OTAccountMetadataClassC, "loadFromKeychainForContainer:contextID:personaAdapter:personaUniqueString:error:", v6, v7, v8, v10, &v18));
  v12 = v18;

  if (v11 && !v12)
    goto LABEL_6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "domain"));
  if (objc_msgSend(v13, "isEqualToString:", NSOSStatusErrorDomain))
  {
    v14 = objc_msgSend(v12, "code");

    if (v14 == (id)-25300)
    {
      v15 = objc_alloc_init(OTAccountMetadataClassC);

      -[OTAccountMetadataClassC setAttemptedJoin:](v15, "setAttemptedJoin:", 1);
      v11 = v15;
LABEL_6:
      v16 = v11;
      v11 = v16;
      goto LABEL_10;
    }
  }
  else
  {

  }
  v16 = 0;
  if (a3)
    *a3 = objc_retainAutorelease(v12);
LABEL_10:

  return v16;
}

- (id)getEgoPeerID:(id *)a3
{
  void *v4;
  id v5;
  void *v6;
  BOOL v7;
  id v8;
  void *v9;
  void *v10;
  id v12;

  v12 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishAccountStateHolder loadOrCreateAccountMetadata:](self, "loadOrCreateAccountMetadata:", &v12));
  v5 = v12;
  v6 = v5;
  if (v5)
    v7 = 1;
  else
    v7 = v4 == 0;
  if (v7)
  {
    if (a3)
    {
      v8 = objc_retainAutorelease(v5);
LABEL_12:
      v10 = 0;
      *a3 = v8;
      goto LABEL_14;
    }
LABEL_13:
    v10 = 0;
    goto LABEL_14;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "peerID"));

  if (!v9)
  {
    if (a3)
    {
      v8 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("otcuttlefish"), 0, CFSTR("No existing ego peer ID")));
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "peerID"));
LABEL_14:

  return v10;
}

- (id)lastHealthCheckupDate:(id *)a3
{
  void *v4;
  id v5;
  void *v6;
  BOOL v7;
  void *v8;
  id v10;

  v10 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishAccountStateHolder loadOrCreateAccountMetadata:](self, "loadOrCreateAccountMetadata:", &v10));
  v5 = v10;
  v6 = v5;
  if (v5)
    v7 = 1;
  else
    v7 = v4 == 0;
  if (v7)
  {
    v8 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v5);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v4, "lastHealthCheckup") / 1000.0));
  }

  return v8;
}

- (BOOL)persistNewEgoPeerID:(id)a3 error:(id *)a4
{
  id v6;
  _QWORD v8[4];
  id v9;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001C0DCC;
  v8[3] = &unk_1002EAF10;
  v9 = a3;
  v6 = v9;
  LOBYTE(a4) = -[OTCuttlefishAccountStateHolder persistAccountChanges:error:](self, "persistAccountChanges:error:", v8, a4);

  return (char)a4;
}

- (BOOL)persistNewTrustState:(int)a3 error:(id *)a4
{
  _QWORD v5[4];
  int v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001C0D9C;
  v5[3] = &unk_1002EAF30;
  v6 = a3;
  return -[OTCuttlefishAccountStateHolder persistAccountChanges:error:](self, "persistAccountChanges:error:", v5, a4);
}

- (BOOL)persistAccountChanges:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  uint64_t v10;
  char v11;
  void **v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  OTCuttlefishAccountStateHolder *v17;
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;

  v6 = a3;
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = sub_1001C0BD8;
  v43 = sub_1001C0BE8;
  v44 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = sub_1001C0BD8;
  v37 = sub_1001C0BE8;
  v38 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = sub_1001C0BD8;
  v31 = sub_1001C0BE8;
  v32 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v7 = objc_claimAutoreleasedReturnValue(-[OTCuttlefishAccountStateHolder queue](self, "queue"));
  v13 = _NSConcreteStackBlock;
  v14 = 3221225472;
  v15 = sub_1001C0BF0;
  v16 = &unk_1002EAF58;
  v19 = &v27;
  v20 = &v39;
  v17 = self;
  v21 = &v33;
  v8 = v6;
  v18 = v8;
  v22 = &v23;
  dispatch_sync(v7, &v13);

  if (a4)
  {
    v9 = (void *)v40[5];
    if (v9)
      *a4 = objc_retainAutorelease(v9);
  }
  v10 = v34[5];
  if (v10)
    -[OTCuttlefishAccountStateHolder asyncNotifyAccountStateChanges:from:](self, "asyncNotifyAccountStateChanges:from:", v10, v28[5], v13, v14, v15, v16, v17);
  v11 = *((_BYTE *)v24 + 24);

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v39, 8);

  return v11;
}

- (BOOL)persistLastHealthCheck:(id)a3 error:(id *)a4
{
  id v6;
  _QWORD v8[4];
  id v9;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001C0B90;
  v8[3] = &unk_1002EAF10;
  v9 = a3;
  v6 = v9;
  LOBYTE(a4) = -[OTCuttlefishAccountStateHolder persistAccountChanges:error:](self, "persistAccountChanges:error:", v8, a4);

  return (char)a4;
}

- (BOOL)persistOctagonJoinAttempt:(int)a3 error:(id *)a4
{
  _QWORD v5[4];
  int v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001C0B60;
  v5[3] = &unk_1002EAF30;
  v6 = a3;
  return -[OTCuttlefishAccountStateHolder persistAccountChanges:error:](self, "persistAccountChanges:error:", v5, a4);
}

- (int)fetchSendingMetricsPermitted:(id *)a3
{
  void *v4;
  id v5;
  void *v6;
  BOOL v7;
  int v8;
  id v10;

  v10 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishAccountStateHolder loadOrCreateAccountMetadata:](self, "loadOrCreateAccountMetadata:", &v10));
  v5 = v10;
  v6 = v5;
  if (v5)
    v7 = 1;
  else
    v7 = v4 == 0;
  if (v7)
  {
    v8 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v5);
  }
  else
  {
    v8 = objc_msgSend(v4, "sendingMetricsPermitted");
  }

  return v8;
}

- (BOOL)persistSendingMetricsPermitted:(int)a3 error:(id *)a4
{
  _QWORD v5[4];
  int v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001C0B30;
  v5[3] = &unk_1002EAF30;
  v6 = a3;
  return -[OTCuttlefishAccountStateHolder persistAccountChanges:error:](self, "persistAccountChanges:error:", v5, a4);
}

- (BOOL)_onqueuePersistAccountChanges:(id)a3 error:(id *)a4
{
  uint64_t (**v6)(id, id);
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  id v20;
  id *v21;
  uint64_t (**v22)(id, id);
  id v23;
  id v24;

  v6 = (uint64_t (**)(id, id))a3;
  v7 = objc_claimAutoreleasedReturnValue(-[OTCuttlefishAccountStateHolder queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  v24 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishAccountStateHolder _onqueueLoadOrCreateAccountMetadata:](self, "_onqueueLoadOrCreateAccountMetadata:", &v24));
  v9 = v24;
  if (!v8)
  {
    v12 = 0;
    if (!a4)
      goto LABEL_9;
    goto LABEL_7;
  }
  v21 = a4;
  v10 = objc_msgSend(v8, "copy");
  v22 = v6;
  v11 = v6[2](v6, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishAccountStateHolder containerName](self, "containerName"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishAccountStateHolder contextID](self, "contextID"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishAccountStateHolder personaAdapter](self, "personaAdapter"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishAccountStateHolder activeAccount](self, "activeAccount"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "personaUniqueString"));
  v23 = v9;
  v18 = objc_msgSend(v12, "saveToKeychainForContainer:contextID:personaAdapter:personaUniqueString:error:", v13, v14, v15, v17, &v23);
  v20 = v23;

  if ((v18 & 1) == 0)
  {

    v12 = 0;
  }
  v9 = v20;
  a4 = v21;
  v6 = v22;
  if (v21)
  {
LABEL_7:
    if (v9)
      *a4 = objc_retainAutorelease(v9);
  }
LABEL_9:
  if (v12)
    -[OTCuttlefishAccountStateHolder asyncNotifyAccountStateChanges:from:](self, "asyncNotifyAccountStateChanges:from:", v12, v8);

  return v12 != 0;
}

- (void)asyncNotifyAccountStateChanges:(id)a3 from:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v8 = objc_claimAutoreleasedReturnValue(-[OTCuttlefishAccountStateHolder notifyQueue](self, "notifyQueue"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001C0A28;
  v11[3] = &unk_1002EB5C0;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (OS_dispatch_queue)notifyQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setNotifyQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)containerName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setContainerName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)contextID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setContextID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (OTPersonaAdapter)personaAdapter
{
  return (OTPersonaAdapter *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPersonaAdapter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (TPSpecificUser)activeAccount
{
  return (TPSpecificUser *)objc_getProperty(self, a2, 48, 1);
}

- (void)setActiveAccount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSMutableSet)monitors
{
  return (NSMutableSet *)objc_getProperty(self, a2, 56, 1);
}

- (void)setMonitors:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monitors, 0);
  objc_storeStrong((id *)&self->_activeAccount, 0);
  objc_storeStrong((id *)&self->_personaAdapter, 0);
  objc_storeStrong((id *)&self->_contextID, 0);
  objc_storeStrong((id *)&self->_containerName, 0);
  objc_storeStrong((id *)&self->_notifyQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
