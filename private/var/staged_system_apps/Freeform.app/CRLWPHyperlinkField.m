@implementation CRLWPHyperlinkField

- (_NSRange)range
{
  _NSRange *p_range;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_range = &self->_range;
  location = self->_range.location;
  length = p_range->length;
  result.length = length;
  result.location = location;
  return result;
}

+ (id)defaultFieldStyleIdentifier
{
  return 0;
}

- (NSString)displayText
{
  return self->_displayText;
}

+ (int64_t)schemeFromURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  unsigned int v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "scheme"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lowercaseString"));

    if (v6)
    {
      if ((objc_msgSend(v6, "isEqualToString:", CFSTR("http")) & 1) != 0
        || (objc_msgSend(v6, "isEqualToString:", CFSTR("https")) & 1) != 0)
      {
        v7 = 0;
      }
      else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("file")) & 1) != 0
             || (objc_msgSend(v6, "isEqualToString:", CFSTR("keynote")) & 1) != 0)
      {
        v7 = 1;
      }
      else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("mailto")) & 1) != 0)
      {
        v7 = 2;
      }
      else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("tel")) & 1) != 0)
      {
        v7 = 3;
      }
      else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("pages")) & 1) != 0)
      {
        v7 = 5;
      }
      else if (objc_msgSend(v6, "isEqualToString:", CFSTR("rdar")))
      {
        v7 = 8;
      }
      else
      {
        v7 = 11;
      }
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "absoluteString"));
      v9 = v8;
      if (v8)
      {
        v10 = objc_msgSend(v8, "rangeOfString:", CFSTR("#"));
        v11 = objc_msgSend(v9, "rangeOfString:", CFSTR("?slide"));
        v12 = objc_msgSend(v9, "hasPrefix:", CFSTR("?sectionid="));
        v13 = objc_msgSend(v9, "rangeOfString:", CFSTR("?sheetid="));
        v14 = objc_msgSend(v9, "rangeOfString:", CFSTR("?action=retreat"));
        v15 = objc_msgSend(v9, "rangeOfString:", CFSTR("?action=exitpresentation"));
        v16 = 11;
        if (!v10)
          v16 = 4;
        if (!v11)
          v16 = 6;
        if (v12)
          v16 = 9;
        if (!v13)
          v16 = 10;
        if (!v14)
          v16 = 6;
        if (v15)
          v7 = v16;
        else
          v7 = 7;
      }
      else
      {
        v7 = 11;
      }

    }
  }
  else
  {
    v7 = 11;
  }

  return v7;
}

+ (id)invalidURLSchemes
{
  if (qword_1014151B8 != -1)
    dispatch_once(&qword_1014151B8, &stru_1012466D8);
  return (id)qword_1014151B0;
}

+ (BOOL)schemeIsValidForURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CRLWPHyperlinkField invalidURLSchemes](CRLWPHyperlinkField, "invalidURLSchemes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "scheme"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lowercaseString"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "member:", v6));
    v8 = v7 == 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)schemeIsValidForURLReference:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  double v7;
  id v8;
  unsigned __int8 v9;

  v4 = a3;
  v6 = objc_msgSend(objc_alloc((Class)NSURL), "initWithString:", v4);
  if (v6)
  {
    *(_QWORD *)&v7 = objc_opt_class(a1, v5).n128_u64[0];
    v9 = objc_msgSend(v8, "schemeIsValidForURL:", v6, v7);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)urlWithEmailAddress:(id)a3 subject:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet URLFragmentAllowedCharacterSet](NSCharacterSet, "URLFragmentAllowedCharacterSet"));
    v8 = objc_msgSend(v7, "mutableCopy");

    objc_msgSend(v8, "removeCharactersInString:", CFSTR("&?"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAddingPercentEncodingWithAllowedCharacters:", v8));
    if (objc_msgSend(v9, "length"))
    {
      if (v6 && objc_msgSend(v6, "length"))
      {
        objc_msgSend(v8, "addCharactersInString:", CFSTR("?"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAddingPercentEncodingWithAllowedCharacters:", v8));
        if (objc_msgSend(v10, "length"))
          v11 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("mailto:%@?subject=%@"), v9, v10);
        else
          v11 = 0;

        if (!v11)
          goto LABEL_12;
LABEL_9:
        v12 = objc_msgSend(objc_alloc((Class)NSURL), "initWithString:", v11);

LABEL_13:
        goto LABEL_14;
      }
      v11 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("mailto:%@"), v9);
      if (v11)
        goto LABEL_9;
    }
LABEL_12:
    v12 = 0;
    goto LABEL_13;
  }
  v12 = 0;
LABEL_14:

  return v12;
}

+ (id)defaultFileURL
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("DefaultFileURL")));

  if (v3
    && (objc_opt_class(NSString, v4), (objc_opt_isKindOfClass(v3, v5) & 1) != 0)
    && objc_msgSend(v3, "length"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL crl_fileURLWithPath:](NSURL, "crl_fileURLWithPath:", v3));
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)newURLFromURLReference:(id)a3
{
  id v3;
  id v4;
  int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t buf[24];

  v3 = a3;
  if (!v3)
    goto LABEL_13;
  v4 = objc_msgSend(objc_alloc((Class)NSURL), "initWithString:", v3);
  if (!v4)
  {
    v5 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012466F8);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0F8B0((uint64_t)v3, v5, v6);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101246718);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100E02830(v8, buf, v5, (os_log_t)v7);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLWPHyperlinkField newURLFromURLReference:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPHyperlinkField.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 171, 0, "Failed to create an NSURL from \"%@\", v3);

    if (objc_msgSend(v3, "hasPrefix:", CFSTR("mailto:")))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("mailto:no_reply@apple.com"), 0, 0));
      v4 = (id)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v12));

      goto LABEL_14;
    }
