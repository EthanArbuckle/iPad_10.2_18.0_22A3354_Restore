@implementation PXCMMActionPerformer

- (BOOL)canPerformActionWithSession:(id)a3
{
  return 1;
}

- (id)performActionWithSession:(id)a3 completionHandler:(id)a4
{
  PXCMMSession *v7;
  id v8;
  PXCMMSession *session;
  void *v10;
  void *v11;
  void *v13;

  v7 = (PXCMMSession *)a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMActionManager.m"), 93, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("session"));

  }
  session = self->_session;
  self->_session = v7;

  -[PXCMMActionPerformer createActionProgress](self, "createActionProgress");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCMMActionPerformer setProgress:](self, "setProgress:", v10);

  -[PXActionPerformer performActionWithCompletionHandler:](self, "performActionWithCompletionHandler:", v8);
  -[PXCMMActionPerformer progress](self, "progress");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)createActionProgress
{
  return 0;
}

- (PXCMMSession)session
{
  return self->_session;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
  objc_storeStrong((id *)&self->_progress, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end
