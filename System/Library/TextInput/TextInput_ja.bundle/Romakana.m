@implementation Romakana

+ (id)romajiString:(id)a3
{
  return (id)MecabraReverseConvertedRomajiCreateFromKanaString();
}

+ (id)hiraganaString:(id)a3 mappingArray:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t i;
  _QWORD v21[5];

  v4 = a4;
  MecabraConvertedKanaCreateFromRomajiString();
  MecabraConvertedKanaGetKana();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MecabraConvertedKanaGetAlignment();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sortedArrayUsingSelector:", sel_compare_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length"))
  {
    v9 = 0;
    do
    {
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __40__Romakana_hiraganaString_mappingArray___block_invoke;
      v21[3] = &__block_descriptor_40_e35_B24__0__NSNumber_8__NSDictionary_16l;
      v21[4] = v9;
      objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", v21);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "filteredArrayUsingPredicate:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "integerValue");

      objc_msgSend(v6, "objectForKeyedSubscript:", v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "integerValue");

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v17 - v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v18);

      for (i = v9 + 1; i < objc_msgSend(v12, "integerValue"); ++i)
        objc_msgSend(v4, "addObject:", &unk_2501281E8);
      v9 = objc_msgSend(v12, "integerValue");

    }
    while (v9 < objc_msgSend(v5, "length"));
  }
  MecabraConvertedKanaRelease();

  return v5;
}

BOOL __40__Romakana_hiraganaString_mappingArray___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "integerValue") > *(_QWORD *)(a1 + 32);
}

+ (id)kanaSymbol:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  size_t v6;
  const char *v7;
  char **v8;
  char *v9;
  id v10;
  void *v11;

  v3 = objc_retainAutorelease(a3);
  v4 = (const char *)objc_msgSend(v3, "UTF8String");
  v5 = objc_msgSend(v3, "lengthOfBytesUsingEncoding:", 4);
  if (v5)
  {
    v6 = v5;
    v7 = "-";
    v8 = off_250122300;
    while (strncmp(v4, v7, v6))
    {
      v9 = *v8;
      v8 += 2;
      v7 = v9;
      if (!v9)
        goto LABEL_5;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *(v8 - 1));
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_5:
    v10 = v3;
  }
  v11 = v10;

  return v11;
}

+ ($9E7D8278DAE3F325C9F19E83C3CADDC5)splitRomaji:(id)a3 at:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  int v22;
  void *v23;
  int v24;
  BOOL v25;
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  unint64_t v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  uint64_t v61;
  $9E7D8278DAE3F325C9F19E83C3CADDC5 result;

  v61 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v5;
  +[Romakana hiraganaString:mappingArray:](Romakana, "hiraganaString:mappingArray:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v7, "length"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v9);

  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v57;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v57 != v14)
          objc_enumerationMutation(v10);
        v13 += (int)objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * i), "intValue");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v16);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
    }
    while (v12);
  }

  if (objc_msgSend(v8, "count") > a4)
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", a4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "unsignedIntegerValue");

    v19 = v55;
    if (!a4)
      goto LABEL_25;
    if (objc_msgSend(v8, "count") > a4 + 1)
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", a4 + 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v18;
      v22 = objc_msgSend(v20, "unsignedIntValue");
      objc_msgSend(v8, "objectAtIndexedSubscript:", a4);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "unsignedIntValue");

      v25 = v22 == v24;
      v18 = v21;
      v26 = a4 + 1;
      if (v25)
      {
        objc_msgSend(v8, "objectAtIndexedSubscript:", a4 - 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "substringToIndex:", objc_msgSend(v27, "unsignedIntValue"));
        v53 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "substringWithRange:", a4 - 1, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        +[Romakana romajiString:](Romakana, "romajiString:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "substringWithRange:", a4, 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        +[Romakana romajiString:](Romakana, "romajiString:", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "objectAtIndexedSubscript:", v26);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "substringFromIndex:", objc_msgSend(v32, "unsignedIntValue"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        v34 = v53;
        objc_msgSend(v53, "stringByAppendingString:", v29);
        v35 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "stringByAppendingString:", v33);
        v36 = objc_claimAutoreleasedReturnValue();

LABEL_17:
        goto LABEL_27;
      }
    }
    v37 = a4 - 1;
    objc_msgSend(v7, "substringWithRange:", a4 - 1, 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "isEqualToString:", CFSTR("ん"));

    if (v39)
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", a4 - 1);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "substringToIndex:", objc_msgSend(v40, "unsignedIntValue"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "substringWithRange:", v37, 1);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      +[Romakana romajiString:](Romakana, "romajiString:", v41);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v55, "substringFromIndex:", v18);
      v36 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "stringByAppendingString:", v29);
      v35 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
    objc_msgSend(v7, "substringWithRange:", a4 - 1, 1);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "isEqualToString:", CFSTR("っ"));

    if (v43)
    {
      v54 = v18;
      objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", v18);
      v35 = (id)objc_claimAutoreleasedReturnValue();
      v44 = 0;
      do
      {
        objc_msgSend(v7, "substringWithRange:", v44, 1);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        +[Romakana romajiString:](Romakana, "romajiString:", v45);
        v46 = objc_claimAutoreleasedReturnValue();
        v47 = (void *)v46;
        if (v46)
          v48 = (void *)v46;
        else
          v48 = v45;
        objc_msgSend(v35, "appendString:", v48);

        ++v44;
      }
      while (a4 != v44);
      v49 = v55;
      v50 = v54;
    }
    else
    {
LABEL_25:
      objc_msgSend(v55, "substringToIndex:", v18);
      v35 = (id)objc_claimAutoreleasedReturnValue();
      v49 = v55;
      v50 = v18;
    }
    objc_msgSend(v49, "substringFromIndex:", v50);
    v36 = objc_claimAutoreleasedReturnValue();
    goto LABEL_27;
  }
  v19 = v55;
  v35 = v55;
  v36 = 0;
