@implementation WBSTemplateIconMonogramGenerator

+ (id)monogramStringForTitle:(id)a3 url:(id)a4
{
  objc_msgSend(a1, "monogramStringForTitle:url:shouldRemoveGrammaticalArticles:", a3, a4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)monogramStringForTitle:(id)a3 url:(id)a4 shouldRemoveGrammaticalArticles:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v5 = a5;
  v39 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v5
    && +[WBSTemplateIconMonogramGenerator monogramStringForTitle:url:shouldRemoveGrammaticalArticles:]::onceToken != -1)
  {
    dispatch_once(&+[WBSTemplateIconMonogramGenerator monogramStringForTitle:url:shouldRemoveGrammaticalArticles:]::onceToken, &__block_literal_global_46);
  }
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByTrimmingCharactersInSet:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v10;
  v12 = objc_msgSend(v11, "length");
  if (v12 > 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (trimPairOfParenthesesContainingOnlyDigitsAndSpaces(NSString *)::onceToken != -1)
      dispatch_once(&trimPairOfParenthesesContainingOnlyDigitsAndSpaces(NSString *)::onceToken, &__block_literal_global_128);
    if (!objc_msgSend((id)trimPairOfParenthesesContainingOnlyDigitsAndSpaces(NSString *)::leftParenthesisCharacterSet, "characterIsMember:", objc_msgSend(v11, "characterAtIndex:", 0)))goto LABEL_16;
    v17 = 1;
    while (1)
    {
      v18 = objc_msgSend(v11, "characterAtIndex:", v17);
      if ((objc_msgSend((id)trimPairOfParenthesesContainingOnlyDigitsAndSpaces(NSString *)::rightParenthesisCharacterSet, "characterIsMember:", v18) & 1) != 0)break;
      if (((objc_msgSend(v15, "characterIsMember:", v18) & 1) != 0
         || (objc_msgSend(v16, "characterIsMember:", v18) & 1) != 0)
        && v12 != ++v17)
      {
        continue;
      }
      goto LABEL_16;
    }
    if (v12 != v17)
    {
      objc_msgSend(v11, "substringFromIndex:", v17 + 1);
      v13 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "stringByTrimmingCharactersInSet:", v16);
      v19 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_16:
      v19 = v11;
      v13 = v19;
    }
    v14 = v19;

  }
  else
  {
    v13 = v11;
    v14 = v13;
  }

  v20 = objc_msgSend(v14, "rangeOfString:", CFSTR(" "));
  if (v20 != 0x7FFFFFFFFFFFFFFFLL && v5)
  {
    v22 = v20 + v21;
    objc_msgSend(v14, "substringToIndex:", v20 + v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v24 = (id)+[WBSTemplateIconMonogramGenerator monogramStringForTitle:url:shouldRemoveGrammaticalArticles:]::prefixesToIgnore;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v25)
    {
      v26 = *(_QWORD *)v35;
      while (2)
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v35 != v26)
            objc_enumerationMutation(v24);
          if ((objc_msgSend(v23, "safari_isCaseInsensitiveEqualToString:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i)) & 1) != 0)
          {
            objc_msgSend(v14, "substringFromIndex:", v22);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "stringByTrimmingCharactersInSet:", v31);
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(a1, "_monogramStringForPreparedTitle:url:", v29, v8);
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_31;
          }
        }
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
        if (v25)
          continue;
        break;
      }
    }

  }
  objc_msgSend(a1, "_monogramStringForPreparedTitle:url:", v14, v8);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v14;
LABEL_31:

  return v28;
}

+ (id)_monogramStringForPreparedTitle:(id)a3 url:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;

  v6 = a4;
  objc_msgSend(a3, "safari_monogramString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    v8 = v7;
  }
  else
  {
    objc_msgSend(a1, "monogramStringForURL:", v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

void __95__WBSTemplateIconMonogramGenerator_monogramStringForTitle_url_shouldRemoveGrammaticalArticles___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  _WBSLocalizedString();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(v0, "componentsSeparatedByString:", CFSTR(","), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v6, "length"))
          objc_msgSend(v1, "addObject:", v6);
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v3);
  }

  objc_msgSend(v1, "addObjectsFromArray:", &unk_1E547C288);
  objc_msgSend(v1, "allObjects");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)+[WBSTemplateIconMonogramGenerator monogramStringForTitle:url:shouldRemoveGrammaticalArticles:]::prefixesToIgnore;
  +[WBSTemplateIconMonogramGenerator monogramStringForTitle:url:shouldRemoveGrammaticalArticles:]::prefixesToIgnore = v7;

}

