@implementation MCSyntheticInput

- (MCSyntheticInput)init
{
  return -[MCSyntheticInput initWithCommittedText:syllables:](self, "initWithCommittedText:syllables:", &stru_1EA1081D0, MEMORY[0x1E0C9AA60]);
}

- (MCSyntheticInput)initWithCommittedText:(id)a3 syllables:(id)a4
{
  return -[MCSyntheticInput initWithCommittedText:syllables:useSubInputsAsSearchString:](self, "initWithCommittedText:syllables:useSubInputsAsSearchString:", a3, a4, 0);
}

- (MCSyntheticInput)initWithCommittedText:(id)a3 syllables:(id)a4 useSubInputsAsSearchString:(BOOL)a5
{
  id v8;
  id v9;
  MCSyntheticInput *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MCSyntheticInput;
  v10 = -[MCKeyboardInput init](&v15, sel_init);
  if (v10)
  {
    if (v8)
      v11 = (__CFString *)objc_msgSend(v8, "copy");
    else
      v11 = &stru_1EA1081D0;
    objc_storeStrong((id *)&v10->_committedText, v11);
    if (v8)

    if (v9)
      v12 = (void *)objc_msgSend(v9, "copy");
    else
      v12 = (void *)MEMORY[0x1E0C9AA60];
    objc_storeStrong((id *)&v10->_syllables, v12);
    if (v9)

    -[MCSyntheticInput text](v10, "text");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_cursorIndex = objc_msgSend(v13, "length");

    v10->_includeSuffixAsSearchString = 0;
    v10->_useSubInputsAsSearchString = a5;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MCSyntheticInput;
  v5 = -[MCKeyboardInput copyWithZone:](&v11, sel_copyWithZone_);
  if (v5)
  {
    v6 = -[NSString copyWithZone:](self->_committedText, "copyWithZone:", a3);
    v7 = (void *)v5[5];
    v5[5] = v6;

    v8 = -[NSArray copyWithZone:](self->_syllables, "copyWithZone:", a3);
    v9 = (void *)v5[6];
    v5[6] = v8;

    v5[7] = self->_cursorIndex;
    *((_BYTE *)v5 + 32) = self->_includeSuffixAsSearchString;
    *((_BYTE *)v5 + 33) = self->_useSubInputsAsSearchString;
  }
  return v5;
}

- (id)shortDescriptionExcludingSubInputs
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MCSyntheticInput text](self, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("\"%@\" inputIndex=%lu"), v4, -[MCSyntheticInput cursorIndex](self, "cursorIndex"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (MCSyntheticInput)syntheticInputWithCommittedText:(id)a3 syllables:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  MCSyntheticInput *v14;
  MCSyntheticInput *v15;

  v6 = a3;
  v7 = a4;
  v8 = (_QWORD *)-[MCSyntheticInput copy](self, "copy");
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    v10 = (void *)v8[5];
    v8[5] = v9;

    v11 = objc_msgSend(v7, "copy");
    v12 = (void *)v8[6];
    v8[6] = v11;

    objc_msgSend(v8, "text");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v8[7] = objc_msgSend(v13, "length");

    v14 = v8;
  }
  else
  {
    v14 = objc_alloc_init(MCSyntheticInput);
  }
  v15 = v14;

  return v15;
}

- (MCSyntheticInput)syntheticInputWithCursorIndex:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  _QWORD *v7;
  void *v8;
  unint64_t v9;
  MCSyntheticInput *v10;
  MCSyntheticInput *v11;

  -[MCSyntheticInput text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  v7 = (_QWORD *)-[MCSyntheticInput copy](self, "copy");
  v8 = v7;
  if (v7)
  {
    if (v6 >= a3)
      v9 = a3;
    else
      v9 = v6;
    v7[7] = v9;
    v10 = v7;
  }
  else
  {
    v10 = objc_alloc_init(MCSyntheticInput);
  }
  v11 = v10;

  return v11;
}

