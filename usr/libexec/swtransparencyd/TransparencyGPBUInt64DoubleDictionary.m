@implementation TransparencyGPBUInt64DoubleDictionary

- (TransparencyGPBUInt64DoubleDictionary)init
{
  return -[TransparencyGPBUInt64DoubleDictionary initWithDoubles:forKeys:count:](self, "initWithDoubles:forKeys:count:", 0, 0, 0);
}

- (TransparencyGPBUInt64DoubleDictionary)initWithDoubles:(const double *)a3 forKeys:(const unint64_t *)a4 count:(unint64_t)a5
{
  TransparencyGPBUInt64DoubleDictionary *v8;
  NSMutableDictionary *dictionary;
  double v10;
  NSNumber *v11;
  uint64_t v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)TransparencyGPBUInt64DoubleDictionary;
  v8 = -[TransparencyGPBUInt64DoubleDictionary init](&v14, "init");
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
          v11 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v10);
          v12 = *a4++;
          -[NSMutableDictionary setObject:forKey:](dictionary, "setObject:forKey:", v11, +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v12));
          --a5;
        }
        while (a5);
      }
    }
  }
  return v8;
}

- (TransparencyGPBUInt64DoubleDictionary)initWithDictionary:(id)a3
{
  TransparencyGPBUInt64DoubleDictionary *v4;
  TransparencyGPBUInt64DoubleDictionary *v5;

  v4 = -[TransparencyGPBUInt64DoubleDictionary initWithDoubles:forKeys:count:](self, "initWithDoubles:forKeys:count:", 0, 0, 0);
  v5 = v4;
  if (a3 && v4)
    -[NSMutableDictionary addEntriesFromDictionary:](v4->_dictionary, "addEntriesFromDictionary:", *((_QWORD *)a3 + 2));
  return v5;
}

- (TransparencyGPBUInt64DoubleDictionary)initWithCapacity:(unint64_t)a3
{
  return -[TransparencyGPBUInt64DoubleDictionary initWithDoubles:forKeys:count:](self, "initWithDoubles:forKeys:count:", 0, 0, 0);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TransparencyGPBUInt64DoubleDictionary;
  -[TransparencyGPBUInt64DoubleDictionary dealloc](&v3, "dealloc");
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TransparencyGPBUInt64DoubleDictionary initWithDictionary:](+[TransparencyGPBUInt64DoubleDictionary allocWithZone:](TransparencyGPBUInt64DoubleDictionary, "allocWithZone:", a3), "initWithDictionary:", self);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;

  if (self == a3)
    return 1;
  v5 = objc_opt_class(TransparencyGPBUInt64DoubleDictionary, a2);
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

- (void)enumerateKeysAndDoublesUsingBlock:(id)a3
{
  NSMutableDictionary *dictionary;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  char v10;

  v10 = 0;
  dictionary = self->_dictionary;
  v5 = -[NSMutableDictionary keyEnumerator](dictionary, "keyEnumerator");
  do
  {
    v6 = objc_msgSend(v5, "nextObject");
    if (!v6)
      break;
    v7 = v6;
    v8 = -[NSMutableDictionary objectForKeyedSubscript:](dictionary, "objectForKeyedSubscript:", v6);
    v9 = objc_msgSend(v7, "unsignedLongLongValue");
    objc_msgSend(v8, "doubleValue");
    (*((void (**)(id, id, char *))a3 + 2))(a3, v9, &v10);
  }
  while (!v10);
}

