@implementation PXMockDisplayAsset

- (PXMockDisplayAsset)init
{
  void *v3;
  PXMockDisplayAsset *v4;

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PXMockDisplayAsset initWithProperties:](self, "initWithProperties:", v3);

  return v4;
}

- (PXMockDisplayAsset)initWithProperties:(id)a3
{
  id v5;
  PXMockDisplayAsset *v6;
  uint64_t v7;
  NSDictionary *backingDictionary;
  void *v10;
  objc_super v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMockDisplayAsset.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("properties"));

  }
  v11.receiver = self;
  v11.super_class = (Class)PXMockDisplayAsset;
  v6 = -[PXMockDisplayAsset init](&v11, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    backingDictionary = v6->_backingDictionary;
    v6->_backingDictionary = (NSDictionary *)v7;

  }
  return v6;
}

- (int64_t)_integerValueForKey:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  int64_t v8;
  void *v10;
  objc_class *v11;
  void *v12;
  objc_class *v13;
  void *v14;

  v5 = a3;
  -[PXMockDisplayAsset backingDictionary](self, "backingDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMockDisplayAsset.m"), 92, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.backingDictionary[key]"), v12);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "px_descriptionForAssertionMessage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMockDisplayAsset.m"), 92, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.backingDictionary[key]"), v12, v14);

    goto LABEL_6;
  }
LABEL_3:
  v8 = objc_msgSend(v7, "integerValue");

  return v8;
}

- (unint64_t)_unsignedIntegerValueForKey:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v10;
  objc_class *v11;
  void *v12;
  objc_class *v13;
  void *v14;

  v5 = a3;
  -[PXMockDisplayAsset backingDictionary](self, "backingDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMockDisplayAsset.m"), 97, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.backingDictionary[key]"), v12);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "px_descriptionForAssertionMessage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMockDisplayAsset.m"), 97, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.backingDictionary[key]"), v12, v14);

    goto LABEL_6;
  }
LABEL_3:
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  return v8;
}

- (BOOL)_BOOLValueForKey:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v10;
  objc_class *v11;
  void *v12;
  objc_class *v13;
  void *v14;

  v5 = a3;
  -[PXMockDisplayAsset backingDictionary](self, "backingDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMockDisplayAsset.m"), 102, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.backingDictionary[key]"), v12);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "px_descriptionForAssertionMessage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMockDisplayAsset.m"), 102, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.backingDictionary[key]"), v12, v14);

    goto LABEL_6;
  }
LABEL_3:
  v8 = objc_msgSend(v7, "BOOLValue");

  return v8;
}

- (double)_doubleValueForKey:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v11;
  objc_class *v12;
  void *v13;
  objc_class *v14;
  void *v15;

  v5 = a3;
  -[PXMockDisplayAsset backingDictionary](self, "backingDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMockDisplayAsset.m"), 107, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.backingDictionary[key]"), v13);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "px_descriptionForAssertionMessage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMockDisplayAsset.m"), 107, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.backingDictionary[key]"), v13, v15);

    goto LABEL_6;
  }
LABEL_3:
  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  return v9;
}

- (float)_floatValueForKey:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  float v8;
  float v9;
  void *v11;
  objc_class *v12;
  void *v13;
  objc_class *v14;
  void *v15;

  v5 = a3;
  -[PXMockDisplayAsset backingDictionary](self, "backingDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMockDisplayAsset.m"), 112, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.backingDictionary[key]"), v13);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "px_descriptionForAssertionMessage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMockDisplayAsset.m"), 112, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.backingDictionary[key]"), v13, v15);

    goto LABEL_6;
  }
LABEL_3:
  objc_msgSend(v7, "floatValue");
  v9 = v8;

  return v9;
}

- (id)_dateValueForKey:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v9;
  objc_class *v10;
  void *v11;
  objc_class *v12;
  void *v13;

  v5 = a3;
  -[PXMockDisplayAsset backingDictionary](self, "backingDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMockDisplayAsset.m"), 117, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.backingDictionary[key]"), v11);
