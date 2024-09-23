@implementation PSGTitleTruncatedCell

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  float v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PSGTitleTruncatedCell;
  -[PSTableCell layoutSubviews](&v10, sel_layoutSubviews);
  -[PSTableCell valueLabel](self, "valueLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  objc_msgSend(v3, "sizeToFit");
  objc_msgSend(v3, "frame");
  v8 = v7 - v5;
  if (v8 > 0.0)
  {
    objc_msgSend(v3, "setFrame:", v6 - v8);
    -[PSTableCell titleLabel](self, "titleLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "frame");
    objc_msgSend(v9, "setFrame:");

  }
}

@end
