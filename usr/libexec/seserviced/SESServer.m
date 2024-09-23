@implementation SESServer

- (NSMutableArray)instanceRepresentations
{
  return (NSMutableArray *)objc_getAssociatedObject(self, "instanceRepresentations");
}

- (void)setInstanceRepresentations:(id)a3
{
  objc_setAssociatedObject(self, "instanceRepresentations", a3, (void *)0x301);
}

- (id)initializeRAMRepresentation:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void **p_cache;
  void *i;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  unsigned int v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  unsigned int v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  const char *v45;
  id v46;
  void *v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  NSObject *v51;
  void *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  unsigned int v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  SESServer *v69;
  void *v70;
  uint64_t v71;
  id v72;
  uint64_t v73;
  id v74;
  uint64_t v75;
  void *v76;
  id obj;
  InstanceRepresentation *v78;
  uint64_t v79;
  id v80;
  _QWORD v81[5];
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  id v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  id v91;
  _QWORD block[5];
  uint8_t buf[4];
  _BYTE v94[14];
  _BYTE v95[128];
  _BYTE v96[128];

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[SESServer messageQueue](self, "messageQueue"));
  dispatch_assert_queue_V2(v5);

  v8 = SESDefaultLogObject(v6, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "initializeRAMRepresentation", buf, 2u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SESServer instanceRepresentations](self, "instanceRepresentations"));
  if (!v10)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000033AC;
    block[3] = &unk_100302AA0;
    block[4] = self;
    if (qword_10034BAC0 != -1)
      dispatch_once(&qword_10034BAC0, block);
    v91 = 0;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[SESKeyDesignationStorageCoordinator getAndReturnError:](_TtC10seserviced35SESKeyDesignationStorageCoordinator, "getAndReturnError:", &v91));
    v13 = v91;
    v14 = v13;
    if (!v12 || v13)
    {
      v64 = SESEnsureError(v13);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v64);
    }
    else
    {
      v69 = self;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(&off_100322A60, "count")));
      v87 = 0u;
      v88 = 0u;
      v89 = 0u;
      v90 = 0u;
      v72 = objc_msgSend(&off_100322A60, "countByEnumeratingWithState:objects:count:", &v87, v96, 16);
      if (!v72)
        goto LABEL_46;
      v71 = *(_QWORD *)v88;
      v70 = v15;
      v74 = v4;
LABEL_11:
      v16 = 0;
LABEL_12:
      if (*(_QWORD *)v88 != v71)
        objc_enumerationMutation(&off_100322A60);
      v17 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * v16);
      v78 = -[InstanceRepresentation initWithAID:]([InstanceRepresentation alloc], "initWithAID:", v17);
      v76 = v17;
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "hexStringAsData"));
      v86 = 0;
      v19 = sub_10002CCE4(v4, v18, &v86);
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      v21 = v86;

      if (!v21)
      {
        v73 = v16;
        v84 = 0u;
        v85 = 0u;
        v82 = 0u;
        v83 = 0u;
        obj = v20;
        p_cache = &OBJC_METACLASS____SESRKESession.cache;
        v80 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v95, 16);
        if (!v80)
          goto LABEL_44;
        v79 = *(_QWORD *)v83;
        while (1)
        {
          for (i = 0; i != v80; i = (char *)i + 1)
          {
            if (*(_QWORD *)v83 != v79)
              objc_enumerationMutation(obj);
            v26 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * (_QWORD)i);
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_cache + 93, "withKeyData:state:", v26, 2));
            v28 = v27;
            if (v27)
            {
              if (objc_msgSend(v27, "number") < 2)
              {
                v29 = 4;
                goto LABEL_23;
              }
              if (objc_msgSend(v28, "number") >= 2 && objc_msgSend(v28, "number") <= 0xF)
              {
                v29 = 6;
LABEL_23:
                objc_msgSend(v28, "setState:", v29);
              }
              v30 = objc_msgSend(v28, "number");
              v31 = (void *)objc_claimAutoreleasedReturnValue(-[InstanceRepresentation keys](v78, "keys"));
              v32 = objc_msgSend(v31, "count");

              if ((unint64_t)v32 <= v30)
              {
                v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "hexStringAsData"));
                v53 = sub_10002EF28(v4, v52, objc_msgSend(v28, "number"));
                v34 = (void *)objc_claimAutoreleasedReturnValue(v53);

                v56 = SESDefaultLogObject(v54, v55);
                v57 = objc_claimAutoreleasedReturnValue(v56);
                if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
                {
                  v58 = objc_msgSend(v28, "number");
                  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "asHexString"));
                  *(_DWORD *)buf = 67109378;
                  *(_DWORD *)v94 = v58;
                  *(_WORD *)&v94[4] = 2112;
                  *(_QWORD *)&v94[6] = v59;
                  _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, "Out of range keySlot number %u from blob %@", buf, 0x12u);

                }
                v62 = SESDefaultLogObject(v60, v61);
                v51 = objc_claimAutoreleasedReturnValue(v62);
                if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  *(_QWORD *)v94 = v34;
                  _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "Cleaned up with error: %@", buf, 0xCu);
                }
              }
              else
              {
                v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "keyIdentifier"));
                v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "findKeyWithKeyIdentifier:", v33));

                if (v34)
                {
                  objc_msgSend(v28, "setDesignation:", objc_msgSend(v34, "designation"));
                  v35 = objc_msgSend(v34, "slotNumber");
                  v36 = objc_msgSend(v28, "number");
                  if (v35 != (id)v36)
                  {
                    v38 = SESDefaultLogObject(v36, v37);
                    v39 = objc_claimAutoreleasedReturnValue(v38);
                    if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
                    {
                      v40 = objc_msgSend(v34, "designation");
                      *(_DWORD *)buf = 138412546;
                      *(_QWORD *)v94 = v28;
                      *(_WORD *)&v94[8] = 1024;
                      *(_DWORD *)&v94[10] = v40;
                      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_FAULT, "Inconsistent state on SE %@ in designation slot %d", buf, 0x12u);
                    }

                    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "hexStringAsData"));
                    v75 = objc_msgSend(v28, "number");
                    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "keyIdentifier"));
                    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "assetACL"));
                    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "assetACLAttestation"));
                    v46 = sub_10005066C(v4, v45);
                    v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
                    if ((unint64_t)objc_msgSend(v47, "type") <= 3)
                      v48 = 1;
                    else
                      v48 = 2;
                    v49 = objc_msgSend(v28, "designation");
                    v50 = v48;
                    v4 = v74;
                    objc_msgSend(v12, "designateKeyWithAid:slotNumber:keyIdentifier:assetACL:assetACLAttestation:operationApprovalVersion:designation:", v41, v75, v42, v43, v44, v50, v49);

                    p_cache = (void **)(&OBJC_METACLASS____SESRKESession + 16);
                  }
                }
                v51 = objc_claimAutoreleasedReturnValue(-[InstanceRepresentation keys](v78, "keys"));
                -[NSObject setObject:atIndexedSubscript:](v51, "setObject:atIndexedSubscript:", v28, objc_msgSend(v28, "number"));
              }

            }
          }
          v80 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v95, 16);
          if (!v80)
          {
LABEL_44:

            v15 = v70;
            objc_msgSend(v70, "addObject:", v78);

            v16 = v73 + 1;
            if ((id)(v73 + 1) == v72)
            {
              v72 = objc_msgSend(&off_100322A60, "countByEnumeratingWithState:objects:count:", &v87, v96, 16);
              if (!v72)
              {
LABEL_46:
                objc_msgSend(v12, "commit");
                -[SESServer setInstanceRepresentations:](v69, "setInstanceRepresentations:", v15);
                v63 = (void *)objc_claimAutoreleasedReturnValue(-[SESServer messageQueue](v69, "messageQueue"));
                v81[0] = _NSConcreteStackBlock;
                v81[1] = 3221225472;
                v81[2] = sub_100003448;
                v81[3] = &unk_100302AC8;
                v81[4] = v69;
                os_state_add_handler(v63, v81);

                v11 = 0;
                goto LABEL_49;
              }
              goto LABEL_11;
            }
            goto LABEL_12;
          }
        }
      }
      v65 = SESDefaultLogObject(v22, v23);
      v66 = (void *)objc_claimAutoreleasedReturnValue(v65);
      v67 = SESCreateAndLogError(0, v66, SESErrorDomain, 2, CFSTR("While listing %@"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(v67);

LABEL_49:
      v14 = 0;
    }

    goto LABEL_51;
  }
  v11 = 0;
LABEL_51:

  return v11;
}

- (void)handleMFDNotification:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  v4 = objc_claimAutoreleasedReturnValue(-[SESServer messageQueue](self, "messageQueue", a3));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000034BC;
  block[3] = &unk_100302AA0;
  block[4] = self;
  dispatch_async(v4, block);

}

- (os_state_data_s)_dumpState
{
  NSObject *v3;
  NSMutableDictionary *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  os_state_data_s *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = objc_claimAutoreleasedReturnValue(-[SESServer messageQueue](self, "messageQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = objc_opt_new(NSMutableDictionary);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SESServer instanceRepresentations](self, "instanceRepresentations", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "keys"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "filterMap:", &stru_100302B08));

        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "AID"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v12, v13);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  v14 = (os_state_data_s *)sub_100015734((uint64_t)"seskeyxpc.state", (uint64_t)v4);
  return v14;
}

- (void)keyServiceAvailable:(id)a3 reason:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  SESClientInfo *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  SESServer *v27;
  id v28;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v12 = SESDefaultLogObject(v10, v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "", buf, 2u);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v15 = sub_100033EAC((uint64_t)SESClientInfo, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  v17 = sub_1000340C0((uint64_t)v16);
  if ((v17 & 1) != 0)
  {
    v19 = objc_claimAutoreleasedReturnValue(-[SESServer messageQueue](self, "messageQueue"));
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100003880;
    v24[3] = &unk_100302B80;
    v25 = v8;
    v26 = v9;
    v27 = self;
    v28 = v10;
    dispatch_async(v19, v24);

    v20 = v25;
  }
  else
  {
    v21 = SESDefaultLogObject(v17, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v22 = SESCreateAndLogError(0, v20, SESErrorDomain, 5, CFSTR("Missing SESKey entitlement"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v23);

  }
}

- (void)legacyKeyServiceAvailable:(id)a3 reason:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  SESClientInfo *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  SESServer *v27;
  id v28;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v12 = SESDefaultLogObject(v10, v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "", buf, 2u);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v15 = sub_100033EAC((uint64_t)SESClientInfo, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  v17 = sub_1000340D0((uint64_t)v16);
  if ((v17 & 1) != 0)
  {
    v19 = objc_claimAutoreleasedReturnValue(-[SESServer messageQueue](self, "messageQueue"));
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100003C50;
    v24[3] = &unk_100302B80;
    v25 = v8;
    v26 = v9;
    v27 = self;
    v28 = v10;
    dispatch_async(v19, v24);

    v20 = v25;
  }
  else
  {
    v21 = SESDefaultLogObject(v17, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v22 = SESCreateAndLogError(0, v20, SESErrorDomain, 5, CFSTR("Missing SESLegacyKey entitlement"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v23);

  }
}

- (void)keyOperation:(id)a3 keyData:(id)a4 reason:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  BOOL v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v20 = 0;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[PTClassicKey withData:error:](PTClassicKey, "withData:error:", a4, &v20));
  v14 = v20;
  v15 = v14;
  if (v13)
    v16 = v14 == 0;
  else
    v16 = 0;
  if (v16)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100003F90;
    v17[3] = &unk_100302BA8;
    v19 = v12;
    v17[4] = self;
    v18 = v13;
    -[SESServer keyServiceAvailable:reason:reply:](self, "keyServiceAvailable:reason:reply:", v10, v11, v17);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD, id))v12 + 2))(v12, 0, 0, v14);
  }

}

- (id)getUsableKeySlot:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  unsigned int v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  unsigned int v29;
  uint64_t v30;
  NSObject *v31;
  _QWORD v33[4];
  id v34;
  uint8_t buf[4];
  id v36;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[SESServer messageQueue](self, "messageQueue"));
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SESServer instanceRepresentations](self, "instanceRepresentations"));
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100004324;
  v33[3] = &unk_100302BD0;
  v7 = v4;
  v34 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "find:", v33));

  if (v8)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "keys"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "find:", &stru_100302C10));

    if (v12)
    {
      v15 = SESDefaultLogObject(v13, v14);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        v17 = objc_msgSend(v12, "number");
        *(_DWORD *)buf = 67109120;
        LODWORD(v36) = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Returning empty keySlot %u", buf, 8u);
      }

      v18 = v12;
      v19 = v18;
    }
    else
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "keys"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "filter:", &stru_100302C30));

      if (v22)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "randomElement"));
        v27 = SESDefaultLogObject(v25, v26);
        v28 = objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          v29 = objc_msgSend(v25, "number");
          *(_DWORD *)buf = 67109120;
          LODWORD(v36) = v29;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "Returning occupied keySlot %u", buf, 8u);
        }

        v18 = v25;
      }
      else
      {
        v30 = SESDefaultLogObject(v23, v24);
        v31 = objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Went through all slots, NONE OF THEM are free or occupied?!", buf, 2u);
        }

        v18 = 0;
      }

      v19 = v18;
    }
  }
  else
  {
    v20 = SESDefaultLogObject(v9, v10);
    v18 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v7;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Couldn't find AID %@", buf, 0xCu);
    }
    v19 = 0;
  }

  return v19;
}

- (id)getUsableLegacyKeySlot:(id)a3 outError:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  unsigned int v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  _QWORD v27[4];
  id v28;
  uint8_t buf[4];
  unsigned int v30;

  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(-[SESServer messageQueue](self, "messageQueue"));
  dispatch_assert_queue_V2(v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SESServer instanceRepresentations](self, "instanceRepresentations"));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100004600;
  v27[3] = &unk_100302BD0;
  v9 = v6;
  v28 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "find:", v27));

  if (v10)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "keys"));
    v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "find:", &stru_100302C50));

    if (v14)
    {
      v17 = SESDefaultLogObject(v15, v16);
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        v19 = objc_msgSend(v14, "number");
        *(_DWORD *)buf = 67109120;
        v30 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Returning empty keySlot %u", buf, 8u);
      }

      v14 = v14;
      v20 = v14;
    }
    else
    {
      if (a4)
      {
        v23 = SESDefaultLogObject(v15, v16);
        v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
        v25 = SESCreateAndLogError(0, v24, SESErrorDomain, 0, CFSTR("all legacy key slots are occupied"));
        *a4 = (id)objc_claimAutoreleasedReturnValue(v25);

      }
      v20 = 0;
    }
  }
  else
  {
    if (!a4)
    {
      v20 = 0;
      goto LABEL_12;
    }
    v21 = SESDefaultLogObject(v11, v12);
    v14 = (id)objc_claimAutoreleasedReturnValue(v21);
    v22 = SESCreateAndLogError(0, v14, SESErrorDomain, 0, CFSTR("Couldn't find AID %@"));
    v20 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue(v22);
  }

LABEL_12:
  return v20;
}

- (id)getOccupiedLegacyKeySlots:(id *)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  v5 = objc_claimAutoreleasedReturnValue(-[SESServer messageQueue](self, "messageQueue"));
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SESServer instanceRepresentations](self, "instanceRepresentations"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "find:", &stru_100302C90));

  if (v7)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "keys"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "filterMap:", &stru_100302CD0));
  }
  else
  {
    if (!a3)
    {
      v11 = 0;
      goto LABEL_6;
    }
    v12 = SESDefaultLogObject(v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v13 = SESCreateAndLogError(0, v10, SESErrorDomain, 0, CFSTR("Couldn't find slots"));
    v11 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue(v13);
  }

LABEL_6:
  return v11;
}

- (id)getKeyHandle:(id)a3 key:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  unsigned int v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id *v26;
  void *v27;
  void *v28;
  void **v29;
  void ***v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  const __CFString *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void **v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  unsigned int v49;
  unsigned int v50;
  unsigned int v51;
  id *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  uint64_t v58;
  void *v59;
  unsigned int v60;
  void *v61;
  int v62;
  void *v63;
  unsigned int v64;
  void *v65;
  _BOOL4 v66;
  uint64_t v67;
  void *v68;
  id v69;
  void *v70;
  void *v71;
  id v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  id v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  id v84;
  id v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  void *v90;
  id v91;
  id v92;
  id v93;
  void **v94;
  void **v95;
  _QWORD v96[4];
  __CFString *v97;
  uint8_t buf[4];
  _BYTE v99[10];
  _BYTE v100[10];

  v8 = a3;
  v9 = a4;
  v10 = objc_claimAutoreleasedReturnValue(-[SESServer messageQueue](self, "messageQueue"));
  dispatch_assert_queue_V2(v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SESServer instanceRepresentations](self, "instanceRepresentations"));
  v96[0] = _NSConcreteStackBlock;
  v96[1] = 3221225472;
  v96[2] = sub_100004FB0;
  v96[3] = &unk_100302BD0;
  v97 = CFSTR("A000000704C0000000000002");
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "find:", v96));

  if (v12)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("A000000704C0000000000002"), "hexStringAsData"));
    v16 = sub_10002EB98(v8, v15);

    v19 = SESDefaultLogObject(v17, v18);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      v21 = objc_msgSend(v9, "isExportedData");
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "keyIdentifier"));
      v23 = v12;
      v24 = v9;
      v25 = v8;
      v26 = a5;
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "asHexString"));
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v99 = v16;
      *(_WORD *)&v99[4] = 1024;
      *(_DWORD *)&v99[6] = v21;
      *(_WORD *)v100 = 2112;
      *(_QWORD *)&v100[2] = v27;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "PTCVersion %d isExportedData %d keyIdentifier %@", buf, 0x18u);

      a5 = v26;
      v8 = v25;
      v9 = v24;
      v12 = v23;

    }
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "keys"));
    if (v16 < 2)
    {
      v94 = _NSConcreteStackBlock;
      v29 = (void **)sub_100005050;
      v30 = &v94;
    }
    else
    {
      v95 = _NSConcreteStackBlock;
      v29 = (void **)sub_100004FF0;
      v30 = &v95;
    }
    v30[1] = (void **)3221225472;
    v30[2] = v29;
    v30[3] = (void **)&unk_100302CF8;
    v39 = (void **)v9;
    v30[4] = v39;
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "find:", v30));

    if (v32)
    {
      v42 = SESDefaultLogObject(v40, v41);
      v43 = objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)v99 = v39;
        *(_WORD *)&v99[8] = 2112;
        *(_QWORD *)v100 = v32;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "Found already-loaded %@ in %@", buf, 0x16u);
      }

      goto LABEL_14;
    }
    v45 = objc_claimAutoreleasedReturnValue(-[SESServer getUsableKeySlot:](self, "getUsableKeySlot:", CFSTR("A000000704C0000000000002")));
    if (v45)
    {
      v32 = (void *)v45;
      v47 = SESDefaultLogObject(v45, v46);
      v48 = objc_claimAutoreleasedReturnValue(v47);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
      {
        v49 = objc_msgSend(v39, "keyNumber");
        v50 = objc_msgSend(v32, "number");
        v51 = objc_msgSend(v39, "isExportedData");
        *(_DWORD *)buf = 67109632;
        *(_DWORD *)v99 = v49;
        *(_WORD *)&v99[4] = 1024;
        *(_DWORD *)&v99[6] = v50;
        *(_WORD *)v100 = 1024;
        *(_DWORD *)&v100[2] = v51;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "Loading key with number 0x%x in slot %u (exported %d)", buf, 0x14u);
      }

      if (!objc_msgSend(v39, "isExportedData"))
      {
        v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("A000000704C0000000000002"), "hexStringAsData"));
        v69 = sub_10003280C(v8, v68, v39, objc_msgSend(v32, "number"));
        v70 = (void *)objc_claimAutoreleasedReturnValue(v69);

        if (!v70)
          goto LABEL_36;
        v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("A000000704C0000000000002"), "hexStringAsData"));
        v72 = sub_10002EF28(v8, v71, objc_msgSend(v32, "number"));

        objc_msgSend(v32, "resetToEmpty");
        if (a5)
          *a5 = objc_retainAutorelease(v70);

LABEL_45:
        v38 = 0;
        goto LABEL_15;
      }
      v52 = a5;
      v53 = (void *)objc_claimAutoreleasedReturnValue(+[SEKeySyncManager singleton](_TtC10seserviced16SEKeySyncManager, "singleton"));
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "keyData"));
      v93 = 0;
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "haveAvailableTLKForEncryptedData:secureElement:error:", v54, v8, &v93));
      v56 = v93;

      v57 = objc_msgSend(v55, "BOOLValue");
      if (!(_DWORD)v57 || v56)
      {
        if (!v52)
        {
LABEL_44:

          goto LABEL_45;
        }
        v73 = SESDefaultLogObject(v57, v58);
        v74 = (void *)objc_claimAutoreleasedReturnValue(v73);
        v75 = SESCreateAndLogError(v56, v74, SESErrorDomain, 4, CFSTR("Didn't find a TLK for PTC to load"));
        v76 = (void *)objc_claimAutoreleasedReturnValue(v75);
      }
      else
      {
        v90 = v55;
        v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("A000000704C0000000000002"), "hexStringAsData"));
        v60 = sub_10002EB98(v8, v59);

        if (v60 <= 3
          && ((v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("A000000704C0000000000002"), "hexStringAsData")),
               v92 = 0,
               v62 = sub_100033B5C(v8, v61, (uint64_t)objc_msgSend(v32, "number"), &v92),
               v56 = v92,
               v61,
               !v62)
           || v56))
        {
          v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("A000000704C0000000000002"), "hexStringAsData"));
          v84 = sub_10002EF28(v8, v83, objc_msgSend(v32, "number"));

          v85 = objc_msgSend(v32, "resetToEmpty");
          if (!v52)
          {
            v55 = v90;
            goto LABEL_44;
          }
          v87 = SESDefaultLogObject(v85, v86);
          v74 = (void *)objc_claimAutoreleasedReturnValue(v87);
          v88 = SESCreateAndLogError(v56, v74, SESErrorDomain, 0, CFSTR("Failed to force personalized LC state : %@"));
          v76 = (void *)objc_claimAutoreleasedReturnValue(v88);
          v55 = v90;
        }
        else
        {
          v89 = v53;
          v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("A000000704C0000000000002"), "hexStringAsData"));
          v64 = objc_msgSend(v32, "number");
          v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "keyData"));
          v91 = 0;
          v66 = sub_100032CC8(v8, v63, v64, v65, &v91);
          v56 = v91;

          if (v66 && !v56)
          {

LABEL_36:
            objc_msgSend(v32, "didLoadKey:", v39);
LABEL_14:
            v38 = (void *)objc_claimAutoreleasedReturnValue(+[LoadedKeySlot withKeySlot:key:](LoadedKeySlot, "withKeySlot:key:", v32, v39));
            goto LABEL_15;
          }
          v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("A000000704C0000000000002"), "hexStringAsData"));
          v78 = sub_10002EF28(v8, v77, objc_msgSend(v32, "number"));

          v79 = objc_msgSend(v32, "resetToEmpty");
          v55 = v90;
          if (!v52)
          {
            v53 = v89;
            goto LABEL_44;
          }
          v81 = SESDefaultLogObject(v79, v80);
          v74 = (void *)objc_claimAutoreleasedReturnValue(v81);
          v82 = SESCreateAndLogError(v56, v74, SESErrorDomain, 0, CFSTR("Failed on ImportKey"));
          v76 = (void *)objc_claimAutoreleasedReturnValue(v82);
          v53 = v89;
        }
      }
      *v52 = v76;

      goto LABEL_44;
    }
    if (a5)
    {
      v67 = SESDefaultLogObject(0, v46);
      v32 = (void *)objc_claimAutoreleasedReturnValue(v67);
      v33 = SESErrorDomain;
      v34 = CFSTR("Cannot find slot to slot key");
      v35 = v32;
      v36 = 0;
      goto LABEL_8;
    }
LABEL_31:
    v38 = 0;
    goto LABEL_16;
  }
  if (!a5)
    goto LABEL_31;
  v31 = SESDefaultLogObject(v13, v14);
  v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
  v33 = SESErrorDomain;
  v34 = CFSTR("Couldn't find instance AID: %@");
  v35 = v32;
  v36 = 1;
LABEL_8:
  v37 = SESCreateAndLogError(0, v35, v33, v36, v34);
  v38 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue(v37);
LABEL_15:

LABEL_16:
  return v38;
}

- (void)createSELegacyKey:(id)a3 subjectIdentifier:(id)a4 metaData:(id)a5 localValidationList:(id)a6 reply:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  id v29;
  uint8_t buf[16];

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = a3;
  v18 = SESDefaultLogObject(v16, v17);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "", buf, 2u);
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEKeyXPC) createSELegacyKey:subjectIdentifier:metaData:localValidationList:reply:]"));
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100005200;
  v25[3] = &unk_100302D20;
  v28 = v14;
  v29 = v15;
  v25[4] = self;
  v26 = v12;
  v27 = v13;
  v21 = v14;
  v22 = v13;
  v23 = v12;
  v24 = v15;
  -[SESServer legacyKeyServiceAvailable:reason:reply:](self, "legacyKeyServiceAvailable:reason:reply:", v16, v20, v25);

}

