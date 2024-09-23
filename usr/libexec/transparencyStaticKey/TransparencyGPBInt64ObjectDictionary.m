@implementation TransparencyGPBInt64ObjectDictionary

- (TransparencyGPBInt64ObjectDictionary)init
{
  return -[TransparencyGPBInt64ObjectDictionary initWithObjects:forKeys:count:](self, "initWithObjects:forKeys:count:", 0, 0, 0);
}

- (TransparencyGPBInt64ObjectDictionary)initWithObjects:(const void *)a3 forKeys:(const int64_t *)a4 count:(unint64_t)a5
{
  TransparencyGPBInt64ObjectDictionary *v8;
  const void *v9;
  uint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)TransparencyGPBInt64ObjectDictionary;
  v8 = -[TransparencyGPBInt64ObjectDictionary init](&v12, "init");
  if (v8)
  {
    v8->_dictionary = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    if (a4)
    {
      if (a3 && a5)
      {
        do
        {
          v9 = *a3;
          if (!*a3)
          {
            +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("Attempting to add nil object to a Dictionary"));
            v9 = *a3;
          }
          v10 = *a4++;
          -[NSMutableDictionary setObject:forKey:](v8->_dictionary, "setObject:forKey:", v9, +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v10));
          ++a3;
          --a5;
        }
        while (a5);
      }
    }
  }
  return v8;
}

- (TransparencyGPBInt64ObjectDictionary)initWithDictionary:(id)a3
{
  TransparencyGPBInt64ObjectDictionary *v4;
  TransparencyGPBInt64ObjectDictionary *v5;

  v4 = -[TransparencyGPBInt64ObjectDictionary initWithObjects:forKeys:count:](self, "initWithObjects:forKeys:count:", 0, 0, 0);
  v5 = v4;
  if (a3 && v4)
    -[NSMutableDictionary addEntriesFromDictionary:](v4->_dictionary, "addEntriesFromDictionary:", *((_QWORD *)a3 + 2));
  return v5;
}

- (TransparencyGPBInt64ObjectDictionary)initWithCapacity:(unint64_t)a3
{
  return -[TransparencyGPBInt64ObjectDictionary initWithObjects:forKeys:count:](self, "initWithObjects:forKeys:count:", 0, 0, 0);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TransparencyGPBInt64ObjectDictionary;
  -[TransparencyGPBInt64ObjectDictionary dealloc](&v3, "dealloc");
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TransparencyGPBInt64ObjectDictionary initWithDictionary:](+[TransparencyGPBInt64ObjectDictionary allocWithZone:](TransparencyGPBInt64ObjectDictionary, "allocWithZone:", a3), "initWithDictionary:", self);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;

  if (self == a3)
    return 1;
  v5 = objc_opt_class(TransparencyGPBInt64ObjectDictionary, a2);
  if ((objc_opt_isKindOfClass(a3, v5) & 1) != 0)
    return -[NSMutableDictionary isEqual:](self->_dictionary, "isEqual:", *((_QWORD *)a3 + 2));
  else
    return 0;
}

- (unint64_t)hash
{
  return (unint64_t)-[NSMutableDictionary count](self->_dictionary, "count");
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p> { %@ }"), objc_opt_class(self, a2), self, self->_dictionary);
}

- (unint64_t)count
{
  return (unint64_t)-[NSMutableDictionary count](self->_dictionary, "count");
}

- (void)enumerateKeysAndObjectsUsingBlock:(id)a3
{
  NSMutableDictionary *dictionary;
  id v5;
  id v6;
  char v7;

  v7 = 0;
  dictionary = self->_dictionary;
  v5 = -[NSMutableDictionary keyEnumerator](dictionary, "keyEnumerator");
  do
  {
    v6 = objc_msgSend(v5, "nextObject");
    if (!v6)
      break;
    (*((void (**)(id, id, id, char *))a3 + 2))(a3, objc_msgSend(v6, "longLongValue"), -[NSMutableDictionary objectForKeyedSubscript:](dictionary, "objectForKeyedSubscript:", v6), &v7);
  }
  while (!v7);
}

- (BOOL)isInitialized
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = -[NSMutableDictionary objectEnumerator](self->_dictionary, "objectEnumerator", 0);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v10 != v5)
        objc_enumerationMutation(v2);
      v7 = objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v6), "isInitialized");
      if (!v7)
        break;
      if (v4 == (id)++v6)
      {
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v4)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    LOBYTE(v7) = 1;
  }
  return v7;
}

- (id)deepCopyWithZone:(_NSZone *)a3
{
  TransparencyGPBInt64ObjectDictionary *v5;
  id v6;
  NSMutableDictionary *dictionary;
  id v8;
  id v9;
  id v10;

  v5 = objc_alloc_init(TransparencyGPBInt64ObjectDictionary);
  v6 = -[NSMutableDictionary keyEnumerator](self->_dictionary, "keyEnumerator");
  dictionary = v5->_dictionary;
  v8 = objc_msgSend(v6, "nextObject");
  if (v8)
  {
    v9 = v8;
    do
    {
      v10 = objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", v9), "copyWithZone:", a3);
      -[NSMutableDictionary setObject:forKey:](dictionary, "setObject:forKey:", v10, v9);

      v9 = objc_msgSend(v6, "nextObject");
    }
    while (v9);
  }
  return v5;
}

