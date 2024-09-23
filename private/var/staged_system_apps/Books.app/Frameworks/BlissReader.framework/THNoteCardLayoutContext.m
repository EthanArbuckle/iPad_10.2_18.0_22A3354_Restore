@implementation THNoteCardLayoutContext

+ (THNoteCardLayoutContext)contextWithScale:(double)a3 hostView:(id)a4
{
  return (THNoteCardLayoutContext *)objc_msgSend(objc_alloc((Class)objc_opt_class(a1)), "initWithScale:hostView:", a4, a3);
}

- (THNoteCardLayoutContext)initWithScale:(double)a3 hostView:(id)a4
{
  THNoteCardLayoutContext *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)THNoteCardLayoutContext;
  v6 = -[THNoteCardLayoutContext init](&v8, "init");
  if (v6)
  {
    v6->_hostView = (UIView *)a4;
    v6->_scale = a3;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  self->_hostView = 0;
  v3.receiver = self;
  v3.super_class = (Class)THNoteCardLayoutContext;
  -[THNoteCardLayoutContext dealloc](&v3, "dealloc");
}

- (double)scale
{
  return self->_scale;
}

- (double)textScale
{
  if (-[THNoteCardLayoutContext _isCompactWidth](self, "_isCompactWidth")
    || -[THNoteCardLayoutContext _isCompactHeight](self, "_isCompactHeight"))
  {
    return fmin(self->_scale * 1.5, 1.0);
  }
  else
  {
    return self->_scale;
  }
}

- (CGSize)noteCardSize
{
  double scale;
  double v3;
  double v4;
  CGSize result;

  scale = self->_scale;
  v3 = 895.0 * scale;
  v4 = scale * 614.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)noteCardOffset
{
  double scale;
  double v3;
  double v4;
  CGSize result;

  scale = self->_scale;
  v3 = *(double *)&kTHNoteCardOffset * scale;
  v4 = scale * *((double *)&kTHNoteCardOffset + 1);
  result.height = v4;
  result.width = v3;
  return result;
}

- (double)noteCardLeftMargin
{
  return 40.0 * self->_scale;
}

- (double)noteCardRightMargin
{
  return 40.0 * self->_scale;
}

- (double)noteCardBodyLeftMargin
{
  return *(double *)&kTHNoteCardBodyLeftMargin * self->_scale;
}

- (double)noteCardBodyRightMargin
{
  return 57.0 * self->_scale;
}

- (double)noteCardBodyTopMargin
{
  return 80.0 * self->_scale;
}

- (double)noteCardBodyBottomMargin
{
  return 88.0 * self->_scale;
}

- (double)noteCardBodyWidth
{
  return *(double *)&kTHNoteCardBodyWidth * self->_scale;
}

- (double)noteCardBodyHeight
{
  return 446.0 * self->_scale;
}

- (double)noteCardHeaderBaselineOffset
{
  return 55.0 * self->_scale;
}

- (double)noteCardFooterBaselineOffset
{
  return 40.0 * self->_scale;
}

- (double)noteCardColorBarWidth
{
  return 4.0 * self->_scale;
}

- (double)noteCardColorBarPaddingFromScrollBottom
{
  return 3.0 * self->_scale;
}

- (double)noteCardSectionTitlePaddingToPageNumber
{
  return 25.0 * self->_scale;
}

- (double)noteCardShadowOpacity
{
  return 0.25;
}

- (CGSize)noteCardShadowOffsetForScreenScale:(double)a3
{
  double scale;
  BOOL v4;
  __int128 *v5;
  double v6;
  double *v7;
  double v8;
  CGSize result;

  scale = self->_scale;
  v4 = a3 <= 1.0;
  if (a3 <= 1.0)
    v5 = &kTHNoteCardShadowOffset;
  else
    v5 = &kTHNoteCardShadowOffsetRetina;
  v6 = *(double *)v5 * scale;
  v7 = (double *)&kTHNoteCardShadowOffsetRetina + 1;
  if (v4)
    v7 = (double *)&kTHNoteCardShadowOffset + 1;
  v8 = scale * *v7;
  result.height = v8;
  result.width = v6;
  return result;
}

- (double)noteCardShadowRadiusForScreenScale:(double)a3
{
  double *v3;

  v3 = (double *)&kTHNoteCardShadowRadiusRetina;
  if (a3 <= 1.0)
    v3 = (double *)&kTHNoteCardShadowRadius;
  return *v3 * self->_scale;
}

- (id)noteCardHeaderFont
{
  return +[TSUFont systemFontOfSize:](TSUFont, "systemFontOfSize:", 21.0 * self->_scale);
}

- (id)noteCardFooterFont
{
  return +[TSUFont systemFontOfSize:](TSUFont, "systemFontOfSize:", 25.0 * self->_scale);
}

- (BOOL)_isCompactWidth
{
  return -[UIViewController im_isCompactWidth](-[UIWindow rootViewController](-[UIView window](self->_hostView, "window"), "rootViewController"), "im_isCompactWidth");
}

- (BOOL)_isCompactHeight
{
  return -[UIViewController im_isCompactHeight](-[UIWindow rootViewController](-[UIView window](self->_hostView, "window"), "rootViewController"), "im_isCompactHeight");
}

- (double)bottomCardAngle
{
  unsigned int v3;
  double *v4;

  if (-[THNoteCardLayoutContext _isCompactWidth](self, "_isCompactWidth"))
  {
    v3 = -[THNoteCardLayoutContext _isCompactHeight](self, "_isCompactHeight");
    v4 = (double *)&kTHNoteCardBottomCardAngleCompactWidthCompactHeight;
    if (!v3)
      v4 = (double *)&kTHNoteCardBottomCardAngleCompactWidthRegularHeight;
  }
  else
  {
    v4 = (double *)&kTHNoteCardBottomCardAngleAnyWidthAnyHeight;
  }
  return *v4;
}

- (CGPoint)bottomCardOffset
{
  uint64_t *v3;
  double v4;
  double v5;
  CGPoint result;

  if (-[THNoteCardLayoutContext _isCompactWidth](self, "_isCompactWidth"))
  {
    if (-[THNoteCardLayoutContext _isCompactHeight](self, "_isCompactHeight"))
      v3 = &kTHNoteCardBottomCardOffsetCompactWidthCompactHeight;
    else
      v3 = &kTHNoteCardBottomCardOffsetCompactWidthRegularHeight;
  }
  else
  {
    v3 = &kTHNoteCardBottomCardOffsetAnyWidthAnyHeight;
  }
  v4 = TSDMultiplyPointScalar(*(double *)v3, *((double *)v3 + 1), self->_scale);
  result.y = v5;
  result.x = v4;
  return result;
}

@end
