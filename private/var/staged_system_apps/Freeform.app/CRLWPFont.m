@implementation CRLWPFont

+ (id)missingFontPostScriptName
{
  return CFSTR("Helvetica");
}

+ (id)missingFont
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "missingFontPostScriptName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRLWPFont fontWithDesiredPostScriptName:](CRLWPFont, "fontWithDesiredPostScriptName:", v2));

  return v3;
}

+ (id)helveticaFont
{
  return +[CRLWPFont fontWithDesiredPostScriptName:](CRLWPFont, "fontWithDesiredPostScriptName:", CFSTR("Helvetica"));
}

+ (id)systemUIFontName
{
  return +[CRLWPSystemFontNames baseName](_TtC8Freeform20CRLWPSystemFontNames, "baseName");
}

+ (id)systemFont
{
  return _objc_msgSend(a1, "systemFontWithWeight:", UIFontWeightRegular);
}

+ (id)systemFontWithWeight:(double)a3
{
  return _objc_msgSend(a1, "systemFontOfSize:withWeight:", 12.0, a3);
}

+ (id)systemFontOfSize:(double)a3 withWeight:(double)a4
{
  void *v6;
  id v7;
  void *v8;
  id v9;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", a3));
  v7 = objc_alloc((Class)a1);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CRLWPSystemFontNames nameForWeight:](_TtC8Freeform20CRLWPSystemFontNames, "nameForWeight:", a4));
  v9 = objc_msgSend(v7, "initWithDesiredPostScriptName:platformFontDescriptor:andPlatformFont:ofType:", v8, 0, v6, 1);

  return v9;
}

+ (id)masqueradingFontNames
{
  if (qword_101414A98 != -1)
    dispatch_once(&qword_101414A98, &stru_10122C198);
  return (id)qword_101414A90;
}

+ (id)localizedMasqueradingFontFamilyNames
{
  if (qword_101414AA8 != -1)
    dispatch_once(&qword_101414AA8, &stru_10122C1B8);
  return (id)qword_101414AA0;
}

+ (CRLWPFont)fontWithDesiredPostScriptName:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithDesiredPostScriptName:size:", v4, 0.0);

  return (CRLWPFont *)v5;
}

+ (CRLWPFont)fontWithOpaqueIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "familyName"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "familyName"));

    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "baseFontForFamilyName:", v6));
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "desiredPostScriptName"));

    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "fontWithDesiredPostScriptName:", v6));
  }
  v8 = (void *)v7;

  return (CRLWPFont *)v8;
}

+ (CRLWPFont)fontWithDesiredPostScriptName:(id)a3 fallbackFont:(id)a4 ofType:(unint64_t)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v8 = a4;
  v9 = a3;
  v10 = objc_alloc((Class)a1);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "platformFont"));

  v12 = objc_msgSend(v10, "initWithDesiredPostScriptName:platformFontDescriptor:andPlatformFont:ofType:", v9, 0, v11, a5);
  return (CRLWPFont *)v12;
}

+ (CRLWPFont)fontWithDesiredPostScriptName:(id)a3 atSize:(double)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = objc_msgSend(objc_alloc((Class)a1), "initWithDesiredPostScriptName:size:", v6, a4);

  return (CRLWPFont *)v7;
}

+ (id)baseFontWithDescriptor:(id)a3
{
  const __CTFontDescriptor *v4;
  CTFontRef v5;
  id v6;
  void *v7;
  id v8;

  v4 = (const __CTFontDescriptor *)a3;
  v5 = CTFontCreateWithFontDescriptor(v4, 0.0, 0);
  v6 = objc_alloc((Class)a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[__CTFontDescriptor postscriptName](v4, "postscriptName"));
  v8 = objc_msgSend(v6, "initWithDesiredPostScriptName:platformFontDescriptor:andPlatformFont:ofType:", v7, v4, v5, 1);

  return v8;
}

+ (id)baseFontForFamilyName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  const __CFDictionary *v9;
  const __CTFontDescriptor *v10;
  const __CTFontDescriptor *v11;
  CTFontRef v12;
  void *v13;
  void *v14;
  unsigned int v15;
  CRLWPFont *v16;
  CRLWPFont *v17;
  CRLWPFont *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  CFStringRef v24;
  id v25;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "helveticaFont"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "familyName"));
  v7 = objc_msgSend(v4, "isEqual:", v6);

  if (v7)
  {
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "helveticaFont"));
LABEL_19:
    v18 = (CRLWPFont *)v8;
    goto LABEL_20;
  }
  if (!v4)
    goto LABEL_18;
  v24 = kCTFontFamilyNameAttribute;
  v25 = v4;
  v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1));
  v10 = CTFontDescriptorCreateWithAttributes(v9);
  if (!v10)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122C1D8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE74F8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122C1F8);
    v19 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLWPFont baseFontForFamilyName:]"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Fonts/CRLWPFont.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v20, v21, 165, 0, "invalid nil value for '%{public}s'", "desc");

    goto LABEL_18;
  }
  v11 = v10;
  v12 = CTFontCreateWithFontDescriptor(v10, 0.0, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[__CTFont fontName](v12, "fontName"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[CRLWPFont missingFontPostScriptName](CRLWPFont, "missingFontPostScriptName"));
  v15 = objc_msgSend(v13, "isEqual:", v14);

  v16 = [CRLWPFont alloc];
  v17 = v16;
  if (v15)
  {
    v18 = -[CRLWPFont initWithDesiredPostScriptName:](v16, "initWithDesiredPostScriptName:", v4);
  }
  else
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[__CTFont fontName](v12, "fontName"));
    v18 = -[CRLWPFont initWithDesiredPostScriptName:platformFontDescriptor:andPlatformFont:ofType:](v17, "initWithDesiredPostScriptName:platformFontDescriptor:andPlatformFont:ofType:", v22, v11, v12, 1);

  }
  CFRelease(v11);

  if (!v18)
  {
LABEL_18:
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "missingFont"));
    goto LABEL_19;
  }
