@implementation _UIWebFormDelegateEditedFormsMap

- (_UIWebFormDelegateEditedFormsMap)init
{
  _UIWebFormDelegateEditedFormsMap *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIWebFormDelegateEditedFormsMap;
  v2 = -[_UIWebFormDelegateEditedFormsMap init](&v4, sel_init);
  if (v2)
  {
    v2->_lifetimeHelper = (NSMutableArray *)(id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v2->_map = (NSMutableDictionary *)(id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIWebFormDelegateEditedFormsMap;
  -[_UIWebFormDelegateEditedFormsMap dealloc](&v3, sel_dealloc);
}

- (id)_keyForWebFrame:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p"), a3);
}

- (id)objectForKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_map, "objectForKey:", -[_UIWebFormDelegateEditedFormsMap _keyForWebFrame:](self, "_keyForWebFrame:", a3));
}

- (id)allValues
{
  return (id)-[NSMutableDictionary allValues](self->_map, "allValues");
}

- (void)removeAllObjects
{
  -[NSMutableDictionary removeAllObjects](self->_map, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_lifetimeHelper, "removeAllObjects");
}

- (void)removeObjectForKey:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_map, "removeObjectForKey:", -[_UIWebFormDelegateEditedFormsMap _keyForWebFrame:](self, "_keyForWebFrame:"));
  -[NSMutableArray removeObject:](self->_lifetimeHelper, "removeObject:", a3);
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  if ((-[NSMutableArray containsObject:](self->_lifetimeHelper, "containsObject:", a4) & 1) == 0)
    -[NSMutableArray addObject:](self->_lifetimeHelper, "addObject:", a4);
  -[NSMutableDictionary setObject:forKey:](self->_map, "setObject:forKey:", a3, -[_UIWebFormDelegateEditedFormsMap _keyForWebFrame:](self, "_keyForWebFrame:", a4));
}

@end
