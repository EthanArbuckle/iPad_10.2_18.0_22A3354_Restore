@implementation CuttlefishXPCWrapper

- (CuttlefishXPCWrapper)initWithCuttlefishXPCConnection:(id)a3
{
  id v5;
  CuttlefishXPCWrapper *v6;
  CuttlefishXPCWrapper *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CuttlefishXPCWrapper;
  v6 = -[CuttlefishXPCWrapper init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_cuttlefishXPCConnection, a3);

  return v7;
}

- (void)pingWithReply:(id)a3
{
  char *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;
  _QWORD v13[3];
  int v14;

  v4 = &v12;
  v5 = a3;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v14 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = -86;
  do
  {
    *v4 = 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100040F94;
    v8[3] = &unk_1002DD580;
    v8[4] = self;
    v8[5] = v13;
    v8[6] = &v9;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v8));
    objc_msgSend(v7, "pingWithReply:", v5);

    v4 = (char *)(v10 + 3);
  }
  while (*((_BYTE *)v10 + 24));
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(v13, 8);

}

- (void)dumpWithSpecificUser:(id)a3 reply:(id)a4
{
  char *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  _QWORD *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  _QWORD v20[3];
  int v21;

  v6 = &v19;
  v7 = a3;
  v8 = a4;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v21 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = -86;
  do
  {
    *v6 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100040DDC;
    v12[3] = &unk_1002DBA50;
    v14 = v20;
    v15 = &v16;
    v12[4] = self;
    v10 = v8;
    v13 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v12));
    objc_msgSend(v11, "dumpWithSpecificUser:reply:", v7, v10);

    v6 = (char *)(v17 + 3);
  }
  while (*((_BYTE *)v17 + 24));
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v20, 8);

}

- (void)departByDistrustingSelfWithSpecificUser:(id)a3 reply:(id)a4
{
  char *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  _QWORD *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  _QWORD v20[3];
  int v21;

  v6 = &v19;
  v7 = a3;
  v8 = a4;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v21 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = -86;
  do
  {
    *v6 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100040C28;
    v12[3] = &unk_1002DBA50;
    v14 = v20;
    v15 = &v16;
    v12[4] = self;
    v10 = v8;
    v13 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v12));
    objc_msgSend(v11, "departByDistrustingSelfWithSpecificUser:reply:", v7, v10);

    v6 = (char *)(v17 + 3);
  }
  while (*((_BYTE *)v17 + 24));
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v20, 8);

}

- (void)distrustPeerIDsWithSpecificUser:(id)a3 peerIDs:(id)a4 reply:(id)a5
{
  char *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  _QWORD v23[3];
  int v24;

  v8 = &v22;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v24 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = -86;
  do
  {
    *v8 = 0;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100040A74;
    v15[3] = &unk_1002DBA50;
    v17 = v23;
    v15[4] = self;
    v18 = &v19;
    v13 = v11;
    v16 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "synchronousRemoteObjectProxyWithErrorHandler:", v15));
    objc_msgSend(v14, "distrustPeerIDsWithSpecificUser:peerIDs:reply:", v9, v10, v13);

    v8 = (char *)(v20 + 3);
  }
  while (*((_BYTE *)v20 + 24));
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(v23, 8);

}

- (void)dropPeerIDsWithSpecificUser:(id)a3 peerIDs:(id)a4 reply:(id)a5
{
  void (**v5)(id, void *);
  const void *v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];

  v5 = (void (**)(id, void *))a5;
  v6 = sub_10000EF14("SecError");
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "octagon: drop unsupported from within securityd", v9, 2u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, -4, 0));
  v5[2](v5, v8);

}

- (void)trustStatusWithSpecificUser:(id)a3 reply:(id)a4
{
  char *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  _QWORD *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  _QWORD v20[3];
  int v21;

  v6 = &v19;
  v7 = a3;
  v8 = a4;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v21 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = -86;
  do
  {
    *v6 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000408BC;
    v12[3] = &unk_1002DBA50;
    v14 = v20;
    v15 = &v16;
    v12[4] = self;
    v10 = v8;
    v13 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v12));
    objc_msgSend(v11, "trustStatusWithSpecificUser:reply:", v7, v10);

    v6 = (char *)(v17 + 3);
  }
  while (*((_BYTE *)v17 + 24));
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v20, 8);

}

- (void)resetWithSpecificUser:(id)a3 resetReason:(int64_t)a4 idmsTargetContext:(id)a5 idmsCuttlefishPassword:(id)a6 notifyIdMS:(BOOL)a7 internalAccount:(BOOL)a8 demoAccount:(BOOL)a9 reply:(id)a10
{
  _BOOL8 v10;
  char *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  _BOOL4 v23;
  id v24;
  _QWORD v25[5];
  id v26;
  _QWORD *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  _QWORD v33[3];
  int v34;

  v23 = a8;
  v10 = a7;
  v15 = &v32;
  v24 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a10;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  v34 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = -86;
  do
  {
    *v15 = 0;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100040708;
    v25[3] = &unk_1002DBA50;
    v27 = v33;
    v25[4] = self;
    v28 = &v29;
    v20 = v18;
    v26 = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "synchronousRemoteObjectProxyWithErrorHandler:", v25));
    LOBYTE(v22) = a9;
    objc_msgSend(v21, "resetWithSpecificUser:resetReason:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:internalAccount:demoAccount:reply:", v24, a4, v16, v17, v10, v23, v22, v20);

    v15 = (char *)(v30 + 3);
  }
  while (*((_BYTE *)v30 + 24));
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(v33, 8);

}

- (void)localResetWithSpecificUser:(id)a3 reply:(id)a4
{
  char *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  _QWORD *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  _QWORD v20[3];
  int v21;

  v6 = &v19;
  v7 = a3;
  v8 = a4;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v21 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = -86;
  do
  {
    *v6 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100040554;
    v12[3] = &unk_1002DBA50;
    v14 = v20;
    v15 = &v16;
    v12[4] = self;
    v10 = v8;
    v13 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v12));
    objc_msgSend(v11, "localResetWithSpecificUser:reply:", v7, v10);

    v6 = (char *)(v17 + 3);
  }
  while (*((_BYTE *)v17 + 24));
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v20, 8);

}

