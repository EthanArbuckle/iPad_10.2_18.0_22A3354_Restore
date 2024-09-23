@implementation MSDInstallableFileContext

- (MSDInstallableFileContext)init
{
  MSDInstallableFileContext *v2;
  MSDInstallableFileContext *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MSDInstallableFileContext;
  v2 = -[MSDInstallableFileContext init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    -[MSDInstallableFileContext setDeleteInstallableFileAfterInstall:](v2, "setDeleteInstallableFileAfterInstall:", 1);
    -[MSDInstallableFileContext setVerifyFileHash:](v3, "setVerifyFileHash:", 0);
  }
  return v3;
}

- (id)uniqueName
{
  NSString *v3;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *v8;
  NSString *uniqueName;

  if (!self->_uniqueName)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationContext identifier](self, "identifier"));

    if (!v5)
    {
      v3 = 0;
      return v3;
    }
    if (!self->_uniqueName)
    {
      if (!-[MSDInstallableFileContext fileType](self, "fileType"))
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationContext identifier](self, "identifier"));
        v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Application.%@"), v6);
        goto LABEL_15;
      }
      if ((id)-[MSDInstallableFileContext fileType](self, "fileType") == (id)1)
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationContext identifier](self, "identifier"));
        v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("StandalonePackage.%@"), v6);
LABEL_15:
        v8 = (NSString *)objc_claimAutoreleasedReturnValue(v7);
        uniqueName = self->_uniqueName;
        self->_uniqueName = v8;

        goto LABEL_2;
      }
      if ((id)-[MSDInstallableFileContext fileType](self, "fileType") == (id)2)
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationContext identifier](self, "identifier"));
        v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ProvisioningProfile.%@"), v6);
        goto LABEL_15;
      }
      if ((id)-[MSDInstallableFileContext fileType](self, "fileType") == (id)3)
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationContext identifier](self, "identifier"));
        v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ConfigurationProfile.%@"), v6);
        goto LABEL_15;
      }
    }
  }
LABEL_2:
  v3 = self->_uniqueName;
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MSDInstallableFileContext;
  v4 = -[MSDOperationContext copyWithZone:](&v6, "copyWithZone:", a3);
  objc_msgSend(v4, "setFileType:", self->_fileType);
  objc_msgSend(v4, "setFileHash:", self->_fileHash);
  objc_msgSend(v4, "setOriginServer:", self->_originServer);
  objc_msgSend(v4, "setUniqueIdentifier:", self->_uniqueIdentifier);
  objc_msgSend(v4, "setCurrentUniqueIdentifier:", self->_currentUniqueIdentifier);
  objc_msgSend(v4, "setUseDiffPatch:", self->_useDiffPatch);
  objc_msgSend(v4, "setAlreadyInstalled:", self->_alreadyInstalled);
  objc_msgSend(v4, "setPricingAppUpdateDeferred:", self->_pricingAppUpdateDeferred);
  return v4;
}

- (int64_t)fileType
{
  return self->_fileType;
}

- (void)setFileType:(int64_t)a3
{
  self->_fileType = a3;
}

- (NSString)fileHash
{
  return self->_fileHash;
}

- (void)setFileHash:(id)a3
{
  objc_storeStrong((id *)&self->_fileHash, a3);
}

- (NSString)originServer
{
  return self->_originServer;
}

- (void)setOriginServer:(id)a3
{
  objc_storeStrong((id *)&self->_originServer, a3);
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, a3);
}

- (NSString)currentUniqueIdentifier
{
  return self->_currentUniqueIdentifier;
}

- (void)setCurrentUniqueIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_currentUniqueIdentifier, a3);
}

- (BOOL)useDiffPatch
{
  return self->_useDiffPatch;
}

- (void)setUseDiffPatch:(BOOL)a3
{
  self->_useDiffPatch = a3;
}

- (BOOL)alreadyInstalled
{
  return self->_alreadyInstalled;
}

- (void)setAlreadyInstalled:(BOOL)a3
{
  self->_alreadyInstalled = a3;
}

- (BOOL)pricingAppUpdateDeferred
{
  return self->_pricingAppUpdateDeferred;
}

- (void)setPricingAppUpdateDeferred:(BOOL)a3
{
  self->_pricingAppUpdateDeferred = a3;
}

- (BOOL)deleteInstallableFileAfterInstall
{
  return self->_deleteInstallableFileAfterInstall;
}

- (void)setDeleteInstallableFileAfterInstall:(BOOL)a3
{
  self->_deleteInstallableFileAfterInstall = a3;
}

- (BOOL)verifyFileHash
{
  return self->_verifyFileHash;
}

- (void)setVerifyFileHash:(BOOL)a3
{
  self->_verifyFileHash = a3;
}

- (NSString)profileIdentifier
{
  return self->_profileIdentifier;
}

- (void)setProfileIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_profileIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileIdentifier, 0);
  objc_storeStrong((id *)&self->_currentUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_originServer, 0);
  objc_storeStrong((id *)&self->_fileHash, 0);
  objc_storeStrong((id *)&self->_uniqueName, 0);
}

@end
