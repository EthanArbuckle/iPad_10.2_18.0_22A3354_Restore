@implementation INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setRelativeAppUsage1Day:(int)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_relativeAppUsage1Day = a3;
}

- (BOOL)hasRelativeAppUsage1Day
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setHasRelativeAppUsage1Day:(BOOL)a3
{
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFFFFFE | a3;
}

- (void)deleteRelativeAppUsage1Day
{
  -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setRelativeAppUsage1Day:](self, "setRelativeAppUsage1Day:", 0);
  *(_DWORD *)&self->_has &= ~1u;
}

- (void)setRelativeAppUsage7Day:(int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_relativeAppUsage7Day = a3;
}

- (BOOL)hasRelativeAppUsage7Day
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 1) & 1;
}

- (void)setHasRelativeAppUsage7Day:(BOOL)a3
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

- (void)deleteRelativeAppUsage7Day
{
  $36A3CCAAE4681EBA138F0132699ACCCC v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setRelativeAppUsage7Day:](self, "setRelativeAppUsage7Day:", 0);
  v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  v4 = *(_QWORD *)&v3 & 0xFFFFFFFFFFFFFFFDLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xFFFFFFFD;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setRelativeAppUsage14Day:(int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_relativeAppUsage14Day = a3;
}

- (BOOL)hasRelativeAppUsage14Day
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 2) & 1;
}

- (void)setHasRelativeAppUsage14Day:(BOOL)a3
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

- (void)deleteRelativeAppUsage14Day
{
  $36A3CCAAE4681EBA138F0132699ACCCC v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setRelativeAppUsage14Day:](self, "setRelativeAppUsage14Day:", 0);
  v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  v4 = *(_QWORD *)&v3 & 0xFFFFFFFFFFFFFFFBLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xFFFFFFFB;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setEntityAbsoluteCount2Min:(int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_entityAbsoluteCount2Min = a3;
}

- (BOOL)hasEntityAbsoluteCount2Min
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 3) & 1;
}

- (void)setHasEntityAbsoluteCount2Min:(BOOL)a3
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

- (void)deleteEntityAbsoluteCount2Min
{
  $36A3CCAAE4681EBA138F0132699ACCCC v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setEntityAbsoluteCount2Min:](self, "setEntityAbsoluteCount2Min:", 0);
  v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  v4 = *(_QWORD *)&v3 & 0xFFFFFFFFFFFFFFF7 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xFFFFFFF7;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setEntityAbsoluteCount10Min:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_entityAbsoluteCount10Min = a3;
}

- (BOOL)hasEntityAbsoluteCount10Min
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 4) & 1;
}

- (void)setHasEntityAbsoluteCount10Min:(BOOL)a3
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

- (void)deleteEntityAbsoluteCount10Min
{
  $36A3CCAAE4681EBA138F0132699ACCCC v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setEntityAbsoluteCount10Min:](self, "setEntityAbsoluteCount10Min:", 0);
  v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  v4 = *(_QWORD *)&v3 & 0xFFFFFFFFFFFFFFEFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xFFFFFFEF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setEntityAbsoluteCount1Hr:(int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_entityAbsoluteCount1Hr = a3;
}

- (BOOL)hasEntityAbsoluteCount1Hr
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 5) & 1;
}

- (void)setHasEntityAbsoluteCount1Hr:(BOOL)a3
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

- (void)deleteEntityAbsoluteCount1Hr
{
  $36A3CCAAE4681EBA138F0132699ACCCC v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setEntityAbsoluteCount1Hr:](self, "setEntityAbsoluteCount1Hr:", 0);
  v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  v4 = *(_QWORD *)&v3 & 0xFFFFFFFFFFFFFFDFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xFFFFFFDF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setEntityAbsoluteCount6Hr:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_entityAbsoluteCount6Hr = a3;
}

- (BOOL)hasEntityAbsoluteCount6Hr
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 6) & 1;
}

- (void)setHasEntityAbsoluteCount6Hr:(BOOL)a3
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

- (void)deleteEntityAbsoluteCount6Hr
{
  $36A3CCAAE4681EBA138F0132699ACCCC v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setEntityAbsoluteCount6Hr:](self, "setEntityAbsoluteCount6Hr:", 0);
  v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  v4 = *(_QWORD *)&v3 & 0xFFFFFFFFFFFFFFBFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xFFFFFFBF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setEntityAbsoluteCount1Day:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_entityAbsoluteCount1Day = a3;
}

- (BOOL)hasEntityAbsoluteCount1Day
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 7) & 1;
}

- (void)setHasEntityAbsoluteCount1Day:(BOOL)a3
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

- (void)deleteEntityAbsoluteCount1Day
{
  $36A3CCAAE4681EBA138F0132699ACCCC v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setEntityAbsoluteCount1Day:](self, "setEntityAbsoluteCount1Day:", 0);
  v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  v4 = *(_QWORD *)&v3 & 0xFFFFFFFFFFFFFF7FLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xFFFFFF7F;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setEntityAbsoluteCount7Day:(int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_entityAbsoluteCount7Day = a3;
}

- (BOOL)hasEntityAbsoluteCount7Day
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 8) & 1;
}

- (void)setHasEntityAbsoluteCount7Day:(BOOL)a3
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

- (void)deleteEntityAbsoluteCount7Day
{
  $36A3CCAAE4681EBA138F0132699ACCCC v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setEntityAbsoluteCount7Day:](self, "setEntityAbsoluteCount7Day:", 0);
  v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  v4 = *(_QWORD *)&v3 & 0xFFFFFFFFFFFFFEFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xFFFFFEFF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setEntityAbsoluteCount14Day:(int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_entityAbsoluteCount14Day = a3;
}

- (BOOL)hasEntityAbsoluteCount14Day
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 9) & 1;
}

- (void)setHasEntityAbsoluteCount14Day:(BOOL)a3
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

- (void)deleteEntityAbsoluteCount14Day
{
  $36A3CCAAE4681EBA138F0132699ACCCC v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setEntityAbsoluteCount14Day:](self, "setEntityAbsoluteCount14Day:", 0);
  v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  v4 = *(_QWORD *)&v3 & 0xFFFFFFFFFFFFFDFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xFFFFFDFF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setEntityAbsoluteCount28Day:(int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_entityAbsoluteCount28Day = a3;
}

- (BOOL)hasEntityAbsoluteCount28Day
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 10) & 1;
}

- (void)setHasEntityAbsoluteCount28Day:(BOOL)a3
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

- (void)deleteEntityAbsoluteCount28Day
{
  $36A3CCAAE4681EBA138F0132699ACCCC v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setEntityAbsoluteCount28Day:](self, "setEntityAbsoluteCount28Day:", 0);
  v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  v4 = *(_QWORD *)&v3 & 0xFFFFFFFFFFFFFBFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xFFFFFBFF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setEntityRecency:(int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_entityRecency = a3;
}

- (BOOL)hasEntityRecency
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 11) & 1;
}

- (void)setHasEntityRecency:(BOOL)a3
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

- (void)deleteEntityRecency
{
  $36A3CCAAE4681EBA138F0132699ACCCC v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setEntityRecency:](self, "setEntityRecency:", 0);
  v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  v4 = *(_QWORD *)&v3 & 0xFFFFFFFFFFFFF7FFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xFFFFF7FF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setMediaUserContextNumberOfLibraryItems:(int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_mediaUserContextNumberOfLibraryItems = a3;
}

- (BOOL)hasMediaUserContextNumberOfLibraryItems
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 12) & 1;
}

- (void)setHasMediaUserContextNumberOfLibraryItems:(BOOL)a3
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

- (void)deleteMediaUserContextNumberOfLibraryItems
{
  $36A3CCAAE4681EBA138F0132699ACCCC v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setMediaUserContextNumberOfLibraryItems:](self, "setMediaUserContextNumberOfLibraryItems:", 0);
  v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  v4 = *(_QWORD *)&v3 & 0xFFFFFFFFFFFFEFFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xFFFFEFFF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setMediaUserContextSubscriptionStatus:(int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_mediaUserContextSubscriptionStatus = a3;
}

- (BOOL)hasMediaUserContextSubscriptionStatus
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 13) & 1;
}

- (void)setHasMediaUserContextSubscriptionStatus:(BOOL)a3
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

- (void)deleteMediaUserContextSubscriptionStatus
{
  $36A3CCAAE4681EBA138F0132699ACCCC v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setMediaUserContextSubscriptionStatus:](self, "setMediaUserContextSubscriptionStatus:", 0);
  v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  v4 = *(_QWORD *)&v3 & 0xFFFFFFFFFFFFDFFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xFFFFDFFF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setIsLastForegroundApp:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_isLastForegroundApp = a3;
}

- (BOOL)hasIsLastForegroundApp
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 14) & 1;
}

- (void)setHasIsLastForegroundApp:(BOOL)a3
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

- (void)deleteIsLastForegroundApp
{
  $36A3CCAAE4681EBA138F0132699ACCCC v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setIsLastForegroundApp:](self, "setIsLastForegroundApp:", 0);
  v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  v4 = *(_QWORD *)&v3 & 0xFFFFFFFFFFFFBFFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xFFFFBFFF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setIsLastNowPlayingApp:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_isLastNowPlayingApp = a3;
}

- (BOOL)hasIsLastNowPlayingApp
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 15) & 1;
}

- (void)setHasIsLastNowPlayingApp:(BOOL)a3
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

- (void)deleteIsLastNowPlayingApp
{
  $36A3CCAAE4681EBA138F0132699ACCCC v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setIsLastNowPlayingApp:](self, "setIsLastNowPlayingApp:", 0);
  v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  v4 = *(_QWORD *)&v3 & 0xFFFFFFFFFFFF7FFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xFFFF7FFF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setNowPlayingAbsoluteCount2Min:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_nowPlayingAbsoluteCount2Min = a3;
}

- (BOOL)hasNowPlayingAbsoluteCount2Min
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 16) & 1;
}

- (void)setHasNowPlayingAbsoluteCount2Min:(BOOL)a3
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

- (void)deleteNowPlayingAbsoluteCount2Min
{
  $36A3CCAAE4681EBA138F0132699ACCCC v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setNowPlayingAbsoluteCount2Min:](self, "setNowPlayingAbsoluteCount2Min:", 0);
  v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  v4 = *(_QWORD *)&v3 & 0xFFFFFFFFFFFEFFFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xFFFEFFFF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setNowPlayingAbsoluteCount10Min:(int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_nowPlayingAbsoluteCount10Min = a3;
}

- (BOOL)hasNowPlayingAbsoluteCount10Min
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 17) & 1;
}

- (void)setHasNowPlayingAbsoluteCount10Min:(BOOL)a3
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

- (void)deleteNowPlayingAbsoluteCount10Min
{
  $36A3CCAAE4681EBA138F0132699ACCCC v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setNowPlayingAbsoluteCount10Min:](self, "setNowPlayingAbsoluteCount10Min:", 0);
  v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  v4 = *(_QWORD *)&v3 & 0xFFFFFFFFFFFDFFFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xFFFDFFFF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setNowPlayingAbsoluteCount1Hr:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_nowPlayingAbsoluteCount1Hr = a3;
}

- (BOOL)hasNowPlayingAbsoluteCount1Hr
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 18) & 1;
}

- (void)setHasNowPlayingAbsoluteCount1Hr:(BOOL)a3
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

- (void)deleteNowPlayingAbsoluteCount1Hr
{
  $36A3CCAAE4681EBA138F0132699ACCCC v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setNowPlayingAbsoluteCount1Hr:](self, "setNowPlayingAbsoluteCount1Hr:", 0);
  v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  v4 = *(_QWORD *)&v3 & 0xFFFFFFFFFFFBFFFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xFFFBFFFF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setNowPlayingAbsoluteCount6Hr:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_nowPlayingAbsoluteCount6Hr = a3;
}

- (BOOL)hasNowPlayingAbsoluteCount6Hr
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 19) & 1;
}

- (void)setHasNowPlayingAbsoluteCount6Hr:(BOOL)a3
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

- (void)deleteNowPlayingAbsoluteCount6Hr
{
  $36A3CCAAE4681EBA138F0132699ACCCC v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setNowPlayingAbsoluteCount6Hr:](self, "setNowPlayingAbsoluteCount6Hr:", 0);
  v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  v4 = *(_QWORD *)&v3 & 0xFFFFFFFFFFF7FFFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xFFF7FFFF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setNowPlayingAbsoluteCount1Day:(int)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_nowPlayingAbsoluteCount1Day = a3;
}

- (BOOL)hasNowPlayingAbsoluteCount1Day
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 20) & 1;
}

- (void)setHasNowPlayingAbsoluteCount1Day:(BOOL)a3
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

- (void)deleteNowPlayingAbsoluteCount1Day
{
  $36A3CCAAE4681EBA138F0132699ACCCC v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setNowPlayingAbsoluteCount1Day:](self, "setNowPlayingAbsoluteCount1Day:", 0);
  v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  v4 = *(_QWORD *)&v3 & 0xFFFFFFFFFFEFFFFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xFFEFFFFF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setNowPlayingAbsoluteCount7Day:(int)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_nowPlayingAbsoluteCount7Day = a3;
}

- (BOOL)hasNowPlayingAbsoluteCount7Day
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 21) & 1;
}

- (void)setHasNowPlayingAbsoluteCount7Day:(BOOL)a3
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

- (void)deleteNowPlayingAbsoluteCount7Day
{
  $36A3CCAAE4681EBA138F0132699ACCCC v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setNowPlayingAbsoluteCount7Day:](self, "setNowPlayingAbsoluteCount7Day:", 0);
  v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  v4 = *(_QWORD *)&v3 & 0xFFFFFFFFFFDFFFFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xFFDFFFFF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setNowPlayingAbsoluteCount14Day:(int)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_nowPlayingAbsoluteCount14Day = a3;
}

- (BOOL)hasNowPlayingAbsoluteCount14Day
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 22) & 1;
}

- (void)setHasNowPlayingAbsoluteCount14Day:(BOOL)a3
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

- (void)deleteNowPlayingAbsoluteCount14Day
{
  $36A3CCAAE4681EBA138F0132699ACCCC v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setNowPlayingAbsoluteCount14Day:](self, "setNowPlayingAbsoluteCount14Day:", 0);
  v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  v4 = *(_QWORD *)&v3 & 0xFFFFFFFFFFBFFFFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xFFBFFFFF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setNowPlayingAbsoluteCount28Day:(int)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_nowPlayingAbsoluteCount28Day = a3;
}

- (BOOL)hasNowPlayingAbsoluteCount28Day
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 23) & 1;
}

- (void)setHasNowPlayingAbsoluteCount28Day:(BOOL)a3
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

- (void)deleteNowPlayingAbsoluteCount28Day
{
  $36A3CCAAE4681EBA138F0132699ACCCC v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setNowPlayingAbsoluteCount28Day:](self, "setNowPlayingAbsoluteCount28Day:", 0);
  v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  v4 = *(_QWORD *)&v3 & 0xFFFFFFFFFF7FFFFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xFF7FFFFF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setIsNowPlayingApp:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_isNowPlayingApp = a3;
}

- (BOOL)hasIsNowPlayingApp
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 24) & 1;
}

- (void)setHasIsNowPlayingApp:(BOOL)a3
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

- (void)deleteIsNowPlayingApp
{
  $36A3CCAAE4681EBA138F0132699ACCCC v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setIsNowPlayingApp:](self, "setIsNowPlayingApp:", 0);
  v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  v4 = *(_QWORD *)&v3 & 0xFFFFFFFFFEFFFFFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xFEFFFFFF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setIsSelectedApp:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_isSelectedApp = a3;
}

- (BOOL)hasIsSelectedApp
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 25) & 1;
}

- (void)setHasIsSelectedApp:(BOOL)a3
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

- (void)deleteIsSelectedApp
{
  $36A3CCAAE4681EBA138F0132699ACCCC v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setIsSelectedApp:](self, "setIsSelectedApp:", 0);
  v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  v4 = *(_QWORD *)&v3 & 0xFFFFFFFFFDFFFFFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xFDFFFFFF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setTimeSinceLastForegroundAppStartInSec:(int)a3
{
  *(_DWORD *)&self->_has |= 0x4000000u;
  self->_timeSinceLastForegroundAppStartInSec = a3;
}

- (BOOL)hasTimeSinceLastForegroundAppStartInSec
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 26) & 1;
}

