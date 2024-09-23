@implementation CKKSAESSIVKey

- (CKKSAESSIVKey)init
{
  CKKSAESSIVKey *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKKSAESSIVKey;
  result = -[CKKSBaseAESSIVKey init](&v3, "init");
  if (result)
    result->super.size = 64;
  return result;
}

- (CKKSAESSIVKey)initWithBytes:(char *)a3 len:(unint64_t)a4
{
  void *v5;
  id v6;
  objc_super v7;

  if (a4 != 64)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("length (%lu) was not %d"), a4, 64));
    v6 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("WrongKeySizeException"), v5, 0));

    objc_exception_throw(v6);
  }
  v7.receiver = self;
  v7.super_class = (Class)CKKSAESSIVKey;
  return -[CKKSBaseAESSIVKey initWithBytes:len:](&v7, "initWithBytes:len:", a3);
}

- (CKKSAESSIVKey)initWithBase64:(id)a3
{
  id v4;
  CKKSAESSIVKey *v5;
  CKKSAESSIVKey *v6;
  void *v8;
  id v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CKKSAESSIVKey;
  v5 = -[CKKSBaseAESSIVKey initWithBase64:](&v10, "initWithBase64:", v4);
  v6 = v5;
  if (v5 && v5->super.size != 64)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("length (%lu) was not %d"), v5->super.size, 64));
    v9 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("WrongKeySizeException"), v8, 0));

    objc_exception_throw(v9);
  }

  return v6;
}

- (id)wrapAESKey:(id)a3 error:(id *)a4
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  unsigned int v10;
  CKKSWrappedAESSIVKey *v11;
  void *v12;
  id v13;
  void *v14;
  void *v16;
  NSErrorUserInfoKey v17;
  const __CFString *v18;
  _OWORD __s[5];

  v6 = a3;
  if (!v6)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", NSOSStatusErrorDomain, -50, CFSTR("No key given")));
    v12 = v14;
    if (!a4)
    {
      v11 = 0;
      goto LABEL_12;
    }
    v13 = objc_retainAutorelease(v14);
    v12 = v13;
    v11 = 0;
    goto LABEL_10;
  }
  memset(__s, 0, sizeof(__s));
  v7 = ccaes_siv_encrypt_mode();
  if (ccsiv_ciphertext_size(v7, 64) != 80)
  {
    v17 = NSLocalizedDescriptionKey;
    v18 = CFSTR("wrapped key size does not match key size");
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, -50, v16));

LABEL_15:
    v11 = 0;
    goto LABEL_5;
  }
  v8 = ccaes_siv_encrypt_mode();
  v9 = +[NSData _newZeroingDataWithBytes:length:](NSData, "_newZeroingDataWithBytes:length:", v6 + 1, v6[11]);
  v10 = -[CKKSAESSIVKey doSIV:nonce:text:buffer:bufferLength:authenticatedData:error:](self, "doSIV:nonce:text:buffer:bufferLength:authenticatedData:error:", v8, 0, v9, __s, 80, 0, a4);

  if (!v10)
  {
    v12 = 0;
    goto LABEL_15;
  }
  v11 = -[CKKSWrappedAESSIVKey initWithBytes:len:]([CKKSWrappedAESSIVKey alloc], "initWithBytes:len:", __s, 80);
  v12 = 0;
LABEL_5:
  memset_s(__s, 0x50uLL, 0, 0x40uLL);
  if (a4 && v12)
  {
    v13 = objc_retainAutorelease(v12);
LABEL_10:
    *a4 = v13;
  }
LABEL_12:

  return v11;
}

- (id)unwrapAESKey:(id)a3 error:(id *)a4
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  unsigned int v10;
  CKKSAESSIVKey *v11;
  void *v12;
  void *v14;
  NSErrorUserInfoKey v15;
  const __CFString *v16;
  _OWORD __s[4];

  v6 = a3;
  memset(__s, 0, sizeof(__s));
  v7 = ccaes_siv_decrypt_mode();
  if (ccsiv_plaintext_size(v7, 80) == 64)
  {
    v8 = ccaes_siv_decrypt_mode();
    v9 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytesNoCopy:length:freeWhenDone:", v6 + 1, v6[11], 0);
    v10 = -[CKKSAESSIVKey doSIV:nonce:text:buffer:bufferLength:authenticatedData:error:](self, "doSIV:nonce:text:buffer:bufferLength:authenticatedData:error:", v8, 0, v9, __s, 64, 0, a4);

    if (v10)
      v11 = -[CKKSAESSIVKey initWithBytes:len:]([CKKSAESSIVKey alloc], "initWithBytes:len:", __s, 64);
    else
      v11 = 0;
    v12 = 0;
  }
  else
  {
    v15 = NSLocalizedDescriptionKey;
    v16 = CFSTR("unwrapped key size does not match key size");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, -50, v14));

    v11 = 0;
  }
  memset_s(__s, 0x40uLL, 0, 0x40uLL);
  if (a4 && v12)
    *a4 = objc_retainAutorelease(v12);

  return v11;
}

