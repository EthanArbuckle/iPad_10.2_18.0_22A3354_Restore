@implementation QLCacheIndexFileRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_fileIdentifier, 0);
  objc_storeStrong((id *)&self->_interpolationQualities, 0);
  objc_storeStrong((id *)&self->_iconVariants, 0);
  objc_storeStrong((id *)&self->_externalGeneratorDataHashs, 0);
  objc_storeStrong((id *)&self->_badgeTypes, 0);
  objc_storeStrong((id *)&self->_minimumSizes, 0);
}

- (QLCacheIndexFileRequest)initWithFileIdentifier:(id)a3 version:(id)a4
{
  id v7;
  id v8;
  QLCacheIndexFileRequest *v9;
  QLCacheIndexFileRequest *v10;
  const CFArrayCallBacks *v11;
  uint64_t v12;
  NSMutableArray *minimumSizes;
  uint64_t v14;
  NSMutableArray *badgeTypes;
  uint64_t v16;
  NSMutableArray *externalGeneratorDataHashs;
  NSMutableArray *v18;
  NSMutableArray *iconVariants;
  NSMutableArray *v20;
  NSMutableArray *interpolationQualities;
  objc_super v23;

  v7 = a3;
  v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)QLCacheIndexFileRequest;
  v9 = -[QLCacheIndexFileRequest init](&v23, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_fileIdentifier, a3);
    v11 = (const CFArrayCallBacks *)MEMORY[0x1E0C9B378];
    v10->_sizes = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = objc_claimAutoreleasedReturnValue();
    minimumSizes = v10->_minimumSizes;
    v10->_minimumSizes = (NSMutableArray *)v12;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = objc_claimAutoreleasedReturnValue();
    badgeTypes = v10->_badgeTypes;
    v10->_badgeTypes = (NSMutableArray *)v14;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = objc_claimAutoreleasedReturnValue();
    externalGeneratorDataHashs = v10->_externalGeneratorDataHashs;
    v10->_externalGeneratorDataHashs = (NSMutableArray *)v16;

    v10->_iconModes = CFArrayCreateMutable(0, 0, v11);
    v10->_lowQualities = CFArrayCreateMutable(0, 0, v11);
    v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    iconVariants = v10->_iconVariants;
    v10->_iconVariants = v18;

    v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    interpolationQualities = v10->_interpolationQualities;
    v10->_interpolationQualities = v20;

    objc_storeStrong((id *)&v10->_version, a4);
  }

  return v10;
}

- (void)appendSize:(float)a3 minimumSize:(float)a4 withIconMode:(unsigned __int8)a5 lowQuality:(BOOL)a6 badgeType:(unint64_t)a7 iconVariant:(int64_t)a8 interpolationQuality:(int)a9 externalGeneratorDataHash:(unint64_t)a10
{
  int v14;
  int v15;
  CFNumberRef v18;
  __CFArray *sizes;
  CFIndex FirstIndexOfValue;
  double v21;
  CFIndex v22;
  CFIndex v23;
  __CFArray *v24;
  NSMutableArray *minimumSizes;
  void *v26;
  NSMutableArray *badgeTypes;
  void *v28;
  NSMutableArray *externalGeneratorDataHashs;
  void *v30;
  const void *v31;
  const void *v32;
  const void *v33;
  BOOL v34;
  const void *v35;
  NSMutableArray *iconVariants;
  void *v37;
  NSMutableArray *interpolationQualities;
  void *v39;
  float valuePtr;
  CFRange v41;
  CFRange v42;

  v14 = a6;
  v15 = a5;
  valuePtr = a3;
  v18 = CFNumberCreate(0, kCFNumberFloatType, &valuePtr);
  sizes = self->_sizes;
  v41.length = CFArrayGetCount(sizes);
  v41.location = 0;
  FirstIndexOfValue = CFArrayGetFirstIndexOfValue(sizes, v41, v18);
  if (FirstIndexOfValue == -1)
  {
LABEL_10:
    minimumSizes = self->_minimumSizes;
    *(float *)&v21 = a4;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v21);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](minimumSizes, "addObject:", v26);

    badgeTypes = self->_badgeTypes;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a7);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](badgeTypes, "addObject:", v28);

    externalGeneratorDataHashs = self->_externalGeneratorDataHashs;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a10);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](externalGeneratorDataHashs, "addObject:", v30);

    CFArrayAppendValue(self->_sizes, v18);
    v31 = (const void *)*MEMORY[0x1E0C9AE50];
    v32 = (const void *)*MEMORY[0x1E0C9AE40];
    if (v14)
      v33 = (const void *)*MEMORY[0x1E0C9AE50];
    else
      v33 = (const void *)*MEMORY[0x1E0C9AE40];
    CFArrayAppendValue(self->_lowQualities, v33);
    if (self->_atLeastOneLowQuality)
      v34 = 1;
    else
      v34 = v14;
    self->_atLeastOneLowQuality = v34;
    if (v15)
      v35 = v31;
    else
      v35 = v32;
    CFArrayAppendValue(self->_iconModes, v35);
    iconVariants = self->_iconVariants;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a8);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](iconVariants, "addObject:", v37);

    interpolationQualities = self->_interpolationQualities;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a9);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](interpolationQualities, "addObject:", v39);

  }
  else
  {
    v22 = FirstIndexOfValue;
    while (-[QLCacheIndexFileRequest iconModeAtIndex:](self, "iconModeAtIndex:", v22) != v15
         || -[QLCacheIndexFileRequest lowQualityAtIndex:](self, "lowQualityAtIndex:", v22) != v14
         || -[QLCacheIndexFileRequest badgeTypeAtIndex:](self, "badgeTypeAtIndex:", v22) != a7
         || -[QLCacheIndexFileRequest iconVariantAtIndex:](self, "iconVariantAtIndex:", v22) != a8
         || -[QLCacheIndexFileRequest interpolationQualityAtIndex:](self, "interpolationQualityAtIndex:", v22) != a9
         || -[QLCacheIndexFileRequest externalGeneratorDataHashAtIndex:](self, "externalGeneratorDataHashAtIndex:", v22) != a10)
    {
      v23 = v22 + 1;
      v24 = self->_sizes;
      v42.length = CFArrayGetCount(v24) - v23;
      v42.location = v23;
      v22 = CFArrayGetFirstIndexOfValue(v24, v42, v18);
      if (v22 == -1)
        goto LABEL_10;
    }
  }
  CFRelease(v18);
}

