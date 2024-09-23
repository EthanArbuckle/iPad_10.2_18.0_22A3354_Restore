@implementation NSAttributedString(IC_UI)

- (BOOL)ic_containsBlockAttachmentsInRange:()IC_UI
{
  uint64_t v7;
  _BOOL8 v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  if (!objc_msgSend(a1, "containsAttachmentsInRange:"))
    return 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v7 = *MEMORY[0x1E0DC10F8];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64__NSAttributedString_IC_UI__ic_containsBlockAttachmentsInRange___block_invoke;
  v10[3] = &unk_1E5C1EEC8;
  v10[4] = &v11;
  objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v7, a3, a4, 0, v10);
  v8 = *((_BYTE *)v12 + 24) != 0;
  _Block_object_dispose(&v11, 8);
  return v8;
}

+ (id)ic_blockQuoteMenuItemAttributedString
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v0 = objc_alloc(MEMORY[0x1E0CB3778]);
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Block Quote"), CFSTR("Block Quote"), 0, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v0, "initWithString:", v1);

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR(" "));
  objc_msgSend(v2, "insertAttributedString:atIndex:", v3, 0);

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", CFSTR("|"));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0DC1140];
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0DC1140]);

  objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E5C72030, *MEMORY[0x1E0DC1108]);
  objc_msgSend(MEMORY[0x1E0DC1350], "ic_preferredFontForBodyText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ic_fontWithSymbolicBoldTrait");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ic_fontWithRoundedDesign");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0DC1138]);
  objc_msgSend(v4, "addAttributes:range:", v5, 0, 1);
  objc_msgSend(v2, "insertAttributedString:atIndex:", v4, 0);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, v7);

  objc_msgSend(v2, "addAttributes:range:", v11, 1, objc_msgSend(v2, "length") - 1);
  v13 = (void *)objc_msgSend(v2, "copy");

  return v13;
}

+ (id)ic_attributedStringWithString:()IC_UI font:
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)MEMORY[0x1E0CB3498];
  v6 = a4;
  v7 = a3;
  v8 = [v5 alloc];
  v12 = *MEMORY[0x1E0DC1138];
  v13[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(v8, "initWithString:attributes:", v7, v9);
  return v10;
}

- (uint64_t)ic_rangeForAttachment:()IC_UI withTextAttachment:
{
  uint64_t v5;
  id v6;
  void *v7;
  id v9;

  v9 = 0;
  v5 = objc_msgSend(a1, "ic_rangeForBaseAttachment:withTextAttachment:", a3, &v9);
  v6 = v9;
  v7 = v6;
  if (a4 && v6)
  {
    objc_opt_class();
    ICCheckedDynamicCast();
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (uint64_t)ic_rangeForInlineAttachment:()IC_UI withTextAttachment:
{
  uint64_t v5;
  id v6;
  void *v7;
  id v9;

  v9 = 0;
  v5 = objc_msgSend(a1, "ic_rangeForBaseAttachment:withTextAttachment:", a3, &v9);
  v6 = v9;
  v7 = v6;
  if (a4 && v6)
  {
    objc_opt_class();
    ICCheckedDynamicCast();
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (uint64_t)ic_rangeForBaseAttachment:()IC_UI withTextAttachment:
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  const char *v25;
  __int128 v26;

  v6 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3010000000;
  v25 = "";
  v26 = xmmword_1ACA582A0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__64;
  v20 = __Block_byref_object_dispose__64;
  v21 = 0;
  v7 = objc_msgSend(a1, "length");
  v8 = *MEMORY[0x1E0DC10F8];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __74__NSAttributedString_IC_UI__ic_rangeForBaseAttachment_withTextAttachment___block_invoke;
  v12[3] = &unk_1E5C23538;
  v9 = v6;
  v13 = v9;
  v14 = &v22;
  v15 = &v16;
  objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v8, 0, v7, 0, v12);
  if (a4)
    *a4 = objc_retainAutorelease((id)v17[5]);
  v10 = v23[4];

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

- (id)ic_stringByTrimmingLeadingTrailingWhitespace
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;

  v1 = a1;
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "rangeOfCharacterFromSet:", v2);
  v6 = v5;

  if (v6)
    v7 = v4 == 0;
  else
    v7 = 0;
  if (v7)
  {
    do
    {
      v8 = v1;
      v1 = (id)objc_msgSend(v1, "mutableCopy");

      objc_msgSend(v1, "replaceCharactersInRange:withString:", 0, v6, &stru_1E5C2F8C0);
      objc_msgSend(v1, "string");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = objc_msgSend(v9, "rangeOfCharacterFromSet:", v2);
      v6 = v11;

    }
    while (v6 && !v10);
  }
  objc_msgSend(v1, "string");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "rangeOfCharacterFromSet:options:", v2, 4);
  v15 = v14;

  if (v15)
  {
    while (v13 + v15 == objc_msgSend(v1, "length"))
    {
      v16 = (id)objc_msgSend(v1, "mutableCopy");

      objc_msgSend(v16, "replaceCharactersInRange:withString:", v13, v15, &stru_1E5C2F8C0);
      objc_msgSend(v16, "string");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = objc_msgSend(v17, "rangeOfCharacterFromSet:options:", v2, 4);
      v15 = v18;

      v1 = v16;
      if (!v15)
        goto LABEL_13;
    }
  }
  v16 = v1;
LABEL_13:

  return v16;
}

