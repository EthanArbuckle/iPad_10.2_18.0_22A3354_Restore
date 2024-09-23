@implementation PLUSSchemaPLUSPhoneCallMetadataExtracted

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
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PLUSSchemaPLUSPhoneCallMetadataExtracted;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLUSSchemaPLUSPhoneCallMetadataExtracted originalPlusId](self, "originalPlusId", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[PLUSSchemaPLUSPhoneCallMetadataExtracted deleteOriginalPlusId](self, "deleteOriginalPlusId");
  return v5;
}

- (BOOL)hasOriginalPlusId
{
  return self->_originalPlusId != 0;
}

- (void)deleteOriginalPlusId
{
  -[PLUSSchemaPLUSPhoneCallMetadataExtracted setOriginalPlusId:](self, "setOriginalPlusId:", 0);
}

- (void)setHasSiriResolvedContact:(BOOL)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_hasSiriResolvedContact = a3;
}

- (BOOL)hasHasSiriResolvedContact
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHasHasSiriResolvedContact:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (void)deleteHasSiriResolvedContact
{
  -[PLUSSchemaPLUSPhoneCallMetadataExtracted setHasSiriResolvedContact:](self, "setHasSiriResolvedContact:", 0);
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setHasSiriInitiatedCall:(BOOL)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_hasSiriInitiatedCall = a3;
}

- (BOOL)hasHasSiriInitiatedCall
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHasHasSiriInitiatedCall:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (void)deleteHasSiriInitiatedCall
{
  -[PLUSSchemaPLUSPhoneCallMetadataExtracted setHasSiriInitiatedCall:](self, "setHasSiriInitiatedCall:", 0);
  *(_WORD *)&self->_has &= ~2u;
}

- (void)setHasUserMadeFollowupCallWithinDetectionWindow:(BOOL)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_hasUserMadeFollowupCallWithinDetectionWindow = a3;
}

- (BOOL)hasHasUserMadeFollowupCallWithinDetectionWindow
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setHasHasUserMadeFollowupCallWithinDetectionWindow:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (void)deleteHasUserMadeFollowupCallWithinDetectionWindow
{
  -[PLUSSchemaPLUSPhoneCallMetadataExtracted setHasUserMadeFollowupCallWithinDetectionWindow:](self, "setHasUserMadeFollowupCallWithinDetectionWindow:", 0);
  *(_WORD *)&self->_has &= ~4u;
}

- (void)setHasUserMadeFollowupCallWithinEvaluationWindow:(BOOL)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_hasUserMadeFollowupCallWithinEvaluationWindow = a3;
}

- (BOOL)hasHasUserMadeFollowupCallWithinEvaluationWindow
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHasHasUserMadeFollowupCallWithinEvaluationWindow:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (void)deleteHasUserMadeFollowupCallWithinEvaluationWindow
{
  -[PLUSSchemaPLUSPhoneCallMetadataExtracted setHasUserMadeFollowupCallWithinEvaluationWindow:](self, "setHasUserMadeFollowupCallWithinEvaluationWindow:", 0);
  *(_WORD *)&self->_has &= ~8u;
}

- (void)setSiriAndFollowupContactComparison:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_siriAndFollowupContactComparison = a3;
}

- (BOOL)hasSiriAndFollowupContactComparison
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHasSiriAndFollowupContactComparison:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (void)deleteSiriAndFollowupContactComparison
{
  -[PLUSSchemaPLUSPhoneCallMetadataExtracted setSiriAndFollowupContactComparison:](self, "setSiriAndFollowupContactComparison:", 0);
  *(_WORD *)&self->_has &= ~0x10u;
}

- (void)setSiriCallDuration:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_siriCallDuration = a3;
}

- (BOOL)hasSiriCallDuration
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHasSiriCallDuration:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (void)deleteSiriCallDuration
{
  -[PLUSSchemaPLUSPhoneCallMetadataExtracted setSiriCallDuration:](self, "setSiriCallDuration:", 0);
  *(_WORD *)&self->_has &= ~0x20u;
}

- (void)setSiriCallTimeToHangup:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_siriCallTimeToHangup = a3;
}

- (BOOL)hasSiriCallTimeToHangup
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHasSiriCallTimeToHangup:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (void)deleteSiriCallTimeToHangup
{
  -[PLUSSchemaPLUSPhoneCallMetadataExtracted setSiriCallTimeToHangup:](self, "setSiriCallTimeToHangup:", 0);
  *(_WORD *)&self->_has &= ~0x40u;
}

