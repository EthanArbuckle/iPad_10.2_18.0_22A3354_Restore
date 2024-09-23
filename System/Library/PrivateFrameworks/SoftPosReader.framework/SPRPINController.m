@implementation SPRPINController

- (BOOL)capturePINWithParameters:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  BOOL v18;
  _QWORD v20[6];
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v6 = a3;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = sub_21596F6B0;
  v32 = sub_21596F6C0;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_21596F6B0;
  v26 = sub_21596F6C0;
  v7 = MEMORY[0x24BDAC760];
  v27 = 0;
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = sub_21596F6C8;
  v21[3] = &unk_24D3CCCC0;
  v21[4] = &v28;
  objc_msgSend_syncProxyWithErrorHandler_(self, v8, (uint64_t)v21, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v7;
  v20[1] = 3221225472;
  v20[2] = sub_21596F6D8;
  v20[3] = &unk_24D3CCCE8;
  v20[4] = &v22;
  v20[5] = &v28;
  objc_msgSend_capturePINWithParameters_reply_(v12, v13, (uint64_t)v6, (uint64_t)v20, v14, v15);

  v16 = (void *)v23[5];
  if (v16)
    objc_storeStrong((id *)&self->_pinCrypto, v16);
  if (a4)
  {
    v17 = (void *)v29[5];
    if (v17)
      *a4 = objc_retainAutorelease(v17);
  }
  v18 = v23[5] != 0;
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
  return v18;
}

- (BOOL)addDigitWithValue:(unsigned __int8)a3 error:(id *)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  NSObject *v9;
  os_signpost_id_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  SPRPINCrypto *pinCrypto;
  id *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  NSObject *v41;
  void *v42;
  char v43;
  _QWORD v45[6];
  _QWORD v46[5];
  id obj;
  uint8_t buf[16];
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  char v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;

  v7 = a3;
  v53 = 0;
  v54 = &v53;
  v55 = 0x3032000000;
  v56 = sub_21596F6B0;
  v57 = sub_21596F6C0;
  v58 = 0;
  v49 = 0;
  v50 = &v49;
  v51 = 0x2020000000;
  v52 = 0;
  objc_msgSend_xpcClient(SPRLogger, a2, a3, (uint64_t)a4, v4, v5);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_generate(v9);

  objc_msgSend_xpcClient(SPRLogger, v11, v12, v13, v14, v15);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_215968000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v10, "add digit client", "begin add digit client", buf, 2u);
  }

  if (v7 >= 0xA)
  {
    objc_msgSend_errorWithCode_(SPRError, v18, 11005, v19, v20, v21);
    v22 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v25 = (void *)v54[5];
    v54[5] = v22;
    goto LABEL_11;
  }
  pinCrypto = self->_pinCrypto;
  if (!pinCrypto)
  {
    objc_msgSend_errorWithCode_reason_(SPRError, v18, 11006, (uint64_t)CFSTR("no capture"), v20, v21);
    v22 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  v24 = (id *)(v54 + 5);
  obj = (id)v54[5];
  objc_msgSend_encryptDigit_error_(pinCrypto, v18, v7, (uint64_t)&obj, v20, v21);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v24, obj);
  if (v25)
  {
    v30 = MEMORY[0x24BDAC760];
    v46[0] = MEMORY[0x24BDAC760];
    v46[1] = 3221225472;
    v46[2] = sub_21596FA9C;
    v46[3] = &unk_24D3CCCC0;
    v46[4] = &v53;
    objc_msgSend_syncProxyWithErrorHandler_(self, v26, (uint64_t)v46, v27, v28, v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = v30;
    v45[1] = 3221225472;
    v45[2] = sub_21596FAAC;
    v45[3] = &unk_24D3CCD10;
    v45[4] = &v49;
    v45[5] = &v53;
    objc_msgSend_addDigitWithCipher_reply_(v31, v32, (uint64_t)v25, (uint64_t)v45, v33, v34);

  }
LABEL_11:

  objc_msgSend_xpcClient(SPRLogger, v35, v36, v37, v38, v39);
  v40 = objc_claimAutoreleasedReturnValue();
  v41 = v40;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_215968000, v41, OS_SIGNPOST_INTERVAL_END, v10, "add digit client", "end add digit client", buf, 2u);
  }

  if (a4)
  {
    v42 = (void *)v54[5];
    if (v42)
      *a4 = objc_retainAutorelease(v42);
  }
  v43 = *((_BYTE *)v50 + 24);
  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v53, 8);

  return v43;
}

