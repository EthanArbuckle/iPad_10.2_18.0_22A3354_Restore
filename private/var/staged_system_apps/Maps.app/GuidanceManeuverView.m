@implementation GuidanceManeuverView

- (GuidanceManeuverView)initWithFrame:(CGRect)a3
{
  return -[GuidanceManeuverView initWithFrame:textureProvider:](self, "initWithFrame:textureProvider:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (GuidanceManeuverView)initWithFrame:(CGRect)a3 textureProvider:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  GuidanceManeuverView *v11;
  GuidanceManeuverView *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[62];
  objc_super v20;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v20.receiver = self;
  v20.super_class = (Class)GuidanceManeuverView;
  v11 = -[GuidanceManeuverView initWithFrame:](&v20, "initWithFrame:", x, y, width, height);
  v12 = v11;
  if (v11)
  {
    v11->_disallowManeuversWithoutArt = 1;
    MKDefaultGuidanceManeuverMetrics(v19);
    v13 = memcpy(&v12->_arrowMetrics, v19, sizeof(v12->_arrowMetrics));
    MKDefaultJunctionManeuverMetrics(v19, v13);
    memcpy(&v12->_junctionArrowMetrics, v19, sizeof(v12->_junctionArrowMetrics));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[GuidanceManeuverView setArrowColor:](v12, "setArrowColor:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    -[GuidanceManeuverView setAccentColor:](v12, "setAccentColor:", v15);

    -[GuidanceManeuverView setClearsContextBeforeDrawing:](v12, "setClearsContextBeforeDrawing:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[GuidanceManeuverView setBackgroundColor:](v12, "setBackgroundColor:", v16);

    -[GuidanceManeuverView setOpaque:](v12, "setOpaque:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView layer](v12, "layer"));
    objc_msgSend(v17, "setNeedsDisplayOnBoundsChange:", 1);

    -[GuidanceManeuverView setShieldIdiom:](v12, "setShieldIdiom:", 0);
    objc_storeStrong((id *)&v12->_textureProvider, a4);
  }

  return v12;
}

- (id)accessibilityIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class(self, a2);
  return NSStringFromClass(v2);
}

- (BOOL)_maneuverIsDrawnByDrawRect
{
  void *v3;
  void *v4;
  BOOL result;
  unsigned int v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverArtwork junction](self->_maneuverArtwork, "junction"));

  if (v3)
    return 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverArtwork artworkDataSource](self->_maneuverArtwork, "artworkDataSource"));

  if (v4)
    return 1;
  v6 = -[GuidanceManeuverArtwork maneuver](self->_maneuverArtwork, "maneuver") - 1;
  result = 1;
  switch(v6)
  {
    case 0u:
    case 1u:
    case 2u:
    case 3u:
    case 4u:
    case 5u:
    case 6u:
    case 0xAu:
    case 0xBu:
    case 0xFu:
    case 0x10u:
    case 0x11u:
    case 0x13u:
    case 0x14u:
    case 0x15u:
    case 0x16u:
    case 0x18u:
    case 0x19u:
    case 0x1Au:
    case 0x1Bu:
    case 0x1Cu:
    case 0x1Du:
    case 0x20u:
    case 0x21u:
    case 0x22u:
    case 0x26u:
    case 0x3Bu:
    case 0x3Cu:
    case 0x3Du:
    case 0x3Eu:
    case 0x3Fu:
    case 0x40u:
    case 0x41u:
    case 0x4Fu:
    case 0x50u:
    case 0x51u:
    case 0x52u:
    case 0x53u:
    case 0x54u:
    case 0x55u:
    case 0x57u:
      return result;
    default:
      result = 0;
      break;
  }
  return result;
}

- (void)drawIntersectionFill:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView accentColor](self, "accentColor"));
  objc_msgSend(v4, "setFill");

  objc_msgSend(v5, "fillWithBlendMode:alpha:", 0, 1.0);
}

- (void)drawIntersectionStroke:(id)a3 forFill:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView arrowColor](self, "arrowColor"));
  objc_msgSend(v8, "setStroke");

  -[GuidanceManeuverView arrowMetrics](self, "arrowMetrics");
  objc_msgSend(v7, "setLineWidth:", v9);
  objc_msgSend(v7, "setLineCapStyle:", 0);
  objc_msgSend(v7, "setLineJoinStyle:", 1);
  objc_msgSend(v6, "addClip");

  objc_msgSend(v7, "stroke");
}

- (void)drawArrow:(id)a3 stroke:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (!v6)
    v6 = v9;
  if (!-[GuidanceManeuverView framing](self, "framing"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView accentColor](self, "accentColor"));
    objc_msgSend(v7, "setStroke");

    objc_msgSend(v6, "setLineWidth:", 2.0);
    objc_msgSend(v6, "strokeWithBlendMode:alpha:", 0, 1.0);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView arrowColor](self, "arrowColor"));
  objc_msgSend(v8, "setFill");

  objc_msgSend(v9, "fill");
}

- (CGAffineTransform)transformForDrawingPathsWithFrame:(SEL)a3 relativeToReferenceSize:(CGRect)a4
{
  double height;
  double width;
  double x;
  double v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  __int128 v15;
  CGAffineTransform *result;
  __int128 v17;
  double y;
  CGAffineTransform v19;
  CGAffineTransform v20;
  CGAffineTransform v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  -[GuidanceManeuverView bounds](self, "bounds", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5.width, a5.height);
  v9 = 1.0;
  v23 = CGRectInset(v22, 1.0, 1.0);
  v10 = v23.origin.x;
  v11 = v23.origin.y;
  v12 = v23.size.width;
  v13 = v23.size.height;
  if (width > v23.size.width || height > v23.size.height)
  {
    if (v23.size.width / width >= v23.size.height / height)
      v9 = v23.size.height / height;
    else
      v9 = v23.size.width / width;
  }
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  CGAffineTransformMakeScale(retstr, v9, v9);
  v15 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v20.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v20.c = v15;
  *(_OWORD *)&v20.tx = *(_OWORD *)&retstr->tx;
  CGAffineTransformInvert(&v21, &v20);
  v24.origin.x = v10;
  v24.origin.y = v11;
  v24.size.width = v12;
  v24.size.height = v13;
  v25 = CGRectApplyAffineTransform(v24, &v21);
  v25.origin.y = v25.origin.y + (v25.size.height - height) * 0.5 - y;
  *(_OWORD *)&v25.size.height = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v19.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v19.c = *(_OWORD *)&v25.size.height;
  *(_OWORD *)&v19.tx = *(_OWORD *)&retstr->tx;
  result = CGAffineTransformTranslate(&v20, &v19, v25.origin.x + (v25.size.width - width) * 0.5 - x, v25.origin.y);
  v17 = *(_OWORD *)&v20.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v20.a;
  *(_OWORD *)&retstr->c = v17;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v20.tx;
  return result;
}

