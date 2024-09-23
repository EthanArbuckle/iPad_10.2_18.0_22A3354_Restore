@implementation NSAttributedString(IMAdditions)

- (id)attributedStringByTrimmingCharactersInCharacterSet:()IMAdditions
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v4 = a3;
  objc_msgSend(a1, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invertedSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "rangeOfCharacterFromSet:", v6);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", &stru_1EA0D7620);
  }
  else
  {
    v9 = v7;
    v10 = objc_msgSend(v5, "rangeOfCharacterFromSet:options:", v6, 4);
    objc_msgSend(a1, "attributedSubstringFromRange:", v9, v11 - v9 + v10);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v8;

  return v12;
}

- (uint64_t)attributedStringByTrimmingWhitespaceNewlinesAndObjectReplacementCharacters
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  if (!attributedStringByTrimmingWhitespaceNewlinesAndObjectReplacementCharacters_whitespaceNewlineAndObjectReplacementCharacters)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)objc_msgSend(v2, "mutableCopy");

    objc_msgSend(v3, "addCharactersInString:", CFSTR("\uFFFC"));
    v4 = objc_msgSend(v3, "copy");
    v5 = (void *)attributedStringByTrimmingWhitespaceNewlinesAndObjectReplacementCharacters_whitespaceNewlineAndObjectReplacementCharacters;
    attributedStringByTrimmingWhitespaceNewlinesAndObjectReplacementCharacters_whitespaceNewlineAndObjectReplacementCharacters = v4;

  }
  return objc_msgSend(a1, "attributedStringByTrimmingCharactersInCharacterSet:");
}

+ (id)attributedStringWithTemplateString:()IMAdditions baseAttributes:snippetAttributes:snippets:
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id *v26;
  id v27;
  void *v28;
  id *v30;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v12, v13);
  if (objc_msgSend(v13, "count"))
  {
    v17 = (void *)objc_msgSend(v13, "mutableCopy");
    if (objc_msgSend(v14, "count"))
      objc_msgSend(v17, "addEntriesFromDictionary:", v14);

  }
  else
  {
    v17 = v14;
  }
  v30 = (id *)&a9;
  v18 = v15;
  v19 = v18;
  if (v18)
  {
    v20 = v18;
    do
    {
      objc_msgSend(v16, "string");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "rangeOfString:", CFSTR("%@"));
      v24 = v23;

      if (v22 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v20, v17);
        objc_msgSend(v16, "replaceCharactersInRange:withAttributedString:", v22, v24, v25);

      }
      v26 = v30++;
      v27 = *v26;

      v20 = v27;
    }
    while (v27);
  }
  v28 = (void *)objc_msgSend(v16, "copy");

  return v28;
}

- (id)attributedStringWithDefaultLineSpacing
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v2 = (void *)objc_msgSend(a1, "mutableCopy");
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v3 = objc_msgSend(a1, "length");
  objc_msgSend(MEMORY[0x1E0DC1290], "defaultParagraphStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0DC1178];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73__NSAttributedString_IMAdditions__attributedStringWithDefaultLineSpacing__block_invoke;
  v11[3] = &unk_1EA0C5BD8;
  v6 = v4;
  v12 = v6;
  v7 = v2;
  v13 = v7;
  v14 = &v15;
  objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v5, 0, v3, 0, v11);
  if (!*((_BYTE *)v16 + 24))
    objc_msgSend(v7, "addAttribute:value:range:", v5, v6, 0, v3);
  v8 = v13;
  v9 = v7;

  _Block_object_dispose(&v15, 8);
  return v9;
}

+ (id)safeAttributedStringWithHTML:()IMAdditions attributes:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  void *v31;
  _QWORD v32[4];
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("</?\\s*i?frame[^>]*>"), &stru_1EA0D7620, 1025, 0, objc_msgSend(v6, "length"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("</?\\s*img[^>]*>"), &stru_1EA0D7620, 1025, 0, objc_msgSend(v7, "length"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = v8;
  objc_msgSend(v8, "dataUsingEncoding:", 10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc(MEMORY[0x1E0CB3498]);
  v36 = *MEMORY[0x1E0DC1118];
  v37[0] = *MEMORY[0x1E0DC1148];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithData:options:documentAttributes:error:", v9, v11, 0, 0);
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  v14 = objc_msgSend(v13, "length");
  objc_msgSend(v13, "string");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "rangeOfString:options:range:", CFSTR("\u2028"), 0, 0, v14);
  v18 = v17;

  if (v16 != 0x7FFFFFFFFFFFFFFFLL && v13)
  {
    do
    {
      objc_msgSend(v13, "replaceCharactersInRange:withString:", v16, v18, CFSTR("\n"));
      v19 = v16 + 1;
      if (v14 == v19)
        break;
      objc_msgSend(v13, "string");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v20, "rangeOfString:options:range:", CFSTR("\u2028"), 0, v19, v14 - v19);
      v18 = v21;

    }
    while (v16 != 0x7FFFFFFFFFFFFFFFLL);
  }
  v22 = objc_alloc(MEMORY[0x1E0C99E20]);
  v35 = *MEMORY[0x1E0DC1178];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v22, "initWithArray:", v23);

  v25 = objc_msgSend(v13, "length");
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __75__NSAttributedString_IMAdditions__safeAttributedStringWithHTML_attributes___block_invoke;
  v32[3] = &unk_1EA0C5C00;
  v26 = v13;
  v33 = v26;
  v34 = v24;
  v27 = v24;
  objc_msgSend(v26, "enumerateAttributesInRange:options:usingBlock:", 0, v25, 0, v32);
  if (v5)
    objc_msgSend(v26, "addAttributes:range:", v5, 0, objc_msgSend(v26, "length"));
  v28 = v34;
  v29 = v26;

  return v29;
}

@end
