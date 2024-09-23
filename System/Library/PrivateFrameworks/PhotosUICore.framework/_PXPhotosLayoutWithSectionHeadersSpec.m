@implementation _PXPhotosLayoutWithSectionHeadersSpec

- (_PXPhotosLayoutWithSectionHeadersSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 gridStyle:(int64_t)a5 wantsToggleSidebarButton:(BOOL)a6 shouldMakeSpaceForToggleSidebarButton:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v12;
  _PXPhotosLayoutWithSectionHeadersSpec *v13;
  PXPhotosSectionHeaderLayoutSpec *v14;
  PXPhotosSectionHeaderLayoutSpec *sectionHeaderSpec;
  objc_super v17;

  v7 = a7;
  v8 = a6;
  v12 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_PXPhotosLayoutWithSectionHeadersSpec;
  v13 = -[PXPhotosLayoutSpec initWithExtendedTraitCollection:options:gridStyle:wantsToggleSidebarButton:shouldMakeSpaceForToggleSidebarButton:](&v17, sel_initWithExtendedTraitCollection_options_gridStyle_wantsToggleSidebarButton_shouldMakeSpaceForToggleSidebarButton_, v12, a4, a5, v8, v7);
  if (v13)
  {
    v14 = -[PXPhotosSectionHeaderLayoutSpec initWithExtendedTraitCollection:options:]([PXPhotosSectionHeaderLayoutSpec alloc], "initWithExtendedTraitCollection:options:", v12, a4);
    sectionHeaderSpec = v13->_sectionHeaderSpec;
    v13->_sectionHeaderSpec = v14;

  }
  return v13;
}

- (id)sectionHeaderSpec
{
  return self->_sectionHeaderSpec;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionHeaderSpec, 0);
}

@end
