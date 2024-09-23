@implementation TransparencyGPBInt64EnumDictionary

- (TransparencyGPBInt64EnumDictionary)init
{
  return -[TransparencyGPBInt64EnumDictionary initWithValidationFunction:rawValues:forKeys:count:](self, "initWithValidationFunction:rawValues:forKeys:count:", 0, 0, 0, 0);
}

- (TransparencyGPBInt64EnumDictionary)initWithValidationFunction:(void *)a3
{
  return -[TransparencyGPBInt64EnumDictionary initWithValidationFunction:rawValues:forKeys:count:](self, "initWithValidationFunction:rawValues:forKeys:count:", a3, 0, 0, 0);
}

- (TransparencyGPBInt64EnumDictionary)initWithValidationFunction:(void *)a3 rawValues:(const int *)a4 forKeys:(const int64_t *)a5 count:(unint64_t)a6
{
  TransparencyGPBInt64EnumDictionary *v10;
  NSMutableDictionary *v11;
  void *v12;
  NSMutableDictionary *dictionary;
  unsigned int v14;
  NSNumber *v15;
  uint64_t v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)TransparencyGPBInt64EnumDictionary;
  v10 = -[TransparencyGPBInt64EnumDictionary init](&v18, "init");
  if (v10)
  {
    v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v12 = sub_1000E6890;
    if (a3)
      v12 = a3;
    v10->_dictionary = v11;
    v10->_validationFunc = v12;
    if (a5 && a4 && a6)
    {
      do
      {
        dictionary = v10->_dictionary;
        v14 = *a4++;
        v15 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v14);
        v16 = *a5++;
        -[NSMutableDictionary setObject:forKey:](dictionary, "setObject:forKey:", v15, +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v16));
        --a6;
      }
      while (a6);
    }
  }
  return v10;
}

- (TransparencyGPBInt64EnumDictionary)initWithDictionary:(id)a3
{
  TransparencyGPBInt64EnumDictionary *v4;
  TransparencyGPBInt64EnumDictionary *v5;

  v4 = -[TransparencyGPBInt64EnumDictionary initWithValidationFunction:rawValues:forKeys:count:](self, "initWithValidationFunction:rawValues:forKeys:count:", objc_msgSend(a3, "validationFunc"), 0, 0, 0);
  v5 = v4;
  if (a3 && v4)
    -[NSMutableDictionary addEntriesFromDictionary:](v4->_dictionary, "addEntriesFromDictionary:", *((_QWORD *)a3 + 2));
  return v5;
}

- (TransparencyGPBInt64EnumDictionary)initWithValidationFunction:(void *)a3 capacity:(unint64_t)a4
{
  return -[TransparencyGPBInt64EnumDictionary initWithValidationFunction:rawValues:forKeys:count:](self, "initWithValidationFunction:rawValues:forKeys:count:", a3, 0, 0, 0);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TransparencyGPBInt64EnumDictionary;
  -[TransparencyGPBInt64EnumDictionary dealloc](&v3, "dealloc");
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TransparencyGPBInt64EnumDictionary initWithDictionary:](+[TransparencyGPBInt64EnumDictionary allocWithZone:](TransparencyGPBInt64EnumDictionary, "allocWithZone:", a3), "initWithDictionary:", self);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;

  if (self == a3)
    return 1;
  v5 = objc_opt_class(TransparencyGPBInt64EnumDictionary, a2);
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

- (void)enumerateKeysAndRawValuesUsingBlock:(id)a3
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
    (*((void (**)(id, id, id, char *))a3 + 2))(a3, objc_msgSend(v6, "longLongValue"), objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](dictionary, "objectForKeyedSubscript:", v6), "intValue"), &v7);
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
        v13 = sub_1000E4C78((unint64_t)objc_msgSend(v10, "longLongValue"), 1, v7);
        v14 = sub_1000DFEB8(2, objc_msgSend(v12, "intValue")) + v13;
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
  int v16;

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
      v14 = objc_msgSend(v12, "longLongValue");
      v15 = objc_msgSend(v13, "intValue");
      v16 = sub_1000E4C78((unint64_t)v14, 1, v7);
      objc_msgSend(a3, "writeInt32NoTag:", sub_1000DFEB8(2, v15) + v16);
      sub_1000E4E14(a3, (uint64_t)v14, 1, v7);
      objc_msgSend(a3, "writeEnum:value:", 2, v15);
      v12 = objc_msgSend(v10, "nextObject");
    }
    while (v12);
  }
}

