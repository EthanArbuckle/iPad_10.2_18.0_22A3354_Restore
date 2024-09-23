@implementation CBStackBLEAdvertiserBTStack

- (CBStackBLEAdvertiserBTStack)init
{
  CBStackBLEAdvertiserBTStack *v2;
  CBStackBLEAdvertiserBTStack *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CBStackBLEAdvertiserBTStack;
  v2 = -[CBStackBLEAdvertiserBTStack init](&v5, "init");
  if (v2)
  {
    v2->_clientID = CBXPCGetNextClientID();
    objc_storeStrong((id *)&v2->_dispatchQueue, &_dispatch_main_q);
    v3 = v2;
  }

  return v2;
}

- (id)description
{
  return -[CBStackBLEAdvertiserBTStack descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  int v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  int advertiseRate;
  const char *v10;
  id v11;
  NSData *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  CBStackBLEAdvertiserBTStack *v17;
  id v18;
  NSArray *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  _BOOL4 v28;
  id v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  id v40;
  id v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  CBStackBLEAdvertiserBTStack *v52;
  NSArray *obj;
  NSArray *obja;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  id v60;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  id v66;
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  int v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  int v79;
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];

  if ((a3 & 0x8000000) != 0)
    v3 = 8;
  else
    v3 = 12;
  v79 = v3;
  v52 = self;
  if ((a3 & 0x8000000) != 0)
  {
    v6 = 0;
  }
  else
  {
    v78 = 0;
    v4 = objc_msgSend((id)objc_opt_class(self), "description");
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    CUAppendF(&v78, &v79, "%@", v5);
    v6 = v78;

    self = v52;
  }
  v77 = v6;
  CUAppendF(&v77, &v79, "CID: 0x%X", self->_clientID);
  v7 = v77;

  v76 = v7;
  CUAppendF(&v76, &v79, "enableEPA: %d", v52->_advertiseEnableEPA);
  v8 = v76;

  v75 = v8;
  advertiseRate = v52->_advertiseRate;
  if (advertiseRate <= 39)
  {
    if (advertiseRate > 19)
    {
      if (advertiseRate != 20)
      {
LABEL_21:
        v10 = "270 ms";
        goto LABEL_27;
      }
      v10 = "350 ms";
    }
    else
    {
      if (advertiseRate != 10)
      {
        if (advertiseRate == 15)
        {
          v10 = "1022.5 ms";
          goto LABEL_27;
        }
        goto LABEL_21;
      }
      v10 = "2 seconds";
    }
  }
  else if (advertiseRate <= 44)
  {
    if (advertiseRate != 40)
    {
      if (advertiseRate == 42)
      {
        v10 = "120 ms";
        goto LABEL_27;
      }
      goto LABEL_21;
    }
    v10 = "181.25 ms";
  }
  else
  {
    switch(advertiseRate)
    {
      case '-':
        v10 = "60 ms";
        break;
      case '2':
        v10 = "30 ms";
        break;
      case '<':
        v10 = "20 ms";
        break;
      default:
        goto LABEL_21;
    }
  }
LABEL_27:
  CUAppendF(&v75, &v79, "Rate: %s", v10);
  v11 = v75;

  v12 = v52->_nearbyActionData;
  v13 = v12;
  if (v12)
  {
    v74 = v11;
    v14 = CUPrintNSDataHex(v12, 100, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    CUAppendF(&v74, &v79, "naPD <%@>", v15);
    v16 = v74;

  }
  else
  {
    v16 = v11;
  }

  v17 = v52;
  if (-[NSArray count](v52->_saAddressDataArray, "count"))
  {
    v73 = v16;
    CUAppendF(&v73, &v79, "saAddrD: ");
    v18 = v73;

    v72 = 8;
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    v19 = v52->_saAddressDataArray;
    v20 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v68, v82, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v69;
      do
      {
        v22 = 0;
        v23 = v18;
        do
        {
          if (*(_QWORD *)v69 != v21)
            objc_enumerationMutation(v19);
          v24 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * (_QWORD)v22);
          v67 = v23;
          v25 = v24;
          if (!v24)
          {
            v25 = objc_claimAutoreleasedReturnValue(+[NSData data](NSData, "data"));
            v13 = (void *)v25;
          }
          v26 = CUPrintNSDataHex(v25, 100, 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
          CUAppendF(&v67, &v72, "{<%@>}", v27);
          v28 = v24 == 0;
          v18 = v67;

          if (v28)
          v22 = (char *)v22 + 1;
          v23 = v18;
        }
        while (v20 != v22);
        v20 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v68, v82, 16);
      }
      while (v20);
    }

    v16 = v18;
    v17 = v52;
  }
  if (-[NSArray count](v17->_saServiceDataArray, "count"))
  {
    v66 = v16;
    CUAppendF(&v66, &v79, "saSvcD: ");
    v29 = v66;

    v72 = 8;
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    obj = v52->_saServiceDataArray;
    v30 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v62, v81, 16);
    if (v30)
    {
      v31 = *(_QWORD *)v63;
      do
      {
        v32 = 0;
        v33 = v29;
        do
        {
          if (*(_QWORD *)v63 != v31)
            objc_enumerationMutation(obj);
          v34 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)v32);
          v61 = v33;
          v35 = objc_msgSend(v34, "serviceUUID16");
          v36 = objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "serviceData"));
          v37 = (void *)v36;
          if (!v36)
          {
            v36 = objc_claimAutoreleasedReturnValue(+[NSData data](NSData, "data"));
            v13 = (void *)v36;
          }
          v38 = CUPrintNSDataHex(v36, 100, 1);
          v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
          CUAppendF(&v61, &v72, "{UUUID 0x%04X, Data <%@>}", v35, v39);
          v29 = v61;

          if (!v37)
          v32 = (char *)v32 + 1;
          v33 = v29;
        }
        while (v30 != v32);
        v30 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v62, v81, 16);
      }
      while (v30);
    }

    v16 = v29;
    v17 = v52;
  }
  if (-[NSArray count](v17->_serviceDataArray, "count"))
  {
    v60 = v16;
    CUAppendF(&v60, &v79, "SvcD: ");
    v40 = v60;

    v72 = 8;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    obja = v52->_serviceDataArray;
    v41 = -[NSArray countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v56, v80, 16);
    if (v41)
    {
      v42 = *(_QWORD *)v57;
      do
      {
        v43 = 0;
        v44 = v40;
        do
        {
          if (*(_QWORD *)v57 != v42)
            objc_enumerationMutation(obja);
          v45 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * (_QWORD)v43);
          v55 = v44;
          v46 = objc_msgSend(v45, "serviceUUID16");
          v47 = objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "serviceData"));
          v48 = (void *)v47;
          if (!v47)
          {
            v47 = objc_claimAutoreleasedReturnValue(+[NSData data](NSData, "data"));
            v16 = (id)v47;
          }
          v49 = CUPrintNSDataHex(v47, 100, 1);
          v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
          CUAppendF(&v55, &v72, "{UUUID 0x%04X, Data <%@>}", v46, v50);
          v40 = v55;

          if (!v48)
          v43 = (char *)v43 + 1;
          v44 = v40;
        }
        while (v41 != v43);
        v41 = -[NSArray countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v56, v80, 16);
      }
      while (v41);
    }

  }
  else
  {
    v40 = v16;
  }
  return v40;
}

