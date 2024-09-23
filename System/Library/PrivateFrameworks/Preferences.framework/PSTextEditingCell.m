@implementation PSTextEditingCell

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  void *v9;
  void *v10;
  objc_super v11;
  CGRect v12;

  v11.receiver = self;
  v11.super_class = (Class)PSTextEditingCell;
  -[PSTextEditingCell layoutSubviews](&v11, sel_layoutSubviews);
  -[PSTextEditingCell editableTextField](self, "editableTextField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;

  -[PSTextEditingCell frame](self, "frame");
  v8 = CGRectGetWidth(v12) + -40.0;
  -[PSTextEditingCell editableTextField](self, "editableTextField");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFrame:", 20.0, v5, v8, v7);

  -[PSTextEditingCell editableTextField](self, "editableTextField");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTextAlignment:", 1);

}

@end
