@implementation WFHotspotDetailsView

- (WFHotspotDetailsView)initWithFrame:(CGRect)a3
{
  WFHotspotDetailsView *v3;
  WFHotspotDetailsView *v4;
  NSString *cellularProtocolString;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFHotspotDetailsView;
  v3 = -[WFHotspotDetailsView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_signalBars = 0;
    cellularProtocolString = v3->_cellularProtocolString;
    v3->_cellularProtocolString = (NSString *)&stru_24DB39F78;

    v4->_batteryCharge = 0;
  }
  -[WFHotspotDetailsView setupSubviews](v4, "setupSubviews");
  return v4;
}

- (WFHotspotDetailsView)initWithCoder:(id)a3
{
  WFHotspotDetailsView *v3;
  WFHotspotDetailsView *v4;
  NSString *cellularProtocolString;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFHotspotDetailsView;
  v3 = -[WFHotspotDetailsView initWithCoder:](&v7, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_signalBars = 0;
    cellularProtocolString = v3->_cellularProtocolString;
    v3->_cellularProtocolString = (NSString *)&stru_24DB39F78;

    v4->_batteryCharge = 0;
  }
  -[WFHotspotDetailsView setupSubviews](v4, "setupSubviews");
  return v4;
}

- (CGSize)intrinsicContentSize
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  uint64_t i;
  void *v10;
  double Width;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;
  CGSize result;
  CGRect v25;

  v23 = *MEMORY[0x24BDAC8D0];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[WFHotspotDetailsView arrangedSubviews](self, "arrangedSubviews", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    v7 = 0.0;
    v8 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v10, "intrinsicContentSize");
        v13 = v12;
        if (Width == 0.0)
        {
          objc_msgSend(v10, "frame");
          Width = CGRectGetWidth(v25);
        }
        v14 = v8 + Width;
        -[WFHotspotDetailsView spacing](self, "spacing");
        v8 = v14 + v15;
        if (v7 < v13)
          v7 = v13;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0.0;
    v8 = 0.0;
  }

  v16 = v8;
  v17 = v7;
  result.height = v17;
  result.width = v16;
  return result;
}

