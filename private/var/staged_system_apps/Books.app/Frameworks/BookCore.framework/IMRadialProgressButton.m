@implementation IMRadialProgressButton

- (IMRadialProgressButton)initWithFrame:(CGRect)a3
{
  IMRadialProgressButton *v3;
  IMRadialProgressButton *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  UIImage *centerImageNormal;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  UIImage *centerImageSelected;
  void *v15;
  void *v16;
  id v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)IMRadialProgressButton;
  v3 = -[IMRadialProgressButton initWithFrame:](&v19, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMRadialProgressButton traitCollection](v3, "traitCollection"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:compatibleWithTraitCollection:](UIImage, "systemImageNamed:compatibleWithTraitCollection:", CFSTR("square.fill"), v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithTextStyle:scale:](UIImageSymbolConfiguration, "configurationWithTextStyle:scale:", UIFontTextStyleCaption2, 1));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "imageWithConfiguration:", v7));
    centerImageNormal = v4->_centerImageNormal;
    v4->_centerImageNormal = (UIImage *)v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[IMRadialProgressButton traitCollection](v4, "traitCollection"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:compatibleWithTraitCollection:](UIImage, "systemImageNamed:compatibleWithTraitCollection:", CFSTR("pause.fill"), v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithTextStyle:scale:](UIImageSymbolConfiguration, "configurationWithTextStyle:scale:", UIFontTextStyleCaption1, 1));
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "imageWithConfiguration:", v12));
    centerImageSelected = v4->_centerImageSelected;
    v4->_centerImageSelected = (UIImage *)v13;

    -[IMRadialProgressButton _updateCenterImage](v4, "_updateCenterImage");
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksLabelColor](UIColor, "bc_booksLabelColor"));
    -[IMRadialProgressButton setTintColor:](v4, "setTintColor:", v15);

    -[IMRadialProgressButton setShowsTouchWhenHighlighted:](v4, "setShowsTouchWhenHighlighted:", 1);
    v4->_showImages = 1;
    v4->_inscribeProgress = 1;
    v4->_progressLineCap = 0;
    v4->_progressThickness = 3.0;
    v4->_trackDiameter = 26.0;
    v4->_trackThickness = 1.0;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection bc_allAPITraits](UITraitCollection, "bc_allAPITraits"));
    v17 = -[IMRadialProgressButton registerForTraitChanges:withAction:](v4, "registerForTraitChanges:withAction:", v16, "_traitCollectionDidChange:previousTraitCollection:");

  }
  return v4;
}

- (void)dealloc
{
  UIColor *progressColor;
  objc_super v4;

  progressColor = self->_progressColor;
  self->_progressColor = 0;

  v4.receiver = self;
  v4.super_class = (Class)IMRadialProgressButton;
  -[IMRadialProgressButton dealloc](&v4, "dealloc");
}

- (void)useInnerRect:(CGSize)a3
{
  double height;
  double width;

  height = a3.height;
  width = a3.width;
  -[IMRadialProgressButton setUseInnerRect:](self, "setUseInnerRect:", 1);
  -[IMRadialProgressButton setInnerRectSize:](self, "setInnerRectSize:", width, height);
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = objc_msgSend(a4, "userInterfaceStyle", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IMRadialProgressButton traitCollection](self, "traitCollection"));
  v7 = objc_msgSend(v6, "userInterfaceStyle");

  if (v5 != v7)
    -[IMRadialProgressButton _updateCenterImage](self, "_updateCenterImage");
}

