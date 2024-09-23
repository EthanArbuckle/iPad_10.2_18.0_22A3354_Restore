@implementation MFArchiveTriageInteraction

+ (unint64_t)deleteOrArchive
{
  return 2;
}

- (BOOL)_requiresConfirmationPrompt
{
  void *v3;
  unsigned __int8 v4;
  BOOL result;

  result = (id)-[MFDestructiveTriageInteraction type](self, "type") == (id)2
        || (v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults em_userDefaults](NSUserDefaults, "em_userDefaults")),
            v4 = objc_msgSend(v3, "BOOLForKey:", ShowMessageDeleteConfirmationKey),
            v3,
            (v4 & 1) != 0)
        || -[MFTriageInteraction messageCount](self, "messageCount") > 1;
  return result;
}

- (id)title
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  if (-[MFTriageInteraction titleIncludesCount](self, "titleIncludesCount"))
  {
    if (-[MFTriageInteraction messageCount](self, "messageCount") < 2)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("ARCHIVE_EMAIL"), &stru_100531B00, CFSTR("Main")));
    }
    else
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("ARCHIVE_FORMAT%1$lu"), &stru_100531B00, CFSTR("Main")));
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v4, -[MFTriageInteraction messageCount](self, "messageCount")));

    }
  }
  else
  {
    v6 = _EFLocalizedString(CFSTR("Archive"), &unk_10059D2A0, &unk_10059D2A8);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v6);
  }
  return v5;
}

- (id)accessibilityIdentifer
{
  return MSAccessibilityIdentifierActionsViewControllerArchiveMessage;
}

- (id)shortTitle
{
  void *v3;
  void *v4;
  void *v5;

  if (-[MFTriageInteraction messageCount](self, "messageCount") < 2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("ARCHIVE"), &stru_100531B00, CFSTR("Main")));
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("SWIPE_ARCHIVE_COUNT"), &stru_100531B00, CFSTR("Main")));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, -[MFTriageInteraction messageCount](self, "messageCount")));

  }
  return v5;
}

- (id)undoTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("OPERATION_ARCHIVE_DESC"), &stru_100531B00, CFSTR("Main")));

  return v3;
}

- (id)color
{
  return +[UIColor mailArchiveActionColor](UIColor, "mailArchiveActionColor");
}

- (id)_iconImageName
{
  return MFImageGlyphArchive;
}

- (id)_previewImageName
{
  return MFImageGlyphArchive;
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
