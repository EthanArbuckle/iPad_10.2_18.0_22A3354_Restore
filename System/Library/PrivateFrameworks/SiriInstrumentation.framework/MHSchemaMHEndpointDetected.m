@implementation MHSchemaMHEndpointDetected

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
  v22.super_class = (Class)MHSchemaMHEndpointDetected;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v22, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MHSchemaMHEndpointDetected endpointFeaturesAtEndpoint](self, "endpointFeaturesAtEndpoint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[MHSchemaMHEndpointDetected deleteEndpointFeaturesAtEndpoint](self, "deleteEndpointFeaturesAtEndpoint");
  -[MHSchemaMHEndpointDetected endpointModelConfigVersion](self, "endpointModelConfigVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[MHSchemaMHEndpointDetected deleteEndpointModelConfigVersion](self, "deleteEndpointModelConfigVersion");
  -[MHSchemaMHEndpointDetected asrFeatureLatencyDistribution](self, "asrFeatureLatencyDistribution");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[MHSchemaMHEndpointDetected deleteAsrFeatureLatencyDistribution](self, "deleteAsrFeatureLatencyDistribution");
  -[MHSchemaMHEndpointDetected timeoutMetadata](self, "timeoutMetadata");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[MHSchemaMHEndpointDetected deleteTimeoutMetadata](self, "deleteTimeoutMetadata");
  -[MHSchemaMHEndpointDetected trpId](self, "trpId");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[MHSchemaMHEndpointDetected deleteTrpId](self, "deleteTrpId");

  return v5;
}

- (void)setEndpointerType:(int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_endpointerType = a3;
}

- (BOOL)hasEndpointerType
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHasEndpointerType:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (void)deleteEndpointerType
{
  -[MHSchemaMHEndpointDetected setEndpointerType:](self, "setEndpointerType:", 0);
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setEndpointAudioDurationInNs:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_endpointAudioDurationInNs = a3;
}

- (BOOL)hasEndpointAudioDurationInNs
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHasEndpointAudioDurationInNs:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (void)deleteEndpointAudioDurationInNs
{
  -[MHSchemaMHEndpointDetected setEndpointAudioDurationInNs:](self, "setEndpointAudioDurationInNs:", 0);
  *(_WORD *)&self->_has &= ~2u;
}

- (void)setFirstBufferTimeInNs:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_firstBufferTimeInNs = a3;
}

- (BOOL)hasFirstBufferTimeInNs
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setHasFirstBufferTimeInNs:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (void)deleteFirstBufferTimeInNs
{
  -[MHSchemaMHEndpointDetected setFirstBufferTimeInNs:](self, "setFirstBufferTimeInNs:", 0);
  *(_WORD *)&self->_has &= ~4u;
}

- (void)setEndpointedBufferTimeInNs:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_endpointedBufferTimeInNs = a3;
}

- (BOOL)hasEndpointedBufferTimeInNs
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHasEndpointedBufferTimeInNs:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (void)deleteEndpointedBufferTimeInNs
{
  -[MHSchemaMHEndpointDetected setEndpointedBufferTimeInNs:](self, "setEndpointedBufferTimeInNs:", 0);
  *(_WORD *)&self->_has &= ~8u;
}

- (BOOL)hasEndpointFeaturesAtEndpoint
{
  return self->_endpointFeaturesAtEndpoint != 0;
}

- (void)deleteEndpointFeaturesAtEndpoint
{
  -[MHSchemaMHEndpointDetected setEndpointFeaturesAtEndpoint:](self, "setEndpointFeaturesAtEndpoint:", 0);
}

- (void)setEndpointerDecisionLagInNs:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_endpointerDecisionLagInNs = a3;
}

- (BOOL)hasEndpointerDecisionLagInNs
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHasEndpointerDecisionLagInNs:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (void)deleteEndpointerDecisionLagInNs
{
  -[MHSchemaMHEndpointDetected setEndpointerDecisionLagInNs:](self, "setEndpointerDecisionLagInNs:", 0);
  *(_WORD *)&self->_has &= ~0x10u;
}

- (void)setExtraDelayInNs:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_extraDelayInNs = a3;
}

- (BOOL)hasExtraDelayInNs
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHasExtraDelayInNs:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (void)deleteExtraDelayInNs
{
  -[MHSchemaMHEndpointDetected setExtraDelayInNs:](self, "setExtraDelayInNs:", 0);
  *(_WORD *)&self->_has &= ~0x20u;
}

- (BOOL)hasEndpointModelConfigVersion
{
  return self->_endpointModelConfigVersion != 0;
}

- (void)deleteEndpointModelConfigVersion
{
  -[MHSchemaMHEndpointDetected setEndpointModelConfigVersion:](self, "setEndpointModelConfigVersion:", 0);
}

- (void)setDerivedBufferTimeFromHistoricalAudio:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_derivedBufferTimeFromHistoricalAudio = a3;
}

