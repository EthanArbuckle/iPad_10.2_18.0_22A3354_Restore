@implementation BTCloudServicesXPCConnection

- (void)cloudServicesClientActivate:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD *v12;
  id *v13;
  unsigned __int8 v14;
  id obj;
  _QWORD v16[5];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v7 = a3;
  v8 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_100075C44;
  v23 = sub_100075C54;
  v24 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "deviceManager"));

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100075C5C;
  v16[3] = &unk_1001E4AF0;
  v18 = &v19;
  v16[4] = v10;
  v11 = v8;
  v17 = v11;
  v12 = objc_retainBlock(v16);
  if (dword_10020FC38 <= 30 && (dword_10020FC38 != -1 || _LogCategory_Initialize(&dword_10020FC38, 30)))
    LogPrintF(&dword_10020FC38, "-[BTCloudServicesXPCConnection cloudServicesClientActivate:completion:]", 30, "DeviceManager: %@", v10);
  v13 = (id *)(v20 + 5);
  obj = (id)v20[5];
  v14 = -[BTCloudServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v13, obj);
  if ((v14 & 1) != 0)
  {
    objc_storeStrong((id *)&self->_client, a3);
    if (v11)
      (*((void (**)(id, uint64_t))v11 + 2))(v11, v20[5]);
  }
  ((void (*)(_QWORD *))v12[2])(v12);

  _Block_object_dispose(&v19, 8);
}

- (BOOL)_entitledAndReturnError:(id *)a3
{
  void *v3;
  BOOL result;
  void *v7;
  unsigned int v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  id v12;

  if (self->_entitled)
    return 1;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection cuValueForEntitlementNoCache:](self->_xpcCnx, "cuValueForEntitlementNoCache:", CFSTR("com.apple.BluetoothServices")));
  v8 = objc_msgSend(v7, "isEqual:", &__kCFBooleanTrue);
  if (v8)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection cuValueForEntitlementNoCache:](self->_xpcCnx, "cuValueForEntitlementNoCache:", CFSTR("com.apple.BluetoothServices.cloud")));
    if (objc_msgSend(v3, "isEqual:", &__kCFBooleanTrue))
    {

LABEL_12:
      result = 1;
      self->_entitled = 1;
      return result;
    }
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection cuValueForEntitlementNoCache:](self->_xpcCnx, "cuValueForEntitlementNoCache:", CFSTR("com.apple.bluetooth.internal")));
  v10 = objc_msgSend(v9, "isEqual:", &__kCFBooleanTrue);

  if (v8)
  {

    if ((v10 & 1) != 0)
      goto LABEL_12;
  }
  else
  {

    if (v10)
      goto LABEL_12;
  }
  if (dword_10020FC38 <= 90 && (dword_10020FC38 != -1 || _LogCategory_Initialize(&dword_10020FC38, 90)))
    LogPrintF(&dword_10020FC38, "-[BTCloudServicesXPCConnection _entitledAndReturnError:]", 90, "### Missing entitlement: %#{pid}, '%@' and '%@'", -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"), CFSTR("com.apple.BluetoothServices"), CFSTR("com.apple.BluetoothServices.cloud"));
  if (!a3)
    return 0;
  v11 = BTErrorF(4294896128, "Missing entitlement '%@' and/or '%@", CFSTR("com.apple.BluetoothServices"), CFSTR("com.apple.BluetoothServices.cloud"));
  v12 = (id)objc_claimAutoreleasedReturnValue(v11);
  result = 0;
  *a3 = v12;
  return result;
}

- (void)fetchAAProxCardsInfoForDeviceWithAddress:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD *v11;
  id *v12;
  unsigned __int8 v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id obj;
  _QWORD v19[5];
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v6 = a3;
  v7 = a4;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_100075C44;
  v26 = sub_100075C54;
  v27 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "deviceManager"));

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10007611C;
  v19[3] = &unk_1001E4AF0;
  v21 = &v22;
  v19[4] = v9;
  v10 = v7;
  v20 = v10;
  v11 = objc_retainBlock(v19);
  if (dword_10020FC38 <= 30 && (dword_10020FC38 != -1 || _LogCategory_Initialize(&dword_10020FC38, 30)))
    LogPrintF(&dword_10020FC38, "-[BTCloudServicesXPCConnection fetchAAProxCardsInfoForDeviceWithAddress:completion:]", 30, "DeviceManager: %@", v9);
  v12 = (id *)(v23 + 5);
  obj = (id)v23[5];
  v13 = -[BTCloudServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v12, obj);
  if ((v13 & 1) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "deviceManager"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000761E0;
    v16[3] = &unk_1001E4B18;
    v17 = v10;
    objc_msgSend(v15, "fetchAAProxCardsInfoWithAddress:completion:", v6, v16);

  }
  ((void (*)(_QWORD *))v11[2])(v11);

  _Block_object_dispose(&v22, 8);
}

- (void)modifyAAProxCardsInfo:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD *v11;
  id *v12;
  unsigned __int8 v13;
  void *v14;
  void *v15;
  id obj;
  _QWORD v17[5];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v6 = a3;
  v7 = a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_100075C44;
  v24 = sub_100075C54;
  v25 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "deviceManager"));

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100076490;
  v17[3] = &unk_1001E4AF0;
  v19 = &v20;
  v17[4] = v9;
  v10 = v7;
  v18 = v10;
  v11 = objc_retainBlock(v17);
  if (dword_10020FC38 <= 30 && (dword_10020FC38 != -1 || _LogCategory_Initialize(&dword_10020FC38, 30)))
    LogPrintF(&dword_10020FC38, "-[BTCloudServicesXPCConnection modifyAAProxCardsInfo:completion:]", 30, "DeviceManager: %@", v9);
  v12 = (id *)(v21 + 5);
  obj = (id)v21[5];
  v13 = -[BTCloudServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v12, obj);
  if ((v13 & 1) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "deviceManager"));
    objc_msgSend(v15, "updateAAProxCardsInfoWithProxCardsInfo:completion:", v6, v10);

  }
  ((void (*)(_QWORD *))v11[2])(v11);

  _Block_object_dispose(&v20, 8);
}

