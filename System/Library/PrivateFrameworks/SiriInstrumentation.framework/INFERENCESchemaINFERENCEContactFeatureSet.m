@implementation INFERENCESchemaINFERENCEContactFeatureSet

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setIsRecent:(float)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_isRecent = a3;
}

- (BOOL)hasIsRecent
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setHasIsRecent:(BOOL)a3
{
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFFFFFE | a3;
}

- (void)deleteIsRecent
{
  double v2;

  LODWORD(v2) = 0;
  -[INFERENCESchemaINFERENCEContactFeatureSet setIsRecent:](self, "setIsRecent:", v2);
  *(_DWORD *)&self->_has &= ~1u;
}

- (void)setIsRecentInSameDomain:(float)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_isRecentInSameDomain = a3;
}

- (BOOL)hasIsRecentInSameDomain
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 1) & 1;
}

- (void)setHasIsRecentInSameDomain:(BOOL)a3
{
  int v3;
  unint64_t v4;

  v3 = 2;
  if (!a3)
    v3 = 0;
  v4 = *(_DWORD *)&self->_has & 0xFFFFFFFD | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFFFFFD | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)deleteIsRecentInSameDomain
{
  double v2;
  $84752DCADCC9A46F675661ABABD0E080 v4;
  unint64_t v5;

  LODWORD(v2) = 0;
  -[INFERENCESchemaINFERENCEContactFeatureSet setIsRecentInSameDomain:](self, "setIsRecentInSameDomain:", v2);
  v4 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  v5 = *(_QWORD *)&v4 & 0xFFFFFFFFFFFFFFFDLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v4 & 0xFFFFFFFD;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)setIsRecentInSiriRequest:(float)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_isRecentInSiriRequest = a3;
}

- (BOOL)hasIsRecentInSiriRequest
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 2) & 1;
}

- (void)setHasIsRecentInSiriRequest:(BOOL)a3
{
  int v3;
  unint64_t v4;

  v3 = 4;
  if (!a3)
    v3 = 0;
  v4 = *(_DWORD *)&self->_has & 0xFFFFFFFB | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFFFFFB | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)deleteIsRecentInSiriRequest
{
  double v2;
  $84752DCADCC9A46F675661ABABD0E080 v4;
  unint64_t v5;

  LODWORD(v2) = 0;
  -[INFERENCESchemaINFERENCEContactFeatureSet setIsRecentInSiriRequest:](self, "setIsRecentInSiriRequest:", v2);
  v4 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  v5 = *(_QWORD *)&v4 & 0xFFFFFFFFFFFFFFFBLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v4 & 0xFFFFFFFB;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)setIsRecentlyCorrected:(float)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_isRecentlyCorrected = a3;
}

- (BOOL)hasIsRecentlyCorrected
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 3) & 1;
}

- (void)setHasIsRecentlyCorrected:(BOOL)a3
{
  int v3;
  unint64_t v4;

  v3 = 8;
  if (!a3)
    v3 = 0;
  v4 = *(_DWORD *)&self->_has & 0xFFFFFFF7 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFFFFF7 | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)deleteIsRecentlyCorrected
{
  double v2;
  $84752DCADCC9A46F675661ABABD0E080 v4;
  unint64_t v5;

  LODWORD(v2) = 0;
  -[INFERENCESchemaINFERENCEContactFeatureSet setIsRecentlyCorrected:](self, "setIsRecentlyCorrected:", v2);
  v4 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  v5 = *(_QWORD *)&v4 & 0xFFFFFFFFFFFFFFF7 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v4 & 0xFFFFFFF7;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)setRecencyRank:(float)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_recencyRank = a3;
}

- (BOOL)hasRecencyRank
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 4) & 1;
}

- (void)setHasRecencyRank:(BOOL)a3
{
  int v3;
  unint64_t v4;

  v3 = 16;
  if (!a3)
    v3 = 0;
  v4 = *(_DWORD *)&self->_has & 0xFFFFFFEF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFFFFEF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)deleteRecencyRank
{
  double v2;
  $84752DCADCC9A46F675661ABABD0E080 v4;
  unint64_t v5;

  LODWORD(v2) = 0;
  -[INFERENCESchemaINFERENCEContactFeatureSet setRecencyRank:](self, "setRecencyRank:", v2);
  v4 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  v5 = *(_QWORD *)&v4 & 0xFFFFFFFFFFFFFFEFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v4 & 0xFFFFFFEF;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)setRecencyRankInSameDomain:(float)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_recencyRankInSameDomain = a3;
}

- (BOOL)hasRecencyRankInSameDomain
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 5) & 1;
}

- (void)setHasRecencyRankInSameDomain:(BOOL)a3
{
  int v3;
  unint64_t v4;

  v3 = 32;
  if (!a3)
    v3 = 0;
  v4 = *(_DWORD *)&self->_has & 0xFFFFFFDF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFFFFDF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)deleteRecencyRankInSameDomain
{
  double v2;
  $84752DCADCC9A46F675661ABABD0E080 v4;
  unint64_t v5;

  LODWORD(v2) = 0;
  -[INFERENCESchemaINFERENCEContactFeatureSet setRecencyRankInSameDomain:](self, "setRecencyRankInSameDomain:", v2);
  v4 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  v5 = *(_QWORD *)&v4 & 0xFFFFFFFFFFFFFFDFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v4 & 0xFFFFFFDF;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)setRecencyRankInSiriRequest:(float)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_recencyRankInSiriRequest = a3;
}

- (BOOL)hasRecencyRankInSiriRequest
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 6) & 1;
}

- (void)setHasRecencyRankInSiriRequest:(BOOL)a3
{
  int v3;
  unint64_t v4;

  v3 = 64;
  if (!a3)
    v3 = 0;
  v4 = *(_DWORD *)&self->_has & 0xFFFFFFBF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFFFFBF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)deleteRecencyRankInSiriRequest
{
  double v2;
  $84752DCADCC9A46F675661ABABD0E080 v4;
  unint64_t v5;

  LODWORD(v2) = 0;
  -[INFERENCESchemaINFERENCEContactFeatureSet setRecencyRankInSiriRequest:](self, "setRecencyRankInSiriRequest:", v2);
  v4 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  v5 = *(_QWORD *)&v4 & 0xFFFFFFFFFFFFFFBFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v4 & 0xFFFFFFBF;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)setIsHighQualityRequestMatch:(float)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_isHighQualityRequestMatch = a3;
}

- (BOOL)hasIsHighQualityRequestMatch
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 7) & 1;
}

- (void)setHasIsHighQualityRequestMatch:(BOOL)a3
{
  int v3;
  unint64_t v4;

  v3 = 128;
  if (!a3)
    v3 = 0;
  v4 = *(_DWORD *)&self->_has & 0xFFFFFF7F | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFFFF7F | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)deleteIsHighQualityRequestMatch
{
  double v2;
  $84752DCADCC9A46F675661ABABD0E080 v4;
  unint64_t v5;

  LODWORD(v2) = 0;
  -[INFERENCESchemaINFERENCEContactFeatureSet setIsHighQualityRequestMatch:](self, "setIsHighQualityRequestMatch:", v2);
  v4 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  v5 = *(_QWORD *)&v4 & 0xFFFFFFFFFFFFFF7FLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v4 & 0xFFFFFF7F;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)setIsFavorite:(float)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_isFavorite = a3;
}

- (BOOL)hasIsFavorite
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 8) & 1;
}

- (void)setHasIsFavorite:(BOOL)a3
{
  int v3;
  unint64_t v4;

  v3 = 256;
  if (!a3)
    v3 = 0;
  v4 = *(_DWORD *)&self->_has & 0xFFFFFEFF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFFFEFF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)deleteIsFavorite
{
  double v2;
  $84752DCADCC9A46F675661ABABD0E080 v4;
  unint64_t v5;

  LODWORD(v2) = 0;
  -[INFERENCESchemaINFERENCEContactFeatureSet setIsFavorite:](self, "setIsFavorite:", v2);
  v4 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  v5 = *(_QWORD *)&v4 & 0xFFFFFFFFFFFFFEFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v4 & 0xFFFFFEFF;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)setIsMeCardRelation:(float)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_isMeCardRelation = a3;
}

- (BOOL)hasIsMeCardRelation
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 9) & 1;
}

- (void)setHasIsMeCardRelation:(BOOL)a3
{
  int v3;
  unint64_t v4;

  v3 = 512;
  if (!a3)
    v3 = 0;
  v4 = *(_DWORD *)&self->_has & 0xFFFFFDFF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFFFDFF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)deleteIsMeCardRelation
{
  double v2;
  $84752DCADCC9A46F675661ABABD0E080 v4;
  unint64_t v5;

  LODWORD(v2) = 0;
  -[INFERENCESchemaINFERENCEContactFeatureSet setIsMeCardRelation:](self, "setIsMeCardRelation:", v2);
  v4 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  v5 = *(_QWORD *)&v4 & 0xFFFFFFFFFFFFFDFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v4 & 0xFFFFFDFF;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)setIsWeakOrganizationMatch:(float)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_isWeakOrganizationMatch = a3;
}

- (BOOL)hasIsWeakOrganizationMatch
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 10) & 1;
}

- (void)setHasIsWeakOrganizationMatch:(BOOL)a3
{
  int v3;
  unint64_t v4;

  v3 = 1024;
  if (!a3)
    v3 = 0;
  v4 = *(_DWORD *)&self->_has & 0xFFFFFBFF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFFFBFF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)deleteIsWeakOrganizationMatch
{
  double v2;
  $84752DCADCC9A46F675661ABABD0E080 v4;
  unint64_t v5;

  LODWORD(v2) = 0;
  -[INFERENCESchemaINFERENCEContactFeatureSet setIsWeakOrganizationMatch:](self, "setIsWeakOrganizationMatch:", v2);
  v4 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  v5 = *(_QWORD *)&v4 & 0xFFFFFFFFFFFFFBFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v4 & 0xFFFFFBFF;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)setSpeechAlternativeRanksGivenNameRank:(float)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_speechAlternativeRanksGivenNameRank = a3;
}

- (BOOL)hasSpeechAlternativeRanksGivenNameRank
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 11) & 1;
}

- (void)setHasSpeechAlternativeRanksGivenNameRank:(BOOL)a3
{
  int v3;
  unint64_t v4;

  v3 = 2048;
  if (!a3)
    v3 = 0;
  v4 = *(_DWORD *)&self->_has & 0xFFFFF7FF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFFF7FF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)deleteSpeechAlternativeRanksGivenNameRank
{
  double v2;
  $84752DCADCC9A46F675661ABABD0E080 v4;
  unint64_t v5;

  LODWORD(v2) = 0;
  -[INFERENCESchemaINFERENCEContactFeatureSet setSpeechAlternativeRanksGivenNameRank:](self, "setSpeechAlternativeRanksGivenNameRank:", v2);
  v4 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  v5 = *(_QWORD *)&v4 & 0xFFFFFFFFFFFFF7FFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v4 & 0xFFFFF7FF;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)setSpeechAlternativeRanksMiddleNameRank:(float)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_speechAlternativeRanksMiddleNameRank = a3;
}

- (BOOL)hasSpeechAlternativeRanksMiddleNameRank
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 12) & 1;
}

- (void)setHasSpeechAlternativeRanksMiddleNameRank:(BOOL)a3
{
  int v3;
  unint64_t v4;

  v3 = 4096;
  if (!a3)
    v3 = 0;
  v4 = *(_DWORD *)&self->_has & 0xFFFFEFFF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFFEFFF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)deleteSpeechAlternativeRanksMiddleNameRank
{
  double v2;
  $84752DCADCC9A46F675661ABABD0E080 v4;
  unint64_t v5;

  LODWORD(v2) = 0;
  -[INFERENCESchemaINFERENCEContactFeatureSet setSpeechAlternativeRanksMiddleNameRank:](self, "setSpeechAlternativeRanksMiddleNameRank:", v2);
  v4 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  v5 = *(_QWORD *)&v4 & 0xFFFFFFFFFFFFEFFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v4 & 0xFFFFEFFF;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)setSpeechAlternativeRanksFamilyNameRank:(float)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_speechAlternativeRanksFamilyNameRank = a3;
}

- (BOOL)hasSpeechAlternativeRanksFamilyNameRank
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 13) & 1;
}

- (void)setHasSpeechAlternativeRanksFamilyNameRank:(BOOL)a3
{
  int v3;
  unint64_t v4;

  v3 = 0x2000;
  if (!a3)
    v3 = 0;
  v4 = *(_DWORD *)&self->_has & 0xFFFFDFFF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFFDFFF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)deleteSpeechAlternativeRanksFamilyNameRank
{
  double v2;
  $84752DCADCC9A46F675661ABABD0E080 v4;
  unint64_t v5;

  LODWORD(v2) = 0;
  -[INFERENCESchemaINFERENCEContactFeatureSet setSpeechAlternativeRanksFamilyNameRank:](self, "setSpeechAlternativeRanksFamilyNameRank:", v2);
  v4 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  v5 = *(_QWORD *)&v4 & 0xFFFFFFFFFFFFDFFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v4 & 0xFFFFDFFF;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)setFreqAnyGroup0MinTo2Min:(float)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_freqAnyGroup0MinTo2Min = a3;
}

- (BOOL)hasFreqAnyGroup0MinTo2Min
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 14) & 1;
}

- (void)setHasFreqAnyGroup0MinTo2Min:(BOOL)a3
{
  int v3;
  unint64_t v4;

  v3 = 0x4000;
  if (!a3)
    v3 = 0;
  v4 = *(_DWORD *)&self->_has & 0xFFFFBFFF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFFBFFF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)deleteFreqAnyGroup0MinTo2Min
{
  double v2;
  $84752DCADCC9A46F675661ABABD0E080 v4;
  unint64_t v5;

  LODWORD(v2) = 0;
  -[INFERENCESchemaINFERENCEContactFeatureSet setFreqAnyGroup0MinTo2Min:](self, "setFreqAnyGroup0MinTo2Min:", v2);
  v4 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  v5 = *(_QWORD *)&v4 & 0xFFFFFFFFFFFFBFFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v4 & 0xFFFFBFFF;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)setFreqAnyGroup2MinTo10Min:(float)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_freqAnyGroup2MinTo10Min = a3;
}

- (BOOL)hasFreqAnyGroup2MinTo10Min
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 15) & 1;
}

- (void)setHasFreqAnyGroup2MinTo10Min:(BOOL)a3
{
  int v3;
  unint64_t v4;

  v3 = 0x8000;
  if (!a3)
    v3 = 0;
  v4 = *(_DWORD *)&self->_has & 0xFFFF7FFF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFF7FFF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)deleteFreqAnyGroup2MinTo10Min
{
  double v2;
  $84752DCADCC9A46F675661ABABD0E080 v4;
  unint64_t v5;

  LODWORD(v2) = 0;
  -[INFERENCESchemaINFERENCEContactFeatureSet setFreqAnyGroup2MinTo10Min:](self, "setFreqAnyGroup2MinTo10Min:", v2);
  v4 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  v5 = *(_QWORD *)&v4 & 0xFFFFFFFFFFFF7FFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v4 & 0xFFFF7FFF;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)setFreqAnyGroup10MinTo1Hr:(float)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_freqAnyGroup10MinTo1Hr = a3;
}

- (BOOL)hasFreqAnyGroup10MinTo1Hr
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 16) & 1;
}

- (void)setHasFreqAnyGroup10MinTo1Hr:(BOOL)a3
{
  int v3;
  unint64_t v4;

  v3 = 0x10000;
  if (!a3)
    v3 = 0;
  v4 = *(_DWORD *)&self->_has & 0xFFFEFFFF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFEFFFF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)deleteFreqAnyGroup10MinTo1Hr
{
  double v2;
  $84752DCADCC9A46F675661ABABD0E080 v4;
  unint64_t v5;

  LODWORD(v2) = 0;
  -[INFERENCESchemaINFERENCEContactFeatureSet setFreqAnyGroup10MinTo1Hr:](self, "setFreqAnyGroup10MinTo1Hr:", v2);
  v4 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  v5 = *(_QWORD *)&v4 & 0xFFFFFFFFFFFEFFFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v4 & 0xFFFEFFFF;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)setFreqAnyGroup1HrTo6Hr:(float)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_freqAnyGroup1HrTo6Hr = a3;
}

- (BOOL)hasFreqAnyGroup1HrTo6Hr
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 17) & 1;
}

- (void)setHasFreqAnyGroup1HrTo6Hr:(BOOL)a3
{
  int v3;
  unint64_t v4;

  v3 = 0x20000;
  if (!a3)
    v3 = 0;
  v4 = *(_DWORD *)&self->_has & 0xFFFDFFFF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFDFFFF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)deleteFreqAnyGroup1HrTo6Hr
{
  double v2;
  $84752DCADCC9A46F675661ABABD0E080 v4;
  unint64_t v5;

  LODWORD(v2) = 0;
  -[INFERENCESchemaINFERENCEContactFeatureSet setFreqAnyGroup1HrTo6Hr:](self, "setFreqAnyGroup1HrTo6Hr:", v2);
  v4 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  v5 = *(_QWORD *)&v4 & 0xFFFFFFFFFFFDFFFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v4 & 0xFFFDFFFF;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)setFreqAnyGroup6HrTo1Day:(float)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_freqAnyGroup6HrTo1Day = a3;
}

- (BOOL)hasFreqAnyGroup6HrTo1Day
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 18) & 1;
}

- (void)setHasFreqAnyGroup6HrTo1Day:(BOOL)a3
{
  int v3;
  unint64_t v4;

  v3 = 0x40000;
  if (!a3)
    v3 = 0;
  v4 = *(_DWORD *)&self->_has & 0xFFFBFFFF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFBFFFF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)deleteFreqAnyGroup6HrTo1Day
{
  double v2;
  $84752DCADCC9A46F675661ABABD0E080 v4;
  unint64_t v5;

  LODWORD(v2) = 0;
  -[INFERENCESchemaINFERENCEContactFeatureSet setFreqAnyGroup6HrTo1Day:](self, "setFreqAnyGroup6HrTo1Day:", v2);
  v4 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  v5 = *(_QWORD *)&v4 & 0xFFFFFFFFFFFBFFFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v4 & 0xFFFBFFFF;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)setFreqAnyGroup1DayTo7Day:(float)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_freqAnyGroup1DayTo7Day = a3;
}

- (BOOL)hasFreqAnyGroup1DayTo7Day
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 19) & 1;
}

- (void)setHasFreqAnyGroup1DayTo7Day:(BOOL)a3
{
  int v3;
  unint64_t v4;

  v3 = 0x80000;
  if (!a3)
    v3 = 0;
  v4 = *(_DWORD *)&self->_has & 0xFFF7FFFF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFF7FFFF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)deleteFreqAnyGroup1DayTo7Day
{
  double v2;
  $84752DCADCC9A46F675661ABABD0E080 v4;
  unint64_t v5;

  LODWORD(v2) = 0;
  -[INFERENCESchemaINFERENCEContactFeatureSet setFreqAnyGroup1DayTo7Day:](self, "setFreqAnyGroup1DayTo7Day:", v2);
  v4 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  v5 = *(_QWORD *)&v4 & 0xFFFFFFFFFFF7FFFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v4 & 0xFFF7FFFF;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)setFreqAnyGroup7DayTo28Day:(float)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_freqAnyGroup7DayTo28Day = a3;
}

- (BOOL)hasFreqAnyGroup7DayTo28Day
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 20) & 1;
}

- (void)setHasFreqAnyGroup7DayTo28Day:(BOOL)a3
{
  int v3;
  unint64_t v4;

  v3 = 0x100000;
  if (!a3)
    v3 = 0;
  v4 = *(_DWORD *)&self->_has & 0xFFEFFFFF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFEFFFFF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)deleteFreqAnyGroup7DayTo28Day
{
  double v2;
  $84752DCADCC9A46F675661ABABD0E080 v4;
  unint64_t v5;

  LODWORD(v2) = 0;
  -[INFERENCESchemaINFERENCEContactFeatureSet setFreqAnyGroup7DayTo28Day:](self, "setFreqAnyGroup7DayTo28Day:", v2);
  v4 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  v5 = *(_QWORD *)&v4 & 0xFFFFFFFFFFEFFFFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v4 & 0xFFEFFFFF;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)setFreqAnyGroup28DayToInf:(float)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_freqAnyGroup28DayToInf = a3;
}

- (BOOL)hasFreqAnyGroup28DayToInf
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 21) & 1;
}

- (void)setHasFreqAnyGroup28DayToInf:(BOOL)a3
{
  int v3;
  unint64_t v4;

  v3 = 0x200000;
  if (!a3)
    v3 = 0;
  v4 = *(_DWORD *)&self->_has & 0xFFDFFFFF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFDFFFFF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)deleteFreqAnyGroup28DayToInf
{
  double v2;
  $84752DCADCC9A46F675661ABABD0E080 v4;
  unint64_t v5;

  LODWORD(v2) = 0;
  -[INFERENCESchemaINFERENCEContactFeatureSet setFreqAnyGroup28DayToInf:](self, "setFreqAnyGroup28DayToInf:", v2);
  v4 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  v5 = *(_QWORD *)&v4 & 0xFFFFFFFFFFDFFFFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v4 & 0xFFDFFFFF;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)setFreqSameGroup0MinTo2Min:(float)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_freqSameGroup0MinTo2Min = a3;
}

- (BOOL)hasFreqSameGroup0MinTo2Min
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 22) & 1;
}

- (void)setHasFreqSameGroup0MinTo2Min:(BOOL)a3
{
  int v3;
  unint64_t v4;

  v3 = 0x400000;
  if (!a3)
    v3 = 0;
  v4 = *(_DWORD *)&self->_has & 0xFFBFFFFF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFBFFFFF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)deleteFreqSameGroup0MinTo2Min
{
  double v2;
  $84752DCADCC9A46F675661ABABD0E080 v4;
  unint64_t v5;

  LODWORD(v2) = 0;
  -[INFERENCESchemaINFERENCEContactFeatureSet setFreqSameGroup0MinTo2Min:](self, "setFreqSameGroup0MinTo2Min:", v2);
  v4 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  v5 = *(_QWORD *)&v4 & 0xFFFFFFFFFFBFFFFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v4 & 0xFFBFFFFF;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)setFreqSameGroup2MinTo10Min:(float)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_freqSameGroup2MinTo10Min = a3;
}

- (BOOL)hasFreqSameGroup2MinTo10Min
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 23) & 1;
}

