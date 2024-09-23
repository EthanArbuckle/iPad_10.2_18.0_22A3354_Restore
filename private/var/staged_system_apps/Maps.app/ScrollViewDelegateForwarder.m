@implementation ScrollViewDelegateForwarder

- (void)setOriginalDelegate:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_originalDelegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_originalDelegate, obj);
    self->_respondsTo_scrollViewDidEndScrollingAnimation = objc_opt_respondsToSelector(obj, "scrollViewDidEndScrollingAnimation:") & 1;
  }

}

- (BOOL)respondsToSelector:(SEL)a3
{
  id WeakRetained;
  BOOL v6;
  objc_super v8;

  if ("scrollViewDidEndScrollingAnimation:" == a3)
    return 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_originalDelegate);
  if ((objc_opt_respondsToSelector(WeakRetained, a3) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)ScrollViewDelegateForwarder;
    v6 = -[ScrollViewDelegateForwarder respondsToSelector:](&v8, "respondsToSelector:", a3);
  }

  return v6;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return objc_loadWeakRetained((id *)&self->_originalDelegate);
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;

  v6 = a3;
  if (self->_respondsTo_scrollViewDidEndScrollingAnimation)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_originalDelegate);
    objc_msgSend(WeakRetained, "scrollViewDidEndScrollingAnimation:", v6);

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("ScrollingFinishedNotification"), v6);

}

- (UIScrollViewDelegate)originalDelegate
{
  return (UIScrollViewDelegate *)objc_loadWeakRetained((id *)&self->_originalDelegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_originalDelegate);
}

@end
