@implementation DODMLASRSchemaDODMLASRTranscriptMetadata

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setNumDocumentsRejected:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_numDocumentsRejected = a3;
}

- (BOOL)hasNumDocumentsRejected
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHasNumDocumentsRejected:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (void)deleteNumDocumentsRejected
{
  -[DODMLASRSchemaDODMLASRTranscriptMetadata setNumDocumentsRejected:](self, "setNumDocumentsRejected:", 0);
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setNumSentencesRejected:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_numSentencesRejected = a3;
}

- (BOOL)hasNumSentencesRejected
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHasNumSentencesRejected:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (void)deleteNumSentencesRejected
{
  -[DODMLASRSchemaDODMLASRTranscriptMetadata setNumSentencesRejected:](self, "setNumSentencesRejected:", 0);
  *(_WORD *)&self->_has &= ~2u;
}

- (void)setNumDocumentsAccepted:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_numDocumentsAccepted = a3;
}

- (BOOL)hasNumDocumentsAccepted
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setHasNumDocumentsAccepted:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (void)deleteNumDocumentsAccepted
{
  -[DODMLASRSchemaDODMLASRTranscriptMetadata setNumDocumentsAccepted:](self, "setNumDocumentsAccepted:", 0);
  *(_WORD *)&self->_has &= ~4u;
}

- (void)setNumSentencesAccepted:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_numSentencesAccepted = a3;
}

- (BOOL)hasNumSentencesAccepted
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHasNumSentencesAccepted:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (void)deleteNumSentencesAccepted
{
  -[DODMLASRSchemaDODMLASRTranscriptMetadata setNumSentencesAccepted:](self, "setNumSentencesAccepted:", 0);
  *(_WORD *)&self->_has &= ~8u;
}

- (void)setNumTokensAccepted:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_numTokensAccepted = a3;
}

- (BOOL)hasNumTokensAccepted
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHasNumTokensAccepted:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (void)deleteNumTokensAccepted
{
  -[DODMLASRSchemaDODMLASRTranscriptMetadata setNumTokensAccepted:](self, "setNumTokensAccepted:", 0);
  *(_WORD *)&self->_has &= ~0x10u;
}

- (void)setNumTokensOutOfVocabularyAccepted:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_numTokensOutOfVocabularyAccepted = a3;
}

- (BOOL)hasNumTokensOutOfVocabularyAccepted
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHasNumTokensOutOfVocabularyAccepted:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (void)deleteNumTokensOutOfVocabularyAccepted
{
  -[DODMLASRSchemaDODMLASRTranscriptMetadata setNumTokensOutOfVocabularyAccepted:](self, "setNumTokensOutOfVocabularyAccepted:", 0);
  *(_WORD *)&self->_has &= ~0x20u;
}

- (void)setNumDocumentsDictated:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_numDocumentsDictated = a3;
}

- (BOOL)hasNumDocumentsDictated
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHasNumDocumentsDictated:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (void)deleteNumDocumentsDictated
{
  -[DODMLASRSchemaDODMLASRTranscriptMetadata setNumDocumentsDictated:](self, "setNumDocumentsDictated:", 0);
  *(_WORD *)&self->_has &= ~0x40u;
}

- (void)setNumDocumentsTyped:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_numDocumentsTyped = a3;
}

- (BOOL)hasNumDocumentsTyped
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHasNumDocumentsTyped:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (void)deleteNumDocumentsTyped
{
  -[DODMLASRSchemaDODMLASRTranscriptMetadata setNumDocumentsTyped:](self, "setNumDocumentsTyped:", 0);
  *(_WORD *)&self->_has &= ~0x80u;
}

- (void)setNumTokensDictated:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_numTokensDictated = a3;
}

- (BOOL)hasNumTokensDictated
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHasNumTokensDictated:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (void)deleteNumTokensDictated
{
  -[DODMLASRSchemaDODMLASRTranscriptMetadata setNumTokensDictated:](self, "setNumTokensDictated:", 0);
  *(_WORD *)&self->_has &= ~0x100u;
}

- (void)setNumTokensTyped:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_numTokensTyped = a3;
}

