@implementation DonationSchemaSDSpeechSampleDonation

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
  v9.super_class = (Class)DonationSchemaSDSpeechSampleDonation;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DonationSchemaSDSpeechSampleDonation donationID](self, "donationID", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[DonationSchemaSDSpeechSampleDonation deleteDonationID](self, "deleteDonationID");
  return v5;
}

- (BOOL)hasDonationID
{
  return self->_donationID != 0;
}

- (void)deleteDonationID
{
  -[DonationSchemaSDSpeechSampleDonation setDonationID:](self, "setDonationID:", 0);
}

- (BOOL)hasDonorBundleID
{
  return self->_donorBundleID != 0;
}

- (void)deleteDonorBundleID
{
  -[DonationSchemaSDSpeechSampleDonation setDonorBundleID:](self, "setDonorBundleID:", 0);
}

- (void)setCaptureDate:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_captureDate = a3;
}

- (BOOL)hasCaptureDate
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasCaptureDate:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteCaptureDate
{
  -[DonationSchemaSDSpeechSampleDonation setCaptureDate:](self, "setCaptureDate:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)clearAttributes
{
  -[NSArray removeAllObjects](self->_attributes, "removeAllObjects");
}

- (void)addAttributes:(int)a3
{
  uint64_t v3;
  NSArray *attributes;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v3 = *(_QWORD *)&a3;
  attributes = self->_attributes;
  if (!attributes)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_attributes;
    self->_attributes = v6;

    attributes = self->_attributes;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](attributes, "addObject:", v8);

}

- (unint64_t)attributesCount
{
  return -[NSArray count](self->_attributes, "count");
}

- (int)attributesAtIndex:(unint64_t)a3
{
  void *v3;
  int v4;

  -[NSArray objectAtIndexedSubscript:](self->_attributes, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (void)setAudioCaptureDevice:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_audioCaptureDevice = a3;
}

- (BOOL)hasAudioCaptureDevice
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasAudioCaptureDevice:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteAudioCaptureDevice
{
  -[DonationSchemaSDSpeechSampleDonation setAudioCaptureDevice:](self, "setAudioCaptureDevice:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setLocale:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_locale = a3;
}

- (BOOL)hasLocale
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasLocale:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteLocale
{
  -[DonationSchemaSDSpeechSampleDonation setLocale:](self, "setLocale:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setAsrTask:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_asrTask = a3;
}

- (BOOL)hasAsrTask
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasAsrTask:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteAsrTask
{
  -[DonationSchemaSDSpeechSampleDonation setAsrTask:](self, "setAsrTask:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (BOOL)hasTranscription
{
  return self->_transcription != 0;
}

- (void)deleteTranscription
{
  -[DonationSchemaSDSpeechSampleDonation setTranscription:](self, "setTranscription:", 0);
}

- (BOOL)hasExpected
{
  return self->_expected != 0;
}

- (void)deleteExpected
{
  -[DonationSchemaSDSpeechSampleDonation setExpected:](self, "setExpected:", 0);
}

- (void)setEvaluation:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_evaluation = a3;
}

- (BOOL)hasEvaluation
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasEvaluation:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (void)deleteEvaluation
{
  -[DonationSchemaSDSpeechSampleDonation setEvaluation:](self, "setEvaluation:", 0);
  *(_BYTE *)&self->_has &= ~0x10u;
}

- (BOOL)readFrom:(id)a3
{
  return DonationSchemaSDSpeechSampleDonationReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  char has;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[DonationSchemaSDSpeechSampleDonation donationID](self, "donationID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[DonationSchemaSDSpeechSampleDonation donationID](self, "donationID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[DonationSchemaSDSpeechSampleDonation donorBundleID](self, "donorBundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = self->_attributes;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "intValue", (_QWORD)v16);
        PBDataWriterWriteInt32Field();
      }
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_16:
      if ((has & 8) == 0)
        goto LABEL_18;
      goto LABEL_17;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_16;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_BYTE *)&self->_has & 8) != 0)
LABEL_17:
    PBDataWriterWriteInt32Field();
LABEL_18:
  -[DonationSchemaSDSpeechSampleDonation transcription](self, "transcription", (_QWORD)v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    PBDataWriterWriteStringField();
  -[DonationSchemaSDSpeechSampleDonation expected](self, "expected");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    PBDataWriterWriteInt32Field();

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  unint64_t captureDate;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  $1F6BF52D4E9FB4461D6CDD5C73881346 has;
  int v24;
  unsigned int v25;
  int audioCaptureDevice;
  int v27;
  int locale;
  int v29;
  int asrTask;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  BOOL v41;
  int v43;
  int evaluation;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_41;
  -[DonationSchemaSDSpeechSampleDonation donationID](self, "donationID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "donationID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_40;
  -[DonationSchemaSDSpeechSampleDonation donationID](self, "donationID");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[DonationSchemaSDSpeechSampleDonation donationID](self, "donationID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "donationID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_41;
  }
  else
  {

  }
  -[DonationSchemaSDSpeechSampleDonation donorBundleID](self, "donorBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "donorBundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_40;
  -[DonationSchemaSDSpeechSampleDonation donorBundleID](self, "donorBundleID");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[DonationSchemaSDSpeechSampleDonation donorBundleID](self, "donorBundleID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "donorBundleID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_41;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) != (v4[76] & 1))
    goto LABEL_41;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    captureDate = self->_captureDate;
    if (captureDate != objc_msgSend(v4, "captureDate"))
      goto LABEL_41;
  }
  -[DonationSchemaSDSpeechSampleDonation attributes](self, "attributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_40;
  -[DonationSchemaSDSpeechSampleDonation attributes](self, "attributes");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[DonationSchemaSDSpeechSampleDonation attributes](self, "attributes");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "attributes");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_41;
  }
  else
  {

  }
  has = self->_has;
  v24 = (*(unsigned int *)&has >> 1) & 1;
  v25 = v4[76];
  if (v24 != ((v25 >> 1) & 1))
    goto LABEL_41;
  if (v24)
  {
    audioCaptureDevice = self->_audioCaptureDevice;
    if (audioCaptureDevice != objc_msgSend(v4, "audioCaptureDevice"))
      goto LABEL_41;
    has = self->_has;
    v25 = v4[76];
  }
  v27 = (*(unsigned int *)&has >> 2) & 1;
  if (v27 != ((v25 >> 2) & 1))
    goto LABEL_41;
  if (v27)
  {
    locale = self->_locale;
    if (locale != objc_msgSend(v4, "locale"))
      goto LABEL_41;
    has = self->_has;
    v25 = v4[76];
  }
  v29 = (*(unsigned int *)&has >> 3) & 1;
  if (v29 != ((v25 >> 3) & 1))
    goto LABEL_41;
  if (v29)
  {
    asrTask = self->_asrTask;
    if (asrTask != objc_msgSend(v4, "asrTask"))
      goto LABEL_41;
  }
  -[DonationSchemaSDSpeechSampleDonation transcription](self, "transcription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transcription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_40;
  -[DonationSchemaSDSpeechSampleDonation transcription](self, "transcription");
  v31 = objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    v32 = (void *)v31;
    -[DonationSchemaSDSpeechSampleDonation transcription](self, "transcription");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "transcription");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v33, "isEqual:", v34);

    if (!v35)
      goto LABEL_41;
  }
  else
  {

  }
  -[DonationSchemaSDSpeechSampleDonation expected](self, "expected");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "expected");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_40:

    goto LABEL_41;
  }
  -[DonationSchemaSDSpeechSampleDonation expected](self, "expected");
  v36 = objc_claimAutoreleasedReturnValue();
  if (v36)
  {
    v37 = (void *)v36;
    -[DonationSchemaSDSpeechSampleDonation expected](self, "expected");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "expected");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v38, "isEqual:", v39);

    if (!v40)
      goto LABEL_41;
  }
  else
  {

  }
  v43 = (*(_BYTE *)&self->_has >> 4) & 1;
  if (v43 == ((v4[76] >> 4) & 1))
  {
    if (!v43 || (evaluation = self->_evaluation, evaluation == objc_msgSend(v4, "evaluation")))
    {
      v41 = 1;
      goto LABEL_42;
    }
  }
