@implementation UIKBAutoFillMenus

+ (id)updatedSystemAutoFillMenuWithMenuElements:(id)a3
{
  return (id)objc_msgSend(a1, "updatedSystemAutoFillMenuWithMenuElements:isSecureTextField:", a3, 0);
}

+ (id)updatedSystemAutoFillMenuWithMenuElements:(id)a3 isSecureTextField:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  _QWORD v11[4];
  BOOL v12;

  v5 = a3;
  if (!+[UIKeyboard supportsAutoFillPanel](UIKeyboard, "supportsAutoFillPanel"))
    goto LABEL_7;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "isCurrentEditResponderInEditingMode")
    || (objc_msgSend((id)UIApp, "isProtectedDataAvailable") & 1) == 0)
  {

    goto LABEL_7;
  }
  +[UIKeyboard keyboardBundleIdentifier](UIKeyboard, "keyboardBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.purplebuddy"));

  if ((v8 & 1) != 0)
  {
LABEL_7:
    v9 = 0;
    goto LABEL_8;
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __81__UIKBAutoFillMenus_updatedSystemAutoFillMenuWithMenuElements_isSecureTextField___block_invoke_2;
  v11[3] = &__block_descriptor_33_e25___NSArray_16__0__UIMenu_8l;
  v12 = a4;
  _UIMenuReplacingElementMatchingPredicate(v5, &__block_literal_global_612, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v9;
}

uint64_t __81__UIKBAutoFillMenus_updatedSystemAutoFillMenuWithMenuElements_isSecureTextField___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.menu.insert-from-external-sources"));

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id __81__UIKBAutoFillMenus_updatedSystemAutoFillMenuWithMenuElements_isSecureTextField___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!*(_BYTE *)(a1 + 32))
  {
    _UILocalizedString(CFSTR("AUTOFILL_MENU_CONTACT"), (uint64_t)CFSTR("Contact label in system AutoFill menu"), CFSTR("Contact"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("person.crop.circle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v5, v6, CFSTR("com.apple.action.insert.contacts"), &__block_literal_global_22_9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v7);

  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.SafariViewService"));

  if ((v10 & 1) == 0)
  {
    _UILocalizedString(CFSTR("AUTOFILL_MENU_PASSWORDS"), (uint64_t)CFSTR("Passwords label in system AutoFill menu"), CFSTR("Passwords"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("key"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v11, v12, CFSTR("com.apple.action.insert.passwords"), &__block_literal_global_34_4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v13);

  }
  if (_os_feature_enabled_impl())
  {
    _UILocalizedString(CFSTR("AUTOFILL_MENU_CREDIT_CARD"), (uint64_t)CFSTR("Credit Card label in system AutoFill menu"), CFSTR("Credit Card"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("creditcard"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v14, v15, CFSTR("com.apple.action.insert.creditcards"), &__block_literal_global_43_2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v16);

  }
  objc_msgSend(v3, "menuByReplacingChildren:", v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

void __81__UIKBAutoFillMenus_updatedSystemAutoFillMenuWithMenuElements_isSecureTextField___block_invoke_3()
{
  id v0;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleAutoFillContactPopoverCommand");

}

void __81__UIKBAutoFillMenus_updatedSystemAutoFillMenuWithMenuElements_isSecureTextField___block_invoke_4()
{
  id v0;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleAutoFillPasswordPopoverCommand");

}

void __81__UIKBAutoFillMenus_updatedSystemAutoFillMenuWithMenuElements_isSecureTextField___block_invoke_5()
{
  id v0;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleAutoFillCreditCardPopoverCommand");

}

@end
