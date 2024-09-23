@implementation UIPDFMagnifierController

- (UIPDFMagnifierController)init
{
  UIPDFMagnifierController *v2;
  CGColorSpace *DeviceRGB;
  objc_super v5;
  CGFloat components[2];
  __int128 v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)UIPDFMagnifierController;
  v2 = -[UIPDFMagnifierController init](&v5, sel_init);
  if (v2)
  {
    v2->_textEffectsWindow = (UIWindow *)+[UITextEffectsWindow sharedTextEffectsWindowAboveStatusBar](UITextEffectsWindow, "sharedTextEffectsWindowAboveStatusBar");
    v2->_magnifierSize = (CGSize)xmmword_1866830C0;
    *(_OWORD *)components = xmmword_186683178;
    v7 = unk_186683188;
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v2->_grabberColor = CGColorCreate(DeviceRGB, components);
    CGColorSpaceRelease(DeviceRGB);
    v2->_visible = 0;
  }
  return v2;
}

- (void)dealloc
{
  UIView *textEffectsSubView;
  objc_super v4;

  CGColorRelease(self->_grabberColor);
  -[UIPDFMagnifierController tearDownLayers](self, "tearDownLayers");
  textEffectsSubView = self->_textEffectsSubView;
  if (textEffectsSubView)
  {
    -[UIView removeFromSuperview](textEffectsSubView, "removeFromSuperview");

  }
  v4.receiver = self;
  v4.super_class = (Class)UIPDFMagnifierController;
  -[UIPDFMagnifierController dealloc](&v4, sel_dealloc);
}

- (void)setPosition:(CGPoint)a3 viewPoint:(CGPoint)a4
{
  self->_touchPoint = a4;
  self->_pointToMagnify = a3;
}

- (void)_show
{
  UIView *v3;
  UIView *v4;

  if (!self->_textEffectsSubView)
  {
    v3 = [UIView alloc];
    -[UIView bounds](self->_textEffectsWindow, "bounds");
    v4 = -[UIView initWithFrame:](v3, "initWithFrame:");
    self->_textEffectsSubView = v4;
    -[UIView addSubview:](self->_textEffectsWindow, "addSubview:", v4);
  }
  -[UIPDFMagnifierController placeImage](self, "placeImage");
  -[UIPDFMagnifierController setImageContainerMask](self, "setImageContainerMask");
  self->_visible = 1;
}

- (void)showLoupe
{
  self->_loupe = 1;
  -[UIPDFMagnifierController _show](self, "_show");
}

- (void)showMagnifier
{
  self->_loupe = 0;
  -[UIPDFMagnifierController _show](self, "_show");
}

- (void)move
{
  if (self->_loupe)
  {
    -[UIPDFMagnifierController setImageContainerPositionLoupe](self, "setImageContainerPositionLoupe");
  }
  else
  {
    -[UIPDFMagnifierController setImageContainerPositionMagnifier](self, "setImageContainerPositionMagnifier");
    -[UIPDFMagnifierController setTextRangeHandlePositions](self, "setTextRangeHandlePositions");
  }
  -[UIPDFMagnifierController setSelectionPath](self, "setSelectionPath");
  -[UIPDFMagnifierController setLayerPositions](self, "setLayerPositions");
}

- (void)hide
{
  UIView *textEffectsSubView;

  -[UIPDFMagnifierController tearDownLayers](self, "tearDownLayers");
  textEffectsSubView = self->_textEffectsSubView;
  if (textEffectsSubView)
  {
    -[UIView removeFromSuperview](textEffectsSubView, "removeFromSuperview");

    self->_textEffectsSubView = 0;
  }
  self->_visible = 0;
}

- (BOOL)visible
{
  return self->_visible;
}

- (UIPDFPageView)pageView
{
  return self->pageView;
}

- (void)setPageView:(id)a3
{
  self->pageView = (UIPDFPageView *)a3;
}

- (void)tearDownLayers
{
  CALayer *imageLayer;
  CAShapeLayer *selectionLayer;
  CALayer *imageContainer;
  CALayer *maskLayer;
  CALayer *loLayer;
  CALayer *hiLayer;
  CALayer *leftBar;
  CALayer *rightBar;
  CALayer *leftGrabber;
  CALayer *rightGrabber;

  imageLayer = self->_imageLayer;
  if (imageLayer)
  {
    -[CALayer removeFromSuperlayer](imageLayer, "removeFromSuperlayer");

    self->_imageLayer = 0;
  }
  selectionLayer = self->_selectionLayer;
  if (selectionLayer)
  {
    -[CAShapeLayer removeFromSuperlayer](selectionLayer, "removeFromSuperlayer");

    self->_selectionLayer = 0;
  }
  imageContainer = self->_imageContainer;
  if (imageContainer)
  {
    -[CALayer removeFromSuperlayer](imageContainer, "removeFromSuperlayer");

    self->_imageContainer = 0;
  }
  maskLayer = self->_maskLayer;
  if (maskLayer)
  {

    self->_maskLayer = 0;
  }
  loLayer = self->_loLayer;
  if (loLayer)
  {
    -[CALayer removeFromSuperlayer](loLayer, "removeFromSuperlayer");

    self->_loLayer = 0;
  }
  hiLayer = self->_hiLayer;
  if (hiLayer)
  {
    -[CALayer removeFromSuperlayer](hiLayer, "removeFromSuperlayer");

    self->_hiLayer = 0;
  }
  leftBar = self->_leftBar;
  if (leftBar)
  {
    -[CALayer removeFromSuperlayer](leftBar, "removeFromSuperlayer");

    self->_leftBar = 0;
  }
  rightBar = self->_rightBar;
  if (rightBar)
  {
    -[CALayer removeFromSuperlayer](rightBar, "removeFromSuperlayer");

    self->_rightBar = 0;
  }
  leftGrabber = self->_leftGrabber;
  if (leftGrabber)
  {
    -[CALayer removeFromSuperlayer](leftGrabber, "removeFromSuperlayer");

    self->_leftGrabber = 0;
  }
  rightGrabber = self->_rightGrabber;
  if (rightGrabber)
  {
    -[CALayer removeFromSuperlayer](rightGrabber, "removeFromSuperlayer");

    self->_rightGrabber = 0;
  }
}

