@implementation UIColor(Dynamic)

+ (uint64_t)dynamicColorWithLightColor:()Dynamic darkColor:
{
  return objc_msgSend(MEMORY[0x24BDF6950], "dynamicColorWithLightColor:darkColor:lightHighContrastColor:darkHighContrastColor:", a3, a4, a3, a4);
}

+ (uint64_t)dynamicColorWithLightColor:()Dynamic darkColor:lightHighContrastColor:
{
  return objc_msgSend(MEMORY[0x24BDF6950], "dynamicColorWithLightColor:darkColor:lightHighContrastColor:darkHighContrastColor:", a3, a4, a5, a4);
}

+ (uint64_t)dynamicColorWithLightColor:()Dynamic darkColor:darkHighContrastColor:
{
  return objc_msgSend(MEMORY[0x24BDF6950], "dynamicColorWithLightColor:darkColor:lightHighContrastColor:darkHighContrastColor:", a3, a4, a3, a5);
}

+ (id)dynamicColorWithLightColor:()Dynamic darkColor:lightHighContrastColor:darkHighContrastColor:
{
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v29[5];
  _QWORD v30[5];
  _QWORD v31[2];
  _QWORD v32[3];

  v32[2] = *MEMORY[0x24BDAC8D0];
  v9 = (void *)MEMORY[0x24BDF6F30];
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v9, "traitCollectionWithUserInterfaceStyle:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v14;
  objc_msgSend(MEMORY[0x24BDF6F30], "_traitCollectionWithContrast:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "traitCollectionWithTraitsFromCollections:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x24BDF6F30];
  objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithUserInterfaceStyle:", 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v19;
  objc_msgSend(MEMORY[0x24BDF6F30], "_traitCollectionWithContrast:", 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "traitCollectionWithTraitsFromCollections:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithUserInterfaceStyle:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v23;
  v30[0] = v13;
  objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithUserInterfaceStyle:", 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v24;
  v30[1] = v13;
  objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithUserInterfaceStyle:", 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v25;
  v29[3] = v17;
  v30[2] = v12;
  v30[3] = v11;
  v29[4] = v22;
  v30[4] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, v29, 5);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6950], "_dynamicColorWithColorsByTraitCollection:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

@end
