@implementation THNavigationOverlayView

- (THNavigationOverlayView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Navigator/THNavigationOverlayView.m", 51, "-[THNavigationOverlayView initWithFrame:]", "NO", CFSTR("Don't use this init."));
  return -[THNavigationOverlayView initWithFrame:blissClassicStyle:](self, "initWithFrame:blissClassicStyle:", 0, x, y, width, height);
}

- (THNavigationOverlayView)initWithFrame:(CGRect)a3 blissClassicStyle:(BOOL)a4
{
  THNavigationOverlayView *v5;
  id v6;
  double y;
  double width;
  double height;
  id v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)THNavigationOverlayView;
  v5 = -[THNavigationOverlayView initWithFrame:](&v12, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v5)
  {
    v6 = objc_alloc((Class)BEHairlineDividerView);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v5->_separator = (BEHairlineDividerView *)objc_msgSend(v6, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    v5->_prevButton = (UIButton *)-[THNavigationOverlayView p_customButtonWithFrame:](v5, "p_customButtonWithFrame:", CGRectZero.origin.x, y, width, height);
    v5->_nextButton = (UIButton *)-[THNavigationOverlayView p_customButtonWithFrame:](v5, "p_customButtonWithFrame:", CGRectZero.origin.x, y, width, height);
    v5->_titleLabel = (UILabel *)objc_alloc_init((Class)UILabel);
    v10 = objc_alloc((Class)UIView);
    -[THNavigationOverlayView bounds](v5, "bounds");
    v5->_backgroundView = (UIView *)objc_msgSend(v10, "initWithFrame:");
    v5->_blissClassicStyle = a4;
    -[THNavigationOverlayView addSubview:](v5, "addSubview:", v5->_backgroundView);
    -[THNavigationOverlayView addSubview:](v5, "addSubview:", v5->_separator);
    -[THNavigationOverlayView addSubview:](v5, "addSubview:", v5->_prevButton);
    -[THNavigationOverlayView addSubview:](v5, "addSubview:", v5->_nextButton);
    -[THNavigationOverlayView addSubview:](v5, "addSubview:", v5->_titleLabel);
    -[THNavigationOverlayView setTintAdjustmentMode:](v5, "setTintAdjustmentMode:", 0);
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v5->_prevButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v5->_nextButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[THNavigationOverlayView _updateConstraints](v5, "_updateConstraints");
    -[THNavigationOverlayView pSetControlColors](v5, "pSetControlColors");
    -[THNavigationOverlayView setOverlayHidden:animated:](v5, "setOverlayHidden:animated:", 1, 0);
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THNavigationOverlayView;
  -[THNavigationOverlayView dealloc](&v3, "dealloc");
}

- (void)setBackgroundColor:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THNavigationOverlayView;
  -[THNavigationOverlayView setBackgroundColor:](&v5, "setBackgroundColor:");
  -[UIView setBackgroundColor:](self->_backgroundView, "setBackgroundColor:", a3);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  if (-[THNavigationOverlayView blissClassicStyle](self, "blissClassicStyle"))
    -[THNavigationOverlayView layoutSubviewsWithPill](self, "layoutSubviewsWithPill");
  else
    -[THNavigationOverlayView layoutSubviewsWithoutPill](self, "layoutSubviewsWithoutPill");
  -[THNavigationOverlayView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend(-[THNavigationOverlayView window](self, "window"), "safeAreaInsets");
  -[UIView setFrame:](self->_backgroundView, "setFrame:", v4, v6, v8, v10 + v11);
}

- (void)layoutSubviewsWithPill
{
  NSArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  NSString *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double y;
  double width;
  double height;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  NSAttributedStringKey v22;
  UIFont *v23;
  _QWORD v24[2];
  _BYTE v25[128];

  -[THNavigationOverlayView p_loadCachedPillButtonImages](self, "p_loadCachedPillButtonImages");
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v24[0] = -[THNavigationOverlayView prevButton](self, "prevButton", 0);
  v24[1] = -[THNavigationOverlayView nextButton](self, "nextButton");
  v3 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v24, 2);
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v7);
        v9 = -[THTheme identifier](self->_theme, "identifier");
        if (objc_msgSend(v9, "isEqualToString:", kIMThemeIdentifierBlissClassicTheme))
          objc_msgSend(objc_msgSend(v8, "layer"), "setBackgroundColor:", objc_msgSend(+[UIColor bc_darkSystemBackgroundForTraitCollection:](UIColor, "bc_darkSystemBackgroundForTraitCollection:", -[THNavigationOverlayView traitCollection](self, "traitCollection")), "CGColor"));
        objc_msgSend(objc_msgSend(v8, "layer"), "setBorderWidth:", 0.0);
        objc_msgSend(objc_msgSend(v8, "layer"), "setCornerRadius:", 3.0);
        objc_msgSend(v8, "setClipsToBounds:", 1);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
    }
    while (v5);
  }
  -[UIButton setImage:forState:](-[THNavigationOverlayView prevButton](self, "prevButton"), "setImage:forState:", -[THNavigationOverlayView cachedPillModePrevImage](self, "cachedPillModePrevImage"), 0);
  -[UIButton setImageEdgeInsets:](-[THNavigationOverlayView prevButton](self, "prevButton"), "setImageEdgeInsets:", 0.0, 0.0, 0.0, 8.0);
  -[UILabel setFont:](-[UIButton titleLabel](-[THNavigationOverlayView prevButton](self, "prevButton"), "titleLabel"), "setFont:", +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 13.0));
  -[UIButton setImage:forState:](-[THNavigationOverlayView nextButton](self, "nextButton"), "setImage:forState:", -[THNavigationOverlayView cachedPillModeNextImage](self, "cachedPillModeNextImage"), 0);
  -[UILabel setFont:](-[UIButton titleLabel](-[THNavigationOverlayView nextButton](self, "nextButton"), "titleLabel"), "setFont:", +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 13.0));
  -[UILabel frame](-[UIButton titleLabel](-[THNavigationOverlayView nextButton](self, "nextButton"), "titleLabel"), "frame");
  v10 = -[UILabel text](-[UIButton titleLabel](-[THNavigationOverlayView nextButton](self, "nextButton"), "titleLabel"), "text");
  v22 = NSFontAttributeName;
  v23 = -[UILabel font](-[UIButton titleLabel](-[THNavigationOverlayView nextButton](self, "nextButton"), "titleLabel"), "font");
  -[NSString sizeWithAttributes:](v10, "sizeWithAttributes:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));
  v12 = v11;
  -[UIImageView frame](-[UIButton imageView](-[THNavigationOverlayView nextButton](self, "nextButton"), "imageView"), "frame");
  v14 = v13;
  -[UIButton setImageEdgeInsets:](-[THNavigationOverlayView nextButton](self, "nextButton"), "setImageEdgeInsets:", 0.0, v12 + 8.0, 0.0, -(v12 + 8.0));
  -[UIButton setTitleEdgeInsets:](-[THNavigationOverlayView nextButton](self, "nextButton"), "setTitleEdgeInsets:", 0.0, -v14, 0.0, v14);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  -[UILabel setFrame:](-[THNavigationOverlayView titleLabel](self, "titleLabel"), "setFrame:", CGRectZero.origin.x, y, width, height);
  -[BEHairlineDividerView setFrame:](-[THNavigationOverlayView separator](self, "separator"), "setFrame:", CGRectZero.origin.x, y, width, height);
}

