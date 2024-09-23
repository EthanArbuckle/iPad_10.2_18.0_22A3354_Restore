@implementation UITraitCollection(WiFiKitUI)

- (uint64_t)isLargeTextTraitCollection
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL8 v11;

  objc_msgSend(a1, "preferredContentSizeCategory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)*MEMORY[0x24BEBE070];

  if (v2 == v3)
    return 1;
  objc_msgSend(a1, "preferredContentSizeCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)*MEMORY[0x24BEBE068];

  if (v4 == v5)
    return 1;
  objc_msgSend(a1, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)*MEMORY[0x24BEBE060];

  if (v6 == v7)
    return 1;
  objc_msgSend(a1, "preferredContentSizeCategory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)*MEMORY[0x24BEBE058];

  if (v8 == v9)
    return 1;
  objc_msgSend(a1, "preferredContentSizeCategory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10 == (void *)*MEMORY[0x24BEBE090];

  return v11;
}

@end
