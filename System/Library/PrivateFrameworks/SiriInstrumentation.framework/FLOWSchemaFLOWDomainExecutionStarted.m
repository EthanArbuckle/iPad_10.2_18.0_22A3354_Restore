@implementation FLOWSchemaFLOWDomainExecutionStarted

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setDomainExecutionType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_domainExecutionType = a3;
}

- (BOOL)hasDomainExecutionType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasDomainExecutionType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteDomainExecutionType
{
  -[FLOWSchemaFLOWDomainExecutionStarted setDomainExecutionType:](self, "setDomainExecutionType:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWDomainExecutionStartedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  int domainExecutionType;
  BOOL v6;

  v4 = a3;
  v6 = 0;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    if ((*(_BYTE *)&self->_has & 1) == (v4[12] & 1))
    {
      if ((*(_BYTE *)&self->_has & 1) == 0
        || (domainExecutionType = self->_domainExecutionType,
            domainExecutionType == objc_msgSend(v4, "domainExecutionType")))
      {
        v6 = 1;
      }
    }
  }

  return v6;
}

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return 2654435761 * self->_domainExecutionType;
  else
    return 0;
}

- (id)dictionaryRepresentation
{
  void *v3;
  int v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  BOOL v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = -[FLOWSchemaFLOWDomainExecutionStarted domainExecutionType](self, "domainExecutionType");
    v5 = CFSTR("FLOWDOMAINEXECUTIONTYPE_UNKNOWN");
    if (v4 <= 399)
    {
      if (v4 <= 299)
      {
        switch(v4)
        {
          case 200:
            v5 = CFSTR("FLOWDOMAINEXECUTIONTYPE_HOME_AUTOMATION_INTENT_SELECTION");
            break;
          case 201:
            v5 = CFSTR("FLOWDOMAINEXECUTIONTYPE_HOME_AUTOMATION_NL_INTENT_CONVERTER");
            break;
          case 202:
            v5 = CFSTR("FLOWDOMAINEXECUTIONTYPE_HOME_AUTOMATION_ININTENT_CONVERTER");
            break;
          case 203:
            v5 = CFSTR("FLOWDOMAINEXECUTIONTYPE_HOME_AUTOMATION_SEND_HOMEKIT_COMMAND_CONTROL");
            break;
          case 204:
            v5 = CFSTR("FLOWDOMAINEXECUTIONTYPE_HOME_AUTOMATION_SEND_HOMEKIT_COMMAND_ACE");
            break;
          case 205:
            v5 = CFSTR("FLOWDOMAINEXECUTIONTYPE_HOME_AUTOMATION_SEND_HOMEKIT_COMMAND_CONFIGURE");
            break;
          case 206:
            v5 = CFSTR("FLOWDOMAINEXECUTIONTYPE_HOME_AUTOMATION_NATIVE_HOME_STORE_INITIALIZATION");
            break;
          case 207:
            v5 = CFSTR("FLOWDOMAINEXECUTIONTYPE_HOME_AUTOMATION_MODIFYING_INTENT");
            break;
          case 208:
            v5 = CFSTR("FLOWDOMAINEXECUTIONTYPE_HOME_AUTOMATION_BLOCKING_INTENT");
            break;
          default:
            switch(v4)
            {
              case 'd':
                v5 = CFSTR("FLOWDOMAINEXECUTIONTYPE_MESSAGE_READ_ACTION_SPEECH_API");
                break;
              case 'e':
                v5 = CFSTR("FLOWDOMAINEXECUTIONTYPE_MESSAGE_SHARING_LINK_PRESENTATION");
                break;
              case 'f':
                v5 = CFSTR("FLOWDOMAINEXECUTIONTYPE_MESSAGE_ONE_SHOT_AUTO_PUNCTUATION_CESRFORMATTER");
                break;
              case 'g':
                v5 = CFSTR("FLOWDOMAINEXECUTIONTYPE_MESSAGE_WFON_SCREEN_CONTENT_EXTRACTION");
                break;
              case 'h':
                v5 = CFSTR("FLOWDOMAINEXECUTIONTYPE_MESSAGE_NOW_PLAYING_QUEUE_FETCH");
                break;
              default:
                goto LABEL_14;
            }
            break;
        }
      }
      else
      {
        v6 = CFSTR("FLOWDOMAINEXECUTIONTYPE_PHONE_RESOLVE_CRR");
        v7 = CFSTR("FLOWDOMAINEXECUTIONTYPE_PHONE_FACETIME_MESSAGE");
        v8 = CFSTR("FLOWDOMAINEXECUTIONTYPE_PHONE_RESOLVE_SRR");
        if (v4 != 302)
          v8 = CFSTR("FLOWDOMAINEXECUTIONTYPE_UNKNOWN");
        if (v4 != 301)
          v7 = v8;
        v9 = v4 == 300;
LABEL_11:
        if (v9)
          v5 = v6;
        else
          v5 = v7;
      }
    }
    else
    {
      switch(v4)
      {
        case 1000:
          v5 = CFSTR("FLOWDOMAINEXECUTIONTYPE_MEDIAPLAYER_AIRPLAY_DEVICE_SEARCH");
          break;
        case 1001:
          v5 = CFSTR("FLOWDOMAINEXECUTIONTYPE_MEDIAPLAYER_AIRPLAY_SET_AUDIO_SESSION_CATEGORY");
          break;
        case 1002:
          v5 = CFSTR("FLOWDOMAINEXECUTIONTYPE_MEDIAPLAYER_RECON_SESSION_CREATE_W_ENDPOINT_FEATURES");
          break;
        case 1003:
          v5 = CFSTR("FLOWDOMAINEXECUTIONTYPE_MEDIAPLAYER_RECON_SESSION_SET_TARGET_AUDIO_SESSION_ID");
          break;
        case 1004:
          v5 = CFSTR("FLOWDOMAINEXECUTIONTYPE_MEDIAPLAYER_AIRPLAY_SET_OUTPUT_DEVICES");
          break;
        case 1005:
          v5 = CFSTR("FLOWDOMAINEXECUTIONTYPE_MEDIAPLAYER_MEDIAREMOTE_SEND_QUEUE");
          break;
        case 1006:
          v5 = CFSTR("FLOWDOMAINEXECUTIONTYPE_MEDIAPLAYER_MEDIAREMOTE_PLAY");
          break;
        case 1007:
          v5 = CFSTR("FLOWDOMAINEXECUTIONTYPE_MEDIAPLAYER_AMS_PURCHASE");
          break;
        case 1008:
          v5 = CFSTR("FLOWDOMAINEXECUTIONTYPE_MEDIAPLAYER_SHAZAM_PERFORM_MATCH");
          break;
        case 1009:
          v5 = CFSTR("FLOWDOMAINEXECUTIONTYPE_MEDIAPLAYER_APP_SELECTION_CLIENT_CONTEXT_SIGNAL");
          break;
        case 1010:
          v5 = CFSTR("FLOWDOMAINEXECUTIONTYPE_MEDIAPLAYER_APP_SELECTION_COMPOUND_SIGNAL");
          break;
        case 1011:
          v5 = CFSTR("FLOWDOMAINEXECUTIONTYPE_MEDIAPLAYER_APP_SELECTION_ENTITY_SEARCH_SIGNAL");
          break;
        case 1012:
          v5 = CFSTR("FLOWDOMAINEXECUTIONTYPE_MEDIAPLAYER_APP_SELECTION_FOREGROUP_APP_SIGNAL");
          break;
        case 1013:
          v5 = CFSTR("FLOWDOMAINEXECUTIONTYPE_MEDIAPLAYER_APP_SELECTION_INTENT_MEDIA_SIGNAL");
          break;
        case 1014:
          v5 = CFSTR("FLOWDOMAINEXECUTIONTYPE_MEDIAPLAYER_APP_SELECTION_LAST_NOW_PLAYING_SIGNAL");
          break;
        case 1015:
          v5 = CFSTR("FLOWDOMAINEXECUTIONTYPE_MEDIAPLAYER_APP_SELECTION_NOW_PLAYING_APP_SIGNAL");
          break;
        case 1016:
          v5 = CFSTR("FLOWDOMAINEXECUTIONTYPE_MEDIAPLAYER_APP_SELECTION_NOW_PLAYING_STATE_SIGNAL");
          break;
        case 1017:
          v5 = CFSTR("FLOWDOMAINEXECUTIONTYPE_MEDIAPLAYER_APP_SELECTION_NOW_PLAYING_USAGE_SIGNAL");
          break;
        case 1018:
          v5 = CFSTR("FLOWDOMAINEXECUTIONTYPE_MEDIAPLAYER_APP_SELECTION_PRIVATE_INTENT_DATA_SIGNAL");
          break;
        case 1019:
          v5 = CFSTR("FLOWDOMAINEXECUTIONTYPE_MEDIAPLAYER_APP_SELECTION_SELECTED_APP_SIGNAL");
          break;
        case 1020:
          v5 = CFSTR("FLOWDOMAINEXECUTIONTYPE_MEDIAPLAYER_APP_SELECTION_SUPPORTED_MEDIA_SIGNAL");
          break;
        case 1021:
          v5 = CFSTR("FLOWDOMAINEXECUTIONTYPE_MEDIAPLAYER_APP_SELECTION_USER_CONTEXT_SIGNAL");
          break;
        case 1022:
          v5 = CFSTR("FLOWDOMAINEXECUTIONTYPE_MEDIAPLAYER_APP_SELECTION_MEGA_MODEL_LAST_NOW_PLAYING_SIGNAL");
          break;
        case 1023:
          v5 = CFSTR("FLOWDOMAINEXECUTIONTYPE_MEDIAPLAYER_APP_SELECTION_MEGA_MODEL_NOW_PLAYING_COUNT_SIGNAL");
          break;
        case 1024:
          v5 = CFSTR("FLOWDOMAINEXECUTIONTYPE_MEDIAPLAYER_APP_SELECTION_MEGA_MODEL_NOW_PLAYING_RECENCY_SIGNAL");
          break;
        case 1025:
          v5 = CFSTR("FLOWDOMAINEXECUTIONTYPE_MEDIAPLAYER_APP_SELECTION_PIRENE_REQUEST_SIGNAL");
          break;
        case 1026:
          v5 = CFSTR("FLOWDOMAINEXECUTIONTYPE_LIVE_ACTIVITY_WAIT");
          break;
        case 1027:
          v5 = CFSTR("FLOWDOMAINEXECUTIONTYPE_TIMER_ALARM_MOBILE_TIMER_WAIT");
          break;
        case 1028:
          v5 = CFSTR("FLOWDOMAINEXECUTIONTYPE_TIMER_ALARM_COORDINATION_WAIT");
          break;
        case 1029:
          v5 = CFSTR("FLOWDOMAINEXECUTIONTYPE_MEDIAPLAYER_APP_SELECTION_BOLT_ENABLED_SIGNAL");
          break;
        case 1030:
          v5 = CFSTR("FLOWDOMAINEXECUTIONTYPE_MEDIAPLAYER_APP_SELECTION_USER_RECOGNIZED_SIGNAL");
          break;
        case 1031:
          v5 = CFSTR("FLOWDOMAINEXECUTIONTYPE_MEDIAPLAYER_APP_SELECTION_FREE_MEDIA_CONTENT_SIGNAL");
          break;
        default:
          v6 = CFSTR("FLOWDOMAINEXECUTIONTYPE_VOICESHORTCUTS_SHORTCUT_EVENT_WAIT");
          v7 = CFSTR("FLOWDOMAINEXECUTIONTYPE_VOICESHORTCUTS_LINK_EVENT_WAIT");
          if (v4 != 401)
            v7 = CFSTR("FLOWDOMAINEXECUTIONTYPE_UNKNOWN");
          v9 = v4 == 400;
          goto LABEL_11;
      }
    }
LABEL_14:
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("domainExecutionType"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[FLOWSchemaFLOWDomainExecutionStarted dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (FLOWSchemaFLOWDomainExecutionStarted)initWithJSON:(id)a3
{
  void *v4;
  FLOWSchemaFLOWDomainExecutionStarted *v5;
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
    self = -[FLOWSchemaFLOWDomainExecutionStarted initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (FLOWSchemaFLOWDomainExecutionStarted)initWithDictionary:(id)a3
{
  id v4;
  FLOWSchemaFLOWDomainExecutionStarted *v5;
  void *v6;
  FLOWSchemaFLOWDomainExecutionStarted *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FLOWSchemaFLOWDomainExecutionStarted;
  v5 = -[FLOWSchemaFLOWDomainExecutionStarted init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("domainExecutionType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWDomainExecutionStarted setDomainExecutionType:](v5, "setDomainExecutionType:", objc_msgSend(v6, "intValue"));
    v7 = v5;

  }
  return v5;
}

- (int)domainExecutionType
{
  return self->_domainExecutionType;
}

@end
