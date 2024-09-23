@implementation WBSScopeExitHandler

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
}

- (void)dealloc
{
  void (**handler)(id, SEL);
  objc_super v4;

  handler = (void (**)(id, SEL))self->_handler;
  if (handler)
    handler[2](handler, a2);
  v4.receiver = self;
  v4.super_class = (Class)WBSScopeExitHandler;
  -[WBSScopeExitHandler dealloc](&v4, sel_dealloc);
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)handler
{
  return self->_handler;
}

@end