- (void)removeAAProxCardsInfoForDeviceWithAddress:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD *v11;
  id *v12;
  unsigned __int8 v13;
  void *v14;
  void *v15;
  id obj;
  _QWORD v17[5];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v6 = a3;
  v7 = a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_100075C44;
  v24 = sub_100075C54;
  v25 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "deviceManager"));

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100076760;
  v17[3] = &unk_1001E4AF0;
  v19 = &v20;
  v17[4] = v9;
  v10 = v7;
  v18 = v10;
  v11 = objc_retainBlock(v17);
  if (dword_10020FC38 <= 30 && (dword_10020FC38 != -1 || _LogCategory_Initialize(&dword_10020FC38, 30)))
    LogPrintF(&dword_10020FC38, "-[BTCloudServicesXPCConnection removeAAProxCardsInfoForDeviceWithAddress:completion:]", 30, "DeviceManager: %@", v9);
  v12 = (id *)(v21 + 5);
  obj = (id)v21[5];
  v13 = -[BTCloudServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v12, obj);
  if ((v13 & 1) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "deviceManager"));
    objc_msgSend(v15, "removeAAProxCardsInfoWithBluetoothAddress:completion:", v6, v10);

  }
  ((void (*)(_QWORD *))v11[2])(v11);

  _Block_object_dispose(&v20, 8);
}

- (void)createDeviceRecord:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  id *v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  id obj;
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  if (dword_10020FC38 <= 30 && (dword_10020FC38 != -1 || _LogCategory_Initialize(&dword_10020FC38, 30)))
    LogPrintF(&dword_10020FC38, "-[BTCloudServicesXPCConnection createDeviceRecord:completion:]", 30, "CreateDeviceRecord: %@", v6);
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_100075C44;
  v21 = sub_100075C54;
  v22 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "deviceManager"));

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100076A68;
  v16[3] = &unk_1001E24F8;
  v16[4] = v9;
  v16[5] = &v17;
  v10 = objc_retainBlock(v16);
  if (dword_10020FC38 <= 30 && (dword_10020FC38 != -1 || _LogCategory_Initialize(&dword_10020FC38, 30)))
    LogPrintF(&dword_10020FC38, "-[BTCloudServicesXPCConnection createDeviceRecord:completion:]", 30, "DeviceManager: %@", v9);
  v11 = (id *)(v18 + 5);
  obj = (id)v18[5];
  v12 = -[BTCloudServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v11, obj);
  if ((v12 & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "deviceManager"));
    objc_msgSend(v14, "addDeviceWithRecord:completion:", v6, v7);

  }
  ((void (*)(_QWORD *))v10[2])(v10);

  _Block_object_dispose(&v17, 8);
}

- (void)modifyDeviceRecord:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (dword_10020FC38 <= 30 && (dword_10020FC38 != -1 || _LogCategory_Initialize(&dword_10020FC38, 30)))
    LogPrintF(&dword_10020FC38, "-[BTCloudServicesXPCConnection modifyDeviceRecord:completion:]", 30, "ModifyDeviceRecord: %@", v7);
  -[BTCloudServicesXPCConnection createDeviceRecord:completion:](self, "createDeviceRecord:completion:", v7, v6);

}

- (void)deleteDeviceRecord:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  id *v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  id obj;
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  if (dword_10020FC38 <= 30 && (dword_10020FC38 != -1 || _LogCategory_Initialize(&dword_10020FC38, 30)))
    LogPrintF(&dword_10020FC38, "-[BTCloudServicesXPCConnection deleteDeviceRecord:completion:]", 30, "DeleteDeviceRecord: %@", v6);
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_100075C44;
  v21 = sub_100075C54;
  v22 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "deviceManager"));

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100076DF4;
  v16[3] = &unk_1001E24F8;
  v16[4] = v9;
  v16[5] = &v17;
  v10 = objc_retainBlock(v16);
  if (dword_10020FC38 <= 30 && (dword_10020FC38 != -1 || _LogCategory_Initialize(&dword_10020FC38, 30)))
    LogPrintF(&dword_10020FC38, "-[BTCloudServicesXPCConnection deleteDeviceRecord:completion:]", 30, "DeviceManager: %@", v9);
  v11 = (id *)(v18 + 5);
  obj = (id)v18[5];
  v12 = -[BTCloudServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v11, obj);
  if ((v12 & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "deviceManager"));
    objc_msgSend(v14, "removeDeviceWithBluetoothAddress:completion:", v6, v7);

  }
  ((void (*)(_QWORD *))v10[2])(v10);

  _Block_object_dispose(&v17, 8);
}

