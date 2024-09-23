@implementation NSError(WebKitExtras)

+ (void)_registerWebKitErrors
{
  if (_registerWebKitErrors_flag != -1)
    dispatch_once(&_registerWebKitErrors_flag, &__block_literal_global_3);
}

+ (id)_webkit_errorWithDomain:()WebKitExtras code:URL:
{
  return (id)objc_msgSend([a1 alloc], "_webkit_initWithDomain:code:URL:", a3, a4, a5);
}

+ (uint64_t)_webKitErrorWithDomain:()WebKitExtras code:URL:
{
  objc_msgSend(a1, "_registerWebKitErrors");
  return objc_msgSend(a1, "_webkit_errorWithDomain:code:URL:", a3, a4, a5);
}

+ (uint64_t)_webKitErrorWithCode:()WebKitExtras failingURL:
{
  return objc_msgSend(a1, "_webKitErrorWithDomain:code:URL:", WebKitErrorDomain, a3, objc_msgSend(MEMORY[0x1E0C99E98], "_webkit_URLWithUserTypedString:", a4));
}

- (uint64_t)_initWithPluginErrorCode:()WebKitExtras contentURL:pluginPageURL:pluginName:MIMEType:
{
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;

  objc_msgSend((id)objc_opt_class(), "_registerWebKitErrors");
  v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v14 = (void *)objc_msgSend((id)descriptions, "objectForKey:", WebKitErrorDomain);
  v15 = objc_msgSend(v14, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3));
  if (v15)
    objc_msgSend(v13, "setObject:forKey:", v15, *MEMORY[0x1E0CB2D50]);
  if (a4)
  {
    objc_msgSend(v13, "setObject:forKey:", a4, CFSTR("NSErrorFailingURLKey"));
    v16 = objc_msgSend(a4, "_web_userVisibleString");
    objc_msgSend(v13, "setObject:forKey:", v16, *MEMORY[0x1E0CB3300]);
  }
  if (a5)
    objc_msgSend(v13, "setObject:forKey:", objc_msgSend(a5, "_web_userVisibleString"), CFSTR("WebKitErrorPlugInPageURLStringKey"));
  if (a6)
    objc_msgSend(v13, "setObject:forKey:", a6, CFSTR("WebKitErrorPlugInNameKey"));
  if (a7)
    objc_msgSend(v13, "setObject:forKey:", a7, CFSTR("WebKitErrorMIMETypeKey"));
  if (objc_msgSend(v13, "count"))
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:", v13);
  else
    v17 = 0;

  v18 = objc_msgSend(a1, "initWithDomain:code:userInfo:", WebKitErrorDomain, (int)a3, v17);
  return v18;
}

+ (uint64_t)_webkit_addErrorsWithCodesAndDescriptions:()WebKitExtras inDomain:
{
  id v0;

  v0 = (id)descriptions;
  if (!descriptions)
  {
    v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    descriptions = (uint64_t)v0;
  }
  return objc_msgSend(v0, "setObject:forKey:");
}

@end
