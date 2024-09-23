@implementation UIColor

- (id)bc_darkenedColorByFactor:(double)a3
{
  UIColor *v4;
  uint64_t v5;
  UIColor *v6;
  uint64_t v8;
  double v9;
  double v10;
  double v11;

  v4 = self;
  if (sub_F540(v4))
  {
    v10 = 0.0;
    v11 = 0.0;
    if (-[UIColor getWhite:alpha:](v4, "getWhite:alpha:", &v11, &v10))
    {
      v11 = (1.0 - a3) * v11;
      v5 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:"));
LABEL_6:
      v6 = (UIColor *)v5;

      v4 = v6;
    }
  }
  else
  {
    v10 = 0.0;
    v11 = 0.0;
    v8 = 0;
    v9 = 0.0;
    if (-[UIColor getHue:saturation:brightness:alpha:](v4, "getHue:saturation:brightness:alpha:", &v11, &v10, &v9, &v8))
    {
      v9 = (1.0 - a3) * v9;
      v10 = v10 + (1.0 - v10) * a3;
      v5 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithHue:saturation:brightness:alpha:](UIColor, "colorWithHue:saturation:brightness:alpha:", v11));
      goto LABEL_6;
    }
  }
  return v4;
}

- (id)bc_resaturatedColorByFactor:(double)a3
{
  UIColor *v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;

  v4 = self;
  if ((sub_F540(v4) & 1) == 0)
  {
    v9 = 0.0;
    v10 = 0.0;
    v7 = 0;
    v8 = 0;
    if (-[UIColor getHue:saturation:brightness:alpha:](v4, "getHue:saturation:brightness:alpha:", &v10, &v9, &v8, &v7))
    {
      v9 = v9 * a3;
      v5 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithHue:saturation:brightness:alpha:](UIColor, "colorWithHue:saturation:brightness:alpha:", v10));

      v4 = (UIColor *)v5;
    }
  }
  return v4;
}

+ (id)bc_colorWithSRGBDescription:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  float v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("a")));
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "floatValue");
      v9 = v8;
    }
    else
    {
      v9 = 1.0;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("w")));
    v12 = v11;
    if (v11)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "colorWithWhite:alpha:", (double)(int)objc_msgSend(v11, "intValue") / 255.0, v9));
    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("r")));
      v14 = v13;
      v15 = 0.0;
      v16 = 0.0;
      if (v13)
        v16 = (double)(int)objc_msgSend(v13, "intValue") / 255.0;
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("g")));
      v18 = v17;
      if (v17)
        v15 = (double)(int)objc_msgSend(v17, "intValue") / 255.0;
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("b")));
      v20 = v19;
      if (v19)
        v21 = (double)(int)objc_msgSend(v19, "intValue") / 255.0;
      else
        v21 = 0.0;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "colorWithRed:green:blue:alpha:", v16, v15, v21, v9));

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)bc_welcomeButtonColor
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlackColor](UIColor, "systemBlackColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tertiarySystemBackgroundColor](UIColor, "tertiarySystemBackgroundColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_dynamicColorWithLightColor:darkColor:](UIColor, "bc_dynamicColorWithLightColor:darkColor:", v2, v3));

  return v4;
}

+ (id)bc_colorWithARGBHexValue:(unint64_t)a3
{
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", (float)((float)BYTE2(a3) / 255.0), (float)((float)BYTE1(a3) / 255.0), (float)((float)a3 / 255.0), (float)((float)BYTE3(a3) / 255.0));
}

