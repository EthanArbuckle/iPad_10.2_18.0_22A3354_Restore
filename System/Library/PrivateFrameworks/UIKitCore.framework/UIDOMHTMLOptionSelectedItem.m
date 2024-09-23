@implementation UIDOMHTMLOptionSelectedItem

- (UIDOMHTMLOptionSelectedItem)initWithHTMLOptionNode:(id)a3
{
  UIDOMHTMLOptionSelectedItem *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIDOMHTMLOptionSelectedItem;
  v4 = -[UIDOMHTMLOptionSelectedItem init](&v6, sel_init);
  if (v4)
  {
    v4->_selected = objc_msgSend(a3, "selected");
    -[UIDOMHTMLOptionSelectedItem set_node:](v4, "set_node:", a3);
  }
  return v4;
}

- (id)node
{
  return self->_node;
}

- (BOOL)selected
{
  return self->_selected;
}

- (BOOL)isGroup
{
  return 0;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
  -[DOMHTMLOptionElement setSelected:](self->_node, "setSelected:");
}

- (void)unselect
{
  self->_selected = 0;
}

- (void)dealloc
{
  objc_super v3;

  -[UIDOMHTMLOptionSelectedItem set_node:](self, "set_node:", 0);
  v3.receiver = self;
  v3.super_class = (Class)UIDOMHTMLOptionSelectedItem;
  -[UIDOMHTMLOptionSelectedItem dealloc](&v3, sel_dealloc);
}

- (DOMHTMLOptionElement)_node
{
  return self->_node;
}

- (void)set_node:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