- (id)encryptData:(id)a3 authenticatedData:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  CCRNGStatus Bytes;
  uint64_t v13;
  void *v14;
  id v15;
  NSErrorUserInfoKey v17;
  const __CFString *v18;

  v8 = a3;
  v9 = a4;
  v10 = ccaes_siv_encrypt_mode();
  v11 = objc_retainAutorelease(objc_msgSend(objc_alloc((Class)NSMutableData), "initWithLength:", 16));
  Bytes = CCRandomGenerateBytes(objc_msgSend(v11, "mutableBytes"), (size_t)objc_msgSend(v11, "length"));
  if (Bytes)
  {
    if (!a5)
    {
      v15 = 0;
      goto LABEL_8;
    }
    v13 = Bytes;
    v17 = NSLocalizedDescriptionKey;
    v18 = CFSTR("IV generation failed");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
    *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("CommonCrypto"), v13, v14));

    v15 = 0;
    goto LABEL_6;
  }
  v15 = objc_retainAutorelease(objc_msgSend(objc_alloc((Class)NSMutableData), "initWithLength:", ccsiv_ciphertext_size(v10, objc_msgSend(v8, "length"))));
  if (!-[CKKSAESSIVKey doSIV:nonce:text:buffer:bufferLength:authenticatedData:error:](self, "doSIV:nonce:text:buffer:bufferLength:authenticatedData:error:", v10, v11, v8, objc_msgSend(v15, "mutableBytes"), objc_msgSend(v15, "length"), v9, a5))
  {
LABEL_6:
    a5 = 0;
    goto LABEL_8;
  }
  a5 = (id *)objc_alloc_init((Class)NSMutableData);
  objc_msgSend(a5, "appendData:", v11);
  objc_msgSend(a5, "appendData:", v15);
LABEL_8:

  return a5;
}

- (id)decryptData:(id)a3 authenticatedData:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id *v12;
  id v13;
  id v14;
  char *v15;
  id v16;
  id v17;
  NSErrorUserInfoKey v19;
  const __CFString *v20;

  v8 = a3;
  v9 = a4;
  v10 = ccaes_siv_decrypt_mode();
  if ((unint64_t)objc_msgSend(v8, "length") > 0x10)
  {
    v15 = (char *)objc_msgSend(v8, "length") - 16;
    v16 = objc_alloc((Class)NSData);
    v17 = objc_retainAutorelease(v8);
    v13 = objc_msgSend(v16, "initWithBytesNoCopy:length:freeWhenDone:", objc_msgSend(v17, "bytes"), 16, 0);
    v14 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytesNoCopy:length:freeWhenDone:", (char *)objc_msgSend(objc_retainAutorelease(v17), "bytes") + 16, v15, 0);
    v12 = (id *)objc_retainAutorelease(objc_msgSend(objc_alloc((Class)NSMutableData), "initWithLength:", ccsiv_plaintext_size(v10, v15)));
    if (-[CKKSAESSIVKey doSIV:nonce:text:buffer:bufferLength:authenticatedData:error:](self, "doSIV:nonce:text:buffer:bufferLength:authenticatedData:error:", v10, v13, v14, objc_msgSend(v12, "mutableBytes"), objc_msgSend(v12, "length"), v9, a5))
    {
      a5 = v12;
      v12 = a5;
    }
    else
    {
      a5 = 0;
    }
  }
  else
  {
    if (a5)
    {
      v19 = NSLocalizedDescriptionKey;
      v20 = CFSTR("ciphertext too short");
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
      *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, 4, v11));

      a5 = 0;
    }
    v12 = 0;
    v13 = 0;
    v14 = 0;
  }

  return a5;
}