+ (id)monogramStringForURL:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;

  objc_msgSend(a3, "safari_userVisibleHost");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_highLevelDomainFromHost");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (void *)v4;
  else
    v6 = v3;
  v7 = v6;

  objc_msgSend(v7, "safari_monogramString");
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
    v8 = &stru_1E5449658;
  v10 = v8;

  return v10;
}

+ (id)monogramWithTitle:(id)a3 url:(id)a4 monogramConfiguration:(id)a5
{
  objc_msgSend(a1, "monogramWithTitle:url:monogramConfiguration:shouldRemoveGrammaticalArticles:", a3, a4, a5, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)monogramWithTitle:(id)a3 url:(id)a4 monogramConfiguration:(id)a5 shouldRemoveGrammaticalArticles:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  uint64_t v28;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v12, "iconSize");
  v14 = v13;
  v16 = v15;
  objc_msgSend(v12, "fontSize");
  v18 = v17;
  v19 = objc_msgSend(v12, "fontWeight");
  v20 = objc_msgSend(v12, "fontDesign");
  objc_msgSend(v12, "baselineOffset");
  v22 = v21;
  objc_msgSend(v12, "backgroundColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "foregroundColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "cornerRadius");
  LOBYTE(v28) = a6;
  objc_msgSend(a1, "monogramWithTitle:url:size:fontSize:fontWeight:fontDesign:baselineOffset:backgroundColor:foregroundColor:cornerRadius:shouldRemoveGrammaticalArticles:", v10, v11, v19, v20, v23, v24, v14, v16, v18, v22, v25, v28);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

+ (id)monogramWithTitle:(id)a3 url:(id)a4 backgroundColor:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a3;
  v9 = a4;
  +[WBSTemplateIconMonogramConfiguration configurationWithBackgroundColor:](WBSTemplateIconMonogramConfiguration, "configurationWithBackgroundColor:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "monogramWithTitle:url:monogramConfiguration:", v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)monogramWithTitle:(id)a3 url:(id)a4 size:(CGSize)a5 fontSize:(double)a6 fontWeight:(int64_t)a7 fontDesign:(int64_t)a8 baselineOffset:(double)a9 backgroundColor:(id)a10 cornerRadius:(double)a11
{
  double height;
  double width;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;

  height = a5.height;
  width = a5.width;
  v21 = a3;
  v22 = a4;
  v23 = a10;
  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "monogramWithTitle:url:size:fontSize:fontWeight:fontDesign:baselineOffset:backgroundColor:foregroundColor:cornerRadius:", v21, v22, a7, a8, v23, v24, width, height, a6, a9, a11);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

+ (id)monogramWithTitle:(id)a3 url:(id)a4 size:(CGSize)a5 fontSize:(double)a6 fontWeight:(int64_t)a7 fontDesign:(int64_t)a8 baselineOffset:(double)a9 backgroundColor:(id)a10 foregroundColor:(id)a11 cornerRadius:(double)a12
{
  uint64_t v13;

  LOBYTE(v13) = 1;
  objc_msgSend(a1, "monogramWithTitle:url:size:fontSize:fontWeight:fontDesign:baselineOffset:backgroundColor:foregroundColor:cornerRadius:shouldRemoveGrammaticalArticles:", a3, a4, a7, a8, a10, a11, a5.width, a5.height, a6, a9, a12, v13);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)monogramWithTitle:(id)a3 url:(id)a4 size:(CGSize)a5 fontSize:(double)a6 fontWeight:(int64_t)a7 fontDesign:(int64_t)a8 baselineOffset:(double)a9 backgroundColor:(id)a10 foregroundColor:(id)a11 cornerRadius:(double)a12 shouldRemoveGrammaticalArticles:(BOOL)a13
{
  double height;
  double width;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  double v35;
  double v36;
  double v37;
  double v38;
  int64_t v39;
  int64_t v40;

  height = a5.height;
  width = a5.width;
  v23 = a3;
  v24 = a4;
  v25 = a10;
  v26 = a11;
  objc_msgSend(a1, "monogramStringForTitle:url:shouldRemoveGrammaticalArticles:", v23, v24, a13);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v27, "length"))
  {
    if (!v25)
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.3, 1.0);
      v25 = (id)objc_claimAutoreleasedReturnValue();
    }
    v28 = (void *)MEMORY[0x1E0CEA638];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __186__WBSTemplateIconMonogramGenerator_monogramWithTitle_url_size_fontSize_fontWeight_fontDesign_baselineOffset_backgroundColor_foregroundColor_cornerRadius_shouldRemoveGrammaticalArticles___block_invoke;
    v31[3] = &unk_1E5446BC0;
    v35 = width;
    v36 = height;
    v25 = v25;
    v32 = v25;
    v37 = a12;
    v38 = a6;
    v39 = a7;
    v40 = a8;
    v33 = v26;
    v34 = v27;
    objc_msgSend(v28, "safari_imageWithSize:actions:", v31, width, height);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v29 = 0;
  }

  return v29;
}

