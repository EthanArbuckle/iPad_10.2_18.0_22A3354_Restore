@implementation UITraitCollection(IC)

- (BOOL)ic_hasCompactHeight
{
  return objc_msgSend(a1, "verticalSizeClass") == 1;
}

- (BOOL)ic_hasEqualSizeToTraitCollection:()IC
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

- (BOOL)ic_hasCompactWidth
{
  return objc_msgSend(a1, "horizontalSizeClass") == 1;
}

- (uint64_t)ic_appearanceInfo
{
  unsigned int v1;

  v1 = objc_msgSend(a1, "ic_isDark");
  return objc_msgSend(MEMORY[0x1E0D639E8], "appearanceInfoWithType:", v1);
}

- (id)ic_traitCollectionByAppendingNonNilTraitCollection:()IC
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v4 = a1;
  v5 = v4;
  if (a3)
  {
    v6 = (void *)MEMORY[0x1E0DC3E88];
    v12[0] = v4;
    v12[1] = a3;
    v7 = (void *)MEMORY[0x1E0C99D20];
    v8 = a3;
    objc_msgSend(v7, "arrayWithObjects:count:", v12, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "traitCollectionWithTraitsFromCollections:", v9);
    v10 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v10;
  }
  return v5;
}

- (BOOL)ic_isDark
{
  return objc_msgSend(a1, "userInterfaceStyle") == 2;
}

+ (uint64_t)ic_alwaysShowLightContent
{
  return objc_msgSend(MEMORY[0x1E0D64270], "BOOLForKey:", CFSTR("ICAlwaysShowLightContentDefaultsKey"));
}

- (uint64_t)ic_hasCompactSize
{
  if ((objc_msgSend(a1, "ic_hasCompactWidth") & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "ic_hasCompactHeight");
}

+ (void)setIc_alwaysShowLightContent:()IC
{
  id v3;

  objc_msgSend(MEMORY[0x1E0D64270], "setBool:forKey:", a3, CFSTR("ICAlwaysShowLightContentDefaultsKey"));
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("ICAlwaysShowLightContentDidChangeNotification"), 0);

}

+ (id)ic_traitsAffectingSizeAndColor
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "ic_traitsAffectingSize");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "systemTraitsAffectingColorAppearance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObjectsFromArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)ic_traitsAffectingSize
{
  _QWORD v1[4];

  v1[3] = *MEMORY[0x1E0C80C00];
  v1[0] = objc_opt_class();
  v1[1] = objc_opt_class();
  v1[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
