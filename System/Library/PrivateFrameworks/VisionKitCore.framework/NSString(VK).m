@implementation NSString(VK)

- (uint64_t)vk_range
{
  objc_msgSend(a1, "length");
  return 0;
}

- (id)vk_hexCodes
{
  id v2;
  unint64_t v3;
  uint64_t v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  if (objc_msgSend(a1, "length"))
  {
    v3 = 0;
    v4 = *MEMORY[0x1E0C99890];
    do
    {
      v5 = objc_msgSend(a1, "characterAtIndex:", v3);
      objc_msgSend(a1, "vk_substringWithRange:", v3, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringByApplyingTransform:reverse:", v4, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "appendFormat:", CFSTR("%lu: U+%04x %@\n"), v3, v5, v7);

      ++v3;
    }
    while (v3 < objc_msgSend(a1, "length"));
  }
  v8 = (void *)objc_msgSend(v2, "copy");

  return v8;
}

+ (uint64_t)vk_NSAttachmentCharacterString
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%C"), 65532);
}

- (id)vk_md5
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "dataUsingEncoding:", 4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "vk_md5");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)vk_htmlStringEscapingQuotesAndLineBreaks
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = objc_msgSend(&unk_1E9495560, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v12;
    do
    {
      v5 = 0;
      v6 = v1;
      do
      {
        if (*(_QWORD *)v12 != v4)
          objc_enumerationMutation(&unk_1E9495560);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v5);
        objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", v8, v9);
        v1 = (id)objc_claimAutoreleasedReturnValue();

        ++v5;
        v6 = v1;
      }
      while (v3 != v5);
      v3 = objc_msgSend(&unk_1E9495560, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v3);
  }
  return v1;
}