LABEL_20:

  return v18;
}

+ (id)loadPlatformFontOrFallbackForPostScriptName:(id)a3 size:(double)a4 foundType:(unint64_t *)a5
{
  id v8;
  __objc2_class **p_superclass;
  void *v10;
  double v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  uint64_t v21;
  void *v22;
  unsigned int v23;
  void *v24;
  unsigned int v25;
  uint64_t v26;
  unint64_t *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];

  v8 = a3;
  *a5 = 1;
  p_superclass = CRLiOSSheetViewController.superclass;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CRLWPFontVerifier sharedInstance](CRLWPFontVerifier, "sharedInstance"));
  if (objc_msgSend(a1, "isSystemUIFontIdentifier:", v8))
  {
    +[CRLWPSystemFontNames weightForName:](_TtC8Freeform20CRLWPSystemFontNames, "weightForName:", v8);
    v12 = objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", a4, v11));
    goto LABEL_5;
  }
  if (objc_msgSend(v10, "isFontWithPostscriptNameInstalled:", v8))
  {
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "loadPlatformFontForPostScriptName:size:", v8, a4));
LABEL_5:
    v13 = (void *)v12;
    if (!v12)
      goto LABEL_6;
    goto LABEL_7;
  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[CRLWPFallbackFontList sharedInstance](CRLWPFallbackFontList, "sharedInstance"));
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "fallbackListForPostscriptFontName:", v8));
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (!v17)
  {
    v13 = 0;
    goto LABEL_24;
  }
  v18 = v17;
  v19 = *(_QWORD *)v30;
  v27 = a5;
  while (2)
  {
    for (i = 0; i != v18; i = (char *)i + 1)
    {
      if (*(_QWORD *)v30 != v19)
        objc_enumerationMutation(v16);
      v21 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
      if (objc_msgSend(v10, "isFontWithPostscriptNameInstalled:", v21, v27))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "loadPlatformFontForPostScriptName:size:", v21, a4));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "masqueradingFontNames"));
        v25 = objc_msgSend(v24, "containsObject:", v21);

        v26 = 2;
        if (v25)
          v26 = 3;
        goto LABEL_23;
      }
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "masqueradingFontNames"));
      v23 = objc_msgSend(v22, "containsObject:", v21);

      if (v23)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "loadPlatformFontForPostScriptName:size:", v21, a4));
        v26 = 3;
LABEL_23:
        a5 = v27;
        *v27 = v26;
        p_superclass = (__objc2_class **)(CRLiOSSheetViewController + 8);
        goto LABEL_24;
      }
    }
    v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    v13 = 0;
    a5 = v27;
    p_superclass = (__objc2_class **)(CRLiOSSheetViewController + 8);
    if (v18)
      continue;
    break;
  }
LABEL_24:

  if (!v13)
  {
LABEL_6:
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_superclass + 79, "missingFontName"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "loadPlatformFontForPostScriptName:size:", v14, a4));

    *a5 = 2;
  }
LABEL_7:

  return v13;
}

+ (BOOL)isSystemFontName:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
    v4 = objc_msgSend(v3, "characterAtIndex:", 0) == 46;
  else
    v4 = 0;

  return v4;
}

+ (BOOL)isSystemUIFontIdentifier:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CRLWPSystemFontNames allSystemFontNames](_TtC8Freeform20CRLWPSystemFontNames, "allSystemFontNames"));
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5;
}

+ (unint64_t)optionsForLoadingPlatformFontWithPostScriptName:(id)a3
{
  if (objc_msgSend(a1, "isSystemFontName:", a3))
    return 1024;
  else
    return 0;
}

+ (id)loadPlatformFontForPostScriptName:(id)a3 size:(double)a4
{
  __CFString *v6;
  CTFontRef v7;

  v6 = (__CFString *)a3;
  v7 = CTFontCreateWithNameAndOptions(v6, a4, 0, (CTFontOptions)objc_msgSend(a1, "optionsForLoadingPlatformFontWithPostScriptName:", v6));

  return v7;
}