- (void)activate
{
  uint64_t v3;
  void *v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100977B58 <= 30 && (dword_100977B58 != -1 || _LogCategory_Initialize(&dword_100977B58, 30)))
  {
    v3 = CUDescriptionWithLevel(self, 134217778);
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    LogPrintF_safe(&dword_100977B58, "-[CBStackBLEAdvertiserBTStack activate]", 30, "Activate: %@", v4);

  }
  -[CBStackBLEAdvertiserBTStack _updateConnectable](self, "_updateConnectable");
  -[CBStackBLEAdvertiserBTStack _updateNonConnectable](self, "_updateNonConnectable");
  -[CBStackBLEAdvertiserBTStack _updateNonConnectableContact](self, "_updateNonConnectableContact");
  -[CBStackBLEAdvertiserBTStack _updateNonConnectableObjectDiscovery](self, "_updateNonConnectableObjectDiscovery");
}

- (void)invalidate
{
  uint64_t v3;
  void *v4;
  void *btSessionPtrConnectable;
  BOOL advertisingStartedConnectable;
  void *btSessionPtrNonConnectable;
  _BOOL4 advertisingStartedNonConnectable;
  void *btSessionPtrNonConnectableContact;
  _BOOL4 advertisingStartedNonConnectableContact;
  void *btSessionPtrNonConnectableObjectDiscovery;
  _BOOL4 advertisingStartedNonConnectableObjectDiscovery;
  BOOL v13;
  int v14;
  BOOL v15;
  int v16;
  BOOL v17;
  char v18;
  BOOL v21;
  uint64_t v22;
  BTSessionImpl **p_btSessionHandleConnectable;
  BTSessionImpl *v24;
  BTSessionImpl *btSessionHandleConnectable;
  BTSessionImpl *v26;
  BTSessionImpl *v27;
  BTSessionImpl *v28;
  uint64_t v29;
  _QWORD v30[8];
  _QWORD v31[9];
  BOOL v32;
  BOOL v33;
  BOOL v34;
  BOOL v35;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100977B58 <= 30 && (dword_100977B58 != -1 || _LogCategory_Initialize(&dword_100977B58, 30)))
  {
    v3 = CUDescriptionWithLevel(self, 134217778);
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    LogPrintF_safe(&dword_100977B58, "-[CBStackBLEAdvertiserBTStack invalidate]", 30, "Invalidate: %@", v4);

  }
  btSessionPtrConnectable = self->_btSessionPtrConnectable;
  advertisingStartedConnectable = self->_advertisingStartedConnectable;
  btSessionPtrNonConnectable = self->_btSessionPtrNonConnectable;
  advertisingStartedNonConnectable = self->_advertisingStartedNonConnectable;
  btSessionPtrNonConnectableContact = self->_btSessionPtrNonConnectableContact;
  advertisingStartedNonConnectableContact = self->_advertisingStartedNonConnectableContact;
  btSessionPtrNonConnectableObjectDiscovery = self->_btSessionPtrNonConnectableObjectDiscovery;
  advertisingStartedNonConnectableObjectDiscovery = self->_advertisingStartedNonConnectableObjectDiscovery;
  if (btSessionPtrNonConnectable)
    v13 = !advertisingStartedNonConnectable;
  else
    v13 = 1;
  v14 = v13;
  if (btSessionPtrNonConnectableContact)
    v15 = !advertisingStartedNonConnectableContact;
  else
    v15 = 1;
  v16 = v15;
  if (btSessionPtrNonConnectableObjectDiscovery)
    v17 = !advertisingStartedNonConnectableObjectDiscovery;
  else
    v17 = 1;
  v18 = v17;
  v21 = self->_advertisingStartedConnectable && btSessionPtrConnectable != 0 || v14 == 0 || v16 == 0;
  if (v21 || (v18 & 1) == 0)
  {
    v22 = sub_1000419F4();
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100099AAC;
    v31[3] = &unk_1009181D8;
    v32 = advertisingStartedConnectable;
    v33 = advertisingStartedNonConnectable;
    v31[6] = btSessionPtrNonConnectable;
    v31[7] = btSessionPtrNonConnectableContact;
    v34 = advertisingStartedNonConnectableContact;
    v31[8] = btSessionPtrNonConnectableObjectDiscovery;
    v35 = advertisingStartedNonConnectableObjectDiscovery;
    v31[4] = self;
    v31[5] = btSessionPtrConnectable;
    sub_100041A34(v22, v31);
  }
  btSessionHandleConnectable = self->_btSessionHandleConnectable;
  p_btSessionHandleConnectable = &self->_btSessionHandleConnectable;
  v24 = btSessionHandleConnectable;
  *((_BYTE *)p_btSessionHandleConnectable - 8) = 0;
  *((_BYTE *)p_btSessionHandleConnectable + 16) = 0;
  *((_BYTE *)p_btSessionHandleConnectable + 40) = 0;
  *((_BYTE *)p_btSessionHandleConnectable + 64) = 0;
  v26 = p_btSessionHandleConnectable[3];
  v27 = p_btSessionHandleConnectable[6];
  v28 = p_btSessionHandleConnectable[9];
  if (btSessionHandleConnectable || v26 || v27 || v28)
  {
    v29 = sub_1000419F4();
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100099E30;
    v30[3] = &unk_1009181F8;
    v30[4] = v24;
    v30[5] = v26;
    v30[6] = v27;
    v30[7] = v28;
    sub_100041A34(v29, v30);
  }
  *p_btSessionHandleConnectable = 0;
  p_btSessionHandleConnectable[1] = 0;
  p_btSessionHandleConnectable[3] = 0;
  p_btSessionHandleConnectable[4] = 0;
  p_btSessionHandleConnectable[6] = 0;
  p_btSessionHandleConnectable[7] = 0;
  p_btSessionHandleConnectable[9] = 0;
  p_btSessionHandleConnectable[10] = 0;
}

