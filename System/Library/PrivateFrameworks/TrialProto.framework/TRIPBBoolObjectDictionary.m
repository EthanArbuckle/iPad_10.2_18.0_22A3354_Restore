@implementation TRIPBBoolObjectDictionary

- (TRIPBBoolObjectDictionary)init
{
  return -[TRIPBBoolObjectDictionary initWithObjects:forKeys:count:](self, "initWithObjects:forKeys:count:", 0, 0, 0);
}

- (TRIPBBoolObjectDictionary)initWithObjects:(const void *)a3 forKeys:(const BOOL *)a4 count:(unint64_t)a5
{
  TRIPBBoolObjectDictionary *v8;
  TRIPBBoolObjectDictionary *v9;
  uint64_t v10;
  id *values;
  uint64_t v12;
  unsigned int v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)TRIPBBoolObjectDictionary;
  v8 = -[TRIPBBoolObjectDictionary init](&v16, sel_init);
  v9 = v8;
  if (a5 && v8)
  {
    v10 = *MEMORY[0x1E0C99778];
    values = v8->_values;
    do
    {
      if (!*a3)
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v10, CFSTR("Attempting to add nil object to a Dictionary"));
      v13 = *(unsigned __int8 *)a4++;
      v12 = v13;

      v14 = (void *)*a3++;
      values[v12] = v14;
      --a5;
    }
    while (a5);
  }
  return v9;
}

- (TRIPBBoolObjectDictionary)initWithDictionary:(id)a3
{
  TRIPBBoolObjectDictionary *v4;
  TRIPBBoolObjectDictionary *v5;

  v4 = -[TRIPBBoolObjectDictionary initWithObjects:forKeys:count:](self, "initWithObjects:forKeys:count:", 0, 0, 0);
  v5 = v4;
  if (a3 && v4)
  {
    v4->_values[0] = *((id *)a3 + 2);
    v5->_values[1] = *((id *)a3 + 3);
  }
  return v5;
}

- (TRIPBBoolObjectDictionary)initWithCapacity:(unint64_t)a3
{
  return -[TRIPBBoolObjectDictionary initWithObjects:forKeys:count:](self, "initWithObjects:forKeys:count:", 0, 0, 0);
}

- (void)dealloc
{
  objc_super v3;

  if (self->_autocreator)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIPBDictionary.m"), 11541, CFSTR("%@: Autocreator must be cleared before release, autocreator: %@"), objc_opt_class(), self->_autocreator);

  v3.receiver = self;
  v3.super_class = (Class)TRIPBBoolObjectDictionary;
  -[TRIPBBoolObjectDictionary dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TRIPBBoolObjectDictionary initWithDictionary:](+[TRIPBBoolObjectDictionary allocWithZone:](TRIPBBoolObjectDictionary, "allocWithZone:", a3), "initWithDictionary:", self);
}

- (BOOL)isEqual:(id)a3
{
  id v5;
  id v6;
  int v7;

  if (self == a3)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (v5 = self->_values[0], (v5 != 0) == (*((_QWORD *)a3 + 2) == 0))
      || (v6 = self->_values[1], (v6 == 0) == (*((_QWORD *)a3 + 3) != 0)))
    {
      LOBYTE(v7) = 0;
      return v7;
    }
    if (v5)
    {
      v7 = objc_msgSend(self->_values[0], "isEqual:");
      if (!v7)
        return v7;
      v6 = self->_values[1];
    }
    if (!v6 || (v7 = objc_msgSend(v6, "isEqual:", *((_QWORD *)a3 + 3))) != 0)
      LOBYTE(v7) = 1;
  }
  return v7;
}

- (unint64_t)hash
{
  if (self->_values[0])
    return (self->_values[1] != 0) + 1;
  else
    return self->_values[1] != 0;
}

- (id)description
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p> {"), objc_opt_class(), self);
  v4 = v3;
  if (self->_values[0])
    objc_msgSend(v3, "appendFormat:", CFSTR("NO: %@"), self->_values[0]);
  if (self->_values[1])
    objc_msgSend(v4, "appendFormat:", CFSTR("YES: %@"), self->_values[1]);
  objc_msgSend(v4, "appendString:", CFSTR(" }"));
  return v4;
}

- (unint64_t)count
{
  if (self->_values[0])
    return (self->_values[1] != 0) + 1;
  else
    return self->_values[1] != 0;
}

- (id)objectForKey:(BOOL)a3
{
  return self->_values[a3];
}

- (void)setTRIPBGenericValue:(id *)a3 forTRIPBGenericValueKey:(id *)a4
{
  id *v5;

  v5 = (id *)(&self->super.isa + a4->var0);

  v5[2] = a3->var7;
}

- (void)enumerateForTextFormat:(id)a3
{
  if (self->_values[0])
    (*((void (**)(id, const __CFString *))a3 + 2))(a3, CFSTR("false"));
  if (self->_values[1])
    (*((void (**)(id, const __CFString *))a3 + 2))(a3, CFSTR("true"));
}

- (void)enumerateKeysAndObjectsUsingBlock:(id)a3
{
  id v5;
  id v6;
  char v7;

  v7 = 0;
  v5 = self->_values[0];
  if (!v5 || ((*((void (**)(id, _QWORD, id, char *))a3 + 2))(a3, 0, v5, &v7), !v7))
  {
    v6 = self->_values[1];
    if (v6)
      (*((void (**)(id, uint64_t, id, char *))a3 + 2))(a3, 1, v6, &v7);
  }
}

