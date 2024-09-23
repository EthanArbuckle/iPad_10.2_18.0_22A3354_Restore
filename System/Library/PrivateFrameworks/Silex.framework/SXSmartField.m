@implementation SXSmartField

- (SXSmartField)initWithContext:(id)a3 URL:(id)a4 action:(id)a5
{
  id v9;
  SXSmartField *v10;
  SXSmartField *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)SXSmartField;
  v10 = -[TSWPHyperlinkField initWithContext:url:](&v13, sel_initWithContext_url_, a3, a4);
  v11 = v10;
  if (v10)
    objc_storeStrong(&v10->_action, a5);

  return v11;
}

- (id)copyWithContext:(id)a3
{
  id *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SXSmartField;
  v4 = -[TSWPHyperlinkField copyWithContext:](&v6, sel_copyWithContext_, a3);
  objc_storeStrong(v4 + 9, self->_action);
  return v4;
}

- (id)action
{
  return self->_action;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_action, 0);
}

@end
