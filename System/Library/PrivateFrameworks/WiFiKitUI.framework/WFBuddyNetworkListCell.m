@implementation WFBuddyNetworkListCell

- (void)awakeFromNib
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  id WeakRetained;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v14.receiver = self;
  v14.super_class = (Class)WFBuddyNetworkListCell;
  -[WFNetworkListCell awakeFromNib](&v14, sel_awakeFromNib);
  v15[0] = *MEMORY[0x24BEBB368];
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v3;
  v15[1] = *MEMORY[0x24BEBB360];
  objc_msgSend(MEMORY[0x24BE85900], "sharedStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tableCellFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(CFSTR("A"), "sizeWithAttributes:", v6);
  v8 = v7;
  WeakRetained = objc_loadWeakRetained((id *)&self->_topLabelConstraint);
  objc_msgSend(WeakRetained, "setConstant:", v8);

  v10 = objc_loadWeakRetained((id *)&self->_bottomLabelConstraint);
  objc_msgSend(v10, "setConstant:", v8);

  objc_msgSend(MEMORY[0x24BEBD4B8], "secondarySystemBackgroundColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFBuddyNetworkListCell setBackgroundColor:](self, "setBackgroundColor:", v11);

  objc_msgSend(MEMORY[0x24BEBD4B8], "defaultTextColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFBuddyNetworkListCell textLabel](self, "textLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTextColor:", v12);

}

- (void)layoutSubviews
{
  double v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFBuddyNetworkListCell;
  -[WFBuddyNetworkListCell layoutSubviews](&v5, sel_layoutSubviews);
  if (-[WFBuddyNetworkListCell accessoryType](self, "accessoryType") == 4)
    v3 = 0.0;
  else
    v3 = 8.0;
  -[WFBuddyNetworkListCell trailingImageViewConstraint](self, "trailingImageViewConstraint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setConstant:", v3);

}

- (NSLayoutConstraint)trailingImageViewConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_trailingImageViewConstraint);
}

- (void)setTrailingImageViewConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_trailingImageViewConstraint, a3);
}

- (NSLayoutConstraint)topLabelConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_topLabelConstraint);
}

- (void)setTopLabelConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_topLabelConstraint, a3);
}

- (NSLayoutConstraint)bottomLabelConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_bottomLabelConstraint);
}

- (void)setBottomLabelConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_bottomLabelConstraint, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_bottomLabelConstraint);
  objc_destroyWeak((id *)&self->_topLabelConstraint);
  objc_destroyWeak((id *)&self->_trailingImageViewConstraint);
}

@end
