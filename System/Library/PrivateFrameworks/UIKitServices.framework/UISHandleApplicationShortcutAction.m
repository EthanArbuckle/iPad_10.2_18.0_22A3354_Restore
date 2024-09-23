@implementation UISHandleApplicationShortcutAction

- (UISHandleApplicationShortcutAction)initWithSBSShortcutItem:(id)a3
{
  id v5;
  id v6;
  void *v7;
  UISHandleApplicationShortcutAction *v8;
  void *v10;
  objc_super v11;

  v5 = a3;
  getSBSApplicationShortcutItemClass();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISHandleApplicationShortcutAction.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[shortcutItem isKindOfClass:getSBSApplicationShortcutItemClass()]"));

  }
  v6 = objc_alloc_init(MEMORY[0x1E0D22FF0]);
  v7 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v6, "setObject:forSetting:", v7, 1);

  v11.receiver = self;
  v11.super_class = (Class)UISHandleApplicationShortcutAction;
  v8 = -[UISHandleApplicationShortcutAction initWithInfo:responder:](&v11, sel_initWithInfo_responder_, v6, 0);

  return v8;
}

- (SBSApplicationShortcutItem)sbsShortcutItem
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[UISHandleApplicationShortcutAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  getSBSApplicationShortcutItemClass();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return (SBSApplicationShortcutItem *)v5;
}

- (int64_t)UIActionType
{
  return 17;
}

- (UIApplicationShortcutItem)uiShortcutItem
{
  void *v2;
  void *v3;
  objc_class *v4;
  void *v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  -[UISHandleApplicationShortcutAction sbsShortcutItem](self, "sbsShortcutItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x2050000000;
    v3 = (void *)qword_1ECDA5930;
    v11 = qword_1ECDA5930;
    if (!qword_1ECDA5930)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __getUIApplicationShortcutItemClass_block_invoke;
      v7[3] = &unk_1E2CAF658;
      v7[4] = &v8;
      __getUIApplicationShortcutItemClass_block_invoke((uint64_t)v7);
      v3 = (void *)v9[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v8, 8);
    v5 = (void *)objc_msgSend([v4 alloc], "initWithSBSApplicationShortcutItem:", v2);
  }
  else
  {
    v5 = 0;
  }

  return (UIApplicationShortcutItem *)v5;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 == 1)
    return CFSTR("shortcutItem");
  else
    return 0;
}

- (BOOL)isKindOfClass:(Class)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UISHandleApplicationShortcutAction;
  if (-[UISHandleApplicationShortcutAction isKindOfClass:](&v5, sel_isKindOfClass_))
    return 1;
  else
    return -[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class());
}

@end
