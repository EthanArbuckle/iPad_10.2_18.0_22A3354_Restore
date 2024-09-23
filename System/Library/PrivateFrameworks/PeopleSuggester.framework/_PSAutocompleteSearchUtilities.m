@implementation _PSAutocompleteSearchUtilities

+ (_NSRange)rangeForSearchTerm:(id)a3 inTarget:(id)a4 tokenizedByCharacterSet:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSUInteger v24;
  NSUInteger v25;
  NSUInteger v26;
  NSUInteger v27;
  id v28;
  NSUInteger v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;
  _NSRange result;

  v36 = *MEMORY[0x1E0C80C00];
  v30 = a3;
  v7 = a4;
  objc_msgSend(v7, "componentsSeparatedByCharactersInSet:", a5);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  v10 = 0x7FFFFFFFFFFFFFFFLL;
  if (v9)
  {
    v11 = v9;
    v28 = v8;
    v29 = 0;
    v12 = *(_QWORD *)v32;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v32 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringByTrimmingCharactersInSet:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = objc_msgSend(v7, "rangeOfString:", v16);
        if (v17 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v19 = v17;
          if (v17 + v18 <= (unint64_t)objc_msgSend(v7, "length"))
          {
            objc_msgSend(v7, "substringWithRange:", v19, objc_msgSend(v7, "length") - v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "stringByTrimmingCharactersInSet:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "rangeOfString:options:", v30, 393);
            v29 = v24;

            if (v23 != 0x7FFFFFFFFFFFFFFFLL)
            {

              v10 = v23;
              v8 = v28;
              goto LABEL_14;
            }
            v8 = v28;
          }
        }

      }
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      if (v11)
        continue;
      break;
    }
    v10 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_14:
    v25 = v29;
  }
  else
  {
    v25 = 0;
  }

  v26 = v10;
  v27 = v25;
  result.length = v27;
  result.location = v26;
  return result;
}

+ (id)emojiCharacterSet
{
  return (id)CEMCreateEmojiCharacterSet();
}

+ (BOOL)searchString:(id)a3 containsOnlyCharactersInSet:(id)a4
{
  id v5;
  id v6;
  unint64_t v7;
  char v8;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "length"))
  {
    v7 = 0;
    do
    {
      v8 = objc_msgSend(v6, "characterIsMember:", objc_msgSend(v5, "characterAtIndex:", v7));
      if ((v8 & 1) == 0)
        break;
      ++v7;
    }
    while (objc_msgSend(v5, "length") > v7);
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

@end