- (void)setPower
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double Width;
  double v12;
  double v13;
  float v14;
  double v15;
  CGRect v16;
  CGRect v17;

  -[UIPDFPageView convertRectFromPDFPageSpace:](-[UIPDFMagnifierController pageView](self, "pageView"), "convertRectFromPDFPageSpace:", 0.0, 0.0, 1.0, 1.0);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIView convertRect:fromView:](self->_textEffectsSubView, "convertRect:fromView:", -[UIPDFMagnifierController pageView](self, "pageView"), v3, v5, v7, v9);
  Width = CGRectGetWidth(v16);
  v17.origin.x = v4;
  v17.origin.y = v6;
  v17.size.width = v8;
  v17.size.height = v10;
  v12 = Width / CGRectGetWidth(v17);
  -[UIView bounds](-[UIPDFMagnifierController pageView](self, "pageView"), "bounds");
  v14 = v13 / 100.0;
  v15 = truncf(v14) * -0.253333333 + 3.36;
  if (v15 < 1.84)
    v15 = 1.84;
  if (v15 > 2.6)
    v15 = 2.6;
  self->_power = v15;
  if (v12 >= v15)
    -[UIPDFMagnifierController hide](self, "hide");
  else
    self->_power = v12 * v15;
}

- (BOOL)isSelectionUniformlyRotated:(double *)a3
{
  UIPDFSelection *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t pageRotation;
  double v9;
  uint64_t i;
  double v11;
  double v12;
  CGAffineTransform v14;
  CGAffineTransform t1;
  CGAffineTransform v16;
  _OWORD v17[2];
  CGAffineTransform v18;

  v5 = -[UIPDFPage selection](-[UIPDFPageView page](-[UIPDFMagnifierController pageView](self, "pageView"), "page"), "selection");
  v6 = -[UIPDFSelection numberOfRectangles](v5, "numberOfRectangles");
  if (!v6)
    return v6;
  v7 = v6;
  memset(&v18, 0, sizeof(v18));
  memset(v17, 0, sizeof(v17));
  -[UIPDFSelection getBounds:transform:index:](v5, "getBounds:transform:index:", v17, &v18, 0);
  pageRotation = self->_pageRotation;
  if (pageRotation)
  {
    v16 = v18;
    CPRotationDegreesFromTransform(&v16.a);
    if (vabdd_f64(v9, (double)pageRotation) >= 1.0)
      goto LABEL_7;
LABEL_6:
    LOBYTE(v6) = 0;
    return v6;
  }
  v16 = v18;
  if (CGAffineTransformIsIdentity(&v16))
    goto LABEL_6;
LABEL_7:
  if (v7 >= 2)
  {
    for (i = 1; i != v7; ++i)
    {
      memset(&v16, 0, sizeof(v16));
      -[UIPDFSelection getBounds:transform:index:](v5, "getBounds:transform:index:", v17, &v16, i);
      pageRotation = self->_pageRotation;
      if (pageRotation)
      {
        t1 = v18;
        CPRotationDegreesFromTransform(&t1.a);
        if (vabdd_f64(v11, (double)pageRotation) < 1.0)
          goto LABEL_6;
      }
      else
      {
        t1 = v18;
        v14 = v16;
        if (!CGAffineTransformEqualToTransform(&t1, &v14))
          goto LABEL_6;
      }
    }
  }
  v16 = v18;
  CPRotationDegreesFromTransform(&v16.a);
  *a3 = (v12 - (double)pageRotation) * -3.14159265 / 180.0;
  LOBYTE(v6) = 1;
  return v6;
}

- (CGPoint)convertViewPointToEnlargedSpace:(CGPoint)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double enlargementScale;
  double v9;
  double v10;
  double v11;
  CGPoint result;
  CGRect v13;

  -[UIPDFPageView convertPointToPDFPageSpace:](-[UIPDFMagnifierController pageView](self, "pageView"), "convertPointToPDFPageSpace:", a3.x, a3.y);
  v5 = v4;
  v7 = v6;
  -[CALayer bounds](self->_imageContainer, "bounds");
  enlargementScale = self->_enlargementScale;
  v9 = v5 * enlargementScale;
  v10 = CGRectGetHeight(v13) - v7 * enlargementScale;
  v11 = v9;
  result.y = v10;
  result.x = v11;
  return result;
}

- (CGPoint)convertPointToRotatedPage:(CGPoint)a3
{
  double y;
  double x;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  unint64_t pageRotation;
  double v15;
  double v16;
  CGPoint result;
  CGRect v18;

  y = a3.y;
  x = a3.x;
  -[UIPDFPage cropBox](-[UIPDFPageView page](-[UIPDFMagnifierController pageView](self, "pageView"), "page"), "cropBox");
  v10 = v6;
  v11 = v7;
  v12 = v8;
  v13 = v9;
  pageRotation = self->_pageRotation;
  if (pageRotation == 270)
  {
    y = CGRectGetHeight(*(CGRect *)&v6) - y;
    v15 = x;
    goto LABEL_9;
  }
  if (pageRotation == 180)
  {
    x = CGRectGetWidth(*(CGRect *)&v6) - x;
    v18.origin.x = v10;
    v18.origin.y = v11;
    v18.size.width = v12;
    v18.size.height = v13;
    v15 = CGRectGetHeight(v18) - y;
LABEL_8:
    y = x;
    goto LABEL_9;
  }
  if (pageRotation != 90)
  {
    v15 = y;
    goto LABEL_8;
  }
  v15 = CGRectGetWidth(*(CGRect *)&v6) - x;
LABEL_9:
  v16 = y;
  result.y = v15;
  result.x = v16;
  return result;
}

