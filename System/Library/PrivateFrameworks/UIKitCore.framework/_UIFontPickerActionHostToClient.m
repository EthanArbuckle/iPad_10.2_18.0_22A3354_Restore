@implementation _UIFontPickerActionHostToClient

+ (id)actionForConfiguration:(id)a3
{
  id v4;
  id v5;
  void (*v6)(void);
  void *v7;
  void *v8;
  void *v9;
  id result;
  void *v11;
  void *v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void *v17;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0D017D0]);
  objc_msgSend(v5, "setObject:forSetting:", &unk_1E1A993C0, 0);
  objc_msgSend(v5, "setObject:forSetting:", v4, 1);
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v6 = (void (*)(void))_MergedGlobals_1170;
  v17 = _MergedGlobals_1170;
  if (!_MergedGlobals_1170)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __getFSFontPickerSupportListenerEndpointSymbolLoc_block_invoke;
    v13[3] = &unk_1E16B14C0;
    v13[4] = &v14;
    __getFSFontPickerSupportListenerEndpointSymbolLoc_block_invoke(v13);
    v6 = (void (*)(void))v15[3];
  }
  _Block_object_dispose(&v14, 8);
  if (v6)
  {
    v6();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "set_clientFontContextEndpoint:", v7);

    _UIFontPickerLoadRecentFontDescriptors();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_setClientRecentFonts:", v8);

    v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInfo:responder:", v5, 0);
    return v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSXPCListenerEndpoint *_FSFontPickerSupportListenerEndpoint(void)");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("_UIFontPickerActionHostToClient.m"), 19, CFSTR("%s"), dlerror());

    __break(1u);
  }
  return result;
}

+ (id)actionForSelectedFontDescriptors:(id)a3 scrollToVisible:(BOOL)a4
{
  _BOOL8 v4;
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a4;
  v6 = (objc_class *)MEMORY[0x1E0D017D0];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  objc_msgSend(v8, "setObject:forSetting:", &unk_1E1A993D8, 0);
  objc_msgSend(MEMORY[0x1E0C99D50], "bs_secureDataFromObject:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setObject:forSetting:", v9, 2);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forSetting:", v10, 3);

  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInfo:responder:", v8, 0);
  return v11;
}

+ (id)actionForHideNavigationBar:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  void *v6;
  void *v7;

  v3 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0D017D0]);
  objc_msgSend(v5, "setObject:forSetting:", &unk_1E1A993F0, 0);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v6, 4);

  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInfo:responder:", v5, 0);
  return v7;
}

+ (id)actionForShowsGrabber:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  void *v6;
  void *v7;

  v3 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0D017D0]);
  objc_msgSend(v5, "setObject:forSetting:", &unk_1E1A99408, 0);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v6, 5);

  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInfo:responder:", v5, 0);
  return v7;
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
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;

  objc_msgSend(a3, "delegate");
  v28 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v28, "conformsToProtocol:", &unk_1EE0CE1C8) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFontPickerActionHostToClient.m"), 80, CFSTR("Scene's delegate (%@) does not conform to _UIHostedWindowSceneDelegate"), objc_opt_class());

  }
  objc_msgSend(v28, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rootViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "conformsToProtocol:", &unk_1EE0CEAC8) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFontPickerActionHostToClient.m"), 83, CFSTR("Scene delegate's root view controller (%@) does not conform to _UIFontPickerClientActionHandling"), objc_opt_class());

  }
  v7 = v6;
  -[_UIFontPickerActionHostToClient info](self, "info");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForSetting:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");

  switch(v10)
  {
    case 0:
      -[_UIFontPickerActionHostToClient info](self, "info");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForSetting:", 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "applyFontPickerConfiguration:", v12);
      goto LABEL_8;
    case 1:
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x1E0C99D20];
      -[_UIFontPickerActionHostToClient info](self, "info");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForSetting:", 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "bs_secureDecodedFromData:withAdditionalClasses:", v15, v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      -[_UIFontPickerActionHostToClient info](self, "info");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForSetting:", 3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "BOOLValue");

      objc_msgSend(v7, "applySelectedFontDescriptors:scrollToVisible:", v16, v19);
LABEL_8:

      break;
    case 2:
      -[_UIFontPickerActionHostToClient info](self, "info");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectForSetting:", 4);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "BOOLValue");

      objc_msgSend(v7, "applyHideNavigationBar:", v22);
      break;
    case 3:
      -[_UIFontPickerActionHostToClient info](self, "info");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectForSetting:", 5);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "BOOLValue");

      objc_msgSend(v7, "applyShowsGrabber:", v25);
      break;
    default:
      break;
  }

}

@end