- (id)ic_stringWithoutAttachments
{
  void *v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithAttributedString:", a1);
  v12 = 0;
  v13 = 0;
  v3 = objc_msgSend(a1, "length");
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = 0;
    v7 = *MEMORY[0x1E0DC10F8];
    do
    {
      objc_msgSend(a1, "attribute:atIndex:effectiveRange:", v7, v6, &v12);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v12;
      v9 = v13;
      if (v8)
      {
        objc_msgSend(v2, "deleteCharactersInRange:", v12 - v5, v13);
        v5 += v13;
      }
      v6 = v9 + v10;

    }
    while (v6 < v4);
  }
  return v2;
}

- (id)ic_attributesByHighlightingAttributes:()IC_UI withHighlightColor:attributeName:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v13;
  void *v15;

  v7 = a4;
  v8 = a5;
  if (a3)
    v9 = a3;
  else
    v9 = (void *)MEMORY[0x1E0C9AA70];
  v10 = (void *)objc_msgSend(v9, "mutableCopy");
  v11 = v10;
  if ((id)*MEMORY[0x1E0DC1140] == v8 || *MEMORY[0x1E0DC1100] == (_QWORD)v8)
  {
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v7, v8);
  }
  else
  {
    v13 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[NSAttributedString(IC_UI) ic_attributesByHighlightingAttributes:withHighlightColor:attributeName:].cold.1((uint64_t)v8, v13);

  }
  v15 = (void *)objc_msgSend(v11, "copy");

  return v15;
}

- (uint64_t)ic_writingDirectionAtIndex:()IC_UI
{
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC1178], a3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "baseWritingDirection");
  if (v6 == -1)
  {
    v7 = objc_alloc(MEMORY[0x1E0CB3730]);
    v15[0] = *MEMORY[0x1E0CB2CF8];
    v8 = v15[0];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v7, "initWithTagSchemes:options:", v9, 0);

    objc_msgSend(a1, "string");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "ic_substringWithRange:", a3, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setString:", v12);

    objc_msgSend(v10, "tagAtIndex:scheme:tokenRange:sentenceRange:", 0, v8, 0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(MEMORY[0x1E0DC1290], "defaultWritingDirectionForLanguage:", v13);

  }
  return v6;
}

- (id)_ic_attributedStringByHighlightingRegexMatches:()IC_UI withHighlightColor:attributeName:
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "count"))
  {
    v11 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    v12 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __109__NSAttributedString_IC_UI___ic_attributedStringByHighlightingRegexMatches_withHighlightColor_attributeName___block_invoke;
    v22[3] = &unk_1E5C23560;
    v23 = v11;
    v13 = v11;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v22);
    v14 = (void *)objc_msgSend(a1, "mutableCopy");
    objc_msgSend(a1, "ic_attributesByHighlightingAttributes:withHighlightColor:attributeName:", MEMORY[0x1E0C9AA70], v9, v10);
    v19[0] = v12;
    v19[1] = 3221225472;
    v19[2] = __109__NSAttributedString_IC_UI___ic_attributedStringByHighlightingRegexMatches_withHighlightColor_attributeName___block_invoke_2;
    v19[3] = &unk_1E5C23588;
    v20 = v14;
    v21 = (id)objc_claimAutoreleasedReturnValue();
    v15 = v21;
    v16 = v14;
    objc_msgSend(v13, "enumerateRangesUsingBlock:", v19);
    v17 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithAttributedString:", v16);

  }
  else
  {
    v17 = a1;
  }

  return v17;
}

