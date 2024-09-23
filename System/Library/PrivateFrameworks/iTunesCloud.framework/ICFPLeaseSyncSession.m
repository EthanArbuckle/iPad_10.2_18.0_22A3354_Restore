@implementation ICFPLeaseSyncSession

- (id)_initWithFPLeaseSync:(FPLeaseSyncOpaque_ *)a3 leaseID:(id)a4 accountID:(unint64_t)a5 hardwareInfo:(FairPlayHWInfo_ *)a6 mediaKind:(unsigned int)a7
{
  id v13;
  ICFPLeaseSyncSession *v14;
  ICFPLeaseSyncSession *v15;
  __int128 v16;
  objc_super v18;

  v13 = a4;
  v18.receiver = self;
  v18.super_class = (Class)ICFPLeaseSyncSession;
  v14 = -[ICFPLeaseSyncSession init](&v18, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_fpLeaseSync = a3;
    objc_storeStrong(&v14->_leaseID, a4);
    v15->_accountID = a5;
    v16 = *(_OWORD *)&a6->IDLength;
    *(_QWORD *)&v15->_hardwareInfo.ID[12] = *(_QWORD *)&a6->ID[12];
    *(_OWORD *)&v15->_hardwareInfo.IDLength = v16;
    v15->_mediaKind = a7;
  }

  return v15;
}

- (void)dealloc
{
  FPLeaseSyncOpaque_ *fpLeaseSync;
  objc_super v4;

  fpLeaseSync = self->_fpLeaseSync;
  if (fpLeaseSync)
  {
    AohBfJYWOS6((uint64_t)fpLeaseSync);
    self->_fpLeaseSync = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)ICFPLeaseSyncSession;
  -[ICFPLeaseSyncSession dealloc](&v4, sel_dealloc);
}

- (BOOL)endLeaseSyncAndReturnError:(id *)a3
{
  FPLeaseSyncOpaque_ *fpLeaseSync;

  fpLeaseSync = self->_fpLeaseSync;
  if (fpLeaseSync)
  {
    AohBfJYWOS6((uint64_t)fpLeaseSync);
    self->_fpLeaseSync = 0;
  }
  if (a3)
    *a3 = 0;
  return 1;
}

- (BOOL)getLeaseSyncRenewRequestData:(id *)a3 error:(id *)a4
{
  int v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v11;
  unsigned int v12;

  v12 = 0;
  v11 = 0;
  S12yWPyxCU((uint64_t)self->_fpLeaseSync, (uint64_t)&v11, (uint64_t)&v12);
  v7 = v6;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICFairPlayError"), v6, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    if (!a3)
      goto LABEL_4;
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "ic_dataWithFairPlayBytes:length:", v11, v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  if (a3)
LABEL_3:
    *a3 = objc_retainAutorelease(v9);
LABEL_4:
  if (a4)
    *a4 = objc_retainAutorelease(v8);

  return v7 == 0;
}

- (BOOL)importLeaseSyncResponseData:(id)a3 error:(id *)a4
{
  FPLeaseSyncOpaque_ *fpLeaseSync;
  id v6;
  uint64_t v7;
  int v8;
  int v9;
  void *v10;

  fpLeaseSync = self->_fpLeaseSync;
  v6 = objc_retainAutorelease(a3);
  v7 = objc_msgSend(v6, "bytes");
  objc_msgSend(v6, "length");

  Xr9TNsiQ((uint64_t)fpLeaseSync, v7);
  v9 = v8;
  if (!v8)
  {
    v10 = 0;
    if (!a4)
      goto LABEL_4;
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICFairPlayError"), v8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
LABEL_3:
    *a4 = objc_retainAutorelease(v10);
LABEL_4:

  return v9 == 0;
}

- (BOOL)processRenewResponseData:(id)a3 error:(id *)a4
{
  FPLeaseSyncOpaque_ *fpLeaseSync;
  id v6;
  uint64_t v7;
  int v8;
  int v9;
  void *v10;

  fpLeaseSync = self->_fpLeaseSync;
  v6 = objc_retainAutorelease(a3);
  v7 = objc_msgSend(v6, "bytes");
  objc_msgSend(v6, "length");

  i1IfStf2DSO((uint64_t)fpLeaseSync, v7);
  v9 = v8;
  if (!v8)
  {
    v10 = 0;
    if (!a4)
      goto LABEL_4;
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICFairPlayError"), v8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
LABEL_3:
    *a4 = objc_retainAutorelease(v10);
LABEL_4:

  return v9 == 0;
}

- (unint64_t)accountID
{
  return self->_accountID;
}

- (id)leaseID
{
  return self->_leaseID;
}

- (unsigned)mediaKind
{
  return self->_mediaKind;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_leaseID, 0);
}

+ (id)leaseSyncSessionWithID:(id)a3 accountID:(unint64_t)a4 mediaKind:(unsigned int)a5 returningLeaseSyncRequestData:(id *)a6 error:(id *)a7
{
  uint64_t v9;
  id v12;
  int v13;
  uint64_t v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v22;
  uint64_t v23;
  unsigned int v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;

  v9 = *(_QWORD *)&a5;
  v30 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  if (leaseSyncSessionWithID_accountID_mediaKind_returningLeaseSyncRequestData_error__sOnceToken != -1)
    dispatch_once(&leaseSyncSessionWithID_accountID_mediaKind_returningLeaseSyncRequestData_error__sOnceToken, &__block_literal_global_6380);
  v28 = 0uLL;
  v29 = 0;
  if (!ICFairPlayGetHardwareInfo((uint64_t)&v28))
  {
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v15 = CFSTR("ICError");
    v14 = -7500;
    goto LABEL_7;
  }
  v25 = 0;
  v24 = 0;
  v23 = 0;
  WGrQCCz7(a4, (uint64_t)&v28, v9, (uint64_t)&v25, (uint64_t)&v23, (uint64_t)&v24);
  if (v13)
  {
    v14 = v13;
    v15 = CFSTR("ICFairPlayError");
    v16 = (void *)MEMORY[0x1E0CB35C8];
    goto LABEL_7;
  }
  if (!v25)
  {
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v15 = CFSTR("ICError");
    v14 = 0;
LABEL_7:
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", v15, v14, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    v19 = 0;
    if (!a7)
      goto LABEL_9;
    goto LABEL_8;
  }
  v22 = objc_alloc((Class)a1);
  v26 = v28;
  v27 = v29;
  v18 = (void *)objc_msgSend(v22, "_initWithFPLeaseSync:leaseID:accountID:hardwareInfo:mediaKind:", v25, v12, a4, &v26, v9);
  objc_msgSend(MEMORY[0x1E0C99D50], "ic_dataWithFairPlayBytes:length:", v23, v24);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  if (a7)
LABEL_8:
    *a7 = objc_retainAutorelease(v17);
LABEL_9:
  if (a6)
    *a6 = objc_retainAutorelease(v19);
  v20 = v18;

  return v20;
}

@end
