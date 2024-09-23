@implementation TRIPBAutocreatedDictionary

- (void)dealloc
{
  objc_super v3;

  if (self->_autocreator)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIPBDictionary.m"), 12018, CFSTR("%@: Autocreator must be cleared before release, autocreator: %@"), objc_opt_class(), self->_autocreator);

  v3.receiver = self;
  v3.super_class = (Class)TRIPBAutocreatedDictionary;
  -[TRIPBAutocreatedDictionary dealloc](&v3, sel_dealloc);
}

- (unint64_t)count
{
  return -[NSMutableDictionary count](self->_dictionary, "count");
}

- (TRIPBAutocreatedDictionary)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5
{
  TRIPBAutocreatedDictionary *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TRIPBAutocreatedDictionary;
  v8 = -[TRIPBAutocreatedDictionary init](&v10, sel_init);
  if (v8)
    v8->_dictionary = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithObjects:forKeys:count:", a3, a4, a5);
  return v8;
}

- (id)objectForKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", a3);
}

- (id)keyEnumerator
{
  NSMutableDictionary *dictionary;

  dictionary = self->_dictionary;
  if (!dictionary)
  {
    dictionary = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    self->_dictionary = dictionary;
  }
  return (id)-[NSMutableDictionary keyEnumerator](dictionary, "keyEnumerator");
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  NSMutableDictionary *dictionary;
  TRIPBMessage *autocreator;

  dictionary = self->_dictionary;
  if (!dictionary)
  {
    dictionary = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    self->_dictionary = dictionary;
  }
  -[NSMutableDictionary setObject:forKey:](dictionary, "setObject:forKey:", a3, a4);
  autocreator = self->_autocreator;
  if (autocreator)
    TRIPBAutocreatedDictionaryModified(autocreator, (uint64_t)self);
}

- (void)removeObjectForKey:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_dictionary, "removeObjectForKey:", a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSMutableDictionary *dictionary;

  dictionary = self->_dictionary;
  if (dictionary)
    return (id)-[NSMutableDictionary copyWithZone:](dictionary, "copyWithZone:", a3);
  else
    return (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99E08], "allocWithZone:", a3), "init");
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  NSMutableDictionary *dictionary;

  dictionary = self->_dictionary;
  if (dictionary)
    return (id)-[NSMutableDictionary mutableCopyWithZone:](dictionary, "mutableCopyWithZone:", a3);
  else
    return (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99E08], "allocWithZone:", a3), "init");
}

- (id)objectForKeyedSubscript:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", a3);
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  NSMutableDictionary *dictionary;
  TRIPBMessage *autocreator;

  dictionary = self->_dictionary;
  if (!dictionary)
  {
    dictionary = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    self->_dictionary = dictionary;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](dictionary, "setObject:forKeyedSubscript:", a3, a4);
  autocreator = self->_autocreator;
  if (autocreator)
    TRIPBAutocreatedDictionaryModified(autocreator, (uint64_t)self);
}

- (void)enumerateKeysAndObjectsUsingBlock:(id)a3
{
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_dictionary, "enumerateKeysAndObjectsUsingBlock:", a3);
}

- (void)enumerateKeysAndObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  -[NSMutableDictionary enumerateKeysAndObjectsWithOptions:usingBlock:](self->_dictionary, "enumerateKeysAndObjectsWithOptions:usingBlock:", a3, a4);
}

@end