- (void)setHasFreqSameGroup2MinTo10Min:(BOOL)a3
{
  int v3;
  unint64_t v4;

  v3 = 0x800000;
  if (!a3)
    v3 = 0;
  v4 = *(_DWORD *)&self->_has & 0xFF7FFFFF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFF7FFFFF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)deleteFreqSameGroup2MinTo10Min
{
  double v2;
  $84752DCADCC9A46F675661ABABD0E080 v4;
  unint64_t v5;

  LODWORD(v2) = 0;
  -[INFERENCESchemaINFERENCEContactFeatureSet setFreqSameGroup2MinTo10Min:](self, "setFreqSameGroup2MinTo10Min:", v2);
  v4 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  v5 = *(_QWORD *)&v4 & 0xFFFFFFFFFF7FFFFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v4 & 0xFF7FFFFF;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)setFreqSameGroup10MinTo1Hr:(float)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_freqSameGroup10MinTo1Hr = a3;
}

- (BOOL)hasFreqSameGroup10MinTo1Hr
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 24) & 1;
}

- (void)setHasFreqSameGroup10MinTo1Hr:(BOOL)a3
{
  int v3;
  unint64_t v4;

  v3 = 0x1000000;
  if (!a3)
    v3 = 0;
  v4 = *(_DWORD *)&self->_has & 0xFEFFFFFF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFEFFFFFF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)deleteFreqSameGroup10MinTo1Hr
{
  double v2;
  $84752DCADCC9A46F675661ABABD0E080 v4;
  unint64_t v5;

  LODWORD(v2) = 0;
  -[INFERENCESchemaINFERENCEContactFeatureSet setFreqSameGroup10MinTo1Hr:](self, "setFreqSameGroup10MinTo1Hr:", v2);
  v4 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  v5 = *(_QWORD *)&v4 & 0xFFFFFFFFFEFFFFFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v4 & 0xFEFFFFFF;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)setFreqSameGroup1HrTo6Hr:(float)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_freqSameGroup1HrTo6Hr = a3;
}

- (BOOL)hasFreqSameGroup1HrTo6Hr
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 25) & 1;
}

- (void)setHasFreqSameGroup1HrTo6Hr:(BOOL)a3
{
  int v3;
  unint64_t v4;

  v3 = 0x2000000;
  if (!a3)
    v3 = 0;
  v4 = *(_DWORD *)&self->_has & 0xFDFFFFFF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFDFFFFFF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)deleteFreqSameGroup1HrTo6Hr
{
  double v2;
  $84752DCADCC9A46F675661ABABD0E080 v4;
  unint64_t v5;

  LODWORD(v2) = 0;
  -[INFERENCESchemaINFERENCEContactFeatureSet setFreqSameGroup1HrTo6Hr:](self, "setFreqSameGroup1HrTo6Hr:", v2);
  v4 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  v5 = *(_QWORD *)&v4 & 0xFFFFFFFFFDFFFFFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v4 & 0xFDFFFFFF;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)setFreqSameGroup6HrTo1Day:(float)a3
{
  *(_DWORD *)&self->_has |= 0x4000000u;
  self->_freqSameGroup6HrTo1Day = a3;
}

- (BOOL)hasFreqSameGroup6HrTo1Day
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 26) & 1;
}

- (void)setHasFreqSameGroup6HrTo1Day:(BOOL)a3
{
  int v3;
  unint64_t v4;

  v3 = 0x4000000;
  if (!a3)
    v3 = 0;
  v4 = *(_DWORD *)&self->_has & 0xFBFFFFFF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFBFFFFFF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)deleteFreqSameGroup6HrTo1Day
{
  double v2;
  $84752DCADCC9A46F675661ABABD0E080 v4;
  unint64_t v5;

  LODWORD(v2) = 0;
  -[INFERENCESchemaINFERENCEContactFeatureSet setFreqSameGroup6HrTo1Day:](self, "setFreqSameGroup6HrTo1Day:", v2);
  v4 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  v5 = *(_QWORD *)&v4 & 0xFFFFFFFFFBFFFFFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v4 & 0xFBFFFFFF;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)setFreqSameGroup1DayTo7Day:(float)a3
{
  *(_DWORD *)&self->_has |= 0x8000000u;
  self->_freqSameGroup1DayTo7Day = a3;
}

- (BOOL)hasFreqSameGroup1DayTo7Day
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 27) & 1;
}

- (void)setHasFreqSameGroup1DayTo7Day:(BOOL)a3
{
  int v3;
  unint64_t v4;

  v3 = 0x8000000;
  if (!a3)
    v3 = 0;
  v4 = *(_DWORD *)&self->_has & 0xF7FFFFFF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xF7FFFFFF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)deleteFreqSameGroup1DayTo7Day
{
  double v2;
  $84752DCADCC9A46F675661ABABD0E080 v4;
  unint64_t v5;

  LODWORD(v2) = 0;
  -[INFERENCESchemaINFERENCEContactFeatureSet setFreqSameGroup1DayTo7Day:](self, "setFreqSameGroup1DayTo7Day:", v2);
  v4 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  v5 = *(_QWORD *)&v4 & 0xFFFFFFFFF7FFFFFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v4 & 0xF7FFFFFF;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)setFreqSameGroup7DayTo28Day:(float)a3
{
  *(_DWORD *)&self->_has |= 0x10000000u;
  self->_freqSameGroup7DayTo28Day = a3;
}

- (BOOL)hasFreqSameGroup7DayTo28Day
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 28) & 1;
}

- (void)setHasFreqSameGroup7DayTo28Day:(BOOL)a3
{
  int v3;
  unint64_t v4;

  v3 = 0x10000000;
  if (!a3)
    v3 = 0;
  v4 = *(_DWORD *)&self->_has & 0xEFFFFFFF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xEFFFFFFF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)deleteFreqSameGroup7DayTo28Day
{
  double v2;
  $84752DCADCC9A46F675661ABABD0E080 v4;
  unint64_t v5;

  LODWORD(v2) = 0;
  -[INFERENCESchemaINFERENCEContactFeatureSet setFreqSameGroup7DayTo28Day:](self, "setFreqSameGroup7DayTo28Day:", v2);
  v4 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  v5 = *(_QWORD *)&v4 & 0xFFFFFFFFEFFFFFFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v4 & 0xEFFFFFFF;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)setFreqSameGroup28DayToInf:(float)a3
{
  *(_DWORD *)&self->_has |= 0x20000000u;
  self->_freqSameGroup28DayToInf = a3;
}

- (BOOL)hasFreqSameGroup28DayToInf
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 29) & 1;
}

- (void)setHasFreqSameGroup28DayToInf:(BOOL)a3
{
  int v3;
  unint64_t v4;

  v3 = 0x20000000;
  if (!a3)
    v3 = 0;
  v4 = *(_DWORD *)&self->_has & 0xDFFFFFFF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xDFFFFFFF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)deleteFreqSameGroup28DayToInf
{
  double v2;
  $84752DCADCC9A46F675661ABABD0E080 v4;
  unint64_t v5;

  LODWORD(v2) = 0;
  -[INFERENCESchemaINFERENCEContactFeatureSet setFreqSameGroup28DayToInf:](self, "setFreqSameGroup28DayToInf:", v2);
  v4 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  v5 = *(_QWORD *)&v4 & 0xFFFFFFFFDFFFFFFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v4 & 0xDFFFFFFF;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)setIsSuggested:(float)a3
{
  *(_DWORD *)&self->_has |= 0x40000000u;
  self->_isSuggested = a3;
}

- (BOOL)hasIsSuggested
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 30) & 1;
}

- (void)setHasIsSuggested:(BOOL)a3
{
  int v3;
  unint64_t v4;

  v3 = 0x40000000;
  if (!a3)
    v3 = 0;
  v4 = *(_DWORD *)&self->_has & 0xBFFFFFFF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xBFFFFFFF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)deleteIsSuggested
{
  double v2;
  $84752DCADCC9A46F675661ABABD0E080 v4;
  unint64_t v5;

  LODWORD(v2) = 0;
  -[INFERENCESchemaINFERENCEContactFeatureSet setIsSuggested:](self, "setIsSuggested:", v2);
  v4 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  v5 = *(_QWORD *)&v4 & 0xFFFFFFFFBFFFFFFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v4 & 0xBFFFFFFF;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)setIsHypocorism:(float)a3
{
  *(_DWORD *)&self->_has |= 0x80000000;
  self->_isHypocorism = a3;
}

- (BOOL)hasIsHypocorism
{
  return *(_DWORD *)&self->_has >> 31;
}

- (void)setHasIsHypocorism:(BOOL)a3
{
  unsigned int v3;
  unint64_t v4;

  v3 = 0x80000000;
  if (!a3)
    v3 = 0;
  v4 = *(_DWORD *)&self->_has & 0x7FFFFFFF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0x7FFFFFFF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)deleteIsHypocorism
{
  double v2;
  $84752DCADCC9A46F675661ABABD0E080 v4;
  unint64_t v5;

  LODWORD(v2) = 0;
  -[INFERENCESchemaINFERENCEContactFeatureSet setIsHypocorism:](self, "setIsHypocorism:", v2);
  v4 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  v5 = *(_QWORD *)&v4 & 0xFFFFFFFF7FFFFFFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v4 & 0x7FFFFFFF;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)setHasSuggestedProperties:(float)a3
{
  *((_WORD *)&self->_has + 2) = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32) | 0x100000000) >> 32;
  self->_hasSuggestedProperties = a3;
}

- (BOOL)hasHasSuggestedProperties
{
  return *((_WORD *)&self->_has + 2) & 1;
}

- (void)setHasHasSuggestedProperties:(BOOL)a3
{
  uint64_t v3;
  unint64_t v4;

  v3 = 0x100000000;
  if (!a3)
    v3 = 0;
  v4 = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFFFFEFFFFFFFFLL | v3;
  *(_DWORD *)&self->_has = self->_has;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)deleteHasSuggestedProperties
{
  double v2;
  $84752DCADCC9A46F675661ABABD0E080 v4;
  unint64_t v5;

  LODWORD(v2) = 0;
  -[INFERENCESchemaINFERENCEContactFeatureSet setHasSuggestedProperties:](self, "setHasSuggestedProperties:", v2);
  v4 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  v5 = (*(_QWORD *)&v4 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFFFFEFFFFFFFFLL;
  *(_DWORD *)&self->_has = v4;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)setIsPartialNameMatch:(float)a3
{
  *((_WORD *)&self->_has + 2) = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32) | 0x200000000) >> 32;
  self->_isPartialNameMatch = a3;
}

- (BOOL)hasIsPartialNameMatch
{
  return (*((unsigned __int16 *)&self->_has + 2) >> 1) & 1;
}

- (void)setHasIsPartialNameMatch:(BOOL)a3
{
  uint64_t v3;
  unint64_t v4;

  v3 = 0x200000000;
  if (!a3)
    v3 = 0;
  v4 = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFFFFDFFFFFFFFLL | v3;
  *(_DWORD *)&self->_has = self->_has;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)deleteIsPartialNameMatch
{
  double v2;
  $84752DCADCC9A46F675661ABABD0E080 v4;
  unint64_t v5;

  LODWORD(v2) = 0;
  -[INFERENCESchemaINFERENCEContactFeatureSet setIsPartialNameMatch:](self, "setIsPartialNameMatch:", v2);
  v4 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  v5 = (*(_QWORD *)&v4 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFFFFDFFFFFFFFLL;
  *(_DWORD *)&self->_has = v4;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)setNumPrimaryTokens:(float)a3
{
  *((_WORD *)&self->_has + 2) = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32) | 0x400000000) >> 32;
  self->_numPrimaryTokens = a3;
}

- (BOOL)hasNumPrimaryTokens
{
  return (*((unsigned __int16 *)&self->_has + 2) >> 2) & 1;
}

- (void)setHasNumPrimaryTokens:(BOOL)a3
{
  uint64_t v3;
  unint64_t v4;

  v3 = 0x400000000;
  if (!a3)
    v3 = 0;
  v4 = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFFFFBFFFFFFFFLL | v3;
  *(_DWORD *)&self->_has = self->_has;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)deleteNumPrimaryTokens
{
  double v2;
  $84752DCADCC9A46F675661ABABD0E080 v4;
  unint64_t v5;

  LODWORD(v2) = 0;
  -[INFERENCESchemaINFERENCEContactFeatureSet setNumPrimaryTokens:](self, "setNumPrimaryTokens:", v2);
  v4 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  v5 = (*(_QWORD *)&v4 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFFFFBFFFFFFFFLL;
  *(_DWORD *)&self->_has = v4;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)setAllQueryMatched:(float)a3
{
  *((_WORD *)&self->_has + 2) = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32) | 0x800000000) >> 32;
  self->_allQueryMatched = a3;
}

- (BOOL)hasAllQueryMatched
{
  return (*((unsigned __int16 *)&self->_has + 2) >> 3) & 1;
}

- (void)setHasAllQueryMatched:(BOOL)a3
{
  uint64_t v3;
  unint64_t v4;

  v3 = 0x800000000;
  if (!a3)
    v3 = 0;
  v4 = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFFFF7FFFFFFFFLL | v3;
  *(_DWORD *)&self->_has = self->_has;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)deleteAllQueryMatched
{
  double v2;
  $84752DCADCC9A46F675661ABABD0E080 v4;
  unint64_t v5;

  LODWORD(v2) = 0;
  -[INFERENCESchemaINFERENCEContactFeatureSet setAllQueryMatched:](self, "setAllQueryMatched:", v2);
  v4 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  v5 = (*(_QWORD *)&v4 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFFFF7FFFFFFFFLL;
  *(_DWORD *)&self->_has = v4;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)setAllPrimaryNameTokensAreInQuery:(float)a3
{
  *((_WORD *)&self->_has + 2) = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32) | 0x1000000000) >> 32;
  self->_allPrimaryNameTokensAreInQuery = a3;
}

- (BOOL)hasAllPrimaryNameTokensAreInQuery
{
  return (*((unsigned __int16 *)&self->_has + 2) >> 4) & 1;
}

- (void)setHasAllPrimaryNameTokensAreInQuery:(BOOL)a3
{
  uint64_t v3;
  unint64_t v4;

  v3 = 0x1000000000;
  if (!a3)
    v3 = 0;
  v4 = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFFFEFFFFFFFFFLL | v3;
  *(_DWORD *)&self->_has = self->_has;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)deleteAllPrimaryNameTokensAreInQuery
{
  double v2;
  $84752DCADCC9A46F675661ABABD0E080 v4;
  unint64_t v5;

  LODWORD(v2) = 0;
  -[INFERENCESchemaINFERENCEContactFeatureSet setAllPrimaryNameTokensAreInQuery:](self, "setAllPrimaryNameTokensAreInQuery:", v2);
  v4 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  v5 = (*(_QWORD *)&v4 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFFFEFFFFFFFFFLL;
  *(_DWORD *)&self->_has = v4;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)setIsGivenNameMatch:(float)a3
{
  *((_WORD *)&self->_has + 2) = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32) | 0x2000000000) >> 32;
  self->_isGivenNameMatch = a3;
}

- (BOOL)hasIsGivenNameMatch
{
  return (*((unsigned __int16 *)&self->_has + 2) >> 5) & 1;
}

- (void)setHasIsGivenNameMatch:(BOOL)a3
{
  uint64_t v3;
  unint64_t v4;

  v3 = 0x2000000000;
  if (!a3)
    v3 = 0;
  v4 = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFFFDFFFFFFFFFLL | v3;
  *(_DWORD *)&self->_has = self->_has;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)deleteIsGivenNameMatch
{
  double v2;
  $84752DCADCC9A46F675661ABABD0E080 v4;
  unint64_t v5;

  LODWORD(v2) = 0;
  -[INFERENCESchemaINFERENCEContactFeatureSet setIsGivenNameMatch:](self, "setIsGivenNameMatch:", v2);
  v4 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  v5 = (*(_QWORD *)&v4 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFFFDFFFFFFFFFLL;
  *(_DWORD *)&self->_has = v4;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)setIsMiddleNameMatch:(float)a3
{
  *((_WORD *)&self->_has + 2) = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32) | 0x4000000000) >> 32;
  self->_isMiddleNameMatch = a3;
}

- (BOOL)hasIsMiddleNameMatch
{
  return (*((unsigned __int16 *)&self->_has + 2) >> 6) & 1;
}

- (void)setHasIsMiddleNameMatch:(BOOL)a3
{
  uint64_t v3;
  unint64_t v4;

  v3 = 0x4000000000;
  if (!a3)
    v3 = 0;
  v4 = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFFFBFFFFFFFFFLL | v3;
  *(_DWORD *)&self->_has = self->_has;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)deleteIsMiddleNameMatch
{
  double v2;
  $84752DCADCC9A46F675661ABABD0E080 v4;
  unint64_t v5;

  LODWORD(v2) = 0;
  -[INFERENCESchemaINFERENCEContactFeatureSet setIsMiddleNameMatch:](self, "setIsMiddleNameMatch:", v2);
  v4 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  v5 = (*(_QWORD *)&v4 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFFFBFFFFFFFFFLL;
  *(_DWORD *)&self->_has = v4;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)setIsFamilyNameMatch:(float)a3
{
  *((_WORD *)&self->_has + 2) = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32) | 0x8000000000) >> 32;
  self->_isFamilyNameMatch = a3;
}

- (BOOL)hasIsFamilyNameMatch
{
  return (*((unsigned __int16 *)&self->_has + 2) >> 7) & 1;
}

- (void)setHasIsFamilyNameMatch:(BOOL)a3
{
  uint64_t v3;
  unint64_t v4;

  v3 = 0x8000000000;
  if (!a3)
    v3 = 0;
  v4 = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFFF7FFFFFFFFFLL | v3;
  *(_DWORD *)&self->_has = self->_has;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)deleteIsFamilyNameMatch
{
  double v2;
  $84752DCADCC9A46F675661ABABD0E080 v4;
  unint64_t v5;

  LODWORD(v2) = 0;
  -[INFERENCESchemaINFERENCEContactFeatureSet setIsFamilyNameMatch:](self, "setIsFamilyNameMatch:", v2);
  v4 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  v5 = (*(_QWORD *)&v4 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFFF7FFFFFFFFFLL;
  *(_DWORD *)&self->_has = v4;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)setIsOrganizationNameMatch:(float)a3
{
  *((_WORD *)&self->_has + 2) = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32) | 0x10000000000) >> 32;
  self->_isOrganizationNameMatch = a3;
}

- (BOOL)hasIsOrganizationNameMatch
{
  return *((_BYTE *)&self->_has + 5) & 1;
}

- (void)setHasIsOrganizationNameMatch:(BOOL)a3
{
  uint64_t v3;
  unint64_t v4;

  v3 = 0x10000000000;
  if (!a3)
    v3 = 0;
  v4 = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFFEFFFFFFFFFFLL | v3;
  *(_DWORD *)&self->_has = self->_has;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)deleteIsOrganizationNameMatch
{
  double v2;
  $84752DCADCC9A46F675661ABABD0E080 v4;
  unint64_t v5;

  LODWORD(v2) = 0;
  -[INFERENCESchemaINFERENCEContactFeatureSet setIsOrganizationNameMatch:](self, "setIsOrganizationNameMatch:", v2);
  v4 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  v5 = (*(_QWORD *)&v4 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFFEFFFFFFFFFFLL;
  *(_DWORD *)&self->_has = v4;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)setIsNicknameMatch:(float)a3
{
  *((_WORD *)&self->_has + 2) = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32) | 0x20000000000) >> 32;
  self->_isNicknameMatch = a3;
}

- (BOOL)hasIsNicknameMatch
{
  return (*((unsigned __int16 *)&self->_has + 2) >> 9) & 1;
}

- (void)setHasIsNicknameMatch:(BOOL)a3
{
  uint64_t v3;
  unint64_t v4;

  v3 = 0x20000000000;
  if (!a3)
    v3 = 0;
  v4 = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFFDFFFFFFFFFFLL | v3;
  *(_DWORD *)&self->_has = self->_has;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)deleteIsNicknameMatch
{
  double v2;
  $84752DCADCC9A46F675661ABABD0E080 v4;
  unint64_t v5;

  LODWORD(v2) = 0;
  -[INFERENCESchemaINFERENCEContactFeatureSet setIsNicknameMatch:](self, "setIsNicknameMatch:", v2);
  v4 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  v5 = (*(_QWORD *)&v4 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFFDFFFFFFFFFFLL;
  *(_DWORD *)&self->_has = v4;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)setIsNamePrefixMatch:(float)a3
{
  *((_WORD *)&self->_has + 2) = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32) | 0x40000000000) >> 32;
  self->_isNamePrefixMatch = a3;
}

- (BOOL)hasIsNamePrefixMatch
{
  return (*((unsigned __int16 *)&self->_has + 2) >> 10) & 1;
}

- (void)setHasIsNamePrefixMatch:(BOOL)a3
{
  uint64_t v3;
  unint64_t v4;

  v3 = 0x40000000000;
  if (!a3)
    v3 = 0;
  v4 = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFFBFFFFFFFFFFLL | v3;
  *(_DWORD *)&self->_has = self->_has;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)deleteIsNamePrefixMatch
{
  double v2;
  $84752DCADCC9A46F675661ABABD0E080 v4;
  unint64_t v5;

  LODWORD(v2) = 0;
  -[INFERENCESchemaINFERENCEContactFeatureSet setIsNamePrefixMatch:](self, "setIsNamePrefixMatch:", v2);
  v4 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  v5 = (*(_QWORD *)&v4 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFFBFFFFFFFFFFLL;
  *(_DWORD *)&self->_has = v4;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)setIsNameSuffixMatch:(float)a3
{
  *((_WORD *)&self->_has + 2) = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32) | 0x80000000000) >> 32;
  self->_isNameSuffixMatch = a3;
}

- (BOOL)hasIsNameSuffixMatch
{
  return (*((unsigned __int16 *)&self->_has + 2) >> 11) & 1;
}

- (void)setHasIsNameSuffixMatch:(BOOL)a3
{
  uint64_t v3;
  unint64_t v4;

  v3 = 0x80000000000;
  if (!a3)
    v3 = 0;
  v4 = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFF7FFFFFFFFFFLL | v3;
  *(_DWORD *)&self->_has = self->_has;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)deleteIsNameSuffixMatch
{
  double v2;
  $84752DCADCC9A46F675661ABABD0E080 v4;
  unint64_t v5;

  LODWORD(v2) = 0;
  -[INFERENCESchemaINFERENCEContactFeatureSet setIsNameSuffixMatch:](self, "setIsNameSuffixMatch:", v2);
  v4 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  v5 = (*(_QWORD *)&v4 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFF7FFFFFFFFFFLL;
  *(_DWORD *)&self->_has = v4;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)setAllHandlesMatched:(float)a3
{
  *((_WORD *)&self->_has + 2) = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32) | 0x100000000000) >> 32;
  self->_allHandlesMatched = a3;
}

