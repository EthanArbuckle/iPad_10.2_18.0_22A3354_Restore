@implementation CKKSDeviceStateEntry

- (id)initForDevice:(id)a3 contextID:(id)a4 osVersion:(id)a5 lastUnlockTime:(id)a6 octagonPeerID:(id)a7 octagonStatus:(id)a8 circlePeerID:(id)a9 circleStatus:(int)a10 keyState:(id)a11 currentTLKUUID:(id)a12 currentClassAUUID:(id)a13 currentClassCUUID:(id)a14 zoneID:(id)a15 encodedCKRecord:(id)a16
{
  id v21;
  id v22;
  id v23;
  CKKSDeviceStateEntry *v24;
  CKKSDeviceStateEntry *v25;
  id v28;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  objc_super v37;

  v36 = a3;
  v35 = a5;
  v34 = a6;
  v33 = a7;
  v28 = a8;
  v32 = a8;
  v31 = a9;
  v30 = a11;
  v21 = a12;
  v22 = a13;
  v23 = a14;
  v37.receiver = self;
  v37.super_class = (Class)CKKSDeviceStateEntry;
  v24 = -[CKKSCKRecordHolder initWithCKRecordType:encodedCKRecord:contextID:zoneID:](&v37, "initWithCKRecordType:encodedCKRecord:contextID:zoneID:", CFSTR("devicestate"), a16, a4, a15);
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_device, a3);
    objc_storeStrong((id *)&v25->_osVersion, a5);
    objc_storeStrong((id *)&v25->_lastUnlockTime, a6);
    objc_storeStrong((id *)&v25->_octagonPeerID, a7);
    objc_storeStrong((id *)&v25->_octagonStatus, v28);
    v25->_circleStatus = a10;
    objc_storeStrong((id *)&v25->_keyState, a11);
    objc_storeStrong((id *)&v25->_circlePeerID, a9);
    objc_storeStrong((id *)&v25->_currentTLKUUID, a12);
    objc_storeStrong((id *)&v25->_currentClassAUUID, a13);
    objc_storeStrong((id *)&v25->_currentClassCUUID, a14);
  }

  return v25;
}

- (id)sosCCStatusToCKType:(int)a3
{
  if (a3 == -1)
    *(_QWORD *)&a3 = 111;
  else
    *(_QWORD *)&a3 = a3;
  return (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(_QWORD *)&a3));
}

- (int)cktypeToSOSCCStatus:(id)a3
{
  id v3;
  uint64_t v4;
  unsigned int v5;
  int v6;
  id v7;
  NSObject *v8;
  _DWORD v10[2];

  v3 = a3;
  v4 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) == 0)
  {
LABEL_7:
    v6 = -1;
    goto LABEL_8;
  }
  v5 = objc_msgSend(v3, "unsignedIntValue");
  v6 = v5;
  if (v5 + 1 >= 5)
  {
    if (v5 != 111)
    {
      v7 = sub_10000BDF4(CFSTR("ckks"), 0);
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v10[0] = 67109120;
        v10[1] = v6;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%d is not an SOSCCStatus?", (uint8_t *)v10, 8u);
      }

    }
    goto LABEL_7;
  }
LABEL_8:

  return v6;
}

