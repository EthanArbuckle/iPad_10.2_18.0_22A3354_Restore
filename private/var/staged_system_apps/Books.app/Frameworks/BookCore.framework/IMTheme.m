@implementation IMTheme

+ (void)initialize
{
  void *v2;
  void *v3;
  const __CFString *v4;
  void *v5;

  if ((id)objc_opt_class(IMTheme) == a1)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v4 = CFSTR("BKFlowingBookViewControllerAutoNightModeOnKey");
    v5 = &__kCFBooleanTrue;
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v5, &v4, 1));
    objc_msgSend(v2, "registerDefaults:", v3);

  }
}

+ (BOOL)isAutoNightModeEnabled
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("BKFlowingBookViewControllerAutoNightModeOnKey"));

  return v3;
}

+ (void)setAutoNightModeEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("BKFlowingBookViewControllerAutoNightModeOnKey"));

}

- (IMTheme)init
{
  IMTheme *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)IMTheme;
  v2 = -[IMTheme init](&v27, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
    -[IMTheme setTintColor:](v2, "setTintColor:", v3);

    -[IMTheme setShouldInvertContent:](v2, "setShouldInvertContent:", 0);
    -[IMTheme setOverlayContentBackgroundColor:](v2, "setOverlayContentBackgroundColor:", 0);
    -[IMTheme setAnnotationBlendMode:](v2, "setAnnotationBlendMode:", 1);
    -[IMTheme setHighlightedAnnotationBlendMode:](v2, "setHighlightedAnnotationBlendMode:", 3);
    -[IMTheme setAnnotationPageTheme:](v2, "setAnnotationPageTheme:", 4);
    -[IMTheme setTextHighlightType:](v2, "setTextHighlightType:", 3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor darkGrayColor](UIColor, "darkGrayColor"));
    -[IMTheme setHeaderTextColor:](v2, "setHeaderTextColor:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", 16.0, UIFontWeightLight));
    -[IMTheme setButtonTitleFont:](v2, "setButtonTitleFont:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.678431373, 1.0));
    -[IMTheme setButtonTitleColorDisabled:](v2, "setButtonTitleColorDisabled:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    -[IMTheme setContentTextColor:](v2, "setContentTextColor:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 21.0));
    -[IMTheme setMenuTitleFont:](v2, "setMenuTitleFont:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tableCellBlueTextColor](UIColor, "tableCellBlueTextColor"));
    -[IMTheme setMenuTitleColor:](v2, "setMenuTitleColor:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.7, 1.0));
    -[IMTheme setDividerColor:](v2, "setDividerColor:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    -[IMTheme setToolbarTitleColor:](v2, "setToolbarTitleColor:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[IMTheme setPopoverBackgroundColor:](v2, "setPopoverBackgroundColor:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksSecondaryLabelColor](UIColor, "bc_booksSecondaryLabelColor"));
    -[IMTheme setBookmarkPageNumberColor:](v2, "setBookmarkPageNumberColor:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksLabelColor](UIColor, "bc_booksLabelColor"));
    -[IMTheme setBookmarkLabelColor:](v2, "setBookmarkLabelColor:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[IMTheme setTableViewBackgroundColor:](v2, "setTableViewBackgroundColor:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGroupedBackgroundColor](UIColor, "systemGroupedBackgroundColor"));
    -[IMTheme setGroupTableViewBackgroundColor:](v2, "setGroupTableViewBackgroundColor:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tableSeparatorLightColor](UIColor, "tableSeparatorLightColor"));
    -[IMTheme setTableViewSeparatorColor:](v2, "setTableViewSeparatorColor:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[IMTheme setTableViewCellBackgroundColor:](v2, "setTableViewCellBackgroundColor:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksTableSelectionColor](UIColor, "bc_booksTableSelectionColor"));
    -[IMTheme setTableViewCellSelectedColor:](v2, "setTableViewCellSelectedColor:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.941176471, 1.0));
    -[IMTheme setTableViewHeaderViewColor:](v2, "setTableViewHeaderViewColor:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.941176471, 1.0));
    -[IMTheme setTableViewToolbarColor:](v2, "setTableViewToolbarColor:", v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.6, 1.0));
    -[IMTheme setTocPageNumberTextColor:](v2, "setTocPageNumberTextColor:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    -[IMTheme setKeyColor:](v2, "setKeyColor:", v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.0156862745, 0.0156862745, 0.0588235294, 0.45));
    -[IMTheme setSystemGrayColor:](v2, "setSystemGrayColor:", v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.294117647, 0.0, 0.509803922, 1.0));
    -[IMTheme setLinkColor:](v2, "setLinkColor:", v25);

    -[IMTheme setPageTurnSpineAlpha:](v2, "setPageTurnSpineAlpha:", 1.0);
    -[IMTheme setTableViewToolbarTranslucent:](v2, "setTableViewToolbarTranslucent:", 1);
    -[IMTheme setTextHighlightType:](v2, "setTextHighlightType:", 4);
    -[IMTheme setKeyboardAppearance:](v2, "setKeyboardAppearance:", 0);
    -[IMTheme setContentStatusBarStyle:](v2, "setContentStatusBarStyle:", 0);
    -[IMTheme setGaijiImageFilter:](v2, "setGaijiImageFilter:", 0);
    -[IMTheme setSpeakScreenHighlightColor:](v2, "setSpeakScreenHighlightColor:", 0);
    -[IMTheme setSpeakScreenUnderlineColor:](v2, "setSpeakScreenUnderlineColor:", 0);
  }
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;

  if (self == a3)
    return 1;
  v4 = a3;
  v5 = objc_opt_class(IMTheme);
  v6 = BUDynamicCast(v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[IMTheme themeIdentifier](self, "themeIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "themeIdentifier"));
    v10 = objc_msgSend(v8, "isEqual:", v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)isNight:(id)a3
{
  return 0;
}

+ (id)_themeForIdentifier:(id)a3
{
  id v3;
  __objc2_class **v4;
  id v5;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", kIMThemeIdentifierBookshelfTheme[0]) & 1) != 0)
  {
    v4 = off_28A060;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", kIMThemeIdentifierBookshelfNightTheme[0]) & 1) != 0)
  {
    v4 = off_28A068;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", kIMThemeIdentifierDefaultPageTheme[0]) & 1) != 0)
  {
    v4 = off_28A070;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", kIMThemeIdentifierWhitePageTheme[0]) & 1) != 0)
  {
    v4 = &off_28A098;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", kIMThemeIdentifierSepiaPageTheme[0]) & 1) != 0)
  {
    v4 = off_28A090;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", kIMThemeIdentifierGrayPageTheme[0]) & 1) != 0)
  {
    v4 = off_28A080;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", kIMThemeIdentifierNightPageTheme[0]) & 1) != 0)
  {
    v4 = off_28A088;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", kIMThemeIdentifierBlissClassicTheme[0]) & 1) != 0)
  {
    v4 = off_28A058;
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", kIMThemeIdentifierDynamicTheme[0]))
    {
      v5 = 0;
      goto LABEL_20;
    }
    v4 = off_28A078;
  }
  v5 = objc_alloc_init(*v4);
LABEL_20:
  objc_msgSend(v5, "setThemeIdentifier:", v3);

  return v5;
}

+ (IMTheme)themeWithIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (qword_311600 != -1)
    dispatch_once(&qword_311600, &stru_292B88);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_3115F8, "objectForKeyedSubscript:", v4));
  if (!v5)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_themeForIdentifier:", v4));
    objc_msgSend((id)qword_3115F8, "setObject:forKeyedSubscript:", v5, v4);
  }

  return (IMTheme *)v5;
}

- (NSString)identifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class(self, a2);
  return NSStringFromClass(v2);
}

- (id)backgroundColorForTraitEnvironment:(id)a3
{
  return -[IMTheme backgroundColorForTraitCollection:](self, "backgroundColorForTraitCollection:", 0);
}

- (id)backgroundColorForTraitCollection:(id)a3
{
  return 0;
}

- (void)stylizeOuterView:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[IMTheme tintColor](self, "tintColor"));
  objc_msgSend(v4, "setTintColor:", v5);

}

- (void)stylizeButton:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  v27 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMTheme buttonTitleFont](self, "buttonTitleFont"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMTheme buttonTitleFont](self, "buttonTitleFont"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "titleLabel"));
    objc_msgSend(v6, "setFont:", v5);

  }
  v7 = objc_opt_class(IMThemePage);
  v8 = BUDynamicCast(v7, self);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  if (v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "keyColor"));
    objc_msgSend(v27, "setTitleColor:forState:", v11, 0);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "keyColor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "colorWithAlphaComponent:", 0.7));
    objc_msgSend(v27, "setTitleColor:forState:", v13, 1);

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "quarternaryTextColor"));
    objc_msgSend(v27, "setTitleColor:forState:", v14, 2);

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "keyColor"));
    objc_msgSend(v27, "_setImageColor:forState:", v15, 0);

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "keyColor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "colorWithAlphaComponent:", 0.7));
    objc_msgSend(v27, "_setImageColor:forState:", v17, 1);

    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "quarternaryTextColor"));