- (CGRect)convertRectToRotatedPage:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  double y;
  CGFloat x;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  unint64_t pageRotation;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIPDFPage cropBox](-[UIPDFPageView page](-[UIPDFMagnifierController pageView](self, "pageView"), "page"), "cropBox");
  v12 = v8;
  v13 = v9;
  v14 = v10;
  v15 = v11;
  pageRotation = self->_pageRotation;
  switch(pageRotation)
  {
    case 0x10EuLL:
      v20 = CGRectGetHeight(*(CGRect *)&v8);
      v27.origin.x = x;
      v27.origin.y = y;
      v27.size.width = width;
      v27.size.height = height;
      y = v20 - CGRectGetMaxY(v27);
      v19 = width;
      v18 = x;
      break;
    case 0xB4uLL:
      v24 = CGRectGetWidth(*(CGRect *)&v8);
      v28.origin.x = x;
      v28.origin.y = y;
      v28.size.width = width;
      v28.size.height = height;
      v25 = v24 - CGRectGetMaxX(v28);
      v29.origin.x = v12;
      v29.origin.y = v13;
      v29.size.width = v14;
      v29.size.height = v15;
      v21 = CGRectGetHeight(v29);
      v30.origin.x = x;
      v30.origin.y = y;
      v30.size.width = width;
      v30.size.height = height;
      v18 = v21 - CGRectGetMaxY(v30);
      v19 = height;
      height = width;
      y = v25;
      break;
    case 0x5AuLL:
      v17 = CGRectGetWidth(*(CGRect *)&v8);
      v26.origin.x = x;
      v26.origin.y = y;
      v26.size.width = width;
      v26.size.height = height;
      v18 = v17 - CGRectGetMaxX(v26);
      v19 = width;
      break;
    default:
      v19 = height;
      height = width;
      v18 = y;
      y = x;
      break;
  }
  v22 = y;
  v23 = height;
  result.size.height = v19;
  result.size.width = v23;
  result.origin.y = v18;
  result.origin.x = v22;
  return result;
}

- (CGRect)convertRectToEnlargedSpace:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  CGFloat v24;
  CGAffineTransform v25;
  CGAffineTransform t1;
  CGAffineTransform v27;
  CGAffineTransform v28;
  CGAffineTransform v29;
  CGRect v30;
  CGRect v31;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIPDFPage cropBox](-[UIPDFPageView page](-[UIPDFMagnifierController pageView](self, "pageView"), "page"), "cropBox");
  v9 = x - v8;
  v11 = y - v10;
  if (self->_pageRotation)
  {
    -[UIPDFMagnifierController convertRectToRotatedPage:](self, "convertRectToRotatedPage:", v9, v11, width, height);
    v9 = v12;
    v11 = v13;
    width = v14;
    height = v15;
  }
  -[CALayer bounds](self->_imageContainer, "bounds");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  memset(&v29, 0, sizeof(v29));
  CGAffineTransformMakeScale(&v29, self->_enlargementScale, -self->_enlargementScale);
  memset(&v28, 0, sizeof(v28));
  v30.origin.x = v17;
  v30.origin.y = v19;
  v30.size.width = v21;
  v30.size.height = v23;
  v24 = CGRectGetHeight(v30);
  CGAffineTransformMakeTranslation(&v28, 0.0, v24);
  t1 = v29;
  memset(&v27, 0, sizeof(v27));
  v25 = v28;
  CGAffineTransformConcat(&v27, &t1, &v25);
  t1 = v27;
  v31.origin.x = v9;
  v31.origin.y = v11;
  v31.size.width = width;
  v31.size.height = height;
  return CGRectApplyAffineTransform(v31, &t1);
}

- (CGPoint)convertPointToEnlargedSpace:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  CGFloat Height;
  float64x2_t v21;
  double v22;
  double v23;
  double v24;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v27;
  CGAffineTransform v28;
  CGAffineTransform v29;
  CGPoint result;
  CGRect v31;

  y = a3.y;
  x = a3.x;
  -[UIPDFPage cropBox](-[UIPDFPageView page](-[UIPDFMagnifierController pageView](self, "pageView"), "page"), "cropBox");
  v7 = v6;
  v9 = v8;
  -[CALayer bounds](self->_imageContainer, "bounds");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v18 = x - v7;
  v19 = y - v9;
  if (self->_pageRotation)
    -[UIPDFMagnifierController convertPointToRotatedPage:](self, "convertPointToRotatedPage:", v18, v19);
  v23 = v18;
  v24 = v19;
  memset(&v29, 0, sizeof(v29));
  CGAffineTransformMakeScale(&v29, self->_enlargementScale, -self->_enlargementScale);
  memset(&v28, 0, sizeof(v28));
  v31.origin.x = v11;
  v31.origin.y = v13;
  v31.size.width = v15;
  v31.size.height = v17;
  Height = CGRectGetHeight(v31);
  CGAffineTransformMakeTranslation(&v28, 0.0, Height);
  t1 = v29;
  memset(&v27, 0, sizeof(v27));
  t2 = v28;
  CGAffineTransformConcat(&v27, &t1, &t2);
  v21 = vaddq_f64(*(float64x2_t *)&v27.tx, vaddq_f64(vmulq_n_f64(*(float64x2_t *)&v27.a, v23), vmulq_n_f64(*(float64x2_t *)&v27.c, v24)));
  v22 = v21.f64[1];
  result.x = v21.f64[0];
  result.y = v22;
  return result;
}

