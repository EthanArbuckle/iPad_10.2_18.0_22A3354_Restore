@implementation RTObserverRecord

- (id)observer
{
  return objc_loadWeakRetained(&self->_observer);
}

- (SEL)selector
{
  return self->_selector;
}

- (RTObserverRecord)initWithObserver:(id)a3 selector:(SEL)a4
{
  id v6;
  RTObserverRecord *v7;
  RTObserverRecord *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RTObserverRecord;
  v7 = -[RTObserverRecord init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak(&v7->_observer, v6);
    v8->_selector = a4;
  }

  return v8;
}

- (void)setObserver:(id)a3
{
  objc_storeWeak(&self->_observer, a3);
}

- (void)setSelector:(SEL)a3
{
  self->_selector = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_observer);
}

@end
