@implementation FLOWSchemaFLOWDomainContext

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
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  int v38;
  objc_super v40;

  v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)FLOWSchemaFLOWDomainContext;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v40, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FLOWSchemaFLOWDomainContext voiceShortcutContext](self, "voiceShortcutContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[FLOWSchemaFLOWDomainContext deleteVoiceShortcutContext](self, "deleteVoiceShortcutContext");
  -[FLOWSchemaFLOWDomainContext homeAutomationContext](self, "homeAutomationContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[FLOWSchemaFLOWDomainContext deleteHomeAutomationContext](self, "deleteHomeAutomationContext");
  -[FLOWSchemaFLOWDomainContext phoneCallContext](self, "phoneCallContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[FLOWSchemaFLOWDomainContext deletePhoneCallContext](self, "deletePhoneCallContext");
  -[FLOWSchemaFLOWDomainContext smsContext](self, "smsContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[FLOWSchemaFLOWDomainContext deleteSmsContext](self, "deleteSmsContext");
  -[FLOWSchemaFLOWDomainContext mediaPlayerContext](self, "mediaPlayerContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[FLOWSchemaFLOWDomainContext deleteMediaPlayerContext](self, "deleteMediaPlayerContext");
  -[FLOWSchemaFLOWDomainContext identityContext](self, "identityContext");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "applySensitiveConditionsPolicy:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "suppressMessage");

  if (v23)
    -[FLOWSchemaFLOWDomainContext deleteIdentityContext](self, "deleteIdentityContext");
  -[FLOWSchemaFLOWDomainContext briefingContext](self, "briefingContext");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "applySensitiveConditionsPolicy:", v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "suppressMessage");

  if (v26)
    -[FLOWSchemaFLOWDomainContext deleteBriefingContext](self, "deleteBriefingContext");
  -[FLOWSchemaFLOWDomainContext pegasusContext](self, "pegasusContext");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "applySensitiveConditionsPolicy:", v4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "suppressMessage");

  if (v29)
    -[FLOWSchemaFLOWDomainContext deletePegasusContext](self, "deletePegasusContext");
  -[FLOWSchemaFLOWDomainContext informationPluginContext](self, "informationPluginContext");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "applySensitiveConditionsPolicy:", v4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "suppressMessage");

  if (v32)
    -[FLOWSchemaFLOWDomainContext deleteInformationPluginContext](self, "deleteInformationPluginContext");
  -[FLOWSchemaFLOWDomainContext homeCommunicationContext](self, "homeCommunicationContext");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "applySensitiveConditionsPolicy:", v4);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "suppressMessage");

  if (v35)
    -[FLOWSchemaFLOWDomainContext deleteHomeCommunicationContext](self, "deleteHomeCommunicationContext");
  -[FLOWSchemaFLOWDomainContext notificationContext](self, "notificationContext");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "applySensitiveConditionsPolicy:", v4);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "suppressMessage");

  if (v38)
    -[FLOWSchemaFLOWDomainContext deleteNotificationContext](self, "deleteNotificationContext");

  return v5;
}

- (void)setVoiceShortcutContext:(id)a3
{
  FLOWSchemaFLOWVoiceShortcutContext *v4;
  FLOWSchemaFLOWHomeAutomationContext *homeAutomationContext;
  FLOWSchemaFLOWPhoneCallContext *phoneCallContext;
  FLOWSchemaFLOWSmsContext *smsContext;
  FLOWSchemaFLOWMediaPlayerContext *mediaPlayerContext;
  FLOWSchemaFLOWIdentityContext *identityContext;
  FLOWSchemaFLOWBriefingContext *briefingContext;
  FLOWSchemaFLOWPegasusContext *pegasusContext;
  FLOWSchemaFLOWInformationPluginContext *informationPluginContext;
  FLOWSchemaFLOWHomeCommunicationContext *homeCommunicationContext;
  FLOWSchemaFLOWNotificationContext *notificationContext;
  FLOWSchemaFLOWVoiceShortcutContext *voiceShortcutContext;

  v4 = (FLOWSchemaFLOWVoiceShortcutContext *)a3;
  homeAutomationContext = self->_homeAutomationContext;
  self->_homeAutomationContext = 0;

  phoneCallContext = self->_phoneCallContext;
  self->_phoneCallContext = 0;

  smsContext = self->_smsContext;
  self->_smsContext = 0;

  mediaPlayerContext = self->_mediaPlayerContext;
  self->_mediaPlayerContext = 0;

  identityContext = self->_identityContext;
  self->_identityContext = 0;

  briefingContext = self->_briefingContext;
  self->_briefingContext = 0;

  pegasusContext = self->_pegasusContext;
  self->_pegasusContext = 0;

  informationPluginContext = self->_informationPluginContext;
  self->_informationPluginContext = 0;

  homeCommunicationContext = self->_homeCommunicationContext;
  self->_homeCommunicationContext = 0;

  notificationContext = self->_notificationContext;
  self->_notificationContext = 0;

  self->_whichDomaincontext = v4 != 0;
  voiceShortcutContext = self->_voiceShortcutContext;
  self->_voiceShortcutContext = v4;

}

- (FLOWSchemaFLOWVoiceShortcutContext)voiceShortcutContext
{
  if (self->_whichDomaincontext == 1)
    return self->_voiceShortcutContext;
  else
    return (FLOWSchemaFLOWVoiceShortcutContext *)0;
}

- (void)deleteVoiceShortcutContext
{
  FLOWSchemaFLOWVoiceShortcutContext *voiceShortcutContext;

  if (self->_whichDomaincontext == 1)
  {
    self->_whichDomaincontext = 0;
    voiceShortcutContext = self->_voiceShortcutContext;
    self->_voiceShortcutContext = 0;

  }
}

