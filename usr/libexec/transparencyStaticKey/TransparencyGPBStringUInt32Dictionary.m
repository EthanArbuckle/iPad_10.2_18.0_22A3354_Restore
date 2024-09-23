@implementation TransparencyGPBStringUInt32Dictionary

- (TransparencyGPBStringUInt32Dictionary)init
{
  return -[TransparencyGPBStringUInt32Dictionary initWithUInt32s:forKeys:count:](self, "initWithUInt32s:forKeys:count:", 0, 0, 0);
}

- (TransparencyGPBStringUInt32Dictionary)initWithUInt32s:(const unsigned int *)a3 forKeys:(id *)a4 count:(unint64_t)a5
{
  TransparencyGPBStringUInt32Dictionary *v8;
  NSMutableDictionary *dictionary;
  unsigned int v10;
  NSNumber *v11;
  uint64_t v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)TransparencyGPBStringUInt32Dictionary;
  v8 = -[TransparencyGPBStringUInt32Dictionary init](&v14, "init");
  if (v8)
  {
    v8->_dictionary = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    if (a4)
    {
      if (a3 && a5)
      {
        do
        {
          if (!*a4)
            +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("Attempting to add nil key to a Dictionary"));
          dictionary = v8->_dictionary;
          v10 = *a3++;
          v11 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v10);
          v12 = (uint64_t)*a4++;
          -[NSMutableDictionary setObject:forKey:](dictionary, "setObject:forKey:", v11, v12);
          --a5;
        }
        while (a5);
      }
    }
  }
  return v8;
}

- (TransparencyGPBStringUInt32Dictionary)initWithDictionary:(id)a3
{
  TransparencyGPBStringUInt32Dictionary *v4;
  TransparencyGPBStringUInt32Dictionary *v5;

  v4 = -[TransparencyGPBStringUInt32Dictionary initWithUInt32s:forKeys:count:](self, "initWithUInt32s:forKeys:count:", 0, 0, 0);
  v5 = v4;
  if (a3 && v4)
    -[NSMutableDictionary addEntriesFromDictionary:](v4->_dictionary, "addEntriesFromDictionary:", *((_QWORD *)a3 + 2));
  return v5;
}

- (TransparencyGPBStringUInt32Dictionary)initWithCapacity:(unint64_t)a3
{
  return -[TransparencyGPBStringUInt32Dictionary initWithUInt32s:forKeys:count:](self, "initWithUInt32s:forKeys:count:", 0, 0, 0);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TransparencyGPBStringUInt32Dictionary;
  -[TransparencyGPBStringUInt32Dictionary dealloc](&v3, "dealloc");
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TransparencyGPBStringUInt32Dictionary initWithDictionary:](+[TransparencyGPBStringUInt32Dictionary allocWithZone:](TransparencyGPBStringUInt32Dictionary, "allocWithZone:", a3), "initWithDictionary:", self);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;

  if (self == a3)
    return 1;
  v5 = objc_opt_class(TransparencyGPBStringUInt32Dictionary, a2);
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

- (void)enumerateKeysAndUInt32sUsingBlock:(id)a3
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
    (*((void (**)(id, id, id, char *))a3 + 2))(a3, v6, objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](dictionary, "objectForKeyedSubscript:", v6), "unsignedIntValue"), &v7);
  }
  while (!v7);
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
  char *v13;
  char *v14;

  dictionary = self->_dictionary;
  result = (unint64_t)-[NSMutableDictionary count](dictionary, "count");
  if (result)
  {
    v6 = result;
    v7 = *(unsigned __int8 *)(*((_QWORD *)a3 + 1) + 30);
    objc_msgSend(a3, "mapKeyDataType");
    v8 = -[NSMutableDictionary keyEnumerator](dictionary, "keyEnumerator");
    v9 = objc_msgSend(v8, "nextObject");
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      do
      {
        v12 = -[NSMutableDictionary objectForKeyedSubscript:](dictionary, "objectForKeyedSubscript:", v10);
        v13 = sub_10001A6C4(1, v10);
        v14 = &v13[sub_100035F44(objc_msgSend(v12, "unsignedIntValue"), 2, v7)];
        v11 += (uint64_t)&v14[sub_100018CC8(v14)];
        v10 = objc_msgSend(v8, "nextObject");
      }
      while (v10);
    }
    else
    {
      v11 = 0;
    }
    return v11 + sub_10001ABAC(*(_DWORD *)(*((_QWORD *)a3 + 1) + 16), 15) * v6;
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
  unsigned int v15;

  v7 = *(unsigned __int8 *)(*((_QWORD *)a4 + 1) + 30);
  objc_msgSend(a4, "mapKeyDataType");
  v8 = sub_100023730(*(_DWORD *)(*((_QWORD *)a4 + 1) + 16), 2);
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
      v14 = objc_msgSend(v13, "unsignedIntValue");
      v15 = sub_10001A6C4(1, v12);
      objc_msgSend(a3, "writeInt32NoTag:", sub_100035F44(v14, 2, v7) + v15);
      objc_msgSend(a3, "writeString:value:", 1, v12);
      if (v7 == 1)
      {
        objc_msgSend(a3, "writeFixed32:value:", 2, v14);
      }
      else if (v7 == 11)
      {
        objc_msgSend(a3, "writeUInt32:value:", 2, v14);
      }
      v12 = objc_msgSend(v10, "nextObject");
    }
    while (v12);
  }
}

- (void)setTransparencyGPBGenericValue:(id *)a3 forTransparencyGPBGenericValueKey:(id *)a4
{
  -[NSMutableDictionary setObject:forKey:](self->_dictionary, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3->var3), a4->var2);
}

- (void)enumerateForTextFormat:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000487A8;
  v3[3] = &unk_100072160;
  v3[4] = a3;
  -[TransparencyGPBStringUInt32Dictionary enumerateKeysAndUInt32sUsingBlock:](self, "enumerateKeysAndUInt32sUsingBlock:", v3);
}

- (BOOL)getUInt32:(unsigned int *)a3 forKey:(id)a4
{
  id v5;
  id v6;

  v5 = -[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", a4);
  v6 = v5;
  if (a3 && v5)
    *a3 = objc_msgSend(v5, "unsignedIntValue");
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
      sub_10002922C(autocreator, (uint64_t)self);
  }
}

- (void)setUInt32:(unsigned int)a3 forKey:(id)a4
{
  uint64_t v5;
  TransparencyGPBMessage *autocreator;

  v5 = *(_QWORD *)&a3;
  if (!a4)
    +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("Attempting to add nil key to a Dictionary"));
  -[NSMutableDictionary setObject:forKey:](self->_dictionary, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v5), a4);
  autocreator = self->_autocreator;
  if (autocreator)
    sub_10002922C(autocreator, (uint64_t)self);
}

- (void)removeUInt32ForKey:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_dictionary, "removeObjectForKey:", a3);
}

- (void)removeAll
{
  -[NSMutableDictionary removeAllObjects](self->_dictionary, "removeAllObjects");
}

@end
