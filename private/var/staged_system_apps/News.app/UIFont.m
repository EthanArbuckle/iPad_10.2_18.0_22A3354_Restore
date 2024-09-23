@implementation UIFont

+ (id)_fr_fontWeightLookup
{
  if (qword_10010A490 != -1)
    dispatch_once(&qword_10010A490, &stru_1000D9990);
  return (id)qword_10010A488;
}

+ (id)fr_fontWithName:(id)a3 size:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  unsigned int v11;
  CTFontRef UIFontForLanguage;
  void *v13;
  const __CTFont *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  unsigned int v18;
  double v19;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_fr_fontWeightLookup"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v6));

  if (v8)
  {
    v9 = objc_msgSend(v6, "hasPrefix:", CFSTR("FRSystemFont-Condensed"));

    if (!v9)
    {
LABEL_21:
      objc_msgSend(v8, "doubleValue");
      UIFontForLanguage = (CTFontRef)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "systemFontOfSize:weight:", a4, v19));
      goto LABEL_22;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", UIFontWeightBold));
    v11 = objc_msgSend(v8, "isEqualToNumber:", v10);

    if (v11)
    {
      UIFontForLanguage = CTFontCreateUIFontForLanguage((CTFontUIFontType)0xA9u, a4, 0);
      if (!UIFontForLanguage)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          sub_100077C18();
        goto LABEL_21;
      }
    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", UIFontWeightSemibold));
      v16 = objc_msgSend(v8, "isEqualToNumber:", v15);

      if (v16)
      {
        UIFontForLanguage = CTFontCreateUIFontForLanguage(kCTFontMenuItemCmdKeyFontType|0xA0, a4, 0);
        if (!UIFontForLanguage)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            sub_100077CD4();
          goto LABEL_21;
        }
      }
      else
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", UIFontWeightBlack));
        v18 = objc_msgSend(v8, "isEqualToNumber:", v17);

        if (!v18)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            sub_100077E4C();
          goto LABEL_21;
        }
        UIFontForLanguage = CTFontCreateUIFontForLanguage((CTFontUIFontType)0xB0u, a4, 0);
        if (!UIFontForLanguage)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            sub_100077D90();
          goto LABEL_21;
        }
      }
    }
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "fontWithName:size:", v6, a4));

    if (v13)
      v14 = v13;
    else
      v14 = (const __CTFont *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "systemFontOfSize:", a4));
    UIFontForLanguage = v14;

  }
LABEL_22:

  return UIFontForLanguage;
}

+ (id)_fr_fontNameWithPrefix:(id)a3 midfix:(id)a4 suffix:(id)a5
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@-%@"), a3, a4, a5);
}

+ (id)fr_systemFontNameForWeight:(double)a3
{
  return objc_msgSend(a1, "fr_systemFontNameForWeight:condensed:", 0, a3);
}

+ (id)fr_systemFontNameForWeight:(double)a3 condensed:(BOOL)a4
{
  const __CFString *v4;
  const __CFString *v5;

  if (UIFontWeightUltraLight == a3)
  {
    v4 = CFSTR("Ultralight");
  }
  else if (UIFontWeightThin == a3)
  {
    v4 = CFSTR("Thin");
  }
  else if (UIFontWeightLight == a3)
  {
    v4 = CFSTR("Light");
  }
  else if (UIFontWeightRegular == a3)
  {
    v4 = CFSTR("Regular");
  }
  else if (UIFontWeightMedium == a3)
  {
    v4 = CFSTR("Medium");
  }
  else if (UIFontWeightSemibold == a3)
  {
    v4 = CFSTR("Semibold");
  }
  else if (UIFontWeightBold == a3)
  {
    v4 = CFSTR("Bold");
  }
  else if (UIFontWeightHeavy == a3)
  {
    v4 = CFSTR("Heavy");
  }
  else if (UIFontWeightBlack == a3)
  {
    v4 = CFSTR("Black");
  }
  else
  {
    v4 = 0;
  }
  if (a4)
    v5 = CFSTR("-Condensed");
  else
    v5 = &stru_1000DF290;
  return _objc_msgSend(a1, "_fr_fontNameWithPrefix:midfix:suffix:", CFSTR("FRSystemFont"), v5, v4);
}

