@implementation _PXStoryRecipePhotoKitLibraryReference

- (_PXStoryRecipePhotoKitLibraryReference)initWithKind:(int64_t)a3 url:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PFStoryRecipe+PXStory+PhotoKit.m"), 313, CFSTR("%s is not available as initializer"), "-[_PXStoryRecipePhotoKitLibraryReference initWithKind:url:]");

  abort();
}

- (_PXStoryRecipePhotoKitLibraryReference)initWithPhotoLibrary:(id)a3
{
  id v5;
  void *v6;
  _PXStoryRecipePhotoKitLibraryReference *v7;
  objc_super v9;

  v5 = a3;
  objc_msgSend(v5, "photoLibraryURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)_PXStoryRecipePhotoKitLibraryReference;
  v7 = -[PFStoryConcreteRecipeLibrary initWithKind:url:](&v9, sel_initWithKind_url_, 1, v6);

  if (v7)
    objc_storeStrong((id *)&v7->_photoLibrary, a3);

  return v7;
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