- (void)drawArrow:(id)a3 stroke:(id)a4 withVisibleWidth:(double)a5 intersectionFillPath:(id)a6 intersectionStrokePath:(id)a7 referenceSize:(CGSize)a8
{
  double height;
  double width;
  id v15;
  id v16;
  id v17;
  id v18;
  double x;
  double y;
  double v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  _QWORD v31[5];
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[4];
  id v38;
  GuidanceManeuverView *v39;
  id v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[4];
  id v46;
  GuidanceManeuverView *v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;

  height = a8.height;
  width = a8.width;
  v15 = a3;
  v16 = a4;
  v17 = a6;
  v18 = a7;
  objc_msgSend(v15, "pathBounds");
  v56 = CGRectIntegral(v55);
  x = v56.origin.x;
  y = v56.origin.y;
  v21 = v56.size.height;
  if (a5 <= 0.0)
    a5 = v56.size.width;
  objc_msgSend(v17, "pathBounds");
  if (v17)
  {
    v59.origin.x = v22;
    v59.origin.y = v23;
    v59.size.width = v24;
    v59.size.height = v25;
    v57.origin.x = x;
    v57.origin.y = y;
    v57.size.width = a5;
    v57.size.height = v21;
    v58 = CGRectUnion(v57, v59);
    x = v58.origin.x;
    y = v58.origin.y;
    a5 = v58.size.width;
    v21 = v58.size.height;
  }
  v53 = 0u;
  v54 = 0u;
  v52 = 0u;
  -[GuidanceManeuverView transformForDrawingPathsWithFrame:relativeToReferenceSize:](self, "transformForDrawingPathsWithFrame:relativeToReferenceSize:", x, y, a5, v21, width, height);
  if (v17)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", x, y, a5, v21));
    objc_msgSend(v26, "appendPath:", v15);
    objc_msgSend(v26, "setUsesEvenOddFillRule:", 1);
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_10060BAE4;
    v45[3] = &unk_1011BE090;
    v49 = v52;
    v50 = v53;
    v51 = v54;
    v27 = v26;
    v46 = v27;
    v47 = self;
    v28 = v17;
    v48 = v28;
    sub_10060BA98(v45);
    if (v18)
    {
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_10060BB3C;
      v37[3] = &unk_1011BE0B8;
      v42 = v52;
      v43 = v53;
      v44 = v54;
      v38 = v27;
      v39 = self;
      v40 = v18;
      v41 = v28;
      sub_10060BA98(v37);

    }
  }
  v31[1] = 3221225472;
  v34 = v52;
  v31[0] = _NSConcreteStackBlock;
  v31[2] = sub_10060BB94;
  v31[3] = &unk_1011BE090;
  v35 = v53;
  v36 = v54;
  v31[4] = self;
  v32 = v15;
  v33 = v16;
  v29 = v16;
  v30 = v15;
  sub_10060BA98(v31);

}

- (void)_updateManeuverImage
{
  UIImage *maneuverImage;
  void *v4;
  double y;
  void *v6;
  UIImage *v7;
  UIImage *v8;
  double v9;
  double v10;

  maneuverImage = self->_maneuverImage;
  self->_maneuverImage = 0;

  -[GuidanceManeuverView _updateManeuverArtworkImageIfNeeded](self, "_updateManeuverArtworkImageIfNeeded");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverArtwork artworkDataSource](self->_maneuverArtwork, "artworkDataSource"));

  if (!v4)
  {
    -[GuidanceManeuverView arrowMetrics](self, "arrowMetrics");
    y = CGPointZero.y;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView maneuverArtwork](self, "maneuverArtwork"));
    v7 = (UIImage *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView _imageWithManeuverType:inRect:](self, "_imageWithManeuverType:inRect:", objc_msgSend(v6, "maneuver"), CGPointZero.x, y, v9, v10));
    v8 = self->_maneuverImage;
    self->_maneuverImage = v7;

  }
}