+ (CGSize)minimumBoundingBox
{
  double v2;
  double v3;
  CGSize result;

  v2 = 28.0;
  v3 = 28.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setShowImages:(BOOL)a3
{
  if (self->_showImages != a3)
  {
    self->_showImages = a3;
    -[IMRadialProgressButton setShowsTouchWhenHighlighted:](self, "setShowsTouchWhenHighlighted:");
    -[IMRadialProgressButton setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)drawCenteredImaged:(id)a3 screenScale:(double)a4
{
  double y;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  id v16;

  v16 = a3;
  if (-[IMRadialProgressButton showImages](self, "showImages"))
  {
    y = CGPointZero.y;
    objc_msgSend(v16, "size");
    v7 = v6;
    v9 = v8;
    v10 = -[IMRadialProgressButton bounds](self, "bounds");
    v15 = CGRectCenterRectInRect(v10, CGPointZero.x, y, v7, v9, v11, v12, v13, v14);
    CGRectRoundedForScale(v15);
    objc_msgSend(v16, "drawInRect:");
  }

}

- (void)drawRect:(CGRect)a3
{
  void *v4;
  double v5;
  double v6;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  double MidY;
  double v13;
  double v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  double v27;
  double v28;
  double v29;
  float v30;
  double v31;
  float v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  CGContext *CurrentContext;
  CGFloat v38;
  void *v39;
  void *v40;
  unsigned __int8 v41;
  double v42;
  id v43;
  double v44;
  double v45;
  double v46;
  double v47;
  const CGPath *v48;
  unsigned int v49;
  int *v50;
  double v51;
  CGRect rect;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;

  *(_QWORD *)&rect.origin.y = self;
  *(_QWORD *)&rect.size.width = IMRadialProgressButton;
  -[CGFloat drawRect:]((objc_super *)&rect.origin.y, "drawRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v4, "scale");
  v6 = v5;

  -[IMRadialProgressButton bounds](self, "bounds");
  x = v53.origin.x;
  y = v53.origin.y;
  width = v53.size.width;
  height = v53.size.height;
  MidX = CGRectGetMidX(v53);
  v54.origin.x = x;
  v54.origin.y = y;
  v54.size.width = width;
  v54.size.height = height;
  MidY = CGRectGetMidY(v54);
  -[IMRadialProgressButton trackDiameter](self, "trackDiameter");
  v14 = v13;
  v15 = -[IMRadialProgressButton trackThickness](self, "trackThickness");
  v17 = v14 - v16;
  v51 = v6;
  v18 = CGSizeRoundForScale(v15, v17, v17, v6);
  rect.origin.x = CGRectMakeWithCenterAndSize(MidX, MidY, v18, v19);
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v26 = v17 * 0.5;
  if (-[IMRadialProgressButton inscribeProgress](self, "inscribeProgress"))
  {
    -[IMRadialProgressButton progressThickness](self, "progressThickness");
    v28 = v27 * 0.5;
    -[IMRadialProgressButton trackThickness](self, "trackThickness");
    v26 = v26 - (v28 + v29 * 0.25);
  }
  -[IMRadialProgressButton progress](self, "progress");
  v31 = v30 * 6.28318531 + -1.57079633;
  -[IMRadialProgressButton progress](self, "progress");
  if (v32 >= 1.0)
    v31 = 4.70767659;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[IMRadialProgressButton trackColor](self, "trackColor"));
  v34 = v33;
  if (v33)
    v35 = v33;
  else
    v35 = (id)objc_claimAutoreleasedReturnValue(-[IMRadialProgressButton progressColor](self, "progressColor"));
  v36 = v35;

  objc_msgSend(v36, "setStroke");
  CurrentContext = UIGraphicsGetCurrentContext();
  -[IMRadialProgressButton trackThickness](self, "trackThickness");
  CGContextSetLineWidth(CurrentContext, v38);
  v55.origin.x = rect.origin.x;
  v55.origin.y = v21;
  v55.size.width = v23;
  v55.size.height = v25;
  CGContextStrokeEllipseInRect(CurrentContext, v55);
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[IMRadialProgressButton progressColor](self, "progressColor"));
  objc_msgSend(v39, "setStroke");

  v40 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPath](UIBezierPath, "bezierPath"));
  objc_msgSend(v40, "moveToPoint:", MidX, MidY - v26);
  objc_msgSend(v40, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, MidX, MidY, v26, -1.57079633, v31);
  objc_msgSend(v40, "setLineCapStyle:", -[IMRadialProgressButton progressLineCap](self, "progressLineCap"));
  v41 = -[IMRadialProgressButton inscribeProgress](self, "inscribeProgress");
  v42 = 2.5;
  if ((v41 & 1) == 0)
    -[IMRadialProgressButton progressThickness](self, "progressThickness", 2.5);
  objc_msgSend(v40, "setLineWidth:", v42);
  objc_msgSend(v40, "stroke");
  if (-[IMRadialProgressButton useInnerRect](self, "useInnerRect"))
  {
    objc_msgSend(v36, "setFill");
    v43 = -[IMRadialProgressButton innerRectSize](self, "innerRectSize");
    v46 = CGSizeRoundForScale(v43, v44, v45, v51);
    v56.origin.x = CGRectMakeWithCenterAndSize(MidX, MidY, v46, v47);
    v48 = CGPathCreateWithRoundedRect(v56, 1.0, 1.0, 0);
    CGContextAddPath(CurrentContext, v48);
    CGContextFillPath(CurrentContext);
    CGPathRelease(v48);
  }
  else
  {
    v49 = -[IMRadialProgressButton isSelected](self, "isSelected");
    v50 = &OBJC_IVAR___IMRadialProgressButton__centerImageNormalTinted;
    if (v49)
      v50 = &OBJC_IVAR___IMRadialProgressButton__centerImageSelectedTinted;
    -[IMRadialProgressButton drawCenteredImaged:screenScale:](self, "drawCenteredImaged:screenScale:", *(Class *)((char *)&self->super.super.super.super.super.super.isa + *v50), v51);
  }

}

