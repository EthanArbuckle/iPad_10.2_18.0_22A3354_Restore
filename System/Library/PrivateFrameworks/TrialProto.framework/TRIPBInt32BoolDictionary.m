@implementation TRIPBInt32BoolDictionary

- (TRIPBInt32BoolDictionary)init
{
  return -[TRIPBInt32BoolDictionary initWithBools:forKeys:count:](self, "initWithBools:forKeys:count:", 0, 0, 0);
}

- (TRIPBInt32BoolDictionary)initWithBools:(const BOOL *)a3 forKeys:(const int *)a4 count:(unint64_t)a5
{
  TRIPBInt32BoolDictionary *v8;
  NSMutableDictionary *dictionary;
  unsigned int v10;
  uint64_t v11;
  unsigned int v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)TRIPBInt32BoolDictionary;
  v8 = -[TRIPBInt32BoolDictionary init](&v14, sel_init);
  if (v8)
  {
    v8->_dictionary = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (a4)
    {
      if (a3 && a5)
      {
        do
        {
          dictionary = v8->_dictionary;
          v10 = *(unsigned __int8 *)a3++;
          v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
          v12 = *a4++;
          -[NSMutableDictionary setObject:forKey:](dictionary, "setObject:forKey:", v11, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v12));
          --a5;
        }
        while (a5);
      }
    }
  }
  return v8;
}

- (TRIPBInt32BoolDictionary)initWithDictionary:(id)a3
{
  TRIPBInt32BoolDictionary *v4;
  TRIPBInt32BoolDictionary *v5;

  v4 = -[TRIPBInt32BoolDictionary initWithBools:forKeys:count:](self, "initWithBools:forKeys:count:", 0, 0, 0);
  v5 = v4;
  if (a3 && v4)
    -[NSMutableDictionary addEntriesFromDictionary:](v4->_dictionary, "addEntriesFromDictionary:", *((_QWORD *)a3 + 2));
  return v5;
}

- (TRIPBInt32BoolDictionary)initWithCapacity:(unint64_t)a3
{
  return -[TRIPBInt32BoolDictionary initWithBools:forKeys:count:](self, "initWithBools:forKeys:count:", 0, 0, 0);
}

- (void)dealloc
{
  objc_super v3;

  if (self->_autocreator)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIPBDictionary.m"), 3955, CFSTR("%@: Autocreator must be cleared before release, autocreator: %@"), objc_opt_class(), self->_autocreator);

  v3.receiver = self;
  v3.super_class = (Class)TRIPBInt32BoolDictionary;
  -[TRIPBInt32BoolDictionary dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TRIPBInt32BoolDictionary initWithDictionary:](+[TRIPBInt32BoolDictionary allocWithZone:](TRIPBInt32BoolDictionary, "allocWithZone:", a3), "initWithDictionary:", self);
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return -[NSMutableDictionary isEqual:](self->_dictionary, "isEqual:", *((_QWORD *)a3 + 2));
  else
    return 0;
}

- (unint64_t)hash
{
  return -[NSMutableDictionary count](self->_dictionary, "count");
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p> { %@ }"), objc_opt_class(), self, self->_dictionary);
}

- (unint64_t)count
{
  return -[NSMutableDictionary count](self->_dictionary, "count");
}

- (void)enumerateKeysAndBoolsUsingBlock:(id)a3
{
  NSMutableDictionary *dictionary;
  void *v5;
  void *v6;
  char v7;

  v7 = 0;
  dictionary = self->_dictionary;
  v5 = (void *)-[NSMutableDictionary keyEnumerator](dictionary, "keyEnumerator");
  do
  {
    v6 = (void *)objc_msgSend(v5, "nextObject");
    if (!v6)
      break;
    (*((void (**)(id, uint64_t, uint64_t, char *))a3 + 2))(a3, objc_msgSend(v6, "intValue"), objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](dictionary, "objectForKeyedSubscript:", v6), "BOOLValue"), &v7);
  }
  while (!v7);
}

- (unint64_t)computeSerializedSizeAsField:(id)a3
{
  NSMutableDictionary *dictionary;
  unint64_t result;
  unsigned int v6;
  unsigned int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;

  dictionary = self->_dictionary;
  result = -[NSMutableDictionary count](dictionary, "count");
  if (result)
  {
    v21 = result;
    v6 = *(unsigned __int8 *)(*((_QWORD *)a3 + 1) + 30);
    v7 = objc_msgSend(a3, "mapKeyDataType");
    v8 = (void *)-[NSMutableDictionary keyEnumerator](dictionary, "keyEnumerator");
    v9 = objc_msgSend(v8, "nextObject");
    if (v9)
    {
      v10 = (void *)v9;
      v11 = 0;
      do
      {
        v12 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](dictionary, "objectForKeyedSubscript:", v10);
        v13 = ComputeDictInt32FieldSize(objc_msgSend(v10, "intValue"), 1, v7);
        objc_msgSend(v12, "BOOLValue");
        v14 = ComputeDictBoolFieldSize(2, v6);
        v15 = v14 + v13;
        if ((v14 + v13) >> 28)
          v16 = 5;
        else
          v16 = 4;
        if (v15 < 0x200000)
          v16 = 3;
        if (v15 < 0x4000)
          v16 = 2;
        if (v15 < 0x80)
          v16 = 1;
        v11 += v15 + v16;
        v10 = (void *)objc_msgSend(v8, "nextObject");
      }
      while (v10);
    }
    else
    {
      v11 = 0;
    }
    v17 = 8 * *(_DWORD *)(*((_QWORD *)a3 + 1) + 16);
    if (v17 >= 0x80)
    {
      v19 = v21;
      if (v17 >= 0x4000)
      {
        v20 = 4;
        if (v17 >> 28)
          v20 = 5;
        if (v17 >= 0x200000)
          v18 = v20;
        else
          v18 = 3;
      }
      else
      {
        v18 = 2;
      }
    }
    else
    {
      v18 = 1;
      v19 = v21;
    }
    return v11 + v18 * v19;
  }
  return result;
}