- (void)setAllowedMachineIDsWithSpecificUser:(id)a3 allowedMachineIDs:(id)a4 userInitiatedRemovals:(id)a5 evictedRemovals:(id)a6 unknownReasonRemovals:(id)a7 honorIDMSListChanges:(BOOL)a8 version:(id)a9 flowID:(id)a10 deviceSessionID:(id)a11 canSendMetrics:(BOOL)a12 altDSID:(id)a13 trustedDeviceHash:(id)a14 deletedDeviceHash:(id)a15 trustedDevicesUpdateTimestamp:(id)a16 reply:(id)a17
{
  char *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  _BOOL4 v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  _QWORD v41[5];
  id v42;
  _QWORD *v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  char v48;
  _QWORD v49[3];
  int v50;

  v33 = a8;
  v22 = &v48;
  v40 = a3;
  v39 = a4;
  v38 = a5;
  v37 = a6;
  v36 = a7;
  v35 = a9;
  v34 = a10;
  v23 = a11;
  v24 = a13;
  v25 = a14;
  v26 = a15;
  v27 = a16;
  v28 = a17;
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x2020000000;
  v50 = 0;
  v45 = 0;
  v46 = &v45;
  v47 = 0x2020000000;
  v48 = -86;
  do
  {
    *v22 = 0;
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_10004039C;
    v41[3] = &unk_1002DBA50;
    v43 = v49;
    v41[4] = self;
    v44 = &v45;
    v30 = v28;
    v42 = v30;
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "synchronousRemoteObjectProxyWithErrorHandler:", v41));
    LOBYTE(v32) = a12;
    objc_msgSend(v31, "setAllowedMachineIDsWithSpecificUser:allowedMachineIDs:userInitiatedRemovals:evictedRemovals:unknownReasonRemovals:honorIDMSListChanges:version:flowID:deviceSessionID:canSendMetrics:altDSID:trustedDeviceHash:deletedDeviceHash:trustedDevicesUpdateTimestamp:reply:", v40, v39, v38, v37, v36, v33, v35, v34, v23, v32, v24, v25, v26, v27, v30);

    v22 = (char *)(v46 + 3);
  }
  while (*((_BYTE *)v46 + 24));
  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(v49, 8);

}

- (void)markTrustedDeviceListFetchFailed:(id)a3 reply:(id)a4
{
  char *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  _QWORD *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  _QWORD v20[3];
  int v21;

  v6 = &v19;
  v7 = a3;
  v8 = a4;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v21 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = -86;
  do
  {
    *v6 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000401E8;
    v12[3] = &unk_1002DBA50;
    v14 = v20;
    v15 = &v16;
    v12[4] = self;
    v10 = v8;
    v13 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v12));
    objc_msgSend(v11, "markTrustedDeviceListFetchFailed:reply:", v7, v10);

    v6 = (char *)(v17 + 3);
  }
  while (*((_BYTE *)v17 + 24));
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v20, 8);

}

- (void)handleEvictedMachineIDsWithSpecificUser:(id)a3 machineIDs:(id)a4 reply:(id)a5
{
  char *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  _QWORD v23[3];
  int v24;

  v8 = &v22;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v24 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = -86;
  do
  {
    *v8 = 0;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100040034;
    v15[3] = &unk_1002DBA50;
    v17 = v23;
    v15[4] = self;
    v18 = &v19;
    v13 = v11;
    v16 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "synchronousRemoteObjectProxyWithErrorHandler:", v15));
    objc_msgSend(v14, "handleEvictedMachineIDsWithSpecificUser:machineIDs:reply:", v9, v10, v13);

    v8 = (char *)(v20 + 3);
  }
  while (*((_BYTE *)v20 + 24));
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(v23, 8);

}

- (void)handleRemovedMachineIDsDueToUnknownReasonsWithSpecificUser:(id)a3 machineIDs:(id)a4 reply:(id)a5
{
  char *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  _QWORD v23[3];
  int v24;

  v8 = &v22;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v24 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = -86;
  do
  {
    *v8 = 0;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10003FE80;
    v15[3] = &unk_1002DBA50;
    v17 = v23;
    v15[4] = self;
    v18 = &v19;
    v13 = v11;
    v16 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "synchronousRemoteObjectProxyWithErrorHandler:", v15));
    objc_msgSend(v14, "handleRemovedMachineIDsDueToUnknownReasonsWithSpecificUser:machineIDs:reply:", v9, v10, v13);

    v8 = (char *)(v20 + 3);
  }
  while (*((_BYTE *)v20 + 24));
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(v23, 8);

}

- (void)fetchAllowedMachineIDsWithSpecificUser:(id)a3 reply:(id)a4
{
  char *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  _QWORD *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  _QWORD v20[3];
  int v21;

  v6 = &v19;
  v7 = a3;
  v8 = a4;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v21 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = -86;
  do
  {
    *v6 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10003FCC8;
    v12[3] = &unk_1002DBA50;
    v14 = v20;
    v15 = &v16;
    v12[4] = self;
    v10 = v8;
    v13 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v12));
    objc_msgSend(v11, "fetchAllowedMachineIDsWithSpecificUser:reply:", v7, v10);

    v6 = (char *)(v17 + 3);
  }
  while (*((_BYTE *)v17 + 24));
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v20, 8);

}

- (void)fetchEgoEpochWithSpecificUser:(id)a3 reply:(id)a4
{
  char *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  _QWORD *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  _QWORD v20[3];
  int v21;

  v6 = &v19;
  v7 = a3;
  v8 = a4;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v21 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = -86;
  do
  {
    *v6 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10003FB10;
    v12[3] = &unk_1002DBA50;
    v14 = v20;
    v15 = &v16;
    v12[4] = self;
    v10 = v8;
    v13 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v12));
    objc_msgSend(v11, "fetchEgoEpochWithSpecificUser:reply:", v7, v10);

    v6 = (char *)(v17 + 3);
  }
  while (*((_BYTE *)v17 + 24));
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v20, 8);

}

- (void)prepareWithSpecificUser:(id)a3 epoch:(unint64_t)a4 machineID:(id)a5 bottleSalt:(id)a6 bottleID:(id)a7 modelID:(id)a8 deviceName:(id)a9 serialNumber:(id)a10 osVersion:(id)a11 policyVersion:(id)a12 policySecrets:(id)a13 syncUserControllableViews:(int)a14 secureElementIdentity:(id)a15 setting:(id)a16 signingPrivKeyPersistentRef:(id)a17 encPrivKeyPersistentRef:(id)a18 reply:(id)a19
{
  char *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  _QWORD v45[5];
  id v46;
  _QWORD *v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  char v52;
  _QWORD v53[3];
  int v54;

  v24 = &v52;
  v44 = a3;
  v43 = a5;
  v42 = a6;
  v41 = a7;
  v40 = a8;
  v39 = a9;
  v38 = a10;
  v37 = a11;
  v36 = a12;
  v25 = a13;
  v26 = a15;
  v27 = a16;
  v28 = a17;
  v29 = a18;
  v30 = a19;
  v53[0] = 0;
  v53[1] = v53;
  v53[2] = 0x2020000000;
  v54 = 0;
  v49 = 0;
  v50 = &v49;
  v51 = 0x2020000000;
  v52 = -86;
  do
  {
    *v24 = 0;
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_10003F944;
    v45[3] = &unk_1002DBA50;
    v47 = v53;
    v45[4] = self;
    v48 = &v49;
    v32 = v30;
    v46 = v32;
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "synchronousRemoteObjectProxyWithErrorHandler:", v45));
    LODWORD(v34) = a14;
    objc_msgSend(v33, "prepareWithSpecificUser:epoch:machineID:bottleSalt:bottleID:modelID:deviceName:serialNumber:osVersion:policyVersion:policySecrets:syncUserControllableViews:secureElementIdentity:setting:signingPrivKeyPersistentRef:encPrivKeyPersistentRef:reply:", v44, a4, v43, v42, v41, v40, v39, v38, v37, v36, v25, v34, v26, v27, v28,
      v29,
      v32);

    v24 = (char *)(v50 + 3);
  }
  while (*((_BYTE *)v50 + 24));
  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(v53, 8);

}

