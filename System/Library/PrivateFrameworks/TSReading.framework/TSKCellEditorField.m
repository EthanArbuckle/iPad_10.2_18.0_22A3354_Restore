@implementation TSKCellEditorField

- (TSKCellEditorField)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  TSKCellEditorField *v7;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)TSKCellEditorField;
  v7 = -[TSKCellEditorField initWithFrame:](&v9, sel_initWithFrame_);
  if (v7)
  {
    v7->mTextView = (UITextView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6EF8]), "initWithFrame:", x, y, width, height);
    v7->mLeftSymbolView = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", x, y, width, height);
    v7->mRightSymbolView = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", x, y, width, height);
    -[UILabel setBackgroundColor:](v7->mLeftSymbolView, "setBackgroundColor:", -[TSKCellEditorField p_symbolContainerBackgroundColor](v7, "p_symbolContainerBackgroundColor"));
    -[UILabel setBackgroundColor:](v7->mRightSymbolView, "setBackgroundColor:", -[TSKCellEditorField p_symbolContainerBackgroundColor](v7, "p_symbolContainerBackgroundColor"));
    objc_msgSend((id)-[UILabel layer](v7->mLeftSymbolView, "layer"), "setCornerRadius:", 4.0);
    objc_msgSend((id)-[UILabel layer](v7->mRightSymbolView, "layer"), "setCornerRadius:", 4.0);
    -[TSKCellEditorField setBackgroundColor:](v7, "setBackgroundColor:", objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.678431373, 0.745098039, 0.678431373, 1.0));
    -[UITextView setBackgroundColor:](v7->mTextView, "setBackgroundColor:", objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.678431373, 0.745098039, 0.678431373, 1.0));
    -[UITextView setFont:](v7->mTextView, "setFont:", objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 36.0));
    -[TSKCellEditorField addSubview:](v7, "addSubview:", v7->mTextView);
    -[TSKCellEditorField addSubview:](v7, "addSubview:", v7->mLeftSymbolView);
    -[TSKCellEditorField addSubview:](v7, "addSubview:", v7->mRightSymbolView);
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSKCellEditorField;
  -[TSKCellEditorField dealloc](&v3, sel_dealloc);
}

- (id)p_symbolContainerBackgroundColor
{
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.2);
}

- (NSString)text
{
  return -[UITextView text](self->mTextView, "text");
}

- (void)setText:(id)a3
{
  -[UITextView setText:](self->mTextView, "setText:", a3);
  -[TSKCellEditorField setNeedsLayout](self, "setNeedsLayout");
}

- (NSString)leftSymbol
{
  return -[UILabel text](self->mLeftSymbolView, "text");
}

- (void)setLeftSymbol:(id)a3
{
  -[UILabel setText:](self->mLeftSymbolView, "setText:", a3);
  -[TSKCellEditorField setNeedsLayout](self, "setNeedsLayout");
}

- (NSString)rightSymbol
{
  return -[UILabel text](self->mRightSymbolView, "text");
}

- (void)setRightSymbol:(id)a3
{
  -[UILabel setText:](self->mRightSymbolView, "setText:", a3);
  -[TSKCellEditorField setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  NSString *v5;
  UILabel *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  NSString *v12;
  UILabel *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;

  -[TSKCellEditorField frame](self, "frame");
  v4 = v3;
  v5 = -[UILabel text](-[TSKCellEditorField leftSymbolView](self, "leftSymbolView"), "text");
  v6 = -[TSKCellEditorField leftSymbolView](self, "leftSymbolView");
  if (v5)
  {
    -[UILabel setHidden:](v6, "setHidden:", 0);
    -[UILabel sizeToFit](-[TSKCellEditorField leftSymbolView](self, "leftSymbolView"), "sizeToFit");
    -[UILabel frame](-[TSKCellEditorField leftSymbolView](self, "leftSymbolView"), "frame");
    -[UILabel setFrame:](-[TSKCellEditorField leftSymbolView](self, "leftSymbolView"), "setFrame:", 0.0, v7, v8, v9);
    -[UILabel bounds](-[TSKCellEditorField leftSymbolView](self, "leftSymbolView"), "bounds");
    v11 = v10;
  }
  else
  {
    -[UILabel setHidden:](v6, "setHidden:", 1);
    v11 = 0.0;
  }
  v12 = -[UILabel text](-[TSKCellEditorField rightSymbolView](self, "rightSymbolView"), "text");
  v13 = -[TSKCellEditorField rightSymbolView](self, "rightSymbolView");
  if (v12)
  {
    -[UILabel setHidden:](v13, "setHidden:", 0);
    -[UILabel sizeToFit](-[TSKCellEditorField rightSymbolView](self, "rightSymbolView"), "sizeToFit");
    -[UILabel frame](-[TSKCellEditorField rightSymbolView](self, "rightSymbolView"), "frame");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    -[TSKCellEditorField frame](self, "frame");
    v21 = v20;
    -[UILabel frame](-[TSKCellEditorField rightSymbolView](self, "rightSymbolView"), "frame");
    v4 = v21 - v22;
    -[UILabel setFrame:](-[TSKCellEditorField rightSymbolView](self, "rightSymbolView"), "setFrame:", v4, v15, v17, v19);
  }
  else
  {
    -[UILabel setHidden:](v13, "setHidden:", 1);
  }
  -[TSKCellEditorField frame](self, "frame");
  -[UITextView setFrame:](-[TSKCellEditorField textView](self, "textView"), "setFrame:", v11, 0.0, v4 - v11, v23);
}

- (UITextView)textView
{
  return self->mTextView;
}

- (void)setTextView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 416);
}

- (UILabel)leftSymbolView
{
  return self->mLeftSymbolView;
}

- (void)setLeftSymbolView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 424);
}

- (UILabel)rightSymbolView
{
  return self->mRightSymbolView;
}

- (void)setRightSymbolView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 432);
}

@end