- (id)vk_trimmedString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stringByTrimmingCharactersInSet:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (__CFString)vk_trailingTrimmedString
{
  void *v2;
  uint64_t v3;
  __CFString *v4;

  if (objc_msgSend(a1, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(a1, "length") + 1;
    v4 = &stru_1E94661A8;
    while (v3 - 2 >= 1)
    {
      --v3;
      if ((objc_msgSend(v2, "characterIsMember:", objc_msgSend(a1, "characterAtIndex:")) & 1) == 0)
      {
        objc_msgSend(a1, "substringToIndex:", v3);
        v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
        break;
      }
    }

  }
  else
  {
    v4 = &stru_1E94661A8;
  }
  return v4;
}

- (id)vk_leadingTrimmedString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "vk_stringByTrimmingLeadingCharactersInSet:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (uint64_t)vk_whitespaceAndNewlineCoalescedString
{
  if (vk_whitespaceAndNewlineCoalescedString_onceToken != -1)
    dispatch_once(&vk_whitespaceAndNewlineCoalescedString_onceToken, &__block_literal_global_29);
  return objc_msgSend((id)vk_whitespaceAndNewlineCoalescedString_regex, "stringByReplacingMatchesInString:options:range:withTemplate:", a1, 0, 0, objc_msgSend(a1, "length"), CFSTR(" "));
}

- (id)vk_sanitizedFilenameString
{
  id v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v1 = a1;
  if (objc_msgSend(v1, "length"))
  {
    if ((unint64_t)objc_msgSend(v1, "length") >= 0x81)
    {
      objc_msgSend(v1, "vk_substringToIndex:", 128);
      v2 = objc_claimAutoreleasedReturnValue();

      v1 = (id)v2;
    }
    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("///\\?%*|\"<>:"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "vk_stringByReplacingCharactersInSet:withString:", v3, &stru_1E94661A8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("."));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");

    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "formUnionWithCharacterSet:", v7);

    objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v6);
    v1 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v1, "lastPathComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)vk_rangeIsValid:()VK
{
  return a3 != 0x7FFFFFFFFFFFFFFFLL && a3 + a4 <= (unint64_t)objc_msgSend(a1, "length");
}

- (uint64_t)vk_lineRangeIgnoringLineBreakCharactersForIndex:()VK
{
  uint64_t location;
  NSUInteger v5;
  NSUInteger length;
  int v7;
  NSUInteger v8;
  NSUInteger v9;
  NSRange v10;
  NSUInteger i;
  NSRange v12;
  NSRange v14;
  NSRange v15;
  NSRange v16;
  NSRange v17;

  location = objc_msgSend(a1, "lineRangeForRange:", a3, 0);
  length = v5;
  v7 = objc_msgSend(CFSTR("\u2028"), "characterAtIndex:", 0);
  v8 = location - 1;
  if (location - 1 >= 1)
  {
    do
    {
      if (objc_msgSend(a1, "characterAtIndex:", v8) != v7)
        break;
      v16.location = objc_msgSend(a1, "lineRangeForRange:", v8, 0);
      v16.length = v9;
      v14.location = location;
      v14.length = length;
      v10 = NSUnionRange(v14, v16);
      location = v10.location;
      length = v10.length;
      v8 = v10.location - 1;
    }
    while ((int64_t)(v10.location - 1) > 0);
  }
  for (i = location + length;
        (uint64_t)(i - 1) >= 0
     && i < objc_msgSend(a1, "length")
     && objc_msgSend(a1, "characterAtIndex:", i - 1) == v7;
        i = v12.location + v12.length)
  {
    v15.location = objc_msgSend(a1, "lineRangeForRange:", i, 0);
    v17.location = location;
    v17.length = length;
    v12 = NSUnionRange(v15, v17);
    location = v12.location;
    length = v12.length;
  }
  return location;
}

- (uint64_t)vk_stringReplacingUnsafeHTMLCharacters
{
  return objc_msgSend(a1, "vk_stringByReplacingCharactersInStringMap:", &unk_1E9495590);
}

- (uint64_t)vk_stringReplacingUnsafeXMLCharacters
{
  return objc_msgSend(a1, "vk_stringByReplacingCharactersInStringMap:", &unk_1E94955B8);
}

- (id)vk_stringByRemovingAttachmentCharacters
{
  void *v2;
  void *v3;

  objc_msgSend((id)objc_opt_class(), "vk_NSAttachmentCharacterString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:", v2, &stru_1E94661A8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (uint64_t)vk_isLastCharacterANewline
{
  return objc_msgSend(a1, "vk_isLastCharacterInRangeANewlineForRange:", 0, objc_msgSend(a1, "length"));
}

- (uint64_t)vk_numberOfLines
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = objc_msgSend(a1, "length");
  if (!v2)
    return 0;
  v3 = v2;
  v4 = 0;
  v5 = 0;
  do
  {
    v6 = objc_msgSend(a1, "lineRangeForRange:", v5, 0);
    v5 = v6 + v7;
    ++v4;
  }
  while (v6 + v7 < v3);
  return v4;
}

- (uint64_t)vk_wordCount
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v2 = objc_msgSend(a1, "vk_range");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __28__NSString_VK__vk_wordCount__block_invoke;
  v6[3] = &unk_1E9464F30;
  v6[4] = &v7;
  objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:", v2, v3, 1539, v6);
  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)vk_uniqueWordsWithMinLength:()VK
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  _QWORD v22[4];
  id v23;
  void *v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v6 = objc_alloc(MEMORY[0x1E0CB3730]);
  v26[0] = *MEMORY[0x1E0CB2D28];
  v7 = v26[0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithTagSchemes:options:", v8, 0);

  objc_msgSend(v9, "setString:", a1);
  v10 = objc_msgSend(a1, "length");
  v11 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __44__NSString_VK__vk_uniqueWordsWithMinLength___block_invoke;
  v22[3] = &unk_1E9464F58;
  v25 = a3;
  v12 = v5;
  v23 = v12;
  v24 = a1;
  objc_msgSend(v9, "enumerateTagsInRange:scheme:options:usingBlock:", 0, v10, v7, 6, v22);
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__13;
  v20 = __Block_byref_object_dispose__13;
  v21 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __44__NSString_VK__vk_uniqueWordsWithMinLength___block_invoke_94;
  v15[3] = &unk_1E9464F80;
  v15[4] = &v16;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v15);
  v13 = (void *)objc_msgSend((id)v17[5], "copy");
  _Block_object_dispose(&v16, 8);

  return v13;
}

