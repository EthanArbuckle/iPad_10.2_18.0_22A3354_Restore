@implementation UIColor(VSAdditions)

+ (uint64_t)vsa_primaryBackgroundColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
}

+ (uint64_t)vsa_secondaryBackgroundColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "secondarySystemBackgroundColor");
}

+ (uint64_t)vsa_tertiaryBackgroundColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "tertiarySystemBackgroundColor");
}

+ (uint64_t)vsa_primaryLabelColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
}

+ (uint64_t)vsa_secondaryLabelColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
}

+ (uint64_t)vsa_tertiaryLabelColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "tertiaryLabelColor");
}

+ (uint64_t)vsa_quaternaryLabelColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "quaternaryLabelColor");
}

+ (id)vsa_dynamicColorWithLightStyleColor:()VSAdditions darkStyleColor:
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x24BDF6950];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __75__UIColor_VSAdditions__vsa_dynamicColorWithLightStyleColor_darkStyleColor___block_invoke;
  v12[3] = &unk_24FE1B0F8;
  v13 = v6;
  v14 = v5;
  v8 = v5;
  v9 = v6;
  objc_msgSend(v7, "colorWithDynamicProvider:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)vsa_opacityADarkColor
{
  if (vsa_opacityADarkColor___once != -1)
    dispatch_once(&vsa_opacityADarkColor___once, &__block_literal_global_22);
  return (id)vsa_opacityADarkColor___color;
}

+ (id)vsa_opacityALightColor
{
  if (vsa_opacityALightColor___once != -1)
    dispatch_once(&vsa_opacityALightColor___once, &__block_literal_global_2);
  return (id)vsa_opacityALightColor___color;
}

+ (id)vsa_opacityADynamicColor
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "vsa_opacityALightColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "vsa_opacityADarkColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "vsa_dynamicColorWithLightStyleColor:darkStyleColor:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)vsa_opacityBDarkColor
{
  if (vsa_opacityBDarkColor___once != -1)
    dispatch_once(&vsa_opacityBDarkColor___once, &__block_literal_global_3);
  return (id)vsa_opacityBDarkColor___color;
}

+ (id)vsa_opacityBLightColor
{
  if (vsa_opacityBLightColor___once != -1)
    dispatch_once(&vsa_opacityBLightColor___once, &__block_literal_global_4);
  return (id)vsa_opacityBLightColor___color;
}

+ (id)vsa_opacityBDynamicColor
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "vsa_opacityBLightColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "vsa_opacityBDarkColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "vsa_dynamicColorWithLightStyleColor:darkStyleColor:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)vsa_opacityCDarkColor
{
  if (vsa_opacityCDarkColor___once != -1)
    dispatch_once(&vsa_opacityCDarkColor___once, &__block_literal_global_5);
  return (id)vsa_opacityCDarkColor___color;
}

+ (id)vsa_opacityCLightColor
{
  if (vsa_opacityCLightColor___once[0] != -1)
    dispatch_once(vsa_opacityCLightColor___once, &__block_literal_global_6_0);
  return (id)vsa_opacityCLightColor___color;
}

+ (id)vsa_opacityCDynamicColor
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "vsa_opacityCLightColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "vsa_opacityCDarkColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "vsa_dynamicColorWithLightStyleColor:darkStyleColor:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
