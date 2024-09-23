@implementation CBStackControllerBTStack

- (BOOL)poweredOn
{
  if (qword_100978130 != -1)
    dispatch_once(&qword_100978130, &stru_100919900);
  return sub_10002527C((uint64_t)off_100978128) == 1;
}

- (int64_t)powerState
{
  if (qword_100978130 != -1)
    dispatch_once(&qword_100978130, &stru_100919900);
  sub_10002527C((uint64_t)off_100978128);
  return 4;
}

- (CBStackControllerBTStack)init
{
  CBStackControllerBTStack *v2;
  CBStackControllerBTStack *v3;
  CBStackControllerBTStack *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CBStackControllerBTStack;
  v2 = -[CBStackControllerBTStack init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    v2->_powerStateNotifyToken = -1;
    v4 = v2;
  }

  return v3;
}

- (CBControllerInfo)controllerInfo
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  unsigned int v7;
  NSString *v8;
  void *v9;
  uint64_t v10;
  void *p_s1;
  const void *v12;
  void *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  unsigned int v25;
  unsigned int v26;
  _BOOL4 v27;
  unint64_t v28;
  uint64_t v29;
  id v30;
  id v31;
  uint64_t v33;
  id v34;
  id v35;
  const char *v36;
  const char *v37;
  int v38;
  uint64_t v39;
  BOOL v40;
  _BOOL8 v41;
  const char *v42;
  int v43;
  id v44;
  void *v45;
  id v46;
  void *__s1;
  uint64_t v48;
  uint64_t v49;

  v3 = objc_alloc_init((Class)CBControllerInfo);
  if (qword_100978120 != -1)
    dispatch_once(&qword_100978120, &stru_1009198A0);
  v4 = sub_1002654D0(qword_100978118);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_msgSend(v3, "setAudioLinkQualityArray:", v5);

  objc_msgSend(v3, "setBluetoothState:", -[CBStackControllerBTStack powerState](self, "powerState"));
  v6 = sub_1000438A4();
  v7 = *(_DWORD *)(v6 + 712);
  v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", sub_100332030(v6, v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v3, "setChipsetID:", v9);

  objc_msgSend(v3, "setDiscoverableState:", -[CBStackControllerBTStack discoverableState](self, "discoverableState"));
  if (v7)
  {
    __s1 = 0;
    v48 = 0;
    v49 = 0;
    v10 = sub_10034D3CC();
    (*(void (**)(uint64_t, void **))(*(_QWORD *)v10 + 64))(v10, &__s1);
    if (SHIBYTE(v49) < 0)
    {
      if (!v48)
        goto LABEL_16;
      if (v48 != 43)
      {
        p_s1 = __s1;
        goto LABEL_15;
      }
      p_s1 = __s1;
      v12 = __s1;
    }
    else
    {
      if (!HIBYTE(v49))
        goto LABEL_16;
      if (HIBYTE(v49) != 43)
      {
        p_s1 = &__s1;
        goto LABEL_15;
      }
      p_s1 = &__s1;
      v12 = &__s1;
    }
    if (!memcmp(v12, "No Bluetooth automatic firmware update file", 0x2BuLL))
    {
LABEL_16:
      v14 = sub_10034D3CC();
      v15 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v14 + 80))(v14);
      if (v15 > 11)
      {
        switch(v15)
        {
          case 12:
            v20 = CBErrorF(310012, "Bluetooth not initialized");
            v17 = (void *)objc_claimAutoreleasedReturnValue(v20);
            objc_msgSend(v3, "setLastChipsetInitError:", v17);
            goto LABEL_29;
          case 213:
            v21 = CBErrorF(310213, "Bluetooth chipboot timeout");
            v17 = (void *)objc_claimAutoreleasedReturnValue(v21);
            objc_msgSend(v3, "setLastChipsetInitError:", v17);
            goto LABEL_29;
          case 214:
            v18 = CBErrorF(310214, "Bluetooth chipboot crash loop");
            v17 = (void *)objc_claimAutoreleasedReturnValue(v18);
            objc_msgSend(v3, "setLastChipsetInitError:", v17);
            goto LABEL_29;
        }
      }
      else
      {
        switch(v15)
        {
          case 0:
            goto LABEL_30;
          case 1:
            v19 = CBErrorF(310001, "Bluetooth error");
            v17 = (void *)objc_claimAutoreleasedReturnValue(v19);
            objc_msgSend(v3, "setLastChipsetInitError:", v17);
            goto LABEL_29;
          case 2:
            v16 = CBErrorF(310002, "Bluetooth chipboot FW Update not implemented");
            v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
            objc_msgSend(v3, "setLastChipsetInitError:", v17);
LABEL_29:

LABEL_30:
            if (SHIBYTE(v49) < 0)
              operator delete(__s1);
            goto LABEL_32;
        }
      }
      v22 = CBErrorF((v15 + 310000), "Undefined error");
      v17 = (void *)objc_claimAutoreleasedReturnValue(v22);
      objc_msgSend(v3, "setLastChipsetInitError:", v17);
      goto LABEL_29;
    }
LABEL_15:
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", p_s1));
    objc_msgSend(v3, "setFirmwareName:", v13);

    goto LABEL_16;
  }
LABEL_32:
  if (qword_100977A58 != -1)
    dispatch_once(&qword_100977A58, &stru_100919880);
  if (*((_BYTE *)off_100977A50 + 60))
  {
    WORD2(__s1) = 0;
    LODWORD(__s1) = 0;
    sub_1004A3424((uint64_t)off_100977A50, (uint64_t)&__s1);
    v23 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &__s1, 6);
    objc_msgSend(v3, "setHardwareAddressData:", v23);

  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CBStackControllerBTStack fastLEConnectionInfoData](self, "fastLEConnectionInfoData"));
  objc_msgSend(v3, "setFastLEConnectionInfoData:", v24);

  objc_msgSend(v3, "setFastLEConnectionInfoVersion:", -[CBStackControllerBTStack fastLEConnectionInfoVersion](self, "fastLEConnectionInfoVersion"));
  v25 = sub_1001702EC();
  if (v25 >= 8)
  {
    v26 = 0;
    v27 = 0;
    LOBYTE(v28) = 0;
  }
  else
  {
    v26 = (0x3Eu >> v25) & 1;
    v27 = v25 == 0;
    v28 = 0x201030303030304uLL >> (8 * v25);
  }
  objc_msgSend(v3, "setHciTransportType:", (char)v28);
  objc_msgSend(v3, "setInquiryState:", -[CBStackControllerBTStack inquiryState](self, "inquiryState"));
  v29 = sub_1000438A4();
  objc_msgSend(v3, "setLeaVersion:", sub_100333B30(v29));
  objc_msgSend(v3, "setLmpVersion:", BYTE8(xmmword_100998F58));
  objc_msgSend(v3, "setProductID:", sub_1003CD8E0());
  if (qword_100977A78 != -1)
    dispatch_once(&qword_100977A78, &stru_1009198C0);
  objc_msgSend(v3, "setSupportedServices:", sub_10049ABD4((uint64_t)off_100977A70));
  objc_msgSend(v3, "setVendorID:", (unsigned __int16)sub_1003CD8D8());
  objc_msgSend(v3, "setVendorIDSource:", sub_10005549C());
  if (!v7)
  {
    v31 = objc_alloc((Class)NSString);
    v30 = objc_msgSend(v31, "initWithFormat:", CFSTR("v%u c%u"), WORD5(xmmword_100998F58), WORD3(xmmword_100998F58));
    objc_msgSend(v3, "setFirmwareVersion:", v30);
    goto LABEL_45;
  }
  if (v7 - 2000 <= 0x7CF)
  {
    v30 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firmwareName"));
    objc_msgSend(v3, "setFirmwareVersion:", v30);
LABEL_45:

    return (CBControllerInfo *)v3;
  }
  if (v7 <= 0x7CF)
  {
    v33 = sub_10003BE44();
    if (((v26 | v27) & (*(unsigned int (**)(uint64_t))(*(_QWORD *)v33 + 384))(v33)) == 1)
    {
      v34 = objc_alloc((Class)NSString);
      v30 = objc_msgSend(v34, "initWithFormat:", CFSTR("v%u c%u"), BYTE10(xmmword_100998F58), WORD3(xmmword_100998F58));
      objc_msgSend(v3, "setFirmwareVersion:", v30);
      goto LABEL_45;
    }
  }
  v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firmwareName")));
  v36 = (const char *)objc_msgSend(v35, "UTF8String");
  if (v36)
    v37 = v36;
  else
    v37 = "";

  while (1)
  {
    v38 = *(unsigned __int8 *)v37;
    if (!*v37 || v38 == 95)
      break;
    ++v37;
  }
  v39 = 0;
  v40 = v38 == 95;
  v41 = v38 == 95;
  if (v40)
    v42 = v37 + 1;
  else
    v42 = v37;
  while (1)
  {
    v43 = v37[v41 + v39];
    if (!v37[v41 + v39] || v43 == 95)
      break;
    ++v39;
  }
  if (v39 && v43 == 95)
  {
    v44 = objc_msgSend(objc_alloc((Class)NSString), "initWithBytes:length:encoding:", v42, v39, 4);
    objc_msgSend(v3, "setFirmwareVersion:", v44);

  }
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firmwareVersion"));

  if (!v45)
  {
    v46 = objc_alloc((Class)NSString);
    v30 = objc_msgSend(v46, "initWithFormat:", CFSTR("v%u"), WORD5(xmmword_100998F58));
    objc_msgSend(v3, "setFirmwareVersion:", v30);
    goto LABEL_45;
  }
  return (CBControllerInfo *)v3;
}

- (int)discoverableState
{
  char v3;

  v3 = 0;
  if (qword_100977898 != -1)
    dispatch_once(&qword_100977898, &stru_1009198E0);
  sub_10047A060((uint64_t)off_100977890, &v3);
  if (v3)
    return 2;
  else
    return 1;
}

- (BOOL)addDiscoverableController:(id)a3 error:(id *)a4
{
  id v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  id v12;
  char *v13;
  uint64_t v14;
  int v15;
  unint64_t v16;
  int v17;
  uint64_t v18;
  CBStackDiscoverableSession *v19;
  NSMutableDictionary *discoverableSessionMap;
  NSMutableDictionary *v21;
  NSMutableDictionary *v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *__p[2];
  char v30;
  _QWORD v31[5];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;

  v6 = a3;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1000CA264;
  v31[3] = &unk_1009193E8;
  v31[4] = &v32;
  v7 = objc_retainBlock(v31);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithNonretainedObject:](NSValue, "valueWithNonretainedObject:", v6));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_discoverableSessionMap, "objectForKeyedSubscript:", v8));

  if (!v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "appID"));
    if (!v11)
    {
      if (a4)
      {
        v24 = CBErrorF(4294960591, "No app ID");
        v10 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue(v24);
      }
      else
      {
        v10 = 0;
      }
      goto LABEL_25;
    }
    v12 = objc_retainAutorelease(objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%@-0x%08X"), v11, objc_msgSend(v6, "clientID")));
    v13 = (char *)objc_msgSend(v12, "UTF8String");
    if (qword_100977B50 != -1)
      dispatch_once(&qword_100977B50, &stru_100919860);
    v14 = qword_100977B48;
    sub_100091AE8(__p, v13);
    v15 = sub_10000A378(v14, (uint64_t)__p);
    if (v30 < 0)
      operator delete(__p[0]);
    if (v15 && v15 != -310000)
    {
      if (a4)
      {
        v25 = CBErrorF((v15 + 310000), "Attach session failed");
        v10 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue(v25);
LABEL_24:

LABEL_25:
        goto LABEL_26;
      }
    }
    else
    {
      if (qword_100977898 != -1)
        dispatch_once(&qword_100977898, &stru_1009198E0);
      v16 = sub_100020C54(off_100977890, v33[3]);
      if (v16)
      {
        if (dword_100978048 <= 30
          && (dword_100978048 != -1 || _LogCategory_Initialize(&dword_100978048, 30)))
        {
          LogPrintF_safe(&dword_100978048, "-[CBStackControllerBTStack addDiscoverableController:error:]", 30, "AddDiscoverableController: %@", v12);
        }
        if (qword_100977898 != -1)
          dispatch_once(&qword_100977898, &stru_1009198E0);
        v17 = sub_100476B34(off_100977890, v16, 1);
        if (!v17 || (v18 = (v17 + 310000), !(_DWORD)v18))
        {
          v19 = objc_alloc_init(CBStackDiscoverableSession);
          -[CBStackDiscoverableSession setBtSessionHandle:](v19, "setBtSessionHandle:", v33[3]);
          discoverableSessionMap = self->_discoverableSessionMap;
          if (!discoverableSessionMap)
          {
            v21 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
            v22 = self->_discoverableSessionMap;
            self->_discoverableSessionMap = v21;

            discoverableSessionMap = self->_discoverableSessionMap;
          }
          -[NSMutableDictionary setObject:forKeyedSubscript:](discoverableSessionMap, "setObject:forKeyedSubscript:", v19, v8);
          v33[3] = 0;

          v10 = 1;
          goto LABEL_24;
        }
        if (a4)
        {
          v28 = CBErrorF(v18, "setDiscoverable failed");
          v27 = (void *)objc_claimAutoreleasedReturnValue(v28);
          goto LABEL_35;
        }
      }
      else if (a4)
      {
        v26 = CBErrorF(0, "Get LocalDevice handle failed");
        v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
LABEL_35:
        v10 = 0;
        *a4 = v27;
        goto LABEL_24;
      }
    }
    v10 = 0;
    goto LABEL_24;
  }
  v10 = 1;
LABEL_26:

  ((void (*)(_QWORD *))v7[2])(v7);
  _Block_object_dispose(&v32, 8);

  return v10;
}

- (void)removeDiscoverableController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  if (dword_100978048 <= 30 && (dword_100978048 != -1 || _LogCategory_Initialize(&dword_100978048, 30)))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "appID"));
    LogPrintF_safe(&dword_100978048, "-[CBStackControllerBTStack removeDiscoverableController:]", 30, "RemoveDiscoverableController: %@-0x%08X", v4, objc_msgSend(v8, "clientID"));

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithNonretainedObject:](NSValue, "valueWithNonretainedObject:", v8));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_discoverableSessionMap, "objectForKeyedSubscript:", v5));
  if (v6)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_discoverableSessionMap, "setObject:forKeyedSubscript:", 0, v5);
    v7 = objc_msgSend(v6, "btSessionHandle");
    if (qword_100977B50 != -1)
      dispatch_once(&qword_100977B50, &stru_100919860);
    sub_10000B174(qword_100977B48, (unint64_t)v7);
  }

}

- (int)inquiryState
{
  if (qword_100977898 != -1)
    dispatch_once(&qword_100977898, &stru_1009198E0);
  if (sub_10047AB58())
    return 2;
  else
    return 1;
}

- (BOOL)setPowerState:(int64_t)a3 error:(id *)a4
{
  int v5;
  int v6;
  uint64_t v7;
  const char *v8;
  int v9;
  uint64_t v10;
  BOOL v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  int64_t v17;

  switch(a3)
  {
    case 4:
      if (qword_100978130 != -1)
        dispatch_once(&qword_100978130, &stru_100919900);
      v9 = sub_10047DECC((uint64_t)off_100978128);
      v10 = (v9 + 310000);
      if (v9)
        v11 = (_DWORD)v10 == 0;
      else
        v11 = 1;
      if (!v11)
      {
        if (a4)
        {
          v14 = CBErrorF(v10, "Power off failed");
          goto LABEL_35;
        }
        goto LABEL_38;
      }
      LOBYTE(v6) = 1;
      break;
    case 10:
      if (qword_100977898 != -1)
        dispatch_once(&qword_100977898, &stru_1009198E0);
      sub_100478C60((uint64_t)off_100977890, 0, 1);
      if (qword_100978130 != -1)
        dispatch_once(&qword_100978130, &stru_100919900);
      v6 = sub_10002527C((uint64_t)off_100978128);
      if (v6 != 1)
      {
        if (qword_100978130 != -1)
          dispatch_once(&qword_100978130, &stru_100919900);
        v12 = sub_10047DB74((uint64_t)off_100978128);
        LOBYTE(v6) = 1;
        if (v12)
        {
          v7 = (v12 + 310000);
          if ((_DWORD)v7)
          {
            if (a4)
            {
              v8 = "Power on restricted failed";
              goto LABEL_31;
            }
LABEL_38:
            LOBYTE(v6) = 0;
          }
        }
      }
      break;
    case 5:
      if (qword_100977898 != -1)
        dispatch_once(&qword_100977898, &stru_1009198E0);
      sub_100478C60((uint64_t)off_100977890, 0, 0);
      if (qword_100978130 != -1)
        dispatch_once(&qword_100978130, &stru_100919900);
      v5 = sub_10047DB74((uint64_t)off_100978128);
      LOBYTE(v6) = 1;
      if (v5)
      {
        v7 = (v5 + 310000);
        if ((_DWORD)v7)
        {
          if (a4)
          {
            v8 = "Power on failed";
LABEL_31:
            v13 = v7;
LABEL_34:
            v14 = CBErrorF(v13, v8, v17);
LABEL_35:
            v15 = (id)objc_claimAutoreleasedReturnValue(v14);
            LOBYTE(v6) = 0;
            *a4 = v15;
            return v6;
          }
          goto LABEL_38;
        }
      }
      break;
    default:
      if (a4)
      {
        v17 = a3;
        v8 = "Unsupported power state: %d";
        v13 = 4294960561;
        goto LABEL_34;
      }
      goto LABEL_38;
  }
  return v6;
}

- (void)setLowPowerModeWithReason:(int)a3 completionHandler:(id)a4
{
  id v6;
  dispatch_queue_attr_t v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  _QWORD block[5];
  id v12;
  int v13;

  v6 = a4;
  v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = dispatch_queue_create("CBStackSetLowPowerMode", v8);

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000CA800;
  block[3] = &unk_100919438;
  v13 = a3;
  block[4] = self;
  v12 = v6;
  v10 = v6;
  dispatch_async(v9, block);

}

- (BOOL)setLowPowerModeWithReason:(int)a3 error:(id *)a4
{
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  dispatch_time_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  _QWORD handler[5];
  _QWORD v24[3];
  _QWORD v25[3];

  v5 = *(_QWORD *)&a3;
  v6 = sub_100113398();
  v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, 0);
  v8 = dispatch_time(0, 9000000000);
  dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000CAC54;
  handler[3] = &unk_100917378;
  handler[4] = v6;
  dispatch_source_set_event_handler(v7, handler);
  dispatch_activate(v7);
  v9 = sub_100038E50();
  if (((*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v9 + 88))(v9, v5) & 1) == 0)
  {
    if (a4)
    {
      v20 = CBErrorF(4294960587, "notifySystemWillShutdown returned disallowed");
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
LABEL_24:
      v18 = 0;
      *a4 = v21;
      goto LABEL_19;
    }
LABEL_25:
    v18 = 0;
    goto LABEL_19;
  }
  if (qword_100978140 != -1)
    dispatch_once(&qword_100978140, &stru_100919920);
  sub_10025B68C((uint64_t)off_100978138);
  if (qword_100978140 != -1)
    dispatch_once(&qword_100978140, &stru_100919920);
  v10 = sub_10025C094((uint64_t)off_100978138, v5);
  if (qword_100978140 != -1)
    dispatch_once(&qword_100978140, &stru_100919920);
  sub_10025B764((uint64_t)off_100978138);
  if (v10)
    v11 = (v10 + 310000);
  else
    v11 = 0;
  v12 = sub_100113398() - v6;
  if (dword_100978048 <= 30 && (dword_100978048 != -1 || _LogCategory_Initialize(&dword_100978048, 30)))
    LogPrintF_safe(&dword_100978048, "-[CBStackControllerBTStack setLowPowerModeWithReason:error:]", 30, "LPM entry took %llums", v12);
  dispatch_source_cancel(v7);
  if (v12 >> 3 <= 0x464)
  {
    v24[0] = CFSTR("errorCode");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v11));
    v25[0] = v13;
    v24[1] = CFSTR("errorCount");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (_DWORD)v11 != 0));
    v25[1] = v14;
    v24[2] = CFSTR("timeToEnter");
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v12));
    v25[2] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v25, v24, 3));

    v17 = sub_100065478();
    (*(void (**)(uint64_t, void *))(*(_QWORD *)v17 + 216))(v17, v16);

  }
  if ((_DWORD)v11)
  {
    if (a4)
    {
      v22 = CBErrorF(v11, "enterLPM failed");
      v21 = (void *)objc_claimAutoreleasedReturnValue(v22);
      goto LABEL_24;
    }
    goto LABEL_25;
  }
  v18 = 1;
LABEL_19:

  return v18;
}

- (void)setOfflineAdvertisingParams:(id)a3
{
  id v3;
  dispatch_queue_attr_t v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;

  v3 = a3;
  v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = dispatch_queue_create("CBStackSetOfflineAdvertisingParams", v5);

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000CAEE8;
  block[3] = &unk_1009172A0;
  v9 = v3;
  v7 = v3;
  dispatch_async(v6, block);

}

- (id)description
{
  return -[CBStackControllerBTStack descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  unint64_t v3;
  const char *v4;
  unsigned int v5;
  const char *v6;
  void *v7;
  unsigned int v8;
  unint64_t stackControllerInfoCloudSyncStatus;
  const char *v10;
  unsigned int v11;
  const char *v12;
  const char *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSMutableSet *v25;
  id v26;
  uint64_t v27;
  const char *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  const char *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  NSMutableSet *v44;
  NSMutableSet *v45;
  NSMutableSet *v47;
  NSMutableSet *obj;
  NSMutableSet *obja;
  id v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  id v56;
  id v57;
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  id v63;
  id v64;
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  id v70;
  id v71;
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];

  v71 = 0;
  v3 = -[CBStackControllerBTStack powerState](self, "powerState", *(_QWORD *)&a3);
  if (v3 > 0xA)
    v4 = "?";
  else
    v4 = off_100919B38[v3];
  v5 = -[CBStackControllerBTStack discoverableState](self, "discoverableState");
  if (v5 > 2)
    v6 = "?";
  else
    v6 = off_100919B20[v5];
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CBStackControllerBTStack controllerInfo](self, "controllerInfo"));
  v8 = objc_msgSend(v7, "fastLEConnectionInfoVersion");
  stackControllerInfoCloudSyncStatus = (char)self->_stackControllerInfoCloudSyncStatus;
  if (stackControllerInfoCloudSyncStatus > 3)
    v10 = "?";
  else
    v10 = off_100919B00[stackControllerInfoCloudSyncStatus];
  v11 = -[CBStackControllerBTStack inquiryState](self, "inquiryState");
  if (v11 > 2)
    v12 = "?";
  else
    v12 = off_100919B20[v11];
  if (self->_btSessionPtr)
    v13 = "yes";
  else
    v13 = "no";
  NSAppendPrintF_safe(&v71, "CBStackController: state %s, discoverable %s, fastLE v%d (%s), inquiry %s, session %s", v4, v6, v8, v10, v12, v13);
  v14 = v71;

  v45 = self->_connectDeviceRequests;
  if (-[NSMutableSet count](v45, "count"))
  {
    v70 = v14;
    NSAppendPrintF_safe(&v70, ", connectDeviceRequests [");
    v15 = v70;

    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    obj = v45;
    v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v67;
      v18 = "";
      do
      {
        v19 = 0;
        v20 = v15;
        do
        {
          if (*(_QWORD *)v67 != v17)
            objc_enumerationMutation(obj);
          v21 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * (_QWORD)v19);
          v65 = v20;
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "connection"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "peerDevice"));
          NSAppendPrintF_safe(&v65, "%s%@", v18, v23);
          v15 = v65;

          v19 = (char *)v19 + 1;
          v18 = ", ";
          v20 = v15;
        }
        while (v16 != v19);
        v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
        v18 = ", ";
      }
      while (v16);
    }

    v64 = v15;
    NSAppendPrintF_safe(&v64, "]");
    v14 = v64;

  }
  v44 = self->_modifyDeviceRequests;
  if (-[NSMutableSet count](v44, "count"))
  {
    v63 = v14;
    NSAppendPrintF_safe(&v63, ", modifyDeviceRequests [");
    v24 = v63;

    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v25 = v44;
    v26 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v59, v73, 16);
    if (v26)
    {
      v27 = *(_QWORD *)v60;
      v28 = "";
      do
      {
        v29 = 0;
        v30 = v24;
        do
        {
          if (*(_QWORD *)v60 != v27)
            objc_enumerationMutation(v25);
          v31 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)v29);
          v58 = v30;
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "device"));
          NSAppendPrintF_safe(&v58, "%s%@", v28, v32);
          v24 = v58;

          v29 = (char *)v29 + 1;
          v28 = ", ";
          v30 = v24;
        }
        while (v26 != v29);
        v26 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v59, v73, 16);
        v28 = ", ";
      }
      while (v26);
    }

    v57 = v24;
    NSAppendPrintF_safe(&v57, "]");
    v14 = v57;

  }
  v47 = self->_performDeviceRequests;
  if (-[NSMutableSet count](v47, "count"))
  {
    v56 = v14;
    NSAppendPrintF_safe(&v56, ", performDeviceRequests [");
    v33 = v56;

    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    obja = v47;
    v34 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v52, v72, 16);
    if (v34)
    {
      v35 = *(_QWORD *)v53;
      v36 = "";
      do
      {
        v37 = 0;
        v38 = v33;
        do
        {
          if (*(_QWORD *)v53 != v35)
            objc_enumerationMutation(obja);
          v39 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)v37);
          v51 = v38;
          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "device"));
          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "request"));
          NSAppendPrintF_safe(&v51, "%s{%@, %@}", v36, v40, v41);
          v33 = v51;

          v37 = (char *)v37 + 1;
          v38 = v33;
          v36 = ", ";
        }
        while (v34 != v37);
        v34 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v52, v72, 16);
        v36 = ", ";
      }
      while (v34);
    }

    v50 = v33;
    NSAppendPrintF_safe(&v50, "]");
    v14 = v50;

  }
  v42 = v14;

  return v42;
}

