@implementation POMMESSchemaPOMMESFunctionPerformanceProfile

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setStartTimeIntervalSince2001InMs:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_startTimeIntervalSince2001InMs = a3;
}

- (BOOL)hasStartTimeIntervalSince2001InMs
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasStartTimeIntervalSince2001InMs:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteStartTimeIntervalSince2001InMs
{
  -[POMMESSchemaPOMMESFunctionPerformanceProfile setStartTimeIntervalSince2001InMs:](self, "setStartTimeIntervalSince2001InMs:", 0.0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setDurationInMs:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_durationInMs = a3;
}

- (BOOL)hasDurationInMs
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasDurationInMs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteDurationInMs
{
  -[POMMESSchemaPOMMESFunctionPerformanceProfile setDurationInMs:](self, "setDurationInMs:", 0.0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)hasFileId
{
  return self->_fileId != 0;
}

- (void)deleteFileId
{
  -[POMMESSchemaPOMMESFunctionPerformanceProfile setFileId:](self, "setFileId:", 0);
}

- (void)setLineNumber:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_lineNumber = a3;
}

- (BOOL)hasLineNumber
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasLineNumber:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteLineNumber
{
  -[POMMESSchemaPOMMESFunctionPerformanceProfile setLineNumber:](self, "setLineNumber:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)hasCallingFunction
{
  return self->_callingFunction != 0;
}

- (void)deleteCallingFunction
{
  -[POMMESSchemaPOMMESFunctionPerformanceProfile setCallingFunction:](self, "setCallingFunction:", 0);
}

- (BOOL)hasMeasurementLabel
{
  return self->_measurementLabel != 0;
}

- (void)deleteMeasurementLabel
{
  -[POMMESSchemaPOMMESFunctionPerformanceProfile setMeasurementLabel:](self, "setMeasurementLabel:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return POMMESSchemaPOMMESFunctionPerformanceProfileReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteDoubleField();
  -[POMMESSchemaPOMMESFunctionPerformanceProfile fileId](self, "fileId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteInt32Field();
  -[POMMESSchemaPOMMESFunctionPerformanceProfile callingFunction](self, "callingFunction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  -[POMMESSchemaPOMMESFunctionPerformanceProfile measurementLabel](self, "measurementLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v9;
  if (v7)
  {
    PBDataWriterWriteStringField();
    v8 = v9;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $6AF6D20DACFBBAD245D8F006D4F440E6 has;
  unsigned int v6;
  double startTimeIntervalSince2001InMs;
  double v8;
  int v9;
  double durationInMs;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  int v19;
  int lineNumber;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  BOOL v31;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_27;
  has = self->_has;
  v6 = v4[56];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_27;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    startTimeIntervalSince2001InMs = self->_startTimeIntervalSince2001InMs;
    objc_msgSend(v4, "startTimeIntervalSince2001InMs");
    if (startTimeIntervalSince2001InMs != v8)
      goto LABEL_27;
    has = self->_has;
    v6 = v4[56];
  }
  v9 = (*(unsigned int *)&has >> 1) & 1;
  if (v9 != ((v6 >> 1) & 1))
    goto LABEL_27;
  if (v9)
  {
    durationInMs = self->_durationInMs;
    objc_msgSend(v4, "durationInMs");
    if (durationInMs != v11)
      goto LABEL_27;
  }
  -[POMMESSchemaPOMMESFunctionPerformanceProfile fileId](self, "fileId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v12 == 0) == (v13 != 0))
    goto LABEL_26;
  -[POMMESSchemaPOMMESFunctionPerformanceProfile fileId](self, "fileId");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    -[POMMESSchemaPOMMESFunctionPerformanceProfile fileId](self, "fileId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fileId");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if (!v18)
      goto LABEL_27;
  }
  else
  {

  }
  v19 = (*(_BYTE *)&self->_has >> 2) & 1;
  if (v19 != ((v4[56] >> 2) & 1))
    goto LABEL_27;
  if (v19)
  {
    lineNumber = self->_lineNumber;
    if (lineNumber != objc_msgSend(v4, "lineNumber"))
      goto LABEL_27;
  }
  -[POMMESSchemaPOMMESFunctionPerformanceProfile callingFunction](self, "callingFunction");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "callingFunction");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v12 == 0) == (v13 != 0))
    goto LABEL_26;
  -[POMMESSchemaPOMMESFunctionPerformanceProfile callingFunction](self, "callingFunction");
  v21 = objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v22 = (void *)v21;
    -[POMMESSchemaPOMMESFunctionPerformanceProfile callingFunction](self, "callingFunction");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "callingFunction");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v23, "isEqual:", v24);

    if (!v25)
      goto LABEL_27;
  }
  else
  {

  }
  -[POMMESSchemaPOMMESFunctionPerformanceProfile measurementLabel](self, "measurementLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "measurementLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v12 == 0) != (v13 != 0))
  {
    -[POMMESSchemaPOMMESFunctionPerformanceProfile measurementLabel](self, "measurementLabel");
    v26 = objc_claimAutoreleasedReturnValue();
    if (!v26)
    {

LABEL_30:
      v31 = 1;
      goto LABEL_28;
    }
    v27 = (void *)v26;
    -[POMMESSchemaPOMMESFunctionPerformanceProfile measurementLabel](self, "measurementLabel");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "measurementLabel");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v28, "isEqual:", v29);

    if ((v30 & 1) != 0)
      goto LABEL_30;
  }
  else
  {
LABEL_26:

  }
