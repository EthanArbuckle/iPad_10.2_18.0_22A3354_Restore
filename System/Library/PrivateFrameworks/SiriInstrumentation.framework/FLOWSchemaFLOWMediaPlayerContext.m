@implementation FLOWSchemaFLOWMediaPlayerContext

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
  v13.super_class = (Class)FLOWSchemaFLOWMediaPlayerContext;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FLOWSchemaFLOWMediaPlayerContext wholeHouseAudioDestinationContext](self, "wholeHouseAudioDestinationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[FLOWSchemaFLOWMediaPlayerContext deleteWholeHouseAudioDestinationContext](self, "deleteWholeHouseAudioDestinationContext");
  -[FLOWSchemaFLOWMediaPlayerContext mediaPlayerPlaybackContext](self, "mediaPlayerPlaybackContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[FLOWSchemaFLOWMediaPlayerContext deleteMediaPlayerPlaybackContext](self, "deleteMediaPlayerPlaybackContext");

  return v5;
}

- (void)setTaskType:(int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_taskType = a3;
}

- (BOOL)hasTaskType
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHasTaskType:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (void)deleteTaskType
{
  -[FLOWSchemaFLOWMediaPlayerContext setTaskType:](self, "setTaskType:", 0);
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setMediaType:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_mediaType = a3;
}

- (BOOL)hasMediaType
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHasMediaType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (void)deleteMediaType
{
  -[FLOWSchemaFLOWMediaPlayerContext setMediaType:](self, "setMediaType:", 0);
  *(_WORD *)&self->_has &= ~2u;
}

- (void)setIsWholeHouseAudio:(BOOL)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_isWholeHouseAudio = a3;
}

- (BOOL)hasIsWholeHouseAudio
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setHasIsWholeHouseAudio:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (void)deleteIsWholeHouseAudio
{
  -[FLOWSchemaFLOWMediaPlayerContext setIsWholeHouseAudio:](self, "setIsWholeHouseAudio:", 0);
  *(_WORD *)&self->_has &= ~4u;
}

- (BOOL)hasWholeHouseAudioDestinationContext
{
  return self->_wholeHouseAudioDestinationContext != 0;
}

- (void)deleteWholeHouseAudioDestinationContext
{
  -[FLOWSchemaFLOWMediaPlayerContext setWholeHouseAudioDestinationContext:](self, "setWholeHouseAudioDestinationContext:", 0);
}

- (void)setIsMusicSubscriber:(BOOL)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_isMusicSubscriber = a3;
}

- (BOOL)hasIsMusicSubscriber
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHasIsMusicSubscriber:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (void)deleteIsMusicSubscriber
{
  -[FLOWSchemaFLOWMediaPlayerContext setIsMusicSubscriber:](self, "setIsMusicSubscriber:", 0);
  *(_WORD *)&self->_has &= ~8u;
}

- (void)clearActiveSubscriptions
{
  -[NSArray removeAllObjects](self->_activeSubscriptions, "removeAllObjects");
}

- (void)addActiveSubscriptions:(int)a3
{
  uint64_t v3;
  NSArray *activeSubscriptions;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v3 = *(_QWORD *)&a3;
  activeSubscriptions = self->_activeSubscriptions;
  if (!activeSubscriptions)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_activeSubscriptions;
    self->_activeSubscriptions = v6;

    activeSubscriptions = self->_activeSubscriptions;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](activeSubscriptions, "addObject:", v8);

}

- (unint64_t)activeSubscriptionsCount
{
  return -[NSArray count](self->_activeSubscriptions, "count");
}

- (int)activeSubscriptionsAtIndex:(unint64_t)a3
{
  void *v3;
  int v4;

  -[NSArray objectAtIndexedSubscript:](self->_activeSubscriptions, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (void)setAppleMusicVoiceUserSubscriptionState:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_appleMusicVoiceUserSubscriptionState = a3;
}

- (BOOL)hasAppleMusicVoiceUserSubscriptionState
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHasAppleMusicVoiceUserSubscriptionState:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (void)deleteAppleMusicVoiceUserSubscriptionState
{
  -[FLOWSchemaFLOWMediaPlayerContext setAppleMusicVoiceUserSubscriptionState:](self, "setAppleMusicVoiceUserSubscriptionState:", 0);
  *(_WORD *)&self->_has &= ~0x10u;
}

- (void)setAppleMusicVoicePreviewOfferNotShown:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_appleMusicVoicePreviewOfferNotShown = a3;
}