- (void)setUserTimeToFollowup:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_userTimeToFollowup = a3;
}

- (BOOL)hasUserTimeToFollowup
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHasUserTimeToFollowup:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (void)deleteUserTimeToFollowup
{
  -[PLUSSchemaPLUSPhoneCallMetadataExtracted setUserTimeToFollowup:](self, "setUserTimeToFollowup:", 0);
  *(_WORD *)&self->_has &= ~0x80u;
}

- (void)setIsSameCallRouteForSiriAndFollowup:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_isSameCallRouteForSiriAndFollowup = a3;
}

- (BOOL)hasIsSameCallRouteForSiriAndFollowup
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHasIsSameCallRouteForSiriAndFollowup:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (void)deleteIsSameCallRouteForSiriAndFollowup
{
  -[PLUSSchemaPLUSPhoneCallMetadataExtracted setIsSameCallRouteForSiriAndFollowup:](self, "setIsSameCallRouteForSiriAndFollowup:", 0);
  *(_WORD *)&self->_has &= ~0x100u;
}

- (void)setIsSameCallCapabilityForFollowup:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_isSameCallCapabilityForFollowup = a3;
}

- (BOOL)hasIsSameCallCapabilityForFollowup
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setHasIsSameCallCapabilityForFollowup:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (void)deleteIsSameCallCapabilityForFollowup
{
  -[PLUSSchemaPLUSPhoneCallMetadataExtracted setIsSameCallCapabilityForFollowup:](self, "setIsSameCallCapabilityForFollowup:", 0);
  *(_WORD *)&self->_has &= ~0x200u;
}

- (void)setFollowupNameSimilarity:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_followupNameSimilarity = a3;
}

- (BOOL)hasFollowupNameSimilarity
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setHasFollowupNameSimilarity:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (void)deleteFollowupNameSimilarity
{
  -[PLUSSchemaPLUSPhoneCallMetadataExtracted setFollowupNameSimilarity:](self, "setFollowupNameSimilarity:", 0);
  *(_WORD *)&self->_has &= ~0x400u;
}

- (BOOL)readFrom:(id)a3
{
  return PLUSSchemaPLUSPhoneCallMetadataExtractedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  __int16 has;
  void *v7;
  id v8;

  v8 = a3;
  -[PLUSSchemaPLUSPhoneCallMetadataExtracted originalPlusId](self, "originalPlusId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PLUSSchemaPLUSPhoneCallMetadataExtracted originalPlusId](self, "originalPlusId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (__int16)self->_has;
  }
  v7 = v8;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v7 = v8;
    has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 8) == 0)
        goto LABEL_8;
      goto LABEL_19;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteBOOLField();
  v7 = v8;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteBOOLField();
  v7 = v8;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteInt32Field();
  v7 = v8;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteInt32Field();
  v7 = v8;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_11:
    if ((has & 0x80) == 0)
      goto LABEL_12;
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteInt32Field();
  v7 = v8;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_12:
    if ((has & 0x100) == 0)
      goto LABEL_13;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteInt32Field();
  v7 = v8;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_13:
    if ((has & 0x200) == 0)
      goto LABEL_14;
