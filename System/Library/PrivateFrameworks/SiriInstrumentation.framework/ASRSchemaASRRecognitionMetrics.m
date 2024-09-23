@implementation ASRSchemaASRRecognitionMetrics

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
  void *v11;
  void *v12;
  int v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ASRSchemaASRRecognitionMetrics;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v15, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASRSchemaASRRecognitionMetrics recognizerComponents](self, "recognizerComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[ASRSchemaASRRecognitionMetrics deleteRecognizerComponents](self, "deleteRecognizerComponents");
  -[ASRSchemaASRRecognitionMetrics languageModelInterpolationWeights](self, "languageModelInterpolationWeights");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v9, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASRSchemaASRRecognitionMetrics setLanguageModelInterpolationWeights:](self, "setLanguageModelInterpolationWeights:", v10);

  -[ASRSchemaASRRecognitionMetrics emojiMetrics](self, "emojiMetrics");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "applySensitiveConditionsPolicy:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "suppressMessage");

  if (v13)
    -[ASRSchemaASRRecognitionMetrics deleteEmojiMetrics](self, "deleteEmojiMetrics");

  return v5;
}

- (void)setPersonalizedLanguageModelAgeInNs:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_personalizedLanguageModelAgeInNs = a3;
}

- (BOOL)hasPersonalizedLanguageModelAgeInNs
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHasPersonalizedLanguageModelAgeInNs:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (void)deletePersonalizedLanguageModelAgeInNs
{
  -[ASRSchemaASRRecognitionMetrics setPersonalizedLanguageModelAgeInNs:](self, "setPersonalizedLanguageModelAgeInNs:", 0);
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setPersonalizedLanguageModelWeight:(float)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_personalizedLanguageModelWeight = a3;
}

- (BOOL)hasPersonalizedLanguageModelWeight
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHasPersonalizedLanguageModelWeight:(BOOL)a3
{
  __int16 v3;
  int v4;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  v4 = *(_WORD *)&self->_has & 0xFFFD | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)deletePersonalizedLanguageModelWeight
{
  double v2;
  $E30954924D96ED8F3D7A4FB9D02E1EA5 has;
  unsigned int v5;

  LODWORD(v2) = 0;
  -[ASRSchemaASRRecognitionMetrics setPersonalizedLanguageModelWeight:](self, "setPersonalizedLanguageModelWeight:", v2);
  has = self->_has;
  v5 = *(_DWORD *)&has & 0xFFFFFFFD | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xFFFD;
  *((_BYTE *)&self->_has + 2) = BYTE2(v5);
}

- (BOOL)hasRecognizerComponents
{
  return self->_recognizerComponents != 0;
}

- (void)deleteRecognizerComponents
{
  -[ASRSchemaASRRecognitionMetrics setRecognizerComponents:](self, "setRecognizerComponents:", 0);
}

- (void)setAverageActiveTokensPerFrame:(float)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_averageActiveTokensPerFrame = a3;
}

- (BOOL)hasAverageActiveTokensPerFrame
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setHasAverageActiveTokensPerFrame:(BOOL)a3
{
  __int16 v3;
  int v4;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  v4 = *(_WORD *)&self->_has & 0xFFFB | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)deleteAverageActiveTokensPerFrame
{
  double v2;
  $E30954924D96ED8F3D7A4FB9D02E1EA5 has;
  unsigned int v5;

  LODWORD(v2) = 0;
  -[ASRSchemaASRRecognitionMetrics setAverageActiveTokensPerFrame:](self, "setAverageActiveTokensPerFrame:", v2);
  has = self->_has;
  v5 = *(_DWORD *)&has & 0xFFFFFFFB | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xFFFB;
  *((_BYTE *)&self->_has + 2) = BYTE2(v5);
}

- (void)clearLanguageModelInterpolationWeights
{
  -[NSArray removeAllObjects](self->_languageModelInterpolationWeights, "removeAllObjects");
}

- (void)addLanguageModelInterpolationWeights:(id)a3
{
  id v4;
  NSArray *languageModelInterpolationWeights;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  languageModelInterpolationWeights = self->_languageModelInterpolationWeights;
  v8 = v4;
  if (!languageModelInterpolationWeights)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_languageModelInterpolationWeights;
    self->_languageModelInterpolationWeights = v6;

    v4 = v8;
    languageModelInterpolationWeights = self->_languageModelInterpolationWeights;
  }
  -[NSArray addObject:](languageModelInterpolationWeights, "addObject:", v4);

}

- (unint64_t)languageModelInterpolationWeightsCount
{
  return -[NSArray count](self->_languageModelInterpolationWeights, "count");
}

- (id)languageModelInterpolationWeightsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_languageModelInterpolationWeights, "objectAtIndexedSubscript:", a3);
}

- (void)setSignalToNoiseRatioInDecibels:(float)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_signalToNoiseRatioInDecibels = a3;
}

- (BOOL)hasSignalToNoiseRatioInDecibels
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHasSignalToNoiseRatioInDecibels:(BOOL)a3
{
  __int16 v3;
  int v4;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  v4 = *(_WORD *)&self->_has & 0xFFF7 | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)deleteSignalToNoiseRatioInDecibels
{
  double v2;
  $E30954924D96ED8F3D7A4FB9D02E1EA5 has;
  unsigned int v5;

  LODWORD(v2) = 0;
  -[ASRSchemaASRRecognitionMetrics setSignalToNoiseRatioInDecibels:](self, "setSignalToNoiseRatioInDecibels:", v2);
  has = self->_has;
  v5 = *(_DWORD *)&has & 0xFFFFFFF7 | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xFFF7;
  *((_BYTE *)&self->_has + 2) = BYTE2(v5);
}

- (void)setRecognitionDurationInNs:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_recognitionDurationInNs = a3;
}

