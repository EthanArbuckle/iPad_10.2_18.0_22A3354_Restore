@implementation SBTraitsInputsAllUnknownOrientationValidator

- (id)validateInputs:(id)a3 withContext:(id)a4
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SBTraitsInputsAllUnknownOrientationValidator;
  -[SBTraitsInputsValidator validateInputs:withContext:](&v14, sel_validateInputs_withContext_, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceOrientationInputs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "currentDeviceOrientation") && !objc_msgSend(v5, "nonFlatDeviceOrientation"))
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC08A8]), "initWithCurrentDeviceOrientation:nonFlatDeviceOrientation:", 1, 1);

    v5 = (void *)v6;
  }
  v7 = objc_alloc(MEMORY[0x1E0DC08B0]);
  objc_msgSend(v4, "interfaceIdiomInputs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInterfaceStyleInputs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyboardInputs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ambientPresentationInputs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v7, "initWithInterfaceIdiomInputs:userInterfaceStyleInputs:deviceOrientationInputs:keyboardInputs:ambientPresentationInputs:", v8, v9, v5, v10, v11);

  return v12;
}

@end
