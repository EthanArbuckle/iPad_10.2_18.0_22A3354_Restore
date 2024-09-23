@implementation THChapterBrowserScrubbablePageControl

- (THChapterBrowserScrubbablePageControl)initWithFrame:(CGRect)a3
{
  THChapterBrowserScrubbablePageControl *v3;
  THChapterBrowserScrubbablePageControl *v4;
  TSKFidgetResolver *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)THChapterBrowserScrubbablePageControl;
  v3 = -[THChapterBrowserScrubbablePageControl initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_currentPage = 0x7FFFFFFFFFFFFFFFLL;
    v3->_currentPageIndicatorIndex = 0x7FFFFFFFFFFFFFFFLL;
    v5 = (TSKFidgetResolver *)objc_alloc_init((Class)TSKFidgetResolver);
    v4->_fidgetResolver = v5;
    -[TSKFidgetResolver setFidgetThreshold:](v5, "setFidgetThreshold:", 0.02);
    v4->_indicators = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    -[THChapterBrowserScrubbablePageControl setNeedsLayout](v4, "setNeedsLayout");
    -[THChapterBrowserScrubbablePageControl setAutoresizingMask:](v4, "setAutoresizingMask:", 2);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THChapterBrowserScrubbablePageControl;
  -[THChapterBrowserScrubbablePageControl dealloc](&v3, "dealloc");
}

