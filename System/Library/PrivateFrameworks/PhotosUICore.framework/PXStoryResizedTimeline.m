@implementation PXStoryResizedTimeline

- (PXStoryResizedTimeline)initWithOriginalTimeline:(id)a3 targetSize:(CGSize)a4 options:(unint64_t)a5
{
  CGFloat height;
  CGFloat width;
  id v9;
  PXStoryResizedTimeline *v10;
  objc_super v12[3];
  objc_super v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;

  height = a4.height;
  width = a4.width;
  v15 = 0u;
  v16 = 0u;
  v14 = 0u;
  v9 = a3;
  objc_msgSend(v9, "originalSize");
  PXAffineTransformMakeFromRects();
  v13.receiver = self;
  v13.super_class = (Class)PXStoryResizedTimeline;
  memset(v12, 0, sizeof(v12));
  v10 = -[PXStoryTransformedTimeline initWithOriginalTimeline:transform:](&v13, sel_initWithOriginalTimeline_transform_, v9, v12);

  if (v10)
  {
    v10->_targetSize.width = width;
    v10->_targetSize.height = height;
    v10->_options = a5;
  }
  return v10;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  CGSize v12;
  CGSize v13;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryResizedTimeline originalSize](self, "originalSize");
  NSStringFromCGSize(v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryResizedTimeline targetSize](self, "targetSize");
  NSStringFromCGSize(v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PXStoryResizedTimeline options](self, "options");
  -[PXStoryDerivedTimeline originalTimeline](self, "originalTimeline");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %p; %@ => %@; options: %lx; Original Timeline:\n\t%@>"),
                  v5,
                  self,
                  v6,
                  v7,
                  v8,
                  v9);

  return v10;
}

- (CGSize)originalSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[PXStoryDerivedTimeline originalTimeline](self, "originalTimeline");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "originalSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGRect)transformedRectForOriginalClipInfo:(id *)a3 originalRect:(CGRect)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;
  objc_super v11;
  CGRect result;

  v11.receiver = self;
  v11.super_class = (Class)PXStoryResizedTimeline;
  -[PXStoryTransformedTimeline transformedRectForOriginalClipInfo:originalRect:](&v11, sel_transformedRectForOriginalClipInfo_originalRect_);
  if ((a3->var3 & 4) != 0)
  {
    if ((-[PXStoryResizedTimeline options](self, "options") & 1) != 0)
    {
      -[PXStoryResizedTimeline targetSize](self, "targetSize");
      PXRectWithOriginAndSize();
    }
    else
    {
      -[PXStoryResizedTimeline originalSize](self, "originalSize");
      PXSizeGetAspectRatio();
      PXRectWithAspectRatioFillingRect();
      v10.receiver = self;
      v10.super_class = (Class)PXStoryResizedTimeline;
      -[PXStoryTransformedTimeline transformedRectForOriginalClipInfo:originalRect:](&v10, sel_transformedRectForOriginalClipInfo_originalRect_, a3);
      PXSizeGetAspectRatio();
      PXRectWithAspectRatioFittingRect();
    }
  }
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
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

- (unint64_t)options
{
  return self->_options;
}

@end
