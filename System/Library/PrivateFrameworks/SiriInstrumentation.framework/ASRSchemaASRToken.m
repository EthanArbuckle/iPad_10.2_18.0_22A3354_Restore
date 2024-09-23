@implementation ASRSchemaASRToken

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
  v9.super_class = (Class)ASRSchemaASRToken;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASRSchemaASRToken entityMetadata](self, "entityMetadata", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[ASRSchemaASRToken deleteEntityMetadata](self, "deleteEntityMetadata");
  return v5;
}

- (void)setLinkIndex:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_linkIndex = a3;
}

- (BOOL)hasLinkIndex
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHasLinkIndex:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (void)deleteLinkIndex
{
  -[ASRSchemaASRToken setLinkIndex:](self, "setLinkIndex:", 0);
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setStartTimeInNs:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_startTimeInNs = a3;
}

- (BOOL)hasStartTimeInNs
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHasStartTimeInNs:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (void)deleteStartTimeInNs
{
  -[ASRSchemaASRToken setStartTimeInNs:](self, "setStartTimeInNs:", 0);
  *(_WORD *)&self->_has &= ~2u;
}

- (void)setEndTimeInNs:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_endTimeInNs = a3;
}

- (BOOL)hasEndTimeInNs
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setHasEndTimeInNs:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (void)deleteEndTimeInNs
{
  -[ASRSchemaASRToken setEndTimeInNs:](self, "setEndTimeInNs:", 0);
  *(_WORD *)&self->_has &= ~4u;
}

- (void)setAppendSpaceAfter:(BOOL)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_appendSpaceAfter = a3;
}

- (BOOL)hasAppendSpaceAfter
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHasAppendSpaceAfter:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (void)deleteAppendSpaceAfter
{
  -[ASRSchemaASRToken setAppendSpaceAfter:](self, "setAppendSpaceAfter:", 0);
  *(_WORD *)&self->_has &= ~8u;
}

- (void)setSilenceStartTimeInNs:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_silenceStartTimeInNs = a3;
}

- (BOOL)hasSilenceStartTimeInNs
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHasSilenceStartTimeInNs:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (void)deleteSilenceStartTimeInNs
{
  -[ASRSchemaASRToken setSilenceStartTimeInNs:](self, "setSilenceStartTimeInNs:", 0);
  *(_WORD *)&self->_has &= ~0x10u;
}

- (void)setConfidence:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_confidence = a3;
}

- (BOOL)hasConfidence
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHasConfidence:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (void)deleteConfidence
{
  -[ASRSchemaASRToken setConfidence:](self, "setConfidence:", 0);
  *(_WORD *)&self->_has &= ~0x20u;
}

- (BOOL)hasPunctuationText
{
  return self->_punctuationText != 0;
}

- (void)deletePunctuationText
{
  -[ASRSchemaASRToken setPunctuationText:](self, "setPunctuationText:", 0);
}

- (void)setIsAutoPunctuation:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_isAutoPunctuation = a3;
}

- (BOOL)hasIsAutoPunctuation
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHasIsAutoPunctuation:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (void)deleteIsAutoPunctuation
{
  -[ASRSchemaASRToken setIsAutoPunctuation:](self, "setIsAutoPunctuation:", 0);
  *(_WORD *)&self->_has &= ~0x40u;
}

- (void)setIsModifiedByAutoPunctuation:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_isModifiedByAutoPunctuation = a3;
}

- (BOOL)hasIsModifiedByAutoPunctuation
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHasIsModifiedByAutoPunctuation:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (void)deleteIsModifiedByAutoPunctuation
{
  -[ASRSchemaASRToken setIsModifiedByAutoPunctuation:](self, "setIsModifiedByAutoPunctuation:", 0);
  *(_WORD *)&self->_has &= ~0x80u;
}

- (void)setGraphCost:(double)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_graphCost = a3;
}

- (BOOL)hasGraphCost
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHasGraphCost:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (void)deleteGraphCost
{
  -[ASRSchemaASRToken setGraphCost:](self, "setGraphCost:", 0.0);
  *(_WORD *)&self->_has &= ~0x100u;
}

- (void)setAcousticCost:(double)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_acousticCost = a3;
}

- (BOOL)hasAcousticCost
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setHasAcousticCost:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (void)deleteAcousticCost
{
  -[ASRSchemaASRToken setAcousticCost:](self, "setAcousticCost:", 0.0);
  *(_WORD *)&self->_has &= ~0x200u;
}

