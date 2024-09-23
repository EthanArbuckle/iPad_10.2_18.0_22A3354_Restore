@implementation TCFontFamily

- (TCFontFamily)initWithNamesByLanguage:(id)a3 members:(id)a4
{
  TCFontFamily *v6;
  TCFontFamily *v7;
  uint64_t v8;
  NSDictionary *namesByLanguage;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  unsigned __int8 v16;
  uint64_t i;
  void *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int v23;
  TCFont *v24;
  void *v25;
  void *v26;
  TCFont *v27;
  void *v28;
  uint64_t v29;
  NSArray *members;
  id v32;
  TCFontFamily *v33;
  id obj;
  id v35;
  uint64_t v36;
  void *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  objc_super v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v32 = a3;
  v35 = a4;
  v47.receiver = self;
  v47.super_class = (Class)TCFontFamily;
  v6 = -[TCFontFamily init](&v47, sel_init);
  v33 = v6;
  if (v6)
  {
    v7 = v6;
    v8 = objc_msgSend(v32, "copy");
    namesByLanguage = v7->_namesByLanguage;
    v7->_namesByLanguage = (NSDictionary *)v8;

    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    obj = v35;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v44;
LABEL_4:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v44 != v11)
          objc_enumerationMutation(obj);
        v38 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v12);
        if (objc_msgSend(v38, "styling"))
          break;
        if (v10 == ++v12)
        {
          v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
          if (v10)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v35 = obj;
      v15 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
      if (!v15)
      {

        v13 = 0;
LABEL_28:
        v14 = obj;
        goto LABEL_29;
      }
      v16 = 0;
      v36 = *(_QWORD *)v40;
      v37 = 0;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v40 != v36)
            objc_enumerationMutation(v35);
          v18 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          if (objc_msgSend(v18, "styling"))
          {
            v19 = objc_msgSend(v18, "styling");
            v16 |= v19 != objc_msgSend(v38, "styling");
          }
          else
          {
            if (!v37)
              v37 = (void *)objc_msgSend(v35, "mutableCopy");
            v20 = objc_msgSend(v18, "styling");
            v22 = v21;
            v23 = objc_msgSend(v38, "styling");
            v24 = [TCFont alloc];
            objc_msgSend(v18, "namesByLanguage");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "psName");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = -[TCFont initWithNamesByLanguage:psName:styling:](v24, "initWithNamesByLanguage:psName:styling:", v25, v26, v20 & 0xFFFFFFFF00000000 | v23, v22);

            objc_msgSend(v37, "replaceObjectAtIndex:withObject:", objc_msgSend(v37, "indexOfObjectIdenticalTo:", v18), v27);
          }
        }
        v15 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
      }
      while (v15);

      if ((v16 & (v37 != 0)) == 1)
      {
        objc_msgSend(v32, "objectForKeyedSubscript:", &unk_24F46A480);

        v28 = v37;
LABEL_27:
        v13 = v28;
        v35 = v13;
        goto LABEL_28;
      }

      v28 = v37;
      if (v37)
        goto LABEL_27;
      v13 = 0;
    }
    else
    {
LABEL_10:
      v13 = 0;
      v14 = obj;
      v35 = obj;
LABEL_29:

    }
    v29 = objc_msgSend(v35, "copy");
    members = v33->_members;
    v33->_members = (NSArray *)v29;

    -[NSArray makeObjectsPerformSelector:withObject:](v33->_members, "makeObjectsPerformSelector:withObject:", sel_setFamily_, v33);
  }

  return v33;
}

