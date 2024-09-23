@implementation TIMarkedTextBuffer_ja_Romaji

- (TIMarkedTextBuffer_ja_Romaji)initWithInternalString:(id)a3
{
  id v4;
  TIMarkedTextBuffer_ja_Romaji *v5;
  uint64_t v6;
  NSMutableArray *externalIndexToInternalIndexMappingArray;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TIMarkedTextBuffer_ja_Romaji;
  v5 = -[TIMarkedTextBuffer_ja_Romaji init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    externalIndexToInternalIndexMappingArray = v5->_externalIndexToInternalIndexMappingArray;
    v5->_externalIndexToInternalIndexMappingArray = (NSMutableArray *)v6;

    -[TIMarkedTextBuffer_ja_Romaji setInternalString:withInputIndex:](v5, "setInternalString:withInputIndex:", v4, objc_msgSend(v4, "length"));
  }

  return v5;
}

- (void)setInternalString:(id)a3 withInputIndex:(int64_t)a4
{
  objc_storeStrong((id *)&self->_internalString, a3);
  -[TIMarkedTextBuffer_ja_Romaji updateStateWithInputIndex:](self, "updateStateWithInputIndex:", a4);
}

- (void)updateStateWithInputIndex:(int64_t)a3
{
  void *v5;
  NSString *externalString;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  NSString *v15;
  NSString *v16;
  NSMutableArray *externalIndexToInternalIndexMappingArray;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSMutableArray *v26;
  void *v27;
  __CFString *v28;
  __CFString *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  -[TIMarkedTextBuffer_ja_Romaji internalString](self, "internalString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  externalString = self->_externalString;
  self->_externalString = 0;

  -[TIMarkedTextBuffer_ja_Romaji externalIndexToInternalIndexMappingArray](self, "externalIndexToInternalIndexMappingArray");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllObjects");

  -[TIMarkedTextBuffer_ja_Romaji setExternalInputIndex:](self, "setExternalInputIndex:", 0);
  if (v5 && objc_msgSend(v5, "length"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3 < 1)
    {
      v11 = &stru_250122EC0;
    }
    else
    {
      objc_msgSend(v5, "substringToIndex:", a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lowercaseString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[Romakana hiraganaString:mappingArray:](Romakana, "hiraganaString:mappingArray:", v10, v8);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    v30 = v5;
    if (objc_msgSend(v5, "length") <= (unint64_t)a3)
    {
      v14 = &stru_250122EC0;
    }
    else
    {
      objc_msgSend(v5, "substringFromIndex:", a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lowercaseString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[Romakana hiraganaString:mappingArray:](Romakana, "hiraganaString:mappingArray:", v13, v8);
      v14 = (const __CFString *)objc_claimAutoreleasedReturnValue();

    }
    v28 = (__CFString *)v14;
    v29 = v11;
    -[__CFString stringByAppendingString:](v11, "stringByAppendingString:", v14);
    v15 = (NSString *)objc_claimAutoreleasedReturnValue();
    v16 = self->_externalString;
    self->_externalString = v15;

    self->_externalIndex = 0x7FFFFFFFFFFFFFFFLL;
    externalIndexToInternalIndexMappingArray = self->_externalIndexToInternalIndexMappingArray;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](externalIndexToInternalIndexMappingArray, "addObject:", v18);

    if (!a3)
      self->_externalIndex = 0;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v19 = v8;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v20)
    {
      v21 = v20;
      v22 = 0;
      v23 = 0;
      v24 = *(_QWORD *)v32;
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v32 != v24)
            objc_enumerationMutation(v19);
          v22 += (int)objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v25), "intValue");
          v26 = self->_externalIndexToInternalIndexMappingArray;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v22);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObject:](v26, "addObject:", v27);

          if (v22 == a3)
            self->_externalIndex = v23 + v25 + 1;
          ++v25;
        }
        while (v21 != v25);
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
        v23 += v25;
      }
      while (v21);
    }

    v5 = v30;
  }

}