- (void)setNumberOfPages:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;
  unint64_t v8;
  double v9;
  char *v10;
  char *v11;
  id v12;
  NSMutableArray *indicators;
  char *i;
  unint64_t v15;
  CGRect v16;

  if (self->_numberOfPages != a3)
  {
    -[THChapterBrowserScrubbablePageControl bounds](self, "bounds");
    if (CGRectIsEmpty(v16))
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THChapterBrowserScrubbablePageControl setNumberOfPages:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THChapterBrowserScrubbablePageControl.m"), 64, CFSTR("can't limit the number of dots without a valid frame"));
    self->_numberOfPages = a3;
    -[THChapterBrowserScrubbablePageControl bounds](self, "bounds");
    self->_dotWidth = (unint64_t)TSUClamp(v5 / (double)self->_numberOfPages, 15.0, 27.0);
    -[THChapterBrowserScrubbablePageControl bounds](self, "bounds");
    v7 = fmax(v6 / (double)self->_dotWidth, 1.0);
    if ((unint64_t)v7 >= a3)
      v8 = a3;
    else
      v8 = (unint64_t)v7;
    -[THChapterBrowserScrubbablePageControl bounds](self, "bounds");
    self->_leftMargin = (v9 - (double)(v8 * self->_dotWidth)) * 0.5;
    if ((unint64_t)-[NSMutableArray count](self->_indicators, "count") >= v8)
    {
      indicators = self->_indicators;
      if (v8)
      {
        for (i = (char *)-[NSMutableArray count](indicators, "count") - 1; (unint64_t)i >= v8; --i)
        {
          objc_msgSend(-[NSMutableArray objectAtIndex:](self->_indicators, "objectAtIndex:", i), "removeFromSuperlayer");
          -[NSMutableArray removeObjectAtIndex:](self->_indicators, "removeObjectAtIndex:", i);
        }
      }
      else
      {
        -[NSMutableArray makeObjectsPerformSelector:](indicators, "makeObjectsPerformSelector:", "removeFromSuperlayer");
        -[NSMutableArray removeAllObjects](self->_indicators, "removeAllObjects");
      }
    }
    else
    {
      v10 = (char *)-[NSMutableArray count](self->_indicators, "count");
      if ((unint64_t)v10 < v8)
      {
        v11 = v10;
        do
        {
          v12 = -[THChapterBrowserScrubbablePageControl p_layerForPageIndex:](self, "p_layerForPageIndex:", v11);
          objc_msgSend(-[THChapterBrowserScrubbablePageControl layer](self, "layer"), "addSublayer:", v12);
          -[NSMutableArray addObject:](self->_indicators, "addObject:", v12);
          ++v11;
        }
        while ((char *)v8 != v11);
      }
    }
    v15 = a3 - 1;
    if (-[THChapterBrowserScrubbablePageControl currentPage](self, "currentPage") > v15)
      -[THChapterBrowserScrubbablePageControl setCurrentPage:](self, "setCurrentPage:", v15);
    -[THChapterBrowserScrubbablePageControl setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setCurrentPage:(unint64_t)a3
{
  -[THChapterBrowserScrubbablePageControl p_setCurrentPage:](self, "p_setCurrentPage:", a3);
  -[THChapterBrowserScrubbablePageControl p_selectDotClosestToPageIndex:animated:](self, "p_selectDotClosestToPageIndex:animated:", -[THChapterBrowserScrubbablePageControl currentPage](self, "currentPage"), 0);
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  unint64_t dotWidth;
  unint64_t numberOfPages;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  dotWidth = self->_dotWidth;
  numberOfPages = (unint64_t)fmax(a3.size.width / (double)dotWidth, 1.0);
  if (self->_numberOfPages < numberOfPages)
    numberOfPages = self->_numberOfPages;
  self->_leftMargin = (a3.size.width - (double)(numberOfPages * dotWidth)) * 0.5;
  self->_numberOfPages = 0;
  -[THChapterBrowserScrubbablePageControl setNumberOfPages:](self, "setNumberOfPages:");
  v10.receiver = self;
  v10.super_class = (Class)THChapterBrowserScrubbablePageControl;
  -[THChapterBrowserScrubbablePageControl setFrame:](&v10, "setFrame:", x, y, width, height);
}

- (void)layoutSubviews
{
  id v3;
  unint64_t v4;
  double leftMargin;
  unint64_t dotWidth;
  NSMutableArray *indicators;
  id v8;
  id v9;
  double v10;
  uint64_t v11;
  void *i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  v3 = -[NSMutableArray count](self->_indicators, "count");
  if (v3)
  {
    v4 = (unint64_t)v3;
    leftMargin = self->_leftMargin;
    dotWidth = self->_dotWidth;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    indicators = self->_indicators;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](indicators, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = leftMargin + (double)dotWidth * 0.5;
      v11 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(indicators);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), "setPosition:", round(v10), 24.0);
          v10 = v10 + (double)self->_dotWidth;
        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](indicators, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }
    if (self->_currentPageIndicatorIndex < v4)
    {
      -[THChapterBrowserScrubbablePageControl p_indicatorCenterAtIndex:](self, "p_indicatorCenterAtIndex:");
      -[CALayer setPosition:](self->_currentPageIndicator, "setPosition:");
    }
  }
  +[CATransaction commit](CATransaction, "commit");
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  _BOOL4 v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)THChapterBrowserScrubbablePageControl;
  v6 = -[THChapterBrowserScrubbablePageControl beginTrackingWithTouch:withEvent:](&v8, "beginTrackingWithTouch:withEvent:", a3, a4);
  if (v6)
    self->_startingPage = -[THChapterBrowserScrubbablePageControl currentPage](self, "currentPage");
  -[THChapterBrowserScrubbablePageControl p_updateWithTouch:animated:lastTouch:](self, "p_updateWithTouch:animated:lastTouch:", a3, 1, 0);
  return v6;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  self->_dragging = 1;
  -[THChapterBrowserScrubbablePageControl p_updateWithTouch:animated:lastTouch:](self, "p_updateWithTouch:animated:lastTouch:", a3, 0, 0);
  return 1;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  -[THChapterBrowserScrubbablePageControl p_updateWithTouch:animated:lastTouch:](self, "p_updateWithTouch:animated:lastTouch:", a3, self->_dragging, 1);
  self->_dragging = 0;
}

