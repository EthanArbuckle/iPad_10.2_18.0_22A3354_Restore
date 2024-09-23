@implementation SCUIMoreHelpMenuModel

+ (id)modelWithOptions:(int64_t)a3 interventionType:(int64_t)a4 locale:(id)a5
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v8 = (void *)objc_msgSend(MEMORY[0x24BDBD1A8], "mutableCopy", a3, a4, a5);
  objc_msgSend(a1, "addMenuActionsTo:interventionType:", v8, a4);
  objc_msgSend(a1, "addDefaultActionsTo:", v8);
  objc_msgSend(a1, "addOptionalActionsTo:options:", v8, a3);
  v9 = (void *)objc_opt_new();
  objc_msgSend(a1, "menuTitleWith:options:", a4, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTitle:", v10);

  v11 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend(v9, "setActions:", v11);

  objc_msgSend(v9, "setOptions:", a3);
  return v9;
}

+ (id)menuTitleWith:(int64_t)a3 options:(int64_t)a4
{
  const __CFString *v4;

  if (a3 == 2)
  {
    v4 = CFSTR("SENSITIVE_MEDIA_DETECTED_TITLE");
  }
  else if ((a4 & 3) != 0)
  {
    v4 = CFSTR("BLOCK_CONTACT_ACTION_TITLE");
  }
  else
  {
    v4 = CFSTR("DEFAULT_ACTION_TITLE");
  }
  +[SCUIResources localizedStringForKey:](SCUIResources, "localizedStringForKey:", v4, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)addMenuActionsTo:(id)a3 interventionType:(int64_t)a4
{
  const __CFString *v4;
  id v5;
  void *v6;
  id v7;

  if (a4 != 2)
  {
    if (a4)
      v4 = CFSTR("MESSAGE_SOMEONE");
    else
      v4 = CFSTR("MESSAGE_GROWNUP");
    v5 = a3;
    +[SCUIResources localizedStringForKey:](SCUIResources, "localizedStringForKey:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    +[SCUIMoreHelpMenuAction action:destructive:actionID:](SCUIMoreHelpMenuAction, "action:destructive:actionID:", v7, 0, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

  }
}

+ (void)addDefaultActionsTo:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  +[SCUIResources localizedStringForKey:](SCUIResources, "localizedStringForKey:", CFSTR("MORE_HELP"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[SCUIMoreHelpMenuAction action:destructive:actionID:](SCUIMoreHelpMenuAction, "action:destructive:actionID:", v5, 0, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v5 = a3;
  if (!a4)
    goto LABEL_9;
  v16 = v5;
  if ((a4 & 0x10) != 0)
  {
    +[SCUIResources localizedStringForKey:](SCUIResources, "localizedStringForKey:", CFSTR("HIDE_PHOTO_BUTTON_TITLE"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[SCUIMoreHelpMenuAction action:destructive:actionID:](SCUIMoreHelpMenuAction, "action:destructive:actionID:", v10, 0, 7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v11);

    if ((a4 & 8) == 0)
    {
LABEL_4:
      if ((a4 & 4) == 0)
        goto LABEL_5;
      goto LABEL_12;
    }
  }
  else if ((a4 & 8) == 0)
  {
    goto LABEL_4;
  }
  +[SCUIResources localizedStringForKey:](SCUIResources, "localizedStringForKey:", CFSTR("DELETE_ITEM_BUTTON_TITLE"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[SCUIMoreHelpMenuAction action:destructive:actionID:](SCUIMoreHelpMenuAction, "action:destructive:actionID:", v12, 1, 6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObject:", v13);

  if ((a4 & 4) == 0)
  {
LABEL_5:
    if ((a4 & 1) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_12:
  +[SCUIResources localizedStringForKey:](SCUIResources, "localizedStringForKey:", CFSTR("LEAVE_CONVERSATION_BUTTON_TITLE"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[SCUIMoreHelpMenuAction action:destructive:actionID:](SCUIMoreHelpMenuAction, "action:destructive:actionID:", v14, 1, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObject:", v15);

  if ((a4 & 1) != 0)
  {
LABEL_6:
    +[SCUIResources localizedStringForKey:](SCUIResources, "localizedStringForKey:", CFSTR("BLOCK_CONTACT_BUTTON_TITLE"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[SCUIMoreHelpMenuAction action:destructive:actionID:](SCUIMoreHelpMenuAction, "action:destructive:actionID:", v6, 1, 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v7);

  }
LABEL_7:
  v5 = v16;
  if ((a4 & 2) != 0)
  {
    +[SCUIResources localizedStringForKey:](SCUIResources, "localizedStringForKey:", CFSTR("BLOCK_CONTACTS_BUTTON_TITLE"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[SCUIMoreHelpMenuAction action:destructive:actionID:](SCUIMoreHelpMenuAction, "action:destructive:actionID:", v8, 1, 5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v9);

    v5 = v16;
  }
LABEL_9:

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

- (int64_t)options
{
  return self->_options;
}

- (void)setOptions:(int64_t)a3
{
  self->_options = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
