@implementation _UIColorPickerActionClientToHost

+ (id)actionForColorPickerDidSelectColor:(id)a3 colorSpace:(id)a4 isVolatile:(BOOL)a5
{
  _BOOL4 v5;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;

  v5 = a5;
  v8 = (void *)MEMORY[0x1E0C99D50];
  v9 = a4;
  objc_msgSend(v8, "bs_secureDataFromObject:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(MEMORY[0x1E0D017D0]);
  objc_msgSend(v11, "setObject:forSetting:", &unk_1E1A977D0, 0);
  objc_msgSend(v11, "setObject:forSetting:", v10, 1);
  objc_msgSend(v11, "setObject:forSetting:", v9, 2);

  objc_msgSend(v11, "setFlag:forSetting:", v5, 3);
  v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInfo:responder:", v11, 0);

  return v12;
}

+ (id)actionForColorPickerDidShowEyedropper
{
  return (id)objc_msgSend(a1, "_actionForActionType:", 1);
}

+ (id)actionForColorPickerDidFinish
{
  return (id)objc_msgSend(a1, "_actionForActionType:", 2);
}

+ (id)actionForColorPickerDidFloatEyedropper
{
  return (id)objc_msgSend(a1, "_actionForActionType:", 3);
}

+ (id)actionForColorPickerDidDismissEyedropper
{
  return (id)objc_msgSend(a1, "_actionForActionType:", 4);
}

+ (id)_actionForActionType:(int64_t)a3
{
  id v5;
  void *v6;
  void *v7;

  v5 = objc_alloc_init(MEMORY[0x1E0D017D0]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v6, 0);

  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInfo:responder:", v5, 0);
  return v7;
}

- (void)performActionForSceneController:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;

  objc_msgSend(a3, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "conformsToProtocol:", &unk_1EDE7BA40) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIColorPickerActionClientToHost.m"), 76, CFSTR("Scene controller's delegate (%@) does not conform to _UIColorPickerViewProvidingDelegate"), objc_opt_class());

  }
  v17 = v5;
  -[_UIColorPickerActionClientToHost info](self, "info");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForSetting:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  switch(v8)
  {
    case 0:
      -[_UIColorPickerActionClientToHost info](self, "info");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForSetting:", 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIColor bs_secureDecodedFromData:](UIColor, "bs_secureDecodedFromData:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[_UIColorPickerActionClientToHost info](self, "info");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForSetting:", 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      -[_UIColorPickerActionClientToHost info](self, "info");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "BOOLForSetting:", 3);

      objc_msgSend(v17, "_pickerDidSelectColor:colorSpace:isVolatile:", v11, v13, v15);
      break;
    case 1:
      objc_msgSend(v17, "_pickerDidShowEyedropper");
      break;
    case 2:
      objc_msgSend(v17, "_pickerDidFinish");
      break;
    case 3:
      objc_msgSend(v17, "_pickerDidFloatEyedropper");
      break;
    case 4:
      objc_msgSend(v17, "_pickerDidDismissEyedropper");
      break;
    default:
      break;
  }

}

@end