- (CGPoint)viewPointInTextEffectsSpace
{
  double v2;
  double v3;
  CGPoint result;

  -[UIView convertPoint:fromView:](self->_textEffectsWindow, "convertPoint:fromView:", -[UIPDFMagnifierController pageView](self, "pageView"), self->_touchPoint.x, self->_touchPoint.y);
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)pointToMagnifyInPDFSpace
{
  double v3;
  double v4;
  UIPDFSelection *v5;
  float64x2_t v6;
  UIPDFSelection *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  float64_t v18;
  float64_t v19;
  float64x2_t v20;
  CGAffineTransform v21;
  CGAffineTransform v22;
  float64x2_t v23;
  float64x2_t v24;
  float64x2_t v25;
  _OWORD v26[2];
  CGPoint result;

  -[UIPDFPageView convertPointToPDFPageSpace:](-[UIPDFMagnifierController pageView](self, "pageView"), "convertPointToPDFPageSpace:", self->_touchPoint.x, self->_pointToMagnify.y);
  v18 = v4;
  v19 = v3;
  v5 = -[UIPDFPage selection](-[UIPDFPageView page](-[UIPDFMagnifierController pageView](self, "pageView"), "page"), "selection");
  v6.f64[0] = v19;
  v6.f64[1] = v18;
  v20 = v6;
  if (v5)
  {
    v7 = v5;
    if (-[UIPDFSelection numberOfRectangles](v5, "numberOfRectangles"))
    {
      memset(v26, 0, sizeof(v26));
      v24 = 0u;
      v25 = 0u;
      v23 = 0u;
      -[UIPDFSelection getBounds:transform:index:](v7, "getBounds:transform:index:", v26, &v23, 0);
      *(float64x2_t *)&v22.a = v23;
      *(float64x2_t *)&v22.c = v24;
      *(float64x2_t *)&v22.tx = v25;
      if (!CGAffineTransformIsIdentity(&v22))
      {
        -[UIPDFPageView convertPointToPDFPageSpace:](-[UIPDFMagnifierController pageView](self, "pageView"), "convertPointToPDFPageSpace:", self->_touchPoint.x, self->_touchPoint.y);
        v9 = v8;
        v11 = v10;
        -[UIPDFPageView convertPointToPDFPageSpace:](-[UIPDFMagnifierController pageView](self, "pageView"), "convertPointToPDFPageSpace:", self->_pointToMagnify.x, self->_pointToMagnify.y);
        v13 = v12;
        v15 = v14;
        *(float64x2_t *)&v21.a = v23;
        *(float64x2_t *)&v21.c = v24;
        *(float64x2_t *)&v21.tx = v25;
        memset(&v22, 0, sizeof(v22));
        CGAffineTransformInvert(&v22, &v21);
        v20 = vaddq_f64(v25, vaddq_f64(vmulq_n_f64(v23, v22.tx + v9 * v22.a + v11 * v22.c), vmulq_n_f64(v24, v22.ty + v13 * v22.b + v15 * v22.d)));
      }
    }
  }
  v17 = v20.f64[1];
  v16 = v20.f64[0];
  result.y = v17;
  result.x = v16;
  return result;
}

- (void)setImageContainerPositionMagnifier
{
  double v3;
  double v4;
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
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double enlargementScale;
  float v22;
  double v23;
  float v24;
  double v25;
  CGRect v26;
  CGRect v27;

  -[UIPDFMagnifierController viewPointInTextEffectsSpace](self, "viewPointInTextEffectsSpace");
  v4 = v3;
  v6 = v5;
  -[UIPDFPage cropBox](-[UIPDFPageView page](-[UIPDFMagnifierController pageView](self, "pageView"), "page"), "cropBox");
  x = v26.origin.x;
  y = v26.origin.y;
  width = v26.size.width;
  height = v26.size.height;
  MidX = CGRectGetMidX(v26);
  v27.origin.x = x;
  v27.origin.y = y;
  v27.size.width = width;
  v27.size.height = height;
  MidY = CGRectGetMidY(v27);
  -[UIPDFMagnifierController pointToMagnifyInPDFSpace](self, "pointToMagnifyInPDFSpace");
  v14 = v13;
  v16 = v15;
  if (self->_pageRotation)
  {
    -[UIPDFMagnifierController convertPointToRotatedPage:](self, "convertPointToRotatedPage:", MidX, MidY);
    MidX = v17;
    MidY = v18;
    -[UIPDFMagnifierController convertPointToRotatedPage:](self, "convertPointToRotatedPage:", v14, v16);
    v14 = v19;
    v16 = v20;
  }
  enlargementScale = self->_enlargementScale;
  v22 = v4 + (MidX - v14) * enlargementScale;
  v23 = roundf(v22);
  v24 = v6 + (v16 - MidY) * enlargementScale + -50.0;
  v25 = roundf(v24);
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  -[CALayer setPosition:](self->_imageContainer, "setPosition:", v23, v25);
}