- (BOOL)hasAllHandlesMatched
{
  return (*((unsigned __int16 *)&self->_has + 2) >> 12) & 1;
}

- (void)setHasAllHandlesMatched:(BOOL)a3
{
  uint64_t v3;
  unint64_t v4;

  v3 = 0x100000000000;
  if (!a3)
    v3 = 0;
  v4 = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFEFFFFFFFFFFFLL | v3;
  *(_DWORD *)&self->_has = self->_has;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)deleteAllHandlesMatched
{
  double v2;
  $84752DCADCC9A46F675661ABABD0E080 v4;
  unint64_t v5;

  LODWORD(v2) = 0;
  -[INFERENCESchemaINFERENCEContactFeatureSet setAllHandlesMatched:](self, "setAllHandlesMatched:", v2);
  v4 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  v5 = (*(_QWORD *)&v4 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFEFFFFFFFFFFFLL;
  *(_DWORD *)&self->_has = v4;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)setIsRelationAlias:(float)a3
{
  *((_WORD *)&self->_has + 2) = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32) | 0x200000000000) >> 32;
  self->_isRelationAlias = a3;
}

- (BOOL)hasIsRelationAlias
{
  return (*((unsigned __int16 *)&self->_has + 2) >> 13) & 1;
}

- (void)setHasIsRelationAlias:(BOOL)a3
{
  uint64_t v3;
  unint64_t v4;

  v3 = 0x200000000000;
  if (!a3)
    v3 = 0;
  v4 = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFDFFFFFFFFFFFLL | v3;
  *(_DWORD *)&self->_has = self->_has;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)deleteIsRelationAlias
{
  double v2;
  $84752DCADCC9A46F675661ABABD0E080 v4;
  unint64_t v5;

  LODWORD(v2) = 0;
  -[INFERENCESchemaINFERENCEContactFeatureSet setIsRelationAlias:](self, "setIsRelationAlias:", v2);
  v4 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  v5 = (*(_QWORD *)&v4 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFDFFFFFFFFFFFLL;
  *(_DWORD *)&self->_has = v4;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return INFERENCESchemaINFERENCEContactFeatureSetReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  $84752DCADCC9A46F675661ABABD0E080 v4;
  unint64_t v5;
  $84752DCADCC9A46F675661ABABD0E080 v6;
  id v7;

  v7 = a3;
  v4 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  v5 = *(_QWORD *)&v4 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_BYTE *)&v4 & 1) != 0)
  {
    PBDataWriterWriteFloatField();
    v6 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
    v5 = *(_QWORD *)&v6 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
    if ((*(_BYTE *)&v6 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0)
        goto LABEL_4;
      goto LABEL_51;
    }
  }
  else if ((*(_BYTE *)&v4 & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteFloatField();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 4) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0)
      goto LABEL_5;
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteFloatField();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 8) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteFloatField();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x10) == 0)
  {
LABEL_6:
    if ((v5 & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteFloatField();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x20) == 0)
  {
LABEL_7:
    if ((v5 & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteFloatField();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x40) == 0)
  {
LABEL_8:
    if ((v5 & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteFloatField();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x80) == 0)
  {
LABEL_9:
    if ((v5 & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteFloatField();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x100) == 0)
  {
LABEL_10:
    if ((v5 & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteFloatField();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x200) == 0)
  {
LABEL_11:
    if ((v5 & 0x400) == 0)
      goto LABEL_12;
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteFloatField();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x400) == 0)
  {
LABEL_12:
    if ((v5 & 0x800) == 0)
      goto LABEL_13;
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteFloatField();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x800) == 0)
  {
LABEL_13:
    if ((v5 & 0x1000) == 0)
      goto LABEL_14;
    goto LABEL_61;
  }
LABEL_60:
  PBDataWriterWriteFloatField();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x1000) == 0)
  {
LABEL_14:
    if ((v5 & 0x2000) == 0)
      goto LABEL_15;
    goto LABEL_62;
  }
LABEL_61:
  PBDataWriterWriteFloatField();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x2000) == 0)
  {
LABEL_15:
    if ((v5 & 0x4000) == 0)
      goto LABEL_16;
    goto LABEL_63;
  }
LABEL_62:
  PBDataWriterWriteFloatField();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x4000) == 0)
  {
LABEL_16:
    if ((v5 & 0x8000) == 0)
      goto LABEL_17;
    goto LABEL_64;
  }
LABEL_63:
  PBDataWriterWriteFloatField();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x8000) == 0)
  {
LABEL_17:
    if ((v5 & 0x10000) == 0)
      goto LABEL_18;
    goto LABEL_65;
  }
LABEL_64:
  PBDataWriterWriteFloatField();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x10000) == 0)
  {
LABEL_18:
    if ((v5 & 0x20000) == 0)
      goto LABEL_19;
    goto LABEL_66;
  }
LABEL_65:
  PBDataWriterWriteFloatField();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x20000) == 0)
  {
LABEL_19:
    if ((v5 & 0x40000) == 0)
      goto LABEL_20;
    goto LABEL_67;
  }
LABEL_66:
  PBDataWriterWriteFloatField();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x40000) == 0)
  {
LABEL_20:
    if ((v5 & 0x80000) == 0)
      goto LABEL_21;
    goto LABEL_68;
  }
LABEL_67:
  PBDataWriterWriteFloatField();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x80000) == 0)
  {
LABEL_21:
    if ((v5 & 0x100000) == 0)
      goto LABEL_22;
    goto LABEL_69;
  }
LABEL_68:
  PBDataWriterWriteFloatField();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x100000) == 0)
  {
LABEL_22:
    if ((v5 & 0x200000) == 0)
      goto LABEL_23;
    goto LABEL_70;
  }
LABEL_69:
  PBDataWriterWriteFloatField();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x200000) == 0)
  {
LABEL_23:
    if ((v5 & 0x400000) == 0)
      goto LABEL_24;
    goto LABEL_71;
  }
LABEL_70:
  PBDataWriterWriteFloatField();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x400000) == 0)
  {
LABEL_24:
    if ((v5 & 0x800000) == 0)
      goto LABEL_25;
    goto LABEL_72;
  }
LABEL_71:
  PBDataWriterWriteFloatField();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x800000) == 0)
  {
LABEL_25:
    if ((v5 & 0x1000000) == 0)
      goto LABEL_26;
    goto LABEL_73;
  }
LABEL_72:
  PBDataWriterWriteFloatField();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x1000000) == 0)
  {
LABEL_26:
    if ((v5 & 0x2000000) == 0)
      goto LABEL_27;
    goto LABEL_74;
  }
LABEL_73:
  PBDataWriterWriteFloatField();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x2000000) == 0)
  {
LABEL_27:
    if ((v5 & 0x4000000) == 0)
      goto LABEL_28;
    goto LABEL_75;
  }
LABEL_74:
  PBDataWriterWriteFloatField();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x4000000) == 0)
  {
LABEL_28:
    if ((v5 & 0x8000000) == 0)
      goto LABEL_29;
    goto LABEL_76;
  }
LABEL_75:
  PBDataWriterWriteFloatField();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x8000000) == 0)
  {
LABEL_29:
    if ((v5 & 0x10000000) == 0)
      goto LABEL_30;
    goto LABEL_77;
  }
LABEL_76:
  PBDataWriterWriteFloatField();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x10000000) == 0)
  {
LABEL_30:
    if ((v5 & 0x20000000) == 0)
      goto LABEL_31;
    goto LABEL_78;
  }
LABEL_77:
  PBDataWriterWriteFloatField();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x20000000) == 0)
  {
LABEL_31:
    if ((v5 & 0x40000000) == 0)
      goto LABEL_32;
    goto LABEL_79;
  }
LABEL_78:
  PBDataWriterWriteFloatField();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x40000000) == 0)
  {
LABEL_32:
    if ((v5 & 0x80000000) == 0)
      goto LABEL_33;
    goto LABEL_80;
  }
LABEL_79:
  PBDataWriterWriteFloatField();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x80000000) == 0)
  {
LABEL_33:
    if ((v5 & 0x100000000) == 0)
      goto LABEL_34;
    goto LABEL_81;
  }
LABEL_80:
  PBDataWriterWriteFloatField();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x100000000) == 0)
  {
LABEL_34:
    if ((v5 & 0x200000000) == 0)
      goto LABEL_35;
    goto LABEL_82;
  }
LABEL_81:
  PBDataWriterWriteFloatField();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x200000000) == 0)
  {
LABEL_35:
    if ((v5 & 0x400000000) == 0)
      goto LABEL_36;
    goto LABEL_83;
  }
LABEL_82:
  PBDataWriterWriteFloatField();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x400000000) == 0)
  {
LABEL_36:
    if ((v5 & 0x800000000) == 0)
      goto LABEL_37;
    goto LABEL_84;
  }
LABEL_83:
  PBDataWriterWriteFloatField();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x800000000) == 0)
  {
LABEL_37:
    if ((v5 & 0x1000000000) == 0)
      goto LABEL_38;
    goto LABEL_85;
  }
LABEL_84:
  PBDataWriterWriteFloatField();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x1000000000) == 0)
  {
LABEL_38:
    if ((v5 & 0x2000000000) == 0)
      goto LABEL_39;
    goto LABEL_86;
  }
LABEL_85:
  PBDataWriterWriteFloatField();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x2000000000) == 0)
  {
LABEL_39:
    if ((v5 & 0x4000000000) == 0)
      goto LABEL_40;
    goto LABEL_87;
  }
LABEL_86:
  PBDataWriterWriteFloatField();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x4000000000) == 0)
  {
LABEL_40:
    if ((v5 & 0x8000000000) == 0)
      goto LABEL_41;
    goto LABEL_88;
  }
LABEL_87:
  PBDataWriterWriteFloatField();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x8000000000) == 0)
  {
LABEL_41:
    if ((v5 & 0x10000000000) == 0)
      goto LABEL_42;
    goto LABEL_89;
  }
LABEL_88:
  PBDataWriterWriteFloatField();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x10000000000) == 0)
  {
LABEL_42:
    if ((v5 & 0x20000000000) == 0)
      goto LABEL_43;
    goto LABEL_90;
  }
LABEL_89:
  PBDataWriterWriteFloatField();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x20000000000) == 0)
  {
LABEL_43:
    if ((v5 & 0x40000000000) == 0)
      goto LABEL_44;
    goto LABEL_91;
  }
LABEL_90:
  PBDataWriterWriteFloatField();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x40000000000) == 0)
  {
LABEL_44:
    if ((v5 & 0x80000000000) == 0)
      goto LABEL_45;
    goto LABEL_92;
  }
LABEL_91:
  PBDataWriterWriteFloatField();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x80000000000) == 0)
  {
LABEL_45:
    if ((v5 & 0x100000000000) == 0)
      goto LABEL_46;
LABEL_93:
    PBDataWriterWriteFloatField();
    if (((*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0x200000000000) == 0)
      goto LABEL_48;
    goto LABEL_47;
  }
LABEL_92:
  PBDataWriterWriteFloatField();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x100000000000) != 0)
    goto LABEL_93;
LABEL_46:
  if ((v5 & 0x200000000000) != 0)
LABEL_47:
    PBDataWriterWriteFloatField();
LABEL_48:

}

