@implementation SPRError

+ (id)failureForCode:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  if (qword_254DEDF30 != -1)
    dispatch_once(&qword_254DEDF30, &unk_24D3CCA78);
  objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], a2, a3, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_((void *)qword_254DEDF38, v8, (uint64_t)v7, v9, v10, v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v12, (uint64_t)CFSTR("SPRError#%ld"), v13, v14, v15, a3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

+ (id)errorWithCode:(int64_t)a3
{
  return (id)((uint64_t (*)(__objc2_class *, char *, int64_t, _QWORD, _QWORD))MEMORY[0x24BEDD108])(SPRError, sel_errorWithCode_reason_underlyingError_, a3, 0, 0);
}

+ (id)errorWithCode:(int64_t)a3 reason:(id)a4
{
  return (id)((uint64_t (*)(__objc2_class *, char *, int64_t, id, _QWORD))MEMORY[0x24BEDD108])(SPRError, sel_errorWithCode_reason_underlyingError_, a3, a4, 0);
}

+ (id)errorWithCode:(int64_t)a3 reason:(id)a4 underlyingError:(id)a5
{
  id v7;
  id v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  void *v26;

  v7 = a5;
  v8 = a4;
  v9 = (void *)objc_opt_new();
  objc_msgSend_failureForCode_(SPRError, v10, a3, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v9, v15, (uint64_t)v14, *MEMORY[0x24BDD0FD0], v16, v17);

  objc_msgSend_setObject_forKeyedSubscript_(v9, v18, (uint64_t)v8, *MEMORY[0x24BDD0FD8], v19, v20);
  objc_msgSend_setObject_forKeyedSubscript_(v9, v21, (uint64_t)v7, *MEMORY[0x24BDD1398], v22, v23);

  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v24, (uint64_t)CFSTR("SoftPosReader"), a3, (uint64_t)v9, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

@end