void __186__WBSTemplateIconMonogramGenerator_monogramWithTitle_url_size_fontSize_fontWeight_fontDesign_baselineOffset_backgroundColor_foregroundColor_cornerRadius_shouldRemoveGrammaticalArticles___block_invoke(uint64_t a1, CGContextRef c)
{
  const CGPath *v4;
  void *v5;
  void *v6;
  WBSCachedFont *v7;
  double v8;
  double v9;
  uint64_t v10;
  WBSCachedFont *v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  CGFloat v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  CGRect rect;
  _QWORD v45[4];
  CGRect v46;

  v45[3] = *MEMORY[0x1E0C80C00];
  CGContextSaveGState(c);
  objc_msgSend(*(id *)(a1 + 32), "setFill");
  v4 = (const CGPath *)CGPathCreateWithContinuousRoundedRect();
  CGContextAddPath(c, v4);
  CGContextFillPath(c);
  CGPathRelease(v4);
  if ((_ZGVZZ186__WBSTemplateIconMonogramGenerator_monogramWithTitle_url_size_fontSize_fontWeight_fontDesign_baselineOffset_backgroundColor_foregroundColor_cornerRadius_shouldRemoveGrammaticalArticles__EUb_E14paragraphStyle & 1) == 0)
  {
    __186__WBSTemplateIconMonogramGenerator_monogramWithTitle_url_size_fontSize_fontWeight_fontDesign_baselineOffset_backgroundColor_foregroundColor_cornerRadius_shouldRemoveGrammaticalArticles___block_invoke_2();
    _ZZZ186__WBSTemplateIconMonogramGenerator_monogramWithTitle_url_size_fontSize_fontWeight_fontDesign_baselineOffset_backgroundColor_foregroundColor_cornerRadius_shouldRemoveGrammaticalArticles__EUb_E14paragraphStyle = objc_claimAutoreleasedReturnValue();
    _ZGVZZ186__WBSTemplateIconMonogramGenerator_monogramWithTitle_url_size_fontSize_fontWeight_fontDesign_baselineOffset_backgroundColor_foregroundColor_cornerRadius_shouldRemoveGrammaticalArticles__EUb_E14paragraphStyle = 1;
  }
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "threadDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("WBSTemplateIconMonogramGenerator_lastUsedFont"));
  v7 = (WBSCachedFont *)objc_claimAutoreleasedReturnValue();
  v8 = *(double *)(a1 + 80);
  -[WBSCachedFont size](v7, "size");
  if (v8 == v9)
  {
    v10 = *(_QWORD *)(a1 + 88);
    if (v10 == -[WBSCachedFont fontWeight](v7, "fontWeight"))
    {
      v11 = v7;
      goto LABEL_19;
    }
  }
  v12 = *(double *)(a1 + 80);
  v14 = *(_QWORD *)(a1 + 88);
  v13 = *(_QWORD *)(a1 + 96);
  v11 = objc_alloc_init(WBSCachedFont);
  -[WBSCachedFont setSize:](v11, "setSize:", v12);
  -[WBSCachedFont setFontWeight:](v11, "setFontWeight:", v14);
  -[WBSCachedFont setFontDesign:](v11, "setFontDesign:", v13);
  if (!v14)
  {
    v16 = (double *)MEMORY[0x1E0CA84C0];
    goto LABEL_12;
  }
  if (v14 == 1)
  {
    v16 = (double *)MEMORY[0x1E0CA84C8];
    goto LABEL_12;
  }
  v15 = 0.0;
  if (v14 == 2)
  {
    v16 = (double *)MEMORY[0x1E0CA84D0];
LABEL_12:
    v15 = *v16;
  }
  if (v13 == 1)
  {
    v18 = (void *)MEMORY[0x1E0CEA5E8];
    objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:weight:", v12, v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "fontDescriptor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "fontDescriptorWithDesign:", *MEMORY[0x1E0CEB4F8]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "fontWithDescriptor:size:", v21, v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (v13)
  {
    v17 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:weight:", v12, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[WBSCachedFont setFont:](v11, "setFont:", v17);

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("WBSTemplateIconMonogramGenerator_lastUsedFont"));
LABEL_19:
  -[WBSCachedFont font](v11, "font");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = *MEMORY[0x1E0CEA0D0];
  rect.origin.y = *(CGFloat *)MEMORY[0x1E0CEA098];
  rect.size.width = v23;
  v45[0] = v22;
  v45[1] = _ZZZ186__WBSTemplateIconMonogramGenerator_monogramWithTitle_url_size_fontSize_fontWeight_fontDesign_baselineOffset_backgroundColor_foregroundColor_cornerRadius_shouldRemoveGrammaticalArticles__EUb_E14paragraphStyle;
  rect.size.height = *(CGFloat *)MEMORY[0x1E0CEA0A0];
  v24 = *(void **)(a1 + 40);
  v25 = v24;
  if (!v24)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v45[2] = v25;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, &rect.origin.y, 3);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v26, "mutableCopy");

  if (!v24)
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(*(id *)(a1 + 48), "_isSingleEmoji"))
  {
    v28 = objc_alloc_init(MEMORY[0x1E0CEA240]);
    objc_msgSend(v28, "setShadowBlurRadius:", 1.0);
    objc_msgSend(v28, "setShadowOffset:", 1.0, 1.0);
    objc_msgSend(v27, "setObject:forKeyedSubscript:", v28, *MEMORY[0x1E0CEA0F0]);

  }
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", *(_QWORD *)(a1 + 48), v27);
  objc_msgSend(v29, "boundingRectWithSize:options:context:", 0, 0, *(double *)(a1 + 56), *(double *)(a1 + 64));
  rect.origin.x = v30;
  v32 = v31;
  v34 = v33;
  v36 = v35;
  objc_msgSend(v22, "ascender");
  v38 = v37;
  objc_msgSend(v22, "capHeight");
  v40 = v39;
  v41 = *(double *)(a1 + 64);
  objc_msgSend(v22, "capHeight");
  v43 = v42;
  v46.origin.x = rect.origin.x;
  v46.origin.y = v32;
  v46.size.width = v34;
  v46.size.height = v36;
  objc_msgSend(v29, "drawInRect:", 0.0, v40 - v38 + (v41 - v43) * 0.5, *(double *)(a1 + 56), CGRectGetHeight(v46));
  CGContextRestoreGState(c);

}

id __186__WBSTemplateIconMonogramGenerator_monogramWithTitle_url_size_fontSize_fontWeight_fontDesign_baselineOffset_backgroundColor_foregroundColor_cornerRadius_shouldRemoveGrammaticalArticles___block_invoke_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA238], "defaultParagraphStyle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_msgSend(v0, "mutableCopy");

  objc_msgSend(v1, "setAlignment:", 1);
  return v1;
}

@end
