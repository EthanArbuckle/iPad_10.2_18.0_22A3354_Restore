@implementation ACFDispatchHelper

- (ACFDispatchHelper)initWithBlock:(id)a3
{
  ACFDispatchHelper *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACFDispatchHelper;
  v4 = -[ACFDispatchHelper init](&v6, sel_init);
  if (v4)
    v4->_block = (id)objc_msgSend(a3, "copy");
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  self->_block = 0;
  v3.receiver = self;
  v3.super_class = (Class)ACFDispatchHelper;
  -[ACFDispatchHelper dealloc](&v3, sel_dealloc);
}

- (void)dispatch
{
  (*((void (**)(void))self->_block + 2))();

  self->_block = 0;
}

@end
