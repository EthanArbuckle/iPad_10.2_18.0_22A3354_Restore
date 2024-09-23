@implementation TransparencyGPBStringBoolDictionary

- (TransparencyGPBStringBoolDictionary)init
{
  return -[TransparencyGPBStringBoolDictionary initWithBools:forKeys:count:](self, "initWithBools:forKeys:count:", 0, 0, 0);
}

- (TransparencyGPBStringBoolDictionary)initWithBools:(const BOOL *)a3 forKeys:(id *)a4 count:(unint64_t)a5
{
  TransparencyGPBStringBoolDictionary *v8;
  NSMutableDictionary *dictionary;
  unsigned int v10;
  NSNumber *v11;
  uint64_t v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)TransparencyGPBStringBoolDictionary;
  v8 = -[TransparencyGPBStringBoolDictionary init](&v14, "init");
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
          v10 = *(unsigned __int8 *)a3++;
          v11 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v10);
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

- (TransparencyGPBStringBoolDictionary)initWithDictionary:(id)a3
{
  TransparencyGPBStringBoolDictionary *v4;
  TransparencyGPBStringBoolDictionary *v5;

  v4 = -[TransparencyGPBStringBoolDictionary initWithBools:forKeys:count:](self, "initWithBools:forKeys:count:", 0, 0, 0);
  v5 = v4;
  if (a3 && v4)
    -[NSMutableDictionary addEntriesFromDictionary:](v4->_dictionary, "addEntriesFromDictionary:", *((_QWORD *)a3 + 2));
  return v5;
}

- (TransparencyGPBStringBoolDictionary)initWithCapacity:(unint64_t)a3
{
  return -[TransparencyGPBStringBoolDictionary initWithBools:forKeys:count:](self, "initWithBools:forKeys:count:", 0, 0, 0);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TransparencyGPBStringBoolDictionary;
  -[TransparencyGPBStringBoolDictionary dealloc](&v3, "dealloc");
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TransparencyGPBStringBoolDictionary initWithDictionary:](+[TransparencyGPBStringBoolDictionary allocWithZone:](TransparencyGPBStringBoolDictionary, "allocWithZone:", a3), "initWithDictionary:", self);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;

  if (self == a3)
    return 1;
  v5 = objc_opt_class(TransparencyGPBStringBoolDictionary, a2);
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

- (void)enumerateKeysAndBoolsUsingBlock:(id)a3
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
    (*((void (**)(id, id, id, char *))a3 + 2))(a3, v6, objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](dictionary, "objectForKeyedSubscript:", v6), "BOOLValue"), &v7);
  }
  while (!v7);
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
        v12 = sub_1000A0C30(1, v9);
        objc_msgSend(v11, "BOOLValue");
        v13 = &v12[sub_1000A0BE4(2)];
        v10 += (uint64_t)&v13[sub_10009F23C(v13)];
        v9 = objc_msgSend(v7, "nextObject");
      }
      while (v9);
    }
    else
    {
      v10 = 0;
    }
    return v10 + sub_1000A1118(*(_DWORD *)(*((_QWORD *)a3 + 1) + 16), 15) * v6;
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
  id v13;
  unsigned int v14;

  objc_msgSend(a4, "mapKeyDataType");
  v7 = sub_1000CC22C(*(_DWORD *)(*((_QWORD *)a4 + 1) + 16), 2);
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
      v13 = objc_msgSend(v12, "BOOLValue");
      v14 = sub_1000A0C30(1, v11);
      objc_msgSend(a3, "writeInt32NoTag:", sub_1000A0BE4(2) + v14);
      objc_msgSend(a3, "writeString:value:", 1, v11);
      objc_msgSend(a3, "writeBool:value:", 2, v13);
      v11 = objc_msgSend(v9, "nextObject");
    }
    while (v11);
  }
}

- (void)setTransparencyGPBGenericValue:(id *)a3 forTransparencyGPBGenericValueKey:(id *)a4
{
  -[NSMutableDictionary setObject:forKey:](self->_dictionary, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a3->var0), a4->var2);
}

- (void)enumerateForTextFormat:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000B8570;
  v3[3] = &unk_10010BC98;
  v3[4] = a3;
  -[TransparencyGPBStringBoolDictionary enumerateKeysAndBoolsUsingBlock:](self, "enumerateKeysAndBoolsUsingBlock:", v3);
}

- (BOOL)getBool:(BOOL *)a3 forKey:(id)a4
{
  id v5;
  id v6;

  v5 = -[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", a4);
  v6 = v5;
  if (a3 && v5)
    *a3 = objc_msgSend(v5, "BOOLValue");
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

- (void)setBool:(BOOL)a3 forKey:(id)a4
{
  _BOOL8 v5;
  TransparencyGPBMessage *autocreator;

  v5 = a3;
  if (!a4)
    +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("Attempting to add nil key to a Dictionary"));
  -[NSMutableDictionary setObject:forKey:](self->_dictionary, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v5), a4);
  autocreator = self->_autocreator;
  if (autocreator)
    sub_1000BF10C(autocreator, (uint64_t)self);
}

- (void)removeBoolForKey:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_dictionary, "removeObjectForKey:", a3);
}

- (void)removeAll
{
  -[NSMutableDictionary removeAllObjects](self->_dictionary, "removeAllObjects");
}

@end
