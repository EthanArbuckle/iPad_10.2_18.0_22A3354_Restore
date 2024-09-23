@implementation NSAttributeDictionary

- (id)objectForKey:(id)a3
{
  unint64_t numElements;
  unint64_t v6;
  value **p_key;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;

  numElements = self->numElements;
  if (numElements)
  {
    v6 = 0;
    p_key = &self->elements[0].key;
    while (*p_key != a3)
    {
      ++v6;
      p_key += 3;
      if (numElements == v6)
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    if (__NSNumberOfNormalizedKeys == 1)
    {
      v8 = 0;
      while ((id)normalizedKeyInfo[v8] != a3)
      {
        v8 += 2;
        if (v8 == 60)
          goto LABEL_9;
      }
      return 0;
    }
LABEL_9:
    if (!numElements)
      return 0;
    v9 = objc_msgSend(a3, "hash");
    v10 = v9 % self->numElements;
    v6 = v10;
    while (self->elements[v6].hash != v9 || (-[value isEqual:](self->elements[v6].key, "isEqual:", a3) & 1) == 0)
    {
      if (v6 + 1 == self->numElements)
        v6 = 0;
      else
        ++v6;
      if (v6 == v10)
        return 0;
    }
  }
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  return self->elements[v6].var0;
}

- (BOOL)isEqualToDictionary:(id)a3
{
  unint64_t numElements;
  Class Class;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __n128 v14;
  __n128 v15;
  __n128 v16;
  __n128 v17;
  double v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __n128 v28;
  __n128 v29;
  __n128 v30;
  __n128 v31;
  double v32;
  const void **v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t *p_numElements;
  unint64_t v38;
  const void *v39;
  const void **v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  id v45;
  uint64_t v46;
  unint64_t v47;
  _NSAttributeDictionaryElement *elements;
  unint64_t v49;
  value *v50;
  value **v51;
  uint64_t v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  id var0;
  unint64_t v57;
  id *p_var0;
  uint64_t v60;
  unint64_t *v61;
  char *v62;
  value **p_key;
  const void **v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  if (!a3)
    goto LABEL_60;
  if (object_getClass(a3) == (Class)attributeDictionaryClass)
  {
    LOBYTE(v46) = self == a3;
    return v46;
  }
  numElements = self->numElements;
  if (numElements != objc_msgSend(a3, "count"))
  {
LABEL_60:
    LOBYTE(v46) = 0;
    return v46;
  }
  Class = object_getClass(a3);
  v19 = self->numElements;
  if (Class == (Class)tempAttributeDictionaryClass)
  {
    if (!v19)
    {
LABEL_59:
      LOBYTE(v46) = 1;
      return v46;
    }
    v47 = 0;
    elements = self->elements;
    p_key = &self->elements[0].key;
    v64 = (const void **)((char *)a3 + 16);
    while (2)
    {
      v49 = 0;
      v50 = (value *)v64[3 * v47 + 1];
      v51 = p_key;
      while (*v51 != v50)
      {
        ++v49;
        v51 += 3;
        if (v19 == v49)
        {
          if (__NSNumberOfNormalizedKeys != 1)
          {
LABEL_39:
            v53 = objc_msgSend((id)v64[3 * v47 + 1], "hash");
            v54 = self->numElements;
            v55 = v53 % v54;
            v49 = v53 % v54;
            do
            {
              if (elements[v49].hash == v53)
              {
                if ((-[value isEqual:](elements[v49].key, "isEqual:", v50) & 1) != 0)
                  goto LABEL_48;
                v54 = self->numElements;
              }
              LOBYTE(v46) = 0;
              if (v49 + 1 == v54)
                v49 = 0;
              else
                ++v49;
            }
            while (v49 != v55);
            return v46;
          }
          v52 = 0;
          while ((value *)normalizedKeyInfo[v52] != v50)
          {
            v52 += 2;
            if (v52 == 60)
              goto LABEL_39;
          }
          goto LABEL_60;
        }
      }
LABEL_48:
      if (v49 == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_60;
      var0 = elements[v49].var0;
      if (var0 == v64[3 * v47 + 2] || (LODWORD(v46) = objc_msgSend(var0, "isEqual:"), (_DWORD)v46))
      {
        ++v47;
        v19 = self->numElements;
        LOBYTE(v46) = 1;
        if (v47 < v19)
          continue;
      }
      break;
    }
  }
  else
  {
    if (v19 < 8)
    {
      p_key = (value **)&v60;
      v20 = MEMORY[0x1E0C80A78](Class, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18);
      MEMORY[0x1E0C80A78](v20, (char *)&v60 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0), v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32);
      v64 = v33;
      v62 = (char *)&v60 - v34;
      CFDictionaryGetKeysAndValues((CFDictionaryRef)a3, v33, (const void **)((char *)&v60 - v34));
      v35 = self->numElements;
      if (v35)
      {
        v36 = 0;
        p_numElements = &self->numElements;
        v61 = &self->numElements;
        while (2)
        {
          v38 = 0;
          v39 = v64[v36];
          v40 = (const void **)(p_numElements + 2);
          while (*v40 != v39)
          {
            ++v38;
            v40 += 3;
            if (v35 == v38)
            {
              if (__NSNumberOfNormalizedKeys == 1)
              {
                v41 = 0;
                while ((const void *)normalizedKeyInfo[v41] != v39)
                {
                  v41 += 2;
                  if (v41 == 60)
                    goto LABEL_15;
                }
              }
              else
              {
LABEL_15:
                v42 = objc_msgSend((id)v64[v36], "hash");
                v43 = self->numElements;
                v44 = v42 % v43;
                v38 = v42 % v43;
                do
                {
                  if (self->elements[v38].hash == v42)
                  {
                    if ((-[value isEqual:](self->elements[v38].key, "isEqual:", v39) & 1) != 0)
                      goto LABEL_24;
                    v43 = self->numElements;
                  }
                  if (v38 + 1 == v43)
                    v38 = 0;
                  else
                    ++v38;
                }
                while (v38 != v44);
              }
              goto LABEL_60;
            }
          }
LABEL_24:
          if (v38 == 0x7FFFFFFFFFFFFFFFLL)
            goto LABEL_60;
          v45 = self->elements[v38].var0;
          if (v45 != *(id *)&v62[8 * v36] && !objc_msgSend(v45, "isEqual:"))
            goto LABEL_60;
          ++v36;
          v35 = self->numElements;
          p_numElements = v61;
          if (v36 < v35)
            continue;
          break;
        }
      }
      goto LABEL_59;
    }
    v57 = 0;
    p_var0 = &self->elements[0].var0;
    do
    {
      v46 = objc_msgSend(a3, "objectForKey:", *(p_var0 - 1));
      if (!v46)
        break;
      if (*p_var0 != (id)v46)
      {
        LODWORD(v46) = objc_msgSend(*p_var0, "isEqual:");
        if (!(_DWORD)v46)
          break;
      }
      ++v57;
      p_var0 += 3;
      LOBYTE(v46) = 1;
    }
    while (v57 < self->numElements);
  }
  return v46;
}

- (unint64_t)count
{
  return self->numElements;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  unint64_t numElements;
  id *p_var0;
  _QWORD *v6;
  _QWORD *v7;
  id v8;
  objc_super v9;
  _BYTE v10[320];
  _BYTE v11[320];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  numElements = self->numElements;
  if (numElements < 0x29)
  {
    if (numElements)
    {
      p_var0 = &self->elements[0].var0;
      v6 = v10;
      v7 = v11;
      do
      {
        *v7++ = *(p_var0 - 1);
        v8 = *p_var0;
        p_var0 += 3;
        *v6++ = v8;
        --numElements;
      }
      while (numElements);
    }
    return (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99E08], "allocWithZone:", a3), "initWithObjects:forKeys:count:", v10, v11, self->numElements);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)NSAttributeDictionary;
    return -[NSAttributeDictionary mutableCopyWithZone:](&v9, sel_mutableCopyWithZone_, a3);
  }
}

