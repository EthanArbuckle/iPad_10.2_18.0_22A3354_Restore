@implementation WFImageCache

+ (id)sharedImageCache
{
  if (sharedImageCache_onceToken != -1)
    dispatch_once(&sharedImageCache_onceToken, &__block_literal_global_4);
  return (id)_sharedImageCache;
}

void __32__WFImageCache_sharedImageCache__block_invoke()
{
  WFImageCache *v0;
  void *v1;

  v0 = objc_alloc_init(WFImageCache);
  v1 = (void *)_sharedImageCache;
  _sharedImageCache = (uint64_t)v0;

}

- (WFImageCache)init
{
  WFImageCache *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *imageCache;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFImageCache;
  v2 = -[WFImageCache init](&v6, sel_init);
  v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  imageCache = v2->_imageCache;
  v2->_imageCache = v3;

  return v2;
}

- (void)clearCache
{
  -[NSMutableDictionary removeAllObjects](self->_imageCache, "removeAllObjects");
}

- (id)imageNamed:(id)a3
{
  __CFString *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  os_log_type_t v19;
  const char *v20;
  NSObject *v21;
  os_log_type_t v22;
  os_log_type_t v23;
  int v24;
  const __CFString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = (__CFString *)a3;
  if (!v4)
  {
    v5 = 0;
    goto LABEL_9;
  }
  -[NSMutableDictionary objectForKey:](self->_imageCache, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.framework.WiFiKitUI"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      WFLogForCategory(0);
      v18 = objc_claimAutoreleasedReturnValue();
      v23 = OSLogForWFLogLevel(1uLL);
      if (!WFCurrentLogLevel() || !v18 || !os_log_type_enabled(v18, v23))
        goto LABEL_30;
      v24 = 138412290;
      v25 = CFSTR("com.apple.framework.WiFiKitUI");
      v20 = "Unable to get bundle for %@";
      v21 = v18;
      v22 = v23;
      goto LABEL_29;
    }
    if (-[WFImageCache _isUIKitImageName:](self, "_isUIKitImageName:", v4))
    {
      objc_msgSend(MEMORY[0x24BEBD640], "kitImageNamed:", v4);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    if (-[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("checkmark")))
    {
      objc_msgSend(MEMORY[0x24BEBB528], "defaultFontDescriptorWithTextStyle:", *MEMORY[0x24BEBE1D0]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "fontDescriptorWithSymbolicTraits:", 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v10, 0.0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBD660], "configurationWithFont:scale:", v11, 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x24BEBD640];
      v14 = CFSTR("checkmark");
    }
    else if (-[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("Lock")))
    {
      objc_msgSend(MEMORY[0x24BEBB528], "defaultFontDescriptorWithTextStyle:", *MEMORY[0x24BEBE1D0]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "fontDescriptorWithSymbolicTraits:", 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v10, 0.0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBD660], "configurationWithFont:scale:", v11, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x24BEBD640];
      v14 = CFSTR("lock.fill");
    }
    else if (-[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("Personal_Hotspot")))
    {
      objc_msgSend(MEMORY[0x24BEBB528], "defaultFontDescriptorWithTextStyle:", *MEMORY[0x24BEBE1D0]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "fontDescriptorWithSymbolicTraits:", 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v10, 0.0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBD660], "configurationWithFont:scale:", v11, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x24BEBD640];
      v14 = CFSTR("personalhotspot");
    }
    else
    {
      if (!-[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("WiFiBarsError")))
      {
        objc_msgSend(MEMORY[0x24BEBD640], "imageNamed:inBundle:compatibleWithTraitCollection:", v4, v6, 0);
        v7 = objc_claimAutoreleasedReturnValue();
LABEL_6:
        v5 = (void *)v7;
        if (v7)
        {
LABEL_7:
          -[NSMutableDictionary setObject:forKey:](self->_imageCache, "setObject:forKey:", v5, v4);
LABEL_8:

          goto LABEL_9;
        }
        goto LABEL_19;
      }
      objc_msgSend(MEMORY[0x24BEBB528], "defaultFontDescriptorWithTextStyle:", *MEMORY[0x24BEBE1D0]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "fontDescriptorWithSymbolicTraits:", 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v10, 0.0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBD660], "configurationWithFont:scale:", v11, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x24BEBD640];
      v14 = CFSTR("wifi.exclamationmark");
    }
    objc_msgSend(v13, "systemImageNamed:withConfiguration:", v14, v12);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      goto LABEL_7;
LABEL_19:
    WFLogForCategory(0);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v18 || !os_log_type_enabled(v18, v19))
      goto LABEL_30;
    v24 = 138412290;
    v25 = v4;
    v20 = "Unable to get image named %@";
    v21 = v18;
    v22 = v19;
LABEL_29:
    _os_log_impl(&dword_2196CC000, v21, v22, v20, (uint8_t *)&v24, 0xCu);
LABEL_30:

    v5 = 0;
    goto LABEL_8;
  }
LABEL_9:

  return v5;
}

- (id)imageNamed:(id)a3 variableValue:(double)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (!v6)
  {
    v7 = 0;
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%f"), v6, *(_QWORD *)&a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFImageCache imageNamed:](self, "imageNamed:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("wifi")) & 1) != 0
      || objc_msgSend(v6, "isEqualToString:", CFSTR("cellularbars")))
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithDynamicProvider:", &__block_literal_global_43);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBD660], "configurationWithHierarchicalColor:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBB528], "defaultFontDescriptorWithTextStyle:", *MEMORY[0x24BEBE1D0]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "fontDescriptorWithSymbolicTraits:", 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v13, 0.0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBD660], "configurationWithFont:scale:", v14, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "configurationByApplyingConfiguration:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:variableValue:withConfiguration:", v6, v16, a4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        -[NSMutableDictionary setObject:forKey:](self->_imageCache, "setObject:forKey:", v9, v7);
        goto LABEL_14;
      }
    }
    WFLogForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v17 && os_log_type_enabled(v17, v18))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v7;
      _os_log_impl(&dword_2196CC000, v17, v18, "Unable to get image named %@", buf, 0xCu);
    }

LABEL_13:
    v9 = 0;
    goto LABEL_14;
  }
  v9 = (void *)v8;
LABEL_14:

  return v9;
}

id __41__WFImageCache_imageNamed_variableValue___block_invoke(uint64_t a1, void *a2)
{
  if (objc_msgSend(a2, "userInterfaceStyle") == 2)
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemWhiteColor");
  else
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlackColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_isUIKitImageName:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  char v6;

  v3 = (void *)MEMORY[0x24BDBCF20];
  v4 = a3;
  objc_msgSend(v3, "setWithObjects:", CFSTR("LockScreen_0_Bars"), CFSTR("LockScreen_1_Bars"), CFSTR("LockScreen_2_Bars"), CFSTR("LockScreen_3_Bars"), CFSTR("LockScreen_4_Bars"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (NSMutableDictionary)imageCache
{
  return self->_imageCache;
}

- (void)setImageCache:(id)a3
{
  objc_storeStrong((id *)&self->_imageCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageCache, 0);
}

@end
