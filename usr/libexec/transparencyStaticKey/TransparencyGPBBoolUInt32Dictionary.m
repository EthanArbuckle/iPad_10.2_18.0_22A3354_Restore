@implementation TransparencyGPBBoolUInt32Dictionary

- (TransparencyGPBBoolUInt32Dictionary)init
{
  return -[TransparencyGPBBoolUInt32Dictionary initWithUInt32s:forKeys:count:](self, "initWithUInt32s:forKeys:count:", 0, 0, 0);
}

- (TransparencyGPBBoolUInt32Dictionary)initWithUInt32s:(const unsigned int *)a3 forKeys:(const BOOL *)a4 count:(unint64_t)a5
{
  TransparencyGPBBoolUInt32Dictionary *result;
  BOOL v9;
  uint64_t v10;
  unsigned int v11;
  unsigned int v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)TransparencyGPBBoolUInt32Dictionary;
  result = -[TransparencyGPBBoolUInt32Dictionary init](&v13, "init");
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

- (TransparencyGPBBoolUInt32Dictionary)initWithDictionary:(id)a3
{
  TransparencyGPBBoolUInt32Dictionary *result;
  uint64_t v5;
  char v6;
  char v7;

  result = -[TransparencyGPBBoolUInt32Dictionary initWithUInt32s:forKeys:count:](self, "initWithUInt32s:forKeys:count:", 0, 0, 0);
  if (a3 && result)
  {
    v5 = 0;
    v6 = 1;
    do
    {
      v7 = v6;
      if (*((_BYTE *)a3 + v5 + 24))
      {
        result->_values[v5] = *((_DWORD *)a3 + v5 + 4);
        result->_valueSet[v5] = 1;
      }
      v6 = 0;
      v5 = 1;
    }
    while ((v7 & 1) != 0);
  }
  return result;
}

- (TransparencyGPBBoolUInt32Dictionary)initWithCapacity:(unint64_t)a3
{
  return -[TransparencyGPBBoolUInt32Dictionary initWithUInt32s:forKeys:count:](self, "initWithUInt32s:forKeys:count:", 0, 0, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TransparencyGPBBoolUInt32Dictionary initWithDictionary:](+[TransparencyGPBBoolUInt32Dictionary allocWithZone:](TransparencyGPBBoolUInt32Dictionary, "allocWithZone:", a3), "initWithDictionary:", self);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;

  if (self == a3)
    return 1;
  v5 = objc_opt_class(TransparencyGPBBoolUInt32Dictionary, a2);
  return (objc_opt_isKindOfClass(a3, v5) & 1) != 0
      && self->_valueSet[0] == *((unsigned __int8 *)a3 + 24)
      && self->_valueSet[1] == *((unsigned __int8 *)a3 + 25)
      && (!self->_valueSet[0] || self->_values[0] == *((_DWORD *)a3 + 4))
      && (!self->_valueSet[1] || self->_values[1] == *((_DWORD *)a3 + 5));
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
    -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR("NO: %u"), self->_values[0]);
  if (self->_valueSet[1])
    -[NSMutableString appendFormat:](v4, "appendFormat:", CFSTR("YES: %u"), self->_values[1]);
  -[NSMutableString appendString:](v4, "appendString:", CFSTR(" }"));
  return v4;
}

- (unint64_t)count
{
  return self->_valueSet[1] + (unint64_t)self->_valueSet[0];
}

- (BOOL)getUInt32:(unsigned int *)a3 forKey:(BOOL)a4
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
  self->_values[var0] = a3->var1;
  self->_valueSet[var0] = 1;
}

- (void)enumerateForTextFormat:(id)a3
{
  if (self->_valueSet[0])
    (*((void (**)(id, const __CFString *, NSString *))a3 + 2))(a3, CFSTR("false"), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%u"), self->_values[0]));
  if (self->_valueSet[1])
    (*((void (**)(id, const __CFString *, NSString *))a3 + 2))(a3, CFSTR("true"), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%u"), self->_values[1]));
}

- (void)enumerateKeysAndUInt32sUsingBlock:(id)a3
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

- (unint64_t)computeSerializedSizeAsField:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  BOOL *valueSet;
  unsigned int *values;
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
      v12 = sub_10001A678(1);
      v13 = sub_100035F44(values[v3], 2, v7) + v12;
      v5 += v13 + sub_100018CC8(v13);
    }
    v10 = 0;
    v3 = 1;
  }
  while ((v11 & 1) != 0);
  return v5 + sub_10001ABAC(*(_DWORD *)(v6 + 16), 15) * v4;
}

- (void)writeToCodedOutputStream:(id)a3 asField:(id)a4
{
  uint64_t v6;
  int v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  BOOL *valueSet;
  unsigned int *values;
  char v13;
  char v14;
  uint64_t v15;
  int v16;
  uint64_t v17;

  v6 = *((_QWORD *)a4 + 1);
  v7 = *(unsigned __int8 *)(v6 + 30);
  v8 = sub_100023730(*(_DWORD *)(v6 + 16), 2);
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
      v16 = sub_10001A678(1);
      objc_msgSend(a3, "writeInt32NoTag:", sub_100035F44(values[v10], 2, v7) + v16);
      objc_msgSend(a3, "writeBool:value:", 1, v15);
      v17 = values[v10];
      if (v7 == 1)
      {
        objc_msgSend(a3, "writeFixed32:value:", 2, v17);
      }
      else if (v7 == 11)
      {
        objc_msgSend(a3, "writeUInt32:value:", 2, v17);
      }
    }
    v13 = 0;
    v9 = 1;
    v10 = 1;
  }
  while ((v14 & 1) != 0);
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
      if (*((_BYTE *)a3 + v4 + 24))
      {
        self->_valueSet[v4] = 1;
        self->_values[v4] = *((_DWORD *)a3 + v4 + 4);
      }
      v5 = 0;
      v4 = 1;
    }
    while ((v6 & 1) != 0);
    autocreator = self->_autocreator;
    if (autocreator)
      sub_10002922C(autocreator, (uint64_t)self);
  }
}

- (void)setUInt32:(unsigned int)a3 forKey:(BOOL)a4
{
  TransparencyGPBMessage *autocreator;

  self->_values[a4] = a3;
  self->_valueSet[a4] = 1;
  autocreator = self->_autocreator;
  if (autocreator)
    sub_10002922C(autocreator, (uint64_t)self);
}

- (void)removeUInt32ForKey:(BOOL)a3
{
  self->_valueSet[a3] = 0;
}

- (void)removeAll
{
  *(_WORD *)self->_valueSet = 0;
}

@end
