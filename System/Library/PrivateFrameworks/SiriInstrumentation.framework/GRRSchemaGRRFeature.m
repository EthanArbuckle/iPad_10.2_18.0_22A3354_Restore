@implementation GRRSchemaGRRFeature

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GRRSchemaGRRFeature;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GRRSchemaGRRFeature applicationsInForeground](self, "applicationsInForeground");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[GRRSchemaGRRFeature deleteApplicationsInForeground](self, "deleteApplicationsInForeground");
  -[GRRSchemaGRRFeature topTopics](self, "topTopics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[GRRSchemaGRRFeature deleteTopTopics](self, "deleteTopTopics");

  return v5;
}

- (void)setApplicationsInForeground:(id)a3
{
  GRRSchemaGRRStringList *v4;
  NSString *configuredSiriLanguage;
  NSString *inputOrigin;
  NSString *previousFlowDomain;
  GRRSchemaGRRStringList *topTopics;
  GRRSchemaGRRStringList *applicationsInForeground;

  v4 = (GRRSchemaGRRStringList *)a3;
  self->_asrRank = 0;
  self->_canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_contactHasRequestedAddressDetail = 0;
  self->_contactMatchConfidence = 0.0;
  self->_deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_isActiveAlarmPresent = 0;
  self->_isActiveAppointmentPresent = 0;
  self->_isAnnounceEnabled = 0;
  self->_isAudioPlaying = 0;
  self->_isAppInstalled = 0;
  self->_isAppMatchPresent = 0;
  self->_isAppRunning = 0;
  self->_isArtistPresent = 0;
  self->_isContactNameResolved = 0;
  self->_isEmailAvailable = 0;
  self->_isFollowUp = 0;
  self->_isMediaItemEntityPresent = 0;
  self->_isMessagingPossible = 0;
  self->_isMessagingPossibleForSendMessageIntent = 0;
  self->_isPhoneCallPossible = 0;
  self->_isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_isPhoneNumberAvailable = 0;
  self->_isPhoneNumberContactResolvable = 0;
  self->_isPreviousTurnSendEmptyMessage = 0;
  self->_isSettingOn = 0;
  self->_isTimerActive = 0;
  self->_isVideoPlaying = 0;
  self->_numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_requestTimeBeginMs = 0;
  self->_sharingAppActive = 0;
  self->_sharingEntityPresent = 0;
  self->_sharingRecipientPresent = 0;
  self->_smsAttachmentExists = 0;
  self->_smsAttributeRecipientExists = 0;
  self->_smsAttributeSenderExists = 0;
  self->_smsPhoneNumberMentioned = 0;
  self->_smsTextPayloadExists = 0;
  self->_timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_whichFeature = v4 != 0;
  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = v4;

}

- (GRRSchemaGRRStringList)applicationsInForeground
{
  if (self->_whichFeature == 1)
    return self->_applicationsInForeground;
  else
    return (GRRSchemaGRRStringList *)0;
}

- (void)deleteApplicationsInForeground
{
  GRRSchemaGRRStringList *applicationsInForeground;

  if (self->_whichFeature == 1)
  {
    self->_whichFeature = 0;
    applicationsInForeground = self->_applicationsInForeground;
    self->_applicationsInForeground = 0;

  }
}

- (void)setAsrRank:(unsigned int)a3
{
  GRRSchemaGRRStringList *applicationsInForeground;
  NSString *configuredSiriLanguage;
  NSString *inputOrigin;
  NSString *previousFlowDomain;
  GRRSchemaGRRStringList *topTopics;

  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;

  self->_canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_contactHasRequestedAddressDetail = 0;
  self->_contactMatchConfidence = 0.0;
  self->_deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_isActiveAlarmPresent = 0;
  self->_isActiveAppointmentPresent = 0;
  self->_isAnnounceEnabled = 0;
  self->_isAudioPlaying = 0;
  self->_isAppInstalled = 0;
  self->_isAppMatchPresent = 0;
  self->_isAppRunning = 0;
  self->_isArtistPresent = 0;
  self->_isContactNameResolved = 0;
  self->_isEmailAvailable = 0;
  self->_isFollowUp = 0;
  self->_isMediaItemEntityPresent = 0;
  self->_isMessagingPossible = 0;
  self->_isMessagingPossibleForSendMessageIntent = 0;
  self->_isPhoneCallPossible = 0;
  self->_isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_isPhoneNumberAvailable = 0;
  self->_isPhoneNumberContactResolvable = 0;
  self->_isPreviousTurnSendEmptyMessage = 0;
  self->_isSettingOn = 0;
  self->_isTimerActive = 0;
  self->_isVideoPlaying = 0;
  self->_numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_requestTimeBeginMs = 0;
  self->_sharingAppActive = 0;
  self->_sharingEntityPresent = 0;
  self->_sharingRecipientPresent = 0;
  self->_smsAttachmentExists = 0;
  self->_smsAttributeRecipientExists = 0;
  self->_smsAttributeSenderExists = 0;
  self->_smsPhoneNumberMentioned = 0;
  self->_smsTextPayloadExists = 0;
  self->_timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_whichFeature = 2;
  self->_asrRank = a3;
}

- (unsigned)asrRank
{
  if (self->_whichFeature == 2)
    return self->_asrRank;
  else
    return 0;
}

- (void)deleteAsrRank
{
  if (self->_whichFeature == 2)
  {
    self->_whichFeature = 0;
    self->_asrRank = 0;
  }
}

- (void)setCanResolveContactByRelationship:(BOOL)a3
{
  GRRSchemaGRRStringList *applicationsInForeground;
  NSString *configuredSiriLanguage;
  NSString *inputOrigin;
  NSString *previousFlowDomain;
  GRRSchemaGRRStringList *topTopics;

  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;

  self->_asrRank = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_contactHasRequestedAddressDetail = 0;
  self->_contactMatchConfidence = 0.0;
  self->_deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_isActiveAlarmPresent = 0;
  self->_isActiveAppointmentPresent = 0;
  self->_isAnnounceEnabled = 0;
  self->_isAudioPlaying = 0;
  self->_isAppInstalled = 0;
  self->_isAppMatchPresent = 0;
  self->_isAppRunning = 0;
  self->_isArtistPresent = 0;
  self->_isContactNameResolved = 0;
  self->_isEmailAvailable = 0;
  self->_isFollowUp = 0;
  self->_isMediaItemEntityPresent = 0;
  self->_isMessagingPossible = 0;
  self->_isMessagingPossibleForSendMessageIntent = 0;
  self->_isPhoneCallPossible = 0;
  self->_isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_isPhoneNumberAvailable = 0;
  self->_isPhoneNumberContactResolvable = 0;
  self->_isPreviousTurnSendEmptyMessage = 0;
  self->_isSettingOn = 0;
  self->_isTimerActive = 0;
  self->_isVideoPlaying = 0;
  self->_numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_requestTimeBeginMs = 0;
  self->_sharingAppActive = 0;
  self->_sharingEntityPresent = 0;
  self->_sharingRecipientPresent = 0;
  self->_smsAttachmentExists = 0;
  self->_smsAttributeRecipientExists = 0;
  self->_smsAttributeSenderExists = 0;
  self->_smsPhoneNumberMentioned = 0;
  self->_smsTextPayloadExists = 0;
  self->_timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_whichFeature = 3;
  self->_canResolveContactByRelationship = a3;
}

- (BOOL)canResolveContactByRelationship
{
  return self->_whichFeature == 3 && self->_canResolveContactByRelationship;
}

- (void)deleteCanResolveContactByRelationship
{
  if (self->_whichFeature == 3)
  {
    self->_whichFeature = 0;
    self->_canResolveContactByRelationship = 0;
  }
}

- (void)setConfiguredSiriLanguage:(id)a3
{
  GRRSchemaGRRStringList *applicationsInForeground;
  NSString *inputOrigin;
  NSString *previousFlowDomain;
  GRRSchemaGRRStringList *topTopics;
  NSString *v8;
  NSString *configuredSiriLanguage;
  id v10;

  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;
  v10 = a3;

  self->_asrRank = 0;
  self->_canResolveContactByRelationship = 0;
  self->_contactHasRequestedAddressDetail = 0;
  self->_contactMatchConfidence = 0.0;
  self->_deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_isActiveAlarmPresent = 0;
  self->_isActiveAppointmentPresent = 0;
  self->_isAnnounceEnabled = 0;
  self->_isAudioPlaying = 0;
  self->_isAppInstalled = 0;
  self->_isAppMatchPresent = 0;
  self->_isAppRunning = 0;
  self->_isArtistPresent = 0;
  self->_isContactNameResolved = 0;
  self->_isEmailAvailable = 0;
  self->_isFollowUp = 0;
  self->_isMediaItemEntityPresent = 0;
  self->_isMessagingPossible = 0;
  self->_isMessagingPossibleForSendMessageIntent = 0;
  self->_isPhoneCallPossible = 0;
  self->_isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_isPhoneNumberAvailable = 0;
  self->_isPhoneNumberContactResolvable = 0;
  self->_isPreviousTurnSendEmptyMessage = 0;
  self->_isSettingOn = 0;
  self->_isTimerActive = 0;
  self->_isVideoPlaying = 0;
  self->_numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_requestTimeBeginMs = 0;
  self->_sharingAppActive = 0;
  self->_sharingEntityPresent = 0;
  self->_sharingRecipientPresent = 0;
  self->_smsAttachmentExists = 0;
  self->_smsAttributeRecipientExists = 0;
  self->_smsAttributeSenderExists = 0;
  self->_smsPhoneNumberMentioned = 0;
  self->_smsTextPayloadExists = 0;
  self->_timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_whichFeature = 4 * (v10 != 0);
  v8 = (NSString *)objc_msgSend(v10, "copy");
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = v8;

}

- (NSString)configuredSiriLanguage
{
  if (self->_whichFeature == 4)
    return self->_configuredSiriLanguage;
  else
    return (NSString *)0;
}

- (void)deleteConfiguredSiriLanguage
{
  NSString *configuredSiriLanguage;

  if (self->_whichFeature == 4)
  {
    self->_whichFeature = 0;
    configuredSiriLanguage = self->_configuredSiriLanguage;
    self->_configuredSiriLanguage = 0;

  }
}

- (void)setContactHasRequestedAddressDetail:(BOOL)a3
{
  GRRSchemaGRRStringList *applicationsInForeground;
  NSString *configuredSiriLanguage;
  NSString *inputOrigin;
  NSString *previousFlowDomain;
  GRRSchemaGRRStringList *topTopics;

  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;

  self->_asrRank = 0;
  self->_canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_contactMatchConfidence = 0.0;
  self->_deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_isActiveAlarmPresent = 0;
  self->_isActiveAppointmentPresent = 0;
  self->_isAnnounceEnabled = 0;
  self->_isAudioPlaying = 0;
  self->_isAppInstalled = 0;
  self->_isAppMatchPresent = 0;
  self->_isAppRunning = 0;
  self->_isArtistPresent = 0;
  self->_isContactNameResolved = 0;
  self->_isEmailAvailable = 0;
  self->_isFollowUp = 0;
  self->_isMediaItemEntityPresent = 0;
  self->_isMessagingPossible = 0;
  self->_isMessagingPossibleForSendMessageIntent = 0;
  self->_isPhoneCallPossible = 0;
  self->_isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_isPhoneNumberAvailable = 0;
  self->_isPhoneNumberContactResolvable = 0;
  self->_isPreviousTurnSendEmptyMessage = 0;
  self->_isSettingOn = 0;
  self->_isTimerActive = 0;
  self->_isVideoPlaying = 0;
  self->_numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_requestTimeBeginMs = 0;
  self->_sharingAppActive = 0;
  self->_sharingEntityPresent = 0;
  self->_sharingRecipientPresent = 0;
  self->_smsAttachmentExists = 0;
  self->_smsAttributeRecipientExists = 0;
  self->_smsAttributeSenderExists = 0;
  self->_smsPhoneNumberMentioned = 0;
  self->_smsTextPayloadExists = 0;
  self->_timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_whichFeature = 5;
  self->_contactHasRequestedAddressDetail = a3;
}

- (BOOL)contactHasRequestedAddressDetail
{
  return self->_whichFeature == 5 && self->_contactHasRequestedAddressDetail;
}

- (void)deleteContactHasRequestedAddressDetail
{
  if (self->_whichFeature == 5)
  {
    self->_whichFeature = 0;
    self->_contactHasRequestedAddressDetail = 0;
  }
}

- (void)setContactMatchConfidence:(double)a3
{
  GRRSchemaGRRStringList *applicationsInForeground;
  NSString *configuredSiriLanguage;
  NSString *inputOrigin;
  NSString *previousFlowDomain;
  GRRSchemaGRRStringList *topTopics;

  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;

  self->_asrRank = 0;
  self->_canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_contactHasRequestedAddressDetail = 0;
  self->_deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_isActiveAlarmPresent = 0;
  self->_isActiveAppointmentPresent = 0;
  self->_isAnnounceEnabled = 0;
  self->_isAudioPlaying = 0;
  self->_isAppInstalled = 0;
  self->_isAppMatchPresent = 0;
  self->_isAppRunning = 0;
  self->_isArtistPresent = 0;
  self->_isContactNameResolved = 0;
  self->_isEmailAvailable = 0;
  self->_isFollowUp = 0;
  self->_isMediaItemEntityPresent = 0;
  self->_isMessagingPossible = 0;
  self->_isMessagingPossibleForSendMessageIntent = 0;
  self->_isPhoneCallPossible = 0;
  self->_isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_isPhoneNumberAvailable = 0;
  self->_isPhoneNumberContactResolvable = 0;
  self->_isPreviousTurnSendEmptyMessage = 0;
  self->_isSettingOn = 0;
  self->_isTimerActive = 0;
  self->_isVideoPlaying = 0;
  self->_numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_requestTimeBeginMs = 0;
  self->_sharingAppActive = 0;
  self->_sharingEntityPresent = 0;
  self->_sharingRecipientPresent = 0;
  self->_smsAttachmentExists = 0;
  self->_smsAttributeRecipientExists = 0;
  self->_smsAttributeSenderExists = 0;
  self->_smsPhoneNumberMentioned = 0;
  self->_smsTextPayloadExists = 0;
  self->_timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_whichFeature = 6;
  self->_contactMatchConfidence = a3;
}

- (double)contactMatchConfidence
{
  double result;

  result = 0.0;
  if (self->_whichFeature == 6)
    return self->_contactMatchConfidence;
  return result;
}

- (void)deleteContactMatchConfidence
{
  if (self->_whichFeature == 6)
  {
    self->_whichFeature = 0;
    self->_contactMatchConfidence = 0.0;
  }
}

- (void)setDeviceIsPlayingAudio:(BOOL)a3
{
  GRRSchemaGRRStringList *applicationsInForeground;
  NSString *configuredSiriLanguage;
  NSString *inputOrigin;
  NSString *previousFlowDomain;
  GRRSchemaGRRStringList *topTopics;

  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;

  self->_asrRank = 0;
  self->_canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_contactHasRequestedAddressDetail = 0;
  self->_contactMatchConfidence = 0.0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_isActiveAlarmPresent = 0;
  self->_isActiveAppointmentPresent = 0;
  self->_isAnnounceEnabled = 0;
  self->_isAudioPlaying = 0;
  self->_isAppInstalled = 0;
  self->_isAppMatchPresent = 0;
  self->_isAppRunning = 0;
  self->_isArtistPresent = 0;
  self->_isContactNameResolved = 0;
  self->_isEmailAvailable = 0;
  self->_isFollowUp = 0;
  self->_isMediaItemEntityPresent = 0;
  self->_isMessagingPossible = 0;
  self->_isMessagingPossibleForSendMessageIntent = 0;
  self->_isPhoneCallPossible = 0;
  self->_isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_isPhoneNumberAvailable = 0;
  self->_isPhoneNumberContactResolvable = 0;
  self->_isPreviousTurnSendEmptyMessage = 0;
  self->_isSettingOn = 0;
  self->_isTimerActive = 0;
  self->_isVideoPlaying = 0;
  self->_numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_requestTimeBeginMs = 0;
  self->_sharingAppActive = 0;
  self->_sharingEntityPresent = 0;
  self->_sharingRecipientPresent = 0;
  self->_smsAttachmentExists = 0;
  self->_smsAttributeRecipientExists = 0;
  self->_smsAttributeSenderExists = 0;
  self->_smsPhoneNumberMentioned = 0;
  self->_smsTextPayloadExists = 0;
  self->_timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_whichFeature = 7;
  self->_deviceIsPlayingAudio = a3;
}

- (BOOL)deviceIsPlayingAudio
{
  return self->_whichFeature == 7 && self->_deviceIsPlayingAudio;
}

- (void)deleteDeviceIsPlayingAudio
{
  if (self->_whichFeature == 7)
  {
    self->_whichFeature = 0;
    self->_deviceIsPlayingAudio = 0;
  }
}

- (void)setInputOrigin:(id)a3
{
  GRRSchemaGRRStringList *applicationsInForeground;
  NSString *configuredSiriLanguage;
  NSString *previousFlowDomain;
  GRRSchemaGRRStringList *topTopics;
  NSString *v8;
  NSString *inputOrigin;
  id v10;

  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;
  v10 = a3;

  self->_asrRank = 0;
  self->_canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_contactHasRequestedAddressDetail = 0;
  self->_contactMatchConfidence = 0.0;
  self->_deviceIsPlayingAudio = 0;
  self->_isActiveAlarmPresent = 0;
  self->_isActiveAppointmentPresent = 0;
  self->_isAnnounceEnabled = 0;
  self->_isAudioPlaying = 0;
  self->_isAppInstalled = 0;
  self->_isAppMatchPresent = 0;
  self->_isAppRunning = 0;
  self->_isArtistPresent = 0;
  self->_isContactNameResolved = 0;
  self->_isEmailAvailable = 0;
  self->_isFollowUp = 0;
  self->_isMediaItemEntityPresent = 0;
  self->_isMessagingPossible = 0;
  self->_isMessagingPossibleForSendMessageIntent = 0;
  self->_isPhoneCallPossible = 0;
  self->_isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_isPhoneNumberAvailable = 0;
  self->_isPhoneNumberContactResolvable = 0;
  self->_isPreviousTurnSendEmptyMessage = 0;
  self->_isSettingOn = 0;
  self->_isTimerActive = 0;
  self->_isVideoPlaying = 0;
  self->_numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_requestTimeBeginMs = 0;
  self->_sharingAppActive = 0;
  self->_sharingEntityPresent = 0;
  self->_sharingRecipientPresent = 0;
  self->_smsAttachmentExists = 0;
  self->_smsAttributeRecipientExists = 0;
  self->_smsAttributeSenderExists = 0;
  self->_smsPhoneNumberMentioned = 0;
  self->_smsTextPayloadExists = 0;
  self->_timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_whichFeature = 8 * (v10 != 0);
  v8 = (NSString *)objc_msgSend(v10, "copy");
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = v8;

}

- (NSString)inputOrigin
{
  if (self->_whichFeature == 8)
    return self->_inputOrigin;
  else
    return (NSString *)0;
}

- (void)deleteInputOrigin
{
  NSString *inputOrigin;

  if (self->_whichFeature == 8)
  {
    self->_whichFeature = 0;
    inputOrigin = self->_inputOrigin;
    self->_inputOrigin = 0;

  }
}

- (void)setIsActiveAlarmPresent:(BOOL)a3
{
  GRRSchemaGRRStringList *applicationsInForeground;
  NSString *configuredSiriLanguage;
  NSString *inputOrigin;
  NSString *previousFlowDomain;
  GRRSchemaGRRStringList *topTopics;

  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;

  self->_asrRank = 0;
  self->_canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_contactHasRequestedAddressDetail = 0;
  self->_contactMatchConfidence = 0.0;
  self->_deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_isActiveAppointmentPresent = 0;
  self->_isAnnounceEnabled = 0;
  self->_isAudioPlaying = 0;
  self->_isAppInstalled = 0;
  self->_isAppMatchPresent = 0;
  self->_isAppRunning = 0;
  self->_isArtistPresent = 0;
  self->_isContactNameResolved = 0;
  self->_isEmailAvailable = 0;
  self->_isFollowUp = 0;
  self->_isMediaItemEntityPresent = 0;
  self->_isMessagingPossible = 0;
  self->_isMessagingPossibleForSendMessageIntent = 0;
  self->_isPhoneCallPossible = 0;
  self->_isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_isPhoneNumberAvailable = 0;
  self->_isPhoneNumberContactResolvable = 0;
  self->_isPreviousTurnSendEmptyMessage = 0;
  self->_isSettingOn = 0;
  self->_isTimerActive = 0;
  self->_isVideoPlaying = 0;
  self->_numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_requestTimeBeginMs = 0;
  self->_sharingAppActive = 0;
  self->_sharingEntityPresent = 0;
  self->_sharingRecipientPresent = 0;
  self->_smsAttachmentExists = 0;
  self->_smsAttributeRecipientExists = 0;
  self->_smsAttributeSenderExists = 0;
  self->_smsPhoneNumberMentioned = 0;
  self->_smsTextPayloadExists = 0;
  self->_timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_whichFeature = 9;
  self->_isActiveAlarmPresent = a3;
}

