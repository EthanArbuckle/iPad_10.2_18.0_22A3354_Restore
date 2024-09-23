@implementation HAPProtocolMessages

+ (id)constructTokenRequest:(id)a3 outTID:(char *)a4
{
  return +[HAPProtocolMessages constructRequestHeaderFor:instanceID:outTID:](HAPProtocolMessages, "constructRequestHeaderFor:instanceID:outTID:", 16, a3, a4);
}

+ (id)constructInfoRequest:(id)a3 outTID:(char *)a4
{
  return +[HAPProtocolMessages constructRequestHeaderFor:instanceID:outTID:](HAPProtocolMessages, "constructRequestHeaderFor:instanceID:outTID:", 18, a3, a4);
}

+ (id)constructInfoRequest:(id)a3 serviceUUID:(id)a4 outTID:(char *)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  unsigned __int16 v13;
  _BYTE v14[16];
  _OWORD v15[21];

  memset(v15, 0, sizeof(v15));
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[HAPProtocolMessages constructRequestHeaderFor:instanceID:outTID:](HAPProtocolMessages, "constructRequestHeaderFor:instanceID:outTID:", 18, a3, a5));
  v13 = 18;
  objc_msgSend(v8, "appendBytes:length:", &v13, 2);
  TLV8BufferInit(v15, v13);
  objc_msgSend(v7, "getUUIDBytes:", v14);

  if (TLV8BufferAppend(v15, 16, v14, 16))
  {
    TLV8BufferFree(v15, v9);
    v10 = 0;
  }
  else
  {
    objc_msgSend(v8, "appendBytes:length:", v15[0]);
    TLV8BufferFree(v15, v11);
    v10 = v8;
  }

  return v10;
}

+ (id)constructTokenUpdateRequest:(id)a3 token:(id)a4 outTID:(char *)a5
{
  id v8;
  unsigned __int16 v9;
  __int16 v10;
  __int16 v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  unsigned __int8 v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  id v21;
  NSObject *v22;
  __CFString *v23;
  void *v24;
  int v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  int v31;
  id v32;
  uint64_t v33;
  id v34;
  NSObject *v35;
  __CFString *v36;
  void *v37;
  void *v39;
  id v40;
  id v41;
  unsigned __int16 v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  int v46;
  _BYTE v47[255];
  _OWORD v48[21];

  v8 = a3;
  memset(v48, 0, sizeof(v48));
  v41 = a4;
  v9 = (unsigned __int16)objc_msgSend(v41, "length");
  v10 = v9 / 0xFFu;
  v11 = v9 % 0xFFu;
  if (v9 % 0xFFu)
    LOBYTE(v10) = v10 + 1;
  v12 = v10;
  v42 = v9 + 2 * v10;
  v40 = v8;
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[HAPProtocolMessages constructRequestHeaderFor:instanceID:outTID:](HAPProtocolMessages, "constructRequestHeaderFor:instanceID:outTID:", 17, v8, a5));
  objc_msgSend(v39, "appendBytes:length:", &v42, 2);
  TLV8BufferInit(v48, v42);
  if (v12)
  {
    v13 = 0;
    v14 = 255 * (v12 - 1);
    v15 = 255 * v12;
    while (1)
    {
      if (v11)
        v16 = v14 == v13;
      else
        v16 = 0;
      if (v16)
        v17 = v11;
      else
        v17 = -1;
      v18 = v17;
      objc_msgSend(v41, "getBytes:range:", v47, v13, v17);
      v19 = a1;
      v21 = sub_10007CCE4((uint64_t)v19, v20);
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        v23 = sub_10007CD2C(v19);
        v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
        *(_DWORD *)buf = 138543618;
        v44 = v24;
        v45 = 1024;
        v46 = v18;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "%{public}@Adding token TLV length: %u", buf, 0x12u);

      }
      v25 = TLV8BufferAppend(v48, 2, v47, v18);
      if (v25)
        break;
      v13 += 255;
      if (v15 == v13)
        goto LABEL_15;
    }
    v31 = v25;
    TLV8BufferFree(v48, v26);
    v32 = v19;
    v34 = sub_10007CCE4((uint64_t)v32, v33);
    v35 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v36 = sub_10007CD2C(v32);
      v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
      *(_DWORD *)buf = 138543618;
      v44 = v37;
      v45 = 1024;
      v46 = v31;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "%{public}@Failed to construct token update request status: %d", buf, 0x12u);

    }
    v29 = 0;
    v27 = v39;
    v30 = v40;
  }
  else
  {
LABEL_15:
    v27 = v39;
    objc_msgSend(v39, "appendBytes:length:", v48[0]);
    TLV8BufferFree(v48, v28);
    v29 = v39;
    v30 = v40;
  }

  return v29;
}

