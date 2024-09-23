@implementation WFNetworkListCell

- (void)awakeFromNib
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
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
  void *v18;
  void *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)WFNetworkListCell;
  -[WFNetworkListCell awakeFromNib](&v20, sel_awakeFromNib);
  -[WFNetworkListCell nameLabel](self, "nameLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNumberOfLines:", 0);

  -[WFNetworkListCell nameLabel](self, "nameLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNetworkListCell _updateTextColorForLabel:](self, "_updateTextColorForLabel:", v4);

  -[WFNetworkListCell subtitleLabel](self, "subtitleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNumberOfLines:", 0);

  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForStyle:weight:", *MEMORY[0x24BEBE1E0], *MEMORY[0x24BEBB608]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNetworkListCell subtitleLabel](self, "subtitleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v6);

  -[WFNetworkListCell subtitleLabel](self, "subtitleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNetworkListCell _updateTextColorForLabel:](self, "_updateTextColorForLabel:", v8);

  -[WFNetworkListCell setState:](self, "setState:", 0);
  -[WFNetworkListCell lockImageView](self, "lockImageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHidden:", 1);

  +[WFImageCache sharedImageCache](WFImageCache, "sharedImageCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "imageNamed:", CFSTR("Lock"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "imageWithRenderingMode:", 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNetworkListCell lockImageView](self, "lockImageView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setImage:", v12);

  -[WFNetworkListCell lockImageView](self, "lockImageView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNetworkListCell _updateTintColorForImageView:](self, "_updateTintColorForImageView:", v14);

  -[WFNetworkListCell signalImageView](self, "signalImageView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setHidden:", 1);

  -[WFNetworkListCell imageFromSignalBars:](self, "imageFromSignalBars:", 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "imageWithRenderingMode:", 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNetworkListCell signalImageView](self, "signalImageView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setImage:", v17);

  -[WFNetworkListCell signalImageView](self, "signalImageView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNetworkListCell _updateTintColorForImageView:](self, "_updateTintColorForImageView:", v19);

  -[WFNetworkListCell _adjustStackViewPadding](self, "_adjustStackViewPadding");
}

- (void)_adjustStackViewPadding
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  id v8;

  -[WFNetworkListCell _verticalPadding](self, "_verticalPadding");
  v4 = v3 + -8.0;
  -[WFNetworkListCell stackViewTopConstraint](self, "stackViewTopConstraint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setConstant:", v4);

  -[WFNetworkListCell _verticalPadding](self, "_verticalPadding");
  v7 = v6 + -8.0;
  -[WFNetworkListCell stackViewBottomConstraint](self, "stackViewBottomConstraint");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setConstant:", v7);

}

- (double)_verticalPadding
{
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;

  -[WFNetworkListCell nameLabel](self, "nameLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "font");
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v4, "_bodyLeading");
  v6 = v5 * 0.5;

  -[WFNetworkListCell subtitleLabel](self, "subtitleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v7, "isHidden");

  if ((v4 & 1) == 0)
  {
    -[WFNetworkListCell subtitleLabel](self, "subtitleLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "font");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_bodyLeading");
    v6 = v6 + v10 * -0.5;

    if (v6 < 0.0)
      return 0.0;
  }
  return v6;
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  double v8;
  id v9;

  objc_msgSend(a3, "preferredContentSizeCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNetworkListCell traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqualToString:", v6);

  if ((v7 & 1) == 0)
  {
    -[WFNetworkListCell _adjustStackViewPadding](self, "_adjustStackViewPadding");
    -[WFNetworkListCell subtitleLabel](self, "subtitleLabel");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = 1.0;
    objc_msgSend(v9, "_setHyphenationFactor:", v8);

  }
}

- (void)setState:(int64_t)a3
{
  id v4;

  -[WFNetworkListCell associationStateView](self, "associationStateView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setState:", a3);

}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFNetworkListCell;
  -[WFNetworkListCell prepareForReuse](&v4, sel_prepareForReuse);
  -[WFNetworkListCell setTitle:](self, "setTitle:", 0);
  -[WFNetworkListCell setSubtitle:](self, "setSubtitle:", 0);
  -[WFNetworkListCell lockImageView](self, "lockImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  -[WFNetworkListCell setState:](self, "setState:", 0);
  -[WFNetworkListCell setAccessoryType:](self, "setAccessoryType:", 0);
  self->_bars = -1;
  -[WFNetworkListCell setConnectionError:](self, "setConnectionError:", 0);
  -[WFNetworkListCell setPersonalHotspot:](self, "setPersonalHotspot:", 0);
  -[WFNetworkListCell setSecure:](self, "setSecure:", 0);
}

- (void)setTitle:(id)a3
{
  id v5;
  id WeakRetained;

  objc_storeStrong((id *)&self->_title, a3);
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_nameLabel);
  objc_msgSend(WeakRetained, "setText:", v5);

}

- (void)setSubtitle:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  objc_storeStrong((id *)&self->_subtitle, a3);
  -[WFNetworkListCell subtitleLabel](self, "subtitleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(v5, "setHidden:", 0);

    -[WFNetworkListCell subtitleLabel](self, "subtitleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", v14);

    if (-[WFNetworkListCell connectionError](self, "connectionError"))
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "systemOrangeColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFNetworkListCell subtitleLabel](self, "subtitleLabel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTextColor:", v7);

      v9 = (void *)MEMORY[0x24BEBB520];
      v10 = *MEMORY[0x24BEBE1E0];
      v11 = (double *)MEMORY[0x24BEBB600];
    }
    else
    {
      -[WFNetworkListCell subtitleLabel](self, "subtitleLabel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFNetworkListCell _updateTextColorForLabel:](self, "_updateTextColorForLabel:", v12);

      v9 = (void *)MEMORY[0x24BEBB520];
      v10 = *MEMORY[0x24BEBE1E0];
      v11 = (double *)MEMORY[0x24BEBB608];
    }
    objc_msgSend(v9, "preferredFontForStyle:weight:", v10, *v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFNetworkListCell subtitleLabel](self, "subtitleLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFont:", v5);

  }
  else
  {
    objc_msgSend(v5, "setHidden:", 1);
  }

  -[WFNetworkListCell _adjustStackViewPadding](self, "_adjustStackViewPadding");
}

- (void)setConnectionError:(BOOL)a3
{
  if (self->_connectionError != a3)
  {
    self->_connectionError = a3;
    -[WFNetworkListCell _updateSignalImage](self, "_updateSignalImage");
  }
}

- (void)setPersonalHotspot:(BOOL)a3
{
  if (self->_personalHotspot != a3)
  {
    self->_personalHotspot = a3;
    -[WFNetworkListCell _updateSignalImage](self, "_updateSignalImage");
  }
}

- (void)setBars:(unint64_t)a3
{
  if (self->_bars != a3)
  {
    self->_bars = a3;
    -[WFNetworkListCell _updateSignalImage](self, "_updateSignalImage");
  }
}

- (void)setSecure:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (self->_secure != a3)
  {
    v3 = a3;
    self->_secure = a3;
    -[WFNetworkListCell lockImageView](self, "lockImageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v5;
    if (v3)
    {
      objc_msgSend(v5, "setHidden:", 0);

      +[WFImageCache sharedImageCache](WFImageCache, "sharedImageCache");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "imageNamed:", CFSTR("Lock"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "imageWithRenderingMode:", 2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFNetworkListCell lockImageView](self, "lockImageView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setImage:", v7);

    }
    else
    {
      objc_msgSend(v5, "setHidden:", 1);
    }

  }
}

- (void)_updateSignalImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  double *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  -[WFNetworkListCell signalImageView](self, "signalImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 0);

  if (-[WFNetworkListCell connectionError](self, "connectionError"))
  {
    +[WFImageCache sharedImageCache](WFImageCache, "sharedImageCache");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageNamed:", CFSTR("WiFiBarsError"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageWithRenderingMode:", 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFNetworkListCell signalImageView](self, "signalImageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setImage:", v6);

    objc_msgSend(MEMORY[0x24BEBD4B8], "systemOrangeColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFNetworkListCell subtitleLabel](self, "subtitleLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTextColor:", v8);

    v10 = (void *)MEMORY[0x24BEBB520];
    v11 = *MEMORY[0x24BEBE1E0];
    v12 = (double *)MEMORY[0x24BEBB600];
  }
  else
  {
    if (-[WFNetworkListCell personalHotspot](self, "personalHotspot"))
    {
      +[WFImageCache sharedImageCache](WFImageCache, "sharedImageCache");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "imageNamed:", CFSTR("Personal_Hotspot"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "imageWithRenderingMode:", 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFNetworkListCell signalImageView](self, "signalImageView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setImage:", v15);

      -[WFNetworkListCell signalImageViewCenterConstraint](self, "signalImageViewCenterConstraint");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      v19 = 1.0;
    }
    else
    {
      -[WFNetworkListCell imageFromSignalBars:](self, "imageFromSignalBars:", self->_bars);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "imageWithRenderingMode:", 2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFNetworkListCell signalImageView](self, "signalImageView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setImage:", v21);

      -[WFNetworkListCell signalImageView](self, "signalImageView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFNetworkListCell _updateTintColorForImageView:](self, "_updateTintColorForImageView:", v23);

      -[WFNetworkListCell signalImageViewCenterConstraint](self, "signalImageViewCenterConstraint");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      v19 = 0.0;
    }
    objc_msgSend(v17, "setConstant:", v19);

    -[WFNetworkListCell subtitleLabel](self, "subtitleLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFNetworkListCell _updateTextColorForLabel:](self, "_updateTextColorForLabel:", v24);

    v10 = (void *)MEMORY[0x24BEBB520];
    v11 = *MEMORY[0x24BEBE1E0];
    v12 = (double *)MEMORY[0x24BEBB608];
  }
  objc_msgSend(v10, "preferredFontForStyle:weight:", v11, *v12);
  v26 = (id)objc_claimAutoreleasedReturnValue();
  -[WFNetworkListCell subtitleLabel](self, "subtitleLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setFont:", v26);

}

- (void)_updateTextColorForLabel:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x24BEBD4B8];
  v4 = a3;
  objc_msgSend(v3, "defaultTextColor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextColor:", v5);

}

