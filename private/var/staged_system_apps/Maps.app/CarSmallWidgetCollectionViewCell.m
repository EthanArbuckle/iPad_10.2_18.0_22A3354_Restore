@implementation CarSmallWidgetCollectionViewCell

+ (double)imageTopMargin
{
  return 0.0;
}

+ (BOOL)isSubtitleHidden
{
  return 1;
}

+ (double)bottomMargin
{
  return 0.0;
}

- (CarSmallWidgetCollectionViewCell)initWithFrame:(CGRect)a3
{
  CarSmallWidgetCollectionViewCell *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CarSmallWidgetCollectionViewCell;
  v3 = -[CarShortcutCollectionViewCell initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, "_focusColorDidChange", CRSUIDashboardWidgetWindowFocusHighlightColorDidChangeNotification, 0);

    -[CarSmallWidgetCollectionViewCell setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("CarSmallWidgetCollectionViewCell"));
  }
  return v3;
}

- (id)focusColor
{
  void *v3;
  uint64_t v4;
  char isKindOfClass;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetCollectionViewCell window](self, "window"));
  v4 = objc_opt_class(CRSUIDashboardWidgetWindow);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  if ((isKindOfClass & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetCollectionViewCell window](self, "window"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "focusHighlightColor"));

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusColor](UIColor, "_carSystemFocusColor"));
  }
  return v7;
}

- (void)focusableItemSelected
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetCollectionViewCell delegate](self, "delegate"));
  objc_msgSend(v3, "didSelectFocusableCollectionCell:", self);

}

- (CarFocusableCollectionItemDelegate)delegate
{
  return (CarFocusableCollectionItemDelegate *)objc_loadWeakRetained((id *)(&self->super._focusOverridden + 1));
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)(&self->super._focusOverridden + 1), a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)(&self->super._focusOverridden + 1));
}

@end
