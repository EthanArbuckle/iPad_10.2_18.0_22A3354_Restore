@implementation GPBBoolEnumDictionary

- (GPBBoolEnumDictionary)init
{
  return -[GPBBoolEnumDictionary initWithValidationFunction:rawValues:forKeys:count:](self, "initWithValidationFunction:rawValues:forKeys:count:", 0, 0, 0, 0);
}

- (GPBBoolEnumDictionary)initWithValidationFunction:(void *)a3
{
  return -[GPBBoolEnumDictionary initWithValidationFunction:rawValues:forKeys:count:](self, "initWithValidationFunction:rawValues:forKeys:count:", a3, 0, 0, 0);
}

- (GPBBoolEnumDictionary)initWithValidationFunction:(void *)a3 rawValues:(const int *)a4 forKeys:(const BOOL *)a5 count:(unint64_t)a6
{
  GPBBoolEnumDictionary *result;
  void *v11;
  uint64_t v12;
  unsigned int v13;
  int v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)GPBBoolEnumDictionary;
  result = -[GPBBoolEnumDictionary init](&v15, "init");
  if (result)
  {
    v11 = sub_1002A1CE0;
    if (a3)
      v11 = a3;
    for (result->_validationFunc = v11; a6; --a6)
    {
      v13 = *(unsigned __int8 *)a5++;
      v12 = v13;
      v14 = *a4++;
      result->_values[v12] = v14;
      result->_valueSet[v12] = 1;
    }
  }
  return result;
}

- (GPBBoolEnumDictionary)initWithDictionary:(id)a3
{
  GPBBoolEnumDictionary *result;
  uint64_t v5;
  char v6;
  char v7;

  result = -[GPBBoolEnumDictionary initWithValidationFunction:rawValues:forKeys:count:](self, "initWithValidationFunction:rawValues:forKeys:count:", objc_msgSend(a3, "validationFunc"), 0, 0, 0);
  if (a3 && result)
  {
    v5 = 0;
    v6 = 1;
    do
    {
      v7 = v6;
      if (*((_BYTE *)a3 + v5 + 32))
      {
        result->_values[v5] = *((_DWORD *)a3 + v5 + 6);
        result->_valueSet[v5] = 1;
      }
      v6 = 0;
      v5 = 1;
    }
    while ((v7 & 1) != 0);
  }
  return result;
}

- (GPBBoolEnumDictionary)initWithValidationFunction:(void *)a3 capacity:(unint64_t)a4
{
  return -[GPBBoolEnumDictionary initWithValidationFunction:rawValues:forKeys:count:](self, "initWithValidationFunction:rawValues:forKeys:count:", a3, 0, 0, 0);
}

- (void)dealloc
{
  objc_super v3;

  if (self->_autocreator)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GPBDictionary.m"), 11813, CFSTR("%@: Autocreator must be cleared before release, autocreator: %@"), objc_opt_class(self), self->_autocreator);
  v3.receiver = self;
  v3.super_class = (Class)GPBBoolEnumDictionary;
  -[GPBBoolEnumDictionary dealloc](&v3, "dealloc");
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[GPBBoolEnumDictionary initWithDictionary:](+[GPBBoolEnumDictionary allocWithZone:](GPBBoolEnumDictionary, "allocWithZone:", a3), "initWithDictionary:", self);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;

  if (self == a3)
    return 1;
  v5 = objc_opt_class(GPBBoolEnumDictionary);
  return (objc_opt_isKindOfClass(a3, v5) & 1) != 0
      && self->_valueSet[0] == *((unsigned __int8 *)a3 + 32)
      && self->_valueSet[1] == *((unsigned __int8 *)a3 + 33)
      && (!self->_valueSet[0] || self->_values[0] == *((_DWORD *)a3 + 6))
      && (!self->_valueSet[1] || self->_values[1] == *((_DWORD *)a3 + 7));
}

- (unint64_t)hash
{
  return self->_valueSet[1] + (unint64_t)self->_valueSet[0];
}

