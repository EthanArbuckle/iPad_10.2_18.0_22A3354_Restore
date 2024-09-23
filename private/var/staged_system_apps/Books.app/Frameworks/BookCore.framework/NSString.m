@implementation NSString

+ (id)_readingProgressFormatter
{
  if (qword_30D658 != -1)
    dispatch_once(&qword_30D658, &stru_28DC30);
  return (id)qword_30D650;
}

+ (id)UUID
{
  const __CFUUID *v2;
  __CFString *v3;

  v2 = CFUUIDCreate(0);
  v3 = (__CFString *)CFUUIDCreateString(0, v2);
  CFRelease(v2);
  return v3;
}

- (NSString)bc_redactedCFIString
{
  NSString *v2;
  void *v3;
  id v4;
  id v5;
  NSObject *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  id v11;

  v2 = self;
  if (-[NSString hasPrefix:](v2, "hasPrefix:", CFSTR("epubcfi(")))
  {
    v11 = 0;
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", CFSTR("\\[\\w+\\]"), 1, &v11));
    v4 = v11;
    if (!v3)
    {
      v5 = BCIMLog();
      v6 = objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        sub_1B4924((uint64_t)v4, v6);

    }
    v7 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByReplacingMatchesInString:options:range:withTemplate:", v2, 0, 0, -[NSString length](v2, "length"), CFSTR("[redacted]")));

  }
  else
  {
    v7 = 0;
  }
  if (v7)
    v8 = v7;
  else
    v8 = v2;
  v9 = v8;

  return v9;
}

- (id)URLFragmentString
{
  char *v3;
  void *v4;

  v3 = (char *)-[NSString rangeOfString:](self, "rangeOfString:", CFSTR("#"));
  if (v3 == (char *)0x7FFFFFFFFFFFFFFFLL)
    v4 = 0;
  else
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSString substringFromIndex:](self, "substringFromIndex:", v3 + 1));
  return v4;
}

- (id)stringByRemovingURLFragment
{
  NSString *v2;
  id v3;
  uint64_t v4;

  v2 = self;
  v3 = -[NSString rangeOfString:](v2, "rangeOfString:", CFSTR("#"));
  if (v3 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = objc_claimAutoreleasedReturnValue(-[NSString substringToIndex:](v2, "substringToIndex:", v3));

    v2 = (NSString *)v4;
  }
  return v2;
}

- (id)stringByConvertingControlCharactersToSpace
{
  void *v3;
  char *v4;
  uint64_t v5;
  NSString *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet controlCharacterSet](NSCharacterSet, "controlCharacterSet"));
  v4 = (char *)-[NSString rangeOfCharacterFromSet:](self, "rangeOfCharacterFromSet:", v3);
  if (v4 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = self;
  }
  else
  {
    v7 = v4;
    v8 = v5;
    v6 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](NSMutableString, "stringWithString:", self));
    v9 = &v7[v8];
    v10 = (char *)((_BYTE *)-[NSString length](v6, "length") - &v7[v8]);
    do
    {
      -[NSString replaceCharactersInRange:withString:](v6, "replaceCharactersInRange:withString:", v7, v8, CFSTR(" "));
      v11 = (char *)-[NSString rangeOfCharacterFromSet:options:range:](v6, "rangeOfCharacterFromSet:options:range:", v3, 0, v9, v10);
      v13 = (uint64_t)&v11[v12 - (_QWORD)&v7[v8]];
      v9 += v13;
      v10 -= v13;
      v8 = v12;
      v7 = v11;
    }
    while (v11 != (char *)0x7FFFFFFFFFFFFFFFLL);
  }

  return v6;
}

- (id)stringByConvertingNewlineCharacterSetToSpace
{
  void *v3;
  char *v4;
  uint64_t v5;
  NSString *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet newlineCharacterSet](NSCharacterSet, "newlineCharacterSet"));
  v4 = (char *)-[NSString rangeOfCharacterFromSet:](self, "rangeOfCharacterFromSet:", v3);
  if (v4 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = self;
  }
  else
  {
    v7 = v4;
    v8 = v5;
    v6 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](NSMutableString, "stringWithString:", self));
    v9 = &v7[v8];
    v10 = (char *)((_BYTE *)-[NSString length](v6, "length") - &v7[v8]);
    do
    {
      -[NSString replaceCharactersInRange:withString:](v6, "replaceCharactersInRange:withString:", v7, v8, CFSTR(" "));
      v11 = (char *)-[NSString rangeOfCharacterFromSet:options:range:](v6, "rangeOfCharacterFromSet:options:range:", v3, 0, v9, v10);
      v13 = (uint64_t)&v11[v12 - (_QWORD)&v7[v8]];
      v9 += v13;
      v10 -= v13;
      v8 = v12;
      v7 = v11;
    }
    while (v11 != (char *)0x7FFFFFFFFFFFFFFFLL);
  }

  return v6;
}