- (BOOL)isActiveAlarmPresent
{
  return self->_whichFeature == 9 && self->_isActiveAlarmPresent;
}

- (void)deleteIsActiveAlarmPresent
{
  if (self->_whichFeature == 9)
  {
    self->_whichFeature = 0;
    self->_isActiveAlarmPresent = 0;
  }
}

- (void)setIsActiveAppointmentPresent:(BOOL)a3
{
  GRRSchemaGRRStringList *applicationsInForeground;
  NSString *configuredSiriLanguage;
  NSString *inputOrigin;
  NSString *previousFlowDomain;
  GRRSchemaGRRStringList *topTopics;

  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;

  self->_asrRank = 0;
  self->_canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_contactHasRequestedAddressDetail = 0;
  self->_contactMatchConfidence = 0.0;
  self->_deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_isActiveAlarmPresent = 0;
  self->_isAnnounceEnabled = 0;
  self->_isAudioPlaying = 0;
  self->_isAppInstalled = 0;
  self->_isAppMatchPresent = 0;
  self->_isAppRunning = 0;
  self->_isArtistPresent = 0;
  self->_isContactNameResolved = 0;
  self->_isEmailAvailable = 0;
  self->_isFollowUp = 0;
  self->_isMediaItemEntityPresent = 0;
  self->_isMessagingPossible = 0;
  self->_isMessagingPossibleForSendMessageIntent = 0;
  self->_isPhoneCallPossible = 0;
  self->_isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_isPhoneNumberAvailable = 0;
  self->_isPhoneNumberContactResolvable = 0;
  self->_isPreviousTurnSendEmptyMessage = 0;
  self->_isSettingOn = 0;
  self->_isTimerActive = 0;
  self->_isVideoPlaying = 0;
  self->_numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_requestTimeBeginMs = 0;
  self->_sharingAppActive = 0;
  self->_sharingEntityPresent = 0;
  self->_sharingRecipientPresent = 0;
  self->_smsAttachmentExists = 0;
  self->_smsAttributeRecipientExists = 0;
  self->_smsAttributeSenderExists = 0;
  self->_smsPhoneNumberMentioned = 0;
  self->_smsTextPayloadExists = 0;
  self->_timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_whichFeature = 10;
  self->_isActiveAppointmentPresent = a3;
}

- (BOOL)isActiveAppointmentPresent
{
  return self->_whichFeature == 10 && self->_isActiveAppointmentPresent;
}

- (void)deleteIsActiveAppointmentPresent
{
  if (self->_whichFeature == 10)
  {
    self->_whichFeature = 0;
    self->_isActiveAppointmentPresent = 0;
  }
}

- (void)setIsAnnounceEnabled:(BOOL)a3
{
  GRRSchemaGRRStringList *applicationsInForeground;
  NSString *configuredSiriLanguage;
  NSString *inputOrigin;
  NSString *previousFlowDomain;
  GRRSchemaGRRStringList *topTopics;

  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;

  self->_asrRank = 0;
  self->_canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_contactHasRequestedAddressDetail = 0;
  self->_contactMatchConfidence = 0.0;
  self->_deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_isActiveAlarmPresent = 0;
  self->_isActiveAppointmentPresent = 0;
  self->_isAudioPlaying = 0;
  self->_isAppInstalled = 0;
  self->_isAppMatchPresent = 0;
  self->_isAppRunning = 0;
  self->_isArtistPresent = 0;
  self->_isContactNameResolved = 0;
  self->_isEmailAvailable = 0;
  self->_isFollowUp = 0;
  self->_isMediaItemEntityPresent = 0;
  self->_isMessagingPossible = 0;
  self->_isMessagingPossibleForSendMessageIntent = 0;
  self->_isPhoneCallPossible = 0;
  self->_isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_isPhoneNumberAvailable = 0;
  self->_isPhoneNumberContactResolvable = 0;
  self->_isPreviousTurnSendEmptyMessage = 0;
  self->_isSettingOn = 0;
  self->_isTimerActive = 0;
  self->_isVideoPlaying = 0;
  self->_numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_requestTimeBeginMs = 0;
  self->_sharingAppActive = 0;
  self->_sharingEntityPresent = 0;
  self->_sharingRecipientPresent = 0;
  self->_smsAttachmentExists = 0;
  self->_smsAttributeRecipientExists = 0;
  self->_smsAttributeSenderExists = 0;
  self->_smsPhoneNumberMentioned = 0;
  self->_smsTextPayloadExists = 0;
  self->_timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_whichFeature = 11;
  self->_isAnnounceEnabled = a3;
}

- (BOOL)isAnnounceEnabled
{
  return self->_whichFeature == 11 && self->_isAnnounceEnabled;
}

- (void)deleteIsAnnounceEnabled
{
  if (self->_whichFeature == 11)
  {
    self->_whichFeature = 0;
    self->_isAnnounceEnabled = 0;
  }
}

- (void)setIsAudioPlaying:(BOOL)a3
{
  GRRSchemaGRRStringList *applicationsInForeground;
  NSString *configuredSiriLanguage;
  NSString *inputOrigin;
  NSString *previousFlowDomain;
  GRRSchemaGRRStringList *topTopics;

  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;

  self->_asrRank = 0;
  self->_canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_contactHasRequestedAddressDetail = 0;
  self->_contactMatchConfidence = 0.0;
  self->_deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_isActiveAlarmPresent = 0;
  self->_isActiveAppointmentPresent = 0;
  self->_isAnnounceEnabled = 0;
  self->_isAppInstalled = 0;
  self->_isAppMatchPresent = 0;
  self->_isAppRunning = 0;
  self->_isArtistPresent = 0;
  self->_isContactNameResolved = 0;
  self->_isEmailAvailable = 0;
  self->_isFollowUp = 0;
  self->_isMediaItemEntityPresent = 0;
  self->_isMessagingPossible = 0;
  self->_isMessagingPossibleForSendMessageIntent = 0;
  self->_isPhoneCallPossible = 0;
  self->_isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_isPhoneNumberAvailable = 0;
  self->_isPhoneNumberContactResolvable = 0;
  self->_isPreviousTurnSendEmptyMessage = 0;
  self->_isSettingOn = 0;
  self->_isTimerActive = 0;
  self->_isVideoPlaying = 0;
  self->_numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_requestTimeBeginMs = 0;
  self->_sharingAppActive = 0;
  self->_sharingEntityPresent = 0;
  self->_sharingRecipientPresent = 0;
  self->_smsAttachmentExists = 0;
  self->_smsAttributeRecipientExists = 0;
  self->_smsAttributeSenderExists = 0;
  self->_smsPhoneNumberMentioned = 0;
  self->_smsTextPayloadExists = 0;
  self->_timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_whichFeature = 12;
  self->_isAudioPlaying = a3;
}

- (BOOL)isAudioPlaying
{
  return self->_whichFeature == 12 && self->_isAudioPlaying;
}

- (void)deleteIsAudioPlaying
{
  if (self->_whichFeature == 12)
  {
    self->_whichFeature = 0;
    self->_isAudioPlaying = 0;
  }
}

- (void)setIsAppInstalled:(BOOL)a3
{
  GRRSchemaGRRStringList *applicationsInForeground;
  NSString *configuredSiriLanguage;
  NSString *inputOrigin;
  NSString *previousFlowDomain;
  GRRSchemaGRRStringList *topTopics;

  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;

  self->_asrRank = 0;
  self->_canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_contactHasRequestedAddressDetail = 0;
  self->_contactMatchConfidence = 0.0;
  self->_deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_isActiveAlarmPresent = 0;
  self->_isActiveAppointmentPresent = 0;
  self->_isAnnounceEnabled = 0;
  self->_isAudioPlaying = 0;
  self->_isAppMatchPresent = 0;
  self->_isAppRunning = 0;
  self->_isArtistPresent = 0;
  self->_isContactNameResolved = 0;
  self->_isEmailAvailable = 0;
  self->_isFollowUp = 0;
  self->_isMediaItemEntityPresent = 0;
  self->_isMessagingPossible = 0;
  self->_isMessagingPossibleForSendMessageIntent = 0;
  self->_isPhoneCallPossible = 0;
  self->_isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_isPhoneNumberAvailable = 0;
  self->_isPhoneNumberContactResolvable = 0;
  self->_isPreviousTurnSendEmptyMessage = 0;
  self->_isSettingOn = 0;
  self->_isTimerActive = 0;
  self->_isVideoPlaying = 0;
  self->_numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_requestTimeBeginMs = 0;
  self->_sharingAppActive = 0;
  self->_sharingEntityPresent = 0;
  self->_sharingRecipientPresent = 0;
  self->_smsAttachmentExists = 0;
  self->_smsAttributeRecipientExists = 0;
  self->_smsAttributeSenderExists = 0;
  self->_smsPhoneNumberMentioned = 0;
  self->_smsTextPayloadExists = 0;
  self->_timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_whichFeature = 13;
  self->_isAppInstalled = a3;
}

- (BOOL)isAppInstalled
{
  return self->_whichFeature == 13 && self->_isAppInstalled;
}

- (void)deleteIsAppInstalled
{
  if (self->_whichFeature == 13)
  {
    self->_whichFeature = 0;
    self->_isAppInstalled = 0;
  }
}

- (void)setIsAppMatchPresent:(BOOL)a3
{
  GRRSchemaGRRStringList *applicationsInForeground;
  NSString *configuredSiriLanguage;
  NSString *inputOrigin;
  NSString *previousFlowDomain;
  GRRSchemaGRRStringList *topTopics;

  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;

  self->_asrRank = 0;
  self->_canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_contactHasRequestedAddressDetail = 0;
  self->_contactMatchConfidence = 0.0;
  self->_deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_isActiveAlarmPresent = 0;
  self->_isActiveAppointmentPresent = 0;
  self->_isAnnounceEnabled = 0;
  self->_isAudioPlaying = 0;
  self->_isAppInstalled = 0;
  self->_isAppRunning = 0;
  self->_isArtistPresent = 0;
  self->_isContactNameResolved = 0;
  self->_isEmailAvailable = 0;
  self->_isFollowUp = 0;
  self->_isMediaItemEntityPresent = 0;
  self->_isMessagingPossible = 0;
  self->_isMessagingPossibleForSendMessageIntent = 0;
  self->_isPhoneCallPossible = 0;
  self->_isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_isPhoneNumberAvailable = 0;
  self->_isPhoneNumberContactResolvable = 0;
  self->_isPreviousTurnSendEmptyMessage = 0;
  self->_isSettingOn = 0;
  self->_isTimerActive = 0;
  self->_isVideoPlaying = 0;
  self->_numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_requestTimeBeginMs = 0;
  self->_sharingAppActive = 0;
  self->_sharingEntityPresent = 0;
  self->_sharingRecipientPresent = 0;
  self->_smsAttachmentExists = 0;
  self->_smsAttributeRecipientExists = 0;
  self->_smsAttributeSenderExists = 0;
  self->_smsPhoneNumberMentioned = 0;
  self->_smsTextPayloadExists = 0;
  self->_timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_whichFeature = 14;
  self->_isAppMatchPresent = a3;
}

- (BOOL)isAppMatchPresent
{
  return self->_whichFeature == 14 && self->_isAppMatchPresent;
}

- (void)deleteIsAppMatchPresent
{
  if (self->_whichFeature == 14)
  {
    self->_whichFeature = 0;
    self->_isAppMatchPresent = 0;
  }
}

- (void)setIsAppRunning:(BOOL)a3
{
  GRRSchemaGRRStringList *applicationsInForeground;
  NSString *configuredSiriLanguage;
  NSString *inputOrigin;
  NSString *previousFlowDomain;
  GRRSchemaGRRStringList *topTopics;

  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;

  self->_asrRank = 0;
  self->_canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_contactHasRequestedAddressDetail = 0;
  self->_contactMatchConfidence = 0.0;
  self->_deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_isActiveAlarmPresent = 0;
  self->_isActiveAppointmentPresent = 0;
  self->_isAnnounceEnabled = 0;
  self->_isAudioPlaying = 0;
  self->_isAppInstalled = 0;
  self->_isAppMatchPresent = 0;
  self->_isArtistPresent = 0;
  self->_isContactNameResolved = 0;
  self->_isEmailAvailable = 0;
  self->_isFollowUp = 0;
  self->_isMediaItemEntityPresent = 0;
  self->_isMessagingPossible = 0;
  self->_isMessagingPossibleForSendMessageIntent = 0;
  self->_isPhoneCallPossible = 0;
  self->_isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_isPhoneNumberAvailable = 0;
  self->_isPhoneNumberContactResolvable = 0;
  self->_isPreviousTurnSendEmptyMessage = 0;
  self->_isSettingOn = 0;
  self->_isTimerActive = 0;
  self->_isVideoPlaying = 0;
  self->_numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_requestTimeBeginMs = 0;
  self->_sharingAppActive = 0;
  self->_sharingEntityPresent = 0;
  self->_sharingRecipientPresent = 0;
  self->_smsAttachmentExists = 0;
  self->_smsAttributeRecipientExists = 0;
  self->_smsAttributeSenderExists = 0;
  self->_smsPhoneNumberMentioned = 0;
  self->_smsTextPayloadExists = 0;
  self->_timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_whichFeature = 15;
  self->_isAppRunning = a3;
}

- (BOOL)isAppRunning
{
  return self->_whichFeature == 15 && self->_isAppRunning;
}

- (void)deleteIsAppRunning
{
  if (self->_whichFeature == 15)
  {
    self->_whichFeature = 0;
    self->_isAppRunning = 0;
  }
}

- (void)setIsArtistPresent:(BOOL)a3
{
  GRRSchemaGRRStringList *applicationsInForeground;
  NSString *configuredSiriLanguage;
  NSString *inputOrigin;
  NSString *previousFlowDomain;
  GRRSchemaGRRStringList *topTopics;

  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;

  self->_asrRank = 0;
  self->_canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_contactHasRequestedAddressDetail = 0;
  self->_contactMatchConfidence = 0.0;
  self->_deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_isActiveAlarmPresent = 0;
  self->_isActiveAppointmentPresent = 0;
  self->_isAnnounceEnabled = 0;
  self->_isAudioPlaying = 0;
  self->_isAppInstalled = 0;
  self->_isAppMatchPresent = 0;
  self->_isAppRunning = 0;
  self->_isContactNameResolved = 0;
  self->_isEmailAvailable = 0;
  self->_isFollowUp = 0;
  self->_isMediaItemEntityPresent = 0;
  self->_isMessagingPossible = 0;
  self->_isMessagingPossibleForSendMessageIntent = 0;
  self->_isPhoneCallPossible = 0;
  self->_isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_isPhoneNumberAvailable = 0;
  self->_isPhoneNumberContactResolvable = 0;
  self->_isPreviousTurnSendEmptyMessage = 0;
  self->_isSettingOn = 0;
  self->_isTimerActive = 0;
  self->_isVideoPlaying = 0;
  self->_numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_requestTimeBeginMs = 0;
  self->_sharingAppActive = 0;
  self->_sharingEntityPresent = 0;
  self->_sharingRecipientPresent = 0;
  self->_smsAttachmentExists = 0;
  self->_smsAttributeRecipientExists = 0;
  self->_smsAttributeSenderExists = 0;
  self->_smsPhoneNumberMentioned = 0;
  self->_smsTextPayloadExists = 0;
  self->_timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_whichFeature = 16;
  self->_isArtistPresent = a3;
}

- (BOOL)isArtistPresent
{
  return self->_whichFeature == 16 && self->_isArtistPresent;
}

- (void)deleteIsArtistPresent
{
  if (self->_whichFeature == 16)
  {
    self->_whichFeature = 0;
    self->_isArtistPresent = 0;
  }
}

- (void)setIsContactNameResolved:(BOOL)a3
{
  GRRSchemaGRRStringList *applicationsInForeground;
  NSString *configuredSiriLanguage;
  NSString *inputOrigin;
  NSString *previousFlowDomain;
  GRRSchemaGRRStringList *topTopics;

  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;

  self->_asrRank = 0;
  self->_canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_contactHasRequestedAddressDetail = 0;
  self->_contactMatchConfidence = 0.0;
  self->_deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_isActiveAlarmPresent = 0;
  self->_isActiveAppointmentPresent = 0;
  self->_isAnnounceEnabled = 0;
  self->_isAudioPlaying = 0;
  self->_isAppInstalled = 0;
  self->_isAppMatchPresent = 0;
  self->_isAppRunning = 0;
  self->_isArtistPresent = 0;
  self->_isEmailAvailable = 0;
  self->_isFollowUp = 0;
  self->_isMediaItemEntityPresent = 0;
  self->_isMessagingPossible = 0;
  self->_isMessagingPossibleForSendMessageIntent = 0;
  self->_isPhoneCallPossible = 0;
  self->_isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_isPhoneNumberAvailable = 0;
  self->_isPhoneNumberContactResolvable = 0;
  self->_isPreviousTurnSendEmptyMessage = 0;
  self->_isSettingOn = 0;
  self->_isTimerActive = 0;
  self->_isVideoPlaying = 0;
  self->_numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_requestTimeBeginMs = 0;
  self->_sharingAppActive = 0;
  self->_sharingEntityPresent = 0;
  self->_sharingRecipientPresent = 0;
  self->_smsAttachmentExists = 0;
  self->_smsAttributeRecipientExists = 0;
  self->_smsAttributeSenderExists = 0;
  self->_smsPhoneNumberMentioned = 0;
  self->_smsTextPayloadExists = 0;
  self->_timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_whichFeature = 17;
  self->_isContactNameResolved = a3;
}

- (BOOL)isContactNameResolved
{
  return self->_whichFeature == 17 && self->_isContactNameResolved;
}

- (void)deleteIsContactNameResolved
{
  if (self->_whichFeature == 17)
  {
    self->_whichFeature = 0;
    self->_isContactNameResolved = 0;
  }
}

- (void)setIsEmailAvailable:(BOOL)a3
{
  GRRSchemaGRRStringList *applicationsInForeground;
  NSString *configuredSiriLanguage;
  NSString *inputOrigin;
  NSString *previousFlowDomain;
  GRRSchemaGRRStringList *topTopics;

  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;

  self->_asrRank = 0;
  self->_canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_contactHasRequestedAddressDetail = 0;
  self->_contactMatchConfidence = 0.0;
  self->_deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_isActiveAlarmPresent = 0;
  self->_isActiveAppointmentPresent = 0;
  self->_isAnnounceEnabled = 0;
  self->_isAudioPlaying = 0;
  self->_isAppInstalled = 0;
  self->_isAppMatchPresent = 0;
  self->_isAppRunning = 0;
  self->_isArtistPresent = 0;
  self->_isContactNameResolved = 0;
  self->_isFollowUp = 0;
  self->_isMediaItemEntityPresent = 0;
  self->_isMessagingPossible = 0;
  self->_isMessagingPossibleForSendMessageIntent = 0;
  self->_isPhoneCallPossible = 0;
  self->_isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_isPhoneNumberAvailable = 0;
  self->_isPhoneNumberContactResolvable = 0;
  self->_isPreviousTurnSendEmptyMessage = 0;
  self->_isSettingOn = 0;
  self->_isTimerActive = 0;
  self->_isVideoPlaying = 0;
  self->_numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_requestTimeBeginMs = 0;
  self->_sharingAppActive = 0;
  self->_sharingEntityPresent = 0;
  self->_sharingRecipientPresent = 0;
  self->_smsAttachmentExists = 0;
  self->_smsAttributeRecipientExists = 0;
  self->_smsAttributeSenderExists = 0;
  self->_smsPhoneNumberMentioned = 0;
  self->_smsTextPayloadExists = 0;
  self->_timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_whichFeature = 18;
  self->_isEmailAvailable = a3;
}