- (void)fetchDeviceRecord:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  id *v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id obj;
  _QWORD v18[6];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = a3;
  v7 = a4;
  if (dword_10020FC38 <= 30 && (dword_10020FC38 != -1 || _LogCategory_Initialize(&dword_10020FC38, 30)))
    LogPrintF(&dword_10020FC38, "-[BTCloudServicesXPCConnection fetchDeviceRecord:completion:]", 30, "Fetch DeviceRecord: %@", v6);
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_100075C44;
  v23 = sub_100075C54;
  v24 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "deviceManager"));

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100077118;
  v18[3] = &unk_1001E24F8;
  v18[4] = v9;
  v18[5] = &v19;
  v10 = objc_retainBlock(v18);
  if (dword_10020FC38 <= 30 && (dword_10020FC38 != -1 || _LogCategory_Initialize(&dword_10020FC38, 30)))
    LogPrintF(&dword_10020FC38, "-[BTCloudServicesXPCConnection fetchDeviceRecord:completion:]", 30, "DeviceManager: %@", v9);
  v11 = (id *)(v20 + 5);
  obj = (id)v20[5];
  v12 = -[BTCloudServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v11, obj);
  if ((v12 & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "deviceManager"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000771B4;
    v15[3] = &unk_1001E4B40;
    v16 = v7;
    objc_msgSend(v14, "fetchDeviceWithAddress:completion:", v6, v15);

  }
  ((void (*)(_QWORD *))v10[2])(v10);

  _Block_object_dispose(&v19, 8);
}

- (void)fetchDeviceRecordsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  id *v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id obj;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v4 = a3;
  if (dword_10020FC38 <= 30 && (dword_10020FC38 != -1 || _LogCategory_Initialize(&dword_10020FC38, 30)))
    LogPrintF(&dword_10020FC38, "-[BTCloudServicesXPCConnection fetchDeviceRecordsWithCompletion:]", 30, "Fetch DeviceRecords");
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_100075C44;
  v20 = sub_100075C54;
  v21 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "deviceManager"));

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000774BC;
  v15[3] = &unk_1001E24F8;
  v15[4] = v6;
  v15[5] = &v16;
  v7 = objc_retainBlock(v15);
  if (dword_10020FC38 <= 30 && (dword_10020FC38 != -1 || _LogCategory_Initialize(&dword_10020FC38, 30)))
    LogPrintF(&dword_10020FC38, "-[BTCloudServicesXPCConnection fetchDeviceRecordsWithCompletion:]", 30, "DeviceManager: %@", v6);
  v8 = (id *)(v17 + 5);
  obj = (id)v17[5];
  v9 = -[BTCloudServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v8, obj);
  if ((v9 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "deviceManager"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100077558;
    v12[3] = &unk_1001E4B68;
    v13 = v4;
    objc_msgSend(v11, "fetchDeviceRecordsWithCompletion:", v12);

  }
  ((void (*)(_QWORD *))v7[2])(v7);

  _Block_object_dispose(&v16, 8);
}

- (void)createDeviceSupportInformationRecord:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  id *v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  id obj;
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  if (dword_10020FC38 <= 30 && (dword_10020FC38 != -1 || _LogCategory_Initialize(&dword_10020FC38, 30)))
    LogPrintF(&dword_10020FC38, "-[BTCloudServicesXPCConnection createDeviceSupportInformationRecord:completion:]", 30, "Create Support Info");
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_100075C44;
  v21 = sub_100075C54;
  v22 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "deviceManager"));

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10007785C;
  v16[3] = &unk_1001E24F8;
  v16[4] = v9;
  v16[5] = &v17;
  v10 = objc_retainBlock(v16);
  if (dword_10020FC38 <= 30 && (dword_10020FC38 != -1 || _LogCategory_Initialize(&dword_10020FC38, 30)))
    LogPrintF(&dword_10020FC38, "-[BTCloudServicesXPCConnection createDeviceSupportInformationRecord:completion:]", 30, "DeviceManager: %@", v9);
  v11 = (id *)(v18 + 5);
  obj = (id)v18[5];
  v12 = -[BTCloudServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v11, obj);
  if ((v12 & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "deviceManager"));
    objc_msgSend(v14, "addDeviceSupportInformationWithRecord:completion:", v6, v7);

  }
  ((void (*)(_QWORD *))v10[2])(v10);

  _Block_object_dispose(&v17, 8);
}

- (void)deleteDeviceSupportInformationRecord:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  id *v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  id obj;
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  if (dword_10020FC38 <= 30 && (dword_10020FC38 != -1 || _LogCategory_Initialize(&dword_10020FC38, 30)))
    LogPrintF(&dword_10020FC38, "-[BTCloudServicesXPCConnection deleteDeviceSupportInformationRecord:completion:]", 30, "Delete Support Info: %@", v6);
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_100075C44;
  v21 = sub_100075C54;
  v22 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "deviceManager"));

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100077B40;
  v16[3] = &unk_1001E24F8;
  v16[4] = v9;
  v16[5] = &v17;
  v10 = objc_retainBlock(v16);
  if (dword_10020FC38 <= 30 && (dword_10020FC38 != -1 || _LogCategory_Initialize(&dword_10020FC38, 30)))
    LogPrintF(&dword_10020FC38, "-[BTCloudServicesXPCConnection deleteDeviceSupportInformationRecord:completion:]", 30, "DeviceManager: %@", v9);
  v11 = (id *)(v18 + 5);
  obj = (id)v18[5];
  v12 = -[BTCloudServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v11, obj);
  if ((v12 & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "deviceManager"));
    objc_msgSend(v14, "removeDeviceSupportInformationWithBluetoothAddress:completion:", v6, v7);

  }
  ((void (*)(_QWORD *))v10[2])(v10);

  _Block_object_dispose(&v17, 8);
}