- (void)setHomeAutomationContext:(id)a3
{
  FLOWSchemaFLOWHomeAutomationContext *v4;
  FLOWSchemaFLOWVoiceShortcutContext *voiceShortcutContext;
  FLOWSchemaFLOWPhoneCallContext *phoneCallContext;
  FLOWSchemaFLOWSmsContext *smsContext;
  FLOWSchemaFLOWMediaPlayerContext *mediaPlayerContext;
  FLOWSchemaFLOWIdentityContext *identityContext;
  FLOWSchemaFLOWBriefingContext *briefingContext;
  FLOWSchemaFLOWPegasusContext *pegasusContext;
  FLOWSchemaFLOWInformationPluginContext *informationPluginContext;
  FLOWSchemaFLOWHomeCommunicationContext *homeCommunicationContext;
  FLOWSchemaFLOWNotificationContext *notificationContext;
  FLOWSchemaFLOWHomeAutomationContext *homeAutomationContext;

  v4 = (FLOWSchemaFLOWHomeAutomationContext *)a3;
  voiceShortcutContext = self->_voiceShortcutContext;
  self->_voiceShortcutContext = 0;

  phoneCallContext = self->_phoneCallContext;
  self->_phoneCallContext = 0;

  smsContext = self->_smsContext;
  self->_smsContext = 0;

  mediaPlayerContext = self->_mediaPlayerContext;
  self->_mediaPlayerContext = 0;

  identityContext = self->_identityContext;
  self->_identityContext = 0;

  briefingContext = self->_briefingContext;
  self->_briefingContext = 0;

  pegasusContext = self->_pegasusContext;
  self->_pegasusContext = 0;

  informationPluginContext = self->_informationPluginContext;
  self->_informationPluginContext = 0;

  homeCommunicationContext = self->_homeCommunicationContext;
  self->_homeCommunicationContext = 0;

  notificationContext = self->_notificationContext;
  self->_notificationContext = 0;

  self->_whichDomaincontext = 2 * (v4 != 0);
  homeAutomationContext = self->_homeAutomationContext;
  self->_homeAutomationContext = v4;

}

- (FLOWSchemaFLOWHomeAutomationContext)homeAutomationContext
{
  if (self->_whichDomaincontext == 2)
    return self->_homeAutomationContext;
  else
    return (FLOWSchemaFLOWHomeAutomationContext *)0;
}

- (void)deleteHomeAutomationContext
{
  FLOWSchemaFLOWHomeAutomationContext *homeAutomationContext;

  if (self->_whichDomaincontext == 2)
  {
    self->_whichDomaincontext = 0;
    homeAutomationContext = self->_homeAutomationContext;
    self->_homeAutomationContext = 0;

  }
}

- (void)setPhoneCallContext:(id)a3
{
  FLOWSchemaFLOWPhoneCallContext *v4;
  FLOWSchemaFLOWVoiceShortcutContext *voiceShortcutContext;
  FLOWSchemaFLOWHomeAutomationContext *homeAutomationContext;
  FLOWSchemaFLOWSmsContext *smsContext;
  FLOWSchemaFLOWMediaPlayerContext *mediaPlayerContext;
  FLOWSchemaFLOWIdentityContext *identityContext;
  FLOWSchemaFLOWBriefingContext *briefingContext;
  FLOWSchemaFLOWPegasusContext *pegasusContext;
  FLOWSchemaFLOWInformationPluginContext *informationPluginContext;
  FLOWSchemaFLOWHomeCommunicationContext *homeCommunicationContext;
  FLOWSchemaFLOWNotificationContext *notificationContext;
  unint64_t v15;
  FLOWSchemaFLOWPhoneCallContext *phoneCallContext;

  v4 = (FLOWSchemaFLOWPhoneCallContext *)a3;
  voiceShortcutContext = self->_voiceShortcutContext;
  self->_voiceShortcutContext = 0;

  homeAutomationContext = self->_homeAutomationContext;
  self->_homeAutomationContext = 0;

  smsContext = self->_smsContext;
  self->_smsContext = 0;

  mediaPlayerContext = self->_mediaPlayerContext;
  self->_mediaPlayerContext = 0;

  identityContext = self->_identityContext;
  self->_identityContext = 0;

  briefingContext = self->_briefingContext;
  self->_briefingContext = 0;

  pegasusContext = self->_pegasusContext;
  self->_pegasusContext = 0;

  informationPluginContext = self->_informationPluginContext;
  self->_informationPluginContext = 0;

  homeCommunicationContext = self->_homeCommunicationContext;
  self->_homeCommunicationContext = 0;

  notificationContext = self->_notificationContext;
  self->_notificationContext = 0;

  v15 = 3;
  if (!v4)
    v15 = 0;
  self->_whichDomaincontext = v15;
  phoneCallContext = self->_phoneCallContext;
  self->_phoneCallContext = v4;

}

- (FLOWSchemaFLOWPhoneCallContext)phoneCallContext
{
  if (self->_whichDomaincontext == 3)
    return self->_phoneCallContext;
  else
    return (FLOWSchemaFLOWPhoneCallContext *)0;
}

- (void)deletePhoneCallContext
{
  FLOWSchemaFLOWPhoneCallContext *phoneCallContext;

  if (self->_whichDomaincontext == 3)
  {
    self->_whichDomaincontext = 0;
    phoneCallContext = self->_phoneCallContext;
    self->_phoneCallContext = 0;

  }
}

- (void)setSmsContext:(id)a3
{
  FLOWSchemaFLOWSmsContext *v4;
  FLOWSchemaFLOWVoiceShortcutContext *voiceShortcutContext;
  FLOWSchemaFLOWHomeAutomationContext *homeAutomationContext;
  FLOWSchemaFLOWPhoneCallContext *phoneCallContext;
  FLOWSchemaFLOWMediaPlayerContext *mediaPlayerContext;
  FLOWSchemaFLOWIdentityContext *identityContext;
  FLOWSchemaFLOWBriefingContext *briefingContext;
  FLOWSchemaFLOWPegasusContext *pegasusContext;
  FLOWSchemaFLOWInformationPluginContext *informationPluginContext;
  FLOWSchemaFLOWHomeCommunicationContext *homeCommunicationContext;
  FLOWSchemaFLOWNotificationContext *notificationContext;
  FLOWSchemaFLOWSmsContext *smsContext;

  v4 = (FLOWSchemaFLOWSmsContext *)a3;
  voiceShortcutContext = self->_voiceShortcutContext;
  self->_voiceShortcutContext = 0;

  homeAutomationContext = self->_homeAutomationContext;
  self->_homeAutomationContext = 0;

  phoneCallContext = self->_phoneCallContext;
  self->_phoneCallContext = 0;

  mediaPlayerContext = self->_mediaPlayerContext;
  self->_mediaPlayerContext = 0;

  identityContext = self->_identityContext;
  self->_identityContext = 0;

  briefingContext = self->_briefingContext;
  self->_briefingContext = 0;

  pegasusContext = self->_pegasusContext;
  self->_pegasusContext = 0;

  informationPluginContext = self->_informationPluginContext;
  self->_informationPluginContext = 0;

  homeCommunicationContext = self->_homeCommunicationContext;
  self->_homeCommunicationContext = 0;

  notificationContext = self->_notificationContext;
  self->_notificationContext = 0;

  self->_whichDomaincontext = 4 * (v4 != 0);
  smsContext = self->_smsContext;
  self->_smsContext = v4;

}

