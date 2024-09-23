@implementation BKThumbnailBookViewConfiguration

- (BKThumbnailBookViewConfiguration)initWithContext:(id)a3
{
  id v4;
  BKThumbnailBookViewConfiguration *v5;
  BKThumbnailBookViewConfiguration *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BKThumbnailBookViewConfiguration;
  v5 = -[BKThumbnailBookViewConfiguration init](&v8, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_context, v4);
    -[BKThumbnailBookViewConfiguration _setupCompactWidth](v6, "_setupCompactWidth");
    -[BKThumbnailBookViewConfiguration _setupRegularWidth](v6, "_setupRegularWidth");
    -[BKThumbnailBookViewConfiguration _setupDefault](v6, "_setupDefault");
  }

  return v6;
}

- (double)sideContentInset
{
  void *v3;
  double v4;
  double v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewConfiguration context](self, "context"));
  -[BKThumbnailBookViewConfiguration floatForKey:context:](self, "floatForKey:context:", CFSTR("sideContentInset"), v3);
  v5 = v4;

  return v5;
}

- (id)libraryButtonTitle
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewConfiguration context](self, "context"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewConfiguration stringForKey:context:](self, "stringForKey:context:", CFSTR("libraryButtonTitle"), v3));

  return v4;
}

- (UIEdgeInsets)tocButtonImageEdgeInsets
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  UIEdgeInsets result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewConfiguration context](self, "context"));
  -[BKThumbnailBookViewConfiguration edgeInsetsForKey:context:](self, "edgeInsetsForKey:context:", CFSTR("tocButtonImageEdgeInsets"), v3);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (UIEdgeInsets)resumeButtonTitleEdgeInsets
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  UIEdgeInsets result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewConfiguration context](self, "context"));
  -[BKThumbnailBookViewConfiguration edgeInsetsForKey:context:](self, "edgeInsetsForKey:context:", CFSTR("resumeButtonTitleEdgeInsets"), v3);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (double)tapToTurnWidth
{
  void *v3;
  double v4;
  double v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewConfiguration context](self, "context"));
  -[BKThumbnailBookViewConfiguration floatForKey:context:](self, "floatForKey:context:", CFSTR("tapToTurnWidth"), v3);
  v5 = v4;

  return v5;
}

- (double)singlePagePadding
{
  void *v3;
  double v4;
  double v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewConfiguration context](self, "context"));
  -[BKThumbnailBookViewConfiguration floatForKey:context:](self, "floatForKey:context:", CFSTR("singlePagePadding"), v3);
  v5 = v4;

  return v5;
}

- (double)statusBarHeightForWindow:(id)a3
{
  id v4;
  double v5;
  void *v6;
  void *v7;
  double v8;

  v4 = a3;
  v5 = 0.0;
  if (!-[BKThumbnailBookViewConfiguration _isCompactHeight](self, "_isCompactHeight"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "windowScene"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "statusBarManager"));
    objc_msgSend(v7, "bc_defaultPortraitStatusBarHeight");
    v5 = v8;

  }
  return v5;
}

- (double)backgroundExtensionForWindow:(id)a3
{
  id v4;
  double v5;
  id WeakRetained;
  double v7;
  double v8;

  v4 = a3;
  v5 = 0.0;
  if (!-[BKThumbnailBookViewConfiguration _isCompactHeight](self, "_isCompactHeight"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_context);
    objc_msgSend(WeakRetained, "im_frameEnvironmentSafeAreaInsets");
    v5 = v7;

    if (fabs(v5) < 2.22044605e-16)
    {
      -[BKThumbnailBookViewConfiguration statusBarHeightForWindow:](self, "statusBarHeightForWindow:", v4);
      v5 = v8;
    }
  }

  return v5;
}

- (BOOL)_isCompactHeight
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewConfiguration context](self, "context"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "traitCollection"));
  v4 = objc_msgSend(v3, "verticalSizeClass") == (char *)&dword_0 + 1;

  return v4;
}

- (void)_setupDefault
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMConfigurationPredicate compactWidthPredicate](IMConfigurationPredicate, "compactWidthPredicate"));
  -[BKThumbnailBookViewConfiguration addWithPredicate:adder:](self, "addWithPredicate:adder:", v3, &stru_1BFC38);

  v4 = (id)objc_claimAutoreleasedReturnValue(+[IMConfigurationPredicate regularWidthPredicate](IMConfigurationPredicate, "regularWidthPredicate"));
  -[BKThumbnailBookViewConfiguration addWithPredicate:adder:](self, "addWithPredicate:adder:", v4, &stru_1BFC58);

}

- (void)_setupCompactWidth
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[IMConfigurationPredicate compactWidthPredicate](IMConfigurationPredicate, "compactWidthPredicate"));
  -[BKThumbnailBookViewConfiguration addWithPredicate:adder:](self, "addWithPredicate:adder:", v3, &stru_1BFC78);

}

- (void)_setupRegularWidth
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[IMConfigurationPredicate regularWidthPredicate](IMConfigurationPredicate, "regularWidthPredicate"));
  -[BKThumbnailBookViewConfiguration addWithPredicate:adder:](self, "addWithPredicate:adder:", v3, &stru_1BFCD8);

}

- (IMFrameEnvironment)context
{
  return (IMFrameEnvironment *)objc_loadWeakRetained((id *)&self->_context);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_context);
}

@end