+ (id)localizedFamilyNameForPlatformFont:(id)a3
{
  id v4;
  void *v5;
  __CFString *v6;
  void *v7;
  unsigned int v8;

  v4 = a3;
  if (+[CRLWPFont isSystemUIFontRef:](CRLWPFont, "isSystemUIFontRef:", v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("System Font"), 0, 0));

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fontName"));
    v8 = objc_msgSend(a1, "isSystemFontName:", v7);

    if (v8 || (v6 = (__CFString *)CTFontCopyLocalizedName((CTFontRef)v4, kCTFontFamilyNameKey, 0)) == 0)
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "familyName"));
  }

  return v6;
}

- (CRLWPFont)init
{
  return -[CRLWPFont initWithDesiredPostScriptName:size:](self, "initWithDesiredPostScriptName:size:", CFSTR("Helvetica"), 0.0);
}

- (CRLWPFont)initWithDesiredPostScriptName:(id)a3
{
  return -[CRLWPFont initWithDesiredPostScriptName:size:](self, "initWithDesiredPostScriptName:size:", a3, 0.0);
}

- (CRLWPFont)initWithDesiredPostScriptName:(id)a3 size:(double)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  CRLWPFont *v10;
  uint64_t v12;

  v12 = 0;
  v6 = a3;
  v8 = objc_msgSend((id)objc_opt_class(self, v7), "loadPlatformFontOrFallbackForPostScriptName:size:foundType:", v6, &v12, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = -[CRLWPFont initWithDesiredPostScriptName:platformFontDescriptor:andPlatformFont:ofType:](self, "initWithDesiredPostScriptName:platformFontDescriptor:andPlatformFont:ofType:", v6, 0, v9, v12);

  return v10;
}

- (CRLWPFont)initWithDesiredPostScriptName:(id)a3 platformFontDescriptor:(id)a4 andPlatformFont:(id)a5 ofType:(unint64_t)a6 localizedFamilyName:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  CRLWPFont *v21;
  CRLWPFont *v22;
  CTFontDescriptorRef v23;
  UIFontDescriptor *platformFontDescriptor;
  void *v25;
  uint64_t v26;
  NSString *familyName;
  NSString *v28;
  NSString *postScriptName;
  uint64_t v30;
  NSString *v31;
  void *v32;
  NSString *v33;
  NSString *v34;
  uint64_t v35;
  NSString *v36;
  uint64_t v37;
  NSString *localizedFamilyName;
  void *v39;
  NSString *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  NSMutableDictionary *alternatePlatformFonts;
  objc_super v49;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  if (!v13)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    v17 = v14;
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122C218);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE76A8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122C238);
    v18 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPFont initWithDesiredPostScriptName:platformFontDescriptor:andPlatformFont:ofType:localizedFamilyName:]"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Fonts/CRLWPFont.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v19, v20, 300, 0, "invalid nil value for '%{public}s'", "desiredPostScriptName");

    v14 = v17;
    v13 = 0;
  }
  v49.receiver = self;
  v49.super_class = (Class)CRLWPFont;
  v21 = -[CRLWPFont init](&v49, "init");
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_desiredPostScriptName, a3);
    v22->_type = a6;
    objc_storeStrong((id *)&v22->_platformFont, a5);
    if (v14)
      v23 = (CTFontDescriptorRef)v14;
    else
      v23 = CTFontCopyFontDescriptor((CTFontRef)v22->_platformFont);
    platformFontDescriptor = v22->_platformFontDescriptor;
    v22->_platformFontDescriptor = (UIFontDescriptor *)v23;

    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "familyName"));
    if (v25)
    {
      v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "familyName"));
      familyName = v22->_familyName;
      v22->_familyName = (NSString *)v26;
    }
    else
    {
      familyName = v22->_familyName;
      v22->_familyName = (NSString *)&stru_1012A72B0;
    }

    v28 = (NSString *)CTFontDescriptorCopyAttribute((CTFontDescriptorRef)v22->_platformFontDescriptor, kCTFontNameAttribute);
    postScriptName = v22->_postScriptName;
    v22->_postScriptName = v28;

    if (!v22->_postScriptName)
    {
      v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "fontName"));
      v31 = v22->_postScriptName;
      v22->_postScriptName = (NSString *)v30;

    }
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[CRLWPFallbackFontList sharedInstance](CRLWPFallbackFontList, "sharedInstance"));
    v33 = (NSString *)CTFontDescriptorCopyAttribute((CTFontDescriptorRef)v22->_platformFontDescriptor, kCTFontFamilyNameAttribute);
    v34 = v22->_familyName;
    v22->_familyName = v33;

    if (v16)
    {
      v36 = (NSString *)objc_msgSend(v16, "copy");
    }
    else
    {
      if (a6 == 3)
      {
        v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "localizedNameForMasqueradingFontName:", v13));
        localizedFamilyName = v22->_localizedFamilyName;
        v22->_localizedFamilyName = (NSString *)v37;

        if (v22->_localizedFamilyName)
        {
LABEL_36:
          if (!v22->_localizedFamilyName)
          {
            +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_10122C298);
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
              sub_100DE7588();
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_10122C2B8);
            v43 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
              sub_100DE7468(v43);
            v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPFont initWithDesiredPostScriptName:platformFontDescriptor:andPlatformFont:ofType:localizedFamilyName:]"));
            v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Fonts/CRLWPFont.m"));
            +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v44, v45, 335, 0, "Unable to acquire a localized family name for: %@", v22);

          }
          v46 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
          alternatePlatformFonts = v22->_alternatePlatformFonts;
          v22->_alternatePlatformFonts = (NSMutableDictionary *)v46;

          goto LABEL_47;
        }
        objc_storeStrong((id *)&v22->_localizedFamilyName, a3);
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10122C258);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE7618();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10122C278);
        v39 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE7468(v39);
        v40 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPFont initWithDesiredPostScriptName:platformFontDescriptor:andPlatformFont:ofType:localizedFamilyName:]"));
        v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Fonts/CRLWPFont.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v40, v41, 330, 0, "Masquerading font with no localized name found: %@", v22);

        v16 = 0;