- (BOOL)hasDerivedBufferTimeFromHistoricalAudio
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHasDerivedBufferTimeFromHistoricalAudio:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (void)deleteDerivedBufferTimeFromHistoricalAudio
{
  -[MHSchemaMHEndpointDetected setDerivedBufferTimeFromHistoricalAudio:](self, "setDerivedBufferTimeFromHistoricalAudio:", 0);
  *(_WORD *)&self->_has &= ~0x40u;
}

- (void)setEndpointerThreshold:(float)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_endpointerThreshold = a3;
}

- (BOOL)hasEndpointerThreshold
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHasEndpointerThreshold:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (void)deleteEndpointerThreshold
{
  double v2;

  LODWORD(v2) = 0;
  -[MHSchemaMHEndpointDetected setEndpointerThreshold:](self, "setEndpointerThreshold:", v2);
  *(_WORD *)&self->_has &= ~0x80u;
}

- (void)setEndpointerScore:(float)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_endpointerScore = a3;
}

- (BOOL)hasEndpointerScore
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHasEndpointerScore:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (void)deleteEndpointerScore
{
  double v2;

  LODWORD(v2) = 0;
  -[MHSchemaMHEndpointDetected setEndpointerScore:](self, "setEndpointerScore:", v2);
  *(_WORD *)&self->_has &= ~0x100u;
}

- (void)setAudioSkippedDurationInNs:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_audioSkippedDurationInNs = a3;
}

- (BOOL)hasAudioSkippedDurationInNs
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setHasAudioSkippedDurationInNs:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (void)deleteAudioSkippedDurationInNs
{
  -[MHSchemaMHEndpointDetected setAudioSkippedDurationInNs:](self, "setAudioSkippedDurationInNs:", 0);
  *(_WORD *)&self->_has &= ~0x200u;
}

- (void)setEndpointResetPositionInNs:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_endpointResetPositionInNs = a3;
}

- (BOOL)hasEndpointResetPositionInNs
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setHasEndpointResetPositionInNs:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (void)deleteEndpointResetPositionInNs
{
  -[MHSchemaMHEndpointDetected setEndpointResetPositionInNs:](self, "setEndpointResetPositionInNs:", 0);
  *(_WORD *)&self->_has &= ~0x400u;
}

- (BOOL)hasAsrFeatureLatencyDistribution
{
  return self->_asrFeatureLatencyDistribution != 0;
}

- (void)deleteAsrFeatureLatencyDistribution
{
  -[MHSchemaMHEndpointDetected setAsrFeatureLatencyDistribution:](self, "setAsrFeatureLatencyDistribution:", 0);
}

- (BOOL)hasTimeoutMetadata
{
  return self->_timeoutMetadata != 0;
}

- (void)deleteTimeoutMetadata
{
  -[MHSchemaMHEndpointDetected setTimeoutMetadata:](self, "setTimeoutMetadata:", 0);
}

- (void)setTrpDetectionType:(int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_trpDetectionType = a3;
}

- (BOOL)hasTrpDetectionType
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setHasTrpDetectionType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (void)deleteTrpDetectionType
{
  -[MHSchemaMHEndpointDetected setTrpDetectionType:](self, "setTrpDetectionType:", 0);
  *(_WORD *)&self->_has &= ~0x800u;
}

- (BOOL)hasTrpId
{
  return self->_trpId != 0;
}