- (void)setImageContainerPositionLoupe
{
  double v3;
  double v4;
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
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double enlargementScale;
  float v22;
  double v23;
  float v24;
  double v25;
  CGRect v26;
  CGRect v27;

  -[UIPDFMagnifierController viewPointInTextEffectsSpace](self, "viewPointInTextEffectsSpace");
  v4 = v3;
  v6 = v5;
  -[UIPDFPage cropBox](-[UIPDFPageView page](-[UIPDFMagnifierController pageView](self, "pageView"), "page"), "cropBox");
  x = v26.origin.x;
  y = v26.origin.y;
  width = v26.size.width;
  height = v26.size.height;
  MidX = CGRectGetMidX(v26);
  v27.origin.x = x;
  v27.origin.y = y;
  v27.size.width = width;
  v27.size.height = height;
  MidY = CGRectGetMidY(v27);
  -[UIPDFPageView convertPointToPDFPageSpace:](-[UIPDFMagnifierController pageView](self, "pageView"), "convertPointToPDFPageSpace:", self->_touchPoint.x, self->_touchPoint.y);
  v14 = v13;
  v16 = v15;
  if (self->_pageRotation)
  {
    -[UIPDFMagnifierController convertPointToRotatedPage:](self, "convertPointToRotatedPage:", MidX, MidY);
    MidX = v17;
    MidY = v18;
    -[UIPDFMagnifierController convertPointToRotatedPage:](self, "convertPointToRotatedPage:", v14, v16);
    v14 = v19;
    v16 = v20;
  }
  enlargementScale = self->_enlargementScale;
  v22 = v4 + (MidX - v14) * enlargementScale;
  v23 = roundf(v22);
  v24 = v6 + (v16 - MidY) * enlargementScale + -60.0;
  v25 = roundf(v24);
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  -[CALayer setPosition:](self->_imageContainer, "setPosition:", v23, v25);
}

- (void)setLayerPositions
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  float v11;
  double v12;
  double v13;
  float v14;
  float v15;
  float v16;
  double v17;
  float v18;
  double v19;
  CALayer *loLayer;

  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  -[UIView convertPoint:fromView:](self->_textEffectsWindow, "convertPoint:fromView:", -[UIPDFMagnifierController pageView](self, "pageView"), self->_touchPoint.x, self->_touchPoint.y);
  v4 = v3;
  v6 = v5;
  -[CALayer convertPoint:toLayer:](-[UIView layer](self->_textEffectsSubView, "layer"), "convertPoint:toLayer:", self->_imageContainer, v3, v5);
  if (self->_loupe)
    v9 = 60.0;
  else
    v9 = 40.0;
  v10 = v8 - v9;
  v11 = v7;
  v12 = roundf(v11);
  v13 = -4.0;
  if (!self->_loupe)
    v13 = 0.0;
  v14 = v10;
  -[CALayer setPosition:](self->_maskLayer, "setPosition:", v12, v13 + roundf(v14));
  v15 = v4;
  v16 = roundf(v15);
  v17 = v16;
  v18 = v6 - v9;
  v19 = roundf(v18);
  loLayer = self->_loLayer;
  if (loLayer)
    -[CALayer setPosition:](loLayer, "setPosition:", v16, v19);
  -[CALayer setPosition:](self->_hiLayer, "setPosition:", v17, v19);
}

- (void)addBling
{
  double v3;
  double v4;
  const __CFString *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CALayer *v11;

  -[UIScreen scale](+[UIScreen mainScreen](UIScreen, "mainScreen"), "scale");
  v4 = v3;
  if (self->_loupe)
    v5 = CFSTR("kb-loupe-hi.png");
  else
    v5 = CFSTR("RangedMagnifierGlass_Horizontal_Normal.png");
  v6 = +[UIImage kitImageNamed:](UIImage, "kitImageNamed:", v5);
  objc_msgSend(v6, "size");
  v8 = v7;
  objc_msgSend(v6, "size");
  v10 = v9;
  v11 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
  self->_hiLayer = v11;
  -[CALayer setBounds:](v11, "setBounds:", 0.0, 0.0, v8, v10);
  -[CALayer setContents:](self->_hiLayer, "setContents:", objc_msgSend(v6, "CGImage"));
  -[CALayer setContentsScale:](self->_hiLayer, "setContentsScale:", v4);
  -[CALayer insertSublayer:above:](-[UIView layer](self->_textEffectsSubView, "layer"), "insertSublayer:above:", self->_hiLayer, self->_imageContainer);
}

- (void)setSelectionPath:(CGPath *)a3 bounds:(CGRect)a4 transform:(CGAffineTransform *)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double MaxY;
  double MinX;
  double v14;
  double v15;
  CGFloat v16;
  double b;
  double c;
  double d;
  double tx;
  double ty;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  double v42;
  double MinY;
  double MaxX;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  MaxX = CGRectGetMaxX(a4);
  v45.origin.x = x;
  v45.origin.y = y;
  v45.size.width = width;
  v45.size.height = height;
  MinY = CGRectGetMinY(v45);
  v46.origin.x = x;
  v46.origin.y = y;
  v46.size.width = width;
  v46.size.height = height;
  v42 = CGRectGetMaxX(v46);
  v47.origin.x = x;
  v47.origin.y = y;
  v47.size.width = width;
  v47.size.height = height;
  MaxY = CGRectGetMaxY(v47);
  v48.origin.x = x;
  v48.origin.y = y;
  v48.size.width = width;
  v48.size.height = height;
  MinX = CGRectGetMinX(v48);
  v49.origin.x = x;
  v49.origin.y = y;
  v49.size.width = width;
  v49.size.height = height;
  v14 = CGRectGetMaxY(v49);
  v50.origin.x = x;
  v50.origin.y = y;
  v50.size.width = width;
  v50.size.height = height;
  v15 = CGRectGetMinX(v50);
  v51.origin.x = x;
  v51.origin.y = y;
  v51.size.width = width;
  v51.size.height = height;
  v16 = CGRectGetMinY(v51);
  b = a5->b;
  c = a5->c;
  d = a5->d;
  tx = a5->tx;
  ty = a5->ty;
  v22 = tx + v42 * a5->a + MaxY * c;
  v23 = ty + v42 * b + MaxY * d;
  v24 = tx + MinX * a5->a + v14 * c;
  v25 = ty + MinX * b + v14 * d;
  v26 = tx + v15 * a5->a + v16 * c;
  v27 = ty + v15 * b + v16 * d;
  -[UIPDFMagnifierController convertPointToEnlargedSpace:](self, "convertPointToEnlargedSpace:", tx + MaxX * a5->a + MinY * c, ty + MaxX * b + MinY * d);
  v29 = v28;
  v31 = v30;
  -[UIPDFMagnifierController convertPointToEnlargedSpace:](self, "convertPointToEnlargedSpace:", v22, v23);
  v33 = v32;
  v35 = v34;
  -[UIPDFMagnifierController convertPointToEnlargedSpace:](self, "convertPointToEnlargedSpace:", v24, v25);
  v37 = v36;
  v39 = v38;
  -[UIPDFMagnifierController convertPointToEnlargedSpace:](self, "convertPointToEnlargedSpace:", v26, v27);
  CPSetCGPathPoints4(a3, v29, v31, v33, v35, v37, v39, v40, v41);
  CGPathCloseSubpath(a3);
}

