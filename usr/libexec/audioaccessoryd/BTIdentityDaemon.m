@implementation BTIdentityDaemon

+ (id)sharedBTIdentityDaemon
{
  if (qword_100212638 != -1)
    dispatch_once(&qword_100212638, &stru_1001E5260);
  return (id)qword_100212630;
}

- (BTIdentityDaemon)init
{
  BTIdentityDaemon *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *dispatchQueue;
  BTIdentityDaemon *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BTIdentityDaemon;
  v2 = -[BTIdentityDaemon init](&v9, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("BTIdentityDaemon", v4);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v5;

    v2->_cbDaemonNotifyToken = -1;
    v7 = v2;
  }

  return v2;
}

- (id)descriptionWithLevel:(int)a3
{
  id v4;

  v4 = 0;
  NSAppendPrintF(&v4, "-- BTIdentityDaemon: IDS devices %d, Identities %d --\n", -[NSArray count](self->_idsDevices, "count", *(_QWORD *)&a3), -[NSMutableDictionary count](self->_identityMap, "count"));
  return v4;
}

- (void)activate
{
  OS_dispatch_queue *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008E530;
  block[3] = &unk_1001E20E8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)invalidate
{
  OS_dispatch_queue *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008E878;
  block[3] = &unk_1001E20E8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (BOOL)diagnosticControl:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v10;
  BOOL v11;
  OS_dispatch_queue *dispatchQueue;
  _QWORD block[6];
  id v15;

  v6 = a4;
  v7 = a3;
  TypeID = CFStringGetTypeID();
  TypedValue = CFDictionaryGetTypedValue(v7, CFSTR("_input"), TypeID, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);

  if (!v10
    || objc_msgSend(v10, "caseInsensitiveCompare:", CFSTR("idsUp"))
    && objc_msgSend(v10, "caseInsensitiveCompare:", CFSTR("idsUpForce")))
  {
    v11 = 0;
  }
  else
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10008EA68;
    block[3] = &unk_1001E22B0;
    block[4] = v10;
    block[5] = self;
    v15 = v6;
    dispatch_async((dispatch_queue_t)dispatchQueue, block);

    v11 = 1;
  }

  return v11;
}

- (void)_idsDevicesChanged:(id)a3
{
  id v4;
  OS_dispatch_queue *dispatchQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  BTIdentityDaemon *v9;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10008EB88;
  v7[3] = &unk_1001E23E8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async((dispatch_queue_t)dispatchQueue, v7);

}

- (void)_idsScheduleUpdateIdentities
{
  CUCoalescer **p_idsDeviceCoalescer;
  CUCoalescer *v4;
  id v5;
  void **v6;
  uint64_t v7;
  _QWORD *(*v8)(_QWORD *);
  void *v9;
  CUCoalescer *v10;
  BTIdentityDaemon *v11;

  p_idsDeviceCoalescer = &self->_idsDeviceCoalescer;
  v4 = self->_idsDeviceCoalescer;
  if (!v4)
  {
    v5 = objc_alloc_init((Class)CUCoalescer);
    objc_storeStrong((id *)p_idsDeviceCoalescer, v5);
    objc_msgSend(v5, "setDispatchQueue:", self->_dispatchQueue);
    objc_msgSend(v5, "setMinDelay:", 2.0);
    objc_msgSend(v5, "setMaxDelay:", 5.0);
    v6 = _NSConcreteStackBlock;
    v7 = 3221225472;
    v8 = sub_10008ED40;
    v9 = &unk_1001E23E8;
    v4 = (CUCoalescer *)v5;
    v10 = v4;
    v11 = self;
    -[CUCoalescer setActionHandler:](v4, "setActionHandler:", &v6);

  }
  -[CUCoalescer trigger](v4, "trigger", v6, v7, v8, v9);

}

