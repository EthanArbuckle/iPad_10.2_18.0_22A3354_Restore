@implementation _PXStoryRecipeEnumerator

- (_PXStoryRecipeEnumerator)initWithBatchSize:(unint64_t)a3 photoLibrary:(id)a4 scheme:(id)a5 block:(id)a6
{
  PHPhotoLibrary *v11;
  id v12;
  id v13;
  _PXStoryRecipeEnumerator *v14;
  PHPhotoLibrary *photoLibrary;
  PHPhotoLibrary *v16;
  uint64_t v17;
  NSString *scheme;
  void *v19;
  id block;
  uint64_t v21;
  NSMutableDictionary *identifierMap;
  void *v24;
  void *v25;
  objc_super v26;

  v11 = (PHPhotoLibrary *)a4;
  v12 = a5;
  v13 = a6;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PFStoryRecipe+PXStory+PhotoKit.m"), 232, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary != nil"));

    if (v12)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PFStoryRecipe+PXStory+PhotoKit.m"), 233, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scheme != nil"));

    goto LABEL_3;
  }
  if (!v12)
    goto LABEL_5;
LABEL_3:
  v26.receiver = self;
  v26.super_class = (Class)_PXStoryRecipeEnumerator;
  v14 = -[_PXStoryRecipeEnumerator init](&v26, sel_init);
  photoLibrary = v14->_photoLibrary;
  v14->_batchSize = a3;
  v14->_photoLibrary = v11;
  v16 = v11;

  v17 = objc_msgSend(v12, "copy");
  scheme = v14->_scheme;
  v14->_scheme = (NSString *)v17;

  v19 = _Block_copy(v13);
  block = v14->_block;
  v14->_block = v19;

  v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", a3);
  identifierMap = v14->_identifierMap;
  v14->_identifierMap = (NSMutableDictionary *)v21;

  return v14;
}

- (BOOL)didEnumerateRecipeDisplayAsset:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  char v9;
  NSMutableDictionary *identifierMap;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PFStoryRecipe+PXStory+PhotoKit.m"), 249, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("error != nil"));

  }
  objc_msgSend(v7, "scheme");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", self->_scheme);

  if ((v9 & 1) != 0)
  {
    identifierMap = self->_identifierMap;
    objc_msgSend(v7, "cloudIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](identifierMap, "setObject:forKeyedSubscript:", v7, v11);

    if (-[NSMutableDictionary count](self->_identifierMap, "count") >= self->_batchSize)
      -[_PXStoryRecipeEnumerator _flush](self, "_flush");
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v16 = *MEMORY[0x1E0CB2938];
    v17[0] = CFSTR("Recipe asset doesn't refer to a PhotoKit Asset");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("PXStoryErrorDomain"), 1, v13);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (void)_flush
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSMutableDictionary *v18;
  NSMutableDictionary *identifierMap;
  void *v20;
  _QWORD v21[4];
  id v22;
  _PXStoryRecipeEnumerator *v23;
  uint64_t v24;
  uint64_t v25;
  id (*v26)(uint64_t, void *);
  void *v27;
  id v28;
  _PXStoryRecipeEnumerator *v29;
  SEL v30;

  -[NSMutableDictionary allKeys](self->_identifierMap, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PXMap();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHPhotoLibrary localIdentifierMappingsForCloudIdentifiers:](self->_photoLibrary, "localIdentifierMappingsForCloudIdentifiers:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = MEMORY[0x1E0C809B0];
  v25 = 3221225472;
  v26 = __34___PXStoryRecipeEnumerator__flush__block_invoke_2;
  v27 = &unk_1E5120B90;
  v8 = v6;
  v29 = self;
  v30 = a2;
  v28 = v8;
  PXMap();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v4, "count");
  if (v10 != objc_msgSend(v9, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PFStoryRecipe+PXStory+PhotoKit.m"), 283, CFSTR("Failed to convert all CloudKit identifiers to local identifiers"));

  }
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", self->_batchSize);
  if (objc_msgSend(v4, "count"))
  {
    v12 = 0;
    do
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectAtIndexedSubscript:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, v13);

      ++v12;
    }
    while (v12 < objc_msgSend(v4, "count"));
  }
  -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithLocalIdentifiers:options:", v9, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __34___PXStoryRecipeEnumerator__flush__block_invoke_3;
  v21[3] = &unk_1E51314D8;
  v22 = v11;
  v23 = self;
  v17 = v11;
  objc_msgSend(v16, "enumerateObjectsUsingBlock:", v21);
  v18 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", self->_batchSize);
  identifierMap = self->_identifierMap;
  self->_identifierMap = v18;

}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_identifierMap, 0);
  objc_storeStrong((id *)&self->_scheme, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

@end
