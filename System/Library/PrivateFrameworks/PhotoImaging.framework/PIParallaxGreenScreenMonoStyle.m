@implementation PIParallaxGreenScreenMonoStyle

- (id)kind
{
  return (id)*MEMORY[0x1E0D755F8];
}

- (id)recipeIdentifier
{
  return CFSTR("GreenScreenGradientMono");
}

+ (id)styleWithColorAnalysis:(id)a3
{
  id v4;
  PIParallaxColorSuggester *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;

  v4 = a3;
  v5 = -[PIParallaxColorSuggester initWithColorAnalysis:]([PIParallaxColorSuggester alloc], "initWithColorAnalysis:", v4);
  objc_msgSend(v4, "backgroundColors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[PIParallaxColorPalette greenScreenVibrantPalette](PIParallaxColorPalette, "greenScreenVibrantPalette");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIParallaxColorSuggester suggestedColorsForColors:fromColorPalette:](v5, "suggestedColorsForColors:fromColorPalette:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  PFMap();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "primaryColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0D75170], "whiteColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithColor:clockColor:colorSuggestions:", v11, v13, v9);

  return v14;
}

id __57__PIParallaxGreenScreenMonoStyle_styleWithColorAnalysis___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0D751C8];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithPrimaryColor:secondaryColor:", v3, 0);

  return v4;
}

@end