- (void)deleteTrpId
{
  -[MHSchemaMHEndpointDetected setTrpId:](self, "setTrpId:", 0);
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return MHSchemaMHEndpointDetectedReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  void *v5;
  void *v6;
  __int16 v7;
  void *v8;
  void *v9;
  __int16 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_31;
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
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_31:
  PBDataWriterWriteUint64Field();
  if ((*(_WORD *)&self->_has & 8) != 0)
LABEL_5:
    PBDataWriterWriteUint64Field();
LABEL_6:
  -[MHSchemaMHEndpointDetected endpointFeaturesAtEndpoint](self, "endpointFeaturesAtEndpoint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[MHSchemaMHEndpointDetected endpointFeaturesAtEndpoint](self, "endpointFeaturesAtEndpoint");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v7 = (__int16)self->_has;
  if ((v7 & 0x10) != 0)
  {
    PBDataWriterWriteUint64Field();
    v7 = (__int16)self->_has;
  }
  if ((v7 & 0x20) != 0)
    PBDataWriterWriteUint64Field();
  -[MHSchemaMHEndpointDetected endpointModelConfigVersion](self, "endpointModelConfigVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[MHSchemaMHEndpointDetected endpointModelConfigVersion](self, "endpointModelConfigVersion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v10 = (__int16)self->_has;
  if ((v10 & 0x40) != 0)
  {
    PBDataWriterWriteBOOLField();
    v10 = (__int16)self->_has;
    if ((v10 & 0x80) == 0)
    {
LABEL_16:
      if ((v10 & 0x100) == 0)
        goto LABEL_17;
      goto LABEL_35;
    }
  }
  else if ((v10 & 0x80) == 0)
  {
    goto LABEL_16;
  }
  PBDataWriterWriteFloatField();
  v10 = (__int16)self->_has;
  if ((v10 & 0x100) == 0)
  {
LABEL_17:
    if ((v10 & 0x200) == 0)
      goto LABEL_18;
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteFloatField();
  v10 = (__int16)self->_has;
  if ((v10 & 0x200) == 0)
  {
LABEL_18:
    if ((v10 & 0x400) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }
LABEL_36:
  PBDataWriterWriteUint64Field();
  if ((*(_WORD *)&self->_has & 0x400) != 0)
LABEL_19:
    PBDataWriterWriteUint64Field();
LABEL_20:
  -[MHSchemaMHEndpointDetected asrFeatureLatencyDistribution](self, "asrFeatureLatencyDistribution");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[MHSchemaMHEndpointDetected asrFeatureLatencyDistribution](self, "asrFeatureLatencyDistribution");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MHSchemaMHEndpointDetected timeoutMetadata](self, "timeoutMetadata");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[MHSchemaMHEndpointDetected timeoutMetadata](self, "timeoutMetadata");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
    PBDataWriterWriteInt32Field();
  -[MHSchemaMHEndpointDetected trpId](self, "trpId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = v18;
  if (v15)
  {
    -[MHSchemaMHEndpointDetected trpId](self, "trpId");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v16 = v18;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int16 *v4;
  $221279FA088A1B11B7BC94F832993B02 has;
  unsigned int v6;
  int endpointerType;
  int v8;
  unint64_t endpointAudioDurationInNs;
  int v10;
  unint64_t firstBufferTimeInNs;
  int v12;
  unint64_t endpointedBufferTimeInNs;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  $221279FA088A1B11B7BC94F832993B02 v21;
  int v22;
  unsigned int v23;
  unint64_t endpointerDecisionLagInNs;
  int v25;
  unint64_t extraDelayInNs;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  $221279FA088A1B11B7BC94F832993B02 v32;
  int v33;
  unsigned int v34;
  int derivedBufferTimeFromHistoricalAudio;
  int v36;
  float endpointerThreshold;
  float v38;
  int v39;
  float endpointerScore;
  float v41;
  int v42;
  unint64_t audioSkippedDurationInNs;
  int v44;
  unint64_t endpointResetPositionInNs;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  int v55;
  int v56;
  int trpDetectionType;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  char v62;
  BOOL v63;

  v4 = (unsigned __int16 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_71;
  has = self->_has;
  v6 = v4[68];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_71;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    endpointerType = self->_endpointerType;
    if (endpointerType != objc_msgSend(v4, "endpointerType"))
      goto LABEL_71;
    has = self->_has;
    v6 = v4[68];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_71;
  if (v8)
  {
    endpointAudioDurationInNs = self->_endpointAudioDurationInNs;
    if (endpointAudioDurationInNs != objc_msgSend(v4, "endpointAudioDurationInNs"))
      goto LABEL_71;
    has = self->_has;
    v6 = v4[68];
  }
  v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_71;
  if (v10)
  {
    firstBufferTimeInNs = self->_firstBufferTimeInNs;
    if (firstBufferTimeInNs != objc_msgSend(v4, "firstBufferTimeInNs"))
      goto LABEL_71;
    has = self->_has;
    v6 = v4[68];
  }
  v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1))
    goto LABEL_71;
  if (v12)
  {
    endpointedBufferTimeInNs = self->_endpointedBufferTimeInNs;
    if (endpointedBufferTimeInNs != objc_msgSend(v4, "endpointedBufferTimeInNs"))
      goto LABEL_71;
  }
  -[MHSchemaMHEndpointDetected endpointFeaturesAtEndpoint](self, "endpointFeaturesAtEndpoint");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endpointFeaturesAtEndpoint");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v14 == 0) == (v15 != 0))
    goto LABEL_70;
  -[MHSchemaMHEndpointDetected endpointFeaturesAtEndpoint](self, "endpointFeaturesAtEndpoint");
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)v16;
    -[MHSchemaMHEndpointDetected endpointFeaturesAtEndpoint](self, "endpointFeaturesAtEndpoint");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endpointFeaturesAtEndpoint");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "isEqual:", v19);

    if (!v20)
      goto LABEL_71;
  }
  else
  {

  }
  v21 = self->_has;
  v22 = (*(unsigned int *)&v21 >> 4) & 1;
  v23 = v4[68];
  if (v22 != ((v23 >> 4) & 1))
    goto LABEL_71;
  if (v22)
  {
    endpointerDecisionLagInNs = self->_endpointerDecisionLagInNs;
    if (endpointerDecisionLagInNs != objc_msgSend(v4, "endpointerDecisionLagInNs"))
      goto LABEL_71;
    v21 = self->_has;
    v23 = v4[68];
  }
  v25 = (*(unsigned int *)&v21 >> 5) & 1;
  if (v25 != ((v23 >> 5) & 1))
    goto LABEL_71;
  if (v25)
  {
    extraDelayInNs = self->_extraDelayInNs;
    if (extraDelayInNs != objc_msgSend(v4, "extraDelayInNs"))
      goto LABEL_71;
  }
  -[MHSchemaMHEndpointDetected endpointModelConfigVersion](self, "endpointModelConfigVersion");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endpointModelConfigVersion");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v14 == 0) == (v15 != 0))
    goto LABEL_70;
  -[MHSchemaMHEndpointDetected endpointModelConfigVersion](self, "endpointModelConfigVersion");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[MHSchemaMHEndpointDetected endpointModelConfigVersion](self, "endpointModelConfigVersion");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endpointModelConfigVersion");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_71;
  }
  else
  {

  }
  v32 = self->_has;
  v33 = (*(unsigned int *)&v32 >> 6) & 1;
  v34 = v4[68];
  if (v33 != ((v34 >> 6) & 1))
    goto LABEL_71;
  if (v33)
  {
    derivedBufferTimeFromHistoricalAudio = self->_derivedBufferTimeFromHistoricalAudio;
    if (derivedBufferTimeFromHistoricalAudio != objc_msgSend(v4, "derivedBufferTimeFromHistoricalAudio"))
      goto LABEL_71;
    v32 = self->_has;
    v34 = v4[68];
  }
  v36 = (*(unsigned int *)&v32 >> 7) & 1;
  if (v36 != ((v34 >> 7) & 1))
    goto LABEL_71;
  if (v36)
  {
    endpointerThreshold = self->_endpointerThreshold;
    objc_msgSend(v4, "endpointerThreshold");
    if (endpointerThreshold != v38)
      goto LABEL_71;
    v32 = self->_has;
    v34 = v4[68];
  }
  v39 = (*(unsigned int *)&v32 >> 8) & 1;
  if (v39 != ((v34 >> 8) & 1))
    goto LABEL_71;
  if (v39)
  {
    endpointerScore = self->_endpointerScore;
    objc_msgSend(v4, "endpointerScore");
    if (endpointerScore != v41)
      goto LABEL_71;
    v32 = self->_has;
    v34 = v4[68];
  }
  v42 = (*(unsigned int *)&v32 >> 9) & 1;
  if (v42 != ((v34 >> 9) & 1))
    goto LABEL_71;
  if (v42)
  {
    audioSkippedDurationInNs = self->_audioSkippedDurationInNs;
    if (audioSkippedDurationInNs != objc_msgSend(v4, "audioSkippedDurationInNs"))
      goto LABEL_71;
    v32 = self->_has;
    v34 = v4[68];
  }
  v44 = (*(unsigned int *)&v32 >> 10) & 1;
  if (v44 != ((v34 >> 10) & 1))
    goto LABEL_71;
  if (v44)
  {
    endpointResetPositionInNs = self->_endpointResetPositionInNs;
    if (endpointResetPositionInNs != objc_msgSend(v4, "endpointResetPositionInNs"))
      goto LABEL_71;
  }
  -[MHSchemaMHEndpointDetected asrFeatureLatencyDistribution](self, "asrFeatureLatencyDistribution");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "asrFeatureLatencyDistribution");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v14 == 0) == (v15 != 0))
    goto LABEL_70;
  -[MHSchemaMHEndpointDetected asrFeatureLatencyDistribution](self, "asrFeatureLatencyDistribution");
  v46 = objc_claimAutoreleasedReturnValue();
  if (v46)
  {
    v47 = (void *)v46;
    -[MHSchemaMHEndpointDetected asrFeatureLatencyDistribution](self, "asrFeatureLatencyDistribution");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "asrFeatureLatencyDistribution");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v48, "isEqual:", v49);

    if (!v50)
      goto LABEL_71;
  }
  else
  {

  }
  -[MHSchemaMHEndpointDetected timeoutMetadata](self, "timeoutMetadata");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeoutMetadata");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v14 == 0) == (v15 != 0))
    goto LABEL_70;
  -[MHSchemaMHEndpointDetected timeoutMetadata](self, "timeoutMetadata");
  v51 = objc_claimAutoreleasedReturnValue();
  if (v51)
  {
    v52 = (void *)v51;
    -[MHSchemaMHEndpointDetected timeoutMetadata](self, "timeoutMetadata");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeoutMetadata");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v53, "isEqual:", v54);

    if (!v55)
      goto LABEL_71;
  }
  else
  {

  }
  v56 = (*(_WORD *)&self->_has >> 11) & 1;
  if (v56 != ((v4[68] >> 11) & 1))
    goto LABEL_71;
  if (v56)
  {
    trpDetectionType = self->_trpDetectionType;
    if (trpDetectionType != objc_msgSend(v4, "trpDetectionType"))
      goto LABEL_71;
  }
  -[MHSchemaMHEndpointDetected trpId](self, "trpId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trpId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v14 == 0) == (v15 != 0))
  {
LABEL_70:

    goto LABEL_71;
  }
  -[MHSchemaMHEndpointDetected trpId](self, "trpId");
  v58 = objc_claimAutoreleasedReturnValue();
  if (!v58)
  {

LABEL_74:
    v63 = 1;
    goto LABEL_72;
  }
  v59 = (void *)v58;
  -[MHSchemaMHEndpointDetected trpId](self, "trpId");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trpId");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend(v60, "isEqual:", v61);

  if ((v62 & 1) != 0)
    goto LABEL_74;
LABEL_71:
  v63 = 0;
LABEL_72:

  return v63;
}

