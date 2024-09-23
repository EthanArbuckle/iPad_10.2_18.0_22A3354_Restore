@implementation _UIVibrancyEffectImpl

- (BOOL)_needsUpdateForTransitionFromEnvironment:(id)a3 toEnvironment:(id)a4 usage:(int64_t)a5
{
  id v6;
  char v7;

  v6 = a4;
  LOBYTE(a3) = objc_msgSend(a3, "reducedTransperancy");
  v7 = objc_msgSend(v6, "reducedTransperancy");

  return a3 ^ v7;
}

+ (id)implementationFromCoder:(id)a3
{
  id v5;
  _UIVibrancyEffectCoreMaterialImpl *v6;
  const __CFString *v7;
  _UIVibrancyEffectModernCompositedImpl *v8;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _UIVibrancyEffectModernVibrancyImpl *v15;
  _QWORD *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  _UIVibrancyEffectVibrantColorMatrixImpl *v30;
  uint64_t v31;
  _BYTE v32[80];
  _BYTE v33[80];
  _BYTE v34[80];
  _QWORD v35[2];
  _QWORD v36[3];

  v36[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "containsValueForKey:", CFSTR("UIVibrancyEffectBlurMaterialStyle")))
  {
    v6 = -[_UIVibrancyEffectCoreMaterialImpl initWithStyle:vibrancyStyle:]([_UIVibrancyEffectCoreMaterialImpl alloc], "initWithStyle:vibrancyStyle:", objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("UIVibrancyEffectBlurMaterialStyle")), objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("UIVibrancyEffectVibrancyStyle")));
LABEL_8:
    v8 = (_UIVibrancyEffectModernCompositedImpl *)v6;
    goto LABEL_9;
  }
  if (objc_msgSend(v5, "containsValueForKey:", CFSTR("UIVibrancyEffectBlurAutomaticStyle")))
  {
    v7 = CFSTR("UIVibrancyEffectBlurAutomaticStyle");
LABEL_7:
    v6 = -[_UIVibrancyEffectLegacyImpl initWithStyle:invertAutomaticStyle:]([_UIVibrancyEffectLegacyImpl alloc], "initWithStyle:invertAutomaticStyle:", objc_msgSend(v5, "decodeIntegerForKey:", v7), 0);
    goto LABEL_8;
  }
  if (objc_msgSend(v5, "containsValueForKey:", CFSTR("UIVibrancyEffectBlurStyle")))
  {
    v7 = CFSTR("UIVibrancyEffectBlurStyle");
    goto LABEL_7;
  }
  if (objc_msgSend(v5, "containsValueForKey:", CFSTR("UIVibrancyEffectFilterType")))
  {
    v10 = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("UIVibrancyEffectFilterType"));
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UIVibrancyEffectColor1"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UIVibrancyEffectColor2"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UIVibrancyEffectCompositingColor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("UIVibrancyEffectInputReversed"));
    v15 = [_UIVibrancyEffectModernVibrancyImpl alloc];
    v16 = (_QWORD *)MEMORY[0x1E0CD2F20];
    if (!v10)
      v16 = (_QWORD *)MEMORY[0x1E0CD2F18];
    v8 = -[_UIVibrancyEffectModernVibrancyImpl initWithFilter:inputColor1:inputColor2:compositingColor:inputReversed:](v15, "initWithFilter:inputColor1:inputColor2:compositingColor:inputReversed:", *v16, v11, v12, v13, v14);

LABEL_15:
    goto LABEL_9;
  }
  if (!objc_msgSend(v5, "containsValueForKey:", CFSTR("UIVibrancyCompositedType")))
  {
    if (!objc_msgSend(v5, "containsValueForKey:", CFSTR("UIVibrancyColorMatrixType")))
      goto LABEL_21;
    v19 = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("UIVibrancyColorMatrixType"));
    if (v19)
    {
      v6 = -[_UIVibrancyEffectVibrantColorMatrixImpl initWithSystemName:]([_UIVibrancyEffectVibrantColorMatrixImpl alloc], "initWithSystemName:", v19);
      goto LABEL_8;
    }
    v21 = (void *)MEMORY[0x1E0C99E60];
    v36[0] = objc_opt_class();
    v36[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setWithArray:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v23, CFSTR("UIVibrancyEffectColorMatrixLight"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = (void *)MEMORY[0x1E0C99E60];
    v35[0] = objc_opt_class();
    v35[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setWithArray:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v26, CFSTR("UIVibrancyEffectColorMatrixDark"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = 1.0;
    if (objc_msgSend(v5, "containsValueForKey:", CFSTR("UIVibrancyEffectColorMatrixAlpha")))
    {
      objc_msgSend(v5, "decodeDoubleForKey:", CFSTR("UIVibrancyEffectColorMatrixAlpha"));
      v28 = v29;
    }
    v30 = [_UIVibrancyEffectVibrantColorMatrixImpl alloc];
    if (v27)
    {
      _UIVisualEffectModelDecodeCAColorMatrix(v11, (uint64_t)v33);
      _UIVisualEffectModelDecodeCAColorMatrix(v27, (uint64_t)v32);
      v31 = -[_UIVibrancyEffectVibrantColorMatrixImpl initWithLightCAColorMatrix:darkCAColorMatrix:alpha:](v30, "initWithLightCAColorMatrix:darkCAColorMatrix:alpha:", v33, v32, v28);
    }
    else
    {
      _UIVisualEffectModelDecodeCAColorMatrix(v11, (uint64_t)v34);
      v31 = -[_UIVibrancyEffectVibrantColorMatrixImpl initWithCAColorMatrix:alpha:](v30, "initWithCAColorMatrix:alpha:", v34, v28);
    }
    v8 = (_UIVibrancyEffectModernCompositedImpl *)v31;

    goto LABEL_15;
  }
  v17 = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("UIVibrancyCompositedType"));
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UIVibrancyEffectCompositingColor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[_UIVibrancyEffectModernCompositedImpl initWithCompositingMode:compositingColor:]([_UIVibrancyEffectModernCompositedImpl alloc], "initWithCompositingMode:compositingColor:", v17, v18);

LABEL_9:
  if (!v8)
  {
LABEL_21:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIVibrancyEffect.m"), 498, CFSTR("Failed to decode vibrancy effect!"));

    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIVibrancyEffect.m"), 509, CFSTR("Subclass must implement"));

  return 0;
}

- (BOOL)isEqual:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIVibrancyEffect.m"), 515, CFSTR("Subclass must implement"));

  return 0;
}

- (int64_t)style
{
  return 0x8000000000000000;
}

- (int64_t)vibrancyStyle
{
  return 0;
}

- (BOOL)invertAutomaticStyle
{
  return 0;
}

@end
