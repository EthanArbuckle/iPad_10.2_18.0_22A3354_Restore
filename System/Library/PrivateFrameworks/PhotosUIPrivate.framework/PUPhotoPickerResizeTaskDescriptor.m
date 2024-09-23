@implementation PUPhotoPickerResizeTaskDescriptor

- (PUPhotoPickerResizeTaskDescriptor)initWithLocalizedDescription:(id)a3 targetSize:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  id v7;
  PUPhotoPickerResizeTaskDescriptor *v8;
  uint64_t v9;
  NSString *localizedDescription;
  objc_super v12;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PUPhotoPickerResizeTaskDescriptor;
  v8 = -[PUPhotoPickerResizeTaskDescriptor init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v7, "copy");
    localizedDescription = v8->_localizedDescription;
    v8->_localizedDescription = (NSString *)v9;

    v8->_targetSize.width = width;
    v8->_targetSize.height = height;
  }

  return v8;
}

- (id)localizedDescriptionForAssets:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[PUPhotoPickerResizeTaskDescriptor formattedSizeForAssets:](self, "formattedSizeForAssets:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PULocalizedString(CFSTR("SIZE_PICKER_SIZE_(BYTES)"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PUStringWithValidatedFormat();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)formattedSizeForAssets:(id)a3
{
  unint64_t v3;

  v3 = -[PUPhotoPickerResizeTaskDescriptor estimatedSizeForAssets:](self, "estimatedSizeForAssets:", a3);
  return (id)objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", v3, 0);
}

- (unint64_t)estimatedSizeForAssets:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t j;
  PUPhotoPickerScaledFileSizeEstimator *v18;
  unint64_t cachedSizeEstimate;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3550], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "localIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v8);
  }

  if ((-[NSCountedSet isEqualToSet:](self->_cachedAssetsIdentifiersForEstimation, "isEqualToSet:", v5) & 1) == 0)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v12 = v6;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v13)
    {
      v14 = v13;
      v15 = 0;
      v16 = *(_QWORD *)v22;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v22 != v16)
            objc_enumerationMutation(v12);
          v18 = -[PUPhotoPickerScaledFileSizeEstimator initWithAsset:]([PUPhotoPickerScaledFileSizeEstimator alloc], "initWithAsset:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * j));
          v15 += -[PUPhotoPickerScaledFileSizeEstimator estimatedSizeForResizeDescriptor:](v18, "estimatedSizeForResizeDescriptor:", self);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      }
      while (v14);
    }
    else
    {
      v15 = 0;
    }

    self->_cachedSizeEstimate = v15;
    objc_storeStrong((id *)&self->_cachedAssetsIdentifiersForEstimation, v5);
  }
  cachedSizeEstimate = self->_cachedSizeEstimate;

  return cachedSizeEstimate;
}

- (BOOL)appliesToAsset:(id)a3
{
  id v4;
  PUPhotoPickerScaledFileSizeEstimator *v5;

  v4 = a3;
  v5 = -[PUPhotoPickerScaledFileSizeEstimator initWithAsset:]([PUPhotoPickerScaledFileSizeEstimator alloc], "initWithAsset:", v4);

  LOBYTE(self) = -[PUPhotoPickerScaledFileSizeEstimator wouldResizeAssetUsingResizeDescriptor:](v5, "wouldResizeAssetUsingResizeDescriptor:", self);
  return (char)self;
}

- (BOOL)isEqual:(id)a3
{
  PUPhotoPickerResizeTaskDescriptor *v4;
  BOOL v5;
  BOOL v6;

  v4 = (PUPhotoPickerResizeTaskDescriptor *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    v6 = (objc_opt_isKindOfClass() & 1) != 0
      && (self->_targetSize.width == v4->_targetSize.width
        ? (v5 = self->_targetSize.height == v4->_targetSize.height)
        : (v5 = 0),
          v5)
      && -[NSString isEqualToString:](self->_localizedDescription, "isEqualToString:", v4->_localizedDescription);
  }

  return v6;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_localizedDescription, "hash");
}

- (CGSize)targetSize
{
  double width;
  double height;
  CGSize result;

  width = self->_targetSize.width;
  height = self->_targetSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_cachedAssetsIdentifiersForEstimation, 0);
}

+ (id)defaultLargeDescriptor
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc((Class)a1);
  PULocalizedString(CFSTR("SIZE_PICKER_SIZE_LARGE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithLocalizedDescription:targetSize:", v3, 1280.0, 960.0);

  return v4;
}

+ (id)defaultMediumDescriptor
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc((Class)a1);
  PULocalizedString(CFSTR("SIZE_PICKER_SIZE_MEDIUM"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithLocalizedDescription:targetSize:", v3, 640.0, 480.0);

  return v4;
}

+ (id)defaultSmallDescriptor
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc((Class)a1);
  PULocalizedString(CFSTR("SIZE_PICKER_SIZE_SMALL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithLocalizedDescription:targetSize:", v3, 320.0, 240.0);

  return v4;
}

+ (id)defaultActualSizeDescriptor
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc((Class)a1);
  PULocalizedString(CFSTR("SIZE_PICKER_SIZE_ACTUAL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithLocalizedDescription:targetSize:", v3, *MEMORY[0x1E0CD1C28], *(double *)(MEMORY[0x1E0CD1C28] + 8));

  return v4;
}

+ (id)orderedDefaultDescriptors
{
  if (orderedDefaultDescriptors_onceToken != -1)
    dispatch_once(&orderedDefaultDescriptors_onceToken, &__block_literal_global_66739);
  return (id)orderedDefaultDescriptors_orderedDefaultDescriptors;
}

void __62__PUPhotoPickerResizeTaskDescriptor_orderedDefaultDescriptors__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x1E0C80C00];
  +[PUPhotoPickerResizeTaskDescriptor defaultActualSizeDescriptor](PUPhotoPickerResizeTaskDescriptor, "defaultActualSizeDescriptor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[PUPhotoPickerResizeTaskDescriptor defaultLargeDescriptor](PUPhotoPickerResizeTaskDescriptor, "defaultLargeDescriptor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[PUPhotoPickerResizeTaskDescriptor defaultMediumDescriptor](PUPhotoPickerResizeTaskDescriptor, "defaultMediumDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PUPhotoPickerResizeTaskDescriptor defaultSmallDescriptor](PUPhotoPickerResizeTaskDescriptor, "defaultSmallDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v0;
  v6[1] = v1;
  v6[2] = v2;
  v6[3] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 4);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)orderedDefaultDescriptors_orderedDefaultDescriptors;
  orderedDefaultDescriptors_orderedDefaultDescriptors = v4;

}

@end