+ (id)constructRequestHeaderFor:(unint64_t)a3 instanceID:(id)a4 outTID:(char *)a5
{
  id v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  unsigned __int16 v10;
  unsigned __int16 v12;
  char v13;
  char v14;
  unint64_t v15;

  v15 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithCapacity:](NSMutableData, "dataWithCapacity:", 5));
  v14 = 0;
  objc_msgSend(v7, "appendBytes:length:", &v14, 1);
  objc_msgSend(v7, "appendBytes:length:", &v15, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[HAPBTLETransactionIdentifier randomTransactionIdentifier](HAPBTLETransactionIdentifier, "randomTransactionIdentifier"));
  v9 = objc_msgSend(v8, "unsignedCharValue");

  v13 = v9;
  objc_msgSend(v7, "appendBytes:length:", &v13, 1);
  if (a5)
    *a5 = v13;
  v10 = (unsigned __int16)objc_msgSend(v6, "unsignedShortValue");

  v12 = v10;
  objc_msgSend(v7, "appendBytes:length:", &v12, 2);
  return v7;
}

+ (BOOL)parseTokenResponse:(id)a3 expectedTID:(unsigned __int8)a4 withHeader:(BOOL)a5 outToken:(id *)a6 outUUID:(id *)a7
{
  _BOOL4 v9;
  int v10;
  id v12;
  unsigned __int16 v13;
  id v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  __CFString *v20;
  NSObject *v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  unsigned __int16 v25;
  id v26;
  char *v27;
  char *v28;
  int v29;
  int v30;
  id v31;
  uint64_t v32;
  id v33;
  NSObject *v34;
  __CFString *v35;
  NSObject *v36;
  BOOL v37;
  uint64_t v38;
  id v39;
  __CFString *v40;
  uint64_t v41;
  id v42;
  __CFString *v43;
  uint64_t v45;
  char *v46;
  char v47;
  int v48;
  id v49;
  uint64_t v50;
  id v51;
  NSObject *v52;
  __CFString *v53;
  NSObject *v54;
  id v55;
  id v56;
  uint64_t v57;
  id v58;
  __CFString *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  unsigned __int16 v63;
  unsigned __int8 v64;
  __int16 v65;
  uint8_t buf[4];
  NSObject *v67;
  __int16 v68;
  _BYTE v69[10];
  id v70;
  _BYTE v71[16];

  v9 = a5;
  v10 = a4;
  v12 = a3;
  v65 = 0;
  v64 = 0;
  v13 = (unsigned __int16)objc_msgSend(v12, "length");
  v63 = v13;
  if (v9)
  {
    v14 = sub_10001DB34(v12, (_BYTE *)&v65 + 1, (uint64_t)&v65, (uint64_t)&v64);
    v15 = (id)objc_claimAutoreleasedReturnValue(v14);

    if (!v15)
    {
      v15 = a1;
      v39 = sub_10007CCE4((uint64_t)v15, v38);
      v16 = objc_claimAutoreleasedReturnValue(v39);
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
LABEL_21:

        v37 = 0;
        goto LABEL_22;
      }
      v40 = sub_10007CD2C(v15);
      v19 = objc_claimAutoreleasedReturnValue(v40);
      *(_DWORD *)buf = 138543362;
      v67 = v19;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed parsing headers", buf, 0xCu);
      goto LABEL_20;
    }
    if (v65 != v10)
    {
      v16 = a1;
      v42 = sub_10007CCE4((uint64_t)v16, v41);
      v19 = objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v43 = sub_10007CD2C(v16);
        v21 = objc_claimAutoreleasedReturnValue(v43);
        *(_DWORD *)buf = 138543874;
        v67 = v21;
        v68 = 1024;
        *(_DWORD *)v69 = v65;
        *(_WORD *)&v69[4] = 1024;
        *(_DWORD *)&v69[6] = v10;
        v22 = "%{public}@Unexpected TID: 0x%02x expected: 0x%02x";
        v23 = v19;
        v24 = 24;
        goto LABEL_19;
      }
LABEL_20:

      goto LABEL_21;
    }
    if (v64)
    {
      v16 = a1;
      v18 = sub_10007CCE4((uint64_t)v16, v17);
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = sub_10007CD2C(v16);
        v21 = objc_claimAutoreleasedReturnValue(v20);
        *(_DWORD *)buf = 138543618;
        v67 = v21;
        v68 = 1024;
        *(_DWORD *)v69 = v64;
        v22 = "%{public}@Unexpected Status: 0x%02x";
        v23 = v19;
        v24 = 18;
LABEL_19:
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, v22, buf, v24);

        goto LABEL_20;
      }
      goto LABEL_20;
    }
    if ((unint64_t)objc_msgSend(v15, "length") < 2)
    {
      v16 = a1;
      v58 = sub_10007CCE4((uint64_t)v16, v57);
      v19 = objc_claimAutoreleasedReturnValue(v58);
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        goto LABEL_20;
      v59 = sub_10007CD2C(v16);
      v21 = objc_claimAutoreleasedReturnValue(v59);
      *(_DWORD *)buf = 138543362;
      v67 = v21;
      v22 = "%{public}@Insufficinet body length";
      v23 = v19;
      v24 = 12;
      goto LABEL_19;
    }
    objc_msgSend(v15, "getBytes:length:", &v63, 2);
    v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "subdataWithRange:", 2, (char *)objc_msgSend(v15, "length") - 2));

    v25 = v63;
  }
  else
  {
    v25 = v13;
  }
  if (objc_msgSend(v12, "length") != (id)v25)
  {
    v30 = -6742;
    goto LABEL_12;
  }
  v15 = objc_retainAutorelease(v12);
  v26 = objc_msgSend(v15, "bytes");
  v27 = (char *)objc_msgSend(v15, "length");
  v61 = 0;
  v62 = 0;
  v28 = &v27[(_QWORD)v26];
  v60 = 0;
  v29 = TLV8GetOrCopyCoalesced(v26, &v27[(_QWORD)v26], 1, &v62, &v61, &v60, 0);
  if (v29)
  {
    v30 = v29;
LABEL_12:
    v31 = a1;
    v33 = sub_10007CCE4((uint64_t)v31, v32);
    v34 = objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      v35 = sub_10007CD2C(v31);
      v36 = objc_claimAutoreleasedReturnValue(v35);
      *(_DWORD *)buf = 138543618;
      v67 = v36;
      v68 = 2048;
      *(_QWORD *)v69 = v30;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEBUG, "%{public}@Auth response failed status: %ld", buf, 0x16u);

    }
    v37 = 0;
    v15 = v12;
    goto LABEL_22;
  }
  if (v61 != 16)
  {
    v30 = -6743;
    goto LABEL_12;
  }
  v45 = 0;
  v46 = (char *)(v62 + 15);
  do
  {
    v47 = *v46--;
    v71[v45++] = v47;
  }
  while (v45 != 16);
  *a7 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", v71);
  if (v60)
  {
    free(v60);
    v60 = 0;
  }
  v48 = TLV8GetOrCopyCoalesced(v26, v28, 2, &v62, &v61, &v60, 0);
  if (v48 != -6727)
  {
    v30 = v48;
    if (v48)
      goto LABEL_12;
    *a6 = (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v62, v61));
  }
  if (v60)
  {
    free(v60);
    v60 = 0;
  }
  v49 = a1;
  v51 = sub_10007CCE4((uint64_t)v49, v50);
  v52 = objc_claimAutoreleasedReturnValue(v51);
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
  {
    v53 = sub_10007CD2C(v49);
    v54 = objc_claimAutoreleasedReturnValue(v53);
    v55 = *a7;
    v56 = *a6;
    *(_DWORD *)buf = 138543874;
    v67 = v54;
    v68 = 2112;
    *(_QWORD *)v69 = v55;
    *(_WORD *)&v69[8] = 2112;
    v70 = v56;
    _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEBUG, "%{public}@Validating UUID: %@, Token: %@", buf, 0x20u);

  }
  v37 = 1;
