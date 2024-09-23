@implementation _PXStoryConcreteClipComposition

- (_PXStoryConcreteClipComposition)init
{
  return -[_PXStoryConcreteClipComposition initWithNumberOfClips:primaryEdge:splitRatio:secondaryEdge:splitRatio:label:](self, "initWithNumberOfClips:primaryEdge:splitRatio:secondaryEdge:splitRatio:label:", 0, 0, 0, CFSTR("Undefined"), 0.0, 0.0);
}

- (_PXStoryConcreteClipComposition)initWithOneUp
{
  return -[_PXStoryConcreteClipComposition initWithNumberOfClips:primaryEdge:splitRatio:secondaryEdge:splitRatio:label:](self, "initWithNumberOfClips:primaryEdge:splitRatio:secondaryEdge:splitRatio:label:", 1, 0, 0, CFSTR("1-Up"), 0.0, 0.0);
}

- (_PXStoryConcreteClipComposition)initWithTwoUpEdge:(unsigned int)a3 splitRatio:(double)a4 label:(id)a5
{
  return -[_PXStoryConcreteClipComposition initWithNumberOfClips:primaryEdge:splitRatio:secondaryEdge:splitRatio:label:](self, "initWithNumberOfClips:primaryEdge:splitRatio:secondaryEdge:splitRatio:label:", 2, *(_QWORD *)&a3, 0, a5, a4, 0.0);
}

- (_PXStoryConcreteClipComposition)initWithSingleAssetSplitAxis:(int64_t)a3 splitRatio:(double)a4 label:(id)a5
{
  id v7;
  _PXStoryConcreteClipComposition *v8;
  uint64_t v9;

  v7 = a5;
  PXAxisTransposed();
  v8 = -[_PXStoryConcreteClipComposition initWithTwoUpEdge:splitRatio:label:](self, "initWithTwoUpEdge:splitRatio:label:", PXMinRectEdgeForAxis(), v7, a4);

  if (v8)
  {
    v8->_numberOfAssets = 1;
    v9 = -[_PXStoryConcreteClipComposition numberOfClips](v8, "numberOfClips");
    if (v9 >= 1)
      bzero(v8->_clipAssetIndexes, 8 * v9);
  }
  return v8;
}

- (_PXStoryConcreteClipComposition)initWithNumberOfClips:(int64_t)a3 primaryEdge:(unsigned int)a4 splitRatio:(double)a5 secondaryEdge:(unsigned int)a6 splitRatio:(double)a7 label:(id)a8
{
  id v15;
  _PXStoryConcreteClipComposition *v16;
  _PXStoryConcreteClipComposition *v17;
  int64_t v18;
  uint64_t v19;
  NSString *label;
  void *v22;
  objc_super v23;

  v15 = a8;
  if (a3 >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryClipComposition.m"), 231, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("numberOfClips <= 3"));

  }
  v23.receiver = self;
  v23.super_class = (Class)_PXStoryConcreteClipComposition;
  v16 = -[_PXStoryConcreteClipComposition init](&v23, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_numberOfClips = a3;
    v16->_numberOfAssets = a3;
    v16->_edges[0] = a4;
    v16->_edges[1] = a6;
    v16->_splitRatios[0] = a5;
    v16->_splitRatios[1] = a7;
    PXRectEdgeAxis();
    v17->_dividerAxes[0] = PXAxisTransposed();
    PXRectEdgeAxis();
    v17->_dividerAxes[1] = PXAxisTransposed();
    if (a3 >= 1)
    {
      v18 = 0;
      do
      {
        v17->_clipAssetIndexes[v18] = v18;
        ++v18;
      }
      while (a3 != v18);
    }
    v17->_mainDividerAxis = v17->_dividerAxes[0];
    v19 = objc_msgSend(v15, "copy");
    label = v17->_label;
    v17->_label = (NSString *)v19;

  }
  return v17;
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
  -[_PXStoryConcreteClipComposition label](self, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p; %@>"), v5, self, v6);

  return v7;
}

- (const)dividerAxes
{
  return self->_dividerAxes;
}

- (void)getClipFrames:(CGRect *)a3 forContext:(id *)a4
{
  int64_t numberOfClips;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  int64_t v11;
  int64_t v12;
  double var1;
  unsigned int *edges;
  double *splitRatios;
  unsigned int *v16;
  int64_t v17;
  CGRectEdge v18;
  double v19;
  double v20;
  double v21;
  unsigned int *v22;
  int64_t v23;
  uint64_t v24;
  double v25;
  CGSize size;
  CGRect *v27;
  CGRect remainder;
  CGRect v30;

  numberOfClips = self->_numberOfClips;
  PXRectWithOriginAndSize();
  v30.origin.x = v7;
  v30.origin.y = v8;
  v30.size.width = v9;
  v30.size.height = v10;
  if (numberOfClips < 2)
  {
    v12 = 0;
  }
  else
  {
    v11 = 0;
    v12 = numberOfClips - 1;
    var1 = a4->var1;
    memset(&remainder, 0, sizeof(remainder));
    edges = self->_edges;
    splitRatios = self->_splitRatios;
    v16 = self->_edges;
    v17 = v12;
    do
    {
      v18 = edges[v11];
      v19 = splitRatios[v11];
      PXRectEdgeAxis();
      PXRectGetLengthForAxis();
      v21 = v20;
      v22 = v16;
      v23 = v17;
      if (v11 < v12)
      {
        do
        {
          ++v22;
          v24 = PXRectEdgeAxis();
          if (v24 == PXRectEdgeAxis())
            v25 = var1;
          else
            v25 = 0.0;
          v21 = v21 - v25;
          --v23;
        }
        while (v23);
      }
      CGRectDivide(v30, &a3[v11], &remainder, v19 * v21, v18);
      CGRectDivide(remainder, &remainder, &v30, var1, v18);
      ++v11;
      --v17;
      ++v16;
    }
    while (v11 != v12);
  }
  size = v30.size;
  v27 = &a3[v12];
  v27->origin = v30.origin;
  v27->size = size;
}

- (BOOL)clipFramesExtendToBounds
{
  return 1;
}

- (const)clipAssetIndexes
{
  return self->_clipAssetIndexes;
}

- (double)mainDividerSplitRatio
{
  return self->_splitRatios[0];
}

- (int64_t)numberOfClips
{
  return self->_numberOfClips;
}

- (int64_t)mainDividerAxis
{
  return self->_mainDividerAxis;
}

- (NSString)label
{
  return self->_label;
}

- (int64_t)numberOfAssets
{
  return self->_numberOfAssets;
}

- (double)primarySplitRatio
{
  return self->_primarySplitRatio;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

@end