- (BOOL)isEqual:(id)a3
{
  unsigned int *v4;
  $84752DCADCC9A46F675661ABABD0E080 v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  float isRecent;
  float v10;
  unsigned int v11;
  float isRecentInSameDomain;
  float v13;
  unsigned int v14;
  float isRecentInSiriRequest;
  float v16;
  unsigned int v17;
  float isRecentlyCorrected;
  float v19;
  unsigned int v20;
  float recencyRank;
  float v22;
  unsigned int v23;
  float recencyRankInSameDomain;
  float v25;
  unsigned int v26;
  float recencyRankInSiriRequest;
  float v28;
  unsigned int v29;
  float isHighQualityRequestMatch;
  float v31;
  unsigned int v32;
  float isFavorite;
  float v34;
  unsigned int v35;
  float isMeCardRelation;
  float v37;
  unsigned int v38;
  float isWeakOrganizationMatch;
  float v40;
  unsigned int v41;
  float speechAlternativeRanksGivenNameRank;
  float v43;
  unsigned int v44;
  float speechAlternativeRanksMiddleNameRank;
  float v46;
  unsigned int v47;
  float speechAlternativeRanksFamilyNameRank;
  float v49;
  unsigned int v50;
  float freqAnyGroup0MinTo2Min;
  float v52;
  unsigned int v53;
  float freqAnyGroup2MinTo10Min;
  float v55;
  unsigned int v56;
  float freqAnyGroup10MinTo1Hr;
  float v58;
  unsigned int v59;
  float freqAnyGroup1HrTo6Hr;
  float v61;
  unsigned int v62;
  float freqAnyGroup6HrTo1Day;
  float v64;
  unsigned int v65;
  float freqAnyGroup1DayTo7Day;
  float v67;
  unsigned int v68;
  float freqAnyGroup7DayTo28Day;
  float v70;
  unsigned int v71;
  float freqAnyGroup28DayToInf;
  float v73;
  unsigned int v74;
  float freqSameGroup0MinTo2Min;
  float v76;
  unsigned int v77;
  float freqSameGroup2MinTo10Min;
  float v79;
  unsigned int v80;
  float freqSameGroup10MinTo1Hr;
  float v82;
  unsigned int v83;
  float freqSameGroup1HrTo6Hr;
  float v85;
  unsigned int v86;
  float freqSameGroup6HrTo1Day;
  float v88;
  unsigned int v89;
  float freqSameGroup1DayTo7Day;
  float v91;
  unsigned int v92;
  float freqSameGroup7DayTo28Day;
  float v94;
  unsigned int v95;
  float freqSameGroup28DayToInf;
  float v97;
  unsigned int v98;
  float isSuggested;
  float v100;
  unsigned int v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  unsigned int v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  float isHypocorism;
  float v126;
  unsigned int v127;
  int v128;
  float hasSuggestedProperties;
  float v130;
  unsigned int v131;
  unsigned int v132;
  float isPartialNameMatch;
  float v134;
  unsigned int v135;
  unsigned int v136;
  float numPrimaryTokens;
  float v138;
  unsigned int v139;
  unsigned int v140;
  float allQueryMatched;
  float v142;
  unsigned int v143;
  unsigned int v144;
  float allPrimaryNameTokensAreInQuery;
  float v146;
  unsigned int v147;
  unsigned int v148;
  float isGivenNameMatch;
  float v150;
  unsigned int v151;
  unsigned int v152;
  float isMiddleNameMatch;
  float v154;
  unsigned int v155;
  unsigned int v156;
  float isFamilyNameMatch;
  float v158;
  unsigned int v159;
  unsigned int v160;
  float isOrganizationNameMatch;
  float v162;
  unsigned int v163;
  unsigned int v164;
  float isNicknameMatch;
  float v166;
  unsigned int v167;
  unsigned int v168;
  float isNamePrefixMatch;
  float v170;
  unsigned int v171;
  unsigned int v172;
  float isNameSuffixMatch;
  float v174;
  unsigned int v175;
  unsigned int v176;
  float allHandlesMatched;
  float v178;
  int v179;
  float isRelationAlias;
  float v181;
  BOOL v182;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;

  v4 = (unsigned int *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_187;
  v5 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  v6 = v4[48];
  if ((*(_DWORD *)&self->_has & 1) != (v4[48] & 1))
    goto LABEL_187;
  if ((*(_BYTE *)&v5 & 1) != 0)
  {
    isRecent = self->_isRecent;
    objc_msgSend(v4, "isRecent");
    if (isRecent != v10)
      goto LABEL_187;
    v5 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
    v7 = *(_QWORD *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
    v8 = v4[48] | ((unint64_t)*((unsigned __int16 *)v4 + 98) << 32);
    LODWORD(v6) = v4[48];
  }
  else
  {
    v7 = *(_QWORD *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
    v8 = v6 | ((unint64_t)*((unsigned __int16 *)v4 + 98) << 32);
  }
  v11 = (*(_DWORD *)&v5 >> 1) & 1;
  if (v11 == ((v6 >> 1) & 1))
  {
    if (v11)
    {
      isRecentInSameDomain = self->_isRecentInSameDomain;
      objc_msgSend(v4, "isRecentInSameDomain");
      if (isRecentInSameDomain != v13)
        goto LABEL_187;
      v5 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
      v7 = *(_QWORD *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
      v8 = v4[48] | ((unint64_t)*((unsigned __int16 *)v4 + 98) << 32);
      LODWORD(v6) = v4[48];
    }
    v14 = (*(_DWORD *)&v5 >> 2) & 1;
    if (v14 == ((v6 >> 2) & 1))
    {
      if (v14)
      {
        isRecentInSiriRequest = self->_isRecentInSiriRequest;
        objc_msgSend(v4, "isRecentInSiriRequest");
        if (isRecentInSiriRequest != v16)
          goto LABEL_187;
        v5 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
        v7 = *(_QWORD *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
        v8 = v4[48] | ((unint64_t)*((unsigned __int16 *)v4 + 98) << 32);
        LODWORD(v6) = v4[48];
      }
      v17 = (*(_DWORD *)&v5 >> 3) & 1;
      if (v17 == ((v6 >> 3) & 1))
      {
        if (v17)
        {
          isRecentlyCorrected = self->_isRecentlyCorrected;
          objc_msgSend(v4, "isRecentlyCorrected");
          if (isRecentlyCorrected != v19)
            goto LABEL_187;
          v5 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
          v7 = *(_QWORD *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
          v8 = v4[48] | ((unint64_t)*((unsigned __int16 *)v4 + 98) << 32);
          LODWORD(v6) = v4[48];
        }
        v20 = (*(_DWORD *)&v5 >> 4) & 1;
        if (v20 == ((v6 >> 4) & 1))
        {
          if (v20)
          {
            recencyRank = self->_recencyRank;
            objc_msgSend(v4, "recencyRank");
            if (recencyRank != v22)
              goto LABEL_187;
            v5 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
            v7 = *(_QWORD *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
            v8 = v4[48] | ((unint64_t)*((unsigned __int16 *)v4 + 98) << 32);
            LODWORD(v6) = v4[48];
          }
          v23 = (*(_DWORD *)&v5 >> 5) & 1;
          if (v23 == ((v6 >> 5) & 1))
          {
            if (v23)
            {
              recencyRankInSameDomain = self->_recencyRankInSameDomain;
              objc_msgSend(v4, "recencyRankInSameDomain");
              if (recencyRankInSameDomain != v25)
                goto LABEL_187;
              v5 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
              v7 = *(_QWORD *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
              v8 = v4[48] | ((unint64_t)*((unsigned __int16 *)v4 + 98) << 32);
              LODWORD(v6) = v4[48];
            }
            v26 = (*(_DWORD *)&v5 >> 6) & 1;
            if (v26 == ((v6 >> 6) & 1))
            {
              if (v26)
              {
                recencyRankInSiriRequest = self->_recencyRankInSiriRequest;
                objc_msgSend(v4, "recencyRankInSiriRequest");
                if (recencyRankInSiriRequest != v28)
                  goto LABEL_187;
                v5 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
                v7 = *(_QWORD *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
                v8 = v4[48] | ((unint64_t)*((unsigned __int16 *)v4 + 98) << 32);
                LODWORD(v6) = v4[48];
              }
              v29 = (*(_DWORD *)&v5 >> 7) & 1;
              if (v29 == ((v6 >> 7) & 1))
              {
                if (v29)
                {
                  isHighQualityRequestMatch = self->_isHighQualityRequestMatch;
                  objc_msgSend(v4, "isHighQualityRequestMatch");
                  if (isHighQualityRequestMatch != v31)
                    goto LABEL_187;
                  v5 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
                  v7 = *(_QWORD *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
                  v8 = v4[48] | ((unint64_t)*((unsigned __int16 *)v4 + 98) << 32);
                  LODWORD(v6) = v4[48];
                }
                v32 = (*(_DWORD *)&v5 >> 8) & 1;
                if (v32 == ((v6 >> 8) & 1))
                {
                  if (v32)
                  {
                    isFavorite = self->_isFavorite;
                    objc_msgSend(v4, "isFavorite");
                    if (isFavorite != v34)
                      goto LABEL_187;
                    v5 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
                    v7 = *(_QWORD *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
                    v8 = v4[48] | ((unint64_t)*((unsigned __int16 *)v4 + 98) << 32);
                    LODWORD(v6) = v4[48];
                  }
                  v35 = (*(_DWORD *)&v5 >> 9) & 1;
                  if (v35 == ((v6 >> 9) & 1))
                  {
                    if (v35)
                    {
                      isMeCardRelation = self->_isMeCardRelation;
                      objc_msgSend(v4, "isMeCardRelation");
                      if (isMeCardRelation != v37)
                        goto LABEL_187;
                      v5 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
                      v7 = *(_QWORD *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
                      v8 = v4[48] | ((unint64_t)*((unsigned __int16 *)v4 + 98) << 32);
                      LODWORD(v6) = v4[48];
                    }
                    v38 = (*(_DWORD *)&v5 >> 10) & 1;
                    if (v38 == ((v6 >> 10) & 1))
                    {
                      if (v38)
                      {
                        isWeakOrganizationMatch = self->_isWeakOrganizationMatch;
                        objc_msgSend(v4, "isWeakOrganizationMatch");
                        if (isWeakOrganizationMatch != v40)
                          goto LABEL_187;
                        v5 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
                        v7 = *(_QWORD *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
                        v8 = v4[48] | ((unint64_t)*((unsigned __int16 *)v4 + 98) << 32);
                        LODWORD(v6) = v4[48];
                      }
                      v41 = (*(_DWORD *)&v5 >> 11) & 1;
                      if (v41 == ((v6 >> 11) & 1))
                      {
                        if (v41)
                        {
                          speechAlternativeRanksGivenNameRank = self->_speechAlternativeRanksGivenNameRank;
                          objc_msgSend(v4, "speechAlternativeRanksGivenNameRank");
                          if (speechAlternativeRanksGivenNameRank != v43)
                            goto LABEL_187;
                          v5 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
                          v7 = *(_QWORD *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
                          v8 = v4[48] | ((unint64_t)*((unsigned __int16 *)v4 + 98) << 32);
                          LODWORD(v6) = v4[48];
                        }
                        v44 = (*(_DWORD *)&v5 >> 12) & 1;
                        if (v44 == ((v6 >> 12) & 1))
                        {
                          if (v44)
                          {
                            speechAlternativeRanksMiddleNameRank = self->_speechAlternativeRanksMiddleNameRank;
                            objc_msgSend(v4, "speechAlternativeRanksMiddleNameRank");
                            if (speechAlternativeRanksMiddleNameRank != v46)
                              goto LABEL_187;
                            v5 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
                            v7 = *(_QWORD *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
                            v8 = v4[48] | ((unint64_t)*((unsigned __int16 *)v4 + 98) << 32);
                            LODWORD(v6) = v4[48];
                          }
                          v47 = (*(_DWORD *)&v5 >> 13) & 1;
                          if (v47 == ((v6 >> 13) & 1))
                          {
                            if (v47)
                            {
                              speechAlternativeRanksFamilyNameRank = self->_speechAlternativeRanksFamilyNameRank;
                              objc_msgSend(v4, "speechAlternativeRanksFamilyNameRank");
                              if (speechAlternativeRanksFamilyNameRank != v49)
                                goto LABEL_187;
                              v5 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
                              v7 = *(_QWORD *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
                              v8 = v4[48] | ((unint64_t)*((unsigned __int16 *)v4 + 98) << 32);
                              LODWORD(v6) = v4[48];
                            }
                            v50 = (*(_DWORD *)&v5 >> 14) & 1;
                            if (v50 == ((v6 >> 14) & 1))
                            {
                              if (v50)
                              {
                                freqAnyGroup0MinTo2Min = self->_freqAnyGroup0MinTo2Min;
                                objc_msgSend(v4, "freqAnyGroup0MinTo2Min");
                                if (freqAnyGroup0MinTo2Min != v52)
                                  goto LABEL_187;
                                v5 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
                                v7 = *(_QWORD *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
                                v8 = v4[48] | ((unint64_t)*((unsigned __int16 *)v4 + 98) << 32);
                                LODWORD(v6) = v4[48];
                              }
                              v53 = (*(_DWORD *)&v5 >> 15) & 1;
                              if (v53 == ((v6 >> 15) & 1))
                              {
                                if (v53)
                                {
                                  freqAnyGroup2MinTo10Min = self->_freqAnyGroup2MinTo10Min;
                                  objc_msgSend(v4, "freqAnyGroup2MinTo10Min");
                                  if (freqAnyGroup2MinTo10Min != v55)
                                    goto LABEL_187;
                                  v5 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
                                  v7 = *(_QWORD *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
                                  v8 = v4[48] | ((unint64_t)*((unsigned __int16 *)v4 + 98) << 32);
                                  LODWORD(v6) = v4[48];
                                }
                                v56 = HIWORD(*(_DWORD *)&v5) & 1;
                                if (v56 == (WORD1(v6) & 1))
                                {
                                  if (v56)
                                  {
                                    freqAnyGroup10MinTo1Hr = self->_freqAnyGroup10MinTo1Hr;
                                    objc_msgSend(v4, "freqAnyGroup10MinTo1Hr");
                                    if (freqAnyGroup10MinTo1Hr != v58)
                                      goto LABEL_187;
                                    v5 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
                                    v7 = *(_QWORD *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
                                    v8 = v4[48] | ((unint64_t)*((unsigned __int16 *)v4 + 98) << 32);
                                    LODWORD(v6) = v4[48];
                                  }
                                  v59 = (*(_DWORD *)&v5 >> 17) & 1;
                                  if (v59 == ((v6 >> 17) & 1))
                                  {
                                    if (v59)
                                    {
                                      freqAnyGroup1HrTo6Hr = self->_freqAnyGroup1HrTo6Hr;
                                      objc_msgSend(v4, "freqAnyGroup1HrTo6Hr");
                                      if (freqAnyGroup1HrTo6Hr != v61)
                                        goto LABEL_187;
                                      v5 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
                                      v7 = *(_QWORD *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
                                      v8 = v4[48] | ((unint64_t)*((unsigned __int16 *)v4 + 98) << 32);
                                      LODWORD(v6) = v4[48];
                                    }
                                    v62 = (*(_DWORD *)&v5 >> 18) & 1;
                                    if (v62 == ((v6 >> 18) & 1))
                                    {
                                      if (v62)
                                      {
                                        freqAnyGroup6HrTo1Day = self->_freqAnyGroup6HrTo1Day;
                                        objc_msgSend(v4, "freqAnyGroup6HrTo1Day");
                                        if (freqAnyGroup6HrTo1Day != v64)
                                          goto LABEL_187;
                                        v5 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
                                        v7 = *(_QWORD *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
                                        v8 = v4[48] | ((unint64_t)*((unsigned __int16 *)v4 + 98) << 32);
                                        LODWORD(v6) = v4[48];
                                      }
                                      v65 = (*(_DWORD *)&v5 >> 19) & 1;
                                      if (v65 == ((v6 >> 19) & 1))
                                      {
                                        if (v65)
                                        {
                                          freqAnyGroup1DayTo7Day = self->_freqAnyGroup1DayTo7Day;
                                          objc_msgSend(v4, "freqAnyGroup1DayTo7Day");
                                          if (freqAnyGroup1DayTo7Day != v67)
                                            goto LABEL_187;
                                          v5 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
                                          v7 = *(_QWORD *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
                                          v8 = v4[48] | ((unint64_t)*((unsigned __int16 *)v4 + 98) << 32);
                                          LODWORD(v6) = v4[48];
                                        }
                                        v68 = (*(_DWORD *)&v5 >> 20) & 1;
                                        if (v68 == ((v6 >> 20) & 1))
                                        {
                                          if (v68)
                                          {
                                            freqAnyGroup7DayTo28Day = self->_freqAnyGroup7DayTo28Day;
                                            objc_msgSend(v4, "freqAnyGroup7DayTo28Day");
                                            if (freqAnyGroup7DayTo28Day != v70)
                                              goto LABEL_187;
                                            v5 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
                                            v7 = *(_QWORD *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has
                                                                                     + 2) << 32);
                                            v8 = v4[48] | ((unint64_t)*((unsigned __int16 *)v4 + 98) << 32);
                                            LODWORD(v6) = v4[48];
                                          }
                                          v71 = (*(_DWORD *)&v5 >> 21) & 1;
                                          if (v71 == ((v6 >> 21) & 1))
                                          {
                                            if (v71)
                                            {
                                              freqAnyGroup28DayToInf = self->_freqAnyGroup28DayToInf;
                                              objc_msgSend(v4, "freqAnyGroup28DayToInf");
                                              if (freqAnyGroup28DayToInf != v73)
                                                goto LABEL_187;
                                              v5 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
                                              v7 = *(_QWORD *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has
                                                                                       + 2) << 32);
                                              v8 = v4[48] | ((unint64_t)*((unsigned __int16 *)v4 + 98) << 32);
                                              LODWORD(v6) = v4[48];
                                            }
                                            v74 = (*(_DWORD *)&v5 >> 22) & 1;
                                            if (v74 == ((v6 >> 22) & 1))
                                            {
                                              if (v74)
                                              {
                                                freqSameGroup0MinTo2Min = self->_freqSameGroup0MinTo2Min;
                                                objc_msgSend(v4, "freqSameGroup0MinTo2Min");
                                                if (freqSameGroup0MinTo2Min != v76)
                                                  goto LABEL_187;
                                                v5 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
                                                v7 = *(_QWORD *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has
                                                                                         + 2) << 32);
                                                v8 = v4[48] | ((unint64_t)*((unsigned __int16 *)v4 + 98) << 32);
                                                LODWORD(v6) = v4[48];
                                              }
                                              v77 = (*(_DWORD *)&v5 >> 23) & 1;
                                              if (v77 == ((v6 >> 23) & 1))
                                              {
                                                if (v77)
                                                {
                                                  freqSameGroup2MinTo10Min = self->_freqSameGroup2MinTo10Min;
                                                  objc_msgSend(v4, "freqSameGroup2MinTo10Min");
                                                  if (freqSameGroup2MinTo10Min != v79)
                                                    goto LABEL_187;
                                                  v5 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
                                                  v7 = *(_QWORD *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has
                                                                                           + 2) << 32);
                                                  v8 = v4[48] | ((unint64_t)*((unsigned __int16 *)v4 + 98) << 32);
                                                  LODWORD(v6) = v4[48];
                                                }
                                                v80 = HIBYTE(*(_DWORD *)&v5) & 1;
                                                if (v80 == (BYTE3(v6) & 1))
                                                {
                                                  if (v80)
                                                  {
                                                    freqSameGroup10MinTo1Hr = self->_freqSameGroup10MinTo1Hr;
                                                    objc_msgSend(v4, "freqSameGroup10MinTo1Hr");
                                                    if (freqSameGroup10MinTo1Hr != v82)
                                                      goto LABEL_187;
                                                    v5 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
                                                    v7 = *(_QWORD *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has
                                                                                             + 2) << 32);
                                                    v8 = v4[48] | ((unint64_t)*((unsigned __int16 *)v4 + 98) << 32);
                                                    LODWORD(v6) = v4[48];
                                                  }
                                                  v83 = (*(_DWORD *)&v5 >> 25) & 1;
                                                  if (v83 == ((v6 >> 25) & 1))
                                                  {
                                                    if (v83)
                                                    {
                                                      freqSameGroup1HrTo6Hr = self->_freqSameGroup1HrTo6Hr;
                                                      objc_msgSend(v4, "freqSameGroup1HrTo6Hr");
                                                      if (freqSameGroup1HrTo6Hr != v85)
                                                        goto LABEL_187;
                                                      v5 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
                                                      v7 = *(_QWORD *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has
                                                                                               + 2) << 32);
                                                      v8 = v4[48] | ((unint64_t)*((unsigned __int16 *)v4 + 98) << 32);
                                                      LODWORD(v6) = v4[48];
                                                    }
                                                    v86 = (*(_DWORD *)&v5 >> 26) & 1;
                                                    if (v86 == ((v6 >> 26) & 1))
                                                    {
                                                      if (v86)
                                                      {
                                                        freqSameGroup6HrTo1Day = self->_freqSameGroup6HrTo1Day;
                                                        objc_msgSend(v4, "freqSameGroup6HrTo1Day");
                                                        if (freqSameGroup6HrTo1Day != v88)
                                                          goto LABEL_187;
                                                        v5 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
                                                        v7 = *(_QWORD *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has
                                                                                                 + 2) << 32);
                                                        v8 = v4[48] | ((unint64_t)*((unsigned __int16 *)v4 + 98) << 32);
                                                        LODWORD(v6) = v4[48];
                                                      }
                                                      v89 = (*(_DWORD *)&v5 >> 27) & 1;
                                                      if (v89 == ((v6 >> 27) & 1))
                                                      {
                                                        if (v89)
                                                        {
                                                          freqSameGroup1DayTo7Day = self->_freqSameGroup1DayTo7Day;
                                                          objc_msgSend(v4, "freqSameGroup1DayTo7Day");
                                                          if (freqSameGroup1DayTo7Day != v91)
                                                            goto LABEL_187;
                                                          v5 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
                                                          v7 = *(_QWORD *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
                                                          v8 = v4[48] | ((unint64_t)*((unsigned __int16 *)v4 + 98) << 32);
                                                          LODWORD(v6) = v4[48];
                                                        }
                                                        v92 = (*(_DWORD *)&v5 >> 28) & 1;
                                                        if (v92 == ((v6 >> 28) & 1))
                                                        {
                                                          if (v92)
                                                          {
                                                            freqSameGroup7DayTo28Day = self->_freqSameGroup7DayTo28Day;
                                                            objc_msgSend(v4, "freqSameGroup7DayTo28Day");
                                                            if (freqSameGroup7DayTo28Day != v94)
                                                              goto LABEL_187;
                                                            v5 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
                                                            v7 = *(_QWORD *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
                                                            v8 = v4[48] | ((unint64_t)*((unsigned __int16 *)v4
                                                                                             + 98) << 32);
                                                            LODWORD(v6) = v4[48];
                                                          }
                                                          v95 = (*(_DWORD *)&v5 >> 29) & 1;
                                                          if (v95 == ((v6 >> 29) & 1))
                                                          {
                                                            if (v95)
                                                            {
                                                              freqSameGroup28DayToInf = self->_freqSameGroup28DayToInf;
                                                              objc_msgSend(v4, "freqSameGroup28DayToInf");
                                                              if (freqSameGroup28DayToInf != v97)
                                                                goto LABEL_187;
                                                              v5 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
                                                              v7 = *(_QWORD *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
                                                              v8 = v4[48] | ((unint64_t)*((unsigned __int16 *)v4
                                                                                               + 98) << 32);
                                                              LODWORD(v6) = v4[48];
                                                            }
                                                            v98 = (*(_DWORD *)&v5 >> 30) & 1;
                                                            if (v98 == ((v6 >> 30) & 1))
                                                            {
                                                              if (v98)
                                                              {
                                                                isSuggested = self->_isSuggested;
                                                                objc_msgSend(v4, "isSuggested");
                                                                if (isSuggested != v100)
                                                                  goto LABEL_187;
                                                                v7 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
                                                                v8 = v4[48] | ((unint64_t)*((unsigned __int16 *)v4
                                                                                                 + 98) << 32);
                                                              }
                                                              if (((v8 ^ v7) & 0x80000000) == 0)
                                                              {
                                                                if ((v7 & 0x80000000) != 0)
                                                                {
                                                                  isHypocorism = self->_isHypocorism;
                                                                  objc_msgSend(v4, "isHypocorism");
                                                                  if (isHypocorism != v126)
                                                                    goto LABEL_187;
                                                                  v101 = *((unsigned __int16 *)v4 + 98);
                                                                  LODWORD(v102) = v101 >> 1;
                                                                  LODWORD(v103) = v101 >> 2;
                                                                  LODWORD(v104) = v101 >> 3;
                                                                  v105 = v101 >> 4;
                                                                  v106 = v101 >> 5;
                                                                  LODWORD(v107) = v101 >> 6;
                                                                  LODWORD(v108) = v101 >> 7;
                                                                  v109 = v101 >> 8;
                                                                  LODWORD(v110) = v101 >> 9;
                                                                  LODWORD(v111) = v101 >> 10;
                                                                  v127 = *((unsigned __int16 *)&self->_has + 2);
                                                                  LODWORD(v112) = v127 >> 1;
                                                                  LODWORD(v113) = v127 >> 2;
                                                                  LODWORD(v184) = v101 >> 11;
                                                                  LODWORD(v185) = v101 >> 12;
                                                                  LODWORD(v114) = v127 >> 3;
                                                                  LODWORD(v186) = v101 >> 13;
                                                                  LODWORD(v115) = v127 >> 4;
                                                                  LODWORD(v116) = v127 >> 5;
                                                                  v117 = v127 >> 6;
                                                                  v118 = v127 >> 7;
                                                                  v119 = v127 >> 8;
                                                                  v120 = v127 >> 9;
                                                                  LODWORD(v121) = v127 >> 10;
                                                                  LODWORD(v122) = v127 >> 11;
                                                                  LODWORD(v123) = v127 >> 12;
                                                                  LOWORD(v8) = *((_WORD *)&self->_has + 2);
                                                                  LODWORD(v124) = v127 >> 13;
                                                                }
                                                                else
                                                                {
                                                                  LOBYTE(v101) = BYTE4(v8);
                                                                  v102 = (v8 >> 33) & 0x7FFF;
                                                                  v103 = (v8 >> 34) & 0x3FFF;
                                                                  v104 = (v8 >> 35) & 0x1FFF;
                                                                  v105 = (v8 >> 36) & 0xFFF;
                                                                  v106 = (v8 >> 37) & 0x7FF;
                                                                  v107 = (v8 >> 38) & 0x3FF;
                                                                  v108 = (v8 >> 39) & 0x1FF;
                                                                  LOBYTE(v109) = BYTE5(v8);
                                                                  v110 = (v8 >> 41) & 0x7F;
                                                                  v111 = (v8 >> 42) & 0x3F;
                                                                  v184 = (v8 >> 43) & 0x1F;
                                                                  v185 = (v8 >> 44) & 0xF;
                                                                  v186 = (v8 >> 45) & 7;
                                                                  LOBYTE(v8) = BYTE4(v7);
                                                                  v112 = (v7 >> 33) & 0x7FFF;
                                                                  v113 = (v7 >> 34) & 0x3FFF;
                                                                  v114 = (v7 >> 35) & 0x1FFF;
                                                                  v115 = (v7 >> 36) & 0xFFF;
                                                                  v116 = (v7 >> 37) & 0x7FF;
                                                                  v117 = (v7 >> 38) & 0x3FF;
                                                                  v118 = (v7 >> 39) & 0x1FF;
                                                                  v119 = BYTE5(v7);
                                                                  v120 = (v7 >> 41) & 0x7F;
                                                                  v121 = (v7 >> 42) & 0x3F;
                                                                  v122 = (v7 >> 43) & 0x1F;
                                                                  v123 = (v7 >> 44) & 0xF;
                                                                  v124 = (v7 >> 45) & 7;
                                                                }
                                                                v128 = v8 & 1;
                                                                if (v128 == (v101 & 1))
                                                                {
                                                                  if (v128)
                                                                  {
                                                                    hasSuggestedProperties = self->_hasSuggestedProperties;
                                                                    objc_msgSend(v4, "hasSuggestedProperties", v120, v119, v106, v118, v105, v117);
                                                                    if (hasSuggestedProperties != v130)
                                                                      goto LABEL_187;
                                                                    v131 = *((unsigned __int16 *)v4 + 98);
                                                                    LODWORD(v102) = v131 >> 1;
                                                                    LODWORD(v103) = v131 >> 2;
                                                                    LODWORD(v104) = v131 >> 3;
                                                                    v105 = v131 >> 4;
                                                                    v106 = v131 >> 5;
                                                                    LODWORD(v107) = v131 >> 6;
                                                                    LODWORD(v108) = v131 >> 7;
                                                                    v109 = v131 >> 8;
                                                                    LODWORD(v110) = v131 >> 9;
                                                                    LODWORD(v111) = v131 >> 10;
                                                                    v132 = *((unsigned __int16 *)&self->_has + 2);
                                                                    LODWORD(v112) = v132 >> 1;
                                                                    LODWORD(v184) = v131 >> 11;
                                                                    LODWORD(v185) = v131 >> 12;
                                                                    LODWORD(v113) = v132 >> 2;
                                                                    LODWORD(v186) = v131 >> 13;
                                                                    LODWORD(v114) = v132 >> 3;
                                                                    LODWORD(v115) = v132 >> 4;
                                                                    LODWORD(v116) = v132 >> 5;
                                                                    v117 = v132 >> 6;
                                                                    v118 = v132 >> 7;
                                                                    v119 = v132 >> 8;
                                                                    v120 = v132 >> 9;
                                                                    LODWORD(v121) = v132 >> 10;
                                                                    LODWORD(v122) = v132 >> 11;
                                                                    LODWORD(v123) = v132 >> 12;
                                                                    LODWORD(v124) = v132 >> 13;
                                                                  }
                                                                  if ((v112 & 1) == (v102 & 1))
                                                                  {
                                                                    if ((v112 & 1) != 0)
                                                                    {
                                                                      isPartialNameMatch = self->_isPartialNameMatch;
                                                                      objc_msgSend(v4, "isPartialNameMatch", v120, v119, v106, v118, v105, v117);
                                                                      if (isPartialNameMatch != v134)
                                                                        goto LABEL_187;
                                                                      v135 = *((unsigned __int16 *)v4 + 98);
                                                                      LODWORD(v103) = v135 >> 2;
                                                                      LODWORD(v104) = v135 >> 3;
                                                                      v105 = v135 >> 4;
                                                                      v106 = v135 >> 5;
                                                                      LODWORD(v107) = v135 >> 6;
                                                                      LODWORD(v108) = v135 >> 7;
                                                                      v109 = v135 >> 8;
                                                                      LODWORD(v110) = v135 >> 9;
                                                                      LODWORD(v111) = v135 >> 10;
                                                                      v136 = *((unsigned __int16 *)&self->_has + 2);
                                                                      LODWORD(v113) = v136 >> 2;
                                                                      LODWORD(v114) = v136 >> 3;
                                                                      LODWORD(v184) = v135 >> 11;
                                                                      LODWORD(v185) = v135 >> 12;
                                                                      LODWORD(v186) = v135 >> 13;
                                                                      LODWORD(v115) = v136 >> 4;
                                                                      LODWORD(v116) = v136 >> 5;
                                                                      v117 = v136 >> 6;
                                                                      v118 = v136 >> 7;
                                                                      v119 = v136 >> 8;
                                                                      v120 = v136 >> 9;
                                                                      LODWORD(v121) = v136 >> 10;
                                                                      LODWORD(v122) = v136 >> 11;
                                                                      LODWORD(v123) = v136 >> 12;
                                                                      LODWORD(v124) = v136 >> 13;
                                                                    }
                                                                    if ((v113 & 1) == (v103 & 1))
                                                                    {
                                                                      if ((v113 & 1) != 0)
                                                                      {
                                                                        numPrimaryTokens = self->_numPrimaryTokens;
                                                                        objc_msgSend(v4, "numPrimaryTokens", v120, v119, v106, v118, v105, v117);
                                                                        if (numPrimaryTokens != v138)
                                                                          goto LABEL_187;
                                                                        v139 = *((unsigned __int16 *)v4 + 98);
                                                                        LODWORD(v104) = v139 >> 3;
                                                                        v105 = v139 >> 4;
                                                                        v106 = v139 >> 5;
                                                                        LODWORD(v107) = v139 >> 6;
                                                                        LODWORD(v108) = v139 >> 7;
                                                                        v109 = v139 >> 8;
                                                                        LODWORD(v110) = v139 >> 9;
                                                                        LODWORD(v111) = v139 >> 10;
                                                                        v140 = *((unsigned __int16 *)&self->_has + 2);
                                                                        LODWORD(v114) = v140 >> 3;
                                                                        LODWORD(v115) = v140 >> 4;
                                                                        LODWORD(v116) = v140 >> 5;
                                                                        LODWORD(v184) = v139 >> 11;
                                                                        LODWORD(v185) = v139 >> 12;
                                                                        LODWORD(v186) = v139 >> 13;
                                                                        v117 = v140 >> 6;
                                                                        v118 = v140 >> 7;
                                                                        v119 = v140 >> 8;
                                                                        v120 = v140 >> 9;
                                                                        LODWORD(v121) = v140 >> 10;
                                                                        LODWORD(v122) = v140 >> 11;
                                                                        LODWORD(v123) = v140 >> 12;
                                                                        LODWORD(v124) = v140 >> 13;
                                                                      }
                                                                      if ((v114 & 1) == (v104 & 1))
                                                                      {
                                                                        if ((v114 & 1) != 0)
                                                                        {
                                                                          allQueryMatched = self->_allQueryMatched;
                                                                          objc_msgSend(v4, "allQueryMatched", v120, v119, v106, v118, v105, v117);
                                                                          if (allQueryMatched != v142)
                                                                            goto LABEL_187;
                                                                          v143 = *((unsigned __int16 *)v4 + 98);
                                                                          LODWORD(v105) = v143 >> 4;
                                                                          v106 = v143 >> 5;
                                                                          LODWORD(v107) = v143 >> 6;
                                                                          LODWORD(v108) = v143 >> 7;
                                                                          v109 = v143 >> 8;
                                                                          LODWORD(v110) = v143 >> 9;
                                                                          LODWORD(v111) = v143 >> 10;
                                                                          v144 = *((unsigned __int16 *)&self->_has + 2);
                                                                          LODWORD(v115) = v144 >> 4;
                                                                          LODWORD(v116) = v144 >> 5;
                                                                          LODWORD(v117) = v144 >> 6;
                                                                          v118 = v144 >> 7;
                                                                          LODWORD(v184) = v143 >> 11;
                                                                          LODWORD(v185) = v143 >> 12;
                                                                          LODWORD(v186) = v143 >> 13;
                                                                          v119 = v144 >> 8;
                                                                          v120 = v144 >> 9;
                                                                          LODWORD(v121) = v144 >> 10;
                                                                          LODWORD(v122) = v144 >> 11;
                                                                          LODWORD(v123) = v144 >> 12;
                                                                          LODWORD(v124) = v144 >> 13;
                                                                        }
                                                                        if ((v115 & 1) == (v105 & 1))
                                                                        {
                                                                          if ((v115 & 1) != 0)
                                                                          {
                                                                            allPrimaryNameTokensAreInQuery = self->_allPrimaryNameTokensAreInQuery;
                                                                            objc_msgSend(v4, "allPrimaryNameTokensAreInQuery", v120, v119, v106, v118);
                                                                            if (allPrimaryNameTokensAreInQuery != v146)
                                                                              goto LABEL_187;
                                                                            v147 = *((unsigned __int16 *)v4 + 98);
                                                                            LODWORD(v106) = v147 >> 5;
                                                                            LODWORD(v107) = v147 >> 6;
                                                                            LODWORD(v108) = v147 >> 7;
                                                                            v109 = v147 >> 8;
                                                                            LODWORD(v110) = v147 >> 9;
                                                                            LODWORD(v111) = v147 >> 10;
                                                                            v148 = *((unsigned __int16 *)&self->_has + 2);
                                                                            LODWORD(v116) = v148 >> 5;
                                                                            LODWORD(v117) = v148 >> 6;
                                                                            LODWORD(v118) = v148 >> 7;
                                                                            v119 = v148 >> 8;
                                                                            v120 = v148 >> 9;
                                                                            LODWORD(v184) = v147 >> 11;
                                                                            LODWORD(v185) = v147 >> 12;
                                                                            LODWORD(v186) = v147 >> 13;
                                                                            LODWORD(v121) = v148 >> 10;
                                                                            LODWORD(v122) = v148 >> 11;
                                                                            LODWORD(v123) = v148 >> 12;
                                                                            LODWORD(v124) = v148 >> 13;
                                                                          }
                                                                          if ((v116 & 1) == (v106 & 1))
                                                                          {
                                                                            if ((v116 & 1) != 0)
                                                                            {
                                                                              isGivenNameMatch = self->_isGivenNameMatch;
                                                                              objc_msgSend(v4, "isGivenNameMatch", v120, v119);
                                                                              if (isGivenNameMatch != v150)
                                                                                goto LABEL_187;
                                                                              v151 = *((unsigned __int16 *)v4 + 98);
                                                                              LODWORD(v107) = v151 >> 6;
                                                                              LODWORD(v108) = v151 >> 7;
                                                                              v109 = v151 >> 8;
                                                                              LODWORD(v110) = v151 >> 9;
                                                                              LODWORD(v111) = v151 >> 10;
                                                                              v152 = *((unsigned __int16 *)&self->_has
                                                                                     + 2);
                                                                              LODWORD(v117) = v152 >> 6;
                                                                              LODWORD(v118) = v152 >> 7;
                                                                              v119 = v152 >> 8;
                                                                              v120 = v152 >> 9;
                                                                              LODWORD(v121) = v152 >> 10;
                                                                              LODWORD(v122) = v152 >> 11;
                                                                              LODWORD(v184) = v151 >> 11;
                                                                              LODWORD(v185) = v151 >> 12;
                                                                              LODWORD(v186) = v151 >> 13;
                                                                              LODWORD(v123) = v152 >> 12;
                                                                              LODWORD(v124) = v152 >> 13;
                                                                            }
                                                                            if ((v117 & 1) == (v107 & 1))
                                                                            {
                                                                              if ((v117 & 1) != 0)
                                                                              {
                                                                                isMiddleNameMatch = self->_isMiddleNameMatch;
                                                                                objc_msgSend(v4, "isMiddleNameMatch", v120, v119);
                                                                                if (isMiddleNameMatch != v154)
                                                                                  goto LABEL_187;
                                                                                v155 = *((unsigned __int16 *)v4 + 98);
                                                                                LODWORD(v108) = v155 >> 7;
                                                                                v109 = v155 >> 8;
                                                                                LODWORD(v110) = v155 >> 9;
                                                                                LODWORD(v111) = v155 >> 10;
                                                                                v156 = *((unsigned __int16 *)&self->_has
                                                                                       + 2);
                                                                                LODWORD(v118) = v156 >> 7;
                                                                                v119 = v156 >> 8;
                                                                                v120 = v156 >> 9;
                                                                                LODWORD(v121) = v156 >> 10;
                                                                                LODWORD(v122) = v156 >> 11;
                                                                                LODWORD(v123) = v156 >> 12;
                                                                                LODWORD(v124) = v156 >> 13;
                                                                                LODWORD(v184) = v155 >> 11;
                                                                                LODWORD(v185) = v155 >> 12;
                                                                                LODWORD(v186) = v155 >> 13;
                                                                              }
                                                                              if ((v118 & 1) == (v108 & 1))
                                                                              {
                                                                                if ((v118 & 1) != 0)
                                                                                {
                                                                                  isFamilyNameMatch = self->_isFamilyNameMatch;
                                                                                  objc_msgSend(v4, "isFamilyNameMatch", v120, v119);
                                                                                  if (isFamilyNameMatch != v158)
                                                                                    goto LABEL_187;
                                                                                  v159 = *((unsigned __int16 *)v4 + 98);
                                                                                  v109 = v159 >> 8;
                                                                                  LODWORD(v110) = v159 >> 9;
                                                                                  LODWORD(v111) = v159 >> 10;
                                                                                  v160 = *((unsigned __int16 *)&self->_has
                                                                                         + 2);
                                                                                  LODWORD(v119) = v160 >> 8;
                                                                                  v120 = v160 >> 9;
                                                                                  LODWORD(v121) = v160 >> 10;
                                                                                  LODWORD(v122) = v160 >> 11;
                                                                                  LODWORD(v123) = v160 >> 12;
                                                                                  LODWORD(v124) = v160 >> 13;
                                                                                  LODWORD(v184) = v159 >> 11;
                                                                                  LODWORD(v185) = v159 >> 12;
                                                                                  LODWORD(v186) = v159 >> 13;
                                                                                }
                                                                                if ((v119 & 1) == (v109 & 1))
                                                                                {
                                                                                  if ((v119 & 1) != 0)
                                                                                  {
                                                                                    isOrganizationNameMatch = self->_isOrganizationNameMatch;
                                                                                    objc_msgSend(v4, "isOrganizationNameMatch", v120);
                                                                                    if (isOrganizationNameMatch != v162)
                                                                                      goto LABEL_187;
                                                                                    v163 = *((unsigned __int16 *)v4 + 98);
                                                                                    LODWORD(v110) = v163 >> 9;
                                                                                    LODWORD(v111) = v163 >> 10;
                                                                                    v164 = *((unsigned __int16 *)&self->_has
                                                                                           + 2);
                                                                                    LODWORD(v120) = v164 >> 9;
                                                                                    LODWORD(v121) = v164 >> 10;
                                                                                    LODWORD(v122) = v164 >> 11;
                                                                                    LODWORD(v123) = v164 >> 12;
                                                                                    LODWORD(v124) = v164 >> 13;
                                                                                    LODWORD(v184) = v163 >> 11;
                                                                                    LODWORD(v185) = v163 >> 12;
                                                                                    LODWORD(v186) = v163 >> 13;
                                                                                  }
                                                                                  if ((v120 & 1) == (v110 & 1))
                                                                                  {
                                                                                    if ((v120 & 1) != 0)
                                                                                    {
                                                                                      isNicknameMatch = self->_isNicknameMatch;
                                                                                      objc_msgSend(v4, "isNicknameMatch");
                                                                                      if (isNicknameMatch != v166)
                                                                                        goto LABEL_187;
                                                                                      v167 = *((unsigned __int16 *)v4
                                                                                             + 98);
                                                                                      LODWORD(v111) = v167 >> 10;
                                                                                      v168 = *((unsigned __int16 *)&self->_has
                                                                                             + 2);
                                                                                      LODWORD(v121) = v168 >> 10;
                                                                                      LODWORD(v122) = v168 >> 11;
                                                                                      LODWORD(v123) = v168 >> 12;
                                                                                      LODWORD(v124) = v168 >> 13;
                                                                                      LODWORD(v184) = v167 >> 11;
                                                                                      LODWORD(v185) = v167 >> 12;
                                                                                      LODWORD(v186) = v167 >> 13;
                                                                                    }
                                                                                    if ((v121 & 1) == (v111 & 1))
                                                                                    {
                                                                                      if ((v121 & 1) != 0)
                                                                                      {
                                                                                        isNamePrefixMatch = self->_isNamePrefixMatch;
                                                                                        objc_msgSend(v4, "isNamePrefixMatch");
                                                                                        if (isNamePrefixMatch != v170)
                                                                                          goto LABEL_187;
                                                                                        v171 = *((unsigned __int16 *)v4
                                                                                               + 98);
                                                                                        v172 = *((unsigned __int16 *)&self->_has
                                                                                               + 2);
                                                                                        LODWORD(v122) = v172 >> 11;
                                                                                        LODWORD(v123) = v172 >> 12;
                                                                                        LODWORD(v124) = v172 >> 13;
                                                                                        LODWORD(v184) = v171 >> 11;
                                                                                        LODWORD(v185) = v171 >> 12;
                                                                                        LODWORD(v186) = v171 >> 13;
                                                                                      }
                                                                                      if ((v122 & 1) == (v184 & 1))
                                                                                      {
                                                                                        if ((v122 & 1) != 0)
                                                                                        {
                                                                                          isNameSuffixMatch = self->_isNameSuffixMatch;
                                                                                          objc_msgSend(v4, "isNameSuffixMatch");
                                                                                          if (isNameSuffixMatch != v174)
                                                                                            goto LABEL_187;
                                                                                          v175 = *((unsigned __int16 *)&self->_has
                                                                                                 + 2);
                                                                                          v176 = *((unsigned __int16 *)v4
                                                                                                 + 98);
                                                                                          LODWORD(v123) = v175 >> 12;
                                                                                          LODWORD(v124) = v175 >> 13;
                                                                                          LODWORD(v185) = v176 >> 12;
                                                                                          LODWORD(v186) = v176 >> 13;
                                                                                        }
                                                                                        if ((v123 & 1) == (v185 & 1))
                                                                                        {
                                                                                          if ((v123 & 1) != 0)
                                                                                          {
                                                                                            allHandlesMatched = self->_allHandlesMatched;
                                                                                            objc_msgSend(v4, "allHandlesMatched");
                                                                                            if (allHandlesMatched != v178)
                                                                                              goto LABEL_187;
                                                                                            LODWORD(v124) = *((unsigned __int16 *)&self->_has + 2) >> 13;
                                                                                            LODWORD(v186) = *((unsigned __int16 *)v4 + 98) >> 13;
                                                                                          }
                                                                                          v179 = v124 & 1;
                                                                                          if (v179 == (v186 & 1))
                                                                                          {
                                                                                            if (!v179
                                                                                              || (isRelationAlias = self->_isRelationAlias,
                                                                                                  objc_msgSend(v4, "isRelationAlias"), isRelationAlias == v181))
                                                                                            {
                                                                                              v182 = 1;
                                                                                              goto LABEL_188;
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
              }
            }
          }
        }
      }
    }
  }
LABEL_187:
  v182 = 0;
LABEL_188:

  return v182;
}

- (unint64_t)hash
{
  $84752DCADCC9A46F675661ABABD0E080 v3;
  unint64_t v4;
  unint64_t v5;
  float isRecent;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;
  float isRecentInSameDomain;
  double v12;
  long double v13;
  double v14;
  unint64_t v15;
  float isRecentInSiriRequest;
  double v17;
  long double v18;
  double v19;
  unint64_t v20;
  float isRecentlyCorrected;
  double v22;
  long double v23;
  double v24;
  unint64_t v25;
  float recencyRank;
  double v27;
  long double v28;
  double v29;
  unint64_t v30;
  float recencyRankInSameDomain;
  double v32;
  long double v33;
  double v34;
  unint64_t v35;
  float recencyRankInSiriRequest;
  double v37;
  long double v38;
  double v39;
  unint64_t v40;
  float isHighQualityRequestMatch;
  double v42;
  long double v43;
  double v44;
  unint64_t v45;
  float isFavorite;
  double v47;
  long double v48;
  double v49;
  unint64_t v50;
  float isMeCardRelation;
  double v52;
  long double v53;
  double v54;
  unint64_t v55;
  float isWeakOrganizationMatch;
  double v57;
  long double v58;
  double v59;
  unint64_t v60;
  float speechAlternativeRanksGivenNameRank;
  double v62;
  long double v63;
  double v64;
  unint64_t v65;
  float speechAlternativeRanksMiddleNameRank;
  double v67;
  long double v68;
  double v69;
  unint64_t v70;
  float speechAlternativeRanksFamilyNameRank;
  double v72;
  long double v73;
  double v74;
  unint64_t v75;
  float freqAnyGroup0MinTo2Min;
  double v77;
  long double v78;
  double v79;
  unint64_t v80;
  float freqAnyGroup2MinTo10Min;
  double v82;
  long double v83;
  double v84;
  unint64_t v85;
  float freqAnyGroup10MinTo1Hr;
  double v87;
  long double v88;
  double v89;
  unint64_t v90;
  float freqAnyGroup1HrTo6Hr;
  double v92;
  long double v93;
  double v94;
  unint64_t v95;
  float freqAnyGroup6HrTo1Day;
  double v97;
  long double v98;
  double v99;
  unint64_t v100;
  float freqAnyGroup1DayTo7Day;
  double v102;
  long double v103;
  double v104;
  unint64_t v105;
  float freqAnyGroup7DayTo28Day;
  double v107;
  long double v108;
  double v109;
  unint64_t v110;
  float freqAnyGroup28DayToInf;
  double v112;
  long double v113;
  double v114;
  unint64_t v115;
  float freqSameGroup0MinTo2Min;
  double v117;
  long double v118;
  double v119;
  unint64_t v120;
  float freqSameGroup2MinTo10Min;
  double v122;
  long double v123;
  double v124;
  unint64_t v125;
  float freqSameGroup10MinTo1Hr;
  double v127;
  long double v128;
  double v129;
  unint64_t v130;
  float freqSameGroup1HrTo6Hr;
  double v132;
  long double v133;
  double v134;
  unint64_t v135;
  float freqSameGroup6HrTo1Day;
  double v137;
  long double v138;
  double v139;
  unint64_t v140;
  float freqSameGroup1DayTo7Day;
  double v142;
  long double v143;
  double v144;
  unint64_t v145;
  float freqSameGroup7DayTo28Day;
  double v147;
  long double v148;
  double v149;
  unint64_t v150;
  float freqSameGroup28DayToInf;
  double v152;
  long double v153;
  double v154;
  unint64_t v155;
  float isSuggested;
  double v157;
  long double v158;
  double v159;
  unint64_t v160;
  float isHypocorism;
  double v162;
  long double v163;
  double v164;
  unint64_t v165;
  float hasSuggestedProperties;
  double v167;
  long double v168;
  double v169;
  unint64_t v170;
  float isPartialNameMatch;
  double v172;
  long double v173;
  double v174;
  unint64_t v175;
  float numPrimaryTokens;
  double v177;
  long double v178;
  double v179;
  unint64_t v180;
  float allQueryMatched;
  double v182;
  long double v183;
  double v184;
  unint64_t v185;
  float allPrimaryNameTokensAreInQuery;
  double v187;
  long double v188;
  double v189;
  unint64_t v190;
  float isGivenNameMatch;
  double v192;
  long double v193;
  double v194;
  unint64_t v195;
  float isMiddleNameMatch;
  double v197;
  long double v198;
  double v199;
  unint64_t v200;
  float isFamilyNameMatch;
  double v202;
  long double v203;
  double v204;
  unint64_t v205;
  float isOrganizationNameMatch;
  double v207;
  long double v208;
  double v209;
  unint64_t v210;
  float isNicknameMatch;
  double v212;
  long double v213;
  double v214;
  unint64_t v215;
  float isNamePrefixMatch;
  double v217;
  long double v218;
  double v219;
  unint64_t v220;
  unint64_t v221;
  unint64_t v222;
  float isNameSuffixMatch;
  double v224;
  long double v225;
  double v226;
  unint64_t v227;
  unint64_t v228;
  float allHandlesMatched;
  double v230;
  long double v231;
  double v232;
  unint64_t v233;
  float isRelationAlias;
  double v235;
  long double v236;
  double v237;
  unint64_t v239;
  unint64_t v240;
  unint64_t v241;
  unint64_t v242;
  unint64_t v243;
  unint64_t v244;
  unint64_t v245;
  unint64_t v246;
  unint64_t v247;
  unint64_t v248;
  unint64_t v249;
  unint64_t v250;
  unint64_t v251;
  unint64_t v252;
  unint64_t v253;
  unint64_t v254;
  unint64_t v255;
  unint64_t v256;
  unint64_t v257;
  unint64_t v258;
  unint64_t v259;
  unint64_t v260;
  unint64_t v261;
  unint64_t v262;
  unint64_t v263;
  unint64_t v264;
  unint64_t v265;
  unint64_t v266;
  unint64_t v267;
  unint64_t v268;
  unint64_t v269;
  unint64_t v270;
  unint64_t v271;
  unint64_t v272;
  unint64_t v273;
  unint64_t v274;
  unint64_t v275;
  unint64_t v276;

  v3 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  v4 = *(_QWORD *)&v3 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_BYTE *)&v3 & 1) != 0)
  {
    isRecent = self->_isRecent;
    v7 = isRecent;
    if (isRecent < 0.0)
      v7 = -isRecent;
    v8 = floor(v7 + 0.5);
    v9 = (v7 - v8) * 1.84467441e19;
    v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0)
        v5 += (unint64_t)v9;
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    v5 = 0;
  }
  if ((v4 & 2) != 0)
  {
    isRecentInSameDomain = self->_isRecentInSameDomain;
    v12 = isRecentInSameDomain;
    if (isRecentInSameDomain < 0.0)
      v12 = -isRecentInSameDomain;
    v13 = floor(v12 + 0.5);
    v14 = (v12 - v13) * 1.84467441e19;
    v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0)
        v10 += (unint64_t)v14;
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    v10 = 0;
  }
  if ((v4 & 4) != 0)
  {
    isRecentInSiriRequest = self->_isRecentInSiriRequest;
    v17 = isRecentInSiriRequest;
    if (isRecentInSiriRequest < 0.0)
      v17 = -isRecentInSiriRequest;
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
  if ((v4 & 8) != 0)
  {
    isRecentlyCorrected = self->_isRecentlyCorrected;
    v22 = isRecentlyCorrected;
    if (isRecentlyCorrected < 0.0)
      v22 = -isRecentlyCorrected;
    v23 = floor(v22 + 0.5);
    v24 = (v22 - v23) * 1.84467441e19;
    v20 = 2654435761u * (unint64_t)fmod(v23, 1.84467441e19);
    if (v24 >= 0.0)
    {
      if (v24 > 0.0)
        v20 += (unint64_t)v24;
    }
    else
    {
      v20 -= (unint64_t)fabs(v24);
    }
  }
  else
  {
    v20 = 0;
  }
  if ((v4 & 0x10) != 0)
  {
    recencyRank = self->_recencyRank;
    v27 = recencyRank;
    if (recencyRank < 0.0)
      v27 = -recencyRank;
    v28 = floor(v27 + 0.5);
    v29 = (v27 - v28) * 1.84467441e19;
    v25 = 2654435761u * (unint64_t)fmod(v28, 1.84467441e19);
    if (v29 >= 0.0)
    {
      if (v29 > 0.0)
        v25 += (unint64_t)v29;
    }
    else
    {
      v25 -= (unint64_t)fabs(v29);
    }
  }
  else
  {
    v25 = 0;
  }
  if ((v4 & 0x20) != 0)
  {
    recencyRankInSameDomain = self->_recencyRankInSameDomain;
    v32 = recencyRankInSameDomain;
    if (recencyRankInSameDomain < 0.0)
      v32 = -recencyRankInSameDomain;
    v33 = floor(v32 + 0.5);
    v34 = (v32 - v33) * 1.84467441e19;
    v30 = 2654435761u * (unint64_t)fmod(v33, 1.84467441e19);
    if (v34 >= 0.0)
    {
      if (v34 > 0.0)
        v30 += (unint64_t)v34;
    }
    else
    {
      v30 -= (unint64_t)fabs(v34);
    }
  }
  else
  {
    v30 = 0;
  }
  if ((v4 & 0x40) != 0)
  {
    recencyRankInSiriRequest = self->_recencyRankInSiriRequest;
    v37 = recencyRankInSiriRequest;
    if (recencyRankInSiriRequest < 0.0)
      v37 = -recencyRankInSiriRequest;
    v38 = floor(v37 + 0.5);
    v39 = (v37 - v38) * 1.84467441e19;
    v35 = 2654435761u * (unint64_t)fmod(v38, 1.84467441e19);
    if (v39 >= 0.0)
    {
      if (v39 > 0.0)
        v35 += (unint64_t)v39;
    }
    else
    {
      v35 -= (unint64_t)fabs(v39);
    }
  }
  else
  {
    v35 = 0;
  }
  if ((v4 & 0x80) != 0)
  {
    isHighQualityRequestMatch = self->_isHighQualityRequestMatch;
    v42 = isHighQualityRequestMatch;
    if (isHighQualityRequestMatch < 0.0)
      v42 = -isHighQualityRequestMatch;
    v43 = floor(v42 + 0.5);
    v44 = (v42 - v43) * 1.84467441e19;
    v40 = 2654435761u * (unint64_t)fmod(v43, 1.84467441e19);
    if (v44 >= 0.0)
    {
      if (v44 > 0.0)
        v40 += (unint64_t)v44;
    }
    else
    {
      v40 -= (unint64_t)fabs(v44);
    }
  }
  else
  {
    v40 = 0;
  }
  v273 = v40;
  if ((v4 & 0x100) != 0)
  {
    isFavorite = self->_isFavorite;
    v47 = isFavorite;
    if (isFavorite < 0.0)
      v47 = -isFavorite;
    v48 = floor(v47 + 0.5);
    v49 = (v47 - v48) * 1.84467441e19;
    v45 = 2654435761u * (unint64_t)fmod(v48, 1.84467441e19);
    if (v49 >= 0.0)
    {
      if (v49 > 0.0)
        v45 += (unint64_t)v49;
    }
    else
    {
      v45 -= (unint64_t)fabs(v49);
    }
  }
  else
  {
    v45 = 0;
  }
  v272 = v45;
  if ((v4 & 0x200) != 0)
  {
    isMeCardRelation = self->_isMeCardRelation;
    v52 = isMeCardRelation;
    if (isMeCardRelation < 0.0)
      v52 = -isMeCardRelation;
    v53 = floor(v52 + 0.5);
    v54 = (v52 - v53) * 1.84467441e19;
    v50 = 2654435761u * (unint64_t)fmod(v53, 1.84467441e19);
    if (v54 >= 0.0)
    {
      if (v54 > 0.0)
        v50 += (unint64_t)v54;
    }
    else
    {
      v50 -= (unint64_t)fabs(v54);
    }
  }
  else
  {
    v50 = 0;
  }
  v271 = v50;
  if ((v4 & 0x400) != 0)
  {
    isWeakOrganizationMatch = self->_isWeakOrganizationMatch;
    v57 = isWeakOrganizationMatch;
    if (isWeakOrganizationMatch < 0.0)
      v57 = -isWeakOrganizationMatch;
    v58 = floor(v57 + 0.5);
    v59 = (v57 - v58) * 1.84467441e19;
    v55 = 2654435761u * (unint64_t)fmod(v58, 1.84467441e19);
    if (v59 >= 0.0)
    {
      if (v59 > 0.0)
        v55 += (unint64_t)v59;
    }
    else
    {
      v55 -= (unint64_t)fabs(v59);
    }
  }
  else
  {
    v55 = 0;
  }
  v270 = v55;
  if ((v4 & 0x800) != 0)
  {
    speechAlternativeRanksGivenNameRank = self->_speechAlternativeRanksGivenNameRank;
    v62 = speechAlternativeRanksGivenNameRank;
    if (speechAlternativeRanksGivenNameRank < 0.0)
      v62 = -speechAlternativeRanksGivenNameRank;
    v63 = floor(v62 + 0.5);
    v64 = (v62 - v63) * 1.84467441e19;
    v60 = 2654435761u * (unint64_t)fmod(v63, 1.84467441e19);
    if (v64 >= 0.0)
    {
      if (v64 > 0.0)
        v60 += (unint64_t)v64;
    }
    else
    {
      v60 -= (unint64_t)fabs(v64);
    }
  }
  else
  {
    v60 = 0;
  }
  v269 = v60;
  if ((v4 & 0x1000) != 0)
  {
    speechAlternativeRanksMiddleNameRank = self->_speechAlternativeRanksMiddleNameRank;
    v67 = speechAlternativeRanksMiddleNameRank;
    if (speechAlternativeRanksMiddleNameRank < 0.0)
      v67 = -speechAlternativeRanksMiddleNameRank;
    v68 = floor(v67 + 0.5);
    v69 = (v67 - v68) * 1.84467441e19;
    v65 = 2654435761u * (unint64_t)fmod(v68, 1.84467441e19);
    if (v69 >= 0.0)
    {
      if (v69 > 0.0)
        v65 += (unint64_t)v69;
    }
    else
    {
      v65 -= (unint64_t)fabs(v69);
    }
  }
  else
  {
    v65 = 0;
  }
  v268 = v65;
  if ((v4 & 0x2000) != 0)
  {
    speechAlternativeRanksFamilyNameRank = self->_speechAlternativeRanksFamilyNameRank;
    v72 = speechAlternativeRanksFamilyNameRank;
    if (speechAlternativeRanksFamilyNameRank < 0.0)
      v72 = -speechAlternativeRanksFamilyNameRank;
    v73 = floor(v72 + 0.5);
    v74 = (v72 - v73) * 1.84467441e19;
    v70 = 2654435761u * (unint64_t)fmod(v73, 1.84467441e19);
    if (v74 >= 0.0)
    {
      if (v74 > 0.0)
        v70 += (unint64_t)v74;
    }
    else
    {
      v70 -= (unint64_t)fabs(v74);
    }
  }
  else
  {
    v70 = 0;
  }
  v267 = v70;
  if ((v4 & 0x4000) != 0)
  {
    freqAnyGroup0MinTo2Min = self->_freqAnyGroup0MinTo2Min;
    v77 = freqAnyGroup0MinTo2Min;
    if (freqAnyGroup0MinTo2Min < 0.0)
      v77 = -freqAnyGroup0MinTo2Min;
    v78 = floor(v77 + 0.5);
    v79 = (v77 - v78) * 1.84467441e19;
    v75 = 2654435761u * (unint64_t)fmod(v78, 1.84467441e19);
    if (v79 >= 0.0)
    {
      if (v79 > 0.0)
        v75 += (unint64_t)v79;
    }
    else
    {
      v75 -= (unint64_t)fabs(v79);
    }
  }
  else
  {
    v75 = 0;
  }
  v266 = v75;
  if ((v4 & 0x8000) != 0)
  {
    freqAnyGroup2MinTo10Min = self->_freqAnyGroup2MinTo10Min;
    v82 = freqAnyGroup2MinTo10Min;
    if (freqAnyGroup2MinTo10Min < 0.0)
      v82 = -freqAnyGroup2MinTo10Min;
    v83 = floor(v82 + 0.5);
    v84 = (v82 - v83) * 1.84467441e19;
    v80 = 2654435761u * (unint64_t)fmod(v83, 1.84467441e19);
    if (v84 >= 0.0)
    {
      if (v84 > 0.0)
        v80 += (unint64_t)v84;
    }
    else
    {
      v80 -= (unint64_t)fabs(v84);
    }
  }
  else
  {
    v80 = 0;
  }
  v265 = v80;
  if ((v4 & 0x10000) != 0)
  {
    freqAnyGroup10MinTo1Hr = self->_freqAnyGroup10MinTo1Hr;
    v87 = freqAnyGroup10MinTo1Hr;
    if (freqAnyGroup10MinTo1Hr < 0.0)
      v87 = -freqAnyGroup10MinTo1Hr;
    v88 = floor(v87 + 0.5);
    v89 = (v87 - v88) * 1.84467441e19;
    v85 = 2654435761u * (unint64_t)fmod(v88, 1.84467441e19);
    if (v89 >= 0.0)
    {
      if (v89 > 0.0)
        v85 += (unint64_t)v89;
    }
    else
    {
      v85 -= (unint64_t)fabs(v89);
    }
  }
  else
  {
    v85 = 0;
  }
  v264 = v85;
  if ((v4 & 0x20000) != 0)
  {
    freqAnyGroup1HrTo6Hr = self->_freqAnyGroup1HrTo6Hr;
    v92 = freqAnyGroup1HrTo6Hr;
    if (freqAnyGroup1HrTo6Hr < 0.0)
      v92 = -freqAnyGroup1HrTo6Hr;
    v93 = floor(v92 + 0.5);
    v94 = (v92 - v93) * 1.84467441e19;
    v90 = 2654435761u * (unint64_t)fmod(v93, 1.84467441e19);
    if (v94 >= 0.0)
    {
      if (v94 > 0.0)
        v90 += (unint64_t)v94;
    }
    else
    {
      v90 -= (unint64_t)fabs(v94);
    }
  }
  else
  {
    v90 = 0;
  }
  v263 = v90;
  if ((v4 & 0x40000) != 0)
  {
    freqAnyGroup6HrTo1Day = self->_freqAnyGroup6HrTo1Day;
    v97 = freqAnyGroup6HrTo1Day;
    if (freqAnyGroup6HrTo1Day < 0.0)
      v97 = -freqAnyGroup6HrTo1Day;
    v98 = floor(v97 + 0.5);
    v99 = (v97 - v98) * 1.84467441e19;
    v95 = 2654435761u * (unint64_t)fmod(v98, 1.84467441e19);
    if (v99 >= 0.0)
    {
      if (v99 > 0.0)
        v95 += (unint64_t)v99;
    }
    else
    {
      v95 -= (unint64_t)fabs(v99);
    }
  }
  else
  {
    v95 = 0;
  }
  v262 = v95;
  if ((v4 & 0x80000) != 0)
  {
    freqAnyGroup1DayTo7Day = self->_freqAnyGroup1DayTo7Day;
    v102 = freqAnyGroup1DayTo7Day;
    if (freqAnyGroup1DayTo7Day < 0.0)
      v102 = -freqAnyGroup1DayTo7Day;
    v103 = floor(v102 + 0.5);
    v104 = (v102 - v103) * 1.84467441e19;
    v100 = 2654435761u * (unint64_t)fmod(v103, 1.84467441e19);
    if (v104 >= 0.0)
    {
      if (v104 > 0.0)
        v100 += (unint64_t)v104;
    }
    else
    {
      v100 -= (unint64_t)fabs(v104);
    }
  }
  else
  {
    v100 = 0;
  }
  v261 = v100;
  if ((v4 & 0x100000) != 0)
  {
    freqAnyGroup7DayTo28Day = self->_freqAnyGroup7DayTo28Day;
    v107 = freqAnyGroup7DayTo28Day;
    if (freqAnyGroup7DayTo28Day < 0.0)
      v107 = -freqAnyGroup7DayTo28Day;
    v108 = floor(v107 + 0.5);
    v109 = (v107 - v108) * 1.84467441e19;
    v105 = 2654435761u * (unint64_t)fmod(v108, 1.84467441e19);
    if (v109 >= 0.0)
    {
      if (v109 > 0.0)
        v105 += (unint64_t)v109;
    }
    else
    {
      v105 -= (unint64_t)fabs(v109);
    }
  }
  else
  {
    v105 = 0;
  }
  v260 = v105;
  if ((v4 & 0x200000) != 0)
  {
    freqAnyGroup28DayToInf = self->_freqAnyGroup28DayToInf;
    v112 = freqAnyGroup28DayToInf;
    if (freqAnyGroup28DayToInf < 0.0)
      v112 = -freqAnyGroup28DayToInf;
    v113 = floor(v112 + 0.5);
    v114 = (v112 - v113) * 1.84467441e19;
    v110 = 2654435761u * (unint64_t)fmod(v113, 1.84467441e19);
    if (v114 >= 0.0)
    {
      if (v114 > 0.0)
        v110 += (unint64_t)v114;
    }
    else
    {
      v110 -= (unint64_t)fabs(v114);
    }
  }
  else
  {
    v110 = 0;
  }
  v259 = v110;
  if ((v4 & 0x400000) != 0)
  {
    freqSameGroup0MinTo2Min = self->_freqSameGroup0MinTo2Min;
    v117 = freqSameGroup0MinTo2Min;
    if (freqSameGroup0MinTo2Min < 0.0)
      v117 = -freqSameGroup0MinTo2Min;
    v118 = floor(v117 + 0.5);
    v119 = (v117 - v118) * 1.84467441e19;
    v115 = 2654435761u * (unint64_t)fmod(v118, 1.84467441e19);
    if (v119 >= 0.0)
    {
      if (v119 > 0.0)
        v115 += (unint64_t)v119;
    }
    else
    {
      v115 -= (unint64_t)fabs(v119);
    }
  }
  else
  {
    v115 = 0;
  }
  v258 = v115;
  if ((v4 & 0x800000) != 0)
  {
    freqSameGroup2MinTo10Min = self->_freqSameGroup2MinTo10Min;
    v122 = freqSameGroup2MinTo10Min;
    if (freqSameGroup2MinTo10Min < 0.0)
      v122 = -freqSameGroup2MinTo10Min;
    v123 = floor(v122 + 0.5);
    v124 = (v122 - v123) * 1.84467441e19;
    v120 = 2654435761u * (unint64_t)fmod(v123, 1.84467441e19);
    if (v124 >= 0.0)
    {
      if (v124 > 0.0)
        v120 += (unint64_t)v124;
    }
    else
    {
      v120 -= (unint64_t)fabs(v124);
    }
  }
  else
  {
    v120 = 0;
  }
  v257 = v120;
  if ((v4 & 0x1000000) != 0)
  {
    freqSameGroup10MinTo1Hr = self->_freqSameGroup10MinTo1Hr;
    v127 = freqSameGroup10MinTo1Hr;
    if (freqSameGroup10MinTo1Hr < 0.0)
      v127 = -freqSameGroup10MinTo1Hr;
    v128 = floor(v127 + 0.5);
    v129 = (v127 - v128) * 1.84467441e19;
    v125 = 2654435761u * (unint64_t)fmod(v128, 1.84467441e19);
    if (v129 >= 0.0)
    {
      if (v129 > 0.0)
        v125 += (unint64_t)v129;
    }
    else
    {
      v125 -= (unint64_t)fabs(v129);
    }
  }
  else
  {
    v125 = 0;
  }
  v256 = v125;
  if ((v4 & 0x2000000) != 0)
  {
    freqSameGroup1HrTo6Hr = self->_freqSameGroup1HrTo6Hr;
    v132 = freqSameGroup1HrTo6Hr;
    if (freqSameGroup1HrTo6Hr < 0.0)
      v132 = -freqSameGroup1HrTo6Hr;
    v133 = floor(v132 + 0.5);
    v134 = (v132 - v133) * 1.84467441e19;
    v130 = 2654435761u * (unint64_t)fmod(v133, 1.84467441e19);
    if (v134 >= 0.0)
    {
      if (v134 > 0.0)
        v130 += (unint64_t)v134;
    }
    else
    {
      v130 -= (unint64_t)fabs(v134);
    }
  }
  else
  {
    v130 = 0;
  }
  v255 = v130;
  if ((v4 & 0x4000000) != 0)
  {
    freqSameGroup6HrTo1Day = self->_freqSameGroup6HrTo1Day;
    v137 = freqSameGroup6HrTo1Day;
    if (freqSameGroup6HrTo1Day < 0.0)
      v137 = -freqSameGroup6HrTo1Day;
    v138 = floor(v137 + 0.5);
    v139 = (v137 - v138) * 1.84467441e19;
    v135 = 2654435761u * (unint64_t)fmod(v138, 1.84467441e19);
    if (v139 >= 0.0)
    {
      if (v139 > 0.0)
        v135 += (unint64_t)v139;
    }
    else
    {
      v135 -= (unint64_t)fabs(v139);
    }
  }
  else
  {
    v135 = 0;
  }
  v254 = v135;
  if ((v4 & 0x8000000) != 0)
  {
    freqSameGroup1DayTo7Day = self->_freqSameGroup1DayTo7Day;
    v142 = freqSameGroup1DayTo7Day;
    if (freqSameGroup1DayTo7Day < 0.0)
      v142 = -freqSameGroup1DayTo7Day;
    v143 = floor(v142 + 0.5);
    v144 = (v142 - v143) * 1.84467441e19;
    v140 = 2654435761u * (unint64_t)fmod(v143, 1.84467441e19);
    if (v144 >= 0.0)
    {
      if (v144 > 0.0)
        v140 += (unint64_t)v144;
    }
    else
    {
      v140 -= (unint64_t)fabs(v144);
    }
  }
  else
  {
    v140 = 0;
  }
  v253 = v140;
  if ((v4 & 0x10000000) != 0)
  {
    freqSameGroup7DayTo28Day = self->_freqSameGroup7DayTo28Day;
    v147 = freqSameGroup7DayTo28Day;
    if (freqSameGroup7DayTo28Day < 0.0)
      v147 = -freqSameGroup7DayTo28Day;
    v148 = floor(v147 + 0.5);
    v149 = (v147 - v148) * 1.84467441e19;
    v145 = 2654435761u * (unint64_t)fmod(v148, 1.84467441e19);
    if (v149 >= 0.0)
    {
      if (v149 > 0.0)
        v145 += (unint64_t)v149;
    }
    else
    {
      v145 -= (unint64_t)fabs(v149);
    }
  }
  else
  {
    v145 = 0;
  }
  v252 = v145;
  if ((v4 & 0x20000000) != 0)
  {
    freqSameGroup28DayToInf = self->_freqSameGroup28DayToInf;
    v152 = freqSameGroup28DayToInf;
    if (freqSameGroup28DayToInf < 0.0)
      v152 = -freqSameGroup28DayToInf;
    v153 = floor(v152 + 0.5);
    v154 = (v152 - v153) * 1.84467441e19;
    v150 = 2654435761u * (unint64_t)fmod(v153, 1.84467441e19);
    if (v154 >= 0.0)
    {
      if (v154 > 0.0)
        v150 += (unint64_t)v154;
    }
    else
    {
      v150 -= (unint64_t)fabs(v154);
    }
  }
  else
  {
    v150 = 0;
  }
  v251 = v150;
  if ((v4 & 0x40000000) != 0)
  {
    isSuggested = self->_isSuggested;
    v157 = isSuggested;
    if (isSuggested < 0.0)
      v157 = -isSuggested;
    v158 = floor(v157 + 0.5);
    v159 = (v157 - v158) * 1.84467441e19;
    v155 = 2654435761u * (unint64_t)fmod(v158, 1.84467441e19);
    if (v159 >= 0.0)
    {
      if (v159 > 0.0)
        v155 += (unint64_t)v159;
    }
    else
    {
      v155 -= (unint64_t)fabs(v159);
    }
  }
  else
  {
    v155 = 0;
  }
  v250 = v155;
  if ((v4 & 0x80000000) != 0)
  {
    isHypocorism = self->_isHypocorism;
    v162 = isHypocorism;
    if (isHypocorism < 0.0)
      v162 = -isHypocorism;
    v163 = floor(v162 + 0.5);
    v164 = (v162 - v163) * 1.84467441e19;
    v160 = 2654435761u * (unint64_t)fmod(v163, 1.84467441e19);
    if (v164 >= 0.0)
    {
      if (v164 > 0.0)
        v160 += (unint64_t)v164;
    }
    else
    {
      v160 -= (unint64_t)fabs(v164);
    }
  }
  else
  {
    v160 = 0;
  }
  v249 = v160;
  if ((v4 & 0x100000000) != 0)
  {
    hasSuggestedProperties = self->_hasSuggestedProperties;
    v167 = hasSuggestedProperties;
    if (hasSuggestedProperties < 0.0)
      v167 = -hasSuggestedProperties;
    v168 = floor(v167 + 0.5);
    v169 = (v167 - v168) * 1.84467441e19;
    v165 = 2654435761u * (unint64_t)fmod(v168, 1.84467441e19);
    if (v169 >= 0.0)
    {
      if (v169 > 0.0)
        v165 += (unint64_t)v169;
    }
    else
    {
      v165 -= (unint64_t)fabs(v169);
    }
  }
  else
  {
    v165 = 0;
  }
  v248 = v165;
  if ((v4 & 0x200000000) != 0)
  {
    isPartialNameMatch = self->_isPartialNameMatch;
    v172 = isPartialNameMatch;
    if (isPartialNameMatch < 0.0)
      v172 = -isPartialNameMatch;
    v173 = floor(v172 + 0.5);
    v174 = (v172 - v173) * 1.84467441e19;
    v170 = 2654435761u * (unint64_t)fmod(v173, 1.84467441e19);
    if (v174 >= 0.0)
    {
      if (v174 > 0.0)
        v170 += (unint64_t)v174;
    }
    else
    {
      v170 -= (unint64_t)fabs(v174);
    }
  }
  else
  {
    v170 = 0;
  }
  v247 = v170;
  if ((v4 & 0x400000000) != 0)
  {
    numPrimaryTokens = self->_numPrimaryTokens;
    v177 = numPrimaryTokens;
    if (numPrimaryTokens < 0.0)
      v177 = -numPrimaryTokens;
    v178 = floor(v177 + 0.5);
    v179 = (v177 - v178) * 1.84467441e19;
    v175 = 2654435761u * (unint64_t)fmod(v178, 1.84467441e19);
    if (v179 >= 0.0)
    {
      if (v179 > 0.0)
        v175 += (unint64_t)v179;
    }
    else
    {
      v175 -= (unint64_t)fabs(v179);
    }
  }
  else
  {
    v175 = 0;
  }
  v246 = v175;
  if ((v4 & 0x800000000) != 0)
  {
    allQueryMatched = self->_allQueryMatched;
    v182 = allQueryMatched;
    if (allQueryMatched < 0.0)
      v182 = -allQueryMatched;
    v183 = floor(v182 + 0.5);
    v184 = (v182 - v183) * 1.84467441e19;
    v180 = 2654435761u * (unint64_t)fmod(v183, 1.84467441e19);
    if (v184 >= 0.0)
    {
      if (v184 > 0.0)
        v180 += (unint64_t)v184;
    }
    else
    {
      v180 -= (unint64_t)fabs(v184);
    }
  }
  else
  {
    v180 = 0;
  }
  v245 = v180;
  if ((v4 & 0x1000000000) != 0)
  {
    allPrimaryNameTokensAreInQuery = self->_allPrimaryNameTokensAreInQuery;
    v187 = allPrimaryNameTokensAreInQuery;
    if (allPrimaryNameTokensAreInQuery < 0.0)
      v187 = -allPrimaryNameTokensAreInQuery;
    v188 = floor(v187 + 0.5);
    v189 = (v187 - v188) * 1.84467441e19;
    v185 = 2654435761u * (unint64_t)fmod(v188, 1.84467441e19);
    if (v189 >= 0.0)
    {
      if (v189 > 0.0)
        v185 += (unint64_t)v189;
    }
    else
    {
      v185 -= (unint64_t)fabs(v189);
    }
  }
  else
  {
    v185 = 0;
  }
  v244 = v185;
  if ((v4 & 0x2000000000) != 0)
  {
    isGivenNameMatch = self->_isGivenNameMatch;
    v192 = isGivenNameMatch;
    if (isGivenNameMatch < 0.0)
      v192 = -isGivenNameMatch;
    v193 = floor(v192 + 0.5);
    v194 = (v192 - v193) * 1.84467441e19;
    v190 = 2654435761u * (unint64_t)fmod(v193, 1.84467441e19);
    if (v194 >= 0.0)
    {
      if (v194 > 0.0)
        v190 += (unint64_t)v194;
    }
    else
    {
      v190 -= (unint64_t)fabs(v194);
    }
  }
  else
  {
    v190 = 0;
  }
  v243 = v190;
  if ((v4 & 0x4000000000) != 0)
  {
    isMiddleNameMatch = self->_isMiddleNameMatch;
    v197 = isMiddleNameMatch;
    if (isMiddleNameMatch < 0.0)
      v197 = -isMiddleNameMatch;
    v198 = floor(v197 + 0.5);
    v199 = (v197 - v198) * 1.84467441e19;
    v195 = 2654435761u * (unint64_t)fmod(v198, 1.84467441e19);
    if (v199 >= 0.0)
    {
      if (v199 > 0.0)
        v195 += (unint64_t)v199;
    }
    else
    {
      v195 -= (unint64_t)fabs(v199);
    }
  }
  else
  {
    v195 = 0;
  }
  v242 = v195;
  if ((v4 & 0x8000000000) != 0)
  {
    isFamilyNameMatch = self->_isFamilyNameMatch;
    v202 = isFamilyNameMatch;
    if (isFamilyNameMatch < 0.0)
      v202 = -isFamilyNameMatch;
    v203 = floor(v202 + 0.5);
    v204 = (v202 - v203) * 1.84467441e19;
    v200 = 2654435761u * (unint64_t)fmod(v203, 1.84467441e19);
    if (v204 >= 0.0)
    {
      if (v204 > 0.0)
        v200 += (unint64_t)v204;
    }
    else
    {
      v200 -= (unint64_t)fabs(v204);
    }
  }
  else
  {
    v200 = 0;
  }
  v241 = v200;
  if ((v4 & 0x10000000000) != 0)
  {
    isOrganizationNameMatch = self->_isOrganizationNameMatch;
    v207 = isOrganizationNameMatch;
    if (isOrganizationNameMatch < 0.0)
      v207 = -isOrganizationNameMatch;
    v208 = floor(v207 + 0.5);
    v209 = (v207 - v208) * 1.84467441e19;
    v205 = 2654435761u * (unint64_t)fmod(v208, 1.84467441e19);
    if (v209 >= 0.0)
    {
      if (v209 > 0.0)
        v205 += (unint64_t)v209;
    }
    else
    {
      v205 -= (unint64_t)fabs(v209);
    }
  }
  else
  {
    v205 = 0;
  }
  v240 = v205;
  v276 = v20;
  if ((v4 & 0x20000000000) != 0)
  {
    isNicknameMatch = self->_isNicknameMatch;
    v212 = isNicknameMatch;
    if (isNicknameMatch < 0.0)
      v212 = -isNicknameMatch;
    v213 = floor(v212 + 0.5);
    v214 = (v212 - v213) * 1.84467441e19;
    v210 = 2654435761u * (unint64_t)fmod(v213, 1.84467441e19);
    if (v214 >= 0.0)
    {
      if (v214 > 0.0)
        v210 += (unint64_t)v214;
    }
    else
    {
      v210 -= (unint64_t)fabs(v214);
    }
  }
  else
  {
    v210 = 0;
  }
  v239 = v210;
  v275 = v5;
  if ((v4 & 0x40000000000) != 0)
  {
    isNamePrefixMatch = self->_isNamePrefixMatch;
    v217 = isNamePrefixMatch;
    if (isNamePrefixMatch < 0.0)
      v217 = -isNamePrefixMatch;
    v218 = floor(v217 + 0.5);
    v219 = (v217 - v218) * 1.84467441e19;
    v215 = 2654435761u * (unint64_t)fmod(v218, 1.84467441e19);
    if (v219 >= 0.0)
    {
      if (v219 > 0.0)
        v215 += (unint64_t)v219;
    }
    else
    {
      v215 -= (unint64_t)fabs(v219);
    }
  }
  else
  {
    v215 = 0;
  }
  v274 = v35;
  if ((v4 & 0x80000000000) != 0)
  {
    isNameSuffixMatch = self->_isNameSuffixMatch;
    v224 = isNameSuffixMatch;
    if (isNameSuffixMatch < 0.0)
      v224 = -isNameSuffixMatch;
    v225 = floor(v224 + 0.5);
    v226 = (v224 - v225) * 1.84467441e19;
    v222 = 2654435761u * (unint64_t)fmod(v225, 1.84467441e19);
    v220 = v30;
    v221 = v25;
    if (v226 >= 0.0)
    {
      if (v226 > 0.0)
        v222 += (unint64_t)v226;
    }
    else
    {
      v222 -= (unint64_t)fabs(v226);
    }
  }
  else
  {
    v220 = v30;
    v221 = v25;
    v222 = 0;
  }
  v227 = v10;
  if ((v4 & 0x100000000000) != 0)
  {
    allHandlesMatched = self->_allHandlesMatched;
    v230 = allHandlesMatched;
    if (allHandlesMatched < 0.0)
      v230 = -allHandlesMatched;
    v231 = floor(v230 + 0.5);
    v232 = (v230 - v231) * 1.84467441e19;
    v228 = 2654435761u * (unint64_t)fmod(v231, 1.84467441e19);
    if (v232 >= 0.0)
    {
      if (v232 > 0.0)
        v228 += (unint64_t)v232;
    }
    else
    {
      v228 -= (unint64_t)fabs(v232);
    }
  }
  else
  {
    v228 = 0;
  }
  if ((v4 & 0x200000000000) != 0)
  {
    isRelationAlias = self->_isRelationAlias;
    v235 = isRelationAlias;
    if (isRelationAlias < 0.0)
      v235 = -isRelationAlias;
    v236 = floor(v235 + 0.5);
    v237 = (v235 - v236) * 1.84467441e19;
    v233 = 2654435761u * (unint64_t)fmod(v236, 1.84467441e19);
    if (v237 >= 0.0)
    {
      if (v237 > 0.0)
        v233 += (unint64_t)v237;
    }
    else
    {
      v233 -= (unint64_t)fabs(v237);
    }
  }
  else
  {
    v233 = 0;
  }
  return v227 ^ v275 ^ v15 ^ v276 ^ v221 ^ v220 ^ v274 ^ v273 ^ v272 ^ v271 ^ v270 ^ v269 ^ v268 ^ v267 ^ v266 ^ v265 ^ v264 ^ v263 ^ v262 ^ v261 ^ v260 ^ v259 ^ v258 ^ v257 ^ v256 ^ v255 ^ v254 ^ v253 ^ v252 ^ v251 ^ v250 ^ v249 ^ v248 ^ v247 ^ v246 ^ v245 ^ v244 ^ v243 ^ v242 ^ v241 ^ v240 ^ v239 ^ v215 ^ v222 ^ v228 ^ v233;
}

- (id)dictionaryRepresentation
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  id v7;
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
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
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
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
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v4 & 0x100000000000) != 0)
  {
    v9 = (void *)MEMORY[0x1E0CB37E8];
    -[INFERENCESchemaINFERENCEContactFeatureSet allHandlesMatched](self, "allHandlesMatched");
    objc_msgSend(v9, "numberWithFloat:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("allHandlesMatched"));

    v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
    if ((v4 & 0x1000000000) == 0)
    {
LABEL_3:
      if ((v4 & 0x800000000) == 0)
        goto LABEL_4;
      goto LABEL_51;
    }
  }
  else if ((v4 & 0x1000000000) == 0)
  {
    goto LABEL_3;
  }
  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[INFERENCESchemaINFERENCEContactFeatureSet allPrimaryNameTokensAreInQuery](self, "allPrimaryNameTokensAreInQuery");
  objc_msgSend(v11, "numberWithFloat:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("allPrimaryNameTokensAreInQuery"));

  v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v4 & 0x800000000) == 0)
  {
LABEL_4:
    if ((v4 & 0x4000) == 0)
      goto LABEL_5;
    goto LABEL_52;
  }
LABEL_51:
  v13 = (void *)MEMORY[0x1E0CB37E8];
  -[INFERENCESchemaINFERENCEContactFeatureSet allQueryMatched](self, "allQueryMatched");
  objc_msgSend(v13, "numberWithFloat:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("allQueryMatched"));

  v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x4000) == 0)
  {
LABEL_5:
    if ((v4 & 0x10000) == 0)
      goto LABEL_6;
    goto LABEL_53;
  }
LABEL_52:
  v15 = (void *)MEMORY[0x1E0CB37E8];
  -[INFERENCESchemaINFERENCEContactFeatureSet freqAnyGroup0MinTo2Min](self, "freqAnyGroup0MinTo2Min");
  objc_msgSend(v15, "numberWithFloat:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("freqAnyGroup0MinTo2Min"));

  v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x10000) == 0)
  {
LABEL_6:
    if ((v4 & 0x80000) == 0)
      goto LABEL_7;
    goto LABEL_54;
  }
LABEL_53:
  v17 = (void *)MEMORY[0x1E0CB37E8];
  -[INFERENCESchemaINFERENCEContactFeatureSet freqAnyGroup10MinTo1Hr](self, "freqAnyGroup10MinTo1Hr");
  objc_msgSend(v17, "numberWithFloat:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("freqAnyGroup10MinTo1Hr"));

  v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x80000) == 0)
  {
LABEL_7:
    if ((v4 & 0x20000) == 0)
      goto LABEL_8;
    goto LABEL_55;
  }
LABEL_54:
  v19 = (void *)MEMORY[0x1E0CB37E8];
  -[INFERENCESchemaINFERENCEContactFeatureSet freqAnyGroup1DayTo7Day](self, "freqAnyGroup1DayTo7Day");
  objc_msgSend(v19, "numberWithFloat:");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("freqAnyGroup1DayTo7Day"));

  v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x20000) == 0)
  {
LABEL_8:
    if ((v4 & 0x200000) == 0)
      goto LABEL_9;
    goto LABEL_56;
  }
LABEL_55:
  v21 = (void *)MEMORY[0x1E0CB37E8];
  -[INFERENCESchemaINFERENCEContactFeatureSet freqAnyGroup1HrTo6Hr](self, "freqAnyGroup1HrTo6Hr");
  objc_msgSend(v21, "numberWithFloat:");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("freqAnyGroup1HrTo6Hr"));

  v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x200000) == 0)
  {
LABEL_9:
    if ((v4 & 0x8000) == 0)
      goto LABEL_10;
    goto LABEL_57;
  }
LABEL_56:
  v23 = (void *)MEMORY[0x1E0CB37E8];
  -[INFERENCESchemaINFERENCEContactFeatureSet freqAnyGroup28DayToInf](self, "freqAnyGroup28DayToInf");
  objc_msgSend(v23, "numberWithFloat:");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("freqAnyGroup28DayToInf"));

  v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x8000) == 0)
  {
LABEL_10:
    if ((v4 & 0x40000) == 0)
      goto LABEL_11;
    goto LABEL_58;
  }
LABEL_57:
  v25 = (void *)MEMORY[0x1E0CB37E8];
  -[INFERENCESchemaINFERENCEContactFeatureSet freqAnyGroup2MinTo10Min](self, "freqAnyGroup2MinTo10Min");
  objc_msgSend(v25, "numberWithFloat:");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("freqAnyGroup2MinTo10Min"));

  v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x40000) == 0)
  {
LABEL_11:
    if ((v4 & 0x100000) == 0)
      goto LABEL_12;
    goto LABEL_59;
  }
LABEL_58:
  v27 = (void *)MEMORY[0x1E0CB37E8];
  -[INFERENCESchemaINFERENCEContactFeatureSet freqAnyGroup6HrTo1Day](self, "freqAnyGroup6HrTo1Day");
  objc_msgSend(v27, "numberWithFloat:");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("freqAnyGroup6HrTo1Day"));

  v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x100000) == 0)
  {
LABEL_12:
    if ((v4 & 0x400000) == 0)
      goto LABEL_13;
    goto LABEL_60;
  }
LABEL_59:
  v29 = (void *)MEMORY[0x1E0CB37E8];
  -[INFERENCESchemaINFERENCEContactFeatureSet freqAnyGroup7DayTo28Day](self, "freqAnyGroup7DayTo28Day");
  objc_msgSend(v29, "numberWithFloat:");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("freqAnyGroup7DayTo28Day"));

  v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x400000) == 0)
  {
LABEL_13:
    if ((v4 & 0x1000000) == 0)
      goto LABEL_14;
    goto LABEL_61;
  }
LABEL_60:
  v31 = (void *)MEMORY[0x1E0CB37E8];
  -[INFERENCESchemaINFERENCEContactFeatureSet freqSameGroup0MinTo2Min](self, "freqSameGroup0MinTo2Min");
  objc_msgSend(v31, "numberWithFloat:");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("freqSameGroup0MinTo2Min"));

  v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x1000000) == 0)
  {
LABEL_14:
    if ((v4 & 0x8000000) == 0)
      goto LABEL_15;
    goto LABEL_62;
  }
LABEL_61:
  v33 = (void *)MEMORY[0x1E0CB37E8];
  -[INFERENCESchemaINFERENCEContactFeatureSet freqSameGroup10MinTo1Hr](self, "freqSameGroup10MinTo1Hr");
  objc_msgSend(v33, "numberWithFloat:");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("freqSameGroup10MinTo1Hr"));

  v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x8000000) == 0)
  {
LABEL_15:
    if ((v4 & 0x2000000) == 0)
      goto LABEL_16;
    goto LABEL_63;
  }
LABEL_62:
  v35 = (void *)MEMORY[0x1E0CB37E8];
  -[INFERENCESchemaINFERENCEContactFeatureSet freqSameGroup1DayTo7Day](self, "freqSameGroup1DayTo7Day");
  objc_msgSend(v35, "numberWithFloat:");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("freqSameGroup1DayTo7Day"));

  v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x2000000) == 0)
  {
LABEL_16:
    if ((v4 & 0x20000000) == 0)
      goto LABEL_17;
    goto LABEL_64;
  }
LABEL_63:
  v37 = (void *)MEMORY[0x1E0CB37E8];
  -[INFERENCESchemaINFERENCEContactFeatureSet freqSameGroup1HrTo6Hr](self, "freqSameGroup1HrTo6Hr");
  objc_msgSend(v37, "numberWithFloat:");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, CFSTR("freqSameGroup1HrTo6Hr"));

  v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x20000000) == 0)
  {
LABEL_17:
    if ((v4 & 0x800000) == 0)
      goto LABEL_18;
    goto LABEL_65;
  }
LABEL_64:
  v39 = (void *)MEMORY[0x1E0CB37E8];
  -[INFERENCESchemaINFERENCEContactFeatureSet freqSameGroup28DayToInf](self, "freqSameGroup28DayToInf");
  objc_msgSend(v39, "numberWithFloat:");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v40, CFSTR("freqSameGroup28DayToInf"));

  v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x800000) == 0)
  {
LABEL_18:
    if ((v4 & 0x4000000) == 0)
      goto LABEL_19;
    goto LABEL_66;
  }
LABEL_65:
  v41 = (void *)MEMORY[0x1E0CB37E8];
  -[INFERENCESchemaINFERENCEContactFeatureSet freqSameGroup2MinTo10Min](self, "freqSameGroup2MinTo10Min");
  objc_msgSend(v41, "numberWithFloat:");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v42, CFSTR("freqSameGroup2MinTo10Min"));

  v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x4000000) == 0)
  {
LABEL_19:
    if ((v4 & 0x10000000) == 0)
      goto LABEL_20;
    goto LABEL_67;
  }
LABEL_66:
  v43 = (void *)MEMORY[0x1E0CB37E8];
  -[INFERENCESchemaINFERENCEContactFeatureSet freqSameGroup6HrTo1Day](self, "freqSameGroup6HrTo1Day");
  objc_msgSend(v43, "numberWithFloat:");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v44, CFSTR("freqSameGroup6HrTo1Day"));

  v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x10000000) == 0)
  {
LABEL_20:
    if ((v4 & 0x100000000) == 0)
      goto LABEL_21;
    goto LABEL_68;
  }
LABEL_67:
  v45 = (void *)MEMORY[0x1E0CB37E8];
  -[INFERENCESchemaINFERENCEContactFeatureSet freqSameGroup7DayTo28Day](self, "freqSameGroup7DayTo28Day");
  objc_msgSend(v45, "numberWithFloat:");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v46, CFSTR("freqSameGroup7DayTo28Day"));

  v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v4 & 0x100000000) == 0)
  {
LABEL_21:
    if ((v4 & 0x8000000000) == 0)
      goto LABEL_22;
    goto LABEL_69;
  }
LABEL_68:
  v47 = (void *)MEMORY[0x1E0CB37E8];
  -[INFERENCESchemaINFERENCEContactFeatureSet hasSuggestedProperties](self, "hasSuggestedProperties");
  objc_msgSend(v47, "numberWithFloat:");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v48, CFSTR("hasSuggestedProperties"));

  v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v4 & 0x8000000000) == 0)
  {
LABEL_22:
    if ((v4 & 0x100) == 0)
      goto LABEL_23;
    goto LABEL_70;
  }
LABEL_69:
  v49 = (void *)MEMORY[0x1E0CB37E8];
  -[INFERENCESchemaINFERENCEContactFeatureSet isFamilyNameMatch](self, "isFamilyNameMatch");
  objc_msgSend(v49, "numberWithFloat:");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v50, CFSTR("isFamilyNameMatch"));

  v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x100) == 0)
  {
LABEL_23:
    if ((v4 & 0x2000000000) == 0)
      goto LABEL_24;
    goto LABEL_71;
  }
