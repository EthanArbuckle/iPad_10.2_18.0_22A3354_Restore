@implementation HAPPairingUtilities

+ (id)createAddPairingRequestForPairingIdentity:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  uint64_t appended;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v19;
  _OWORD v20[21];

  v5 = a3;
  memset(v20, 0, sizeof(v20));
  TLV8BufferInit(v20, 16000);
  appended = sub_100022C34((uint64_t)v20, 3u);
  if ((_DWORD)appended)
    goto LABEL_6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dataUsingEncoding:", 4));

  if (!v9)
  {
    appended = 4294960568;
LABEL_14:

    goto LABEL_6;
  }
  v10 = objc_retainAutorelease(v9);
  v11 = TLV8BufferAppend(v20, 1, objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"));
  if ((_DWORD)v11)
  {
    appended = v11;
    goto LABEL_14;
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "publicKey"));
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "data")));
  v14 = objc_msgSend(v13, "bytes");
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "data"));
  appended = TLV8BufferAppend(v20, 3, v14, objc_msgSend(v15, "length"));

  if (!(_DWORD)appended)
  {
    appended = TLV8BufferAppendUInt64(v20, 11, (unint64_t)objc_msgSend(v5, "permissions") & 1);
    if (!(_DWORD)appended)
    {
      v19 = objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v20[0]));
      if (v19)
      {
        v17 = (void *)v19;
        TLV8BufferFree(v20, v6);
        goto LABEL_9;
      }
      appended = 4294960568;
    }
  }
LABEL_6:
  TLV8BufferFree(v20, v6);
  if (a4)
  {
    v16 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithOSStatus:](NSError, "errorWithOSStatus:", appended));
    v17 = 0;
    *a4 = v16;
  }
  else
  {
    v17 = 0;
  }
LABEL_9:

  return v17;
}

+ (BOOL)parseAddPairingResponse:(id)a3 error:(id *)a4
{
  uint64_t v5;
  int v6;

  v5 = sub_100022CCC(a3);
  v6 = v5;
  if (a4 && (_DWORD)v5)
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithOSStatus:](NSError, "errorWithOSStatus:", v5));
  return v6 == 0;
}

+ (id)createRemovePairingRequestForPairingIdentity:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  _OWORD v15[21];

  v5 = a3;
  memset(v15, 0, sizeof(v15));
  TLV8BufferInit(v15, 16000);
  v7 = sub_100022C34((uint64_t)v15, 4u);
  if ((_DWORD)v7)
    goto LABEL_2;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dataUsingEncoding:", 4));

  if (!v10)
  {
    v7 = 4294960568;
LABEL_11:

    goto LABEL_2;
  }
  v11 = objc_retainAutorelease(v10);
  v12 = TLV8BufferAppend(v15, 1, objc_msgSend(v11, "bytes"), objc_msgSend(v11, "length"));
  if ((_DWORD)v12)
  {
    v7 = v12;
    goto LABEL_11;
  }

  v13 = objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v15[0]));
  if (v13)
  {
    v8 = (void *)v13;
    TLV8BufferFree(v15, v6);
    goto LABEL_8;
  }
  v7 = 4294960568;
LABEL_2:
  TLV8BufferFree(v15, v6);
  v8 = 0;
  if (a4)
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithOSStatus:](NSError, "errorWithOSStatus:", v7));
LABEL_8:

  return v8;
}

+ (BOOL)parseRemovePairingResponse:(id)a3 error:(id *)a4
{
  uint64_t v5;
  int v6;

  v5 = sub_100022CCC(a3);
  v6 = v5;
  if (a4 && (_DWORD)v5)
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithOSStatus:](NSError, "errorWithOSStatus:", v5));
  return v6 == 0;
}

+ (id)createListPairingsRequest:(id *)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  void *v8;
  _OWORD v9[21];

  memset(v9, 0, sizeof(v9));
  TLV8BufferInit(v9, 16000);
  v5 = sub_100022C34((uint64_t)v9, 5u);
  if (!(_DWORD)v5)
  {
    v7 = objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v9[0]));
    if (v7)
    {
      v8 = (void *)v7;
      TLV8BufferFree(v9, v4);
      return v8;
    }
    v5 = 4294960568;
  }
  TLV8BufferFree(v9, v4);
  if (a3)
    *a3 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithOSStatus:](NSError, "errorWithOSStatus:", v5));
  return 0;
}

+ (id)parseListPairingsResponse:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  char *v7;
  void *v8;
  uint64_t v9;
  id v10;
  char *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  HAPPairingIdentity *v21;
  HAPPairingIdentity *v22;
  int v23;
  void *v25;
  uint64_t v26;
  _BYTE *v27;
  id v28;

  v5 = objc_retainAutorelease(a3);
  v6 = objc_msgSend(v5, "bytes");
  v28 = v6;
  v7 = (char *)objc_msgSend(v5, "length");
  v26 = 0;
  v27 = 0;
  v25 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 16));
  v9 = sub_100022CCC(v5);
  if (!(_DWORD)v9)
  {
    v11 = &v7[(_QWORD)v6];
    while (1)
    {
      v12 = TLV8GetOrCopyCoalesced(v28, v11, 1, &v27, &v26, &v25, 0);
      if ((_DWORD)v12)
      {
        v9 = v12;
        v19 = 0;
        v15 = 0;
        goto LABEL_21;
      }
      v13 = objc_alloc((Class)NSString);
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v27, v26));
      v15 = objc_msgSend(v13, "initWithData:encoding:", v14, 4);

      if (v25)
      {
        free(v25);
        v25 = 0;
      }
      if (!v15)
      {
        v19 = 0;
        v9 = 4294960568;
        goto LABEL_21;
      }
      v16 = TLV8GetOrCopyCoalesced(v28, v11, 3, &v27, &v26, &v25, 0);
      if ((_DWORD)v16)
      {
        v9 = v16;
        v19 = 0;
        goto LABEL_21;
      }
      v17 = objc_alloc((Class)HMFPairingKey);
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v27, v26));
      v19 = objc_msgSend(v17, "initWithPairingKeyData:", v18);

      if (v25)
      {
        free(v25);
        v25 = 0;
      }
      if (!v19)
      {
LABEL_24:
        v9 = 4294960596;
        goto LABEL_21;
      }
      v20 = TLV8Get(v28, v11, 11, &v27, &v26, 0);
      if ((_DWORD)v20)
      {
        v9 = v20;
        goto LABEL_21;
      }
      if (!v26)
        break;
      v21 = -[HAPPairingIdentity initWithIdentifier:publicKey:privateKey:permissions:]([HAPPairingIdentity alloc], "initWithIdentifier:publicKey:privateKey:permissions:", v15, v19, 0, *v27 & 1);
      if (!v21)
        goto LABEL_24;
      v22 = v21;
      objc_msgSend(v8, "addObject:", v21);
      v23 = TLV8Get(v28, v11, 255, &v27, &v26, &v28);

      if (v23)
      {
        v10 = objc_msgSend(v8, "copy");
        goto LABEL_23;
      }
    }
    v9 = 4294960553;
LABEL_21:

    if (a4)
      goto LABEL_3;
LABEL_22:
    v10 = 0;
    goto LABEL_23;
  }
  if (!a4)
    goto LABEL_22;
LABEL_3:
  v10 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithOSStatus:](NSError, "errorWithOSStatus:", v9));
LABEL_23:

  return v10;
}

@end