- (BOOL)hasNumTokensTyped
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setHasNumTokensTyped:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (void)deleteNumTokensTyped
{
  -[DODMLASRSchemaDODMLASRTranscriptMetadata setNumTokensTyped:](self, "setNumTokensTyped:", 0);
  *(_WORD *)&self->_has &= ~0x200u;
}

- (void)setNumSentencesMungeRejected:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_numSentencesMungeRejected = a3;
}

- (BOOL)hasNumSentencesMungeRejected
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setHasNumSentencesMungeRejected:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (void)deleteNumSentencesMungeRejected
{
  -[DODMLASRSchemaDODMLASRTranscriptMetadata setNumSentencesMungeRejected:](self, "setNumSentencesMungeRejected:", 0);
  *(_WORD *)&self->_has &= ~0x400u;
}

- (void)setNumSentencesMungeChanged:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_numSentencesMungeChanged = a3;
}

- (BOOL)hasNumSentencesMungeChanged
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setHasNumSentencesMungeChanged:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (void)deleteNumSentencesMungeChanged
{
  -[DODMLASRSchemaDODMLASRTranscriptMetadata setNumSentencesMungeChanged:](self, "setNumSentencesMungeChanged:", 0);
  *(_WORD *)&self->_has &= ~0x800u;
}

- (void)setNumTokensEstimatedRejected:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_numTokensEstimatedRejected = a3;
}

- (BOOL)hasNumTokensEstimatedRejected
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setHasNumTokensEstimatedRejected:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (void)deleteNumTokensEstimatedRejected
{
  -[DODMLASRSchemaDODMLASRTranscriptMetadata setNumTokensEstimatedRejected:](self, "setNumTokensEstimatedRejected:", 0);
  *(_WORD *)&self->_has &= ~0x1000u;
}

- (void)setNumTokensEstimatedExamined:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_numTokensEstimatedExamined = a3;
}

- (BOOL)hasNumTokensEstimatedExamined
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setHasNumTokensEstimatedExamined:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (void)deleteNumTokensEstimatedExamined
{
  -[DODMLASRSchemaDODMLASRTranscriptMetadata setNumTokensEstimatedExamined:](self, "setNumTokensEstimatedExamined:", 0);
  *(_WORD *)&self->_has &= ~0x2000u;
}

- (BOOL)readFrom:(id)a3
{
  return DODMLASRSchemaDODMLASRTranscriptMetadataReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  id v5;

  v5 = a3;
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
      goto LABEL_19;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_11:
    if ((has & 0x400) == 0)
      goto LABEL_12;
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_12:
    if ((has & 0x800) == 0)
      goto LABEL_13;
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_13:
    if ((has & 0x1000) == 0)
      goto LABEL_14;
LABEL_29:
    PBDataWriterWriteUint32Field();
    if ((*(_WORD *)&self->_has & 0x2000) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_28:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x1000) != 0)
    goto LABEL_29;
LABEL_14:
  if ((has & 0x2000) != 0)
LABEL_15:
    PBDataWriterWriteUint32Field();