- (void)setSelectionPath
{
  UIPDFSelection *v3;
  UIPDFSelection *v4;
  uint64_t v5;
  uint64_t v6;
  CGPath *Mutable;
  uint64_t v8;
  CGAffineTransform v9;
  CGAffineTransform v10;
  __int128 v11;
  __int128 v12;
  CGRect v13;

  v3 = -[UIPDFPage selection](-[UIPDFPageView page](-[UIPDFMagnifierController pageView](self, "pageView"), "page"), "selection");
  if (v3 && (v4 = v3, (v5 = -[UIPDFSelection numberOfRectangles](v3, "numberOfRectangles")) != 0))
  {
    v6 = v5;
    Mutable = CGPathCreateMutable();
    v8 = 0;
    v11 = 0u;
    v12 = 0u;
    memset(&v10, 0, sizeof(v10));
    do
    {
      -[UIPDFSelection getBounds:transform:index:](v4, "getBounds:transform:index:", &v11, &v10, v8);
      v9 = v10;
      if (CGAffineTransformIsIdentity(&v9))
      {
        -[UIPDFMagnifierController convertRectToEnlargedSpace:](self, "convertRectToEnlargedSpace:", v11, v12);
        *(CGFloat *)&v11 = v13.origin.x;
        *((_QWORD *)&v11 + 1) = *(_QWORD *)&v13.origin.y;
        *(CGFloat *)&v12 = v13.size.width;
        *((_QWORD *)&v12 + 1) = *(_QWORD *)&v13.size.height;
        CGPathAddRect(Mutable, 0, v13);
      }
      else
      {
        v9 = v10;
        -[UIPDFMagnifierController setSelectionPath:bounds:transform:](self, "setSelectionPath:bounds:transform:", Mutable, &v9, v11, v12);
      }
      ++v8;
    }
    while (v6 != v8);
    -[CAShapeLayer setPath:](self->_selectionLayer, "setPath:", Mutable);
    CGPathRelease(Mutable);
  }
  else
  {
    -[CAShapeLayer setPath:](self->_selectionLayer, "setPath:", 0);
  }
}

- (void)placeImage
{
  double v3;
  UIPDFPage *v4;
  double enlargementScale;
  double v6;
  float v7;
  double v8;
  double v9;
  double v10;
  unint64_t v11;
  double v12;
  CALayer *v13;
  CGColorSpace *DeviceRGB;
  CGColor *v15;
  double v16;
  double v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[UIPDFMagnifierController setPower](self, "setPower");
  -[UIPDFPageView convertRectFromPDFPageSpace:](-[UIPDFMagnifierController pageView](self, "pageView"), "convertRectFromPDFPageSpace:", 0.0, 0.0, 1.0, 1.0);
  self->_enlargementScale = self->_power * v3;
  v4 = -[UIPDFPageView page](-[UIPDFMagnifierController pageView](self, "pageView"), "page");
  -[UIPDFPage cropBox](v4, "cropBox");
  enlargementScale = self->_enlargementScale;
  v7 = enlargementScale * v6;
  v8 = roundf(v7);
  *(float *)&enlargementScale = enlargementScale * v9;
  v10 = roundf(*(float *)&enlargementScale);
  v11 = -[UIPDFPage rotation](v4, "rotation");
  self->_pageRotation = v11;
  if (v11 == 270 || v11 == 90)
  {
    v12 = v8;
  }
  else
  {
    v12 = v10;
    v10 = v8;
  }
  v13 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
  self->_imageContainer = v13;
  -[CALayer setBounds:](v13, "setBounds:", 0.0, 0.0, v10, v12);
  self->_imageLayer = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
  -[CALayer bounds](self->_imageContainer, "bounds");
  -[CALayer setBounds:](self->_imageLayer, "setBounds:");
  -[CALayer setPosition:](self->_imageLayer, "setPosition:", v10 * 0.5, v12 * 0.5);
  -[CALayer addSublayer:](self->_imageContainer, "addSublayer:", self->_imageLayer);
  self->_selectionLayer = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
  -[CALayer bounds](self->_imageLayer, "bounds");
  -[CAShapeLayer setBounds:](self->_selectionLayer, "setBounds:");
  -[CALayer position](self->_imageLayer, "position");
  -[CAShapeLayer setPosition:](self->_selectionLayer, "setPosition:");
  v18 = xmmword_186683198;
  v19 = unk_1866831A8;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v15 = CGColorCreate(DeviceRGB, (const CGFloat *)&v18);
  -[CAShapeLayer setFillColor:](self->_selectionLayer, "setFillColor:", v15, v18, v19);
  CGColorRelease(v15);
  CGColorSpaceRelease(DeviceRGB);
  -[CALayer addSublayer:](self->_imageContainer, "addSublayer:", self->_selectionLayer);
  if (self->_loupe)
    -[UIPDFMagnifierController setImageContainerPositionLoupe](self, "setImageContainerPositionLoupe");
  else
    -[UIPDFMagnifierController setImageContainerPositionMagnifier](self, "setImageContainerPositionMagnifier");
  -[UIScreen scale](+[UIScreen mainScreen](UIScreen, "mainScreen"), "scale");
  v17 = v16;
  -[CALayer setContentsScale:](self->_imageLayer, "setContentsScale:");
  -[UIPDFPage deliverImageWithWidth:height:receiver:selector:info:](v4, "deliverImageWithWidth:height:receiver:selector:info:", (unint64_t)(v10 * v17), (unint64_t)(v12 * v17), self, sel_imageReceived_data_, self->_imageLayer);
  -[CALayer addSublayer:](-[UIView layer](self->_textEffectsSubView, "layer"), "addSublayer:", self->_imageContainer);
  -[UIPDFMagnifierController addBling](self, "addBling");
  -[UIPDFMagnifierController setSelectionPath](self, "setSelectionPath");
  if (!self->_loupe)
    -[UIPDFMagnifierController addTextRangeHandles](self, "addTextRangeHandles");
}

