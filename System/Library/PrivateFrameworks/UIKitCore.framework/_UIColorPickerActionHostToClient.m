@implementation _UIColorPickerActionHostToClient

+ (id)actionForSelectedColor:(id)a3 withColorSpace:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;

  v6 = (void *)MEMORY[0x1E0C99D50];
  v7 = a4;
  objc_msgSend(v6, "bs_secureDataFromObject:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x1E0D017D0]);
  objc_msgSend(v9, "setObject:forSetting:", &unk_1E1A97740, 0);
  objc_msgSend(v9, "setObject:forSetting:", v8, 1);
  objc_msgSend(v9, "setObject:forSetting:", v7, 2);

  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInfo:responder:", v9, 0);
  return v10;
}

+ (id)actionForConfiguration:(id)a3
{
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99D50], "bs_secureDataFromObject:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0D017D0]);
  objc_msgSend(v5, "setObject:forSetting:", &unk_1E1A97758, 0);
  objc_msgSend(v5, "setObject:forSetting:", v4, 3);
  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInfo:responder:", v5, 0);

  return v6;
}

+ (id)actionForDismissEyeDropper:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  void *v6;

  v3 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0D017D0]);
  objc_msgSend(v5, "setObject:forSetting:", &unk_1E1A97770, 0);
  objc_msgSend(v5, "setFlag:forSetting:", v3, 4);
  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInfo:responder:", v5, 0);

  return v6;
}

- (void)performActionForHostedWindowScene:(id)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;

  objc_msgSend(a3, "delegate");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v22, "conformsToProtocol:", &unk_1EE0CE1C8) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIColorPickerActionHostToClient.m"), 62, CFSTR("Scene's delegate (%@) does not conform to _UIHostedWindowSceneDelegate"), objc_opt_class());

  }
  objc_msgSend(v22, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rootViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "conformsToProtocol:", &unk_1EE0A0F80) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIColorPickerActionHostToClient.m"), 65, CFSTR("Scene delegate's root view controller (%@) does not conform to _UIColorPickerViewProviding"), objc_opt_class());

  }
  v7 = v6;
  -[_UIColorPickerActionHostToClient info](self, "info");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForSetting:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");

  switch(v10)
  {
    case 0:
      -[_UIColorPickerActionHostToClient info](self, "info");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForSetting:", 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIColor bs_secureDecodedFromData:](UIColor, "bs_secureDecodedFromData:", v15);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      -[_UIColorPickerActionHostToClient info](self, "info");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForSetting:", 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "_setSelectedColor:colorSpace:", v13, v17);
      goto LABEL_10;
    case 2:
      -[_UIColorPickerActionHostToClient info](self, "info");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "BOOLForSetting:", 4);

      objc_msgSend(v7, "dismissEyedropper:", v19);
      break;
    case 1:
      -[_UIColorPickerActionHostToClient info](self, "info");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForSetting:", 3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[_UIColorPickerViewControllerConfiguration bs_secureDecodedFromData:](_UIColorPickerViewControllerConfiguration, "bs_secureDecodedFromData:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "_setConfiguration:", v13);
LABEL_10:

      break;
  }

}

@end
