@implementation PeopleSuggesterCandidate

- (BOOL)hasPrivatizedIdentifier
{
  return self->_privatizedIdentifier != 0;
}

- (int)feedbackDeprecated
{
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    return self->_feedbackDeprecated;
  else
    return 0;
}

- (void)setFeedbackDeprecated:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_feedbackDeprecated = a3;
}

- (void)setHasFeedbackDeprecated:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasFeedbackDeprecated
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)feedbackDeprecatedAsString:(int)a3
{
  if (a3 < 5)
    return off_1E43FF8D0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsFeedbackDeprecated:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ABANDONED")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SUGGESTION_SELECTED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INTERACTED_WITH_AFTER_SHARE_DEPRECATED")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HANDLE_SELECTED_IN_APP_EXTENSION")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("HANDLE_SELECTED_IN_APP")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasPrivatizedTransportBundleId
{
  return self->_privatizedTransportBundleId != 0;
}

- (BOOL)hasTimeSinceLastOutgoingInteraction
{
  return self->_timeSinceLastOutgoingInteraction != 0;
}

- (BOOL)hasTimeSinceOutgoingInteractionNumber10
{
  return self->_timeSinceOutgoingInteractionNumber10 != 0;
}

- (BOOL)hasTimeSinceLastIncomingInteraction
{
  return self->_timeSinceLastIncomingInteraction != 0;
}

- (void)setDeprecatedField1:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_deprecatedField1 = a3;
}

- (void)setHasDeprecatedField1:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDeprecatedField1
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setDeprecatedField2:(double)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_deprecatedField2 = a3;
}

- (void)setHasDeprecatedField2:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDeprecatedField2
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setDeprecatedField3:(double)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_deprecatedField3 = a3;
}

- (void)setHasDeprecatedField3:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasDeprecatedField3
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasNumberOfSharesWithConversation
{
  return self->_numberOfSharesWithConversation != 0;
}

- (BOOL)hasNumberOfSharesFromCurrentAppWithConversation
{
  return self->_numberOfSharesFromCurrentAppWithConversation != 0;
}

- (BOOL)hasNumberOfSharesOfTopDomainURLWithConversation
{
  return self->_numberOfSharesOfTopDomainURLWithConversation != 0;
}

- (BOOL)hasNumberOfSharesOfDetectedPeopleWithConversation
{
  return self->_numberOfSharesOfDetectedPeopleWithConversation != 0;
}

- (BOOL)hasNumberOfSharesOfPeopleInPhotoWithConversation
{
  return self->_numberOfSharesOfPeopleInPhotoWithConversation != 0;
}

- (BOOL)hasNumberOfOutgoingInteractionsWithConversation
{
  return self->_numberOfOutgoingInteractionsWithConversation != 0;
}

- (BOOL)hasNumberOfIncomingInteractionsWithConversation
{
  return self->_numberOfIncomingInteractionsWithConversation != 0;
}

- (BOOL)hasNumberOfInteractionsDuringTimePeriodWithConversation
{
  return self->_numberOfInteractionsDuringTimePeriodWithConversation != 0;
}

- (BOOL)hasNumberOfEngagedSuggestionsWithConversation
{
  return self->_numberOfEngagedSuggestionsWithConversation != 0;
}

- (BOOL)hasNumberOfEngagedSuggestionsFromCurrentAppWithConversation
{
  return self->_numberOfEngagedSuggestionsFromCurrentAppWithConversation != 0;
}

- (BOOL)hasNumberOfEngagedSuggestionsOfTopDomainURLWithConversation
{
  return self->_numberOfEngagedSuggestionsOfTopDomainURLWithConversation != 0;
}

- (BOOL)hasNumberOfEngagedSuggestionsOfDetectedPeopleWithConversation
{
  return self->_numberOfEngagedSuggestionsOfDetectedPeopleWithConversation != 0;
}

- (BOOL)hasNumberOfEngagedSuggestionsOfPeopleInPhotoWithConversation
{
  return self->_numberOfEngagedSuggestionsOfPeopleInPhotoWithConversation != 0;
}

- (BOOL)hasHasEverSharePlayedWithConversation
{
  return self->_hasEverSharePlayedWithConversation != 0;
}

- (void)setSuggestedRank:(int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_suggestedRank = a3;
}

- (void)setHasSuggestedRank:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasSuggestedRank
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setCoreMLModelScore:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_coreMLModelScore = a3;
}

- (void)setHasCoreMLModelScore:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCoreMLModelScore
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setFoundInChunk:(int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_foundInChunk = a3;
}

- (void)setHasFoundInChunk:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasFoundInChunk
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setUpdatedInChunk:(int)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_updatedInChunk = a3;
}

- (void)setHasUpdatedInChunk:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (BOOL)hasUpdatedInChunk
{
  return *(_BYTE *)&self->_has >> 7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)PeopleSuggesterCandidate;
  -[PeopleSuggesterCandidate description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PeopleSuggesterCandidate dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *privatizedIdentifier;
  uint64_t feedbackDeprecated;
  __CFString *v7;
  NSString *privatizedTransportBundleId;
  PeopleSuggesterFeatureDouble *timeSinceLastOutgoingInteraction;
  void *v10;
  PeopleSuggesterFeatureDouble *timeSinceOutgoingInteractionNumber10;
  void *v12;
  PeopleSuggesterFeatureDouble *timeSinceLastIncomingInteraction;
  void *v14;
  char has;
  void *v16;
  PeopleSuggesterFeatureDouble *numberOfSharesWithConversation;
  void *v18;
  PeopleSuggesterFeatureDouble *numberOfSharesFromCurrentAppWithConversation;
  void *v20;
  PeopleSuggesterFeatureDouble *numberOfSharesOfTopDomainURLWithConversation;
  void *v22;
  PeopleSuggesterFeatureDouble *numberOfSharesOfDetectedPeopleWithConversation;
  void *v24;
  PeopleSuggesterFeatureDouble *numberOfSharesOfPeopleInPhotoWithConversation;
  void *v26;
  PeopleSuggesterFeatureDouble *numberOfOutgoingInteractionsWithConversation;
  void *v28;
  PeopleSuggesterFeatureDouble *numberOfIncomingInteractionsWithConversation;
  void *v30;
  PeopleSuggesterFeatureDouble *numberOfInteractionsDuringTimePeriodWithConversation;
  void *v32;
  PeopleSuggesterFeatureDouble *numberOfEngagedSuggestionsWithConversation;
  void *v34;
  PeopleSuggesterFeatureDouble *numberOfEngagedSuggestionsFromCurrentAppWithConversation;
  void *v36;
  PeopleSuggesterFeatureDouble *numberOfEngagedSuggestionsOfTopDomainURLWithConversation;
  void *v38;
  PeopleSuggesterFeatureDouble *numberOfEngagedSuggestionsOfDetectedPeopleWithConversation;
  void *v40;
  PeopleSuggesterFeatureDouble *numberOfEngagedSuggestionsOfPeopleInPhotoWithConversation;
  void *v42;
  PeopleSuggesterFeatureDouble *hasEverSharePlayedWithConversation;
  void *v44;
  char v45;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  privatizedIdentifier = self->_privatizedIdentifier;
  if (privatizedIdentifier)
    objc_msgSend(v3, "setObject:forKey:", privatizedIdentifier, CFSTR("privatizedIdentifier"));
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    feedbackDeprecated = self->_feedbackDeprecated;
    if (feedbackDeprecated >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_feedbackDeprecated);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E43FF8D0[feedbackDeprecated];
    }
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("feedback_deprecated"));

  }
  privatizedTransportBundleId = self->_privatizedTransportBundleId;
  if (privatizedTransportBundleId)
    objc_msgSend(v4, "setObject:forKey:", privatizedTransportBundleId, CFSTR("privatizedTransportBundleId"));
  timeSinceLastOutgoingInteraction = self->_timeSinceLastOutgoingInteraction;
  if (timeSinceLastOutgoingInteraction)
  {
    -[PeopleSuggesterFeatureDouble dictionaryRepresentation](timeSinceLastOutgoingInteraction, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("timeSinceLastOutgoingInteraction"));

  }
  timeSinceOutgoingInteractionNumber10 = self->_timeSinceOutgoingInteractionNumber10;
  if (timeSinceOutgoingInteractionNumber10)
  {
    -[PeopleSuggesterFeatureDouble dictionaryRepresentation](timeSinceOutgoingInteractionNumber10, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("timeSinceOutgoingInteractionNumber10"));

  }
  timeSinceLastIncomingInteraction = self->_timeSinceLastIncomingInteraction;
  if (timeSinceLastIncomingInteraction)
  {
    -[PeopleSuggesterFeatureDouble dictionaryRepresentation](timeSinceLastIncomingInteraction, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("timeSinceLastIncomingInteraction"));

  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_deprecatedField1);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v47, CFSTR("deprecated_field_1"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_18:
      if ((has & 8) == 0)
        goto LABEL_20;
      goto LABEL_19;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_deprecatedField2);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v48, CFSTR("deprecated_field_2"));

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_19:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_deprecatedField3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("deprecated_field_3"));

  }
