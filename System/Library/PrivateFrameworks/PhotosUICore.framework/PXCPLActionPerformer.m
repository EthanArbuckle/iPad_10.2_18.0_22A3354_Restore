@implementation PXCPLActionPerformer

- (void)performActionWithCPLUIStatus:(id)a3 completionHandler:(id)a4
{
  PXCPLUIStatus *v7;
  PXCPLUIStatus *cplUIStatus;
  void *v9;
  id v10;

  v7 = (PXCPLUIStatus *)a3;
  v10 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCPLActionPerformer.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("cplUIStatus"));

  }
  cplUIStatus = self->_cplUIStatus;
  self->_cplUIStatus = v7;

  -[PXActionPerformer performActionWithCompletionHandler:](self, "performActionWithCompletionHandler:", v10);
}

- (PXCPLUIStatus)cplUIStatus
{
  return self->_cplUIStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cplUIStatus, 0);
}

@end
