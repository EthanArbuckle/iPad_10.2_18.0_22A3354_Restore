@implementation GKPlayerInternalOnboarding

- (id)initWithPlayerID:(id)a3
{
  id v4;
  GKPlayerInternalOnboarding *v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GKPlayerInternalOnboarding;
  v5 = -[GKPlayerInternalOnboarding init](&v14, "init");
  if (v5)
  {
    v6 = +[GKAccountServicePrivate lastWelcomeWhatsNewCopyVersionDisplayedForPlayerID:](GKAccountServicePrivate, "lastWelcomeWhatsNewCopyVersionDisplayedForPlayerID:", v4);
    v7 = +[GKAccountServicePrivate lastPrivacyNoticeVersionDisplayedForPlayerID:](GKAccountServicePrivate, "lastPrivacyNoticeVersionDisplayedForPlayerID:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[GKAccountServicePrivate lastPersonalizationVersionDisplayedForPlayerID:](GKAccountServicePrivate, "lastPersonalizationVersionDisplayedForPlayerID:", v4));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKAccountServicePrivate lastProfilePrivacyVersionDisplayedForPlayerID:](GKAccountServicePrivate, "lastProfilePrivacyVersionDisplayedForPlayerID:", v4));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKAccountServicePrivate lastFriendSuggestionsVersionDisplayedForPlayerID:](GKAccountServicePrivate, "lastFriendSuggestionsVersionDisplayedForPlayerID:", v4));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[GKAccountServicePrivate lastContactsIntegrationConsentVersionDisplayedForPlayerID:](GKAccountServicePrivate, "lastContactsIntegrationConsentVersionDisplayedForPlayerID:", v4));
    v12 = objc_msgSend(objc_alloc((Class)GKPlayerInternalOnboarding), "initWithLastWelcomeWhatsNewCopyVersionDisplayed:lastPrivacyNoticeVersionDisplayed:lastPersonalizationVersionDisplayed:lastProfilePrivacyVersionDisplayed:lastFriendSuggestionsVersionDisplayed:lastContactsIntegrationConsentVersionDisplayed:", v6, v7, v8, v9, v10, v11);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

@end
