@implementation THInteractiveScrollLayer

- (THInteractiveScrollLayer)init
{
  THInteractiveScrollLayer *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THInteractiveScrollLayer;
  v2 = -[THInteractiveScrollLayer init](&v4, "init");
  if (v2)
  {
    v2->_scrollLayer = (CAScrollLayer *)objc_alloc_init((Class)TSDNoDefaultImplicitActionScrollLayer);
    v2->_topFadeLayer = (CALayer *)objc_alloc_init((Class)TSDNoDefaultImplicitActionLayer);
    v2->_bottomFadeLayer = (CALayer *)objc_alloc_init((Class)TSDNoDefaultImplicitActionLayer);
    -[THInteractiveScrollLayer addSublayer:](v2, "addSublayer:", v2->_scrollLayer);
    -[THInteractiveScrollLayer addSublayer:](v2, "addSublayer:", v2->_topFadeLayer);
    -[THInteractiveScrollLayer addSublayer:](v2, "addSublayer:", v2->_bottomFadeLayer);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THInteractiveScrollLayer;
  -[THInteractiveScrollLayer dealloc](&v3, "dealloc");
}

- (void)setContentLayer:(id)a3
{
  CALayer *contentLayer;

  contentLayer = self->_contentLayer;
  if (contentLayer != a3)
  {
    -[CALayer removeFromSuperlayer](contentLayer, "removeFromSuperlayer");

    self->_contentLayer = (CALayer *)a3;
    -[CAScrollLayer setContentOffset:](self->_scrollLayer, "setContentOffset:", CGPointZero.x, CGPointZero.y);
    -[CAScrollLayer addSublayer:](self->_scrollLayer, "addSublayer:", self->_contentLayer);
  }
}

- (void)setTopFadeImage:(id)a3
{
  TSUImage *topFadeImage;

  topFadeImage = self->_topFadeImage;
  if (topFadeImage != a3)
  {

    self->_topFadeImage = (TSUImage *)a3;
    -[THInteractiveScrollLayer setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setBottomFadeImage:(id)a3
{
  TSUImage *bottomFadeImage;

  bottomFadeImage = self->_bottomFadeImage;
  if (bottomFadeImage != a3)
  {

    self->_bottomFadeImage = (TSUImage *)a3;
    -[THInteractiveScrollLayer setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setShowFadeImages:(BOOL)a3
{
  if (self->_showFadeImages != a3)
  {
    self->_showFadeImages = a3;
    -[THInteractiveScrollLayer setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setTopContentPadding:(double)a3
{
  if (self->_topContentPadding != a3)
  {
    self->_topContentPadding = a3;
    -[THInteractiveScrollLayer setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setBottomContentPadding:(double)a3
{
  if (self->_bottomContentPadding != a3)
  {
    self->_bottomContentPadding = a3;
    -[THInteractiveScrollLayer setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)canScroll
{
  double v3;
  double v4;
  double v6;
  double v7;
  CGRect v8;
  CGRect v9;

  -[THInteractiveScrollLayer layoutIfNeeded](self, "layoutIfNeeded");
  -[THInteractiveScrollLayer contentSize](self, "contentSize");
  v4 = v3;
  -[CAScrollLayer bounds](self->_scrollLayer, "bounds");
  if (v4 > CGRectGetWidth(v8))
    return 1;
  -[THInteractiveScrollLayer contentSize](self, "contentSize");
  v7 = v6;
  -[CAScrollLayer bounds](self->_scrollLayer, "bounds");
  return v7 > CGRectGetHeight(v9);
}

- (void)setBackgroundColor:(CGColor *)a3
{
  -[CAScrollLayer setBackgroundColor:](self->_scrollLayer, "setBackgroundColor:", a3);
}

- (void)layoutSublayers
{
  double topContentPadding;
  id v4;
  double v5;
  double v6;
  double Width;
  double v8;
  double MaxY;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  v14.receiver = self;
  v14.super_class = (Class)THInteractiveScrollLayer;
  -[THInteractiveScrollLayer layoutSublayers](&v14, "layoutSublayers");
  -[THInteractiveScrollLayer bounds](self, "bounds");
  -[CAScrollLayer setFrame:](self->_scrollLayer, "setFrame:");
  topContentPadding = self->_topContentPadding;
  v4 = -[CALayer bounds](self->_contentLayer, "bounds");
  -[CALayer setFrame:](self->_contentLayer, "setFrame:", TSDRectWithOriginAndSize(v4, 0.0, topContentPadding, v5, v6));
  -[CALayer setContents:](self->_topFadeLayer, "setContents:", -[TSUImage CGImage](self->_topFadeImage, "CGImage"));
  -[THInteractiveScrollLayer bounds](self, "bounds");
  Width = CGRectGetWidth(v15);
  -[TSUImage size](self->_topFadeImage, "size");
  -[CALayer setFrame:](self->_topFadeLayer, "setFrame:", 0.0, 0.0, Width, v8);
  -[CALayer setHidden:](self->_topFadeLayer, "setHidden:", !self->_showFadeImages);
  -[CALayer setContents:](self->_bottomFadeLayer, "setContents:", -[TSUImage CGImage](self->_bottomFadeImage, "CGImage"));
  -[THInteractiveScrollLayer bounds](self, "bounds");
  MaxY = CGRectGetMaxY(v16);
  -[TSUImage size](self->_bottomFadeImage, "size");
  v11 = MaxY - v10;
  -[THInteractiveScrollLayer bounds](self, "bounds");
  v12 = CGRectGetWidth(v17);
  -[TSUImage size](self->_bottomFadeImage, "size");
  -[CALayer setFrame:](self->_bottomFadeLayer, "setFrame:", 0.0, v11, v12, v13);
  -[CALayer setHidden:](self->_bottomFadeLayer, "setHidden:", !self->_showFadeImages);
}

- (id)swapIntoView:(id)a3
{
  id v5;
  id v6;
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void (**v18)(id, id);

  if (-[THInteractiveScrollLayer needsLayout](self, "needsLayout"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THInteractiveScrollLayer swapIntoView:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THInteractiveScrollLayer.m"), 281, CFSTR("layer must be laid out before swapping into a view"));
  v5 = objc_alloc((Class)UIView);
  -[THInteractiveScrollLayer frame](self, "frame");
  v6 = objc_msgSend(v5, "initWithFrame:");
  v7 = objc_alloc((Class)UIScrollView);
  -[CAScrollLayer frame](self->_scrollLayer, "frame");
  v8 = objc_msgSend(v7, "initWithFrame:");
  -[THInteractiveScrollLayer contentSize](self, "contentSize");
  objc_msgSend(v8, "setContentSize:");
  -[TSUImage size](self->_topFadeImage, "size");
  v10 = v9;
  -[TSUImage size](self->_bottomFadeImage, "size");
  objc_msgSend(v8, "setScrollIndicatorInsets:", v10, 0.0, v11, 0.0);
  objc_msgSend(objc_msgSend(v8, "layer"), "setBackgroundColor:", -[CAScrollLayer backgroundColor](self->_scrollLayer, "backgroundColor"));
  objc_msgSend(v6, "addSubview:", v8);
  v12 = objc_alloc((Class)UIView);
  -[CALayer bounds](self->_contentLayer, "bounds");
  v13 = objc_msgSend(v12, "initWithFrame:");
  objc_msgSend(objc_msgSend(v13, "layer"), "setSublayers:", +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", self->_contentLayer));
  objc_msgSend(v8, "addSubview:", v13);
  if (self->_showFadeImages)
  {
    v14 = objc_alloc((Class)UIImageView);
    -[CALayer frame](self->_topFadeLayer, "frame");
    v15 = objc_msgSend(v14, "initWithFrame:");
    objc_msgSend(v15, "setImage:", -[TSUImage UIImage](self->_topFadeImage, "UIImage"));
    objc_msgSend(v6, "addSubview:", v15);
    v16 = objc_alloc((Class)UIImageView);
    -[CALayer frame](self->_bottomFadeLayer, "frame");
    v17 = objc_msgSend(v16, "initWithFrame:");
    objc_msgSend(v17, "setImage:", -[TSUImage UIImage](self->_bottomFadeImage, "UIImage"));
    objc_msgSend(v6, "addSubview:", v17);

  }
  -[CAScrollLayer contentOffset](self->_scrollLayer, "contentOffset");
  objc_msgSend(v8, "setContentOffset:");
  objc_setAssociatedObject(v6, &off_42B078, v8, (char *)&dword_0 + 1);

  if (a3)
  {
    v18 = (void (**)(id, id))objc_msgSend(a3, "objectForKey:", CFSTR("scrollViewBlock"));
    if (v18)
      v18[2](v18, v8);
  }
  return v6;
}

- (void)swapOutOfView:(id)a3
{
  uint64_t v5;
  id AssociatedObject;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CAScrollLayer *scrollLayer;
  double v17;

  -[CAScrollLayer addSublayer:](self->_scrollLayer, "addSublayer:", self->_contentLayer);
  v5 = objc_opt_class(UIScrollView);
  AssociatedObject = objc_getAssociatedObject(a3, &off_42B078);
  *(_QWORD *)&v7 = TSUDynamicCast(v5, AssociatedObject).n128_u64[0];
  v9 = v8;
  if (!v8)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", v7), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THInteractiveScrollLayer swapOutOfView:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THInteractiveScrollLayer.m"), 341, CFSTR("invalid nil value for '%s'"), "scrollView");
  objc_msgSend(v9, "contentOffset", v7);
  -[CAScrollLayer setContentOffset:](self->_scrollLayer, "setContentOffset:");
  -[THInteractiveScrollLayer contentSize](self, "contentSize");
  v11 = v10;
  -[CAScrollLayer bounds](self->_scrollLayer, "bounds");
  v13 = v12;
  -[CAScrollLayer contentOffset](self->_scrollLayer, "contentOffset");
  v15 = v14;
  scrollLayer = self->_scrollLayer;
  -[CAScrollLayer contentOffset](scrollLayer, "contentOffset");
  if (v15 >= 0.0)
  {
    if (v17 <= v11 - v13)
      return;
    scrollLayer = self->_scrollLayer;
    -[CAScrollLayer contentOffset](scrollLayer, "contentOffset");
  }
  -[CAScrollLayer setContentOffset:animated:](scrollLayer, "setContentOffset:animated:", 1);
}

- (CGSize)contentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  -[CALayer bounds](self->_contentLayer, "bounds");
  v4 = v3;
  v6 = v5 + self->_topContentPadding + self->_bottomContentPadding;
  result.height = v6;
  result.width = v4;
  return result;
}

- (CALayer)contentLayer
{
  return self->_contentLayer;
}

- (TSUImage)topFadeImage
{
  return self->_topFadeImage;
}

- (TSUImage)bottomFadeImage
{
  return self->_bottomFadeImage;
}

- (BOOL)showFadeImages
{
  return self->_showFadeImages;
}

- (double)topContentPadding
{
  return self->_topContentPadding;
}

- (double)bottomContentPadding
{
  return self->_bottomContentPadding;
}

@end