LABEL_20:
  numberOfSharesWithConversation = self->_numberOfSharesWithConversation;
  if (numberOfSharesWithConversation)
  {
    -[PeopleSuggesterFeatureDouble dictionaryRepresentation](numberOfSharesWithConversation, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("numberOfSharesWithConversation"));

  }
  numberOfSharesFromCurrentAppWithConversation = self->_numberOfSharesFromCurrentAppWithConversation;
  if (numberOfSharesFromCurrentAppWithConversation)
  {
    -[PeopleSuggesterFeatureDouble dictionaryRepresentation](numberOfSharesFromCurrentAppWithConversation, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("numberOfSharesFromCurrentAppWithConversation"));

  }
  numberOfSharesOfTopDomainURLWithConversation = self->_numberOfSharesOfTopDomainURLWithConversation;
  if (numberOfSharesOfTopDomainURLWithConversation)
  {
    -[PeopleSuggesterFeatureDouble dictionaryRepresentation](numberOfSharesOfTopDomainURLWithConversation, "dictionaryRepresentation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("numberOfSharesOfTopDomainURLWithConversation"));

  }
  numberOfSharesOfDetectedPeopleWithConversation = self->_numberOfSharesOfDetectedPeopleWithConversation;
  if (numberOfSharesOfDetectedPeopleWithConversation)
  {
    -[PeopleSuggesterFeatureDouble dictionaryRepresentation](numberOfSharesOfDetectedPeopleWithConversation, "dictionaryRepresentation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("numberOfSharesOfDetectedPeopleWithConversation"));

  }
  numberOfSharesOfPeopleInPhotoWithConversation = self->_numberOfSharesOfPeopleInPhotoWithConversation;
  if (numberOfSharesOfPeopleInPhotoWithConversation)
  {
    -[PeopleSuggesterFeatureDouble dictionaryRepresentation](numberOfSharesOfPeopleInPhotoWithConversation, "dictionaryRepresentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v26, CFSTR("numberOfSharesOfPeopleInPhotoWithConversation"));

  }
  numberOfOutgoingInteractionsWithConversation = self->_numberOfOutgoingInteractionsWithConversation;
  if (numberOfOutgoingInteractionsWithConversation)
  {
    -[PeopleSuggesterFeatureDouble dictionaryRepresentation](numberOfOutgoingInteractionsWithConversation, "dictionaryRepresentation");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v28, CFSTR("numberOfOutgoingInteractionsWithConversation"));

  }
  numberOfIncomingInteractionsWithConversation = self->_numberOfIncomingInteractionsWithConversation;
  if (numberOfIncomingInteractionsWithConversation)
  {
    -[PeopleSuggesterFeatureDouble dictionaryRepresentation](numberOfIncomingInteractionsWithConversation, "dictionaryRepresentation");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v30, CFSTR("numberOfIncomingInteractionsWithConversation"));

  }
  numberOfInteractionsDuringTimePeriodWithConversation = self->_numberOfInteractionsDuringTimePeriodWithConversation;
  if (numberOfInteractionsDuringTimePeriodWithConversation)
  {
    -[PeopleSuggesterFeatureDouble dictionaryRepresentation](numberOfInteractionsDuringTimePeriodWithConversation, "dictionaryRepresentation");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v32, CFSTR("numberOfInteractionsDuringTimePeriodWithConversation"));

  }
  numberOfEngagedSuggestionsWithConversation = self->_numberOfEngagedSuggestionsWithConversation;
  if (numberOfEngagedSuggestionsWithConversation)
  {
    -[PeopleSuggesterFeatureDouble dictionaryRepresentation](numberOfEngagedSuggestionsWithConversation, "dictionaryRepresentation");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v34, CFSTR("numberOfEngagedSuggestionsWithConversation"));

  }
  numberOfEngagedSuggestionsFromCurrentAppWithConversation = self->_numberOfEngagedSuggestionsFromCurrentAppWithConversation;
  if (numberOfEngagedSuggestionsFromCurrentAppWithConversation)
  {
    -[PeopleSuggesterFeatureDouble dictionaryRepresentation](numberOfEngagedSuggestionsFromCurrentAppWithConversation, "dictionaryRepresentation");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v36, CFSTR("numberOfEngagedSuggestionsFromCurrentAppWithConversation"));

  }
  numberOfEngagedSuggestionsOfTopDomainURLWithConversation = self->_numberOfEngagedSuggestionsOfTopDomainURLWithConversation;
  if (numberOfEngagedSuggestionsOfTopDomainURLWithConversation)
  {
    -[PeopleSuggesterFeatureDouble dictionaryRepresentation](numberOfEngagedSuggestionsOfTopDomainURLWithConversation, "dictionaryRepresentation");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v38, CFSTR("numberOfEngagedSuggestionsOfTopDomainURLWithConversation"));

  }
  numberOfEngagedSuggestionsOfDetectedPeopleWithConversation = self->_numberOfEngagedSuggestionsOfDetectedPeopleWithConversation;
  if (numberOfEngagedSuggestionsOfDetectedPeopleWithConversation)
  {
    -[PeopleSuggesterFeatureDouble dictionaryRepresentation](numberOfEngagedSuggestionsOfDetectedPeopleWithConversation, "dictionaryRepresentation");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v40, CFSTR("numberOfEngagedSuggestionsOfDetectedPeopleWithConversation"));

  }
  numberOfEngagedSuggestionsOfPeopleInPhotoWithConversation = self->_numberOfEngagedSuggestionsOfPeopleInPhotoWithConversation;
  if (numberOfEngagedSuggestionsOfPeopleInPhotoWithConversation)
  {
    -[PeopleSuggesterFeatureDouble dictionaryRepresentation](numberOfEngagedSuggestionsOfPeopleInPhotoWithConversation, "dictionaryRepresentation");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v42, CFSTR("numberOfEngagedSuggestionsOfPeopleInPhotoWithConversation"));

  }
  hasEverSharePlayedWithConversation = self->_hasEverSharePlayedWithConversation;
  if (hasEverSharePlayedWithConversation)
  {
    -[PeopleSuggesterFeatureDouble dictionaryRepresentation](hasEverSharePlayedWithConversation, "dictionaryRepresentation");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v44, CFSTR("hasEverSharePlayedWithConversation"));

  }
  v45 = (char)self->_has;
  if ((v45 & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_suggestedRank);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v49, CFSTR("suggestedRank"));

    v45 = (char)self->_has;
    if ((v45 & 1) == 0)
    {
LABEL_50:
      if ((v45 & 0x20) == 0)
        goto LABEL_51;
LABEL_58:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_foundInChunk);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v51, CFSTR("foundInChunk"));

      if ((*(_BYTE *)&self->_has & 0x80) == 0)
        return v4;
LABEL_59:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_updatedInChunk);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v52, CFSTR("updatedInChunk"));

      return v4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_50;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_coreMLModelScore);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v50, CFSTR("coreMLModelScore"));

  v45 = (char)self->_has;
  if ((v45 & 0x20) != 0)
    goto LABEL_58;
LABEL_51:
  if (v45 < 0)
    goto LABEL_59;
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PeopleSuggesterCandidateReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  char v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (self->_privatizedIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v7;
  }
  if (self->_privatizedTransportBundleId)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if (self->_timeSinceLastOutgoingInteraction)
  {
    PBDataWriterWriteSubmessage();
    v4 = v7;
  }
  if (self->_timeSinceOutgoingInteractionNumber10)
  {
    PBDataWriterWriteSubmessage();
    v4 = v7;
  }
  if (self->_timeSinceLastIncomingInteraction)
  {
    PBDataWriterWriteSubmessage();
    v4 = v7;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v7;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_15:
      if ((has & 8) == 0)
        goto LABEL_17;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_15;
  }
  PBDataWriterWriteDoubleField();
  v4 = v7;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_16:
    PBDataWriterWriteDoubleField();
    v4 = v7;
  }
