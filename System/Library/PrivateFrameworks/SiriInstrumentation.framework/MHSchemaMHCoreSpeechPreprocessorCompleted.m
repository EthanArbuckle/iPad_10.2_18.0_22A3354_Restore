@implementation MHSchemaMHCoreSpeechPreprocessorCompleted

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
  v9.super_class = (Class)MHSchemaMHCoreSpeechPreprocessorCompleted;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MHSchemaMHCoreSpeechPreprocessorCompleted midSegmentContinousZeros](self, "midSegmentContinousZeros", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[MHSchemaMHCoreSpeechPreprocessorCompleted setMidSegmentContinousZeros:](self, "setMidSegmentContinousZeros:", v7);
  return v5;
}

- (void)setBeepLocation:(int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_beepLocation = a3;
}

- (BOOL)hasBeepLocation
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHasBeepLocation:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (void)deleteBeepLocation
{
  -[MHSchemaMHCoreSpeechPreprocessorCompleted setBeepLocation:](self, "setBeepLocation:", 0);
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setStatsComputed:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_statsComputed = a3;
}

- (BOOL)hasStatsComputed
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHasStatsComputed:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (void)deleteStatsComputed
{
  -[MHSchemaMHCoreSpeechPreprocessorCompleted setStatsComputed:](self, "setStatsComputed:", 0);
  *(_WORD *)&self->_has &= ~2u;
}

- (void)setBeepPower:(float)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_beepPower = a3;
}

- (BOOL)hasBeepPower
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setHasBeepPower:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (void)deleteBeepPower
{
  double v2;

  LODWORD(v2) = 0;
  -[MHSchemaMHCoreSpeechPreprocessorCompleted setBeepPower:](self, "setBeepPower:", v2);
  *(_WORD *)&self->_has &= ~4u;
}

- (void)setSignalPower:(float)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_signalPower = a3;
}

- (BOOL)hasSignalPower
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHasSignalPower:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (void)deleteSignalPower
{
  double v2;

  LODWORD(v2) = 0;
  -[MHSchemaMHCoreSpeechPreprocessorCompleted setSignalPower:](self, "setSignalPower:", v2);
  *(_WORD *)&self->_has &= ~8u;
}

- (void)setOriginalPower:(float)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_originalPower = a3;
}

- (BOOL)hasOriginalPower
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHasOriginalPower:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (void)deleteOriginalPower
{
  double v2;

  LODWORD(v2) = 0;
  -[MHSchemaMHCoreSpeechPreprocessorCompleted setOriginalPower:](self, "setOriginalPower:", v2);
  *(_WORD *)&self->_has &= ~0x10u;
}

- (void)setAbsMaxVal:(float)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_absMaxVal = a3;
}

- (BOOL)hasAbsMaxVal
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHasAbsMaxVal:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (void)deleteAbsMaxVal
{
  double v2;

  LODWORD(v2) = 0;
  -[MHSchemaMHCoreSpeechPreprocessorCompleted setAbsMaxVal:](self, "setAbsMaxVal:", v2);
  *(_WORD *)&self->_has &= ~0x20u;
}

- (void)setAboveNinetyFivepcOfMax:(float)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_aboveNinetyFivepcOfMax = a3;
}

- (BOOL)hasAboveNinetyFivepcOfMax
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHasAboveNinetyFivepcOfMax:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (void)deleteAboveNinetyFivepcOfMax
{
  double v2;

  LODWORD(v2) = 0;
  -[MHSchemaMHCoreSpeechPreprocessorCompleted setAboveNinetyFivepcOfMax:](self, "setAboveNinetyFivepcOfMax:", v2);
  *(_WORD *)&self->_has &= ~0x40u;
}

- (void)setNumTotalInputSamples:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_numTotalInputSamples = a3;
}

- (BOOL)hasNumTotalInputSamples
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHasNumTotalInputSamples:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (void)deleteNumTotalInputSamples
{
  -[MHSchemaMHCoreSpeechPreprocessorCompleted setNumTotalInputSamples:](self, "setNumTotalInputSamples:", 0);
  *(_WORD *)&self->_has &= ~0x80u;
}

- (void)setNumTotalOutputSamples:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_numTotalOutputSamples = a3;
}

