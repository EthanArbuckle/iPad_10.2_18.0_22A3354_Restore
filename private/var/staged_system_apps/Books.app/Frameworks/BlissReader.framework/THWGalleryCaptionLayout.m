@implementation THWGalleryCaptionLayout

- (THWGalleryCaptionLayout)initWithDelegate:(id)a3
{
  THWGalleryCaptionLayout *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THWGalleryCaptionLayout;
  result = -[THWGalleryCaptionLayout initWithInfo:](&v5, "initWithInfo:", 0);
  if (result)
    result->_delegate = (THWGalleryCaptionLayoutDelegate *)a3;
  return result;
}

- (Class)repClassOverride
{
  return (Class)objc_opt_class(THWGalleryCaptionRep, a2);
}

- (id)computeLayoutGeometry
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  double v10;
  double v11;

  -[THWGalleryCaptionLayoutDelegate galleryCaptionPosition](self->_delegate, "galleryCaptionPosition");
  v4 = v3;
  -[THWGalleryCaptionLayoutDelegate galleryCaptionMargin](self->_delegate, "galleryCaptionMargin");
  v6 = v5;
  -[THWGalleryCaptionLayoutDelegate galleryCaptionWidth](self->_delegate, "galleryCaptionWidth");
  v8 = v7;
  v9 = objc_msgSend(-[THWGalleryCaptionLayout children](self, "children"), "lastObject");
  if (v9)
  {
    objc_msgSend(v9, "frame");
    v11 = v10;
  }
  else
  {
    v11 = 0.0;
  }
  return objc_msgSend(objc_alloc((Class)TSDLayoutGeometry), "initWithFrame:", v6, v4, v8 + v6 * -2.0, v11);
}

- (id)childInfosForLayout
{
  id result;

  result = -[THWGalleryCaptionLayoutDelegate galleryCaptionStorage](self->_delegate, "galleryCaptionStorage");
  if (result)
    return +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", result);
  return result;
}

- (void)captionStorageUpdated
{
  -[THWGalleryCaptionLayout invalidateFrame](self, "invalidateFrame");
  -[THWGalleryCaptionLayout invalidateChildren](self, "invalidateChildren");
}

- (unsigned)autosizeFlagsForTextLayout:(id)a3
{
  return 3;
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
  CGFloat height;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect result;

  height = a4.height;
  -[THWGalleryCaptionLayoutDelegate galleryCaptionMargin](self->_delegate, "galleryCaptionMargin", a3, a4.width);
  v7 = v6;
  -[THWGalleryCaptionLayoutDelegate galleryCaptionWidth](self->_delegate, "galleryCaptionWidth");
  v9 = v8 + v7 * -2.0;
  v10 = 0.0;
  v11 = 0.0;
  v12 = height;
  result.size.height = v12;
  result.size.width = v9;
  result.origin.y = v11;
  result.origin.x = v10;
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
  return objc_msgSend(-[THWGalleryCaptionLayout p_wpLayoutParent](self, "p_wpLayoutParent"), "styleProviderForLayout:", a3);
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
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWGalleryCaptionLayout positionForColumnIndex:bodyWidth:outWidth:outGap:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Gallery/THWGalleryCaptionLayout.m"), 138, CFSTR("unexpected column index"));
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

- (id)p_wpLayoutParent
{
  return (id)TSUProtocolCast(&OBJC_PROTOCOL___TSWPLayoutParent, -[THWGalleryCaptionLayout parent](self, "parent"));
}

- (THWGalleryCaptionLayoutDelegate)delegate
{
  return self->_delegate;
}

@end