LABEL_22:

  return v37;
}

+ (BOOL)_parseEmptyResponse:(id)a3 expectedTID:(unsigned __int8)a4 withHeader:(BOOL)a5
{
  int v5;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  __CFString *v14;
  void *v15;
  BOOL v16;
  id v17;
  uint64_t v18;
  id v19;
  __CFString *v20;
  void *v21;
  id v22;
  uint64_t v23;
  id v24;
  __CFString *v25;
  void *v26;
  unsigned __int8 v28;
  __int16 v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  int v35;

  v29 = 0;
  v28 = 0;
  if (a5)
  {
    v5 = a4;
    v7 = sub_10001DB34(a3, (_BYTE *)&v29 + 1, (uint64_t)&v29, (uint64_t)&v28);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (!v8)
    {
      v17 = a1;
      v19 = sub_10007CCE4((uint64_t)v17, v18);
      v13 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v20 = sub_10007CD2C(v17);
        v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
        *(_DWORD *)buf = 138543362;
        v31 = v21;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed parsing headers", buf, 0xCu);

      }
      v9 = 0;
      goto LABEL_14;
    }
    v9 = (void *)v8;
    if (v29 != v5)
    {
      v22 = a1;
      v24 = sub_10007CCE4((uint64_t)v22, v23);
      v13 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v25 = sub_10007CD2C(v22);
        v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
        *(_DWORD *)buf = 138543874;
        v31 = v26;
        v32 = 1024;
        v33 = v29;
        v34 = 1024;
        v35 = v5;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{public}@Unexpected TID: 0x%02x expected: 0x%02x", buf, 0x18u);

      }
      goto LABEL_14;
    }
    if (v28)
    {
      v10 = a1;
      v12 = sub_10007CCE4((uint64_t)v10, v11);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = sub_10007CD2C(v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        *(_DWORD *)buf = 138543618;
        v31 = v15;
        v32 = 1024;
        v33 = v28;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{public}@Unexpected Status: 0x%02x", buf, 0x12u);

      }
LABEL_14:

      v16 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    v9 = 0;
  }
  v16 = 1;
