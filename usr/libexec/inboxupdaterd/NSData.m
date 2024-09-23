@implementation NSData

+ (id)generateRandomBytesOfSize:(unint64_t)a3
{
  void *v4;
  unint64_t v5;
  unsigned int v6;
  uint32_t v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithCapacity:](NSMutableData, "dataWithCapacity:"));
  if (a3 >= 4)
  {
    v5 = a3 >> 2;
    v6 = 1;
    do
    {
      v9 = 0;
      v9 = arc4random();
      objc_msgSend(v4, "appendBytes:length:", &v9, 4);
    }
    while (v5 > v6++);
  }
  return v4;
}

+ (NSData)dataWithHexString:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  _BYTE *v11;
  _BYTE *v12;
  int v13;
  unsigned __int8 *v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char __str[3];

  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  v5 = (uint64_t)v4;
  if (v4 && (v4 & 1) == 0)
  {
    v6 = objc_alloc((Class)NSMutableData);
    if (v5 >= 0)
      v7 = v5;
    else
      v7 = v5 + 1;
    v8 = objc_msgSend(v6, "initWithLength:", v7 >> 1);
    v9 = v8;
    if (v8)
    {
      v10 = objc_retainAutorelease(v8);
      v11 = objc_msgSend(v10, "mutableBytes");
      v12 = objc_msgSend(objc_retainAutorelease(v3), "UTF8String");
      __str[2] = 0;
      v13 = *v12;
      if (!*v12)
      {
LABEL_14:
        v16 = objc_msgSend(v10, "copy");
LABEL_25:

        goto LABEL_26;
      }
      v14 = v12 + 2;
      while (1)
      {
        __str[0] = v13;
        v15 = *(v14 - 1);
        __str[1] = *(v14 - 1);
        if ((v13 & 0x80) != 0)
          break;
        v16 = 0;
        if ((_DefaultRuneLocale.__runetype[v13] & 0x10000) == 0 || (char)v15 < 0)
          goto LABEL_25;
        if ((_DefaultRuneLocale.__runetype[v15] & 0x10000) == 0)
          break;
        *v11++ = strtoul(__str, 0, 16);
        v13 = *v14;
        v14 += 2;
        if (!v13)
          goto LABEL_14;
      }
    }
    else
    {
      if (qword_100068958 != -1)
        dispatch_once(&qword_100068958, &stru_1000577D8);
      v18 = qword_100068950;
      if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
        sub_10003CD80(v18, v19, v20, v21, v22, v23, v24, v25);
    }
    v16 = 0;
    goto LABEL_25;
  }
  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_1000577B8);
  v17 = qword_100068950;
  if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
    sub_10003CDB0((uint64_t)v3, v5, v17);
  v16 = 0;
LABEL_26:

  return (NSData *)v16;
}

@end
