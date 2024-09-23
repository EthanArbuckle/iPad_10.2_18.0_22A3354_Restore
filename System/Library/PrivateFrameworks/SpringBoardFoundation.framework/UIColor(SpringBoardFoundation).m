@implementation UIColor(SpringBoardFoundation)

+ (id)sbf_siriIntelligenceLightColors
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "sbf_siriIntelligenceLightBlueColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  objc_msgSend(a1, "sbf_siriIntelligenceLightPurpleColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v3;
  objc_msgSend(a1, "sbf_siriIntelligenceLightRedColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v4;
  objc_msgSend(a1, "sbf_siriIntelligenceLightOrangeColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (uint64_t)sbf_siriIntelligenceLightBlueColor
{
  return objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.0, 0.392156863, 0.666666667, 1.0);
}

+ (uint64_t)sbf_siriIntelligenceLightPurpleColor
{
  return objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.488888889, 0.261437908, 0.666666667, 1.0);
}

+ (uint64_t)sbf_siriIntelligenceLightOrangeColor
{
  return objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.666666667, 0.117647059, 0.222222222, 1.0);
}

+ (uint64_t)sbf_siriIntelligenceLightRedColor
{
  return objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.666666667, 0.384313725, 0.0, 1.0);
}

@end
