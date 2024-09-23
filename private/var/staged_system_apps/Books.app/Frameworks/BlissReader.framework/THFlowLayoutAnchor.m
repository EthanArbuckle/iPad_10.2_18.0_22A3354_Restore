@implementation THFlowLayoutAnchor

- (THFlowLayoutAnchor)initWithPageController:(id)a3 absoluteOffset:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  THFlowLayoutAnchor *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  __n128 v12;
  __n128 v13;
  double v14;
  double v15;
  double v16;
  id v17;
  double v18;
  double v19;
  double v20;
  objc_super v23;

  y = a4.y;
  x = a4.x;
  v23.receiver = self;
  v23.super_class = (Class)THFlowLayoutAnchor;
  v7 = -[THFlowLayoutAnchor init](&v23, "init");
  if (v7)
  {
    v7->_pageController = (THFlowPageController *)a3;
    v7->_originalAbsoluteOffset.x = x;
    v7->_originalAbsoluteOffset.y = y;
    objc_msgSend(a3, "i_rectForSectionLayout");
    v9 = v8;
    v11 = v10;
    v12.n128_f64[0] = x;
    v13.n128_f64[0] = y;
    v14 = TSDSubtractPoints(v12, v13, v9, v11);
    v16 = v15;
    v17 = objc_msgSend(a3, "bodyIndexClosestToPoint:", v14);
    v7->_bodyIndex = (unint64_t)v17;
    objc_msgSend(a3, "bodyTopAtIndex:", v17);
    v7->_offsetFromBodyTop = v16 - v18;
    -[THFlowLayoutAnchor deltaFromOriginalOffset](v7, "deltaFromOriginalOffset");
    if (v20 != CGPointZero.x || v19 != CGPointZero.y)
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowLayoutAnchor initWithPageController:absoluteOffset:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowLayoutAnchor.mm"), 41, CFSTR("offset shouldn't have changed already"));
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THFlowLayoutAnchor;
  -[THFlowLayoutAnchor dealloc](&v3, "dealloc");
}

- (CGPoint)deltaFromOriginalOffset
{
  unint64_t v3;
  unint64_t v4;
  double v5;
  double v6;
  double v7;
  __n128 v8;
  __n128 v9;
  double v10;
  double v11;
  CGPoint result;

  -[THFlowPageController i_rectForSectionLayout](self->_pageController, "i_rectForSectionLayout");
  v4 = v3;
  v6 = v5;
  -[THFlowPageController bodyTopAtIndex:](self->_pageController, "bodyTopAtIndex:", self->_bodyIndex);
  v8.n128_f64[0] = v6 + v7 + self->_offsetFromBodyTop;
  v9.n128_u64[0] = v4;
  v10 = TSDSubtractPoints(v9, v8, self->_originalAbsoluteOffset.x, self->_originalAbsoluteOffset.y);
  result.y = v11;
  result.x = v10;
  return result;
}

- (THFlowPageController)pageController
{
  return self->_pageController;
}

- (unint64_t)bodyIndex
{
  return self->_bodyIndex;
}

- (double)offsetFromBodyTop
{
  return self->_offsetFromBodyTop;
}

- (CGPoint)originalAbsoluteOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_originalAbsoluteOffset.x;
  y = self->_originalAbsoluteOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setOriginalAbsoluteOffset:(CGPoint)a3
{
  self->_originalAbsoluteOffset = a3;
}

@end
