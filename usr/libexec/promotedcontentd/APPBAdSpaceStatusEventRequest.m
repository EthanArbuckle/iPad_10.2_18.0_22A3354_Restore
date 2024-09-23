@implementation APPBAdSpaceStatusEventRequest

+ (id)options
{
  if (qword_100269890 != -1)
    dispatch_once(&qword_100269890, &stru_100214E60);
  return (id)qword_100269888;
}

- (BOOL)hasAdServerResponseIdentifier
{
  return self->_adServerResponseIdentifier != 0;
}

- (BOOL)hasAdOriginIdentifier
{
  return self->_adOriginIdentifier != 0;
}

- (BOOL)hasAnonymousDemandiAdID
{
  return self->_anonymousDemandiAdID != 0;
}

- (BOOL)hasContentiAdID
{
  return self->_contentiAdID != 0;
}

- (BOOL)hasIAdID
{
  return self->_iAdID != 0;
}

- (void)setTimestamp:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setResponseTime:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_responseTime = a3;
}

- (void)setHasResponseTime:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasResponseTime
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setScreenfuls:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_screenfuls = a3;
}

- (void)setHasScreenfuls:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasScreenfuls
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setFirstMessage:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_firstMessage = a3;
}

- (void)setHasFirstMessage:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasFirstMessage
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (int)statusCode
{
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    return self->_statusCode;
  else
    return 0;
}

- (void)setStatusCode:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_statusCode = a3;
}

- (void)setHasStatusCode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasStatusCode
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)statusCodeAsString:(int)a3
{
  __CFString *v3;
  id result;

  v3 = CFSTR("ADStatusCodeUnknown");
  switch(a3)
  {
    case 0:
      goto LABEL_4;
    case 1:
      result = CFSTR("ADStatusCodeServerFailure");
      break;
    case 2:
      result = CFSTR("ADStatusCodeLoadingThrottled");
      break;
    case 3:
      result = CFSTR("ADStatusCodeInventoryUnavailable");
      break;
    case 4:
      result = CFSTR("ADStatusCodeConfigurationError");
      break;
    case 5:
      result = CFSTR("ADStatusCodeBannerVisibleWithoutContent");
      break;
    case 6:
      result = CFSTR("ADStatusCodeApplicationInactive");
      break;
    case 7:
      result = CFSTR("ADStatusCodeAdUnloaded");
      break;
    case 8:
      result = CFSTR("ADStatusCodeAssetLoadFailure");
      break;
    case 9:
      result = CFSTR("ADStatusCodeAdResponseValidateFailure");
      break;
    case 10:
      result = CFSTR("ADStatusCodeAdAssetLoadPending");
      break;
    case 11:
      result = CFSTR("ADStatusCodeWaitingForResponse");
      break;
    case 12:
      result = CFSTR("ADStatusCodeNoAdDueToGlobalExclusion");
      break;
    case 13:
      result = CFSTR("ADStatusCodeNoAdDueToPolicyExclusion");
      break;
    case 14:
      result = CFSTR("ADStatusCodeBatchLimitExceeded");
      break;
    case 15:
      result = CFSTR("ADStatusCodeAdsDisabledInIssue");
      break;
    default:
      switch(a3)
      {
        case 3000:
          v3 = CFSTR("ADStatusCodeNoError");
          break;
        case 3001:
          return CFSTR("ADStatusCodeAdNotAvailable");
        case 3002:
          return CFSTR("ADStatusCodeSpacedTooCloseToAnAd");
        case 3003:
          return CFSTR("ADStatusCodePlacedInFirstScreenful");
        case 3004:
          return CFSTR("ADStatusCodeAdLoadedTooLate");
        case 3005:
          return CFSTR("ADStatusCodeAdUnloadedExceedingContainer");
        case 3006:
          return CFSTR("ADStatusCodeAdUnloadedMedusaResizing");
        case 3007:
          return CFSTR("ADStatusCodeAdGlobalCategoryBlacklisted");
        case 3008:
          return CFSTR("ADStatusCodeAdGlobalKeywordBlacklisted");
        case 3009:
          return CFSTR("ADStatusCodeAdCampaignCategoryBlacklisted");
        case 3010:
          return CFSTR("ADStatusCodeAdCampaignKeywordBlacklisted");
        case 3011:
          return CFSTR("ADStatusCodeAdMetadataError");
        case 3012:
          return CFSTR("ADStatusCodeAdArticleLoadError");
        case 3013:
          return CFSTR("ADStatusCodeAdVideoLoadError");
        default:
          if (a3 == 360)
            return CFSTR("ADStatusCodeNoAdDueToSubscriptionStatus");
          v3 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
          break;
      }
LABEL_4:
      result = v3;
      break;
  }
  return result;
}

