@implementation UITraitCollection(VK)

- (BOOL)vk_shouldUseLargeButtons
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "preferredContentSizeCategory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CEB410]) & 1) == 0
    && (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CEB438]) & 1) == 0
    && (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CEB428]) & 1) == 0
    && (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CEB420]) & 1) == 0
    && !objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CEB408]);

  return v2;
}

- (id)vk_traitCollectionWithContentSize:()VK
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__UITraitCollection_VK__vk_traitCollectionWithContentSize___block_invoke;
  v8[3] = &unk_1E9463E30;
  v9 = v4;
  v5 = v4;
  objc_msgSend(a1, "traitCollectionByModifyingTraits:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (uint64_t)vk_hasCompactSize
{
  if ((objc_msgSend(a1, "vk_hasCompactWidth") & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "vk_hasCompactHeight");
}

- (BOOL)vk_hasCompactHeight
{
  return objc_msgSend(a1, "verticalSizeClass") == 1;
}

- (BOOL)vk_hasCompactWidth
{
  return objc_msgSend(a1, "horizontalSizeClass") == 1;
}

- (BOOL)vk_isOptimizedForMac
{
  return objc_msgSend(a1, "userInterfaceIdiom") == 5;
}

- (BOOL)vk_isDark
{
  return objc_msgSend(a1, "userInterfaceStyle") == 2;
}

- (BOOL)vk_isRTL
{
  return objc_msgSend(a1, "layoutDirection") == 1;
}

- (BOOL)vk_hasEqualSizeToTraitCollection:()VK
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL8 v7;

  v4 = a3;
  v5 = objc_msgSend(a1, "horizontalSizeClass");
  if (v5 == objc_msgSend(v4, "horizontalSizeClass"))
  {
    v6 = objc_msgSend(a1, "verticalSizeClass");
    v7 = v6 == objc_msgSend(v4, "verticalSizeClass");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)vk_traitCollectionClampedToNonaccessibilityContentSize
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  objc_msgSend(v1, "preferredContentSizeCategory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CEB3D8]) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CEB3D0]) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CEB3C8]) & 1) != 0
    || objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CEB3C0]))
  {
    objc_msgSend(v1, "traitCollectionByModifyingTraits:", &__block_literal_global_14);
    v3 = objc_claimAutoreleasedReturnValue();

    v1 = (id)v3;
  }

  return v1;
}

- (double)vk_contentSizeScaleFactor
{
  void *v1;
  double v2;

  objc_msgSend(a1, "preferredContentSizeCategory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1 == (void *)*MEMORY[0x1E0CEB410])
  {
    v2 = 0.8;
  }
  else if (v1 == (void *)*MEMORY[0x1E0CEB438])
  {
    v2 = 0.85;
  }
  else if (v1 == (void *)*MEMORY[0x1E0CEB428])
  {
    v2 = 0.9;
  }
  else
  {
    v2 = 1.0;
    if (v1 != (void *)*MEMORY[0x1E0CEB420] && v1 != (void *)*MEMORY[0x1E0CEB440])
    {
      if (v1 == (void *)*MEMORY[0x1E0CEB408])
      {
        v2 = 1.1;
      }
      else if (v1 == (void *)*MEMORY[0x1E0CEB400])
      {
        v2 = 1.2;
      }
      else if (v1 == (void *)*MEMORY[0x1E0CEB3F8])
      {
        v2 = 1.35;
      }
      else if (v1 == (void *)*MEMORY[0x1E0CEB3E0])
      {
        v2 = 1.6;
      }
      else if (v1 == (void *)*MEMORY[0x1E0CEB3D8])
      {
        v2 = 1.9;
      }
      else if (v1 == (void *)*MEMORY[0x1E0CEB3D0])
      {
        v2 = 2.35;
      }
      else if (v1 == (void *)*MEMORY[0x1E0CEB3C8])
      {
        v2 = 2.75;
      }
      else if (v1 == (void *)*MEMORY[0x1E0CEB3C0])
      {
        v2 = 3.1;
      }
      else
      {
        v2 = 1.0;
      }
    }
  }

  return v2;
}

@end