- (BOOL)hasRecognitionDurationInNs
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHasRecognitionDurationInNs:(BOOL)a3
{
  __int16 v3;
  int v4;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  v4 = *(_WORD *)&self->_has & 0xFFEF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)deleteRecognitionDurationInNs
{
  $E30954924D96ED8F3D7A4FB9D02E1EA5 has;
  unsigned int v4;

  -[ASRSchemaASRRecognitionMetrics setRecognitionDurationInNs:](self, "setRecognitionDurationInNs:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFFFEF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xFFEF;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setAudioDurationInNs:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_audioDurationInNs = a3;
}

- (BOOL)hasAudioDurationInNs
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHasAudioDurationInNs:(BOOL)a3
{
  __int16 v3;
  int v4;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  v4 = *(_WORD *)&self->_has & 0xFFDF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)deleteAudioDurationInNs
{
  $E30954924D96ED8F3D7A4FB9D02E1EA5 has;
  unsigned int v4;

  -[ASRSchemaASRRecognitionMetrics setAudioDurationInNs:](self, "setAudioDurationInNs:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFFFDF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xFFDF;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setEagerEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_eagerEnabled = a3;
}

- (BOOL)hasEagerEnabled
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHasEagerEnabled:(BOOL)a3
{
  __int16 v3;
  int v4;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  v4 = *(_WORD *)&self->_has & 0xFFBF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)deleteEagerEnabled
{
  $E30954924D96ED8F3D7A4FB9D02E1EA5 has;
  unsigned int v4;

  -[ASRSchemaASRRecognitionMetrics setEagerEnabled:](self, "setEagerEnabled:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFFFBF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xFFBF;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setUtteranceDetectionEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_utteranceDetectionEnabled = a3;
}

- (BOOL)hasUtteranceDetectionEnabled
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHasUtteranceDetectionEnabled:(BOOL)a3
{
  __int16 v3;
  int v4;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  v4 = *(_WORD *)&self->_has & 0xFF7F | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)deleteUtteranceDetectionEnabled
{
  $E30954924D96ED8F3D7A4FB9D02E1EA5 has;
  unsigned int v4;

  -[ASRSchemaASRRecognitionMetrics setUtteranceDetectionEnabled:](self, "setUtteranceDetectionEnabled:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFFF7F | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xFF7F;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setUtteranceConcatenationEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_utteranceConcatenationEnabled = a3;
}

- (BOOL)hasUtteranceConcatenationEnabled
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHasUtteranceConcatenationEnabled:(BOOL)a3
{
  __int16 v3;
  int v4;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  v4 = *(_WORD *)&self->_has & 0xFEFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)deleteUtteranceConcatenationEnabled
{
  $E30954924D96ED8F3D7A4FB9D02E1EA5 has;
  unsigned int v4;

  -[ASRSchemaASRRecognitionMetrics setUtteranceConcatenationEnabled:](self, "setUtteranceConcatenationEnabled:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFFEFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xFEFF;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setContinuousListeningEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_continuousListeningEnabled = a3;
}

- (BOOL)hasContinuousListeningEnabled
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setHasContinuousListeningEnabled:(BOOL)a3
{
  __int16 v3;
  int v4;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  v4 = *(_WORD *)&self->_has & 0xFDFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)deleteContinuousListeningEnabled
{
  $E30954924D96ED8F3D7A4FB9D02E1EA5 has;
  unsigned int v4;

  -[ASRSchemaASRRecognitionMetrics setContinuousListeningEnabled:](self, "setContinuousListeningEnabled:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFFDFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xFDFF;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setEagerCustomerPerceivedLatencyInNs:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_eagerCustomerPerceivedLatencyInNs = a3;
}

- (BOOL)hasEagerCustomerPerceivedLatencyInNs
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setHasEagerCustomerPerceivedLatencyInNs:(BOOL)a3
{
  __int16 v3;
  int v4;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  v4 = *(_WORD *)&self->_has & 0xFBFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)deleteEagerCustomerPerceivedLatencyInNs
{
  $E30954924D96ED8F3D7A4FB9D02E1EA5 has;
  unsigned int v4;

  -[ASRSchemaASRRecognitionMetrics setEagerCustomerPerceivedLatencyInNs:](self, "setEagerCustomerPerceivedLatencyInNs:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFFBFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xFBFF;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setCpuRealTimeFactor:(float)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_cpuRealTimeFactor = a3;
}

- (BOOL)hasCpuRealTimeFactor
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setHasCpuRealTimeFactor:(BOOL)a3
{
  __int16 v3;
  int v4;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  v4 = *(_WORD *)&self->_has & 0xF7FF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)deleteCpuRealTimeFactor
{
  double v2;
  $E30954924D96ED8F3D7A4FB9D02E1EA5 has;
  unsigned int v5;

  LODWORD(v2) = 0;
  -[ASRSchemaASRRecognitionMetrics setCpuRealTimeFactor:](self, "setCpuRealTimeFactor:", v2);
  has = self->_has;
  v5 = *(_DWORD *)&has & 0xFFFFF7FF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xF7FF;
  *((_BYTE *)&self->_has + 2) = BYTE2(v5);
}

- (void)setNumLanguageModelEnrollmentDataStreams:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_numLanguageModelEnrollmentDataStreams = a3;
}

- (BOOL)hasNumLanguageModelEnrollmentDataStreams
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setHasNumLanguageModelEnrollmentDataStreams:(BOOL)a3
{
  __int16 v3;
  int v4;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  v4 = *(_WORD *)&self->_has & 0xEFFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)deleteNumLanguageModelEnrollmentDataStreams
{
  $E30954924D96ED8F3D7A4FB9D02E1EA5 has;
  unsigned int v4;

  -[ASRSchemaASRRecognitionMetrics setNumLanguageModelEnrollmentDataStreams:](self, "setNumLanguageModelEnrollmentDataStreams:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFEFFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xEFFF;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasPhoneticMatchDecoderName
{
  return self->_phoneticMatchDecoderName != 0;
}

- (void)deletePhoneticMatchDecoderName
{
  -[ASRSchemaASRRecognitionMetrics setPhoneticMatchDecoderName:](self, "setPhoneticMatchDecoderName:", 0);
}

- (void)setInverseTextNormalizationDurationInNs:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_inverseTextNormalizationDurationInNs = a3;
}

- (BOOL)hasInverseTextNormalizationDurationInNs
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setHasInverseTextNormalizationDurationInNs:(BOOL)a3
{
  __int16 v3;
  int v4;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  v4 = *(_WORD *)&self->_has & 0xDFFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)deleteInverseTextNormalizationDurationInNs
{
  $E30954924D96ED8F3D7A4FB9D02E1EA5 has;
  unsigned int v4;

  -[ASRSchemaASRRecognitionMetrics setInverseTextNormalizationDurationInNs:](self, "setInverseTextNormalizationDurationInNs:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFDFFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xDFFF;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasEmojiMetrics
{
  return self->_emojiMetrics != 0;
}

- (void)deleteEmojiMetrics
{
  -[ASRSchemaASRRecognitionMetrics setEmojiMetrics:](self, "setEmojiMetrics:", 0);
}

- (void)clearPausedAudioDurationsInNs
{
  -[NSArray removeAllObjects](self->_pausedAudioDurationsInNs, "removeAllObjects");
}

- (void)addPausedAudioDurationsInNs:(unint64_t)a3
{
  NSArray *pausedAudioDurationsInNs;
  NSArray *v6;
  NSArray *v7;
  id v8;

  pausedAudioDurationsInNs = self->_pausedAudioDurationsInNs;
  if (!pausedAudioDurationsInNs)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_pausedAudioDurationsInNs;
    self->_pausedAudioDurationsInNs = v6;

    pausedAudioDurationsInNs = self->_pausedAudioDurationsInNs;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](pausedAudioDurationsInNs, "addObject:", v8);

}

- (unint64_t)pausedAudioDurationsInNsCount
{
  return -[NSArray count](self->_pausedAudioDurationsInNs, "count");
}

- (unint64_t)pausedAudioDurationsInNsAtIndex:(unint64_t)a3
{
  void *v3;
  unint64_t v4;

  -[NSArray objectAtIndexedSubscript:](self->_pausedAudioDurationsInNs, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedLongLongValue");

  return v4;
}

- (void)setInverseTextNormalizationDurationForFinalResultInNs:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_inverseTextNormalizationDurationForFinalResultInNs = a3;
}

- (BOOL)hasInverseTextNormalizationDurationForFinalResultInNs
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (void)setHasInverseTextNormalizationDurationForFinalResultInNs:(BOOL)a3
{
  __int16 v3;
  int v4;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  v4 = *(_WORD *)&self->_has & 0xBFFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xBFFF | v3;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)deleteInverseTextNormalizationDurationForFinalResultInNs
{
  $E30954924D96ED8F3D7A4FB9D02E1EA5 has;
  unsigned int v4;

  -[ASRSchemaASRRecognitionMetrics setInverseTextNormalizationDurationForFinalResultInNs:](self, "setInverseTextNormalizationDurationForFinalResultInNs:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFBFFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xBFFF;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setNumberOfInverseTextNormalizationRuns:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x8000u;
  self->_numberOfInverseTextNormalizationRuns = a3;
}

- (BOOL)hasNumberOfInverseTextNormalizationRuns
{
  return *(_WORD *)&self->_has >> 15;
}

- (void)setHasNumberOfInverseTextNormalizationRuns:(BOOL)a3
{
  __int16 v3;
  int v4;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  v4 = *(_WORD *)&self->_has & 0x7FFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0x7FFF | v3;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)deleteNumberOfInverseTextNormalizationRuns
{
  $E30954924D96ED8F3D7A4FB9D02E1EA5 has;
  unsigned int v4;

  -[ASRSchemaASRRecognitionMetrics setNumberOfInverseTextNormalizationRuns:](self, "setNumberOfInverseTextNormalizationRuns:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFF7FFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0x7FFF;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setSecondaryPassDurationInNs:(unint64_t)a3
{
  *((_BYTE *)&self->_has + 2) = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16) | 0x10000u) >> 16;
  self->_secondaryPassDurationInNs = a3;
}

- (BOOL)hasSecondaryPassDurationInNs
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setHasSecondaryPassDurationInNs:(BOOL)a3
{
  int v3;
  unsigned int v4;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  v4 = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFFEFFFF;
  *(_WORD *)&self->_has = self->_has;
  *((_BYTE *)&self->_has + 2) = (v4 | v3) >> 16;
}

- (void)deleteSecondaryPassDurationInNs
{
  $E30954924D96ED8F3D7A4FB9D02E1EA5 has;
  unsigned int v4;

  -[ASRSchemaASRRecognitionMetrics setSecondaryPassDurationInNs:](self, "setSecondaryPassDurationInNs:", 0);
  has = self->_has;
  v4 = (*(_DWORD *)&has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFFEFFFF;
  *(_WORD *)&self->_has = has;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setNumberOfSecondaryPassRuns:(unsigned int)a3
{
  *((_BYTE *)&self->_has + 2) = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16) | 0x20000u) >> 16;
  self->_numberOfSecondaryPassRuns = a3;
}

- (BOOL)hasNumberOfSecondaryPassRuns
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setHasNumberOfSecondaryPassRuns:(BOOL)a3
{
  int v3;
  unsigned int v4;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  v4 = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFFDFFFF;
  *(_WORD *)&self->_has = self->_has;
  *((_BYTE *)&self->_has + 2) = (v4 | v3) >> 16;
}

- (void)deleteNumberOfSecondaryPassRuns
{
  $E30954924D96ED8F3D7A4FB9D02E1EA5 has;
  unsigned int v4;

  -[ASRSchemaASRRecognitionMetrics setNumberOfSecondaryPassRuns:](self, "setNumberOfSecondaryPassRuns:", 0);
  has = self->_has;
  v4 = (*(_DWORD *)&has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFFDFFFF;
  *(_WORD *)&self->_has = has;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setCpuInstructionsInMillionsPerSecond:(unint64_t)a3
{
  *((_BYTE *)&self->_has + 2) = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16) | 0x40000u) >> 16;
  self->_cpuInstructionsInMillionsPerSecond = a3;
}

- (BOOL)hasCpuInstructionsInMillionsPerSecond
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setHasCpuInstructionsInMillionsPerSecond:(BOOL)a3
{
  int v3;
  unsigned int v4;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  v4 = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFFBFFFF;
  *(_WORD *)&self->_has = self->_has;
  *((_BYTE *)&self->_has + 2) = (v4 | v3) >> 16;
}

- (void)deleteCpuInstructionsInMillionsPerSecond
{
  $E30954924D96ED8F3D7A4FB9D02E1EA5 has;
  unsigned int v4;

  -[ASRSchemaASRRecognitionMetrics setCpuInstructionsInMillionsPerSecond:](self, "setCpuInstructionsInMillionsPerSecond:", 0);
  has = self->_has;
  v4 = (*(_DWORD *)&has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFFBFFFF;
  *(_WORD *)&self->_has = has;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setAppleNeuralEngineCpuTimeInNs:(unint64_t)a3
{
  *((_BYTE *)&self->_has + 2) = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16) | 0x80000u) >> 16;
  self->_appleNeuralEngineCpuTimeInNs = a3;
}

- (BOOL)hasAppleNeuralEngineCpuTimeInNs
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setHasAppleNeuralEngineCpuTimeInNs:(BOOL)a3
{
  int v3;
  unsigned int v4;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  v4 = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFF7FFFF;
  *(_WORD *)&self->_has = self->_has;
  *((_BYTE *)&self->_has + 2) = (v4 | v3) >> 16;
}

- (void)deleteAppleNeuralEngineCpuTimeInNs
{
  $E30954924D96ED8F3D7A4FB9D02E1EA5 has;
  unsigned int v4;

  -[ASRSchemaASRRecognitionMetrics setAppleNeuralEngineCpuTimeInNs:](self, "setAppleNeuralEngineCpuTimeInNs:", 0);
  has = self->_has;
  v4 = (*(_DWORD *)&has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFF7FFFF;
  *(_WORD *)&self->_has = has;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setPageInsWaitTimeInNs:(unint64_t)a3
{
  *((_BYTE *)&self->_has + 2) = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16) | 0x100000u) >> 16;
  self->_pageInsWaitTimeInNs = a3;
}

- (BOOL)hasPageInsWaitTimeInNs
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setHasPageInsWaitTimeInNs:(BOOL)a3
{
  int v3;
  unsigned int v4;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  v4 = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFEFFFFF;
  *(_WORD *)&self->_has = self->_has;
  *((_BYTE *)&self->_has + 2) = (v4 | v3) >> 16;
}

- (void)deletePageInsWaitTimeInNs
{
  $E30954924D96ED8F3D7A4FB9D02E1EA5 has;
  unsigned int v4;

  -[ASRSchemaASRRecognitionMetrics setPageInsWaitTimeInNs:](self, "setPageInsWaitTimeInNs:", 0);
  has = self->_has;
  v4 = (*(_DWORD *)&has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFEFFFFF;
  *(_WORD *)&self->_has = has;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setRecognitionHardware:(int)a3
{
  *((_BYTE *)&self->_has + 2) = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16) | 0x200000u) >> 16;
  self->_recognitionHardware = a3;
}

- (BOOL)hasRecognitionHardware
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setHasRecognitionHardware:(BOOL)a3
{
  int v3;
  unsigned int v4;

  if (a3)
    v3 = 0x200000;
  else
    v3 = 0;
  v4 = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFDFFFFF;
  *(_WORD *)&self->_has = self->_has;
  *((_BYTE *)&self->_has + 2) = (v4 | v3) >> 16;
}

- (void)deleteRecognitionHardware
{
  $E30954924D96ED8F3D7A4FB9D02E1EA5 has;
  unsigned int v4;

  -[ASRSchemaASRRecognitionMetrics setRecognitionHardware:](self, "setRecognitionHardware:", 0);
  has = self->_has;
  v4 = (*(_DWORD *)&has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFDFFFFF;
  *(_WORD *)&self->_has = has;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setNumIngestedNeuralContextualBiasingEmbeddings:(unsigned int)a3
{
  *((_BYTE *)&self->_has + 2) = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16) | 0x400000u) >> 16;
  self->_numIngestedNeuralContextualBiasingEmbeddings = a3;
}

- (BOOL)hasNumIngestedNeuralContextualBiasingEmbeddings
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setHasNumIngestedNeuralContextualBiasingEmbeddings:(BOOL)a3
{
  int v3;
  unsigned int v4;

  if (a3)
    v3 = 0x400000;
  else
    v3 = 0;
  v4 = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFBFFFFF;
  *(_WORD *)&self->_has = self->_has;
  *((_BYTE *)&self->_has + 2) = (v4 | v3) >> 16;
}

- (void)deleteNumIngestedNeuralContextualBiasingEmbeddings
{
  $E30954924D96ED8F3D7A4FB9D02E1EA5 has;
  unsigned int v4;

  -[ASRSchemaASRRecognitionMetrics setNumIngestedNeuralContextualBiasingEmbeddings:](self, "setNumIngestedNeuralContextualBiasingEmbeddings:", 0);
  has = self->_has;
  v4 = (*(_DWORD *)&has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFBFFFFF;
  *(_WORD *)&self->_has = has;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)clearPauseReason
{
  -[NSArray removeAllObjects](self->_pauseReasons, "removeAllObjects");
}

- (void)addPauseReason:(int)a3
{
  uint64_t v3;
  NSArray *pauseReasons;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v3 = *(_QWORD *)&a3;
  pauseReasons = self->_pauseReasons;
  if (!pauseReasons)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_pauseReasons;
    self->_pauseReasons = v6;

    pauseReasons = self->_pauseReasons;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](pauseReasons, "addObject:", v8);

}

- (unint64_t)pauseReasonCount
{
  return -[NSArray count](self->_pauseReasons, "count");
}

- (int)pauseReasonAtIndex:(unint64_t)a3
{
  void *v3;
  int v4;

  -[NSArray objectAtIndexedSubscript:](self->_pauseReasons, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return ASRSchemaASRRecognitionMetricsReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  id v4;
  __int16 has;
  void *v6;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int16 v13;
  void *v14;
  void *v15;
  void *v16;
  NSArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  $E30954924D96ED8F3D7A4FB9D02E1EA5 v22;
  int v23;
  NSArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  $E30954924D96ED8F3D7A4FB9D02E1EA5 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  LOBYTE(has) = self->_has;
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (__int16)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteFloatField();
  -[ASRSchemaASRRecognitionMetrics recognizerComponents](self, "recognizerComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[ASRSchemaASRRecognitionMetrics recognizerComponents](self, "recognizerComponents");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(_WORD *)&self->_has & 4) != 0)
    PBDataWriterWriteFloatField();
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v8 = self->_languageModelInterpolationWeights;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v39 != v11)
          objc_enumerationMutation(v8);
        PBDataWriterWriteSubmessage();
      }
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    }
    while (v10);
  }

  v13 = (__int16)self->_has;
  if ((v13 & 8) != 0)
  {
    PBDataWriterWriteFloatField();
    v13 = (__int16)self->_has;
    if ((v13 & 0x10) == 0)
    {
LABEL_18:
      if ((v13 & 0x20) == 0)
        goto LABEL_19;
      goto LABEL_60;
    }
  }
  else if ((v13 & 0x10) == 0)
  {
    goto LABEL_18;
  }
  PBDataWriterWriteUint64Field();
  v13 = (__int16)self->_has;
  if ((v13 & 0x20) == 0)
  {
LABEL_19:
    if ((v13 & 0x40) == 0)
      goto LABEL_20;
    goto LABEL_61;
  }
LABEL_60:
  PBDataWriterWriteUint64Field();
  v13 = (__int16)self->_has;
  if ((v13 & 0x40) == 0)
  {
LABEL_20:
    if ((v13 & 0x80) == 0)
      goto LABEL_21;
    goto LABEL_62;
  }
LABEL_61:
  PBDataWriterWriteBOOLField();
  v13 = (__int16)self->_has;
  if ((v13 & 0x80) == 0)
  {
LABEL_21:
    if ((v13 & 0x100) == 0)
      goto LABEL_22;
    goto LABEL_63;
  }
LABEL_62:
  PBDataWriterWriteBOOLField();
  v13 = (__int16)self->_has;
  if ((v13 & 0x100) == 0)
  {
LABEL_22:
    if ((v13 & 0x200) == 0)
      goto LABEL_23;
    goto LABEL_64;
  }
LABEL_63:
  PBDataWriterWriteBOOLField();
  v13 = (__int16)self->_has;
  if ((v13 & 0x200) == 0)
  {
LABEL_23:
    if ((v13 & 0x400) == 0)
      goto LABEL_24;
    goto LABEL_65;
  }
LABEL_64:
  PBDataWriterWriteBOOLField();
  v13 = (__int16)self->_has;
  if ((v13 & 0x400) == 0)
  {
LABEL_24:
    if ((v13 & 0x800) == 0)
      goto LABEL_25;
    goto LABEL_66;
  }
LABEL_65:
  PBDataWriterWriteUint64Field();
  v13 = (__int16)self->_has;
  if ((v13 & 0x800) == 0)
  {
LABEL_25:
    if ((v13 & 0x1000) == 0)
      goto LABEL_27;
    goto LABEL_26;
  }
LABEL_66:
  PBDataWriterWriteFloatField();
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
LABEL_26:
    PBDataWriterWriteUint32Field();
LABEL_27:
  -[ASRSchemaASRRecognitionMetrics phoneticMatchDecoderName](self, "phoneticMatchDecoderName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    PBDataWriterWriteStringField();
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
    PBDataWriterWriteUint64Field();
  -[ASRSchemaASRRecognitionMetrics emojiMetrics](self, "emojiMetrics");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[ASRSchemaASRRecognitionMetrics emojiMetrics](self, "emojiMetrics");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v17 = self->_pausedAudioDurationsInNs;
  v18 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v35 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * j), "unsignedLongLongValue");
        PBDataWriterWriteUint64Field();
      }
      v19 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
    }
    while (v19);
  }

  v22 = self->_has;
  v23 = *(_DWORD *)&v22 | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&v22 & 0x4000) != 0)
  {
    PBDataWriterWriteUint64Field();
    v29 = self->_has;
    v23 = *(_DWORD *)&v29 | (*((unsigned __int8 *)&self->_has + 2) << 16);
    if ((*(_WORD *)&v29 & 0x8000) == 0)
    {
LABEL_42:
      if ((v23 & 0x10000) == 0)
        goto LABEL_43;
      goto LABEL_70;
    }
  }
  else if ((*(_WORD *)&v22 & 0x8000) == 0)
  {
    goto LABEL_42;
  }
  PBDataWriterWriteUint32Field();
  v23 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((v23 & 0x10000) == 0)
  {
LABEL_43:
    if ((v23 & 0x20000) == 0)
      goto LABEL_44;
    goto LABEL_71;
  }
LABEL_70:
  PBDataWriterWriteUint64Field();
  v23 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((v23 & 0x20000) == 0)
  {
LABEL_44:
    if ((v23 & 0x40000) == 0)
      goto LABEL_45;
    goto LABEL_72;
  }
LABEL_71:
  PBDataWriterWriteUint32Field();
  v23 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((v23 & 0x40000) == 0)
  {
LABEL_45:
    if ((v23 & 0x80000) == 0)
      goto LABEL_46;
    goto LABEL_73;
  }
LABEL_72:
  PBDataWriterWriteUint64Field();
  v23 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((v23 & 0x80000) == 0)
  {
LABEL_46:
    if ((v23 & 0x100000) == 0)
      goto LABEL_47;
    goto LABEL_74;
  }
LABEL_73:
  PBDataWriterWriteUint64Field();
  v23 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((v23 & 0x100000) == 0)
  {
LABEL_47:
    if ((v23 & 0x200000) == 0)
      goto LABEL_48;
    goto LABEL_75;
  }
LABEL_74:
  PBDataWriterWriteUint64Field();
  v23 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((v23 & 0x200000) == 0)
  {
LABEL_48:
    if ((v23 & 0x400000) == 0)
      goto LABEL_50;
    goto LABEL_49;
  }
LABEL_75:
  PBDataWriterWriteInt32Field();
  if (((*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0x400000) != 0)
LABEL_49:
    PBDataWriterWriteUint32Field();
LABEL_50:
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v24 = self->_pauseReasons;
  v25 = -[NSArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v31;
    do
    {
      for (k = 0; k != v26; ++k)
      {
        if (*(_QWORD *)v31 != v27)
          objc_enumerationMutation(v24);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * k), "intValue", (_QWORD)v30);
        PBDataWriterWriteInt32Field();
      }
      v26 = -[NSArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
    }
    while (v26);
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int16 *v4;
  unsigned int v5;
  int v6;
  unsigned int v7;
  unint64_t personalizedLanguageModelAgeInNs;
  int v9;
  float personalizedLanguageModelWeight;
  float v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  int v19;
  float averageActiveTokensPerFrame;
  float v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  $E30954924D96ED8F3D7A4FB9D02E1EA5 has;
  int v28;
  unsigned int v29;
  unsigned int v30;
  unsigned int v31;
  float signalToNoiseRatioInDecibels;
  float v33;
  int v34;
  unint64_t recognitionDurationInNs;
  int v36;
  unint64_t audioDurationInNs;
  int v38;
  int eagerEnabled;
  int v40;
  int utteranceDetectionEnabled;
  int v42;
  int utteranceConcatenationEnabled;
  int v44;
  int continuousListeningEnabled;
  int v46;
  unint64_t eagerCustomerPerceivedLatencyInNs;
  int v48;
  float cpuRealTimeFactor;
  float v50;
  int v51;
  unsigned int numLanguageModelEnrollmentDataStreams;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  int v57;
  int v58;
  unint64_t inverseTextNormalizationDurationInNs;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  int v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  int v69;
  $E30954924D96ED8F3D7A4FB9D02E1EA5 v70;
  int v71;
  unsigned int v72;
  unsigned int v73;
  unsigned int v74;
  unint64_t inverseTextNormalizationDurationForFinalResultInNs;
  int v76;
  unsigned int numberOfInverseTextNormalizationRuns;
  int v78;
  unint64_t secondaryPassDurationInNs;
  int v80;
  unsigned int numberOfSecondaryPassRuns;
  int v82;
  unint64_t cpuInstructionsInMillionsPerSecond;
  int v84;
  unint64_t appleNeuralEngineCpuTimeInNs;
  int v86;
  unint64_t pageInsWaitTimeInNs;
  int v88;
  int recognitionHardware;
  int v90;
  unsigned int numIngestedNeuralContextualBiasingEmbeddings;
  uint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  char v96;
  BOOL v97;

  v4 = (unsigned __int16 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_121;
  v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  v6 = *(_WORD *)&self->_has & 1;
  v7 = v4[100] | (*((unsigned __int8 *)v4 + 202) << 16);
  if (v6 != (v4[100] & 1))
    goto LABEL_121;
  if (v6)
  {
    personalizedLanguageModelAgeInNs = self->_personalizedLanguageModelAgeInNs;
    if (personalizedLanguageModelAgeInNs != objc_msgSend(v4, "personalizedLanguageModelAgeInNs"))
      goto LABEL_121;
    v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v7 = v4[100] | (*((unsigned __int8 *)v4 + 202) << 16);
  }
  v9 = (v5 >> 1) & 1;
  if (v9 != ((v7 >> 1) & 1))
    goto LABEL_121;
  if (v9)
  {
    personalizedLanguageModelWeight = self->_personalizedLanguageModelWeight;
    objc_msgSend(v4, "personalizedLanguageModelWeight");
    if (personalizedLanguageModelWeight != v11)
      goto LABEL_121;
  }
  -[ASRSchemaASRRecognitionMetrics recognizerComponents](self, "recognizerComponents");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recognizerComponents");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v12 == 0) == (v13 != 0))
    goto LABEL_120;
  -[ASRSchemaASRRecognitionMetrics recognizerComponents](self, "recognizerComponents");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    -[ASRSchemaASRRecognitionMetrics recognizerComponents](self, "recognizerComponents");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "recognizerComponents");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if (!v18)
      goto LABEL_121;
  }
  else
  {

  }
  v19 = (*(_WORD *)&self->_has >> 2) & 1;
  if (v19 != ((v4[100] >> 2) & 1))
    goto LABEL_121;
  if (v19)
  {
    averageActiveTokensPerFrame = self->_averageActiveTokensPerFrame;
    objc_msgSend(v4, "averageActiveTokensPerFrame");
    if (averageActiveTokensPerFrame != v21)
      goto LABEL_121;
  }
  -[ASRSchemaASRRecognitionMetrics languageModelInterpolationWeights](self, "languageModelInterpolationWeights");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "languageModelInterpolationWeights");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v12 == 0) == (v13 != 0))
    goto LABEL_120;
  -[ASRSchemaASRRecognitionMetrics languageModelInterpolationWeights](self, "languageModelInterpolationWeights");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[ASRSchemaASRRecognitionMetrics languageModelInterpolationWeights](self, "languageModelInterpolationWeights");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "languageModelInterpolationWeights");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_121;
  }
  else
  {

  }
  has = self->_has;
  v28 = (*(unsigned int *)&has >> 3) & 1;
  v29 = v4[100];
  if (v28 != ((v29 >> 3) & 1))
    goto LABEL_121;
  if (v28)
  {
    signalToNoiseRatioInDecibels = self->_signalToNoiseRatioInDecibels;
    objc_msgSend(v4, "signalToNoiseRatioInDecibels");
    if (signalToNoiseRatioInDecibels != v33)
      goto LABEL_121;
    v30 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v31 = v4[100] | (*((unsigned __int8 *)v4 + 202) << 16);
  }
  else
  {
    v30 = *(_DWORD *)&has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v31 = v29 | (*((unsigned __int8 *)v4 + 202) << 16);
  }
  v34 = (v30 >> 4) & 1;
  if (v34 != ((v31 >> 4) & 1))
    goto LABEL_121;
  if (v34)
  {
    recognitionDurationInNs = self->_recognitionDurationInNs;
    if (recognitionDurationInNs != objc_msgSend(v4, "recognitionDurationInNs"))
      goto LABEL_121;
    v30 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v31 = v4[100] | (*((unsigned __int8 *)v4 + 202) << 16);
  }
  v36 = (v30 >> 5) & 1;
  if (v36 != ((v31 >> 5) & 1))
    goto LABEL_121;
  if (v36)
  {
    audioDurationInNs = self->_audioDurationInNs;
    if (audioDurationInNs != objc_msgSend(v4, "audioDurationInNs"))
      goto LABEL_121;
    v30 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v31 = v4[100] | (*((unsigned __int8 *)v4 + 202) << 16);
  }
  v38 = (v30 >> 6) & 1;
  if (v38 != ((v31 >> 6) & 1))
    goto LABEL_121;
  if (v38)
  {
    eagerEnabled = self->_eagerEnabled;
    if (eagerEnabled != objc_msgSend(v4, "eagerEnabled"))
      goto LABEL_121;
    v30 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v31 = v4[100] | (*((unsigned __int8 *)v4 + 202) << 16);
  }
  v40 = (v30 >> 7) & 1;
  if (v40 != ((v31 >> 7) & 1))
    goto LABEL_121;
  if (v40)
  {
    utteranceDetectionEnabled = self->_utteranceDetectionEnabled;
    if (utteranceDetectionEnabled != objc_msgSend(v4, "utteranceDetectionEnabled"))
      goto LABEL_121;
    v30 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v31 = v4[100] | (*((unsigned __int8 *)v4 + 202) << 16);
  }
  v42 = (v30 >> 8) & 1;
  if (v42 != ((v31 >> 8) & 1))
    goto LABEL_121;
  if (v42)
  {
    utteranceConcatenationEnabled = self->_utteranceConcatenationEnabled;
    if (utteranceConcatenationEnabled != objc_msgSend(v4, "utteranceConcatenationEnabled"))
      goto LABEL_121;
    v30 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v31 = v4[100] | (*((unsigned __int8 *)v4 + 202) << 16);
  }
  v44 = (v30 >> 9) & 1;
  if (v44 != ((v31 >> 9) & 1))
    goto LABEL_121;
  if (v44)
  {
    continuousListeningEnabled = self->_continuousListeningEnabled;
    if (continuousListeningEnabled != objc_msgSend(v4, "continuousListeningEnabled"))
      goto LABEL_121;
    v30 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v31 = v4[100] | (*((unsigned __int8 *)v4 + 202) << 16);
  }
  v46 = (v30 >> 10) & 1;
  if (v46 != ((v31 >> 10) & 1))
    goto LABEL_121;
  if (v46)
  {
    eagerCustomerPerceivedLatencyInNs = self->_eagerCustomerPerceivedLatencyInNs;
    if (eagerCustomerPerceivedLatencyInNs != objc_msgSend(v4, "eagerCustomerPerceivedLatencyInNs"))
      goto LABEL_121;
    v30 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v31 = v4[100] | (*((unsigned __int8 *)v4 + 202) << 16);
  }
  v48 = (v30 >> 11) & 1;
  if (v48 != ((v31 >> 11) & 1))
    goto LABEL_121;
  if (v48)
  {
    cpuRealTimeFactor = self->_cpuRealTimeFactor;
    objc_msgSend(v4, "cpuRealTimeFactor");
    if (cpuRealTimeFactor != v50)
      goto LABEL_121;
    v30 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v31 = v4[100] | (*((unsigned __int8 *)v4 + 202) << 16);
  }
  v51 = (v30 >> 12) & 1;
  if (v51 != ((v31 >> 12) & 1))
    goto LABEL_121;
  if (v51)
  {
    numLanguageModelEnrollmentDataStreams = self->_numLanguageModelEnrollmentDataStreams;
    if (numLanguageModelEnrollmentDataStreams != objc_msgSend(v4, "numLanguageModelEnrollmentDataStreams"))goto LABEL_121;
  }
  -[ASRSchemaASRRecognitionMetrics phoneticMatchDecoderName](self, "phoneticMatchDecoderName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "phoneticMatchDecoderName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v12 == 0) == (v13 != 0))
    goto LABEL_120;
  -[ASRSchemaASRRecognitionMetrics phoneticMatchDecoderName](self, "phoneticMatchDecoderName");
  v53 = objc_claimAutoreleasedReturnValue();
  if (v53)
  {
    v54 = (void *)v53;
    -[ASRSchemaASRRecognitionMetrics phoneticMatchDecoderName](self, "phoneticMatchDecoderName");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "phoneticMatchDecoderName");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v55, "isEqual:", v56);

    if (!v57)
      goto LABEL_121;
  }
  else
  {

  }
  v58 = (*(_WORD *)&self->_has >> 13) & 1;
  if (v58 != ((v4[100] >> 13) & 1))
    goto LABEL_121;
  if (v58)
  {
    inverseTextNormalizationDurationInNs = self->_inverseTextNormalizationDurationInNs;
    if (inverseTextNormalizationDurationInNs != objc_msgSend(v4, "inverseTextNormalizationDurationInNs"))
      goto LABEL_121;
  }
  -[ASRSchemaASRRecognitionMetrics emojiMetrics](self, "emojiMetrics");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "emojiMetrics");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v12 == 0) == (v13 != 0))
    goto LABEL_120;
  -[ASRSchemaASRRecognitionMetrics emojiMetrics](self, "emojiMetrics");
  v60 = objc_claimAutoreleasedReturnValue();
  if (v60)
  {
    v61 = (void *)v60;
    -[ASRSchemaASRRecognitionMetrics emojiMetrics](self, "emojiMetrics");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "emojiMetrics");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = objc_msgSend(v62, "isEqual:", v63);

    if (!v64)
      goto LABEL_121;
  }
  else
  {

  }
  -[ASRSchemaASRRecognitionMetrics pausedAudioDurationsInNs](self, "pausedAudioDurationsInNs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pausedAudioDurationsInNs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v12 == 0) == (v13 != 0))
    goto LABEL_120;
  -[ASRSchemaASRRecognitionMetrics pausedAudioDurationsInNs](self, "pausedAudioDurationsInNs");
  v65 = objc_claimAutoreleasedReturnValue();
  if (v65)
  {
    v66 = (void *)v65;
    -[ASRSchemaASRRecognitionMetrics pausedAudioDurationsInNs](self, "pausedAudioDurationsInNs");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pausedAudioDurationsInNs");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = objc_msgSend(v67, "isEqual:", v68);

    if (!v69)
      goto LABEL_121;
  }
  else
  {

  }
  v70 = self->_has;
  v71 = (*(unsigned int *)&v70 >> 14) & 1;
  v72 = v4[100];
  if (v71 != ((v72 >> 14) & 1))
    goto LABEL_121;
  if (v71)
  {
    inverseTextNormalizationDurationForFinalResultInNs = self->_inverseTextNormalizationDurationForFinalResultInNs;
    if (inverseTextNormalizationDurationForFinalResultInNs != objc_msgSend(v4, "inverseTextNormalizationDurationForFinalResultInNs"))goto LABEL_121;
    v73 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v74 = v4[100] | (*((unsigned __int8 *)v4 + 202) << 16);
  }
  else
  {
    v73 = *(_DWORD *)&v70 | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v74 = v72 | (*((unsigned __int8 *)v4 + 202) << 16);
  }
  v76 = (v73 >> 15) & 1;
  if (v76 != ((v74 >> 15) & 1))
    goto LABEL_121;
  if (v76)
  {
    numberOfInverseTextNormalizationRuns = self->_numberOfInverseTextNormalizationRuns;
    if (numberOfInverseTextNormalizationRuns != objc_msgSend(v4, "numberOfInverseTextNormalizationRuns"))
      goto LABEL_121;
    v73 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v74 = v4[100] | (*((unsigned __int8 *)v4 + 202) << 16);
  }
  v78 = HIWORD(v73) & 1;
  if (v78 != (HIWORD(v74) & 1))
    goto LABEL_121;
  if (v78)
  {
    secondaryPassDurationInNs = self->_secondaryPassDurationInNs;
    if (secondaryPassDurationInNs != objc_msgSend(v4, "secondaryPassDurationInNs"))
      goto LABEL_121;
    v73 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v74 = v4[100] | (*((unsigned __int8 *)v4 + 202) << 16);
  }
  v80 = (v73 >> 17) & 1;
  if (v80 != ((v74 >> 17) & 1))
    goto LABEL_121;
  if (v80)
  {
    numberOfSecondaryPassRuns = self->_numberOfSecondaryPassRuns;
    if (numberOfSecondaryPassRuns != objc_msgSend(v4, "numberOfSecondaryPassRuns"))
      goto LABEL_121;
    v73 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v74 = v4[100] | (*((unsigned __int8 *)v4 + 202) << 16);
  }
  v82 = (v73 >> 18) & 1;
  if (v82 != ((v74 >> 18) & 1))
    goto LABEL_121;
  if (v82)
  {
    cpuInstructionsInMillionsPerSecond = self->_cpuInstructionsInMillionsPerSecond;
    if (cpuInstructionsInMillionsPerSecond != objc_msgSend(v4, "cpuInstructionsInMillionsPerSecond"))
      goto LABEL_121;
    v73 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v74 = v4[100] | (*((unsigned __int8 *)v4 + 202) << 16);
  }
  v84 = (v73 >> 19) & 1;
  if (v84 != ((v74 >> 19) & 1))
    goto LABEL_121;
  if (v84)
  {
    appleNeuralEngineCpuTimeInNs = self->_appleNeuralEngineCpuTimeInNs;
    if (appleNeuralEngineCpuTimeInNs != objc_msgSend(v4, "appleNeuralEngineCpuTimeInNs"))
      goto LABEL_121;
    v73 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v74 = v4[100] | (*((unsigned __int8 *)v4 + 202) << 16);
  }
  v86 = (v73 >> 20) & 1;
  if (v86 != ((v74 >> 20) & 1))
    goto LABEL_121;
  if (v86)
  {
    pageInsWaitTimeInNs = self->_pageInsWaitTimeInNs;
    if (pageInsWaitTimeInNs != objc_msgSend(v4, "pageInsWaitTimeInNs"))
      goto LABEL_121;
    v73 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v74 = v4[100] | (*((unsigned __int8 *)v4 + 202) << 16);
  }
  v88 = (v73 >> 21) & 1;
  if (v88 != ((v74 >> 21) & 1))
    goto LABEL_121;
  if (v88)
  {
    recognitionHardware = self->_recognitionHardware;
    if (recognitionHardware != objc_msgSend(v4, "recognitionHardware"))
      goto LABEL_121;
    v73 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v74 = v4[100] | (*((unsigned __int8 *)v4 + 202) << 16);
  }
  v90 = (v73 >> 22) & 1;
  if (v90 != ((v74 >> 22) & 1))
    goto LABEL_121;
  if (v90)
  {
    numIngestedNeuralContextualBiasingEmbeddings = self->_numIngestedNeuralContextualBiasingEmbeddings;
    if (numIngestedNeuralContextualBiasingEmbeddings != objc_msgSend(v4, "numIngestedNeuralContextualBiasingEmbeddings"))goto LABEL_121;
  }
  -[ASRSchemaASRRecognitionMetrics pauseReasons](self, "pauseReasons");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pauseReasons");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v12 == 0) == (v13 != 0))
  {
LABEL_120:

    goto LABEL_121;
  }
  -[ASRSchemaASRRecognitionMetrics pauseReasons](self, "pauseReasons");
  v92 = objc_claimAutoreleasedReturnValue();
  if (!v92)
  {

LABEL_124:
    v97 = 1;
    goto LABEL_122;
  }
  v93 = (void *)v92;
  -[ASRSchemaASRRecognitionMetrics pauseReasons](self, "pauseReasons");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pauseReasons");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = objc_msgSend(v94, "isEqual:", v95);

  if ((v96 & 1) != 0)
    goto LABEL_124;
LABEL_121:
  v97 = 0;
LABEL_122:

  return v97;
}