- (unint64_t)hash
{
  __int16 has;
  __int16 v4;
  unint64_t v5;
  __int16 v6;
  uint64_t v7;
  float endpointerThreshold;
  double v9;
  long double v10;
  double v11;
  unint64_t v12;
  unint64_t v13;
  float endpointerScore;
  double v15;
  long double v16;
  double v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v30 = 2654435761 * self->_endpointerType;
    if ((has & 2) != 0)
    {
LABEL_3:
      v29 = 2654435761u * self->_endpointAudioDurationInNs;
      if ((has & 4) != 0)
        goto LABEL_4;
LABEL_8:
      v28 = 0;
      if ((has & 8) != 0)
        goto LABEL_5;
      goto LABEL_9;
    }
  }
  else
  {
    v30 = 0;
    if ((has & 2) != 0)
      goto LABEL_3;
  }
  v29 = 0;
  if ((has & 4) == 0)
    goto LABEL_8;
LABEL_4:
  v28 = 2654435761u * self->_firstBufferTimeInNs;
  if ((has & 8) != 0)
  {
LABEL_5:
    v27 = 2654435761u * self->_endpointedBufferTimeInNs;
    goto LABEL_10;
  }
LABEL_9:
  v27 = 0;
LABEL_10:
  v26 = -[MHSchemaMHEndpointFeaturesAtEndpoint hash](self->_endpointFeaturesAtEndpoint, "hash");
  v4 = (__int16)self->_has;
  if ((v4 & 0x10) != 0)
  {
    v25 = 2654435761u * self->_endpointerDecisionLagInNs;
    if ((v4 & 0x20) != 0)
      goto LABEL_12;
  }
  else
  {
    v25 = 0;
    if ((v4 & 0x20) != 0)
    {
LABEL_12:
      v24 = 2654435761u * self->_extraDelayInNs;
      goto LABEL_15;
    }
  }
  v24 = 0;