- (BOOL)hasEntityMetadata
{
  return self->_entityMetadata != 0;
}

- (void)deleteEntityMetadata
{
  -[ASRSchemaASRToken setEntityMetadata:](self, "setEntityMetadata:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return ASRSchemaASRTokenReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  void *v5;
  __int16 v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_20;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_22:
  PBDataWriterWriteUint64Field();
  if ((*(_WORD *)&self->_has & 0x20) != 0)
LABEL_7:
    PBDataWriterWriteInt32Field();
LABEL_8:
  -[ASRSchemaASRToken punctuationText](self, "punctuationText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  v6 = (__int16)self->_has;
  if ((v6 & 0x40) != 0)
  {
    PBDataWriterWriteBOOLField();
    v6 = (__int16)self->_has;
    if ((v6 & 0x80) == 0)
    {
LABEL_12:
      if ((v6 & 0x100) == 0)
        goto LABEL_13;
      goto LABEL_26;
    }
  }
  else if ((v6 & 0x80) == 0)
  {
    goto LABEL_12;
  }
  PBDataWriterWriteBOOLField();
  v6 = (__int16)self->_has;
  if ((v6 & 0x100) == 0)
  {
LABEL_13:
    if ((v6 & 0x200) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_26:
  PBDataWriterWriteDoubleField();
  if ((*(_WORD *)&self->_has & 0x200) != 0)
LABEL_14:
    PBDataWriterWriteDoubleField();
LABEL_15:
  -[ASRSchemaASRToken entityMetadata](self, "entityMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v10;
  if (v7)
  {
    -[ASRSchemaASRToken entityMetadata](self, "entityMetadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v8 = v10;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int16 *v4;
  $0D13DF4C2F2FBFA317151103AD3C5AF0 has;
  unsigned int v6;
  unsigned int linkIndex;
  int v8;
  unint64_t startTimeInNs;
  int v10;
  unint64_t endTimeInNs;
  int v12;
  int appendSpaceAfter;
  int v14;
  unint64_t silenceStartTimeInNs;
  int v16;
  int confidence;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  $0D13DF4C2F2FBFA317151103AD3C5AF0 v25;
  int v26;
  unsigned int v27;
  int isAutoPunctuation;
  int v29;
  int isModifiedByAutoPunctuation;
  int v31;
  double graphCost;
  double v33;
  int v34;
  double acousticCost;
  double v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  char v41;
  BOOL v42;

  v4 = (unsigned __int16 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_50;
  has = self->_has;
  v6 = v4[48];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_50;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    linkIndex = self->_linkIndex;
    if (linkIndex != objc_msgSend(v4, "linkIndex"))
      goto LABEL_50;
    has = self->_has;
    v6 = v4[48];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_50;
  if (v8)
  {
    startTimeInNs = self->_startTimeInNs;
    if (startTimeInNs != objc_msgSend(v4, "startTimeInNs"))
      goto LABEL_50;
    has = self->_has;
    v6 = v4[48];
  }
  v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_50;
  if (v10)
  {
    endTimeInNs = self->_endTimeInNs;
    if (endTimeInNs != objc_msgSend(v4, "endTimeInNs"))
      goto LABEL_50;
    has = self->_has;
    v6 = v4[48];
  }
  v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1))
    goto LABEL_50;
  if (v12)
  {
    appendSpaceAfter = self->_appendSpaceAfter;
    if (appendSpaceAfter != objc_msgSend(v4, "appendSpaceAfter"))
      goto LABEL_50;
    has = self->_has;
    v6 = v4[48];
  }
  v14 = (*(unsigned int *)&has >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1))
    goto LABEL_50;
  if (v14)
  {
    silenceStartTimeInNs = self->_silenceStartTimeInNs;
    if (silenceStartTimeInNs != objc_msgSend(v4, "silenceStartTimeInNs"))
      goto LABEL_50;
    has = self->_has;
    v6 = v4[48];
  }
  v16 = (*(unsigned int *)&has >> 5) & 1;
  if (v16 != ((v6 >> 5) & 1))
    goto LABEL_50;
  if (v16)
  {
    confidence = self->_confidence;
    if (confidence != objc_msgSend(v4, "confidence"))
      goto LABEL_50;
  }
  -[ASRSchemaASRToken punctuationText](self, "punctuationText");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "punctuationText");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v18 == 0) == (v19 != 0))
    goto LABEL_49;
  -[ASRSchemaASRToken punctuationText](self, "punctuationText");
  v20 = objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v21 = (void *)v20;
    -[ASRSchemaASRToken punctuationText](self, "punctuationText");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "punctuationText");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v22, "isEqual:", v23);

    if (!v24)
      goto LABEL_50;
  }
  else
  {

  }
  v25 = self->_has;
  v26 = (*(unsigned int *)&v25 >> 6) & 1;
  v27 = v4[48];
  if (v26 != ((v27 >> 6) & 1))
    goto LABEL_50;
  if (v26)
  {
    isAutoPunctuation = self->_isAutoPunctuation;
    if (isAutoPunctuation != objc_msgSend(v4, "isAutoPunctuation"))
      goto LABEL_50;
    v25 = self->_has;
    v27 = v4[48];
  }
  v29 = (*(unsigned int *)&v25 >> 7) & 1;
  if (v29 != ((v27 >> 7) & 1))
    goto LABEL_50;
  if (v29)
  {
    isModifiedByAutoPunctuation = self->_isModifiedByAutoPunctuation;
    if (isModifiedByAutoPunctuation != objc_msgSend(v4, "isModifiedByAutoPunctuation"))
      goto LABEL_50;
    v25 = self->_has;
    v27 = v4[48];
  }
  v31 = (*(unsigned int *)&v25 >> 8) & 1;
  if (v31 != ((v27 >> 8) & 1))
    goto LABEL_50;
  if (v31)
  {
    graphCost = self->_graphCost;
    objc_msgSend(v4, "graphCost");
    if (graphCost != v33)
      goto LABEL_50;
    v25 = self->_has;
    v27 = v4[48];
  }
  v34 = (*(unsigned int *)&v25 >> 9) & 1;
  if (v34 != ((v27 >> 9) & 1))
    goto LABEL_50;
  if (v34)
  {
    acousticCost = self->_acousticCost;
    objc_msgSend(v4, "acousticCost");
    if (acousticCost != v36)
      goto LABEL_50;
  }
  -[ASRSchemaASRToken entityMetadata](self, "entityMetadata");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entityMetadata");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v18 == 0) == (v19 != 0))
  {
LABEL_49:

    goto LABEL_50;
  }
  -[ASRSchemaASRToken entityMetadata](self, "entityMetadata");
  v37 = objc_claimAutoreleasedReturnValue();
  if (!v37)
  {

LABEL_53:
    v42 = 1;
    goto LABEL_51;
  }
  v38 = (void *)v37;
  -[ASRSchemaASRToken entityMetadata](self, "entityMetadata");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entityMetadata");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v39, "isEqual:", v40);

  if ((v41 & 1) != 0)
    goto LABEL_53;
