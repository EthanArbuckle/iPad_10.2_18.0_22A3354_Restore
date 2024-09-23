@implementation SIRINLUPrintUtils

+ (id)indentLines:(id)a3 numSpaces:(int64_t)a4
{
  id v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = a3;
  v6 = a4 + 1;
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", a4 + 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendString:", CFSTR("\n"));
  if ((a4 & 0x8000000000000000) == 0)
  {
    do
    {
      objc_msgSend(v7, "appendString:", CFSTR(" "));
      --v6;
    }
    while (v6);
  }
  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("\n"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsJoinedByString:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByTrimmingCharactersInSet:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v7, "substringFromIndex:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("%@%@"), v13, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)indentArray:(id)a3 numSpaces:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __CFString *v7;
  uint64_t v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = a3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    v7 = CFSTR("[\n");
    do
    {
      v8 = 0;
      v9 = v7;
      do
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v8), "description");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[SIRINLUPrintUtils indentLines:numSpaces:](SIRINLUPrintUtils, "indentLines:numSpaces:", v10, 2);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n"), v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFString stringByAppendingString:](v9, "stringByAppendingString:", v12);
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

        ++v8;
        v9 = v7;
      }
      while (v5 != v8);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v5);
  }
  else
  {
    v7 = CFSTR("[\n");
  }
  -[__CFString stringByAppendingString:](v7, "stringByAppendingString:", CFSTR("]"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[SIRINLUPrintUtils indentLines:numSpaces:](SIRINLUPrintUtils, "indentLines:numSpaces:", v13, a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end
