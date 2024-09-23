@implementation UIDictationWordsSeeker

- (UIDictationWordsSeeker)initWithString:(id)a3 substring:(id)a4 reverse:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  UIDictationWordsSeeker *v10;
  UIDictationWordsSeeker *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)UIDictationWordsSeeker;
  v10 = -[UIDictationWordsSeeker init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    -[UIDictationWordsSeeker setReverse:](v10, "setReverse:", v5);
    objc_msgSend((id)objc_opt_class(), "_prepareAllWordsWithString:reverse:", v8, v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDictationWordsSeeker setTargetStringWords:](v11, "setTargetStringWords:", v12);

    -[UIDictationWordsSeeker setTargetString:](v11, "setTargetString:", v8);
    objc_msgSend((id)objc_opt_class(), "_prepareAllWordsWithString:reverse:", v9, v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDictationWordsSeeker setTargetSubstringWords:](v11, "setTargetSubstringWords:", v13);

    -[UIDictationWordsSeeker setTargetSubstring:](v11, "setTargetSubstring:", v9);
  }

  return v11;
}

+ (id)_prepareAllWordsWithString:(id)a3 reverse:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v4 = a4;
  v5 = (void *)MEMORY[0x1E0C99DE8];
  v6 = a3;
  objc_msgSend(v5, "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "length");
  if (v4)
    v9 = 259;
  else
    v9 = 3;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __61__UIDictationWordsSeeker__prepareAllWordsWithString_reverse___block_invoke;
  v13[3] = &unk_1E16D5580;
  v14 = v7;
  v10 = v7;
  objc_msgSend(v6, "enumerateSubstringsInRange:options:usingBlock:", 0, v8, v9, v13);

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void __61__UIDictationWordsSeeker__prepareAllWordsWithString_reverse___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  UIDictationSubstring *v15;
  id v16;

  v16 = a2;
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringByTrimmingCharactersInSet:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "length");

  if (v13)
  {
    v14 = *(void **)(a1 + 32);
    v15 = -[UIDictationSubstring initWithString:range:enclosingRange:]([UIDictationSubstring alloc], "initWithString:range:enclosingRange:", v16, a3, a4, a5, a6);
    objc_msgSend(v14, "insertObject:atIndex:", v15, 0);

  }
}

+ (BOOL)_isSubstringArray:(id)a3 equalToSubstringArray:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  BOOL v16;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "count");
  if (v7 == objc_msgSend(v6, "count"))
  {
    v8 = objc_msgSend(v5, "count");
    v9 = v8 - 1;
    if (v8 < 1)
    {
      v16 = 1;
    }
    else
    {
      v10 = 0;
      do
      {
        objc_msgSend(v5, "objectAtIndex:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "string");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectAtIndex:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "string");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v12, "compare:options:", v14, 129);
        v16 = v15 == 0;

        if (v15)
          break;
      }
      while (v9 != v10++);
    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)validateWordBoundariesInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  void *v7;
  uint64_t v8;
  _BOOL4 v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  NSUInteger v17;
  NSUInteger v18;

  length = a3.length;
  location = a3.location;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDictationWordsSeeker targetString](self, "targetString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");
  v9 = -[UIDictationWordsSeeker reverse](self, "reverse");
  v15[0] = MEMORY[0x1E0C809B0];
  if (v9)
    v10 = 259;
  else
    v10 = 3;
  v15[1] = 3221225472;
  v15[2] = __56__UIDictationWordsSeeker_validateWordBoundariesInRange___block_invoke;
  v15[3] = &unk_1E16D55A8;
  v17 = location;
  v18 = length;
  v16 = v6;
  v11 = v6;
  objc_msgSend(v7, "enumerateSubstringsInRange:options:usingBlock:", 0, v8, v10, v15);
  v12 = (void *)objc_opt_class();
  -[UIDictationWordsSeeker targetSubstringWords](self, "targetSubstringWords");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v12) = objc_msgSend(v12, "_isSubstringArray:equalToSubstringArray:", v11, v13);

  return (char)v12;
}

void __56__UIDictationWordsSeeker_validateWordBoundariesInRange___block_invoke(uint64_t a1, void *a2, NSUInteger a3, NSUInteger a4, uint64_t a5, uint64_t a6)
{
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  UIDictationSubstring *v15;
  id v16;
  NSRange v17;

  v16 = a2;
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringByTrimmingCharactersInSet:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "length");

  if (v13)
  {
    v17.location = a3;
    v17.length = a4;
    if (NSIntersectionRange(*(NSRange *)(a1 + 40), v17).length)
    {
      v14 = *(void **)(a1 + 32);
      v15 = -[UIDictationSubstring initWithString:range:enclosingRange:]([UIDictationSubstring alloc], "initWithString:range:enclosingRange:", v16, a3, a4, a5, a6);
      objc_msgSend(v14, "insertObject:atIndex:", v15, 0);

    }
  }

}

