@implementation MOEventBundleLabelLocalizer

+ (id)_MomentsBundle
{
  return +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(MOEventBundleLabelLocalizer, a2));
}

+ (id)_MomentsDefaultLanguageBundle
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundleLabelLocalizer _MomentsBundle](MOEventBundleLabelLocalizer, "_MomentsBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "pathForResource:ofType:", CFSTR("en"), CFSTR("lproj")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", v3));

  return v4;
}

+ (id)preferredLocalization
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundleLabelLocalizer _MomentsBundle](MOEventBundleLabelLocalizer, "_MomentsBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "preferredLocalizations"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));

  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundleLabelLocalizer _MomentsDefaultLanguageBundle](MOEventBundleLabelLocalizer, "_MomentsDefaultLanguageBundle"));

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "preferredLocalizations"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));

    v2 = v5;
  }

  return v4;
}

+ (BOOL)isPreferredLanguageNounCap
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundleLabelLocalizer _MomentsBundle](MOEventBundleLabelLocalizer, "_MomentsBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "preferredLocalizations"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));

  LOBYTE(v3) = objc_msgSend(v4, "isEqualToString:", CFSTR("de"));
  return (char)v3;
}

+ (BOOL)isPreferredLanguageTitlecaseCapable
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", &off_1002DC710));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundleLabelLocalizer _MomentsBundle](MOEventBundleLabelLocalizer, "_MomentsBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "preferredLocalizations"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));

  LOBYTE(v4) = objc_msgSend(v2, "containsObject:", v5);
  return (char)v4;
}

+ (BOOL)isPreferredLanguageMidSentenceCaseCapable
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", &off_1002DC728));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundleLabelLocalizer _MomentsBundle](MOEventBundleLabelLocalizer, "_MomentsBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "preferredLocalizations"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));

  LOBYTE(v4) = objc_msgSend(v2, "containsObject:", v5) ^ 1;
  return (char)v4;
}

+ (id)_Moments_LocalizedNounForKey:(id)a3
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:](MOEventBundleLabelLocalizer, "_Moments_LocalizedStringForKey:", a3));
  if (+[MOEventBundleLabelLocalizer isPreferredLanguageNounCap](MOEventBundleLabelLocalizer, "isPreferredLanguageNounCap"))
  {
    v4 = objc_claimAutoreleasedReturnValue(+[MOEventBundleLabelLocalizer __Moments_TitleCapitalizedStringForKey:](MOEventBundleLabelLocalizer, "__Moments_TitleCapitalizedStringForKey:", v3));

    v3 = (void *)v4;
  }
  return v3;
}

+ (id)_Moments_LocalizedStringForKey:(id)a3 withTable:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id os_log;
  NSObject *v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  NSObject *v29;
  int v31;
  id v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  id v36;

  v7 = a3;
  v8 = a4;
  if (v7)
  {
    if (objc_msgSend(v7, "length"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundleLabelLocalizer _MomentsBundle](MOEventBundleLabelLocalizer, "_MomentsBundle"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", v7, CFSTR("_Key_Not_Found_"), v8));
      if (objc_msgSend(CFSTR("_Key_Not_Found_"), "isEqualToString:", v10))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundleLabelLocalizer _MomentsDefaultLanguageBundle](MOEventBundleLabelLocalizer, "_MomentsDefaultLanguageBundle"));
        v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", v7, CFSTR("_Key_Not_Found_"), v8));
        os_log = _mo_log_facility_get_os_log(&MOLogFacilityFramework);
        v14 = objc_claimAutoreleasedReturnValue(os_log);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v31 = 138412802;
          v32 = v7;
          v33 = 2112;
          v34 = v11;
          v35 = 2112;
          v36 = v12;
          _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "MOEventBundleLabelLocalizer key is not found, key, %@, default language bundle, %@, default localized string, %@", (uint8_t *)&v31, 0x20u);
        }

        v15 = _mo_log_facility_get_os_log(&MOLogFacilityFramework);
        v16 = objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:withTable:].cold.2((uint64_t)v7, v9, v16);

        if (objc_msgSend(CFSTR("_Key_Not_Found_"), "isEqualToString:", v10))
        {
          v17 = v7;

          v12 = v17;
        }
        else if (!v12)
        {
          v12 = v7;
        }

      }
      else
      {
        v28 = _mo_log_facility_get_os_log(&MOLogFacilityFramework);
        v29 = objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:withTable:].cold.3((uint64_t)v7, v10);

        v12 = v10;
      }

    }
    else
    {
      v12 = v7;
    }
  }
  else
  {
    v18 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:withTable:].cold.1(v19, v20, v21, v22, v23, v24, v25, v26);

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MOEventBundleLabelLocalizer.m"), 93, CFSTR("Invalid parameter not satisfying: key"));

    v12 = 0;
  }

  return v12;
}

+ (id)_Moments_LocalizedStringForKey:(id)a3
{
  return +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:withTable:](MOEventBundleLabelLocalizer, "_Moments_LocalizedStringForKey:withTable:", a3, 0);
}

