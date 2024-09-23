@implementation MHSchemaMHEndpointFeaturesAtEndpoint

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setTrailingSilenceDurationInNs:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_trailingSilenceDurationInNs = a3;
}

- (BOOL)hasTrailingSilenceDurationInNs
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHasTrailingSilenceDurationInNs:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (void)deleteTrailingSilenceDurationInNs
{
  -[MHSchemaMHEndpointFeaturesAtEndpoint setTrailingSilenceDurationInNs:](self, "setTrailingSilenceDurationInNs:", 0);
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setClientSilenceFramesCountInNs:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_clientSilenceFramesCountInNs = a3;
}

- (BOOL)hasClientSilenceFramesCountInNs
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHasClientSilenceFramesCountInNs:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (void)deleteClientSilenceFramesCountInNs
{
  -[MHSchemaMHEndpointFeaturesAtEndpoint setClientSilenceFramesCountInNs:](self, "setClientSilenceFramesCountInNs:", 0);
  *(_WORD *)&self->_has &= ~2u;
}

- (void)setEndOfSentenceLikelihood:(float)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_endOfSentenceLikelihood = a3;
}

- (BOOL)hasEndOfSentenceLikelihood
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setHasEndOfSentenceLikelihood:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (void)deleteEndOfSentenceLikelihood
{
  double v2;

  LODWORD(v2) = 0;
  -[MHSchemaMHEndpointFeaturesAtEndpoint setEndOfSentenceLikelihood:](self, "setEndOfSentenceLikelihood:", v2);
  *(_WORD *)&self->_has &= ~4u;
}

- (void)setWordCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_wordCount = a3;
}

- (BOOL)hasWordCount
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHasWordCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (void)deleteWordCount
{
  -[MHSchemaMHEndpointFeaturesAtEndpoint setWordCount:](self, "setWordCount:", 0);
  *(_WORD *)&self->_has &= ~8u;
}

- (void)setServerFeaturesLatencyInNs:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_serverFeaturesLatencyInNs = a3;
}

- (BOOL)hasServerFeaturesLatencyInNs
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHasServerFeaturesLatencyInNs:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (void)deleteServerFeaturesLatencyInNs
{
  -[MHSchemaMHEndpointFeaturesAtEndpoint setServerFeaturesLatencyInNs:](self, "setServerFeaturesLatencyInNs:", 0);
  *(_WORD *)&self->_has &= ~0x10u;
}

- (void)setClientSilenceProbability:(float)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_clientSilenceProbability = a3;
}

- (BOOL)hasClientSilenceProbability
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHasClientSilenceProbability:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (void)deleteClientSilenceProbability
{
  double v2;

  LODWORD(v2) = 0;
  -[MHSchemaMHEndpointFeaturesAtEndpoint setClientSilenceProbability:](self, "setClientSilenceProbability:", v2);
  *(_WORD *)&self->_has &= ~0x20u;
}

- (void)setRcTrailingSilenceDuration:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_rcTrailingSilenceDuration = a3;
}

- (BOOL)hasRcTrailingSilenceDuration
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHasRcTrailingSilenceDuration:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (void)deleteRcTrailingSilenceDuration
{
  -[MHSchemaMHEndpointFeaturesAtEndpoint setRcTrailingSilenceDuration:](self, "setRcTrailingSilenceDuration:", 0);
  *(_WORD *)&self->_has &= ~0x40u;
}

- (void)setRcEndOfSentenceLikelihood:(float)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_rcEndOfSentenceLikelihood = a3;
}

- (BOOL)hasRcEndOfSentenceLikelihood
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHasRcEndOfSentenceLikelihood:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (void)deleteRcEndOfSentenceLikelihood
{
  double v2;

  LODWORD(v2) = 0;
  -[MHSchemaMHEndpointFeaturesAtEndpoint setRcEndOfSentenceLikelihood:](self, "setRcEndOfSentenceLikelihood:", v2);
  *(_WORD *)&self->_has &= ~0x80u;
}

- (void)setRcWordCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_rcWordCount = a3;
}

