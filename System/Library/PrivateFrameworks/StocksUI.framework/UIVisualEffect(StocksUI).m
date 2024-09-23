@implementation UIVisualEffect(StocksUI)

+ (id)su_visualEffectsForBarWithBackgroundColor:()StocksUI
{
  void *v0;
  void *v1;
  void *v2;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3F50], "effectCompositingColor:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  objc_msgSend(MEMORY[0x1E0DC3510], "effectWithBlurRadius:", 20.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