+ (BOOL)fr_contentSizeCategoryIsGreaterThan:(id)a3
{
  NSString *v3;
  void *v4;
  NSString *v5;
  NSComparisonResult v6;

  v3 = (NSString *)a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIContentSizeCategoryPreference system](UIContentSizeCategoryPreference, "system"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory"));

  v6 = UIContentSizeCategoryCompareToCategory(v5, v3);
  return v6 == NSOrderedDescending;
}

+ (id)fr_orderedContentSizeCategories
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)qword_10010A498;
  if (!qword_10010A498)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSOrderedSet orderedSetWithObjects:](NSOrderedSet, "orderedSetWithObjects:", UIContentSizeCategoryUnspecified, UIContentSizeCategoryExtraSmall, UIContentSizeCategorySmall, UIContentSizeCategoryMedium, UIContentSizeCategoryLarge, UIContentSizeCategoryExtraLarge, UIContentSizeCategoryExtraExtraLarge, UIContentSizeCategoryExtraExtraExtraLarge, UIContentSizeCategoryAccessibilityMedium, UIContentSizeCategoryAccessibilityLarge, UIContentSizeCategoryAccessibilityExtraLarge, UIContentSizeCategoryAccessibilityExtraExtraLarge, UIContentSizeCategoryAccessibilityExtraExtraExtraLarge, 0));
    v4 = (void *)qword_10010A498;
    qword_10010A498 = v3;

    v2 = (void *)qword_10010A498;
  }
  return v2;
}

+ (id)fr_drukWideMediumForSize:(double)a3
{
  return +[UIFont fr_fontWithName:size:](UIFont, "fr_fontWithName:size:", CFSTR("DrukWide-Medium"), a3);
}

+ (id)fr_drukTextBoldForSize:(double)a3
{
  return +[UIFont fr_fontWithName:size:](UIFont, "fr_fontWithName:size:", CFSTR("DrukText-Bold"), a3);
}

+ (id)fr_appropriateValueForCurrentContentSizeCategoryUsingMap:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _UNKNOWN **v10;
  id v11;
  id v12;
  id v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  _BYTE *v30;
  char *v31;
  void *v32;
  unint64_t v33;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIContentSizeCategoryPreference system](UIContentSizeCategoryPreference, "system"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "preferredContentSizeCategory"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", UIContentSizeCategoryLarge));
  if (!v7 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100077FCC();
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v6));
  v9 = v8;
  if (!v8)
  {
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "fr_orderedContentSizeCategories"));
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    if (v12)
    {
      v13 = v12;
      v14 = 0;
      v15 = *(_QWORD *)v41;
LABEL_8:
      v16 = 0;
      while (1)
      {
        if (*(_QWORD *)v41 != v15)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v16);
        if ((objc_msgSend(v17, "isEqualToString:", v6) & 1) != 0)
          break;
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v17));

        if (v18)
        {
          v19 = v17;

          v14 = (unint64_t)v19;
        }
        if (v13 == (id)++v16)
        {
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
          if (v13)
            goto LABEL_8;
          break;
        }
      }
    }
    else
    {
      v14 = 0;
    }

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v35 = v11;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "reverseObjectEnumerator"));
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    if (v21)
    {
      v22 = v21;
      v23 = 0;
      v24 = *(_QWORD *)v37;
LABEL_20:
      v25 = 0;
      while (1)
      {
        if (*(_QWORD *)v37 != v24)
          objc_enumerationMutation(v20);
        v26 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v25);
        if ((objc_msgSend(v26, "isEqualToString:", v6) & 1) != 0)
          break;
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v26));

        if (v27)
        {
          v28 = v26;

          v23 = (unint64_t)v28;
        }
        if (v22 == (id)++v25)
        {
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
          if (v22)
            goto LABEL_20;
          break;
        }
      }
    }
    else
    {
      v23 = 0;
    }

    if (!v14 || v23)
    {
      v29 = v35;
      if (!v14 && v23)
        goto LABEL_41;
      if (!(v14 | v23))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          sub_100077F0C();
        v10 = &off_1000E4AD8;
        goto LABEL_43;
      }
      v30 = objc_msgSend(v35, "indexOfObject:", v6);
      v31 = (char *)(v30 - (_BYTE *)objc_msgSend(v35, "indexOfObject:", v14));
      if ((unint64_t)v31 >= (_BYTE *)objc_msgSend(v35, "indexOfObject:", v23) - v30)
      {
LABEL_41:
        v32 = v4;
        v33 = v23;
      }
      else
      {
        v32 = v4;
        v33 = v14;
      }
      v10 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKeyedSubscript:", v33));
    }
    else
    {
      v10 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v14));
      v29 = v35;
    }