LABEL_25:
    PBDataWriterWriteBOOLField();
    v7 = v8;
    if ((*(_WORD *)&self->_has & 0x400) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_24:
  PBDataWriterWriteBOOLField();
  v7 = v8;
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
    goto LABEL_25;
LABEL_14:
  if ((has & 0x400) != 0)
  {
LABEL_15:
    PBDataWriterWriteInt32Field();
    v7 = v8;
  }
LABEL_16:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int16 *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  $85DA9350D4ED826A90B1925CA907032D has;
  unsigned int v14;
  int hasSiriResolvedContact;
  int v16;
  int hasSiriInitiatedCall;
  int v18;
  int hasUserMadeFollowupCallWithinDetectionWindow;
  int v20;
  int hasUserMadeFollowupCallWithinEvaluationWindow;
  int v22;
  int siriAndFollowupContactComparison;
  int v24;
  int siriCallDuration;
  int v26;
  int siriCallTimeToHangup;
  int v28;
  int userTimeToFollowup;
  int v30;
  int isSameCallRouteForSiriAndFollowup;
  int v32;
  int isSameCallCapabilityForFollowup;
  int v34;
  int followupNameSimilarity;
  BOOL v36;

  v4 = (unsigned __int16 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_52;
  -[PLUSSchemaPLUSPhoneCallMetadataExtracted originalPlusId](self, "originalPlusId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "originalPlusId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_52;
  }
  -[PLUSSchemaPLUSPhoneCallMetadataExtracted originalPlusId](self, "originalPlusId");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[PLUSSchemaPLUSPhoneCallMetadataExtracted originalPlusId](self, "originalPlusId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "originalPlusId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_52;
  }
  else
  {

  }
  has = self->_has;
  v14 = v4[22];
  if ((*(_BYTE *)&has & 1) != (v14 & 1))
  {
LABEL_52:
    v36 = 0;
    goto LABEL_53;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    hasSiriResolvedContact = self->_hasSiriResolvedContact;
    if (hasSiriResolvedContact != objc_msgSend(v4, "hasSiriResolvedContact"))
      goto LABEL_52;
    has = self->_has;
    v14 = v4[22];
  }
  v16 = (*(unsigned int *)&has >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1))
    goto LABEL_52;
  if (v16)
  {
    hasSiriInitiatedCall = self->_hasSiriInitiatedCall;
    if (hasSiriInitiatedCall != objc_msgSend(v4, "hasSiriInitiatedCall"))
      goto LABEL_52;
    has = self->_has;
    v14 = v4[22];
  }
  v18 = (*(unsigned int *)&has >> 2) & 1;
  if (v18 != ((v14 >> 2) & 1))
    goto LABEL_52;
  if (v18)
  {
    hasUserMadeFollowupCallWithinDetectionWindow = self->_hasUserMadeFollowupCallWithinDetectionWindow;
    if (hasUserMadeFollowupCallWithinDetectionWindow != objc_msgSend(v4, "hasUserMadeFollowupCallWithinDetectionWindow"))goto LABEL_52;
    has = self->_has;
    v14 = v4[22];
  }
  v20 = (*(unsigned int *)&has >> 3) & 1;
  if (v20 != ((v14 >> 3) & 1))
    goto LABEL_52;
  if (v20)
  {
    hasUserMadeFollowupCallWithinEvaluationWindow = self->_hasUserMadeFollowupCallWithinEvaluationWindow;
    if (hasUserMadeFollowupCallWithinEvaluationWindow != objc_msgSend(v4, "hasUserMadeFollowupCallWithinEvaluationWindow"))goto LABEL_52;
    has = self->_has;
    v14 = v4[22];
  }
  v22 = (*(unsigned int *)&has >> 4) & 1;
  if (v22 != ((v14 >> 4) & 1))
    goto LABEL_52;
  if (v22)
  {
    siriAndFollowupContactComparison = self->_siriAndFollowupContactComparison;
    if (siriAndFollowupContactComparison != objc_msgSend(v4, "siriAndFollowupContactComparison"))
      goto LABEL_52;
    has = self->_has;
    v14 = v4[22];
  }
  v24 = (*(unsigned int *)&has >> 5) & 1;
  if (v24 != ((v14 >> 5) & 1))
    goto LABEL_52;
  if (v24)
  {
    siriCallDuration = self->_siriCallDuration;
    if (siriCallDuration != objc_msgSend(v4, "siriCallDuration"))
      goto LABEL_52;
    has = self->_has;
    v14 = v4[22];
  }
  v26 = (*(unsigned int *)&has >> 6) & 1;
  if (v26 != ((v14 >> 6) & 1))
    goto LABEL_52;
  if (v26)
  {
    siriCallTimeToHangup = self->_siriCallTimeToHangup;
    if (siriCallTimeToHangup != objc_msgSend(v4, "siriCallTimeToHangup"))
      goto LABEL_52;
    has = self->_has;
    v14 = v4[22];
  }
  v28 = (*(unsigned int *)&has >> 7) & 1;
  if (v28 != ((v14 >> 7) & 1))
    goto LABEL_52;
  if (v28)
  {
    userTimeToFollowup = self->_userTimeToFollowup;
    if (userTimeToFollowup != objc_msgSend(v4, "userTimeToFollowup"))
      goto LABEL_52;
    has = self->_has;
    v14 = v4[22];
  }
  v30 = (*(unsigned int *)&has >> 8) & 1;
  if (v30 != ((v14 >> 8) & 1))
    goto LABEL_52;
  if (v30)
  {
    isSameCallRouteForSiriAndFollowup = self->_isSameCallRouteForSiriAndFollowup;
    if (isSameCallRouteForSiriAndFollowup != objc_msgSend(v4, "isSameCallRouteForSiriAndFollowup"))
      goto LABEL_52;
    has = self->_has;
    v14 = v4[22];
  }
  v32 = (*(unsigned int *)&has >> 9) & 1;
  if (v32 != ((v14 >> 9) & 1))
    goto LABEL_52;
  if (v32)
  {
    isSameCallCapabilityForFollowup = self->_isSameCallCapabilityForFollowup;
    if (isSameCallCapabilityForFollowup == objc_msgSend(v4, "isSameCallCapabilityForFollowup"))
    {
      has = self->_has;
      v14 = v4[22];
      goto LABEL_48;
    }
    goto LABEL_52;
  }
LABEL_48:
  v34 = (*(unsigned int *)&has >> 10) & 1;
  if (v34 != ((v14 >> 10) & 1))
    goto LABEL_52;
  if (v34)
  {
    followupNameSimilarity = self->_followupNameSimilarity;
    if (followupNameSimilarity != objc_msgSend(v4, "followupNameSimilarity"))
      goto LABEL_52;
  }
  v36 = 1;
LABEL_53:

  return v36;
}