- (unint64_t)bc_ARGBHexValue
{
  unint64_t result;
  CGColor *v3;
  size_t NumberOfComponents;
  const CGFloat *Components;
  double v6;
  float64x2_t v7;
  uint64_t v8;
  float v9;
  int32x2_t v10;
  float v11;

  result = -[UIColor CGColor](objc_retainAutorelease(self), "CGColor");
  if (result)
  {
    v3 = (CGColor *)result;
    NumberOfComponents = CGColorGetNumberOfComponents((CGColorRef)result);
    Components = CGColorGetComponents(v3);
    if (NumberOfComponents == 4)
    {
      v7 = *(float64x2_t *)Components;
      v6 = Components[2];
      v8 = 3;
    }
    else
    {
      if (NumberOfComponents != 2)
      {
        v7 = 0uLL;
        v9 = 0.0;
        v6 = 0.0;
        goto LABEL_8;
      }
      v6 = *Components;
      v7 = (float64x2_t)vdupq_lane_s64(*(_QWORD *)Components, 0);
      v8 = 1;
    }
    v9 = Components[v8] * 255.0;
LABEL_8:
    v10 = (int32x2_t)vshl_u32((uint32x2_t)vcvt_s32_f32(vrnda_f32(vcvt_f32_f64(vmulq_f64(v7, (float64x2_t)vdupq_n_s64(0x406FE00000000000uLL))))), (uint32x2_t)0x800000010);
    v11 = v6 * 255.0;
    return (int)(vorr_s8((int8x8_t)vdup_lane_s32(v10, 1), (int8x8_t)v10).u32[0] | llroundf(v11) | (llroundf(v9) << 24));
  }
  return result;
}

+ (id)bc_darkerTexturedBackgroundColor
{
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.219607843, 0.231372549, 0.258823529, 1.0);
}

- (NSString)bc_hexValue
{
  CGColor *v2;
  uint64_t *Components;
  __int128 v4;
  uint64_t v5;
  float v6;
  uint64_t v8;
  uint64_t v9;
  _OWORD v10[2];

  v2 = -[UIColor CGColor](objc_retainAutorelease(self), "CGColor");
  Components = (uint64_t *)CGColorGetComponents(v2);
  if (CGColorGetNumberOfComponents(v2) <= 2)
  {
    v4 = *(_OWORD *)Components;
    v10[0] = vdupq_lane_s64(*Components, 0);
    v10[1] = v4;
    Components = (uint64_t *)v10;
  }
  v5 = 0;
  v8 = 0;
  v9 = 0;
  do
  {
    v6 = *(double *)&Components[v5] * 255.0;
    *((_DWORD *)&v8 + v5++) = (uint64_t)rintf(v6);
  }
  while (v5 != 3);
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%02X%02X%02X"), 255.0, v8, HIDWORD(v8), v9);
}

- (NSString)bc_rgbaString
{
  CGColor *v2;
  CGColor *v3;
  size_t NumberOfComponents;
  const CGFloat *Components;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  uint64_t v10;

  v2 = -[UIColor CGColor](objc_retainAutorelease(self), "CGColor");
  if (v2)
  {
    v3 = v2;
    NumberOfComponents = CGColorGetNumberOfComponents(v2);
    Components = CGColorGetComponents(v3);
    if (NumberOfComponents == 4)
    {
      v6 = *Components;
      v7 = Components[1];
      v10 = 3;
      v8 = Components[2];
    }
    else
    {
      v6 = 0.0;
      v7 = 0.0;
      v8 = 0.0;
      v9 = 0.0;
      if (NumberOfComponents != 2)
      {
LABEL_7:
        v2 = (CGColor *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("rgba(%.6g%%,%.6g%%,%.6g%%,%.6g)"), v6 * 100.0, v7 * 100.0, v8 * 100.0, *(_QWORD *)&v9));
        return (NSString *)v2;
      }
      v6 = *Components;
      v10 = 1;
      v7 = *Components;
      v8 = *Components;
    }
    v9 = Components[v10];
    goto LABEL_7;
  }
  return (NSString *)v2;
}

- (NSString)bc_rgbaHexValue
{
  double v3;
  double v4;
  double v5;
  double v6;

  v5 = 0.0;
  v6 = 0.0;
  v4 = 0.0;
  v3 = 0.0;
  -[UIColor getRed:green:blue:alpha:](self, "getRed:green:blue:alpha:", &v6, &v5, &v4, &v3);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%02X%02X%02X%02X"), (int)(v6 * 255.0), (int)(v5 * 255.0), (int)(v4 * 255.0), (int)(v3 * 255.0)));
}

- (double)bc_brightness
{
  CGColorSpace *DeviceGray;
  CGContext *v4;
  unint64_t v5;
  char data;
  CGRect v8;

  data = 0;
  DeviceGray = CGColorSpaceCreateDeviceGray();
  v4 = CGBitmapContextCreate(&data, 1uLL, 1uLL, 8uLL, 1uLL, DeviceGray, 0);
  CGColorSpaceRelease(DeviceGray);
  if (v4)
  {
    CGContextSetFillColorWithColor(v4, -[UIColor CGColor](objc_retainAutorelease(self), "CGColor"));
    v8.origin.x = 0.0;
    v8.origin.y = 0.0;
    v8.size.width = 1.0;
    v8.size.height = 1.0;
    CGContextFillRect(v4, v8);
    CGContextRelease(v4);
  }
  else
  {
    NSLog(CFSTR("NULL context while testing color brightness"));
  }
  LOBYTE(v5) = data;
  return (double)v5 / 255.0;
}