- (void)activate
{
  BTSessionImpl **p_btSessionHandle;
  __objc2_class *v3;
  _DWORD *v4;
  NSObject *dispatchQueue;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *__p[2];
  char v15;

  dispatchQueue = self->_dispatchQueue;
  if (!dispatchQueue)
  {
    FatalErrorF("CBStackController: No dispatchQueue", a2);
LABEL_29:
    dispatch_once(&qword_100977B50, &stru_100919860);
    goto LABEL_8;
  }
  dispatch_assert_queue_V2(dispatchQueue);
  objc_storeStrong((id *)&qword_10097BB50, self);
  p_btSessionHandle = &self->_btSessionHandle;
  if (self->_btSessionHandle)
    goto LABEL_21;
  v4 = &unk_100978000;
  if (dword_100978048 <= 30 && (dword_100978048 != -1 || _LogCategory_Initialize(&dword_100978048, 30)))
    LogPrintF_safe(&dword_100978048, "-[CBStackControllerBTStack activate]", 30, "Activate");
  v3 = &OBJC_METACLASS___BTVCLinkAdvertiseSet;
  if (qword_100977B50 != -1)
    goto LABEL_29;
LABEL_8:
  v7 = qword_100977B48;
  sub_100091AE8(__p, "CBDaemon");
  v8 = sub_10000A378(v7, (uint64_t)__p);
  v9 = v8;
  if (v15 < 0)
  {
    operator delete(__p[0]);
    if (!v9)
      goto LABEL_17;
LABEL_12:
    v10 = (v9 + 310000);
    if ((_DWORD)v10)
    {
      v11 = v4[18];
      if (v11 <= 90 && (v11 != -1 || _LogCategory_Initialize(&dword_100978048, 90)))
      {
        v12 = CUPrintErrorCode(v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        LogPrintF_safe(&dword_100978048, "-[CBStackControllerBTStack activate]", 90, "### Attach session failed: %@", v13);

      }
    }
    goto LABEL_17;
  }
  if (v8)
    goto LABEL_12;
LABEL_17:
  if (*p_btSessionHandle)
  {
    if (v3[72].cache != (void *)-1)
      dispatch_once(&qword_100977B50, &stru_100919860);
    self->_btSessionPtr = (void *)sub_1000229D8((_QWORD *)qword_100977B48, (unint64_t)self->_btSessionHandle);
  }
LABEL_21:
  if (!self->_addedController)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&unk_10097BB58);
    if (!qword_10097BB60)
      operator new();
    sub_1000CB910(qword_10097BB60, self);
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_10097BB58);
    self->_addedController = 1;
  }
  if (self->_powerStateNotifyToken == -1)
  {
    notify_register_check("com.apple.bluetooth.state", &self->_powerStateNotifyToken);
    notify_set_state(self->_powerStateNotifyToken, -[CBStackControllerBTStack powerState](self, "powerState"));
    notify_post("com.apple.bluetooth.state");
  }
}

- (void)invalidate
{
  void *v3;
  id v4;
  uint64_t v5;
  void *i;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *j;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *k;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  BTSessionImpl *btSessionHandle;
  int v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  int powerStateNotifyToken;
  id controllerDataChangedHandler;
  id discoverableStateChangedHandler;
  id inquiryStateChangedHandler;
  void (**v33)(_QWORD);
  id invalidationHandler;
  id powerChangedHandler;
  id relayMessageHandler;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_addedController)
  {
    if (dword_100978048 <= 30
      && (dword_100978048 != -1 || _LogCategory_Initialize(&dword_100978048, 30)))
    {
      LogPrintF_safe(&dword_100978048, "-[CBStackControllerBTStack invalidate]", 30, "Invalidate");
    }
    os_unfair_lock_lock((os_unfair_lock_t)&unk_10097BB58);
    if (qword_10097BB60)
      sub_1000CC00C(qword_10097BB60, self);
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_10097BB58);
    self->_addedController = 0;
  }
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](self->_connectDeviceRequests, "allObjects"));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v47 != v5)
          objc_enumerationMutation(v3);
        v7 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)i);
        v8 = CBErrorF(4294896148, "StackController invalidated");
        v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
        -[CBStackControllerBTStack _connectDeviceCompleteRequest:error:](self, "_connectDeviceCompleteRequest:error:", v7, v9);

      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
    }
    while (v4);
  }

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](self->_modifyDeviceRequests, "allObjects"));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v43;
    do
    {
      for (j = 0; j != v11; j = (char *)j + 1)
      {
        if (*(_QWORD *)v43 != v12)
          objc_enumerationMutation(v10);
        v14 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)j);
        v15 = CBErrorF(4294896148, "StackController invalidated");
        v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        -[CBStackControllerBTStack _modifyDeviceCompleteRequest:error:](self, "_modifyDeviceCompleteRequest:error:", v14, v16);

      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
    }
    while (v11);
  }

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](self->_performDeviceRequests, "allObjects"));
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v39;
    do
    {
      for (k = 0; k != v18; k = (char *)k + 1)
      {
        if (*(_QWORD *)v39 != v19)
          objc_enumerationMutation(v17);
        v21 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)k);
        v22 = CBErrorF(4294896148, "StackController invalidated");
        v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
        -[CBStackControllerBTStack _completePerformDeviceRequest:error:](self, "_completePerformDeviceRequest:error:", v21, v23);

      }
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
    }
    while (v18);
  }

  -[CBStackControllerBTStack _pairingAgentTearDown](self, "_pairingAgentTearDown");
  btSessionHandle = self->_btSessionHandle;
  if (btSessionHandle)
  {
    if (qword_100977B50 != -1)
      dispatch_once(&qword_100977B50, &stru_100919860);
    v25 = sub_10000B174(qword_100977B48, (unint64_t)btSessionHandle);
    if (v25)
    {
      v26 = (v25 + 310000);
      if (v25 != -310000
        && dword_100978048 <= 90
        && (dword_100978048 != -1 || _LogCategory_Initialize(&dword_100978048, 90)))
      {
        v27 = CUPrintErrorCode(v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
        LogPrintF_safe(&dword_100978048, "-[CBStackControllerBTStack invalidate]", 90, "### Detach session failed: %@", v28);

      }
    }
  }
  powerStateNotifyToken = self->_powerStateNotifyToken;
  if (powerStateNotifyToken != -1)
  {
    notify_cancel(powerStateNotifyToken);
    self->_powerStateNotifyToken = -1;
  }
  self->_btSessionHandle = 0;
  self->_btSessionPtr = 0;
  controllerDataChangedHandler = self->_controllerDataChangedHandler;
  self->_controllerDataChangedHandler = 0;

  discoverableStateChangedHandler = self->_discoverableStateChangedHandler;
  self->_discoverableStateChangedHandler = 0;

  inquiryStateChangedHandler = self->_inquiryStateChangedHandler;
  self->_inquiryStateChangedHandler = 0;

  v33 = (void (**)(_QWORD))objc_retainBlock(self->_invalidationHandler);
  invalidationHandler = self->_invalidationHandler;
  self->_invalidationHandler = 0;

  powerChangedHandler = self->_powerChangedHandler;
  self->_powerChangedHandler = 0;

  relayMessageHandler = self->_relayMessageHandler;
  self->_relayMessageHandler = 0;

  v37 = (void *)qword_10097BB50;
  qword_10097BB50 = 0;

  if (v33)
    v33[2](v33);

}

- (void)_accessoryCommandStatusWithDevice:(id)a3 type:(int)a4 result:(unsigned __int16)a5 reason:(unsigned __int16)a6
{
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  uint64_t v16;
  void *v17;
  int v18;
  int v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v18 = a5;
  v19 = a6;
  v8 = a3;
  if (a4 == 1 && self->_addedController)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](self->_modifyDeviceRequests, "allObjects"));
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(v9);
          v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "device"));
          v15 = objc_msgSend(v14, "isEquivalentToCBDevice:compareFlags:", v8, 8);

          if ((v15 & 1) != 0)
          {
            if (v19 | v18)
            {
              v16 = CBErrorF(4294960584, "Connection priority update failed: result %u, reason %u", v18, v19);
              v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
            }
            else
            {
              v17 = 0;
            }
            -[CBStackControllerBTStack _modifyDeviceCompleteRequest:error:](self, "_modifyDeviceCompleteRequest:error:", v13, v17);

          }
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v10);
    }

  }
}

- (void)_accessoryReceivedRelayMessageType:(unsigned __int8)a3 messageData:(id)a4 conduitDevice:(id)a5 sourceDevice:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;

  v8 = a3;
  v14 = a4;
  v10 = a5;
  v11 = a6;
  if (self->_addedController)
  {
    v12 = objc_retainBlock(self->_relayMessageHandler);
    v13 = v12;
    if (v12)
      (*((void (**)(id, id, id, uint64_t, id))v12 + 2))(v12, v10, v11, v8, v14);

  }
}

- (void)_btDeviceWithID:(id)a3 error:(id *)a4
{
  return -[CBStackControllerBTStack _btDeviceWithID:createIfNeeded:error:](self, "_btDeviceWithID:createIfNeeded:error:", a3, 0, a4);
}

- (void)_btDeviceWithID:(id)a3 createIfNeeded:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  unint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  __int16 v21;

  v6 = a4;
  v7 = a3;
  if (v7)
  {
    v8 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v7);
    if (v8)
    {
      if (qword_1009778C8 != -1)
        dispatch_once(&qword_1009778C8, &stru_100919940);
      v9 = sub_1000589DC((uint64_t)off_1009778C0, v8, 0);
      if (v9)
      {
        if (qword_1009778E8 != -1)
          dispatch_once(&qword_1009778E8, &stru_100919960);
        v10 = (void *)sub_10006D488((uint64_t)off_1009778E0, v9, v6);
        if (v10)
          goto LABEL_15;
        if (a5)
        {
          v11 = CBErrorF(4294960569, "No BT device %@", v8);
          v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
LABEL_26:
          v10 = 0;
          *a5 = v12;
LABEL_15:

          goto LABEL_16;
        }
      }
      else if (a5)
      {
        v17 = CBErrorF(4294960569, "No LE device %@", v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue(v17);
        goto LABEL_26;
      }
    }
    else
    {
      v21 = 0;
      v20 = 0;
      v13 = objc_retainAutorelease(v7);
      if (TextToHardwareAddress(objc_msgSend(v13, "UTF8String"), -1, 6, &v20))
      {
        if (a5)
        {
          v18 = CBErrorF(4294960588, "Bad device ID '%@'", v13);
          v12 = (void *)objc_claimAutoreleasedReturnValue(v18);
          goto LABEL_26;
        }
      }
      else
      {
        v14 = ((unint64_t)v20 << 40) | ((unint64_t)BYTE1(v20) << 32) | ((unint64_t)BYTE2(v20) << 24) | ((unint64_t)HIBYTE(v20) << 16) | ((unint64_t)v21 << 8) | HIBYTE(v21);
        if (qword_1009778E8 != -1)
          dispatch_once(&qword_1009778E8, &stru_100919960);
        v10 = (void *)sub_10006D488((uint64_t)off_1009778E0, v14, v6);
        if (v10)
          goto LABEL_15;
        if (a5)
        {
          v19 = CBErrorF(4294960569, "No BT device %@", v13);
          v12 = (void *)objc_claimAutoreleasedReturnValue(v19);
          goto LABEL_26;
        }
      }
    }
    v10 = 0;
    goto LABEL_15;
  }
  if (a5)
  {
    v16 = CBErrorF(4294960591, "No device ID");
    v10 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue(v16);
  }
  else
  {
    v10 = 0;
  }
LABEL_16:

  return v10;
}

- (id)_btUUIDWithID:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  unint64_t v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v14;
  id v15;
  uint64_t v16;
  int v17;
  __int16 v18;
  _QWORD v19[2];

  v5 = a3;
  v6 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v5);
  if (!v6)
  {
    v18 = 0;
    v17 = 0;
    v8 = objc_retainAutorelease(v5);
    if (TextToHardwareAddress(objc_msgSend(v8, "UTF8String"), -1, 6, &v17))
    {
      if (!a4)
      {
        v7 = 0;
        goto LABEL_8;
      }
      v14 = CBErrorF(4294960588, "Bad device ID '%@'", v8);
      v15 = (id)objc_claimAutoreleasedReturnValue(v14);
      v7 = 0;
    }
    else
    {
      v9 = ((unint64_t)v17 << 40) | ((unint64_t)BYTE1(v17) << 32) | ((unint64_t)BYTE2(v17) << 24) | ((unint64_t)HIBYTE(v17) << 16) | ((unint64_t)v18 << 8) | HIBYTE(v18);
      v19[0] = 0;
      v19[1] = 0;
      if (qword_1009778C8 != -1)
        dispatch_once(&qword_1009778C8, &stru_100919940);
      sub_10003F924((uint64_t)off_1009778C0, v9, 0, 1u, 0, 0, (unsigned __int8 *)v19);
      v10 = sub_100030DF4((const unsigned __int8 *)v19);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v7 = v11;
      if (v11)
      {
        v12 = v11;
        goto LABEL_8;
      }
      if (!a4)
        goto LABEL_8;
      v16 = CBErrorF(4294960569, "ID not found");
      v15 = (id)objc_claimAutoreleasedReturnValue(v16);
    }
    *a4 = v15;
    goto LABEL_8;
  }
  v7 = v6;
LABEL_8:

  return v7;
}

- (BOOL)connectDevice:(id)a3 connectionFlags:(unsigned int)a4 serviceFlags:(unsigned int)a5 error:(id *)a6
{
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int v14;
  BOOL v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  std::string __str;

  v10 = a3;
  if (qword_100977A58 != -1)
    dispatch_once(&qword_100977A58, &stru_100919880);
  if (*((_BYTE *)off_100977A50 + 60))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
    v12 = -[CBStackControllerBTStack _btDeviceWithID:createIfNeeded:error:](self, "_btDeviceWithID:createIfNeeded:error:", v11, (a4 >> 5) & 1, a6);
    v13 = (uint64_t)v12;
    if (v12)
    {
      sub_10044E080((uint64_t)v12, (a4 & 4) != 0);
      if (qword_100977A88 != -1)
        dispatch_once(&qword_100977A88, &stru_100919980);
      sub_1002A1AA4((uint64_t)off_100977A80, v13, (a4 & 4) != 0);
      if ((a4 & 1) != 0)
        sub_10044E03C(v13, 1);
      if ((a4 & 8) != 0)
      {
        if (qword_100977A88 != -1)
          dispatch_once(&qword_100977A88, &stru_100919980);
        sub_10027F960((uint64_t)off_100977A80, v13, 1);
      }
      if ((a4 & 0x10) != 0)
      {
        sub_100091AE8(&__str, "");
        *(_BYTE *)(v13 + 1427) = 1;
        std::string::operator=((std::string *)(v13 + 1472), &__str);
        if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__str.__r_.__value_.__l.__data_);
      }
      if (qword_100977A78 != -1)
        dispatch_once(&qword_100977A78, &stru_1009198C0);
      memset(&__str, 0, sizeof(__str));
      v14 = sub_100495A98((int64x2_t *)off_100977A70, v13, a5, &__str, 2);
      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__str.__r_.__value_.__l.__data_);
      if (!v14)
      {
        v15 = 1;
LABEL_22:

        goto LABEL_23;
      }
      if (a6)
      {
        if (v14 == -310000)
          v18 = 4294960596;
        else
          v18 = (v14 + 310000);
        v19 = CBErrorF(v18, "Connect failed %@", v11);
        v15 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue(v19);
        goto LABEL_22;
      }
    }
    v15 = 0;
    goto LABEL_22;
  }
  if (a6)
  {
    v17 = CBErrorF(4294896144, "Bluetooth powered off");
    v15 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue(v17);
  }
  else
  {
    v15 = 0;
  }
LABEL_23:

  return v15;
}

- (void)connectWithCBConnection:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  int v10;
  id *v11;
  char *v12;
  unsigned int v13;
  __int16 v14;
  int v15;
  void *v16;
  id v17;
  id v18;
  int v19;
  uint64_t v20;
  CBStackConnectDeviceRequest *v21;
  NSObject *v22;
  double v23;
  NSMutableSet *connectDeviceRequests;
  NSMutableSet *v25;
  NSMutableSet *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  _QWORD *v36;
  _QWORD handler[7];
  std::string v38;
  std::string __str;
  id obj;
  _QWORD v41[4];
  id v42;
  uint64_t *v43;
  uint64_t v44;
  id *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;

  v6 = a3;
  v35 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v44 = 0;
  v45 = (id *)&v44;
  v46 = 0x3032000000;
  v47 = sub_10006250C;
  v48 = sub_100062340;
  v49 = 0;
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_1000CD1CC;
  v41[3] = &unk_100919460;
  v43 = &v44;
  v7 = v35;
  v42 = v7;
  v36 = objc_retainBlock(v41);
  if (dword_100978048 <= 30 && (dword_100978048 != -1 || _LogCategory_Initialize(&dword_100978048, 30)))
    LogPrintF_safe(&dword_100978048, "-[CBStackControllerBTStack connectWithCBConnection:completionHandler:]", 30, "ConnectDevice start: %@", v6);
  if (qword_100977A58 != -1)
    dispatch_once(&qword_100977A58, &stru_100919880);
  if (!*((_BYTE *)off_100977A50 + 60))
  {
    v27 = CBErrorF(4294896144, "Bluetooth powered off");
    v28 = objc_claimAutoreleasedReturnValue(v27);
    v9 = v45[5];
    v45[5] = (id)v28;
    goto LABEL_40;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "peerDevice"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));

  if (!v9)
  {
    v29 = CBErrorF(4294960588, "No device ID");
    v30 = objc_claimAutoreleasedReturnValue(v29);
LABEL_44:
    v32 = v45[5];
    v45[5] = (id)v30;

    goto LABEL_40;
  }
  v10 = objc_msgSend(v6, "serviceFlags");
  if (!v10)
  {
    v31 = CBErrorF(4294960591, "No service flags");
    v30 = objc_claimAutoreleasedReturnValue(v31);
    goto LABEL_44;
  }
  v11 = v45;
  obj = v45[5];
  v12 = -[CBStackControllerBTStack _btDeviceWithID:error:](self, "_btDeviceWithID:error:", v9, &obj);
  objc_storeStrong(v11 + 5, obj);
  if (v12)
  {
    v13 = objc_msgSend(v6, "connectionFlags");
    v14 = v13;
    v15 = (v13 >> 2) & 1;
    sub_10044E080((uint64_t)v12, (v13 & 4) != 0);
    if (qword_100977A88 != -1)
      dispatch_once(&qword_100977A88, &stru_100919980);
    sub_1002A1AA4((uint64_t)off_100977A80, (uint64_t)v12, v15);
    if ((v14 & 1) != 0)
      sub_10044E03C((uint64_t)v12, 1);
    if ((v14 & 8) != 0)
    {
      if (qword_100977A88 != -1)
        dispatch_once(&qword_100977A88, &stru_100919980);
      sub_10027F960((uint64_t)off_100977A80, (uint64_t)v12, 1);
    }
    if ((v14 & 0x10) != 0)
    {
      sub_100091AE8(&__str, "");
      v12[1427] = 1;
      std::string::operator=((std::string *)(v12 + 1472), &__str);
      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__str.__r_.__value_.__l.__data_);
    }
    memset(&__str, 0, sizeof(__str));
    sub_100091AE8(&__str, "Unknown");
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "clientBundleID"));
    v17 = objc_msgSend(v16, "length");

    if (v17)
    {
      v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "clientBundleID")));
      sub_100091AE8(&v38, (char *)objc_msgSend(v18, "UTF8String"));
      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__str.__r_.__value_.__l.__data_);
      __str = v38;
      *((_BYTE *)&v38.__r_.__value_.__s + 23) = 0;
      v38.__r_.__value_.__s.__data_[0] = 0;

    }
    if ((v14 & 0x400) != 0 && sub_100442118((uint64_t)v12, 21))
      sub_10045446C((uint64_t)v12, 0);
    if (qword_100977A78 != -1)
      dispatch_once(&qword_100977A78, &stru_1009198C0);
    v19 = sub_100495A98((int64x2_t *)off_100977A70, (uint64_t)v12, v10, &__str, 2);
    if (v19 && (v20 = (v19 + 310000), (_DWORD)v20))
    {
      v33 = CBErrorF(v20, "connectServices failed %@", v9);
      v34 = objc_claimAutoreleasedReturnValue(v33);
      v21 = (CBStackConnectDeviceRequest *)v45[5];
      v45[5] = (id)v34;
    }
    else
    {
      v21 = objc_alloc_init(CBStackConnectDeviceRequest);
      -[CBStackConnectDeviceRequest setCompletionHandler:](v21, "setCompletionHandler:", v7);
      -[CBStackConnectDeviceRequest setConnection:](v21, "setConnection:", v6);
      -[CBStackConnectDeviceRequest setStartTicks:](v21, "setStartTicks:", mach_absolute_time());
      v22 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
      -[CBStackConnectDeviceRequest setTimer:](v21, "setTimer:", v22);
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_1000CD2A8;
      handler[3] = &unk_100919488;
      handler[4] = v22;
      handler[5] = v21;
      handler[6] = self;
      dispatch_source_set_event_handler(v22, handler);
      objc_msgSend(v6, "connectTimeoutSeconds");
      if (v23 <= 0.0)
        v23 = 10.0;
      CUDispatchTimerSet(v22, v23, -1.0, 1.0);
      dispatch_activate(v22);
      connectDeviceRequests = self->_connectDeviceRequests;
      if (!connectDeviceRequests)
      {
        v25 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
        v26 = self->_connectDeviceRequests;
        self->_connectDeviceRequests = v25;

        connectDeviceRequests = self->_connectDeviceRequests;
      }
      -[NSMutableSet addObject:](connectDeviceRequests, "addObject:", v21);

    }
    if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__str.__r_.__value_.__l.__data_);
  }
LABEL_40:

  ((void (*)(_QWORD *))v36[2])(v36);
  _Block_object_dispose(&v44, 8);

}

