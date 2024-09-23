@implementation ContentViewStyleManager

+ (void)initialize
{
  id v2;
  void *v3;

  if ((id)objc_opt_class(ContentViewStyleManager) == a1)
  {
    v2 = objc_alloc_init((Class)NSMutableSet);
    v3 = (void *)qword_20F5B0;
    qword_20F5B0 = (uint64_t)v2;

  }
}

+ (id)templateSet
{
  if (qword_20F5C0 != -1)
    dispatch_once(&qword_20F5C0, &stru_1C0FA0);
  return (id)qword_20F5B8;
}

+ (id)getPictureBookUserStyleSheetWithLegacyBook:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  const __CFString *v23;
  void *v24;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "templateSet"));
  v23 = CFSTR("legacyBook");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v3));
  v24 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));
  v16 = 0;
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "evaluateTemplateWithName:withData:error:", CFSTR("picturebook"), v6, &v16));
  v8 = (char *)v16;

  if (!v7)
  {
    v10 = BCIMLog(v9);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v18 = "+[ContentViewStyleManager getPictureBookUserStyleSheetWithLegacyBook:]";
      v19 = 2080;
      v20 = "/Library/Caches/com.apple.xbs/Sources/Alder/ios/AEBookPlugins/Shared/Utilities/StyleManager/ContentViewStyleManager.m";
      v21 = 1024;
      v22 = 76;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "%s %s:%d", buf, 0x1Cu);
    }

    v13 = BCIMLog(v12);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v8;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "@\"Error evaluating user_stylesheet_picturebook.css.tmpl: %@\", buf, 0xCu);
    }

    v7 = &stru_1C3088;
  }

  return v7;
}

+ (void)registerTheme:(id)a3
{
  objc_msgSend((id)qword_20F5B0, "addObject:", a3);
}

+ (id)registeredThemes
{
  return (id)qword_20F5B0;
}

+ (id)_templateCompatibleThemesForTraitCollection:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v3 = a3;
  v4 = objc_alloc((Class)NSMutableArray);
  v5 = objc_msgSend(v4, "initWithCapacity:", objc_msgSend((id)qword_20F5B0, "count"));
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = (id)qword_20F5B0;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v28;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v28 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v9);
        objc_opt_class(IMThemePage);
        v12 = BUDynamicCast(v11, v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        v14 = objc_alloc_init((Class)NSMutableDictionary);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stableIdentifier"));
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, CFSTR("identifier"));

        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "gaijiImageFilter"));
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, CFSTR("gaijiImageFilter"));

        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v13, "shouldInvertContent")));
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v17, CFSTR("shouldInvertContent"));

        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "backgroundsByLevel"));
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v18, CFSTR("backgroundsByLevel"));

        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "contentTextColor"));
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v19, CFSTR("contentTextColor"));

        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "linkActiveColor"));
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v20, CFSTR("linkActiveColor"));

        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "linkColor"));
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v21, CFSTR("linkColor"));

        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "linkVisitedColor"));
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v22, CFSTR("linkVisitedColor"));

        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v13, "overlayContentBackgroundColor")));
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v23, CFSTR("overlayContentBackgroundColor"));

        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "backgroundColorForTraitCollection:", v3));
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v24, CFSTR("contentBackgroundColor"));

        objc_msgSend(v5, "addObject:", v14);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v7);
  }

  return v5;
}

