@implementation TUIViewFactory

- (TUIViewFactory)initWithRegistry:(id)a3
{
  id v5;
  TUIViewFactory *v6;
  TUIViewFactory *v7;
  TUIReusableSubviewPool *v8;
  TUIReusableSubviewPool *subviewPool;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TUIViewFactory;
  v6 = -[TUIViewFactory init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_registry, a3);
    v8 = -[TUIReusableSubviewPool initWithRegistry:]([TUIReusableSubviewPool alloc], "initWithRegistry:", v5);
    subviewPool = v7->_subviewPool;
    v7->_subviewPool = v8;

  }
  return v7;
}

- (id)viewFactoryDequeueReusableSubviewWithReuseIdentifier:(id)a3 indexPath:(id)a4 host:(id)a5
{
  void *v6;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableSubviewPool dequeueReusableSubviewWithReuseIdentifier:host:](self->_subviewPool, "dequeueReusableSubviewWithReuseIdentifier:host:", a3, a5));
  if ((objc_opt_respondsToSelector(v6, "setFactory:") & 1) != 0)
    objc_msgSend(v6, "setFactory:", self);
  objc_msgSend(v6, "setHidden:", 0);
  return v6;
}

- (void)viewFactoryPrepareToReuseHost:(id)a3
{
  -[TUIReusableSubviewPool prepareToReuseHost:](self->_subviewPool, "prepareToReuseHost:", a3);
}

- (void)viewFactoryReuseSubviews:(id)a3 host:(id)a4
{
  -[TUIReusableSubviewPool reuseSubviews:host:](self->_subviewPool, "reuseSubviews:host:", a3, a4);
}

- (void)clearPool
{
  -[TUIReusableSubviewPool clearPool](self->_subviewPool, "clearPool");
}

- (TUIViewRegistry)registry
{
  return self->_registry;
}

- (TUIReusableSubviewPool)subviewPool
{
  return self->_subviewPool;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subviewPool, 0);
  objc_storeStrong((id *)&self->_registry, 0);
}

@end
