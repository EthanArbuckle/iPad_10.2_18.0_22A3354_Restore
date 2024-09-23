@implementation PXCuratedLibraryHitTestResult

- (PXCuratedLibraryHitTestResult)initWithControl:(int64_t)a3 spriteReference:(id)a4 layout:(id)a5
{
  return -[PXCuratedLibraryHitTestResult initWithControl:spriteReference:layout:assetReference:assetCollectionReference:](self, "initWithControl:spriteReference:layout:assetReference:assetCollectionReference:", a3, a4, a5, 0, 0);
}

- (PXCuratedLibraryHitTestResult)initWithControl:(int64_t)a3 spriteReference:(id)a4 layout:(id)a5 assetReference:(id)a6
{
  return -[PXCuratedLibraryHitTestResult initWithControl:spriteReference:layout:assetReference:assetCollectionReference:](self, "initWithControl:spriteReference:layout:assetReference:assetCollectionReference:", a3, a4, a5, a6, 0);
}

- (PXCuratedLibraryHitTestResult)initWithControl:(int64_t)a3 spriteReference:(id)a4 layout:(id)a5 assetCollectionReference:(id)a6
{
  return -[PXCuratedLibraryHitTestResult initWithControl:spriteReference:layout:assetReference:assetCollectionReference:](self, "initWithControl:spriteReference:layout:assetReference:assetCollectionReference:", a3, a4, a5, 0, a6);
}

- (PXCuratedLibraryHitTestResult)initWithControl:(int64_t)a3 spriteReference:(id)a4 layout:(id)a5 assetReference:(id)a6 assetCollectionReference:(id)a7
{
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  PXCuratedLibraryHitTestResult *v18;
  PXCuratedLibraryHitTestResult *v19;
  objc_super v21;

  v13 = a6;
  v14 = a7;
  v15 = v14;
  if (v13)
    v16 = v13;
  else
    v16 = v14;
  v17 = v16;
  v21.receiver = self;
  v21.super_class = (Class)PXCuratedLibraryHitTestResult;
  v18 = -[PXGHitTestResult initWithSpriteReference:layout:identifier:userData:](&v21, sel_initWithSpriteReference_layout_identifier_userData_, a4, a5, 0, v17);
  v19 = v18;
  if (v18)
  {
    v18->_control = a3;
    objc_storeStrong((id *)&v18->_assetReference, a6);
    objc_storeStrong((id *)&v19->_assetCollectionReference, a7);
  }

  return v19;
}

- (PXCuratedLibraryHitTestResult)initWithSpriteReference:(id)a3 layout:(id)a4 identifier:(id)a5 userData:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryHitTestResult.m"), 38, CFSTR("%s is not available as initializer"), "-[PXCuratedLibraryHitTestResult initWithSpriteReference:layout:identifier:userData:]");

  abort();
}

- (int64_t)control
{
  return self->_control;
}

- (PXAssetReference)assetReference
{
  return self->_assetReference;
}

- (PXAssetCollectionReference)assetCollectionReference
{
  return self->_assetCollectionReference;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetCollectionReference, 0);
  objc_storeStrong((id *)&self->_assetReference, 0);
}

@end
