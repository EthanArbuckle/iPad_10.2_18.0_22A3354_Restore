@implementation PLThumbnailResourceDataStoreTableRecipe

- (PLThumbnailResourceDataStoreTableRecipe)initWithRecipeID:(unsigned int)a3
{
  uint64_t v3;
  PLThumbnailResourceDataStoreTableRecipe *v5;
  uint64_t v6;
  void *v8;
  objc_super v9;

  v3 = *(_QWORD *)&a3;
  v9.receiver = self;
  v9.super_class = (Class)PLThumbnailResourceDataStoreTableRecipe;
  v5 = -[PLThumbnailResourceDataStoreTableRecipe init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend((id)objc_opt_class(), "classFromRecipeID:", v3);
    if (v6 != objc_opt_class())
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, v5, CFSTR("PLThumbnailResourceDataStoreTableRecipe.m"), 36, CFSTR("wrong recipe class passed to recipe initializer."));

    }
    v5->_recipeID = v3;
  }
  return v5;
}

- (id)colorSpaceGivenSourceColorSpace:(id)a3 inContext:(id)a4
{
  return +[PLColorSpace commonColorSpace_sRGB](PLColorSpace, "commonColorSpace_sRGB", a3, a4);
}

- (id)codecFourCharCodeName
{
  return 0;
}

- (id)uti
{
  return -[PLUniformTypeIdentifier initWithIdentifier:conformanceHint:]([PLUniformTypeIdentifier alloc], "initWithIdentifier:conformanceHint:", CFSTR("public.image"), 1);
}

- (id)supportedVersionsForLocalResourceGeneration
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)chooseIngredientsFrom:(id)a3 version:(unsigned int)a4
{
  return 0;
}

- (void)generateAndStoreForAsset:(id)a3 version:(unsigned int)a4 imageConversionClient:(id)a5 videoConversionClient:(id)a6 conversionServiceOptions:(id)a7 deferredPhotoFinalizer:(id)a8 progress:(id *)a9 reason:(id)a10 completion:(id)a11
{
  uint64_t v11;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[3];
  _QWORD v23[4];

  v11 = *(_QWORD *)&a4;
  v23[3] = *MEMORY[0x1E0C80C00];
  v13 = (void *)MEMORY[0x1E0CB35C8];
  v14 = *MEMORY[0x1E0D74498];
  v22[0] = *MEMORY[0x1E0CB2D50];
  v15 = a11;
  NSStringFromPLErrorCode();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v16;
  v23[1] = self;
  v22[1] = CFSTR("recipe");
  v22[2] = CFSTR("version");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 47005, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E40], "orderedSet");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, void *, void *, void *, _QWORD))v15 + 2))(v15, 0, v19, v20, v21, 0);

}

- (id)description
{
  return +[PLAssetFormats descriptionForImageFormat:](PLAssetFormats, "descriptionForImageFormat:", LOWORD(self->_recipeID) >> 1);
}

- (unsigned)recipeID
{
  return self->_recipeID;
}

- (void)setRecipeID:(unsigned int)a3
{
  self->_recipeID = a3;
}

@end
