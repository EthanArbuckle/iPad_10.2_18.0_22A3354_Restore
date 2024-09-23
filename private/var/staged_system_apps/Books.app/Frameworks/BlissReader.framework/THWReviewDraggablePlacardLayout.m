@implementation THWReviewDraggablePlacardLayout

- (THWReviewDraggablePlacardLayout)initWithIndex:(unint64_t)a3 choice:(id)a4 delegate:(id)a5
{
  THWReviewDraggablePlacardLayout *v8;
  THWReviewDraggablePlacardLayout *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)THWReviewDraggablePlacardLayout;
  v8 = -[THWReviewDraggablePlacardLayout initWithInfo:](&v11, "initWithInfo:", 0);
  v9 = v8;
  if (v8)
  {
    v8->_index = a3;
    v8->_choice = (THWReviewChoice *)a4;
    v9->_delegate = (THWReviewDraggablePlacardLayoutDelegate *)a5;
  }
  return v9;
}

- (THWReviewDraggablePlacardLayout)init
{
  return -[THWReviewDraggablePlacardLayout initWithIndex:choice:delegate:](self, "initWithIndex:choice:delegate:", 0x7FFFFFFFFFFFFFFFLL, 0, 0);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWReviewDraggablePlacardLayout;
  -[THWContainerLayout dealloc](&v3, "dealloc");
}

- (Class)repClassOverride
{
  return (Class)objc_opt_class(THWReviewDraggablePlacardRep, a2);
}

- (void)setPlacement:(int)a3
{
  if (self->_placement != a3)
  {
    self->_placement = a3;
    if (self->_contentStorage)
      -[THWReviewDraggablePlacardLayout invalidatePlacement](self, "invalidatePlacement");
  }
}

- (void)invalidatePlacement
{
  -[THWReviewDraggablePlacardLayout invalidateFrame](self, "invalidateFrame");
  objc_msgSend(-[THWReviewDraggablePlacardLayout p_wpLayout](self, "p_wpLayout"), "invalidateSize");
}

- (id)p_wpLayout
{
  uint64_t v3;
  id result;

  if (!self->_contentStorage)
    return 0;
  v3 = objc_opt_class(TSWPLayout);
  TSUDynamicCast(v3, objc_msgSend(-[THWReviewDraggablePlacardLayout layoutController](self, "layoutController"), "layoutForInfo:childOfLayout:", self->_contentStorage, self));
  return result;
}

- (id)computeLayoutGeometry
{
  THWReviewDraggablePlacardLayoutDelegate *delegate;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  TSUImage *contentImage;
  THWReviewDraggablePlacardLayoutDelegate *v13;
  double v14;
  double v15;
  double width;
  double height;
  id v18;
  double v19;
  double v20;
  double v21;
  double v22;
  THWReviewDraggablePlacardLayoutDelegate *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  __n128 v29;
  __n128 v30;
  THWReviewDraggablePlacardLayoutDelegate *v31;
  double x;
  double y;
  double v34;
  double v35;
  double v36;
  double v37;

  delegate = self->_delegate;
  if (delegate)
  {
    -[THWReviewDraggablePlacardLayoutDelegate draggablePlacardLayoutInsets:](delegate, "draggablePlacardLayoutInsets:", self);
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
  }
  else
  {
    v5 = TSDEdgeInsetsZero[0].f64[0];
    v7 = TSDEdgeInsetsZero[0].f64[1];
    v9 = TSDEdgeInsetsZero[1].f64[0];
    v11 = TSDEdgeInsetsZero[1].f64[1];
  }
  contentImage = self->_contentImage;
  if (contentImage)
  {
    v13 = self->_delegate;
    -[TSUImage size](contentImage, "size");
    if (v13)
      -[THWReviewDraggablePlacardLayoutDelegate draggablePlacardLayout:imageSizeForSize:](v13, "draggablePlacardLayout:imageSizeForSize:", self);
    width = v11 + v7 + v14;
    height = v9 + v5 + v15;
  }
  else if (self->_contentStorage)
  {
    v18 = -[THWReviewDraggablePlacardLayout p_wpLayout](self, "p_wpLayout");
    objc_msgSend(v18, "frame");
    v20 = v19;
    v22 = v5 + v21;
    v23 = self->_delegate;
    if (self->_placement)
    {
      if (v23)
      {
        -[THWReviewDraggablePlacardLayoutDelegate draggablePlacardLayoutTextInsets:](v23, "draggablePlacardLayoutTextInsets:", self);
      }
      else
      {
        v24 = TSDEdgeInsetsZero[0].f64[1];
        v25 = TSDEdgeInsetsZero[1].f64[1];
      }
      width = v20 + v24 + v25;
    }
    else
    {
      -[THWReviewDraggablePlacardLayoutDelegate draggablePlacardLayoutTextWidth:](v23, "draggablePlacardLayoutTextWidth:", self);
      width = v11 + v7 + v26;
    }
    height = v9 + v22;
    objc_msgSend(v18, "frame");
    v28 = v27;
    v29.n128_f64[0] = (width - v20) * 0.5;
    objc_msgSend(v18, "offsetGeometryBy:", TSDSubtractPoints(v29, v30, v28, v30.n128_f64[0]));
  }
  else
  {
    width = CGSizeZero.width;
    height = CGSizeZero.height;
  }
  v31 = self->_delegate;
  if (v31)
  {
    v31 = (THWReviewDraggablePlacardLayoutDelegate *)-[THWReviewDraggablePlacardLayoutDelegate draggablePlacardLayout:originForSize:](v31, "draggablePlacardLayout:originForSize:", self, width, height);
  }
  else
  {
    x = CGPointZero.x;
    y = CGPointZero.y;
  }
  v34 = TSDRectWithOriginAndSize(v31, x, y, width, height);
  return objc_msgSend(objc_alloc((Class)TSDLayoutGeometry), "initWithFrame:", v34, v35, v36, v37);
}