- (BOOL)vk_containsNonWhitespaceCharacters
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invertedSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(a1, "rangeOfCharacterFromSet:", v3) != 0x7FFFFFFFFFFFFFFFLL;
  return v4;
}

- (BOOL)vk_containsNonWhitespaceAndAttachmentCharacters
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend((id)objc_opt_class(), "vk_NSAttachmentCharacterString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addCharactersInString:", v4);

  objc_msgSend(v3, "invertedSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(a1, "rangeOfCharacterFromSet:", v5) != 0x7FFFFFFFFFFFFFFFLL;

  return v6;
}

- (BOOL)vk_containsAlphanumericCharacters
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(MEMORY[0x1E0CB3500], "alphanumericCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "rangeOfCharacterFromSet:", v2) != 0x7FFFFFFFFFFFFFFFLL;

  return v3;
}

- (void)vk_enumerateParagraphsInRange:()VK usingBlock:
{
  void (**v8)(id, uint64_t, unint64_t, uint64_t, char *);
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  char v14;

  v8 = a5;
  v9 = a3 + a4;
  v10 = objc_msgSend(a1, "length");
  if (v9 >= v10)
    v9 = v10;
  v14 = 0;
  do
  {
    if (a3 >= v9)
      break;
    v12 = 0;
    v13 = 0;
    v11 = 0;
    objc_msgSend(a1, "getParagraphStart:end:contentsEnd:forRange:", &v13, &v12, &v11, a3, 0);
    v8[2](v8, v13, v12, v11, &v14);
    a3 = v12;
  }
  while (!v14);

}

- (void)vk_enumerateContentLineRangesInRange:()VK usingBlock:
{
  void (**v8)(id, unint64_t, uint64_t, char *);
  unint64_t v9;
  unint64_t v10;
  char v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;

  v8 = a5;
  v9 = a3 + a4;
  v10 = objc_msgSend(a1, "length");
  v14 = 0;
  v15 = a3;
  if (v9 >= v10)
    v9 = v10;
  v13 = 0;
  v12 = 0;
  do
  {
    objc_msgSend(a1, "getLineStart:end:contentsEnd:forRange:", &v15, &v14, &v13, a3, 0);
    v8[2](v8, v15, v13 - v15, &v12);
    a3 = v14;
    v15 = v14;
  }
  while (v14 < v9 && v12 == 0);

}

- (uint64_t)vk_substringFromIndex:()VK
{
  return objc_msgSend(a1, "substringFromIndex:", objc_msgSend(a1, "rangeOfComposedCharacterSequenceAtIndex:"));
}

- (id)vk_substringToIndex:()VK
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  if (objc_msgSend(a1, "length"))
  {
    v5 = objc_msgSend(a1, "length");
    if (v5 - 1 >= a3)
      v6 = a3;
    else
      v6 = v5 - 1;
    v7 = objc_msgSend(a1, "rangeOfComposedCharacterSequenceAtIndex:", v6);
    objc_msgSend(a1, "substringToIndex:", v7 + v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = (void *)objc_msgSend(a1, "copy");
  }
  return v9;
}

- (__CFString)vk_substringWithRange:()VK
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __CFString *v13;

  v7 = objc_msgSend(a1, "vk_range");
  v9 = VKMClampRange(a3, a4, v7, v8);
  if (v10)
  {
    v11 = objc_msgSend(a1, "rangeOfComposedCharacterSequencesForRange:", v9, v10);
    objc_msgSend(a1, "substringWithRange:", v11, v12);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = &stru_1E94661A8;
  }
  return v13;
}

