@implementation STWrappingTitleSubtitleCell

- (STWrappingTitleSubtitleCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  STWrappingTitleSubtitleCell *v5;
  STWrappingTitleSubtitleCell *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)STWrappingTitleSubtitleCell;
  v5 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v10, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    -[PSTableCell titleLabel](v5, "titleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNumberOfLines:", 0);
    objc_msgSend(v7, "setLineBreakMode:", 0);
    -[STWrappingTitleSubtitleCell detailTextLabel](v6, "detailTextLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNumberOfLines:", 0);
    objc_msgSend(v8, "setLineBreakMode:", 0);

  }
  return v6;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double Height;
  void *v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;
  CGRect v15;

  v14.receiver = self;
  v14.super_class = (Class)STWrappingTitleSubtitleCell;
  -[STAppTitleSubtitleCell layoutSubviews](&v14, sel_layoutSubviews);
  objc_msgSend((id)*MEMORY[0x24BEBDF78], "preferredContentSizeCategory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v3))
  {
    -[STWrappingTitleSubtitleCell superview](self, "superview");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
      return;
    -[PSTableCell specifier](self, "specifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("AlternateShorterSubtitle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MaximumNumberOfLines"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v5 && v6)
    {
      -[STWrappingTitleSubtitleCell detailTextLabel](self, "detailTextLabel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "frame");
      Height = CGRectGetHeight(v15);
      objc_msgSend(v8, "font");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lineHeight");
      v12 = round(Height / v11);

      objc_msgSend(v7, "doubleValue");
      if (v12 > v13)
      {
        objc_msgSend(v8, "setText:", v5);
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BE75D28]);
      }

    }
  }

}

@end
