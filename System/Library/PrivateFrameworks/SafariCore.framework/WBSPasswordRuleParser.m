@implementation WBSPasswordRuleParser

+ (id)parsePasswordRules:(id)a3 error:(id *)a4
{
  __CFString *v6;
  __CFString *v7;
  CFIndex v8;
  UniChar *v9;
  UniChar *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v16;
  CFRange v17;

  v6 = (__CFString *)a3;
  v7 = v6;
  if (!v6)
  {
    if (a4)
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v14 = 2;
LABEL_10:
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("WBSPasswordRuleParserErrorDomain"), v14, 0);
      v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
LABEL_11:
    v12 = 0;
    goto LABEL_17;
  }
  v8 = -[__CFString length](v6, "length");
  v9 = (UniChar *)malloc_type_calloc(v8 + 1, 2uLL, 0x1000040BDFB0063uLL);
  if (!v9)
  {
    if (a4)
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v14 = 0;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v10 = v9;
  v17.location = 0;
  v17.length = v8;
  CFStringGetCharacters(v7, v17, v9);
  v10[v8] = 0;
  v16 = 0;
  parsePasswordRules(v10, &v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  free(v10);
  if (v16 == -1)
  {
    if (a4)
      *a4 = 0;
    objc_msgSend(a1, "_passwordRuleSetFromPasswordRules:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WBSPasswordRuleParserErrorDomain"));
    v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

LABEL_17:
  return v12;
}

+ (id)_passwordRuleSetFromPasswordRules:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  char v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  void *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  v38 = v4;
  if (v6)
  {
    v7 = v6;
    v37 = 0;
    v36 = 0;
    v8 = *(_QWORD *)v42;
    v40 = -2147483647;
    v9 = 0x7FFFFFFFLL;
    v10 = 0x7FFFFFFFLL;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v42 != v8)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        switch(objc_msgSend(v12, "type"))
        {
          case 0:
            objc_msgSend(v12, "value");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (v13)
              objc_msgSend(v4, "addObjectsFromArray:", v13);
            goto LABEL_23;
          case 1:
            objc_msgSend(v12, "value");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = v16;
            if (v16)
            {
              canonicalizedCharacterClasses(v16);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              +[WBSRequiredPasswordRule requiredRuleWithCharacterClasses:](WBSRequiredPasswordRule, "requiredRuleWithCharacterClasses:", v17);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "addObject:", v18);

              v4 = v38;
              objc_msgSend(v38, "addObjectsFromArray:", v17);

            }
            goto LABEL_23;
          case 2:
            objc_msgSend(v12, "value");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = v19;
            if (v19)
            {
              v20 = objc_msgSend(v19, "integerValue");
              if (v10 >= v20)
                v10 = v20;
              v36 = 1;
            }
            goto LABEL_23;
          case 3:
            objc_msgSend(v12, "value");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = v21;
            if (v21)
            {
              v22 = objc_msgSend(v21, "integerValue");
              v23 = v40;
              if (v40 <= v22)
                v23 = v22;
              v40 = v23;
              BYTE4(v37) = 1;
            }
            goto LABEL_23;
          case 4:
            objc_msgSend(v12, "value");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = v14;
            if (v14)
            {
              v15 = objc_msgSend(v14, "integerValue");
              if (v9 >= v15)
                v9 = v15;
              LOBYTE(v37) = 1;
            }
LABEL_23:

            break;
          default:
            continue;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    }
    while (v7);
  }
  else
  {
    v37 = 0;
    v36 = 0;
    v40 = -2147483647;
    v9 = 0x7FFFFFFFLL;
    v10 = 0x7FFFFFFFLL;
  }

  canonicalizedCharacterClasses(v4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v24, "count"))
  {
    +[WBSPasswordCharacterClass asciiPrintableCharacterClass](WBSPasswordCharacterClass, "asciiPrintableCharacterClass");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
    v26 = objc_claimAutoreleasedReturnValue();

    v24 = (void *)v26;
  }
  +[WBSAllowedPasswordRule allowedRuleWithCharacterClasses:](WBSAllowedPasswordRule, "allowedRuleWithCharacterClasses:", v24);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v36 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBSMaxConsecutivePasswordRule maxConsecutiveRuleWithValue:](WBSMaxConsecutivePasswordRule, "maxConsecutiveRuleWithValue:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v29 = 0;
  }
  if ((v37 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBSMaxLengthPasswordRule maxLengthRuleWithValue:](WBSMaxLengthPasswordRule, "maxLengthRuleWithValue:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v31 = 0;
  }
  if ((v37 & 0x100000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v40);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBSMinLengthPasswordRule minLengthRuleWithValue:](WBSMinLengthPasswordRule, "minLengthRuleWithValue:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v33 = 0;
  }
  +[WBSPasswordRuleSet ruleSetWithAllowedRule:requiredRules:maxConsecutiveRule:minLengthRule:maxLengthRule:](WBSPasswordRuleSet, "ruleSetWithAllowedRule:requiredRules:maxConsecutiveRule:minLengthRule:maxLengthRule:", v27, v39, v29, v33, v31);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  return v34;
}

