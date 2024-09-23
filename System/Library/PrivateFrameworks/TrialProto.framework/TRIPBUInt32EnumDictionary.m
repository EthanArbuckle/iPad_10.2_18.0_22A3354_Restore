@implementation TRIPBUInt32EnumDictionary

- (TRIPBUInt32EnumDictionary)init
{
  return -[TRIPBUInt32EnumDictionary initWithValidationFunction:rawValues:forKeys:count:](self, "initWithValidationFunction:rawValues:forKeys:count:", 0, 0, 0, 0);
}

- (TRIPBUInt32EnumDictionary)initWithValidationFunction:(void *)a3
{
  return -[TRIPBUInt32EnumDictionary initWithValidationFunction:rawValues:forKeys:count:](self, "initWithValidationFunction:rawValues:forKeys:count:", a3, 0, 0, 0);
}

- (TRIPBUInt32EnumDictionary)initWithValidationFunction:(void *)a3 rawValues:(const int *)a4 forKeys:(const unsigned int *)a5 count:(unint64_t)a6
{
  TRIPBUInt32EnumDictionary *v10;
  NSMutableDictionary *v11;
  void *v12;
  NSMutableDictionary *dictionary;
  unsigned int v14;
  uint64_t v15;
  unsigned int v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)TRIPBUInt32EnumDictionary;
  v10 = -[TRIPBUInt32EnumDictionary init](&v18, sel_init);
  if (v10)
  {
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v12 = DictDefault_IsValidValue;
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
        v15 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v14);
        v16 = *a5++;
        -[NSMutableDictionary setObject:forKey:](dictionary, "setObject:forKey:", v15, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v16));
        --a6;
      }
      while (a6);
    }
  }
  return v10;
}

- (TRIPBUInt32EnumDictionary)initWithDictionary:(id)a3
{
  TRIPBUInt32EnumDictionary *v4;
  TRIPBUInt32EnumDictionary *v5;

  v4 = -[TRIPBUInt32EnumDictionary initWithValidationFunction:rawValues:forKeys:count:](self, "initWithValidationFunction:rawValues:forKeys:count:", objc_msgSend(a3, "validationFunc"), 0, 0, 0);
  v5 = v4;
  if (a3 && v4)
    -[NSMutableDictionary addEntriesFromDictionary:](v4->_dictionary, "addEntriesFromDictionary:", *((_QWORD *)a3 + 2));
  return v5;
}

- (TRIPBUInt32EnumDictionary)initWithValidationFunction:(void *)a3 capacity:(unint64_t)a4
{
  return -[TRIPBUInt32EnumDictionary initWithValidationFunction:rawValues:forKeys:count:](self, "initWithValidationFunction:rawValues:forKeys:count:", a3, 0, 0, 0);
}

- (void)dealloc
{
  objc_super v3;

  if (self->_autocreator)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIPBDictionary.m"), 2769, CFSTR("%@: Autocreator must be cleared before release, autocreator: %@"), objc_opt_class(), self->_autocreator);

  v3.receiver = self;
  v3.super_class = (Class)TRIPBUInt32EnumDictionary;
  -[TRIPBUInt32EnumDictionary dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TRIPBUInt32EnumDictionary initWithDictionary:](+[TRIPBUInt32EnumDictionary allocWithZone:](TRIPBUInt32EnumDictionary, "allocWithZone:", a3), "initWithDictionary:", self);
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

- (void)enumerateKeysAndRawValuesUsingBlock:(id)a3
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
    (*((void (**)(id, uint64_t, uint64_t, char *))a3 + 2))(a3, objc_msgSend(v6, "unsignedIntValue"), objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](dictionary, "objectForKeyedSubscript:", v6), "intValue"), &v7);
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
        v13 = ComputeDictUInt32FieldSize(objc_msgSend(v10, "unsignedIntValue"), 1, v7);
        v14 = ComputeDictEnumFieldSize(objc_msgSend(v12, "intValue"), v6);
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
      v16 = objc_msgSend(v13, "unsignedIntValue");
      v17 = objc_msgSend(v15, "intValue");
      v18 = ComputeDictUInt32FieldSize(v16, 1, v8);
      objc_msgSend(a3, "writeInt32NoTag:", ComputeDictEnumFieldSize(v17, v7) + v18);
      WriteDictUInt32Field(a3, v16, 1, v8);
      WriteDictEnumField(a3, v17, v7);
      v13 = (void *)objc_msgSend(v11, "nextObject");
    }
    while (v13);
  }
}