LABEL_70:
  v51 = (void *)MEMORY[0x1E0CB37E8];
  -[INFERENCESchemaINFERENCEContactFeatureSet isFavorite](self, "isFavorite");
  objc_msgSend(v51, "numberWithFloat:");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v52, CFSTR("isFavorite"));

  v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v4 & 0x2000000000) == 0)
  {
LABEL_24:
    if ((v4 & 0x80) == 0)
      goto LABEL_25;
    goto LABEL_72;
  }
LABEL_71:
  v53 = (void *)MEMORY[0x1E0CB37E8];
  -[INFERENCESchemaINFERENCEContactFeatureSet isGivenNameMatch](self, "isGivenNameMatch");
  objc_msgSend(v53, "numberWithFloat:");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v54, CFSTR("isGivenNameMatch"));

  v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x80) == 0)
  {
LABEL_25:
    if ((v4 & 0x80000000) == 0)
      goto LABEL_26;
    goto LABEL_73;
  }
LABEL_72:
  v55 = (void *)MEMORY[0x1E0CB37E8];
  -[INFERENCESchemaINFERENCEContactFeatureSet isHighQualityRequestMatch](self, "isHighQualityRequestMatch");
  objc_msgSend(v55, "numberWithFloat:");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v56, CFSTR("isHighQualityRequestMatch"));

  v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x80000000) == 0)
  {
LABEL_26:
    if ((v4 & 0x200) == 0)
      goto LABEL_27;
    goto LABEL_74;
  }
