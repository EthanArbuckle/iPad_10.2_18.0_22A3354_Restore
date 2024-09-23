@implementation VoiceDialNameDataSource

+ (id)_nameDataSourceByLanguageMap
{
  pthread_once(&_nameDataSourceByLanguageMap___createNameSourceMapOnce, _CreateNameDataSourceMap);
  return (id)__nameSourceMap;
}

+ (id)nameDataSourceForLanguageIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  Class v7;
  void *v8;
  void *v9;
  NSString *v10;
  objc_class *v11;
  id v12;

  v4 = a3;
  v5 = v4;
  if (v4 && (v6 = objc_msgSend(v4, "rangeOfString:", CFSTR("-")), v6 != 0x7FFFFFFFFFFFFFFFLL))
  {
    objc_msgSend(v5, "substringToIndex:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8
      && (objc_msgSend(a1, "_nameDataSourceByLanguageMap"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v9, "objectForKey:", v8),
          v10 = (NSString *)objc_claimAutoreleasedReturnValue(),
          v9,
          v10))
    {
      v7 = NSClassFromString(v10);

    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
    v8 = 0;
  }
  if (v7)
    v11 = v7;
  else
    v11 = (objc_class *)a1;
  v12 = objc_alloc_init(v11);

  return v12;
}

- (void)setUseCompositeNamesOnly:(BOOL)a3
{
  self->_compositeNamesOnly = a3;
}

- (BOOL)useCompositeNamesOnly
{
  return self->_compositeNamesOnly;
}

- (unint64_t)personNameCount
{
  return 4;
}

- (unint64_t)indexOfMainNameOfType:(int)a3
{
  if (a3 > 3)
    return 0x7FFFFFFFFFFFFFFFLL;
  else
    return qword_21DBEEA38[a3];
}

- (id)copyPronunciationPropertyForPerson:(void *)a3 withNameType:(int)a4
{
  ABPropertyID *v5;
  ABPropertyID *v6;
  ABPropertyID v7;
  id result;

  if (a4)
  {
    if (a4 != 1)
      return 0;
    v5 = (ABPropertyID *)MEMORY[0x24BE02810];
    v6 = (ABPropertyID *)MEMORY[0x24BE02818];
  }
  else
  {
    v5 = (ABPropertyID *)MEMORY[0x24BE02748];
    v6 = (ABPropertyID *)MEMORY[0x24BE02750];
  }
  v7 = *v5;
  if (*v6 == -1 || v7 == -1)
    return 0;
  result = (id)ABRecordCopyValue(a3, *v6);
  if (!result)
    return (id)ABRecordCopyValue(a3, v7);
  return result;
}

- (BOOL)getName:(id *)a3 phoneticName:(id *)a4 atIndex:(unint64_t)a5 forPerson:(void *)a6
{
  id *v9;
  void *v11;
  char v12;
  void *v13;
  ABPropertyID *v14;
  void *v15;
  char v16;
  CFMutableStringRef v17;

  if (!a6)
  {
    LOBYTE(v9) = 0;
    return (char)v9;
  }
  v9 = a3;
  if (a3)
  {
    *a3 = 0;
    switch(a5)
    {
      case 0uLL:
        v11 = a6;
        v12 = 0;
        goto LABEL_7;
      case 1uLL:
        v11 = a6;
        v12 = 9;
LABEL_7:
        v13 = VoiceDialPersonCopyCompositeName(v11, v12);
        goto LABEL_13;
      case 2uLL:
        if (-[VoiceDialNameDataSource useCompositeNamesOnly](self, "useCompositeNamesOnly")
          || VoiceDialPersonIsCompany(a6))
        {
          goto LABEL_14;
        }
        v14 = (ABPropertyID *)MEMORY[0x24BE02758];
LABEL_12:
        v13 = (void *)ABRecordCopyValue(a6, *v14);
LABEL_13:
        *v9 = v13;
LABEL_14:
        LOBYTE(v9) = *v9 != 0;
        break;
      case 3uLL:
        v14 = (ABPropertyID *)MEMORY[0x24BE02858];
        goto LABEL_12;
      default:
        goto LABEL_14;
    }
  }
  if (a4)
  {
    *a4 = 0;
    if (a5 == 2)
    {
      if (-[VoiceDialNameDataSource useCompositeNamesOnly](self, "useCompositeNamesOnly")
        || VoiceDialPersonIsCompany(a6))
      {
        goto LABEL_26;
      }
      v17 = -[VoiceDialNameDataSource copyPronunciationPropertyForPerson:withNameType:](self, "copyPronunciationPropertyForPerson:withNameType:", a6, 0);
    }
    else
    {
      if (a5 == 1)
      {
        v15 = a6;
        v16 = 15;
      }
      else
      {
        if (a5)
          goto LABEL_26;
        v15 = a6;
        v16 = 6;
      }
      v17 = VoiceDialPersonCopyCompositeName(v15, v16);
    }
    *a4 = v17;
LABEL_26:
    LOBYTE(v9) = (v9 & 1) != 0 || *a4 != 0;
  }
  return (char)v9;
}

