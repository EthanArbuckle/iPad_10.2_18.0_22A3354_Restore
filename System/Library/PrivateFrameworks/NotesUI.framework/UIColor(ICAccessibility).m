@implementation UIColor(ICAccessibility)

- (double)icaxHue
{
  double v2;

  v2 = 0.0;
  objc_msgSend(a1, "getHue:saturation:brightness:alpha:", &v2, 0, 0, 0);
  return v2;
}

- (double)icaxSaturation
{
  double v2;

  v2 = 0.0;
  objc_msgSend(a1, "getHue:saturation:brightness:alpha:", 0, &v2, 0, 0);
  return v2;
}

- (double)icaxLuma
{
  double result;
  double v2;
  double v3;
  double v4;
  double v5;

  v5 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  v2 = 0.0;
  objc_msgSend(a1, "getRed:green:blue:alpha:", &v5, &v4, &v3, &v2);
  result = fmax(v2 * (v4 * 0.715200007 + v5 * 0.212599993 + v3 * 0.0722000003), 0.0);
  if (result > 1.0)
    return 1.0;
  return result;
}

- (id)icaxApproximateColorDescription
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  double v9;
  uint64_t v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;

  objc_msgSend(a1, "_icaxCachedApproximateColorDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v15 = 0.0;
    v16 = 0.0;
    objc_msgSend(a1, "icaxLuma", 0, 0);
    v4 = v3;
    objc_msgSend(a1, "getHue:saturation:brightness:alpha:", &v16, &v15, &v14, &v13);
    if (v4 <= 0.99000001)
    {
      if (v4 >= 0.00999999978)
      {
        if (v15 >= 0.0500000007)
        {
          v9 = v16;
          if (v16 <= 0.0560000017 || v16 >= 0.111000001 || (v9 = 0.430000007, v4 >= 0.430000007))
          {
            objc_msgSend(a1, "icaxHueName", v9);
            v10 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("brown"), CFSTR("brown"), 0, 1);
            v10 = objc_claimAutoreleasedReturnValue();
          }
          v7 = (void *)v10;
          objc_msgSend(a1, "icaxSaturationModifier");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "icaxLightnessModifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "_icaxColorDescriptionForHue:saturation:lightness:", v7, v8, v11);
          v2 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("gray"), CFSTR("gray"), 0, 1, v15);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "icaxLightnessModifier");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "_icaxColorDescriptionForHue:saturation:lightness:", v7, 0, v8);
          v2 = (void *)objc_claimAutoreleasedReturnValue();
        }

        goto LABEL_16;
      }
      v5 = (void *)MEMORY[0x1E0D64218];
      v6 = CFSTR("black");
    }
    else
    {
      v5 = (void *)MEMORY[0x1E0D64218];
      v6 = CFSTR("white");
    }
    objc_msgSend(v5, "localizedFrameworkStringForKey:value:table:allowSiri:", v6, v6, 0, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:
    objc_msgSend(a1, "_icaxSetCachedApproximateColorDescription:", v2);
  }
  return v2;
}

- (uint64_t)icaxHueName
{
  void *v2;

  v2 = (void *)objc_opt_class();
  objc_msgSend(a1, "icaxHue");
  return objc_msgSend(v2, "icaxHueNameForValue:");
}

- (__CFString)icaxLightnessModifier
{
  double v1;
  void *v2;
  const __CFString *v3;
  __CFString *v4;

  objc_msgSend(a1, "icaxLuma");
  if (v1 >= 0.349999994)
  {
    if (v1 <= 0.850000024)
    {
      v4 = &stru_1E5C2F8C0;
      return v4;
    }
    v2 = (void *)MEMORY[0x1E0D64218];
    v3 = CFSTR("light");
  }
  else
  {
    v2 = (void *)MEMORY[0x1E0D64218];
    v3 = CFSTR("dark");
  }
  objc_msgSend(v2, "localizedFrameworkStringForKey:value:table:allowSiri:", v3, v3, 0, 1);
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  return v4;
}

- (__CFString)icaxSaturationModifier
{
  double v2;
  void *v3;
  const __CFString *v4;
  double v5;
  __CFString *v6;

  objc_msgSend(a1, "icaxSaturation");
  if (v2 >= 0.200000003)
  {
    if (v2 <= 0.899999976 || (objc_msgSend(a1, "icaxLuma"), v5 <= 0.699999988))
    {
      v6 = &stru_1E5C2F8C0;
      return v6;
    }
    v3 = (void *)MEMORY[0x1E0D64218];
    v4 = CFSTR("vibrant");
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0D64218];
    v4 = CFSTR("grayish");
  }
  objc_msgSend(v3, "localizedFrameworkStringForKey:value:table:allowSiri:", v4, v4, 0, 1);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  return v6;
}

