@implementation TUIBackgroundColorStyler

- (void)applyStylingToLayer:(id)a3
{
  UIColor *backgroundColor;
  id v4;

  backgroundColor = self->_backgroundColor;
  v4 = a3;
  objc_msgSend(v4, "setBackgroundColor:", -[UIColor CGColor](backgroundColor, "CGColor"));

}

- (void)applyStylingToView:(id)a3
{
  objc_msgSend(a3, "setBackgroundColor:", self->_backgroundColor);
}

- (BOOL)isEqualToStyle:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  TUIBackgroundColorStyler *v7;
  TUIBackgroundColorStyler *v8;
  UIColor *backgroundColor;
  unsigned __int8 v10;

  v4 = a3;
  v5 = objc_opt_class(v4);
  if (v5 == objc_opt_class(self))
    v6 = v4;
  else
    v6 = 0;
  v7 = v6;
  v8 = v7;
  if (v7 == self)
    goto LABEL_8;
  if (!v7)
  {
    v10 = 0;
    goto LABEL_10;
  }
  backgroundColor = self->_backgroundColor;
  if (backgroundColor == v8->_backgroundColor)
LABEL_8:
    v10 = 1;
  else
    v10 = -[UIColor isEqual:](backgroundColor, "isEqual:");
LABEL_10:

  return v10;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end