LABEL_16:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int16 *v4;
  $516878B6B6FDB779A67A404946CFD007 has;
  unsigned int v6;
  unsigned int numDocumentsRejected;
  int v8;
  unsigned int numSentencesRejected;
  int v10;
  unsigned int numDocumentsAccepted;
  int v12;
  unsigned int numSentencesAccepted;
  int v14;
  unsigned int numTokensAccepted;
  int v16;
  unsigned int numTokensOutOfVocabularyAccepted;
  int v18;
  unsigned int numDocumentsDictated;
  int v20;
  unsigned int numDocumentsTyped;
  int v22;
  unsigned int numTokensDictated;
  int v24;
  unsigned int numTokensTyped;
  int v26;
  unsigned int numSentencesMungeRejected;
  int v28;
  unsigned int numSentencesMungeChanged;
  int v30;
  unsigned int numTokensEstimatedRejected;
  int v32;
  unsigned int numTokensEstimatedExamined;
  BOOL v34;

  v4 = (unsigned __int16 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_58;
  has = self->_has;
  v6 = v4[32];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_58;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    numDocumentsRejected = self->_numDocumentsRejected;
    if (numDocumentsRejected != objc_msgSend(v4, "numDocumentsRejected"))
      goto LABEL_58;
    has = self->_has;
    v6 = v4[32];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_58;
  if (v8)
  {
    numSentencesRejected = self->_numSentencesRejected;
    if (numSentencesRejected != objc_msgSend(v4, "numSentencesRejected"))
      goto LABEL_58;
    has = self->_has;
    v6 = v4[32];
  }
  v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_58;
  if (v10)
  {
    numDocumentsAccepted = self->_numDocumentsAccepted;
    if (numDocumentsAccepted != objc_msgSend(v4, "numDocumentsAccepted"))
      goto LABEL_58;
    has = self->_has;
    v6 = v4[32];
  }
  v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1))
    goto LABEL_58;
  if (v12)
  {
    numSentencesAccepted = self->_numSentencesAccepted;
    if (numSentencesAccepted != objc_msgSend(v4, "numSentencesAccepted"))
      goto LABEL_58;
    has = self->_has;
    v6 = v4[32];
  }
  v14 = (*(unsigned int *)&has >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1))
    goto LABEL_58;
  if (v14)
  {
    numTokensAccepted = self->_numTokensAccepted;
    if (numTokensAccepted != objc_msgSend(v4, "numTokensAccepted"))
      goto LABEL_58;
    has = self->_has;
    v6 = v4[32];
  }
  v16 = (*(unsigned int *)&has >> 5) & 1;
  if (v16 != ((v6 >> 5) & 1))
    goto LABEL_58;
  if (v16)
  {
    numTokensOutOfVocabularyAccepted = self->_numTokensOutOfVocabularyAccepted;
    if (numTokensOutOfVocabularyAccepted != objc_msgSend(v4, "numTokensOutOfVocabularyAccepted"))
      goto LABEL_58;
    has = self->_has;
    v6 = v4[32];
  }
  v18 = (*(unsigned int *)&has >> 6) & 1;
  if (v18 != ((v6 >> 6) & 1))
    goto LABEL_58;
  if (v18)
  {
    numDocumentsDictated = self->_numDocumentsDictated;
    if (numDocumentsDictated != objc_msgSend(v4, "numDocumentsDictated"))
      goto LABEL_58;
    has = self->_has;
    v6 = v4[32];
  }
  v20 = (*(unsigned int *)&has >> 7) & 1;
  if (v20 != ((v6 >> 7) & 1))
    goto LABEL_58;
  if (v20)
  {
    numDocumentsTyped = self->_numDocumentsTyped;
    if (numDocumentsTyped != objc_msgSend(v4, "numDocumentsTyped"))
      goto LABEL_58;
    has = self->_has;
    v6 = v4[32];
  }
  v22 = (*(unsigned int *)&has >> 8) & 1;
  if (v22 != ((v6 >> 8) & 1))
    goto LABEL_58;
  if (v22)
  {
    numTokensDictated = self->_numTokensDictated;
    if (numTokensDictated != objc_msgSend(v4, "numTokensDictated"))
      goto LABEL_58;
    has = self->_has;
    v6 = v4[32];
  }
  v24 = (*(unsigned int *)&has >> 9) & 1;
  if (v24 != ((v6 >> 9) & 1))
    goto LABEL_58;
  if (v24)
  {
    numTokensTyped = self->_numTokensTyped;
    if (numTokensTyped != objc_msgSend(v4, "numTokensTyped"))
      goto LABEL_58;
    has = self->_has;
    v6 = v4[32];
  }
  v26 = (*(unsigned int *)&has >> 10) & 1;
  if (v26 != ((v6 >> 10) & 1))
    goto LABEL_58;
  if (v26)
  {
    numSentencesMungeRejected = self->_numSentencesMungeRejected;
    if (numSentencesMungeRejected != objc_msgSend(v4, "numSentencesMungeRejected"))
      goto LABEL_58;
    has = self->_has;
    v6 = v4[32];
  }
  v28 = (*(unsigned int *)&has >> 11) & 1;
  if (v28 != ((v6 >> 11) & 1))
    goto LABEL_58;
  if (v28)
  {
    numSentencesMungeChanged = self->_numSentencesMungeChanged;
    if (numSentencesMungeChanged != objc_msgSend(v4, "numSentencesMungeChanged"))
      goto LABEL_58;
    has = self->_has;
    v6 = v4[32];
  }
  v30 = (*(unsigned int *)&has >> 12) & 1;
  if (v30 != ((v6 >> 12) & 1))
    goto LABEL_58;
  if (v30)
  {
    numTokensEstimatedRejected = self->_numTokensEstimatedRejected;
    if (numTokensEstimatedRejected == objc_msgSend(v4, "numTokensEstimatedRejected"))
    {
      has = self->_has;
      v6 = v4[32];
      goto LABEL_54;
    }
LABEL_58:
    v34 = 0;
    goto LABEL_59;
  }