- (BOOL)shouldAdvertiseSafetyAlerts:(unsigned __int8)a3 advData:(void *)a4
{
  uint64_t v5;
  NSArray *v7;
  NSArray *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unint64_t v15;
  int v16;
  void **v17;
  id v18;
  uint64_t v19;
  void *v20;
  void **v21;
  BOOL v22;
  int v23;
  void **v24;
  id v25;
  uint64_t v26;
  void *v27;
  void **v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  const char *v34;
  id v35;
  char *v36;
  uint64_t v37;
  _OWORD *v38;
  id v40;
  uint64_t (**v41)();
  unsigned int *v42;
  char v43;
  uint64_t (**v44)();
  unsigned int *v45;
  void **v46;
  void *__p[2];
  char v48;

  v5 = a3;
  v7 = self->_saAddressDataArray;
  v8 = self->_saServiceDataArray;
  if (-[NSArray count](v7, "count") <= v5 || -[NSArray count](v8, "count") <= v5)
  {
    v22 = 0;
  }
  else
  {
    v40 = (id)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](v7, "objectAtIndexedSubscript:", v5));
    if (objc_msgSend(v40, "length") == (id)6)
    {
      v44 = 0;
      v45 = 0;
      v9 = objc_retainAutorelease(v40);
      sub_10003994C(&v44, objc_msgSend(v9, "bytes"), (size_t)objc_msgSend(v9, "length"));
      v10 = sub_1005F55FC((uint64_t)&v44, 0);
      v11 = sub_1005F55FC((uint64_t)&v44, 1uLL);
      v12 = sub_1005F55FC((uint64_t)&v44, 2uLL);
      v13 = sub_1005F55FC((uint64_t)&v44, 3uLL);
      v14 = sub_1005F55FC((uint64_t)&v44, 4uLL);
      v15 = sub_1005F55FC((uint64_t)&v44, 5uLL) | ((unint64_t)v14 << 8) | ((unint64_t)v12 << 24) | ((unint64_t)v13 << 16) | (v10 << 40) | (v11 << 32) | 0x1000000000000;
      if ((v10 & 0xC0) == 0x80)
      {
        if (dword_100977B58 <= 90
          && (dword_100977B58 != -1 || _LogCategory_Initialize(&dword_100977B58, 90)))
        {
          sub_1000453F0((uint64_t)&v44, __p);
          v16 = v48;
          v17 = (void **)__p[0];
          v18 = sub_100021770(v15);
          v19 = objc_claimAutoreleasedReturnValue(v18);
          v20 = (void *)v19;
          v21 = __p;
          if (v16 < 0)
            v21 = v17;
          LogPrintF_safe(&dword_100977B58, "-[CBStackBLEAdvertiserBTStack shouldAdvertiseSafetyAlerts:advData:]", 90, "### Overriding address #%d with Invalid address data %s (%@)", v5, v21, v19);

          if (v48 < 0)
            operator delete(__p[0]);
        }
        v22 = 0;
      }
      else
      {
        if (dword_100977B58 <= 30
          && (dword_100977B58 != -1 || _LogCategory_Initialize(&dword_100977B58, 30)))
        {
          sub_1000453F0((uint64_t)&v44, __p);
          v23 = v48;
          v24 = (void **)__p[0];
          v25 = sub_100021770(v15);
          v26 = objc_claimAutoreleasedReturnValue(v25);
          v27 = (void *)v26;
          v28 = __p;
          if (v23 < 0)
            v28 = v24;
          LogPrintF_safe(&dword_100977B58, "-[CBStackBLEAdvertiserBTStack shouldAdvertiseSafetyAlerts:advData:]", 30, "### Overriding address #%d with address data %s (%@)", v5, v28, v26);

          if (v48 < 0)
            operator delete(__p[0]);
        }
        v29 = *((_QWORD *)a4 + 1);
        *(_QWORD *)(v29 + 256) = v15;
        *(_BYTE *)(v29 + 464) = 1;
        v43 = 0;
        sub_100043758(&v43);
        sub_100224440(1);
        sub_10004339C(&v43);
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](v8, "objectAtIndexedSubscript:", v5));
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "serviceData"));
        v32 = objc_msgSend(v31, "length");
        v22 = (unint64_t)v32 < 0x1C;
        if ((unint64_t)v32 < 0x1C)
        {
          v41 = 0;
          v42 = 0;
          v33 = objc_retainAutorelease(v31);
          v34 = (const char *)objc_msgSend(v33, "bytes");
          v35 = objc_msgSend(v33, "length");
          v36 = v34 ? (char *)v34 : "";
          sub_10003994C(&v41, v36, (size_t)v35);
          v37 = *((_QWORD *)a4 + 1);
          sub_10005F5E4((uint64_t)__p, (__int16)objc_msgSend(v30, "serviceUUID16"));
          v46 = __p;
          v38 = sub_10009C400((uint64_t **)(v37 + 112), (unsigned __int8 *)__p, (uint64_t)&unk_100737E70, (_OWORD **)&v46);
          sub_100041698((uint64_t)v38 + 56, (uint64_t)&v41);
          v41 = &off_100918258;
          if (v42)
            sub_100056AAC(v42);
        }

        sub_100043728(&v43);
      }
      v44 = &off_100918258;
      if (v45)
        sub_100056AAC(v45);
    }
    else
    {
      v22 = 0;
    }

  }
  return v22;
}

