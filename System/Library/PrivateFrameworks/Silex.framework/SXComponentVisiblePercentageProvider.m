@implementation SXComponentVisiblePercentageProvider

- (SXComponentVisiblePercentageProvider)initWithViewport:(id)a3
{
  id v5;
  SXComponentVisiblePercentageProvider *v6;
  SXComponentVisiblePercentageProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXComponentVisiblePercentageProvider;
  v6 = -[SXComponentVisiblePercentageProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_viewport, a3);

  return v7;
}

- (double)visiblePercentageOfObject:(id)a3
{
  id v4;
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  void *v14;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v19;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  v4 = a3;
  objc_opt_class();
  v5 = 0.0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "absoluteFrame");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    -[SXComponentVisiblePercentageProvider viewport](self, "viewport");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dynamicBounds");
    v25.origin.x = v7;
    v25.origin.y = v9;
    v25.size.width = v11;
    v25.size.height = v13;
    v22 = CGRectIntersection(v21, v25);
    x = v22.origin.x;
    y = v22.origin.y;
    width = v22.size.width;
    height = v22.size.height;

    v23.origin.x = x;
    v23.origin.y = y;
    v23.size.width = width;
    v23.size.height = height;
    v19 = CGRectGetHeight(v23);
    v24.origin.x = v7;
    v24.origin.y = v9;
    v24.size.width = v11;
    v24.size.height = v13;
    v5 = v19 / fmax(CGRectGetHeight(v24), 1.0);
  }

  return v5;
}

- (SXViewport)viewport
{
  return self->_viewport;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewport, 0);
}

@end