- (BOOL)hasAppleMusicVoicePreviewOfferNotShown
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHasAppleMusicVoicePreviewOfferNotShown:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (void)deleteAppleMusicVoicePreviewOfferNotShown
{
  -[FLOWSchemaFLOWMediaPlayerContext setAppleMusicVoicePreviewOfferNotShown:](self, "setAppleMusicVoicePreviewOfferNotShown:", 0);
  *(_WORD *)&self->_has &= ~0x20u;
}

- (void)setIsAppleMusicVoiceEligible:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_isAppleMusicVoiceEligible = a3;
}

- (BOOL)hasIsAppleMusicVoiceEligible
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHasIsAppleMusicVoiceEligible:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (void)deleteIsAppleMusicVoiceEligible
{
  -[FLOWSchemaFLOWMediaPlayerContext setIsAppleMusicVoiceEligible:](self, "setIsAppleMusicVoiceEligible:", 0);
  *(_WORD *)&self->_has &= ~0x40u;
}

- (void)setMediaPlayerPlaybackContext:(id)a3
{
  uint64_t v3;

  v3 = 11;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_hasWholeHouseAudioDestinationContext = v3;
  objc_storeStrong((id *)&self->_mediaPlayerPlaybackContext, a3);
}

- (FLOWSchemaFLOWMediaPlayerPlaybackContext)mediaPlayerPlaybackContext
{
  if (*(_QWORD *)&self->_hasWholeHouseAudioDestinationContext == 11)
    return self->_mediaPlayerPlaybackContext;
  else
    return (FLOWSchemaFLOWMediaPlayerPlaybackContext *)0;
}

- (void)deleteMediaPlayerPlaybackContext
{
  FLOWSchemaFLOWMediaPlayerPlaybackContext *mediaPlayerPlaybackContext;

  if (*(_QWORD *)&self->_hasWholeHouseAudioDestinationContext == 11)
  {
    *(_QWORD *)&self->_hasWholeHouseAudioDestinationContext = 0;
    mediaPlayerPlaybackContext = self->_mediaPlayerPlaybackContext;
    self->_mediaPlayerPlaybackContext = 0;

  }
}

- (void)setIsSiriForAirPlayRequest:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_isSiriForAirPlayRequest = a3;
}

- (BOOL)hasIsSiriForAirPlayRequest
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHasIsSiriForAirPlayRequest:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (void)deleteIsSiriForAirPlayRequest
{
  -[FLOWSchemaFLOWMediaPlayerContext setIsSiriForAirPlayRequest:](self, "setIsSiriForAirPlayRequest:", 0);
  *(_WORD *)&self->_has &= ~0x80u;
}

- (void)setAirPlayTargetedDevicesCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_airPlayTargetedDevicesCount = a3;
}

- (BOOL)hasAirPlayTargetedDevicesCount
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHasAirPlayTargetedDevicesCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (void)deleteAirPlayTargetedDevicesCount
{
  -[FLOWSchemaFLOWMediaPlayerContext setAirPlayTargetedDevicesCount:](self, "setAirPlayTargetedDevicesCount:", 0);
  *(_WORD *)&self->_has &= ~0x100u;
}

- (void)setAirPlaySuccessfullyPlayingDevicesCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_airPlaySuccessfullyPlayingDevicesCount = a3;
}

- (BOOL)hasAirPlaySuccessfullyPlayingDevicesCount
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setHasAirPlaySuccessfullyPlayingDevicesCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (void)deleteAirPlaySuccessfullyPlayingDevicesCount
{
  -[FLOWSchemaFLOWMediaPlayerContext setAirPlaySuccessfullyPlayingDevicesCount:](self, "setAirPlaySuccessfullyPlayingDevicesCount:", 0);
  *(_WORD *)&self->_has &= ~0x200u;
}

- (void)setAirPlayRouteSettingStatus:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_airPlayRouteSettingStatus = a3;
}

- (BOOL)hasAirPlayRouteSettingStatus
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setHasAirPlayRouteSettingStatus:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (void)deleteAirPlayRouteSettingStatus
{
  -[FLOWSchemaFLOWMediaPlayerContext setAirPlayRouteSettingStatus:](self, "setAirPlayRouteSettingStatus:", 0);
  *(_WORD *)&self->_has &= ~0x400u;
}

- (void)setUserPersona:(int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_userPersona = a3;
}

- (BOOL)hasUserPersona
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setHasUserPersona:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (void)deleteUserPersona
{
  -[FLOWSchemaFLOWMediaPlayerContext setUserPersona:](self, "setUserPersona:", 0);
  *(_WORD *)&self->_has &= ~0x800u;
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWMediaPlayerContextReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  __int16 has;
  void *v6;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int16 v13;
  void *v14;
  void *v15;
  __int16 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 4) != 0)
