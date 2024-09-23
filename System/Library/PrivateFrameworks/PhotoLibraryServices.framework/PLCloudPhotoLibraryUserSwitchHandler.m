@implementation PLCloudPhotoLibraryUserSwitchHandler

- (PLCloudPhotoLibraryUserSwitchHandler)init
{
  PLCloudPhotoLibraryUserSwitchHandler *v4;
  void *v5;
  void *v7;
  objc_super v8;

  if ((PLIsEDUMode() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLCloudPhotoLibraryUserSwitchHandler.m"), 23, CFSTR("Should only be created in EDU mode"));

  }
  v8.receiver = self;
  v8.super_class = (Class)PLCloudPhotoLibraryUserSwitchHandler;
  v4 = -[PLCloudPhotoLibraryUserSwitchHandler init](&v8, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "registerUserSwitchStakeHolder:", v4);

  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterStakeHolder:status:reason:", self, 0, CFSTR("dealloc"));

  v4.receiver = self;
  v4.super_class = (Class)PLCloudPhotoLibraryUserSwitchHandler;
  -[PLCloudPhotoLibraryUserSwitchHandler dealloc](&v4, sel_dealloc);
}

- (void)willSwitchUser
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  -[PLCloudPhotoLibraryUserSwitchHandler sessionHandler](self, "sessionHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0DC5F08], "taskWithName:reason:forBundleID:", CFSTR("CPLEnqueuePendingUploads"), CFSTR("Enqueing pending derivative generation and CPL uploads"), CFSTR("com.apple.cloudphotod"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "begin");
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __54__PLCloudPhotoLibraryUserSwitchHandler_willSwitchUser__block_invoke;
    v5[3] = &unk_1E3677AA0;
    v6 = v3;
    v4 = v3;
    objc_msgSend(v2, "endUserSessionWithCompletionHandler:", v5);

  }
}

- (PLCloudUserSessionHandling)sessionHandler
{
  return (PLCloudUserSessionHandling *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSessionHandler:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionHandler, 0);
}

uint64_t __54__PLCloudPhotoLibraryUserSwitchHandler_willSwitchUser__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "end");
}

@end
