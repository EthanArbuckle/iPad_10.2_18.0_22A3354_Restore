@implementation MailMailboxGroupedPickerTableCell

- (double)fontSize
{
  return 0.0;
}

- (int)levelForMailbox:(id)a3
{
  id v4;
  int v5;
  void *v7;

  v4 = a3;
  if (objc_msgSend(v4, "mailboxType")
    || -[MailMailboxGroupedPickerTableCell alwaysDisplayAsTopLevel](self, "alwaysDisplayAsTopLevel"))
  {
    v5 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MailChangeManager sharedChangeManager](MailChangeManager, "sharedChangeManager"));
    v5 = objc_msgSend(v7, "levelForMailbox:", v4);

  }
  return v5;
}

- (id)nameForMailbox:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  if (objc_msgSend(v3, "mailboxType") == (id)7)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MailChangeManager sharedChangeManager](MailChangeManager, "sharedChangeManager"));
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "displayNameUsingSpecialNamesForMailbox:", v3));
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MailChangeManager sharedChangeManager](MailChangeManager, "sharedChangeManager"));
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "displayNameForMailbox:", v3));
  }
  v6 = (void *)v5;

  return v6;
}

- (BOOL)alwaysDisplayAsTopLevel
{
  return *((_BYTE *)&self->super + 9);
}

- (void)setAlwaysDisplayAsTopLevel:(BOOL)a3
{
  *((_BYTE *)&self->super + 9) = a3;
}

@end
