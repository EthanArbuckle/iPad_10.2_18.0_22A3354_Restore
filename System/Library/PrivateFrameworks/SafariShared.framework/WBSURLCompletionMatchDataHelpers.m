@implementation WBSURLCompletionMatchDataHelpers

+ (BOOL)typedStringMatchesTitleAndURLAutocompleteTriggers:(id)a3 title:(id)a4 urlString:(id)a5 autoCompleteTriggers:(id)a6 isStrengthened:(BOOL)a7
{
  _BOOL4 v7;
  NSString *v11;
  NSString *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  __CFString *v18;
  const __CFCharacterSet *v19;
  UniChar CharacterAtIndex;
  const __CFCharacterSet *v21;
  UniChar v22;
  void *v23;
  void *v24;
  BOOL v25;
  NSString *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v7 = a7;
  v33 = *MEMORY[0x1E0C80C00];
  v11 = (NSString *)a3;
  v27 = (NSString *)a4;
  v12 = (NSString *)a5;
  v13 = a6;
  if (+[WBSURLCompletionMatchDataHelpers typedStringMatchesTitleAndURLAutocompleteTriggers:title:urlString:autoCompleteTriggers:isStrengthened:]::onceToken != -1)
    dispatch_once(&+[WBSURLCompletionMatchDataHelpers typedStringMatchesTitleAndURLAutocompleteTriggers:title:urlString:autoCompleteTriggers:isStrengthened:]::onceToken, &__block_literal_global_102);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v14 = v13;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (!v15)
  {
    v25 = 0;
    goto LABEL_25;
  }
  v16 = *(_QWORD *)v29;
  while (2)
  {
    for (i = 0; i != v15; ++i)
    {
      if (*(_QWORD *)v29 != v16)
        objc_enumerationMutation(v14);
      v18 = *(__CFString **)(*((_QWORD *)&v28 + 1) + 8 * i);
      if ((-[__CFString safari_hasPrefix:](v18, "safari_hasPrefix:", v11) & 1) != 0)
        goto LABEL_24;
      if (-[NSString safari_hasPrefix:](v11, "safari_hasPrefix:", v18))
      {
        if (!v7
          || (typedStringMatchesTitleOrURLWithAutocompleteTrigger(v11, v27, v12, &v18->isa, (const __CFCharacterSet *)+[WBSURLCompletionMatchDataHelpers typedStringMatchesTitleAndURLAutocompleteTriggers:title:urlString:autoCompleteTriggers:isStrengthened:]::delimiters) & 1) != 0)
        {
          goto LABEL_24;
        }
      }
      else if (!v7)
      {
        continue;
      }
      v19 = (const __CFCharacterSet *)+[WBSURLCompletionMatchDataHelpers typedStringMatchesTitleAndURLAutocompleteTriggers:title:urlString:autoCompleteTriggers:isStrengthened:]::delimiters;
      CharacterAtIndex = CFStringGetCharacterAtIndex(v18, 0);
      if (!CFCharacterSetIsCharacterMember(v19, CharacterAtIndex))
      {
        v21 = (const __CFCharacterSet *)+[WBSURLCompletionMatchDataHelpers typedStringMatchesTitleAndURLAutocompleteTriggers:title:urlString:autoCompleteTriggers:isStrengthened:]::delimiters;
        v22 = CFStringGetCharacterAtIndex(v18, -[__CFString length](v18, "length") - 1);
        if (!CFCharacterSetIsCharacterMember(v21, v22))
          continue;
      }
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString safari_stringByRemovingCharactersInSet:](v18, "safari_stringByRemovingCharactersInSet:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (-[NSString safari_hasPrefix:](v11, "safari_hasPrefix:", v24)
        && (typedStringMatchesTitleOrURLWithAutocompleteTrigger(v11, v27, v12, (NSString *)v24, (const __CFCharacterSet *)+[WBSURLCompletionMatchDataHelpers typedStringMatchesTitleAndURLAutocompleteTriggers:title:urlString:autoCompleteTriggers:isStrengthened:]::delimiters) & 1) != 0)
      {

LABEL_24:
        v25 = 1;
        goto LABEL_25;
      }

    }
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    v25 = 0;
    if (v15)
      continue;
    break;
  }
LABEL_25:

  return v25;
}

CFCharacterSetRef __138__WBSURLCompletionMatchDataHelpers_typedStringMatchesTitleAndURLAutocompleteTriggers_title_urlString_autoCompleteTriggers_isStrengthened___block_invoke()
{
  CFCharacterSetRef result;

  result = CFCharacterSetGetPredefined(kCFCharacterSetWhitespaceAndNewline);
  +[WBSURLCompletionMatchDataHelpers typedStringMatchesTitleAndURLAutocompleteTriggers:title:urlString:autoCompleteTriggers:isStrengthened:]::delimiters = (uint64_t)result;
  return result;
}

@end
