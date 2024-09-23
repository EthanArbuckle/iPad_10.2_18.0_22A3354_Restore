@implementation RoutePlanningFooterCollectionViewCell

+ (Class)_contentViewClass
{
  return (Class)objc_opt_class(RoutePlanningFooterView);
}

- (RoutePlanningFooterCollectionViewCell)initWithFrame:(CGRect)a3
{
  RoutePlanningFooterCollectionViewCell *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RoutePlanningFooterCollectionViewCell;
  v3 = -[RoutePlanningFooterCollectionViewCell initWithFrame:](&v5, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
    +[RoutingAppearanceManager configureBackgroundViewForStepCell:](RoutingAppearanceManager, "configureBackgroundViewForStepCell:", v3);
  return v3;
}

- (void)setItem:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a3;
  objc_storeStrong((id *)&self->_item, a3);
  v10 = v5;
  v6 = objc_msgSend(v10, "commandSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterCollectionViewCell footerView](self, "footerView"));
  objc_msgSend(v7, "setVisibleCommandSet:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "delegate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterCollectionViewCell footerView](self, "footerView"));
  objc_msgSend(v9, "setDelegate:", v8);

}

+ (double)heightForItem:(id)a3 width:(double)a4 maximumHeight:(double)a5
{
  uint64_t v6;
  id v7;
  id v8;
  double v9;

  v6 = qword_1014D3260;
  v7 = a3;
  if (v6 != -1)
    dispatch_once(&qword_1014D3260, &stru_1011C6580);
  objc_msgSend((id)qword_1014D3268, "setFrame:", 0.0, 0.0, a4, 1.79769313e308);
  v8 = objc_msgSend(v7, "commandSet");

  objc_msgSend((id)qword_1014D3268, "setVisibleCommandSet:", v8);
  objc_msgSend((id)qword_1014D3268, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
  return v9;
}

- (RouteStepItem)item
{
  return self->_item;
}

- (BOOL)shouldUseTextToBottomConstraint
{
  return self->_shouldUseTextToBottomConstraint;
}

- (void)setShouldUseTextToBottomConstraint:(BOOL)a3
{
  self->_shouldUseTextToBottomConstraint = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);
}

@end
