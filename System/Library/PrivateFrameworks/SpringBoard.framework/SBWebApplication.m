@implementation SBWebApplication

+ (id)_webAppIdentifierFromWebClipIdentifier:(id)a3
{
  return (id)objc_msgSend(CFSTR("sceneID:com.apple.webapp-"), "stringByAppendingString:", a3);
}

+ (id)_webClipIdentifierFromWebAppIdentifier:(id)a3
{
  id v3;
  unint64_t v4;
  void *v5;

  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  if (v4 > objc_msgSend(CFSTR("sceneID:com.apple.webapp-"), "length")
    && objc_msgSend(v3, "hasPrefix:", CFSTR("sceneID:com.apple.webapp-")))
  {
    objc_msgSend(v3, "substringFromIndex:", objc_msgSend(CFSTR("sceneID:com.apple.webapp-"), "length"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)iconIdentifier
{
  return 0;
}

- (BOOL)isWebApplication
{
  return 1;
}

- (BOOL)supportsMultitaskingShelf
{
  return 0;
}

@end
