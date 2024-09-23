@implementation MecabraWordProperties

+ (__IDXIndex)informationDictionaryAtPath:(__CFURL *)a3
{
  __IDXIndex *v3;
  __IDXIndex *v4;

  if (!a3)
    return 0;
  v3 = (__IDXIndex *)sub_20B8A205C(0, a3, 0);
  v4 = v3;
  if (v3)
    sub_20B8A22DC((uint64_t)v3, (const __CFArray *)&unk_24C4B8E68);
  return v4;
}

+ (__IDXIndex)characterInformationDictionary
{
  if (qword_25472B950 != -1)
    dispatch_once(&qword_25472B950, &unk_24C46CE10);
  return (__IDXIndex *)qword_25472B948;
}

+ (__IDXIndex)codeLookupInformationDictionary
{
  if (qword_25472B960 != -1)
    dispatch_once(&qword_25472B960, &unk_24C49D4F8);
  return (__IDXIndex *)qword_25472B958;
}

+ (id)searchResultsForString:(id)a3 dictionary:(__IDXIndex *)a4
{
  const char *v5;
  id v6;
  const char *v7;
  id v8;
  _QWORD v10[3];
  _QWORD v11[2];
  uint64_t v12;
  uint64_t v13;
  uint64_t v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  if (!a4)
    return 0;
  if (sub_20B8A2260((uint64_t)a4, (const __CFString *)a3, (uint64_t)CFSTR("IDXExactMatch"))
    && (v14[0] = 0,
        v11[0] = 0,
        v11[1] = 0,
        v12 = 0,
        (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, uint64_t *, uint64_t *))(**((_QWORD **)a4 + 2) + 72))(*((_QWORD *)a4 + 2), *((_QWORD *)a4 + 5), 1, v14, &v13) >= 1))
  {
    sub_20B8A25B4((uint64_t)a4, v14[0], v13, v11, v10);
    v6 = objc_alloc(MEMORY[0x24BDD17C8]);
    v8 = (id)objc_msgSend_initWithBytes_length_encoding_(v6, v7, v12, v10[2], 4);
  }
  else
  {
    v8 = 0;
  }
  return (id)objc_msgSend_componentsSeparatedByString_(v8, v5, (uint64_t)CFSTR(";"));
}

+ (id)sortedRadicalList
{
  if (qword_25472B970 != -1)
    dispatch_once(&qword_25472B970, &unk_24C49D518);
  return (id)qword_25472B968;
}

- (NSArray)characterInformation
{
  uint64_t v2;
  NSArray *result;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t Character;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;

  result = self->_characterInformation;
  if (!result)
  {
    v5 = (void *)objc_msgSend_analysisString(self, a2, v2);
    Character = objc_msgSend_firstCharacter(v5, v6, v7);
    v11 = objc_msgSend_characterInformationDictionary(MecabraWordProperties, v9, v10);
    result = (NSArray *)(id)objc_msgSend_searchResultsForString_dictionary_(MecabraWordProperties, v12, Character, v11);
    self->_characterInformation = result;
  }
  return result;
}

- (NSArray)codeLookupInformation
{
  uint64_t v2;
  NSArray *result;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;

  result = self->_codeLookupInformation;
  if (!result)
  {
    v5 = objc_msgSend_analysisString(self, a2, v2);
    v8 = objc_msgSend_codeLookupInformationDictionary(MecabraWordProperties, v6, v7);
    result = (NSArray *)(id)objc_msgSend_searchResultsForString_dictionary_(MecabraWordProperties, v9, v5, v8);
    self->_codeLookupInformation = result;
  }
  return result;
}

- (id)radicalInformationForString:(id)a3
{
  uint64_t v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;

  v4 = objc_msgSend_language(self, a2, (uint64_t)a3);
  v6 = (void *)objc_msgSend_componentsByLanguage_(a3, v5, v4);
  return (id)objc_msgSend_firstObject(v6, v7, v8);
}

- (id)strokeInformationForString:(id)a3
{
  void *v4;
  uint64_t v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *Object;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = objc_msgSend_language(self, a2, (uint64_t)a3);
  v7 = (void *)objc_msgSend_componentsByLanguage_(a3, v6, v5);
  Object = (void *)objc_msgSend_firstObject(v7, v8, v9);
  v13 = objc_msgSend_integerValue(Object, v11, v12);
  return (id)objc_msgSend_numberWithInteger_(v4, v14, v13);
}

