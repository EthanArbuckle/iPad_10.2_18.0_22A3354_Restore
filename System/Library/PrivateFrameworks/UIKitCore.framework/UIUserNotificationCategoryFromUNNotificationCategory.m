@implementation UIUserNotificationCategoryFromUNNotificationCategory

UIMutableUserNotificationAction *___UIUserNotificationCategoryFromUNNotificationCategory_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  UIMutableUserNotificationAction *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = objc_alloc_init(UIMutableUserNotificationAction);
  objc_msgSend(v2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIUserNotificationAction setIdentifier:](v3, "setIdentifier:", v4);

  objc_msgSend(v2, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIUserNotificationAction setTitle:](v3, "setTitle:", v5);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[UIUserNotificationAction setBehavior:](v3, "setBehavior:", 1);
    objc_msgSend(v2, "textInputButtonTitle");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
    {
      v10 = CFSTR("UIUserNotificationTextInputActionButtonTitleKey");
      v11[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIUserNotificationAction setParameters:](v3, "setParameters:", v8);

    }
  }
  else
  {
    -[UIUserNotificationAction setBehavior:](v3, "setBehavior:", 0);
  }
  -[UIUserNotificationAction setActivationMode:](v3, "setActivationMode:", ~(objc_msgSend(v2, "options") >> 2) & 1);
  -[UIUserNotificationAction setAuthenticationRequired:](v3, "setAuthenticationRequired:", objc_msgSend(v2, "options") & 1);
  -[UIUserNotificationAction setDestructive:](v3, "setDestructive:", ((unint64_t)objc_msgSend(v2, "options") >> 1) & 1);

  return v3;
}

@end