- (id)bestMatchForStyling:(TCFontStyling)a3
{
  unint64_t v3;
  uint64_t v4;
  int v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  unsigned int v9;
  int v10;
  uint64_t i;
  void *v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  id v19;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v3 = *(_QWORD *)&a3.weight;
  v27 = *MEMORY[0x24BDAC8D0];
  -[TCFontFamily members](self, "members", *(_QWORD *)&a3.fontClass);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v4)
  {
    v5 = 0;
    v6 = 0;
    v7 = HIDWORD(v3);
    v8 = *(_QWORD *)v23;
    v9 = (v3 >> 8) & 1;
    v10 = (char)v3;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v12, "styling");
        v15 = v9 + (v13 << 23 >> 31);
        if (v15 < 0)
          v15 = -v15;
        v16 = v10 - (char)v13;
        if (v16 < 0)
          v16 = (char)v13 - v10;
        v17 = v7 - v14;
        if ((int)v7 - v14 < 0)
          v17 = v14 - v7;
        v18 = v16 + v17 + 200 * v15;
        if (!v6 || v18 < v5)
        {
          v19 = v12;

          v5 = v18;
          v6 = v19;
        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v4);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)memberForPSName:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[TCFontFamily members](self, "members");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "psName", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)memberForFullName:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  uint64_t v19;
  uint64_t v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[TCFontFamily members](self, "members");
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v5)
  {
    v20 = *(_QWORD *)v27;
    do
    {
      v19 = v5;
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v27 != v20)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        objc_msgSend(v7, "namesByLanguage");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v9)
        {
          v10 = *(_QWORD *)v23;
          while (2)
          {
            for (j = 0; j != v9; ++j)
            {
              if (*(_QWORD *)v23 != v10)
                objc_enumerationMutation(v8);
              v12 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * j);
              objc_msgSend(v7, "namesByLanguage");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "objectForKeyedSubscript:", v12);
              v14 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v14, "fullName");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v15, "isEqualToString:", v4);

              if ((v16 & 1) != 0)
              {
                v17 = v7;

                goto LABEL_19;
              }

            }
            v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
            if (v9)
              continue;
            break;
          }
        }

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      v17 = 0;
    }
    while (v5);
  }
  else
  {
    v17 = 0;
  }
LABEL_19:

  return v17;
}

- (id)regularVariant:(BOOL)a3
{
  void *v3;
  unsigned __int8 v4;
  unsigned __int8 v5;
  uint64_t *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  id v17;
  uint64_t v18;
  char v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  int v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  unsigned __int8 v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  unsigned __int8 v36;
  uint64_t v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unsigned __int8 v48;
  unsigned __int8 v49;
  int v50;
  BOOL v51;
  _BOOL4 v55;
  void *v56;
  id obj;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v55 = a3;
  v68 = *MEMORY[0x24BDAC8D0];
  -[TCFontFamily members](self, "members");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v56, "count") != 1)
  {
    {
      -[TCFontFamily regularVariant:]::sRegularSuffixArray = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", CFSTR("regular"), CFSTR("roman"), CFSTR("plain"), CFSTR("normal"), CFSTR("book"), 0);
    }
    if ((v5 & 1) == 0
    {
      objc_msgSend((id)-[TCFontFamily regularVariant:]::sRegularSuffixArray, "arrayByAddingObjectsFromArray:", &unk_24F469F28);
      -[TCFontFamily regularVariant:]::sRegularSuffixExtendedArray = objc_claimAutoreleasedReturnValue();
    }
    v6 = &-[TCFontFamily regularVariant:]::sRegularSuffixExtendedArray;
    if (!v55)
      v6 = &-[TCFontFamily regularVariant:]::sRegularSuffixArray;
    v7 = (id)*v6;
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    obj = v56;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
    if (v8)
    {
      v3 = 0;
      v9 = *(_QWORD *)v63;
      v10 = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v63 != v9)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
          objc_msgSend(v12, "englishName");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "styleName");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "lowercaseString");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          v16 = objc_msgSend(v7, "indexOfObject:", v15);
          if (v16 < v10)
          {
            v17 = v12;

            v3 = v17;
            v10 = v16;
          }

        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
      }
      while (v8);

      if (v3)
      {
        if (v55)
          goto LABEL_57;
        goto LABEL_27;
      }
    }
    else
    {

    }
    if (objc_msgSend(obj, "count") == 2)
    {
      v18 = 0;
      v19 = 1;
      do
      {
        v20 = v19;
        objc_msgSend(obj, "objectAtIndexedSubscript:", v18);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(obj, "objectAtIndexedSubscript:", v18 ^ 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "styling");
        objc_msgSend(v22, "styling");

        v19 = 0;
        v18 = 1;
      }
      while ((v20 & 1) != 0);
    }
    if (v55)
    {
      objc_msgSend(obj, "firstObject");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "styling");
      v26 = v25;

      -[TCFontFamily bestMatchForStyling:](self, "bestMatchForStyling:", v24, v26 & 0xFFFF0000);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_57:

      goto LABEL_58;
    }
    v3 = 0;