LABEL_4:
    PBDataWriterWriteBOOLField();
LABEL_5:
  -[FLOWSchemaFLOWMediaPlayerContext wholeHouseAudioDestinationContext](self, "wholeHouseAudioDestinationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[FLOWSchemaFLOWMediaPlayerContext wholeHouseAudioDestinationContext](self, "wholeHouseAudioDestinationContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(_WORD *)&self->_has & 8) != 0)
    PBDataWriterWriteBOOLField();
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = self->_activeSubscriptions;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "intValue", (_QWORD)v17);
        PBDataWriterWriteInt32Field();
      }
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  v13 = (__int16)self->_has;
  if ((v13 & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    v13 = (__int16)self->_has;
    if ((v13 & 0x20) == 0)
    {
LABEL_18:
      if ((v13 & 0x40) == 0)
        goto LABEL_20;
      goto LABEL_19;
    }
  }
  else if ((v13 & 0x20) == 0)
  {
    goto LABEL_18;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 0x40) != 0)
LABEL_19:
    PBDataWriterWriteBOOLField();
LABEL_20:
  -[FLOWSchemaFLOWMediaPlayerContext mediaPlayerPlaybackContext](self, "mediaPlayerPlaybackContext", (_QWORD)v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[FLOWSchemaFLOWMediaPlayerContext mediaPlayerPlaybackContext](self, "mediaPlayerPlaybackContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v16 = (__int16)self->_has;
  if ((v16 & 0x80) != 0)
  {
    PBDataWriterWriteBOOLField();
    v16 = (__int16)self->_has;
    if ((v16 & 0x100) == 0)
    {
LABEL_24:
      if ((v16 & 0x200) == 0)
        goto LABEL_25;
      goto LABEL_37;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_24;
  }
  PBDataWriterWriteUint32Field();
  v16 = (__int16)self->_has;
  if ((v16 & 0x200) == 0)
  {
LABEL_25:
    if ((v16 & 0x400) == 0)
      goto LABEL_26;
LABEL_38:
    PBDataWriterWriteInt32Field();
    if ((*(_WORD *)&self->_has & 0x800) == 0)
      goto LABEL_28;
    goto LABEL_27;
  }
LABEL_37:
  PBDataWriterWriteUint32Field();
  v16 = (__int16)self->_has;
  if ((v16 & 0x400) != 0)
    goto LABEL_38;
LABEL_26:
  if ((v16 & 0x800) != 0)
LABEL_27:
    PBDataWriterWriteInt32Field();
LABEL_28:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int16 *v4;
  uint64_t v5;
  $9FB5FD0850FC83E4B9739053CE807413 has;
  unsigned int v7;
  int taskType;
  int v9;
  int mediaType;
  int v11;
  int isWholeHouseAudio;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  int v20;
  int isMusicSubscriber;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  $9FB5FD0850FC83E4B9739053CE807413 v27;
  int v28;
  unsigned int v29;
  int appleMusicVoiceUserSubscriptionState;
  int v31;
  int appleMusicVoicePreviewOfferNotShown;
  int v33;
  int isAppleMusicVoiceEligible;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  BOOL v40;
  $9FB5FD0850FC83E4B9739053CE807413 v42;
  int v43;
  unsigned int v44;
  int isSiriForAirPlayRequest;
  int v46;
  unsigned int airPlayTargetedDevicesCount;
  int v48;
  unsigned int airPlaySuccessfullyPlayingDevicesCount;
  int v50;
  int airPlayRouteSettingStatus;
  int v52;
  int userPersona;

  v4 = (unsigned __int16 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_43;
  v5 = *(_QWORD *)&self->_hasWholeHouseAudioDestinationContext;
  if (v5 != objc_msgSend(v4, "whichMediaplayertaskcontext"))
    goto LABEL_43;
  has = self->_has;
  v7 = v4[46];
  if ((*(_BYTE *)&has & 1) != (v7 & 1))
    goto LABEL_43;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    taskType = self->_taskType;
    if (taskType != objc_msgSend(v4, "taskType"))
      goto LABEL_43;
    has = self->_has;
    v7 = v4[46];
  }
  v9 = (*(unsigned int *)&has >> 1) & 1;
  if (v9 != ((v7 >> 1) & 1))
    goto LABEL_43;
  if (v9)
  {
    mediaType = self->_mediaType;
    if (mediaType != objc_msgSend(v4, "mediaType"))
      goto LABEL_43;
    has = self->_has;
    v7 = v4[46];
  }
  v11 = (*(unsigned int *)&has >> 2) & 1;
  if (v11 != ((v7 >> 2) & 1))
    goto LABEL_43;
  if (v11)
  {
    isWholeHouseAudio = self->_isWholeHouseAudio;
    if (isWholeHouseAudio != objc_msgSend(v4, "isWholeHouseAudio"))
      goto LABEL_43;
  }
  -[FLOWSchemaFLOWMediaPlayerContext wholeHouseAudioDestinationContext](self, "wholeHouseAudioDestinationContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wholeHouseAudioDestinationContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v13 == 0) == (v14 != 0))
    goto LABEL_42;
  -[FLOWSchemaFLOWMediaPlayerContext wholeHouseAudioDestinationContext](self, "wholeHouseAudioDestinationContext");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    -[FLOWSchemaFLOWMediaPlayerContext wholeHouseAudioDestinationContext](self, "wholeHouseAudioDestinationContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "wholeHouseAudioDestinationContext");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "isEqual:", v18);

    if (!v19)
      goto LABEL_43;
  }
  else
  {

  }
  v20 = (*(_WORD *)&self->_has >> 3) & 1;
  if (v20 != ((v4[46] >> 3) & 1))
    goto LABEL_43;
  if (v20)
  {
    isMusicSubscriber = self->_isMusicSubscriber;
    if (isMusicSubscriber != objc_msgSend(v4, "isMusicSubscriber"))
      goto LABEL_43;
  }
  -[FLOWSchemaFLOWMediaPlayerContext activeSubscriptions](self, "activeSubscriptions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeSubscriptions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v13 == 0) == (v14 != 0))
    goto LABEL_42;
  -[FLOWSchemaFLOWMediaPlayerContext activeSubscriptions](self, "activeSubscriptions");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[FLOWSchemaFLOWMediaPlayerContext activeSubscriptions](self, "activeSubscriptions");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activeSubscriptions");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_43;
  }
  else
  {

  }
  v27 = self->_has;
  v28 = (*(unsigned int *)&v27 >> 4) & 1;
  v29 = v4[46];
  if (v28 != ((v29 >> 4) & 1))
    goto LABEL_43;
  if (v28)
  {
    appleMusicVoiceUserSubscriptionState = self->_appleMusicVoiceUserSubscriptionState;
    if (appleMusicVoiceUserSubscriptionState != objc_msgSend(v4, "appleMusicVoiceUserSubscriptionState"))
      goto LABEL_43;
    v27 = self->_has;
    v29 = v4[46];
  }
  v31 = (*(unsigned int *)&v27 >> 5) & 1;
  if (v31 != ((v29 >> 5) & 1))
    goto LABEL_43;
  if (v31)
  {
    appleMusicVoicePreviewOfferNotShown = self->_appleMusicVoicePreviewOfferNotShown;
    if (appleMusicVoicePreviewOfferNotShown != objc_msgSend(v4, "appleMusicVoicePreviewOfferNotShown"))
      goto LABEL_43;
    v27 = self->_has;
    v29 = v4[46];
  }
  v33 = (*(unsigned int *)&v27 >> 6) & 1;
  if (v33 != ((v29 >> 6) & 1))
    goto LABEL_43;
  if (v33)
  {
    isAppleMusicVoiceEligible = self->_isAppleMusicVoiceEligible;
    if (isAppleMusicVoiceEligible != objc_msgSend(v4, "isAppleMusicVoiceEligible"))
      goto LABEL_43;
  }
  -[FLOWSchemaFLOWMediaPlayerContext mediaPlayerPlaybackContext](self, "mediaPlayerPlaybackContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaPlayerPlaybackContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v13 == 0) == (v14 != 0))
  {
LABEL_42:

    goto LABEL_43;
  }
  -[FLOWSchemaFLOWMediaPlayerContext mediaPlayerPlaybackContext](self, "mediaPlayerPlaybackContext");
  v35 = objc_claimAutoreleasedReturnValue();
  if (v35)
  {
    v36 = (void *)v35;
    -[FLOWSchemaFLOWMediaPlayerContext mediaPlayerPlaybackContext](self, "mediaPlayerPlaybackContext");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mediaPlayerPlaybackContext");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v37, "isEqual:", v38);

    if (!v39)
      goto LABEL_43;
  }
  else
  {

  }
  v42 = self->_has;
  v43 = (*(unsigned int *)&v42 >> 7) & 1;
  v44 = v4[46];
  if (v43 == ((v44 >> 7) & 1))
  {
    if (v43)
    {
      isSiriForAirPlayRequest = self->_isSiriForAirPlayRequest;
      if (isSiriForAirPlayRequest != objc_msgSend(v4, "isSiriForAirPlayRequest"))
        goto LABEL_43;
      v42 = self->_has;
      v44 = v4[46];
    }
    v46 = (*(unsigned int *)&v42 >> 8) & 1;
    if (v46 == ((v44 >> 8) & 1))
    {
      if (v46)
      {
        airPlayTargetedDevicesCount = self->_airPlayTargetedDevicesCount;
        if (airPlayTargetedDevicesCount != objc_msgSend(v4, "airPlayTargetedDevicesCount"))
          goto LABEL_43;
        v42 = self->_has;
        v44 = v4[46];
      }
      v48 = (*(unsigned int *)&v42 >> 9) & 1;
      if (v48 == ((v44 >> 9) & 1))
      {
        if (v48)
        {
          airPlaySuccessfullyPlayingDevicesCount = self->_airPlaySuccessfullyPlayingDevicesCount;
          if (airPlaySuccessfullyPlayingDevicesCount != objc_msgSend(v4, "airPlaySuccessfullyPlayingDevicesCount"))goto LABEL_43;
          v42 = self->_has;
          v44 = v4[46];
        }
        v50 = (*(unsigned int *)&v42 >> 10) & 1;
        if (v50 == ((v44 >> 10) & 1))
        {
          if (v50)
          {
            airPlayRouteSettingStatus = self->_airPlayRouteSettingStatus;
            if (airPlayRouteSettingStatus != objc_msgSend(v4, "airPlayRouteSettingStatus"))
              goto LABEL_43;
            v42 = self->_has;
            v44 = v4[46];
          }
          v52 = (*(unsigned int *)&v42 >> 11) & 1;
          if (v52 == ((v44 >> 11) & 1))
          {
            if (!v52
              || (userPersona = self->_userPersona, userPersona == objc_msgSend(v4, "userPersona")))
            {
              v40 = 1;
              goto LABEL_44;
            }
          }
        }
      }
    }
  }
LABEL_43:
  v40 = 0;
LABEL_44:

  return v40;
}

- (unint64_t)hash
{
  __int16 has;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
    v21 = 0;
    if ((has & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v19 = 0;
    if ((has & 4) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v21 = 2654435761 * self->_taskType;
  if ((has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v19 = 2654435761 * self->_mediaType;
  if ((has & 4) != 0)
  {
LABEL_4:
    v4 = 2654435761 * self->_isWholeHouseAudio;
    goto LABEL_8;
  }
LABEL_7:
  v4 = 0;
LABEL_8:
  v5 = -[FLOWSchemaFLOWholeHouseAudioDestinationContext hash](self->_wholeHouseAudioDestinationContext, "hash", v19);
  if ((*(_WORD *)&self->_has & 8) != 0)
    v6 = 2654435761 * self->_isMusicSubscriber;
  else
    v6 = 0;
  v7 = -[NSArray hash](self->_activeSubscriptions, "hash");
  v8 = (__int16)self->_has;
  if ((v8 & 0x10) == 0)
  {
    v9 = 0;
    if ((v8 & 0x20) != 0)
      goto LABEL_13;
LABEL_16:
    v10 = 0;
    if ((v8 & 0x40) != 0)
      goto LABEL_14;
    goto LABEL_17;
  }
  v9 = 2654435761 * self->_appleMusicVoiceUserSubscriptionState;
  if ((v8 & 0x20) == 0)
    goto LABEL_16;
LABEL_13:
  v10 = 2654435761 * self->_appleMusicVoicePreviewOfferNotShown;
  if ((v8 & 0x40) != 0)
  {
LABEL_14:
    v11 = 2654435761 * self->_isAppleMusicVoiceEligible;
    goto LABEL_18;
  }
LABEL_17:
  v11 = 0;
LABEL_18:
  v12 = -[FLOWSchemaFLOWMediaPlayerPlaybackContext hash](self->_mediaPlayerPlaybackContext, "hash");
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    v13 = 2654435761 * self->_isSiriForAirPlayRequest;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
LABEL_20:
      v14 = 2654435761 * self->_airPlayTargetedDevicesCount;
      if ((*(_WORD *)&self->_has & 0x200) != 0)
        goto LABEL_21;
      goto LABEL_26;
    }
  }
  else
  {
    v13 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_20;
  }
  v14 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_21:
    v15 = 2654435761 * self->_airPlaySuccessfullyPlayingDevicesCount;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_22;
LABEL_27:
    v16 = 0;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
      goto LABEL_23;
LABEL_28:
    v17 = 0;
    return v20 ^ v21 ^ v4 ^ v6 ^ v5 ^ v7 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17;
  }
LABEL_26:
  v15 = 0;
  if ((*(_WORD *)&self->_has & 0x400) == 0)
    goto LABEL_27;
LABEL_22:
  v16 = 2654435761 * self->_airPlayRouteSettingStatus;
  if ((*(_WORD *)&self->_has & 0x800) == 0)
    goto LABEL_28;
LABEL_23:
  v17 = 2654435761 * self->_userPersona;
  return v20 ^ v21 ^ v4 ^ v6 ^ v5 ^ v7 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  __int16 has;
  unsigned int v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  const __CFString *v15;
  void *v16;
  __int16 v17;
  unsigned int v18;
  const __CFString *v19;
  unsigned int v20;
  const __CFString *v21;
  unsigned int v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned int v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_activeSubscriptions, "count"))
  {
    -[FLOWSchemaFLOWMediaPlayerContext activeSubscriptions](self, "activeSubscriptions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("activeSubscriptions"));

  }
  has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    v7 = -[FLOWSchemaFLOWMediaPlayerContext airPlayRouteSettingStatus](self, "airPlayRouteSettingStatus") - 1;
    if (v7 > 5)
      v8 = CFSTR("FLOWMEDIAPLAYERSETAIRPLAYROUTESSTATUS_UNKNOWN");
    else
      v8 = off_1E562E2A0[v7];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("airPlayRouteSettingStatus"));
    has = (__int16)self->_has;
  }
  if ((has & 0x200) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[FLOWSchemaFLOWMediaPlayerContext airPlaySuccessfullyPlayingDevicesCount](self, "airPlaySuccessfullyPlayingDevicesCount"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("airPlaySuccessfullyPlayingDevicesCount"));

    has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_10:
      if ((has & 0x20) == 0)
        goto LABEL_11;
      goto LABEL_22;
    }
  }
  else if ((has & 0x100) == 0)
  {
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[FLOWSchemaFLOWMediaPlayerContext airPlayTargetedDevicesCount](self, "airPlayTargetedDevicesCount"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("airPlayTargetedDevicesCount"));

  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_11:
    if ((has & 0x10) == 0)
      goto LABEL_12;
    goto LABEL_34;
  }
LABEL_22:
  v14 = -[FLOWSchemaFLOWMediaPlayerContext appleMusicVoicePreviewOfferNotShown](self, "appleMusicVoicePreviewOfferNotShown")- 1;
  if (v14 > 0x15)
    v15 = CFSTR("FLOWAPPLEMUSICVOICEPREVIEWOFFERNOTSHOWNREASON_UNKNOWN");
  else
    v15 = off_1E562E2D0[v14];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("appleMusicVoicePreviewOfferNotShown"));
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_12:
    if ((has & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_42;
  }
LABEL_34:
  v20 = -[FLOWSchemaFLOWMediaPlayerContext appleMusicVoiceUserSubscriptionState](self, "appleMusicVoiceUserSubscriptionState")- 1;
  if (v20 > 3)
    v21 = CFSTR("FLOWAPPLEMUSICVOICEUSERSUBSCRIPTIONSTATE_UNKNOWN");
  else
    v21 = off_1E562E380[v20];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("appleMusicVoiceUserSubscriptionState"));
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_13:
    if ((has & 8) == 0)
      goto LABEL_14;
    goto LABEL_43;
  }
LABEL_42:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FLOWSchemaFLOWMediaPlayerContext isAppleMusicVoiceEligible](self, "isAppleMusicVoiceEligible"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("isAppleMusicVoiceEligible"));

  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_14:
    if ((has & 0x80) == 0)
      goto LABEL_15;
    goto LABEL_44;
  }