- (__CFString)vk_substringWithVKRange:()VK
{
  id v4;
  __CFString *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[4];
  id v14;
  void *v15;
  uint64_t v16;

  v4 = a3;
  if ((objc_msgSend(v4, "isEmpty") & 1) != 0)
  {
    v5 = &stru_1E94661A8;
  }
  else if ((objc_msgSend(v4, "containsMultipleRanges") & 1) != 0)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    objc_msgSend(v4, "rangeArray");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __40__NSString_VK__vk_substringWithVKRange___block_invoke;
    v13[3] = &unk_1E9464FA8;
    v14 = v6;
    v15 = a1;
    v16 = v8;
    v9 = v6;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v13);
    v5 = (__CFString *)objc_msgSend(v9, "copy");

  }
  else
  {
    v10 = objc_msgSend(v4, "nsRange");
    objc_msgSend(a1, "vk_substringWithRange:", v10, v11);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (__CFString)vk_checkedSubstringWithRange:()VK
{
  __CFString *v7;

  if (objc_msgSend(a1, "vk_rangeIsValid:"))
  {
    objc_msgSend(a1, "vk_substringWithRange:", a3, a4);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = &stru_1E94661A8;
  }
  return v7;
}

- (__CFString)vk_checkedSubstringWithVKRange:()VK
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  __CFString *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "nsRange");
  if (objc_msgSend(a1, "vk_rangeIsValid:", v5, v6))
  {
    objc_msgSend(a1, "vk_substringWithVKRange:", v4);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = &stru_1E94661A8;
  }

  return v7;
}

- (id)vk_stringByReplacingNewlineCharactersWithWhiteSpace
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "vk_stringByReplacingCharactersInSet:withString:", v2, CFSTR(" "));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)vk_stringByReplacingCharactersInSet:()VK withString:
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v6 = a3;
  v7 = a4;
  v8 = a1;
  v9 = objc_msgSend(v8, "rangeOfCharacterFromSet:", v6);
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = 0;
  }
  else
  {
    v12 = v9;
    v13 = v10;
    v11 = 0;
    do
    {
      if (!v11)
        v11 = (void *)objc_msgSend(v8, "mutableCopy");
      objc_msgSend(v11, "replaceCharactersInRange:withString:", v12, v13, v7);
      v12 = objc_msgSend(v11, "rangeOfCharacterFromSet:options:range:", v6, 2, v12, objc_msgSend(v11, "length") - v12);
      v13 = v14;
    }
    while (v12 != 0x7FFFFFFFFFFFFFFFLL);
    if (v11)
    {
      v15 = objc_msgSend(v11, "copy");

      v8 = (id)v15;
    }
  }

  return v8;
}

- (id)vk_stringByReplacingCharactersInStringMap:()VK
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v24;
  void *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[5];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v26 = a1;
  v5 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v5, "appendString:", CFSTR("("));
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v25 = v4;
  objc_msgSend(v4, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v39 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(MEMORY[0x1E0CB38E8], "escapedPatternForString:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendString:", v10);

        objc_msgSend(v5, "appendString:", CFSTR("|"));
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v5, "length"))
    objc_msgSend(v5, "replaceCharactersInRange:withString:", objc_msgSend(v5, "length") - 1, 1, &stru_1E94661A8);
  objc_msgSend(v5, "appendString:", CFSTR(")"));
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", v5, 0, 0);
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__13;
  v36 = __Block_byref_object_dispose__13;
  v37 = 0;
  v11 = objc_msgSend(v26, "length");
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __58__NSString_VK__vk_stringByReplacingCharactersInStringMap___block_invoke;
  v31[3] = &unk_1E9464FD0;
  v31[4] = &v32;
  objc_msgSend(v24, "enumerateMatchesInString:options:range:usingBlock:", v26, 0, 0, v11, v31);
  if (objc_msgSend((id)v33[5], "count"))
    v12 = (void *)objc_msgSend(v26, "mutableCopy");
  else
    v12 = 0;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend((id)v33[5], "reverseObjectEnumerator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v42, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v28 != v15)
          objc_enumerationMutation(v13);
        v17 = objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * j), "rangeValue");
        v19 = v18;
        objc_msgSend(v26, "substringWithRange:", v17, v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectForKeyedSubscript:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
          objc_msgSend(v12, "replaceCharactersInRange:withString:", v17, v19, v21);
        else
          +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[NSString(VK) vk_stringByReplacingCharactersInStringMap:]", 0, 0, CFSTR("nil replacement string replacestring map"));

      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v42, 16);
    }
    while (v14);
  }

  if (v12)
  {
    v22 = objc_msgSend(v12, "copy");

    v26 = (id)v22;
  }

  _Block_object_dispose(&v32, 8);
  return v26;
}

