@implementation MobileCalWindow

- (MobileCalWindow)init
{
  MobileCalWindow *v2;
  void *v3;
  id v4;
  objc_super v6;
  _QWORD v7[2];

  v6.receiver = self;
  v6.super_class = (Class)MobileCalWindow;
  v2 = -[MobileCalWindow init](&v6, "init");
  if (v2)
  {
    v7[0] = objc_opt_class(UITraitHorizontalSizeClass);
    v7[1] = objc_opt_class(UITraitVerticalSizeClass);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v7, 2));
    v4 = -[MobileCalWindow registerForTraitChanges:withHandler:](v2, "registerForTraitChanges:withHandler:", v3, &stru_1001B4B18);

  }
  return v2;
}

- (CGSize)mainContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  char isKindOfClass;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  -[MobileCalWindow bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MobileCalWindow rootViewController](self, "rootViewController"));
  objc_opt_class(MainWindowRootViewController);
  isKindOfClass = objc_opt_isKindOfClass(v7, v8);

  if ((isKindOfClass & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MobileCalWindow rootViewController](self, "rootViewController"));
    objc_msgSend(v10, "mainContentSize");
    v12 = v11;
    v14 = v13;

    if (v12 != CGSizeZero.width || v14 != CGSizeZero.height)
    {
      v6 = v14;
      v4 = v12;
    }
  }
  v15 = v4;
  v16 = v6;
  result.height = v16;
  result.width = v15;
  return result;
}

@end
