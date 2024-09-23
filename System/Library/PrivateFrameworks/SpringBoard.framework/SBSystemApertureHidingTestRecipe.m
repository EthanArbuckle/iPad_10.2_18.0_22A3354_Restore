@implementation SBSystemApertureHidingTestRecipe

- (SBSystemApertureHidingTestRecipe)init
{
  SBSystemApertureHidingTestRecipe *v2;
  SBSystemApertureHidingTestRecipe *v3;
  NSArray *alphaValues;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBSystemApertureHidingTestRecipe;
  v2 = -[SBSystemApertureHidingTestRecipe init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    alphaValues = v2->_alphaValues;
    v2->_alphaValues = (NSArray *)&unk_1E91CEFB0;

    v3->_currentAlphaIndex = -[NSArray count](v3->_alphaValues, "count") - 1;
  }
  return v3;
}

- (id)title
{
  return CFSTR("Jindo Hiding");
}

- (void)_applyAlpha
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  objc_msgSend((id)SBApp, "systemApertureControllerForMainDisplay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:", CFSTR("_systemApertureViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0CEABB0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__SBSystemApertureHidingTestRecipe__applyAlpha__block_invoke;
  v7[3] = &unk_1E8E9E820;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "animateWithDuration:animations:", v7, 0.2);

}

void __47__SBSystemApertureHidingTestRecipe__applyAlpha__block_invoke(uint64_t a1)
{
  void *v2;
  float v3;
  double v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectAtIndexedSubscript:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");
  v4 = v3;

  objc_msgSend(*(id *)(a1 + 40), "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", v4);

}

- (void)handleVolumeIncrease
{
  unint64_t v3;
  int64_t currentAlphaIndex;

  v3 = -[NSArray count](self->_alphaValues, "count") - 1;
  currentAlphaIndex = self->_currentAlphaIndex;
  if (v3 >= currentAlphaIndex + 1)
    v3 = currentAlphaIndex + 1;
  self->_currentAlphaIndex = v3;
  -[SBSystemApertureHidingTestRecipe _applyAlpha](self, "_applyAlpha");
}

- (void)handleVolumeDecrease
{
  int64_t currentAlphaIndex;

  currentAlphaIndex = self->_currentAlphaIndex;
  if (currentAlphaIndex <= 1)
    currentAlphaIndex = 1;
  self->_currentAlphaIndex = currentAlphaIndex - 1;
  -[SBSystemApertureHidingTestRecipe _applyAlpha](self, "_applyAlpha");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alphaValues, 0);
}

@end