- (void)fetchBTCloudDeviceSupportInformation:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  id *v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id obj;
  _QWORD v18[6];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = a3;
  v7 = a4;
  if (dword_10020FC38 <= 30 && (dword_10020FC38 != -1 || _LogCategory_Initialize(&dword_10020FC38, 30)))
    LogPrintF(&dword_10020FC38, "-[BTCloudServicesXPCConnection fetchBTCloudDeviceSupportInformation:completion:]", 30, "Fetch Support Info: %@", v6);
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_100075C44;
  v23 = sub_100075C54;
  v24 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "deviceManager"));

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100077E64;
  v18[3] = &unk_1001E24F8;
  v18[4] = v9;
  v18[5] = &v19;
  v10 = objc_retainBlock(v18);
  if (dword_10020FC38 <= 30 && (dword_10020FC38 != -1 || _LogCategory_Initialize(&dword_10020FC38, 30)))
    LogPrintF(&dword_10020FC38, "-[BTCloudServicesXPCConnection fetchBTCloudDeviceSupportInformation:completion:]", 30, "DeviceManager: %@", v9);
  v11 = (id *)(v20 + 5);
  obj = (id)v20[5];
  v12 = -[BTCloudServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v11, obj);
  if ((v12 & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "deviceManager"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100077F00;
    v15[3] = &unk_1001E4B90;
    v16 = v7;
    objc_msgSend(v14, "fetchDeviceSupportInformationRecordWithAddress:completion:", v6, v15);

  }
  ((void (*)(_QWORD *))v10[2])(v10);

  _Block_object_dispose(&v19, 8);
}

- (void)fetchAllBTCloudDeviceSupportInformationWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  id *v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id obj;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v4 = a3;
  if (dword_10020FC38 <= 30 && (dword_10020FC38 != -1 || _LogCategory_Initialize(&dword_10020FC38, 30)))
    LogPrintF(&dword_10020FC38, "-[BTCloudServicesXPCConnection fetchAllBTCloudDeviceSupportInformationWithCompletion:]", 30, "Fetch All Support Info");
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_100075C44;
  v20 = sub_100075C54;
  v21 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "deviceManager"));

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100078208;
  v15[3] = &unk_1001E24F8;
  v15[4] = v6;
  v15[5] = &v16;
  v7 = objc_retainBlock(v15);
  if (dword_10020FC38 <= 30 && (dword_10020FC38 != -1 || _LogCategory_Initialize(&dword_10020FC38, 30)))
    LogPrintF(&dword_10020FC38, "-[BTCloudServicesXPCConnection fetchAllBTCloudDeviceSupportInformationWithCompletion:]", 30, "DeviceManager: %@", v6);
  v8 = (id *)(v17 + 5);
  obj = (id)v17[5];
  v9 = -[BTCloudServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v8, obj);
  if ((v9 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "deviceManager"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000782A4;
    v12[3] = &unk_1001E4B68;
    v13 = v4;
    objc_msgSend(v11, "fetchDeviceSupportInformationRecordsWithCompletion:", v12);

  }
  ((void (*)(_QWORD *))v7[2])(v7);

  _Block_object_dispose(&v16, 8);
}

- (void)modifyDeviceSupportInformationRecord:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  id *v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  id obj;
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  if (dword_10020FC38 <= 30 && (dword_10020FC38 != -1 || _LogCategory_Initialize(&dword_10020FC38, 30)))
    LogPrintF(&dword_10020FC38, "-[BTCloudServicesXPCConnection modifyDeviceSupportInformationRecord:completion:]", 30, "Modify Support Info: %@", v6);
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_100075C44;
  v21 = sub_100075C54;
  v22 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "deviceManager"));

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10007858C;
  v16[3] = &unk_1001E24F8;
  v16[4] = v9;
  v16[5] = &v17;
  v10 = objc_retainBlock(v16);
  if (dword_10020FC38 <= 30 && (dword_10020FC38 != -1 || _LogCategory_Initialize(&dword_10020FC38, 30)))
    LogPrintF(&dword_10020FC38, "-[BTCloudServicesXPCConnection modifyDeviceSupportInformationRecord:completion:]", 30, "DeviceManager: %@", v9);
  v11 = (id *)(v18 + 5);
  obj = (id)v18[5];
  v12 = -[BTCloudServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v11, obj);
  if ((v12 & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "deviceManager"));
    objc_msgSend(v14, "updateDeviceSupportInformationWithDevice:completion:", v6, v7);

  }
  ((void (*)(_QWORD *))v10[2])(v10);

  _Block_object_dispose(&v17, 8);
}

- (void)createMagicSettingsRecord:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  id *v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  id obj;
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  if (dword_10020FC38 <= 30 && (dword_10020FC38 != -1 || _LogCategory_Initialize(&dword_10020FC38, 30)))
    LogPrintF(&dword_10020FC38, "-[BTCloudServicesXPCConnection createMagicSettingsRecord:completion:]", 30, "Create Magic Settings: %@", v6);
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_100075C44;
  v21 = sub_100075C54;
  v22 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "deviceManager"));

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100078870;
  v16[3] = &unk_1001E24F8;
  v16[4] = v9;
  v16[5] = &v17;
  v10 = objc_retainBlock(v16);
  if (dword_10020FC38 <= 30 && (dword_10020FC38 != -1 || _LogCategory_Initialize(&dword_10020FC38, 30)))
    LogPrintF(&dword_10020FC38, "-[BTCloudServicesXPCConnection createMagicSettingsRecord:completion:]", 30, "DeviceManager: %@", v9);
  v11 = (id *)(v18 + 5);
  obj = (id)v18[5];
  v12 = -[BTCloudServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v11, obj);
  if ((v12 & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "deviceManager"));
    objc_msgSend(v14, "addDeviceMagicSettingsWithRecord:completion:", v6, v7);

  }
  ((void (*)(_QWORD *))v10[2])(v10);

  _Block_object_dispose(&v17, 8);
}

