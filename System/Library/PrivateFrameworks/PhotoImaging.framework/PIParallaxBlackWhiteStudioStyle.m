@implementation PIParallaxBlackWhiteStudioStyle

- (id)kind
{
  return (id)*MEMORY[0x1E0D755B8];
}

- (id)recipeIdentifier
{
  if (-[PIParallaxStudioStyle tonality](self, "tonality") == 3)
    return CFSTR("BlackWhiteHighKey");
  else
    return CFSTR("BlackWhiteStage");
}

- (BOOL)configureForCategory:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D756A8]);
}

- (id)defaultDominantColorWithAnalysis:(id)a3
{
  double v4;
  double v5;
  int64_t v6;
  double v7;
  double v8;
  double v9;

  objc_msgSend(a3, "luminance");
  v5 = v4;
  v6 = -[PIParallaxStudioStyle tonality](self, "tonality");
  v7 = fmax(v5, 0.8);
  v8 = fmin(v5, 0.4);
  if (v6 == 3)
    v9 = v7;
  else
    v9 = v8;
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D75170]), "initWithRed:green:blue:", v9, v9, v9);
}

+ (id)styleWithColorAnalysis:(id)a3
{
  double v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;

  objc_msgSend(a3, "backgroundLuminance");
  if (v4 < 0.35)
  {
    objc_msgSend(MEMORY[0x1E0D75170], "whiteColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D75170], "blackColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 3;
  }
  v7 = objc_alloc((Class)a1);
  v8 = (void *)objc_msgSend(v7, "initWithClockColor:colorSuggestions:", v5, MEMORY[0x1E0C9AA60]);
  objc_msgSend(v8, "setTonality:", v6);

  return v8;
}

@end
