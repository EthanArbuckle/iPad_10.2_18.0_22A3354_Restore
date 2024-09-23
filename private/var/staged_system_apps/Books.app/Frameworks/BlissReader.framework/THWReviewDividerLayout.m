@implementation THWReviewDividerLayout

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)THWReviewDividerLayout;
  -[THWReviewDividerLayout dealloc](&v2, "dealloc");
}

- (Class)repClassOverride
{
  return (Class)objc_opt_class(THWReviewDividerRep, a2);
}

- (void)validate
{
  objc_super v3;

  -[THWReviewDividerLayout invalidateFrame](self, "invalidateFrame");
  v3.receiver = self;
  v3.super_class = (Class)THWReviewDividerLayout;
  -[THWReviewDividerLayout validate](&v3, "validate");
}

@end
