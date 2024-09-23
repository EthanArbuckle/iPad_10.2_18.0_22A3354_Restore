@implementation ICQDeviceIdentificationView

+ (void)initialize
{
  void *v2;
  int v3;
  double v4;
  double v5;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sf_isiPad");

  v4 = 20.0;
  if (v3)
    v4 = 25.0;
  v5 = 3.0;
  if (v3)
    v5 = 10.0;
  kTopMargin = *(_QWORD *)&v4;
  kBottomMargin = 0x4014000000000000;
  kImageTextPadding = *(_QWORD *)&v5;
}

- (ICQDeviceIdentificationView)initWithFrame:(CGRect)a3 deviceName:(id)a4 deviceIdentifier:(id)a5 imageURL:(id)a6 isCurrentDevice:(BOOL)a7
{
  _BOOL4 v7;
  double height;
  double width;
  double y;
  double x;
  id v15;
  id v16;
  id v17;
  ICQDeviceIdentificationView *v18;
  void *v19;
  UIImageView *v20;
  UIImageView *deviceImageView;
  UILabel *v22;
  UILabel *deviceNameLabel;
  UILabel *v24;
  void *v25;
  UILabel *v26;
  void *v27;
  UILabel *v28;
  void *v29;
  UILabel *v30;
  UILabel *deviceModelLabel;
  UILabel *v32;
  void *v33;
  UILabel *v34;
  void *v35;
  void *v36;
  void *v37;
  UILabel *v38;
  void *v39;
  UILabel *v40;
  void *v41;
  objc_super v43;

  v7 = a7;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v43.receiver = self;
  v43.super_class = (Class)ICQDeviceIdentificationView;
  v18 = -[ICQDeviceIdentificationView initWithFrame:](&v43, sel_initWithFrame_, x, y, width, height);
  if (v18)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQDeviceIdentificationView setBackgroundColor:](v18, "setBackgroundColor:", v19);

    *(_QWORD *)&v18->_topMargin = kTopMargin;
    *(_QWORD *)&v18->_bottomMargin = kBottomMargin;
    v18->_leftExtraMargin = 0.0;
    *(_QWORD *)&v18->_imageTextPadding = kImageTextPadding;
    v20 = (UIImageView *)objc_alloc_init(MEMORY[0x24BEBD668]);
    deviceImageView = v18->_deviceImageView;
    v18->_deviceImageView = v20;

    v22 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    deviceNameLabel = v18->_deviceNameLabel;
    v18->_deviceNameLabel = v22;

    v24 = v18->_deviceNameLabel;
    objc_msgSend(MEMORY[0x24BEBB520], "boldSystemFontOfSize:", 18.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v24, "setFont:", v25);

    -[UILabel setText:](v18->_deviceNameLabel, "setText:", v15);
    v26 = v18->_deviceNameLabel;
    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v26, "setTextColor:", v27);

    v28 = v18->_deviceNameLabel;
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v28, "setBackgroundColor:", v29);

    -[UILabel setLineBreakMode:](v18->_deviceNameLabel, "setLineBreakMode:", 4);
    -[UILabel setNumberOfLines:](v18->_deviceNameLabel, "setNumberOfLines:", 2);
    -[ICQDeviceIdentificationView addSubview:](v18, "addSubview:", v18->_deviceNameLabel);
    if (v7)
    {
      v30 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
      deviceModelLabel = v18->_deviceModelLabel;
      v18->_deviceModelLabel = v30;

      v32 = v18->_deviceModelLabel;
      objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 14.0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](v32, "setFont:", v33);

      v34 = v18->_deviceModelLabel;
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBD538], "modelSpecificLocalizedStringKeyForKey:", CFSTR("THIS_DEVICE"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "localizedStringForKey:value:table:", v36, &stru_24E400750, CFSTR("Backup"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setText:](v34, "setText:", v37);

      v38 = v18->_deviceModelLabel;
      objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](v38, "setTextColor:", v39);

      v40 = v18->_deviceModelLabel;
      objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setBackgroundColor:](v40, "setBackgroundColor:", v41);

      -[ICQDeviceIdentificationView addSubview:](v18, "addSubview:", v18->_deviceModelLabel);
    }
    -[ICQDeviceIdentificationView loadImageForDeviceIdentifier:URL:](v18, "loadImageForDeviceIdentifier:URL:", v16, v17);
    -[ICQDeviceIdentificationView addSubview:](v18, "addSubview:", v18->_deviceImageView);
  }

  return v18;
}

- (void)sizeToFit
{
  -[ICQDeviceIdentificationView bounds](self, "bounds");
  -[ICQDeviceIdentificationView setBounds:](self, "setBounds:");
}

- (void)setFrame:(CGRect)a3
{
  uint64_t v3;
  uint64_t v4;
  objc_super v5;
  uint64_t v6;
  uint64_t v7;

  if (a3.origin.x == 0.0)
  {
    v6 = v3;
    v7 = v4;
    v5.receiver = self;
    v5.super_class = (Class)ICQDeviceIdentificationView;
    -[ICQDeviceIdentificationView setFrame:](&v5, sel_setFrame_);
  }
}

- (void)loadImageForDeviceIdentifier:(id)a3 URL:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  _QWORD block[4];
  id v22;
  id v23;
  ICQDeviceIdentificationView *v24;
  id v25;

  v6 = a4;
  objc_msgSend(a3, "lowercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bundleIdentifier");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = (const __CFString *)v11;
  else
    v13 = &stru_24E400750;
  objc_msgSend(v9, "stringByAppendingPathComponent:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("deviceImage_%@.png"), v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringByAppendingPathComponent:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  dispatch_get_global_queue(0, 0);
  v17 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__ICQDeviceIdentificationView_loadImageForDeviceIdentifier_URL___block_invoke;
  block[3] = &unk_24E3F51A0;
  v22 = v16;
  v23 = v6;
  v24 = self;
  v25 = v14;
  v18 = v14;
  v19 = v6;
  v20 = v16;
  dispatch_async(v17, block);

}