LABEL_43:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FLOWSchemaFLOWMediaPlayerContext isMusicSubscriber](self, "isMusicSubscriber"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("isMusicSubscriber"));

  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_15:
    if ((has & 4) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_44:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FLOWSchemaFLOWMediaPlayerContext isSiriForAirPlayRequest](self, "isSiriForAirPlayRequest"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("isSiriForAirPlayRequest"));

  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_16:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FLOWSchemaFLOWMediaPlayerContext isWholeHouseAudio](self, "isWholeHouseAudio"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("isWholeHouseAudio"));

  }
LABEL_17:
  if (self->_mediaPlayerPlaybackContext)
  {
    -[FLOWSchemaFLOWMediaPlayerContext mediaPlayerPlaybackContext](self, "mediaPlayerPlaybackContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("mediaPlayerPlaybackContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("mediaPlayerPlaybackContext"));

    }
  }
  v17 = (__int16)self->_has;
  if ((v17 & 2) != 0)
  {
    v18 = -[FLOWSchemaFLOWMediaPlayerContext mediaType](self, "mediaType") - 1;
    if (v18 > 0x1B)
      v19 = CFSTR("FLOWMEDIATYPE_UNKNOWN");
    else
      v19 = off_1E562E3A0[v18];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("mediaType"));
    v17 = (__int16)self->_has;
    if ((v17 & 1) == 0)
    {
LABEL_28:
      if ((v17 & 0x800) == 0)
        goto LABEL_52;
      goto LABEL_48;
    }
  }
  else if ((v17 & 1) == 0)
  {
    goto LABEL_28;
  }
  v22 = -[FLOWSchemaFLOWMediaPlayerContext taskType](self, "taskType") - 1;
  if (v22 > 0x22)
    v23 = CFSTR("FLOWMEDIAPLAYERTASKTYPE_UNKNOWN");
  else
    v23 = off_1E562E480[v22];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("taskType"));
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_48:
    v27 = -[FLOWSchemaFLOWMediaPlayerContext userPersona](self, "userPersona") - 1;
    if (v27 > 5)
      v28 = CFSTR("INFERENCEAPPSELECTIONUSERPERSONA_UNKNOWN");
    else
      v28 = off_1E562E598[v27];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("userPersona"));
  }
