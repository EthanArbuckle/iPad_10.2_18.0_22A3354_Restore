@implementation TransparencyGPBUInt32FloatDictionary

- (TransparencyGPBUInt32FloatDictionary)init
{
  return -[TransparencyGPBUInt32FloatDictionary initWithFloats:forKeys:count:](self, "initWithFloats:forKeys:count:", 0, 0, 0);
}

- (TransparencyGPBUInt32FloatDictionary)initWithFloats:(const float *)a3 forKeys:(const unsigned int *)a4 count:(unint64_t)a5
{
  TransparencyGPBUInt32FloatDictionary *v8;
  double v9;
  NSMutableDictionary *dictionary;
  int v11;
  NSNumber *v12;
  unsigned int v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)TransparencyGPBUInt32FloatDictionary;
  v8 = -[TransparencyGPBUInt32FloatDictionary init](&v15, "init");
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
          v11 = *(_DWORD *)a3++;
          LODWORD(v9) = v11;
          v12 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v9);
          v13 = *a4++;
          -[NSMutableDictionary setObject:forKey:](dictionary, "setObject:forKey:", v12, +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v13));
          --a5;
        }
        while (a5);
      }
    }
  }
  return v8;
}

- (TransparencyGPBUInt32FloatDictionary)initWithDictionary:(id)a3
{
  TransparencyGPBUInt32FloatDictionary *v4;
  TransparencyGPBUInt32FloatDictionary *v5;

  v4 = -[TransparencyGPBUInt32FloatDictionary initWithFloats:forKeys:count:](self, "initWithFloats:forKeys:count:", 0, 0, 0);
  v5 = v4;
  if (a3 && v4)
    -[NSMutableDictionary addEntriesFromDictionary:](v4->_dictionary, "addEntriesFromDictionary:", *((_QWORD *)a3 + 2));
  return v5;
}

- (TransparencyGPBUInt32FloatDictionary)initWithCapacity:(unint64_t)a3
{
  return -[TransparencyGPBUInt32FloatDictionary initWithFloats:forKeys:count:](self, "initWithFloats:forKeys:count:", 0, 0, 0);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TransparencyGPBUInt32FloatDictionary;
  -[TransparencyGPBUInt32FloatDictionary dealloc](&v3, "dealloc");
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TransparencyGPBUInt32FloatDictionary initWithDictionary:](+[TransparencyGPBUInt32FloatDictionary allocWithZone:](TransparencyGPBUInt32FloatDictionary, "allocWithZone:", a3), "initWithDictionary:", self);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;

  if (self == a3)
    return 1;
  v5 = objc_opt_class(TransparencyGPBUInt32FloatDictionary, a2);
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
    v9 = objc_msgSend(v7, "unsignedIntValue");
    objc_msgSend(v8, "floatValue");
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
        v13 = sub_1000A4084(objc_msgSend(v10, "unsignedIntValue"), 1, v7);
        objc_msgSend(v12, "floatValue");
        v14 = sub_1000A0A98(2) + v13;
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
  int v15;
  int v16;
  double v17;

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
      v14 = objc_msgSend(v12, "unsignedIntValue");
      objc_msgSend(v13, "floatValue");
      v16 = v15;
      LODWORD(v13) = sub_1000A4084(v14, 1, v7);
      objc_msgSend(a3, "writeInt32NoTag:", sub_1000A0A98(2) + v13);
      if (v7 == 1)
      {
        objc_msgSend(a3, "writeFixed32:value:", 1, v14);
      }
      else if (v7 == 11)
      {
        objc_msgSend(a3, "writeUInt32:value:", 1, v14);
      }
      LODWORD(v17) = v16;
      objc_msgSend(a3, "writeFloat:value:", 2, v17);
      v12 = objc_msgSend(v10, "nextObject");
    }
    while (v12);
  }
}

- (void)setTransparencyGPBGenericValue:(id *)a3 forTransparencyGPBGenericValueKey:(id *)a4
{
  double v4;

  LODWORD(v4) = a3->var1;
  -[NSMutableDictionary setObject:forKey:](self->_dictionary, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v4), +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a4->var3));
}

- (void)enumerateForTextFormat:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000A6AA0;
  v3[3] = &unk_10010B7C0;
  v3[4] = a3;
  -[TransparencyGPBUInt32FloatDictionary enumerateKeysAndFloatsUsingBlock:](self, "enumerateKeysAndFloatsUsingBlock:", v3);
}

- (BOOL)getFloat:(float *)a3 forKey:(unsigned int)a4
{
  id v5;
  id v6;
  int v7;

  v5 = -[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *(_QWORD *)&a4));
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
      sub_1000BF10C(autocreator, (uint64_t)self);
  }
}

- (void)setFloat:(float)a3 forKey:(unsigned int)a4
{
  TransparencyGPBMessage *autocreator;

  -[NSMutableDictionary setObject:forKey:](self->_dictionary, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"), +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *(_QWORD *)&a4));
  autocreator = self->_autocreator;
  if (autocreator)
    sub_1000BF10C(autocreator, (uint64_t)self);
}

- (void)removeFloatForKey:(unsigned int)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_dictionary, "removeObjectForKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *(_QWORD *)&a3));
}

- (void)removeAll
{
  -[NSMutableDictionary removeAllObjects](self->_dictionary, "removeAllObjects");
}

@end
