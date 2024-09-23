@implementation MFMuteTriageInteraction

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
    v4 = objc_alloc((Class)MSMuteTriageAction);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction messageListItemSelection](self, "messageListItemSelection"));
    v6 = (MSTriageAction *)objc_msgSend(v4, "initWithMessageListSelection:origin:actor:delegate:reason:", v5, -[MFTriageInteraction origin](self, "origin"), -[MFTriageInteraction actor](self, "actor"), 0, -[MFFlagChangeTriageInteraction reason](self, "reason"));
    v7 = self->_triageAction;
    self->_triageAction = v6;

    triageAction = self->_triageAction;
  }
  return triageAction;
}

- (BOOL)flagState
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationFlagTriageInteraction referenceMessage](self, "referenceMessage"));
  v3 = objc_msgSend(v2, "conversationNotificationLevel") == (id)1;

  return v3;
}

- (BOOL)isPermitted
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationFlagTriageInteraction referenceMessage](self, "referenceMessage"));
  v3 = objc_msgSend(v2, "conversationNotificationLevel") != (id)2;

  return v3;
}

- (id)title
{
  unsigned int v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = -[MFMuteTriageInteraction flagState](self, "flagState");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = v3;
  if (v2)
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("UNMUTE"), &stru_100531B00, CFSTR("Main")));
  else
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("MUTE"), &stru_100531B00, CFSTR("Main")));
  v6 = (void *)v5;

  return v6;
}

- (id)accessibilityIdentifer
{
  return MSAccessibilityIdentifierActionsViewControllerMute;
}

- (id)_iconImageName
{
  unsigned int v2;
  id *v3;

  v2 = -[MFMuteTriageInteraction flagState](self, "flagState");
  v3 = (id *)&MFImageGlyphMute;
  if (!v2)
    v3 = (id *)&MFImageGlyphUnMute;
  return *v3;
}

- (id)_previewImageName
{
  unsigned int v2;
  id *v3;

  v2 = -[MFMuteTriageInteraction flagState](self, "flagState");
  v3 = (id *)&MFImageGlyphMute;
  if (!v2)
    v3 = (id *)&MFImageGlyphUnMute;
  return *v3;
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
