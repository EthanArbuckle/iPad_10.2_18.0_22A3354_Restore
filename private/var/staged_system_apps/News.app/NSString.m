@implementation NSString

- (id)fr_stringInitials
{
  void *v3;
  void *v4;
  void *v5;
  NSUInteger v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _BYTE v26[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", &off_1000E49B8));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v6 = -[NSString length](self, "length");
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10005C094;
  v23[3] = &unk_1000DD870;
  v7 = v4;
  v24 = v7;
  v8 = v5;
  v25 = v8;
  -[NSString enumerateSubstringsInRange:options:usingBlock:](self, "enumerateSubstringsInRange:options:usingBlock:", 0, v6, 3, v23);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v26, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v14, "length", (_QWORD)v19))
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "substringWithRange:", 0, 1));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "uppercaseString"));
          objc_msgSend(v3, "appendString:", v16);

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v26, 16);
    }
    while (v11);
  }

  v17 = objc_msgSend(v3, "copy");
  return v17;
}

- (id)fr_convertNewlinesToPTags
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSString componentsSeparatedByString:](self, "componentsSeparatedByString:", CFSTR("\n")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<p>%@</p>"), *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v8)));
        objc_msgSend(v3, "addObject:", v9);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsJoinedByString:", CFSTR("\n")));
  return v10;
}

- (id)fr_encodeHTMLEntities
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSString stringByReplacingOccurrencesOfString:withString:](self, "stringByReplacingOccurrencesOfString:withString:", CFSTR("&"), CFSTR("&amp;")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("<"), CFSTR("&lt;")));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR(">"), CFSTR("&gt;")));
  return v4;
}

- (id)fr_stripHTMLTags
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  FRHTMLStrippingXMLDelegate *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSString stringByReplacingOccurrencesOfString:withString:](self, "stringByReplacingOccurrencesOfString:withString:", CFSTR("&"), CFSTR("&amp;")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<root>%@</root>"), v2));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dataUsingEncoding:", objc_msgSend(v3, "fastestEncoding")));
  v5 = objc_msgSend(objc_alloc((Class)NSXMLParser), "initWithData:", v4);
  v6 = objc_alloc_init(FRHTMLStrippingXMLDelegate);
  objc_msgSend(v5, "setDelegate:", v6);
  objc_msgSend(v5, "parse");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FRHTMLStrippingXMLDelegate strippedString](v6, "strippedString"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fr_stringByDecodingHTMLEntities"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByTrimmingCharactersInSet:", v9));

  return v10;
}

- (id)fr_stringByDecodingHTMLEntities
{
  void *v3;
  void *v4;
  unsigned int v5;
  id v6;
  _BYTE *v7;
  unsigned int v8;
  char v9;
  unsigned __int16 v10;
  BOOL v11;
  unsigned int v12;
  id v13;
  unsigned __int16 v14;
  unsigned int v15;
  _BOOL4 v16;
  void *v17;
  id v19;
  int v20;
  id v21;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSScanner scannerWithString:](NSScanner, "scannerWithString:", self));
  objc_msgSend(v4, "setCharactersToBeSkipped:", 0);
  if ((objc_msgSend(v4, "isAtEnd") & 1) == 0)
  {
    do
    {
      v21 = 0;
      v5 = objc_msgSend(v4, "scanUpToString:intoString:", CFSTR("&"), &v21);
      v6 = v21;
      if (v5)
        objc_msgSend(v3, "appendString:", v6);
      if (!objc_msgSend(v4, "scanString:intoString:", CFSTR("&"), 0))
        goto LABEL_29;
      v7 = objc_msgSend(v4, "scanLocation");
      if (objc_msgSend(v4, "scanString:intoString:", CFSTR("#"), 0))
      {
        if (objc_msgSend(v4, "scanString:intoString:", CFSTR("x"), 0))
        {
          v20 = 0;
          v8 = objc_msgSend(v4, "scanHexInt:", &v20);
          v9 = v8;
          v10 = v20;
          v11 = v8 == 0;
        }
        else
        {
          v20 = 0;
          v15 = objc_msgSend(v4, "scanInt:", &v20);
          v10 = v20;
          v16 = v20 >= 0;
          v9 = v15 & v16;
          v11 = (v15 & v16) == 0;
        }
        if (v11)
          v14 = 0;
        else
          v14 = v10;
        if (!objc_msgSend(v4, "scanString:intoString:", CFSTR(";"), 0) || (v9 & 1) == 0)
          goto LABEL_28;
      }
      else
      {
        v19 = v6;
        v12 = objc_msgSend(v4, "scanUpToString:intoString:", CFSTR(";"), &v19);
        v13 = v19;

        if (!v12 || !objc_msgSend(v4, "scanString:intoString:", CFSTR(";"), 0))
        {
LABEL_27:
          v6 = v13;
LABEL_28:
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSString substringWithRange:](self, "substringWithRange:", v7, (_BYTE *)objc_msgSend(v4, "scanLocation") - v7));
          objc_msgSend(v3, "appendString:", v17);

          goto LABEL_29;
        }
        if ((objc_msgSend(v13, "isEqualToString:", CFSTR("amp")) & 1) != 0)
        {
          v14 = 38;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("quot")) & 1) != 0)
        {
          v14 = 34;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("lt")) & 1) != 0)
        {
          v14 = 60;
        }
        else
        {
          if ((objc_msgSend(v13, "isEqualToString:", CFSTR("gt")) & 1) == 0)
            goto LABEL_27;
          v14 = 62;
        }
        v6 = v13;
      }
      objc_msgSend(v3, "appendFormat:", CFSTR("%C"), v14);