LABEL_15:
  v5 = -[SISchemaVersion hash](self->_endpointModelConfigVersion, "hash");
  v6 = (__int16)self->_has;
  if ((v6 & 0x40) != 0)
  {
    v7 = 2654435761 * self->_derivedBufferTimeFromHistoricalAudio;
    if ((v6 & 0x80) != 0)
      goto LABEL_17;
LABEL_22:
    v12 = 0;
    goto LABEL_25;
  }
  v7 = 0;
  if ((v6 & 0x80) == 0)
    goto LABEL_22;
LABEL_17:
  endpointerThreshold = self->_endpointerThreshold;
  v9 = endpointerThreshold;
  if (endpointerThreshold < 0.0)
    v9 = -endpointerThreshold;
  v10 = floor(v9 + 0.5);
  v11 = (v9 - v10) * 1.84467441e19;
  v12 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
  if (v11 >= 0.0)
  {
    if (v11 > 0.0)
      v12 += (unint64_t)v11;
  }
  else
  {
    v12 -= (unint64_t)fabs(v11);
  }
LABEL_25:
  if ((v6 & 0x100) != 0)
  {
    endpointerScore = self->_endpointerScore;
    v15 = endpointerScore;
    if (endpointerScore < 0.0)
      v15 = -endpointerScore;
    v16 = floor(v15 + 0.5);
    v17 = (v15 - v16) * 1.84467441e19;
    v13 = 2654435761u * (unint64_t)fmod(v16, 1.84467441e19);
    if (v17 >= 0.0)
    {
      if (v17 > 0.0)
        v13 += (unint64_t)v17;
    }
    else
    {
      v13 -= (unint64_t)fabs(v17);
    }
  }
  else
  {
    v13 = 0;
  }
  if ((v6 & 0x200) != 0)
  {
    v18 = 2654435761u * self->_audioSkippedDurationInNs;
    if ((v6 & 0x400) != 0)
      goto LABEL_35;
  }
  else
  {
    v18 = 0;
    if ((v6 & 0x400) != 0)
    {
LABEL_35:
      v19 = 2654435761u * self->_endpointResetPositionInNs;
      goto LABEL_38;
    }
  }
  v19 = 0;