- (NSString)uncommittedText
{
  void *v2;
  void *v3;

  -[MCSyntheticInput syllables](self, "syllables");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsJoinedByString:", &stru_1EA1081D0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)text
{
  void *v3;
  void *v4;
  void *v5;

  -[MCSyntheticInput committedText](self, "committedText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCSyntheticInput uncommittedText](self, "uncommittedText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (int)syllableIndex:(int *)a3
{
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  int result;

  v5 = -[MCSyntheticInput cursorIndex](self, "cursorIndex");
  -[MCSyntheticInput committedText](self, "committedText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v5 <= v7)
    goto LABEL_6;
  -[MCSyntheticInput committedText](self, "committedText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  -[MCSyntheticInput syllables](self, "syllables");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    v12 = 0;
    while (1)
    {
      -[MCSyntheticInput syllables](self, "syllables");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "length") + v9;
      v16 = -[MCSyntheticInput cursorIndex](self, "cursorIndex");

      if (v15 >= v16)
        break;
      -[MCSyntheticInput syllables](self, "syllables");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectAtIndexedSubscript:", v12);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v9 += objc_msgSend(v18, "length");

      ++v12;
      -[MCSyntheticInput syllables](self, "syllables");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "count");

      if (v20 <= v12)
        goto LABEL_6;
    }
    if (!a3 || -[MCSyntheticInput cursorIndex](self, "cursorIndex") <= v9)
      return v12;
    result = -[MCSyntheticInput cursorIndex](self, "cursorIndex") - v9;
  }
  else
  {
LABEL_6:
    result = -1;
    LODWORD(v12) = -1;
    if (!a3)
      return result;
  }
  *a3 = result;
  return v12;
}

- (id)externalSuffix:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  int v29;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v29 = 0;
  v6 = -[MCSyntheticInput cursorIndex](self, "cursorIndex");
  -[MCSyntheticInput committedText](self, "committedText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v6 <= v8)
  {
    -[MCSyntheticInput committedText](self, "committedText");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "substringFromIndex:", -[MCSyntheticInput cursorIndex](self, "cursorIndex"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "appendString:", v11);
    v9 = 0;
  }
  else
  {
    v9 = -[MCSyntheticInput syllableIndex:](self, "syllableIndex:", &v29);
    if ((v9 & 0x80000000) != 0)
      goto LABEL_15;
  }
  -[MCSyntheticInput syllables](self, "syllables");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13 > v9)
  {
    v14 = v9;
    -[MCSyntheticInput syllables](self, "syllables");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    if (v16 > v14)
    {
      v17 = v14;
      do
      {
        if ((uint64_t)v17 > (uint64_t)v14)
          objc_msgSend(v5, "appendString:", v4);
        v18 = v29;
        if (v29 >= 1
          && (-[MCSyntheticInput syllables](self, "syllables"),
              v19 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v19, "objectAtIndexedSubscript:", v17),
              v20 = (void *)objc_claimAutoreleasedReturnValue(),
              v21 = objc_msgSend(v20, "length"),
              v20,
              v19,
              v21 >= v18))
        {
          -[MCSyntheticInput syllables](self, "syllables");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectAtIndexedSubscript:", v17);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "substringFromIndex:", v29);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v5, "appendString:", v22);
          v29 = 0;
        }
        else
        {
          -[MCSyntheticInput syllables](self, "syllables");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectAtIndexedSubscript:", v17);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "appendString:", v23);

        }
        ++v17;
        -[MCSyntheticInput syllables](self, "syllables");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "count");

      }
      while (v27 > v17);
    }
  }
LABEL_15:

  return v5;
}

- (NSString)committedText
{
  return self->_committedText;
}

- (NSArray)syllables
{
  return self->_syllables;
}

- (unint64_t)cursorIndex
{
  return self->_cursorIndex;
}

- (BOOL)includeSuffixAsSearchString
{
  return self->_includeSuffixAsSearchString;
}

- (void)setIncludeSuffixAsSearchString:(BOOL)a3
{
  self->_includeSuffixAsSearchString = a3;
}

- (BOOL)useSubInputsAsSearchString
{
  return self->_useSubInputsAsSearchString;
}

- (void)setUseSubInputsAsSearchString:(BOOL)a3
{
  self->_useSubInputsAsSearchString = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syllables, 0);
  objc_storeStrong((id *)&self->_committedText, 0);
}

@end
