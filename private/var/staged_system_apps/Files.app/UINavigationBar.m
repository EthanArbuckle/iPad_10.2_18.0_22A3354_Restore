@implementation UINavigationBar

- (void)effectiveAppearanceDidChange:(id)a3
{
  id v4;
  id v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UINavigationBar;
  v4 = -[UINavigationBar effectiveAppearanceDidChange:](&v7, "effectiveAppearanceDidChange:", a3);
  if ((_UIBarsApplyChromelessEverywhere(v4) & 1) == 0)
  {
    v5 = objc_alloc_init((Class)UINavigationBarAppearance);
    objc_msgSend(v5, "configureWithDefaultBackground");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 4));
    objc_msgSend(v5, "setBackgroundEffect:", v6);

    -[UINavigationBar setStandardAppearance:](self, "setStandardAppearance:", v5);
  }
  -[UINavigationBar _updateLargeTitleTextAttributes](self, "_updateLargeTitleTextAttributes");
}

- (void)_updateLargeTitleTextAttributes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSAttributedStringKey v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationBar tintColor](self, "tintColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationBar _largeTitleColorForTintColor:](self, "_largeTitleColorForTintColor:", v3));

  if (v4)
  {
    v10 = NSForegroundColorAttributeName;
    v11 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationBar standardAppearance](self, "standardAppearance"));
    objc_msgSend(v6, "setLargeTitleTextAttributes:", v5);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationBar scrollEdgeAppearance](self, "scrollEdgeAppearance"));
    objc_msgSend(v7, "setLargeTitleTextAttributes:", v5);

  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationBar standardAppearance](self, "standardAppearance"));
    objc_msgSend(v8, "setLargeTitleTextAttributes:", &__NSDictionary0__struct);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationBar scrollEdgeAppearance](self, "scrollEdgeAppearance"));
    objc_msgSend(v9, "setLargeTitleTextAttributes:", &__NSDictionary0__struct);

  }
}

- (id)_largeTitleColorForTintColor:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor linkColor](UIColor, "linkColor"));
  if ((objc_msgSend(v3, "isEqual:", v4) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
    if ((objc_msgSend(v3, "isEqual:", v6) & 1) != 0)
    {
      v5 = 0;
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemDarkBlueColor](UIColor, "systemDarkBlueColor"));
      if (objc_msgSend(v3, "isEqual:", v7))
        v5 = 0;
      else
        v5 = v3;

    }
  }

  v8 = v5;
  return v8;
}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UINavigationBar;
  -[UINavigationBar tintColorDidChange](&v3, "tintColorDidChange");
  -[UINavigationBar _updateLargeTitleTextAttributes](self, "_updateLargeTitleTextAttributes");
}

@end