LABEL_38:
  v20 = -[MHSchemaMHStatisticDistributionInfo hash](self->_asrFeatureLatencyDistribution, "hash");
  v21 = -[MHSchemaMHEndpointerTimeoutMetadata hash](self->_timeoutMetadata, "hash");
  if ((*(_WORD *)&self->_has & 0x800) != 0)
    v22 = 2654435761 * self->_trpDetectionType;
  else
    v22 = 0;
  return v29 ^ v30 ^ v28 ^ v27 ^ v25 ^ v24 ^ v26 ^ v5 ^ v7 ^ v12 ^ v13 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ -[SISchemaUUID hash](self->_trpId, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __int16 has;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int16 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unsigned int v28;
  const __CFString *v29;
  void *v30;
  int v31;
  const __CFString *v32;
  const __CFString *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_asrFeatureLatencyDistribution)
  {
    -[MHSchemaMHEndpointDetected asrFeatureLatencyDistribution](self, "asrFeatureLatencyDistribution");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("asrFeatureLatencyDistribution"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("asrFeatureLatencyDistribution"));

    }
  }
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHEndpointDetected audioSkippedDurationInNs](self, "audioSkippedDurationInNs"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("audioSkippedDurationInNs"));

    has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_8:
      if ((has & 2) == 0)
        goto LABEL_10;
      goto LABEL_9;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MHSchemaMHEndpointDetected derivedBufferTimeFromHistoricalAudio](self, "derivedBufferTimeFromHistoricalAudio"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("derivedBufferTimeFromHistoricalAudio"));

  if ((*(_WORD *)&self->_has & 2) != 0)
  {
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHEndpointDetected endpointAudioDurationInNs](self, "endpointAudioDurationInNs"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("endpointAudioDurationInNs"));

  }
LABEL_10:
  if (self->_endpointFeaturesAtEndpoint)
  {
    -[MHSchemaMHEndpointDetected endpointFeaturesAtEndpoint](self, "endpointFeaturesAtEndpoint");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("endpointFeaturesAtEndpoint"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("endpointFeaturesAtEndpoint"));

    }
  }
  if (self->_endpointModelConfigVersion)
  {
    -[MHSchemaMHEndpointDetected endpointModelConfigVersion](self, "endpointModelConfigVersion");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("endpointModelConfigVersion"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("endpointModelConfigVersion"));

    }
  }
  v17 = (__int16)self->_has;
  if ((v17 & 0x400) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHEndpointDetected endpointResetPositionInNs](self, "endpointResetPositionInNs"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("endpointResetPositionInNs"));

    v17 = (__int16)self->_has;
    if ((v17 & 8) == 0)
    {
LABEL_25:
      if ((v17 & 0x10) == 0)
        goto LABEL_26;
      goto LABEL_37;
    }
  }
  else if ((v17 & 8) == 0)
  {
    goto LABEL_25;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHEndpointDetected endpointedBufferTimeInNs](self, "endpointedBufferTimeInNs"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("endpointedBufferTimeInNs"));

  v17 = (__int16)self->_has;
  if ((v17 & 0x10) == 0)
  {
LABEL_26:
    if ((v17 & 0x100) == 0)
      goto LABEL_27;
    goto LABEL_38;
  }
LABEL_37:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHEndpointDetected endpointerDecisionLagInNs](self, "endpointerDecisionLagInNs"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("endpointerDecisionLagInNs"));

  v17 = (__int16)self->_has;
  if ((v17 & 0x100) == 0)
  {
LABEL_27:
    if ((v17 & 0x80) == 0)
      goto LABEL_28;
    goto LABEL_39;
  }
LABEL_38:
  v24 = (void *)MEMORY[0x1E0CB37E8];
  -[MHSchemaMHEndpointDetected endpointerScore](self, "endpointerScore");
  objc_msgSend(v24, "numberWithFloat:");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("endpointerScore"));

  v17 = (__int16)self->_has;
  if ((v17 & 0x80) == 0)
  {
LABEL_28:
    if ((v17 & 1) == 0)
      goto LABEL_29;
    goto LABEL_40;
  }
LABEL_39:
  v26 = (void *)MEMORY[0x1E0CB37E8];
  -[MHSchemaMHEndpointDetected endpointerThreshold](self, "endpointerThreshold");
  objc_msgSend(v26, "numberWithFloat:");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("endpointerThreshold"));

  v17 = (__int16)self->_has;
  if ((v17 & 1) == 0)
  {
LABEL_29:
    if ((v17 & 0x20) == 0)
      goto LABEL_30;
    goto LABEL_56;
  }