- (void)deleteSELegacyKey:(id)a3 keySlot:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  SESServer *v19;
  id v20;
  uint8_t buf[16];

  v8 = a4;
  v9 = a5;
  v10 = a3;
  v12 = SESDefaultLogObject(v10, v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "", buf, 2u);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEKeyXPC) deleteSELegacyKey:keySlot:reply:]"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000055D4;
  v17[3] = &unk_100302BA8;
  v19 = self;
  v20 = v9;
  v18 = v8;
  v15 = v8;
  v16 = v9;
  -[SESServer legacyKeyServiceAvailable:reason:reply:](self, "legacyKeyServiceAvailable:reason:reply:", v10, v14, v17);

}

- (void)signWithSELegacyKey:(id)a3 keySlot:(id)a4 challenge:(id)a5 metaData:(id)a6 authorization:(id)a7 reply:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  uint8_t buf[16];

  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = a3;
  v21 = SESDefaultLogObject(v19, v20);
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "", buf, 2u);
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEKeyXPC) signWithSELegacyKey:keySlot:challenge:metaData:authorization:reply:]"));
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100005A5C;
  v29[3] = &unk_100302D20;
  v33 = v17;
  v34 = v18;
  v30 = v14;
  v31 = v15;
  v32 = v16;
  v24 = v17;
  v25 = v16;
  v26 = v15;
  v27 = v14;
  v28 = v18;
  -[SESServer legacyKeyServiceAvailable:reason:reply:](self, "legacyKeyServiceAvailable:reason:reply:", v19, v23, v29);

}

- (void)signPrecomputedWithSELegacyKey:(id)a3 keySlot:(id)a4 metaData:(id)a5 authorization:(id)a6 authorizationType:(id)a7 reply:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  uint8_t buf[16];

  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = a3;
  v21 = SESDefaultLogObject(v19, v20);
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "", buf, 2u);
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEKeyXPC) signPrecomputedWithSELegacyKey:keySlot:metaData:authorization:authorizationType:reply:]"));
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100005CDC;
  v29[3] = &unk_100302D20;
  v33 = v17;
  v34 = v18;
  v30 = v14;
  v31 = v15;
  v32 = v16;
  v24 = v17;
  v25 = v16;
  v26 = v15;
  v27 = v14;
  v28 = v18;
  -[SESServer legacyKeyServiceAvailable:reason:reply:](self, "legacyKeyServiceAvailable:reason:reply:", v19, v23, v29);

}

- (void)getSELegacyKeyOccupiedSlots:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[16];

  v6 = a4;
  v7 = a3;
  v9 = SESDefaultLogObject(v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "", buf, 2u);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEKeyXPC) getSELegacyKeyOccupiedSlots:reply:]"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100005ED8;
  v13[3] = &unk_100302D68;
  v13[4] = self;
  v14 = v6;
  v12 = v6;
  -[SESServer legacyKeyServiceAvailable:reason:reply:](self, "legacyKeyServiceAvailable:reason:reply:", v7, v11, v13);

}

- (void)createSEKey:(id)a3 extractedACLs:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  SESServer *v16;
  id v17;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEKeyXPC) createSEKey:extractedACLs:reply:]"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100006054;
  v14[3] = &unk_100302BA8;
  v16 = self;
  v17 = v9;
  v15 = v8;
  v12 = v8;
  v13 = v9;
  -[SESServer keyServiceAvailable:reason:reply:](self, "keyServiceAvailable:reason:reply:", v10, v11, v14);

}

- (id)_createSynchronizableKey:(id)a3 extractedACLs:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _DWORD *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  unsigned int v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  id v46;
  _QWORD v47[4];
  id v48;
  id v49;
  id v50;
  uint64_t *v51;
  uint8_t *v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  _DWORD *v59;
  id obj;
  uint8_t buf[8];
  uint8_t *v62;
  uint64_t v63;
  uint64_t (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  id v66;
  uint8_t v67[4];
  unsigned int v68;
  __int16 v69;
  uint64_t v70;

  v8 = a3;
  v9 = a4;
  v11 = SESDefaultLogObject(v9, v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "_createSynchronizableKey", buf, 2u);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[SEKeySyncManager singleton](_TtC10seserviced16SEKeySyncManager, "singleton"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "ptcViewName"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "getAvailableTLKForViewName:secureElement:", v14, v8));

  if (v15)
  {
    *(_QWORD *)buf = 0;
    v62 = buf;
    v63 = 0x3032000000;
    v64 = sub_100006630;
    v65 = sub_100006640;
    v66 = 0;
    obj = 0;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[SESServer _createKey:acl:error:](self, "_createKey:acl:error:", v8, v9, &obj));
    objc_storeStrong(&v66, obj);
    if (v18 && !*((_QWORD *)v62 + 5))
    {
      v59 = 0;
      v24 = ACMContextCreate((uint64_t *)&v59);
      if (!(_DWORD)v24)
      {
        v26 = v59;
        if (v59)
        {
          v53 = 0;
          v54 = &v53;
          v55 = 0x3032000000;
          v56 = sub_100006630;
          v57 = sub_100006640;
          v58 = 0;
          v47[0] = _NSConcreteStackBlock;
          v47[1] = 3221225472;
          v47[2] = sub_100006648;
          v47[3] = &unk_100302D90;
          v51 = &v53;
          v46 = v8;
          v48 = v46;
          v27 = v18;
          v49 = v27;
          v50 = v15;
          v52 = buf;
          ACMContextGetExternalForm(v26, (uint64_t)v47);
          v28 = ACMContextDelete(v59, 1);
          v59 = 0;
          v30 = (void *)v54[5];
          if (v30 && !*((_QWORD *)v62 + 5))
          {
            v20 = v30;
          }
          else
          {
            v31 = SESDefaultLogObject(v28, v29);
            v32 = objc_claimAutoreleasedReturnValue(v31);
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "slot"));
              v34 = objc_msgSend(v33, "number");
              v35 = *((_QWORD *)v62 + 5);
              *(_DWORD *)v67 = 67109378;
              v68 = v34;
              v69 = 2112;
              v70 = v35;
              _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Failed to export key, deleting it from slot %d (%@)", v67, 0x12u);

            }
            v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("A000000704C0000000000002"), "hexStringAsData"));
            -[SESServer _deleteLoadedKey:instanceAID:loadedKey:error:](self, "_deleteLoadedKey:instanceAID:loadedKey:error:", v46, v36, v27, 0);

            if (a5)
            {
              v39 = SESDefaultLogObject(v37, v38);
              v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
              v41 = SESCreateAndLogError(0, v40, SESErrorDomain, 0, CFSTR("Failed to export key"));
              *a5 = (id)objc_claimAutoreleasedReturnValue(v41);

            }
            v20 = 0;
          }

          _Block_object_dispose(&v53, 8);
          goto LABEL_25;
        }
      }
      if (a5)
      {
        v42 = SESDefaultLogObject(v24, v25);
        v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
        v44 = SESCreateAndLogError(0, v43, SESErrorDomain, 0, CFSTR("Failed to get an ACMContext?"));
        *a5 = (id)objc_claimAutoreleasedReturnValue(v44);

      }
    }
    else if (a5)
    {
      v19 = SESEnsureError(*((_QWORD *)v62 + 5));
      v20 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue(v19);
LABEL_25:

      _Block_object_dispose(buf, 8);
      goto LABEL_26;
    }
    v20 = 0;
    goto LABEL_25;
  }
  if (a5)
  {
    v21 = SESDefaultLogObject(v16, v17);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v23 = SESCreateAndLogError(0, v22, SESErrorDomain, 0, CFSTR("View for SE-PTC is not synced"));
    *a5 = (id)objc_claimAutoreleasedReturnValue(v23);

  }
  v20 = 0;
LABEL_26:

  return v20;
}

- (void)deleteSEKey:(id)a3 keyData:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[16];

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v12 = SESDefaultLogObject(v10, v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "", buf, 2u);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEKeyXPC) deleteSEKey:keyData:reply:]"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10000683C;
  v16[3] = &unk_100302DB8;
  v16[4] = self;
  v17 = v8;
  v15 = v8;
  -[SESServer keyOperation:keyData:reason:reply:](self, "keyOperation:keyData:reason:reply:", v10, v9, v14, v16);

}

- (void)signWithSEKey:(id)a3 keyData:(id)a4 data:(id)a5 algorithm:(id)a6 laExternalizedContext:(id)a7 reply:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void (**v21)(_QWORD, _QWORD, _QWORD);
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  void (**v31)(_QWORD, _QWORD, _QWORD);

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v21 = (void (**)(_QWORD, _QWORD, _QWORD))v19;
  if (v15 && v16 && v17 && v18)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEKeyXPC) signWithSEKey:keyData:data:algorithm:laExternalizedContext:reply:]"));
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100006AC8;
    v27[3] = &unk_100302DE0;
    v31 = v21;
    v28 = v18;
    v29 = v16;
    v30 = v17;
    -[SESServer keyOperation:keyData:reason:reply:](self, "keyOperation:keyData:reason:reply:", v14, v15, v22, v27);

  }
  else
  {
    v23 = SESDefaultLogObject(v19, v20);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v25 = SESCreateAndLogError(0, v24, SESErrorDomain, 1, CFSTR("Nil passed to signWithSEKey"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    ((void (**)(_QWORD, _QWORD, void *))v21)[2](v21, 0, v26);

  }
}

- (void)signPrecomputedDigest:(id)a3 keyData:(id)a4 digest:(id)a5 algorithm:(id)a6 laExternalizedContext:(id)a7 reply:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void (**v21)(_QWORD, _QWORD, _QWORD);
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  void (**v31)(_QWORD, _QWORD, _QWORD);

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v21 = (void (**)(_QWORD, _QWORD, _QWORD))v19;
  if (v15 && v16 && v17 && v18)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEKeyXPC) signPrecomputedDigest:keyData:digest:algorithm:laExternalizedContext:reply:]"));
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100006E2C;
    v27[3] = &unk_100302DE0;
    v31 = v21;
    v28 = v18;
    v29 = v16;
    v30 = v17;
    -[SESServer keyOperation:keyData:reason:reply:](self, "keyOperation:keyData:reason:reply:", v14, v15, v22, v27);

  }
  else
  {
    v23 = SESDefaultLogObject(v19, v20);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v25 = SESCreateAndLogError(0, v24, SESErrorDomain, 1, CFSTR("Nil passed to signPrecomputedDigest"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    ((void (**)(_QWORD, _QWORD, void *))v21)[2](v21, 0, v26);

  }
}

- (void)sharedSecretWithSEKey:(id)a3 keyData:(id)a4 publicKey:(id)a5 algorithm:(id)a6 laExternalizedContext:(id)a7 reply:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  uint8_t buf[16];

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v21 = SESDefaultLogObject(v19, v20);
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "", buf, 2u);
  }

  if (v15 && v16 && v17 && v18)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEKeyXPC) sharedSecretWithSEKey:keyData:publicKey:algorithm:laExternalizedContext:reply:]"));
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_1000071D0;
    v30[3] = &unk_100302DE0;
    v34 = v19;
    v31 = v18;
    v32 = v16;
    v33 = v17;
    -[SESServer keyOperation:keyData:reason:reply:](self, "keyOperation:keyData:reason:reply:", v14, v15, v25, v30);

    v26 = v34;
  }
  else
  {
    v27 = SESDefaultLogObject(v23, v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v27);
    v28 = SESCreateAndLogError(0, v26, SESErrorDomain, 1, CFSTR("Nil passed to sharedSecretWithSEKey"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    (*((void (**)(id, _QWORD, void *))v19 + 2))(v19, 0, v29);

  }
}

- (void)encryptWithSEKey:(id)a3 plainText:(id)a4 publicKey:(id)a5 algorithm:(id)a6 laExternalizedContext:(id)a7 sharedInfo:(id)a8 authenticationData:(id)a9 reply:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  uint8_t buf[16];

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v25 = SESDefaultLogObject(v23, v24);
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "", buf, 2u);
  }

  if (v16 && v17 && v19 && v20)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEKeyXPC) encryptWithSEKey:plainText:publicKey:algorithm:laExternalizedContext:sharedInfo:authenticationData:reply:]"));
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_1000075CC;
    v34[3] = &unk_100302E08;
    v41 = v23;
    v35 = v20;
    v36 = v17;
    v37 = v18;
    v38 = v21;
    v39 = v19;
    v40 = v22;
    -[SESServer keyOperation:keyData:reason:reply:](self, "keyOperation:keyData:reason:reply:", 0, v16, v29, v34);

    v30 = v41;
  }
  else
  {
    v31 = SESDefaultLogObject(v27, v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue(v31);
    v32 = SESCreateAndLogError(0, v30, SESErrorDomain, 1, CFSTR("Nil passed to encryptWithSEKey"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
    (*((void (**)(id, _QWORD, _QWORD, void *))v23 + 2))(v23, 0, 0, v33);

  }
}

- (void)decryptWithSEKey:(id)a3 cipherText:(id)a4 publicKey:(id)a5 algorithm:(id)a6 laExternalizedContext:(id)a7 sharedInfo:(id)a8 authenticationData:(id)a9 authenticationTag:(id)a10 reply:(id)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  void *v41;
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  uint8_t buf[16];

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v24 = a11;
  v26 = SESDefaultLogObject(v24, v25);
  v27 = objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "", buf, 2u);
  }

  if (v16 && v17 && v19 && v20)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEKeyXPC) decryptWithSEKey:cipherText:publicKey:algorithm:laExternalizedContext:sharedInfo:authenticationData:authenticationTag:reply:]"));
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_100007A60;
    v44[3] = &unk_100302E30;
    v52 = v24;
    v45 = v20;
    v46 = v17;
    v47 = v18;
    v48 = v21;
    v49 = v19;
    v50 = v22;
    v51 = v23;
    -[SESServer keyOperation:keyData:reason:reply:](self, "keyOperation:keyData:reason:reply:", 0, v16, v30, v44);

    v31 = v52;
  }
  else
  {
    v32 = SESDefaultLogObject(v28, v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue(v32);
    v33 = SESCreateAndLogError(0, v31, SESErrorDomain, 1, CFSTR("Nil passed to decryptWithSEKey"));
    v43 = v19;
    v34 = v20;
    v35 = v17;
    v36 = v16;
    v37 = v23;
    v38 = v22;
    v39 = v21;
    v40 = v18;
    v41 = (void *)objc_claimAutoreleasedReturnValue(v33);
    (*((void (**)(id, _QWORD, void *))v24 + 2))(v24, 0, v41);

    v18 = v40;
    v21 = v39;
    v22 = v38;
    v23 = v37;
    v16 = v36;
    v17 = v35;
    v20 = v34;
    v19 = v43;
  }

}

- (void)rewrapWithSEKey:(id)a3 cipherText:(id)a4 publicKey:(id)a5 decryptAlgorithm:(id)a6 decryptSharedInfo:(id)a7 encryptAlgorithm:(id)a8 encryptSharedInfo:(id)a9 certificate:(id)a10 laExternalizedContext:(id)a11 decryptAuthenticationData:(id)a12 decryptAuthenticationTag:(id)a13 encryptAuthenticationData:(id)a14 reply:(id)a15
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  id v54;
  id v55;
  id v56;
  _QWORD v57[4];
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  uint8_t buf[16];

  v56 = a3;
  v20 = a4;
  v21 = a5;
  v22 = a6;
  v55 = a7;
  v23 = a8;
  v54 = a9;
  v24 = a10;
  v25 = a11;
  v52 = a12;
  v26 = a13;
  v27 = a14;
  v28 = a15;
  v30 = SESDefaultLogObject(v28, v29);
  v31 = objc_claimAutoreleasedReturnValue(v30);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "", buf, 2u);
  }
  v53 = v27;

  v50 = v25;
  v51 = v22;
  v49 = v20;
  if (v56 && (v34 = v20) != 0 && v21 && v22 && v23 && v24 && v25)
  {
    v48 = v23;
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEKeyXPC) rewrapWithSEKey:cipherText:publicKey:decryptAlgorithm:decryptSharedInfo:encryptAlgorithm:encryptSharedInfo:certificate:laExternalizedContext:decryptAuthenticationData:decryptAuthenticationTag:encryptAuthenticationData:reply:]"));
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472;
    v57[2] = sub_100007F9C;
    v57[3] = &unk_100302E58;
    v36 = v28;
    v69 = v28;
    v58 = v25;
    v59 = v34;
    v60 = v21;
    v37 = v22;
    v38 = v24;
    v39 = v55;
    v61 = v55;
    v62 = v52;
    v63 = v26;
    v64 = v37;
    v40 = v52;
    v41 = v54;
    v65 = v54;
    v42 = v53;
    v66 = v53;
    v67 = v48;
    v68 = v38;
    -[SESServer keyOperation:keyData:reason:reply:](self, "keyOperation:keyData:reason:reply:", 0, v56, v35, v57);

    v23 = v48;
    v43 = v69;
  }
  else
  {
    v44 = SESDefaultLogObject(v32, v33);
    v43 = (void *)objc_claimAutoreleasedReturnValue(v44);
    v45 = SESCreateAndLogError(0, v43, SESErrorDomain, 1, CFSTR("Nil passed to rewrapWithSEKey"));
    v38 = v24;
    v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
    v36 = v28;
    (*((void (**)(id, _QWORD, _QWORD, void *))v28 + 2))(v28, 0, 0, v46);

    v41 = v54;
    v39 = v55;
    v40 = v52;
    v42 = v53;
  }

}

- (void)createPTAttestation:(id)a3 keyData:(id)a4 subjectIdentifier:(id)a5 nonce:(id)a6 OIDs:(id)a7 reply:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void (**v19)(id, _QWORD, void *);
  void *v20;
  SESClientInfo *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  const __CFString *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;
  void (**v43)(id, _QWORD, void *);
  uint8_t buf[16];

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = (void (**)(id, _QWORD, void *))a8;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v21 = sub_100033EAC((uint64_t)SESClientInfo, v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);

  v23 = sub_1000340E0((uint64_t)v22);
  if ((v23 & 1) == 0)
  {
    v30 = SESDefaultLogObject(v23, v24);
    v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    v32 = SESErrorDomain;
    v33 = CFSTR("Missing PTAttestation entitlement");
    v34 = v31;
    v35 = 5;
LABEL_9:
    v37 = SESCreateAndLogError(0, v34, v32, v35, v33);
    v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
    v19[2](v19, 0, v38);

    goto LABEL_10;
  }
  v25 = SESDefaultLogObject(v23, v24);
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "", buf, 2u);
  }

  if (!v15 || !v16)
  {
    v36 = SESDefaultLogObject(v27, v28);
    v31 = (void *)objc_claimAutoreleasedReturnValue(v36);
    v32 = SESErrorDomain;
    v33 = CFSTR("Nil passed to createPTAttestation");
    v34 = v31;
    v35 = 1;
    goto LABEL_9;
  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEKeyXPC) createPTAttestation:keyData:subjectIdentifier:nonce:OIDs:reply:]"));
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_100008404;
  v39[3] = &unk_100302DE0;
  v43 = v19;
  v40 = v18;
  v41 = v16;
  v42 = v17;
  -[SESServer keyOperation:keyData:reason:reply:](self, "keyOperation:keyData:reason:reply:", v14, v15, v29, v39);

LABEL_10:
}

- (void)getCASDCertificate:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  SESClientInfo *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v9 = sub_100033EAC((uint64_t)SESClientInfo, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  v11 = sub_1000340E0((uint64_t)v10);
  if ((v11 & 1) != 0)
  {
    v13 = SESDefaultLogObject(v11, v12);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "", buf, 2u);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEKeyXPC) getCASDCertificate:reply:]"));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100008924;
    v20[3] = &unk_100302E80;
    v21 = v7;
    -[SESServer keyServiceAvailable:reason:reply:](self, "keyServiceAvailable:reason:reply:", v6, v15, v20);

  }
  else
  {
    v16 = SESDefaultLogObject(v11, v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = SESCreateAndLogError(0, v17, SESErrorDomain, 5, CFSTR("Missing PTAttestation entitlement"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v19);

  }
}

- (void)createSEABAASCertificate:(id)a3 subjectIdentifier:(id)a4 nonce:(id)a5 OIDs:(id)a6 validityInterval:(id)a7 reply:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  _QWORD v30[5];
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  uint8_t buf[16];

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v21 = SESDefaultLogObject(v19, v20);
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "", buf, 2u);
  }

  if (v14)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEKeyXPC) createSEABAASCertificate:subjectIdentifier:nonce:OIDs:validityInterval:reply:]"));
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100008C14;
    v30[3] = &unk_100302EA8;
    v35 = v19;
    v30[4] = self;
    v31 = v15;
    v32 = v16;
    v33 = v17;
    v34 = v18;
    -[SESServer keyOperation:keyData:reason:reply:](self, "keyOperation:keyData:reason:reply:", 0, v14, v25, v30);

    v26 = v35;
  }
  else
  {
    v27 = SESDefaultLogObject(v23, v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v27);
    v28 = SESCreateAndLogError(0, v26, SESErrorDomain, 1, CFSTR("Nil passed to createSEABAASCertificate"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    (*((void (**)(id, _QWORD, void *))v19 + 2))(v19, 0, v29);

  }
}

- (id)_getBAACertificatesForKey:(id)a3 key:(id)a4 subjectIdentifier:(id)a5 nonce:(id)a6 OIDs:(id)a7 validityInterval:(id)a8 error:(id *)a9
{
  id v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  unsigned int v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  void *i;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  const char *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  id v48;
  void *v49;
  id v50;
  id v51;
  id v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t v58[128];
  uint8_t buf[4];
  unsigned int v60;
  __int16 v61;
  unsigned int v62;

  v50 = a3;
  v15 = a4;
  v51 = a5;
  v52 = a6;
  v16 = a7;
  v48 = a8;
  v17 = objc_claimAutoreleasedReturnValue(-[SESServer messageQueue](self, "messageQueue"));
  dispatch_assert_queue_V2(v17);

  v20 = SESDefaultLogObject(v18, v19);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "slot"));
    v23 = objc_msgSend(v22, "number");
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "key"));
    *(_DWORD *)buf = 67109376;
    v60 = v23;
    v61 = 1024;
    v62 = objc_msgSend(v24, "keyNumber");
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Attest with slot %u key 0x%x", buf, 0xEu);

  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](NSMutableData, "data"));
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v26 = v16;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v28; i = (char *)i + 1)
      {
        if (*(_QWORD *)v55 != v29)
          objc_enumerationMutation(v26);
        v31 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v31, "isEqualToString:", CFSTR("1.2.840.113635.100.6.65.16")) & 1) != 0)
        {
          v32 = 16;
        }
        else if ((objc_msgSend(v31, "isEqualToString:", CFSTR("1.2.840.113635.100.6.65.17")) & 1) != 0)
        {
          v32 = 17;
        }
        else
        {
          if (!objc_msgSend(v31, "isEqualToString:", CFSTR("1.2.840.113635.100.6.65.19")))
            continue;
          v32 = 19;
        }
        objc_msgSend(v25, "appendU8:", v32);
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
    }
    while (v28);
  }

  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("A000000704C0000000000002"), "hexStringAsData"));
  v53 = 0;
  v34 = v51;
  v35 = v52;
  v36 = sub_10003181C(v50, v33, v15, v51, v25, v52, &v53);
  v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
  v38 = v53;

  v49 = v15;
  if (!v37 || v38)
  {
    if (a9)
    {
      v46 = SESEnsureError(v38);
      v45 = 0;
      *a9 = (id)objc_claimAutoreleasedReturnValue(v46);
    }
    else
    {
      v45 = 0;
    }
    v44 = v48;
  }
  else
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[SEABAAManager sharedManager](SEABAAManager, "sharedManager"));
    v41 = sub_10005066C(v50, v40);
    v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "casdCertificate"));
    v44 = v48;
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "PerformSEABAAWithAttestation:casdCertificate:nonce:OIDs:validityInterval:error:", v37, v43, v52, v26, v48, a9));

    v34 = v51;
    v35 = v52;

  }
  return v45;
}

- (void)getSESKeySupportedFeatures:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[16];

  v4 = a3;
  v6 = SESDefaultLogObject(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "", buf, 2u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEKeyXPC) getSESKeySupportedFeatures:]"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100009174;
  v10[3] = &unk_100302E80;
  v11 = v4;
  v9 = v4;
  -[SESServer keyServiceAvailable:reason:reply:](self, "keyServiceAvailable:reason:reply:", 0, v8, v10);

}