- (id)imageReceived:(id)a3 data:(id)a4
{
  uint64_t v5;

  if (a3)
  {
    v5 = objc_msgSend(a3, "CGImage");
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    objc_msgSend(a4, "setContents:", v5);
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  }
  else
  {
    -[UIPDFMagnifierController hide](self, "hide", 0, a4);
  }
  return 0;
}

- (void)setImageContainerMask
{
  const __CFString *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  CALayer *v10;
  CATransform3D v11;
  CATransform3D v12;
  CATransform3D v13;
  CATransform3D v14;
  CGFloat v15;

  if (self->_loupe)
    v3 = CFSTR("kb-loupe-mask.png");
  else
    v3 = CFSTR("RangedMagnifierMask_Horizontal_Normal.png");
  v4 = +[UIImage kitImageNamed:](UIImage, "kitImageNamed:", v3);
  objc_msgSend(v4, "size");
  v6 = v5;
  v8 = v7;
  v9 = objc_msgSend(v4, "CGImage");
  v10 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
  self->_maskLayer = v10;
  -[CALayer setBounds:](v10, "setBounds:", 0.0, 0.0, v6, v8);
  -[CALayer setContents:](self->_maskLayer, "setContents:", v9);
  objc_msgSend(v4, "scale");
  -[CALayer setContentsScale:](self->_maskLayer, "setContentsScale:");
  if (!self->_loupe)
  {
    v15 = 0.0;
    if (-[UIPDFMagnifierController isSelectionUniformlyRotated:](self, "isSelectionUniformlyRotated:", &v15))
    {
      memset(&v14, 0, sizeof(v14));
      CATransform3DMakeRotation(&v14, v15, 0.0, 0.0, 1.0);
      v13 = v14;
      -[CALayer setTransform:](self->_maskLayer, "setTransform:", &v13);
      v12 = v14;
      -[CALayer setTransform:](self->_hiLayer, "setTransform:", &v12);
      v11 = v14;
      -[CALayer setTransform:](self->_loLayer, "setTransform:", &v11);
    }
  }
  -[UIPDFMagnifierController setLayerPositions](self, "setLayerPositions");
  -[CALayer setMask:](self->_imageContainer, "setMask:", self->_maskLayer);
}