LABEL_40:
  v28 = -[MHSchemaMHEndpointDetected endpointerType](self, "endpointerType") - 1;
  if (v28 > 6)
    v29 = CFSTR("MHENDPOINTER_TYPE_UNDEFINED");
  else
    v29 = off_1E5630618[v28];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("endpointerType"));
  v17 = (__int16)self->_has;
  if ((v17 & 0x20) == 0)
  {
LABEL_30:
    if ((v17 & 4) == 0)
      goto LABEL_32;
    goto LABEL_31;
  }
LABEL_56:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHEndpointDetected extraDelayInNs](self, "extraDelayInNs"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("extraDelayInNs"));

  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_31:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHEndpointDetected firstBufferTimeInNs](self, "firstBufferTimeInNs"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("firstBufferTimeInNs"));

  }
LABEL_32:
  if (self->_timeoutMetadata)
  {
    -[MHSchemaMHEndpointDetected timeoutMetadata](self, "timeoutMetadata");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("timeoutMetadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("timeoutMetadata"));

    }
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    v31 = -[MHSchemaMHEndpointDetected trpDetectionType](self, "trpDetectionType");
    v32 = CFSTR("MHTRPDETECTIONTYPE_UNKNOWN");
    if (v31 == 1)
      v32 = CFSTR("MHTRPDETECTIONTYPE_DEFAULT");
    if (v31 == 2)
      v33 = CFSTR("MHTRPDETECTIONTYPE_RELAXED");
    else
      v33 = v32;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("trpDetectionType"));
  }
  if (self->_trpId)
  {
    -[MHSchemaMHEndpointDetected trpId](self, "trpId");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "dictionaryRepresentation");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("trpId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("trpId"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[MHSchemaMHEndpointDetected dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (MHSchemaMHEndpointDetected)initWithJSON:(id)a3
{
  void *v4;
  MHSchemaMHEndpointDetected *v5;
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
    self = -[MHSchemaMHEndpointDetected initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (MHSchemaMHEndpointDetected)initWithDictionary:(id)a3
{
  id v4;
  MHSchemaMHEndpointDetected *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  MHSchemaMHEndpointFeaturesAtEndpoint *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  SISchemaVersion *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  MHSchemaMHStatisticDistributionInfo *v22;
  void *v23;
  MHSchemaMHEndpointerTimeoutMetadata *v24;
  void *v25;
  void *v26;
  SISchemaUUID *v27;
  MHSchemaMHEndpointDetected *v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  objc_super v40;

  v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)MHSchemaMHEndpointDetected;
  v5 = -[MHSchemaMHEndpointDetected init](&v40, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("endpointerType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHEndpointDetected setEndpointerType:](v5, "setEndpointerType:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("endpointAudioDurationInNs"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHEndpointDetected setEndpointAudioDurationInNs:](v5, "setEndpointAudioDurationInNs:", objc_msgSend(v7, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstBufferTimeInNs"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHEndpointDetected setFirstBufferTimeInNs:](v5, "setFirstBufferTimeInNs:", objc_msgSend(v8, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("endpointedBufferTimeInNs"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHEndpointDetected setEndpointedBufferTimeInNs:](v5, "setEndpointedBufferTimeInNs:", objc_msgSend(v9, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("endpointFeaturesAtEndpoint"));
    v10 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[MHSchemaMHEndpointFeaturesAtEndpoint initWithDictionary:]([MHSchemaMHEndpointFeaturesAtEndpoint alloc], "initWithDictionary:", v10);
      -[MHSchemaMHEndpointDetected setEndpointFeaturesAtEndpoint:](v5, "setEndpointFeaturesAtEndpoint:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("endpointerDecisionLagInNs"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHEndpointDetected setEndpointerDecisionLagInNs:](v5, "setEndpointerDecisionLagInNs:", objc_msgSend(v12, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("extraDelayInNs"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v39 = v13;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHEndpointDetected setExtraDelayInNs:](v5, "setExtraDelayInNs:", objc_msgSend(v13, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("endpointModelConfigVersion"));
    v14 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v38 = (void *)v14;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[SISchemaVersion initWithDictionary:]([SISchemaVersion alloc], "initWithDictionary:", v14);
      -[MHSchemaMHEndpointDetected setEndpointModelConfigVersion:](v5, "setEndpointModelConfigVersion:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("derivedBufferTimeFromHistoricalAudio"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHEndpointDetected setDerivedBufferTimeFromHistoricalAudio:](v5, "setDerivedBufferTimeFromHistoricalAudio:", objc_msgSend(v16, "BOOLValue"));
    v37 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("endpointerThreshold"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v17, "floatValue");
      -[MHSchemaMHEndpointDetected setEndpointerThreshold:](v5, "setEndpointerThreshold:");
    }
    v36 = v7;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("endpointerScore"), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v18, "floatValue");
      -[MHSchemaMHEndpointDetected setEndpointerScore:](v5, "setEndpointerScore:");
    }
    v35 = v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioSkippedDurationInNs"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHEndpointDetected setAudioSkippedDurationInNs:](v5, "setAudioSkippedDurationInNs:", objc_msgSend(v19, "unsignedLongLongValue"));
    v34 = v9;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("endpointResetPositionInNs"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHEndpointDetected setEndpointResetPositionInNs:](v5, "setEndpointResetPositionInNs:", objc_msgSend(v20, "unsignedLongLongValue"));
    v31 = v16;
    v33 = (void *)v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("asrFeatureLatencyDistribution"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = -[MHSchemaMHStatisticDistributionInfo initWithDictionary:]([MHSchemaMHStatisticDistributionInfo alloc], "initWithDictionary:", v21);
      -[MHSchemaMHEndpointDetected setAsrFeatureLatencyDistribution:](v5, "setAsrFeatureLatencyDistribution:", v22);

    }
    v32 = v12;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeoutMetadata"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v24 = -[MHSchemaMHEndpointerTimeoutMetadata initWithDictionary:]([MHSchemaMHEndpointerTimeoutMetadata alloc], "initWithDictionary:", v23);
      -[MHSchemaMHEndpointDetected setTimeoutMetadata:](v5, "setTimeoutMetadata:", v24);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trpDetectionType"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHEndpointDetected setTrpDetectionType:](v5, "setTrpDetectionType:", objc_msgSend(v25, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trpId"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v26);
      -[MHSchemaMHEndpointDetected setTrpId:](v5, "setTrpId:", v27);

    }
    v28 = v5;

  }
  return v5;
}

- (int)endpointerType
{
  return self->_endpointerType;
}

- (unint64_t)endpointAudioDurationInNs
{
  return self->_endpointAudioDurationInNs;
}

- (unint64_t)firstBufferTimeInNs
{
  return self->_firstBufferTimeInNs;
}

- (unint64_t)endpointedBufferTimeInNs
{
  return self->_endpointedBufferTimeInNs;
}

- (MHSchemaMHEndpointFeaturesAtEndpoint)endpointFeaturesAtEndpoint
{
  return self->_endpointFeaturesAtEndpoint;
}

- (void)setEndpointFeaturesAtEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_endpointFeaturesAtEndpoint, a3);
}