LABEL_17:
  if (self->_numberOfSharesWithConversation)
  {
    PBDataWriterWriteSubmessage();
    v4 = v7;
  }
  if (self->_numberOfSharesFromCurrentAppWithConversation)
  {
    PBDataWriterWriteSubmessage();
    v4 = v7;
  }
  if (self->_numberOfSharesOfTopDomainURLWithConversation)
  {
    PBDataWriterWriteSubmessage();
    v4 = v7;
  }
  if (self->_numberOfSharesOfDetectedPeopleWithConversation)
  {
    PBDataWriterWriteSubmessage();
    v4 = v7;
  }
  if (self->_numberOfSharesOfPeopleInPhotoWithConversation)
  {
    PBDataWriterWriteSubmessage();
    v4 = v7;
  }
  if (self->_numberOfOutgoingInteractionsWithConversation)
  {
    PBDataWriterWriteSubmessage();
    v4 = v7;
  }
  if (self->_numberOfIncomingInteractionsWithConversation)
  {
    PBDataWriterWriteSubmessage();
    v4 = v7;
  }
  if (self->_numberOfInteractionsDuringTimePeriodWithConversation)
  {
    PBDataWriterWriteSubmessage();
    v4 = v7;
  }
  if (self->_numberOfEngagedSuggestionsWithConversation)
  {
    PBDataWriterWriteSubmessage();
    v4 = v7;
  }
  if (self->_numberOfEngagedSuggestionsFromCurrentAppWithConversation)
  {
    PBDataWriterWriteSubmessage();
    v4 = v7;
  }
  if (self->_numberOfEngagedSuggestionsOfTopDomainURLWithConversation)
  {
    PBDataWriterWriteSubmessage();
    v4 = v7;
  }
  if (self->_numberOfEngagedSuggestionsOfDetectedPeopleWithConversation)
  {
    PBDataWriterWriteSubmessage();
    v4 = v7;
  }
  if (self->_numberOfEngagedSuggestionsOfPeopleInPhotoWithConversation)
  {
    PBDataWriterWriteSubmessage();
    v4 = v7;
  }
  if (self->_hasEverSharePlayedWithConversation)
  {
    PBDataWriterWriteSubmessage();
    v4 = v7;
  }
  v6 = (char)self->_has;
  if ((v6 & 0x40) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v7;
    v6 = (char)self->_has;
    if ((v6 & 1) == 0)
    {
LABEL_47:
      if ((v6 & 0x20) == 0)
        goto LABEL_48;
LABEL_55:
      PBDataWriterWriteInt32Field();
      v4 = v7;
      if ((*(_BYTE *)&self->_has & 0x80) == 0)
        goto LABEL_49;
LABEL_56:
      PBDataWriterWriteInt32Field();
      v4 = v7;
      goto LABEL_49;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_47;
  }
  PBDataWriterWriteDoubleField();
  v4 = v7;
  v6 = (char)self->_has;
  if ((v6 & 0x20) != 0)
    goto LABEL_55;
LABEL_48:
  if (v6 < 0)
    goto LABEL_56;
LABEL_49:

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  char v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (self->_privatizedIdentifier)
  {
    objc_msgSend(v4, "setPrivatizedIdentifier:");
    v4 = v7;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    *((_DWORD *)v4 + 10) = self->_feedbackDeprecated;
    *((_BYTE *)v4 + 212) |= 0x10u;
  }
  if (self->_privatizedTransportBundleId)
  {
    objc_msgSend(v7, "setPrivatizedTransportBundleId:");
    v4 = v7;
  }
  if (self->_timeSinceLastOutgoingInteraction)
  {
    objc_msgSend(v7, "setTimeSinceLastOutgoingInteraction:");
    v4 = v7;
  }
  if (self->_timeSinceOutgoingInteractionNumber10)
  {
    objc_msgSend(v7, "setTimeSinceOutgoingInteractionNumber10:");
    v4 = v7;
  }
  if (self->_timeSinceLastIncomingInteraction)
  {
    objc_msgSend(v7, "setTimeSinceLastIncomingInteraction:");
    v4 = v7;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_QWORD *)v4 + 2) = *(_QWORD *)&self->_deprecatedField1;
    *((_BYTE *)v4 + 212) |= 2u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_15:
      if ((has & 8) == 0)
        goto LABEL_17;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_15;
  }
  *((_QWORD *)v4 + 3) = *(_QWORD *)&self->_deprecatedField2;
  *((_BYTE *)v4 + 212) |= 4u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_16:
    *((_QWORD *)v4 + 4) = *(_QWORD *)&self->_deprecatedField3;
    *((_BYTE *)v4 + 212) |= 8u;
  }
LABEL_17:
  if (self->_numberOfSharesWithConversation)
  {
    objc_msgSend(v7, "setNumberOfSharesWithConversation:");
    v4 = v7;
  }
  if (self->_numberOfSharesFromCurrentAppWithConversation)
  {
    objc_msgSend(v7, "setNumberOfSharesFromCurrentAppWithConversation:");
    v4 = v7;
  }
  if (self->_numberOfSharesOfTopDomainURLWithConversation)
  {
    objc_msgSend(v7, "setNumberOfSharesOfTopDomainURLWithConversation:");
    v4 = v7;
  }
  if (self->_numberOfSharesOfDetectedPeopleWithConversation)
  {
    objc_msgSend(v7, "setNumberOfSharesOfDetectedPeopleWithConversation:");
    v4 = v7;
  }
  if (self->_numberOfSharesOfPeopleInPhotoWithConversation)
  {
    objc_msgSend(v7, "setNumberOfSharesOfPeopleInPhotoWithConversation:");
    v4 = v7;
  }
  if (self->_numberOfOutgoingInteractionsWithConversation)
  {
    objc_msgSend(v7, "setNumberOfOutgoingInteractionsWithConversation:");
    v4 = v7;
  }
  if (self->_numberOfIncomingInteractionsWithConversation)
  {
    objc_msgSend(v7, "setNumberOfIncomingInteractionsWithConversation:");
    v4 = v7;
  }
  if (self->_numberOfInteractionsDuringTimePeriodWithConversation)
  {
    objc_msgSend(v7, "setNumberOfInteractionsDuringTimePeriodWithConversation:");
    v4 = v7;
  }
  if (self->_numberOfEngagedSuggestionsWithConversation)
  {
    objc_msgSend(v7, "setNumberOfEngagedSuggestionsWithConversation:");
    v4 = v7;
  }
  if (self->_numberOfEngagedSuggestionsFromCurrentAppWithConversation)
  {
    objc_msgSend(v7, "setNumberOfEngagedSuggestionsFromCurrentAppWithConversation:");
    v4 = v7;
  }
  if (self->_numberOfEngagedSuggestionsOfTopDomainURLWithConversation)
  {
    objc_msgSend(v7, "setNumberOfEngagedSuggestionsOfTopDomainURLWithConversation:");
    v4 = v7;
  }
  if (self->_numberOfEngagedSuggestionsOfDetectedPeopleWithConversation)
  {
    objc_msgSend(v7, "setNumberOfEngagedSuggestionsOfDetectedPeopleWithConversation:");
    v4 = v7;
  }
  if (self->_numberOfEngagedSuggestionsOfPeopleInPhotoWithConversation)
  {
    objc_msgSend(v7, "setNumberOfEngagedSuggestionsOfPeopleInPhotoWithConversation:");
    v4 = v7;
  }
  if (self->_hasEverSharePlayedWithConversation)
  {
    objc_msgSend(v7, "setHasEverSharePlayedWithConversation:");
    v4 = v7;
  }
  v6 = (char)self->_has;
  if ((v6 & 0x40) != 0)
  {
    *((_DWORD *)v4 + 44) = self->_suggestedRank;
    *((_BYTE *)v4 + 212) |= 0x40u;
    v6 = (char)self->_has;
    if ((v6 & 1) == 0)
    {
LABEL_47:
      if ((v6 & 0x20) == 0)
        goto LABEL_48;
LABEL_55:
      *((_DWORD *)v4 + 11) = self->_foundInChunk;
      *((_BYTE *)v4 + 212) |= 0x20u;
      if ((*(_BYTE *)&self->_has & 0x80) == 0)
        goto LABEL_49;
LABEL_56:
      *((_DWORD *)v4 + 52) = self->_updatedInChunk;
      *((_BYTE *)v4 + 212) |= 0x80u;
      goto LABEL_49;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_47;
  }
  *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_coreMLModelScore;
  *((_BYTE *)v4 + 212) |= 1u;
  v6 = (char)self->_has;
  if ((v6 & 0x20) != 0)
    goto LABEL_55;
LABEL_48:
  if (v6 < 0)
    goto LABEL_56;
LABEL_49:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
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
  id v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  char v45;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_privatizedIdentifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 160);
  *(_QWORD *)(v5 + 160) = v6;

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_feedbackDeprecated;
    *(_BYTE *)(v5 + 212) |= 0x10u;
  }
  v8 = -[NSString copyWithZone:](self->_privatizedTransportBundleId, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 168);
  *(_QWORD *)(v5 + 168) = v8;

  v10 = -[PeopleSuggesterFeatureDouble copyWithZone:](self->_timeSinceLastOutgoingInteraction, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 192);
  *(_QWORD *)(v5 + 192) = v10;

  v12 = -[PeopleSuggesterFeatureDouble copyWithZone:](self->_timeSinceOutgoingInteractionNumber10, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 200);
  *(_QWORD *)(v5 + 200) = v12;

  v14 = -[PeopleSuggesterFeatureDouble copyWithZone:](self->_timeSinceLastIncomingInteraction, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 184);
  *(_QWORD *)(v5 + 184) = v14;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(double *)(v5 + 16) = self->_deprecatedField1;
    *(_BYTE *)(v5 + 212) |= 2u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 8) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  *(double *)(v5 + 24) = self->_deprecatedField2;
  *(_BYTE *)(v5 + 212) |= 4u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_6:
    *(double *)(v5 + 32) = self->_deprecatedField3;
    *(_BYTE *)(v5 + 212) |= 8u;
  }
