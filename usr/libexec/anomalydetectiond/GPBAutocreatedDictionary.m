@implementation GPBAutocreatedDictionary

- (void)dealloc
{
  objc_super v3;

  if (self->_autocreator)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GPBDictionary.m"), 12048, CFSTR("%@: Autocreator must be cleared before release, autocreator: %@"), objc_opt_class(self), self->_autocreator);

  v3.receiver = self;
  v3.super_class = (Class)GPBAutocreatedDictionary;
  -[GPBAutocreatedDictionary dealloc](&v3, "dealloc");
}

- (GPBAutocreatedDictionary)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5
{
  GPBAutocreatedDictionary *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)GPBAutocreatedDictionary;
  v8 = -[GPBAutocreatedDictionary init](&v10, "init");
  if (v8)
    v8->_dictionary = (NSMutableDictionary *)objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithObjects:forKeys:count:", a3, a4, a5);
  return v8;
}

- (unint64_t)count
{
  return (unint64_t)-[NSMutableDictionary count](self->_dictionary, "count");
}

- (id)objectForKey:(id)a3
{
  return -[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", a3);
}

- (id)keyEnumerator
{
  NSMutableDictionary *dictionary;

  dictionary = self->_dictionary;
  if (!dictionary)
  {
    dictionary = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    self->_dictionary = dictionary;
  }
  return -[NSMutableDictionary keyEnumerator](dictionary, "keyEnumerator");
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  NSMutableDictionary *dictionary;
  GPBMessage *autocreator;

  dictionary = self->_dictionary;
  if (!dictionary)
  {
    dictionary = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    self->_dictionary = dictionary;
  }
  -[NSMutableDictionary setObject:forKey:](dictionary, "setObject:forKey:", a3, a4);
  autocreator = self->_autocreator;
  if (autocreator)
    GPBAutocreatedDictionaryModified(autocreator, (uint64_t)self);
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
    return -[NSMutableDictionary copyWithZone:](dictionary, "copyWithZone:", a3);
  else
    return -[NSMutableDictionary init](+[NSMutableDictionary allocWithZone:](NSMutableDictionary, "allocWithZone:", a3), "init");
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  NSMutableDictionary *dictionary;

  dictionary = self->_dictionary;
  if (dictionary)
    return -[NSMutableDictionary mutableCopyWithZone:](dictionary, "mutableCopyWithZone:", a3);
  else
    return -[NSMutableDictionary init](+[NSMutableDictionary allocWithZone:](NSMutableDictionary, "allocWithZone:", a3), "init");
}

- (id)objectForKeyedSubscript:(id)a3
{
  return -[NSMutableDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", a3);
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  NSMutableDictionary *dictionary;
  GPBMessage *autocreator;

  dictionary = self->_dictionary;
  if (!dictionary)
  {
    dictionary = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    self->_dictionary = dictionary;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](dictionary, "setObject:forKeyedSubscript:", a3, a4);
  autocreator = self->_autocreator;
  if (autocreator)
    GPBAutocreatedDictionaryModified(autocreator, (uint64_t)self);
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