LABEL_73:
  v57 = (void *)MEMORY[0x1E0CB37E8];
  -[INFERENCESchemaINFERENCEContactFeatureSet isHypocorism](self, "isHypocorism");
  objc_msgSend(v57, "numberWithFloat:");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v58, CFSTR("isHypocorism"));

  v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x200) == 0)
  {
LABEL_27:
    if ((v4 & 0x4000000000) == 0)
      goto LABEL_28;
    goto LABEL_75;
  }
LABEL_74:
  v59 = (void *)MEMORY[0x1E0CB37E8];
  -[INFERENCESchemaINFERENCEContactFeatureSet isMeCardRelation](self, "isMeCardRelation");
  objc_msgSend(v59, "numberWithFloat:");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v60, CFSTR("isMeCardRelation"));

  v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v4 & 0x4000000000) == 0)
  {
LABEL_28:
    if ((v4 & 0x40000000000) == 0)
      goto LABEL_29;
    goto LABEL_76;
  }
LABEL_75:
  v61 = (void *)MEMORY[0x1E0CB37E8];
  -[INFERENCESchemaINFERENCEContactFeatureSet isMiddleNameMatch](self, "isMiddleNameMatch");
  objc_msgSend(v61, "numberWithFloat:");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v62, CFSTR("isMiddleNameMatch"));

  v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v4 & 0x40000000000) == 0)
  {
LABEL_29:
    if ((v4 & 0x80000000000) == 0)
      goto LABEL_30;
    goto LABEL_77;
  }
