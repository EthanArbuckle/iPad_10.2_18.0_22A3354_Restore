@implementation STWrappingTitleValueCell

- (STWrappingTitleValueCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  STWrappingTitleValueCell *v5;
  STWrappingTitleValueCell *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)STWrappingTitleValueCell;
  v5 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v9, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    -[PSTableCell valueLabel](v5, "valueLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNumberOfLines:", 2);
    objc_msgSend(v7, "setLineBreakMode:", 4);

  }
  return v6;
}

- (void)layoutSubviews
{
  void *v3;
  double MidY;
  void *v5;
  double x;
  double y;
  double width;
  double height;
  double v10;
  objc_super v11;
  CGRect v12;
  CGRect v13;

  v11.receiver = self;
  v11.super_class = (Class)STWrappingTitleValueCell;
  -[PSTableCell layoutSubviews](&v11, sel_layoutSubviews);
  -[PSTableCell valueLabel](self, "valueLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  MidY = CGRectGetMidY(v12);

  -[PSTableCell titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  x = v13.origin.x;
  y = v13.origin.y;
  width = v13.size.width;
  height = v13.size.height;
  v10 = MidY - CGRectGetMidY(v13);
  if (v10 > 0.00000011920929)
    objc_msgSend(v5, "setFrame:", x, y + v10, width, height);

}

@end
