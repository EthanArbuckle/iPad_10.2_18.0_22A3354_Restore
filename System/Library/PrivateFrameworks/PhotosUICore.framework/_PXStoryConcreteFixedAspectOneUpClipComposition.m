@implementation _PXStoryConcreteFixedAspectOneUpClipComposition

- (_PXStoryConcreteFixedAspectOneUpClipComposition)initWithAspectRatioNumerator:(int64_t)a3 denominator:(int64_t)a4
{
  _PXStoryConcreteFixedAspectOneUpClipComposition *v6;
  _PXStoryConcreteFixedAspectOneUpClipComposition *v7;
  uint64_t v8;
  NSString *label;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_PXStoryConcreteFixedAspectOneUpClipComposition;
  v6 = -[_PXStoryConcreteFixedAspectOneUpClipComposition init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_aspectRatio = (double)a3 / (double)a4;
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("1-Up %li:%li"), a3, a4);
    label = v7->_label;
    v7->_label = (NSString *)v8;

    *(_OWORD *)&v7->_clipAssetIndex = xmmword_1A7BA6CB0;
  }
  return v7;
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
  -[_PXStoryConcreteFixedAspectOneUpClipComposition label](self, "label");
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
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;

  PXRectWithOriginAndSize();
  PXRectWithAspectRatioFittingRect();
  a3->origin.x = v5;
  a3->origin.y = v6;
  a3->size.width = v7;
  a3->size.height = v8;
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

- (int64_t)mainDividerAxis
{
  return self->_mainDividerAxis;
}

- (NSString)label
{
  return self->_label;
}

- (double)aspectRatio
{
  return self->_aspectRatio;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

@end