- (id)pinyinInformationForString:(id)a3
{
  uint64_t v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = objc_msgSend_language(self, a2, (uint64_t)a3);
  v6 = (void *)objc_msgSend_componentsByLanguage_(a3, v5, v4);
  v9 = (void *)objc_msgSend_array(MEMORY[0x24BDBCEB8], v7, v8);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v10, (uint64_t)&v20, v24, 16);
  if (v11)
  {
    v14 = v11;
    v15 = *(_QWORD *)v21;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v6);
        v17 = objc_msgSend_pinyinStringFromPinyinWithToneNumber(*(void **)(*((_QWORD *)&v20 + 1) + 8 * v16), v12, v13);
        objc_msgSend_addObject_(v9, v18, v17);
        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v12, (uint64_t)&v20, v24, 16);
    }
    while (v14);
  }
  return v9;
}

- (id)zhuyinInformationForString:(id)a3
{
  uint64_t v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = objc_msgSend_language(self, a2, (uint64_t)a3);
  v6 = (void *)objc_msgSend_componentsByLanguage_(a3, v5, v4);
  v9 = (void *)objc_msgSend_array(MEMORY[0x24BDBCEB8], v7, v8);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v10, (uint64_t)&v19, v23, 16);
  if (v11)
  {
    v14 = v11;
    v15 = *(_QWORD *)v20;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v6);
        v17 = objc_msgSend_zhuyinSyllableFromPinyinSyllable(*(void **)(*((_QWORD *)&v19 + 1) + 8 * v16), v12, v13);
        if (v17)
          objc_msgSend_addObject_(v9, v12, v17);
        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v12, (uint64_t)&v19, v23, 16);
    }
    while (v14);
  }
  return v9;
}

- (id)initialsForStrings:(id)a3
{
  void *v4;
  uint64_t v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDBCEF0];
  v5 = objc_msgSend_count(a3, a2, (uint64_t)a3);
  v7 = (void *)objc_msgSend_setWithCapacity_(v4, v6, v5);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v8, (uint64_t)&v26, v30, 16);
  if (v9)
  {
    v12 = v9;
    v13 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(a3);
        v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        if (objc_msgSend_length(v15, v10, v11))
        {
          v16 = objc_msgSend_rangeOfComposedCharacterSequenceAtIndex_(v15, v10, 0);
          v18 = (void *)objc_msgSend_substringWithRange_(v15, v17, v16, v17);
          v21 = (void *)objc_msgSend_stringByStrippingDiacritics(v18, v19, v20);
          v24 = objc_msgSend_uppercaseString(v21, v22, v23);
          if (v24)
            objc_msgSend_addObject_(v7, v10, v24);
        }
      }
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v10, (uint64_t)&v26, v30, 16);
    }
    while (v12);
  }
  return (id)objc_msgSend_allObjects(v7, v10, v11);
}

- (id)tonesForString:(id)a3
{
  void *v3;
  const char *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend_componentsSeparatedByString_(a3, a2, (uint64_t)CFSTR(" "));
  v5 = (void *)objc_msgSend_setWithCapacity_(MEMORY[0x24BDBCEF0], v4, 5);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v15, v19, 16);
  if (v7)
  {
    v10 = v7;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v3);
        v13 = objc_msgSend_toneFromPinyinSyllableWithNumber(*(void **)(*((_QWORD *)&v15 + 1) + 8 * v12), v8, v9);
        if (v13)
          objc_msgSend_addObject_(v5, v8, v13);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v8, (uint64_t)&v15, v19, 16);
    }
    while (v10);
  }
  return (id)objc_msgSend_allObjects(v5, v8, v9);
}

- (id)separatedInputCodesForString:(id)a3
{
  uint64_t v4;
  const char *v5;

  v4 = objc_msgSend_language(self, a2, (uint64_t)a3);
  return (id)objc_msgSend_componentsByLanguage_(a3, v5, v4);
}

- (MecabraWordProperties)initWithString:(id)a3 language:(int)a4
{
  const char *v6;
  uint64_t v7;
  MecabraWordProperties *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MecabraWordProperties;
  v8 = -[MecabraWordProperties init](&v10, sel_init);
  if (v8)
  {
    v8->_analysisString = (NSString *)objc_msgSend_copy(a3, v6, v7);
    v8->_language = a4;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MecabraWordProperties;
  -[MecabraWordProperties dealloc](&v3, sel_dealloc);
}

- (id)wubixingCodes
{
  void *v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *InputKeyFromASCIIString;
  const char *v12;
  const char *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend_wubixingCodesForStandard_(self, a2, 0);
  v5 = (void *)objc_msgSend_array(MEMORY[0x24BDBCEB8], v3, v4);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v6, (uint64_t)&v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v2);
        InputKeyFromASCIIString = MecabraInputKeyPropertiesCreateInputKeyFromASCIIString(0xAu, *(void **)(*((_QWORD *)&v15 + 1) + 8 * v10));
        objc_msgSend_addObject_(v5, v12, (uint64_t)InputKeyFromASCIIString);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v13, (uint64_t)&v15, v19, 16);
    }
    while (v8);
  }
  return v5;
}