- (void)establishWithSpecificUser:(id)a3 ckksKeys:(id)a4 tlkShares:(id)a5 preapprovedKeys:(id)a6 reply:(id)a7
{
  char *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  _QWORD *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  _QWORD v29[3];
  int v30;

  v12 = &v28;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  v30 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = -86;
  do
  {
    *v12 = 0;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10003F784;
    v21[3] = &unk_1002DBA50;
    v23 = v29;
    v21[4] = self;
    v24 = &v25;
    v19 = v17;
    v22 = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "synchronousRemoteObjectProxyWithErrorHandler:", v21));
    objc_msgSend(v20, "establishWithSpecificUser:ckksKeys:tlkShares:preapprovedKeys:reply:", v13, v14, v15, v16, v19);

    v12 = (char *)(v26 + 3);
  }
  while (*((_BYTE *)v26 + 24));
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(v29, 8);

}

- (void)vouchWithSpecificUser:(id)a3 peerID:(id)a4 permanentInfo:(id)a5 permanentInfoSig:(id)a6 stableInfo:(id)a7 stableInfoSig:(id)a8 ckksKeys:(id)a9 flowID:(id)a10 deviceSessionID:(id)a11 canSendMetrics:(BOOL)a12 reply:(id)a13
{
  char *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  id v30;
  id v31;
  id v32;
  id v33;
  _QWORD v34[5];
  id v35;
  _QWORD *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;
  _QWORD v42[3];
  int v43;

  v19 = &v41;
  v33 = a3;
  v32 = a4;
  v31 = a5;
  v30 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v24 = a11;
  v25 = a13;
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x2020000000;
  v43 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = -86;
  do
  {
    *v19 = 0;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_10003F5C8;
    v34[3] = &unk_1002DBA50;
    v36 = v42;
    v34[4] = self;
    v37 = &v38;
    v27 = v25;
    v35 = v27;
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "synchronousRemoteObjectProxyWithErrorHandler:", v34));
    LOBYTE(v29) = a12;
    objc_msgSend(v28, "vouchWithSpecificUser:peerID:permanentInfo:permanentInfoSig:stableInfo:stableInfoSig:ckksKeys:flowID:deviceSessionID:canSendMetrics:reply:", v33, v32, v31, v30, v20, v21, v22, v23, v24, v29, v27);

    v19 = (char *)(v39 + 3);
  }
  while (*((_BYTE *)v39 + 24));
  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(v42, 8);

}

- (void)preflightVouchWithBottleWithSpecificUser:(id)a3 bottleID:(id)a4 reply:(id)a5
{
  char *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  _QWORD v23[3];
  int v24;

  v8 = &v22;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v24 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = -86;
  do
  {
    *v8 = 0;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10003F408;
    v15[3] = &unk_1002DBA50;
    v17 = v23;
    v15[4] = self;
    v18 = &v19;
    v13 = v11;
    v16 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "synchronousRemoteObjectProxyWithErrorHandler:", v15));
    objc_msgSend(v14, "preflightVouchWithBottleWithSpecificUser:bottleID:reply:", v9, v10, v13);

    v8 = (char *)(v20 + 3);
  }
  while (*((_BYTE *)v20 + 24));
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(v23, 8);

}

- (void)vouchWithBottleWithSpecificUser:(id)a3 bottleID:(id)a4 entropy:(id)a5 bottleSalt:(id)a6 tlkShares:(id)a7 reply:(id)a8
{
  char *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  _QWORD *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  _QWORD v32[3];
  int v33;

  v14 = &v31;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  v33 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = -86;
  do
  {
    *v14 = 0;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10003F244;
    v24[3] = &unk_1002DBA50;
    v26 = v32;
    v24[4] = self;
    v27 = &v28;
    v22 = v20;
    v25 = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "synchronousRemoteObjectProxyWithErrorHandler:", v24));
    objc_msgSend(v23, "vouchWithBottleWithSpecificUser:bottleID:entropy:bottleSalt:tlkShares:reply:", v15, v16, v17, v18, v19, v22);

    v14 = (char *)(v29 + 3);
  }
  while (*((_BYTE *)v29 + 24));
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(v32, 8);

}

- (void)preflightVouchWithRecoveryKeyWithSpecificUser:(id)a3 recoveryKey:(id)a4 salt:(id)a5 reply:(id)a6
{
  char *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  _QWORD *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  _QWORD v26[3];
  int v27;

  v10 = &v25;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v27 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = -86;
  do
  {
    *v10 = 0;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10003F088;
    v18[3] = &unk_1002DBA50;
    v20 = v26;
    v18[4] = self;
    v21 = &v22;
    v16 = v14;
    v19 = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "synchronousRemoteObjectProxyWithErrorHandler:", v18));
    objc_msgSend(v17, "preflightVouchWithRecoveryKeyWithSpecificUser:recoveryKey:salt:reply:", v11, v12, v13, v16);

    v10 = (char *)(v23 + 3);
  }
  while (*((_BYTE *)v23 + 24));
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(v26, 8);

}

- (void)preflightVouchWithCustodianRecoveryKeyWithSpecificUser:(id)a3 crk:(id)a4 reply:(id)a5
{
  char *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  _QWORD v23[3];
  int v24;

  v8 = &v22;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v24 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = -86;
  do
  {
    *v8 = 0;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10003EECC;
    v15[3] = &unk_1002DBA50;
    v17 = v23;
    v15[4] = self;
    v18 = &v19;
    v13 = v11;
    v16 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "synchronousRemoteObjectProxyWithErrorHandler:", v15));
    objc_msgSend(v14, "preflightVouchWithCustodianRecoveryKeyWithSpecificUser:crk:reply:", v9, v10, v13);

    v8 = (char *)(v20 + 3);
  }
  while (*((_BYTE *)v20 + 24));
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(v23, 8);

}