- (void)_connectDeviceCompleteRequest:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = a3;
  v6 = a4;
  if (dword_100978048 <= 30 && (dword_100978048 != -1 || _LogCategory_Initialize(&dword_100978048, 30)))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "connection"));
    v8 = CUPrintNSError(v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = mach_absolute_time();
    v11 = UpTicksToMilliseconds(v10 - (_QWORD)objc_msgSend(v16, "startTicks"));
    LogPrintF_safe(&dword_100978048, "-[CBStackControllerBTStack _connectDeviceCompleteRequest:error:]", 30, "ConnectDevice completed: %@, %@, %llu ms", v7, v9, v11);

  }
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "timer"));
  v13 = v16;
  if (v12)
  {
    dispatch_source_cancel(v12);
    objc_msgSend(v16, "setTimer:", 0);
    v13 = v16;
  }
  v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "completionHandler"));
  v15 = (void *)v14;
  if (v14)
  {
    (*(void (**)(uint64_t, id))(v14 + 16))(v14, v6);
    objc_msgSend(v16, "setCompletionHandler:", 0);
  }
  -[NSMutableSet removeObject:](self->_connectDeviceRequests, "removeObject:", v16);

}

- (void)_connectDeviceUpdateRequests:(id)a3 btResult:(int)a4
{
  id v6;
  id v7;
  uint64_t v8;
  int v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  CBStackControllerBTStack *v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v6 = a3;
  if (self->_addedController)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v19 = self;
    obj = (id)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](self->_connectDeviceRequests, "allObjects"));
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v22;
      v9 = a4 + 310000;
      if (a4 == -310000)
        v9 = -6700;
      v18 = v9;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v22 != v8)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "connection"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "peerDevice"));
          if ((objc_msgSend(v13, "isEquivalentToCBDevice:compareFlags:", v6, 8) & 1) != 0)
          {
            if (a4)
            {
              v14 = CBErrorF(v18, "Connect failed");
              v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
              -[CBStackControllerBTStack _connectDeviceCompleteRequest:error:](v19, "_connectDeviceCompleteRequest:error:", v11, v15);

            }
            else
            {
              v16 = objc_msgSend(v12, "serviceFlags");
              v17 = objc_msgSend(v6, "supportedServices");
              if ((v17 & v16 & ~objc_msgSend(v6, "connectedServices")) == 0)
                -[CBStackControllerBTStack _connectDeviceCompleteRequest:error:](v19, "_connectDeviceCompleteRequest:error:", v11, 0);
            }
          }

        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v7);
    }

  }
}

- (id)diagnosticControl:(id)a3
{
  id v4;
  const char *string;
  const char *v6;
  uint64_t v7;
  __CFString *v8;
  uint64_t v9;
  void *v10;
  unsigned __int8 Int64Ranged;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  char *v19;
  int *v20;
  uint64_t v21;
  os_log_t v22;
  os_log_t v23;
  os_log_t v24;
  void *v25;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v28;
  void *v29;
  int v30;
  int v31;
  void *v32;
  CFTypeID v33;
  uint64_t v34;
  void *v35;
  int v36;
  uint64_t v37;
  CFTypeID v38;
  uint64_t v39;
  void *v40;
  _QWORD *v41;
  id result;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  int *v46;
  uint64_t v47;
  os_log_t v48;
  os_log_t v49;
  void *v50[2];
  char v51;
  unsigned int v52;
  unsigned __int16 v53;
  __int128 v54;
  id v55;
  id v56;

  v4 = a3;
  string = xpc_dictionary_get_string(v4, "iStr");
  if (string)
    v6 = string;
  else
    v6 = "";
  if (!strcasecmp(v6, "aop-read-debug"))
  {
    v9 = CUXPCCreateCFObjectFromXPCObject(v4);
    v10 = (void *)v9;
    if (v9)
    {
      Int64Ranged = CFDictionaryGetInt64Ranged(v9, CFSTR("type"), 0, 255, 0);
      if (qword_100977FD0 != -1)
        dispatch_once(&qword_100977FD0, &stru_1009199A0);
      v56 = 0;
      v12 = sub_1003A0488(qword_100977FC8, Int64Ranged, &v56);
      v13 = v56;
      if ((_DWORD)v12)
      {
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("### AOPInterfaceManager::getInstance()->getReport() BTResult %d"), v12));
      }
      else
      {
        v55 = 0;
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v13, 0, &v55));
        v16 = v55;
        v17 = v16;
        if (v16)
        {
          v8 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "description"));
        }
        else
        {
          v8 = (__CFString *)objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v15, 4);
          if (dword_100978048 <= 30
            && (dword_100978048 != -1 || _LogCategory_Initialize(&dword_100978048, 30)))
          {
            LogPrintF_safe(&dword_100978048, "-[CBStackControllerBTStack diagnosticControl:]", 30, "Diags: descriptorString %@", v8);
          }
        }

      }
    }
    else
    {
      v8 = CFSTR("### Convert params failed");
    }

    goto LABEL_75;
  }
  if (!strcasecmp(v6, "aop-write-debug"))
  {
    v14 = (void *)CUXPCCreateCFObjectFromXPCObject(v4);
    if (v14)
    {
      if (qword_100977FD0 != -1)
        dispatch_once(&qword_100977FD0, &stru_1009199A0);
      sub_10039F8C0(qword_100977FC8, v14);
      v8 = &stru_100941758;
    }
    else
    {
      v8 = CFSTR("### Convert params failed");
    }

    goto LABEL_75;
  }
  if (!strcasecmp(v6, "coredump"))
  {
    if (dword_100978048 <= 30
      && (dword_100978048 != -1 || _LogCategory_Initialize(&dword_100978048, 30)))
    {
      LogPrintF_safe(&dword_100978048, "-[CBStackControllerBTStack diagnosticControl:]", 30, "Diag: CoreDump");
    }
    if (qword_100977A58 != -1)
      dispatch_once(&qword_100977A58, &stru_100919880);
    v32 = off_100977A50;
    sub_100091AE8(&v54, "");
    sub_1004A37B0((uint64_t)v32, 3703, &v54);
  }
  if (!strcasecmp(v6, "crash-FE"))
  {
    LOBYTE(v52) = 0;
    sub_100043758(&v52);
    result = (id)sub_100112D60(4004);
  }
  else
  {
    if (!strcasecmp(v6, "crash-RC"))
    {
      LOBYTE(v52) = 0;
      sub_100043758(&v52);
      sub_1001131F8(4058, "Test Context");
    }
    if (!strcasecmp(v6, "crash-sim"))
    {
      v18 = _os_log_pack_size(12);
      v19 = (char *)v50 - ((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0);
      v20 = __error();
      v21 = _os_log_pack_fill(v19, v18, *v20, &_mh_execute_header, "Diag crash simulated: '%s'", (const char *)v50[0]);
      *(_DWORD *)v21 = 136315138;
      *(_QWORD *)(v21 + 4) = v6;
      v22 = os_log_create("com.apple.bluetooth", "CBCrash");
      v23 = v22;
      if (v22)
        v24 = v22;
      else
        v24 = (os_log_t)&_os_log_default;
      qword_10097BA60 = os_log_pack_send_and_compose(v19, v24, 16, 0, 0);
      os_fault_with_payload(18, 2, v19, v18, qword_10097BA60, 0);

      goto LABEL_58;
    }
    if (strcasecmp(v6, "crash"))
    {
      if (!stricmp_prefix(v6, "fakeAccessoryCrash"))
      {
        v53 = 0;
        v52 = 0;
        if (stricmp_prefix(v6, "fakeAccessoryCrash-"))
        {
          RandomBytes(&v52, 6);
        }
        else if (TextToHardwareAddress(v6 + 19, -1, 6, &v52))
        {
          v8 = CFSTR("Bad Bluetooth address");
          goto LABEL_75;
        }
        v37 = sub_100069D20();
        (*(void (**)(uint64_t, unint64_t, uint64_t, const __CFString *, const __CFString *))(*(_QWORD *)v37 + 144))(v37, v52 | ((unint64_t)v53 << 32), 8206, CFSTR("Fake Accessory"), CFSTR("Fake Version"));
        goto LABEL_58;
      }
      if (!strcasecmp(v6, "gapa"))
      {
        v25 = (void *)CUXPCCreateCFObjectFromXPCObject(v4);
        if (v25)
        {
          TypeID = CFStringGetTypeID();
          TypedValue = CFDictionaryGetTypedValue(v25, CFSTR("deviceID"), TypeID, 0);
          v28 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
          if (v28)
          {
            v29 = -[CBStackControllerBTStack _btDeviceWithID:error:](self, "_btDeviceWithID:error:", v28, 0);
            if (v29)
            {
              v30 = CFDictionaryGetInt64Ranged(v25, CFSTR("flags"), 0, 0xFFFFFFFFLL, 0);
              v31 = CFDictionaryGetInt64Ranged(v25, CFSTR("mask"), 0, 0xFFFFFFFFLL, 0);
              sub_100447CA8((uint64_t)v29, v30, v31);
LABEL_68:
              v8 = &stru_100941758;
LABEL_69:

LABEL_70:
              goto LABEL_75;
            }
LABEL_82:
            v8 = CFSTR("### Device not found");
            goto LABEL_69;
          }
LABEL_81:
          v8 = CFSTR("### No device ID");
          goto LABEL_69;
        }
      }
      else if (!strcasecmp(v6, "mp-error"))
      {
        v25 = (void *)CUXPCCreateCFObjectFromXPCObject(v4);
        if (v25)
        {
          v33 = CFStringGetTypeID();
          v34 = CFDictionaryGetTypedValue(v25, CFSTR("deviceID"), v33, 0);
          v28 = (void *)objc_claimAutoreleasedReturnValue(v34);
          if (v28)
          {
            v35 = -[CBStackControllerBTStack _btDeviceWithID:error:](self, "_btDeviceWithID:error:", v28, 0);
            if (v35)
            {
              v36 = CFDictionaryGetInt64Ranged(v25, CFSTR("status"), 0, 255, 0);
              if ((v36 - 8) < 0xFFFFFFF9)
              {
                v8 = CFSTR("### Invalid status");
                goto LABEL_69;
              }
              if (qword_100977A68 != -1)
                dispatch_once(&qword_100977A68, &stru_1009199C0);
              sub_100461188((uint64_t)off_100977A60, (uint64_t)v35, v36);
              goto LABEL_68;
            }
            goto LABEL_82;
          }
          goto LABEL_81;
        }
      }
      else
      {
        if (strcasecmp(v6, "mp-keys-reset"))
        {
          if (stricmp_prefix(v6, "writeStackshot"))
          {
            v7 = NSPrintF_safe("### Unsupported command: '%s'\n", v6);
            v8 = (__CFString *)objc_claimAutoreleasedReturnValue(v7);
LABEL_75:

            return v8;
          }
          v43 = sub_100027F68();
          sub_100091AE8(v50, "btutil manual stackshot");
          sub_100576534(v43, (uint64_t *)v50, 3172327085);
          if (v51 < 0)
            operator delete(v50[0]);
LABEL_58:
          v8 = &stru_100941758;
          goto LABEL_75;
        }
        v25 = (void *)CUXPCCreateCFObjectFromXPCObject(v4);
        if (v25)
        {
          v38 = CFStringGetTypeID();
          v39 = CFDictionaryGetTypedValue(v25, CFSTR("deviceID"), v38, 0);
          v28 = (void *)objc_claimAutoreleasedReturnValue(v39);
          if (v28)
          {
            v40 = -[CBStackControllerBTStack _btDeviceWithID:error:](self, "_btDeviceWithID:error:", v28, 0);
            if (v40)
            {
              if (qword_100977A68 != -1)
                dispatch_once(&qword_100977A68, &stru_1009199C0);
              v41 = sub_10045E8B4((uint64_t)off_100977A60, (uint64_t)v40);
              if (!v41)
              {
                v8 = CFSTR("### Magic Paired Device not found");
                goto LABEL_69;
              }
              if (qword_100977A68 != -1)
                dispatch_once(&qword_100977A68, &stru_1009199C0);
              sub_100460584((uint64_t)off_100977A60, (uint64_t)v41);
              goto LABEL_68;
            }
            goto LABEL_82;
          }
          goto LABEL_81;
        }
      }
      v8 = CFSTR("### Convert params failed");
      goto LABEL_70;
    }
    v44 = _os_log_pack_size(12);
    v45 = (char *)v50 - ((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0);
    v46 = __error();
    v47 = _os_log_pack_fill(v45, v44, *v46, &_mh_execute_header, "Diag crash: '%s'", (const char *)v50[0]);
    *(_DWORD *)v47 = 136315138;
    *(_QWORD *)(v47 + 4) = v6;
    v48 = os_log_create("com.apple.bluetooth", "CBCrash");
    if (v48)
      v49 = v48;
    else
      v49 = (os_log_t)&_os_log_default;
    qword_10097BA60 = os_log_pack_send_and_compose(v45, v49, 16, 0, 0);
    result = (id)abort_with_payload(18, 2, v45, v44, qword_10097BA60, 0);
  }
  __break(1u);
  return result;
}

- (BOOL)disconnectDevice:(id)a3 serviceFlags:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  void *v10;
  BOOL v11;
  uint64_t v13;
  uint64_t v14;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  if (qword_100977A58 != -1)
    dispatch_once(&qword_100977A58, &stru_100919880);
  if (*((_BYTE *)off_100977A50 + 60))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
    v10 = v9;
    if (v9)
    {
      if (objc_msgSend(v9, "caseInsensitiveCompare:", CFSTR("all")))
      {
        v11 = -[CBStackControllerBTStack _disconnectDevice:serviceFlags:error:](self, "_disconnectDevice:serviceFlags:error:", v8, v6, a5);
      }
      else
      {
        -[CBStackControllerBTStack _disconnectAllDevicesWithServiceFlags:](self, "_disconnectAllDevicesWithServiceFlags:", v6);
        v11 = 1;
      }
    }
    else if (a5)
    {
      v14 = CBErrorF(4294960588, "No device identifier");
      v11 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue(v14);
    }
    else
    {
      v11 = 0;
    }

  }
  else if (a5)
  {
    v13 = CBErrorF(4294896144, "Bluetooth powered off");
    v11 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue(v13);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_disconnectAllDevicesWithServiceFlags:(unsigned int)a3
{
  int v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;
  void *v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  int v14;
  void **v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void **v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  void *__p;
  uint64_t *v36;
  uint64_t v37;
  _BYTE v38[128];
  void *v39[2];
  char v40;

  if (dword_100978048 <= 30 && (dword_100978048 != -1 || _LogCategory_Initialize(&dword_100978048, 30)))
    LogPrintF_safe(&dword_100978048, "-[CBStackControllerBTStack _disconnectAllDevicesWithServiceFlags:]", 30, "Disconnected all devices");
  __p = 0;
  v36 = 0;
  v37 = 0;
  if (qword_100977898 != -1)
    dispatch_once(&qword_100977898, &stru_1009198E0);
  v4 = sub_10006D830((uint64_t)off_100977890, &__p);
  v5 = (v4 + 310000);
  if (v4)
    v6 = (_DWORD)v5 == 0;
  else
    v6 = 1;
  if (!v6
    && dword_100978048 <= 90
    && (dword_100978048 != -1 || _LogCategory_Initialize(&dword_100978048, 90)))
  {
    v7 = CUPrintErrorCode(v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    LogPrintF_safe(&dword_100978048, "-[CBStackControllerBTStack _disconnectAllDevicesWithServiceFlags:]", 90, "### GetConnectedDevices failed: %@", v8);

  }
  v9 = (uint64_t *)__p;
  v10 = v36;
  if (__p != v36)
  {
    do
    {
      v11 = *v9;
      if (qword_100977A78 != -1)
        dispatch_once(&qword_100977A78, &stru_1009198C0);
      v12 = sub_100499FC8((uint64_t)off_100977A70, v11, a3);
      if (v12)
        v13 = (v12 + 310000);
      else
        v13 = 0;
      if (dword_100978048 < 31
        && (dword_100978048 != -1 || _LogCategory_Initialize(&dword_100978048, 30)))
      {
        sub_10043E5F8(v11, v39);
        v14 = v40;
        v15 = (void **)v39[0];
        v16 = CUPrintErrorCode(v13);
        v17 = objc_claimAutoreleasedReturnValue(v16);
        v18 = (void *)v17;
        v19 = v39;
        if (v14 < 0)
          v19 = v15;
        LogPrintF_safe(&dword_100978048, "-[CBStackControllerBTStack _disconnectAllDevicesWithServiceFlags:]", 30, "Disconnect: classic, %s, %@", v19, v17);

        if (v40 < 0)
          operator delete(v39[0]);
      }
      ++v9;
    }
    while (v9 != v10);
  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  if (qword_1009778A8 != -1)
    dispatch_once(&qword_1009778A8, &stru_1009199E0);
  v20 = sub_100069E14((uint64_t)off_1009778A0);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v32;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v32 != v23)
          objc_enumerationMutation(v21);
        v25 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)v24);
        if (qword_1009778A8 != -1)
          dispatch_once(&qword_1009778A8, &stru_1009199E0);
        v26 = off_1009778A0;
        sub_100030BCC(v39, v25);
        v27 = sub_100622358((uint64_t)v26, (unsigned __int8 *)v39, 2u);
        if (v27)
          v28 = (v27 + 310000);
        else
          v28 = 0;
        if (dword_100978048 < 31
          && (dword_100978048 != -1 || _LogCategory_Initialize(&dword_100978048, 30)))
        {
          v29 = CUPrintErrorCode(v28);
          v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
          LogPrintF_safe(&dword_100978048, "-[CBStackControllerBTStack _disconnectAllDevicesWithServiceFlags:]", 30, "Disconnect: BLE, %@, %@", v25, v30, (_QWORD)v31);

        }
        v24 = (char *)v24 + 1;
      }
      while (v22 != v24);
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
    }
    while (v22);
  }

  if (__p)
  {
    v36 = (uint64_t *)__p;
    operator delete(__p);
  }
}

- (BOOL)_disconnectDevice:(id)a3 serviceFlags:(unsigned int)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  char v24;
  int v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  char v31;
  id v32;
  char v33;
  uint64_t v35;
  unsigned __int8 v36[16];

  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
  if (v9)
  {
    v10 = -[CBStackControllerBTStack _btDeviceWithID:error:](self, "_btDeviceWithID:error:", v9, 0);
    v11 = (uint64_t)v10;
    if (v10 && sub_10043FC5C((uint64_t)v10))
    {
      if (qword_100977A78 != -1)
        dispatch_once(&qword_100977A78, &stru_1009198C0);
      v12 = sub_100499FC8((uint64_t)off_100977A70, v11, a4);
      if (v12)
        v13 = (v12 + 310000);
      else
        v13 = 0;
      if (dword_100978048 < 31
        && (dword_100978048 != -1 || _LogCategory_Initialize(&dword_100978048, 30)))
      {
        v14 = CUPrintErrorCode(v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        LogPrintF_safe(&dword_100978048, "-[CBStackControllerBTStack _disconnectDevice:serviceFlags:error:]", 30, "Disconnect: classic, %@, %@", v8, v15);

      }
      v16 = 1;
    }
    else
    {
      v16 = 0;
      v13 = 1;
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CBStackControllerBTStack _btUUIDWithID:error:](self, "_btUUIDWithID:error:", v9, 0));
    if (v17)
    {
      if (qword_1009778A8 != -1)
        dispatch_once(&qword_1009778A8, &stru_1009199E0);
      v18 = off_1009778A0;
      sub_100030BCC(v36, v17);
      if (sub_100069F08((uint64_t)v18, v36))
      {
        if (qword_1009778A8 != -1)
          dispatch_once(&qword_1009778A8, &stru_1009199E0);
        v19 = off_1009778A0;
        sub_100030BCC(v36, v17);
        v20 = sub_100622358((uint64_t)v19, v36, 2u);
        if (v20)
          v21 = (v20 + 310000);
        else
          v21 = 0;
        if (dword_100978048 < 31
          && (dword_100978048 != -1 || _LogCategory_Initialize(&dword_100978048, 30)))
        {
          v22 = CUPrintErrorCode(v21);
          v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
          LogPrintF_safe(&dword_100978048, "-[CBStackControllerBTStack _disconnectDevice:serviceFlags:error:]", 30, "Disconnect: BLE, %@, %@", v8, v23);

        }
        v25 = 1;
        goto LABEL_44;
      }
    }
    if (v11)
      v24 = v16;
    else
      v24 = 1;
    if ((v24 & 1) != 0)
    {
      if ((v16 & 1) != 0)
      {
        v25 = 0;
        v21 = 1;
LABEL_44:
        if ((_DWORD)v13)
          v31 = v16;
        else
          v31 = 0;
        if ((v31 & 1) != 0)
        {
          v30 = CBErrorF(v13, "Disconnect failed, classic");
          goto LABEL_53;
        }
        if (!(_DWORD)v21)
          v25 = 0;
        if (v25 == 1)
        {
          v30 = CBErrorF(v21, "Disconnect failed, BLE");
          goto LABEL_53;
        }
        LOBYTE(v27) = 0;
LABEL_57:
        v32 = 0;
LABEL_58:

        v33 = v27 ^ 1;
        goto LABEL_59;
      }
    }
    else
    {
      v36[0] = 0;
      sub_100043758(v36);
      v26 = sub_10018070C(v11 + 128);
      sub_10004339C(v36);
      if (v26)
        v27 = (v26 + 330000);
      else
        v27 = 0;
      if (dword_100978048 < 31
        && (dword_100978048 != -1 || _LogCategory_Initialize(&dword_100978048, 30)))
      {
        v28 = CUPrintErrorCode(v27);
        v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
        LogPrintF_safe(&dword_100978048, "-[CBStackControllerBTStack _disconnectDevice:serviceFlags:error:]", 30, "Disconnect: HCI, %@, %@", v8, v29);

      }
      sub_100043728(v36);
      if (!(_DWORD)v27)
        goto LABEL_57;
    }
    v30 = CBErrorF(4294960569, "Not connected");
LABEL_53:
    v32 = (id)objc_claimAutoreleasedReturnValue(v30);
    LOBYTE(v27) = v32 != 0;
    if (a5 && v32)
    {
      v32 = objc_retainAutorelease(v32);
      *a5 = v32;
      LOBYTE(v27) = 1;
    }
    goto LABEL_58;
  }
  if (a5)
  {
    v35 = CBErrorF(4294960588, "No device identifier");
    v33 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue(v35);
  }
  else
  {
    v33 = 0;
  }
LABEL_59:

  return v33;
}

