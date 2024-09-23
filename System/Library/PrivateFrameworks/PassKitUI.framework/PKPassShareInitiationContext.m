@implementation PKPassShareInitiationContext

- (PKPassShareInitiationContext)init
{

  return 0;
}

- (PKPassShareInitiationContext)initWithFlow:(unint64_t)a3 share:(id)a4
{
  id v7;
  PKPassShareInitiationContext *v8;
  PKPassShareInitiationContext *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PKPassShareInitiationContext;
  v8 = -[PKPassShareInitiationContext init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_flow = a3;
    objc_storeStrong((id *)&v8->_composedShare, a4);
  }

  return v9;
}

- (void)setRecipient:(id)a3 fallbackNickname:(id)a4
{
  id v6;
  PKContact *v7;
  PKContact *recipient;
  void *v9;
  void *v10;
  id v11;
  PKPassShare *composedShare;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  if (v14)
  {
    v7 = (PKContact *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66C48]), "initWithCNContact:", v14);
    recipient = self->_recipient;
    self->_recipient = v7;

  }
  objc_msgSend(MEMORY[0x1E0D67400], "redactedDisplayNameForCounterpartHandle:contact:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9 || !objc_msgSend(v9, "length"))
  {
    v11 = v6;

    v10 = v11;
  }
  composedShare = self->_composedShare;
  -[PKContact contactHandle](self->_recipient, "contactHandle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassShare setRecipientHandle:](composedShare, "setRecipientHandle:", v13);

  -[PKPassShare setRecipientNickname:](self->_composedShare, "setRecipientNickname:", v10);
}

- (BOOL)isShareConfiguredEnoughToBeSentOverChannelWithDisplayableError:(id *)a3 pass:(id)a4
{
  id v6;
  void *v7;
  NSString *v8;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v6 = a4;
  -[PKPassShare recipientNickname](self->_composedShare, "recipientNickname");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {

LABEL_6:
    -[PKPassShare sharedEntitlements](self->_composedShare, "sharedEntitlements");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11)
    {
      LOBYTE(a3) = 1;
      goto LABEL_11;
    }
    if (!a3)
      goto LABEL_11;
    PKLocalizationKeyForPassType();
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    v9 = CFSTR("SHARE_INITIATION_ERROR_NO_ENTITLEMENTS_TITLE");
LABEL_10:
    PKLocalizedShareableCredentialString(&v9->isa);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedShareableCredentialString(v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PKDisplayableErrorCustom();
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a3) = 0;
    goto LABEL_11;
  }
  if (!-[PKPassShareInitiationContext requiresContactSelection](self, "requiresContactSelection"))
    goto LABEL_6;
  if (a3)
  {
    PKLocalizationKeyForPassType();
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    v9 = CFSTR("SHARE_INITIATION_ERROR_NO_RECIPIENT_TITLE");
    goto LABEL_10;
  }
LABEL_11:

  return (char)a3;
}

- (BOOL)requiresContactSelection
{
  return (self->_flow > 6) | (0x1Cu >> self->_flow) & 1;
}

- (unint64_t)flow
{
  return self->_flow;
}

- (void)setFlow:(unint64_t)a3
{
  self->_flow = a3;
}

- (unint64_t)environment
{
  return self->_environment;
}

- (void)setEnvironment:(unint64_t)a3
{
  self->_environment = a3;
}

- (NSArray)blockedChannels
{
  return self->_blockedChannels;
}

- (void)setBlockedChannels:(id)a3
{
  objc_storeStrong((id *)&self->_blockedChannels, a3);
}

- (NSArray)allowedChannels
{
  return self->_allowedChannels;
}

- (void)setAllowedChannels:(id)a3
{
  objc_storeStrong((id *)&self->_allowedChannels, a3);
}

- (NSString)channelBundleIdentifier
{
  return self->_channelBundleIdentifier;
}

- (void)setChannelBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_channelBundleIdentifier, a3);
}

- (PKPassShare)composedShare
{
  return self->_composedShare;
}

- (void)setComposedShare:(id)a3
{
  objc_storeStrong((id *)&self->_composedShare, a3);
}

- (BOOL)hasModifiedEntitlements
{
  return self->_hasModifiedEntitlements;
}

- (void)setHasModifiedEntitlements:(BOOL)a3
{
  self->_hasModifiedEntitlements = a3;
}

- (BOOL)didCreateShare
{
  return self->_didCreateShare;
}

- (void)setDidCreateShare:(BOOL)a3
{
  self->_didCreateShare = a3;
}

- (unint64_t)authenticationType
{
  return self->_authenticationType;
}

- (void)setAuthenticationType:(unint64_t)a3
{
  self->_authenticationType = a3;
}

- (PKContact)recipient
{
  return self->_recipient;
}

- (PKPassShareActivationOptions)availableActivationOptions
{
  return self->_availableActivationOptions;
}

- (void)setAvailableActivationOptions:(id)a3
{
  objc_storeStrong((id *)&self->_availableActivationOptions, a3);
}

- (BOOL)areActivationOptionsUserEditable
{
  return self->_activationOptionsUserEditable;
}

- (void)setActivationOptionsUserEditable:(BOOL)a3
{
  self->_activationOptionsUserEditable = a3;
}

- (NSString)sharePreviewTitle
{
  return self->_sharePreviewTitle;
}

- (void)setSharePreviewTitle:(id)a3
{
  objc_storeStrong((id *)&self->_sharePreviewTitle, a3);
}

- (NSString)sharePreviewSubtitle
{
  return self->_sharePreviewSubtitle;
}

- (void)setSharePreviewSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_sharePreviewSubtitle, a3);
}

- (NSURL)sharePreviewImageURL
{
  return self->_sharePreviewImageURL;
}

- (void)setSharePreviewImageURL:(id)a3
{
  objc_storeStrong((id *)&self->_sharePreviewImageURL, a3);
}

- (UIImage)sharePreviewFallbackImage
{
  return self->_sharePreviewFallbackImage;
}

- (void)setSharePreviewFallbackImage:(id)a3
{
  objc_storeStrong((id *)&self->_sharePreviewFallbackImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharePreviewFallbackImage, 0);
  objc_storeStrong((id *)&self->_sharePreviewImageURL, 0);
  objc_storeStrong((id *)&self->_sharePreviewSubtitle, 0);
  objc_storeStrong((id *)&self->_sharePreviewTitle, 0);
  objc_storeStrong((id *)&self->_availableActivationOptions, 0);
  objc_storeStrong((id *)&self->_recipient, 0);
  objc_storeStrong((id *)&self->_composedShare, 0);
  objc_storeStrong((id *)&self->_channelBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_allowedChannels, 0);
  objc_storeStrong((id *)&self->_blockedChannels, 0);
}

@end
