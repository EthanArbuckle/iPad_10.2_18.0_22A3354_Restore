@implementation SearchUICompletion

+ (id)initWithTypedString:(id)a3 result:(id)a4 cardSection:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _QWORD v23[9];

  v23[8] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v23[0] = objc_opt_class();
  v23[1] = objc_opt_class();
  v23[2] = objc_opt_class();
  v23[3] = objc_opt_class();
  v23[4] = objc_opt_class();
  v23[5] = objc_opt_class();
  v23[6] = objc_opt_class();
  v23[7] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 8);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
LABEL_3:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v19 != v13)
        objc_enumerationMutation(v10);
      v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v14);
      if ((objc_msgSend(v15, "supportsResult:cardSection:", v8, v9, (_QWORD)v18) & 1) != 0)
        break;
      if (v12 == ++v14)
      {
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v12)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v15 = 0;
  }

  v16 = (void *)objc_msgSend(objc_alloc((Class)v15), "initWithTypedString:result:cardSection:", v7, v8, v9);
  return v16;
}

- (SearchUICompletion)initWithTypedString:(id)a3 result:(id)a4 cardSection:(id)a5
{
  id v9;
  id v10;
  id v11;
  SearchUICompletion *v12;
  SearchUICompletion *v13;
  NSString *bridgeString;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  SFImage *image;
  objc_super v24;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v24.receiver = self;
  v24.super_class = (Class)SearchUICompletion;
  v12 = -[SearchUICompletion init](&v24, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_typedString, a3);
    objc_storeStrong((id *)&v13->_result, a4);
    objc_storeStrong((id *)&v13->_cardSection, a5);
    if (+[SearchUIUtilities isIpad](SearchUIUtilities, "isIpad")
      && (objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS") & 1) == 0)
    {
      bridgeString = v13->_bridgeString;
      v15 = CFSTR("﹣");
    }
    else
    {
      bridgeString = v13->_bridgeString;
      v15 = CFSTR(" — ");
    }
    v13->_bridgeString = &v15->isa;

    objc_msgSend(v10, "applicationBundleIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v16, "length"))
      goto LABEL_13;
    +[SearchUIUtilities bundleIdentifierForApp:](SearchUIUtilities, "bundleIdentifierForApp:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "isEqualToString:", v17))
    {

    }
    else
    {
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v16, 0, 0);
      objc_msgSend(v18, "applicationState");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isValid");

      if (!v20)
      {
        image = v13->_image;
        v13->_image = 0;
        goto LABEL_12;
      }
    }
    +[SearchUIAppIconImage appIconForResult:variant:](SearchUIAppIconImage, "appIconForResult:variant:", v10, 2);
    v21 = objc_claimAutoreleasedReturnValue();
    image = v13->_image;
    v13->_image = (SFImage *)v21;
LABEL_12:

LABEL_13:
    -[SearchUICompletion updateFields](v13, "updateFields");

  }
  return v13;
}

- (void)updateFields
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  -[SearchUICompletion completionStringToMatch](self, "completionStringToMatch");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend((id)objc_opt_class(), "stringMatchesWritingDirection:", v9))
  {
    -[SearchUICompletion completionStringWithString:](self, "completionStringWithString:", v9);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      -[SearchUICompletion setCompletionString:](self, "setCompletionString:", v3);
      -[SearchUICompletion prefixMatchExtensionString](self, "prefixMatchExtensionString");
    }
    else
    {
      -[SearchUICompletion setCompletionString:](self, "setCompletionString:", 0);
      -[SearchUICompletion nonPrefixMatchExtensionString](self, "nonPrefixMatchExtensionString");
    }
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUICompletion setExtensionString:](self, "setExtensionString:", v4);

  }
  else
  {
    -[SearchUICompletion setCompletionString:](self, "setCompletionString:", 0);
    -[SearchUICompletion setExtensionString:](self, "setExtensionString:", v9);
  }
  -[SearchUICompletion typedString](self, "typedString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (!v6)
  {
    if (objc_msgSend(v9, "length"))
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v9);
      -[SearchUICompletion setCompletionString:](self, "setCompletionString:", v7);

      -[SearchUICompletion prefixMatchExtensionString](self, "prefixMatchExtensionString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SearchUICompletion setExtensionString:](self, "setExtensionString:", v8);

    }
    else
    {
      -[SearchUICompletion setCompletionString:](self, "setCompletionString:", 0);
      -[SearchUICompletion setExtensionString:](self, "setExtensionString:", 0);
    }
  }

}