- (unint64_t)cacheId
{
  return self->_cacheId;
}

- (BOOL)hasAtLeastOneLowQuality
{
  return self->_atLeastOneLowQuality;
}

- (float)sizeAtIndex:(int64_t)a3
{
  const __CFNumber *ValueAtIndex;
  int Value;
  float result;
  float valuePtr;

  valuePtr = 0.0;
  ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(self->_sizes, a3);
  Value = CFNumberGetValue(ValueAtIndex, kCFNumberFloatType, &valuePtr);
  result = valuePtr;
  if (!Value)
    return 0.0;
  return result;
}

- (int64_t)sizeAndIconModeCount
{
  return CFArrayGetCount(self->_sizes);
}

- (float)minimumSizeAtIndex:(unint64_t)a3
{
  void *v3;
  float v4;
  float v5;

  -[NSMutableArray objectAtIndexedSubscript:](self->_minimumSizes, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

- (int)interpolationQualityAtIndex:(unint64_t)a3
{
  void *v3;
  int v4;

  -[NSMutableArray objectAtIndexedSubscript:](self->_interpolationQualities, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (int64_t)iconVariantAtIndex:(unint64_t)a3
{
  void *v3;
  int64_t v4;

  -[NSMutableArray objectAtIndexedSubscript:](self->_iconVariants, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (int)objc_msgSend(v3, "intValue");

  return v4;
}

- (unsigned)iconModeAtIndex:(int64_t)a3
{
  const __CFBoolean *ValueAtIndex;

  ValueAtIndex = (const __CFBoolean *)CFArrayGetValueAtIndex(self->_iconModes, a3);
  return CFBooleanGetValue(ValueAtIndex);
}

- (unint64_t)externalGeneratorDataHashAtIndex:(unint64_t)a3
{
  void *v3;
  unint64_t v4;

  -[NSMutableArray objectAtIndexedSubscript:](self->_externalGeneratorDataHashs, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (unint64_t)badgeTypeAtIndex:(unint64_t)a3
{
  void *v3;
  unint64_t v4;

  -[NSMutableArray objectAtIndexedSubscript:](self->_badgeTypes, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (BOOL)allSizes
{
  return CFArrayGetCount(self->_sizes) == 0;
}

- (QLCacheFileIdentifier)fileIdentifier
{
  return (QLCacheFileIdentifier *)objc_getProperty(self, a2, 80, 1);
}

- (QLThumbnailVersion)version
{
  return (QLThumbnailVersion *)objc_getProperty(self, a2, 88, 1);
}

- (void)_setCacheId:(unint64_t)a3
{
  self->_cacheId = a3;
}

- (void)dealloc
{
  __CFArray *sizes;
  __CFArray *iconModes;
  __CFArray *lowQualities;
  objc_super v6;

  sizes = self->_sizes;
  if (sizes)
    CFRelease(sizes);
  iconModes = self->_iconModes;
  if (iconModes)
    CFRelease(iconModes);
  lowQualities = self->_lowQualities;
  if (lowQualities)
    CFRelease(lowQualities);
  v6.receiver = self;
  v6.super_class = (Class)QLCacheIndexFileRequest;
  -[QLCacheIndexFileRequest dealloc](&v6, sel_dealloc);
}

- (QLCacheIndexFileRequest)initWithFileIdentifier:(id)a3
{
  return -[QLCacheIndexFileRequest initWithFileIdentifier:version:](self, "initWithFileIdentifier:version:", a3, 0);
}

- (QLCacheIndexFileRequest)initWithVersionedFileIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  QLCacheIndexFileRequest *v7;

  v4 = a3;
  objc_msgSend(v4, "fileIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "version");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[QLCacheIndexFileRequest initWithFileIdentifier:version:](self, "initWithFileIdentifier:version:", v5, v6);
  return v7;
}

- (unsigned)lowQualityAtIndex:(int64_t)a3
{
  const __CFBoolean *ValueAtIndex;

  ValueAtIndex = (const __CFBoolean *)CFArrayGetValueAtIndex(self->_lowQualities, a3);
  return CFBooleanGetValue(ValueAtIndex);
}

@end