- (FLOWSchemaFLOWSmsContext)smsContext
{
  if (self->_whichDomaincontext == 4)
    return self->_smsContext;
  else
    return (FLOWSchemaFLOWSmsContext *)0;
}

- (void)deleteSmsContext
{
  FLOWSchemaFLOWSmsContext *smsContext;

  if (self->_whichDomaincontext == 4)
  {
    self->_whichDomaincontext = 0;
    smsContext = self->_smsContext;
    self->_smsContext = 0;

  }
}

- (void)setMediaPlayerContext:(id)a3
{
  FLOWSchemaFLOWMediaPlayerContext *v4;
  FLOWSchemaFLOWVoiceShortcutContext *voiceShortcutContext;
  FLOWSchemaFLOWHomeAutomationContext *homeAutomationContext;
  FLOWSchemaFLOWPhoneCallContext *phoneCallContext;
  FLOWSchemaFLOWSmsContext *smsContext;
  FLOWSchemaFLOWIdentityContext *identityContext;
  FLOWSchemaFLOWBriefingContext *briefingContext;
  FLOWSchemaFLOWPegasusContext *pegasusContext;
  FLOWSchemaFLOWInformationPluginContext *informationPluginContext;
  FLOWSchemaFLOWHomeCommunicationContext *homeCommunicationContext;
  FLOWSchemaFLOWNotificationContext *notificationContext;
  unint64_t v15;
  FLOWSchemaFLOWMediaPlayerContext *mediaPlayerContext;

  v4 = (FLOWSchemaFLOWMediaPlayerContext *)a3;
  voiceShortcutContext = self->_voiceShortcutContext;
  self->_voiceShortcutContext = 0;

  homeAutomationContext = self->_homeAutomationContext;
  self->_homeAutomationContext = 0;

  phoneCallContext = self->_phoneCallContext;
  self->_phoneCallContext = 0;

  smsContext = self->_smsContext;
  self->_smsContext = 0;

  identityContext = self->_identityContext;
  self->_identityContext = 0;

  briefingContext = self->_briefingContext;
  self->_briefingContext = 0;

  pegasusContext = self->_pegasusContext;
  self->_pegasusContext = 0;

  informationPluginContext = self->_informationPluginContext;
  self->_informationPluginContext = 0;

  homeCommunicationContext = self->_homeCommunicationContext;
  self->_homeCommunicationContext = 0;

  notificationContext = self->_notificationContext;
  self->_notificationContext = 0;

  v15 = 5;
  if (!v4)
    v15 = 0;
  self->_whichDomaincontext = v15;
  mediaPlayerContext = self->_mediaPlayerContext;
  self->_mediaPlayerContext = v4;

}

- (FLOWSchemaFLOWMediaPlayerContext)mediaPlayerContext
{
  if (self->_whichDomaincontext == 5)
    return self->_mediaPlayerContext;
  else
    return (FLOWSchemaFLOWMediaPlayerContext *)0;
}

- (void)deleteMediaPlayerContext
{
  FLOWSchemaFLOWMediaPlayerContext *mediaPlayerContext;

  if (self->_whichDomaincontext == 5)
  {
    self->_whichDomaincontext = 0;
    mediaPlayerContext = self->_mediaPlayerContext;
    self->_mediaPlayerContext = 0;

  }
}

- (void)setIdentityContext:(id)a3
{
  FLOWSchemaFLOWIdentityContext *v4;
  FLOWSchemaFLOWVoiceShortcutContext *voiceShortcutContext;
  FLOWSchemaFLOWHomeAutomationContext *homeAutomationContext;
  FLOWSchemaFLOWPhoneCallContext *phoneCallContext;
  FLOWSchemaFLOWSmsContext *smsContext;
  FLOWSchemaFLOWMediaPlayerContext *mediaPlayerContext;
  FLOWSchemaFLOWBriefingContext *briefingContext;
  FLOWSchemaFLOWPegasusContext *pegasusContext;
  FLOWSchemaFLOWInformationPluginContext *informationPluginContext;
  FLOWSchemaFLOWHomeCommunicationContext *homeCommunicationContext;
  FLOWSchemaFLOWNotificationContext *notificationContext;
  unint64_t v15;
  FLOWSchemaFLOWIdentityContext *identityContext;

  v4 = (FLOWSchemaFLOWIdentityContext *)a3;
  voiceShortcutContext = self->_voiceShortcutContext;
  self->_voiceShortcutContext = 0;

  homeAutomationContext = self->_homeAutomationContext;
  self->_homeAutomationContext = 0;

  phoneCallContext = self->_phoneCallContext;
  self->_phoneCallContext = 0;

  smsContext = self->_smsContext;
  self->_smsContext = 0;

  mediaPlayerContext = self->_mediaPlayerContext;
  self->_mediaPlayerContext = 0;

  briefingContext = self->_briefingContext;
  self->_briefingContext = 0;

  pegasusContext = self->_pegasusContext;
  self->_pegasusContext = 0;

  informationPluginContext = self->_informationPluginContext;
  self->_informationPluginContext = 0;

  homeCommunicationContext = self->_homeCommunicationContext;
  self->_homeCommunicationContext = 0;

  notificationContext = self->_notificationContext;
  self->_notificationContext = 0;

  v15 = 6;
  if (!v4)
    v15 = 0;
  self->_whichDomaincontext = v15;
  identityContext = self->_identityContext;
  self->_identityContext = v4;

}

- (FLOWSchemaFLOWIdentityContext)identityContext
{
  if (self->_whichDomaincontext == 6)
    return self->_identityContext;
  else
    return (FLOWSchemaFLOWIdentityContext *)0;
}

- (void)deleteIdentityContext
{
  FLOWSchemaFLOWIdentityContext *identityContext;

  if (self->_whichDomaincontext == 6)
  {
    self->_whichDomaincontext = 0;
    identityContext = self->_identityContext;
    self->_identityContext = 0;

  }
}