- (void)createCertificateForKeyData:(id)a3 withKeyData:(id)a4 subjectIdentifier:(id)a5 authorityIdentifier:(id)a6 laExternalizedContext:(id)a7 nonce:(id)a8 OIDs:(id)a9 reply:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void (**v23)(id, _QWORD, id);
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  SESServer *v40;
  void *v41;
  _QWORD v42[5];
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  void (**v50)(id, _QWORD, id);
  id v51;
  id v52;
  uint8_t buf[16];

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = (void (**)(id, _QWORD, id))a10;
  v25 = SESDefaultLogObject(v23, v24);
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "", buf, 2u);
  }

  if (v16 && v17 && v18 && v19 && v20)
  {
    v40 = self;
    v41 = v22;
    v29 = v21;
    v52 = 0;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[PTClassicKey withData:error:](PTClassicKey, "withData:error:", v16, &v52));
    v31 = v52;
    v32 = v31;
    if (!v30 || v31)
    {
      v23[2](v23, 0, v31);
    }
    else
    {
      v51 = 0;
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[PTClassicKey withData:error:](PTClassicKey, "withData:error:", v17, &v51));
      v34 = v51;
      v32 = v34;
      if (!v33 || v34)
      {
        v23[2](v23, 0, v34);
        v35 = v33;
        v21 = v29;
      }
      else
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEKeyXPC) createCertificateForKeyData:withKeyData:subjectIdentifier:authorityIdentifier:laExternalizedContext:nonce:OIDs:reply:]"));
        v42[0] = _NSConcreteStackBlock;
        v42[1] = 3221225472;
        v42[2] = sub_1000095C8;
        v42[3] = &unk_100302ED0;
        v50 = v23;
        v42[4] = v40;
        v43 = v30;
        v44 = v33;
        v45 = v41;
        v46 = v20;
        v47 = v18;
        v48 = v19;
        v38 = v33;
        v21 = v29;
        v49 = v29;
        -[SESServer keyServiceAvailable:reason:reply:](v40, "keyServiceAvailable:reason:reply:", 0, v39, v42);

        v35 = v38;
      }

    }
    v22 = v41;
  }
  else
  {
    v36 = SESDefaultLogObject(v27, v28);
    v32 = (void *)objc_claimAutoreleasedReturnValue(v36);
    v37 = SESCreateAndLogError(0, v32, SESErrorDomain, 1, CFSTR("Nil passed to createCertificateForKeyData"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(v37);
    v23[2](v23, 0, v30);
  }

}

- (void)updateACLForSEKey:(id)a3 extractedACLs:(id)a4 laExternalizedContext:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void (**v15)(_QWORD, _QWORD, _QWORD);
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  void (**v24)(_QWORD, _QWORD, _QWORD);

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v15 = (void (**)(_QWORD, _QWORD, _QWORD))v13;
  if (v10 && v11 && v12)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEKeyXPC) updateACLForSEKey:extractedACLs:laExternalizedContext:reply:]"));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100009AE0;
    v21[3] = &unk_100302EF8;
    v24 = v15;
    v22 = v12;
    v23 = v11;
    -[SESServer keyOperation:keyData:reason:reply:](self, "keyOperation:keyData:reason:reply:", 0, v10, v16, v21);

  }
  else
  {
    v17 = SESDefaultLogObject(v13, v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = SESCreateAndLogError(0, v18, SESErrorDomain, 1, CFSTR("Nil passed to updateACLForSEKey"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    ((void (**)(_QWORD, _QWORD, void *))v15)[2](v15, 0, v20);

  }
}

- (void)checkKeyValidity:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  dispatch_semaphore_t v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  NSObject *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v8 = dispatch_semaphore_create(0);
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEKeyXPC) checkKeyValidity:completion:]"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100009EDC;
  v11[3] = &unk_100302F20;
  v13 = &v14;
  v10 = v8;
  v12 = v10;
  -[SESServer keyOperation:keyData:reason:reply:](self, "keyOperation:keyData:reason:reply:", 0, v6, v9, v11);

  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  v7[2](v7, *((unsigned __int8 *)v15 + 24));

  _Block_object_dispose(&v14, 8);
}

- (void)designateKey:(id)a3 designation:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v12 = SESDefaultLogObject(v10, v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v15 = 138412546;
    v16 = v8;
    v17 = 2112;
    v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "designateKey %@ %@", (uint8_t *)&v15, 0x16u);
  }

  v14 = objc_msgSend(v9, "integerValue");
  if (v8)
    -[SESServer setDesignation:designation:completion:](self, "setDesignation:designation:completion:", v8, v14, v10);
  else
    -[SESServer removeDesignation:completion:](self, "removeDesignation:completion:", v14, v10);

}

- (void)setDesignation:(id)a3 designation:(int64_t)a4 completion:(id)a5
{
  id v8;
  _QWORD v9[4];
  id v10;
  int64_t v11;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000A0AC;
  v9[3] = &unk_100302F48;
  v10 = a5;
  v11 = a4;
  v8 = v10;
  -[SESServer keyOperation:keyData:reason:reply:](self, "keyOperation:keyData:reason:reply:", 0, a3, CFSTR("designateKey"), v9);

}

- (void)removeDesignation:(int64_t)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  void (**v8)(_QWORD, _QWORD);
  void *v9;
  SESClientInfo *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD block[5];
  void (**v22)(_QWORD, _QWORD);
  int64_t v23;

  v6 = a4;
  v8 = (void (**)(_QWORD, _QWORD))v6;
  if (!a3)
  {
    v15 = SESDefaultLogObject(v6, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v16 = SESCreateAndLogError(0, v11, SESErrorDomain, 1, CFSTR("Removing desgination none?!"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    ((void (**)(_QWORD, void *))v8)[2](v8, v17);
LABEL_6:

    goto LABEL_7;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v10 = sub_100033EAC((uint64_t)SESClientInfo, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  v12 = sub_1000340C0((uint64_t)v11);
  if ((v12 & 1) == 0)
  {
    v18 = SESDefaultLogObject(v12, v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v19 = SESCreateAndLogError(0, v17, SESErrorDomain, 5, CFSTR("Missing SESKey entitlement"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    ((void (**)(_QWORD, void *))v8)[2](v8, v20);

    goto LABEL_6;
  }
  v14 = objc_claimAutoreleasedReturnValue(-[SESServer messageQueue](self, "messageQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A5B4;
  block[3] = &unk_100302F70;
  v22 = v8;
  v23 = a3;
  block[4] = self;
  dispatch_async(v14, block);

LABEL_7:
}

- (void)createFiDOKeyForRelyingParty:(id)a3 relyingPartyAccountHash:(id)a4 challenge:(id)a5 usingProxy:(id)a6 callback:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(id, _QWORD, void *);
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  SESClientInfo *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const __CFString *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  _QWORD v40[4];
  id v41;
  SESServer *v42;
  id v43;
  id v44;
  id v45;
  void (**v46)(id, _QWORD, void *);
  uint8_t buf[16];

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(id, _QWORD, void *))a7;
  v18 = SESDefaultLogObject(v16, v17);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "", buf, 2u);
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[SEFidoKeyManager singleton](_TtC10seserviced16SEFidoKeyManager, "singleton"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v22 = sub_100033EAC((uint64_t)SESClientInfo, v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);

  if ((sub_1000340F0((uint64_t)v23) & 1) == 0)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[SEFidoEvents callerError](_TtC10seserviced12SEFidoEvents, "callerError"));
    objc_msgSend(v20, "reportCAEvent:", v26);

    v29 = SESDefaultLogObject(v27, v28);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v29);
    v30 = SESErrorDomain;
    v31 = CFSTR("Not entitled");
    v32 = v25;
    v33 = 8;
LABEL_10:
    v38 = SESCreateAndLogError(0, v32, v30, v33, v31);
    v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
    v16[2](v16, 0, v39);

    goto LABEL_11;
  }
  if (!v12 || !v13 || !v14)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[SEFidoEvents callerError](_TtC10seserviced12SEFidoEvents, "callerError"));
    objc_msgSend(v20, "reportCAEvent:", v34);

    v37 = SESDefaultLogObject(v35, v36);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v37);
    v30 = SESErrorDomain;
    v31 = CFSTR("Nil passed to createFiDOKeyForRelyingParty");
    v32 = v25;
    v33 = 1;
    goto LABEL_10;
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEKeyXPC) createFiDOKeyForRelyingParty:relyingPartyAccountHash:challenge:usingProxy:callback:]"));
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_10000AAAC;
  v40[3] = &unk_100302F98;
  v41 = v20;
  v46 = v16;
  v42 = self;
  v43 = v12;
  v44 = v13;
  v45 = v14;
  -[SESServer keyServiceAvailable:reason:reply:](self, "keyServiceAvailable:reason:reply:", v15, v24, v40);

  v25 = v41;
LABEL_11:

}

- (id)_extractedACLForFidoKey
{
  return +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &unk_1002866B8, 41);
}

- (id)_aclForFidoAttestingKey
{
  SecAccessControlRef v2;

  v2 = SecAccessControlCreateWithFlags(kCFAllocatorDefault, kSecAttrAccessibleAfterFirstUnlock, 0, 0);
  SecAccessControlSetConstraints(v2, &off_100322D48);
  return v2;
}

- (id)_createKey:(id)a3 acl:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  unsigned int v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  unsigned int v36;
  void *v37;
  id v38;
  uint64_t v39;
  id v41;
  id v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  unsigned int v46;

  v8 = a3;
  v9 = a4;
  v10 = objc_claimAutoreleasedReturnValue(-[SESServer messageQueue](self, "messageQueue"));
  dispatch_assert_queue_V2(v10);

  v11 = objc_claimAutoreleasedReturnValue(-[SESServer getUsableKeySlot:](self, "getUsableKeySlot:", CFSTR("A000000704C0000000000002")));
  v13 = (void *)v11;
  if (v11)
  {
    v14 = SESDefaultLogObject(v11, v12);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v44) = objc_msgSend(v13, "number");
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Creating key in slot %u", buf, 8u);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("A000000704C0000000000002"), "hexStringAsData"));
    v42 = 0;
    v17 = sub_10002E470(v8, v16, (uint64_t)objc_msgSend(v13, "number"), v9, &v42);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = v42;

    if (!v18 || v19)
    {
      objc_msgSend(v13, "resetToEmpty");
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("A000000704C0000000000002"), "hexStringAsData"));
      v32 = sub_10002EF28(v8, v31, objc_msgSend(v13, "number"));

      if (a5)
      {
        v33 = SESEnsureError(v19);
        v23 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue(v33);
      }
      else
      {
        v23 = 0;
      }
    }
    else
    {
      v41 = 0;
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[PTClassicKey withData:error:](PTClassicKey, "withData:error:", v18, &v41));
      v21 = v41;
      v19 = v21;
      if (!v20 || v21)
      {
        v34 = SESDefaultLogObject(v21, v22);
        v35 = objc_claimAutoreleasedReturnValue(v34);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          v36 = objc_msgSend(v13, "number");
          *(_DWORD *)buf = 67109120;
          LODWORD(v44) = v36;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "Failed to create key object, resetting and deleting slot %d", buf, 8u);
        }

        objc_msgSend(v13, "resetToEmpty");
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("A000000704C0000000000002"), "hexStringAsData"));
        v38 = sub_10002EF28(v8, v37, objc_msgSend(v13, "number"));

        if (a5)
        {
          v39 = SESEnsureError(v19);
          v23 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue(v39);
        }
        else
        {
          v23 = 0;
        }
      }
      else
      {
        objc_msgSend(v13, "didLoadKey:", v20);
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[LoadedKeySlot withKeySlot:key:](LoadedKeySlot, "withKeySlot:key:", v13, v20));
        v25 = SESDefaultLogObject(v23, v24);
        v26 = objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          v27 = objc_msgSend(v13, "number");
          *(_DWORD *)buf = 138412546;
          v44 = v20;
          v45 = 1024;
          v46 = v27;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Created key %@ in slot %u", buf, 0x12u);
        }

      }
    }

  }
  else
  {
    if (a5)
    {
      v28 = SESDefaultLogObject(0, v12);
      v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
      v30 = SESCreateAndLogError(0, v29, SESErrorDomain, 7, CFSTR("Couldn't get slot to create key"));
      *a5 = (id)objc_claimAutoreleasedReturnValue(v30);

    }
    v23 = 0;
  }

  return v23;
}

- (BOOL)_deleteLoadedKey:(id)a3 instanceAID:(id)a4 loadedKey:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v28;
  void *v29;
  __int16 v30;
  unsigned int v31;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = objc_claimAutoreleasedReturnValue(-[SESServer messageQueue](self, "messageQueue"));
  dispatch_assert_queue_V2(v13);

  v16 = SESDefaultLogObject(v14, v15);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "key"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "slot"));
    v28 = 138412546;
    v29 = v18;
    v30 = 1024;
    v31 = objc_msgSend(v19, "number");
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Deleting key %@ in slot %d", (uint8_t *)&v28, 0x12u);

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "slot"));
  v21 = sub_10002EF28(v12, v11, objc_msgSend(v20, "number"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "slot"));
  objc_msgSend(v23, "resetToEmpty");

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[SESKeyDesignationStorageCoordinator getAndReturnError:](_TtC10seserviced35SESKeyDesignationStorageCoordinator, "getAndReturnError:", 0));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "key"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "keyIdentifier"));
  objc_msgSend(v24, "removeDesignationWithKeyIdentifier:", v26);

  if (a6)
    *a6 = objc_retainAutorelease(v22);

  return v22 == 0;
}

- (void)checkMultipleFidoKeyPresence:(id)a3 usingProxy:(id)a4 callback:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  SESClientInfo *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const __CFString *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  void (**v37)(id, _QWORD, void *);
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  v12 = SESDefaultLogObject(v10, v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "", buf, 2u);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[SEFidoKeyManager singleton](_TtC10seserviced16SEFidoKeyManager, "singleton"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v16 = sub_100033EAC((uint64_t)SESClientInfo, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

  if ((sub_1000340F0((uint64_t)v17) & 1) == 0)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[SEFidoEvents callerError](_TtC10seserviced12SEFidoEvents, "callerError"));
    objc_msgSend(v14, "reportCAEvent:", v20);

    v23 = SESDefaultLogObject(v21, v22);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v24 = SESErrorDomain;
    v25 = CFSTR("Not entitled");
    v26 = v19;
    v27 = 8;
LABEL_8:
    v32 = SESCreateAndLogError(0, v26, v24, v27, v25);
    v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
    v10[2](v10, 0, v33);

    goto LABEL_9;
  }
  if (!v8)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[SEFidoEvents callerError](_TtC10seserviced12SEFidoEvents, "callerError"));
    objc_msgSend(v14, "reportCAEvent:", v28);

    v31 = SESDefaultLogObject(v29, v30);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v31);
    v24 = SESErrorDomain;
    v25 = CFSTR("Nil passed to checkMultipleFidoKeyPresence");
    v26 = v19;
    v27 = 1;
    goto LABEL_8;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEKeyXPC) checkMultipleFidoKeyPresence:usingProxy:callback:]"));
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_10000BD50;
  v34[3] = &unk_100302FC0;
  v35 = v14;
  v37 = v10;
  v36 = v8;
  -[SESServer keyServiceAvailable:reason:reply:](self, "keyServiceAvailable:reason:reply:", v9, v18, v34);

  v19 = v35;
LABEL_9:

}

- (void)signMultipleWithFidoKeysFor:(id)a3 challenges:(id)a4 forEndpointIdentifiers:(id)a5 externalizedAuth:(id)a6 usingProxy:(id)a7 callback:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void (**v19)(id, _QWORD, void *);
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  SESClientInfo *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const __CFString *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  _QWORD v49[4];
  id v50;
  id v51;
  id v52;
  SESServer *v53;
  id v54;
  id v55;
  void (**v56)(id, _QWORD, void *);
  uint8_t buf[16];

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = (void (**)(id, _QWORD, void *))a8;
  v21 = SESDefaultLogObject(v19, v20);
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "", buf, 2u);
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[SEFidoKeyManager singleton](_TtC10seserviced16SEFidoKeyManager, "singleton"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v25 = sub_100033EAC((uint64_t)SESClientInfo, v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue(v25);

  if ((sub_1000340F0((uint64_t)v26) & 1) == 0)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[SEFidoEvents callerError](_TtC10seserviced12SEFidoEvents, "callerError"));
    objc_msgSend(v23, "reportCAEvent:", v31);

    v34 = SESDefaultLogObject(v32, v33);
    v30 = (void *)objc_claimAutoreleasedReturnValue(v34);
    v35 = SESErrorDomain;
    v36 = CFSTR("Not entitled");
    v37 = v30;
    v38 = 8;
LABEL_15:
    v47 = SESCreateAndLogError(0, v37, v35, v38, v36);
    v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
    v19[2](v19, 0, v48);

    goto LABEL_16;
  }
  if (!v14 || !v15 || !v17)
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[SEFidoEvents callerError](_TtC10seserviced12SEFidoEvents, "callerError"));
    objc_msgSend(v23, "reportCAEvent:", v39);

    v42 = SESDefaultLogObject(v40, v41);
    v30 = (void *)objc_claimAutoreleasedReturnValue(v42);
    v35 = SESErrorDomain;
    v36 = CFSTR("Nil passed to signMultipleWithFidoKeysFor");
LABEL_14:
    v37 = v30;
    v38 = 1;
    goto LABEL_15;
  }
  v27 = objc_msgSend(v14, "count");
  if (v27 != objc_msgSend(v15, "count") || v16 && (v28 = objc_msgSend(v15, "count"), v28 != objc_msgSend(v16, "count")))
  {
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[SEFidoEvents callerError](_TtC10seserviced12SEFidoEvents, "callerError"));
    objc_msgSend(v23, "reportCAEvent:", v43);

    v46 = SESDefaultLogObject(v44, v45);
    v30 = (void *)objc_claimAutoreleasedReturnValue(v46);
    v35 = SESErrorDomain;
    v36 = CFSTR("Unevent lengths passed to signMultipleWithFidoKeysFor");
    goto LABEL_14;
  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEKeyXPC) signMultipleWithFidoKeysFor:challenges:forEndpointIdentifiers:externalizedAuth:usingProxy:callback:]"));
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_10000C3D0;
  v49[3] = &unk_100302FE8;
  v50 = v23;
  v56 = v19;
  v51 = v14;
  v52 = v15;
  v53 = self;
  v54 = v16;
  v55 = v17;
  -[SESServer keyServiceAvailable:reason:reply:](self, "keyServiceAvailable:reason:reply:", v18, v29, v49);

  v30 = v50;
LABEL_16:

}

- (void)verifyWithFidoKeyFor:(id)a3 signedChallenge:(id)a4 usingProxy:(id)a5 callback:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, _UNKNOWN **, void *);
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  SESClientInfo *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const __CFString *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  void (**v41)(id, _UNKNOWN **, void *);
  uint8_t buf[16];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _UNKNOWN **, void *))a6;
  v15 = SESDefaultLogObject(v13, v14);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "", buf, 2u);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[SEFidoKeyManager singleton](_TtC10seserviced16SEFidoKeyManager, "singleton"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v19 = sub_100033EAC((uint64_t)SESClientInfo, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

  if ((sub_1000340F0((uint64_t)v20) & 1) == 0)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[SEFidoEvents callerError](_TtC10seserviced12SEFidoEvents, "callerError"));
    objc_msgSend(v17, "reportCAEvent:", v23);

    v26 = SESDefaultLogObject(v24, v25);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v26);
    v27 = SESErrorDomain;
    v28 = CFSTR("Not entitled");
    v29 = v22;
    v30 = 8;
LABEL_9:
    v35 = SESCreateAndLogError(0, v29, v27, v30, v28);
    v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
    v13[2](v13, &off_100322DE8, v36);

    goto LABEL_10;
  }
  if (!v10 || !v11)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[SEFidoEvents callerError](_TtC10seserviced12SEFidoEvents, "callerError"));
    objc_msgSend(v17, "reportCAEvent:", v31);

    v34 = SESDefaultLogObject(v32, v33);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v34);
    v27 = SESErrorDomain;
    v28 = CFSTR("Nil passed to verifyWithFidoKeyFor");
    v29 = v22;
    v30 = 1;
    goto LABEL_9;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEKeyXPC) verifyWithFidoKeyFor:signedChallenge:usingProxy:callback:]"));
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_10000CC84;
  v37[3] = &unk_100303010;
  v38 = v17;
  v41 = v13;
  v39 = v10;
  v40 = v11;
  -[SESServer keyServiceAvailable:reason:reply:](self, "keyServiceAvailable:reason:reply:", v12, v21, v37);

  v22 = v38;
LABEL_10:

}

- (void)deleteFiDOKeyFor:(id)a3 usingProxy:(id)a4 callback:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  SESClientInfo *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void (**v20)(id, void *);
  uint64_t v21;
  uint64_t v22;
  const __CFString *v23;
  void (**v24)(id, void *);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  void (**v31)(id, void *);
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  v12 = SESDefaultLogObject(v10, v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "", buf, 2u);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v15 = sub_100033EAC((uint64_t)SESClientInfo, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  v17 = sub_1000340F0((uint64_t)v16);
  if ((v17 & 1) == 0)
  {
    v21 = SESDefaultLogObject(v17, v18);
    v20 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue(v21);
    v22 = SESErrorDomain;
    v23 = CFSTR("Not entitled");
    v24 = v20;
    v25 = 8;
LABEL_8:
    v27 = SESCreateAndLogError(0, v24, v22, v25, v23);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    v10[2](v10, v28);

    goto LABEL_9;
  }
  if (!v8)
  {
    v26 = SESDefaultLogObject(v17, v18);
    v20 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue(v26);
    v22 = SESErrorDomain;
    v23 = CFSTR("Nil passed to signMultipleWithFidoKeysFor");
    v24 = v20;
    v25 = 1;
    goto LABEL_8;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEKeyXPC) deleteFiDOKeyFor:usingProxy:callback:]"));
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10000D250;
  v29[3] = &unk_100302D68;
  v31 = v10;
  v30 = v8;
  -[SESServer keyServiceAvailable:reason:reply:](self, "keyServiceAvailable:reason:reply:", v9, v19, v29);

  v20 = v31;
LABEL_9:

}

