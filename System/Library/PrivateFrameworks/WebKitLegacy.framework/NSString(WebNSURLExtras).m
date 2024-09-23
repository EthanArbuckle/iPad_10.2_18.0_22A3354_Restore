@implementation NSString(WebNSURLExtras)

- (uint64_t)_webkit_isJavaScriptURL
{
  return objc_msgSend(a1, "_webkit_hasCaseInsensitivePrefix:", CFSTR("javascript:"));
}

- (BOOL)_webkit_isFileURL
{
  return objc_msgSend(a1, "rangeOfString:options:", CFSTR("file:"), 9) != 0x7FFFFFFFFFFFFFFFLL;
}

- (const)_webkit_stringByReplacingValidPercentEscapes
{
  PAL *v1;
  StringImpl *v2;
  const __CFString *v3;
  WTF::StringImpl *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v7;
  WTF::StringImpl *v8;

  v1 = (PAL *)MEMORY[0x1D82A3998](&v7, a1);
  PAL::UTF8Encoding(v1);
  PAL::decodeURLEscapeSequences();
  if (v8)
  {
    v3 = (const __CFString *)WTF::StringImpl::operator NSString *();
    v4 = v8;
    v8 = 0;
    if (v4)
    {
      if (*(_DWORD *)v4 == 2)
      {
        WTF::StringImpl::destroy(v4, v2);
        v5 = v7;
        v7 = 0;
        if (!v5)
          return v3;
      }
      else
      {
        *(_DWORD *)v4 -= 2;
        v5 = v7;
        v7 = 0;
        if (!v5)
          return v3;
      }
      goto LABEL_8;
    }
  }
  else
  {
    v8 = 0;
    v3 = &stru_1E9D6EC48;
  }
  v5 = v7;
  v7 = 0;
  if (!v5)
    return v3;
LABEL_8:
  if (*(_DWORD *)v5 != 2)
  {
    *(_DWORD *)v5 -= 2;
    return v3;
  }
  WTF::StringImpl::destroy(v5, v2);
  return v3;
}

- (uint64_t)_webkit_scriptIfJavaScriptURL
{
  if (objc_msgSend(a1, "_webkit_isJavaScriptURL"))
    return objc_msgSend((id)objc_msgSend(a1, "substringFromIndex:", 11), "_webkit_stringByReplacingValidPercentEscapes");
  else
    return 0;
}

- (uint64_t)_web_decodeHostName
{
  uint64_t result;

  result = WTF::decodeHostName(a1, a2);
  if (!result)
    return (uint64_t)a1;
  return result;
}

- (uint64_t)_web_encodeHostName
{
  uint64_t result;

  result = WTF::encodeHostName(a1, a2);
  if (!result)
    return (uint64_t)a1;
  return result;
}

- (uint64_t)_webkit_rangeOfURLScheme
{
  uint64_t v2;
  BOOL v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;

  v2 = objc_msgSend(a1, "rangeOfString:", CFSTR(":"));
  if (v2)
    v3 = v2 == 0x7FFFFFFFFFFFFFFFLL;
  else
    v3 = 1;
  if (v3)
    return 0x7FFFFFFFFFFFFFFFLL;
  v4 = v2;
  if (_MergedGlobals_21 == 1)
  {
    v5 = qword_1ECEC9928;
  }
  else
  {
    -[NSString(WebNSURLExtras) _webkit_rangeOfURLScheme]::$_0::operator()(&v8);
    v5 = v8;
    qword_1ECEC9928 = v8;
    _MergedGlobals_21 = 1;
  }
  v6 = objc_msgSend(a1, "rangeOfCharacterFromSet:options:range:", v5, 0, 0, v4);
  result = 0;
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    return 0x7FFFFFFFFFFFFFFFLL;
  return result;
}

- (CFTypeRef)_webkit_rangeOfURLScheme
{
  CFTypeRef result;

  result = (CFTypeRef)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+.-")), "invertedSet");
  *a1 = result;
  if (result)
    return CFRetain(result);
  return result;
}

- (BOOL)_webkit_looksLikeAbsoluteURL
{
  return objc_msgSend((id)objc_msgSend(a1, "_webkit_stringByTrimmingWhitespace"), "_webkit_rangeOfURLScheme") != 0x7FFFFFFFFFFFFFFFLL;
}

@end
