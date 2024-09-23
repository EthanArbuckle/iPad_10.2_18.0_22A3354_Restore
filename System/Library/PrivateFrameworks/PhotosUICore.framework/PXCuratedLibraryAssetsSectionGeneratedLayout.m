@implementation PXCuratedLibraryAssetsSectionGeneratedLayout

- (void)getSpriteZPosition:(float *)a3 clippingRect:(CGRect *)a4 forSpriteKind:(int64_t)a5
{
  int v5;
  CGSize v6;

  if (!a5)
  {
    v5 = 0;
    goto LABEL_5;
  }
  if (a5 == 1)
  {
    v5 = -1093874483;
LABEL_5:
    *(_DWORD *)a3 = v5;
  }
  v6 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
  a4->origin = (CGPoint)*MEMORY[0x1E0C9D628];
  a4->size = v6;
}

- (void)spritesDidUpdate
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  _OWORD v24[2];
  __int128 v25;
  __int128 v26;
  _OWORD v27[2];
  uint64_t v28;
  _OWORD v29[2];
  int v30;
  objc_super v31;
  _OWORD v32[10];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v31.receiver = self;
  v31.super_class = (Class)PXCuratedLibraryAssetsSectionGeneratedLayout;
  -[PXGGeneratedLayout spritesDidUpdate](&v31, sel_spritesDidUpdate);
  v4 = *MEMORY[0x1E0C9D628];
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  -[PXGGeneratedLayout generator](self, "generator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "keyItemIndex");
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = 0;
  }
  else
  {
    v30 = *(_DWORD *)off_1E50B8298;
    memset(v29, 0, sizeof(v29));
    memset(v32, 0, sizeof(v32));
    v28 = 0;
    memset(v27, 0, sizeof(v27));
    -[PXGLayout copyLayoutForSpritesInRange:entities:geometries:styles:infos:](self, "copyLayoutForSpritesInRange:entities:geometries:styles:infos:", v9 | 0x100000000, &v30, v29, v32, v27);
    PXRectWithCenterAndSize();
    v4 = v11;
    v5 = v12;
    v6 = v13;
    v7 = v14;
    -[PXGLayout contentSource](self, "contentSource");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (objc_class *)objc_opt_class();
        NSStringFromClass(v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "px_descriptionForAssertionMessage");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryAssetsSectionGeneratedLayout.m"), 55, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.contentSource"), v22, v23);

      }
      v25 = 0u;
      v26 = 0u;
      objc_msgSend(v15, "sectionIndexPath");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryAssetsSectionGeneratedLayout.m"), 55, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.contentSource"), v19);

      v25 = 0u;
      v26 = 0u;
    }
    *(_QWORD *)&v26 = objc_msgSend(v8, "keyItemIndex");
    objc_msgSend(v15, "dataSource");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v25;
    v24[1] = v26;
    objc_msgSend(v16, "assetAtItemIndexPath:", v24);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[PXCuratedLibraryAssetsSectionGeneratedLayout setPresentedKeyAsset:](self, "setPresentedKeyAsset:", v10);
  -[PXCuratedLibraryAssetsSectionGeneratedLayout setPresentedKeyAssetRect:](self, "setPresentedKeyAssetRect:", v4, v5, v6, v7);

}

- (void)setPresentedKeyAssetRect:(CGRect)a3
{
  self->_presentedKeyAssetRect = a3;
}

- (void)setPresentedKeyAsset:(id)a3
{
  objc_storeStrong((id *)&self->_presentedKeyAsset, a3);
}

- (PXCuratedLibraryAssetsSectionGeneratedLayout)init
{
  PXCuratedLibraryAssetsSectionGeneratedLayout *result;
  CGSize v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXCuratedLibraryAssetsSectionGeneratedLayout;
  result = -[PXGGeneratedLayout init](&v4, sel_init);
  if (result)
  {
    v3 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    result->_presentedKeyAssetRect.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    result->_presentedKeyAssetRect.size = v3;
  }
  return result;
}

- (PXCuratedLibrarySectionGeometryDescriptor)presentedGeometryDescriptor
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  PXCuratedLibrarySectionGeometryDescriptor *v20;
  PXCuratedLibrarySectionGeometryDescriptor *v21;
  __int128 v23;

  -[PXCuratedLibraryAssetsSectionGeneratedLayout sectionRect](self, "sectionRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PXCuratedLibraryAssetsSectionGeneratedLayout presentedKeyAssetRect](self, "presentedKeyAssetRect");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[PXCuratedLibraryAssetsSectionGeneratedLayout presentedKeyAsset](self, "presentedKeyAsset");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = [PXCuratedLibrarySectionGeometryDescriptor alloc];
  HIDWORD(v23) = *((_DWORD *)off_1E50B8248 + 3);
  *(_QWORD *)((char *)&v23 + 4) = *(_QWORD *)((char *)off_1E50B8248 + 4);
  LODWORD(v23) = *(_DWORD *)off_1E50B8248;
  v21 = -[PXCuratedLibrarySectionGeometryDescriptor initWithSectionRect:headerRect:keyAssetRect:headerCornerRadius:headerAsset:](v20, "initWithSectionRect:headerRect:keyAssetRect:headerCornerRadius:headerAsset:", v19, v4, v6, v8, v10, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24), v12, v14, v16, v18, v23);

  return v21;
}

- (CGRect)sectionRect
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryAssetsSectionGeneratedLayout.m"), 85, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXCuratedLibraryAssetsSectionGeneratedLayout sectionRect]", v6);

  abort();
}

- (void)enumerateHeroSpritesInRect:(CGRect)a3 usingBlock:(id)a4
{
  id v6;
  void *v7;
  objc_class *v8;
  void *v9;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryAssetsSectionGeneratedLayout.m"), 89, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXCuratedLibraryAssetsSectionGeneratedLayout enumerateHeroSpritesInRect:usingBlock:]", v9);

  abort();
}

- (PXDisplayAsset)presentedKeyAsset
{
  return self->_presentedKeyAsset;
}

- (CGRect)presentedKeyAssetRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_presentedKeyAssetRect.origin.x;
  y = self->_presentedKeyAssetRect.origin.y;
  width = self->_presentedKeyAssetRect.size.width;
  height = self->_presentedKeyAssetRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentedKeyAsset, 0);
}

@end