- (int)StringAsStatusCode:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADStatusCodeUnknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADStatusCodeServerFailure")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADStatusCodeLoadingThrottled")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADStatusCodeInventoryUnavailable")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADStatusCodeConfigurationError")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADStatusCodeBannerVisibleWithoutContent")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADStatusCodeApplicationInactive")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADStatusCodeAdUnloaded")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADStatusCodeAssetLoadFailure")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADStatusCodeAdResponseValidateFailure")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADStatusCodeAdAssetLoadPending")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADStatusCodeWaitingForResponse")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADStatusCodeNoAdDueToGlobalExclusion")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADStatusCodeNoAdDueToPolicyExclusion")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADStatusCodeBatchLimitExceeded")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADStatusCodeAdsDisabledInIssue")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADStatusCodeNoAdDueToSubscriptionStatus")) & 1) != 0)
  {
    v4 = 360;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADStatusCodeNoError")) & 1) != 0)
  {
    v4 = 3000;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADStatusCodeAdNotAvailable")) & 1) != 0)
  {
    v4 = 3001;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADStatusCodeSpacedTooCloseToAnAd")) & 1) != 0)
  {
    v4 = 3002;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADStatusCodePlacedInFirstScreenful")) & 1) != 0)
  {
    v4 = 3003;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADStatusCodeAdLoadedTooLate")) & 1) != 0)
  {
    v4 = 3004;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADStatusCodeAdUnloadedExceedingContainer")) & 1) != 0)
  {
    v4 = 3005;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADStatusCodeAdUnloadedMedusaResizing")) & 1) != 0)
  {
    v4 = 3006;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADStatusCodeAdGlobalCategoryBlacklisted")) & 1) != 0)
  {
    v4 = 3007;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADStatusCodeAdGlobalKeywordBlacklisted")) & 1) != 0)
  {
    v4 = 3008;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADStatusCodeAdCampaignCategoryBlacklisted")) & 1) != 0)
  {
    v4 = 3009;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADStatusCodeAdCampaignKeywordBlacklisted")) & 1) != 0)
  {
    v4 = 3010;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADStatusCodeAdMetadataError")) & 1) != 0)
  {
    v4 = 3011;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADStatusCodeAdArticleLoadError")) & 1) != 0)
  {
    v4 = 3012;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ADStatusCodeAdVideoLoadError")))
  {
    v4 = 3013;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasOsVersionAndBuild
{
  return self->_osVersionAndBuild != 0;
}

- (BOOL)hasDPID
{
  return self->_dPID != 0;
}

- (BOOL)hasBundleID
{
  return self->_bundleID != 0;
}

- (void)setAdReused:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_adReused = a3;
}

- (void)setHasAdReused:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasAdReused
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (BOOL)hasContextJSON
{
  return self->_contextJSON != 0;
}

- (void)setSlotPosition:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_slotPosition = a3;
}

- (void)setHasSlotPosition:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSlotPosition
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)APPBAdSpaceStatusEventRequest;
  v3 = -[APPBAdSpaceStatusEventRequest description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APPBAdSpaceStatusEventRequest dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *adServerResponseIdentifier;
  NSString *adOriginIdentifier;
  NSData *anonymousDemandiAdID;
  NSData *contentiAdID;
  NSData *iAdID;
  char has;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int statusCode;
  __CFString *v16;
  NSString *osVersionAndBuild;
  NSData *dPID;
  NSString *bundleID;
  void *v20;
  NSString *contextJSON;
  void *v22;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = v3;
  adServerResponseIdentifier = self->_adServerResponseIdentifier;
  if (adServerResponseIdentifier)
    objc_msgSend(v3, "setObject:forKey:", adServerResponseIdentifier, CFSTR("adServerResponseIdentifier"));
  adOriginIdentifier = self->_adOriginIdentifier;
  if (adOriginIdentifier)
    objc_msgSend(v4, "setObject:forKey:", adOriginIdentifier, CFSTR("adOriginIdentifier"));
  anonymousDemandiAdID = self->_anonymousDemandiAdID;
  if (anonymousDemandiAdID)
    objc_msgSend(v4, "setObject:forKey:", anonymousDemandiAdID, CFSTR("anonymousDemandiAdID"));
  contentiAdID = self->_contentiAdID;
  if (contentiAdID)
    objc_msgSend(v4, "setObject:forKey:", contentiAdID, CFSTR("contentiAdID"));
  iAdID = self->_iAdID;
  if (iAdID)
    objc_msgSend(v4, "setObject:forKey:", iAdID, CFSTR("iAdID"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_timestamp));
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("timestamp"));

    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_13:
      if ((has & 4) == 0)
        goto LABEL_14;
      goto LABEL_19;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_13;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_responseTime));
  objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("responseTime"));

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_14:
    if ((has & 0x40) == 0)
      goto LABEL_15;
    goto LABEL_20;
  }
LABEL_19:
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_screenfuls));
  objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("screenfuls"));

  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_15:
    if ((has & 0x10) == 0)
      goto LABEL_57;
    goto LABEL_21;
  }
LABEL_20:
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_firstMessage));
  objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("firstMessage"));

  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_57;
LABEL_21:
  statusCode = self->_statusCode;
  v16 = CFSTR("ADStatusCodeUnknown");
  switch(statusCode)
  {
    case 0:
      break;
    case 1:
      v16 = CFSTR("ADStatusCodeServerFailure");
      break;
    case 2:
      v16 = CFSTR("ADStatusCodeLoadingThrottled");
      break;
    case 3:
      v16 = CFSTR("ADStatusCodeInventoryUnavailable");
      break;
    case 4:
      v16 = CFSTR("ADStatusCodeConfigurationError");
      break;
    case 5:
      v16 = CFSTR("ADStatusCodeBannerVisibleWithoutContent");
      break;
    case 6:
      v16 = CFSTR("ADStatusCodeApplicationInactive");
      break;
    case 7:
      v16 = CFSTR("ADStatusCodeAdUnloaded");
      break;
    case 8:
      v16 = CFSTR("ADStatusCodeAssetLoadFailure");
      break;
    case 9:
      v16 = CFSTR("ADStatusCodeAdResponseValidateFailure");
      break;
    case 10:
      v16 = CFSTR("ADStatusCodeAdAssetLoadPending");
      break;
    case 11:
      v16 = CFSTR("ADStatusCodeWaitingForResponse");
      break;
    case 12:
      v16 = CFSTR("ADStatusCodeNoAdDueToGlobalExclusion");
      break;
    case 13:
      v16 = CFSTR("ADStatusCodeNoAdDueToPolicyExclusion");
      break;
    case 14:
      v16 = CFSTR("ADStatusCodeBatchLimitExceeded");
      break;
    case 15:
      v16 = CFSTR("ADStatusCodeAdsDisabledInIssue");
      break;
    default:
      switch(statusCode)
      {
        case 3000:
          v16 = CFSTR("ADStatusCodeNoError");
          break;
        case 3001:
          v16 = CFSTR("ADStatusCodeAdNotAvailable");
          break;
        case 3002:
          v16 = CFSTR("ADStatusCodeSpacedTooCloseToAnAd");
          break;
        case 3003:
          v16 = CFSTR("ADStatusCodePlacedInFirstScreenful");
          break;
        case 3004:
          v16 = CFSTR("ADStatusCodeAdLoadedTooLate");
          break;
        case 3005:
          v16 = CFSTR("ADStatusCodeAdUnloadedExceedingContainer");
          break;
        case 3006:
          v16 = CFSTR("ADStatusCodeAdUnloadedMedusaResizing");
          break;
        case 3007:
          v16 = CFSTR("ADStatusCodeAdGlobalCategoryBlacklisted");
          break;
        case 3008:
          v16 = CFSTR("ADStatusCodeAdGlobalKeywordBlacklisted");
          break;
        case 3009:
          v16 = CFSTR("ADStatusCodeAdCampaignCategoryBlacklisted");
          break;
        case 3010:
          v16 = CFSTR("ADStatusCodeAdCampaignKeywordBlacklisted");
          break;
        case 3011:
          v16 = CFSTR("ADStatusCodeAdMetadataError");
          break;
        case 3012:
          v16 = CFSTR("ADStatusCodeAdArticleLoadError");
          break;
        case 3013:
          v16 = CFSTR("ADStatusCodeAdVideoLoadError");
          break;
        default:
          if (statusCode == 360)
            v16 = CFSTR("ADStatusCodeNoAdDueToSubscriptionStatus");
          else
            v16 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_statusCode));
          break;
      }
      break;
  }
  objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("statusCode"));