- (void)setHasTimeSinceLastForegroundAppStartInSec:(BOOL)a3
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

- (void)deleteTimeSinceLastForegroundAppStartInSec
{
  $36A3CCAAE4681EBA138F0132699ACCCC v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setTimeSinceLastForegroundAppStartInSec:](self, "setTimeSinceLastForegroundAppStartInSec:", 0);
  v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  v4 = *(_QWORD *)&v3 & 0xFFFFFFFFFBFFFFFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xFBFFFFFF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setTimeSinceLastForegroundAppEndInSec:(int)a3
{
  *(_DWORD *)&self->_has |= 0x8000000u;
  self->_timeSinceLastForegroundAppEndInSec = a3;
}

- (BOOL)hasTimeSinceLastForegroundAppEndInSec
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 27) & 1;
}

- (void)setHasTimeSinceLastForegroundAppEndInSec:(BOOL)a3
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

- (void)deleteTimeSinceLastForegroundAppEndInSec
{
  $36A3CCAAE4681EBA138F0132699ACCCC v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setTimeSinceLastForegroundAppEndInSec:](self, "setTimeSinceLastForegroundAppEndInSec:", 0);
  v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  v4 = *(_QWORD *)&v3 & 0xFFFFFFFFF7FFFFFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xF7FFFFFF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setTimeSinceLastNowPlayingAppStartInSec:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10000000u;
  self->_timeSinceLastNowPlayingAppStartInSec = a3;
}

- (BOOL)hasTimeSinceLastNowPlayingAppStartInSec
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 28) & 1;
}

- (void)setHasTimeSinceLastNowPlayingAppStartInSec:(BOOL)a3
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

- (void)deleteTimeSinceLastNowPlayingAppStartInSec
{
  $36A3CCAAE4681EBA138F0132699ACCCC v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setTimeSinceLastNowPlayingAppStartInSec:](self, "setTimeSinceLastNowPlayingAppStartInSec:", 0);
  v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  v4 = *(_QWORD *)&v3 & 0xFFFFFFFFEFFFFFFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xEFFFFFFF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setTimeSinceLastNowPlayingAppEndInSec:(int)a3
{
  *(_DWORD *)&self->_has |= 0x20000000u;
  self->_timeSinceLastNowPlayingAppEndInSec = a3;
}

- (BOOL)hasTimeSinceLastNowPlayingAppEndInSec
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 29) & 1;
}

- (void)setHasTimeSinceLastNowPlayingAppEndInSec:(BOOL)a3
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

- (void)deleteTimeSinceLastNowPlayingAppEndInSec
{
  $36A3CCAAE4681EBA138F0132699ACCCC v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setTimeSinceLastNowPlayingAppEndInSec:](self, "setTimeSinceLastNowPlayingAppEndInSec:", 0);
  v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  v4 = *(_QWORD *)&v3 & 0xFFFFFFFFDFFFFFFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xDFFFFFFF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setSpotlightRelativeCount:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40000000u;
  self->_spotlightRelativeCount = a3;
}

- (BOOL)hasSpotlightRelativeCount
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 30) & 1;
}

- (void)setHasSpotlightRelativeCount:(BOOL)a3
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

- (void)deleteSpotlightRelativeCount
{
  $36A3CCAAE4681EBA138F0132699ACCCC v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setSpotlightRelativeCount:](self, "setSpotlightRelativeCount:", 0);
  v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  v4 = *(_QWORD *)&v3 & 0xFFFFFFFFBFFFFFFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xBFFFFFFF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setSupportedMediaCategories:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x80000000;
  self->_supportedMediaCategories = a3;
}

- (BOOL)hasSupportedMediaCategories
{
  return *(_DWORD *)&self->_has >> 31;
}

- (void)setHasSupportedMediaCategories:(BOOL)a3
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

- (void)deleteSupportedMediaCategories
{
  $36A3CCAAE4681EBA138F0132699ACCCC v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setSupportedMediaCategories:](self, "setSupportedMediaCategories:", 0);
  v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  v4 = *(_QWORD *)&v3 & 0xFFFFFFFF7FFFFFFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0x7FFFFFFF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setIsForegroundApp:(BOOL)a3
{
  *((_WORD *)&self->_has + 2) = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32) | 0x100000000) >> 32;
  self->_isForegroundApp = a3;
}

- (BOOL)hasIsForegroundApp
{
  return *((_WORD *)&self->_has + 2) & 1;
}

- (void)setHasIsForegroundApp:(BOOL)a3
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

- (void)deleteIsForegroundApp
{
  $36A3CCAAE4681EBA138F0132699ACCCC v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setIsForegroundApp:](self, "setIsForegroundApp:", 0);
  v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  v4 = (*(_QWORD *)&v3 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFFFFEFFFFFFFFLL;
  *(_DWORD *)&self->_has = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setEntityPartialSiriCount2Min:(int)a3
{
  *((_WORD *)&self->_has + 2) = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32) | 0x200000000) >> 32;
  self->_entityPartialSiriCount2Min = a3;
}

- (BOOL)hasEntityPartialSiriCount2Min
{
  return (*((unsigned __int16 *)&self->_has + 2) >> 1) & 1;
}

- (void)setHasEntityPartialSiriCount2Min:(BOOL)a3
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

- (void)deleteEntityPartialSiriCount2Min
{
  $36A3CCAAE4681EBA138F0132699ACCCC v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setEntityPartialSiriCount2Min:](self, "setEntityPartialSiriCount2Min:", 0);
  v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  v4 = (*(_QWORD *)&v3 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFFFFDFFFFFFFFLL;
  *(_DWORD *)&self->_has = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setEntityPartialSiriCount10Min:(int)a3
{
  *((_WORD *)&self->_has + 2) = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32) | 0x400000000) >> 32;
  self->_entityPartialSiriCount10Min = a3;
}

- (BOOL)hasEntityPartialSiriCount10Min
{
  return (*((unsigned __int16 *)&self->_has + 2) >> 2) & 1;
}

- (void)setHasEntityPartialSiriCount10Min:(BOOL)a3
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

- (void)deleteEntityPartialSiriCount10Min
{
  $36A3CCAAE4681EBA138F0132699ACCCC v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setEntityPartialSiriCount10Min:](self, "setEntityPartialSiriCount10Min:", 0);
  v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  v4 = (*(_QWORD *)&v3 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFFFFBFFFFFFFFLL;
  *(_DWORD *)&self->_has = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setEntityPartialSiriCount1Hr:(int)a3
{
  *((_WORD *)&self->_has + 2) = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32) | 0x800000000) >> 32;
  self->_entityPartialSiriCount1Hr = a3;
}

- (BOOL)hasEntityPartialSiriCount1Hr
{
  return (*((unsigned __int16 *)&self->_has + 2) >> 3) & 1;
}

- (void)setHasEntityPartialSiriCount1Hr:(BOOL)a3
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

- (void)deleteEntityPartialSiriCount1Hr
{
  $36A3CCAAE4681EBA138F0132699ACCCC v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setEntityPartialSiriCount1Hr:](self, "setEntityPartialSiriCount1Hr:", 0);
  v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  v4 = (*(_QWORD *)&v3 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFFFF7FFFFFFFFLL;
  *(_DWORD *)&self->_has = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setEntityPartialSiriCount6Hr:(int)a3
{
  *((_WORD *)&self->_has + 2) = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32) | 0x1000000000) >> 32;
  self->_entityPartialSiriCount6Hr = a3;
}

- (BOOL)hasEntityPartialSiriCount6Hr
{
  return (*((unsigned __int16 *)&self->_has + 2) >> 4) & 1;
}

- (void)setHasEntityPartialSiriCount6Hr:(BOOL)a3
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

- (void)deleteEntityPartialSiriCount6Hr
{
  $36A3CCAAE4681EBA138F0132699ACCCC v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setEntityPartialSiriCount6Hr:](self, "setEntityPartialSiriCount6Hr:", 0);
  v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  v4 = (*(_QWORD *)&v3 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFFFEFFFFFFFFFLL;
  *(_DWORD *)&self->_has = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setEntityPartialSiriCount1Day:(int)a3
{
  *((_WORD *)&self->_has + 2) = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32) | 0x2000000000) >> 32;
  self->_entityPartialSiriCount1Day = a3;
}

- (BOOL)hasEntityPartialSiriCount1Day
{
  return (*((unsigned __int16 *)&self->_has + 2) >> 5) & 1;
}

- (void)setHasEntityPartialSiriCount1Day:(BOOL)a3
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

- (void)deleteEntityPartialSiriCount1Day
{
  $36A3CCAAE4681EBA138F0132699ACCCC v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setEntityPartialSiriCount1Day:](self, "setEntityPartialSiriCount1Day:", 0);
  v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  v4 = (*(_QWORD *)&v3 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFFFDFFFFFFFFFLL;
  *(_DWORD *)&self->_has = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setEntityPartialSiriCount7Day:(int)a3
{
  *((_WORD *)&self->_has + 2) = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32) | 0x4000000000) >> 32;
  self->_entityPartialSiriCount7Day = a3;
}

- (BOOL)hasEntityPartialSiriCount7Day
{
  return (*((unsigned __int16 *)&self->_has + 2) >> 6) & 1;
}

- (void)setHasEntityPartialSiriCount7Day:(BOOL)a3
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

- (void)deleteEntityPartialSiriCount7Day
{
  $36A3CCAAE4681EBA138F0132699ACCCC v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setEntityPartialSiriCount7Day:](self, "setEntityPartialSiriCount7Day:", 0);
  v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  v4 = (*(_QWORD *)&v3 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFFFBFFFFFFFFFLL;
  *(_DWORD *)&self->_has = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setEntityPartialSiriCount28Day:(int)a3
{
  *((_WORD *)&self->_has + 2) = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32) | 0x8000000000) >> 32;
  self->_entityPartialSiriCount28Day = a3;
}

- (BOOL)hasEntityPartialSiriCount28Day
{
  return (*((unsigned __int16 *)&self->_has + 2) >> 7) & 1;
}

- (void)setHasEntityPartialSiriCount28Day:(BOOL)a3
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

- (void)deleteEntityPartialSiriCount28Day
{
  $36A3CCAAE4681EBA138F0132699ACCCC v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setEntityPartialSiriCount28Day:](self, "setEntityPartialSiriCount28Day:", 0);
  v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  v4 = (*(_QWORD *)&v3 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFFF7FFFFFFFFFLL;
  *(_DWORD *)&self->_has = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setEntityPartialAppCount2Min:(int)a3
{
  *((_WORD *)&self->_has + 2) = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32) | 0x10000000000) >> 32;
  self->_entityPartialAppCount2Min = a3;
}

- (BOOL)hasEntityPartialAppCount2Min
{
  return *((_BYTE *)&self->_has + 5) & 1;
}

- (void)setHasEntityPartialAppCount2Min:(BOOL)a3
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

- (void)deleteEntityPartialAppCount2Min
{
  $36A3CCAAE4681EBA138F0132699ACCCC v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setEntityPartialAppCount2Min:](self, "setEntityPartialAppCount2Min:", 0);
  v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  v4 = (*(_QWORD *)&v3 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFFEFFFFFFFFFFLL;
  *(_DWORD *)&self->_has = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setEntityPartialAppCount10Min:(int)a3
{
  *((_WORD *)&self->_has + 2) = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32) | 0x20000000000) >> 32;
  self->_entityPartialAppCount10Min = a3;
}

- (BOOL)hasEntityPartialAppCount10Min
{
  return (*((unsigned __int16 *)&self->_has + 2) >> 9) & 1;
}

- (void)setHasEntityPartialAppCount10Min:(BOOL)a3
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

- (void)deleteEntityPartialAppCount10Min
{
  $36A3CCAAE4681EBA138F0132699ACCCC v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setEntityPartialAppCount10Min:](self, "setEntityPartialAppCount10Min:", 0);
  v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  v4 = (*(_QWORD *)&v3 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFFDFFFFFFFFFFLL;
  *(_DWORD *)&self->_has = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setEntityPartialAppCount1Hr:(int)a3
{
  *((_WORD *)&self->_has + 2) = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32) | 0x40000000000) >> 32;
  self->_entityPartialAppCount1Hr = a3;
}

- (BOOL)hasEntityPartialAppCount1Hr
{
  return (*((unsigned __int16 *)&self->_has + 2) >> 10) & 1;
}

- (void)setHasEntityPartialAppCount1Hr:(BOOL)a3
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

- (void)deleteEntityPartialAppCount1Hr
{
  $36A3CCAAE4681EBA138F0132699ACCCC v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setEntityPartialAppCount1Hr:](self, "setEntityPartialAppCount1Hr:", 0);
  v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  v4 = (*(_QWORD *)&v3 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFFBFFFFFFFFFFLL;
  *(_DWORD *)&self->_has = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setEntityPartialAppCount6Hr:(int)a3
{
  *((_WORD *)&self->_has + 2) = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32) | 0x80000000000) >> 32;
  self->_entityPartialAppCount6Hr = a3;
}

- (BOOL)hasEntityPartialAppCount6Hr
{
  return (*((unsigned __int16 *)&self->_has + 2) >> 11) & 1;
}

- (void)setHasEntityPartialAppCount6Hr:(BOOL)a3
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

- (void)deleteEntityPartialAppCount6Hr
{
  $36A3CCAAE4681EBA138F0132699ACCCC v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setEntityPartialAppCount6Hr:](self, "setEntityPartialAppCount6Hr:", 0);
  v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  v4 = (*(_QWORD *)&v3 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFF7FFFFFFFFFFLL;
  *(_DWORD *)&self->_has = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setEntityPartialAppCount1Day:(int)a3
{
  *((_WORD *)&self->_has + 2) = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32) | 0x100000000000) >> 32;
  self->_entityPartialAppCount1Day = a3;
}

- (BOOL)hasEntityPartialAppCount1Day
{
  return (*((unsigned __int16 *)&self->_has + 2) >> 12) & 1;
}

- (void)setHasEntityPartialAppCount1Day:(BOOL)a3
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

- (void)deleteEntityPartialAppCount1Day
{
  $36A3CCAAE4681EBA138F0132699ACCCC v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setEntityPartialAppCount1Day:](self, "setEntityPartialAppCount1Day:", 0);
  v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  v4 = (*(_QWORD *)&v3 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFEFFFFFFFFFFFLL;
  *(_DWORD *)&self->_has = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setEntityPartialAppCount7Day:(int)a3
{
  *((_WORD *)&self->_has + 2) = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32) | 0x200000000000) >> 32;
  self->_entityPartialAppCount7Day = a3;
}

- (BOOL)hasEntityPartialAppCount7Day
{
  return (*((unsigned __int16 *)&self->_has + 2) >> 13) & 1;
}

- (void)setHasEntityPartialAppCount7Day:(BOOL)a3
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

- (void)deleteEntityPartialAppCount7Day
{
  $36A3CCAAE4681EBA138F0132699ACCCC v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setEntityPartialAppCount7Day:](self, "setEntityPartialAppCount7Day:", 0);
  v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  v4 = (*(_QWORD *)&v3 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFDFFFFFFFFFFFLL;
  *(_DWORD *)&self->_has = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setEntityPartialAppCount28Day:(int)a3
{
  *((_WORD *)&self->_has + 2) = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32) | 0x400000000000) >> 32;
  self->_entityPartialAppCount28Day = a3;
}

- (BOOL)hasEntityPartialAppCount28Day
{
  return (*((unsigned __int16 *)&self->_has + 2) >> 14) & 1;
}

