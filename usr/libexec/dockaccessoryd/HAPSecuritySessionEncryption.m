@implementation HAPSecuritySessionEncryption

- (HAPSecuritySessionEncryption)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HAPSecuritySessionEncryption;
  return -[HAPSecuritySessionEncryption init](&v3, "init");
}

- (HAPSecuritySessionEncryption)initWithInputKey:(id)a3 outputKey:(id)a4 enhancedEncryption:(BOOL)a5
{
  id v9;
  id v10;
  HAPSecuritySessionEncryption *v11;
  HAPSecuritySessionEncryption *v12;
  uint64_t v13;
  NSMutableData *inputNonce;
  uint64_t v15;
  NSMutableData *outputNonce;
  objc_super v18;
  _BYTE __s[8];

  v9 = a3;
  v10 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HAPSecuritySessionEncryption;
  v11 = -[HAPSecuritySessionEncryption init](&v18, "init");
  v12 = v11;
  if (v11)
  {
    v11->_enhancedEncryption = a5;
    objc_storeStrong((id *)&v11->_inputKey, a3);
    objc_storeStrong((id *)&v12->_outputKey, a4);
    memset_s(__s, 8uLL, 0, 8uLL);
    v13 = objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithBytes:length:](NSMutableData, "dataWithBytes:length:", __s, 8));
    inputNonce = v12->_inputNonce;
    v12->_inputNonce = (NSMutableData *)v13;

    v15 = objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithBytes:length:](NSMutableData, "dataWithBytes:length:", __s, 8));
    outputNonce = v12->_outputNonce;
    v12->_outputNonce = (NSMutableData *)v15;

  }
  return v12;
}

- (id)encrypt:(id)a3 additionalAuthenticatedData:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _BYTE *v20;
  void *v21;
  char *v22;
  char *v23;
  BOOL v25;
  id v27;
  void *v28;
  _BYTE v29[16];

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(objc_alloc((Class)NSMutableData), "initWithLength:", objc_msgSend(v6, "length"));
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[HAPSecuritySessionEncryption outputKey](self, "outputKey")));
  v27 = objc_msgSend(v9, "bytes");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[HAPSecuritySessionEncryption outputNonce](self, "outputNonce")));
  v11 = objc_msgSend(v10, "bytes");
  v12 = objc_retainAutorelease(v7);
  v13 = objc_msgSend(v12, "bytes");
  v28 = v12;
  v14 = objc_msgSend(v12, "length");
  v15 = objc_retainAutorelease(v6);
  v16 = objc_msgSend(v15, "bytes");
  v17 = objc_msgSend(v15, "length");
  v18 = objc_retainAutorelease(v8);
  chacha20_poly1305_encrypt_all_64x64(v27, v11, v13, v14, v16, v17, objc_msgSend(v18, "mutableBytes"), v29);

  objc_msgSend(v18, "appendBytes:length:", v29, 16);
  if (self->_enhancedEncryption)
    objc_msgSend(v18, "appendData:", self->_outputNonce);
  v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[HAPSecuritySessionEncryption outputNonce](self, "outputNonce")));
  v20 = objc_msgSend(v19, "mutableBytes");
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[HAPSecuritySessionEncryption outputNonce](self, "outputNonce"));
  v22 = (char *)objc_msgSend(v21, "length");
  if (v22)
  {
    v23 = v22 - 1;
    do
    {
      if (++*v20++)
        v25 = 1;
      else
        v25 = v23 == 0;
      --v23;
    }
    while (!v25);
  }

  return v18;
}

