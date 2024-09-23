@implementation PKSubcredentialProvisioningSharingSessionOperation

- (PKSubcredentialProvisioningSharingSessionOperation)initWithConfiguration:(id)a3 context:(id)a4 delegate:(id)a5
{
  PKSubcredentialProvisioningSharingSessionOperation *v5;
  PKSubcredentialProvisioningSharingSessionOperation *v6;
  PKSubcredentialProvisioningSharingSessionOperation *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKSubcredentialProvisioningSharingSessionOperation;
  v5 = -[PKSubcredentialProvisioningOperation initWithConfiguration:context:delegate:](&v9, sel_initWithConfiguration_context_delegate_, a3, a4, a5);
  v6 = v5;
  if (!v5
    || (-[PKSubcredentialProvisioningSharingSessionOperation sharingSession](v5, "sharingSession"),
        v7 = (PKSubcredentialProvisioningSharingSessionOperation *)objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    v7 = v6;
  }

  return v7;
}

- (id)sharingSession
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[PKSubcredentialProvisioningOperation configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "configurationType");
  if (v3 == 2)
  {
    objc_msgSend(v2, "remoteDeviceConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sharingSession");
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v6 = (void *)v5;

    if (v6)
      goto LABEL_9;
    goto LABEL_6;
  }
  if (v3 == 1)
  {
    objc_msgSend(v2, "acceptInvitationConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "session");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
LABEL_6:
  PKLogFacilityTypeGetObject(0x16uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v9;
    _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Sharing operation is missing its session: %@", (uint8_t *)&v11, 0xCu);

  }
  v6 = 0;
LABEL_9:

  return v6;
}

@end
