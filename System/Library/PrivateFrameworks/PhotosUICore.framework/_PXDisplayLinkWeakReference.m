@implementation _PXDisplayLinkWeakReference

- (_PXDisplayLinkWeakReference)initWithObject:(id)a3 selector:(SEL)a4
{
  id v6;
  _PXDisplayLinkWeakReference *v7;
  _PXDisplayLinkWeakReference *v8;

  v6 = a3;
  v7 = -[_PXDisplayLinkWeakReference init](self, "init");
  v8 = v7;
  if (v7)
  {
    objc_storeWeak(&v7->_object, v6);
    v8->_selector = a4;
  }

  return v8;
}

- (void)handleDisplayLink:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[_PXDisplayLinkWeakReference object](self, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v4, "performSelector:withObject:", -[_PXDisplayLinkWeakReference selector](self, "selector"), v5);
  else
    objc_msgSend(v5, "invalidate");

}

- (id)object
{
  return objc_loadWeakRetained(&self->_object);
}

- (SEL)selector
{
  return self->_selector;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_object);
}

@end
