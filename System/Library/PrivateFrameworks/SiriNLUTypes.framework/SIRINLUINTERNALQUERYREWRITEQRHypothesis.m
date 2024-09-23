@implementation SIRINLUINTERNALQUERYREWRITEQRHypothesis

- (BOOL)hasAsrId
{
  return self->_asrId != 0;
}

- (BOOL)hasUtterance
{
  return self->_utterance != 0;
}

- (void)setConfidence:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_confidence = a3;
}

- (void)setHasConfidence:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasConfidence
{
  return *(_BYTE *)&self->_has & 1;
}

- (int)rewriteType
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_rewriteType;
  else
    return 0;
}

- (void)setRewriteType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_rewriteType = a3;
}

- (void)setHasRewriteType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRewriteType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)rewriteTypeAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("CORRECTION");
  if (a3 == 1)
  {
    v3 = CFSTR("REFERENCE_RESOLUTION");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsRewriteType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CORRECTION")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("REFERENCE_RESOLUTION"));

  return v4;
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
  v8.super_class = (Class)SIRINLUINTERNALQUERYREWRITEQRHypothesis;
  -[SIRINLUINTERNALQUERYREWRITEQRHypothesis description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUINTERNALQUERYREWRITEQRHypothesis dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  SIRINLUEXTERNALUUID *asrId;
  void *v5;
  NSString *utterance;
  char has;
  void *v8;
  int rewriteType;
  __CFString *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  asrId = self->_asrId;
  if (asrId)
  {
    -[SIRINLUEXTERNALUUID dictionaryRepresentation](asrId, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("asr_id"));

  }
  utterance = self->_utterance;
  if (utterance)
    objc_msgSend(v3, "setObject:forKey:", utterance, CFSTR("utterance"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_confidence);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("confidence"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    rewriteType = self->_rewriteType;
    if (rewriteType)
    {
      if (rewriteType == 1)
      {
        v10 = CFSTR("REFERENCE_RESOLUTION");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_rewriteType);
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v10 = CFSTR("CORRECTION");
    }
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("rewrite_type"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALQUERYREWRITEQRHypothesisReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_asrId)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_utterance)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_asrId)
  {
    objc_msgSend(v4, "setAsrId:");
    v4 = v6;
  }
  if (self->_utterance)
  {
    objc_msgSend(v6, "setUtterance:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_confidence;
    *((_BYTE *)v4 + 40) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_rewriteType;
    *((_BYTE *)v4 + 40) |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[SIRINLUEXTERNALUUID copyWithZone:](self->_asrId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[NSString copyWithZone:](self->_utterance, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_confidence;
    *(_BYTE *)(v5 + 40) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_rewriteType;
    *(_BYTE *)(v5 + 40) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  SIRINLUEXTERNALUUID *asrId;
  NSString *utterance;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  asrId = self->_asrId;
  if ((unint64_t)asrId | *((_QWORD *)v4 + 2))
  {
    if (!-[SIRINLUEXTERNALUUID isEqual:](asrId, "isEqual:"))
      goto LABEL_15;
  }
  utterance = self->_utterance;
  if ((unint64_t)utterance | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](utterance, "isEqual:"))
      goto LABEL_15;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_confidence != *((double *)v4 + 1))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
LABEL_15:
    v7 = 0;
    goto LABEL_16;
  }
  v7 = (*((_BYTE *)v4 + 40) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0 || self->_rewriteType != *((_DWORD *)v4 + 6))
      goto LABEL_15;
    v7 = 1;
  }
LABEL_16:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  char has;
  unint64_t v6;
  double confidence;
  double v8;
  long double v9;
  double v10;
  uint64_t v11;

  v3 = -[SIRINLUEXTERNALUUID hash](self->_asrId, "hash");
  v4 = -[NSString hash](self->_utterance, "hash");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    confidence = self->_confidence;
    v8 = -confidence;
    if (confidence >= 0.0)
      v8 = self->_confidence;
    v9 = floor(v8 + 0.5);
    v10 = (v8 - v9) * 1.84467441e19;
    v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0)
        v6 += (unint64_t)v10;
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    v6 = 0;
  }
  if ((has & 2) != 0)
    v11 = 2654435761 * self->_rewriteType;
  else
    v11 = 0;
  return v4 ^ v3 ^ v6 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  SIRINLUEXTERNALUUID *asrId;
  uint64_t v6;
  char v7;
  id v8;

  v4 = a3;
  asrId = self->_asrId;
  v6 = *((_QWORD *)v4 + 2);
  v8 = v4;
  if (asrId)
  {
    if (!v6)
      goto LABEL_7;
    -[SIRINLUEXTERNALUUID mergeFrom:](asrId, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[SIRINLUINTERNALQUERYREWRITEQRHypothesis setAsrId:](self, "setAsrId:");
  }
  v4 = v8;
LABEL_7:
  if (*((_QWORD *)v4 + 4))
  {
    -[SIRINLUINTERNALQUERYREWRITEQRHypothesis setUtterance:](self, "setUtterance:");
    v4 = v8;
  }
  v7 = *((_BYTE *)v4 + 40);
  if ((v7 & 1) != 0)
  {
    self->_confidence = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v7 = *((_BYTE *)v4 + 40);
  }
  if ((v7 & 2) != 0)
  {
    self->_rewriteType = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (SIRINLUEXTERNALUUID)asrId
{
  return self->_asrId;
}

- (void)setAsrId:(id)a3
{
  objc_storeStrong((id *)&self->_asrId, a3);
}

- (NSString)utterance
{
  return self->_utterance;
}

- (void)setUtterance:(id)a3
{
  objc_storeStrong((id *)&self->_utterance, a3);
}

- (double)confidence
{
  return self->_confidence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utterance, 0);
  objc_storeStrong((id *)&self->_asrId, 0);
}

+ (id)options
{
  if (options_once_3081 != -1)
    dispatch_once(&options_once_3081, &__block_literal_global_3082);
  return (id)options_sOptions_3083;
}

void __50__SIRINLUINTERNALQUERYREWRITEQRHypothesis_options__block_invoke()
{
  void *v0;

  v0 = (void *)options_sOptions_3083;
  options_sOptions_3083 = (uint64_t)&unk_1E7BD2C10;

}

@end
