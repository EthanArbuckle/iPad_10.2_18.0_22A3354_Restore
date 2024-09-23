@implementation SBHDebugIconViewController

- (SBHDebugIconViewController)initWithIcon:(id)a3
{
  id v5;
  SBHDebugIconViewController *v6;
  SBHDebugIconViewController *v7;

  v5 = a3;
  v6 = -[SBHDebugIconViewController initWithNibName:bundle:](self, "initWithNibName:bundle:", 0, 0);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_icon, a3);

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  uint32_t v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBHDebugIconViewController;
  -[SBHDebugIconViewController viewDidLoad](&v10, sel_viewDidLoad);
  -[SBHDebugIconViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHDebugIconViewController icon](self, "icon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = (double)(objc_msgSend(v5, "hash") % 0xFFuLL) / 255.0;
  }
  else
  {
    v8 = arc4random();
    v7 = (double)v8 / 4294967300.0 + (1.0 - (double)v8 / 4294967300.0) * 0.0;
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithHue:saturation:brightness:alpha:", v7, 0.8, 0.8, 1.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v9);

}

- (void)setIconImageInfo:(SBIconImageInfo *)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  SBIconImageInfo *p_iconImageInfo;
  id v13;

  v7 = v6;
  v8 = v5;
  v9 = v4;
  v10 = v3;
  p_iconImageInfo = &self->_iconImageInfo;
  if (!SBIconImageInfoEqualToIconImageInfo(v3, v4, v5, v6, self->_iconImageInfo.size.width, self->_iconImageInfo.size.height, self->_iconImageInfo.scale, self->_iconImageInfo.continuousCornerRadius))
  {
    p_iconImageInfo->size.width = v10;
    p_iconImageInfo->size.height = v9;
    p_iconImageInfo->scale = v8;
    p_iconImageInfo->continuousCornerRadius = v7;
    if (-[SBHDebugIconViewController isViewLoaded](self, "isViewLoaded"))
    {
      -[SBHDebugIconViewController view](self, "view");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_setContinuousCornerRadius:", v7);

    }
  }
}

- (CGRect)visibleBounds
{
  void *v2;
  double v3;
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
  CGRect result;

  -[SBHDebugIconViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (SBIcon)icon
{
  return self->_icon;
}

- (SBIconImageInfo)iconImageInfo
{
  return self;
}

- (double)continuousCornerRadius
{
  return self->_continuousCornerRadius;
}

- (BOOL)showsSquareCorners
{
  return self->_showsSquareCorners;
}

- (void)setShowsSquareCorners:(BOOL)a3
{
  self->_showsSquareCorners = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icon, 0);
}

@end