- (BOOL)removeLastDigitAndReturnError:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char v14;
  _QWORD v16[6];
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_21596F6B0;
  v26 = sub_21596F6C0;
  v27 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v7 = MEMORY[0x24BDAC760];
  v21 = 0;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = sub_21596FC24;
  v17[3] = &unk_24D3CCCC0;
  v17[4] = &v22;
  objc_msgSend_syncProxyWithErrorHandler_(self, a2, (uint64_t)v17, v3, v4, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  v16[1] = 3221225472;
  v16[2] = sub_21596FC34;
  v16[3] = &unk_24D3CCD10;
  v16[4] = &v18;
  v16[5] = &v22;
  objc_msgSend_removeLastDigitWithReply_(v8, v9, (uint64_t)v16, v10, v11, v12);

  if (a3)
  {
    v13 = (void *)v23[5];
    if (v13)
      *a3 = objc_retainAutorelease(v13);
  }
  v14 = *((_BYTE *)v19 + 24);
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);

  return v14;
}

- (id)generatePINBlockAndReturnError:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  SPRPINCrypto *pinCrypto;
  void *v15;
  id v16;
  _QWORD v18[6];
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = sub_21596F6B0;
  v30 = sub_21596F6C0;
  v31 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_21596F6B0;
  v24 = sub_21596F6C0;
  v8 = MEMORY[0x24BDAC760];
  v25 = 0;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = sub_21596FDE4;
  v19[3] = &unk_24D3CCCC0;
  v19[4] = &v26;
  objc_msgSend_syncProxyWithErrorHandler_(self, a2, (uint64_t)v19, v3, v4, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v8;
  v18[1] = 3221225472;
  v18[2] = sub_21596FDF4;
  v18[3] = &unk_24D3CCD38;
  v18[4] = &v20;
  v18[5] = &v26;
  objc_msgSend_generatePINBlockWithReply_(v9, v10, (uint64_t)v18, v11, v12, v13);

  if (v21[5])
  {
    pinCrypto = self->_pinCrypto;
    self->_pinCrypto = 0;

  }
  if (a3)
  {
    v15 = (void *)v27[5];
    if (v15)
      *a3 = objc_retainAutorelease(v15);
  }
  v16 = (id)v21[5];
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  return v16;
}

- (void)cancelPINCapture
{
  SPRPINCrypto *pinCrypto;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[5];

  pinCrypto = self->_pinCrypto;
  self->_pinCrypto = 0;

  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = sub_21596FEF4;
  v13[3] = &unk_24D3CCD60;
  v13[4] = self;
  objc_msgSend_syncProxyWithErrorHandler_(self, v4, (uint64_t)v13, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cancelPINCaptureWithReply_(v8, v9, (uint64_t)&unk_24D3CCA98, v10, v11, v12);

}

- (BOOL)updateParameters:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  char v17;
  _QWORD v19[6];
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v6 = a3;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = sub_21596F6B0;
  v29 = sub_21596F6C0;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v7 = MEMORY[0x24BDAC760];
  v24 = 0;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = sub_2159700D4;
  v20[3] = &unk_24D3CCCC0;
  v20[4] = &v25;
  objc_msgSend_syncProxyWithErrorHandler_(self, v8, (uint64_t)v20, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v7;
  v19[1] = 3221225472;
  v19[2] = sub_2159700E4;
  v19[3] = &unk_24D3CCD10;
  v19[4] = &v21;
  v19[5] = &v25;
  objc_msgSend_updateParameters_reply_(v12, v13, (uint64_t)v6, (uint64_t)v19, v14, v15);

  if (a4)
  {
    v16 = (void *)v26[5];
    if (v16)
      *a4 = objc_retainAutorelease(v16);
  }
  v17 = *((_BYTE *)v22 + 24);
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

  return v17;
}

- (BOOL)verifyWithPINToken:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  char v17;
  _QWORD v19[6];
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v6 = a3;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = sub_21596F6B0;
  v29 = sub_21596F6C0;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v7 = MEMORY[0x24BDAC760];
  v24 = 0;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = sub_21597027C;
  v20[3] = &unk_24D3CCCC0;
  v20[4] = &v25;
  objc_msgSend_syncProxyWithErrorHandler_(self, v8, (uint64_t)v20, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v7;
  v19[1] = 3221225472;
  v19[2] = sub_21597028C;
  v19[3] = &unk_24D3CCD10;
  v19[4] = &v21;
  v19[5] = &v25;
  objc_msgSend_verifyWithPINToken_reply_(v12, v13, (uint64_t)v6, (uint64_t)v19, v14, v15);

  if (a4)
  {
    v16 = (void *)v26[5];
    if (v16)
      *a4 = objc_retainAutorelease(v16);
  }
  v17 = *((_BYTE *)v22 + 24);
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pinCrypto, 0);
}

@end