- (NSString)stringWithPercentEscape
{
  return (NSString *)objc_autoreleaseReturnValue((id)CFURLCreateStringByAddingPercentEscapes(0, (CFStringRef)self, CFSTR("#"), CFSTR("\uFFFC=,!$&'()*+;@?\n\"<>\t :"),
                                                       0x8000100u));
}

- (BOOL)containsSubstring:(id)a3
{
  return -[NSString rangeOfString:options:](self, "rangeOfString:options:", a3, 2) != (id)0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)isWhitespace
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSString stringByTrimmingCharactersInSet:](self, "stringByTrimmingCharactersInSet:", v3));
  v5 = objc_msgSend(v4, "length") == 0;

  return v5;
}

- (BOOL)isNotWhitespace
{
  return !-[NSString isWhitespace](self, "isWhitespace");
}

+ (NSString)stringWithDuration:(double)a3
{
  return (NSString *)_objc_msgSend(a1, "stringWithDuration:explicitPositive:showsHours:", 0, 0, a3);
}

+ (id)bc_formattedReadingProgress:(id)a3 isFinished:(BOOL)a4
{
  double v4;

  LODWORD(v4) = 1065185444;
  if (a4)
    *(float *)&v4 = 1.0;
  return _objc_msgSend(a1, "bc_formattedReadingProgress:max:", a3, v4);
}

+ (id)bc_formattedReadingProgress:(id)a3 max:(float)a4
{
  id v6;
  double v7;
  _UNKNOWN **v8;
  float v9;
  void *v10;
  void *v11;

  v6 = a3;
  objc_msgSend(v6, "floatValue");
  if (*(float *)&v7 > a4)
  {
    *(float *)&v7 = a4;
    v8 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v7));
LABEL_5:

    v6 = v8;
    goto LABEL_6;
  }
  objc_msgSend(v6, "floatValue");
  if (v9 < 0.01)
  {
    v8 = &off_2B2FC0;
    goto LABEL_5;
  }
LABEL_6:
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_readingProgressFormatter"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringFromNumber:", v6));

  return v11;
}

+ (NSString)stringWithDuration:(double)a3 explicitPositive:(BOOL)a4
{
  return (NSString *)_objc_msgSend(a1, "stringWithDuration:explicitPositive:showsHours:", a4, 0, a3);
}

+ (NSString)stringWithDuration:(double)a3 unitStyle:(int64_t)a4 explicitPositive:(BOOL)a5 showsHours:(BOOL *)a6
{
  _BOOL4 v7;
  double v10;
  NSDateComponentsFormatter *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  id v19;
  __CFString *v20;
  void *v21;

  v7 = a5;
  v10 = fabs(a3) + 0.5;
  v11 = objc_opt_new(NSDateComponentsFormatter);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  -[NSDateComponentsFormatter setCalendar:](v11, "setCalendar:", v12);

  -[NSDateComponentsFormatter setUnitsStyle:](v11, "setUnitsStyle:", a4);
  if (v10 >= 60.0)
    v13 = 224;
  else
    v13 = 192;
  -[NSDateComponentsFormatter setAllowedUnits:](v11, "setAllowedUnits:", v13);
  -[NSDateComponentsFormatter setZeroFormattingBehavior:](v11, "setZeroFormattingBehavior:", 2 * (v10 >= 60.0));
  if (a6)
    *a6 = v10 > 3600.0;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateComponentsFormatter stringFromTimeInterval:](v11, "stringFromTimeInterval:", v10));
  if (v10 < 1.0)
    goto LABEL_13;
  if (a3 < 0.0 || !v7)
  {
    if (a3 < 0.0)
    {
      v19 = IMCommonCoreBundle();
      v16 = (void *)objc_claimAutoreleasedReturnValue(v19);
      v17 = v16;
      v18 = CFSTR("-%@");
      goto LABEL_12;
    }
LABEL_13:
    v20 = CFSTR("%@");
    goto LABEL_14;
  }
  v15 = IMCommonCoreBundle();
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = v16;
  v18 = CFSTR("+%@");
LABEL_12:
  v20 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", v18, &stru_296430, CFSTR("BCCommonCoreLocalizable")));

LABEL_14:
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v20, v14));

  return (NSString *)v21;
}

