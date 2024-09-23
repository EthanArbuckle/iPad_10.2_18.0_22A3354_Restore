@implementation SBUISystemApertureLabel

- (void)setText:(id)a3
{
  NSString *pendingText;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBUISystemApertureLabel;
  -[SBUISystemApertureLabel setText:](&v5, sel_setText_, a3);
  pendingText = self->_pendingText;
  self->_pendingText = 0;

}

- (void)setTextColor:(id)a3
{
  UIColor *pendingTextColor;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBUISystemApertureLabel;
  -[SBUISystemApertureLabel setTextColor:](&v5, sel_setTextColor_, a3);
  pendingTextColor = self->_pendingTextColor;
  self->_pendingTextColor = 0;

}

- (void)performTextSwapAnimationWithText:(id)a3 textColor:(id)a4 fittingSize:(CGSize)a5 sizeWillChangeBlock:(id)a6 didSetPropertiesBlock:(id)a7
{
  double height;
  double width;
  id v14;
  id v15;
  void (**v16)(_QWORD);
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  dispatch_time_t v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  _QWORD block[5];
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD v43[3];

  height = a5.height;
  width = a5.width;
  v43[1] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v29 = a4;
  v15 = a7;
  v16 = (void (**)(_QWORD))a6;
  -[SBUISystemApertureLabel layer](self, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C88]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setName:", CFSTR("gaussianBlur"));
  objc_msgSend(v18, "setValue:forKey:", &unk_1E4C7AD70, *MEMORY[0x1E0CD2D90]);
  v43[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFilters:", v19);

  -[SBUISystemApertureLabel _animateLayer:andSetValueForKeyPath:fromValue:toValue:](self, "_animateLayer:andSetValueForKeyPath:fromValue:toValue:", v17, CFSTR("filters.gaussianBlur.inputRadius"), &unk_1E4C7AD70, &unk_1E4C7AD80);
  -[SBUISystemApertureLabel _animateLayer:andSetValueForKeyPath:fromValue:toValue:](self, "_animateLayer:andSetValueForKeyPath:fromValue:toValue:", v17, CFSTR("opacity"), &unk_1E4C7AD90, &unk_1E4C7ADA0);
  -[SBUISystemApertureLabel _animateLayer:andSetValueForKeyPath:fromValue:toValue:](self, "_animateLayer:andSetValueForKeyPath:fromValue:toValue:", v17, CFSTR("transform.scale.xy"), &unk_1E4C7AD90, &unk_1E4C7ADA0);
  -[SBUISystemApertureLabel _sizeOfLabelWithNewText:fittingSize:](self, "_sizeOfLabelWithNewText:fittingSize:", v14, width, height);
  v21 = v20;
  v23 = v22;
  v16[2](v16);

  objc_storeStrong((id *)&self->_pendingText, a3);
  objc_storeStrong((id *)&self->_pendingTextColor, a4);
  v24 = dispatch_time(0, 200000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __124__SBUISystemApertureLabel_performTextSwapAnimationWithText_textColor_fittingSize_sizeWillChangeBlock_didSetPropertiesBlock___block_invoke;
  block[3] = &unk_1E4C40120;
  block[4] = self;
  v31 = v14;
  v41 = v21;
  v42 = v23;
  v39 = &unk_1E4C7AD90;
  v40 = v15;
  v32 = v29;
  v33 = v17;
  v34 = &unk_1E4C7AD80;
  v35 = &unk_1E4C7AD70;
  v36 = &unk_1E4C7ADA0;
  v37 = &unk_1E4C7AD90;
  v38 = &unk_1E4C7ADA0;
  v25 = v17;
  v26 = v15;
  v27 = v29;
  v28 = v14;
  dispatch_after(v24, MEMORY[0x1E0C80D38], block);

}

uint64_t __124__SBUISystemApertureLabel_performTextSwapAnimationWithText_textColor_fittingSize_sizeWillChangeBlock_didSetPropertiesBlock___block_invoke(uint64_t a1)
{
  void *v2;

  if (BSEqualStrings())
  {
    objc_msgSend(*(id *)(a1 + 32), "setText:", *(_QWORD *)(a1 + 40));
    v2 = *(void **)(a1 + 32);
    BSRectWithSize();
    objc_msgSend(v2, "setBounds:");
  }
  if (BSEqualObjects())
    objc_msgSend(*(id *)(a1 + 32), "setTextColor:", *(_QWORD *)(a1 + 48));
  (*(void (**)(void))(*(_QWORD *)(a1 + 112) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "_animateLayer:andSetValueForKeyPath:fromValue:toValue:", *(_QWORD *)(a1 + 56), CFSTR("filters.gaussianBlur.inputRadius"), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  objc_msgSend(*(id *)(a1 + 32), "_animateLayer:andSetValueForKeyPath:fromValue:toValue:", *(_QWORD *)(a1 + 56), CFSTR("opacity"), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88));
  return objc_msgSend(*(id *)(a1 + 32), "_animateLayer:andSetValueForKeyPath:fromValue:toValue:", *(_QWORD *)(a1 + 56), CFSTR("transform.scale.xy"), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104));
}

- (void)_animateLayer:(id)a3 andSetValueForKeyPath:(id)a4 fromValue:(id)a5 toValue:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;

  v10 = a6;
  v11 = a4;
  v12 = a3;
  -[SBUISystemApertureLabel _springAnimationForKeyPath:fromValue:toValue:](self, "_springAnimationForKeyPath:fromValue:toValue:", v11, a5, v10);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addAnimation:forKey:", v13, v11);
  objc_msgSend(v12, "setValue:forKeyPath:", v10, v11);

}

- (id)_springAnimationForKeyPath:(id)a3 fromValue:(id)a4 toValue:(id)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;

  v7 = (void *)MEMORY[0x1E0CD2848];
  v8 = a5;
  v9 = a4;
  objc_msgSend(v7, "animationWithKeyPath:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBeginTime:", CACurrentMediaTime());
  objc_msgSend(v10, "setFillMode:", *MEMORY[0x1E0CD2B50]);
  objc_msgSend(v10, "setFromValue:", v9);

  objc_msgSend(v10, "setToValue:", v8);
  objc_msgSend(v10, "setMass:", 2.0);
  objc_msgSend(v10, "setStiffness:", 300.0);
  objc_msgSend(v10, "setDamping:", 30.0);
  objc_msgSend(v10, "setDuration:", 0.5);
  return v10;
}

- (CGSize)_sizeOfLabelWithNewText:(id)a3 fittingSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  -[SBUISystemApertureLabel sizeThatFits:](self, "sizeThatFits:", width, height);
  v8 = objc_alloc_init(MEMORY[0x1E0CEA700]);
  -[SBUISystemApertureLabel font](self, "font");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", v9);

  -[SBUISystemApertureLabel text](self, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v10);

  objc_msgSend(v8, "setNumberOfLines:", -[SBUISystemApertureLabel numberOfLines](self, "numberOfLines"));
  objc_msgSend(v8, "sizeThatFits:", width, height);
  objc_msgSend(v8, "setText:", v7);

  objc_msgSend(v8, "sizeThatFits:", width, height);
  v12 = v11;
  v14 = v13;

  v15 = v12;
  v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingTextColor, 0);
  objc_storeStrong((id *)&self->_pendingText, 0);
}

@end
