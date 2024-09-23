@implementation VOSBluetoothSSPPairingRequest

- (VOSBluetoothSSPPairingRequest)initWithDevice:(id)a3 andSpecifier:(id)a4
{
  id v7;
  id v8;
  VOSBluetoothSSPPairingRequest *v9;
  VOSBluetoothSSPPairingRequest *v10;
  void *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)VOSBluetoothSSPPairingRequest;
  v9 = -[VOSBluetoothSSPPairingRequest init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_device, a3);
    objc_storeStrong((id *)&v10->_specifier, a4);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v10, sel_hidPairingResult_, *MEMORY[0x24BE007D0], 0);

  }
  return v10;
}

- (VOSBluetoothSSPPairingRequest)initWithDevice:(id)a3 andSpecifier:(id)a4 acceptPairingBlock:(id)a5 cancelPairingBlock:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  VOSBluetoothSSPPairingRequest *v15;
  VOSBluetoothSSPPairingRequest *v16;
  uint64_t v17;
  id acceptPairingBlock;
  uint64_t v19;
  id cancelPairingBlock;
  objc_super v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)VOSBluetoothSSPPairingRequest;
  v15 = -[VOSBluetoothSSPPairingRequest init](&v22, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_device, a3);
    objc_storeStrong((id *)&v16->_specifier, a4);
    v17 = objc_msgSend(v13, "copy");
    acceptPairingBlock = v16->_acceptPairingBlock;
    v16->_acceptPairingBlock = (id)v17;

    v19 = objc_msgSend(v14, "copy");
    cancelPairingBlock = v16->_cancelPairingBlock;
    v16->_cancelPairingBlock = (id)v19;

  }
  return v16;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[VOSBluetoothSSPPairingRequest dismiss](self, "dismiss");
  v4.receiver = self;
  v4.super_class = (Class)VOSBluetoothSSPPairingRequest;
  -[VOSBluetoothSSPPairingRequest dealloc](&v4, sel_dealloc);
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong(&self->_delegate, a3);
}

- (id)_sanitizeNameForAlert:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  id v16;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "illegalCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCharactersToBeSkipped:", v5);

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  while (1)
  {
    v8 = v7;
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v7;
    v10 = objc_msgSend(v4, "scanUpToCharactersFromSet:intoString:", v9, &v16);
    v7 = v16;

    if (!v10)
      break;
    objc_msgSend(v6, "appendString:", v7);
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v4, "scanCharactersFromSet:intoString:", v11, 0);

    if (v12)
      objc_msgSend(v6, "appendString:", CFSTR(" "));
  }
  if ((unint64_t)objc_msgSend(v6, "length") <= 0x32)
  {
    v13 = v6;
  }
  else
  {
    objc_msgSend(v6, "substringToIndex:", 50);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;

  return v14;
}

- (int)pairingStyle
{
  return self->_pairingStyle;
}