- (void)_updateManeuverArtworkImageIfNeeded
{
  void *v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  GuidanceManeuverView *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double Width;
  double Height;
  MKArtworkImageView *v16;
  MKArtworkImageView *maneuverArtworkImageView;
  void *v18;
  id v19;
  GuidanceManeuverView *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[4];
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverArtwork artworkDataSource](self->_maneuverArtwork, "artworkDataSource"));
  if (v3)
  {
    if (-[GuidanceManeuverView usesCompactImages](self, "usesCompactImages"))
    {
      v4 = 20.0;
      v5 = 0.0;
      v6 = 0.0;
      v7 = 20.0;
    }
    else
    {
      -[GuidanceManeuverView bounds](self, "bounds");
      v5 = v9;
      v6 = v10;
      v4 = v11;
      v7 = v12;
    }
    v36.origin.x = v5;
    v36.origin.y = v6;
    v36.size.width = v4;
    v36.size.height = v7;
    Width = CGRectGetWidth(v36);
    v37.origin.x = v5;
    v37.origin.y = v6;
    v37.size.width = v4;
    v37.size.height = v7;
    Height = CGRectGetHeight(v37);
    if (Width <= 2.22044605e-16 || Height <= 2.22044605e-16)
    {
      -[GuidanceManeuverView layoutIfNeeded](self, "layoutIfNeeded");
      -[GuidanceManeuverView frame](self, "frame");
      Width = CGRectGetWidth(v38);
      -[GuidanceManeuverView frame](self, "frame");
      Height = CGRectGetHeight(v39);
    }
    if (!self->_maneuverArtworkImageView)
    {
      v16 = (MKArtworkImageView *)objc_msgSend(objc_alloc((Class)MKArtworkImageView), "initWithFrame:", 0.0, 0.0, Width, Height);
      maneuverArtworkImageView = self->_maneuverArtworkImageView;
      self->_maneuverArtworkImageView = v16;

      -[MKArtworkImageView setContentMode:](self->_maneuverArtworkImageView, "setContentMode:", 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView arrowColor](self, "arrowColor"));
      -[MKArtworkImageView setTintColor:](self->_maneuverArtworkImageView, "setTintColor:", v18);

      -[MKArtworkImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_maneuverArtworkImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    }
    v19 = objc_msgSend(objc_alloc((Class)MKSizedTransitArtwork), "initWithArtwork:shieldSize:artworkCache:", v3, 8, 0);
    -[MKArtworkImageView setImageSource:](self->_maneuverArtworkImageView, "setImageSource:", v19);
    v20 = (GuidanceManeuverView *)objc_claimAutoreleasedReturnValue(-[MKArtworkImageView superview](self->_maneuverArtworkImageView, "superview"));

    if (v20 != self)
    {
      -[GuidanceManeuverView addSubview:](self, "addSubview:", self->_maneuverArtworkImageView);
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[MKArtworkImageView widthAnchor](self->_maneuverArtworkImageView, "widthAnchor"));
      v40.origin.x = 0.0;
      v40.origin.y = 0.0;
      v40.size.width = Width;
      v40.size.height = Height;
      v21 = objc_msgSend(v34, "constraintEqualToConstant:", CGRectGetWidth(v40));
      v33 = (void *)objc_claimAutoreleasedReturnValue(v21);
      v35[0] = v33;
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[MKArtworkImageView heightAnchor](self->_maneuverArtworkImageView, "heightAnchor"));
      v41.origin.x = 0.0;
      v41.origin.y = 0.0;
      v41.size.width = Width;
      v41.size.height = Height;
      v22 = objc_msgSend(v32, "constraintEqualToConstant:", CGRectGetHeight(v41));
      v31 = (void *)objc_claimAutoreleasedReturnValue(v22);
      v35[1] = v31;
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[MKArtworkImageView centerXAnchor](self->_maneuverArtworkImageView, "centerXAnchor"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView centerXAnchor](self, "centerXAnchor"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v24));
      v35[2] = v25;
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[MKArtworkImageView centerYAnchor](self->_maneuverArtworkImageView, "centerYAnchor"));
      v27 = v3;
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView centerYAnchor](self, "centerYAnchor"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v28));
      v35[3] = v29;
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v35, 4));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v30);

      v3 = v27;
      -[GuidanceManeuverView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    }

  }
  else
  {
    v8 = (GuidanceManeuverView *)objc_claimAutoreleasedReturnValue(-[MKArtworkImageView superview](self->_maneuverArtworkImageView, "superview"));

    if (v8 == self)
      -[MKArtworkImageView removeFromSuperview](self->_maneuverArtworkImageView, "removeFromSuperview");
  }

}