- (unint64_t)hash
{
  __int16 has;
  float personalizedLanguageModelWeight;
  double v5;
  long double v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  float averageActiveTokensPerFrame;
  double v11;
  long double v12;
  double v13;
  __int16 v14;
  unint64_t v15;
  float signalToNoiseRatioInDecibels;
  double v17;
  long double v18;
  double v19;
  unint64_t v20;
  float cpuRealTimeFactor;
  double v22;
  long double v23;
  double v24;
  unint64_t v25;
  uint64_t v26;
  NSUInteger v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  $E30954924D96ED8F3D7A4FB9D02E1EA5 v31;
  int v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v53 = 2654435761u * self->_personalizedLanguageModelAgeInNs;
    if ((has & 2) != 0)
      goto LABEL_3;
LABEL_8:
    v8 = 0;
    goto LABEL_11;
  }
  v53 = 0;
  if ((has & 2) == 0)
    goto LABEL_8;
LABEL_3:
  personalizedLanguageModelWeight = self->_personalizedLanguageModelWeight;
  v5 = personalizedLanguageModelWeight;
  if (personalizedLanguageModelWeight < 0.0)
    v5 = -personalizedLanguageModelWeight;
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
LABEL_11:
  v52 = v8;
  v51 = -[ASRSchemaASRRecognizerComponents hash](self->_recognizerComponents, "hash");
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    averageActiveTokensPerFrame = self->_averageActiveTokensPerFrame;
    v11 = averageActiveTokensPerFrame;
    if (averageActiveTokensPerFrame < 0.0)
      v11 = -averageActiveTokensPerFrame;
    v12 = floor(v11 + 0.5);
    v13 = (v11 - v12) * 1.84467441e19;
    v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  v50 = v9;
  v49 = -[NSArray hash](self->_languageModelInterpolationWeights, "hash");
  v14 = (__int16)self->_has;
  if ((v14 & 8) != 0)
  {
    signalToNoiseRatioInDecibels = self->_signalToNoiseRatioInDecibels;
    v17 = signalToNoiseRatioInDecibels;
    if (signalToNoiseRatioInDecibels < 0.0)
      v17 = -signalToNoiseRatioInDecibels;
    v18 = floor(v17 + 0.5);
    v19 = (v17 - v18) * 1.84467441e19;
    v15 = 2654435761u * (unint64_t)fmod(v18, 1.84467441e19);
    if (v19 >= 0.0)
    {
      if (v19 > 0.0)
        v15 += (unint64_t)v19;
    }
    else
    {
      v15 -= (unint64_t)fabs(v19);
    }
  }
  else
  {
    v15 = 0;
  }
  if ((v14 & 0x10) != 0)
  {
    v48 = 2654435761u * self->_recognitionDurationInNs;
    if ((v14 & 0x20) != 0)
    {
LABEL_29:
      v47 = 2654435761u * self->_audioDurationInNs;
      if ((v14 & 0x40) != 0)
        goto LABEL_30;
      goto LABEL_41;
    }
  }
  else
  {
    v48 = 0;
    if ((v14 & 0x20) != 0)
      goto LABEL_29;
  }
  v47 = 0;
  if ((v14 & 0x40) != 0)
  {
LABEL_30:
    v46 = 2654435761 * self->_eagerEnabled;
    if ((v14 & 0x80) != 0)
      goto LABEL_31;
    goto LABEL_42;
  }