- (id)completionStringToMatch
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  -[SearchUICompletion result](self, "result");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "completion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[SearchUICompletion result](self, "result");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "text");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)prefixMatchExtensionString
{
  return (id)objc_msgSend((id)objc_opt_class(), "localizedOpenString");
}

+ (id)localizedOpenString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("OPEN"), &stru_1EA1FB118, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)localizedSearchString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SEARCH_BAR_PLACEHOLDER"), &stru_1EA1FB118, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)localizedShowMoreString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SEARCH_RESULTS_SHOW_MORE_BUTTON_TITLE"), &stru_1EA1FB118, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)supportsResult:(id)a3 cardSection:(id)a4
{
  return 0;
}

+ (id)localizedNameForBundleIdentifier:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;

  if (a3)
  {
    v3 = (objc_class *)MEMORY[0x1E0CA5870];
    v4 = a3;
    v5 = (void *)objc_msgSend([v3 alloc], "initWithBundleIdentifier:allowPlaceholder:error:", v4, 0, 0);

    objc_msgSend(v5, "localizedName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (BOOL)stringMatchesWritingDirection:(id)a3
{
  char v3;

  v3 = objc_msgSend(a3, "_isNaturallyRTL");
  return v3 ^ objc_msgSend(MEMORY[0x1E0DBD9B0], "isLTR");
}

+ (_NSRange)nonPartialRangeOfTypedString:(id)a3 inString:(id)a4
{
  NSUInteger v4;
  NSUInteger v5;
  _NSRange result;

  v4 = objc_msgSend(a1, "nonPartialRangeOfTypedString:inString:usingCompatiblityEquivalence:", a3, a4, 0);
  result.length = v5;
  result.location = v4;
  return result;
}

+ (_NSRange)nonPartialRangeOfTypedString:(id)a3 inString:(id)a4 usingCompatiblityEquivalence:(BOOL)a5
{
  id v7;
  id v8;
  unint64_t v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  void *v14;
  void *v15;
  NSUInteger v16;
  NSUInteger v17;
  NSUInteger location;
  NSUInteger length;
  NSRange v20;
  NSRange v21;
  _NSRange result;
  NSRange v23;

  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v7, "length");
  if (v7 && objc_msgSend(v8, "length") >= v9)
  {
    if (a5)
    {
      objc_msgSend(v8, "precomposedStringWithCompatibilityMapping");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "precomposedStringWithCompatibilityMapping");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v14, "localizedStandardRangeOfString:", v15);
      v10 = v16;

    }
    else
    {
      v11 = objc_msgSend(v8, "localizedStandardRangeOfString:", v7);
      v10 = v17;
    }
    if (v10 + v11 - 1 < objc_msgSend(v8, "length") - 1)
    {
      v21.location = objc_msgSend(v8, "rangeOfComposedCharacterSequenceAtIndex:", v10 + v11 - 1);
      location = v21.location;
      length = v21.length;
      v23.location = v11;
      v23.length = v10;
      v20 = NSIntersectionRange(v21, v23);
      if (v20.location != location || v20.length != length)
      {
        v10 = 0;
        v11 = 0x7FFFFFFFFFFFFFFFLL;
      }
    }
  }
  else
  {
    v10 = 0;
    v11 = 0x7FFFFFFFFFFFFFFFLL;
  }

  v12 = v11;
  v13 = v10;
  result.length = v13;
  result.location = v12;
  return result;
}

- (BOOL)isValidRange:(_NSRange)a3
{
  return a3.location == 0;
}