- (BOOL)getNth:(unint64_t)a3 name:(id *)a4 phoneticName:(id *)a5 ofType:(int)a6 nameIndex:(unint64_t *)a7 forPerson:(void *)a8
{
  unint64_t v15;
  unint64_t v16;
  BOOL v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  BOOL v21;
  _BOOL4 v22;
  id *v24;

  v15 = -[VoiceDialNameDataSource indexOfMainNameOfType:](self, "indexOfMainNameOfType:", *(_QWORD *)&a6);
  v16 = v15;
  if (a7)
    *a7 = 0x7FFFFFFFFFFFFFFFLL;
  if (v15 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v17 = 0;
    if (!a3 && a6 == 1)
    {
      v17 = a4 != 0;
      if (a4)
        *a4 = (id)(id)ABRecordCopyValue(a8, *MEMORY[0x24BE02820]);
      if (a5)
      {
        v17 = 1;
        *a5 = -[VoiceDialNameDataSource copyPronunciationPropertyForPerson:withNameType:](self, "copyPronunciationPropertyForPerson:withNameType:", a8, 1);
      }
    }
  }
  else if (-[VoiceDialNameDataSource getName:phoneticName:atIndex:forPerson:](self, "getName:phoneticName:atIndex:forPerson:", a4, a5, v15, a8))
  {
    if (a7)
      *a7 = v16;
    return 1;
  }
  else
  {
    v18 = -[VoiceDialNameDataSource personNameCount](self, "personNameCount");
    if (v18)
    {
      v19 = v18;
      v24 = a5;
      v20 = 0;
      v21 = 0;
      do
      {
        if (v16 != v20 && -[VoiceDialNameDataSource typeOfNameAtIndex:](self, "typeOfNameAtIndex:", v20) == a6)
        {
          v22 = -[VoiceDialNameDataSource getName:phoneticName:atIndex:forPerson:](self, "getName:phoneticName:atIndex:forPerson:", a4, v24, v20, a8);
          v21 = v22;
          if (a7)
          {
            if (v22)
              *a7 = v20;
          }
        }
        ++v20;
        v17 = v21;
      }
      while (v20 < v19 && !v21);
    }
    else
    {
      return 0;
    }
  }
  return v17;
}

- (int)typeOfNameAtIndex:(unint64_t)a3
{
  if (a3 > 3)
    return -1;
  else
    return dword_21DBEEA60[a3];
}

- (unint64_t)nameTypes
{
  unint64_t v3;
  unint64_t v4;
  uint64_t i;
  int v6;

  if (!self->_nameTypeMask)
  {
    v3 = -[VoiceDialNameDataSource personNameCount](self, "personNameCount");
    if (v3)
    {
      v4 = v3;
      for (i = 0; i != v4; ++i)
      {
        v6 = -[VoiceDialNameDataSource typeOfNameAtIndex:](self, "typeOfNameAtIndex:", i);
        if (v6 != -1)
          self->_nameTypeMask |= 1 << v6;
      }
    }
  }
  return self->_nameTypeMask;
}

- (unint64_t)countOfNamesOfType:(int)a3
{
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;

  if ((-[VoiceDialNameDataSource nameTypes](self, "nameTypes") & (1 << a3)) == 0)
    return a3 == 1;
  v5 = -[VoiceDialNameDataSource personNameCount](self, "personNameCount");
  if (!v5)
    return 0;
  v6 = v5;
  v7 = 0;
  for (i = 0; i != v6; ++i)
  {
    if (-[VoiceDialNameDataSource typeOfNameAtIndex:](self, "typeOfNameAtIndex:", i) == a3)
      ++v7;
  }
  return v7;
}

- (int)matchingNameType:(id)a3 fromTypes:(unint64_t)a4 forPerson:(void *)a5
{
  id v6;
  unint64_t v7;
  unint64_t v8;
  char v9;
  void *v10;
  unint64_t v11;
  int v12;
  int v13;
  uint64_t v14;
  _BOOL4 v15;
  id v16;
  int v17;
  void *v19;
  void *v21;
  id v24;

  v6 = a3;
  v7 = -[VoiceDialNameDataSource personNameCount](self, "personNameCount");
  v21 = v6;
  if (v6)
  {
    v8 = v7;
    if (v7)
    {
      v9 = 0;
      v10 = 0;
      v11 = 1;
      do
      {
        v12 = -[VoiceDialNameDataSource typeOfNameAtIndex:](self, "typeOfNameAtIndex:", v11 - 1, v21);
        if (v12 == -1 || (v13 = v12, v14 = 1 << v12, (v14 & a4) == 0))
        {
          v17 = -1;
          v16 = v10;
        }
        else
        {
          v24 = v10;
          v15 = -[VoiceDialNameDataSource getName:phoneticName:atIndex:forPerson:](self, "getName:phoneticName:atIndex:forPerson:", &v24, 0, v11 - 1, a5);
          v16 = v24;

          v17 = -1;
          if (v15 && v16)
          {
            if (objc_msgSend(v16, "caseInsensitiveCompare:", v21))
              v17 = -1;
            else
              v17 = v13;
          }
          v9 |= v14;
        }
        if (v17 != -1)
          break;
        v10 = v16;
      }
      while (v11++ < v8);
    }
    else
    {
      v16 = 0;
      v9 = 0;
      v17 = -1;
    }
    if ((a4 & 2) != 0 && (v9 & 2) == 0 && (v17 == 3 || v17 == -1))
    {
      v19 = (void *)ABRecordCopyValue(a5, *MEMORY[0x24BE02820]);

      if (v19)
      {
        if (!objc_msgSend(v19, "caseInsensitiveCompare:", v21))
          v17 = 1;
        v16 = v19;
      }
      else
      {
        v16 = 0;
      }
    }
  }
  else
  {
    v16 = 0;
    v17 = -1;
  }

  return v17;
}

@end