+ (id)_Moments_LocalizedStringWithFormat:(id)a3 arguments:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  NSObject *v28;
  id os_log;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  NSObject *v39;
  id v40;
  NSObject *v41;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t v48[4];
  uint64_t v49;
  _BYTE v50[128];

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v30 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      +[MOEventBundleLabelLocalizer _Moments_LocalizedStringWithFormat:arguments:].cold.1(v30, v31, v32, v33, v34, v35, v36, v37);

    v9 = (id)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MOEventBundleLabelLocalizer.m"), 138, CFSTR("Invalid parameter not satisfying: format"));
    goto LABEL_26;
  }
  v9 = (id)objc_claimAutoreleasedReturnValue(+[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:](MOEventBundleLabelLocalizer, "_Moments_LocalizedStringForKey:", v7));
  v10 = _mo_log_facility_get_os_log(&MOLogFacilityFramework);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    +[MOEventBundleLabelLocalizer _Moments_LocalizedStringWithFormat:arguments:].cold.7((uint64_t)v9, v8);

  v12 = _mo_log_facility_get_os_log(&MOLogFacilityFramework);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    +[MOEventBundleLabelLocalizer _Moments_LocalizedStringWithFormat:arguments:].cold.6((uint64_t)v9, v8);

  if (!v9)
  {
    v38 = _mo_log_facility_get_os_log(&MOLogFacilityFramework);
    v39 = objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      +[MOEventBundleLabelLocalizer _Moments_LocalizedStringWithFormat:arguments:].cold.2((uint64_t)v7, v39);

LABEL_26:
    v26 = 0;
    goto LABEL_31;
  }
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v43 = v8;
  v14 = v8;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v45;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v45 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)v18);
        v20 = _mo_log_facility_get_os_log(&MOLogFacilityFramework);
        v21 = objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          +[MOEventBundleLabelLocalizer _Moments_LocalizedStringWithFormat:arguments:].cold.5(v48, v19, &v49, v21);

        v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
    }
    while (v16);
  }

  if (objc_msgSend(v14, "count"))
  {
    v22 = objc_msgSend(v14, "count");
    v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", 8 * (_QWORD)objc_msgSend(v14, "count"))));
    objc_msgSend(v14, "getObjects:range:", objc_msgSend(v23, "mutableBytes"), 0, v22);
    v24 = objc_alloc((Class)NSString);
    v25 = objc_retainAutorelease(v23);
    v26 = objc_msgSend(v24, "initWithFormat:arguments:", v9, objc_msgSend(v25, "mutableBytes"));
    v27 = _mo_log_facility_get_os_log(&MOLogFacilityFramework);
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      +[MOEventBundleLabelLocalizer _Moments_LocalizedStringWithFormat:arguments:].cold.4(v26, v28);

  }
  else
  {
    v40 = _mo_log_facility_get_os_log(&MOLogFacilityFramework);
    v41 = objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
      +[MOEventBundleLabelLocalizer _Moments_LocalizedStringWithFormat:arguments:].cold.3((uint64_t)v9, v41);

    v9 = v9;
    v26 = v9;
  }
  v8 = v43;
LABEL_31:

  return v26;
}

+ (id)_Moments_CapitalizedStringForKey:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "length"))
  {
    v5 = v4;
    if ((unint64_t)objc_msgSend(v5, "length") > 1)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "substringToIndex:", 1));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "uppercaseString"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "substringFromIndex:", 1));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByAppendingString:", v9));

      v5 = v7;
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedCapitalizedString"));
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)_Moments_TitleCapitalizedStringForKey:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "length"))
  {
    if (objc_msgSend(a1, "isPreferredLanguageTitlecaseCapable"))
      v6 = (id)objc_claimAutoreleasedReturnValue(+[MOEventBundleLabelLocalizer __Moments_TitleCapitalizedStringForKey:](MOEventBundleLabelLocalizer, "__Moments_TitleCapitalizedStringForKey:", v5));
    else
      v6 = v5;
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)__Moments_TitleCapitalizedStringForKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void **v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, uint64_t, uint64_t);
  void *v15;
  id v16;
  id v17;

  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "length"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
    v6 = objc_msgSend(v4, "mutableCopy");
    v7 = objc_msgSend(v6, "length");
    v12 = _NSConcreteStackBlock;
    v13 = 3221225472;
    v14 = __70__MOEventBundleLabelLocalizer___Moments_TitleCapitalizedStringForKey___block_invoke;
    v15 = &unk_1002B26C8;
    v16 = v6;
    v17 = v5;
    v8 = v5;
    v9 = v6;
    objc_msgSend(v9, "enumerateSubstringsInRange:options:usingBlock:", 0, v7, 1027, &v12);
    v10 = objc_msgSend(v9, "copy", v12, v13, v14, v15);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __70__MOEventBundleLabelLocalizer___Moments_TitleCapitalizedStringForKey___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v7 = a2;
  v8 = v7;
  if (v7)
  {
    v15 = v7;
    v9 = objc_msgSend(v7, "length");
    v8 = v15;
    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet lowercaseLetterCharacterSet](NSCharacterSet, "lowercaseLetterCharacterSet"));
      v11 = objc_msgSend(v10, "characterIsMember:", objc_msgSend(v15, "characterAtIndex:", 0));

      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"));
      if (a3)
      {
        if ((objc_msgSend(v12, "characterIsMember:", objc_msgSend(*(id *)(a1 + 32), "characterAtIndex:", a3 - 1)) & v11 & 1) == 0)
        {
LABEL_6:

          v8 = v15;
          goto LABEL_7;
        }
      }
      else if (!v11)
      {
        goto LABEL_6;
      }
      v13 = *(void **)(a1 + 32);
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "capitalizedStringWithLocale:", *(_QWORD *)(a1 + 40)));
      objc_msgSend(v13, "replaceCharactersInRange:withString:", a3, a4, v14);

      goto LABEL_6;
    }
  }