LABEL_41:
  v46 = 0;
  if ((v14 & 0x80) != 0)
  {
LABEL_31:
    v45 = 2654435761 * self->_utteranceDetectionEnabled;
    if ((v14 & 0x100) != 0)
      goto LABEL_32;
    goto LABEL_43;
  }
LABEL_42:
  v45 = 0;
  if ((v14 & 0x100) != 0)
  {
LABEL_32:
    v44 = 2654435761 * self->_utteranceConcatenationEnabled;
    if ((v14 & 0x200) != 0)
      goto LABEL_33;
    goto LABEL_44;
  }
LABEL_43:
  v44 = 0;
  if ((v14 & 0x200) != 0)
  {
LABEL_33:
    v43 = 2654435761 * self->_continuousListeningEnabled;
    if ((v14 & 0x400) != 0)
      goto LABEL_34;
LABEL_45:
    v20 = 0;
    if ((v14 & 0x800) != 0)
      goto LABEL_35;
LABEL_46:
    v25 = 0;
    goto LABEL_49;
  }
LABEL_44:
  v43 = 0;
  if ((v14 & 0x400) == 0)
    goto LABEL_45;
LABEL_34:
  v20 = 2654435761u * self->_eagerCustomerPerceivedLatencyInNs;
  if ((v14 & 0x800) == 0)
    goto LABEL_46;
