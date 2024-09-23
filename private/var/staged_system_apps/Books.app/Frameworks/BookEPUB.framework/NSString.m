@implementation NSString

- (int64_t)be_compareToJSVersionString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  int64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSString componentsSeparatedByString:](self, "componentsSeparatedByString:", CFSTR(".")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "componentsSeparatedByString:", CFSTR(".")));
  if (!objc_msgSend(v5, "count"))
    goto LABEL_7;
  v7 = 0;
  v8 = 0;
  do
  {
    if (v7 >= (unint64_t)objc_msgSend(v6, "count"))
      break;
    if (v8)
      break;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", v7));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", v7));
    v8 = (int64_t)objc_msgSend(v9, "compare:options:", v10, 64);

    ++v7;
  }
  while (v7 < (unint64_t)objc_msgSend(v5, "count"));
  if (!v8)
  {
LABEL_7:
    v11 = objc_msgSend(v5, "count");
    if (v11 <= objc_msgSend(v6, "count"))
    {
      v12 = objc_msgSend(v5, "count");
      if (v12 >= objc_msgSend(v6, "count"))
        v8 = 0;
      else
        v8 = -1;
    }
    else
    {
      v8 = 1;
    }
  }

  return v8;
}

- (id)be_sanitizedFontFamilyName
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSString stringByReplacingOccurrencesOfString:withString:](self, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR("_")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), CFSTR("_")));

  return v3;
}

- (id)be_stringByRemovingPercentEscapes
{
  return (id)(id)CFURLCreateStringByReplacingPercentEscapes(kCFAllocatorDefault, (CFStringRef)self, &stru_38FF08);
}

- (BOOL)be_isWhitespace
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSString stringByTrimmingCharactersInSet:](self, "stringByTrimmingCharactersInSet:", v3));
  v5 = objc_msgSend(v4, "length") == 0;

  return v5;
}

- (BOOL)be_isNotWhitespace
{
  return !-[NSString be_isWhitespace](self, "be_isWhitespace");
}

- (id)be_redactedCFIString
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
  uint8_t buf[4];
  id v13;

  v2 = self;
  if (-[NSString hasPrefix:](v2, "hasPrefix:", CFSTR("epubcfi(")))
  {
    v11 = 0;
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", CFSTR("\\[\\w+\\]"), 1, &v11));
    v4 = v11;
    if (!v3)
    {
      v5 = _BookEPUBLog();
      v6 = objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v13 = v4;
        _os_log_impl(&dword_0, v6, OS_LOG_TYPE_ERROR, "Failed to create redaction regular expression: %{public}@", buf, 0xCu);
      }

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

@end