- (void)setHasEntityPartialAppCount28Day:(BOOL)a3
{
  uint64_t v3;
  unint64_t v4;

  v3 = 0x400000000000;
  if (!a3)
    v3 = 0;
  v4 = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFBFFFFFFFFFFFLL | v3;
  *(_DWORD *)&self->_has = self->_has;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)deleteEntityPartialAppCount28Day
{
  $36A3CCAAE4681EBA138F0132699ACCCC v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setEntityPartialAppCount28Day:](self, "setEntityPartialAppCount28Day:", 0);
  v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  v4 = (*(_QWORD *)&v3 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFBFFFFFFFFFFFLL;
  *(_DWORD *)&self->_has = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignalsReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $36A3CCAAE4681EBA138F0132699ACCCC v4;
  unint64_t v5;
  $36A3CCAAE4681EBA138F0132699ACCCC v6;
  id v7;

  v7 = a3;
  v4 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  v5 = *(_QWORD *)&v4 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_BYTE *)&v4 & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v6 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
    v5 = *(_QWORD *)&v6 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
    if ((*(_BYTE *)&v6 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0)
        goto LABEL_4;
      goto LABEL_52;
    }
  }
  else if ((*(_BYTE *)&v4 & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 4) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0)
      goto LABEL_5;
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteInt32Field();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 8) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteInt32Field();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x10) == 0)
  {
LABEL_6:
    if ((v5 & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteInt32Field();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x20) == 0)
  {
LABEL_7:
    if ((v5 & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteInt32Field();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x40) == 0)
  {
LABEL_8:
    if ((v5 & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteInt32Field();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x80) == 0)
  {
LABEL_9:
    if ((v5 & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteInt32Field();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x100) == 0)
  {
LABEL_10:
    if ((v5 & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteInt32Field();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x200) == 0)
  {
LABEL_11:
    if ((v5 & 0x400) == 0)
      goto LABEL_12;
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteInt32Field();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x400) == 0)
  {
LABEL_12:
    if ((v5 & 0x800) == 0)
      goto LABEL_13;
    goto LABEL_61;
  }
LABEL_60:
  PBDataWriterWriteInt32Field();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x800) == 0)
  {
LABEL_13:
    if ((v5 & 0x1000) == 0)
      goto LABEL_14;
    goto LABEL_62;
  }
LABEL_61:
  PBDataWriterWriteInt32Field();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x1000) == 0)
  {
LABEL_14:
    if ((v5 & 0x2000) == 0)
      goto LABEL_15;
    goto LABEL_63;
  }
LABEL_62:
  PBDataWriterWriteInt32Field();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x2000) == 0)
  {
LABEL_15:
    if ((v5 & 0x4000) == 0)
      goto LABEL_16;
    goto LABEL_64;
  }
LABEL_63:
  PBDataWriterWriteInt32Field();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x4000) == 0)
  {
LABEL_16:
    if ((v5 & 0x8000) == 0)
      goto LABEL_17;
    goto LABEL_65;
  }
LABEL_64:
  PBDataWriterWriteBOOLField();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x8000) == 0)
  {
LABEL_17:
    if ((v5 & 0x10000) == 0)
      goto LABEL_18;
    goto LABEL_66;
  }
LABEL_65:
  PBDataWriterWriteBOOLField();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x10000) == 0)
  {
LABEL_18:
    if ((v5 & 0x20000) == 0)
      goto LABEL_19;
    goto LABEL_67;
  }
LABEL_66:
  PBDataWriterWriteInt32Field();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x20000) == 0)
  {
LABEL_19:
    if ((v5 & 0x40000) == 0)
      goto LABEL_20;
    goto LABEL_68;
  }
LABEL_67:
  PBDataWriterWriteInt32Field();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x40000) == 0)
  {
LABEL_20:
    if ((v5 & 0x80000) == 0)
      goto LABEL_21;
    goto LABEL_69;
  }
LABEL_68:
  PBDataWriterWriteInt32Field();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x80000) == 0)
  {
LABEL_21:
    if ((v5 & 0x100000) == 0)
      goto LABEL_22;
    goto LABEL_70;
  }
LABEL_69:
  PBDataWriterWriteInt32Field();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x100000) == 0)
  {
LABEL_22:
    if ((v5 & 0x200000) == 0)
      goto LABEL_23;
    goto LABEL_71;
  }
LABEL_70:
  PBDataWriterWriteInt32Field();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x200000) == 0)
  {
LABEL_23:
    if ((v5 & 0x400000) == 0)
      goto LABEL_24;
    goto LABEL_72;
  }
LABEL_71:
  PBDataWriterWriteInt32Field();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x400000) == 0)
  {
LABEL_24:
    if ((v5 & 0x800000) == 0)
      goto LABEL_25;
    goto LABEL_73;
  }
LABEL_72:
  PBDataWriterWriteInt32Field();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x800000) == 0)
  {
LABEL_25:
    if ((v5 & 0x1000000) == 0)
      goto LABEL_26;
    goto LABEL_74;
  }
LABEL_73:
  PBDataWriterWriteInt32Field();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x1000000) == 0)
  {
LABEL_26:
    if ((v5 & 0x2000000) == 0)
      goto LABEL_27;
    goto LABEL_75;
  }
LABEL_74:
  PBDataWriterWriteBOOLField();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x2000000) == 0)
  {
LABEL_27:
    if ((v5 & 0x4000000) == 0)
      goto LABEL_28;
    goto LABEL_76;
  }
LABEL_75:
  PBDataWriterWriteBOOLField();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x4000000) == 0)
  {
LABEL_28:
    if ((v5 & 0x8000000) == 0)
      goto LABEL_29;
    goto LABEL_77;
  }
LABEL_76:
  PBDataWriterWriteInt32Field();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x8000000) == 0)
  {
LABEL_29:
    if ((v5 & 0x10000000) == 0)
      goto LABEL_30;
    goto LABEL_78;
  }
LABEL_77:
  PBDataWriterWriteInt32Field();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x10000000) == 0)
  {
LABEL_30:
    if ((v5 & 0x20000000) == 0)
      goto LABEL_31;
    goto LABEL_79;
  }
LABEL_78:
  PBDataWriterWriteInt32Field();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x20000000) == 0)
  {
LABEL_31:
    if ((v5 & 0x40000000) == 0)
      goto LABEL_32;
    goto LABEL_80;
  }
LABEL_79:
  PBDataWriterWriteInt32Field();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x40000000) == 0)
  {
LABEL_32:
    if ((v5 & 0x80000000) == 0)
      goto LABEL_33;
    goto LABEL_81;
  }
LABEL_80:
  PBDataWriterWriteInt32Field();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x80000000) == 0)
  {
LABEL_33:
    if ((v5 & 0x100000000) == 0)
      goto LABEL_34;
    goto LABEL_82;
  }
LABEL_81:
  PBDataWriterWriteUint64Field();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x100000000) == 0)
  {
LABEL_34:
    if ((v5 & 0x200000000) == 0)
      goto LABEL_35;
    goto LABEL_83;
  }
LABEL_82:
  PBDataWriterWriteBOOLField();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x200000000) == 0)
  {
LABEL_35:
    if ((v5 & 0x400000000) == 0)
      goto LABEL_36;
    goto LABEL_84;
  }
LABEL_83:
  PBDataWriterWriteInt32Field();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x400000000) == 0)
  {
LABEL_36:
    if ((v5 & 0x800000000) == 0)
      goto LABEL_37;
    goto LABEL_85;
  }
LABEL_84:
  PBDataWriterWriteInt32Field();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x800000000) == 0)
  {
LABEL_37:
    if ((v5 & 0x1000000000) == 0)
      goto LABEL_38;
    goto LABEL_86;
  }
LABEL_85:
  PBDataWriterWriteInt32Field();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x1000000000) == 0)
  {
LABEL_38:
    if ((v5 & 0x2000000000) == 0)
      goto LABEL_39;
    goto LABEL_87;
  }
LABEL_86:
  PBDataWriterWriteInt32Field();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x2000000000) == 0)
  {
LABEL_39:
    if ((v5 & 0x4000000000) == 0)
      goto LABEL_40;
    goto LABEL_88;
  }
LABEL_87:
  PBDataWriterWriteInt32Field();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x4000000000) == 0)
  {
LABEL_40:
    if ((v5 & 0x8000000000) == 0)
      goto LABEL_41;
    goto LABEL_89;
  }
LABEL_88:
  PBDataWriterWriteInt32Field();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x8000000000) == 0)
  {
LABEL_41:
    if ((v5 & 0x10000000000) == 0)
      goto LABEL_42;
    goto LABEL_90;
  }
LABEL_89:
  PBDataWriterWriteInt32Field();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x10000000000) == 0)
  {
LABEL_42:
    if ((v5 & 0x20000000000) == 0)
      goto LABEL_43;
    goto LABEL_91;
  }
LABEL_90:
  PBDataWriterWriteInt32Field();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x20000000000) == 0)
  {
LABEL_43:
    if ((v5 & 0x40000000000) == 0)
      goto LABEL_44;
    goto LABEL_92;
  }
LABEL_91:
  PBDataWriterWriteInt32Field();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x40000000000) == 0)
  {
LABEL_44:
    if ((v5 & 0x80000000000) == 0)
      goto LABEL_45;
    goto LABEL_93;
  }
LABEL_92:
  PBDataWriterWriteInt32Field();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x80000000000) == 0)
  {
LABEL_45:
    if ((v5 & 0x100000000000) == 0)
      goto LABEL_46;
    goto LABEL_94;
  }
LABEL_93:
  PBDataWriterWriteInt32Field();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x100000000000) == 0)
  {
LABEL_46:
    if ((v5 & 0x200000000000) == 0)
      goto LABEL_47;
LABEL_95:
    PBDataWriterWriteInt32Field();
    if (((*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0x400000000000) == 0)
      goto LABEL_49;
    goto LABEL_48;
  }
LABEL_94:
  PBDataWriterWriteInt32Field();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x200000000000) != 0)
    goto LABEL_95;
LABEL_47:
  if ((v5 & 0x400000000000) != 0)
LABEL_48:
    PBDataWriterWriteInt32Field();
LABEL_49:

}