LABEL_9:
    v26 = (void *)v18;
    objc_msgSend(v27, "_setImageColor:forState:", v18, 2);

    goto LABEL_10;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[IMTheme buttonTitleColor](self, "buttonTitleColor"));

  if (v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[IMTheme buttonTitleColor](self, "buttonTitleColor"));
    objc_msgSend(v27, "setTitleColor:forState:", v20, 0);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[IMTheme buttonTitleColor](self, "buttonTitleColor"));
    objc_msgSend(v27, "setTitleColor:forState:", v21, 1);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[IMTheme buttonTitleColor](self, "buttonTitleColor"));
    objc_msgSend(v27, "_setImageColor:forState:", v22, 0);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[IMTheme buttonTitleColor](self, "buttonTitleColor"));
    objc_msgSend(v27, "_setImageColor:forState:", v23, 1);

  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[IMTheme buttonTitleColorDisabled](self, "buttonTitleColorDisabled"));

  if (v24)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[IMTheme buttonTitleColorDisabled](self, "buttonTitleColorDisabled"));
    objc_msgSend(v27, "setTitleColor:forState:", v25, 2);

    v18 = objc_claimAutoreleasedReturnValue(-[IMTheme buttonTitleColorDisabled](self, "buttonTitleColorDisabled"));
    goto LABEL_9;
  }
