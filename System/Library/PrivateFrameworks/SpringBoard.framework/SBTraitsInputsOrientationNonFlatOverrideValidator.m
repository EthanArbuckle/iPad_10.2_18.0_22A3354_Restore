@implementation SBTraitsInputsOrientationNonFlatOverrideValidator

- (id)validateInputs:(id)a3 withContext:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SBTraitsInputsOrientationNonFlatOverrideValidator;
  -[SBTraitsInputsValidator validateInputs:withContext:](&v16, sel_validateInputs_withContext_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deviceOrientationInputs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "currentDeviceOrientation");
  if ((unint64_t)(v7 - 1) >= 4 && self->_lastNonFlatOrientationOverride)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC08A8]), "initWithCurrentDeviceOrientation:nonFlatDeviceOrientation:", v7, self->_lastNonFlatOrientationOverride);

    v6 = (void *)v8;
  }
  v9 = objc_alloc(MEMORY[0x1E0DC08B0]);
  objc_msgSend(v5, "interfaceIdiomInputs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userInterfaceStyleInputs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyboardInputs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ambientPresentationInputs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v9, "initWithInterfaceIdiomInputs:userInterfaceStyleInputs:deviceOrientationInputs:keyboardInputs:ambientPresentationInputs:", v10, v11, v6, v12, v13);

  return v14;
}

- (void)setLastNonFlatOrientationOverride:(int64_t)a3
{
  void *v6;

  if ((unint64_t)(a3 - 5) <= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBTraitsInputsValidators.m"), 147, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("lastNonFlatOrientationOverride != BSDeviceOrientationFaceUp && lastNonFlatOrientationOverride != BSDeviceOrientationFaceDown"));

  }
  if (self->_lastNonFlatOrientationOverride != a3)
    self->_lastNonFlatOrientationOverride = a3;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v2 = (void *)MEMORY[0x1E0CB37A0];
  v7.receiver = self;
  v7.super_class = (Class)SBTraitsInputsOrientationNonFlatOverrideValidator;
  -[SBTraitsInputsValidator description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  SBFStringForBSDeviceOrientation();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(", last non-flat orientation override: %@"), v5);

  return v4;
}

@end
