@implementation BSUIVibrancyConfiguration(PUIStylePrivate)

+ (uint64_t)pui_vibrancyEffectTypeFromColor:()PUIStylePrivate
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  if ((objc_msgSend(v3, "isVibrantMaterialColor") & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isVibrantMonochromeColor") & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isLUTBackedColor") & 1) != 0)
  {
    v4 = 3;
  }
  else
  {
    objc_msgSend(v3, "color");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  return v4;
}

+ (id)pui_vibrancyLUTFromColor:()PUIStylePrivate extensionBundleURL:
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "isLUTBackedColor"))
  {
    v7 = objc_alloc(MEMORY[0x24BE0BF58]);
    objc_msgSend(v5, "lutIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithIdentifier:bundleURL:", v8, v6);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)pui_vibrancyLUTFromColor:()PUIStylePrivate extensionBundleURL:luminanceReduced:
{
  id v7;
  id v8;
  int v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;

  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v7, "isLUTBackedColor");
  v10 = 0;
  if (v8 && v9)
  {
    v11 = objc_alloc(MEMORY[0x24BE0BF58]);
    objc_msgSend(v7, "lutIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithIdentifier:bundleURL:", v12, v8);

    v10 = (void *)objc_msgSend(v13, "copyWithLuminanceReduced:", a5);
  }

  return v10;
}

+ (id)pui_vibrancyLUTFromPrivateStyle:()PUIStylePrivate extensionBundleURL:luminanceReduced:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "lutIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 0;
  if (v8 && v9)
  {
    v11 = objc_alloc(MEMORY[0x24BE0BF58]);
    objc_msgSend(v7, "lutIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithIdentifier:bundleURL:", v12, v8);

    v10 = (void *)objc_msgSend(v13, "copyWithLuminanceReduced:", a5);
  }

  return v10;
}

@end
