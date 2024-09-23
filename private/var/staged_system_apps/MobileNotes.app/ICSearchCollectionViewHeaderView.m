@implementation ICSearchCollectionViewHeaderView

- (ICSearchCollectionViewHeaderView)init
{
  ICSearchCollectionViewHeaderView *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICSearchCollectionViewHeaderView;
  result = -[ICSearchCollectionViewHeaderView init](&v3, "init");
  if (result)
    result->_horizontalInsetsOverride = 2.22507386e-308;
  return result;
}

- (void)setTitle:(id)a3 detail:(id)a4
{
  id v6;

  v6 = a4;
  -[ICSearchCollectionViewHeaderView setTitle:](self, "setTitle:", a3);
  -[ICSearchCollectionViewHeaderView setDetail:](self, "setDetail:", v6);

  -[ICSearchCollectionViewHeaderView setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
}

- (void)updateConfigurationUsingState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  id v23;

  v4 = a3;
  v23 = (id)objc_claimAutoreleasedReturnValue(+[UIBackgroundConfiguration clearConfiguration](UIBackgroundConfiguration, "clearConfiguration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "updatedConfigurationForState:", v4));
  -[ICSearchCollectionViewHeaderView setBackgroundConfiguration:](self, "setBackgroundConfiguration:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIListContentConfiguration prominentInsetGroupedHeaderConfiguration](UIListContentConfiguration, "prominentInsetGroupedHeaderConfiguration"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "updatedConfigurationForState:", v4));

  objc_msgSend(v7, "setPrefersSideBySideTextAndSecondaryText:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICSearchCollectionViewHeaderView title](self, "title"));
  objc_msgSend(v7, "setText:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICSearchCollectionViewHeaderView detail](self, "detail"));
  objc_msgSend(v7, "setSecondaryText:", v9);

  if (-[ICSearchCollectionViewHeaderView styleForCalculator](self, "styleForCalculator"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textProperties"));
    objc_msgSend(v11, "setColor:", v10);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleHeadline));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textProperties"));
    objc_msgSend(v13, "setFont:", v12);

    -[ICSearchCollectionViewHeaderView setHorizontalInsetsOverride:](self, "setHorizontalInsetsOverride:", 24.0);
  }
  -[ICSearchCollectionViewHeaderView horizontalInsetsOverride](self, "horizontalInsetsOverride");
  if (v14 != 2.22507386e-308)
  {
    objc_msgSend(v7, "directionalLayoutMargins");
    v16 = v15;
    v18 = v17;
    -[ICSearchCollectionViewHeaderView horizontalInsetsOverride](self, "horizontalInsetsOverride");
    v20 = v19;
    -[ICSearchCollectionViewHeaderView horizontalInsetsOverride](self, "horizontalInsetsOverride");
    v22 = v21;
    objc_msgSend(v7, "setAxesPreservingSuperviewLayoutMargins:", 2);
    objc_msgSend(v7, "setDirectionalLayoutMargins:", v16, v20, v18, v22);
  }
  -[ICSearchCollectionViewHeaderView setContentConfiguration:](self, "setContentConfiguration:", v7);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICSearchCollectionViewHeaderView;
  return UIAccessibilityTraitHeader | -[ICSearchCollectionViewHeaderView accessibilityTraits](&v3, "accessibilityTraits");
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)detail
{
  return self->_detail;
}

- (void)setDetail:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (double)horizontalInsetsOverride
{
  return self->_horizontalInsetsOverride;
}

- (void)setHorizontalInsetsOverride:(double)a3
{
  self->_horizontalInsetsOverride = a3;
}

- (BOOL)styleForCalculator
{
  return self->_styleForCalculator;
}

- (void)setStyleForCalculator:(BOOL)a3
{
  self->_styleForCalculator = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detail, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
