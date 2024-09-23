@implementation TCEnumerationMap

- (TCEnumerationMap)initWithStructs:(const TCEnumerationStruct *)a3 count:(int)a4
{
  return -[TCEnumerationMap initWithStructs:count:caseSensitive:](self, "initWithStructs:count:caseSensitive:", a3, *(_QWORD *)&a4, 0);
}

- (TCEnumerationMap)initWithStructs:(const TCEnumerationStruct *)a3 count:(int)a4 caseSensitive:(BOOL)a5
{
  TCEnumerationMap *v8;
  uint64_t v9;
  id *p_var1;
  int v11;
  const void *v12;
  id v13;
  const void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)TCEnumerationMap;
  v8 = -[TCEnumerationMap init](&v16, sel_init);
  if (v8)
  {
    v8->m_valueToString = CFDictionaryCreateMutable(0, a4, 0, MEMORY[0x24BDBD6B0]);
    v8->m_stringToValue = CFDictionaryCreateMutable(0, a4, MEMORY[0x24BDBD2A8], 0);
    v8->m_caseSensitive = a5;
    if (a4 >= 1)
    {
      v9 = a4;
      p_var1 = &a3->var1;
      do
      {
        v11 = *((_DWORD *)p_var1 - 2);
        v13 = *p_var1;
        p_var1 += 2;
        v12 = v13;
        if (!v11)
          v11 = -130883970;
        v14 = (const void *)v11;
        CFDictionaryAddValue(v8->m_valueToString, (const void *)v11, v12);
        CFDictionaryAddValue(v8->m_stringToValue, v12, v14);
        --v9;
      }
      while (v9);
    }
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->m_valueToString);
  CFRelease(self->m_stringToValue);
  self->m_valueToString = 0;
  self->m_stringToValue = 0;
  v3.receiver = self;
  v3.super_class = (Class)TCEnumerationMap;
  -[TCEnumerationMap dealloc](&v3, sel_dealloc);
}

- (int64_t)valueForString:(id)a3
{
  int64_t v3;
  __CFDictionary *m_stringToValue;
  __CFDictionary *v5;
  id v6;
  const void *Value;
  int64_t v8;

  v3 = -130883970;
  if (a3)
  {
    m_stringToValue = self->m_stringToValue;
    if (self->m_caseSensitive)
    {
      v5 = self->m_stringToValue;
      v6 = a3;
    }
    else
    {
      v6 = (id)objc_msgSend(a3, "lowercaseString");
      v5 = m_stringToValue;
    }
    Value = CFDictionaryGetValue(v5, v6);
    if (Value == (const void *)-130883970)
      v8 = 0;
    else
      v8 = (int64_t)Value;
    if (Value)
      return v8;
  }
  return v3;
}

- (id)stringForValue:(int)a3
{
  int v3;

  if (a3)
    v3 = a3;
  else
    v3 = -130883970;
  return (id)CFDictionaryGetValue(self->m_valueToString, (const void *)v3);
}

- (void)enumerateValuesAndStringsUsingBlock:(id)a3
{
  CFDictionaryApplyFunction(self->m_valueToString, (CFDictionaryApplierFunction)TCEnumerationMapApplier, a3);
}

@end