- (unint64_t)computeSerializedSizeAsField:(id)a3
{
  NSMutableDictionary *dictionary;
  unint64_t result;
  unint64_t v6;
  int v7;
  int v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  char *v15;

  dictionary = self->_dictionary;
  result = (unint64_t)-[NSMutableDictionary count](dictionary, "count");
  if (result)
  {
    v6 = result;
    v7 = *(unsigned __int8 *)(*((_QWORD *)a3 + 1) + 30);
    v8 = objc_msgSend(a3, "mapKeyDataType");
    v9 = -[NSMutableDictionary keyEnumerator](dictionary, "keyEnumerator");
    v10 = objc_msgSend(v9, "nextObject");
    if (v10)
    {
      v11 = v10;
      v12 = 0;
      do
      {
        v13 = -[NSMutableDictionary objectForKeyedSubscript:](dictionary, "objectForKeyedSubscript:", v11);
        v14 = sub_1000377C8((unint64_t)objc_msgSend(v11, "longLongValue"), 1, v8);
        v15 = &sub_1000354EC(v13, v7)[v14];
        v12 += (uint64_t)&v15[sub_100018CC8(v15)];
        v11 = objc_msgSend(v9, "nextObject");
      }
      while (v11);
    }
    else
    {
      v12 = 0;
    }
    return v12 + sub_10001ABAC(*(_DWORD *)(*((_QWORD *)a3 + 1) + 16), 15) * v6;
  }
  return result;
}

- (void)writeToCodedOutputStream:(id)a3 asField:(id)a4
{
  int v7;
  int v8;
  uint64_t v9;
  NSMutableDictionary *dictionary;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  int v16;

  v7 = *(unsigned __int8 *)(*((_QWORD *)a4 + 1) + 30);
  v8 = objc_msgSend(a4, "mapKeyDataType");
  v9 = sub_100023730(*(_DWORD *)(*((_QWORD *)a4 + 1) + 16), 2);
  dictionary = self->_dictionary;
  v11 = -[NSMutableDictionary keyEnumerator](dictionary, "keyEnumerator");
  v12 = objc_msgSend(v11, "nextObject");
  if (v12)
  {
    v13 = v12;
    do
    {
      v14 = -[NSMutableDictionary objectForKeyedSubscript:](dictionary, "objectForKeyedSubscript:", v13);
      objc_msgSend(a3, "writeInt32NoTag:", v9);
      v15 = objc_msgSend(v13, "longLongValue");
      v16 = sub_1000377C8((unint64_t)v15, 1, v8);
      objc_msgSend(a3, "writeInt32NoTag:", sub_1000354EC(v14, v7) + v16);
      sub_100037964(a3, (uint64_t)v15, 1, v8);
      sub_10003561C(a3, (const char *)v14, v7);
      v13 = objc_msgSend(v11, "nextObject");
    }
    while (v13);
  }
}

- (void)setTransparencyGPBGenericValue:(id *)a3 forTransparencyGPBGenericValueKey:(id *)a4
{
  -[NSMutableDictionary setObject:forKey:](self->_dictionary, "setObject:forKey:", a3->var2, +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", a4->var2));
}

- (void)enumerateForTextFormat:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100048054;
  v3[3] = &unk_100072138;
  v3[4] = a3;
  -[TransparencyGPBInt64ObjectDictionary enumerateKeysAndObjectsUsingBlock:](self, "enumerateKeysAndObjectsUsingBlock:", v3);
}

- (id)objectForKey:(int64_t)a3
{
  return -[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", a3));
}

- (void)addEntriesFromDictionary:(id)a3
{
  TransparencyGPBMessage *autocreator;

  if (a3)
  {
    -[NSMutableDictionary addEntriesFromDictionary:](self->_dictionary, "addEntriesFromDictionary:", *((_QWORD *)a3 + 2));
    autocreator = self->_autocreator;
    if (autocreator)
      sub_10002922C(autocreator, (uint64_t)self);
  }
}

- (void)setObject:(id)a3 forKey:(int64_t)a4
{
  TransparencyGPBMessage *autocreator;

  if (!a3)
    +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("Attempting to add nil object to a Dictionary"));
  -[NSMutableDictionary setObject:forKey:](self->_dictionary, "setObject:forKey:", a3, +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", a4));
  autocreator = self->_autocreator;
  if (autocreator)
    sub_10002922C(autocreator, (uint64_t)self);
}

- (void)removeObjectForKey:(int64_t)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_dictionary, "removeObjectForKey:", +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", a3));
}

- (void)removeAll
{
  -[NSMutableDictionary removeAllObjects](self->_dictionary, "removeAllObjects");
}

@end