- (id)serializedDataForUnknownValue:(int)a3 forKey:(id *)a4 keyDataType:(unsigned __int8)a5
{
  unsigned int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  TRIPBCodedOutputStream *v14;

  v5 = a5;
  v7 = *(_QWORD *)&a3;
  v8 = ComputeDictUInt32FieldSize(a4->var1, 1, a5);
  v9 = 2;
  v10 = 3;
  v11 = 4;
  v12 = 5;
  if (v7 >> 28)
    v12 = 6;
  if (v7 >= 0x200000)
    v11 = v12;
  if (v7 >= 0x4000)
    v10 = v11;
  if (v7 >= 0x80)
    v9 = v10;
  v13 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v9 + v8);
  v14 = -[TRIPBCodedOutputStream initWithData:]([TRIPBCodedOutputStream alloc], "initWithData:", v13);
  WriteDictUInt32Field(v14, a4->var3, 1, v5);
  -[TRIPBCodedOutputStream writeEnum:value:](v14, "writeEnum:value:", 2, v7);

  return v13;
}

- (void)setTRIPBGenericValue:(id *)a3 forTRIPBGenericValueKey:(id *)a4
{
  NSMutableDictionary *dictionary;
  uint64_t v6;

  dictionary = self->_dictionary;
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3->var3);
  -[NSMutableDictionary setObject:forKey:](dictionary, "setObject:forKey:", v6, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a4->var3));
}

- (void)enumerateForTextFormat:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __52__TRIPBUInt32EnumDictionary_enumerateForTextFormat___block_invoke;
  v3[3] = &unk_1E2E9BB88;
  v3[4] = a3;
  -[TRIPBUInt32EnumDictionary enumerateKeysAndRawValuesUsingBlock:](self, "enumerateKeysAndRawValuesUsingBlock:", v3);
}

uint64_t __52__TRIPBUInt32EnumDictionary_enumerateForTextFormat___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u"), a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v4, v5, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3));
}

- (BOOL)getEnum:(int *)a3 forKey:(unsigned int)a4
{
  void *v6;
  void *v7;
  int v8;
  int v9;

  v6 = (void *)-[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a4));
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

- (BOOL)getRawValue:(int *)a3 forKey:(unsigned int)a4
{
  void *v5;
  void *v6;

  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a4));
  v6 = v5;
  if (a3 && v5)
    *a3 = objc_msgSend(v5, "intValue");
  return v6 != 0;
}

- (void)enumerateKeysAndEnumsUsingBlock:(id)a3
{
  unsigned int (*validationFunc)(void);
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  char v10;

  v10 = 0;
  validationFunc = (unsigned int (*)(void))self->_validationFunc;
  v6 = (void *)-[NSMutableDictionary keyEnumerator](self->_dictionary, "keyEnumerator");
  do
  {
    v7 = objc_msgSend(v6, "nextObject");
    if (!v7)
      break;
    v8 = (void *)v7;
    LODWORD(v9) = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", v7), "intValue");
    v9 = validationFunc() ? v9 : 4222467823;
    (*((void (**)(id, uint64_t, uint64_t, char *))a3 + 2))(a3, objc_msgSend(v8, "unsignedIntValue"), v9, &v10);
  }
  while (!v10);
}

- (void)addRawEntriesFromDictionary:(id)a3
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

- (void)setRawValue:(int)a3 forKey:(unsigned int)a4
{
  uint64_t v4;
  NSMutableDictionary *dictionary;
  uint64_t v7;
  TRIPBMessage *autocreator;

  v4 = *(_QWORD *)&a4;
  dictionary = self->_dictionary;
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)&a3);
  -[NSMutableDictionary setObject:forKey:](dictionary, "setObject:forKey:", v7, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4));
  autocreator = self->_autocreator;
  if (autocreator)
    TRIPBAutocreatedDictionaryModified(autocreator, (uint64_t)self);
}

- (void)removeEnumForKey:(unsigned int)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_dictionary, "removeObjectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3));
}

- (void)removeAll
{
  -[NSMutableDictionary removeAllObjects](self->_dictionary, "removeAllObjects");
}

- (void)setEnum:(int)a3 forKey:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v5;
  NSMutableDictionary *dictionary;
  uint64_t v8;
  TRIPBMessage *autocreator;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  if ((((uint64_t (*)(_QWORD, SEL))self->_validationFunc)(*(_QWORD *)&a3, a2) & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("TRIPBUInt32EnumDictionary: Attempt to set an unknown enum value (%d)"), v5);
  dictionary = self->_dictionary;
  v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v5);
  -[NSMutableDictionary setObject:forKey:](dictionary, "setObject:forKey:", v8, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4));
  autocreator = self->_autocreator;
  if (autocreator)
    TRIPBAutocreatedDictionaryModified(autocreator, (uint64_t)self);
}

- (void)validationFunc
{
  return self->_validationFunc;
}

@end
