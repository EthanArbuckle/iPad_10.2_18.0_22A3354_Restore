@implementation MFRemoveFollowUpTriageInteraction

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
    v4 = objc_alloc((Class)MSRemoveFollowUpTriageAction);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction messageListItemSelection](self, "messageListItemSelection"));
    v6 = (MSTriageAction *)objc_msgSend(v4, "initWithMessageListSelection:origin:actor:delegate:followUp:", v5, -[MFTriageInteraction origin](self, "origin"), -[MFTriageInteraction actor](self, "actor"), 0, 0);
    v7 = self->_triageAction;
    self->_triageAction = v6;

    triageAction = self->_triageAction;
  }
  return triageAction;
}

- (BOOL)isPermitted
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction messageListItemSelection](self, "messageListItemSelection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "messageListItems"));
  v4 = objc_msgSend(v3, "ef_any:", &stru_100522628);

  return v4;
}

- (id)shortTitle
{
  return (id)_EFLocalizedString(CFSTR("Ignore"), &unk_10059D2A0, &unk_10059D2A8);
}

- (id)title
{
  return (id)_EFLocalizedString(CFSTR("Clear Follow Up Suggestion"), &unk_10059D2A0, &unk_10059D2A8);
}

- (id)color
{
  return +[UIColor mailRemoveFollowUpColor](UIColor, "mailRemoveFollowUpColor");
}

- (id)_iconImageName
{
  return MFImageGlyphRemoveFollowUp;
}

- (id)_previewImageName
{
  return MFImageGlyphRemoveFollowUp;
}

- (BOOL)isDestructive
{
  return 1;
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