- (BOOL)deleteDevice:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  uint64_t v11;
  uint64_t v12;

  v6 = a3;
  if (qword_100977A58 != -1)
    dispatch_once(&qword_100977A58, &stru_100919880);
  if (*((_BYTE *)off_100977A50 + 60))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
    v8 = v7;
    if (v7)
    {
      if (objc_msgSend(v7, "caseInsensitiveCompare:", CFSTR("all")))
      {
        v9 = -[CBStackControllerBTStack _deleteDevice:error:](self, "_deleteDevice:error:", v6, a4);
      }
      else
      {
        -[CBStackControllerBTStack _deleteAllDevices](self, "_deleteAllDevices");
        v9 = 1;
      }
    }
    else if (a4)
    {
      v12 = CBErrorF(4294960588, "No device identifier");
      v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue(v12);
    }
    else
    {
      v9 = 0;
    }

  }
  else if (a4)
  {
    v11 = CBErrorF(4294896144, "Bluetooth off");
    v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue(v11);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_deleteAllDevices
{
  int v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  void *v6;
  unsigned __int8 **v7;
  unsigned __int8 **v8;
  unsigned __int8 *v9;
  int v10;
  uint64_t v11;
  int v12;
  void **v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void **p_p;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id obj;
  _QWORD v25[5];
  _QWORD v26[5];
  void *__p;
  void **v28;
  uint64_t v29;
  char v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  void *v35;
  unsigned __int8 **v36;
  uint64_t v37;
  _BYTE v38[128];

  if (dword_100978048 <= 30 && (dword_100978048 != -1 || _LogCategory_Initialize(&dword_100978048, 30)))
    LogPrintF_safe(&dword_100978048, "-[CBStackControllerBTStack _deleteAllDevices]", 30, "Delete all paired devices");
  v35 = 0;
  v36 = 0;
  v37 = 0;
  if (qword_100977898 != -1)
    dispatch_once(&qword_100977898, &stru_1009198E0);
  v2 = sub_10006D888((uint64_t)off_100977890, (uint64_t **)&v35);
  v3 = (v2 + 310000);
  if (v2)
    v4 = (_DWORD)v3 == 0;
  else
    v4 = 1;
  if (!v4
    && dword_100978048 <= 90
    && (dword_100978048 != -1 || _LogCategory_Initialize(&dword_100978048, 90)))
  {
    v5 = CUPrintErrorCode(v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    LogPrintF_safe(&dword_100978048, "-[CBStackControllerBTStack _deleteAllDevices]", 90, "### GetPairedDevices failed: %@", v6);

  }
  v7 = (unsigned __int8 **)v35;
  v8 = v36;
  if (v35 != v36)
  {
    do
    {
      v9 = *v7;
      if (qword_100978150 != -1)
        dispatch_once(&qword_100978150, &stru_100919A00);
      v10 = sub_1005B8744((uint64_t)off_100978148, v9);
      if (v10)
        v11 = (v10 + 310000);
      else
        v11 = 0;
      if (dword_100978048 < 31
        && (dword_100978048 != -1 || _LogCategory_Initialize(&dword_100978048, 30)))
      {
        sub_10043E5F8((uint64_t)v9, &__p);
        v12 = SHIBYTE(v29);
        v13 = (void **)__p;
        v14 = CUPrintErrorCode(v11);
        v15 = objc_claimAutoreleasedReturnValue(v14);
        v16 = (void *)v15;
        p_p = &__p;
        if (v12 < 0)
          p_p = v13;
        LogPrintF_safe(&dword_100978048, "-[CBStackControllerBTStack _deleteAllDevices]", 30, "Delete pairing: classic, %s, %@", p_p, v15);

        if (SHIBYTE(v29) < 0)
          operator delete(__p);
      }
      ++v7;
    }
    while (v7 != v8);
  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  if (qword_1009778B8 != -1)
    dispatch_once(&qword_1009778B8, &stru_100919A20);
  v18 = sub_10006A768(qword_1009778B0);
  obj = (id)objc_claimAutoreleasedReturnValue(v18);
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v32;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v32 != v20)
          objc_enumerationMutation(obj);
        v22 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)v21);
        __p = 0;
        v28 = &__p;
        v29 = 0x2020000000;
        v30 = 0;
        if (qword_1009778C8 != -1)
          dispatch_once(&qword_1009778C8, &stru_100919940);
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472;
        v26[2] = sub_1000CF23C;
        v26[3] = &unk_100917358;
        v26[4] = &__p;
        if (sub_10065E6EC((uint64_t)off_1009778C0, v22, v26) && !*((_BYTE *)v28 + 24))
        {
          if (dword_100978048 <= 30
            && (dword_100978048 != -1 || _LogCategory_Initialize(&dword_100978048, 30)))
          {
            LogPrintF_safe(&dword_100978048, "-[CBStackControllerBTStack _deleteAllDevices]", 30, "Delete pairing: BLE, %@", v22);
          }
          v23 = sub_1000419F4();
          v25[0] = _NSConcreteStackBlock;
          v25[1] = 3221225472;
          v25[2] = sub_1000CF2CC;
          v25[3] = &unk_1009172A0;
          v25[4] = v22;
          sub_100041A34(v23, v25);
        }
        _Block_object_dispose(&__p, 8);
        v21 = (char *)v21 + 1;
      }
      while (v19 != v21);
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
    }
    while (v19);
  }

  if (v35)
  {
    v36 = (unsigned __int8 **)v35;
    operator delete(v35);
  }
}

- (BOOL)_deleteDevice:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  unsigned __int8 *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  id v18;
  BOOL v19;
  BOOL v20;
  uint64_t v22;
  _QWORD v23[5];

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  if (v7)
  {
    v8 = -[CBStackControllerBTStack _btDeviceWithID:error:](self, "_btDeviceWithID:error:", v7, 0);
    if (!v8)
      goto LABEL_14;
    if (qword_100978150 != -1)
      dispatch_once(&qword_100978150, &stru_100919A00);
    if (sub_1005B86F4((uint64_t)off_100978148, v8))
    {
      if (qword_100978150 != -1)
        dispatch_once(&qword_100978150, &stru_100919A00);
      v9 = sub_1005B8744((uint64_t)off_100978148, v8);
      if (v9)
        v10 = (v9 + 310000);
      else
        v10 = 0;
      if (dword_100978048 < 31
        && (dword_100978048 != -1 || _LogCategory_Initialize(&dword_100978048, 30)))
      {
        v11 = CUPrintErrorCode(v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        LogPrintF_safe(&dword_100978048, "-[CBStackControllerBTStack _deleteDevice:error:]", 30, "Delete pairing: classic, %@, %@", v6, v12);

      }
      v13 = 1;
    }
    else
    {
LABEL_14:
      v13 = 0;
      v10 = 1;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CBStackControllerBTStack _btUUIDWithID:error:](self, "_btUUIDWithID:error:", v7, 0));
    if (!v14)
      goto LABEL_24;
    if (qword_1009778B8 != -1)
      dispatch_once(&qword_1009778B8, &stru_100919A20);
    if (sub_100030864(qword_1009778B0, v14))
    {
      if (dword_100978048 <= 30
        && (dword_100978048 != -1 || _LogCategory_Initialize(&dword_100978048, 30)))
      {
        LogPrintF_safe(&dword_100978048, "-[CBStackControllerBTStack _deleteDevice:error:]", 30, "Delete pairing: BLE, %@", v6);
      }
      v16 = sub_1000419F4();
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_1000CF654;
      v23[3] = &unk_1009172A0;
      v23[4] = v14;
      sub_100041A34(v16, v23);
    }
    else
    {
LABEL_24:
      if ((v13 & 1) == 0)
      {
        v15 = CBErrorF(4294960569, "Not paired");
        goto LABEL_33;
      }
    }
    if ((_DWORD)v10)
      v17 = v13;
    else
      v17 = 0;
    if (v17 != 1)
    {
      v19 = 0;
      v18 = 0;
LABEL_37:
      v20 = !v19;

      goto LABEL_38;
    }
    v15 = CBErrorF(v10, "Delete pairing failed");
LABEL_33:
    v18 = (id)objc_claimAutoreleasedReturnValue(v15);
    v19 = v18 != 0;
    if (a4 && v18)
    {
      v18 = objc_retainAutorelease(v18);
      *a4 = v18;
      v19 = 1;
    }
    goto LABEL_37;
  }
  if (a4)
  {
    v22 = CBErrorF(4294960588, "No device identifier");
    v20 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue(v22);
  }
  else
  {
    v20 = 0;
  }
LABEL_38:

  return v20;
}

- (id)getDevicesWithFlags:(unsigned int)a3 error:(id *)a4
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  id v24;
  id v25;
  id v26;
  id v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t *v32;
  uint64_t *i;
  uint64_t v34;
  id v35;
  void *v36;
  _BOOL4 v37;
  id v38;
  void *v39;
  __n128 *p_p;
  void *v41;
  uint64_t v42;
  id v43;
  _QWORD *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  id v60;
  id obj;
  uint64_t v62;
  char v63;
  uint64_t v64;
  uint64_t v65;
  int v66;
  __int16 v67;
  _QWORD v68[6];
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __n128 *v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[32];
  int v78;
  __n128 __p;
  uint64_t v80;
  uint64_t (*v81)(uint64_t, uint64_t);
  void (*v82)(uint64_t);
  id v83;
  uint64_t v84;
  uint64_t *v85;
  uint64_t v86;
  uint64_t v87;
  _BYTE v88[128];

  v63 = a3;
  v60 = objc_alloc_init((Class)NSMutableArray);
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  if (qword_1009778B8 != -1)
    dispatch_once(&qword_1009778B8, &stru_100919A20);
  v4 = sub_10006A768(qword_1009778B0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  obj = v5;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v69, v88, 16);
  if (v6)
  {
    v62 = *(_QWORD *)v70;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v70 != v62)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * (_QWORD)v7);
        v84 = 0;
        v85 = &v84;
        v86 = 0x2020000000;
        v87 = 0;
        __p.n128_u64[0] = 0;
        __p.n128_u64[1] = (unint64_t)&__p;
        v80 = 0x3032000000;
        v81 = sub_10006250C;
        v82 = sub_100062340;
        v83 = 0;
        if (qword_1009778C8 != -1)
          dispatch_once(&qword_1009778C8, &stru_100919940);
        v68[0] = _NSConcreteStackBlock;
        v68[1] = 3221225472;
        v68[2] = sub_1000D01FC;
        v68[3] = &unk_1009194B0;
        v68[4] = &v84;
        v68[5] = &__p;
        if (sub_10065E6EC((uint64_t)off_1009778C0, v8, v68))
        {
          v9 = objc_alloc_init((Class)CBDevice);
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUIDString"));
          objc_msgSend(v9, "setIdentifier:", v10);

          objc_msgSend(v9, "setName:", *(_QWORD *)(__p.n128_u64[1] + 40));
          v11 = v85[3];
          LOBYTE(v73) = BYTE5(v11);
          BYTE1(v73) = BYTE4(v11);
          BYTE2(v73) = BYTE3(v11);
          BYTE3(v73) = BYTE2(v11);
          BYTE4(v73) = BYTE1(v11);
          BYTE5(v73) = v11;
          v12 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &v73, 6);
          objc_msgSend(v9, "setBtAddressData:", v12);

          if ((v63 & 2) != 0)
          {
            if (qword_1009778C8 != -1)
              dispatch_once(&qword_1009778C8, &stru_100919940);
            v13 = off_1009778C0;
            v14 = sub_100660C64((uint64_t)off_1009778C0, v8);
            v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
            if (objc_msgSend(v15, "length"))
            {
              v16 = sub_100660768((uint64_t)v13, v15);
              v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
              if (v17)
              {
                if (sub_100660D1C((uint64_t)v13, v17) == 2)
                {
                  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "UUIDString"));
                  objc_msgSend(v9, "setFindMyCaseIdentifier:", v18);

                }
                v19 = sub_100660B4C((uint64_t)v13, v17);
                v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
                v21 = v20;
                if (v20)
                {
                  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "UUIDString"));
                  objc_msgSend(v9, "setFindMyGroupIdentifier:", v22);

                }
              }

            }
          }
          if ((v63 & 1) != 0)
          {
            v78 = 0;
            memset(v77, 0, sizeof(v77));
            v75 = 0u;
            v76 = 0u;
            v74 = 0u;
            if (qword_1009778B8 != -1)
              dispatch_once(&qword_1009778B8, &stru_100919A20);
            sub_10069CDD4(qword_1009778B0, v8, (uint64_t)&v74);
            v23 = v78;
            if ((v78 & 0x40) != 0)
            {
              v24 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &v77[8], 16);
              objc_msgSend(v9, "setIrkData:", v24);

              v23 = v78;
            }
            if ((v23 & 1) != 0)
            {
              v27 = objc_alloc((Class)NSData);
              v26 = objc_msgSend(v27, "initWithBytes:length:", &v74, v75);
              objc_msgSend(v9, "setLtkData:", v26);
LABEL_32:

            }
            else if ((v23 & 8) != 0)
            {
              v25 = objc_alloc((Class)NSData);
              v26 = objc_msgSend(v25, "initWithBytes:length:", (char *)&v75 + 12, BYTE12(v76));
              objc_msgSend(v9, "setLtkData:", v26);
              goto LABEL_32;
            }
          }
          objc_msgSend(v60, "addObject:", v9);

        }
        _Block_object_dispose(&__p, 8);

        _Block_object_dispose(&v84, 8);
        v7 = (char *)v7 + 1;
      }
      while (v6 != v7);
      v5 = obj;
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v88, 16);
    }
    while (v6);
  }

  v74 = 0uLL;
  *(_QWORD *)&v75 = 0;
  if (qword_100977898 != -1)
    dispatch_once(&qword_100977898, &stru_1009198E0);
  v28 = sub_10006D888((uint64_t)off_100977890, (uint64_t **)&v74);
  if (v28)
  {
    v29 = (v28 + 310000);
    if (v28 != -310000
      && dword_100978048 <= 90
      && (dword_100978048 != -1 || _LogCategory_Initialize(&dword_100978048, 90)))
    {
      v30 = CUPrintErrorCode(v29);
      v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
      LogPrintF_safe(&dword_100978048, "-[CBStackControllerBTStack getDevicesWithFlags:error:]", 90, "### GetPairedDevices failed: %@", v31);

    }
  }
  v32 = (uint64_t *)*((_QWORD *)&v74 + 1);
  for (i = (uint64_t *)v74; i != v32; ++i)
  {
    v34 = *i;
    v66 = *(_DWORD *)(*i + 128);
    v67 = *(_WORD *)(v34 + 132);
    v84 = 0;
    v85 = 0;
    if (qword_1009778C8 != -1)
      dispatch_once(&qword_1009778C8, &stru_100919940);
    sub_10003F924((uint64_t)off_1009778C0, ((unint64_t)v66 << 40) | ((unint64_t)BYTE1(v66) << 32) | ((unint64_t)BYTE2(v66) << 24) | ((unint64_t)HIBYTE(v66) << 16) | ((unint64_t)v67 << 8) | HIBYTE(v67), 1u, 1u, 0, 0, (unsigned __int8 *)&v84);
    v35 = sub_100030DF4((const unsigned __int8 *)&v84);
    v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
    if (v36)
    {
      v64 = 0;
      v65 = 0;
      v37 = sub_100444BF0(v34, (_DWORD *)&v65 + 1, &v65, (_DWORD *)&v64 + 1, &v64);
      v38 = objc_alloc_init((Class)CBDevice);
      objc_msgSend(v38, "setColorInfo:", (unsigned __int16)sub_1004512E8(v34));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "UUIDString"));
      objc_msgSend(v38, "setIdentifier:", v39);

      sub_10043F6EC(v34, (uint64_t)&__p);
      if (v80 >= 0)
        p_p = &__p;
      else
        p_p = (__n128 *)__p.n128_u64[0];
      v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", p_p));
      objc_msgSend(v38, "setName:", v41);

      if (SHIBYTE(v80) < 0)
        operator delete((void *)__p.n128_u64[0]);
      if (v37)
        v42 = HIDWORD(v64);
      else
        v42 = 0;
      objc_msgSend(v38, "setProductID:", v42);
      v43 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &v66, 6);
      objc_msgSend(v38, "setBtAddressData:", v43);

      if ((v63 & 2) != 0)
      {
        __p = 0uLL;
        v80 = 0;
        sub_100448DAC(v34, (uint64_t)&__p);
        if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(__p.n128_u64[1] - __p.n128_u64[0]) >> 3) < 4)
        {
          v45 = 0;
        }
        else
        {
          v44 = (_QWORD *)(__p.n128_u64[0] + 72);
          if (*(char *)(__p.n128_u64[0] + 95) < 0)
            v44 = (_QWORD *)*v44;
          v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v44));
        }
        if (objc_msgSend(v45, "length"))
        {
          if (qword_1009778C8 != -1)
            dispatch_once(&qword_1009778C8, &stru_100919940);
          v46 = off_1009778C0;
          v47 = sub_100660768((uint64_t)off_1009778C0, v45);
          v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
          if (v48)
          {
            if (sub_100660D1C((uint64_t)v46, v48) == 2)
            {
              v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "UUIDString"));
              objc_msgSend(v38, "setFindMyCaseIdentifier:", v49);

            }
            v50 = sub_100660B4C((uint64_t)v46, v48);
            v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
            v52 = v51;
            if (v51)
            {
              v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "UUIDString"));
              objc_msgSend(v38, "setFindMyGroupIdentifier:", v53);

            }
          }

        }
        v73 = &__p;
        sub_100091BF8((void ***)&v73);
      }
      if ((v63 & 1) != 0)
      {
        __p = 0uLL;
        LODWORD(v80) = 0;
        sub_1005A9714((uint64_t)&__p);
        if (qword_100978160 != -1)
          dispatch_once(&qword_100978160, &stru_100919A40);
        if (!sub_1005BEB64((uint64_t)off_100978158, (unsigned __int8 *)v34, &__p))
        {
          v55 = objc_alloc((Class)NSData);
          v57 = nullsub_90(&__p, v56);
          v58 = objc_msgSend(v55, "initWithBytes:length:", v57, sub_1005A97B4());
          objc_msgSend(v38, "setLinkKeyData:", v58);

        }
        nullsub_90(&__p, v54);
      }
      objc_msgSend(v60, "addObject:", v38);

    }
  }
  if ((_QWORD)v74)
  {
    *((_QWORD *)&v74 + 1) = v74;
    operator delete((void *)v74);
  }
  return v60;
}

- (void)localDeviceEvent:(int)a3
{
  unsigned int v4;
  const char *v5;
  unint64_t v6;
  const char *v7;
  unsigned int v8;
  const char *v9;
  int v10;
  int v11;
  const char *v12;
  void (**v13)(void);
  void (**v14)(void);
  void (**v15)(void);
  void (**v16)(void);
  void (**v17)(void);

  switch(a3)
  {
    case 0:
      if (dword_100978048 <= 30
        && (dword_100978048 != -1 || _LogCategory_Initialize(&dword_100978048, 30)))
      {
        v6 = -[CBStackControllerBTStack powerState](self, "powerState");
        if (v6 > 0xA)
          v7 = "?";
        else
          v7 = off_100919B38[v6];
        LogPrintF_safe(&dword_100978048, "-[CBStackControllerBTStack localDeviceEvent:]", 30, "Power state changed: %s", v7);
      }
      v15 = (void (**)(void))objc_retainBlock(self->_controllerDataChangedHandler);
      if (v15)
        v15[2]();

      v16 = (void (**)(void))objc_retainBlock(self->_discoverableStateChangedHandler);
      if (v16)
        v16[2]();

      v17 = (void (**)(void))objc_retainBlock(self->_inquiryStateChangedHandler);
      if (v17)
        v17[2]();

      v14 = (void (**)(void))objc_retainBlock(self->_powerChangedHandler);
      if (!v14)
        goto LABEL_44;
      goto LABEL_43;
    case 2:
      if (dword_100978048 <= 30
        && (dword_100978048 != -1 || _LogCategory_Initialize(&dword_100978048, 30)))
      {
        v8 = -[CBStackControllerBTStack discoverableState](self, "discoverableState");
        if (v8 > 2)
          v9 = "?";
        else
          v9 = off_100919B20[v8];
        LogPrintF_safe(&dword_100978048, "-[CBStackControllerBTStack localDeviceEvent:]", 30, "Discoverable state changed: %s", v9);
      }
      v13 = (void (**)(void))objc_retainBlock(self->_discoverableStateChangedHandler);
      if (v13)
        goto LABEL_48;
      goto LABEL_49;
    case 6:
    case 7:
      if (dword_100978048 <= 30
        && (dword_100978048 != -1 || _LogCategory_Initialize(&dword_100978048, 30)))
      {
        v4 = -[CBStackControllerBTStack inquiryState](self, "inquiryState");
        if (v4 > 2)
          v5 = "?";
        else
          v5 = off_100919B20[v4];
        LogPrintF_safe(&dword_100978048, "-[CBStackControllerBTStack localDeviceEvent:]", 30, "Inquiry state changed: %s", v5);
      }
      v13 = (void (**)(void))objc_retainBlock(self->_inquiryStateChangedHandler);
      if (v13)
LABEL_48:
        v13[2]();
LABEL_49:

      break;
    case 10:
      if (qword_100977A58 != -1)
        dispatch_once(&qword_100977A58, &stru_100919880);
      v10 = sub_1000261DC((uint64_t)off_100977A50);
      if (dword_100978048 <= 30)
      {
        v11 = v10;
        if (dword_100978048 != -1 || _LogCategory_Initialize(&dword_100978048, 30))
        {
          v12 = "no";
          if (v11)
            v12 = "yes";
          LogPrintF_safe(&dword_100978048, "-[CBStackControllerBTStack localDeviceEvent:]", 30, "Restricted mode changed: %s", v12);
        }
      }
      v14 = (void (**)(void))objc_retainBlock(self->_powerChangedHandler);
      if (v14)
LABEL_43:
        v14[2]();
LABEL_44:

      notify_set_state(self->_powerStateNotifyToken, -[CBStackControllerBTStack powerState](self, "powerState"));
      notify_post("com.apple.bluetooth.state");
      break;
    default:
      return;
  }
}

- (BOOL)modifyDevice:(id)a3 error:(id *)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = objc_alloc_init((Class)CBDeviceSettings);
  objc_msgSend(v7, "setDoubleTapActionLeft:", objc_msgSend(v6, "doubleTapActionLeft"));
  objc_msgSend(v7, "setDoubleTapActionRight:", objc_msgSend(v6, "doubleTapActionRight"));
  objc_msgSend(v7, "setMicrophoneMode:", objc_msgSend(v6, "microphoneMode"));
  objc_msgSend(v7, "setPlacementMode:", objc_msgSend(v6, "placementMode"));
  objc_msgSend(v7, "setSmartRoutingMode:", objc_msgSend(v6, "smartRoutingMode"));
  LOBYTE(a4) = -[CBStackControllerBTStack modifyDevice:settings:error:](self, "modifyDevice:settings:error:", v6, v7, a4);

  return (char)a4;
}

- (void)modifyDevice:(id)a3 connectionPriorityDevices:(id)a4 timeoutSeconds:(double)a5 completionHandler:(id)a6
{
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id *v14;
  void *v15;
  id v16;
  unsigned __int8 v17;
  id v18;
  CBStackModifyDeviceRequest *v19;
  id v20;
  uint64_t v21;
  void *i;
  const char *v23;
  const char *v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  NSObject *v28;
  double v29;
  NSMutableSet *modifyDeviceRequests;
  NSMutableSet *v31;
  NSMutableSet **p_modifyDeviceRequests;
  NSMutableSet *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  _QWORD *v45;
  id v46;
  id v47;
  _QWORD handler[7];
  int v49;
  __int16 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  id obj;
  _QWORD v56[4];
  id v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  _BYTE v65[128];

  v46 = a3;
  v47 = a4;
  v44 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v59 = 0;
  v60 = &v59;
  v61 = 0x3032000000;
  v62 = sub_10006250C;
  v63 = sub_100062340;
  v64 = 0;
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472;
  v56[2] = sub_1000D0D68;
  v56[3] = &unk_100919460;
  v58 = &v59;
  v10 = v44;
  v57 = v10;
  v45 = objc_retainBlock(v56);
  if (dword_100978048 <= 30 && (dword_100978048 != -1 || _LogCategory_Initialize(&dword_100978048, 30)))
  {
    v11 = CUPrintNSObjectOneLine(v47);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    LogPrintF_safe(&dword_100978048, "-[CBStackControllerBTStack modifyDevice:connectionPriorityDevices:timeoutSeconds:completionHandler:]", 30, "ModifyDevice CnxPri start: %@, %@", v46, v12, v44);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "identifier"));
  v14 = (id *)(v60 + 5);
  obj = (id)v60[5];
  v15 = -[CBStackControllerBTStack _btDeviceWithID:error:](self, "_btDeviceWithID:error:", v13, &obj);
  objc_storeStrong(v14, obj);

  if (v15)
  {
    v16 = objc_msgSend(v47, "count");
    v17 = v16;
    if ((unint64_t)v16 >= 0x100)
    {
      v40 = CBErrorF(4294960591, "Too many devices");
      v41 = objc_claimAutoreleasedReturnValue(v40);
      v18 = (id)v60[5];
      v60[5] = v41;
    }
    else
    {
      v18 = objc_alloc_init((Class)NSMutableData);
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      v19 = (CBStackModifyDeviceRequest *)v47;
      v20 = -[CBStackModifyDeviceRequest countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v51, v65, 16);
      if (v20)
      {
        v21 = *(_QWORD *)v52;
        while (2)
        {
          for (i = 0; i != v20; i = (char *)i + 1)
          {
            if (*(_QWORD *)v52 != v21)
              objc_enumerationMutation(v19);
            v23 = (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)i)), "UTF8String");
            v24 = v23;
            if (!v23)
            {
              v34 = CBErrorF(4294960591, "Bad deviceAddress");
              v35 = objc_claimAutoreleasedReturnValue(v34);
              v36 = (void *)v60[5];
              v60[5] = v35;

              goto LABEL_25;
            }
            v50 = 0;
            v49 = 0;
            v25 = TextToHardwareAddress(v23, -1, 6, &v49);
            if ((_DWORD)v25)
            {
              v37 = CBErrorF(v25, "Bad deviceAddress: '%s'", v24);
              v38 = objc_claimAutoreleasedReturnValue(v37);
              v39 = (void *)v60[5];
              v60[5] = v38;

              goto LABEL_25;
            }
            objc_msgSend(v18, "appendBytes:length:", &v49, 6);
          }
          v20 = -[CBStackModifyDeviceRequest countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v51, v65, 16);
          if (v20)
            continue;
          break;
        }
      }

      if (qword_100977A88 != -1)
        dispatch_once(&qword_100977A88, &stru_100919980);
      v26 = sub_10027CB9C((uint64_t)off_100977A80, (uint64_t)v15, 1, (int *)objc_msgSend(objc_retainAutorelease(v18), "bytes"), v17);
      if (v26 && (v27 = (v26 + 310000), (_DWORD)v27))
      {
        v42 = CBErrorF(v27, "AACP updateConnPriorityList failed");
        v43 = objc_claimAutoreleasedReturnValue(v42);
        v19 = (CBStackModifyDeviceRequest *)v60[5];
        v60[5] = v43;
      }
      else
      {
        v19 = objc_alloc_init(CBStackModifyDeviceRequest);
        -[CBStackModifyDeviceRequest setCompletionHandler:](v19, "setCompletionHandler:", v10);
        -[CBStackModifyDeviceRequest setDevice:](v19, "setDevice:", v46);
        v28 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
        -[CBStackModifyDeviceRequest setTimer:](v19, "setTimer:", v28);
        handler[0] = _NSConcreteStackBlock;
        handler[1] = 3221225472;
        handler[2] = sub_1000D0E44;
        handler[3] = &unk_100919488;
        handler[4] = v28;
        handler[5] = v19;
        handler[6] = self;
        dispatch_source_set_event_handler(v28, handler);
        v29 = 10.0;
        if (a5 > 0.0)
          v29 = a5;
        CUDispatchTimerSet(v28, v29, -1.0, 1.0);
        dispatch_activate(v28);
        modifyDeviceRequests = self->_modifyDeviceRequests;
        if (!modifyDeviceRequests)
        {
          v31 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
          v33 = self->_modifyDeviceRequests;
          p_modifyDeviceRequests = &self->_modifyDeviceRequests;
          *p_modifyDeviceRequests = v31;

          modifyDeviceRequests = *p_modifyDeviceRequests;
        }
        -[NSMutableSet addObject:](modifyDeviceRequests, "addObject:", v19);

      }