- (BOOL)isEqual:(id)a3
{
  unsigned int *v4;
  $36A3CCAAE4681EBA138F0132699ACCCC v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  int relativeAppUsage1Day;
  unsigned int v10;
  int relativeAppUsage7Day;
  unsigned int v12;
  int relativeAppUsage14Day;
  unsigned int v14;
  int entityAbsoluteCount2Min;
  unsigned int v16;
  int entityAbsoluteCount10Min;
  unsigned int v18;
  int entityAbsoluteCount1Hr;
  unsigned int v20;
  int entityAbsoluteCount6Hr;
  unsigned int v22;
  int entityAbsoluteCount1Day;
  unsigned int v24;
  int entityAbsoluteCount7Day;
  unsigned int v26;
  int entityAbsoluteCount14Day;
  unsigned int v28;
  int entityAbsoluteCount28Day;
  unsigned int v30;
  int entityRecency;
  unsigned int v32;
  int mediaUserContextNumberOfLibraryItems;
  unsigned int v34;
  int mediaUserContextSubscriptionStatus;
  unsigned int v36;
  int isLastForegroundApp;
  unsigned int v38;
  int isLastNowPlayingApp;
  unsigned int v40;
  int nowPlayingAbsoluteCount2Min;
  unsigned int v42;
  int nowPlayingAbsoluteCount10Min;
  unsigned int v44;
  int nowPlayingAbsoluteCount1Hr;
  unsigned int v46;
  int nowPlayingAbsoluteCount6Hr;
  unsigned int v48;
  int nowPlayingAbsoluteCount1Day;
  unsigned int v50;
  int nowPlayingAbsoluteCount7Day;
  unsigned int v52;
  int nowPlayingAbsoluteCount14Day;
  unsigned int v54;
  int nowPlayingAbsoluteCount28Day;
  unsigned int v56;
  int isNowPlayingApp;
  unsigned int v58;
  int isSelectedApp;
  unsigned int v60;
  int timeSinceLastForegroundAppStartInSec;
  unsigned int v62;
  int timeSinceLastForegroundAppEndInSec;
  unsigned int v64;
  int timeSinceLastNowPlayingAppStartInSec;
  unsigned int v66;
  int timeSinceLastNowPlayingAppEndInSec;
  unsigned int v68;
  int spotlightRelativeCount;
  unsigned int v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  unsigned int v78;
  uint64_t v79;
  __int16 v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  unint64_t supportedMediaCategories;
  unsigned int v96;
  int isForegroundApp;
  unsigned int v98;
  unsigned int v99;
  int v100;
  int entityPartialSiriCount2Min;
  unsigned int v102;
  unsigned int v103;
  int entityPartialSiriCount10Min;
  unsigned int v105;
  unsigned int v106;
  int entityPartialSiriCount1Hr;
  unsigned int v108;
  unsigned int v109;
  int entityPartialSiriCount6Hr;
  unsigned int v111;
  unsigned int v112;
  int entityPartialSiriCount1Day;
  unsigned int v114;
  unsigned int v115;
  int entityPartialSiriCount7Day;
  unsigned int v117;
  unsigned int v118;
  int entityPartialSiriCount28Day;
  unsigned int v120;
  unsigned int v121;
  int entityPartialAppCount2Min;
  unsigned int v123;
  unsigned int v124;
  int entityPartialAppCount10Min;
  unsigned int v126;
  unsigned int v127;
  int entityPartialAppCount1Hr;
  unsigned int v129;
  unsigned int v130;
  int entityPartialAppCount6Hr;
  unsigned int v132;
  unsigned int v133;
  int entityPartialAppCount1Day;
  unsigned int v135;
  unsigned int v136;
  int entityPartialAppCount7Day;
  int v138;
  int entityPartialAppCount28Day;
  BOOL v140;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;

  v4 = (unsigned int *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_192;
  v5 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  v6 = v4[49];
  if ((*(_DWORD *)&self->_has & 1) != (v4[49] & 1))
    goto LABEL_192;
  if ((*(_BYTE *)&v5 & 1) != 0)
  {
    relativeAppUsage1Day = self->_relativeAppUsage1Day;
    if (relativeAppUsage1Day != objc_msgSend(v4, "relativeAppUsage1Day"))
      goto LABEL_192;
    v5 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
    v7 = *(_QWORD *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
    v8 = v4[49] | ((unint64_t)*((unsigned __int16 *)v4 + 100) << 32);
    LODWORD(v6) = v4[49];
  }
  else
  {
    v7 = *(_QWORD *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
    v8 = v6 | ((unint64_t)*((unsigned __int16 *)v4 + 100) << 32);
  }
  v10 = (*(_DWORD *)&v5 >> 1) & 1;
  if (v10 != ((v6 >> 1) & 1))
    goto LABEL_192;
  if (v10)
  {
    relativeAppUsage7Day = self->_relativeAppUsage7Day;
    if (relativeAppUsage7Day != objc_msgSend(v4, "relativeAppUsage7Day"))
      goto LABEL_192;
    v5 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
    v7 = *(_QWORD *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
    v8 = v4[49] | ((unint64_t)*((unsigned __int16 *)v4 + 100) << 32);
    LODWORD(v6) = v4[49];
  }
  v12 = (*(_DWORD *)&v5 >> 2) & 1;
  if (v12 != ((v6 >> 2) & 1))
    goto LABEL_192;
  if (v12)
  {
    relativeAppUsage14Day = self->_relativeAppUsage14Day;
    if (relativeAppUsage14Day != objc_msgSend(v4, "relativeAppUsage14Day"))
      goto LABEL_192;
    v5 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
    v7 = *(_QWORD *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
    v8 = v4[49] | ((unint64_t)*((unsigned __int16 *)v4 + 100) << 32);
    LODWORD(v6) = v4[49];
  }
  v14 = (*(_DWORD *)&v5 >> 3) & 1;
  if (v14 != ((v6 >> 3) & 1))
    goto LABEL_192;
  if (v14)
  {
    entityAbsoluteCount2Min = self->_entityAbsoluteCount2Min;
    if (entityAbsoluteCount2Min != objc_msgSend(v4, "entityAbsoluteCount2Min"))
      goto LABEL_192;
    v5 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
    v7 = *(_QWORD *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
    v8 = v4[49] | ((unint64_t)*((unsigned __int16 *)v4 + 100) << 32);
    LODWORD(v6) = v4[49];
  }
  v16 = (*(_DWORD *)&v5 >> 4) & 1;
  if (v16 != ((v6 >> 4) & 1))
    goto LABEL_192;
  if (v16)
  {
    entityAbsoluteCount10Min = self->_entityAbsoluteCount10Min;
    if (entityAbsoluteCount10Min != objc_msgSend(v4, "entityAbsoluteCount10Min"))
      goto LABEL_192;
    v5 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
    v7 = *(_QWORD *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
    v8 = v4[49] | ((unint64_t)*((unsigned __int16 *)v4 + 100) << 32);
    LODWORD(v6) = v4[49];
  }
  v18 = (*(_DWORD *)&v5 >> 5) & 1;
  if (v18 != ((v6 >> 5) & 1))
    goto LABEL_192;
  if (v18)
  {
    entityAbsoluteCount1Hr = self->_entityAbsoluteCount1Hr;
    if (entityAbsoluteCount1Hr != objc_msgSend(v4, "entityAbsoluteCount1Hr"))
      goto LABEL_192;
    v5 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
    v7 = *(_QWORD *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
    v8 = v4[49] | ((unint64_t)*((unsigned __int16 *)v4 + 100) << 32);
    LODWORD(v6) = v4[49];
  }
  v20 = (*(_DWORD *)&v5 >> 6) & 1;
  if (v20 != ((v6 >> 6) & 1))
    goto LABEL_192;
  if (v20)
  {
    entityAbsoluteCount6Hr = self->_entityAbsoluteCount6Hr;
    if (entityAbsoluteCount6Hr != objc_msgSend(v4, "entityAbsoluteCount6Hr"))
      goto LABEL_192;
    v5 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
    v7 = *(_QWORD *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
    v8 = v4[49] | ((unint64_t)*((unsigned __int16 *)v4 + 100) << 32);
    LODWORD(v6) = v4[49];
  }
  v22 = (*(_DWORD *)&v5 >> 7) & 1;
  if (v22 != ((v6 >> 7) & 1))
    goto LABEL_192;
  if (v22)
  {
    entityAbsoluteCount1Day = self->_entityAbsoluteCount1Day;
    if (entityAbsoluteCount1Day != objc_msgSend(v4, "entityAbsoluteCount1Day"))
      goto LABEL_192;
    v5 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
    v7 = *(_QWORD *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
    v8 = v4[49] | ((unint64_t)*((unsigned __int16 *)v4 + 100) << 32);
    LODWORD(v6) = v4[49];
  }
  v24 = (*(_DWORD *)&v5 >> 8) & 1;
  if (v24 != ((v6 >> 8) & 1))
    goto LABEL_192;
  if (v24)
  {
    entityAbsoluteCount7Day = self->_entityAbsoluteCount7Day;
    if (entityAbsoluteCount7Day != objc_msgSend(v4, "entityAbsoluteCount7Day"))
      goto LABEL_192;
    v5 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
    v7 = *(_QWORD *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
    v8 = v4[49] | ((unint64_t)*((unsigned __int16 *)v4 + 100) << 32);
    LODWORD(v6) = v4[49];
  }
  v26 = (*(_DWORD *)&v5 >> 9) & 1;
  if (v26 != ((v6 >> 9) & 1))
    goto LABEL_192;
  if (v26)
  {
    entityAbsoluteCount14Day = self->_entityAbsoluteCount14Day;
    if (entityAbsoluteCount14Day != objc_msgSend(v4, "entityAbsoluteCount14Day"))
      goto LABEL_192;
    v5 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
    v7 = *(_QWORD *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
    v8 = v4[49] | ((unint64_t)*((unsigned __int16 *)v4 + 100) << 32);
    LODWORD(v6) = v4[49];
  }
  v28 = (*(_DWORD *)&v5 >> 10) & 1;
  if (v28 != ((v6 >> 10) & 1))
    goto LABEL_192;
  if (v28)
  {
    entityAbsoluteCount28Day = self->_entityAbsoluteCount28Day;
    if (entityAbsoluteCount28Day != objc_msgSend(v4, "entityAbsoluteCount28Day"))
      goto LABEL_192;
    v5 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
    v7 = *(_QWORD *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
    v8 = v4[49] | ((unint64_t)*((unsigned __int16 *)v4 + 100) << 32);
    LODWORD(v6) = v4[49];
  }
  v30 = (*(_DWORD *)&v5 >> 11) & 1;
  if (v30 != ((v6 >> 11) & 1))
    goto LABEL_192;
  if (v30)
  {
    entityRecency = self->_entityRecency;
    if (entityRecency != objc_msgSend(v4, "entityRecency"))
      goto LABEL_192;
    v5 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
    v7 = *(_QWORD *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
    v8 = v4[49] | ((unint64_t)*((unsigned __int16 *)v4 + 100) << 32);
    LODWORD(v6) = v4[49];
  }
  v32 = (*(_DWORD *)&v5 >> 12) & 1;
  if (v32 != ((v6 >> 12) & 1))
    goto LABEL_192;
  if (v32)
  {
    mediaUserContextNumberOfLibraryItems = self->_mediaUserContextNumberOfLibraryItems;
    if (mediaUserContextNumberOfLibraryItems != objc_msgSend(v4, "mediaUserContextNumberOfLibraryItems"))
      goto LABEL_192;
    v5 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
    v7 = *(_QWORD *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
    v8 = v4[49] | ((unint64_t)*((unsigned __int16 *)v4 + 100) << 32);
    LODWORD(v6) = v4[49];
  }
  v34 = (*(_DWORD *)&v5 >> 13) & 1;
  if (v34 != ((v6 >> 13) & 1))
    goto LABEL_192;
  if (v34)
  {
    mediaUserContextSubscriptionStatus = self->_mediaUserContextSubscriptionStatus;
    if (mediaUserContextSubscriptionStatus != objc_msgSend(v4, "mediaUserContextSubscriptionStatus"))
      goto LABEL_192;
    v5 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
    v7 = *(_QWORD *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
    v8 = v4[49] | ((unint64_t)*((unsigned __int16 *)v4 + 100) << 32);
    LODWORD(v6) = v4[49];
  }
  v36 = (*(_DWORD *)&v5 >> 14) & 1;
  if (v36 != ((v6 >> 14) & 1))
    goto LABEL_192;
  if (v36)
  {
    isLastForegroundApp = self->_isLastForegroundApp;
    if (isLastForegroundApp != objc_msgSend(v4, "isLastForegroundApp"))
      goto LABEL_192;
    v5 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
    v7 = *(_QWORD *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
    v8 = v4[49] | ((unint64_t)*((unsigned __int16 *)v4 + 100) << 32);
    LODWORD(v6) = v4[49];
  }
  v38 = (*(_DWORD *)&v5 >> 15) & 1;
  if (v38 != ((v6 >> 15) & 1))
    goto LABEL_192;
  if (v38)
  {
    isLastNowPlayingApp = self->_isLastNowPlayingApp;
    if (isLastNowPlayingApp != objc_msgSend(v4, "isLastNowPlayingApp"))
      goto LABEL_192;
    v5 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
    v7 = *(_QWORD *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
    v8 = v4[49] | ((unint64_t)*((unsigned __int16 *)v4 + 100) << 32);
    LODWORD(v6) = v4[49];
  }
  v40 = HIWORD(*(_DWORD *)&v5) & 1;
  if (v40 != (WORD1(v6) & 1))
    goto LABEL_192;
  if (v40)
  {
    nowPlayingAbsoluteCount2Min = self->_nowPlayingAbsoluteCount2Min;
    if (nowPlayingAbsoluteCount2Min != objc_msgSend(v4, "nowPlayingAbsoluteCount2Min"))
      goto LABEL_192;
    v5 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
    v7 = *(_QWORD *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
    v8 = v4[49] | ((unint64_t)*((unsigned __int16 *)v4 + 100) << 32);
    LODWORD(v6) = v4[49];
  }
  v42 = (*(_DWORD *)&v5 >> 17) & 1;
  if (v42 != ((v6 >> 17) & 1))
    goto LABEL_192;
  if (v42)
  {
    nowPlayingAbsoluteCount10Min = self->_nowPlayingAbsoluteCount10Min;
    if (nowPlayingAbsoluteCount10Min != objc_msgSend(v4, "nowPlayingAbsoluteCount10Min"))
      goto LABEL_192;
    v5 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
    v7 = *(_QWORD *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
    v8 = v4[49] | ((unint64_t)*((unsigned __int16 *)v4 + 100) << 32);
    LODWORD(v6) = v4[49];
  }
  v44 = (*(_DWORD *)&v5 >> 18) & 1;
  if (v44 != ((v6 >> 18) & 1))
    goto LABEL_192;
  if (v44)
  {
    nowPlayingAbsoluteCount1Hr = self->_nowPlayingAbsoluteCount1Hr;
    if (nowPlayingAbsoluteCount1Hr != objc_msgSend(v4, "nowPlayingAbsoluteCount1Hr"))
      goto LABEL_192;
    v5 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
    v7 = *(_QWORD *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
    v8 = v4[49] | ((unint64_t)*((unsigned __int16 *)v4 + 100) << 32);
    LODWORD(v6) = v4[49];
  }
  v46 = (*(_DWORD *)&v5 >> 19) & 1;
  if (v46 != ((v6 >> 19) & 1))
    goto LABEL_192;
  if (v46)
  {
    nowPlayingAbsoluteCount6Hr = self->_nowPlayingAbsoluteCount6Hr;
    if (nowPlayingAbsoluteCount6Hr != objc_msgSend(v4, "nowPlayingAbsoluteCount6Hr"))
      goto LABEL_192;
    v5 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
    v7 = *(_QWORD *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
    v8 = v4[49] | ((unint64_t)*((unsigned __int16 *)v4 + 100) << 32);
    LODWORD(v6) = v4[49];
  }
  v48 = (*(_DWORD *)&v5 >> 20) & 1;
  if (v48 != ((v6 >> 20) & 1))
    goto LABEL_192;
  if (v48)
  {
    nowPlayingAbsoluteCount1Day = self->_nowPlayingAbsoluteCount1Day;
    if (nowPlayingAbsoluteCount1Day != objc_msgSend(v4, "nowPlayingAbsoluteCount1Day"))
      goto LABEL_192;
    v5 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
    v7 = *(_QWORD *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
    v8 = v4[49] | ((unint64_t)*((unsigned __int16 *)v4 + 100) << 32);
    LODWORD(v6) = v4[49];
  }
  v50 = (*(_DWORD *)&v5 >> 21) & 1;
  if (v50 != ((v6 >> 21) & 1))
    goto LABEL_192;
  if (v50)
  {
    nowPlayingAbsoluteCount7Day = self->_nowPlayingAbsoluteCount7Day;
    if (nowPlayingAbsoluteCount7Day != objc_msgSend(v4, "nowPlayingAbsoluteCount7Day"))
      goto LABEL_192;
    v5 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
    v7 = *(_QWORD *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
    v8 = v4[49] | ((unint64_t)*((unsigned __int16 *)v4 + 100) << 32);
    LODWORD(v6) = v4[49];
  }
  v52 = (*(_DWORD *)&v5 >> 22) & 1;
  if (v52 != ((v6 >> 22) & 1))
    goto LABEL_192;
  if (v52)
  {
    nowPlayingAbsoluteCount14Day = self->_nowPlayingAbsoluteCount14Day;
    if (nowPlayingAbsoluteCount14Day != objc_msgSend(v4, "nowPlayingAbsoluteCount14Day"))
      goto LABEL_192;
    v5 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
    v7 = *(_QWORD *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
    v8 = v4[49] | ((unint64_t)*((unsigned __int16 *)v4 + 100) << 32);
    LODWORD(v6) = v4[49];
  }
  v54 = (*(_DWORD *)&v5 >> 23) & 1;
  if (v54 != ((v6 >> 23) & 1))
    goto LABEL_192;
  if (v54)
  {
    nowPlayingAbsoluteCount28Day = self->_nowPlayingAbsoluteCount28Day;
    if (nowPlayingAbsoluteCount28Day != objc_msgSend(v4, "nowPlayingAbsoluteCount28Day"))
      goto LABEL_192;
    v5 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
    v7 = *(_QWORD *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
    v8 = v4[49] | ((unint64_t)*((unsigned __int16 *)v4 + 100) << 32);
    LODWORD(v6) = v4[49];
  }
  v56 = HIBYTE(*(_DWORD *)&v5) & 1;
  if (v56 != (BYTE3(v6) & 1))
    goto LABEL_192;
  if (v56)
  {
    isNowPlayingApp = self->_isNowPlayingApp;
    if (isNowPlayingApp != objc_msgSend(v4, "isNowPlayingApp"))
      goto LABEL_192;
    v5 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
    v7 = *(_QWORD *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
    v8 = v4[49] | ((unint64_t)*((unsigned __int16 *)v4 + 100) << 32);
    LODWORD(v6) = v4[49];
  }
  v58 = (*(_DWORD *)&v5 >> 25) & 1;
  if (v58 != ((v6 >> 25) & 1))
    goto LABEL_192;
  if (v58)
  {
    isSelectedApp = self->_isSelectedApp;
    if (isSelectedApp != objc_msgSend(v4, "isSelectedApp"))
      goto LABEL_192;
    v5 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
    v7 = *(_QWORD *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
    v8 = v4[49] | ((unint64_t)*((unsigned __int16 *)v4 + 100) << 32);
    LODWORD(v6) = v4[49];
  }
  v60 = (*(_DWORD *)&v5 >> 26) & 1;
  if (v60 != ((v6 >> 26) & 1))
    goto LABEL_192;
  if (v60)
  {
    timeSinceLastForegroundAppStartInSec = self->_timeSinceLastForegroundAppStartInSec;
    if (timeSinceLastForegroundAppStartInSec != objc_msgSend(v4, "timeSinceLastForegroundAppStartInSec"))
      goto LABEL_192;
    v5 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
    v7 = *(_QWORD *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
    v8 = v4[49] | ((unint64_t)*((unsigned __int16 *)v4 + 100) << 32);
    LODWORD(v6) = v4[49];
  }
  v62 = (*(_DWORD *)&v5 >> 27) & 1;
  if (v62 != ((v6 >> 27) & 1))
    goto LABEL_192;
  if (v62)
  {
    timeSinceLastForegroundAppEndInSec = self->_timeSinceLastForegroundAppEndInSec;
    if (timeSinceLastForegroundAppEndInSec != objc_msgSend(v4, "timeSinceLastForegroundAppEndInSec"))
      goto LABEL_192;
    v5 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
    v7 = *(_QWORD *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
    v8 = v4[49] | ((unint64_t)*((unsigned __int16 *)v4 + 100) << 32);
    LODWORD(v6) = v4[49];
  }
  v64 = (*(_DWORD *)&v5 >> 28) & 1;
  if (v64 != ((v6 >> 28) & 1))
    goto LABEL_192;
  if (v64)
  {
    timeSinceLastNowPlayingAppStartInSec = self->_timeSinceLastNowPlayingAppStartInSec;
    if (timeSinceLastNowPlayingAppStartInSec != objc_msgSend(v4, "timeSinceLastNowPlayingAppStartInSec"))
      goto LABEL_192;
    v5 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
    v7 = *(_QWORD *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
    v8 = v4[49] | ((unint64_t)*((unsigned __int16 *)v4 + 100) << 32);
    LODWORD(v6) = v4[49];
  }
  v66 = (*(_DWORD *)&v5 >> 29) & 1;
  if (v66 != ((v6 >> 29) & 1))
    goto LABEL_192;
  if (v66)
  {
    timeSinceLastNowPlayingAppEndInSec = self->_timeSinceLastNowPlayingAppEndInSec;
    if (timeSinceLastNowPlayingAppEndInSec != objc_msgSend(v4, "timeSinceLastNowPlayingAppEndInSec"))
      goto LABEL_192;
    v5 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
    v7 = *(_QWORD *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
    v8 = v4[49] | ((unint64_t)*((unsigned __int16 *)v4 + 100) << 32);
    LODWORD(v6) = v4[49];
  }
  v68 = (*(_DWORD *)&v5 >> 30) & 1;
  if (v68 != ((v6 >> 30) & 1))
    goto LABEL_192;
  if (v68)
  {
    spotlightRelativeCount = self->_spotlightRelativeCount;
    if (spotlightRelativeCount != objc_msgSend(v4, "spotlightRelativeCount"))
      goto LABEL_192;
    v7 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
    v8 = v4[49] | ((unint64_t)*((unsigned __int16 *)v4 + 100) << 32);
  }
  if (((v8 ^ v7) & 0x80000000) != 0)
    goto LABEL_192;
  if ((v7 & 0x80000000) != 0)
  {
    supportedMediaCategories = self->_supportedMediaCategories;
    if (supportedMediaCategories != objc_msgSend(v4, "supportedMediaCategories"))
      goto LABEL_192;
    v70 = *((unsigned __int16 *)v4 + 100);
    LODWORD(v71) = v70 >> 1;
    LODWORD(v72) = v70 >> 2;
    LODWORD(v73) = v70 >> 3;
    LODWORD(v74) = v70 >> 4;
    v75 = v70 >> 5;
    v76 = v70 >> 6;
    LODWORD(v77) = v70 >> 7;
    v78 = v70 >> 8;
    LODWORD(v79) = v70 >> 9;
    v96 = *((unsigned __int16 *)&self->_has + 2);
    LODWORD(v143) = v70 >> 11;
    LODWORD(v81) = v96 >> 1;
    LODWORD(v142) = v70 >> 12;
    LODWORD(v82) = v96 >> 2;
    LODWORD(v145) = v70 >> 13;
    LODWORD(v146) = v70 >> 10;
    LODWORD(v83) = v96 >> 3;
    LODWORD(v144) = v70 >> 14;
    LODWORD(v84) = v96 >> 4;
    LODWORD(v85) = v96 >> 5;
    LODWORD(v86) = v96 >> 6;
    v87 = v96 >> 7;
    v88 = v96 >> 8;
    v89 = v96 >> 9;
    v90 = v96 >> 10;
    LODWORD(v91) = v96 >> 11;
    LODWORD(v92) = v96 >> 12;
    LODWORD(v93) = v96 >> 13;
    v80 = *((_WORD *)&self->_has + 2);
    LODWORD(v94) = v96 >> 14;
  }
  else
  {
    LOBYTE(v70) = BYTE4(v8);
    v71 = (v8 >> 33) & 0x7FFF;
    v72 = (v8 >> 34) & 0x3FFF;
    v73 = (v8 >> 35) & 0x1FFF;
    v74 = (v8 >> 36) & 0xFFF;
    v75 = (v8 >> 37) & 0x7FF;
    v76 = (v8 >> 38) & 0x3FF;
    v77 = (v8 >> 39) & 0x1FF;
    LOBYTE(v78) = BYTE5(v8);
    v79 = (v8 >> 41) & 0x7F;
    v143 = (v8 >> 43) & 0x1F;
    v142 = (v8 >> 44) & 0xF;
    v145 = (v8 >> 45) & 7;
    v146 = (v8 >> 42) & 0x3F;
    v144 = (v8 >> 46) & 3;
    LOBYTE(v80) = BYTE4(v7);
    v81 = (v7 >> 33) & 0x7FFF;
    v82 = (v7 >> 34) & 0x3FFF;
    v83 = (v7 >> 35) & 0x1FFF;
    v84 = (v7 >> 36) & 0xFFF;
    v85 = (v7 >> 37) & 0x7FF;
    v86 = (v7 >> 38) & 0x3FF;
    v87 = (v7 >> 39) & 0x1FF;
    v88 = BYTE5(v7);
    v89 = (v7 >> 41) & 0x7F;
    v90 = (v7 >> 42) & 0x3F;
    v91 = (v7 >> 43) & 0x1F;
    v92 = (v7 >> 44) & 0xF;
    v93 = (v7 >> 45) & 7;
    v94 = (v7 >> 46) & 3;
  }
  if ((v80 & 1) != (v70 & 1))
    goto LABEL_192;
  if ((v80 & 1) != 0)
  {
    isForegroundApp = self->_isForegroundApp;
    if (isForegroundApp != objc_msgSend(v4, "isForegroundApp", v90, v76, v89, v88, v75, v87))
      goto LABEL_192;
    v98 = *((unsigned __int16 *)v4 + 100);
    LODWORD(v71) = v98 >> 1;
    LODWORD(v72) = v98 >> 2;
    LODWORD(v73) = v98 >> 3;
    LODWORD(v74) = v98 >> 4;
    v75 = v98 >> 5;
    v76 = v98 >> 6;
    LODWORD(v77) = v98 >> 7;
    v78 = v98 >> 8;
    LODWORD(v79) = v98 >> 9;
    LODWORD(v146) = v98 >> 10;
    v99 = *((unsigned __int16 *)&self->_has + 2);
    LODWORD(v142) = v98 >> 12;
    LODWORD(v143) = v98 >> 11;
    LODWORD(v82) = v99 >> 2;
    LODWORD(v144) = v98 >> 14;
    LODWORD(v145) = v98 >> 13;
    LODWORD(v83) = v99 >> 3;
    LODWORD(v81) = v99 >> 1;
    LODWORD(v84) = v99 >> 4;
    LODWORD(v85) = v99 >> 5;
    LODWORD(v86) = v99 >> 6;
    v87 = v99 >> 7;
    v88 = v99 >> 8;
    v89 = v99 >> 9;
    v90 = v99 >> 10;
    LODWORD(v91) = v99 >> 11;
    LODWORD(v92) = v99 >> 12;
    LODWORD(v93) = v99 >> 13;
    LODWORD(v94) = v99 >> 14;
  }
  v100 = v81 & 1;
  if (v100 != (v71 & 1))
    goto LABEL_192;
  if (v100)
  {
    entityPartialSiriCount2Min = self->_entityPartialSiriCount2Min;
    if (entityPartialSiriCount2Min != objc_msgSend(v4, "entityPartialSiriCount2Min", v90, v76, v89, v88, v75, v87))goto LABEL_192;
    v102 = *((unsigned __int16 *)v4 + 100);
    LODWORD(v72) = v102 >> 2;
    LODWORD(v73) = v102 >> 3;
    LODWORD(v74) = v102 >> 4;
    v75 = v102 >> 5;
    v76 = v102 >> 6;
    LODWORD(v77) = v102 >> 7;
    v78 = v102 >> 8;
    LODWORD(v79) = v102 >> 9;
    v103 = *((unsigned __int16 *)&self->_has + 2);
    LODWORD(v82) = v103 >> 2;
    LODWORD(v142) = v102 >> 12;
    LODWORD(v143) = v102 >> 11;
    LODWORD(v145) = v102 >> 13;
    LODWORD(v146) = v102 >> 10;
    LODWORD(v83) = v103 >> 3;
    LODWORD(v144) = v102 >> 14;
    LODWORD(v84) = v103 >> 4;
    LODWORD(v85) = v103 >> 5;
    LODWORD(v86) = v103 >> 6;
    v87 = v103 >> 7;
    v88 = v103 >> 8;
    v89 = v103 >> 9;
    v90 = v103 >> 10;
    LODWORD(v91) = v103 >> 11;
    LODWORD(v92) = v103 >> 12;
    LODWORD(v93) = v103 >> 13;
    LODWORD(v94) = v103 >> 14;
  }
  if ((v82 & 1) != (v72 & 1))
    goto LABEL_192;
  if ((v82 & 1) != 0)
  {
    entityPartialSiriCount10Min = self->_entityPartialSiriCount10Min;
    if (entityPartialSiriCount10Min != objc_msgSend(v4, "entityPartialSiriCount10Min", v90, v76, v89, v88, v75, v87))goto LABEL_192;
    v105 = *((unsigned __int16 *)v4 + 100);
    LODWORD(v73) = v105 >> 3;
    LODWORD(v74) = v105 >> 4;
    v75 = v105 >> 5;
    v76 = v105 >> 6;
    LODWORD(v77) = v105 >> 7;
    v78 = v105 >> 8;
    LODWORD(v79) = v105 >> 9;
    v106 = *((unsigned __int16 *)&self->_has + 2);
    LODWORD(v83) = v106 >> 3;
    LODWORD(v84) = v106 >> 4;
    LODWORD(v142) = v105 >> 12;
    LODWORD(v143) = v105 >> 11;
    LODWORD(v145) = v105 >> 13;
    LODWORD(v146) = v105 >> 10;
    LODWORD(v144) = v105 >> 14;
    LODWORD(v85) = v106 >> 5;
    LODWORD(v86) = v106 >> 6;
    v87 = v106 >> 7;
    v88 = v106 >> 8;
    v89 = v106 >> 9;
    v90 = v106 >> 10;
    LODWORD(v91) = v106 >> 11;
    LODWORD(v92) = v106 >> 12;
    LODWORD(v93) = v106 >> 13;
    LODWORD(v94) = v106 >> 14;
  }
  if ((v83 & 1) != (v73 & 1))
    goto LABEL_192;
  if ((v83 & 1) != 0)
  {
    entityPartialSiriCount1Hr = self->_entityPartialSiriCount1Hr;
    if (entityPartialSiriCount1Hr != objc_msgSend(v4, "entityPartialSiriCount1Hr", v90, v76, v89, v88, v75, v87))goto LABEL_192;
    v108 = *((unsigned __int16 *)v4 + 100);
    LODWORD(v74) = v108 >> 4;
    v75 = v108 >> 5;
    v76 = v108 >> 6;
    LODWORD(v77) = v108 >> 7;
    v78 = v108 >> 8;
    LODWORD(v79) = v108 >> 9;
    v109 = *((unsigned __int16 *)&self->_has + 2);
    LODWORD(v84) = v109 >> 4;
    LODWORD(v85) = v109 >> 5;
    LODWORD(v86) = v109 >> 6;
    LODWORD(v142) = v108 >> 12;
    LODWORD(v143) = v108 >> 11;
    LODWORD(v145) = v108 >> 13;
    LODWORD(v146) = v108 >> 10;
    LODWORD(v144) = v108 >> 14;
    v87 = v109 >> 7;
    v88 = v109 >> 8;
    v89 = v109 >> 9;
    v90 = v109 >> 10;
    LODWORD(v91) = v109 >> 11;
    LODWORD(v92) = v109 >> 12;
    LODWORD(v93) = v109 >> 13;
    LODWORD(v94) = v109 >> 14;
  }
  if ((v84 & 1) != (v74 & 1))
    goto LABEL_192;
  if ((v84 & 1) != 0)
  {
    entityPartialSiriCount6Hr = self->_entityPartialSiriCount6Hr;
    if (entityPartialSiriCount6Hr != objc_msgSend(v4, "entityPartialSiriCount6Hr", v90, v76, v89, v88, v75, v87))goto LABEL_192;
    v111 = *((unsigned __int16 *)v4 + 100);
    LODWORD(v75) = v111 >> 5;
    v76 = v111 >> 6;
    LODWORD(v77) = v111 >> 7;
    v78 = v111 >> 8;
    LODWORD(v79) = v111 >> 9;
    v112 = *((unsigned __int16 *)&self->_has + 2);
    LODWORD(v85) = v112 >> 5;
    LODWORD(v86) = v112 >> 6;
    LODWORD(v87) = v112 >> 7;
    v88 = v112 >> 8;
    LODWORD(v142) = v111 >> 12;
    LODWORD(v143) = v111 >> 11;
    LODWORD(v145) = v111 >> 13;
    LODWORD(v146) = v111 >> 10;
    LODWORD(v144) = v111 >> 14;
    v89 = v112 >> 9;
    v90 = v112 >> 10;
    LODWORD(v91) = v112 >> 11;
    LODWORD(v92) = v112 >> 12;
    LODWORD(v93) = v112 >> 13;
    LODWORD(v94) = v112 >> 14;
  }
  if ((v85 & 1) != (v75 & 1))
    goto LABEL_192;
  if ((v85 & 1) != 0)
  {
    entityPartialSiriCount1Day = self->_entityPartialSiriCount1Day;
    if (entityPartialSiriCount1Day != objc_msgSend(v4, "entityPartialSiriCount1Day", v90, v76, v89, v88))
      goto LABEL_192;
    v114 = *((unsigned __int16 *)v4 + 100);
    LODWORD(v76) = v114 >> 6;
    LODWORD(v77) = v114 >> 7;
    v78 = v114 >> 8;
    LODWORD(v79) = v114 >> 9;
    v115 = *((unsigned __int16 *)&self->_has + 2);
    LODWORD(v86) = v115 >> 6;
    LODWORD(v87) = v115 >> 7;
    LODWORD(v88) = v115 >> 8;
    LODWORD(v89) = v115 >> 9;
    v90 = v115 >> 10;
    LODWORD(v142) = v114 >> 12;
    LODWORD(v143) = v114 >> 11;
    LODWORD(v145) = v114 >> 13;
    LODWORD(v146) = v114 >> 10;
    LODWORD(v144) = v114 >> 14;
    LODWORD(v91) = v115 >> 11;
    LODWORD(v92) = v115 >> 12;
    LODWORD(v93) = v115 >> 13;
    LODWORD(v94) = v115 >> 14;
  }
  if ((v86 & 1) != (v76 & 1))
    goto LABEL_192;
  if ((v86 & 1) != 0)
  {
    entityPartialSiriCount7Day = self->_entityPartialSiriCount7Day;
    if (entityPartialSiriCount7Day != objc_msgSend(v4, "entityPartialSiriCount7Day", v90))
      goto LABEL_192;
    v117 = *((unsigned __int16 *)v4 + 100);
    LODWORD(v77) = v117 >> 7;
    v78 = v117 >> 8;
    LODWORD(v79) = v117 >> 9;
    v118 = *((unsigned __int16 *)&self->_has + 2);
    LODWORD(v87) = v118 >> 7;
    LODWORD(v88) = v118 >> 8;
    LODWORD(v89) = v118 >> 9;
    v90 = v118 >> 10;
    LODWORD(v91) = v118 >> 11;
    LODWORD(v92) = v118 >> 12;
    LODWORD(v142) = v117 >> 12;
    LODWORD(v143) = v117 >> 11;
    LODWORD(v145) = v117 >> 13;
    LODWORD(v146) = v117 >> 10;
    LODWORD(v144) = v117 >> 14;
    LODWORD(v93) = v118 >> 13;
    LODWORD(v94) = v118 >> 14;
  }
  if ((v87 & 1) != (v77 & 1))
    goto LABEL_192;
  if ((v87 & 1) != 0)
  {
    entityPartialSiriCount28Day = self->_entityPartialSiriCount28Day;
    if (entityPartialSiriCount28Day != objc_msgSend(v4, "entityPartialSiriCount28Day", v90))
      goto LABEL_192;
    v120 = *((unsigned __int16 *)v4 + 100);
    v78 = v120 >> 8;
    LODWORD(v79) = v120 >> 9;
    v121 = *((unsigned __int16 *)&self->_has + 2);
    LODWORD(v88) = v121 >> 8;
    LODWORD(v89) = v121 >> 9;
    v90 = v121 >> 10;
    LODWORD(v91) = v121 >> 11;
    LODWORD(v92) = v121 >> 12;
    LODWORD(v93) = v121 >> 13;
    LODWORD(v94) = v121 >> 14;
    LODWORD(v142) = v120 >> 12;
    LODWORD(v143) = v120 >> 11;
    LODWORD(v145) = v120 >> 13;
    LODWORD(v146) = v120 >> 10;
    LODWORD(v144) = v120 >> 14;
  }
  if ((v88 & 1) != (v78 & 1))
    goto LABEL_192;
  if ((v88 & 1) != 0)
  {
    entityPartialAppCount2Min = self->_entityPartialAppCount2Min;
    if (entityPartialAppCount2Min != objc_msgSend(v4, "entityPartialAppCount2Min", v90))
      goto LABEL_192;
    v123 = *((unsigned __int16 *)v4 + 100);
    LODWORD(v79) = v123 >> 9;
    v124 = *((unsigned __int16 *)&self->_has + 2);
    LODWORD(v89) = v124 >> 9;
    v90 = v124 >> 10;
    LODWORD(v91) = v124 >> 11;
    LODWORD(v92) = v124 >> 12;
    LODWORD(v93) = v124 >> 13;
    LODWORD(v94) = v124 >> 14;
    LODWORD(v142) = v123 >> 12;
    LODWORD(v143) = v123 >> 11;
    LODWORD(v145) = v123 >> 13;
    LODWORD(v146) = v123 >> 10;
    LODWORD(v144) = v123 >> 14;
  }
  if ((v89 & 1) != (v79 & 1))
    goto LABEL_192;
  if ((v89 & 1) != 0)
  {
    entityPartialAppCount10Min = self->_entityPartialAppCount10Min;
    if (entityPartialAppCount10Min != objc_msgSend(v4, "entityPartialAppCount10Min", v90))
      goto LABEL_192;
    v126 = *((unsigned __int16 *)v4 + 100);
    v127 = *((unsigned __int16 *)&self->_has + 2);
    LODWORD(v90) = v127 >> 10;
    LODWORD(v91) = v127 >> 11;
    LODWORD(v92) = v127 >> 12;
    LODWORD(v93) = v127 >> 13;
    LODWORD(v94) = v127 >> 14;
    LODWORD(v142) = v126 >> 12;
    LODWORD(v143) = v126 >> 11;
    LODWORD(v145) = v126 >> 13;
    LODWORD(v146) = v126 >> 10;
    LODWORD(v144) = v126 >> 14;
  }
  if ((v90 & 1) != (v146 & 1))
    goto LABEL_192;
  if ((v90 & 1) != 0)
  {
    entityPartialAppCount1Hr = self->_entityPartialAppCount1Hr;
    if (entityPartialAppCount1Hr != objc_msgSend(v4, "entityPartialAppCount1Hr"))
      goto LABEL_192;
    v129 = *((unsigned __int16 *)v4 + 100);
    v130 = *((unsigned __int16 *)&self->_has + 2);
    LODWORD(v91) = v130 >> 11;
    LODWORD(v92) = v130 >> 12;
    LODWORD(v93) = v130 >> 13;
    LODWORD(v94) = v130 >> 14;
    LODWORD(v142) = v129 >> 12;
    LODWORD(v143) = v129 >> 11;
    LODWORD(v144) = v129 >> 14;
    LODWORD(v145) = v129 >> 13;
  }
  if ((v91 & 1) != (v143 & 1))
    goto LABEL_192;
  if ((v91 & 1) != 0)
  {
    entityPartialAppCount6Hr = self->_entityPartialAppCount6Hr;
    if (entityPartialAppCount6Hr != objc_msgSend(v4, "entityPartialAppCount6Hr"))
      goto LABEL_192;
    v132 = *((unsigned __int16 *)v4 + 100);
    v133 = *((unsigned __int16 *)&self->_has + 2);
    LODWORD(v92) = v133 >> 12;
    LODWORD(v93) = v133 >> 13;
    LODWORD(v94) = v133 >> 14;
    LODWORD(v142) = v132 >> 12;
    LODWORD(v144) = v132 >> 14;
    LODWORD(v145) = v132 >> 13;
  }
  if ((v92 & 1) != (v142 & 1))
    goto LABEL_192;
  if ((v92 & 1) != 0)
  {
    entityPartialAppCount1Day = self->_entityPartialAppCount1Day;
    if (entityPartialAppCount1Day != objc_msgSend(v4, "entityPartialAppCount1Day"))
      goto LABEL_192;
    v135 = *((unsigned __int16 *)&self->_has + 2);
    v136 = *((unsigned __int16 *)v4 + 100);
    LODWORD(v93) = v135 >> 13;
    LODWORD(v94) = v135 >> 14;
    LODWORD(v144) = v136 >> 14;
    LODWORD(v145) = v136 >> 13;
  }
  if ((v93 & 1) != (v145 & 1))
    goto LABEL_192;
  if ((v93 & 1) != 0)
  {
    entityPartialAppCount7Day = self->_entityPartialAppCount7Day;
    if (entityPartialAppCount7Day == objc_msgSend(v4, "entityPartialAppCount7Day"))
    {
      LODWORD(v94) = *((unsigned __int16 *)&self->_has + 2) >> 14;
      LODWORD(v144) = *((unsigned __int16 *)v4 + 100) >> 14;
      goto LABEL_188;
    }
LABEL_192:
    v140 = 0;
    goto LABEL_193;
  }
LABEL_188:
  v138 = v94 & 1;
  if (v138 != (v144 & 1))
    goto LABEL_192;
  if (v138)
  {
    entityPartialAppCount28Day = self->_entityPartialAppCount28Day;
    if (entityPartialAppCount28Day != objc_msgSend(v4, "entityPartialAppCount28Day"))
      goto LABEL_192;
  }
  v140 = 1;
LABEL_193:

  return v140;
}

- (unint64_t)hash
{
  $36A3CCAAE4681EBA138F0132699ACCCC v2;
  unint64_t v3;
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
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;

  v2 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  v3 = *(_QWORD *)&v2 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_BYTE *)&v2 & 1) != 0)
  {
    v51 = 2654435761 * self->_relativeAppUsage1Day;
    if ((*(_BYTE *)&v2 & 2) != 0)
    {
LABEL_3:
      v50 = 2654435761 * self->_relativeAppUsage7Day;
      if ((*(_BYTE *)&v2 & 4) != 0)
        goto LABEL_4;
      goto LABEL_51;
    }
  }
  else
  {
    v51 = 0;
    if ((*(_BYTE *)&v2 & 2) != 0)
      goto LABEL_3;
  }
  v50 = 0;
  if ((*(_BYTE *)&v2 & 4) != 0)
  {
LABEL_4:
    v49 = 2654435761 * self->_relativeAppUsage14Day;
    if ((*(_BYTE *)&v2 & 8) != 0)
      goto LABEL_5;
    goto LABEL_52;
  }
LABEL_51:
  v49 = 0;
  if ((*(_BYTE *)&v2 & 8) != 0)
  {
LABEL_5:
    v48 = 2654435761 * self->_entityAbsoluteCount2Min;
    if ((*(_BYTE *)&v2 & 0x10) != 0)
      goto LABEL_6;
    goto LABEL_53;
  }
LABEL_52:
  v48 = 0;
  if ((*(_BYTE *)&v2 & 0x10) != 0)
  {
LABEL_6:
    v47 = 2654435761 * self->_entityAbsoluteCount10Min;
    if ((*(_BYTE *)&v2 & 0x20) != 0)
      goto LABEL_7;
    goto LABEL_54;
  }
LABEL_53:
  v47 = 0;
  if ((*(_BYTE *)&v2 & 0x20) != 0)
  {
LABEL_7:
    v46 = 2654435761 * self->_entityAbsoluteCount1Hr;
    if ((*(_BYTE *)&v2 & 0x40) != 0)
      goto LABEL_8;
    goto LABEL_55;
  }
LABEL_54:
  v46 = 0;
  if ((*(_BYTE *)&v2 & 0x40) != 0)
  {
LABEL_8:
    v45 = 2654435761 * self->_entityAbsoluteCount6Hr;
    if ((*(_BYTE *)&v2 & 0x80) != 0)
      goto LABEL_9;
    goto LABEL_56;
  }
LABEL_55:
  v45 = 0;
  if ((*(_BYTE *)&v2 & 0x80) != 0)
  {
LABEL_9:
    v44 = 2654435761 * self->_entityAbsoluteCount1Day;
    if ((*(_WORD *)&v2 & 0x100) != 0)
      goto LABEL_10;
    goto LABEL_57;
  }
LABEL_56:
  v44 = 0;
  if ((*(_WORD *)&v2 & 0x100) != 0)
  {
LABEL_10:
    v43 = 2654435761 * self->_entityAbsoluteCount7Day;
    if ((*(_WORD *)&v2 & 0x200) != 0)
      goto LABEL_11;
    goto LABEL_58;
  }
LABEL_57:
  v43 = 0;
  if ((*(_WORD *)&v2 & 0x200) != 0)
  {
LABEL_11:
    v42 = 2654435761 * self->_entityAbsoluteCount14Day;
    if ((*(_WORD *)&v2 & 0x400) != 0)
      goto LABEL_12;
    goto LABEL_59;
  }
LABEL_58:
  v42 = 0;
  if ((*(_WORD *)&v2 & 0x400) != 0)
  {
LABEL_12:
    v41 = 2654435761 * self->_entityAbsoluteCount28Day;
    if ((*(_WORD *)&v2 & 0x800) != 0)
      goto LABEL_13;
    goto LABEL_60;
  }
LABEL_59:
  v41 = 0;
  if ((*(_WORD *)&v2 & 0x800) != 0)
  {
LABEL_13:
    v40 = 2654435761 * self->_entityRecency;
    if ((*(_WORD *)&v2 & 0x1000) != 0)
      goto LABEL_14;
    goto LABEL_61;
  }
LABEL_60:
  v40 = 0;
  if ((*(_WORD *)&v2 & 0x1000) != 0)
  {
LABEL_14:
    v39 = 2654435761 * self->_mediaUserContextNumberOfLibraryItems;
    if ((*(_WORD *)&v2 & 0x2000) != 0)
      goto LABEL_15;
    goto LABEL_62;
  }
LABEL_61:
  v39 = 0;
  if ((*(_WORD *)&v2 & 0x2000) != 0)
  {
LABEL_15:
    v38 = 2654435761 * self->_mediaUserContextSubscriptionStatus;
    if ((*(_WORD *)&v2 & 0x4000) != 0)
      goto LABEL_16;
    goto LABEL_63;
  }
LABEL_62:
  v38 = 0;
  if ((*(_WORD *)&v2 & 0x4000) != 0)
  {
LABEL_16:
    v37 = 2654435761 * self->_isLastForegroundApp;
    if ((*(_WORD *)&v2 & 0x8000) != 0)
      goto LABEL_17;
    goto LABEL_64;
  }
LABEL_63:
  v37 = 0;
  if ((*(_WORD *)&v2 & 0x8000) != 0)
  {
LABEL_17:
    v36 = 2654435761 * self->_isLastNowPlayingApp;
    if ((*(_DWORD *)&v2 & 0x10000) != 0)
      goto LABEL_18;
    goto LABEL_65;
  }
LABEL_64:
  v36 = 0;
  if ((*(_DWORD *)&v2 & 0x10000) != 0)
  {
LABEL_18:
    v35 = 2654435761 * self->_nowPlayingAbsoluteCount2Min;
    if ((*(_DWORD *)&v2 & 0x20000) != 0)
      goto LABEL_19;
    goto LABEL_66;
  }
LABEL_65:
  v35 = 0;
  if ((*(_DWORD *)&v2 & 0x20000) != 0)
  {
LABEL_19:
    v34 = 2654435761 * self->_nowPlayingAbsoluteCount10Min;
    if ((*(_DWORD *)&v2 & 0x40000) != 0)
      goto LABEL_20;
    goto LABEL_67;
  }
LABEL_66:
  v34 = 0;
  if ((*(_DWORD *)&v2 & 0x40000) != 0)
  {
LABEL_20:
    v33 = 2654435761 * self->_nowPlayingAbsoluteCount1Hr;
    if ((*(_DWORD *)&v2 & 0x80000) != 0)
      goto LABEL_21;
    goto LABEL_68;
  }
LABEL_67:
  v33 = 0;
  if ((*(_DWORD *)&v2 & 0x80000) != 0)
  {
LABEL_21:
    v32 = 2654435761 * self->_nowPlayingAbsoluteCount6Hr;
    if ((*(_DWORD *)&v2 & 0x100000) != 0)
      goto LABEL_22;
    goto LABEL_69;
  }
LABEL_68:
  v32 = 0;
  if ((*(_DWORD *)&v2 & 0x100000) != 0)
  {
LABEL_22:
    v31 = 2654435761 * self->_nowPlayingAbsoluteCount1Day;
    if ((*(_DWORD *)&v2 & 0x200000) != 0)
      goto LABEL_23;
    goto LABEL_70;
  }
LABEL_69:
  v31 = 0;
  if ((*(_DWORD *)&v2 & 0x200000) != 0)
  {
LABEL_23:
    v4 = 2654435761 * self->_nowPlayingAbsoluteCount7Day;
    if ((*(_DWORD *)&v2 & 0x400000) != 0)
      goto LABEL_24;
    goto LABEL_71;
  }
LABEL_70:
  v4 = 0;
  if ((*(_DWORD *)&v2 & 0x400000) != 0)
  {
LABEL_24:
    v5 = 2654435761 * self->_nowPlayingAbsoluteCount14Day;
    if ((*(_DWORD *)&v2 & 0x800000) != 0)
      goto LABEL_25;
    goto LABEL_72;
  }
LABEL_71:
  v5 = 0;
  if ((*(_DWORD *)&v2 & 0x800000) != 0)
  {
LABEL_25:
    v6 = 2654435761 * self->_nowPlayingAbsoluteCount28Day;
    if ((*(_DWORD *)&v2 & 0x1000000) != 0)
      goto LABEL_26;
    goto LABEL_73;
  }
LABEL_72:
  v6 = 0;
  if ((*(_DWORD *)&v2 & 0x1000000) != 0)
  {
LABEL_26:
    v7 = 2654435761 * self->_isNowPlayingApp;
    if ((*(_DWORD *)&v2 & 0x2000000) != 0)
      goto LABEL_27;
    goto LABEL_74;
  }
LABEL_73:
  v7 = 0;
  if ((*(_DWORD *)&v2 & 0x2000000) != 0)
  {
LABEL_27:
    v8 = 2654435761 * self->_isSelectedApp;
    if ((*(_DWORD *)&v2 & 0x4000000) != 0)
      goto LABEL_28;
    goto LABEL_75;
  }
LABEL_74:
  v8 = 0;
  if ((*(_DWORD *)&v2 & 0x4000000) != 0)
  {
LABEL_28:
    v9 = 2654435761 * self->_timeSinceLastForegroundAppStartInSec;
    if ((v3 & 0x8000000) != 0)
      goto LABEL_29;
    goto LABEL_76;
  }
LABEL_75:
  v9 = 0;
  if ((v3 & 0x8000000) != 0)
  {
LABEL_29:
    v10 = 2654435761 * self->_timeSinceLastForegroundAppEndInSec;
    if ((v3 & 0x10000000) != 0)
      goto LABEL_30;
    goto LABEL_77;
  }
LABEL_76:
  v10 = 0;
  if ((v3 & 0x10000000) != 0)
  {
LABEL_30:
    v11 = 2654435761 * self->_timeSinceLastNowPlayingAppStartInSec;
    if ((v3 & 0x20000000) != 0)
      goto LABEL_31;
    goto LABEL_78;
  }
LABEL_77:
  v11 = 0;
  if ((v3 & 0x20000000) != 0)
  {
LABEL_31:
    v12 = 2654435761 * self->_timeSinceLastNowPlayingAppEndInSec;
    if ((v3 & 0x40000000) != 0)
      goto LABEL_32;
    goto LABEL_79;
  }
LABEL_78:
  v12 = 0;
  if ((v3 & 0x40000000) != 0)
  {
LABEL_32:
    v13 = 2654435761 * self->_spotlightRelativeCount;
    if ((v3 & 0x80000000) != 0)
      goto LABEL_33;
    goto LABEL_80;
  }
LABEL_79:
  v13 = 0;
  if ((v3 & 0x80000000) != 0)
  {
LABEL_33:
    v14 = 2654435761u * self->_supportedMediaCategories;
    if ((v3 & 0x100000000) != 0)
      goto LABEL_34;
    goto LABEL_81;
  }
LABEL_80:
  v14 = 0;
  if ((v3 & 0x100000000) != 0)
  {
LABEL_34:
    v15 = 2654435761 * self->_isForegroundApp;
    if ((v3 & 0x200000000) != 0)
      goto LABEL_35;
    goto LABEL_82;
  }
LABEL_81:
  v15 = 0;
  if ((v3 & 0x200000000) != 0)
  {
LABEL_35:
    v16 = 2654435761 * self->_entityPartialSiriCount2Min;
    if ((v3 & 0x400000000) != 0)
      goto LABEL_36;
    goto LABEL_83;
  }
LABEL_82:
  v16 = 0;
  if ((v3 & 0x400000000) != 0)
  {
LABEL_36:
    v17 = 2654435761 * self->_entityPartialSiriCount10Min;
    if ((v3 & 0x800000000) != 0)
      goto LABEL_37;
    goto LABEL_84;
  }
LABEL_83:
  v17 = 0;
  if ((v3 & 0x800000000) != 0)
  {
LABEL_37:
    v18 = 2654435761 * self->_entityPartialSiriCount1Hr;
    if ((v3 & 0x1000000000) != 0)
      goto LABEL_38;
    goto LABEL_85;
  }
LABEL_84:
  v18 = 0;
  if ((v3 & 0x1000000000) != 0)
  {
LABEL_38:
    v19 = 2654435761 * self->_entityPartialSiriCount6Hr;
    if ((v3 & 0x2000000000) != 0)
      goto LABEL_39;
    goto LABEL_86;
  }
LABEL_85:
  v19 = 0;
  if ((v3 & 0x2000000000) != 0)
  {
LABEL_39:
    v20 = 2654435761 * self->_entityPartialSiriCount1Day;
    if ((v3 & 0x4000000000) != 0)
      goto LABEL_40;
    goto LABEL_87;
  }
LABEL_86:
  v20 = 0;
  if ((v3 & 0x4000000000) != 0)
  {
LABEL_40:
    v21 = 2654435761 * self->_entityPartialSiriCount7Day;
    if ((v3 & 0x8000000000) != 0)
      goto LABEL_41;
    goto LABEL_88;
  }
LABEL_87:
  v21 = 0;
  if ((v3 & 0x8000000000) != 0)
  {
LABEL_41:
    v22 = 2654435761 * self->_entityPartialSiriCount28Day;
    if ((v3 & 0x10000000000) != 0)
      goto LABEL_42;
    goto LABEL_89;
  }
LABEL_88:
  v22 = 0;
  if ((v3 & 0x10000000000) != 0)
  {
LABEL_42:
    v23 = 2654435761 * self->_entityPartialAppCount2Min;
    if ((v3 & 0x20000000000) != 0)
      goto LABEL_43;
    goto LABEL_90;
  }
LABEL_89:
  v23 = 0;
  if ((v3 & 0x20000000000) != 0)
  {
LABEL_43:
    v24 = 2654435761 * self->_entityPartialAppCount10Min;
    if ((v3 & 0x40000000000) != 0)
      goto LABEL_44;
    goto LABEL_91;
  }
LABEL_90:
  v24 = 0;
  if ((v3 & 0x40000000000) != 0)
  {
LABEL_44:
    v25 = 2654435761 * self->_entityPartialAppCount1Hr;
    if ((v3 & 0x80000000000) != 0)
      goto LABEL_45;
    goto LABEL_92;
  }
LABEL_91:
  v25 = 0;
  if ((v3 & 0x80000000000) != 0)
  {
LABEL_45:
    v26 = 2654435761 * self->_entityPartialAppCount6Hr;
    if ((v3 & 0x100000000000) != 0)
      goto LABEL_46;
    goto LABEL_93;
  }
LABEL_92:
  v26 = 0;
  if ((v3 & 0x100000000000) != 0)
  {
LABEL_46:
    v27 = 2654435761 * self->_entityPartialAppCount1Day;
    if ((v3 & 0x200000000000) != 0)
      goto LABEL_47;
LABEL_94:
    v28 = 0;
    if ((v3 & 0x400000000000) != 0)
      goto LABEL_48;
LABEL_95:
    v29 = 0;
    return v50 ^ v51 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29;
  }
LABEL_93:
  v27 = 0;
  if ((v3 & 0x200000000000) == 0)
    goto LABEL_94;
LABEL_47:
  v28 = 2654435761 * self->_entityPartialAppCount7Day;
  if ((v3 & 0x400000000000) == 0)
    goto LABEL_95;
LABEL_48:
  v29 = 2654435761 * self->_entityPartialAppCount28Day;
  return v50 ^ v51 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29;
}

- (id)dictionaryRepresentation
{
  void *v3;
  $36A3CCAAE4681EBA138F0132699ACCCC v4;
  unint64_t v5;
  void *v6;
  id v7;
  void *v9;
  $36A3CCAAE4681EBA138F0132699ACCCC v10;
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  v5 = *(_QWORD *)&v4 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_BYTE *)&v4 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals entityAbsoluteCount10Min](self, "entityAbsoluteCount10Min"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("entityAbsoluteCount10Min"));

    v10 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
    v5 = *(_QWORD *)&v10 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
    if ((*(_WORD *)&v10 & 0x200) == 0)
    {
LABEL_3:
      if ((v5 & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_52;
    }
  }
  else if ((*(_WORD *)&v4 & 0x200) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals entityAbsoluteCount14Day](self, "entityAbsoluteCount14Day"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("entityAbsoluteCount14Day"));

  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x80) == 0)
  {
LABEL_4:
    if ((v5 & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_53;
  }
LABEL_52:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals entityAbsoluteCount1Day](self, "entityAbsoluteCount1Day"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("entityAbsoluteCount1Day"));

  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x20) == 0)
  {
LABEL_5:
    if ((v5 & 0x400) == 0)
      goto LABEL_6;
    goto LABEL_54;
  }
LABEL_53:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals entityAbsoluteCount1Hr](self, "entityAbsoluteCount1Hr"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("entityAbsoluteCount1Hr"));

  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x400) == 0)
  {
LABEL_6:
    if ((v5 & 8) == 0)
      goto LABEL_7;
    goto LABEL_55;
  }
LABEL_54:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals entityAbsoluteCount28Day](self, "entityAbsoluteCount28Day"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("entityAbsoluteCount28Day"));

  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 8) == 0)
  {
LABEL_7:
    if ((v5 & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_56;
  }
LABEL_55:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals entityAbsoluteCount2Min](self, "entityAbsoluteCount2Min"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("entityAbsoluteCount2Min"));

  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x40) == 0)
  {
LABEL_8:
    if ((v5 & 0x100) == 0)
      goto LABEL_9;
    goto LABEL_57;
  }
LABEL_56:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals entityAbsoluteCount6Hr](self, "entityAbsoluteCount6Hr"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("entityAbsoluteCount6Hr"));

  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x100) == 0)
  {
LABEL_9:
    if ((v5 & 0x20000000000) == 0)
      goto LABEL_10;
    goto LABEL_58;
  }
LABEL_57:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals entityAbsoluteCount7Day](self, "entityAbsoluteCount7Day"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("entityAbsoluteCount7Day"));

  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x20000000000) == 0)
  {
LABEL_10:
    if ((v5 & 0x100000000000) == 0)
      goto LABEL_11;
    goto LABEL_59;
  }
LABEL_58:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals entityPartialAppCount10Min](self, "entityPartialAppCount10Min"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("entityPartialAppCount10Min"));

  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x100000000000) == 0)
  {
LABEL_11:
    if ((v5 & 0x40000000000) == 0)
      goto LABEL_12;
    goto LABEL_60;
  }
LABEL_59:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals entityPartialAppCount1Day](self, "entityPartialAppCount1Day"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("entityPartialAppCount1Day"));

  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x40000000000) == 0)
  {
LABEL_12:
    if ((v5 & 0x400000000000) == 0)
      goto LABEL_13;
    goto LABEL_61;
  }
LABEL_60:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals entityPartialAppCount1Hr](self, "entityPartialAppCount1Hr"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("entityPartialAppCount1Hr"));

  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x400000000000) == 0)
  {
LABEL_13:
    if ((v5 & 0x10000000000) == 0)
      goto LABEL_14;
    goto LABEL_62;
  }
LABEL_61:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals entityPartialAppCount28Day](self, "entityPartialAppCount28Day"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("entityPartialAppCount28Day"));

  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x10000000000) == 0)
  {
LABEL_14:
    if ((v5 & 0x80000000000) == 0)
      goto LABEL_15;
    goto LABEL_63;
  }
LABEL_62:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals entityPartialAppCount2Min](self, "entityPartialAppCount2Min"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("entityPartialAppCount2Min"));

  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x80000000000) == 0)
  {
LABEL_15:
    if ((v5 & 0x200000000000) == 0)
      goto LABEL_16;
    goto LABEL_64;
  }
