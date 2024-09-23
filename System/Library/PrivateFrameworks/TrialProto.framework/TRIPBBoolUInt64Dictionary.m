@implementation TRIPBBoolUInt64Dictionary

- (TRIPBBoolUInt64Dictionary)init
{
  return -[TRIPBBoolUInt64Dictionary initWithUInt64s:forKeys:count:](self, "initWithUInt64s:forKeys:count:", 0, 0, 0);
}

- (TRIPBBoolUInt64Dictionary)initWithUInt64s:(const unint64_t *)a3 forKeys:(const BOOL *)a4 count:(unint64_t)a5
{
  TRIPBBoolUInt64Dictionary *result;
  uint64_t v9;
  unsigned int v10;
  unint64_t v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)TRIPBBoolUInt64Dictionary;
  result = -[TRIPBBoolUInt64Dictionary init](&v12, sel_init);
  if (a5 && result)
  {
    do
    {
      v10 = *(unsigned __int8 *)a4++;
      v9 = v10;
      v11 = *a3++;
      result->_values[v9] = v11;
      result->_valueSet[v9] = 1;
      --a5;
    }
    while (a5);
  }
  return result;
}

- (TRIPBBoolUInt64Dictionary)initWithDictionary:(id)a3
{
  TRIPBBoolUInt64Dictionary *result;
  uint64_t v5;
  char v6;
  char v7;

  result = -[TRIPBBoolUInt64Dictionary initWithUInt64s:forKeys:count:](self, "initWithUInt64s:forKeys:count:", 0, 0, 0);
  if (a3 && result)
  {
    v5 = 0;
    v6 = 1;
    do
    {
      v7 = v6;
      if (*((_BYTE *)a3 + v5 + 32))
      {
        result->_values[v5] = *((_QWORD *)a3 + v5 + 2);
        result->_valueSet[v5] = 1;
      }
      v6 = 0;
      v5 = 1;
    }
    while ((v7 & 1) != 0);
  }
  return result;
}

- (TRIPBBoolUInt64Dictionary)initWithCapacity:(unint64_t)a3
{
  return -[TRIPBBoolUInt64Dictionary initWithUInt64s:forKeys:count:](self, "initWithUInt64s:forKeys:count:", 0, 0, 0);
}

- (void)dealloc
{
  objc_super v3;

  if (self->_autocreator)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIPBDictionary.m"), 10498, CFSTR("%@: Autocreator must be cleared before release, autocreator: %@"), objc_opt_class(), self->_autocreator);
  v3.receiver = self;
  v3.super_class = (Class)TRIPBBoolUInt64Dictionary;
  -[TRIPBBoolUInt64Dictionary dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TRIPBBoolUInt64Dictionary initWithDictionary:](+[TRIPBBoolUInt64Dictionary allocWithZone:](TRIPBBoolUInt64Dictionary, "allocWithZone:", a3), "initWithDictionary:", self);
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
    return 1;
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0
      && self->_valueSet[0] == *((unsigned __int8 *)a3 + 32)
      && self->_valueSet[1] == *((unsigned __int8 *)a3 + 33)
      && (!self->_valueSet[0] || self->_values[0] == *((_QWORD *)a3 + 2))
      && (!self->_valueSet[1] || self->_values[1] == *((_QWORD *)a3 + 3));
}

- (unint64_t)hash
{
  return self->_valueSet[1] + (unint64_t)self->_valueSet[0];
}

- (id)description
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p> {"), objc_opt_class(), self);
  v4 = v3;
  if (self->_valueSet[0])
    objc_msgSend(v3, "appendFormat:", CFSTR("NO: %llu"), self->_values[0]);
  if (self->_valueSet[1])
    objc_msgSend(v4, "appendFormat:", CFSTR("YES: %llu"), self->_values[1]);
  objc_msgSend(v4, "appendString:", CFSTR(" }"));
  return v4;
}

- (unint64_t)count
{
  return self->_valueSet[1] + (unint64_t)self->_valueSet[0];
}

- (BOOL)getUInt64:(unint64_t *)a3 forKey:(BOOL)a4
{
  _BOOL4 v4;

  v4 = self->_valueSet[a4];
  if (a3 && self->_valueSet[a4])
    *a3 = self->_values[a4];
  return v4;
}

- (void)setTRIPBGenericValue:(id *)a3 forTRIPBGenericValueKey:(id *)a4
{
  _BOOL8 var0;

  var0 = a4->var0;
  self->_values[var0] = a3->var4;
  self->_valueSet[var0] = 1;
}