- (id)cliqueStatusToCKType:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "status") == (id)-1)
      v5 = 111;
    else
      v5 = (uint64_t)objc_msgSend(v4, "status");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v5));
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)cktypeToOTCliqueStatusWrapper:(id)a3
{
  id v3;
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  OTCliqueStatusWrapper *v7;
  uint64_t v8;
  OTCliqueStatusWrapper *v9;
  id v10;
  NSObject *v11;
  _DWORD v13[2];

  v3 = a3;
  if (v3 && (v4 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v3, v4) & 1) != 0))
  {
    v5 = objc_msgSend(v3, "unsignedIntValue");
    v6 = v5;
    switch(v5)
    {
      case 0u:
        v7 = [OTCliqueStatusWrapper alloc];
        v8 = 0;
        break;
      case 1u:
        v7 = [OTCliqueStatusWrapper alloc];
        v8 = 1;
        break;
      case 2u:
        v7 = [OTCliqueStatusWrapper alloc];
        v8 = 2;
        break;
      case 3u:
        v7 = [OTCliqueStatusWrapper alloc];
        v8 = 3;
        break;
      case 4u:
        v7 = [OTCliqueStatusWrapper alloc];
        v8 = 4;
        break;
      default:
        if (v5 != 111)
        {
          v10 = sub_10000BDF4(CFSTR("ckks"), 0);
          v11 = objc_claimAutoreleasedReturnValue(v10);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            v13[0] = 67109120;
            v13[1] = v6;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%d is not an OTCliqueStatus?", (uint8_t *)v13, 8u);
          }

        }
        v7 = [OTCliqueStatusWrapper alloc];
        v8 = -1;
        break;
    }
    v9 = -[OTCliqueStatusWrapper initWithStatus:](v7, "initWithStatus:", v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unsigned int v7;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __CFString *v27;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder storedCKRecord](self, "storedCKRecord"));
  v27 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "modificationDate"));

  v4 = objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder contextID](self, "contextID"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry device](self, "device"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry circlePeerID](self, "circlePeerID"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry octagonPeerID](self, "octagonPeerID"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry osVersion](self, "osVersion"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry lastUnlockTime](self, "lastUnlockTime"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder zoneID](self, "zoneID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "zoneName"));
  v7 = -[CKKSDeviceStateEntry circleStatus](self, "circleStatus") + 1;
  v21 = (void *)v4;
  if (v7 > 4)
    v8 = CFSTR("kSOSCCError");
  else
    v8 = off_1002EB7C0[v7];
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry octagonStatus](self, "octagonStatus"));
  if (v9)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry octagonStatus](self, "octagonStatus"));
    v10 = OTCliqueStatusToString(objc_msgSend(v20, "status"));
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue(v10);
  }
  else
  {
    v11 = CFSTR("CliqueMissing");
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry keyState](self, "keyState"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry currentTLKUUID](self, "currentTLKUUID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry currentClassAUUID](self, "currentClassAUUID"));
  v15 = objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry currentClassCUUID](self, "currentClassCUUID"));
  v16 = (void *)v15;
  v17 = CFSTR("unknown");
  if (v27)
    v17 = v27;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<CKKSDeviceStateEntry[%@](%@,%@,%@,%@,%@,%@): %@ %@ %@ %@ %@ %@ upd:%@>"), v21, v26, v25, v24, v23, v22, v6, v8, v11, v12, v13, v14, v15, v17));

  if (v9)
  {

  }
  return v18;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  _BOOL4 v18;
  int v19;
  BOOL v20;
  BOOL v21;
  int v22;
  int v23;
  id v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  _BOOL4 v30;
  _BOOL4 v31;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  unsigned int v44;
  void *v45;
  uint64_t v46;
  void *v47;
  int v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  unsigned int v53;
  uint64_t v54;
  int v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  id v98;
  _BOOL4 v99;
  void *v100;
  _BYTE v101[36];
  _QWORD v102[4];
  __int128 v103;
  uint64_t v104;
  unsigned int v105;
  id v106;
  id v107;

  v4 = a3;
  v5 = objc_opt_class(CKKSDeviceStateEntry);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder zoneID](self, "zoneID"));
    v106 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "zoneID"));
    v107 = v7;
    v105 = objc_msgSend(v7, "isEqual:", v106);
    if (!v105)
    {
      v13 = 0;
      v104 = 0;
      memset(v101, 0, sizeof(v101));
      v103 = 0uLL;
      v11 = 0;
      memset(v102, 0, sizeof(v102));
      v12 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v19 = 0;
      v20 = 0;
      goto LABEL_9;
    }
    v100 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry device](self, "device"));
    HIDWORD(v104) = v100 == 0;
    if (v100 || (v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "device"))) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry device](self, "device"));
      v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "device"));
      v97 = v9;
      v10 = 1;
      if (!objc_msgSend(v9, "isEqual:"))
      {
        LODWORD(v104) = 1;
        memset(v101, 0, sizeof(v101));
        v103 = 0uLL;
        v11 = 0;
        memset(v102, 0, sizeof(v102));
        v12 = 0;
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v17 = 0;
        v18 = 0;
        v19 = 0;
        v20 = 0;
        goto LABEL_9;
      }
    }
    else
    {
      v94 = 0;
      v10 = 0;
    }
    v33 = objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder contextID](self, "contextID"));
    HIDWORD(v103) = v33 == 0;
    LODWORD(v104) = v10;
    v95 = (void *)v33;
    if (v33 || (v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contextID"))) != 0)
    {
      v93 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder contextID](self, "contextID"));
      v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contextID"));
      if (!objc_msgSend(v93, "isEqual:"))
      {
        *(_OWORD *)&v101[12] = 1uLL;
        *(_QWORD *)&v101[4] = 0;
        *(_QWORD *)((char *)&v103 + 4) = 0;
        v11 = 0;
        memset(v102, 0, sizeof(v102));
        *(_DWORD *)v101 = 0;
        v12 = 0;
        v13 = 0;
        *(_QWORD *)&v101[28] = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v17 = 0;
        v18 = 0;
        v19 = 0;
        v20 = 0;
        LODWORD(v103) = 1;
        goto LABEL_9;
      }
      LODWORD(v103) = 1;
    }
    else
    {
      v90 = 0;
      LODWORD(v103) = 0;
    }
    v34 = objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry osVersion](self, "osVersion"));
    DWORD2(v103) = v34 == 0;
    v91 = (void *)v34;
    if (v34 || (v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "osVersion"))) != 0)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry osVersion](self, "osVersion"));
      v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "osVersion"));
      v89 = v35;
      if (!objc_msgSend(v35, "isEqual:"))
      {
        *(_QWORD *)&v101[12] = 1;
        *(_QWORD *)v101 = 0;
        v11 = 0;
        memset(v102, 0, sizeof(v102));
        v12 = 0;
        v13 = 0;
        *(_QWORD *)&v101[28] = 0;
        *(_QWORD *)&v101[20] = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v17 = 0;
        v18 = 0;
        v19 = 0;
        v20 = 0;
        *(_DWORD *)&v101[8] = 1;
        DWORD1(v103) = 1;
        goto LABEL_9;
      }
      DWORD1(v103) = 1;
    }
    else
    {
      v86 = 0;
      DWORD1(v103) = 0;
    }
    v36 = objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry lastUnlockTime](self, "lastUnlockTime"));
    HIDWORD(v102[3]) = v36 == 0;
    v87 = (void *)v36;
    if (v36 || (v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastUnlockTime"))) != 0)
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry lastUnlockTime](self, "lastUnlockTime"));
      v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastUnlockTime"));
      v85 = v37;
      if (!objc_msgSend(v37, "isEqual:"))
      {
        *(_QWORD *)&v101[12] = 1;
        v11 = 0;
        memset(v102, 0, 20);
        v12 = 0;
        v13 = 0;
        *(_QWORD *)&v101[28] = 0;
        *(_QWORD *)&v101[20] = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v17 = 0;
        v18 = 0;
        v19 = 0;
        v20 = 0;
        *(_DWORD *)&v101[8] = 1;
        *(_QWORD *)v101 = 0x100000000;
        *(_QWORD *)((char *)&v102[2] + 4) = 1;
        goto LABEL_9;
      }
      HIDWORD(v102[2]) = 1;
    }
    else
    {
      v82 = 0;
      HIDWORD(v102[2]) = 0;
    }
    v38 = objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry octagonPeerID](self, "octagonPeerID"));
    LODWORD(v102[3]) = v38 == 0;
    v83 = (void *)v38;
    if (v38 || (v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "octagonPeerID"))) != 0)
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry octagonPeerID](self, "octagonPeerID"));
      v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "octagonPeerID"));
      v81 = v39;
      if (!objc_msgSend(v39, "isEqual:"))
      {
        *(_QWORD *)&v101[12] = 1;
        *(_QWORD *)((char *)v102 + 4) = 0;
        *(_QWORD *)((char *)&v102[1] + 4) = 0;
        v12 = 0;
        v13 = 0;
        *(_QWORD *)&v101[28] = 0;
        *(_QWORD *)&v101[20] = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v17 = 0;
        v18 = 0;
        v19 = 0;
        v20 = 0;
        *(_DWORD *)&v101[8] = 1;
        *(_DWORD *)v101 = 0;
        *(_DWORD *)&v101[4] = 1;
        v11 = 1;
        LODWORD(v102[0]) = 1;
        goto LABEL_9;
      }
      LODWORD(v102[0]) = 1;
    }
    else
    {
      v78 = 0;
      LODWORD(v102[0]) = 0;
    }
    v40 = objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry octagonStatus](self, "octagonStatus"));
    LODWORD(v102[2]) = v40 == 0;
    v79 = (void *)v40;
    if (v40 || (v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "octagonStatus"))) != 0)
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry octagonStatus](self, "octagonStatus"));
      v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "octagonStatus"));
      v77 = v41;
      if (!objc_msgSend(v41, "isEqual:"))
      {
        *(_QWORD *)&v101[12] = 1;
        v12 = 0;
        HIDWORD(v102[0]) = 0;
        v13 = 0;
        *(_QWORD *)&v101[28] = 0;
        *(_QWORD *)&v101[20] = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v17 = 0;
        v18 = 0;
        v19 = 0;
        v20 = 0;
        *(_DWORD *)&v101[4] = 1;
        *(_DWORD *)&v101[8] = 1;
        v11 = 1;
        *(_DWORD *)v101 = 1;
        v102[1] = 1;
        goto LABEL_9;
      }
      LODWORD(v102[1]) = 1;
    }
    else
    {
      v74 = 0;
      LODWORD(v102[1]) = 0;
    }
    v42 = objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry circlePeerID](self, "circlePeerID"));
    HIDWORD(v102[1]) = v42 == 0;
    v75 = (void *)v42;
    if (v42 || (v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "circlePeerID"))) != 0)
    {
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry circlePeerID](self, "circlePeerID"));
      v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "circlePeerID"));
      v73 = v43;
      if (!objc_msgSend(v43, "isEqual:"))
      {
        *(_QWORD *)&v101[12] = 1;
        v13 = 0;
        *(_QWORD *)&v101[28] = 0;
        *(_QWORD *)&v101[20] = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v17 = 0;
        v18 = 0;
        v19 = 0;
        v20 = 0;
        *(_DWORD *)&v101[4] = 1;
        *(_DWORD *)&v101[8] = 1;
        v11 = 1;
        *(_DWORD *)v101 = 1;
        v12 = 1;
        HIDWORD(v102[0]) = 1;
        goto LABEL_9;
      }
      HIDWORD(v102[0]) = 1;
    }
    else
    {
      v71 = 0;
      HIDWORD(v102[0]) = 0;
    }
    v44 = -[CKKSDeviceStateEntry circleStatus](self, "circleStatus");
    if (v44 != objc_msgSend(v6, "circleStatus"))
    {
      v13 = 0;
      *(_QWORD *)&v101[28] = 0;
      *(_QWORD *)&v101[20] = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v19 = 0;
      v20 = 0;
      *(_QWORD *)&v101[12] = 1;
      *(_DWORD *)&v101[4] = 1;
      *(_DWORD *)&v101[8] = 1;
      v11 = 1;
      *(_DWORD *)v101 = 1;
      v12 = 1;
      goto LABEL_9;
    }
    v70 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry keyState](self, "keyState"));
    *(_DWORD *)&v101[32] = v70 == 0;
    if (v70 || (v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "keyState"))) != 0)
    {
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry keyState](self, "keyState"));
      v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "keyState"));
      v69 = v45;
      if (!objc_msgSend(v45, "isEqual:"))
      {
        *(_DWORD *)&v101[12] = 1;
        v14 = 0;
        *(_QWORD *)&v101[16] = 0;
        v15 = 0;
        v16 = 0;
        v17 = 0;
        v18 = 0;
        v19 = 0;
        v20 = 0;
        *(_DWORD *)&v101[4] = 1;
        *(_DWORD *)&v101[8] = 1;
        v11 = 1;
        *(_DWORD *)v101 = 1;
        v12 = 1;
        v13 = 1;
        *(_QWORD *)&v101[24] = 1;
        goto LABEL_9;
      }
      *(_DWORD *)&v101[24] = 1;
    }
    else
    {
      v66 = 0;
      *(_DWORD *)&v101[24] = 0;
    }
    v46 = objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry currentTLKUUID](self, "currentTLKUUID"));
    *(_DWORD *)&v101[28] = v46 == 0;
    v67 = (void *)v46;
    if (v46 || (v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentTLKUUID"))) != 0)
    {
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry currentTLKUUID](self, "currentTLKUUID"));
      v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentTLKUUID"));
      v65 = v47;
      if (!objc_msgSend(v47, "isEqual:"))
      {
        v8 = 1;
        v15 = 0;
        v16 = 0;
        v17 = 0;
        v18 = 0;
        v19 = 0;
        v20 = 0;
        *(_DWORD *)&v101[8] = 1;
        *(_DWORD *)&v101[12] = 1;
        *(_DWORD *)v101 = 1;
        *(_DWORD *)&v101[4] = 1;
        v11 = 1;
        v12 = 1;
        v13 = 1;
        v14 = 1;
        *(_QWORD *)&v101[16] = 1;
        goto LABEL_9;
      }
      v48 = 1;
    }
    else
    {
      v62 = 0;
      v48 = 0;
    }
    v49 = objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry currentClassAUUID](self, "currentClassAUUID"));
    *(_DWORD *)&v101[20] = v49 == 0;
    v63 = (void *)v49;
    *(_DWORD *)&v101[16] = v48;
    if (v49 || (v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentClassAUUID"))) != 0)
    {
      v50 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry currentClassAUUID](self, "currentClassAUUID"));
      v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentClassAUUID"));
      v61 = v50;
      if (!objc_msgSend(v50, "isEqual:"))
      {
        *(_DWORD *)&v101[12] = 1;
        v17 = 0;
        v18 = 0;
        v19 = 0;
        v20 = 0;
        *(_DWORD *)&v101[4] = 1;
        *(_DWORD *)&v101[8] = 1;
        v11 = 1;
        *(_DWORD *)v101 = 1;
        v12 = 1;
        v13 = 1;
        v14 = 1;
        v15 = 1;
        v16 = 1;
        goto LABEL_9;
      }
      v55 = 1;
    }
    else
    {
      v58 = 0;
      v55 = 0;
    }
    v51 = objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry currentClassCUUID](self, "currentClassCUUID"));
    v99 = v51 == 0;
    v59 = (void *)v51;
    if (v51 || (v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentClassCUUID"))) != 0)
    {
      v52 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry currentClassCUUID](self, "currentClassCUUID"));
      v54 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentClassCUUID"));
      v53 = objc_msgSend(v52, "isEqual:");
      v19 = 1;
      v57 = v52;
      if (!v53)
      {
        *(_DWORD *)&v101[8] = 1;
        *(_DWORD *)&v101[12] = 1;
        v20 = 0;
        *(_QWORD *)v101 = 0x100000001;
        v11 = 1;
        v12 = 1;
        v13 = 1;
        v14 = 1;
        v15 = 1;
        v17 = 1;
LABEL_142:
        v18 = v99;
        v16 = v55;
        v8 = v54;
LABEL_9:
        if (v19)
        {
          v98 = v4;
          v21 = v20;
          v22 = v12;
          v23 = v15;
          v24 = v6;
          v25 = v14;
          v26 = v17;
          v27 = v13;
          v28 = v11;
          v29 = v16;
          v30 = v18;

          v31 = v30;
          v16 = v29;
          v11 = v28;
          v13 = v27;
          v17 = v26;
          v14 = v25;
          v6 = v24;
          v15 = v23;
          v12 = v22;
          v20 = v21;
          v4 = v98;
          if (!v31)
            goto LABEL_11;
        }
        else if (!v18)
        {
LABEL_11:
          if (v17)
            goto LABEL_12;
          goto LABEL_16;
        }

        if (v17)
        {
LABEL_12:

          if (!v16)
          {
LABEL_18:
            if (*(_DWORD *)&v101[20])

            if (v15)
            if (*(_DWORD *)&v101[16])
            {

            }
            if (*(_DWORD *)&v101[28])

            if (v14)
            if (*(_DWORD *)&v101[24])
            {

            }
            if (*(_DWORD *)&v101[32])

            if (v13)
            if (HIDWORD(v102[0]))
            {

            }
            if (HIDWORD(v102[1]))

            if (v12)
            if (LODWORD(v102[1]))
            {

            }
            if (LODWORD(v102[2]))

            if (*(_DWORD *)v101)
            if (LODWORD(v102[0]))
            {

            }
            if (LODWORD(v102[3]))

            if (v11)
            if (HIDWORD(v102[2]))
            {

            }
            if (HIDWORD(v102[3]))

            if (*(_DWORD *)&v101[4])
            if (DWORD1(v103))
            {

            }
            if (DWORD2(v103))

            if (*(_DWORD *)&v101[8])
            if ((_DWORD)v103)
            {

            }
            if (HIDWORD(v103))

            if (*(_DWORD *)&v101[12])
            {

              if (!(_DWORD)v104)
                goto LABEL_70;
            }
            else if (!(_DWORD)v104)
            {
LABEL_70:
              if (HIDWORD(v104))
                goto LABEL_71;
              goto LABEL_75;
            }

            if (HIDWORD(v104))
            {
LABEL_71:

              if (!v105)
                goto LABEL_77;
              goto LABEL_76;
            }
LABEL_75:
            if (!v105)
            {
LABEL_77:

              goto LABEL_78;
            }
LABEL_76:

            goto LABEL_77;
          }
LABEL_17:

          goto LABEL_18;
        }
LABEL_16:
        if (!v16)
          goto LABEL_18;
        goto LABEL_17;
      }
    }
    else
    {
      v56 = 0;
      v19 = 0;
    }
    *(_DWORD *)&v101[8] = 1;
    *(_DWORD *)&v101[12] = 1;
    *(_DWORD *)v101 = 1;
    *(_DWORD *)&v101[4] = 1;
    v11 = 1;
    v12 = 1;
    v13 = 1;
    v14 = 1;
    v15 = 1;
    v17 = 1;
    v20 = 1;
    goto LABEL_142;
  }
  v20 = 0;
