@implementation PLUSSchemaPLUSTMDCGroundTruth

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
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PLUSSchemaPLUSTMDCGroundTruth;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v22, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 2))
  {
    -[PLUSSchemaPLUSTMDCGroundTruth deleteTtsCurrentPhonemes](self, "deleteTtsCurrentPhonemes");
    -[PLUSSchemaPLUSTMDCGroundTruth deleteTtsSuggestedPhonemes](self, "deleteTtsSuggestedPhonemes");
  }
  if (objc_msgSend(v4, "isConditionSet:", 4))
  {
    -[PLUSSchemaPLUSTMDCGroundTruth deleteTtsCurrentPhonemes](self, "deleteTtsCurrentPhonemes");
    -[PLUSSchemaPLUSTMDCGroundTruth deleteTtsSuggestedPhonemes](self, "deleteTtsSuggestedPhonemes");
  }
  if (objc_msgSend(v4, "isConditionSet:", 5))
  {
    -[PLUSSchemaPLUSTMDCGroundTruth deleteTtsCurrentPhonemes](self, "deleteTtsCurrentPhonemes");
    -[PLUSSchemaPLUSTMDCGroundTruth deleteTtsSuggestedPhonemes](self, "deleteTtsSuggestedPhonemes");
  }
  if (objc_msgSend(v4, "isConditionSet:", 6))
  {
    -[PLUSSchemaPLUSTMDCGroundTruth deleteTtsCurrentPhonemes](self, "deleteTtsCurrentPhonemes");
    -[PLUSSchemaPLUSTMDCGroundTruth deleteTtsSuggestedPhonemes](self, "deleteTtsSuggestedPhonemes");
  }
  if (objc_msgSend(v4, "isConditionSet:", 7))
  {
    -[PLUSSchemaPLUSTMDCGroundTruth deleteTtsCurrentPhonemes](self, "deleteTtsCurrentPhonemes");
    -[PLUSSchemaPLUSTMDCGroundTruth deleteTtsSuggestedPhonemes](self, "deleteTtsSuggestedPhonemes");
  }
  -[PLUSSchemaPLUSTMDCGroundTruth groundTruthId](self, "groundTruthId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[PLUSSchemaPLUSTMDCGroundTruth deleteGroundTruthId](self, "deleteGroundTruthId");
  -[PLUSSchemaPLUSTMDCGroundTruth asrRawRecognitionLinkId](self, "asrRawRecognitionLinkId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[PLUSSchemaPLUSTMDCGroundTruth deleteAsrRawRecognitionLinkId](self, "deleteAsrRawRecognitionLinkId");
  -[PLUSSchemaPLUSTMDCGroundTruth asrPostItnLinkId](self, "asrPostItnLinkId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[PLUSSchemaPLUSTMDCGroundTruth deleteAsrPostItnLinkId](self, "deleteAsrPostItnLinkId");
  -[PLUSSchemaPLUSTMDCGroundTruth siriCurrentPronunciation](self, "siriCurrentPronunciation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[PLUSSchemaPLUSTMDCGroundTruth deleteSiriCurrentPronunciation](self, "deleteSiriCurrentPronunciation");
  -[PLUSSchemaPLUSTMDCGroundTruth correctedPronunciation](self, "correctedPronunciation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[PLUSSchemaPLUSTMDCGroundTruth deleteCorrectedPronunciation](self, "deleteCorrectedPronunciation");

  return v5;
}

- (BOOL)hasGroundTruthId
{
  return self->_groundTruthId != 0;
}

- (void)deleteGroundTruthId
{
  -[PLUSSchemaPLUSTMDCGroundTruth setGroundTruthId:](self, "setGroundTruthId:", 0);
}

- (BOOL)hasAsrRawRecognitionLinkId
{
  return self->_asrRawRecognitionLinkId != 0;
}

- (void)deleteAsrRawRecognitionLinkId
{
  -[PLUSSchemaPLUSTMDCGroundTruth setAsrRawRecognitionLinkId:](self, "setAsrRawRecognitionLinkId:", 0);
}

- (BOOL)hasAsrPostItnLinkId
{
  return self->_asrPostItnLinkId != 0;
}

- (void)deleteAsrPostItnLinkId
{
  -[PLUSSchemaPLUSTMDCGroundTruth setAsrPostItnLinkId:](self, "setAsrPostItnLinkId:", 0);
}

- (BOOL)hasTtsCurrentPhonemes
{
  return self->_ttsCurrentPhonemes != 0;
}

- (void)deleteTtsCurrentPhonemes
{
  -[PLUSSchemaPLUSTMDCGroundTruth setTtsCurrentPhonemes:](self, "setTtsCurrentPhonemes:", 0);
}

- (void)setPhonemesToPhonemesDistance:(double)a3
{
  *(&self->_isCorrectionEligible + 1) |= 1u;
  self->_phonemesToPhonemesDistance = a3;
}

- (BOOL)hasPhonemesToPhonemesDistance
{
  return *(&self->_isCorrectionEligible + 1);
}

- (void)setHasPhonemesToPhonemesDistance:(BOOL)a3
{
  *(&self->_isCorrectionEligible + 1) = *(&self->_isCorrectionEligible + 1) & 0xFE | a3;
}

- (void)deletePhonemesToPhonemesDistance
{
  -[PLUSSchemaPLUSTMDCGroundTruth setPhonemesToPhonemesDistance:](self, "setPhonemesToPhonemesDistance:", 0.0);
  *(&self->_isCorrectionEligible + 1) &= ~1u;
}

- (void)setIsTTSMispronounced:(BOOL)a3
{
  *(&self->_isCorrectionEligible + 1) |= 2u;
  self->_isTTSMispronounced = a3;
}

- (BOOL)hasIsTTSMispronounced
{
  return (*((unsigned __int8 *)&self->_isCorrectionEligible + 1) >> 1) & 1;
}

- (void)setHasIsTTSMispronounced:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(&self->_isCorrectionEligible + 1) = *(&self->_isCorrectionEligible + 1) & 0xFD | v3;
}

- (void)deleteIsTTSMispronounced
{
  -[PLUSSchemaPLUSTMDCGroundTruth setIsTTSMispronounced:](self, "setIsTTSMispronounced:", 0);
  *(&self->_isCorrectionEligible + 1) &= ~2u;
}

- (BOOL)hasTtsSuggestedPhonemes
{
  return self->_ttsSuggestedPhonemes != 0;
}

- (void)deleteTtsSuggestedPhonemes
{
  -[PLUSSchemaPLUSTMDCGroundTruth setTtsSuggestedPhonemes:](self, "setTtsSuggestedPhonemes:", 0);
}

- (BOOL)hasSiriCurrentPronunciation
{
  return self->_siriCurrentPronunciation != 0;
}

- (void)deleteSiriCurrentPronunciation
{
  -[PLUSSchemaPLUSTMDCGroundTruth setSiriCurrentPronunciation:](self, "setSiriCurrentPronunciation:", 0);
}

- (BOOL)hasCorrectedPronunciation
{
  return self->_correctedPronunciation != 0;
}

- (void)deleteCorrectedPronunciation
{
  -[PLUSSchemaPLUSTMDCGroundTruth setCorrectedPronunciation:](self, "setCorrectedPronunciation:", 0);
}

- (void)setSelfLogSource:(int)a3
{
  *(&self->_isCorrectionEligible + 1) |= 4u;
  self->_selfLogSource = a3;
}

- (BOOL)hasSelfLogSource
{
  return (*((unsigned __int8 *)&self->_isCorrectionEligible + 1) >> 2) & 1;
}

- (void)setHasSelfLogSource:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(&self->_isCorrectionEligible + 1) = *(&self->_isCorrectionEligible + 1) & 0xFB | v3;
}

- (void)deleteSelfLogSource
{
  -[PLUSSchemaPLUSTMDCGroundTruth setSelfLogSource:](self, "setSelfLogSource:", 0);
  *(&self->_isCorrectionEligible + 1) &= ~4u;
}

- (void)setIsTmdcPluginEnabled:(BOOL)a3
{
  *(&self->_isCorrectionEligible + 1) |= 8u;
  self->_isTmdcPluginEnabled = a3;
}

- (BOOL)hasIsTmdcPluginEnabled
{
  return (*((unsigned __int8 *)&self->_isCorrectionEligible + 1) >> 3) & 1;
}

- (void)setHasIsTmdcPluginEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(&self->_isCorrectionEligible + 1) = *(&self->_isCorrectionEligible + 1) & 0xF7 | v3;
}

- (void)deleteIsTmdcPluginEnabled
{
  -[PLUSSchemaPLUSTMDCGroundTruth setIsTmdcPluginEnabled:](self, "setIsTmdcPluginEnabled:", 0);
  *(&self->_isCorrectionEligible + 1) &= ~8u;
}

- (void)setIsCorrectionEligible:(BOOL)a3
{
  *(&self->_isCorrectionEligible + 1) |= 0x10u;
  self->_isCorrectionEligible = a3;
}

- (BOOL)hasIsCorrectionEligible
{
  return (*((unsigned __int8 *)&self->_isCorrectionEligible + 1) >> 4) & 1;
}

- (void)setHasIsCorrectionEligible:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(&self->_isCorrectionEligible + 1) = *(&self->_isCorrectionEligible + 1) & 0xEF | v3;
}

