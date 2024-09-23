@implementation NSUUID

- (int64_t)crl_compare:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  int v7;
  BOOL v8;
  BOOL v9;
  int64_t v10;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;

  v14 = 0;
  v15 = 0;
  v12 = 0;
  v13 = 0;
  v4 = a3;
  -[NSUUID getUUIDBytes:](self, "getUUIDBytes:", &v14);
  objc_msgSend(v4, "getUUIDBytes:", &v12);

  v5 = bswap64(v14);
  v6 = bswap64(v12);
  if (v5 == v6 && (v5 = bswap64(v15), v6 = bswap64(v13), v5 == v6))
  {
    v7 = 0;
  }
  else if (v5 < v6)
  {
    v7 = -1;
  }
  else
  {
    v7 = 1;
  }
  v8 = v7 == 0;
  v9 = v7 < 0;
  v10 = -1;
  if (!v9)
    v10 = 1;
  if (v8)
    return 0;
  else
    return v10;
}

- (id)combineUUIDWithUUID:(id)a3
{
  return -[NSUUID combineUUIDWithUUID:mixValue:](self, "combineUUIDWithUUID:mixValue:", a3, 0xFFFFFFFFLL);
}

- (id)combineUUIDWithUUID:(id)a3 mixValue:(unsigned int)a4
{
  id v6;
  int8x8_t v7;
  int8x16_t v8;
  int16x8_t v9;
  id v10;
  int8x16_t v12;
  int8x16_t v13;
  int8x16_t v14;

  v6 = a3;
  -[NSUUID getUUIDBytes:](self, "getUUIDBytes:", &v14);
  objc_msgSend(v6, "getUUIDBytes:", &v13);
  v7.i32[1] = v13.i32[1];
  v8 = veorq_s8(v13, v14);
  v12 = v8;
  if (a4 != -1)
  {
    v8.i32[0] = v12.i32[0];
    v9 = (int16x8_t)vmovl_u8(*(uint8x8_t *)v8.i8);
    v7.i32[0] = a4;
    *(int8x8_t *)v9.i8 = veor_s8(*(int8x8_t *)v9.i8, vzip1_s8(v7, *(int8x8_t *)v9.i8));
    v12.i32[0] = vmovn_s16(v9).u32[0];
  }
  v10 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", &v12);

  return v10;
}

+ (id)crl_uuidByCryptographicHashOfString:(id)a3
{
  __CFString *v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  CC_LONG v13;
  id v14;
  id v15;
  _BYTE *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;

  v3 = (__CFString *)a3;
  v4 = v3;
  if (!v3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101245448);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0DDEC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101245468);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[NSUUID(NSUUID_CRLAdditions) crl_uuidByCryptographicHashOfString:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/NSUUID_CRLAdditions.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 67, 0, "invalid nil value for '%{public}s'", "string");

    v4 = &stru_1012A72B0;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("com.apple.Freeform"), "stringByAppendingString:", v4));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dataUsingEncoding:", 4));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", 32));
  v11 = objc_retainAutorelease(v9);
  v12 = objc_msgSend(v11, "bytes");
  v13 = objc_msgSend(v11, "length");
  v14 = objc_retainAutorelease(v10);
  CC_SHA256(v12, v13, (unsigned __int8 *)objc_msgSend(v14, "mutableBytes"));
  v15 = objc_retainAutorelease(v14);
  v16 = objc_msgSend(v15, "mutableBytes");
  v16[6] = v16[6] & 0xF | 0x50;
  v16[8] = v16[8] & 0x3F | 0x80;
  if ((unint64_t)objc_msgSend(v15, "length") <= 0xF)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101245488);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0DD50();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012454A8);
    v17 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[NSUUID(NSUUID_CRLAdditions) crl_uuidByCryptographicHashOfString:]"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/NSUUID_CRLAdditions.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, v19, 84, 0, "SHA256 hash should return 32(CC_SHA256_DIGEST_LENGTH) bytes.");

  }
  v20 = objc_alloc((Class)NSUUID);
  v21 = objc_retainAutorelease(v15);
  v22 = objc_msgSend(v20, "initWithUUIDBytes:", objc_msgSend(v21, "bytes"));

  return v22;
}

- (id)crl_combineCryptographicallyWithString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;
  id v9;
  NSUUID *v10;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](self, "UUIDString"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), v5, v4));

    *(_QWORD *)&v8 = objc_opt_class(self, v7).n128_u64[0];
    v10 = (NSUUID *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "crl_uuidByCryptographicHashOfString:", v6, v8));

  }
  else
  {
    v10 = self;
  }

  return v10;
}

@end
