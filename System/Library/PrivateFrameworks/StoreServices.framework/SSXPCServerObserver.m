@implementation SSXPCServerObserver

- (SEL)selector
{
  return self->_selector;
}

- (id)observer
{
  return self->_observer;
}

- (unint64_t)hash
{
  return objc_msgSend(self->_observer, "hash");
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;
  id observer;
  int v7;
  uint64_t v8;
  const char *v10;
  const char *selector;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v5 = objc_msgSend(a3, "observer");
  observer = self->_observer;
  if (observer == (id)v5)
  {
    v8 = objc_msgSend(a3, "selector");
  }
  else
  {
    v7 = objc_msgSend(observer, "isEqual:");
    v8 = objc_msgSend(a3, "selector");
    if (!v7)
      return 0;
  }
  v10 = (const char *)v8;
  selector = self->_selector;
  return selector == v10 || sel_isEqual(selector, v10);
}

- (void)setObserver:(id)a3
{
  self->_observer = a3;
}

- (void)setSelector:(SEL)a3
{
  self->_selector = a3;
}

@end