- (uint64_t)vk_paragraphRangeForRange:()VK contentEnd:
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v8 = 0;
  v9 = 0;
  v7 = 0;
  objc_msgSend(a1, "getParagraphStart:end:contentsEnd:forRange:", &v9, &v8, &v7, a3, a4);
  if (a5)
    *a5 = v7;
  return v9;
}

- (uint64_t)vk_lengthOfLongestLine
{
  uint64_t v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __38__NSString_VK__vk_lengthOfLongestLine__block_invoke;
  v3[3] = &unk_1E9464F80;
  v3[4] = &v4;
  objc_msgSend(a1, "enumerateLinesUsingBlock:", v3);
  v1 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v1;
}

- (BOOL)vk_isLastCharacterInRangeANewlineForRange:()VK
{
  uint64_t v7;
  uint64_t v8;
  _BOOL8 v9;
  void *v10;

  v7 = objc_msgSend(a1, "vk_safeCharacterRangeForRange:");
  v9 = 0;
  if (a3 == v7 && a4 == v8)
  {
    objc_msgSend(a1, "vk_substringWithRange:", v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "length"))
      v9 = objc_msgSend(v10, "characterAtIndex:", objc_msgSend(v10, "length") - 1) == 10;
    else
      v9 = 0;

  }
  return v9;
}

- (NSUInteger)vk_safeCharacterRangeForRange:()VK
{
  NSUInteger v6;
  NSRange v7;
  NSRange v9;

  v6 = objc_msgSend(a1, "length");
  if (v6 == a3)
    return a3;
  v7.length = v6;
  if (v6 < a3)
    return 0x7FFFFFFFFFFFFFFFLL;
  v9.location = a3;
  v9.length = a4;
  v7.location = 0;
  return NSIntersectionRange(v9, v7).location;
}

- (uint64_t)vk_countOfCharactersInSet:()VK
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a3;
  v5 = objc_msgSend(a1, "rangeOfCharacterFromSet:options:range:", v4, 0, 0, objc_msgSend(a1, "length"));
  v6 = 0;
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = v5;
    v6 = 0;
    do
    {
      ++v6;
      v7 = objc_msgSend(a1, "rangeOfCharacterFromSet:options:range:", v4, 0, v7 + 1, objc_msgSend(a1, "length") + ~v7);
    }
    while (v7 != 0x7FFFFFFFFFFFFFFFLL);
  }

  return v6;
}

- (__CFString)vk_stringByTrimmingLeadingCharactersInSet:()VK
{
  void *v4;
  uint64_t v5;
  __CFString *v6;

  objc_msgSend(a3, "invertedSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(a1, "rangeOfCharacterFromSet:", v4);

  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = &stru_1E94661A8;
  }
  else if (v5)
  {
    objc_msgSend(a1, "vk_substringFromIndex:", v5);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = a1;
  }
  return v6;
}