LABEL_10:

}

- (void)stylizeBCNavigationBar:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "setBarStyle:", 0);
  objc_msgSend(v6, "setTranslucent:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMTheme backgroundColorForTraitEnvironment:](self, "backgroundColorForTraitEnvironment:", v6));
  objc_msgSend(v6, "setBarTintColor:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMTheme keyColor](self, "keyColor"));
  objc_msgSend(v6, "setTintColor:", v5);

  objc_msgSend(v6, "setSeparatorsVisible:", 1);
  objc_msgSend(v6, "setBackgroundHidden:", 0);
  objc_msgSend(v6, "setBackgroundImage:forBarPosition:barMetrics:", 0, 0, 0);

}

- (void)stylizeBCNavigationBarTranslucent:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "setBarStyle:", 0);
  objc_msgSend(v6, "setTranslucent:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMTheme backgroundColorForTraitEnvironment:](self, "backgroundColorForTraitEnvironment:", v6));
  objc_msgSend(v6, "setBarTintColor:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMTheme keyColor](self, "keyColor"));
  objc_msgSend(v6, "setTintColor:", v5);

  objc_msgSend(v6, "setSeparatorsVisible:", 1);
  objc_msgSend(v6, "setBackgroundHidden:", 0);
  objc_msgSend(v6, "setBackgroundImage:forBarPosition:barMetrics:", 0, 0, 0);

}

- (void)stylizeBCNavigationBarTransparent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[IMTheme stylizeBCNavigationBar:](self, "stylizeBCNavigationBar:", v4);
  objc_msgSend(v4, "setSeparatorsVisible:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v4, "setBarTintColor:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v4, "setBackgroundColor:", v6);

  v7 = objc_alloc_init((Class)UINavigationBarAppearance);
  objc_msgSend(v7, "configureWithTransparentBackground");
  objc_msgSend(v4, "setStandardAppearance:", v7);

}

- (void)stylizeBCToolbar:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "setBarStyle:", 0);
  objc_msgSend(v6, "setTranslucent:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMTheme backgroundColorForTraitEnvironment:](self, "backgroundColorForTraitEnvironment:", v6));
  objc_msgSend(v6, "setBarTintColor:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMTheme keyColor](self, "keyColor"));
  objc_msgSend(v6, "setTintColor:", v5);

  objc_msgSend(v6, "setSeparatorsVisible:", 1);
  objc_msgSend(v6, "setBackgroundImage:forToolbarPosition:barMetrics:", 0, 0, 0);

}

- (void)stylizeBCToolbarTranslucent:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "setBarStyle:", 0);
  objc_msgSend(v6, "setTranslucent:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMTheme backgroundColorForTraitEnvironment:](self, "backgroundColorForTraitEnvironment:", v6));
  objc_msgSend(v6, "setBarTintColor:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMTheme keyColor](self, "keyColor"));
  objc_msgSend(v6, "setTintColor:", v5);

  objc_msgSend(v6, "setSeparatorsVisible:", 1);
  objc_msgSend(v6, "setBackgroundImage:forToolbarPosition:barMetrics:", 0, 0, 0);

}

- (void)stylizeToolbarButtonDelete:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
  objc_msgSend(v3, "setTintColor:", v4);

}

