@implementation CRLMediaRep

- (CRLMediaLayout)mediaLayout
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;

  *(_QWORD *)&v3 = objc_opt_class(CRLMediaLayout, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout", v3));
  v7 = sub_100221D0C(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return (CRLMediaLayout *)v8;
}

- (BOOL)shouldAllowReplacementFromDrop
{
  return 1;
}

- (BOOL)shouldAllowReplacementFromPaste
{
  return 0;
}

- (int64_t)supportedMediaTypes
{
  return 3;
}

- (int64_t)preferredReplacingInterfaceKind
{
  return 0;
}

- (BOOL)replacingInterfaceAllowsMultipleSelection
{
  return 0;
}

- (BOOL)shouldShowMediaReplaceUI
{
  return 0;
}

- (CRLCanvasRenderable)spatialGlyphRenderable
{
  CRLCanvasRenderable *mGlyphRenderable;
  CRLCanvasRenderable *v4;
  CRLCanvasRenderable *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;

  mGlyphRenderable = self->mGlyphRenderable;
  if (!mGlyphRenderable)
  {
    v4 = (CRLCanvasRenderable *)objc_claimAutoreleasedReturnValue(+[CRLCanvasRenderable renderable](CRLCanvasRenderable, "renderable"));
    v5 = self->mGlyphRenderable;
    self->mGlyphRenderable = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage crl_imageNamed:withPointSize:](UIImage, "crl_imageNamed:withPointSize:", CFSTR("spatial.cube"), 25.0));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImage imageWithUIImage:](CRLImage, "imageWithUIImage:", v6));

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CRLMediaRep CRLSpatialLabelColor](CRLMediaRep, "CRLSpatialLabelColor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "compositedImageWithColor:alpha:blendMode:", v8, 20, 1.0));

    -[CRLCanvasRenderable setContents:](self->mGlyphRenderable, "setContents:", objc_msgSend(v9, "CGImage"));
    LODWORD(v10) = 0;
    -[CRLCanvasRenderable setOpacity:](self->mGlyphRenderable, "setOpacity:", v10);
    -[CRLCanvasRenderable setAnchorPoint:](self->mGlyphRenderable, "setAnchorPoint:", CGPointZero.x, CGPointZero.y);

    mGlyphRenderable = self->mGlyphRenderable;
  }
  return mGlyphRenderable;
}

- (BOOL)shouldDisplayAsSpatial
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMediaRep mediaLayout](self, "mediaLayout"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "mediaItem"));
  v4 = objc_msgSend(v3, "isSpatial");

  return v4;
}