- (void)_updateTintColorForImageView:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x24BEBD4B8];
  v4 = a3;
  objc_msgSend(v3, "defaultTextColor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTintColor:", v5);

}

- (id)imageFromSignalBars:(unint64_t)a3
{
  double v3;
  void *v4;
  void *v5;

  if ((double)a3 / 3.0 <= 3.0)
    v3 = (double)a3 / 3.0;
  else
    v3 = 1.0;
  +[WFImageCache sharedImageCache](WFImageCache, "sharedImageCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageNamed:variableValue:", CFSTR("wifi"), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)bars
{
  return self->_bars;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (BOOL)personalHotspot
{
  return self->_personalHotspot;
}

- (BOOL)secure
{
  return self->_secure;
}

- (BOOL)connectionError
{
  return self->_connectionError;
}

- (UIImageView)signalImageView
{
  return (UIImageView *)objc_loadWeakRetained((id *)&self->_signalImageView);
}

- (void)setSignalImageView:(id)a3
{
  objc_storeWeak((id *)&self->_signalImageView, a3);
}

- (UIImageView)lockImageView
{
  return (UIImageView *)objc_loadWeakRetained((id *)&self->_lockImageView);
}

- (void)setLockImageView:(id)a3
{
  objc_storeWeak((id *)&self->_lockImageView, a3);
}

- (UILabel)nameLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_nameLabel);
}

