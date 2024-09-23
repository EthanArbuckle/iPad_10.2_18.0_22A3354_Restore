@implementation PKPaymentSetupProductCell

- (id)pk_childrenForAppearance
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (void)pk_applyAppearance:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPaymentSetupProductCell;
  -[PKTableViewCell pk_applyAppearance:](&v3, sel_pk_applyAppearance_, a3);
}

- (PKPaymentSetupProductCell)init
{
  void *v3;
  PKPaymentSetupProductCell *v4;
  void *v5;
  void *v6;
  objc_super v8;

  objc_msgSend((id)objc_opt_class(), "reuseIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)PKPaymentSetupProductCell;
  v4 = -[PKPaymentSetupProductCell initWithStyle:reuseIdentifier:](&v8, sel_initWithStyle_reuseIdentifier_, 0, v3);

  if (v4)
  {
    -[PKPaymentSetupProductCell textLabel](v4, "textLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 18.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFont:", v6);

  }
  return v4;
}

+ (id)reuseIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void)setProduct:(id)a3
{
  PKPaymentSetupProduct *v5;
  PKPaymentSetupProduct *v6;

  v5 = (PKPaymentSetupProduct *)a3;
  if (self->_product != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_product, a3);
    -[PKPaymentSetupProductCell _updateDisplay](self, "_updateDisplay");
    v5 = v6;
  }

}

- (void)_updateDisplay
{
  void *v3;
  id v4;

  -[PKPaymentSetupProductCell textLabel](self, "textLabel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupProduct displayName](self->_product, "displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v3);

}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double textLabelOffset;
  double Width;
  double v12;
  void *v13;
  objc_super v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;

  v14.receiver = self;
  v14.super_class = (Class)PKPaymentSetupProductCell;
  -[PKPaymentSetupProductCell layoutSubviews](&v14, sel_layoutSubviews);
  if (self->_textLabelOffset > 0.0)
  {
    -[PKPaymentSetupProductCell textLabel](self, "textLabel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "frame");
    v5 = v4;
    v7 = v6;
    v9 = v8;

    textLabelOffset = self->_textLabelOffset;
    v15.origin.x = textLabelOffset;
    v15.origin.y = v5;
    v15.size.width = v7;
    v15.size.height = v9;
    Width = CGRectGetWidth(v15);
    -[PKPaymentSetupProductCell bounds](self, "bounds");
    if (Width >= CGRectGetWidth(v16) - self->_textLabelOffset)
    {
      -[PKPaymentSetupProductCell bounds](self, "bounds");
      v12 = CGRectGetWidth(v18) - self->_textLabelOffset;
    }
    else
    {
      v17.origin.x = textLabelOffset;
      v17.origin.y = v5;
      v17.size.width = v7;
      v17.size.height = v9;
      v12 = CGRectGetWidth(v17);
    }
    -[PKPaymentSetupProductCell textLabel](self, "textLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFrame:", textLabelOffset, v5, v12, v9);

  }
}

- (void)drawRect:(CGRect)a3
{
  double v4;
  CGFloat v5;
  CGContext *CurrentContext;
  id v7;
  CGContext *v8;
  objc_super v9;
  CGRect v10;
  CGRect v11;

  v9.receiver = self;
  v9.super_class = (Class)PKPaymentSetupProductCell;
  -[PKPaymentSetupProductCell drawRect:](&v9, sel_drawRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (self->_drawsTopSeperator)
  {
    -[PKPaymentSetupProductCell contentScaleFactor](self, "contentScaleFactor");
    v5 = 1.0 / v4;
    CurrentContext = UIGraphicsGetCurrentContext();
    objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v7, "CGColor"));

    v8 = UIGraphicsGetCurrentContext();
    -[PKPaymentSetupProductCell bounds](self, "bounds");
    v11.size.width = CGRectGetWidth(v10);
    v11.origin.x = 0.0;
    v11.origin.y = 0.0;
    v11.size.height = v5;
    CGContextFillRect(v8, v11);
  }
}

- (PKPaymentSetupProduct)product
{
  return self->_product;
}

- (double)textLabelOffset
{
  return self->_textLabelOffset;
}

- (void)setTextLabelOffset:(double)a3
{
  self->_textLabelOffset = a3;
}

- (BOOL)drawsTopSeperator
{
  return self->_drawsTopSeperator;
}

- (void)setDrawsTopSeperator:(BOOL)a3
{
  self->_drawsTopSeperator = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_product, 0);
}

@end
