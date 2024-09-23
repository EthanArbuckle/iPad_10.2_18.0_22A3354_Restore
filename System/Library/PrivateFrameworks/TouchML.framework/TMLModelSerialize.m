@implementation TMLModelSerialize

+ (id)pack:(const ProtobufCMessage *)a3
{
  CFIndex v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  double v9;
  void (*v11)(uint64_t, CFIndex, UInt8 *);
  CFTypeRef cf;

  v4 = sub_22AD35ABC((uint64_t)a3);
  if (!v4)
    return 0;
  v11 = sub_22AD768D0;
  cf = CFDataCreateMutable(0, v4);
  v6 = sub_22AD36F48(a3, &v11, v5);
  v7 = (id)cf;
  objc_msgSend_setLength_(v7, v8, v9, v6, v11);
  CFRelease(cf);
  return v7;
}

+ (ProtobufCMessage)unpackData:(id)a3 withDescriptor:(const ProtobufCMessageDescriptor *)a4
{
  id v5;
  const char *v6;
  double v7;
  unint64_t v8;
  id v9;
  const char *v10;
  double v11;
  char *v12;

  v5 = a3;
  v8 = objc_msgSend_length(v5, v6, v7);
  v9 = objc_retainAutorelease(v5);
  v12 = (char *)objc_msgSend_bytes(v9, v10, v11);

  return (ProtobufCMessage *)sub_22AD37E4C((uint64_t)a4, 0, v8, v12);
}

+ (id)decode:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  const char *v9;
  double v10;
  id v11;
  const char *v12;
  double v13;
  void *v14;
  const char *v15;
  double v16;
  const char *v17;
  double v18;
  void *v19;
  const char *v20;
  double v21;
  void *v22;
  const char *v23;
  double v24;
  id v25;
  uint64_t v26;
  const char *v27;
  double v28;
  void *v29;
  const char *v30;
  double v31;
  void *v32;
  const char *v33;
  double v34;
  const char *v35;
  double v36;
  _BYTE *v37;
  const char *v38;
  double v39;
  uint64_t i;

  v4 = a3;
  if (!objc_msgSend_length(v4, v5, v6))
    goto LABEL_12;
  v4 = objc_retainAutorelease(v4);
  if (*(_BYTE *)objc_msgSend_bytes(v4, v7, v8))
  {
    v11 = objc_alloc(MEMORY[0x24BDD17C8]);
    v14 = (void *)objc_msgSend_initWithData_encoding_(v11, v12, v13, v4, 5);
    if (objc_msgSend_hasPrefix_(v14, v15, v16, CFSTR("83847776")))
    {
      objc_msgSend_substringFromIndex_(v14, v17, v18, 8);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_decodeZ85_(a1, v20, v21, v19);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_verifySignature_(a1, v23, v24, v22);
      v25 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v25 = 0;
    }

    goto LABEL_13;
  }
  v26 = objc_msgSend_length(v4, v9, v10);
  objc_msgSend_subdataWithRange_(v4, v27, v28, 1, v26 - 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_verifySignature_(a1, v30, v31, v29);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v32)
  {
    v4 = 0;
LABEL_12:
    v25 = 0;
    goto LABEL_13;
  }
  v25 = objc_retainAutorelease((id)objc_msgSend_mutableCopy(v32, v33, v34));
  v37 = (_BYTE *)objc_msgSend_mutableBytes(v25, v35, v36);
  for (i = objc_msgSend_length(v25, v38, v39); i; --i)
    *v37++ ^= 0x3Au;
  v4 = v32;
LABEL_13:

  return v25;
}

+ (id)decodeZ85:(id)a3
{
  id v3;
  const char *v4;
  double v5;
  const char *v6;
  size_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  const char *v11;
  double v12;
  const char *v13;
  void *v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  unsigned int v21;
  unsigned int v22;
  const char *v23;
  unint64_t v24;
  uint64_t v25;
  const char *v26;
  double v27;
  unsigned int v28;
  void *v29;
  unsigned int v31;
  unsigned int v32;

  v3 = objc_retainAutorelease(a3);
  v6 = (const char *)objc_msgSend_cStringUsingEncoding_(v3, v4, v5, 4);
  v7 = strlen(v6);
  v8 = v7 / 5;
  v9 = 4 * (v7 / 5);
  v10 = v7 % 5;
  objc_msgSend_dataWithLength_(MEMORY[0x24BDBCEC8], v11, v12, v7 % 5 + v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 >= 5)
  {
    v17 = 0;
    if (v8 <= 1)
      v18 = 1;
    else
      v18 = v8;
    v19 = v6;
    do
    {
      v20 = 0;
      v21 = 0;
      do
        v21 = byte_22AD83A70[v19[v20++]] + 85 * v21;
      while (v20 != 5);
      v32 = bswap32(v21);
      objc_msgSend_replaceBytesInRange_withBytes_(v14, v13, v15, 4 * v17++, 4, &v32);
      v19 += 5;
    }
    while (v17 != v18);
    v16 = 4 * v18;
    if (!v10)
      goto LABEL_17;
  }
  else
  {
    v16 = 0;
    if (!v10)
      goto LABEL_17;
  }
  v22 = 0;
  v23 = &v6[5 * v8];
  v24 = v10;
  do
  {
    v25 = *v23++;
    v22 = byte_22AD83A70[v25] + 85 * v22;
    --v24;
  }
  while (v24);
  v27 = pow(85.0, (double)(5 - v10)) * (double)v22;
  v28 = 0xFFFFFFu >> (8 * v10 - 16);
  if (v10 <= 1)
    v28 = 0;
  v31 = bswap32(v28 + v27);
  objc_msgSend_replaceBytesInRange_withBytes_(v14, v26, v27, v9, 4, &v31);
  v16 = v10 + v16 - 1;
LABEL_17:
  objc_msgSend_subdataWithRange_(v14, v13, v15, 0, v16);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

+ (id)verifySignature:(id)a3
{
  id v3;
  id v4;
  const char *v5;
  double v6;
  const uint8_t *v7;
  const char *v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  double v13;
  void *v14;
  _OWORD v16[4];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (qword_255B51CD8 != -1)
    dispatch_once(&qword_255B51CD8, &unk_24F503E48);
  if (qword_255B51CD0
    && (v4 = objc_retainAutorelease(v3),
        v7 = (const uint8_t *)objc_msgSend_bytes(v4, v5, v6),
        v10 = objc_msgSend_length(v4, v8, v9),
        v11 = v10 - 128,
        memset(v16, 0, sizeof(v16)),
        CC_SHA512(v7 + 128, v10 - 128, (unsigned __int8 *)v16),
        !SecKeyRawVerify((SecKeyRef)qword_255B51CD0, 0x8006u, (const uint8_t *)v16, 0x40uLL, v7, 0x80uLL)))
  {
    objc_msgSend_subdataWithRange_(v4, v12, v13, 128, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

@end
