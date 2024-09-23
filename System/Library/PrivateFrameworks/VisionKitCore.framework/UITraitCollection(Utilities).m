@implementation UITraitCollection(Utilities)

- (void)vk_performAsCurrent:()Utilities
{
  if (a3)
    return (void *)objc_msgSend(a1, "performAsCurrentTraitCollection:");
  return a1;
}

+ (id)appearanceClassForType:()Utilities
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  _QWORD v10[5];

  if (a3 == 1)
    goto LABEL_4;
  if (!a3)
  {
    a3 = 2;
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CEAB40], "traitCollectionWithUserInterfaceStyle:", a3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v3 = 0;
LABEL_6:
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scale");
  v6 = v5;

  v7 = 2.0;
  if (v6 >= 2.0)
    v7 = v6;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __55__UITraitCollection_Utilities__appearanceClassForType___block_invoke;
  v10[3] = &__block_descriptor_40_e27_v16__0___UIMutableTraits__8l;
  *(double *)&v10[4] = v7;
  objc_msgSend(v3, "traitCollectionByModifyingTraits:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
