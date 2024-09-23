@implementation _URLKeyLabel

- (_URLKeyLabel)initWithString:(id)a3 color:(id)a4
{
  id v6;
  id v7;
  double y;
  double width;
  double height;
  _URLKeyLabel *v11;
  UILabel *v12;
  UILabel *label;
  void *v14;
  UIView *v15;
  UIView *colorView;
  _URLKeyLabel *v17;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)_URLKeyLabel;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v11 = -[_URLKeyLabel initWithFrame:](&v19, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  if (v11)
  {
    v12 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    label = v11->_label;
    v11->_label = v12;

    +[UIFont systemFontSize](UIFont, "systemFontSize");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:"));
    -[UILabel setFont:](v11->_label, "setFont:", v14);

    -[UILabel setText:](v11->_label, "setText:", v6);
    -[UILabel setTextColor:](v11->_label, "setTextColor:", v7);
    -[UILabel setBackgroundColor:](v11->_label, "setBackgroundColor:", 0);
    -[UILabel setOpaque:](v11->_label, "setOpaque:", 0);
    -[UILabel sizeToFit](v11->_label, "sizeToFit");
    v15 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, 16.0, 16.0);
    colorView = v11->_colorView;
    v11->_colorView = v15;

    -[UIView setBackgroundColor:](v11->_colorView, "setBackgroundColor:", v7);
    -[_URLKeyLabel addSubview:](v11, "addSubview:", v11->_label);
    -[_URLKeyLabel addSubview:](v11, "addSubview:", v11->_colorView);
    -[_URLKeyLabel sizeToFit](v11, "sizeToFit");
    v17 = v11;
  }

  return v11;
}

- (void)sizeToFit
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;

  -[_URLKeyLabel frame](self, "frame");
  v4 = v3;
  v6 = v5;
  -[UILabel bounds](self->_label, "bounds");
  v8 = v7;
  -[UIView bounds](self->_colorView, "bounds");
  if (v8 <= v9)
    v10 = 16;
  else
    v10 = 8;
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v10), "bounds");
  v12 = v11;
  -[UIView bounds](self->_colorView, "bounds");
  v14 = v13 + 4.0;
  -[UILabel bounds](self->_label, "bounds");
  -[_URLKeyLabel setFrame:](self, "setFrame:", v4, v6, v14 + v15, v12);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect v16;

  -[_URLKeyLabel bounds](self, "bounds");
  v4 = v3;
  -[UIView bounds](self->_colorView, "bounds");
  v6 = (v4 - v5) * 0.5;
  -[UIView bounds](self->_colorView, "bounds");
  v8 = v7;
  -[UIView bounds](self->_colorView, "bounds");
  -[UIView setFrame:](self->_colorView, "setFrame:", 0.0, v6, v8);
  -[UIView frame](self->_colorView, "frame");
  v9 = CGRectGetMaxX(v16) + 4.0;
  -[_URLKeyLabel bounds](self, "bounds");
  v11 = v10;
  -[UILabel bounds](self->_label, "bounds");
  v13 = (v11 - v12) * 0.5;
  -[UILabel bounds](self->_label, "bounds");
  v15 = v14;
  -[UILabel bounds](self->_label, "bounds");
  -[UILabel setFrame:](self->_label, "setFrame:", v9, v13, v15);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorView, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