- (BOOL)hasNumTotalOutputSamples
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHasNumTotalOutputSamples:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (void)deleteNumTotalOutputSamples
{
  -[MHSchemaMHCoreSpeechPreprocessorCompleted setNumTotalOutputSamples:](self, "setNumTotalOutputSamples:", 0);
  *(_WORD *)&self->_has &= ~0x100u;
}

- (void)setInitialContinousZeros:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_initialContinousZeros = a3;
}

- (BOOL)hasInitialContinousZeros
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setHasInitialContinousZeros:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (void)deleteInitialContinousZeros
{
  -[MHSchemaMHCoreSpeechPreprocessorCompleted setInitialContinousZeros:](self, "setInitialContinousZeros:", 0);
  *(_WORD *)&self->_has &= ~0x200u;
}

- (void)setMaxContinousZeros:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_maxContinousZeros = a3;
}

- (BOOL)hasMaxContinousZeros
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setHasMaxContinousZeros:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (void)deleteMaxContinousZeros
{
  -[MHSchemaMHCoreSpeechPreprocessorCompleted setMaxContinousZeros:](self, "setMaxContinousZeros:", 0);
  *(_WORD *)&self->_has &= ~0x400u;
}

- (void)clearMidSegmentContinousZeros
{
  -[NSArray removeAllObjects](self->_midSegmentContinousZeros, "removeAllObjects");
}

- (void)addMidSegmentContinousZeros:(id)a3
{
  id v4;
  NSArray *midSegmentContinousZeros;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  midSegmentContinousZeros = self->_midSegmentContinousZeros;
  v8 = v4;
  if (!midSegmentContinousZeros)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_midSegmentContinousZeros;
    self->_midSegmentContinousZeros = v6;

    v4 = v8;
    midSegmentContinousZeros = self->_midSegmentContinousZeros;
  }
  -[NSArray addObject:](midSegmentContinousZeros, "addObject:", v4);

}

- (unint64_t)midSegmentContinousZerosCount
{
  return -[NSArray count](self->_midSegmentContinousZeros, "count");
}