LABEL_54:
  v32 = (*(unsigned int *)&has >> 13) & 1;
  if (v32 != ((v6 >> 13) & 1))
    goto LABEL_58;
  if (v32)
  {
    numTokensEstimatedExamined = self->_numTokensEstimatedExamined;
    if (numTokensEstimatedExamined != objc_msgSend(v4, "numTokensEstimatedExamined"))
      goto LABEL_58;
  }
  v34 = 1;
LABEL_59:

  return v34;
}

- (unint64_t)hash
{
  __int16 has;
  uint64_t v3;
  uint64_t v4;
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
  uint64_t v16;

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v3 = 2654435761 * self->_numDocumentsRejected;
    if ((has & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_numSentencesRejected;
      if ((has & 4) != 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else
  {
    v3 = 0;
    if ((has & 2) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((has & 4) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_numDocumentsAccepted;
    if ((has & 8) != 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  v5 = 0;
  if ((has & 8) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_numSentencesAccepted;
    if ((has & 0x10) != 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  v6 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_numTokensAccepted;
    if ((has & 0x20) != 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  v7 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_numTokensOutOfVocabularyAccepted;
    if ((has & 0x40) != 0)
      goto LABEL_8;
    goto LABEL_22;
  }
LABEL_21:
  v8 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_8:
    v9 = 2654435761 * self->_numDocumentsDictated;
    if ((has & 0x80) != 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_22:
  v9 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_9:
    v10 = 2654435761 * self->_numDocumentsTyped;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_10;
    goto LABEL_24;
  }
LABEL_23:
  v10 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_10:
    v11 = 2654435761 * self->_numTokensDictated;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_11;
    goto LABEL_25;
  }
LABEL_24:
  v11 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_11:
    v12 = 2654435761 * self->_numTokensTyped;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_12;
    goto LABEL_26;
  }
LABEL_25:
  v12 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_12:
    v13 = 2654435761 * self->_numSentencesMungeRejected;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
      goto LABEL_13;
    goto LABEL_27;
  }
LABEL_26:
  v13 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_13:
    v14 = 2654435761 * self->_numSentencesMungeChanged;
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
      goto LABEL_14;
LABEL_28:
    v15 = 0;
    if ((*(_WORD *)&self->_has & 0x2000) != 0)
      goto LABEL_15;
LABEL_29:
    v16 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16;
  }
LABEL_27:
  v14 = 0;
  if ((*(_WORD *)&self->_has & 0x1000) == 0)
    goto LABEL_28;
LABEL_14:
  v15 = 2654435761 * self->_numTokensEstimatedRejected;
  if ((*(_WORD *)&self->_has & 0x2000) == 0)
    goto LABEL_29;
LABEL_15:
  v16 = 2654435761 * self->_numTokensEstimatedExamined;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16;
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  void *v5;
  void *v7;
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[DODMLASRSchemaDODMLASRTranscriptMetadata numDocumentsAccepted](self, "numDocumentsAccepted"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("numDocumentsAccepted"));

    has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[DODMLASRSchemaDODMLASRTranscriptMetadata numDocumentsDictated](self, "numDocumentsDictated"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("numDocumentsDictated"));

  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[DODMLASRSchemaDODMLASRTranscriptMetadata numDocumentsRejected](self, "numDocumentsRejected"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("numDocumentsRejected"));

  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[DODMLASRSchemaDODMLASRTranscriptMetadata numDocumentsTyped](self, "numDocumentsTyped"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("numDocumentsTyped"));

  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x800) == 0)
      goto LABEL_7;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[DODMLASRSchemaDODMLASRTranscriptMetadata numSentencesAccepted](self, "numSentencesAccepted"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("numSentencesAccepted"));

  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_7:
    if ((has & 0x400) == 0)
      goto LABEL_8;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[DODMLASRSchemaDODMLASRTranscriptMetadata numSentencesMungeChanged](self, "numSentencesMungeChanged"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("numSentencesMungeChanged"));

  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_8:
    if ((has & 2) == 0)
      goto LABEL_9;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[DODMLASRSchemaDODMLASRTranscriptMetadata numSentencesMungeRejected](self, "numSentencesMungeRejected"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("numSentencesMungeRejected"));

  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[DODMLASRSchemaDODMLASRTranscriptMetadata numSentencesRejected](self, "numSentencesRejected"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("numSentencesRejected"));

  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[DODMLASRSchemaDODMLASRTranscriptMetadata numTokensAccepted](self, "numTokensAccepted"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("numTokensAccepted"));

  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_11:
    if ((has & 0x2000) == 0)
      goto LABEL_12;
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[DODMLASRSchemaDODMLASRTranscriptMetadata numTokensDictated](self, "numTokensDictated"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("numTokensDictated"));

  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_12:
    if ((has & 0x1000) == 0)
      goto LABEL_13;
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[DODMLASRSchemaDODMLASRTranscriptMetadata numTokensEstimatedExamined](self, "numTokensEstimatedExamined"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("numTokensEstimatedExamined"));

  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_13:
    if ((has & 0x20) == 0)
      goto LABEL_14;
LABEL_29:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[DODMLASRSchemaDODMLASRTranscriptMetadata numTokensOutOfVocabularyAccepted](self, "numTokensOutOfVocabularyAccepted"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("numTokensOutOfVocabularyAccepted"));

    if ((*(_WORD *)&self->_has & 0x200) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_28:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[DODMLASRSchemaDODMLASRTranscriptMetadata numTokensEstimatedRejected](self, "numTokensEstimatedRejected"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("numTokensEstimatedRejected"));

  has = (__int16)self->_has;
  if ((has & 0x20) != 0)
    goto LABEL_29;
LABEL_14:
  if ((has & 0x200) != 0)
  {
LABEL_15:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[DODMLASRSchemaDODMLASRTranscriptMetadata numTokensTyped](self, "numTokensTyped"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("numTokensTyped"));

  }
LABEL_16:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[DODMLASRSchemaDODMLASRTranscriptMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (DODMLASRSchemaDODMLASRTranscriptMetadata)initWithJSON:(id)a3
{
  void *v4;
  DODMLASRSchemaDODMLASRTranscriptMetadata *v5;
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
    self = -[DODMLASRSchemaDODMLASRTranscriptMetadata initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (DODMLASRSchemaDODMLASRTranscriptMetadata)initWithDictionary:(id)a3
{
  id v4;
  DODMLASRSchemaDODMLASRTranscriptMetadata *v5;
  void *v6;
  void *v7;
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
  void *v20;
  DODMLASRSchemaDODMLASRTranscriptMetadata *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)DODMLASRSchemaDODMLASRTranscriptMetadata;
  v5 = -[DODMLASRSchemaDODMLASRTranscriptMetadata init](&v30, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numDocumentsRejected"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DODMLASRSchemaDODMLASRTranscriptMetadata setNumDocumentsRejected:](v5, "setNumDocumentsRejected:", objc_msgSend(v6, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numSentencesRejected"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DODMLASRSchemaDODMLASRTranscriptMetadata setNumSentencesRejected:](v5, "setNumSentencesRejected:", objc_msgSend(v7, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numDocumentsAccepted"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DODMLASRSchemaDODMLASRTranscriptMetadata setNumDocumentsAccepted:](v5, "setNumDocumentsAccepted:", objc_msgSend(v8, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numSentencesAccepted"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DODMLASRSchemaDODMLASRTranscriptMetadata setNumSentencesAccepted:](v5, "setNumSentencesAccepted:", objc_msgSend(v9, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numTokensAccepted"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DODMLASRSchemaDODMLASRTranscriptMetadata setNumTokensAccepted:](v5, "setNumTokensAccepted:", objc_msgSend(v10, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numTokensOutOfVocabularyAccepted"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DODMLASRSchemaDODMLASRTranscriptMetadata setNumTokensOutOfVocabularyAccepted:](v5, "setNumTokensOutOfVocabularyAccepted:", objc_msgSend(v11, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numDocumentsDictated"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DODMLASRSchemaDODMLASRTranscriptMetadata setNumDocumentsDictated:](v5, "setNumDocumentsDictated:", objc_msgSend(v12, "unsignedIntValue"));
    v29 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numDocumentsTyped"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DODMLASRSchemaDODMLASRTranscriptMetadata setNumDocumentsTyped:](v5, "setNumDocumentsTyped:", objc_msgSend(v13, "unsignedIntValue"));
    v23 = v13;
    v28 = v7;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numTokensDictated"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DODMLASRSchemaDODMLASRTranscriptMetadata setNumTokensDictated:](v5, "setNumTokensDictated:", objc_msgSend(v14, "unsignedIntValue"));
    v27 = v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numTokensTyped"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DODMLASRSchemaDODMLASRTranscriptMetadata setNumTokensTyped:](v5, "setNumTokensTyped:", objc_msgSend(v15, "unsignedIntValue"));
    v26 = v9;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numSentencesMungeRejected"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DODMLASRSchemaDODMLASRTranscriptMetadata setNumSentencesMungeRejected:](v5, "setNumSentencesMungeRejected:", objc_msgSend(v16, "unsignedIntValue"));
    v24 = v12;
    v25 = v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numSentencesMungeChanged"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DODMLASRSchemaDODMLASRTranscriptMetadata setNumSentencesMungeChanged:](v5, "setNumSentencesMungeChanged:", objc_msgSend(v17, "unsignedIntValue"));
    v18 = v11;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numTokensEstimatedRejected"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DODMLASRSchemaDODMLASRTranscriptMetadata setNumTokensEstimatedRejected:](v5, "setNumTokensEstimatedRejected:", objc_msgSend(v19, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numTokensEstimatedExamined"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DODMLASRSchemaDODMLASRTranscriptMetadata setNumTokensEstimatedExamined:](v5, "setNumTokensEstimatedExamined:", objc_msgSend(v20, "unsignedIntValue"));
    v21 = v5;

  }
  return v5;
}

- (unsigned)numDocumentsRejected
{
  return self->_numDocumentsRejected;
}

- (unsigned)numSentencesRejected
{
  return self->_numSentencesRejected;
}

- (unsigned)numDocumentsAccepted
{
  return self->_numDocumentsAccepted;
}

- (unsigned)numSentencesAccepted
{
  return self->_numSentencesAccepted;
}

- (unsigned)numTokensAccepted
{
  return self->_numTokensAccepted;
}

- (unsigned)numTokensOutOfVocabularyAccepted
{
  return self->_numTokensOutOfVocabularyAccepted;
}

- (unsigned)numDocumentsDictated
{
  return self->_numDocumentsDictated;
}

- (unsigned)numDocumentsTyped
{
  return self->_numDocumentsTyped;
}

- (unsigned)numTokensDictated
{
  return self->_numTokensDictated;
}

- (unsigned)numTokensTyped
{
  return self->_numTokensTyped;
}

- (unsigned)numSentencesMungeRejected
{
  return self->_numSentencesMungeRejected;
}

- (unsigned)numSentencesMungeChanged
{
  return self->_numSentencesMungeChanged;
}

- (unsigned)numTokensEstimatedRejected
{
  return self->_numTokensEstimatedRejected;
}

- (unsigned)numTokensEstimatedExamined
{
  return self->_numTokensEstimatedExamined;
}

@end
