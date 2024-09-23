@implementation VKCVisualSearchResultInfo

- (VKCVisualSearchResultInfo)initWithResultItem:(id)a3
{
  id v5;
  VKCVisualSearchResultInfo *v6;
  VKCVisualSearchResultInfo *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VKCVisualSearchResultInfo;
  v6 = -[VKCVisualSearchResultInfo init](&v9, sel_init);
  v7 = v6;
  if (!v5)
  {
    +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((item) != nil)", "-[VKCVisualSearchResultInfo initWithResultItem:]", 0, 0, CFSTR("Expected non-nil value for '%s'"), "item");
    if (!v7)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (v6)
  {
LABEL_3:
    objc_storeStrong((id *)&v7->_item, a3);
    v7->_domain = -[VKCVisualSearchResultInfo calcDomain](v7, "calcDomain");
  }
LABEL_4:

  return v7;
}

- (NSString)displayLabel
{
  void *v2;
  void *v3;
  __CFString *v4;
  __CFString *v5;
  NSString *v6;

  -[VKCVisualSearchResultInfo item](self, "item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "domainInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayLabel");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = &stru_1E94661A8;
  v6 = v4;

  return v6;
}

- (NSString)displayMessage
{
  void *v2;
  void *v3;
  __CFString *v4;
  __CFString *v5;
  NSString *v6;

  -[VKCVisualSearchResultInfo item](self, "item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "domainInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayMessage");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = &stru_1E94661A8;
  v6 = v4;

  return v6;
}

- (NSString)glyphName
{
  void *v2;
  void *v3;
  __CFString *v4;
  __CFString *v5;
  NSString *v6;

  -[VKCVisualSearchResultInfo item](self, "item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "domainInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "glyphName");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = &stru_1E94661A8;
  v6 = v4;

  return v6;
}

- (CGRect)normalizedBoundingRect
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[VKCVisualSearchResultInfo item](self, "item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "normalizedBoundingBox");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (NSString)infoButtonGlyphName
{
  __CFString *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (-[VKCVisualSearchResultInfo _forceDefaultGlyphForDomain:](self, "_forceDefaultGlyphForDomain:", -[VKCVisualSearchResultInfo domain](self, "domain"))|| (-[VKCVisualSearchResultInfo _infoButtonGlyphName](self, "_infoButtonGlyphName"), (v3 = (__CFString *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v3 = CFSTR("info.circle.badge.sparkles");
  }
  if (vk_isInternalBuild() || vk_isSeedBuild())
  {
    objc_msgSend(MEMORY[0x1E0CEA638], "vk_symbolImageWithName:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v5 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.visualSearch");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        -[VKCVisualSearchResultInfo item](self, "item");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "domainInfo");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "domain");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "lastPathComponent");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138412290;
        v12 = v9;
        _os_log_impl(&dword_1D2E0D000, v5, OS_LOG_TYPE_DEFAULT, "Unable to find glyph for domain: %@", (uint8_t *)&v11, 0xCu);

      }
      v3 = CFSTR("info.circle.badge.sparkles");
    }

  }
  return (NSString *)v3;
}

- (BOOL)_forceDefaultGlyphForDomain:(int64_t)a3
{
  return ((unint64_t)a3 < 0x12) & (0x30246u >> a3);
}

- (id)_infoButtonGlyphName
{
  unint64_t v2;

  v2 = -[VKCVisualSearchResultInfo domain](self, "domain");
  if (v2 > 0x13)
    return 0;
  else
    return off_1E94642E0[v2];
}

- (NSString)filledInfoButtonGlyphName
{
  void *v2;
  void *v3;

  -[VKCVisualSearchResultInfo infoButtonGlyphName](self, "infoButtonGlyphName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", CFSTR(".fill"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (int64_t)calcDomain
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;

  -[VKCVisualSearchResultInfo item](self, "item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "domainInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pathExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("album")) & 1) != 0)
    goto LABEL_2;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("art")) & 1) != 0)
  {
    v6 = 2;
    goto LABEL_41;
  }
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("birds")) & 1) != 0)
  {
    v6 = 5;
    goto LABEL_41;
  }
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("book")) & 1) != 0)
  {
    v6 = 6;
    goto LABEL_41;
  }
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("cats")) & 1) != 0)
  {
    v6 = 7;
    goto LABEL_41;
  }
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("dogs")) & 1) != 0)
  {
    v6 = 8;
    goto LABEL_41;
  }
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("food")) & 1) != 0)
  {
    v6 = 9;
    goto LABEL_41;
  }
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("insects")) & 1) != 0)
  {
    v6 = 10;
    goto LABEL_41;
  }
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("landmark")) & 1) != 0)
  {
    v6 = 11;
    goto LABEL_41;
  }
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("mammals")) & 1) != 0)
  {
    v6 = 12;
    goto LABEL_41;
  }
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("naturalLandmark")) & 1) != 0)
  {
    v6 = 13;
    goto LABEL_41;
  }
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("nature")) & 1) != 0)
  {
    v6 = 14;
    goto LABEL_41;
  }
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("reptiles")) & 1) != 0)
  {
    v6 = 15;
    goto LABEL_41;
  }
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("sculpture")) & 1) != 0)
  {
    v6 = 16;
    goto LABEL_41;
  }
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("skyline")) & 1) != 0)
  {
    v6 = 17;
    goto LABEL_41;
  }
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("storefront")) & 1) != 0)
  {
    v6 = 18;
    goto LABEL_41;
  }
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("album")) & 1) != 0)
  {
LABEL_2:
    v6 = 1;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("laundryCareSymbol")) & 1) != 0)
  {
    v6 = 19;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("brandLogoSymbol")) & 1) != 0)
  {
    v6 = 4;
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("autoSymbol")))
  {
    v6 = 3;
  }
  else
  {
    v6 = 0;
  }
LABEL_41:

  return v6;
}

- (VKCVisualSearchResultItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
}

- (int64_t)domain
{
  return self->_domain;
}

- (void)setDomain:(int64_t)a3
{
  self->_domain = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);
}

@end