- (BOOL)isInitialized
{
  id v3;
  int v4;
  id v5;

  v3 = self->_values[0];
  if (!v3 || (v4 = objc_msgSend(v3, "isInitialized")) != 0)
  {
    v5 = self->_values[1];
    if (!v5 || (v4 = objc_msgSend(v5, "isInitialized")) != 0)
      LOBYTE(v4) = 1;
  }
  return v4;
}

- (id)deepCopyWithZone:(_NSZone *)a3
{
  TRIPBBoolObjectDictionary *v5;
  uint64_t v6;
  id *values;
  char v8;
  char v9;
  id v10;

  v5 = objc_alloc_init(TRIPBBoolObjectDictionary);
  v6 = 0;
  values = self->_values;
  v8 = 1;
  do
  {
    v9 = v8;
    v10 = values[v6];
    if (v10)
      v5->_values[v6] = (id)objc_msgSend(v10, "copyWithZone:", a3);
    v8 = 0;
    v6 = 1;
  }
  while ((v9 & 1) != 0);
  return v5;
}

- (unint64_t)computeSerializedSizeAsField:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  id *values;
  char v9;
  char v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  BOOL v17;

  v4 = 0;
  v5 = 0;
  v6 = 0;
  v7 = *(unsigned __int8 *)(*((_QWORD *)a3 + 1) + 30);
  values = self->_values;
  v9 = 1;
  do
  {
    v10 = v9;
    v11 = values[v4];
    if (v11)
    {
      ++v5;
      v12 = ComputeDictObjectFieldSize(v11, v7);
      v13 = v12 + 2;
      if ((v12 + 2) >> 28)
        v14 = 5;
      else
        v14 = 4;
      if (v13 < 0x200000)
        v14 = 3;
      if (v13 < 0x4000)
        v14 = 2;
      if (v13 < 0x80)
        v14 = 1;
      v6 += v13 + v14;
    }
    v9 = 0;
    v4 = 1;
  }
  while ((v10 & 1) != 0);
  v15 = 8 * *(_DWORD *)(*((_QWORD *)a3 + 1) + 16);
  if (v15 >= 0x80)
  {
    if (v15 >= 0x4000)
    {
      if (v15 >= 0x200000)
      {
        v17 = v15 >> 28 == 0;
        v16 = 4;
        if (!v17)
          v16 = 5;
      }
      else
      {
        v16 = 3;
      }
    }
    else
    {
      v16 = 2;
    }
  }
  else
  {
    v16 = 1;
  }
  return v6 + v16 * v5;
}

- (void)writeToCodedOutputStream:(id)a3 asField:(id)a4
{
  char v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  id *values;
  char v11;
  char v12;

  v5 = 0;
  v6 = 0;
  v7 = *((_QWORD *)a4 + 1);
  v8 = *(unsigned __int8 *)(v7 + 30);
  v9 = (8 * *(_DWORD *)(v7 + 16)) | 2u;
  values = self->_values;
  v11 = 1;
  do
  {
    v12 = v11;
    if (values[v6])
    {
      objc_msgSend(a3, "writeInt32NoTag:", v9);
      objc_msgSend(a3, "writeInt32NoTag:", ComputeDictObjectFieldSize(values[v6], v8) + 2);
      objc_msgSend(a3, "writeBool:value:", 1, v5 & 1);
      WriteDictObjectField(a3, (uint64_t)values[v6], v8);
    }
    v11 = 0;
    v5 = 1;
    v6 = 1;
  }
  while ((v12 & 1) != 0);
}

- (void)addEntriesFromDictionary:(id)a3
{
  uint64_t v4;
  char *v5;
  id *values;
  char v7;
  char v8;
  TRIPBMessage *autocreator;

  if (a3)
  {
    v4 = 0;
    v5 = (char *)a3 + 16;
    values = self->_values;
    v7 = 1;
    do
    {
      v8 = v7;
      if (*(_QWORD *)&v5[8 * v4])
      {

        values[v4] = *(id *)&v5[8 * v4];
      }
      v7 = 0;
      v4 = 1;
    }
    while ((v8 & 1) != 0);
    autocreator = self->_autocreator;
    if (autocreator)
      TRIPBAutocreatedDictionaryModified(autocreator, (uint64_t)self);
  }
}

- (void)setObject:(id)a3 forKey:(BOOL)a4
{
  _BOOL4 v4;
  id *v7;
  TRIPBMessage *autocreator;

  v4 = a4;
  if (!a3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Attempting to add nil object to a Dictionary"));
  v7 = (id *)(&self->super.isa + v4);

  v7[2] = a3;
  autocreator = self->_autocreator;
  if (autocreator)
    TRIPBAutocreatedDictionaryModified(autocreator, (uint64_t)self);
}

- (void)removeObjectForKey:(BOOL)a3
{
  id *v3;

  v3 = (id *)(&self->super.isa + a3);

  v3[2] = 0;
}

- (void)removeAll
{

  self->_values[0] = 0;
  self->_values[1] = 0;
}

@end
