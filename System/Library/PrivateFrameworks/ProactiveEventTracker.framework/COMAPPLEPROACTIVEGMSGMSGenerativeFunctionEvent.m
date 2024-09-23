@implementation COMAPPLEPROACTIVEGMSGMSGenerativeFunctionEvent

- (void)setVersion:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasVersion
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (BOOL)hasFunctionIdentifier
{
  return self->_functionIdentifier != 0;
}

- (BOOL)hasInvocationIdentifier
{
  return self->_invocationIdentifier != 0;
}

- (void)setTotalLatencyMillis:(double)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_totalLatencyMillis = a3;
}

- (void)setHasTotalLatencyMillis:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTotalLatencyMillis
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setPromptConstructionMillis:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_promptConstructionMillis = a3;
}

- (void)setHasPromptConstructionMillis:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPromptConstructionMillis
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setInferenceMillis:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_inferenceMillis = a3;
}

- (void)setHasInferenceMillis:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasInferenceMillis
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setResponseProcessingMillis:(double)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_responseProcessingMillis = a3;
}

- (void)setHasResponseProcessingMillis:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasResponseProcessingMillis
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
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
  v8.super_class = (Class)COMAPPLEPROACTIVEGMSGMSGenerativeFunctionEvent;
  -[COMAPPLEPROACTIVEGMSGMSGenerativeFunctionEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMAPPLEPROACTIVEGMSGMSGenerativeFunctionEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *functionIdentifier;
  NSString *invocationIdentifier;
  char has;
  void *v8;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_version);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("version"));

  }
  functionIdentifier = self->_functionIdentifier;
  if (functionIdentifier)
    objc_msgSend(v3, "setObject:forKey:", functionIdentifier, CFSTR("functionIdentifier"));
  invocationIdentifier = self->_invocationIdentifier;
  if (invocationIdentifier)
    objc_msgSend(v3, "setObject:forKey:", invocationIdentifier, CFSTR("invocationIdentifier"));
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_totalLatencyMillis);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("totalLatencyMillis"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_9:
      if ((has & 1) == 0)
        goto LABEL_10;
LABEL_15:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_inferenceMillis);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("inferenceMillis"));

      if ((*(_BYTE *)&self->_has & 4) == 0)
        return v3;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_promptConstructionMillis);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("promptConstructionMillis"));

  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_15;
LABEL_10:
  if ((has & 4) != 0)
  {
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_responseProcessingMillis);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("responseProcessingMillis"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return COMAPPLEPROACTIVEGMSGMSGenerativeFunctionEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_functionIdentifier)
    PBDataWriterWriteStringField();
  if (self->_invocationIdentifier)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteDoubleField();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_9:
      if ((has & 1) == 0)
        goto LABEL_10;
LABEL_15:
      PBDataWriterWriteDoubleField();
      if ((*(_BYTE *)&self->_has & 4) == 0)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteDoubleField();
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_15;
LABEL_10:
  if ((has & 4) != 0)
LABEL_11:
    PBDataWriterWriteDoubleField();
LABEL_12:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  _QWORD *v6;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v4[5] = self->_version;
    *((_BYTE *)v4 + 64) |= 0x10u;
  }
  v6 = v4;
  if (self->_functionIdentifier)
  {
    objc_msgSend(v4, "setFunctionIdentifier:");
    v4 = v6;
  }
  if (self->_invocationIdentifier)
  {
    objc_msgSend(v6, "setInvocationIdentifier:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v4[4] = *(_QWORD *)&self->_totalLatencyMillis;
    *((_BYTE *)v4 + 64) |= 8u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_9:
      if ((has & 1) == 0)
        goto LABEL_10;
LABEL_15:
      v4[1] = *(_QWORD *)&self->_inferenceMillis;
      *((_BYTE *)v4 + 64) |= 1u;
      if ((*(_BYTE *)&self->_has & 4) == 0)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_9;
  }
  v4[2] = *(_QWORD *)&self->_promptConstructionMillis;
  *((_BYTE *)v4 + 64) |= 2u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_15;
LABEL_10:
  if ((has & 4) != 0)
  {
LABEL_11:
    v4[3] = *(_QWORD *)&self->_responseProcessingMillis;
    *((_BYTE *)v4 + 64) |= 4u;
  }
LABEL_12:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    *(_QWORD *)(v5 + 40) = self->_version;
    *(_BYTE *)(v5 + 64) |= 0x10u;
  }
  v7 = -[NSString copyWithZone:](self->_functionIdentifier, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v7;

  v9 = -[NSString copyWithZone:](self->_invocationIdentifier, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v9;

  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(double *)(v6 + 32) = self->_totalLatencyMillis;
    *(_BYTE *)(v6 + 64) |= 8u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 1) == 0)
        goto LABEL_6;