LABEL_27:
    objc_msgSend(v3, "englishName");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "fullName");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "styleName");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v28, "hasSuffix:", v29);

    if (!v30)
      goto LABEL_32;
    if ((v31 & 1) == 0
    {
      -[TCFontFamily regularVariant:]::sInvalidFullNameSuffixSet = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", CFSTR("regular"), CFSTR("normal"), 0);
    }
    v32 = (void *)-[TCFontFamily regularVariant:]::sInvalidFullNameSuffixSet;
    objc_msgSend(v27, "styleName");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "lowercaseString");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v32, "containsObject:", v34);

    if (!v35)
      goto LABEL_32;
    {
      -[TCFontFamily regularVariant:]::sFontsWithRegular = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", CFSTR("Athelas"), CFSTR("Avenir Next"), CFSTR("Avenir Next Condensed"), CFSTR("Kefa"), CFSTR("Lucida Fax"), CFSTR("Lucida Sans"), CFSTR("Lucida Sans Typewriter"), CFSTR("Menlo"), CFSTR("Optima"), CFSTR("STIXGeneral"), CFSTR("Superclarendon"), 0);
    }
    v37 = -[TCFontFamily regularVariant:]::sFontsWithRegular;
    -[TCFontFamily englishName](self, "englishName");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v37) = objc_msgSend((id)v37, "containsObject:", v38);

    if ((v37 & 1) == 0)
    {
      v39 = v3;
LABEL_54:
      v3 = 0;
    }
    else
    {
LABEL_32:
      if (!v3)
      {
LABEL_56:

        goto LABEL_57;
      }
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      v39 = obj;
      v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
      if (v40)
      {
        v41 = *(_QWORD *)v59;
        while (2)
        {
          for (j = 0; j != v40; ++j)
          {
            if (*(_QWORD *)v59 != v41)
              objc_enumerationMutation(v39);
            v43 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * j);
            if (v43 != v3)
            {
              v44 = objc_msgSend(v43, "styling");
              v46 = v45;
              v47 = objc_msgSend(v3, "styling");
              v51 = (_DWORD)v44 == (_DWORD)v47 && HIDWORD(v44) == HIDWORD(v47);
              if (v51 && v46 == v48 && BYTE1(v46) == v49 && HIDWORD(v46) == v50)
              {

                goto LABEL_54;
              }
            }
          }
          v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
          if (v40)
            continue;
          break;
        }
      }
    }

    goto LABEL_56;
  }
  objc_msgSend(v56, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_58:

  return v3;
}

- (BOOL)traitsAreAdditive
{
  void *v2;
  BOOL v3;

  -[TCFontFamily regularVariant:](self, "regularVariant:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)allFamilyIsItalic
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int16 v6;
  BOOL v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[TCFontFamily members](self, "members", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "styling");
        if ((v6 & 0x100) == 0)
        {
          v7 = 0;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
  v7 = 1;
LABEL_11:

  return v7;
}

- (id)variantByTogglingItalicOfFont:(id)a3
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  int v10;
  int v11;
  unint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  unsigned __int8 v16;
  unsigned __int8 v17;
  int v18;
  id v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v24 = a3;
  v4 = objc_msgSend(v24, "styling");
  v6 = v5;
  -[TCFontFamily members](self, "members");
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v7)
  {
    v8 = 0;
    v9 = *(_QWORD *)v27;
    v10 = v6;
    v11 = BYTE1(v6) ^ 1;
    v12 = HIDWORD(v6);
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v15 = objc_msgSend(v14, "styling");
        if ((_DWORD)v15 == (_DWORD)v4 && HIDWORD(v15) == HIDWORD(v4) && v16 == v10 && v11 == v17 && v18 == (_DWORD)v12)
        {
          if (v8)
          {

            goto LABEL_26;
          }
          v8 = v14;
        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v7)
        continue;
      break;
    }
  }
  else
  {
LABEL_26:
    v8 = 0;
  }

  return v8;
}