+ (id)bc_dynamicColorWithLightColor:(id)a3 darkColor:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];
  _QWORD v14[3];

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithUserInterfaceStyle:](UITraitCollection, "traitCollectionWithUserInterfaceStyle:", 0));
  v13[0] = v7;
  v14[0] = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithUserInterfaceStyle:](UITraitCollection, "traitCollectionWithUserInterfaceStyle:", 1));
  v13[1] = v8;
  v14[1] = v6;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithUserInterfaceStyle:](UITraitCollection, "traitCollectionWithUserInterfaceStyle:", 2));
  v13[2] = v9;
  v14[2] = v5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 3));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _dynamicColorWithColorsByTraitCollection:](UIColor, "_dynamicColorWithColorsByTraitCollection:", v10));

  return v11;
}

+ (id)bc_booksBackground
{
  return +[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor");
}

+ (id)bc_booksSecondaryBackground
{
  return +[UIColor secondarySystemBackgroundColor](UIColor, "secondarySystemBackgroundColor");
}

+ (id)bc_booksTertiaryBackground
{
  return +[UIColor tertiarySystemBackgroundColor](UIColor, "tertiarySystemBackgroundColor");
}

+ (id)bc_booksGroupedBackground
{
  return +[UIColor systemGroupedBackgroundColor](UIColor, "systemGroupedBackgroundColor");
}

+ (id)bc_booksSecondaryGroupedBackground
{
  return +[UIColor secondarySystemGroupedBackgroundColor](UIColor, "secondarySystemGroupedBackgroundColor");
}

+ (id)bc_booksWidgetBackgroundOverlayTop
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.12));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_dynamicColorWithLightColor:darkColor:](UIColor, "bc_dynamicColorWithLightColor:darkColor:", v2, v3));

  return v4;
}

+ (id)bc_booksWidgetBackgroundOverlayBottom
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.06));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_dynamicColorWithLightColor:darkColor:](UIColor, "bc_dynamicColorWithLightColor:darkColor:", v2, v3));

  return v4;
}

+ (id)bc_booksBrickBackground
{
  return +[UIColor tertiarySystemBackgroundColor](UIColor, "tertiarySystemBackgroundColor");
}

+ (id)bc_booksKeyColor
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 1.0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 1.0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_dynamicColorWithLightColor:darkColor:](UIColor, "bc_dynamicColorWithLightColor:darkColor:", v2, v3));

  return v4;
}

+ (id)bc_booksLabelColor
{
  return +[UIColor labelColor](UIColor, "labelColor");
}

+ (id)bc_booksSecondaryLabelColor
{
  return +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
}

+ (id)bc_booksOpaqueSecondaryLabelColor
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.525490196, 0.525490196, 0.549019608, 1.0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.596078431, 0.596078431, 0.623529412, 1.0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_dynamicColorWithLightColor:darkColor:](UIColor, "bc_dynamicColorWithLightColor:darkColor:", v2, v3));

  return v4;
}

+ (id)bc_booksTertiaryLabelColor
{
  return +[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor");
}

+ (id)bc_booksQuaternaryLabelColor
{
  return +[UIColor quaternaryLabelColor](UIColor, "quaternaryLabelColor");
}

+ (id)bc_booksRed
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.784313725, 0.235294118, 0.235294118, 1.0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.580392157, 0.203921569, 0.203921569, 1.0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_dynamicColorWithLightColor:darkColor:](UIColor, "bc_dynamicColorWithLightColor:darkColor:", v2, v3));

  return v4;
}

+ (id)bc_booksOrange
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 1.0, 0.584313725, 0.0, 1.0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.701960784, 0.364705882, 0.0705882353, 1.0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_dynamicColorWithLightColor:darkColor:](UIColor, "bc_dynamicColorWithLightColor:darkColor:", v2, v3));

  return v4;
}

