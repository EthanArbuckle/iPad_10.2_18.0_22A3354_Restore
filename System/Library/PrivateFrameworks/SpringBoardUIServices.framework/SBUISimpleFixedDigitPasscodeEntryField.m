@implementation SBUISimpleFixedDigitPasscodeEntryField

- (SBUISimpleFixedDigitPasscodeEntryField)initWithDefaultSizeAndLightStyle:(BOOL)a3
{
  return -[SBUISimpleFixedDigitPasscodeEntryField initWithDefaultSizeAndLightStyle:numberOfDigits:](self, "initWithDefaultSizeAndLightStyle:numberOfDigits:", a3, 6);
}

- (SBUISimpleFixedDigitPasscodeEntryField)initWithDefaultSizeAndLightStyle:(BOOL)a3 numberOfDigits:(unint64_t)a4
{
  _BOOL8 v5;
  SBUISimpleFixedDigitPasscodeEntryField *v6;
  SBUISimpleFixedDigitPasscodeEntryField *v7;
  void *v8;
  double v9;
  NSMutableArray *v10;
  NSMutableArray *characterIndicators;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  uint64_t v21;
  UIView *springView;
  id v23;
  uint64_t v24;
  UIView *springViewParent;
  uint64_t v26;
  UIView *characterIndicatorsContainerView;
  UIView *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  SBSimplePasscodeEntryFieldButton *v38;
  SBSimplePasscodeEntryFieldButton *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  SBSimplePasscodeEntryFieldButton *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v58;
  objc_super v59;

  v5 = a3;
  v59.receiver = self;
  v59.super_class = (Class)SBUISimpleFixedDigitPasscodeEntryField;
  v6 = -[SBUINumericPasscodeEntryFieldBase initWithDefaultSizeAndLightStyle:](&v59, sel_initWithDefaultSizeAndLightStyle_);
  v7 = v6;
  if (v6)
  {
    -[SBUISimpleFixedDigitPasscodeEntryField setClipsToBounds:](v6, "setClipsToBounds:", 1);
    -[SBUINumericPasscodeEntryFieldBase setMaxNumbersAllowed:](v7, "setMaxNumbersAllowed:", a4);
    -[SBUIPasscodeEntryField _textField](v7, "_textField");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0.0;
    objc_msgSend(v8, "setFrame:", 0.0, 0.0, 0.0, 0.0);
    objc_msgSend(v8, "setHidden:", 1);
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    characterIndicators = v7->_characterIndicators;
    v7->_characterIndicators = v10;

    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    v14 = v13;

    -[SBUISimpleFixedDigitPasscodeEntryField _entryFieldBoundsWithXOffset:](v7, "_entryFieldBoundsWithXOffset:", 0.0);
    v16 = v15;
    v18 = v17 * (double)a4;
    v19 = SBUIFloatFloorForMainScreenScale((v14 - v18) * 0.5);
    v20 = objc_alloc(MEMORY[0x1E0CEABB0]);
    -[SBUISimpleFixedDigitPasscodeEntryField bounds](v7, "bounds");
    v21 = objc_msgSend(v20, "initWithFrame:");
    springView = v7->_springView;
    v7->_springView = (UIView *)v21;

    v23 = objc_alloc(MEMORY[0x1E0CEABB0]);
    -[SBUISimpleFixedDigitPasscodeEntryField bounds](v7, "bounds");
    v24 = objc_msgSend(v23, "initWithFrame:");
    springViewParent = v7->_springViewParent;
    v7->_springViewParent = (UIView *)v24;

    -[UIView setAutoresizingMask:](v7->_springView, "setAutoresizingMask:", 2);
    -[UIView setAutoresizingMask:](v7->_springViewParent, "setAutoresizingMask:", 2);
    -[SBUISimpleFixedDigitPasscodeEntryField addSubview:](v7, "addSubview:", v7->_springViewParent);
    -[UIView addSubview:](v7->_springViewParent, "addSubview:", v7->_springView);
    v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v19, 0.0, v18, v16);
    characterIndicatorsContainerView = v7->_characterIndicatorsContainerView;
    v7->_characterIndicatorsContainerView = (UIView *)v26;

    v28 = v7->_characterIndicatorsContainerView;
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v28, "setBackgroundColor:", v29);

    -[UIView setAutoresizingMask:](v7->_characterIndicatorsContainerView, "setAutoresizingMask:", 5);
    -[UIView addSubview:](v7->_springView, "addSubview:", v7->_characterIndicatorsContainerView);
    -[SBUISimpleFixedDigitPasscodeEntryField _entryFieldPaddingOutsideRing](v7, "_entryFieldPaddingOutsideRing");
    if (a4)
    {
      v34 = v30;
      v35 = v31;
      v36 = v32;
      v37 = v33;
      v38 = 0;
      do
      {
        v58 = v9;
        v39 = v38;
        -[SBUISimpleFixedDigitPasscodeEntryField _entryFieldBoundsWithXOffset:](v7, "_entryFieldBoundsWithXOffset:", v9);
        v40 = v37;
        v41 = v36;
        v42 = v35;
        v43 = v34;
        v45 = v44;
        v47 = v46;
        v49 = v48;
        v51 = v50;
        v52 = [SBSimplePasscodeEntryFieldButton alloc];
        v53 = v45;
        v34 = v43;
        v35 = v42;
        v36 = v41;
        v37 = v40;
        v38 = -[SBSimplePasscodeEntryFieldButton initWithFrame:paddingOutsideRing:useLightStyle:](v52, "initWithFrame:paddingOutsideRing:useLightStyle:", v5, v53, v47, v49, v51, v34, v35, v36, v40);

        -[NSMutableArray addObject:](v7->_characterIndicators, "addObject:", v38);
        -[UIView addSubview:](v7->_characterIndicatorsContainerView, "addSubview:", v38);
        -[SBSimplePasscodeEntryFieldButton size](v38, "size");
        v55 = v54;
        -[SBSimplePasscodeEntryFieldButton setFrame:](v38, "setFrame:", v58, 0.0, v54, v56);
        v9 = v58 + v55;
        --a4;
      }
      while (a4);

    }
  }
  return v7;
}