- (BOOL)isEmailAvailable
{
  return self->_whichFeature == 18 && self->_isEmailAvailable;
}

- (void)deleteIsEmailAvailable
{
  if (self->_whichFeature == 18)
  {
    self->_whichFeature = 0;
    self->_isEmailAvailable = 0;
  }
}

- (void)setIsFollowUp:(BOOL)a3
{
  GRRSchemaGRRStringList *applicationsInForeground;
  NSString *configuredSiriLanguage;
  NSString *inputOrigin;
  NSString *previousFlowDomain;
  GRRSchemaGRRStringList *topTopics;

  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;

  self->_asrRank = 0;
  self->_canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_contactHasRequestedAddressDetail = 0;
  self->_contactMatchConfidence = 0.0;
  self->_deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_isActiveAlarmPresent = 0;
  self->_isActiveAppointmentPresent = 0;
  self->_isAnnounceEnabled = 0;
  self->_isAudioPlaying = 0;
  self->_isAppInstalled = 0;
  self->_isAppMatchPresent = 0;
  self->_isAppRunning = 0;
  self->_isArtistPresent = 0;
  self->_isContactNameResolved = 0;
  self->_isEmailAvailable = 0;
  self->_isMediaItemEntityPresent = 0;
  self->_isMessagingPossible = 0;
  self->_isMessagingPossibleForSendMessageIntent = 0;
  self->_isPhoneCallPossible = 0;
  self->_isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_isPhoneNumberAvailable = 0;
  self->_isPhoneNumberContactResolvable = 0;
  self->_isPreviousTurnSendEmptyMessage = 0;
  self->_isSettingOn = 0;
  self->_isTimerActive = 0;
  self->_isVideoPlaying = 0;
  self->_numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_requestTimeBeginMs = 0;
  self->_sharingAppActive = 0;
  self->_sharingEntityPresent = 0;
  self->_sharingRecipientPresent = 0;
  self->_smsAttachmentExists = 0;
  self->_smsAttributeRecipientExists = 0;
  self->_smsAttributeSenderExists = 0;
  self->_smsPhoneNumberMentioned = 0;
  self->_smsTextPayloadExists = 0;
  self->_timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_whichFeature = 19;
  self->_isFollowUp = a3;
}

- (BOOL)isFollowUp
{
  return self->_whichFeature == 19 && self->_isFollowUp;
}

- (void)deleteIsFollowUp
{
  if (self->_whichFeature == 19)
  {
    self->_whichFeature = 0;
    self->_isFollowUp = 0;
  }
}

- (void)setIsMediaItemEntityPresent:(BOOL)a3
{
  GRRSchemaGRRStringList *applicationsInForeground;
  NSString *configuredSiriLanguage;
  NSString *inputOrigin;
  NSString *previousFlowDomain;
  GRRSchemaGRRStringList *topTopics;

  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;

  self->_asrRank = 0;
  self->_canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_contactHasRequestedAddressDetail = 0;
  self->_contactMatchConfidence = 0.0;
  self->_deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_isActiveAlarmPresent = 0;
  self->_isActiveAppointmentPresent = 0;
  self->_isAnnounceEnabled = 0;
  self->_isAudioPlaying = 0;
  self->_isAppInstalled = 0;
  self->_isAppMatchPresent = 0;
  self->_isAppRunning = 0;
  self->_isArtistPresent = 0;
  self->_isContactNameResolved = 0;
  self->_isEmailAvailable = 0;
  self->_isFollowUp = 0;
  self->_isMessagingPossible = 0;
  self->_isMessagingPossibleForSendMessageIntent = 0;
  self->_isPhoneCallPossible = 0;
  self->_isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_isPhoneNumberAvailable = 0;
  self->_isPhoneNumberContactResolvable = 0;
  self->_isPreviousTurnSendEmptyMessage = 0;
  self->_isSettingOn = 0;
  self->_isTimerActive = 0;
  self->_isVideoPlaying = 0;
  self->_numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_requestTimeBeginMs = 0;
  self->_sharingAppActive = 0;
  self->_sharingEntityPresent = 0;
  self->_sharingRecipientPresent = 0;
  self->_smsAttachmentExists = 0;
  self->_smsAttributeRecipientExists = 0;
  self->_smsAttributeSenderExists = 0;
  self->_smsPhoneNumberMentioned = 0;
  self->_smsTextPayloadExists = 0;
  self->_timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_whichFeature = 20;
  self->_isMediaItemEntityPresent = a3;
}

- (BOOL)isMediaItemEntityPresent
{
  return self->_whichFeature == 20 && self->_isMediaItemEntityPresent;
}

- (void)deleteIsMediaItemEntityPresent
{
  if (self->_whichFeature == 20)
  {
    self->_whichFeature = 0;
    self->_isMediaItemEntityPresent = 0;
  }
}

- (void)setIsMessagingPossible:(BOOL)a3
{
  GRRSchemaGRRStringList *applicationsInForeground;
  NSString *configuredSiriLanguage;
  NSString *inputOrigin;
  NSString *previousFlowDomain;
  GRRSchemaGRRStringList *topTopics;

  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;

  self->_asrRank = 0;
  self->_canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_contactHasRequestedAddressDetail = 0;
  self->_contactMatchConfidence = 0.0;
  self->_deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_isActiveAlarmPresent = 0;
  self->_isActiveAppointmentPresent = 0;
  self->_isAnnounceEnabled = 0;
  self->_isAudioPlaying = 0;
  self->_isAppInstalled = 0;
  self->_isAppMatchPresent = 0;
  self->_isAppRunning = 0;
  self->_isArtistPresent = 0;
  self->_isContactNameResolved = 0;
  self->_isEmailAvailable = 0;
  self->_isFollowUp = 0;
  self->_isMediaItemEntityPresent = 0;
  self->_isMessagingPossibleForSendMessageIntent = 0;
  self->_isPhoneCallPossible = 0;
  self->_isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_isPhoneNumberAvailable = 0;
  self->_isPhoneNumberContactResolvable = 0;
  self->_isPreviousTurnSendEmptyMessage = 0;
  self->_isSettingOn = 0;
  self->_isTimerActive = 0;
  self->_isVideoPlaying = 0;
  self->_numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_requestTimeBeginMs = 0;
  self->_sharingAppActive = 0;
  self->_sharingEntityPresent = 0;
  self->_sharingRecipientPresent = 0;
  self->_smsAttachmentExists = 0;
  self->_smsAttributeRecipientExists = 0;
  self->_smsAttributeSenderExists = 0;
  self->_smsPhoneNumberMentioned = 0;
  self->_smsTextPayloadExists = 0;
  self->_timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_whichFeature = 21;
  self->_isMessagingPossible = a3;
}

- (BOOL)isMessagingPossible
{
  return self->_whichFeature == 21 && self->_isMessagingPossible;
}

- (void)deleteIsMessagingPossible
{
  if (self->_whichFeature == 21)
  {
    self->_whichFeature = 0;
    self->_isMessagingPossible = 0;
  }
}

- (void)setIsMessagingPossibleForSendMessageIntent:(BOOL)a3
{
  GRRSchemaGRRStringList *applicationsInForeground;
  NSString *configuredSiriLanguage;
  NSString *inputOrigin;
  NSString *previousFlowDomain;
  GRRSchemaGRRStringList *topTopics;

  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;

  self->_asrRank = 0;
  self->_canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_contactHasRequestedAddressDetail = 0;
  self->_contactMatchConfidence = 0.0;
  self->_deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_isActiveAlarmPresent = 0;
  self->_isActiveAppointmentPresent = 0;
  self->_isAnnounceEnabled = 0;
  self->_isAudioPlaying = 0;
  self->_isAppInstalled = 0;
  self->_isAppMatchPresent = 0;
  self->_isAppRunning = 0;
  self->_isArtistPresent = 0;
  self->_isContactNameResolved = 0;
  self->_isEmailAvailable = 0;
  self->_isFollowUp = 0;
  self->_isMediaItemEntityPresent = 0;
  self->_isMessagingPossible = 0;
  self->_isPhoneCallPossible = 0;
  self->_isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_isPhoneNumberAvailable = 0;
  self->_isPhoneNumberContactResolvable = 0;
  self->_isPreviousTurnSendEmptyMessage = 0;
  self->_isSettingOn = 0;
  self->_isTimerActive = 0;
  self->_isVideoPlaying = 0;
  self->_numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_requestTimeBeginMs = 0;
  self->_sharingAppActive = 0;
  self->_sharingEntityPresent = 0;
  self->_sharingRecipientPresent = 0;
  self->_smsAttachmentExists = 0;
  self->_smsAttributeRecipientExists = 0;
  self->_smsAttributeSenderExists = 0;
  self->_smsPhoneNumberMentioned = 0;
  self->_smsTextPayloadExists = 0;
  self->_timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_whichFeature = 22;
  self->_isMessagingPossibleForSendMessageIntent = a3;
}

- (BOOL)isMessagingPossibleForSendMessageIntent
{
  return self->_whichFeature == 22 && self->_isMessagingPossibleForSendMessageIntent;
}

- (void)deleteIsMessagingPossibleForSendMessageIntent
{
  if (self->_whichFeature == 22)
  {
    self->_whichFeature = 0;
    self->_isMessagingPossibleForSendMessageIntent = 0;
  }
}

- (void)setIsPhoneCallPossible:(BOOL)a3
{
  GRRSchemaGRRStringList *applicationsInForeground;
  NSString *configuredSiriLanguage;
  NSString *inputOrigin;
  NSString *previousFlowDomain;
  GRRSchemaGRRStringList *topTopics;

  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;

  self->_asrRank = 0;
  self->_canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_contactHasRequestedAddressDetail = 0;
  self->_contactMatchConfidence = 0.0;
  self->_deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_isActiveAlarmPresent = 0;
  self->_isActiveAppointmentPresent = 0;
  self->_isAnnounceEnabled = 0;
  self->_isAudioPlaying = 0;
  self->_isAppInstalled = 0;
  self->_isAppMatchPresent = 0;
  self->_isAppRunning = 0;
  self->_isArtistPresent = 0;
  self->_isContactNameResolved = 0;
  self->_isEmailAvailable = 0;
  self->_isFollowUp = 0;
  self->_isMediaItemEntityPresent = 0;
  self->_isMessagingPossible = 0;
  self->_isMessagingPossibleForSendMessageIntent = 0;
  self->_isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_isPhoneNumberAvailable = 0;
  self->_isPhoneNumberContactResolvable = 0;
  self->_isPreviousTurnSendEmptyMessage = 0;
  self->_isSettingOn = 0;
  self->_isTimerActive = 0;
  self->_isVideoPlaying = 0;
  self->_numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_requestTimeBeginMs = 0;
  self->_sharingAppActive = 0;
  self->_sharingEntityPresent = 0;
  self->_sharingRecipientPresent = 0;
  self->_smsAttachmentExists = 0;
  self->_smsAttributeRecipientExists = 0;
  self->_smsAttributeSenderExists = 0;
  self->_smsPhoneNumberMentioned = 0;
  self->_smsTextPayloadExists = 0;
  self->_timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_whichFeature = 23;
  self->_isPhoneCallPossible = a3;
}

- (BOOL)isPhoneCallPossible
{
  return self->_whichFeature == 23 && self->_isPhoneCallPossible;
}

- (void)deleteIsPhoneCallPossible
{
  if (self->_whichFeature == 23)
  {
    self->_whichFeature = 0;
    self->_isPhoneCallPossible = 0;
  }
}

- (void)setIsPhoneCallPossibleForPhoneCallIntent:(BOOL)a3
{
  GRRSchemaGRRStringList *applicationsInForeground;
  NSString *configuredSiriLanguage;
  NSString *inputOrigin;
  NSString *previousFlowDomain;
  GRRSchemaGRRStringList *topTopics;

  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;

  self->_asrRank = 0;
  self->_canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_contactHasRequestedAddressDetail = 0;
  self->_contactMatchConfidence = 0.0;
  self->_deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_isActiveAlarmPresent = 0;
  self->_isActiveAppointmentPresent = 0;
  self->_isAnnounceEnabled = 0;
  self->_isAudioPlaying = 0;
  self->_isAppInstalled = 0;
  self->_isAppMatchPresent = 0;
  self->_isAppRunning = 0;
  self->_isArtistPresent = 0;
  self->_isContactNameResolved = 0;
  self->_isEmailAvailable = 0;
  self->_isFollowUp = 0;
  self->_isMediaItemEntityPresent = 0;
  self->_isMessagingPossible = 0;
  self->_isMessagingPossibleForSendMessageIntent = 0;
  self->_isPhoneCallPossible = 0;
  self->_isPhoneNumberAvailable = 0;
  self->_isPhoneNumberContactResolvable = 0;
  self->_isPreviousTurnSendEmptyMessage = 0;
  self->_isSettingOn = 0;
  self->_isTimerActive = 0;
  self->_isVideoPlaying = 0;
  self->_numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_requestTimeBeginMs = 0;
  self->_sharingAppActive = 0;
  self->_sharingEntityPresent = 0;
  self->_sharingRecipientPresent = 0;
  self->_smsAttachmentExists = 0;
  self->_smsAttributeRecipientExists = 0;
  self->_smsAttributeSenderExists = 0;
  self->_smsPhoneNumberMentioned = 0;
  self->_smsTextPayloadExists = 0;
  self->_timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_whichFeature = 24;
  self->_isPhoneCallPossibleForPhoneCallIntent = a3;
}

- (BOOL)isPhoneCallPossibleForPhoneCallIntent
{
  return self->_whichFeature == 24 && self->_isPhoneCallPossibleForPhoneCallIntent;
}

- (void)deleteIsPhoneCallPossibleForPhoneCallIntent
{
  if (self->_whichFeature == 24)
  {
    self->_whichFeature = 0;
    self->_isPhoneCallPossibleForPhoneCallIntent = 0;
  }
}

- (void)setIsPhoneNumberAvailable:(BOOL)a3
{
  GRRSchemaGRRStringList *applicationsInForeground;
  NSString *configuredSiriLanguage;
  NSString *inputOrigin;
  NSString *previousFlowDomain;
  GRRSchemaGRRStringList *topTopics;

  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;

  self->_asrRank = 0;
  self->_canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_contactHasRequestedAddressDetail = 0;
  self->_contactMatchConfidence = 0.0;
  self->_deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_isActiveAlarmPresent = 0;
  self->_isActiveAppointmentPresent = 0;
  self->_isAnnounceEnabled = 0;
  self->_isAudioPlaying = 0;
  self->_isAppInstalled = 0;
  self->_isAppMatchPresent = 0;
  self->_isAppRunning = 0;
  self->_isArtistPresent = 0;
  self->_isContactNameResolved = 0;
  self->_isEmailAvailable = 0;
  self->_isFollowUp = 0;
  self->_isMediaItemEntityPresent = 0;
  self->_isMessagingPossible = 0;
  self->_isMessagingPossibleForSendMessageIntent = 0;
  self->_isPhoneCallPossible = 0;
  self->_isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_isPhoneNumberContactResolvable = 0;
  self->_isPreviousTurnSendEmptyMessage = 0;
  self->_isSettingOn = 0;
  self->_isTimerActive = 0;
  self->_isVideoPlaying = 0;
  self->_numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_requestTimeBeginMs = 0;
  self->_sharingAppActive = 0;
  self->_sharingEntityPresent = 0;
  self->_sharingRecipientPresent = 0;
  self->_smsAttachmentExists = 0;
  self->_smsAttributeRecipientExists = 0;
  self->_smsAttributeSenderExists = 0;
  self->_smsPhoneNumberMentioned = 0;
  self->_smsTextPayloadExists = 0;
  self->_timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_whichFeature = 25;
  self->_isPhoneNumberAvailable = a3;
}

- (BOOL)isPhoneNumberAvailable
{
  return self->_whichFeature == 25 && self->_isPhoneNumberAvailable;
}

- (void)deleteIsPhoneNumberAvailable
{
  if (self->_whichFeature == 25)
  {
    self->_whichFeature = 0;
    self->_isPhoneNumberAvailable = 0;
  }
}

- (void)setIsPhoneNumberContactResolvable:(BOOL)a3
{
  GRRSchemaGRRStringList *applicationsInForeground;
  NSString *configuredSiriLanguage;
  NSString *inputOrigin;
  NSString *previousFlowDomain;
  GRRSchemaGRRStringList *topTopics;

  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;

  self->_asrRank = 0;
  self->_canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_contactHasRequestedAddressDetail = 0;
  self->_contactMatchConfidence = 0.0;
  self->_deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_isActiveAlarmPresent = 0;
  self->_isActiveAppointmentPresent = 0;
  self->_isAnnounceEnabled = 0;
  self->_isAudioPlaying = 0;
  self->_isAppInstalled = 0;
  self->_isAppMatchPresent = 0;
  self->_isAppRunning = 0;
  self->_isArtistPresent = 0;
  self->_isContactNameResolved = 0;
  self->_isEmailAvailable = 0;
  self->_isFollowUp = 0;
  self->_isMediaItemEntityPresent = 0;
  self->_isMessagingPossible = 0;
  self->_isMessagingPossibleForSendMessageIntent = 0;
  self->_isPhoneCallPossible = 0;
  self->_isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_isPhoneNumberAvailable = 0;
  self->_isPreviousTurnSendEmptyMessage = 0;
  self->_isSettingOn = 0;
  self->_isTimerActive = 0;
  self->_isVideoPlaying = 0;
  self->_numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_requestTimeBeginMs = 0;
  self->_sharingAppActive = 0;
  self->_sharingEntityPresent = 0;
  self->_sharingRecipientPresent = 0;
  self->_smsAttachmentExists = 0;
  self->_smsAttributeRecipientExists = 0;
  self->_smsAttributeSenderExists = 0;
  self->_smsPhoneNumberMentioned = 0;
  self->_smsTextPayloadExists = 0;
  self->_timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_whichFeature = 26;
  self->_isPhoneNumberContactResolvable = a3;
}

- (BOOL)isPhoneNumberContactResolvable
{
  return self->_whichFeature == 26 && self->_isPhoneNumberContactResolvable;
}

- (void)deleteIsPhoneNumberContactResolvable
{
  if (self->_whichFeature == 26)
  {
    self->_whichFeature = 0;
    self->_isPhoneNumberContactResolvable = 0;
  }
}

- (void)setIsPreviousTurnSendEmptyMessage:(BOOL)a3
{
  GRRSchemaGRRStringList *applicationsInForeground;
  NSString *configuredSiriLanguage;
  NSString *inputOrigin;
  NSString *previousFlowDomain;
  GRRSchemaGRRStringList *topTopics;

  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;

  self->_asrRank = 0;
  self->_canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_contactHasRequestedAddressDetail = 0;
  self->_contactMatchConfidence = 0.0;
  self->_deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_isActiveAlarmPresent = 0;
  self->_isActiveAppointmentPresent = 0;
  self->_isAnnounceEnabled = 0;
  self->_isAudioPlaying = 0;
  self->_isAppInstalled = 0;
  self->_isAppMatchPresent = 0;
  self->_isAppRunning = 0;
  self->_isArtistPresent = 0;
  self->_isContactNameResolved = 0;
  self->_isEmailAvailable = 0;
  self->_isFollowUp = 0;
  self->_isMediaItemEntityPresent = 0;
  self->_isMessagingPossible = 0;
  self->_isMessagingPossibleForSendMessageIntent = 0;
  self->_isPhoneCallPossible = 0;
  self->_isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_isPhoneNumberAvailable = 0;
  self->_isPhoneNumberContactResolvable = 0;
  self->_isSettingOn = 0;
  self->_isTimerActive = 0;
  self->_isVideoPlaying = 0;
  self->_numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_requestTimeBeginMs = 0;
  self->_sharingAppActive = 0;
  self->_sharingEntityPresent = 0;
  self->_sharingRecipientPresent = 0;
  self->_smsAttachmentExists = 0;
  self->_smsAttributeRecipientExists = 0;
  self->_smsAttributeSenderExists = 0;
  self->_smsPhoneNumberMentioned = 0;
  self->_smsTextPayloadExists = 0;
  self->_timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_whichFeature = 27;
  self->_isPreviousTurnSendEmptyMessage = a3;
}

- (BOOL)isPreviousTurnSendEmptyMessage
{
  return self->_whichFeature == 27 && self->_isPreviousTurnSendEmptyMessage;
}

- (void)deleteIsPreviousTurnSendEmptyMessage
{
  if (self->_whichFeature == 27)
  {
    self->_whichFeature = 0;
    self->_isPreviousTurnSendEmptyMessage = 0;
  }
}