LABEL_78:

  return v20;
}

- (id)CKRecordName
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry device](self, "device"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ckid-%@"), v2));

  return v3;
}

- (id)updateCKRecord:(id)a3 zoneID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  id v45;
  id v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recordID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "recordName"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry CKRecordName](self, "CKRecordName"));
  v11 = objc_msgSend(v9, "isEqualToString:", v10);

  if ((v11 & 1) == 0)
  {
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recordID"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "recordName"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry CKRecordName](self, "CKRecordName"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CKRecord name (%@) was not %@"), v53, v54));
    v56 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("WrongCKRecordNameException"), v55, 0));

    goto LABEL_21;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recordType"));
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("devicestate"));

  if ((v13 & 1) == 0)
  {
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recordType"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CKRecordType (%@) was not %@"), v52, CFSTR("devicestate")));
    v56 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("WrongCKRecordTypeException"), v57, 0));

LABEL_21:
    objc_exception_throw(v56);
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry osVersion](self, "osVersion"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, CFSTR("osver"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry lastUnlockTime](self, "lastUnlockTime"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, CFSTR("lastunlock"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry octagonPeerID](self, "octagonPeerID"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, CFSTR("octagonpeerid"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry octagonStatus](self, "octagonStatus"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry cliqueStatusToCKType:](self, "cliqueStatusToCKType:", v17));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v18, CFSTR("octagonstatus"));

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry sosCCStatusToCKType:](self, "sosCCStatusToCKType:", -[CKKSDeviceStateEntry circleStatus](self, "circleStatus")));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v19, CFSTR("circle"));

  v20 = (id)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry keyState](self, "keyState"));
  v21 = sub_1000B32E0();
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v23 = v22;
  if (!v20)
  {
    v25 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("error")));
    goto LABEL_7;
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", v20));

  if (v24)
  {
    v25 = v24;
    v23 = v25;
LABEL_7:
    v26 = v25;
    goto LABEL_9;
  }
  v27 = sub_1000B32E0();
  v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("error")));

  v23 = 0;
