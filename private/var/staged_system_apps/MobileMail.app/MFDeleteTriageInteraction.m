@implementation MFDeleteTriageInteraction

+ (unint64_t)deleteOrArchive
{
  return 1;
}

- (BOOL)_requiresConfirmationPrompt
{
  void *v3;
  unsigned __int8 v4;
  BOOL v5;
  void *v6;
  void *v7;

  if ((id)-[MFDestructiveTriageInteraction type](self, "type") == (id)2)
    return 1;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults em_userDefaults](NSUserDefaults, "em_userDefaults"));
  v4 = objc_msgSend(v3, "BOOLForKey:", ShowMessageDeleteConfirmationKey);

  if ((v4 & 1) != 0)
    return 1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction messageListItemSelection](self, "messageListItemSelection"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "messageListItems"));
  v5 = (unint64_t)objc_msgSend(v7, "em_messageListItemTotalCount") > 1;

  return v5;
}

- (int64_t)_preferredAlertActionStyle
{
  return 2;
}

- (BOOL)_movesToTrash
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction messageListItemSelection](self, "messageListItemSelection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "messageListItems"));
  v4 = objc_msgSend(v3, "ef_any:", &stru_100520E90);

  return v4;
}

- (id)title
{
  unsigned int v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  __CFString *v10;
  uint64_t v11;
  uint64_t v12;

  v3 = -[MFDeleteTriageInteraction _movesToTrash](self, "_movesToTrash");
  if (-[MFTriageInteraction titleIncludesCount](self, "titleIncludesCount"))
  {
    if (-[MFTriageInteraction messageCount](self, "messageCount") < 2)
    {
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v10;
      if (v3)
        v11 = objc_claimAutoreleasedReturnValue(-[__CFString localizedStringForKey:value:table:](v10, "localizedStringForKey:value:table:", CFSTR("TRASH_EMAIL"), &stru_100531B00, CFSTR("Main")));
      else
        v11 = objc_claimAutoreleasedReturnValue(-[__CFString localizedStringForKey:value:table:](v10, "localizedStringForKey:value:table:", CFSTR("DELETE_EMAIL"), &stru_100531B00, CFSTR("Main")));
      v8 = (void *)v11;
    }
    else
    {
      v4 = CFSTR("DELETE_FORMAT%1$lu");
      if (v3)
        v4 = CFSTR("TRASH_FORMAT%1$lu");
      v5 = v4;
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", v5, &stru_100531B00, CFSTR("Main")));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v7, -[MFTriageInteraction messageCount](self, "messageCount")));

    }
  }
  else
  {
    if (v3)
      v9 = CFSTR("Trash");
    else
      v9 = CFSTR("Delete");
    v12 = _EFLocalizedString(v9, &unk_10059D2A0, &unk_10059D2A8);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v12);
  }
  return v8;
}

- (id)accessibilityIdentifer
{
  return MSAccessibilityIdentifierActionsViewControllerTrashMessage;
}

- (id)shortTitle
{
  unsigned int v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = -[MFDeleteTriageInteraction _movesToTrash](self, "_movesToTrash");
  v4 = -[MFTriageInteraction messageCount](self, "messageCount");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = v5;
  if (v4 < 2)
  {
    if (v3)
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("TRASH"), &stru_100531B00, CFSTR("Main")));
    else
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("DELETE"), &stru_100531B00, CFSTR("Main")));
    v10 = (void *)v8;
    v9 = v6;
  }
  else
  {
    if (v3)
      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("TRASH_COUNT"), &stru_100531B00, CFSTR("Main")));
    else
      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("DELETE_COUNT"), &stru_100531B00, CFSTR("Main")));
    v9 = (void *)v7;

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, -[MFTriageInteraction messageCount](self, "messageCount")));
  }

  return v10;
}

- (id)swipeTitle
{
  unsigned int v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = -[MFDeleteTriageInteraction _movesToTrash](self, "_movesToTrash");
  v4 = -[MFTriageInteraction messageCount](self, "messageCount");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = v5;
  if (v4 < 2)
  {
    if (v3)
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SWIPE_TRASH"), &stru_100531B00, CFSTR("Main")));
    else
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SWIPE_DELETE"), &stru_100531B00, CFSTR("Main")));
    v10 = (void *)v8;
    v9 = v6;
  }
  else
  {
    if (v3)
      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SWIPE_TRASH_COUNT"), &stru_100531B00, CFSTR("Main")));
    else
      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SWIPE_DELETE_COUNT"), &stru_100531B00, CFSTR("Main")));
    v9 = (void *)v7;

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, -[MFTriageInteraction messageCount](self, "messageCount")));
  }

  return v10;
}

- (id)undoTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("OPERATION_DELETE_DESC"), &stru_100531B00, CFSTR("Main")));

  return v3;
}

- (id)color
{
  return +[UIColor mailDestructiveActionColor](UIColor, "mailDestructiveActionColor");
}

- (id)_swipeColor
{
  return +[UIColor mailDestructiveActionSwipeColor](UIColor, "mailDestructiveActionSwipeColor");
}

- (id)_iconImageName
{
  return MFImageGlyphTrash;
}

- (id)_previewImageName
{
  return MFImageGlyphTrash;
}

- (BOOL)isDestructive
{
  return 1;
}

- (BOOL)needShrinkAnimationAfterCompletion
{
  return 1;
}

@end