- (unint64_t)hash
{
  unint64_t v3;
  __int16 has;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v3 = -[SISchemaUUID hash](self->_originalPlusId, "hash");
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v5 = 2654435761 * self->_hasSiriResolvedContact;
    if ((has & 2) != 0)
    {
LABEL_3:
      v6 = 2654435761 * self->_hasSiriInitiatedCall;
      if ((has & 4) != 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else
  {
    v5 = 0;
    if ((has & 2) != 0)
      goto LABEL_3;
  }
  v6 = 0;
  if ((has & 4) != 0)
  {
LABEL_4:
    v7 = 2654435761 * self->_hasUserMadeFollowupCallWithinDetectionWindow;
    if ((has & 8) != 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  v7 = 0;
  if ((has & 8) != 0)
  {
LABEL_5:
    v8 = 2654435761 * self->_hasUserMadeFollowupCallWithinEvaluationWindow;
    if ((has & 0x10) != 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  v8 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_6:
    v9 = 2654435761 * self->_siriAndFollowupContactComparison;
    if ((has & 0x20) != 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  v9 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_7:
    v10 = 2654435761 * self->_siriCallDuration;
    if ((has & 0x40) != 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  v10 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_8:
    v11 = 2654435761 * self->_siriCallTimeToHangup;
    if ((has & 0x80) != 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  v11 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_9:
    v12 = 2654435761 * self->_userTimeToFollowup;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_10;
    goto LABEL_21;
  }
LABEL_20:
  v12 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_10:
    v13 = 2654435761 * self->_isSameCallRouteForSiriAndFollowup;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_11;
LABEL_22:
    v14 = 0;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_12;
LABEL_23:
    v15 = 0;
    return v5 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
  }
LABEL_21:
  v13 = 0;
  if ((*(_WORD *)&self->_has & 0x200) == 0)
    goto LABEL_22;
LABEL_11:
  v14 = 2654435761 * self->_isSameCallCapabilityForFollowup;
  if ((*(_WORD *)&self->_has & 0x400) == 0)
    goto LABEL_23;
LABEL_12:
  v15 = 2654435761 * self->_followupNameSimilarity;
  return v5 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  unsigned int v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int16 v16;
  unsigned int v17;
  const __CFString *v18;
  unsigned int v19;
  const __CFString *v20;
  unsigned int v21;
  const __CFString *v22;
  unsigned int v23;
  const __CFString *v24;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    v5 = -[PLUSSchemaPLUSPhoneCallMetadataExtracted followupNameSimilarity](self, "followupNameSimilarity") - 1;
    if (v5 > 3)
      v6 = CFSTR("PLUSCONTACTNAMESTRINGSIMILARITY_UNKNOWN");
    else
      v6 = off_1E5632E28[v5];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("followupNameSimilarity"));
    has = (__int16)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PLUSSchemaPLUSPhoneCallMetadataExtracted hasSiriInitiatedCall](self, "hasSiriInitiatedCall"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("hasSiriInitiatedCall"));

    has = (__int16)self->_has;
    if ((has & 1) == 0)
    {
LABEL_8:
      if ((has & 4) == 0)
        goto LABEL_9;
      goto LABEL_18;
    }
  }
  else if ((has & 1) == 0)
  {
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PLUSSchemaPLUSPhoneCallMetadataExtracted hasSiriResolvedContact](self, "hasSiriResolvedContact"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("hasSiriResolvedContact"));

  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 8) == 0)
      goto LABEL_10;
    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PLUSSchemaPLUSPhoneCallMetadataExtracted hasUserMadeFollowupCallWithinDetectionWindow](self, "hasUserMadeFollowupCallWithinDetectionWindow"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("hasUserMadeFollowupCallWithinDetectionWindow"));

  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PLUSSchemaPLUSPhoneCallMetadataExtracted hasUserMadeFollowupCallWithinEvaluationWindow](self, "hasUserMadeFollowupCallWithinEvaluationWindow"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("hasUserMadeFollowupCallWithinEvaluationWindow"));

  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_11:
    if ((has & 0x100) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_20:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PLUSSchemaPLUSPhoneCallMetadataExtracted isSameCallCapabilityForFollowup](self, "isSameCallCapabilityForFollowup"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("isSameCallCapabilityForFollowup"));

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PLUSSchemaPLUSPhoneCallMetadataExtracted isSameCallRouteForSiriAndFollowup](self, "isSameCallRouteForSiriAndFollowup"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("isSameCallRouteForSiriAndFollowup"));

  }