- (void)_updateConnectable
{
  unint64_t *p_btSessionHandleConnectable;
  CBStackBLEAdvertiserBTStack *v3;
  id v4;
  uint64_t v5;
  id v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v13;
  char v14;

  p_btSessionHandleConnectable = (unint64_t *)&self->_btSessionHandleConnectable;
  if (self->_btSessionHandleConnectable)
    goto LABEL_18;
  v3 = self;
  v4 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("CBStackAdvertiserCA-0x%X"), self->_clientID);
  if (qword_100977B50 != -1)
    dispatch_once(&qword_100977B50, &stru_100918268);
  v5 = qword_100977B48;
  v6 = objc_retainAutorelease(v4);
  sub_100091AE8(&v13, (char *)objc_msgSend(v6, "UTF8String"));
  v7 = sub_10000A378(v5, (uint64_t)&v13);
  v8 = v7;
  if (v14 < 0)
  {
    operator delete(v13);
    if (!v8)
    {
LABEL_13:
      if (*p_btSessionHandleConnectable)
      {
        if (qword_100977B50 != -1)
          dispatch_once(&qword_100977B50, &stru_100918268);
        v3->_btSessionPtrConnectable = (void *)sub_1000229D8((_QWORD *)qword_100977B48, *p_btSessionHandleConnectable);
      }

LABEL_18:
      operator new();
    }
  }
  else if (!v7)
  {
    goto LABEL_13;
  }
  v9 = (v8 + 310000);
  if ((_DWORD)v9
    && dword_100977B58 <= 90
    && (dword_100977B58 != -1 || _LogCategory_Initialize(&dword_100977B58, 90)))
  {
    v10 = CUPrintErrorCode(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    LogPrintF_safe(&dword_100977B58, "-[CBStackBLEAdvertiserBTStack _updateConnectable]", 90, "### Attach session failed: %@", v11);

    v3 = self;
  }
  goto LABEL_13;
}