+ (id)icaxHueNameForValue:()ICAccessibility
{
  uint64_t v1;
  uint64_t v2;
  void *v4;
  void *v5;
  const __CFString *v6;

  if (a1 >= 0.0 && a1 <= 1.0)
  {
    if (a1 >= 0.0280000009)
    {
      if (a1 < 0.0560000017)
      {
        v5 = (void *)MEMORY[0x1E0D64218];
        v6 = CFSTR("red orange");
        goto LABEL_41;
      }
      if (a1 < 0.111000001)
      {
        v5 = (void *)MEMORY[0x1E0D64218];
        v6 = CFSTR("orange");
        goto LABEL_41;
      }
      if (a1 < 0.128999993)
      {
        v5 = (void *)MEMORY[0x1E0D64218];
        v6 = CFSTR("yellow orange");
        goto LABEL_41;
      }
      if (a1 < 0.166999996)
      {
        v5 = (void *)MEMORY[0x1E0D64218];
        v6 = CFSTR("yellow");
        goto LABEL_41;
      }
      if (a1 < 0.222000003)
      {
        v5 = (void *)MEMORY[0x1E0D64218];
        v6 = CFSTR("yellow green");
        goto LABEL_41;
      }
      if (a1 < 0.388999999)
      {
        v5 = (void *)MEMORY[0x1E0D64218];
        v6 = CFSTR("green");
        goto LABEL_41;
      }
      if (a1 < 0.469000012)
      {
        v5 = (void *)MEMORY[0x1E0D64218];
        v6 = CFSTR("blue green");
        goto LABEL_41;
      }
      if (a1 < 0.540000021)
      {
        v5 = (void *)MEMORY[0x1E0D64218];
        v6 = CFSTR("cyan");
        goto LABEL_41;
      }
      if (a1 < 0.611000001)
      {
        v5 = (void *)MEMORY[0x1E0D64218];
        v6 = CFSTR("cyan blue");
        goto LABEL_41;
      }
      if (a1 < 0.666999996)
      {
        v5 = (void *)MEMORY[0x1E0D64218];
        v6 = CFSTR("blue");
        goto LABEL_41;
      }
      if (a1 < 0.800000012)
      {
        v5 = (void *)MEMORY[0x1E0D64218];
        v6 = CFSTR("purple");
        goto LABEL_41;
      }
      if (a1 < 0.888999999)
      {
        v5 = (void *)MEMORY[0x1E0D64218];
        v6 = CFSTR("magenta");
        goto LABEL_41;
      }
      if (a1 < 0.916999996)
      {
        v5 = (void *)MEMORY[0x1E0D64218];
        v6 = CFSTR("magenta pink");
        goto LABEL_41;
      }
      if (a1 < 0.958000004)
      {
        v5 = (void *)MEMORY[0x1E0D64218];
        v6 = CFSTR("pink");
        goto LABEL_41;
      }
      v5 = (void *)MEMORY[0x1E0D64218];
      if (a1 < 0.986000001)
      {
        v6 = CFSTR("pink red");
        goto LABEL_41;
      }
    }
    else
    {
      v5 = (void *)MEMORY[0x1E0D64218];
    }
    v6 = CFSTR("red");
LABEL_41:
    objc_msgSend(v5, "localizedFrameworkStringForKey:value:table:allowSiri:", v6, v6, 0, 1, v1, v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    return v4;
  }
  v4 = 0;
  return v4;
}

- (id)icaxDescriptionWithLuma
{
  double v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "icaxLuma");
  v3 = vcvtad_u64_f64(v2 * 100.0);
  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "icaxApproximateColorDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ICAccessibilityLocalizedUnsignedInteger(v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringWithFormat:", CFSTR("%@ %@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_icaxColorDescriptionForHue:()ICAccessibility saturation:lightness:
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v16;
  id v17;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_msgSend(v9, "length");
  v11 = objc_msgSend(v8, "length");
  if (v10)
  {
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("ax.color.format.lightness.saturation.hue"), CFSTR("%1$@ %2$@ %3$@"), 0, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x1E0CB3940];
      v16 = v8;
      v17 = v7;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("ax.color.format.lightness.hue"), CFSTR("%1$@ %2$@"), 0, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x1E0CB3940];
      v16 = v7;
    }
    objc_msgSend(v13, "localizedStringWithFormat:", v12, v9, v16, v17);
  }
  else
  {
    if (!v11)
    {
      v14 = v7;
      goto LABEL_9;
    }
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("ax.color.format.saturation.hue"), CFSTR("%1$@ %2$@"), 0, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v12, v8, v7, v17);
  }
  v14 = (id)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v14;
}

@end
