@implementation WFAdditionalSetupTableViewCell

- (void)awakeFromNib
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFAdditionalSetupTableViewCell;
  -[WFAdditionalSetupTableViewCell awakeFromNib](&v8, sel_awakeFromNib);
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BEBB520];
  objc_msgSend(v3, "pointSize");
  objc_msgSend(v4, "boldSystemFontOfSize:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAdditionalSetupTableViewCell label](self, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v5);

  objc_msgSend(MEMORY[0x24BEBD4B8], "secondarySystemBackgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAdditionalSetupTableViewCell setBackgroundColor:](self, "setBackgroundColor:", v7);

}

- (UILabel)label
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_label);
}

- (void)setLabel:(id)a3
{
  objc_storeWeak((id *)&self->_label, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_label);
}

@end