LABEL_63:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals entityPartialAppCount6Hr](self, "entityPartialAppCount6Hr"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("entityPartialAppCount6Hr"));

  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x200000000000) == 0)
  {
LABEL_16:
    if ((v5 & 0x400000000) == 0)
      goto LABEL_17;
    goto LABEL_65;
  }
LABEL_64:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals entityPartialAppCount7Day](self, "entityPartialAppCount7Day"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("entityPartialAppCount7Day"));

  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x400000000) == 0)
  {
LABEL_17:
    if ((v5 & 0x2000000000) == 0)
      goto LABEL_18;
    goto LABEL_66;
  }
LABEL_65:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals entityPartialSiriCount10Min](self, "entityPartialSiriCount10Min"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("entityPartialSiriCount10Min"));

  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x2000000000) == 0)
  {
LABEL_18:
    if ((v5 & 0x800000000) == 0)
      goto LABEL_19;
    goto LABEL_67;
  }
LABEL_66:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals entityPartialSiriCount1Day](self, "entityPartialSiriCount1Day"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("entityPartialSiriCount1Day"));

  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x800000000) == 0)
  {
LABEL_19:
    if ((v5 & 0x8000000000) == 0)
      goto LABEL_20;
    goto LABEL_68;
  }
LABEL_67:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals entityPartialSiriCount1Hr](self, "entityPartialSiriCount1Hr"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("entityPartialSiriCount1Hr"));

  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x8000000000) == 0)
  {
LABEL_20:
    if ((v5 & 0x200000000) == 0)
      goto LABEL_21;
    goto LABEL_69;
  }