- (void)_updateNonConnectable
{
  unint64_t *p_btSessionHandleNonConnectable;
  id v3;
  uint64_t v4;
  id v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v12[2];
  char v13;

  p_btSessionHandleNonConnectable = (unint64_t *)&self->_btSessionHandleNonConnectable;
  if (self->_btSessionHandleNonConnectable)
    goto LABEL_18;
  v3 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("CBStackAdvertiserNC-0x%X"), self->_clientID);
  if (qword_100977B50 != -1)
    dispatch_once(&qword_100977B50, &stru_100918268);
  v4 = qword_100977B48;
  v5 = objc_retainAutorelease(v3);
  sub_100091AE8(v12, (char *)objc_msgSend(v5, "UTF8String"));
  v6 = sub_10000A378(v4, (uint64_t)v12);
  v7 = v6;
  if (v13 < 0)
  {
    operator delete(v12[0]);
    if (!v7)
    {
LABEL_13:
      if (*p_btSessionHandleNonConnectable)
      {
        if (qword_100977B50 != -1)
          dispatch_once(&qword_100977B50, &stru_100918268);
        self->_btSessionPtrNonConnectable = (void *)sub_1000229D8((_QWORD *)qword_100977B48, *p_btSessionHandleNonConnectable);
      }

LABEL_18:
      operator new();
    }
  }
  else if (!v6)
  {
    goto LABEL_13;
  }
  v8 = (v7 + 310000);
  if ((_DWORD)v8
    && dword_100977B58 <= 90
    && (dword_100977B58 != -1 || _LogCategory_Initialize(&dword_100977B58, 90)))
  {
    v9 = CUPrintErrorCode(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    LogPrintF_safe(&dword_100977B58, "-[CBStackBLEAdvertiserBTStack _updateNonConnectable]", 90, "### Attach NC session failed: %@", v10);

  }
  goto LABEL_13;
}