LABEL_13:
  if (self->_originalPlusId)
  {
    -[PLUSSchemaPLUSPhoneCallMetadataExtracted originalPlusId](self, "originalPlusId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("originalPlusId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("originalPlusId"));

    }
  }
  v16 = (__int16)self->_has;
  if ((v16 & 0x10) != 0)
  {
    v17 = -[PLUSSchemaPLUSPhoneCallMetadataExtracted siriAndFollowupContactComparison](self, "siriAndFollowupContactComparison")- 1;
    if (v17 > 4)
      v18 = CFSTR("PLUSCONTACTREFERENCECOMPARISON_UNKNOWN");
    else
      v18 = off_1E5632E48[v17];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("siriAndFollowupContactComparison"));
    v16 = (__int16)self->_has;
    if ((v16 & 0x20) == 0)
    {
LABEL_26:
      if ((v16 & 0x40) == 0)
        goto LABEL_27;
      goto LABEL_37;
    }
  }
  else if ((v16 & 0x20) == 0)
  {
    goto LABEL_26;
  }
  v19 = -[PLUSSchemaPLUSPhoneCallMetadataExtracted siriCallDuration](self, "siriCallDuration") - 1;
  if (v19 > 4)
    v20 = CFSTR("PLUSPHONECALLDURATIONBUCKET_UNKNOWN");
  else
    v20 = off_1E5632E70[v19];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("siriCallDuration"));
  v16 = (__int16)self->_has;
  if ((v16 & 0x40) == 0)
  {
LABEL_27:
    if ((v16 & 0x80) == 0)
      goto LABEL_45;
    goto LABEL_41;
  }
LABEL_37:
  v21 = -[PLUSSchemaPLUSPhoneCallMetadataExtracted siriCallTimeToHangup](self, "siriCallTimeToHangup") - 1;
  if (v21 > 3)
    v22 = CFSTR("PLUSPHONECALLTIMETOHANGUPBUCKET_UNKNOWN");
  else
    v22 = off_1E5632E98[v21];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("siriCallTimeToHangup"));
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_41:
    v23 = -[PLUSSchemaPLUSPhoneCallMetadataExtracted userTimeToFollowup](self, "userTimeToFollowup") - 1;
    if (v23 > 3)
      v24 = CFSTR("PLUSTIMETOFOLLOWUPBUCKET_UNKNOWN");
    else
      v24 = off_1E5632EB8[v23];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("userTimeToFollowup"));
  }