- (id)description
{
  NSMutableString *v3;
  NSMutableString *v4;

  v3 = +[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("<%@ %p> {"), objc_opt_class(self), self);
  v4 = v3;
  if (self->_valueSet[0])
    -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR("NO: %d"), self->_values[0]);
  if (self->_valueSet[1])
    -[NSMutableString appendFormat:](v4, "appendFormat:", CFSTR("YES: %d"), self->_values[1]);
  -[NSMutableString appendString:](v4, "appendString:", CFSTR(" }"));
  return v4;
}

- (unint64_t)count
{
  return self->_valueSet[1] + (unint64_t)self->_valueSet[0];
}

- (BOOL)getEnum:(int *)a3 forKey:(BOOL)a4
{
  _BOOL4 v4;
  unsigned int v6;
  int v7;

  v4 = self->_valueSet[a4];
  if (a3 && self->_valueSet[a4])
  {
    v6 = self->_values[a4];
    if (((unsigned int (*)(_QWORD, SEL))self->_validationFunc)(v6, a2))
      v7 = v6;
    else
      v7 = -72499473;
    *a3 = v7;
  }
  return v4;
}

- (BOOL)getRawValue:(int *)a3 forKey:(BOOL)a4
{
  _BOOL4 v4;

  v4 = self->_valueSet[a4];
  if (a3 && self->_valueSet[a4])
    *a3 = self->_values[a4];
  return v4;
}

- (void)enumerateKeysAndRawValuesUsingBlock:(id)a3
{
  char v5;

  v5 = 0;
  if (!self->_valueSet[0]
    || ((*((void (**)(id, _QWORD, _QWORD, char *))a3 + 2))(a3, 0, self->_values[0], &v5), !v5))
  {
    if (self->_valueSet[1])
      (*((void (**)(id, uint64_t, _QWORD, char *))a3 + 2))(a3, 1, self->_values[1], &v5);
  }
}

- (void)enumerateKeysAndEnumsUsingBlock:(id)a3
{
  unsigned int (*validationFunc)(uint64_t, SEL);
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;

  v10 = 0;
  validationFunc = (unsigned int (*)(uint64_t, SEL))self->_validationFunc;
  if (!self->_valueSet[0]
    || ((v6 = self->_values[0], !validationFunc(v6, a2)) ? (v7 = 4222467823) : (v7 = v6),
        (*((void (**)(id, _QWORD, uint64_t, char *))a3 + 2))(a3, 0, v7, &v10),
        !v10))
  {
    if (self->_valueSet[1])
    {
      v8 = self->_values[1];
      if (validationFunc(v8, a2))
        v9 = v8;
      else
        v9 = 4222467823;
      (*((void (**)(id, uint64_t, uint64_t, char *))a3 + 2))(a3, 1, v9, &v10);
    }
  }
}

- (id)serializedDataForUnknownValue:(int)a3 forKey:(id *)a4 keyDataType:(unsigned __int8)a5
{
  unsigned int v5;
  uint64_t v7;
  uint64_t v8;
  NSMutableData *v9;
  GPBCodedOutputStream *v10;

  v5 = a5;
  v7 = *(_QWORD *)&a3;
  v8 = sub_1002A04B4(a4->var0, 1, a5);
  v9 = +[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", GPBComputeEnumSize(2, v7) + v8);
  v10 = -[GPBCodedOutputStream initWithData:]([GPBCodedOutputStream alloc], "initWithData:", v9);
  sub_1002A0678(v10, a4->var0, 1, v5);
  -[GPBCodedOutputStream writeEnum:value:](v10, "writeEnum:value:", 2, v7);

  return v9;
}

- (unint64_t)computeSerializedSizeAsField:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  BOOL *valueSet;
  int *values;
  char v10;
  char v11;
  uint64_t v12;
  uint64_t v13;

  v4 = 0;
  v5 = 0;
  v6 = 0;
  v7 = *(unsigned __int8 *)(*((_QWORD *)a3 + 1) + 30);
  valueSet = self->_valueSet;
  values = self->_values;
  v10 = 1;
  do
  {
    v11 = v10;
    if (valueSet[v4])
    {
      ++v5;
      v12 = GPBComputeBoolSize(1);
      v13 = sub_10029E810(values[v4], 2, v7) + v12;
      v6 += v13 + GPBComputeRawVarint32SizeForInteger(v13);
    }
    v10 = 0;
    v4 = 1;
  }
  while ((v11 & 1) != 0);
  return v6 + GPBComputeWireFormatTagSize(*(_DWORD *)(*((_QWORD *)a3 + 1) + 16), 15) * v5;
}

