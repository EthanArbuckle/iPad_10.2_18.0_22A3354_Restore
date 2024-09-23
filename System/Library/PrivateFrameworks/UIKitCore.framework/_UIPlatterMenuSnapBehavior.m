@implementation _UIPlatterMenuSnapBehavior

- (_UIPlatterMenuSnapBehavior)initWithItem:(id)a3 attachedToAnchor:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  _UIPlatterMenuSnapBehavior *v8;
  UIAttachmentBehavior *v9;
  UIAttachmentBehavior *spring1;
  UIAttachmentBehavior *v11;
  UIAttachmentBehavior *spring2;
  objc_super v14;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_UIPlatterMenuSnapBehavior;
  v8 = -[UIDynamicBehavior init](&v14, sel_init);
  if (v8)
  {
    v9 = -[UIAttachmentBehavior initWithItem:attachedToAnchor:]([UIAttachmentBehavior alloc], "initWithItem:attachedToAnchor:", v7, x, y);
    spring1 = v8->_spring1;
    v8->_spring1 = v9;

    v11 = -[UIAttachmentBehavior initWithItem:attachedToAnchor:]([UIAttachmentBehavior alloc], "initWithItem:attachedToAnchor:", v7, x, y);
    spring2 = v8->_spring2;
    v8->_spring2 = v11;

    -[UIAttachmentBehavior setLength:](v8->_spring1, "setLength:", 0.0);
    -[UIAttachmentBehavior setLength:](v8->_spring2, "setLength:", 0.0);
    -[UIDynamicBehavior addChildBehavior:](v8, "addChildBehavior:", v8->_spring1);
    -[UIDynamicBehavior addChildBehavior:](v8, "addChildBehavior:", v8->_spring2);
  }

  return v8;
}

- (double)damping
{
  double result;

  -[UIAttachmentBehavior damping](self->_spring1, "damping");
  return result;
}

- (void)setDamping:(double)a3
{
  -[UIAttachmentBehavior setDamping:](self->_spring1, "setDamping:");
  -[UIAttachmentBehavior setDamping:](self->_spring2, "setDamping:", a3);
}

- (double)frequency
{
  double result;

  -[UIAttachmentBehavior frequency](self->_spring1, "frequency");
  return result;
}

- (void)setFrequency:(double)a3
{
  -[UIAttachmentBehavior setFrequency:](self->_spring1, "setFrequency:");
  -[UIAttachmentBehavior setFrequency:](self->_spring2, "setFrequency:", a3);
}

- (CGPoint)anchorPoint
{
  double v2;
  double v3;
  CGPoint result;

  -[UIAttachmentBehavior anchorPoint](self->_spring1, "anchorPoint");
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setAnchorPoint:(CGPoint)a3
{
  double y;
  double x;

  y = a3.y;
  x = a3.x;
  -[UIAttachmentBehavior setAnchorPoint:](self->_spring1, "setAnchorPoint:");
  -[UIAttachmentBehavior setAnchorPoint:](self->_spring2, "setAnchorPoint:", x, y);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spring2, 0);
  objc_storeStrong((id *)&self->_spring1, 0);
}

@end
