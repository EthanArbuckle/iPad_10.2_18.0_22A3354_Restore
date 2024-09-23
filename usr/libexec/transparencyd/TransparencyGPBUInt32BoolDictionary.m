@implementation TransparencyGPBUInt32BoolDictionary

- (TransparencyGPBUInt32BoolDictionary)init
{
  return -[TransparencyGPBUInt32BoolDictionary initWithBools:forKeys:count:](self, "initWithBools:forKeys:count:", 0, 0, 0);
}

- (TransparencyGPBUInt32BoolDictionary)initWithBools:(const BOOL *)a3 forKeys:(const unsigned int *)a4 count:(unint64_t)a5
{
  TransparencyGPBUInt32BoolDictionary *v8;
  NSMutableDictionary *dictionary;
  unsigned int v10;
  NSNumber *v11;
  unsigned int v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)TransparencyGPBUInt32BoolDictionary;
  v8 = -[TransparencyGPBUInt32BoolDictionary init](&v14, "init");
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
          v10 = *(unsigned __int8 *)a3++;
          v11 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v10);
          v12 = *a4++;
          -[NSMutableDictionary setObject:forKey:](dictionary, "setObject:forKey:", v11, +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v12));
          --a5;
        }
        while (a5);
      }
    }
  }
  return v8;
}

- (TransparencyGPBUInt32BoolDictionary)initWithDictionary:(id)a3
{
  TransparencyGPBUInt32BoolDictionary *v4;
  TransparencyGPBUInt32BoolDictionary *v5;

  v4 = -[TransparencyGPBUInt32BoolDictionary initWithBools:forKeys:count:](self, "initWithBools:forKeys:count:", 0, 0, 0);
  v5 = v4;
  if (a3 && v4)
    -[NSMutableDictionary addEntriesFromDictionary:](v4->_dictionary, "addEntriesFromDictionary:", *((_QWORD *)a3 + 2));
  return v5;
}

- (TransparencyGPBUInt32BoolDictionary)initWithCapacity:(unint64_t)a3
{
  return -[TransparencyGPBUInt32BoolDictionary initWithBools:forKeys:count:](self, "initWithBools:forKeys:count:", 0, 0, 0);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TransparencyGPBUInt32BoolDictionary;
  -[TransparencyGPBUInt32BoolDictionary dealloc](&v3, "dealloc");
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TransparencyGPBUInt32BoolDictionary initWithDictionary:](+[TransparencyGPBUInt32BoolDictionary allocWithZone:](TransparencyGPBUInt32BoolDictionary, "allocWithZone:", a3), "initWithDictionary:", self);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;

  if (self == a3)
    return 1;
  v5 = objc_opt_class(TransparencyGPBUInt32BoolDictionary, a2);
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
    (*((void (**)(id, id, id, char *))a3 + 2))(a3, objc_msgSend(v6, "unsignedIntValue"), objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](dictionary, "objectForKeyedSubscript:", v6), "BOOLValue"), &v7);
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
        v13 = sub_1000E33F4(objc_msgSend(v10, "unsignedIntValue"), 1, v7);
        objc_msgSend(v12, "BOOLValue");
        v14 = sub_1000DFF54(2) + v13;
        v11 += v14 + sub_1000DE5AC(v14);
        v10 = objc_msgSend(v8, "nextObject");
      }
      while (v10);
    }
    else
    {
      v11 = 0;
    }
    return v11 + sub_1000E0488(*(_DWORD *)(*((_QWORD *)a3 + 1) + 16), 15) * v6;
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
  id v15;

  v7 = objc_msgSend(a4, "mapKeyDataType");
  v8 = sub_10010B59C(*(_DWORD *)(*((_QWORD *)a4 + 1) + 16), 2);
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
      v14 = objc_msgSend(v12, "unsignedIntValue");
      v15 = objc_msgSend(v13, "BOOLValue");
      LODWORD(v13) = sub_1000E33F4(v14, 1, v7);
      objc_msgSend(a3, "writeInt32NoTag:", sub_1000DFF54(2) + v13);
      if (v7 == 1)
      {
        objc_msgSend(a3, "writeFixed32:value:", 1, v14);
      }
      else if (v7 == 11)
      {
        objc_msgSend(a3, "writeUInt32:value:", 1, v14);
      }
      objc_msgSend(a3, "writeBool:value:", 2, v15);
      v12 = objc_msgSend(v10, "nextObject");
    }
    while (v12);
  }
}

- (void)setTransparencyGPBGenericValue:(id *)a3 forTransparencyGPBGenericValueKey:(id *)a4
{
  -[NSMutableDictionary setObject:forKey:](self->_dictionary, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a3->var0), +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a4->var3));
}

- (void)enumerateForTextFormat:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000E5684;
  v3[3] = &unk_100244E98;
  v3[4] = a3;
  -[TransparencyGPBUInt32BoolDictionary enumerateKeysAndBoolsUsingBlock:](self, "enumerateKeysAndBoolsUsingBlock:", v3);
}

- (BOOL)getBool:(BOOL *)a3 forKey:(unsigned int)a4
{
  id v5;
  id v6;

  v5 = -[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *(_QWORD *)&a4));
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
      sub_1000FE47C(autocreator, (uint64_t)self);
  }
}

- (void)setBool:(BOOL)a3 forKey:(unsigned int)a4
{
  TransparencyGPBMessage *autocreator;

  -[NSMutableDictionary setObject:forKey:](self->_dictionary, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a3), +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *(_QWORD *)&a4));
  autocreator = self->_autocreator;
  if (autocreator)
    sub_1000FE47C(autocreator, (uint64_t)self);
}

- (void)removeBoolForKey:(unsigned int)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_dictionary, "removeObjectForKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *(_QWORD *)&a3));
}

- (void)removeAll
{
  -[NSMutableDictionary removeAllObjects](self->_dictionary, "removeAllObjects");
}

@end
