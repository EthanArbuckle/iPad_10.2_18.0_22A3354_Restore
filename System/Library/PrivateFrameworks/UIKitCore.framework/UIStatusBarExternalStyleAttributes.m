@implementation UIStatusBarExternalStyleAttributes

- (int64_t)idiom
{
  return 3;
}

- (double)heightForMetrics:(int64_t)a3
{
  return 44.0;
}

- (id)backgroundImageName
{
  return 0;
}

- (Class)foregroundStyleClass
{
  if (-[UIStatusBarStyleAttributes style](self, "style") != 401
    && -[UIStatusBarStyleAttributes style](self, "style") != 402)
  {
    -[UIStatusBarStyleAttributes style](self, "style");
  }
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)shouldShowInternalItemType:(int)a3 withScreenCapabilities:(id)a4
{
  uint64_t v4;
  id v6;
  BOOL v7;
  objc_super v9;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  if ((_DWORD)v4 == 46)
    goto LABEL_5;
  if ((_DWORD)v4 != 48)
  {
    if ((_DWORD)v4 == 47 && -[UIStatusBarStyleAttributes style](self, "style") == 402)
      goto LABEL_5;
LABEL_7:
    v9.receiver = self;
    v9.super_class = (Class)UIStatusBarExternalStyleAttributes;
    v7 = -[UIStatusBarStyleAttributes shouldShowInternalItemType:withScreenCapabilities:](&v9, sel_shouldShowInternalItemType_withScreenCapabilities_, v4, v6);
    goto LABEL_8;
  }
  if (-[UIStatusBarStyleAttributes style](self, "style") != 403)
    goto LABEL_7;
LABEL_5:
  v7 = 1;
LABEL_8:

  return v7;
}

- (int64_t)tapButtonType
{
  objc_super v4;

  if (-[UIStatusBarStyleAttributes style](self, "style") == 402)
    return 2;
  if (-[UIStatusBarStyleAttributes style](self, "style") == 403)
    return 3;
  v4.receiver = self;
  v4.super_class = (Class)UIStatusBarExternalStyleAttributes;
  return -[UIStatusBarStyleAttributes tapButtonType](&v4, sel_tapButtonType);
}

@end