- (void)layoutSubviewsWithoutPill
{
  NSArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  double left;
  double bottom;
  double right;
  void *i;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[2];
  _BYTE v24[128];

  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23[0] = -[THNavigationOverlayView prevButton](self, "prevButton", 0);
  v23[1] = -[THNavigationOverlayView nextButton](self, "nextButton");
  v3 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v23, 2);
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v20;
    left = UIEdgeInsetsZero.left;
    bottom = UIEdgeInsetsZero.bottom;
    right = UIEdgeInsetsZero.right;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(v3);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        objc_msgSend(objc_msgSend(v11, "layer"), "setBackgroundColor:", 0);
        objc_msgSend(objc_msgSend(v11, "layer"), "setBorderWidth:", 0.0);
        objc_msgSend(objc_msgSend(v11, "layer"), "setCornerRadius:", 0.0);
        objc_msgSend(v11, "setClipsToBounds:", 0);
        objc_msgSend(v11, "setImageEdgeInsets:", UIEdgeInsetsZero.top, left, bottom, right);
        objc_msgSend(v11, "setTitleEdgeInsets:", UIEdgeInsetsZero.top, left, bottom, right);
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v5);
  }
  -[UILabel setFont:](-[THNavigationOverlayView titleLabel](self, "titleLabel"), "setFont:", +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 13.0));
  -[BEHairlineDividerView setHorizontal:](-[THNavigationOverlayView separator](self, "separator"), "setHorizontal:", 1);
  -[UIButton setImage:forState:](-[THNavigationOverlayView prevButton](self, "prevButton"), "setImage:forState:", 0, 0);
  -[UIButton setImage:forState:](-[THNavigationOverlayView nextButton](self, "nextButton"), "setImage:forState:", 0, 0);
  -[UILabel setFont:](-[UIButton titleLabel](-[THNavigationOverlayView prevButton](self, "prevButton"), "titleLabel"), "setFont:", +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 13.0));
  -[UILabel setFont:](-[UIButton titleLabel](-[THNavigationOverlayView nextButton](self, "nextButton"), "titleLabel"), "setFont:", +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 13.0));
  -[UIButton sizeToFit](-[THNavigationOverlayView prevButton](self, "prevButton"), "sizeToFit");
  -[UIButton sizeToFit](-[THNavigationOverlayView nextButton](self, "nextButton"), "sizeToFit");
  -[UILabel sizeToFit](-[THNavigationOverlayView titleLabel](self, "titleLabel"), "sizeToFit");
  -[THNavigationOverlayView bounds](self, "bounds");
  v13 = v12;
  -[THNavigationOverlayView bounds](self, "bounds");
  v15 = v14;
  -[THNavigationOverlayView bounds](self, "bounds");
  v17 = v16;
  -[UIScreen scale](+[UIScreen mainScreen](UIScreen, "mainScreen"), "scale");
  -[BEHairlineDividerView setFrame:](-[THNavigationOverlayView separator](self, "separator"), "setFrame:", v13, v15, v17, 1.0 / v18);
}

