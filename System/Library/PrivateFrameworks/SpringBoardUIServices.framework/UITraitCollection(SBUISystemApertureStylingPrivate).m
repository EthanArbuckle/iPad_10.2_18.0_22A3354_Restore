@implementation UITraitCollection(SBUISystemApertureStylingPrivate)

+ (id)sbui_bestTraitCollection
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  +[SBUISystemApertureElementSource openSources](SBUISystemApertureElementSource, "openSources", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v6), "systemApertureElement");
        v7 = objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          v8 = (void *)v7;
          objc_msgSend(a1, "sbui_traitCollectionForElement:", v7);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v4)
        continue;
      break;
    }
  }
  v8 = 0;
  v9 = 0;
LABEL_11:

  return v9;
}

+ (id)sbui_traitCollectionForElement:()SBUISystemApertureStylingPrivate
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "activeLayoutMode");

  objc_msgSend(v4, "sbui_traitCollectionAllowingTraitsForCustomLayoutMode:", v5 == 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)sbui_preferredContentSizeCategoryAllowingTraitsForCustomLayoutMode:()SBUISystemApertureStylingPrivate
{
  id v5;
  void *v6;
  uint64_t v7;

  v5 = (id)*MEMORY[0x1E0CEB420];
  if (a3)
  {
    objc_msgSend(a1, "preferredContentSizeCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    UIContentSizeCategoryClip(v6, v5, (void *)*MEMORY[0x1E0CEB3F8]);
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v7;
  }
  return v5;
}

- (id)sbui_traitCollectionAllowingTraitsForCustomLayoutMode:()SBUISystemApertureStylingPrivate
{
  void *v2;
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "sbui_preferredContentSizeCategoryAllowingTraitsForCustomLayoutMode:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = a1;
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", v2);

  if ((v5 & 1) == 0)
  {
    v6 = (void *)MEMORY[0x1E0CEAB40];
    v11[0] = v3;
    objc_msgSend(MEMORY[0x1E0CEAB40], "traitCollectionWithPreferredContentSizeCategory:", v2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "traitCollectionWithTraitsFromCollections:", v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v9;
  }

  return v3;
}

@end