+ (id)getInlineStyleSheetForConfiguration:(id)a3 bookInfo:(id)a4 contentLayoutSize:(CGSize)a5 webkit2:(BOOL)a6
{
  _BOOL4 v6;
  double height;
  double width;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  char *v21;
  void *v22;
  id v23;
  unsigned int v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  float v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  unsigned __int8 v41;
  const __CFString *v42;
  _BOOL8 v43;
  unsigned int v44;
  __CFString *v45;
  __CFString *v46;
  unsigned int v47;
  __CFString *v48;
  uint64_t v49;
  const __CFString *v50;
  id v51;
  uint64_t v52;
  NSNumber *v53;
  void *v54;
  void *v55;
  void *v56;
  NSNumber *v57;
  void *v58;
  NSNumber *v59;
  void *v60;
  const __CFString *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  NSObject *v69;
  uint64_t v70;
  uint64_t v71;
  NSObject *v72;
  __CFString *v74;
  void *v75;
  const __CFString *v76;
  void *v77;
  __CFString *v78;
  void *v79;
  void *v80;
  void *v81;
  const __CFString *v82;
  void *v83;
  void *v84;
  void *v85;
  unsigned int v86;
  id v87;
  _BOOL4 v88;
  void *v89;
  id v90;
  void *v91;
  void *v92;
  __CFString *v93;
  id v94;
  _BYTE buf[24];
  void *v96;
  id v97;

  v6 = a6;
  height = a5.height;
  width = a5.width;
  v10 = a3;
  v11 = a4;
  v12 = v11;
  if (!v10)
  {
    v28 = 0;
    goto LABEL_41;
  }
  v88 = v6;
  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "language"));
  v14 = (void *)v13;
  v15 = (void *)BEiBooksDefaultLanguage;
  if (v13)
    v15 = (void *)v13;
  v16 = v15;

  v19 = isPad(v17, v18);
  v20 = width;
  if ((_DWORD)v19)
  {
    if (isPortrait(v19))
      v20 = width;
    else
      v20 = width * 1.39999998;
  }
  v86 = objc_msgSend(v10, "isScroll");
  v21 = (char *)objc_msgSend(v10, "layout");
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "respectImageSizeClass"));
  v23 = objc_msgSend(v22, "length");

  v89 = v12;
  if (v23)
  {
    v24 = objc_msgSend(v12, "respectImageSizeClassIsPrefix");
    v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "respectImageSizeClass"));
    v26 = (void *)v25;
    if (v24)
      v27 = CFSTR("[class|=%@]");
    else
      v27 = CFSTR("[class~=%@]");
    v93 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v27, v25));

  }
  else
  {
    v93 = &stru_1C3088;
  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "style"));
  v90 = v10;
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "environment"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "traitCollection"));
  v92 = (void *)objc_claimAutoreleasedReturnValue(+[ContentViewStyleManager _templateCompatibleThemesForTraitCollection:](ContentViewStyleManager, "_templateCompatibleThemesForTraitCollection:", v31));

  objc_msgSend(v29, "lineHeight");
  if (v32 == 1.0)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v34 = objc_msgSend(v33, "BOOLForKey:", CFSTR("BKUseOldFontStepsAndSpacing"));

  }
  else
  {
    v34 = &dword_0 + 1;
  }
  v35 = v16;
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[BKStyleManager styleManagerWithLanguage:](BKStyleManager, "styleManagerWithLanguage:", v35));

  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "fontFaceMappings"));
  *(_QWORD *)buf = _NSConcreteStackBlock;
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = sub_A4928;
  v96 = &unk_1C0FE8;
  v87 = v36;
  v97 = v87;
  objc_msgSend(v38, "enumerateKeysAndObjectsUsingBlock:", buf);

  v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v34));
  v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", width));
  v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", height));
  v39 = v29;
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "fontFamily"));
  if (!objc_msgSend(v40, "length"))
  {

    goto LABEL_22;
  }
  v41 = objc_msgSend(v39, "justification");

  if ((v41 & 1) == 0)
  {
LABEL_22:
    v42 = CFSTR("-webkit-auto");
    goto LABEL_23;
  }
  v42 = CFSTR("justify");
