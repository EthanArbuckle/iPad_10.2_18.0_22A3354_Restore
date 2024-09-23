@implementation SXTextTangierAttachmentLayout

- (id)wrapPolygon
{
  void *v3;
  void *v4;
  double *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  CGFloat v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  uint64_t v21;
  void *v22;
  CGAffineTransform v24;
  CGAffineTransform v25;

  -[SXTextTangierAttachmentLayout polygon](self, "polygon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[TSDLayout info](self, "info");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "exclusionPath");
    v5 = (double *)objc_claimAutoreleasedReturnValue();
    -[SXTextExclusionPath path](v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "TSDBezierPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    memset(&v25, 0, sizeof(v25));
    -[TSDLayout info](self, "info");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "exclusionPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[SXTextExclusionPath position]((uint64_t)v9);
    -[TSDLayout info](self, "info");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "exclusionPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXTextExclusionPath position]((uint64_t)v12);
    CGAffineTransformMakeTranslation(&v25, v10, v13);

    v24 = v25;
    objc_msgSend(v7, "transformUsingAffineTransform:", &v24);
    -[TSDLayout info](self, "info");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "exclusionPath");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[SXAnimatedImageFrame duration]((uint64_t)v15);

    if (v16 > 0.0)
    {
      -[TSDLayout info](self, "info");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "exclusionPath");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[SXAnimatedImageFrame duration]((uint64_t)v18);
      objc_msgSend(v7, "setLineWidth:", v19 + v19);

      objc_msgSend(MEMORY[0x24BEB3A68], "outlineBezierPath:withThreshold:", v7, 0.0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "uniteWithBezierPath:", v20);
      v21 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v21;
    }
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB3AC8]), "initWithPath:", v7);
    -[SXTextTangierAttachmentLayout setPolygon:](self, "setPolygon:", v22);

  }
  -[SXTextTangierAttachmentLayout polygon](self, "polygon");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)fixTransformFromInterimPosition
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SXTextTangierAttachmentLayout;
  -[TSDAbstractLayout fixTransformFromInterimPosition](&v7, sel_fixTransformFromInterimPosition);
  -[SXTextTangierAttachmentLayout storeActualPosition](self, "storeActualPosition");
  -[TSDLayout info](self, "info");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exclusionPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSDAbstractLayout frame](self, "frame");
  -[SXTextExclusionPath adjustYPositionWithCurrentPosition:]((uint64_t)v4, v5, v6);

  -[SXTextTangierAttachmentLayout setPolygon:](self, "setPolygon:", 0);
}

- (void)validate
{
  _BOOL4 v3;
  objc_super v4;

  v3 = -[TSDLayout invalidGeometry](self, "invalidGeometry");
  v4.receiver = self;
  v4.super_class = (Class)SXTextTangierAttachmentLayout;
  -[TSDLayout validate](&v4, sel_validate);
  if (v3)
    -[SXTextTangierAttachmentLayout storeActualPosition](self, "storeActualPosition");
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

  -[SXTextTangierAttachmentLayout wrapPolygon](self, "wrapPolygon");
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

  -[SXTextTangierAttachmentLayout wrapPolygon](self, "wrapPolygon");
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

- (void)storeActualPosition
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;

  -[TSDLayout info](self, "info");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exclusionPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SXTextExclusionPath type]((uint64_t)v4) != 2)
  {

    goto LABEL_5;
  }
  -[TSDAbstractLayout geometry](self, "geometry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v7 = v6;
  -[TSDLayout info](self, "info");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "exclusionPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXTextExclusionPath position]((uint64_t)v9);
  v11 = v10;

  if (v7 >= v11)
  {
LABEL_5:
    -[TSDAbstractLayout geometry](self, "geometry");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "frame");
    v19 = v18;
    v21 = v20;
    -[TSDLayout info](self, "info");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "exclusionPath");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXTextExclusionPath setActualPosition:]((uint64_t)v16, v19, v21);
    goto LABEL_6;
  }
  -[TSDLayout info](self, "info");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "exclusionPath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[SXTextExclusionPath position]((uint64_t)v12);
  v15 = v14;
  -[TSDLayout info](self, "info");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "exclusionPath");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXTextExclusionPath setActualPosition:]((uint64_t)v17, v13, v15);

LABEL_6:
}

- (TSDWrapPolygon)polygon
{
  return self->_polygon;
}

- (void)setPolygon:(id)a3
{
  objc_storeStrong((id *)&self->_polygon, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_polygon, 0);
}

@end