- (void)pSetControlColors
{
  UIColor *v3;
  UIButton *v4;
  UIButton *v5;
  BEHairlineDividerView *v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  BEHairlineDividerView *v14;

  v3 = +[UIColor whiteColor](UIColor, "whiteColor");
  v4 = -[THNavigationOverlayView prevButton](self, "prevButton");
  v5 = -[THNavigationOverlayView nextButton](self, "nextButton");
  if (-[THNavigationOverlayView blissClassicStyle](self, "blissClassicStyle"))
  {
    -[UIButton setTitleColor:forState:](v4, "setTitleColor:forState:", v3, 0);
    -[UIButton setTitleColor:forState:](v4, "setTitleColor:forState:", 0, 1);
    -[UIButton setTitleColor:forState:](v5, "setTitleColor:forState:", v3, 0);
    -[UIButton setTitleColor:forState:](v5, "setTitleColor:forState:", 0, 1);
    -[UILabel setTextColor:](-[THNavigationOverlayView titleLabel](self, "titleLabel"), "setTextColor:", +[UIColor clearColor](UIColor, "clearColor"));
    v6 = -[THNavigationOverlayView separator](self, "separator");
    v7 = 1;
  }
  else
  {
    v8 = objc_opt_class(IMThemePage);
    *(_QWORD *)&v9 = TSUDynamicCast(v8, -[THNavigationOverlayView theme](self, "theme")).n128_u64[0];
    v11 = v10;
    v12 = objc_msgSend(v10, "headerTextColorDimmed", v9);
    v13 = objc_msgSend(v11, "tintColor");
    -[UIButton setTitleColor:forState:](v4, "setTitleColor:forState:", v13, 0);
    -[UIButton setTitleColor:forState:](v5, "setTitleColor:forState:", v13, 0);
    -[UIButton setTitleColor:forState:](v4, "setTitleColor:forState:", v12, 2);
    -[UIButton setTitleColor:forState:](v5, "setTitleColor:forState:", v12, 2);
    -[UILabel setTextColor:](-[THNavigationOverlayView titleLabel](self, "titleLabel"), "setTextColor:", v12);
    v14 = -[THNavigationOverlayView separator](self, "separator");
    -[BEHairlineDividerView setDividerColor:](v14, "setDividerColor:", objc_msgSend(v11, "separatorColor"));
    v7 = -[THNavigationOverlayView separatorsVisible](self, "separatorsVisible") ^ 1;
    v6 = v14;
  }
  -[BEHairlineDividerView setHidden:](v6, "setHidden:", v7);
}