LABEL_35:

        goto LABEL_36;
      }
      v42 = objc_msgSend((id)objc_opt_class(v22, v35), "localizedFamilyNameForPlatformFont:", v15);
      v36 = (NSString *)objc_claimAutoreleasedReturnValue(v42);
    }
    v40 = v22->_localizedFamilyName;
    v22->_localizedFamilyName = v36;
    goto LABEL_35;
  }
LABEL_47:

  return v22;
}

- (CRLWPFont)initWithDesiredPostScriptName:(id)a3 platformFontDescriptor:(id)a4 andPlatformFont:(id)a5 ofType:(unint64_t)a6
{
  return -[CRLWPFont initWithDesiredPostScriptName:platformFontDescriptor:andPlatformFont:ofType:localizedFamilyName:](self, "initWithDesiredPostScriptName:platformFontDescriptor:andPlatformFont:ofType:localizedFamilyName:", a3, a4, a5, a6, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  CRLWPFont *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  CRLWPFont *v9;

  v4 = [CRLWPFont alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPFont desiredPostScriptName](self, "desiredPostScriptName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPFont platformFont](self, "platformFont"));
  v7 = -[CRLWPFont type](self, "type");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPFont localizedFamilyName](self, "localizedFamilyName"));
  v9 = -[CRLWPFont initWithDesiredPostScriptName:platformFontDescriptor:andPlatformFont:ofType:localizedFamilyName:](v4, "initWithDesiredPostScriptName:platformFontDescriptor:andPlatformFont:ofType:localizedFamilyName:", v5, 0, v6, v7, v8);

  return v9;
}

+ (BOOL)isSystemUIFontRef:(__CTFont *)a3
{
  return CTFontGetTextStyle(a3, a2) != 0;
}

- (NSString)desiredPostScriptName
{
  NSString *v3;

  if (+[CRLWPFont isSystemUIFontRef:](CRLWPFont, "isSystemUIFontRef:", -[CRLWPFont ctFont](self, "ctFont")))
  {
    CTFontGetWeight(-[CRLWPFont ctFont](self, "ctFont"));
    v3 = (NSString *)objc_claimAutoreleasedReturnValue(+[CRLWPSystemFontNames nameForWeight:](_TtC8Freeform20CRLWPSystemFontNames, "nameForWeight:"));
  }
  else
  {
    v3 = self->_desiredPostScriptName;
  }
  return v3;
}

- (BOOL)isMasqueradingFontName
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRLWPFont masqueradingFontNames](CRLWPFont, "masqueradingFontNames"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPFont postScriptName](self, "postScriptName"));
  v5 = objc_msgSend(v3, "containsObject:", v4);

  return v5;
}

- (BOOL)isMasqueradingFont
{
  return (id)-[CRLWPFont type](self, "type") == (id)3;
}

- (BOOL)isFallbackFont
{
  return (id)-[CRLWPFont type](self, "type") == (id)2;
}

- (BOOL)isRequestedFont
{
  return (id)-[CRLWPFont type](self, "type") == (id)1;
}

- (BOOL)isBaseFontEqualToBaseFontFor:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPFont baseFont](self, "baseFont"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "baseFont"));

  LOBYTE(v4) = objc_msgSend(v5, "isEqual:", v6);
  return (char)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  CRLWPFont *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  BOOL v14;

  v4 = a3;
  v6 = objc_opt_class(CRLWPFont, v5);
  v7 = sub_100221D0C(v6, v4);
  v8 = (CRLWPFont *)objc_claimAutoreleasedReturnValue(v7);

  if (v8 == self)
    goto LABEL_5;
  if (!v8)
    goto LABEL_7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPFont platformFont](self, "platformFont"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPFont platformFont](v8, "platformFont"));
  if ((objc_msgSend(v9, "isEqual:", v10) & 1) == 0)
  {

    goto LABEL_7;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPFont desiredPostScriptName](self, "desiredPostScriptName"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPFont desiredPostScriptName](v8, "desiredPostScriptName"));
  v13 = objc_msgSend(v11, "isEqual:", v12);

  if ((v13 & 1) == 0)
  {
LABEL_7:
    v14 = 0;
    goto LABEL_8;
  }