- (void)writeToCodedOutputStream:(id)a3 asField:(id)a4
{
  uint64_t v6;
  unsigned int v7;
  uint64_t Tag;
  char v9;
  uint64_t v10;
  BOOL *valueSet;
  int *values;
  char v13;
  char v14;
  uint64_t v15;
  int v16;

  v6 = *((_QWORD *)a4 + 1);
  v7 = *(unsigned __int8 *)(v6 + 30);
  Tag = GPBWireFormatMakeTag(*(_DWORD *)(v6 + 16), 2);
  v9 = 0;
  v10 = 0;
  valueSet = self->_valueSet;
  values = self->_values;
  v13 = 1;
  do
  {
    v14 = v13;
    if (valueSet[v10])
    {
      objc_msgSend(a3, "writeInt32NoTag:", Tag);
      v15 = v9 & 1;
      v16 = GPBComputeBoolSize(1);
      objc_msgSend(a3, "writeInt32NoTag:", sub_10029E810(values[v10], 2, v7) + v16);
      objc_msgSend(a3, "writeBool:value:", 1, v15);
      sub_10029EA1C(a3, values[v10], 2, v7);
    }
    v13 = 0;
    v9 = 1;
    v10 = 1;
  }
  while ((v14 & 1) != 0);
}

- (void)enumerateForTextFormat:(id)a3
{
  if (self->_valueSet[0])
    (*((void (**)(id, const __CFString *, NSNumber *))a3 + 2))(a3, CFSTR("false"), +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_values[0]));
  if (self->_valueSet[1])
    (*((void (**)(id, const __CFString *, NSNumber *))a3 + 2))(a3, CFSTR("true"), +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_values[1]));
}

- (void)setGPBGenericValue:(id *)a3 forGPBGenericValueKey:(id *)a4
{
  _BOOL8 var0;

  var0 = a4->var0;
  self->_values[var0] = a3->var1;
  self->_valueSet[var0] = 1;
}

- (void)addRawEntriesFromDictionary:(id)a3
{
  uint64_t v4;
  char v5;
  char v6;
  GPBMessage *autocreator;

  if (a3)
  {
    v4 = 0;
    v5 = 1;
    do
    {
      v6 = v5;
      if (*((_BYTE *)a3 + v4 + 32))
      {
        self->_valueSet[v4] = 1;
        self->_values[v4] = *((_DWORD *)a3 + v4 + 6);
      }
      v5 = 0;
      v4 = 1;
    }
    while ((v6 & 1) != 0);
    autocreator = self->_autocreator;
    if (autocreator)
      GPBAutocreatedDictionaryModified(autocreator, (uint64_t)self);
  }
}

- (void)setEnum:(int)a3 forKey:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v5;
  GPBMessage *autocreator;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  if ((((uint64_t (*)(_QWORD, SEL))self->_validationFunc)(*(_QWORD *)&a3, a2) & 1) == 0)
    +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("GPBBoolEnumDictionary: Attempt to set an unknown enum value (%d)"), v5);
  self->_values[v4] = v5;
  self->_valueSet[v4] = 1;
  autocreator = self->_autocreator;
  if (autocreator)
    GPBAutocreatedDictionaryModified(autocreator, (uint64_t)self);
}

- (void)setRawValue:(int)a3 forKey:(BOOL)a4
{
  GPBMessage *autocreator;

  self->_values[a4] = a3;
  self->_valueSet[a4] = 1;
  autocreator = self->_autocreator;
  if (autocreator)
    GPBAutocreatedDictionaryModified(autocreator, (uint64_t)self);
}

- (void)removeEnumForKey:(BOOL)a3
{
  self->_valueSet[a3] = 0;
}

- (void)removeAll
{
  *(_WORD *)self->_valueSet = 0;
}

- (void)validationFunc
{
  return self->_validationFunc;
}

@end