- (void)deleteMagicSettingsRecord:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  id *v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  id obj;
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  if (dword_10020FC38 <= 30 && (dword_10020FC38 != -1 || _LogCategory_Initialize(&dword_10020FC38, 30)))
    LogPrintF(&dword_10020FC38, "-[BTCloudServicesXPCConnection deleteMagicSettingsRecord:completion:]", 30, "Delete Magic Settings: %@", v6);
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_100075C44;
  v21 = sub_100075C54;
  v22 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "deviceManager"));

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100078B54;
  v16[3] = &unk_1001E24F8;
  v16[4] = v9;
  v16[5] = &v17;
  v10 = objc_retainBlock(v16);
  if (dword_10020FC38 <= 30 && (dword_10020FC38 != -1 || _LogCategory_Initialize(&dword_10020FC38, 30)))
    LogPrintF(&dword_10020FC38, "-[BTCloudServicesXPCConnection deleteMagicSettingsRecord:completion:]", 30, "DeviceManager: %@", v9);
  v11 = (id *)(v18 + 5);
  obj = (id)v18[5];
  v12 = -[BTCloudServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v11, obj);
  if ((v12 & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "deviceManager"));
    objc_msgSend(v14, "removeDeviceMagicSettingsWithBluetoothAddress:completion:", v6, v7);

  }
  ((void (*)(_QWORD *))v10[2])(v10);

  _Block_object_dispose(&v17, 8);
}

- (void)fetchMagicSettingsRecord:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  id *v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id obj;
  _QWORD v18[6];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = a3;
  v7 = a4;
  if (dword_10020FC38 <= 30 && (dword_10020FC38 != -1 || _LogCategory_Initialize(&dword_10020FC38, 30)))
    LogPrintF(&dword_10020FC38, "-[BTCloudServicesXPCConnection fetchMagicSettingsRecord:completion:]", 30, "Fetch Magic Settings: %@", v6);
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_100075C44;
  v23 = sub_100075C54;
  v24 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "deviceManager"));

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100078E78;
  v18[3] = &unk_1001E24F8;
  v18[4] = v9;
  v18[5] = &v19;
  v10 = objc_retainBlock(v18);
  if (dword_10020FC38 <= 30 && (dword_10020FC38 != -1 || _LogCategory_Initialize(&dword_10020FC38, 30)))
    LogPrintF(&dword_10020FC38, "-[BTCloudServicesXPCConnection fetchMagicSettingsRecord:completion:]", 30, "DeviceManager: %@", v9);
  v11 = (id *)(v20 + 5);
  obj = (id)v20[5];
  v12 = -[BTCloudServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v11, obj);
  if ((v12 & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "deviceManager"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100078F14;
    v15[3] = &unk_1001E4BB8;
    v16 = v7;
    objc_msgSend(v14, "fetchMagicSettingsRecordWithAddress:completion:", v6, v15);

  }
  ((void (*)(_QWORD *))v10[2])(v10);

  _Block_object_dispose(&v19, 8);
}

- (void)fetchAllMagicSettingsRecordsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  id *v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id obj;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v4 = a3;
  if (dword_10020FC38 <= 30 && (dword_10020FC38 != -1 || _LogCategory_Initialize(&dword_10020FC38, 30)))
    LogPrintF(&dword_10020FC38, "-[BTCloudServicesXPCConnection fetchAllMagicSettingsRecordsWithCompletion:]", 30, "Fetch All MP Records");
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_100075C44;
  v20 = sub_100075C54;
  v21 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "deviceManager"));

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10007921C;
  v15[3] = &unk_1001E24F8;
  v15[4] = v6;
  v15[5] = &v16;
  v7 = objc_retainBlock(v15);
  if (dword_10020FC38 <= 30 && (dword_10020FC38 != -1 || _LogCategory_Initialize(&dword_10020FC38, 30)))
    LogPrintF(&dword_10020FC38, "-[BTCloudServicesXPCConnection fetchAllMagicSettingsRecordsWithCompletion:]", 30, "DeviceManager: %@", v6);
  v8 = (id *)(v17 + 5);
  obj = (id)v17[5];
  v9 = -[BTCloudServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v8, obj);
  if ((v9 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "deviceManager"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000792B8;
    v12[3] = &unk_1001E4B68;
    v13 = v4;
    objc_msgSend(v11, "fetchMagicPairingSettingsRecordsWithCompletion:", v12);

  }
  ((void (*)(_QWORD *))v7[2])(v7);

  _Block_object_dispose(&v16, 8);
}

- (void)modifyMagicSettingsRecord:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  id *v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  id obj;
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  if (dword_10020FC38 <= 30 && (dword_10020FC38 != -1 || _LogCategory_Initialize(&dword_10020FC38, 30)))
    LogPrintF(&dword_10020FC38, "-[BTCloudServicesXPCConnection modifyMagicSettingsRecord:completion:]", 30, "Modify MP record: %@", v6);
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_100075C44;
  v21 = sub_100075C54;
  v22 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "deviceManager"));

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000795A0;
  v16[3] = &unk_1001E24F8;
  v16[4] = v9;
  v16[5] = &v17;
  v10 = objc_retainBlock(v16);
  if (dword_10020FC38 <= 30 && (dword_10020FC38 != -1 || _LogCategory_Initialize(&dword_10020FC38, 30)))
    LogPrintF(&dword_10020FC38, "-[BTCloudServicesXPCConnection modifyMagicSettingsRecord:completion:]", 30, "DeviceManager: %@", v9);
  v11 = (id *)(v18 + 5);
  obj = (id)v18[5];
  v12 = -[BTCloudServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v11, obj);
  if ((v12 & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "deviceManager"));
    objc_msgSend(v14, "updateDeviceMagicSettingsWithMagicPairingSettings:completion:", v6, v7);

  }
  ((void (*)(_QWORD *))v10[2])(v10);

  _Block_object_dispose(&v17, 8);
}

