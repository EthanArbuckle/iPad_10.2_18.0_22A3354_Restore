@implementation TransparencyGPBInt32UInt32Dictionary

- (TransparencyGPBInt32UInt32Dictionary)init
{
  return -[TransparencyGPBInt32UInt32Dictionary initWithUInt32s:forKeys:count:](self, "initWithUInt32s:forKeys:count:", 0, 0, 0);
}

- (TransparencyGPBInt32UInt32Dictionary)initWithUInt32s:(const unsigned int *)a3 forKeys:(const int *)a4 count:(unint64_t)a5
{
  TransparencyGPBInt32UInt32Dictionary *v8;
  NSMutableDictionary *dictionary;
  unsigned int v10;
  NSNumber *v11;
  unsigned int v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)TransparencyGPBInt32UInt32Dictionary;
  v8 = -[TransparencyGPBInt32UInt32Dictionary init](&v14, "init");
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
          v11 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v10);
          v12 = *a4++;
          -[NSMutableDictionary setObject:forKey:](dictionary, "setObject:forKey:", v11, +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v12));
          --a5;
        }
        while (a5);
      }
    }
  }
  return v8;
}

- (TransparencyGPBInt32UInt32Dictionary)initWithDictionary:(id)a3
{
  TransparencyGPBInt32UInt32Dictionary *v4;
  TransparencyGPBInt32UInt32Dictionary *v5;

  v4 = -[TransparencyGPBInt32UInt32Dictionary initWithUInt32s:forKeys:count:](self, "initWithUInt32s:forKeys:count:", 0, 0, 0);
  v5 = v4;
  if (a3 && v4)
    -[NSMutableDictionary addEntriesFromDictionary:](v4->_dictionary, "addEntriesFromDictionary:", *((_QWORD *)a3 + 2));
  return v5;
}

- (TransparencyGPBInt32UInt32Dictionary)initWithCapacity:(unint64_t)a3
{
  return -[TransparencyGPBInt32UInt32Dictionary initWithUInt32s:forKeys:count:](self, "initWithUInt32s:forKeys:count:", 0, 0, 0);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TransparencyGPBInt32UInt32Dictionary;
  -[TransparencyGPBInt32UInt32Dictionary dealloc](&v3, "dealloc");
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TransparencyGPBInt32UInt32Dictionary initWithDictionary:](+[TransparencyGPBInt32UInt32Dictionary allocWithZone:](TransparencyGPBInt32UInt32Dictionary, "allocWithZone:", a3), "initWithDictionary:", self);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;

  if (self == a3)
    return 1;
  v5 = objc_opt_class(TransparencyGPBInt32UInt32Dictionary, a2);
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
    (*((void (**)(id, id, id, char *))a3 + 2))(a3, objc_msgSend(v6, "intValue"), objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](dictionary, "objectForKeyedSubscript:", v6), "unsignedIntValue"), &v7);
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
        v14 = sub_1000A48A8(objc_msgSend(v11, "intValue"), 1, v8);
        v15 = sub_1000A4084(objc_msgSend(v13, "unsignedIntValue"), 2, v7) + v14;
        v12 += v15 + sub_10009F23C(v15);
        v11 = objc_msgSend(v9, "nextObject");
      }
      while (v11);
    }
    else
    {
      v12 = 0;
    }
    return v12 + sub_1000A1118(*(_DWORD *)(*((_QWORD *)a3 + 1) + 16), 15) * v6;
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
  v9 = sub_1000CC22C(*(_DWORD *)(*((_QWORD *)a4 + 1) + 16), 2);
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
      v15 = objc_msgSend(v13, "intValue");
      v16 = objc_msgSend(v14, "unsignedIntValue");
      LODWORD(v14) = sub_1000A48A8(v15, 1, v8);
      objc_msgSend(a3, "writeInt32NoTag:", sub_1000A4084(v16, 2, v7) + v14);
      sub_1000A4A44(a3, (uint64_t)v15, 1, v8);
      if (v7 == 1)
      {
        objc_msgSend(a3, "writeFixed32:value:", 2, v16);
      }
      else if (v7 == 11)
      {
        objc_msgSend(a3, "writeUInt32:value:", 2, v16);
      }
      v13 = objc_msgSend(v11, "nextObject");
    }
    while (v13);
  }
}

- (void)setTransparencyGPBGenericValue:(id *)a3 forTransparencyGPBGenericValueKey:(id *)a4
{
  -[NSMutableDictionary setObject:forKey:](self->_dictionary, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3->var3), +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", a4->var3));
}

- (void)enumerateForTextFormat:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000A8DDC;
  v3[3] = &unk_10010B838;
  v3[4] = a3;
  -[TransparencyGPBInt32UInt32Dictionary enumerateKeysAndUInt32sUsingBlock:](self, "enumerateKeysAndUInt32sUsingBlock:", v3);
}

- (BOOL)getUInt32:(unsigned int *)a3 forKey:(int)a4
{
  id v5;
  id v6;

  v5 = -[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(_QWORD *)&a4));
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
      sub_1000BF10C(autocreator, (uint64_t)self);
  }
}

- (void)setUInt32:(unsigned int)a3 forKey:(int)a4
{
  TransparencyGPBMessage *autocreator;

  -[NSMutableDictionary setObject:forKey:](self->_dictionary, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *(_QWORD *)&a3), +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(_QWORD *)&a4));
  autocreator = self->_autocreator;
  if (autocreator)
    sub_1000BF10C(autocreator, (uint64_t)self);
}

- (void)removeUInt32ForKey:(int)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_dictionary, "removeObjectForKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(_QWORD *)&a3));
}

- (void)removeAll
{
  -[NSMutableDictionary removeAllObjects](self->_dictionary, "removeAllObjects");
}

@end
