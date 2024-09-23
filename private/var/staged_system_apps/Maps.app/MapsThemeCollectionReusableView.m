@implementation MapsThemeCollectionReusableView

- (MapsThemeCollectionReusableView)initWithFrame:(CGRect)a3
{
  MapsThemeCollectionReusableView *v3;
  void *v4;
  id v5;
  UIView *v6;
  UIView *contentView;
  UIView *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MapsThemeCollectionReusableView;
  v3 = -[MapsThemeCollectionReusableView initWithFrame:](&v14, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[MapsThemeCollectionReusableView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v5 = objc_alloc((Class)UIView);
    -[MapsThemeCollectionReusableView bounds](v3, "bounds");
    v6 = (UIView *)objc_msgSend(v5, "initWithFrame:");
    contentView = v3->_contentView;
    v3->_contentView = v6;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_contentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setPreservesSuperviewLayoutMargins:](v3->_contentView, "setPreservesSuperviewLayoutMargins:", 1);
    -[MapsThemeCollectionReusableView addSubview:](v3, "addSubview:", v3->_contentView);
    v8 = v3->_contentView;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeCollectionReusableView layoutMarginsGuide](v3, "layoutMarginsGuide"));
    LODWORD(v10) = 1148846080;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIView _maps_constraintsEqualToEdgesOfLayoutGuide:priority:](v8, "_maps_constraintsEqualToEdgesOfLayoutGuide:priority:", v9, v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "allConstraints"));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

  }
  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v3;
  id v5;
  id v6;
  void *v7;
  id v8;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MapsThemeCollectionReusableView;
  -[MapsThemeCollectionReusableView traitCollectionDidChange:](&v9, "traitCollectionDidChange:", v5);
  if (v5
    && (v6 = objc_msgSend(v5, "userInterfaceStyle"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeCollectionReusableView traitCollection](self, "traitCollection")),
        v6 == objc_msgSend(v3, "userInterfaceStyle")))
  {

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeCollectionReusableView traitCollection](self, "traitCollection"));
    v8 = objc_msgSend(v7, "userInterfaceStyle");

    if (v5)
    if (v8)
      -[MapsThemeCollectionReusableView updateTheme](self, "updateTheme");
  }

}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MapsThemeCollectionReusableView;
  -[MapsThemeCollectionReusableView didMoveToWindow](&v4, "didMoveToWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeCollectionReusableView window](self, "window"));

  if (v3)
    -[MapsThemeCollectionReusableView updateTheme](self, "updateTheme");
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4;
  void *v5;

  v4 = objc_msgSend(a3, "copy");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeCollectionReusableView contentView](self, "contentView"));
  objc_msgSend(v5, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);

  objc_msgSend(v4, "frame");
  objc_msgSend(v4, "setFrame:");
  return v4;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
