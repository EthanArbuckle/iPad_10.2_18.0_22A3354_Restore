@implementation CDASchemaCDAUserFeedbackCompleted

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
  v9.super_class = (Class)CDASchemaCDAUserFeedbackCompleted;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDASchemaCDAUserFeedbackCompleted expectedWinnerSiriSpeechId](self, "expectedWinnerSiriSpeechId", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[CDASchemaCDAUserFeedbackCompleted deleteExpectedWinnerSiriSpeechId](self, "deleteExpectedWinnerSiriSpeechId");
  return v5;
}

- (BOOL)hasSurveyId
{
  return self->_surveyId != 0;
}

- (void)deleteSurveyId
{
  -[CDASchemaCDAUserFeedbackCompleted setSurveyId:](self, "setSurveyId:", 0);
}

- (void)setUserFeedbackStatus:(int)a3
{
  *(&self->_hasResponseFromMultipleDevices + 1) |= 1u;
  self->_userFeedbackStatus = a3;
}

- (BOOL)hasUserFeedbackStatus
{
  return *(&self->_hasResponseFromMultipleDevices + 1);
}

- (void)setHasUserFeedbackStatus:(BOOL)a3
{
  *(&self->_hasResponseFromMultipleDevices + 1) = *(&self->_hasResponseFromMultipleDevices + 1) & 0xFE | a3;
}

- (void)deleteUserFeedbackStatus
{
  -[CDASchemaCDAUserFeedbackCompleted setUserFeedbackStatus:](self, "setUserFeedbackStatus:", 0);
  *(&self->_hasResponseFromMultipleDevices + 1) &= ~1u;
}

- (void)setIsCorrectDeviceSelected:(BOOL)a3
{
  *(&self->_hasResponseFromMultipleDevices + 1) |= 2u;
  self->_isCorrectDeviceSelected = a3;
}

- (BOOL)hasIsCorrectDeviceSelected
{
  return (*((unsigned __int8 *)&self->_hasResponseFromMultipleDevices + 1) >> 1) & 1;
}

- (void)setHasIsCorrectDeviceSelected:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(&self->_hasResponseFromMultipleDevices + 1) = *(&self->_hasResponseFromMultipleDevices + 1) & 0xFD | v3;
}

- (void)deleteIsCorrectDeviceSelected
{
  -[CDASchemaCDAUserFeedbackCompleted setIsCorrectDeviceSelected:](self, "setIsCorrectDeviceSelected:", 0);
  *(&self->_hasResponseFromMultipleDevices + 1) &= ~2u;
}

- (BOOL)hasExpectedWinnerSiriSpeechId
{
  return self->_expectedWinnerSiriSpeechId != 0;
}

- (void)deleteExpectedWinnerSiriSpeechId
{
  -[CDASchemaCDAUserFeedbackCompleted setExpectedWinnerSiriSpeechId:](self, "setExpectedWinnerSiriSpeechId:", 0);
}

- (BOOL)hasFailureReasonCategory
{
  return self->_failureReasonCategory != 0;
}

- (void)deleteFailureReasonCategory
{
  -[CDASchemaCDAUserFeedbackCompleted setFailureReasonCategory:](self, "setFailureReasonCategory:", 0);
}

- (void)setUserReportedResponseDeviceDistance:(double)a3
{
  *(&self->_hasResponseFromMultipleDevices + 1) |= 4u;
  self->_userReportedResponseDeviceDistance = a3;
}

- (BOOL)hasUserReportedResponseDeviceDistance
{
  return (*((unsigned __int8 *)&self->_hasResponseFromMultipleDevices + 1) >> 2) & 1;
}

- (void)setHasUserReportedResponseDeviceDistance:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(&self->_hasResponseFromMultipleDevices + 1) = *(&self->_hasResponseFromMultipleDevices + 1) & 0xFB | v3;
}

- (void)deleteUserReportedResponseDeviceDistance
{
  -[CDASchemaCDAUserFeedbackCompleted setUserReportedResponseDeviceDistance:](self, "setUserReportedResponseDeviceDistance:", 0.0);
  *(&self->_hasResponseFromMultipleDevices + 1) &= ~4u;
}

- (void)setDataCollectionGroup:(int)a3
{
  *(&self->_hasResponseFromMultipleDevices + 1) |= 8u;
  self->_dataCollectionGroup = a3;
}