LABEL_52:
  if (self->_wholeHouseAudioDestinationContext)
  {
    -[FLOWSchemaFLOWMediaPlayerContext wholeHouseAudioDestinationContext](self, "wholeHouseAudioDestinationContext");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "dictionaryRepresentation");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("wholeHouseAudioDestinationContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("wholeHouseAudioDestinationContext"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  v32 = v3;

  return v32;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[FLOWSchemaFLOWMediaPlayerContext dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (FLOWSchemaFLOWMediaPlayerContext)initWithJSON:(id)a3
{
  void *v4;
  FLOWSchemaFLOWMediaPlayerContext *v5;
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
    self = -[FLOWSchemaFLOWMediaPlayerContext initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (FLOWSchemaFLOWMediaPlayerContext)initWithDictionary:(id)a3
{
  id v4;
  FLOWSchemaFLOWMediaPlayerContext *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  FLOWSchemaFLOWholeHouseAudioDestinationContext *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  FLOWSchemaFLOWMediaPlayerPlaybackContext *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  FLOWSchemaFLOWMediaPlayerContext *v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  objc_super v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)FLOWSchemaFLOWMediaPlayerContext;
  v5 = -[FLOWSchemaFLOWMediaPlayerContext init](&v44, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("taskType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWMediaPlayerContext setTaskType:](v5, "setTaskType:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mediaType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWMediaPlayerContext setMediaType:](v5, "setMediaType:", objc_msgSend(v7, "intValue"));
    v36 = v7;
    v37 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isWholeHouseAudio"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWMediaPlayerContext setIsWholeHouseAudio:](v5, "setIsWholeHouseAudio:", objc_msgSend(v8, "BOOLValue"));
    v35 = v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("wholeHouseAudioDestinationContext"));
    v9 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = -[FLOWSchemaFLOWholeHouseAudioDestinationContext initWithDictionary:]([FLOWSchemaFLOWholeHouseAudioDestinationContext alloc], "initWithDictionary:", v9);
      -[FLOWSchemaFLOWMediaPlayerContext setWholeHouseAudioDestinationContext:](v5, "setWholeHouseAudioDestinationContext:", v10);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isMusicSubscriber"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v39 = v11;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWMediaPlayerContext setIsMusicSubscriber:](v5, "setIsMusicSubscriber:", objc_msgSend(v11, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("activeSubscriptions"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v38 = v12;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v13 = v12;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v41;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v41 != v16)
              objc_enumerationMutation(v13);
            v18 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              -[FLOWSchemaFLOWMediaPlayerContext addActiveSubscriptions:](v5, "addActiveSubscriptions:", objc_msgSend(v18, "intValue"));
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
        }
        while (v15);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appleMusicVoiceUserSubscriptionState"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWMediaPlayerContext setAppleMusicVoiceUserSubscriptionState:](v5, "setAppleMusicVoiceUserSubscriptionState:", objc_msgSend(v19, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appleMusicVoicePreviewOfferNotShown"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWMediaPlayerContext setAppleMusicVoicePreviewOfferNotShown:](v5, "setAppleMusicVoicePreviewOfferNotShown:", objc_msgSend(v20, "intValue"));
    v33 = v20;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isAppleMusicVoiceEligible"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWMediaPlayerContext setIsAppleMusicVoiceEligible:](v5, "setIsAppleMusicVoiceEligible:", objc_msgSend(v21, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mediaPlayerPlaybackContext"), v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = -[FLOWSchemaFLOWMediaPlayerPlaybackContext initWithDictionary:]([FLOWSchemaFLOWMediaPlayerPlaybackContext alloc], "initWithDictionary:", v22);
      -[FLOWSchemaFLOWMediaPlayerContext setMediaPlayerPlaybackContext:](v5, "setMediaPlayerPlaybackContext:", v23);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isSiriForAirPlayRequest"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWMediaPlayerContext setIsSiriForAirPlayRequest:](v5, "setIsSiriForAirPlayRequest:", objc_msgSend(v24, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("airPlayTargetedDevicesCount"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWMediaPlayerContext setAirPlayTargetedDevicesCount:](v5, "setAirPlayTargetedDevicesCount:", objc_msgSend(v25, "unsignedIntValue"));
    v34 = v19;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("airPlaySuccessfullyPlayingDevicesCount"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWMediaPlayerContext setAirPlaySuccessfullyPlayingDevicesCount:](v5, "setAirPlaySuccessfullyPlayingDevicesCount:", objc_msgSend(v26, "unsignedIntValue"));
    v27 = (void *)v9;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("airPlayRouteSettingStatus"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWMediaPlayerContext setAirPlayRouteSettingStatus:](v5, "setAirPlayRouteSettingStatus:", objc_msgSend(v28, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userPersona"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWMediaPlayerContext setUserPersona:](v5, "setUserPersona:", objc_msgSend(v29, "intValue"));
    v30 = v5;

  }
  return v5;
}

- (unint64_t)whichMediaplayertaskcontext
{
  return *(_QWORD *)&self->_hasWholeHouseAudioDestinationContext;
}

- (int)taskType
{
  return self->_taskType;
}

- (int)mediaType
{
  return self->_mediaType;
}

- (BOOL)isWholeHouseAudio
{
  return self->_isWholeHouseAudio;
}

- (FLOWSchemaFLOWholeHouseAudioDestinationContext)wholeHouseAudioDestinationContext
{
  return self->_wholeHouseAudioDestinationContext;
}

- (void)setWholeHouseAudioDestinationContext:(id)a3
{
  objc_storeStrong((id *)&self->_wholeHouseAudioDestinationContext, a3);
}

- (BOOL)isMusicSubscriber
{
  return self->_isMusicSubscriber;
}

- (NSArray)activeSubscriptions
{
  return self->_activeSubscriptions;
}

- (void)setActiveSubscriptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (int)appleMusicVoiceUserSubscriptionState
{
  return self->_appleMusicVoiceUserSubscriptionState;
}

- (int)appleMusicVoicePreviewOfferNotShown
{
  return self->_appleMusicVoicePreviewOfferNotShown;
}

- (BOOL)isAppleMusicVoiceEligible
{
  return self->_isAppleMusicVoiceEligible;
}

- (BOOL)isSiriForAirPlayRequest
{
  return self->_isSiriForAirPlayRequest;
}

- (unsigned)airPlayTargetedDevicesCount
{
  return self->_airPlayTargetedDevicesCount;
}

- (unsigned)airPlaySuccessfullyPlayingDevicesCount
{
  return self->_airPlaySuccessfullyPlayingDevicesCount;
}

- (int)airPlayRouteSettingStatus
{
  return self->_airPlayRouteSettingStatus;
}

- (int)userPersona
{
  return self->_userPersona;
}

- (void)setHasWholeHouseAudioDestinationContext:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (BOOL)hasMediaPlayerPlaybackContext
{
  return *((_BYTE *)&self->_has + 3);
}

- (void)setHasMediaPlayerPlaybackContext:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaPlayerPlaybackContext, 0);
  objc_storeStrong((id *)&self->_activeSubscriptions, 0);
  objc_storeStrong((id *)&self->_wholeHouseAudioDestinationContext, 0);
}

@end
