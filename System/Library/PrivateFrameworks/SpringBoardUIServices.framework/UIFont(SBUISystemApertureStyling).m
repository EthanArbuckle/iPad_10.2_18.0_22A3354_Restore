@implementation UIFont(SBUISystemApertureStyling)

+ (id)sbui_systemAperturePreferredFontForTextStyle:()SBUISystemApertureStyling
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CEAB40], "sbui_bestTraitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sbui_systemAperturePreferredFontForTextStyle:compatibleWithTraitCollection:", a3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)sbui_systemAperturePreferredFontForTextStyle:()SBUISystemApertureStyling compatibleWithTraitCollection:
{
  id v5;
  id v6;
  id v7;
  double v8;
  double v9;
  id *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;

  v5 = a4;
  v6 = (id)*MEMORY[0x1E0CEB538];
  v7 = (id)*MEMORY[0x1E0CEB4E8];
  v8 = *MEMORY[0x1E0CEB5F0];
  v9 = 0.0;
  switch(a3)
  {
    case 0:
      v10 = (id *)MEMORY[0x1E0CEB568];
      goto LABEL_5;
    case 1:
      v10 = (id *)MEMORY[0x1E0CEB590];
      goto LABEL_5;
    case 2:
      v10 = (id *)MEMORY[0x1E0CEB5C0];
LABEL_5:
      v11 = *v10;

      v8 = *MEMORY[0x1E0CEB5E8];
      goto LABEL_7;
    case 3:
      v11 = (id)*MEMORY[0x1E0CEB588];

LABEL_7:
      v6 = v11;
      break;
    case 4:
      v8 = *MEMORY[0x1E0CEB5E8];
      v9 = 14.5;
      break;
    case 5:
      v8 = *MEMORY[0x1E0CEB5F8];
      v9 = 15.0;
      break;
    case 6:
      v12 = (id)*MEMORY[0x1E0CEB4F8];

      v8 = *MEMORY[0x1E0CEB5D8];
      v9 = 13.0;
      v7 = v12;
      break;
    default:
      break;
  }
  if (v5)
    objc_msgSend(MEMORY[0x1E0CEA5F0], "_preferredFontDescriptorWithTextStyle:addingSymbolicTraits:design:weight:compatibleWithTraitCollection:", v6, 0, v7, v5, v8);
  else
    objc_msgSend(MEMORY[0x1E0CEA5F0], "_preferredFontDescriptorWithTextStyle:design:weight:", v6, v7, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", v13, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)sbui_systemAperturePreferredTextButtonFont
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CEAB40], "sbui_bestTraitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sbui_systemAperturePreferredTextButtonFontCompatibleWithTraitCollection:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)sbui_systemAperturePreferredTextButtonFontCompatibleWithTraitCollection:()SBUISystemApertureStyling
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "preferredContentSizeCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    UIContentSizeCategoryClip(v6, (void *)*MEMORY[0x1E0CEB420], (void *)*MEMORY[0x1E0CEB3F8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "preferredContentSizeCategory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

    if ((v9 & 1) == 0)
    {
      v10 = (void *)MEMORY[0x1E0CEAB40];
      v16[0] = v5;
      objc_msgSend(MEMORY[0x1E0CEAB40], "traitCollectionWithPreferredContentSizeCategory:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16[1] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "traitCollectionWithTraitsFromCollections:", v12);
      v13 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v13;
    }

  }
  objc_msgSend(a1, "sbui_systemAperturePreferredFontForTextStyle:compatibleWithTraitCollection:", 2, v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end
