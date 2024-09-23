@implementation _PXStoryConcreteAspectFitOneUpClipComposition

- (_PXStoryConcreteAspectFitOneUpClipComposition)init
{
  _PXStoryConcreteAspectFitOneUpClipComposition *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_PXStoryConcreteAspectFitOneUpClipComposition;
  result = -[_PXStoryConcreteAspectFitOneUpClipComposition init](&v3, sel_init);
  if (result)
    *(_OWORD *)&result->_clipAssetIndex = xmmword_1A7BA6CB0;
  return result;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PXStoryConcreteAspectFitOneUpClipComposition label](self, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p; %@>"), v5, self, v6);

  return v7;
}

- (int64_t)numberOfClips
{
  return 1;
}

- (void)getClipFrames:(CGRect *)a3 forContext:(id *)a4
{
  double var2;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  NSObject *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint8_t v19[16];

  var2 = a4->var2;
  PXRectWithOriginAndSize();
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  if (var2 < 0.0 || var2 > 0.0)
  {
    PXRectWithAspectRatioFittingRect();
    v7 = v15;
    v9 = v16;
    v11 = v17;
    v13 = v18;
  }
  else
  {
    PXAssertGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v19 = 0;
      _os_log_error_impl(&dword_1A6789000, v14, OS_LOG_TYPE_ERROR, "missing aspect ratio for aspect fit 1-up composition", v19, 2u);
    }

  }
  a3->origin.x = v7;
  a3->origin.y = v9;
  a3->size.width = v11;
  a3->size.height = v13;
}

- (BOOL)clipFramesExtendToBounds
{
  return 0;
}

- (const)dividerAxes
{
  return &self->_mainDividerAxis;
}

- (double)mainDividerSplitRatio
{
  return 0.0;
}

- (int64_t)numberOfAssets
{
  return 1;
}

- (const)clipAssetIndexes
{
  return &self->_clipAssetIndex;
}

- (NSString)label
{
  return (NSString *)CFSTR("1-Up Aspect Fit");
}

- (int64_t)mainDividerAxis
{
  return self->_mainDividerAxis;
}

@end