LABEL_43:

    v9 = 0;
    goto LABEL_44;
  }
  v10 = v8;
LABEL_44:

  return v10;
}

+ (BOOL)fr_accessibilityFontSizesEnabled
{
  void *v2;
  NSString *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIContentSizeCategoryPreference system](UIContentSizeCategoryPreference, "system"));
  v3 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "preferredContentSizeCategory"));

  LOBYTE(v2) = UIContentSizeCategoryIsAccessibilityCategory(v3);
  return (char)v2;
}

+ (BOOL)fr_isDefaultContentSizeCategory
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIContentSizeCategoryPreference system](UIContentSizeCategoryPreference, "system"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "preferredContentSizeCategory"));
  v4 = objc_msgSend(v3, "isEqualToString:", UIContentSizeCategoryLarge);

  return v4;
}

+ (id)fr_preferredFontForBaseFont:(id)a3
{
  id v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "pointSize");
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  objc_msgSend(v6, "_scaledValueForValue:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fontWithSize:", round(v7)));

  return v8;
}

+ (double)fr_scaledValueForValue:(double)a3
{
  void *v4;
  double v5;
  double v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  objc_msgSend(v4, "_scaledValueForValue:", a3);
  v6 = round(v5);

  return v6;
}

+ (double)fr_notRoundedScaledValueForValue:(double)a3
{
  void *v4;
  double v5;
  double v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  objc_msgSend(v4, "_scaledValueForValue:", a3);
  v6 = v5;

  return v6;
}

+ (double)fr_inverselyScaledValueForValue:(double)a3
{
  double v4;

  objc_msgSend(a1, "fr_scaledValueForValue:");
  return round(a3 / v4 * a3);
}

+ (double)fr_scaledValueForValue:(double)a3 scalingRate:(double)a4
{
  double v6;

  objc_msgSend(a1, "fr_scaledValueForValue:");
  return round(a3 + (v6 - a3) * a4);
}

+ (double)fr_inverselyScaledValueForValue:(double)a3 scalingRate:(double)a4
{
  double v5;

  objc_msgSend(a1, "fr_scaledValueForValue:scalingRate:", a3, a4);
  return round(a3 / v5 * a3);
}

+ (double)fr_preferredHeightForString:(id)a3 constrainedToWidth:(double)a4
{
  double result;

  _objc_msgSend(a1, "fr_preferredHeightForString:textStyle:constrainedToWidth:", a3, UIFontTextStyleBody, a4);
  return result;
}

+ (double)fr_preferredHeightForString:(id)a3 textStyle:(id)a4 constrainedToWidth:(double)a5
{
  double result;

  _objc_msgSend(a1, "fr_preferredHeightForString:baseFontSize:maxFontSize:textStyle:constrainedToWidth:", a3, a4, 0.0, 1.79769313e308, a5);
  return result;
}

+ (double)fr_preferredHeightForString:(id)a3 baseFontSize:(double)a4 maxFontSize:(double)a5 textStyle:(id)a6 constrainedToWidth:(double)a7
{
  id v11;
  void *v12;
  void *v13;
  double v14;
  float v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  float v20;
  NSAttributedStringKey v22;
  void *v23;

  v11 = a3;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", a6));
  v13 = v12;
  if (a4 > 0.0)
  {
    objc_msgSend(v12, "_scaledValueForValue:", a4);
    if (v14 >= a5)
      v14 = a5;
    v15 = v14;
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "fontWithSize:", roundf(v15)));

    v13 = (void *)v16;
  }
  v22 = NSFontAttributeName;
  v23 = v13;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));
  objc_msgSend(v11, "boundingRectWithSize:options:attributes:context:", 3, v17, 0, a7, 1.79769313e308);
  v19 = v18;

  v20 = v19;
  return roundf(v20);
}

@end
