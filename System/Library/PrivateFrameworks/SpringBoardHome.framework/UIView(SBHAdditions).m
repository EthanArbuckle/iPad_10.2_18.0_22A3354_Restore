@implementation UIView(SBHAdditions)

- (void)scaleAndBlurForDuration:()SBHAdditions initiallyHidden:visibleAlpha:completion:
{
  id v10;
  uint64_t v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[6];
  char v20;
  _QWORD v21[5];

  v10 = a6;
  v11 = MEMORY[0x1E0C809B0];
  if (a5)
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __88__UIView_SBHAdditions__scaleAndBlurForDuration_initiallyHidden_visibleAlpha_completion___block_invoke;
    v21[3] = &unk_1E8D84C50;
    v21[4] = a1;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v21);
    v12 = 10.0;
    v13 = 0.0;
  }
  else
  {
    v12 = 0.0;
    v13 = 10.0;
  }
  objc_msgSend(a1, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "blurAnimationFor:duration:startRadius:endRadius:", v14, a2, v12, v13);

  v15 = (void *)MEMORY[0x1E0DC3F10];
  v18 = v10;
  v19[0] = v11;
  v19[1] = 3221225472;
  v19[2] = __88__UIView_SBHAdditions__scaleAndBlurForDuration_initiallyHidden_visibleAlpha_completion___block_invoke_2;
  v19[3] = &unk_1E8D87520;
  v20 = a5;
  *(double *)&v19[5] = a3;
  v19[4] = a1;
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __88__UIView_SBHAdditions__scaleAndBlurForDuration_initiallyHidden_visibleAlpha_completion___block_invoke_3;
  v17[3] = &unk_1E8D86600;
  v16 = v10;
  objc_msgSend(v15, "animateWithDuration:animations:completion:", v19, v17, a2);

}

- (void)blurAnimationFor:()SBHAdditions duration:startRadius:endRadius:
{
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v9 = (void *)MEMORY[0x1E0CB37E8];
  v10 = a6;
  objc_msgSend(v9, "numberWithDouble:", a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C88]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setValue:forKey:", CFSTR("low"), *MEMORY[0x1E0CD2D60]);
  objc_msgSend(v13, "setValue:forKey:", CFSTR("low"), *MEMORY[0x1E0CD2D88]);
  objc_msgSend(v13, "setValue:forKey:", v12, *MEMORY[0x1E0CD2D90]);
  v17[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFilters:", v14);

  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  v15 = objc_msgSend(MEMORY[0x1E0CD28B0], "disableActions");
  objc_msgSend(MEMORY[0x1E0CD2710], "animation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setKeyPath:", CFSTR("filters.gaussianBlur.inputRadius"));
  objc_msgSend(v16, "setFromValue:", v11);
  objc_msgSend(v16, "setToValue:", v12);
  objc_msgSend(v16, "setDuration:", a1);
  objc_msgSend(v16, "setFillMode:", *MEMORY[0x1E0CD2B60]);
  objc_msgSend(v10, "addAnimation:forKey:", v16, CFSTR("blurAnimation"));

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", v15);

}

@end