- (void)deleteIsCorrectionEligible
{
  -[PLUSSchemaPLUSTMDCGroundTruth setIsCorrectionEligible:](self, "setIsCorrectionEligible:", 0);
  *(&self->_isCorrectionEligible + 1) &= ~0x10u;
}

- (BOOL)readFrom:(id)a3
{
  return PLUSSchemaPLUSTMDCGroundTruthReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  id v19;

  v19 = a3;
  -[PLUSSchemaPLUSTMDCGroundTruth groundTruthId](self, "groundTruthId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PLUSSchemaPLUSTMDCGroundTruth groundTruthId](self, "groundTruthId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PLUSSchemaPLUSTMDCGroundTruth asrRawRecognitionLinkId](self, "asrRawRecognitionLinkId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PLUSSchemaPLUSTMDCGroundTruth asrRawRecognitionLinkId](self, "asrRawRecognitionLinkId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PLUSSchemaPLUSTMDCGroundTruth asrPostItnLinkId](self, "asrPostItnLinkId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[PLUSSchemaPLUSTMDCGroundTruth asrPostItnLinkId](self, "asrPostItnLinkId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PLUSSchemaPLUSTMDCGroundTruth ttsCurrentPhonemes](self, "ttsCurrentPhonemes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    PBDataWriterWriteStringField();
  v11 = *(&self->_isCorrectionEligible + 1);
  if ((v11 & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v11 = *(&self->_isCorrectionEligible + 1);
  }
  if ((v11 & 2) != 0)
    PBDataWriterWriteBOOLField();
  -[PLUSSchemaPLUSTMDCGroundTruth ttsSuggestedPhonemes](self, "ttsSuggestedPhonemes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    PBDataWriterWriteStringField();
  -[PLUSSchemaPLUSTMDCGroundTruth siriCurrentPronunciation](self, "siriCurrentPronunciation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[PLUSSchemaPLUSTMDCGroundTruth siriCurrentPronunciation](self, "siriCurrentPronunciation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PLUSSchemaPLUSTMDCGroundTruth correctedPronunciation](self, "correctedPronunciation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[PLUSSchemaPLUSTMDCGroundTruth correctedPronunciation](self, "correctedPronunciation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v17 = *(&self->_isCorrectionEligible + 1);
  if ((v17 & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    v17 = *(&self->_isCorrectionEligible + 1);
  }
  v18 = v19;
  if ((v17 & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    v18 = v19;
    v17 = *(&self->_isCorrectionEligible + 1);
  }
  if ((v17 & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    v18 = v19;
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
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
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
  unsigned int v28;
  double phonemesToPhonemesDistance;
  double v30;
  int v31;
  int isTTSMispronounced;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  BOOL v48;
  unsigned int v50;
  int v51;
  unsigned int v52;
  int selfLogSource;
  int v54;
  int isTmdcPluginEnabled;
  int v56;
  int isCorrectionEligible;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_44;
  -[PLUSSchemaPLUSTMDCGroundTruth groundTruthId](self, "groundTruthId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "groundTruthId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_43;
  -[PLUSSchemaPLUSTMDCGroundTruth groundTruthId](self, "groundTruthId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[PLUSSchemaPLUSTMDCGroundTruth groundTruthId](self, "groundTruthId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "groundTruthId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_44;
  }
  else
  {

  }
  -[PLUSSchemaPLUSTMDCGroundTruth asrRawRecognitionLinkId](self, "asrRawRecognitionLinkId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "asrRawRecognitionLinkId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_43;
  -[PLUSSchemaPLUSTMDCGroundTruth asrRawRecognitionLinkId](self, "asrRawRecognitionLinkId");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[PLUSSchemaPLUSTMDCGroundTruth asrRawRecognitionLinkId](self, "asrRawRecognitionLinkId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "asrRawRecognitionLinkId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_44;
  }
  else
  {

  }
  -[PLUSSchemaPLUSTMDCGroundTruth asrPostItnLinkId](self, "asrPostItnLinkId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "asrPostItnLinkId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_43;
  -[PLUSSchemaPLUSTMDCGroundTruth asrPostItnLinkId](self, "asrPostItnLinkId");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[PLUSSchemaPLUSTMDCGroundTruth asrPostItnLinkId](self, "asrPostItnLinkId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "asrPostItnLinkId");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_44;
  }
  else
  {

  }
  -[PLUSSchemaPLUSTMDCGroundTruth ttsCurrentPhonemes](self, "ttsCurrentPhonemes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ttsCurrentPhonemes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_43;
  -[PLUSSchemaPLUSTMDCGroundTruth ttsCurrentPhonemes](self, "ttsCurrentPhonemes");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[PLUSSchemaPLUSTMDCGroundTruth ttsCurrentPhonemes](self, "ttsCurrentPhonemes");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ttsCurrentPhonemes");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_44;
  }
  else
  {

  }
  v27 = *((unsigned __int8 *)&self->_isCorrectionEligible + 1);
  v28 = v4[86];
  if ((v27 & 1) != (v28 & 1))
    goto LABEL_44;
  if ((v27 & 1) != 0)
  {
    phonemesToPhonemesDistance = self->_phonemesToPhonemesDistance;
    objc_msgSend(v4, "phonemesToPhonemesDistance");
    if (phonemesToPhonemesDistance != v30)
      goto LABEL_44;
    v27 = *((unsigned __int8 *)&self->_isCorrectionEligible + 1);
    v28 = v4[86];
  }
  v31 = (v27 >> 1) & 1;
  if (v31 != ((v28 >> 1) & 1))
    goto LABEL_44;
  if (v31)
  {
    isTTSMispronounced = self->_isTTSMispronounced;
    if (isTTSMispronounced != objc_msgSend(v4, "isTTSMispronounced"))
      goto LABEL_44;
  }
  -[PLUSSchemaPLUSTMDCGroundTruth ttsSuggestedPhonemes](self, "ttsSuggestedPhonemes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ttsSuggestedPhonemes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_43;
  -[PLUSSchemaPLUSTMDCGroundTruth ttsSuggestedPhonemes](self, "ttsSuggestedPhonemes");
  v33 = objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    v34 = (void *)v33;
    -[PLUSSchemaPLUSTMDCGroundTruth ttsSuggestedPhonemes](self, "ttsSuggestedPhonemes");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ttsSuggestedPhonemes");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "isEqual:", v36);

    if (!v37)
      goto LABEL_44;
  }
  else
  {

  }
  -[PLUSSchemaPLUSTMDCGroundTruth siriCurrentPronunciation](self, "siriCurrentPronunciation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "siriCurrentPronunciation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_43;
  -[PLUSSchemaPLUSTMDCGroundTruth siriCurrentPronunciation](self, "siriCurrentPronunciation");
  v38 = objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    v39 = (void *)v38;
    -[PLUSSchemaPLUSTMDCGroundTruth siriCurrentPronunciation](self, "siriCurrentPronunciation");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "siriCurrentPronunciation");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v40, "isEqual:", v41);

    if (!v42)
      goto LABEL_44;
  }
  else
  {

  }
  -[PLUSSchemaPLUSTMDCGroundTruth correctedPronunciation](self, "correctedPronunciation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "correctedPronunciation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_43:

    goto LABEL_44;
  }
  -[PLUSSchemaPLUSTMDCGroundTruth correctedPronunciation](self, "correctedPronunciation");
  v43 = objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    v44 = (void *)v43;
    -[PLUSSchemaPLUSTMDCGroundTruth correctedPronunciation](self, "correctedPronunciation");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "correctedPronunciation");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v45, "isEqual:", v46);

    if (!v47)
      goto LABEL_44;
  }
  else
  {

  }
  v50 = *((unsigned __int8 *)&self->_isCorrectionEligible + 1);
  v51 = (v50 >> 2) & 1;
  v52 = v4[86];
  if (v51 == ((v52 >> 2) & 1))
  {
    if (v51)
    {
      selfLogSource = self->_selfLogSource;
      if (selfLogSource != objc_msgSend(v4, "selfLogSource"))
        goto LABEL_44;
      v50 = *((unsigned __int8 *)&self->_isCorrectionEligible + 1);
      v52 = v4[86];
    }
    v54 = (v50 >> 3) & 1;
    if (v54 == ((v52 >> 3) & 1))
    {
      if (v54)
      {
        isTmdcPluginEnabled = self->_isTmdcPluginEnabled;
        if (isTmdcPluginEnabled != objc_msgSend(v4, "isTmdcPluginEnabled"))
          goto LABEL_44;
        v50 = *((unsigned __int8 *)&self->_isCorrectionEligible + 1);
        v52 = v4[86];
      }
      v56 = (v50 >> 4) & 1;
      if (v56 == ((v52 >> 4) & 1))
      {
        if (!v56
          || (isCorrectionEligible = self->_isCorrectionEligible,
              isCorrectionEligible == objc_msgSend(v4, "isCorrectionEligible")))
        {
          v48 = 1;
          goto LABEL_45;
        }
      }
    }
  }
LABEL_44:
  v48 = 0;
LABEL_45:

  return v48;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  NSUInteger v5;
  char v6;
  unint64_t v7;
  double phonemesToPhonemesDistance;
  double v9;
  long double v10;
  double v11;
  uint64_t v12;
  NSUInteger v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v20;

  v20 = -[SISchemaUUID hash](self->_groundTruthId, "hash");
  v3 = -[SISchemaUUID hash](self->_asrRawRecognitionLinkId, "hash");
  v4 = -[SISchemaUUID hash](self->_asrPostItnLinkId, "hash");
  v5 = -[NSString hash](self->_ttsCurrentPhonemes, "hash");
  v6 = *(&self->_isCorrectionEligible + 1);
  if ((v6 & 1) != 0)
  {
    phonemesToPhonemesDistance = self->_phonemesToPhonemesDistance;
    v9 = -phonemesToPhonemesDistance;
    if (phonemesToPhonemesDistance >= 0.0)
      v9 = self->_phonemesToPhonemesDistance;
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
  if ((v6 & 2) != 0)
    v12 = 2654435761 * self->_isTTSMispronounced;
  else
    v12 = 0;
  v13 = -[NSString hash](self->_ttsSuggestedPhonemes, "hash");
  v14 = -[PLUSSchemaPLUSTMDCSiriCurrentPronunciationTier1 hash](self->_siriCurrentPronunciation, "hash");
  v15 = -[PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 hash](self->_correctedPronunciation, "hash");
  if ((*(&self->_isCorrectionEligible + 1) & 4) == 0)
  {
    v16 = 0;
    if ((*(&self->_isCorrectionEligible + 1) & 8) != 0)
      goto LABEL_14;
LABEL_17:
    v17 = 0;
    if ((*(&self->_isCorrectionEligible + 1) & 0x10) != 0)
      goto LABEL_15;
LABEL_18:
    v18 = 0;
    return v3 ^ v20 ^ v4 ^ v5 ^ v7 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18;
  }
  v16 = 2654435761 * self->_selfLogSource;
  if ((*(&self->_isCorrectionEligible + 1) & 8) == 0)
    goto LABEL_17;
LABEL_14:
  v17 = 2654435761 * self->_isTmdcPluginEnabled;
  if ((*(&self->_isCorrectionEligible + 1) & 0x10) == 0)
    goto LABEL_18;
LABEL_15:
  v18 = 2654435761 * self->_isCorrectionEligible;
  return v3 ^ v20 ^ v4 ^ v5 ^ v7 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18;
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
  void *v15;
  char v16;
  int v17;
  const __CFString *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_asrPostItnLinkId)
  {
    -[PLUSSchemaPLUSTMDCGroundTruth asrPostItnLinkId](self, "asrPostItnLinkId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("asrPostItnLinkId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("asrPostItnLinkId"));

    }
  }
  if (self->_asrRawRecognitionLinkId)
  {
    -[PLUSSchemaPLUSTMDCGroundTruth asrRawRecognitionLinkId](self, "asrRawRecognitionLinkId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("asrRawRecognitionLinkId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("asrRawRecognitionLinkId"));

    }
  }
  if (self->_correctedPronunciation)
  {
    -[PLUSSchemaPLUSTMDCGroundTruth correctedPronunciation](self, "correctedPronunciation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("correctedPronunciation"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("correctedPronunciation"));

    }
  }
  if (self->_groundTruthId)
  {
    -[PLUSSchemaPLUSTMDCGroundTruth groundTruthId](self, "groundTruthId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("groundTruthId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("groundTruthId"));

    }
  }
  v16 = *(&self->_isCorrectionEligible + 1);
  if ((v16 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PLUSSchemaPLUSTMDCGroundTruth isCorrectionEligible](self, "isCorrectionEligible"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("isCorrectionEligible"));

    v16 = *(&self->_isCorrectionEligible + 1);
    if ((v16 & 2) == 0)
    {
LABEL_23:
      if ((v16 & 8) == 0)
        goto LABEL_24;
      goto LABEL_37;
    }
  }
  else if ((*(&self->_isCorrectionEligible + 1) & 2) == 0)
  {
    goto LABEL_23;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PLUSSchemaPLUSTMDCGroundTruth isTTSMispronounced](self, "isTTSMispronounced"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("isTTSMispronounced"));

  v16 = *(&self->_isCorrectionEligible + 1);
  if ((v16 & 8) == 0)
  {
LABEL_24:
    if ((v16 & 1) == 0)
      goto LABEL_25;
LABEL_38:
    v25 = (void *)MEMORY[0x1E0CB37E8];
    -[PLUSSchemaPLUSTMDCGroundTruth phonemesToPhonemesDistance](self, "phonemesToPhonemesDistance");
    objc_msgSend(v25, "numberWithDouble:");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("phonemesToPhonemesDistance"));

    if ((*(&self->_isCorrectionEligible + 1) & 4) == 0)
      goto LABEL_32;
    goto LABEL_26;
  }
LABEL_37:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PLUSSchemaPLUSTMDCGroundTruth isTmdcPluginEnabled](self, "isTmdcPluginEnabled"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("isTmdcPluginEnabled"));

  v16 = *(&self->_isCorrectionEligible + 1);
  if ((v16 & 1) != 0)
    goto LABEL_38;
LABEL_25:
  if ((v16 & 4) == 0)
    goto LABEL_32;
LABEL_26:
  v17 = -[PLUSSchemaPLUSTMDCGroundTruth selfLogSource](self, "selfLogSource");
  v18 = CFSTR("PLUSTMDCSELFLOGSOURCE_UNKNOWN");
  if (v17 == 1)
    v18 = CFSTR("PLUSTMDCSELFLOGSOURCE_CLIENT");
  if (v17 == 2)
    v19 = CFSTR("PLUSTMDCSELFLOGSOURCE_INTERNAL");
  else
    v19 = v18;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("selfLogSource"));
LABEL_32:
  if (self->_siriCurrentPronunciation)
  {
    -[PLUSSchemaPLUSTMDCGroundTruth siriCurrentPronunciation](self, "siriCurrentPronunciation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "dictionaryRepresentation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("siriCurrentPronunciation"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("siriCurrentPronunciation"));

    }
  }
  if (self->_ttsCurrentPhonemes)
  {
    -[PLUSSchemaPLUSTMDCGroundTruth ttsCurrentPhonemes](self, "ttsCurrentPhonemes");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v28, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("ttsCurrentPhonemes"));

  }
  if (self->_ttsSuggestedPhonemes)
  {
    -[PLUSSchemaPLUSTMDCGroundTruth ttsSuggestedPhonemes](self, "ttsSuggestedPhonemes");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(v30, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("ttsSuggestedPhonemes"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PLUSSchemaPLUSTMDCGroundTruth dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PLUSSchemaPLUSTMDCGroundTruth)initWithJSON:(id)a3
{
  void *v4;
  PLUSSchemaPLUSTMDCGroundTruth *v5;
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
    self = -[PLUSSchemaPLUSTMDCGroundTruth initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PLUSSchemaPLUSTMDCGroundTruth)initWithDictionary:(id)a3
{
  id v4;
  PLUSSchemaPLUSTMDCGroundTruth *v5;
  uint64_t v6;
  SISchemaUUID *v7;
  uint64_t v8;
  SISchemaUUID *v9;
  uint64_t v10;
  SISchemaUUID *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  PLUSSchemaPLUSTMDCSiriCurrentPronunciationTier1 *v19;
  void *v20;
  PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  PLUSSchemaPLUSTMDCGroundTruth *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  objc_super v33;

  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)PLUSSchemaPLUSTMDCGroundTruth;
  v5 = -[PLUSSchemaPLUSTMDCGroundTruth init](&v33, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("groundTruthId"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[PLUSSchemaPLUSTMDCGroundTruth setGroundTruthId:](v5, "setGroundTruthId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("asrRawRecognitionLinkId"));
    v8 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v8);
      -[PLUSSchemaPLUSTMDCGroundTruth setAsrRawRecognitionLinkId:](v5, "setAsrRawRecognitionLinkId:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("asrPostItnLinkId"));
    v10 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v10);
      -[PLUSSchemaPLUSTMDCGroundTruth setAsrPostItnLinkId:](v5, "setAsrPostItnLinkId:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ttsCurrentPhonemes"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = (void *)objc_msgSend(v12, "copy");
      -[PLUSSchemaPLUSTMDCGroundTruth setTtsCurrentPhonemes:](v5, "setTtsCurrentPhonemes:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("phonemesToPhonemesDistance"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v14, "doubleValue");
      -[PLUSSchemaPLUSTMDCGroundTruth setPhonemesToPhonemesDistance:](v5, "setPhonemesToPhonemesDistance:");
    }
    v30 = v14;
    v31 = v12;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isTTSMispronounced"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PLUSSchemaPLUSTMDCGroundTruth setIsTTSMispronounced:](v5, "setIsTTSMispronounced:", objc_msgSend(v15, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ttsSuggestedPhonemes"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = (void *)objc_msgSend(v16, "copy");
      -[PLUSSchemaPLUSTMDCGroundTruth setTtsSuggestedPhonemes:](v5, "setTtsSuggestedPhonemes:", v17);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siriCurrentPronunciation"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = -[PLUSSchemaPLUSTMDCSiriCurrentPronunciationTier1 initWithDictionary:]([PLUSSchemaPLUSTMDCSiriCurrentPronunciationTier1 alloc], "initWithDictionary:", v18);
      -[PLUSSchemaPLUSTMDCGroundTruth setSiriCurrentPronunciation:](v5, "setSiriCurrentPronunciation:", v19);

    }
    v32 = (void *)v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("correctedPronunciation"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = -[PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 initWithDictionary:]([PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 alloc], "initWithDictionary:", v20);
      -[PLUSSchemaPLUSTMDCGroundTruth setCorrectedPronunciation:](v5, "setCorrectedPronunciation:", v21);

    }
    v22 = (void *)v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("selfLogSource"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PLUSSchemaPLUSTMDCGroundTruth setSelfLogSource:](v5, "setSelfLogSource:", objc_msgSend(v23, "intValue"));
    v24 = (void *)v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isTmdcPluginEnabled"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PLUSSchemaPLUSTMDCGroundTruth setIsTmdcPluginEnabled:](v5, "setIsTmdcPluginEnabled:", objc_msgSend(v25, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isCorrectionEligible"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PLUSSchemaPLUSTMDCGroundTruth setIsCorrectionEligible:](v5, "setIsCorrectionEligible:", objc_msgSend(v26, "BOOLValue"));
    v27 = v5;

  }
  return v5;
}

- (SISchemaUUID)groundTruthId
{
  return self->_groundTruthId;
}

- (void)setGroundTruthId:(id)a3
{
  objc_storeStrong((id *)&self->_groundTruthId, a3);
}

- (SISchemaUUID)asrRawRecognitionLinkId
{
  return self->_asrRawRecognitionLinkId;
}

- (void)setAsrRawRecognitionLinkId:(id)a3
{
  objc_storeStrong((id *)&self->_asrRawRecognitionLinkId, a3);
}

- (SISchemaUUID)asrPostItnLinkId
{
  return self->_asrPostItnLinkId;
}

- (void)setAsrPostItnLinkId:(id)a3
{
  objc_storeStrong((id *)&self->_asrPostItnLinkId, a3);
}

- (NSString)ttsCurrentPhonemes
{
  return self->_ttsCurrentPhonemes;
}

- (void)setTtsCurrentPhonemes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (double)phonemesToPhonemesDistance
{
  return self->_phonemesToPhonemesDistance;
}

- (BOOL)isTTSMispronounced
{
  return self->_isTTSMispronounced;
}

- (NSString)ttsSuggestedPhonemes
{
  return self->_ttsSuggestedPhonemes;
}

- (void)setTtsSuggestedPhonemes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (PLUSSchemaPLUSTMDCSiriCurrentPronunciationTier1)siriCurrentPronunciation
{
  return self->_siriCurrentPronunciation;
}

- (void)setSiriCurrentPronunciation:(id)a3
{
  objc_storeStrong((id *)&self->_siriCurrentPronunciation, a3);
}

- (PLUSSchemaPLUSTMDCCorrectedPronunciationTier1)correctedPronunciation
{
  return self->_correctedPronunciation;
}

- (void)setCorrectedPronunciation:(id)a3
{
  objc_storeStrong((id *)&self->_correctedPronunciation, a3);
}

- (int)selfLogSource
{
  return self->_selfLogSource;
}

- (BOOL)isTmdcPluginEnabled
{
  return self->_isTmdcPluginEnabled;
}

- (BOOL)isCorrectionEligible
{
  return self->_isCorrectionEligible;
}

- (void)setHasGroundTruthId:(BOOL)a3
{
  *(&self->_isCorrectionEligible + 2) = a3;
}

- (void)setHasAsrRawRecognitionLinkId:(BOOL)a3
{
  *(_BYTE *)&self->_has = a3;
}

- (void)setHasAsrPostItnLinkId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasTtsCurrentPhonemes:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasTtsSuggestedPhonemes:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void)setHasSiriCurrentPronunciation:(BOOL)a3
{
  self->_hasGroundTruthId = a3;
}

- (void)setHasCorrectedPronunciation:(BOOL)a3
{
  self->_hasAsrRawRecognitionLinkId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_correctedPronunciation, 0);
  objc_storeStrong((id *)&self->_siriCurrentPronunciation, 0);
  objc_storeStrong((id *)&self->_ttsSuggestedPhonemes, 0);
  objc_storeStrong((id *)&self->_ttsCurrentPhonemes, 0);
  objc_storeStrong((id *)&self->_asrPostItnLinkId, 0);
  objc_storeStrong((id *)&self->_asrRawRecognitionLinkId, 0);
  objc_storeStrong((id *)&self->_groundTruthId, 0);
}

@end
