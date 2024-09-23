@implementation _TVRUIDevicePickerView

- (id)_initWithViewController:(id)a3
{
  id v4;
  _TVRUIDevicePickerView *v5;
  _TVRUIDevicePickerView *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_TVRUIDevicePickerView;
  v5 = -[_TVRUIDevicePickerView init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_viewController, v4);
    -[_TVRUIDevicePickerView layer](v6, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAllowsGroupOpacity:", 0);

    -[_TVRUIDevicePickerView layer](v6, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAllowsGroupBlending:", 0);

  }
  return v6;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  int v9;
  BOOL v10;
  void *v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  void *v21;
  void *v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat width;
  CGFloat height;
  void *v31;
  void *v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  NSObject *v41;
  void *v42;
  void *v43;
  objc_super v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  uint64_t v50;
  CGPoint v51;
  CGPoint v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;

  y = a3.y;
  x = a3.x;
  v50 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  -[_TVRUIDevicePickerView viewController](self, "viewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isDevicePickerShowing");

  if (v9)
  {
    v45.receiver = self;
    v45.super_class = (Class)_TVRUIDevicePickerView;
    v10 = -[_TVRUIDevicePickerView pointInside:withEvent:](&v45, sel_pointInside_withEvent_, v7, x, y);
  }
  else
  {
    -[_TVRUIDevicePickerView viewController](self, "viewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "muteButton");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "frame");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    -[_TVRUIDevicePickerView viewController](self, "viewController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "deviceTitleView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "frame");
    v59.origin.x = v23;
    v59.origin.y = v24;
    v59.size.width = v25;
    v59.size.height = v26;
    v53.origin.x = v14;
    v53.origin.y = v16;
    v53.size.width = v18;
    v53.size.height = v20;
    v54 = CGRectUnion(v53, v59);
    v27 = v54.origin.x;
    v28 = v54.origin.y;
    width = v54.size.width;
    height = v54.size.height;

    -[_TVRUIDevicePickerView viewController](self, "viewController");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "powerButton");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "frame");
    v60.origin.x = v33;
    v60.origin.y = v34;
    v60.size.width = v35;
    v60.size.height = v36;
    v55.origin.x = v27;
    v55.origin.y = v28;
    v55.size.width = width;
    v55.size.height = height;
    v56 = CGRectUnion(v55, v60);
    v37 = v56.origin.x;
    v38 = v56.origin.y;
    v39 = v56.size.width;
    v40 = v56.size.height;

    v57.origin.x = v37;
    v57.origin.y = v38;
    v57.size.width = v39;
    v57.size.height = v40;
    v52.x = x;
    v52.y = y;
    if (CGRectContainsPoint(v57, v52))
    {
      _TVRUIDevicePickerLog();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        v58.origin.x = v37;
        v58.origin.y = v38;
        v58.size.width = v39;
        v58.size.height = v40;
        NSStringFromCGRect(v58);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v51.x = x;
        v51.y = y;
        NSStringFromCGPoint(v51);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v47 = v42;
        v48 = 2112;
        v49 = v43;
        _os_log_impl(&dword_21B042000, v41, OS_LOG_TYPE_DEFAULT, "boundingRect: %@ point: %@", buf, 0x16u);

      }
      v10 = 1;
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (TVRUIDevicePickerViewController)viewController
{
  return (TVRUIDevicePickerViewController *)objc_loadWeakRetained((id *)&self->_viewController);
}

- (void)setViewController:(id)a3
{
  objc_storeWeak((id *)&self->_viewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewController);
}

@end