- (BOOL)hasRcWordCount
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHasRcWordCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (void)deleteRcWordCount
{
  -[MHSchemaMHEndpointFeaturesAtEndpoint setRcWordCount:](self, "setRcWordCount:", 0);
  *(_WORD *)&self->_has &= ~0x100u;
}

- (void)setRcServerFeaturesLatency:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_rcServerFeaturesLatency = a3;
}

- (BOOL)hasRcServerFeaturesLatency
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setHasRcServerFeaturesLatency:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (void)deleteRcServerFeaturesLatency
{
  -[MHSchemaMHEndpointFeaturesAtEndpoint setRcServerFeaturesLatency:](self, "setRcServerFeaturesLatency:", 0);
  *(_WORD *)&self->_has &= ~0x200u;
}

- (void)setSilencePosterior:(float)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_silencePosterior = a3;
}

- (BOOL)hasSilencePosterior
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setHasSilencePosterior:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (void)deleteSilencePosterior
{
  double v2;

  LODWORD(v2) = 0;
  -[MHSchemaMHEndpointFeaturesAtEndpoint setSilencePosterior:](self, "setSilencePosterior:", v2);
  *(_WORD *)&self->_has &= ~0x400u;
}

- (void)setAcousticEndpointerScore:(float)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_acousticEndpointerScore = a3;
}

- (BOOL)hasAcousticEndpointerScore
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setHasAcousticEndpointerScore:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (void)deleteAcousticEndpointerScore
{
  double v2;

  LODWORD(v2) = 0;
  -[MHSchemaMHEndpointFeaturesAtEndpoint setAcousticEndpointerScore:](self, "setAcousticEndpointerScore:", v2);
  *(_WORD *)&self->_has &= ~0x800u;
}

- (void)setSilencePosteriorFrameCountInNs:(float)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_silencePosteriorFrameCountInNs = a3;
}