- (id)midSegmentContinousZerosAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_midSegmentContinousZeros, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return MHSchemaMHCoreSpeechPreprocessorCompletedReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  id v4;
  __int16 has;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
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
      goto LABEL_23;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteFloatField();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteFloatField();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteFloatField();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteFloatField();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteFloatField();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_11:
    if ((has & 0x400) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_30:
  PBDataWriterWriteUint64Field();
  if ((*(_WORD *)&self->_has & 0x400) != 0)
LABEL_12:
    PBDataWriterWriteUint64Field();
LABEL_13:
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_midSegmentContinousZeros;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int16 *v4;
  $773EC1EEAAFF0EF4D71FA85389E340B7 has;
  unsigned int v6;
  int beepLocation;
  int v8;
  int statsComputed;
  int v10;
  float beepPower;
  float v12;
  int v13;
  float signalPower;
  float v15;
  int v16;
  float originalPower;
  float v18;
  int v19;
  float absMaxVal;
  float v21;
  int v22;
  float aboveNinetyFivepcOfMax;
  float v24;
  int v25;
  unint64_t numTotalInputSamples;
  int v27;
  unint64_t numTotalOutputSamples;
  int v29;
  unint64_t initialContinousZeros;
  int v31;
  unint64_t maxContinousZeros;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  char v40;
  BOOL v41;

  v4 = (unsigned __int16 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_50;
  has = self->_has;
  v6 = v4[40];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_50;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    beepLocation = self->_beepLocation;
    if (beepLocation != objc_msgSend(v4, "beepLocation"))
      goto LABEL_50;
    has = self->_has;
    v6 = v4[40];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (v8)
    {
      statsComputed = self->_statsComputed;
      if (statsComputed != objc_msgSend(v4, "statsComputed"))
        goto LABEL_50;
      has = self->_has;
      v6 = v4[40];
    }
    v10 = (*(unsigned int *)&has >> 2) & 1;
    if (v10 == ((v6 >> 2) & 1))
    {
      if (v10)
      {
        beepPower = self->_beepPower;
        objc_msgSend(v4, "beepPower");
        if (beepPower != v12)
          goto LABEL_50;
        has = self->_has;
        v6 = v4[40];
      }
      v13 = (*(unsigned int *)&has >> 3) & 1;
      if (v13 == ((v6 >> 3) & 1))
      {
        if (v13)
        {
          signalPower = self->_signalPower;
          objc_msgSend(v4, "signalPower");
          if (signalPower != v15)
            goto LABEL_50;
          has = self->_has;
          v6 = v4[40];
        }
        v16 = (*(unsigned int *)&has >> 4) & 1;
        if (v16 == ((v6 >> 4) & 1))
        {
          if (v16)
          {
            originalPower = self->_originalPower;
            objc_msgSend(v4, "originalPower");
            if (originalPower != v18)
              goto LABEL_50;
            has = self->_has;
            v6 = v4[40];
          }
          v19 = (*(unsigned int *)&has >> 5) & 1;
          if (v19 == ((v6 >> 5) & 1))
          {
            if (v19)
            {
              absMaxVal = self->_absMaxVal;
              objc_msgSend(v4, "absMaxVal");
              if (absMaxVal != v21)
                goto LABEL_50;
              has = self->_has;
              v6 = v4[40];
            }
            v22 = (*(unsigned int *)&has >> 6) & 1;
            if (v22 == ((v6 >> 6) & 1))
            {
              if (v22)
              {
                aboveNinetyFivepcOfMax = self->_aboveNinetyFivepcOfMax;
                objc_msgSend(v4, "aboveNinetyFivepcOfMax");
                if (aboveNinetyFivepcOfMax != v24)
                  goto LABEL_50;
                has = self->_has;
                v6 = v4[40];
              }
              v25 = (*(unsigned int *)&has >> 7) & 1;
              if (v25 == ((v6 >> 7) & 1))
              {
                if (v25)
                {
                  numTotalInputSamples = self->_numTotalInputSamples;
                  if (numTotalInputSamples != objc_msgSend(v4, "numTotalInputSamples"))
                    goto LABEL_50;
                  has = self->_has;
                  v6 = v4[40];
                }
                v27 = (*(unsigned int *)&has >> 8) & 1;
                if (v27 == ((v6 >> 8) & 1))
                {
                  if (v27)
                  {
                    numTotalOutputSamples = self->_numTotalOutputSamples;
                    if (numTotalOutputSamples != objc_msgSend(v4, "numTotalOutputSamples"))
                      goto LABEL_50;
                    has = self->_has;
                    v6 = v4[40];
                  }
                  v29 = (*(unsigned int *)&has >> 9) & 1;
                  if (v29 == ((v6 >> 9) & 1))
                  {
                    if (v29)
                    {
                      initialContinousZeros = self->_initialContinousZeros;
                      if (initialContinousZeros != objc_msgSend(v4, "initialContinousZeros"))
                        goto LABEL_50;
                      has = self->_has;
                      v6 = v4[40];
                    }
                    v31 = (*(unsigned int *)&has >> 10) & 1;
                    if (v31 == ((v6 >> 10) & 1))
                    {
                      if (!v31
                        || (maxContinousZeros = self->_maxContinousZeros,
                            maxContinousZeros == objc_msgSend(v4, "maxContinousZeros")))
                      {
                        -[MHSchemaMHCoreSpeechPreprocessorCompleted midSegmentContinousZeros](self, "midSegmentContinousZeros");
                        v33 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v4, "midSegmentContinousZeros");
                        v34 = (void *)objc_claimAutoreleasedReturnValue();
                        v35 = v34;
                        if ((v33 == 0) != (v34 != 0))
                        {
                          -[MHSchemaMHCoreSpeechPreprocessorCompleted midSegmentContinousZeros](self, "midSegmentContinousZeros");
                          v36 = objc_claimAutoreleasedReturnValue();
                          if (!v36)
                          {

LABEL_53:
                            v41 = 1;
                            goto LABEL_51;
                          }
                          v37 = (void *)v36;
                          -[MHSchemaMHCoreSpeechPreprocessorCompleted midSegmentContinousZeros](self, "midSegmentContinousZeros");
                          v38 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v4, "midSegmentContinousZeros");
                          v39 = (void *)objc_claimAutoreleasedReturnValue();
                          v40 = objc_msgSend(v38, "isEqual:", v39);

                          if ((v40 & 1) != 0)
                            goto LABEL_53;
                        }
                        else
                        {

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
LABEL_50:
  v41 = 0;
LABEL_51:

  return v41;
}

- (unint64_t)hash
{
  __int16 has;
  uint64_t v4;
  uint64_t v5;
  float beepPower;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;
  unint64_t v11;
  float signalPower;
  double v13;
  long double v14;
  double v15;
  unint64_t v16;
  float originalPower;
  double v18;
  long double v19;
  double v20;
  unint64_t v21;
  float absMaxVal;
  double v23;
  long double v24;
  double v25;
  unint64_t v26;
  float aboveNinetyFivepcOfMax;
  double v28;
  long double v29;
  double v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;

  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
    v4 = 0;
    if ((has & 2) != 0)
      goto LABEL_3;
LABEL_9:
    v5 = 0;
    if ((has & 4) != 0)
      goto LABEL_4;
LABEL_10:
    v10 = 0;
    goto LABEL_13;
  }
  v4 = 2654435761 * self->_beepLocation;
  if ((has & 2) == 0)
    goto LABEL_9;
LABEL_3:
  v5 = 2654435761 * self->_statsComputed;
  if ((has & 4) == 0)
    goto LABEL_10;
LABEL_4:
  beepPower = self->_beepPower;
  v7 = beepPower;
  if (beepPower < 0.0)
    v7 = -beepPower;
  v8 = floor(v7 + 0.5);
  v9 = (v7 - v8) * 1.84467441e19;
  v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
  if (v9 >= 0.0)
  {
    if (v9 > 0.0)
      v10 += (unint64_t)v9;
  }
  else
  {
    v10 -= (unint64_t)fabs(v9);
  }
LABEL_13:
  if ((has & 8) != 0)
  {
    signalPower = self->_signalPower;
    v13 = signalPower;
    if (signalPower < 0.0)
      v13 = -signalPower;
    v14 = floor(v13 + 0.5);
    v15 = (v13 - v14) * 1.84467441e19;
    v11 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0)
        v11 += (unint64_t)v15;
    }
    else
    {
      v11 -= (unint64_t)fabs(v15);
    }
  }
  else
  {
    v11 = 0;
  }
  if ((has & 0x10) != 0)
  {
    originalPower = self->_originalPower;
    v18 = originalPower;
    if (originalPower < 0.0)
      v18 = -originalPower;
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
  if ((has & 0x20) != 0)
  {
    absMaxVal = self->_absMaxVal;
    v23 = absMaxVal;
    if (absMaxVal < 0.0)
      v23 = -absMaxVal;
    v24 = floor(v23 + 0.5);
    v25 = (v23 - v24) * 1.84467441e19;
    v21 = 2654435761u * (unint64_t)fmod(v24, 1.84467441e19);
    if (v25 >= 0.0)
    {
      if (v25 > 0.0)
        v21 += (unint64_t)v25;
    }
    else
    {
      v21 -= (unint64_t)fabs(v25);
    }
  }
  else
  {
    v21 = 0;
  }
  if ((has & 0x40) != 0)
  {
    aboveNinetyFivepcOfMax = self->_aboveNinetyFivepcOfMax;
    v28 = aboveNinetyFivepcOfMax;
    if (aboveNinetyFivepcOfMax < 0.0)
      v28 = -aboveNinetyFivepcOfMax;
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
  if ((has & 0x80) != 0)
  {
    v31 = 2654435761u * self->_numTotalInputSamples;
    if ((has & 0x100) != 0)
    {
LABEL_47:
      v32 = 2654435761u * self->_numTotalOutputSamples;
      if ((has & 0x200) != 0)
        goto LABEL_48;
LABEL_52:
      v33 = 0;
      if ((has & 0x400) != 0)
        goto LABEL_49;
LABEL_53:
      v34 = 0;
      return v5 ^ v4 ^ v10 ^ v11 ^ v16 ^ v21 ^ v26 ^ v31 ^ v32 ^ v33 ^ v34 ^ -[NSArray hash](self->_midSegmentContinousZeros, "hash");
    }
  }
  else
  {
    v31 = 0;
    if ((has & 0x100) != 0)
      goto LABEL_47;
  }
  v32 = 0;
  if ((has & 0x200) == 0)
    goto LABEL_52;
LABEL_48:
  v33 = 2654435761u * self->_initialContinousZeros;
  if ((has & 0x400) == 0)
    goto LABEL_53;
LABEL_49:
  v34 = 2654435761u * self->_maxContinousZeros;
  return v5 ^ v4 ^ v10 ^ v11 ^ v16 ^ v21 ^ v26 ^ v31 ^ v32 ^ v33 ^ v34 ^ -[NSArray hash](self->_midSegmentContinousZeros, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  void *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  __int16 v14;
  void *v15;
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
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    v17 = (void *)MEMORY[0x1E0CB37E8];
    -[MHSchemaMHCoreSpeechPreprocessorCompleted aboveNinetyFivepcOfMax](self, "aboveNinetyFivepcOfMax");
    objc_msgSend(v17, "numberWithFloat:");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("aboveNinetyFivepcOfMax"));

    has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_29;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  v19 = (void *)MEMORY[0x1E0CB37E8];
  -[MHSchemaMHCoreSpeechPreprocessorCompleted absMaxVal](self, "absMaxVal");
  objc_msgSend(v19, "numberWithFloat:");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("absMaxVal"));

  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_30;
  }
LABEL_29:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[MHSchemaMHCoreSpeechPreprocessorCompleted beepLocation](self, "beepLocation"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("beepLocation"));

  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x200) == 0)
      goto LABEL_6;
    goto LABEL_31;
  }
LABEL_30:
  v22 = (void *)MEMORY[0x1E0CB37E8];
  -[MHSchemaMHCoreSpeechPreprocessorCompleted beepPower](self, "beepPower");
  objc_msgSend(v22, "numberWithFloat:");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("beepPower"));

  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_6:
    if ((has & 0x400) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_31:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHCoreSpeechPreprocessorCompleted initialContinousZeros](self, "initialContinousZeros"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("initialContinousZeros"));

  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHCoreSpeechPreprocessorCompleted maxContinousZeros](self, "maxContinousZeros"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("maxContinousZeros"));

  }
LABEL_8:
  if (-[NSArray count](self->_midSegmentContinousZeros, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v7 = self->_midSegmentContinousZeros;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v32 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            objc_msgSend(v6, "addObject:", v12);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v13);

          }
        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("midSegmentContinousZeros"));
  }
  v14 = (__int16)self->_has;
  if ((v14 & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHCoreSpeechPreprocessorCompleted numTotalInputSamples](self, "numTotalInputSamples"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("numTotalInputSamples"));

    v14 = (__int16)self->_has;
    if ((v14 & 0x100) == 0)
    {
LABEL_22:
      if ((v14 & 0x10) == 0)
        goto LABEL_23;
      goto LABEL_35;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_22;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHCoreSpeechPreprocessorCompleted numTotalOutputSamples](self, "numTotalOutputSamples"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("numTotalOutputSamples"));

  v14 = (__int16)self->_has;
  if ((v14 & 0x10) == 0)
  {
LABEL_23:
    if ((v14 & 8) == 0)
      goto LABEL_24;
LABEL_36:
    v29 = (void *)MEMORY[0x1E0CB37E8];
    -[MHSchemaMHCoreSpeechPreprocessorCompleted signalPower](self, "signalPower");
    objc_msgSend(v29, "numberWithFloat:");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("signalPower"));

    if ((*(_WORD *)&self->_has & 2) == 0)
      goto LABEL_26;
    goto LABEL_25;
  }
