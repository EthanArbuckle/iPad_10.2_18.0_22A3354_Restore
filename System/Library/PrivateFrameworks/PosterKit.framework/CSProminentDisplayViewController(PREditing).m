@implementation CSProminentDisplayViewController(PREditing)

- (void)pr_setTitleColor:()PREditing timeFont:timeNumberingSystem:alternateDateEnabled:groupName:extensionBundleURL:
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  unsigned int v24;
  id v25;

  v25 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v17 = a8;
  if (v25)
  {
    v24 = a6;
    objc_msgSend(v25, "color");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setTextColor:", v18);

    v19 = objc_msgSend(MEMORY[0x1E0D01958], "vibrancyEffectTypeFromColor:", v25);
    objc_msgSend(MEMORY[0x1E0D01958], "vibrancyLUTFromColor:extensionBundleURL:luminanceReduced:", v25, v17, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_opt_respondsToSelector();
    objc_msgSend(v20, "lutIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "bundleURL");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v21 & 1) != 0)
      objc_msgSend(a1, "setAlternativeVibrancyEffectLUTIdentifier:alternativeVibrancyEffectLUTBundleURL:luminanceReduced:", v22, v23, 0);
    else
      objc_msgSend(a1, "setAlternativeVibrancyEffectLUTIdentifier:alternativeVibrancyEffectLUTBundleURL:", v22, v23);

    a6 = v24;
    if (v19 != objc_msgSend(a1, "effectType"))
      objc_msgSend(a1, "setEffectType:", v19);

  }
  if (v14)
    objc_msgSend(a1, "setBaseFont:", v14);
  if (v15)
    objc_msgSend(a1, "setNumberingSystem:", v15);
  objc_msgSend(a1, "pr_setAlternateDateEnabled:", a6);
  objc_msgSend(a1, "setGroupName:", v16);

}

- (void)pr_setStylingFromTitleStyleConfiguration:()PREditing withExtensionBundleURL:forRole:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  PRPosterColor *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v25, "titleContentStyle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setTitleContentStyle:", v10);

  objc_msgSend(v25, "effectiveTitleColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "vibrancyConfigurationWithExtensionBundleURL:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = [PRPosterColor alloc];
    objc_msgSend(v12, "color");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[PRPosterColor initWithColor:preferredStyle:](v13, "initWithColor:preferredStyle:", v14, 0);

    v11 = (void *)v15;
  }
  v24 = v9;
  objc_msgSend(v25, "effectiveTimeFontWithExtensionBundleURL:forRole:", v8, v9);
  v16 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "timeNumberingSystem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "groupName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)v16;
  objc_msgSend(a1, "pr_setTitleColor:timeFont:timeNumberingSystem:alternateDateEnabled:groupName:extensionBundleURL:", v11, v16, v17, objc_msgSend(v25, "isAlternateDateEnabled"), v18, v8);
  objc_msgSend(a1, "setEffectType:", objc_msgSend(v12, "effectType"));
  objc_msgSend(a1, "setBackgroundType:", objc_msgSend(v12, "backgroundType"));
  objc_msgSend(v12, "alternativeVibrancyEffectLUT");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_opt_respondsToSelector();
  objc_msgSend(v19, "lutIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bundleURL");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v20 & 1) != 0)
    objc_msgSend(a1, "setAlternativeVibrancyEffectLUTIdentifier:alternativeVibrancyEffectLUTBundleURL:luminanceReduced:", v21, v22, 0);
  else
    objc_msgSend(a1, "setAlternativeVibrancyEffectLUTIdentifier:alternativeVibrancyEffectLUTBundleURL:", v21, v22);

}

- (uint64_t)pr_setSubtitleHidden:()PREditing
{
  unint64_t v5;
  uint64_t v6;

  v5 = objc_msgSend(a1, "elements") & 0xFFFFFFFFFFFFFFFDLL;
  v6 = 2;
  if (a3)
    v6 = 0;
  return objc_msgSend(a1, "setElements:", v5 | v6);
}

@end
