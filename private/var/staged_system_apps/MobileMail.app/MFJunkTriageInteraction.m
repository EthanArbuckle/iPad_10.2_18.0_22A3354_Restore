@implementation MFJunkTriageInteraction

- (id)triageAction
{
  MSTriageAction *triageAction;
  id v4;
  void *v5;
  MSTriageAction *v6;
  MSTriageAction *v7;

  triageAction = self->_triageAction;
  if (!triageAction)
  {
    v4 = objc_alloc((Class)MSJunkTriageAction);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction messageListItemSelection](self, "messageListItemSelection"));
    v6 = (MSTriageAction *)objc_msgSend(v4, "initWithMessageListSelection:origin:actor:delegate:", v5, -[MFTriageInteraction origin](self, "origin"), -[MFTriageInteraction actor](self, "actor"), self);
    v7 = self->_triageAction;
    self->_triageAction = v6;

    triageAction = self->_triageAction;
  }
  return triageAction;
}

- (BOOL)flagState
{
  void *v2;
  char v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFJunkTriageInteraction triageAction](self, "triageAction"));
  v3 = objc_msgSend(v2, "hasNonJunkMessages") ^ 1;

  return v3;
}

- (id)title
{
  unsigned int v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = -[MFJunkTriageInteraction flagState](self, "flagState");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = v3;
  if (v2)
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("MARK_EMAIL_NOT_JUNK"), &stru_100531B00, CFSTR("Main")));
  else
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("MARK_EMAIL_JUNK"), &stru_100531B00, CFSTR("Main")));
  v6 = (void *)v5;

  return v6;
}

- (id)accessibilityIdentifer
{
  return MSAccessibilityIdentifierActionsViewControllerMoveToJunk;
}

- (id)shortTitle
{
  unsigned int v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = -[MFJunkTriageInteraction flagState](self, "flagState");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = v3;
  if (v2)
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("SWIPE_NOT_JUNK"), &stru_100531B00, CFSTR("Main")));
  else
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("SWIPE_JUNK"), &stru_100531B00, CFSTR("Main")));
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

  v2 = -[MFJunkTriageInteraction flagState](self, "flagState");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = v3;
  if (v2)
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("OPERATION_NOT_JUNK_DESC"), &stru_100531B00, CFSTR("Main")));
  else
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("OPERATION_JUNK_DESC"), &stru_100531B00, CFSTR("Main")));
  v6 = (void *)v5;

  return v6;
}

- (id)cardTitle
{
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unsigned int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v3 = -[MFTriageInteraction messageCount](self, "messageCount");
  if (v3 >= 2 && (v4 = v3, -[MFTriageInteraction titleIncludesCount](self, "titleIncludesCount")))
  {
    v5 = -[MFJunkTriageInteraction flagState](self, "flagState");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = v6;
    if (v5)
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("MARK_NOT_JUNK_FORMAT%1$ld"), &stru_100531B00, CFSTR("Main")));
    else
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("MARK_JUNK_FORMAT%1$ld"), &stru_100531B00, CFSTR("Main")));
    v11 = (void *)v8;

    v12 = objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v11, v4));
  }
  else
  {
    v9 = -[MFJunkTriageInteraction flagState](self, "flagState");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v11 = v10;
    if (v9)
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("MARK_EMAIL_NOT_JUNK"), &stru_100531B00, CFSTR("Main")));
    else
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("MARK_EMAIL_JUNK"), &stru_100531B00, CFSTR("Main")));
  }
  v13 = (void *)v12;

  return v13;
}

- (id)color
{
  return +[UIColor mailFlaggedColor](UIColor, "mailFlaggedColor");
}

- (id)_iconImageName
{
  return MFImageGlyphJunk;
}

- (id)_previewImageName
{
  return MFImageGlyphJunk;
}

- (BOOL)needShrinkAnimationAfterCompletion
{
  return 1;
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