- (id)bihuaCodes
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_msgSend_codeLookupInformation(self, a2, v2);
  v6 = objc_msgSend_objectAtIndex_(v4, v5, 1);
  v8 = (void *)objc_msgSend_separatedInputCodesForString_(self, v7, v6);
  v11 = (void *)objc_msgSend_array(MEMORY[0x24BDBCEB8], v9, v10);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v12, (uint64_t)&v22, v26, 16);
  if (v13)
  {
    v16 = v13;
    v17 = *(_QWORD *)v23;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(v8);
        v19 = objc_msgSend_strokeStringFromNumberString(*(void **)(*((_QWORD *)&v22 + 1) + 8 * v18), v14, v15);
        objc_msgSend_addObject_(v11, v20, v19);
        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v14, (uint64_t)&v22, v26, 16);
    }
    while (v16);
  }
  return v11;
}

- (id)cangjieCodes
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *InputKeyFromASCIIString;
  const char *v18;
  const char *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_msgSend_codeLookupInformation(self, a2, v2);
  v6 = objc_msgSend_objectAtIndex_(v4, v5, 2);
  v8 = (void *)objc_msgSend_separatedInputCodesForString_(self, v7, v6);
  v11 = (void *)objc_msgSend_array(MEMORY[0x24BDBCEB8], v9, v10);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v12, (uint64_t)&v21, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v22;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v8);
        InputKeyFromASCIIString = MecabraInputKeyPropertiesCreateInputKeyFromASCIIString(9u, *(void **)(*((_QWORD *)&v21 + 1) + 8 * v16));
        objc_msgSend_addObject_(v11, v18, (uint64_t)InputKeyFromASCIIString);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v19, (uint64_t)&v21, v25, 16);
    }
    while (v14);
  }
  return v11;
}

- (id)isIncludedInCurrentLanguage
{
  uint64_t v2;
  int v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  int v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  int v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;

  v4 = objc_msgSend_language(self, a2, v2);
  v7 = (void *)MEMORY[0x24BDBD1C8];
  if (v4 == 2)
  {
    v22 = (void *)objc_msgSend_characterInformation(self, v5, v6);
    v24 = (void *)objc_msgSend_objectAtIndex_(v22, v23, 3);
    v21 = objc_msgSend_BOOLValue(v24, v25, v26);
    v29 = (void *)objc_msgSend_characterInformation(self, v27, v28);
    v31 = (void *)objc_msgSend_objectAtIndex_(v29, v30, 4);
    v13 = objc_msgSend_BOOLValue(v31, v32, v33);
  }
  else
  {
    if (v4 != 1)
      return v7;
    v8 = (void *)objc_msgSend_characterInformation(self, v5, v6);
    v10 = (void *)objc_msgSend_objectAtIndex_(v8, v9, 3);
    v13 = objc_msgSend_BOOLValue(v10, v11, v12);
    v16 = (void *)objc_msgSend_characterInformation(self, v14, v15);
    v18 = (void *)objc_msgSend_objectAtIndex_(v16, v17, 4);
    v21 = objc_msgSend_BOOLValue(v18, v19, v20);
  }
  v34 = (void *)MEMORY[0x24BDBD1C0];
  if (v13)
    v34 = v7;
  if (v21)
    return v34;
  return v7;
}

