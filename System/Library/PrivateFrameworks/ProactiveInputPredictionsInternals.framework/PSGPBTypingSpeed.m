@implementation PSGPBTypingSpeed

- (BOOL)hasZkwExperimentId
{
  return self->_zkwExperimentId != 0;
}

- (BOOL)hasZkwTreatmentId
{
  return self->_zkwTreatmentId != 0;
}

- (BOOL)hasZkwTreatmentName
{
  return self->_zkwTreatmentName != 0;
}

- (BOOL)hasWbExperimentId
{
  return self->_wbExperimentId != 0;
}

- (BOOL)hasWbTreatmentId
{
  return self->_wbTreatmentId != 0;
}

- (BOOL)hasWbTreatmentName
{
  return self->_wbTreatmentName != 0;
}

- (BOOL)hasLocaleIdentifier
{
  return self->_localeIdentifier != 0;
}

- (void)setMessageDurationMilliseconds:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_messageDurationMilliseconds = a3;
}

- (void)setHasMessageDurationMilliseconds:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMessageDurationMilliseconds
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setMessageLength:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_messageLength = a3;
}

- (void)setHasMessageLength:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMessageLength
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setMessageWords:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_messageWords = a3;
}

- (void)setHasMessageWords:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMessageWords
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

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)PSGPBTypingSpeed;
  -[PSGPBTypingSpeed description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGPBTypingSpeed dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *zkwExperimentId;
  NSString *zkwTreatmentId;
  NSString *zkwTreatmentName;
  NSString *wbExperimentId;
  NSString *wbTreatmentId;
  NSString *wbTreatmentName;
  NSString *localeIdentifier;
  char has;
  void *v13;
  void *v15;
  void *v16;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  zkwExperimentId = self->_zkwExperimentId;
  if (zkwExperimentId)
    objc_msgSend(v3, "setObject:forKey:", zkwExperimentId, CFSTR("zkw_experiment_id"));
  zkwTreatmentId = self->_zkwTreatmentId;
  if (zkwTreatmentId)
    objc_msgSend(v4, "setObject:forKey:", zkwTreatmentId, CFSTR("zkw_treatment_id"));
  zkwTreatmentName = self->_zkwTreatmentName;
  if (zkwTreatmentName)
    objc_msgSend(v4, "setObject:forKey:", zkwTreatmentName, CFSTR("zkw_treatment_name"));
  wbExperimentId = self->_wbExperimentId;
  if (wbExperimentId)
    objc_msgSend(v4, "setObject:forKey:", wbExperimentId, CFSTR("wb_experiment_id"));
  wbTreatmentId = self->_wbTreatmentId;
  if (wbTreatmentId)
    objc_msgSend(v4, "setObject:forKey:", wbTreatmentId, CFSTR("wb_treatment_id"));
  wbTreatmentName = self->_wbTreatmentName;
  if (wbTreatmentName)
    objc_msgSend(v4, "setObject:forKey:", wbTreatmentName, CFSTR("wb_treatment_name"));
  localeIdentifier = self->_localeIdentifier;
  if (localeIdentifier)
    objc_msgSend(v4, "setObject:forKey:", localeIdentifier, CFSTR("locale_identifier"));
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_17;
LABEL_21:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_messageLength);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("message_length"));

    if ((*(_BYTE *)&self->_has & 4) == 0)
      return v4;
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_messageDurationMilliseconds);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("message_duration_milliseconds"));

  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_21;
LABEL_17:
  if ((has & 4) != 0)
  {
LABEL_18:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_messageWords);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("message_words"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PSGPBTypingSpeedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_zkwExperimentId)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_zkwTreatmentId)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_zkwTreatmentName)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_wbExperimentId)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_wbTreatmentId)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_wbTreatmentName)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_localeIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_17;
LABEL_21:
    PBDataWriterWriteInt32Field();
    v4 = v6;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
  PBDataWriterWriteInt32Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_21;