LABEL_45:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PLUSSchemaPLUSPhoneCallMetadataExtracted dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PLUSSchemaPLUSPhoneCallMetadataExtracted)initWithJSON:(id)a3
{
  void *v4;
  PLUSSchemaPLUSPhoneCallMetadataExtracted *v5;
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
    self = -[PLUSSchemaPLUSPhoneCallMetadataExtracted initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PLUSSchemaPLUSPhoneCallMetadataExtracted)initWithDictionary:(id)a3
{
  id v4;
  PLUSSchemaPLUSPhoneCallMetadataExtracted *v5;
  uint64_t v6;
  SISchemaUUID *v7;
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
  PLUSSchemaPLUSPhoneCallMetadataExtracted *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)PLUSSchemaPLUSPhoneCallMetadataExtracted;
  v5 = -[PLUSSchemaPLUSPhoneCallMetadataExtracted init](&v27, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("originalPlusId"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[PLUSSchemaPLUSPhoneCallMetadataExtracted setOriginalPlusId:](v5, "setOriginalPlusId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasSiriResolvedContact"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PLUSSchemaPLUSPhoneCallMetadataExtracted setHasSiriResolvedContact:](v5, "setHasSiriResolvedContact:", objc_msgSend(v8, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasSiriInitiatedCall"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PLUSSchemaPLUSPhoneCallMetadataExtracted setHasSiriInitiatedCall:](v5, "setHasSiriInitiatedCall:", objc_msgSend(v9, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasUserMadeFollowupCallWithinDetectionWindow"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PLUSSchemaPLUSPhoneCallMetadataExtracted setHasUserMadeFollowupCallWithinDetectionWindow:](v5, "setHasUserMadeFollowupCallWithinDetectionWindow:", objc_msgSend(v10, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasUserMadeFollowupCallWithinEvaluationWindow"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PLUSSchemaPLUSPhoneCallMetadataExtracted setHasUserMadeFollowupCallWithinEvaluationWindow:](v5, "setHasUserMadeFollowupCallWithinEvaluationWindow:", objc_msgSend(v11, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siriAndFollowupContactComparison"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PLUSSchemaPLUSPhoneCallMetadataExtracted setSiriAndFollowupContactComparison:](v5, "setSiriAndFollowupContactComparison:", objc_msgSend(v12, "intValue"));
    v22 = v12;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siriCallDuration"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PLUSSchemaPLUSPhoneCallMetadataExtracted setSiriCallDuration:](v5, "setSiriCallDuration:", objc_msgSend(v13, "intValue"));
    v25 = v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siriCallTimeToHangup"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PLUSSchemaPLUSPhoneCallMetadataExtracted setSiriCallTimeToHangup:](v5, "setSiriCallTimeToHangup:", objc_msgSend(v14, "intValue"));
    v26 = (void *)v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userTimeToFollowup"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PLUSSchemaPLUSPhoneCallMetadataExtracted setUserTimeToFollowup:](v5, "setUserTimeToFollowup:", objc_msgSend(v15, "intValue"));
    v23 = v11;
    v24 = v9;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isSameCallRouteForSiriAndFollowup"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PLUSSchemaPLUSPhoneCallMetadataExtracted setIsSameCallRouteForSiriAndFollowup:](v5, "setIsSameCallRouteForSiriAndFollowup:", objc_msgSend(v16, "BOOLValue"));
    v17 = v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isSameCallCapabilityForFollowup"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PLUSSchemaPLUSPhoneCallMetadataExtracted setIsSameCallCapabilityForFollowup:](v5, "setIsSameCallCapabilityForFollowup:", objc_msgSend(v18, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("followupNameSimilarity"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PLUSSchemaPLUSPhoneCallMetadataExtracted setFollowupNameSimilarity:](v5, "setFollowupNameSimilarity:", objc_msgSend(v19, "intValue"));
    v20 = v5;

  }
  return v5;
}

- (SISchemaUUID)originalPlusId
{
  return self->_originalPlusId;
}

- (void)setOriginalPlusId:(id)a3
{
  objc_storeStrong((id *)&self->_originalPlusId, a3);
}

- (BOOL)hasSiriResolvedContact
{
  return self->_hasSiriResolvedContact;
}

- (BOOL)hasSiriInitiatedCall
{
  return self->_hasSiriInitiatedCall;
}

- (BOOL)hasUserMadeFollowupCallWithinDetectionWindow
{
  return self->_hasUserMadeFollowupCallWithinDetectionWindow;
}

- (BOOL)hasUserMadeFollowupCallWithinEvaluationWindow
{
  return self->_hasUserMadeFollowupCallWithinEvaluationWindow;
}

- (int)siriAndFollowupContactComparison
{
  return self->_siriAndFollowupContactComparison;
}

- (int)siriCallDuration
{
  return self->_siriCallDuration;
}

- (int)siriCallTimeToHangup
{
  return self->_siriCallTimeToHangup;
}

- (int)userTimeToFollowup
{
  return self->_userTimeToFollowup;
}

- (BOOL)isSameCallRouteForSiriAndFollowup
{
  return self->_isSameCallRouteForSiriAndFollowup;
}

- (BOOL)isSameCallCapabilityForFollowup
{
  return self->_isSameCallCapabilityForFollowup;
}

- (int)followupNameSimilarity
{
  return self->_followupNameSimilarity;
}

- (void)setHasOriginalPlusId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalPlusId, 0);
}

@end