LABEL_6:

    return v7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "px_descriptionForAssertionMessage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMockDisplayAsset.m"), 117, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.backingDictionary[key]"), v11, v13);

    goto LABEL_6;
  }
  return v7;
}

- (id)_stringValueForKey:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v9;
  objc_class *v10;
  void *v11;
  objc_class *v12;
  void *v13;

  v5 = a3;
  -[PXMockDisplayAsset backingDictionary](self, "backingDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMockDisplayAsset.m"), 122, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.backingDictionary[key]"), v11);
LABEL_6:

    return v7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "px_descriptionForAssertionMessage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMockDisplayAsset.m"), 122, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.backingDictionary[key]"), v11, v13);

    goto LABEL_6;
  }
  return v7;
}

- (int64_t)mediaType
{
  return -[PXMockDisplayAsset _integerValueForKey:](self, "_integerValueForKey:", CFSTR("PXMockDisplayAssetMediaTypeKey"));
}

- (unint64_t)mediaSubtypes
{
  return -[PXMockDisplayAsset _unsignedIntegerValueForKey:](self, "_unsignedIntegerValueForKey:", CFSTR("PXMockDisplayAssetMediaSubtypesKey"));
}

- (NSDate)creationDate
{
  return (NSDate *)-[PXMockDisplayAsset _dateValueForKey:](self, "_dateValueForKey:", CFSTR("PXMockDisplayAssetCreationDateKey"));
}

- (NSDate)localCreationDate
{
  return (NSDate *)-[PXMockDisplayAsset _dateValueForKey:](self, "_dateValueForKey:", CFSTR("PXMockDisplayAssetLocalCreationDateKey"));
}

- (BOOL)isFavorite
{
  return -[PXMockDisplayAsset _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("PXMockDisplayAssetIsFavoriteKey"));
}

- (BOOL)representsBurst
{
  return -[PXMockDisplayAsset _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("PXMockDisplayAssetRepresentsBurstKey"));
}

- (BOOL)isPartOfStack
{
  return 0;
}

- (BOOL)isInCloud
{
  return -[PXMockDisplayAsset _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("PXMockDisplayAssetIsInCloudKey"));
}

- (BOOL)isInSharedLibrary
{
  return 0;
}

- (unint64_t)pixelWidth
{
  return -[PXMockDisplayAsset _unsignedIntegerValueForKey:](self, "_unsignedIntegerValueForKey:", CFSTR("PXMockDisplayAssetPixelWidthKey"));
}

- (unint64_t)pixelHeight
{
  return -[PXMockDisplayAsset _unsignedIntegerValueForKey:](self, "_unsignedIntegerValueForKey:", CFSTR("PXMockDisplayAssetPixelHeightKey"));
}

- (unint64_t)thumbnailIndex
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (int64_t)isContentEqualTo:(id)a3
{
  PXMockDisplayAsset *v4;
  PXMockDisplayAsset *v5;
  void *v6;
  void *v7;
  int64_t v8;

  v4 = (PXMockDisplayAsset *)a3;
  if (self == v4)
  {
    v8 = 2;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[PXMockDisplayAsset backingDictionary](self, "backingDictionary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXMockDisplayAsset backingDictionary](v5, "backingDictionary");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {
        v8 = 2;
      }
      else if (objc_msgSend(v6, "isEqual:", v7))
      {
        v8 = 2;
      }
      else
      {
        v8 = 1;
      }

    }
    else
    {
      v8 = 1;
    }
  }

  return v8;
}

- (BOOL)isEligibleForAutoPlayback
{
  return -[PXMockDisplayAsset _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("PXMockDisplayAssetIsEligibleForAutoPlaybackKey"));
}

- (CGRect)preferredCropRect
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

- (CGRect)acceptableCropRect
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