LABEL_11:
      *(double *)(v6 + 8) = self->_inferenceMillis;
      *(_BYTE *)(v6 + 64) |= 1u;
      if ((*(_BYTE *)&self->_has & 4) == 0)
        return (id)v6;
      goto LABEL_7;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *(double *)(v6 + 16) = self->_promptConstructionMillis;
  *(_BYTE *)(v6 + 64) |= 2u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_11;
LABEL_6:
  if ((has & 4) != 0)
  {
LABEL_7:
    *(double *)(v6 + 24) = self->_responseProcessingMillis;
    *(_BYTE *)(v6 + 64) |= 4u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *functionIdentifier;
  NSString *invocationIdentifier;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_30;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 0x10) == 0 || self->_version != *((_QWORD *)v4 + 5))
      goto LABEL_30;
  }
  else if ((*((_BYTE *)v4 + 64) & 0x10) != 0)
  {
LABEL_30:
    v7 = 0;
    goto LABEL_31;
  }
  functionIdentifier = self->_functionIdentifier;
  if ((unint64_t)functionIdentifier | *((_QWORD *)v4 + 6)
    && !-[NSString isEqual:](functionIdentifier, "isEqual:"))
  {
    goto LABEL_30;
  }
  invocationIdentifier = self->_invocationIdentifier;
  if ((unint64_t)invocationIdentifier | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](invocationIdentifier, "isEqual:"))
      goto LABEL_30;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 8) == 0 || self->_totalLatencyMillis != *((double *)v4 + 4))
      goto LABEL_30;
  }
  else if ((*((_BYTE *)v4 + 64) & 8) != 0)
  {
    goto LABEL_30;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 2) == 0 || self->_promptConstructionMillis != *((double *)v4 + 2))
      goto LABEL_30;
  }
  else if ((*((_BYTE *)v4 + 64) & 2) != 0)
  {
    goto LABEL_30;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 1) == 0 || self->_inferenceMillis != *((double *)v4 + 1))
      goto LABEL_30;
  }
  else if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
    goto LABEL_30;
  }
  v7 = (*((_BYTE *)v4 + 64) & 4) == 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 4) == 0 || self->_responseProcessingMillis != *((double *)v4 + 3))
      goto LABEL_30;
    v7 = 1;
  }
