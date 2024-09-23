@implementation ScrollViewDelegateProxy

- (id)forwardingTargetForSelector:(SEL)a3
{
  void *v5;
  char v6;
  void *v7;
  id v8;
  objc_super v10;

  if (protocol_getMethodDescription((Protocol *)&OBJC_PROTOCOL___UIScrollViewDelegate, a3, 0, 1) == 0uLL
    || (v5 = (void *)objc_claimAutoreleasedReturnValue(-[ScrollViewDelegateProxy scrollViewDelegate](self, "scrollViewDelegate")),
        v6 = objc_opt_respondsToSelector(v5, a3),
        v5,
        (v6 & 1) == 0))
  {
    v10.receiver = self;
    v10.super_class = (Class)ScrollViewDelegateProxy;
    v8 = -[ScrollViewDelegateProxy forwardingTargetForSelector:](&v10, "forwardingTargetForSelector:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v8);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ScrollViewDelegateProxy scrollViewDelegate](self, "scrollViewDelegate"));
  }
  return v7;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  void *v5;
  char v6;
  objc_super v8;

  if (protocol_getMethodDescription((Protocol *)&OBJC_PROTOCOL___UIScrollViewDelegate, a3, 0, 1) != 0uLL)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ScrollViewDelegateProxy scrollViewDelegate](self, "scrollViewDelegate"));
    v6 = objc_opt_respondsToSelector(v5, a3);

    if ((v6 & 1) != 0)
      return 1;
  }
  v8.receiver = self;
  v8.super_class = (Class)ScrollViewDelegateProxy;
  return -[ScrollViewDelegateProxy respondsToSelector:](&v8, "respondsToSelector:", a3);
}

- (UIScrollViewDelegate)scrollViewDelegate
{
  return (UIScrollViewDelegate *)objc_loadWeakRetained((id *)&self->_scrollViewDelegate);
}

- (void)setScrollViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_scrollViewDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scrollViewDelegate);
}

@end