- (void)stylizeBarButtonItemDelete:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
  objc_msgSend(v3, "setTintColor:", v4);

}

- (void)stylizeKeyboard:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = objc_msgSend(v8, "keyboardAppearance");
  if (v4 != (id)-[IMTheme keyboardAppearance](self, "keyboardAppearance"))
  {
    objc_msgSend(v8, "setKeyboardAppearance:", -[IMTheme keyboardAppearance](self, "keyboardAppearance"));
    v5 = objc_opt_class(UIResponder);
    v6 = BUDynamicCast(v5, v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    objc_msgSend(v7, "reloadInputViews");

  }
}

- (UIColor)popoverControlColor
{
  UIColor *v3;

  v3 = self->_popoverControlColor;
  if (!v3)
    v3 = (UIColor *)objc_claimAutoreleasedReturnValue(-[IMTheme headerTextColor](self, "headerTextColor"));
  return v3;
}

- (UIColor)appearancePopoverBackgroundColor
{
  UIColor *v3;

  v3 = self->_appearancePopoverBackgroundColor;
  if (!v3)
    v3 = (UIColor *)objc_claimAutoreleasedReturnValue(-[IMTheme groupTableViewBackgroundColor](self, "groupTableViewBackgroundColor"));
  return v3;
}

- (UIColor)searchPopoverTextColor
{
  UIColor *v3;

  v3 = self->_searchPopoverTextColor;
  if (!v3)
    v3 = (UIColor *)objc_claimAutoreleasedReturnValue(-[IMTheme headerTextColor](self, "headerTextColor"));
  return v3;
}

- (UIColor)searchPopoverTintColor
{
  UIColor *v3;

  v3 = self->_searchPopoverTintColor;
  if (!v3)
    v3 = (UIColor *)objc_claimAutoreleasedReturnValue(-[IMTheme tintColor](self, "tintColor"));
  return v3;
}

- (UIColor)linkVisitedColor
{
  UIColor *v3;

  v3 = self->_linkVisitedColor;
  if (!v3)
    v3 = (UIColor *)objc_claimAutoreleasedReturnValue(-[IMTheme linkColor](self, "linkColor"));
  return v3;
}

- (UIColor)linkActiveColor
{
  UIColor *v3;

  v3 = self->_linkActiveColor;
  if (!v3)
    v3 = (UIColor *)objc_claimAutoreleasedReturnValue(-[IMTheme linkColor](self, "linkColor"));
  return v3;
}

- (UIColor)nowPlayingHeaderColor
{
  return -[IMTheme tableViewHeaderViewColor](self, "tableViewHeaderViewColor");
}

- (void)stylizeNavigationController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSAttributedStringKey v11;
  void *v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMTheme tintColor](self, "tintColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  objc_msgSend(v6, "setTintColor:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IMTheme buttonTitleColor](self, "buttonTitleColor"));
  if (v7)
  {
    v11 = NSForegroundColorAttributeName;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[IMTheme buttonTitleColor](self, "buttonTitleColor"));
    v12 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "navigationBar"));
    objc_msgSend(v10, "setTitleTextAttributes:", v9);

  }
}

