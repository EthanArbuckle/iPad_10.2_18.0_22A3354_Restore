@implementation SHSHeadphoneLevelLimitSliderCell

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  float v13;
  double v14;
  float v15;
  float v16;
  float v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)SHSHeadphoneLevelLimitSliderCell;
  -[PSTableCell layoutSubviews](&v18, sel_layoutSubviews);
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE75718]);
  -[PSControlTableCell control](self, "control");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  objc_msgSend(v3, "setFrame:");

  -[SHSHeadphoneLevelLimitSliderCell contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;

  -[PSControlTableCell control](self, "control");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sizeThatFits:", v7, v9);
  v12 = v11;
  PreferencesTableViewCellLeftPad();
  v14 = v13;
  PreferencesTableViewCellLeftPad();
  v16 = v15;
  PreferencesTableViewCellRightPad();
  objc_msgSend(v10, "setFrame:", v14, round(v9 * 0.5 - v12 * 0.5), v7 - (float)(v16 + v17), v12);

}

@end
