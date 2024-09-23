@implementation ICFPSAPContext

- (BOOL)signData:(id)a3 returningSignatureData:(id *)a4 error:(id *)a5
{
  FPSAPContextOpaque_ *fairPlaySAPContext;
  id v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  void *v12;
  void *v13;
  unsigned int v15;
  uint64_t v16;

  v16 = 0;
  v15 = 0;
  fairPlaySAPContext = self->_fairPlaySAPContext;
  v8 = objc_retainAutorelease(a3);
  v9 = objc_msgSend(v8, "bytes");
  v10 = objc_msgSend(v8, "length");

  Fc3vhtJDvr((uint64_t)fairPlaySAPContext, v9, v10, (uint64_t)&v16, (uint64_t)&v15);
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICFairPlayError"), v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    if (!a4)
      goto LABEL_4;
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "ic_dataWithFairPlayBytes:length:", v16, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  if (a4)
LABEL_3:
    *a4 = objc_retainAutorelease(v13);
LABEL_4:
  if (a5)
    *a5 = objc_retainAutorelease(v12);

  return v12 == 0;
}

- (BOOL)exchangeWithSAPVersion:(unsigned int)a3 data:(id)a4 returningData:(id *)a5 exchangeStatus:(char *)a6 error:(id *)a7
{
  uint64_t v10;
  FairPlayHWInfo_ *p_hardwareInfo;
  FPSAPContextOpaque_ *fairPlaySAPContext;
  id v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  void *v17;
  void *v18;
  char v20;
  unsigned int v21;
  uint64_t v22;

  v10 = *(_QWORD *)&a3;
  v22 = 0;
  v21 = 0;
  v20 = -1;
  p_hardwareInfo = &self->_hardwareInfo;
  fairPlaySAPContext = self->_fairPlaySAPContext;
  v13 = objc_retainAutorelease(a4);
  v14 = objc_msgSend(v13, "bytes");
  v15 = objc_msgSend(v13, "length");

  Mib5yocT(v10, (uint64_t)p_hardwareInfo, (uint64_t)fairPlaySAPContext, v14, v15, (uint64_t)&v22, (uint64_t)&v21, (uint64_t)&v20);
  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICFairPlayError"), v16, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    if (!a5)
      goto LABEL_4;
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "ic_dataWithFairPlayBytes:length:", v22, v21);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  if (a5)
LABEL_3:
    *a5 = objc_retainAutorelease(v18);
LABEL_4:
  if (a6)
    *a6 = v20;
  if (a7)
    *a7 = objc_retainAutorelease(v17);

  return v17 == 0;
}

- (BOOL)processResponseWithSignatureData:(id)a3 data:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  int v11;
  void *v12;

  v7 = objc_retainAutorelease(a3);
  v8 = a4;
  v9 = v7;
  objc_msgSend(v9, "bytes");
  objc_msgSend(v9, "length");

  v10 = objc_retainAutorelease(v8);
  objc_msgSend(v10, "mutableBytes");
  objc_msgSend(v10, "length");

  gLg1CWr7p();
  if (!v11)
  {
    v12 = 0;
    if (!a5)
      goto LABEL_4;
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICFairPlayError"), v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5)
LABEL_3:
    *a5 = objc_retainAutorelease(v12);
LABEL_4:

  return v12 == 0;
}

- (id)initReturningError:(id *)a3
{
  int v5;
  uint64_t v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  ICFPSAPContext *v10;
  uint64_t v11;
  ICFPSAPContext *v12;
  objc_super v14;
  FPSAPContextOpaque_ *v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v15 = 0;
  v16 = 0uLL;
  v17 = 0;
  if (!ICFairPlayGetHardwareInfo((uint64_t)&v16))
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v7 = CFSTR("ICError");
    v6 = -7500;
LABEL_5:
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", v7, v6, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a3)
      goto LABEL_7;
    goto LABEL_6;
  }
  cp2g1b9ro((uint64_t)&v15, (uint64_t)&v16);
  if (v5)
  {
    v6 = v5;
    v7 = CFSTR("ICFairPlayError");
    v8 = (void *)MEMORY[0x1E0CB35C8];
    goto LABEL_5;
  }
  v9 = 0;
  if (a3)
LABEL_6:
    *a3 = objc_retainAutorelease(v9);
LABEL_7:
  if (v15)
  {
    v14.receiver = self;
    v14.super_class = (Class)ICFPSAPContext;
    v10 = -[ICFPSAPContext init](&v14, sel_init);
    if (v10)
    {
      v11 = v17;
      *(_OWORD *)&v10->_hardwareInfo.IDLength = v16;
      *(_QWORD *)&v10->_hardwareInfo.ID[12] = v11;
      v10->_fairPlaySAPContext = v15;
    }
    self = v10;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)dealloc
{
  FPSAPContextOpaque_ *fairPlaySAPContext;
  objc_super v4;

  fairPlaySAPContext = self->_fairPlaySAPContext;
  if (fairPlaySAPContext)
    IPaI1oem5iL((uint64_t)fairPlaySAPContext);
  v4.receiver = self;
  v4.super_class = (Class)ICFPSAPContext;
  -[ICFPSAPContext dealloc](&v4, sel_dealloc);
}

@end