- (void)_idsUpdateIdentities
{
  BTIdentityDaemon *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  NSMutableDictionary *identityMap;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  unsigned __int8 v17;
  int v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  unsigned __int8 v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  unsigned __int8 v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  int v36;
  uint64_t v37;
  void *i;
  uint64_t v39;
  void *v40;
  const char *v41;
  id v42;
  uint64_t v43;
  void *v44;
  void *v45;
  int v46;
  int v47;
  NSArray *obj;
  uint64_t v49;
  id v50;
  void *v51;
  BTIdentityDaemon *v52;
  _QWORD v53[5];
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];

  v2 = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_identityMap, "enumerateKeysAndObjectsUsingBlock:", &stru_1001E52A0);
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  obj = v2->_idsDevices;
  v52 = v2;
  v50 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
  if (!v50)
  {
    v46 = 0;
    v47 = 0;
    goto LABEL_60;
  }
  v46 = 0;
  v47 = 0;
  v49 = *(_QWORD *)v59;
  do
  {
    v3 = 0;
    do
    {
      if (*(_QWORD *)v59 != v49)
        objc_enumerationMutation(obj);
      v4 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uniqueIDOverride"));
      if (v5)
      {
        v6 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v2->_identityMap, "objectForKeyedSubscript:", v5));
        v7 = (id)v6;
        if (!v6)
        {
          v7 = objc_alloc_init((Class)CBDeviceIdentity);
          objc_msgSend(v7, "setIdentifier:", v5);
          objc_msgSend(v7, "setIdsDeviceID:", v5);
          identityMap = v2->_identityMap;
          if (!identityMap)
          {
            v9 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
            v10 = v2->_identityMap;
            v2->_identityMap = v9;

            identityMap = v2->_identityMap;
          }
          -[NSMutableDictionary setObject:forKeyedSubscript:](identityMap, "setObject:forKeyedSubscript:", v7, v5);
        }
        objc_msgSend(v7, "setType:", 2);
        v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "nsuuid"));
        v51 = (void *)v11;
        if (v11)
        {
          v12 = (void *)v11;
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bluetoothIdentifier"));
          v14 = v12;
          v15 = v13;
          if (v14 == v15)
          {

          }
          else
          {
            v16 = v15;
            if (!v15)
            {

              goto LABEL_19;
            }
            v17 = objc_msgSend(v14, "isEqual:", v15);

            if ((v17 & 1) == 0)
            {
LABEL_19:
              objc_msgSend(v7, "setBluetoothIdentifier:", v14);
              v18 = 1;
LABEL_20:
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "modelIdentifier"));
              if (v19)
              {
                v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "model"));
                v21 = v19;
                v22 = v20;
                if (v21 == v22)
                {

                  goto LABEL_28;
                }
                v23 = v22;
                if (v22)
                {
                  v24 = objc_msgSend(v21, "isEqual:", v22);

                  if ((v24 & 1) != 0)
                    goto LABEL_28;
                }
                else
                {

                }
                objc_msgSend(v7, "setModel:", v21);
                v18 = 1;
              }