- (void)reset
{
  objc_super v3;

  -[NSMutableArray enumerateObjectsWithOptions:usingBlock:](self->_characterIndicators, "enumerateObjectsWithOptions:usingBlock:", 2, &__block_literal_global_3);
  v3.receiver = self;
  v3.super_class = (Class)SBUISimpleFixedDigitPasscodeEntryField;
  -[SBUIPasscodeEntryField reset](&v3, sel_reset);
}

uint64_t __47__SBUISimpleFixedDigitPasscodeEntryField_reset__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setRevealed:animated:delay:", 0, 0, 0.0);
}

- (void)_appendString:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  char v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  objc_super v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBUIPasscodeEntryField stringValue](self, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6 < -[SBUINumericPasscodeEntryFieldBase maxNumbersAllowed](self, "maxNumbersAllowed"))
  {
    -[UIView layer](self->_springView, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "animationKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsObject:", CFSTR("shake"));

    if ((v9 & 1) != 0)
    {
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v10 = self->_characterIndicators;
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v22;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v22 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
            if (objc_msgSend(v15, "isAnimatingUnreveal"))
            {
              objc_msgSend(v15, "setRevealed:animated:delay:", 1, 1, 0.0);
              objc_msgSend(v15, "setRevealed:animated:delay:", 0, 1, 0.0);
            }
          }
          v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        }
        while (v12);
      }

      -[UIView layer](self->_springView, "layer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "removeAnimationForKey:", CFSTR("shake"));

      -[UIView layer](self->_springViewParent, "layer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "removeAnimationForKey:", CFSTR("force-off-center"));

      v18 = v6 + 1;
      if (v6 == -1)
        goto LABEL_17;
    }
    else
    {
      v18 = v6 + 1;
    }
    if (v18 <= -[SBUINumericPasscodeEntryFieldBase maxNumbersAllowed](self, "maxNumbersAllowed"))
    {
      -[NSMutableArray objectAtIndex:](self->_characterIndicators, "objectAtIndex:", v6);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setRevealed:animated:", 1, 1);

    }
LABEL_17:
    v20.receiver = self;
    v20.super_class = (Class)SBUISimpleFixedDigitPasscodeEntryField;
    -[SBUINumericPasscodeEntryFieldBase _appendString:](&v20, sel__appendString_, v4);
  }

}

- (void)_deleteLastCharacter
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  objc_super v7;

  -[SBUIPasscodeEntryField stringValue](self, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    v5 = v4 - 1;
    if (v5 < -[NSMutableArray count](self->_characterIndicators, "count"))
    {
      -[NSMutableArray objectAtIndex:](self->_characterIndicators, "objectAtIndex:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setRevealed:animated:", 0, 1);

    }
  }
  v7.receiver = self;
  v7.super_class = (Class)SBUISimpleFixedDigitPasscodeEntryField;
  -[SBUINumericPasscodeEntryFieldBase _deleteLastCharacter](&v7, sel__deleteLastCharacter);
}