- (void)setTheme:(id)a3
{
  THTheme *theme;

  theme = self->_theme;
  if (theme != a3)
  {

    self->_theme = (THTheme *)a3;
    -[THNavigationOverlayView _updateTheme](self, "_updateTheme");
  }
}

- (void)setTransparentMode:(BOOL)a3
{
  if (self->_transparentMode != a3)
  {
    self->_transparentMode = a3;
    -[THNavigationOverlayView _updateTheme](self, "_updateTheme");
  }
}

- (void)_updateTheme
{
  UIColor *v3;

  if (self->_transparentMode)
    v3 = +[UIColor clearColor](UIColor, "clearColor");
  else
    v3 = (UIColor *)-[THTheme backgroundColorForTraitEnvironment:](self->_theme, "backgroundColorForTraitEnvironment:", self);
  -[THNavigationOverlayView setBackgroundColor:](self, "setBackgroundColor:", v3);
  -[THNavigationOverlayView setTintColor:](self, "setTintColor:", -[THTheme tintColor](self->_theme, "tintColor"));
  -[THNavigationOverlayView pSetControlColors](self, "pSetControlColors");
}

- (void)setTheme:(id)a3 force:(BOOL)a4
{
  _BOOL4 v4;

  v4 = a4;
  -[THNavigationOverlayView setTheme:](self, "setTheme:", a3);
  if (v4)
    -[THNavigationOverlayView _updateTheme](self, "_updateTheme");
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THNavigationOverlayView;
  -[THNavigationOverlayView didMoveToWindow](&v3, "didMoveToWindow");
  -[THNavigationOverlayView _updateTheme](self, "_updateTheme");
}

