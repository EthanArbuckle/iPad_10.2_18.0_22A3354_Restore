@implementation NSURL(WebNSURLExtras)

+ (uint64_t)_web_URLWithUserTypedString:()WebNSURLExtras
{
  return WTF::URLWithUserTypedStringDeprecated(this, a2);
}

+ (uint64_t)_webkit_URLWithUserTypedString:()WebNSURLExtras
{
  return WTF::URLWithUserTypedString(this, 0, (NSURL *)this);
}

+ (uint64_t)_web_URLWithDataAsString:()WebNSURLExtras
{
  return objc_msgSend(a1, "_web_URLWithDataAsString:relativeToURL:", a3, 0);
}

+ (uint64_t)_web_URLWithDataAsString:()WebNSURLExtras relativeToURL:
{
  WTF *v5;
  NSURL *v6;

  v5 = (WTF *)objc_msgSend((id)objc_msgSend(a3, "_webkit_stringByTrimmingWhitespace"), "dataUsingEncoding:", 5);
  return WTF::URLWithData(v5, a4, v6);
}

- (CFTypeRef)_web_originalDataAsString
{
  id v2;
  NSURL *v3;
  const void *v4;

  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (const void *)objc_msgSend(v2, "initWithData:encoding:", WTF::originalURLData(a1, v3), 5);
  return (id)CFMakeCollectable(v4);
}

- (BOOL)_web_isEmpty
{
  NSURL *v2;

  if (CFURLGetBaseURL(a1))
    return objc_msgSend((id)WTF::originalURLData(a1, v2), "length") == 0;
  else
    return CFURLGetBytes(a1, 0, 0) == 0;
}

- (uint64_t)_web_URLCString
{
  void *v2;
  NSURL *v3;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  objc_msgSend(v2, "appendData:", WTF::originalURLData(a1, v3));
  objc_msgSend(v2, "appendBytes:length:", &unk_1D80FBCC6, 1);
  return objc_msgSend(v2, "bytes");
}

- (uint64_t)_webkit_canonicalize_with_wtf
{
  StringImpl *v1;
  uint64_t v2;
  WTF::StringImpl *v3;
  WTF::StringImpl *v5;
  char v6;

  MEMORY[0x1D82A38F0](&v5, a1);
  if ((v6 & 1) != 0)
    v2 = WTF::URL::operator NSURL *();
  else
    v2 = 0;
  v3 = v5;
  v5 = 0;
  if (!v3)
    return v2;
  if (*(_DWORD *)v3 != 2)
  {
    *(_DWORD *)v3 -= 2;
    return v2;
  }
  WTF::StringImpl::destroy(v3, v1);
  return v2;
}

- (uint64_t)_webkit_URLByRemovingFragment
{
  return WTF::URLByTruncatingOneCharacterBeforeComponent(a1, (NSURL *)0xC, a3);
}

- (uint64_t)_webkit_isJavaScriptURL
{
  return objc_msgSend((id)objc_msgSend(a1, "_web_originalDataAsString"), "_webkit_isJavaScriptURL");
}

- (uint64_t)_webkit_scriptIfJavaScriptURL
{
  return objc_msgSend((id)objc_msgSend(a1, "absoluteString"), "_webkit_scriptIfJavaScriptURL");
}

- (uint64_t)_webkit_isFileURL
{
  return objc_msgSend((id)objc_msgSend(a1, "_web_originalDataAsString"), "_webkit_isFileURL");
}

- (uint64_t)_web_schemeData
{
  return WTF::dataForURLComponentType(a1, (NSURL *)1, a3);
}

- (void)_web_hostData
{
  void *v4;

  v4 = (void *)WTF::dataForURLComponentType(a1, (NSURL *)8, a3);
  if (objc_msgSend(v4, "_web_isCaseInsensitiveEqualToCString:", "localhost")
    && (objc_msgSend((id)-[WTF _web_schemeData](a1, "_web_schemeData"), "_web_isCaseInsensitiveEqualToCString:", "file") & 1) != 0)
  {
    return 0;
  }
  return v4;
}

- (CFTypeRef)_web_hostString
{
  return (id)CFMakeCollectable((CFTypeRef)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", objc_msgSend(a1, "_web_hostData"), 4));
}

- (uint64_t)_webkit_suggestedFilenameWithMIMEType:()WebNSURLExtras
{
  StringImpl *v4;
  uint64_t v5;
  WTF::StringImpl *v6;
  WTF::StringImpl *v8;

  MEMORY[0x1D82A3998](&v8, a3);
  v5 = suggestedFilenameWithMIMEType(a1, (const WTF::String *)&v8);
  v6 = v8;
  v8 = 0;
  if (!v6)
    return v5;
  if (*(_DWORD *)v6 != 2)
  {
    *(_DWORD *)v6 -= 2;
    return v5;
  }
  WTF::StringImpl::destroy(v6, v4);
  return v5;
}

- (uint64_t)_webkit_URLFromURLOrSchemelessFileURL
{
  if (objc_msgSend(a1, "scheme"))
    return (uint64_t)a1;
  else
    return objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", objc_msgSend(CFSTR("file:"), "stringByAppendingString:", objc_msgSend(a1, "absoluteString")));
}

@end