- (void)deleteFromInput:(int64_t *)a3 newInput:(id *)a4 inputIndex:(int64_t *)a5
{
  uint64_t v9;
  void *v10;
  int64_t v11;
  int64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  int64_t v17;
  BOOL v18;
  BOOL v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned int v26;
  int64_t v27;
  BOOL v28;
  int64_t v29;
  id *v30;
  void *v31;
  void *v32;
  unsigned int v33;
  int64_t *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t i;
  void *v40;
  id v41;
  uint64_t v42;
  void *v43;
  unsigned int v44;
  char v45;
  BOOL v46;
  void *v47;
  uint64_t v48;
  id *v49;
  int64_t *v50;
  id v51;

  v9 = -[TIMarkedTextBuffer_ja_Romaji externalIndex](self, "externalIndex");
  -[TIMarkedTextBuffer_ja_Romaji externalString](self, "externalString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = (id)objc_msgSend(v10, "copy");

  v11 = -[TIMarkedTextBuffer_ja_Romaji internalIndex](self, "internalIndex");
  if (!v9)
    goto LABEL_41;
  v12 = v11;
  v49 = a4;
  v50 = a3;
  v13 = v9 - 2;
  if (v9 < 2)
  {
    v14 = 0;
  }
  else
  {
    objc_msgSend(v51, "substringWithRange:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v48 = v9 - 1;
  -[NSMutableArray objectAtIndex:](self->_externalIndexToInternalIndexMappingArray, "objectAtIndex:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "unsignedIntValue");

  v17 = v12;
  v18 = v12 == v16;
  v19 = v12 != v16;
  if (v18)
  {
    v22 = v14;
    +[Romakana romajiString:](Romakana, "romajiString:", v14);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray objectAtIndex:](self->_externalIndexToInternalIndexMappingArray, "objectAtIndex:", v13);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v23, "unsignedIntValue");
  }
  else
  {
    if (-[NSMutableArray count](self->_externalIndexToInternalIndexMappingArray, "count") <= (unint64_t)(v9 + 1)
      || (-[NSMutableArray objectAtIndex:](self->_externalIndexToInternalIndexMappingArray, "objectAtIndex:"),
          v20 = (void *)objc_claimAutoreleasedReturnValue(),
          v21 = objc_msgSend(v20, "unsignedIntValue"),
          v20,
          v17 != v21))
    {
      v31 = 0;
      v28 = 0;
      goto LABEL_14;
    }
    v22 = v14;
    objc_msgSend(v51, "substringWithRange:", v9, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[Romakana romajiString:](Romakana, "romajiString:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray objectAtIndex:](self->_externalIndexToInternalIndexMappingArray, "objectAtIndex:", v48);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "unsignedIntValue");

  }
  v27 = v17 - v26;
  if (v17 != v26)
  {
    v14 = v22;
    v28 = v19;
    v29 = v17;
    v30 = v49;
    goto LABEL_16;
  }
  v31 = v24;
  v14 = v22;
  v28 = v19;
LABEL_14:
  v29 = v17;
  v30 = v49;
  if (objc_msgSend(v14, "isEqualToString:", CFSTR("ん")))
  {
    +[Romakana romajiString:](Romakana, "romajiString:", v14);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableArray objectAtIndex:](self->_externalIndexToInternalIndexMappingArray, "objectAtIndex:", v13);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "unsignedIntValue");

    v27 = v29 - v33;
    if (v29 != v33)
    {
LABEL_16:
      v34 = v50;
      if (!v24)
        goto LABEL_28;
      goto LABEL_29;
    }
  }
  else
  {
    v24 = v31;
  }
  v34 = v50;
  if (objc_msgSend(v14, "isEqualToString:", CFSTR("っ")))
  {
    v46 = v28;
    v47 = v14;
    -[TIMarkedTextBuffer_ja_Romaji externalString](self, "externalString");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "substringToIndex:", v48);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = objc_msgSend(v36, "length");
    objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", 3 * v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (v37 >= 1)
    {
      for (i = 0; i != v37; ++i)
      {
        objc_msgSend(v36, "substringWithRange:", i, 1);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        +[Romakana romajiString:](Romakana, "romajiString:", v40);
        v41 = (id)objc_claimAutoreleasedReturnValue();
        if (!v41)
          v41 = v40;
        objc_msgSend(v38, "appendString:", v41);

      }
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v38);
    v42 = objc_claimAutoreleasedReturnValue();

    v24 = (void *)v42;
    v27 = v29;
    v14 = v47;
    v30 = v49;
    v34 = v50;
    v28 = v46;
    if (v42)
      goto LABEL_29;
    goto LABEL_28;
  }
  v27 = 0;
  if (!v24)
  {
LABEL_28:
    -[NSMutableArray objectAtIndex:](self->_externalIndexToInternalIndexMappingArray, "objectAtIndex:", v48);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "unsignedIntValue");

    v27 = v29 - v44;
  }
LABEL_29:
  if (v34)
    *v34 = v27;
  if (a5)
    *a5 = 0x7FFFFFFFFFFFFFFFLL;
  if (v24)
  {
    if (v30)
      *v30 = objc_retainAutorelease(v24);
    v45 = !v28;
    if (!a5)
      v45 = 1;
    if ((v45 & 1) == 0)
      *a5 = v29 - objc_msgSend(v24, "length");
  }

LABEL_41:
}

