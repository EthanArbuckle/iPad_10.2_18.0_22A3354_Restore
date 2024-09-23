@implementation PXStoryExportFullSizePlayerAspectRatio

- (PXStoryExportFullSizePlayerAspectRatio)initWithSize:(CGSize)a3 scale:(double)a4
{
  CGFloat height;
  CGFloat width;
  PXStoryExportFullSizePlayerAspectRatio *result;
  objc_super v9;

  height = a3.height;
  width = a3.width;
  PXSizeGetAspectRatio();
  v9.receiver = self;
  v9.super_class = (Class)PXStoryExportFullSizePlayerAspectRatio;
  result = -[PXStoryExportAspectRatio initWithAspectType:ratio:](&v9, sel_initWithAspectType_ratio_, 5);
  if (result)
  {
    result->_size.width = width;
    result->_size.height = height;
    result->_scale = a4;
  }
  return result;
}

- (id)adjustedForOrientation:(id)a3
{
  id v4;
  void *v5;
  int v6;
  PXStoryExportFullSizePlayerAspectRatio *v7;
  void *v8;

  v4 = a3;
  -[PXStoryExportAspectRatio orientation](self, "orientation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v4);

  if (v6)
  {
    v7 = self;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "pickableAspectRatiosForOrientation:fullSizePlayerAspect:", v4, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v7 = (PXStoryExportFullSizePlayerAspectRatio *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)localizedTitle
{
  return PXLocalizedStringFromTable(CFSTR("PHOTOS_MEMORIES_EXPORT_ASPECT_RATIO_OPTION_MATCH_FULL_SIZE_PLAYER"), CFSTR("PhotosUICore"));
}

- (BOOL)isEqual:(id)a3
{
  PXStoryExportFullSizePlayerAspectRatio *v4;
  PXStoryExportFullSizePlayerAspectRatio *v5;
  char v6;

  v4 = (PXStoryExportFullSizePlayerAspectRatio *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[PXStoryExportFullSizePlayerAspectRatio size](self, "size");
      -[PXStoryExportFullSizePlayerAspectRatio size](v5, "size");
      if (PXSizeApproximatelyEqualToSize())
      {
        -[PXStoryExportFullSizePlayerAspectRatio scale](self, "scale");
        -[PXStoryExportFullSizePlayerAspectRatio scale](v5, "scale");
        v6 = PXFloatApproximatelyEqualToFloat();
      }
      else
      {
        v6 = 0;
      }

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  double v4;
  double v5;
  uint64_t v6;
  double v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXStoryExportFullSizePlayerAspectRatio;
  v3 = -[PXStoryExportAspectRatio hash](&v9, sel_hash);
  -[PXStoryExportFullSizePlayerAspectRatio size](self, "size");
  v6 = v3 ^ (2 * (uint64_t)v4) ^ (4 * (uint64_t)v5);
  -[PXStoryExportFullSizePlayerAspectRatio scale](self, "scale");
  return v6 ^ (8 * (uint64_t)v7);
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)scale
{
  return self->_scale;
}

@end