LABEL_7:

}

+ (id)_Moments_AllCapitalizedStringForKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "length"))
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedUppercaseString"));
  else
    v5 = 0;

  return v5;
}

+ (id)_Moments_LowercaseNounForKey:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  if (+[MOEventBundleLabelLocalizer isPreferredLanguageNounCap](MOEventBundleLabelLocalizer, "isPreferredLanguageNounCap"))
  {
    v4 = v3;
  }
  else
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lowercaseString"));
  }
  v5 = v4;

  return v5;
}

+ (BOOL)internalInstall
{
  const __CFBoolean *v2;
  const __CFBoolean *v3;
  CFTypeID v4;
  BOOL v5;

  v2 = (const __CFBoolean *)MGCopyAnswer(CFSTR("InternalBuild"), 0);
  if (!v2)
    return 0;
  v3 = v2;
  v4 = CFGetTypeID(v2);
  v5 = v4 == CFBooleanGetTypeID() && CFBooleanGetValue(v3) == 1;
  CFRelease(v3);
  return v5;
}

+ (void)_Moments_LocalizedStringForKey:(uint64_t)a3 withTable:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, a1, a3, "Invalid parameter not satisfying: key", a5, a6, a7, a8, 0);
}

+ (void)_Moments_LocalizedStringForKey:(NSObject *)a3 withTable:.cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale preferredLanguages](NSLocale, "preferredLanguages"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localeIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "preferredLocalizations"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));
  v12 = 138413058;
  v13 = a1;
  v14 = 2112;
  v15 = v7;
  v16 = 2112;
  v17 = v9;
  v18 = 2112;
  v19 = v11;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "MOEventBundleLabelLocalizer key is not found, key, %@, locale preferredLanguage, %@, locale, %@, framework preferredLocalization, %@", (uint8_t *)&v12, 0x2Au);

}

+ (void)_Moments_LocalizedStringForKey:(uint64_t)a1 withTable:(void *)a2 .cold.3(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "mask"));
  OUTLINED_FUNCTION_0_1((void *)&_mh_execute_header, v2, v3, "MOEventBundleLabelLocalizer localizedString, key, %@, value, %@", v4, v5, v6, v7, 2u);

}

+ (void)_Moments_LocalizedStringWithFormat:(uint64_t)a3 arguments:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, a1, a3, "Invalid parameter not satisfying: format", a5, a6, a7, a8, 0);
}

+ (void)_Moments_LocalizedStringWithFormat:(uint64_t)a1 arguments:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;

  v2 = 138412546;
  v3 = a1;
  v4 = 2112;
  v5 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "MOEventBundleLabelLocalizer return nil for format, %@, localizedFormat, %@", (uint8_t *)&v2, 0x16u);
}

+ (void)_Moments_LocalizedStringWithFormat:(uint64_t)a1 arguments:(NSObject *)a2 .cold.3(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  OUTLINED_FUNCTION_4_5((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "MOEventBundleLabelLocalizer output string, %@", (uint8_t *)&v2);
}

+ (void)_Moments_LocalizedStringWithFormat:(void *)a1 arguments:(NSObject *)a2 .cold.4(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "mask"));
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_4_5((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "MOEventBundleLabelLocalizer output string, %@", (uint8_t *)&v4);

  OUTLINED_FUNCTION_5();
}

+ (void)_Moments_LocalizedStringWithFormat:(_QWORD *)a3 arguments:(NSObject *)a4 .cold.5(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "mask"));
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  OUTLINED_FUNCTION_4_5((void *)&_mh_execute_header, a4, OS_LOG_TYPE_DEBUG, "MOEventBundleLabelLocalizer arg, %@", a1);

}

+ (void)_Moments_LocalizedStringWithFormat:(uint64_t)a1 arguments:(void *)a2 .cold.6(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_5_3(a1, a2);
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_1((void *)&_mh_execute_header, v2, v3, "MOEventBundleLabelLocalizer format, %@, args.count, %lu", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_5();
}

+ (void)_Moments_LocalizedStringWithFormat:(uint64_t)a1 arguments:(void *)a2 .cold.7(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_5_3(a1, a2);
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_1((void *)&_mh_execute_header, v2, v3, "format, %@, args.count, %lu", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_5();
}

@end