- (void)vouchWithRecoveryKeyWithSpecificUser:(id)a3 recoveryKey:(id)a4 salt:(id)a5 tlkShares:(id)a6 reply:(id)a7
{
  char *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  _QWORD *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  _QWORD v29[3];
  int v30;

  v12 = &v28;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  v30 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = -86;
  do
  {
    *v12 = 0;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10003ED08;
    v21[3] = &unk_1002DBA50;
    v23 = v29;
    v21[4] = self;
    v24 = &v25;
    v19 = v17;
    v22 = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "synchronousRemoteObjectProxyWithErrorHandler:", v21));
    objc_msgSend(v20, "vouchWithRecoveryKeyWithSpecificUser:recoveryKey:salt:tlkShares:reply:", v13, v14, v15, v16, v19);

    v12 = (char *)(v26 + 3);
  }
  while (*((_BYTE *)v26 + 24));
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(v29, 8);

}

- (void)vouchWithCustodianRecoveryKeyWithSpecificUser:(id)a3 crk:(id)a4 tlkShares:(id)a5 reply:(id)a6
{
  char *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  _QWORD *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  _QWORD v26[3];
  int v27;

  v10 = &v25;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v27 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = -86;
  do
  {
    *v10 = 0;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10003EB44;
    v18[3] = &unk_1002DBA50;
    v20 = v26;
    v18[4] = self;
    v21 = &v22;
    v16 = v14;
    v19 = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "synchronousRemoteObjectProxyWithErrorHandler:", v18));
    objc_msgSend(v17, "vouchWithCustodianRecoveryKeyWithSpecificUser:crk:tlkShares:reply:", v11, v12, v13, v16);

    v10 = (char *)(v23 + 3);
  }
  while (*((_BYTE *)v23 + 24));
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(v26, 8);

}

- (void)vouchWithRerollWithSpecificUser:(id)a3 oldPeerID:(id)a4 tlkShares:(id)a5 reply:(id)a6
{
  char *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  _QWORD *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  _QWORD v26[3];
  int v27;

  v10 = &v25;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v27 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = -86;
  do
  {
    *v10 = 0;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10003E980;
    v18[3] = &unk_1002DBA50;
    v20 = v26;
    v18[4] = self;
    v21 = &v22;
    v16 = v14;
    v19 = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "synchronousRemoteObjectProxyWithErrorHandler:", v18));
    objc_msgSend(v17, "vouchWithRerollWithSpecificUser:oldPeerID:tlkShares:reply:", v11, v12, v13, v16);

    v10 = (char *)(v23 + 3);
  }
  while (*((_BYTE *)v23 + 24));
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(v26, 8);

}

- (void)joinWithSpecificUser:(id)a3 voucherData:(id)a4 voucherSig:(id)a5 ckksKeys:(id)a6 tlkShares:(id)a7 preapprovedKeys:(id)a8 flowID:(id)a9 deviceSessionID:(id)a10 canSendMetrics:(BOOL)a11 reply:(id)a12
{
  char *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  _QWORD v32[5];
  id v33;
  _QWORD *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;
  _QWORD v40[3];
  int v41;

  v18 = &v39;
  v31 = a3;
  v30 = a4;
  v29 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v24 = a12;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x2020000000;
  v41 = 0;
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = -86;
  do
  {
    *v18 = 0;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_10003E7C0;
    v32[3] = &unk_1002DBA50;
    v34 = v40;
    v32[4] = self;
    v35 = &v36;
    v26 = v24;
    v33 = v26;
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "synchronousRemoteObjectProxyWithErrorHandler:", v32));
    LOBYTE(v28) = a11;
    objc_msgSend(v27, "joinWithSpecificUser:voucherData:voucherSig:ckksKeys:tlkShares:preapprovedKeys:flowID:deviceSessionID:canSendMetrics:reply:", v31, v30, v29, v19, v20, v21, v22, v23, v28, v26);

    v18 = (char *)(v37 + 3);
  }
  while (*((_BYTE *)v37 + 24));
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(v40, 8);

}

- (void)preflightPreapprovedJoinWithSpecificUser:(id)a3 preapprovedKeys:(id)a4 reply:(id)a5
{
  char *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  _QWORD v23[3];
  int v24;

  v8 = &v22;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v24 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = -86;
  do
  {
    *v8 = 0;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10003E608;
    v15[3] = &unk_1002DBA50;
    v17 = v23;
    v15[4] = self;
    v18 = &v19;
    v13 = v11;
    v16 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "synchronousRemoteObjectProxyWithErrorHandler:", v15));
    objc_msgSend(v14, "preflightPreapprovedJoinWithSpecificUser:preapprovedKeys:reply:", v9, v10, v13);

    v8 = (char *)(v20 + 3);
  }
  while (*((_BYTE *)v20 + 24));
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(v23, 8);

}

- (void)attemptPreapprovedJoinWithSpecificUser:(id)a3 ckksKeys:(id)a4 tlkShares:(id)a5 preapprovedKeys:(id)a6 reply:(id)a7
{
  char *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  _QWORD *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  _QWORD v29[3];
  int v30;

  v12 = &v28;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  v30 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = -86;
  do
  {
    *v12 = 0;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10003E448;
    v21[3] = &unk_1002DBA50;
    v23 = v29;
    v21[4] = self;
    v24 = &v25;
    v19 = v17;
    v22 = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "synchronousRemoteObjectProxyWithErrorHandler:", v21));
    objc_msgSend(v20, "attemptPreapprovedJoinWithSpecificUser:ckksKeys:tlkShares:preapprovedKeys:reply:", v13, v14, v15, v16, v19);

    v12 = (char *)(v26 + 3);
  }
  while (*((_BYTE *)v26 + 24));
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(v29, 8);

}

