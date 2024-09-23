@implementation PXFileBackedAsset

- (PXFileBackedAsset)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFileBackedAsset.m"), 79, CFSTR("%s is not available as initializer"), "-[PXFileBackedAsset init]");

  abort();
}

- (PXFileBackedAsset)initWithDescription:(id)a3
{
  id v5;
  PXFileBackedAsset *v6;
  void *v7;
  uint64_t v8;
  NSURL *url;
  uint64_t v10;
  UIImage *previewImage;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSString *uniformTypeIdentifier;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PXFileBackedAsset;
  v6 = -[PXFileBackedAsset init](&v18, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "url");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "copy");
    url = v6->_url;
    v6->_url = (NSURL *)v8;

    objc_msgSend(v5, "previewImage");
    v10 = objc_claimAutoreleasedReturnValue();
    previewImage = v6->_previewImage;
    v6->_previewImage = (UIImage *)v10;

    v12 = (void *)MEMORY[0x1E0CEC3F8];
    -[NSURL pathExtension](v6->_url, "pathExtension");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "typeWithFilenameExtension:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "identifier");
    v15 = objc_claimAutoreleasedReturnValue();
    uniformTypeIdentifier = v6->_uniformTypeIdentifier;
    v6->_uniformTypeIdentifier = (NSString *)v15;

    objc_storeStrong((id *)&v6->_description, a3);
  }

  return v6;
}

- (PXFileBackedAsset)initWithURL:(id)a3
{
  return -[PXFileBackedAsset initWithURL:previewImage:](self, "initWithURL:previewImage:", a3, 0);
}