- (void)setIsSettingOn:(BOOL)a3
{
  GRRSchemaGRRStringList *applicationsInForeground;
  NSString *configuredSiriLanguage;
  NSString *inputOrigin;
  NSString *previousFlowDomain;
  GRRSchemaGRRStringList *topTopics;

  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;

  self->_asrRank = 0;
  self->_canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_contactHasRequestedAddressDetail = 0;
  self->_contactMatchConfidence = 0.0;
  self->_deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_isActiveAlarmPresent = 0;
  self->_isActiveAppointmentPresent = 0;
  self->_isAnnounceEnabled = 0;
  self->_isAudioPlaying = 0;
  self->_isAppInstalled = 0;
  self->_isAppMatchPresent = 0;
  self->_isAppRunning = 0;
  self->_isArtistPresent = 0;
  self->_isContactNameResolved = 0;
  self->_isEmailAvailable = 0;
  self->_isFollowUp = 0;
  self->_isMediaItemEntityPresent = 0;
  self->_isMessagingPossible = 0;
  self->_isMessagingPossibleForSendMessageIntent = 0;
  self->_isPhoneCallPossible = 0;
  self->_isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_isPhoneNumberAvailable = 0;
  self->_isPhoneNumberContactResolvable = 0;
  self->_isPreviousTurnSendEmptyMessage = 0;
  self->_isTimerActive = 0;
  self->_isVideoPlaying = 0;
  self->_numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_requestTimeBeginMs = 0;
  self->_sharingAppActive = 0;
  self->_sharingEntityPresent = 0;
  self->_sharingRecipientPresent = 0;
  self->_smsAttachmentExists = 0;
  self->_smsAttributeRecipientExists = 0;
  self->_smsAttributeSenderExists = 0;
  self->_smsPhoneNumberMentioned = 0;
  self->_smsTextPayloadExists = 0;
  self->_timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_whichFeature = 28;
  self->_isSettingOn = a3;
}

- (BOOL)isSettingOn
{
  return self->_whichFeature == 28 && self->_isSettingOn;
}

- (void)deleteIsSettingOn
{
  if (self->_whichFeature == 28)
  {
    self->_whichFeature = 0;
    self->_isSettingOn = 0;
  }
}

- (void)setIsTimerActive:(BOOL)a3
{
  GRRSchemaGRRStringList *applicationsInForeground;
  NSString *configuredSiriLanguage;
  NSString *inputOrigin;
  NSString *previousFlowDomain;
  GRRSchemaGRRStringList *topTopics;

  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;

  self->_asrRank = 0;
  self->_canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_contactHasRequestedAddressDetail = 0;
  self->_contactMatchConfidence = 0.0;
  self->_deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_isActiveAlarmPresent = 0;
  self->_isActiveAppointmentPresent = 0;
  self->_isAnnounceEnabled = 0;
  self->_isAudioPlaying = 0;
  self->_isAppInstalled = 0;
  self->_isAppMatchPresent = 0;
  self->_isAppRunning = 0;
  self->_isArtistPresent = 0;
  self->_isContactNameResolved = 0;
  self->_isEmailAvailable = 0;
  self->_isFollowUp = 0;
  self->_isMediaItemEntityPresent = 0;
  self->_isMessagingPossible = 0;
  self->_isMessagingPossibleForSendMessageIntent = 0;
  self->_isPhoneCallPossible = 0;
  self->_isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_isPhoneNumberAvailable = 0;
  self->_isPhoneNumberContactResolvable = 0;
  self->_isPreviousTurnSendEmptyMessage = 0;
  self->_isSettingOn = 0;
  self->_isVideoPlaying = 0;
  self->_numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_requestTimeBeginMs = 0;
  self->_sharingAppActive = 0;
  self->_sharingEntityPresent = 0;
  self->_sharingRecipientPresent = 0;
  self->_smsAttachmentExists = 0;
  self->_smsAttributeRecipientExists = 0;
  self->_smsAttributeSenderExists = 0;
  self->_smsPhoneNumberMentioned = 0;
  self->_smsTextPayloadExists = 0;
  self->_timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_whichFeature = 29;
  self->_isTimerActive = a3;
}

- (BOOL)isTimerActive
{
  return self->_whichFeature == 29 && self->_isTimerActive;
}

- (void)deleteIsTimerActive
{
  if (self->_whichFeature == 29)
  {
    self->_whichFeature = 0;
    self->_isTimerActive = 0;
  }
}

- (void)setIsVideoPlaying:(BOOL)a3
{
  GRRSchemaGRRStringList *applicationsInForeground;
  NSString *configuredSiriLanguage;
  NSString *inputOrigin;
  NSString *previousFlowDomain;
  GRRSchemaGRRStringList *topTopics;

  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;

  self->_asrRank = 0;
  self->_canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_contactHasRequestedAddressDetail = 0;
  self->_contactMatchConfidence = 0.0;
  self->_deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_isActiveAlarmPresent = 0;
  self->_isActiveAppointmentPresent = 0;
  self->_isAnnounceEnabled = 0;
  self->_isAudioPlaying = 0;
  self->_isAppInstalled = 0;
  self->_isAppMatchPresent = 0;
  self->_isAppRunning = 0;
  self->_isArtistPresent = 0;
  self->_isContactNameResolved = 0;
  self->_isEmailAvailable = 0;
  self->_isFollowUp = 0;
  self->_isMediaItemEntityPresent = 0;
  self->_isMessagingPossible = 0;
  self->_isMessagingPossibleForSendMessageIntent = 0;
  self->_isPhoneCallPossible = 0;
  self->_isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_isPhoneNumberAvailable = 0;
  self->_isPhoneNumberContactResolvable = 0;
  self->_isPreviousTurnSendEmptyMessage = 0;
  self->_isSettingOn = 0;
  self->_isTimerActive = 0;
  self->_numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_requestTimeBeginMs = 0;
  self->_sharingAppActive = 0;
  self->_sharingEntityPresent = 0;
  self->_sharingRecipientPresent = 0;
  self->_smsAttachmentExists = 0;
  self->_smsAttributeRecipientExists = 0;
  self->_smsAttributeSenderExists = 0;
  self->_smsPhoneNumberMentioned = 0;
  self->_smsTextPayloadExists = 0;
  self->_timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_whichFeature = 30;
  self->_isVideoPlaying = a3;
}

- (BOOL)isVideoPlaying
{
  return self->_whichFeature == 30 && self->_isVideoPlaying;
}

- (void)deleteIsVideoPlaying
{
  if (self->_whichFeature == 30)
  {
    self->_whichFeature = 0;
    self->_isVideoPlaying = 0;
  }
}

- (void)setNumberOfContactsResolved:(unsigned int)a3
{
  GRRSchemaGRRStringList *applicationsInForeground;
  NSString *configuredSiriLanguage;
  NSString *inputOrigin;
  NSString *previousFlowDomain;
  GRRSchemaGRRStringList *topTopics;

  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;

  self->_asrRank = 0;
  self->_canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_contactHasRequestedAddressDetail = 0;
  self->_contactMatchConfidence = 0.0;
  self->_deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_isActiveAlarmPresent = 0;
  self->_isActiveAppointmentPresent = 0;
  self->_isAnnounceEnabled = 0;
  self->_isAudioPlaying = 0;
  self->_isAppInstalled = 0;
  self->_isAppMatchPresent = 0;
  self->_isAppRunning = 0;
  self->_isArtistPresent = 0;
  self->_isContactNameResolved = 0;
  self->_isEmailAvailable = 0;
  self->_isFollowUp = 0;
  self->_isMediaItemEntityPresent = 0;
  self->_isMessagingPossible = 0;
  self->_isMessagingPossibleForSendMessageIntent = 0;
  self->_isPhoneCallPossible = 0;
  self->_isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_isPhoneNumberAvailable = 0;
  self->_isPhoneNumberContactResolvable = 0;
  self->_isPreviousTurnSendEmptyMessage = 0;
  self->_isSettingOn = 0;
  self->_isTimerActive = 0;
  self->_isVideoPlaying = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_requestTimeBeginMs = 0;
  self->_sharingAppActive = 0;
  self->_sharingEntityPresent = 0;
  self->_sharingRecipientPresent = 0;
  self->_smsAttachmentExists = 0;
  self->_smsAttributeRecipientExists = 0;
  self->_smsAttributeSenderExists = 0;
  self->_smsPhoneNumberMentioned = 0;
  self->_smsTextPayloadExists = 0;
  self->_timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_whichFeature = 31;
  self->_numberOfContactsResolved = a3;
}

- (unsigned)numberOfContactsResolved
{
  if (self->_whichFeature == 31)
    return self->_numberOfContactsResolved;
  else
    return 0;
}

- (void)deleteNumberOfContactsResolved
{
  if (self->_whichFeature == 31)
  {
    self->_whichFeature = 0;
    self->_numberOfContactsResolved = 0;
  }
}

- (void)setPreviousFlowDomain:(id)a3
{
  GRRSchemaGRRStringList *applicationsInForeground;
  NSString *configuredSiriLanguage;
  NSString *inputOrigin;
  GRRSchemaGRRStringList *topTopics;
  NSString *v8;
  NSString *previousFlowDomain;
  id v10;

  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;
  v10 = a3;

  self->_asrRank = 0;
  self->_canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_contactHasRequestedAddressDetail = 0;
  self->_contactMatchConfidence = 0.0;
  self->_deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_isActiveAlarmPresent = 0;
  self->_isActiveAppointmentPresent = 0;
  self->_isAnnounceEnabled = 0;
  self->_isAudioPlaying = 0;
  self->_isAppInstalled = 0;
  self->_isAppMatchPresent = 0;
  self->_isAppRunning = 0;
  self->_isArtistPresent = 0;
  self->_isContactNameResolved = 0;
  self->_isEmailAvailable = 0;
  self->_isFollowUp = 0;
  self->_isMediaItemEntityPresent = 0;
  self->_isMessagingPossible = 0;
  self->_isMessagingPossibleForSendMessageIntent = 0;
  self->_isPhoneCallPossible = 0;
  self->_isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_isPhoneNumberAvailable = 0;
  self->_isPhoneNumberContactResolvable = 0;
  self->_isPreviousTurnSendEmptyMessage = 0;
  self->_isSettingOn = 0;
  self->_isTimerActive = 0;
  self->_isVideoPlaying = 0;
  self->_numberOfContactsResolved = 0;
  self->_requestTimeBeginMs = 0;
  self->_sharingAppActive = 0;
  self->_sharingEntityPresent = 0;
  self->_sharingRecipientPresent = 0;
  self->_smsAttachmentExists = 0;
  self->_smsAttributeRecipientExists = 0;
  self->_smsAttributeSenderExists = 0;
  self->_smsPhoneNumberMentioned = 0;
  self->_smsTextPayloadExists = 0;
  self->_timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_whichFeature = 32 * (v10 != 0);
  v8 = (NSString *)objc_msgSend(v10, "copy");
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = v8;

}

- (NSString)previousFlowDomain
{
  if (self->_whichFeature == 32)
    return self->_previousFlowDomain;
  else
    return (NSString *)0;
}

- (void)deletePreviousFlowDomain
{
  NSString *previousFlowDomain;

  if (self->_whichFeature == 32)
  {
    self->_whichFeature = 0;
    previousFlowDomain = self->_previousFlowDomain;
    self->_previousFlowDomain = 0;

  }
}

- (void)setRequestTimeBeginMs:(unint64_t)a3
{
  GRRSchemaGRRStringList *applicationsInForeground;
  NSString *configuredSiriLanguage;
  NSString *inputOrigin;
  NSString *previousFlowDomain;
  GRRSchemaGRRStringList *topTopics;

  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;

  self->_asrRank = 0;
  self->_canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_contactHasRequestedAddressDetail = 0;
  self->_contactMatchConfidence = 0.0;
  self->_deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_isActiveAlarmPresent = 0;
  self->_isActiveAppointmentPresent = 0;
  self->_isAnnounceEnabled = 0;
  self->_isAudioPlaying = 0;
  self->_isAppInstalled = 0;
  self->_isAppMatchPresent = 0;
  self->_isAppRunning = 0;
  self->_isArtistPresent = 0;
  self->_isContactNameResolved = 0;
  self->_isEmailAvailable = 0;
  self->_isFollowUp = 0;
  self->_isMediaItemEntityPresent = 0;
  self->_isMessagingPossible = 0;
  self->_isMessagingPossibleForSendMessageIntent = 0;
  self->_isPhoneCallPossible = 0;
  self->_isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_isPhoneNumberAvailable = 0;
  self->_isPhoneNumberContactResolvable = 0;
  self->_isPreviousTurnSendEmptyMessage = 0;
  self->_isSettingOn = 0;
  self->_isTimerActive = 0;
  self->_isVideoPlaying = 0;
  self->_numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_sharingAppActive = 0;
  self->_sharingEntityPresent = 0;
  self->_sharingRecipientPresent = 0;
  self->_smsAttachmentExists = 0;
  self->_smsAttributeRecipientExists = 0;
  self->_smsAttributeSenderExists = 0;
  self->_smsPhoneNumberMentioned = 0;
  self->_smsTextPayloadExists = 0;
  self->_timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_whichFeature = 33;
  self->_requestTimeBeginMs = a3;
}

- (unint64_t)requestTimeBeginMs
{
  if (self->_whichFeature == 33)
    return self->_requestTimeBeginMs;
  else
    return 0;
}

- (void)deleteRequestTimeBeginMs
{
  if (self->_whichFeature == 33)
  {
    self->_whichFeature = 0;
    self->_requestTimeBeginMs = 0;
  }
}

- (void)setSharingAppActive:(BOOL)a3
{
  GRRSchemaGRRStringList *applicationsInForeground;
  NSString *configuredSiriLanguage;
  NSString *inputOrigin;
  NSString *previousFlowDomain;
  GRRSchemaGRRStringList *topTopics;

  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;

  self->_asrRank = 0;
  self->_canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_contactHasRequestedAddressDetail = 0;
  self->_contactMatchConfidence = 0.0;
  self->_deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_isActiveAlarmPresent = 0;
  self->_isActiveAppointmentPresent = 0;
  self->_isAnnounceEnabled = 0;
  self->_isAudioPlaying = 0;
  self->_isAppInstalled = 0;
  self->_isAppMatchPresent = 0;
  self->_isAppRunning = 0;
  self->_isArtistPresent = 0;
  self->_isContactNameResolved = 0;
  self->_isEmailAvailable = 0;
  self->_isFollowUp = 0;
  self->_isMediaItemEntityPresent = 0;
  self->_isMessagingPossible = 0;
  self->_isMessagingPossibleForSendMessageIntent = 0;
  self->_isPhoneCallPossible = 0;
  self->_isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_isPhoneNumberAvailable = 0;
  self->_isPhoneNumberContactResolvable = 0;
  self->_isPreviousTurnSendEmptyMessage = 0;
  self->_isSettingOn = 0;
  self->_isTimerActive = 0;
  self->_isVideoPlaying = 0;
  self->_numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_requestTimeBeginMs = 0;
  self->_sharingEntityPresent = 0;
  self->_sharingRecipientPresent = 0;
  self->_smsAttachmentExists = 0;
  self->_smsAttributeRecipientExists = 0;
  self->_smsAttributeSenderExists = 0;
  self->_smsPhoneNumberMentioned = 0;
  self->_smsTextPayloadExists = 0;
  self->_timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_whichFeature = 34;
  self->_sharingAppActive = a3;
}

- (BOOL)sharingAppActive
{
  return self->_whichFeature == 34 && self->_sharingAppActive;
}

- (void)deleteSharingAppActive
{
  if (self->_whichFeature == 34)
  {
    self->_whichFeature = 0;
    self->_sharingAppActive = 0;
  }
}

- (void)setSharingEntityPresent:(BOOL)a3
{
  GRRSchemaGRRStringList *applicationsInForeground;
  NSString *configuredSiriLanguage;
  NSString *inputOrigin;
  NSString *previousFlowDomain;
  GRRSchemaGRRStringList *topTopics;

  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;

  self->_asrRank = 0;
  self->_canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_contactHasRequestedAddressDetail = 0;
  self->_contactMatchConfidence = 0.0;
  self->_deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_isActiveAlarmPresent = 0;
  self->_isActiveAppointmentPresent = 0;
  self->_isAnnounceEnabled = 0;
  self->_isAudioPlaying = 0;
  self->_isAppInstalled = 0;
  self->_isAppMatchPresent = 0;
  self->_isAppRunning = 0;
  self->_isArtistPresent = 0;
  self->_isContactNameResolved = 0;
  self->_isEmailAvailable = 0;
  self->_isFollowUp = 0;
  self->_isMediaItemEntityPresent = 0;
  self->_isMessagingPossible = 0;
  self->_isMessagingPossibleForSendMessageIntent = 0;
  self->_isPhoneCallPossible = 0;
  self->_isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_isPhoneNumberAvailable = 0;
  self->_isPhoneNumberContactResolvable = 0;
  self->_isPreviousTurnSendEmptyMessage = 0;
  self->_isSettingOn = 0;
  self->_isTimerActive = 0;
  self->_isVideoPlaying = 0;
  self->_numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_requestTimeBeginMs = 0;
  self->_sharingAppActive = 0;
  self->_sharingRecipientPresent = 0;
  self->_smsAttachmentExists = 0;
  self->_smsAttributeRecipientExists = 0;
  self->_smsAttributeSenderExists = 0;
  self->_smsPhoneNumberMentioned = 0;
  self->_smsTextPayloadExists = 0;
  self->_timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_whichFeature = 35;
  self->_sharingEntityPresent = a3;
}

- (BOOL)sharingEntityPresent
{
  return self->_whichFeature == 35 && self->_sharingEntityPresent;
}

- (void)deleteSharingEntityPresent
{
  if (self->_whichFeature == 35)
  {
    self->_whichFeature = 0;
    self->_sharingEntityPresent = 0;
  }
}

- (void)setSharingRecipientPresent:(BOOL)a3
{
  GRRSchemaGRRStringList *applicationsInForeground;
  NSString *configuredSiriLanguage;
  NSString *inputOrigin;
  NSString *previousFlowDomain;
  GRRSchemaGRRStringList *topTopics;

  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;

  self->_asrRank = 0;
  self->_canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_contactHasRequestedAddressDetail = 0;
  self->_contactMatchConfidence = 0.0;
  self->_deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_isActiveAlarmPresent = 0;
  self->_isActiveAppointmentPresent = 0;
  self->_isAnnounceEnabled = 0;
  self->_isAudioPlaying = 0;
  self->_isAppInstalled = 0;
  self->_isAppMatchPresent = 0;
  self->_isAppRunning = 0;
  self->_isArtistPresent = 0;
  self->_isContactNameResolved = 0;
  self->_isEmailAvailable = 0;
  self->_isFollowUp = 0;
  self->_isMediaItemEntityPresent = 0;
  self->_isMessagingPossible = 0;
  self->_isMessagingPossibleForSendMessageIntent = 0;
  self->_isPhoneCallPossible = 0;
  self->_isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_isPhoneNumberAvailable = 0;
  self->_isPhoneNumberContactResolvable = 0;
  self->_isPreviousTurnSendEmptyMessage = 0;
  self->_isSettingOn = 0;
  self->_isTimerActive = 0;
  self->_isVideoPlaying = 0;
  self->_numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_requestTimeBeginMs = 0;
  self->_sharingAppActive = 0;
  self->_sharingEntityPresent = 0;
  self->_smsAttachmentExists = 0;
  self->_smsAttributeRecipientExists = 0;
  self->_smsAttributeSenderExists = 0;
  self->_smsPhoneNumberMentioned = 0;
  self->_smsTextPayloadExists = 0;
  self->_timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_whichFeature = 36;
  self->_sharingRecipientPresent = a3;
}

- (BOOL)sharingRecipientPresent
{
  return self->_whichFeature == 36 && self->_sharingRecipientPresent;
}

- (void)deleteSharingRecipientPresent
{
  if (self->_whichFeature == 36)
  {
    self->_whichFeature = 0;
    self->_sharingRecipientPresent = 0;
  }
}