LABEL_9:

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v26, CFSTR("keystate"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry circlePeerID](self, "circlePeerID"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v29, CFSTR("peerid"));

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry currentTLKUUID](self, "currentTLKUUID"));
  if (v30)
  {
    v31 = objc_alloc((Class)CKReference);
    v32 = objc_alloc((Class)CKRecordID);
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry currentTLKUUID](self, "currentTLKUUID"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder zoneID](self, "zoneID"));
    v35 = objc_msgSend(v32, "initWithRecordName:zoneID:", v33, v34);
    v36 = objc_msgSend(v31, "initWithRecordID:action:", v35, 0);
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v36, CFSTR("currentTLK"));

  }
  else
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", 0, CFSTR("currentTLK"));
  }

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry currentClassAUUID](self, "currentClassAUUID"));
  if (v37)
  {
    v38 = objc_alloc((Class)CKReference);
    v39 = objc_alloc((Class)CKRecordID);
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry currentClassAUUID](self, "currentClassAUUID"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder zoneID](self, "zoneID"));
    v42 = objc_msgSend(v39, "initWithRecordName:zoneID:", v40, v41);
    v43 = objc_msgSend(v38, "initWithRecordID:action:", v42, 0);
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v43, CFSTR("currentClassA"));

  }
  else
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", 0, CFSTR("currentClassA"));
  }

  v44 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry currentClassCUUID](self, "currentClassCUUID"));
  if (v44)
  {
    v45 = objc_alloc((Class)CKReference);
    v46 = objc_alloc((Class)CKRecordID);
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry currentClassCUUID](self, "currentClassCUUID"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder zoneID](self, "zoneID"));
    v49 = objc_msgSend(v46, "initWithRecordName:zoneID:", v47, v48);
    v50 = objc_msgSend(v45, "initWithRecordID:action:", v49, 0);
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v50, CFSTR("currentClassC"));

  }
  else
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", 0, CFSTR("currentClassC"));
  }

  return v6;
}

- (BOOL)matchesCKRecord:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  unsigned __int8 v31;
  void *v32;
  unsigned int v33;
  unsigned int v34;
  void *v35;
  __CFString *v36;
  void *v37;
  void *v38;
  unsigned int v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  unsigned int v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  unsigned int v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  unsigned __int8 v54;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recordType"));
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("devicestate"));

  if (!v6)
    goto LABEL_38;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recordID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "recordName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry CKRecordName](self, "CKRecordName"));
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if (!v10)
    goto LABEL_38;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry lastUnlockTime](self, "lastUnlockTime"));
  if (v11
    || (v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lastunlock")))) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lastunlock")));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry lastUnlockTime](self, "lastUnlockTime"));
    v14 = objc_msgSend(v12, "isEqual:", v13);

    if (v11)
    {

      if (!v14)
        goto LABEL_38;
    }
    else
    {

      if ((v14 & 1) == 0)
        goto LABEL_38;
    }
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry osVersion](self, "osVersion"));
  if (v15
    || (v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("osver")))) != 0)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("osver")));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry osVersion](self, "osVersion"));
    v18 = objc_msgSend(v16, "isEqualToString:", v17);

    if (v15)
    {

      if (!v18)
        goto LABEL_38;
    }
    else
    {

      if ((v18 & 1) == 0)
        goto LABEL_38;
    }
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry circlePeerID](self, "circlePeerID"));
  if (v19
    || (v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("peerid")))) != 0)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("peerid")));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry circlePeerID](self, "circlePeerID"));
    v22 = objc_msgSend(v20, "isEqualToString:", v21);

    if (v19)
    {

      if (!v22)
        goto LABEL_38;
    }
    else
    {

      if ((v22 & 1) == 0)
        goto LABEL_38;
    }
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry octagonPeerID](self, "octagonPeerID"));
  if (v23
    || (v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("octagonpeerid")))) != 0)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("octagonpeerid")));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry octagonPeerID](self, "octagonPeerID"));
    v26 = objc_msgSend(v24, "isEqualToString:", v25);

    if (v23)
    {

      if (!v26)
        goto LABEL_38;
    }
    else
    {

      if ((v26 & 1) == 0)
        goto LABEL_38;
    }
  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry octagonStatus](self, "octagonStatus"));
  if (!v27)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("octagonstatus")));
    if (!v8)
      goto LABEL_33;
  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry octagonStatus](self, "octagonStatus"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("octagonstatus")));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry cktypeToOTCliqueStatusWrapper:](self, "cktypeToOTCliqueStatusWrapper:", v29));
  v31 = objc_msgSend(v28, "isEqual:", v30);

  if (!v27)
  {

    if ((v31 & 1) == 0)
      goto LABEL_33;
LABEL_38:
    v54 = 0;
    goto LABEL_39;
  }

  if ((v31 & 1) != 0)
    goto LABEL_38;
LABEL_33:
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("circle")));
  v33 = -[CKKSDeviceStateEntry cktypeToSOSCCStatus:](self, "cktypeToSOSCCStatus:", v32);
  v34 = -[CKKSDeviceStateEntry circleStatus](self, "circleStatus");

  if (v33 != v34)
    goto LABEL_38;
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("keystate")));
  v36 = sub_1000B36D0(v35);
  v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry keyState](self, "keyState"));
  v39 = objc_msgSend(v37, "isEqualToString:", v38);

  if (!v39)
    goto LABEL_38;
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("currentTLK")));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "recordID"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "recordName"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry currentTLKUUID](self, "currentTLKUUID"));
  v44 = objc_msgSend(v42, "isEqualToString:", v43);

  if (!v44)
    goto LABEL_38;
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("currentClassA")));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "recordID"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "recordName"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry currentTLKUUID](self, "currentTLKUUID"));
  v49 = objc_msgSend(v47, "isEqualToString:", v48);

  if (!v49)
    goto LABEL_38;
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("currentClassC")));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "recordID"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "recordName"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry currentTLKUUID](self, "currentTLKUUID"));
  v54 = objc_msgSend(v52, "isEqualToString:", v53);

LABEL_39:
  return v54;
}