- (_NSRange)_search
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSUInteger length;
  NSUInteger location;
  NSUInteger v24;
  NSUInteger v25;
  NSUInteger v26;
  NSUInteger v27;
  NSRange v28;
  NSUInteger v29;
  NSUInteger v30;
  uint64_t v31;
  uint64_t v32;
  NSRange v33;
  _NSRange result;
  NSRange v35;

  -[UIDictationWordsSeeker targetStringWords](self, "targetStringWords");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  v32 = v4 - 1;
  if (v4 - 1 < 0)
  {
LABEL_12:
    length = 0;
    location = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    while (1)
    {
      -[UIDictationWordsSeeker targetSubstringWords](self, "targetSubstringWords");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "count");

      v31 = v6 - 1;
      if (v6 - 1 < 0)
        break;
      v7 = 0;
      v8 = 0;
      v9 = 0;
      while (1)
      {
        v10 = v31 + v7;
        v11 = v32 + v7;
        -[UIDictationWordsSeeker targetStringWords](self, "targetStringWords", v31);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectAtIndex:", v32 + v7);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "string");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        -[UIDictationWordsSeeker targetSubstringWords](self, "targetSubstringWords");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectAtIndex:", v10);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "string");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v14, "compare:options:", v17, 129))
          break;
        if (!v8)
        {
          -[UIDictationWordsSeeker targetStringWords](self, "targetStringWords");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectAtIndex:", v11);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

        }
        -[UIDictationWordsSeeker targetStringWords](self, "targetStringWords");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectAtIndex:", v11);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11 >= 1)
        {
          --v7;
          v9 = v20;
          if (v10 > 0)
            continue;
        }
        goto LABEL_14;
      }

      if (v32-- <= 0)
        goto LABEL_12;
    }
    v20 = 0;
    v8 = 0;
LABEL_14:
    v24 = objc_msgSend(v8, "range", v31);
    v26 = v25;
    v35.location = objc_msgSend(v20, "range");
    v35.length = v27;
    v33.location = v24;
    v33.length = v26;
    v28 = NSUnionRange(v33, v35);
    location = v28.location;
    length = v28.length;

  }
  v29 = location;
  v30 = length;
  result.length = v30;
  result.location = v29;
  return result;
}

- (_NSRange)rangeOfSubstring:(id)a3 fullString:(id)a4 reverse:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSUInteger v12;
  NSUInteger v13;
  _NSRange result;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend((id)objc_opt_class(), "_prepareAllWordsWithString:reverse:", v8, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDictationWordsSeeker setTargetStringWords:](self, "setTargetStringWords:", v10);

  -[UIDictationWordsSeeker setTargetString:](self, "setTargetString:", v8);
  objc_msgSend((id)objc_opt_class(), "_prepareAllWordsWithString:reverse:", v9, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDictationWordsSeeker setTargetSubstringWords:](self, "setTargetSubstringWords:", v11);

  -[UIDictationWordsSeeker setTargetSubstring:](self, "setTargetSubstring:", v9);
  v12 = -[UIDictationWordsSeeker _search](self, "_search");
  result.length = v13;
  result.location = v12;
  return result;
}

- (NSArray)targetStringWords
{
  return self->_targetStringWords;
}

- (void)setTargetStringWords:(id)a3
{
  objc_storeStrong((id *)&self->_targetStringWords, a3);
}

- (NSArray)targetSubstringWords
{
  return self->_targetSubstringWords;
}

- (void)setTargetSubstringWords:(id)a3
{
  objc_storeStrong((id *)&self->_targetSubstringWords, a3);
}

- (NSString)targetString
{
  return self->_targetString;
}

- (void)setTargetString:(id)a3
{
  objc_storeStrong((id *)&self->_targetString, a3);
}

- (NSString)targetSubstring
{
  return self->_targetSubstring;
}

- (void)setTargetSubstring:(id)a3
{
  objc_storeStrong((id *)&self->_targetSubstring, a3);
}

- (BOOL)reverse
{
  return self->_reverse;
}

- (void)setReverse:(BOOL)a3
{
  self->_reverse = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetSubstring, 0);
  objc_storeStrong((id *)&self->_targetString, 0);
  objc_storeStrong((id *)&self->_targetSubstringWords, 0);
  objc_storeStrong((id *)&self->_targetStringWords, 0);
}

@end
