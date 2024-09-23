@implementation BAADelegateImpl

+ (BOOL)isInternal
{
  if (qword_10032A800 != -1)
    dispatch_once(&qword_10032A800, &stru_1002E5078);
  return byte_10032A7F9;
}

+ (int)generateSigKey:(unsigned int)a3 keyData:(id *)a4 attestation:(id *)a5 pubKey:(id *)a6
{
  unsigned int *v10;
  unsigned int *v11;
  uint64_t v12;
  uint64_t v13;
  NSData *v14;
  NSData *v15;
  uint64_t v16;
  NSData *v17;
  NSData *v18;
  NSData *v19;
  NSData *v20;
  NSData *v21;
  NSData *v22;
  NSData *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  size_t outputStructCnt;
  uint64_t inputStruct;
  unsigned int v31;

  v31 = 0;
  outputStructCnt = 0;
  inputStruct = 0;
  if (!a4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100018454();
    goto LABEL_21;
  }
  if (!a5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_1000184E4();
    goto LABEL_21;
  }
  if (!a6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100018574();
LABEL_21:
    v24 = 4294967292;
    goto LABEL_14;
  }
  v10 = (unsigned int *)malloc_type_calloc(0x4000uLL, 1uLL, 0xD72640C9uLL);
  if (v10)
  {
    v11 = v10;
    v12 = sub_10000AC40();
    if ((_DWORD)v12)
    {
      v24 = v12;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_1000189F4();
      goto LABEL_13;
    }
    LODWORD(inputStruct) = 1397966179;
    WORD2(inputStruct) = 18;
    v31 = a3;
    outputStructCnt = 0x4000;
    v13 = IOConnectCallStructMethod(dword_10032A7B4, 0, &inputStruct, 0xCuLL, v11, &outputStructCnt);
    if ((_DWORD)v13)
    {
      v24 = v13;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_100018964();
      goto LABEL_13;
    }
    if (outputStructCnt <= 0xB)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_100018694();
    }
    else
    {
      if (outputStructCnt == *v11 + (unint64_t)v11[1] + v11[2] + 12)
      {
        v14 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v11 + 3);
        if (v14)
        {
          v15 = v14;
          v16 = (uint64_t)v11 + *v11 + 12;
          v17 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v16, v11[1]);
          if (v17)
          {
            v18 = v17;
            v19 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v16 + v11[1], v11[2]);
            if (v19)
            {
              v20 = v19;
              v21 = objc_retainAutorelease(v15);
              *a4 = v21;
              v22 = objc_retainAutorelease(v18);
              *a5 = v22;
              v23 = objc_retainAutorelease(v20);
              *a6 = v23;

              v24 = 0;
LABEL_13:
              free(v11);
              goto LABEL_14;
            }
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
              sub_100018844();

          }
          else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            sub_1000187B4();
          }

        }
        else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          sub_100018724();
        }
        v24 = 4294967291;
        goto LABEL_13;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_1000188D4();
    }
    v24 = 4294967290;
    goto LABEL_13;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100018604();
  v24 = 4294967291;
LABEL_14:
  sub_10000B1F8((uint64_t)"generateSigKey", v24, 0, 0, 0, v25, v26, v27);
  return v24;
}