- (void)setPairingStyle:(int)a3 andPasskey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD *v32;
  void *v33;
  _QWORD *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  id v39;
  UIAlertController *v40;
  UIAlertController *alert;
  id UIAlertActionClass;
  void *v43;
  id v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  _QWORD v53[4];
  id v54;
  _QWORD v55[4];
  id v56;
  _QWORD v57[5];
  _QWORD aBlock[5];
  uint64_t v59;
  uint64_t v60;
  void *v61;
  void *v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t v67;

  v6 = a4;
  VOSLocString(CFSTR("CANCEL"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUIBluetoothDevice name](self->_device, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VOSBluetoothSSPPairingRequest _sanitizeNameForAlert:](self, "_sanitizeNameForAlert:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  self->_pairingStyle = a3;
  v64 = 0;
  v65 = &v64;
  v66 = 0x2050000000;
  v9 = (void *)getUIDeviceClass_softClass;
  v67 = getUIDeviceClass_softClass;
  v10 = MEMORY[0x24BDAC760];
  if (!getUIDeviceClass_softClass)
  {
    v59 = MEMORY[0x24BDAC760];
    v60 = 3221225472;
    v61 = __getUIDeviceClass_block_invoke;
    v62 = &unk_24CBAD828;
    v63 = &v64;
    __getUIDeviceClass_block_invoke((uint64_t)&v59);
    v9 = (void *)v65[3];
  }
  v11 = objc_retainAutorelease(v9);
  _Block_object_dispose(&v64, 8);
  objc_msgSend(v11, "currentDevice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  switch(a3)
  {
    case 0:
      v13 = (void *)MEMORY[0x24BDD17C8];
      VOSLocString(CFSTR("NUMERIC_TITLE"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedModel");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", v14, v8, v15);
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%06u"), objc_msgSend(v6, "unsignedIntValue"));
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)MEMORY[0x24BDD17C8];
      VOSLocString(CFSTR("NUMERIC_MESSAGE"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = (void *)v16;
      objc_msgSend(v17, "stringWithFormat:", v18, v16, v8);
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      VOSLocString(CFSTR("NUMERIC_BUTTON"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      v19 = (void *)MEMORY[0x24BDD17C8];
      VOSLocString(CFSTR("JUST_WORKS_TITLE"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedModel");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringWithFormat:", v20, v8, v21);
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      VOSLocString(CFSTR("JUST_WORKS_MESSAGE"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      VOSLocString(CFSTR("JUST_WORKS_BUTTON"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = 0;
      break;
    case 2:
      v22 = (void *)MEMORY[0x24BDD17C8];
      VOSLocString(CFSTR("PASSKEY_TITLE"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedModel");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "stringWithFormat:", v23, v8, v24);
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%06u"), objc_msgSend(v6, "unsignedIntValue"));
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = (void *)MEMORY[0x24BDD17C8];
      v27 = CFSTR("PASSKEY_MESSAGE");
      goto LABEL_9;
    case 3:
      v28 = (void *)MEMORY[0x24BDD17C8];
      VOSLocString(CFSTR("PASSKEY_TITLE"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedModel");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "stringWithFormat:", v29, v8, v30);
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%04u"), objc_msgSend(v6, "unsignedIntValue"));
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = (void *)MEMORY[0x24BDD17C8];
      v27 = CFSTR("HID_MESSAGE");
LABEL_9:
      VOSLocString(v27);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = (void *)v25;
      objc_msgSend(v26, "stringWithFormat:", v31, v25, v8);
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      v50 = 0;
      break;
    default:
      v47 = 0;
      v50 = 0;
      v51 = 0;
      v52 = 0;
      break;
  }
  -[VOSBluetoothSSPPairingRequest acceptPairingBlock](self, "acceptPairingBlock");
  v32 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v33 = v32;
  if (!v32)
  {
    aBlock[0] = v10;
    aBlock[1] = 3221225472;
    aBlock[2] = __60__VOSBluetoothSSPPairingRequest_setPairingStyle_andPasskey___block_invoke;
    aBlock[3] = &unk_24CBAC200;
    v32 = aBlock;
    aBlock[4] = self;
  }
  v49 = _Block_copy(v32);

  -[VOSBluetoothSSPPairingRequest cancelPairingBlock](self, "cancelPairingBlock");
  v34 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v35 = v34;
  if (!v34)
  {
    v57[0] = v10;
    v57[1] = 3221225472;
    v57[2] = __60__VOSBluetoothSSPPairingRequest_setPairingStyle_andPasskey___block_invoke_2;
    v57[3] = &unk_24CBAC200;
    v34 = v57;
    v57[4] = self;
  }
  v36 = _Block_copy(v34);

  v64 = 0;
  v65 = &v64;
  v66 = 0x2050000000;
  v37 = (void *)getUIAlertControllerClass_softClass_0;
  v67 = getUIAlertControllerClass_softClass_0;
  if (!getUIAlertControllerClass_softClass_0)
  {
    v59 = v10;
    v60 = 3221225472;
    v61 = __getUIAlertControllerClass_block_invoke_0;
    v62 = &unk_24CBAD828;
    v63 = &v64;
    __getUIAlertControllerClass_block_invoke_0((uint64_t)&v59);
    v37 = (void *)v65[3];
  }
  v38 = v10;
  v39 = objc_retainAutorelease(v37);
  _Block_object_dispose(&v64, 8);
  objc_msgSend(v39, "alertControllerWithTitle:message:preferredStyle:", v52, v51, 1);
  v40 = (UIAlertController *)objc_claimAutoreleasedReturnValue();
  alert = self->_alert;
  self->_alert = v40;

  if (v50)
  {
    UIAlertActionClass = getUIAlertActionClass();
    v55[0] = v38;
    v55[1] = 3221225472;
    v55[2] = __60__VOSBluetoothSSPPairingRequest_setPairingStyle_andPasskey___block_invoke_3;
    v55[3] = &unk_24CBAD9B0;
    v56 = v49;
    objc_msgSend(UIAlertActionClass, "actionWithTitle:style:handler:", v50, 0, v55);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAlertController addAction:](self->_alert, "addAction:", v43);

  }
  v44 = getUIAlertActionClass();
  v53[0] = v38;
  v53[1] = 3221225472;
  v53[2] = __60__VOSBluetoothSSPPairingRequest_setPairingStyle_andPasskey___block_invoke_4;
  v53[3] = &unk_24CBAD9B0;
  v54 = v36;
  v45 = v36;
  objc_msgSend(v44, "actionWithTitle:style:handler:", v48, 1, v53);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAlertController addAction:](self->_alert, "addAction:", v46);

}

void __60__VOSBluetoothSSPPairingRequest_setPairingStyle_andPasskey___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_opt_class();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setObject:forKey:", CFSTR("accepted"), CFSTR("PIN-ended"));
  v4 = *(_QWORD *)(a1 + 32);
  if (*(_DWORD *)(v4 + 32) != 3)
  {
    if (*(_QWORD *)(v4 + 8))
    {
      +[VOSBluetoothManager sharedInstance](VOSBluetoothManager, "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "acceptSSP:forDevice:", 0, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));

    }
  }
}

void __60__VOSBluetoothSSPPairingRequest_setPairingStyle_andPasskey___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  objc_opt_class();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setObject:forKey:", CFSTR("cancelled"), CFSTR("PIN-ended"));
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 8);
  if (v5)
  {
    if (*(_DWORD *)(v4 + 32) == 3)
    {
      objc_msgSend(v5, "setPIN:", 0);
    }
    else
    {
      +[VOSBluetoothManager sharedInstance](VOSBluetoothManager, "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "acceptSSP:forDevice:", 1, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));

    }
  }
}

uint64_t __60__VOSBluetoothSSPPairingRequest_setPairingStyle_andPasskey___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __60__VOSBluetoothSSPPairingRequest_setPairingStyle_andPasskey___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)showWithWindow:(id)a3
{
  id v4;

  objc_msgSend(a3, "rootViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentViewController:animated:completion:", self->_alert, 1, 0);

}

- (void)showWithViewController:(id)a3
{
  objc_msgSend(a3, "presentViewController:animated:completion:", self->_alert, 1, 0);
}

- (void)dismiss
{
  -[UIAlertController dismissViewControllerAnimated:completion:](self->_alert, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (id)acceptPairingBlock
{
  return self->_acceptPairingBlock;
}

- (void)setAcceptPairingBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)cancelPairingBlock
{
  return self->_cancelPairingBlock;
}

- (void)setCancelPairingBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cancelPairingBlock, 0);
  objc_storeStrong(&self->_acceptPairingBlock, 0);
  objc_storeStrong((id *)&self->_alert, 0);
  objc_storeStrong(&self->_delegate, 0);
  objc_storeStrong((id *)&self->_specifier, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