LABEL_35:
  cpuRealTimeFactor = self->_cpuRealTimeFactor;
  v22 = cpuRealTimeFactor;
  if (cpuRealTimeFactor < 0.0)
    v22 = -cpuRealTimeFactor;
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
LABEL_49:
  if ((v14 & 0x1000) != 0)
    v26 = 2654435761 * self->_numLanguageModelEnrollmentDataStreams;
  else
    v26 = 0;
  v27 = -[NSString hash](self->_phoneticMatchDecoderName, "hash");
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
    v28 = 2654435761u * self->_inverseTextNormalizationDurationInNs;
  else
    v28 = 0;
  v29 = -[ASRSchemaASREmojiMetrics hash](self->_emojiMetrics, "hash");
  v30 = -[NSArray hash](self->_pausedAudioDurationsInNs, "hash");
  v31 = self->_has;
  v32 = *(_DWORD *)&v31 | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&v31 & 0x4000) != 0)
  {
    v33 = 2654435761u * self->_inverseTextNormalizationDurationForFinalResultInNs;
    if ((*(_WORD *)&v31 & 0x8000) != 0)
    {
LABEL_57:
      v34 = 2654435761 * self->_numberOfInverseTextNormalizationRuns;
      if ((v32 & 0x10000) != 0)
        goto LABEL_58;
      goto LABEL_67;
    }
  }
  else
  {
    v33 = 0;
    if ((*(_WORD *)&v31 & 0x8000) != 0)
      goto LABEL_57;
  }
  v34 = 0;
  if ((v32 & 0x10000) != 0)
  {
LABEL_58:
    v35 = 2654435761u * self->_secondaryPassDurationInNs;
    if ((v32 & 0x20000) != 0)
      goto LABEL_59;
    goto LABEL_68;
  }
