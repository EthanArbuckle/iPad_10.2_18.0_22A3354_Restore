@implementation SCRCColorUtilities

+ (id)descriptionForHueValueString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1488], "localizedCoreStringForKey:", CFSTR("invalid hue value"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("hue")))
  {
    objc_msgSend(v3, "substringFromIndex:", objc_msgSend(CFSTR("hue"), "length") + 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "doubleValue");
    v7 = v6;

    if (v7 >= 0.0 && v7 <= 1.0)
    {
      if (v7 >= 0.0280000009)
      {
        if (v7 < 0.0560000017)
        {
          v9 = (void *)MEMORY[0x24BDD1488];
          v10 = CFSTR("red orange");
          goto LABEL_39;
        }
        if (v7 < 0.111000001)
        {
          v9 = (void *)MEMORY[0x24BDD1488];
          v10 = CFSTR("orange");
          goto LABEL_39;
        }
        if (v7 < 0.128999993)
        {
          v9 = (void *)MEMORY[0x24BDD1488];
          v10 = CFSTR("yellow orange");
          goto LABEL_39;
        }
        if (v7 < 0.166999996)
        {
          v9 = (void *)MEMORY[0x24BDD1488];
          v10 = CFSTR("yellow");
          goto LABEL_39;
        }
        if (v7 < 0.222000003)
        {
          v9 = (void *)MEMORY[0x24BDD1488];
          v10 = CFSTR("yellow green");
          goto LABEL_39;
        }
        if (v7 < 0.388999999)
        {
          v9 = (void *)MEMORY[0x24BDD1488];
          v10 = CFSTR("green");
          goto LABEL_39;
        }
        if (v7 < 0.469000012)
        {
          v9 = (void *)MEMORY[0x24BDD1488];
          v10 = CFSTR("blue green");
          goto LABEL_39;
        }
        if (v7 < 0.540000021)
        {
          v9 = (void *)MEMORY[0x24BDD1488];
          v10 = CFSTR("cyan");
          goto LABEL_39;
        }
        if (v7 < 0.611000001)
        {
          v9 = (void *)MEMORY[0x24BDD1488];
          v10 = CFSTR("cyan blue");
          goto LABEL_39;
        }
        if (v7 < 0.666999996)
        {
          v9 = (void *)MEMORY[0x24BDD1488];
          v10 = CFSTR("blue");
          goto LABEL_39;
        }
        if (v7 < 0.800000012)
        {
          v9 = (void *)MEMORY[0x24BDD1488];
          v10 = CFSTR("purple");
          goto LABEL_39;
        }
        if (v7 < 0.888999999)
        {
          v9 = (void *)MEMORY[0x24BDD1488];
          v10 = CFSTR("magenta");
          goto LABEL_39;
        }
        if (v7 < 0.916999996)
        {
          v9 = (void *)MEMORY[0x24BDD1488];
          v10 = CFSTR("magenta pink");
          goto LABEL_39;
        }
        if (v7 < 0.958000004)
        {
          v9 = (void *)MEMORY[0x24BDD1488];
          v10 = CFSTR("pink");
          goto LABEL_39;
        }
        v9 = (void *)MEMORY[0x24BDD1488];
        if (v7 < 0.986000001)
        {
          v10 = CFSTR("pink red");
          goto LABEL_39;
        }
      }
      else
      {
        v9 = (void *)MEMORY[0x24BDD1488];
      }
      v10 = CFSTR("red");
LABEL_39:
      objc_msgSend(v9, "localizedCoreStringForKey:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "localizedCoreStringForKey:", CFSTR("hueDescriptionFormatString"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = &unk_211015000;
      LODWORD(v14) = llround(v7 * 360.0);
      objc_msgSend(v12, "stringWithFormat:", v13, v11, v14);
      v15 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v15;
    }
  }

  return v4;
}

+ (id)descriptionForSaturationValueString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v9;
  void *v10;
  uint64_t v11;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1488], "localizedCoreStringForKey:", CFSTR("invalid saturation value"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("saturation")))
  {
    objc_msgSend(v3, "substringFromIndex:", objc_msgSend(CFSTR("saturation"), "length") + 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "doubleValue");
    v7 = v6;

    if (v7 >= 0.0 && v7 <= 1.0)
    {
      v9 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "localizedCoreStringForKey:", CFSTR("saturationValueFormatString"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", v10, llround(v7 * 100.0) | 0x4059000000000000);
      v11 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v11;
    }
  }

  return v4;
}

+ (id)descriptionForBrightnessValueString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v9;
  void *v10;
  uint64_t v11;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1488], "localizedCoreStringForKey:", CFSTR("invalid brightness value"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("brightness")))
  {
    objc_msgSend(v3, "substringFromIndex:", objc_msgSend(CFSTR("brightness"), "length") + 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "doubleValue");
    v7 = v6;

    if (v7 >= 0.0 && v7 <= 1.0)
    {
      v9 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "localizedCoreStringForKey:", CFSTR("brightnessValueFormatString"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", v10, llround(v7 * 100.0) | 0x4059000000000000);
      v11 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v11;
    }
  }

  return v4;
}

+ (id)descriptionForAlphaValueString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v9;
  void *v10;
  uint64_t v11;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1488], "localizedCoreStringForKey:", CFSTR("invalid alpha value"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("alpha")))
  {
    objc_msgSend(v3, "substringFromIndex:", objc_msgSend(CFSTR("alpha"), "length") + 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "doubleValue");
    v7 = v6;

    if (v7 >= 0.0 && v7 <= 1.0)
    {
      v9 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "localizedCoreStringForKey:", CFSTR("alphaValueFormatString"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", v10, llround(v7 * 100.0) | 0x4059000000000000);
      v11 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v11;
    }
  }

  return v4;
}

@end