- (void)_updateDrawingPaths
{
  UIBezierPath *arrowPath;
  UIBezierPath *arrowStrokePath;
  UIBezierPath *intersectionFillPath;
  UIBezierPath *intersectionStrokePath;
  NSArray *arrivalCircles;
  UIImage *maneuverImage;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  double y;
  UIBezierPath *v17;
  UIBezierPath *v18;
  UIBezierPath *v19;
  void *v20;
  unsigned __int8 v21;
  UIBezierPath *v22;
  void *v23;
  id v24;
  UIBezierPath *v25;
  UIBezierPath *v26;
  UIBezierPath *v27;
  char *v28;
  char *v29;
  void *v30;
  unsigned int v31;
  UIBezierPath *v32;
  UIBezierPath *v33;
  UIBezierPath *v34;
  UIBezierPath *v35;
  UIBezierPath *v36;
  UIBezierPath *v37;
  UIBezierPath *v38;
  UIBezierPath *v39;
  char v40;
  char v41;
  _BYTE v42[496];
  _BYTE v43[496];
  _BYTE v44[496];
  char v45;
  char v46;
  _BYTE v47[496];
  _BYTE v48[496];
  uint64_t v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;

  arrowPath = self->_arrowPath;
  self->_arrowPath = 0;

  arrowStrokePath = self->_arrowStrokePath;
  self->_arrowStrokePath = 0;

  intersectionFillPath = self->_intersectionFillPath;
  self->_intersectionFillPath = 0;

  intersectionStrokePath = self->_intersectionStrokePath;
  self->_intersectionStrokePath = 0;

  arrivalCircles = self->_arrivalCircles;
  self->_arrivalCircles = 0;

  maneuverImage = self->_maneuverImage;
  self->_maneuverImage = 0;

  -[MKArtworkImageView setImageSource:](self->_maneuverArtworkImageView, "setImageSource:", 0);
  -[GuidanceManeuverView _updateManeuverImage](self, "_updateManeuverImage");
  if (!self->_maneuverImage)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MKArtworkImageView imageSource](self->_maneuverArtworkImageView, "imageSource"));

    if (!v9)
    {
      v80 = 0u;
      v81 = 0u;
      v78 = 0u;
      v79 = 0u;
      v76 = 0u;
      v77 = 0u;
      v74 = 0u;
      v75 = 0u;
      v72 = 0u;
      v73 = 0u;
      v70 = 0u;
      v71 = 0u;
      v68 = 0u;
      v69 = 0u;
      v66 = 0u;
      v67 = 0u;
      v64 = 0u;
      v65 = 0u;
      v62 = 0u;
      v63 = 0u;
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      v51 = 0u;
      -[GuidanceManeuverView arrowMetrics](self, "arrowMetrics");
      v50 = 0;
      v10 = -[GuidanceManeuverView displayManeuver](self, "displayManeuver");
      if (-[GuidanceManeuverView _maneuverTypeRequiresDrawingPaths:](self, "_maneuverTypeRequiresDrawingPaths:", v10))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView maneuverArtwork](self, "maneuverArtwork"));
        v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "junction"));
        if (!v12)
        {
LABEL_7:

          goto LABEL_8;
        }
        v13 = (void *)v12;
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView maneuverArtwork](self, "maneuverArtwork"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "junction"));
        if ((objc_msgSend(v15, "rightOrLeftTurnWillSnapToNinetyDegrees") & 1) != 0)
        {

          goto LABEL_7;
        }
        if (-[GuidanceManeuverView usesCompactImages](self, "usesCompactImages"))
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView maneuverArtwork](self, "maneuverArtwork"));
          v21 = objc_msgSend(v20, "isRoundaboutManeuver");

          if ((v21 & 1) == 0)
          {
LABEL_8:
            y = CGPointZero.y;
            v17 = (UIBezierPath *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPath](UIBezierPath, "bezierPath"));
            v18 = self->_arrowPath;
            self->_arrowPath = v17;

            if ((int)v10 > 84)
            {
              if ((_DWORD)v10 == 88 || (_DWORD)v10 == 86)
              {
LABEL_21:
                v22 = self->_arrowPath;
                v23 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView maneuverArtwork](self, "maneuverArtwork"));
                v24 = objc_msgSend(v23, "drivingSide");
                -[GuidanceManeuverView arrowMetrics](self, "arrowMetrics");
                MKArrowAppendUTurnToPathInRect(v22, v24, v44, 0, CGPointZero.x, y, 0.0, 0.0);

              }
              else if ((_DWORD)v10 == 85)
              {
LABEL_20:
                -[GuidanceManeuverView _updateDrawingPathsForProceedToRoute](self, "_updateDrawingPathsForProceedToRoute");
              }
            }
            else
            {
              switch((int)v10)
              {
                case 1:
                case 27:
                case 60:
                  v25 = self->_arrowPath;
                  -[GuidanceManeuverView arrowMetrics](self, "arrowMetrics");
                  MKArrowAppendLeftTurnToPathInRect(v25, v48, &v50, 0, CGPointZero.x, y, 0.0, 0.0);
                  goto LABEL_32;
                case 2:
                case 28:
                case 61:
                  v26 = self->_arrowPath;
                  -[GuidanceManeuverView arrowMetrics](self, "arrowMetrics");
                  MKArrowAppendRightTurnToPathInRect(v26, v47, &v50, 0, CGPointZero.x, y, 0.0, 0.0);
                  goto LABEL_32;
                case 3:
                case 5:
                case 6:
                case 7:
                case 12:
                case 23:
                case 64:
                  v19 = self->_arrowPath;
                  -[GuidanceManeuverView arrowMetrics](self, "arrowMetrics");
                  MKArrowAppendStraightArrowToPathInRect(v19, &v49, 0, CGPointZero.x, y, 0.0, 0.0);
                  goto LABEL_32;
                case 4:
                case 25:
                case 26:
                case 35:
                  goto LABEL_21;
                case 11:
                  v30 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView maneuverArtwork](self, "maneuverArtwork"));
                  v31 = objc_msgSend(v30, "drivingSide");

                  v27 = self->_arrowPath;
                  if (v31)
                  {
                    -[GuidanceManeuverView arrowMetrics](self, "arrowMetrics");
                    v28 = &v40;
LABEL_25:
                    MKArrowAppendMergeLeftToPathInRect(v27, v28, 0, CGPointZero.x, y, 0.0, 0.0);
                  }
                  else
                  {
                    -[GuidanceManeuverView arrowMetrics](self, "arrowMetrics");
                    v29 = &v41;
LABEL_27:
                    MKArrowAppendMergeRightToPathInRect(v27, v29, 0, CGPointZero.x, y, 0.0, 0.0);
                  }
                  break;
                case 16:
                case 18:
                case 33:
                case 34:
                case 39:
                  -[GuidanceManeuverView _updateDrawingPathsForArrival](self, "_updateDrawingPathsForArrival");
                  goto LABEL_32;
                case 17:
                  goto LABEL_20;
                case 20:
                case 62:
                case 65:
                  v27 = self->_arrowPath;
                  -[GuidanceManeuverView arrowMetrics](self, "arrowMetrics");
                  v28 = &v46;
                  goto LABEL_25;
                case 21:
                case 63:
                case 66:
                  v27 = self->_arrowPath;
                  -[GuidanceManeuverView arrowMetrics](self, "arrowMetrics");
                  v29 = &v45;
                  goto LABEL_27;
                case 29:
                  v32 = (UIBezierPath *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPath](UIBezierPath, "bezierPath"));
                  v33 = self->_intersectionFillPath;
                  self->_intersectionFillPath = v32;

                  v34 = self->_arrowPath;
                  v35 = self->_intersectionFillPath;
                  -[GuidanceManeuverView arrowMetrics](self, "arrowMetrics");
                  MKArrowAppendExitRoadLeftToPathInRect(v34, v35, v42, 0, CGPointZero.x, y, 0.0, 0.0);
                  goto LABEL_32;
                case 30:
                  v36 = (UIBezierPath *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPath](UIBezierPath, "bezierPath"));
                  v37 = self->_intersectionFillPath;
                  self->_intersectionFillPath = v36;

                  v38 = self->_arrowPath;
                  v39 = self->_intersectionFillPath;
                  -[GuidanceManeuverView arrowMetrics](self, "arrowMetrics");
                  MKArrowAppendExitRoadRightToPathInRect(v38, v39, v43, 0, CGPointZero.x, y, 0.0, 0.0);
                  goto LABEL_32;
                default:
                  goto LABEL_32;
              }
            }
            goto LABEL_32;
          }
        }
        else
        {

        }
        -[GuidanceManeuverView _updateDrawingPathsFromJunction](self, "_updateDrawingPathsFromJunction");
      }
LABEL_32:
      -[GuidanceManeuverView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    }
  }
}

- (BOOL)_maneuverTypeRequiresDrawingPaths:(int)a3
{
  BOOL result;

  if ((a3 - 80) > 7)
    return a3 != 22;
  result = 0;
  if (((1 << (a3 - 80)) & 0x9F) == 0)
    return a3 != 22;
  return result;
}

