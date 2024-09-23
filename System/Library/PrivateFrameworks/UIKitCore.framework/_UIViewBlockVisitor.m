@implementation _UIViewBlockVisitor

- (BOOL)_visitView:(id)a3
{
  uint64_t (**v5)(id, id);

  if (!-[_UIViewBlockVisitor visitorBlock](self, "visitorBlock"))
    return 1;
  v5 = -[_UIViewBlockVisitor visitorBlock](self, "visitorBlock");
  return v5[2](v5, a3);
}

- (id)visitorBlock
{
  return self->_visitorBlock;
}

- (_UIViewBlockVisitor)initWithTraversalDirection:(unint64_t)a3 visitorBlock:(id)a4
{
  _UIViewBlockVisitor *v5;
  _UIViewBlockVisitor *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIViewBlockVisitor;
  v5 = -[_UIViewVisitor initWithTraversalDirection:](&v8, sel_initWithTraversalDirection_, a3);
  v6 = v5;
  if (v5)
    -[_UIViewBlockVisitor setVisitorBlock:](v5, "setVisitorBlock:", a4);
  return v6;
}

- (void)setVisitorBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)dealloc
{
  id visitorBlock;
  objc_super v4;

  visitorBlock = self->_visitorBlock;
  if (visitorBlock)

  v4.receiver = self;
  v4.super_class = (Class)_UIViewBlockVisitor;
  -[_UIViewBlockVisitor dealloc](&v4, sel_dealloc);
}

@end