- (void)setFromCKRecord:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;

  v30 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "recordType"));
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("devicestate"));

  if ((v5 & 1) == 0)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "recordType"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CKRecordType (%@) was not %@"), v27, CFSTR("devicestate")));
    v29 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("WrongCKRecordTypeException"), v28, 0));

    objc_exception_throw(v29);
  }
  -[CKKSCKRecordHolder setStoredCKRecord:](self, "setStoredCKRecord:", v30);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("osver")));
  -[CKKSDeviceStateEntry setOsVersion:](self, "setOsVersion:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("lastunlock")));
  -[CKKSDeviceStateEntry setLastUnlockTime:](self, "setLastUnlockTime:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "recordID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSDeviceStateEntry nameFromCKRecordID:](CKKSDeviceStateEntry, "nameFromCKRecordID:", v8));
  -[CKKSDeviceStateEntry setDevice:](self, "setDevice:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("octagonpeerid")));
  -[CKKSDeviceStateEntry setOctagonPeerID:](self, "setOctagonPeerID:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("octagonstatus")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry cktypeToOTCliqueStatusWrapper:](self, "cktypeToOTCliqueStatusWrapper:", v11));
  -[CKKSDeviceStateEntry setOctagonStatus:](self, "setOctagonStatus:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("peerid")));
  -[CKKSDeviceStateEntry setCirclePeerID:](self, "setCirclePeerID:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("circle")));
  -[CKKSDeviceStateEntry setCircleStatus:](self, "setCircleStatus:", -[CKKSDeviceStateEntry cktypeToSOSCCStatus:](self, "cktypeToSOSCCStatus:", v14));

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("keystate")));
  v16 = sub_1000B36D0(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  -[CKKSDeviceStateEntry setKeyState:](self, "setKeyState:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("currentTLK")));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "recordID"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "recordName"));
  -[CKKSDeviceStateEntry setCurrentTLKUUID:](self, "setCurrentTLKUUID:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("currentClassA")));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "recordID"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "recordName"));
  -[CKKSDeviceStateEntry setCurrentClassAUUID:](self, "setCurrentClassAUUID:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("currentClassC")));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "recordID"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "recordName"));
  -[CKKSDeviceStateEntry setCurrentClassCUUID:](self, "setCurrentClassCUUID:", v26);

}

- (id)whereClauseToFindSelf
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];
  _QWORD v10[3];

  v9[0] = CFSTR("contextID");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder contextID](self, "contextID"));
  v10[0] = v3;
  v9[1] = CFSTR("device");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry device](self, "device"));
  v10[1] = v4;
  v9[2] = CFSTR("ckzone");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder zoneID](self, "zoneID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "zoneName"));
  v10[2] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 3));

  return v7;
}

- (id)sqlValues
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  unsigned int v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  _QWORD v58[14];
  _QWORD v59[14];

  v3 = objc_alloc_init((Class)NSISO8601DateFormatter);
  v58[0] = CFSTR("contextID");
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder contextID](self, "contextID"));
  v59[0] = v56;
  v58[1] = CFSTR("device");
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry device](self, "device"));
  v59[1] = v55;
  v58[2] = CFSTR("ckzone");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder zoneID](self, "zoneID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "zoneName"));

  if (v5)
    v6 = v5;
  else
    v6 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v7 = v6;

  v59[2] = v7;
  v58[3] = CFSTR("osversion");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry osVersion](self, "osVersion"));
  v9 = v8;
  if (v8)
    v10 = v8;
  else
    v10 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v11 = v10;

  v59[3] = v11;
  v58[4] = CFSTR("lastunlock");
  v12 = objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry lastUnlockTime](self, "lastUnlockTime"));
  if (!v12
    || (v13 = (void *)v12,
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry lastUnlockTime](self, "lastUnlockTime")),
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringFromDate:", v14)),
        v14,
        v13,
        !v15))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  }
  v59[4] = v15;
  v58[5] = CFSTR("peerid");
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry circlePeerID](self, "circlePeerID"));
  v17 = v16;
  if (v16)
    v18 = v16;
  else
    v18 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v19 = v18;

  v59[5] = v19;
  v58[6] = CFSTR("circlestatus");
  v20 = -[CKKSDeviceStateEntry circleStatus](self, "circleStatus") + 1;
  if (v20 > 4)
    v21 = CFSTR("kSOSCCError");
  else
    v21 = off_1002EB7C0[v20];
  v59[6] = v21;
  v58[7] = CFSTR("octagonpeerid");
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry octagonPeerID](self, "octagonPeerID"));
  v23 = v22;
  v53 = v19;
  if (v22)
    v24 = v22;
  else
    v24 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v25 = v24;

  v59[7] = v25;
  v58[8] = CFSTR("octagonstatus");
  v26 = objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry octagonStatus](self, "octagonStatus"));
  if (!v26
    || (v27 = (void *)v26,
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry octagonStatus](self, "octagonStatus")),
        v29 = OTCliqueStatusToString(objc_msgSend(v28, "status")),
        v30 = (void *)objc_claimAutoreleasedReturnValue(v29),
        v28,
        v27,
        !v30))
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  }
  v59[8] = v30;
  v58[9] = CFSTR("keystate");
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry keyState](self, "keyState"));
  v32 = v31;
  v57 = v3;
  if (v31)
    v33 = v31;
  else
    v33 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v34 = v33;

  v59[9] = v34;
  v58[10] = CFSTR("currentTLK");
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry currentTLKUUID](self, "currentTLKUUID"));
  v36 = v35;
  v54 = v7;
  if (v35)
    v37 = v35;
  else
    v37 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v38 = v37;

  v59[10] = v38;
  v58[11] = CFSTR("currentClassA");
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry currentClassAUUID](self, "currentClassAUUID"));
  v40 = v39;
  if (v39)
    v41 = v39;
  else
    v41 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v42 = v41;

  v59[11] = v42;
  v58[12] = CFSTR("currentClassC");
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry currentClassCUUID](self, "currentClassCUUID"));
  v44 = v43;
  if (v43)
    v45 = v43;
  else
    v45 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v46 = v45;

  v59[12] = v46;
  v58[13] = CFSTR("ckrecord");
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder encodedCKRecord](self, "encodedCKRecord"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "base64EncodedStringWithOptions:", 0));

  if (v48)
    v49 = v48;
  else
    v49 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v50 = v49;

  v59[13] = v50;
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v59, v58, 14));

  return v51;
}

- (NSString)device
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setDevice:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSString)osVersion
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setOsVersion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSDate)lastUnlockTime
{
  return (NSDate *)objc_getProperty(self, a2, 80, 1);
}

- (void)setLastUnlockTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSString)circlePeerID
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setCirclePeerID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSString)octagonPeerID
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setOctagonPeerID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (int)circleStatus
{
  return self->_circleStatus;
}

- (void)setCircleStatus:(int)a3
{
  self->_circleStatus = a3;
}

- (OTCliqueStatusWrapper)octagonStatus
{
  return (OTCliqueStatusWrapper *)objc_getProperty(self, a2, 104, 1);
}

- (void)setOctagonStatus:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (OctagonStateString)keyState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setKeyState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSString)currentTLKUUID
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setCurrentTLKUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSString)currentClassAUUID
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setCurrentClassAUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (NSString)currentClassCUUID
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setCurrentClassCUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentClassCUUID, 0);
  objc_storeStrong((id *)&self->_currentClassAUUID, 0);
  objc_storeStrong((id *)&self->_currentTLKUUID, 0);
  objc_storeStrong((id *)&self->_keyState, 0);
  objc_storeStrong((id *)&self->_octagonStatus, 0);
  objc_storeStrong((id *)&self->_octagonPeerID, 0);
  objc_storeStrong((id *)&self->_circlePeerID, 0);
  objc_storeStrong((id *)&self->_lastUnlockTime, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

+ (id)nameFromCKRecordID:(id)a3
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "recordName"));
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("ckid-")))
  {
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringFromIndex:", objc_msgSend(CFSTR("ckid-"), "length")));

    v3 = (void *)v4;
  }
  return v3;
}

+ (id)fromDatabase:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v28[3];
  _QWORD v29[3];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v28[0] = CFSTR("device");
  v13 = v10;
  v14 = v13;
  if (v13)
    v15 = v13;
  else
    v15 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v16 = v15;

  v29[0] = v16;
  v28[1] = CFSTR("contextID");
  v17 = v11;
  v18 = v17;
  if (v17)
    v19 = v17;
  else
    v19 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v20 = v19;

  v29[1] = v20;
  v28[2] = CFSTR("ckzone");
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "zoneName"));
  v22 = v21;
  if (v21)
    v23 = v21;
  else
    v23 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v24 = v23;

  v29[2] = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v29, v28, 3));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "fromDatabaseWhere:error:", v25, a6));

  return v26;
}

