@implementation _UIFontPickerActionClientToHost

+ (id)actionForPickerDidSelectFont:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;

  v4 = (objc_class *)MEMORY[0x1E0D017D0];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "setObject:forSetting:", &unk_1E1A9A7E8, 0);
  objc_msgSend(MEMORY[0x1E0C99D50], "bs_secureDataFromObject:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forSetting:", v7, 1);
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInfo:responder:", v6, 0);

  return v8;
}

+ (id)actionForPickerDidCancel
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0D017D0]);
  objc_msgSend(v3, "setObject:forSetting:", &unk_1E1A9A800, 0);
  v4 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInfo:responder:", v3, 0);

  return v4;
}

- (void)performActionForSceneController:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v5 = a3;
  -[_UIFontPickerActionClientToHost info](self, "info");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForSetting:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  objc_msgSend(v5, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v9, "conformsToProtocol:", &unk_1EDDFFD38) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFontPickerActionClientToHost.m"), 46, CFSTR("Scene controller's delegate (%@) does not conform to _UIFontPickerViewControllerHost"), objc_opt_class());

  }
  v14 = v9;
  if (v8 == 1)
  {
    objc_msgSend(v14, "_pickerDidCancel");
  }
  else if (!v8)
  {
    -[_UIFontPickerActionClientToHost info](self, "info");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForSetting:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(off_1E167A830, "bs_secureDecodedFromData:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "_pickerDidSelectFont:", v12);
  }

}

@end