- (PXFileBackedAsset)initWithURL:(id)a3 previewImage:(id)a4
{
  id v7;
  id v8;
  void *v9;
  PXFileBackedAsset *v10;
  void *v12;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFileBackedAsset.m"), 99, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("url"));

  }
  +[PXFileBackedAssetDescription simpleImageDescriptionWithURL:previewImage:](PXFileBackedAssetDescription, "simpleImageDescriptionWithURL:previewImage:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PXFileBackedAsset initWithDescription:](self, "initWithDescription:", v9);

  return v10;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXFileBackedAsset;
  -[PXFileBackedAsset description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXFileBackedAsset url](self, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXFileBackedAsset previewImage](self, "previewImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" - URL: %@, PreviewImage: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (int64_t)mediaType
{
  void *v2;
  void *v3;
  int64_t v4;

  -[PXFileBackedAssetDescription objectForKeyedSubscript:](self->_description, "objectForKeyedSubscript:", CFSTR("mediaType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = (int)objc_msgSend(v2, "shortValue");
  else
    v4 = 1;

  return v4;
}

- (unint64_t)mediaSubtypes
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[PXFileBackedAssetDescription objectForKeyedSubscript:](self->_description, "objectForKeyedSubscript:", CFSTR("mediaSubtypes"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = (int)objc_msgSend(v2, "shortValue");
  else
    v4 = 0;

  return v4;
}

- (int64_t)playbackStyle
{
  void *v2;
  void *v3;
  int64_t v4;

  -[PXFileBackedAssetDescription objectForKeyedSubscript:](self->_description, "objectForKeyedSubscript:", CFSTR("playbackStyle"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = (int)objc_msgSend(v2, "shortValue");
  else
    v4 = 1;

  return v4;
}

- (unsigned)playbackVariation
{
  void *v2;
  void *v3;
  unsigned __int16 v4;

  -[PXFileBackedAssetDescription objectForKeyedSubscript:](self->_description, "objectForKeyedSubscript:", CFSTR("playbackVariation"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "shortValue");
  else
    v4 = 0;

  return v4;
}

- (BOOL)isFavorite
{
  void *v2;
  char v3;

  -[PXFileBackedAssetDescription objectForKeyedSubscript:](self->_description, "objectForKeyedSubscript:", CFSTR("favorite"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)representsBurst
{
  void *v2;
  char v3;

  -[PXFileBackedAssetDescription objectForKeyedSubscript:](self->_description, "objectForKeyedSubscript:", CFSTR("representsBurst"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)isPartOfStack
{
  return 0;
}

- (BOOL)isInCloud
{
  void *v2;
  char v3;

  -[PXFileBackedAssetDescription objectForKeyedSubscript:](self->_description, "objectForKeyedSubscript:", CFSTR("isInCloud"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)isInSharedLibrary
{
  return 0;
}

- (BOOL)isEligibleForAutoPlayback
{
  return 0;
}

- (float)audioScore
{
  return 0.0;
}

- (unint64_t)pixelWidth
{
  double v2;

  -[PXFileBackedAsset size](self, "size");
  return (unint64_t)v2;
}

- (unint64_t)pixelHeight
{
  double v2;

  -[PXFileBackedAsset size](self, "size");
  return (unint64_t)v2;
}

- (unint64_t)thumbnailIndex
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (Class)defaultImageProviderClass
{
  return (Class)objc_opt_class();
}

- (int64_t)isContentEqualTo:(id)a3
{
  return 1;
}

- (BOOL)isEqualToFileBackedAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PXFileBackedAsset url](self, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqual:", v6);
  return (char)v4;
}

- (BOOL)isEqual:(id)a3
{
  PXFileBackedAsset *v4;
  BOOL v5;

  v4 = (PXFileBackedAsset *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[PXFileBackedAsset isEqualToFileBackedAsset:](self, "isEqualToFileBackedAsset:", v4);
  }

  return v5;
}

- (BOOL)hasPeopleSceneMidOrGreaterConfidence
{
  return 0;
}

- (NSString)uuid
{
  NSString *fileBackedUUID;
  void *v4;
  NSString *v5;
  NSString *v6;

  fileBackedUUID = self->_fileBackedUUID;
  if (!fileBackedUUID)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_fileBackedUUID;
    self->_fileBackedUUID = v5;

    fileBackedUUID = self->_fileBackedUUID;
  }
  return fileBackedUUID;
}

- (double)weight
{
  return 1.0;
}

- (CGSize)size
{
  double v3;
  double v4;
  CGSize result;

  -[PXFileBackedAsset _loadFileMetadataIfNeeded](self, "_loadFileMetadataIfNeeded");
  -[PFMetadata orientedPixelSize](self->_metadata, "orientedPixelSize");
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGRect)preferredCropRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *(double *)off_1E50B86D0;
  v3 = *((double *)off_1E50B86D0 + 1);
  v4 = *((double *)off_1E50B86D0 + 2);
  v5 = *((double *)off_1E50B86D0 + 3);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)acceptableCropRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *(double *)off_1E50B86D0;
  v3 = *((double *)off_1E50B86D0 + 1);
  v4 = *((double *)off_1E50B86D0 + 2);
  v5 = *((double *)off_1E50B86D0 + 3);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)faceAreaRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D628];
  v3 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGAffineTransform)transform
{
  uint64_t v3;
  __int128 v4;

  v3 = MEMORY[0x1E0C9BAA8];
  v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&retstr->c = v4;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v3 + 32);
  return self;
}

- (CGPoint)positionOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = *MEMORY[0x1E0C9D538];
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (double)aspectRatio
{
  double v3;
  NSObject *v4;
  void *v5;
  double result;
  int v7;
  PXFileBackedAsset *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;
  CGSize v12;

  v11 = *MEMORY[0x1E0C80C00];
  -[PXFileBackedAsset size](self, "size");
  if (v3 <= 0.0)
  {
    PLUIGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      -[PXFileBackedAsset size](self, "size");
      NSStringFromCGSize(v12);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412546;
      v8 = self;
      v9 = 2112;
      v10 = v5;
      _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_ERROR, "PXFileBackedAsset %@: Invalid size encountered: %@", (uint8_t *)&v7, 0x16u);

    }
  }
  -[PXFileBackedAsset size](self, "size");
  PXSizeGetAspectRatio();
  return result;
}

- (CGRect)bestCropRectForAspectRatio:(double)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[PXFileBackedAsset size](self, "size");
  PXRectWithAspectRatioFittingRect();
  PXRectNormalize();
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (NSDate)creationDate
{
  -[PXFileBackedAsset _loadFileMetadataIfNeeded](self, "_loadFileMetadataIfNeeded");
  return (NSDate *)-[PFMetadata creationDate](self->_metadata, "creationDate");
}

- (CLLocation)location
{
  -[PXFileBackedAsset _loadFileMetadataIfNeeded](self, "_loadFileMetadataIfNeeded");
  return (CLLocation *)-[PFMetadata gpsLocation](self->_metadata, "gpsLocation");
}

- (void)_loadFileMetadataIfNeeded
{
  PXFileBackedAsset *v2;
  uint64_t v3;
  PFMetadata *metadata;
  PXFileBackedAsset *obj;

  obj = self;
  objc_sync_enter(obj);
  v2 = obj;
  if (!obj->_metadata)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0D75140]), "initWithImageURL:contentType:options:timeZoneLookup:cacheImageSource:cacheImageData:", obj->_url, 0, 13, 0, 0, 0);
    metadata = obj->_metadata;
    obj->_metadata = (PFMetadata *)v3;

    v2 = obj;
  }
  objc_sync_exit(v2);

}

- (BOOL)canPlayLoopingVideo
{
  return -[PXFileBackedAsset playbackStyle](self, "playbackStyle") == 5;
}

- (BOOL)canPlayPhotoIris
{
  return -[PXFileBackedAsset playbackStyle](self, "playbackStyle") == 3;
}

- (BOOL)isAnimatedImage
{
  return -[PXFileBackedAsset playbackStyle](self, "playbackStyle") == 2;
}

- (NSURL)url
{
  return self->_url;
}

- (UIImage)previewImage
{
  return self->_previewImage;
}

- (NSString)uniformTypeIdentifier
{
  return self->_uniformTypeIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniformTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_previewImage, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_fileBackedUUID, 0);
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

@end