+ (id)tryFromDatabase:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v28[3];
  _QWORD v29[3];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v28[0] = CFSTR("device");
  v13 = v10;
  v14 = v13;
  if (v13)
    v15 = v13;
  else
    v15 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v16 = v15;

  v29[0] = v16;
  v28[1] = CFSTR("contextID");
  v17 = v11;
  v18 = v17;
  if (v17)
    v19 = v17;
  else
    v19 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v20 = v19;

  v29[1] = v20;
  v28[2] = CFSTR("ckzone");
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "zoneName"));
  v22 = v21;
  if (v21)
    v23 = v21;
  else
    v23 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v24 = v23;

  v29[2] = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v29, v28, 3));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "tryFromDatabaseWhere:error:", v25, a6));

  return v26;
}

+ (id)tryFromDatabaseFromCKRecordID:(id)a3 contextID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[3];
  _QWORD v26[3];

  v8 = a4;
  v25[0] = CFSTR("device");
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "nameFromCKRecordID:", v9));
  v11 = v10;
  if (v10)
    v12 = v10;
  else
    v12 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v13 = v12;

  v26[0] = v13;
  v25[1] = CFSTR("contextID");
  v14 = v8;
  v15 = v14;
  if (v14)
    v16 = v14;
  else
    v16 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v17 = v16;

  v26[1] = v17;
  v25[2] = CFSTR("ckzone");
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneID"));

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "zoneName"));
  if (v19)
    v20 = v19;
  else
    v20 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v21 = v20;

  v26[2] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v26, v25, 3));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "tryFromDatabaseWhere:error:", v22, a5));

  return v23;
}

+ (id)allInZone:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v13;
  void *v14;

  v13 = CFSTR("ckzone");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "zoneName"));
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v9 = v8;

  v14 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "allWhere:error:", v10, a4));

  return v11;
}

+ (id)sqlTable
{
  return CFSTR("ckdevicestate");
}

+ (id)sqlColumns
{
  return &off_10030B7B0;
}

+ (id)fromDatabaseRow:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  OTCliqueStatusWrapper *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const void *v15;
  int v16;
  CKKSDeviceStateEntry *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  int v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  id v34;
  void *v35;
  CKKSDeviceStateEntry *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  OTCliqueStatusWrapper *v52;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("octagonstatus")));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "asString"));

  if (v5)
    v6 = -[OTCliqueStatusWrapper initWithStatus:]([OTCliqueStatusWrapper alloc], "initWithStatus:", OTCliqueStatusFromString(v5));
  else
    v6 = 0;
  v36 = [CKKSDeviceStateEntry alloc];
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("device")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "asString"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("contextID")));
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "asString"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("osversion")));
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "asString"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("lastunlock")));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "asISO8601Date"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("octagonpeerid")));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "asString"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("peerid")));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "asString"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("circlestatus")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "asString"));
  v48 = v7;
  v49 = (void *)v5;
  v51 = (void *)v10;
  v52 = v6;
  v46 = v11;
  v47 = v9;
  v50 = (void *)v12;
  v45 = v13;
  v38 = v14;
  if (!v14)
  {
    v16 = -1;
LABEL_9:
    v33 = v16;
    goto LABEL_10;
  }
  v15 = v14;
  if (CFEqual(v14, CFSTR("kSOSCCInCircle")) || CFEqual(v15, CFSTR("kSOSCCInCircle")))
  {
    v33 = 0;
LABEL_10:
    v17 = v36;
    goto LABEL_11;
  }
  if (CFEqual(v15, CFSTR("kSOSCCNotInCircle")))
  {
    v16 = 1;
    goto LABEL_9;
  }
  if (CFEqual(v15, CFSTR("kSOSCCRequestPending")))
  {
    v16 = 2;
    goto LABEL_9;
  }
  v17 = v36;
  if (CFEqual(v15, CFSTR("kSOSCCCircleAbsent")))
  {
    v27 = 3;
  }
  else
  {
    CFEqual(v15, CFSTR("kSOSCCError"));
    v27 = -1;
  }
  v33 = v27;
LABEL_11:
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("keystate")));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "asString"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("currentTLK")));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "asString"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("currentClassA")));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "asString"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("currentClassC")));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "asString"));
  v20 = objc_alloc((Class)CKRecordZoneID);
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ckzone")));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "asString"));
  v23 = objc_msgSend(v20, "initWithZoneName:ownerName:", v22, CKCurrentUserDefaultName);
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ckrecord")));

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "asBase64DecodedData"));
  LODWORD(v28) = v33;
  v34 = -[CKKSDeviceStateEntry initForDevice:contextID:osVersion:lastUnlockTime:octagonPeerID:octagonStatus:circlePeerID:circleStatus:keyState:currentTLKUUID:currentClassAUUID:currentClassCUUID:zoneID:encodedCKRecord:](v17, "initForDevice:contextID:osVersion:lastUnlockTime:octagonPeerID:octagonStatus:circlePeerID:circleStatus:keyState:currentTLKUUID:currentClassAUUID:currentClassCUUID:zoneID:encodedCKRecord:", v8, v51, v50, v44, v42, v52, v40, v28, v30, v29, v18, v19, v23, v25);

  return v34;
}