- (void)_updateDrawingPathsForArrival
{
  void *v3;
  unsigned int v4;
  double v5;
  double v6;
  NSArray *v7;
  UIBezierPath *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  CGFloat v12;
  NSArray *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  UIBezierPath *arrowPath;
  UIBezierPath *v20;
  NSArray *arrivalCircles;
  NSArray *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v32;
  _BYTE v33[496];
  double v34;
  double v35;
  id v36;
  id v37;
  _BYTE v38[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView maneuverArtwork](self, "maneuverArtwork"));
  v4 = objc_msgSend(v3, "maneuver");

  v36 = 0;
  v37 = 0;
  -[GuidanceManeuverView arrowMetrics](self, "arrowMetrics");
  v5 = v34;
  v6 = v35;
  -[GuidanceManeuverView arrowMetrics](self, "arrowMetrics");
  MKArrowCreateBezierPathsForArrivalWithSize(&v37, &v36, v33, v5, v6);
  v7 = (NSArray *)v37;
  v8 = (UIBezierPath *)v36;
  v9 = *(_OWORD *)&CGAffineTransformIdentity.a;
  v10 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&v32.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&v32.c = v10;
  v11 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  *(_OWORD *)&v32.tx = v11;
  if (v4 == 33)
  {
    v23 = v11;
    v24 = v10;
    v25 = v9;
    v12 = -1.57079633;
  }
  else
  {
    if (v4 != 34)
      goto LABEL_6;
    v23 = v11;
    v24 = v10;
    v25 = v9;
    v12 = 1.57079633;
  }
  CGAffineTransformMakeRotation(&v32, v12);
  v10 = v24;
  v9 = v25;
  v11 = v23;
LABEL_6:
  t1 = v32;
  *(_OWORD *)&t2.a = v9;
  *(_OWORD *)&t2.c = v10;
  *(_OWORD *)&t2.tx = v11;
  if (!CGAffineTransformEqualToTransform(&t1, &t2))
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v13 = v7;
    v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(_QWORD *)v27 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
          t1 = v32;
          objc_msgSend(v18, "applyTransform:", &t1, v23, v24, v25, (_QWORD)v26);
        }
        v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
      }
      while (v15);
    }

    t1 = v32;
    -[UIBezierPath applyTransform:](v8, "applyTransform:", &t1);
  }
  arrowPath = self->_arrowPath;
  self->_arrowPath = v8;
  v20 = v8;

  arrivalCircles = self->_arrivalCircles;
  self->_arrivalCircles = v7;
  v22 = v7;

}

- (void)_updateDrawingPathsForProceedToRoute
{
  double v3;
  double v4;
  id v5;
  UIBezierPath *v6;
  NSArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  UIBezierPath *arrowPath;
  UIBezierPath *v14;
  NSArray *arrivalCircles;
  NSArray *v16;
  CGAffineTransform v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  CGAffineTransform v22;
  _BYTE v23[496];
  double v24;
  double v25;
  id v26;
  id v27;
  _BYTE v28[128];

  v26 = 0;
  v27 = 0;
  -[GuidanceManeuverView arrowMetrics](self, "arrowMetrics");
  v3 = v24;
  v4 = v25;
  -[GuidanceManeuverView arrowMetrics](self, "arrowMetrics");
  MKArrowCreateBezierPathsForProceedToRouteWithSize(&v27, &v26, v23, v3, v4);
  v5 = v27;
  v6 = (UIBezierPath *)v26;
  memset(&v22, 0, sizeof(v22));
  CGAffineTransformMakeRotation(&v22, -1.57079633);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = (NSArray *)v5;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v11);
        v17 = v22;
        objc_msgSend(v12, "applyTransform:", &v17);
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
    }
    while (v9);
  }

  v17 = v22;
  -[UIBezierPath applyTransform:](v6, "applyTransform:", &v17);
  arrowPath = self->_arrowPath;
  self->_arrowPath = v6;
  v14 = v6;

  arrivalCircles = self->_arrivalCircles;
  self->_arrivalCircles = v7;
  v16 = v7;

}

- (void)_updateDrawingPathsFromJunction
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  UIBezierPath *v7;
  UIBezierPath *v8;
  UIBezierPath *v9;
  UIBezierPath *arrowPath;
  UIBezierPath *v11;
  UIBezierPath *arrowStrokePath;
  UIBezierPath *v13;
  UIBezierPath *intersectionFillPath;
  UIBezierPath *v15;
  UIBezierPath *intersectionStrokePath;
  _BYTE __dst[496];
  id v18;
  id v19;
  id v20;
  _OWORD __src[31];

  memset(__src, 0, sizeof(__src));
  -[GuidanceManeuverView junctionArrowMetrics](self, "junctionArrowMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView maneuverArtwork](self, "maneuverArtwork"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "junction"));
  v20 = 0;
  v19 = 0;
  v18 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView maneuverArtwork](self, "maneuverArtwork"));
  v6 = objc_msgSend(v5, "drivingSide");
  memcpy(__dst, __src, sizeof(__dst));
  objc_msgSend(v4, "getArrowPath:arrowStrokePath:intersectionBackgroundPath:strokePath:withSize:metrics:drivingSide:visualCenter:", &v20, &v19, &v18, 0, __dst, v6, *((double *)__src + 1), *(double *)&__src[1], 0);
  v7 = (UIBezierPath *)v20;
  v8 = (UIBezierPath *)v19;
  v9 = (UIBezierPath *)v18;

  arrowPath = self->_arrowPath;
  self->_arrowPath = v7;
  v11 = v7;

  arrowStrokePath = self->_arrowStrokePath;
  self->_arrowStrokePath = v8;
  v13 = v8;

  intersectionFillPath = self->_intersectionFillPath;
  self->_intersectionFillPath = v9;
  v15 = v9;

  intersectionStrokePath = self->_intersectionStrokePath;
  self->_intersectionStrokePath = 0;

}