LABEL_35:
  v27 = (void *)MEMORY[0x1E0CB37E8];
  -[MHSchemaMHCoreSpeechPreprocessorCompleted originalPower](self, "originalPower");
  objc_msgSend(v27, "numberWithFloat:");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("originalPower"));

  v14 = (__int16)self->_has;
  if ((v14 & 8) != 0)
    goto LABEL_36;
LABEL_24:
  if ((v14 & 2) != 0)
  {
LABEL_25:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[MHSchemaMHCoreSpeechPreprocessorCompleted statsComputed](self, "statsComputed"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("statsComputed"));

  }
LABEL_26:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[MHSchemaMHCoreSpeechPreprocessorCompleted dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (MHSchemaMHCoreSpeechPreprocessorCompleted)initWithJSON:(id)a3
{
  void *v4;
  MHSchemaMHCoreSpeechPreprocessorCompleted *v5;
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
    self = -[MHSchemaMHCoreSpeechPreprocessorCompleted initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (MHSchemaMHCoreSpeechPreprocessorCompleted)initWithDictionary:(id)a3
{
  id v4;
  MHSchemaMHCoreSpeechPreprocessorCompleted *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  uint64_t v28;
  MHSchemaMHCoreSpeechZeroFilterRunPair *v29;
  MHSchemaMHCoreSpeechPreprocessorCompleted *v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  objc_super v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)MHSchemaMHCoreSpeechPreprocessorCompleted;
  v5 = -[MHSchemaMHCoreSpeechPreprocessorCompleted init](&v46, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("beepLocation"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHCoreSpeechPreprocessorCompleted setBeepLocation:](v5, "setBeepLocation:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("statsComputed"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHCoreSpeechPreprocessorCompleted setStatsComputed:](v5, "setStatsComputed:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("beepPower"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "floatValue");
      -[MHSchemaMHCoreSpeechPreprocessorCompleted setBeepPower:](v5, "setBeepPower:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("signalPower"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v41 = v9;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "floatValue");
      -[MHSchemaMHCoreSpeechPreprocessorCompleted setSignalPower:](v5, "setSignalPower:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("originalPower"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v10, "floatValue");
      -[MHSchemaMHCoreSpeechPreprocessorCompleted setOriginalPower:](v5, "setOriginalPower:");
    }
    v40 = v7;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("absMaxVal"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v11, "floatValue");
      -[MHSchemaMHCoreSpeechPreprocessorCompleted setAbsMaxVal:](v5, "setAbsMaxVal:");
    }
    v12 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("aboveNinetyFivepcOfMax"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v13, "floatValue");
      -[MHSchemaMHCoreSpeechPreprocessorCompleted setAboveNinetyFivepcOfMax:](v5, "setAboveNinetyFivepcOfMax:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numTotalInputSamples"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v39 = v14;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHCoreSpeechPreprocessorCompleted setNumTotalInputSamples:](v5, "setNumTotalInputSamples:", objc_msgSend(v14, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numTotalOutputSamples"));
    v15 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v38 = (void *)v15;
    v16 = v12;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHCoreSpeechPreprocessorCompleted setNumTotalOutputSamples:](v5, "setNumTotalOutputSamples:", objc_msgSend(v38, "unsignedLongLongValue"));
    v17 = v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("initialContinousZeros"));
    v18 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v37 = (void *)v18;
    v19 = v40;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHCoreSpeechPreprocessorCompleted setInitialContinousZeros:](v5, "setInitialContinousZeros:", objc_msgSend(v37, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("maxContinousZeros"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v36 = v20;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHCoreSpeechPreprocessorCompleted setMaxContinousZeros:](v5, "setMaxContinousZeros:", objc_msgSend(v20, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("midSegmentContinousZeros"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v22 = v41;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v32 = v13;
      v33 = v11;
      v34 = v10;
      v35 = v17;
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v23 = v21;
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v43;
        do
        {
          for (i = 0; i != v25; ++i)
          {
            if (*(_QWORD *)v43 != v26)
              objc_enumerationMutation(v23);
            v28 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v29 = -[MHSchemaMHCoreSpeechZeroFilterRunPair initWithDictionary:]([MHSchemaMHCoreSpeechZeroFilterRunPair alloc], "initWithDictionary:", v28);
              -[MHSchemaMHCoreSpeechPreprocessorCompleted addMidSegmentContinousZeros:](v5, "addMidSegmentContinousZeros:", v29);

            }
          }
          v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
        }
        while (v25);
      }

      v17 = v35;
      v19 = v40;
      v22 = v41;
      v11 = v33;
      v10 = v34;
      v13 = v32;
    }
    v30 = v5;

  }
  return v5;
}

- (int)beepLocation
{
  return self->_beepLocation;
}

- (int)statsComputed
{
  return self->_statsComputed;
}

- (float)beepPower
{
  return self->_beepPower;
}

- (float)signalPower
{
  return self->_signalPower;
}

- (float)originalPower
{
  return self->_originalPower;
}

- (float)absMaxVal
{
  return self->_absMaxVal;
}

- (float)aboveNinetyFivepcOfMax
{
  return self->_aboveNinetyFivepcOfMax;
}

- (unint64_t)numTotalInputSamples
{
  return self->_numTotalInputSamples;
}

- (unint64_t)numTotalOutputSamples
{
  return self->_numTotalOutputSamples;
}

- (unint64_t)initialContinousZeros
{
  return self->_initialContinousZeros;
}

- (unint64_t)maxContinousZeros
{
  return self->_maxContinousZeros;
}

- (NSArray)midSegmentContinousZeros
{
  return self->_midSegmentContinousZeros;
}

- (void)setMidSegmentContinousZeros:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_midSegmentContinousZeros, 0);
}

@end
