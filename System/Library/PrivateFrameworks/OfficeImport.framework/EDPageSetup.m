@implementation EDPageSetup

+ (id)pageSetup
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (EDPageSetup)init
{
  EDPageSetup *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDPageSetup;
  result = -[EDPageSetup init](&v3, sel_init);
  if (result)
  {
    *(int64x2_t *)&result->mFirstPageNumber = vdupq_n_s64(1uLL);
    *(_OWORD *)&result->mFitToWidth = xmmword_22A4C1F50;
    result->mCustomFirstPageNumber = 0;
    *(_QWORD *)&result->mOrientation = 1;
  }
  return result;
}

- (void)setOrientation:(int)a3
{
  self->mOrientation = a3;
}

- (void)setOrder:(int)a3
{
  self->mPageOrder = a3;
}

- (void)setFirstPageNumber:(unint64_t)a3
{
  self->mFirstPageNumber = a3;
  self->mCustomFirstPageNumber = 1;
}

- (void)setCustomFirstPageNumber:(BOOL)a3
{
  self->mCustomFirstPageNumber = a3;
}

- (void)setFitToHeight:(unint64_t)a3
{
  self->mFitToHeight = a3;
}

- (void)setFitToWidth:(unint64_t)a3
{
  self->mFitToWidth = a3;
}

- (void)setLeftMargin:(float)a3
{
  self->mLeftMargin = a3;
}

- (void)setRightMargin:(float)a3
{
  self->mRightMargin = a3;
}

- (void)setTopMargin:(float)a3
{
  self->mTopMargin = a3;
}

- (void)setBottomMargin:(float)a3
{
  self->mBottomMargin = a3;
}

- (void)setHeaderMargin:(float)a3
{
  self->mHeaderMargin = a3;
}

- (void)setFooterMargin:(float)a3
{
  self->mFooterMargin = a3;
}

- (void)setScale:(unint64_t)a3
{
  self->mScale = a3;
}

- (int)orientation
{
  return self->mOrientation;
}

- (int)order
{
  return self->mPageOrder;
}

- (BOOL)customFirstPageNumber
{
  return self->mCustomFirstPageNumber;
}

- (unint64_t)firstPageNumber
{
  return self->mFirstPageNumber;
}

- (unint64_t)fitToHeight
{
  return self->mFitToHeight;
}

- (unint64_t)fitToWidth
{
  return self->mFitToWidth;
}

- (unint64_t)scale
{
  return self->mScale;
}

- (float)leftMargin
{
  return self->mLeftMargin;
}

- (float)rightMargin
{
  return self->mRightMargin;
}

- (float)topMargin
{
  return self->mTopMargin;
}

- (float)bottomMargin
{
  return self->mBottomMargin;
}

- (float)headerMargin
{
  return self->mHeaderMargin;
}

- (float)footerMargin
{
  return self->mFooterMargin;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDPageSetup;
  -[EDPageSetup description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
