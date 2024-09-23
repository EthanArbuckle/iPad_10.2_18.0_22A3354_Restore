@implementation TSWPTextFieldTableViewCell

- (TSWPTextFieldTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  TSWPTextFieldTableViewCell *v4;
  TSWPTextFieldTableViewCell *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UITextField *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)TSWPTextFieldTableViewCell;
  v4 = -[TSWPTextFieldTableViewCell initWithStyle:reuseIdentifier:](&v13, sel_initWithStyle_reuseIdentifier_, 0, a4);
  v5 = v4;
  if (v4)
  {
    v6 = (void *)-[TSWPTextFieldTableViewCell contentView](v4, "contentView");
    objc_msgSend(v6, "bounds");
    v11 = (UITextField *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6EA8]), "initWithFrame:", v7 + 100.0, v9, v8 + -124.0, v10);
    v5->_textField = v11;
    -[UITextField setAutoresizingMask:](v11, "setAutoresizingMask:", 2);
    -[UITextField setReturnKeyType:](v5->_textField, "setReturnKeyType:", 9);
    -[UITextField setDelegate:](v5->_textField, "setDelegate:", v5);
    -[UITextField addTarget:action:forControlEvents:](v5->_textField, "addTarget:action:forControlEvents:", v5, sel_p_endEditingOnExit, 0x80000);
    objc_msgSend(v6, "insertSubview:aboveSubview:", v5->_textField, -[TSWPTextFieldTableViewCell textLabel](v5, "textLabel"));
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[UITextField removeTarget:action:forControlEvents:](self->_textField, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);

  v3.receiver = self;
  v3.super_class = (Class)TSWPTextFieldTableViewCell;
  -[TSWPTextFieldTableViewCell dealloc](&v3, sel_dealloc);
}

- (UITextField)textField
{
  return self->_textField;
}

@end