- (void)setBriefingContext:(id)a3
{
  FLOWSchemaFLOWBriefingContext *v4;
  FLOWSchemaFLOWVoiceShortcutContext *voiceShortcutContext;
  FLOWSchemaFLOWHomeAutomationContext *homeAutomationContext;
  FLOWSchemaFLOWPhoneCallContext *phoneCallContext;
  FLOWSchemaFLOWSmsContext *smsContext;
  FLOWSchemaFLOWMediaPlayerContext *mediaPlayerContext;
  FLOWSchemaFLOWIdentityContext *identityContext;
  FLOWSchemaFLOWPegasusContext *pegasusContext;
  FLOWSchemaFLOWInformationPluginContext *informationPluginContext;
  FLOWSchemaFLOWHomeCommunicationContext *homeCommunicationContext;
  FLOWSchemaFLOWNotificationContext *notificationContext;
  unint64_t v15;
  FLOWSchemaFLOWBriefingContext *briefingContext;

  v4 = (FLOWSchemaFLOWBriefingContext *)a3;
  voiceShortcutContext = self->_voiceShortcutContext;
  self->_voiceShortcutContext = 0;

  homeAutomationContext = self->_homeAutomationContext;
  self->_homeAutomationContext = 0;

  phoneCallContext = self->_phoneCallContext;
  self->_phoneCallContext = 0;

  smsContext = self->_smsContext;
  self->_smsContext = 0;

  mediaPlayerContext = self->_mediaPlayerContext;
  self->_mediaPlayerContext = 0;

  identityContext = self->_identityContext;
  self->_identityContext = 0;

  pegasusContext = self->_pegasusContext;
  self->_pegasusContext = 0;

  informationPluginContext = self->_informationPluginContext;
  self->_informationPluginContext = 0;

  homeCommunicationContext = self->_homeCommunicationContext;
  self->_homeCommunicationContext = 0;

  notificationContext = self->_notificationContext;
  self->_notificationContext = 0;

  v15 = 7;
  if (!v4)
    v15 = 0;
  self->_whichDomaincontext = v15;
  briefingContext = self->_briefingContext;
  self->_briefingContext = v4;

}

- (FLOWSchemaFLOWBriefingContext)briefingContext
{
  if (self->_whichDomaincontext == 7)
    return self->_briefingContext;
  else
    return (FLOWSchemaFLOWBriefingContext *)0;
}

- (void)deleteBriefingContext
{
  FLOWSchemaFLOWBriefingContext *briefingContext;

  if (self->_whichDomaincontext == 7)
  {
    self->_whichDomaincontext = 0;
    briefingContext = self->_briefingContext;
    self->_briefingContext = 0;

  }
}

- (void)setPegasusContext:(id)a3
{
  FLOWSchemaFLOWPegasusContext *v4;
  FLOWSchemaFLOWVoiceShortcutContext *voiceShortcutContext;
  FLOWSchemaFLOWHomeAutomationContext *homeAutomationContext;
  FLOWSchemaFLOWPhoneCallContext *phoneCallContext;
  FLOWSchemaFLOWSmsContext *smsContext;
  FLOWSchemaFLOWMediaPlayerContext *mediaPlayerContext;
  FLOWSchemaFLOWIdentityContext *identityContext;
  FLOWSchemaFLOWBriefingContext *briefingContext;
  FLOWSchemaFLOWInformationPluginContext *informationPluginContext;
  FLOWSchemaFLOWHomeCommunicationContext *homeCommunicationContext;
  FLOWSchemaFLOWNotificationContext *notificationContext;
  FLOWSchemaFLOWPegasusContext *pegasusContext;

  v4 = (FLOWSchemaFLOWPegasusContext *)a3;
  voiceShortcutContext = self->_voiceShortcutContext;
  self->_voiceShortcutContext = 0;

  homeAutomationContext = self->_homeAutomationContext;
  self->_homeAutomationContext = 0;

  phoneCallContext = self->_phoneCallContext;
  self->_phoneCallContext = 0;

  smsContext = self->_smsContext;
  self->_smsContext = 0;

  mediaPlayerContext = self->_mediaPlayerContext;
  self->_mediaPlayerContext = 0;

  identityContext = self->_identityContext;
  self->_identityContext = 0;

  briefingContext = self->_briefingContext;
  self->_briefingContext = 0;

  informationPluginContext = self->_informationPluginContext;
  self->_informationPluginContext = 0;

  homeCommunicationContext = self->_homeCommunicationContext;
  self->_homeCommunicationContext = 0;

  notificationContext = self->_notificationContext;
  self->_notificationContext = 0;

  self->_whichDomaincontext = 8 * (v4 != 0);
  pegasusContext = self->_pegasusContext;
  self->_pegasusContext = v4;

}

- (FLOWSchemaFLOWPegasusContext)pegasusContext
{
  if (self->_whichDomaincontext == 8)
    return self->_pegasusContext;
  else
    return (FLOWSchemaFLOWPegasusContext *)0;
}

- (void)deletePegasusContext
{
  FLOWSchemaFLOWPegasusContext *pegasusContext;

  if (self->_whichDomaincontext == 8)
  {
    self->_whichDomaincontext = 0;
    pegasusContext = self->_pegasusContext;
    self->_pegasusContext = 0;

  }
}

- (void)setInformationPluginContext:(id)a3
{
  FLOWSchemaFLOWInformationPluginContext *v4;
  FLOWSchemaFLOWVoiceShortcutContext *voiceShortcutContext;
  FLOWSchemaFLOWHomeAutomationContext *homeAutomationContext;
  FLOWSchemaFLOWPhoneCallContext *phoneCallContext;
  FLOWSchemaFLOWSmsContext *smsContext;
  FLOWSchemaFLOWMediaPlayerContext *mediaPlayerContext;
  FLOWSchemaFLOWIdentityContext *identityContext;
  FLOWSchemaFLOWBriefingContext *briefingContext;
  FLOWSchemaFLOWPegasusContext *pegasusContext;
  FLOWSchemaFLOWHomeCommunicationContext *homeCommunicationContext;
  FLOWSchemaFLOWNotificationContext *notificationContext;
  unint64_t v15;
  FLOWSchemaFLOWInformationPluginContext *informationPluginContext;

  v4 = (FLOWSchemaFLOWInformationPluginContext *)a3;
  voiceShortcutContext = self->_voiceShortcutContext;
  self->_voiceShortcutContext = 0;

  homeAutomationContext = self->_homeAutomationContext;
  self->_homeAutomationContext = 0;

  phoneCallContext = self->_phoneCallContext;
  self->_phoneCallContext = 0;

  smsContext = self->_smsContext;
  self->_smsContext = 0;

  mediaPlayerContext = self->_mediaPlayerContext;
  self->_mediaPlayerContext = 0;

  identityContext = self->_identityContext;
  self->_identityContext = 0;

  briefingContext = self->_briefingContext;
  self->_briefingContext = 0;

  pegasusContext = self->_pegasusContext;
  self->_pegasusContext = 0;

  homeCommunicationContext = self->_homeCommunicationContext;
  self->_homeCommunicationContext = 0;

  notificationContext = self->_notificationContext;
  self->_notificationContext = 0;

  v15 = 9;
  if (!v4)
    v15 = 0;
  self->_whichDomaincontext = v15;
  informationPluginContext = self->_informationPluginContext;
  self->_informationPluginContext = v4;

}