- (void)updateWithSpecificUser:(id)a3 forceRefetch:(BOOL)a4 deviceName:(id)a5 serialNumber:(id)a6 osVersion:(id)a7 policyVersion:(id)a8 policySecrets:(id)a9 syncUserControllableViews:(id)a10 secureElementIdentity:(id)a11 walrusSetting:(id)a12 webAccess:(id)a13 reply:(id)a14
{
  char *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  _BOOL4 v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  _QWORD v35[5];
  id v36;
  _QWORD *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  char v42;
  _QWORD v43[3];
  int v44;

  v29 = a4;
  v19 = &v42;
  v34 = a3;
  v33 = a5;
  v32 = a6;
  v31 = a7;
  v30 = a8;
  v20 = a9;
  v21 = a10;
  v22 = a11;
  v23 = a12;
  v24 = a13;
  v25 = a14;
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x2020000000;
  v44 = 0;
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v42 = -86;
  do
  {
    *v19 = 0;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_10003E28C;
    v35[3] = &unk_1002DBA50;
    v37 = v43;
    v35[4] = self;
    v38 = &v39;
    v27 = v25;
    v36 = v27;
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "synchronousRemoteObjectProxyWithErrorHandler:", v35));
    objc_msgSend(v28, "updateWithSpecificUser:forceRefetch:deviceName:serialNumber:osVersion:policyVersion:policySecrets:syncUserControllableViews:secureElementIdentity:walrusSetting:webAccess:reply:", v34, v29, v33, v32, v31, v30, v20, v21, v22, v23, v24, v27);

    v19 = (char *)(v40 + 3);
  }
  while (*((_BYTE *)v40 + 24));
  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(v43, 8);

}

- (void)setPreapprovedKeysWithSpecificUser:(id)a3 preapprovedKeys:(id)a4 reply:(id)a5
{
  char *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  _QWORD v23[3];
  int v24;

  v8 = &v22;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v24 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = -86;
  do
  {
    *v8 = 0;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10003E0D4;
    v15[3] = &unk_1002DBA50;
    v17 = v23;
    v15[4] = self;
    v18 = &v19;
    v13 = v11;
    v16 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "synchronousRemoteObjectProxyWithErrorHandler:", v15));
    objc_msgSend(v14, "setPreapprovedKeysWithSpecificUser:preapprovedKeys:reply:", v9, v10, v13);

    v8 = (char *)(v20 + 3);
  }
  while (*((_BYTE *)v20 + 24));
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(v23, 8);

}

- (void)updateTLKsWithSpecificUser:(id)a3 ckksKeys:(id)a4 tlkShares:(id)a5 reply:(id)a6
{
  char *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  _QWORD *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  _QWORD v26[3];
  int v27;

  v10 = &v25;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v27 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = -86;
  do
  {
    *v10 = 0;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10003DF1C;
    v18[3] = &unk_1002DBA50;
    v20 = v26;
    v18[4] = self;
    v21 = &v22;
    v16 = v14;
    v19 = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "synchronousRemoteObjectProxyWithErrorHandler:", v18));
    objc_msgSend(v17, "updateTLKsWithSpecificUser:ckksKeys:tlkShares:reply:", v11, v12, v13, v16);

    v10 = (char *)(v23 + 3);
  }
  while (*((_BYTE *)v23 + 24));
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(v26, 8);

}

- (void)fetchViableBottlesWithSpecificUser:(id)a3 source:(int64_t)a4 flowID:(id)a5 deviceSessionID:(id)a6 reply:(id)a7
{
  char *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  _QWORD *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  _QWORD v28[3];
  int v29;

  v12 = &v27;
  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  v29 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = -86;
  do
  {
    *v12 = 0;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10003DD60;
    v20[3] = &unk_1002DBA50;
    v22 = v28;
    v20[4] = self;
    v23 = &v24;
    v18 = v16;
    v21 = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "synchronousRemoteObjectProxyWithErrorHandler:", v20));
    objc_msgSend(v19, "fetchViableBottlesWithSpecificUser:source:flowID:deviceSessionID:reply:", v13, a4, v14, v15, v18);

    v12 = (char *)(v25 + 3);
  }
  while (*((_BYTE *)v25 + 24));
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(v28, 8);

}

- (void)fetchEscrowContentsWithSpecificUser:(id)a3 reply:(id)a4
{
  char *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  _QWORD *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  _QWORD v20[3];
  int v21;

  v6 = &v19;
  v7 = a3;
  v8 = a4;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v21 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = -86;
  do
  {
    *v6 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10003DBA0;
    v12[3] = &unk_1002DBA50;
    v14 = v20;
    v15 = &v16;
    v12[4] = self;
    v10 = v8;
    v13 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v12));
    objc_msgSend(v11, "fetchEscrowContentsWithSpecificUser:reply:", v7, v10);

    v6 = (char *)(v17 + 3);
  }
  while (*((_BYTE *)v17 + 24));
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v20, 8);

}

- (void)fetchPolicyDocumentsWithSpecificUser:(id)a3 versions:(id)a4 reply:(id)a5
{
  char *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  _QWORD v23[3];
  int v24;

  v8 = &v22;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v24 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = -86;
  do
  {
    *v8 = 0;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10003D9E8;
    v15[3] = &unk_1002DBA50;
    v17 = v23;
    v15[4] = self;
    v18 = &v19;
    v13 = v11;
    v16 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "synchronousRemoteObjectProxyWithErrorHandler:", v15));
    objc_msgSend(v14, "fetchPolicyDocumentsWithSpecificUser:versions:reply:", v9, v10, v13);

    v8 = (char *)(v20 + 3);
  }
  while (*((_BYTE *)v20 + 24));
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(v23, 8);

}

- (void)fetchCurrentPolicyWithSpecificUser:(id)a3 modelIDOverride:(id)a4 isInheritedAccount:(BOOL)a5 reply:(id)a6
{
  _BOOL8 v7;
  char *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  _QWORD *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  _QWORD v25[3];
  int v26;

  v7 = a5;
  v10 = &v24;
  v11 = a3;
  v12 = a4;
  v13 = a6;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v26 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = -86;
  do
  {
    *v10 = 0;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10003D82C;
    v17[3] = &unk_1002DBA50;
    v19 = v25;
    v17[4] = self;
    v20 = &v21;
    v15 = v13;
    v18 = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "synchronousRemoteObjectProxyWithErrorHandler:", v17));
    objc_msgSend(v16, "fetchCurrentPolicyWithSpecificUser:modelIDOverride:isInheritedAccount:reply:", v11, v12, v7, v15);

    v10 = (char *)(v22 + 3);
  }
  while (*((_BYTE *)v22 + 24));
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(v25, 8);

}

- (void)fetchTrustStateWithSpecificUser:(id)a3 reply:(id)a4
{
  char *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  _QWORD *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  _QWORD v20[3];
  int v21;

  v6 = &v19;
  v7 = a3;
  v8 = a4;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v21 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = -86;
  do
  {
    *v6 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10003D670;
    v12[3] = &unk_1002DBA50;
    v14 = v20;
    v15 = &v16;
    v12[4] = self;
    v10 = v8;
    v13 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v12));
    objc_msgSend(v11, "fetchTrustStateWithSpecificUser:reply:", v7, v10);

    v6 = (char *)(v17 + 3);
  }
  while (*((_BYTE *)v17 + 24));
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v20, 8);

}