- (unint64_t)endpointerDecisionLagInNs
{
  return self->_endpointerDecisionLagInNs;
}

- (unint64_t)extraDelayInNs
{
  return self->_extraDelayInNs;
}

- (SISchemaVersion)endpointModelConfigVersion
{
  return self->_endpointModelConfigVersion;
}

- (void)setEndpointModelConfigVersion:(id)a3
{
  objc_storeStrong((id *)&self->_endpointModelConfigVersion, a3);
}

- (BOOL)derivedBufferTimeFromHistoricalAudio
{
  return self->_derivedBufferTimeFromHistoricalAudio;
}

- (float)endpointerThreshold
{
  return self->_endpointerThreshold;
}

- (float)endpointerScore
{
  return self->_endpointerScore;
}

- (unint64_t)audioSkippedDurationInNs
{
  return self->_audioSkippedDurationInNs;
}

- (unint64_t)endpointResetPositionInNs
{
  return self->_endpointResetPositionInNs;
}

- (MHSchemaMHStatisticDistributionInfo)asrFeatureLatencyDistribution
{
  return self->_asrFeatureLatencyDistribution;
}

- (void)setAsrFeatureLatencyDistribution:(id)a3
{
  objc_storeStrong((id *)&self->_asrFeatureLatencyDistribution, a3);
}

- (MHSchemaMHEndpointerTimeoutMetadata)timeoutMetadata
{
  return self->_timeoutMetadata;
}

- (void)setTimeoutMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_timeoutMetadata, a3);
}

- (int)trpDetectionType
{
  return self->_trpDetectionType;
}

- (SISchemaUUID)trpId
{
  return self->_trpId;
}

- (void)setTrpId:(id)a3
{
  objc_storeStrong((id *)&self->_trpId, a3);
}

- (void)setHasEndpointFeaturesAtEndpoint:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasEndpointModelConfigVersion:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void)setHasAsrFeatureLatencyDistribution:(BOOL)a3
{
  self->_hasEndpointFeaturesAtEndpoint = a3;
}

- (void)setHasTimeoutMetadata:(BOOL)a3
{
  self->_hasEndpointModelConfigVersion = a3;
}

- (void)setHasTrpId:(BOOL)a3
{
  self->_hasAsrFeatureLatencyDistribution = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trpId, 0);
  objc_storeStrong((id *)&self->_timeoutMetadata, 0);
  objc_storeStrong((id *)&self->_asrFeatureLatencyDistribution, 0);
  objc_storeStrong((id *)&self->_endpointModelConfigVersion, 0);
  objc_storeStrong((id *)&self->_endpointFeaturesAtEndpoint, 0);
}

@end