void __64__ICQDeviceIdentificationView_loadImageForDeviceIdentifier_URL___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  int v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  uint64_t v12;
  id v13;

  if (a1[4]
    && (objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:"), (v2 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v3 = (void *)v2;
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:", a1[5]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 1;
  }
  objc_msgSend(MEMORY[0x24BEBD640], "imageWithData:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __64__ICQDeviceIdentificationView_loadImageForDeviceIdentifier_URL___block_invoke_2;
  v11 = &unk_24E3F34D8;
  v12 = a1[6];
  v6 = v5;
  v13 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], &v8);
  if (v4)
  {
    v7 = objc_alloc_init(MEMORY[0x24BDD1580]);
    objc_msgSend(v7, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", a1[7], 1, 0, 0, v8, v9, v10, v11, v12);
    objc_msgSend(v3, "writeToFile:atomically:", a1[4], 0);

  }
}

uint64_t __64__ICQDeviceIdentificationView_loadImageForDeviceIdentifier_URL___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setDeviceImage:", *(_QWORD *)(a1 + 40));
}

- (UIImage)deviceImage
{
  return -[UIImageView image](self->_deviceImageView, "image");
}

- (void)setDeviceImage:(id)a3
{
  -[UIImageView setImage:](self->_deviceImageView, "setImage:", a3);
  -[ICQDeviceIdentificationView setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  int v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  double Width;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  UILabel *deviceModelLabel;
  double v26;
  double v27;
  float v28;
  double v29;
  UILabel *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat rect;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;

  PSTableViewSideInset();
  v4 = v3;
  -[ICQDeviceIdentificationView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = -[ICQDeviceIdentificationView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  v14 = v4 + self->_leftExtraMargin;
  rect = v8;
  if (v13)
  {
    v39.origin.x = v6;
    v39.origin.y = v8;
    v39.size.width = v10;
    v39.size.height = v12;
    v14 = CGRectGetWidth(v39) + -60.0 - v14 - self->_leftExtraMargin;
  }
  -[UIImageView setFrame:](self->_deviceImageView, "setFrame:", v14, self->_topMargin, 60.0, 60.0);
  v15 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v16 = v4 + self->_leftExtraMargin + 60.0 + self->_imageTextPadding;
  v17 = v10 - v16;
  v36 = v6;
  if (v13)
  {
    v40.origin.x = v6;
    v40.origin.y = v8;
    v40.size.width = v10;
    v40.size.height = v12;
    Width = CGRectGetWidth(v40);
    v41.origin.x = v16;
    v41.origin.y = v15;
    v41.size.width = v10 - v16;
    v41.size.height = 1.79769313e308;
    v19 = Width - CGRectGetWidth(v41);
    v42.origin.x = v16;
    v42.origin.y = v15;
    v42.size.width = v10 - v16;
    v42.size.height = 1.79769313e308;
    v16 = v19 - CGRectGetMinX(v42);
  }
  v43.origin.x = v16;
  v43.origin.y = v15;
  v43.size.width = v17;
  v43.size.height = 1.79769313e308;
  v20 = CGRectGetWidth(v43);
  -[UILabel sizeThatFits:](self->_deviceNameLabel, "sizeThatFits:", v17, 1.79769313e308);
  v22 = v21;
  v24 = v23;
  if (v13)
  {
    v44.origin.x = v16;
    v44.origin.y = v15;
    v44.size.width = v22;
    v44.size.height = v24;
    v16 = v16 + v20 - CGRectGetWidth(v44);
  }
  deviceModelLabel = self->_deviceModelLabel;
  v26 = v24;
  if (deviceModelLabel)
  {
    -[UILabel sizeToFit](deviceModelLabel, "sizeToFit", v24);
    -[UILabel bounds](self->_deviceModelLabel, "bounds");
    v26 = v24 + v27;
  }
  v28 = self->_topMargin + (60.0 - v26) * 0.5;
  v29 = floorf(v28);
  -[UILabel setFrame:](self->_deviceNameLabel, "setFrame:", v16, v29, v22, v24, *(_QWORD *)&v36);
  v30 = self->_deviceModelLabel;
  if (v30)
  {
    -[UILabel bounds](v30, "bounds");
    v32 = v31;
    v34 = v33;
    v35 = self->_imageTextPadding + v4 + self->_leftExtraMargin + 60.0;
    if (v13)
    {
      v45.origin.x = v37;
      v45.origin.y = rect;
      v45.size.width = v10;
      v45.size.height = v12;
      v35 = CGRectGetWidth(v45) - v32 - v35;
    }
    -[UILabel setFrame:](self->_deviceModelLabel, "setFrame:", v35, v24 + v29, v32, v34);
  }
}

- (double)topMargin
{
  return self->_topMargin;
}

- (void)setTopMargin:(double)a3
{
  self->_topMargin = a3;
}

- (double)bottomMargin
{
  return self->_bottomMargin;
}

- (void)setBottomMargin:(double)a3
{
  self->_bottomMargin = a3;
}

- (double)leftExtraMargin
{
  return self->_leftExtraMargin;
}

- (void)setLeftExtraMargin:(double)a3
{
  self->_leftExtraMargin = a3;
}

- (double)imageTextPadding
{
  return self->_imageTextPadding;
}

- (void)setImageTextPadding:(double)a3
{
  self->_imageTextPadding = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceModelLabel, 0);
  objc_storeStrong((id *)&self->_deviceNameLabel, 0);
  objc_storeStrong((id *)&self->_deviceImageView, 0);
}

@end
