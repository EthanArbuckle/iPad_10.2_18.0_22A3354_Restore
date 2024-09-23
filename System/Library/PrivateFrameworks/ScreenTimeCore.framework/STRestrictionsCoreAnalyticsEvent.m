@implementation STRestrictionsCoreAnalyticsEvent

- (STRestrictionsCoreAnalyticsEvent)initWithContentAndPrivacyRestrictionsEnabled:(BOOL)a3 mediaAndAppleMusicIsRestricted:(BOOL)a4 gameCenterMultiplayerGamesIsRestricted:(BOOL)a5 gameCenterAddingFriendsIsRestricted:(BOOL)a6 gameCenterConnectWithFriendsIsRestricted:(BOOL)a7 gameCenterScreenRecordingIsRestricted:(BOOL)a8 gameCenterNearbyMultiplayerIsRestricted:(BOOL)a9 gameCenterPrivateMessagingIsRestricted:(BOOL)a10 gameCenterProfilePrivacyChangesIsRestricted:(BOOL)a11 gameCenterAvatarAndNicknameChangesIsRestricted:(BOOL)a12 userAgeGroup:(int64_t)a13 userIsManaged:(BOOL)a14
{
  STRestrictionsCoreAnalyticsEvent *result;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)STRestrictionsCoreAnalyticsEvent;
  result = -[STRestrictionsCoreAnalyticsEvent init](&v21, sel_init);
  result->_contentAndPrivacyRestrictionsEnabled = a3;
  result->_mediaAndAppleMusicIsRestricted = a4;
  result->_gameCenterMultiplayerGamesIsRestricted = a5;
  result->_gameCenterAddingFriendsIsRestricted = a6;
  result->_gameCenterConnectWithFriendsIsRestricted = a7;
  result->_gameCenterScreenRecordingIsRestricted = a8;
  result->_gameCenterNearbyMultiplayerIsRestricted = a9;
  result->_gameCenterPrivateMessagingIsRestricted = a10;
  result->_gameCenterProfilePrivacyChangesIsRestricted = a11;
  result->_gameCenterAvatarAndNicknameChangesIsRestricted = a12;
  result->_userAgeGroup = a13;
  result->_userIsManaged = a14;
  return result;
}

- (NSString)name
{
  return (NSString *)CFSTR("com.apple.ScreenTime.contentAndPrivacyRestrictionsChanged");
}

+ (id)description
{
  return CFSTR("ContentAndPrivacyRestrictionsChanged");
}

- (NSDictionary)payload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[12];
  _QWORD v18[14];

  v18[12] = *MEMORY[0x1E0C80C00];
  v17[0] = CFSTR("contentAndPrivacyRestrictionsEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[STRestrictionsCoreAnalyticsEvent contentAndPrivacyRestrictionsEnabled](self, "contentAndPrivacyRestrictionsEnabled"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v16;
  v17[1] = CFSTR("mediaAndAppleMusicIsRestricted");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[STRestrictionsCoreAnalyticsEvent mediaAndAppleMusicIsRestricted](self, "mediaAndAppleMusicIsRestricted"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v15;
  v17[2] = CFSTR("gameCenterMultiplayerGamesIsRestricted");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[STRestrictionsCoreAnalyticsEvent gameCenterMultiplayerGamesIsRestricted](self, "gameCenterMultiplayerGamesIsRestricted"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v14;
  v17[3] = CFSTR("gameCenterAddingFriendsIsRestricted");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[STRestrictionsCoreAnalyticsEvent gameCenterAddingFriendsIsRestricted](self, "gameCenterAddingFriendsIsRestricted"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v3;
  v17[4] = CFSTR("gameCenterConnectWithFriendsIsRestricted");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[STRestrictionsCoreAnalyticsEvent gameCenterConnectWithFriendsIsRestricted](self, "gameCenterConnectWithFriendsIsRestricted"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[4] = v4;
  v17[5] = CFSTR("gameCenterScreenRecordingIsRestricted");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[STRestrictionsCoreAnalyticsEvent gameCenterScreenRecordingIsRestricted](self, "gameCenterScreenRecordingIsRestricted"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[5] = v5;
  v17[6] = CFSTR("gameCenterNearbyMultiplayerIsRestricted");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[STRestrictionsCoreAnalyticsEvent gameCenterNearbyMultiplayerIsRestricted](self, "gameCenterNearbyMultiplayerIsRestricted"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[6] = v6;
  v17[7] = CFSTR("gameCenterPrivateMessagingIsRestricted");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[STRestrictionsCoreAnalyticsEvent gameCenterPrivateMessagingIsRestricted](self, "gameCenterPrivateMessagingIsRestricted"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[7] = v7;
  v17[8] = CFSTR("gameCenterProfilePrivacyChangesIsRestricted");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[STRestrictionsCoreAnalyticsEvent gameCenterProfilePrivacyChangesIsRestricted](self, "gameCenterProfilePrivacyChangesIsRestricted"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[8] = v8;
  v17[9] = CFSTR("gameCenterAvatarAndNicknameChangesIsRestricted");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[STRestrictionsCoreAnalyticsEvent gameCenterAvatarAndNicknameChangesIsRestricted](self, "gameCenterAvatarAndNicknameChangesIsRestricted"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[9] = v9;
  v17[10] = CFSTR("userAgeGroup");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[STRestrictionsCoreAnalyticsEvent userAgeGroup](self, "userAgeGroup"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[10] = v10;
  v17[11] = CFSTR("userIsManaged");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[STRestrictionsCoreAnalyticsEvent userIsManaged](self, "userIsManaged"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[11] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 12);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (BOOL)contentAndPrivacyRestrictionsEnabled
{
  return self->_contentAndPrivacyRestrictionsEnabled;
}

- (BOOL)mediaAndAppleMusicIsRestricted
{
  return self->_mediaAndAppleMusicIsRestricted;
}

- (BOOL)gameCenterMultiplayerGamesIsRestricted
{
  return self->_gameCenterMultiplayerGamesIsRestricted;
}

- (BOOL)gameCenterAddingFriendsIsRestricted
{
  return self->_gameCenterAddingFriendsIsRestricted;
}

- (BOOL)gameCenterConnectWithFriendsIsRestricted
{
  return self->_gameCenterConnectWithFriendsIsRestricted;
}

- (BOOL)gameCenterScreenRecordingIsRestricted
{
  return self->_gameCenterScreenRecordingIsRestricted;
}

- (BOOL)gameCenterNearbyMultiplayerIsRestricted
{
  return self->_gameCenterNearbyMultiplayerIsRestricted;
}

- (BOOL)gameCenterPrivateMessagingIsRestricted
{
  return self->_gameCenterPrivateMessagingIsRestricted;
}

- (BOOL)gameCenterProfilePrivacyChangesIsRestricted
{
  return self->_gameCenterProfilePrivacyChangesIsRestricted;
}

- (BOOL)gameCenterAvatarAndNicknameChangesIsRestricted
{
  return self->_gameCenterAvatarAndNicknameChangesIsRestricted;
}

- (int64_t)userAgeGroup
{
  return self->_userAgeGroup;
}

- (BOOL)userIsManaged
{
  return self->_userIsManaged;
}

@end