- (id)valueForKey:(int)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  void *v34;
  const char *v35;
  void *v36;
  const char *v37;
  void *v38;
  const char *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  id result;

  switch(a3)
  {
    case 0:
      v4 = (void *)objc_msgSend_characterInformation(self, a2, *(uint64_t *)&a3);
      v6 = objc_msgSend_objectAtIndex_(v4, v5, 0);
      return (id)MEMORY[0x24BEDD108](self, sel_radicalInformationForString_, v6);
    case 1:
      v7 = (void *)objc_msgSend_characterInformation(self, a2, *(uint64_t *)&a3);
      v9 = objc_msgSend_objectAtIndex_(v7, v8, 1);
      return (id)MEMORY[0x24BEDD108](self, sel_strokeInformationForString_, v9);
    case 2:
      v10 = (void *)objc_msgSend_characterInformation(self, a2, *(uint64_t *)&a3);
      v12 = objc_msgSend_objectAtIndex_(v10, v11, 2);
      return (id)objc_msgSend_pinyinInformationForString_(self, v13, v12);
    case 3:
      v14 = (void *)objc_msgSend_characterInformation(self, a2, *(uint64_t *)&a3);
      v16 = objc_msgSend_objectAtIndex_(v14, v15, 2);
      return (id)objc_msgSend_zhuyinInformationForString_(self, v17, v16);
    case 4:
      v18 = (void *)objc_msgSend_characterInformation(self, a2, *(uint64_t *)&a3);
      v20 = objc_msgSend_objectAtIndex_(v18, v19, 2);
      v22 = objc_msgSend_pinyinInformationForString_(self, v21, v20);
      return (id)MEMORY[0x24BEDD108](self, sel_initialsForStrings_, v22);
    case 5:
      v23 = (void *)objc_msgSend_characterInformation(self, a2, *(uint64_t *)&a3);
      v25 = objc_msgSend_objectAtIndex_(v23, v24, 2);
      v22 = objc_msgSend_zhuyinInformationForString_(self, v26, v25);
      return (id)MEMORY[0x24BEDD108](self, sel_initialsForStrings_, v22);
    case 6:
      v27 = (void *)objc_msgSend_characterInformation(self, a2, *(uint64_t *)&a3);
      v29 = objc_msgSend_objectAtIndex_(v27, v28, 2);
      return (id)MEMORY[0x24BEDD108](self, sel_tonesForString_, v29);
    case 7:
      return (id)MEMORY[0x24BEDD108](self, sel_wubixingCodes, *(_QWORD *)&a3);
    case 8:
      return (id)objc_msgSend_wubixingCodesForStandard_(self, a2, 0);
    case 9:
      return (id)MEMORY[0x24BEDD108](self, sel_bihuaCodes, *(_QWORD *)&a3);
    case 10:
      v30 = (void *)objc_msgSend_codeLookupInformation(self, a2, *(uint64_t *)&a3);
      v32 = objc_msgSend_objectAtIndex_(v30, v31, 1);
      return (id)objc_msgSend_separatedInputCodesForString_(self, v33, v32);
    case 11:
      return (id)MEMORY[0x24BEDD108](self, sel_cangjieCodes, *(_QWORD *)&a3);
    case 12:
      v34 = (void *)objc_msgSend_codeLookupInformation(self, a2, *(uint64_t *)&a3);
      v32 = objc_msgSend_objectAtIndex_(v34, v35, 2);
      return (id)objc_msgSend_separatedInputCodesForString_(self, v33, v32);
    case 13:
      v36 = (void *)objc_msgSend_codeLookupInformation(self, a2, *(uint64_t *)&a3);
      v12 = objc_msgSend_objectAtIndex_(v36, v37, 3);
      return (id)objc_msgSend_pinyinInformationForString_(self, v13, v12);
    case 14:
      v38 = (void *)objc_msgSend_codeLookupInformation(self, a2, *(uint64_t *)&a3);
      v16 = objc_msgSend_objectAtIndex_(v38, v39, 3);
      return (id)objc_msgSend_zhuyinInformationForString_(self, v17, v16);
    case 15:
      v40 = (void *)objc_msgSend_characterInformation(self, a2, *(uint64_t *)&a3);
      v42 = 3;
      goto LABEL_24;
    case 16:
      v40 = (void *)objc_msgSend_characterInformation(self, a2, *(uint64_t *)&a3);
      v42 = 4;
LABEL_24:
      result = (id)objc_msgSend_objectAtIndex_(v40, v41, v42);
      break;
    case 17:
      result = (id)MEMORY[0x24BEDD108](self, sel_isIncludedInCurrentLanguage, *(_QWORD *)&a3);
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (id)wubixingCodesForStandard:(int)a3
{
  void *v4;
  const char *v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;

  v4 = (void *)objc_msgSend_codeLookupInformation(self, a2, *(uint64_t *)&a3);
  v6 = (void *)objc_msgSend_objectAtIndex_(v4, v5, 0);
  if (v6)
  {
    v8 = (void *)objc_msgSend_componentsSeparatedByString_(v6, v7, (uint64_t)CFSTR(":"));
    if (objc_msgSend_count(v8, v9, v10) == 1)
    {
      v13 = (void *)objc_msgSend_objectAtIndexedSubscript_(v8, v11, 0);
      return (id)objc_msgSend_componentsSeparatedByString_(v13, v14, (uint64_t)CFSTR(" "));
    }
    if (objc_msgSend_count(v8, v11, v12) > (unint64_t)a3)
    {
      v13 = (void *)objc_msgSend_objectAtIndexedSubscript_(v8, v15, a3);
      return (id)objc_msgSend_componentsSeparatedByString_(v13, v14, (uint64_t)CFSTR(" "));
    }
  }
  return 0;
}

- (NSString)analysisString
{
  return self->_analysisString;
}

- (void)setAnalysisString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setCharacterInformation:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (void)setCodeLookupInformation:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (BOOL)isEmoji
{
  return self->_emoji;
}

- (void)setEmoji:(BOOL)a3
{
  self->_emoji = a3;
}

- (int)language
{
  return self->_language;
}

- (void)setLanguage:(int)a3
{
  self->_language = a3;
}

@end