- (void)fetchCloudAccountInfoUpdatedWithCompletion:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  void *v6;
  _QWORD *v7;
  id *v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  void *v12;
  id obj;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = (void (**)(id, void *, _QWORD))a3;
  if (dword_10020FC38 <= 30 && (dword_10020FC38 != -1 || _LogCategory_Initialize(&dword_10020FC38, 30)))
    LogPrintF(&dword_10020FC38, "-[BTCloudServicesXPCConnection fetchCloudAccountInfoUpdatedWithCompletion:]", 30, "Fetch Account Info");
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_100075C44;
  v19 = sub_100075C54;
  v20 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "deviceManager"));

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000798DC;
  v14[3] = &unk_1001E24F8;
  v14[4] = v6;
  v14[5] = &v15;
  v7 = objc_retainBlock(v14);
  if (dword_10020FC38 <= 30 && (dword_10020FC38 != -1 || _LogCategory_Initialize(&dword_10020FC38, 30)))
    LogPrintF(&dword_10020FC38, "-[BTCloudServicesXPCConnection fetchCloudAccountInfoUpdatedWithCompletion:]", 30, "DeviceManager: %@", v6);
  v8 = (id *)(v16 + 5);
  obj = (id)v16[5];
  v9 = -[BTCloudServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v8, obj);
  if ((v9 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "deviceManager"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "cloudAccountInfo"));

    if (dword_10020FC38 <= 30
      && (dword_10020FC38 != -1 || _LogCategory_Initialize(&dword_10020FC38, 30)))
    {
      LogPrintF(&dword_10020FC38, "-[BTCloudServicesXPCConnection fetchCloudAccountInfoUpdatedWithCompletion:]", 30, "Fetched Account Info: %@", v12);
    }
    v4[2](v4, v12, 0);

  }
  ((void (*)(_QWORD *))v7[2])(v7);

  _Block_object_dispose(&v15, 8);
}

- (void)fetchCloudPairingIdentifierForPeripheral:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD *v10;
  id *v11;
  unsigned __int8 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  uint64_t *v20;
  id obj;
  _QWORD v22[5];
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v6 = a3;
  v7 = a4;
  if (dword_10020FC38 <= 30 && (dword_10020FC38 != -1 || _LogCategory_Initialize(&dword_10020FC38, 30)))
    LogPrintF(&dword_10020FC38, "-[BTCloudServicesXPCConnection fetchCloudPairingIdentifierForPeripheral:completion:]", 30, "Fetch Cloud Identifer for peripheral: %@", v6);
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = sub_100075C44;
  v29 = sub_100075C54;
  v30 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CBIDSManager sharedInstance](CBIDSManager, "sharedInstance"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100079C54;
  v22[3] = &unk_1001E4AF0;
  v24 = &v25;
  v22[4] = v8;
  v9 = v7;
  v23 = v9;
  v10 = objc_retainBlock(v22);
  if (dword_10020FC38 <= 30 && (dword_10020FC38 != -1 || _LogCategory_Initialize(&dword_10020FC38, 30)))
    LogPrintF(&dword_10020FC38, "-[BTCloudServicesXPCConnection fetchCloudPairingIdentifierForPeripheral:completion:]", 30, "CloudPairingManager: %@", v8);
  v11 = (id *)(v26 + 5);
  obj = (id)v26[5];
  v12 = -[BTCloudServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v11, obj);
  if ((v12 & 1) != 0)
  {
    if (v8)
    {
      if ((objc_msgSend(v8, "isReady") & 1) != 0)
      {
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_100079D18;
        v17[3] = &unk_1001E4C08;
        v17[4] = self;
        v19 = v9;
        v18 = v6;
        v20 = &v25;
        objc_msgSend(v8, "fetchCloudPairingIdentifierForPeripheral:withCompletion:", v18, v17);

        goto LABEL_13;
      }
      v15 = BTErrorF(4294960551, "Cloud Pairing is not ready to find cloud identifier for peripheral '%@'", v6);
      v14 = objc_claimAutoreleasedReturnValue(v15);
    }
    else
    {
      v13 = BTErrorF(4294960551, "Cloud Pairing is not initialized to find cloud identifier for peripheral '%@'", v6);
      v14 = objc_claimAutoreleasedReturnValue(v13);
    }
    v16 = (void *)v26[5];
    v26[5] = v14;

  }
LABEL_13:
  ((void (*)(_QWORD *))v10[2])(v10);

  _Block_object_dispose(&v25, 8);
}

