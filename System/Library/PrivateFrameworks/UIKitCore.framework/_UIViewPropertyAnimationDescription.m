@implementation _UIViewPropertyAnimationDescription

- (_UIViewPropertyAnimationDescription)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_UIViewPropertyAnimationDescription init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("Don't call %@."), v5);

  return 0;
}

- (_UIViewPropertyAnimationDescription)initWithView:(id)a3
{
  id v4;
  _UIViewPropertyAnimationDescription *v5;
  _UIViewPropertyAnimationDescription *v6;
  uint64_t v7;
  NSMutableDictionary *updates;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UIViewPropertyAnimationDescription;
  v5 = -[_UIViewPropertyAnimationDescription init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_view, v4);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    updates = v6->_updates;
    v6->_updates = (NSMutableDictionary *)v7;

  }
  return v6;
}

- (void)_addUpdate:(id)a3
{
  id v4;
  NSMutableDictionary *updates;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  void *v9;
  id v10;

  v4 = a3;
  updates = self->_updates;
  v10 = v4;
  objc_msgSend(v4, "propertyName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](updates, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = self->_updates;
    objc_msgSend(v10, "propertyName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v7, v9);

  }
  objc_msgSend(v7, "addObject:", v10);

}

- (NSMutableDictionary)updates
{
  return self->_updates;
}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_view);
  objc_storeStrong((id *)&self->_updates, 0);
}

@end
