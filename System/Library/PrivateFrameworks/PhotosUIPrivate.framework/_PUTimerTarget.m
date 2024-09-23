@implementation _PUTimerTarget

- (void)handleTimer:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_PUTimerTarget target](self, "target");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performSelector:withObject:", -[_PUTimerTarget selector](self, "selector"), v4);

}

- (id)target
{
  return objc_loadWeakRetained(&self->_target);
}

- (void)setTarget:(id)a3
{
  objc_storeWeak(&self->_target, a3);
}

- (SEL)selector
{
  return self->_selector;
}

- (void)setSelector:(SEL)a3
{
  self->_selector = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_target);
}

@end