+ (id)bc_booksGreen
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.211764706, 0.580392157, 0.384313725, 1.0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.156862745, 0.388235294, 0.274509804, 1.0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_dynamicColorWithLightColor:darkColor:](UIColor, "bc_dynamicColorWithLightColor:darkColor:", v2, v3));

  return v4;
}

+ (id)bc_booksCyan
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.0, 0.615686275, 0.862745098, 1.0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.180392157, 0.48627451, 0.721568627, 1.0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_dynamicColorWithLightColor:darkColor:](UIColor, "bc_dynamicColorWithLightColor:darkColor:", v2, v3));

  return v4;
}

+ (id)bc_booksBlue
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.0274509804, 0.278431373, 0.556862745, 1.0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.11372549, 0.274509804, 0.458823529, 1.0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_dynamicColorWithLightColor:darkColor:](UIColor, "bc_dynamicColorWithLightColor:darkColor:", v2, v3));

  return v4;
}

+ (id)bc_booksPurple
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.329411765, 0.329411765, 0.580392157, 1.0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.247058824, 0.247058824, 0.431372549, 1.0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_dynamicColorWithLightColor:darkColor:](UIColor, "bc_dynamicColorWithLightColor:darkColor:", v2, v3));

  return v4;
}

+ (id)bc_booksMagenta
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.937254902, 0.152941176, 0.298039216, 1.0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.788235294, 0.235294118, 0.301960784, 1.0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_dynamicColorWithLightColor:darkColor:](UIColor, "bc_dynamicColorWithLightColor:darkColor:", v2, v3));

  return v4;
}

+ (id)bc_booksGray
{
  return +[UIColor systemGrayColor](UIColor, "systemGrayColor");
}

+ (id)bc_booksBlack
{
  return +[UIColor systemBlackColor](UIColor, "systemBlackColor");
}

+ (id)bc_booksWhite
{
  return +[UIColor systemWhiteColor](UIColor, "systemWhiteColor");
}

+ (id)bc_booksNestedIconGlyphColor
{
  return +[UIColor systemWhiteColor](UIColor, "systemWhiteColor");
}

+ (id)bc_booksChevronColor
{
  return +[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor");
}

+ (id)bc_booksIconBackgroundColor
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 1.0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.921568627, 0.921568627, 0.960784314, 0.6));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_dynamicColorWithLightColor:darkColor:](UIColor, "bc_dynamicColorWithLightColor:darkColor:", v2, v3));

  return v4;
}

+ (id)bc_booksSecondaryIconBackgroundColor
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 1.0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.921568627, 0.921568627, 0.960784314, 0.22));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_dynamicColorWithLightColor:darkColor:](UIColor, "bc_dynamicColorWithLightColor:darkColor:", v2, v3));

  return v4;
}

+ (id)bc_booksSeparatorColor
{
  return +[UIColor separatorColor](UIColor, "separatorColor");
}

+ (id)bc_booksAXSeparatorColor
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.235294118, 0.235294118, 0.262745098, 0.45));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.921568627, 0.921568627, 0.960784314, 0.35));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_dynamicColorWithLightColor:darkColor:](UIColor, "bc_dynamicColorWithLightColor:darkColor:", v2, v3));

  return v4;
}

+ (id)bc_booksTableSelectionColor
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.0156862745, 0.0156862745, 0.0588235294, 0.15));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.921568627, 0.921568627, 0.960784314, 0.12));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_dynamicColorWithLightColor:darkColor:](UIColor, "bc_dynamicColorWithLightColor:darkColor:", v2, v3));

  return v4;
}

+ (id)bc_booksTransportControlsColor
{
  return objc_msgSend(objc_alloc((Class)UIColor), "initWithDynamicProvider:", &stru_291F10);
}

+ (id)bc_nowPlayingVibrantPrimary
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "colorWithAlphaComponent:", 0.94));

  return v3;
}

+ (id)bc_nowPlayingVibrantSecondary
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "colorWithAlphaComponent:", 0.45));

  return v3;
}

+ (id)bc_nowPlayingVibrantTertiary
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "colorWithAlphaComponent:", 0.18));

  return v3;
}

+ (id)bc_nowPlayingVibrantQuaternary
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "colorWithAlphaComponent:", 0.08));

  return v3;
}

