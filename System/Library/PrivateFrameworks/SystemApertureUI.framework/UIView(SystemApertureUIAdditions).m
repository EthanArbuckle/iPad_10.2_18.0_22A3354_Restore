@implementation UIView(SystemApertureUIAdditions)

+ (id)_sauiBlurKeyPath
{
  if (_sauiBlurKeyPath_onceToken != -1)
    dispatch_once(&_sauiBlurKeyPath_onceToken, &__block_literal_global);
  return (id)_sauiBlurKeyPath___sauiBlurKeyPath;
}

+ (id)_sauiBlurInputRadiusKeyPath
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__UIView_SystemApertureUIAdditions___sauiBlurInputRadiusKeyPath__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_sauiBlurInputRadiusKeyPath_onceToken != -1)
    dispatch_once(&_sauiBlurInputRadiusKeyPath_onceToken, block);
  return (id)_sauiBlurInputRadiusKeyPath___sauiBlurInputRadiusKeyPath;
}

- (void)_configureBlurFilterIfNecessary
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  if ((objc_msgSend(a1, "isSauiBlurConfigured") & 1) == 0)
  {
    objc_msgSend(a1, "layer");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v2 = objc_alloc(MEMORY[0x24BDE56B0]);
    v3 = (void *)objc_msgSend(v2, "initWithType:", *MEMORY[0x24BDE5A78]);
    objc_msgSend(v9, "filters");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "mutableCopy");
    v6 = v5;
    if (v5)
      v7 = v5;
    else
      v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v8 = v7;

    objc_msgSend(v8, "addObject:", v3);
    objc_msgSend(v9, "setFilters:", v8);

  }
}

- (double)sauiBlurRadius
{
  double v2;
  void *v3;
  void *v4;
  void *v5;
  float v6;

  v2 = 0.0;
  if (objc_msgSend(a1, "isSauiBlurConfigured"))
  {
    objc_msgSend(a1, "layer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_sauiBlurInputRadiusKeyPath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "valueForKeyPath:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "floatValue");
    v2 = v6;

  }
  return v2;
}

- (void)setSauiBlurRadius:()SystemApertureUIAdditions
{
  void *v4;
  void *v5;
  id v6;

  if (a2 > 0.0)
    objc_msgSend(a1, "_configureBlurFilterIfNecessary");
  if (objc_msgSend(a1, "isSauiBlurConfigured"))
  {
    objc_msgSend(a1, "layer");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_sauiBlurInputRadiusKeyPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forKeyPath:", v4, v5);

  }
}

- (BOOL)isSauiBlurConfigured
{
  void *v1;
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a1, "layer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_sauiBlurKeyPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "valueForKeyPath:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

@end
