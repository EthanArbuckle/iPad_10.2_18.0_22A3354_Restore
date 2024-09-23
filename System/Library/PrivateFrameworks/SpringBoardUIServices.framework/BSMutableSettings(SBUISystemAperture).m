@implementation BSMutableSettings(SBUISystemAperture)

- (void)SBUISA_setCGRect:()SBUISystemAperture forSetting:
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setObject:forSetting:", v5, a3);

}

- (void)SBUISA_setCGSize:()SBUISystemAperture forSetting:
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setObject:forSetting:", v5, a3);

}

- (void)SBUISA_setDirectionalEdgeInsets:()SBUISystemAperture forSetting:
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithDirectionalEdgeInsets:");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setObject:forSetting:", v5, a3);

}

- (void)SBUISA_setContextId:()SBUISystemAperture forSetting:
{
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setObject:forSetting:", v6, a4);

}

- (void)SBUISA_setRenderingid:()SBUISystemAperture forSetting:
{
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setObject:forSetting:", v6, a4);

}

- (void)SBUISA_setLayoutMode:()SBUISystemAperture forSetting:
{
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setObject:forSetting:", v6, a4);

}

- (void)SBUISA_setContentRole:()SBUISystemAperture forSetting:
{
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setObject:forSetting:", v6, a4);

}

- (void)SBUISA_setPresentationBehaviors:()SBUISystemAperture forSetting:
{
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setObject:forSetting:", v6, a4);

}

- (void)SBUISA_setUIColor:()SBUISystemAperture forSetting:
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;

  if (a3)
  {
    v13 = 0.0;
    v14 = 0.0;
    v11 = 0.0;
    v12 = 0.0;
    v6 = (void *)MEMORY[0x1E0CEAB40];
    v7 = a3;
    objc_msgSend(v6, "traitCollectionWithUserInterfaceStyle:", 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "resolvedColorWithTraitCollection:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "getRed:green:blue:alpha:", &v14, &v13, &v12, &v11);
    objc_msgSend(MEMORY[0x1E0D01710], "colorWithRed:green:blue:alpha:", v14, v13, v12, v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(a1, "SBUISA_setNullableObject:forSetting:", v10, a4, *(_QWORD *)&v11, *(_QWORD *)&v12, *(_QWORD *)&v13, *(_QWORD *)&v14);

}

- (void)SBUISA_setCustomLayout:()SBUISystemAperture forSetting:
{
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setObject:forSetting:", v6, a4);

}

- (void)SBUISA_setNullableObject:()SBUISystemAperture forSetting:
{
  id v6;

  if (a3)
  {
    objc_msgSend(a1, "setObject:forSetting:", a3, a4);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setObject:forSetting:", v6, a4);

  }
}

@end