+ (id)intransactionCreateDeviceStateForView:(id)a3 accountTracker:(id)a4 lockStateTracker:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  NSObject *v21;
  id v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  __CFString *v27;
  __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  id v69;
  NSObject *v70;
  id v71;
  id v72;
  unsigned int v73;
  void *v74;
  id v75;
  NSObject *v76;
  _BOOL4 v77;
  void *v78;
  id v79;
  id v80;
  unsigned int v81;
  void *v82;
  id v83;
  NSObject *v84;
  _BOOL4 v85;
  void *v86;
  void *v87;
  id v88;
  void *v89;
  id v90;
  NSObject *v91;
  NSObject *v92;
  void *v93;
  void *v94;
  id v95;
  NSObject *v96;
  void *v97;
  void *v98;
  id v99;
  void *v100;
  void *v101;
  uint64_t v102;
  void *v103;
  id v104;
  void *v105;
  void *v106;
  void *v107;
  uint64_t v109;
  void *v110;
  void *v111;
  void *v112;
  unsigned int v113;
  void *v114;
  CKKSDeviceStateEntry *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  uint64_t v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  id v132;
  id v133;
  id v134;
  id v135;
  id v136;
  id v137;
  id v138;
  id v139;
  id v140;
  id v141;
  NSErrorUserInfoKey v142;
  void *v143;
  NSErrorUserInfoKey v144;
  void *v145;
  uint8_t buf[4];
  id v147;
  __int16 v148;
  __CFString *v149;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contextID"));
  v13 = objc_msgSend(v10, "cdpCapableiCloudAccountStatus");
  if (v13 == (id)1)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "currentCKAccountInfo"));
    v15 = objc_msgSend(v14, "accountStatus");

    if (v15 == (id)1)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ckdeviceID"));
      if (!v16)
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneName"));
        v33 = sub_10000BDF4(CFSTR("ckksdevice"), v32);
        v34 = objc_claimAutoreleasedReturnValue(v33);

        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "No CK device ID available; cannot make device state entry",
            buf,
            2u);
        }

        v142 = NSLocalizedDescriptionKey;
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "currentCKAccountInfo"));
        v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("No CK device ID: %@"), v35));
        v143 = v36;
        v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v143, &v142, 1));
        v18 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("CKKSErrorDomain"), 10, v37));

        if (a6)
        {
          v18 = objc_retainAutorelease(v18);
          v22 = 0;
          *a6 = v18;
        }
        else
        {
          v22 = 0;
        }
        v16 = 0;
        goto LABEL_82;
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneID"));
      v141 = 0;
      v131 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSDeviceStateEntry tryFromDatabase:contextID:zoneID:error:](CKKSDeviceStateEntry, "tryFromDatabase:contextID:zoneID:error:", v16, v12, v17, &v141));
      v18 = v141;

      if (v18)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneName"));
        v20 = sub_10000BDF4(CFSTR("ckksdevice"), v19);
        v21 = objc_claimAutoreleasedReturnValue(v20);

        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v147 = v18;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Couldn't read old CKKSDeviceStateEntry from database: %@", buf, 0xCu);
        }

        if (a6)
        {
          v18 = objc_retainAutorelease(v18);
          v22 = 0;
          *a6 = v18;
        }
        else
        {
          v22 = 0;
        }
        v57 = v131;
        goto LABEL_81;
      }
      v130 = v16;
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contextID"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneID"));
      v140 = 0;
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSCurrentKeyPointer tryFromDatabase:contextID:zoneID:error:](CKKSCurrentKeyPointer, "tryFromDatabase:contextID:zoneID:error:", CFSTR("tlk"), v38, v39, &v140));
      v41 = v140;

      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contextID"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneID"));
      v139 = v41;
      v125 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSCurrentKeyPointer tryFromDatabase:contextID:zoneID:error:](CKKSCurrentKeyPointer, "tryFromDatabase:contextID:zoneID:error:", CFSTR("classA"), v42, v43, &v139));
      v44 = v139;

      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contextID"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneID"));
      v138 = v44;
      v124 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSCurrentKeyPointer tryFromDatabase:contextID:zoneID:error:](CKKSCurrentKeyPointer, "tryFromDatabase:contextID:zoneID:error:", CFSTR("classC"), v45, v46, &v138));
      v47 = v138;

      if (v47)
      {
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneName"));
        v49 = sub_10000BDF4(CFSTR("ckksdevice"), v48);
        v50 = objc_claimAutoreleasedReturnValue(v49);

        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v147 = v47;
          _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "Couldn't read current key pointers from database: %@; proceeding",
            buf,
            0xCu);
        }

      }
      v126 = v11;
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "currentKeyUUID"));
      v118 = v40;
      if (v51)
      {
        v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "currentKeyUUID"));
        v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contextID"));
        v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneID"));
        v137 = 0;
        v55 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSKey tryFromDatabase:contextID:zoneID:error:](CKKSKey, "tryFromDatabase:contextID:zoneID:error:", v52, v53, v54, &v137));
        v56 = v137;

      }
      else
      {
        v55 = 0;
        v56 = 0;
      }

      v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v125, "currentKeyUUID"));
      if (v58)
      {
        v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v125, "currentKeyUUID"));
        v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contextID"));
        v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneID"));
        v136 = v56;
        v129 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSKey tryFromDatabase:contextID:zoneID:error:](CKKSKey, "tryFromDatabase:contextID:zoneID:error:", v59, v60, v61, &v136));
        v62 = v136;

        v56 = v62;
      }
      else
      {
        v129 = 0;
      }

      v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "currentKeyUUID"));
      if (v63)
      {
        v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "currentKeyUUID"));
        v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contextID"));
        v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneID"));
        v135 = v56;
        v127 = objc_claimAutoreleasedReturnValue(+[CKKSKey tryFromDatabase:contextID:zoneID:error:](CKKSKey, "tryFromDatabase:contextID:zoneID:error:", v64, v65, v66, &v135));
        v67 = v135;

        v56 = v67;
      }
      else
      {
        v127 = 0;
      }

      if (v56)
      {
        v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneName"));
        v69 = sub_10000BDF4(CFSTR("ckksdevice"), v68);
        v70 = objc_claimAutoreleasedReturnValue(v69);

        if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v147 = v56;
          _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_ERROR, "Couldn't read keys from database: %@; proceeding",
            buf,
            0xCu);
        }

      }
      v134 = 0;
      v71 = objc_msgSend(v55, "ensureKeyLoadedForContextID:error:", v12, &v134);
      v72 = v134;
      if (v72)
      {
        v73 = objc_msgSend(v126, "isLockedError:", v72);
        v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneName"));
        v75 = sub_10000BDF4(CFSTR("ckksdevice"), v74);
        v76 = objc_claimAutoreleasedReturnValue(v75);

        v77 = os_log_type_enabled(v76, OS_LOG_TYPE_ERROR);
        if (v73)
        {
          if (v77)
          {
            *(_DWORD *)buf = 138412290;
            v147 = v72;
            _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_ERROR, "Device is locked; couldn't read TLK from keychain. Assuming it is present and continuing; error was %@",
              buf,
              0xCu);
          }
          v78 = v72;
          v72 = 0;
        }
        else
        {
          if (v77)
          {
            *(_DWORD *)buf = 138412290;
            v147 = v72;
            _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_ERROR, "Couldn't read TLK from keychain. We do not have a current TLK. Error was %@", buf, 0xCu);
          }
          v78 = v55;
          v55 = 0;
        }

      }
      v133 = v72;
      v79 = objc_msgSend(v129, "ensureKeyLoadedForContextID:error:", v12, &v133);
      v80 = v133;

      if (v80)
      {
        v81 = objc_msgSend(v126, "isLockedError:", v80);
        v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneName"));
        v83 = sub_10000BDF4(CFSTR("ckksdevice"), v82);
        v84 = objc_claimAutoreleasedReturnValue(v83);

        v85 = os_log_type_enabled(v84, OS_LOG_TYPE_ERROR);
        if (v81)
        {
          if (v85)
          {
            *(_DWORD *)buf = 138412290;
            v147 = v80;
            _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_ERROR, "Device is locked; couldn't read ClassA key from keychain. Assuming it is present and continuing; error was %@",
              buf,
              0xCu);
          }
          v86 = v80;
          v80 = 0;
        }
        else
        {
          if (v85)
          {
            *(_DWORD *)buf = 138412290;
            v147 = v80;
            _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_ERROR, "Couldn't read ClassA key from keychain. We do not have a current ClassA key. Error was %@", buf, 0xCu);
          }
          v86 = v129;
          v129 = 0;
        }
        v87 = (void *)v127;

      }
      else
      {
        v87 = (void *)v127;
      }
      v132 = v80;
      v88 = objc_msgSend(v87, "ensureKeyLoadedForContextID:error:", v12, &v132);
      v18 = v132;

      if (v18)
      {
        v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneName"));
        v90 = sub_10000BDF4(CFSTR("ckksdevice"), v89);
        v91 = objc_claimAutoreleasedReturnValue(v90);

        if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v147 = v18;
          _os_log_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_ERROR, "Couldn't read ClassC key from keychain. We do not have a current ClassC key. Error was %@", buf, 0xCu);
        }

        v87 = 0;
      }
      if (-[OTSOSActualAdapter sosEnabled]_0())
      {
        v92 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "accountCirclePeerIDInitialized"));
        if (-[NSObject wait:](v92, "wait:", 500000000))
        {
          v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "accountCirclePeerID"));

          if (v93)
            goto LABEL_72;
          v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneName"));
          v95 = sub_10000BDF4(CFSTR("ckksdevice"), v94);
          v92 = objc_claimAutoreleasedReturnValue(v95);

          if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_ERROR, "No SOS peer ID available", buf, 2u);
          }
        }

      }
