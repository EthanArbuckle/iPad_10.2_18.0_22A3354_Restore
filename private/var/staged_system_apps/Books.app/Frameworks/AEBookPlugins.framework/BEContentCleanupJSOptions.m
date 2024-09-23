@implementation BEContentCleanupJSOptions

+ (id)cleanupJSOptionsForBookInfoSnapshot:(id)a3 withConfiguration:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  unsigned __int8 v17;
  id v18;
  uint64_t v20;
  uint64_t v21;

  v5 = a4;
  v6 = a3;
  if (objc_msgSend(v6, "isFixedLayout"))
    v7 = 3;
  else
    v7 = 2;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "style"));
  v9 = objc_msgSend(v8, "justification");

  v10 = v9;
  v11 = objc_alloc((Class)BEContentCleanupJSOptions);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "style"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "fontFamily"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bookLanguage"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "respectImageSizeClass"));
  v16 = objc_msgSend(v6, "respectImageSizeClassIsPrefix");
  v17 = objc_msgSend(v6, "hasBuiltInFonts");

  BYTE2(v21) = 0;
  LOWORD(v21) = 0;
  LOBYTE(v20) = v17;
  v18 = objc_msgSend(v11, "initWithMode:useNewTextStyling:fontFamily:language:respectImageSizeClass:respectImageSizeClassIsPrefix:hasBuiltInFonts:justification:fontWeight:overrideLineHeight:overrideLetterSpacing:overrideWordSpacing:readingMode:", v7, 0, v13, v14, v15, v16, v20, v10, 0, v21, 0);

  return v18;
}

@end
