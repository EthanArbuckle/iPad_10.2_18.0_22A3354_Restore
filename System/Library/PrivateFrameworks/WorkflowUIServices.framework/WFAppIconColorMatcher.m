@implementation WFAppIconColorMatcher

- (WFAppIconColorMatcher)initWithBundleIdentifier:(id)a3
{
  id v5;
  WFAppIconColorMatcher *v6;
  WFAppIconColorMatcher *v7;
  WFAppIconColorMatcher *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFAppIconColorMatcher;
  v6 = -[WFAppIconColorMatcher init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bundleIdentifier, a3);
    v8 = v7;
  }

  return v7;
}

- (id)matchedColor
{
  void *v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  WFMatchedAppIconColorData *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  -[WFAppIconColorMatcher cachedColor](self, "cachedColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WFAppIconColorMatcher cachedColor](self, "cachedColor");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x24BEC14E0];
    -[WFAppIconColorMatcher bundleIdentifier](self, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "applicationIconImageForBundleIdentifier:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    +[WFJoeColorUtility colorForImage:](WFJoeColorUtility, "colorForImage:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = -[WFMatchedAppIconColorData initWithColors:]([WFMatchedAppIconColorData alloc], "initWithColors:", v9);
    objc_storeStrong((id *)&self->_cachedColor, v10);

    return v10;
  }
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (WFMatchedAppIconColorData)cachedColor
{
  return self->_cachedColor;
}

- (void)setCachedColor:(id)a3
{
  objc_storeStrong((id *)&self->_cachedColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedColor, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