- (id)ic_attributedStringByHighlightingRegex:()IC_UI withHighlightColor:attributeName:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(a1, "string");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "matchesInString:options:range:", v11, 0, 0, objc_msgSend(a1, "length"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_ic_attributedStringByHighlightingRegexMatches:withHighlightColor:attributeName:", v12, v9, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (uint64_t)ic_attributedStringByHighlightingRegex:()IC_UI withHighlightColor:
{
  return objc_msgSend(a1, "ic_attributedStringByHighlightingRegex:withHighlightColor:attributeName:", a3, a4, *MEMORY[0x1E0DC1140]);
}

- (uint64_t)ic_attributedStringByHighlightingRegexFinderMatches:()IC_UI withHighlightColor:
{
  return objc_msgSend(a1, "ic_attributedStringByHighlightingRegexFinderMatches:withHighlightColor:attributeName:", a3, a4, *MEMORY[0x1E0DC1140]);
}

- (id)ic_attributedStringByHighlightingRegexFinderMatches:()IC_UI withHighlightColor:attributeName:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(a1, "string");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "matchesInDocumentWithPerTokenFallback:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_ic_attributedStringByHighlightingRegexMatches:withHighlightColor:attributeName:", v13, v9, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)ic_itemProviderDataForUTI:()IC_UI
{
  id v4;
  dispatch_semaphore_t v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  NSObject *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__64;
  v17 = __Block_byref_object_dispose__64;
  v18 = 0;
  v5 = dispatch_semaphore_create(0);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __55__NSAttributedString_IC_UI__ic_itemProviderDataForUTI___block_invoke;
  v10[3] = &unk_1E5C235B0;
  v12 = &v13;
  v6 = v5;
  v11 = v6;
  v7 = (id)objc_msgSend(a1, "loadDataWithTypeIdentifier:forItemProviderCompletionHandler:", v4, v10);
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (id)ic_attributedStringByFlatteningInlineAttachmentsWithContext:()IC_UI formatter:
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __99__NSAttributedString_IC_UI__ic_attributedStringByFlatteningInlineAttachmentsWithContext_formatter___block_invoke_2;
  v10[3] = &unk_1E5C23618;
  v11 = v6;
  v7 = v6;
  objc_msgSend(a1, "ic_attributedStringByFlatteningInlineAttachmentsWithContext:flattenUnsupportedInlineAttachmentsOnly:updateRangeValueToObjectMapBlock:replacementAttributedStringBlock:", a3, 0, &__block_literal_global_78, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (uint64_t)ic_attributedStringByFlatteningCalculateAttachmentsWithContext:()IC_UI
{
  return objc_msgSend(a1, "ic_attributedStringByFlatteningInlineAttachmentsWithContext:flattenUnsupportedInlineAttachmentsOnly:updateRangeValueToObjectMapBlock:replacementAttributedStringBlock:", a3, 0, &__block_literal_global_37, &__block_literal_global_38_1);
}

- (id)ic_attributedStringByCopyingInlineAttachmentsAndUpdatingChangeCountWithContext:()IC_UI
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, uint64_t, uint64_t);
  void *v15;
  id v16;
  id v17;

  v4 = a3;
  v5 = (void *)objc_msgSend(a1, "mutableCopy");
  v6 = *MEMORY[0x1E0DC10F8];
  v7 = objc_msgSend(a1, "length");
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __108__NSAttributedString_IC_UI__ic_attributedStringByCopyingInlineAttachmentsAndUpdatingChangeCountWithContext___block_invoke;
  v15 = &unk_1E5C22B38;
  v16 = v4;
  v17 = v5;
  v8 = v5;
  v9 = v4;
  objc_msgSend(v8, "enumerateAttribute:inRange:options:usingBlock:", v6, 0, v7, 0, &v12);
  v10 = (void *)objc_msgSend(v8, "copy", v12, v13, v14, v15);

  return v10;
}

- (uint64_t)ic_containsTextAttachment:()IC_UI
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v5 = objc_msgSend(a1, "ic_range");
  v7 = v6;
  v8 = *MEMORY[0x1E0DC10F8];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __55__NSAttributedString_IC_UI__ic_containsTextAttachment___block_invoke;
  v12[3] = &unk_1E5C22AE8;
  v9 = v4;
  v13 = v9;
  v14 = &v15;
  objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v8, v5, v7, 0, v12);
  v10 = *((unsigned __int8 *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return v10;
}

- (void)ic_attributesByHighlightingAttributes:()IC_UI withHighlightColor:attributeName:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1AC7A1000, a2, OS_LOG_TYPE_ERROR, "Invalid highlighting attribute: %@", (uint8_t *)&v2, 0xCu);
}

@end