LABEL_17:
  if ((has & 4) != 0)
  {
LABEL_18:
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
LABEL_19:

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_zkwExperimentId)
  {
    objc_msgSend(v4, "setZkwExperimentId:");
    v4 = v6;
  }
  if (self->_zkwTreatmentId)
  {
    objc_msgSend(v6, "setZkwTreatmentId:");
    v4 = v6;
  }
  if (self->_zkwTreatmentName)
  {
    objc_msgSend(v6, "setZkwTreatmentName:");
    v4 = v6;
  }
  if (self->_wbExperimentId)
  {
    objc_msgSend(v6, "setWbExperimentId:");
    v4 = v6;
  }
  if (self->_wbTreatmentId)
  {
    objc_msgSend(v6, "setWbTreatmentId:");
    v4 = v6;
  }
  if (self->_wbTreatmentName)
  {
    objc_msgSend(v6, "setWbTreatmentName:");
    v4 = v6;
  }
  if (self->_localeIdentifier)
  {
    objc_msgSend(v6, "setLocaleIdentifier:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_17;
LABEL_21:
    *((_DWORD *)v4 + 5) = self->_messageLength;
    *((_BYTE *)v4 + 80) |= 2u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
  *((_DWORD *)v4 + 4) = self->_messageDurationMilliseconds;
  *((_BYTE *)v4 + 80) |= 1u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_21;
LABEL_17:
  if ((has & 4) != 0)
  {
LABEL_18:
    *((_DWORD *)v4 + 6) = self->_messageWords;
    *((_BYTE *)v4 + 80) |= 4u;
  }
LABEL_19:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_zkwExperimentId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v6;

  v8 = -[NSString copyWithZone:](self->_zkwTreatmentId, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v8;

  v10 = -[NSString copyWithZone:](self->_zkwTreatmentName, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v10;

  v12 = -[NSString copyWithZone:](self->_wbExperimentId, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v12;

  v14 = -[NSString copyWithZone:](self->_wbTreatmentId, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v14;

  v16 = -[NSString copyWithZone:](self->_wbTreatmentName, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v16;

  v18 = -[NSString copyWithZone:](self->_localeIdentifier, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v18;

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_7:
    *(_DWORD *)(v5 + 20) = self->_messageLength;
    *(_BYTE *)(v5 + 80) |= 2u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      return (id)v5;
    goto LABEL_4;
  }
  *(_DWORD *)(v5 + 16) = self->_messageDurationMilliseconds;
  *(_BYTE *)(v5 + 80) |= 1u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 24) = self->_messageWords;
    *(_BYTE *)(v5 + 80) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *zkwExperimentId;
  NSString *zkwTreatmentId;
  NSString *zkwTreatmentName;
  NSString *wbExperimentId;
  NSString *wbTreatmentId;
  NSString *wbTreatmentName;
  NSString *localeIdentifier;
  BOOL v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_30;
  zkwExperimentId = self->_zkwExperimentId;
  if ((unint64_t)zkwExperimentId | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](zkwExperimentId, "isEqual:"))
      goto LABEL_30;
  }
  zkwTreatmentId = self->_zkwTreatmentId;
  if ((unint64_t)zkwTreatmentId | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](zkwTreatmentId, "isEqual:"))
      goto LABEL_30;
  }
  zkwTreatmentName = self->_zkwTreatmentName;
  if ((unint64_t)zkwTreatmentName | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](zkwTreatmentName, "isEqual:"))
      goto LABEL_30;
  }
  wbExperimentId = self->_wbExperimentId;
  if ((unint64_t)wbExperimentId | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](wbExperimentId, "isEqual:"))
      goto LABEL_30;
  }
  wbTreatmentId = self->_wbTreatmentId;
  if ((unint64_t)wbTreatmentId | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](wbTreatmentId, "isEqual:"))
      goto LABEL_30;
  }
  wbTreatmentName = self->_wbTreatmentName;
  if ((unint64_t)wbTreatmentName | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](wbTreatmentName, "isEqual:"))
      goto LABEL_30;
  }
  localeIdentifier = self->_localeIdentifier;
  if ((unint64_t)localeIdentifier | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](localeIdentifier, "isEqual:"))
      goto LABEL_30;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 1) == 0 || self->_messageDurationMilliseconds != *((_DWORD *)v4 + 4))
      goto LABEL_30;
  }
  else if ((*((_BYTE *)v4 + 80) & 1) != 0)
  {
LABEL_30:
    v12 = 0;
    goto LABEL_31;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 2) == 0 || self->_messageLength != *((_DWORD *)v4 + 5))
      goto LABEL_30;
  }
  else if ((*((_BYTE *)v4 + 80) & 2) != 0)
  {
    goto LABEL_30;
  }
  v12 = (*((_BYTE *)v4 + 80) & 4) == 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 4) == 0 || self->_messageWords != *((_DWORD *)v4 + 6))
      goto LABEL_30;
    v12 = 1;
  }
