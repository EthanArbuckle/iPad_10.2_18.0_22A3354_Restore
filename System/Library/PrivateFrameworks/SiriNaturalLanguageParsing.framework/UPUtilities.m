@implementation UPUtilities

+ (BOOL)checkFileExistence:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[2];
  _QWORD v22[2];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v7);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        if ((objc_msgSend(v6, "fileExistsAtPath:", v11, (_QWORD)v17) & 1) == 0)
        {
          if (a4)
          {
            v21[0] = *MEMORY[0x1E0CB2D50];
            objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Could not open file path"), &stru_1E7BED9E0, 0);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v21[1] = CFSTR("FilePath");
            v22[0] = v14;
            v22[1] = v11;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB32E8], -3001, v15);
            *a4 = (id)objc_claimAutoreleasedReturnValue();

          }
          v12 = 0;
          goto LABEL_13;
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
      if (v8)
        continue;
      break;
    }
  }
  v12 = 1;
LABEL_13:

  return v12;
}

+ (_NSRange)rangeFromStart:(unint64_t)a3 end:(unint64_t)a4
{
  NSUInteger v5;
  _NSRange result;

  v5 = a4 - a3;
  result.length = v5;
  result.location = a3;
  return result;
}

+ (basic_string<char16_t,)nSStringToU16String:(std::allocator<char16_t>> *__return_ptr)retstr
{
  void *v1;
  std::basic_string<char16_t>::size_type v3;
  std::basic_string<char16_t>::value_type v4;
  basic_string<char16_t, std::char_traits<char16_t>, std::allocator<char16_t>> *var0;
  std::basic_string<char16_t>::size_type v6;
  std::basic_string<char16_t>::value_type v7;
  basic_string<char16_t, std::char_traits<char16_t>, std::allocator<char16_t>> *result;
  id v9;

  v9 = v1;
  v3 = objc_msgSend(v9, "lengthOfBytesUsingEncoding:", 10);
  retstr->var0.var0.var0.var1.var0 = 0;
  retstr->var0.var0.var0.var1.var1 = 0;
  *((_QWORD *)&retstr->var0.var0.var0.var1 + 2) = 0;
  std::basic_string<char16_t>::resize((std::basic_string<char16_t> *)retstr, v3, v4);
  if (*((char *)&retstr->var0.var0.var0.var1 + 23) >= 0)
    var0 = retstr;
  else
    var0 = (basic_string<char16_t, std::char_traits<char16_t>, std::allocator<char16_t>> *)retstr->var0.var0.var0.var1.var0;
  objc_msgSend(v9, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", var0, v3, 0, 10, 0, 0, v3, 0);
  v6 = objc_msgSend(v9, "length");
  std::basic_string<char16_t>::resize((std::basic_string<char16_t> *)retstr, v6, v7);

  return result;
}

+ (id)stdU16ToNSString:(const void *)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = *((_QWORD *)a3 + 1);
  if (*((char *)a3 + 23) >= 0)
  {
    v4 = *((unsigned __int8 *)a3 + 23);
  }
  else
  {
    a3 = *(const void **)a3;
    v4 = v3;
  }
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", a3, v4);
}

+ (id)higherLevelEntityLabelFromParentLabel:(id)a3 childLabel:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v7, "appendString:", v5);
  objc_msgSend(v7, "appendString:", CFSTR("."));
  objc_msgSend(v7, "appendString:", v6);

  return v7;
}

+ (id)intermediateNodeRepresentations:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  UPResultLeafNode *v10;
  void *v11;
  void *v12;
  UPResultLeafNode *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t j;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  void *v33;
  UPResultIntermediateNode *v34;
  uint64_t v36;
  uint64_t v37;
  id v38;
  id obj;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", v3);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v50 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        objc_msgSend(v7, "higherLevelParentLabel");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "higherLevelChildLabel");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = [UPResultLeafNode alloc];
        objc_msgSend(v7, "text");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "semanticValue");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[UPResultLeafNode initWithLabel:andText:andSemanticValue:](v10, "initWithLabel:andText:andSemanticValue:", v9, v11, v12);

        objc_msgSend(v40, "objectForKey:", v8);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14 == 0;

        if (v15)
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "setObject:forKey:", v16, v8);

        }
        objc_msgSend(v40, "objectForKey:", v8);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "groupId");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
          objc_msgSend(v7, "groupId");
        else
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", 0x7FFFFFFFFFFFFFFFLL);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "objectForKey:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20 == 0;

        if (v21)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKey:", v22, v19);

        }
        objc_msgSend(v17, "objectForKey:", v19);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "addObject:", v13);

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
    }
    while (v4);
  }

  v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v38 = v40;
  v25 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
  if (v25)
  {
    v36 = *(_QWORD *)v46;
    do
    {
      v37 = v25;
      for (j = 0; j != v37; ++j)
      {
        if (*(_QWORD *)v46 != v36)
          objc_enumerationMutation(v38);
        v27 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * j);
        objc_msgSend(v38, "objectForKey:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = 0u;
        v44 = 0u;
        v41 = 0u;
        v42 = 0u;
        v29 = v28;
        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
        if (v30)
        {
          v31 = *(_QWORD *)v42;
          do
          {
            for (k = 0; k != v30; ++k)
            {
              if (*(_QWORD *)v42 != v31)
                objc_enumerationMutation(v29);
              objc_msgSend(v29, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * k));
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = -[UPResultIntermediateNode initWithLabel:andLeafNodes:]([UPResultIntermediateNode alloc], "initWithLabel:andLeafNodes:", v27, v33);
              objc_msgSend(v24, "addObject:", v34);

            }
            v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
          }
          while (v30);
        }

      }
      v25 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
    }
    while (v25);
  }

  return v24;
}

+ (id)rootNodeRepresentationForIntent:(id)a3 andEntities:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  UPResultLeafNode *v10;
  void *v11;
  void *v12;
  void *v13;
  UPResultLeafNode *v14;
  UPResultRootNode *v15;
  void *v16;
  UPResultRootNode *v17;
  id v19;
  id v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  v19 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = v19;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if (objc_msgSend(v9, "isHigherLevelEntity"))
        {
          objc_msgSend(v22, "addObject:", v9);
        }
        else
        {
          v10 = [UPResultLeafNode alloc];
          objc_msgSend(v9, "label");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "text");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "semanticValue");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = -[UPResultLeafNode initWithLabel:andText:andSemanticValue:](v10, "initWithLabel:andText:andSemanticValue:", v11, v12, v13);

          objc_msgSend(v21, "addObject:", v14);
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v6);
  }

  v15 = [UPResultRootNode alloc];
  +[UPUtilities intermediateNodeRepresentations:](UPUtilities, "intermediateNodeRepresentations:", v22);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[UPResultRootNode initWithLabel:intermediateNodes:directLeafNodes:](v15, "initWithLabel:intermediateNodes:directLeafNodes:", v20, v16, v21);

  return v17;
}

@end