- (id)keyEnumerator
{
  return (id)objc_msgSend(objc_allocWithZone((Class)NSAttributeDictionaryEnumerator), "initWithAttributeDictionary:", self);
}

+ (id)emptyAttributeDictionary
{
  return (id)emptyAttributeDictionary;
}

- (void)getObjects:(id *)a3 andKeys:(id *)a4
{
  unint64_t v4;
  NSAttributeDictionary *v5;

  if (self->numElements)
  {
    v4 = 0;
    v5 = self;
    do
    {
      if (a3)
        *a3++ = v5->elements[0].var0;
      if (a4)
        *a4++ = v5->elements[0].key;
      ++v4;
      v5 = (NSAttributeDictionary *)((char *)v5 + 24);
    }
    while (v4 < self->numElements);
  }
}

- (void)dealloc
{
  unint64_t v3;
  id *p_var0;
  id v5;
  objc_super v6;

  if (self->numElements)
  {
    v3 = 0;
    p_var0 = &self->elements[0].var0;
    do
    {

      v5 = *p_var0;
      p_var0 += 3;

      ++v3;
    }
    while (v3 < self->numElements);
  }
  v6.receiver = self;
  v6.super_class = (Class)NSAttributeDictionary;
  -[NSAttributeDictionary dealloc](&v6, sel_dealloc);
}