LABEL_25:

    }
  }
  ((void (*)(_QWORD *))v45[2])(v45);

  _Block_object_dispose(&v59, 8);
}

- (BOOL)modifyDevice:(id)a3 peerSourceDevice:(id)a4 peerSourceState:(char)a5 requestFlags:(unsigned int)a6 error:(id *)a7
{
  char v8;
  int v9;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  int v19;
  BOOL v20;
  uint64_t v21;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v8 = a6;
  v9 = a5;
  v12 = a3;
  v13 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
  v15 = -[CBStackControllerBTStack _btDeviceWithID:error:](self, "_btDeviceWithID:error:", v14, a7);

  if (!v15)
  {
    v20 = 0;
    goto LABEL_9;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
  v17 = v16;
  if (v16)
  {
    WORD2(v27) = 0;
    LODWORD(v27) = 0;
    v18 = objc_retainAutorelease(v16);
    if (!TextToHardwareAddress(objc_msgSend(v18, "UTF8String"), -1, 6, &v27))
    {
      if (qword_100977A88 != -1)
        dispatch_once(&qword_100977A88, &stru_100919980);
      v19 = sub_10027F088((uint64_t)off_100977A80, (uint64_t)v15, (uint64_t)&v27, v9, (v8 & 0x10) != 0);
      v20 = 1;
      if (!v19)
        goto LABEL_8;
      v21 = (v19 + 310000);
      if (!(_DWORD)v21)
        goto LABEL_8;
      if (a7)
      {
        v26 = CBErrorF(v21, "setDeviceStateOnPeerSrc failed");
        v24 = (void *)objc_claimAutoreleasedReturnValue(v26);
        goto LABEL_17;
      }
LABEL_18:
      v20 = 0;
      goto LABEL_8;
    }
    if (!a7)
      goto LABEL_18;
    v25 = CBErrorF(4294960591, "Bad peer address: '%@'", v18, v27);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v25);
  }
  else
  {
    if (!a7)
      goto LABEL_18;
    v23 = CBErrorF(4294960591, "No peer address");
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  }
LABEL_17:
  v20 = 0;
  *a7 = v24;
LABEL_8:

LABEL_9:
  return v20;
}

- (BOOL)modifyDevice:(id)a3 settings:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  id v31;
  void **v32;
  uint64_t v33;
  void (*v34)(_QWORD *, uint64_t);
  void *v35;
  CBStackControllerBTStack *v36;
  id v37;
  id v38;
  uint64_t *v39;
  id obj;
  _QWORD v41[5];
  id v42;
  id v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "idsDeviceID"));
    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "idsDeviceID"));
      v13 = objc_msgSend(v12, "length");

      if (v13)
      {
        v45 = 0;
        v46 = &v45;
        v47 = 0x3032000000;
        v48 = sub_10006250C;
        v49 = sub_100062340;
        v50 = 0;
        if (qword_1009778C8 != -1)
          dispatch_once(&qword_1009778C8, &stru_100919940);
        v14 = off_1009778C0;
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "idsDeviceID"));
        v41[0] = _NSConcreteStackBlock;
        v41[1] = 3221225472;
        v41[2] = sub_1000D1574;
        v41[3] = &unk_1009194D8;
        v41[4] = self;
        v42 = v8;
        v43 = v9;
        v44 = &v45;
        v16 = sub_10065E45C((uint64_t)v14, v15, v41);

        if ((v16 & 1) != 0)
        {
          v17 = (void *)v46[5];
          if (!v17)
          {
            v18 = 1;
LABEL_9:

LABEL_20:
            _Block_object_dispose(&v45, 8);

            goto LABEL_21;
          }
          if (a5)
          {
            v26 = objc_retainAutorelease(v17);
            goto LABEL_28;
          }
        }
        else if (a5)
        {
          v25 = CBErrorF(4294960569, "Cloud Paired Device not found '%@'", v10);
          v26 = (id)objc_claimAutoreleasedReturnValue(v25);
LABEL_28:
          v18 = 0;
          *a5 = v26;
          goto LABEL_9;
        }
        v18 = 0;
        goto LABEL_9;
      }
    }
    v19 = -[CBStackControllerBTStack _btDeviceWithID:error:](self, "_btDeviceWithID:error:", v10, 0);
    if (v19)
    {
      v18 = -[CBStackControllerBTStack modifyDevice:btDevice:settings:error:](self, "modifyDevice:btDevice:settings:error:", v8, v19, v9, a5);
      goto LABEL_21;
    }
    v45 = 0;
    v46 = &v45;
    v47 = 0x3032000000;
    v48 = sub_10006250C;
    v49 = sub_100062340;
    v50 = 0;
    obj = 0;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CBStackControllerBTStack _btUUIDWithID:error:](self, "_btUUIDWithID:error:", v10, &obj));
    objc_storeStrong(&v50, obj);
    if (!v20)
    {
      if (a5)
      {
        v27 = (void *)v46[5];
        if (v27)
        {
          v18 = 0;
          *a5 = objc_retainAutorelease(v27);
          goto LABEL_19;
        }
        v30 = CBErrorF(4294960534, "Bad device UUID: '%@'", v10);
        v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v30));
        *a5 = v31;

      }
      v18 = 0;
      goto LABEL_19;
    }
    if (qword_1009778C8 != -1)
      dispatch_once(&qword_1009778C8, &stru_100919940);
    v21 = off_1009778C0;
    v32 = _NSConcreteStackBlock;
    v33 = 3221225472;
    v34 = sub_1000D15C4;
    v35 = &unk_1009194D8;
    v36 = self;
    v37 = v8;
    v38 = v9;
    v39 = &v45;
    if (sub_10065E6EC((uint64_t)v21, v20, &v32))
    {
      v22 = (void *)v46[5];
      if (!v22)
      {
        v18 = 1;
LABEL_18:

LABEL_19:
        goto LABEL_20;
      }
      if (a5)
      {
        v29 = objc_retainAutorelease(v22);
        goto LABEL_38;
      }
    }
    else if (a5)
    {
      v28 = CBErrorF(4294960569, "Device not found '%@'", v10, v32, v33, v34, v35, v36, v37);
      v29 = (id)objc_claimAutoreleasedReturnValue(v28);
LABEL_38:
      v18 = 0;
      *a5 = v29;
      goto LABEL_18;
    }
    v18 = 0;
    goto LABEL_18;
  }
  if (a5)
  {
    v24 = CBErrorF(4294960588, "No device ID");
    v18 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue(v24);
  }
  else
  {
    v18 = 0;
  }
LABEL_21:

  return v18;
}

- (BOOL)modifyDevice:(id)a3 btDevice:(void *)a4 settings:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  int v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  id v21;
  void *v22;
  int v23;
  uint64_t v24;
  unsigned int v25;
  const char *v26;
  int v27;
  uint64_t v28;
  unsigned int v29;
  const char *v30;
  int v31;
  uint64_t v32;
  unsigned int v33;
  unsigned int v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  id v38;
  void *v39;
  int v40;
  uint64_t v41;
  unsigned int v42;
  unsigned int v43;
  __int16 v44;
  unsigned __int8 v45;
  const __CFString *v46;
  const __CFString *v47;
  int v48;
  uint64_t v49;
  id v50;
  __CFString *v51;
  __CFString *v52;
  int v53;
  uint64_t v54;
  unsigned int v55;
  unint64_t v56;
  int v57;
  int v58;
  unsigned int v59;
  const char *v60;
  const char *v61;
  const char *v62;
  uint64_t v63;
  int v64;
  uint64_t v65;
  __int16 v66;
  unsigned int v67;
  unsigned int v68;
  unsigned int v69;
  int v70;
  uint64_t v71;
  unsigned int v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  const char *v76;
  int v77;
  uint64_t v78;
  id v79;
  const char *v80;
  int v81;
  uint64_t v82;
  id v83;
  uint64_t v84;
  void *v85;
  int v86;
  uint64_t v87;
  unsigned int v88;
  unsigned int v89;
  uint64_t v90;
  const char *v91;
  int v92;
  uint64_t v93;
  void *v94;
  void **v95;
  void *v96;
  id v97;
  id v98;
  void *v99;
  unsigned __int8 v100;
  unsigned int v101;
  const char *v102;
  int v103;
  uint64_t v104;
  unsigned int v105;
  const char *v106;
  const char *v107;
  int v108;
  void *v109;
  int v110;
  id v111;
  void *v112;
  int v113;
  uint64_t v114;
  unsigned int v115;
  uint64_t v116;
  const char *v117;
  uint64_t v118;
  const char *v119;
  int v120;
  uint64_t v121;
  uint64_t v122;
  BOOL v123;
  const char *v124;
  int v125;
  uint64_t v126;
  uint64_t v128;
  void *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  void *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  void *v151;
  void *v152[2];
  char v153;
  void *__p[2];
  char v155;

  v9 = a3;
  v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
  if (!v11)
  {
    if (!a6)
      goto LABEL_340;
    v128 = CBErrorF(4294960588, "No device ID");
    v129 = (void *)objc_claimAutoreleasedReturnValue(v128);
LABEL_339:
    v123 = 0;
    *a6 = v129;
    goto LABEL_302;
  }
  if (qword_1009778D8 != -1)
    dispatch_once(&qword_1009778D8, &stru_100919A60);
  v151 = off_1009778D0;
  v12 = objc_msgSend(v10, "aclPriority");
  if (v12)
  {
    v13 = sub_1000438A4();
    if (((*(uint64_t (**)(uint64_t))(*(_QWORD *)v13 + 2728))(v13) & 1) == 0)
    {
      if (!a6)
        goto LABEL_340;
      v131 = CBErrorF(4294960561, "ACL priority not supported");
      v129 = (void *)objc_claimAutoreleasedReturnValue(v131);
      goto LABEL_339;
    }
    if (dword_100978048 > 30 || dword_100978048 == -1 && !_LogCategory_Initialize(&dword_100978048, 30))
      goto LABEL_21;
    if (v12 <= 19)
    {
      if (v12 == 1)
      {
        v14 = "Default";
        goto LABEL_20;
      }
    }
    else
    {
      switch(v12)
      {
        case 20:
          v14 = "Low";
          goto LABEL_20;
        case 50:
          v14 = "Medium";
          goto LABEL_20;
        case 80:
          v14 = "High";
LABEL_20:
          LogPrintF_safe(&dword_100978048, "-[CBStackControllerBTStack modifyDevice:btDevice:settings:error:]", 30, "aclPriority: device %@, priority %s", v11, v14);
LABEL_21:
          v15 = sub_1000438A4();
          v16 = *((unsigned __int16 *)a4 + 66);
          v17 = *((unsigned int *)a4 + 32);
          v18 = sub_10043F854((uint64_t)a4);
          v19 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, BOOL, BOOL, uint64_t, uint64_t))(*(_QWORD *)v15 + 80))(v15, (v17 | (v16 << 32)) & 0xFFFFFFFFFFFFLL, v18, 32, v12 == 80, v12 == 80, 1, 1);
          if (v19)
          {
            v20 = (v19 + 310000);
            if ((_DWORD)v20)
            {
              if (!a6)
                goto LABEL_340;
              v132 = CBErrorF(v20, "aclPriority failed");
              v129 = (void *)objc_claimAutoreleasedReturnValue(v132);
              goto LABEL_339;
            }
          }
          goto LABEL_23;
      }
    }
    v14 = "?";
    goto LABEL_20;
  }
LABEL_23:
  v21 = objc_msgSend(v10, "adaptiveVolumeConfig");
  if ((_DWORD)v21)
  {
    if (dword_100978048 <= 30
      && (dword_100978048 != -1 || _LogCategory_Initialize(&dword_100978048, 30)))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
      LogPrintF_safe(&dword_100978048, "-[CBStackControllerBTStack modifyDevice:btDevice:settings:error:]", 30, "adaptiveVolumeConfig sendControlCommand for %@: device %@, value 0x%04X", v22, v11, v21);

    }
    if (qword_100977A88 != -1)
      dispatch_once(&qword_100977A88, &stru_100919980);
    v23 = sub_100279E6C((uint64_t)off_100977A80, (uint64_t)a4, 38, (uint64_t)v21, 2u);
    if (v23)
    {
      v24 = (v23 + 310000);
      if ((_DWORD)v24)
      {
        if (!a6)
          goto LABEL_340;
        v133 = CBErrorF(v24, "set adaptiveVolumeConfig failed");
        v129 = (void *)objc_claimAutoreleasedReturnValue(v133);
        goto LABEL_339;
      }
    }
  }
  v25 = objc_msgSend(v10, "allowsAutoRoute");
  if (v25)
  {
    if (dword_100978048 <= 30
      && (dword_100978048 != -1 || _LogCategory_Initialize(&dword_100978048, 30)))
    {
      if (v25 > 2)
        v26 = "?";
      else
        v26 = off_100919C58[v25];
      LogPrintF_safe(&dword_100978048, "-[CBStackControllerBTStack modifyDevice:btDevice:settings:error:]", 30, "allowsAutoRoute: device %@, allows %s", v11, v26);
    }
    if (qword_100977A88 != -1)
      dispatch_once(&qword_100977A88, &stru_100919980);
    v27 = sub_1002A18B0((uint64_t)off_100977A80, (uint64_t)a4, v25 == 1);
    if (v27)
    {
      v28 = (v27 + 310000);
      if ((_DWORD)v28)
      {
        if (!a6)
          goto LABEL_340;
        v134 = CBErrorF(v28, "setAllowsAutoRoute failed");
        v129 = (void *)objc_claimAutoreleasedReturnValue(v134);
        goto LABEL_339;
      }
    }
  }
  v29 = objc_msgSend(v10, "audioRouteHidden");
  if (v29)
  {
    if (dword_100978048 <= 30
      && (dword_100978048 != -1 || _LogCategory_Initialize(&dword_100978048, 30)))
    {
      if (v29 > 2)
        v30 = "?";
      else
        v30 = off_100919C58[v29];
      LogPrintF_safe(&dword_100978048, "-[CBStackControllerBTStack modifyDevice:btDevice:settings:error:]", 30, "audioRouteHidden: device %@, hidden %s", v11, v30);
    }
    if (qword_100977A88 != -1)
      dispatch_once(&qword_100977A88, &stru_100919980);
    v31 = sub_1002A1AA4((uint64_t)off_100977A80, (uint64_t)a4, v29 == 1);
    if (v31)
    {
      v32 = (v31 + 310000);
      if ((_DWORD)v32)
      {
        if (!a6)
          goto LABEL_340;
        v135 = CBErrorF(v32, "setAudioRouteHidden failed");
        v129 = (void *)objc_claimAutoreleasedReturnValue(v135);
        goto LABEL_339;
      }
    }
  }
  v33 = objc_msgSend(v10, "endCallConfig");
  v34 = objc_msgSend(v10, "muteControlConfig");
  if (v33 | v34)
  {
    v35 = sub_10044FB04((uint64_t)a4) & 0xF0FF | ((v33 & 0xF) << 8) | ((v34 & 0xF) << 16);
    if (qword_100977A88 != -1)
      dispatch_once(&qword_100977A88, &stru_100919980);
    v36 = sub_100279E6C((uint64_t)off_100977A80, (uint64_t)a4, 36, v35, 2u);
    if (v36)
    {
      v37 = (v36 + 310000);
      if ((_DWORD)v37)
      {
        if (!a6)
          goto LABEL_340;
        v142 = CBErrorF(v37, "set callMgmtConfig failed");
        v129 = (void *)objc_claimAutoreleasedReturnValue(v142);
        goto LABEL_339;
      }
    }
  }
  v38 = objc_msgSend(v10, "conversationDetectConfig");
  if ((_DWORD)v38)
  {
    if (dword_100978048 <= 30
      && (dword_100978048 != -1 || _LogCategory_Initialize(&dword_100978048, 30)))
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
      LogPrintF_safe(&dword_100978048, "-[CBStackControllerBTStack modifyDevice:btDevice:settings:error:]", 30, "conversationDetectConfig sendControlCommand for %@: device %@, value 0x%04X", v39, v11, v38);

    }
    if (qword_100977A88 != -1)
      dispatch_once(&qword_100977A88, &stru_100919980);
    v40 = sub_100279E6C((uint64_t)off_100977A80, (uint64_t)a4, 40, (uint64_t)v38, 2u);
    if (v40)
    {
      v41 = (v40 + 310000);
      if ((_DWORD)v41)
      {
        if (!a6)
          goto LABEL_340;
        v136 = CBErrorF(v41, "set conversationDetectConfig failed");
        v129 = (void *)objc_claimAutoreleasedReturnValue(v136);
        goto LABEL_339;
      }
    }
  }
  v42 = objc_msgSend(v10, "clickHoldModeLeft");
  v43 = objc_msgSend(v10, "clickHoldModeRight");
  if (v42 | v43)
  {
    v44 = sub_10044F8A0((uint64_t)a4);
    if (v42)
      v45 = v42;
    else
      v45 = HIBYTE(v44);
    if (!v43)
      LOBYTE(v43) = v44;
    if (dword_100978048 < 31
      && (dword_100978048 != -1 || _LogCategory_Initialize(&dword_100978048, 30)))
    {
      if (v45 > 7u)
        v46 = CFSTR("?");
      else
        v46 = (const __CFString *)*((_QWORD *)&off_100919B90 + (char)v45);
      if (v43 > 7u)
        v47 = CFSTR("?");
      else
        v47 = (const __CFString *)*((_QWORD *)&off_100919B90 + (char)v43);
      LogPrintF_safe(&dword_100978048, "-[CBStackControllerBTStack modifyDevice:btDevice:settings:error:]", 30, "clickHoldMode: device %@, left %@, right %@, value 0x%04X", v11, v46, v47, v43 | (v45 << 8));
    }
    if (qword_100977A88 != -1)
      dispatch_once(&qword_100977A88, &stru_100919980);
    v48 = sub_100279E6C((uint64_t)off_100977A80, (uint64_t)a4, 22, v43 | (v45 << 8), 2u);
    if (v48)
    {
      v49 = (v48 + 310000);
      if ((_DWORD)v49)
      {
        if (!a6)
          goto LABEL_340;
        v143 = CBErrorF(v49, "set clickHoldMode failed");
        v129 = (void *)objc_claimAutoreleasedReturnValue(v143);
        goto LABEL_339;
      }
    }
  }
  v50 = objc_msgSend(v10, "crownRotationDirection");
  if ((_DWORD)v50)
  {
    if (dword_100978048 <= 30
      && (dword_100978048 != -1 || _LogCategory_Initialize(&dword_100978048, 30)))
    {
      v51 = CFSTR("?");
      if ((_DWORD)v50 == 1)
        v51 = CFSTR("BackToFront");
      if ((_DWORD)v50 == 2)
        v51 = CFSTR("FrontToBack");
      v52 = v51;
      LogPrintF_safe(&dword_100978048, "-[CBStackControllerBTStack modifyDevice:btDevice:settings:error:]", 30, "crownRotationDirection: device %@, %@", v11, v52);

    }
    if (qword_100977A88 != -1)
      dispatch_once(&qword_100977A88, &stru_100919980);
    v53 = sub_100279E6C((uint64_t)off_100977A80, (uint64_t)a4, 28, (uint64_t)v50, 2u);
    if (v53)
    {
      v54 = (v53 + 310000);
      if ((_DWORD)v54)
      {
        if (!a6)
          goto LABEL_340;
        v137 = CBErrorF(v54, "set crownRotationDirection failed");
        v129 = (void *)objc_claimAutoreleasedReturnValue(v137);
        goto LABEL_339;
      }
    }
  }
  v55 = objc_msgSend(v10, "deviceFlagsMask");
  v56 = (unint64_t)objc_msgSend(v10, "deviceFlagsValue");
  v57 = v56;
  if ((v55 & 0x400000) != 0)
  {
    v58 = *((unsigned __int8 *)a4 + 1428);
    if (((v56 >> 22) & 1) != v58)
    {
      v59 = v56 & 0x400000;
      if (dword_100978048 <= 30
        && (dword_100978048 != -1 || _LogCategory_Initialize(&dword_100978048, 30)))
      {
        v60 = "yes";
        if (v58)
          v61 = "yes";
        else
          v61 = "no";
        if (!v59)
          v60 = "no";
        LogPrintF_safe(&dword_100978048, "-[CBStackControllerBTStack modifyDevice:btDevice:settings:error:]", 30, "userRouted: device %@, %s -> %s", v11, v61, v60);
      }
      sub_1004411C0((uint64_t)a4, v59 != 0);
    }
  }
  if ((v55 & 0x80000000) != 0)
  {
    if (dword_100978048 <= 30
      && (dword_100978048 != -1 || _LogCategory_Initialize(&dword_100978048, 30)))
    {
      v62 = "yes";
      if (v57 >= 0)
        v62 = "no";
      LogPrintF_safe(&dword_100978048, "-[CBStackControllerBTStack modifyDevice:btDevice:settings:error:]", 30, "autoAnswerCalls: device %@, %s", v11, v62);
    }
    if (qword_100977A88 != -1)
      dispatch_once(&qword_100977A88, &stru_100919980);
    v63 = v57 < 0 ? 1 : 2;
    v64 = sub_100279E6C((uint64_t)off_100977A80, (uint64_t)a4, 30, v63, 2u);
    if (v64)
    {
      v65 = (v64 + 310000);
      if ((_DWORD)v65)
      {
        if (!a6)
          goto LABEL_340;
        v144 = CBErrorF(v65, "set autoAnswerCalls failed");
        v129 = (void *)objc_claimAutoreleasedReturnValue(v144);
        goto LABEL_339;
      }
    }
  }
  v66 = sub_1004459D0((uint64_t)a4);
  v67 = objc_msgSend(v10, "doubleTapActionLeft");
  v68 = objc_msgSend(v10, "doubleTapActionRight");
  v69 = v68;
  v70 = HIBYTE(v66);
  v71 = v66;
  v72 = v67 - 1;
  if (v67 - 1 >= 5)
    v72 = 0xFFFF;
  if (v67)
    v73 = v72;
  else
    v73 = HIBYTE(v66);
  if (v68)
  {
    if (v68 > 5)
    {
      v74 = 0xFFFFLL;
      goto LABEL_145;
    }
    v74 = v68 - 1;
  }
  else
  {
    v74 = v71;
  }
  if ((_DWORD)v73 == v70 && (_DWORD)v74 == (_DWORD)v71)
    goto LABEL_158;