+ (NSString)stringWithDuration:(double)a3 explicitPositive:(BOOL)a4 showsHours:(BOOL *)a5
{
  return +[NSString stringWithDuration:unitStyle:explicitPositive:showsHours:](NSString, "stringWithDuration:unitStyle:explicitPositive:showsHours:", 0, a4, a5, a3);
}

+ (NSString)stringWithDuration:(double)a3 explicitPositive:(BOOL)a4 adjustedForRate:(double)a5
{
  if (fabs(a5) < 0.00999999978)
    a5 = 1.0;
  return +[NSString stringWithDuration:explicitPositive:showsHours:](NSString, "stringWithDuration:explicitPositive:showsHours:", a4, 0, a3 / a5);
}

+ (id)queryStringFromDictionary:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  char v9;
  void *i;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithCapacity:](NSMutableString, "stringWithCapacity:", 16));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    v9 = 1;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v11));
        v13 = (void *)v12;
        if ((v9 & 1) != 0)
          v14 = CFSTR("%@=%@");
        else
          v14 = CFSTR("&%@=%@");
        objc_msgSend(v4, "appendFormat:", v14, v11, v12, (_QWORD)v16);

        v9 = 0;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      v9 = 0;
    }
    while (v7);
  }

  return v4;
}

- (unint64_t)tokenCountWithEnumerationOptions:(unint64_t)a3 maxTokenCount:(unint64_t)a4 outLimitLength:(unint64_t *)a5
{
  unint64_t v9;
  _QWORD v11[7];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  if (a5)
    *a5 = -[NSString length](self, "length");
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_59BC4;
  v11[3] = &unk_28DC58;
  v11[4] = &v12;
  v11[5] = a4;
  v11[6] = a5;
  -[NSString enumerateSubstringsInRange:options:usingBlock:](self, "enumerateSubstringsInRange:options:usingBlock:", 0, -[NSString length](self, "length"), a3, v11);
  v9 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v9;
}

- (id)stringByTruncatingToLength:(unint64_t)a3 options:(unint64_t)a4 truncationString:(id)a5
{
  id v8;
  NSUInteger v9;
  id v10;
  unint64_t v11;
  NSString *v12;
  NSString *v13;
  uint64_t v14;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v8 = a5;
  if (-[NSString length](self, "length") <= a3)
  {
    v13 = self;
  }
  else
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v23 = 0;
    v9 = -[NSString length](self, "length");
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_59D60;
    v16[3] = &unk_28DC80;
    v19 = a3;
    v10 = v8;
    v17 = v10;
    v18 = &v20;
    -[NSString enumerateSubstringsInRange:options:usingBlock:](self, "enumerateSubstringsInRange:options:usingBlock:", 0, v9, a4, v16);
    v11 = v21[3];
    if (!v11)
    {
      v21[3] = a3;
      v11 = a3;
    }
    v12 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSString substringToIndex:](self, "substringToIndex:", v11));
    v13 = v12;
    if (v10)
    {
      v14 = objc_claimAutoreleasedReturnValue(-[NSString stringByAppendingString:](v12, "stringByAppendingString:", v10));

      v13 = (NSString *)v14;
    }

    _Block_object_dispose(&v20, 8);
  }

  return v13;
}

- (id)stringByEnclosingInQuotes
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSString stringByRemovingEnclosingQuotations](self, "stringByRemovingEnclosingQuotations"));
  v3 = IMCommonCoreBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("\\U201C%@\\U201D"), &stru_296430, CFSTR("BCCommonCoreLocalizable")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v2));

  return v6;
}

- (id)im_uppercaseStringWithLocale:(id)a3
{
  const __CFLocale *v4;
  void *v5;
  __CFString *v6;

  v4 = (const __CFLocale *)a3;
  if ((objc_opt_respondsToSelector(self, "uppercaseStringWithLocale:") & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSString uppercaseStringWithLocale:](self, "uppercaseStringWithLocale:", v4));
  }
  else
  {
    v6 = (__CFString *)objc_msgSend(objc_alloc((Class)NSMutableString), "initWithString:", self);
    CFStringUppercase(v6, v4);

    v5 = 0;
  }

  return v5;
}

