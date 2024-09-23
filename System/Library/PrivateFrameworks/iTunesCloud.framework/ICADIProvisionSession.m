@implementation ICADIProvisionSession

- (ICADIProvisionSession)initWithAccountID:(unint64_t)a3
{
  ICADIProvisionSession *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICADIProvisionSession;
  result = -[ICADIProvisionSession init](&v5, sel_init);
  if (result)
    result->_accountID = a3;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[ICADIProvisionSession _destroySession](self, "_destroySession");
  v3.receiver = self;
  v3.super_class = (Class)ICADIProvisionSession;
  -[ICADIProvisionSession dealloc](&v3, sel_dealloc);
}

- (BOOL)startWithServerActionData:(id)a3 returningClientData:(id *)a4 error:(id *)a5
{
  id v9;
  unsigned int *p_sessionID;
  unint64_t accountID;
  id v12;
  int v13;
  int v14;
  void *v15;
  void *v16;
  void *v18;
  unsigned int v19;
  uint64_t v20;

  v9 = a3;
  v20 = 0;
  v19 = 0;
  p_sessionID = &self->_sessionID;
  if (self->_sessionID)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICADIUtilities.m"), 104, CFSTR("ICADIProvisionSession start can only be called once!"));

  }
  accountID = self->_accountID;
  v12 = objc_retainAutorelease(v9);
  rsegvyrt87(accountID, objc_msgSend(v12, "bytes"), objc_msgSend(v12, "length"), (uint64_t)&v20, (uint64_t)&v19, (uint64_t)p_sessionID);
  v14 = v13;
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICFairPlayError"), v13, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    if (!a4)
      goto LABEL_6;
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "ic_dataWithADIBytes:length:", v20, v19);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  if (a4)
LABEL_5:
    *a4 = objc_retainAutorelease(v16);
LABEL_6:
  if (a5)
    *a5 = objc_retainAutorelease(v15);

  return v14 == 0;
}

- (BOOL)endWithMessageData:(id)a3 transportKey:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  int v13;
  int v14;
  void *v15;
  void *v17;

  v9 = a3;
  v10 = a4;
  if (!self->_sessionID)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICADIUtilities.m"), 132, CFSTR("ICADIProvisionSession end called for invalid session"));

  }
  v11 = objc_retainAutorelease(v9);
  objc_msgSend(v11, "bytes");
  objc_msgSend(v11, "length");
  v12 = objc_retainAutorelease(v10);
  objc_msgSend(v12, "bytes");
  objc_msgSend(v12, "length");
  uv5t6nhkui();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICFairPlayError"), v13, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
  -[ICADIProvisionSession _destroySession](self, "_destroySession");
  if (a5)
    *a5 = objc_retainAutorelease(v15);

  return v14 == 0;
}

- (void)_destroySession
{
  if (self->_sessionID)
  {
    fy34trz2st();
    self->_sessionID = 0;
  }
}

@end