- (void)stylizeTableViewCell:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMTheme tableViewCellBackgroundColor](self, "tableViewCellBackgroundColor"));
  objc_msgSend(v15, "setBackgroundColor:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMTheme buttonTitleFont](self, "buttonTitleFont"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "textLabel"));
  objc_msgSend(v6, "setFont:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IMTheme contentTextColor](self, "contentTextColor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "textLabel"));
  objc_msgSend(v8, "setTextColor:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "selectedBackgroundView"));
  v10 = (char *)objc_msgSend(v9, "tag");

  if (v10 != (_BYTE *)&loc_11E74 + 2)
  {
    v11 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    objc_msgSend(v15, "setSelectedBackgroundView:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "selectedBackgroundView"));
    objc_msgSend(v12, "setTag:", 73334);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[IMTheme tableViewCellSelectedColor](self, "tableViewCellSelectedColor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "selectedBackgroundView"));
  objc_msgSend(v14, "setBackgroundColor:", v13);

}

- (void)stylizeMenuTableViewCell:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMTheme tableViewCellBackgroundColor](self, "tableViewCellBackgroundColor"));
  objc_msgSend(v15, "setBackgroundColor:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMTheme menuTitleFont](self, "menuTitleFont"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "textLabel"));
  objc_msgSend(v6, "setFont:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IMTheme menuTitleColor](self, "menuTitleColor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "textLabel"));
  objc_msgSend(v8, "setTextColor:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "selectedBackgroundView"));
  v10 = (char *)objc_msgSend(v9, "tag");

  if (v10 != (_BYTE *)&loc_11E74 + 2)
  {
    v11 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    objc_msgSend(v15, "setSelectedBackgroundView:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "selectedBackgroundView"));
    objc_msgSend(v12, "setTag:", 73334);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[IMTheme tableViewCellSelectedColor](self, "tableViewCellSelectedColor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "selectedBackgroundView"));
  objc_msgSend(v14, "setBackgroundColor:", v13);

}

- (void)stylizeTableView:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "style") == (char *)&dword_0 + 1)
    v4 = objc_claimAutoreleasedReturnValue(-[IMTheme groupTableViewBackgroundColor](self, "groupTableViewBackgroundColor"));
  else
    v4 = objc_claimAutoreleasedReturnValue(-[IMTheme tableViewBackgroundColor](self, "tableViewBackgroundColor"));
  v5 = (void *)v4;
  objc_msgSend(v7, "setBackgroundColor:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IMTheme tableViewSeparatorColor](self, "tableViewSeparatorColor"));
  objc_msgSend(v7, "setSeparatorColor:", v6);

}

- (void)stylizeSlider:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v8, "setBackgroundColor:", v4);

  -[IMTheme sliderAlpha](self, "sliderAlpha");
  v6 = v5;
  v7 = 1.0;
  if (v6 != 0.0)
    -[IMTheme sliderAlpha](self, "sliderAlpha", 1.0);
  objc_msgSend(v8, "setAlpha:", v7);

}

- (void)stylizeScrollView:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  v4 = objc_opt_class(IMThemePage);
  v5 = BUDynamicCast(v4, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (v6)
  {
    if (objc_msgSend(v6, "userInterfaceStyle") == (char *)&dword_0 + 2)
      v8 = 2;
    else
      v8 = 1;
    objc_msgSend(v9, "setIndicatorStyle:", v8);
  }

}

- (NSString)themeIdentifier
{
  return self->_themeIdentifier;
}

- (void)setThemeIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_tintColor, a3);
}

- (UIColor)headerTextColor
{
  return self->_headerTextColor;
}

- (void)setHeaderTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_headerTextColor, a3);
}

- (UIColor)headerTextColorDimmed
{
  return self->_headerTextColorDimmed;
}

- (void)setHeaderTextColorDimmed:(id)a3
{
  objc_storeStrong((id *)&self->_headerTextColorDimmed, a3);
}

- (UIColor)footerTextColor
{
  return self->_footerTextColor;
}

- (void)setFooterTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_footerTextColor, a3);
}

- (UIColor)contentTextColor
{
  return self->_contentTextColor;
}

- (void)setContentTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_contentTextColor, a3);
}

- (UIColor)pageCurlBackPageColor
{
  return self->_pageCurlBackPageColor;
}

- (void)setPageCurlBackPageColor:(id)a3
{
  objc_storeStrong((id *)&self->_pageCurlBackPageColor, a3);
}

- (UIColor)dividerColor
{
  return self->_dividerColor;
}

- (void)setDividerColor:(id)a3
{
  objc_storeStrong((id *)&self->_dividerColor, a3);
}

- (UIColor)toolbarTitleColor
{
  return self->_toolbarTitleColor;
}

- (void)setToolbarTitleColor:(id)a3
{
  objc_storeStrong((id *)&self->_toolbarTitleColor, a3);
}

- (UIColor)linkColor
{
  return self->_linkColor;
}