- (BOOL)_hasAnyCharacters
{
  void *v2;
  BOOL v3;

  -[SBUIPasscodeEntryField stringValue](self, "stringValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (void)_resetForFailedPasscode:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  objc_super v30;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("position.x"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMass:", 1.20000005);
  objc_msgSend(v5, "setStiffness:", 1200.0);
  objc_msgSend(v5, "setDamping:", 12.0);
  LODWORD(v6) = 1028389654;
  LODWORD(v7) = 990057071;
  LODWORD(v8) = 1059712716;
  LODWORD(v9) = 1.0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTimingFunction:", v10);

  objc_msgSend(v5, "setDuration:", 0.666999996);
  objc_msgSend(v5, "setVelocity:", 0.0);
  v11 = *MEMORY[0x1E0CD2B50];
  objc_msgSend(v5, "setFillMode:", *MEMORY[0x1E0CD2B50]);
  v12 = (void *)MEMORY[0x1E0CB37E8];
  -[UIView layer](self->_springView, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "position");
  v15 = v14 + 75.0;
  *(float *)&v15 = v15;
  objc_msgSend(v12, "numberWithFloat:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFromValue:", v16);

  -[UIView layer](self->_springView, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addAnimation:forKey:", v5, CFSTR("shake"));

  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("position.x"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v19) = 1054276898;
  LODWORD(v20) = 1058305108;
  LODWORD(v21) = 0;
  LODWORD(v22) = 1.0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v19, v21, v20, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTimingFunction:", v23);

  objc_msgSend(v18, "setDuration:", 0.100000001);
  objc_msgSend(v18, "setFillMode:", v11);
  v24 = (void *)MEMORY[0x1E0CB37E8];
  -[UIView layer](self->_springViewParent, "layer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "position");
  v27 = v26 + -75.0;
  *(float *)&v27 = v27;
  objc_msgSend(v24, "numberWithFloat:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFromValue:", v28);

  -[UIView layer](self->_springViewParent, "layer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addAnimation:forKey:", v18, CFSTR("force-off-center"));

  v30.receiver = self;
  v30.super_class = (Class)SBUISimpleFixedDigitPasscodeEntryField;
  -[SBUIPasscodeEntryField _resetForFailedPasscode:](&v30, sel__resetForFailedPasscode_, v3);

}

- (CGSize)_viewSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;

  -[SBUISimpleFixedDigitPasscodeEntryField _entryFieldBoundsWithXOffset:](self, "_entryFieldBoundsWithXOffset:", 0.0);
  v7 = v6;
  v8 = v5;
  result.height = v7;
  result.width = v8;
  return result;
}

- (void)_autofillForBiometricAuthenticationWithCompletion:(id)a3
{
  id v4;
  NSMutableArray *v5;
  int64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  dispatch_time_t v10;
  id v11;
  _QWORD v12[5];
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = self->_characterIndicators;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    v8 = 0.0;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "setRevealed:animated:delay:", 1, 1, v8);
        v8 = v8 + 0.0166666666;
        ++v9;
      }
      while (v6 != v9);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
    v6 = (uint64_t)(v8 * 1000000000.0);
  }

  v10 = dispatch_time(0, v6);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __92__SBUISimpleFixedDigitPasscodeEntryField__autofillForBiometricAuthenticationWithCompletion___block_invoke;
  v12[3] = &unk_1E4C3EC18;
  v12[4] = self;
  v13 = v4;
  v11 = v4;
  dispatch_after(v10, MEMORY[0x1E0C80D38], v12);

}

id __92__SBUISimpleFixedDigitPasscodeEntryField__autofillForBiometricAuthenticationWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(_QWORD *)(a1 + 40);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)SBUISimpleFixedDigitPasscodeEntryField;
  return objc_msgSendSuper2(&v3, sel__autofillForBiometricAuthenticationWithCompletion_, v1);
}

- (CGRect)_entryFieldBoundsWithXOffset:(double)a3
{
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double Height;
  _BOOL8 v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect v22;
  CGRect v23;
  CGRect result;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v22.origin.x = v6;
  v22.origin.y = v8;
  v22.size.width = v10;
  v22.size.height = v12;
  Height = CGRectGetHeight(v22);
  v23.origin.x = v6;
  v23.origin.y = v8;
  v23.size.width = v10;
  v23.size.height = v12;
  v14 = Height >= CGRectGetWidth(v23);
  objc_msgSend(MEMORY[0x1E0DA9E68], "pinFixedDigitEntryFieldIndicatorDiameter:", v14);
  v16 = v15;
  objc_msgSend(MEMORY[0x1E0DA9E68], "pinFixedDigitEntryFieldIndicatorPaddingWidth:", v14);
  v18 = v16 + v17 * 2.0;
  v19 = 0.0;
  v20 = a3;
  v21 = v16;
  result.size.height = v21;
  result.size.width = v18;
  result.origin.y = v19;
  result.origin.x = v20;
  return result;
}

- (UIEdgeInsets)_entryFieldPaddingOutsideRing
{
  void *v2;
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double Height;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect v17;
  CGRect v18;
  UIEdgeInsets result;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v17.origin.x = v4;
  v17.origin.y = v6;
  v17.size.width = v8;
  v17.size.height = v10;
  Height = CGRectGetHeight(v17);
  v18.origin.x = v4;
  v18.origin.y = v6;
  v18.size.width = v8;
  v18.size.height = v10;
  objc_msgSend(MEMORY[0x1E0DA9E68], "pinFixedDigitEntryFieldIndicatorPaddingWidth:", Height >= CGRectGetWidth(v18));
  v13 = v12;
  v14 = 0.0;
  v15 = 0.0;
  v16 = v13;
  result.right = v16;
  result.bottom = v15;
  result.left = v13;
  result.top = v14;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_springViewParent, 0);
  objc_storeStrong((id *)&self->_springView, 0);
  objc_storeStrong((id *)&self->_characterIndicators, 0);
  objc_storeStrong((id *)&self->_characterIndicatorsContainerView, 0);
}

@end