- (void)setProgressColor:(id)a3
{
  unsigned __int8 v5;
  UIColor *v6;
  UIColor *v7;

  v7 = (UIColor *)a3;
  v5 = -[UIColor isEqual:](v7, "isEqual:", self->_progressColor);
  v6 = v7;
  if ((v5 & 1) == 0 && self->_progressColor != v7)
  {
    objc_storeStrong((id *)&self->_progressColor, a3);
    -[IMRadialProgressButton _updateCenterImage](self, "_updateCenterImage");
    v6 = v7;
  }

}

- (void)setTintColor:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  objc_super v9;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[IMRadialProgressButton tintColor](self, "tintColor"));
  if ((id)v5 == v4)
  {

  }
  else
  {
    v6 = (void *)v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[IMRadialProgressButton tintColor](self, "tintColor"));
    v8 = objc_msgSend(v4, "isEqual:", v7);

    if ((v8 & 1) == 0)
    {
      v9.receiver = self;
      v9.super_class = (Class)IMRadialProgressButton;
      -[IMRadialProgressButton setTintColor:](&v9, "setTintColor:", v4);
      -[IMRadialProgressButton _updateCenterImage](self, "_updateCenterImage");
    }
  }

}

- (void)setCenterImageNormal:(id)a3
{
  UIImage *v5;
  UIImage *centerImageNormal;
  unsigned __int8 v7;
  UIImage *v8;

  v5 = (UIImage *)a3;
  centerImageNormal = self->_centerImageNormal;
  if (centerImageNormal != v5)
  {
    v8 = v5;
    v7 = -[UIImage isEqual:](centerImageNormal, "isEqual:", v5);
    v5 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_centerImageNormal, a3);
      -[IMRadialProgressButton _updateCenterImage](self, "_updateCenterImage");
      v5 = v8;
    }
  }

}

- (void)setCenterImageSelected:(id)a3
{
  UIImage *v5;
  UIImage *centerImageSelected;
  unsigned __int8 v7;
  UIImage *v8;

  v5 = (UIImage *)a3;
  centerImageSelected = self->_centerImageSelected;
  if (centerImageSelected != v5)
  {
    v8 = v5;
    v7 = -[UIImage isEqual:](centerImageSelected, "isEqual:", v5);
    v5 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_centerImageSelected, a3);
      -[IMRadialProgressButton _updateCenterImage](self, "_updateCenterImage");
      v5 = v8;
    }
  }

}