- (void)setLinkColor:(id)a3
{
  objc_storeStrong((id *)&self->_linkColor, a3);
}

- (void)setLinkVisitedColor:(id)a3
{
  objc_storeStrong((id *)&self->_linkVisitedColor, a3);
}

- (void)setLinkActiveColor:(id)a3
{
  objc_storeStrong((id *)&self->_linkActiveColor, a3);
}

- (UIColor)tocPageNumberTextColor
{
  return self->_tocPageNumberTextColor;
}

- (void)setTocPageNumberTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_tocPageNumberTextColor, a3);
}

- (BOOL)shouldInvertContent
{
  return self->_shouldInvertContent;
}

- (void)setShouldInvertContent:(BOOL)a3
{
  self->_shouldInvertContent = a3;
}

- (BOOL)overlayContentBackgroundColor
{
  return self->_overlayContentBackgroundColor;
}

- (void)setOverlayContentBackgroundColor:(BOOL)a3
{
  self->_overlayContentBackgroundColor = a3;
}

- (int)annotationBlendMode
{
  return self->_annotationBlendMode;
}

- (void)setAnnotationBlendMode:(int)a3
{
  self->_annotationBlendMode = a3;
}

- (int)highlightedAnnotationBlendMode
{
  return self->_highlightedAnnotationBlendMode;
}

- (void)setHighlightedAnnotationBlendMode:(int)a3
{
  self->_highlightedAnnotationBlendMode = a3;
}

- (int64_t)annotationPageTheme
{
  return self->_annotationPageTheme;
}

- (void)setAnnotationPageTheme:(int64_t)a3
{
  self->_annotationPageTheme = a3;
}

- (double)pageTurnSpineAlpha
{
  return self->_pageTurnSpineAlpha;
}

- (void)setPageTurnSpineAlpha:(double)a3
{
  self->_pageTurnSpineAlpha = a3;
}

- (int64_t)contentStatusBarStyle
{
  return self->_contentStatusBarStyle;
}

- (void)setContentStatusBarStyle:(int64_t)a3
{
  self->_contentStatusBarStyle = a3;
}

- (UIFont)buttonTitleFont
{
  return self->_buttonTitleFont;
}

- (void)setButtonTitleFont:(id)a3
{
  objc_storeStrong((id *)&self->_buttonTitleFont, a3);
}

- (UIColor)buttonTitleColor
{
  return self->_buttonTitleColor;
}

- (void)setButtonTitleColor:(id)a3
{
  objc_storeStrong((id *)&self->_buttonTitleColor, a3);
}

- (UIColor)buttonTitleColorDisabled
{
  return self->_buttonTitleColorDisabled;
}

- (void)setButtonTitleColorDisabled:(id)a3
{
  objc_storeStrong((id *)&self->_buttonTitleColorDisabled, a3);
}

- (UIFont)menuTitleFont
{
  return self->_menuTitleFont;
}

- (void)setMenuTitleFont:(id)a3
{
  objc_storeStrong((id *)&self->_menuTitleFont, a3);
}

- (UIColor)menuTitleColor
{
  return self->_menuTitleColor;
}

- (void)setMenuTitleColor:(id)a3
{
  objc_storeStrong((id *)&self->_menuTitleColor, a3);
}

- (int64_t)keyboardAppearance
{
  return self->_keyboardAppearance;
}

- (void)setKeyboardAppearance:(int64_t)a3
{
  self->_keyboardAppearance = a3;
}

- (UIColor)popoverBackgroundColor
{
  return self->_popoverBackgroundColor;
}

- (void)setPopoverBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_popoverBackgroundColor, a3);
}

- (UIColor)popoverTitleColor
{
  return self->_popoverTitleColor;
}

- (void)setPopoverTitleColor:(id)a3
{
  objc_storeStrong((id *)&self->_popoverTitleColor, a3);
}

- (void)setPopoverControlColor:(id)a3
{
  objc_storeStrong((id *)&self->_popoverControlColor, a3);
}

- (void)setAppearancePopoverBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_appearancePopoverBackgroundColor, a3);
}

- (void)setSearchPopoverTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_searchPopoverTextColor, a3);
}

- (void)setSearchPopoverTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_searchPopoverTintColor, a3);
}

- (UIColor)finishedCheckmarkColor
{
  return self->_finishedCheckmarkColor;
}

- (void)setFinishedCheckmarkColor:(id)a3
{
  objc_storeStrong((id *)&self->_finishedCheckmarkColor, a3);
}