- (void)setNameLabel:(id)a3
{
  objc_storeWeak((id *)&self->_nameLabel, a3);
}

- (UILabel)subtitleLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_subtitleLabel);
}

- (void)setSubtitleLabel:(id)a3
{
  objc_storeWeak((id *)&self->_subtitleLabel, a3);
}

- (UIStackView)stackView
{
  return (UIStackView *)objc_loadWeakRetained((id *)&self->_stackView);
}

- (void)setStackView:(id)a3
{
  objc_storeWeak((id *)&self->_stackView, a3);
}

- (NSLayoutConstraint)stackViewTopConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_stackViewTopConstraint);
}

- (void)setStackViewTopConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_stackViewTopConstraint, a3);
}

- (NSLayoutConstraint)stackViewBottomConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_stackViewBottomConstraint);
}

- (void)setStackViewBottomConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_stackViewBottomConstraint, a3);
}

- (WFAssociationStateView)associationStateView
{
  return (WFAssociationStateView *)objc_loadWeakRetained((id *)&self->_associationStateView);
}

- (void)setAssociationStateView:(id)a3
{
  objc_storeWeak((id *)&self->_associationStateView, a3);
}

- (NSLayoutConstraint)signalImageViewCenterConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_signalImageViewCenterConstraint);
}

- (void)setSignalImageViewCenterConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_signalImageViewCenterConstraint, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_signalImageViewCenterConstraint);
  objc_destroyWeak((id *)&self->_associationStateView);
  objc_destroyWeak((id *)&self->_stackViewBottomConstraint);
  objc_destroyWeak((id *)&self->_stackViewTopConstraint);
  objc_destroyWeak((id *)&self->_stackView);
  objc_destroyWeak((id *)&self->_subtitleLabel);
  objc_destroyWeak((id *)&self->_nameLabel);
  objc_destroyWeak((id *)&self->_lockImageView);
  objc_destroyWeak((id *)&self->_signalImageView);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
