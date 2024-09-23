@implementation REKeyValueMap

- (REKeyValueMap)init
{
  return -[REKeyValueMap initWithCapacity:](self, "initWithCapacity:", 16);
}

- (REKeyValueMap)initWithCapacity:(unint64_t)a3
{
  REKeyValueMap *v4;
  uint64_t v5;
  NSMapTable *keyMap;
  uint64_t v7;
  NSMapTable *valueMap;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)REKeyValueMap;
  v4 = -[REKeyValueMap init](&v10, sel_init);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, a3);
    keyMap = v4->_keyMap;
    v4->_keyMap = (NSMapTable *)v5;

    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, a3);
    valueMap = v4->_valueMap;
    v4->_valueMap = (NSMapTable *)v7;

  }
  return v4;
}

- (unint64_t)count
{
  return -[NSMapTable count](self->_keyMap, "count");
}

- (unint64_t)valueCount
{
  return -[NSMapTable count](self->_valueMap, "count");
}

- (void)addKey:(id)a3 withValue:(id)a4
{
  NSMapTable *keyMap;
  id v7;
  id v8;

  keyMap = self->_keyMap;
  v7 = a4;
  v8 = a3;
  -[NSMapTable setObject:forKey:](keyMap, "setObject:forKey:", v7, v8);
  -[NSMapTable setObject:forKey:](self->_valueMap, "setObject:forKey:", v8, v7);

}

- (void)removeKey:(id)a3
{
  NSMapTable *keyMap;
  id v5;
  id v6;

  keyMap = self->_keyMap;
  v5 = a3;
  -[NSMapTable objectForKey:](keyMap, "objectForKey:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMapTable removeObjectForKey:](self->_valueMap, "removeObjectForKey:", v6);
  -[NSMapTable removeObjectForKey:](self->_keyMap, "removeObjectForKey:", v5);

}

- (id)valueForKey:(id)a3
{
  return -[NSMapTable objectForKey:](self->_keyMap, "objectForKey:", a3);
}

- (id)keyForValue:(id)a3
{
  return -[NSMapTable objectForKey:](self->_valueMap, "objectForKey:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueMap, 0);
  objc_storeStrong((id *)&self->_keyMap, 0);
}

@end