LABEL_57:
  osVersionAndBuild = self->_osVersionAndBuild;
  if (osVersionAndBuild)
    objc_msgSend(v4, "setObject:forKey:", osVersionAndBuild, CFSTR("osVersionAndBuild"));
  dPID = self->_dPID;
  if (dPID)
    objc_msgSend(v4, "setObject:forKey:", dPID, CFSTR("DPID"));
  bundleID = self->_bundleID;
  if (bundleID)
    objc_msgSend(v4, "setObject:forKey:", bundleID, CFSTR("bundleID"));
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_adReused));
    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("adReused"));

  }
  contextJSON = self->_contextJSON;
  if (contextJSON)
    objc_msgSend(v4, "setObject:forKey:", contextJSON, CFSTR("contextJSON"));
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_slotPosition));
    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("slotPosition"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return APPBAdSpaceStatusEventRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSString *adServerResponseIdentifier;
  NSString *adOriginIdentifier;
  NSData *anonymousDemandiAdID;
  NSData *contentiAdID;
  NSData *iAdID;
  char has;
  NSString *osVersionAndBuild;
  NSData *dPID;
  NSString *bundleID;
  NSString *contextJSON;
  id v15;

  v4 = a3;
  adServerResponseIdentifier = self->_adServerResponseIdentifier;
  v15 = v4;
  if (adServerResponseIdentifier)
  {
    PBDataWriterWriteStringField(v4, adServerResponseIdentifier, 1);
    v4 = v15;
  }
  adOriginIdentifier = self->_adOriginIdentifier;
  if (adOriginIdentifier)
  {
    PBDataWriterWriteStringField(v15, adOriginIdentifier, 2);
    v4 = v15;
  }
  anonymousDemandiAdID = self->_anonymousDemandiAdID;
  if (anonymousDemandiAdID)
  {
    PBDataWriterWriteDataField(v15, anonymousDemandiAdID, 3);
    v4 = v15;
  }
  contentiAdID = self->_contentiAdID;
  if (contentiAdID)
  {
    PBDataWriterWriteDataField(v15, contentiAdID, 4);
    v4 = v15;
  }
  iAdID = self->_iAdID;
  if (iAdID)
  {
    PBDataWriterWriteDataField(v15, iAdID, 5);
    v4 = v15;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField(v15, 6, self->_timestamp);
    v4 = v15;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_13:
      if ((has & 4) == 0)
        goto LABEL_14;
      goto LABEL_32;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_13;
  }
  PBDataWriterWriteDoubleField(v15, 7, self->_responseTime);
  v4 = v15;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_14:
    if ((has & 0x40) == 0)
      goto LABEL_15;
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteInt32Field(v15, self->_screenfuls, 8);
  v4 = v15;
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_15:
    if ((has & 0x10) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_33:
  PBDataWriterWriteBOOLField(v15, self->_firstMessage, 9);
  v4 = v15;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_16:
    PBDataWriterWriteInt32Field(v15, self->_statusCode, 10);
    v4 = v15;
  }
LABEL_17:
  osVersionAndBuild = self->_osVersionAndBuild;
  if (osVersionAndBuild)
  {
    PBDataWriterWriteStringField(v15, osVersionAndBuild, 11);
    v4 = v15;
  }
  dPID = self->_dPID;
  if (dPID)
  {
    PBDataWriterWriteDataField(v15, dPID, 13);
    v4 = v15;
  }
  bundleID = self->_bundleID;
  if (bundleID)
  {
    PBDataWriterWriteStringField(v15, bundleID, 14);
    v4 = v15;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField(v15, self->_adReused, 15);
    v4 = v15;
  }
  contextJSON = self->_contextJSON;
  if (contextJSON)
  {
    PBDataWriterWriteStringField(v15, contextJSON, 16);
    v4 = v15;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    PBDataWriterWriteInt32Field(v15, self->_slotPosition, 17);
    v4 = v15;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_adServerResponseIdentifier)
  {
    objc_msgSend(v4, "setAdServerResponseIdentifier:");
    v4 = v6;
  }
  if (self->_adOriginIdentifier)
  {
    objc_msgSend(v6, "setAdOriginIdentifier:");
    v4 = v6;
  }
  if (self->_anonymousDemandiAdID)
  {
    objc_msgSend(v6, "setAnonymousDemandiAdID:");
    v4 = v6;
  }
  if (self->_contentiAdID)
  {
    objc_msgSend(v6, "setContentiAdID:");
    v4 = v6;
  }
  if (self->_iAdID)
  {
    objc_msgSend(v6, "setIAdID:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_QWORD *)v4 + 2) = *(_QWORD *)&self->_timestamp;
    *((_BYTE *)v4 + 112) |= 2u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_13:
      if ((has & 4) == 0)
        goto LABEL_14;
      goto LABEL_32;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_13;
  }
  *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_responseTime;
  *((_BYTE *)v4 + 112) |= 1u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_14:
    if ((has & 0x40) == 0)
      goto LABEL_15;
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)v4 + 24) = self->_screenfuls;
  *((_BYTE *)v4 + 112) |= 4u;
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_15:
    if ((has & 0x10) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_33:
  *((_BYTE *)v4 + 109) = self->_firstMessage;
  *((_BYTE *)v4 + 112) |= 0x40u;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_16:
    *((_DWORD *)v4 + 26) = self->_statusCode;
    *((_BYTE *)v4 + 112) |= 0x10u;
  }
