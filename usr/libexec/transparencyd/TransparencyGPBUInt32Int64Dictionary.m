@implementation TransparencyGPBUInt32Int64Dictionary

- (TransparencyGPBUInt32Int64Dictionary)init
{
  return -[TransparencyGPBUInt32Int64Dictionary initWithInt64s:forKeys:count:](self, "initWithInt64s:forKeys:count:", 0, 0, 0);
}

- (TransparencyGPBUInt32Int64Dictionary)initWithInt64s:(const int64_t *)a3 forKeys:(const unsigned int *)a4 count:(unint64_t)a5
{
  TransparencyGPBUInt32Int64Dictionary *v8;
  NSMutableDictionary *dictionary;
  uint64_t v10;
  NSNumber *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)TransparencyGPBUInt32Int64Dictionary;
  v8 = -[TransparencyGPBUInt32Int64Dictionary init](&v13, "init");
  if (v8)
  {
    v8->_dictionary = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    if (a4)
    {
      if (a3 && a5)
      {
        do
        {
          dictionary = v8->_dictionary;
          v10 = *a3++;
          v11 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v10);
          LODWORD(v10) = *a4++;
          -[NSMutableDictionary setObject:forKey:](dictionary, "setObject:forKey:", v11, +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v10));
          --a5;
        }
        while (a5);
      }
    }
  }
  return v8;
}

- (TransparencyGPBUInt32Int64Dictionary)initWithDictionary:(id)a3
{
  TransparencyGPBUInt32Int64Dictionary *v4;
  TransparencyGPBUInt32Int64Dictionary *v5;

  v4 = -[TransparencyGPBUInt32Int64Dictionary initWithInt64s:forKeys:count:](self, "initWithInt64s:forKeys:count:", 0, 0, 0);
  v5 = v4;
  if (a3 && v4)
    -[NSMutableDictionary addEntriesFromDictionary:](v4->_dictionary, "addEntriesFromDictionary:", *((_QWORD *)a3 + 2));
  return v5;
}

- (TransparencyGPBUInt32Int64Dictionary)initWithCapacity:(unint64_t)a3
{
  return -[TransparencyGPBUInt32Int64Dictionary initWithInt64s:forKeys:count:](self, "initWithInt64s:forKeys:count:", 0, 0, 0);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TransparencyGPBUInt32Int64Dictionary;
  -[TransparencyGPBUInt32Int64Dictionary dealloc](&v3, "dealloc");
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TransparencyGPBUInt32Int64Dictionary initWithDictionary:](+[TransparencyGPBUInt32Int64Dictionary allocWithZone:](TransparencyGPBUInt32Int64Dictionary, "allocWithZone:", a3), "initWithDictionary:", self);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;

  if (self == a3)
    return 1;
  v5 = objc_opt_class(TransparencyGPBUInt32Int64Dictionary, a2);
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

- (void)enumerateKeysAndInt64sUsingBlock:(id)a3
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
    (*((void (**)(id, id, id, char *))a3 + 2))(a3, objc_msgSend(v6, "unsignedIntValue"), objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](dictionary, "objectForKeyedSubscript:", v6), "longLongValue"), &v7);
  }
  while (!v7);
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
  uint64_t v15;

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
        v14 = sub_1000E33F4(objc_msgSend(v11, "unsignedIntValue"), 1, v8);
        v15 = sub_1000E4C78((unint64_t)objc_msgSend(v13, "longLongValue"), 2, v7) + v14;
        v12 += v15 + sub_1000DE5AC(v15);
        v11 = objc_msgSend(v9, "nextObject");
      }
      while (v11);
    }
    else
    {
      v12 = 0;
    }
    return v12 + sub_1000E0488(*(_DWORD *)(*((_QWORD *)a3 + 1) + 16), 15) * v6;
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
  id v16;

  v7 = *(unsigned __int8 *)(*((_QWORD *)a4 + 1) + 30);
  v8 = objc_msgSend(a4, "mapKeyDataType");
  v9 = sub_10010B59C(*(_DWORD *)(*((_QWORD *)a4 + 1) + 16), 2);
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
      v15 = objc_msgSend(v13, "unsignedIntValue");
      v16 = objc_msgSend(v14, "longLongValue");
      LODWORD(v14) = sub_1000E33F4(v15, 1, v8);
      objc_msgSend(a3, "writeInt32NoTag:", sub_1000E4C78((unint64_t)v16, 2, v7) + v14);
      if (v8 == 1)
      {
        objc_msgSend(a3, "writeFixed32:value:", 1, v15);
      }
      else if (v8 == 11)
      {
        objc_msgSend(a3, "writeUInt32:value:", 1, v15);
      }
      sub_1000E4E14(a3, (uint64_t)v16, 2, v7);
      v13 = objc_msgSend(v11, "nextObject");
    }
    while (v13);
  }
}

- (void)setTransparencyGPBGenericValue:(id *)a3 forTransparencyGPBGenericValueKey:(id *)a4
{
  -[NSMutableDictionary setObject:forKey:](self->_dictionary, "setObject:forKey:", +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", a3->var2), +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a4->var3));
}

- (void)enumerateForTextFormat:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000E4EEC;
  v3[3] = &unk_100244E70;
  v3[4] = a3;
  -[TransparencyGPBUInt32Int64Dictionary enumerateKeysAndInt64sUsingBlock:](self, "enumerateKeysAndInt64sUsingBlock:", v3);
}

- (BOOL)getInt64:(int64_t *)a3 forKey:(unsigned int)a4
{
  id v5;
  id v6;

  v5 = -[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *(_QWORD *)&a4));
  v6 = v5;
  if (a3 && v5)
    *a3 = (int64_t)objc_msgSend(v5, "longLongValue");
  return v6 != 0;
}

- (void)addEntriesFromDictionary:(id)a3
{
  TransparencyGPBMessage *autocreator;

  if (a3)
  {
    -[NSMutableDictionary addEntriesFromDictionary:](self->_dictionary, "addEntriesFromDictionary:", *((_QWORD *)a3 + 2));
    autocreator = self->_autocreator;
    if (autocreator)
      sub_1000FE47C(autocreator, (uint64_t)self);
  }
}

- (void)setInt64:(int64_t)a3 forKey:(unsigned int)a4
{
  TransparencyGPBMessage *autocreator;

  -[NSMutableDictionary setObject:forKey:](self->_dictionary, "setObject:forKey:", +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", a3), +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *(_QWORD *)&a4));
  autocreator = self->_autocreator;
  if (autocreator)
    sub_1000FE47C(autocreator, (uint64_t)self);
}

- (void)removeInt64ForKey:(unsigned int)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_dictionary, "removeObjectForKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *(_QWORD *)&a3));
}

- (void)removeAll
{
  -[NSMutableDictionary removeAllObjects](self->_dictionary, "removeAllObjects");
}

@end