- (void)enumerateForTextFormat:(id)a3
{
  if (self->_valueSet[0])
    (*((void (**)(id, const __CFString *, uint64_t))a3 + 2))(a3, CFSTR("false"), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), self->_values[0]));
  if (self->_valueSet[1])
    (*((void (**)(id, const __CFString *, uint64_t))a3 + 2))(a3, CFSTR("true"), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), self->_values[1]));
}

- (void)enumerateKeysAndUInt64sUsingBlock:(id)a3
{
  char v5;

  v5 = 0;
  if (!self->_valueSet[0]
    || ((*((void (**)(id, _QWORD, unint64_t, char *))a3 + 2))(a3, 0, self->_values[0], &v5), !v5))
  {
    if (self->_valueSet[1])
      (*((void (**)(id, uint64_t, unint64_t, char *))a3 + 2))(a3, 1, self->_values[1], &v5);
  }
}

- (unint64_t)computeSerializedSizeAsField:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  BOOL *valueSet;
  unint64_t *values;
  char v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  BOOL v16;

  v3 = 0;
  v4 = 0;
  v5 = 0;
  v6 = *(unsigned __int8 *)(*((_QWORD *)a3 + 1) + 30);
  valueSet = self->_valueSet;
  values = self->_values;
  v9 = 1;
  do
  {
    v10 = v9;
    if (valueSet[v3])
    {
      ++v4;
      v11 = ComputeDictUInt64FieldSize(values[v3], 2, v6);
      v12 = v11 + 2;
      if ((v11 + 2) >> 28)
        v13 = 5;
      else
        v13 = 4;
      if (v12 < 0x200000)
        v13 = 3;
      if (v12 < 0x4000)
        v13 = 2;
      if (v12 < 0x80)
        v13 = 1;
      v5 += v12 + v13;
    }
    v9 = 0;
    v3 = 1;
  }
  while ((v10 & 1) != 0);
  v14 = 8 * *(_DWORD *)(*((_QWORD *)a3 + 1) + 16);
  if (v14 >= 0x80)
  {
    if (v14 >= 0x4000)
    {
      if (v14 >= 0x200000)
      {
        v16 = v14 >> 28 == 0;
        v15 = 4;
        if (!v16)
          v15 = 5;
      }
      else
      {
        v15 = 3;
      }
    }
    else
    {
      v15 = 2;
    }
  }
  else
  {
    v15 = 1;
  }
  return v5 + v15 * v4;
}

- (void)writeToCodedOutputStream:(id)a3 asField:(id)a4
{
  char v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  BOOL *valueSet;
  unint64_t *values;
  char v12;
  char v13;

  v5 = 0;
  v6 = 0;
  v7 = *((_QWORD *)a4 + 1);
  v8 = *(unsigned __int8 *)(v7 + 30);
  v9 = (8 * *(_DWORD *)(v7 + 16)) | 2u;
  valueSet = self->_valueSet;
  values = self->_values;
  v12 = 1;
  do
  {
    v13 = v12;
    if (valueSet[v6])
    {
      objc_msgSend(a3, "writeInt32NoTag:", v9);
      objc_msgSend(a3, "writeInt32NoTag:", ComputeDictUInt64FieldSize(values[v6], 2, v8) + 2);
      objc_msgSend(a3, "writeBool:value:", 1, v5 & 1);
      WriteDictUInt64Field(a3, values[v6], 2, v8);
    }
    v12 = 0;
    v5 = 1;
    v6 = 1;
  }
  while ((v13 & 1) != 0);
}

- (void)addEntriesFromDictionary:(id)a3
{
  uint64_t v4;
  char v5;
  char v6;
  TRIPBMessage *autocreator;

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
        self->_values[v4] = *((_QWORD *)a3 + v4 + 2);
      }
      v5 = 0;
      v4 = 1;
    }
    while ((v6 & 1) != 0);
    autocreator = self->_autocreator;
    if (autocreator)
      TRIPBAutocreatedDictionaryModified(autocreator, (uint64_t)self);
  }
}

- (void)setUInt64:(unint64_t)a3 forKey:(BOOL)a4
{
  TRIPBMessage *autocreator;

  self->_values[a4] = a3;
  self->_valueSet[a4] = 1;
  autocreator = self->_autocreator;
  if (autocreator)
    TRIPBAutocreatedDictionaryModified(autocreator, (uint64_t)self);
}

- (void)removeUInt64ForKey:(BOOL)a3
{
  self->_valueSet[a3] = 0;
}

- (void)removeAll
{
  *(_WORD *)self->_valueSet = 0;
}

@end