LABEL_13:
    v4 = 0;
  }
LABEL_14:

  return v4;
}

- (CRLWPHyperlinkField)initWithURL:(id)a3 range:(_NSRange)a4 displayText:(id)a5 uuidString:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  id v12;
  id v13;
  id v14;
  CRLWPHyperlinkField *v15;
  CRLWPHyperlinkField *v16;
  objc_super v18;

  length = a4.length;
  location = a4.location;
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CRLWPHyperlinkField;
  v15 = -[CRLWPHyperlinkField init](&v18, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_url, a3);
    v16->_range.location = location;
    v16->_range.length = length;
    objc_storeStrong((id *)&v16->_displayText, a5);
    -[CRLWPSmartField setTextAttributeUUIDString:](v16, "setTextAttributeUUIDString:", v14);
  }

  return v16;
}

- (unsigned)smartFieldKind
{
  return 32;
}

- (BOOL)allowsEditing
{
  return 0;
}

- (NSURL)url
{
  NSURL *v3;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = self->_url;
  if (!v3)
  {
    v4 = -[CRLWPHyperlinkField range](self, "range");
    if (v4 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v3 = 0;
    }
    else
    {
      v6 = v4;
      v7 = v5;
      *(_QWORD *)&v8 = objc_opt_class(self, v5).n128_u64[0];
      v10 = v9;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPSmartField parentStorage](self, "parentStorage", v8));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "substringWithRange:", v6, v7));
      v3 = (NSURL *)objc_msgSend(v10, "newURLFromURLReference:", v12);

    }
  }
  return v3;
}

- (int64_t)scheme
{
  double v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  *(_QWORD *)&v3 = objc_opt_class(self, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPHyperlinkField url](self, "url", v3));
  v7 = objc_msgSend(v5, "schemeFromURL:", v6);

  return (int64_t)v7;
}

- (NSString)urlPrefix
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  unint64_t v6;
  BOOL v7;
  __CFString *v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL absoluteString](self->_url, "absoluteString"));
  v3 = v2;
  if (!v2
    || ((v4 = objc_msgSend(v2, "length"),
         v5 = objc_msgSend(v3, "crlwp_findIndexOfCharacter:range:", 58, 0, v4),
         (v6 = (unint64_t)v5) != 0)
      ? (v7 = v5 == (id)0x7FFFFFFFFFFFFFFFLL)
      : (v7 = 1),
        v7
     || v5 >= objc_msgSend(v3, "crlwp_findIndexOfCharacter:range:", 47, 0, v4)
     || v6 >= (unint64_t)objc_msgSend(v3, "crlwp_findIndexOfCharacter:range:", 63, 0, v4)
     || v6 >= (unint64_t)objc_msgSend(v3, "crlwp_findIndexOfCharacter:range:", 35, 0, v4)))
  {
    v8 = &stru_1012A72B0;
  }
  else
  {
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringWithRange:", 0, v6));
  }

  return (NSString *)v8;
}

- (BOOL)hasDisplayText
{
  return self->_url != 0;
}

- (NSString)filePath
{
  const __CFURL *v2;
  __CFString *v3;

  v2 = (const __CFURL *)objc_claimAutoreleasedReturnValue(-[CRLWPHyperlinkField url](self, "url"));
  if (-[__CFURL isFileURL](v2, "isFileURL"))
    v3 = (__CFString *)CFURLCopyFileSystemPath(v2, kCFURLPOSIXPathStyle);
  else
    v3 = 0;

  return (NSString *)v3;
}

- (NSString)fullPath
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPHyperlinkField filePath](self, "filePath"));
  v3 = v2;
  if (v2 && (objc_msgSend(v2, "isAbsolutePath") & 1) == 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("~"), "stringByExpandingTildeInPath"));
    v5 = v4;
    if (v4)
    {
      v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingPathComponent:", v3));

      v3 = (void *)v6;
    }

  }
  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  CRLWPHyperlinkField *v5;
  uint64_t v6;
  id v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  BOOL v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;

  v5 = (CRLWPHyperlinkField *)a3;
  if (self == v5)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class(CRLWPHyperlinkField, v4);
    v7 = sub_100221D0C(v6, v5);
    v8 = (_QWORD *)objc_claimAutoreleasedReturnValue(v7);
    if (v8 && -[NSString isEqual:](self->_urlString, "isEqual:", v8[10]))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPSmartField textAttributeUUIDString](self, "textAttributeUUIDString"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "textAttributeUUIDString"));
      if (objc_msgSend(v9, "isEqualToString:", v10)
        && (self->_range.location == v8[6] ? (v11 = self->_range.length == v8[7]) : (v11 = 0), v11))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPHyperlinkField displayText](self, "displayText"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "displayText"));
        v12 = objc_msgSend(v13, "isEqual:", v14);

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  return v12;
}

- (unint64_t)hash
{
  CRLHasher *v3;
  void *v4;
  unint64_t v5;

  v3 = objc_alloc_init(CRLHasher);
  -[CRLHasher addObject:](v3, "addObject:", self->_urlString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPHyperlinkField displayText](self, "displayText"));
  -[CRLHasher addObject:](v3, "addObject:", v4);

  v5 = -[CRLHasher hashValue](v3, "hashValue");
  return v5;
}

- (NSString)urlString
{
  return self->_urlString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlString, 0);
  objc_storeStrong((id *)&self->_displayText, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