- (unint64_t)computeSerializedSizeAsField:(id)a3
{
  NSMutableDictionary *dictionary;
  unint64_t result;
  unint64_t v6;
  int v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;

  dictionary = self->_dictionary;
  result = (unint64_t)-[NSMutableDictionary count](dictionary, "count");
  if (result)
  {
    v6 = result;
    v7 = objc_msgSend(a3, "mapKeyDataType");
    v8 = -[NSMutableDictionary keyEnumerator](dictionary, "keyEnumerator");
    v9 = objc_msgSend(v8, "nextObject");
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      do
      {
        v12 = -[NSMutableDictionary objectForKeyedSubscript:](dictionary, "objectForKeyedSubscript:", v10);
        v13 = sub_1000A50EC((unint64_t)objc_msgSend(v10, "unsignedLongLongValue"), 1, v7);
        objc_msgSend(v12, "doubleValue");
        v14 = sub_1000A0A00(2) + v13;
        v11 += v14 + sub_10009F23C(v14);
        v10 = objc_msgSend(v8, "nextObject");
      }
      while (v10);
    }
    else
    {
      v11 = 0;
    }
    return v11 + sub_1000A1118(*(_DWORD *)(*((_QWORD *)a3 + 1) + 16), 15) * v6;
  }
  return result;
}

- (void)writeToCodedOutputStream:(id)a3 asField:(id)a4
{
  int v7;
  uint64_t v8;
  NSMutableDictionary *dictionary;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  double v15;
  double v16;

  v7 = objc_msgSend(a4, "mapKeyDataType");
  v8 = sub_1000CC22C(*(_DWORD *)(*((_QWORD *)a4 + 1) + 16), 2);
  dictionary = self->_dictionary;
  v10 = -[NSMutableDictionary keyEnumerator](dictionary, "keyEnumerator");
  v11 = objc_msgSend(v10, "nextObject");
  if (v11)
  {
    v12 = v11;
    do
    {
      v13 = -[NSMutableDictionary objectForKeyedSubscript:](dictionary, "objectForKeyedSubscript:", v12);
      objc_msgSend(a3, "writeInt32NoTag:", v8);
      v14 = objc_msgSend(v12, "unsignedLongLongValue");
      objc_msgSend(v13, "doubleValue");
      v16 = v15;
      LODWORD(v13) = sub_1000A50EC((unint64_t)v14, 1, v7);
      objc_msgSend(a3, "writeInt32NoTag:", sub_1000A0A00(2) + v13);
      if (v7 == 4)
      {
        objc_msgSend(a3, "writeFixed64:value:", 1, v14);
      }
      else if (v7 == 12)
      {
        objc_msgSend(a3, "writeUInt64:value:", 1, v14);
      }
      objc_msgSend(a3, "writeDouble:value:", 2, v16);
      v12 = objc_msgSend(v10, "nextObject");
    }
    while (v12);
  }
}

- (void)setTransparencyGPBGenericValue:(id *)a3 forTransparencyGPBGenericValueKey:(id *)a4
{
  -[NSMutableDictionary setObject:forKey:](self->_dictionary, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3->var6), +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4->var2));
}

- (void)enumerateForTextFormat:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000B04F8;
  v3[3] = &unk_10010BA68;
  v3[4] = a3;
  -[TransparencyGPBUInt64DoubleDictionary enumerateKeysAndDoublesUsingBlock:](self, "enumerateKeysAndDoublesUsingBlock:", v3);
}

- (BOOL)getDouble:(double *)a3 forKey:(unint64_t)a4
{
  id v5;
  id v6;
  uint64_t v7;

  v5 = -[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4));
  v6 = v5;
  if (a3 && v5)
  {
    objc_msgSend(v5, "doubleValue");
    *(_QWORD *)a3 = v7;
  }
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
      sub_1000BF10C(autocreator, (uint64_t)self);
  }
}

- (void)setDouble:(double)a3 forKey:(unint64_t)a4
{
  TransparencyGPBMessage *autocreator;

  -[NSMutableDictionary setObject:forKey:](self->_dictionary, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3), +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4));
  autocreator = self->_autocreator;
  if (autocreator)
    sub_1000BF10C(autocreator, (uint64_t)self);
}

- (void)removeDoubleForKey:(unint64_t)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_dictionary, "removeObjectForKey:", +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
}

- (void)removeAll
{
  -[NSMutableDictionary removeAllObjects](self->_dictionary, "removeAllObjects");
}

@end