LABEL_68:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals entityPartialSiriCount28Day](self, "entityPartialSiriCount28Day"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("entityPartialSiriCount28Day"));

  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x200000000) == 0)
  {
LABEL_21:
    if ((v5 & 0x1000000000) == 0)
      goto LABEL_22;
    goto LABEL_70;
  }
LABEL_69:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals entityPartialSiriCount2Min](self, "entityPartialSiriCount2Min"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("entityPartialSiriCount2Min"));

  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x1000000000) == 0)
  {
LABEL_22:
    if ((v5 & 0x4000000000) == 0)
      goto LABEL_23;
    goto LABEL_71;
  }
LABEL_70:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals entityPartialSiriCount6Hr](self, "entityPartialSiriCount6Hr"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("entityPartialSiriCount6Hr"));

  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x4000000000) == 0)
  {
LABEL_23:
    if ((v5 & 0x800) == 0)
      goto LABEL_24;
    goto LABEL_72;
  }
LABEL_71:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals entityPartialSiriCount7Day](self, "entityPartialSiriCount7Day"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("entityPartialSiriCount7Day"));

  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x800) == 0)
  {
LABEL_24:
    if ((v5 & 0x100000000) == 0)
      goto LABEL_25;
    goto LABEL_73;
  }
LABEL_72:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals entityRecency](self, "entityRecency"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("entityRecency"));

  v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x100000000) == 0)
  {
LABEL_25:
    if ((v5 & 0x4000) == 0)
      goto LABEL_26;
    goto LABEL_74;
  }