- (void)cancelTrackingWithEvent:(id)a3
{
  if (-[THChapterBrowserScrubbablePageControl currentPage](self, "currentPage", a3) != self->_startingPage)
    -[THChapterBrowserScrubbablePageControl sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
  -[THChapterBrowserScrubbablePageControl sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 128);
}

- (id)p_layerForSelectingPage
{
  CALayer *v2;

  v2 = +[CALayer layer](CALayer, "layer");
  -[CALayer setBounds:](v2, "setBounds:", 0.0, 0.0, 22.0, 22.0);
  -[CALayer setBorderColor:](v2, "setBorderColor:", -[UIColor CGColor](+[UIColor whiteColor](UIColor, "whiteColor"), "CGColor"));
  -[CALayer setBorderWidth:](v2, "setBorderWidth:", 1.0);
  -[CALayer setBackgroundColor:](v2, "setBackgroundColor:", -[UIColor CGColor](+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.3), "CGColor"));
  -[CALayer setCornerRadius:](v2, "setCornerRadius:", 11.0);
  return v2;
}

- (id)p_layerForPageIndex:(unint64_t)a3
{
  double v3;
  CALayer *v5;
  UIBezierPath *v6;
  double y;
  CGAffineTransform v9;

  v3 = 6.0;
  if (a3
    || (!-[THChapterBrowserScrubbablePageControl firstDotSpecialRendering](self, "firstDotSpecialRendering")
      ? (v3 = 6.0)
      : (v3 = 7.0),
        !-[THChapterBrowserScrubbablePageControl firstDotSpecialRendering](self, "firstDotSpecialRendering")))
  {
    v5 = +[CALayer layer](CALayer, "layer");
    -[CALayer setBounds:](v5, "setBounds:", 0.0, 0.0, 6.0, v3);
    -[CALayer setCornerRadius:](v5, "setCornerRadius:", 3.0);
    -[CALayer setBackgroundColor:](v5, "setBackgroundColor:", -[UIColor CGColor](+[UIColor whiteColor](UIColor, "whiteColor"), "CGColor"));
  }
  else
  {
    v5 = (CALayer *)+[CAShapeLayer layer](CAShapeLayer, "layer");
    -[CALayer setBounds:](v5, "setBounds:", 0.0, 0.0, 6.0, v3);
    -[CALayer setFillColor:](v5, "setFillColor:", -[UIColor CGColor](+[UIColor whiteColor](UIColor, "whiteColor"), "CGColor"));
    v6 = +[UIBezierPath bezierPath](UIBezierPath, "bezierPath");
    y = CGPointZero.y;
    -[UIBezierPath moveToPoint:](v6, "moveToPoint:", CGPointZero.x, y);
    -[UIBezierPath addLineToPoint:](v6, "addLineToPoint:", 0.0, v3);
    -[UIBezierPath addLineToPoint:](v6, "addLineToPoint:", 6.0, v3 * 0.5);
    -[UIBezierPath addLineToPoint:](v6, "addLineToPoint:", CGPointZero.x, y);
    CGAffineTransformMakeTranslation(&v9, 1.0, 0.0);
    -[UIBezierPath applyTransform:](v6, "applyTransform:", &v9);
    -[CALayer setPath:](v5, "setPath:", -[UIBezierPath CGPath](v6, "CGPath"));
  }
  return v5;
}

- (void)p_setCurrentPage:(unint64_t)a3
{
  unint64_t numberOfPages;
  unint64_t v4;

  numberOfPages = self->_numberOfPages;
  if (numberOfPages <= a3)
    v4 = numberOfPages - 1;
  else
    v4 = a3;
  self->_currentPage = v4;
}

- (void)_selectDotAtIndex:(unint64_t)a3 animated:(BOOL)a4
{
  if ((unint64_t)-[NSMutableArray count](self->_indicators, "count") > a3)
  {
    if (!self->_currentPageIndicator)
    {
      self->_currentPageIndicator = (CALayer *)-[THChapterBrowserScrubbablePageControl p_layerForSelectingPage](self, "p_layerForSelectingPage");
      objc_msgSend(-[THChapterBrowserScrubbablePageControl layer](self, "layer"), "addSublayer:", self->_currentPageIndicator);
    }
    self->_currentPageIndicatorIndex = a3;
    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setAnimationDuration:](CATransaction, "setAnimationDuration:", 0.15);
    if (!a4)
      +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
    -[THChapterBrowserScrubbablePageControl p_indicatorCenterAtIndex:](self, "p_indicatorCenterAtIndex:", self->_currentPageIndicatorIndex);
    -[CALayer setPosition:](self->_currentPageIndicator, "setPosition:");
    +[CATransaction commit](CATransaction, "commit");
  }
}