LABEL_72:
      v96 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "octagonInformationInitialized"));
      if (-[NSObject wait:](v96, "wait:", 500000000))
      {
        v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "octagonPeerID"));

        if (v97)
        {
LABEL_77:
          v100 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar calendarWithIdentifier:](NSCalendar, "calendarWithIdentifier:", NSCalendarIdentifierISO8601));
          v101 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone timeZoneWithAbbreviation:](NSTimeZone, "timeZoneWithAbbreviation:", CFSTR("UTC")));
          objc_msgSend(v100, "setTimeZone:", v101);

          v102 = objc_claimAutoreleasedReturnValue(objc_msgSend(v126, "lastUnlockTime"));
          v117 = v100;
          if (v102)
          {
            v103 = (void *)v102;
            v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "startOfDayForDate:", v102));

          }
          else
          {
            v123 = 0;
          }
          v115 = [CKKSDeviceStateEntry alloc];
          v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contextID"));
          v104 = -[OTDeviceInformationActualAdapter osVersion]_0();
          v121 = (void *)objc_claimAutoreleasedReturnValue(v104);
          v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "octagonPeerID"));
          v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "octagonStatus"));
          v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "accountCirclePeerID"));
          v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "currentCircleStatus"));
          v113 = objc_msgSend(v116, "status");
          v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "viewKeyHierarchyState"));
          v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "uuid"));
          v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v129, "uuid"));
          v128 = v87;
          v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "uuid"));
          v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneID"));
          v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "encodedCKRecord"));
          LODWORD(v109) = v113;
          v16 = v130;
          v22 = -[CKKSDeviceStateEntry initForDevice:contextID:osVersion:lastUnlockTime:octagonPeerID:octagonStatus:circlePeerID:circleStatus:keyState:currentTLKUUID:currentClassAUUID:currentClassCUUID:zoneID:encodedCKRecord:](v115, "initForDevice:contextID:osVersion:lastUnlockTime:octagonPeerID:octagonStatus:circlePeerID:circleStatus:keyState:currentTLKUUID:currentClassAUUID:currentClassCUUID:zoneID:encodedCKRecord:", v130, v122, v121, v123, v114, v120, v119, v109, v112, v111, v110, v105, v106, v107);

          v57 = v131;
          v11 = v126;
LABEL_81:

LABEL_82:
          goto LABEL_83;
        }
        v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneName"));
        v99 = sub_10000BDF4(CFSTR("ckksdevice"), v98);
        v96 = objc_claimAutoreleasedReturnValue(v99);

        if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_ERROR, "No octagon peer ID available", buf, 2u);
        }
      }

      goto LABEL_77;
    }
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneName"));
  v24 = sub_10000BDF4(CFSTR("ckksdevice"), v23);
  v25 = objc_claimAutoreleasedReturnValue(v24);

  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "currentCKAccountInfo"));
    v27 = CFSTR("available");
    if (v13 == (id)3)
      v27 = CFSTR("no account");
    if (!v13)
      v27 = CFSTR("unknown");
    v28 = v27;
    *(_DWORD *)buf = 138412546;
    v147 = v26;
    v148 = 2112;
    v149 = v28;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "No iCloud account active: %@ cdp capable account:%@", buf, 0x16u);

  }
  v144 = NSLocalizedDescriptionKey;
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "currentCKAccountInfo"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("No active CDP Capable iCloud account: %@"), v29));
  v145 = v30;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v145, &v144, 1));
  v18 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("securityd"), -67671, v31));

  if (a6)
  {
    v18 = objc_retainAutorelease(v18);
    v22 = 0;
    *a6 = v18;
  }
  else
  {
    v22 = 0;
  }
LABEL_83:

  return v22;
}

+ (BOOL)intransactionRecordChanged:(id)a3 contextID:(id)a4 resync:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v7;
  CKKSDeviceStateEntry *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CKKSDeviceStateEntry *v15;
  CKKSDeviceStateEntry *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  unsigned __int8 v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  unsigned __int8 v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  NSObject *v37;
  id v39;
  id v40;
  uint8_t buf[4];
  CKKSDeviceStateEntry *v42;
  __int16 v43;
  CKKSDeviceStateEntry *v44;
  __int16 v45;
  CKKSDeviceStateEntry *v46;

  v7 = a5;
  v9 = (CKKSDeviceStateEntry *)a3;
  v10 = a4;
  if (v7)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry recordID](v9, "recordID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "recordName"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry recordID](v9, "recordID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "zoneID"));
    v40 = 0;
    v15 = (CKKSDeviceStateEntry *)objc_claimAutoreleasedReturnValue(+[CKKSDeviceStateEntry tryFromDatabase:contextID:zoneID:error:](CKKSDeviceStateEntry, "tryFromDatabase:contextID:zoneID:error:", v12, v10, v14, &v40));
    v16 = (CKKSDeviceStateEntry *)v40;

    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry recordID](v9, "recordID"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "zoneID"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "zoneName"));
      v20 = sub_10000BDF4(CFSTR("ckksresync"), v19);
      v21 = objc_claimAutoreleasedReturnValue(v20);

      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v42 = v16;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "error loading cdse: %@", buf, 0xCu);
      }

    }
    if (v15)
    {
      v22 = -[CKKSDeviceStateEntry matchesCKRecord:](v15, "matchesCKRecord:", v9);
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry recordID](v9, "recordID"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "zoneID"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "zoneName"));
      v26 = sub_10000BDF4(CFSTR("ckksresync"), v25);
      v27 = objc_claimAutoreleasedReturnValue(v26);

      if ((v22 & 1) != 0)
      {
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v42 = v9;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Already know about this current item pointer, skipping update: %@", buf, 0xCu);
        }

        v28 = 1;
        goto LABEL_23;
      }
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v42 = v15;
        v43 = 2112;
        v44 = v9;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "BUG: Local current device state entry doesn't match resynced CloudKit record(s): %@ %@", buf, 0x16u);
      }
    }
    else
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry recordID](v9, "recordID"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "zoneID"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "zoneName"));
      v32 = sub_10000BDF4(CFSTR("ckksresync"), v31);
      v27 = objc_claimAutoreleasedReturnValue(v32);

      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v42 = v9;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "BUG: No current device state entry matching resynced CloudKit record: %@", buf, 0xCu);
      }
    }

  }
  v15 = -[CKKSCKRecordHolder initWithCKRecord:contextID:]([CKKSDeviceStateEntry alloc], "initWithCKRecord:contextID:", v9, v10);
  v39 = 0;
  v28 = -[CKKSSQLDatabaseObject saveToDatabase:](v15, "saveToDatabase:", &v39);
  v16 = (CKKSDeviceStateEntry *)v39;
  if (v16)
    v28 = 0;
  if ((v28 & 1) == 0)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry recordID](v9, "recordID"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "zoneID"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "zoneName"));
    v36 = sub_10000BDF4(CFSTR("ckksdevice"), v35);
    v37 = objc_claimAutoreleasedReturnValue(v36);

    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v42 = v15;
      v43 = 2112;
      v44 = v16;
      v45 = 2112;
      v46 = v9;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "Failed to save device record to database: %@: %@ %@", buf, 0x20u);
    }

    if (a6)
      *a6 = objc_retainAutorelease(v16);
  }
LABEL_23:

  return v28;
}

+ (BOOL)intransactionRecordDeleted:(id)a3 contextID:(id)a4 resync:(BOOL)a5 error:(id *)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  __CFString *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  id v22;
  id v23;
  uint8_t buf[4];
  const __CFString *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "zoneID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "zoneName"));
  v12 = sub_10000BDF4(CFSTR("ckksdevice"), v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);

  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v25 = CFSTR("devicestate");
    v26 = 2112;
    v27 = v8;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "CloudKit notification: deleted device state record(%@): %@", buf, 0x16u);
  }

  v23 = 0;
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[CKKSDeviceStateEntry tryFromDatabaseFromCKRecordID:contextID:error:](CKKSDeviceStateEntry, "tryFromDatabaseFromCKRecordID:contextID:error:", v8, v9, &v23));

  v15 = v23;
  v22 = v15;
  -[__CFString deleteFromDatabase:](v14, "deleteFromDatabase:", &v22);
  v16 = v22;

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "zoneID"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "zoneName"));
  v19 = sub_10000BDF4(CFSTR("ckksdevice"), v18);
  v20 = objc_claimAutoreleasedReturnValue(v19);

  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v25 = v14;
    v26 = 2112;
    v27 = v8;
    v28 = 2112;
    v29 = v16;
    _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "CKKSDeviceStateEntry(%@) was deleted: %@ error: %@", buf, 0x20u);
  }

  if (a6 && v16)
    *a6 = objc_retainAutorelease(v16);

  return v16 == 0;
}

@end
