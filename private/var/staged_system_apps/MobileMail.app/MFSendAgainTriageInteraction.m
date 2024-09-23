@implementation MFSendAgainTriageInteraction

- (MFSendAgainTriageInteraction)init
{
  MFSendAgainTriageInteraction *v2;
  MFSendAgainTriageInteraction *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MFSendAgainTriageInteraction;
  v2 = -[MFMessageCompositionTriageInteraction init](&v5, "init");
  v3 = v2;
  if (v2)
    -[MFMessageCompositionTriageInteraction setAttachmentPolicy:](v2, "setAttachmentPolicy:", 1);
  return v3;
}

- (void)_performInteraction_Internal
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = objc_alloc((Class)_MFMailCompositionContext);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageCompositionTriageInteraction emailMessage](self, "emailMessage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageCompositionTriageInteraction message](self, "message"));
  v6 = objc_msgSend(v3, "initSendAgainDraftOfMessage:legacyMessage:", v4, v5);

  -[MFMessageCompositionTriageInteraction presentComposeWithContext:](self, "presentComposeWithContext:", v6);
}

- (BOOL)isPermitted
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageCompositionTriageInteraction emailMessage](self, "emailMessage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "mailboxes"));
  v4 = objc_msgSend(v3, "ef_any:", &stru_100522AC8);

  return v4;
}

- (BOOL)includeAttachments
{
  return 1;
}

- (id)title
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SEND_AGAIN"), &stru_100531B00, CFSTR("Main")));

  return v3;
}

- (id)_iconImageName
{
  return MFImageGlyphSendAgain;
}

- (id)_previewImageName
{
  return MFImageGlyphSendAgain;
}

@end
