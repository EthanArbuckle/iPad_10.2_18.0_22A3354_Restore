@implementation TransparencyGPBBoolDoubleDictionary

- (TransparencyGPBBoolDoubleDictionary)init
{
  return -[TransparencyGPBBoolDoubleDictionary initWithDoubles:forKeys:count:](self, "initWithDoubles:forKeys:count:", 0, 0, 0);
}

- (TransparencyGPBBoolDoubleDictionary)initWithDoubles:(const double *)a3 forKeys:(const BOOL *)a4 count:(unint64_t)a5
{
  TransparencyGPBBoolDoubleDictionary *result;
  BOOL v9;
  uint64_t v10;
  unsigned int v11;
  double v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)TransparencyGPBBoolDoubleDictionary;
  result = -[TransparencyGPBBoolDoubleDictionary init](&v13, "init");
  if (result)
    v9 = a5 == 0;
  else
    v9 = 1;
  if (!v9)
  {
    do
    {
      v11 = *(unsigned __int8 *)a4++;
      v10 = v11;
      v12 = *a3++;
      result->_values[v10] = v12;
      result->_valueSet[v10] = 1;
      --a5;
    }
    while (a5);
  }
  return result;
}

- (TransparencyGPBBoolDoubleDictionary)initWithDictionary:(id)a3
{
  TransparencyGPBBoolDoubleDictionary *result;
  uint64_t v5;
  char v6;
  char v7;

  result = -[TransparencyGPBBoolDoubleDictionary initWithDoubles:forKeys:count:](self, "initWithDoubles:forKeys:count:", 0, 0, 0);
  if (a3 && result)
  {
    v5 = 0;
    v6 = 1;
    do
    {
      v7 = v6;
      if (*((_BYTE *)a3 + v5 + 32))
      {
        result->_values[v5] = *((double *)a3 + v5 + 2);
        result->_valueSet[v5] = 1;
      }
      v6 = 0;
      v5 = 1;
    }
    while ((v7 & 1) != 0);
  }
  return result;
}

- (TransparencyGPBBoolDoubleDictionary)initWithCapacity:(unint64_t)a3
{
  return -[TransparencyGPBBoolDoubleDictionary initWithDoubles:forKeys:count:](self, "initWithDoubles:forKeys:count:", 0, 0, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TransparencyGPBBoolDoubleDictionary initWithDictionary:](+[TransparencyGPBBoolDoubleDictionary allocWithZone:](TransparencyGPBBoolDoubleDictionary, "allocWithZone:", a3), "initWithDictionary:", self);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;

  if (self == a3)
    return 1;
  v5 = objc_opt_class(TransparencyGPBBoolDoubleDictionary, a2);
  return (objc_opt_isKindOfClass(a3, v5) & 1) != 0
      && self->_valueSet[0] == *((unsigned __int8 *)a3 + 32)
      && self->_valueSet[1] == *((unsigned __int8 *)a3 + 33)
      && (!self->_valueSet[0] || self->_values[0] == *((double *)a3 + 2))
      && (!self->_valueSet[1] || self->_values[1] == *((double *)a3 + 3));
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
    -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR("NO: %lf"), *(_QWORD *)&self->_values[0]);
  if (self->_valueSet[1])
    -[NSMutableString appendFormat:](v4, "appendFormat:", CFSTR("YES: %lf"), *(_QWORD *)&self->_values[1]);
  -[NSMutableString appendString:](v4, "appendString:", CFSTR(" }"));
  return v4;
}

- (unint64_t)count
{
  return self->_valueSet[1] + (unint64_t)self->_valueSet[0];
}

- (BOOL)getDouble:(double *)a3 forKey:(BOOL)a4
{
  _BOOL4 v4;

  v4 = self->_valueSet[a4];
  if (a3 && self->_valueSet[a4])
    *a3 = self->_values[a4];
  return v4;
}