- (void)_updateConstraints
{
  id v3;
  id v4;
  double v5;
  id v6;
  id v7;
  double v8;
  unsigned int v9;
  UIButton *v10;
  _QWORD *v11;
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[6];

  -[UILabel removeConstraints:](-[THNavigationOverlayView titleLabel](self, "titleLabel"), "removeConstraints:", -[UILabel constraints](-[THNavigationOverlayView titleLabel](self, "titleLabel"), "constraints"));
  -[UIButton removeConstraints:](-[THNavigationOverlayView nextButton](self, "nextButton"), "removeConstraints:", -[UIButton constraints](-[THNavigationOverlayView nextButton](self, "nextButton"), "constraints"));
  -[UIButton removeConstraints:](-[THNavigationOverlayView prevButton](self, "prevButton"), "removeConstraints:", -[UIButton constraints](-[THNavigationOverlayView prevButton](self, "prevButton"), "constraints"));
  v14[0] = objc_msgSend(-[UILabel centerXAnchor](-[THNavigationOverlayView titleLabel](self, "titleLabel"), "centerXAnchor"), "constraintEqualToAnchor:constant:", -[THNavigationOverlayView centerXAnchor](self, "centerXAnchor"), 0.0);
  v14[1] = objc_msgSend(-[UILabel centerYAnchor](-[THNavigationOverlayView titleLabel](self, "titleLabel"), "centerYAnchor"), "constraintEqualToAnchor:constant:", -[THNavigationOverlayView centerYAnchor](self, "centerYAnchor"), 0.0);
  v14[2] = objc_msgSend(-[UIButton centerYAnchor](-[THNavigationOverlayView prevButton](self, "prevButton"), "centerYAnchor"), "constraintEqualToAnchor:constant:", -[THNavigationOverlayView centerYAnchor](self, "centerYAnchor"), 0.0);
  v14[3] = objc_msgSend(-[UIButton centerYAnchor](-[THNavigationOverlayView nextButton](self, "nextButton"), "centerYAnchor"), "constraintEqualToAnchor:constant:", -[THNavigationOverlayView centerYAnchor](self, "centerYAnchor"), 0.0);
  v3 = -[UIButton leadingAnchor](-[THNavigationOverlayView prevButton](self, "prevButton"), "leadingAnchor");
  v4 = objc_msgSend(-[THNavigationOverlayView safeAreaLayoutGuide](self, "safeAreaLayoutGuide"), "leadingAnchor");
  if (-[THNavigationOverlayView blissClassicStyle](self, "blissClassicStyle"))
    v5 = 10.0;
  else
    v5 = 20.0;
  v14[4] = objc_msgSend(v3, "constraintEqualToAnchor:constant:", v4, v5);
  v6 = -[UIButton trailingAnchor](-[THNavigationOverlayView nextButton](self, "nextButton"), "trailingAnchor");
  v7 = objc_msgSend(-[THNavigationOverlayView safeAreaLayoutGuide](self, "safeAreaLayoutGuide"), "trailingAnchor");
  if (-[THNavigationOverlayView blissClassicStyle](self, "blissClassicStyle"))
    v8 = 10.0;
  else
    v8 = 20.0;
  v14[5] = objc_msgSend(v6, "constraintEqualToAnchor:constant:", v7, -v8);
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 6));
  v9 = -[THNavigationOverlayView blissClassicStyle](self, "blissClassicStyle");
  v10 = -[THNavigationOverlayView prevButton](self, "prevButton");
  if (v9)
  {
    v13[0] = objc_msgSend(-[UIButton widthAnchor](v10, "widthAnchor"), "constraintEqualToConstant:", 145.0);
    v13[1] = objc_msgSend(-[UIButton widthAnchor](-[THNavigationOverlayView nextButton](self, "nextButton"), "widthAnchor"), "constraintEqualToConstant:", 145.0);
    v11 = v13;
  }
  else
  {
    v12[0] = objc_msgSend(-[UIButton heightAnchor](v10, "heightAnchor"), "constraintEqualToConstant:", 24.0);
    v12[1] = objc_msgSend(-[UIButton heightAnchor](-[THNavigationOverlayView nextButton](self, "nextButton"), "heightAnchor"), "constraintEqualToConstant:", 24.0);
    v11 = v12;
  }
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 2));
}

- (NSString)title
{
  return -[UILabel text](-[THNavigationOverlayView titleLabel](self, "titleLabel"), "text");
}

- (void)setTitle:(id)a3
{
  -[UILabel setText:](-[THNavigationOverlayView titleLabel](self, "titleLabel"), "setText:", a3);
  -[THNavigationOverlayView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setSeparatorsVisible:(BOOL)a3
{
  self->_separatorsVisible = a3;
  -[THNavigationOverlayView pSetControlColors](self, "pSetControlColors");
}

- (void)setOverlayHidden:(BOOL)a3 animated:(BOOL)a4
{
  _QWORD v6[5];
  BOOL v7;
  _QWORD v8[5];
  BOOL v9;

  if (a4)
  {
    -[THNavigationOverlayView showHideAnimationDuration](self, "showHideAnimationDuration");
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_12A464;
    v8[3] = &unk_427268;
    v9 = a3;
    v8[4] = self;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_12A4A4;
    v6[3] = &unk_429DE0;
    v7 = a3;
    v6[4] = self;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v8, v6);
  }
  else if (a3)
  {
    -[THNavigationOverlayView setAlpha:](self, "setAlpha:", 0.0);
    -[THNavigationOverlayView setHidden:](self, "setHidden:", 1);
  }
  else
  {
    -[THNavigationOverlayView setHidden:](self, "setHidden:", 0);
    -[THNavigationOverlayView setAlpha:](self, "setAlpha:", 1.0);
  }
}

- (void)setAlternativePrevCaption:(id)a3
{
  id v5;

  v5 = a3;

  self->_alternativePrevCaption = (NSString *)a3;
  -[THNavigationOverlayView p_setPrevButtonTitle](self, "p_setPrevButtonTitle");
}

- (void)setAlternativeNextCaption:(id)a3
{
  id v5;

  v5 = a3;

  self->_alternativeNextCaption = (NSString *)a3;
  -[THNavigationOverlayView p_setNextButtonTitle](self, "p_setNextButtonTitle");
}

- (void)setPrevButtonTitle:(id)a3 andEnable:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  uint64_t v8;
  double v9;
  id v10;

  v4 = a4;
  v7 = a3;

  self->_prevCaption = (NSString *)a3;
  -[THNavigationOverlayView p_setPrevButtonTitle](self, "p_setPrevButtonTitle");
  -[UIButton setEnabled:](-[THNavigationOverlayView prevButton](self, "prevButton"), "setEnabled:", v4);
  v8 = objc_opt_class(UILabel);
  *(_QWORD *)&v9 = TSUDynamicCast(v8, -[UIButton _titleView](-[THNavigationOverlayView nextButton](self, "nextButton"), "_titleView")).n128_u64[0];
  objc_msgSend(v10, "_setWantsUnderlineForAccessibilityButtonShapesEnabled:", v4, v9);
}