+ (int)setSigKey:(unsigned int)a3 expirationDate:(unint64_t)a4 keyData:(id)a5 certificates:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  char *v13;
  char *v14;
  uint64_t v15;
  char *v16;
  id v17;
  id v18;
  id v19;
  char *v20;
  uint64_t v21;
  void *i;
  void *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];

  v9 = a5;
  v10 = a6;
  v11 = v9;
  v12 = v10;
  v13 = (char *)malloc_type_calloc(0x4000uLL, 1uLL, 0xE63C3C98uLL);
  if (!v13)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100018A84();
    v27 = 4294967291;
    goto LABEL_32;
  }
  v14 = v13;
  v15 = sub_10000AC40();
  if ((_DWORD)v15)
  {
    v27 = v15;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100018DE4();
    goto LABEL_31;
  }
  *(_DWORD *)v14 = 1397966179;
  *((_WORD *)v14 + 2) = 19;
  *((_DWORD *)v14 + 2) = a3;
  *(_QWORD *)(v14 + 12) = a4;
  v16 = v14 + 28;
  if (v11)
  {
    if ((unint64_t)objc_msgSend(v11, "length") >= 0x3FE5)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_100018D54();
      v27 = 4294967292;
      goto LABEL_31;
    }
    *((_DWORD *)v14 + 5) = objc_msgSend(v11, "length");
    objc_msgSend(v11, "getBytes:length:", v14 + 28, objc_msgSend(v11, "length"));
    v16 = (char *)objc_msgSend(v11, "length") + (_QWORD)v16;
  }
  else
  {
    *((_DWORD *)v14 + 5) = 0;
  }
  if (!objc_msgSend(v12, "count"))
  {
    *((_DWORD *)v14 + 6) = 0;
    goto LABEL_20;
  }
  *((_DWORD *)v14 + 6) = objc_msgSend(v12, "count");
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v33 = v12;
  v17 = v12;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (!v18)
    goto LABEL_18;
  v19 = v18;
  v20 = v14 + 0x4000;
  v21 = *(_QWORD *)v35;
  while (2)
  {
    for (i = 0; i != v19; i = (char *)i + 1)
    {
      if (*(_QWORD *)v35 != v21)
        objc_enumerationMutation(v17);
      v23 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
      v24 = objc_opt_class(NSData);
      if ((objc_opt_isKindOfClass(v23, v24) & 1) == 0)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          sub_100018CC4();
        goto LABEL_30;
      }
      if ((unint64_t)(v20 - v16) <= 3)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          sub_100018BA4();
        goto LABEL_30;
      }
      *(_DWORD *)v16 = objc_msgSend(v23, "length");
      v25 = v16 + 4;
      if ((unint64_t)objc_msgSend(v23, "length") > v20 - v25)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          sub_100018C34();
LABEL_30:

        v27 = 4294967292;
        v12 = v33;
        goto LABEL_31;
      }
      objc_msgSend(v23, "getBytes:length:", v25, objc_msgSend(v23, "length"));
      v16 = (char *)objc_msgSend(v23, "length") + (_QWORD)v25;
    }
    v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v19)
      continue;
    break;
  }
LABEL_18:

  v12 = v33;
LABEL_20:
  v26 = IOConnectCallStructMethod(dword_10032A7B4, 0, v14, v16 - v14, 0, 0);
  v27 = 0;
  if ((_DWORD)v26)
  {
    v28 = v26;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100018B14();
    v27 = v28;
  }
LABEL_31:
  free(v14);
LABEL_32:
  sub_10000B1F8((uint64_t)"setSigKey", v27, 0, 0, 0, v29, v30, v31);

  return v27;
}

+ (int)getSigKeyExpDate:(unsigned int)a3 expirationDate:(unint64_t *)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  size_t v13;
  unint64_t outputStruct;
  uint64_t inputStruct;
  unsigned int v16;

  v16 = 0;
  outputStruct = 0;
  inputStruct = 0;
  v13 = 0;
  if (a4)
  {
    v6 = sub_10000AC40();
    if ((_DWORD)v6)
    {
      v11 = v6;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_100019024();
    }
    else
    {
      LODWORD(inputStruct) = 1397966179;
      WORD2(inputStruct) = 20;
      v16 = a3;
      v13 = 8;
      v7 = IOConnectCallStructMethod(dword_10032A7B4, 0, &inputStruct, 0xCuLL, &outputStruct, &v13);
      if ((_DWORD)v7)
      {
        v11 = v7;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          sub_100018F94();
      }
      else if (v13 == 8)
      {
        v11 = 0;
        *a4 = outputStruct;
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          sub_100018F04();
        v11 = 4294967290;
      }
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100018E74();
    v11 = 4294967292;
  }
  sub_10000B1F8((uint64_t)"getSigKeyExpDate", v11, 0, 0, 0, v8, v9, v10);
  return v11;
}

