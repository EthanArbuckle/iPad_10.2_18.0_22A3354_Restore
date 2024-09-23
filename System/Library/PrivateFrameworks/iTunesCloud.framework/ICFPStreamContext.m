@implementation ICFPStreamContext

- (ICFPStreamContext)initWithVersion:(unsigned int)a3 contextID:(unsigned int)a4 contentInfo:(id)a5 returningError:(id *)a6
{
  uint64_t v7;
  uint64_t v8;
  id v10;
  void *v11;
  int v12;
  ICFPStreamContext *v13;
  uint64_t v14;
  NSData *playerInfoContextRequestData;
  objc_super v17;
  FPStreamOpaque_ *v18;
  int v19;
  uint64_t v20;
  _QWORD v21[3];

  v7 = *(_QWORD *)&a4;
  v8 = *(_QWORD *)&a3;
  v10 = a5;
  v11 = v10;
  memset(v21, 0, sizeof(v21));
  if (v10)
    objc_msgSend(v10, "fpContentInfo");
  v20 = 0;
  v19 = 0;
  v18 = 0;
  J3NocDTIn(v8, v7, (uint64_t)v21);
  if (v12)
  {
    if (a6)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICFairPlayError"), v12, 0);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }

    v13 = 0;
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)ICFPStreamContext;
    v13 = -[ICFPStreamContext init](&v17, sel_init);
    if (v13)
    {
      v13->_accountID = objc_msgSend(v11, "accountID");
      if (v20 && v19)
      {
        objc_msgSend(MEMORY[0x1E0C99D50], "ic_dataWithFairPlayBytes:length:");
        v14 = objc_claimAutoreleasedReturnValue();
        playerInfoContextRequestData = v13->_playerInfoContextRequestData;
        v13->_playerInfoContextRequestData = (NSData *)v14;
      }
      else
      {
        playerInfoContextRequestData = v13->_playerInfoContextRequestData;
        v13->_playerInfoContextRequestData = 0;
      }

      v13->_fpStreamRef = v18;
    }
    if (a6)
      *a6 = 0;
  }

  return v13;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_fpStreamRef)
    TsbHVdUOnzCHizuzrAdwYFpb();
  v3.receiver = self;
  v3.super_class = (Class)ICFPStreamContext;
  -[ICFPStreamContext dealloc](&v3, sel_dealloc);
}

- (BOOL)getPlayerDelegateInfoDataUsingPlayerDelegateInfoResponseData:(id)a3 returningData:(id *)a4 error:(id *)a5
{
  id v8;
  void *v9;
  FPStreamOpaque_ *fpStreamRef;
  id v11;
  int v12;
  void *v13;
  void *v14;
  unsigned int v16;
  uint64_t v17;

  v8 = a3;
  v9 = v8;
  fpStreamRef = self->_fpStreamRef;
  if (!fpStreamRef)
  {
    v13 = 0;
LABEL_5:
    v14 = 0;
    if (!a5)
      goto LABEL_7;
    goto LABEL_6;
  }
  v17 = 0;
  v16 = 0;
  v11 = objc_retainAutorelease(v8);
  TBGzuU3p5n1n((uint64_t)fpStreamRef, objc_msgSend(v11, "bytes"), objc_msgSend(v11, "length"), (uint64_t)&v17, (uint64_t)&v16);
  LOBYTE(fpStreamRef) = v12 == 0;
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICFairPlayError"), v12, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "ic_dataWithFairPlayBytes:length:", v17, v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  if (a5)
LABEL_6:
    *a5 = objc_retainAutorelease(v13);
LABEL_7:
  if (a4)
    *a4 = objc_retainAutorelease(v14);

  return (char)fpStreamRef;
}

- (BOOL)getStreamerInfoContextDataUsingPlayerInfoContextData:(id)a3 returningData:(id *)a4 error:(id *)a5
{
  id v8;
  void *v9;
  FPStreamOpaque_ *fpStreamRef;
  id v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v16;

  v8 = a3;
  v9 = v8;
  fpStreamRef = self->_fpStreamRef;
  if (!fpStreamRef)
  {
    v13 = 0;
LABEL_5:
    v14 = 0;
    if (!a5)
      goto LABEL_7;
    goto LABEL_6;
  }
  v16 = 0;
  v11 = objc_retainAutorelease(v8);
  OflR7BMjGok3A7mYQFt9((uint64_t)fpStreamRef, objc_msgSend(v11, "bytes"), objc_msgSend(v11, "length"), 0, 0, (uint64_t)&v16);
  LOBYTE(fpStreamRef) = v12 == 0;
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICFairPlayError"), v12, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "ic_dataWithFairPlayBytes:length:", v16, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  if (a5)
LABEL_6:
    *a5 = objc_retainAutorelease(v13);
LABEL_7:
  if (a4)
    *a4 = objc_retainAutorelease(v14);

  return (char)fpStreamRef;
}

- (unint64_t)accountID
{
  return self->_accountID;
}

- (NSData)playerInfoContextRequestData
{
  return self->_playerInfoContextRequestData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerInfoContextRequestData, 0);
}

@end
