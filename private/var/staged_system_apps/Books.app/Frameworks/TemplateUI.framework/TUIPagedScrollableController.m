@implementation TUIPagedScrollableController

- (TUIPagedScrollableController)init
{
  TUIPagedScrollableController *v2;
  uint64_t v3;
  NSMapTable *pagedScrollableMap;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TUIPagedScrollableController;
  v2 = -[TUIPagedScrollableController init](&v6, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMapTable mapTableWithKeyOptions:valueOptions:](NSMapTable, "mapTableWithKeyOptions:valueOptions:", 0, 5));
    pagedScrollableMap = v2->_pagedScrollableMap;
    v2->_pagedScrollableMap = (NSMapTable *)v3;

  }
  return v2;
}

- (id)_proxyForIdentifier:(id)a3
{
  id v4;
  _TUIPagedScrollableProxy *v5;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (v4)
  {
    v5 = (_TUIPagedScrollableProxy *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_pagedScrollableMap, "objectForKey:", v4));
    if (!v5)
    {
      v5 = objc_alloc_init(_TUIPagedScrollableProxy);
      -[NSMapTable setObject:forKey:](self->_pagedScrollableMap, "setObject:forKey:", v5, v4);
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)registerPagedScrollableWithWithIdentifier:(id)a3 action:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIPagedScrollableController _proxyForIdentifier:](self, "_proxyForIdentifier:", a3));
  objc_msgSend(v7, "setAction:", v6);

  return v7;
}

- (void)unregisterPagedScrollableWithIdentifier:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[TUIPagedScrollableController _proxyForIdentifier:](self, "_proxyForIdentifier:", a3));
  objc_msgSend(v3, "setAction:", 0);
  objc_msgSend(v3, "updateWithPageIndex:pageCount:", 0x7FFFFFFFFFFFFFFFLL, 0x7FFFFFFFFFFFFFFFLL);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pagedScrollableMap, 0);
}

@end
