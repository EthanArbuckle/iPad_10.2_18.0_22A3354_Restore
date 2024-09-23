@implementation WebFrameView(WebInternal)

+ (uint64_t)_viewTypesAllowImageTypeOmission:()WebInternal
{
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t i;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t j;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  void *v13;
  uint64_t v14;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  *a1 = v2;
  v3 = objc_opt_class();
  v4 = (void *)objc_msgSend(+[WebHTMLView supportedNonImageMIMETypes](WebHTMLView, "supportedNonImageMIMETypes"), "objectEnumerator");
  for (i = objc_msgSend(v4, "nextObject"); ; i = objc_msgSend(v4, "nextObject"))
  {
    v6 = i;
    if (!i)
      break;
    if (!objc_msgSend(v2, "objectForKey:", i))
      objc_msgSend(v2, "setObject:forKey:", v3, v6);
  }
  v7 = objc_opt_class();
  v8 = (void *)objc_msgSend(+[WebHTMLView supportedMediaMIMETypes](WebHTMLView, "supportedMediaMIMETypes"), "objectEnumerator");
  for (j = objc_msgSend(v8, "nextObject"); ; j = objc_msgSend(v8, "nextObject"))
  {
    v10 = j;
    if (!j)
      break;
    if (!objc_msgSend(v2, "objectForKey:", j))
      objc_msgSend(v2, "setObject:forKey:", v7, v10);
  }
  result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "BOOLForKey:", CFSTR("WebKitOmitPDFSupport"));
  if ((result & 1) == 0)
  {
    +[WebView _getPDFViewClass](WebView, "_getPDFViewClass");
    v12 = objc_opt_class();
    v13 = (void *)objc_msgSend((id)-[objc_class supportedMIMETypes](+[WebView _getPDFViewClass](WebView, "_getPDFViewClass"), "supportedMIMETypes"), "objectEnumerator");
    for (result = objc_msgSend(v13, "nextObject"); ; result = objc_msgSend(v13, "nextObject"))
    {
      v14 = result;
      if (!result)
        break;
      if (!objc_msgSend(v2, "objectForKey:", result))
        objc_msgSend(v2, "setObject:forKey:", v12, v14);
    }
  }
  return result;
}

@end