LABEL_5:
  v14 = 1;
LABEL_8:

  return v14;
}

- (unint64_t)hash
{
  CRLHasher *v3;
  double v4;

  if (!-[CRLWPFont hashValue](self, "hashValue"))
  {
    v3 = objc_alloc_init(CRLHasher);
    -[CRLHasher addObject:](v3, "addObject:", self->_postScriptName);
    -[CRLHasher addObject:](v3, "addObject:", self->_desiredPostScriptName);
    -[UIFont pointSize](self->_platformFont, "pointSize");
    -[CRLHasher addInt:](v3, "addInt:", (int)(v4 * 1000.0));
    -[CRLWPFont setHashValue:](self, "setHashValue:", -[CRLHasher hashValue](v3, "hashValue"));

  }
  return -[CRLWPFont hashValue](self, "hashValue");
}

- (__CTFont)ctFont
{
  void *v2;
  CFTypeRef v3;
  __CTFont *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPFont platformFont](self, "platformFont"));
  v3 = CFRetain(v2);
  v4 = (__CTFont *)CFAutorelease(v3);

  return v4;
}

- (__CTFont)ctFontForSize:(double)a3
{
  double v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CFTypeRef v14;
  __CTFont *v15;
  CTFontRef CopyWithAttributes;
  void *v17;
  void *v18;

  -[CRLWPFont size](self, "size");
  if (v5 == a3)
    return -[CRLWPFont ctFont](self, "ctFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPFont postScriptName](self, "postScriptName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CRLWPFontCacheKey cacheKeyWithFontName:size:](CRLWPFontCacheKey, "cacheKeyWithFontName:size:", v7, a3));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPFont alternatePlatformFonts](self, "alternatePlatformFonts"));
  objc_sync_enter(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPFont alternatePlatformFonts](self, "alternatePlatformFonts"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v8));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPFont alternatePlatformFonts](self, "alternatePlatformFonts"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v8));
    v14 = CFRetain(v13);
    v15 = (__CTFont *)CFAutorelease(v14);

    objc_sync_exit(v9);
  }
  else
  {
    objc_sync_exit(v9);

    CopyWithAttributes = CTFontCreateCopyWithAttributes(-[CRLWPFont ctFont](self, "ctFont"), a3, 0, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPFont alternatePlatformFonts](self, "alternatePlatformFonts"));
    objc_sync_enter(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPFont alternatePlatformFonts](self, "alternatePlatformFonts"));
    objc_msgSend(v18, "setObject:forKeyedSubscript:", CopyWithAttributes, v8);

    objc_sync_exit(v17);
    v15 = (__CTFont *)CFAutorelease(CopyWithAttributes);
  }

  return v15;
}

- (__CTFont)ctFontForSize:(double)a3 bold:(BOOL)a4 italic:(BOOL)a5 traits:(id)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  CFTypeRef v18;
  __CTFont *v19;
  CTFontDescriptorRef v20;
  const __CTFontDescriptor *v21;
  const __CFDictionary *v22;
  const __CTFontDescriptor *CopyWithAttributes;
  CTFontRef v24;

  v6 = a5;
  v7 = a4;
  v10 = a6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPFont postScriptName](self, "postScriptName"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[CRLWPFontCacheKey cacheKeyWithFontName:fontSize:bold:italic:fontFeatures:](CRLWPFontCacheKey, "cacheKeyWithFontName:fontSize:bold:italic:fontFeatures:", v11, v7, v6, v10, a3));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPFont alternatePlatformFonts](self, "alternatePlatformFonts"));
  objc_sync_enter(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPFont alternatePlatformFonts](self, "alternatePlatformFonts"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v12));

  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPFont alternatePlatformFonts](self, "alternatePlatformFonts"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", v12));
    v18 = CFRetain(v17);
    v19 = (__CTFont *)CFAutorelease(v18);

  }
  else
  {
    objc_sync_exit(v13);

    v19 = -[CRLWPFont ctFontForSize:bold:italic:](self, "ctFontForSize:bold:italic:", v7, v6, a3);
    if (objc_msgSend(v10, "count"))
    {
      v20 = CTFontCopyFontDescriptor(v19);
      if (v20)
      {
        v21 = v20;
        v22 = (const __CFDictionary *)objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", v10, kCTFontFeatureSettingsAttribute, 0);
        CopyWithAttributes = CTFontDescriptorCreateCopyWithAttributes(v21, v22);
        CFRelease(v21);
        if (CopyWithAttributes)
        {
          v24 = CTFontCreateWithFontDescriptor(CopyWithAttributes, a3, 0);
          CFRelease(CopyWithAttributes);
          if (v24)
            v19 = (__CTFont *)CFAutorelease(v24);
        }

      }
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPFont alternatePlatformFonts](self, "alternatePlatformFonts"));
    objc_sync_enter(v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPFont alternatePlatformFonts](self, "alternatePlatformFonts"));
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v19, v12);
  }

  objc_sync_exit(v13);
  return v19;
}