- (void)drawRect:(CGRect)a3
{
  void *v4;
  unsigned int v5;

  if (-[GuidanceManeuverView _maneuverIsDrawnByDrawRect](self, "_maneuverIsDrawnByDrawRect", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height))
  {
    if (self->_maneuverImage)
    {
      -[GuidanceManeuverView _drawManeuverImage](self, "_drawManeuverImage");
      return;
    }
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView maneuverArtwork](self, "maneuverArtwork"));
    v5 = objc_msgSend(v4, "maneuver");

    if (v5 <= 0x27)
    {
      if (((1 << v5) & 0x8600050000) != 0)
      {
        -[GuidanceManeuverView _drawArrival](self, "_drawArrival");
        return;
      }
      if (v5 == 17)
        goto LABEL_10;
    }
    if (v5 == 85)
LABEL_10:
      -[GuidanceManeuverView _drawProceedToRoute](self, "_drawProceedToRoute");
    else
      -[GuidanceManeuverView _drawDefaultPaths](self, "_drawDefaultPaths");
  }
}

- (void)_drawManeuverImage
{
  UIImage *maneuverImage;
  double v3;
  double v4;

  maneuverImage = self->_maneuverImage;
  if (maneuverImage)
  {
    -[GuidanceManeuverView bounds](self, "bounds");
    MKCGRectFittingImageWithinSize(maneuverImage, v3, v4);
    -[UIImage drawInRect:](maneuverImage, "drawInRect:");
  }
}

- (void)_drawDefaultPaths
{
  UIBezierPath *arrowPath;
  UIBezierPath *arrowStrokePath;
  double visibleWidth;
  UIBezierPath *intersectionFillPath;
  UIBezierPath *intersectionStrokePath;
  double v8;
  double v9;

  arrowPath = self->_arrowPath;
  if (arrowPath)
  {
    arrowStrokePath = self->_arrowStrokePath;
    visibleWidth = self->_visibleWidth;
    intersectionFillPath = self->_intersectionFillPath;
    intersectionStrokePath = self->_intersectionStrokePath;
    -[GuidanceManeuverView arrowMetrics](self, "arrowMetrics");
    -[GuidanceManeuverView drawArrow:stroke:withVisibleWidth:intersectionFillPath:intersectionStrokePath:referenceSize:](self, "drawArrow:stroke:withVisibleWidth:intersectionFillPath:intersectionStrokePath:referenceSize:", arrowPath, arrowStrokePath, intersectionFillPath, intersectionStrokePath, visibleWidth, v8, v9);
  }
}

- (void)_drawArrival
{
  NSArray *v3;
  UIBezierPath *v4;
  double v5;
  CGFloat x;
  double v7;
  CGFloat y;
  double v9;
  CGFloat width;
  double v11;
  CGFloat height;
  NSArray *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  double v25;
  UIBezierPath *v26;
  NSArray *v27;
  _QWORD v28[4];
  NSArray *v29;
  GuidanceManeuverView *v30;
  UIBezierPath *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  double v35;
  double v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;

  v3 = self->_arrivalCircles;
  v4 = self->_arrowPath;
  -[UIBezierPath pathBounds](v4, "pathBounds");
  x = v5;
  y = v7;
  width = v9;
  height = v11;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v13 = v3;
  v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v41;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v41 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)v17), "pathBounds");
        v49.origin.x = v18;
        v49.origin.y = v19;
        v49.size.width = v20;
        v49.size.height = v21;
        v45.origin.x = x;
        v45.origin.y = y;
        v45.size.width = width;
        v45.size.height = height;
        v46 = CGRectUnion(v45, v49);
        x = v46.origin.x;
        y = v46.origin.y;
        width = v46.size.width;
        height = v46.size.height;
        v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v15);
  }

  v47.origin.x = x;
  v47.origin.y = y;
  v47.size.width = width;
  v47.size.height = height;
  v48 = CGRectIntegral(v47);
  v22 = v48.origin.x;
  v23 = v48.origin.y;
  v24 = v48.size.width;
  v25 = v48.size.height;
  v38 = 0u;
  v39 = 0u;
  v37 = 0u;
  -[GuidanceManeuverView arrowMetrics](self, "arrowMetrics");
  -[GuidanceManeuverView transformForDrawingPathsWithFrame:relativeToReferenceSize:](self, "transformForDrawingPathsWithFrame:relativeToReferenceSize:", v22, v23, v24, v25, v35, v36);
  v28[1] = 3221225472;
  v32 = v37;
  v28[0] = _NSConcreteStackBlock;
  v28[2] = sub_10060CFE4;
  v28[3] = &unk_1011BE090;
  v33 = v38;
  v34 = v39;
  v29 = v13;
  v30 = self;
  v31 = v4;
  v26 = v4;
  v27 = v13;
  sub_10060BA98(v28);

}

- (void)_drawProceedToRoute
{
  NSArray *v3;
  UIBezierPath *v4;
  double v5;
  CGFloat x;
  double v7;
  CGFloat y;
  double v9;
  CGFloat width;
  double v11;
  CGFloat height;
  NSArray *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  double v25;
  UIBezierPath *v26;
  NSArray *v27;
  _QWORD v28[4];
  NSArray *v29;
  GuidanceManeuverView *v30;
  UIBezierPath *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  double v35;
  double v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;

  v3 = self->_arrivalCircles;
  v4 = self->_arrowPath;
  -[UIBezierPath pathBounds](v4, "pathBounds");
  x = v5;
  y = v7;
  width = v9;
  height = v11;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v13 = v3;
  v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v41;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v41 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)v17), "pathBounds");
        v49.origin.x = v18;
        v49.origin.y = v19;
        v49.size.width = v20;
        v49.size.height = v21;
        v45.origin.x = x;
        v45.origin.y = y;
        v45.size.width = width;
        v45.size.height = height;
        v46 = CGRectUnion(v45, v49);
        x = v46.origin.x;
        y = v46.origin.y;
        width = v46.size.width;
        height = v46.size.height;
        v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v15);
  }

  v47.origin.x = x;
  v47.origin.y = y;
  v47.size.width = width;
  v47.size.height = height;
  v48 = CGRectIntegral(v47);
  v22 = v48.origin.x;
  v23 = v48.origin.y;
  v24 = v48.size.width;
  v25 = v48.size.height;
  v38 = 0u;
  v39 = 0u;
  v37 = 0u;
  -[GuidanceManeuverView arrowMetrics](self, "arrowMetrics");
  -[GuidanceManeuverView transformForDrawingPathsWithFrame:relativeToReferenceSize:](self, "transformForDrawingPathsWithFrame:relativeToReferenceSize:", v22, v23, v24, v25, v35, v36);
  v28[1] = 3221225472;
  v32 = v37;
  v28[0] = _NSConcreteStackBlock;
  v28[2] = sub_10060D3BC;
  v28[3] = &unk_1011BE090;
  v33 = v38;
  v34 = v39;
  v29 = v13;
  v30 = self;
  v31 = v4;
  v26 = v4;
  v27 = v13;
  sub_10060BA98(v28);

}