- (BOOL)allFamilyIsBold
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  int v6;
  BOOL v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[TCFontFamily members](self, "members", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "styling");
        if (v6 << 24 < 503316480)
        {
          v7 = 0;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
  v7 = 1;
LABEL_11:

  return v7;
}

- (id)weightVariantsOfFont:(id)a3
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  unint64_t v11;
  uint64_t i;
  void *v13;
  char v14;
  char v15;
  uint64_t v16;
  char v17;
  unsigned __int8 v18;
  int v19;
  void *v23;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = objc_msgSend(a3, "styling");
  v6 = v5;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[TCFontFamily members](self, "members");
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v27;
    v10 = BYTE1(v6);
    v11 = HIDWORD(v6);
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v13, "styling");
        v15 = v14;
        v16 = objc_msgSend(v13, "styling");
        if ((_DWORD)v16 == (_DWORD)v4 && HIDWORD(v16) == HIDWORD(v4) && v17 == v15 && v18 == v10 && v19 == (_DWORD)v11)
          objc_msgSend(v25, "addObject:", v13);
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v8);
  }

  objc_msgSend(v25, "sortedArrayUsingComparator:", &__block_literal_global_42);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

uint64_t __37__TCFontFamily_weightVariantsOfFont___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  int v5;
  int v6;
  int v7;
  int v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a3;
  objc_msgSend(a2, "styling");
  v6 = v5;
  objc_msgSend(v4, "styling");
  v8 = (v6 - v7) << 24;
  v9 = v8 == 0;
  if (v8)
    v10 = -1;
  else
    v10 = 0;
  if (((v6 - v7) & 0x80) != 0 || v9)
    v11 = v10;
  else
    v11 = 1;

  return v11;
}

- (unint64_t)boldFontIndexInWeightVariants:(id)a3
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  int v8;

  v3 = a3;
  v4 = objc_msgSend(v3, "count");
  v5 = v4;
  if (v4)
  {
    v6 = v4;
    while (1)
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", v6 - 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "styling");
      if (v8 << 24 <= 687865855)
        break;

      if (!--v6)
      {
        v5 = 0;
        goto LABEL_13;
      }
    }
    if (v6 < v5 && v8 << 24 < 503316480)
      v5 = v6;
    else
      v5 = v6 - 1;

  }
LABEL_13:

  return v5;
}

- (unint64_t)regularFontIndexInWeightVariants:(id)a3
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  int v7;

  v3 = a3;
  v4 = objc_msgSend(v3, "count");
  if (v4)
  {
    v5 = 0;
    while (1)
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "styling");
      if (!(v7 << 24))
        break;
      if (v7 << 24 >= 1)
      {
        if (v5)
          --v5;
        else
          v5 = 0;
        break;
      }
      ++v5;

      if (v4 == v5)
        goto LABEL_6;
    }

  }
  else
  {
LABEL_6:
    v5 = v4 - 1;
  }

  return v5;
}

- (id)variantByAddingBoldToFont:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v9;
  uint64_t v10;
  unint64_t v11;

  v4 = a3;
  -[TCFontFamily members](self, "members");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") == 1
    || (objc_msgSend(v4, "styling"), v6 << 24 > 654311424)
    || -[TCFontFamily allFamilyIsBold](self, "allFamilyIsBold"))
  {
    v7 = 0;
  }
  else
  {
    -[TCFontFamily weightVariantsOfFont:](self, "weightVariantsOfFont:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "indexOfObjectIdenticalTo:", v4);
    if ((unint64_t)objc_msgSend(v9, "count") >= 2
      && (v11 = -[TCFontFamily boldFontIndexInWeightVariants:](self, "boldFontIndexInWeightVariants:", v9),
          v10 == -[TCFontFamily regularFontIndexInWeightVariants:](self, "regularFontIndexInWeightVariants:", v9)))
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", v11);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

- (id)variantByRemovingBoldFromFont:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;

  v4 = a3;
  -[TCFontFamily members](self, "members");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") == 1
    || (objc_msgSend(v4, "styling"), v6 << 24 < 0x1000000)
    || -[TCFontFamily allFamilyIsBold](self, "allFamilyIsBold")
    || !-[TCFontFamily traitsAreAdditive](self, "traitsAreAdditive"))
  {
    v11 = 0;
  }
  else
  {
    -[TCFontFamily weightVariantsOfFont:](self, "weightVariantsOfFont:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "indexOfObjectIdenticalTo:", v4);
    if ((unint64_t)objc_msgSend(v7, "count") >= 2
      && (v9 = -[TCFontFamily boldFontIndexInWeightVariants:](self, "boldFontIndexInWeightVariants:", v7),
          v10 = -[TCFontFamily regularFontIndexInWeightVariants:](self, "regularFontIndexInWeightVariants:", v7),
          v8 == v9))
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }

  }
  return v11;
}