- (void)_updateNonConnectableContact
{
  unint64_t *p_btSessionHandleNonConnectableContact;
  id v4;
  uint64_t v5;
  id v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12[2];
  char v13;

  p_btSessionHandleNonConnectableContact = (unint64_t *)&self->_btSessionHandleNonConnectableContact;
  if (self->_btSessionHandleNonConnectableContact)
    goto LABEL_18;
  v4 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("CBStackAdvertiserNC1-0x%X"), self->_clientID);
  if (qword_100977B50 != -1)
    dispatch_once(&qword_100977B50, &stru_100918268);
  v5 = qword_100977B48;
  v6 = objc_retainAutorelease(v4);
  sub_100091AE8(v12, (char *)objc_msgSend(v6, "UTF8String"));
  v7 = sub_10000A378(v5, (uint64_t)v12);
  v8 = v7;
  if (v13 < 0)
  {
    operator delete(v12[0]);
    if (!v8)
    {
LABEL_13:
      if (*p_btSessionHandleNonConnectableContact)
      {
        if (qword_100977B50 != -1)
          dispatch_once(&qword_100977B50, &stru_100918268);
        self->_btSessionPtrNonConnectableContact = (void *)sub_1000229D8((_QWORD *)qword_100977B48, *p_btSessionHandleNonConnectableContact);
      }

LABEL_18:
      v12[0] = 0;
      v12[1] = 0;
      operator new();
    }
  }
  else if (!v7)
  {
    goto LABEL_13;
  }
  v9 = (v8 + 310000);
  if ((_DWORD)v9
    && dword_100977B58 <= 90
    && (dword_100977B58 != -1 || _LogCategory_Initialize(&dword_100977B58, 90)))
  {
    v10 = CUPrintErrorCode(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    LogPrintF_safe(&dword_100977B58, "-[CBStackBLEAdvertiserBTStack _updateNonConnectableContact]", 90, "### Attach NC 1 session failed: %@", v11);

  }
  goto LABEL_13;
}