- (void)_invalidateDrawingPaths
{
  -[GuidanceManeuverView setNeedsDisplay](self, "setNeedsDisplay");
  -[GuidanceManeuverView _updateDrawingPaths](self, "_updateDrawingPaths");
}

- (id)_imageWithManeuverType:(int)a3 inRect:(CGRect)a4
{
  double height;
  double width;
  uint64_t v7;
  void *v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  void *v17;
  uint64_t v18;

  if ((a3 - 80) < 5 || a3 == 22)
  {
    height = a4.size.height;
    width = a4.size.width;
    v7 = *(_QWORD *)&a3;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView maneuverArtwork](self, "maneuverArtwork", a4.origin.x, a4.origin.y));
    v10 = objc_msgSend(v9, "drivingSide");
    -[GuidanceManeuverView arrowMetrics](self, "arrowMetrics");
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView _screen](self, "_screen"));
    objc_msgSend(v11, "scale");
    v13 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView arrowColor](self, "arrowColor"));
    v15 = MKManeuverArrowImage(v7, v10, &v18, v14, 0, 0, width, height, v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v15);

    objc_msgSend(v17, "setAccessibilityIdentifier:", CFSTR("ManeuverImage"));
    objc_storeStrong((id *)&self->_maneuverImage, v17);
  }
  else
  {
    v17 = 0;
  }
  return v17;
}

- (void)setManeuverArtwork:(id)a3
{
  GuidanceManeuverArtwork *v5;
  GuidanceManeuverArtwork *maneuverArtwork;
  unsigned __int8 v7;
  GuidanceManeuverArtwork *v8;

  v5 = (GuidanceManeuverArtwork *)a3;
  maneuverArtwork = self->_maneuverArtwork;
  if (maneuverArtwork != v5)
  {
    v8 = v5;
    v7 = -[GuidanceManeuverArtwork isEqual:](maneuverArtwork, "isEqual:", v5);
    v5 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_maneuverArtwork, a3);
      -[GuidanceManeuverView _invalidateDrawingPaths](self, "_invalidateDrawingPaths");
      v5 = v8;
    }
  }

}