LABEL_41:
  v41 = 0;
LABEL_42:

  return v41;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSUInteger v9;
  NSUInteger v10;
  uint64_t v11;
  unint64_t v13;

  v13 = -[SISchemaUUID hash](self->_donationID, "hash");
  v3 = -[NSString hash](self->_donorBundleID, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761u * self->_captureDate;
  else
    v4 = 0;
  v5 = -[NSArray hash](self->_attributes, "hash");
  if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_6;
LABEL_9:
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_7;
    goto LABEL_10;
  }
  v6 = 2654435761 * self->_audioCaptureDevice;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_9;
LABEL_6:
  v7 = 2654435761 * self->_locale;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_asrTask;
    goto LABEL_11;
  }
LABEL_10:
  v8 = 0;
LABEL_11:
  v9 = -[NSString hash](self->_transcription, "hash");
  v10 = -[NSString hash](self->_expected, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    v11 = 2654435761 * self->_evaluation;
  else
    v11 = 0;
  return v3 ^ v13 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (id)dictionaryRepresentation
{
  void *v3;
  unsigned int v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  char has;
  unsigned int v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  const __CFString *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  const __CFString *v23;
  void *v24;
  void *v25;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v4 = -[DonationSchemaSDSpeechSampleDonation asrTask](self, "asrTask") - 1;
    if (v4 > 8)
      v5 = CFSTR("SDASRTASK_UNKNOWN");
    else
      v5 = off_1E563C520[v4];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("asrTask"));
  }
  if (-[NSArray count](self->_attributes, "count"))
  {
    -[DonationSchemaSDSpeechSampleDonation attributes](self, "attributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("attributes"));

  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v9 = -[DonationSchemaSDSpeechSampleDonation audioCaptureDevice](self, "audioCaptureDevice") - 1;
    if (v9 > 0xB)
      v10 = CFSTR("SDAUDIOCAPTUREDEVICE_UNKNOWN");
    else
      v10 = off_1E563C568[v9];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("audioCaptureDevice"));
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[DonationSchemaSDSpeechSampleDonation captureDate](self, "captureDate"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("captureDate"));

  }
  if (self->_donationID)
  {
    -[DonationSchemaSDSpeechSampleDonation donationID](self, "donationID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("donationID"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("donationID"));

    }
  }
  if (self->_donorBundleID)
  {
    -[DonationSchemaSDSpeechSampleDonation donorBundleID](self, "donorBundleID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("donorBundleID"));

  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v17 = -[DonationSchemaSDSpeechSampleDonation evaluation](self, "evaluation");
    v18 = CFSTR("SDTRANSCRIPTIONEVALUATION_UNKNOWN");
    if (v17 == 1)
      v18 = CFSTR("SDTRANSCRIPTIONEVALUATION_ACCURATE");
    if (v17 == 2)
      v19 = CFSTR("SDTRANSCRIPTIONEVALUATION_INACCURATE");
    else
      v19 = v18;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("evaluation"));
  }
  if (self->_expected)
  {
    -[DonationSchemaSDSpeechSampleDonation expected](self, "expected");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v20, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("expected"));

  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v22 = -[DonationSchemaSDSpeechSampleDonation locale](self, "locale") - 1;
    if (v22 > 0x3D)
      v23 = CFSTR("LOCALE_UNKNOWN_LOCALE");
    else
      v23 = off_1E563C5C8[v22];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("locale"));
  }
  if (self->_transcription)
  {
    -[DonationSchemaSDSpeechSampleDonation transcription](self, "transcription");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v24, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("transcription"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[DonationSchemaSDSpeechSampleDonation dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (DonationSchemaSDSpeechSampleDonation)initWithJSON:(id)a3
{
  void *v4;
  DonationSchemaSDSpeechSampleDonation *v5;
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
    self = -[DonationSchemaSDSpeechSampleDonation initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (DonationSchemaSDSpeechSampleDonation)initWithDictionary:(id)a3
{
  id v4;
  DonationSchemaSDSpeechSampleDonation *v5;
  uint64_t v6;
  SISchemaUUID *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  DonationSchemaSDSpeechSampleDonation *v26;
  void *v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  objc_super v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)DonationSchemaSDSpeechSampleDonation;
  v5 = -[DonationSchemaSDSpeechSampleDonation init](&v35, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("donationID"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[DonationSchemaSDSpeechSampleDonation setDonationID:](v5, "setDonationID:", v7);

    }
    v30 = (void *)v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("donorBundleID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[DonationSchemaSDSpeechSampleDonation setDonorBundleID:](v5, "setDonorBundleID:", v9);

    }
    v29 = v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("captureDate"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DonationSchemaSDSpeechSampleDonation setCaptureDate:](v5, "setCaptureDate:", objc_msgSend(v10, "unsignedLongLongValue"));
    v28 = v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("attributes"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v12 = v11;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v32;
        do
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v32 != v15)
              objc_enumerationMutation(v12);
            v17 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v16);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              -[DonationSchemaSDSpeechSampleDonation addAttributes:](v5, "addAttributes:", objc_msgSend(v17, "intValue"));
            ++v16;
          }
          while (v14 != v16);
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
        }
        while (v14);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioCaptureDevice"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DonationSchemaSDSpeechSampleDonation setAudioCaptureDevice:](v5, "setAudioCaptureDevice:", objc_msgSend(v18, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("locale"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DonationSchemaSDSpeechSampleDonation setLocale:](v5, "setLocale:", objc_msgSend(v19, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("asrTask"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DonationSchemaSDSpeechSampleDonation setAsrTask:](v5, "setAsrTask:", objc_msgSend(v20, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("transcription"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = (void *)objc_msgSend(v21, "copy");
      -[DonationSchemaSDSpeechSampleDonation setTranscription:](v5, "setTranscription:", v22);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("expected"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v24 = (void *)objc_msgSend(v23, "copy");
      -[DonationSchemaSDSpeechSampleDonation setExpected:](v5, "setExpected:", v24);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("evaluation"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DonationSchemaSDSpeechSampleDonation setEvaluation:](v5, "setEvaluation:", objc_msgSend(v25, "intValue"));
    v26 = v5;

  }
  return v5;
}

- (SISchemaUUID)donationID
{
  return self->_donationID;
}

- (void)setDonationID:(id)a3
{
  objc_storeStrong((id *)&self->_donationID, a3);
}

- (NSString)donorBundleID
{
  return self->_donorBundleID;
}

- (void)setDonorBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)captureDate
{
  return self->_captureDate;
}

- (NSArray)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int)audioCaptureDevice
{
  return self->_audioCaptureDevice;
}

- (int)locale
{
  return self->_locale;
}

- (int)asrTask
{
  return self->_asrTask;
}

- (NSString)transcription
{
  return self->_transcription;
}

- (void)setTranscription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)expected
{
  return self->_expected;
}

- (void)setExpected:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (int)evaluation
{
  return self->_evaluation;
}

- (void)setHasDonationID:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasDonorBundleID:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasTranscription:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void)setHasExpected:(BOOL)a3
{
  self->_hasDonationID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expected, 0);
  objc_storeStrong((id *)&self->_transcription, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_donorBundleID, 0);
  objc_storeStrong((id *)&self->_donationID, 0);
}

@end