- (void)__apply:(void *)a3 context:(void *)a4
{
  unint64_t numElements;
  uint64_t v7;
  id *p_var0;
  objc_super v9;

  if (a3)
  {
    numElements = self->numElements;
    if (numElements)
    {
      v7 = 24 * numElements;
      p_var0 = &self->elements[0].var0;
      do
      {
        ((void (*)(_QWORD, id, void *))a3)(*(p_var0 - 1), *p_var0, a4);
        p_var0 += 3;
        v7 -= 24;
      }
      while (v7);
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)NSAttributeDictionary;
    -[NSAttributeDictionary __apply:context:](&v9, sel___apply_context_, 0, a4);
  }
}

+ (void)initialize
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  void *v7;
  _QWORD v8[31];

  v8[30] = *MEMORY[0x1E0C80C00];
  if (!attributeDictionaryClass)
  {
    v2 = objc_opt_class();
    if (v2 == objc_opt_class())
    {
      attributeDictionaryClass = objc_opt_class();
      tempAttributeDictionaryClass = objc_opt_class();
      v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3870], "pointerFunctionsWithOptions:", 5);
      objc_msgSend(v3, "setIsEqualFunction:", attributeDictionaryIsEqual);
      objc_msgSend(v3, "setDescriptionFunction:", attributeDictionaryDescribe);
      objc_msgSend(v3, "setHashFunction:", attributeDictionaryHash);
      v4 = 0;
      v8[0] = CFSTR("NSFont");
      v8[1] = CFSTR("NSParagraphStyle");
      v8[2] = CFSTR("NSOriginalFont");
      v8[3] = NSGlyphInfoAttributeName;
      v8[4] = CFSTR("NSStrikethrough");
      v8[5] = CFSTR("NSUnderline");
      v8[6] = CFSTR("CTVerticalForms");
      v8[7] = CFSTR("NSLigature");
      v8[8] = CFSTR("NSKern");
      v8[9] = NSLanguageAttributeName;
      v8[10] = CFSTR("NSStrokeColor");
      v8[11] = CFSTR("NSBackgroundColor");
      v8[12] = CFSTR("NSShadow");
      v8[13] = CFSTR("NSColor");
      v8[14] = CFSTR("NSStrikethroughColor");
      v8[15] = CFSTR("NSUnderlineColor");
      v8[16] = CFSTR("NSAttachment");
      v8[17] = CFSTR("NSBaselineOffset");
      v8[18] = CFSTR("NSExpansion");
      v8[19] = CFSTR("NSWritingDirection");
      v5 = *MEMORY[0x1E0CA8550];
      v8[20] = CFSTR("NSSuperScript");
      v8[21] = v5;
      v8[22] = CFSTR("NSStrokeWidth");
      v8[23] = CFSTR("NSObliqueness");
      v8[24] = CFSTR("NSTextEffect");
      v8[25] = NSTemporaryTextCorrectionAttributeName;
      v8[26] = CFSTR("NSLink");
      v8[27] = CFSTR("NSTextAlternativesDisplayStyle");
      __NSNumberOfNormalizedKeys = 1;
      v6 = &qword_1ECDC1EF0;
      v8[28] = CFSTR("NSTextAlternatives");
      v8[29] = CFSTR("NSMarkedTextStyleAttributeName");
      do
      {
        v7 = (void *)v8[v4];
        *(v6 - 1) = (uint64_t)v7;
        *v6 = objc_msgSend(v7, "hash");
        v6 += 2;
        ++v4;
      }
      while (v4 != 30);
      attributeDictionaryTable = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithPointerFunctions:capacity:", v3, 0);
      emptyAttributeDictionary = +[NSAttributeDictionary newWithDictionary:](NSAttributeDictionary, "newWithDictionary:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionary"));
    }
  }
}

