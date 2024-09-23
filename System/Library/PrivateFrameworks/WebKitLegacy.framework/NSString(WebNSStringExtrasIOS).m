@implementation NSString(WebNSStringExtrasIOS)

- (void)_web_possibleURLsForForUserTypedString:()WebNSStringExtrasIOS
{
  void *v5;
  __CFString *v6;
  uint64_t v7;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  const __CFString *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  CFRange v19;
  CFRange v20;

  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", a1);
  CFStringTrimWhitespace(v6);
  v19.length = -[__CFString length](v6, "length");
  v19.location = 0;
  CFStringFindAndReplace(v6, CFSTR("\n"), &stru_1E9D6EC48, v19, 0);
  v20.length = -[__CFString length](v6, "length");
  v20.location = 0;
  CFStringFindAndReplace(v6, CFSTR("\r"), &stru_1E9D6EC48, v20, 0);
  if (!-[__CFString length](v6, "length"))
    return v5;
  if (-[__CFString characterAtIndex:](v6, "characterAtIndex:", 0) != 47
    && -[__CFString characterAtIndex:](v6, "characterAtIndex:", 0) != 126)
  {
    v9 = -[__CFString rangeOfString:](v6, "rangeOfString:", CFSTR(":"));
    v10 = -[__CFString rangeOfString:](v6, "rangeOfString:", CFSTR("/"));
    v11 = -[__CFString rangeOfString:](v6, "rangeOfString:", CFSTR("."));
    v12 = -[__CFString rangeOfString:](v6, "rangeOfString:", CFSTR("@"));
    if (v9 != 0x7FFFFFFFFFFFFFFFLL
      && (v10 == 0x7FFFFFFFFFFFFFFFLL || v10 >= v9)
      && ((-[__CFString _web_hasCaseInsensitivePrefix:](v6, "_web_hasCaseInsensitivePrefix:", CFSTR("http:")) & 1) != 0
       || (-[__CFString _web_hasCaseInsensitivePrefix:](v6, "_web_hasCaseInsensitivePrefix:", CFSTR("https:")) & 1) != 0
       || (-[__CFString _web_hasCaseInsensitivePrefix:](v6, "_web_hasCaseInsensitivePrefix:", CFSTR("file:")) & 1) != 0
       || (-[__CFString _web_hasCaseInsensitivePrefix:](v6, "_web_hasCaseInsensitivePrefix:", CFSTR("ftp:")) & 1) != 0
       || (-[__CFString _web_hasCaseInsensitivePrefix:](v6, "_web_hasCaseInsensitivePrefix:", CFSTR("javascript:")) & 1) != 0
       || (-[__CFString _web_hasCaseInsensitivePrefix:](v6, "_web_hasCaseInsensitivePrefix:", CFSTR("about:")) & 1) != 0
       || (-[__CFString _web_hasCaseInsensitivePrefix:](v6, "_web_hasCaseInsensitivePrefix:", CFSTR("radar:")) & 1) != 0
       || (-[__CFString _web_hasCaseInsensitivePrefix:](v6, "_web_hasCaseInsensitivePrefix:", CFSTR("rdar:")) & 1) != 0
       || -[__CFString length](v6, "length") <= v9 + 1
       || -[__CFString characterAtIndex:](v6, "characterAtIndex:") - 58 <= 0xFFFFFFF5))
    {
      goto LABEL_15;
    }
    if (!objc_msgSend((id)-[__CFString lowercaseString](v6, "lowercaseString"), "hasPrefix:", CFSTR("www.")))
    {
      if (objc_msgSend((id)-[__CFString lowercaseString](v6, "lowercaseString"), "hasPrefix:", CFSTR("ftp.")))
      {
        v13 = CFSTR("ftp://");
        goto LABEL_14;
      }
      if (v12 == 0x7FFFFFFFFFFFFFFFLL || v12 >= v10)
      {
        if (v11 != 0x7FFFFFFFFFFFFFFFLL && v11 < v10)
        {
          -[__CFString insertString:atIndex:](v6, "insertString:atIndex:", CFSTR("http://"), 0);
          v15 = objc_msgSend(MEMORY[0x1E0C99E98], "_webkit_URLWithUserTypedString:", v6);
          if (v15)
            objc_msgSend(v5, "addObject:", v15);
LABEL_35:
          -[__CFString insertString:atIndex:](v6, "insertString:atIndex:", CFSTR("www."), 7);
          v14 = (void *)MEMORY[0x1E0C99E98];
LABEL_16:
          v7 = objc_msgSend(v14, "_webkit_URLWithUserTypedString:", v6);
          if (!v7)
            return v5;
          goto LABEL_5;
        }
        if ((objc_msgSend((id)-[__CFString lowercaseString](v6, "lowercaseString"), "isEqualToString:", CFSTR("localhost")) & 1) == 0&& !objc_msgSend((id)-[__CFString lowercaseString](v6, "lowercaseString"), "hasPrefix:", CFSTR("localhost/")))
        {
          -[__CFString insertString:atIndex:](v6, "insertString:atIndex:", CFSTR("http://"), 0);
          v16 = objc_msgSend(MEMORY[0x1E0C99E98], "_webkit_URLWithUserTypedString:", v6);
          if (v16)
            objc_msgSend(v5, "addObject:", v16);
          v17 = -[__CFString rangeOfString:options:range:](v6, "rangeOfString:options:range:", CFSTR(":"), 2, 5, -[__CFString length](v6, "length") - 5);
          if (v17 == 0x7FFFFFFFFFFFFFFFLL)
          {
            if (v10 == 0x7FFFFFFFFFFFFFFFLL)
              LODWORD(v17) = -[__CFString length](v6, "length");
            else
              LODWORD(v17) = v10 + 7;
          }
          v18 = v17;
          if (!a3 || v17 != -[__CFString length](v6, "length"))
            -[__CFString insertString:atIndex:](v6, "insertString:atIndex:", CFSTR(".com"), v18);
          goto LABEL_35;
        }
      }
    }
    v13 = CFSTR("http://");
LABEL_14:
    -[__CFString insertString:atIndex:](v6, "insertString:atIndex:", v13, 0);
LABEL_15:
    v14 = (void *)MEMORY[0x1E0C99E98];
    goto LABEL_16;
  }
  v7 = objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", -[__CFString _web_stringByExpandingTildeInPath](v6, "_web_stringByExpandingTildeInPath"));
  if (v7)
LABEL_5:
    objc_msgSend(v5, "addObject:", v7);
  return v5;
}

- (uint64_t)_web_possibleURLPrefixesForUserTypedString
{
  return objc_msgSend(a1, "_web_possibleURLsForForUserTypedString:", 1);
}

- (uint64_t)_web_possibleURLsForUserTypedString
{
  return objc_msgSend(a1, "_web_possibleURLsForForUserTypedString:", 0);
}

- (uint64_t)_web_bestURLForUserTypedString
{
  void *v1;
  uint64_t result;

  v1 = (void *)objc_msgSend(a1, "_web_possibleURLsForUserTypedString");
  result = objc_msgSend(v1, "count");
  if (result)
    return objc_msgSend((id)objc_msgSend(v1, "objectAtIndex:", 0), "_webkit_canonicalize");
  return result;
}

@end