- (void)createPrivacyKeyForGroupIdentifier:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  id v7;
  void (**v8)(id, _QWORD, void *);
  void *v9;
  SESClientInfo *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  const __CFString *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;

  v23 = a3;
  v7 = a4;
  v8 = (void (**)(id, _QWORD, void *))a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v10 = sub_100033EAC((uint64_t)SESClientInfo, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  v12 = sub_100034100((uint64_t)v11);
  if ((v12 & 1) == 0)
  {
    v14 = SESDefaultLogObject(v12, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = SESErrorDomain;
    v17 = CFSTR("Not entitled");
    v18 = v15;
    v19 = 8;
LABEL_6:
    v21 = SESCreateAndLogError(0, v18, v16, v19, v17);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v8[2](v8, 0, v22);

    goto LABEL_7;
  }
  if (!v23)
  {
    v20 = SESDefaultLogObject(v12, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v16 = SESErrorDomain;
    v17 = CFSTR("Nil input");
    v18 = v15;
    v19 = 1;
    goto LABEL_6;
  }
  +[SESPrivacyKeyImplementation createPrivacyKeyWithGroupIdentifier:options:completion:](_TtC10seserviced27SESPrivacyKeyImplementation, "createPrivacyKeyWithGroupIdentifier:options:completion:", v23, v7, v8);
LABEL_7:

}

- (void)privacyKeysForGroupIdentifier:(id)a3 keyIdentifier:(id)a4 completion:(id)a5
{
  id v7;
  void (**v8)(id, _QWORD, void *);
  void *v9;
  SESClientInfo *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  const __CFString *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;

  v23 = a3;
  v7 = a4;
  v8 = (void (**)(id, _QWORD, void *))a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v10 = sub_100033EAC((uint64_t)SESClientInfo, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  v12 = sub_100034100((uint64_t)v11);
  if ((v12 & 1) == 0)
  {
    v14 = SESDefaultLogObject(v12, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = SESErrorDomain;
    v17 = CFSTR("Not entitled");
    v18 = v15;
    v19 = 8;
LABEL_6:
    v21 = SESCreateAndLogError(0, v18, v16, v19, v17);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v8[2](v8, 0, v22);

    goto LABEL_7;
  }
  if (!v23)
  {
    v20 = SESDefaultLogObject(v12, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v16 = SESErrorDomain;
    v17 = CFSTR("Nil input");
    v18 = v15;
    v19 = 1;
    goto LABEL_6;
  }
  +[SESPrivacyKeyImplementation getPrivacyKeyWithGroupIdentifier:keyIdentifier:completion:](_TtC10seserviced27SESPrivacyKeyImplementation, "getPrivacyKeyWithGroupIdentifier:keyIdentifier:completion:", v23, v7, v8);
LABEL_7:

}

- (void)deletePrivacyKey:(id)a3 completion:(id)a4
{
  void (**v5)(id, void *);
  void *v6;
  SESClientInfo *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  const __CFString *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;

  v20 = a3;
  v5 = (void (**)(id, void *))a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v7 = sub_100033EAC((uint64_t)SESClientInfo, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  v9 = sub_100034100((uint64_t)v8);
  if ((v9 & 1) == 0)
  {
    v11 = SESDefaultLogObject(v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = SESErrorDomain;
    v14 = CFSTR("Not entitled");
    v15 = v12;
    v16 = 8;
LABEL_6:
    v18 = SESCreateAndLogError(0, v15, v13, v16, v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v5[2](v5, v19);

    goto LABEL_7;
  }
  if (!v20)
  {
    v17 = SESDefaultLogObject(v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v13 = SESErrorDomain;
    v14 = CFSTR("Nil input");
    v15 = v12;
    v16 = 1;
    goto LABEL_6;
  }
  +[SESPrivacyKeyImplementation deletePrivacyKey:completion:](_TtC10seserviced27SESPrivacyKeyImplementation, "deletePrivacyKey:completion:", v20, v5);
LABEL_7:

}

- (void)decryptPayload:(id)a3 withGroupIdentifier:(id)a4 completion:(id)a5
{
  id v7;
  void (**v8)(id, _QWORD, void *);
  void *v9;
  SESClientInfo *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  const __CFString *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;

  v23 = a3;
  v7 = a4;
  v8 = (void (**)(id, _QWORD, void *))a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v10 = sub_100033EAC((uint64_t)SESClientInfo, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  v12 = sub_100034100((uint64_t)v11);
  if ((v12 & 1) == 0)
  {
    v14 = SESDefaultLogObject(v12, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = SESErrorDomain;
    v17 = CFSTR("Not entitled");
    v18 = v15;
    v19 = 8;
LABEL_7:
    v21 = SESCreateAndLogError(0, v18, v16, v19, v17);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v8[2](v8, 0, v22);

    goto LABEL_8;
  }
  if (!v23 || !v7)
  {
    v20 = SESDefaultLogObject(v12, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v16 = SESErrorDomain;
    v17 = CFSTR("Nil input");
    v18 = v15;
    v19 = 1;
    goto LABEL_7;
  }
  +[SESPrivacyKeyImplementation decryptPayload:groupIdentifier:completion:](_TtC10seserviced27SESPrivacyKeyImplementation, "decryptPayload:groupIdentifier:completion:");
LABEL_8:

}

- (void)encryptPayload:(id)a3 encryptionScheme:(id)a4 recipientPublicKey:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  void (**v11)(id, _QWORD, void *);
  void *v12;
  SESClientInfo *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  const __CFString *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;

  v26 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void (**)(id, _QWORD, void *))a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v13 = sub_100033EAC((uint64_t)SESClientInfo, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  v15 = sub_100034100((uint64_t)v14);
  if ((v15 & 1) == 0)
  {
    v17 = SESDefaultLogObject(v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = SESErrorDomain;
    v20 = CFSTR("Not entitled");
    v21 = v18;
    v22 = 8;
LABEL_8:
    v24 = SESCreateAndLogError(0, v21, v19, v22, v20);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    v11[2](v11, 0, v25);

    goto LABEL_9;
  }
  if (!v26 || !v9 || !v10)
  {
    v23 = SESDefaultLogObject(v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v19 = SESErrorDomain;
    v20 = CFSTR("Nil input");
    v21 = v18;
    v22 = 1;
    goto LABEL_8;
  }
  +[SESPrivacyKeyImplementation encryptPayload:scheme:recipientPublicKey:completion:](_TtC10seserviced27SESPrivacyKeyImplementation, "encryptPayload:scheme:recipientPublicKey:completion:");
LABEL_9:

}

- (void)endPointServiceAvailableWithProxy:(id)a3 reason:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  _QWORD *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v12 = SESDefaultLogObject(v10, v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "", buf, 2u);
  }

  if (v8)
  {
    v14 = sub_10004CFC0((uint64_t)SEProxyAdapter, v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  }
  else
  {
    v15 = 0;
  }
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100017BD8;
  v17[3] = &unk_100302B58;
  v17[4] = self;
  v18 = v10;
  v16 = v10;
  sub_1000516E8((uint64_t)SecureElementManager, v15, v9, v17);

}

- (void)endPointServiceAvailable:(id)a3 reply:(id)a4
{
  -[SESServer endPointServiceAvailableWithProxy:reason:reply:](self, "endPointServiceAvailableWithProxy:reason:reply:", 0, a3, a4);
}

- (void)databaseService:(id)a3 reply:(id)a4
{
  -[SESServer databaseServiceWithProxy:isReconcileRequired:reason:reply:](self, "databaseServiceWithProxy:isReconcileRequired:reason:reply:", 0, 1, a3, a4);
}

- (void)databaseServiceWithProxy:(id)a3 isReconcileRequired:(BOOL)a4 reason:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id *v14;
  id v15;
  id v16;
  _QWORD v17[5];
  NSObject *v18;
  id v19;
  id v20;
  _QWORD block[5];
  id v22;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = objc_claimAutoreleasedReturnValue(-[SESServer messageQueue](self, "messageQueue"));
  if (a4)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100017F88;
    v17[3] = &unk_100302B30;
    v14 = &v20;
    v17[4] = self;
    v20 = v12;
    v18 = v10;
    v19 = v11;
    v15 = v12;
    dispatch_async(v13, v17);

    v13 = v18;
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100017ED8;
    block[3] = &unk_100303078;
    v14 = &v22;
    block[4] = self;
    v22 = v12;
    v16 = v12;
    dispatch_async(v13, block);
  }

}

- (void)secureElementService:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[16];

  v6 = a4;
  v7 = a3;
  v9 = SESDefaultLogObject(v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "", buf, 2u);
  }

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000181E4;
  v12[3] = &unk_100302B58;
  v12[4] = self;
  v13 = v6;
  v11 = v6;
  sub_100051680((uint64_t)SecureElementManager, v7, v12);

}

- (void)endPointAction:(id)a3 clientInfo:(id)a4 reason:(id)a5 reply:(id)a6
{
  -[SESServer endPointAction:proxy:clientInfo:reason:reply:](self, "endPointAction:proxy:clientInfo:reason:reply:", a3, 0, a4, a5, a6);
}

- (void)endPointAction:(id)a3 proxy:(id)a4 clientInfo:(id)a5 reason:(id)a6 reply:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if ((sub_100034090((uint64_t)v14) & 1) != 0 || (v17 = sub_1000340B0((uint64_t)v14), (v17 & 1) != 0))
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1000184DC;
    v23[3] = &unk_100303758;
    v26 = v16;
    v23[4] = self;
    v24 = v12;
    v25 = v14;
    -[SESServer endPointServiceAvailableWithProxy:reason:reply:](self, "endPointServiceAvailableWithProxy:reason:reply:", v13, v15, v23);

  }
  else
  {
    v19 = SESDefaultLogObject(v17, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v21 = SESCreateAndLogError(0, v20, SESErrorDomain, 5, CFSTR("Missing EP entitlement"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, void *))v16 + 2))(v16, 0, 0, 0, 0, v22);

  }
}

- (void)endPointDBAction:(id)a3 clientInfo:(id)a4 reason:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if ((sub_100034090((uint64_t)v11) & 1) != 0 || (v14 = sub_1000340B0((uint64_t)v11), (v14 & 1) != 0))
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100018728;
    v20[3] = &unk_100303780;
    v23 = v13;
    v20[4] = self;
    v21 = v10;
    v22 = v11;
    -[SESServer databaseServiceWithProxy:isReconcileRequired:reason:reply:](self, "databaseServiceWithProxy:isReconcileRequired:reason:reply:", 0, 0, v12, v20);

  }
  else
  {
    v16 = SESDefaultLogObject(v14, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = SESCreateAndLogError(0, v17, SESErrorDomain, 5, CFSTR("Missing EP entitlement"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, void *))v13 + 2))(v13, 0, 0, 0, v19);

  }
}

- (id)_getEndPointAndValidateAccess:(id)a3 identifier:(id)a4 clientInfo:(id)a5 outEndPointEntity:(id *)a6 outEndPoint:(id *)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  id v32;
  uint64_t v33;
  void *v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  id v41;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = objc_claimAutoreleasedReturnValue(-[SESServer messageQueue](self, "messageQueue"));
  dispatch_assert_queue_V2(v15);

  v41 = 0;
  v16 = sub_10003A9E0((uint64_t)v12, &v41);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v18 = v41;
  if (v18)
  {
    v19 = v18;
    v20 = v19;
  }
  else
  {
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_100018A10;
    v37[3] = &unk_1003037A8;
    v21 = v12;
    v38 = v21;
    v39 = v13;
    v22 = v14;
    v40 = v22;
    v23 = Find(v17, v37);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v23);
    if (v25)
    {
      v36 = 0;
      v26 = sub_10003ADE0((uint64_t)v21, v25, &v36);
      v27 = (id)objc_claimAutoreleasedReturnValue(v26);
      v28 = v36;
      v19 = v28;
      if (v28 || !v27)
      {
        v19 = v28;
        v20 = v19;
      }
      else
      {
        v27 = objc_retainAutorelease(v27);
        *a7 = v27;
        v20 = 0;
        *a6 = objc_retainAutorelease(v25);
      }
    }
    else
    {
      v29 = SESDefaultLogObject(0, v24);
      v27 = (id)objc_claimAutoreleasedReturnValue(v29);
      v30 = SESErrorDomain;
      v32 = sub_10003407C(v22, v31);
      v35 = (void *)objc_claimAutoreleasedReturnValue(v32);
      v33 = SESCreateAndLogError(0, v27, v30, 4, CFSTR("EP %@ for client %@ does not exist"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(v33);

      v19 = 0;
    }

  }
  return v20;
}

- (void)preWarm:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  SESClientInfo *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v9 = SESDefaultLogObject(v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "", buf, 2u);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v12 = sub_100033EAC((uint64_t)SESClientInfo, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  if ((sub_100034090((uint64_t)v13) & 1) != 0 || (v14 = sub_1000340B0((uint64_t)v13), (v14 & 1) != 0))
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100018D3C;
    v20[3] = &unk_100303818;
    v20[4] = self;
    v23 = v7;
    v21 = v6;
    v22 = v13;
    +[SESProximityChip cacheProximityChipData:](SESProximityChip, "cacheProximityChipData:", v20);

  }
  else
  {
    v16 = SESDefaultLogObject(v14, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = SESCreateAndLogError(0, v17, SESErrorDomain, 5, CFSTR("Not entitled for prewarm"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    (*((void (**)(id, void *))v7 + 2))(v7, v19);

  }
}

- (void)preWarmWithReply:(id)a3
{
  -[SESServer preWarm:reply:](self, "preWarm:reply:", 0, a3);
}

- (void)listEndPointCAs:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  SESClientInfo *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint8_t buf[16];

  v4 = a3;
  v6 = SESDefaultLogObject(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "", buf, 2u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v9 = sub_100033EAC((uint64_t)SESClientInfo, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  if ((sub_1000340A0((uint64_t)v10) & 1) != 0 || (v11 = sub_1000340B0((uint64_t)v10), (v11 & 1) != 0))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEEndPointXPC) listEndPointCAs:]"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100019280;
    v18[3] = &unk_100303890;
    v20 = v4;
    v19 = v10;
    -[SESServer databaseService:reply:](self, "databaseService:reply:", v13, v18);

    v14 = v20;
  }
  else
  {
    v15 = SESDefaultLogObject(v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v16 = SESCreateAndLogError(0, v14, SESErrorDomain, 5, CFSTR("Missing CA entitlement"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v17);

  }
}

- (id)_createEndPointCA:(id)a3 database:(id)a4 clientName:(id)a5 identifier:(id)a6 subjectIdentifier:(id)a7 forEndPointType:(int64_t)a8 error:(id *)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v38;
  __CFString *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  NSObject *v56;
  void *v57;
  void *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  NSObject *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  id v70;
  void *v71;
  void *v72;
  id v73;
  _QWORD v74[4];
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  uint64_t *v80;
  _BYTE *v81;
  uint64_t *v82;
  int64_t v83;
  id v84;
  id v85;
  id obj;
  uint64_t v87;
  uint64_t *v88;
  uint64_t v89;
  uint64_t (*v90)(uint64_t, uint64_t);
  void (*v91)(uint64_t);
  id v92;
  uint64_t v93;
  uint64_t *v94;
  uint64_t v95;
  uint64_t (*v96)(uint64_t, uint64_t);
  void (*v97)(uint64_t);
  id v98;
  uint8_t v99[4];
  void *v100;
  _BYTE buf[24];
  uint64_t (*v102)(uint64_t, uint64_t);
  void (*v103)(uint64_t);
  id v104;

  v73 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = objc_claimAutoreleasedReturnValue(-[SESServer messageQueue](self, "messageQueue"));
  dispatch_assert_queue_V2(v19);

  v22 = SESDefaultLogObject(v20, v21);
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v17;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v18;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "identifier %@ subjectIdentifier %@", buf, 0x16u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v102 = sub_100019AD0;
  v103 = sub_100019AE0;
  v104 = 0;
  v93 = 0;
  v94 = &v93;
  v95 = 0x3032000000;
  v96 = sub_100019AD0;
  v97 = sub_100019AE0;
  v98 = 0;
  v87 = 0;
  v88 = &v87;
  v89 = 0x3032000000;
  v90 = sub_100019AD0;
  v91 = sub_100019AE0;
  obj = 0;
  v24 = sub_100040494((uint64_t)v15, v17, v16, &obj);
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  objc_storeStrong(&v104, obj);
  v92 = v25;
  v27 = *(void **)(*(_QWORD *)&buf[8] + 40);
  if (!v27)
  {
    if (v88[5])
    {
      if (a9)
      {
        v29 = SESDefaultLogObject(0, v26);
        v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
        v31 = SESCreateAndLogError(0, v30, SESErrorDomain, 3, CFSTR("EndPointCA with identifier %@ for client %@ already exists"));
        *a9 = (id)objc_claimAutoreleasedReturnValue(v31);

      }
      goto LABEL_12;
    }
    v32 = objc_msgSend(v18, "length");
    if ((unint64_t)v32 >= 0x1F)
    {
      if (a9)
      {
        v34 = SESDefaultLogObject(v32, v33);
        v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
        v36 = SESCreateAndLogError(0, v35, SESErrorDomain, 1, CFSTR("SubjectIdentifier can not be more than 30 ASN1 printable characters"));
        *a9 = (id)objc_claimAutoreleasedReturnValue(v36);

      }
      goto LABEL_12;
    }
    v38 = *(_QWORD *)&buf[8];
    v85 = *(id *)(*(_QWORD *)&buf[8] + 40);
    v39 = sub_100040B80(v73, a8, &v85);
    v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
    objc_storeStrong((id *)(v38 + 40), v85);
    v43 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
    if (v43)
    {
      if (!a9)
      {
        v28 = 0;
LABEL_36:

        goto LABEL_13;
      }
      v44 = SESDefaultLogObject(v41, v42);
      v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
      v46 = SESCreateAndLogError(v43, v45, SESErrorDomain, 1, CFSTR("pta_getAppletIdentifierForEndpointType"));
      v28 = 0;
      *a9 = (id)objc_claimAutoreleasedReturnValue(v46);
    }
    else
    {
      v72 = v40;
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[SESServer database](self, "database"));
      v48 = *(_QWORD *)&buf[8];
      v84 = *(id *)(*(_QWORD *)&buf[8] + 40);
      v49 = sub_100055A58((uint64_t)v47, v72, &v84);
      v45 = (void *)objc_claimAutoreleasedReturnValue(v49);
      objc_storeStrong((id *)(v48 + 40), v84);
      v40 = v72;

      if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40) || !v45)
      {
        if (!a9)
        {
          v28 = 0;
          goto LABEL_35;
        }
        v67 = SESDefaultLogObject(v50, v51);
        v66 = (void *)objc_claimAutoreleasedReturnValue(v67);
        v68 = SESCreateAndLogError(0, v66, SESErrorDomain, 0, CFSTR("Getting AirInstance %@"));
        v40 = v72;
        v28 = 0;
        *a9 = (id)objc_claimAutoreleasedReturnValue(v68);
      }
      else
      {
        v74[0] = _NSConcreteStackBlock;
        v74[1] = 3221225472;
        v74[2] = sub_100019AE8;
        v74[3] = &unk_1003038B8;
        v80 = &v87;
        v75 = v17;
        v52 = v45;
        v76 = v52;
        v77 = v16;
        v81 = buf;
        v82 = &v93;
        v70 = v73;
        v78 = v70;
        v69 = v18;
        v79 = v69;
        v83 = a8;
        sub_1000168E4((uint64_t)v15, v74);
        v40 = v72;
        if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40) && v94[5])
        {
          v55 = SESDefaultLogObject(v53, v54);
          v56 = objc_claimAutoreleasedReturnValue(v55);
          if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v99 = 0;
            _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_INFO, "CA creation failed and requires cleanup ...", v99, 2u);
          }

          v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "identifier"));
          v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "hexStringAsData"));
          v59 = sub_1000432D0(v70, v58, v69);
          v71 = (void *)objc_claimAutoreleasedReturnValue(v59);

          if (v71)
          {
            v62 = SESDefaultLogObject(v60, v61);
            v63 = objc_claimAutoreleasedReturnValue(v62);
            if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v99 = 138412290;
              v100 = v71;
              _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_ERROR, "Failed to clean up EPCA : %@", v99, 0xCu);
            }

          }
          v64 = (void *)v94[5];
          v94[5] = 0;

          v65 = (void *)v88[5];
          v88[5] = 0;

        }
        if (a9)
          *a9 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
        v28 = (id)v88[5];

        v66 = v75;
      }

    }
LABEL_35:

    goto LABEL_36;
  }
  if (!a9)
  {
LABEL_12:
    v28 = 0;
    goto LABEL_13;
  }
  v28 = 0;
  *a9 = objc_retainAutorelease(v27);
LABEL_13:
  _Block_object_dispose(&v87, 8);

  _Block_object_dispose(&v93, 8);
  _Block_object_dispose(buf, 8);

  return v28;
}

- (void)createEndPointCA:(id)a3 subjectIdentifier:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  SESClientInfo *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  id v30;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v12 = SESDefaultLogObject(v10, v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v30 = v8;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v15 = sub_100033EAC((uint64_t)SESClientInfo, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  v17 = sub_100034090((uint64_t)v16);
  if ((_DWORD)v17 && (v17 = sub_1000340A0((uint64_t)v16), (v17 & 1) != 0))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEEndPointXPC) createEndPointCA:subjectIdentifier:reply:]"));
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10001A16C;
    v24[3] = &unk_1003037F0;
    v28 = v10;
    v24[4] = self;
    v25 = v16;
    v26 = v8;
    v27 = v9;
    -[SESServer endPointServiceAvailable:reply:](self, "endPointServiceAvailable:reply:", v19, v24);

    v20 = v28;
  }
  else
  {
    v21 = SESDefaultLogObject(v17, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v22 = SESCreateAndLogError(0, v20, SESErrorDomain, 5, CFSTR("Missing EP or CA entitlements"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v23);

  }
}

- (void)deleteEndPointCA:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  SESClientInfo *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;

  v6 = a3;
  v7 = a4;
  v9 = SESDefaultLogObject(v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v12 = sub_100033EAC((uint64_t)SESClientInfo, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  if (sub_100034090((uint64_t)v13) && (sub_1000340A0((uint64_t)v13) & 1) != 0
    || (v14 = sub_1000340B0((uint64_t)v13), (v14 & 1) != 0))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEEndPointXPC) deleteEndPointCA:reply:]"));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10001A4B4;
    v21[3] = &unk_100303930;
    v24 = v7;
    v22 = v6;
    v23 = v13;
    -[SESServer endPointServiceAvailable:reply:](self, "endPointServiceAvailable:reply:", v16, v21);

    v17 = v24;
  }
  else
  {
    v18 = SESDefaultLogObject(v14, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v19 = SESCreateAndLogError(0, v17, SESErrorDomain, 5, CFSTR("Missing EP or CA entitlements"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    (*((void (**)(id, void *))v7 + 2))(v7, v20);

  }
}

- (void)listEndPointsWithProxy:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  SESClientInfo *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v9 = sub_100033EAC((uint64_t)SESClientInfo, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  if ((sub_100034090((uint64_t)v10) & 1) != 0 || (v11 = sub_1000340B0((uint64_t)v10), (v11 & 1) != 0))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEEndPointXPC) listEndPointsWithProxy:reply:]"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10001AA54;
    v18[3] = &unk_100303890;
    v20 = v7;
    v19 = v10;
    -[SESServer databaseServiceWithProxy:isReconcileRequired:reason:reply:](self, "databaseServiceWithProxy:isReconcileRequired:reason:reply:", v6, 1, v13, v18);

  }
  else
  {
    v14 = SESDefaultLogObject(v11, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = SESCreateAndLogError(0, v15, SESErrorDomain, 5, CFSTR("Missing ep entitlement"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v17);

  }
}

- (void)cleanupAppletsWithNoEndpoints:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  SESClientInfo *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[4];
  id v19;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v9 = sub_100033EAC((uint64_t)SESClientInfo, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  if ((sub_100034090((uint64_t)v10) & 1) != 0 || (v11 = sub_1000340B0((uint64_t)v10), (v11 & 1) != 0))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEEndPointXPC) cleanupAppletsWithNoEndpoints:reply:]"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10001AE6C;
    v18[3] = &unk_100303708;
    v19 = v7;
    -[SESServer endPointServiceAvailableWithProxy:reason:reply:](self, "endPointServiceAvailableWithProxy:reason:reply:", v6, v13, v18);

  }
  else
  {
    v14 = SESDefaultLogObject(v11, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = SESCreateAndLogError(0, v15, SESErrorDomain, 5, CFSTR("Missing ep entitlement"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    (*((void (**)(id, void *))v7 + 2))(v7, v17);

  }
}

- (id)_renewEndPointCAIfExpired:(id)a3 secureElement:(id)a4 forEndPointType:(int64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  unsigned int v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  const char *v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  _QWORD v55[2];
  _QWORD v56[2];
  void *v57;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  int v61;

  v8 = a3;
  v9 = a4;
  v10 = objc_claimAutoreleasedReturnValue(-[SESServer messageQueue](self, "messageQueue"));
  dispatch_assert_queue_V2(v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SESServer database](self, "database"));
  v54 = 0;
  v12 = sub_100040910((uint64_t)v11, v8, &v54);
  v13 = v54;

  if (!v13 && !v12)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SESServer database](self, "database"));
    v53 = 0;
    v15 = sub_100040628((uint64_t)v14, v8, &v53);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = v53;

    if (v17)
    {
      v20 = v17;
      v21 = v20;
LABEL_20:

      goto LABEL_21;
    }
    v22 = SESDefaultLogObject(v18, v19);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
      *(_DWORD *)buf = 138412546;
      v59 = v24;
      v60 = 1024;
      v61 = a5;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Renewing expired SEEndPointCA %@ with type %d", buf, 0x12u);

    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[SEABAAManager sharedManager](SEABAAManager, "sharedManager"));
    v51 = v16;
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "secureElementAttestation"));
    v28 = sub_10005066C(v9, v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "casdCertificate"));
    v52 = 0;
    v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "PerformSEABAAWithAttestation:casdCertificate:nonce:OIDs:validityInterval:error:", v26, v30, 0, 0, 0, &v52));
    v20 = v52;

    if (v20)
    {
      v21 = v20;
      v34 = (void *)v31;
LABEL_10:
      v16 = v51;
LABEL_19:

      goto LABEL_20;
    }
    if (a5 == 5 || a5 == 2)
    {
      v34 = (void *)v31;
      v40 = sub_1000117D0(v31);
      v38 = (void *)objc_claimAutoreleasedReturnValue(v40);
      v55[0] = v38;
      v41 = sub_1000117DC(v31);
      v39 = (void *)objc_claimAutoreleasedReturnValue(v41);
      v55[1] = v39;
      v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v55, 2));
      v16 = v51;
      objc_msgSend(v51, "setCertificates:", v42);
    }
    else
    {
      v34 = (void *)v31;
      if (a5 != 1)
      {
        v46 = SESDefaultLogObject(v32, v33);
        v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
        v48 = SESCreateAndLogError(0, v47, SESErrorDomain, 0, CFSTR("Should not be trying to renew type %d"));
        v21 = (id)objc_claimAutoreleasedReturnValue(v48);

        goto LABEL_10;
      }
      v16 = v51;
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "certificates"));
      v36 = objc_msgSend(v35, "count");

      if (v36 == (id)1)
      {
        v37 = sub_1000117DC((uint64_t)v34);
        v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
        v57 = v38;
        v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v57, 1));
        objc_msgSend(v51, "setCertificates:", v39);
LABEL_18:

        v43 = (void *)objc_claimAutoreleasedReturnValue(-[SESServer database](self, "database"));
        v44 = sub_1000406EC(v43, v8, v16);
        v21 = (id)objc_claimAutoreleasedReturnValue(v44);

        goto LABEL_19;
      }
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "certificates"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "objectAtIndexedSubscript:", 0));
      v56[0] = v39;
      v49 = sub_1000117DC((uint64_t)v34);
      v42 = (void *)objc_claimAutoreleasedReturnValue(v49);
      v56[1] = v42;
      v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v56, 2));
      objc_msgSend(v51, "setCertificates:", v50);

    }
    goto LABEL_18;
  }
  v20 = v13;
  v21 = v20;
LABEL_21:

  return v21;
}