- (void)setSmsAttachmentExists:(BOOL)a3
{
  GRRSchemaGRRStringList *applicationsInForeground;
  NSString *configuredSiriLanguage;
  NSString *inputOrigin;
  NSString *previousFlowDomain;
  GRRSchemaGRRStringList *topTopics;

  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;

  self->_asrRank = 0;
  self->_canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_contactHasRequestedAddressDetail = 0;
  self->_contactMatchConfidence = 0.0;
  self->_deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_isActiveAlarmPresent = 0;
  self->_isActiveAppointmentPresent = 0;
  self->_isAnnounceEnabled = 0;
  self->_isAudioPlaying = 0;
  self->_isAppInstalled = 0;
  self->_isAppMatchPresent = 0;
  self->_isAppRunning = 0;
  self->_isArtistPresent = 0;
  self->_isContactNameResolved = 0;
  self->_isEmailAvailable = 0;
  self->_isFollowUp = 0;
  self->_isMediaItemEntityPresent = 0;
  self->_isMessagingPossible = 0;
  self->_isMessagingPossibleForSendMessageIntent = 0;
  self->_isPhoneCallPossible = 0;
  self->_isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_isPhoneNumberAvailable = 0;
  self->_isPhoneNumberContactResolvable = 0;
  self->_isPreviousTurnSendEmptyMessage = 0;
  self->_isSettingOn = 0;
  self->_isTimerActive = 0;
  self->_isVideoPlaying = 0;
  self->_numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_requestTimeBeginMs = 0;
  self->_sharingAppActive = 0;
  self->_sharingEntityPresent = 0;
  self->_sharingRecipientPresent = 0;
  self->_smsAttributeRecipientExists = 0;
  self->_smsAttributeSenderExists = 0;
  self->_smsPhoneNumberMentioned = 0;
  self->_smsTextPayloadExists = 0;
  self->_timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_whichFeature = 37;
  self->_smsAttachmentExists = a3;
}

- (BOOL)smsAttachmentExists
{
  return self->_whichFeature == 37 && self->_smsAttachmentExists;
}

- (void)deleteSmsAttachmentExists
{
  if (self->_whichFeature == 37)
  {
    self->_whichFeature = 0;
    self->_smsAttachmentExists = 0;
  }
}

- (void)setSmsAttributeRecipientExists:(BOOL)a3
{
  GRRSchemaGRRStringList *applicationsInForeground;
  NSString *configuredSiriLanguage;
  NSString *inputOrigin;
  NSString *previousFlowDomain;
  GRRSchemaGRRStringList *topTopics;

  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;

  self->_asrRank = 0;
  self->_canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_contactHasRequestedAddressDetail = 0;
  self->_contactMatchConfidence = 0.0;
  self->_deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_isActiveAlarmPresent = 0;
  self->_isActiveAppointmentPresent = 0;
  self->_isAnnounceEnabled = 0;
  self->_isAudioPlaying = 0;
  self->_isAppInstalled = 0;
  self->_isAppMatchPresent = 0;
  self->_isAppRunning = 0;
  self->_isArtistPresent = 0;
  self->_isContactNameResolved = 0;
  self->_isEmailAvailable = 0;
  self->_isFollowUp = 0;
  self->_isMediaItemEntityPresent = 0;
  self->_isMessagingPossible = 0;
  self->_isMessagingPossibleForSendMessageIntent = 0;
  self->_isPhoneCallPossible = 0;
  self->_isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_isPhoneNumberAvailable = 0;
  self->_isPhoneNumberContactResolvable = 0;
  self->_isPreviousTurnSendEmptyMessage = 0;
  self->_isSettingOn = 0;
  self->_isTimerActive = 0;
  self->_isVideoPlaying = 0;
  self->_numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_requestTimeBeginMs = 0;
  self->_sharingAppActive = 0;
  self->_sharingEntityPresent = 0;
  self->_sharingRecipientPresent = 0;
  self->_smsAttachmentExists = 0;
  self->_smsAttributeSenderExists = 0;
  self->_smsPhoneNumberMentioned = 0;
  self->_smsTextPayloadExists = 0;
  self->_timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_whichFeature = 38;
  self->_smsAttributeRecipientExists = a3;
}

- (BOOL)smsAttributeRecipientExists
{
  return self->_whichFeature == 38 && self->_smsAttributeRecipientExists;
}

- (void)deleteSmsAttributeRecipientExists
{
  if (self->_whichFeature == 38)
  {
    self->_whichFeature = 0;
    self->_smsAttributeRecipientExists = 0;
  }
}

- (void)setSmsAttributeSenderExists:(BOOL)a3
{
  GRRSchemaGRRStringList *applicationsInForeground;
  NSString *configuredSiriLanguage;
  NSString *inputOrigin;
  NSString *previousFlowDomain;
  GRRSchemaGRRStringList *topTopics;

  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;

  self->_asrRank = 0;
  self->_canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_contactHasRequestedAddressDetail = 0;
  self->_contactMatchConfidence = 0.0;
  self->_deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_isActiveAlarmPresent = 0;
  self->_isActiveAppointmentPresent = 0;
  self->_isAnnounceEnabled = 0;
  self->_isAudioPlaying = 0;
  self->_isAppInstalled = 0;
  self->_isAppMatchPresent = 0;
  self->_isAppRunning = 0;
  self->_isArtistPresent = 0;
  self->_isContactNameResolved = 0;
  self->_isEmailAvailable = 0;
  self->_isFollowUp = 0;
  self->_isMediaItemEntityPresent = 0;
  self->_isMessagingPossible = 0;
  self->_isMessagingPossibleForSendMessageIntent = 0;
  self->_isPhoneCallPossible = 0;
  self->_isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_isPhoneNumberAvailable = 0;
  self->_isPhoneNumberContactResolvable = 0;
  self->_isPreviousTurnSendEmptyMessage = 0;
  self->_isSettingOn = 0;
  self->_isTimerActive = 0;
  self->_isVideoPlaying = 0;
  self->_numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_requestTimeBeginMs = 0;
  self->_sharingAppActive = 0;
  self->_sharingEntityPresent = 0;
  self->_sharingRecipientPresent = 0;
  self->_smsAttachmentExists = 0;
  self->_smsAttributeRecipientExists = 0;
  self->_smsPhoneNumberMentioned = 0;
  self->_smsTextPayloadExists = 0;
  self->_timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_whichFeature = 39;
  self->_smsAttributeSenderExists = a3;
}

- (BOOL)smsAttributeSenderExists
{
  return self->_whichFeature == 39 && self->_smsAttributeSenderExists;
}

- (void)deleteSmsAttributeSenderExists
{
  if (self->_whichFeature == 39)
  {
    self->_whichFeature = 0;
    self->_smsAttributeSenderExists = 0;
  }
}

- (void)setSmsPhoneNumberMentioned:(BOOL)a3
{
  GRRSchemaGRRStringList *applicationsInForeground;
  NSString *configuredSiriLanguage;
  NSString *inputOrigin;
  NSString *previousFlowDomain;
  GRRSchemaGRRStringList *topTopics;

  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;

  self->_asrRank = 0;
  self->_canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_contactHasRequestedAddressDetail = 0;
  self->_contactMatchConfidence = 0.0;
  self->_deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_isActiveAlarmPresent = 0;
  self->_isActiveAppointmentPresent = 0;
  self->_isAnnounceEnabled = 0;
  self->_isAudioPlaying = 0;
  self->_isAppInstalled = 0;
  self->_isAppMatchPresent = 0;
  self->_isAppRunning = 0;
  self->_isArtistPresent = 0;
  self->_isContactNameResolved = 0;
  self->_isEmailAvailable = 0;
  self->_isFollowUp = 0;
  self->_isMediaItemEntityPresent = 0;
  self->_isMessagingPossible = 0;
  self->_isMessagingPossibleForSendMessageIntent = 0;
  self->_isPhoneCallPossible = 0;
  self->_isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_isPhoneNumberAvailable = 0;
  self->_isPhoneNumberContactResolvable = 0;
  self->_isPreviousTurnSendEmptyMessage = 0;
  self->_isSettingOn = 0;
  self->_isTimerActive = 0;
  self->_isVideoPlaying = 0;
  self->_numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_requestTimeBeginMs = 0;
  self->_sharingAppActive = 0;
  self->_sharingEntityPresent = 0;
  self->_sharingRecipientPresent = 0;
  self->_smsAttachmentExists = 0;
  self->_smsAttributeRecipientExists = 0;
  self->_smsAttributeSenderExists = 0;
  self->_smsTextPayloadExists = 0;
  self->_timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_whichFeature = 40;
  self->_smsPhoneNumberMentioned = a3;
}

- (BOOL)smsPhoneNumberMentioned
{
  return self->_whichFeature == 40 && self->_smsPhoneNumberMentioned;
}

- (void)deleteSmsPhoneNumberMentioned
{
  if (self->_whichFeature == 40)
  {
    self->_whichFeature = 0;
    self->_smsPhoneNumberMentioned = 0;
  }
}

- (void)setSmsTextPayloadExists:(BOOL)a3
{
  GRRSchemaGRRStringList *applicationsInForeground;
  NSString *configuredSiriLanguage;
  NSString *inputOrigin;
  NSString *previousFlowDomain;
  GRRSchemaGRRStringList *topTopics;

  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;

  self->_asrRank = 0;
  self->_canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_contactHasRequestedAddressDetail = 0;
  self->_contactMatchConfidence = 0.0;
  self->_deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_isActiveAlarmPresent = 0;
  self->_isActiveAppointmentPresent = 0;
  self->_isAnnounceEnabled = 0;
  self->_isAudioPlaying = 0;
  self->_isAppInstalled = 0;
  self->_isAppMatchPresent = 0;
  self->_isAppRunning = 0;
  self->_isArtistPresent = 0;
  self->_isContactNameResolved = 0;
  self->_isEmailAvailable = 0;
  self->_isFollowUp = 0;
  self->_isMediaItemEntityPresent = 0;
  self->_isMessagingPossible = 0;
  self->_isMessagingPossibleForSendMessageIntent = 0;
  self->_isPhoneCallPossible = 0;
  self->_isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_isPhoneNumberAvailable = 0;
  self->_isPhoneNumberContactResolvable = 0;
  self->_isPreviousTurnSendEmptyMessage = 0;
  self->_isSettingOn = 0;
  self->_isTimerActive = 0;
  self->_isVideoPlaying = 0;
  self->_numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_requestTimeBeginMs = 0;
  self->_sharingAppActive = 0;
  self->_sharingEntityPresent = 0;
  self->_sharingRecipientPresent = 0;
  self->_smsAttachmentExists = 0;
  self->_smsAttributeRecipientExists = 0;
  self->_smsAttributeSenderExists = 0;
  self->_smsPhoneNumberMentioned = 0;
  self->_timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_whichFeature = 41;
  self->_smsTextPayloadExists = a3;
}

- (BOOL)smsTextPayloadExists
{
  return self->_whichFeature == 41 && self->_smsTextPayloadExists;
}

- (void)deleteSmsTextPayloadExists
{
  if (self->_whichFeature == 41)
  {
    self->_whichFeature = 0;
    self->_smsTextPayloadExists = 0;
  }
}

- (void)setTimeSinceLastValidRequestMs:(unint64_t)a3
{
  GRRSchemaGRRStringList *applicationsInForeground;
  NSString *configuredSiriLanguage;
  NSString *inputOrigin;
  NSString *previousFlowDomain;
  GRRSchemaGRRStringList *topTopics;

  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;

  self->_asrRank = 0;
  self->_canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_contactHasRequestedAddressDetail = 0;
  self->_contactMatchConfidence = 0.0;
  self->_deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_isActiveAlarmPresent = 0;
  self->_isActiveAppointmentPresent = 0;
  self->_isAnnounceEnabled = 0;
  self->_isAudioPlaying = 0;
  self->_isAppInstalled = 0;
  self->_isAppMatchPresent = 0;
  self->_isAppRunning = 0;
  self->_isArtistPresent = 0;
  self->_isContactNameResolved = 0;
  self->_isEmailAvailable = 0;
  self->_isFollowUp = 0;
  self->_isMediaItemEntityPresent = 0;
  self->_isMessagingPossible = 0;
  self->_isMessagingPossibleForSendMessageIntent = 0;
  self->_isPhoneCallPossible = 0;
  self->_isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_isPhoneNumberAvailable = 0;
  self->_isPhoneNumberContactResolvable = 0;
  self->_isPreviousTurnSendEmptyMessage = 0;
  self->_isSettingOn = 0;
  self->_isTimerActive = 0;
  self->_isVideoPlaying = 0;
  self->_numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_requestTimeBeginMs = 0;
  self->_sharingAppActive = 0;
  self->_sharingEntityPresent = 0;
  self->_sharingRecipientPresent = 0;
  self->_smsAttachmentExists = 0;
  self->_smsAttributeRecipientExists = 0;
  self->_smsAttributeSenderExists = 0;
  self->_smsPhoneNumberMentioned = 0;
  self->_smsTextPayloadExists = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_whichFeature = 42;
  self->_timeSinceLastValidRequestMs = a3;
}

- (unint64_t)timeSinceLastValidRequestMs
{
  if (self->_whichFeature == 42)
    return self->_timeSinceLastValidRequestMs;
  else
    return 0;
}

- (void)deleteTimeSinceLastValidRequestMs
{
  if (self->_whichFeature == 42)
  {
    self->_whichFeature = 0;
    self->_timeSinceLastValidRequestMs = 0;
  }
}

- (void)setTopTopics:(id)a3
{
  GRRSchemaGRRStringList *v4;
  GRRSchemaGRRStringList *applicationsInForeground;
  NSString *configuredSiriLanguage;
  NSString *inputOrigin;
  NSString *previousFlowDomain;
  unint64_t v9;
  GRRSchemaGRRStringList *topTopics;

  v4 = (GRRSchemaGRRStringList *)a3;
  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;

  self->_asrRank = 0;
  self->_canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_contactHasRequestedAddressDetail = 0;
  self->_contactMatchConfidence = 0.0;
  self->_deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_isActiveAlarmPresent = 0;
  self->_isActiveAppointmentPresent = 0;
  self->_isAnnounceEnabled = 0;
  self->_isAudioPlaying = 0;
  self->_isAppInstalled = 0;
  self->_isAppMatchPresent = 0;
  self->_isAppRunning = 0;
  self->_isArtistPresent = 0;
  self->_isContactNameResolved = 0;
  self->_isEmailAvailable = 0;
  self->_isFollowUp = 0;
  self->_isMediaItemEntityPresent = 0;
  self->_isMessagingPossible = 0;
  self->_isMessagingPossibleForSendMessageIntent = 0;
  self->_isPhoneCallPossible = 0;
  self->_isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_isPhoneNumberAvailable = 0;
  self->_isPhoneNumberContactResolvable = 0;
  self->_isPreviousTurnSendEmptyMessage = 0;
  self->_isSettingOn = 0;
  self->_isTimerActive = 0;
  self->_isVideoPlaying = 0;
  self->_numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_requestTimeBeginMs = 0;
  self->_sharingAppActive = 0;
  self->_sharingEntityPresent = 0;
  self->_sharingRecipientPresent = 0;
  self->_smsAttachmentExists = 0;
  self->_smsAttributeRecipientExists = 0;
  self->_smsAttributeSenderExists = 0;
  self->_smsPhoneNumberMentioned = 0;
  self->_smsTextPayloadExists = 0;
  self->_timeSinceLastValidRequestMs = 0;
  v9 = 43;
  if (!v4)
    v9 = 0;
  self->_whichFeature = v9;
  topTopics = self->_topTopics;
  self->_topTopics = v4;

}

- (GRRSchemaGRRStringList)topTopics
{
  if (self->_whichFeature == 43)
    return self->_topTopics;
  else
    return (GRRSchemaGRRStringList *)0;
}