- (id)vk_truncatedStringWithMaxLength:()VK truncated:
{
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;

  if (a4)
    *a4 = 0;
  if (objc_msgSend(a1, "length") <= a3)
  {
    v9 = a1;
  }
  else
  {
    objc_msgSend(a1, "vk_substringWithRange:", 0, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length");
    if (v8 == objc_msgSend(a1, "length"))
    {
      v9 = v7;
    }
    else
    {
      objc_msgSend(v7, "vk_trailingTrimmedString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringByAppendingString:", CFSTR("…"));
      v9 = (id)objc_claimAutoreleasedReturnValue();

      if (a4)
        *a4 = 1;
    }
  }
  return v9;
}

- (id)vk_rangesOfMatchesForString:()VK
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  unint64_t v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  void *v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  void *v41;
  id v42;
  id v44;
  id v45;
  id v46;
  void *v47;
  void *v48;
  id v49;
  id v50;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v4, "length"))
  {
    v44 = v4;
    v6 = v4;
    v7 = a1;
    v8 = objc_msgSend(v6, "length");
    v9 = *MEMORY[0x1E0CB2D28];
    v50 = 0;
    v48 = v6;
    v10 = (id)objc_msgSend(v6, "linguisticTagsInRange:scheme:options:orthography:tokenRanges:", 0, v8, v9, 6, 0, &v50);
    v11 = v50;
    v49 = 0;
    v47 = v7;
    v12 = (id)objc_msgSend(v7, "linguisticTagsInRange:scheme:options:orthography:tokenRanges:", 0, objc_msgSend(v7, "length"), v9, 6, 0, &v49);
    v13 = v49;
    if (objc_msgSend(v13, "count"))
    {
      v14 = 0;
      v45 = v11;
      v46 = v5;
      do
      {
        if (!objc_msgSend(v11, "count"))
          break;
        objc_msgSend(v13, "objectAtIndex:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "rangeValue");
        v18 = v17;

        v19 = 0;
        v20 = 0;
        do
        {
          if (v20 && v20 + v14 < objc_msgSend(v13, "count"))
          {
            objc_msgSend(v13, "objectAtIndex:", v20 + v14);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v21, "rangeValue");
            v18 = v22;

          }
          objc_msgSend(v11, "objectAtIndex:", v19);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "rangeValue");
          v26 = v25;

          if (v26 <= v18)
          {
            objc_msgSend(v48, "substringWithRange:", v24, v26);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v47, "rangeOfString:options:range:", v28, 137, v16, v18) != 0x7FFFFFFFFFFFFFFFLL)
            {
              if (v20 || (v30 = v29, v29 == v18) || objc_msgSend(v11, "count") == 1 || v30 >= 2)
                ++v20;
              else
                v20 = 0;
            }
            v27 = 0x1ECEE9000uLL;

          }
          else
          {
            v27 = 0x1ECEE9000;
          }
          ++v19;
        }
        while (v19 < objc_msgSend(v11, "count") && v20 + v14 < objc_msgSend(v13, "count"));
        if (v20)
        {
          v31 = v20;
          v32 = v14;
          v5 = v46;
          v33 = v27;
          if (v14 < v20 + v14)
          {
            do
            {
              objc_msgSend(v13, "objectAtIndex:", v32);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = objc_msgSend(v34, "rangeValue");
              v36 = v5;
              v38 = v37;

              v39 = objc_alloc((Class)(v33 + 1352));
              v40 = v38;
              v5 = v36;
              v41 = (void *)objc_msgSend(v39, "initWithRange:", v35, v40);
              objc_msgSend(v36, "addObject:", v41);

              ++v32;
              --v31;
            }
            while (v31);
          }
          v14 = v14 + v20 - 1;
          v11 = v45;
        }
        else
        {
          v5 = v46;
        }
        ++v14;
      }
      while (v14 < objc_msgSend(v13, "count"));
    }
    v42 = (id)objc_msgSend(v5, "copy");

    v4 = v44;
  }
  else
  {
    v42 = v5;
  }

  return v42;
}

@end