- (void)updateSpatialLabel
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  float v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  int v14;
  uint64_t v15;
  double MaxX;
  double MinY;
  double v21;
  void *v22;
  double v23;
  double MinX;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  void *v39;
  CGAffineTransform v40;
  CGAffineTransform v41;
  _OWORD v42[3];
  CGRect v43;
  CGRect v44;

  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  if (self->mIsZooming || !-[CRLMediaRep shouldDisplayAsSpatial](self, "shouldDisplayAsSpatial"))
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMediaRep spatialGlyphRenderable](self, "spatialGlyphRenderable"));
    LODWORD(v23) = 0;
    objc_msgSend(v22, "setOpacity:", v23);
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
    objc_msgSend(v3, "viewScale");
    v5 = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
    -[CRLCanvasRep naturalBounds](self, "naturalBounds");
    objc_msgSend(v6, "convertUnscaledToBoundsRect:");
    v8 = v7;

    if (v8 >= 85.0)
      v9 = 1.0;
    else
      v9 = 0.0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMediaRep spatialGlyphRenderable](self, "spatialGlyphRenderable"));
    *(float *)&v11 = v9;
    objc_msgSend(v10, "setOpacity:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMediaRep spatialGlyphRenderable](self, "spatialGlyphRenderable"));
    objc_msgSend(v12, "setBounds:", 0.0, 0.0, 25.0, 25.0);

    if (v8 >= 140.0)
      v13 = 16.0;
    else
      v13 = 8.0;
    v14 = sub_1003A91F4();
    -[CRLCanvasRep naturalBounds](self, "naturalBounds");
    if (v14)
    {
      MaxX = CGRectGetMaxX(*(CGRect *)&v15);
      -[CRLCanvasRep naturalBounds](self, "naturalBounds");
      MinY = CGRectGetMinY(v43);
      v21 = MaxX - v13;
    }
    else
    {
      MinX = CGRectGetMinX(*(CGRect *)&v15);
      -[CRLCanvasRep naturalBounds](self, "naturalBounds");
      MinY = CGRectGetMinY(v44);
      v21 = v13 + MinX;
    }
    -[CRLCanvasRep convertNaturalPointToUnscaledCanvas:](self, "convertNaturalPointToUnscaledCanvas:", v21, v13 + MinY);
    v27 = sub_1000603DC(v25, v26, v5);
    v29 = v28;
    if (sub_1003A91F4())
      v27 = v27 + -25.0;
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep parentRep](self, "parentRep"));

    if (v30)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep parentRep](self, "parentRep"));
      objc_msgSend(v31, "layerFrameInScaledCanvas");
      v27 = sub_1000603B8(v27, v29, v32);
      v29 = v33;

    }
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMediaRep spatialGlyphRenderable](self, "spatialGlyphRenderable"));
    objc_msgSend(v34, "setPosition:", v27, v29);

    v35 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "geometryInRoot"));
    v37 = v36;
    if (v36)
      objc_msgSend(v36, "transform");
    else
      memset(v42, 0, sizeof(v42));
    v38 = sub_1000791EC((double *)v42);

    CGAffineTransformMakeRotation(&v41, v38);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMediaRep spatialGlyphRenderable](self, "spatialGlyphRenderable"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "layer"));
    v40 = v41;
    objc_msgSend(v39, "setAffineTransform:", &v40);

  }
  +[CATransaction commit](CATransaction, "commit");
}

- (id)additionalRenderablesOverRenderable
{
  NSArray *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CRLMediaRep;
  v3 = -[CRLCanvasRep additionalRenderablesOverRenderable](&v11, "additionalRenderablesOverRenderable");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMediaRep mediaLayout](self, "mediaLayout"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mediaItem"));
  v8 = objc_msgSend(v7, "isSpatial");

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMediaRep spatialGlyphRenderable](self, "spatialGlyphRenderable"));
    objc_msgSend(v5, "addObject:", v9);

  }
  return v5;
}

+ (id)CRLSpatialLabelColor
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1002D2E00;
  v10 = sub_1002D2E10;
  v11 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithUserInterfaceStyle:](UITraitCollection, "traitCollectionWithUserInterfaceStyle:", 2));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1002D2E18;
  v5[3] = &unk_1012351C0;
  v5[4] = &v6;
  +[UITraitCollection crl_withTraitCollectionAsCurrent:performBlock:](UITraitCollection, "crl_withTraitCollectionAsCurrent:performBlock:", v2, v5);
  v3 = (id)v7[5];

  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)handleFadeOutForZoom
{
  self->mIsZooming = 1;
  -[CRLMediaRep updateSpatialLabel](self, "updateSpatialLabel");
}

- (void)handleFadeInForZoom
{
  self->mIsZooming = 0;
  -[CRLMediaRep updateSpatialLabel](self, "updateSpatialLabel");
}

- (void)documentModeDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLMediaRep;
  -[CRLCanvasRep documentModeDidChange](&v3, "documentModeDidChange");
  -[CRLCanvasRep invalidateKnobs](self, "invalidateKnobs");
}

- (BOOL)wantsContextMenuWhenEditingDisabledAtPoint:(CGPoint)a3
{
  return 1;
}

- (BOOL)i_shouldRenderStroke:(id)a3
{
  NSNull *v3;
  NSNull *v4;
  unsigned __int8 v5;

  v3 = (NSNull *)a3;
  v4 = +[NSNull null](NSNull, "null");
  v5 = 0;
  if (v3 && v4 != v3)
    v5 = -[NSNull shouldRender](v3, "shouldRender");

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mGlyphRenderable, 0);
}

@end