+ (id)mergePasswordRuleSet:(id)a3 withPasswordRuleSet:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t (**v19)(void *, uint64_t);
  char v20;
  void *v21;
  void *v22;
  void *v23;
  const __CFAllocator *v24;
  __CFBitVector *Mutable;
  __CFBitVector *v26;
  void *v27;
  CFIndex i;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t (**v48)(void *, uint64_t);
  void *v49;
  id v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _QWORD aBlock[4];
  id v61;
  id v62;
  id v63;
  id v64;
  _BYTE v65[128];
  _QWORD v66[4];

  v66[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = 0;
  if (!v6 || !v7)
    goto LABEL_45;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allowedRule");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "value");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allowedRule");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "value");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12;
  v15 = v13;
  v51 = a1;
  if (objc_msgSend(v14, "count") && objc_msgSend(v15, "count"))
  {
    v49 = v11;
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v16 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __intersectCharacterClasses_block_invoke;
    aBlock[3] = &unk_1E649E3A0;
    v61 = v14;
    v62 = v15;
    v18 = (id)v16;
    v63 = v18;
    v50 = v17;
    v64 = v50;
    v19 = (uint64_t (**)(void *, uint64_t))_Block_copy(aBlock);
    LOBYTE(v16) = v19[2](v19, 1);
    v48 = v19;
    v20 = v19[2](v19, 0) & v16;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v20 & 0x10) != 0)
    {
      +[WBSPasswordCharacterClass unicodeCharacterClass](WBSPasswordCharacterClass, "unicodeCharacterClass");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addObject:", v42);

      if ((v20 & 0x20) == 0)
      {
LABEL_7:
        if ((v20 & 2) == 0)
          goto LABEL_8;
        goto LABEL_48;
      }
    }
    else if ((v20 & 0x20) == 0)
    {
      goto LABEL_7;
    }
    +[WBSPasswordCharacterClass asciiPrintableCharacterClass](WBSPasswordCharacterClass, "asciiPrintableCharacterClass");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObject:", v43);

    if ((v20 & 2) == 0)
    {
LABEL_8:
      if ((v20 & 1) == 0)
        goto LABEL_9;
      goto LABEL_49;
    }
LABEL_48:
    +[WBSPasswordCharacterClass lowercaseCharacterClass](WBSPasswordCharacterClass, "lowercaseCharacterClass");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObject:", v44);

    if ((v20 & 1) == 0)
    {
LABEL_9:
      if ((v20 & 4) == 0)
        goto LABEL_10;
      goto LABEL_50;
    }
LABEL_49:
    +[WBSPasswordCharacterClass uppercaseCharacterClass](WBSPasswordCharacterClass, "uppercaseCharacterClass");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObject:", v45);

    if ((v20 & 4) == 0)
    {
LABEL_10:
      if ((v20 & 8) == 0)
        goto LABEL_12;
      goto LABEL_11;
    }
LABEL_50:
    +[WBSPasswordCharacterClass digitCharacterClass](WBSPasswordCharacterClass, "digitCharacterClass");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObject:", v46);

    if ((v20 & 8) == 0)
    {
LABEL_12:
      v23 = v50;
      if (objc_msgSend(v18, "length") && objc_msgSend(v50, "length"))
      {
        v54 = v21;
        v24 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
        Mutable = CFBitVectorCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 95);
        CFBitVectorSetCount(Mutable, 95);
        v47 = v18;
        markBitsForCustomCharacterClassPropertyValue(Mutable, v18);
        v26 = CFBitVectorCreateMutable(v24, 95);
        CFBitVectorSetCount(v26, 95);
        markBitsForCustomCharacterClassPropertyValue(v26, v50);
        objc_msgSend(MEMORY[0x1E0CB37A0], "string");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        for (i = 0; i != 95; ++i)
        {
          if (CFBitVectorGetBitAtIndex(Mutable, i) && CFBitVectorGetBitAtIndex(v26, i))
            objc_msgSend(v27, "appendFormat:", CFSTR("%C"), i + 32);
        }
        CFRelease(Mutable);
        CFRelease(v26);
        v21 = v54;
        if (objc_msgSend(v27, "length"))
        {
          +[WBSPasswordCharacterClass customCharacterClassWithValue:](WBSPasswordCharacterClass, "customCharacterClassWithValue:", v27);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "addObject:", v29);

        }
        v18 = v47;
        v23 = v50;
      }

      v11 = v49;
      goto LABEL_24;
    }
LABEL_11:
    +[WBSPasswordCharacterClass specialCharacterClass](WBSPasswordCharacterClass, "specialCharacterClass");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObject:", v22);

    goto LABEL_12;
  }
  v21 = (void *)MEMORY[0x1E0C9AA60];
LABEL_24:

  if (objc_msgSend(v21, "count"))
  {
    +[WBSAllowedPasswordRule allowedRuleWithCharacterClasses:](WBSAllowedPasswordRule, "allowedRuleWithCharacterClasses:", v21);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v30);

  }
  v53 = v8;
  v55 = v21;
  v66[0] = v6;
  v66[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 2);
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v31 = (id)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v57;
    do
    {
      for (j = 0; j != v33; ++j)
      {
        if (*(_QWORD *)v57 != v34)
          objc_enumerationMutation(v31);
        v36 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * j);
        objc_msgSend(v36, "requiredRules");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (v37)
          objc_msgSend(v10, "addObjectsFromArray:", v37);
        objc_msgSend(v36, "maxConsecutiveRule");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (v38)
          objc_msgSend(v10, "addObject:", v38);
        objc_msgSend(v36, "minLengthRule");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        if (v39)
          objc_msgSend(v10, "addObject:", v39);
        objc_msgSend(v36, "maxLengthRule");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        if (v40)
          objc_msgSend(v10, "addObject:", v40);

      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
    }
    while (v33);
  }

  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(v51, "_passwordRuleSetFromPasswordRules:", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  v8 = v53;
LABEL_45:

  return v9;
}

@end
