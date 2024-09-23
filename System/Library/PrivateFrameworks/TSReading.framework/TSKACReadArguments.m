@implementation TSKACReadArguments

- (TSKACReadArguments)initWithSelector:(SEL)a3 target:(id)a4 argument:(void *)a5
{
  return -[TSKACReadArguments initWithSelector:target:argument:argument2:](self, "initWithSelector:target:argument:argument2:", a3, a4, a5, 0);
}

- (TSKACReadArguments)initWithSelector:(SEL)a3 target:(id)a4 argument:(void *)a5 argument2:(id)a6
{
  TSKACReadArguments *v10;
  TSKACReadArguments *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)TSKACReadArguments;
  v10 = -[TSKACReadArguments init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_selector = a3;
    v10->_target = a4;
    v10->_argument = a5;
    v10->_argument2 = a6;
  }
  return v11;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSKACReadArguments;
  -[TSKACReadArguments dealloc](&v3, sel_dealloc);
}

- (SEL)selector
{
  return self->_selector;
}

- (id)target
{
  return self->_target;
}

- (void)argument
{
  return self->_argument;
}

- (id)argument2
{
  return self->_argument2;
}

@end