- (UIColor)finishedButtonBackgroundColor
{
  return self->_finishedButtonBackgroundColor;
}

- (void)setFinishedButtonBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_finishedButtonBackgroundColor, a3);
}

- (UIColor)finishedButtonTextColor
{
  return self->_finishedButtonTextColor;
}

- (void)setFinishedButtonTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_finishedButtonTextColor, a3);
}

- (UIColor)finishedButtonDisabledBackgroundColor
{
  return self->_finishedButtonDisabledBackgroundColor;
}

- (void)setFinishedButtonDisabledBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_finishedButtonDisabledBackgroundColor, a3);
}

- (UIColor)finishedButtonDisabledTextColor
{
  return self->_finishedButtonDisabledTextColor;
}

- (void)setFinishedButtonDisabledTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_finishedButtonDisabledTextColor, a3);
}

- (UIColor)buyButtonColor
{
  return self->_buyButtonColor;
}

- (void)setBuyButtonColor:(id)a3
{
  objc_storeStrong((id *)&self->_buyButtonColor, a3);
}

- (UIColor)bookmarkPageNumberColor
{
  return self->_bookmarkPageNumberColor;
}

- (void)setBookmarkPageNumberColor:(id)a3
{
  objc_storeStrong((id *)&self->_bookmarkPageNumberColor, a3);
}

- (UIColor)bookmarkLabelColor
{
  return self->_bookmarkLabelColor;
}

- (void)setBookmarkLabelColor:(id)a3
{
  objc_storeStrong((id *)&self->_bookmarkLabelColor, a3);
}

- (UIColor)tableViewBackgroundColor
{
  return self->_tableViewBackgroundColor;
}

- (void)setTableViewBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_tableViewBackgroundColor, a3);
}

- (UIColor)groupTableViewBackgroundColor
{
  return self->_groupTableViewBackgroundColor;
}

- (void)setGroupTableViewBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_groupTableViewBackgroundColor, a3);
}

- (UIColor)tableViewSeparatorColor
{
  return self->_tableViewSeparatorColor;
}

- (void)setTableViewSeparatorColor:(id)a3
{
  objc_storeStrong((id *)&self->_tableViewSeparatorColor, a3);
}

- (UIColor)tableViewCellBackgroundColor
{
  return self->_tableViewCellBackgroundColor;
}

- (void)setTableViewCellBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_tableViewCellBackgroundColor, a3);
}

- (UIColor)tableViewCellSelectedColor
{
  return self->_tableViewCellSelectedColor;
}

- (void)setTableViewCellSelectedColor:(id)a3
{
  objc_storeStrong((id *)&self->_tableViewCellSelectedColor, a3);
}

- (UIColor)tableViewHeaderViewColor
{
  return self->_tableViewHeaderViewColor;
}

- (void)setTableViewHeaderViewColor:(id)a3
{
  objc_storeStrong((id *)&self->_tableViewHeaderViewColor, a3);
}

- (UIColor)tableViewToolbarColor
{
  return self->_tableViewToolbarColor;
}

- (void)setTableViewToolbarColor:(id)a3
{
  objc_storeStrong((id *)&self->_tableViewToolbarColor, a3);
}

- (BOOL)tableViewToolbarTranslucent
{
  return self->_tableViewToolbarTranslucent;
}

- (void)setTableViewToolbarTranslucent:(BOOL)a3
{
  self->_tableViewToolbarTranslucent = a3;
}

- (UIColor)keyColor
{
  return self->_keyColor;
}

- (void)setKeyColor:(id)a3
{
  objc_storeStrong((id *)&self->_keyColor, a3);
}

- (UIColor)systemGrayColor
{
  return self->_systemGrayColor;
}

- (void)setSystemGrayColor:(id)a3
{
  objc_storeStrong((id *)&self->_systemGrayColor, a3);
}

- (double)sliderAlpha
{
  return self->_sliderAlpha;
}

- (void)setSliderAlpha:(double)a3
{
  self->_sliderAlpha = a3;
}

- (unint64_t)textHighlightType
{
  return self->_textHighlightType;
}

- (void)setTextHighlightType:(unint64_t)a3
{
  self->_textHighlightType = a3;
}

- (id)compositingFilter
{
  return objc_loadWeakRetained(&self->_compositingFilter);
}