- (void)writeToCodedOutputStream:(id)a3 asField:(id)a4
{
  unsigned int v7;
  unsigned int v8;
  int v9;
  NSMutableDictionary *dictionary;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;

  v7 = *(unsigned __int8 *)(*((_QWORD *)a4 + 1) + 30);
  v8 = objc_msgSend(a4, "mapKeyDataType");
  v9 = *(_DWORD *)(*((_QWORD *)a4 + 1) + 16);
  dictionary = self->_dictionary;
  v11 = (void *)-[NSMutableDictionary keyEnumerator](dictionary, "keyEnumerator");
  v12 = objc_msgSend(v11, "nextObject");
  if (v12)
  {
    v13 = (void *)v12;
    v14 = (8 * v9) | 2u;
    do
    {
      v15 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](dictionary, "objectForKeyedSubscript:", v13);
      objc_msgSend(a3, "writeInt32NoTag:", v14);
      v16 = objc_msgSend(v13, "intValue");
      v17 = objc_msgSend(v15, "BOOLValue");
      v18 = ComputeDictInt32FieldSize(v16, 1, v8);
      objc_msgSend(a3, "writeInt32NoTag:", ComputeDictBoolFieldSize(2, v7) + v18);
      WriteDictInt32Field(a3, v16, 1, v8);
      WriteDictBoolField(a3, v17, 2, v7);
      v13 = (void *)objc_msgSend(v11, "nextObject");
    }
    while (v13);
  }
}

- (void)setTRIPBGenericValue:(id *)a3 forTRIPBGenericValueKey:(id *)a4
{
  NSMutableDictionary *dictionary;
  uint64_t v6;

  dictionary = self->_dictionary;
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3->var0);
  -[NSMutableDictionary setObject:forKey:](dictionary, "setObject:forKey:", v6, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a4->var3));
}

- (void)enumerateForTextFormat:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51__TRIPBInt32BoolDictionary_enumerateForTextFormat___block_invoke;
  v3[3] = &unk_1E2E9BD40;
  v3[4] = a3;
  -[TRIPBInt32BoolDictionary enumerateKeysAndBoolsUsingBlock:](self, "enumerateKeysAndBoolsUsingBlock:", v3);
}

uint64_t __51__TRIPBInt32BoolDictionary_enumerateForTextFormat___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4;
  uint64_t v5;
  const __CFString *v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), a2);
  if (a3)
    v6 = CFSTR("true");
  else
    v6 = CFSTR("false");
  return (*(uint64_t (**)(uint64_t, uint64_t, const __CFString *))(v4 + 16))(v4, v5, v6);
}

- (BOOL)getBool:(BOOL *)a3 forKey:(int)a4
{
  void *v5;
  void *v6;

  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)&a4));
  v6 = v5;
  if (a3 && v5)
    *a3 = objc_msgSend(v5, "BOOLValue");
  return v6 != 0;
}

- (void)addEntriesFromDictionary:(id)a3
{
  TRIPBMessage *autocreator;

  if (a3)
  {
    -[NSMutableDictionary addEntriesFromDictionary:](self->_dictionary, "addEntriesFromDictionary:", *((_QWORD *)a3 + 2));
    autocreator = self->_autocreator;
    if (autocreator)
      TRIPBAutocreatedDictionaryModified(autocreator, (uint64_t)self);
  }
}

- (void)setBool:(BOOL)a3 forKey:(int)a4
{
  uint64_t v4;
  NSMutableDictionary *dictionary;
  uint64_t v7;
  TRIPBMessage *autocreator;

  v4 = *(_QWORD *)&a4;
  dictionary = self->_dictionary;
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  -[NSMutableDictionary setObject:forKey:](dictionary, "setObject:forKey:", v7, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4));
  autocreator = self->_autocreator;
  if (autocreator)
    TRIPBAutocreatedDictionaryModified(autocreator, (uint64_t)self);
}

- (void)removeBoolForKey:(int)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_dictionary, "removeObjectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)&a3));
}

- (void)removeAll
{
  -[NSMutableDictionary removeAllObjects](self->_dictionary, "removeAllObjects");
}

@end