LABEL_7:
  v17 = -[PeopleSuggesterFeatureDouble copyWithZone:](self->_numberOfSharesWithConversation, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 152);
  *(_QWORD *)(v5 + 152) = v17;

  v19 = -[PeopleSuggesterFeatureDouble copyWithZone:](self->_numberOfSharesFromCurrentAppWithConversation, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v19;

  v21 = -[PeopleSuggesterFeatureDouble copyWithZone:](self->_numberOfSharesOfTopDomainURLWithConversation, "copyWithZone:", a3);
  v22 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v21;

  v23 = -[PeopleSuggesterFeatureDouble copyWithZone:](self->_numberOfSharesOfDetectedPeopleWithConversation, "copyWithZone:", a3);
  v24 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v23;

  v25 = -[PeopleSuggesterFeatureDouble copyWithZone:](self->_numberOfSharesOfPeopleInPhotoWithConversation, "copyWithZone:", a3);
  v26 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v25;

  v27 = -[PeopleSuggesterFeatureDouble copyWithZone:](self->_numberOfOutgoingInteractionsWithConversation, "copyWithZone:", a3);
  v28 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v27;

  v29 = -[PeopleSuggesterFeatureDouble copyWithZone:](self->_numberOfIncomingInteractionsWithConversation, "copyWithZone:", a3);
  v30 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v29;

  v31 = -[PeopleSuggesterFeatureDouble copyWithZone:](self->_numberOfInteractionsDuringTimePeriodWithConversation, "copyWithZone:", a3);
  v32 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v31;

  v33 = -[PeopleSuggesterFeatureDouble copyWithZone:](self->_numberOfEngagedSuggestionsWithConversation, "copyWithZone:", a3);
  v34 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v33;

  v35 = -[PeopleSuggesterFeatureDouble copyWithZone:](self->_numberOfEngagedSuggestionsFromCurrentAppWithConversation, "copyWithZone:", a3);
  v36 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v35;

  v37 = -[PeopleSuggesterFeatureDouble copyWithZone:](self->_numberOfEngagedSuggestionsOfTopDomainURLWithConversation, "copyWithZone:", a3);
  v38 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v37;

  v39 = -[PeopleSuggesterFeatureDouble copyWithZone:](self->_numberOfEngagedSuggestionsOfDetectedPeopleWithConversation, "copyWithZone:", a3);
  v40 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v39;

  v41 = -[PeopleSuggesterFeatureDouble copyWithZone:](self->_numberOfEngagedSuggestionsOfPeopleInPhotoWithConversation, "copyWithZone:", a3);
  v42 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v41;

  v43 = -[PeopleSuggesterFeatureDouble copyWithZone:](self->_hasEverSharePlayedWithConversation, "copyWithZone:", a3);
  v44 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v43;

  v45 = (char)self->_has;
  if ((v45 & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 176) = self->_suggestedRank;
    *(_BYTE *)(v5 + 212) |= 0x40u;
    v45 = (char)self->_has;
    if ((v45 & 1) == 0)
    {
LABEL_9:
      if ((v45 & 0x20) == 0)
        goto LABEL_10;
LABEL_17:
      *(_DWORD *)(v5 + 44) = self->_foundInChunk;
      *(_BYTE *)(v5 + 212) |= 0x20u;
      if ((*(_BYTE *)&self->_has & 0x80) == 0)
        return (id)v5;
LABEL_18:
      *(_DWORD *)(v5 + 208) = self->_updatedInChunk;
      *(_BYTE *)(v5 + 212) |= 0x80u;
      return (id)v5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_9;
  }
  *(double *)(v5 + 8) = self->_coreMLModelScore;
  *(_BYTE *)(v5 + 212) |= 1u;
  v45 = (char)self->_has;
  if ((v45 & 0x20) != 0)
    goto LABEL_17;
LABEL_10:
  if (v45 < 0)
    goto LABEL_18;
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  char *v4;
  NSString *privatizedIdentifier;
  NSString *privatizedTransportBundleId;
  PeopleSuggesterFeatureDouble *timeSinceLastOutgoingInteraction;
  PeopleSuggesterFeatureDouble *timeSinceOutgoingInteractionNumber10;
  PeopleSuggesterFeatureDouble *timeSinceLastIncomingInteraction;
  PeopleSuggesterFeatureDouble *numberOfSharesWithConversation;
  PeopleSuggesterFeatureDouble *numberOfSharesFromCurrentAppWithConversation;
  PeopleSuggesterFeatureDouble *numberOfSharesOfTopDomainURLWithConversation;
  PeopleSuggesterFeatureDouble *numberOfSharesOfDetectedPeopleWithConversation;
  PeopleSuggesterFeatureDouble *numberOfSharesOfPeopleInPhotoWithConversation;
  PeopleSuggesterFeatureDouble *numberOfOutgoingInteractionsWithConversation;
  PeopleSuggesterFeatureDouble *numberOfIncomingInteractionsWithConversation;
  PeopleSuggesterFeatureDouble *numberOfInteractionsDuringTimePeriodWithConversation;
  PeopleSuggesterFeatureDouble *numberOfEngagedSuggestionsWithConversation;
  PeopleSuggesterFeatureDouble *numberOfEngagedSuggestionsFromCurrentAppWithConversation;
  PeopleSuggesterFeatureDouble *numberOfEngagedSuggestionsOfTopDomainURLWithConversation;
  PeopleSuggesterFeatureDouble *numberOfEngagedSuggestionsOfDetectedPeopleWithConversation;
  PeopleSuggesterFeatureDouble *numberOfEngagedSuggestionsOfPeopleInPhotoWithConversation;
  PeopleSuggesterFeatureDouble *hasEverSharePlayedWithConversation;
  BOOL v24;

  v4 = (char *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_80;
  privatizedIdentifier = self->_privatizedIdentifier;
  if ((unint64_t)privatizedIdentifier | *((_QWORD *)v4 + 20))
  {
    if (!-[NSString isEqual:](privatizedIdentifier, "isEqual:"))
      goto LABEL_80;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((v4[212] & 0x10) == 0 || self->_feedbackDeprecated != *((_DWORD *)v4 + 10))
      goto LABEL_80;
  }
  else if ((v4[212] & 0x10) != 0)
  {
LABEL_80:
    v24 = 0;
    goto LABEL_81;
  }
  privatizedTransportBundleId = self->_privatizedTransportBundleId;
  if ((unint64_t)privatizedTransportBundleId | *((_QWORD *)v4 + 21)
    && !-[NSString isEqual:](privatizedTransportBundleId, "isEqual:"))
  {
    goto LABEL_80;
  }
  timeSinceLastOutgoingInteraction = self->_timeSinceLastOutgoingInteraction;
  if ((unint64_t)timeSinceLastOutgoingInteraction | *((_QWORD *)v4 + 24))
  {
    if (!-[PeopleSuggesterFeatureDouble isEqual:](timeSinceLastOutgoingInteraction, "isEqual:"))
      goto LABEL_80;
  }
  timeSinceOutgoingInteractionNumber10 = self->_timeSinceOutgoingInteractionNumber10;
  if ((unint64_t)timeSinceOutgoingInteractionNumber10 | *((_QWORD *)v4 + 25))
  {
    if (!-[PeopleSuggesterFeatureDouble isEqual:](timeSinceOutgoingInteractionNumber10, "isEqual:"))
      goto LABEL_80;
  }
  timeSinceLastIncomingInteraction = self->_timeSinceLastIncomingInteraction;
  if ((unint64_t)timeSinceLastIncomingInteraction | *((_QWORD *)v4 + 23))
  {
    if (!-[PeopleSuggesterFeatureDouble isEqual:](timeSinceLastIncomingInteraction, "isEqual:"))
      goto LABEL_80;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((v4[212] & 2) == 0 || self->_deprecatedField1 != *((double *)v4 + 2))
      goto LABEL_80;
  }
  else if ((v4[212] & 2) != 0)
  {
    goto LABEL_80;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((v4[212] & 4) == 0 || self->_deprecatedField2 != *((double *)v4 + 3))
      goto LABEL_80;
  }
  else if ((v4[212] & 4) != 0)
  {
    goto LABEL_80;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((v4[212] & 8) == 0 || self->_deprecatedField3 != *((double *)v4 + 4))
      goto LABEL_80;
  }
  else if ((v4[212] & 8) != 0)
  {
    goto LABEL_80;
  }
  numberOfSharesWithConversation = self->_numberOfSharesWithConversation;
  if ((unint64_t)numberOfSharesWithConversation | *((_QWORD *)v4 + 19)
    && !-[PeopleSuggesterFeatureDouble isEqual:](numberOfSharesWithConversation, "isEqual:"))
  {
    goto LABEL_80;
  }
  numberOfSharesFromCurrentAppWithConversation = self->_numberOfSharesFromCurrentAppWithConversation;
  if ((unint64_t)numberOfSharesFromCurrentAppWithConversation | *((_QWORD *)v4 + 15))
  {
    if (!-[PeopleSuggesterFeatureDouble isEqual:](numberOfSharesFromCurrentAppWithConversation, "isEqual:"))
      goto LABEL_80;
  }
  numberOfSharesOfTopDomainURLWithConversation = self->_numberOfSharesOfTopDomainURLWithConversation;
  if ((unint64_t)numberOfSharesOfTopDomainURLWithConversation | *((_QWORD *)v4 + 18))
  {
    if (!-[PeopleSuggesterFeatureDouble isEqual:](numberOfSharesOfTopDomainURLWithConversation, "isEqual:"))
      goto LABEL_80;
  }
  numberOfSharesOfDetectedPeopleWithConversation = self->_numberOfSharesOfDetectedPeopleWithConversation;
  if ((unint64_t)numberOfSharesOfDetectedPeopleWithConversation | *((_QWORD *)v4 + 16))
  {
    if (!-[PeopleSuggesterFeatureDouble isEqual:](numberOfSharesOfDetectedPeopleWithConversation, "isEqual:"))
      goto LABEL_80;
  }
  numberOfSharesOfPeopleInPhotoWithConversation = self->_numberOfSharesOfPeopleInPhotoWithConversation;
  if ((unint64_t)numberOfSharesOfPeopleInPhotoWithConversation | *((_QWORD *)v4 + 17))
  {
    if (!-[PeopleSuggesterFeatureDouble isEqual:](numberOfSharesOfPeopleInPhotoWithConversation, "isEqual:"))
      goto LABEL_80;
  }
  numberOfOutgoingInteractionsWithConversation = self->_numberOfOutgoingInteractionsWithConversation;
  if ((unint64_t)numberOfOutgoingInteractionsWithConversation | *((_QWORD *)v4 + 14))
  {
    if (!-[PeopleSuggesterFeatureDouble isEqual:](numberOfOutgoingInteractionsWithConversation, "isEqual:"))
      goto LABEL_80;
  }
  numberOfIncomingInteractionsWithConversation = self->_numberOfIncomingInteractionsWithConversation;
  if ((unint64_t)numberOfIncomingInteractionsWithConversation | *((_QWORD *)v4 + 12))
  {
    if (!-[PeopleSuggesterFeatureDouble isEqual:](numberOfIncomingInteractionsWithConversation, "isEqual:"))
      goto LABEL_80;
  }
  numberOfInteractionsDuringTimePeriodWithConversation = self->_numberOfInteractionsDuringTimePeriodWithConversation;
  if ((unint64_t)numberOfInteractionsDuringTimePeriodWithConversation | *((_QWORD *)v4 + 13))
  {
    if (!-[PeopleSuggesterFeatureDouble isEqual:](numberOfInteractionsDuringTimePeriodWithConversation, "isEqual:"))
      goto LABEL_80;
  }
  numberOfEngagedSuggestionsWithConversation = self->_numberOfEngagedSuggestionsWithConversation;
  if ((unint64_t)numberOfEngagedSuggestionsWithConversation | *((_QWORD *)v4 + 11))
  {
    if (!-[PeopleSuggesterFeatureDouble isEqual:](numberOfEngagedSuggestionsWithConversation, "isEqual:"))
      goto LABEL_80;
  }
  numberOfEngagedSuggestionsFromCurrentAppWithConversation = self->_numberOfEngagedSuggestionsFromCurrentAppWithConversation;
  if ((unint64_t)numberOfEngagedSuggestionsFromCurrentAppWithConversation | *((_QWORD *)v4 + 7))
  {
    if (!-[PeopleSuggesterFeatureDouble isEqual:](numberOfEngagedSuggestionsFromCurrentAppWithConversation, "isEqual:"))
      goto LABEL_80;
  }
  numberOfEngagedSuggestionsOfTopDomainURLWithConversation = self->_numberOfEngagedSuggestionsOfTopDomainURLWithConversation;
  if ((unint64_t)numberOfEngagedSuggestionsOfTopDomainURLWithConversation | *((_QWORD *)v4 + 10))
  {
    if (!-[PeopleSuggesterFeatureDouble isEqual:](numberOfEngagedSuggestionsOfTopDomainURLWithConversation, "isEqual:"))
      goto LABEL_80;
  }
  numberOfEngagedSuggestionsOfDetectedPeopleWithConversation = self->_numberOfEngagedSuggestionsOfDetectedPeopleWithConversation;
  if ((unint64_t)numberOfEngagedSuggestionsOfDetectedPeopleWithConversation | *((_QWORD *)v4 + 8))
  {
    if (!-[PeopleSuggesterFeatureDouble isEqual:](numberOfEngagedSuggestionsOfDetectedPeopleWithConversation, "isEqual:"))goto LABEL_80;
  }
  numberOfEngagedSuggestionsOfPeopleInPhotoWithConversation = self->_numberOfEngagedSuggestionsOfPeopleInPhotoWithConversation;
  if ((unint64_t)numberOfEngagedSuggestionsOfPeopleInPhotoWithConversation | *((_QWORD *)v4 + 9))
  {
    if (!-[PeopleSuggesterFeatureDouble isEqual:](numberOfEngagedSuggestionsOfPeopleInPhotoWithConversation, "isEqual:"))goto LABEL_80;
  }
  hasEverSharePlayedWithConversation = self->_hasEverSharePlayedWithConversation;
  if ((unint64_t)hasEverSharePlayedWithConversation | *((_QWORD *)v4 + 6))
  {
    if (!-[PeopleSuggesterFeatureDouble isEqual:](hasEverSharePlayedWithConversation, "isEqual:"))
      goto LABEL_80;
  }
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    if ((v4[212] & 0x40) == 0 || self->_suggestedRank != *((_DWORD *)v4 + 44))
      goto LABEL_80;
  }
  else if ((v4[212] & 0x40) != 0)
  {
    goto LABEL_80;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[212] & 1) == 0 || self->_coreMLModelScore != *((double *)v4 + 1))
      goto LABEL_80;
  }
  else if ((v4[212] & 1) != 0)
  {
    goto LABEL_80;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((v4[212] & 0x20) == 0 || self->_foundInChunk != *((_DWORD *)v4 + 11))
      goto LABEL_80;
  }
  else if ((v4[212] & 0x20) != 0)
  {
    goto LABEL_80;
  }
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
  {
    if ((v4[212] & 0x80) == 0 || self->_updatedInChunk != *((_DWORD *)v4 + 52))
      goto LABEL_80;
    v24 = 1;
  }
  else
  {
    v24 = v4[212] >= 0;
  }