- (id)serializedDataForUnknownValue:(int)a3 forKey:(id *)a4 keyDataType:(unsigned __int8)a5
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  NSMutableData *v9;
  TransparencyGPBCodedOutputStream *v10;

  v5 = a5;
  v7 = *(_QWORD *)&a3;
  v8 = sub_1000E4C78(a4->var2, 1, a5);
  v9 = +[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", sub_1000DFEB8(2, v7) + v8);
  v10 = -[TransparencyGPBCodedOutputStream initWithData:]([TransparencyGPBCodedOutputStream alloc], "initWithData:", v9);
  sub_1000E4E14(v10, a4->var2, 1, v5);
  -[TransparencyGPBCodedOutputStream writeEnum:value:](v10, "writeEnum:value:", 2, v7);

  return v9;
}

- (void)setTransparencyGPBGenericValue:(id *)a3 forTransparencyGPBGenericValueKey:(id *)a4
{
  -[NSMutableDictionary setObject:forKey:](self->_dictionary, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", a3->var3), +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", a4->var2));
}

- (void)enumerateForTextFormat:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000F49E0;
  v3[3] = &unk_1002451E0;
  v3[4] = a3;
  -[TransparencyGPBInt64EnumDictionary enumerateKeysAndRawValuesUsingBlock:](self, "enumerateKeysAndRawValuesUsingBlock:", v3);
}

- (BOOL)getEnum:(int *)a3 forKey:(int64_t)a4
{
  id v6;
  id v7;
  unsigned int v8;
  int v9;

  v6 = -[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", a4));
  v7 = v6;
  if (a3 && v6)
  {
    v8 = objc_msgSend(v6, "intValue");
    if (((unsigned int (*)(void))self->_validationFunc)())
      v9 = v8;
    else
      v9 = -72499473;
    *a3 = v9;
  }
  return v7 != 0;
}

- (BOOL)getRawValue:(int *)a3 forKey:(int64_t)a4
{
  id v5;
  id v6;

  v5 = -[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", a4));
  v6 = v5;
  if (a3 && v5)
    *a3 = objc_msgSend(v5, "intValue");
  return v6 != 0;
}

- (void)enumerateKeysAndEnumsUsingBlock:(id)a3
{
  unsigned int (*validationFunc)(void);
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  char v10;

  v10 = 0;
  validationFunc = (unsigned int (*)(void))self->_validationFunc;
  v6 = -[NSMutableDictionary keyEnumerator](self->_dictionary, "keyEnumerator");
  do
  {
    v7 = objc_msgSend(v6, "nextObject");
    if (!v7)
      break;
    v8 = v7;
    LODWORD(v9) = objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", v7), "intValue");
    v9 = validationFunc() ? v9 : 4222467823;
    (*((void (**)(id, id, uint64_t, char *))a3 + 2))(a3, objc_msgSend(v8, "longLongValue"), v9, &v10);
  }
  while (!v10);
}

- (void)addRawEntriesFromDictionary:(id)a3
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

- (void)setRawValue:(int)a3 forKey:(int64_t)a4
{
  TransparencyGPBMessage *autocreator;

  -[NSMutableDictionary setObject:forKey:](self->_dictionary, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(_QWORD *)&a3), +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", a4));
  autocreator = self->_autocreator;
  if (autocreator)
    sub_1000FE47C(autocreator, (uint64_t)self);
}

- (void)removeEnumForKey:(int64_t)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_dictionary, "removeObjectForKey:", +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", a3));
}

- (void)removeAll
{
  -[NSMutableDictionary removeAllObjects](self->_dictionary, "removeAllObjects");
}

- (void)setEnum:(int)a3 forKey:(int64_t)a4
{
  uint64_t v5;
  TransparencyGPBMessage *autocreator;

  v5 = *(_QWORD *)&a3;
  if ((((uint64_t (*)(_QWORD, SEL))self->_validationFunc)(*(_QWORD *)&a3, a2) & 1) == 0)
    +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("TransparencyGPBInt64EnumDictionary: Attempt to set an unknown enum value (%d)"), v5);
  -[NSMutableDictionary setObject:forKey:](self->_dictionary, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v5), +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", a4));
  autocreator = self->_autocreator;
  if (autocreator)
    sub_1000FE47C(autocreator, (uint64_t)self);
}

- (void)validationFunc
{
  return self->_validationFunc;
}

@end