- (FLOWSchemaFLOWInformationPluginContext)informationPluginContext
{
  if (self->_whichDomaincontext == 9)
    return self->_informationPluginContext;
  else
    return (FLOWSchemaFLOWInformationPluginContext *)0;
}

- (void)deleteInformationPluginContext
{
  FLOWSchemaFLOWInformationPluginContext *informationPluginContext;

  if (self->_whichDomaincontext == 9)
  {
    self->_whichDomaincontext = 0;
    informationPluginContext = self->_informationPluginContext;
    self->_informationPluginContext = 0;

  }
}

- (void)setHomeCommunicationContext:(id)a3
{
  FLOWSchemaFLOWHomeCommunicationContext *v4;
  FLOWSchemaFLOWVoiceShortcutContext *voiceShortcutContext;
  FLOWSchemaFLOWHomeAutomationContext *homeAutomationContext;
  FLOWSchemaFLOWPhoneCallContext *phoneCallContext;
  FLOWSchemaFLOWSmsContext *smsContext;
  FLOWSchemaFLOWMediaPlayerContext *mediaPlayerContext;
  FLOWSchemaFLOWIdentityContext *identityContext;
  FLOWSchemaFLOWBriefingContext *briefingContext;
  FLOWSchemaFLOWPegasusContext *pegasusContext;
  FLOWSchemaFLOWInformationPluginContext *informationPluginContext;
  FLOWSchemaFLOWNotificationContext *notificationContext;
  unint64_t v15;
  FLOWSchemaFLOWHomeCommunicationContext *homeCommunicationContext;

  v4 = (FLOWSchemaFLOWHomeCommunicationContext *)a3;
  voiceShortcutContext = self->_voiceShortcutContext;
  self->_voiceShortcutContext = 0;

  homeAutomationContext = self->_homeAutomationContext;
  self->_homeAutomationContext = 0;

  phoneCallContext = self->_phoneCallContext;
  self->_phoneCallContext = 0;

  smsContext = self->_smsContext;
  self->_smsContext = 0;

  mediaPlayerContext = self->_mediaPlayerContext;
  self->_mediaPlayerContext = 0;

  identityContext = self->_identityContext;
  self->_identityContext = 0;

  briefingContext = self->_briefingContext;
  self->_briefingContext = 0;

  pegasusContext = self->_pegasusContext;
  self->_pegasusContext = 0;

  informationPluginContext = self->_informationPluginContext;
  self->_informationPluginContext = 0;

  notificationContext = self->_notificationContext;
  self->_notificationContext = 0;

  v15 = 10;
  if (!v4)
    v15 = 0;
  self->_whichDomaincontext = v15;
  homeCommunicationContext = self->_homeCommunicationContext;
  self->_homeCommunicationContext = v4;

}

- (FLOWSchemaFLOWHomeCommunicationContext)homeCommunicationContext
{
  if (self->_whichDomaincontext == 10)
    return self->_homeCommunicationContext;
  else
    return (FLOWSchemaFLOWHomeCommunicationContext *)0;
}

- (void)deleteHomeCommunicationContext
{
  FLOWSchemaFLOWHomeCommunicationContext *homeCommunicationContext;

  if (self->_whichDomaincontext == 10)
  {
    self->_whichDomaincontext = 0;
    homeCommunicationContext = self->_homeCommunicationContext;
    self->_homeCommunicationContext = 0;

  }
}

- (void)setNotificationContext:(id)a3
{
  FLOWSchemaFLOWNotificationContext *v4;
  FLOWSchemaFLOWVoiceShortcutContext *voiceShortcutContext;
  FLOWSchemaFLOWHomeAutomationContext *homeAutomationContext;
  FLOWSchemaFLOWPhoneCallContext *phoneCallContext;
  FLOWSchemaFLOWSmsContext *smsContext;
  FLOWSchemaFLOWMediaPlayerContext *mediaPlayerContext;
  FLOWSchemaFLOWIdentityContext *identityContext;
  FLOWSchemaFLOWBriefingContext *briefingContext;
  FLOWSchemaFLOWPegasusContext *pegasusContext;
  FLOWSchemaFLOWInformationPluginContext *informationPluginContext;
  FLOWSchemaFLOWHomeCommunicationContext *homeCommunicationContext;
  unint64_t v15;
  FLOWSchemaFLOWNotificationContext *notificationContext;

  v4 = (FLOWSchemaFLOWNotificationContext *)a3;
  voiceShortcutContext = self->_voiceShortcutContext;
  self->_voiceShortcutContext = 0;

  homeAutomationContext = self->_homeAutomationContext;
  self->_homeAutomationContext = 0;

  phoneCallContext = self->_phoneCallContext;
  self->_phoneCallContext = 0;

  smsContext = self->_smsContext;
  self->_smsContext = 0;

  mediaPlayerContext = self->_mediaPlayerContext;
  self->_mediaPlayerContext = 0;

  identityContext = self->_identityContext;
  self->_identityContext = 0;

  briefingContext = self->_briefingContext;
  self->_briefingContext = 0;

  pegasusContext = self->_pegasusContext;
  self->_pegasusContext = 0;

  informationPluginContext = self->_informationPluginContext;
  self->_informationPluginContext = 0;

  homeCommunicationContext = self->_homeCommunicationContext;
  self->_homeCommunicationContext = 0;

  v15 = 11;
  if (!v4)
    v15 = 0;
  self->_whichDomaincontext = v15;
  notificationContext = self->_notificationContext;
  self->_notificationContext = v4;

}

- (FLOWSchemaFLOWNotificationContext)notificationContext
{
  if (self->_whichDomaincontext == 11)
    return self->_notificationContext;
  else
    return (FLOWSchemaFLOWNotificationContext *)0;
}