- (id)completionStringWithString:(id)a3
{
  id v4;
  void *v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  unint64_t v15;
  NSUInteger v16;
  NSObject *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;
  _QWORD v37[2];
  NSRange v38;
  NSRange v39;

  v37[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SearchUICompletion typedString](self, "typedString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend((id)objc_opt_class(), "nonPartialRangeOfTypedString:inString:usingCompatiblityEquivalence:", v5, v4, 0);
  v8 = v7;
  if (!-[SearchUICompletion isValidRange:](self, "isValidRange:", v6, v7))
  {
    v6 = objc_msgSend((id)objc_opt_class(), "nonPartialRangeOfTypedString:inString:usingCompatiblityEquivalence:", v5, v4, 1);
    v8 = v9;
  }
  if (-[SearchUICompletion isValidRange:](self, "isValidRange:", v6, v8))
  {
    objc_msgSend(MEMORY[0x1E0DC1290], "defaultParagraphStyle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

    objc_msgSend(v11, "setAllowsDefaultTighteningForTruncation:", 0);
    v12 = objc_alloc(MEMORY[0x1E0CB3778]);
    v36 = *MEMORY[0x1E0DC1178];
    v37[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithString:attributes:", v5, v13);

    v15 = objc_msgSend(v4, "length");
    v16 = v15 - v8;
    if (v8 == 0x7FFFFFFFFFFFFFFFLL || v15 > objc_msgSend(v4, "length"))
    {
      SearchUIGeneralLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v38.location = v8;
        v38.length = v16;
        NSStringFromRange(v38);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[SearchUICompletion typedString](self, "typedString");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v39.location = v6;
        v39.length = v8;
        NSStringFromRange(v39);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138413058;
        v29 = v25;
        v30 = 2112;
        v31 = v4;
        v32 = 2112;
        v33 = v26;
        v34 = 2112;
        v35 = v27;
        _os_log_error_impl(&dword_1DAD39000, v17, OS_LOG_TYPE_ERROR, "suffix range: %@ is wrong for completionString: %@ with typedString: %@. originalRange: %@", (uint8_t *)&v28, 0x2Au);

      }
      v18 = 0;
    }
    else
    {
      v19 = objc_alloc(MEMORY[0x1E0CB3498]);
      objc_msgSend(v4, "substringWithRange:", v8, v16);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)v20;
      if (v20)
        v22 = (const __CFString *)v20;
      else
        v22 = &stru_1EA1FB118;
      v23 = (void *)objc_msgSend(v19, "initWithString:", v22);

      objc_msgSend(v14, "appendAttributedString:", v23);
      v18 = (void *)objc_msgSend(v14, "copy");
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SearchUICompletion;
  -[SearchUICompletion description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[SearchUICompletion completionString](self, "completionString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUICompletion extensionString](self, "extensionString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("completion:%@ extension:%@"), v5, v6);

  return v4;
}

- (NSAttributedString)completionString
{
  return self->_completionString;
}

- (void)setCompletionString:(id)a3
{
  objc_storeStrong((id *)&self->_completionString, a3);
}

- (NSString)extensionString
{
  return self->_extensionString;
}

- (void)setExtensionString:(id)a3
{
  objc_storeStrong((id *)&self->_extensionString, a3);
}

- (NSString)bridgeString
{
  return self->_bridgeString;
}

- (void)setBridgeString:(id)a3
{
  objc_storeStrong((id *)&self->_bridgeString, a3);
}

- (SFImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (NSString)copyableString
{
  return self->_copyableString;
}

- (BOOL)completionResultIsPotentiallyPunchout
{
  return self->_completionResultIsPotentiallyPunchout;
}

- (NSString)typedString
{
  return self->_typedString;
}

- (SFSearchResult)result
{
  return self->_result;
}

- (SFCardSection)cardSection
{
  return self->_cardSection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardSection, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_typedString, 0);
  objc_storeStrong((id *)&self->_copyableString, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_bridgeString, 0);
  objc_storeStrong((id *)&self->_extensionString, 0);
  objc_storeStrong((id *)&self->_completionString, 0);
}

@end