- (void)createAlishaEndpointWithProxy:(id)a3 identifier:(id)a4 authorityIdentifier:(id)a5 subjectIdentifier:(id)a6 configuration:(id)a7 readerIdentifier:(id)a8 readerPublicKey:(id)a9 readerInformation:(id)a10 startDate:(id)a11 endDate:(id)a12 keyIdentifier:(id)a13 authorizedKeys:(id)a14 confidentialMailBoxSize:(id)a15 privateMailBoxSize:(id)a16 reply:(id)a17
{
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  void (**v27)(id, _QWORD, id);
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  SESClientInfo *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  const __CFString *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  _QWORD v73[5];
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  void (**v89)(id, _QWORD, id);
  uint8_t buf[4];
  id v91;
  __int16 v92;
  id v93;
  __int16 v94;
  id v95;
  __int16 v96;
  id v97;

  v63 = a3;
  v22 = a4;
  v72 = a5;
  v71 = a6;
  v70 = a7;
  v23 = a8;
  v24 = v22;
  v69 = a9;
  v25 = a10;
  v26 = a11;
  v68 = a12;
  v67 = a13;
  v66 = a14;
  v65 = a15;
  v64 = a16;
  v27 = (void (**)(id, _QWORD, id))a17;
  v29 = SESDefaultLogObject(v27, v28);
  v30 = objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413058;
    v91 = v22;
    v92 = 2112;
    v93 = v72;
    v94 = 2112;
    v95 = v71;
    v96 = 2112;
    v97 = v23;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "identifier %@ __authorityIdentifier %@ subjectIdentifier %@ readerIdentifier %@", buf, 0x2Au);
  }

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v32 = sub_100033EAC((uint64_t)SESClientInfo, v31);
  v33 = (void *)objc_claimAutoreleasedReturnValue(v32);

  if (!sub_100034090((uint64_t)v33) || (sub_1000340A0((uint64_t)v33) & 1) == 0)
  {
    v34 = sub_1000340B0((uint64_t)v33);
    if ((v34 & 1) == 0)
    {
      v45 = SESDefaultLogObject(v34, v35);
      v38 = (void *)objc_claimAutoreleasedReturnValue(v45);
      v46 = SESErrorDomain;
      v47 = CFSTR("Missing EP & CA entitlement");
      v48 = v38;
      v49 = 5;
LABEL_11:
      v52 = SESCreateAndLogError(0, v48, v46, v49, v47);
      v42 = (id)objc_claimAutoreleasedReturnValue(v52);
      v27[2](v27, 0, v42);
      goto LABEL_17;
    }
  }
  v36 = objc_msgSend(v23, "length");
  if (v36 != (id)8)
  {
    v50 = SESDefaultLogObject(v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue(v50);
    v51 = SESErrorDomain;
    objc_msgSend(v23, "length");
    v47 = CFSTR("Invalid readerIdentifier length, should be 8 Bytes but received %lu");
    v48 = v38;
    v46 = v51;
    v49 = 1;
    goto LABEL_11;
  }
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "componentsSeparatedByString:", CFSTR(".")));
  v39 = objc_msgSend(v38, "count");
  v60 = v26;
  if ((unint64_t)v39 > 2)
  {
    v42 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "objectAtIndexedSubscript:", 2));
    v53 = objc_msgSend(v42, "length");
    if (v53 == (id)3)
    {
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "substringWithRange:", 2, 1));
      v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "substringToIndex:", 2));

      v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEEndPointXPC) createAlishaEndpointWithProxy:identifier:authorityIdentifier:subjectIdentifier:configuration:readerIdentifier:readerPublicKey:readerInformation:startDate:endDate:keyIdentifier:authorizedKeys:confidentialMailBoxSize:privateMailBoxSize:reply:]"));
      v73[0] = _NSConcreteStackBlock;
      v73[1] = 3221225472;
      v73[2] = sub_10001BAC8;
      v73[3] = &unk_1003039D0;
      v89 = v27;
      v73[4] = self;
      v74 = v24;
      v75 = v23;
      v76 = v72;
      v77 = v33;
      v78 = v55;
      v42 = v56;
      v79 = v42;
      v80 = v71;
      v81 = v70;
      v82 = v69;
      v83 = v60;
      v84 = v68;
      v85 = v67;
      v86 = v66;
      v87 = v65;
      v88 = v64;
      v44 = v55;
      -[SESServer endPointServiceAvailableWithProxy:reason:reply:](self, "endPointServiceAvailableWithProxy:reason:reply:", v63, v62, v73);

      v57 = v89;
    }
    else
    {
      v58 = SESDefaultLogObject(v53, v54);
      v44 = (id)objc_claimAutoreleasedReturnValue(v58);
      v59 = SESCreateAndLogError(0, v44, SESErrorDomain, 1, CFSTR("Invalid region from reader information %@"));
      v57 = (void *)objc_claimAutoreleasedReturnValue(v59);
      v27[2](v27, 0, v57);
    }

  }
  else
  {
    v41 = SESDefaultLogObject(v39, v40);
    v42 = (id)objc_claimAutoreleasedReturnValue(v41);
    v43 = SESCreateAndLogError(0, v42, SESErrorDomain, 1, CFSTR("Invalid reader information %@"));
    v44 = (id)objc_claimAutoreleasedReturnValue(v43);
    v27[2](v27, 0, v44);
  }

  v26 = v60;
LABEL_17:

}

- (void)createHydraEndpointWithProxy:(id)a3 serverParams:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  SESClientInfo *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _UNKNOWN **v22;
  void *v23;
  void *v24;
  unsigned int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  _UNKNOWN **v42;
  void *v43;
  id v44;
  id v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  id v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  const __CFString *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  SESServer *v69;
  unsigned int v70;
  unsigned int v71;
  unsigned int v72;
  unsigned int v73;
  unsigned int v74;
  unsigned int v75;
  id v76;
  void *v77;
  void *v78;
  _QWORD v79[5];
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  __CFString *v87;
  __CFString *v88;
  id v89;
  id v90;
  unsigned int v91;
  unsigned int v92;
  unsigned int v93;
  unsigned int v94;
  unsigned int v95;
  unsigned int v96;
  uint8_t buf[4];
  id v98;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v12 = sub_100033EAC((uint64_t)SESClientInfo, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  if (sub_100034090((uint64_t)v13) && (v14 = sub_1000340A0((uint64_t)v13), (v14 & 1) != 0)
    || (v14 = sub_1000340B0((uint64_t)v13), (v14 & 1) != 0))
  {
    v77 = v13;
    v16 = SESDefaultLogObject(v14, v15);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v98 = v9;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("readerIdentifier")));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "hexStringAsData"));

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("readerCAPublicKey")));
    v21 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "hexStringAsData"));

    v22 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("readerCAMaxDepth")));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("mailboxInfo")));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("confMailboxSize")));
    v25 = objc_msgSend(v24, "unsignedIntValue");

    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("confMailboxOffset")));
    v75 = objc_msgSend(v26, "unsignedIntValue");

    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("confMailboxLength")));
    v74 = objc_msgSend(v27, "unsignedIntValue");

    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("privMailboxSize")));
    v73 = objc_msgSend(v28, "unsignedIntValue");

    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("privMailboxOffset")));
    v72 = objc_msgSend(v29, "unsignedIntValue");

    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("privMailboxLength")));
    v71 = objc_msgSend(v30, "unsignedIntValue");

    if (v19 && v21)
    {
      if (!v22)
        v22 = &off_100322E00;
      v33 = objc_msgSend(v19, "length");
      if (v33 == (id)8)
      {
        v70 = v25;
        if (objc_msgSend(v21, "length") == (id)64)
        {
          v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithCapacity:](NSMutableData, "dataWithCapacity:", 65));
          objc_msgSend(v35, "appendU8:", 4);
          objc_msgSend(v35, "appendData:", v21);

          v21 = v35;
          v13 = v77;
        }
        else
        {
          v53 = objc_msgSend(v21, "length");
          v13 = v77;
          if (v53 != (id)65)
          {
            v62 = SESDefaultLogObject(v53, v54);
            v41 = (void *)objc_claimAutoreleasedReturnValue(v62);
            v63 = SESErrorDomain;
            objc_msgSend(v21, "length");
            v64 = CFSTR("Invalid readerCAPublicKey length, should be 64 or 65 Bytes but received %lu");
            goto LABEL_25;
          }
        }
        if (!objc_msgSend(v22, "unsignedIntValue")
          || (v55 = objc_msgSend(v22, "unsignedIntValue"), (_DWORD)v55 == 1))
        {
          v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSData randomData:](NSData, "randomData:", 4));
          v69 = self;
          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "asHexString"));

          v78 = v8;
          v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "asHexString"));
          v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("HY-%@-%@"), v58, v41));

          v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "asHexString"));
          v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("HYCA-%@-%@"), v59, v41));

          v60 = (void *)objc_claimAutoreleasedReturnValue(+[SEEndPointConfiguration hydraDefaults](SEEndPointConfiguration, "hydraDefaults"));
          v79[0] = _NSConcreteStackBlock;
          v79[1] = 3221225472;
          v79[2] = sub_10001D3B8;
          v79[3] = &unk_100303A48;
          v79[4] = v69;
          v80 = v78;
          v90 = v10;
          v81 = v67;
          v82 = v13;
          v83 = v68;
          v84 = v60;
          v85 = v19;
          v21 = v21;
          v86 = v21;
          v87 = CFSTR("20000101000000Z");
          v88 = CFSTR("99991231235959Z");
          v91 = v70;
          v92 = v73;
          v22 = v22;
          v89 = v22;
          v93 = v71;
          v94 = v72;
          v95 = v74;
          v96 = v75;
          v76 = v60;
          v61 = v68;
          v47 = v67;
          +[SESProximityChip cacheProximityChipData:](SESProximityChip, "cacheProximityChipData:", v79);

          v8 = v78;
          goto LABEL_17;
        }
        v65 = SESDefaultLogObject(v55, v56);
        v41 = (void *)objc_claimAutoreleasedReturnValue(v65);
        v63 = SESErrorDomain;
        objc_msgSend(v22, "unsignedIntValue");
        v64 = CFSTR("Invalid readerCAMaxDepth, should be 0 or 1 but received value %u");
LABEL_25:
        v66 = SESCreateAndLogError(0, v41, v63, 1, v64);
        v47 = (id)objc_claimAutoreleasedReturnValue(v66);
        (*((void (**)(id, _QWORD, id))v10 + 2))(v10, 0, v47);
        goto LABEL_17;
      }
      v50 = SESDefaultLogObject(v33, v34);
      v41 = (void *)objc_claimAutoreleasedReturnValue(v50);
      v51 = SESErrorDomain;
      objc_msgSend(v19, "length");
      v52 = SESCreateAndLogError(0, v41, v51, 1, CFSTR("Invalid readerIdentifier length, should be 8 Bytes but received %lu"));
      v47 = (id)objc_claimAutoreleasedReturnValue(v52);
      (*((void (**)(id, _QWORD, id))v10 + 2))(v10, 0, v47);
    }
    else
    {
      v40 = SESDefaultLogObject(v31, v32);
      v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
      v42 = v22;
      v43 = v19;
      v44 = v21;
      v45 = v8;
      v46 = SESErrorDomain;
      v47 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allKeys"));
      v48 = SESCreateAndLogError(0, v41, v46, 1, CFSTR("Missing mandatory server parameter: Got %@ Need %@"));
      v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
      (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v49);

      v8 = v45;
      v21 = v44;
      v19 = v43;
      v22 = v42;
    }
    v13 = v77;
LABEL_17:

    goto LABEL_18;
  }
  v36 = SESDefaultLogObject(v14, v15);
  v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
  v38 = SESCreateAndLogError(0, v37, SESErrorDomain, 5, CFSTR("Missing EP & CA entitlement"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
  (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v39);

LABEL_18:
}

- (void)createLocalEndpointWithProxy:(id)a3 readerIdentifier:(id)a4 readerPublicKey:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, _QWORD, void *);
  void *v14;
  SESClientInfo *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  const __CFString *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  _QWORD v37[5];
  id v38;
  __CFString *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  __CFString *v45;
  __CFString *v46;
  void (**v47)(id, _QWORD, void *);

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _QWORD, void *))a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v15 = sub_100033EAC((uint64_t)SESClientInfo, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  if (!sub_100034090((uint64_t)v16) || (sub_1000340A0((uint64_t)v16) & 1) == 0)
  {
    v17 = sub_1000340B0((uint64_t)v16);
    if ((v17 & 1) == 0)
    {
      v27 = SESDefaultLogObject(v17, v18);
      v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      v29 = SESErrorDomain;
      v30 = CFSTR("Missing EP & CA entitlement");
      v31 = v28;
      v32 = 5;
LABEL_8:
      v35 = SESCreateAndLogError(0, v31, v29, v32, v30);
      v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
      v13[2](v13, 0, v36);

      goto LABEL_9;
    }
  }
  v19 = objc_msgSend(v11, "length");
  if (v19 != (id)8)
  {
    v33 = SESDefaultLogObject(v19, v20);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v33);
    v34 = SESErrorDomain;
    objc_msgSend(v11, "length");
    v30 = CFSTR("Invalid readerIdentifier length for unified access endpoint, should be 8 Bytes but received %lu");
    v31 = v28;
    v29 = v34;
    v32 = 1;
    goto LABEL_8;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSData randomData:](NSData, "randomData:", 4));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "asHexString"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("HOME-%@"), v22));

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[SEEndPointConfiguration homeDefaults](SEEndPointConfiguration, "homeDefaults"));
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_10001E40C;
  v37[3] = &unk_100303AC0;
  v37[4] = self;
  v38 = v10;
  v47 = v13;
  v39 = CFSTR("HOME");
  v40 = v16;
  v41 = v23;
  v42 = v24;
  v43 = v11;
  v44 = v12;
  v45 = CFSTR("20000101000000Z");
  v46 = CFSTR("99991231235959Z");
  v25 = v24;
  v26 = v23;
  +[SESProximityChip cacheProximityChipData:](SESProximityChip, "cacheProximityChipData:", v37);

LABEL_9:
}

- (void)createLyonEndpointWithProxy:(id)a3 readerGroupIdentifier:(id)a4 readerPublicKey:(id)a5 homeUUID:(id)a6 privateMailboxSize:(id)a7 reply:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void (**v19)(id, _QWORD, void *);
  void *v20;
  SESClientInfo *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  const __CFString *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  _QWORD v47[5];
  id v48;
  __CFString *v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  __CFString *v55;
  __CFString *v56;
  id v57;
  id v58;
  void (**v59)(id, _QWORD, void *);

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = (void (**)(id, _QWORD, void *))a8;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v21 = sub_100033EAC((uint64_t)SESClientInfo, v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);

  if (!sub_100034090((uint64_t)v22) || (sub_1000340A0((uint64_t)v22) & 1) == 0)
  {
    v23 = sub_1000340B0((uint64_t)v22);
    if ((v23 & 1) == 0)
    {
      v35 = SESDefaultLogObject(v23, v24);
      v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
      v37 = SESErrorDomain;
      v38 = CFSTR("Missing EP & CA entitlement");
      v39 = v36;
      v40 = 5;
LABEL_8:
      v43 = SESCreateAndLogError(0, v39, v37, v40, v38);
      v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
      v19[2](v19, 0, v44);

      goto LABEL_9;
    }
  }
  v25 = objc_msgSend(v15, "length");
  if (v25 != (id)16)
  {
    v41 = SESDefaultLogObject(v25, v26);
    v36 = (void *)objc_claimAutoreleasedReturnValue(v41);
    v42 = SESErrorDomain;
    objc_msgSend(v15, "length");
    v38 = CFSTR("Invalid RGI length for Lyon access endpoint, should be 16 Bytes but received %lu");
    v39 = v36;
    v37 = v42;
    v40 = 1;
    goto LABEL_8;
  }
  v45 = v14;
  v46 = v17;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSData randomData:](NSData, "randomData:", 4));
  v28 = v18;
  v29 = v16;
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "asHexString"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("LYON-%@"), v30));

  v16 = v29;
  v18 = v28;

  v32 = (void *)objc_claimAutoreleasedReturnValue(+[SEEndPointConfiguration lyonHomeDefaults](SEEndPointConfiguration, "lyonHomeDefaults"));
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_10001F198;
  v47[3] = &unk_100303B58;
  v47[4] = self;
  v48 = v45;
  v59 = v19;
  v49 = CFSTR("LYON");
  v50 = v22;
  v51 = v31;
  v52 = v32;
  v53 = v15;
  v54 = v16;
  v55 = CFSTR("20000101000000Z");
  v56 = CFSTR("99991231235959Z");
  v57 = v28;
  v58 = v46;
  v33 = v32;
  v34 = v31;
  v14 = v45;
  v17 = v46;
  +[SESProximityChip cacheProximityChipData:](SESProximityChip, "cacheProximityChipData:", v47);

LABEL_9:
}

- (void)createLyonHydraEndpointWithProxy:(id)a3 serverParams:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  void *v11;
  SESClientInfo *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  const __CFString *v44;
  id v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  SESServer *v58;
  void *v59;
  unsigned int v60;
  unsigned int v61;
  id v62;
  _QWORD v63[5];
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  __CFString *v71;
  __CFString *v72;
  id v73;
  void (**v74)(id, _QWORD, void *);
  unsigned int v75;
  unsigned int v76;
  unsigned int v77;
  uint8_t buf[4];
  id v79;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v12 = sub_100033EAC((uint64_t)SESClientInfo, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  if (sub_100034090((uint64_t)v13) && (v14 = sub_1000340A0((uint64_t)v13), (v14 & 1) != 0)
    || (v14 = sub_1000340B0((uint64_t)v13), (v14 & 1) != 0))
  {
    v16 = SESDefaultLogObject(v14, v15);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v79 = v9;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("readerGroupIdentifier")));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "hexStringAsData"));

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("readerGroupPublicKey")));
    v21 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "hexStringAsData"));

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("readerCAMaxDepth")));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("privMailboxSize")));
    v61 = objc_msgSend(v23, "unsignedIntValue");

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("privMailboxOffset")));
    v60 = objc_msgSend(v24, "unsignedIntValue");

    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("privMailboxLength")));
    v26 = objc_msgSend(v25, "unsignedIntValue");

    if (v19 && v21 && v22)
    {
      v29 = objc_msgSend(v19, "length");
      if (v29 != (id)16)
      {
        v42 = SESDefaultLogObject(v29, v30);
        v37 = (void *)objc_claimAutoreleasedReturnValue(v42);
        v43 = SESErrorDomain;
        objc_msgSend(v19, "length");
        v44 = CFSTR("Invalid readerIdentifier length, should be 16 Bytes but received %lu");
LABEL_21:
        v54 = SESCreateAndLogError(0, v37, v43, 1, v44);
        v39 = (void *)objc_claimAutoreleasedReturnValue(v54);
        v10[2](v10, 0, v39);
        goto LABEL_22;
      }
      if (objc_msgSend(v21, "length") == (id)64)
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithCapacity:](NSMutableData, "dataWithCapacity:", 65));
        objc_msgSend(v31, "appendU8:", 4);
        objc_msgSend(v31, "appendData:", v21);

        v21 = v31;
      }
      else
      {
        v45 = objc_msgSend(v21, "length");
        if (v45 != (id)65)
        {
          v53 = SESDefaultLogObject(v45, v46);
          v37 = (void *)objc_claimAutoreleasedReturnValue(v53);
          v43 = SESErrorDomain;
          objc_msgSend(v21, "length");
          v44 = CFSTR("Invalid readerCAPublicKey length, should be 64 or 65 Bytes but received %lu");
          goto LABEL_21;
        }
      }
      v47 = objc_msgSend(v22, "unsignedIntValue");
      if (v47 >= 2)
      {
        v49 = SESDefaultLogObject(v47, v48);
        v37 = (void *)objc_claimAutoreleasedReturnValue(v49);
        v43 = SESErrorDomain;
        objc_msgSend(v22, "unsignedIntValue");
        v44 = CFSTR("Invalid readerCAMaxDepth, should be 0 or 1 but received value %u");
        goto LABEL_21;
      }
      v58 = self;
      v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSData randomData:](NSData, "randomData:", 4));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "asHexString"));

      v59 = v8;
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "subdataWithRange:", 0, 8));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "asHexString"));

      v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("LY-%@-%@"), v39, v37));
      v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("LYCA-%@-%@"), v39, v37));
      v55 = (void *)objc_claimAutoreleasedReturnValue(+[SEEndPointConfiguration lyonHydraDefaults](SEEndPointConfiguration, "lyonHydraDefaults"));
      v63[0] = _NSConcreteStackBlock;
      v63[1] = 3221225472;
      v63[2] = sub_10002064C;
      v63[3] = &unk_100303BF0;
      v63[4] = v58;
      v64 = v59;
      v74 = v10;
      v65 = v56;
      v66 = v13;
      v67 = v57;
      v68 = v55;
      v69 = v19;
      v21 = v21;
      v70 = v21;
      v71 = CFSTR("20000101000000Z");
      v72 = CFSTR("99991231235959Z");
      v75 = v61;
      v73 = v22;
      v76 = v26;
      v77 = v60;
      v62 = v55;
      v52 = v57;
      v41 = v56;
      +[SESProximityChip cacheProximityChipData:](SESProximityChip, "cacheProximityChipData:", v63);

      v8 = v59;
    }
    else
    {
      v36 = SESDefaultLogObject(v27, v28);
      v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
      v38 = SESErrorDomain;
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allKeys"));
      v40 = SESCreateAndLogError(0, v37, v38, 1, CFSTR("Missing mandatory server parameter: Got %@ Need %@"));
      v41 = (id)objc_claimAutoreleasedReturnValue(v40);
      v10[2](v10, 0, v41);
    }

LABEL_22:
    goto LABEL_23;
  }
  v32 = SESDefaultLogObject(v14, v15);
  v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
  v34 = SESCreateAndLogError(0, v33, SESErrorDomain, 5, CFSTR("Missing EP & CA entitlement"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
  v10[2](v10, 0, v35);

LABEL_23:
}

- (unint64_t)_existsDuplicateInDatabase:(id)a3 airInstanceEntity:(id)a4 withIdentifier:(id)a5 orReaderIdentifier:(id)a6 outError:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  unint64_t v29;
  uint8_t v31[16];
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  id v36;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = objc_claimAutoreleasedReturnValue(-[SESServer messageQueue](self, "messageQueue"));
  dispatch_assert_queue_V2(v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "endPoints"));
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_1000215F4;
  v32[3] = &unk_100303C18;
  v17 = v11;
  v33 = v17;
  v18 = v12;
  v34 = v18;
  v19 = v13;
  v35 = v19;
  v20 = v14;
  v36 = v20;
  v21 = Find(v16, v32);
  v22 = objc_claimAutoreleasedReturnValue(v21);
  v23 = (void *)v22;
  if (!v22 || !SESInternalVariant(v22))
    goto LABEL_8;
  v24 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.seserviced"));
  v25 = objc_msgSend(v24, "BOOLForKey:", CFSTR("debug.allow.duplicate.endpoints"));
  if (!(_DWORD)v25)
  {

LABEL_8:
    v29 = v23 != 0;
    goto LABEL_9;
  }
  v27 = SESDefaultLogObject(v25, v26);
  v28 = objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v31 = 0;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Allowing duplicate endPoint because of internal debug pref", v31, 2u);
  }

  v29 = 0;
LABEL_9:

  return v29;
}

- (id)_ensureCAExistsAndValid:(id)a3 clientName:(id)a4 secureElement:(id)a5 database:(id)a6 forEndPointType:(int64_t)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  id v29;
  id v30;
  id v32;
  id v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  void *v37;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = objc_claimAutoreleasedReturnValue(-[SESServer messageQueue](self, "messageQueue"));
  dispatch_assert_queue_V2(v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[SESServer database](self, "database"));
  v33 = 0;
  v20 = sub_100040494((uint64_t)v19, v14, v15, &v33);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v22 = v33;

  if (!v22)
  {
    if (v21)
    {
      v26 = SESDefaultLogObject(v23, v24);
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "identifier"));
        *(_DWORD *)buf = 138412546;
        v35 = v15;
        v36 = 2112;
        v37 = v28;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Client %@ already has a CA %@, using it", buf, 0x16u);

      }
      if ((unint64_t)(a7 - 3) <= 1)
      {
        v29 = v21;
        v21 = v29;
        v22 = 0;
LABEL_15:
        v25 = v29;
        goto LABEL_16;
      }
      v22 = (id)objc_claimAutoreleasedReturnValue(-[SESServer _renewEndPointCAIfExpired:secureElement:forEndPointType:](self, "_renewEndPointCAIfExpired:secureElement:forEndPointType:", v21, v16, a7));
      if (v22)
      {
        if (a8)
          goto LABEL_3;
LABEL_13:
        v25 = 0;
        goto LABEL_16;
      }
    }
    else
    {
      v32 = 0;
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[SESServer _createEndPointCA:database:clientName:identifier:subjectIdentifier:forEndPointType:error:](self, "_createEndPointCA:database:clientName:identifier:subjectIdentifier:forEndPointType:error:", v16, v17, v15, v14, v14, a7, &v32));
      v30 = v32;
      v22 = v30;
      if (a8)
        *a8 = objc_retainAutorelease(v30);
    }
    v29 = v21;
    v21 = v29;
    goto LABEL_15;
  }
  if (!a8)
    goto LABEL_13;
