@implementation WebMIMETypeRegistry

+ (id)mimeTypeForExtension:(id)a3
{
  StringImpl *v3;
  const __CFString *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;
  WTF::StringImpl *v8;
  WTF::StringImpl *v9;

  MEMORY[0x1D82A3998](&v8, a3);
  WebCore::MIMETypeRegistry::mimeTypeForExtension();
  if (v9)
  {
    v4 = (const __CFString *)WTF::StringImpl::operator NSString *();
    v5 = v9;
    v9 = 0;
    if (v5)
    {
      if (*(_DWORD *)v5 == 2)
      {
        WTF::StringImpl::destroy(v5, v3);
        v6 = v8;
        v8 = 0;
        if (!v6)
          return (id)v4;
      }
      else
      {
        *(_DWORD *)v5 -= 2;
        v6 = v8;
        v8 = 0;
        if (!v6)
          return (id)v4;
      }
      goto LABEL_8;
    }
  }
  else
  {
    v9 = 0;
    v4 = &stru_1E9D6EC48;
  }
  v6 = v8;
  v8 = 0;
  if (!v6)
    return (id)v4;
LABEL_8:
  if (*(_DWORD *)v6 != 2)
  {
    *(_DWORD *)v6 -= 2;
    return (id)v4;
  }
  WTF::StringImpl::destroy(v6, v3);
  return (id)v4;
}

+ (id)preferredExtensionForMIMEType:(id)a3
{
  const WTF::String *v3;
  StringImpl *v4;
  const __CFString *v5;
  WTF::StringImpl *v6;
  WTF::StringImpl *v7;
  WTF::StringImpl *v9;
  WTF::StringImpl *v10;

  MEMORY[0x1D82A3998](&v9, a3);
  WebCore::MIMETypeRegistry::preferredExtensionForMIMEType((WebCore::MIMETypeRegistry *)&v9, v3);
  if (v10)
  {
    v5 = (const __CFString *)WTF::StringImpl::operator NSString *();
    v6 = v10;
    v10 = 0;
    if (v6)
    {
      if (*(_DWORD *)v6 == 2)
      {
        WTF::StringImpl::destroy(v6, v4);
        v7 = v9;
        v9 = 0;
        if (!v7)
          return (id)v5;
      }
      else
      {
        *(_DWORD *)v6 -= 2;
        v7 = v9;
        v9 = 0;
        if (!v7)
          return (id)v5;
      }
      goto LABEL_8;
    }
  }
  else
  {
    v10 = 0;
    v5 = &stru_1E9D6EC48;
  }
  v7 = v9;
  v9 = 0;
  if (!v7)
    return (id)v5;
LABEL_8:
  if (*(_DWORD *)v7 != 2)
  {
    *(_DWORD *)v7 -= 2;
    return (id)v5;
  }
  WTF::StringImpl::destroy(v7, v4);
  return (id)v5;
}

+ (BOOL)isSupportedImageMIMEType:(id)a3
{
  const WTF::String *v3;
  StringImpl *v4;
  char isSupportedImageMIMEType;
  WTF::StringImpl *v6;
  WTF::StringImpl *v8;

  MEMORY[0x1D82A3998](&v8, a3);
  isSupportedImageMIMEType = WebCore::MIMETypeRegistry::isSupportedImageMIMEType((WebCore::MIMETypeRegistry *)&v8, v3);
  v6 = v8;
  v8 = 0;
  if (!v6)
    return isSupportedImageMIMEType;
  if (*(_DWORD *)v6 != 2)
  {
    *(_DWORD *)v6 -= 2;
    return isSupportedImageMIMEType;
  }
  WTF::StringImpl::destroy(v6, v4);
  return isSupportedImageMIMEType;
}

+ (BOOL)isSupportedMediaMIMEType:(id)a3
{
  const WTF::String *v3;
  StringImpl *v4;
  char isSupportedMediaMIMEType;
  WTF::StringImpl *v6;
  WTF::StringImpl *v8;

  MEMORY[0x1D82A3998](&v8, a3);
  isSupportedMediaMIMEType = WebCore::MIMETypeRegistry::isSupportedMediaMIMEType((WebCore::MIMETypeRegistry *)&v8, v3);
  v6 = v8;
  v8 = 0;
  if (!v6)
    return isSupportedMediaMIMEType;
  if (*(_DWORD *)v6 != 2)
  {
    *(_DWORD *)v6 -= 2;
    return isSupportedMediaMIMEType;
  }
  WTF::StringImpl::destroy(v6, v4);
  return isSupportedMediaMIMEType;
}

@end
