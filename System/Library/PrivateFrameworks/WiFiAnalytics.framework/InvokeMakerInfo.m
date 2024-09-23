@implementation InvokeMakerInfo

- (InvokeMakerInfo)initWithSel:(SEL)a3 andTarget:(id)a4
{
  id v6;
  InvokeMakerInfo *v7;
  id target;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)InvokeMakerInfo;
  v7 = -[InvokeMakerInfo init](&v10, sel_init);
  target = v7->_target;
  v7->_selector = a3;
  v7->_target = v6;

  return v7;
}

- (SEL)selector
{
  return self->_selector;
}

- (void)setSelector:(SEL)a3
{
  self->_selector = a3;
}

- (id)target
{
  return self->_target;
}

- (void)setTarget:(id)a3
{
  objc_storeStrong(&self->_target, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_target, 0);
}

@end