- (int64_t)internalIndex
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  int64_t v8;

  v3 = -[TIMarkedTextBuffer_ja_Romaji externalIndex](self, "externalIndex");
  -[TIMarkedTextBuffer_ja_Romaji externalIndexToInternalIndexMappingArray](self, "externalIndexToInternalIndexMappingArray");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v3 >= v5)
  {
    -[TIMarkedTextBuffer_ja_Romaji internalString](self, "internalString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "length");
  }
  else
  {
    -[TIMarkedTextBuffer_ja_Romaji externalIndexToInternalIndexMappingArray](self, "externalIndexToInternalIndexMappingArray");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", -[TIMarkedTextBuffer_ja_Romaji externalIndex](self, "externalIndex"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "unsignedIntValue");

  }
  return v8;
}

- (void)setExternalInputIndex:(int64_t)a3
{
  unint64_t v4;
  void *v5;
  unint64_t v6;
  int64_t v7;

  v4 = a3 & ~(a3 >> 63);
  -[TIMarkedTextBuffer_ja_Romaji externalString](self, "externalString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v4 >= v6)
    v7 = v6;
  else
    v7 = v4;
  self->_externalIndex = v7;
}

- (void)clear
{
  void *v3;
  NSString *internalString;
  NSString *externalString;

  -[TIMarkedTextBuffer_ja_Romaji externalIndexToInternalIndexMappingArray](self, "externalIndexToInternalIndexMappingArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  internalString = self->_internalString;
  self->_internalString = (NSString *)&stru_250122EC0;

  externalString = self->_externalString;
  self->_externalString = (NSString *)&stru_250122EC0;

  -[TIMarkedTextBuffer_ja_Romaji setExternalIndex:](self, "setExternalIndex:", 0);
}

- (NSString)internalString
{
  return self->_internalString;
}

- (NSString)externalString
{
  return self->_externalString;
}

- (int64_t)externalIndex
{
  return self->_externalIndex;
}

- (void)setExternalIndex:(int64_t)a3
{
  self->_externalIndex = a3;
}

- (BOOL)hardwareKeyboard
{
  return self->hardwareKeyboard;
}

- (void)setHardwareKeyboard:(BOOL)a3
{
  self->hardwareKeyboard = a3;
}

- (NSMutableArray)externalIndexToInternalIndexMappingArray
{
  return self->_externalIndexToInternalIndexMappingArray;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalIndexToInternalIndexMappingArray, 0);
  objc_storeStrong((id *)&self->_externalString, 0);
  objc_storeStrong((id *)&self->_internalString, 0);
}

@end