- (void)setCompositingFilter:(id)a3
{
  objc_storeWeak(&self->_compositingFilter, a3);
}

- (BOOL)imageMultiplyExpandedContentMode
{
  return self->_imageMultiplyExpandedContentMode;
}

- (void)setImageMultiplyExpandedContentMode:(BOOL)a3
{
  self->_imageMultiplyExpandedContentMode = a3;
}

- (NSString)gaijiImageFilter
{
  return self->_gaijiImageFilter;
}

- (void)setGaijiImageFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 408);
}

- (UIColor)speakScreenHighlightColor
{
  return self->_speakScreenHighlightColor;
}

- (void)setSpeakScreenHighlightColor:(id)a3
{
  objc_storeStrong((id *)&self->_speakScreenHighlightColor, a3);
}

- (UIColor)speakScreenUnderlineColor
{
  return self->_speakScreenUnderlineColor;
}

- (void)setSpeakScreenUnderlineColor:(id)a3
{
  objc_storeStrong((id *)&self->_speakScreenUnderlineColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speakScreenUnderlineColor, 0);
  objc_storeStrong((id *)&self->_speakScreenHighlightColor, 0);
  objc_storeStrong((id *)&self->_gaijiImageFilter, 0);
  objc_destroyWeak(&self->_compositingFilter);
  objc_storeStrong((id *)&self->_systemGrayColor, 0);
  objc_storeStrong((id *)&self->_keyColor, 0);
  objc_storeStrong((id *)&self->_tableViewToolbarColor, 0);
  objc_storeStrong((id *)&self->_tableViewHeaderViewColor, 0);
  objc_storeStrong((id *)&self->_tableViewCellSelectedColor, 0);
  objc_storeStrong((id *)&self->_tableViewCellBackgroundColor, 0);
  objc_storeStrong((id *)&self->_tableViewSeparatorColor, 0);
  objc_storeStrong((id *)&self->_groupTableViewBackgroundColor, 0);
  objc_storeStrong((id *)&self->_tableViewBackgroundColor, 0);
  objc_storeStrong((id *)&self->_bookmarkLabelColor, 0);
  objc_storeStrong((id *)&self->_bookmarkPageNumberColor, 0);
  objc_storeStrong((id *)&self->_buyButtonColor, 0);
  objc_storeStrong((id *)&self->_finishedButtonDisabledTextColor, 0);
  objc_storeStrong((id *)&self->_finishedButtonDisabledBackgroundColor, 0);
  objc_storeStrong((id *)&self->_finishedButtonTextColor, 0);
  objc_storeStrong((id *)&self->_finishedButtonBackgroundColor, 0);
  objc_storeStrong((id *)&self->_finishedCheckmarkColor, 0);
  objc_storeStrong((id *)&self->_searchPopoverTintColor, 0);
  objc_storeStrong((id *)&self->_searchPopoverTextColor, 0);
  objc_storeStrong((id *)&self->_appearancePopoverBackgroundColor, 0);
  objc_storeStrong((id *)&self->_popoverControlColor, 0);
  objc_storeStrong((id *)&self->_popoverTitleColor, 0);
  objc_storeStrong((id *)&self->_popoverBackgroundColor, 0);
  objc_storeStrong((id *)&self->_menuTitleColor, 0);
  objc_storeStrong((id *)&self->_menuTitleFont, 0);
  objc_storeStrong((id *)&self->_buttonTitleColorDisabled, 0);
  objc_storeStrong((id *)&self->_buttonTitleColor, 0);
  objc_storeStrong((id *)&self->_buttonTitleFont, 0);
  objc_storeStrong((id *)&self->_tocPageNumberTextColor, 0);
  objc_storeStrong((id *)&self->_linkActiveColor, 0);
  objc_storeStrong((id *)&self->_linkVisitedColor, 0);
  objc_storeStrong((id *)&self->_linkColor, 0);
  objc_storeStrong((id *)&self->_toolbarTitleColor, 0);
  objc_storeStrong((id *)&self->_dividerColor, 0);
  objc_storeStrong((id *)&self->_pageCurlBackPageColor, 0);
  objc_storeStrong((id *)&self->_contentTextColor, 0);
  objc_storeStrong((id *)&self->_footerTextColor, 0);
  objc_storeStrong((id *)&self->_headerTextColorDimmed, 0);
  objc_storeStrong((id *)&self->_headerTextColor, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_themeIdentifier, 0);
}

@end