LABEL_15:

  return v16;
}

+ (BOOL)parseTokenUpdateResponse:(id)a3 expectedTID:(unsigned __int8)a4 withHeader:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v6;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  __CFString *v13;
  void *v14;
  const __CFString *v15;
  unsigned __int8 v16;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  const __CFString *v23;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v9 = a1;
  v11 = sub_10007CCE4((uint64_t)v9, v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v13 = sub_10007CD2C(v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = CFSTR("No");
    v18 = 138543874;
    v19 = v14;
    v20 = 2112;
    if (v5)
      v15 = CFSTR("Yes");
    v21 = v8;
    v22 = 2112;
    v23 = v15;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%{public}@Received Token Update Response: %@ withHeader: %@", (uint8_t *)&v18, 0x20u);

  }
  v16 = objc_msgSend(v9, "_parseEmptyResponse:expectedTID:withHeader:", v8, v6, v5);

  return v16;
}

+ (id)parseInfoResponse:(id)a3 expectedTID:(unsigned __int8)a4 withHeader:(BOOL)a5
{
  _BOOL4 v5;
  int v6;
  id v8;
  unsigned __int16 v9;
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  __CFString *v16;
  NSObject *v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  unsigned __int16 v21;
  id v22;
  id v23;
  char *v24;
  char *v25;
  int v26;
  int v27;
  uint64_t v28;
  id v29;
  __CFString *v30;
  uint64_t v31;
  id v32;
  __CFString *v33;
  NSObject *v34;
  void *v35;
  id v36;
  uint64_t v37;
  id v38;
  NSObject *v39;
  __CFString *v40;
  NSObject *v41;
  uint64_t v42;
  void *v43;
  id v44;
  uint64_t v45;
  id v46;
  NSObject *v47;
  __CFString *v48;
  NSObject *v49;
  uint64_t v50;
  id v51;
  __CFString *v52;
  NSObject *v53;
  uint64_t v55;
  id v56;
  __CFString *v57;
  id v58;
  uint64_t v59;
  id v60;
  NSObject *v61;
  __CFString *v62;
  NSObject *v63;
  id v64;
  uint64_t v65;
  id v66;
  NSObject *v67;
  __CFString *v68;
  NSObject *v69;
  uint64_t v70;
  id v71;
  id v72;
  uint64_t v73;
  id v74;
  NSObject *v75;
  __CFString *v76;
  NSObject *v77;
  void *v78;
  id v79;
  id v80;
  uint64_t v81;
  id v82;
  NSObject *v83;
  __CFString *v84;
  NSObject *v85;
  void *v86;
  id v87;
  uint64_t v88;
  id v89;
  NSObject *v90;
  __CFString *v91;
  void *v92;
  NSObject *v93;
  void *v94;
  id v95;
  uint64_t v96;
  id v97;
  NSObject *v98;
  __CFString *v99;
  NSObject *v100;
  int v101;
  id v102;
  uint64_t v103;
  id v104;
  NSObject *v105;
  __CFString *v106;
  NSObject *v107;
  void *v108;
  void *v109;
  id v110;
  uint64_t v111;
  unsigned __int8 v112;
  unsigned __int16 v113;
  void *v114;
  uint64_t v115;
  HAPAccessoryProtocolInfo *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  int v122;
  unsigned __int16 v123;
  unsigned __int8 v124;
  unsigned __int8 v125;
  int v126;
  __int16 v127;
  unsigned __int16 v128;
  unsigned __int16 v129;
  void *v130;
  unint64_t v131;
  uint64_t v132;
  unsigned __int16 v133;
  unsigned __int8 v134;
  __int16 v135;
  uint8_t buf[4];
  NSObject *v137;
  __int16 v138;
  _BYTE v139[10];
  __int16 v140;
  int v141;
  __int16 v142;
  int v143;
  __int16 v144;
  int v145;
  __int16 v146;
  int v147;
  __int16 v148;
  void *v149;
  _BYTE v150[18];

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v135 = 0;
  v134 = 0;
  v9 = (unsigned __int16)objc_msgSend(v8, "length");
  v133 = v9;
  if (!v5)
  {
    v21 = v9;
    v11 = v8;
    goto LABEL_8;
  }
  v10 = sub_10001DB34(v8, (_BYTE *)&v135 + 1, (uint64_t)&v135, (uint64_t)&v134);
  v11 = (id)objc_claimAutoreleasedReturnValue(v10);

  if (v11)
  {
    if (v135 != v6)
    {
      v12 = a1;
      v32 = sub_10007CCE4((uint64_t)v12, v31);
      v15 = objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v33 = sub_10007CD2C(v12);
        v34 = objc_claimAutoreleasedReturnValue(v33);
        *(_DWORD *)buf = 138543874;
        v137 = v34;
        v138 = 1024;
        *(_DWORD *)v139 = v135;
        *(_WORD *)&v139[4] = 1024;
        *(_DWORD *)&v139[6] = v6;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%{public}@Unexpected TID: 0x%02x expected: 0x%02x", buf, 0x18u);

      }
      goto LABEL_40;
    }
    if (v134)
    {
      v12 = a1;
      v14 = sub_10007CCE4((uint64_t)v12, v13);
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = sub_10007CD2C(v12);
        v17 = objc_claimAutoreleasedReturnValue(v16);
        *(_DWORD *)buf = 138543618;
        v137 = v17;
        v138 = 1024;
        *(_DWORD *)v139 = v134;
        v18 = "%{public}@Unexpected Status: 0x%02x";
        v19 = v15;
        v20 = 18;
LABEL_45:
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, v18, buf, v20);
LABEL_39:

      }
