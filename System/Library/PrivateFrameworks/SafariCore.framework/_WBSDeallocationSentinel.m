@implementation _WBSDeallocationSentinel

- (_WBSDeallocationSentinel)initWithObserver:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  _WBSDeallocationSentinel *v8;
  _WBSDeallocationSentinel *v9;
  _WBSDeallocationSentinel *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_WBSDeallocationSentinel;
  v8 = -[_WBSDeallocationSentinel init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_observer, v6);
    objc_storeStrong(&v9->_context, a4);
    v10 = v9;
  }

  return v9;
}

- (void)dealloc
{
  id WeakRetained;
  void *v4;
  objc_super v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "sentinelDidDeallocateWithContext:", self->_context);

  v5.receiver = self;
  v5.super_class = (Class)_WBSDeallocationSentinel;
  -[_WBSDeallocationSentinel dealloc](&v5, sel_dealloc);
}

- (WBSDeallocationSentinelObserver)observer
{
  return (WBSDeallocationSentinelObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (void)setObserver:(id)a3
{
  objc_storeWeak((id *)&self->_observer, a3);
}

- (id)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_context, 0);
  objc_destroyWeak((id *)&self->_observer);
}

@end
