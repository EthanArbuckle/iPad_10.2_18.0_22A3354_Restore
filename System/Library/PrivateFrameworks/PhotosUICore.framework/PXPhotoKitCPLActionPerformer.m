@implementation PXPhotoKitCPLActionPerformer

- (PXPhotoKitCPLActionPerformer)initWithActionType:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitCPLActionPerformer.m"), 87, CFSTR("%s is not available as initializer"), "-[PXPhotoKitCPLActionPerformer initWithActionType:]");

  abort();
}

- (PXPhotoKitCPLActionPerformer)initWithActionType:(id)a3 photoLibrary:(id)a4
{
  id v7;
  id v8;
  PXPhotoKitCPLActionPerformer *v9;
  PXPhotoKitCPLActionPerformer *v10;
  void *v12;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitCPLActionPerformer.m"), 91, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

  }
  v13.receiver = self;
  v13.super_class = (Class)PXPhotoKitCPLActionPerformer;
  v9 = -[PXActionPerformer initWithActionType:](&v13, sel_initWithActionType_, v7);
  v10 = v9;
  if (v9)
    objc_storeStrong((id *)&v9->_photoLibrary, a4);

  return v10;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

@end
