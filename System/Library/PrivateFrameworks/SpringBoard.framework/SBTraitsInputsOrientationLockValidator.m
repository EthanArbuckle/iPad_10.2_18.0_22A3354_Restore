@implementation SBTraitsInputsOrientationLockValidator

- (id)validateInputs:(id)a3 withContext:(id)a4
{
  void *v5;
  void *lastForwardedOrientationInputs;
  uint64_t v7;
  TRAArbitrationDeviceOrientationInputs *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SBTraitsInputsOrientationLockValidator;
  -[SBTraitsInputsValidator validateInputs:withContext:](&v16, sel_validateInputs_withContext_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deviceOrientationInputs");
  lastForwardedOrientationInputs = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_lockOrientation
    && (v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC08A8]), "initWithCurrentDeviceOrientation:nonFlatDeviceOrientation:", self->_lockOrientation, self->_lockOrientation), lastForwardedOrientationInputs, lastForwardedOrientationInputs = (void *)v7, self->_lockOrientation)|| !self->_prefersDeferringOrientationUpdates)
  {
    v8 = lastForwardedOrientationInputs;
    lastForwardedOrientationInputs = self->_lastForwardedOrientationInputs;
    self->_lastForwardedOrientationInputs = v8;
  }
  else
  {
    v8 = self->_lastForwardedOrientationInputs;
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
  v14 = (void *)objc_msgSend(v9, "initWithInterfaceIdiomInputs:userInterfaceStyleInputs:deviceOrientationInputs:keyboardInputs:ambientPresentationInputs:", v10, v11, v8, v12, v13);

  return v14;
}

- (void)setPrefersDeferringOrientationUpdates:(BOOL)a3
{
  if (self->_prefersDeferringOrientationUpdates != a3)
    self->_prefersDeferringOrientationUpdates = a3;
}

- (SBTraitsInputsOrientationLockValidator)initWithValidatorOrder:(id)a3
{
  SBTraitsInputsOrientationLockValidator *v3;
  uint64_t v4;
  TRAArbitrationDeviceOrientationInputs *lastForwardedOrientationInputs;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBTraitsInputsOrientationLockValidator;
  v3 = -[SBTraitsInputsValidator initWithValidatorOrder:](&v7, sel_initWithValidatorOrder_, a3);
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC08A8]), "initWithCurrentDeviceOrientation:nonFlatDeviceOrientation:", 0, 0);
    lastForwardedOrientationInputs = v3->_lastForwardedOrientationInputs;
    v3->_lastForwardedOrientationInputs = (TRAArbitrationDeviceOrientationInputs *)v4;

  }
  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v10.receiver = self;
  v10.super_class = (Class)SBTraitsInputsOrientationLockValidator;
  -[SBTraitsInputsValidator description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  SBFStringForBSDeviceOrientation();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (self->_prefersDeferringOrientationUpdates)
    v8 = CFSTR("yes");
  else
    v8 = CFSTR("no");
  objc_msgSend(v5, "appendFormat:", CFSTR(", lock orientation: %@, defersUpdates: %@, lastForwardedInputs: %@"), v6, v8, self->_lastForwardedOrientationInputs);

  return v5;
}

- (void)setLockOrientation:(int64_t)a3
{
  if (self->_lockOrientation != a3)
    self->_lockOrientation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastForwardedOrientationInputs, 0);
}

@end