- (void)setNextButtonTitle:(id)a3 andEnable:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  uint64_t v8;
  double v9;
  id v10;

  v4 = a4;
  v7 = a3;

  self->_nextCaption = (NSString *)a3;
  -[THNavigationOverlayView p_setNextButtonTitle](self, "p_setNextButtonTitle");
  -[UIButton setEnabled:](-[THNavigationOverlayView nextButton](self, "nextButton"), "setEnabled:", v4);
  v8 = objc_opt_class(UILabel);
  *(_QWORD *)&v9 = TSUDynamicCast(v8, -[UIButton _titleView](-[THNavigationOverlayView nextButton](self, "nextButton"), "_titleView")).n128_u64[0];
  objc_msgSend(v10, "_setWantsUnderlineForAccessibilityButtonShapesEnabled:", v4, v9);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v7;
  objc_super v9;
  CGPoint v10;
  CGPoint v11;
  CGRect v12;
  CGRect v13;

  y = a3.y;
  x = a3.x;
  v9.receiver = self;
  v9.super_class = (Class)THNavigationOverlayView;
  v7 = -[THNavigationOverlayView hitTest:withEvent:](&v9, "hitTest:withEvent:", a4);
  -[UIButton frame](-[THNavigationOverlayView prevButton](self, "prevButton"), "frame");
  v10.x = x;
  v10.y = y;
  if (!CGRectContainsPoint(v12, v10))
  {
    -[UIButton frame](-[THNavigationOverlayView nextButton](self, "nextButton"), "frame");
    v11.x = x;
    v11.y = y;
    if (!CGRectContainsPoint(v13, v11))
      return 0;
  }
  return v7;
}

- (void)p_loadCachedPillButtonImages
{
  if (!-[THNavigationOverlayView cachedPillModePrevImage](self, "cachedPillModePrevImage"))
  {
    -[THNavigationOverlayView setCachedPillModePrevImage:](self, "setCachedPillModePrevImage:", +[UIImage th_imageNamed:](UIImage, "th_imageNamed:", CFSTR("ios_ib_history_nav_hud_arrow_back")));
    -[THNavigationOverlayView setCachedPillModeNextImage:](self, "setCachedPillModeNextImage:", +[UIImage th_imageNamed:](UIImage, "th_imageNamed:", CFSTR("ios_ib_history_nav_hud_arrow_go")));
  }
}

- (id)p_customButtonWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  UIButton *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = +[UIButton buttonWithType:](UIButton, "buttonWithType:", 0);
  -[UIButton setTitle:forState:](v7, "setTitle:forState:", CFSTR("None"), 0);
  -[UIButton setContentVerticalAlignment:](v7, "setContentVerticalAlignment:", 0);
  -[UILabel setFont:](-[UIButton titleLabel](v7, "titleLabel"), "setFont:", +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 13.0));
  -[UIButton setFrame:](v7, "setFrame:", x, y, width, height);
  -[UIButton setEnabled:](v7, "setEnabled:", 0);
  return v7;
}