LABEL_23:
  v82 = v42;
  v43 = v21 == (_BYTE *)&dword_0 + 3;

  v91 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v23 != 0));
  v44 = objc_msgSend(v39, "autoHyphenate");
  v45 = CFSTR("manual");
  if (v44)
    v45 = CFSTR("auto");
  v46 = v45;
  v74 = v46;
  v47 = objc_msgSend(v39, "optimizeLegibility");
  v48 = CFSTR("optimizeLegibility");
  if (!v47)
    v48 = CFSTR("auto");
  v78 = v48;
  v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v20));
  v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "fontFamily"));
  v49 = objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "imSanitizedFontFamilyName"));
  v80 = (void *)v49;
  if (v49)
    v50 = (const __CFString *)v49;
  else
    v50 = &stru_1C3088;
  v76 = v50;
  v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "fontFamily"));
  v51 = sub_A3C44(v79, v35);
  v75 = (void *)objc_claimAutoreleasedReturnValue(v51);
  v53 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", isPhone(v75, v52));
  v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
  v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v86));
  v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v43));
  v57 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", sub_A4858(v35, CFSTR("ja")));
  v58 = (void *)objc_claimAutoreleasedReturnValue(v57);
  v59 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", sub_A4858(v35, CFSTR("zh")));
  v60 = (void *)objc_claimAutoreleasedReturnValue(v59);
  if (+[BKStyleManager languageIsSimplifiedChinese:](BKStyleManager, "languageIsSimplifiedChinese:", v35))
    v61 = CFSTR("'Songti SC', 'Songti TC'");
  else
    v61 = CFSTR("'Songti TC', 'Songti SC'");
  v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v88));
  v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v87, CFSTR("fonts"), v85, CFSTR("useLineHeight"), v84, CFSTR("pageWidth"), v83, CFSTR("pageHeight"), v82, CFSTR("justification"), v35, CFSTR("language"), v92, CFSTR("themes"), v93, CFSTR("respectImageSizeSelector"),
                    v91,
                    CFSTR("respectImageSizeSelectorIsGaiji"),
                    v46,
                    CFSTR("hyphens"),
                    v78,
                    CFSTR("textRendering"),
                    v77,
                    CFSTR("tdClamp"),
                    v76,
                    CFSTR("fontFamily"),
                    v75,
                    CFSTR("fontFallbacks"),
                    v54,
                    CFSTR("isPhone"),
                    &__kCFBooleanTrue,
                    CFSTR("isIOS"),
                    v55,
                    CFSTR("isScrollMode"),
                    v56,
                    CFSTR("scrollModeIsHorizontal"),
                    v58,
                    CFSTR("isJapanese"),
                    v60,
                    CFSTR("isChinese"),
                    v61,
                    CFSTR("defaultChineseFont"),
                    v62,
                    CFSTR("isWKTwo"),
                    v39,
                    CFSTR("style"),
                    0));

  v64 = (void *)objc_claimAutoreleasedReturnValue(+[ContentViewStyleManager templateSet](ContentViewStyleManager, "templateSet"));
  v94 = 0;
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "evaluateTemplateWithName:withData:error:", CFSTR("flowable"), v63, &v94));
  v66 = v94;

  if (v65)
  {
    v28 = v65;
    v12 = v89;
  }
  else
  {
    v68 = BCIMLog(v67);
    v69 = objc_claimAutoreleasedReturnValue(v68);
    v12 = v89;
    if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "+[ContentViewStyleManager(StylesheetGeneration) getInlineStyleSheetForConfiguration:bookInfo:"
                           "contentLayoutSize:webkit2:]";
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "/Library/Caches/com.apple.xbs/Sources/Alder/ios/AEBookPlugins/Shared/Utilities/StyleManager/"
                            "ContentViewStyleManager.m";
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v96) = 353;
      _os_log_impl(&dword_0, v69, OS_LOG_TYPE_INFO, "%s %s:%d", buf, 0x1Cu);
    }

    v71 = BCIMLog(v70);
    v72 = objc_claimAutoreleasedReturnValue(v71);
    if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v66;
      _os_log_impl(&dword_0, v72, OS_LOG_TYPE_INFO, "@\"Error evaluating user_stylesheet.css.tmpl: %@\", buf, 0xCu);
    }

    v28 = &stru_1C3088;
  }

  v10 = v90;
LABEL_41:

  return v28;
}

@end
