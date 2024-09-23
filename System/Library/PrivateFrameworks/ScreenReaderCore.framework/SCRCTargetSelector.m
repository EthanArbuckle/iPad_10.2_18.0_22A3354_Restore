@implementation SCRCTargetSelector

+ (id)targetSelectorWithTarget:(id)a3 selector:(SEL)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTarget:selector:", v6, a4);

  return v7;
}

- (SCRCTargetSelector)initWithTarget:(id)a3 selector:(SEL)a4
{
  id v6;
  SCRCTargetSelector *v7;
  SCRCTargetSelector *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SCRCTargetSelector;
  v7 = -[SCRCTargetSelector init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak(&v7->_target, v6);
    v8->_selector = a4;
  }

  return v8;
}

- (id)target
{
  return objc_loadWeakRetained(&self->_target);
}

- (SEL)selector
{
  return self->_selector;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_target);
}

@end