LABEL_17:
  if (self->_osVersionAndBuild)
  {
    objc_msgSend(v6, "setOsVersionAndBuild:");
    v4 = v6;
  }
  if (self->_dPID)
  {
    objc_msgSend(v6, "setDPID:");
    v4 = v6;
  }
  if (self->_bundleID)
  {
    objc_msgSend(v6, "setBundleID:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    *((_BYTE *)v4 + 108) = self->_adReused;
    *((_BYTE *)v4 + 112) |= 0x20u;
  }
  if (self->_contextJSON)
  {
    objc_msgSend(v6, "setContextJSON:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *((_DWORD *)v4 + 25) = self->_slotPosition;
    *((_BYTE *)v4 + 112) |= 8u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  char has;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_adServerResponseIdentifier, "copyWithZone:", a3);
  v7 = (void *)v5[4];
  v5[4] = v6;

  v8 = -[NSString copyWithZone:](self->_adOriginIdentifier, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  v10 = -[NSData copyWithZone:](self->_anonymousDemandiAdID, "copyWithZone:", a3);
  v11 = (void *)v5[5];
  v5[5] = v10;

  v12 = -[NSData copyWithZone:](self->_contentiAdID, "copyWithZone:", a3);
  v13 = (void *)v5[7];
  v5[7] = v12;

  v14 = -[NSData copyWithZone:](self->_iAdID, "copyWithZone:", a3);
  v15 = (void *)v5[10];
  v5[10] = v14;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5[2] = *(_QWORD *)&self->_timestamp;
    *((_BYTE *)v5 + 112) |= 2u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v5[1] = *(_QWORD *)&self->_responseTime;
  *((_BYTE *)v5 + 112) |= 1u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)v5 + 24) = self->_screenfuls;
  *((_BYTE *)v5 + 112) |= 4u;
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_15:
  *((_BYTE *)v5 + 109) = self->_firstMessage;
  *((_BYTE *)v5 + 112) |= 0x40u;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    *((_DWORD *)v5 + 26) = self->_statusCode;
    *((_BYTE *)v5 + 112) |= 0x10u;
  }