- (BOOL)doSIV:(const ccmode_siv *)a3 nonce:(id)a4 text:(id)a5 buffer:(char *)a6 bufferLength:(unint64_t)a7 authenticatedData:(id)a8 error:(id *)a9
{
  id v14;
  id v15;
  id v16;
  unint64_t v17;
  unint64_t v18;
  char *v19;
  _QWORD *v20;
  int v21;
  int v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  void *i;
  void *v30;
  id v31;
  id v32;
  int v33;
  id v34;
  id v35;
  int v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id *v41;
  uint64_t v43;
  const __CFString **v44;
  NSErrorUserInfoKey *v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  id v49;
  id v50;
  uint64_t *v51;
  id *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  NSErrorUserInfoKey v57;
  const __CFString *v58;
  NSErrorUserInfoKey v59;
  const __CFString *v60;
  _BYTE v61[128];
  NSErrorUserInfoKey v62;
  const __CFString *v63;
  NSErrorUserInfoKey v64;
  const __CFString *v65;

  v14 = a4;
  v15 = a5;
  v16 = a8;
  v17 = a3->var0 + 15;
  v18 = v17 & 0xFFFFFFFFFFFFFFF0;
  v19 = (char *)&v47 - (v17 & 0xFFFFFFFFFFFFFFF0);
  if (v17 >= 0x10)
  {
    v20 = (uint64_t *)((char *)&v47 - (v17 & 0xFFFFFFFFFFFFFFF0));
    do
    {
      *v20 = 0xAAAAAAAAAAAAAAAALL;
      v20[1] = 0xAAAAAAAAAAAAAAAALL;
      v20 += 2;
      v18 -= 16;
    }
    while (v18);
  }
  v21 = ccsiv_init(a3, v19, self->super.size, self->super.key);
  v51 = &v47;
  v52 = a9;
  if (v21)
  {
    v43 = v21;
    v64 = NSLocalizedDescriptionKey;
    v65 = CFSTR("could not ccsiv_init");
    v44 = &v65;
    v45 = &v64;
LABEL_25:
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v44, v45, 1));
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("corecrypto"), v43, v40));
    v25 = 0;
    goto LABEL_18;
  }
  if (v14)
  {
    v22 = ccsiv_set_nonce(a3, v19, objc_msgSend(v14, "length"), objc_msgSend(objc_retainAutorelease(v14), "bytes"));
    if (v22)
    {
      v43 = v22;
      v62 = NSLocalizedDescriptionKey;
      v63 = CFSTR("could not ccsiv_set_nonce");
      v44 = &v63;
      v45 = &v62;
      goto LABEL_25;
    }
  }
  v48 = a6;
  v49 = v15;
  v50 = v14;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "allKeys"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "sortedArrayUsingSelector:", "compare:"));

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v25 = v24;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v54;
    while (2)
    {
      for (i = 0; i != v27; i = (char *)i + 1)
      {
        if (*(_QWORD *)v54 != v28)
          objc_enumerationMutation(v25);
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)i)));
        v31 = objc_msgSend(v30, "length");
        v32 = objc_retainAutorelease(v30);
        v33 = ccsiv_aad(a3, v19, v31, objc_msgSend(v32, "bytes"));
        if (v33)
        {
          v38 = v33;
          v59 = NSLocalizedDescriptionKey;
          v60 = CFSTR("could not ccsiv_aad");
          v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1));
          v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("corecrypto"), v38, v39));

          v40 = v25;
          v15 = v49;
          v14 = v50;
          goto LABEL_18;
        }

      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
      if (v27)
        continue;
      break;
    }
  }

  v15 = v49;
  v34 = objc_msgSend(v49, "length");
  v35 = objc_msgSend(objc_retainAutorelease(v15), "bytes");
  v36 = ccsiv_crypt(a3, v19, v34, v35, v48);
  if (!v36)
  {
    v37 = 0;
    v14 = v50;
    goto LABEL_19;
  }
  v46 = v36;
  v57 = NSLocalizedDescriptionKey;
  v58 = CFSTR("could not ccsiv_crypt");
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1));
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("corecrypto"), v46, v40));
  v14 = v50;
LABEL_18:

LABEL_19:
  cc_clear(a3->var0, v19);
  v41 = v52;
  if (v52)
    *v41 = objc_retainAutorelease(v37);

  return v37 == 0;
}

- (id)keyMaterial
{
  return +[NSData _newZeroingDataWithBytes:length:](NSData, "_newZeroingDataWithBytes:length:", self->super.key, self->super.size);
}

+ (id)randomKey:(id *)a3
{
  CKKSAESSIVKey *v4;
  uint64_t Bytes;
  uint64_t v6;
  void *v7;

  v4 = objc_alloc_init(CKKSAESSIVKey);
  Bytes = CCRandomGenerateBytes(v4->super.key, v4->super.size);
  if ((_DWORD)Bytes)
  {
    if (a3)
    {
      v6 = (int)Bytes;
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CCRandomGenerateBytes failed with %d"), Bytes));
      *a3 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("corecrypto"), v6, v7));

      a3 = 0;
    }
  }
  else
  {
    a3 = v4;
  }

  return a3;
}

@end