LABEL_40:

      goto LABEL_41;
    }
    if ((unint64_t)objc_msgSend(v11, "length") < 2)
    {
      v12 = a1;
      v56 = sub_10007CCE4((uint64_t)v12, v55);
      v15 = objc_claimAutoreleasedReturnValue(v56);
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        goto LABEL_40;
      v57 = sub_10007CD2C(v12);
      v17 = objc_claimAutoreleasedReturnValue(v57);
      *(_DWORD *)buf = 138543362;
      v137 = v17;
      v18 = "%{public}@Insufficinet body length";
      v19 = v15;
      v20 = 12;
      goto LABEL_45;
    }
    objc_msgSend(v11, "getBytes:length:", &v133, 2);
    v42 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "subdataWithRange:", 2, (char *)objc_msgSend(v11, "length") - 2));

    v21 = v133;
    v11 = (id)v42;
LABEL_8:
    if (objc_msgSend(v11, "length") != (id)v21)
    {
      v12 = 0;
      v27 = -6742;
      goto LABEL_37;
    }
    v22 = objc_retainAutorelease(v11);
    v23 = objc_msgSend(v22, "bytes");
    v24 = (char *)objc_msgSend(v22, "length");
    v131 = 0;
    v132 = 0;
    v25 = &v24[(_QWORD)v23];
    v130 = 0;
    v129 = 0;
    v26 = TLV8GetOrCopyCoalesced(v23, &v24[(_QWORD)v23], 1, &v132, &v131, &v130, 0);
    if (v26)
    {
      v27 = v26;
LABEL_36:
      v12 = 0;
      goto LABEL_37;
    }
    if (v131 != 2)
    {
      v12 = 0;
      v27 = -6743;
LABEL_37:
      v15 = a1;
      v51 = sub_10007CCE4((uint64_t)v15, v50);
      v17 = objc_claimAutoreleasedReturnValue(v51);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        v52 = sub_10007CD2C(v15);
        v53 = objc_claimAutoreleasedReturnValue(v52);
        *(_DWORD *)buf = 138543618;
        v137 = v53;
        v138 = 1024;
        *(_DWORD *)v139 = v27;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "%{public}@Acc Info Response failed status: %d", buf, 0x12u);

      }
      goto LABEL_39;
    }
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v132, 2));
    if (v130)
    {
      free(v130);
      v130 = 0;
    }
    if (v35)
      objc_msgSend(v35, "getBytes:length:", &v129, 2);
    v36 = a1;
    v38 = sub_10007CCE4((uint64_t)v36, v37);
    v39 = objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
    {
      v40 = sub_10007CD2C(v36);
      v41 = objc_claimAutoreleasedReturnValue(v40);
      *(_DWORD *)buf = 138543618;
      v137 = v41;
      v138 = 1024;
      *(_DWORD *)v139 = v129;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEBUG, "%{public}@currentStateNumber: %d", buf, 0x12u);

    }
    v128 = 0;
    v27 = TLV8GetOrCopyCoalesced(v23, v25, 2, &v132, &v131, &v130, 0);
    if (v27)
    {
LABEL_24:

      goto LABEL_36;
    }
    if (v131 != 2)
    {
      v27 = -6743;
      goto LABEL_24;
    }
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v132, 2));

    if (v130)
    {
      free(v130);
      v130 = 0;
    }
    if (v43)
      objc_msgSend(v43, "getBytes:length:", &v128, 2);
    v44 = v36;
    v46 = sub_10007CCE4((uint64_t)v44, v45);
    v47 = objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
    {
      v48 = sub_10007CD2C(v44);
      v49 = objc_claimAutoreleasedReturnValue(v48);
      *(_DWORD *)buf = 138543618;
      v137 = v49;
      v138 = 1024;
      *(_DWORD *)v139 = v128;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEBUG, "%{public}@currentConfigNumber: %d", buf, 0x12u);

    }
    v127 = 0;
    v126 = 0;
    v27 = TLV8GetOrCopyCoalesced(v23, v25, 3, &v132, &v131, &v130, 0);
    if (v27)
    {
LABEL_35:

      goto LABEL_36;
    }
    if (v131 != 6)
    {
      v27 = -6743;
      goto LABEL_35;
    }
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v132, 6));

    if (v130)
    {
      free(v130);
      v130 = 0;
    }
    if (v35)
      objc_msgSend(v35, "getBytes:length:", &v126, 6);
    HardwareAddressToCString(&v126, 6, v150);
    v121 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v150));
    v58 = v44;
    v60 = sub_10007CCE4((uint64_t)v58, v59);
    v61 = objc_claimAutoreleasedReturnValue(v60);
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
    {
      v62 = sub_10007CD2C(v58);
      v63 = objc_claimAutoreleasedReturnValue(v62);
      *(_DWORD *)buf = 138545154;
      v137 = v63;
      v138 = 1024;
      *(_DWORD *)v139 = v126;
      *(_WORD *)&v139[4] = 1024;
      *(_DWORD *)&v139[6] = BYTE1(v126);
      v140 = 1024;
      v141 = BYTE2(v126);
      v142 = 1024;
      v143 = HIBYTE(v126);
      v144 = 1024;
      v145 = v127;
      v146 = 1024;
      v147 = HIBYTE(v127);
      v148 = 2112;
      v149 = v121;
      _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEBUG, "%{public}@deviceID: %02X:%02X:%02X:%02X:%02X:%02X, deviceIDString: %@", buf, 0x3Au);

    }
    v125 = 0;
    v27 = TLV8GetOrCopyCoalesced(v23, v25, 4, &v132, &v131, &v130, 0);
    if (!v27)
    {
      if (v131 == 1)
      {
        v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v132, 1));

        if (v130)
        {
          free(v130);
          v130 = 0;
        }
        if (v43)
          objc_msgSend(v43, "getBytes:length:", &v125, 1);
        v64 = v58;
        v66 = sub_10007CCE4((uint64_t)v64, v65);
        v67 = objc_claimAutoreleasedReturnValue(v66);
        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
        {
          v68 = sub_10007CD2C(v64);
          v69 = objc_claimAutoreleasedReturnValue(v68);
          *(_DWORD *)buf = 138543618;
          v137 = v69;
          v138 = 1024;
          *(_DWORD *)v139 = v125;
          _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEBUG, "%{public}@authMethods: 0x%X", buf, 0x12u);

        }
        v27 = TLV8GetOrCopyCoalesced(v23, v25, 5, &v132, &v131, &v130, 0);
        if (!v27)
        {
          if (v131 <= 0xFF)
          {
            v70 = objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v132));

            if (v130)
            {
              free(v130);
              v130 = 0;
            }
            v118 = (void *)v70;
            if (v70)
              v71 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v70, 4);
            else
              v71 = 0;
            v72 = v64;
            v74 = sub_10007CCE4((uint64_t)v72, v73);
            v75 = objc_claimAutoreleasedReturnValue(v74);
            if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG))
            {
              v76 = sub_10007CD2C(v72);
              v77 = objc_claimAutoreleasedReturnValue(v76);
              *(_DWORD *)buf = 138543618;
              v137 = v77;
              v138 = 2112;
              *(_QWORD *)v139 = v71;
              _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEBUG, "%{public}@modelName: %@", buf, 0x16u);

            }
            v120 = v71;

            v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSString string](NSString, "string"));
            v27 = TLV8GetOrCopyCoalesced(v23, v25, 6, &v132, &v131, &v130, 0);
            if (!v27)
            {
              if (v131 <= 0xFF)
              {
                v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v132));

                if (v130)
                {
                  free(v130);
                  v130 = 0;
                }
                v119 = v78;
                if (v35)
                {
                  v79 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v35, 4);

                  v119 = v79;
                }
                v80 = v72;
                v82 = sub_10007CCE4((uint64_t)v80, v81);
                v83 = objc_claimAutoreleasedReturnValue(v82);
                if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG))
                {
                  v84 = sub_10007CD2C(v80);
                  v85 = objc_claimAutoreleasedReturnValue(v84);
                  *(_DWORD *)buf = 138543618;
                  v137 = v85;
                  v138 = 2112;
                  *(_QWORD *)v139 = v119;
                  _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_DEBUG, "%{public}@protocolVersion: %@", buf, 0x16u);

                }
                v124 = 0;
                v27 = TLV8GetOrCopyCoalesced(v23, v25, 7, &v132, &v131, &v130, 0);
                if (!v27)
                {
                  if (v131 == 1)
                  {
                    v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v132, 1));

                    if (v130)
                    {
                      free(v130);
                      v130 = 0;
                    }
                    if (v86)
                      objc_msgSend(v86, "getBytes:length:", &v124, 1);
                    v87 = v80;
                    v89 = sub_10007CCE4((uint64_t)v87, v88);
                    v90 = objc_claimAutoreleasedReturnValue(v89);
                    if (os_log_type_enabled(v90, OS_LOG_TYPE_DEBUG))
                    {
                      v91 = sub_10007CD2C(v87);
                      v92 = v86;
                      v93 = objc_claimAutoreleasedReturnValue(v91);
                      *(_DWORD *)buf = 138543618;
                      v137 = v93;
                      v138 = 1024;
                      *(_DWORD *)v139 = v124;
                      _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_DEBUG, "%{public}@statusFlags: 0x%X", buf, 0x12u);

                      v86 = v92;
                    }

                    v123 = 0;
                    v27 = TLV8GetOrCopyCoalesced(v23, v25, 8, &v132, &v131, &v130, 0);
                    if (!v27)
                    {
                      if (v131 == 2)
                      {
                        v94 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v132, 2));

                        if (v130)
                        {
                          free(v130);
                          v130 = 0;
                        }
                        if (v94)
                          objc_msgSend(v94, "getBytes:length:", &v123, 2);
                        v95 = v87;
                        v97 = sub_10007CCE4((uint64_t)v95, v96);
                        v98 = objc_claimAutoreleasedReturnValue(v97);
                        if (os_log_type_enabled(v98, OS_LOG_TYPE_DEBUG))
                        {
                          v99 = sub_10007CD2C(v95);
                          v100 = objc_claimAutoreleasedReturnValue(v99);
                          *(_DWORD *)buf = 138543618;
                          v137 = v100;
                          v138 = 1024;
                          *(_DWORD *)v139 = v123;
                          _os_log_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_DEBUG, "%{public}@categoryIdentifier: %d", buf, 0x12u);

                        }
                        v122 = 0;
                        v101 = TLV8GetOrCopyCoalesced(v23, v25, 9, &v132, &v131, &v130, 0);
                        if (v101)
                        {
                          v27 = v101;
                          v12 = 0;
                        }
                        else if (v131 == 4)
                        {
                          v117 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v132, 4));

                          if (v130)
                          {
                            free(v130);
                            v130 = 0;
                          }
                          if (v117)
                            objc_msgSend(v117, "getBytes:length:", &v122, 4);
                          v102 = v95;
                          v104 = sub_10007CCE4((uint64_t)v102, v103);
                          v105 = objc_claimAutoreleasedReturnValue(v104);
                          if (os_log_type_enabled(v105, OS_LOG_TYPE_DEBUG))
                          {
                            v106 = sub_10007CD2C(v102);
                            v107 = objc_claimAutoreleasedReturnValue(v106);
                            *(_DWORD *)buf = 138544386;
                            v137 = v107;
                            v138 = 1024;
                            *(_DWORD *)v139 = v122;
                            *(_WORD *)&v139[4] = 1024;
                            *(_DWORD *)&v139[6] = BYTE1(v122);
                            v140 = 1024;
                            v141 = BYTE2(v122);
                            v142 = 1024;
                            v143 = HIBYTE(v122);
                            _os_log_impl((void *)&_mh_execute_header, v105, OS_LOG_TYPE_DEBUG, "%{public}@setupHash: %02X:%02X:%02X:%02X", buf, 0x24u);

                          }
                          v116 = [HAPAccessoryProtocolInfo alloc];
                          v108 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithShort:](NSNumber, "numberWithShort:", (__int16)v129));
                          v109 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithShort:](NSNumber, "numberWithShort:", (__int16)v128));
                          v110 = objc_msgSend(objc_alloc((Class)HMFVersion), "initWithVersionString:", v119);
                          v111 = v125;
                          v112 = v124;
                          v113 = v123;
                          v114 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v122, 4));
                          WORD1(v115) = v113;
                          LOBYTE(v115) = v112;
                          v12 = -[HAPAccessoryProtocolInfo initWithIdentifier:currentStateNumber:currentConfigNumber:modelName:protocolVersion:authMethods:statusFlags:categoryIdentifier:setupHash:](v116, "initWithIdentifier:currentStateNumber:currentConfigNumber:modelName:protocolVersion:authMethods:statusFlags:categoryIdentifier:setupHash:", v121, v108, v109, v120, v110, v111, v115, v114);

                          v27 = 0;
                          v94 = v117;
                        }
                        else
                        {
                          v12 = 0;
                          v27 = -6743;
                        }

                        if (!v27)
                        {
                          v11 = v22;
                          goto LABEL_42;
                        }
                        goto LABEL_37;
                      }
                      v27 = -6743;
                    }

                    goto LABEL_36;
                  }
                  v27 = -6743;
                }

                goto LABEL_54;
              }
              v27 = -6743;
            }

            goto LABEL_36;
          }
          v27 = -6743;
        }

        goto LABEL_35;
      }
      v27 = -6743;
    }
LABEL_54:

    goto LABEL_24;
  }
  v11 = a1;
  v29 = sub_10007CCE4((uint64_t)v11, v28);
  v12 = objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v30 = sub_10007CD2C(v11);
    v15 = objc_claimAutoreleasedReturnValue(v30);
    *(_DWORD *)buf = 138543362;
    v137 = v15;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed parsing headers", buf, 0xCu);
    goto LABEL_40;
  }
LABEL_41:

  v12 = 0;
LABEL_42:

  return v12;
}

+ (id)logCategory
{
  if (qword_100271658 != -1)
    dispatch_once(&qword_100271658, &stru_100236BB8);
  return (id)qword_100271660;
}

@end
