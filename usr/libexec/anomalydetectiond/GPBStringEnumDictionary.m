@implementation GPBStringEnumDictionary

- (GPBStringEnumDictionary)init
{
  return -[GPBStringEnumDictionary initWithValidationFunction:rawValues:forKeys:count:](self, "initWithValidationFunction:rawValues:forKeys:count:", 0, 0, 0, 0);
}

- (GPBStringEnumDictionary)initWithValidationFunction:(void *)a3
{
  return -[GPBStringEnumDictionary initWithValidationFunction:rawValues:forKeys:count:](self, "initWithValidationFunction:rawValues:forKeys:count:", a3, 0, 0, 0);
}

- (GPBStringEnumDictionary)initWithValidationFunction:(void *)a3 rawValues:(const int *)a4 forKeys:(id *)a5 count:(unint64_t)a6
{
  GPBStringEnumDictionary *v10;
  NSMutableDictionary *v11;
  void *v12;
  NSMutableDictionary *dictionary;
  unsigned int v14;
  NSNumber *v15;
  uint64_t v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)GPBStringEnumDictionary;
  v10 = -[GPBStringEnumDictionary init](&v18, "init");
  if (v10)
  {
    v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v12 = sub_1002A1CE0;
    if (a3)
      v12 = a3;
    v10->_dictionary = v11;
    v10->_validationFunc = v12;
    if (a5 && a4 && a6)
    {
      do
      {
        if (!*a5)
          +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("Attempting to add nil key to a Dictionary"));
        dictionary = v10->_dictionary;
        v14 = *a4++;
        v15 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v14);
        v16 = (uint64_t)*a5++;
        -[NSMutableDictionary setObject:forKey:](dictionary, "setObject:forKey:", v15, v16);
        --a6;
      }
      while (a6);
    }
  }
  return v10;
}

- (GPBStringEnumDictionary)initWithDictionary:(id)a3
{
  GPBStringEnumDictionary *v4;
  GPBStringEnumDictionary *v5;

  v4 = -[GPBStringEnumDictionary initWithValidationFunction:rawValues:forKeys:count:](self, "initWithValidationFunction:rawValues:forKeys:count:", objc_msgSend(a3, "validationFunc"), 0, 0, 0);
  v5 = v4;
  if (a3 && v4)
    -[NSMutableDictionary addEntriesFromDictionary:](v4->_dictionary, "addEntriesFromDictionary:", *((_QWORD *)a3 + 2));
  return v5;
}

- (GPBStringEnumDictionary)initWithValidationFunction:(void *)a3 capacity:(unint64_t)a4
{
  return -[GPBStringEnumDictionary initWithValidationFunction:rawValues:forKeys:count:](self, "initWithValidationFunction:rawValues:forKeys:count:", a3, 0, 0, 0);
}

- (void)dealloc
{
  objc_super v3;

  if (self->_autocreator)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GPBDictionary.m"), 9832, CFSTR("%@: Autocreator must be cleared before release, autocreator: %@"), objc_opt_class(self), self->_autocreator);

  v3.receiver = self;
  v3.super_class = (Class)GPBStringEnumDictionary;
  -[GPBStringEnumDictionary dealloc](&v3, "dealloc");
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[GPBStringEnumDictionary initWithDictionary:](+[GPBStringEnumDictionary allocWithZone:](GPBStringEnumDictionary, "allocWithZone:", a3), "initWithDictionary:", self);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;

  if (self == a3)
    return 1;
  v5 = objc_opt_class(GPBStringEnumDictionary);
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
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p> { %@ }"), objc_opt_class(self), self, self->_dictionary);
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
    (*((void (**)(id, id, id, char *))a3 + 2))(a3, v6, objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](dictionary, "objectForKeyedSubscript:", v6), "intValue"), &v7);
  }
  while (!v7);
}

- (unint64_t)computeSerializedSizeAsField:(id)a3
{
  NSMutableDictionary *dictionary;
  unint64_t result;
  unint64_t v6;
  unsigned int v7;
  unsigned int v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  char *v14;
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
        v14 = sub_1002B1A5C(v11, v8);
        v15 = &v14[sub_1002A2094(objc_msgSend(v13, "intValue"), v7)];
        v12 += (uint64_t)&v15[GPBComputeRawVarint32SizeForInteger(v15)];
        v11 = objc_msgSend(v9, "nextObject");
      }
      while (v11);
    }
    else
    {
      v12 = 0;
    }
    return v12 + GPBComputeWireFormatTagSize(*(_DWORD *)(*((_QWORD *)a3 + 1) + 16), 15) * v6;
  }
  return result;
}