- (__CTFont)ctFontForSize:(double)a3 bold:(BOOL)a4 italic:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  CFTypeRef v16;
  __CTFont *v17;
  const __CTFont *v18;
  CTFontSymbolicTraits SymbolicTraits;
  CTFontSymbolicTraits v20;
  int v21;
  CTFontRef CopyWithSymbolicTraits;
  const __CTFont *v23;
  CTFontRef v24;
  const __CTFont *v25;
  void *v26;
  void *v27;

  v5 = a5;
  v6 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPFont postScriptName](self, "postScriptName"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CRLWPFontCacheKey cacheKeyWithFontName:fontSize:bold:italic:fontFeatures:](CRLWPFontCacheKey, "cacheKeyWithFontName:fontSize:bold:italic:fontFeatures:", v9, v6, v5, 0, a3));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPFont alternatePlatformFonts](self, "alternatePlatformFonts"));
  objc_sync_enter(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPFont alternatePlatformFonts](self, "alternatePlatformFonts"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v10));

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPFont alternatePlatformFonts](self, "alternatePlatformFonts"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v10));
    v16 = CFRetain(v15);
    v17 = (__CTFont *)CFAutorelease(v16);

    objc_sync_exit(v11);
  }
  else
  {
    objc_sync_exit(v11);

    v18 = (const __CTFont *)CFRetain(-[CRLWPFont ctFontForSize:](self, "ctFontForSize:", a3));
    SymbolicTraits = CTFontGetSymbolicTraits(v18);
    v20 = SymbolicTraits;
    if (((SymbolicTraits & 2) == 0) == v6)
    {
      v21 = v6 ? 2 : 0;
      CopyWithSymbolicTraits = CTFontCreateCopyWithSymbolicTraits(v18, a3, 0, SymbolicTraits & 0xFFFFFFFD | v21, 2u);
      if (CopyWithSymbolicTraits)
      {
        v23 = CopyWithSymbolicTraits;
        if (v18 == CopyWithSymbolicTraits)
        {
          CFRelease(v18);
        }
        else
        {
          CFRelease(v18);
          v18 = v23;
        }
      }
    }
    if (((v20 & 1) == 0) == v5)
    {
      v24 = CTFontCreateCopyWithSymbolicTraits(v18, a3, 0, v20 & 0xFFFFFFFE | v5, 1u);
      if (v24)
      {
        v25 = v24;
        if (v18 == v24)
        {
          CFRelease(v18);
        }
        else
        {
          CFRelease(v18);
          v18 = v25;
        }
      }
    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPFont alternatePlatformFonts](self, "alternatePlatformFonts"));
    objc_sync_enter(v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPFont alternatePlatformFonts](self, "alternatePlatformFonts"));
    objc_msgSend(v27, "setObject:forKeyedSubscript:", v18, v10);

    objc_sync_exit(v26);
    v17 = (__CTFont *)CFAutorelease(v18);
  }

  return v17;
}

- (id)copyWithSize:(double)a3
{
  __CTFont *v4;
  void *v5;
  uint64_t v6;
  CRLWPFont *v7;
  unint64_t v8;
  void *v9;
  CRLWPFont *v10;

  v4 = -[CRLWPFont ctFontForSize:](self, "ctFontForSize:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[__CTFont fontName](v4, "fontName"));
  if (!-[CRLWPFont isRequestedFont](self, "isRequestedFont"))
  {
    v6 = objc_claimAutoreleasedReturnValue(-[CRLWPFont desiredPostScriptName](self, "desiredPostScriptName"));

    v5 = (void *)v6;
  }
  v7 = [CRLWPFont alloc];
  v8 = -[CRLWPFont type](self, "type");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPFont localizedFamilyName](self, "localizedFamilyName"));
  v10 = -[CRLWPFont initWithDesiredPostScriptName:platformFontDescriptor:andPlatformFont:ofType:localizedFamilyName:](v7, "initWithDesiredPostScriptName:platformFontDescriptor:andPlatformFont:ofType:localizedFamilyName:", v5, 0, v4, v8, v9);

  return v10;
}