LABEL_67:
  v35 = 0;
  if ((v32 & 0x20000) != 0)
  {
LABEL_59:
    v36 = 2654435761 * self->_numberOfSecondaryPassRuns;
    if ((v32 & 0x40000) != 0)
      goto LABEL_60;
    goto LABEL_69;
  }
LABEL_68:
  v36 = 0;
  if ((v32 & 0x40000) != 0)
  {
LABEL_60:
    v37 = 2654435761u * self->_cpuInstructionsInMillionsPerSecond;
    if ((v32 & 0x80000) != 0)
      goto LABEL_61;
    goto LABEL_70;
  }
LABEL_69:
  v37 = 0;
  if ((v32 & 0x80000) != 0)
  {
LABEL_61:
    v38 = 2654435761u * self->_appleNeuralEngineCpuTimeInNs;
    if ((v32 & 0x100000) != 0)
      goto LABEL_62;
    goto LABEL_71;
  }
LABEL_70:
  v38 = 0;
  if ((v32 & 0x100000) != 0)
  {
LABEL_62:
    v39 = 2654435761u * self->_pageInsWaitTimeInNs;
    if ((v32 & 0x200000) != 0)
      goto LABEL_63;
LABEL_72:
    v40 = 0;
    if ((v32 & 0x400000) != 0)
      goto LABEL_64;
LABEL_73:
    v41 = 0;
    return v52 ^ v53 ^ v50 ^ v51 ^ v49 ^ v15 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v20 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29 ^ v30 ^ v33 ^ v34 ^ v35 ^ v36 ^ v37 ^ v38 ^ v39 ^ v40 ^ v41 ^ -[NSArray hash](self->_pauseReasons, "hash");
  }
LABEL_71:
  v39 = 0;
  if ((v32 & 0x200000) == 0)
    goto LABEL_72;
LABEL_63:
  v40 = 2654435761 * self->_recognitionHardware;
  if ((v32 & 0x400000) == 0)
    goto LABEL_73;
