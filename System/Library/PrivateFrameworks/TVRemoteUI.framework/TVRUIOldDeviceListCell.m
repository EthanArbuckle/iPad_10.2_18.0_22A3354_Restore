@implementation TVRUIOldDeviceListCell

- (TVRUIOldDeviceListCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  TVRUIOldDeviceListCell *v4;
  void *v5;
  void *v6;
  UIView *v7;
  UIView *separator;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TVRUIOldDeviceListCell;
  v4 = -[TVRUIOldDeviceListCell initWithStyle:reuseIdentifier:](&v10, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIOldDeviceListCell setBackgroundColor:](v4, "setBackgroundColor:", v5);

    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIOldDeviceListCell setTintColor:](v4, "setTintColor:", v6);

    v7 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    separator = v4->_separator;
    v4->_separator = v7;

    -[TVRUIOldDeviceListCell addSubview:](v4, "addSubview:", v4->_separator);
  }
  return v4;
}

- (void)setDevice:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  TVRUIDevice *v12;

  v12 = (TVRUIDevice *)a3;
  if (self->_device != v12)
  {
    objc_storeStrong((id *)&self->_device, a3);
    -[TVRUIOldDeviceListCell imageView](self, "imageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIOldDeviceListCell textLabel](self, "textLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIDevice name](v12, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", v7);

    -[TVRUIDevice model](v12, "model");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIOldDeviceListCell styleProvider](self, "styleProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "iconForDeviceModel:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "_imageThatSuppressesAccessibilityHairlineThickening");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setImage:", v11);
    objc_msgSend(v5, "setContentMode:", 1);

  }
  -[TVRUIOldDeviceListCell _applyFilterForDevice:](self, "_applyFilterForDevice:", v12);

}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double MinX;
  double v13;
  double Width;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  objc_super v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  v20.receiver = self;
  v20.super_class = (Class)TVRUIOldDeviceListCell;
  -[TVRUIOldDeviceListCell layoutSubviews](&v20, sel_layoutSubviews);
  -[TVRUIOldDeviceListCell textLabel](self, "textLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  if (self->_showSeparator)
  {
    v21.origin.x = v5;
    v21.origin.y = v7;
    v21.size.width = v9;
    v21.size.height = v11;
    MinX = CGRectGetMinX(v21);
    -[TVRUIOldDeviceListCell bounds](self, "bounds");
    v13 = CGRectGetHeight(v22) + -1.0;
    -[TVRUIOldDeviceListCell bounds](self, "bounds");
    Width = CGRectGetWidth(v23);
    v24.origin.x = v5;
    v24.origin.y = v7;
    v24.size.width = v9;
    v24.size.height = v11;
    v15 = Width - CGRectGetMinX(v24);
    -[TVRUIOldDeviceListCell styleProvider](self, "styleProvider");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "touchpadInsets");
    v18 = v15 - v17;

    v19 = 1.0;
  }
  else
  {
    MinX = *MEMORY[0x24BDBF090];
    v13 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v18 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v19 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }
  -[UIView setFrame:](self->_separator, "setFrame:", MinX, v13, v18, v19);
}

- (void)_applyFilterForDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  UIView *separator;
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
  id v19;

  v4 = a3;
  -[TVRUIOldDeviceListCell imageView](self, "imageView");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  -[TVRUIOldDeviceListCell textLabel](self, "textLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIOldDeviceListCell styleProvider](self, "styleProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fontForDeviceListRow");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v7);

  separator = self->_separator;
  -[TVRUIOldDeviceListCell styleProvider](self, "styleProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cellSeparatorBackgroundColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](separator, "setBackgroundColor:", v10);

  -[TVRUIOldDeviceListCell styleProvider](self, "styleProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "cellBackgroundColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIOldDeviceListCell setBackgroundColor:](self, "setBackgroundColor:", v12);

  LODWORD(v11) = objc_msgSend(v4, "isConnected");
  if ((_DWORD)v11)
  {
    -[TVRUIOldDeviceListCell setAccessoryType:](self, "setAccessoryType:", 3);
    -[TVRUIOldDeviceListCell styleProvider](self, "styleProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "colorForConnectedDevice");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTextColor:", v14);

    -[TVRUIOldDeviceListCell styleProvider](self, "styleProvider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "colorForConnectedDevice");
  }
  else
  {
    -[TVRUIOldDeviceListCell setAccessoryType:](self, "setAccessoryType:", 0);
    -[TVRUIOldDeviceListCell styleProvider](self, "styleProvider");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "colorForDisconnectedDevice");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTextColor:", v17);

    -[TVRUIOldDeviceListCell styleProvider](self, "styleProvider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "colorForDisconnectedDevice");
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setTintColor:", v18);

}

- (TVRUIDevice)device
{
  return self->_device;
}

- (BOOL)showSeparator
{
  return self->_showSeparator;
}

- (void)setShowSeparator:(BOOL)a3
{
  self->_showSeparator = a3;
}

- (TVRUIStyleProvider)styleProvider
{
  return self->_styleProvider;
}

- (void)setStyleProvider:(id)a3
{
  objc_storeStrong((id *)&self->_styleProvider, a3);
}

- (UIView)separator
{
  return self->_separator;
}

- (void)setSeparator:(id)a3
{
  objc_storeStrong((id *)&self->_separator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separator, 0);
  objc_storeStrong((id *)&self->_styleProvider, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