- (void)setupSubviews
{
  void *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  -[WFHotspotDetailsView setSpacing:](self, "setSpacing:", 4.0);
  -[WFHotspotDetailsView setAlignment:](self, "setAlignment:", 3);
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHotspotDetailsView setBackgroundColor:](self, "setBackgroundColor:", v3);

  v4 = objc_alloc(MEMORY[0x24BEBD668]);
  v5 = *MEMORY[0x24BDBF090];
  v6 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v7 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v8 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v9 = (void *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], v6, v7, v8);
  -[WFHotspotDetailsView setSignalImageView:](self, "setSignalImageView:", v9);

  -[WFHotspotDetailsView signalImageView](self, "signalImageView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHotspotDetailsView addArrangedSubview:](self, "addArrangedSubview:", v10);

  -[WFHotspotDetailsView updateSignalBars](self, "updateSignalBars");
  -[WFHotspotDetailsView signalImageView](self, "signalImageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BDD1628];
  -[WFHotspotDetailsView signalImageView](self, "signalImageView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v13, 7, 0, 0, 0, 1.0, 17.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addConstraint:", v14);

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD708]), "initWithFrame:", v5, v6, v7, v8);
  -[WFHotspotDetailsView setNetworkTypeLabel:](self, "setNetworkTypeLabel:", v15);

  -[WFHotspotDetailsView updateCellularProtocolLabel](self, "updateCellularProtocolLabel");
  -[WFHotspotDetailsView networkTypeLabel](self, "networkTypeLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHotspotDetailsView addArrangedSubview:](self, "addArrangedSubview:", v16);

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB88]), "initWithSizeCategory:", 0);
  -[WFHotspotDetailsView setBatteryView:](self, "setBatteryView:", v17);

  v18 = (double)-[WFHotspotDetailsView batteryCharge](self, "batteryCharge") / 100.0;
  -[WFHotspotDetailsView batteryView](self, "batteryView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setChargePercent:", v18);

  -[WFHotspotDetailsView batteryView](self, "batteryView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setNeedsLayout");

  -[WFHotspotDetailsView batteryView](self, "batteryView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHotspotDetailsView addArrangedSubview:](self, "addArrangedSubview:", v21);

  -[WFHotspotDetailsView batteryView](self, "batteryView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "intrinsicContentSize");
  v24 = v23;

  -[WFHotspotDetailsView batteryView](self, "batteryView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)MEMORY[0x24BDD1628];
  -[WFHotspotDetailsView batteryView](self, "batteryView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v27, 7, 0, 0, 0, 1.0, v24);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addConstraint:", v28);

  -[WFHotspotDetailsView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)setCellularProtocolString:(id)a3
{
  objc_storeStrong((id *)&self->_cellularProtocolString, a3);
  -[WFHotspotDetailsView updateCellularProtocolLabel](self, "updateCellularProtocolLabel");
}

- (void)updateCellularProtocolLabel
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
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
  CGRect v18;

  if (self->_cellularProtocolString)
  {
    -[WFHotspotDetailsView attributedStringFromCellularProtocol:](self, "attributedStringFromCellularProtocol:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFHotspotDetailsView networkTypeLabel](self, "networkTypeLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAttributedText:", v3);

  }
  else
  {
    -[WFHotspotDetailsView networkTypeLabel](self, "networkTypeLabel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setText:", &stru_24DB39F78);
  }

  -[WFHotspotDetailsView networkTypeLabel](self, "networkTypeLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = 1148846080;
  objc_msgSend(v5, "setContentHuggingPriority:forAxis:", 0, v6);

  -[WFHotspotDetailsView networkTypeLabel](self, "networkTypeLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraints");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[WFHotspotDetailsView networkTypeLabel](self, "networkTypeLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFHotspotDetailsView networkTypeLabel](self, "networkTypeLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraints");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeConstraints:", v11);

  }
  -[WFHotspotDetailsView networkTypeLabel](self, "networkTypeLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sizeToFit");

  -[WFHotspotDetailsView networkTypeLabel](self, "networkTypeLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x24BDD1628];
  -[WFHotspotDetailsView networkTypeLabel](self, "networkTypeLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHotspotDetailsView networkTypeLabel](self, "networkTypeLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "frame");
  objc_msgSend(v14, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v15, 7, 0, 0, 0, 1.0, CGRectGetWidth(v18) + 1.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addConstraint:", v17);

  -[WFHotspotDetailsView sizeToFit](self, "sizeToFit");
  -[WFHotspotDetailsView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (id)attributedStringFromCellularProtocol:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x24BDD1688];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithString:", v4);

  objc_msgSend(v5, "addAttribute:value:range:", *MEMORY[0x24BEBB378], &unk_24DB59F98, 0, objc_msgSend(v5, "length"));
  v6 = *MEMORY[0x24BEBB360];
  objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 14.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAttribute:value:range:", v6, v7, 0, objc_msgSend(v5, "length"));

  return v5;
}

- (void)setSignalBars:(unint64_t)a3
{
  unint64_t v4;

  v4 = 5;
  if (a3 < 5)
    v4 = a3;
  self->_signalBars = v4;
  -[WFHotspotDetailsView updateSignalBars](self, "updateSignalBars");
  -[WFHotspotDetailsView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)setBatteryCharge:(unint64_t)a3
{
  double v3;
  id v4;

  self->_batteryCharge = a3;
  v3 = (double)a3 / 100.0;
  -[WFHotspotDetailsView batteryView](self, "batteryView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setChargePercent:", v3);

}

- (void)updateSignalBars
{
  unint64_t signalBars;
  unint64_t v4;
  __CFString **v5;
  void *v7;
  uint64_t v8;
  void *v9;
  UIImageView *signalImageView;
  void *v11;
  UIImageView *v12;
  void *v13;
  id v14;
  id v15;

  signalBars = self->_signalBars;
  v4 = 5;
  if (signalBars < 5)
    v4 = self->_signalBars;
  if (v4 >= 4)
  {
    if (v4 != 4 && signalBars <= 4)
    {
      v14 = 0;
      goto LABEL_12;
    }
    v5 = kWFImageCellularBars4;
  }
  else
  {
    v5 = off_24DB37B38[v4];
  }
  +[WFImageCache sharedImageCache](WFImageCache, "sharedImageCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageNamed:", *v5);
  v14 = (id)objc_claimAutoreleasedReturnValue();

LABEL_12:
  if (-[WFHotspotDetailsView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
  {
    objc_msgSend(v14, "imageFlippedForRightToLeftLayoutDirection");
    v8 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v8;
  }
  else
  {
    v9 = v14;
  }
  signalImageView = self->_signalImageView;
  v15 = v9;
  objc_msgSend(v9, "imageWithRenderingMode:", 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](signalImageView, "setImage:", v11);

  v12 = self->_signalImageView;
  objc_msgSend(MEMORY[0x24BEBD4B8], "defaultTextColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setTintColor:](v12, "setTintColor:", v13);

  -[UIImageView sizeToFit](self->_signalImageView, "sizeToFit");
}

- (unint64_t)batteryCharge
{
  return self->_batteryCharge;
}

- (NSString)cellularProtocolString
{
  return self->_cellularProtocolString;
}

- (unint64_t)signalBars
{
  return self->_signalBars;
}

- (_UIBatteryView)batteryView
{
  return self->_batteryView;
}

- (void)setBatteryView:(id)a3
{
  objc_storeStrong((id *)&self->_batteryView, a3);
}

- (UIImageView)signalImageView
{
  return self->_signalImageView;
}

- (void)setSignalImageView:(id)a3
{
  objc_storeStrong((id *)&self->_signalImageView, a3);
}

- (UILabel)networkTypeLabel
{
  return self->_networkTypeLabel;
}

- (void)setNetworkTypeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_networkTypeLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkTypeLabel, 0);
  objc_storeStrong((id *)&self->_signalImageView, 0);
  objc_storeStrong((id *)&self->_batteryView, 0);
  objc_storeStrong((id *)&self->_cellularProtocolString, 0);
}

@end