LABEL_64:
  v41 = 2654435761 * self->_numIngestedNeuralContextualBiasingEmbeddings;
  return v52 ^ v53 ^ v50 ^ v51 ^ v49 ^ v15 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v20 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29 ^ v30 ^ v33 ^ v34 ^ v35 ^ v36 ^ v37 ^ v38 ^ v39 ^ v40 ^ v41 ^ -[NSArray hash](self->_pauseReasons, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  $E30954924D96ED8F3D7A4FB9D02E1EA5 has;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int16 v19;
  void *v20;
  void *v21;
  void *v22;
  NSArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  __int16 v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  $E30954924D96ED8F3D7A4FB9D02E1EA5 v42;
  int v43;
  void *v44;
  int v45;
  const __CFString *v46;
  const __CFString *v47;
  void *v48;
  void *v49;
  void *v50;
  $E30954924D96ED8F3D7A4FB9D02E1EA5 v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  $E30954924D96ED8F3D7A4FB9D02E1EA5 *p_has;
  int v57;
  void *v58;
  id v59;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((v4 & 0x80000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[ASRSchemaASRRecognitionMetrics appleNeuralEngineCpuTimeInNs](self, "appleNeuralEngineCpuTimeInNs"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("appleNeuralEngineCpuTimeInNs"));

    has = self->_has;
    v4 = *(_DWORD *)&has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    if ((*(_BYTE *)&has & 0x20) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[ASRSchemaASRRecognitionMetrics audioDurationInNs](self, "audioDurationInNs"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("audioDurationInNs"));

  v4 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 4) == 0)
  {
LABEL_4:
    if ((v4 & 0x200) == 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[ASRSchemaASRRecognitionMetrics averageActiveTokensPerFrame](self, "averageActiveTokensPerFrame");
  objc_msgSend(v11, "numberWithFloat:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("averageActiveTokensPerFrame"));

  v4 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
LABEL_5:
    if ((v4 & 0x40000) == 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ASRSchemaASRRecognitionMetrics continuousListeningEnabled](self, "continuousListeningEnabled"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("continuousListeningEnabled"));

  v4 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((v4 & 0x40000) == 0)
  {
LABEL_6:
    if ((v4 & 0x800) == 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[ASRSchemaASRRecognitionMetrics cpuInstructionsInMillionsPerSecond](self, "cpuInstructionsInMillionsPerSecond"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("cpuInstructionsInMillionsPerSecond"));

  LOWORD(v4) = self->_has;
  if ((v4 & 0x800) == 0)
  {
LABEL_7:
    if ((v4 & 0x400) == 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  v15 = (void *)MEMORY[0x1E0CB37E8];
  -[ASRSchemaASRRecognitionMetrics cpuRealTimeFactor](self, "cpuRealTimeFactor");
  objc_msgSend(v15, "numberWithFloat:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("cpuRealTimeFactor"));

  LOWORD(v4) = self->_has;
  if ((v4 & 0x400) == 0)
  {
LABEL_8:
    if ((v4 & 0x40) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_19:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[ASRSchemaASRRecognitionMetrics eagerCustomerPerceivedLatencyInNs](self, "eagerCustomerPerceivedLatencyInNs"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("eagerCustomerPerceivedLatencyInNs"));

  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ASRSchemaASRRecognitionMetrics eagerEnabled](self, "eagerEnabled"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("eagerEnabled"));

  }
LABEL_10:
  if (self->_emojiMetrics)
  {
    -[ASRSchemaASRRecognitionMetrics emojiMetrics](self, "emojiMetrics");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("emojiMetrics"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("emojiMetrics"));

    }
  }
  v19 = (__int16)self->_has;
  if ((v19 & 0x4000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[ASRSchemaASRRecognitionMetrics inverseTextNormalizationDurationForFinalResultInNs](self, "inverseTextNormalizationDurationForFinalResultInNs"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("inverseTextNormalizationDurationForFinalResultInNs"));

    v19 = (__int16)self->_has;
  }
  if ((v19 & 0x2000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[ASRSchemaASRRecognitionMetrics inverseTextNormalizationDurationInNs](self, "inverseTextNormalizationDurationInNs"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("inverseTextNormalizationDurationInNs"));

  }
  if (-[NSArray count](self->_languageModelInterpolationWeights, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v23 = self->_languageModelInterpolationWeights;
    v24 = -[NSArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v66;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v66 != v26)
            objc_enumerationMutation(v23);
          objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * i), "dictionaryRepresentation");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (v28)
          {
            objc_msgSend(v22, "addObject:", v28);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "addObject:", v29);

          }
        }
        v25 = -[NSArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
      }
      while (v25);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("languageModelInterpolationWeights"));
  }
  v30 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((v30 & 0x400000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[ASRSchemaASRRecognitionMetrics numIngestedNeuralContextualBiasingEmbeddings](self, "numIngestedNeuralContextualBiasingEmbeddings"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v50, CFSTR("numIngestedNeuralContextualBiasingEmbeddings"));

    v51 = self->_has;
    v30 = *(_DWORD *)&v51 | (*((unsigned __int8 *)&self->_has + 2) << 16);
    if ((*(_WORD *)&v51 & 0x1000) == 0)
    {
LABEL_41:
      if ((v30 & 0x8000) == 0)
        goto LABEL_42;
      goto LABEL_69;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    goto LABEL_41;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[ASRSchemaASRRecognitionMetrics numLanguageModelEnrollmentDataStreams](self, "numLanguageModelEnrollmentDataStreams"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v52, CFSTR("numLanguageModelEnrollmentDataStreams"));

  v30 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x8000) == 0)
  {
LABEL_42:
    if ((v30 & 0x20000) == 0)
      goto LABEL_43;
    goto LABEL_70;
  }
LABEL_69:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[ASRSchemaASRRecognitionMetrics numberOfInverseTextNormalizationRuns](self, "numberOfInverseTextNormalizationRuns"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v53, CFSTR("numberOfInverseTextNormalizationRuns"));

  v30 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((v30 & 0x20000) == 0)
  {
LABEL_43:
    if ((v30 & 0x100000) == 0)
      goto LABEL_45;
    goto LABEL_44;
  }
LABEL_70:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[ASRSchemaASRRecognitionMetrics numberOfSecondaryPassRuns](self, "numberOfSecondaryPassRuns"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v54, CFSTR("numberOfSecondaryPassRuns"));

  if (((*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0x100000) != 0)
  {
LABEL_44:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[ASRSchemaASRRecognitionMetrics pageInsWaitTimeInNs](self, "pageInsWaitTimeInNs"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("pageInsWaitTimeInNs"));

  }
LABEL_45:
  if (-[NSArray count](self->_pauseReasons, "count"))
  {
    -[ASRSchemaASRRecognitionMetrics pauseReasons](self, "pauseReasons");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(v32, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("pauseReason"));

  }
  if (-[NSArray count](self->_pausedAudioDurationsInNs, "count"))
  {
    -[ASRSchemaASRRecognitionMetrics pausedAudioDurationsInNs](self, "pausedAudioDurationsInNs");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)objc_msgSend(v34, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("pausedAudioDurationsInNs"));

  }
  LOBYTE(v36) = self->_has;
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[ASRSchemaASRRecognitionMetrics personalizedLanguageModelAgeInNs](self, "personalizedLanguageModelAgeInNs"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("personalizedLanguageModelAgeInNs"));

    v36 = (__int16)self->_has;
  }
  if ((v36 & 2) != 0)
  {
    v38 = (void *)MEMORY[0x1E0CB37E8];
    -[ASRSchemaASRRecognitionMetrics personalizedLanguageModelWeight](self, "personalizedLanguageModelWeight");
    objc_msgSend(v38, "numberWithFloat:");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, CFSTR("personalizedLanguageModelWeight"));

  }
  if (self->_phoneticMatchDecoderName)
  {
    -[ASRSchemaASRRecognitionMetrics phoneticMatchDecoderName](self, "phoneticMatchDecoderName");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = (void *)objc_msgSend(v40, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("phoneticMatchDecoderName"));

  }
  v42 = self->_has;
  v43 = *(_DWORD *)&v42 | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_BYTE *)&v42 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[ASRSchemaASRRecognitionMetrics recognitionDurationInNs](self, "recognitionDurationInNs"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v44, CFSTR("recognitionDurationInNs"));

    v43 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  }
  if ((v43 & 0x200000) != 0)
  {
    v45 = -[ASRSchemaASRRecognitionMetrics recognitionHardware](self, "recognitionHardware");
    v46 = CFSTR("ASRSPEECHRECOGNITIONHARDWARE_UNKNOWN");
    if (v45 == 1)
      v46 = CFSTR("ASRSPEECHRECOGNITIONHARDWARE_CPU");
    if (v45 == 2)
      v47 = CFSTR("ASRSPEECHRECOGNITIONHARDWARE_APPLE_NEURAL_ENGINE");
    else
      v47 = v46;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v47, CFSTR("recognitionHardware"));
  }
  if (self->_recognizerComponents)
  {
    -[ASRSchemaASRRecognitionMetrics recognizerComponents](self, "recognizerComponents");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "dictionaryRepresentation");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (v49)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v49, CFSTR("recognizerComponents"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v55, CFSTR("recognizerComponents"));

    }
  }
  p_has = &self->_has;
  v57 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((v57 & 0x10000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[ASRSchemaASRRecognitionMetrics secondaryPassDurationInNs](self, "secondaryPassDurationInNs"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v61, CFSTR("secondaryPassDurationInNs"));

    LOWORD(v57) = *(_WORD *)p_has;
    if ((*(_WORD *)p_has & 8) == 0)
    {
LABEL_76:
      if ((v57 & 0x100) == 0)
        goto LABEL_77;
LABEL_82:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ASRSchemaASRRecognitionMetrics utteranceConcatenationEnabled](self, "utteranceConcatenationEnabled"));
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v64, CFSTR("utteranceConcatenationEnabled"));

      if ((*(_WORD *)&self->_has & 0x80) == 0)
        goto LABEL_79;
      goto LABEL_78;
    }
  }
  else if ((*(_WORD *)&self->_has & 8) == 0)
  {
    goto LABEL_76;
  }
  v62 = (void *)MEMORY[0x1E0CB37E8];
  -[ASRSchemaASRRecognitionMetrics signalToNoiseRatioInDecibels](self, "signalToNoiseRatioInDecibels");
  objc_msgSend(v62, "numberWithFloat:");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v63, CFSTR("signalToNoiseRatioInDecibels"));

  LOWORD(v57) = self->_has;
  if ((v57 & 0x100) != 0)
    goto LABEL_82;
LABEL_77:
  if ((v57 & 0x80) != 0)
  {
LABEL_78:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ASRSchemaASRRecognitionMetrics utteranceDetectionEnabled](self, "utteranceDetectionEnabled"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v58, CFSTR("utteranceDetectionEnabled"));

  }