- (void)setRecoveryKeyWithSpecificUser:(id)a3 recoveryKey:(id)a4 salt:(id)a5 ckksKeys:(id)a6 reply:(id)a7
{
  char *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  _QWORD *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  _QWORD v29[3];
  int v30;

  v12 = &v28;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  v30 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = -86;
  do
  {
    *v12 = 0;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10003D4B8;
    v21[3] = &unk_1002DBA50;
    v23 = v29;
    v21[4] = self;
    v24 = &v25;
    v19 = v17;
    v22 = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "synchronousRemoteObjectProxyWithErrorHandler:", v21));
    objc_msgSend(v20, "setRecoveryKeyWithSpecificUser:recoveryKey:salt:ckksKeys:reply:", v13, v14, v15, v16, v19);

    v12 = (char *)(v26 + 3);
  }
  while (*((_BYTE *)v26 + 24));
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(v29, 8);

}

- (void)createCustodianRecoveryKeyWithSpecificUser:(id)a3 recoveryKey:(id)a4 salt:(id)a5 ckksKeys:(id)a6 uuid:(id)a7 kind:(int)a8 reply:(id)a9
{
  uint64_t v9;
  char *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  _QWORD v25[5];
  id v26;
  _QWORD *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  _QWORD v33[3];
  int v34;

  v9 = *(_QWORD *)&a8;
  v15 = &v32;
  v24 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a9;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  v34 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = -86;
  do
  {
    *v15 = 0;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10003D2FC;
    v25[3] = &unk_1002DBA50;
    v27 = v33;
    v25[4] = self;
    v28 = &v29;
    v22 = v20;
    v26 = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "synchronousRemoteObjectProxyWithErrorHandler:", v25));
    objc_msgSend(v23, "createCustodianRecoveryKeyWithSpecificUser:recoveryKey:salt:ckksKeys:uuid:kind:reply:", v24, v16, v17, v18, v19, v9, v22);

    v15 = (char *)(v30 + 3);
  }
  while (*((_BYTE *)v30 + 24));
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(v33, 8);

}

- (void)removeCustodianRecoveryKeyWithSpecificUser:(id)a3 uuid:(id)a4 reply:(id)a5
{
  char *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  _QWORD v23[3];
  int v24;

  v8 = &v22;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v24 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = -86;
  do
  {
    *v8 = 0;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10003D148;
    v15[3] = &unk_1002DBA50;
    v17 = v23;
    v15[4] = self;
    v18 = &v19;
    v13 = v11;
    v16 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "synchronousRemoteObjectProxyWithErrorHandler:", v15));
    objc_msgSend(v14, "removeCustodianRecoveryKeyWithSpecificUser:uuid:reply:", v9, v10, v13);

    v8 = (char *)(v20 + 3);
  }
  while (*((_BYTE *)v20 + 24));
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(v23, 8);

}

- (void)findCustodianRecoveryKeyWithSpecificUser:(id)a3 uuid:(id)a4 reply:(id)a5
{
  char *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  _QWORD v23[3];
  int v24;

  v8 = &v22;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v24 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = -86;
  do
  {
    *v8 = 0;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10003CF90;
    v15[3] = &unk_1002DBA50;
    v17 = v23;
    v15[4] = self;
    v18 = &v19;
    v13 = v11;
    v16 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "synchronousRemoteObjectProxyWithErrorHandler:", v15));
    objc_msgSend(v14, "findCustodianRecoveryKeyWithSpecificUser:uuid:reply:", v9, v10, v13);

    v8 = (char *)(v20 + 3);
  }
  while (*((_BYTE *)v20 + 24));
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(v23, 8);

}

- (void)requestHealthCheckWithSpecificUser:(id)a3 requiresEscrowCheck:(BOOL)a4 repair:(BOOL)a5 knownFederations:(id)a6 flowID:(id)a7 deviceSessionID:(id)a8 reply:(id)a9
{
  _BOOL8 v12;
  _BOOL8 v13;
  char *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  _QWORD v24[5];
  id v25;
  _QWORD *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  _QWORD v32[3];
  int v33;

  v12 = a5;
  v13 = a4;
  v15 = &v31;
  v23 = a3;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  v33 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = -86;
  do
  {
    *v15 = 0;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10003CDD8;
    v24[3] = &unk_1002DBA50;
    v26 = v32;
    v24[4] = self;
    v27 = &v28;
    v21 = v19;
    v25 = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "synchronousRemoteObjectProxyWithErrorHandler:", v24));
    objc_msgSend(v22, "requestHealthCheckWithSpecificUser:requiresEscrowCheck:repair:knownFederations:flowID:deviceSessionID:reply:", v23, v13, v12, v16, v17, v18, v21);

    v15 = (char *)(v29 + 3);
  }
  while (*((_BYTE *)v29 + 24));
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(v32, 8);

}

- (void)getSupportAppInfoWithSpecificUser:(id)a3 reply:(id)a4
{
  char *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  _QWORD *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  _QWORD v20[3];
  int v21;

  v6 = &v19;
  v7 = a3;
  v8 = a4;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v21 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = -86;
  do
  {
    *v6 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10003CC20;
    v12[3] = &unk_1002DBA50;
    v14 = v20;
    v15 = &v16;
    v12[4] = self;
    v10 = v8;
    v13 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v12));
    objc_msgSend(v11, "getSupportAppInfoWithSpecificUser:reply:", v7, v10);

    v6 = (char *)(v17 + 3);
  }
  while (*((_BYTE *)v17 + 24));
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v20, 8);

}

- (void)fetchViableEscrowRecordsWithSpecificUser:(id)a3 source:(int64_t)a4 reply:(id)a5
{
  char *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  _QWORD *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  _QWORD v22[3];
  int v23;

  v8 = &v21;
  v9 = a3;
  v10 = a5;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v23 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = -86;
  do
  {
    *v8 = 0;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10003CA68;
    v14[3] = &unk_1002DBA50;
    v16 = v22;
    v14[4] = self;
    v17 = &v18;
    v12 = v10;
    v15 = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v14));
    objc_msgSend(v13, "fetchViableEscrowRecordsWithSpecificUser:source:reply:", v9, a4, v12);

    v8 = (char *)(v19 + 3);
  }
  while (*((_BYTE *)v19 + 24));
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(v22, 8);

}

