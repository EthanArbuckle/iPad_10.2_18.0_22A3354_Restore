@implementation TRIPBBoolBoolDictionary

- (TRIPBBoolBoolDictionary)init
{
  return -[TRIPBBoolBoolDictionary initWithBools:forKeys:count:](self, "initWithBools:forKeys:count:", 0, 0, 0);
}

- (TRIPBBoolBoolDictionary)initWithBools:(const BOOL *)a3 forKeys:(const BOOL *)a4 count:(unint64_t)a5
{
  TRIPBBoolBoolDictionary *result;
  uint64_t v9;
  unsigned int v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TRIPBBoolBoolDictionary;
  result = -[TRIPBBoolBoolDictionary init](&v11, sel_init);
  if (a5 && result)
  {
    do
    {
      v10 = *(unsigned __int8 *)a4++;
      v9 = v10;
      LOBYTE(v10) = *a3++;
      result->_values[v9] = v10;
      result->_valueSet[v9] = 1;
      --a5;
    }
    while (a5);
  }
  return result;
}

- (TRIPBBoolBoolDictionary)initWithDictionary:(id)a3
{
  TRIPBBoolBoolDictionary *result;
  uint64_t v5;
  char v6;
  char v7;

  result = -[TRIPBBoolBoolDictionary initWithBools:forKeys:count:](self, "initWithBools:forKeys:count:", 0, 0, 0);
  if (a3 && result)
  {
    v5 = 0;
    v6 = 1;
    do
    {
      v7 = v6;
      if (*((_BYTE *)a3 + v5 + 18))
      {
        result->_values[v5] = *((_BYTE *)a3 + v5 + 16);
        result->_valueSet[v5] = 1;
      }
      v6 = 0;
      v5 = 1;
    }
    while ((v7 & 1) != 0);
  }
  return result;
}

- (TRIPBBoolBoolDictionary)initWithCapacity:(unint64_t)a3
{
  return -[TRIPBBoolBoolDictionary initWithBools:forKeys:count:](self, "initWithBools:forKeys:count:", 0, 0, 0);
}

- (void)dealloc
{
  objc_super v3;

  if (self->_autocreator)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIPBDictionary.m"), 10916, CFSTR("%@: Autocreator must be cleared before release, autocreator: %@"), objc_opt_class(), self->_autocreator);
  v3.receiver = self;
  v3.super_class = (Class)TRIPBBoolBoolDictionary;
  -[TRIPBBoolBoolDictionary dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TRIPBBoolBoolDictionary initWithDictionary:](+[TRIPBBoolBoolDictionary allocWithZone:](TRIPBBoolBoolDictionary, "allocWithZone:", a3), "initWithDictionary:", self);
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
    return 1;
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0
      && self->_valueSet[0] == *((unsigned __int8 *)a3 + 18)
      && self->_valueSet[1] == *((unsigned __int8 *)a3 + 19)
      && (!self->_valueSet[0] || self->_values[0] == *((unsigned __int8 *)a3 + 16))
      && (!self->_valueSet[1] || self->_values[1] == *((unsigned __int8 *)a3 + 17));
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
    objc_msgSend(v3, "appendFormat:", CFSTR("NO: %d"), self->_values[0]);
  if (self->_valueSet[1])
    objc_msgSend(v4, "appendFormat:", CFSTR("YES: %d"), self->_values[1]);
  objc_msgSend(v4, "appendString:", CFSTR(" }"));
  return v4;
}

- (unint64_t)count
{
  return self->_valueSet[1] + (unint64_t)self->_valueSet[0];
}

- (BOOL)getBool:(BOOL *)a3 forKey:(BOOL)a4
{
  _BOOL4 v4;

  v4 = self->_valueSet[a4];
  if (a3 && self->_valueSet[a4])
    *a3 = self->_values[a4];
  return v4;
}

- (void)setTRIPBGenericValue:(id *)a3 forTRIPBGenericValueKey:(id *)a4
{
  char *v4;

  v4 = (char *)self + a4->var0;
  v4[16] = a3->var0;
  v4[18] = 1;
}

- (void)enumerateForTextFormat:(id)a3
{
  const __CFString *v5;
  const __CFString *v6;

  if (self->_valueSet[0])
  {
    if (self->_values[0])
      v5 = CFSTR("true");
    else
      v5 = CFSTR("false");
    (*((void (**)(id, const __CFString *, const __CFString *))a3 + 2))(a3, CFSTR("false"), v5);
  }
  if (self->_valueSet[1])
  {
    if (self->_values[1])
      v6 = CFSTR("true");
    else
      v6 = CFSTR("false");
    (*((void (**)(id, const __CFString *, const __CFString *))a3 + 2))(a3, CFSTR("true"), v6);
  }
}

- (void)enumerateKeysAndBoolsUsingBlock:(id)a3
{
  char v5;

  v5 = 0;
  if (!self->_valueSet[0]
    || ((*((void (**)(id, _QWORD, BOOL, char *))a3 + 2))(a3, 0, self->_values[0], &v5), !v5))
  {
    if (self->_valueSet[1])
      (*((void (**)(id, uint64_t, BOOL, char *))a3 + 2))(a3, 1, self->_values[1], &v5);
  }
}

- (unint64_t)computeSerializedSizeAsField:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  BOOL *valueSet;
  char v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  BOOL v16;

  v4 = 0;
  v5 = 0;
  v6 = 0;
  v7 = *(unsigned __int8 *)(*((_QWORD *)a3 + 1) + 30);
  valueSet = self->_valueSet;
  v9 = 1;
  do
  {
    v10 = v9;
    if (valueSet[v4])
    {
      ++v5;
      v11 = ComputeDictBoolFieldSize(2, v7);
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
      v6 += v12 + v13;
    }
    v9 = 0;
    v4 = 1;
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
  return v6 + v15 * v5;
}

- (void)writeToCodedOutputStream:(id)a3 asField:(id)a4
{
  char v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  BOOL *valueSet;
  BOOL *values;
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
      objc_msgSend(a3, "writeInt32NoTag:", ComputeDictBoolFieldSize(2, v8) + 2);
      objc_msgSend(a3, "writeBool:value:", 1, v5 & 1);
      WriteDictBoolField(a3, values[v6], 2, v8);
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
      if (*((_BYTE *)a3 + v4 + 18))
      {
        self->_valueSet[v4] = 1;
        self->_values[v4] = *((_BYTE *)a3 + v4 + 16);
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

- (void)setBool:(BOOL)a3 forKey:(BOOL)a4
{
  char *v5;
  TRIPBMessage *autocreator;

  v5 = (char *)self + a4;
  v5[16] = a3;
  v5[18] = 1;
  autocreator = self->_autocreator;
  if (autocreator)
    TRIPBAutocreatedDictionaryModified(autocreator, (uint64_t)self);
}

- (void)removeBoolForKey:(BOOL)a3
{
  self->_valueSet[a3] = 0;
}

- (void)removeAll
{
  *(_WORD *)self->_valueSet = 0;
}

@end