- (BOOL)hasDataCollectionGroup
{
  return (*((unsigned __int8 *)&self->_hasResponseFromMultipleDevices + 1) >> 3) & 1;
}

- (void)setHasDataCollectionGroup:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(&self->_hasResponseFromMultipleDevices + 1) = *(&self->_hasResponseFromMultipleDevices + 1) & 0xF7 | v3;
}

- (void)deleteDataCollectionGroup
{
  -[CDASchemaCDAUserFeedbackCompleted setDataCollectionGroup:](self, "setDataCollectionGroup:", 0);
  *(&self->_hasResponseFromMultipleDevices + 1) &= ~8u;
}

- (BOOL)hasExperimentId
{
  return self->_experimentId != 0;
}

- (void)deleteExperimentId
{
  -[CDASchemaCDAUserFeedbackCompleted setExperimentId:](self, "setExperimentId:", 0);
}

- (void)setHasResponseFromMultipleDevices:(BOOL)a3
{
  *(&self->_hasResponseFromMultipleDevices + 1) |= 0x10u;
  self->_hasResponseFromMultipleDevices = a3;
}

- (BOOL)hasHasResponseFromMultipleDevices
{
  return (*((unsigned __int8 *)&self->_hasResponseFromMultipleDevices + 1) >> 4) & 1;
}

- (void)setHasHasResponseFromMultipleDevices:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(&self->_hasResponseFromMultipleDevices + 1) = *(&self->_hasResponseFromMultipleDevices + 1) & 0xEF | v3;
}

- (void)deleteHasResponseFromMultipleDevices
{
  -[CDASchemaCDAUserFeedbackCompleted setHasResponseFromMultipleDevices:](self, "setHasResponseFromMultipleDevices:", 0);
  *(&self->_hasResponseFromMultipleDevices + 1) &= ~0x10u;
}

