@implementation MFForwardTriageInteraction

- (MFForwardTriageInteraction)init
{
  MFForwardTriageInteraction *v2;
  MFForwardTriageInteraction *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MFForwardTriageInteraction;
  v2 = -[MFMessageCompositionTriageInteraction init](&v5, "init");
  v3 = v2;
  if (v2)
    -[MFMessageCompositionTriageInteraction setAttachmentPolicy:](v2, "setAttachmentPolicy:", 2);
  return v3;
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
  objc_msgSend(v4, "composeFowardStartedForMessage:", v8);

  v5 = objc_alloc((Class)_MFMailCompositionContext);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageCompositionTriageInteraction message](self, "message"));
  v7 = objc_msgSend(v5, "initForwardOfMessage:legacyMessage:isEML:", v8, v6, -[MFMessageCompositionTriageInteraction isActingOnEML](self, "isActingOnEML"));

  objc_msgSend(v7, "setPrefersFirstLineSelection:", 1);
  -[MFMessageCompositionTriageInteraction presentComposeWithContext:](self, "presentComposeWithContext:", v7);

}

- (id)title
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("FORWARD"), &stru_100531B00, CFSTR("Main")));

  return v3;
}

- (id)accessibilityIdentifer
{
  return MSAccessibilityIdentifierActionsViewControllerFoward;
}

- (id)_iconImageName
{
  return MFImageGlyphForwardFill;
}

- (id)_previewImageName
{
  return MFImageGlyphForward;
}

- (unint64_t)includeAttachmentsByDefault
{
  return 0;
}

- (BOOL)includeAttachmentsWithoutPrompting
{
  return 1;
}

@end
