@implementation TransparencyGPBStringFloatDictionary

- (TransparencyGPBStringFloatDictionary)init
{
  return -[TransparencyGPBStringFloatDictionary initWithFloats:forKeys:count:](self, "initWithFloats:forKeys:count:", 0, 0, 0);
}

- (TransparencyGPBStringFloatDictionary)initWithFloats:(const float *)a3 forKeys:(id *)a4 count:(unint64_t)a5
{
  TransparencyGPBStringFloatDictionary *v8;
  double v9;
  NSMutableDictionary *dictionary;
  int v11;
  NSNumber *v12;
  uint64_t v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)TransparencyGPBStringFloatDictionary;
  v8 = -[TransparencyGPBStringFloatDictionary init](&v15, "init");
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
          v11 = *(_DWORD *)a3++;
          LODWORD(v9) = v11;
          v12 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v9);
          v13 = (uint64_t)*a4++;
          -[NSMutableDictionary setObject:forKey:](dictionary, "setObject:forKey:", v12, v13);
          --a5;
        }
        while (a5);
      }
    }
  }
  return v8;
}

- (TransparencyGPBStringFloatDictionary)initWithDictionary:(id)a3
{
  TransparencyGPBStringFloatDictionary *v4;
  TransparencyGPBStringFloatDictionary *v5;

  v4 = -[TransparencyGPBStringFloatDictionary initWithFloats:forKeys:count:](self, "initWithFloats:forKeys:count:", 0, 0, 0);
  v5 = v4;
  if (a3 && v4)
    -[NSMutableDictionary addEntriesFromDictionary:](v4->_dictionary, "addEntriesFromDictionary:", *((_QWORD *)a3 + 2));
  return v5;
}

- (TransparencyGPBStringFloatDictionary)initWithCapacity:(unint64_t)a3
{
  return -[TransparencyGPBStringFloatDictionary initWithFloats:forKeys:count:](self, "initWithFloats:forKeys:count:", 0, 0, 0);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TransparencyGPBStringFloatDictionary;
  -[TransparencyGPBStringFloatDictionary dealloc](&v3, "dealloc");
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TransparencyGPBStringFloatDictionary initWithDictionary:](+[TransparencyGPBStringFloatDictionary allocWithZone:](TransparencyGPBStringFloatDictionary, "allocWithZone:", a3), "initWithDictionary:", self);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;

  if (self == a3)
    return 1;
  v5 = objc_opt_class(TransparencyGPBStringFloatDictionary, a2);
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

- (void)enumerateKeysAndFloatsUsingBlock:(id)a3
{
  NSMutableDictionary *dictionary;
  id v5;
  id v6;
  id v7;
  char v8;

  v8 = 0;
  dictionary = self->_dictionary;
  v5 = -[NSMutableDictionary keyEnumerator](dictionary, "keyEnumerator");
  do
  {
    v6 = objc_msgSend(v5, "nextObject");
    if (!v6)
      break;
    v7 = v6;
    objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](dictionary, "objectForKeyedSubscript:", v6), "floatValue");
    (*((void (**)(id, id, char *))a3 + 2))(a3, v7, &v8);
  }
  while (!v8);
}

- (unint64_t)computeSerializedSizeAsField:(id)a3
{
  NSMutableDictionary *dictionary;
  unint64_t result;
  unint64_t v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  char *v12;
  char *v13;

  dictionary = self->_dictionary;
  result = (unint64_t)-[NSMutableDictionary count](dictionary, "count");
  if (result)
  {
    v6 = result;
    objc_msgSend(a3, "mapKeyDataType");
    v7 = -[NSMutableDictionary keyEnumerator](dictionary, "keyEnumerator");
    v8 = objc_msgSend(v7, "nextObject");
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      do
      {
        v11 = -[NSMutableDictionary objectForKeyedSubscript:](dictionary, "objectForKeyedSubscript:", v9);
        v12 = sub_10001A6C4(1, v9);
        objc_msgSend(v11, "floatValue");
        v13 = &v12[sub_10001A52C(2)];
        v10 += (uint64_t)&v13[sub_100018CC8(v13)];
        v9 = objc_msgSend(v7, "nextObject");
      }
      while (v9);
    }
    else
    {
      v10 = 0;
    }
    return v10 + sub_10001ABAC(*(_DWORD *)(*((_QWORD *)a3 + 1) + 16), 15) * v6;
  }
  return result;
}

- (void)writeToCodedOutputStream:(id)a3 asField:(id)a4
{
  uint64_t v7;
  NSMutableDictionary *dictionary;
  id v9;
  id v10;
  id v11;
  id v12;
  int v13;
  int v14;
  double v15;

  objc_msgSend(a4, "mapKeyDataType");
  v7 = sub_100023730(*(_DWORD *)(*((_QWORD *)a4 + 1) + 16), 2);
  dictionary = self->_dictionary;
  v9 = -[NSMutableDictionary keyEnumerator](dictionary, "keyEnumerator");
  v10 = objc_msgSend(v9, "nextObject");
  if (v10)
  {
    v11 = v10;
    do
    {
      v12 = -[NSMutableDictionary objectForKeyedSubscript:](dictionary, "objectForKeyedSubscript:", v11);
      objc_msgSend(a3, "writeInt32NoTag:", v7);
      objc_msgSend(v12, "floatValue");
      v14 = v13;
      LODWORD(v12) = sub_10001A6C4(1, v11);
      objc_msgSend(a3, "writeInt32NoTag:", sub_10001A52C(2) + v12);
      objc_msgSend(a3, "writeString:value:", 1, v11);
      LODWORD(v15) = v14;
      objc_msgSend(a3, "writeFloat:value:", 2, v15);
      v11 = objc_msgSend(v9, "nextObject");
    }
    while (v11);
  }
}

- (void)setTransparencyGPBGenericValue:(id *)a3 forTransparencyGPBGenericValueKey:(id *)a4
{
  double v4;

  LODWORD(v4) = a3->var1;
  -[NSMutableDictionary setObject:forKey:](self->_dictionary, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v4), a4->var2);
}

- (void)enumerateForTextFormat:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10004AAF8;
  v3[3] = &unk_100072228;
  v3[4] = a3;
  -[TransparencyGPBStringFloatDictionary enumerateKeysAndFloatsUsingBlock:](self, "enumerateKeysAndFloatsUsingBlock:", v3);
}

- (BOOL)getFloat:(float *)a3 forKey:(id)a4
{
  id v5;
  id v6;
  int v7;

  v5 = -[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", a4);
  v6 = v5;
  if (a3 && v5)
  {
    objc_msgSend(v5, "floatValue");
    *(_DWORD *)a3 = v7;
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
      sub_10002922C(autocreator, (uint64_t)self);
  }
}

- (void)setFloat:(float)a3 forKey:(id)a4
{
  double v7;
  TransparencyGPBMessage *autocreator;

  if (!a4)
    +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("Attempting to add nil key to a Dictionary"));
  *(float *)&v7 = a3;
  -[NSMutableDictionary setObject:forKey:](self->_dictionary, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v7), a4);
  autocreator = self->_autocreator;
  if (autocreator)
    sub_10002922C(autocreator, (uint64_t)self);
}

- (void)removeFloatForKey:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_dictionary, "removeObjectForKey:", a3);
}

- (void)removeAll
{
  -[NSMutableDictionary removeAllObjects](self->_dictionary, "removeAllObjects");
}

@end
