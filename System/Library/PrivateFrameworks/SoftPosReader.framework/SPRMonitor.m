@implementation SPRMonitor

- (BOOL)signalWithEvent:(id)a3 error:(id *)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  objc_msgSend_errorWithCode_(SPRError, a2, 7002, (uint64_t)a4, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 && v7)
  {
    objc_msgSend_errorWithCode_(SPRError, v8, 7002, v9, v10, v11);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)signalWithEvent:(unsigned __int16)a3 data:(id)a4 error:(id *)a5
{
  uint64_t v5;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  objc_msgSend_errorWithCode_(SPRError, a2, 7002, (uint64_t)a4, (uint64_t)a5, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5 && v7)
  {
    objc_msgSend_errorWithCode_(SPRError, v8, 7002, v9, v10, v11);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)signalWithEvent:(unsigned __int16)a3 component:(unsigned __int8)a4 origin:(unsigned __int8)a5 details:(id)a6 error:(id *)a7
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  char v21;
  _QWORD v23[6];
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v12 = a6;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = sub_215972618;
  v33 = sub_215972628;
  v34 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v13 = MEMORY[0x24BDAC760];
  v28 = 0;
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = sub_215972630;
  v24[3] = &unk_24D3CCCC0;
  v24[4] = &v29;
  objc_msgSend_syncProxyWithErrorHandler_(self, v14, (uint64_t)v24, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v13;
  v23[1] = 3221225472;
  v23[2] = sub_215972640;
  v23[3] = &unk_24D3CCD10;
  v23[4] = &v25;
  v23[5] = &v29;
  objc_msgSend_signalWithEvent_component_origin_details_reply_(v18, v19, v10, v9, v8, (uint64_t)v12, v23);

  if (a7)
  {
    v20 = (void *)v30[5];
    if (v20)
      *a7 = objc_retainAutorelease(v20);
  }
  v21 = *((_BYTE *)v26 + 24);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);

  return v21;
}

@end
