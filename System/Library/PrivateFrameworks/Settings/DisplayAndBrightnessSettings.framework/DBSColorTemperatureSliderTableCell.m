@implementation DBSColorTemperatureSliderTableCell

- (DBSColorTemperatureSliderTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  DBSColorTemperatureSliderTableCell *v5;
  DBSColorTemperatureSliderTableCell *v6;
  void *v7;
  void *v8;
  UILabel *v9;
  UILabel *coolerLabel;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  UILabel *v15;
  UILabel *warmerLabel;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  objc_super v27;
  objc_super v28;
  CGRect v29;

  v28.receiver = self;
  v28.super_class = (Class)DBSColorTemperatureSliderTableCell;
  v5 = -[PSSliderTableCell initWithStyle:reuseIdentifier:specifier:](&v28, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    -[DBSColorTemperatureSliderTableCell textLabel](v5, "textLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "font");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    coolerLabel = v6->_coolerLabel;
    v6->_coolerLabel = v9;

    -[UILabel setFont:](v6->_coolerLabel, "setFont:", v8);
    DBS_LocalizedStringForColorTemperature(CFSTR("COOLER"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v6->_coolerLabel, "setText:", v11);

    -[UILabel setNumberOfLines:](v6->_coolerLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](v6->_coolerLabel, "setLineBreakMode:", 0);
    objc_msgSend(MEMORY[0x24BE75530], "appearance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "textColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v6->_coolerLabel, "setTextColor:", v13);

    -[DBSColorTemperatureSliderTableCell contentView](v6, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSubview:", v6->_coolerLabel);

    v15 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    warmerLabel = v6->_warmerLabel;
    v6->_warmerLabel = v15;

    -[UILabel setFont:](v6->_warmerLabel, "setFont:", v8);
    DBS_LocalizedStringForColorTemperature(CFSTR("WARMER"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v6->_warmerLabel, "setText:", v17);

    -[UILabel setNumberOfLines:](v6->_warmerLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](v6->_warmerLabel, "setLineBreakMode:", 0);
    objc_msgSend(MEMORY[0x24BE75530], "appearance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "textColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v6->_warmerLabel, "setTextColor:", v19);

    -[DBSColorTemperatureSliderTableCell contentView](v6, "contentView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addSubview:", v6->_warmerLabel);

    v27.receiver = v6;
    v27.super_class = (Class)DBSColorTemperatureSliderTableCell;
    -[PSTableCell layoutSubviews](&v27, sel_layoutSubviews);
    -[DBSColorTemperatureSliderTableCell textLabel](v6, "textLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "frame");
    v23 = v22;
    v25 = v24;

    if (-[DBSColorTemperatureSliderTableCell effectiveUserInterfaceLayoutDirection](v6, "effectiveUserInterfaceLayoutDirection") == 1)
    {
      -[DBSColorTemperatureSliderTableCell bounds](v6, "bounds");
      v23 = CGRectGetWidth(v29) - v23;
    }
    v6->_horizontalMargin = v23;
    v6->_verticalMargin = v25;

  }
  return v6;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  void *v5;
  CGFloat v6;
  double v7;
  double v8;
  CGSize result;
  CGRect v10;

  width = a3.width;
  -[DBSColorTemperatureSliderTableCell layoutSubviews](self, "layoutSubviews", a3.width, a3.height);
  -[PSControlTableCell control](self, "control");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v6 = CGRectGetMaxY(v10) + self->_verticalMargin;

  v7 = width;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  uint64_t v5;
  double Width;
  double v7;
  double v8;
  int *v9;
  void *v10;
  int *v11;
  id v12;
  id v13;
  double v14;
  double v15;
  double horizontalMargin;
  double verticalMargin;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double MaxY;
  double v30;
  CGFloat v31;
  CGFloat v32;
  objc_super v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  v33.receiver = self;
  v33.super_class = (Class)DBSColorTemperatureSliderTableCell;
  -[PSTableCell layoutSubviews](&v33, sel_layoutSubviews);
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE75718]);
  -[PSControlTableCell control](self, "control");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  objc_msgSend(v3, "setFrame:");

  v5 = -[DBSColorTemperatureSliderTableCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  -[DBSColorTemperatureSliderTableCell bounds](self, "bounds");
  Width = CGRectGetWidth(v34);
  PSRoundToPixel();
  v8 = v7;
  if (v5)
    v9 = &OBJC_IVAR___DBSColorTemperatureSliderTableCell__warmerLabel;
  else
    v9 = &OBJC_IVAR___DBSColorTemperatureSliderTableCell__coolerLabel;
  v10 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + *v9);
  if (v5)
    v11 = &OBJC_IVAR___DBSColorTemperatureSliderTableCell__coolerLabel;
  else
    v11 = &OBJC_IVAR___DBSColorTemperatureSliderTableCell__warmerLabel;
  v12 = v10;
  objc_msgSend(v12, "setTextAlignment:", 0);
  v13 = *(id *)((char *)&self->super.super.super.super.super.super.super.isa + *v11);
  objc_msgSend(v13, "setTextAlignment:", 2);
  objc_msgSend(v12, "frame");
  objc_msgSend(v12, "sizeThatFits:", v8, 1.79769313e308);
  v31 = v15;
  v32 = v14;
  horizontalMargin = self->_horizontalMargin;
  verticalMargin = self->_verticalMargin;
  objc_msgSend(v12, "setFrame:", horizontalMargin, verticalMargin, v14, v15);
  objc_msgSend(v13, "frame");
  objc_msgSend(v13, "sizeThatFits:", v8, 1.79769313e308);
  v19 = v18;
  v21 = v20;
  v22 = Width - (self->_horizontalMargin + v18);
  v23 = self->_verticalMargin;
  objc_msgSend(v13, "setFrame:", v22, v23, v18, v20);
  -[PSControlTableCell control](self, "control");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "sizeToFit");
  objc_msgSend(v24, "frame");
  PSRoundToPixel();
  v26 = v25;
  PSRoundToPixel();
  v28 = v27;
  v35.origin.x = horizontalMargin;
  v35.origin.y = verticalMargin;
  v35.size.height = v31;
  v35.size.width = v32;
  MaxY = CGRectGetMaxY(v35);
  v36.origin.x = v22;
  v36.origin.y = v23;
  v36.size.width = v19;
  v36.size.height = v21;
  v30 = CGRectGetMaxY(v36);
  if (MaxY >= v30)
    v30 = MaxY;
  objc_msgSend(v24, "setFrame:", v28, v30 + 10.0, v26, 31.0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_warmerLabel, 0);
  objc_storeStrong((id *)&self->_coolerLabel, 0);
}

@end
