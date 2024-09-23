@implementation ACMImageLoader

+ (id)sharedInstance
{
  id result;

  result = (id)sLoader;
  if (!sLoader)
  {
    result = (id)objc_opt_new();
    sLoader = (uint64_t)result;
  }
  return result;
}

- (NSMutableDictionary)imagesCache
{
  NSMutableDictionary *result;

  result = self->_imagesCache;
  if (!result)
  {
    result = (NSMutableDictionary *)objc_opt_new();
    self->_imagesCache = result;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  self->_imagesCache = 0;
  v3.receiver = self;
  v3.super_class = (Class)ACMImageLoader;
  -[ACMImageLoader dealloc](&v3, sel_dealloc);
}

- (id)imageNamed:(id)a3
{
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  const __CFData *v15;
  uint64_t v16;
  CGDataProvider *v17;
  CGImageRef v18;

  v5 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](-[ACMImageLoader imagesCache](self, "imagesCache"), "objectForKeyedSubscript:", a3);
  if (!v5)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen"), "scale");
    v7 = v6;
    v8 = +[ACMUIImageUtilities imageResolutionFactor](ACMUIImageUtilities, "imageResolutionFactor");
    if ((int)v8 < 1)
    {
LABEL_8:
      if (ACFLogNS && (ACFLogSettingsGetLevelMask() & 8) != 0)
        ACFLogNS(3, (uint64_t)"-[ACMImageLoader imageNamed:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMImages.m", 116, 0, (uint64_t)CFSTR("No data for image \"%@\"), v13, v14, (uint64_t)a3);
      return 0;
    }
    else
    {
      v9 = v8;
      while (1)
      {
        v10 = &stru_24FCE58F0;
        if ((_DWORD)v9 != 1)
          v10 = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("_%dx"), v9);
        NSClassFromString((NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ACM_%@%@_%@"), objc_msgSend(a3, "stringByDeletingPathExtension"), v10, objc_msgSend((id)objc_msgSend(a3, "pathExtension"), "uppercaseString")));
        v11 = objc_msgSend((id)objc_opt_new(), "data");
        if (v11)
          break;
        v7 = v7 + -1.0;
        v12 = (_DWORD)v9 != 0;
        v9 = (v9 - 1);
        if ((_DWORD)v9 == 0 || !v12)
          goto LABEL_8;
      }
      v15 = (const __CFData *)v11;
      if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
      {
        v16 = objc_opt_class();
        ACFLog(7, (uint64_t)"-[ACMImageLoader imageNamed:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMImages.m", 107, 0, "Loaded image: %@", v16);
      }
      v17 = CGDataProviderCreateWithCFData(v15);
      v18 = CGImageCreateWithPNGDataProvider(v17, 0, 0, kCGRenderingIntentDefault);
      v5 = (void *)objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithCGImage:scale:orientation:", v18, 0, v7);
      if (v18)
        CFRelease(v18);
      if (v17)
        CFRelease(v17);
      if (v5)
        -[NSMutableDictionary setObject:forKey:](-[ACMImageLoader imagesCache](self, "imagesCache"), "setObject:forKey:", v5, a3);
    }
  }
  return v5;
}

@end
