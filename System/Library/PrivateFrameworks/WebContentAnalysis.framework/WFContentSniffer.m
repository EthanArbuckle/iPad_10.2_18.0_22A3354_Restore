@implementation WFContentSniffer

+ (id)MIMETypeForString:(id)a3
{
  return +[WFContentSniffer MIMETypeForData:andString:](WFContentSniffer, "MIMETypeForData:andString:", objc_msgSend(a3, "dataUsingEncoding:", 1), a3);
}

+ (id)MIMETypeForData:(id)a3
{
  unint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v4 = objc_msgSend(a3, "length");
  if (v4 >= 0x400)
    v5 = 1024;
  else
    v5 = v4;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", objc_msgSend(a3, "bytes"), v5, 1);
  v7 = +[WFContentSniffer MIMETypeForData:andString:](WFContentSniffer, "MIMETypeForData:andString:", a3, v6);

  return v7;
}

+ (BOOL)MIMETypeIsHTMLOrText:(id)a3
{
  if (!a3)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("text/html")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("application/xhtml+xml")) & 1) != 0)
  {
    return 1;
  }
  return objc_msgSend(a3, "isEqualToString:", CFSTR("text/plain"));
}

+ (id)MIMETypeForData:(id)a3 andString:(id)a4
{
  id result;
  _BOOL4 v7;
  const __CFString *v8;
  const __CFString *v9;

  result = 0;
  if (a3 && a4)
  {
    if (+[WFContentSniffer isXML:](WFContentSniffer, "isXML:", a4))
    {
      v7 = +[WFContentSniffer isXHTML:](WFContentSniffer, "isXHTML:", a4);
      v8 = CFSTR("application/xml");
      v9 = CFSTR("application/xhtml+xml");
    }
    else
    {
      if (+[WFContentSniffer isHTML:](WFContentSniffer, "isHTML:", a4))
        return CFSTR("text/html");
      if (+[WFContentSniffer isGIF:](WFContentSniffer, "isGIF:", a4))
        return CFSTR("image/gif");
      if (+[WFContentSniffer isJPEG:](WFContentSniffer, "isJPEG:", a3))
        return CFSTR("image/jpeg");
      if (+[WFContentSniffer isPDF:](WFContentSniffer, "isPDF:", a4))
        return CFSTR("application/pdf");
      if (+[WFContentSniffer isPNG:](WFContentSniffer, "isPNG:", a3))
        return CFSTR("image/png");
      if (+[WFContentSniffer isSWF:](WFContentSniffer, "isSWF:", a4))
        return CFSTR("application/x-shockwave-flash");
      v7 = +[WFContentSniffer isWord:](WFContentSniffer, "isWord:", a3);
      v8 = CFSTR("text/plain");
      v9 = CFSTR("application/msword");
    }
    if (v7)
      return (id)v9;
    else
      return (id)v8;
  }
  return result;
}

+ (BOOL)isHTML:(id)a3
{
  if ((objc_msgSend(a3, "WF_containsString:options:", CFSTR("<html"), 1) & 1) != 0)
    return 1;
  else
    return objc_msgSend(a3, "WF_containsString:options:", CFSTR("</html"), 1);
}

+ (BOOL)isXHTML:(id)a3
{
  BOOL v4;

  if ((objc_msgSend(a3, "WF_containsString:options:", CFSTR("<html"), 1) & 1) == 0
    && !objc_msgSend(a3, "WF_containsString:options:", CFSTR("</html"), 1))
  {
    return 0;
  }
  v4 = 1;
  if ((objc_msgSend(a3, "WF_containsString:options:", CFSTR("xmlns"), 1) & 1) == 0)
    return 0;
  return v4;
}

+ (BOOL)isXML:(id)a3
{
  return objc_msgSend(a3, "WF_containsString:", CFSTR("<?xml"));
}

+ (BOOL)isGIF:(id)a3
{
  if ((objc_msgSend(a3, "hasPrefix:", CFSTR("GIF87a")) & 1) != 0)
    return 1;
  else
    return objc_msgSend(a3, "hasPrefix:", CFSTR("GIF89a"));
}

+ (BOOL)isJPEG:(id)a3
{
  unsigned __int16 *v5;

  if ((unint64_t)objc_msgSend(a3, "length") < 3)
    return 0;
  v5 = (unsigned __int16 *)objc_msgSend(a3, "bytes");
  return *v5 == 55551 && *((unsigned __int8 *)v5 + 2) == 255;
}

+ (BOOL)isPDF:(id)a3
{
  return objc_msgSend(a3, "hasPrefix:", CFSTR("%PDF"));
}

+ (BOOL)isPNG:(id)a3
{
  return (unint64_t)objc_msgSend(a3, "length") >= 8
      && *(_QWORD *)objc_msgSend(a3, "bytes") == 0xA1A0A0D474E5089;
}

+ (BOOL)isSWF:(id)a3
{
  if ((objc_msgSend(a3, "hasPrefix:", CFSTR("FWS")) & 1) != 0)
    return 1;
  else
    return objc_msgSend(a3, "hasPrefix:", CFSTR("CWS"));
}

+ (BOOL)isWord:(id)a3
{
  return (unint64_t)objc_msgSend(a3, "length") >= 0x204
      && *(_DWORD *)(objc_msgSend(a3, "bytes") + 516) == 12690924;
}

+ (BOOL)isOctetStream:(id)a3
{
  unsigned __int8 *v4;
  unint64_t v5;
  int v6;
  BOOL v7;
  unint64_t v8;

  v4 = (unsigned __int8 *)objc_msgSend(a3, "bytes");
  v5 = objc_msgSend(a3, "length");
  if (v5)
  {
    v6 = *v4;
    if ((v6 - 1) >= 8)
    {
      v8 = 1;
      v7 = 1;
      do
      {
        if (v6 == 127)
          break;
        if ((v6 - 11) <= 0x14)
          break;
        v7 = v5 > v8;
        if (v5 == v8)
          break;
        v6 = v4[v8++];
      }
      while ((v6 - 1) >= 8);
    }
    else
    {
      return 1;
    }
  }
  else
  {
    return 0;
  }
  return v7;
}

@end