- (void)removeEscrowCacheWithSpecificUser:(id)a3 reply:(id)a4
{
  char *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  _QWORD *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  _QWORD v20[3];
  int v21;

  v6 = &v19;
  v7 = a3;
  v8 = a4;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v21 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = -86;
  do
  {
    *v6 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10003C8B4;
    v12[3] = &unk_1002DBA50;
    v14 = v20;
    v15 = &v16;
    v12[4] = self;
    v10 = v8;
    v13 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v12));
    objc_msgSend(v11, "removeEscrowCacheWithSpecificUser:reply:", v7, v10);

    v6 = (char *)(v17 + 3);
  }
  while (*((_BYTE *)v17 + 24));
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v20, 8);

}

- (void)resetAccountCDPContentsWithSpecificUser:(id)a3 idmsTargetContext:(id)a4 idmsCuttlefishPassword:(id)a5 notifyIdMS:(BOOL)a6 internalAccount:(BOOL)a7 demoAccount:(BOOL)a8 reply:(id)a9
{
  _BOOL8 v9;
  _BOOL8 v10;
  _BOOL8 v11;
  char *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  _QWORD v23[5];
  id v24;
  _QWORD *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  _QWORD v31[3];
  int v32;

  v9 = a8;
  v10 = a7;
  v11 = a6;
  v15 = &v30;
  v22 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a9;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  v32 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = -86;
  do
  {
    *v15 = 0;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10003C700;
    v23[3] = &unk_1002DBA50;
    v25 = v31;
    v23[4] = self;
    v26 = &v27;
    v20 = v18;
    v24 = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "synchronousRemoteObjectProxyWithErrorHandler:", v23));
    objc_msgSend(v21, "resetAccountCDPContentsWithSpecificUser:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:internalAccount:demoAccount:reply:", v22, v16, v17, v11, v10, v9, v20);

    v15 = (char *)(v28 + 3);
  }
  while (*((_BYTE *)v28 + 24));
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(v31, 8);

}

- (void)fetchRecoverableTLKSharesWithSpecificUser:(id)a3 peerID:(id)a4 reply:(id)a5
{
  char *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  _QWORD v23[3];
  int v24;

  v8 = &v22;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v24 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = -86;
  do
  {
    *v8 = 0;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10003C548;
    v15[3] = &unk_1002DBA50;
    v17 = v23;
    v15[4] = self;
    v18 = &v19;
    v13 = v11;
    v16 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "synchronousRemoteObjectProxyWithErrorHandler:", v15));
    objc_msgSend(v14, "fetchRecoverableTLKSharesWithSpecificUser:peerID:reply:", v9, v10, v13);

    v8 = (char *)(v20 + 3);
  }
  while (*((_BYTE *)v20 + 24));
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(v23, 8);

}

- (void)fetchAccountSettingsWithSpecificUser:(id)a3 forceFetch:(BOOL)a4 reply:(id)a5
{
  _BOOL8 v6;
  char *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  _QWORD *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  _QWORD v22[3];
  int v23;

  v6 = a4;
  v8 = &v21;
  v9 = a3;
  v10 = a5;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v23 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = -86;
  do
  {
    *v8 = 0;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10003C390;
    v14[3] = &unk_1002DBA50;
    v16 = v22;
    v14[4] = self;
    v17 = &v18;
    v12 = v10;
    v15 = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v14));
    objc_msgSend(v13, "fetchAccountSettingsWithSpecificUser:forceFetch:reply:", v9, v6, v12);

    v8 = (char *)(v19 + 3);
  }
  while (*((_BYTE *)v19 + 24));
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(v22, 8);

}

- (void)prepareInheritancePeerWithSpecificUser:(id)a3 epoch:(unint64_t)a4 machineID:(id)a5 bottleSalt:(id)a6 bottleID:(id)a7 modelID:(id)a8 deviceName:(id)a9 serialNumber:(id)a10 osVersion:(id)a11 policyVersion:(id)a12 policySecrets:(id)a13 syncUserControllableViews:(int)a14 secureElementIdentity:(id)a15 signingPrivKeyPersistentRef:(id)a16 encPrivKeyPersistentRef:(id)a17 crk:(id)a18 reply:(id)a19
{
  char *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  _QWORD v45[5];
  id v46;
  _QWORD *v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  char v52;
  _QWORD v53[3];
  int v54;

  v24 = &v52;
  v44 = a3;
  v43 = a5;
  v42 = a6;
  v41 = a7;
  v40 = a8;
  v39 = a9;
  v38 = a10;
  v37 = a11;
  v36 = a12;
  v25 = a13;
  v26 = a15;
  v27 = a16;
  v28 = a17;
  v29 = a18;
  v30 = a19;
  v53[0] = 0;
  v53[1] = v53;
  v53[2] = 0x2020000000;
  v54 = 0;
  v49 = 0;
  v50 = &v49;
  v51 = 0x2020000000;
  v52 = -86;
  do
  {
    *v24 = 0;
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_10003C1C0;
    v45[3] = &unk_1002DBA50;
    v47 = v53;
    v45[4] = self;
    v48 = &v49;
    v32 = v30;
    v46 = v32;
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "synchronousRemoteObjectProxyWithErrorHandler:", v45));
    LODWORD(v34) = a14;
    objc_msgSend(v33, "prepareInheritancePeerWithSpecificUser:epoch:machineID:bottleSalt:bottleID:modelID:deviceName:serialNumber:osVersion:policyVersion:policySecrets:syncUserControllableViews:secureElementIdentity:signingPrivKeyPersistentRef:encPrivKeyPersistentRef:crk:reply:", v44, a4, v43, v42, v41, v40, v39, v38, v37, v36, v25, v34, v26, v27, v28,
      v29,
      v32);

    v24 = (char *)(v50 + 3);
  }
  while (*((_BYTE *)v50 + 24));
  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(v53, 8);

}

- (void)recoverTLKSharesForInheritorWithSpecificUser:(id)a3 crk:(id)a4 tlkShares:(id)a5 reply:(id)a6
{
  char *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  _QWORD *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  _QWORD v26[3];
  int v27;

  v10 = &v25;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v27 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = -86;
  do
  {
    *v10 = 0;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10003C004;
    v18[3] = &unk_1002DBA50;
    v20 = v26;
    v18[4] = self;
    v21 = &v22;
    v16 = v14;
    v19 = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "synchronousRemoteObjectProxyWithErrorHandler:", v18));
    objc_msgSend(v17, "recoverTLKSharesForInheritorWithSpecificUser:crk:tlkShares:reply:", v11, v12, v13, v16);

    v10 = (char *)(v23 + 3);
  }
  while (*((_BYTE *)v23 + 24));
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(v26, 8);

}