LABEL_31:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  char has;
  unint64_t v7;
  double totalLatencyMillis;
  double v9;
  long double v10;
  double v11;
  unint64_t v12;
  double promptConstructionMillis;
  double v14;
  long double v15;
  double v16;
  unint64_t v17;
  double inferenceMillis;
  double v19;
  long double v20;
  double v21;
  unint64_t v22;
  double responseProcessingMillis;
  double v24;
  long double v25;
  double v26;

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    v3 = 2654435761 * self->_version;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_functionIdentifier, "hash");
  v5 = -[NSString hash](self->_invocationIdentifier, "hash");
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    totalLatencyMillis = self->_totalLatencyMillis;
    v9 = -totalLatencyMillis;
    if (totalLatencyMillis >= 0.0)
      v9 = self->_totalLatencyMillis;
    v10 = floor(v9 + 0.5);
    v11 = (v9 - v10) * 1.84467441e19;
    v7 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
    if (v11 >= 0.0)
    {
      if (v11 > 0.0)
        v7 += (unint64_t)v11;
    }
    else
    {
      v7 -= (unint64_t)fabs(v11);
    }
  }
  else
  {
    v7 = 0;
  }
  if ((has & 2) != 0)
  {
    promptConstructionMillis = self->_promptConstructionMillis;
    v14 = -promptConstructionMillis;
    if (promptConstructionMillis >= 0.0)
      v14 = self->_promptConstructionMillis;
    v15 = floor(v14 + 0.5);
    v16 = (v14 - v15) * 1.84467441e19;
    v12 = 2654435761u * (unint64_t)fmod(v15, 1.84467441e19);
    if (v16 >= 0.0)
    {
      if (v16 > 0.0)
        v12 += (unint64_t)v16;
    }
    else
    {
      v12 -= (unint64_t)fabs(v16);
    }
  }
  else
  {
    v12 = 0;
  }
  if ((has & 1) != 0)
  {
    inferenceMillis = self->_inferenceMillis;
    v19 = -inferenceMillis;
    if (inferenceMillis >= 0.0)
      v19 = self->_inferenceMillis;
    v20 = floor(v19 + 0.5);
    v21 = (v19 - v20) * 1.84467441e19;
    v17 = 2654435761u * (unint64_t)fmod(v20, 1.84467441e19);
    if (v21 >= 0.0)
    {
      if (v21 > 0.0)
        v17 += (unint64_t)v21;
    }
    else
    {
      v17 -= (unint64_t)fabs(v21);
    }
  }
  else
  {
    v17 = 0;
  }
  if ((has & 4) != 0)
  {
    responseProcessingMillis = self->_responseProcessingMillis;
    v24 = -responseProcessingMillis;
    if (responseProcessingMillis >= 0.0)
      v24 = self->_responseProcessingMillis;
    v25 = floor(v24 + 0.5);
    v26 = (v24 - v25) * 1.84467441e19;
    v22 = 2654435761u * (unint64_t)fmod(v25, 1.84467441e19);
    if (v26 >= 0.0)
    {
      if (v26 > 0.0)
        v22 += (unint64_t)v26;
    }
    else
    {
      v22 -= (unint64_t)fabs(v26);
    }
  }
  else
  {
    v22 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v7 ^ v12 ^ v17 ^ v22;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  if ((*((_BYTE *)v4 + 64) & 0x10) != 0)
  {
    self->_version = *((_QWORD *)v4 + 5);
    *(_BYTE *)&self->_has |= 0x10u;
  }
  v6 = v4;
  if (*((_QWORD *)v4 + 6))
  {
    -[COMAPPLEPROACTIVEGMSGMSGenerativeFunctionEvent setFunctionIdentifier:](self, "setFunctionIdentifier:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 7))
  {
    -[COMAPPLEPROACTIVEGMSGMSGenerativeFunctionEvent setInvocationIdentifier:](self, "setInvocationIdentifier:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 64);
  if ((v5 & 8) != 0)
  {
    self->_totalLatencyMillis = *((double *)v4 + 4);
    *(_BYTE *)&self->_has |= 8u;
    v5 = *((_BYTE *)v4 + 64);
    if ((v5 & 2) == 0)
    {
LABEL_9:
      if ((v5 & 1) == 0)
        goto LABEL_10;
LABEL_15:
      self->_inferenceMillis = *((double *)v4 + 1);
      *(_BYTE *)&self->_has |= 1u;
      if ((*((_BYTE *)v4 + 64) & 4) == 0)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  else if ((*((_BYTE *)v4 + 64) & 2) == 0)
  {
    goto LABEL_9;
  }
  self->_promptConstructionMillis = *((double *)v4 + 2);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)v4 + 64);
  if ((v5 & 1) != 0)
    goto LABEL_15;
LABEL_10:
  if ((v5 & 4) != 0)
  {
LABEL_11:
    self->_responseProcessingMillis = *((double *)v4 + 3);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_12:

}

- (int64_t)version
{
  return self->_version;
}

- (NSString)functionIdentifier
{
  return self->_functionIdentifier;
}

- (void)setFunctionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_functionIdentifier, a3);
}

- (NSString)invocationIdentifier
{
  return self->_invocationIdentifier;
}

- (void)setInvocationIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_invocationIdentifier, a3);
}

- (double)totalLatencyMillis
{
  return self->_totalLatencyMillis;
}

- (double)promptConstructionMillis
{
  return self->_promptConstructionMillis;
}

- (double)inferenceMillis
{
  return self->_inferenceMillis;
}

- (double)responseProcessingMillis
{
  return self->_responseProcessingMillis;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invocationIdentifier, 0);
  objc_storeStrong((id *)&self->_functionIdentifier, 0);
}

@end
