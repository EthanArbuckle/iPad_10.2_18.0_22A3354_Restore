@implementation PXFeedSublayoutComposition

- (void)setSpec:(id)a3
{
  PXFeedViewLayoutSpec *v5;
  char v6;
  PXLayoutGenerator *cachedLayoutGenerator;
  PXFeedViewLayoutSpec *v8;

  v8 = (PXFeedViewLayoutSpec *)a3;
  v5 = self->_spec;
  if (v5 == v8)
  {

  }
  else
  {
    v6 = -[PXFeedViewLayoutSpec isEqual:](v8, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_spec, a3);
      cachedLayoutGenerator = self->_cachedLayoutGenerator;
      self->_cachedLayoutGenerator = 0;

      -[PXGGeneratedSublayoutComposition invalidateLayout](self, "invalidateLayout");
    }
  }

}

- (int64_t)scrollableAxis
{
  void *v2;
  void *v3;
  int64_t v4;

  -[PXFeedSublayoutComposition spec](self, "spec");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scrollBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "axis");

  return v4;
}

- (id)configuredLayoutGenerator
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  PXLayoutGenerator *cachedLayoutGenerator;
  void *v15;
  PXLayoutGenerator *v16;
  PXLayoutGenerator *v17;
  PXLayoutGenerator *v18;
  void *v20;

  -[PXGSublayoutComposition referenceSize](self, "referenceSize");
  v5 = v4;
  v7 = v6;
  -[PXLayoutGenerator metrics](self->_cachedLayoutGenerator, "metrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "referenceSize");
  v10 = v9;
  v12 = v11;

  if (v5 != v10 || v7 != v12)
  {
    cachedLayoutGenerator = self->_cachedLayoutGenerator;
    self->_cachedLayoutGenerator = 0;

  }
  if (!self->_cachedLayoutGenerator)
  {
    -[PXFeedSublayoutComposition spec](self, "spec");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "layoutGeneratorWithReferenceSize:", v5, v7);
    v16 = (PXLayoutGenerator *)objc_claimAutoreleasedReturnValue();
    v17 = self->_cachedLayoutGenerator;
    self->_cachedLayoutGenerator = v16;

  }
  -[PXLayoutGenerator setItemCount:](self->_cachedLayoutGenerator, "setItemCount:", -[PXGSublayoutComposition numberOfSublayouts](self, "numberOfSublayouts"));
  v18 = self->_cachedLayoutGenerator;
  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFeedSublayoutComposition.m"), 47, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_cachedLayoutGenerator != nil"));

    v18 = self->_cachedLayoutGenerator;
  }
  return v18;
}

- (void)visibleRectDidChange
{
  void *v3;
  int v4;
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  _BOOL8 v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PXFeedSublayoutComposition;
  -[PXGSublayoutComposition visibleRectDidChange](&v16, sel_visibleRectDidChange);
  -[PXFeedSublayoutComposition spec](self, "spec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "wantsFirstItemFullscreen");

  if (v4)
  {
    -[PXFeedSublayoutComposition configuredLayoutGenerator](self, "configuredLayoutGenerator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;

    -[PXGSublayoutComposition visibleRect](self, "visibleRect");
    v8 = v7;
    v10 = v9;
    -[PXFeedSublayoutComposition spec](self, "spec");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "scrollBehavior");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "intrinsicContentOffset");
    v14 = v10 / v13;
    v15 = v10 / v13 <= 1.0;

    objc_msgSend(v6, "setVisibleOrigin:updateFirstItemPosition:", v15, v8, v10);
    if (v14 <= 1.0)
      -[PXGSublayoutComposition invalidateEstimatedSublayoutGeometries](self, "invalidateEstimatedSublayoutGeometries");

  }
}

- (PXFeedViewLayoutSpec)spec
{
  return self->_spec;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_cachedLayoutGenerator, 0);
}

@end
