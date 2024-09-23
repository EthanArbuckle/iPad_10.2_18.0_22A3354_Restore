@implementation _UICalendarViewDecorationSystem

- (_UICalendarViewDecorationSystem)init
{
  _UICalendarViewDecorationSystem *v2;
  uint64_t v3;
  NSMutableDictionary *decorationViewFeed;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UICalendarViewDecorationSystem;
  v2 = -[_UICalendarViewDecorationSystem init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    decorationViewFeed = v2->_decorationViewFeed;
    v2->_decorationViewFeed = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (void)configureDecoration:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "_decorationViewReusableKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_decorationView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5 && v4)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_decorationViewFeed, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      -[NSMutableDictionary objectForKey:](self->_decorationViewFeed, "objectForKey:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSMutableDictionary objectForKey:](self->_decorationViewFeed, "objectForKey:", v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeLastObject");

    }
    else
    {
      v5 = 0;
    }
  }
  objc_msgSend(v11, "_decorationViewForReuseView:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_setDecorationView:", v10);

}

- (void)invalidateDecoration:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "_decorationView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperview");
  objc_msgSend(v8, "_decorationViewReusableKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[_UICalendarViewDecorationSystem _prepareDecorationFeedForKey:](self, "_prepareDecorationFeedForKey:", v5);
    -[_UICalendarViewDecorationSystem decorationViewFeed](self, "decorationViewFeed");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v4);

  }
  objc_msgSend(v8, "_setDecorationView:", 0);

}

- (void)reset
{
  -[NSMutableDictionary removeAllObjects](self->_decorationViewFeed, "removeAllObjects");
}

- (void)_prepareDecorationFeedForKey:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_decorationViewFeed, "objectForKeyedSubscript:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_decorationViewFeed, "setObject:forKeyedSubscript:", v5, v6);

  }
}

- (NSMutableDictionary)decorationViewFeed
{
  return self->_decorationViewFeed;
}

- (void)setDecorationViewFeed:(id)a3
{
  objc_storeStrong((id *)&self->_decorationViewFeed, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decorationViewFeed, 0);
}

@end