- (void)_updateCenterImage
{
  void *v3;
  UIImage *v4;
  UIImage *centerImageSelectedTinted;
  UIImage *v6;
  UIImage *centerImageNormalTinted;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(-[IMRadialProgressButton progressColor](self, "progressColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMRadialProgressButton centerImageSelected](self, "centerImageSelected"));
  v4 = (UIImage *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "imageWithTintColor:", v8));
  centerImageSelectedTinted = self->_centerImageSelectedTinted;
  self->_centerImageSelectedTinted = v4;

  v6 = (UIImage *)objc_claimAutoreleasedReturnValue(-[UIImage imageWithTintColor:](self->_centerImageNormal, "imageWithTintColor:", v8));
  centerImageNormalTinted = self->_centerImageNormalTinted;
  self->_centerImageNormalTinted = v6;

  -[IMRadialProgressButton setNeedsDisplay](self, "setNeedsDisplay");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMRadialProgressButton backgroundImageForState:](self, "backgroundImageForState:", 0, a3.width, a3.height));
  objc_msgSend(v3, "size");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  double top;
  double left;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint v14;
  CGRect v15;

  y = a3.y;
  x = a3.x;
  -[IMRadialProgressButton bounds](self, "bounds", a4);
  top = self->_touchInsets.top;
  left = self->_touchInsets.left;
  v15.origin.x = v9 + left;
  v15.origin.y = v10 + top;
  v15.size.width = v11 - (left + self->_touchInsets.right);
  v15.size.height = v12 - (top + self->_touchInsets.bottom);
  v14.x = x;
  v14.y = y;
  return CGRectContainsPoint(v15, v14);
}

- (void)setProgress:(float)a3
{
  if (self->_progress != a3)
  {
    self->_progress = a3;
    -[IMRadialProgressButton setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (UIColor)progressColor
{
  UIColor *v3;
  uint64_t v4;

  v3 = self->_progressColor;
  if (!self->_progressColor)
  {
    v4 = objc_claimAutoreleasedReturnValue(-[IMRadialProgressButton tintColor](self, "tintColor"));

    v3 = (UIColor *)v4;
  }
  return v3;
}

- (float)progress
{
  return self->_progress;
}

- (UIImage)centerImageNormal
{
  return self->_centerImageNormal;
}

- (UIImage)centerImageNormalTinted
{
  return self->_centerImageNormalTinted;
}

- (void)setCenterImageNormalTinted:(id)a3
{
  objc_storeStrong((id *)&self->_centerImageNormalTinted, a3);
}

- (UIImage)centerImageSelected
{
  return self->_centerImageSelected;
}

- (UIImage)centerImageSelectedTinted
{
  return self->_centerImageSelectedTinted;
}

- (void)setCenterImageSelectedTinted:(id)a3
{
  objc_storeStrong((id *)&self->_centerImageSelectedTinted, a3);
}

- (UIColor)trackColor
{
  return self->_trackColor;
}

- (void)setTrackColor:(id)a3
{
  objc_storeStrong((id *)&self->_trackColor, a3);
}

- (double)trackDiameter
{
  return self->_trackDiameter;
}

- (void)setTrackDiameter:(double)a3
{
  self->_trackDiameter = a3;
}

- (BOOL)inscribeProgress
{
  return self->_inscribeProgress;
}

- (void)setInscribeProgress:(BOOL)a3
{
  self->_inscribeProgress = a3;
}

- (int)progressLineCap
{
  return self->_progressLineCap;
}

- (void)setProgressLineCap:(int)a3
{
  self->_progressLineCap = a3;
}

- (double)progressThickness
{
  return self->_progressThickness;
}

- (void)setProgressThickness:(double)a3
{
  self->_progressThickness = a3;
}

- (double)trackThickness
{
  return self->_trackThickness;
}

- (void)setTrackThickness:(double)a3
{
  self->_trackThickness = a3;
}

- (UIEdgeInsets)touchInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_touchInsets.top;
  left = self->_touchInsets.left;
  bottom = self->_touchInsets.bottom;
  right = self->_touchInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setTouchInsets:(UIEdgeInsets)a3
{
  self->_touchInsets = a3;
}

- (BOOL)showImages
{
  return self->_showImages;
}

- (BOOL)useInnerRect
{
  return self->_useInnerRect;
}

- (void)setUseInnerRect:(BOOL)a3
{
  self->_useInnerRect = a3;
}

- (CGSize)innerRectSize
{
  double width;
  double height;
  CGSize result;

  width = self->_innerRectSize.width;
  height = self->_innerRectSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setInnerRectSize:(CGSize)a3
{
  self->_innerRectSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackColor, 0);
  objc_storeStrong((id *)&self->_centerImageSelectedTinted, 0);
  objc_storeStrong((id *)&self->_centerImageNormalTinted, 0);
  objc_storeStrong((id *)&self->_centerImageSelected, 0);
  objc_storeStrong((id *)&self->_centerImageNormal, 0);
  objc_storeStrong((id *)&self->_progressColor, 0);
}

@end
