@implementation PXImportSourceNavigationListItem

- (PXImportSourceNavigationListItem)initWithImportSource:(id)a3 photoLibrary:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  PXImportSourceNavigationListItem *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13.receiver = self;
  v13.super_class = (Class)PXImportSourceNavigationListItem;
  v11 = -[PXNavigationListItem initWithIdentifier:title:itemCount:](&v13, sel_initWithIdentifier_title_itemCount_, v9, v10, 0x7FFFFFFFFFFFFFFFLL);

  if (v11)
  {
    objc_storeStrong((id *)&v11->_importSource, a3);
    objc_storeStrong((id *)&v11->_photoLibrary, a4);
  }

  return v11;
}

- (PXImportSourceNavigationListItem)initWithIdentifier:(id)a3 title:(id)a4 itemCount:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXImportSourceNavigationListItem.m"), 29, CFSTR("%s is not available as initializer"), "-[PXImportSourceNavigationListItem initWithIdentifier:title:itemCount:]");

  abort();
}

- (UIImage)image
{
  void *v2;
  void *v3;
  void *v4;

  -[PXImportSourceNavigationListItem importSource](self, "importSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iconSymbolName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v4;
}

- (id)glyphImageName
{
  return CFSTR("camera.on.rectangle");
}

- (id)accessoryGlyphImageName
{
  __CFString *v3;
  void *v4;
  int v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXImportSourceNavigationListItem;
  -[PXNavigationListItem accessoryGlyphImageName](&v7, sel_accessoryGlyphImageName);
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  -[PXImportSourceNavigationListItem importSource](self, "importSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "px_shouldShowCPLOptimizedMessage");

  if (v5)
  {

    v3 = CFSTR("exclamationmark.icloud.fill");
  }
  return v3;
}

- (BOOL)isRemovable
{
  void *v2;
  char v3;

  -[PXImportSourceNavigationListItem importSource](self, "importSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canEject");

  return v3;
}

- (unint64_t)hash
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[PXImportSourceNavigationListItem importSource](self, "importSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  return v4;
}

- (PHImportSource)importSource
{
  return self->_importSource;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_importSource, 0);
}

@end