+ (id)newWithDictionary:(id)a3
{
  id v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  unint64_t v7;
  _BYTE *v8;
  _BYTE *v9;
  objc_class *v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t i;
  _BYTE *v16;
  _QWORD *v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t *v20;
  char v21;
  id v22;
  unint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  _BYTE *v33;
  _BYTE v34[1024];
  _BYTE v35[1024];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (a3)
    v3 = a3;
  else
    v3 = (id)emptyAttributeDictionary;
  v31 = v3;
  if (v3 && object_getClass(v3) == (Class)attributeDictionaryClass)
    return v31;
  os_unfair_lock_lock_with_options();
  v4 = (_QWORD *)objc_msgSend((id)attributeDictionaryTable, "member:", v31);
  if (v4)
  {
    v5 = v4;
    v6 = v4;
LABEL_8:
    os_unfair_lock_unlock((os_unfair_lock_t)&attributeDictionaryLock);
    return v5;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&attributeDictionaryLock);
  v7 = objc_msgSend(v31, "count");
  if (v7 >= 0x81)
  {
    v9 = NSZoneMalloc(0, 8 * v7);
    v8 = NSZoneMalloc(0, 8 * v7);
  }
  else
  {
    v8 = v34;
    v9 = v35;
  }
  objc_msgSend(v31, "getObjects:andKeys:count:", v8, v9, v7, v31);
  v11 = (objc_class *)objc_opt_class();
  v12 = v7 - 1;
  if (!v7)
    v12 = 0;
  v5 = NSAllocateObject(v11, 24 * v12, 0);
  v5[1] = v7;
  if (!v7)
    goto LABEL_40;
  v13 = 0;
  v33 = v9;
  do
  {
    v14 = *(void **)&v9[8 * v13];
    if (__NSNumberOfNormalizedKeys == 1)
    {
      for (i = 0; i != 60; i += 2)
      {
        if ((void *)normalizedKeyInfo[i] == v14)
        {
          v18 = normalizedKeyInfo[i + 1];
          v22 = v14;
          goto LABEL_32;
        }
      }
    }
    v16 = v8;
    v17 = v5;
    v18 = objc_msgSend(v14, "hash");
    if (__NSNumberOfNormalizedKeys != 1)
    {
LABEL_29:
      v22 = (id)objc_msgSend(v14, "copyWithZone:", 0);
      goto LABEL_30;
    }
    v19 = 0;
    v20 = normalizedKeyInfo;
    while (v18 != v20[1])
    {
      v21 = 1;
LABEL_27:
      if (v19 <= 0x1C)
      {
        ++v19;
        v20 += 2;
        if ((v21 & 1) != 0)
          continue;
      }
      goto LABEL_29;
    }
    if ((objc_msgSend((id)*v20, "isEqual:", v14) & 1) == 0)
    {
      v21 = __NSNumberOfNormalizedKeys;
      goto LABEL_27;
    }
    v22 = (id)*v20;
LABEL_30:
    v5 = v17;
    v8 = v16;
    v9 = v33;
LABEL_32:
    *(_QWORD *)&v9[8 * v13] = v22;
    v23 = v18 % v7;
    v24 = v5 + 2;
    while (1)
    {
      v25 = &v24[3 * v23];
      v27 = v25[1];
      v26 = v25 + 1;
      if (!v27)
        break;
      if (v23 + 1 == v7)
        v23 = 0;
      else
        ++v23;
    }
    v24[3 * v23] = v18;
    *v26 = *(_QWORD *)&v9[8 * v13];
    v5[3 * v23 + 4] = *(id *)&v8[8 * v13++];
  }
  while (v13 != v7);
LABEL_40:
  if (v9 != v35)
    NSZoneFree(0, v9);
  if (v8 != v34)
    NSZoneFree(0, v8);
  os_unfair_lock_lock_with_options();
  v28 = (void *)objc_msgSend((id)attributeDictionaryTable, "member:", v32);
  if (!v28)
  {
    objc_msgSend((id)attributeDictionaryTable, "addObject:", v5);
    goto LABEL_8;
  }
  v29 = v28;
  v30 = v28;
  os_unfair_lock_unlock((os_unfair_lock_t)&attributeDictionaryLock);
  objc_msgSend(v5, "dealloc");
  return v29;
}

