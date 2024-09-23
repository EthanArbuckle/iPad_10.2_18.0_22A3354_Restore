@implementation SearchUIHeroBlurredButtonBackgroundView

- (SearchUIHeroBlurredButtonBackgroundView)init
{
  SearchUIHeroBlurredButtonBackgroundView *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)SearchUIHeroBlurredButtonBackgroundView;
  v2 = -[SearchUIHeroBlurredButtonBackgroundView init](&v10, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0DC3F50];
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.937254902, 0.24);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "effectCompositingColor:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v5;
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithBlurRadius:", 4.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v6;
    objc_msgSend(MEMORY[0x1E0DC3660], "colorEffectSaturate:", 1.2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIHeroBlurredButtonBackgroundView setBackgroundEffects:](v2, "setBackgroundEffects:", v8);

  }
  return v2;
}

@end