LABEL_81:

  return v24;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  double deprecatedField1;
  double v6;
  long double v7;
  double v8;
  double deprecatedField2;
  double v10;
  long double v11;
  double v12;
  unint64_t v13;
  double deprecatedField3;
  double v15;
  long double v16;
  double v17;
  double v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  uint64_t v29;
  double coreMLModelScore;
  double v31;
  long double v32;
  double v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  NSUInteger v51;
  uint64_t v52;
  NSUInteger v53;

  v53 = -[NSString hash](self->_privatizedIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    v52 = 2654435761 * self->_feedbackDeprecated;
  else
    v52 = 0;
  v51 = -[NSString hash](self->_privatizedTransportBundleId, "hash");
  v50 = -[PeopleSuggesterFeatureDouble hash](self->_timeSinceLastOutgoingInteraction, "hash");
  v49 = -[PeopleSuggesterFeatureDouble hash](self->_timeSinceOutgoingInteractionNumber10, "hash");
  v48 = -[PeopleSuggesterFeatureDouble hash](self->_timeSinceLastIncomingInteraction, "hash");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    deprecatedField1 = self->_deprecatedField1;
    v6 = -deprecatedField1;
    if (deprecatedField1 >= 0.0)
      v6 = self->_deprecatedField1;
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
  if ((has & 4) != 0)
  {
    deprecatedField2 = self->_deprecatedField2;
    v10 = -deprecatedField2;
    if (deprecatedField2 >= 0.0)
      v10 = self->_deprecatedField2;
    v11 = floor(v10 + 0.5);
    v12 = (v10 - v11) * 1.84467441e19;
    v13 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
    if (v12 >= 0.0)
    {
      if (v12 > 0.0)
        v13 += (unint64_t)v12;
    }
    else
    {
      v13 -= (unint64_t)fabs(v12);
    }
    v47 = v13;
  }
  else
  {
    v47 = 0;
  }
  if ((has & 8) != 0)
  {
    deprecatedField3 = self->_deprecatedField3;
    v15 = -deprecatedField3;
    if (deprecatedField3 >= 0.0)
      v15 = self->_deprecatedField3;
    v16 = floor(v15 + 0.5);
    v17 = (v15 - v16) * 1.84467441e19;
    v18 = fmod(v16, 1.84467441e19);
    v19 = 2654435761u * (unint64_t)v18;
    v20 = v19 + (unint64_t)v17;
    if (v17 <= 0.0)
      v20 = 2654435761u * (unint64_t)v18;
    v21 = v19 - (unint64_t)fabs(v17);
    if (v17 >= 0.0)
      v21 = v20;
    v46 = v21;
  }
  else
  {
    v46 = 0;
  }
  v45 = -[PeopleSuggesterFeatureDouble hash](self->_numberOfSharesWithConversation, "hash");
  v44 = -[PeopleSuggesterFeatureDouble hash](self->_numberOfSharesFromCurrentAppWithConversation, "hash");
  v43 = -[PeopleSuggesterFeatureDouble hash](self->_numberOfSharesOfTopDomainURLWithConversation, "hash");
  v42 = -[PeopleSuggesterFeatureDouble hash](self->_numberOfSharesOfDetectedPeopleWithConversation, "hash");
  v41 = -[PeopleSuggesterFeatureDouble hash](self->_numberOfSharesOfPeopleInPhotoWithConversation, "hash");
  v40 = -[PeopleSuggesterFeatureDouble hash](self->_numberOfOutgoingInteractionsWithConversation, "hash");
  v39 = -[PeopleSuggesterFeatureDouble hash](self->_numberOfIncomingInteractionsWithConversation, "hash");
  v38 = -[PeopleSuggesterFeatureDouble hash](self->_numberOfInteractionsDuringTimePeriodWithConversation, "hash");
  v22 = -[PeopleSuggesterFeatureDouble hash](self->_numberOfEngagedSuggestionsWithConversation, "hash");
  v23 = -[PeopleSuggesterFeatureDouble hash](self->_numberOfEngagedSuggestionsFromCurrentAppWithConversation, "hash");
  v24 = -[PeopleSuggesterFeatureDouble hash](self->_numberOfEngagedSuggestionsOfTopDomainURLWithConversation, "hash");
  v25 = -[PeopleSuggesterFeatureDouble hash](self->_numberOfEngagedSuggestionsOfDetectedPeopleWithConversation, "hash");
  v26 = -[PeopleSuggesterFeatureDouble hash](self->_numberOfEngagedSuggestionsOfPeopleInPhotoWithConversation, "hash");
  v27 = -[PeopleSuggesterFeatureDouble hash](self->_hasEverSharePlayedWithConversation, "hash");
  v28 = (char)self->_has;
  if ((v28 & 0x40) != 0)
  {
    v29 = 2654435761 * self->_suggestedRank;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_32;
LABEL_37:
    v34 = 0;
    goto LABEL_40;
  }
  v29 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_37;
LABEL_32:
  coreMLModelScore = self->_coreMLModelScore;
  v31 = -coreMLModelScore;
  if (coreMLModelScore >= 0.0)
    v31 = self->_coreMLModelScore;
  v32 = floor(v31 + 0.5);
  v33 = (v31 - v32) * 1.84467441e19;
  v34 = 2654435761u * (unint64_t)fmod(v32, 1.84467441e19);
  if (v33 >= 0.0)
  {
    if (v33 > 0.0)
      v34 += (unint64_t)v33;
  }
  else
  {
    v34 -= (unint64_t)fabs(v33);
  }
LABEL_40:
  if ((v28 & 0x20) != 0)
  {
    v35 = 2654435761 * self->_foundInChunk;
    if (v28 < 0)
      goto LABEL_42;
LABEL_44:
    v36 = 0;
    return v52 ^ v53 ^ v51 ^ v50 ^ v49 ^ v48 ^ v4 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v29 ^ v34 ^ v35 ^ v36;
  }
  v35 = 0;
  if ((v28 & 0x80) == 0)
    goto LABEL_44;
LABEL_42:
  v36 = 2654435761 * self->_updatedInChunk;
  return v52 ^ v53 ^ v51 ^ v50 ^ v49 ^ v48 ^ v4 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v29 ^ v34 ^ v35 ^ v36;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  PeopleSuggesterFeatureDouble *timeSinceLastOutgoingInteraction;
  uint64_t v6;
  PeopleSuggesterFeatureDouble *timeSinceOutgoingInteractionNumber10;
  uint64_t v8;
  PeopleSuggesterFeatureDouble *timeSinceLastIncomingInteraction;
  uint64_t v10;
  char v11;
  PeopleSuggesterFeatureDouble *numberOfSharesWithConversation;
  uint64_t v13;
  PeopleSuggesterFeatureDouble *numberOfSharesFromCurrentAppWithConversation;
  uint64_t v15;
  PeopleSuggesterFeatureDouble *numberOfSharesOfTopDomainURLWithConversation;
  uint64_t v17;
  PeopleSuggesterFeatureDouble *numberOfSharesOfDetectedPeopleWithConversation;
  uint64_t v19;
  PeopleSuggesterFeatureDouble *numberOfSharesOfPeopleInPhotoWithConversation;
  uint64_t v21;
  PeopleSuggesterFeatureDouble *numberOfOutgoingInteractionsWithConversation;
  uint64_t v23;
  PeopleSuggesterFeatureDouble *numberOfIncomingInteractionsWithConversation;
  uint64_t v25;
  PeopleSuggesterFeatureDouble *numberOfInteractionsDuringTimePeriodWithConversation;
  uint64_t v27;
  PeopleSuggesterFeatureDouble *numberOfEngagedSuggestionsWithConversation;
  uint64_t v29;
  PeopleSuggesterFeatureDouble *numberOfEngagedSuggestionsFromCurrentAppWithConversation;
  uint64_t v31;
  PeopleSuggesterFeatureDouble *numberOfEngagedSuggestionsOfTopDomainURLWithConversation;
  uint64_t v33;
  PeopleSuggesterFeatureDouble *numberOfEngagedSuggestionsOfDetectedPeopleWithConversation;
  uint64_t v35;
  PeopleSuggesterFeatureDouble *numberOfEngagedSuggestionsOfPeopleInPhotoWithConversation;
  uint64_t v37;
  PeopleSuggesterFeatureDouble *hasEverSharePlayedWithConversation;
  uint64_t v39;
  char v40;
  id v41;

  v4 = a3;
  v41 = v4;
  if (*((_QWORD *)v4 + 20))
  {
    -[PeopleSuggesterCandidate setPrivatizedIdentifier:](self, "setPrivatizedIdentifier:");
    v4 = v41;
  }
  if ((*((_BYTE *)v4 + 212) & 0x10) != 0)
  {
    self->_feedbackDeprecated = *((_DWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 0x10u;
  }
  if (*((_QWORD *)v4 + 21))
  {
    -[PeopleSuggesterCandidate setPrivatizedTransportBundleId:](self, "setPrivatizedTransportBundleId:");
    v4 = v41;
  }
  timeSinceLastOutgoingInteraction = self->_timeSinceLastOutgoingInteraction;
  v6 = *((_QWORD *)v4 + 24);
  if (timeSinceLastOutgoingInteraction)
  {
    if (!v6)
      goto LABEL_13;
    -[PeopleSuggesterFeatureDouble mergeFrom:](timeSinceLastOutgoingInteraction, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_13;
    -[PeopleSuggesterCandidate setTimeSinceLastOutgoingInteraction:](self, "setTimeSinceLastOutgoingInteraction:");
  }
  v4 = v41;
LABEL_13:
  timeSinceOutgoingInteractionNumber10 = self->_timeSinceOutgoingInteractionNumber10;
  v8 = *((_QWORD *)v4 + 25);
  if (timeSinceOutgoingInteractionNumber10)
  {
    if (!v8)
      goto LABEL_19;
    -[PeopleSuggesterFeatureDouble mergeFrom:](timeSinceOutgoingInteractionNumber10, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_19;
    -[PeopleSuggesterCandidate setTimeSinceOutgoingInteractionNumber10:](self, "setTimeSinceOutgoingInteractionNumber10:");
  }
  v4 = v41;
LABEL_19:
  timeSinceLastIncomingInteraction = self->_timeSinceLastIncomingInteraction;
  v10 = *((_QWORD *)v4 + 23);
  if (timeSinceLastIncomingInteraction)
  {
    if (!v10)
      goto LABEL_25;
    -[PeopleSuggesterFeatureDouble mergeFrom:](timeSinceLastIncomingInteraction, "mergeFrom:");
  }
  else
  {
    if (!v10)
      goto LABEL_25;
    -[PeopleSuggesterCandidate setTimeSinceLastIncomingInteraction:](self, "setTimeSinceLastIncomingInteraction:");
  }
  v4 = v41;
LABEL_25:
  v11 = *((_BYTE *)v4 + 212);
  if ((v11 & 2) != 0)
  {
    self->_deprecatedField1 = *((double *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v11 = *((_BYTE *)v4 + 212);
    if ((v11 & 4) == 0)
    {
LABEL_27:
      if ((v11 & 8) == 0)
        goto LABEL_29;
      goto LABEL_28;
    }
  }
  else if ((*((_BYTE *)v4 + 212) & 4) == 0)
  {
    goto LABEL_27;
  }
  self->_deprecatedField2 = *((double *)v4 + 3);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)v4 + 212) & 8) != 0)
  {
LABEL_28:
    self->_deprecatedField3 = *((double *)v4 + 4);
    *(_BYTE *)&self->_has |= 8u;
  }
LABEL_29:
  numberOfSharesWithConversation = self->_numberOfSharesWithConversation;
  v13 = *((_QWORD *)v4 + 19);
  if (numberOfSharesWithConversation)
  {
    if (!v13)
      goto LABEL_38;
    -[PeopleSuggesterFeatureDouble mergeFrom:](numberOfSharesWithConversation, "mergeFrom:");
  }
  else
  {
    if (!v13)
      goto LABEL_38;
    -[PeopleSuggesterCandidate setNumberOfSharesWithConversation:](self, "setNumberOfSharesWithConversation:");
  }
  v4 = v41;
LABEL_38:
  numberOfSharesFromCurrentAppWithConversation = self->_numberOfSharesFromCurrentAppWithConversation;
  v15 = *((_QWORD *)v4 + 15);
  if (numberOfSharesFromCurrentAppWithConversation)
  {
    if (!v15)
      goto LABEL_44;
    -[PeopleSuggesterFeatureDouble mergeFrom:](numberOfSharesFromCurrentAppWithConversation, "mergeFrom:");
  }
  else
  {
    if (!v15)
      goto LABEL_44;
    -[PeopleSuggesterCandidate setNumberOfSharesFromCurrentAppWithConversation:](self, "setNumberOfSharesFromCurrentAppWithConversation:");
  }
  v4 = v41;
LABEL_44:
  numberOfSharesOfTopDomainURLWithConversation = self->_numberOfSharesOfTopDomainURLWithConversation;
  v17 = *((_QWORD *)v4 + 18);
  if (numberOfSharesOfTopDomainURLWithConversation)
  {
    if (!v17)
      goto LABEL_50;
    -[PeopleSuggesterFeatureDouble mergeFrom:](numberOfSharesOfTopDomainURLWithConversation, "mergeFrom:");
  }
  else
  {
    if (!v17)
      goto LABEL_50;
    -[PeopleSuggesterCandidate setNumberOfSharesOfTopDomainURLWithConversation:](self, "setNumberOfSharesOfTopDomainURLWithConversation:");
  }
  v4 = v41;
LABEL_50:
  numberOfSharesOfDetectedPeopleWithConversation = self->_numberOfSharesOfDetectedPeopleWithConversation;
  v19 = *((_QWORD *)v4 + 16);
  if (numberOfSharesOfDetectedPeopleWithConversation)
  {
    if (!v19)
      goto LABEL_56;
    -[PeopleSuggesterFeatureDouble mergeFrom:](numberOfSharesOfDetectedPeopleWithConversation, "mergeFrom:");
  }
  else
  {
    if (!v19)
      goto LABEL_56;
    -[PeopleSuggesterCandidate setNumberOfSharesOfDetectedPeopleWithConversation:](self, "setNumberOfSharesOfDetectedPeopleWithConversation:");
  }
  v4 = v41;
LABEL_56:
  numberOfSharesOfPeopleInPhotoWithConversation = self->_numberOfSharesOfPeopleInPhotoWithConversation;
  v21 = *((_QWORD *)v4 + 17);
  if (numberOfSharesOfPeopleInPhotoWithConversation)
  {
    if (!v21)
      goto LABEL_62;
    -[PeopleSuggesterFeatureDouble mergeFrom:](numberOfSharesOfPeopleInPhotoWithConversation, "mergeFrom:");
  }
  else
  {
    if (!v21)
      goto LABEL_62;
    -[PeopleSuggesterCandidate setNumberOfSharesOfPeopleInPhotoWithConversation:](self, "setNumberOfSharesOfPeopleInPhotoWithConversation:");
  }
  v4 = v41;
LABEL_62:
  numberOfOutgoingInteractionsWithConversation = self->_numberOfOutgoingInteractionsWithConversation;
  v23 = *((_QWORD *)v4 + 14);
  if (numberOfOutgoingInteractionsWithConversation)
  {
    if (!v23)
      goto LABEL_68;
    -[PeopleSuggesterFeatureDouble mergeFrom:](numberOfOutgoingInteractionsWithConversation, "mergeFrom:");
  }
  else
  {
    if (!v23)
      goto LABEL_68;
    -[PeopleSuggesterCandidate setNumberOfOutgoingInteractionsWithConversation:](self, "setNumberOfOutgoingInteractionsWithConversation:");
  }
  v4 = v41;
LABEL_68:
  numberOfIncomingInteractionsWithConversation = self->_numberOfIncomingInteractionsWithConversation;
  v25 = *((_QWORD *)v4 + 12);
  if (numberOfIncomingInteractionsWithConversation)
  {
    if (!v25)
      goto LABEL_74;
    -[PeopleSuggesterFeatureDouble mergeFrom:](numberOfIncomingInteractionsWithConversation, "mergeFrom:");
  }
  else
  {
    if (!v25)
      goto LABEL_74;
    -[PeopleSuggesterCandidate setNumberOfIncomingInteractionsWithConversation:](self, "setNumberOfIncomingInteractionsWithConversation:");
  }
  v4 = v41;
LABEL_74:
  numberOfInteractionsDuringTimePeriodWithConversation = self->_numberOfInteractionsDuringTimePeriodWithConversation;
  v27 = *((_QWORD *)v4 + 13);
  if (numberOfInteractionsDuringTimePeriodWithConversation)
  {
    if (!v27)
      goto LABEL_80;
    -[PeopleSuggesterFeatureDouble mergeFrom:](numberOfInteractionsDuringTimePeriodWithConversation, "mergeFrom:");
  }
  else
  {
    if (!v27)
      goto LABEL_80;
    -[PeopleSuggesterCandidate setNumberOfInteractionsDuringTimePeriodWithConversation:](self, "setNumberOfInteractionsDuringTimePeriodWithConversation:");
  }
  v4 = v41;
LABEL_80:
  numberOfEngagedSuggestionsWithConversation = self->_numberOfEngagedSuggestionsWithConversation;
  v29 = *((_QWORD *)v4 + 11);
  if (numberOfEngagedSuggestionsWithConversation)
  {
    if (!v29)
      goto LABEL_86;
    -[PeopleSuggesterFeatureDouble mergeFrom:](numberOfEngagedSuggestionsWithConversation, "mergeFrom:");
  }
  else
  {
    if (!v29)
      goto LABEL_86;
    -[PeopleSuggesterCandidate setNumberOfEngagedSuggestionsWithConversation:](self, "setNumberOfEngagedSuggestionsWithConversation:");
  }
  v4 = v41;
LABEL_86:
  numberOfEngagedSuggestionsFromCurrentAppWithConversation = self->_numberOfEngagedSuggestionsFromCurrentAppWithConversation;
  v31 = *((_QWORD *)v4 + 7);
  if (numberOfEngagedSuggestionsFromCurrentAppWithConversation)
  {
    if (!v31)
      goto LABEL_92;
    -[PeopleSuggesterFeatureDouble mergeFrom:](numberOfEngagedSuggestionsFromCurrentAppWithConversation, "mergeFrom:");
  }
  else
  {
    if (!v31)
      goto LABEL_92;
    -[PeopleSuggesterCandidate setNumberOfEngagedSuggestionsFromCurrentAppWithConversation:](self, "setNumberOfEngagedSuggestionsFromCurrentAppWithConversation:");
  }
  v4 = v41;
LABEL_92:
  numberOfEngagedSuggestionsOfTopDomainURLWithConversation = self->_numberOfEngagedSuggestionsOfTopDomainURLWithConversation;
  v33 = *((_QWORD *)v4 + 10);
  if (numberOfEngagedSuggestionsOfTopDomainURLWithConversation)
  {
    if (!v33)
      goto LABEL_98;
    -[PeopleSuggesterFeatureDouble mergeFrom:](numberOfEngagedSuggestionsOfTopDomainURLWithConversation, "mergeFrom:");
  }
  else
  {
    if (!v33)
      goto LABEL_98;
    -[PeopleSuggesterCandidate setNumberOfEngagedSuggestionsOfTopDomainURLWithConversation:](self, "setNumberOfEngagedSuggestionsOfTopDomainURLWithConversation:");
  }
  v4 = v41;
LABEL_98:
  numberOfEngagedSuggestionsOfDetectedPeopleWithConversation = self->_numberOfEngagedSuggestionsOfDetectedPeopleWithConversation;
  v35 = *((_QWORD *)v4 + 8);
  if (numberOfEngagedSuggestionsOfDetectedPeopleWithConversation)
  {
    if (!v35)
      goto LABEL_104;
    -[PeopleSuggesterFeatureDouble mergeFrom:](numberOfEngagedSuggestionsOfDetectedPeopleWithConversation, "mergeFrom:");
  }
  else
  {
    if (!v35)
      goto LABEL_104;
    -[PeopleSuggesterCandidate setNumberOfEngagedSuggestionsOfDetectedPeopleWithConversation:](self, "setNumberOfEngagedSuggestionsOfDetectedPeopleWithConversation:");
  }
  v4 = v41;
LABEL_104:
  numberOfEngagedSuggestionsOfPeopleInPhotoWithConversation = self->_numberOfEngagedSuggestionsOfPeopleInPhotoWithConversation;
  v37 = *((_QWORD *)v4 + 9);
  if (numberOfEngagedSuggestionsOfPeopleInPhotoWithConversation)
  {
    if (!v37)
      goto LABEL_110;
    -[PeopleSuggesterFeatureDouble mergeFrom:](numberOfEngagedSuggestionsOfPeopleInPhotoWithConversation, "mergeFrom:");
  }
  else
  {
    if (!v37)
      goto LABEL_110;
    -[PeopleSuggesterCandidate setNumberOfEngagedSuggestionsOfPeopleInPhotoWithConversation:](self, "setNumberOfEngagedSuggestionsOfPeopleInPhotoWithConversation:");
  }
  v4 = v41;
LABEL_110:
  hasEverSharePlayedWithConversation = self->_hasEverSharePlayedWithConversation;
  v39 = *((_QWORD *)v4 + 6);
  if (hasEverSharePlayedWithConversation)
  {
    if (!v39)
      goto LABEL_116;
    -[PeopleSuggesterFeatureDouble mergeFrom:](hasEverSharePlayedWithConversation, "mergeFrom:");
  }
  else
  {
    if (!v39)
      goto LABEL_116;
    -[PeopleSuggesterCandidate setHasEverSharePlayedWithConversation:](self, "setHasEverSharePlayedWithConversation:");
  }
  v4 = v41;
LABEL_116:
  v40 = *((_BYTE *)v4 + 212);
  if ((v40 & 0x40) != 0)
  {
    self->_suggestedRank = *((_DWORD *)v4 + 44);
    *(_BYTE *)&self->_has |= 0x40u;
    v40 = *((_BYTE *)v4 + 212);
    if ((v40 & 1) == 0)
    {
LABEL_118:
      if ((v40 & 0x20) == 0)
        goto LABEL_119;
LABEL_123:
      self->_foundInChunk = *((_DWORD *)v4 + 11);
      *(_BYTE *)&self->_has |= 0x20u;
      if ((*((_BYTE *)v4 + 212) & 0x80) == 0)
        goto LABEL_120;
LABEL_124:
      self->_updatedInChunk = *((_DWORD *)v4 + 52);
      *(_BYTE *)&self->_has |= 0x80u;
      goto LABEL_120;
    }
  }
  else if ((*((_BYTE *)v4 + 212) & 1) == 0)
  {
    goto LABEL_118;
  }
  self->_coreMLModelScore = *((double *)v4 + 1);
  *(_BYTE *)&self->_has |= 1u;
  v40 = *((_BYTE *)v4 + 212);
  if ((v40 & 0x20) != 0)
    goto LABEL_123;
LABEL_119:
  if (v40 < 0)
    goto LABEL_124;
LABEL_120:

}

- (NSString)privatizedIdentifier
{
  return self->_privatizedIdentifier;
}

- (void)setPrivatizedIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_privatizedIdentifier, a3);
}