LABEL_7:
  v17 = -[NSString copyWithZone:](self->_osVersionAndBuild, "copyWithZone:", a3);
  v18 = (void *)v5[11];
  v5[11] = v17;

  v19 = -[NSData copyWithZone:](self->_dPID, "copyWithZone:", a3);
  v20 = (void *)v5[9];
  v5[9] = v19;

  v21 = -[NSString copyWithZone:](self->_bundleID, "copyWithZone:", a3);
  v22 = (void *)v5[6];
  v5[6] = v21;

  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    *((_BYTE *)v5 + 108) = self->_adReused;
    *((_BYTE *)v5 + 112) |= 0x20u;
  }
  v23 = -[NSString copyWithZone:](self->_contextJSON, "copyWithZone:", a3);
  v24 = (void *)v5[8];
  v5[8] = v23;

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *((_DWORD *)v5 + 25) = self->_slotPosition;
    *((_BYTE *)v5 + 112) |= 8u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *adServerResponseIdentifier;
  NSString *adOriginIdentifier;
  NSData *anonymousDemandiAdID;
  NSData *contentiAdID;
  NSData *iAdID;
  NSString *osVersionAndBuild;
  NSData *dPID;
  NSString *bundleID;
  char has;
  NSString *contextJSON;
  BOOL v15;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    goto LABEL_62;
  adServerResponseIdentifier = self->_adServerResponseIdentifier;
  if ((unint64_t)adServerResponseIdentifier | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](adServerResponseIdentifier, "isEqual:"))
      goto LABEL_62;
  }
  adOriginIdentifier = self->_adOriginIdentifier;
  if ((unint64_t)adOriginIdentifier | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](adOriginIdentifier, "isEqual:"))
      goto LABEL_62;
  }
  anonymousDemandiAdID = self->_anonymousDemandiAdID;
  if ((unint64_t)anonymousDemandiAdID | *((_QWORD *)v4 + 5))
  {
    if (!-[NSData isEqual:](anonymousDemandiAdID, "isEqual:"))
      goto LABEL_62;
  }
  contentiAdID = self->_contentiAdID;
  if ((unint64_t)contentiAdID | *((_QWORD *)v4 + 7))
  {
    if (!-[NSData isEqual:](contentiAdID, "isEqual:"))
      goto LABEL_62;
  }
  iAdID = self->_iAdID;
  if ((unint64_t)iAdID | *((_QWORD *)v4 + 10))
  {
    if (!-[NSData isEqual:](iAdID, "isEqual:"))
      goto LABEL_62;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 112) & 2) == 0 || self->_timestamp != *((double *)v4 + 2))
      goto LABEL_62;
  }
  else if ((*((_BYTE *)v4 + 112) & 2) != 0)
  {
    goto LABEL_62;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 112) & 1) == 0 || self->_responseTime != *((double *)v4 + 1))
      goto LABEL_62;
  }
  else if ((*((_BYTE *)v4 + 112) & 1) != 0)
  {
    goto LABEL_62;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 112) & 4) == 0 || self->_screenfuls != *((_DWORD *)v4 + 24))
      goto LABEL_62;
  }
  else if ((*((_BYTE *)v4 + 112) & 4) != 0)
  {
    goto LABEL_62;
  }
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 112) & 0x40) == 0)
      goto LABEL_62;
    if (self->_firstMessage)
    {
      if (!*((_BYTE *)v4 + 109))
        goto LABEL_62;
    }
    else if (*((_BYTE *)v4 + 109))
    {
      goto LABEL_62;
    }
  }
  else if ((*((_BYTE *)v4 + 112) & 0x40) != 0)
  {
    goto LABEL_62;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 112) & 0x10) == 0 || self->_statusCode != *((_DWORD *)v4 + 26))
      goto LABEL_62;
  }
  else if ((*((_BYTE *)v4 + 112) & 0x10) != 0)
  {
    goto LABEL_62;
  }
  osVersionAndBuild = self->_osVersionAndBuild;
  if ((unint64_t)osVersionAndBuild | *((_QWORD *)v4 + 11)
    && !-[NSString isEqual:](osVersionAndBuild, "isEqual:"))
  {
    goto LABEL_62;
  }
  dPID = self->_dPID;
  if ((unint64_t)dPID | *((_QWORD *)v4 + 9))
  {
    if (!-[NSData isEqual:](dPID, "isEqual:"))
      goto LABEL_62;
  }
  bundleID = self->_bundleID;
  if ((unint64_t)bundleID | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](bundleID, "isEqual:"))
      goto LABEL_62;
  }
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 112) & 0x20) == 0)
      goto LABEL_62;
    if (self->_adReused)
    {
      if (!*((_BYTE *)v4 + 108))
        goto LABEL_62;
    }
    else if (*((_BYTE *)v4 + 108))
    {
      goto LABEL_62;
    }
  }
  else if ((*((_BYTE *)v4 + 112) & 0x20) != 0)
  {
    goto LABEL_62;
  }
  contextJSON = self->_contextJSON;
  if (!((unint64_t)contextJSON | *((_QWORD *)v4 + 8)))
    goto LABEL_57;
  if (!-[NSString isEqual:](contextJSON, "isEqual:"))
  {
LABEL_62:
    v15 = 0;
    goto LABEL_63;
  }
  has = (char)self->_has;