- (BOOL)hasSilencePosteriorFrameCountInNs
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setHasSilencePosteriorFrameCountInNs:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (void)deleteSilencePosteriorFrameCountInNs
{
  double v2;

  LODWORD(v2) = 0;
  -[MHSchemaMHEndpointFeaturesAtEndpoint setSilencePosteriorFrameCountInNs:](self, "setSilencePosteriorFrameCountInNs:", v2);
  *(_WORD *)&self->_has &= ~0x1000u;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return MHSchemaMHEndpointFeaturesAtEndpointReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  id v5;

  v5 = a3;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_18;
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
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteFloatField();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteFloatField();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteFloatField();
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_11:
    if ((has & 0x400) == 0)
      goto LABEL_12;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_12:
    if ((has & 0x800) == 0)
      goto LABEL_13;
LABEL_27:
    PBDataWriterWriteFloatField();
    if ((*(_WORD *)&self->_has & 0x1000) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_26:
  PBDataWriterWriteFloatField();
  has = (__int16)self->_has;
  if ((has & 0x800) != 0)
    goto LABEL_27;
LABEL_13:
  if ((has & 0x1000) != 0)
LABEL_14:
    PBDataWriterWriteFloatField();
LABEL_15:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int16 *v4;
  $C6664201A8BA03BFBD1D08B6C538B099 has;
  unsigned int v6;
  unint64_t trailingSilenceDurationInNs;
  int v8;
  unint64_t clientSilenceFramesCountInNs;
  int v10;
  float endOfSentenceLikelihood;
  float v12;
  int v13;
  unsigned int wordCount;
  int v15;
  unint64_t serverFeaturesLatencyInNs;
  int v17;
  float clientSilenceProbability;
  float v19;
  int v20;
  unint64_t rcTrailingSilenceDuration;
  int v22;
  float rcEndOfSentenceLikelihood;
  float v24;
  int v25;
  unsigned int rcWordCount;
  int v27;
  unint64_t rcServerFeaturesLatency;
  int v29;
  float silencePosterior;
  float v31;
  int v32;
  float acousticEndpointerScore;
  float v34;
  int v35;
  float silencePosteriorFrameCountInNs;
  float v37;
  BOOL v38;

  v4 = (unsigned __int16 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_53;
  has = self->_has;
  v6 = v4[42];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_53;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    trailingSilenceDurationInNs = self->_trailingSilenceDurationInNs;
    if (trailingSilenceDurationInNs != objc_msgSend(v4, "trailingSilenceDurationInNs"))
      goto LABEL_53;
    has = self->_has;
    v6 = v4[42];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (v8)
    {
      clientSilenceFramesCountInNs = self->_clientSilenceFramesCountInNs;
      if (clientSilenceFramesCountInNs != objc_msgSend(v4, "clientSilenceFramesCountInNs"))
        goto LABEL_53;
      has = self->_has;
      v6 = v4[42];
    }
    v10 = (*(unsigned int *)&has >> 2) & 1;
    if (v10 == ((v6 >> 2) & 1))
    {
      if (v10)
      {
        endOfSentenceLikelihood = self->_endOfSentenceLikelihood;
        objc_msgSend(v4, "endOfSentenceLikelihood");
        if (endOfSentenceLikelihood != v12)
          goto LABEL_53;
        has = self->_has;
        v6 = v4[42];
      }
      v13 = (*(unsigned int *)&has >> 3) & 1;
      if (v13 == ((v6 >> 3) & 1))
      {
        if (v13)
        {
          wordCount = self->_wordCount;
          if (wordCount != objc_msgSend(v4, "wordCount"))
            goto LABEL_53;
          has = self->_has;
          v6 = v4[42];
        }
        v15 = (*(unsigned int *)&has >> 4) & 1;
        if (v15 == ((v6 >> 4) & 1))
        {
          if (v15)
          {
            serverFeaturesLatencyInNs = self->_serverFeaturesLatencyInNs;
            if (serverFeaturesLatencyInNs != objc_msgSend(v4, "serverFeaturesLatencyInNs"))
              goto LABEL_53;
            has = self->_has;
            v6 = v4[42];
          }
          v17 = (*(unsigned int *)&has >> 5) & 1;
          if (v17 == ((v6 >> 5) & 1))
          {
            if (v17)
            {
              clientSilenceProbability = self->_clientSilenceProbability;
              objc_msgSend(v4, "clientSilenceProbability");
              if (clientSilenceProbability != v19)
                goto LABEL_53;
              has = self->_has;
              v6 = v4[42];
            }
            v20 = (*(unsigned int *)&has >> 6) & 1;
            if (v20 == ((v6 >> 6) & 1))
            {
              if (v20)
              {
                rcTrailingSilenceDuration = self->_rcTrailingSilenceDuration;
                if (rcTrailingSilenceDuration != objc_msgSend(v4, "rcTrailingSilenceDuration"))
                  goto LABEL_53;
                has = self->_has;
                v6 = v4[42];
              }
              v22 = (*(unsigned int *)&has >> 7) & 1;
              if (v22 == ((v6 >> 7) & 1))
              {
                if (v22)
                {
                  rcEndOfSentenceLikelihood = self->_rcEndOfSentenceLikelihood;
                  objc_msgSend(v4, "rcEndOfSentenceLikelihood");
                  if (rcEndOfSentenceLikelihood != v24)
                    goto LABEL_53;
                  has = self->_has;
                  v6 = v4[42];
                }
                v25 = (*(unsigned int *)&has >> 8) & 1;
                if (v25 == ((v6 >> 8) & 1))
                {
                  if (v25)
                  {
                    rcWordCount = self->_rcWordCount;
                    if (rcWordCount != objc_msgSend(v4, "rcWordCount"))
                      goto LABEL_53;
                    has = self->_has;
                    v6 = v4[42];
                  }
                  v27 = (*(unsigned int *)&has >> 9) & 1;
                  if (v27 == ((v6 >> 9) & 1))
                  {
                    if (v27)
                    {
                      rcServerFeaturesLatency = self->_rcServerFeaturesLatency;
                      if (rcServerFeaturesLatency != objc_msgSend(v4, "rcServerFeaturesLatency"))
                        goto LABEL_53;
                      has = self->_has;
                      v6 = v4[42];
                    }
                    v29 = (*(unsigned int *)&has >> 10) & 1;
                    if (v29 == ((v6 >> 10) & 1))
                    {
                      if (v29)
                      {
                        silencePosterior = self->_silencePosterior;
                        objc_msgSend(v4, "silencePosterior");
                        if (silencePosterior != v31)
                          goto LABEL_53;
                        has = self->_has;
                        v6 = v4[42];
                      }
                      v32 = (*(unsigned int *)&has >> 11) & 1;
                      if (v32 == ((v6 >> 11) & 1))
                      {
                        if (v32)
                        {
                          acousticEndpointerScore = self->_acousticEndpointerScore;
                          objc_msgSend(v4, "acousticEndpointerScore");
                          if (acousticEndpointerScore != v34)
                            goto LABEL_53;
                          has = self->_has;
                          v6 = v4[42];
                        }
                        v35 = (*(unsigned int *)&has >> 12) & 1;
                        if (v35 == ((v6 >> 12) & 1))
                        {
                          if (!v35
                            || (silencePosteriorFrameCountInNs = self->_silencePosteriorFrameCountInNs,
                                objc_msgSend(v4, "silencePosteriorFrameCountInNs"),
                                silencePosteriorFrameCountInNs == v37))
                          {
                            v38 = 1;
                            goto LABEL_54;
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_53:
  v38 = 0;
LABEL_54:

  return v38;
}

- (unint64_t)hash
{
  __int16 has;
  float endOfSentenceLikelihood;
  double v5;
  long double v6;
  double v7;
  unint64_t v8;
  float clientSilenceProbability;
  double v10;
  long double v11;
  double v12;
  unint64_t v13;
  float rcEndOfSentenceLikelihood;
  double v15;
  long double v16;
  double v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  float silencePosterior;
  double v22;
  long double v23;
  double v24;
  unint64_t v25;
  unint64_t v26;
  float acousticEndpointerScore;
  double v28;
  long double v29;
  double v30;
  unint64_t v31;
  float silencePosteriorFrameCountInNs;
  double v33;
  long double v34;
  double v35;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;

  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
    v41 = 0;
    if ((has & 2) != 0)
      goto LABEL_3;
LABEL_9:
    v40 = 0;
    if ((has & 4) != 0)
      goto LABEL_4;
LABEL_10:
    v8 = 0;
    goto LABEL_13;
  }
  v41 = 2654435761u * self->_trailingSilenceDurationInNs;
  if ((has & 2) == 0)
    goto LABEL_9;
LABEL_3:
  v40 = 2654435761u * self->_clientSilenceFramesCountInNs;
  if ((has & 4) == 0)
    goto LABEL_10;
LABEL_4:
  endOfSentenceLikelihood = self->_endOfSentenceLikelihood;
  v5 = endOfSentenceLikelihood;
  if (endOfSentenceLikelihood < 0.0)
    v5 = -endOfSentenceLikelihood;
  v6 = floor(v5 + 0.5);
  v7 = (v5 - v6) * 1.84467441e19;
  v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0)
      v8 += (unint64_t)v7;
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
LABEL_13:
  if ((has & 8) == 0)
  {
    v39 = 0;
    if ((has & 0x10) != 0)
      goto LABEL_15;
LABEL_21:
    v38 = 0;
    if ((has & 0x20) != 0)
      goto LABEL_16;
LABEL_22:
    v13 = 0;
    goto LABEL_25;
  }
  v39 = 2654435761 * self->_wordCount;
  if ((has & 0x10) == 0)
    goto LABEL_21;
LABEL_15:
  v38 = 2654435761u * self->_serverFeaturesLatencyInNs;
  if ((has & 0x20) == 0)
    goto LABEL_22;
LABEL_16:
  clientSilenceProbability = self->_clientSilenceProbability;
  v10 = clientSilenceProbability;
  if (clientSilenceProbability < 0.0)
    v10 = -clientSilenceProbability;
  v11 = floor(v10 + 0.5);
  v12 = (v10 - v11) * 1.84467441e19;
  v13 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
  if (v12 >= 0.0)
  {
    if (v12 > 0.0)
      v13 += (unint64_t)v12;
  }
  else
  {
    v13 -= (unint64_t)fabs(v12);
  }
LABEL_25:
  if ((has & 0x40) != 0)
  {
    v37 = 2654435761u * self->_rcTrailingSilenceDuration;
    if ((has & 0x80) != 0)
      goto LABEL_27;
LABEL_32:
    v18 = 0;
    goto LABEL_35;
  }
  v37 = 0;
  if ((has & 0x80) == 0)
    goto LABEL_32;
LABEL_27:
  rcEndOfSentenceLikelihood = self->_rcEndOfSentenceLikelihood;
  v15 = rcEndOfSentenceLikelihood;
  if (rcEndOfSentenceLikelihood < 0.0)
    v15 = -rcEndOfSentenceLikelihood;
  v16 = floor(v15 + 0.5);
  v17 = (v15 - v16) * 1.84467441e19;
  v18 = 2654435761u * (unint64_t)fmod(v16, 1.84467441e19);
  if (v17 >= 0.0)
  {
    if (v17 > 0.0)
      v18 += (unint64_t)v17;
  }
  else
  {
    v18 -= (unint64_t)fabs(v17);
  }
LABEL_35:
  if ((has & 0x100) == 0)
  {
    v19 = 0;
    if ((has & 0x200) != 0)
      goto LABEL_37;
LABEL_43:
    v20 = 0;
    if ((has & 0x400) != 0)
      goto LABEL_38;
LABEL_44:
    v25 = 0;
    goto LABEL_47;
  }
  v19 = 2654435761 * self->_rcWordCount;
  if ((has & 0x200) == 0)
    goto LABEL_43;
LABEL_37:
  v20 = 2654435761u * self->_rcServerFeaturesLatency;
  if ((has & 0x400) == 0)
    goto LABEL_44;
LABEL_38:
  silencePosterior = self->_silencePosterior;
  v22 = silencePosterior;
  if (silencePosterior < 0.0)
    v22 = -silencePosterior;
  v23 = floor(v22 + 0.5);
  v24 = (v22 - v23) * 1.84467441e19;
  v25 = 2654435761u * (unint64_t)fmod(v23, 1.84467441e19);
  if (v24 >= 0.0)
  {
    if (v24 > 0.0)
      v25 += (unint64_t)v24;
  }
  else
  {
    v25 -= (unint64_t)fabs(v24);
  }
LABEL_47:
  if ((has & 0x800) != 0)
  {
    acousticEndpointerScore = self->_acousticEndpointerScore;
    v28 = acousticEndpointerScore;
    if (acousticEndpointerScore < 0.0)
      v28 = -acousticEndpointerScore;
    v29 = floor(v28 + 0.5);
    v30 = (v28 - v29) * 1.84467441e19;
    v26 = 2654435761u * (unint64_t)fmod(v29, 1.84467441e19);
    if (v30 >= 0.0)
    {
      if (v30 > 0.0)
        v26 += (unint64_t)v30;
    }
    else
    {
      v26 -= (unint64_t)fabs(v30);
    }
  }
  else
  {
    v26 = 0;
  }
  if ((has & 0x1000) != 0)
  {
    silencePosteriorFrameCountInNs = self->_silencePosteriorFrameCountInNs;
    v33 = silencePosteriorFrameCountInNs;
    if (silencePosteriorFrameCountInNs < 0.0)
      v33 = -silencePosteriorFrameCountInNs;
    v34 = floor(v33 + 0.5);
    v35 = (v33 - v34) * 1.84467441e19;
    v31 = 2654435761u * (unint64_t)fmod(v34, 1.84467441e19);
    if (v35 >= 0.0)
    {
      if (v35 > 0.0)
        v31 += (unint64_t)v35;
    }
    else
    {
      v31 -= (unint64_t)fabs(v35);
    }
  }
  else
  {
    v31 = 0;
  }
  return v40 ^ v41 ^ v8 ^ v39 ^ v38 ^ v13 ^ v37 ^ v18 ^ v19 ^ v20 ^ v25 ^ v26 ^ v31;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (__int16)self->_has;
  if ((has & 0x800) != 0)
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    -[MHSchemaMHEndpointFeaturesAtEndpoint acousticEndpointerScore](self, "acousticEndpointerScore");
    objc_msgSend(v7, "numberWithFloat:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("acousticEndpointerScore"));

    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHEndpointFeaturesAtEndpoint clientSilenceFramesCountInNs](self, "clientSilenceFramesCountInNs"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("clientSilenceFramesCountInNs"));

  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[MHSchemaMHEndpointFeaturesAtEndpoint clientSilenceProbability](self, "clientSilenceProbability");
  objc_msgSend(v10, "numberWithFloat:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("clientSilenceProbability"));

  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  v12 = (void *)MEMORY[0x1E0CB37E8];
  -[MHSchemaMHEndpointFeaturesAtEndpoint endOfSentenceLikelihood](self, "endOfSentenceLikelihood");
  objc_msgSend(v12, "numberWithFloat:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("endOfSentenceLikelihood"));

  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x200) == 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  v14 = (void *)MEMORY[0x1E0CB37E8];
  -[MHSchemaMHEndpointFeaturesAtEndpoint rcEndOfSentenceLikelihood](self, "rcEndOfSentenceLikelihood");
  objc_msgSend(v14, "numberWithFloat:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("rcEndOfSentenceLikelihood"));

  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHEndpointFeaturesAtEndpoint rcServerFeaturesLatency](self, "rcServerFeaturesLatency"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("rcServerFeaturesLatency"));

  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x100) == 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHEndpointFeaturesAtEndpoint rcTrailingSilenceDuration](self, "rcTrailingSilenceDuration"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("rcTrailingSilenceDuration"));

  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[MHSchemaMHEndpointFeaturesAtEndpoint rcWordCount](self, "rcWordCount"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("rcWordCount"));

  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 0x400) == 0)
      goto LABEL_11;
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHEndpointFeaturesAtEndpoint serverFeaturesLatencyInNs](self, "serverFeaturesLatencyInNs"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("serverFeaturesLatencyInNs"));

  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_11:
    if ((has & 0x1000) == 0)
      goto LABEL_12;
    goto LABEL_26;
  }
LABEL_25:
  v20 = (void *)MEMORY[0x1E0CB37E8];
  -[MHSchemaMHEndpointFeaturesAtEndpoint silencePosterior](self, "silencePosterior");
  objc_msgSend(v20, "numberWithFloat:");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("silencePosterior"));

  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_12:
    if ((has & 1) == 0)
      goto LABEL_13;
LABEL_27:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHEndpointFeaturesAtEndpoint trailingSilenceDurationInNs](self, "trailingSilenceDurationInNs"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("trailingSilenceDurationInNs"));

    if ((*(_WORD *)&self->_has & 8) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_26:
  v22 = (void *)MEMORY[0x1E0CB37E8];
  -[MHSchemaMHEndpointFeaturesAtEndpoint silencePosteriorFrameCountInNs](self, "silencePosteriorFrameCountInNs");
  objc_msgSend(v22, "numberWithFloat:");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("silencePosteriorFrameCountInNs"));

  has = (__int16)self->_has;
  if ((has & 1) != 0)
    goto LABEL_27;
LABEL_13:
  if ((has & 8) != 0)
  {
LABEL_14:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[MHSchemaMHEndpointFeaturesAtEndpoint wordCount](self, "wordCount"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("wordCount"));

  }
LABEL_15:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[MHSchemaMHEndpointFeaturesAtEndpoint dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (MHSchemaMHEndpointFeaturesAtEndpoint)initWithJSON:(id)a3
{
  void *v4;
  MHSchemaMHEndpointFeaturesAtEndpoint *v5;
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
    self = -[MHSchemaMHEndpointFeaturesAtEndpoint initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (MHSchemaMHEndpointFeaturesAtEndpoint)initWithDictionary:(id)a3
{
  id v4;
  MHSchemaMHEndpointFeaturesAtEndpoint *v5;
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
  MHSchemaMHEndpointFeaturesAtEndpoint *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)MHSchemaMHEndpointFeaturesAtEndpoint;
  v5 = -[MHSchemaMHEndpointFeaturesAtEndpoint init](&v28, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trailingSilenceDurationInNs"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHEndpointFeaturesAtEndpoint setTrailingSilenceDurationInNs:](v5, "setTrailingSilenceDurationInNs:", objc_msgSend(v6, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("clientSilenceFramesCountInNs"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHEndpointFeaturesAtEndpoint setClientSilenceFramesCountInNs:](v5, "setClientSilenceFramesCountInNs:", objc_msgSend(v7, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("endOfSentenceLikelihood"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "floatValue");
      -[MHSchemaMHEndpointFeaturesAtEndpoint setEndOfSentenceLikelihood:](v5, "setEndOfSentenceLikelihood:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("wordCount"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHEndpointFeaturesAtEndpoint setWordCount:](v5, "setWordCount:", objc_msgSend(v9, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("serverFeaturesLatencyInNs"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHEndpointFeaturesAtEndpoint setServerFeaturesLatencyInNs:](v5, "setServerFeaturesLatencyInNs:", objc_msgSend(v10, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("clientSilenceProbability"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v11, "floatValue");
      -[MHSchemaMHEndpointFeaturesAtEndpoint setClientSilenceProbability:](v5, "setClientSilenceProbability:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rcTrailingSilenceDuration"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHEndpointFeaturesAtEndpoint setRcTrailingSilenceDuration:](v5, "setRcTrailingSilenceDuration:", objc_msgSend(v12, "unsignedLongLongValue"));
    v27 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rcEndOfSentenceLikelihood"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v13, "floatValue");
      -[MHSchemaMHEndpointFeaturesAtEndpoint setRcEndOfSentenceLikelihood:](v5, "setRcEndOfSentenceLikelihood:");
    }
    v26 = v7;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rcWordCount"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHEndpointFeaturesAtEndpoint setRcWordCount:](v5, "setRcWordCount:", objc_msgSend(v14, "unsignedIntValue"));
    v25 = v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rcServerFeaturesLatency"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHEndpointFeaturesAtEndpoint setRcServerFeaturesLatency:](v5, "setRcServerFeaturesLatency:", objc_msgSend(v15, "unsignedLongLongValue"));
    v23 = v11;
    v24 = v9;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("silencePosterior"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v16, "floatValue");
      -[MHSchemaMHEndpointFeaturesAtEndpoint setSilencePosterior:](v5, "setSilencePosterior:");
    }
    v17 = v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("acousticEndpointerScore"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v18, "floatValue");
      -[MHSchemaMHEndpointFeaturesAtEndpoint setAcousticEndpointerScore:](v5, "setAcousticEndpointerScore:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("silencePosteriorFrameCountInNs"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v19, "floatValue");
      -[MHSchemaMHEndpointFeaturesAtEndpoint setSilencePosteriorFrameCountInNs:](v5, "setSilencePosteriorFrameCountInNs:");
    }
    v20 = v5;

  }
  return v5;
}

- (unint64_t)trailingSilenceDurationInNs
{
  return self->_trailingSilenceDurationInNs;
}

- (unint64_t)clientSilenceFramesCountInNs
{
  return self->_clientSilenceFramesCountInNs;
}

- (float)endOfSentenceLikelihood
{
  return self->_endOfSentenceLikelihood;
}

- (unsigned)wordCount
{
  return self->_wordCount;
}

- (unint64_t)serverFeaturesLatencyInNs
{
  return self->_serverFeaturesLatencyInNs;
}

- (float)clientSilenceProbability
{
  return self->_clientSilenceProbability;
}

- (unint64_t)rcTrailingSilenceDuration
{
  return self->_rcTrailingSilenceDuration;
}

- (float)rcEndOfSentenceLikelihood
{
  return self->_rcEndOfSentenceLikelihood;
}

- (unsigned)rcWordCount
{
  return self->_rcWordCount;
}

- (unint64_t)rcServerFeaturesLatency
{
  return self->_rcServerFeaturesLatency;
}

- (float)silencePosterior
{
  return self->_silencePosterior;
}

- (float)acousticEndpointerScore
{
  return self->_acousticEndpointerScore;
}

- (float)silencePosteriorFrameCountInNs
{
  return self->_silencePosteriorFrameCountInNs;
}

@end