- (NSString)privatizedTransportBundleId
{
  return self->_privatizedTransportBundleId;
}

- (void)setPrivatizedTransportBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_privatizedTransportBundleId, a3);
}

- (PeopleSuggesterFeatureDouble)timeSinceLastOutgoingInteraction
{
  return self->_timeSinceLastOutgoingInteraction;
}

- (void)setTimeSinceLastOutgoingInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_timeSinceLastOutgoingInteraction, a3);
}

- (PeopleSuggesterFeatureDouble)timeSinceOutgoingInteractionNumber10
{
  return self->_timeSinceOutgoingInteractionNumber10;
}

- (void)setTimeSinceOutgoingInteractionNumber10:(id)a3
{
  objc_storeStrong((id *)&self->_timeSinceOutgoingInteractionNumber10, a3);
}

- (PeopleSuggesterFeatureDouble)timeSinceLastIncomingInteraction
{
  return self->_timeSinceLastIncomingInteraction;
}

- (void)setTimeSinceLastIncomingInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_timeSinceLastIncomingInteraction, a3);
}

- (double)deprecatedField1
{
  return self->_deprecatedField1;
}

- (double)deprecatedField2
{
  return self->_deprecatedField2;
}

- (double)deprecatedField3
{
  return self->_deprecatedField3;
}