- (id)childInfosForLayout
{
  if (self->_contentStorage)
    return +[NSArray arrayWithObject:](NSArray, "arrayWithObject:");
  else
    return 0;
}

- (id)additionalLayouts
{
  return 0;
}

- (void)setContentStorage:(id)a3
{
  TSUImage *contentImage;
  TSWPStorage **p_contentStorage;
  TSWPStorage *contentStorage;

  contentImage = self->_contentImage;
  if (contentImage)
  {

    self->_contentImage = 0;
    p_contentStorage = &self->_contentStorage;
    contentStorage = self->_contentStorage;
    if (contentStorage == a3)
      goto LABEL_6;
  }
  else
  {
    p_contentStorage = &self->_contentStorage;
    contentStorage = self->_contentStorage;
    if (contentStorage == a3)
      return;
  }

  *p_contentStorage = (TSWPStorage *)a3;
LABEL_6:
  -[THWContainerLayout invalidate](self, "invalidate");
}

- (void)setContentImage:(id)a3
{
  TSWPStorage *contentStorage;
  TSUImage **p_contentImage;
  TSUImage *contentImage;

  contentStorage = self->_contentStorage;
  if (contentStorage)
  {

    self->_contentStorage = 0;
    p_contentImage = &self->_contentImage;
    contentImage = self->_contentImage;
    if (contentImage == a3)
      goto LABEL_6;
  }
  else
  {
    p_contentImage = &self->_contentImage;
    contentImage = self->_contentImage;
    if (contentImage == a3)
      return;
  }

  *p_contentImage = (TSUImage *)a3;
LABEL_6:
  -[THWContainerLayout invalidate](self, "invalidate");
}

- (NSString)contentImageAccessibilityDescription
{
  return -[THWReviewChoice accessibilityDescription](-[THWReviewDraggablePlacardLayout choice](self, "choice"), "accessibilityDescription");
}

- (unsigned)autosizeFlagsForTextLayout:(id)a3
{
  return 12;
}

- (unsigned)verticalAlignmentForTextLayout:(id)a3
{
  return 1;
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
  CGFloat width;
  THWReviewDraggablePlacardLayoutDelegate *delegate;
  double v7;
  float64_t v8;
  double v9;
  float64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  width = a4.width;
  delegate = self->_delegate;
  if (delegate)
  {
    -[THWReviewDraggablePlacardLayoutDelegate draggablePlacardLayoutInsets:](delegate, "draggablePlacardLayoutInsets:", self, a4.width, a4.height);
    v8 = v7;
    v10 = v9;
    delegate = self->_delegate;
  }
  else
  {
    v8 = TSDEdgeInsetsZero[0].f64[0];
    v10 = TSDEdgeInsetsZero[1].f64[0];
  }
  -[THWReviewDraggablePlacardLayoutDelegate draggablePlacardLayoutTextHeight:](delegate, "draggablePlacardLayoutTextHeight:", self);
  v12 = v11;
  v13 = v8;
  v14 = v10;
  v15 = width;
  result.size.height = v12;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
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

- (double)maxAutoGrowWidthForTextLayout:(id)a3
{
  double result;

  -[THWReviewDraggablePlacardLayoutDelegate draggablePlacardLayoutTextMaxWidth:](self->_delegate, "draggablePlacardLayoutTextMaxWidth:", self);
  return result;
}

- (BOOL)allowsLastLineTruncation:(id)a3
{
  return 1;
}

- (unsigned)maxLineCountForTextLayout:(id)a3
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

- (THWReviewChoice)choice
{
  return self->_choice;
}

- (unint64_t)index
{
  return self->_index;
}

- (THWReviewDraggablePlacardLayoutDelegate)delegate
{
  return self->_delegate;
}

- (TSWPStorage)contentStorage
{
  return self->_contentStorage;
}

- (TSUImage)contentImage
{
  return self->_contentImage;
}

- (int)placement
{
  return self->_placement;
}

@end