- (void)deleteTopTopics
{
  GRRSchemaGRRStringList *topTopics;

  if (self->_whichFeature == 43)
  {
    self->_whichFeature = 0;
    topTopics = self->_topTopics;
    self->_topTopics = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return GRRSchemaGRRFeatureReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  unint64_t whichFeature;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  -[GRRSchemaGRRFeature applicationsInForeground](self, "applicationsInForeground");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[GRRSchemaGRRFeature applicationsInForeground](self, "applicationsInForeground");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  whichFeature = self->_whichFeature;
  if (whichFeature == 2)
  {
    PBDataWriterWriteUint32Field();
    whichFeature = self->_whichFeature;
  }
  if (whichFeature == 3)
    PBDataWriterWriteBOOLField();
  -[GRRSchemaGRRFeature configuredSiriLanguage](self, "configuredSiriLanguage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    PBDataWriterWriteStringField();
  v8 = self->_whichFeature;
  if (v8 == 5)
  {
    PBDataWriterWriteBOOLField();
    v8 = self->_whichFeature;
  }
  if (v8 == 6)
  {
    PBDataWriterWriteDoubleField();
    v8 = self->_whichFeature;
  }
  if (v8 == 7)
    PBDataWriterWriteBOOLField();
  -[GRRSchemaGRRFeature inputOrigin](self, "inputOrigin");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    PBDataWriterWriteStringField();
  v10 = self->_whichFeature;
  if (v10 == 9)
  {
    PBDataWriterWriteBOOLField();
    v10 = self->_whichFeature;
  }
  if (v10 == 10)
  {
    PBDataWriterWriteBOOLField();
    v10 = self->_whichFeature;
  }
  if (v10 == 11)
  {
    PBDataWriterWriteBOOLField();
    v10 = self->_whichFeature;
  }
  if (v10 == 12)
  {
    PBDataWriterWriteBOOLField();
    v10 = self->_whichFeature;
  }
  if (v10 == 13)
  {
    PBDataWriterWriteBOOLField();
    v10 = self->_whichFeature;
  }
  if (v10 == 14)
  {
    PBDataWriterWriteBOOLField();
    v10 = self->_whichFeature;
  }
  if (v10 == 15)
  {
    PBDataWriterWriteBOOLField();
    v10 = self->_whichFeature;
  }
  if (v10 == 16)
  {
    PBDataWriterWriteBOOLField();
    v10 = self->_whichFeature;
  }
  if (v10 == 17)
  {
    PBDataWriterWriteBOOLField();
    v10 = self->_whichFeature;
  }
  if (v10 == 18)
  {
    PBDataWriterWriteBOOLField();
    v10 = self->_whichFeature;
  }
  if (v10 == 19)
  {
    PBDataWriterWriteBOOLField();
    v10 = self->_whichFeature;
  }
  if (v10 == 20)
  {
    PBDataWriterWriteBOOLField();
    v10 = self->_whichFeature;
  }
  if (v10 == 21)
  {
    PBDataWriterWriteBOOLField();
    v10 = self->_whichFeature;
  }
  if (v10 == 22)
  {
    PBDataWriterWriteBOOLField();
    v10 = self->_whichFeature;
  }
  if (v10 == 23)
  {
    PBDataWriterWriteBOOLField();
    v10 = self->_whichFeature;
  }
  if (v10 == 24)
  {
    PBDataWriterWriteBOOLField();
    v10 = self->_whichFeature;
  }
  if (v10 == 25)
  {
    PBDataWriterWriteBOOLField();
    v10 = self->_whichFeature;
  }
  if (v10 == 26)
  {
    PBDataWriterWriteBOOLField();
    v10 = self->_whichFeature;
  }
  if (v10 == 27)
  {
    PBDataWriterWriteBOOLField();
    v10 = self->_whichFeature;
  }
  if (v10 == 28)
  {
    PBDataWriterWriteBOOLField();
    v10 = self->_whichFeature;
  }
  if (v10 == 29)
  {
    PBDataWriterWriteBOOLField();
    v10 = self->_whichFeature;
  }
  if (v10 == 30)
  {
    PBDataWriterWriteBOOLField();
    v10 = self->_whichFeature;
  }
  if (v10 == 31)
    PBDataWriterWriteUint32Field();
  -[GRRSchemaGRRFeature previousFlowDomain](self, "previousFlowDomain");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    PBDataWriterWriteStringField();
  v12 = self->_whichFeature;
  if (v12 == 33)
  {
    PBDataWriterWriteUint64Field();
    v12 = self->_whichFeature;
  }
  if (v12 == 34)
  {
    PBDataWriterWriteBOOLField();
    v12 = self->_whichFeature;
  }
  if (v12 == 35)
  {
    PBDataWriterWriteBOOLField();
    v12 = self->_whichFeature;
  }
  if (v12 == 36)
  {
    PBDataWriterWriteBOOLField();
    v12 = self->_whichFeature;
  }
  if (v12 == 37)
  {
    PBDataWriterWriteBOOLField();
    v12 = self->_whichFeature;
  }
  if (v12 == 38)
  {
    PBDataWriterWriteBOOLField();
    v12 = self->_whichFeature;
  }
  if (v12 == 39)
  {
    PBDataWriterWriteBOOLField();
    v12 = self->_whichFeature;
  }
  if (v12 == 40)
  {
    PBDataWriterWriteBOOLField();
    v12 = self->_whichFeature;
  }
  if (v12 == 41)
  {
    PBDataWriterWriteBOOLField();
    v12 = self->_whichFeature;
  }
  if (v12 == 42)
    PBDataWriterWriteUint64Field();
  -[GRRSchemaGRRFeature topTopics](self, "topTopics");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = v16;
  if (v13)
  {
    -[GRRSchemaGRRFeature topTopics](self, "topTopics");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v14 = v16;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t whichFeature;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  unsigned int asrRank;
  int canResolveContactByRelationship;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  int contactHasRequestedAddressDetail;
  double contactMatchConfidence;
  double v22;
  int deviceIsPlayingAudio;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  int isActiveAlarmPresent;
  int isActiveAppointmentPresent;
  int isAnnounceEnabled;
  int isAudioPlaying;
  int isAppInstalled;
  int isAppMatchPresent;
  int isAppRunning;
  int isArtistPresent;
  int isContactNameResolved;
  int isEmailAvailable;
  int isFollowUp;
  int isMediaItemEntityPresent;
  int isMessagingPossible;
  int isMessagingPossibleForSendMessageIntent;
  int isPhoneCallPossible;
  int isPhoneCallPossibleForPhoneCallIntent;
  int isPhoneNumberAvailable;
  int isPhoneNumberContactResolvable;
  int isPreviousTurnSendEmptyMessage;
  int isSettingOn;
  int isTimerActive;
  int isVideoPlaying;
  unsigned int numberOfContactsResolved;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  unint64_t requestTimeBeginMs;
  int sharingAppActive;
  int sharingEntityPresent;
  int sharingRecipientPresent;
  int smsAttachmentExists;
  int smsAttributeRecipientExists;
  int smsAttributeSenderExists;
  int smsPhoneNumberMentioned;
  int smsTextPayloadExists;
  unint64_t timeSinceLastValidRequestMs;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  char v71;
  BOOL v72;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_66;
  whichFeature = self->_whichFeature;
  if (whichFeature != objc_msgSend(v4, "whichFeature"))
    goto LABEL_66;
  -[GRRSchemaGRRFeature applicationsInForeground](self, "applicationsInForeground");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applicationsInForeground");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_65;
  -[GRRSchemaGRRFeature applicationsInForeground](self, "applicationsInForeground");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[GRRSchemaGRRFeature applicationsInForeground](self, "applicationsInForeground");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "applicationsInForeground");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_66;
  }
  else
  {

  }
  asrRank = self->_asrRank;
  if (asrRank != objc_msgSend(v4, "asrRank"))
    goto LABEL_66;
  canResolveContactByRelationship = self->_canResolveContactByRelationship;
  if (canResolveContactByRelationship != objc_msgSend(v4, "canResolveContactByRelationship"))
    goto LABEL_66;
  -[GRRSchemaGRRFeature configuredSiriLanguage](self, "configuredSiriLanguage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configuredSiriLanguage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_65;
  -[GRRSchemaGRRFeature configuredSiriLanguage](self, "configuredSiriLanguage");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    -[GRRSchemaGRRFeature configuredSiriLanguage](self, "configuredSiriLanguage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "configuredSiriLanguage");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "isEqual:", v18);

    if (!v19)
      goto LABEL_66;
  }
  else
  {

  }
  contactHasRequestedAddressDetail = self->_contactHasRequestedAddressDetail;
  if (contactHasRequestedAddressDetail != objc_msgSend(v4, "contactHasRequestedAddressDetail"))
    goto LABEL_66;
  contactMatchConfidence = self->_contactMatchConfidence;
  objc_msgSend(v4, "contactMatchConfidence");
  if (contactMatchConfidence != v22)
    goto LABEL_66;
  deviceIsPlayingAudio = self->_deviceIsPlayingAudio;
  if (deviceIsPlayingAudio != objc_msgSend(v4, "deviceIsPlayingAudio"))
    goto LABEL_66;
  -[GRRSchemaGRRFeature inputOrigin](self, "inputOrigin");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inputOrigin");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_65;
  -[GRRSchemaGRRFeature inputOrigin](self, "inputOrigin");
  v24 = objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v25 = (void *)v24;
    -[GRRSchemaGRRFeature inputOrigin](self, "inputOrigin");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "inputOrigin");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v26, "isEqual:", v27);

    if (!v28)
      goto LABEL_66;
  }
  else
  {

  }
  isActiveAlarmPresent = self->_isActiveAlarmPresent;
  if (isActiveAlarmPresent != objc_msgSend(v4, "isActiveAlarmPresent"))
    goto LABEL_66;
  isActiveAppointmentPresent = self->_isActiveAppointmentPresent;
  if (isActiveAppointmentPresent != objc_msgSend(v4, "isActiveAppointmentPresent"))
    goto LABEL_66;
  isAnnounceEnabled = self->_isAnnounceEnabled;
  if (isAnnounceEnabled != objc_msgSend(v4, "isAnnounceEnabled"))
    goto LABEL_66;
  isAudioPlaying = self->_isAudioPlaying;
  if (isAudioPlaying != objc_msgSend(v4, "isAudioPlaying"))
    goto LABEL_66;
  isAppInstalled = self->_isAppInstalled;
  if (isAppInstalled != objc_msgSend(v4, "isAppInstalled"))
    goto LABEL_66;
  isAppMatchPresent = self->_isAppMatchPresent;
  if (isAppMatchPresent != objc_msgSend(v4, "isAppMatchPresent"))
    goto LABEL_66;
  isAppRunning = self->_isAppRunning;
  if (isAppRunning != objc_msgSend(v4, "isAppRunning"))
    goto LABEL_66;
  isArtistPresent = self->_isArtistPresent;
  if (isArtistPresent != objc_msgSend(v4, "isArtistPresent"))
    goto LABEL_66;
  isContactNameResolved = self->_isContactNameResolved;
  if (isContactNameResolved != objc_msgSend(v4, "isContactNameResolved"))
    goto LABEL_66;
  isEmailAvailable = self->_isEmailAvailable;
  if (isEmailAvailable != objc_msgSend(v4, "isEmailAvailable"))
    goto LABEL_66;
  isFollowUp = self->_isFollowUp;
  if (isFollowUp != objc_msgSend(v4, "isFollowUp"))
    goto LABEL_66;
  isMediaItemEntityPresent = self->_isMediaItemEntityPresent;
  if (isMediaItemEntityPresent != objc_msgSend(v4, "isMediaItemEntityPresent"))
    goto LABEL_66;
  isMessagingPossible = self->_isMessagingPossible;
  if (isMessagingPossible != objc_msgSend(v4, "isMessagingPossible"))
    goto LABEL_66;
  isMessagingPossibleForSendMessageIntent = self->_isMessagingPossibleForSendMessageIntent;
  if (isMessagingPossibleForSendMessageIntent != objc_msgSend(v4, "isMessagingPossibleForSendMessageIntent"))goto LABEL_66;
  isPhoneCallPossible = self->_isPhoneCallPossible;
  if (isPhoneCallPossible != objc_msgSend(v4, "isPhoneCallPossible"))
    goto LABEL_66;
  isPhoneCallPossibleForPhoneCallIntent = self->_isPhoneCallPossibleForPhoneCallIntent;
  if (isPhoneCallPossibleForPhoneCallIntent != objc_msgSend(v4, "isPhoneCallPossibleForPhoneCallIntent"))
    goto LABEL_66;
  isPhoneNumberAvailable = self->_isPhoneNumberAvailable;
  if (isPhoneNumberAvailable != objc_msgSend(v4, "isPhoneNumberAvailable"))
    goto LABEL_66;
  isPhoneNumberContactResolvable = self->_isPhoneNumberContactResolvable;
  if (isPhoneNumberContactResolvable != objc_msgSend(v4, "isPhoneNumberContactResolvable"))
    goto LABEL_66;
  isPreviousTurnSendEmptyMessage = self->_isPreviousTurnSendEmptyMessage;
  if (isPreviousTurnSendEmptyMessage != objc_msgSend(v4, "isPreviousTurnSendEmptyMessage"))
    goto LABEL_66;
  isSettingOn = self->_isSettingOn;
  if (isSettingOn != objc_msgSend(v4, "isSettingOn"))
    goto LABEL_66;
  isTimerActive = self->_isTimerActive;
  if (isTimerActive != objc_msgSend(v4, "isTimerActive"))
    goto LABEL_66;
  isVideoPlaying = self->_isVideoPlaying;
  if (isVideoPlaying != objc_msgSend(v4, "isVideoPlaying"))
    goto LABEL_66;
  numberOfContactsResolved = self->_numberOfContactsResolved;
  if (numberOfContactsResolved != objc_msgSend(v4, "numberOfContactsResolved"))
    goto LABEL_66;
  -[GRRSchemaGRRFeature previousFlowDomain](self, "previousFlowDomain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "previousFlowDomain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_65;
  -[GRRSchemaGRRFeature previousFlowDomain](self, "previousFlowDomain");
  v52 = objc_claimAutoreleasedReturnValue();
  if (v52)
  {
    v53 = (void *)v52;
    -[GRRSchemaGRRFeature previousFlowDomain](self, "previousFlowDomain");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "previousFlowDomain");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v54, "isEqual:", v55);

    if (!v56)
      goto LABEL_66;
  }
  else
  {

  }
  requestTimeBeginMs = self->_requestTimeBeginMs;
  if (requestTimeBeginMs != objc_msgSend(v4, "requestTimeBeginMs"))
    goto LABEL_66;
  sharingAppActive = self->_sharingAppActive;
  if (sharingAppActive != objc_msgSend(v4, "sharingAppActive"))
    goto LABEL_66;
  sharingEntityPresent = self->_sharingEntityPresent;
  if (sharingEntityPresent != objc_msgSend(v4, "sharingEntityPresent"))
    goto LABEL_66;
  sharingRecipientPresent = self->_sharingRecipientPresent;
  if (sharingRecipientPresent != objc_msgSend(v4, "sharingRecipientPresent"))
    goto LABEL_66;
  smsAttachmentExists = self->_smsAttachmentExists;
  if (smsAttachmentExists != objc_msgSend(v4, "smsAttachmentExists"))
    goto LABEL_66;
  smsAttributeRecipientExists = self->_smsAttributeRecipientExists;
  if (smsAttributeRecipientExists != objc_msgSend(v4, "smsAttributeRecipientExists"))
    goto LABEL_66;
  smsAttributeSenderExists = self->_smsAttributeSenderExists;
  if (smsAttributeSenderExists != objc_msgSend(v4, "smsAttributeSenderExists"))
    goto LABEL_66;
  smsPhoneNumberMentioned = self->_smsPhoneNumberMentioned;
  if (smsPhoneNumberMentioned != objc_msgSend(v4, "smsPhoneNumberMentioned"))
    goto LABEL_66;
  smsTextPayloadExists = self->_smsTextPayloadExists;
  if (smsTextPayloadExists != objc_msgSend(v4, "smsTextPayloadExists"))
    goto LABEL_66;
  timeSinceLastValidRequestMs = self->_timeSinceLastValidRequestMs;
  if (timeSinceLastValidRequestMs != objc_msgSend(v4, "timeSinceLastValidRequestMs"))
    goto LABEL_66;
  -[GRRSchemaGRRFeature topTopics](self, "topTopics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topTopics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[GRRSchemaGRRFeature topTopics](self, "topTopics");
    v67 = objc_claimAutoreleasedReturnValue();
    if (!v67)
    {

LABEL_69:
      v72 = 1;
      goto LABEL_67;
    }
    v68 = (void *)v67;
    -[GRRSchemaGRRFeature topTopics](self, "topTopics");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "topTopics");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = objc_msgSend(v69, "isEqual:", v70);

    if ((v71 & 1) != 0)
      goto LABEL_69;
  }
  else
  {
LABEL_65:

  }
LABEL_66:
  v72 = 0;
LABEL_67:

  return v72;
}