- (id)decrypt:(id)a3 additionalAuthenticatedData:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  HAPSecuritySessionEncryption *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HAPSecuritySessionEncryption *v22;
  uint64_t v23;
  id v24;
  NSObject *v25;
  __CFString *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  int v39;
  id v40;
  _BYTE *v41;
  void *v42;
  char *v43;
  char *v44;
  BOOL v46;
  void *v47;
  void *v48;
  id *v50;
  id v51;
  void *v52;
  id v53;
  id v54;
  id v55;
  unint64_t v56;
  unint64_t v57;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  unint64_t v61;
  __int16 v62;
  unint64_t v63;

  v8 = a3;
  v9 = a4;
  if (a5)
    *a5 = 0;
  if (self->_enhancedEncryption)
    v10 = -8;
  else
    v10 = 0;
  v55 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "subdataWithRange:", (char *)objc_msgSend(v8, "length") + v10 - 16, 16));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "subdataWithRange:", 0, (char *)objc_msgSend(v8, "length") + v10 - 16));
  if (self->_enhancedEncryption)
  {
    v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "subdataWithRange:", (char *)objc_msgSend(v8, "length") - 8, 8));
    v56 = 0;
    v57 = 0;
    objc_msgSend(v12, "getBytes:length:", &v57, 8);
    -[NSMutableData getBytes:length:](self->_inputNonce, "getBytes:length:", &v56, 8);
    if (v57 < v56)
    {
      v13 = self;
      v15 = sub_10007CCE4((uint64_t)v13, v14);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = sub_10007CD2C(v13);
        v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
        *(_DWORD *)buf = 138543618;
        v59 = v18;
        v60 = 2048;
        v61 = v57;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%{public}@Ignoring out of sequence packet: %llu", buf, 0x16u);

      }
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), -6764, 0));
      v20 = v19;
      if (a5)
        *a5 = objc_retainAutorelease(v19);

      v21 = 0;
      goto LABEL_31;
    }
    if (v57 > v56)
    {
      v22 = self;
      v24 = sub_10007CCE4((uint64_t)v22, v23);
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v26 = sub_10007CD2C(v22);
        v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
        *(_DWORD *)buf = 138543874;
        v59 = v27;
        v60 = 2048;
        v61 = v56;
        v62 = 2048;
        v63 = v57;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%{public}@Detected potential packet drop while decrypting message: %llu != %llu", buf, 0x20u);

      }
      -[NSMutableData setData:](self->_inputNonce, "setData:", v12);
    }

  }
  v50 = a5;
  v54 = v8;
  v28 = objc_msgSend(objc_alloc((Class)NSMutableData), "initWithLength:", objc_msgSend(v11, "length"));
  v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[HAPSecuritySessionEncryption inputKey](self, "inputKey")));
  v30 = objc_msgSend(v29, "bytes");
  v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[HAPSecuritySessionEncryption inputNonce](self, "inputNonce")));
  v32 = objc_msgSend(v31, "bytes");
  v53 = v9;
  v33 = objc_retainAutorelease(v9);
  v34 = objc_msgSend(v33, "bytes");
  v35 = objc_msgSend(v33, "length");
  v52 = v11;
  v36 = objc_retainAutorelease(v11);
  v37 = objc_msgSend(v36, "bytes");
  v38 = objc_msgSend(v36, "length");
  v51 = objc_retainAutorelease(v28);
  v39 = chacha20_poly1305_decrypt_all_64x64(v30, v32, v34, v35, v37, v38, objc_msgSend(v51, "mutableBytes"), objc_msgSend(objc_retainAutorelease(v55), "bytes"));

  v40 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[HAPSecuritySessionEncryption inputNonce](self, "inputNonce")));
  v41 = objc_msgSend(v40, "mutableBytes");
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[HAPSecuritySessionEncryption inputNonce](self, "inputNonce"));
  v43 = (char *)objc_msgSend(v42, "length");
  if (v43)
  {
    v44 = v43 - 1;
    do
    {
      if (++*v41++)
        v46 = 1;
      else
        v46 = v44 == 0;
      --v44;
    }
    while (!v46);
  }

  if (v39)
  {
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), v39, 0));
    v48 = v47;
    v9 = v53;
    v8 = v54;
    v12 = v51;
    if (v50)
      *v50 = objc_retainAutorelease(v47);

    v21 = 0;
  }
  else
  {
    v12 = v51;
    v21 = v12;
    v9 = v53;
    v8 = v54;
  }
  v11 = v52;
LABEL_31:

  return v21;
}

