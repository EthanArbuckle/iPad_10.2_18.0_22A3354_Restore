@implementation TSKEditableTextFieldCell

- (TSKEditableTextFieldCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  TSKEditableTextFieldCell *v4;
  id v5;
  UITextField *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TSKEditableTextFieldCell;
  v4 = -[TSKEditableTextFieldCell initWithStyle:reuseIdentifier:](&v9, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x24BDF6EA8]);
    v6 = (UITextField *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    v4->mTextField = v6;
    -[UITextField setContentVerticalAlignment:](v6, "setContentVerticalAlignment:", 0);
    -[UITextField setTextAlignment:](v4->mTextField, "setTextAlignment:", 1);
    -[UITextField setFont:](v4->mTextField, "setFont:", objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 17.0));
    -[UITextField setReturnKeyType:](v4->mTextField, "setReturnKeyType:", 9);
    -[UITextField setUserInteractionEnabled:](v4->mTextField, "setUserInteractionEnabled:", 0);
    v7 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v7, "addObserver:selector:name:object:", v4, sel_textFieldDidEndEditing_, *MEMORY[0x24BDF7F60], v4->mTextField);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:", self);

  v3.receiver = self;
  v3.super_class = (Class)TSKEditableTextFieldCell;
  -[TSKEditableTextFieldCell dealloc](&v3, sel_dealloc);
}

- (void)layoutSubviews
{
  double x;
  double y;
  double width;
  double height;
  uint64_t v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  objc_super v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;

  v15.receiver = self;
  v15.super_class = (Class)TSKEditableTextFieldCell;
  -[TSKEditableTextFieldCell layoutSubviews](&v15, sel_layoutSubviews);
  objc_msgSend((id)-[TSKEditableTextFieldCell contentView](self, "contentView"), "bounds");
  v17 = CGRectInset(v16, 10.0, 0.0);
  v18 = CGRectIntegral(v17);
  x = v18.origin.x;
  y = v18.origin.y;
  width = v18.size.width;
  height = v18.size.height;
  v7 = -[UITextField contentVerticalAlignment](self->mTextField, "contentVerticalAlignment");
  v8 = height + 1.0;
  if (((uint64_t)height & 1) != 0)
    v8 = height;
  if (!v7)
    height = v8;
  v9 = (void *)-[TSKEditableTextFieldCell textLabel](self, "textLabel");
  v10 = (void *)objc_msgSend(v9, "text");
  if (v10 && objc_msgSend(v10, "length"))
  {
    objc_msgSend(v9, "textRectForBounds:limitedToNumberOfLines:", 1, x, y, width, height);
    *(float *)&v11 = v11 + v12;
    v13 = *(float *)&v11;
    x = x + v13;
    width = width - v13;
  }
  if (-[TSKEditableTextFieldCell showsReorderControl](self, "showsReorderControl"))
    v14 = width + -40.0;
  else
    v14 = width;
  -[UITextField setFrame:](self->mTextField, "setFrame:", x, y, v14, height);
  objc_msgSend((id)-[TSKEditableTextFieldCell contentView](self, "contentView"), "addSubview:", self->mTextField);
}

- (void)beginEditing
{
  -[UITextField setUserInteractionEnabled:](self->mTextField, "setUserInteractionEnabled:", 1);
  -[UITextField becomeFirstResponder](self->mTextField, "becomeFirstResponder");
}

- (void)endEditing
{
  -[UITextField resignFirstResponder](self->mTextField, "resignFirstResponder");
}

- (void)textFieldDidEndEditing:(id)a3
{
  -[UITextField setUserInteractionEnabled:](self->mTextField, "setUserInteractionEnabled:", 0);
}

- (UITextField)textField
{
  return self->mTextField;
}

- (void)setTextField:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1024);
}

@end
