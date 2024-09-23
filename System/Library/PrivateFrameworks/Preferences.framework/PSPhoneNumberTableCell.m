@implementation PSPhoneNumberTableCell

- (void)layoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  uint64_t v20;
  void *v21;
  double v22;
  void *v23;
  objc_super v24;
  CGRect v25;

  v24.receiver = self;
  v24.super_class = (Class)PSPhoneNumberTableCell;
  -[PSEditableTableCell layoutSubviews](&v24, sel_layoutSubviews);
  -[PSPhoneNumberTableCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[PSEditableTableCell textField](self, "textField");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frame");
  v14 = v13;
  v16 = v15;
  v18 = v17;

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "userInterfaceLayoutDirection");

  -[PSEditableTableCell textField](self, "textField");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    objc_msgSend(v21, "setTextAlignment:", 0);

    v22 = 35.0;
  }
  else
  {
    objc_msgSend(v21, "setTextAlignment:", 2);

    v25.origin.x = v5;
    v25.origin.y = v7;
    v25.size.width = v9;
    v25.size.height = v11;
    v22 = CGRectGetMaxX(v25) + -35.0 - v16;
  }
  -[PSEditableTableCell textField](self, "textField");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setFrame:", v22, v14, v16, v18);

}

@end