LABEL_145:
  if (dword_100978048 <= 30 && (dword_100978048 != -1 || _LogCategory_Initialize(&dword_100978048, 30)))
  {
    if (v67 > 5)
      v75 = "?";
    else
      v75 = off_100919BD0[v67];
    if (v69 > 5)
      v76 = "?";
    else
      v76 = off_100919BD0[v69];
    LogPrintF_safe(&dword_100978048, "-[CBStackControllerBTStack modifyDevice:btDevice:settings:error:]", 30, "setDoubleTapActionEx: device %@, left %d (%s), right %d (%s)", v11, v73, v75, v74, v76);
  }
  v77 = sub_100421D68((uint64_t)v151, (uint64_t)a4, v73, v74);
  if (v77)
  {
    v78 = (v77 + 310000);
    if ((_DWORD)v78)
    {
      if (!a6)
        goto LABEL_340;
      v130 = CBErrorF(v78, "setDoubleTapActionEx failed");
      v129 = (void *)objc_claimAutoreleasedReturnValue(v130);
      goto LABEL_339;
    }
  }
LABEL_158:
  v79 = objc_msgSend(v10, "listeningMode");
  if ((_DWORD)v79 && (_DWORD)v79 != sub_10044F708((uint64_t)a4))
  {
    if (dword_100978048 <= 30
      && (dword_100978048 != -1 || _LogCategory_Initialize(&dword_100978048, 30)))
    {
      if (v79 > 4)
        v80 = "?";
      else
        v80 = off_100919C00[(int)v79 - 1];
      LogPrintF_safe(&dword_100978048, "-[CBStackControllerBTStack modifyDevice:btDevice:settings:error:]", 30, "setListeningMode: device %@, %s", v11, v80);
    }
    if (qword_100977A88 != -1)
      dispatch_once(&qword_100977A88, &stru_100919980);
    v81 = sub_100279E6C((uint64_t)off_100977A80, (uint64_t)a4, 13, (uint64_t)v79, 2u);
    if (v81)
    {
      v82 = (v81 + 310000);
      if ((_DWORD)v82)
      {
        if (!a6)
          goto LABEL_340;
        v146 = CBErrorF(v82, "set setListeningMode failed");
        v129 = (void *)objc_claimAutoreleasedReturnValue(v146);
        goto LABEL_339;
      }
    }
  }
  v83 = objc_msgSend(v10, "listeningModeConfigs");
  if ((_DWORD)v83)
  {
    if (dword_100978048 <= 30
      && (dword_100978048 != -1 || _LogCategory_Initialize(&dword_100978048, 30)))
    {
      v84 = CUPrintFlags32(v83, &unk_1007388E0);
      v85 = (void *)objc_claimAutoreleasedReturnValue(v84);
      LogPrintF_safe(&dword_100978048, "-[CBStackControllerBTStack modifyDevice:btDevice:settings:error:]", 30, "setListeningModeConfigs: device %@, %@", v11, v85);

    }
    if (qword_100977A88 != -1)
      dispatch_once(&qword_100977A88, &stru_100919980);
    v86 = sub_100279E6C((uint64_t)off_100977A80, (uint64_t)a4, 26, (uint64_t)v83, 2u);
    if (v86)
    {
      v87 = (v86 + 310000);
      if ((_DWORD)v87)
      {
        if (!a6)
          goto LABEL_340;
        v138 = CBErrorF(v87, "set listeningModeConfigs failed");
        v129 = (void *)objc_claimAutoreleasedReturnValue(v138);
        goto LABEL_339;
      }
    }
  }
  v88 = objc_msgSend(v10, "microphoneMode");
  v89 = v88;
  if (v88)
  {
    v90 = v88 == 3 ? 1 : 2 * (v88 == 2);
    if ((_DWORD)v90 != sub_10044F5D0((uint64_t)a4))
    {
      if (dword_100978048 <= 30
        && (dword_100978048 != -1 || _LogCategory_Initialize(&dword_100978048, 30)))
      {
        if (v89 > 3)
          v91 = "?";
        else
          v91 = off_100919C20[v89];
        LogPrintF_safe(&dword_100978048, "-[CBStackControllerBTStack modifyDevice:btDevice:settings:error:]", 30, "setMicMode: device %@, %d (%s)", v11, v90, v91);
      }
      v92 = sub_100421CB4((uint64_t)v151, (uint64_t)a4, v90);
      if (v92)
      {
        v93 = (v92 + 310000);
        if ((_DWORD)v93)
        {
          if (a6)
          {
            v147 = CBErrorF(v93, "setMicMode failed");
            v129 = (void *)objc_claimAutoreleasedReturnValue(v147);
            goto LABEL_339;
          }
LABEL_340:
          v123 = 0;
          goto LABEL_302;
        }
      }
    }
  }
  v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
  if (!objc_msgSend(v94, "length"))
    goto LABEL_215;
  sub_10043F6EC((uint64_t)a4, (uint64_t)__p);
  if (v155 >= 0)
    v95 = __p;
  else
    v95 = (void **)__p[0];
  v96 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v95));
  if (v155 < 0)
    operator delete(__p[0]);
  v97 = v94;
  v98 = v96;
  v99 = v98;
  if (v97 != v98)
  {
    if ((v97 == 0) != (v98 != 0))
    {
      v100 = objc_msgSend(v97, "isEqual:", v98);

      if ((v100 & 1) != 0)
        goto LABEL_214;
    }
    else
    {

    }
    if (dword_100978048 <= 30
      && (dword_100978048 != -1 || _LogCategory_Initialize(&dword_100978048, 30)))
    {
      LogPrintF_safe(&dword_100978048, "-[CBStackControllerBTStack modifyDevice:btDevice:settings:error:]", 30, "setName: device %@, '%@' -> '%@'", v11, v99, v97);
    }
    sub_100091AE8(__p, (char *)objc_msgSend(objc_retainAutorelease(v97), "UTF8String"));
    sub_100440D9C((uint64_t)a4, (uint64_t)__p, 1);
    if (v155 < 0)
      operator delete(__p[0]);
    goto LABEL_214;
  }

LABEL_214:
LABEL_215:
  v101 = objc_msgSend(v10, "placementMode");
  if (v101 && (v101 == 1) != sub_10044F614((uint64_t)a4))
  {
    if (dword_100978048 <= 30
      && (dword_100978048 != -1 || _LogCategory_Initialize(&dword_100978048, 30)))
    {
      v102 = "no";
      if (v101 == 1)
        v102 = "yes";
      LogPrintF_safe(&dword_100978048, "-[CBStackControllerBTStack modifyDevice:btDevice:settings:error:]", 30, "enableInEarDetection: device %@, enabled %s", v11, v102);
    }
    v103 = sub_100422AA8((uint64_t)v151, (uint64_t)a4, v101 == 1);
    if (v103)
    {
      v104 = (v103 + 310000);
      if ((_DWORD)v104)
      {
        if (a6)
        {
          v148 = CBErrorF(v104, "enableInEarDetection failed");
          v140 = (void *)objc_claimAutoreleasedReturnValue(v148);
          goto LABEL_343;
        }
        goto LABEL_346;
      }
    }
  }
  v105 = objc_msgSend(v10, "relinquishAudioRoute");
  if (v105)
  {
    if (dword_100978048 <= 30
      && (dword_100978048 != -1 || _LogCategory_Initialize(&dword_100978048, 30)))
    {
      if (v105 > 2)
        v106 = "?";
      else
        v106 = off_100919C58[v105];
      v107 = "true";
      if (v105 == 1)
        v107 = "false";
      LogPrintF_safe(&dword_100978048, "-[CBStackControllerBTStack modifyDevice:btDevice:settings:error:]", 30, "relinquishAudioRoute: device %@, hijack %s ownership %s", v11, v106, v107);
    }
    if (v105 == 1)
    {
      if (qword_100977A88 != -1)
        dispatch_once(&qword_100977A88, &stru_100919980);
      v108 = sub_10028F694((uint64_t)off_100977A80, (uint64_t)a4, 1);
      if (!v108)
        goto LABEL_250;
    }
    else
    {
      if (dword_100978048 <= 30
        && (dword_100978048 != -1 || _LogCategory_Initialize(&dword_100978048, 30)))
      {
        LogPrintF_safe(&dword_100978048, "-[CBStackControllerBTStack modifyDevice:btDevice:settings:error:]", 30, "relinquishAudioRoute: telling Wx without notifying HAL/MX");
      }
      if (qword_100977A88 != -1)
        dispatch_once(&qword_100977A88, &stru_100919980);
      v109 = off_100977A80;
      sub_10046E9BC((unsigned __int8 *)a4 + 128, v152);
      v110 = sub_10027BFB4((uint64_t)v109, (unsigned __int8 *)v152, 1);
      v108 = v110;
      if (v153 < 0)
      {
        operator delete(v152[0]);
        if (!v108)
          goto LABEL_250;
      }
      else if (!v110)
      {
        goto LABEL_250;
      }
    }
    if (v108 != -310000)
    {
      if (!a6)
        goto LABEL_346;
      v139 = CBErrorF((v108 + 310000), "setHijackAudioRoute failed");
      v140 = (void *)objc_claimAutoreleasedReturnValue(v139);
LABEL_343:
      v123 = 0;
      *a6 = v140;
      goto LABEL_301;
    }
  }
LABEL_250:
  v111 = objc_msgSend(v10, "selectiveSpeechListeningConfig");
  if ((_DWORD)v111)
  {
    if (dword_100978048 <= 30
      && (dword_100978048 != -1 || _LogCategory_Initialize(&dword_100978048, 30)))
    {
      v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
      LogPrintF_safe(&dword_100978048, "-[CBStackControllerBTStack modifyDevice:btDevice:settings:error:]", 30, "selectiveSpeechListeningConfig sendControlCommand for %@: device %@, value 0x%04X", v112, v11, v111);

    }
    if (qword_100977A88 != -1)
      dispatch_once(&qword_100977A88, &stru_100919980);
    v113 = sub_100279E6C((uint64_t)off_100977A80, (uint64_t)a4, 41, (uint64_t)v111, 2u);
    if (v113)
    {
      v114 = (v113 + 310000);
      if ((_DWORD)v114)
      {
        if (!a6)
          goto LABEL_346;
        v141 = CBErrorF(v114, "set selectiveSpeechListeningConfig failed");
        v140 = (void *)objc_claimAutoreleasedReturnValue(v141);
        goto LABEL_343;
      }
    }
  }
  v115 = objc_msgSend(v10, "smartRoutingMode");
  if (v115 == 1)
    v116 = 1;
  else
    v116 = 2 * (v115 == 2);
  if ((_DWORD)v116 && (_DWORD)v116 != sub_10044F658((uint64_t)a4))
  {
    if (dword_100978048 <= 30
      && (dword_100978048 != -1 || _LogCategory_Initialize(&dword_100978048, 30)))
    {
      if (v115 > 2)
        v117 = "?";
      else
        v117 = off_100919C40[v115];
      LogPrintF_safe(&dword_100978048, "-[CBStackControllerBTStack modifyDevice:btDevice:settings:error:]", 30, "setSmartRouteMode: device %@, %d (%s)", v11, v116, v117);
    }
    sub_10044D524((uint64_t)a4, v116);
  }
  v118 = (uint64_t)objc_msgSend(v10, "spatialAudioAllowed");
  if ((_DWORD)v118)
  {
    LODWORD(__p[0]) = 0;
    if (qword_1009778E8 != -1)
      dispatch_once(&qword_1009778E8, &stru_100919960);
    sub_10047134C((uint64_t)off_1009778E0, (uint64_t)a4, __p);
    if (SLOBYTE(__p[0]) != (_DWORD)v118)
    {
      if (dword_100978048 <= 30
        && (dword_100978048 != -1 || _LogCategory_Initialize(&dword_100978048, 30)))
      {
        if (v118 > 2)
          v119 = "?";
        else
          v119 = off_100919C58[(int)v118];
        LogPrintF_safe(&dword_100978048, "-[CBStackControllerBTStack modifyDevice:btDevice:settings:error:]", 30, "setSpatialAudioAllowed: device %@, %s", v11, v119);
      }
      v120 = sub_100422220((uint64_t)v151, (uint64_t)a4, v118);
      if (v120)
      {
        v121 = (v120 + 310000);
        if ((_DWORD)v121)
        {
          if (a6)
          {
            v149 = CBErrorF(v121, "setSpatialAudioAllowed failed");
            *a6 = (id)objc_claimAutoreleasedReturnValue(v149);
          }
          goto LABEL_346;
        }
      }
    }
  }
  v122 = (uint64_t)objc_msgSend(v10, "spatialAudioMode");
  if ((_DWORD)v122 != 255)
  {
    if (dword_100978048 <= 30
      && (dword_100978048 != -1 || _LogCategory_Initialize(&dword_100978048, 30)))
    {
      if (v122 > 3)
        v124 = "?";
      else
        v124 = off_100919C70[(int)v122];
      LogPrintF_safe(&dword_100978048, "-[CBStackControllerBTStack modifyDevice:btDevice:settings:error:]", 30, "setSpatialAudioMode: device %@, %s", v11, v124);
    }
    v125 = sub_1004227D4((uint64_t)v151, (uint64_t)a4, CFSTR("global"), v122, -1);
    v123 = 1;
    if (!v125)
      goto LABEL_301;
    v126 = (v125 + 310000);
    if (!(_DWORD)v126)
      goto LABEL_301;
    if (a6)
    {
      v145 = CBErrorF(v126, "setSpatialAudioMode failed");
      v140 = (void *)objc_claimAutoreleasedReturnValue(v145);
      goto LABEL_343;
    }
LABEL_346:
    v123 = 0;
    goto LABEL_301;
  }
  v123 = 1;
LABEL_301:

LABEL_302:
  return v123;
}

- (BOOL)modifyDevice:(id)a3 leDevice:(void *)a4 settings:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *btSessionPtr;
  __int128 *p_dst;
  void *v14;
  id v15;
  id v16;
  void *v17;
  unsigned __int8 v18;
  id v19;
  void *v20;
  uint64_t v21;
  unsigned int v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  unsigned __int8 v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  uint64_t v41;
  id v42;
  BOOL v43;
  void *v44;
  uint64_t v46;
  id v47;
  void *v48;
  _QWORD v49[4];
  id v50;
  id v51;
  _QWORD v52[4];
  id v53;
  id v54;
  id v55;
  unsigned __int8 v56;
  _QWORD v57[7];
  __int128 __dst;
  uint64_t v59;

  v10 = a3;
  v11 = a5;
  v47 = v11;
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
  if (!v48)
    goto LABEL_24;
  btSessionPtr = self->_btSessionPtr;
  if (btSessionPtr)
  {
    if (*((char *)a4 + 127) < 0)
    {
      sub_10003430C(&__dst, *((void **)a4 + 13), *((_QWORD *)a4 + 14));
    }
    else
    {
      __dst = *(_OWORD *)((char *)a4 + 104);
      v59 = *((_QWORD *)a4 + 15);
    }
    if (v59 >= 0)
      p_dst = &__dst;
    else
      p_dst = (__int128 *)__dst;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", p_dst));
    if (SHIBYTE(v59) < 0)
      operator delete((void *)__dst);
    v15 = v48;
    v16 = v14;
    v17 = v16;
    if (v15 == v16)
    {

    }
    else
    {
      if (v16)
      {
        v18 = objc_msgSend(v15, "isEqual:", v16);

        if ((v18 & 1) != 0)
          goto LABEL_23;
      }
      else
      {

      }
      v19 = *(id *)a4;
      if (dword_100978048 <= 30
        && (dword_100978048 != -1 || _LogCategory_Initialize(&dword_100978048, 30)))
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "UUIDString"));
        LogPrintF_safe(&dword_100978048, "-[CBStackControllerBTStack modifyDevice:leDevice:settings:error:]", 30, "setName: device %@, '%@' -> '%@'", v20, v17, v15);

      }
      v21 = sub_1000419F4();
      v57[0] = _NSConcreteStackBlock;
      v57[1] = 3221225472;
      v57[2] = sub_1000D3480;
      v57[3] = &unk_100919500;
      v57[4] = v15;
      v57[5] = v19;
      v57[6] = btSessionPtr;
      sub_100041A34(v21, v57);
      v15 = v19;
    }

LABEL_23:
    v11 = v47;
LABEL_24:
    v22 = objc_msgSend(v10, "internalFlags") & 0x400;
    if (dword_100978048 <= 40
      && (dword_100978048 != -1 || _LogCategory_Initialize(&dword_100978048, 40)))
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
      v24 = *(id *)a4;
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "controllerInfo"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", objc_msgSend(v25, "fastLEConnectionInfoVersion")));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "controllerInfo"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "fastLEConnectionInfoData"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "controllerInfo"));
      LogPrintF_safe(&dword_100978048, "-[CBStackControllerBTStack modifyDevice:leDevice:settings:error:]", 40, "FastLEConnection:modifyDevice changed:%d cloudID:%@ deviceUUID:%@ inDevice.controllerInfo.fastLEConnectionInfoVersion %@ data:%@ allowed:%d", v22 >> 10, v23, v24, v26, v28, objc_msgSend(v29, "fastLEConnectionAllowed"));

      v11 = v47;
    }
    v30 = *(id *)a4;
    if (v22)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "controllerInfo"));
      v32 = objc_msgSend(v31, "fastLEConnectionInfoVersion");

      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "controllerInfo"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "fastLEConnectionInfoData"));

      v35 = sub_1000419F4();
      v52[0] = _NSConcreteStackBlock;
      v52[1] = 3221225472;
      v52[2] = sub_1000D3674;
      v52[3] = &unk_1009188B0;
      v53 = v30;
      v56 = v32;
      v36 = v34;
      v54 = v36;
      v55 = v10;
      sub_100041A34(v35, v52);

    }
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "model"));
    if (v37)
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "model"));
      v39 = objc_msgSend(v38, "length");

      if (v39)
      {
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "model"));
        v41 = sub_1000419F4();
        v49[0] = _NSConcreteStackBlock;
        v49[1] = 3221225472;
        v49[2] = sub_1000D3748;
        v49[3] = &unk_100918340;
        v50 = v30;
        v51 = v40;
        v42 = v40;
        sub_100041A34(v41, v49);

      }
    }

    v43 = 1;
    goto LABEL_34;
  }
  if (a6)
  {
    v44 = v48;
    v46 = CBErrorF(4294960534, "No BT session");
    v43 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue(v46);
    goto LABEL_35;
  }
  v43 = 0;
LABEL_34:
  v44 = v48;
LABEL_35:

  return v43;
}

- (void)_modifyDeviceCompleteRequest:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  if (dword_100978048 <= 30 && (dword_100978048 != -1 || _LogCategory_Initialize(&dword_100978048, 30)))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "device"));
    v8 = CUPrintNSError(v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    LogPrintF_safe(&dword_100978048, "-[CBStackControllerBTStack _modifyDeviceCompleteRequest:error:]", 30, "ModifyDevice CnxPri completed: %@, %@", v7, v9);

  }
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "timer"));
  v11 = v14;
  if (v10)
  {
    dispatch_source_cancel(v10);
    objc_msgSend(v14, "setTimer:", 0);
    v11 = v14;
  }
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "completionHandler"));
  v13 = (void *)v12;
  if (v12)
  {
    (*(void (**)(uint64_t, id))(v12 + 16))(v12, v6);
    objc_msgSend(v14, "setCompletionHandler:", 0);
  }
  -[NSMutableSet removeObject:](self->_modifyDeviceRequests, "removeObject:", v14);

}

- (void)performDeviceRequest:(id)a3 device:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  CBStackControllerBTStack *v11;
  id v12;
  _QWORD *v13;
  uint64_t v14;
  unsigned int v15;
  unsigned int v16;
  unsigned __int16 *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  int v49;
  uint64_t v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  CBStackPerformDeviceRequest *v56;
  NSObject *v57;
  double v58;
  NSMutableSet *performDeviceRequests;
  NSMutableSet *v60;
  NSMutableSet **p_performDeviceRequests;
  NSMutableSet *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  uint64_t *v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  _QWORD *v98;
  id v99;
  unsigned int v100;
  id v101;
  id v102;
  id v103;
  uint64_t v104;
  id v105;
  void *v106;
  _QWORD handler[7];
  int v108;
  __int16 v109;
  _QWORD v110[5];
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  int v115;
  __int16 v116;
  _QWORD v117[4];
  id v118;
  uint64_t *v119;
  uint64_t v120;
  uint64_t *v121;
  uint64_t v122;
  uint64_t (*v123)(uint64_t, uint64_t);
  void (*v124)(uint64_t);
  id v125;
  uint64_t v126;
  uint64_t *v127;
  uint64_t v128;
  uint64_t v129;
  _BYTE v130[128];
  _QWORD v131[2];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v120 = 0;
  v121 = &v120;
  v122 = 0x3032000000;
  v123 = sub_10006250C;
  v124 = sub_100062340;
  v125 = 0;
  v117[0] = _NSConcreteStackBlock;
  v117[1] = 3221225472;
  v117[2] = sub_1000D46E8;
  v117[3] = &unk_100919460;
  v119 = &v120;
  v12 = v10;
  v118 = v12;
  v13 = objc_retainBlock(v117);
  if (qword_100977A58 != -1)
    dispatch_once(&qword_100977A58, &stru_100919880);
  if (!*((_BYTE *)off_100977A50 + 60))
  {
    v63 = CBErrorF(4294896144, "Bluetooth off");
    v64 = objc_claimAutoreleasedReturnValue(v63);
    v103 = (id)v121[5];
    v121[5] = v64;

    goto LABEL_100;
  }
  v102 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
  if (!v102)
  {
    v65 = CBErrorF(4294960588, "No device ID");
    v66 = objc_claimAutoreleasedReturnValue(v65);
    v67 = (void *)v121[5];
    v121[5] = v66;

    goto LABEL_99;
  }
  v116 = 0;
  v115 = 0;
  v101 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v102);
  if (!v101)
  {
    if (!TextToHardwareAddress(objc_msgSend(objc_retainAutorelease(v102), "UTF8String"), -1, 6, &v115))goto LABEL_11;
    v89 = CBErrorF(4294960569, "Device address not found");
    v69 = objc_claimAutoreleasedReturnValue(v89);
LABEL_115:
    v106 = (void *)v121[5];
    v121[5] = v69;

    goto LABEL_98;
  }
  if (qword_1009778C8 != -1)
    dispatch_once(&qword_1009778C8, &stru_100919940);
  v14 = sub_1000589DC((uint64_t)off_1009778C0, v101, 0);
  if (!v14)
  {
    v68 = CBErrorF(4294960569, "Device UUID not found");
    v69 = objc_claimAutoreleasedReturnValue(v68);
    goto LABEL_115;
  }
  LOBYTE(v115) = BYTE5(v14);
  BYTE1(v115) = BYTE4(v14);
  BYTE2(v115) = BYTE3(v14);
  HIBYTE(v115) = BYTE2(v14);
  LOBYTE(v116) = BYTE1(v14);
  HIBYTE(v116) = v14;