+ (id)_colorForUserInterfaceStyle:(int64_t)a3 fromColor:(id)a4 forTraitCollection:(id)a5
{
  UITraitCollection *v7;
  UITraitCollection *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v17[5];

  v7 = (UITraitCollection *)a5;
  if (v7)
  {
    v8 = v7;
    v9 = a4;
  }
  else
  {
    v10 = a4;
    v8 = objc_opt_new(UITraitCollection);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection _currentTraitCollection](UITraitCollection, "_currentTraitCollection"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_133A28;
  v17[3] = &unk_28D938;
  v17[4] = a3;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UITraitCollection traitCollectionByModifyingTraits:](v8, "traitCollectionByModifyingTraits:", v17));
  +[UITraitCollection _setCurrentTraitCollection:](UITraitCollection, "_setCurrentTraitCollection:", v12);
  v13 = objc_retainAutorelease(a4);
  v14 = objc_msgSend(v13, "CGColor");

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", v14));
  +[UITraitCollection _setCurrentTraitCollection:](UITraitCollection, "_setCurrentTraitCollection:", v11);

  return v15;
}

+ (id)bc_darkSystemBackgroundForTraitCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_opt_class(a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_colorForUserInterfaceStyle:fromColor:forTraitCollection:", 2, v6, v4));

  return v7;
}

- (UIColor)bc_invertedDynamicColor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  _QWORD v15[3];
  _QWORD v16[3];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithUserInterfaceStyle:](UITraitCollection, "traitCollectionWithUserInterfaceStyle:", 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithUserInterfaceStyle:](UITraitCollection, "traitCollectionWithUserInterfaceStyle:", 2));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIColor resolvedColorWithTraitCollection:](self, "resolvedColorWithTraitCollection:", v3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIColor resolvedColorWithTraitCollection:](self, "resolvedColorWithTraitCollection:", v4));
  if (objc_msgSend(v5, "isEqual:", v6))
    BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/Utilities/UIColor+BCAdditions.m", 479, (uint64_t)"-[UIColor(IMAdditions) bc_invertedDynamicColor]", (uint64_t)"![lightColor isEqual:darkColor]", CFSTR("Expected a dynamic color for invert to work!"), v7, v8, v9, v14);
  if ((objc_msgSend(v5, "isEqual:", v6) & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithUserInterfaceStyle:](UITraitCollection, "traitCollectionWithUserInterfaceStyle:", 0));
    v15[0] = v11;
    v15[1] = v3;
    v16[0] = v6;
    v16[1] = v6;
    v15[2] = v4;
    v16[2] = v5;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v15, 3));

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _dynamicColorWithColorsByTraitCollection:](UIColor, "_dynamicColorWithColorsByTraitCollection:", v12));
  }

  return (UIColor *)v10;
}

- (id)bkaxAdjustedForIncreaseContrast
{
  void *v3;
  UIColor *v4;
  id v5;
  char *v6;
  char **v7;
  id v8;

  v3 = (void *)objc_opt_self(UITraitCollection);
  v4 = self;
  v5 = objc_msgSend(v3, "currentTraitCollection");
  v6 = (char *)objc_msgSend(v5, "userInterfaceStyle");

  v7 = &selRef_bkaxAdjustedLighterForIncreaseContrast;
  if (v6 != (_BYTE *)&dword_0 + 2)
    v7 = &selRef_bkaxAdjustedDarkerForIncreaseContrast;
  v8 = objc_msgSend(v4, *v7);

  return v8;
}

- (id)bkaxAdjustedLighterForIncreaseContrast
{
  return -[UIColor bkaxAdjustedForIncreaseContrastAdjustingDarker:](self, "bkaxAdjustedForIncreaseContrastAdjustingDarker:", 0);
}

- (id)bkaxAdjustedDarkerForIncreaseContrast
{
  return -[UIColor bkaxAdjustedForIncreaseContrastAdjustingDarker:](self, "bkaxAdjustedForIncreaseContrastAdjustingDarker:", 1);
}

- (id)bkaxAdjustedForIncreaseContrastAdjustingDarker:(BOOL)a3
{
  UIColor *v4;
  Class isa;

  v4 = self;
  isa = UIColor.bkaxAdjustedForIncreaseContrast(darker:)(a3).super.isa;

  return isa;
}

- (double)defaultBrightnessAdjustment
{
  return 0.2;
}

@end
