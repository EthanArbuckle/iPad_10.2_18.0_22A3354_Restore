@implementation SBLoginAppContainerPluginWrapperView

- (SBLoginAppContainerPluginWrapperView)initWithFrame:(CGRect)a3 overlayWrapperView:(id)a4 pluginView:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v12;
  id v13;
  SBLoginAppContainerPluginWrapperView *v14;
  SBLoginAppContainerPluginWrapperView *v15;
  objc_super v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12 = a4;
  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SBLoginAppContainerPluginWrapperView;
  v14 = -[SBLoginAppContainerPluginWrapperView initWithFrame:](&v17, sel_initWithFrame_, x, y, width, height);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_overlayWrapperView, a4);
    objc_storeStrong((id *)&v15->_pluginView, a5);
    -[SBLoginAppContainerPluginWrapperView addSubview:](v15, "addSubview:", v12);
    -[SBLoginAppContainerPluginWrapperView addSubview:](v15, "addSubview:", v13);
  }

  return v15;
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

  -[SBLoginAppContainerPluginWrapperView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIView setFrame:](self->_overlayWrapperView, "setFrame:");
  -[UIView setFrame:](self->_pluginView, "setFrame:", v4, v6, v8, v10);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pluginView, 0);
  objc_storeStrong((id *)&self->_overlayWrapperView, 0);
}

@end