LABEL_3:
  v22 = objc_retainAutorelease(v22);
  v25 = 0;
  *a8 = v22;
LABEL_16:

  return v25;
}

- (void)configureEndpointWithProxy:(id)a3 identifier:(id)a4 privateData:(id)a5 confidentialData:(id)a6 contactlessVolatileVisibility:(id)a7 contactlessPersistentVisibility:(id)a8 wiredVolatileVisibility:(id)a9 wiredPersistentVisibility:(id)a10 keySlot:(id)a11 nfcExpressOnlyInLPM:(id)a12 reply:(id)a13
{
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  SESClientInfo *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v45;
  _QWORD v46[4];
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  uint8_t buf[4];
  id v57;

  v45 = a4;
  v43 = a5;
  v42 = a6;
  v40 = a7;
  v39 = a8;
  v36 = a9;
  v18 = a10;
  v32 = a11;
  v34 = a12;
  v19 = a13;
  v38 = a3;
  v21 = SESDefaultLogObject(v38, v20);
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v57 = v45;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v23 = sub_100033EAC((uint64_t)SESClientInfo, v31);
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEEndPointXPC) configureEndpointWithProxy:identifier:privateData:confidentialData:contactlessVolatileVisibility:contactlessPersistentVisibility:wiredVolatileVisibility:wiredPersistentVisibility:keySlot:nfcExpressOnlyInLPM:reply:]"));
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_100021C38;
  v46[3] = &unk_100303C40;
  v47 = v43;
  v48 = v42;
  v49 = v39;
  v50 = v40;
  v51 = v18;
  v52 = v36;
  v53 = v32;
  v54 = v34;
  v55 = v19;
  v35 = v34;
  v33 = v32;
  v37 = v36;
  v26 = v18;
  v41 = v40;
  v27 = v39;
  v28 = v42;
  v29 = v43;
  v30 = v19;
  -[SESServer endPointAction:proxy:clientInfo:reason:reply:](self, "endPointAction:proxy:clientInfo:reason:reply:", v45, v38, v24, v25, v46);

}

- (id)getEncryptedCarOEMProprietaryData:(id)a3 withEndpointEntity:(id)a4 withSecureElement:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSMutableData *v21;
  void *v22;
  objc_class *v23;
  id v24;
  uint64_t v25;
  unsigned int v26;
  int v27;
  int v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  objc_class *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  unsigned int v39;
  void *v40;
  uint64_t v41;
  NSObject *v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  unsigned int v52;
  id v53;
  uint64_t v54;
  int v55;
  uint64_t v56;
  NSObject *v57;
  uint64_t v58;
  NSObject *v59;
  uint64_t v60;
  void *v61;
  unsigned __int16 v62;
  uint64_t v63;
  uint64_t v64;
  int v65;
  void *v66;
  void *v67;
  void *v68;
  NSMutableData *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  NSObject *v74;
  id v75;
  uint64_t v76;
  uint64_t v77;
  NSObject *v78;
  uint64_t v79;
  uint64_t v80;
  NSObject *v81;
  void *v82;
  uint64_t v83;
  uint64_t v85;
  id v86;
  unsigned int v87;
  uint64_t v88;
  objc_class *v89;
  void *v90;
  void *v91;
  id v92;
  unsigned int v93;
  void *v94;
  void *v95;
  id v96;
  id v97;
  NSMutableData v98;
  NSMutableData v99;
  uint8_t buf[4];
  _BYTE v101[18];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "carOEMProprietaryData"));

  if (!v10)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "privacyEncryptionPK"));
    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mailboxMapping"));

      if (v14)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "instance"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "identifier"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "hexStringAsData"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "publicKeyIdentifier"));
        v99.super.super.isa = 0;
        v21 = sub_1000435AC(v9, v19, v20, 0, 1, &v99);
        v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
        v23 = v99.super.super.isa;

        if (v23 || (v24 = objc_msgSend(v22, "length"), v24 != (id)1))
        {
          v46 = SESDefaultLogObject(v24, v25);
          v30 = objc_claimAutoreleasedReturnValue(v46);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "asHexString"));
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)v101 = v47;
            *(_WORD *)&v101[8] = 2112;
            *(_QWORD *)&v101[10] = v23;
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Failed to retrieve private mailbox first byte %@ error %@", buf, 0x16u);

          }
          goto LABEL_58;
        }
        v26 = objc_msgSend(v22, "u8:", 0);
        if (v26 == 128)
          v27 = 3;
        else
          v27 = 0;
        if ((v26 & 0x80u) == 0)
          v28 = 1;
        else
          v28 = v27;
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mailboxMapping"));
        v30 = objc_claimAutoreleasedReturnValue(+[SESTLV TLVWithTag:fromData:](SESTLV, "TLVWithTag:fromData:", 32589, v29));

        if (v28 != 3)
        {
          if (v28 != 1)
          {
            v58 = SESDefaultLogObject(v31, v32);
            v59 = objc_claimAutoreleasedReturnValue(v58);
            if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)v101 = v26;
              _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_ERROR, "Unsupported private mailbox version %hhu", buf, 8u);
            }

            goto LABEL_57;
          }
          v33 = (objc_class *)objc_claimAutoreleasedReturnValue(-[NSObject childWithTag:](v30, "childWithTag:", 194));
          v23 = v33;
          if (!v33)
          {
LABEL_58:
            v11 = 0;
LABEL_59:

            goto LABEL_60;
          }
          LODWORD(v34) = -[objc_class valueAsUnsignedShort](v33, "valueAsUnsignedShort");
          v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject childWithTag:](v30, "childWithTag:", 195));
          v36 = v35;
          v93 = v34;
          if (v35)
          {
            v37 = objc_msgSend(v35, "valueAsUnsignedShort");
            v39 = v37;
            if (v34 > v37)
            {
              v40 = v36;
              v41 = SESDefaultLogObject(v37, v38);
              v42 = objc_claimAutoreleasedReturnValue(v41);
              if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)v101 = v93;
                *(_WORD *)&v101[4] = 1024;
                *(_DWORD *)&v101[6] = v39;
                v43 = "Invalid private mailbox offsets car OEM data %d key attestation %d";
LABEL_54:
                _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, v43, buf, 0xEu);
                goto LABEL_55;
              }
              goto LABEL_55;
            }
          }
          else
          {
            v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "privateMailBoxSize"));
            v39 = objc_msgSend(v34, "unsignedShortValue");

            LOWORD(v34) = v93;
            if (v93 >= v39)
            {
              v40 = 0;
              v83 = SESDefaultLogObject(v63, v64);
              v42 = objc_claimAutoreleasedReturnValue(v83);
              if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)v101 = v93;
                *(_WORD *)&v101[4] = 1024;
                *(_DWORD *)&v101[6] = v39;
                v43 = "Invalid private mailbox car OEM data offset %d mailbox size %d";
                goto LABEL_54;
              }
LABEL_55:

              goto LABEL_56;
            }
          }
          v62 = v39 - (_WORD)v34;
LABEL_43:

          v65 = v62;
          if (!v62)
          {
LABEL_57:
            v23 = 0;
            goto LABEL_58;
          }
          v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "instance"));
          v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "identifier"));
          v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "hexStringAsData"));
          v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "publicKeyIdentifier"));
          v98.super.super.isa = 0;
          v69 = sub_1000435AC(v9, v67, v68, v93, v65, &v98);
          v95 = (void *)objc_claimAutoreleasedReturnValue(v69);
          v87 = v65;
          v23 = v98.super.super.isa;

          if (v23)
          {
            v72 = v95;
            v73 = SESDefaultLogObject(v70, v71);
            v74 = objc_claimAutoreleasedReturnValue(v73);
            if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)v101 = v23;
              _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_ERROR, "Failed to retrieve car OEM proprietary data %@", buf, 0xCu);
            }
          }
          else
          {
            v72 = v95;
            v75 = objc_msgSend(v95, "length");
            if (v75 == (id)v87)
            {
              v96 = 0;
              v97 = 0;
              v77 = encryptPrivacyData(v95, v13, &v97, &v96);
              v23 = (objc_class *)objc_claimAutoreleasedReturnValue(v77);
              v92 = v97;
              v78 = v96;
              v74 = v78;
              if (v23)
              {
                v80 = SESDefaultLogObject(v78, v79);
                v81 = objc_claimAutoreleasedReturnValue(v80);
                if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  *(_QWORD *)v101 = v23;
                  _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_ERROR, "Failed to encrypt private mailbox data %@", buf, 0xCu);
                }
                v82 = v81;
                v11 = 0;
              }
              else
              {
                v88 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "sha256"));
                v11 = (void *)objc_claimAutoreleasedReturnValue(+[SEEndPointPrivacyEncryptResponse responseWithCipherText:ephemeralPublicKeyData:receiverPublicKeyHash:](SEEndPointPrivacyEncryptResponse, "responseWithCipherText:ephemeralPublicKeyData:receiverPublicKeyHash:", v74, v92, v88));
                v82 = (void *)v88;
              }

              goto LABEL_66;
            }
            v85 = SESDefaultLogObject(v75, v76);
            v74 = objc_claimAutoreleasedReturnValue(v85);
            if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
            {
              v86 = objc_msgSend(v95, "length");
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)v101 = v87;
              *(_WORD *)&v101[4] = 2048;
              *(_QWORD *)&v101[6] = v86;
              _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_ERROR, "Incorrect proprietary data length expected %hu read %lu", buf, 0x12u);
            }
            v23 = 0;
          }
          v11 = 0;
LABEL_66:

          goto LABEL_59;
        }
        v23 = (objc_class *)objc_claimAutoreleasedReturnValue(-[NSObject childWithTag:](v30, "childWithTag:", 96));
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class childWithTag:](v23, "childWithTag:", 193));
        v49 = objc_claimAutoreleasedReturnValue(-[objc_class childWithTag:](v23, "childWithTag:", 194));
        v51 = (void *)v49;
        if (v36 && v49)
        {
          v89 = v23;
          v52 = objc_msgSend(v36, "valueAsUnsignedShort");
          v53 = objc_msgSend(v51, "valueAsUnsignedShort");
          v55 = (int)v53;
          if (v52 <= v53)
          {
            v93 = v52;
            v62 = (_WORD)v53 - v52;

            v23 = v89;
            goto LABEL_43;
          }
          v94 = v36;
          v56 = SESDefaultLogObject(v53, v54);
          v57 = objc_claimAutoreleasedReturnValue(v56);
          if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)v101 = v52;
            *(_WORD *)&v101[4] = 1024;
            *(_DWORD *)&v101[6] = v55;
            _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, "Invalid private mailbox offsets car OEM data %d key attestation %d", buf, 0xEu);
          }
          v23 = v89;
        }
        else
        {
          v94 = v36;
          v60 = SESDefaultLogObject(v49, v50);
          v57 = objc_claimAutoreleasedReturnValue(v60);
          if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
          {
            v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mailboxMapping"));
            v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "asHexString"));
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v101 = v61;
            _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, "Failed to retrieve private mailbox offsets %@", buf, 0xCu);

          }
        }

LABEL_56:
        goto LABEL_57;
      }
      v48 = SESDefaultLogObject(v15, v16);
      v23 = (objc_class *)objc_claimAutoreleasedReturnValue(v48);
      if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v45 = "Missing mailbox mapping";
        goto LABEL_26;
      }
    }
    else
    {
      v44 = SESDefaultLogObject(0, v12);
      v23 = (objc_class *)objc_claimAutoreleasedReturnValue(v44);
      if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v45 = "Missing server privacy public key";
LABEL_26:
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v23, OS_LOG_TYPE_ERROR, v45, buf, 2u);
      }
    }
    v11 = 0;
LABEL_60:

    goto LABEL_61;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "carOEMProprietaryData"));
LABEL_61:

  return v11;
}

- (void)updateLyonCredentialDocumentStatusWithProxy:(id)a3 endpointIdentifier:(id)a4 accessDocumentPresent:(BOOL)a5 accessDocumentSignedTimestamp:(id)a6 revocationDocumentPresent:(BOOL)a7 revocationDocumentSignedTimestamp:(id)a8 reply:(id)a9
{
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  BOOL v25;
  BOOL v26;
  uint8_t buf[4];
  id v28;

  v13 = a4;
  v14 = a9;
  v15 = a3;
  v17 = SESDefaultLogObject(v15, v16);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v13;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEEndPointXPC) updateLyonCredentialDocumentStatusWithProxy:endpointIdentifier:accessDocumentPresent:accessDocumentSignedTimestamp:revocationDocumentPresent:revocationDocumentSignedTimestamp:reply:]"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10002280C;
  v22[3] = &unk_100303C68;
  v25 = a5;
  v26 = a7;
  v23 = v13;
  v24 = v14;
  v20 = v13;
  v21 = v14;
  -[SESServer endPointServiceAvailableWithProxy:reason:reply:](self, "endPointServiceAvailableWithProxy:reason:reply:", v15, v19, v22);

}

- (void)revokeEndPointWithIdentifier:(id)a3 nonce:(id)a4 metaData:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  SESClientInfo *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  id v29;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v15 = SESDefaultLogObject(v13, v14);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v29 = v10;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v18 = sub_100033EAC((uint64_t)SESClientInfo, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEEndPointXPC) revokeEndPointWithIdentifier:nonce:metaData:reply:]"));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100022C28;
  v24[3] = &unk_100303C90;
  v24[4] = self;
  v25 = v11;
  v26 = v12;
  v27 = v13;
  v21 = v12;
  v22 = v11;
  v23 = v13;
  -[SESServer endPointAction:clientInfo:reason:reply:](self, "endPointAction:clientInfo:reason:reply:", v10, v19, v20, v24);

}

- (void)signatureWithEndPointIdentifier:(id)a3 metaDataHash:(id)a4 authorization:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  SESClientInfo *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  uint8_t buf[4];
  id v31;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v15 = SESDefaultLogObject(v13, v14);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v31 = v10;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v18 = sub_100033EAC((uint64_t)SESClientInfo, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEEndPointXPC) signatureWithEndPointIdentifier:metaDataHash:authorization:reply:]"));
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100023224;
  v25[3] = &unk_100303C90;
  v26 = v11;
  v27 = v12;
  v28 = v10;
  v29 = v13;
  v21 = v10;
  v22 = v12;
  v23 = v11;
  v24 = v13;
  -[SESServer endPointAction:clientInfo:reason:reply:](self, "endPointAction:clientInfo:reason:reply:", v21, v19, v20, v25);

}

- (void)signatureISO18013WithEndPointIdentifier:(id)a3 toBeSigned:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  SESClientInfo *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v12 = SESDefaultLogObject(v10, v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v8;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v15 = sub_100033EAC((uint64_t)SESClientInfo, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEEndPointXPC) signatureISO18013WithEndPointIdentifier:toBeSigned:reply:]"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100023588;
  v21[3] = &unk_100303CB8;
  v23 = v8;
  v24 = v10;
  v22 = v9;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  -[SESServer endPointAction:clientInfo:reason:reply:](self, "endPointAction:clientInfo:reason:reply:", v18, v16, v17, v21);

}

- (void)setPrivateDataWithProxy:(id)a3 identifier:(id)a4 privateData:(id)a5 privateDataOffset:(unsigned __int16)a6 reply:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  SESClientInfo *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  unsigned __int16 v28;
  uint8_t buf[4];
  id v30;

  v12 = a4;
  v13 = a5;
  v14 = a7;
  v15 = a3;
  v17 = SESDefaultLogObject(v15, v16);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v30 = v12;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v20 = sub_100033EAC((uint64_t)SESClientInfo, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEEndPointXPC) setPrivateDataWithProxy:identifier:privateData:privateDataOffset:reply:]"));
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000238F4;
  v25[3] = &unk_100303CE0;
  v28 = a6;
  v26 = v13;
  v27 = v14;
  v23 = v13;
  v24 = v14;
  -[SESServer endPointAction:proxy:clientInfo:reason:reply:](self, "endPointAction:proxy:clientInfo:reason:reply:", v12, v15, v21, v22, v25);

}

- (void)updateEndpoint:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  SESClientInfo *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;

  v6 = a3;
  v7 = a4;
  v9 = SESDefaultLogObject(v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "publicKeyIdentifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "asHexString"));
    *(_DWORD *)buf = 138412290;
    v25 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "updateEndpoint %@", buf, 0xCu);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v14 = sub_100033EAC((uint64_t)SESClientInfo, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "publicKeyIdentifier"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "asHexString"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEEndPointXPC) updateEndpoint:reply:]"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100023D1C;
  v21[3] = &unk_100303D08;
  v22 = v6;
  v23 = v7;
  v19 = v6;
  v20 = v7;
  -[SESServer endPointDBAction:clientInfo:reason:reply:](self, "endPointDBAction:clientInfo:reason:reply:", v17, v15, v18, v21);

}

- (void)getPrivateDataWithProxy:(id)a3 identifier:(id)a4 privateDataOffset:(unsigned __int16)a5 privateDataLength:(unsigned __int16)a6 reply:(id)a7
{
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  SESClientInfo *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  unsigned __int16 v25;
  unsigned __int16 v26;
  uint8_t buf[4];
  id v28;

  v12 = a4;
  v13 = a7;
  v14 = a3;
  v16 = SESDefaultLogObject(v14, v15);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v12;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v19 = sub_100033EAC((uint64_t)SESClientInfo, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEEndPointXPC) getPrivateDataWithProxy:identifier:privateDataOffset:privateDataLength:reply:]"));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100024064;
  v23[3] = &unk_100303D30;
  v24 = v13;
  v25 = a5;
  v26 = a6;
  v22 = v13;
  -[SESServer endPointAction:proxy:clientInfo:reason:reply:](self, "endPointAction:proxy:clientInfo:reason:reply:", v12, v14, v20, v21, v23);

}

- (void)createEncryptionKeyEndPointWithProxy:(id)a3 identifier:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  SESClientInfo *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  id v22;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  v12 = SESDefaultLogObject(v10, v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v8;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v15 = sub_100033EAC((uint64_t)SESClientInfo, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEEndPointXPC) createEncryptionKeyEndPointWithProxy:identifier:reply:]"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100024470;
  v19[3] = &unk_100303D58;
  v20 = v9;
  v18 = v9;
  -[SESServer endPointAction:proxy:clientInfo:reason:reply:](self, "endPointAction:proxy:clientInfo:reason:reply:", v8, v10, v16, v17, v19);

}

- (void)setConfidentialDataEndPointWithIdentifier:(id)a3 senderEphemeralPublicKey:(id)a4 encryptedData:(id)a5 offset:(unsigned __int16)a6 reply:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  SESClientInfo *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  unsigned __int16 v27;

  v12 = a4;
  v13 = a5;
  v14 = a7;
  v15 = a3;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v17 = sub_100033EAC((uint64_t)SESClientInfo, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEEndPointXPC) setConfidentialDataEndPointWithIdentifier:senderEphemeralPublicKey:encryptedData:offset:reply:]"));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100024708;
  v23[3] = &unk_100303D80;
  v25 = v13;
  v26 = v14;
  v24 = v12;
  v27 = a6;
  v20 = v13;
  v21 = v12;
  v22 = v14;
  -[SESServer endPointAction:clientInfo:reason:reply:](self, "endPointAction:clientInfo:reason:reply:", v15, v18, v19, v23);

}

- (void)updateHydraMailboxesWithProxy:(id)a3 identifier:(id)a4 encryptedSEBlob:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  SESClientInfo *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  SESServer *v26;
  id v27;
  id v28;
  uint8_t buf[16];

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = a3;
  v15 = SESDefaultLogObject(v13, v14);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "", buf, 2u);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v18 = sub_100033EAC((uint64_t)SESClientInfo, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEEndPointXPC) updateHydraMailboxesWithProxy:identifier:encryptedSEBlob:reply:]"));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100024A48;
  v24[3] = &unk_100303C90;
  v25 = v11;
  v26 = self;
  v27 = v10;
  v28 = v12;
  v21 = v10;
  v22 = v11;
  v23 = v12;
  -[SESServer endPointAction:proxy:clientInfo:reason:reply:](self, "endPointAction:proxy:clientInfo:reason:reply:", v21, v13, v19, v20, v24);

}

- (id)_applyPrivateMailboxContents:(id *)a3 secureElement:(id)a4 instanceAID:(id)a5 keyIdentifier:(id)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  __int128 v24;
  __int128 v25;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v24 = 0u;
  v25 = 0u;
  v12 = DERParseSequenceSpecContent(a3, &off_100303568, &v24, 32);
  if ((_DWORD)v12)
    v14 = 0;
  else
    v14 = *((_QWORD *)&v24 + 1) == 2;
  if (!v14 || *((_QWORD *)&v25 + 1) == 0)
  {
    v16 = SESDefaultLogObject(v12, v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v17 = SESCreateAndLogError(0, v18, SESErrorDomain, 1, CFSTR("Failed to decode private mailbox content 0x%d"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(v17);
  }
  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "hexStringAsData"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "hexStringAsData"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithDERItem:](NSData, "dataWithDERItem:", &v25));
    v21 = sub_1000438A0(v9, v18, v19, v20, bswap32(*(unsigned __int16 *)v24) >> 16);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);

  }
  return v22;
}

- (id)_applyConfidentialMailboxContents:(id *)a3 secureElement:(id)a4 instanceAID:(id)a5 keyIdentifier:(id)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v26 = 0u;
  v27 = 0u;
  v25 = 0u;
  v12 = DERParseSequenceSpecContent(a3, &off_100303578, &v25, 48);
  if ((_DWORD)v12)
    v14 = 0;
  else
    v14 = *((_QWORD *)&v25 + 1) == 2;
  if (!v14 || (*((_QWORD *)&v26 + 1) == 65 ? (v15 = *((_QWORD *)&v27 + 1) == 0) : (v15 = 1), v15))
  {
    v22 = SESDefaultLogObject(v12, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v22);
    v23 = SESCreateAndLogError(0, v16, SESErrorDomain, 1, CFSTR("Failed to decode confidential mailbox content 0x%d"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(v23);
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "hexStringAsData"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "hexStringAsData"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithDERItem:](NSData, "dataWithDERItem:", &v26));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithDERItem:](NSData, "dataWithDERItem:", &v27));
    v20 = sub_10004448C(v9, v16, v17, v18, v19, bswap32(*(unsigned __int16 *)v25) >> 16);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

  }
  return v21;
}

- (void)createEndPointAuthorizationID:(id)a3 userAuth:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  SESClientInfo *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v12 = SESDefaultLogObject(v10, v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v27 = v8;
    v28 = 2112;
    v29 = v9;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%@ %@", buf, 0x16u);
  }

  if (v8 && v9)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
    v17 = sub_100033EAC((uint64_t)SESClientInfo, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEEndPointXPC) createEndPointAuthorizationID:userAuth:reply:]"));
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10002552C;
    v23[3] = &unk_100303DD0;
    v25 = v10;
    v24 = v9;
    -[SESServer endPointAction:clientInfo:reason:reply:](self, "endPointAction:clientInfo:reason:reply:", v8, v18, v19, v23);

    v20 = v25;
  }
  else
  {
    v21 = SESDefaultLogObject(v14, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v22 = SESCreateAndLogError(0, v18, SESErrorDomain, 1, CFSTR("Null passed to createEndPointAuthorizationID"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(v22);
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v20);
  }

}

- (void)listEndPointAuthorizations:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[16];

  v4 = a3;
  v6 = SESDefaultLogObject(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "", buf, 2u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEEndPointXPC) listEndPointAuthorizations:]"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100025A50;
  v10[3] = &unk_100302E80;
  v11 = v4;
  v9 = v4;
  -[SESServer secureElementService:reply:](self, "secureElementService:reply:", v8, v10);

}

- (void)deleteEndPointAuthorizationID:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;

  v6 = a3;
  v7 = a4;
  v9 = SESDefaultLogObject(v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEEndPointXPC) deleteEndPointAuthorizationID:reply:]"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100025C5C;
  v14[3] = &unk_100302D68;
  v15 = v6;
  v16 = v7;
  v12 = v6;
  v13 = v7;
  -[SESServer secureElementService:reply:](self, "secureElementService:reply:", v11, v14);

}

- (void)preAuthorizeEndpointWithProxy:(id)a3 keyIdentifier:(id)a4 bindingAttestation:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  SESClientInfo *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  _BOOL4 v29;
  __int16 v30;
  id v31;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = a3;
  v15 = SESDefaultLogObject(v13, v14);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v29 = v13 != 0;
    v30 = 2112;
    v31 = v10;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "preAuthorizeEndpointWithProxy %d keyIdentifier %@", buf, 0x12u);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v18 = sub_100033EAC((uint64_t)SESClientInfo, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEEndPointXPC) preAuthorizeEndpointWithProxy:keyIdentifier:bindingAttestation:reply:]"));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100025ED0;
  v24[3] = &unk_100303CB8;
  v26 = v11;
  v27 = v12;
  v25 = v10;
  v21 = v11;
  v22 = v10;
  v23 = v12;
  -[SESServer endPointAction:proxy:clientInfo:reason:reply:](self, "endPointAction:proxy:clientInfo:reason:reply:", v22, v13, v19, v20, v24);

}

