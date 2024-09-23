@implementation UIKBGraphCache

- (BOOL)_matchingOptions:(id)a3
{
  return 1;
}

- (UIScreen)_intendedScreen
{
  return self->_screen;
}

- (id)_initWithScreen:(id)a3 options:(id)a4
{
  id v6;
  UIKBGraphCache *v7;
  uint64_t v8;
  NSMutableDictionary *graphCache;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UIKBGraphCache;
  v7 = -[UIKBGraphCache init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 30);
    graphCache = v7->_graphCache;
    v7->_graphCache = (NSMutableDictionary *)v8;

    objc_storeStrong((id *)&v7->_screen, a3);
  }

  return v7;
}

- (NSMutableDictionary)graphCache
{
  return self->_graphCache;
}

+ (id)graphCacheForScreen:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  +[_UIObjectPerScreen objectOfClass:forScreen:withOptions:createIfNecessary:](_UIObjectPerScreen, "objectOfClass:forScreen:withOptions:createIfNecessary:", objc_opt_class(), v3, 0, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSDictionary)_options
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graphCache, 0);
  objc_storeStrong((id *)&self->_screen, 0);
}

@end