LABEL_79:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  v59 = v3;

  return v59;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ASRSchemaASRRecognitionMetrics dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ASRSchemaASRRecognitionMetrics)initWithJSON:(id)a3
{
  void *v4;
  ASRSchemaASRRecognitionMetrics *v5;
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
    self = -[ASRSchemaASRRecognitionMetrics initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ASRSchemaASRRecognitionMetrics)initWithDictionary:(id)a3
{
  id v4;
  ASRSchemaASRRecognitionMetrics *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  ASRSchemaASRRecognizerComponents *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  ASRSchemaASRInterpolationWeightBundle *v18;
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
  void *v31;
  uint64_t v32;
  ASRSchemaASREmojiMetrics *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t j;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t k;
  void *v64;
  ASRSchemaASRRecognitionMetrics *v65;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  objc_super v106;
  _BYTE v107[128];
  _BYTE v108[128];
  _BYTE v109[128];
  uint64_t v110;

  v110 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v106.receiver = self;
  v106.super_class = (Class)ASRSchemaASRRecognitionMetrics;
  v5 = -[ASRSchemaASRRecognitionMetrics init](&v106, sel_init);

  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("personalizedLanguageModelAgeInNs"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ASRSchemaASRRecognitionMetrics setPersonalizedLanguageModelAgeInNs:](v5, "setPersonalizedLanguageModelAgeInNs:", objc_msgSend(v6, "unsignedLongLongValue"));
    v78 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("personalizedLanguageModelWeight"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "floatValue");
      -[ASRSchemaASRRecognitionMetrics setPersonalizedLanguageModelWeight:](v5, "setPersonalizedLanguageModelWeight:");
    }
    v77 = v7;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recognizerComponents"));
    v8 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[ASRSchemaASRRecognizerComponents initWithDictionary:]([ASRSchemaASRRecognizerComponents alloc], "initWithDictionary:", v8);
      -[ASRSchemaASRRecognitionMetrics setRecognizerComponents:](v5, "setRecognizerComponents:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("averageActiveTokensPerFrame"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v10, "floatValue");
      -[ASRSchemaASRRecognitionMetrics setAverageActiveTokensPerFrame:](v5, "setAverageActiveTokensPerFrame:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("languageModelInterpolationWeights"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v93 = v11;
    v75 = v10;
    v76 = (void *)v8;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v104 = 0u;
      v105 = 0u;
      v102 = 0u;
      v103 = 0u;
      v12 = v11;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v102, v109, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v103;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v103 != v15)
              objc_enumerationMutation(v12);
            v17 = *(_QWORD *)(*((_QWORD *)&v102 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v18 = -[ASRSchemaASRInterpolationWeightBundle initWithDictionary:]([ASRSchemaASRInterpolationWeightBundle alloc], "initWithDictionary:", v17);
              -[ASRSchemaASRRecognitionMetrics addLanguageModelInterpolationWeights:](v5, "addLanguageModelInterpolationWeights:", v18);

            }
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v102, v109, 16);
        }
        while (v14);
      }

      v8 = (uint64_t)v76;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("signalToNoiseRatioInDecibels"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v19, "floatValue");
      -[ASRSchemaASRRecognitionMetrics setSignalToNoiseRatioInDecibels:](v5, "setSignalToNoiseRatioInDecibels:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recognitionDurationInNs"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ASRSchemaASRRecognitionMetrics setRecognitionDurationInNs:](v5, "setRecognitionDurationInNs:", objc_msgSend(v20, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioDurationInNs"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ASRSchemaASRRecognitionMetrics setAudioDurationInNs:](v5, "setAudioDurationInNs:", objc_msgSend(v21, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eagerEnabled"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v92 = v22;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ASRSchemaASRRecognitionMetrics setEagerEnabled:](v5, "setEagerEnabled:", objc_msgSend(v22, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("utteranceDetectionEnabled"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v91 = v23;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ASRSchemaASRRecognitionMetrics setUtteranceDetectionEnabled:](v5, "setUtteranceDetectionEnabled:", objc_msgSend(v23, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("utteranceConcatenationEnabled"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v90 = v24;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ASRSchemaASRRecognitionMetrics setUtteranceConcatenationEnabled:](v5, "setUtteranceConcatenationEnabled:", objc_msgSend(v24, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("continuousListeningEnabled"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v89 = v25;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ASRSchemaASRRecognitionMetrics setContinuousListeningEnabled:](v5, "setContinuousListeningEnabled:", objc_msgSend(v25, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eagerCustomerPerceivedLatencyInNs"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v88 = v26;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ASRSchemaASRRecognitionMetrics setEagerCustomerPerceivedLatencyInNs:](v5, "setEagerCustomerPerceivedLatencyInNs:", objc_msgSend(v26, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cpuRealTimeFactor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v87 = v27;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v27, "floatValue");
      -[ASRSchemaASRRecognitionMetrics setCpuRealTimeFactor:](v5, "setCpuRealTimeFactor:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numLanguageModelEnrollmentDataStreams"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v86 = v28;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ASRSchemaASRRecognitionMetrics setNumLanguageModelEnrollmentDataStreams:](v5, "setNumLanguageModelEnrollmentDataStreams:", objc_msgSend(v28, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("phoneticMatchDecoderName"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v85 = v29;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v30 = (void *)objc_msgSend(v29, "copy");
      -[ASRSchemaASRRecognitionMetrics setPhoneticMatchDecoderName:](v5, "setPhoneticMatchDecoderName:", v30);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("inverseTextNormalizationDurationInNs"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v84 = v31;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ASRSchemaASRRecognitionMetrics setInverseTextNormalizationDurationInNs:](v5, "setInverseTextNormalizationDurationInNs:", objc_msgSend(v31, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("emojiMetrics"));
    v32 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v83 = (void *)v32;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v33 = -[ASRSchemaASREmojiMetrics initWithDictionary:]([ASRSchemaASREmojiMetrics alloc], "initWithDictionary:", v32);
      -[ASRSchemaASRRecognitionMetrics setEmojiMetrics:](v5, "setEmojiMetrics:", v33);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pausedAudioDurationsInNs"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v82 = v34;
    v73 = v21;
    v74 = v20;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v35 = v8;
      v36 = v19;
      v100 = 0u;
      v101 = 0u;
      v98 = 0u;
      v99 = 0u;
      v37 = v34;
      v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v98, v108, 16);
      if (v38)
      {
        v39 = v38;
        v40 = *(_QWORD *)v99;
        do
        {
          for (j = 0; j != v39; ++j)
          {
            if (*(_QWORD *)v99 != v40)
              objc_enumerationMutation(v37);
            v42 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              -[ASRSchemaASRRecognitionMetrics addPausedAudioDurationsInNs:](v5, "addPausedAudioDurationsInNs:", objc_msgSend(v42, "unsignedLongLongValue"));
          }
          v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v98, v108, 16);
        }
        while (v39);
      }

      v19 = v36;
      v8 = v35;
      v21 = v73;
      v20 = v74;
    }
    v43 = v21;
    v44 = (void *)v8;
    v45 = v20;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("inverseTextNormalizationDurationForFinalResultInNs"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ASRSchemaASRRecognitionMetrics setInverseTextNormalizationDurationForFinalResultInNs:](v5, "setInverseTextNormalizationDurationForFinalResultInNs:", objc_msgSend(v46, "unsignedLongLongValue"));
    v47 = v19;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numberOfInverseTextNormalizationRuns"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ASRSchemaASRRecognitionMetrics setNumberOfInverseTextNormalizationRuns:](v5, "setNumberOfInverseTextNormalizationRuns:", objc_msgSend(v48, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("secondaryPassDurationInNs"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v81 = v49;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ASRSchemaASRRecognitionMetrics setSecondaryPassDurationInNs:](v5, "setSecondaryPassDurationInNs:", objc_msgSend(v49, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numberOfSecondaryPassRuns"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ASRSchemaASRRecognitionMetrics setNumberOfSecondaryPassRuns:](v5, "setNumberOfSecondaryPassRuns:", objc_msgSend(v50, "unsignedIntValue"));
    v70 = v50;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cpuInstructionsInMillionsPerSecond"));
    v51 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v80 = (void *)v51;
    v52 = v47;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ASRSchemaASRRecognitionMetrics setCpuInstructionsInMillionsPerSecond:](v5, "setCpuInstructionsInMillionsPerSecond:", objc_msgSend(v80, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appleNeuralEngineCpuTimeInNs"));
    v53 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v79 = (void *)v53;
    v54 = v45;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ASRSchemaASRRecognitionMetrics setAppleNeuralEngineCpuTimeInNs:](v5, "setAppleNeuralEngineCpuTimeInNs:", objc_msgSend(v79, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pageInsWaitTimeInNs"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ASRSchemaASRRecognitionMetrics setPageInsWaitTimeInNs:](v5, "setPageInsWaitTimeInNs:", objc_msgSend(v55, "unsignedLongLongValue"));
    v72 = v46;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recognitionHardware"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ASRSchemaASRRecognitionMetrics setRecognitionHardware:](v5, "setRecognitionHardware:", objc_msgSend(v56, "intValue"));
    v69 = v56;
    v71 = v48;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numIngestedNeuralContextualBiasingEmbeddings"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ASRSchemaASRRecognitionMetrics setNumIngestedNeuralContextualBiasingEmbeddings:](v5, "setNumIngestedNeuralContextualBiasingEmbeddings:", objc_msgSend(v57, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pauseReason"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v67 = v55;
      v68 = v52;
      v96 = 0u;
      v97 = 0u;
      v94 = 0u;
      v95 = 0u;
      v59 = v58;
      v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v94, v107, 16);
      if (v60)
      {
        v61 = v60;
        v62 = *(_QWORD *)v95;
        do
        {
          for (k = 0; k != v61; ++k)
          {
            if (*(_QWORD *)v95 != v62)
              objc_enumerationMutation(v59);
            v64 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * k);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              -[ASRSchemaASRRecognitionMetrics addPauseReason:](v5, "addPauseReason:", objc_msgSend(v64, "intValue"));
          }
          v61 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v94, v107, 16);
        }
        while (v61);
      }

      v44 = v76;
      v55 = v67;
      v52 = v68;
      v43 = v73;
      v54 = v74;
    }
    v65 = v5;

  }
  return v5;
}

- (unint64_t)personalizedLanguageModelAgeInNs
{
  return self->_personalizedLanguageModelAgeInNs;
}

- (float)personalizedLanguageModelWeight
{
  return self->_personalizedLanguageModelWeight;
}

- (ASRSchemaASRRecognizerComponents)recognizerComponents
{
  return self->_recognizerComponents;
}

- (void)setRecognizerComponents:(id)a3
{
  objc_storeStrong((id *)&self->_recognizerComponents, a3);
}

- (float)averageActiveTokensPerFrame
{
  return self->_averageActiveTokensPerFrame;
}

- (NSArray)languageModelInterpolationWeights
{
  return self->_languageModelInterpolationWeights;
}

- (void)setLanguageModelInterpolationWeights:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (float)signalToNoiseRatioInDecibels
{
  return self->_signalToNoiseRatioInDecibels;
}

- (unint64_t)recognitionDurationInNs
{
  return self->_recognitionDurationInNs;
}

- (unint64_t)audioDurationInNs
{
  return self->_audioDurationInNs;
}

- (BOOL)eagerEnabled
{
  return self->_eagerEnabled;
}

- (BOOL)utteranceDetectionEnabled
{
  return self->_utteranceDetectionEnabled;
}

- (BOOL)utteranceConcatenationEnabled
{
  return self->_utteranceConcatenationEnabled;
}

- (BOOL)continuousListeningEnabled
{
  return self->_continuousListeningEnabled;
}

- (unint64_t)eagerCustomerPerceivedLatencyInNs
{
  return self->_eagerCustomerPerceivedLatencyInNs;
}

- (float)cpuRealTimeFactor
{
  return self->_cpuRealTimeFactor;
}

- (unsigned)numLanguageModelEnrollmentDataStreams
{
  return self->_numLanguageModelEnrollmentDataStreams;
}

- (NSString)phoneticMatchDecoderName
{
  return self->_phoneticMatchDecoderName;
}

- (void)setPhoneticMatchDecoderName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (unint64_t)inverseTextNormalizationDurationInNs
{
  return self->_inverseTextNormalizationDurationInNs;
}

- (ASRSchemaASREmojiMetrics)emojiMetrics
{
  return self->_emojiMetrics;
}

- (void)setEmojiMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_emojiMetrics, a3);
}

- (NSArray)pausedAudioDurationsInNs
{
  return self->_pausedAudioDurationsInNs;
}

- (void)setPausedAudioDurationsInNs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (unint64_t)inverseTextNormalizationDurationForFinalResultInNs
{
  return self->_inverseTextNormalizationDurationForFinalResultInNs;
}

- (unsigned)numberOfInverseTextNormalizationRuns
{
  return self->_numberOfInverseTextNormalizationRuns;
}

- (unint64_t)secondaryPassDurationInNs
{
  return self->_secondaryPassDurationInNs;
}

- (unsigned)numberOfSecondaryPassRuns
{
  return self->_numberOfSecondaryPassRuns;
}

- (unint64_t)cpuInstructionsInMillionsPerSecond
{
  return self->_cpuInstructionsInMillionsPerSecond;
}

- (unint64_t)appleNeuralEngineCpuTimeInNs
{
  return self->_appleNeuralEngineCpuTimeInNs;
}

- (unint64_t)pageInsWaitTimeInNs
{
  return self->_pageInsWaitTimeInNs;
}

- (int)recognitionHardware
{
  return self->_recognitionHardware;
}

- (unsigned)numIngestedNeuralContextualBiasingEmbeddings
{
  return self->_numIngestedNeuralContextualBiasingEmbeddings;
}

- (NSArray)pauseReasons
{
  return self->_pauseReasons;
}

- (void)setPauseReasons:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (void)setHasRecognizerComponents:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void)setHasPhoneticMatchDecoderName:(BOOL)a3
{
  self->_hasRecognizerComponents = a3;
}

- (void)setHasEmojiMetrics:(BOOL)a3
{
  self->_hasPhoneticMatchDecoderName = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pauseReasons, 0);
  objc_storeStrong((id *)&self->_pausedAudioDurationsInNs, 0);
  objc_storeStrong((id *)&self->_emojiMetrics, 0);
  objc_storeStrong((id *)&self->_phoneticMatchDecoderName, 0);
  objc_storeStrong((id *)&self->_languageModelInterpolationWeights, 0);
  objc_storeStrong((id *)&self->_recognizerComponents, 0);
}

@end
