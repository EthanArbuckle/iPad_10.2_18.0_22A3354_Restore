@implementation PXCMMShowMessageComposeActionPerformer

- (void)performMessageComposeActionWithSession:(id)a3 shareURL:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMActionManager.m"), 200, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("shareURL"));

  }
  objc_storeStrong((id *)&self->_shareURL, a4);
  v14.receiver = self;
  v14.super_class = (Class)PXCMMShowMessageComposeActionPerformer;
  v12 = -[PXCMMActionPerformer performActionWithSession:completionHandler:](&v14, sel_performActionWithSession_completionHandler_, v9, v11);

}

- (id)performActionWithSession:(id)a3 completionHandler:(id)a4
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMActionManager.m"), 206, CFSTR("Message composition requires a share URL"));

  return 0;
}

- (NSURL)shareURL
{
  return self->_shareURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareURL, 0);
}

@end