- (void)deleteNotificationContext
{
  FLOWSchemaFLOWNotificationContext *notificationContext;

  if (self->_whichDomaincontext == 11)
  {
    self->_whichDomaincontext = 0;
    notificationContext = self->_notificationContext;
    self->_notificationContext = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWDomainContextReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
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
  id v26;

  v26 = a3;
  -[FLOWSchemaFLOWDomainContext voiceShortcutContext](self, "voiceShortcutContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[FLOWSchemaFLOWDomainContext voiceShortcutContext](self, "voiceShortcutContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[FLOWSchemaFLOWDomainContext homeAutomationContext](self, "homeAutomationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[FLOWSchemaFLOWDomainContext homeAutomationContext](self, "homeAutomationContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[FLOWSchemaFLOWDomainContext phoneCallContext](self, "phoneCallContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[FLOWSchemaFLOWDomainContext phoneCallContext](self, "phoneCallContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[FLOWSchemaFLOWDomainContext smsContext](self, "smsContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[FLOWSchemaFLOWDomainContext smsContext](self, "smsContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[FLOWSchemaFLOWDomainContext mediaPlayerContext](self, "mediaPlayerContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[FLOWSchemaFLOWDomainContext mediaPlayerContext](self, "mediaPlayerContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[FLOWSchemaFLOWDomainContext identityContext](self, "identityContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[FLOWSchemaFLOWDomainContext identityContext](self, "identityContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[FLOWSchemaFLOWDomainContext briefingContext](self, "briefingContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[FLOWSchemaFLOWDomainContext briefingContext](self, "briefingContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[FLOWSchemaFLOWDomainContext pegasusContext](self, "pegasusContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[FLOWSchemaFLOWDomainContext pegasusContext](self, "pegasusContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[FLOWSchemaFLOWDomainContext informationPluginContext](self, "informationPluginContext");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[FLOWSchemaFLOWDomainContext informationPluginContext](self, "informationPluginContext");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[FLOWSchemaFLOWDomainContext homeCommunicationContext](self, "homeCommunicationContext");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[FLOWSchemaFLOWDomainContext homeCommunicationContext](self, "homeCommunicationContext");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[FLOWSchemaFLOWDomainContext notificationContext](self, "notificationContext");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[FLOWSchemaFLOWDomainContext notificationContext](self, "notificationContext");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t whichDomaincontext;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  int v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  int v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  char v62;
  BOOL v63;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_58;
  whichDomaincontext = self->_whichDomaincontext;
  if (whichDomaincontext != objc_msgSend(v4, "whichDomaincontext"))
    goto LABEL_58;
  -[FLOWSchemaFLOWDomainContext voiceShortcutContext](self, "voiceShortcutContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "voiceShortcutContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_57;
  -[FLOWSchemaFLOWDomainContext voiceShortcutContext](self, "voiceShortcutContext");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[FLOWSchemaFLOWDomainContext voiceShortcutContext](self, "voiceShortcutContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "voiceShortcutContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_58;
  }
  else
  {

  }
  -[FLOWSchemaFLOWDomainContext homeAutomationContext](self, "homeAutomationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "homeAutomationContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_57;
  -[FLOWSchemaFLOWDomainContext homeAutomationContext](self, "homeAutomationContext");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[FLOWSchemaFLOWDomainContext homeAutomationContext](self, "homeAutomationContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "homeAutomationContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_58;
  }
  else
  {

  }
  -[FLOWSchemaFLOWDomainContext phoneCallContext](self, "phoneCallContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "phoneCallContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_57;
  -[FLOWSchemaFLOWDomainContext phoneCallContext](self, "phoneCallContext");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[FLOWSchemaFLOWDomainContext phoneCallContext](self, "phoneCallContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "phoneCallContext");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_58;
  }
  else
  {

  }
  -[FLOWSchemaFLOWDomainContext smsContext](self, "smsContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "smsContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_57;
  -[FLOWSchemaFLOWDomainContext smsContext](self, "smsContext");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[FLOWSchemaFLOWDomainContext smsContext](self, "smsContext");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "smsContext");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_58;
  }
  else
  {

  }
  -[FLOWSchemaFLOWDomainContext mediaPlayerContext](self, "mediaPlayerContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaPlayerContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_57;
  -[FLOWSchemaFLOWDomainContext mediaPlayerContext](self, "mediaPlayerContext");
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)v28;
    -[FLOWSchemaFLOWDomainContext mediaPlayerContext](self, "mediaPlayerContext");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mediaPlayerContext");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if (!v32)
      goto LABEL_58;
  }
  else
  {

  }
  -[FLOWSchemaFLOWDomainContext identityContext](self, "identityContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identityContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_57;
  -[FLOWSchemaFLOWDomainContext identityContext](self, "identityContext");
  v33 = objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    v34 = (void *)v33;
    -[FLOWSchemaFLOWDomainContext identityContext](self, "identityContext");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identityContext");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "isEqual:", v36);

    if (!v37)
      goto LABEL_58;
  }
  else
  {

  }
  -[FLOWSchemaFLOWDomainContext briefingContext](self, "briefingContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "briefingContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_57;
  -[FLOWSchemaFLOWDomainContext briefingContext](self, "briefingContext");
  v38 = objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    v39 = (void *)v38;
    -[FLOWSchemaFLOWDomainContext briefingContext](self, "briefingContext");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "briefingContext");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v40, "isEqual:", v41);

    if (!v42)
      goto LABEL_58;
  }
  else
  {

  }
  -[FLOWSchemaFLOWDomainContext pegasusContext](self, "pegasusContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pegasusContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_57;
  -[FLOWSchemaFLOWDomainContext pegasusContext](self, "pegasusContext");
  v43 = objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    v44 = (void *)v43;
    -[FLOWSchemaFLOWDomainContext pegasusContext](self, "pegasusContext");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pegasusContext");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v45, "isEqual:", v46);

    if (!v47)
      goto LABEL_58;
  }
  else
  {

  }
  -[FLOWSchemaFLOWDomainContext informationPluginContext](self, "informationPluginContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "informationPluginContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_57;
  -[FLOWSchemaFLOWDomainContext informationPluginContext](self, "informationPluginContext");
  v48 = objc_claimAutoreleasedReturnValue();
  if (v48)
  {
    v49 = (void *)v48;
    -[FLOWSchemaFLOWDomainContext informationPluginContext](self, "informationPluginContext");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "informationPluginContext");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v50, "isEqual:", v51);

    if (!v52)
      goto LABEL_58;
  }
  else
  {

  }
  -[FLOWSchemaFLOWDomainContext homeCommunicationContext](self, "homeCommunicationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "homeCommunicationContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_57;
  -[FLOWSchemaFLOWDomainContext homeCommunicationContext](self, "homeCommunicationContext");
  v53 = objc_claimAutoreleasedReturnValue();
  if (v53)
  {
    v54 = (void *)v53;
    -[FLOWSchemaFLOWDomainContext homeCommunicationContext](self, "homeCommunicationContext");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "homeCommunicationContext");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v55, "isEqual:", v56);

    if (!v57)
      goto LABEL_58;
  }
  else
  {

  }
  -[FLOWSchemaFLOWDomainContext notificationContext](self, "notificationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notificationContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[FLOWSchemaFLOWDomainContext notificationContext](self, "notificationContext");
    v58 = objc_claimAutoreleasedReturnValue();
    if (!v58)
    {

LABEL_61:
      v63 = 1;
      goto LABEL_59;
    }
    v59 = (void *)v58;
    -[FLOWSchemaFLOWDomainContext notificationContext](self, "notificationContext");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "notificationContext");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v60, "isEqual:", v61);

    if ((v62 & 1) != 0)
      goto LABEL_61;
  }
  else
  {
LABEL_57:

  }
LABEL_58:
  v63 = 0;
LABEL_59:

  return v63;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;

  v3 = -[FLOWSchemaFLOWVoiceShortcutContext hash](self->_voiceShortcutContext, "hash");
  v4 = -[FLOWSchemaFLOWHomeAutomationContext hash](self->_homeAutomationContext, "hash") ^ v3;
  v5 = -[FLOWSchemaFLOWPhoneCallContext hash](self->_phoneCallContext, "hash");
  v6 = v4 ^ v5 ^ -[FLOWSchemaFLOWSmsContext hash](self->_smsContext, "hash");
  v7 = -[FLOWSchemaFLOWMediaPlayerContext hash](self->_mediaPlayerContext, "hash");
  v8 = v7 ^ -[FLOWSchemaFLOWIdentityContext hash](self->_identityContext, "hash");
  v9 = v6 ^ v8 ^ -[FLOWSchemaFLOWBriefingContext hash](self->_briefingContext, "hash");
  v10 = -[FLOWSchemaFLOWPegasusContext hash](self->_pegasusContext, "hash");
  v11 = v10 ^ -[FLOWSchemaFLOWInformationPluginContext hash](self->_informationPluginContext, "hash");
  v12 = v11 ^ -[FLOWSchemaFLOWHomeCommunicationContext hash](self->_homeCommunicationContext, "hash");
  return v9 ^ v12 ^ -[FLOWSchemaFLOWNotificationContext hash](self->_notificationContext, "hash");
}

- (id)dictionaryRepresentation
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_briefingContext)
  {
    -[FLOWSchemaFLOWDomainContext briefingContext](self, "briefingContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("briefingContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("briefingContext"));

    }
  }
  if (self->_homeAutomationContext)
  {
    -[FLOWSchemaFLOWDomainContext homeAutomationContext](self, "homeAutomationContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("homeAutomationContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("homeAutomationContext"));

    }
  }
  if (self->_homeCommunicationContext)
  {
    -[FLOWSchemaFLOWDomainContext homeCommunicationContext](self, "homeCommunicationContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("homeCommunicationContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("homeCommunicationContext"));

    }
  }
  if (self->_identityContext)
  {
    -[FLOWSchemaFLOWDomainContext identityContext](self, "identityContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("identityContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("identityContext"));

    }
  }
  if (self->_informationPluginContext)
  {
    -[FLOWSchemaFLOWDomainContext informationPluginContext](self, "informationPluginContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("informationPluginContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("informationPluginContext"));

    }
  }
  if (self->_mediaPlayerContext)
  {
    -[FLOWSchemaFLOWDomainContext mediaPlayerContext](self, "mediaPlayerContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("mediaPlayerContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("mediaPlayerContext"));

    }
  }
  if (self->_notificationContext)
  {
    -[FLOWSchemaFLOWDomainContext notificationContext](self, "notificationContext");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("notificationContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("notificationContext"));

    }
  }
  if (self->_pegasusContext)
  {
    -[FLOWSchemaFLOWDomainContext pegasusContext](self, "pegasusContext");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "dictionaryRepresentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("pegasusContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("pegasusContext"));

    }
  }
  if (self->_phoneCallContext)
  {
    -[FLOWSchemaFLOWDomainContext phoneCallContext](self, "phoneCallContext");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "dictionaryRepresentation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("phoneCallContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("phoneCallContext"));

    }
  }
  if (self->_smsContext)
  {
    -[FLOWSchemaFLOWDomainContext smsContext](self, "smsContext");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "dictionaryRepresentation");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("smsContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("smsContext"));

    }
  }
  if (self->_voiceShortcutContext)
  {
    -[FLOWSchemaFLOWDomainContext voiceShortcutContext](self, "voiceShortcutContext");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "dictionaryRepresentation");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("voiceShortcutContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("voiceShortcutContext"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[FLOWSchemaFLOWDomainContext dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (FLOWSchemaFLOWDomainContext)initWithJSON:(id)a3
{
  void *v4;
  FLOWSchemaFLOWDomainContext *v5;
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
    self = -[FLOWSchemaFLOWDomainContext initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (FLOWSchemaFLOWDomainContext)initWithDictionary:(id)a3
{
  id v4;
  FLOWSchemaFLOWDomainContext *v5;
  uint64_t v6;
  FLOWSchemaFLOWVoiceShortcutContext *v7;
  uint64_t v8;
  FLOWSchemaFLOWHomeAutomationContext *v9;
  uint64_t v10;
  FLOWSchemaFLOWPhoneCallContext *v11;
  uint64_t v12;
  FLOWSchemaFLOWSmsContext *v13;
  uint64_t v14;
  FLOWSchemaFLOWMediaPlayerContext *v15;
  void *v16;
  FLOWSchemaFLOWIdentityContext *v17;
  void *v18;
  FLOWSchemaFLOWBriefingContext *v19;
  void *v20;
  FLOWSchemaFLOWPegasusContext *v21;
  void *v22;
  void *v23;
  FLOWSchemaFLOWInformationPluginContext *v24;
  void *v25;
  FLOWSchemaFLOWHomeCommunicationContext *v26;
  void *v27;
  FLOWSchemaFLOWNotificationContext *v28;
  FLOWSchemaFLOWDomainContext *v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  objc_super v35;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)FLOWSchemaFLOWDomainContext;
  v5 = -[FLOWSchemaFLOWDomainContext init](&v35, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("voiceShortcutContext"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[FLOWSchemaFLOWVoiceShortcutContext initWithDictionary:]([FLOWSchemaFLOWVoiceShortcutContext alloc], "initWithDictionary:", v6);
      -[FLOWSchemaFLOWDomainContext setVoiceShortcutContext:](v5, "setVoiceShortcutContext:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("homeAutomationContext"));
    v8 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[FLOWSchemaFLOWHomeAutomationContext initWithDictionary:]([FLOWSchemaFLOWHomeAutomationContext alloc], "initWithDictionary:", v8);
      -[FLOWSchemaFLOWDomainContext setHomeAutomationContext:](v5, "setHomeAutomationContext:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("phoneCallContext"));
    v10 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[FLOWSchemaFLOWPhoneCallContext initWithDictionary:]([FLOWSchemaFLOWPhoneCallContext alloc], "initWithDictionary:", v10);
      -[FLOWSchemaFLOWDomainContext setPhoneCallContext:](v5, "setPhoneCallContext:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("smsContext"));
    v12 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[FLOWSchemaFLOWSmsContext initWithDictionary:]([FLOWSchemaFLOWSmsContext alloc], "initWithDictionary:", v12);
      -[FLOWSchemaFLOWDomainContext setSmsContext:](v5, "setSmsContext:", v13);

    }
    v32 = (void *)v12;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mediaPlayerContext"));
    v14 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[FLOWSchemaFLOWMediaPlayerContext initWithDictionary:]([FLOWSchemaFLOWMediaPlayerContext alloc], "initWithDictionary:", v14);
      -[FLOWSchemaFLOWDomainContext setMediaPlayerContext:](v5, "setMediaPlayerContext:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identityContext"), v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[FLOWSchemaFLOWIdentityContext initWithDictionary:]([FLOWSchemaFLOWIdentityContext alloc], "initWithDictionary:", v16);
      -[FLOWSchemaFLOWDomainContext setIdentityContext:](v5, "setIdentityContext:", v17);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("briefingContext"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = -[FLOWSchemaFLOWBriefingContext initWithDictionary:]([FLOWSchemaFLOWBriefingContext alloc], "initWithDictionary:", v18);
      -[FLOWSchemaFLOWDomainContext setBriefingContext:](v5, "setBriefingContext:", v19);

    }
    v33 = (void *)v10;
    v34 = (void *)v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pegasusContext"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = -[FLOWSchemaFLOWPegasusContext initWithDictionary:]([FLOWSchemaFLOWPegasusContext alloc], "initWithDictionary:", v20);
      -[FLOWSchemaFLOWDomainContext setPegasusContext:](v5, "setPegasusContext:", v21);

    }
    v22 = (void *)v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("informationPluginContext"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v24 = -[FLOWSchemaFLOWInformationPluginContext initWithDictionary:]([FLOWSchemaFLOWInformationPluginContext alloc], "initWithDictionary:", v23);
      -[FLOWSchemaFLOWDomainContext setInformationPluginContext:](v5, "setInformationPluginContext:", v24);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("homeCommunicationContext"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v26 = -[FLOWSchemaFLOWHomeCommunicationContext initWithDictionary:]([FLOWSchemaFLOWHomeCommunicationContext alloc], "initWithDictionary:", v25);
      -[FLOWSchemaFLOWDomainContext setHomeCommunicationContext:](v5, "setHomeCommunicationContext:", v26);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("notificationContext"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v28 = -[FLOWSchemaFLOWNotificationContext initWithDictionary:]([FLOWSchemaFLOWNotificationContext alloc], "initWithDictionary:", v27);
      -[FLOWSchemaFLOWDomainContext setNotificationContext:](v5, "setNotificationContext:", v28);

    }
    v29 = v5;

  }
  return v5;
}

- (unint64_t)whichDomaincontext
{
  return self->_whichDomaincontext;
}

- (BOOL)hasVoiceShortcutContext
{
  return self->_hasVoiceShortcutContext;
}

- (void)setHasVoiceShortcutContext:(BOOL)a3
{
  self->_hasVoiceShortcutContext = a3;
}

- (BOOL)hasHomeAutomationContext
{
  return self->_hasHomeAutomationContext;
}

- (void)setHasHomeAutomationContext:(BOOL)a3
{
  self->_hasHomeAutomationContext = a3;
}

- (BOOL)hasPhoneCallContext
{
  return self->_hasPhoneCallContext;
}

- (void)setHasPhoneCallContext:(BOOL)a3
{
  self->_hasPhoneCallContext = a3;
}

- (BOOL)hasSmsContext
{
  return self->_hasSmsContext;
}

- (void)setHasSmsContext:(BOOL)a3
{
  self->_hasSmsContext = a3;
}

- (BOOL)hasMediaPlayerContext
{
  return self->_hasMediaPlayerContext;
}

- (void)setHasMediaPlayerContext:(BOOL)a3
{
  self->_hasMediaPlayerContext = a3;
}

- (BOOL)hasIdentityContext
{
  return self->_hasIdentityContext;
}

- (void)setHasIdentityContext:(BOOL)a3
{
  self->_hasIdentityContext = a3;
}

- (BOOL)hasBriefingContext
{
  return self->_hasBriefingContext;
}

- (void)setHasBriefingContext:(BOOL)a3
{
  self->_hasBriefingContext = a3;
}

- (BOOL)hasPegasusContext
{
  return self->_hasPegasusContext;
}

- (void)setHasPegasusContext:(BOOL)a3
{
  self->_hasPegasusContext = a3;
}

- (BOOL)hasInformationPluginContext
{
  return self->_hasInformationPluginContext;
}

- (void)setHasInformationPluginContext:(BOOL)a3
{
  self->_hasInformationPluginContext = a3;
}

- (BOOL)hasHomeCommunicationContext
{
  return self->_hasHomeCommunicationContext;
}

- (void)setHasHomeCommunicationContext:(BOOL)a3
{
  self->_hasHomeCommunicationContext = a3;
}

- (BOOL)hasNotificationContext
{
  return self->_hasNotificationContext;
}

- (void)setHasNotificationContext:(BOOL)a3
{
  self->_hasNotificationContext = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationContext, 0);
  objc_storeStrong((id *)&self->_homeCommunicationContext, 0);
  objc_storeStrong((id *)&self->_informationPluginContext, 0);
  objc_storeStrong((id *)&self->_pegasusContext, 0);
  objc_storeStrong((id *)&self->_briefingContext, 0);
  objc_storeStrong((id *)&self->_identityContext, 0);
  objc_storeStrong((id *)&self->_mediaPlayerContext, 0);
  objc_storeStrong((id *)&self->_smsContext, 0);
  objc_storeStrong((id *)&self->_phoneCallContext, 0);
  objc_storeStrong((id *)&self->_homeAutomationContext, 0);
  objc_storeStrong((id *)&self->_voiceShortcutContext, 0);
}

@end