LABEL_29:

    }
    while (!objc_msgSend(v4, "isAtEnd"));
  }

  return v3;
}

- (id)fr_accessibilityLowPitchAttributedString
{
  return +[NSAttributedString fr_accessibilityAttributedStringForSpeakingStringInLowerPitch:](NSAttributedString, "fr_accessibilityAttributedStringForSpeakingStringInLowerPitch:", self);
}

- (id)fr_accessibilityAttributedStringWithLowPitchPrefix:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  _QWORD v10[2];

  v10[0] = a3;
  v10[1] = self;
  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 2));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", ")));

  v6 = objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithString:", v5);
  v7 = objc_msgSend(v3, "length");

  objc_msgSend(v6, "fr_accessibilityApplyLowerPitchTokenToRange:", 0, v7);
  v8 = objc_msgSend(v6, "copy");

  return v8;
}

- (id)fr_accessibilityAttributedStringForHighPriorityAnnouncement
{
  return +[NSAttributedString fr_accessibilityAttributedStringForHighPriorityAnnouncement:](NSAttributedString, "fr_accessibilityAttributedStringForHighPriorityAnnouncement:", self);
}

- (id)fr_StringByTrimmingLeadingWhiteSpace
{
  unint64_t v3;
  void *v4;
  unsigned int v5;
  id v6;

  if (-[NSString length](self, "length"))
  {
    v3 = 0;
    if (-[NSString length](self, "length"))
    {
      do
      {
        v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"));
        v5 = objc_msgSend(v4, "characterIsMember:", -[NSString characterAtIndex:](self, "characterAtIndex:", v3));

        if (!v5)
          break;
        ++v3;
      }
      while (v3 < -[NSString length](self, "length"));
    }
    v6 = (id)objc_claimAutoreleasedReturnValue(-[NSString substringFromIndex:](self, "substringFromIndex:", v3));
  }
  else
  {
    v6 = -[NSString copy](self, "copy");
  }
  return v6;
}

- (id)fr_lowerCaseStringByTrimmingWhiteSpace
{
  void *v3;
  void *v4;
  id v5;

  if (-[NSString length](self, "length"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSString stringByTrimmingCharactersInSet:](self, "stringByTrimmingCharactersInSet:", v3));
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lowercaseString"));

  }
  else
  {
    v5 = -[NSString copy](self, "copy");
  }
  return v5;
}

- (BOOL)fr_isEquivalentToString:(id)a3
{
  return -[NSString compare:options:](self, "compare:options:", a3, 385) == NSOrderedSame;
}

- (BOOL)fr_hasPrefixEquivalentToString:(id)a3
{
  id v4;
  id v5;
  BOOL v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  v6 = v5 <= (id)-[NSString length](self, "length")
    && -[NSString compare:options:range:](self, "compare:options:range:", v4, 385, 0, objc_msgSend(v4, "length")) == NSOrderedSame;

  return v6;
}

- (double)heightConstrainedToWidth:(double)a3 font:(id)a4 singleLine:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  NSAttributedStringKey v15;
  id v16;

  v5 = a5;
  v8 = a4;
  v9 = objc_alloc_init((Class)NSStringDrawingContext);
  if (v5)
    v10 = 1;
  else
    v10 = 3;
  v15 = NSFontAttributeName;
  v16 = v8;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));

  -[NSString boundingRectWithSize:options:attributes:context:](self, "boundingRectWithSize:options:attributes:context:", v10, v11, v9, a3, 1.79769313e308);
  v13 = v12;

  return v13;
}

+ (id)fr_fontLookup
{
  if (qword_10010A740 != -1)
    dispatch_once(&qword_10010A740, &stru_1000DD8F8);
  return (id)qword_10010A738;
}

+ (id)fr_attributesLookup
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005E518;
  block[3] = &unk_1000DBA48;
  block[4] = a1;
  if (qword_10010A750 != -1)
    dispatch_once(&qword_10010A750, block);
  return (id)qword_10010A748;
}

+ (BOOL)fr_shouldTitlecaseForFeedHeaderType:(int64_t)a3
{
  if (!a3 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100080928();
  return 0;
}

+ (id)fr_fontForFeedHeaderType:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "fr_fontLookup"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", v5));

  if (!v6 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_1000809D8();
  return v6;
}

+ (double)fr_leadingForFeedHeaderType:(int64_t)a3
{
  double v3;

  if (a3 == 3)
    return 21.0;
  if (a3 == 2)
    return 29.0;
  v3 = 0.0;
  if (!a3 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100080AB8();
  return v3;
}

+ (double)fr_trackingForFeedHeaderType:(int64_t)a3
{
  double v3;

  if (a3 == 2)
    return 2.5;
  v3 = 0.0;
  if (!a3 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100080B68();
  return v3;
}

- (id)fr_attributedStringForHeaderType:(int64_t)a3
{
  NSString *v5;
  uint64_t v6;
  NSString *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  if ((objc_msgSend((id)objc_opt_class(self, a2), "fr_shouldTitlecaseForFeedHeaderType:", a3) & 1) != 0)
    v5 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSString uppercaseString](self, "uppercaseString"));
  else
    v5 = self;
  v7 = v5;
  v8 = objc_msgSend((id)objc_opt_class(self, v6), "fr_attributesLookup");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v10));

  v12 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:attributes:", v7, v11);
  return v12;
}

@end