LABEL_73:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals isForegroundApp](self, "isForegroundApp"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("isForegroundApp"));

  LODWORD(v5) = self->_has;
  if ((v5 & 0x4000) == 0)
  {
LABEL_26:
    if ((v5 & 0x8000) == 0)
      goto LABEL_27;
    goto LABEL_75;
  }
LABEL_74:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals isLastForegroundApp](self, "isLastForegroundApp"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("isLastForegroundApp"));

  LODWORD(v5) = self->_has;
  if ((v5 & 0x8000) == 0)
  {
LABEL_27:
    if ((v5 & 0x1000000) == 0)
      goto LABEL_28;
    goto LABEL_76;
  }
LABEL_75:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals isLastNowPlayingApp](self, "isLastNowPlayingApp"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("isLastNowPlayingApp"));

  LODWORD(v5) = self->_has;
  if ((v5 & 0x1000000) == 0)
  {
LABEL_28:
    if ((v5 & 0x2000000) == 0)
      goto LABEL_29;
    goto LABEL_77;
  }
LABEL_76:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals isNowPlayingApp](self, "isNowPlayingApp"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("isNowPlayingApp"));

  LODWORD(v5) = self->_has;
  if ((v5 & 0x2000000) == 0)
  {
LABEL_29:
    if ((v5 & 0x1000) == 0)
      goto LABEL_30;
    goto LABEL_78;
  }
LABEL_77:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals isSelectedApp](self, "isSelectedApp"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("isSelectedApp"));

  LODWORD(v5) = self->_has;
  if ((v5 & 0x1000) == 0)
  {
LABEL_30:
    if ((v5 & 0x2000) == 0)
      goto LABEL_31;
    goto LABEL_79;
  }
LABEL_78:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals mediaUserContextNumberOfLibraryItems](self, "mediaUserContextNumberOfLibraryItems"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, CFSTR("mediaUserContextNumberOfLibraryItems"));

  LODWORD(v5) = self->_has;
  if ((v5 & 0x2000) == 0)
  {
LABEL_31:
    if ((v5 & 0x20000) == 0)
      goto LABEL_32;
    goto LABEL_80;
  }
LABEL_79:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals mediaUserContextSubscriptionStatus](self, "mediaUserContextSubscriptionStatus"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, CFSTR("mediaUserContextSubscriptionStatus"));

  LODWORD(v5) = self->_has;
  if ((v5 & 0x20000) == 0)
  {
LABEL_32:
    if ((v5 & 0x400000) == 0)
      goto LABEL_33;
    goto LABEL_81;
  }
LABEL_80:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals nowPlayingAbsoluteCount10Min](self, "nowPlayingAbsoluteCount10Min"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v40, CFSTR("nowPlayingAbsoluteCount10Min"));

  LODWORD(v5) = self->_has;
  if ((v5 & 0x400000) == 0)
  {
LABEL_33:
    if ((v5 & 0x100000) == 0)
      goto LABEL_34;
    goto LABEL_82;
  }
LABEL_81:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals nowPlayingAbsoluteCount14Day](self, "nowPlayingAbsoluteCount14Day"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("nowPlayingAbsoluteCount14Day"));

  LODWORD(v5) = self->_has;
  if ((v5 & 0x100000) == 0)
  {
LABEL_34:
    if ((v5 & 0x40000) == 0)
      goto LABEL_35;
    goto LABEL_83;
  }
LABEL_82:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals nowPlayingAbsoluteCount1Day](self, "nowPlayingAbsoluteCount1Day"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v42, CFSTR("nowPlayingAbsoluteCount1Day"));

  LODWORD(v5) = self->_has;
  if ((v5 & 0x40000) == 0)
  {
LABEL_35:
    if ((v5 & 0x800000) == 0)
      goto LABEL_36;
    goto LABEL_84;
  }
LABEL_83:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals nowPlayingAbsoluteCount1Hr](self, "nowPlayingAbsoluteCount1Hr"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v43, CFSTR("nowPlayingAbsoluteCount1Hr"));

  LODWORD(v5) = self->_has;
  if ((v5 & 0x800000) == 0)
  {
LABEL_36:
    if ((v5 & 0x10000) == 0)
      goto LABEL_37;
    goto LABEL_85;
  }
LABEL_84:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals nowPlayingAbsoluteCount28Day](self, "nowPlayingAbsoluteCount28Day"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v44, CFSTR("nowPlayingAbsoluteCount28Day"));

  LODWORD(v5) = self->_has;
  if ((v5 & 0x10000) == 0)
  {
LABEL_37:
    if ((v5 & 0x80000) == 0)
      goto LABEL_38;
    goto LABEL_86;
  }
LABEL_85:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals nowPlayingAbsoluteCount2Min](self, "nowPlayingAbsoluteCount2Min"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v45, CFSTR("nowPlayingAbsoluteCount2Min"));

  LODWORD(v5) = self->_has;
  if ((v5 & 0x80000) == 0)
  {
LABEL_38:
    if ((v5 & 0x200000) == 0)
      goto LABEL_39;
    goto LABEL_87;
  }
LABEL_86:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals nowPlayingAbsoluteCount6Hr](self, "nowPlayingAbsoluteCount6Hr"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v46, CFSTR("nowPlayingAbsoluteCount6Hr"));

  LODWORD(v5) = self->_has;
  if ((v5 & 0x200000) == 0)
  {
LABEL_39:
    if ((v5 & 4) == 0)
      goto LABEL_40;
    goto LABEL_88;
  }
LABEL_87:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals nowPlayingAbsoluteCount7Day](self, "nowPlayingAbsoluteCount7Day"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v47, CFSTR("nowPlayingAbsoluteCount7Day"));

  LODWORD(v5) = self->_has;
  if ((v5 & 4) == 0)
  {
LABEL_40:
    if ((v5 & 1) == 0)
      goto LABEL_41;
    goto LABEL_89;
  }
LABEL_88:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals relativeAppUsage14Day](self, "relativeAppUsage14Day"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v48, CFSTR("relativeAppUsage14Day"));

  LODWORD(v5) = self->_has;
  if ((v5 & 1) == 0)
  {
LABEL_41:
    if ((v5 & 2) == 0)
      goto LABEL_42;
    goto LABEL_90;
  }
LABEL_89:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals relativeAppUsage1Day](self, "relativeAppUsage1Day"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v49, CFSTR("relativeAppUsage1Day"));

  LODWORD(v5) = self->_has;
  if ((v5 & 2) == 0)
  {
LABEL_42:
    if ((v5 & 0x40000000) == 0)
      goto LABEL_43;
    goto LABEL_91;
  }
LABEL_90:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals relativeAppUsage7Day](self, "relativeAppUsage7Day"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v50, CFSTR("relativeAppUsage7Day"));

  LODWORD(v5) = self->_has;
  if ((v5 & 0x40000000) == 0)
  {
LABEL_43:
    if ((v5 & 0x80000000) == 0)
      goto LABEL_44;
    goto LABEL_92;
  }
