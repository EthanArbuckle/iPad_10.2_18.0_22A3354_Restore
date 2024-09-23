@implementation MFReadTriageInteraction

- (id)triageAction
{
  void *v3;
  id v4;
  void *v5;
  MSTriageAction *v6;
  MSTriageAction *triageAction;

  if (!self->_triageAction)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction query](self, "query"));

    v4 = objc_alloc((Class)MSReadTriageAction);
    if (v3)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction query](self, "query"));
      v6 = (MSTriageAction *)objc_msgSend(v4, "initWithQuery:origin:actor:delegate:reason:", v5, -[MFTriageInteraction origin](self, "origin"), -[MFTriageInteraction actor](self, "actor"), self, -[MFFlagChangeTriageInteraction reason](self, "reason"));
    }
    else
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction messageListItemSelection](self, "messageListItemSelection"));
      v6 = (MSTriageAction *)objc_msgSend(v4, "initWithMessageListSelection:origin:actor:delegate:reason:", v5, -[MFTriageInteraction origin](self, "origin"), -[MFTriageInteraction actor](self, "actor"), self, -[MFFlagChangeTriageInteraction reason](self, "reason"));
    }
    triageAction = self->_triageAction;
    self->_triageAction = v6;

  }
  return self->_triageAction;
}

- (id)title
{
  unsigned int v3;
  uint64_t v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v3 = -[MFFlagChangeTriageInteraction flagState](self, "flagState");
  v4 = -[MFTriageInteraction messageCount](self, "messageCount");
  if (v4 >= 2 && -[MFTriageInteraction titleIncludesAllMessages](self, "titleIncludesAllMessages"))
  {
    if (v3)
      v5 = CFSTR("Mark All as Unread");
    else
      v5 = CFSTR("Mark All as Read");
    v13 = _EFLocalizedString(v5, &unk_10059D2A0, &unk_10059D2A8);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v13);
  }
  else if (-[MFTriageInteraction isSelectAll](self, "isSelectAll")
         || !-[MFTriageInteraction titleIncludesCount](self, "titleIncludesCount")
         || v4 == 1)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = v9;
    if (v3)
      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("MARK_EMAIL_UNREAD"), &stru_100531B00, CFSTR("Main")));
    else
      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("MARK_EMAIL_READ"), &stru_100531B00, CFSTR("Main")));
    v12 = (void *)v11;

  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = v6;
    if (v3)
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("MARK_EMAIL_UNREAD%1$lu"), &stru_100531B00, CFSTR("Main")));
    else
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("MARK_EMAIL_READ%1$lu"), &stru_100531B00, CFSTR("Main")));
    v14 = (void *)v8;

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v14, v4));
  }
  return v12;
}

- (id)accessibilityIdentifer
{
  return MSAccessibilityIdentifierActionsViewControllerMarkAsUnread;
}

- (id)shortTitle
{
  unsigned int v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = -[MFFlagChangeTriageInteraction flagState](self, "flagState");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = v3;
  if (v2)
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("SWIPE_MARK_AS_UNREAD"), &stru_100531B00, CFSTR("Main")));
  else
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("SWIPE_MARK_AS_READ"), &stru_100531B00, CFSTR("Main")));
  v6 = (void *)v5;

  return v6;
}

- (id)undoTitle
{
  unsigned int v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = -[MFFlagChangeTriageInteraction flagState](self, "flagState");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = v3;
  if (v2)
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("OPERATION_UNREAD_DESC"), &stru_100531B00, CFSTR("Main")));
  else
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("OPERATION_READ_DESC"), &stru_100531B00, CFSTR("Main")));
  v6 = (void *)v5;

  return v6;
}

- (id)color
{
  return +[UIColor mailInteractiveColor](UIColor, "mailInteractiveColor");
}

- (id)_iconImageName
{
  unsigned int v2;
  id *v3;

  v2 = -[MFFlagChangeTriageInteraction flagState](self, "flagState");
  v3 = (id *)&MFImageGlyphUnread;
  if (!v2)
    v3 = (id *)&MFImageGlyphRead;
  return *v3;
}

- (id)_previewImageName
{
  unsigned int v2;
  id *v3;

  v2 = -[MFFlagChangeTriageInteraction flagState](self, "flagState");
  v3 = (id *)&MFImageGlyphUnread;
  if (!v2)
    v3 = (id *)&MFImageGlyphRead;
  return *v3;
}

- (BOOL)shouldOverrideFlageStateForTriageAction:(id)a3
{
  void *v4;
  char v5;

  if (-[MFTriageInteraction shouldOverrideFlagState](self, "shouldOverrideFlagState", a3))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction delegate](self, "delegate"));
    v5 = objc_opt_respondsToSelector(v4, "flagStateForFlagChangeTriageInteraction:");

  }
  else
  {
    v5 = 0;
  }
  return v5 & 1;
}

- (BOOL)overrideFlagStateForTriageAction:(id)a3
{
  void *v4;
  unsigned __int8 v5;

  if (!-[MFTriageInteraction shouldOverrideFlagState](self, "shouldOverrideFlagState", a3))
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v4, "flagStateForFlagChangeTriageInteraction:") & 1) != 0)
    v5 = objc_msgSend(v4, "flagStateForFlagChangeTriageInteraction:", self);
  else
    v5 = 0;

  return v5;
}

- (void)setTriageAction:(id)a3
{
  objc_storeStrong((id *)&self->_triageAction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triageAction, 0);
}

@end