- (float)audioScore
{
  float result;

  -[PXMockDisplayAsset _floatValueForKey:](self, "_floatValueForKey:", CFSTR("PXMockDisplayAssetAudioScoreKey"));
  return result;
}

- (BOOL)hasPeopleSceneMidOrGreaterConfidence
{
  return 0;
}

- (NSString)uuid
{
  return (NSString *)-[PXMockDisplayAsset _stringValueForKey:](self, "_stringValueForKey:", CFSTR("PXMockDisplayAssetUUIDKey"));
}

- (double)duration
{
  double result;

  -[PXMockDisplayAsset _doubleValueForKey:](self, "_doubleValueForKey:", CFSTR("PXMockDisplayAssetDurationKey"));
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)livePhotoVideoDuration
{
  Float64 v4;

  -[PXMockDisplayAsset _doubleValueForKey:](self, "_doubleValueForKey:", CFSTR("PXMockDisplayAssetLivePhotoDurationKey"));
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMakeWithSeconds((CMTime *)retstr, v4, 600);
}

- (int64_t)playbackStyle
{
  return -[PXMockDisplayAsset _integerValueForKey:](self, "_integerValueForKey:", CFSTR("PXMockDisplayAssetPlaybackStyleKey"));
}

- (unsigned)playbackVariation
{
  return -[PXMockDisplayAsset _integerValueForKey:](self, "_integerValueForKey:", CFSTR("PXMockDisplayAssetPlaybackVariationKey"));
}

- (Class)defaultImageProviderClass
{
  NSString *v2;
  Class v3;

  -[PXMockDisplayAsset _stringValueForKey:](self, "_stringValueForKey:", CFSTR("PXMockDisplayAssetDefaultImageProviderClassKey"));
  v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  v3 = NSClassFromString(v2);

  return v3;
}

- (NSDictionary)backingDictionary
{
  return self->_backingDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingDictionary, 0);
}

+ (id)propertiesForImageWithSize:(CGSize)a3
{
  double height;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  _QWORD v9[5];

  height = a3.height;
  v9[4] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("PXMockDisplayAssetMediaTypeKey");
  v8[1] = CFSTR("PXMockDisplayAssetPlaybackStyleKey");
  v9[0] = &unk_1E53EB628;
  v9[1] = &unk_1E53EB628;
  v8[2] = CFSTR("PXMockDisplayAssetPixelWidthKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", (unint64_t)a3.width);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v4;
  v8[3] = CFSTR("PXMockDisplayAssetPixelHeightKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", (unint64_t)height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)propertiesForLivePhotoWithSize:(CGSize)a3
{
  double height;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  _QWORD v9[6];

  height = a3.height;
  v9[5] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("PXMockDisplayAssetMediaTypeKey");
  v8[1] = CFSTR("PXMockDisplayAssetMediaSubtypesKey");
  v9[0] = &unk_1E53EB628;
  v9[1] = &unk_1E53EB640;
  v9[2] = &unk_1E53EB658;
  v8[2] = CFSTR("PXMockDisplayAssetPlaybackStyleKey");
  v8[3] = CFSTR("PXMockDisplayAssetPixelWidthKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", (unint64_t)a3.width);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v4;
  v8[4] = CFSTR("PXMockDisplayAssetPixelHeightKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", (unint64_t)height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[4] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)propertiesForVideoWithSize:(CGSize)a3
{
  double height;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  _QWORD v9[5];

  height = a3.height;
  v9[4] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("PXMockDisplayAssetMediaTypeKey");
  v8[1] = CFSTR("PXMockDisplayAssetPlaybackStyleKey");
  v9[0] = &unk_1E53EB670;
  v9[1] = &unk_1E53EB688;
  v8[2] = CFSTR("PXMockDisplayAssetPixelWidthKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", (unint64_t)a3.width);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v4;
  v8[3] = CFSTR("PXMockDisplayAssetPixelHeightKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", (unint64_t)height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
