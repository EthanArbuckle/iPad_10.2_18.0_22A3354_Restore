@implementation _PXPhotosSearchBodyCollectionSectionLayout

- (_PXPhotosSearchBodyCollectionSectionLayout)init
{
  _PXPhotosSearchBodyCollectionSectionLayout *v2;
  PXPhotosSearchBodyContainerInfo *v3;
  PXPhotosSearchBodyContainerInfo *containerInfo;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_PXPhotosSearchBodyCollectionSectionLayout;
  v2 = -[PXGSingleViewLayout init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(PXPhotosSearchBodyContainerInfo);
    containerInfo = v2->_containerInfo;
    v2->_containerInfo = v3;

  }
  return v2;
}

- (void)referenceSizeDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_PXPhotosSearchBodyCollectionSectionLayout;
  -[PXGSingleViewLayout referenceSizeDidChange](&v3, sel_referenceSizeDidChange);
  -[PXGLayout referenceSize](self, "referenceSize");
  -[PXPhotosSearchBodyContainerInfo setContainerSize:](self->_containerInfo, "setContainerSize:");
}

- (id)axSpriteIndexes
{
  return objc_alloc_init(MEMORY[0x1E0CB36B8]);
}

- (id)axSpriteIndexesInRect:(CGRect)a3
{
  return objc_alloc_init(MEMORY[0x1E0CB36B8]);
}

- (PXPhotosSearchBodyContainerInfo)containerInfo
{
  return self->_containerInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerInfo, 0);
}

@end
