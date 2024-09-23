@implementation _UITextFormattingActionHostToClient

+ (id)actionForConfiguration:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;

  v4 = (objc_class *)MEMORY[0x1E0D017D0];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "setObject:forSetting:", &unk_1E1A9A1E8, 0);
  objc_msgSend(MEMORY[0x1E0C99D50], "bs_secureDataFromObject:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forSetting:", v7, 1);
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInfo:responder:", v6, 0);

  return v8;
}

+ (id)actionForFormattingDescriptor:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;

  v4 = (objc_class *)MEMORY[0x1E0D017D0];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "setObject:forSetting:", &unk_1E1A9A200, 0);
  objc_msgSend(MEMORY[0x1E0C99D50], "bs_secureDataFromObject:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forSetting:", v7, 2);
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInfo:responder:", v6, 0);

  return v8;
}

- (void)performActionForHostedWindowScene:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v5 = a3;
  -[_UITextFormattingActionHostToClient info](self, "info");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForSetting:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  objc_msgSend(v5, "delegate");
  v19 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v19, "conformsToProtocol:", &unk_1EE0CE1C8) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITextFormattingActionHostToClient.m"), 52, CFSTR("Scene's delegate (%@) does not conform to _UIHostedWindowSceneDelegate"), objc_opt_class());

  }
  objc_msgSend(v19, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rootViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v10, "conformsToProtocol:", &unk_1EE0CEE28) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITextFormattingActionHostToClient.m"), 55, CFSTR("Scene delegate's root view controller (%@) does not conform to _UITextFormattingViewProviding"), objc_opt_class());

  }
  v11 = v10;
  if (v8 == 1)
  {
    -[_UITextFormattingActionHostToClient info](self, "info");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForSetting:", 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[UITextFormattingViewControllerFormattingDescriptor bs_secureDecodedFromData:](UITextFormattingViewControllerFormattingDescriptor, "bs_secureDecodedFromData:", v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "_setFormattingDescriptor:", v14);
    goto LABEL_9;
  }
  if (!v8)
  {
    -[_UITextFormattingActionHostToClient info](self, "info");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForSetting:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[UITextFormattingViewControllerConfiguration bs_secureDecodedFromData:](UITextFormattingViewControllerConfiguration, "bs_secureDecodedFromData:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "_setConfiguration:", v14);
LABEL_9:

  }
}

@end
