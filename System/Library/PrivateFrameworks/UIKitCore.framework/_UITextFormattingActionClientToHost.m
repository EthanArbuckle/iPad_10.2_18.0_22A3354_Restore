@implementation _UITextFormattingActionClientToHost

+ (id)actionForChangeValue:(id)a3 textAttributesData:(id)a4
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
  objc_msgSend(v9, "setObject:forSetting:", &unk_1E1A9AAD0, 0);
  objc_msgSend(v9, "setObject:forSetting:", v7, 6);

  objc_msgSend(v9, "setObject:forSetting:", v8, 1);
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInfo:responder:", v9, 0);

  return v10;
}

+ (id)actionForPresentColorPickerWithRect:(CGRect)a3 selectedColor:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v14[4];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend(MEMORY[0x1E0C99D50], "bs_secureDataFromObject:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(MEMORY[0x1E0D017D0]);
  objc_msgSend(v10, "setObject:forSetting:", &unk_1E1A9AAE8, 0);
  objc_msgSend(v10, "setObject:forSetting:", v9, 3);
  *(CGFloat *)v14 = x;
  *(CGFloat *)&v14[1] = y;
  *(CGFloat *)&v14[2] = width;
  *(CGFloat *)&v14[3] = height;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v14, "{CGRect={CGPoint=dd}{CGSize=dd}}");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forSetting:", v11, 2);

  v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInfo:responder:", v10, 0);
  return v12;
}

+ (id)actionForPresentFontPickerWithConfiguration:(id)a3 selectedFonts:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;

  v6 = (void *)MEMORY[0x1E0C99D50];
  v7 = a3;
  objc_msgSend(v6, "bs_secureDataFromObject:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x1E0D017D0]);
  objc_msgSend(v9, "setObject:forSetting:", &unk_1E1A9AB00, 0);
  objc_msgSend(v9, "setObject:forSetting:", v7, 4);

  objc_msgSend(v9, "setObject:forSetting:", v8, 5);
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInfo:responder:", v9, 0);

  return v10;
}

+ (id)actionForPresentTypographySettingsForFont:(id)a3
{
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99D50], "bs_secureDataFromObject:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0D017D0]);
  objc_msgSend(v5, "setObject:forSetting:", &unk_1E1A9AB18, 0);
  objc_msgSend(v5, "setObject:forSetting:", v4, 5);
  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInfo:responder:", v5, 0);

  return v6;
}

+ (id)actionForDidFinish
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0D017D0]);
  objc_msgSend(v3, "setObject:forSetting:", &unk_1E1A9AB30, 0);
  v4 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInfo:responder:", v3, 0);

  return v4;
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
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;

  objc_msgSend(a3, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "conformsToProtocol:", &unk_1EE026188) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITextFormattingActionClientToHost.m"), 95, CFSTR("Scene controller's delegate (%@) does not conform to _UITextFormattingRemoteViewControllerHost"), objc_opt_class());

  }
  v34 = v5;
  -[_UITextFormattingActionClientToHost info](self, "info");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForSetting:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  switch(v8)
  {
    case 0:
      -[_UITextFormattingActionClientToHost info](self, "info");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForSetting:", 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[UITextFormattingViewControllerChangeValue bs_secureDecodedFromData:](UITextFormattingViewControllerChangeValue, "bs_secureDecodedFromData:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[_UITextFormattingActionClientToHost info](self, "info");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForSetting:", 6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v34, "_textFormattingDidChangeValue:textAttributesData:", v11, v13);
      goto LABEL_9;
    case 1:
      objc_msgSend(v34, "_textFormattingDidFinish");
      break;
    case 2:
      -[_UITextFormattingActionClientToHost info](self, "info");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForSetting:", 3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIColor bs_secureDecodedFromData:](UIColor, "bs_secureDecodedFromData:", v15);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[_UITextFormattingActionClientToHost info](self, "info");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForSetting:", 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "CGRectValue");
      v19 = v18;
      v21 = v20;
      v23 = v22;
      v25 = v24;

      objc_msgSend(v34, "_presentColorPicker:selectedColor:", v11, v19, v21, v23, v25);
      goto LABEL_10;
    case 3:
      -[_UITextFormattingActionClientToHost info](self, "info");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectForSetting:", 4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)MEMORY[0x1E0C99D20];
      -[_UITextFormattingActionClientToHost info](self, "info");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "objectForSetting:", 5);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "bs_secureDecodedFromData:withAdditionalClasses:", v29, v13);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v34, "_presentFontPickerWithConfiguration:selectedFonts:", v11, v30);
      goto LABEL_9;
    case 4:
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UITextFormattingActionClientToHost info](self, "info");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "objectForSetting:", 5);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(off_1E167A828, "bs_secureDecodedFromData:withAdditionalClasses:", v32, v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v34, "_presentTypographySettingsForFont:", v13);
LABEL_9:

LABEL_10:
      break;
    default:
      break;
  }

}

@end
