@implementation USUIMoreHelpMenuModel

+ (id)modelWithOptions:(int64_t)a3 interventionType:(int64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v7 = (void *)objc_msgSend(MEMORY[0x24BDBD1A8], "mutableCopy");
  objc_msgSend(a1, "addMenuActionsTo:interventionType:", v7, a4);
  objc_msgSend(a1, "addDefaultActionsTo:", v7);
  objc_msgSend(a1, "addOptionalActionsTo:options:", v7, a3);
  v8 = (void *)objc_opt_new();
  objc_msgSend(a1, "menuTitleWith:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:", v9);

  v10 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v8, "setActions:", v10);

  return v8;
}

+ (id)menuTitleWith:(int64_t)a3
{
  const __CFString *v3;

  if (a3 == 2)
    v3 = CFSTR("SENSITIVE_MEDIA_DETECTED_TITLE");
  else
    v3 = CFSTR("BLOCK_CONTACT_ACTION_TITLE");
  objc_msgSend(MEMORY[0x24BE853F8], "localizedStringForKey:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)addMenuActionsTo:(id)a3 interventionType:(int64_t)a4
{
  void *v4;
  const __CFString *v5;
  id v6;
  void *v7;
  id v8;

  if (a4 != 2)
  {
    v4 = (void *)MEMORY[0x24BE853F8];
    if (a4)
      v5 = CFSTR("MESSAGE_SOMEONE");
    else
      v5 = CFSTR("MESSAGE_GROWNUP");
    v6 = a3;
    objc_msgSend(v4, "localizedStringForKey:", v5);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    +[USUIMoreHelpMenuAction action:destructive:actionID:](USUIMoreHelpMenuAction, "action:destructive:actionID:", v8, 0, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

  }
}

+ (void)addDefaultActionsTo:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x24BE853F8];
  v4 = a3;
  objc_msgSend(v3, "localizedStringForKey:", CFSTR("MORE_HELP"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[USUIMoreHelpMenuAction action:destructive:actionID:](USUIMoreHelpMenuAction, "action:destructive:actionID:", v6, 0, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

}

+ (void)addOptionalActionsTo:(id)a3 options:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a3;
  if (a4)
  {
    v12 = v5;
    if ((a4 & 4) != 0)
    {
      objc_msgSend(MEMORY[0x24BE853F8], "localizedStringForKey:", CFSTR("LEAVE_CONVERSATION_BUTTON_TITLE"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[USUIMoreHelpMenuAction action:destructive:actionID:](USUIMoreHelpMenuAction, "action:destructive:actionID:", v6, 1, 3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v7);

    }
    if ((a4 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BE853F8], "localizedStringForKey:", CFSTR("BLOCK_CONTACT_BUTTON_TITLE"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[USUIMoreHelpMenuAction action:destructive:actionID:](USUIMoreHelpMenuAction, "action:destructive:actionID:", v8, 1, 4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v9);

    }
    v5 = v12;
    if ((a4 & 2) != 0)
    {
      objc_msgSend(MEMORY[0x24BE853F8], "localizedStringForKey:", CFSTR("BLOCK_CONTACTS_BUTTON_TITLE"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[USUIMoreHelpMenuAction action:destructive:actionID:](USUIMoreHelpMenuAction, "action:destructive:actionID:", v10, 1, 5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v11);

      v5 = v12;
    }
  }

}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
  objc_storeStrong((id *)&self->_actions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
