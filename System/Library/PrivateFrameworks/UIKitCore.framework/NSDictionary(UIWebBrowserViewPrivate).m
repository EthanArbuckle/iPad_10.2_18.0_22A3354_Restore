@implementation NSDictionary(UIWebBrowserViewPrivate)

- (uint64_t)_web_messageText
{
  return objc_msgSend(a1, "objectForKey:", CFSTR("message"));
}

- (uint64_t)_web_messageLineNumber
{
  return objc_msgSend((id)objc_msgSend(a1, "objectForKey:", CFSTR("lineNumber")), "intValue");
}

- (uint64_t)_web_messageSourceURL
{
  return objc_msgSend(a1, "objectForKey:", CFSTR("sourceURL"));
}

- (uint64_t)_web_messageType
{
  void *v2;
  int v3;
  void *v4;
  int v5;

  v2 = (void *)objc_msgSend(a1, "objectForKey:", CFSTR("MessageLevel"));
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("TipMessageLevel")) & 1) != 0)
  {
    v3 = 2;
  }
  else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("LogMessageLevel")) & 1) != 0)
  {
    v3 = 4;
  }
  else if (objc_msgSend(v2, "isEqualToString:", CFSTR("WarningMessageLevel")))
  {
    v3 = 8;
  }
  else
  {
    v3 = 16;
  }
  v4 = (void *)objc_msgSend(a1, "objectForKey:", CFSTR("MessageSource"));
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("HTMLMessageSource")) & 1) != 0)
  {
    v5 = 32;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("XMLMessageSource")) & 1) != 0)
  {
    v5 = 64;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("JSMessageSource")) & 1) != 0)
  {
    v5 = 128;
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("CSSMessageSource")))
  {
    v5 = 256;
  }
  else
  {
    v5 = 512;
  }
  return v5 | v3;
}

@end
