@implementation WFHotspotCell

- (void)awakeFromNib
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFHotspotCell;
  -[WFHotspotCell awakeFromNib](&v3, sel_awakeFromNib);
  -[WFHotspotCell _adjustStackViewPadding](self, "_adjustStackViewPadding");
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;

  objc_msgSend(a3, "preferredContentSizeCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHotspotCell traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqualToString:", v6);

  if ((v7 & 1) == 0)
    -[WFHotspotCell _adjustStackViewPadding](self, "_adjustStackViewPadding");
}

- (void)_adjustStackViewPadding
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  id v8;

  -[WFHotspotCell _verticalPadding](self, "_verticalPadding");
  v4 = v3;
  -[WFHotspotCell stackViewTopConstraint](self, "stackViewTopConstraint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setConstant:", v4);

  -[WFHotspotCell _verticalPadding](self, "_verticalPadding");
  v7 = v6;
  -[WFHotspotCell stackViewBottomConstraint](self, "stackViewBottomConstraint");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setConstant:", v7);

}

- (double)_verticalPadding
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[WFHotspotCell nameLabel](self, "nameLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "font");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_bodyLeading");
  v5 = v4 * 0.5;

  return v5;
}

- (void)setState:(int64_t)a3
{
  id v4;

  -[WFHotspotCell associationStateView](self, "associationStateView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setState:", a3);

}

- (int64_t)state
{
  void *v2;
  int64_t v3;

  -[WFHotspotCell associationStateView](self, "associationStateView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "state");

  return v3;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFHotspotCell;
  -[WFHotspotCell prepareForReuse](&v3, sel_prepareForReuse);
  -[WFHotspotCell setState:](self, "setState:", 0);
  -[WFHotspotCell setHotspotDetails:](self, "setHotspotDetails:", 0);
}

- (void)setTitle:(id)a3
{
  WFHotspotCell *v4;
  id v5;
  id WeakRetained;
  void *v7;
  id v8;

  v4 = self;
  objc_storeStrong((id *)&self->_title, a3);
  v5 = a3;
  v4 = (WFHotspotCell *)((char *)v4 + 1064);
  WeakRetained = objc_loadWeakRetained((id *)&v4->super.super.super.super.isa);
  objc_msgSend(WeakRetained, "setText:", v5);

  v8 = objc_loadWeakRetained((id *)&v4->super.super.super.super.isa);
  objc_msgSend(MEMORY[0x24BEBD4B8], "defaultTextColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setTextColor:", v7);
}

- (void)setPersonalHotspot:(BOOL)a3
{
  self->_personalHotspot = a3;
  -[WFHotspotCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)setBars:(unint64_t)a3
{
  self->_bars = a3;
  -[WFHotspotCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)setSecure:(BOOL)a3
{
  self->_secure = a3;
  -[WFHotspotCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)setHotspotDetails:(id)a3
{
  WFHotspotDetails **p_hotspotDetails;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  p_hotspotDetails = &self->_hotspotDetails;
  v17 = a3;
  if (!-[WFHotspotDetails isEqual:](*p_hotspotDetails, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_hotspotDetails, a3);
    -[WFHotspotDetails cellularProtocolString](*p_hotspotDetails, "cellularProtocolString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFHotspotCell hotspotDetailsView](self, "hotspotDetailsView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCellularProtocolString:", v6);

    -[WFHotspotDetails signalStrength](*p_hotspotDetails, "signalStrength");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "unsignedIntegerValue");
    -[WFHotspotCell hotspotDetailsView](self, "hotspotDetailsView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSignalBars:", v9);

    -[WFHotspotDetails batteryLife](*p_hotspotDetails, "batteryLife");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "unsignedIntegerValue");
    -[WFHotspotCell hotspotDetailsView](self, "hotspotDetailsView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBatteryCharge:", v12);

    -[WFHotspotCell stackView](self, "stackView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFHotspotCell hotspotDetailsView](self, "hotspotDetailsView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addArrangedSubview:", v15);

    -[WFHotspotCell stackView](self, "stackView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setLayoutMarginsRelativeArrangement:", 1);

    -[WFHotspotCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (unint64_t)bars
{
  return self->_bars;
}

- (NSString)title
{
  return self->_title;
}

- (BOOL)personalHotspot
{
  return self->_personalHotspot;
}

- (WFHotspotDetails)hotspotDetails
{
  return self->_hotspotDetails;
}

- (BOOL)secure
{
  return self->_secure;
}

- (UIStackView)stackView
{
  return (UIStackView *)objc_loadWeakRetained((id *)&self->_stackView);
}

- (void)setStackView:(id)a3
{
  objc_storeWeak((id *)&self->_stackView, a3);
}

- (UILabel)nameLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_nameLabel);
}

- (void)setNameLabel:(id)a3
{
  objc_storeWeak((id *)&self->_nameLabel, a3);
}

- (WFHotspotDetailsView)hotspotDetailsView
{
  return (WFHotspotDetailsView *)objc_loadWeakRetained((id *)&self->_hotspotDetailsView);
}

- (void)setHotspotDetailsView:(id)a3
{
  objc_storeWeak((id *)&self->_hotspotDetailsView, a3);
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

- (NSLayoutConstraint)stackViewLeadingConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_stackViewLeadingConstraint);
}

- (void)setStackViewLeadingConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_stackViewLeadingConstraint, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_stackViewLeadingConstraint);
  objc_destroyWeak((id *)&self->_associationStateView);
  objc_destroyWeak((id *)&self->_stackViewBottomConstraint);
  objc_destroyWeak((id *)&self->_stackViewTopConstraint);
  objc_destroyWeak((id *)&self->_hotspotDetailsView);
  objc_destroyWeak((id *)&self->_nameLabel);
  objc_destroyWeak((id *)&self->_stackView);
  objc_storeStrong((id *)&self->_hotspotDetails, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