LABEL_27:

  v51 = v35;
  v52 = (void *)v36;
  result.var1 = v52;
  result.var0 = v51;
  return result;
}

- (id)hiraganaFromRomaji:(id)a3 stripIncompleteRomajiAtEnd:(BOOL)a4 strippedLength:(unint64_t *)a5
{
  _BOOL4 v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  unint64_t v21;
  _BOOL4 v22;

  v6 = a4;
  v7 = a3;
  MecabraConvertedKanaCreateFromRomajiString();
  v8 = (void *)objc_msgSend((id)MecabraConvertedKanaGetKana(), "mutableCopy");
  MecabraConvertedKanaGetAlignment();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "length");
  v11 = v10 - 1;
  if (v10 - 1 < 0)
  {
    v12 = 0;
    if (a5)
LABEL_7:
      *a5 = v12;
  }
  else
  {
    v21 = v10;
    v22 = v6;
    v12 = 0;
    while (1)
    {
      v13 = objc_msgSend(v8, "characterAtIndex:", v11, v21);
      objc_msgSend(MEMORY[0x24BDD14A8], "alphabetCharacterSet");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v13) = objc_msgSend(v14, "characterIsMember:", v13);

      if (!(_DWORD)v13)
        break;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "substringWithRange:", objc_msgSend(v16, "integerValue"), 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "replaceCharactersInRange:withString:", v11, 1, v17);
      ++v12;

      if (--v11 == -1)
      {
        v12 = v21;
        break;
      }
    }
    v6 = v22;
    if (a5)
      goto LABEL_7;
  }
  MecabraConvertedKanaRelease();
  if (v6)
  {
    objc_msgSend(v8, "substringToIndex:", objc_msgSend(v8, "length") - v12);
    v18 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = v8;
  }
  v19 = v18;

  return v19;
}

- (id)adjustIncompleteRomaji:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSCharacterSet *consonantsCharacterSet;
  NSCharacterSet *v11;
  NSCharacterSet *v12;
  uint64_t v13;
  void *v14;
  uint64_t v16;

  v4 = a3;
  v16 = 0;
  -[Romakana hiraganaFromRomaji:stripIncompleteRomajiAtEnd:strippedLength:](self, "hiraganaFromRomaji:stripIncompleteRomajiAtEnd:strippedLength:", v4, 0, &v16);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v16 == 1)
  {
    v7 = objc_msgSend(v5, "length");
    objc_msgSend(v6, "substringFromIndex:", v7 - v16);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("n")))
    {
      objc_msgSend(v4, "stringByAppendingString:", CFSTR("n"));
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      consonantsCharacterSet = self->_consonantsCharacterSet;
      if (!consonantsCharacterSet)
      {
        objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("bcdfghjklmpqrstvwxyz"));
        v11 = (NSCharacterSet *)objc_claimAutoreleasedReturnValue();
        v12 = self->_consonantsCharacterSet;
        self->_consonantsCharacterSet = v11;

        consonantsCharacterSet = self->_consonantsCharacterSet;
      }
      objc_msgSend(v8, "rangeOfCharacterFromSet:", consonantsCharacterSet);
      if (!v13)
        goto LABEL_9;
      objc_msgSend(v4, "stringByReplacingCharactersInRange:withString:", objc_msgSend(v4, "length") - 1, 1, CFSTR("xtu"));
      v9 = objc_claimAutoreleasedReturnValue();
    }
    v14 = (void *)v9;

    v4 = v14;
LABEL_9:

  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_consonantsCharacterSet, 0);
}

@end