- (void)authorizeEndPointWithProxy:(id)a3 version:(unsigned __int8)a4 identifier:(id)a5 externalCA:(id)a6 instanceCA:(id)a7 endpointCertificate:(id)a8 encryptionKeyAttestation:(id)a9 bindingAttestation:(id)a10 bindingAttestationToken:(id)a11 confidentialDataOffset:(unsigned __int16)a12 confidentialDataLength:(unsigned __int16)a13 metaData:(id)a14 authorizationID:(id)a15 reply:(id)a16
{
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  SESClientInfo *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v44;
  id v45;
  id v46;
  id v47;
  id v49;
  _QWORD v50[4];
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  unsigned __int16 v60;
  unsigned __int16 v61;
  unsigned __int8 v62;
  uint8_t buf[4];
  _BOOL4 v64;
  __int16 v65;
  id v66;

  v49 = a5;
  v45 = a6;
  v41 = a7;
  v47 = a8;
  v38 = a9;
  v20 = a10;
  v21 = a11;
  v37 = a14;
  v36 = a15;
  v22 = a16;
  v23 = a3;
  v25 = SESDefaultLogObject(v23, v24);
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v64 = v23 != 0;
    v65 = 2112;
    v66 = v49;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "authorizeEndPointWithProxy %d keyIdentifier %@", buf, 0x12u);
  }

  v35 = v23;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v28 = sub_100033EAC((uint64_t)SESClientInfo, v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue(v28);

  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEEndPointXPC) authorizeEndPointWithProxy:version:identifier:externalCA:instanceCA:endpointCertificate:encryptionKeyAttestation:bindingAttestation:bindingAttestationToken:confidentialDataOffset:confidentialDataLength:metaData:authorizationID:reply:]"));
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472;
  v50[2] = sub_1000262D4;
  v50[3] = &unk_100303DF8;
  v59 = v22;
  v60 = a13;
  v61 = a12;
  v51 = v47;
  v52 = v20;
  v62 = a4;
  v53 = v21;
  v54 = v45;
  v55 = v41;
  v56 = v38;
  v57 = v37;
  v58 = v36;
  v44 = v36;
  v40 = v37;
  v39 = v38;
  v42 = v41;
  v46 = v45;
  v31 = v21;
  v32 = v20;
  v33 = v47;
  v34 = v22;
  -[SESServer endPointAction:proxy:clientInfo:reason:reply:](self, "endPointAction:proxy:clientInfo:reason:reply:", v49, v35, v29, v30, v50);

}

- (void)privacyDecryptDataWithEndPoint:(id)a3 data:(id)a4 ephemeralPublicKey:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  SESClientInfo *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  id v29;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v15 = SESDefaultLogObject(v13, v14);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v29 = v10;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v18 = sub_100033EAC((uint64_t)SESClientInfo, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEEndPointXPC) privacyDecryptDataWithEndPoint:data:ephemeralPublicKey:reply:]"));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000268B0;
  v24[3] = &unk_100303E20;
  v26 = v12;
  v27 = v13;
  v25 = v11;
  v21 = v12;
  v22 = v11;
  v23 = v13;
  -[SESServer endPointDBAction:clientInfo:reason:reply:](self, "endPointDBAction:clientInfo:reason:reply:", v10, v19, v20, v24);

}

- (void)privacyDecryptDataWithKeyPair:(id)a3 secretKey:(id)a4 data:(id)a5 ephemeralPublicKey:(id)a6 reply:(id)a7
{
  id v11;
  id v12;
  id v13;
  void (**v14)(id, _QWORD, void *);
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  SESClientInfo *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  const __CFDictionary *v25;
  SecKeyRef v26;
  uint64_t v27;
  SecKeyRef v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  id v39;
  id v40;
  uint8_t buf[8];
  _QWORD v42[3];
  _QWORD v43[3];

  v11 = a3;
  v12 = a4;
  v39 = a5;
  v13 = a6;
  v14 = (void (**)(id, _QWORD, void *))a7;
  v16 = SESDefaultLogObject(v14, v15);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "", buf, 2u);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v19 = sub_100033EAC((uint64_t)SESClientInfo, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

  if ((sub_100034090((uint64_t)v20) & 1) != 0 || (v21 = sub_1000340B0((uint64_t)v20), (v21 & 1) != 0))
  {
    v38 = v11;
    v23 = objc_msgSend(v11, "mutableCopy");
    v24 = v12;
    objc_msgSend(v23, "appendData:", v12);
    v42[0] = kSecAttrKeyClass;
    v42[1] = kSecAttrKeyType;
    v43[0] = kSecAttrKeyClassPrivate;
    v43[1] = kSecAttrKeyTypeECSECPrimeRandom;
    v42[2] = kSecAttrKeySizeInBits;
    v43[2] = &off_100322E48;
    v25 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v43, v42, 3));
    *(_QWORD *)buf = 0;
    v26 = SecKeyCreateWithData((CFDataRef)v23, v25, (CFErrorRef *)buf);
    v28 = v26;
    v29 = *(void **)buf;
    if (*(_QWORD *)buf || !v26)
    {
      v33 = SESDefaultLogObject(v26, v27);
      v32 = (id)objc_claimAutoreleasedReturnValue(v33);
      v34 = SESCreateAndLogError(0, v32, SESErrorDomain, 0, CFSTR("Failed to create SecKeyRef"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
      v14[2](v14, 0, v35);

      v30 = v39;
    }
    else
    {
      v40 = 0;
      v30 = v39;
      v31 = decryptPrivacyData(v26, v39, v13, &v40);
      v29 = (void *)objc_claimAutoreleasedReturnValue(v31);
      v32 = v40;
      ((void (**)(id, id, void *))v14)[2](v14, v32, v29);
    }

    v11 = v38;
    v12 = v24;
  }
  else
  {
    v36 = SESDefaultLogObject(v21, v22);
    v23 = (id)objc_claimAutoreleasedReturnValue(v36);
    v37 = SESCreateAndLogError(0, v23, SESErrorDomain, 0, CFSTR("Missing EP/allEP entitlement"));
    v25 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(v37);
    v14[2](v14, 0, v25);
    v30 = v39;
  }

}

- (void)privacyEncryptDataWithEndPoint:(id)a3 data:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  SESClientInfo *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v12 = SESDefaultLogObject(v10, v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v8;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v15 = sub_100033EAC((uint64_t)SESClientInfo, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEEndPointXPC) privacyEncryptDataWithEndPoint:data:reply:]"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100026FD0;
  v21[3] = &unk_100303E20;
  v23 = v9;
  v24 = v10;
  v22 = v8;
  v18 = v9;
  v19 = v8;
  v20 = v10;
  -[SESServer endPointDBAction:clientInfo:reason:reply:](self, "endPointDBAction:clientInfo:reason:reply:", v19, v16, v17, v21);

}

- (void)privacyEncryptDataWithManufacturer:(id)a3 environment:(id)a4 region:(id)a5 data:(id)a6 reply:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void (**v15)(id, _QWORD, id);
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  SESClientInfo *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  SESConfigDCK *v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t CertificatePublicKey;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  uint8_t buf[4];
  id v45;
  __int16 v46;
  id v47;
  __int16 v48;
  id v49;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = (void (**)(id, _QWORD, id))a7;
  v17 = SESDefaultLogObject(v15, v16);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    v45 = v11;
    v46 = 2112;
    v47 = v12;
    v48 = 2112;
    v49 = v13;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%@ %@ %@", buf, 0x20u);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v20 = sub_100033EAC((uint64_t)SESClientInfo, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

  if ((sub_100034090((uint64_t)v21) & 1) != 0 || (v22 = sub_1000340B0((uint64_t)v21), (v22 & 1) != 0))
  {
    v24 = objc_opt_new(SESConfigDCK);
    v43 = 0;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[SESConfigDCK getEncryptionCertificateFor:environment:region:error:](v24, "getEncryptionCertificateFor:environment:region:error:", v11, v12, v13, &v43));
    v26 = v43;
    if (v26)
    {
      v27 = v26;
      v15[2](v15, 0, v26);
    }
    else
    {
      v40 = v14;
      CertificatePublicKey = getCertificatePublicKey(v25);
      v30 = (void *)objc_claimAutoreleasedReturnValue(CertificatePublicKey);
      if (v30)
      {
        v41 = 0;
        v42 = 0;
        v31 = encryptPrivacyData(v40, v30, &v42, &v41);
        v27 = (void *)objc_claimAutoreleasedReturnValue(v31);
        v32 = v42;
        v39 = v41;
        if (v27)
        {
          v15[2](v15, 0, v27);
        }
        else
        {
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "sha256"));
          v37 = (void *)objc_claimAutoreleasedReturnValue(+[SEEndPointPrivacyEncryptResponse responseWithCipherText:ephemeralPublicKeyData:receiverPublicKeyHash:](SEEndPointPrivacyEncryptResponse, "responseWithCipherText:ephemeralPublicKeyData:receiverPublicKeyHash:", v39, v32, v38));
          ((void (**)(id, void *, id))v15)[2](v15, v37, 0);

        }
      }
      else
      {
        v35 = SESDefaultLogObject(0, v29);
        v39 = (id)objc_claimAutoreleasedReturnValue(v35);
        v36 = SESCreateAndLogError(0, v39, SESErrorDomain, 0, CFSTR("Failed to retrieve public key"));
        v32 = (id)objc_claimAutoreleasedReturnValue(v36);
        v15[2](v15, 0, v32);
        v27 = 0;
      }

      v14 = v40;
    }

  }
  else
  {
    v33 = SESDefaultLogObject(v22, v23);
    v24 = (SESConfigDCK *)objc_claimAutoreleasedReturnValue(v33);
    v34 = SESCreateAndLogError(0, v24, SESErrorDomain, 0, CFSTR("Missing EP/allEP entitlement"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(v34);
    v15[2](v15, 0, v27);
  }

}

- (void)deleteEndPointWithPublicKey:(id)a3 reply:(id)a4
{
  void (**v4)(id, void *);
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];

  v4 = (void (**)(id, void *))a4;
  v6 = SESDefaultLogObject(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "", v9, 2u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("seserviced"), -1, 0));
  v4[2](v4, v8);

}

- (void)deleteEndPointWithPublicKeyIdentifier:(id)a3 reply:(id)a4
{
  void (**v4)(id, void *);
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];

  v4 = (void (**)(id, void *))a4;
  v6 = SESDefaultLogObject(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "", v9, 2u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("seserviced"), -1, 0));
  v4[2](v4, v8);

}

- (void)deleteEndPointWithProxy:(id)a3 identifier:(id)a4 mustBeTerminated:(BOOL)a5 reply:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  SESClientInfo *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  BOOL v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  _BOOL4 v31;
  __int16 v32;
  _BOOL4 v33;

  v7 = a5;
  v10 = a4;
  v11 = a6;
  v12 = a3;
  v14 = SESDefaultLogObject(v12, v13);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    v29 = v10;
    v30 = 1024;
    v31 = v12 != 0;
    v32 = 1024;
    v33 = v7;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Identifier %@ proxy %d mustBeTerminated %d", buf, 0x18u);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v17 = sub_100033EAC((uint64_t)SESClientInfo, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEEndPointXPC) deleteEndPointWithProxy:identifier:mustBeTerminated:reply:]"));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000277E8;
  v23[3] = &unk_100303E48;
  v25 = v18;
  v26 = v11;
  v27 = v7;
  v24 = v10;
  v20 = v18;
  v21 = v10;
  v22 = v11;
  -[SESServer endPointAction:proxy:clientInfo:reason:reply:](self, "endPointAction:proxy:clientInfo:reason:reply:", v21, v12, v20, v19, v23);

}

- (void)remoteTerminationRequestWithProxy:(id)a3 remoteTerminationRequest:(id)a4 publicKeyIdentifier:(id)a5 taskID:(id)a6 reply:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  SESClientInfo *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  const char *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  SESServer *v36;
  id v37;
  id v38;
  id v39;
  uint8_t buf[4];
  id v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  _BOOL4 v47;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = a3;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v18 = sub_100033EAC((uint64_t)SESClientInfo, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

  v22 = SESDefaultLogObject(v20, v21);
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    v25 = sub_10003407C(v19, v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    *(_DWORD *)buf = 138413058;
    v41 = v13;
    v42 = 2112;
    v43 = v26;
    v44 = 2112;
    v45 = v14;
    v46 = 1024;
    v47 = v12 != 0;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "key %@ client %@ task %@ hasRTR %d", buf, 0x26u);

  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEEndPointXPC) remoteTerminationRequestWithProxy:remoteTerminationRequest:publicKeyIdentifier:taskID:reply:]"));
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100027E80;
  v33[3] = &unk_100303E70;
  v34 = v13;
  v35 = v12;
  v36 = self;
  v37 = v14;
  v38 = v19;
  v39 = v15;
  v28 = v19;
  v29 = v14;
  v30 = v12;
  v31 = v13;
  v32 = v15;
  -[SESServer endPointAction:proxy:clientInfo:reason:reply:](self, "endPointAction:proxy:clientInfo:reason:reply:", v31, v16, v28, v27, v33);

}

- (id)revokeRemoteTerminationRequestEndPoints:(id)a3 sesDatabase:(id)a4 identifier:(id)a5 taskID:(id)a6 clientInfo:(id)a7 outError:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  void *v65;
  void *v66;
  uint64_t v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  id v73;
  id v74;
  id v75;
  uint8_t buf[4];
  id v77;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v72 = a6;
  v17 = a7;
  v18 = objc_claimAutoreleasedReturnValue(-[SESServer messageQueue](self, "messageQueue"));
  dispatch_assert_queue_V2(v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "asHexString"));
  v74 = 0;
  v75 = 0;
  v20 = (id)objc_claimAutoreleasedReturnValue(-[SESServer _getEndPointAndValidateAccess:identifier:clientInfo:outEndPointEntity:outEndPoint:](self, "_getEndPointAndValidateAccess:identifier:clientInfo:outEndPointEntity:outEndPoint:", v15, v19, v17, &v75, &v74));

  v21 = v75;
  v22 = v74;

  if (!v20 && v22 && v21)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "revocationAttestation"));

    if (!v25)
    {
      v68 = v16;
      v69 = v15;
      v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "readerInfo"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "bleAddress"));
      v42 = 3;
      if (!v41)
        v42 = 1;
      v67 = v42;

      v43 = (void *)objc_claimAutoreleasedReturnValue(-[SESServer getEncryptedCarOEMProprietaryData:withEndpointEntity:withSecureElement:](self, "getEncryptedCarOEMProprietaryData:withEndpointEntity:withSecureElement:", v22, v21, v14));
      objc_msgSend(v22, "setCarOEMProprietaryData:", v43);

      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSData randomData:](NSData, "randomData:", 16));
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "instance"));
      v45 = v14;
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "identifier"));
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "hexStringAsData"));
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "publicKeyIdentifier"));
      v73 = 0;
      v70 = v45;
      v49 = sub_1000464A0(v45, v47, v48, v34, 0, &v73);
      v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
      v20 = v73;

      if (v20 || !v50)
      {
        if (a8)
        {
          v59 = SESDefaultLogObject(v51, v52);
          v60 = (void *)objc_claimAutoreleasedReturnValue(v59);
          v61 = SESErrorDomain;
          v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "publicKeyIdentifier"));
          v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "asHexString"));
          v63 = SESCreateAndLogError(v20, v60, v61, 0, CFSTR("While revoking %@"));
          *a8 = (id)objc_claimAutoreleasedReturnValue(v63);

        }
        sub_100049548((uint64_t)SESDAnalyticsLogger, 2, v71, v67, 3);
        v36 = 0;
        v15 = v69;
        v14 = v70;
        v16 = v68;
        v40 = v72;
      }
      else
      {
        objc_msgSend(v22, "setRevocationAttestation:");
        v15 = v69;
        v40 = v72;
        if (v72)
          objc_msgSend(v22, "setTerminatedByTaskID:", v72);
        v53 = sub_10003B1F0(v69, v21, v22);
        v54 = objc_claimAutoreleasedReturnValue(v53);
        v20 = (id)v54;
        v14 = v70;
        v16 = v68;
        if (v54)
        {
          v56 = SESDefaultLogObject(v54, v55);
          v57 = objc_claimAutoreleasedReturnValue(v56);
          if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v77 = v20;
            _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, "Failed to updated db? %@", buf, 0xCu);
          }

          v58 = 4;
        }
        else
        {
          v58 = 0;
        }
        +[EndpointStore removeWithEndpoint:](_TtC10seserviced13EndpointStore, "removeWithEndpoint:", v22);
        sub_100049548((uint64_t)SESDAnalyticsLogger, 2, v71, v67, v58);
        v36 = v50;
      }

      v33 = v71;
      goto LABEL_31;
    }
    if (a8)
    {
      v28 = SESDefaultLogObject(v26, v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
      v30 = SESErrorDomain;
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "publicKeyIdentifier"));
      v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "asHexString"));
      v32 = SESCreateAndLogError(0, v29, v30, 6, CFSTR("Endpoint %@ is already revoked"));
      *a8 = (id)objc_claimAutoreleasedReturnValue(v32);

    }
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "readerInfo", v65));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "bleAddress"));
    if (v34)
      v35 = 3;
    else
      v35 = 1;
    sub_100049548((uint64_t)SESDAnalyticsLogger, 2, v33, v35, 2);
    v20 = 0;
    v36 = 0;
LABEL_13:
    v40 = v72;
LABEL_31:

    goto LABEL_32;
  }
  if (a8)
  {
    v37 = SESDefaultLogObject(v23, v24);
    v33 = (void *)objc_claimAutoreleasedReturnValue(v37);
    v38 = SESErrorDomain;
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "asHexString"));
    v39 = SESCreateAndLogError(v20, v33, v38, 8, CFSTR("Unable to retrieve endpoint %@"));
    v36 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue(v39);
    goto LABEL_13;
  }
  v36 = 0;
  v40 = v72;
LABEL_32:

  return v36;
}

- (void)getInvitations:(id)a3
{
  id v4;
  void *v5;
  SESClientInfo *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v6 = sub_100033EAC((uint64_t)SESClientInfo, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  v8 = sub_100034090((uint64_t)v7);
  if ((v8 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEEndPointXPC) getInvitations:]"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100028A90;
    v15[3] = &unk_100303890;
    v17 = v4;
    v16 = v7;
    -[SESServer databaseServiceWithProxy:isReconcileRequired:reason:reply:](self, "databaseServiceWithProxy:isReconcileRequired:reason:reply:", 0, 0, v10, v15);

  }
  else
  {
    v11 = SESDefaultLogObject(v8, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = SESCreateAndLogError(0, v12, SESErrorDomain, 0, CFSTR("Missing EP entitlement"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v14);

  }
}

- (void)getInvitationWithId:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  SESClientInfo *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v9 = sub_100033EAC((uint64_t)SESClientInfo, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  v11 = sub_100034090((uint64_t)v10);
  if ((v11 & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEEndPointXPC) getInvitationWithId:reply:]"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100028D74;
    v18[3] = &unk_100303E98;
    v21 = v7;
    v19 = v6;
    v20 = v10;
    -[SESServer databaseServiceWithProxy:isReconcileRequired:reason:reply:](self, "databaseServiceWithProxy:isReconcileRequired:reason:reply:", 0, 0, v13, v18);

  }
  else
  {
    v14 = SESDefaultLogObject(v11, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = SESCreateAndLogError(0, v15, SESErrorDomain, 0, CFSTR("Missing EP entitlement"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v17);

  }
}

- (void)addInvitationWithId:(id)a3 data:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  SESClientInfo *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v12 = sub_100033EAC((uint64_t)SESClientInfo, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  v14 = sub_100034090((uint64_t)v13);
  if ((v14 & 1) != 0)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEEndPointXPC) addInvitationWithId:data:reply:]"));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100029080;
    v21[3] = &unk_100303780;
    v25 = v10;
    v22 = v8;
    v23 = v9;
    v24 = v13;
    -[SESServer databaseServiceWithProxy:isReconcileRequired:reason:reply:](self, "databaseServiceWithProxy:isReconcileRequired:reason:reply:", 0, 0, v16, v21);

  }
  else
  {
    v17 = SESDefaultLogObject(v14, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = SESCreateAndLogError(0, v18, SESErrorDomain, 0, CFSTR("Missing EP entitlement"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    (*((void (**)(id, void *))v10 + 2))(v10, v20);

  }
}

- (void)deleteInvitationWithId:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  SESClientInfo *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v9 = sub_100033EAC((uint64_t)SESClientInfo, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  v11 = sub_100034090((uint64_t)v10);
  if ((v11 & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEEndPointXPC) deleteInvitationWithId:reply:]"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000292E4;
    v18[3] = &unk_100303E98;
    v21 = v7;
    v19 = v6;
    v20 = v10;
    -[SESServer databaseServiceWithProxy:isReconcileRequired:reason:reply:](self, "databaseServiceWithProxy:isReconcileRequired:reason:reply:", 0, 0, v13, v18);

  }
  else
  {
    v14 = SESDefaultLogObject(v11, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = SESCreateAndLogError(0, v15, SESErrorDomain, 0, CFSTR("Missing EP entitlement"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    (*((void (**)(id, void *))v7 + 2))(v7, v17);

  }
}

- (void)getEndpointIdWithUuid:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  SESClientInfo *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v9 = sub_100033EAC((uint64_t)SESClientInfo, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  v11 = sub_100034090((uint64_t)v10);
  if ((v11 & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEEndPointXPC) getEndpointIdWithUuid:reply:]"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100029544;
    v18[3] = &unk_100303E98;
    v21 = v7;
    v19 = v6;
    v20 = v10;
    -[SESServer databaseServiceWithProxy:isReconcileRequired:reason:reply:](self, "databaseServiceWithProxy:isReconcileRequired:reason:reply:", 0, 0, v13, v18);

  }
  else
  {
    v14 = SESDefaultLogObject(v11, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = SESCreateAndLogError(0, v15, SESErrorDomain, 0, CFSTR("Missing EP entitlement"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v17);

  }
}

- (void)addEndpointId:(id)a3 withUuid:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  SESClientInfo *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v12 = sub_100033EAC((uint64_t)SESClientInfo, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  v14 = sub_100034090((uint64_t)v13);
  if ((v14 & 1) != 0)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEEndPointXPC) addEndpointId:withUuid:reply:]"));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100029848;
    v21[3] = &unk_100303780;
    v25 = v10;
    v22 = v8;
    v23 = v9;
    v24 = v13;
    -[SESServer databaseServiceWithProxy:isReconcileRequired:reason:reply:](self, "databaseServiceWithProxy:isReconcileRequired:reason:reply:", 0, 0, v16, v21);

  }
  else
  {
    v17 = SESDefaultLogObject(v14, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = SESCreateAndLogError(0, v18, SESErrorDomain, 0, CFSTR("Missing EP entitlement"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    (*((void (**)(id, void *))v10 + 2))(v10, v20);

  }
}

- (void)deleteEndpointIdWithUuid:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  SESClientInfo *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v9 = sub_100033EAC((uint64_t)SESClientInfo, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  v11 = sub_100034090((uint64_t)v10);
  if ((v11 & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEEndPointXPC) deleteEndpointIdWithUuid:reply:]"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100029AAC;
    v18[3] = &unk_100303E98;
    v21 = v7;
    v19 = v6;
    v20 = v10;
    -[SESServer databaseServiceWithProxy:isReconcileRequired:reason:reply:](self, "databaseServiceWithProxy:isReconcileRequired:reason:reply:", 0, 0, v13, v18);

  }
  else
  {
    v14 = SESDefaultLogObject(v11, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = SESCreateAndLogError(0, v15, SESErrorDomain, 0, CFSTR("Missing EP entitlement"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    (*((void (**)(id, void *))v7 + 2))(v7, v17);

  }
}

- (void)getEndpointBindingAttestationRequestWithProxy:(id)a3 authorityIdentifier:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  SESClientInfo *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  SESServer *v25;
  id v26;
  uint8_t buf[4];
  _BOOL4 v28;
  __int16 v29;
  id v30;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v12 = sub_100033EAC((uint64_t)SESClientInfo, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  v14 = sub_100034090((uint64_t)v13);
  if ((v14 & 1) != 0 || (v14 = sub_1000340B0((uint64_t)v13), (v14 & 1) != 0))
  {
    v16 = SESDefaultLogObject(v14, v15);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      v28 = v8 != 0;
      v29 = 2112;
      v30 = v9;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "getEndpointBindingAttestationRequestWithProxy %d authorityIdentifier %@", buf, 0x12u);
    }

    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100029D98;
    v22[3] = &unk_100303758;
    v26 = v10;
    v23 = v9;
    v24 = v13;
    v25 = self;
    -[SESServer endPointServiceAvailableWithProxy:reason:reply:](self, "endPointServiceAvailableWithProxy:reason:reply:", v8, CFSTR("getEndpointBindingAttestationRequestWithProxy"), v22);

  }
  else
  {
    v18 = SESDefaultLogObject(v14, v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = SESCreateAndLogError(0, v19, SESErrorDomain, 0, CFSTR("Missing EP entitlement"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v21);

  }
}

- (void)listEndPointContainers:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  SESClientInfo *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v9 = SESDefaultLogObject(v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "", buf, 2u);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v12 = sub_100033EAC((uint64_t)SESClientInfo, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  if ((sub_100034090((uint64_t)v13) & 1) != 0 || (v14 = sub_1000340B0((uint64_t)v13), (v14 & 1) != 0))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEEndPointXPC) listEndPointContainers:reply:]"));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10002A1E4;
    v21[3] = &unk_100303708;
    v22 = v7;
    -[SESServer endPointServiceAvailableWithProxy:reason:reply:](self, "endPointServiceAvailableWithProxy:reason:reply:", v6, v16, v21);

    v17 = v22;
  }
  else
  {
    v18 = SESDefaultLogObject(v14, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v19 = SESCreateAndLogError(0, v17, SESErrorDomain, 0, CFSTR("Missing EP/allEP entitlement"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v20);

  }
}

- (void)isCarKeySupported:(id)a3 brand:(id)a4 uuid:(id)a5 reply:(id)a6
{
  id v9;
  id v10;
  id v11;
  void (**v12)(id, _QWORD, void *);
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  SESClientInfo *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  SESConfigDCK *v21;
  SESConfigDCK *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  uint8_t buf[16];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void (**)(id, _QWORD, void *))a6;
  v14 = SESDefaultLogObject(v12, v13);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "", buf, 2u);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v17 = sub_100033EAC((uint64_t)SESClientInfo, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

  if ((sub_100034090((uint64_t)v18) & 1) == 0)
  {
    v19 = sub_1000340B0((uint64_t)v18);
    if ((v19 & 1) == 0)
    {
      v27 = SESDefaultLogObject(v19, v20);
      v24 = (id)objc_claimAutoreleasedReturnValue(v27);
      v28 = SESCreateAndLogError(0, v24, SESErrorDomain, 0, CFSTR("Missing EP/allEP entitlement"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(v28);
      v12[2](v12, 0, v26);
      goto LABEL_13;
    }
  }
  v21 = objc_opt_new(SESConfigDCK);
  v22 = v21;
  if (v10 && v11)
  {
    v30 = 0;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[SESConfigDCK BOOLValueForSetting:manufacturer:brand:uuid:error:](v21, "BOOLValueForSetting:manufacturer:brand:uuid:error:", 5, v9, v10, v11, &v30));
    v24 = v30;
    v25 = objc_msgSend(v23, "BOOLValue");

  }
  else
  {
    v29 = 0;
    v25 = -[SESConfigDCK isDCKConfigurationAvailableFor:error:](v21, "isDCKConfigurationAvailableFor:error:", v9, &v29);
    v24 = v29;
  }

  +[SESAssetManager syncMobileAssetUserInitiated](_TtC10seserviced15SESAssetManager, "syncMobileAssetUserInitiated");
  if (!v24)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v25));
    ((void (**)(id, void *, void *))v12)[2](v12, v26, 0);
LABEL_13:

    goto LABEL_14;
  }
  v12[2](v12, 0, v24);
LABEL_14:

}

- (void)getCAGeneralStatisticsInfo:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  SESClientInfo *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[16];

  v4 = a3;
  v6 = SESDefaultLogObject(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "getCAGeneralStatisticsInfo", buf, 2u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v9 = sub_100033EAC((uint64_t)SESClientInfo, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  if ((sub_100034090((uint64_t)v10) & 1) != 0 || (v11 = sub_1000340B0((uint64_t)v10), (v11 & 1) != 0))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEEndPointXPC) getCAGeneralStatisticsInfo:]"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10002A8DC;
    v18[3] = &unk_100303EC0;
    v19 = v4;
    -[SESServer databaseService:reply:](self, "databaseService:reply:", v13, v18);

    v14 = v19;
  }
  else
  {
    v15 = SESDefaultLogObject(v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v16 = SESCreateAndLogError(0, v14, SESErrorDomain, 0, CFSTR("Missing EP/allEP entitlement"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v17);

  }
}

- (void)convertEndpointWithProxy:(id)a3 keyIdentifier:(id)a4 notBeforeDate:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, void *);
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  SESClientInfo *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  void *v25;
  void (**v26)(id, void *);
  uint64_t v27;
  uint64_t v28;
  const __CFString *v29;
  void (**v30)(id, void *);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  id v38;
  void (**v39)(id, void *);
  uint8_t buf[4];
  id v41;
  __int16 v42;
  void *v43;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, void *))a6;
  v15 = SESDefaultLogObject(v13, v14);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "asHexString"));
    *(_DWORD *)buf = 138412546;
    v41 = v11;
    v42 = 2112;
    v43 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "convertEndpointWithProxy %@ notBeforeDate %@", buf, 0x16u);

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v19 = sub_100033EAC((uint64_t)SESClientInfo, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

  if ((sub_100034090((uint64_t)v20) & 1) == 0)
  {
    v21 = sub_1000340B0((uint64_t)v20);
    if ((v21 & 1) == 0)
    {
      v27 = SESDefaultLogObject(v21, v22);
      v26 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue(v27);
      v28 = SESErrorDomain;
      v29 = CFSTR("Missing EP/allEP entitlement");
      v30 = v26;
      v31 = 0;
LABEL_10:
      v34 = SESCreateAndLogError(0, v30, v28, v31, v29);
      v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
      v13[2](v13, v35);

      goto LABEL_11;
    }
  }
  if (objc_msgSend(v12, "length") != (id)13)
  {
    v23 = objc_msgSend(v12, "length");
    if (v23 != (id)15)
    {
      v32 = SESDefaultLogObject(v23, v24);
      v26 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue(v32);
      v33 = SESErrorDomain;
      objc_msgSend(v12, "length");
      v29 = CFSTR("Wrong format for notBeforeDate length %lu");
      v30 = v26;
      v28 = v33;
      v31 = 1;
      goto LABEL_10;
    }
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEEndPointXPC) convertEndpointWithProxy:keyIdentifier:notBeforeDate:reply:]"));
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_10002AC94;
  v36[3] = &unk_100303CB8;
  v39 = v13;
  v37 = v11;
  v38 = v12;
  -[SESServer endPointAction:proxy:clientInfo:reason:reply:](self, "endPointAction:proxy:clientInfo:reason:reply:", v37, v10, v20, v25, v36);

  v26 = v39;