- (id)newWithKey:(id)a3 object:(id)a4
{
  value *v5;
  uint64_t i;
  uint64_t v7;
  unint64_t v8;
  uint64_t *v9;
  char v10;
  unint64_t numElements;
  uint64_t v12;
  value **p_key;
  uint64_t v14;
  unint64_t v15;
  NSAttributeDictionary *v16;
  unint64_t v17;
  unint64_t v18;
  int v19;
  id var0;
  objc_class *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  void *v27;
  id v28;
  objc_class *v29;
  char *v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  char *v36;
  _QWORD *v37;
  uint64_t v38;
  char *v39;
  void *v40;
  id v41;
  id v42;
  NSAttributeDictionary *v43;

  v5 = (value *)a3;
  v43 = self;
  if (__NSNumberOfNormalizedKeys == 1)
  {
    for (i = 0; i != 60; i += 2)
    {
      if ((id)normalizedKeyInfo[i] == a3)
      {
        v7 = normalizedKeyInfo[i + 1];
        goto LABEL_17;
      }
    }
  }
  v7 = objc_msgSend(a3, "hash");
  if (__NSNumberOfNormalizedKeys != 1)
    goto LABEL_16;
  v8 = 0;
  v9 = normalizedKeyInfo;
  self = v43;
  while (v7 != v9[1])
  {
    v10 = 1;
LABEL_11:
    if (v8 <= 0x1C)
    {
      ++v8;
      v9 += 2;
      if ((v10 & 1) != 0)
        continue;
    }
    goto LABEL_17;
  }
  if ((objc_msgSend((id)*v9, "isEqual:", v5) & 1) == 0)
  {
    v10 = __NSNumberOfNormalizedKeys;
    self = v43;
    goto LABEL_11;
  }
  v5 = (value *)*v9;
LABEL_16:
  self = v43;
LABEL_17:
  numElements = self->numElements;
  if (numElements)
  {
    v12 = 0;
    p_key = &self->elements[0].key;
    do
    {
      if (*p_key == v5)
        goto LABEL_37;
      ++v12;
      p_key += 3;
    }
    while (numElements != v12);
  }
  if (__NSNumberOfNormalizedKeys == 1)
  {
    v14 = 0;
    while ((value *)normalizedKeyInfo[v14] != v5)
    {
      v14 += 2;
      if (v14 == 60)
        goto LABEL_25;
    }
LABEL_35:
    v18 = numElements + 1;
    v12 = 0x7FFFFFFFFFFFFFFFLL;
    v19 = 1;
    goto LABEL_46;
  }
LABEL_25:
  if (!numElements)
    goto LABEL_35;
  v42 = a4;
  v15 = -[value hash](v5, "hash");
  v16 = v43;
  v17 = v15 % v43->numElements;
  v12 = v17;
  while (2)
  {
    if (v16->elements[v12].hash != v15)
    {
LABEL_30:
      if (v12 + 1 == v16->numElements)
        v12 = 0;
      else
        ++v12;
      if (v12 == v17)
      {
        numElements = v16->numElements;
        a4 = v42;
        goto LABEL_35;
      }
      continue;
    }
    break;
  }
  if ((-[value isEqual:](v16->elements[v12].key, "isEqual:", v5) & 1) == 0)
  {
    v16 = v43;
    goto LABEL_30;
  }
  a4 = v42;
  self = v43;
  numElements = v43->numElements;
LABEL_37:
  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
    v18 = numElements + 1;
  else
    v18 = numElements;
  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v19 = 1;
    v12 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_46;
  }
  var0 = self->elements[v12].var0;
  if (var0 == a4 || objc_msgSend(var0, "isEqual:", a4))
    return v43;
  v19 = 0;
