@implementation DebugItem

- (DebugItem)initWithTitle:(id)a3 target:(id)a4 action:(SEL)a5
{
  DebugItem *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)DebugItem;
  v8 = -[DebugItem init](&v10, sel_init);
  if (v8)
  {
    v8->_title = (NSString *)objc_msgSend(a3, "copy");
    v8->_target = a4;
    v8->_action = a5;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DebugItem;
  -[DebugItem dealloc](&v3, sel_dealloc);
}

- (NSString)title
{
  return self->_title;
}

- (id)target
{
  return self->_target;
}

- (SEL)action
{
  return self->_action;
}

@end