- (void)setTextRangeHandlePositions
{
  UIPDFSelection *v3;
  uint64_t v4;
  uint64_t v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  double MaxX;
  double MidY;
  double MinX;
  double v13;
  double v14;
  double v15;
  double v16;
  __int128 v17;
  CGFloat y;
  CGSize size;
  float64x2_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  __int128 v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double Height;
  __int128 v34;
  __int128 v35;
  CATransform3D v36;
  CATransform3D v37;
  CATransform3D v38;
  CATransform3D v39;
  float64x2_t v40;
  float64x2_t v41;
  float64x2_t v42;
  float64x2_t v43;
  float64x2_t v44;
  float64x2_t v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;

  v3 = -[UIPDFPage selection](-[UIPDFPageView page](-[UIPDFMagnifierController pageView](self, "pageView"), "page"), "selection");
  v4 = -[UIPDFSelection numberOfRectangles](v3, "numberOfRectangles");
  if (v4)
  {
    v5 = v4;
    memset(&v47, 0, sizeof(v47));
    memset(&v46, 0, sizeof(v46));
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    -[UIPDFSelection getBounds:transform:index:](v3, "getBounds:transform:index:", &v47, &v43, 0);
    -[UIPDFSelection getBounds:transform:index:](v3, "getBounds:transform:index:", &v46, &v40, v5 - 1);
    *(float64x2_t *)&v39.m11 = v40;
    *(float64x2_t *)&v39.m13 = v41;
    *(float64x2_t *)&v39.m21 = v42;
    if (CGAffineTransformIsIdentity((CGAffineTransform *)&v39))
    {
      -[UIPDFMagnifierController convertRectToEnlargedSpace:](self, "convertRectToEnlargedSpace:", *(_OWORD *)&v47.origin, *(_OWORD *)&v47.size);
      v47.origin.x = v6;
      v47.origin.y = v7;
      v47.size.width = v8;
      v47.size.height = v9;
      -[UIPDFMagnifierController convertRectToEnlargedSpace:](self, "convertRectToEnlargedSpace:", *(_OWORD *)&v46.origin, *(_OWORD *)&v46.size);
      v46 = v48;
      MaxX = CGRectGetMaxX(v48);
      MidY = CGRectGetMidY(v46);
      -[CALayer setBounds:](self->_rightBar, "setBounds:", 0.0, 0.0, 2.0, CGRectGetHeight(v46));
      -[CALayer setPosition:](self->_rightBar, "setPosition:", MaxX, MidY);
      MinX = CGRectGetMinX(v47);
      v13 = CGRectGetMidY(v47);
      -[CALayer setBounds:](self->_leftBar, "setBounds:", 0.0, 0.0, 2.0, CGRectGetHeight(v47));
      -[CALayer setPosition:](self->_leftBar, "setPosition:", MinX, v13);
    }
    else
    {
      *(float64x2_t *)&v39.m11 = v40;
      *(float64x2_t *)&v39.m13 = v41;
      *(float64x2_t *)&v39.m21 = v42;
      CPRotationDegreesFromTransform(&v39.m11);
      v15 = (v14 - (double)self->_pageRotation) * 3.14159265;
      memset(&v39, 0, sizeof(v39));
      CATransform3DMakeRotation(&v39, v15 / -180.0, 0.0, 0.0, 1.0);
      v16 = CGRectGetHeight(v46) * self->_enlargementScale;
      *(double *)&v17 = CGRectGetMaxX(v46);
      v35 = v17;
      y = v46.origin.y;
      *(CGFloat *)&v17 = v46.origin.x;
      size = v46.size;
      v20 = vaddq_f64(v42, vaddq_f64(vmulq_n_f64(v40, *(double *)&v35), vmulq_n_f64(v41, CGRectGetMidY(*(CGRect *)&v17))));
      v21 = v20.f64[1];
      if (self->_pageRotation)
        -[UIPDFMagnifierController convertPointToRotatedPage:](self, "convertPointToRotatedPage:", *(_OWORD *)&v20);
      -[UIPDFMagnifierController convertPointToEnlargedSpace:](self, "convertPointToEnlargedSpace:", v20.f64[0], v21, v35);
      v23 = v22;
      v25 = v24;
      -[CALayer setBounds:](self->_rightBar, "setBounds:", 0.0, 0.0, 2.0, v16);
      -[CALayer setPosition:](self->_rightBar, "setPosition:", v23, v25);
      v38 = v39;
      -[CALayer setTransform:](self->_rightBar, "setTransform:", &v38);
      *(float64x2_t *)&v37.m11 = v43;
      *(float64x2_t *)&v37.m13 = v44;
      *(float64x2_t *)&v37.m21 = v45;
      CPRotationDegreesFromTransform(&v37.m11);
      CATransform3DMakeRotation(&v37, (v26 - (double)self->_pageRotation) * 3.14159265 / -180.0, 0.0, 0.0, 1.0);
      v39 = v37;
      v27 = CGRectGetHeight(v47) * self->_enlargementScale;
      *(double *)&v28 = CGRectGetMinX(v47);
      v34 = v28;
      -[UIPDFMagnifierController convertPointToEnlargedSpace:](self, "convertPointToEnlargedSpace:", vaddq_f64(v45, vaddq_f64(vmulq_n_f64(v43, *(double *)&v28), vmulq_n_f64(v44, CGRectGetMidY(v47)))));
      v30 = v29;
      v32 = v31;
      -[CALayer setBounds:](self->_leftBar, "setBounds:", 0.0, 0.0, 2.0, v27);
      -[CALayer setPosition:](self->_leftBar, "setPosition:", v30, v32);
      v36 = v39;
      -[CALayer setTransform:](self->_leftBar, "setTransform:", &v36);
    }
    -[CALayer bounds](self->_rightBar, "bounds", v34);
    Height = CGRectGetHeight(v49);
    -[CALayer bounds](self->_rightGrabber, "bounds");
    -[CALayer setPosition:](self->_rightGrabber, "setPosition:", 0.0, Height + CGRectGetHeight(v50) * 0.5);
    -[CALayer bounds](self->_leftGrabber, "bounds");
    -[CALayer setPosition:](self->_leftGrabber, "setPosition:", 0.0, CGRectGetHeight(v51) * -0.5);
  }
}

- (void)addTextRangeHandles
{
  CALayer *v3;
  CALayer *v4;
  double v5;
  double v6;
  CALayer *v7;
  CALayer *v8;

  v3 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
  self->_leftBar = v3;
  -[CALayer setBackgroundColor:](v3, "setBackgroundColor:", self->_grabberColor);
  -[CALayer addSublayer:](self->_imageContainer, "addSublayer:", self->_leftBar);
  v4 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
  self->_rightBar = v4;
  -[CALayer setBackgroundColor:](v4, "setBackgroundColor:", self->_grabberColor);
  -[CALayer addSublayer:](self->_imageContainer, "addSublayer:", self->_rightBar);
  -[UIScreen scale](+[UIScreen mainScreen](UIScreen, "mainScreen"), "scale");
  v6 = v5 * 14.0;
  v7 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
  self->_rightGrabber = v7;
  -[CALayer setBounds:](v7, "setBounds:", 0.0, 0.0, v6, v6);
  -[CALayer setDelegate:](self->_rightGrabber, "setDelegate:", self);
  -[CALayer addSublayer:](self->_rightBar, "addSublayer:", self->_rightGrabber);
  v8 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
  self->_leftGrabber = v8;
  -[CALayer setBounds:](v8, "setBounds:", 0.0, 0.0, v6, v6);
  -[CALayer setDelegate:](self->_leftGrabber, "setDelegate:", self);
  -[CALayer addSublayer:](self->_leftBar, "addSublayer:", self->_leftGrabber);
  -[UIPDFMagnifierController setTextRangeHandlePositions](self, "setTextRangeHandlePositions");
  -[CALayer setNeedsDisplay](self->_rightGrabber, "setNeedsDisplay");
  -[CALayer setNeedsDisplay](self->_leftGrabber, "setNeedsDisplay");
}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;

  objc_msgSend(a3, "bounds");
  CPCGInsetFillEllipseInRect(a4, self->_grabberColor, v6, v7, v8, v9);
}

@end