LABEL_46:
  os_unfair_lock_lock((os_unfair_lock_t)&newWithKey_object__tempDictLock);
  if (v18 <= newWithKey_object__tempDictNumElements)
  {
    v23 = (_QWORD *)newWithKey_object__tempDict;
    if (!newWithKey_object__tempDict)
      goto LABEL_55;
    goto LABEL_52;
  }
  newWithKey_object__tempDictNumElements = v18;
  if (newWithKey_object__tempDict)
    NSDeallocateObject((id)newWithKey_object__tempDict);
  v22 = (objc_class *)objc_opt_class();
  v23 = NSAllocateObject(v22, 24 * newWithKey_object__tempDictNumElements - 24, 0);
  newWithKey_object__tempDict = (uint64_t)v23;
  if (v23)
  {
LABEL_52:
    v23[1] = v18;
    memmove(v23 + 2, v43->elements, 24 * v43->numElements);
    v24 = newWithKey_object__tempDict + 16;
    if (v19)
    {
      v12 = v18 - 1;
      v25 = (uint64_t *)(v24 + 24 * (v18 - 1));
      *v25 = v7;
      v25[1] = (uint64_t)v5;
    }
    *(_QWORD *)(v24 + 24 * v12 + 16) = a4;
  }
LABEL_55:
  os_unfair_lock_lock_with_options();
  v26 = objc_msgSend((id)attributeDictionaryTable, "member:", newWithKey_object__tempDict);
  if (v26)
  {
    v27 = (void *)v26;
    os_unfair_lock_unlock((os_unfair_lock_t)&newWithKey_object__tempDictLock);
    v28 = v27;
    goto LABEL_57;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&attributeDictionaryLock);
  v29 = (objc_class *)objc_opt_class();
  v30 = (char *)NSAllocateObject(v29, 24 * v18 - 24, 0);
  v27 = v30;
  *((_QWORD *)v30 + 1) = v18;
  if (v18)
  {
    v31 = 0;
    v32 = v30 + 16;
    do
    {
      v33 = newWithKey_object__tempDict + 16;
      v34 = *(_QWORD *)(newWithKey_object__tempDict + 16 + 24 * v31);
      v35 = v34 % v18;
      while (1)
      {
        v36 = &v32[24 * v35];
        v38 = *((_QWORD *)v36 + 1);
        v37 = v36 + 8;
        if (!v38)
          break;
        if (v35 + 1 == v18)
          v35 = 0;
        else
          ++v35;
      }
      v39 = &v32[24 * v35];
      *(_QWORD *)v39 = v34;
      *v37 = objc_msgSend(*(id *)(v33 + 24 * v31 + 8), "copyWithZone:", 0);
      *((_QWORD *)v39 + 2) = *(id *)(newWithKey_object__tempDict + 16 + 24 * v31++ + 16);
    }
    while (v31 != v18);
  }
  os_unfair_lock_lock_with_options();
  v40 = (void *)objc_msgSend((id)attributeDictionaryTable, "member:", newWithKey_object__tempDict);
  os_unfair_lock_unlock((os_unfair_lock_t)&newWithKey_object__tempDictLock);
  if (v40)
  {
    v41 = v40;
    os_unfair_lock_unlock((os_unfair_lock_t)&attributeDictionaryLock);
    objc_msgSend(v27, "dealloc");
    return v40;
  }
  else
  {
    objc_msgSend((id)attributeDictionaryTable, "addObject:", v27);
LABEL_57:
    os_unfair_lock_unlock((os_unfair_lock_t)&attributeDictionaryLock);
  }
  return v27;
}

@end
