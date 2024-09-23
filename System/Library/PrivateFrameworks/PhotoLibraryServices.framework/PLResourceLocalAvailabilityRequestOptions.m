@implementation PLResourceLocalAvailabilityRequestOptions

- (PLResourceLocalAvailabilityRequestOptions)init
{
  PLResourceLocalAvailabilityRequestOptions *v2;
  uint64_t v3;
  CPLResourceTransferTaskOptions *downloadOptions;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PLResourceLocalAvailabilityRequestOptions;
  v2 = -[PLResourceLocalAvailabilityRequestOptions init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D11458], "defaultOptions");
    v3 = objc_claimAutoreleasedReturnValue();
    downloadOptions = v2->_downloadOptions;
    v2->_downloadOptions = (CPLResourceTransferTaskOptions *)v3;

  }
  return v2;
}

- (BOOL)shouldPrioritize
{
  void *v2;
  char v3;

  -[PLResourceLocalAvailabilityRequestOptions downloadOptions](self, "downloadOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHighPriority");

  return v3;
}

- (BOOL)isNetworkAccessAllowed
{
  return self->_networkAccessAllowed;
}

- (void)setNetworkAccessAllowed:(BOOL)a3
{
  self->_networkAccessAllowed = a3;
}

- (NSString)taskIdentifier
{
  return self->_taskIdentifier;
}

- (void)setTaskIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)wantsProgress
{
  return self->_wantsProgress;
}

- (void)setWantsProgress:(BOOL)a3
{
  self->_wantsProgress = a3;
}

- (BOOL)isTransient
{
  return self->_transient;
}

- (void)setTransient:(BOOL)a3
{
  self->_transient = a3;
}

- (id)dataHandler
{
  return self->_dataHandler;
}

- (void)setDataHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)clientBundleID
{
  return self->_clientBundleID;
}

- (void)setClientBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (CPLResourceTransferTaskOptions)downloadOptions
{
  return self->_downloadOptions;
}

- (void)setDownloadOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadOptions, 0);
  objc_storeStrong((id *)&self->_clientBundleID, 0);
  objc_storeStrong(&self->_dataHandler, 0);
  objc_storeStrong((id *)&self->_taskIdentifier, 0);
}

@end
