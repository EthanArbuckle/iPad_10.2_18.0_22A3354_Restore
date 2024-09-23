@implementation TRAArbitrationInputs

- (TRAArbitrationDeviceOrientationInputs)deviceOrientationInputs
{
  return self->_deviceOrientationInputs;
}

- (TRAArbitrationUserInterfaceStyleInputs)userInterfaceStyleInputs
{
  return self->_userInterfaceStyleInputs;
}

- (TRAArbitrationInputs)initWithInterfaceIdiomInputs:(id)a3 userInterfaceStyleInputs:(id)a4 deviceOrientationInputs:(id)a5 keyboardInputs:(id)a6 ambientPresentationInputs:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  TRAArbitrationInputs *v18;
  uint64_t v19;
  TRAArbitrationInterfaceIdiomInputs *interfaceIdiomInputs;
  uint64_t v21;
  TRAArbitrationUserInterfaceStyleInputs *userInterfaceStyleInputs;
  uint64_t v23;
  TRAArbitrationDeviceOrientationInputs *deviceOrientationInputs;
  uint64_t v25;
  TRAArbitrationKeyboardInputs *keyboardInputs;
  uint64_t v27;
  TRAArbitrationAmbientPresentationInputs *ambientPresentationInputs;
  void *v30;
  void *v31;
  void *v32;
  objc_super v33;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (v13)
  {
    if (v14)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRAArbitration.m"), 393, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("userInterfaceStyleInputs"));

    if (v15)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRAArbitration.m"), 392, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("interfaceIdiomInputs"));

  if (!v14)
    goto LABEL_8;
LABEL_3:
  if (v15)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRAArbitration.m"), 394, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("deviceOrientationInputs"));

LABEL_4:
  v33.receiver = self;
  v33.super_class = (Class)TRAArbitrationInputs;
  v18 = -[TRAArbitrationInputs init](&v33, sel_init);
  if (v18)
  {
    v19 = objc_msgSend(v13, "copy");
    interfaceIdiomInputs = v18->_interfaceIdiomInputs;
    v18->_interfaceIdiomInputs = (TRAArbitrationInterfaceIdiomInputs *)v19;

    v21 = objc_msgSend(v14, "copy");
    userInterfaceStyleInputs = v18->_userInterfaceStyleInputs;
    v18->_userInterfaceStyleInputs = (TRAArbitrationUserInterfaceStyleInputs *)v21;

    v23 = objc_msgSend(v15, "copy");
    deviceOrientationInputs = v18->_deviceOrientationInputs;
    v18->_deviceOrientationInputs = (TRAArbitrationDeviceOrientationInputs *)v23;

    v25 = objc_msgSend(v16, "copy");
    keyboardInputs = v18->_keyboardInputs;
    v18->_keyboardInputs = (TRAArbitrationKeyboardInputs *)v25;

    v27 = objc_msgSend(v17, "copy");
    ambientPresentationInputs = v18->_ambientPresentationInputs;
    v18->_ambientPresentationInputs = (TRAArbitrationAmbientPresentationInputs *)v27;

  }
  return v18;
}

- (TRAArbitrationInterfaceIdiomInputs)interfaceIdiomInputs
{
  return self->_interfaceIdiomInputs;
}

- (TRAArbitrationAmbientPresentationInputs)ambientPresentationInputs
{
  return self->_ambientPresentationInputs;
}

- (TRAArbitrationKeyboardInputs)keyboardInputs
{
  return self->_keyboardInputs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ambientPresentationInputs, 0);
  objc_storeStrong((id *)&self->_keyboardInputs, 0);
  objc_storeStrong((id *)&self->_deviceOrientationInputs, 0);
  objc_storeStrong((id *)&self->_userInterfaceStyleInputs, 0);
  objc_storeStrong((id *)&self->_interfaceIdiomInputs, 0);
}

- (TRAArbitrationInputs)initWithInterfaceIdiomInputs:(id)a3 deviceOrientationInputs:(id)a4 keyboardInputs:(id)a5 ambientPresentationInputs:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  TRAArbitrationUserInterfaceStyleInputs *v14;
  TRAArbitrationInputs *v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = -[TRAArbitrationUserInterfaceStyleInputs initWithUserInterfaceStyle:]([TRAArbitrationUserInterfaceStyleInputs alloc], "initWithUserInterfaceStyle:", 0);
  v15 = -[TRAArbitrationInputs initWithInterfaceIdiomInputs:userInterfaceStyleInputs:deviceOrientationInputs:keyboardInputs:ambientPresentationInputs:](self, "initWithInterfaceIdiomInputs:userInterfaceStyleInputs:deviceOrientationInputs:keyboardInputs:ambientPresentationInputs:", v13, v14, v12, v11, v10);

  return v15;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[TRAArbitrationInputs succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  TRAArbitrationInputs *v9;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __50__TRAArbitrationInputs_succinctDescriptionBuilder__block_invoke;
  v7[3] = &unk_251A06D68;
  v4 = v3;
  v8 = v4;
  v9 = self;
  objc_msgSend(v4, "appendBodySectionWithName:multilinePrefix:block:", 0, CFSTR("\t"), v7);
  v5 = v4;

  return v5;
}

id __50__TRAArbitrationInputs_succinctDescriptionBuilder__block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  id v5;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("interfaceIdiomInputs"));
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("userInterfaceStyleInputs"));
  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), CFSTR("deviceOrientationInputs"));
  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32), CFSTR("keyboardInputs"));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40), CFSTR("ambientPresentationInputs"));
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[TRAArbitrationInputs descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