LABEL_11:
  if (dword_100978048 <= 20 && (dword_100978048 != -1 || _LogCategory_Initialize(&dword_100978048, 20)))
    LogPrintF_safe(&dword_100978048, "-[CBStackControllerBTStack performDeviceRequest:device:completionHandler:]", 20, "PerformDeviceRequest start: %@, %@", v9, v8);
  v105 = objc_alloc_init((Class)CBDeviceResponse);
  v15 = objc_msgSend(v8, "requestFlags");
  v16 = v15;
  if ((v15 & 0x28) == 0)
  {
    v100 = 0;
    v104 = 0;
    if ((v15 & 0x40) == 0)
      goto LABEL_18;
LABEL_21:
    v131[0] = 0;
    v131[1] = 0;
    if (qword_1009778C8 != -1)
      dispatch_once(&qword_1009778C8, &stru_100919940);
    sub_10065A6B4((uint64_t)off_1009778C0, (unsigned __int8 *)&v115, (unsigned __int8 *)v131);
    v19 = sub_100030DF4((const unsigned __int8 *)v131);
    v20 = (id)objc_claimAutoreleasedReturnValue(v19);
    if (!v20)
    {
      v113 = 0u;
      v114 = 0u;
      v111 = 0u;
      v112 = 0u;
      if (qword_1009778B8 != -1)
        dispatch_once(&qword_1009778B8, &stru_100919A20);
      v99 = v8;
      v98 = v13;
      v21 = sub_10006A768(qword_1009778B0);
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v111, v130, 16);
      if (!v23)
      {
LABEL_40:

        v8 = v99;
        v13 = v98;
LABEL_41:
        v29 = CBErrorF(4294960588, "Device not found");
        v30 = objc_claimAutoreleasedReturnValue(v29);
        v31 = (void *)v121[5];
        v121[5] = v30;

        goto LABEL_97;
      }
      v24 = *(_QWORD *)v112;
LABEL_28:
      v25 = 0;
      while (1)
      {
        if (*(_QWORD *)v112 != v24)
          objc_enumerationMutation(v22);
        v26 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * v25);
        v126 = 0;
        v127 = &v126;
        v128 = 0x2020000000;
        v129 = 0;
        if (qword_1009778C8 != -1)
          dispatch_once(&qword_1009778C8, &stru_100919940);
        v110[0] = _NSConcreteStackBlock;
        v110[1] = 3221225472;
        v110[2] = sub_1000D47C8;
        v110[3] = &unk_100917358;
        v110[4] = &v126;
        sub_10065E6EC((uint64_t)off_1009778C0, v26, v110);
        v27 = v127[3];
        if (v27)
        {
          LOBYTE(v108) = (unsigned __int16)WORD2(v127[3]) >> 8;
          BYTE1(v108) = BYTE4(v27);
          BYTE2(v108) = BYTE3(v27);
          HIBYTE(v108) = BYTE2(v27);
          LOBYTE(v109) = BYTE1(v27);
          HIBYTE(v109) = v27;
          if (v108 == v115 && v109 == v116)
            break;
        }
        _Block_object_dispose(&v126, 8);
        if (v23 == (id)++v25)
        {
          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v111, v130, 16);
          if (v23)
            goto LABEL_28;
          goto LABEL_40;
        }
      }
      v20 = v26;
      _Block_object_dispose(&v126, 8);

      v8 = v99;
      v13 = v98;
      if (!v20)
        goto LABEL_41;
    }
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "UUIDString"));
    objc_msgSend(v105, "setIdentifier:", v32);

    v18 = v100 | 0x40;
    if ((v16 & 1) == 0)
      goto LABEL_50;
    goto LABEL_44;
  }
  LOBYTE(v126) = 0;
  sub_100043758(&v126);
  v17 = (unsigned __int16 *)sub_10019B008((uint64_t)&v115);
  v104 = (uint64_t)v17;
  if (!v17)
  {
    v70 = CBErrorF(4294960543, "Device not connected");
    v71 = objc_claimAutoreleasedReturnValue(v70);
    v72 = (void *)v121[5];
    v121[5] = v71;

    goto LABEL_122;
  }
  objc_msgSend(v105, "setConnectionHandle:", sub_10019ADE8(v17));
  sub_100043728(&v126);
  v100 = 8;
  if ((v16 & 0x40) != 0)
    goto LABEL_21;
LABEL_18:
  v18 = v100;
  if ((v16 & 1) == 0)
    goto LABEL_50;
LABEL_44:
  LOBYTE(v126) = 0;
  v33 = sub_1000438A4();
  if ((*(unsigned int (**)(uint64_t, int *, uint64_t *))(*(_QWORD *)v33 + 320))(v33, &v115, &v126))
  {
    LOBYTE(v131[0]) = 0;
    sub_100043758(v131);
    v34 = sub_10019B008((uint64_t)&v115);
    if (v34)
    {
      v35 = sub_100192918((uint64_t)sub_1000D47DC);
      v104 = v34;
      if (!v35 || (v36 = (v35 + 330000), !(_DWORD)v36))
      {
        sub_100043728(v131);
        goto LABEL_50;
      }
      v92 = CBErrorF(v36, "Read RSSI start failed");
      v91 = objc_claimAutoreleasedReturnValue(v92);
    }
    else
    {
      v90 = CBErrorF(4294960543, "Device not connected");
      v91 = objc_claimAutoreleasedReturnValue(v90);
    }
    v93 = (void *)v121[5];
    v121[5] = v91;

    v94 = v131;
LABEL_123:
    sub_100043728(v94);
    goto LABEL_97;
  }
  objc_msgSend(v105, "setRssi:", (char)v126);
  v18 = v18 | 1;
LABEL_50:
  if ((v16 & 6) != 0)
  {
    LOBYTE(v126) = 0;
    sub_100043758(&v126);
    v104 = sub_10019B008((uint64_t)&v115);
    if (!v104)
    {
LABEL_105:
      v73 = CBErrorF(4294960543, "Device not connected");
      v74 = objc_claimAutoreleasedReturnValue(v73);
LABEL_121:
      v97 = (void *)v121[5];
      v121[5] = v74;

      goto LABEL_122;
    }
    if ((v16 & 2) != 0)
    {
      v42 = sub_100192BF4((uint64_t (*)())sub_1000D4894, v104, 0, v37, v38, v39, v40, v41);
      if (v42)
      {
        v43 = (v42 + 330000);
        if ((_DWORD)v43)
        {
          v95 = CBErrorF(v43, "ReadTransmitPowerLevel current failed");
          v74 = objc_claimAutoreleasedReturnValue(v95);
          goto LABEL_121;
        }
      }
    }
    if ((v16 & 4) != 0)
    {
      v44 = sub_100192BF4((uint64_t (*)())sub_1000D494C, v104, 1, v37, v38, v39, v40, v41);
      if (v44)
      {
        v45 = (v44 + 330000);
        if ((_DWORD)v45)
        {
          v96 = CBErrorF(v45, "ReadTransmitPowerLevel max failed");
          v74 = objc_claimAutoreleasedReturnValue(v96);
          goto LABEL_121;
        }
      }
    }
    sub_100043728(&v126);
  }
  if ((v16 & 0x20) == 0)
    goto LABEL_64;
  LODWORD(v127) = 0;
  v126 = 0;
  LOBYTE(v131[0]) = 0;
  v46 = sub_1000438A4();
  v47 = (*(uint64_t (**)(uint64_t, id, uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)v46 + 1680))(v46, objc_msgSend(v105, "connectionHandle"), &v126, v131, 1);
  if (v47)
  {
    v48 = (v47 + 310000);
    if ((_DWORD)v48)
    {
      v75 = CBErrorF(v48, "ReadPowerCapState failed");
      v76 = objc_claimAutoreleasedReturnValue(v75);
LABEL_108:
      v78 = (void *)v121[5];
      v121[5] = v76;

      goto LABEL_97;
    }
  }
  if (LOBYTE(v131[0]) != 12)
  {
    v77 = CBErrorF(0, "ReadPowerCapState bad length: %d", LOBYTE(v131[0]));
    v76 = objc_claimAutoreleasedReturnValue(v77);
    goto LABEL_108;
  }
  objc_msgSend(v105, "setCurrentPCAP:", SBYTE4(v126));
  objc_msgSend(v105, "setCore0TargetPower:", SBYTE2(v127));
  objc_msgSend(v105, "setCore1TargetPower:", SBYTE3(v127));
  v18 = v18 | 0x20;
LABEL_64:
  if ((v16 & 0x80) != 0)
  {
    if (qword_100978180 != -1)
      dispatch_once(&qword_100978180, &stru_100919AC0);
    v49 = sub_1003C0728(qword_100978178, (uint64_t)&v115, 5, 1u);
    if (v49)
    {
      v50 = (v49 + 310000);
      if ((_DWORD)v50)
      {
        v79 = CBErrorF(v50, "Send LogReport failed");
        v80 = objc_claimAutoreleasedReturnValue(v79);
        v81 = (void *)v121[5];
        v121[5] = v80;

        goto LABEL_97;
      }
    }
    v18 = v18 | 0x80;
  }
  if ((v16 & 0x100) == 0)
  {
LABEL_76:
    if ((v16 & 0x200) == 0)
      goto LABEL_79;
    LOBYTE(v126) = 0;
    sub_100043758(&v126);
    v53 = sub_10019AEA4((uint64_t)&v115);
    if (v53)
    {
      objc_msgSend(v105, "setSniffInterval:", 625 * *(unsigned __int16 *)(v53 + 136));
      v18 = v18 | 0x200;
      sub_100043728(&v126);
LABEL_79:
      if ((v16 & 0x400) == 0)
        goto LABEL_86;
      LOBYTE(v126) = 0;
      sub_100043758(&v126);
      v104 = sub_10019B008((uint64_t)&v115);
      if (v104)
      {
        v54 = sub_1000438A4();
        if (((*(uint64_t (**)(uint64_t))(*(_QWORD *)v54 + 2496))(v54) & 1) != 0)
        {
          if (*(unsigned __int8 *)(v104 + 289) <= 1u)
            v55 = 1;
          else
            v55 = *(unsigned __int8 *)(v104 + 289);
          objc_msgSend(v105, "setBtBand:", v55);
          v18 = v18 | 0x400;
          sub_100043728(&v126);
LABEL_86:
          if ((v16 & ~(_DWORD)v18) != 0)
          {
            v56 = objc_alloc_init(CBStackPerformDeviceRequest);
            -[CBStackPerformDeviceRequest setDevice:](v56, "setDevice:", v9);
            -[CBStackPerformDeviceRequest setCompletedFlags:](v56, "setCompletedFlags:", v18);
            -[CBStackPerformDeviceRequest setCompletionHandler:](v56, "setCompletionHandler:", v12);
            -[CBStackPerformDeviceRequest setConnectionHandle:](v56, "setConnectionHandle:", v104);
            -[CBStackPerformDeviceRequest setRequest:](v56, "setRequest:", v8);
            -[CBStackPerformDeviceRequest setResponse:](v56, "setResponse:", v105);
            v57 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)v11->_dispatchQueue);
            -[CBStackPerformDeviceRequest setTimer:](v56, "setTimer:", v57);
            handler[0] = _NSConcreteStackBlock;
            handler[1] = 3221225472;
            handler[2] = sub_1000D4A04;
            handler[3] = &unk_100919488;
            handler[4] = v57;
            handler[5] = v56;
            handler[6] = v11;
            dispatch_source_set_event_handler(v57, handler);
            objc_msgSend(v8, "timeoutSeconds");
            if (v58 <= 0.0)
              v58 = 10.0;
            CUDispatchTimerSet(v57, v58, -1.0, 1.0);
            dispatch_activate(v57);
            performDeviceRequests = v11->_performDeviceRequests;
            if (!performDeviceRequests)
            {
              v60 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
              v62 = v11->_performDeviceRequests;
              p_performDeviceRequests = &v11->_performDeviceRequests;
              *p_performDeviceRequests = v60;

              performDeviceRequests = *p_performDeviceRequests;
            }
            -[NSMutableSet addObject:](performDeviceRequests, "addObject:", v56);

          }
          else
          {
            if (dword_100978048 <= 20
              && (dword_100978048 != -1 || _LogCategory_Initialize(&dword_100978048, 20)))
            {
              LogPrintF_safe(&dword_100978048, "-[CBStackControllerBTStack performDeviceRequest:device:completionHandler:]", 20, "PerformDeviceRequest completed: %@, %@, %@", v9, v8, v105);
            }
            (*((void (**)(id, id, _QWORD))v12 + 2))(v12, v105, 0);
          }
          goto LABEL_97;
        }
        v88 = CBErrorF(4294960561, "HRB is not supported");
        v74 = objc_claimAutoreleasedReturnValue(v88);
        goto LABEL_121;
      }
      goto LABEL_105;
    }
    v85 = CBErrorF(4294960543, "Device not connected");
    v86 = objc_claimAutoreleasedReturnValue(v85);
    v87 = (void *)v121[5];
    v121[5] = v86;

LABEL_122:
    v94 = &v126;
    goto LABEL_123;
  }
  if (qword_100978180 != -1)
    dispatch_once(&qword_100978180, &stru_100919AC0);
  v51 = sub_1003C0728(qword_100978178, (uint64_t)&v115, 6, 1u);
  if (!v51 || (v52 = (v51 + 310000), !(_DWORD)v52))
  {
    v18 = v18 | 0x100;
    goto LABEL_76;
  }
  v82 = CBErrorF(v52, "Send LogClear failed");
  v83 = objc_claimAutoreleasedReturnValue(v82);
  v84 = (void *)v121[5];
  v121[5] = v83;

LABEL_97:
LABEL_98:

LABEL_99:
LABEL_100:
  ((void (*)(_QWORD *))v13[2])(v13);

  _Block_object_dispose(&v120, 8);
}

- (void)_completePerformDeviceRequest:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  if (dword_100978048 <= 20 && (dword_100978048 != -1 || _LogCategory_Initialize(&dword_100978048, 20)))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "device"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "request"));
    v9 = CUPrintNSError(v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    LogPrintF_safe(&dword_100978048, "-[CBStackControllerBTStack _completePerformDeviceRequest:error:]", 20, "PerformDeviceRequest completed: %@, %@, %@", v7, v8, v10);

  }
  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "timer"));
  v12 = v15;
  if (v11)
  {
    dispatch_source_cancel(v11);
    objc_msgSend(v15, "setTimer:", 0);
    v12 = v15;
  }
  v13 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "completionHandler"));
  if (v13)
  {
    if (v6)
      v14 = 0;
    else
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "response"));
    ((void (**)(_QWORD, void *, id))v13)[2](v13, v14, v6);
    if (!v6)

    objc_msgSend(v15, "setCompletionHandler:", 0);
  }
  -[NSMutableSet removeObject:](self->_performDeviceRequests, "removeObject:", v15);

}

- (void)_readRSSIWithConnectionHandle:(_OI_HCI_CONNECTION *)a3 status:(int)a4 rssi:(char)a5
{
  void *v7;
  id v8;
  uint64_t v9;
  int v10;
  _BOOL4 v11;
  void *i;
  void *v13;
  void *v14;
  unsigned int v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  unsigned int v19;
  uint64_t v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v20 = a5;
  if (dword_100978048 <= 20 && (dword_100978048 != -1 || _LogCategory_Initialize(&dword_100978048, 20)))
    LogPrintF_safe(&dword_100978048, "-[CBStackControllerBTStack _readRSSIWithConnectionHandle:status:rssi:]", 20, "ReadRSSI completed: Status %d, RSSI %d, Requests %d", a4, v20, -[NSMutableSet count](self->_performDeviceRequests, "count"));
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](self->_performDeviceRequests, "allObjects"));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v23;
    v10 = a4 + 330000;
    if (!a4)
      v10 = -6700;
    v19 = v10;
    if ((_DWORD)v20)
      v11 = a4 != 0;
    else
      v11 = 1;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v13, "connectionHandle") == a3)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "request"));
          v15 = objc_msgSend(v14, "requestFlags");

          if ((v15 & 1) != 0)
          {
            if (v11)
            {
              v16 = CBErrorF(v19, "ReadRSSI failed");
              v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
              -[CBStackControllerBTStack _completePerformDeviceRequest:error:](self, "_completePerformDeviceRequest:error:", v13, v17);
            }
            else
            {
              v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "response"));
              objc_msgSend(v17, "setRssi:", v20);
              v18 = objc_msgSend(v13, "completedFlags") | 1;
              objc_msgSend(v13, "setCompletedFlags:", v18);
              if ((v15 & ~(_DWORD)v18) == 0)
                -[CBStackControllerBTStack _completePerformDeviceRequest:error:](self, "_completePerformDeviceRequest:error:", v13, 0);
            }

          }
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v8);
  }

}

- (void)_readTxPowerWithFlags:(unsigned int)a3 status:(int)a4 connectionHandle:(_OI_HCI_CONNECTION *)a5 txPowerLevel:(char)a6
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  unsigned int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v21 = a6;
  v7 = *(_QWORD *)&a4;
  if (dword_100978048 <= 20 && (dword_100978048 != -1 || _LogCategory_Initialize(&dword_100978048, 20)))
  {
    v8 = CUPrintFlags32(a3, &unk_100738906);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    LogPrintF_safe(&dword_100978048, "-[CBStackControllerBTStack _readTxPowerWithFlags:status:connectionHandle:txPowerLevel:]", 20, "ReadTxPower completed: Flags %@, Status %d, TxPower %d, Requests %d", v9, v7, (int)v21, -[NSMutableSet count](self->_performDeviceRequests, "count"));

  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](self->_performDeviceRequests, "allObjects"));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v14, "connectionHandle") == a5)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "request"));
          v16 = objc_msgSend(v15, "requestFlags");

          if ((v16 & a3) != 0)
          {
            if ((_DWORD)v7)
            {
              v17 = CBErrorF((v7 + 330000), "ReadTransmitPowerLevel failed");
              v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
              -[CBStackControllerBTStack _completePerformDeviceRequest:error:](self, "_completePerformDeviceRequest:error:", v14, v18);
            }
            else
            {
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "response"));
              v18 = v19;
              if ((a3 & 2) != 0)
                objc_msgSend(v19, "setTxPower:", v21);
              if ((a3 & 4) != 0)
                objc_msgSend(v18, "setTxPowerMax:", v21);
              v20 = objc_msgSend(v14, "completedFlags") | a3;
              objc_msgSend(v14, "setCompletedFlags:", v20);
              if ((v16 & ~(_DWORD)v20) == 0)
                -[CBStackControllerBTStack _completePerformDeviceRequest:error:](self, "_completePerformDeviceRequest:error:", v14, 0);
            }

          }
        }
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v11);
  }

}

- (BOOL)sendRelayMessageType:(unsigned __int8)a3 messageData:(id)a4 conduitDevice:(id)a5 destinationDevice:(id)a6 error:(id *)a7
{
  int v10;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  unsigned __int16 v21;
  int v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  __int16 v32;

  v10 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
  v16 = -[CBStackControllerBTStack _btDeviceWithID:error:](self, "_btDeviceWithID:error:", v15, a7);

  if (!v16)
  {
    v23 = 0;
    goto LABEL_10;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier"));
  v18 = v17;
  if (v17)
  {
    v32 = 0;
    v31 = 0;
    v19 = objc_retainAutorelease(v17);
    if (TextToHardwareAddress(objc_msgSend(v19, "UTF8String"), -1, 6, &v31))
    {
      if (!a7)
        goto LABEL_21;
      v28 = CBErrorF(4294960591, "Bad destination address: '%@'", v19);
      v27 = (void *)objc_claimAutoreleasedReturnValue(v28);
    }
    else
    {
      v20 = objc_msgSend(v12, "length");
      v21 = (unsigned __int16)v20;
      if ((unint64_t)v20 < 0x3E7)
      {
        if (qword_100977A88 != -1)
          dispatch_once(&qword_100977A88, &stru_100919980);
        v22 = sub_10027C7D0((uint64_t)off_100977A80, (uint64_t)v16, (uint64_t)&v31, v10, v21, objc_msgSend(objc_retainAutorelease(v12), "bytes"));
        v23 = 1;
        if (!v22)
          goto LABEL_9;
        v24 = (v22 + 310000);
        if (!(_DWORD)v24)
          goto LABEL_9;
        if (a7)
        {
          v30 = CBErrorF(v24, "AACP sendRelayMsg failed");
          v27 = (void *)objc_claimAutoreleasedReturnValue(v30);
          goto LABEL_20;
        }
LABEL_21:
        v23 = 0;
        goto LABEL_9;
      }
      if (!a7)
        goto LABEL_21;
      v29 = CBErrorF(4294960553, "Relay message too big: %zu vs %u", (size_t)v20, 998);
      v27 = (void *)objc_claimAutoreleasedReturnValue(v29);
    }
  }
  else
  {
    if (!a7)
      goto LABEL_21;
    v26 = CBErrorF(4294960591, "No destination address");
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  }
LABEL_20:
  v23 = 0;
  *a7 = v27;
LABEL_9:

LABEL_10:
  return v23;
}

- (BOOL)sendSmartRoutingInformation:(id)a3 device:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  int v14;
  uint64_t v15;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
  if (!v10)
  {
    if (!a5)
      goto LABEL_20;
    v17 = CBErrorF(4294960588, "No device ID");
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
LABEL_19:
    LOBYTE(v11) = 0;
    *a5 = v18;
    goto LABEL_12;
  }
  v11 = -[CBStackControllerBTStack _btDeviceWithID:error:](self, "_btDeviceWithID:error:", v10, 0);
  if (!v11)
    goto LABEL_12;
  v12 = objc_msgSend(v8, "length");
  v13 = v12;
  if (v12 >= 0x3E7)
  {
    if (!a5)
      goto LABEL_20;
    v19 = CBErrorF(4294960553, "AACP message too big: %u vs %u", (_DWORD)v12, 998);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v19);
    goto LABEL_19;
  }
  if (dword_100978048 <= 30 && (dword_100978048 != -1 || _LogCategory_Initialize(&dword_100978048, 30)))
    LogPrintF_safe(&dword_100978048, "-[CBStackControllerBTStack sendSmartRoutingInformation:device:error:]", 30, "SendSmartRoutingInformation: device %@ with length %hu", v10, v13);
  if (qword_100977A88 != -1)
    dispatch_once(&qword_100977A88, &stru_100919980);
  v14 = sub_100286660((uint64_t)off_100977A80, (uint64_t)v11, objc_msgSend(objc_retainAutorelease(v8), "bytes"), (unsigned __int16)v13);
  LOBYTE(v11) = 1;
  if (v14)
  {
    v15 = (v14 + 310000);
    if ((_DWORD)v15)
    {
      if (a5)
      {
        v20 = CBErrorF(v15, "SendSmartRoutingInformation failed");
        v18 = (void *)objc_claimAutoreleasedReturnValue(v20);
        goto LABEL_19;
      }
LABEL_20:
      LOBYTE(v11) = 0;
    }
  }
LABEL_12:

  return (char)v11;
}

- (BOOL)sendConversationDetectMessage:(id)a3 device:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  int v14;
  uint64_t v15;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
  if (!v10)
  {
    if (!a5)
      goto LABEL_20;
    v17 = CBErrorF(4294960588, "No device ID");
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
LABEL_19:
    LOBYTE(v11) = 0;
    *a5 = v18;
    goto LABEL_12;
  }
  v11 = -[CBStackControllerBTStack _btDeviceWithID:error:](self, "_btDeviceWithID:error:", v10, 0);
  if (!v11)
    goto LABEL_12;
  v12 = objc_msgSend(v8, "length");
  v13 = v12;
  if (v12 >= 0x3E7)
  {
    if (!a5)
      goto LABEL_20;
    v19 = CBErrorF(4294960553, "AACP message too big: %u vs %u", (_DWORD)v12, 998);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v19);
    goto LABEL_19;
  }
  if (dword_100978048 <= 30 && (dword_100978048 != -1 || _LogCategory_Initialize(&dword_100978048, 30)))
    LogPrintF_safe(&dword_100978048, "-[CBStackControllerBTStack sendConversationDetectMessage:device:error:]", 30, "SendConversationDetectMessage: device %@ with length %hu", v10, v13);
  if (qword_100977A88 != -1)
    dispatch_once(&qword_100977A88, &stru_100919980);
  v14 = sub_100286844((uint64_t)off_100977A80, (uint64_t)v11, objc_msgSend(objc_retainAutorelease(v8), "bytes"), (unsigned __int16)v13);
  LOBYTE(v11) = 1;
  if (v14)
  {
    v15 = (v14 + 310000);
    if ((_DWORD)v15)
    {
      if (a5)
      {
        v20 = CBErrorF(v15, "SendConversationDetectMessage failed");
        v18 = (void *)objc_claimAutoreleasedReturnValue(v20);
        goto LABEL_19;
      }
LABEL_20:
      LOBYTE(v11) = 0;
    }
  }
LABEL_12:

  return (char)v11;
}