LABEL_28:
              v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
              if (v25)
              {
                v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
                v27 = v25;
                v28 = v26;
                if (v27 != v28)
                {
                  v29 = v28;
                  if (v28)
                  {
                    v30 = objc_msgSend(v27, "isEqual:", v28);

                    if ((v30 & 1) != 0)
                      goto LABEL_32;
                  }
                  else
                  {

                  }
                  objc_msgSend(v7, "setName:", v27);
                  if (v6)
                  {
LABEL_41:
                    ++v47;
                    if (dword_10020FDC8 <= 20)
                    {
                      v31 = v51;
                      v2 = v52;
                      if (dword_10020FDC8 != -1 || _LogCategory_Initialize(&dword_10020FDC8, 20))
                        LogPrintF(&dword_10020FDC8, "-[BTIdentityDaemon _idsUpdateIdentities]", 20, "UpdateIdentities: Chg: %@", v7);
                      goto LABEL_48;
                    }
LABEL_47:
                    v31 = v51;
                    v2 = v52;
                    goto LABEL_48;
                  }
LABEL_44:
                  ++v46;
                  if (dword_10020FDC8 > 20)
                    goto LABEL_47;
                  v31 = v51;
                  v2 = v52;
                  if (dword_10020FDC8 != -1 || _LogCategory_Initialize(&dword_10020FDC8, 20))
                    LogPrintF(&dword_10020FDC8, "-[BTIdentityDaemon _idsUpdateIdentities]", 20, "UpdateIdentities: Add: %@", v7);
                  goto LABEL_48;
                }

                if (!v6)
                  goto LABEL_44;
              }
              else
              {
LABEL_32:
                if (!v6)
                  goto LABEL_44;
              }
              if (v18)
                goto LABEL_41;
              if (dword_10020FDC8 > 10)
                goto LABEL_47;
              v31 = v51;
              v2 = v52;
              if (dword_10020FDC8 != -1 || _LogCategory_Initialize(&dword_10020FDC8, 10))
                LogPrintF(&dword_10020FDC8, "-[BTIdentityDaemon _idsUpdateIdentities]", 10, "UpdateIdentities: UCh: %@", v7);
LABEL_48:

              goto LABEL_49;
            }
          }
        }
        v18 = 0;
        goto LABEL_20;
      }
LABEL_49:

      v3 = (char *)v3 + 1;
    }
    while (v50 != v3);
    v32 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
    v50 = v32;
  }
  while (v32);
LABEL_60:

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v2->_identityMap, "allKeys"));
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
  if (v34)
  {
    v35 = v34;
    v36 = 0;
    v37 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v35; i = (char *)i + 1)
      {
        if (*(_QWORD *)v55 != v37)
          objc_enumerationMutation(v33);
        v39 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)i);
        v40 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v52->_identityMap, "objectForKeyedSubscript:", v39));
        if (!objc_msgSend(v40, "type"))
        {
          -[NSMutableDictionary setObject:forKeyedSubscript:](v52->_identityMap, "setObject:forKeyedSubscript:", 0, v39);
          ++v36;
          if (dword_10020FDC8 <= 20
            && (dword_10020FDC8 != -1 || _LogCategory_Initialize(&dword_10020FDC8, 20)))
          {
            LogPrintF(&dword_10020FDC8, "-[BTIdentityDaemon _idsUpdateIdentities]", 20, "UpdateIdentities: Rmv: %@", v40);
          }
        }

      }
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
    }
    while (v35);
  }
  else
  {
    v36 = 0;
  }

  if (dword_10020FDC8 <= 30 && (dword_10020FDC8 != -1 || _LogCategory_Initialize(&dword_10020FDC8, 30)))
  {
    if (v52->_cbDaemonUpdated)
      v41 = "yes";
    else
      v41 = "no";
    LogPrintF(&dword_10020FDC8, "-[BTIdentityDaemon _idsUpdateIdentities]", 30, "UpdateIdentities: summary: added %d, removed %d, changed %d, daemon updated %s", v46, v36, v47, v41);
  }
  if (v46 || v36 || v47 || !v52->_cbDaemonUpdated)
  {
    v42 = objc_alloc_init((Class)CBController);
    objc_msgSend(v42, "setDispatchQueue:", v52->_dispatchQueue);
    v43 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](v52->_identityMap, "allValues"));
    v44 = (void *)v43;
    if (v43)
      v45 = (void *)v43;
    else
      v45 = &__NSArray0__struct;
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472;
    v53[2] = sub_10008F4B8;
    v53[3] = &unk_1001E2110;
    v53[4] = v42;
    objc_msgSend(v42, "updateIdentities:completion:", v45, v53);

    v52->_cbDaemonUpdated = 1;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identityMap, 0);
  objc_storeStrong((id *)&self->_idsDevices, 0);
  objc_storeStrong((id *)&self->_idsDeviceCoalescer, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