LABEL_50:
  v42 = 0;
LABEL_51:

  return v42;
}

- (unint64_t)hash
{
  __int16 has;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  NSUInteger v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;
  double graphCost;
  double v12;
  long double v13;
  double v14;
  unint64_t v15;
  unint64_t v16;
  double acousticCost;
  double v18;
  long double v19;
  double v20;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v24 = 2654435761 * self->_linkIndex;
    if ((has & 2) != 0)
    {
LABEL_3:
      v23 = 2654435761u * self->_startTimeInNs;
      if ((has & 4) != 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else
  {
    v24 = 0;
    if ((has & 2) != 0)
      goto LABEL_3;
  }
  v23 = 0;
  if ((has & 4) != 0)
  {
LABEL_4:
    v22 = 2654435761u * self->_endTimeInNs;
    if ((has & 8) != 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  v22 = 0;
  if ((has & 8) != 0)
  {
LABEL_5:
    v4 = 2654435761 * self->_appendSpaceAfter;
    if ((has & 0x10) != 0)
      goto LABEL_6;
LABEL_12:
    v5 = 0;
    if ((has & 0x20) != 0)
      goto LABEL_7;
    goto LABEL_13;
  }
LABEL_11:
  v4 = 0;
  if ((has & 0x10) == 0)
    goto LABEL_12;
LABEL_6:
  v5 = 2654435761u * self->_silenceStartTimeInNs;
  if ((has & 0x20) != 0)
  {
LABEL_7:
    v6 = 2654435761 * self->_confidence;
    goto LABEL_14;
  }
LABEL_13:
  v6 = 0;
LABEL_14:
  v7 = -[NSString hash](self->_punctuationText, "hash");
  v8 = (__int16)self->_has;
  if ((v8 & 0x40) == 0)
  {
    v9 = 0;
    if ((v8 & 0x80) != 0)
      goto LABEL_16;
LABEL_22:
    v10 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_17;
LABEL_23:
    v15 = 0;
    goto LABEL_26;
  }
  v9 = 2654435761 * self->_isAutoPunctuation;
  if ((v8 & 0x80) == 0)
    goto LABEL_22;
LABEL_16:
  v10 = 2654435761 * self->_isModifiedByAutoPunctuation;
  if ((*(_WORD *)&self->_has & 0x100) == 0)
    goto LABEL_23;
LABEL_17:
  graphCost = self->_graphCost;
  v12 = -graphCost;
  if (graphCost >= 0.0)
    v12 = self->_graphCost;
  v13 = floor(v12 + 0.5);
  v14 = (v12 - v13) * 1.84467441e19;
  v15 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
  if (v14 >= 0.0)
  {
    if (v14 > 0.0)
      v15 += (unint64_t)v14;
  }
  else
  {
    v15 -= (unint64_t)fabs(v14);
  }
LABEL_26:
  if ((v8 & 0x200) != 0)
  {
    acousticCost = self->_acousticCost;
    v18 = -acousticCost;
    if (acousticCost >= 0.0)
      v18 = self->_acousticCost;
    v19 = floor(v18 + 0.5);
    v20 = (v18 - v19) * 1.84467441e19;
    v16 = 2654435761u * (unint64_t)fmod(v19, 1.84467441e19);
    if (v20 >= 0.0)
    {
      if (v20 > 0.0)
        v16 += (unint64_t)v20;
    }
    else
    {
      v16 -= (unint64_t)fabs(v20);
    }
  }
  else
  {
    v16 = 0;
  }
  return v23 ^ v24 ^ v22 ^ v4 ^ v5 ^ v6 ^ v9 ^ v10 ^ v15 ^ v16 ^ v7 ^ -[ASRSchemaASREntityMetadata hash](self->_entityMetadata, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int16 v13;
  void *v14;
  void *v15;
  void *v16;
  __int16 v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    -[ASRSchemaASRToken acousticCost](self, "acousticCost");
    objc_msgSend(v8, "numberWithDouble:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("acousticCost"));

    has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ASRSchemaASRToken appendSpaceAfter](self, "appendSpaceAfter"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("appendSpaceAfter"));

  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[ASRSchemaASRToken confidence](self, "confidence"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("confidence"));

  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[ASRSchemaASRToken endTimeInNs](self, "endTimeInNs"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("endTimeInNs"));

  }
LABEL_6:
  if (self->_entityMetadata)
  {
    -[ASRSchemaASRToken entityMetadata](self, "entityMetadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("entityMetadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("entityMetadata"));

    }
  }
  v13 = (__int16)self->_has;
  if ((v13 & 0x100) != 0)
  {
    v21 = (void *)MEMORY[0x1E0CB37E8];
    -[ASRSchemaASRToken graphCost](self, "graphCost");
    objc_msgSend(v21, "numberWithDouble:");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("graphCost"));

    v13 = (__int16)self->_has;
    if ((v13 & 0x40) == 0)
    {
LABEL_17:
      if ((v13 & 0x80) == 0)
        goto LABEL_18;
      goto LABEL_29;
    }
  }
  else if ((v13 & 0x40) == 0)
  {
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ASRSchemaASRToken isAutoPunctuation](self, "isAutoPunctuation"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("isAutoPunctuation"));

  v13 = (__int16)self->_has;
  if ((v13 & 0x80) == 0)
  {
LABEL_18:
    if ((v13 & 1) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }
LABEL_29:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ASRSchemaASRToken isModifiedByAutoPunctuation](self, "isModifiedByAutoPunctuation"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("isModifiedByAutoPunctuation"));

  if ((*(_WORD *)&self->_has & 1) != 0)
  {
LABEL_19:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[ASRSchemaASRToken linkIndex](self, "linkIndex"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("linkIndex"));

  }
LABEL_20:
  if (self->_punctuationText)
  {
    -[ASRSchemaASRToken punctuationText](self, "punctuationText");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("punctuationText"));

  }
  v17 = (__int16)self->_has;
  if ((v17 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[ASRSchemaASRToken silenceStartTimeInNs](self, "silenceStartTimeInNs"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("silenceStartTimeInNs"));

    v17 = (__int16)self->_has;
  }
  if ((v17 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[ASRSchemaASRToken startTimeInNs](self, "startTimeInNs"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("startTimeInNs"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ASRSchemaASRToken dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ASRSchemaASRToken)initWithJSON:(id)a3
{
  void *v4;
  ASRSchemaASRToken *v5;
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
    self = -[ASRSchemaASRToken initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ASRSchemaASRToken)initWithDictionary:(id)a3
{
  id v4;
  ASRSchemaASRToken *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  ASRSchemaASRToken *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  ASRSchemaASREntityMetadata *v27;
  ASRSchemaASRToken *v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  objc_super v35;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)ASRSchemaASRToken;
  v5 = -[ASRSchemaASRToken init](&v35, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("linkIndex"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v32 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ASRSchemaASRToken setLinkIndex:](v5, "setLinkIndex:", objc_msgSend(v6, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("startTimeInNs"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ASRSchemaASRToken setStartTimeInNs:](v5, "setStartTimeInNs:", objc_msgSend(v7, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("endTimeInNs"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ASRSchemaASRToken setEndTimeInNs:](v5, "setEndTimeInNs:", objc_msgSend(v8, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appendSpaceAfter"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ASRSchemaASRToken setAppendSpaceAfter:](v5, "setAppendSpaceAfter:", objc_msgSend(v9, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("silenceStartTimeInNs"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ASRSchemaASRToken setSilenceStartTimeInNs:](v5, "setSilenceStartTimeInNs:", objc_msgSend(v10, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("confidence"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ASRSchemaASRToken setConfidence:](v5, "setConfidence:", objc_msgSend(v11, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("punctuationText"));
    v12 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v34 = (void *)v12;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = v5;
      v14 = v11;
      v15 = v10;
      v16 = (void *)objc_msgSend(v34, "copy");
      -[ASRSchemaASRToken setPunctuationText:](v13, "setPunctuationText:", v16);

      v10 = v15;
      v11 = v14;
      v5 = v13;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isAutoPunctuation"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ASRSchemaASRToken setIsAutoPunctuation:](v5, "setIsAutoPunctuation:", objc_msgSend(v17, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isModifiedByAutoPunctuation"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v33 = v18;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ASRSchemaASRToken setIsModifiedByAutoPunctuation:](v5, "setIsModifiedByAutoPunctuation:", objc_msgSend(v18, "BOOLValue"));
    v31 = v17;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("graphCost"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v19, "doubleValue");
      -[ASRSchemaASRToken setGraphCost:](v5, "setGraphCost:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("acousticCost"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v20, "doubleValue");
      -[ASRSchemaASRToken setAcousticCost:](v5, "setAcousticCost:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entityMetadata"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v30 = v11;
      v22 = v10;
      v23 = v9;
      v24 = v8;
      v25 = v7;
      v26 = v19;
      v27 = -[ASRSchemaASREntityMetadata initWithDictionary:]([ASRSchemaASREntityMetadata alloc], "initWithDictionary:", v21);
      -[ASRSchemaASRToken setEntityMetadata:](v5, "setEntityMetadata:", v27);

      v19 = v26;
      v7 = v25;
      v8 = v24;
      v9 = v23;
      v10 = v22;
      v11 = v30;
    }
    v28 = v5;

  }
  return v5;
}

- (unsigned)linkIndex
{
  return self->_linkIndex;
}

- (unint64_t)startTimeInNs
{
  return self->_startTimeInNs;
}

- (unint64_t)endTimeInNs
{
  return self->_endTimeInNs;
}

- (BOOL)appendSpaceAfter
{
  return self->_appendSpaceAfter;
}

- (unint64_t)silenceStartTimeInNs
{
  return self->_silenceStartTimeInNs;
}

- (int)confidence
{
  return self->_confidence;
}

- (NSString)punctuationText
{
  return self->_punctuationText;
}

- (void)setPunctuationText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)isAutoPunctuation
{
  return self->_isAutoPunctuation;
}

- (BOOL)isModifiedByAutoPunctuation
{
  return self->_isModifiedByAutoPunctuation;
}

- (double)graphCost
{
  return self->_graphCost;
}

- (double)acousticCost
{
  return self->_acousticCost;
}

- (ASRSchemaASREntityMetadata)entityMetadata
{
  return self->_entityMetadata;
}

- (void)setEntityMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_entityMetadata, a3);
}

- (void)setHasPunctuationText:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasEntityMetadata:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityMetadata, 0);
  objc_storeStrong((id *)&self->_punctuationText, 0);
}

@end