- (void)writeToCodedOutputStream:(id)a3 asField:(id)a4
{
  unsigned int v7;
  unsigned int v8;
  uint64_t Tag;
  NSMutableDictionary *dictionary;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  unsigned int v16;

  v7 = *(unsigned __int8 *)(*((_QWORD *)a4 + 1) + 30);
  v8 = objc_msgSend(a4, "mapKeyDataType");
  Tag = GPBWireFormatMakeTag(*(_DWORD *)(*((_QWORD *)a4 + 1) + 16), 2);
  dictionary = self->_dictionary;
  v11 = -[NSMutableDictionary keyEnumerator](dictionary, "keyEnumerator");
  v12 = objc_msgSend(v11, "nextObject");
  if (v12)
  {
    v13 = v12;
    do
    {
      v14 = -[NSMutableDictionary objectForKeyedSubscript:](dictionary, "objectForKeyedSubscript:", v13);
      objc_msgSend(a3, "writeInt32NoTag:", Tag);
      v15 = objc_msgSend(v14, "intValue");
      v16 = sub_1002B1A5C(v13, v8);
      objc_msgSend(a3, "writeInt32NoTag:", sub_1002A2094(v15, v7) + v16);
      sub_1002B1C0C(a3, (uint64_t)v13, v8);
      sub_1002A2250(a3, (uint64_t)v15, v7);
      v13 = objc_msgSend(v11, "nextObject");
    }
    while (v13);
  }
}

- (id)serializedDataForUnknownValue:(int)a3 forKey:(id *)a4 keyDataType:(unsigned __int8)a5
{
  unsigned int v5;
  uint64_t v7;
  char *v8;
  NSMutableData *v9;
  GPBCodedOutputStream *v10;

  v5 = a5;
  v7 = *(_QWORD *)&a3;
  v8 = sub_1002B1A5C(a4->var7, a5);
  v9 = +[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", &v8[GPBComputeEnumSize(2, v7)]);
  v10 = -[GPBCodedOutputStream initWithData:]([GPBCodedOutputStream alloc], "initWithData:", v9);
  sub_1002B1C0C(v10, a4->var2, v5);
  -[GPBCodedOutputStream writeEnum:value:](v10, "writeEnum:value:", 2, v7);

  return v9;
}

- (void)setGPBGenericValue:(id *)a3 forGPBGenericValueKey:(id *)a4
{
  -[NSMutableDictionary setObject:forKey:](self->_dictionary, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", a3->var3), a4->var2);
}

- (void)enumerateForTextFormat:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1002B52D0;
  v3[3] = &unk_1003652F8;
  v3[4] = a3;
  -[GPBStringEnumDictionary enumerateKeysAndRawValuesUsingBlock:](self, "enumerateKeysAndRawValuesUsingBlock:", v3);
}

- (BOOL)getEnum:(int *)a3 forKey:(id)a4
{
  id v6;
  id v7;
  unsigned int v8;
  int v9;

  v6 = -[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", a4);
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

- (BOOL)getRawValue:(int *)a3 forKey:(id)a4
{
  id v5;
  id v6;

  v5 = -[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", a4);
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
  id v8;
  unsigned int v9;
  uint64_t v10;
  char v11;

  v11 = 0;
  validationFunc = (unsigned int (*)(void))self->_validationFunc;
  v6 = -[NSMutableDictionary keyEnumerator](self->_dictionary, "keyEnumerator");
  do
  {
    v7 = objc_msgSend(v6, "nextObject");
    if (!v7)
      break;
    v8 = v7;
    v9 = objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", v7), "intValue");
    v10 = validationFunc() ? v9 : 4222467823;
    (*((void (**)(id, id, uint64_t, char *))a3 + 2))(a3, v8, v10, &v11);
  }
  while (!v11);
}

- (void)addRawEntriesFromDictionary:(id)a3
{
  GPBMessage *autocreator;

  if (a3)
  {
    -[NSMutableDictionary addEntriesFromDictionary:](self->_dictionary, "addEntriesFromDictionary:", *((_QWORD *)a3 + 2));
    autocreator = self->_autocreator;
    if (autocreator)
      GPBAutocreatedDictionaryModified(autocreator, (uint64_t)self);
  }
}

- (void)setRawValue:(int)a3 forKey:(id)a4
{
  uint64_t v5;
  GPBMessage *autocreator;

  v5 = *(_QWORD *)&a3;
  if (!a4)
    +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("Attempting to add nil key to a Dictionary"));
  -[NSMutableDictionary setObject:forKey:](self->_dictionary, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v5), a4);
  autocreator = self->_autocreator;
  if (autocreator)
    GPBAutocreatedDictionaryModified(autocreator, (uint64_t)self);
}

- (void)removeEnumForKey:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_dictionary, "removeObjectForKey:", a3);
}

- (void)removeAll
{
  -[NSMutableDictionary removeAllObjects](self->_dictionary, "removeAllObjects");
}

- (void)setEnum:(int)a3 forKey:(id)a4
{
  uint64_t v5;
  GPBMessage *autocreator;

  v5 = *(_QWORD *)&a3;
  if (!a4)
    +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("Attempting to add nil key to a Dictionary"));
  if ((((uint64_t (*)(uint64_t, SEL))self->_validationFunc)(v5, a2) & 1) == 0)
    +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("GPBStringEnumDictionary: Attempt to set an unknown enum value (%d)"), v5);
  -[NSMutableDictionary setObject:forKey:](self->_dictionary, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v5), a4);
  autocreator = self->_autocreator;
  if (autocreator)
    GPBAutocreatedDictionaryModified(autocreator, (uint64_t)self);
}

- (void)validationFunc
{
  return self->_validationFunc;
}

@end
