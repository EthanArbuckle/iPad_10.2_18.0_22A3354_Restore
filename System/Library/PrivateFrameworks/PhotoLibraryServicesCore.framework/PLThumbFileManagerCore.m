@implementation PLThumbFileManagerCore

- (PLThumbFileManagerCore)initWithImageFormat:(id)a3 pathManager:(id)a4
{
  id v8;
  id v9;
  PLThumbFileManagerCore *v10;
  PLThumbFileManagerCore *v11;
  void *v13;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLThumbFileManagerCore.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("format"));

  }
  v14.receiver = self;
  v14.super_class = (Class)PLThumbFileManagerCore;
  v10 = -[PLThumbFileManagerCore init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_format, a3);
    pl_dispatch_once(&PLIsReallyAssetsd_didCheckReadOnly, &__block_literal_global_42_3368);
    v11->_readOnly = (PLIsReallyAssetsd_isAssetsd == 0) & (__PLIsAssetsdProxyService ^ 1);
    objc_storeStrong((id *)&v11->_pathManager, a4);
    v11->_recipeId = (2 * objc_msgSend(v8, "formatID")) | 0x40001;
  }

  return v11;
}

- (NSString)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PLThumbFileManagerCore;
  -[PLThumbFileManagerCore description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "appendFormat:", CFSTR(" _format %@"), self->_format);
  objc_msgSend(v4, "appendFormat:", CFSTR(" r/o %d"), self->_readOnly);
  objc_msgSend(v4, "appendFormat:", CFSTR(" _recipeId %d"), self->_recipeId);
  return (NSString *)v4;
}

- (BOOL)isReadOnly
{
  return self->_readOnly;
}

- (BOOL)usesThumbIdentifiers
{
  return 1;
}

- (id)thumbnailPathForThumbIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "thumbnailPathForThumbIdentifier:withPathManager:recipeID:forDelete:", v4, self->_pathManager, self->_recipeId, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)deleteEntryWithIdentifier:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  NSObject *v7;
  char v8;
  id v9;
  void *v10;
  char v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  pl_dispatch_once(&PLIsReallyAssetsd_didCheckReadOnly, &__block_literal_global_42_3368);
  if (PLIsReallyAssetsd_isAssetsd)
    v5 = 0;
  else
    v5 = __PLIsAssetsdProxyService == 0;
  if (!v5)
  {
    objc_msgSend((id)objc_opt_class(), "thumbnailPathForThumbIdentifier:withPathManager:recipeID:forDelete:", v4, self->_pathManager, self->_recipeId, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
LABEL_10:

      goto LABEL_11;
    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = objc_claimAutoreleasedReturnValue();
    v12 = 0;
    v8 = -[NSObject removeItemAtPath:error:](v7, "removeItemAtPath:error:", v6, &v12);
    v9 = v12;
    v10 = v9;
    if ((v8 & 1) == 0)
    {
      v11 = PLIsErrorFileNotFound(v9);

      if ((v11 & 1) != 0)
        goto LABEL_9;
      PLThumbnailsGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v6;
        _os_log_impl(&dword_199DF7000, v7, OS_LOG_TYPE_ERROR, "Could not delete master thumb at path %@", buf, 0xCu);
      }
    }

LABEL_9:
    goto LABEL_10;
  }
LABEL_11:

}

- (id)beginThumbnailSafePropertyUpdatesOnAssetThumbnailIdentifier:(id)a3
{
  return a3;
}

- (void)endThumbnailSafePropertyUpdatesOnAssetThumbnailIdentifier:(id)a3 withToken:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v6;
  if (objc_msgSend(v7, "length") && objc_msgSend(v8, "length"))
  {
    -[PLThumbFileManagerCore thumbnailPathForThumbIdentifier:](self, "thumbnailPathForThumbIdentifier:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLThumbFileManagerCore thumbnailPathForThumbIdentifier:](self, "thumbnailPathForThumbIdentifier:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "isEqualToString:", v9) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "moveItemAtPath:toPath:error:", v9, v10, 0);

      if ((v12 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringByDeletingLastPathComponent");
        v14 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v14, 1, 0, 0);

        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v14) = objc_msgSend(v15, "moveItemAtPath:toPath:error:", v9, v10, 0);

        if ((v14 & 1) == 0)
        {
          PLThumbnailsGetLog();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            v17 = 138412546;
            v18 = v9;
            v19 = 2112;
            v20 = v10;
            _os_log_impl(&dword_199DF7000, v16, OS_LOG_TYPE_DEFAULT, "couldn't move thumbnail from %@ to %@", (uint8_t *)&v17, 0x16u);
          }

        }
      }
    }

  }
}

- (BOOL)setImageForEntry:(id)a3 withIdentifier:(id)a4 orIndex:(unint64_t)a5 photoUUID:(id)a6 options:(id)a7
{
  -[PLThumbFileManagerCore doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5, a6, a7);
  return 0;
}