LABEL_91:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals spotlightRelativeCount](self, "spotlightRelativeCount"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v51, CFSTR("spotlightRelativeCount"));

  LODWORD(v5) = self->_has;
  if ((v5 & 0x80000000) == 0)
  {
LABEL_44:
    if ((v5 & 0x8000000) == 0)
      goto LABEL_45;
    goto LABEL_93;
  }
LABEL_92:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals supportedMediaCategories](self, "supportedMediaCategories"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v52, CFSTR("supportedMediaCategories"));

  LODWORD(v5) = self->_has;
  if ((v5 & 0x8000000) == 0)
  {
LABEL_45:
    if ((v5 & 0x4000000) == 0)
      goto LABEL_46;
    goto LABEL_94;
  }
LABEL_93:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals timeSinceLastForegroundAppEndInSec](self, "timeSinceLastForegroundAppEndInSec"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v53, CFSTR("timeSinceLastForegroundAppEndInSec"));

  LODWORD(v5) = self->_has;
  if ((v5 & 0x4000000) == 0)
  {
LABEL_46:
    if ((v5 & 0x20000000) == 0)
      goto LABEL_47;
LABEL_95:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals timeSinceLastNowPlayingAppEndInSec](self, "timeSinceLastNowPlayingAppEndInSec"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v55, CFSTR("timeSinceLastNowPlayingAppEndInSec"));

    if ((*(_DWORD *)&self->_has & 0x10000000) == 0)
      goto LABEL_49;
    goto LABEL_48;
  }
LABEL_94:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals timeSinceLastForegroundAppStartInSec](self, "timeSinceLastForegroundAppStartInSec"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v54, CFSTR("timeSinceLastForegroundAppStartInSec"));

  LODWORD(v5) = self->_has;
  if ((v5 & 0x20000000) != 0)
    goto LABEL_95;
LABEL_47:
  if ((v5 & 0x10000000) != 0)
  {
LABEL_48:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals timeSinceLastNowPlayingAppStartInSec](self, "timeSinceLastNowPlayingAppStartInSec"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("timeSinceLastNowPlayingAppStartInSec"));

  }
LABEL_49:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  v7 = v3;

  return v7;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals)initWithJSON:(id)a3
{
  void *v4;
  INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals *v5;
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
    self = -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals)initWithDictionary:(id)a3
{
  id v4;
  INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals *v5;
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
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
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
  INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals *v60;
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
  void *v100;
  void *v101;
  objc_super v102;

  v4 = a3;
  v102.receiver = self;
  v102.super_class = (Class)INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals;
  v5 = -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals init](&v102, sel_init);

  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("relativeAppUsage1Day"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setRelativeAppUsage1Day:](v5, "setRelativeAppUsage1Day:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("relativeAppUsage7Day"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setRelativeAppUsage7Day:](v5, "setRelativeAppUsage7Day:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("relativeAppUsage14Day"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setRelativeAppUsage14Day:](v5, "setRelativeAppUsage14Day:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entityAbsoluteCount2Min"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setEntityAbsoluteCount2Min:](v5, "setEntityAbsoluteCount2Min:", objc_msgSend(v9, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entityAbsoluteCount10Min"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setEntityAbsoluteCount10Min:](v5, "setEntityAbsoluteCount10Min:", objc_msgSend(v10, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entityAbsoluteCount1Hr"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setEntityAbsoluteCount1Hr:](v5, "setEntityAbsoluteCount1Hr:", objc_msgSend(v11, "intValue"));
    v82 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entityAbsoluteCount6Hr"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setEntityAbsoluteCount6Hr:](v5, "setEntityAbsoluteCount6Hr:", objc_msgSend(v12, "intValue"));
    v76 = v12;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entityAbsoluteCount1Day"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v101 = v13;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setEntityAbsoluteCount1Day:](v5, "setEntityAbsoluteCount1Day:", objc_msgSend(v13, "intValue"));
    v81 = v7;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entityAbsoluteCount7Day"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setEntityAbsoluteCount7Day:](v5, "setEntityAbsoluteCount7Day:", objc_msgSend(v14, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entityAbsoluteCount14Day"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v100 = v15;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setEntityAbsoluteCount14Day:](v5, "setEntityAbsoluteCount14Day:", objc_msgSend(v15, "intValue"));
    v80 = v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entityAbsoluteCount28Day"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setEntityAbsoluteCount28Day:](v5, "setEntityAbsoluteCount28Day:", objc_msgSend(v16, "intValue"));
    v17 = v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entityRecency"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v99 = v18;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setEntityRecency:](v5, "setEntityRecency:", objc_msgSend(v18, "intValue"));
    v19 = v9;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mediaUserContextNumberOfLibraryItems"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setMediaUserContextNumberOfLibraryItems:](v5, "setMediaUserContextNumberOfLibraryItems:", objc_msgSend(v20, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mediaUserContextSubscriptionStatus"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v98 = v21;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setMediaUserContextSubscriptionStatus:](v5, "setMediaUserContextSubscriptionStatus:", objc_msgSend(v21, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isLastForegroundApp"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setIsLastForegroundApp:](v5, "setIsLastForegroundApp:", objc_msgSend(v22, "BOOLValue"));
    v72 = v22;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isLastNowPlayingApp"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v97 = v23;
    v79 = v19;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setIsLastNowPlayingApp:](v5, "setIsLastNowPlayingApp:", objc_msgSend(v23, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nowPlayingAbsoluteCount2Min"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v96 = v24;
    v78 = v17;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setNowPlayingAbsoluteCount2Min:](v5, "setNowPlayingAbsoluteCount2Min:", objc_msgSend(v24, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nowPlayingAbsoluteCount10Min"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v95 = v25;
    v77 = v11;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setNowPlayingAbsoluteCount10Min:](v5, "setNowPlayingAbsoluteCount10Min:", objc_msgSend(v25, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nowPlayingAbsoluteCount1Hr"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setNowPlayingAbsoluteCount1Hr:](v5, "setNowPlayingAbsoluteCount1Hr:", objc_msgSend(v26, "intValue"));
    v71 = v26;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nowPlayingAbsoluteCount6Hr"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v94 = v27;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setNowPlayingAbsoluteCount6Hr:](v5, "setNowPlayingAbsoluteCount6Hr:", objc_msgSend(v27, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nowPlayingAbsoluteCount1Day"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setNowPlayingAbsoluteCount1Day:](v5, "setNowPlayingAbsoluteCount1Day:", objc_msgSend(v28, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nowPlayingAbsoluteCount7Day"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v93 = v29;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setNowPlayingAbsoluteCount7Day:](v5, "setNowPlayingAbsoluteCount7Day:", objc_msgSend(v29, "intValue"));
    v30 = v20;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nowPlayingAbsoluteCount14Day"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setNowPlayingAbsoluteCount14Day:](v5, "setNowPlayingAbsoluteCount14Day:", objc_msgSend(v31, "intValue"));
    v69 = v31;
    v32 = v16;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nowPlayingAbsoluteCount28Day"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v92 = v33;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setNowPlayingAbsoluteCount28Day:](v5, "setNowPlayingAbsoluteCount28Day:", objc_msgSend(v33, "intValue"));
    v34 = v14;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isNowPlayingApp"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setIsNowPlayingApp:](v5, "setIsNowPlayingApp:", objc_msgSend(v35, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isSelectedApp"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v91 = v36;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setIsSelectedApp:](v5, "setIsSelectedApp:", objc_msgSend(v36, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeSinceLastForegroundAppStartInSec"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v90 = v37;
    v75 = v34;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setTimeSinceLastForegroundAppStartInSec:](v5, "setTimeSinceLastForegroundAppStartInSec:", objc_msgSend(v37, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeSinceLastForegroundAppEndInSec"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v89 = v38;
    v74 = v32;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setTimeSinceLastForegroundAppEndInSec:](v5, "setTimeSinceLastForegroundAppEndInSec:", objc_msgSend(v38, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeSinceLastNowPlayingAppStartInSec"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v88 = v39;
    v73 = v30;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setTimeSinceLastNowPlayingAppStartInSec:](v5, "setTimeSinceLastNowPlayingAppStartInSec:", objc_msgSend(v39, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeSinceLastNowPlayingAppEndInSec"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setTimeSinceLastNowPlayingAppEndInSec:](v5, "setTimeSinceLastNowPlayingAppEndInSec:", objc_msgSend(v40, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("spotlightRelativeCount"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v87 = v41;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setSpotlightRelativeCount:](v5, "setSpotlightRelativeCount:", objc_msgSend(v41, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("supportedMediaCategories"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setSupportedMediaCategories:](v5, "setSupportedMediaCategories:", objc_msgSend(v42, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isForegroundApp"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v86 = v43;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setIsForegroundApp:](v5, "setIsForegroundApp:", objc_msgSend(v43, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entityPartialSiriCount2Min"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setEntityPartialSiriCount2Min:](v5, "setEntityPartialSiriCount2Min:", objc_msgSend(v44, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entityPartialSiriCount10Min"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v85 = v45;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setEntityPartialSiriCount10Min:](v5, "setEntityPartialSiriCount10Min:", objc_msgSend(v45, "intValue"));
    v46 = v28;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entityPartialSiriCount1Hr"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setEntityPartialSiriCount1Hr:](v5, "setEntityPartialSiriCount1Hr:", objc_msgSend(v47, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entityPartialSiriCount6Hr"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v84 = v48;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setEntityPartialSiriCount6Hr:](v5, "setEntityPartialSiriCount6Hr:", objc_msgSend(v48, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entityPartialSiriCount1Day"));
    v49 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v83 = (void *)v49;
    v50 = v46;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setEntityPartialSiriCount1Day:](v5, "setEntityPartialSiriCount1Day:", objc_msgSend(v83, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entityPartialSiriCount7Day"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setEntityPartialSiriCount7Day:](v5, "setEntityPartialSiriCount7Day:", objc_msgSend(v51, "intValue"));
    v66 = v42;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entityPartialSiriCount28Day"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setEntityPartialSiriCount28Day:](v5, "setEntityPartialSiriCount28Day:", objc_msgSend(v52, "intValue"));
    v62 = v52;
    v65 = v44;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entityPartialAppCount2Min"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setEntityPartialAppCount2Min:](v5, "setEntityPartialAppCount2Min:", objc_msgSend(v53, "intValue"));
    v64 = v47;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entityPartialAppCount10Min"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setEntityPartialAppCount10Min:](v5, "setEntityPartialAppCount10Min:", objc_msgSend(v54, "intValue"));
    v70 = v50;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entityPartialAppCount1Hr"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setEntityPartialAppCount1Hr:](v5, "setEntityPartialAppCount1Hr:", objc_msgSend(v55, "intValue"));
    v63 = v51;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entityPartialAppCount6Hr"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setEntityPartialAppCount6Hr:](v5, "setEntityPartialAppCount6Hr:", objc_msgSend(v56, "intValue"));
    v68 = v35;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entityPartialAppCount1Day"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setEntityPartialAppCount1Day:](v5, "setEntityPartialAppCount1Day:", objc_msgSend(v57, "intValue"));
    v67 = v40;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entityPartialAppCount7Day"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setEntityPartialAppCount7Day:](v5, "setEntityPartialAppCount7Day:", objc_msgSend(v58, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entityPartialAppCount28Day"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setEntityPartialAppCount28Day:](v5, "setEntityPartialAppCount28Day:", objc_msgSend(v59, "intValue"));
    v60 = v5;

  }
  return v5;
}

- (int)relativeAppUsage1Day
{
  return self->_relativeAppUsage1Day;
}

- (int)relativeAppUsage7Day
{
  return self->_relativeAppUsage7Day;
}

- (int)relativeAppUsage14Day
{
  return self->_relativeAppUsage14Day;
}

- (int)entityAbsoluteCount2Min
{
  return self->_entityAbsoluteCount2Min;
}

- (int)entityAbsoluteCount10Min
{
  return self->_entityAbsoluteCount10Min;
}

- (int)entityAbsoluteCount1Hr
{
  return self->_entityAbsoluteCount1Hr;
}

- (int)entityAbsoluteCount6Hr
{
  return self->_entityAbsoluteCount6Hr;
}

- (int)entityAbsoluteCount1Day
{
  return self->_entityAbsoluteCount1Day;
}

- (int)entityAbsoluteCount7Day
{
  return self->_entityAbsoluteCount7Day;
}

- (int)entityAbsoluteCount14Day
{
  return self->_entityAbsoluteCount14Day;
}

- (int)entityAbsoluteCount28Day
{
  return self->_entityAbsoluteCount28Day;
}

- (int)entityRecency
{
  return self->_entityRecency;
}

- (int)mediaUserContextNumberOfLibraryItems
{
  return self->_mediaUserContextNumberOfLibraryItems;
}

- (int)mediaUserContextSubscriptionStatus
{
  return self->_mediaUserContextSubscriptionStatus;
}

- (BOOL)isLastForegroundApp
{
  return self->_isLastForegroundApp;
}

- (BOOL)isLastNowPlayingApp
{
  return self->_isLastNowPlayingApp;
}

- (int)nowPlayingAbsoluteCount2Min
{
  return self->_nowPlayingAbsoluteCount2Min;
}

- (int)nowPlayingAbsoluteCount10Min
{
  return self->_nowPlayingAbsoluteCount10Min;
}

- (int)nowPlayingAbsoluteCount1Hr
{
  return self->_nowPlayingAbsoluteCount1Hr;
}

- (int)nowPlayingAbsoluteCount6Hr
{
  return self->_nowPlayingAbsoluteCount6Hr;
}

- (int)nowPlayingAbsoluteCount1Day
{
  return self->_nowPlayingAbsoluteCount1Day;
}

- (int)nowPlayingAbsoluteCount7Day
{
  return self->_nowPlayingAbsoluteCount7Day;
}

- (int)nowPlayingAbsoluteCount14Day
{
  return self->_nowPlayingAbsoluteCount14Day;
}

- (int)nowPlayingAbsoluteCount28Day
{
  return self->_nowPlayingAbsoluteCount28Day;
}

- (BOOL)isNowPlayingApp
{
  return self->_isNowPlayingApp;
}

- (BOOL)isSelectedApp
{
  return self->_isSelectedApp;
}

- (int)timeSinceLastForegroundAppStartInSec
{
  return self->_timeSinceLastForegroundAppStartInSec;
}

- (int)timeSinceLastForegroundAppEndInSec
{
  return self->_timeSinceLastForegroundAppEndInSec;
}

- (int)timeSinceLastNowPlayingAppStartInSec
{
  return self->_timeSinceLastNowPlayingAppStartInSec;
}

- (int)timeSinceLastNowPlayingAppEndInSec
{
  return self->_timeSinceLastNowPlayingAppEndInSec;
}

- (int)spotlightRelativeCount
{
  return self->_spotlightRelativeCount;
}

- (unint64_t)supportedMediaCategories
{
  return self->_supportedMediaCategories;
}

- (BOOL)isForegroundApp
{
  return self->_isForegroundApp;
}

- (int)entityPartialSiriCount2Min
{
  return self->_entityPartialSiriCount2Min;
}

- (int)entityPartialSiriCount10Min
{
  return self->_entityPartialSiriCount10Min;
}

- (int)entityPartialSiriCount1Hr
{
  return self->_entityPartialSiriCount1Hr;
}

- (int)entityPartialSiriCount6Hr
{
  return self->_entityPartialSiriCount6Hr;
}

- (int)entityPartialSiriCount1Day
{
  return self->_entityPartialSiriCount1Day;
}

- (int)entityPartialSiriCount7Day
{
  return self->_entityPartialSiriCount7Day;
}

- (int)entityPartialSiriCount28Day
{
  return self->_entityPartialSiriCount28Day;
}

- (int)entityPartialAppCount2Min
{
  return self->_entityPartialAppCount2Min;
}

- (int)entityPartialAppCount10Min
{
  return self->_entityPartialAppCount10Min;
}

- (int)entityPartialAppCount1Hr
{
  return self->_entityPartialAppCount1Hr;
}

- (int)entityPartialAppCount6Hr
{
  return self->_entityPartialAppCount6Hr;
}

- (int)entityPartialAppCount1Day
{
  return self->_entityPartialAppCount1Day;
}

- (int)entityPartialAppCount7Day
{
  return self->_entityPartialAppCount7Day;
}

- (int)entityPartialAppCount28Day
{
  return self->_entityPartialAppCount28Day;
}

@end
