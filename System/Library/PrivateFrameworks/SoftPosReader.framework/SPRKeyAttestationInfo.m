@implementation SPRKeyAttestationInfo

- (SPRKeyAttestationInfo)initWithDERRepresentation:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const __CFString *v33;
  SPRKeyAttestationRequest *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  SPRKeyAttestationRequest *v38;
  SPRKeyAttestationRequest *request;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  NSData *v43;
  NSData *signature;
  SPRKeyAttestationInfo *v45;
  id v46;
  char v48;
  uint64_t v49;
  uint64_t v50;
  _OWORD v51[2];
  _QWORD v52[2];
  uint8_t buf[16];
  __int128 v54;
  __int128 v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend_pinCrypto(SPRLogger, v7, v8, v9, v10, v11);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    objc_msgSend_asHexString(v6, v13, v14, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v18;
    _os_log_impl(&dword_215968000, v12, OS_LOG_TYPE_INFO, "SPRKeyAttestationInfo.init(derRepresentation:%@)", buf, 0xCu);

  }
  v54 = 0u;
  v55 = 0u;
  *(_OWORD *)buf = 0u;
  v19 = objc_retainAutorelease(v6);
  v52[0] = objc_msgSend_bytes(v19, v20, v21, v22, v23, v24);
  v52[1] = objc_msgSend_length(v19, v25, v26, v27, v28, v29);
  if (sub_2159851D8((uint64_t)v52, 3u, (uint64_t)&unk_21599B4B0, (unint64_t)buf, 0x30uLL))
  {
    v33 = CFSTR("attestation");
LABEL_13:
    objc_msgSend_errorWithCode_reason_(SPRError, v30, 10005, (uint64_t)v33, v31, v32);
    goto LABEL_14;
  }
  memset(v51, 0, sizeof(v51));
  if (sub_2159851F8((unint64_t *)&v54, 2u, (uint64_t)&unk_21599C1D0, (unint64_t)v51, 0x20uLL))
  {
    v33 = CFSTR("signingAlg");
    goto LABEL_13;
  }
  v49 = 0;
  v50 = 0;
  v48 = 0;
  if (sub_215984B24((uint64_t)&v55, (unint64_t *)&v49, &v48) || v48)
  {
    v33 = CFSTR("signature");
    goto LABEL_13;
  }
  v34 = [SPRKeyAttestationRequest alloc];
  v38 = (SPRKeyAttestationRequest *)objc_msgSend_initWithSequence_error_(v34, v35, (uint64_t)buf, (uint64_t)a4, v36, v37);
  request = self->_request;
  self->_request = v38;

  if (!self->_request)
  {
    v46 = 0;
    if (a4)
      goto LABEL_15;
    goto LABEL_17;
  }
  if (!sub_215985E00((uint64_t)v51, (uint64_t)&off_24D3CD928))
  {
    objc_msgSend_errorWithCode_reason_(SPRError, v40, 10008, (uint64_t)CFSTR("signingAlg"), v41, v42);
LABEL_14:
    v46 = (id)objc_claimAutoreleasedReturnValue();
    if (a4)
    {
LABEL_15:
      v46 = objc_retainAutorelease(v46);
      v45 = 0;
      *a4 = v46;
      goto LABEL_18;
    }
LABEL_17:
    v45 = 0;
    goto LABEL_18;
  }
  objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v40, v49, v50, v41, v42);
  v43 = (NSData *)objc_claimAutoreleasedReturnValue();
  signature = self->_signature;
  self->_signature = v43;

  v45 = self;
  v46 = 0;
LABEL_18:

  return v45;
}

- (SPRKeyAttestationInfo)initWithRequest:(id)a3 signature:(id)a4
{
  SPRKeyAttestationRequest *v6;
  NSData *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  SPRKeyAttestationRequest *request;
  SPRKeyAttestationRequest *v15;
  NSData *signature;
  int v18;
  SPRKeyAttestationRequest *v19;
  __int16 v20;
  NSData *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = (SPRKeyAttestationRequest *)a3;
  v7 = (NSData *)a4;
  objc_msgSend_pinCrypto(SPRLogger, v8, v9, v10, v11, v12);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v18 = 138412546;
    v19 = v6;
    v20 = 2112;
    v21 = v7;
    _os_log_impl(&dword_215968000, v13, OS_LOG_TYPE_INFO, "SPRKeyAttestationInfo.init(request:%@, signature:%@)", (uint8_t *)&v18, 0x16u);
  }

  request = self->_request;
  self->_request = v6;
  v15 = v6;

  signature = self->_signature;
  self->_signature = v7;

  return self;
}

- (NSData)derRepresentation
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v51;
  _QWORD v52[6];
  unint64_t v53;
  _BYTE v54[16];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v53 = 16;
  sub_2159854D0(6uLL, 8uLL, &unk_21599C208, (unint64_t)v54, &v53);
  objc_msgSend_dataWithLength_(MEMORY[0x24BDBCEC8], v3, 1, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendData_(v7, v8, (uint64_t)self->_signature, v9, v10, v11);
  objc_msgSend_derRepresentation(self->_request, v12, v13, v14, v15, v16);
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v52[0] = objc_msgSend_bytes(v17, v18, v19, v20, v21, v22);
  v52[1] = objc_msgSend_length(v17, v23, v24, v25, v26, v27);
  v52[2] = v54;
  v52[3] = v53;
  v28 = objc_retainAutorelease(v7);
  v52[4] = objc_msgSend_bytes(v28, v29, v30, v31, v32, v33);
  v52[5] = objc_msgSend_length(v28, v34, v35, v36, v37, v38);
  v51 = sub_215985D84(0x2000000000000010, (unint64_t)v52, 3, (uint64_t)&unk_21599B4F8);
  objc_msgSend_dataWithLength_(MEMORY[0x24BDBCEC8], v39, v51, v40, v41, v42);
  v43 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v49 = objc_msgSend_mutableBytes(v43, v44, v45, v46, v47, v48);
  sub_215985C74(0x2000000000000010, (unint64_t)v52, 3u, (uint64_t)&unk_21599B4F8, v49, (unint64_t *)&v51);

  return (NSData *)v43;
}

- (SPRKeyAttestationRequest)request
{
  return self->_request;
}

- (NSData)signature
{
  return self->_signature;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
