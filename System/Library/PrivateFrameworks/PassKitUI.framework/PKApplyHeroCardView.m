@implementation PKApplyHeroCardView

- (PKApplyHeroCardView)initWithFeatureIdentifier:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  PKApplyHeroCardView *v8;
  PKApplyHeroCardView *v9;

  PKAccountHeroImageName();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    PKUIImageNamed(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  v8 = -[PKHeroCardExplanationHeaderView initWithImage:](self, "initWithImage:", v7);
  v9 = v8;
  if (v8)
  {
    v8->_featureIdentifier = a3;
    if (a3 == 5)
    {
      -[PKHeroCardExplanationHeaderView setPadding:](v8, "setPadding:", 4);
      -[PKHeroCardExplanationHeaderView setHideBorders:](v9, "setHideBorders:", 1);
    }
  }

  return v9;
}

@end
