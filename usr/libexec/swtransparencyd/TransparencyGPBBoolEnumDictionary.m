@implementation TransparencyGPBBoolEnumDictionary

- (TransparencyGPBBoolEnumDictionary)init
{
  return -[TransparencyGPBBoolEnumDictionary initWithValidationFunction:rawValues:forKeys:count:](self, "initWithValidationFunction:rawValues:forKeys:count:", 0, 0, 0, 0);
}

- (TransparencyGPBBoolEnumDictionary)initWithValidationFunction:(void *)a3
{
  return -[TransparencyGPBBoolEnumDictionary initWithValidationFunction:rawValues:forKeys:count:](self, "initWithValidationFunction:rawValues:forKeys:count:", a3, 0, 0, 0);
}

- (TransparencyGPBBoolEnumDictionary)initWithValidationFunction:(void *)a3 rawValues:(const int *)a4 forKeys:(const BOOL *)a5 count:(unint64_t)a6
{
  TransparencyGPBBoolEnumDictionary *result;
  void *v11;
  uint64_t v12;
  unsigned int v13;
  int v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)TransparencyGPBBoolEnumDictionary;
  result = -[TransparencyGPBBoolEnumDictionary init](&v15, "init");
  if (result)
  {
    v11 = sub_1000A7520;
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

- (TransparencyGPBBoolEnumDictionary)initWithDictionary:(id)a3
{
  TransparencyGPBBoolEnumDictionary *result;
  uint64_t v5;
  char v6;
  char v7;

  result = -[TransparencyGPBBoolEnumDictionary initWithValidationFunction:rawValues:forKeys:count:](self, "initWithValidationFunction:rawValues:forKeys:count:", objc_msgSend(a3, "validationFunc"), 0, 0, 0);
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

- (TransparencyGPBBoolEnumDictionary)initWithValidationFunction:(void *)a3 capacity:(unint64_t)a4
{
  return -[TransparencyGPBBoolEnumDictionary initWithValidationFunction:rawValues:forKeys:count:](self, "initWithValidationFunction:rawValues:forKeys:count:", a3, 0, 0, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TransparencyGPBBoolEnumDictionary initWithDictionary:](+[TransparencyGPBBoolEnumDictionary allocWithZone:](TransparencyGPBBoolEnumDictionary, "allocWithZone:", a3), "initWithDictionary:", self);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;

  if (self == a3)
    return 1;
  v5 = objc_opt_class(TransparencyGPBBoolEnumDictionary, a2);
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

  v3 = +[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("<%@ %p> {"), objc_opt_class(self, a2), self);
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
  uint64_t v6;
  uint64_t v7;
  NSMutableData *v8;
  TransparencyGPBCodedOutputStream *v9;

  v6 = *(_QWORD *)&a3;
  v7 = sub_1000A0BE4(1);
  v8 = +[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", sub_1000A0B48(2, v6) + v7);
  v9 = -[TransparencyGPBCodedOutputStream initWithData:]([TransparencyGPBCodedOutputStream alloc], "initWithData:", v8);
  -[TransparencyGPBCodedOutputStream writeBool:value:](v9, "writeBool:value:", 1, a4->var0);
  -[TransparencyGPBCodedOutputStream writeEnum:value:](v9, "writeEnum:value:", 2, v6);

  return v8;
}

- (unint64_t)computeSerializedSizeAsField:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  BOOL *valueSet;
  int *values;
  char v10;
  char v11;
  uint64_t v12;
  uint64_t v13;

  v3 = 0;
  v4 = 0;
  v5 = 0;
  v6 = *((_QWORD *)a3 + 1);
  v7 = *(unsigned __int8 *)(v6 + 30);
  valueSet = self->_valueSet;
  values = self->_values;
  v10 = 1;
  do
  {
    v11 = v10;
    if (valueSet[v3])
    {
      ++v4;
      v12 = sub_1000A0BE4(1);
      v13 = sub_1000A48A8(values[v3], 2, v7) + v12;
      v5 += v13 + sub_10009F23C(v13);
    }
    v10 = 0;
    v3 = 1;
  }
  while ((v11 & 1) != 0);
  return v5 + sub_1000A1118(*(_DWORD *)(v6 + 16), 15) * v4;
}

- (void)writeToCodedOutputStream:(id)a3 asField:(id)a4
{
  uint64_t v6;
  int v7;
  uint64_t v8;
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
  v8 = sub_1000CC22C(*(_DWORD *)(v6 + 16), 2);
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
      objc_msgSend(a3, "writeInt32NoTag:", v8);
      v15 = v9 & 1;
      v16 = sub_1000A0BE4(1);
      objc_msgSend(a3, "writeInt32NoTag:", sub_1000A48A8(values[v10], 2, v7) + v16);
      objc_msgSend(a3, "writeBool:value:", 1, v15);
      sub_1000A4A44(a3, values[v10], 2, v7);
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

- (void)setTransparencyGPBGenericValue:(id *)a3 forTransparencyGPBGenericValueKey:(id *)a4
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
  TransparencyGPBMessage *autocreator;

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
      sub_1000BF10C(autocreator, (uint64_t)self);
  }
}

- (void)setEnum:(int)a3 forKey:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v5;
  TransparencyGPBMessage *autocreator;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  if ((((uint64_t (*)(_QWORD, SEL))self->_validationFunc)(*(_QWORD *)&a3, a2) & 1) == 0)
    +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("TransparencyGPBBoolEnumDictionary: Attempt to set an unknown enum value (%d)"), v5);
  self->_values[v4] = v5;
  self->_valueSet[v4] = 1;
  autocreator = self->_autocreator;
  if (autocreator)
    sub_1000BF10C(autocreator, (uint64_t)self);
}

- (void)setRawValue:(int)a3 forKey:(BOOL)a4
{
  TransparencyGPBMessage *autocreator;

  self->_values[a4] = a3;
  self->_valueSet[a4] = 1;
  autocreator = self->_autocreator;
  if (autocreator)
    sub_1000BF10C(autocreator, (uint64_t)self);
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
