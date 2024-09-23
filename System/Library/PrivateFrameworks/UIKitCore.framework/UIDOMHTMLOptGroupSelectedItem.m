@implementation UIDOMHTMLOptGroupSelectedItem

- (UIDOMHTMLOptGroupSelectedItem)initWithHTMLOptGroupNode:(id)a3
{
  UIDOMHTMLOptGroupSelectedItem *v4;
  UIDOMHTMLOptGroupSelectedItem *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIDOMHTMLOptGroupSelectedItem;
  v4 = -[UIDOMHTMLOptGroupSelectedItem init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[UIDOMHTMLOptGroupSelectedItem set_node:](v4, "set_node:", a3);
  return v5;
}

- (id)node
{
  return self->_node;
}

- (BOOL)selected
{
  return 0;
}

- (BOOL)isGroup
{
  return 1;
}

- (void)dealloc
{
  objc_super v3;

  -[UIDOMHTMLOptGroupSelectedItem set_node:](self, "set_node:", 0);
  v3.receiver = self;
  v3.super_class = (Class)UIDOMHTMLOptGroupSelectedItem;
  -[UIDOMHTMLOptGroupSelectedItem dealloc](&v3, sel_dealloc);
}

- (DOMHTMLOptGroupElement)_node
{
  return self->_node;
}

- (void)set_node:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

@end
