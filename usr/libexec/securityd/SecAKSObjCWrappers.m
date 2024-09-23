@implementation SecAKSObjCWrappers

+ (BOOL)aksDecryptWithKeybag:(int)a3 keyclass:(int)a4 ciphertext:(id)a5 outKeyclass:(int *)a6 plaintext:(id)a7 personaId:(const void *)a8 personaIdLength:(unint64_t)a9 error:(id *)a10
{
  const void *v13;
  uint64_t v14;
  id v15;
  __CFData *v16;
  unsigned int v17;
  id v18;
  const UInt8 *v19;
  char v20;
  BOOL v21;
  id v22;
  id v24;

  v13 = *(const void **)&a4;
  v14 = *(_QWORD *)&a3;
  v15 = a5;
  v16 = (__CFData *)a7;
  v24 = 0;
  v17 = objc_msgSend(v15, "length");
  v18 = objc_retainAutorelease(v15);
  v19 = (const UInt8 *)objc_msgSend(v18, "bytes");
  if (a8)
    v20 = sub_100145D80(CFSTR("od"), v14, v13, v17, v19, a6, v16, (uint64_t)a8, a9, (__CFString **)&v24);
  else
    v20 = sub_10001567C(CFSTR("od"), v14, 0, (uint64_t)v13, v17, v19, a6, v16, 0, (__CFString **)&v24);
  v21 = v20;
  v22 = v24;
  if (a10)
  {
    *a10 = v24;
  }
  else if (v24)
  {
    v24 = 0;
    CFRelease(v22);
  }

  return v21;
}

+ (BOOL)aksEncryptWithKeybag:(int)a3 keyclass:(int)a4 plaintext:(id)a5 outKeyclass:(int *)a6 ciphertext:(id)a7 personaId:(const void *)a8 personaIdLength:(unint64_t)a9 error:(id *)a10
{
  const void *v13;
  uint64_t v14;
  id v15;
  __CFData *v16;
  unsigned int v17;
  id v18;
  const UInt8 *v19;
  char v20;
  BOOL v21;
  id v22;
  id v24;

  v13 = *(const void **)&a4;
  v14 = *(_QWORD *)&a3;
  v15 = a5;
  v16 = (__CFData *)a7;
  v24 = 0;
  v17 = objc_msgSend(v15, "length");
  v18 = objc_retainAutorelease(v15);
  v19 = (const UInt8 *)objc_msgSend(v18, "bytes");
  if (a8)
    v20 = sub_100145D80(CFSTR("oe"), v14, v13, v17, v19, a6, v16, (uint64_t)a8, a9, (__CFString **)&v24);
  else
    v20 = sub_10001567C(CFSTR("oe"), v14, 0, (uint64_t)v13, v17, v19, a6, v16, 0, (__CFString **)&v24);
  v21 = v20;
  v22 = v24;
  if (a10)
  {
    *a10 = v24;
  }
  else if (v24)
  {
    v24 = 0;
    CFRelease(v22);
  }

  return v21;
}

@end