- (id)im_stringWithPathRelativeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char *v9;
  char *v10;
  unint64_t v11;
  uint64_t v12;
  unsigned int v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  __CFString *v18;
  void *v20;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSString stringByStandardizingPath](self, "stringByStandardizingPath"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pathComponents"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByStandardizingPath"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pathComponents"));

    v9 = (char *)objc_msgSend(v6, "count");
    v10 = (char *)objc_msgSend(v8, "count");
    if (v9 < v10)
      goto LABEL_10;
    v11 = (unint64_t)v10;
    if (!v10)
      goto LABEL_8;
    v12 = 0;
    v13 = 1;
    do
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", v12));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", v12));
      v16 = objc_msgSend(v14, "isEqualToString:", v15);

      if ((v16 & 1) == 0)
        break;
      v12 = v13;
    }
    while (v11 > v13++);
    if (v11 != v12)
    {
LABEL_10:
      v18 = 0;
    }
    else
    {
LABEL_8:
      if (v9 == (char *)v11)
      {
        v18 = &stru_296430;
      }
      else
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subarrayWithRange:", v11, &v9[-v11]));
        v18 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](NSString, "pathWithComponents:", v20));

      }
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)im_stringWithPathRelativeTo:(id)a3 allowBacktracking:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char *v11;
  char *v12;
  char *v13;
  unint64_t v14;
  uint64_t v15;
  char *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  __CFString *v20;
  int64_t v21;
  __CFString *v22;
  __CFString *v23;
  void *v24;

  v6 = a3;
  if (a4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSString stringByStandardizingPath](self, "stringByStandardizingPath"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pathComponents"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByStandardizingPath"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pathComponents"));

    v11 = (char *)objc_msgSend(v8, "count");
    v12 = (char *)objc_msgSend(v10, "count");
    v13 = v12;
    if (v12 >= v11)
      v14 = (unint64_t)v11;
    else
      v14 = (unint64_t)v12;
    if (v14)
    {
      v15 = 0;
      v16 = 0;
      do
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndex:", v15));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", v15));
        v19 = objc_msgSend(v17, "isEqualToString:", v18);

        if (!v19)
          break;
        v15 = ++v16;
      }
      while (v14 > v16);
    }
    else
    {
      v16 = 0;
    }
    v21 = v13 - v16;
    if (v13 <= v16)
    {
      v23 = &stru_296430;
    }
    else
    {
      v22 = &stru_296430;
      do
      {
        v23 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingPathComponent:](v22, "stringByAppendingPathComponent:", CFSTR("..")));

        v22 = v23;
        --v21;
      }
      while (v21);
    }
    if (v16 >= v11)
    {
      v20 = v23;
    }
    else
    {
      do
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", v16));
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingPathComponent:](v23, "stringByAppendingPathComponent:", v24));

        ++v16;
        v23 = v20;
      }
      while (v11 != v16);
    }

  }
  else
  {
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSString im_stringWithPathRelativeTo:](self, "im_stringWithPathRelativeTo:", v6));
  }

  return v20;
}

- (id)imSanitizedFontFamilyName
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSString stringByReplacingOccurrencesOfString:withString:](self, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR("_")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), CFSTR("_")));

  return v3;
}

- (BOOL)bc_hasMatchInRegexPatterns:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  BOOL v11;
  id v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v7)
        objc_enumerationMutation(v4);
      v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v8);
      v10 = objc_alloc((Class)NSRegularExpression);
      v11 = 1;
      v12 = objc_msgSend(v10, "initWithPattern:options:error:", v9, 1, 0, (_QWORD)v15);
      v13 = objc_msgSend(v12, "rangeOfFirstMatchInString:options:range:", self, 0, 0, -[NSString length](self, "length"));

      if (v13 != (id)0x7FFFFFFFFFFFFFFFLL)
        break;
      if (v6 == (id)++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v11 = 0;
  }

  return v11;
}

- (id)stringByRemovingEnclosingQuotations
{
  NSString *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;

  if (qword_30D668 != -1)
    dispatch_once(&qword_30D668, &stru_28DCA0);
  v3 = self;
  v4 = -[NSString rangeOfCharacterFromSet:options:range:](v3, "rangeOfCharacterFromSet:options:range:", qword_30D660, 0, 0, 1);
  if (v4 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[NSString stringByReplacingCharactersInRange:withString:](v3, "stringByReplacingCharactersInRange:withString:", v4, v5, &stru_296430));

    v3 = (NSString *)v6;
  }
  if (-[NSString length](v3, "length") >= 2)
  {
    v7 = -[NSString rangeOfCharacterFromSet:options:range:](v3, "rangeOfCharacterFromSet:options:range:", qword_30D660, 0, (char *)-[NSString length](v3, "length") - 1, 1);
    if (v7 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v9 = objc_claimAutoreleasedReturnValue(-[NSString stringByReplacingCharactersInRange:withString:](v3, "stringByReplacingCharactersInRange:withString:", v7, v8, &stru_296430));

      v3 = (NSString *)v9;
    }
  }
  return v3;
}