- (PeopleSuggesterFeatureDouble)numberOfSharesWithConversation
{
  return self->_numberOfSharesWithConversation;
}

- (void)setNumberOfSharesWithConversation:(id)a3
{
  objc_storeStrong((id *)&self->_numberOfSharesWithConversation, a3);
}

- (PeopleSuggesterFeatureDouble)numberOfSharesFromCurrentAppWithConversation
{
  return self->_numberOfSharesFromCurrentAppWithConversation;
}

- (void)setNumberOfSharesFromCurrentAppWithConversation:(id)a3
{
  objc_storeStrong((id *)&self->_numberOfSharesFromCurrentAppWithConversation, a3);
}

- (PeopleSuggesterFeatureDouble)numberOfSharesOfTopDomainURLWithConversation
{
  return self->_numberOfSharesOfTopDomainURLWithConversation;
}

- (void)setNumberOfSharesOfTopDomainURLWithConversation:(id)a3
{
  objc_storeStrong((id *)&self->_numberOfSharesOfTopDomainURLWithConversation, a3);
}

- (PeopleSuggesterFeatureDouble)numberOfSharesOfDetectedPeopleWithConversation
{
  return self->_numberOfSharesOfDetectedPeopleWithConversation;
}

- (void)setNumberOfSharesOfDetectedPeopleWithConversation:(id)a3
{
  objc_storeStrong((id *)&self->_numberOfSharesOfDetectedPeopleWithConversation, a3);
}