- (void)p_selectDotClosestToPageIndex:(int64_t)a3 animated:(BOOL)a4
{
  -[THChapterBrowserScrubbablePageControl _selectDotAtIndex:animated:](self, "_selectDotAtIndex:animated:", vcvtas_u32_f32((float)((float)(unint64_t)-[NSMutableArray count](self->_indicators, "count") / (float)self->_numberOfPages)* (float)a3), a4);
}

- (CGPoint)p_indicatorCenterAtIndex:(unint64_t)a3
{
  double x;
  double y;
  CGPoint result;

  if ((unint64_t)-[NSMutableArray count](self->_indicators, "count") <= a3)
  {
    x = CGPointZero.x;
    y = CGPointZero.y;
  }
  else
  {
    objc_msgSend(-[NSMutableArray objectAtIndex:](self->_indicators, "objectAtIndex:", a3), "position");
  }
  result.y = y;
  result.x = x;
  return result;
}

- (void)p_updateWithTouch:(id)a3 animated:(BOOL)a4 lastTouch:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  id v8;

  v5 = a5;
  v6 = a4;
  objc_msgSend(a3, "locationInView:", self);
  v8 = -[THChapterBrowserScrubbablePageControl p_pageIndexForPoint:](self, "p_pageIndexForPoint:");
  -[TSKFidgetResolver pushValue:](-[THChapterBrowserScrubbablePageControl fidgetResolver](self, "fidgetResolver"), "pushValue:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v8));
  if (v5)
    v8 = objc_msgSend(-[TSKFidgetResolver nonFidgetValue](-[THChapterBrowserScrubbablePageControl fidgetResolver](self, "fidgetResolver"), "nonFidgetValue"), "unsignedIntegerValue");
  -[THChapterBrowserScrubbablePageControl p_updateWithNewPageIndex:animated:](self, "p_updateWithNewPageIndex:animated:", v8, v6);
}

- (void)p_updateWithNewPageIndex:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;

  if (self->_currentPage != a3)
  {
    v4 = a4;
    -[THChapterBrowserScrubbablePageControl p_setCurrentPage:](self, "p_setCurrentPage:");
    -[THChapterBrowserScrubbablePageControl p_selectDotClosestToPageIndex:animated:](self, "p_selectDotClosestToPageIndex:animated:", -[THChapterBrowserScrubbablePageControl currentPage](self, "currentPage"), v4);
    -[THChapterBrowserScrubbablePageControl sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
  }
}

- (unint64_t)p_pageIndexForPoint:(CGPoint)a3
{
  double x;
  double v5;
  double v6;
  unint64_t v7;

  x = a3.x;
  -[THChapterBrowserScrubbablePageControl bounds](self, "bounds", a3.x, a3.y);
  v6 = v5 + self->_leftMargin * -2.0;
  v7 = (uint64_t)((x - self->_leftMargin)
               / (v6
                / (double)-[THChapterBrowserScrubbablePageControl numberOfPages](self, "numberOfPages")));
  if ((v7 & 0x8000000000000000) != 0)
    return 0;
  if (-[THChapterBrowserScrubbablePageControl numberOfPages](self, "numberOfPages") <= v7)
    return -[THChapterBrowserScrubbablePageControl numberOfPages](self, "numberOfPages") - 1;
  return v7;
}

- (TSKFidgetResolver)fidgetResolver
{
  return self->_fidgetResolver;
}

- (void)setFidgetResolver:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (unint64_t)numberOfPages
{
  return self->_numberOfPages;
}

- (unint64_t)currentPage
{
  return self->_currentPage;
}

- (BOOL)isDragging
{
  return self->_dragging;
}

- (void)setDragging:(BOOL)a3
{
  self->_dragging = a3;
}

- (BOOL)firstDotSpecialRendering
{
  return self->_firstDotSpecialRendering;
}

- (void)setFirstDotSpecialRendering:(BOOL)a3
{
  self->_firstDotSpecialRendering = a3;
}

@end
