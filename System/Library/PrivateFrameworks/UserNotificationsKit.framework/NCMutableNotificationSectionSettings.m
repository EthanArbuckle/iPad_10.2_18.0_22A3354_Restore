@implementation NCMutableNotificationSectionSettings

- (void)setUserConfigurable:(BOOL)a3
{
  self->super._userConfigurable = a3;
}

- (void)setShowsCustomSettingsLink:(BOOL)a3
{
  self->super._showsCustomSettingsLink = a3;
}

- (void)setIsDeliveredQuietly:(BOOL)a3
{
  self->super._isDeliveredQuietly = a3;
}

- (void)setIsAppClip:(BOOL)a3
{
  self->super._isAppClip = a3;
}

- (void)setHasProvisionalAuthorization:(BOOL)a3
{
  self->super._hasProvisialAuthorization = a3;
}

- (void)setSettings:(id)a3
{
  NSDictionary *v4;
  NSDictionary *settings;

  v4 = (NSDictionary *)objc_msgSend(a3, "copy");
  settings = self->super._settings;
  self->super._settings = v4;

}

- (void)setSubSectionIdentifier:(id)a3
{
  NSString *v4;
  NSString *subSectionIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  subSectionIdentifier = self->super._subSectionIdentifier;
  self->super._subSectionIdentifier = v4;

}

- (void)setDisplayName:(id)a3
{
  NSString *v4;
  NSString *displayName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  displayName = self->super._displayName;
  self->super._displayName = v4;

}

- (void)setSubSectionSettings:(id)a3
{
  NSSet *v4;
  NSSet *subSectionSettings;

  v4 = (NSSet *)objc_msgSend(a3, "copy");
  subSectionSettings = self->super._subSectionSettings;
  self->super._subSectionSettings = v4;

}

- (void)setSectionIdentifier:(id)a3
{
  NSString *v4;
  NSString *sectionIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  sectionIdentifier = self->super._sectionIdentifier;
  self->super._sectionIdentifier = v4;

}

- (void)setSettingsIcon:(id)a3
{
  objc_storeStrong((id *)&self->super._settingsIcon, a3);
}

- (void)setMuteAssertion:(id)a3
{
  NCNotificationMuteAssertion *v4;
  NCNotificationMuteAssertion *muteAssertion;

  v4 = (NCNotificationMuteAssertion *)objc_msgSend(a3, "copyWithZone:", 0);
  muteAssertion = self->super._muteAssertion;
  self->super._muteAssertion = v4;

}

@end