LABEL_27:
  v31 = 0;
LABEL_28:

  return v31;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  double startTimeIntervalSince2001InMs;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  double durationInMs;
  double v11;
  long double v12;
  double v13;
  NSUInteger v14;
  uint64_t v15;
  unint64_t v16;
  NSUInteger v17;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    startTimeIntervalSince2001InMs = self->_startTimeIntervalSince2001InMs;
    v6 = -startTimeIntervalSince2001InMs;
    if (startTimeIntervalSince2001InMs >= 0.0)
      v6 = self->_startTimeIntervalSince2001InMs;
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
  if ((has & 2) != 0)
  {
    durationInMs = self->_durationInMs;
    v11 = -durationInMs;
    if (durationInMs >= 0.0)
      v11 = self->_durationInMs;
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
  v14 = -[NSString hash](self->_fileId, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v15 = 2654435761 * self->_lineNumber;
  else
    v15 = 0;
  v16 = v9 ^ v4 ^ v15 ^ v14;
  v17 = -[NSString hash](self->_callingFunction, "hash");
  return v16 ^ v17 ^ -[NSString hash](self->_measurementLabel, "hash");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_callingFunction)
  {
    -[POMMESSchemaPOMMESFunctionPerformanceProfile callingFunction](self, "callingFunction");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("callingFunction"));

  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[POMMESSchemaPOMMESFunctionPerformanceProfile durationInMs](self, "durationInMs");
    objc_msgSend(v6, "numberWithDouble:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("durationInMs"));

  }
  if (self->_fileId)
  {
    -[POMMESSchemaPOMMESFunctionPerformanceProfile fileId](self, "fileId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("fileId"));

  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[POMMESSchemaPOMMESFunctionPerformanceProfile lineNumber](self, "lineNumber"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("lineNumber"));

  }
  if (self->_measurementLabel)
  {
    -[POMMESSchemaPOMMESFunctionPerformanceProfile measurementLabel](self, "measurementLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("measurementLabel"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v13 = (void *)MEMORY[0x1E0CB37E8];
    -[POMMESSchemaPOMMESFunctionPerformanceProfile startTimeIntervalSince2001InMs](self, "startTimeIntervalSince2001InMs");
    objc_msgSend(v13, "numberWithDouble:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("startTimeIntervalSince2001InMs"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[POMMESSchemaPOMMESFunctionPerformanceProfile dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (POMMESSchemaPOMMESFunctionPerformanceProfile)initWithJSON:(id)a3
{
  void *v4;
  POMMESSchemaPOMMESFunctionPerformanceProfile *v5;
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
    self = -[POMMESSchemaPOMMESFunctionPerformanceProfile initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (POMMESSchemaPOMMESFunctionPerformanceProfile)initWithDictionary:(id)a3
{
  id v4;
  POMMESSchemaPOMMESFunctionPerformanceProfile *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  POMMESSchemaPOMMESFunctionPerformanceProfile *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)POMMESSchemaPOMMESFunctionPerformanceProfile;
  v5 = -[POMMESSchemaPOMMESFunctionPerformanceProfile init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("startTimeIntervalSince2001InMs"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "doubleValue");
      -[POMMESSchemaPOMMESFunctionPerformanceProfile setStartTimeIntervalSince2001InMs:](v5, "setStartTimeIntervalSince2001InMs:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("durationInMs"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "doubleValue");
      -[POMMESSchemaPOMMESFunctionPerformanceProfile setDurationInMs:](v5, "setDurationInMs:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fileId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[POMMESSchemaPOMMESFunctionPerformanceProfile setFileId:](v5, "setFileId:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lineNumber"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[POMMESSchemaPOMMESFunctionPerformanceProfile setLineNumber:](v5, "setLineNumber:", objc_msgSend(v10, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("callingFunction"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = (void *)objc_msgSend(v11, "copy");
      -[POMMESSchemaPOMMESFunctionPerformanceProfile setCallingFunction:](v5, "setCallingFunction:", v12);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("measurementLabel"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = (void *)objc_msgSend(v13, "copy");
      -[POMMESSchemaPOMMESFunctionPerformanceProfile setMeasurementLabel:](v5, "setMeasurementLabel:", v14);

    }
    v15 = v5;

  }
  return v5;
}

- (double)startTimeIntervalSince2001InMs
{
  return self->_startTimeIntervalSince2001InMs;
}

- (double)durationInMs
{
  return self->_durationInMs;
}

- (NSString)fileId
{
  return self->_fileId;
}

- (void)setFileId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int)lineNumber
{
  return self->_lineNumber;
}

- (NSString)callingFunction
{
  return self->_callingFunction;
}

- (void)setCallingFunction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)measurementLabel
{
  return self->_measurementLabel;
}

- (void)setMeasurementLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setHasFileId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasCallingFunction:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasMeasurementLabel:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_measurementLabel, 0);
  objc_storeStrong((id *)&self->_callingFunction, 0);
  objc_storeStrong((id *)&self->_fileId, 0);
}

@end