LABEL_57:
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 112) & 8) == 0 || self->_slotPosition != *((_DWORD *)v4 + 25))
      goto LABEL_62;
    v15 = 1;
  }
  else
  {
    v15 = (*((_BYTE *)v4 + 112) & 8) == 0;
  }
LABEL_63:

  return v15;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  double timestamp;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  double responseTime;
  double v11;
  long double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  NSUInteger v16;
  unint64_t v17;
  NSUInteger v18;
  uint64_t v19;
  NSUInteger v20;
  uint64_t v21;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  NSUInteger v28;
  NSUInteger v29;

  v29 = -[NSString hash](self->_adServerResponseIdentifier, "hash");
  v28 = -[NSString hash](self->_adOriginIdentifier, "hash");
  v27 = (unint64_t)-[NSData hash](self->_anonymousDemandiAdID, "hash");
  v26 = (unint64_t)-[NSData hash](self->_contentiAdID, "hash");
  v25 = (unint64_t)-[NSData hash](self->_iAdID, "hash");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    timestamp = self->_timestamp;
    v6 = -timestamp;
    if (timestamp >= 0.0)
      v6 = self->_timestamp;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  v24 = v4;
  if ((has & 1) != 0)
  {
    responseTime = self->_responseTime;
    v11 = -responseTime;
    if (responseTime >= 0.0)
      v11 = self->_responseTime;
    v12 = floor(v11 + 0.5);
    v13 = (v11 - v12) * 1.84467441e19;
    v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  if ((has & 4) == 0)
  {
    v23 = 0;
    if ((has & 0x40) != 0)
      goto LABEL_19;
LABEL_22:
    v14 = 0;
    if ((has & 0x10) != 0)
      goto LABEL_20;
    goto LABEL_23;
  }
  v23 = 2654435761 * self->_screenfuls;
  if ((has & 0x40) == 0)
    goto LABEL_22;
LABEL_19:
  v14 = 2654435761 * self->_firstMessage;
  if ((has & 0x10) != 0)
  {
LABEL_20:
    v15 = 2654435761 * self->_statusCode;
    goto LABEL_24;
  }
LABEL_23:
  v15 = 0;
LABEL_24:
  v16 = -[NSString hash](self->_osVersionAndBuild, "hash");
  v17 = (unint64_t)-[NSData hash](self->_dPID, "hash");
  v18 = -[NSString hash](self->_bundleID, "hash");
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    v19 = 2654435761 * self->_adReused;
  else
    v19 = 0;
  v20 = -[NSString hash](self->_contextJSON, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
    v21 = 2654435761 * self->_slotPosition;
  else
    v21 = 0;
  return v28 ^ v29 ^ v27 ^ v26 ^ v25 ^ v24 ^ v9 ^ v23 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (*((_QWORD *)v4 + 4))
  {
    -[APPBAdSpaceStatusEventRequest setAdServerResponseIdentifier:](self, "setAdServerResponseIdentifier:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[APPBAdSpaceStatusEventRequest setAdOriginIdentifier:](self, "setAdOriginIdentifier:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[APPBAdSpaceStatusEventRequest setAnonymousDemandiAdID:](self, "setAnonymousDemandiAdID:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 7))
  {
    -[APPBAdSpaceStatusEventRequest setContentiAdID:](self, "setContentiAdID:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 10))
  {
    -[APPBAdSpaceStatusEventRequest setIAdID:](self, "setIAdID:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 112);
  if ((v5 & 2) != 0)
  {
    self->_timestamp = *((double *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 112);
    if ((v5 & 1) == 0)
    {
LABEL_13:
      if ((v5 & 4) == 0)
        goto LABEL_14;
      goto LABEL_32;
    }
  }
  else if ((*((_BYTE *)v4 + 112) & 1) == 0)
  {
    goto LABEL_13;
  }
  self->_responseTime = *((double *)v4 + 1);
  *(_BYTE *)&self->_has |= 1u;
  v5 = *((_BYTE *)v4 + 112);
  if ((v5 & 4) == 0)
  {
LABEL_14:
    if ((v5 & 0x40) == 0)
      goto LABEL_15;
    goto LABEL_33;
  }
LABEL_32:
  self->_screenfuls = *((_DWORD *)v4 + 24);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)v4 + 112);
  if ((v5 & 0x40) == 0)
  {
LABEL_15:
    if ((v5 & 0x10) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_33:
  self->_firstMessage = *((_BYTE *)v4 + 109);
  *(_BYTE *)&self->_has |= 0x40u;
  if ((*((_BYTE *)v4 + 112) & 0x10) != 0)
  {
LABEL_16:
    self->_statusCode = *((_DWORD *)v4 + 26);
    *(_BYTE *)&self->_has |= 0x10u;
  }
LABEL_17:
  if (*((_QWORD *)v4 + 11))
  {
    -[APPBAdSpaceStatusEventRequest setOsVersionAndBuild:](self, "setOsVersionAndBuild:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 9))
  {
    -[APPBAdSpaceStatusEventRequest setDPID:](self, "setDPID:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[APPBAdSpaceStatusEventRequest setBundleID:](self, "setBundleID:");
    v4 = v6;
  }
  if ((*((_BYTE *)v4 + 112) & 0x20) != 0)
  {
    self->_adReused = *((_BYTE *)v4 + 108);
    *(_BYTE *)&self->_has |= 0x20u;
  }
  if (*((_QWORD *)v4 + 8))
  {
    -[APPBAdSpaceStatusEventRequest setContextJSON:](self, "setContextJSON:");
    v4 = v6;
  }
  if ((*((_BYTE *)v4 + 112) & 8) != 0)
  {
    self->_slotPosition = *((_DWORD *)v4 + 25);
    *(_BYTE *)&self->_has |= 8u;
  }

}

- (NSString)adServerResponseIdentifier
{
  return self->_adServerResponseIdentifier;
}

- (void)setAdServerResponseIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_adServerResponseIdentifier, a3);
}

- (NSString)adOriginIdentifier
{
  return self->_adOriginIdentifier;
}

- (void)setAdOriginIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_adOriginIdentifier, a3);
}

- (NSData)anonymousDemandiAdID
{
  return self->_anonymousDemandiAdID;
}

- (void)setAnonymousDemandiAdID:(id)a3
{
  objc_storeStrong((id *)&self->_anonymousDemandiAdID, a3);
}

- (NSData)contentiAdID
{
  return self->_contentiAdID;
}

- (void)setContentiAdID:(id)a3
{
  objc_storeStrong((id *)&self->_contentiAdID, a3);
}

- (NSData)iAdID
{
  return self->_iAdID;
}

- (void)setIAdID:(id)a3
{
  objc_storeStrong((id *)&self->_iAdID, a3);
}

- (double)timestamp
{
  return self->_timestamp;
}

- (double)responseTime
{
  return self->_responseTime;
}

- (int)screenfuls
{
  return self->_screenfuls;
}

- (BOOL)firstMessage
{
  return self->_firstMessage;
}

- (NSString)osVersionAndBuild
{
  return self->_osVersionAndBuild;
}

- (void)setOsVersionAndBuild:(id)a3
{
  objc_storeStrong((id *)&self->_osVersionAndBuild, a3);
}

- (NSData)dPID
{
  return self->_dPID;
}

- (void)setDPID:(id)a3
{
  objc_storeStrong((id *)&self->_dPID, a3);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (BOOL)adReused
{
  return self->_adReused;
}

- (NSString)contextJSON
{
  return self->_contextJSON;
}

- (void)setContextJSON:(id)a3
{
  objc_storeStrong((id *)&self->_contextJSON, a3);
}

- (int)slotPosition
{
  return self->_slotPosition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_osVersionAndBuild, 0);
  objc_storeStrong((id *)&self->_iAdID, 0);
  objc_storeStrong((id *)&self->_dPID, 0);
  objc_storeStrong((id *)&self->_contextJSON, 0);
  objc_storeStrong((id *)&self->_contentiAdID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_anonymousDemandiAdID, 0);
  objc_storeStrong((id *)&self->_adServerResponseIdentifier, 0);
  objc_storeStrong((id *)&self->_adOriginIdentifier, 0);
}

@end