- (BOOL)sendAudioAccessoryConfig:(id)a3 device:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  AudioAccessoryDeviceConfig *v12;
  id v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
  if (v10)
  {
    v11 = -[CBStackControllerBTStack _btDeviceWithID:error:](self, "_btDeviceWithID:error:", v10, 0);
    if (v11)
    {
      v23 = 0;
      v12 = -[AudioAccessoryDeviceConfig initWithXPCObject:error:]([AudioAccessoryDeviceConfig alloc], "initWithXPCObject:error:", v8, &v23);
      v13 = v23;
      if (v13)
      {
        if (a5)
        {
          v20 = CBErrorF(4294960591, "failed to receive accessory data");
          v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
LABEL_45:
          LOBYTE(v11) = 0;
          *a5 = v21;
LABEL_37:

          goto LABEL_38;
        }
      }
      else
      {
        if (-[AudioAccessoryDeviceConfig autoANCStrength](v12, "autoANCStrength"))
        {
          v14 = -[AudioAccessoryDeviceConfig autoANCStrength](v12, "autoANCStrength") - 1000;
          if (dword_100978048 <= 30
            && (dword_100978048 != -1 || _LogCategory_Initialize(&dword_100978048, 30)))
          {
            LogPrintF_safe(&dword_100978048, "-[CBStackControllerBTStack sendAudioAccessoryConfig:device:error:]", 30, "SendAudioAccessoryConfig sendControlCommand for device %@ autoANCStrength: %d", v10, v14);
          }
          if (qword_100977A88 != -1)
            dispatch_once(&qword_100977A88, &stru_100919980);
          v15 = sub_100279E6C((uint64_t)off_100977A80, (uint64_t)v11, 46, v14, 2u);
        }
        else
        {
          v15 = 0;
        }
        if (-[AudioAccessoryDeviceConfig enableSiriMultitone](v12, "enableSiriMultitone"))
        {
          if (-[AudioAccessoryDeviceConfig enableSiriMultitone](v12, "enableSiriMultitone") == 1)
            v16 = 1;
          else
            v16 = 2;
          if (dword_100978048 <= 30
            && (dword_100978048 != -1 || _LogCategory_Initialize(&dword_100978048, 30)))
          {
            LogPrintF_safe(&dword_100978048, "-[CBStackControllerBTStack sendAudioAccessoryConfig:device:error:]", 30, "SendAudioAccessoryConfig sendControlCommand for device %@ enableSiriMultitone: %d", v10, v16);
          }
          if (qword_100977A88 != -1)
            dispatch_once(&qword_100977A88, &stru_100919980);
          v15 = sub_100279E6C((uint64_t)off_100977A80, (uint64_t)v11, 50, v16, 2u);
        }
        if (-[AudioAccessoryDeviceConfig enableHeartRateMonitor](v12, "enableHeartRateMonitor"))
        {
          if (-[AudioAccessoryDeviceConfig enableHeartRateMonitor](v12, "enableHeartRateMonitor") == 1)
            v17 = 1;
          else
            v17 = 2;
          if (dword_100978048 <= 30
            && (dword_100978048 != -1 || _LogCategory_Initialize(&dword_100978048, 30)))
          {
            LogPrintF_safe(&dword_100978048, "-[CBStackControllerBTStack sendAudioAccessoryConfig:device:error:]", 30, "SendAudioAccessoryConfig sendControlCommand for device %@ enableHeartRateMonitor: %d", v10, v17);
          }
          if (qword_100977A88 != -1)
            dispatch_once(&qword_100977A88, &stru_100919980);
          v15 = sub_100279E6C((uint64_t)off_100977A80, (uint64_t)v11, 48, v17, 2u);
        }
        LOBYTE(v11) = 1;
        if (!v15 || v15 == -310000)
          goto LABEL_37;
        if (a5)
        {
          v22 = CBErrorF((v15 + 310000), "SendAudioAccessoryConfig failed");
          v21 = (void *)objc_claimAutoreleasedReturnValue(v22);
          goto LABEL_45;
        }
      }
      LOBYTE(v11) = 0;
      goto LABEL_37;
    }
  }
  else if (a5)
  {
    v19 = CBErrorF(4294960588, "No device ID");
    LOBYTE(v11) = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue(v19);
  }
  else
  {
    LOBYTE(v11) = 0;
  }
LABEL_38:

  return (char)v11;
}

- (BOOL)sendAudioAccessoryEventMessage:(id)a3 eventType:(unsigned __int8)a4 device:(id)a5 error:(id *)a6
{
  unsigned int v8;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  const char *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v8 = a4;
  v10 = a3;
  v11 = a5;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
  if (!v12)
  {
    if (a6)
    {
      v23 = CBErrorF(4294960588, "No device ID");
      v20 = (void *)objc_claimAutoreleasedReturnValue(v23);
      goto LABEL_38;
    }
LABEL_43:
    LOBYTE(v13) = 0;
    goto LABEL_44;
  }
  v13 = -[CBStackControllerBTStack _btDeviceWithID:error:](self, "_btDeviceWithID:error:", v12, 0);
  if (v13)
  {
    v14 = objc_msgSend(v10, "length");
    v15 = v14;
    if (v14 >= 0x3E7)
    {
      if (a6)
      {
        v24 = CBErrorF(4294960553, "AACP message too big: %u vs %u", (_DWORD)v14, 998);
        v20 = (void *)objc_claimAutoreleasedReturnValue(v24);
        goto LABEL_38;
      }
      goto LABEL_43;
    }
    if (dword_100978048 <= 30
      && (dword_100978048 != -1 || _LogCategory_Initialize(&dword_100978048, 30)))
    {
      if (v8 > 6)
        v16 = "?";
      else
        v16 = off_100919C90[(char)v8];
      LogPrintF_safe(&dword_100978048, "-[CBStackControllerBTStack sendAudioAccessoryEventMessage:eventType:device:error:]", 30, "SendAudioAccessoryEventMessage: type %s, device %@ with length %hu", v16, v12, v15);
    }
    switch(v8)
    {
      case 2u:
        if (qword_100977A88 != -1)
          dispatch_once(&qword_100977A88, &stru_100919980);
        v17 = sub_100286844((uint64_t)off_100977A80, (uint64_t)v13, objc_msgSend(objc_retainAutorelease(v10), "bytes"), (unsigned __int16)v15);
        break;
      case 3u:
        if (qword_100977A88 != -1)
          dispatch_once(&qword_100977A88, &stru_100919980);
        v17 = sub_100286660((uint64_t)off_100977A80, (uint64_t)v13, objc_msgSend(objc_retainAutorelease(v10), "bytes"), (unsigned __int16)v15);
        break;
      case 4u:
        if (qword_100977A88 != -1)
          dispatch_once(&qword_100977A88, &stru_100919980);
        v17 = sub_100286C18((uint64_t)off_100977A80, (uint64_t)v13, (unsigned __int16)v15, objc_msgSend(objc_retainAutorelease(v10), "bytes"));
        break;
      case 5u:
        if (qword_100977A88 != -1)
          dispatch_once(&qword_100977A88, &stru_100919980);
        v17 = sub_10028702C((uint64_t)off_100977A80, (uint64_t)v13, (unsigned __int16)v15, (unsigned __int8 *)objc_msgSend(objc_retainAutorelease(v10), "bytes"));
        break;
      case 6u:
        if (qword_100977A88 != -1)
          dispatch_once(&qword_100977A88, &stru_100919980);
        v17 = sub_10027FA3C((uint64_t)off_100977A80, (uint64_t)v13);
        break;
      default:
        if (!a6)
          goto LABEL_43;
        v21 = "?";
        if (v8 == 1)
          v21 = "TipiChanged";
        if (!v8)
          v21 = "Invalid";
        v22 = CBErrorF(4294960591, "bad accessory event type: %s", v21);
        v20 = (void *)objc_claimAutoreleasedReturnValue(v22);
        goto LABEL_38;
    }
    LOBYTE(v13) = 1;
    if (v17)
    {
      v18 = (v17 + 310000);
      if ((_DWORD)v18)
      {
        if (a6)
        {
          v19 = CBErrorF(v18, "SendAudioAccessoryEventMessage failed");
          v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
LABEL_38:
          LOBYTE(v13) = 0;
          *a6 = v20;
          goto LABEL_44;
        }
        goto LABEL_43;
      }
    }
  }
LABEL_44:

  return (char)v13;
}

- (BOOL)updateControllerInfo:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v9;

  v6 = a3;
  v7 = v6;
  if (v6)
  {
    self->_stackControllerInfoCloudSyncStatus = objc_msgSend(v6, "cloudSyncStatus");
  }
  else if (a4)
  {
    v9 = CBErrorF(4294960588, "No Controller Info");
    *a4 = (id)objc_claimAutoreleasedReturnValue(v9);
  }

  return v7 != 0;
}

- (BOOL)isDeviceConnected:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  uint64_t v11;
  unsigned __int8 v12[16];

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "identifier"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CBStackControllerBTStack _btUUIDWithID:error:](self, "_btUUIDWithID:error:", v6, 0));
    if (qword_1009778A8 != -1)
      dispatch_once(&qword_1009778A8, &stru_1009199E0);
    v8 = off_1009778A0;
    sub_100030BCC(v12, v7);
    v9 = sub_100069F08((uint64_t)v8, v12);

  }
  else if (a4)
  {
    v11 = CBErrorF(4294960588, "No device identifier");
    v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue(v11);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_pairingAgentTearDown
{
  BTPairingAgentImpl *pairingAgentHandle;
  _BOOL4 pairingAgentStarted;
  CBPairable *pairingClients;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  pairingAgentHandle = self->_pairingAgentHandle;
  self->_pairingAgentHandle = 0;
  pairingAgentStarted = self->_pairingAgentStarted;
  self->_pairingAgentStarted = 0;
  pairingClients = self->_pairingClients;
  self->_pairingClients = 0;

  if (pairingAgentHandle)
  {
    if (qword_100978150 != -1)
      dispatch_once(&qword_100978150, &stru_100919A00);
    v5 = sub_1005B2FB8(off_100978148, (uint64_t)pairingAgentHandle);
    if (v5)
    {
      if (pairingAgentStarted)
      {
        v6 = sub_1005AEB14(v5, (unint64_t)pairingAgentHandle);
        if (!v6 || (v7 = (v6 + 310000), v6 == -310000))
        {
          if (dword_100978048 <= 30
            && (dword_100978048 != -1 || _LogCategory_Initialize(&dword_100978048, 30)))
          {
            LogPrintF_safe(&dword_100978048, "-[CBStackControllerBTStack _pairingAgentTearDown]", 30, "Pairing agent stopped");
          }
        }
        else if (dword_100978048 <= 90
               && (dword_100978048 != -1 || _LogCategory_Initialize(&dword_100978048, 90)))
        {
          v8 = CUPrintErrorCode(v7);
          v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
          LogPrintF_safe(&dword_100978048, "-[CBStackControllerBTStack _pairingAgentTearDown]", 90, "### Stop pairing agent failed: %@", v9);

        }
      }
      if (qword_100978150 != -1)
        dispatch_once(&qword_100978150, &stru_100919A00);
      sub_1005B2CE0(off_100978148, (unint64_t)pairingAgentHandle);
    }
    else if (dword_100978048 <= 90
           && (dword_100978048 != -1 || _LogCategory_Initialize(&dword_100978048, 90)))
    {
      LogPrintF_safe(&dword_100978048, "-[CBStackControllerBTStack _pairingAgentTearDown]", 90, "### Get pairing agent to stop failed");
    }
  }
}

- (BOOL)addPairingClient:(id)a3 error:(id *)a4
{
  id v6;
  CBPairable *pairingClients;
  CBPairable *v8;
  CBPairable *v9;
  BOOL v10;
  _QWORD *v11;
  int v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  _OWORD v26[3];
  uint64_t v27;
  _QWORD v28[6];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  pairingClients = self->_pairingClients;
  if (!pairingClients)
  {
    v8 = (CBPairable *)objc_alloc_init((Class)NSMutableSet);
    v9 = self->_pairingClients;
    self->_pairingClients = v8;

    pairingClients = self->_pairingClients;
  }
  -[CBPairable addObject:](pairingClients, "addObject:", v6);
  if (dword_100978048 <= 30 && (dword_100978048 != -1 || _LogCategory_Initialize(&dword_100978048, 30)))
    LogPrintF_safe(&dword_100978048, "-[CBStackControllerBTStack addPairingClient:error:]", 30, "AddPairingClient: %d total", -[CBPairable count](self->_pairingClients, "count"));
  if (!self->_pairingAgentHandle)
  {
    v29 = 0;
    v30 = &v29;
    v31 = 0x3032000000;
    v32 = sub_10006250C;
    v33 = sub_100062340;
    v34 = 0;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1000D66F4;
    v28[3] = &unk_100919528;
    v28[4] = &v29;
    v28[5] = a4;
    v11 = objc_retainBlock(v28);
    if (self->_btSessionHandle)
    {
      v27 = 0;
      if (qword_100978150 != -1)
        dispatch_once(&qword_100978150, &stru_100919A00);
      v12 = sub_1005B2998(off_100978148, (unint64_t)self->_btSessionHandle, &v27, (unint64_t *)&self->_pairingAgentHandle);
      if (v12 && (v13 = (v12 + 310000), (_DWORD)v13))
      {
        v20 = CBErrorF(v13, "Create pairing agent failed");
        v19 = objc_claimAutoreleasedReturnValue(v20);
      }
      else
      {
        if (v27)
        {
          v26[0] = *(_OWORD *)off_100919548;
          v26[1] = *(_OWORD *)off_100919558;
          v26[2] = *(_OWORD *)off_100919568;
          sub_1005AECB8(v27, (unint64_t *)self->_pairingAgentHandle, v26, (uint64_t)self);
          v14 = sub_1005AEF50(v27, (unint64_t)self->_pairingAgentHandle);
          v16 = v14 == 0;
          v15 = (v14 + 310000);
          v16 = v16 || (_DWORD)v15 == 0;
          v10 = v16;
          if (v16)
          {
            self->_pairingAgentStarted = 1;
            if (dword_100978048 <= 30
              && (dword_100978048 != -1 || _LogCategory_Initialize(&dword_100978048, 30)))
            {
              LogPrintF_safe(&dword_100978048, "-[CBStackControllerBTStack addPairingClient:error:]", 30, "Pairing agent started");
            }
          }
          else
          {
            v23 = CBErrorF(v15, "Start pairing agent failed");
            v24 = objc_claimAutoreleasedReturnValue(v23);
            v25 = (void *)v30[5];
            v30[5] = v24;

          }
          goto LABEL_27;
        }
        v21 = CBErrorF(4294960534, "Create pairing agent null");
        v19 = objc_claimAutoreleasedReturnValue(v21);
      }
    }
    else
    {
      v18 = CBErrorF(4294960534, "No BTSession");
      v19 = objc_claimAutoreleasedReturnValue(v18);
    }
    v22 = (void *)v30[5];
    v30[5] = v19;

    v10 = 0;
LABEL_27:
    ((void (*)(_QWORD *))v11[2])(v11);

    _Block_object_dispose(&v29, 8);
    goto LABEL_28;
  }
  v10 = 1;
LABEL_28:

  return v10;
}

- (void)removePairingClient:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  -[CBPairable removeObject:](self->_pairingClients, "removeObject:", v5);
  v4 = -[CBPairable count](self->_pairingClients, "count");
  if (dword_100978048 <= 30 && (dword_100978048 != -1 || _LogCategory_Initialize(&dword_100978048, 30)))
    LogPrintF_safe(&dword_100978048, "-[CBStackControllerBTStack removePairingClient:]", 30, "RemovePairingClient: %d total", (_DWORD)v4);
  if (!v4)
    -[CBStackControllerBTStack _pairingAgentTearDown](self, "_pairingAgentTearDown");

}

- (BOOL)pairingContinueWithPairingInfo:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  id v20;
  char *v21;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  char v27[17];

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "device"));
  v8 = v7;
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
    v10 = -[CBStackControllerBTStack _btDeviceWithID:error:](self, "_btDeviceWithID:error:", v9, a4);
    if (!v10)
    {
LABEL_20:

      goto LABEL_21;
    }
    if (self->_pairingAgentHandle)
    {
      if (qword_100978150 != -1)
        dispatch_once(&qword_100978150, &stru_100919A00);
      v11 = sub_1005B2FB8(off_100978148, (uint64_t)self->_pairingAgentHandle);
      if (v11)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "error"));
        if (!v12)
        {
          v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pin")));
          v21 = (char *)objc_msgSend(v20, "UTF8String");

          if (v21)
          {
            sub_1005BCD34(v27, v21);
            sub_1005B04B4(v11, (unint64_t)v10);
          }
        }
        if (objc_msgSend(v12, "code") == (id)-6723)
        {
          v13 = sub_1005B0460(v11);
          LOBYTE(v10) = 1;
          if (!v13)
            goto LABEL_19;
          v14 = (v13 + 310000);
          if (!(_DWORD)v14)
            goto LABEL_19;
          if (a4)
          {
            v15 = CBErrorF(v14, "Cancel pairing failed");
            v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
LABEL_31:
            LOBYTE(v10) = 0;
            *a4 = v16;
LABEL_19:

            goto LABEL_20;
          }
        }
        else
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "error"));
          v18 = sub_1005B0704(v11, (uint64_t)v10, v17 != 0);

          LOBYTE(v10) = 1;
          if (!v18 || v18 == -310000)
            goto LABEL_19;
          if (a4)
          {
            v19 = CBErrorF((v18 + 310000), "Accept/Reject pairing failed");
            v16 = (void *)objc_claimAutoreleasedReturnValue(v19);
            goto LABEL_31;
          }
        }
        LOBYTE(v10) = 0;
        goto LABEL_19;
      }
      if (a4)
      {
        v26 = CBErrorF(4294960534, "No pairing agent to continue");
        v25 = (id)objc_claimAutoreleasedReturnValue(v26);
        goto LABEL_28;
      }
    }
    else if (a4)
    {
      v24 = CBErrorF(4294960551, "No pairing agent handle to continue");
      v25 = (id)objc_claimAutoreleasedReturnValue(v24);
LABEL_28:
      LOBYTE(v10) = 0;
      *a4 = v25;
      goto LABEL_20;
    }
    LOBYTE(v10) = 0;
    goto LABEL_20;
  }
  if (a4)
  {
    v23 = CBErrorF(4294960591, "No pairing device");
    LOBYTE(v10) = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue(v23);
  }
  else
  {
    LOBYTE(v10) = 0;
  }
LABEL_21:

  return (char)v10;
}

- (void)_pairingCompletedWithBTDevice:(void *)a3 result:(int)a4
{
  uint64_t v4;
  CBPairable *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  NSObject *v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  void **v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void **v24;
  void *__p[2];
  char v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];

  v4 = *(_QWORD *)&a4;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v6 = self->_pairingClients;
  v7 = -[CBPairable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v7)
  {
    v8 = 0;
    v9 = *(_QWORD *)v29;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
        v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "pairingCompletedHandler"));
        if (v12)
        {
          v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dispatchQueue"));
          dispatch_assert_queue_V2(v13);

          if (!v8)
          {
            v14 = objc_alloc((Class)CBDevice);
            v27 = 0;
            v8 = objc_msgSend(v14, "initWithBTStackDevice:error:", a3, &v27);
            v15 = v27;
            v16 = v15;
            if (!v8)
            {
              if (dword_100978048 <= 90
                && (dword_100978048 != -1 || _LogCategory_Initialize(&dword_100978048, 90)))
              {
                sub_10043E5F8((uint64_t)a3, __p);
                v19 = v26;
                v20 = (void **)__p[0];
                v21 = CUPrintNSError(v16);
                v22 = objc_claimAutoreleasedReturnValue(v21);
                v23 = (void *)v22;
                v24 = __p;
                if (v19 < 0)
                  v24 = v20;
                LogPrintF_safe(&dword_100978048, "-[CBStackControllerBTStack _pairingCompletedWithBTDevice:result:]", 90, "### Pairing completed failed init device: %s, %@", v24, v22);

                if (v26 < 0)
                  operator delete(__p[0]);
              }

              goto LABEL_25;
            }

          }
          if ((_DWORD)v4)
          {
            v17 = CBErrorF(v4, "Pairing error");
            v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
          }
          else
          {
            v18 = 0;
          }
          ((void (**)(_QWORD, id, void *))v12)[2](v12, v8, v18);

        }
      }
      v7 = -[CBPairable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v7)
        continue;
      break;
    }
  }
  else
  {
LABEL_25:
    v8 = 0;
  }

}

- (void)_pairingPromptWithBTDevice:(void *)a3 pairingType:(int64_t)a4 pinString:(id)a5 flags:(unsigned int)a6
{
  uint64_t v6;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void (**v15)(_QWORD, _QWORD);
  NSObject *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  int v21;
  void **v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void **v26;
  CBPairable *obj;
  void *__p[2];
  char v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];

  v6 = *(_QWORD *)&a6;
  v9 = a5;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = self->_pairingClients;
  v10 = -[CBPairable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v10)
  {
    v11 = 0;
    v12 = *(_QWORD *)v33;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v33 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
        v15 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "pairingPromptHandler"));
        if (v15)
        {
          v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dispatchQueue"));
          dispatch_assert_queue_V2(v16);

          if (!v11)
          {
            v17 = objc_alloc((Class)CBDevice);
            v31 = 0;
            v11 = objc_msgSend(v17, "initWithBTStackDevice:error:", a3, &v31);
            v18 = v31;
            v19 = v18;
            if (!v11)
            {
              if (dword_100978048 <= 90
                && (dword_100978048 != -1 || _LogCategory_Initialize(&dword_100978048, 90)))
              {
                sub_10043E5F8((uint64_t)a3, __p);
                v21 = v30;
                v22 = (void **)__p[0];
                v23 = CUPrintNSError(v19);
                v24 = objc_claimAutoreleasedReturnValue(v23);
                v25 = (void *)v24;
                v26 = __p;
                if (v21 < 0)
                  v26 = v22;
                LogPrintF_safe(&dword_100978048, "-[CBStackControllerBTStack _pairingPromptWithBTDevice:pairingType:pinString:flags:]", 90, "### Pairing prompt failed init device: %s, %@", v26, v24);

                if (v30 < 0)
                  operator delete(__p[0]);
              }

              goto LABEL_22;
            }

          }
          v20 = objc_alloc_init((Class)CBPairingInfo);
          objc_msgSend(v20, "setDevice:", v11);
          objc_msgSend(v20, "setFlags:", v6);
          objc_msgSend(v20, "setPairingType:", a4);
          objc_msgSend(v20, "setPin:", v9);
          ((void (**)(_QWORD, id))v15)[2](v15, v20);

        }
      }
      v10 = -[CBPairable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      if (v10)
        continue;
      break;
    }
  }
  else
  {
LABEL_22:
    v11 = 0;
  }

}

- (id)controllerDataChangedHandler
{
  return self->_controllerDataChangedHandler;
}

- (void)setControllerDataChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (id)discoverableStateChangedHandler
{
  return self->_discoverableStateChangedHandler;
}

- (void)setDiscoverableStateChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)inquiryStateChangedHandler
{
  return self->_inquiryStateChangedHandler;
}

- (void)setInquiryStateChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (id)powerChangedHandler
{
  return self->_powerChangedHandler;
}

- (void)setPowerChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (id)relayMessageHandler
{
  return self->_relayMessageHandler;
}

- (void)setRelayMessageHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSData)fastLEConnectionInfoData
{
  return self->_fastLEConnectionInfoData;
}

- (void)setFastLEConnectionInfoData:(id)a3
{
  objc_storeStrong((id *)&self->_fastLEConnectionInfoData, a3);
}

- (unsigned)fastLEConnectionInfoVersion
{
  return self->_fastLEConnectionInfoVersion;
}

- (void)setFastLEConnectionInfoVersion:(unsigned __int8)a3
{
  self->_fastLEConnectionInfoVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fastLEConnectionInfoData, 0);
  objc_storeStrong(&self->_relayMessageHandler, 0);
  objc_storeStrong(&self->_powerChangedHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_inquiryStateChangedHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_discoverableStateChangedHandler, 0);
  objc_storeStrong(&self->_controllerDataChangedHandler, 0);
  objc_storeStrong((id *)&self->_performDeviceRequests, 0);
  objc_storeStrong((id *)&self->_pairingClients, 0);
  objc_storeStrong((id *)&self->_modifyDeviceRequests, 0);
  objc_storeStrong((id *)&self->_discoverableSessionMap, 0);
  objc_storeStrong((id *)&self->_connectDeviceRequests, 0);
}

@end