- (void)_updateNonConnectableObjectDiscovery
{
  unint64_t *p_btSessionHandleNonConnectableObjectDiscovery;
  id v4;
  uint64_t v5;
  id v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12[2];
  char v13;

  p_btSessionHandleNonConnectableObjectDiscovery = (unint64_t *)&self->_btSessionHandleNonConnectableObjectDiscovery;
  if (self->_btSessionHandleNonConnectableObjectDiscovery)
    goto LABEL_18;
  v4 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("CBStackAdvertiserNCObjectDiscovery-0x%X"), self->_clientID);
  if (qword_100977B50 != -1)
    dispatch_once(&qword_100977B50, &stru_100918268);
  v5 = qword_100977B48;
  v6 = objc_retainAutorelease(v4);
  sub_100091AE8(v12, (char *)objc_msgSend(v6, "UTF8String"));
  v7 = sub_10000A378(v5, (uint64_t)v12);
  v8 = v7;
  if (v13 < 0)
  {
    operator delete(v12[0]);
    if (!v8)
    {
LABEL_13:
      if (*p_btSessionHandleNonConnectableObjectDiscovery)
      {
        if (qword_100977B50 != -1)
          dispatch_once(&qword_100977B50, &stru_100918268);
        self->_btSessionPtrNonConnectableObjectDiscovery = (void *)sub_1000229D8((_QWORD *)qword_100977B48, *p_btSessionHandleNonConnectableObjectDiscovery);
      }

LABEL_18:
      v12[0] = 0;
      v12[1] = 0;
      operator new();
    }
  }
  else if (!v7)
  {
    goto LABEL_13;
  }
  v9 = (v8 + 310000);
  if ((_DWORD)v9
    && dword_100977B58 <= 90
    && (dword_100977B58 != -1 || _LogCategory_Initialize(&dword_100977B58, 90)))
  {
    v10 = CUPrintErrorCode(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    LogPrintF_safe(&dword_100977B58, "-[CBStackBLEAdvertiserBTStack _updateNonConnectableObjectDiscovery]", 90, "### Attach NC ObjectDiscovery session failed: %@", v11);

  }
  goto LABEL_13;
}

- (int)advertiseRate
{
  return self->_advertiseRate;
}

- (void)setAdvertiseRate:(int)a3
{
  self->_advertiseRate = a3;
}

- (BOOL)advertiseEnableEPA
{
  return self->_advertiseEnableEPA;
}

- (void)setAdvertiseEnableEPA:(BOOL)a3
{
  self->_advertiseEnableEPA = a3;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (NSData)nearbyActionData
{
  return self->_nearbyActionData;
}

- (void)setNearbyActionData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSArray)saAddressDataArray
{
  return self->_saAddressDataArray;
}

- (void)setSaAddressDataArray:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSArray)saServiceDataArray
{
  return self->_saServiceDataArray;
}

- (void)setSaServiceDataArray:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSData)selfAuthTag
{
  return self->_selfAuthTag;
}

- (void)setSelfAuthTag:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSArray)serviceDataArray
{
  return self->_serviceDataArray;
}

- (void)setServiceDataArray:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceDataArray, 0);
  objc_storeStrong((id *)&self->_selfAuthTag, 0);
  objc_storeStrong((id *)&self->_saServiceDataArray, 0);
  objc_storeStrong((id *)&self->_saAddressDataArray, 0);
  objc_storeStrong((id *)&self->_nearbyActionData, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