- (void)forceCloudPairingForIdentifiers:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  const char *v9;
  void *v10;
  id v11;
  _QWORD *v12;
  id *v13;
  unsigned __int8 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id obj;
  _QWORD v21[4];
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BTCloudServicesXPCConnection signingIdentity](self, "signingIdentity"));
  if (dword_10020FC38 <= 30 && (dword_10020FC38 != -1 || _LogCategory_Initialize(&dword_10020FC38, 30)))
  {
    if (v8)
      v9 = (const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    else
      v9 = "Unknown";
    LogPrintF(&dword_10020FC38, "-[BTCloudServicesXPCConnection forceCloudPairingForIdentifiers:completion:]", 30, "BundleID: %s forcing Cloud Pairing for Identifers: %@", v9, v6);
  }
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = sub_100075C44;
  v28 = sub_100075C54;
  v29 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CBIDSManager sharedInstance](CBIDSManager, "sharedInstance"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10007A1F8;
  v21[3] = &unk_1001E2A58;
  v23 = &v24;
  v11 = v7;
  v22 = v11;
  v12 = objc_retainBlock(v21);
  if (dword_10020FC38 <= 30 && (dword_10020FC38 != -1 || _LogCategory_Initialize(&dword_10020FC38, 30)))
    LogPrintF(&dword_10020FC38, "-[BTCloudServicesXPCConnection forceCloudPairingForIdentifiers:completion:]", 30, "CloudPairingManager: %@", v10);
  v13 = (id *)(v25 + 5);
  obj = (id)v25[5];
  v14 = -[BTCloudServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v13, obj);
  if ((v14 & 1) != 0)
  {
    if (v10)
    {
      if ((objc_msgSend(v10, "isReady") & 1) != 0)
      {
        if (objc_msgSend(v6, "count"))
        {
          objc_msgSend(v10, "sendRePairRequest:forBundleID:", v6, v8);
          (*((void (**)(id, _QWORD))v11 + 2))(v11, 0);
          goto LABEL_18;
        }
        v18 = BTErrorF(4294960591, "No cloud identifiers specified '%@'", v6);
        v16 = objc_claimAutoreleasedReturnValue(v18);
      }
      else
      {
        v17 = BTErrorF(4294960551, "Cloud Pairing is not ready to force cloud pairing for '%@'", v6);
        v16 = objc_claimAutoreleasedReturnValue(v17);
      }
    }
    else
    {
      v15 = BTErrorF(4294960551, "Cloud Pairing is not initialized to force cloud pairing for '%@'", v6);
      v16 = objc_claimAutoreleasedReturnValue(v15);
    }
    v19 = (void *)v25[5];
    v25[5] = v16;

  }
LABEL_18:
  ((void (*)(_QWORD *))v12[2])(v12);

  _Block_object_dispose(&v24, 8);
}

- (void)startSoundProfileRecordFileHandleSessionWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD *v6;
  id *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id obj;
  _QWORD v20[4];
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v4 = a3;
  if (dword_10020FC38 <= 30 && (dword_10020FC38 != -1 || _LogCategory_Initialize(&dword_10020FC38, 30)))
    LogPrintF(&dword_10020FC38, "-[BTCloudServicesXPCConnection startSoundProfileRecordFileHandleSessionWithCompletion:]", 30, "Creating sound profile write session");
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = sub_100075C44;
  v27 = sub_100075C54;
  v28 = 0;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10007A598;
  v20[3] = &unk_1001E2A58;
  v22 = &v23;
  v5 = v4;
  v21 = v5;
  v6 = objc_retainBlock(v20);
  v7 = (id *)(v24 + 5);
  obj = (id)v24[5];
  v8 = -[BTCloudServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v7, obj);
  if ((v8 & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "deviceManager"));

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "createSoundProfileRecordStagingURL"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "path"));
      objc_msgSend(v12, "createFileAtPath:contents:attributes:", v13, 0, 0);

      v14 = (id *)(v24 + 5);
      v18 = (id)v24[5];
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileHandle fileHandleForWritingToURL:error:](NSFileHandle, "fileHandleForWritingToURL:error:", v11, &v18));
      objc_storeStrong(v14, v18);
      if (v15)
      {
        if (dword_10020FC38 <= 30
          && (dword_10020FC38 != -1 || _LogCategory_Initialize(&dword_10020FC38, 30)))
        {
          LogPrintF(&dword_10020FC38, "-[BTCloudServicesXPCConnection startSoundProfileRecordFileHandleSessionWithCompletion:]", 30, "Created sound profile write-only file handle: %@", v11);
        }
        (*((void (**)(id, void *, _QWORD))v5 + 2))(v5, v15, 0);
      }

    }
    else
    {
      v16 = BTErrorF(4294960551, "Device manager not available");
      v17 = objc_claimAutoreleasedReturnValue(v16);
      v11 = (void *)v24[5];
      v24[5] = v17;
    }

  }
  ((void (*)(_QWORD *))v6[2])(v6);

  _Block_object_dispose(&v23, 8);
}

- (void)finishSoundProfileRecordSessionHandle:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  id *v9;
  unsigned __int8 v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  OS_dispatch_queue *v15;
  void *v16;
  id *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  _QWORD v26[5];
  id v27;
  id obj;
  _QWORD v29[4];
  id v30;
  uint64_t *v31;
  uint64_t v32;
  id *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  _BYTE v38[1024];

  v6 = a3;
  v32 = 0;
  v33 = (id *)&v32;
  v34 = 0x3032000000;
  v35 = sub_100075C44;
  v36 = sub_100075C54;
  v37 = 0;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10007A9E4;
  v29[3] = &unk_1001E2A58;
  v31 = &v32;
  v7 = a4;
  v30 = v7;
  v8 = objc_retainBlock(v29);
  v9 = v33;
  obj = v33[5];
  v10 = -[BTCloudServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v9 + 5, obj);
  if ((v10 & 1) != 0)
  {
    if (fcntl((int)objc_msgSend(v6, "fileDescriptor"), 50, v38) == -1)
    {
      v18 = BTErrorF(4294960591, "File handle is not valid");
      v19 = objc_claimAutoreleasedReturnValue(v18);
      v11 = v33[5];
      v33[5] = (id)v19;
    }
    else
    {
      v11 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v38));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v11));
      if (objc_msgSend(v11, "length"))
      {
        if (dword_10020FC38 <= 30
          && (dword_10020FC38 != -1 || _LogCategory_Initialize(&dword_10020FC38, 30)))
        {
          LogPrintF(&dword_10020FC38, "-[BTCloudServicesXPCConnection finishSoundProfileRecordSessionHandle:completion:]", 30, "Creating sound profile record");
        }
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "deviceManager"));

        if (v14)
        {
          v15 = self->_dispatchQueue;
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
          objc_msgSend(v16, "beginTransaction:", CFSTR("createSoundProfileRecordURL"));

          v26[0] = _NSConcreteStackBlock;
          v26[1] = 3221225472;
          v26[2] = sub_10007AAA0;
          v26[3] = &unk_1001E2070;
          v26[4] = v15;
          v27 = v7;
          objc_msgSend(v14, "addSoundProfileRecordWithURL:completion:", v12, v26);
          v17 = v33;
          v25 = 0;
          objc_msgSend(v6, "closeAndReturnError:", &v25);
          objc_storeStrong(v17 + 5, v25);

        }
        else
        {
          v23 = BTErrorF(4294960551, "Device manager not available");
          v24 = objc_claimAutoreleasedReturnValue(v23);
          v15 = (OS_dispatch_queue *)v33[5];
          v33[5] = (id)v24;
        }

      }
      else
      {
        v20 = BTErrorF(4294960591, "File path is not valid");
        v21 = objc_claimAutoreleasedReturnValue(v20);
        v22 = v33[5];
        v33[5] = (id)v21;

      }
    }

  }
  ((void (*)(_QWORD *))v8[2])(v8);

  _Block_object_dispose(&v32, 8);
}

- (void)fetchSoundProfileRecordWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD *v6;
  id *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  OS_dispatch_queue *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[5];
  id v18;
  id obj;
  _QWORD v20[4];
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v4 = a3;
  if (dword_10020FC38 <= 30 && (dword_10020FC38 != -1 || _LogCategory_Initialize(&dword_10020FC38, 30)))
    LogPrintF(&dword_10020FC38, "-[BTCloudServicesXPCConnection fetchSoundProfileRecordWithCompletion:]", 30, "Fetching sound profile");
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = sub_100075C44;
  v27 = sub_100075C54;
  v28 = 0;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10007AE08;
  v20[3] = &unk_1001E2A58;
  v22 = &v23;
  v5 = v4;
  v21 = v5;
  v6 = objc_retainBlock(v20);
  v7 = (id *)(v24 + 5);
  obj = (id)v24[5];
  v8 = -[BTCloudServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v7, obj);
  if ((v8 & 1) != 0)
  {
    if (v5)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "deviceManager"));

      if (v10)
      {
        v11 = self->_dispatchQueue;
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
        objc_msgSend(v12, "beginTransaction:", CFSTR("fetchSoundProfileRecord"));

        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_10007AEC8;
        v17[3] = &unk_1001E4C58;
        v17[4] = v11;
        v18 = v5;
        objc_msgSend(v10, "fetchSoundProfileRecordWithCompletion:", v17);

      }
      else
      {
        v15 = BTErrorF(4294960551, "Device manager not available");
        v16 = objc_claimAutoreleasedReturnValue(v15);
        v11 = (OS_dispatch_queue *)v24[5];
        v24[5] = v16;
      }

    }
    else
    {
      v13 = BTErrorF(4294960591, "No completion provided");
      v14 = objc_claimAutoreleasedReturnValue(v13);
      v10 = (void *)v24[5];
      v24[5] = v14;
    }

  }
  ((void (*)(_QWORD *))v6[2])(v6);

  _Block_object_dispose(&v23, 8);
}

- (void)deleteSoundProfileRecordWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD *v6;
  id *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  OS_dispatch_queue *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[5];
  id v17;
  id obj;
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v4 = a3;
  if (dword_10020FC38 <= 30 && (dword_10020FC38 != -1 || _LogCategory_Initialize(&dword_10020FC38, 30)))
    LogPrintF(&dword_10020FC38, "-[BTCloudServicesXPCConnection deleteSoundProfileRecordWithCompletion:]", 30, "Deleting sound profile");
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_100075C44;
  v26 = sub_100075C54;
  v27 = 0;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10007B288;
  v19[3] = &unk_1001E2A58;
  v21 = &v22;
  v5 = v4;
  v20 = v5;
  v6 = objc_retainBlock(v19);
  v7 = (id *)(v23 + 5);
  obj = (id)v23[5];
  v8 = -[BTCloudServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v7, obj);
  if ((v8 & 1) != 0)
  {
    if (v5)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "deviceManager"));

      if (v10)
      {
        v11 = self->_dispatchQueue;
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_10007B344;
        v16[3] = &unk_1001E2070;
        v16[4] = v11;
        v17 = v5;
        objc_msgSend(v10, "removeSoundProfileRecordWithCompletion:", v16);

      }
      else
      {
        v14 = BTErrorF(4294960551, "Device manager not available");
        v15 = objc_claimAutoreleasedReturnValue(v14);
        v11 = (OS_dispatch_queue *)v23[5];
        v23[5] = v15;
      }

    }
    else
    {
      v12 = BTErrorF(4294960591, "No completion provided");
      v13 = objc_claimAutoreleasedReturnValue(v12);
      v10 = (void *)v23[5];
      v23[5] = v13;
    }

  }
  ((void (*)(_QWORD *))v6[2])(v6);

  _Block_object_dispose(&v22, 8);
}

- (BTUserCloudServicesDaemon)daemon
{
  return self->_daemon;
}

- (void)setDaemon:(id)a3
{
  objc_storeStrong((id *)&self->_daemon, a3);
}

- (AACloudServicesClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (BOOL)direct
{
  return self->_direct;
}

- (void)setDirect:(BOOL)a3
{
  self->_direct = a3;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (BOOL)entitled
{
  return self->_entitled;
}

- (void)setEntitled:(BOOL)a3
{
  self->_entitled = a3;
}

- (NSXPCConnection)xpcCnx
{
  return self->_xpcCnx;
}

- (void)setXpcCnx:(id)a3
{
  objc_storeStrong((id *)&self->_xpcCnx, a3);
}

- (NSString)signingIdentity
{
  return self->_signingIdentity;
}

- (void)setSigningIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_signingIdentity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signingIdentity, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_daemon, 0);
}

@end