LABEL_76:
  v63 = (void *)MEMORY[0x1E0CB37E8];
  -[INFERENCESchemaINFERENCEContactFeatureSet isNamePrefixMatch](self, "isNamePrefixMatch");
  objc_msgSend(v63, "numberWithFloat:");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v64, CFSTR("isNamePrefixMatch"));

  v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v4 & 0x80000000000) == 0)
  {
LABEL_30:
    if ((v4 & 0x20000000000) == 0)
      goto LABEL_31;
    goto LABEL_78;
  }
LABEL_77:
  v65 = (void *)MEMORY[0x1E0CB37E8];
  -[INFERENCESchemaINFERENCEContactFeatureSet isNameSuffixMatch](self, "isNameSuffixMatch");
  objc_msgSend(v65, "numberWithFloat:");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v66, CFSTR("isNameSuffixMatch"));

  v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v4 & 0x20000000000) == 0)
  {
LABEL_31:
    if ((v4 & 0x10000000000) == 0)
      goto LABEL_32;
    goto LABEL_79;
  }
LABEL_78:
  v67 = (void *)MEMORY[0x1E0CB37E8];
  -[INFERENCESchemaINFERENCEContactFeatureSet isNicknameMatch](self, "isNicknameMatch");
  objc_msgSend(v67, "numberWithFloat:");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v68, CFSTR("isNicknameMatch"));

  v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v4 & 0x10000000000) == 0)
  {
LABEL_32:
    if ((v4 & 0x200000000) == 0)
      goto LABEL_33;
    goto LABEL_80;
  }
LABEL_79:
  v69 = (void *)MEMORY[0x1E0CB37E8];
  -[INFERENCESchemaINFERENCEContactFeatureSet isOrganizationNameMatch](self, "isOrganizationNameMatch");
  objc_msgSend(v69, "numberWithFloat:");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v70, CFSTR("isOrganizationNameMatch"));

  v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v4 & 0x200000000) == 0)
  {
LABEL_33:
    if ((v4 & 1) == 0)
      goto LABEL_34;
    goto LABEL_81;
  }
LABEL_80:
  v71 = (void *)MEMORY[0x1E0CB37E8];
  -[INFERENCESchemaINFERENCEContactFeatureSet isPartialNameMatch](self, "isPartialNameMatch");
  objc_msgSend(v71, "numberWithFloat:");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v72, CFSTR("isPartialNameMatch"));

  v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 1) == 0)
  {
LABEL_34:
    if ((v4 & 2) == 0)
      goto LABEL_35;
    goto LABEL_82;
  }
LABEL_81:
  v73 = (void *)MEMORY[0x1E0CB37E8];
  -[INFERENCESchemaINFERENCEContactFeatureSet isRecent](self, "isRecent");
  objc_msgSend(v73, "numberWithFloat:");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v74, CFSTR("isRecent"));

  v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 2) == 0)
  {
LABEL_35:
    if ((v4 & 4) == 0)
      goto LABEL_36;
    goto LABEL_83;
  }