- (id)decrypt:(const void *)a3 length:(unint64_t)a4 additionalAuthData:(const void *)a5 additionalAuthDataLength:(unint64_t)a6 authTagData:(const void *)a7 authTagDataLength:(unint64_t)a8 counterData:(const void *)a9 counterDataLength:(unint64_t)a10 error:(id *)a11
{
  void *v18;
  unint64_t v19;
  void *v20;
  id v21;
  id v22;
  _UNKNOWN **v23;
  HAPSecuritySessionEncryption *v24;
  uint64_t v25;
  id v26;
  NSObject *v27;
  __CFString *v28;
  void *v29;
  NSMutableData *v30;
  NSMutableData *inputNonce;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  id v38;
  _BYTE *v39;
  void *v40;
  char *v41;
  char *v42;
  BOOL v44;
  id v45;
  unint64_t v46;
  const void *v47;
  unint64_t v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  unint64_t v52;
  __int16 v53;
  unint64_t v54;

  if (a11)
  {
    *a11 = 0;
    if (a8 != 16 || a10 != 8)
    {
      *a11 = (id)objc_claimAutoreleasedReturnValue(+[NSError hmfErrorWithCode:userInfo:](NSError, "hmfErrorWithCode:userInfo:", 3, 0));
      return 0;
    }
  }
  else
  {
    v18 = 0;
    if (a8 != 16 || a10 != 8)
      return v18;
  }
  v48 = 0;
  v19 = *(_QWORD *)a9;
  -[NSMutableData getBytes:length:](self->_inputNonce, "getBytes:length:", &v48, 8);
  if (v19 >= v48)
  {
    v46 = a6;
    v47 = a7;
    v23 = &_s16CryptoKitPrivate6SPAKE2O6ProverVMn_ptr;
    if (v19 > v48)
    {
      v24 = self;
      v26 = sub_10007CCE4((uint64_t)v24, v25);
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v28 = sub_10007CD2C(v24);
        v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
        *(_DWORD *)buf = 138543874;
        v50 = v29;
        v51 = 2048;
        v52 = v48;
        v53 = 2048;
        v54 = v19;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%{public}@Detected potential packet drop while decrypting message: %llu != %llu", buf, 0x20u);

        v23 = &_s16CryptoKitPrivate6SPAKE2O6ProverVMn_ptr;
      }

      v30 = (NSMutableData *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23[493], "dataWithBytes:length:", a9, 8));
      inputNonce = self->_inputNonce;
      self->_inputNonce = v30;

    }
    v32 = objc_msgSend(objc_alloc((Class)v23[493]), "initWithLength:", a4);
    v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[HAPSecuritySessionEncryption inputKey](self, "inputKey")));
    v34 = objc_msgSend(v33, "bytes");
    v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[HAPSecuritySessionEncryption inputNonce](self, "inputNonce")));
    v36 = objc_msgSend(v35, "bytes");
    v21 = objc_retainAutorelease(v32);
    v37 = chacha20_poly1305_decrypt_all_64x64(v34, v36, a5, v46, a3, a4, objc_msgSend(v21, "mutableBytes"), v47);

    v38 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[HAPSecuritySessionEncryption inputNonce](self, "inputNonce")));
    v39 = objc_msgSend(v38, "mutableBytes");
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[HAPSecuritySessionEncryption inputNonce](self, "inputNonce"));
    v41 = (char *)objc_msgSend(v40, "length");
    if (v41)
    {
      v42 = v41 - 1;
      do
      {
        if (++*v39++)
          v44 = 1;
        else
          v44 = v42 == 0;
        --v42;
      }
      while (!v44);
    }

    if (!(_DWORD)v37)
    {
      v21 = v21;
      v18 = v21;
      goto LABEL_27;
    }
    if (a11)
    {
      v45 = sub_100040DDC(v37);
      v22 = (id)objc_claimAutoreleasedReturnValue(v45);
      goto LABEL_24;
    }
LABEL_25:
    v18 = 0;
    goto LABEL_27;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), -6754, 0));
  v21 = v20;
  if (!a11)
    goto LABEL_25;
  v22 = objc_retainAutorelease(v20);
  v21 = v22;
LABEL_24:
  v18 = 0;
  *a11 = v22;
LABEL_27:

  return v18;
}

- (NSData)inputKey
{
  return self->_inputKey;
}

- (void)setInputKey:(id)a3
{
  objc_storeStrong((id *)&self->_inputKey, a3);
}

- (NSMutableData)inputNonce
{
  return self->_inputNonce;
}

- (void)setInputNonce:(id)a3
{
  objc_storeStrong((id *)&self->_inputNonce, a3);
}

- (NSData)outputKey
{
  return self->_outputKey;
}

- (void)setOutputKey:(id)a3
{
  objc_storeStrong((id *)&self->_outputKey, a3);
}

- (NSMutableData)outputNonce
{
  return self->_outputNonce;
}

- (void)setOutputNonce:(id)a3
{
  objc_storeStrong((id *)&self->_outputNonce, a3);
}

- (BOOL)enhancedEncryption
{
  return self->_enhancedEncryption;
}

- (void)setEnhancedEncryption:(BOOL)a3
{
  self->_enhancedEncryption = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputNonce, 0);
  objc_storeStrong((id *)&self->_outputKey, 0);
  objc_storeStrong((id *)&self->_inputNonce, 0);
  objc_storeStrong((id *)&self->_inputKey, 0);
}

@end
