@implementation THWReviewTextAnswerLayout

- (THWReviewTextAnswerLayout)initWithChoice:(id)a3 index:(unint64_t)a4 delegate:(id)a5
{
  THWReviewTextAnswerLayout *v8;
  THWReviewTextAnswerLayout *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)THWReviewTextAnswerLayout;
  v8 = -[THWReviewTextAnswerLayout initWithInfo:](&v11, "initWithInfo:", 0);
  v9 = v8;
  if (v8)
  {
    v8->_index = a4;
    v8->_choice = (THWReviewChoice *)a3;
    v9->_delegate = (THWReviewTextAnswerLayoutDelegate *)a5;
    v9->_styleProvider = -[THWReviewTextAnswerStyleProvider initWithIndex:storage:listLabelStyle:]([THWReviewTextAnswerStyleProvider alloc], "initWithIndex:storage:listLabelStyle:", a4, -[THWReviewChoice contentStorage](v9->_choice, "contentStorage"), -[THWReviewTextAnswerLayoutDelegate reviewTextAnswerLayoutListLabelParagraphStyle:](v9->_delegate, "reviewTextAnswerLayoutListLabelParagraphStyle:", v9));
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWReviewTextAnswerLayout;
  -[THWContainerLayout dealloc](&v3, "dealloc");
}

- (Class)repClassOverride
{
  return (Class)objc_opt_class(THWReviewTextAnswerRep, a2);
}

- (id)childInfosForLayout
{
  id result;

  result = -[THWReviewChoice contentStorage](self->_choice, "contentStorage");
  if (result)
    return +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", result);
  return result;
}

- (id)computeLayoutGeometry
{
  double v3;
  double v4;
  double v5;

  objc_msgSend(-[THWReviewTextAnswerLayout p_wpLayout](self, "p_wpLayout"), "frame");
  v4 = v3;
  -[THWReviewTextAnswerLayout p_maxTextWidth](self, "p_maxTextWidth");
  if (v4 < 6.0)
    v4 = 6.0;
  return objc_msgSend(objc_alloc((Class)TSDLayoutGeometry), "initWithFrame:", 0.0, 0.0, v5, v4);
}

- (unsigned)autosizeFlagsForTextLayout:(id)a3
{
  return 7;
}

- (unsigned)verticalAlignmentForTextLayout:(id)a3
{
  return 0;
}

- (CGRect)nonAutosizedFrameForTextLayout:(id)a3
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = CGRectZero.origin.x;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)autosizedFrameForTextLayout:(id)a3 textSize:(CGSize)a4
{
  double height;
  double width;
  double horizontalOffset;
  double v7;
  CGRect result;

  height = a4.height;
  width = a4.width;
  horizontalOffset = self->_horizontalOffset;
  v7 = 0.0;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = v7;
  result.origin.x = horizontalOffset;
  return result;
}

- (id)dependentsOfTextLayout:(id)a3
{
  return +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", self);
}

- (Class)repClassForTextLayout:(id)a3
{
  return 0;
}

- (id)styleProviderForLayout:(id)a3
{
  return self->_styleProvider;
}

- (BOOL)shouldHyphenateTextLayout:(id)a3
{
  return 1;
}

- (CGSize)adjustedInsets
{
  double width;
  double height;
  CGSize result;

  width = CGSizeZero.width;
  height = CGSizeZero.height;
  result.height = height;
  result.width = width;
  return result;
}

- (TSWPPadding)layoutMargins
{
  return 0;
}

- (unint64_t)columnCount
{
  return 1;
}

- (double)widthForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4
{
  return 0.0;
}

- (double)gapForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4
{
  return 0.0;
}

- (double)positionForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4 outWidth:(double *)a5 outGap:(double *)a6
{
  if (a3)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWReviewTextAnswerLayout positionForColumnIndex:bodyWidth:outWidth:outGap:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Review/THWReviewTextAnswerLayout.m"), 258, CFSTR("unexpected column index"));
  if (a5)
    *a5 = a4;
  if (a6)
    *a6 = 0.0;
  return 0.0;
}

- (BOOL)alwaysStartsNewTarget
{
  return 0;
}

- (BOOL)shrinkTextToFit
{
  return 0;
}

- (BOOL)columnsAreLeftToRight
{
  return 1;
}

- (double)p_maxTextWidth
{
  THWReviewTextAnswerLayoutDelegate *delegate;
  double result;

  delegate = self->_delegate;
  if (!delegate)
    return 100.0;
  -[THWReviewTextAnswerLayoutDelegate reviewTextAnswerLayoutWidth:](delegate, "reviewTextAnswerLayoutWidth:", self);
  return result;
}

- (id)p_wpLayout
{
  id result;
  id v4;
  uint64_t v5;

  result = -[THWReviewChoice contentStorage](self->_choice, "contentStorage");
  if (result)
  {
    v4 = result;
    v5 = objc_opt_class(TSWPLayout);
    TSUDynamicCast(v5, objc_msgSend(-[THWReviewTextAnswerLayout layoutController](self, "layoutController"), "layoutForInfo:childOfLayout:", v4, self));
  }
  return result;
}

- (double)textWidth
{
  double result;

  objc_msgSend(objc_msgSend(-[THWReviewTextAnswerLayout p_wpLayout](self, "p_wpLayout"), "geometry"), "size");
  return result;
}

- (void)setHorizontalOffset:(double)a3
{
  if (self->_horizontalOffset != a3)
  {
    objc_msgSend(-[THWReviewTextAnswerLayout p_wpLayout](self, "p_wpLayout"), "offsetGeometryBy:", a3 - self->_horizontalOffset, 0.0);
    self->_horizontalOffset = a3;
  }
}

- (CGRect)labelFrame
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  id v6;
  void *v7;
  id v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGAffineTransform v21;
  CGRect v22;
  CGRect v23;
  CGRect result;

  x = CGRectNull.origin.x;
  y = CGRectNull.origin.y;
  width = CGRectNull.size.width;
  height = CGRectNull.size.height;
  v6 = -[THWReviewTextAnswerLayout p_wpLayout](self, "p_wpLayout");
  if (v6)
  {
    v7 = v6;
    v8 = objc_msgSend(objc_msgSend(v6, "columns"), "lastObject");
    if (objc_msgSend(v8, "countLines"))
    {
      objc_msgSend(v8, "labelBoundsOfLineFragmentAtIndex:", 0);
      v10 = v9;
      v12 = v11;
      v14 = v13;
      v16 = v15;
      objc_msgSend(v7, "transform");
      v22.origin.x = v10;
      v22.origin.y = v12;
      v22.size.width = v14;
      v22.size.height = v16;
      v23 = CGRectApplyAffineTransform(v22, &v21);
      x = v23.origin.x;
      y = v23.origin.y;
      width = v23.size.width;
      height = v23.size.height;
    }
  }
  v17 = x;
  v18 = y;
  v19 = width;
  v20 = height;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (THWReviewChoice)choice
{
  return self->_choice;
}

- (double)horizontalOffset
{
  return self->_horizontalOffset;
}

- (unint64_t)index
{
  return self->_index;
}

- (THWReviewTextAnswerLayoutDelegate)delegate
{
  return self->_delegate;
}

- (THWReviewTextAnswerStyleProvider)styleProvider
{
  return self->_styleProvider;
}

@end
