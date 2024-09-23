@implementation SPRKeyAttestationRequest

- (SPRKeyAttestationRequest)initWithSequence:(id *)a3 error:(id *)a4
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v9;
  unint64_t var1;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  NSData *v20;
  NSData *publicKeyInfo;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  NSData *v25;
  NSData *derRepresentation;
  SPRKeyAttestationRequest *v27;
  id v28;
  int v30;
  unint64_t v31[2];
  uint8_t buf[16];
  __int128 v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_pinCrypto(SPRLogger, a2, (uint64_t)a3, (uint64_t)a4, v4, v5);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    var1 = a3->var1;
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = var1;
    _os_log_impl(&dword_215968000, v9, OS_LOG_TYPE_INFO, "SPRKeyAttestationRequest.init(sequence:[%lu bytes])", buf, 0xCu);
  }

  v31[0] = 0;
  v31[1] = 0;
  *(_OWORD *)buf = 0u;
  v33 = 0u;
  if (sub_2159851D8((uint64_t)a3, 2u, (uint64_t)&unk_21599B238, (unint64_t)v31, 0x10uLL))
  {
    objc_msgSend_errorWithCode_reason_(SPRError, v11, 10005, (uint64_t)CFSTR("request"), v12, v13);
  }
  else if (sub_2159851F8(v31, 0xAu, (uint64_t)&unk_21599B268, (unint64_t)buf, 0x20uLL))
  {
    objc_msgSend_errorWithCode_reason_(SPRError, v14, 10005, (uint64_t)CFSTR("appletData"), v15, v16);
  }
  else
  {
    v30 = 0;
    if (!sub_215984BE4((char **)buf, &v30) && v30 == 1)
    {
      objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v17, v33, *((uint64_t *)&v33 + 1), v18, v19);
      v20 = (NSData *)objc_claimAutoreleasedReturnValue();
      publicKeyInfo = self->_publicKeyInfo;
      self->_publicKeyInfo = v20;

      objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v22, (uint64_t)a3->var0, a3->var1, v23, v24);
      v25 = (NSData *)objc_claimAutoreleasedReturnValue();
      derRepresentation = self->_derRepresentation;
      self->_derRepresentation = v25;

      v27 = self;
      v28 = 0;
      goto LABEL_14;
    }
    objc_msgSend_errorWithCode_reason_(SPRError, v17, 10005, (uint64_t)CFSTR("appletDataVersion"), v18, v19);
  }
  v28 = (id)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    v28 = objc_retainAutorelease(v28);
    v27 = 0;
    *a4 = v28;
  }
  else
  {
    v27 = 0;
  }
LABEL_14:

  return v27;
}

- (SPRKeyAttestationRequest)initWithDERRepresentation:(id)a3 error:(id *)a4
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
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  SPRKeyAttestationRequest *v34;
  int v36;
  _BYTE v37[12];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend_pinCrypto(SPRLogger, v7, v8, v9, v10, v11);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    objc_msgSend_asHexString(v6, v13, v14, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 138412290;
    *(_QWORD *)v37 = v18;
    _os_log_impl(&dword_215968000, v12, OS_LOG_TYPE_INFO, "SPRKeyAttestationRequest.init(derRepresentation:%@)", (uint8_t *)&v36, 0xCu);

  }
  v19 = objc_retainAutorelease(v6);
  v25 = objc_msgSend_bytes(v19, v20, v21, v22, v23, v24);
  *(_QWORD *)&v37[4] = objc_msgSend_length(v19, v26, v27, v28, v29, v30, v25);
  v34 = (SPRKeyAttestationRequest *)objc_msgSend_initWithSequence_error_(self, v31, (uint64_t)&v36, (uint64_t)a4, v32, v33);

  return v34;
}

- (SPRKeyAttestationRequest)initWithPublicKeyInfo:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSData *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  id v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSData *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  NSData *derRepresentation;
  NSData *v56;
  NSData *publicKeyInfo;
  _QWORD v59[4];
  uint64_t v60;
  __int128 buf;
  void *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;

  v76 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend_pinCrypto(SPRLogger, v5, v6, v7, v8, v9);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_215968000, v10, OS_LOG_TYPE_INFO, "SPRKeyAttestationRequest.init(publicKeyInfo:%@)", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = &unk_21599B358;
  *((_QWORD *)&buf + 1) = 1;
  v62 = &unk_21599B359;
  v63 = 24;
  v64 = &unk_21599B378;
  v65 = 8;
  v66 = &unk_21599B380;
  v67 = 4;
  v68 = &unk_21599B384;
  v69 = 4;
  v70 = &unk_21599B388;
  v71 = 1;
  v11 = (NSData *)objc_retainAutorelease(v4);
  v72 = objc_msgSend_bytes(v11, v12, v13, v14, v15, v16);
  v73 = objc_msgSend_length(v11, v17, v18, v19, v20, v21);
  v74 = &unk_21599B389;
  v75 = 15;
  v60 = sub_215985D84(0x2000000000000010, (unint64_t)&buf, 8, (uint64_t)&unk_21599B3C0);
  objc_msgSend_dataWithLength_(MEMORY[0x24BDBCEC8], v22, v60, v23, v24, v25);
  v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v32 = objc_msgSend_mutableBytes(v26, v27, v28, v29, v30, v31);
  sub_215985C74(0x2000000000000010, (unint64_t)&buf, 8u, (uint64_t)&unk_21599B3C0, v32, (unint64_t *)&v60);
  v33 = objc_retainAutorelease(v26);
  v59[0] = objc_msgSend_mutableBytes(v33, v34, v35, v36, v37, v38);
  v59[1] = objc_msgSend_length(v33, v39, v40, v41, v42, v43);
  v59[2] = &unk_21599B398;
  v59[3] = 40;
  v60 = sub_215985D84(0x2000000000000010, (unint64_t)v59, 2, (uint64_t)&unk_21599B480);
  objc_msgSend_dataWithLength_(MEMORY[0x24BDBCEC8], v44, v60, v45, v46, v47);
  v48 = (NSData *)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v54 = objc_msgSend_mutableBytes(v48, v49, v50, v51, v52, v53);
  sub_215985C74(0x2000000000000010, (unint64_t)v59, 2u, (uint64_t)&unk_21599B480, v54, (unint64_t *)&v60);
  derRepresentation = self->_derRepresentation;
  self->_derRepresentation = v48;
  v56 = v48;

  publicKeyInfo = self->_publicKeyInfo;
  self->_publicKeyInfo = v11;

  return self;
}

- (NSData)derRepresentation
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (NSData)publicKeyInfo
{
  return self->_publicKeyInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publicKeyInfo, 0);
  objc_storeStrong((id *)&self->_derRepresentation, 0);
}

@end