- (void)isRecoveryKeySet:(id)a3 reply:(id)a4
{
  char *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  _QWORD *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  _QWORD v20[3];
  int v21;

  v6 = &v19;
  v7 = a3;
  v8 = a4;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v21 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = -86;
  do
  {
    *v6 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10003BE4C;
    v12[3] = &unk_1002DBA50;
    v14 = v20;
    v15 = &v16;
    v12[4] = self;
    v10 = v8;
    v13 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v12));
    objc_msgSend(v11, "isRecoveryKeySet:reply:", v7, v10);

    v6 = (char *)(v17 + 3);
  }
  while (*((_BYTE *)v17 + 24));
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v20, 8);

}

- (void)removeRecoveryKey:(id)a3 reply:(id)a4
{
  char *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  _QWORD *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  _QWORD v20[3];
  int v21;

  v6 = &v19;
  v7 = a3;
  v8 = a4;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v21 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = -86;
  do
  {
    *v6 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10003BC94;
    v12[3] = &unk_1002DBA50;
    v14 = v20;
    v15 = &v16;
    v12[4] = self;
    v10 = v8;
    v13 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v12));
    objc_msgSend(v11, "removeRecoveryKey:reply:", v7, v10);

    v6 = (char *)(v17 + 3);
  }
  while (*((_BYTE *)v17 + 24));
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v20, 8);

}

- (void)performATOPRVActionsWithSpecificUser:(id)a3 reply:(id)a4
{
  char *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  _QWORD *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  _QWORD v20[3];
  int v21;

  v6 = &v19;
  v7 = a3;
  v8 = a4;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v21 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = -86;
  do
  {
    *v6 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10003BAE0;
    v12[3] = &unk_1002DBA50;
    v14 = v20;
    v15 = &v16;
    v12[4] = self;
    v10 = v8;
    v13 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v12));
    objc_msgSend(v11, "performATOPRVActionsWithSpecificUser:reply:", v7, v10);

    v6 = (char *)(v17 + 3);
  }
  while (*((_BYTE *)v17 + 24));
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v20, 8);

}

- (void)testSemaphoreWithSpecificUser:(id)a3 arg:(id)a4 reply:(id)a5
{
  void (**v5)(id, void *);
  const void *v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];

  v5 = (void (**)(id, void *))a5;
  v6 = sub_10000EF14("SecError");
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "octagon: testing TPH semaphore handling unsupported from within securityd", v9, 2u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, -4, 0));
  v5[2](v5, v8);

}

- (void)preflightRecoverOctagonUsingRecoveryKey:(id)a3 recoveryKey:(id)a4 salt:(id)a5 reply:(id)a6
{
  char *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  _QWORD *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  _QWORD v26[3];
  int v27;

  v10 = &v25;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v27 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = -86;
  do
  {
    *v10 = 0;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10003B928;
    v18[3] = &unk_1002DBA50;
    v20 = v26;
    v18[4] = self;
    v21 = &v22;
    v16 = v14;
    v19 = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "synchronousRemoteObjectProxyWithErrorHandler:", v18));
    objc_msgSend(v17, "preflightRecoverOctagonUsingRecoveryKey:recoveryKey:salt:reply:", v11, v12, v13, v16);

    v10 = (char *)(v23 + 3);
  }
  while (*((_BYTE *)v23 + 24));
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(v26, 8);

}

- (void)fetchTrustedPeerCountWithSpecificUser:(id)a3 reply:(id)a4
{
  char *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  _QWORD *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  _QWORD v20[3];
  int v21;

  v6 = &v19;
  v7 = a3;
  v8 = a4;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v21 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = -86;
  do
  {
    *v6 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10003B770;
    v12[3] = &unk_1002DBA50;
    v14 = v20;
    v15 = &v16;
    v12[4] = self;
    v10 = v8;
    v13 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v12));
    objc_msgSend(v11, "fetchTrustedPeerCountWithSpecificUser:reply:", v7, v10);

    v6 = (char *)(v17 + 3);
  }
  while (*((_BYTE *)v17 + 24));
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v20, 8);

}

- (void)octagonContainsDistrustedRecoveryKeysWithSpecificUser:(id)a3 reply:(id)a4
{
  char *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  _QWORD *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  _QWORD v20[3];
  int v21;

  v6 = &v19;
  v7 = a3;
  v8 = a4;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v21 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = -86;
  do
  {
    *v6 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10003B5B8;
    v12[3] = &unk_1002DBA50;
    v14 = v20;
    v15 = &v16;
    v12[4] = self;
    v10 = v8;
    v13 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v12));
    objc_msgSend(v11, "octagonContainsDistrustedRecoveryKeysWithSpecificUser:reply:", v7, v10);

    v6 = (char *)(v17 + 3);
  }
  while (*((_BYTE *)v17 + 24));
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v20, 8);

}

- (void)fetchCurrentItemWithSpecificUser:(id)a3 items:(id)a4 reply:(id)a5
{
  char *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  _QWORD v23[3];
  int v24;

  v8 = &v22;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v24 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = -86;
  do
  {
    *v8 = 0;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10003B3FC;
    v15[3] = &unk_1002DBA50;
    v17 = v23;
    v15[4] = self;
    v18 = &v19;
    v13 = v11;
    v16 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "synchronousRemoteObjectProxyWithErrorHandler:", v15));
    objc_msgSend(v14, "fetchCurrentItemWithSpecificUser:items:reply:", v9, v10, v13);

    v8 = (char *)(v20 + 3);
  }
  while (*((_BYTE *)v20 + 24));
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(v23, 8);

}

- (void)fetchPCSIdentityByPublicKeyWithSpecificUser:(id)a3 pcsservices:(id)a4 reply:(id)a5
{
  char *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  _QWORD v23[3];
  int v24;

  v8 = &v22;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v24 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = -86;
  do
  {
    *v8 = 0;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishXPCWrapper cuttlefishXPCConnection](self, "cuttlefishXPCConnection"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10003B240;
    v15[3] = &unk_1002DBA50;
    v17 = v23;
    v15[4] = self;
    v18 = &v19;
    v13 = v11;
    v16 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "synchronousRemoteObjectProxyWithErrorHandler:", v15));
    objc_msgSend(v14, "fetchPCSIdentityByPublicKeyWithSpecificUser:pcsservices:reply:", v9, v10, v13);

    v8 = (char *)(v20 + 3);
  }
  while (*((_BYTE *)v20 + 24));
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(v23, 8);

}

- (NSXPCProxyCreating)cuttlefishXPCConnection
{
  return (NSXPCProxyCreating *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cuttlefishXPCConnection, 0);
}

+ (BOOL)retryable:(id)a3
{
  id v3;
  NSString *v4;
  BOOL v5;

  v3 = a3;
  v4 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
  v5 = v4 == NSCocoaErrorDomain && objc_msgSend(v3, "code") == (id)4097;

  return v5;
}

@end