- (void)p_setPrevButtonTitle
{
  __CFString *v3;
  NSString *v4;

  if (-[NSString length](-[THNavigationOverlayView prevCaption](self, "prevCaption"), "length"))
  {
    v3 = -[THNavigationOverlayView prevCaption](self, "prevCaption");
  }
  else
  {
    v4 = -[THNavigationOverlayView alternativePrevCaption](self, "alternativePrevCaption");
    if (v4)
      v3 = (__CFString *)v4;
    else
      v3 = &stru_43D7D8;
  }
  if ((-[__CFString isEqual:](v3, "isEqual:", -[UIButton titleForState:](-[THNavigationOverlayView prevButton](self, "prevButton"), "titleForState:", 0)) & 1) == 0)
  {
    -[UIButton setTitle:forState:](-[THNavigationOverlayView prevButton](self, "prevButton"), "setTitle:forState:", v3, 0);
    -[UIButton setHidden:](-[THNavigationOverlayView prevButton](self, "prevButton"), "setHidden:", -[__CFString length](v3, "length") == 0);
    -[THNavigationOverlayView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)p_setNextButtonTitle
{
  __CFString *v3;
  NSString *v4;

  if (-[NSString length](-[THNavigationOverlayView nextCaption](self, "nextCaption"), "length"))
  {
    v3 = -[THNavigationOverlayView nextCaption](self, "nextCaption");
  }
  else
  {
    v4 = -[THNavigationOverlayView alternativeNextCaption](self, "alternativeNextCaption");
    if (v4)
      v3 = (__CFString *)v4;
    else
      v3 = &stru_43D7D8;
  }
  if ((-[__CFString isEqual:](v3, "isEqual:", -[UIButton titleForState:](-[THNavigationOverlayView nextButton](self, "nextButton"), "titleForState:", 0)) & 1) == 0)
  {
    -[UIButton setTitle:forState:](-[THNavigationOverlayView nextButton](self, "nextButton"), "setTitle:forState:", v3, 0);
    -[UIButton setHidden:](-[THNavigationOverlayView nextButton](self, "nextButton"), "setHidden:", -[__CFString length](v3, "length") == 0);
    -[THNavigationOverlayView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (NSString)alternativePrevCaption
{
  return self->_alternativePrevCaption;
}

- (NSString)alternativeNextCaption
{
  return self->_alternativeNextCaption;
}

- (UIButton)prevButton
{
  return self->_prevButton;
}

- (void)setPrevButton:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (UIButton)nextButton
{
  return self->_nextButton;
}

- (void)setNextButton:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (THTheme)theme
{
  return self->_theme;
}

- (BOOL)separatorsVisible
{
  return self->_separatorsVisible;
}

- (double)marginOffset
{
  return self->_marginOffset;
}

- (void)setMarginOffset:(double)a3
{
  self->_marginOffset = a3;
}

- (double)showHideAnimationDuration
{
  return self->_showHideAnimationDuration;
}

- (void)setShowHideAnimationDuration:(double)a3
{
  self->_showHideAnimationDuration = a3;
}

- (BOOL)transparentMode
{
  return self->_transparentMode;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (NSString)prevCaption
{
  return self->_prevCaption;
}

- (void)setPrevCaption:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSString)nextCaption
{
  return self->_nextCaption;
}

- (void)setNextCaption:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (UIImage)cachedPillModePrevImage
{
  return self->_cachedPillModePrevImage;
}

- (void)setCachedPillModePrevImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (UIImage)cachedPillModeNextImage
{
  return self->_cachedPillModeNextImage;
}

- (void)setCachedPillModeNextImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (BEHairlineDividerView)separator
{
  return self->_separator;
}

- (void)setSeparator:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

- (BOOL)blissClassicStyle
{
  return self->_blissClassicStyle;
}

- (void)setBlissClassicStyle:(BOOL)a3
{
  self->_blissClassicStyle = a3;
}

@end