- (BOOL)readFrom:(id)a3
{
  return CDASchemaCDAUserFeedbackCompletedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[CDASchemaCDAUserFeedbackCompleted surveyId](self, "surveyId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  v5 = *(&self->_hasResponseFromMultipleDevices + 1);
  if ((v5 & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v5 = *(&self->_hasResponseFromMultipleDevices + 1);
  }
  if ((v5 & 2) != 0)
    PBDataWriterWriteBOOLField();
  -[CDASchemaCDAUserFeedbackCompleted expectedWinnerSiriSpeechId](self, "expectedWinnerSiriSpeechId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CDASchemaCDAUserFeedbackCompleted expectedWinnerSiriSpeechId](self, "expectedWinnerSiriSpeechId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CDASchemaCDAUserFeedbackCompleted failureReasonCategory](self, "failureReasonCategory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    PBDataWriterWriteStringField();
  v9 = *(&self->_hasResponseFromMultipleDevices + 1);
  if ((v9 & 4) != 0)
  {
    PBDataWriterWriteDoubleField();
    v9 = *(&self->_hasResponseFromMultipleDevices + 1);
  }
  if ((v9 & 8) != 0)
    PBDataWriterWriteInt32Field();
  -[CDASchemaCDAUserFeedbackCompleted experimentId](self, "experimentId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    PBDataWriterWriteStringField();
  v11 = v12;
  if ((*(&self->_hasResponseFromMultipleDevices + 1) & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    v11 = v12;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  unsigned int v12;
  unsigned int v13;
  int userFeedbackStatus;
  int v15;
  int isCorrectDeviceSelected;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  unsigned int v27;
  int v28;
  unsigned int v29;
  double userReportedResponseDeviceDistance;
  double v31;
  int v32;
  int dataCollectionGroup;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  BOOL v39;
  int v41;
  int hasResponseFromMultipleDevices;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_36;
  -[CDASchemaCDAUserFeedbackCompleted surveyId](self, "surveyId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "surveyId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_35;
  -[CDASchemaCDAUserFeedbackCompleted surveyId](self, "surveyId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[CDASchemaCDAUserFeedbackCompleted surveyId](self, "surveyId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "surveyId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_36;
  }
  else
  {

  }
  v12 = *((unsigned __int8 *)&self->_hasResponseFromMultipleDevices + 1);
  v13 = v4[65];
  if ((v12 & 1) != (v13 & 1))
    goto LABEL_36;
  if ((v12 & 1) != 0)
  {
    userFeedbackStatus = self->_userFeedbackStatus;
    if (userFeedbackStatus != objc_msgSend(v4, "userFeedbackStatus"))
      goto LABEL_36;
    v12 = *((unsigned __int8 *)&self->_hasResponseFromMultipleDevices + 1);
    v13 = v4[65];
  }
  v15 = (v12 >> 1) & 1;
  if (v15 != ((v13 >> 1) & 1))
    goto LABEL_36;
  if (v15)
  {
    isCorrectDeviceSelected = self->_isCorrectDeviceSelected;
    if (isCorrectDeviceSelected != objc_msgSend(v4, "isCorrectDeviceSelected"))
      goto LABEL_36;
  }
  -[CDASchemaCDAUserFeedbackCompleted expectedWinnerSiriSpeechId](self, "expectedWinnerSiriSpeechId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "expectedWinnerSiriSpeechId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_35;
  -[CDASchemaCDAUserFeedbackCompleted expectedWinnerSiriSpeechId](self, "expectedWinnerSiriSpeechId");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[CDASchemaCDAUserFeedbackCompleted expectedWinnerSiriSpeechId](self, "expectedWinnerSiriSpeechId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "expectedWinnerSiriSpeechId");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_36;
  }
  else
  {

  }
  -[CDASchemaCDAUserFeedbackCompleted failureReasonCategory](self, "failureReasonCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "failureReasonCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_35;
  -[CDASchemaCDAUserFeedbackCompleted failureReasonCategory](self, "failureReasonCategory");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[CDASchemaCDAUserFeedbackCompleted failureReasonCategory](self, "failureReasonCategory");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failureReasonCategory");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_36;
  }
  else
  {

  }
  v27 = *((unsigned __int8 *)&self->_hasResponseFromMultipleDevices + 1);
  v28 = (v27 >> 2) & 1;
  v29 = v4[65];
  if (v28 != ((v29 >> 2) & 1))
    goto LABEL_36;
  if (v28)
  {
    userReportedResponseDeviceDistance = self->_userReportedResponseDeviceDistance;
    objc_msgSend(v4, "userReportedResponseDeviceDistance");
    if (userReportedResponseDeviceDistance != v31)
      goto LABEL_36;
    v27 = *((unsigned __int8 *)&self->_hasResponseFromMultipleDevices + 1);
    v29 = v4[65];
  }
  v32 = (v27 >> 3) & 1;
  if (v32 != ((v29 >> 3) & 1))
    goto LABEL_36;
  if (v32)
  {
    dataCollectionGroup = self->_dataCollectionGroup;
    if (dataCollectionGroup != objc_msgSend(v4, "dataCollectionGroup"))
      goto LABEL_36;
  }
  -[CDASchemaCDAUserFeedbackCompleted experimentId](self, "experimentId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "experimentId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_35:

    goto LABEL_36;
  }
  -[CDASchemaCDAUserFeedbackCompleted experimentId](self, "experimentId");
  v34 = objc_claimAutoreleasedReturnValue();
  if (v34)
  {
    v35 = (void *)v34;
    -[CDASchemaCDAUserFeedbackCompleted experimentId](self, "experimentId");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "experimentId");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v36, "isEqual:", v37);

    if (!v38)
      goto LABEL_36;
  }
  else
  {

  }
  v41 = (*((unsigned __int8 *)&self->_hasResponseFromMultipleDevices + 1) >> 4) & 1;
  if (v41 == ((v4[65] >> 4) & 1))
  {
    if (!v41
      || (hasResponseFromMultipleDevices = self->_hasResponseFromMultipleDevices,
          hasResponseFromMultipleDevices == objc_msgSend(v4, "hasResponseFromMultipleDevices")))
    {
      v39 = 1;
      goto LABEL_37;
    }
  }
LABEL_36:
  v39 = 0;
LABEL_37:

  return v39;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  NSUInteger v7;
  char v8;
  unint64_t v9;
  double userReportedResponseDeviceDistance;
  double v11;
  long double v12;
  double v13;
  uint64_t v14;
  NSUInteger v15;
  uint64_t v16;

  v3 = -[NSString hash](self->_surveyId, "hash");
  if (*(&self->_hasResponseFromMultipleDevices + 1))
  {
    v4 = 2654435761 * self->_userFeedbackStatus;
    if ((*(&self->_hasResponseFromMultipleDevices + 1) & 2) != 0)
      goto LABEL_3;
  }
  else
  {
    v4 = 0;
    if ((*(&self->_hasResponseFromMultipleDevices + 1) & 2) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_isCorrectDeviceSelected;
      goto LABEL_6;
    }
  }
  v5 = 0;
LABEL_6:
  v6 = -[SISchemaUUID hash](self->_expectedWinnerSiriSpeechId, "hash");
  v7 = -[NSString hash](self->_failureReasonCategory, "hash");
  v8 = *(&self->_hasResponseFromMultipleDevices + 1);
  if ((v8 & 4) != 0)
  {
    userReportedResponseDeviceDistance = self->_userReportedResponseDeviceDistance;
    v11 = -userReportedResponseDeviceDistance;
    if (userReportedResponseDeviceDistance >= 0.0)
      v11 = self->_userReportedResponseDeviceDistance;
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
  if ((v8 & 8) != 0)
    v14 = 2654435761 * self->_dataCollectionGroup;
  else
    v14 = 0;
  v15 = -[NSString hash](self->_experimentId, "hash");
  if ((*(&self->_hasResponseFromMultipleDevices + 1) & 0x10) != 0)
    v16 = 2654435761 * self->_hasResponseFromMultipleDevices;
  else
    v16 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v9 ^ v14 ^ v15 ^ v16;
}

- (id)dictionaryRepresentation
{
  void *v3;
  unsigned int v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  unsigned int v19;
  const __CFString *v20;
  void *v21;
  void *v22;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(&self->_hasResponseFromMultipleDevices + 1) & 8) != 0)
  {
    v4 = -[CDASchemaCDAUserFeedbackCompleted dataCollectionGroup](self, "dataCollectionGroup") - 1;
    if (v4 > 3)
      v5 = CFSTR("CDADATACOLLECTIONGROUP_UNKNOWN");
    else
      v5 = off_1E5639970[v4];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("dataCollectionGroup"));
  }
  if (self->_expectedWinnerSiriSpeechId)
  {
    -[CDASchemaCDAUserFeedbackCompleted expectedWinnerSiriSpeechId](self, "expectedWinnerSiriSpeechId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("expectedWinnerSiriSpeechId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("expectedWinnerSiriSpeechId"));

    }
  }
  if (self->_experimentId)
  {
    -[CDASchemaCDAUserFeedbackCompleted experimentId](self, "experimentId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("experimentId"));

  }
  if (self->_failureReasonCategory)
  {
    -[CDASchemaCDAUserFeedbackCompleted failureReasonCategory](self, "failureReasonCategory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("failureReasonCategory"));

  }
  v13 = *(&self->_hasResponseFromMultipleDevices + 1);
  if ((v13 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CDASchemaCDAUserFeedbackCompleted hasResponseFromMultipleDevices](self, "hasResponseFromMultipleDevices"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("hasResponseFromMultipleDevices"));

    v13 = *(&self->_hasResponseFromMultipleDevices + 1);
  }
  if ((v13 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CDASchemaCDAUserFeedbackCompleted isCorrectDeviceSelected](self, "isCorrectDeviceSelected"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("isCorrectDeviceSelected"));

  }
  if (self->_surveyId)
  {
    -[CDASchemaCDAUserFeedbackCompleted surveyId](self, "surveyId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("surveyId"));

  }
  v18 = *(&self->_hasResponseFromMultipleDevices + 1);
  if ((v18 & 1) != 0)
  {
    v19 = -[CDASchemaCDAUserFeedbackCompleted userFeedbackStatus](self, "userFeedbackStatus") - 1;
    if (v19 > 3)
      v20 = CFSTR("CDAUSERFEEDBACKSTATUS_UNKNOWN");
    else
      v20 = off_1E5639990[v19];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("userFeedbackStatus"));
    v18 = *(&self->_hasResponseFromMultipleDevices + 1);
  }
  if ((v18 & 4) != 0)
  {
    v21 = (void *)MEMORY[0x1E0CB37E8];
    -[CDASchemaCDAUserFeedbackCompleted userReportedResponseDeviceDistance](self, "userReportedResponseDeviceDistance");
    objc_msgSend(v21, "numberWithDouble:");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("userReportedResponseDeviceDistance"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[CDASchemaCDAUserFeedbackCompleted dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (CDASchemaCDAUserFeedbackCompleted)initWithJSON:(id)a3
{
  void *v4;
  CDASchemaCDAUserFeedbackCompleted *v5;
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
    self = -[CDASchemaCDAUserFeedbackCompleted initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (CDASchemaCDAUserFeedbackCompleted)initWithDictionary:(id)a3
{
  id v4;
  CDASchemaCDAUserFeedbackCompleted *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SISchemaUUID *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  CDASchemaCDAUserFeedbackCompleted *v19;
  void *v21;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CDASchemaCDAUserFeedbackCompleted;
  v5 = -[CDASchemaCDAUserFeedbackCompleted init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("surveyId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[CDASchemaCDAUserFeedbackCompleted setSurveyId:](v5, "setSurveyId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userFeedbackStatus"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CDASchemaCDAUserFeedbackCompleted setUserFeedbackStatus:](v5, "setUserFeedbackStatus:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isCorrectDeviceSelected"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CDASchemaCDAUserFeedbackCompleted setIsCorrectDeviceSelected:](v5, "setIsCorrectDeviceSelected:", objc_msgSend(v9, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("expectedWinnerSiriSpeechId"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v10);
      -[CDASchemaCDAUserFeedbackCompleted setExpectedWinnerSiriSpeechId:](v5, "setExpectedWinnerSiriSpeechId:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("failureReasonCategory"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = (void *)objc_msgSend(v12, "copy");
      -[CDASchemaCDAUserFeedbackCompleted setFailureReasonCategory:](v5, "setFailureReasonCategory:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userReportedResponseDeviceDistance"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v14, "doubleValue");
      -[CDASchemaCDAUserFeedbackCompleted setUserReportedResponseDeviceDistance:](v5, "setUserReportedResponseDeviceDistance:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dataCollectionGroup"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CDASchemaCDAUserFeedbackCompleted setDataCollectionGroup:](v5, "setDataCollectionGroup:", objc_msgSend(v15, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("experimentId"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = (void *)objc_msgSend(v16, "copy");
      -[CDASchemaCDAUserFeedbackCompleted setExperimentId:](v5, "setExperimentId:", v17);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasResponseFromMultipleDevices"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CDASchemaCDAUserFeedbackCompleted setHasResponseFromMultipleDevices:](v5, "setHasResponseFromMultipleDevices:", objc_msgSend(v18, "BOOLValue"));
    v19 = v5;

  }
  return v5;
}

- (NSString)surveyId
{
  return self->_surveyId;
}

- (void)setSurveyId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int)userFeedbackStatus
{
  return self->_userFeedbackStatus;
}

- (BOOL)isCorrectDeviceSelected
{
  return self->_isCorrectDeviceSelected;
}

- (SISchemaUUID)expectedWinnerSiriSpeechId
{
  return self->_expectedWinnerSiriSpeechId;
}

- (void)setExpectedWinnerSiriSpeechId:(id)a3
{
  objc_storeStrong((id *)&self->_expectedWinnerSiriSpeechId, a3);
}

- (NSString)failureReasonCategory
{
  return self->_failureReasonCategory;
}

- (void)setFailureReasonCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (double)userReportedResponseDeviceDistance
{
  return self->_userReportedResponseDeviceDistance;
}

- (int)dataCollectionGroup
{
  return self->_dataCollectionGroup;
}

- (NSString)experimentId
{
  return self->_experimentId;
}

- (void)setExperimentId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)hasResponseFromMultipleDevices
{
  return self->_hasResponseFromMultipleDevices;
}

- (void)setHasSurveyId:(BOOL)a3
{
  *(&self->_hasResponseFromMultipleDevices + 2) = a3;
}

- (void)setHasExpectedWinnerSiriSpeechId:(BOOL)a3
{
  *(&self->_hasResponseFromMultipleDevices + 3) = a3;
}

- (void)setHasFailureReasonCategory:(BOOL)a3
{
  *(_BYTE *)&self->_has = a3;
}

- (void)setHasExperimentId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_experimentId, 0);
  objc_storeStrong((id *)&self->_failureReasonCategory, 0);
  objc_storeStrong((id *)&self->_expectedWinnerSiriSpeechId, 0);
  objc_storeStrong((id *)&self->_surveyId, 0);
}

@end