- (BOOL)doesAnyNonBoldVariantExistForFont:(id)a3
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  unint64_t v11;
  uint64_t i;
  void *v13;
  char v14;
  char v15;
  uint64_t v16;
  char v17;
  unsigned __int8 v18;
  int v19;
  BOOL v21;
  int v23;
  BOOL v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = objc_msgSend(a3, "styling");
  v6 = v5;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[TCFontFamily members](self, "members", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v27;
    v10 = BYTE1(v6);
    v11 = HIDWORD(v6);
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v13, "styling");
        v15 = v14;
        v16 = objc_msgSend(v13, "styling");
        if ((_DWORD)v16 == (_DWORD)v4 && HIDWORD(v16) == HIDWORD(v4))
        {
          v21 = v17 == v15 && v18 == v10;
          if (v21 && v19 == (_DWORD)v11)
          {
            objc_msgSend(v13, "styling");
            if (v23 << 24 < 503316480)
            {
              v24 = 1;
              goto LABEL_24;
            }
          }
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v8)
        continue;
      break;
    }
  }
  v24 = 0;
LABEL_24:

  return v24;
}

- (id)englishName
{
  void *v2;
  void *v3;

  -[TCFontFamily namesByLanguage](self, "namesByLanguage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", &unk_24F46A480);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)equivalentDictionary
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[TCFontFamily namesByLanguage](self, "namesByLanguage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v27 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        TCFontMacLanguageIDToNSString(objc_msgSend(v8, "unsignedShortValue"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[TCFontFamily namesByLanguage](self, "namesByLanguage");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, v9);

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v5);
  }

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TCFontFamily members](self, "members");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sortedArrayUsingComparator:", &__block_literal_global_197);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v15 = v14;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v23;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * j), "equivalentDictionary");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v19);

      }
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v16);
  }

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", v3, CFSTR("names-by-language"), v12, CFSTR("members"), 0, (_QWORD)v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

uint64_t __36__TCFontFamily_equivalentDictionary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "psName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "psName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "compare:", v6);

  return v7;
}

- (TCFontFamily)initWithDictionary:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  NSString *v9;
  unsigned __int16 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  TCFont *v19;
  TCFontFamily *v20;
  TCFontFamily *v22;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v24 = a3;
  v22 = self;
  objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("names-by-language"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v5 = v23;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v30 != v7)
          objc_enumerationMutation(v5);
        v9 = *(NSString **)(*((_QWORD *)&v29 + 1) + 8 * i);
        v10 = TCFontMacLanguageIDFromNSString(v9);
        objc_msgSend(v5, "objectForKeyedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, v12);

      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v6);
  }

  objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("members"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v15 = v13;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v26 != v17)
          objc_enumerationMutation(v15);
        v19 = -[TCFont initWithDictionary:]([TCFont alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j));
        objc_msgSend(v14, "addObject:", v19);

      }
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v16);
  }

  v20 = -[TCFontFamily initWithNamesByLanguage:members:](v22, "initWithNamesByLanguage:members:", v4, v14);
  return v20;
}

- (id)description
{
  void *v2;
  void *v3;

  -[TCFontFamily equivalentDictionary](self, "equivalentDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSDictionary)namesByLanguage
{
  return self->_namesByLanguage;
}

- (NSArray)members
{
  return self->_members;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_members, 0);
  objc_storeStrong((id *)&self->_namesByLanguage, 0);
}

@end