- (void)setArrowColor:(id)a3
{
  UIColor *v4;
  UIColor *v5;

  v4 = (UIColor *)a3;
  if (!v4)
    v4 = (UIColor *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  if (v4 != self->_arrowColor)
  {
    v5 = v4;
    objc_storeStrong((id *)&self->_arrowColor, v4);
    -[MKArtworkImageView setTintColor:](self->_maneuverArtworkImageView, "setTintColor:", self->_arrowColor);
    -[GuidanceManeuverView _updateManeuverImage](self, "_updateManeuverImage");
    -[GuidanceManeuverView setNeedsDisplay](self, "setNeedsDisplay");
    v4 = v5;
  }

}

- (void)setAccentColor:(id)a3
{
  UIColor *v4;
  UIColor *v5;

  v4 = (UIColor *)a3;
  if (!v4)
    v4 = (UIColor *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  if (v4 != self->_accentColor)
  {
    v5 = v4;
    objc_storeStrong((id *)&self->_accentColor, v4);
    -[GuidanceManeuverView setNeedsDisplay](self, "setNeedsDisplay");
    v4 = v5;
  }

}

- (int)displayManeuver
{
  int result;

  if (!-[GuidanceManeuverView disallowManeuversWithoutArt](self, "disallowManeuversWithoutArt"))
    return -[GuidanceManeuverArtwork maneuver](self->_maneuverArtwork, "maneuver");
  result = -[GuidanceManeuverView _maneuverIsDrawnByDrawRect](self, "_maneuverIsDrawnByDrawRect");
  if (result)
    return -[GuidanceManeuverArtwork maneuver](self->_maneuverArtwork, "maneuver");
  return result;
}

- (void)disallowMutation
{
  self->_disallowMutation = 1;
}

- (void)setFraming:(unsigned int)a3
{
  if (self->_framing != a3)
  {
    self->_framing = a3;
    -[GuidanceManeuverView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setArrowMetrics:(id *)a3
{
  $4F77D22549FC7EC57EA30EF6B1A3F121 *p_arrowMetrics;
  _BYTE v6[496];
  _BYTE __dst[496];

  p_arrowMetrics = &self->_arrowMetrics;
  memcpy(__dst, a3, sizeof(__dst));
  memcpy(v6, p_arrowMetrics, sizeof(v6));
  if ((MKGuidanceManeuverArrowMetricsEqualToArrowMetrics(__dst, v6) & 1) == 0)
  {
    memcpy(p_arrowMetrics, a3, sizeof($4F77D22549FC7EC57EA30EF6B1A3F121));
    -[GuidanceManeuverView _invalidateDrawingPaths](self, "_invalidateDrawingPaths");
  }
}

- (void)setJunctionArrowMetrics:(id *)a3
{
  $4F77D22549FC7EC57EA30EF6B1A3F121 *p_junctionArrowMetrics;
  _BYTE v6[496];
  _BYTE __dst[496];

  p_junctionArrowMetrics = &self->_junctionArrowMetrics;
  memcpy(__dst, a3, sizeof(__dst));
  memcpy(v6, p_junctionArrowMetrics, sizeof(v6));
  if ((MKGuidanceManeuverArrowMetricsEqualToArrowMetrics(__dst, v6) & 1) == 0)
  {
    memcpy(p_junctionArrowMetrics, a3, sizeof($4F77D22549FC7EC57EA30EF6B1A3F121));
    -[GuidanceManeuverView _invalidateDrawingPaths](self, "_invalidateDrawingPaths");
  }
}

- (CGSize)intrinsicContentSize
{
  GuidanceManeuverView *v3;
  UIImage *maneuverImage;
  double v5;
  double v6;
  CGFloat v7;
  CGFloat v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  double v29;
  NSArray *arrivalCircles;
  NSArray *v31;
  id v32;
  id v33;
  uint64_t v34;
  void *i;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  double v45;
  double v46;
  _BYTE v47[128];
  CGSize result;

  v3 = (GuidanceManeuverView *)objc_claimAutoreleasedReturnValue(-[MKArtworkImageView superview](self->_maneuverArtworkImageView, "superview"));

  if (v3 == self)
  {
    v7 = 20.0;
    v8 = 20.0;
    if (!-[GuidanceManeuverView usesCompactImages](self, "usesCompactImages"))
    {
      -[MKArtworkImageView intrinsicContentSize](self->_maneuverArtworkImageView, "intrinsicContentSize");
      goto LABEL_6;
    }
  }
  else
  {
    maneuverImage = self->_maneuverImage;
    if (maneuverImage)
    {
      -[UIImage size](maneuverImage, "size");
LABEL_6:
      v7 = v5;
      v8 = v6;
      goto LABEL_21;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView maneuverArtwork](self, "maneuverArtwork"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "artworkDataSource"));
    if (v10)
    {

LABEL_20:
      -[GuidanceManeuverView arrowMetrics](self, "arrowMetrics");
      v7 = v45;
      v8 = v46;
      goto LABEL_21;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView maneuverArtwork](self, "maneuverArtwork"));
    v12 = -[GuidanceManeuverView _maneuverTypeRequiresDrawingPaths:](self, "_maneuverTypeRequiresDrawingPaths:", objc_msgSend(v11, "maneuver"));

    if ((v12 & 1) == 0)
      goto LABEL_20;
    v13 = sub_10060DBF0(self->_arrowPath, CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height);
    v17 = sub_10060DBF0(self->_arrowStrokePath, v13, v14, v15, v16);
    v21 = sub_10060DBF0(self->_intersectionFillPath, v17, v18, v19, v20);
    v25 = sub_10060DBF0(self->_intersectionStrokePath, v21, v22, v23, v24);
    v27 = v26;
    v7 = v28;
    v8 = v29;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    arrivalCircles = self->_arrivalCircles;
    if (!arrivalCircles)
      arrivalCircles = (NSArray *)&__NSArray0__struct;
    v31 = arrivalCircles;
    v32 = -[NSArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v33; i = (char *)i + 1)
        {
          if (*(_QWORD *)v42 != v34)
            objc_enumerationMutation(v31);
          v25 = sub_10060DBF0(*(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i), v25, v27, v7, v8);
          v27 = v36;
          v7 = v37;
          v8 = v38;
        }
        v33 = -[NSArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
      }
      while (v33);
    }

  }
LABEL_21:
  v39 = v7;
  v40 = v8;
  result.height = v40;
  result.width = v39;
  return result;
}

- (UIImage)imageRepresentation
{
  CGFloat v3;
  CGFloat v4;
  UIImage *ImageFromCurrentImageContext;
  void *v6;
  CGSize v8;

  -[GuidanceManeuverView bounds](self, "bounds");
  v8.width = v3;
  v8.height = v4;
  UIGraphicsBeginImageContextWithOptions(v8, 0, 0.0);
  -[GuidanceManeuverView bounds](self, "bounds");
  -[GuidanceManeuverView drawRect:](self, "drawRect:");
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v6 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();
  return (UIImage *)v6;
}

- (GuidanceManeuverArtwork)maneuverArtwork
{
  return self->_maneuverArtwork;
}

- ($84D9B426F26CE1F36C5948DD9DEACC84)arrowMetrics
{
  return ($84D9B426F26CE1F36C5948DD9DEACC84 *)memcpy(retstr, &self->_arrowMetrics, sizeof($84D9B426F26CE1F36C5948DD9DEACC84));
}

- ($84D9B426F26CE1F36C5948DD9DEACC84)junctionArrowMetrics
{
  return ($84D9B426F26CE1F36C5948DD9DEACC84 *)memcpy(retstr, &self->_junctionArrowMetrics, sizeof($84D9B426F26CE1F36C5948DD9DEACC84));
}

- (unsigned)framing
{
  return self->_framing;
}

- (UIColor)arrowColor
{
  return self->_arrowColor;
}

- (UIColor)accentColor
{
  return self->_accentColor;
}

- (int64_t)shieldIdiom
{
  return self->_shieldIdiom;
}

- (void)setShieldIdiom:(int64_t)a3
{
  self->_shieldIdiom = a3;
}

- (BOOL)usesCompactImages
{
  return self->_usesCompactImages;
}

- (void)setUsesCompactImages:(BOOL)a3
{
  self->_usesCompactImages = a3;
}

- (BOOL)disallowManeuversWithoutArt
{
  return self->_disallowManeuversWithoutArt;
}

- (void)setDisallowManeuversWithoutArt:(BOOL)a3
{
  self->_disallowManeuversWithoutArt = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maneuverArtwork, 0);
  objc_storeStrong((id *)&self->_maneuverArtworkImageView, 0);
  objc_storeStrong((id *)&self->_maneuverImage, 0);
  objc_storeStrong((id *)&self->_arrivalCircles, 0);
  objc_storeStrong((id *)&self->_intersectionStrokePath, 0);
  objc_storeStrong((id *)&self->_intersectionFillPath, 0);
  objc_storeStrong((id *)&self->_arrowStrokePath, 0);
  objc_storeStrong((id *)&self->_arrowPath, 0);
  objc_storeStrong((id *)&self->_accentColor, 0);
  objc_storeStrong((id *)&self->_arrowColor, 0);
  objc_storeStrong((id *)&self->_textureProvider, 0);
}

@end
