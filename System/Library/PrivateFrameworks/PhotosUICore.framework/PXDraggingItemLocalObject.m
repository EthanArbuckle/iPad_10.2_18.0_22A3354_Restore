@implementation PXDraggingItemLocalObject

- (PXDraggingItemLocalObject)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDraggingItemLocalObject.m"), 22, CFSTR("%s is not available as initializer"), "-[PXDraggingItemLocalObject init]");

  abort();
}

- (PXDraggingItemLocalObject)initWithAssetReference:(id)a3
{
  id v5;
  PXDraggingItemLocalObject *v6;
  PXDraggingItemLocalObject *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXDraggingItemLocalObject;
  v6 = -[PXDraggingItemLocalObject init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_assetReference, a3);

  return v7;
}

- (BOOL)needsImport
{
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  BOOL v8;

  -[PXDraggingItemLocalObject assetReference](self, "assetReference");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    return 1;
  -[PXDraggingItemLocalObject assetReference](self, "assetReference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "asset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "sourceType") == 2;

  return v8;
}

- (PXAssetReference)assetReference
{
  return self->_assetReference;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetReference, 0);
}

@end