LABEL_11:

}

- (void)triggerHeadUnitPairing:(id)a3 data:(id)a4 reply:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, void *);
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  SESClientInfo *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  const __CFString *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  __int16 v28[8];

  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, void *))a5;
  v11 = SESDefaultLogObject(v9, v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v28[0] = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "", (uint8_t *)v28, 2u);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v14 = sub_100033EAC((uint64_t)SESClientInfo, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  v16 = sub_100034090((uint64_t)v15);
  if ((v16 & 1) == 0)
  {
    v16 = sub_1000340B0((uint64_t)v15);
    if ((v16 & 1) == 0)
    {
      v25 = SESDefaultLogObject(v16, v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue(v25);
      v21 = SESErrorDomain;
      v22 = CFSTR("Missing EP/allEP entitlement");
      v23 = v20;
      v24 = 0;
      goto LABEL_9;
    }
  }
  if (!v7)
  {
    v19 = SESDefaultLogObject(v16, v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v21 = SESErrorDomain;
    v22 = CFSTR("Missing key identifier");
    v23 = v20;
    v24 = 1;
LABEL_9:
    v26 = SESCreateAndLogError(0, v23, v21, v24, v22);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    v9[2](v9, v27);

    goto LABEL_10;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[AlishaExternal shared](_TtC10seserviced14AlishaExternal, "shared"));
  objc_msgSend(v18, "triggerHeadUnitPairingWith:keyIdentifier:", v8, v7);

  v9[2](v9, 0);
LABEL_10:

}

- (void)sendDeviceIntentWithConfidence:(id)a3 keyIdentifier:(id)a4 reply:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, _QWORD);
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  SESClientInfo *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  const __CFString *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, _QWORD))a5;
  v11 = SESDefaultLogObject(v9, v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "", buf, 2u);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v14 = sub_100033EAC((uint64_t)SESClientInfo, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  v16 = sub_100034090((uint64_t)v15);
  if ((v16 & 1) != 0 || (v16 = sub_1000340B0((uint64_t)v15), (v16 & 1) != 0))
  {
    if (v7 && v8)
    {
      v18 = objc_msgSend(v7, "unsignedIntValue");
      if (v18 < 3)
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[AlishaExternal shared](_TtC10seserviced14AlishaExternal, "shared"));
        objc_msgSend(v31, "sendDeviceIntentFor:", v8);

        v9[2](v9, 0);
        goto LABEL_13;
      }
      v20 = SESDefaultLogObject(v18, v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      v22 = SESErrorDomain;
      objc_msgSend(v7, "unsignedIntValue");
      v23 = CFSTR("Invalid confidence level %d");
      v24 = v21;
      v25 = v22;
    }
    else
    {
      v26 = SESDefaultLogObject(v16, v17);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v26);
      v25 = SESErrorDomain;
      v23 = CFSTR("Missing confidence level %d key identifier %d");
      v24 = v21;
    }
    v27 = 1;
  }
  else
  {
    v28 = SESDefaultLogObject(v16, v17);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v28);
    v25 = SESErrorDomain;
    v23 = CFSTR("Missing EP/allEP entitlement");
    v24 = v21;
    v27 = 0;
  }
  v29 = SESCreateAndLogError(0, v24, v25, v27, v23);
  v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
  ((void (**)(id, void *))v9)[2](v9, v30);

LABEL_13:
}

- (void)notifyEndpointTracked:(id)a3 reply:(id)a4
{
  id v5;
  void (**v6)(id, _QWORD);
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  SESClientInfo *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  int v21;
  void *v22;

  v5 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  v8 = SESDefaultLogObject(v6, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "asHexString"));
    v21 = 138412290;
    v22 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Tracking completed for key %@", (uint8_t *)&v21, 0xCu);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v12 = sub_100033EAC((uint64_t)SESClientInfo, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  if ((sub_100034090((uint64_t)v13) & 1) != 0 || (v14 = sub_1000340B0((uint64_t)v13), (v14 & 1) != 0))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[AlishaExternal shared](_TtC10seserviced14AlishaExternal, "shared"));
    objc_msgSend(v16, "onTrackingCompleteFor:", v5);

    v6[2](v6, 0);
  }
  else
  {
    v17 = SESDefaultLogObject(v14, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = SESCreateAndLogError(0, v18, SESErrorDomain, 0, CFSTR("Missing EP/allEP entitlement"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    ((void (**)(id, void *))v6)[2](v6, v20);

  }
}

- (void)notifyPassAdded:(id)a3 reply:(id)a4
{
  id v5;
  void (**v6)(id, _QWORD);
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  SESClientInfo *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  int v21;
  void *v22;

  v5 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  v8 = SESDefaultLogObject(v6, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "asHexString"));
    v21 = 138412290;
    v22 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Pass added for key %@", (uint8_t *)&v21, 0xCu);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v12 = sub_100033EAC((uint64_t)SESClientInfo, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  if ((sub_100034090((uint64_t)v13) & 1) != 0 || (v14 = sub_1000340B0((uint64_t)v13), (v14 & 1) != 0))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[_SESSessionManager sessionManager](_SESSessionManager, "sessionManager"));
    objc_msgSend(v16, "didCreateKey:", v5);

    v6[2](v6, 0);
  }
  else
  {
    v17 = SESDefaultLogObject(v14, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = SESCreateAndLogError(0, v18, SESErrorDomain, 0, CFSTR("Missing EP/allEP entitlement"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    ((void (**)(id, void *))v6)[2](v6, v20);

  }
}

- (void)getSupportedLyonVersionsWithReply:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void (**v11)(id, void *, _QWORD);

  v11 = (void (**)(id, void *, _QWORD))a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[LyonExternal shared](_TtC10seserviced12LyonExternal, "shared"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "getSupportedLyonVersions"));

  if (v4)
  {
    v11[2](v11, v4, 0);
  }
  else
  {
    v7 = SESDefaultLogObject(v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = SESCreateAndLogError(0, v8, SESErrorDomain, 0, CFSTR("No available protocol versions"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    ((void (**)(id, void *, void *))v11)[2](v11, 0, v10);

  }
}

+ (id)server
{
  return sub_10003414C([SESServer alloc], (uint64_t)CFSTR("com.apple.seserviced"), CFSTR("/private/var/mobile/Library/SecureElementService/"));
}

+ (id)serverWithMachServiceName:(id)a3 storagePath:(id)a4
{
  id v5;
  id v6;
  _QWORD *v7;

  v5 = a4;
  v6 = a3;
  v7 = sub_10003414C([SESServer alloc], (uint64_t)v6, v5);

  return v7;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  __CFString *v5;
  id v6;
  uint64_t isKindOfClass;
  uint64_t v8;
  __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSSet *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSSet *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  NSSet *v29;
  void *v30;
  uint64_t v31;
  NSSet *v32;
  void *v33;
  BOOL v34;
  uint64_t v35;
  uint64_t v36;
  NSSet *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  uint64_t v41;
  SESServer *v43;
  _QWORD v44[4];
  __CFString *v45;
  int v46;
  _QWORD v47[4];
  NSObject *v48;
  int v49;
  _QWORD v50[2];
  _QWORD v51[2];
  uint8_t buf[4];
  const __CFString *v53;
  __int16 v54;
  __CFString *v55;

  v5 = (__CFString *)a4;
  v6 = -[__CFString processIdentifier](v5, "processIdentifier");
  isKindOfClass = objc_claimAutoreleasedReturnValue(-[__CFString valueForEntitlement:](v5, "valueForEntitlement:", CFSTR("application-identifier")));
  v9 = (__CFString *)isKindOfClass;
  if (isKindOfClass
    && (v10 = objc_opt_class(NSString),
        isKindOfClass = objc_opt_isKindOfClass(v9, v10),
        (isKindOfClass & 1) != 0))
  {
    v43 = self;
    v11 = SESDefaultLogObject(isKindOfClass, v8);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v53 = v9;
      v54 = 2112;
      v55 = v5;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Added connection from %@ (%@)", buf, 0x16u);
    }

    v50[0] = &off_100322E78;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v6));
    v50[1] = &off_100322E90;
    v51[0] = v13;
    v51[1] = v9;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v51, v50, 2));
    -[__CFString setUserInfo:](v5, "setUserInfo:", v14);

    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_100034B6C;
    v47[3] = &unk_1003042A8;
    v49 = (int)v6;
    v15 = v9;
    v48 = v15;
    -[__CFString setInvalidationHandler:](v5, "setInvalidationHandler:", v47);
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_100034C20;
    v44[3] = &unk_1003042A8;
    v46 = (int)v6;
    v45 = v15;
    -[__CFString setInterruptionHandler:](v5, "setInterruptionHandler:", v44);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___SEServerProtocol));
    v17 = objc_opt_class(NSArray);
    v18 = objc_opt_class(SEFidoKeySearchParameters);
    v19 = objc_opt_class(NSData);
    v20 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v17, v18, v19, objc_opt_class(NSString), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    objc_msgSend(v16, "setClasses:forSelector:argumentIndex:ofReply:", v21);

    v22 = objc_opt_class(NSArray);
    v23 = objc_opt_class(SEFidoKeySearchParameters);
    v24 = objc_opt_class(NSData);
    v25 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v22, v23, v24, objc_opt_class(NSString), 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    objc_msgSend(v16, "setClasses:forSelector:argumentIndex:ofReply:", v26);

    v27 = objc_opt_class(SEFidoKeySearchParameters);
    v28 = objc_opt_class(NSData);
    v29 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v27, v28, objc_opt_class(NSString), 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    objc_msgSend(v16, "setClasses:forSelector:argumentIndex:ofReply:", v30, "verifyWithFidoKeyFor:signedChallenge:usingProxy:callback:", 0, 0);

    v31 = objc_opt_class(SESPrivacyKey);
    v32 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v31, objc_opt_class(NSError), 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
    v34 = 1;
    objc_msgSend(v16, "setClasses:forSelector:argumentIndex:ofReply:", v33, "createPrivacyKeyForGroupIdentifier:withOptions:completion:", 0, 1);

    v35 = objc_opt_class(SESPrivacyKey);
    v36 = objc_opt_class(NSArray);
    v37 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v35, v36, objc_opt_class(NSError), 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
    objc_msgSend(v16, "setClasses:forSelector:argumentIndex:ofReply:", v38, "privacyKeysForGroupIdentifier:keyIdentifier:completion:", 0, 1);

    objc_msgSend(v16, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(SESPrivacyKey), "deletePrivacyKey:completion:", 0, 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___SEProxyInterface));
    objc_msgSend(v16, "setInterface:forSelector:argumentIndex:ofReply:", v39, "listEndPointsWithProxy:reply:", 0, 0);
    objc_msgSend(v16, "setInterface:forSelector:argumentIndex:ofReply:", v39, "cleanupAppletsWithNoEndpoints:reply:", 0, 0);
    objc_msgSend(v16, "setInterface:forSelector:argumentIndex:ofReply:", v39, "remoteTerminationRequestWithProxy:remoteTerminationRequest:publicKeyIdentifier:taskID:reply:", 0, 0);
    objc_msgSend(v16, "setInterface:forSelector:argumentIndex:ofReply:", v39, "deleteEndPointWithProxy:identifier:mustBeTerminated:reply:", 0, 0);
    objc_msgSend(v16, "setInterface:forSelector:argumentIndex:ofReply:", v39, "createAlishaEndpointWithProxy:identifier:authorityIdentifier:subjectIdentifier:configuration:readerIdentifier:readerPublicKey:readerInformation:startDate:endDate:keyIdentifier:authorizedKeys:confidentialMailBoxSize:privateMailBoxSize:reply:", 0, 0);
    objc_msgSend(v16, "setInterface:forSelector:argumentIndex:ofReply:", v39, "createHydraEndpointWithProxy:serverParams:reply:", 0, 0);
    objc_msgSend(v16, "setInterface:forSelector:argumentIndex:ofReply:", v39, "createLyonHydraEndpointWithProxy:serverParams:reply:", 0, 0);
    objc_msgSend(v16, "setInterface:forSelector:argumentIndex:ofReply:", v39, "createEncryptionKeyEndPointWithProxy:identifier:reply:", 0, 0);
    objc_msgSend(v16, "setInterface:forSelector:argumentIndex:ofReply:", v39, "updateHydraMailboxesWithProxy:identifier:encryptedSEBlob:reply:", 0, 0);
    objc_msgSend(v16, "setInterface:forSelector:argumentIndex:ofReply:", v39, "createLocalEndpointWithProxy:readerIdentifier:readerPublicKey:reply:", 0, 0);
    objc_msgSend(v16, "setInterface:forSelector:argumentIndex:ofReply:", v39, "createLyonEndpointWithProxy:readerGroupIdentifier:readerPublicKey:homeUUID:privateMailboxSize:reply:", 0, 0);
    objc_msgSend(v16, "setInterface:forSelector:argumentIndex:ofReply:", v39, "updateLyonCredentialDocumentStatusWithProxy:endpointIdentifier:accessDocumentPresent:accessDocumentSignedTimestamp:revocationDocumentPresent:revocationDocumentSignedTimestamp:reply:", 0, 0);
    objc_msgSend(v16, "setInterface:forSelector:argumentIndex:ofReply:", v39, "configureEndpointWithProxy:identifier:privateData:confidentialData:contactlessVolatileVisibility:contactlessPersistentVisibility:wiredVolatileVisibility:wiredPersistentVisibility:keySlot:nfcExpressOnlyInLPM:reply:", 0, 0);
    objc_msgSend(v16, "setInterface:forSelector:argumentIndex:ofReply:", v39, "signWithSEKey:keyData:data:algorithm:laExternalizedContext:reply:", 0, 0);
    objc_msgSend(v16, "setInterface:forSelector:argumentIndex:ofReply:", v39, "signPrecomputedDigest:keyData:digest:algorithm:laExternalizedContext:reply:", 0, 0);
    objc_msgSend(v16, "setInterface:forSelector:argumentIndex:ofReply:", v39, "sharedSecretWithSEKey:keyData:publicKey:algorithm:laExternalizedContext:reply:", 0, 0);
    objc_msgSend(v16, "setInterface:forSelector:argumentIndex:ofReply:", v39, "createPTAttestation:keyData:subjectIdentifier:nonce:OIDs:reply:", 0, 0);
    objc_msgSend(v16, "setInterface:forSelector:argumentIndex:ofReply:", v39, "createSEKey:extractedACLs:reply:", 0, 0);
    objc_msgSend(v16, "setInterface:forSelector:argumentIndex:ofReply:", v39, "deleteSEKey:keyData:reply:", 0, 0);
    objc_msgSend(v16, "setInterface:forSelector:argumentIndex:ofReply:", v39, "listEndPointContainers:reply:", 0, 0);
    objc_msgSend(v16, "setInterface:forSelector:argumentIndex:ofReply:", v39, "setPrivateDataWithProxy:identifier:privateData:privateDataOffset:reply:", 0, 0);
    objc_msgSend(v16, "setInterface:forSelector:argumentIndex:ofReply:", v39, "getPrivateDataWithProxy:identifier:privateDataOffset:privateDataLength:reply:", 0, 0);
    objc_msgSend(v16, "setInterface:forSelector:argumentIndex:ofReply:", v39, "convertEndpointWithProxy:keyIdentifier:notBeforeDate:reply:", 0, 0);
    objc_msgSend(v16, "setInterface:forSelector:argumentIndex:ofReply:", v39, "createFiDOKeyForRelyingParty:relyingPartyAccountHash:challenge:usingProxy:callback:", 3, 0);
    objc_msgSend(v16, "setInterface:forSelector:argumentIndex:ofReply:", v39, "deleteFiDOKeyFor:usingProxy:callback:", 1, 0);
    objc_msgSend(v16, "setInterface:forSelector:argumentIndex:ofReply:", v39, "checkMultipleFidoKeyPresence:usingProxy:callback:", 1, 0);
    objc_msgSend(v16, "setInterface:forSelector:argumentIndex:ofReply:", v39, "signMultipleWithFidoKeysFor:challenges:forEndpointIdentifiers:externalizedAuth:usingProxy:callback:", 4, 0);
    objc_msgSend(v16, "setInterface:forSelector:argumentIndex:ofReply:", v39, "verifyWithFidoKeyFor:signedChallenge:usingProxy:callback:", 2, 0);
    objc_msgSend(v16, "setInterface:forSelector:argumentIndex:ofReply:", v39, "getEndpointBindingAttestationRequestWithProxy:authorityIdentifier:reply:", 0, 0);
    objc_msgSend(v16, "setInterface:forSelector:argumentIndex:ofReply:", v39, "preAuthorizeEndpointWithProxy:keyIdentifier:bindingAttestation:reply:", 0, 0);
    objc_msgSend(v16, "setInterface:forSelector:argumentIndex:ofReply:", v39, "authorizeEndPointWithProxy:version:identifier:externalCA:instanceCA:endpointCertificate:encryptionKeyAttestation:bindingAttestation:bindingAttestationToken:confidentialDataOffset:confidentialDataLength:metaData:authorizationID:reply:", 0, 0);
    objc_msgSend(v16, "setInterface:forSelector:argumentIndex:ofReply:", v39, "signPrecomputedWithSELegacyKey:keySlot:metaData:authorization:authorizationType:reply:", 0, 0);
    -[__CFString setExportedInterface:](v5, "setExportedInterface:", v16);
    -[__CFString setExportedObject:](v5, "setExportedObject:", v43);
    -[__CFString resume](v5, "resume");

    v40 = v48;
  }
  else
  {
    v41 = SESDefaultLogObject(isKindOfClass, v8);
    v40 = objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v53 = CFSTR("application-identifier");
      v54 = 2112;
      v55 = v9;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "Missing or wrong type entitlement %@ : %@", buf, 0x16u);
    }
    v34 = 0;
  }

  return v34;
}

- (void)start
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = SESDefaultLogObject(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Starting seserviced XPC server ", v5, 2u);
  }

  -[SESServer resume](self, "resume");
}

- (void)onFirstUnlock
{
  NSObject *v3;
  NSObject *v4;
  _QWORD v5[5];
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[SESServer messageQueue](self, "messageQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100034E14;
  block[3] = &unk_100302AA0;
  block[4] = self;
  dispatch_sync(v3, block);

  v4 = objc_claimAutoreleasedReturnValue(+[DSK queue](_TtC10seserviced3DSK, "queue"));
  dispatch_async(v4, &stru_1003042C8);

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100035370;
  v5[3] = &unk_1003043C0;
  v5[4] = self;
  +[SESProximityChip cacheProximityChipData:](SESProximityChip, "cacheProximityChipData:", v5);
}

- (void)setSESServerDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_sesServerDelegate, a3);
}

- (OS_dispatch_queue)messageQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (SESDatabase)database
{
  return (SESDatabase *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_messageQueue, 0);
  objc_storeStrong((id *)&self->_sesServerDelegate, 0);
}

@end