- (unint64_t)unsignedLongLongValue
{
  return strtoull(-[NSString UTF8String](objc_retainAutorelease(self), "UTF8String"), 0, 0);
}

- (BOOL)imIsDefaultWritingMode
{
  if (-[NSString imIsVerticalWritingMode](self, "imIsVerticalWritingMode"))
    return 0;
  else
    return !-[NSString imIsHorizontalWritingMode](self, "imIsHorizontalWritingMode");
}

- (BOOL)imIsHorizontalWritingMode
{
  return -[NSString isEqualToString:](self, "isEqualToString:", CFSTR("horizontal"));
}

- (BOOL)imIsVerticalWritingMode
{
  return -[NSString isEqualToString:](self, "isEqualToString:", CFSTR("vertical"));
}

- (id)im_stringByCollapsingRunsOfWhitespaceAndNewlines
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSString componentsSeparatedByCharactersInSet:](self, "componentsSeparatedByCharactersInSet:", v3));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bu_objectsMatching:", &stru_28DCE0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "componentsJoinedByString:", CFSTR(" ")));

  return v6;
}

- (id)im_stringByStrippingHTML
{
  id v2;
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;

  v2 = -[NSString copy](self, "copy");
  v3 = objc_msgSend(v2, "rangeOfString:options:", CFSTR("<br[ /]*>"), 1024);
  if (v3 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = v2;
  }
  else
  {
    v6 = v3;
    do
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringByReplacingCharactersInRange:withString:", v6, v4, CFSTR("\n")));

      v6 = objc_msgSend(v5, "rangeOfString:options:", CFSTR("<br[ /]*>"), 1024);
      v2 = v5;
    }
    while (v6 != (id)0x7FFFFFFFFFFFFFFFLL);
  }
  v7 = objc_msgSend(v5, "rangeOfString:options:", CFSTR("<[^>]+>"), 1024);
  if (v7 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = v5;
  }
  else
  {
    v10 = v7;
    do
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByReplacingCharactersInRange:withString:", v10, v8, &stru_296430));

      v10 = objc_msgSend(v9, "rangeOfString:options:", CFSTR("<[^>]+>"), 1024);
      v5 = v9;
    }
    while (v10 != (id)0x7FFFFFFFFFFFFFFFLL);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "im_stringByUnescapingHTMLEntities"));

  return v11;
}

- (id)im_stringByUnescapingHTMLEntities
{
  return BC_CFXMLCreateStringByUnescapingEntities(kCFAllocatorDefault, (CFStringRef)self, 0);
}

- (id)im_stringByReplacingNewLinesWithHTMLBreaks
{
  return -[NSString stringByReplacingOccurrencesOfString:withString:options:range:](self, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("\n"), CFSTR("<br>\n"), 2, 0, -[NSString length](self, "length"));
}

- (id)flattenedAnnotationString
{
  void *v3;
  void *v4;

  if (qword_30DC60 != -1)
    dispatch_once(&qword_30DC60, &stru_2908A0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSString componentsSeparatedByCharactersInSet:](self, "componentsSeparatedByCharactersInSet:", qword_30DC58));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsJoinedByString:", CFSTR(" ")));

  return v4;
}

- (unint64_t)ae_occurrenceCountOfString:(id)a3
{
  id v4;
  NSUInteger v5;
  unint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = -[NSString length](self, "length");
    v6 = 0;
    v7 = 0;
    do
    {
      v8 = (char *)-[NSString rangeOfString:options:range:](self, "rangeOfString:options:range:", v4, 2, v7, v5);
      if (v8 == (char *)0x7FFFFFFFFFFFFFFFLL)
        break;
      ++v6;
      v7 = &v8[v9];
      v10 = -[NSString length](self, "length");
      v5 = v10 - (_QWORD)v7;
    }
    while (v10 <= -[NSString length](self, "length"));
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)stringForBCContentType:(int64_t)a3
{
  if ((unint64_t)a3 > 6)
    return 0;
  else
    return *(&off_291620 + a3);
}

- (int64_t)bcAssetContentType
{
  void *v3;
  void *v4;
  int64_t v5;

  if (qword_311258 != -1)
    dispatch_once(&qword_311258, &stru_291600);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_311250, "objectForKey:", self));
  v4 = v3;
  if (v3)
    v5 = (int)objc_msgSend(v3, "intValue");
  else
    v5 = 0;

  return v5;
}

@end