- (id)copyWithSize:(double)a3 bold:(BOOL)a4 italic:(BOOL)a5
{
  __CTFont *v6;
  void *v7;
  uint64_t v8;
  CRLWPFont *v9;
  unint64_t v10;
  void *v11;
  CRLWPFont *v12;

  v6 = -[CRLWPFont ctFontForSize:bold:italic:](self, "ctFontForSize:bold:italic:", a4, a5, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[__CTFont fontName](v6, "fontName"));
  if (!-[CRLWPFont isRequestedFont](self, "isRequestedFont"))
  {
    v8 = objc_claimAutoreleasedReturnValue(-[CRLWPFont desiredPostScriptName](self, "desiredPostScriptName"));

    v7 = (void *)v8;
  }
  v9 = [CRLWPFont alloc];
  v10 = -[CRLWPFont type](self, "type");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPFont localizedFamilyName](self, "localizedFamilyName"));
  v12 = -[CRLWPFont initWithDesiredPostScriptName:platformFontDescriptor:andPlatformFont:ofType:localizedFamilyName:](v9, "initWithDesiredPostScriptName:platformFontDescriptor:andPlatformFont:ofType:localizedFamilyName:", v7, 0, v6, v10, v11);

  return v12;
}

- (id)copyWithSize:(double)a3 bold:(BOOL)a4 italic:(BOOL)a5 traits:(id)a6
{
  __CTFont *v7;
  void *v8;
  uint64_t v9;
  CRLWPFont *v10;
  unint64_t v11;
  void *v12;
  CRLWPFont *v13;

  v7 = -[CRLWPFont ctFontForSize:bold:italic:traits:](self, "ctFontForSize:bold:italic:traits:", a4, a5, a6, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[__CTFont fontName](v7, "fontName"));
  if (!-[CRLWPFont isRequestedFont](self, "isRequestedFont"))
  {
    v9 = objc_claimAutoreleasedReturnValue(-[CRLWPFont desiredPostScriptName](self, "desiredPostScriptName"));

    v8 = (void *)v9;
  }
  v10 = [CRLWPFont alloc];
  v11 = -[CRLWPFont type](self, "type");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPFont localizedFamilyName](self, "localizedFamilyName"));
  v13 = -[CRLWPFont initWithDesiredPostScriptName:platformFontDescriptor:andPlatformFont:ofType:localizedFamilyName:](v10, "initWithDesiredPostScriptName:platformFontDescriptor:andPlatformFont:ofType:localizedFamilyName:", v8, 0, v7, v11, v12);

  return v13;
}

- (NSString)displayName
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPFont localizedFamilyName](self, "localizedFamilyName"));
  if (-[CRLWPFont isFallbackFont](self, "isFallbackFont") || !v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(-[CRLWPFont desiredPostScriptName](self, "desiredPostScriptName"));

    v3 = (void *)v4;
  }
  return (NSString *)v3;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPFont displayName](self, "displayName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPFont desiredPostScriptName](self, "desiredPostScriptName"));
  if (-[CRLWPFont isFallbackFont](self, "isFallbackFont"))
    v8 = CFSTR("Fallback");
  else
    v8 = CFSTR("Requested");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPFont postScriptName](self, "postScriptName"));
  -[CRLWPFont size](self, "size");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: <%p> Display: %@ (Wanted: %@ - Status: %@ as: %@) @ %.2fpts"), v5, self, v6, v7, v8, v9, v10));

  return v11;
}

- (NSArray)familyFaces
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPFont familyName](self, "familyName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "facesOfFontFamily:", v4));

  return (NSArray *)v5;
}

- (double)size
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPFont platformFont](self, "platformFont"));
  objc_msgSend(v2, "pointSize");
  v4 = v3;

  return v4;
}

- (BOOL)bold
{
  return (CTFontGetSymbolicTraits(-[CRLWPFont ctFont](self, "ctFont")) >> 1) & 1;
}

- (BOOL)italic
{
  return CTFontGetSymbolicTraits(-[CRLWPFont ctFont](self, "ctFont")) & 1;
}

- (CRLWPFont)baseFont
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (-[CRLWPFont isRequestedFont](self, "isRequestedFont"))
  {
    v4 = (void *)objc_opt_class(self, v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPFont familyName](self, "familyName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "postScriptNameForFamilyName:", v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CRLWPFont fontWithDesiredPostScriptName:](CRLWPFont, "fontWithDesiredPostScriptName:", v6));

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPFont desiredPostScriptName](self, "desiredPostScriptName"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CRLWPFont fontWithDesiredPostScriptName:](CRLWPFont, "fontWithDesiredPostScriptName:", v5));
  }

  return (CRLWPFont *)v7;
}