+ (int)getSigKeyCertificates:(unsigned int)a3 certificates:(id *)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v15;
  id v16;
  size_t outputStructCnt;
  uint64_t inputStruct;
  unsigned int v19;

  v19 = 0;
  outputStructCnt = 0;
  inputStruct = 0;
  v16 = 0;
  if (a4)
  {
    v6 = malloc_type_calloc(0x4000uLL, 1uLL, 0x7CCF5ECFuLL);
    if (v6)
    {
      v7 = v6;
      v8 = sub_10000AC40();
      if ((_DWORD)v8)
      {
        v10 = v8;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          sub_1000192F4();
      }
      else
      {
        LODWORD(inputStruct) = 1397966179;
        WORD2(inputStruct) = 25;
        v19 = a3;
        outputStructCnt = 0x4000;
        v9 = IOConnectCallStructMethod(dword_10032A7B4, 0, &inputStruct, 0xCuLL, v7, &outputStructCnt);
        if ((_DWORD)v9)
        {
          v10 = v9;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            sub_100019264();
        }
        else
        {
          v15 = 0;
          v10 = sub_10000C708((int *)v7, (unint64_t)v7 + outputStructCnt, &v16, &v15);
          if ((_DWORD)v10)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
              sub_1000191D4();
            if (v16)
              CFRelease(v16);
          }
          else
          {
            *a4 = v16;
          }
        }
      }
      free(v7);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_100019144();
      v10 = 4294967291;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_1000190B4();
    v10 = 4294967292;
  }
  sub_10000B1F8((uint64_t)"getSigKeyCertificates", v10, 0, 0, 0, v11, v12, v13);
  return v10;
}

+ (int)confirmSigKey:(unsigned int)a3 status:(int)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;

  v13 = 0;
  v14 = 0;
  v6 = sub_10000AC40();
  if ((_DWORD)v6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100019414();
  }
  else
  {
    LODWORD(v13) = 1397966179;
    WORD2(v13) = 21;
    v14 = __PAIR64__(a4, a3);
    v7 = IOConnectCallStructMethod(dword_10032A7B4, 0, &v13, 0x10uLL, 0, 0);
    if ((_DWORD)v7)
    {
      v12 = v7;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_100019384();
      v6 = v12;
    }
  }
  sub_10000B1F8((uint64_t)"confirmSigKey", v6, 0, 0, 0, v8, v9, v10);
  return v6;
}

+ (int)getBlessedUser:(unsigned int *)a3 keybagUUID:(unsigned __int8)a4[16]
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  size_t v13;
  uint64_t inputStruct;
  _BYTE outputStruct[20];

  inputStruct = 0;
  memset(outputStruct, 0, sizeof(outputStruct));
  v13 = 0;
  if (!a3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_1000194A4();
    goto LABEL_12;
  }
  if (!a4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100019534();
LABEL_12:
    v11 = 4294967292;
    goto LABEL_7;
  }
  v6 = sub_10000AC40();
  if ((_DWORD)v6)
  {
    v11 = v6;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_1000196E4();
  }
  else
  {
    LODWORD(inputStruct) = 1397966179;
    WORD2(inputStruct) = 24;
    v13 = 20;
    v7 = IOConnectCallStructMethod(dword_10032A7B4, 0, &inputStruct, 8uLL, outputStruct, &v13);
    if ((_DWORD)v7)
    {
      v11 = v7;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_100019654();
    }
    else if (v13 == 20)
    {
      v11 = 0;
      *a3 = *(_DWORD *)outputStruct;
      *(_OWORD *)a4 = *(_OWORD *)&outputStruct[4];
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_1000195C4();
      v11 = 4294967290;
    }
  }
LABEL_7:
  sub_10000B1F8((uint64_t)"getBlessedUser", v11, 0, 0, 0, v8, v9, v10);
  return v11;
}

@end