- (id)imageDataWithIdentifier:(id)a3 orIndex:(unint64_t)a4 width:(int *)a5 height:(int *)a6 bytesPerRow:(int *)a7 dataWidth:(int *)a8 dataHeight:(int *)a9 dataOffset:(int *)a10
{
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v11 = a3;
  if (objc_msgSend(v11, "length"))
  {
    v12 = (void *)MEMORY[0x1E0C99D50];
    -[PLThumbFileManagerCore thumbnailPathForThumbIdentifier:](self, "thumbnailPathForThumbIdentifier:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dataWithContentsOfFile:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (CGImage)createImageWithIdentifier:(id)a3 orIndex:(unint64_t)a4
{
  -[PLThumbFileManagerCore doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  return 0;
}

- (BOOL)validateData:(id)a3 withToken:(id)a4
{
  return 1;
}

- (NSString)path
{
  return self->_path;
}

- (PLImageFormat)format
{
  return (PLImageFormat *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_pathManager, 0);
  objc_storeStrong((id *)&self->_format, 0);
}

+ (id)thumbnailIdentifierURLComponentsForUBFWithAssetUUID:(id)a3 bundleScope:(unsigned __int16)a4
{
  unsigned int v4;
  objc_class *v5;
  id v6;
  id v7;
  void *v8;

  v4 = a4;
  v5 = (objc_class *)MEMORY[0x1E0CB3998];
  v6 = a3;
  v7 = objc_alloc_init(v5);
  objc_msgSend(v7, "setScheme:", CFSTR("ubf"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d/%@"), v4, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setPath:", v8);
  return v7;
}

+ (id)_fileIdentifierForThumbnailIdentifierComponents:(id)a3 recipeID:(unsigned int)a4
{
  uint64_t v4;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int16 v11;
  void *v12;
  PLPhotoLibraryFileIdentifier *v13;
  void *v14;
  PLPhotoLibraryFileIdentifier *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v20;
  void *v21;
  uint64_t v22;

  v4 = *(_QWORD *)&a4;
  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(v7, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pathComponents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count") == 2)
  {
    objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "integerValue");

    objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = [PLPhotoLibraryFileIdentifier alloc];
    objc_msgSend((id)*MEMORY[0x1E0CEC530], "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[PLPhotoLibraryFileIdentifier initWithAssetUuid:bundleScope:uti:resourceVersion:recipeID:](v13, "initWithAssetUuid:bundleScope:uti:resourceVersion:recipeID:", v12, v11, v14, 3, v4);

  }
  else
  {
    PLBackendGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "string");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138412290;
      v21 = v17;
      _os_log_impl(&dword_199DF7000, v16, OS_LOG_TYPE_ERROR, "Invalid thumbnail identifier for file identifier: %@", (uint8_t *)&v20, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLThumbFileManagerCore.m"), 83, CFSTR("Invalid thumbnail identifier for file identifier"));

    v15 = 0;
  }

  return v15;
}

+ (id)thumbnailPathForThumbIdentifier:(id)a3 withPathManager:(id)a4 recipeID:(unsigned int)a5 forDelete:(BOOL)a6
{
  _BOOL4 v6;
  uint64_t v7;
  id v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  uint8_t buf[4];
  id v30;
  uint64_t v31;

  v6 = a6;
  v7 = *(_QWORD *)&a5;
  v31 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  if (v11)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithString:", v11);
    objc_msgSend(v13, "scheme");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("ubf"));

    if (v15)
    {
      objc_msgSend((id)objc_opt_class(), "_fileIdentifierForThumbnailIdentifierComponents:recipeID:", v13, v7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "readOnlyUrlWithIdentifier:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "path");
      v18 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v13, "scheme");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("dcim"));

      if (!v21)
      {
        PLBackendGetLog();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v30 = v11;
          _os_log_impl(&dword_199DF7000, v23, OS_LOG_TYPE_ERROR, "Invalid thumbnail identifier scheme: %@", buf, 0xCu);
        }

        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLThumbFileManagerCore.m"), 108, CFSTR("Invalid thumbnail identfier scheme"));

        v19 = 0;
        goto LABEL_13;
      }
      if (!v6)
      {
        v26 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v12, "photoDirectoryWithType:createIfNeeded:error:", 12, 1, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "path");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d.JPG"), (unsigned __int16)v7 >> 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "stringWithFormat:", CFSTR("%@/%@/%@"), v16, v27, v28);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_5;
      }
      v22 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v12, "photoDirectoryWithType:createIfNeeded:error:", 12, 1, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "path");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "stringWithFormat:", CFSTR("%@/%@"), v16, v17);
      v18 = objc_claimAutoreleasedReturnValue();
    }
    v19 = (void *)v18;

LABEL_5:
LABEL_13:

    goto LABEL_14;
  }
  v19 = 0;
LABEL_14:

  return v19;
}

+ ($2825F4736939C4A6D3AD43837233062D)maxMasterSizeFromSourceImageSize:(id)a3 format:(id)a4
{
  id v6;
  double v7;
  uint64_t v8;
  double v9;
  unint64_t v10;
  double v11;
  NSObject *v12;
  double v13;
  double v14;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(v6, "dimension");
  v8 = (int)v7;
  objc_msgSend(v6, "dimension");
  v10 = v8 | ((unint64_t)(int)v9 << 32);
  switch(objc_msgSend(v6, "formatMode"))
  {
    case 0:
      PLThumbnailsGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v16 = 138412290;
        v17 = a1;
        _os_log_impl(&dword_199DF7000, v12, OS_LOG_TYPE_ERROR, "Invalid format mode for ThumbFile (%@)", (uint8_t *)&v16, 0xCu);
      }

      break;
    case 1:
    case 3:
    case 4:
      objc_msgSend(v6, "dimension");
      v10 = PLScaleDimensionsToShortSide(*(_QWORD *)&a3, (int)v11, 5 * (int)v11);
      break;
    case 2:
      objc_msgSend(v6, "scaledSizeForSourceSize:", (double)a3.var0, (double)a3.var1);
      v10 = (int)v13 | ((unint64_t)(int)v14 << 32);
      break;
    default:
      break;
  }

  return ($2825F4736939C4A6D3AD43837233062D)v10;
}

@end