- (PeopleSuggesterFeatureDouble)numberOfSharesOfPeopleInPhotoWithConversation
{
  return self->_numberOfSharesOfPeopleInPhotoWithConversation;
}

- (void)setNumberOfSharesOfPeopleInPhotoWithConversation:(id)a3
{
  objc_storeStrong((id *)&self->_numberOfSharesOfPeopleInPhotoWithConversation, a3);
}

- (PeopleSuggesterFeatureDouble)numberOfOutgoingInteractionsWithConversation
{
  return self->_numberOfOutgoingInteractionsWithConversation;
}

- (void)setNumberOfOutgoingInteractionsWithConversation:(id)a3
{
  objc_storeStrong((id *)&self->_numberOfOutgoingInteractionsWithConversation, a3);
}

- (PeopleSuggesterFeatureDouble)numberOfIncomingInteractionsWithConversation
{
  return self->_numberOfIncomingInteractionsWithConversation;
}

- (void)setNumberOfIncomingInteractionsWithConversation:(id)a3
{
  objc_storeStrong((id *)&self->_numberOfIncomingInteractionsWithConversation, a3);
}

- (PeopleSuggesterFeatureDouble)numberOfInteractionsDuringTimePeriodWithConversation
{
  return self->_numberOfInteractionsDuringTimePeriodWithConversation;
}

- (void)setNumberOfInteractionsDuringTimePeriodWithConversation:(id)a3
{
  objc_storeStrong((id *)&self->_numberOfInteractionsDuringTimePeriodWithConversation, a3);
}

- (PeopleSuggesterFeatureDouble)numberOfEngagedSuggestionsWithConversation
{
  return self->_numberOfEngagedSuggestionsWithConversation;
}

- (void)setNumberOfEngagedSuggestionsWithConversation:(id)a3
{
  objc_storeStrong((id *)&self->_numberOfEngagedSuggestionsWithConversation, a3);
}

- (PeopleSuggesterFeatureDouble)numberOfEngagedSuggestionsFromCurrentAppWithConversation
{
  return self->_numberOfEngagedSuggestionsFromCurrentAppWithConversation;
}

- (void)setNumberOfEngagedSuggestionsFromCurrentAppWithConversation:(id)a3
{
  objc_storeStrong((id *)&self->_numberOfEngagedSuggestionsFromCurrentAppWithConversation, a3);
}

- (PeopleSuggesterFeatureDouble)numberOfEngagedSuggestionsOfTopDomainURLWithConversation
{
  return self->_numberOfEngagedSuggestionsOfTopDomainURLWithConversation;
}

- (void)setNumberOfEngagedSuggestionsOfTopDomainURLWithConversation:(id)a3
{
  objc_storeStrong((id *)&self->_numberOfEngagedSuggestionsOfTopDomainURLWithConversation, a3);
}

- (PeopleSuggesterFeatureDouble)numberOfEngagedSuggestionsOfDetectedPeopleWithConversation
{
  return self->_numberOfEngagedSuggestionsOfDetectedPeopleWithConversation;
}

- (void)setNumberOfEngagedSuggestionsOfDetectedPeopleWithConversation:(id)a3
{
  objc_storeStrong((id *)&self->_numberOfEngagedSuggestionsOfDetectedPeopleWithConversation, a3);
}

- (PeopleSuggesterFeatureDouble)numberOfEngagedSuggestionsOfPeopleInPhotoWithConversation
{
  return self->_numberOfEngagedSuggestionsOfPeopleInPhotoWithConversation;
}

- (void)setNumberOfEngagedSuggestionsOfPeopleInPhotoWithConversation:(id)a3
{
  objc_storeStrong((id *)&self->_numberOfEngagedSuggestionsOfPeopleInPhotoWithConversation, a3);
}

- (PeopleSuggesterFeatureDouble)hasEverSharePlayedWithConversation
{
  return self->_hasEverSharePlayedWithConversation;
}

- (void)setHasEverSharePlayedWithConversation:(id)a3
{
  objc_storeStrong((id *)&self->_hasEverSharePlayedWithConversation, a3);
}

- (int)suggestedRank
{
  return self->_suggestedRank;
}

- (double)coreMLModelScore
{
  return self->_coreMLModelScore;
}

- (int)foundInChunk
{
  return self->_foundInChunk;
}

- (int)updatedInChunk
{
  return self->_updatedInChunk;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeSinceOutgoingInteractionNumber10, 0);
  objc_storeStrong((id *)&self->_timeSinceLastOutgoingInteraction, 0);
  objc_storeStrong((id *)&self->_timeSinceLastIncomingInteraction, 0);
  objc_storeStrong((id *)&self->_privatizedTransportBundleId, 0);
  objc_storeStrong((id *)&self->_privatizedIdentifier, 0);
  objc_storeStrong((id *)&self->_numberOfSharesWithConversation, 0);
  objc_storeStrong((id *)&self->_numberOfSharesOfTopDomainURLWithConversation, 0);
  objc_storeStrong((id *)&self->_numberOfSharesOfPeopleInPhotoWithConversation, 0);
  objc_storeStrong((id *)&self->_numberOfSharesOfDetectedPeopleWithConversation, 0);
  objc_storeStrong((id *)&self->_numberOfSharesFromCurrentAppWithConversation, 0);
  objc_storeStrong((id *)&self->_numberOfOutgoingInteractionsWithConversation, 0);
  objc_storeStrong((id *)&self->_numberOfInteractionsDuringTimePeriodWithConversation, 0);
  objc_storeStrong((id *)&self->_numberOfIncomingInteractionsWithConversation, 0);
  objc_storeStrong((id *)&self->_numberOfEngagedSuggestionsWithConversation, 0);
  objc_storeStrong((id *)&self->_numberOfEngagedSuggestionsOfTopDomainURLWithConversation, 0);
  objc_storeStrong((id *)&self->_numberOfEngagedSuggestionsOfPeopleInPhotoWithConversation, 0);
  objc_storeStrong((id *)&self->_numberOfEngagedSuggestionsOfDetectedPeopleWithConversation, 0);
  objc_storeStrong((id *)&self->_numberOfEngagedSuggestionsFromCurrentAppWithConversation, 0);
  objc_storeStrong((id *)&self->_hasEverSharePlayedWithConversation, 0);
}

@end