+ (id)facesOfFontFamily:(id)a3
{
  id v3;
  void *v4;
  const __CFDictionary *v5;
  const __CTFontDescriptor *v6;
  CFArrayRef MatchingFontDescriptors;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  const __CTFontDescriptor *v13;
  CFDictionaryRef v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CTFontDescriptor *v20;
  const __CFArray *v21;
  const __CFDictionary *v22;
  void *v23;
  NSMutableArray *v24;
  const __CFArray *obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  CFStringRef v31;
  id v32;

  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122C2D8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7738();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122C2F8);
    v18 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v18);
    v5 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLWPFont facesOfFontFamily:]"));
    MatchingFontDescriptors = (CFArrayRef)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Fonts/CRLWPFont.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, MatchingFontDescriptors, 590, 0, "invalid nil value for '%{public}s'", "fontFamily");
    v24 = (NSMutableArray *)&__NSArray0__struct;
    goto LABEL_24;
  }
  v31 = kCTFontFamilyNameAttribute;
  v32 = v3;
  v5 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1));
  v6 = CTFontDescriptorCreateWithAttributes(v5);
  v24 = objc_opt_new(NSMutableArray);
  if (v6)
  {
    MatchingFontDescriptors = CTFontDescriptorCreateMatchingFontDescriptors(v6, 0);
    if (MatchingFontDescriptors)
    {
      v20 = v6;
      v22 = v5;
      v23 = v4;
      v8 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", -[__CFArray count](MatchingFontDescriptors, "count"));
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v21 = MatchingFontDescriptors;
      obj = MatchingFontDescriptors;
      v9 = -[__CFArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v27;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(_QWORD *)v27 != v11)
              objc_enumerationMutation(obj);
            v13 = *(const __CTFontDescriptor **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
            v14 = CTFontDescriptorCopyAttributes(v13);
            if ((objc_msgSend(v8, "containsObject:", v14) & 1) == 0)
            {
              v15 = (void *)CTFontDescriptorCopyLocalizedAttribute(v13, kCTFontStyleNameAttribute, 0);
              v16 = (void *)CTFontDescriptorCopyAttribute(v13, kCTFontNameAttribute);
              v17 = (void *)objc_claimAutoreleasedReturnValue(+[CRLWPFontFace fontFaceWithPostScriptName:faceName:](CRLWPFontFace, "fontFaceWithPostScriptName:faceName:", v16, v15));
              -[NSMutableArray addObject:](v24, "addObject:", v17);

              objc_msgSend(v8, "addObject:", v14);
            }

          }
          v10 = -[__CFArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        }
        while (v10);
      }

      v5 = v22;
      v4 = v23;
      v6 = v20;
      MatchingFontDescriptors = v21;
    }
    CFRelease(v6);
LABEL_24:

  }
  return v24;
}

+ (id)postScriptNameForFamilyName:(id)a3
{
  id v3;
  void *v4;
  const __CFDictionary *v5;
  const __CTFontDescriptor *v6;
  const __CTFontDescriptor *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CFStringRef v13;
  id v14;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v13 = kCTFontFamilyNameAttribute;
    v14 = v3;
    v5 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
    v6 = CTFontDescriptorCreateWithAttributes(v5);
    if (v6)
    {
      v7 = v6;
      v8 = (void *)CTFontDescriptorCopyAttribute(v6, kCTFontNameAttribute);
      CFRelease(v7);
    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10122C318);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE77C8();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10122C338);
      v9 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLWPFont postScriptNameForFamilyName:]"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Fonts/CRLWPFont.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 627, 0, "invalid nil value for '%{public}s'", "desc");

      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)isKeyValueProxyLeafType
{
  return 1;
}

- (NSString)postScriptName
{
  return self->_postScriptName;
}

- (void)setPostScriptName:(id)a3
{
  objc_storeStrong((id *)&self->_postScriptName, a3);
}

- (NSString)familyName
{
  return self->_familyName;
}

- (void)setFamilyName:(id)a3
{
  objc_storeStrong((id *)&self->_familyName, a3);
}

- (void)setIsFallbackFont:(BOOL)a3
{
  self->_isFallbackFont = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (UIFont)platformFont
{
  return self->_platformFont;
}

- (void)setPlatformFont:(id)a3
{
  objc_storeStrong((id *)&self->_platformFont, a3);
}

- (NSString)localizedFamilyName
{
  return self->_localizedFamilyName;
}

- (void)setLocalizedFamilyName:(id)a3
{
  objc_storeStrong((id *)&self->_localizedFamilyName, a3);
}

- (UIFontDescriptor)platformFontDescriptor
{
  return self->_platformFontDescriptor;
}

- (void)setPlatformFontDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_platformFontDescriptor, a3);
}

- (unint64_t)hashValue
{
  return self->_hashValue;
}

- (void)setHashValue:(unint64_t)a3
{
  self->_hashValue = a3;
}

- (NSMutableDictionary)alternatePlatformFonts
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setAlternatePlatformFonts:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSArray)creationBacktrace
{
  return self->_creationBacktrace;
}

- (void)setCreationBacktrace:(id)a3
{
  objc_storeStrong((id *)&self->_creationBacktrace, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationBacktrace, 0);
  objc_storeStrong((id *)&self->_alternatePlatformFonts, 0);
  objc_storeStrong((id *)&self->_platformFontDescriptor, 0);
  objc_storeStrong((id *)&self->_localizedFamilyName, 0);
  objc_storeStrong((id *)&self->_platformFont, 0);
  objc_storeStrong((id *)&self->_familyName, 0);
  objc_storeStrong((id *)&self->_postScriptName, 0);
  objc_storeStrong((id *)&self->_desiredPostScriptName, 0);
}

@end