LABEL_82:
  v75 = (void *)MEMORY[0x1E0CB37E8];
  -[INFERENCESchemaINFERENCEContactFeatureSet isRecentInSameDomain](self, "isRecentInSameDomain");
  objc_msgSend(v75, "numberWithFloat:");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v76, CFSTR("isRecentInSameDomain"));

  v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 4) == 0)
  {
LABEL_36:
    if ((v4 & 8) == 0)
      goto LABEL_37;
    goto LABEL_84;
  }
LABEL_83:
  v77 = (void *)MEMORY[0x1E0CB37E8];
  -[INFERENCESchemaINFERENCEContactFeatureSet isRecentInSiriRequest](self, "isRecentInSiriRequest");
  objc_msgSend(v77, "numberWithFloat:");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v78, CFSTR("isRecentInSiriRequest"));

  v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 8) == 0)
  {
LABEL_37:
    if ((v4 & 0x200000000000) == 0)
      goto LABEL_38;
    goto LABEL_85;
  }
LABEL_84:
  v79 = (void *)MEMORY[0x1E0CB37E8];
  -[INFERENCESchemaINFERENCEContactFeatureSet isRecentlyCorrected](self, "isRecentlyCorrected");
  objc_msgSend(v79, "numberWithFloat:");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v80, CFSTR("isRecentlyCorrected"));

  v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v4 & 0x200000000000) == 0)
  {
LABEL_38:
    if ((v4 & 0x40000000) == 0)
      goto LABEL_39;
    goto LABEL_86;
  }
LABEL_85:
  v81 = (void *)MEMORY[0x1E0CB37E8];
  -[INFERENCESchemaINFERENCEContactFeatureSet isRelationAlias](self, "isRelationAlias");
  objc_msgSend(v81, "numberWithFloat:");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v82, CFSTR("isRelationAlias"));

  v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x40000000) == 0)
  {
LABEL_39:
    if ((v4 & 0x400) == 0)
      goto LABEL_40;
    goto LABEL_87;
  }
LABEL_86:
  v83 = (void *)MEMORY[0x1E0CB37E8];
  -[INFERENCESchemaINFERENCEContactFeatureSet isSuggested](self, "isSuggested");
  objc_msgSend(v83, "numberWithFloat:");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v84, CFSTR("isSuggested"));

  v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x400) == 0)
  {
LABEL_40:
    if ((v4 & 0x400000000) == 0)
      goto LABEL_41;
    goto LABEL_88;
  }
LABEL_87:
  v85 = (void *)MEMORY[0x1E0CB37E8];
  -[INFERENCESchemaINFERENCEContactFeatureSet isWeakOrganizationMatch](self, "isWeakOrganizationMatch");
  objc_msgSend(v85, "numberWithFloat:");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v86, CFSTR("isWeakOrganizationMatch"));

  v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v4 & 0x400000000) == 0)
  {
LABEL_41:
    if ((v4 & 0x10) == 0)
      goto LABEL_42;
    goto LABEL_89;
  }
LABEL_88:
  v87 = (void *)MEMORY[0x1E0CB37E8];
  -[INFERENCESchemaINFERENCEContactFeatureSet numPrimaryTokens](self, "numPrimaryTokens");
  objc_msgSend(v87, "numberWithFloat:");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v88, CFSTR("numPrimaryTokens"));

  LODWORD(v4) = self->_has;
  if ((v4 & 0x10) == 0)
  {
LABEL_42:
    if ((v4 & 0x20) == 0)
      goto LABEL_43;
    goto LABEL_90;
  }
LABEL_89:
  v89 = (void *)MEMORY[0x1E0CB37E8];
  -[INFERENCESchemaINFERENCEContactFeatureSet recencyRank](self, "recencyRank");
  objc_msgSend(v89, "numberWithFloat:");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v90, CFSTR("recencyRank"));

  LODWORD(v4) = self->_has;
  if ((v4 & 0x20) == 0)
  {
LABEL_43:
    if ((v4 & 0x40) == 0)
      goto LABEL_44;
    goto LABEL_91;
  }
LABEL_90:
  v91 = (void *)MEMORY[0x1E0CB37E8];
  -[INFERENCESchemaINFERENCEContactFeatureSet recencyRankInSameDomain](self, "recencyRankInSameDomain");
  objc_msgSend(v91, "numberWithFloat:");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v92, CFSTR("recencyRankInSameDomain"));

  LODWORD(v4) = self->_has;
  if ((v4 & 0x40) == 0)
  {
LABEL_44:
    if ((v4 & 0x2000) == 0)
      goto LABEL_45;
    goto LABEL_92;
  }
LABEL_91:
  v93 = (void *)MEMORY[0x1E0CB37E8];
  -[INFERENCESchemaINFERENCEContactFeatureSet recencyRankInSiriRequest](self, "recencyRankInSiriRequest");
  objc_msgSend(v93, "numberWithFloat:");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v94, CFSTR("recencyRankInSiriRequest"));

  LODWORD(v4) = self->_has;
  if ((v4 & 0x2000) == 0)
  {
LABEL_45:
    if ((v4 & 0x800) == 0)
      goto LABEL_46;
LABEL_93:
    v97 = (void *)MEMORY[0x1E0CB37E8];
    -[INFERENCESchemaINFERENCEContactFeatureSet speechAlternativeRanksGivenNameRank](self, "speechAlternativeRanksGivenNameRank");
    objc_msgSend(v97, "numberWithFloat:");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v98, CFSTR("speechAlternativeRanksGivenNameRank"));

    if ((*(_DWORD *)&self->_has & 0x1000) == 0)
      goto LABEL_48;
    goto LABEL_47;
  }
LABEL_92:
  v95 = (void *)MEMORY[0x1E0CB37E8];
  -[INFERENCESchemaINFERENCEContactFeatureSet speechAlternativeRanksFamilyNameRank](self, "speechAlternativeRanksFamilyNameRank");
  objc_msgSend(v95, "numberWithFloat:");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v96, CFSTR("speechAlternativeRanksFamilyNameRank"));

  LODWORD(v4) = self->_has;
  if ((v4 & 0x800) != 0)
    goto LABEL_93;
LABEL_46:
  if ((v4 & 0x1000) != 0)
  {
LABEL_47:
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[INFERENCESchemaINFERENCEContactFeatureSet speechAlternativeRanksMiddleNameRank](self, "speechAlternativeRanksMiddleNameRank");
    objc_msgSend(v5, "numberWithFloat:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("speechAlternativeRanksMiddleNameRank"));

  }
LABEL_48:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  v7 = v3;

  return v7;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[INFERENCESchemaINFERENCEContactFeatureSet dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (INFERENCESchemaINFERENCEContactFeatureSet)initWithJSON:(id)a3
{
  void *v4;
  INFERENCESchemaINFERENCEContactFeatureSet *v5;
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
    self = -[INFERENCESchemaINFERENCEContactFeatureSet initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (INFERENCESchemaINFERENCEContactFeatureSet)initWithDictionary:(id)a3
{
  id v4;
  INFERENCESchemaINFERENCEContactFeatureSet *v5;
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
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  INFERENCESchemaINFERENCEContactFeatureSet *v59;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
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
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  objc_super v100;

  v4 = a3;
  v100.receiver = self;
  v100.super_class = (Class)INFERENCESchemaINFERENCEContactFeatureSet;
  v5 = -[INFERENCESchemaINFERENCEContactFeatureSet init](&v100, sel_init);

  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isRecent"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "floatValue");
      -[INFERENCESchemaINFERENCEContactFeatureSet setIsRecent:](v5, "setIsRecent:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isRecentInSameDomain"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "floatValue");
      -[INFERENCESchemaINFERENCEContactFeatureSet setIsRecentInSameDomain:](v5, "setIsRecentInSameDomain:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isRecentInSiriRequest"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "floatValue");
      -[INFERENCESchemaINFERENCEContactFeatureSet setIsRecentInSiriRequest:](v5, "setIsRecentInSiriRequest:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isRecentlyCorrected"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "floatValue");
      -[INFERENCESchemaINFERENCEContactFeatureSet setIsRecentlyCorrected:](v5, "setIsRecentlyCorrected:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recencyRank"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v10, "floatValue");
      -[INFERENCESchemaINFERENCEContactFeatureSet setRecencyRank:](v5, "setRecencyRank:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recencyRankInSameDomain"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v11, "floatValue");
      -[INFERENCESchemaINFERENCEContactFeatureSet setRecencyRankInSameDomain:](v5, "setRecencyRankInSameDomain:");
    }
    v80 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recencyRankInSiriRequest"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v12, "floatValue");
      -[INFERENCESchemaINFERENCEContactFeatureSet setRecencyRankInSiriRequest:](v5, "setRecencyRankInSiriRequest:");
    }
    v74 = v12;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isHighQualityRequestMatch"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v99 = v13;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v13, "floatValue");
      -[INFERENCESchemaINFERENCEContactFeatureSet setIsHighQualityRequestMatch:](v5, "setIsHighQualityRequestMatch:");
    }
    v14 = v10;
    v79 = v7;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isFavorite"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v15, "floatValue");
      -[INFERENCESchemaINFERENCEContactFeatureSet setIsFavorite:](v5, "setIsFavorite:");
    }
    v16 = v9;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isMeCardRelation"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v98 = v17;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v17, "floatValue");
      -[INFERENCESchemaINFERENCEContactFeatureSet setIsMeCardRelation:](v5, "setIsMeCardRelation:");
    }
    v18 = v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isWeakOrganizationMatch"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v19, "floatValue");
      -[INFERENCESchemaINFERENCEContactFeatureSet setIsWeakOrganizationMatch:](v5, "setIsWeakOrganizationMatch:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("speechAlternativeRanksGivenNameRank"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v97 = v20;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v20, "floatValue");
      -[INFERENCESchemaINFERENCEContactFeatureSet setSpeechAlternativeRanksGivenNameRank:](v5, "setSpeechAlternativeRanksGivenNameRank:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("speechAlternativeRanksMiddleNameRank"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v21, "floatValue");
      -[INFERENCESchemaINFERENCEContactFeatureSet setSpeechAlternativeRanksMiddleNameRank:](v5, "setSpeechAlternativeRanksMiddleNameRank:");
    }
    v71 = v21;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("speechAlternativeRanksFamilyNameRank"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v96 = v22;
    v78 = v18;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v22, "floatValue");
      -[INFERENCESchemaINFERENCEContactFeatureSet setSpeechAlternativeRanksFamilyNameRank:](v5, "setSpeechAlternativeRanksFamilyNameRank:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("freqAnyGroup0MinTo2Min"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v95 = v23;
    v77 = v16;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v23, "floatValue");
      -[INFERENCESchemaINFERENCEContactFeatureSet setFreqAnyGroup0MinTo2Min:](v5, "setFreqAnyGroup0MinTo2Min:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("freqAnyGroup2MinTo10Min"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v94 = v24;
    v76 = v14;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v24, "floatValue");
      -[INFERENCESchemaINFERENCEContactFeatureSet setFreqAnyGroup2MinTo10Min:](v5, "setFreqAnyGroup2MinTo10Min:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("freqAnyGroup10MinTo1Hr"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v93 = v25;
    v75 = v11;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v25, "floatValue");
      -[INFERENCESchemaINFERENCEContactFeatureSet setFreqAnyGroup10MinTo1Hr:](v5, "setFreqAnyGroup10MinTo1Hr:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("freqAnyGroup1HrTo6Hr"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v26, "floatValue");
      -[INFERENCESchemaINFERENCEContactFeatureSet setFreqAnyGroup1HrTo6Hr:](v5, "setFreqAnyGroup1HrTo6Hr:");
    }
    v70 = v26;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("freqAnyGroup6HrTo1Day"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v92 = v27;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v27, "floatValue");
      -[INFERENCESchemaINFERENCEContactFeatureSet setFreqAnyGroup6HrTo1Day:](v5, "setFreqAnyGroup6HrTo1Day:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("freqAnyGroup1DayTo7Day"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v28, "floatValue");
      -[INFERENCESchemaINFERENCEContactFeatureSet setFreqAnyGroup1DayTo7Day:](v5, "setFreqAnyGroup1DayTo7Day:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("freqAnyGroup7DayTo28Day"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v91 = v29;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v29, "floatValue");
      -[INFERENCESchemaINFERENCEContactFeatureSet setFreqAnyGroup7DayTo28Day:](v5, "setFreqAnyGroup7DayTo28Day:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("freqAnyGroup28DayToInf"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v30, "floatValue");
      -[INFERENCESchemaINFERENCEContactFeatureSet setFreqAnyGroup28DayToInf:](v5, "setFreqAnyGroup28DayToInf:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("freqSameGroup0MinTo2Min"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v90 = v31;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v31, "floatValue");
      -[INFERENCESchemaINFERENCEContactFeatureSet setFreqSameGroup0MinTo2Min:](v5, "setFreqSameGroup0MinTo2Min:");
    }
    v32 = v28;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("freqSameGroup2MinTo10Min"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v33, "floatValue");
      -[INFERENCESchemaINFERENCEContactFeatureSet setFreqSameGroup2MinTo10Min:](v5, "setFreqSameGroup2MinTo10Min:");
    }
    v34 = v19;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("freqSameGroup10MinTo1Hr"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v89 = v35;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v35, "floatValue");
      -[INFERENCESchemaINFERENCEContactFeatureSet setFreqSameGroup10MinTo1Hr:](v5, "setFreqSameGroup10MinTo1Hr:");
    }
    v36 = v15;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("freqSameGroup1HrTo6Hr"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v37, "floatValue");
      -[INFERENCESchemaINFERENCEContactFeatureSet setFreqSameGroup1HrTo6Hr:](v5, "setFreqSameGroup1HrTo6Hr:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("freqSameGroup6HrTo1Day"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v88 = v38;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v38, "floatValue");
      -[INFERENCESchemaINFERENCEContactFeatureSet setFreqSameGroup6HrTo1Day:](v5, "setFreqSameGroup6HrTo1Day:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("freqSameGroup1DayTo7Day"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v87 = v39;
    v73 = v36;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v39, "floatValue");
      -[INFERENCESchemaINFERENCEContactFeatureSet setFreqSameGroup1DayTo7Day:](v5, "setFreqSameGroup1DayTo7Day:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("freqSameGroup7DayTo28Day"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v86 = v40;
    v72 = v34;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v40, "floatValue");
      -[INFERENCESchemaINFERENCEContactFeatureSet setFreqSameGroup7DayTo28Day:](v5, "setFreqSameGroup7DayTo28Day:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("freqSameGroup28DayToInf"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v85 = v41;
    v69 = v32;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v41, "floatValue");
      -[INFERENCESchemaINFERENCEContactFeatureSet setFreqSameGroup28DayToInf:](v5, "setFreqSameGroup28DayToInf:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isSuggested"));
    v42 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v84 = (void *)v42;
    v43 = v30;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v84, "floatValue");
      -[INFERENCESchemaINFERENCEContactFeatureSet setIsSuggested:](v5, "setIsSuggested:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isHypocorism"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v44, "floatValue");
      -[INFERENCESchemaINFERENCEContactFeatureSet setIsHypocorism:](v5, "setIsHypocorism:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasSuggestedProperties"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v83 = v45;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v45, "floatValue");
      -[INFERENCESchemaINFERENCEContactFeatureSet setHasSuggestedProperties:](v5, "setHasSuggestedProperties:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isPartialNameMatch"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v46, "floatValue");
      -[INFERENCESchemaINFERENCEContactFeatureSet setIsPartialNameMatch:](v5, "setIsPartialNameMatch:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numPrimaryTokens"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v82 = v47;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v47, "floatValue");
      -[INFERENCESchemaINFERENCEContactFeatureSet setNumPrimaryTokens:](v5, "setNumPrimaryTokens:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("allQueryMatched"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v48, "floatValue");
      -[INFERENCESchemaINFERENCEContactFeatureSet setAllQueryMatched:](v5, "setAllQueryMatched:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("allPrimaryNameTokensAreInQuery"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v81 = v49;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v49, "floatValue");
      -[INFERENCESchemaINFERENCEContactFeatureSet setAllPrimaryNameTokensAreInQuery:](v5, "setAllPrimaryNameTokensAreInQuery:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isGivenNameMatch"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v50, "floatValue");
      -[INFERENCESchemaINFERENCEContactFeatureSet setIsGivenNameMatch:](v5, "setIsGivenNameMatch:");
    }
    v65 = v44;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isMiddleNameMatch"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v51, "floatValue");
      -[INFERENCESchemaINFERENCEContactFeatureSet setIsMiddleNameMatch:](v5, "setIsMiddleNameMatch:");
    }
    v64 = v46;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isFamilyNameMatch"), v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v52, "floatValue");
      -[INFERENCESchemaINFERENCEContactFeatureSet setIsFamilyNameMatch:](v5, "setIsFamilyNameMatch:");
    }
    v63 = v48;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isOrganizationNameMatch"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v53, "floatValue");
      -[INFERENCESchemaINFERENCEContactFeatureSet setIsOrganizationNameMatch:](v5, "setIsOrganizationNameMatch:");
    }
    v62 = v50;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isNicknameMatch"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v54, "floatValue");
      -[INFERENCESchemaINFERENCEContactFeatureSet setIsNicknameMatch:](v5, "setIsNicknameMatch:");
    }
    v68 = v43;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isNamePrefixMatch"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v55, "floatValue");
      -[INFERENCESchemaINFERENCEContactFeatureSet setIsNamePrefixMatch:](v5, "setIsNamePrefixMatch:");
    }
    v67 = v33;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isNameSuffixMatch"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v56, "floatValue");
      -[INFERENCESchemaINFERENCEContactFeatureSet setIsNameSuffixMatch:](v5, "setIsNameSuffixMatch:");
    }
    v66 = v37;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("allHandlesMatched"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v57, "floatValue");
      -[INFERENCESchemaINFERENCEContactFeatureSet setAllHandlesMatched:](v5, "setAllHandlesMatched:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isRelationAlias"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v58, "floatValue");
      -[INFERENCESchemaINFERENCEContactFeatureSet setIsRelationAlias:](v5, "setIsRelationAlias:");
    }
    v59 = v5;

  }
  return v5;
}

- (float)isRecent
{
  return self->_isRecent;
}

- (float)isRecentInSameDomain
{
  return self->_isRecentInSameDomain;
}

- (float)isRecentInSiriRequest
{
  return self->_isRecentInSiriRequest;
}

- (float)isRecentlyCorrected
{
  return self->_isRecentlyCorrected;
}

- (float)recencyRank
{
  return self->_recencyRank;
}

- (float)recencyRankInSameDomain
{
  return self->_recencyRankInSameDomain;
}

- (float)recencyRankInSiriRequest
{
  return self->_recencyRankInSiriRequest;
}

- (float)isHighQualityRequestMatch
{
  return self->_isHighQualityRequestMatch;
}

- (float)isFavorite
{
  return self->_isFavorite;
}

- (float)isMeCardRelation
{
  return self->_isMeCardRelation;
}

- (float)isWeakOrganizationMatch
{
  return self->_isWeakOrganizationMatch;
}

- (float)speechAlternativeRanksGivenNameRank
{
  return self->_speechAlternativeRanksGivenNameRank;
}

- (float)speechAlternativeRanksMiddleNameRank
{
  return self->_speechAlternativeRanksMiddleNameRank;
}

- (float)speechAlternativeRanksFamilyNameRank
{
  return self->_speechAlternativeRanksFamilyNameRank;
}

- (float)freqAnyGroup0MinTo2Min
{
  return self->_freqAnyGroup0MinTo2Min;
}

- (float)freqAnyGroup2MinTo10Min
{
  return self->_freqAnyGroup2MinTo10Min;
}

- (float)freqAnyGroup10MinTo1Hr
{
  return self->_freqAnyGroup10MinTo1Hr;
}

- (float)freqAnyGroup1HrTo6Hr
{
  return self->_freqAnyGroup1HrTo6Hr;
}

- (float)freqAnyGroup6HrTo1Day
{
  return self->_freqAnyGroup6HrTo1Day;
}

- (float)freqAnyGroup1DayTo7Day
{
  return self->_freqAnyGroup1DayTo7Day;
}

- (float)freqAnyGroup7DayTo28Day
{
  return self->_freqAnyGroup7DayTo28Day;
}

- (float)freqAnyGroup28DayToInf
{
  return self->_freqAnyGroup28DayToInf;
}

- (float)freqSameGroup0MinTo2Min
{
  return self->_freqSameGroup0MinTo2Min;
}

- (float)freqSameGroup2MinTo10Min
{
  return self->_freqSameGroup2MinTo10Min;
}

- (float)freqSameGroup10MinTo1Hr
{
  return self->_freqSameGroup10MinTo1Hr;
}

- (float)freqSameGroup1HrTo6Hr
{
  return self->_freqSameGroup1HrTo6Hr;
}

- (float)freqSameGroup6HrTo1Day
{
  return self->_freqSameGroup6HrTo1Day;
}

- (float)freqSameGroup1DayTo7Day
{
  return self->_freqSameGroup1DayTo7Day;
}

- (float)freqSameGroup7DayTo28Day
{
  return self->_freqSameGroup7DayTo28Day;
}

- (float)freqSameGroup28DayToInf
{
  return self->_freqSameGroup28DayToInf;
}

- (float)isSuggested
{
  return self->_isSuggested;
}

- (float)isHypocorism
{
  return self->_isHypocorism;
}

- (float)hasSuggestedProperties
{
  return self->_hasSuggestedProperties;
}

- (float)isPartialNameMatch
{
  return self->_isPartialNameMatch;
}

- (float)numPrimaryTokens
{
  return self->_numPrimaryTokens;
}

- (float)allQueryMatched
{
  return self->_allQueryMatched;
}

- (float)allPrimaryNameTokensAreInQuery
{
  return self->_allPrimaryNameTokensAreInQuery;
}

- (float)isGivenNameMatch
{
  return self->_isGivenNameMatch;
}

- (float)isMiddleNameMatch
{
  return self->_isMiddleNameMatch;
}

- (float)isFamilyNameMatch
{
  return self->_isFamilyNameMatch;
}

- (float)isOrganizationNameMatch
{
  return self->_isOrganizationNameMatch;
}

- (float)isNicknameMatch
{
  return self->_isNicknameMatch;
}

- (float)isNamePrefixMatch
{
  return self->_isNamePrefixMatch;
}

- (float)isNameSuffixMatch
{
  return self->_isNameSuffixMatch;
}

- (float)allHandlesMatched
{
  return self->_allHandlesMatched;
}

- (float)isRelationAlias
{
  return self->_isRelationAlias;
}

@end
