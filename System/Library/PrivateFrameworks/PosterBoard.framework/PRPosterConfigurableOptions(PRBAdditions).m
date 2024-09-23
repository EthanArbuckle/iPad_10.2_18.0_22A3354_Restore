@implementation PRPosterConfigurableOptions(PRBAdditions)

+ (id)pbf_configurableOptionsForPreview:()PRBAdditions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "titleStyleConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "titleColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6
    || (objc_msgSend(v4, "isUserConfigured") & 1) == 0
    && (objc_msgSend(MEMORY[0x1E0D7FB88], "defaultTitleColor"), (v6 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(v5, "addObject:", v6);

  }
  objc_msgSend(v4, "timeFontConfiguration");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
  {
    v16[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D7FB80], "defaultConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v11 = objc_alloc(MEMORY[0x1E0D7FAD0]);
  objc_msgSend(v3, "displayNameLocalizationKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "contentsLuminance");
  v13 = (void *)objc_msgSend(v11, "initWithDisplayNameLocalizationKey:ambientSupportedDataLayout:preferredTimeFontConfigurations:preferredTitleColors:luminance:preferredHomeScreenConfiguration:", v12, 0, v9, v5, 0);

  return v13;
}

@end