- (unint64_t)hash
{
  unint64_t whichFeature;
  uint64_t v4;
  NSUInteger v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double contactMatchConfidence;
  double v11;
  long double v12;
  double v13;
  NSUInteger v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSUInteger v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  NSUInteger v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  NSUInteger v60;

  v31 = -[GRRSchemaGRRStringList hash](self->_applicationsInForeground, "hash");
  whichFeature = self->_whichFeature;
  if (whichFeature == 3)
  {
    v4 = 0;
    v30 = 2654435761 * self->_canResolveContactByRelationship;
  }
  else if (whichFeature == 2)
  {
    v30 = 0;
    v4 = 2654435761 * self->_asrRank;
  }
  else
  {
    v4 = 0;
    v30 = 0;
  }
  v5 = -[NSString hash](self->_configuredSiriLanguage, "hash");
  v6 = self->_whichFeature;
  v28 = v5;
  switch(v6)
  {
    case 7uLL:
      v7 = 0;
      v9 = 0;
      v8 = 2654435761 * self->_deviceIsPlayingAudio;
      goto LABEL_19;
    case 6uLL:
      contactMatchConfidence = self->_contactMatchConfidence;
      v11 = -contactMatchConfidence;
      if (contactMatchConfidence >= 0.0)
        v11 = self->_contactMatchConfidence;
      v12 = floor(v11 + 0.5);
      v13 = (v11 - v12) * 1.84467441e19;
      v7 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
      if (v13 < 0.0)
      {
        v9 = 0;
        v8 = 0;
        v7 -= (unint64_t)fabs(v13);
        goto LABEL_19;
      }
      if (v13 > 0.0)
      {
        v9 = 0;
        v8 = 0;
        v7 += (unint64_t)v13;
        goto LABEL_19;
      }
      break;
    case 5uLL:
      v7 = 0;
      v8 = 0;
      v9 = 2654435761 * self->_contactHasRequestedAddressDetail;
      goto LABEL_19;
    default:
      v7 = 0;
      break;
  }
  v9 = 0;
  v8 = 0;
LABEL_19:
  v14 = -[NSString hash](self->_inputOrigin, "hash", v28);
  v15 = self->_whichFeature;
  switch(v15)
  {
    case 9uLL:
      v16 = 0;
      v17 = 0;
      v56 = 0;
      v57 = 0;
      v54 = 0;
      v55 = 0;
      v52 = 0;
      v53 = 0;
      v50 = 0;
      v51 = 0;
      v46 = 0;
      v47 = 0;
      v44 = 0;
      v45 = 0;
      v42 = 0;
      v43 = 0;
      v40 = 0;
      v41 = 0;
      v38 = 0;
      v39 = 0;
      v37 = 0;
      v48 = 2654435761 * self->_isActiveAlarmPresent;
      v49 = 0;
      break;
    case 0xAuLL:
      v16 = 0;
      v17 = 0;
      v56 = 0;
      v57 = 0;
      v54 = 0;
      v55 = 0;
      v52 = 0;
      v53 = 0;
      v50 = 0;
      v51 = 0;
      v47 = 0;
      v48 = 0;
      v45 = 0;
      v46 = 0;
      v43 = 0;
      v44 = 0;
      v41 = 0;
      v42 = 0;
      v39 = 0;
      v40 = 0;
      v37 = 0;
      v38 = 0;
      v49 = 2654435761 * self->_isActiveAppointmentPresent;
      break;
    case 0xBuLL:
      v16 = 0;
      v17 = 0;
      v56 = 0;
      v57 = 0;
      v54 = 0;
      v55 = 0;
      v52 = 0;
      v53 = 0;
      v50 = 0;
      v51 = 0;
      v48 = 0;
      v49 = 0;
      v45 = 0;
      v46 = 0;
      v43 = 0;
      v44 = 0;
      v41 = 0;
      v42 = 0;
      v39 = 0;
      v40 = 0;
      v37 = 0;
      v38 = 0;
      v47 = 2654435761 * self->_isAnnounceEnabled;
      break;
    case 0xCuLL:
      v16 = 0;
      v17 = 0;
      v56 = 0;
      v57 = 0;
      v54 = 0;
      v55 = 0;
      v52 = 0;
      v53 = 0;
      v48 = 0;
      v49 = 0;
      v46 = 0;
      v47 = 0;
      v44 = 0;
      v45 = 0;
      v42 = 0;
      v43 = 0;
      v40 = 0;
      v41 = 0;
      v38 = 0;
      v39 = 0;
      v37 = 0;
      v50 = 2654435761 * self->_isAudioPlaying;
      v51 = 0;
      break;
    case 0xDuLL:
      v16 = 0;
      v17 = 0;
      v56 = 0;
      v57 = 0;
      v54 = 0;
      v55 = 0;
      v52 = 0;
      v53 = 0;
      v50 = 0;
      v51 = 0;
      v48 = 0;
      v49 = 0;
      v44 = 0;
      v45 = 0;
      v42 = 0;
      v43 = 0;
      v40 = 0;
      v41 = 0;
      v38 = 0;
      v39 = 0;
      v37 = 0;
      v46 = 2654435761 * self->_isAppInstalled;
      v47 = 0;
      break;
    case 0xEuLL:
      v16 = 0;
      v17 = 0;
      v56 = 0;
      v57 = 0;
      v54 = 0;
      v55 = 0;
      v52 = 0;
      v53 = 0;
      v49 = 0;
      v50 = 0;
      v47 = 0;
      v48 = 0;
      v45 = 0;
      v46 = 0;
      v43 = 0;
      v44 = 0;
      v41 = 0;
      v42 = 0;
      v39 = 0;
      v40 = 0;
      v37 = 0;
      v38 = 0;
      v51 = 2654435761 * self->_isAppMatchPresent;
      break;
    case 0xFuLL:
      v16 = 0;
      v17 = 0;
      v56 = 0;
      v57 = 0;
      v54 = 0;
      v55 = 0;
      v52 = 0;
      v53 = 0;
      v50 = 0;
      v51 = 0;
      v48 = 0;
      v49 = 0;
      v46 = 0;
      v47 = 0;
      v43 = 0;
      v44 = 0;
      v41 = 0;
      v42 = 0;
      v39 = 0;
      v40 = 0;
      v37 = 0;
      v38 = 0;
      v45 = 2654435761 * self->_isAppRunning;
      break;
    case 0x10uLL:
      v16 = 0;
      v17 = 0;
      v56 = 0;
      v57 = 0;
      v54 = 0;
      v55 = 0;
      v53 = 0;
      v50 = 0;
      v51 = 0;
      v48 = 0;
      v49 = 0;
      v46 = 0;
      v47 = 0;
      v44 = 0;
      v45 = 0;
      v42 = 0;
      v43 = 0;
      v40 = 0;
      v41 = 0;
      v38 = 0;
      v39 = 0;
      v37 = 0;
      v52 = 2654435761 * self->_isArtistPresent;
      break;
    case 0x11uLL:
      v16 = 0;
      v17 = 0;
      v56 = 0;
      v57 = 0;
      v54 = 0;
      v55 = 0;
      v52 = 0;
      v53 = 0;
      v50 = 0;
      v51 = 0;
      v48 = 0;
      v49 = 0;
      v46 = 0;
      v47 = 0;
      v42 = 0;
      v43 = 0;
      v40 = 0;
      v41 = 0;
      v38 = 0;
      v39 = 0;
      v37 = 0;
      v44 = 2654435761 * self->_isContactNameResolved;
      v45 = 0;
      break;
    case 0x12uLL:
      v16 = 0;
      v17 = 0;
      v56 = 0;
      v57 = 0;
      v54 = 0;
      v55 = 0;
      v52 = 0;
      v50 = 0;
      v51 = 0;
      v48 = 0;
      v49 = 0;
      v46 = 0;
      v47 = 0;
      v44 = 0;
      v45 = 0;
      v42 = 0;
      v43 = 0;
      v40 = 0;
      v41 = 0;
      v38 = 0;
      v39 = 0;
      v37 = 0;
      v53 = 2654435761 * self->_isEmailAvailable;
      break;
    case 0x13uLL:
      v16 = 0;
      v17 = 0;
      v56 = 0;
      v57 = 0;
      v54 = 0;
      v55 = 0;
      v52 = 0;
      v53 = 0;
      v50 = 0;
      v51 = 0;
      v48 = 0;
      v49 = 0;
      v46 = 0;
      v47 = 0;
      v44 = 0;
      v45 = 0;
      v41 = 0;
      v42 = 0;
      v39 = 0;
      v40 = 0;
      v37 = 0;
      v38 = 0;
      v43 = 2654435761 * self->_isFollowUp;
      break;
    case 0x14uLL:
      v16 = 0;
      v17 = 0;
      v56 = 0;
      v57 = 0;
      v55 = 0;
      v52 = 0;
      v53 = 0;
      v50 = 0;
      v51 = 0;
      v48 = 0;
      v49 = 0;
      v46 = 0;
      v47 = 0;
      v44 = 0;
      v45 = 0;
      v42 = 0;
      v43 = 0;
      v40 = 0;
      v41 = 0;
      v38 = 0;
      v39 = 0;
      v37 = 0;
      v54 = 2654435761 * self->_isMediaItemEntityPresent;
      break;
    case 0x15uLL:
      v16 = 0;
      v17 = 0;
      v56 = 0;
      v57 = 0;
      v54 = 0;
      v55 = 0;
      v52 = 0;
      v53 = 0;
      v50 = 0;
      v51 = 0;
      v48 = 0;
      v49 = 0;
      v46 = 0;
      v47 = 0;
      v44 = 0;
      v45 = 0;
      v40 = 0;
      v41 = 0;
      v38 = 0;
      v39 = 0;
      v37 = 0;
      v42 = 2654435761 * self->_isMessagingPossible;
      v43 = 0;
      break;
    case 0x16uLL:
      v16 = 0;
      v17 = 0;
      v56 = 0;
      v57 = 0;
      v53 = 0;
      v54 = 0;
      v52 = 0;
      v50 = 0;
      v51 = 0;
      v48 = 0;
      v49 = 0;
      v46 = 0;
      v47 = 0;
      v44 = 0;
      v45 = 0;
      v42 = 0;
      v43 = 0;
      v40 = 0;
      v41 = 0;
      v38 = 0;
      v39 = 0;
      v37 = 0;
      v55 = 2654435761 * self->_isMessagingPossibleForSendMessageIntent;
      break;
    case 0x17uLL:
      v16 = 0;
      v17 = 0;
      v56 = 0;
      v57 = 0;
      v54 = 0;
      v55 = 0;
      v52 = 0;
      v53 = 0;
      v50 = 0;
      v51 = 0;
      v48 = 0;
      v49 = 0;
      v46 = 0;
      v47 = 0;
      v44 = 0;
      v45 = 0;
      v42 = 0;
      v43 = 0;
      v39 = 0;
      v40 = 0;
      v37 = 0;
      v38 = 0;
      v41 = 2654435761 * self->_isPhoneCallPossible;
      break;
    case 0x18uLL:
      v16 = 0;
      v17 = 0;
      v57 = 0;
      v54 = 0;
      v55 = 0;
      v52 = 0;
      v53 = 0;
      v50 = 0;
      v51 = 0;
      v48 = 0;
      v49 = 0;
      v46 = 0;
      v47 = 0;
      v44 = 0;
      v45 = 0;
      v42 = 0;
      v43 = 0;
      v40 = 0;
      v41 = 0;
      v38 = 0;
      v39 = 0;
      v37 = 0;
      v56 = 2654435761 * self->_isPhoneCallPossibleForPhoneCallIntent;
      break;
    case 0x19uLL:
      v16 = 0;
      v17 = 0;
      v56 = 0;
      v57 = 0;
      v54 = 0;
      v55 = 0;
      v52 = 0;
      v53 = 0;
      v50 = 0;
      v51 = 0;
      v48 = 0;
      v49 = 0;
      v46 = 0;
      v47 = 0;
      v44 = 0;
      v45 = 0;
      v42 = 0;
      v43 = 0;
      v38 = 0;
      v39 = 0;
      v37 = 0;
      v40 = 2654435761 * self->_isPhoneNumberAvailable;
      v41 = 0;
      break;
    case 0x1AuLL:
      v16 = 0;
      v17 = 0;
      v55 = 0;
      v56 = 0;
      v53 = 0;
      v54 = 0;
      v52 = 0;
      v50 = 0;
      v51 = 0;
      v48 = 0;
      v49 = 0;
      v46 = 0;
      v47 = 0;
      v44 = 0;
      v45 = 0;
      v42 = 0;
      v43 = 0;
      v40 = 0;
      v41 = 0;
      v38 = 0;
      v39 = 0;
      v37 = 0;
      v57 = 2654435761 * self->_isPhoneNumberContactResolvable;
      break;
    default:
      switch(v15)
      {
        case 0x1BuLL:
          v16 = 0;
          v17 = 0;
          v56 = 0;
          v57 = 0;
          v54 = 0;
          v55 = 0;
          v52 = 0;
          v53 = 0;
          v50 = 0;
          v51 = 0;
          v48 = 0;
          v49 = 0;
          v46 = 0;
          v47 = 0;
          v44 = 0;
          v45 = 0;
          v42 = 0;
          v43 = 0;
          v40 = 0;
          v41 = 0;
          v37 = 0;
          v38 = 0;
          v39 = 2654435761 * self->_isPreviousTurnSendEmptyMessage;
          break;
        case 0x1CuLL:
          v16 = 0;
          v56 = 0;
          v57 = 0;
          v54 = 0;
          v55 = 0;
          v52 = 0;
          v53 = 0;
          v50 = 0;
          v51 = 0;
          v48 = 0;
          v49 = 0;
          v46 = 0;
          v47 = 0;
          v44 = 0;
          v45 = 0;
          v42 = 0;
          v43 = 0;
          v40 = 0;
          v41 = 0;
          v38 = 0;
          v39 = 0;
          v37 = 0;
          v17 = 2654435761 * self->_isSettingOn;
          break;
        case 0x1DuLL:
          v16 = 0;
          v17 = 0;
          v56 = 0;
          v57 = 0;
          v54 = 0;
          v55 = 0;
          v52 = 0;
          v53 = 0;
          v50 = 0;
          v51 = 0;
          v48 = 0;
          v49 = 0;
          v46 = 0;
          v47 = 0;
          v44 = 0;
          v45 = 0;
          v42 = 0;
          v43 = 0;
          v40 = 0;
          v41 = 0;
          v37 = 0;
          v38 = 2654435761 * self->_isTimerActive;
          v39 = 0;
          break;
        case 0x1EuLL:
          v17 = 0;
          v56 = 0;
          v57 = 0;
          v54 = 0;
          v55 = 0;
          v52 = 0;
          v53 = 0;
          v50 = 0;
          v51 = 0;
          v48 = 0;
          v49 = 0;
          v46 = 0;
          v47 = 0;
          v44 = 0;
          v45 = 0;
          v42 = 0;
          v43 = 0;
          v40 = 0;
          v41 = 0;
          v38 = 0;
          v39 = 0;
          v37 = 0;
          v16 = 2654435761 * self->_isVideoPlaying;
          break;
        case 0x1FuLL:
          v16 = 0;
          v17 = 0;
          v56 = 0;
          v57 = 0;
          v54 = 0;
          v55 = 0;
          v52 = 0;
          v53 = 0;
          v50 = 0;
          v51 = 0;
          v48 = 0;
          v49 = 0;
          v46 = 0;
          v47 = 0;
          v44 = 0;
          v45 = 0;
          v42 = 0;
          v43 = 0;
          v40 = 0;
          v41 = 0;
          v38 = 0;
          v39 = 0;
          v37 = 2654435761 * self->_numberOfContactsResolved;
          break;
        default:
          v16 = 0;
          v17 = 0;
          v56 = 0;
          v57 = 0;
          v54 = 0;
          v55 = 0;
          v52 = 0;
          v53 = 0;
          v50 = 0;
          v51 = 0;
          v48 = 0;
          v49 = 0;
          v46 = 0;
          v47 = 0;
          v44 = 0;
          v45 = 0;
          v42 = 0;
          v43 = 0;
          v40 = 0;
          v41 = 0;
          v38 = 0;
          v39 = 0;
          v37 = 0;
          break;
      }
      break;
  }
  v18 = -[NSString hash](self->_previousFlowDomain, "hash");
  v19 = self->_whichFeature;
  v59 = v16;
  v60 = v14;
  v58 = v17;
  v20 = v8;
  v21 = v7;
  switch(v19)
  {
    case '!':
      v35 = 0;
      v36 = 0;
      v33 = 0;
      v34 = 0;
      v22 = 0;
      v23 = 0;
      v24 = 0;
      v25 = 0;
      v26 = 0;
      v32 = 2654435761u * self->_requestTimeBeginMs;
      break;
    case '"':
      v35 = 0;
      v36 = 0;
      v33 = 0;
      v34 = 0;
      v32 = 0;
      v23 = 0;
      v24 = 0;
      v25 = 0;
      v26 = 0;
      v22 = 2654435761 * self->_sharingAppActive;
      break;
    case '#':
      v35 = 0;
      v36 = 0;
      v32 = 0;
      v22 = 0;
      v23 = 0;
      v24 = 0;
      v25 = 0;
      v26 = 0;
      v33 = 2654435761 * self->_sharingEntityPresent;
      v34 = 0;
      break;
    case '$':
      v35 = 0;
      v36 = 0;
      v33 = 0;
      v34 = 0;
      v32 = 0;
      v22 = 0;
      v24 = 0;
      v25 = 0;
      v26 = 0;
      v23 = 2654435761 * self->_sharingRecipientPresent;
      break;
    case '%':
      v35 = 0;
      v36 = 0;
      v32 = 0;
      v33 = 0;
      v22 = 0;
      v23 = 0;
      v24 = 0;
      v25 = 0;
      v26 = 0;
      v34 = 2654435761 * self->_smsAttachmentExists;
      break;
    default:
      switch(v19)
      {
        case '&':
          v20 = v8;
          v21 = v7;
          v35 = 0;
          v36 = 0;
          v33 = 0;
          v34 = 0;
          v32 = 0;
          v22 = 0;
          v23 = 0;
          v25 = 0;
          v26 = 0;
          v24 = 2654435761 * self->_smsAttributeRecipientExists;
          break;
        case '\'':
          v20 = v8;
          v21 = v7;
          v33 = 0;
          v34 = 0;
          v32 = 0;
          v22 = 0;
          v23 = 0;
          v24 = 0;
          v25 = 0;
          v26 = 0;
          v35 = 2654435761 * self->_smsAttributeSenderExists;
          v36 = 0;
          break;
        case '(':
          v20 = v8;
          v21 = v7;
          v35 = 0;
          v36 = 0;
          v33 = 0;
          v34 = 0;
          v32 = 0;
          v22 = 0;
          v23 = 0;
          v24 = 0;
          v26 = 0;
          v25 = 2654435761 * self->_smsPhoneNumberMentioned;
          break;
        case ')':
          v20 = v8;
          v21 = v7;
          v34 = 0;
          v35 = 0;
          v32 = 0;
          v33 = 0;
          v22 = 0;
          v23 = 0;
          v24 = 0;
          v25 = 0;
          v26 = 0;
          v36 = 2654435761 * self->_smsTextPayloadExists;
          break;
        case '*':
          v20 = v8;
          v21 = v7;
          v35 = 0;
          v36 = 0;
          v33 = 0;
          v34 = 0;
          v32 = 0;
          v22 = 0;
          v23 = 0;
          v24 = 0;
          v25 = 0;
          v26 = 2654435761u * self->_timeSinceLastValidRequestMs;
          break;
        default:
          v20 = v8;
          v21 = v7;
          v35 = 0;
          v36 = 0;
          v33 = 0;
          v34 = 0;
          v32 = 0;
          v22 = 0;
          v23 = 0;
          v24 = 0;
          v25 = 0;
          v26 = 0;
          break;
      }
      break;
  }
  return v4 ^ v31 ^ v30 ^ v29 ^ v60 ^ v59 ^ v21 ^ v9 ^ v20 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v18 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ -[GRRSchemaGRRStringList hash](self->_topTopics, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t whichFeature;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  unint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_applicationsInForeground)
  {
    -[GRRSchemaGRRFeature applicationsInForeground](self, "applicationsInForeground");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("applicationsInForeground"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("applicationsInForeground"));

    }
  }
  whichFeature = self->_whichFeature;
  if (whichFeature == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[GRRSchemaGRRFeature asrRank](self, "asrRank"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("asrRank"));

    whichFeature = self->_whichFeature;
  }
  if (whichFeature == 3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[GRRSchemaGRRFeature canResolveContactByRelationship](self, "canResolveContactByRelationship"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("canResolveContactByRelationship"));

  }
  if (self->_configuredSiriLanguage)
  {
    -[GRRSchemaGRRFeature configuredSiriLanguage](self, "configuredSiriLanguage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("configuredSiriLanguage"));

  }
  v12 = self->_whichFeature;
  if (v12 == 5)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[GRRSchemaGRRFeature contactHasRequestedAddressDetail](self, "contactHasRequestedAddressDetail"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("contactHasRequestedAddressDetail"));

    v12 = self->_whichFeature;
  }
  if (v12 == 6)
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    -[GRRSchemaGRRFeature contactMatchConfidence](self, "contactMatchConfidence");
    objc_msgSend(v14, "numberWithDouble:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("contactMatchConfidence"));

    v12 = self->_whichFeature;
  }
  if (v12 == 7)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[GRRSchemaGRRFeature deviceIsPlayingAudio](self, "deviceIsPlayingAudio"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("deviceIsPlayingAudio"));

  }
  if (self->_inputOrigin)
  {
    -[GRRSchemaGRRFeature inputOrigin](self, "inputOrigin");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("inputOrigin"));

  }
  v19 = self->_whichFeature;
  if (v19 == 9)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[GRRSchemaGRRFeature isActiveAlarmPresent](self, "isActiveAlarmPresent"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("isActiveAlarmPresent"));

    v19 = self->_whichFeature;
  }
  if (v19 == 10)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[GRRSchemaGRRFeature isActiveAppointmentPresent](self, "isActiveAppointmentPresent"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("isActiveAppointmentPresent"));

    v19 = self->_whichFeature;
  }
  if (v19 == 11)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[GRRSchemaGRRFeature isAnnounceEnabled](self, "isAnnounceEnabled"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("isAnnounceEnabled"));

    v19 = self->_whichFeature;
  }
  if (v19 == 13)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[GRRSchemaGRRFeature isAppInstalled](self, "isAppInstalled"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("isAppInstalled"));

    v19 = self->_whichFeature;
  }
  if (v19 == 14)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[GRRSchemaGRRFeature isAppMatchPresent](self, "isAppMatchPresent"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("isAppMatchPresent"));

    v19 = self->_whichFeature;
  }
  if (v19 == 15)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[GRRSchemaGRRFeature isAppRunning](self, "isAppRunning"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("isAppRunning"));

    v19 = self->_whichFeature;
  }
  if (v19 == 16)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[GRRSchemaGRRFeature isArtistPresent](self, "isArtistPresent"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("isArtistPresent"));

    v19 = self->_whichFeature;
  }
  if (v19 == 12)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[GRRSchemaGRRFeature isAudioPlaying](self, "isAudioPlaying"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("isAudioPlaying"));

    v19 = self->_whichFeature;
  }
  if (v19 == 17)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[GRRSchemaGRRFeature isContactNameResolved](self, "isContactNameResolved"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("isContactNameResolved"));

    v19 = self->_whichFeature;
  }
  if (v19 == 18)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[GRRSchemaGRRFeature isEmailAvailable](self, "isEmailAvailable"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("isEmailAvailable"));

    v19 = self->_whichFeature;
  }
  if (v19 == 19)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[GRRSchemaGRRFeature isFollowUp](self, "isFollowUp"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("isFollowUp"));

    v19 = self->_whichFeature;
  }
  if (v19 == 20)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[GRRSchemaGRRFeature isMediaItemEntityPresent](self, "isMediaItemEntityPresent"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("isMediaItemEntityPresent"));

    v19 = self->_whichFeature;
  }
  if (v19 == 21)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[GRRSchemaGRRFeature isMessagingPossible](self, "isMessagingPossible"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("isMessagingPossible"));

    v19 = self->_whichFeature;
  }
  if (v19 == 22)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[GRRSchemaGRRFeature isMessagingPossibleForSendMessageIntent](self, "isMessagingPossibleForSendMessageIntent"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("isMessagingPossibleForSendMessageIntent"));

    v19 = self->_whichFeature;
  }
  if (v19 == 23)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[GRRSchemaGRRFeature isPhoneCallPossible](self, "isPhoneCallPossible"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("isPhoneCallPossible"));

    v19 = self->_whichFeature;
  }
  if (v19 == 24)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[GRRSchemaGRRFeature isPhoneCallPossibleForPhoneCallIntent](self, "isPhoneCallPossibleForPhoneCallIntent"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("isPhoneCallPossibleForPhoneCallIntent"));

    v19 = self->_whichFeature;
  }
  if (v19 == 25)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[GRRSchemaGRRFeature isPhoneNumberAvailable](self, "isPhoneNumberAvailable"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("isPhoneNumberAvailable"));

    v19 = self->_whichFeature;
  }
  if (v19 == 26)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[GRRSchemaGRRFeature isPhoneNumberContactResolvable](self, "isPhoneNumberContactResolvable"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("isPhoneNumberContactResolvable"));

    v19 = self->_whichFeature;
  }
  if (v19 == 27)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[GRRSchemaGRRFeature isPreviousTurnSendEmptyMessage](self, "isPreviousTurnSendEmptyMessage"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, CFSTR("isPreviousTurnSendEmptyMessage"));

    v19 = self->_whichFeature;
  }
  if (v19 == 28)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[GRRSchemaGRRFeature isSettingOn](self, "isSettingOn"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, CFSTR("isSettingOn"));

    v19 = self->_whichFeature;
  }
  if (v19 == 29)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[GRRSchemaGRRFeature isTimerActive](self, "isTimerActive"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v40, CFSTR("isTimerActive"));

    v19 = self->_whichFeature;
  }
  if (v19 == 30)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[GRRSchemaGRRFeature isVideoPlaying](self, "isVideoPlaying"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("isVideoPlaying"));

    v19 = self->_whichFeature;
  }
  if (v19 == 31)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[GRRSchemaGRRFeature numberOfContactsResolved](self, "numberOfContactsResolved"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v42, CFSTR("numberOfContactsResolved"));

  }
  if (self->_previousFlowDomain)
  {
    -[GRRSchemaGRRFeature previousFlowDomain](self, "previousFlowDomain");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = (void *)objc_msgSend(v43, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v44, CFSTR("previousFlowDomain"));

  }
  v45 = self->_whichFeature;
  if (v45 == 33)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[GRRSchemaGRRFeature requestTimeBeginMs](self, "requestTimeBeginMs"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v46, CFSTR("requestTimeBeginMs"));

    v45 = self->_whichFeature;
  }
  if (v45 == 34)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[GRRSchemaGRRFeature sharingAppActive](self, "sharingAppActive"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v47, CFSTR("sharingAppActive"));

    v45 = self->_whichFeature;
  }
  if (v45 == 35)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[GRRSchemaGRRFeature sharingEntityPresent](self, "sharingEntityPresent"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v48, CFSTR("sharingEntityPresent"));

    v45 = self->_whichFeature;
  }
  if (v45 == 36)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[GRRSchemaGRRFeature sharingRecipientPresent](self, "sharingRecipientPresent"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v49, CFSTR("sharingRecipientPresent"));

    v45 = self->_whichFeature;
  }
  if (v45 == 37)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[GRRSchemaGRRFeature smsAttachmentExists](self, "smsAttachmentExists"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v50, CFSTR("smsAttachmentExists"));

    v45 = self->_whichFeature;
  }
  if (v45 == 38)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[GRRSchemaGRRFeature smsAttributeRecipientExists](self, "smsAttributeRecipientExists"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v51, CFSTR("smsAttributeRecipientExists"));

    v45 = self->_whichFeature;
  }
  if (v45 == 39)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[GRRSchemaGRRFeature smsAttributeSenderExists](self, "smsAttributeSenderExists"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v52, CFSTR("smsAttributeSenderExists"));

    v45 = self->_whichFeature;
  }
  if (v45 == 40)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[GRRSchemaGRRFeature smsPhoneNumberMentioned](self, "smsPhoneNumberMentioned"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v53, CFSTR("smsPhoneNumberMentioned"));

    v45 = self->_whichFeature;
  }
  if (v45 == 41)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[GRRSchemaGRRFeature smsTextPayloadExists](self, "smsTextPayloadExists"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v54, CFSTR("smsTextPayloadExists"));

    v45 = self->_whichFeature;
  }
  if (v45 == 42)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[GRRSchemaGRRFeature timeSinceLastValidRequestMs](self, "timeSinceLastValidRequestMs"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v55, CFSTR("timeSinceLastValidRequestMs"));

  }
  if (self->_topTopics)
  {
    -[GRRSchemaGRRFeature topTopics](self, "topTopics");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "dictionaryRepresentation");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    if (v57)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v57, CFSTR("topTopics"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v58, CFSTR("topTopics"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  v59 = v3;

  return v59;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[GRRSchemaGRRFeature dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (GRRSchemaGRRFeature)initWithJSON:(id)a3
{
  void *v4;
  GRRSchemaGRRFeature *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[GRRSchemaGRRFeature initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (GRRSchemaGRRFeature)initWithDictionary:(id)a3
{
  id v4;
  GRRSchemaGRRFeature *v5;
  uint64_t v6;
  GRRSchemaGRRStringList *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  GRRSchemaGRRStringList *v56;
  GRRSchemaGRRFeature *v57;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  objc_super v95;

  v4 = a3;
  v95.receiver = self;
  v95.super_class = (Class)GRRSchemaGRRFeature;
  v5 = -[GRRSchemaGRRFeature init](&v95, sel_init);

  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("applicationsInForeground"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[GRRSchemaGRRStringList initWithDictionary:]([GRRSchemaGRRStringList alloc], "initWithDictionary:", v6);
      -[GRRSchemaGRRFeature setApplicationsInForeground:](v5, "setApplicationsInForeground:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("asrRank"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[GRRSchemaGRRFeature setAsrRank:](v5, "setAsrRank:", objc_msgSend(v8, "unsignedIntValue"));
    v67 = (void *)v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("canResolveContactByRelationship"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[GRRSchemaGRRFeature setCanResolveContactByRelationship:](v5, "setCanResolveContactByRelationship:", objc_msgSend(v9, "BOOLValue"));
    v65 = v9;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("configuredSiriLanguage"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(v10, "copy");
      -[GRRSchemaGRRFeature setConfiguredSiriLanguage:](v5, "setConfiguredSiriLanguage:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contactHasRequestedAddressDetail"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[GRRSchemaGRRFeature setContactHasRequestedAddressDetail:](v5, "setContactHasRequestedAddressDetail:", objc_msgSend(v12, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contactMatchConfidence"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v13, "doubleValue");
      -[GRRSchemaGRRFeature setContactMatchConfidence:](v5, "setContactMatchConfidence:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceIsPlayingAudio"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v94 = v14;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[GRRSchemaGRRFeature setDeviceIsPlayingAudio:](v5, "setDeviceIsPlayingAudio:", objc_msgSend(v14, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("inputOrigin"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v93 = v15;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = (void *)objc_msgSend(v15, "copy");
      -[GRRSchemaGRRFeature setInputOrigin:](v5, "setInputOrigin:", v16);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isActiveAlarmPresent"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v92 = v17;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[GRRSchemaGRRFeature setIsActiveAlarmPresent:](v5, "setIsActiveAlarmPresent:", objc_msgSend(v17, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isActiveAppointmentPresent"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v91 = v18;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[GRRSchemaGRRFeature setIsActiveAppointmentPresent:](v5, "setIsActiveAppointmentPresent:", objc_msgSend(v18, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isAnnounceEnabled"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v90 = v19;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[GRRSchemaGRRFeature setIsAnnounceEnabled:](v5, "setIsAnnounceEnabled:", objc_msgSend(v19, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isAudioPlaying"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v89 = v20;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[GRRSchemaGRRFeature setIsAudioPlaying:](v5, "setIsAudioPlaying:", objc_msgSend(v20, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isAppInstalled"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v88 = v21;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[GRRSchemaGRRFeature setIsAppInstalled:](v5, "setIsAppInstalled:", objc_msgSend(v21, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isAppMatchPresent"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v87 = v22;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[GRRSchemaGRRFeature setIsAppMatchPresent:](v5, "setIsAppMatchPresent:", objc_msgSend(v22, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isAppRunning"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v86 = v23;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[GRRSchemaGRRFeature setIsAppRunning:](v5, "setIsAppRunning:", objc_msgSend(v23, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isArtistPresent"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v85 = v24;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[GRRSchemaGRRFeature setIsArtistPresent:](v5, "setIsArtistPresent:", objc_msgSend(v24, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isContactNameResolved"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v84 = v25;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[GRRSchemaGRRFeature setIsContactNameResolved:](v5, "setIsContactNameResolved:", objc_msgSend(v25, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isEmailAvailable"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v83 = v26;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[GRRSchemaGRRFeature setIsEmailAvailable:](v5, "setIsEmailAvailable:", objc_msgSend(v26, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isFollowUp"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v82 = v27;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[GRRSchemaGRRFeature setIsFollowUp:](v5, "setIsFollowUp:", objc_msgSend(v27, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isMediaItemEntityPresent"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v81 = v28;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[GRRSchemaGRRFeature setIsMediaItemEntityPresent:](v5, "setIsMediaItemEntityPresent:", objc_msgSend(v28, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isMessagingPossible"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v80 = v29;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[GRRSchemaGRRFeature setIsMessagingPossible:](v5, "setIsMessagingPossible:", objc_msgSend(v29, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isMessagingPossibleForSendMessageIntent"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v79 = v30;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[GRRSchemaGRRFeature setIsMessagingPossibleForSendMessageIntent:](v5, "setIsMessagingPossibleForSendMessageIntent:", objc_msgSend(v30, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isPhoneCallPossible"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v78 = v31;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[GRRSchemaGRRFeature setIsPhoneCallPossible:](v5, "setIsPhoneCallPossible:", objc_msgSend(v31, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isPhoneCallPossibleForPhoneCallIntent"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v77 = v32;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[GRRSchemaGRRFeature setIsPhoneCallPossibleForPhoneCallIntent:](v5, "setIsPhoneCallPossibleForPhoneCallIntent:", objc_msgSend(v32, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isPhoneNumberAvailable"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v76 = v33;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[GRRSchemaGRRFeature setIsPhoneNumberAvailable:](v5, "setIsPhoneNumberAvailable:", objc_msgSend(v33, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isPhoneNumberContactResolvable"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v75 = v34;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[GRRSchemaGRRFeature setIsPhoneNumberContactResolvable:](v5, "setIsPhoneNumberContactResolvable:", objc_msgSend(v34, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isPreviousTurnSendEmptyMessage"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v74 = v35;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[GRRSchemaGRRFeature setIsPreviousTurnSendEmptyMessage:](v5, "setIsPreviousTurnSendEmptyMessage:", objc_msgSend(v35, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isSettingOn"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v73 = v36;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[GRRSchemaGRRFeature setIsSettingOn:](v5, "setIsSettingOn:", objc_msgSend(v36, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isTimerActive"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v72 = v37;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[GRRSchemaGRRFeature setIsTimerActive:](v5, "setIsTimerActive:", objc_msgSend(v37, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isVideoPlaying"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v71 = v38;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[GRRSchemaGRRFeature setIsVideoPlaying:](v5, "setIsVideoPlaying:", objc_msgSend(v38, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numberOfContactsResolved"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v70 = v39;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[GRRSchemaGRRFeature setNumberOfContactsResolved:](v5, "setNumberOfContactsResolved:", objc_msgSend(v39, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("previousFlowDomain"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v69 = v40;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v41 = (void *)objc_msgSend(v40, "copy");
      -[GRRSchemaGRRFeature setPreviousFlowDomain:](v5, "setPreviousFlowDomain:", v41);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requestTimeBeginMs"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[GRRSchemaGRRFeature setRequestTimeBeginMs:](v5, "setRequestTimeBeginMs:", objc_msgSend(v42, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sharingAppActive"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[GRRSchemaGRRFeature setSharingAppActive:](v5, "setSharingAppActive:", objc_msgSend(v43, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sharingEntityPresent"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v68 = v44;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[GRRSchemaGRRFeature setSharingEntityPresent:](v5, "setSharingEntityPresent:", objc_msgSend(v44, "BOOLValue"));
    v66 = v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sharingRecipientPresent"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[GRRSchemaGRRFeature setSharingRecipientPresent:](v5, "setSharingRecipientPresent:", objc_msgSend(v45, "BOOLValue"));
    v64 = v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("smsAttachmentExists"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[GRRSchemaGRRFeature setSmsAttachmentExists:](v5, "setSmsAttachmentExists:", objc_msgSend(v46, "BOOLValue"));
    v63 = v12;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("smsAttributeRecipientExists"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[GRRSchemaGRRFeature setSmsAttributeRecipientExists:](v5, "setSmsAttributeRecipientExists:", objc_msgSend(v47, "BOOLValue"));
    v62 = v13;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("smsAttributeSenderExists"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[GRRSchemaGRRFeature setSmsAttributeSenderExists:](v5, "setSmsAttributeSenderExists:", objc_msgSend(v48, "BOOLValue"));
    v61 = v42;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("smsPhoneNumberMentioned"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[GRRSchemaGRRFeature setSmsPhoneNumberMentioned:](v5, "setSmsPhoneNumberMentioned:", objc_msgSend(v49, "BOOLValue"));
    v60 = v43;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("smsTextPayloadExists"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[GRRSchemaGRRFeature setSmsTextPayloadExists:](v5, "setSmsTextPayloadExists:", objc_msgSend(v50, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeSinceLastValidRequestMs"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[GRRSchemaGRRFeature setTimeSinceLastValidRequestMs:](v5, "setTimeSinceLastValidRequestMs:", objc_msgSend(v51, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("topTopics"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v59 = v48;
      v53 = v47;
      v54 = v46;
      v55 = v45;
      v56 = -[GRRSchemaGRRStringList initWithDictionary:]([GRRSchemaGRRStringList alloc], "initWithDictionary:", v52);
      -[GRRSchemaGRRFeature setTopTopics:](v5, "setTopTopics:", v56);

      v45 = v55;
      v46 = v54;
      v47 = v53;
      v48 = v59;
    }
    v57 = v5;

  }
  return v5;
}

- (unint64_t)whichFeature
{
  return self->_whichFeature;
}

- (BOOL)hasApplicationsInForeground
{
  return self->_hasApplicationsInForeground;
}

- (void)setHasApplicationsInForeground:(BOOL)a3
{
  self->_hasApplicationsInForeground = a3;
}

- (BOOL)hasAsrRank
{
  return self->_hasAsrRank;
}

- (void)setHasAsrRank:(BOOL)a3
{
  self->_hasAsrRank = a3;
}

- (BOOL)hasCanResolveContactByRelationship
{
  return self->_hasCanResolveContactByRelationship;
}

- (void)setHasCanResolveContactByRelationship:(BOOL)a3
{
  self->_hasCanResolveContactByRelationship = a3;
}

- (BOOL)hasConfiguredSiriLanguage
{
  return self->_hasConfiguredSiriLanguage;
}

- (void)setHasConfiguredSiriLanguage:(BOOL)a3
{
  self->_hasConfiguredSiriLanguage = a3;
}

- (BOOL)hasContactHasRequestedAddressDetail
{
  return self->_hasContactHasRequestedAddressDetail;
}

- (void)setHasContactHasRequestedAddressDetail:(BOOL)a3
{
  self->_hasContactHasRequestedAddressDetail = a3;
}

- (BOOL)hasContactMatchConfidence
{
  return self->_hasContactMatchConfidence;
}

- (void)setHasContactMatchConfidence:(BOOL)a3
{
  self->_hasContactMatchConfidence = a3;
}

- (BOOL)hasDeviceIsPlayingAudio
{
  return self->_hasDeviceIsPlayingAudio;
}

- (void)setHasDeviceIsPlayingAudio:(BOOL)a3
{
  self->_hasDeviceIsPlayingAudio = a3;
}

- (BOOL)hasInputOrigin
{
  return self->_hasInputOrigin;
}

- (void)setHasInputOrigin:(BOOL)a3
{
  self->_hasInputOrigin = a3;
}

- (BOOL)hasIsActiveAlarmPresent
{
  return self->_hasIsActiveAlarmPresent;
}

- (void)setHasIsActiveAlarmPresent:(BOOL)a3
{
  self->_hasIsActiveAlarmPresent = a3;
}

- (BOOL)hasIsActiveAppointmentPresent
{
  return self->_hasIsActiveAppointmentPresent;
}

- (void)setHasIsActiveAppointmentPresent:(BOOL)a3
{
  self->_hasIsActiveAppointmentPresent = a3;
}

- (BOOL)hasIsAnnounceEnabled
{
  return self->_hasIsAnnounceEnabled;
}

- (void)setHasIsAnnounceEnabled:(BOOL)a3
{
  self->_hasIsAnnounceEnabled = a3;
}

- (BOOL)hasIsAudioPlaying
{
  return self->_hasIsAudioPlaying;
}

- (void)setHasIsAudioPlaying:(BOOL)a3
{
  self->_hasIsAudioPlaying = a3;
}

- (BOOL)hasIsAppInstalled
{
  return self->_hasIsAppInstalled;
}

- (void)setHasIsAppInstalled:(BOOL)a3
{
  self->_hasIsAppInstalled = a3;
}

- (BOOL)hasIsAppMatchPresent
{
  return self->_hasIsAppMatchPresent;
}

- (void)setHasIsAppMatchPresent:(BOOL)a3
{
  self->_hasIsAppMatchPresent = a3;
}

- (BOOL)hasIsAppRunning
{
  return self->_hasIsAppRunning;
}

- (void)setHasIsAppRunning:(BOOL)a3
{
  self->_hasIsAppRunning = a3;
}

- (BOOL)hasIsArtistPresent
{
  return self->_hasIsArtistPresent;
}

- (void)setHasIsArtistPresent:(BOOL)a3
{
  self->_hasIsArtistPresent = a3;
}

- (BOOL)hasIsContactNameResolved
{
  return self->_hasIsContactNameResolved;
}

- (void)setHasIsContactNameResolved:(BOOL)a3
{
  self->_hasIsContactNameResolved = a3;
}

- (BOOL)hasIsEmailAvailable
{
  return self->_hasIsEmailAvailable;
}

- (void)setHasIsEmailAvailable:(BOOL)a3
{
  self->_hasIsEmailAvailable = a3;
}

- (BOOL)hasIsFollowUp
{
  return self->_hasIsFollowUp;
}

- (void)setHasIsFollowUp:(BOOL)a3
{
  self->_hasIsFollowUp = a3;
}

- (BOOL)hasIsMediaItemEntityPresent
{
  return self->_hasIsMediaItemEntityPresent;
}

- (void)setHasIsMediaItemEntityPresent:(BOOL)a3
{
  self->_hasIsMediaItemEntityPresent = a3;
}

- (BOOL)hasIsMessagingPossible
{
  return self->_hasIsMessagingPossible;
}

- (void)setHasIsMessagingPossible:(BOOL)a3
{
  self->_hasIsMessagingPossible = a3;
}

- (BOOL)hasIsMessagingPossibleForSendMessageIntent
{
  return self->_hasIsMessagingPossibleForSendMessageIntent;
}

- (void)setHasIsMessagingPossibleForSendMessageIntent:(BOOL)a3
{
  self->_hasIsMessagingPossibleForSendMessageIntent = a3;
}

- (BOOL)hasIsPhoneCallPossible
{
  return self->_hasIsPhoneCallPossible;
}

- (void)setHasIsPhoneCallPossible:(BOOL)a3
{
  self->_hasIsPhoneCallPossible = a3;
}

- (BOOL)hasIsPhoneCallPossibleForPhoneCallIntent
{
  return self->_hasIsPhoneCallPossibleForPhoneCallIntent;
}

- (void)setHasIsPhoneCallPossibleForPhoneCallIntent:(BOOL)a3
{
  self->_hasIsPhoneCallPossibleForPhoneCallIntent = a3;
}

- (BOOL)hasIsPhoneNumberAvailable
{
  return self->_hasIsPhoneNumberAvailable;
}

- (void)setHasIsPhoneNumberAvailable:(BOOL)a3
{
  self->_hasIsPhoneNumberAvailable = a3;
}

- (BOOL)hasIsPhoneNumberContactResolvable
{
  return self->_hasIsPhoneNumberContactResolvable;
}

- (void)setHasIsPhoneNumberContactResolvable:(BOOL)a3
{
  self->_hasIsPhoneNumberContactResolvable = a3;
}

- (BOOL)hasIsPreviousTurnSendEmptyMessage
{
  return self->_hasIsPreviousTurnSendEmptyMessage;
}

- (void)setHasIsPreviousTurnSendEmptyMessage:(BOOL)a3
{
  self->_hasIsPreviousTurnSendEmptyMessage = a3;
}

- (BOOL)hasIsSettingOn
{
  return self->_hasIsSettingOn;
}

- (void)setHasIsSettingOn:(BOOL)a3
{
  self->_hasIsSettingOn = a3;
}

- (BOOL)hasIsTimerActive
{
  return self->_hasIsTimerActive;
}

- (void)setHasIsTimerActive:(BOOL)a3
{
  self->_hasIsTimerActive = a3;
}

- (BOOL)hasIsVideoPlaying
{
  return self->_hasIsVideoPlaying;
}

- (void)setHasIsVideoPlaying:(BOOL)a3
{
  self->_hasIsVideoPlaying = a3;
}

- (BOOL)hasNumberOfContactsResolved
{
  return self->_hasNumberOfContactsResolved;
}

- (void)setHasNumberOfContactsResolved:(BOOL)a3
{
  self->_hasNumberOfContactsResolved = a3;
}

- (BOOL)hasPreviousFlowDomain
{
  return self->_hasPreviousFlowDomain;
}

- (void)setHasPreviousFlowDomain:(BOOL)a3
{
  self->_hasPreviousFlowDomain = a3;
}

- (BOOL)hasRequestTimeBeginMs
{
  return self->_hasRequestTimeBeginMs;
}

- (void)setHasRequestTimeBeginMs:(BOOL)a3
{
  self->_hasRequestTimeBeginMs = a3;
}

- (BOOL)hasSharingAppActive
{
  return self->_hasSharingAppActive;
}

- (void)setHasSharingAppActive:(BOOL)a3
{
  self->_hasSharingAppActive = a3;
}

- (BOOL)hasSharingEntityPresent
{
  return self->_hasSharingEntityPresent;
}

- (void)setHasSharingEntityPresent:(BOOL)a3
{
  self->_hasSharingEntityPresent = a3;
}

- (BOOL)hasSharingRecipientPresent
{
  return self->_hasSharingRecipientPresent;
}

- (void)setHasSharingRecipientPresent:(BOOL)a3
{
  self->_hasSharingRecipientPresent = a3;
}

- (BOOL)hasSmsAttachmentExists
{
  return self->_hasSmsAttachmentExists;
}

- (void)setHasSmsAttachmentExists:(BOOL)a3
{
  self->_hasSmsAttachmentExists = a3;
}

- (BOOL)hasSmsAttributeRecipientExists
{
  return self->_hasSmsAttributeRecipientExists;
}

- (void)setHasSmsAttributeRecipientExists:(BOOL)a3
{
  self->_hasSmsAttributeRecipientExists = a3;
}

- (BOOL)hasSmsAttributeSenderExists
{
  return self->_hasSmsAttributeSenderExists;
}

- (void)setHasSmsAttributeSenderExists:(BOOL)a3
{
  self->_hasSmsAttributeSenderExists = a3;
}

- (BOOL)hasSmsPhoneNumberMentioned
{
  return self->_hasSmsPhoneNumberMentioned;
}

- (void)setHasSmsPhoneNumberMentioned:(BOOL)a3
{
  self->_hasSmsPhoneNumberMentioned = a3;
}

- (BOOL)hasSmsTextPayloadExists
{
  return self->_hasSmsTextPayloadExists;
}

- (void)setHasSmsTextPayloadExists:(BOOL)a3
{
  self->_hasSmsTextPayloadExists = a3;
}

- (BOOL)hasTimeSinceLastValidRequestMs
{
  return self->_hasTimeSinceLastValidRequestMs;
}

- (void)setHasTimeSinceLastValidRequestMs:(BOOL)a3
{
  self->_hasTimeSinceLastValidRequestMs = a3;
}

- (BOOL)hasTopTopics
{
  return self->_hasTopTopics;
}

- (void)setHasTopTopics:(BOOL)a3
{
  self->_hasTopTopics = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topTopics, 0);
  objc_storeStrong((id *)&self->_previousFlowDomain, 0);
  objc_storeStrong((id *)&self->_inputOrigin, 0);
  objc_storeStrong((id *)&self->_configuredSiriLanguage, 0);
  objc_storeStrong((id *)&self->_applicationsInForeground, 0);
}

@end
