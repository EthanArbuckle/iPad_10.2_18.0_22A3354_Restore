@implementation PXMomentShareStatus

- (PXMomentShareStatus)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMomentShareStatus.m"), 38, CFSTR("%s is not available as initializer"), "-[PXMomentShareStatus init]");

  abort();
}

- (PXMomentShareStatus)initWithMomentShare:(id)a3
{
  id v6;
  PXMomentShareStatus *v7;
  PXMomentShareStatus *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMomentShareStatus.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("momentShare"));

  }
  v11.receiver = self;
  v11.super_class = (Class)PXMomentShareStatus;
  v7 = -[PXMomentShareStatus init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_momentShare, a3);

  return v8;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p, number of downloaded assets: %lu, number of copied assets: %lu, number of assets total: %lu, share: \"%@\">"), objc_opt_class(), self, -[PXDisplayAssetFetchResult count](self->_copyingAssetsFetchResult, "count"), -[PXDisplayAssetFetchResult count](self->_copiedAssetsFetchResult, "count"), -[PXDisplayAssetFetchResult count](self->_allAssetsFetchResult, "count"), self->_momentShare);
}

- (PXCPLUIStatusProvider)statusProvider
{
  PXCPLUIStatusProvider *statusProvider;
  PXCPLUIStatusProvider *v4;
  PXCPLUIStatusProvider *v5;

  statusProvider = self->_statusProvider;
  if (!statusProvider)
  {
    -[PXMomentShareStatus _createStatusProvider](self, "_createStatusProvider");
    v4 = (PXCPLUIStatusProvider *)objc_claimAutoreleasedReturnValue();
    v5 = self->_statusProvider;
    self->_statusProvider = v4;

    statusProvider = self->_statusProvider;
  }
  return statusProvider;
}

- (void)performChanges:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXMomentShareStatus;
  -[PXMomentShareStatus performChanges:](&v3, sel_performChanges_, a3);
}

- (void)setMomentShare:(id)a3
{
  PXDisplayMomentShare *v5;
  PXDisplayMomentShare *v6;

  v5 = (PXDisplayMomentShare *)a3;
  if (self->_momentShare != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_momentShare, a3);
    -[PXMomentShareStatus signalChange:](self, "signalChange:", 1);
    v5 = v6;
  }

}

- (void)setCopyingAssetsFetchResult:(id)a3
{
  PXDisplayAssetFetchResult *v5;
  PXDisplayAssetFetchResult *v6;

  v5 = (PXDisplayAssetFetchResult *)a3;
  if (self->_copyingAssetsFetchResult != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_copyingAssetsFetchResult, a3);
    -[PXMomentShareStatus signalChange:](self, "signalChange:", 2);
    v5 = v6;
  }

}

- (void)setCopiedAssetsFetchResult:(id)a3
{
  PXDisplayAssetFetchResult *v5;
  PXDisplayAssetFetchResult *v6;

  v5 = (PXDisplayAssetFetchResult *)a3;
  if (self->_copiedAssetsFetchResult != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_copiedAssetsFetchResult, a3);
    -[PXMomentShareStatus signalChange:](self, "signalChange:", 4);
    v5 = v6;
  }

}

- (void)setAllAssetsFetchResult:(id)a3
{
  PXDisplayAssetFetchResult *v5;
  PXDisplayAssetFetchResult *v6;

  v5 = (PXDisplayAssetFetchResult *)a3;
  if (self->_allAssetsFetchResult != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_allAssetsFetchResult, a3);
    -[PXMomentShareStatus signalChange:](self, "signalChange:", 8);
    v5 = v6;
  }

}

- (id)_createStatusProvider
{
  return 0;
}

- (PXDisplayMomentShare)momentShare
{
  return self->_momentShare;
}

- (PXCMMInvitation)invitation
{
  return self->_invitation;
}

- (PXDisplayAssetFetchResult)copyingAssetsFetchResult
{
  return self->_copyingAssetsFetchResult;
}

- (PXDisplayAssetFetchResult)copiedAssetsFetchResult
{
  return self->_copiedAssetsFetchResult;
}

- (PXDisplayAssetFetchResult)allAssetsFetchResult
{
  return self->_allAssetsFetchResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allAssetsFetchResult, 0);
  objc_storeStrong((id *)&self->_copiedAssetsFetchResult, 0);
  objc_storeStrong((id *)&self->_copyingAssetsFetchResult, 0);
  objc_storeStrong((id *)&self->_invitation, 0);
  objc_storeStrong((id *)&self->_momentShare, 0);
  objc_storeStrong((id *)&self->_statusProvider, 0);
}

+ (PXMomentShareStatus)new
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXMomentShareStatus.m"), 42, CFSTR("%s is not available as initializer"), "+[PXMomentShareStatus new]");

  abort();
}

@end