LABEL_31:

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = -[NSString hash](self->_zkwExperimentId, "hash");
  v4 = -[NSString hash](self->_zkwTreatmentId, "hash");
  v5 = -[NSString hash](self->_zkwTreatmentName, "hash");
  v6 = -[NSString hash](self->_wbExperimentId, "hash");
  v7 = -[NSString hash](self->_wbTreatmentId, "hash");
  v8 = -[NSString hash](self->_wbTreatmentName, "hash");
  v9 = -[NSString hash](self->_localeIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v10 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v11 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v12 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
  }
  v10 = 2654435761 * self->_messageDurationMilliseconds;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v11 = 2654435761 * self->_messageLength;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v12 = 2654435761 * self->_messageWords;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  char v5;
  int *v6;

  v4 = (int *)a3;
  v6 = v4;
  if (*((_QWORD *)v4 + 7))
  {
    -[PSGPBTypingSpeed setZkwExperimentId:](self, "setZkwExperimentId:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 8))
  {
    -[PSGPBTypingSpeed setZkwTreatmentId:](self, "setZkwTreatmentId:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 9))
  {
    -[PSGPBTypingSpeed setZkwTreatmentName:](self, "setZkwTreatmentName:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[PSGPBTypingSpeed setWbExperimentId:](self, "setWbExperimentId:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[PSGPBTypingSpeed setWbTreatmentId:](self, "setWbTreatmentId:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[PSGPBTypingSpeed setWbTreatmentName:](self, "setWbTreatmentName:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[PSGPBTypingSpeed setLocaleIdentifier:](self, "setLocaleIdentifier:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 80);
  if ((v5 & 1) == 0)
  {
    if ((v4[20] & 2) == 0)
      goto LABEL_17;
LABEL_21:
    self->_messageLength = v4[5];
    *(_BYTE *)&self->_has |= 2u;
    if ((v4[20] & 4) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
  self->_messageDurationMilliseconds = v4[4];
  *(_BYTE *)&self->_has |= 1u;
  v5 = *((_BYTE *)v4 + 80);
  if ((v5 & 2) != 0)
    goto LABEL_21;
LABEL_17:
  if ((v5 & 4) != 0)
  {
LABEL_18:
    self->_messageWords = v4[6];
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_19:

}

- (NSString)zkwExperimentId
{
  return self->_zkwExperimentId;
}

- (void)setZkwExperimentId:(id)a3
{
  objc_storeStrong((id *)&self->_zkwExperimentId, a3);
}

- (NSString)zkwTreatmentId
{
  return self->_zkwTreatmentId;
}

- (void)setZkwTreatmentId:(id)a3
{
  objc_storeStrong((id *)&self->_zkwTreatmentId, a3);
}

- (NSString)zkwTreatmentName
{
  return self->_zkwTreatmentName;
}

- (void)setZkwTreatmentName:(id)a3
{
  objc_storeStrong((id *)&self->_zkwTreatmentName, a3);
}

- (NSString)wbExperimentId
{
  return self->_wbExperimentId;
}

- (void)setWbExperimentId:(id)a3
{
  objc_storeStrong((id *)&self->_wbExperimentId, a3);
}

- (NSString)wbTreatmentId
{
  return self->_wbTreatmentId;
}

- (void)setWbTreatmentId:(id)a3
{
  objc_storeStrong((id *)&self->_wbTreatmentId, a3);
}

- (NSString)wbTreatmentName
{
  return self->_wbTreatmentName;
}

- (void)setWbTreatmentName:(id)a3
{
  objc_storeStrong((id *)&self->_wbTreatmentName, a3);
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (void)setLocaleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_localeIdentifier, a3);
}

- (int)messageDurationMilliseconds
{
  return self->_messageDurationMilliseconds;
}

- (int)messageLength
{
  return self->_messageLength;
}

- (int)messageWords
{
  return self->_messageWords;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zkwTreatmentName, 0);
  objc_storeStrong((id *)&self->_zkwTreatmentId, 0);
  objc_storeStrong((id *)&self->_zkwExperimentId, 0);
  objc_storeStrong((id *)&self->_wbTreatmentName, 0);
  objc_storeStrong((id *)&self->_wbTreatmentId, 0);
  objc_storeStrong((id *)&self->_wbExperimentId, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
}

@end