- (void)setTransparencyGPBGenericValue:(id *)a3 forTransparencyGPBGenericValueKey:(id *)a4
{
  _BOOL8 var0;

  var0 = a4->var0;
  self->_values[var0] = a3->var6;
  self->_valueSet[var0] = 1;
}

- (void)enumerateForTextFormat:(id)a3
{
  if (self->_valueSet[0])
    (*((void (**)(id, const __CFString *, NSString *))a3 + 2))(a3, CFSTR("false"), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.*lg"), 15, *(_QWORD *)&self->_values[0]));
  if (self->_valueSet[1])
    (*((void (**)(id, const __CFString *, NSString *))a3 + 2))(a3, CFSTR("true"), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.*lg"), 15, *(_QWORD *)&self->_values[1]));
}

- (void)enumerateKeysAndDoublesUsingBlock:(id)a3
{
  char v5;

  v5 = 0;
  if (!self->_valueSet[0]
    || ((*((void (**)(id, _QWORD, char *, double))a3 + 2))(a3, 0, &v5, self->_values[0]), !v5))
  {
    if (self->_valueSet[1])
      (*((void (**)(id, uint64_t, char *, double))a3 + 2))(a3, 1, &v5, self->_values[1]);
  }
}

- (unint64_t)computeSerializedSizeAsField:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  BOOL *valueSet;
  char v8;
  char v9;
  uint64_t v10;
  uint64_t v11;

  v3 = 0;
  v4 = 0;
  v5 = 0;
  v6 = *((_QWORD *)a3 + 1);
  valueSet = self->_valueSet;
  v8 = 1;
  do
  {
    v9 = v8;
    if (valueSet[v3])
    {
      ++v4;
      v10 = sub_1000DFF54(1);
      v11 = sub_1000DFD70(2) + v10;
      v5 += v11 + sub_1000DE5AC(v11);
    }
    v8 = 0;
    v3 = 1;
  }
  while ((v9 & 1) != 0);
  return v5 + sub_1000E0488(*(_DWORD *)(v6 + 16), 15) * v4;
}

- (void)writeToCodedOutputStream:(id)a3 asField:(id)a4
{
  uint64_t v6;
  char v7;
  uint64_t v8;
  BOOL *valueSet;
  double *values;
  char v11;
  char v12;
  uint64_t v13;
  int v14;

  v6 = sub_10010B59C(*(_DWORD *)(*((_QWORD *)a4 + 1) + 16), 2);
  v7 = 0;
  v8 = 0;
  valueSet = self->_valueSet;
  values = self->_values;
  v11 = 1;
  do
  {
    v12 = v11;
    if (valueSet[v8])
    {
      objc_msgSend(a3, "writeInt32NoTag:", v6);
      v13 = v7 & 1;
      v14 = sub_1000DFF54(1);
      objc_msgSend(a3, "writeInt32NoTag:", sub_1000DFD70(2) + v14);
      objc_msgSend(a3, "writeBool:value:", 1, v13);
      objc_msgSend(a3, "writeDouble:value:", 2, values[v8]);
    }
    v11 = 0;
    v7 = 1;
    v8 = 1;
  }
  while ((v12 & 1) != 0);
}

- (void)addEntriesFromDictionary:(id)a3
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
        self->_values[v4] = *((double *)a3 + v4 + 2);
      }
      v5 = 0;
      v4 = 1;
    }
    while ((v6 & 1) != 0);
    autocreator = self->_autocreator;
    if (autocreator)
      sub_1000FE47C(autocreator, (uint64_t)self);
  }
}

- (void)setDouble:(double)a3 forKey:(BOOL)a4
{
  TransparencyGPBMessage *autocreator;

  self->_values[a4] = a3;
  self->_valueSet[a4] = 1;
  autocreator = self->_autocreator;
  if (autocreator)
    sub_1000FE47C(autocreator, (uint64_t)self);
}

- (void)removeDoubleForKey:(BOOL)a3
{
  self->_valueSet[a3] = 0;
}

- (void)removeAll
{
  *(_WORD *)self->_valueSet = 0;
}

@end
