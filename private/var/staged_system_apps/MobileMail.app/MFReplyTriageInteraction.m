@implementation MFReplyTriageInteraction

- (MFReplyTriageInteraction)init
{
  MFReplyTriageInteraction *v2;
  id v3;
  void *v4;
  unsigned int v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MFReplyTriageInteraction;
  v2 = -[MFMessageCompositionTriageInteraction init](&v7, "init");
  if (v2)
  {
    v3 = sub_1001D6C98(0);
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    v5 = objc_msgSend(v4, "isEqualToString:", IncludeAttachmentRepliesWhenAdding);

    if (v5)
      -[MFMessageCompositionTriageInteraction setAttachmentPolicy:](v2, "setAttachmentPolicy:", 0);
  }
  return v2;
}

- (void)_performInteraction_Internal
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(-[MFMessageCompositionTriageInteraction emailMessage](self, "emailMessage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageCompositionTriageInteraction daemonInterface](self, "daemonInterface"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "interactionLogger"));
  objc_msgSend(v4, "composeReplyStartedForMessage:", v8);

  v5 = objc_alloc((Class)_MFMailCompositionContext);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageCompositionTriageInteraction message](self, "message"));
  v7 = objc_msgSend(v5, "initReplyToMessage:legacyMessage:isEML:", v8, v6, -[MFMessageCompositionTriageInteraction isActingOnEML](self, "isActingOnEML"));

  -[MFMessageCompositionTriageInteraction presentComposeWithContext:](self, "presentComposeWithContext:", v7);
}

- (id)title
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("REPLY"), &stru_100531B00, CFSTR("Main")));

  return v3;
}

- (id)accessibilityIdentifer
{
  return MSAccessibilityIdentifierActionsViewControllerReply;
}

- (id)_iconImageName
{
  return MFImageGlyphReplyFill;
}

- (id)_previewImageName
{
  return MFImageGlyphReply;
}

- (unint64_t)includeAttachmentsByDefault
{
  id v2;
  void *v3;
  unint64_t v4;

  v2 = sub_1001D6C98(0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  if ((objc_msgSend(v3, "isEqualToString:", IncludeAttachmentRepliesAlways) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", IncludeAttachmentRepliesNever) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", IncludeAttachmentRepliesWhenAdding);
  }

  return v4;
}

- (BOOL)includeAttachmentsWithoutPrompting
{
  id v2;
  void *v3;
  unsigned __int8 v4;

  v2 = sub_1001D6C98(0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  if ((objc_msgSend(v3, "isEqualToString:", IncludeAttachmentRepliesAlways) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", IncludeAttachmentRepliesAsk);

  return v4;
}

@end
