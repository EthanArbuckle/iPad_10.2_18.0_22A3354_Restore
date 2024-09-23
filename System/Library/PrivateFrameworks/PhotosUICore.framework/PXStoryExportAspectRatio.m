@implementation PXStoryExportAspectRatio

- (PXStoryExportAspectRatio)initWithAspectType:(int64_t)a3
{
  void *v6;

  if ((unint64_t)a3 >= 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryExportAspectRatio.m"), 110, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  return -[PXStoryExportAspectRatio initWithAspectType:ratio:](self, "initWithAspectType:ratio:", dbl_1A7C0A098[a3]);
}

- (PXStoryExportAspectRatio)initWithAspectType:(int64_t)a3 ratio:(double)a4
{
  PXStoryExportAspectRatio *v6;
  PXStoryExportAspectRatio *v7;
  uint64_t v8;
  PXStoryExportOrientation *v9;
  PXStoryExportOrientation *orientation;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PXStoryExportAspectRatio;
  v6 = -[PXStoryExportAspectRatio init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_type = a3;
    v6->_ratio = a4;
    if (PXFloatApproximatelyEqualToFloat())
      v8 = 2;
    else
      v8 = a4 <= 1.0;
    v9 = -[PXStoryExportOrientation initWithOrientationType:]([PXStoryExportOrientation alloc], "initWithOrientationType:", v8);
    orientation = v7->_orientation;
    v7->_orientation = v9;

  }
  return v7;
}

- (CGSize)sizeWithMinDimension:(double)a3 orientation:(id)a4
{
  id v5;
  double v6;
  double v7;
  CGSize result;

  v5 = a4;
  -[PXStoryExportAspectRatio ratio](self, "ratio");
  objc_msgSend(v5, "type");

  PXSizeRound();
  result.height = v7;
  result.width = v6;
  return result;
}

- (CGSize)sizeWithMinDimension:(double)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  -[PXStoryExportAspectRatio orientation](self, "orientation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryExportAspectRatio sizeWithMinDimension:orientation:](self, "sizeWithMinDimension:orientation:", v5, a3);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (id)adjustedForOrientation:(id)a3
{
  id v5;
  void *v6;
  int v7;
  PXStoryExportAspectRatio *v8;
  unint64_t v9;
  double v10;
  double v11;
  PXStoryExportAspectRatio *v12;
  void *v14;

  v5 = a3;
  -[PXStoryExportAspectRatio orientation](self, "orientation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", v5);

  if (v7)
  {
    v8 = self;
  }
  else
  {
    v9 = -[PXStoryExportAspectRatio type](self, "type");
    if (v9 >= 4)
    {
      if (v9 != 4)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryExportAspectRatio.m"), 183, CFSTR("Code which should be unreachable has been reached"));

        abort();
      }
      v8 = -[PXStoryExportAspectRatio initWithAspectType:]([PXStoryExportAspectRatio alloc], "initWithAspectType:", objc_msgSend(v5, "type") != 0);
    }
    else
    {
      -[PXStoryExportAspectRatio sizeWithMinDimension:orientation:](self, "sizeWithMinDimension:orientation:", v5, 1080.0);
      objc_msgSend((id)objc_opt_class(), "standardAspectRatioForSize:", v10, v11);
      v8 = (PXStoryExportAspectRatio *)objc_claimAutoreleasedReturnValue();
    }
  }
  v12 = v8;

  return v12;
}

- (NSString)localizedTitle
{
  unint64_t v4;
  void *v6;

  v4 = -[PXStoryExportAspectRatio type](self, "type");
  if (v4 >= 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryExportAspectRatio.m"), 209, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  return (NSString *)PXLocalizedStringFromTable(off_1E5131190[v4], CFSTR("PhotosUICore"));
}

- (BOOL)isEqual:(id)a3
{
  PXStoryExportAspectRatio *v4;
  PXStoryExportAspectRatio *v5;
  int64_t v6;
  uint64_t v7;
  BOOL v8;

  v4 = (PXStoryExportAspectRatio *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[PXStoryExportAspectRatio type](self, "type");
      v7 = -[PXStoryExportAspectRatio type](v5, "type");

      v8 = v6 == v7;
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (int64_t)type
{
  return self->_type;
}

- (double)ratio
{
  return self->_ratio;
}

- (PXStoryExportOrientation)orientation
{
  return self->_orientation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orientation, 0);
}

+ (id)standardAspectRatioForSize:(CGSize)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(a1, "standardAspects", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v7, "ratio");
        if ((PXFloatApproximatelyEqualToFloat() & 1) != 0)
        {
          v4 = v7;
          goto LABEL_11;
        }
      }
      v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

+ (id)pickableAspectRatiosForOrientation:(id)a3 fullSizePlayerAspect:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  int v12;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "standardAspects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6;
  PXFilter();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "orientation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqual:", v9);

    if (v12)
      objc_msgSend(v10, "addObject:", v7);
  }

  return v10;
}

+ (NSArray)standardAspects
{
  return (NSArray *)PXMap();
}

PXStoryExportAspectRatio *__43__PXStoryExportAspectRatio_standardAspects__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  PXStoryExportAspectRatio *v3;
  uint64_t v4;

  v2 = a2;
  v3 = [PXStoryExportAspectRatio alloc];
  v4 = objc_msgSend(v2, "integerValue");

  return -[PXStoryExportAspectRatio initWithAspectType:](v3, "initWithAspectType:", v4);
}

uint64_t __84__PXStoryExportAspectRatio_pickableAspectRatiosForOrientation_fullSizePlayerAspect___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "orientation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)_userDefaultIdentifier
{
  unint64_t v2;

  v2 = -[PXStoryExportAspectRatio type](self, "type");
  if (v2 > 5)
    return 0;
  else
    return off_1E51311B8[v2];
}

+ (void)setDefaultAspectRatio:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0C99EA0];
  v4 = a3;
  objc_msgSend(v3, "standardUserDefaults");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_userDefaultIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forKey:", v5, CFSTR("StoryExportAspectRatio"));
}

+ (id)defaultAspectRatioWithFullSizePlayerAspect:(id)a3 orientation:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  PXStoryExportAspectRatio *v11;
  PXStoryExportAspectRatio *v13;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringForKey:", CFSTR("StoryExportAspectRatio"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    goto LABEL_5;
  objc_msgSend((id)objc_opt_class(), "standardAspects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v8;
  PXFind();
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = v13;
LABEL_6:

    goto LABEL_7;
  }
  v10 = v5;

  if (!v10)
  {
LABEL_5:
    v11 = -[PXStoryExportAspectRatio initWithAspectType:]([PXStoryExportAspectRatio alloc], "initWithAspectType:", 0);
    -[PXStoryExportAspectRatio adjustedForOrientation:](v11, "adjustedForOrientation:", v6);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
LABEL_7:

  return v10;
}

uint64_t __96__PXStoryExportAspectRatio_UserDefault__defaultAspectRatioWithFullSizePlayerAspect_orientation___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "_userDefaultIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

@end
