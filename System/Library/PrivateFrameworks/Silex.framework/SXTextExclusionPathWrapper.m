@implementation SXTextExclusionPathWrapper

- (SXTextExclusionPathWrapper)initWithTextExclusionPath:(id)a3
{
  id v4;
  SXTextExclusionPathWrapper *v5;
  SXTextExclusionPathWrapper *v6;
  id v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXTextExclusionPathWrapper;
  v5 = -[SXTextExclusionPathWrapper init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_exclusionPath, v4);
    -[SXTextExclusionPath path]((double *)v4);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v6->_isRectangular = CGPathIsRect((CGPathRef)objc_msgSend(v7, "CGPath"), 0);

  }
  return v6;
}

- (int)wrapDirection
{
  return 2;
}

- (int)wrapFitType
{
  return !-[SXTextExclusionPathWrapper isRectangular](self, "isRectangular");
}

- (id)wrapPolygon
{
  void *v3;
  double *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  CGFloat v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  uint64_t v16;
  TSDWrapPolygon *v17;
  TSDWrapPolygon *myWrapPolygon;
  CGAffineTransform v20;
  CGAffineTransform v21;

  -[SXTextExclusionPathWrapper myWrapPolygon](self, "myWrapPolygon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[SXTextExclusionPathWrapper exclusionPath](self, "exclusionPath");
    v4 = (double *)objc_claimAutoreleasedReturnValue();
    -[SXTextExclusionPath path](v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "TSDBezierPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    memset(&v21, 0, sizeof(v21));
    -[SXTextExclusionPathWrapper exclusionPath](self, "exclusionPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SXTextExclusionPath position]((uint64_t)v7);
    -[SXTextExclusionPathWrapper exclusionPath](self, "exclusionPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXTextExclusionPath position]((uint64_t)v9);
    CGAffineTransformMakeTranslation(&v21, v8, v10);

    v20 = v21;
    objc_msgSend(v6, "transformUsingAffineTransform:", &v20);
    -[SXTextExclusionPathWrapper exclusionPath](self, "exclusionPath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[SXAnimatedImageFrame duration]((uint64_t)v11);

    if (v12 > 0.0)
    {
      -[SXTextExclusionPathWrapper exclusionPath](self, "exclusionPath");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[SXAnimatedImageFrame duration]((uint64_t)v13);
      objc_msgSend(v6, "setLineWidth:", v14 + v14);

      objc_msgSend(MEMORY[0x24BEB3A68], "outlineBezierPath:withThreshold:", v6, 0.0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "uniteWithBezierPath:", v15);
      v16 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v16;
    }
    v17 = (TSDWrapPolygon *)objc_msgSend(objc_alloc(MEMORY[0x24BEB3AC8]), "initWithPath:", v6);
    myWrapPolygon = self->_myWrapPolygon;
    self->_myWrapPolygon = v17;

  }
  -[SXTextExclusionPathWrapper myWrapPolygon](self, "myWrapPolygon");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)wrapType
{
  return 1;
}

- (BOOL)isHTMLWrap
{
  return 0;
}

- (CGRect)boundsInfluencingExteriorWrap
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[SXTextExclusionPathWrapper wrapPolygon](self, "wrapPolygon");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)boundsInRoot
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[SXTextExclusionPathWrapper wrapPolygon](self, "wrapPolygon");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (id)parent
{
  return 0;
}

- (BOOL)hasAlpha
{
  return 0;
}

- (SXTextExclusionPath)exclusionPath
{
  return (SXTextExclusionPath *)objc_loadWeakRetained((id *)&self->_exclusionPath);
}

- (BOOL)isRectangular
{
  return self->_isRectangular;
}

- (TSDWrapPolygon)myWrapPolygon
{
  return self->_myWrapPolygon;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_myWrapPolygon, 0);
  objc_destroyWeak((id *)&self->_exclusionPath);
}

@end
