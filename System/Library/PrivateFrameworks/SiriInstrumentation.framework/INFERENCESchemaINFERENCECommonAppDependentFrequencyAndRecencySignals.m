@implementation INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setAppUsageCount2Min:(int)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_appUsageCount2Min = a3;
}

- (BOOL)hasAppUsageCount2Min
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setHasAppUsageCount2Min:(BOOL)a3
{
  self->_has = ($6C0861D200E4D330AE256ED4C8F76FC1)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (void)deleteAppUsageCount2Min
{
  -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setAppUsageCount2Min:](self, "setAppUsageCount2Min:", 0);
  *(_DWORD *)&self->_has &= ~1u;
}

- (void)setAppUsageCount10Min:(int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_appUsageCount10Min = a3;
}

- (BOOL)hasAppUsageCount10Min
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasAppUsageCount10Min:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($6C0861D200E4D330AE256ED4C8F76FC1)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (void)deleteAppUsageCount10Min
{
  -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setAppUsageCount10Min:](self, "setAppUsageCount10Min:", 0);
  *(_DWORD *)&self->_has &= ~2u;
}

- (void)setAppUsageCount1Hr:(int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_appUsageCount1Hr = a3;
}

- (BOOL)hasAppUsageCount1Hr
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasAppUsageCount1Hr:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($6C0861D200E4D330AE256ED4C8F76FC1)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (void)deleteAppUsageCount1Hr
{
  -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setAppUsageCount1Hr:](self, "setAppUsageCount1Hr:", 0);
  *(_DWORD *)&self->_has &= ~4u;
}

- (void)setAppUsageCount6Hrs:(int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_appUsageCount6Hrs = a3;
}

- (BOOL)hasAppUsageCount6Hrs
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasAppUsageCount6Hrs:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($6C0861D200E4D330AE256ED4C8F76FC1)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (void)deleteAppUsageCount6Hrs
{
  -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setAppUsageCount6Hrs:](self, "setAppUsageCount6Hrs:", 0);
  *(_DWORD *)&self->_has &= ~8u;
}

- (void)setAppUsageCount1Day:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_appUsageCount1Day = a3;
}

- (BOOL)hasAppUsageCount1Day
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasAppUsageCount1Day:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($6C0861D200E4D330AE256ED4C8F76FC1)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (void)deleteAppUsageCount1Day
{
  -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setAppUsageCount1Day:](self, "setAppUsageCount1Day:", 0);
  *(_DWORD *)&self->_has &= ~0x10u;
}

- (void)setAppUsageCount7Days:(int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_appUsageCount7Days = a3;
}

- (BOOL)hasAppUsageCount7Days
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setHasAppUsageCount7Days:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($6C0861D200E4D330AE256ED4C8F76FC1)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (void)deleteAppUsageCount7Days
{
  -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setAppUsageCount7Days:](self, "setAppUsageCount7Days:", 0);
  *(_DWORD *)&self->_has &= ~0x20u;
}

- (void)setAppUsageCount14Days:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_appUsageCount14Days = a3;
}

- (BOOL)hasAppUsageCount14Days
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setHasAppUsageCount14Days:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($6C0861D200E4D330AE256ED4C8F76FC1)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (void)deleteAppUsageCount14Days
{
  -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setAppUsageCount14Days:](self, "setAppUsageCount14Days:", 0);
  *(_DWORD *)&self->_has &= ~0x40u;
}

- (void)setAppUsageCount28Days:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_appUsageCount28Days = a3;
}

- (BOOL)hasAppUsageCount28Days
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setHasAppUsageCount28Days:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($6C0861D200E4D330AE256ED4C8F76FC1)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (void)deleteAppUsageCount28Days
{
  -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setAppUsageCount28Days:](self, "setAppUsageCount28Days:", 0);
  *(_DWORD *)&self->_has &= ~0x80u;
}

- (void)setAppUsageCountInf:(int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_appUsageCountInf = a3;
}

- (BOOL)hasAppUsageCountInf
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setHasAppUsageCountInf:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($6C0861D200E4D330AE256ED4C8F76FC1)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (void)deleteAppUsageCountInf
{
  -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setAppUsageCountInf:](self, "setAppUsageCountInf:", 0);
  *(_DWORD *)&self->_has &= ~0x100u;
}

- (void)setRecencyOrderOfAppUsed:(int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_recencyOrderOfAppUsed = a3;
}

- (BOOL)hasRecencyOrderOfAppUsed
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setHasRecencyOrderOfAppUsed:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($6C0861D200E4D330AE256ED4C8F76FC1)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (void)deleteRecencyOrderOfAppUsed
{
  -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setRecencyOrderOfAppUsed:](self, "setRecencyOrderOfAppUsed:", 0);
  *(_DWORD *)&self->_has &= ~0x200u;
}

- (void)setTimeSinceAppUsedInSec:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_timeSinceAppUsedInSec = a3;
}

- (BOOL)hasTimeSinceAppUsedInSec
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setHasTimeSinceAppUsedInSec:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($6C0861D200E4D330AE256ED4C8F76FC1)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (void)deleteTimeSinceAppUsedInSec
{
  -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setTimeSinceAppUsedInSec:](self, "setTimeSinceAppUsedInSec:", 0);
  *(_DWORD *)&self->_has &= ~0x400u;
}

- (void)setAppUsageCountFromSiri2Min:(int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_appUsageCountFromSiri2Min = a3;
}

- (BOOL)hasAppUsageCountFromSiri2Min
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setHasAppUsageCountFromSiri2Min:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($6C0861D200E4D330AE256ED4C8F76FC1)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (void)deleteAppUsageCountFromSiri2Min
{
  -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setAppUsageCountFromSiri2Min:](self, "setAppUsageCountFromSiri2Min:", 0);
  *(_DWORD *)&self->_has &= ~0x800u;
}

- (void)setAppUsageCountFromSiri10Min:(int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_appUsageCountFromSiri10Min = a3;
}

- (BOOL)hasAppUsageCountFromSiri10Min
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setHasAppUsageCountFromSiri10Min:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($6C0861D200E4D330AE256ED4C8F76FC1)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (void)deleteAppUsageCountFromSiri10Min
{
  -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setAppUsageCountFromSiri10Min:](self, "setAppUsageCountFromSiri10Min:", 0);
  *(_DWORD *)&self->_has &= ~0x1000u;
}

- (void)setAppUsageCountFromSiri1Hr:(int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_appUsageCountFromSiri1Hr = a3;
}

- (BOOL)hasAppUsageCountFromSiri1Hr
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setHasAppUsageCountFromSiri1Hr:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($6C0861D200E4D330AE256ED4C8F76FC1)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (void)deleteAppUsageCountFromSiri1Hr
{
  -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setAppUsageCountFromSiri1Hr:](self, "setAppUsageCountFromSiri1Hr:", 0);
  *(_DWORD *)&self->_has &= ~0x2000u;
}

- (void)setAppUsageCountFromSiri6Hrs:(int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_appUsageCountFromSiri6Hrs = a3;
}

- (BOOL)hasAppUsageCountFromSiri6Hrs
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setHasAppUsageCountFromSiri6Hrs:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($6C0861D200E4D330AE256ED4C8F76FC1)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (void)deleteAppUsageCountFromSiri6Hrs
{
  -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setAppUsageCountFromSiri6Hrs:](self, "setAppUsageCountFromSiri6Hrs:", 0);
  *(_DWORD *)&self->_has &= ~0x4000u;
}

- (void)setAppUsageCountFromSiri1Day:(int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_appUsageCountFromSiri1Day = a3;
}

- (BOOL)hasAppUsageCountFromSiri1Day
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setHasAppUsageCountFromSiri1Day:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($6C0861D200E4D330AE256ED4C8F76FC1)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (void)deleteAppUsageCountFromSiri1Day
{
  -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setAppUsageCountFromSiri1Day:](self, "setAppUsageCountFromSiri1Day:", 0);
  *(_DWORD *)&self->_has &= ~0x8000u;
}

- (void)setAppUsageCountFromSiri7Days:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_appUsageCountFromSiri7Days = a3;
}

- (BOOL)hasAppUsageCountFromSiri7Days
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setHasAppUsageCountFromSiri7Days:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($6C0861D200E4D330AE256ED4C8F76FC1)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (void)deleteAppUsageCountFromSiri7Days
{
  -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setAppUsageCountFromSiri7Days:](self, "setAppUsageCountFromSiri7Days:", 0);
  *(_DWORD *)&self->_has &= ~0x10000u;
}

- (void)setAppUsageCountFromSiri14Days:(int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_appUsageCountFromSiri14Days = a3;
}

- (BOOL)hasAppUsageCountFromSiri14Days
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setHasAppUsageCountFromSiri14Days:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($6C0861D200E4D330AE256ED4C8F76FC1)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (void)deleteAppUsageCountFromSiri14Days
{
  -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setAppUsageCountFromSiri14Days:](self, "setAppUsageCountFromSiri14Days:", 0);
  *(_DWORD *)&self->_has &= ~0x20000u;
}

- (void)setAppUsageCountFromSiri28Days:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_appUsageCountFromSiri28Days = a3;
}

- (BOOL)hasAppUsageCountFromSiri28Days
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setHasAppUsageCountFromSiri28Days:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($6C0861D200E4D330AE256ED4C8F76FC1)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (void)deleteAppUsageCountFromSiri28Days
{
  -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setAppUsageCountFromSiri28Days:](self, "setAppUsageCountFromSiri28Days:", 0);
  *(_DWORD *)&self->_has &= ~0x40000u;
}

- (void)setAppUsageCountFromSiriInf:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_appUsageCountFromSiriInf = a3;
}

- (BOOL)hasAppUsageCountFromSiriInf
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setHasAppUsageCountFromSiriInf:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_has = ($6C0861D200E4D330AE256ED4C8F76FC1)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (void)deleteAppUsageCountFromSiriInf
{
  -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setAppUsageCountFromSiriInf:](self, "setAppUsageCountFromSiriInf:", 0);
  *(_DWORD *)&self->_has &= ~0x80000u;
}

- (void)setRecencyOrderOfAppUsageFromSiri:(int)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_recencyOrderOfAppUsageFromSiri = a3;
}

- (BOOL)hasRecencyOrderOfAppUsageFromSiri
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setHasRecencyOrderOfAppUsageFromSiri:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  self->_has = ($6C0861D200E4D330AE256ED4C8F76FC1)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (void)deleteRecencyOrderOfAppUsageFromSiri
{
  -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setRecencyOrderOfAppUsageFromSiri:](self, "setRecencyOrderOfAppUsageFromSiri:", 0);
  *(_DWORD *)&self->_has &= ~0x100000u;
}

- (void)setTimeSinceAppUsedFromSiriInSec:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_timeSinceAppUsedFromSiriInSec = a3;
}

- (BOOL)hasTimeSinceAppUsedFromSiriInSec
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setHasTimeSinceAppUsedFromSiriInSec:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x200000;
  else
    v3 = 0;
  self->_has = ($6C0861D200E4D330AE256ED4C8F76FC1)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (void)deleteTimeSinceAppUsedFromSiriInSec
{
  -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setTimeSinceAppUsedFromSiriInSec:](self, "setTimeSinceAppUsedFromSiriInSec:", 0);
  *(_DWORD *)&self->_has &= ~0x200000u;
}

- (void)setTaskAbandonCountInUsingApp2Min:(int)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_taskAbandonCountInUsingApp2Min = a3;
}

- (BOOL)hasTaskAbandonCountInUsingApp2Min
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setHasTaskAbandonCountInUsingApp2Min:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x400000;
  else
    v3 = 0;
  self->_has = ($6C0861D200E4D330AE256ED4C8F76FC1)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (void)deleteTaskAbandonCountInUsingApp2Min
{
  -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setTaskAbandonCountInUsingApp2Min:](self, "setTaskAbandonCountInUsingApp2Min:", 0);
  *(_DWORD *)&self->_has &= ~0x400000u;
}

- (void)setTaskAbandonCountInUsingApp10Min:(int)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_taskAbandonCountInUsingApp10Min = a3;
}

- (BOOL)hasTaskAbandonCountInUsingApp10Min
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setHasTaskAbandonCountInUsingApp10Min:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x800000;
  else
    v3 = 0;
  self->_has = ($6C0861D200E4D330AE256ED4C8F76FC1)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (void)deleteTaskAbandonCountInUsingApp10Min
{
  -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setTaskAbandonCountInUsingApp10Min:](self, "setTaskAbandonCountInUsingApp10Min:", 0);
  *(_DWORD *)&self->_has &= ~0x800000u;
}

- (void)setTaskAbandonCountInUsingApp1Hr:(int)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_taskAbandonCountInUsingApp1Hr = a3;
}

- (BOOL)hasTaskAbandonCountInUsingApp1Hr
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (void)setHasTaskAbandonCountInUsingApp1Hr:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x1000000;
  else
    v3 = 0;
  self->_has = ($6C0861D200E4D330AE256ED4C8F76FC1)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (void)deleteTaskAbandonCountInUsingApp1Hr
{
  -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setTaskAbandonCountInUsingApp1Hr:](self, "setTaskAbandonCountInUsingApp1Hr:", 0);
  *(_DWORD *)&self->_has &= ~0x1000000u;
}

- (void)setTaskAbandonCountInUsingApp6Hrs:(int)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_taskAbandonCountInUsingApp6Hrs = a3;
}

- (BOOL)hasTaskAbandonCountInUsingApp6Hrs
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setHasTaskAbandonCountInUsingApp6Hrs:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000000;
  else
    v3 = 0;
  self->_has = ($6C0861D200E4D330AE256ED4C8F76FC1)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (void)deleteTaskAbandonCountInUsingApp6Hrs
{
  -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setTaskAbandonCountInUsingApp6Hrs:](self, "setTaskAbandonCountInUsingApp6Hrs:", 0);
  *(_DWORD *)&self->_has &= ~0x2000000u;
}

- (void)setTaskAbandonCountInUsingApp1Day:(int)a3
{
  *(_DWORD *)&self->_has |= 0x4000000u;
  self->_taskAbandonCountInUsingApp1Day = a3;
}

- (BOOL)hasTaskAbandonCountInUsingApp1Day
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setHasTaskAbandonCountInUsingApp1Day:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000000;
  else
    v3 = 0;
  self->_has = ($6C0861D200E4D330AE256ED4C8F76FC1)(*(_DWORD *)&self->_has & 0xFBFFFFFF | v3);
}

- (void)deleteTaskAbandonCountInUsingApp1Day
{
  -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setTaskAbandonCountInUsingApp1Day:](self, "setTaskAbandonCountInUsingApp1Day:", 0);
  *(_DWORD *)&self->_has &= ~0x4000000u;
}

- (void)setTaskAbandonCountInUsingApp7Days:(int)a3
{
  *(_DWORD *)&self->_has |= 0x8000000u;
  self->_taskAbandonCountInUsingApp7Days = a3;
}

- (BOOL)hasTaskAbandonCountInUsingApp7Days
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setHasTaskAbandonCountInUsingApp7Days:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000000;
  else
    v3 = 0;
  self->_has = ($6C0861D200E4D330AE256ED4C8F76FC1)(*(_DWORD *)&self->_has & 0xF7FFFFFF | v3);
}

- (void)deleteTaskAbandonCountInUsingApp7Days
{
  -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setTaskAbandonCountInUsingApp7Days:](self, "setTaskAbandonCountInUsingApp7Days:", 0);
  *(_DWORD *)&self->_has &= ~0x8000000u;
}

- (void)setTaskAbandonCountInUsingApp14Days:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10000000u;
  self->_taskAbandonCountInUsingApp14Days = a3;
}

- (BOOL)hasTaskAbandonCountInUsingApp14Days
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setHasTaskAbandonCountInUsingApp14Days:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000000;
  else
    v3 = 0;
  self->_has = ($6C0861D200E4D330AE256ED4C8F76FC1)(*(_DWORD *)&self->_has & 0xEFFFFFFF | v3);
}

- (void)deleteTaskAbandonCountInUsingApp14Days
{
  -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setTaskAbandonCountInUsingApp14Days:](self, "setTaskAbandonCountInUsingApp14Days:", 0);
  *(_DWORD *)&self->_has &= ~0x10000000u;
}

- (void)setTaskAbandonCountInUsingApp28Days:(int)a3
{
  *(_DWORD *)&self->_has |= 0x20000000u;
  self->_taskAbandonCountInUsingApp28Days = a3;
}

- (BOOL)hasTaskAbandonCountInUsingApp28Days
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setHasTaskAbandonCountInUsingApp28Days:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000000;
  else
    v3 = 0;
  self->_has = ($6C0861D200E4D330AE256ED4C8F76FC1)(*(_DWORD *)&self->_has & 0xDFFFFFFF | v3);
}

- (void)deleteTaskAbandonCountInUsingApp28Days
{
  -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setTaskAbandonCountInUsingApp28Days:](self, "setTaskAbandonCountInUsingApp28Days:", 0);
  *(_DWORD *)&self->_has &= ~0x20000000u;
}

- (void)setTaskAbandonCountInUsingAppInf:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40000000u;
  self->_taskAbandonCountInUsingAppInf = a3;
}

- (BOOL)hasTaskAbandonCountInUsingAppInf
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (void)setHasTaskAbandonCountInUsingAppInf:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000000;
  else
    v3 = 0;
  self->_has = ($6C0861D200E4D330AE256ED4C8F76FC1)(*(_DWORD *)&self->_has & 0xBFFFFFFF | v3);
}

- (void)deleteTaskAbandonCountInUsingAppInf
{
  -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setTaskAbandonCountInUsingAppInf:](self, "setTaskAbandonCountInUsingAppInf:", 0);
  *(_DWORD *)&self->_has &= ~0x40000000u;
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignalsReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $6C0861D200E4D330AE256ED4C8F76FC1 has;
  id v5;

  v5 = a3;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = self->_has;
    if ((*(_BYTE *)&has & 2) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 4) == 0)
        goto LABEL_4;
      goto LABEL_36;
    }
  }
  else if ((*(_BYTE *)&has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_5;
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_12;
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_13;
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_14;
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_15;
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_16;
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_17;
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_18;
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_19;
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_20;
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_21;
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_22;
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_23;
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_24;
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_25;
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_26;
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_27;
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_28;
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_29;
    goto LABEL_61;
  }
LABEL_60:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_30;
    goto LABEL_62;
  }
LABEL_61:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_31;
LABEL_63:
    PBDataWriterWriteInt32Field();
    if ((*(_DWORD *)&self->_has & 0x40000000) == 0)
      goto LABEL_33;
    goto LABEL_32;
  }
LABEL_62:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) != 0)
    goto LABEL_63;
LABEL_31:
  if ((*(_DWORD *)&has & 0x40000000) != 0)
LABEL_32:
    PBDataWriterWriteInt32Field();
LABEL_33:

}

- (BOOL)isEqual:(id)a3
{
  _DWORD *v4;
  $6C0861D200E4D330AE256ED4C8F76FC1 has;
  unsigned int v6;
  int appUsageCount2Min;
  int v8;
  int appUsageCount10Min;
  int v10;
  int appUsageCount1Hr;
  int v12;
  int appUsageCount6Hrs;
  int v14;
  int appUsageCount1Day;
  int v16;
  int appUsageCount7Days;
  int v18;
  int appUsageCount14Days;
  int v20;
  int appUsageCount28Days;
  int v22;
  int appUsageCountInf;
  int v24;
  int recencyOrderOfAppUsed;
  int v26;
  int64_t timeSinceAppUsedInSec;
  int v28;
  int appUsageCountFromSiri2Min;
  int v30;
  int appUsageCountFromSiri10Min;
  int v32;
  int appUsageCountFromSiri1Hr;
  int v34;
  int appUsageCountFromSiri6Hrs;
  int v36;
  int appUsageCountFromSiri1Day;
  int v38;
  int appUsageCountFromSiri7Days;
  int v40;
  int appUsageCountFromSiri14Days;
  int v42;
  int appUsageCountFromSiri28Days;
  int v44;
  int appUsageCountFromSiriInf;
  int v46;
  int recencyOrderOfAppUsageFromSiri;
  int v48;
  int64_t timeSinceAppUsedFromSiriInSec;
  int v50;
  int taskAbandonCountInUsingApp2Min;
  int v52;
  int taskAbandonCountInUsingApp10Min;
  int v54;
  int taskAbandonCountInUsingApp1Hr;
  int v56;
  int taskAbandonCountInUsingApp6Hrs;
  int v58;
  int taskAbandonCountInUsingApp1Day;
  int v60;
  int taskAbandonCountInUsingApp7Days;
  int v62;
  int taskAbandonCountInUsingApp14Days;
  int v64;
  int taskAbandonCountInUsingApp28Days;
  int v66;
  int taskAbandonCountInUsingAppInf;
  BOOL v68;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_126;
  has = self->_has;
  v6 = v4[35];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_126;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    appUsageCount2Min = self->_appUsageCount2Min;
    if (appUsageCount2Min != objc_msgSend(v4, "appUsageCount2Min"))
      goto LABEL_126;
    has = self->_has;
    v6 = v4[35];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_126;
  if (v8)
  {
    appUsageCount10Min = self->_appUsageCount10Min;
    if (appUsageCount10Min != objc_msgSend(v4, "appUsageCount10Min"))
      goto LABEL_126;
    has = self->_has;
    v6 = v4[35];
  }
  v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_126;
  if (v10)
  {
    appUsageCount1Hr = self->_appUsageCount1Hr;
    if (appUsageCount1Hr != objc_msgSend(v4, "appUsageCount1Hr"))
      goto LABEL_126;
    has = self->_has;
    v6 = v4[35];
  }
  v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1))
    goto LABEL_126;
  if (v12)
  {
    appUsageCount6Hrs = self->_appUsageCount6Hrs;
    if (appUsageCount6Hrs != objc_msgSend(v4, "appUsageCount6Hrs"))
      goto LABEL_126;
    has = self->_has;
    v6 = v4[35];
  }
  v14 = (*(unsigned int *)&has >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1))
    goto LABEL_126;
  if (v14)
  {
    appUsageCount1Day = self->_appUsageCount1Day;
    if (appUsageCount1Day != objc_msgSend(v4, "appUsageCount1Day"))
      goto LABEL_126;
    has = self->_has;
    v6 = v4[35];
  }
  v16 = (*(unsigned int *)&has >> 5) & 1;
  if (v16 != ((v6 >> 5) & 1))
    goto LABEL_126;
  if (v16)
  {
    appUsageCount7Days = self->_appUsageCount7Days;
    if (appUsageCount7Days != objc_msgSend(v4, "appUsageCount7Days"))
      goto LABEL_126;
    has = self->_has;
    v6 = v4[35];
  }
  v18 = (*(unsigned int *)&has >> 6) & 1;
  if (v18 != ((v6 >> 6) & 1))
    goto LABEL_126;
  if (v18)
  {
    appUsageCount14Days = self->_appUsageCount14Days;
    if (appUsageCount14Days != objc_msgSend(v4, "appUsageCount14Days"))
      goto LABEL_126;
    has = self->_has;
    v6 = v4[35];
  }
  v20 = (*(unsigned int *)&has >> 7) & 1;
  if (v20 != ((v6 >> 7) & 1))
    goto LABEL_126;
  if (v20)
  {
    appUsageCount28Days = self->_appUsageCount28Days;
    if (appUsageCount28Days != objc_msgSend(v4, "appUsageCount28Days"))
      goto LABEL_126;
    has = self->_has;
    v6 = v4[35];
  }
  v22 = (*(unsigned int *)&has >> 8) & 1;
  if (v22 != ((v6 >> 8) & 1))
    goto LABEL_126;
  if (v22)
  {
    appUsageCountInf = self->_appUsageCountInf;
    if (appUsageCountInf != objc_msgSend(v4, "appUsageCountInf"))
      goto LABEL_126;
    has = self->_has;
    v6 = v4[35];
  }
  v24 = (*(unsigned int *)&has >> 9) & 1;
  if (v24 != ((v6 >> 9) & 1))
    goto LABEL_126;
  if (v24)
  {
    recencyOrderOfAppUsed = self->_recencyOrderOfAppUsed;
    if (recencyOrderOfAppUsed != objc_msgSend(v4, "recencyOrderOfAppUsed"))
      goto LABEL_126;
    has = self->_has;
    v6 = v4[35];
  }
  v26 = (*(unsigned int *)&has >> 10) & 1;
  if (v26 != ((v6 >> 10) & 1))
    goto LABEL_126;
  if (v26)
  {
    timeSinceAppUsedInSec = self->_timeSinceAppUsedInSec;
    if (timeSinceAppUsedInSec != objc_msgSend(v4, "timeSinceAppUsedInSec"))
      goto LABEL_126;
    has = self->_has;
    v6 = v4[35];
  }
  v28 = (*(unsigned int *)&has >> 11) & 1;
  if (v28 != ((v6 >> 11) & 1))
    goto LABEL_126;
  if (v28)
  {
    appUsageCountFromSiri2Min = self->_appUsageCountFromSiri2Min;
    if (appUsageCountFromSiri2Min != objc_msgSend(v4, "appUsageCountFromSiri2Min"))
      goto LABEL_126;
    has = self->_has;
    v6 = v4[35];
  }
  v30 = (*(unsigned int *)&has >> 12) & 1;
  if (v30 != ((v6 >> 12) & 1))
    goto LABEL_126;
  if (v30)
  {
    appUsageCountFromSiri10Min = self->_appUsageCountFromSiri10Min;
    if (appUsageCountFromSiri10Min != objc_msgSend(v4, "appUsageCountFromSiri10Min"))
      goto LABEL_126;
    has = self->_has;
    v6 = v4[35];
  }
  v32 = (*(unsigned int *)&has >> 13) & 1;
  if (v32 != ((v6 >> 13) & 1))
    goto LABEL_126;
  if (v32)
  {
    appUsageCountFromSiri1Hr = self->_appUsageCountFromSiri1Hr;
    if (appUsageCountFromSiri1Hr != objc_msgSend(v4, "appUsageCountFromSiri1Hr"))
      goto LABEL_126;
    has = self->_has;
    v6 = v4[35];
  }
  v34 = (*(unsigned int *)&has >> 14) & 1;
  if (v34 != ((v6 >> 14) & 1))
    goto LABEL_126;
  if (v34)
  {
    appUsageCountFromSiri6Hrs = self->_appUsageCountFromSiri6Hrs;
    if (appUsageCountFromSiri6Hrs != objc_msgSend(v4, "appUsageCountFromSiri6Hrs"))
      goto LABEL_126;
    has = self->_has;
    v6 = v4[35];
  }
  v36 = (*(unsigned int *)&has >> 15) & 1;
  if (v36 != ((v6 >> 15) & 1))
    goto LABEL_126;
  if (v36)
  {
    appUsageCountFromSiri1Day = self->_appUsageCountFromSiri1Day;
    if (appUsageCountFromSiri1Day != objc_msgSend(v4, "appUsageCountFromSiri1Day"))
      goto LABEL_126;
    has = self->_has;
    v6 = v4[35];
  }
  v38 = HIWORD(*(unsigned int *)&has) & 1;
  if (v38 != (HIWORD(v6) & 1))
    goto LABEL_126;
  if (v38)
  {
    appUsageCountFromSiri7Days = self->_appUsageCountFromSiri7Days;
    if (appUsageCountFromSiri7Days != objc_msgSend(v4, "appUsageCountFromSiri7Days"))
      goto LABEL_126;
    has = self->_has;
    v6 = v4[35];
  }
  v40 = (*(unsigned int *)&has >> 17) & 1;
  if (v40 != ((v6 >> 17) & 1))
    goto LABEL_126;
  if (v40)
  {
    appUsageCountFromSiri14Days = self->_appUsageCountFromSiri14Days;
    if (appUsageCountFromSiri14Days != objc_msgSend(v4, "appUsageCountFromSiri14Days"))
      goto LABEL_126;
    has = self->_has;
    v6 = v4[35];
  }
  v42 = (*(unsigned int *)&has >> 18) & 1;
  if (v42 != ((v6 >> 18) & 1))
    goto LABEL_126;
  if (v42)
  {
    appUsageCountFromSiri28Days = self->_appUsageCountFromSiri28Days;
    if (appUsageCountFromSiri28Days != objc_msgSend(v4, "appUsageCountFromSiri28Days"))
      goto LABEL_126;
    has = self->_has;
    v6 = v4[35];
  }
  v44 = (*(unsigned int *)&has >> 19) & 1;
  if (v44 != ((v6 >> 19) & 1))
    goto LABEL_126;
  if (v44)
  {
    appUsageCountFromSiriInf = self->_appUsageCountFromSiriInf;
    if (appUsageCountFromSiriInf != objc_msgSend(v4, "appUsageCountFromSiriInf"))
      goto LABEL_126;
    has = self->_has;
    v6 = v4[35];
  }
  v46 = (*(unsigned int *)&has >> 20) & 1;
  if (v46 != ((v6 >> 20) & 1))
    goto LABEL_126;
  if (v46)
  {
    recencyOrderOfAppUsageFromSiri = self->_recencyOrderOfAppUsageFromSiri;
    if (recencyOrderOfAppUsageFromSiri != objc_msgSend(v4, "recencyOrderOfAppUsageFromSiri"))
      goto LABEL_126;
    has = self->_has;
    v6 = v4[35];
  }
  v48 = (*(unsigned int *)&has >> 21) & 1;
  if (v48 != ((v6 >> 21) & 1))
    goto LABEL_126;
  if (v48)
  {
    timeSinceAppUsedFromSiriInSec = self->_timeSinceAppUsedFromSiriInSec;
    if (timeSinceAppUsedFromSiriInSec != objc_msgSend(v4, "timeSinceAppUsedFromSiriInSec"))
      goto LABEL_126;
    has = self->_has;
    v6 = v4[35];
  }
  v50 = (*(unsigned int *)&has >> 22) & 1;
  if (v50 != ((v6 >> 22) & 1))
    goto LABEL_126;
  if (v50)
  {
    taskAbandonCountInUsingApp2Min = self->_taskAbandonCountInUsingApp2Min;
    if (taskAbandonCountInUsingApp2Min != objc_msgSend(v4, "taskAbandonCountInUsingApp2Min"))
      goto LABEL_126;
    has = self->_has;
    v6 = v4[35];
  }
  v52 = (*(unsigned int *)&has >> 23) & 1;
  if (v52 != ((v6 >> 23) & 1))
    goto LABEL_126;
  if (v52)
  {
    taskAbandonCountInUsingApp10Min = self->_taskAbandonCountInUsingApp10Min;
    if (taskAbandonCountInUsingApp10Min != objc_msgSend(v4, "taskAbandonCountInUsingApp10Min"))
      goto LABEL_126;
    has = self->_has;
    v6 = v4[35];
  }
  v54 = HIBYTE(*(unsigned int *)&has) & 1;
  if (v54 != (HIBYTE(v6) & 1))
    goto LABEL_126;
  if (v54)
  {
    taskAbandonCountInUsingApp1Hr = self->_taskAbandonCountInUsingApp1Hr;
    if (taskAbandonCountInUsingApp1Hr != objc_msgSend(v4, "taskAbandonCountInUsingApp1Hr"))
      goto LABEL_126;
    has = self->_has;
    v6 = v4[35];
  }
  v56 = (*(unsigned int *)&has >> 25) & 1;
  if (v56 != ((v6 >> 25) & 1))
    goto LABEL_126;
  if (v56)
  {
    taskAbandonCountInUsingApp6Hrs = self->_taskAbandonCountInUsingApp6Hrs;
    if (taskAbandonCountInUsingApp6Hrs != objc_msgSend(v4, "taskAbandonCountInUsingApp6Hrs"))
      goto LABEL_126;
    has = self->_has;
    v6 = v4[35];
  }
  v58 = (*(unsigned int *)&has >> 26) & 1;
  if (v58 != ((v6 >> 26) & 1))
    goto LABEL_126;
  if (v58)
  {
    taskAbandonCountInUsingApp1Day = self->_taskAbandonCountInUsingApp1Day;
    if (taskAbandonCountInUsingApp1Day != objc_msgSend(v4, "taskAbandonCountInUsingApp1Day"))
      goto LABEL_126;
    has = self->_has;
    v6 = v4[35];
  }
  v60 = (*(unsigned int *)&has >> 27) & 1;
  if (v60 != ((v6 >> 27) & 1))
    goto LABEL_126;
  if (v60)
  {
    taskAbandonCountInUsingApp7Days = self->_taskAbandonCountInUsingApp7Days;
    if (taskAbandonCountInUsingApp7Days != objc_msgSend(v4, "taskAbandonCountInUsingApp7Days"))
      goto LABEL_126;
    has = self->_has;
    v6 = v4[35];
  }
  v62 = (*(unsigned int *)&has >> 28) & 1;
  if (v62 != ((v6 >> 28) & 1))
    goto LABEL_126;
  if (v62)
  {
    taskAbandonCountInUsingApp14Days = self->_taskAbandonCountInUsingApp14Days;
    if (taskAbandonCountInUsingApp14Days != objc_msgSend(v4, "taskAbandonCountInUsingApp14Days"))
      goto LABEL_126;
    has = self->_has;
    v6 = v4[35];
  }
  v64 = (*(unsigned int *)&has >> 29) & 1;
  if (v64 != ((v6 >> 29) & 1))
    goto LABEL_126;
  if (v64)
  {
    taskAbandonCountInUsingApp28Days = self->_taskAbandonCountInUsingApp28Days;
    if (taskAbandonCountInUsingApp28Days == objc_msgSend(v4, "taskAbandonCountInUsingApp28Days"))
    {
      has = self->_has;
      v6 = v4[35];
      goto LABEL_122;
    }
LABEL_126:
    v68 = 0;
    goto LABEL_127;
  }
LABEL_122:
  v66 = (*(unsigned int *)&has >> 30) & 1;
  if (v66 != ((v6 >> 30) & 1))
    goto LABEL_126;
  if (v66)
  {
    taskAbandonCountInUsingAppInf = self->_taskAbandonCountInUsingAppInf;
    if (taskAbandonCountInUsingAppInf != objc_msgSend(v4, "taskAbandonCountInUsingAppInf"))
      goto LABEL_126;
  }
  v68 = 1;
LABEL_127:

  return v68;
}

- (unint64_t)hash
{
  $6C0861D200E4D330AE256ED4C8F76FC1 has;
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
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v34 = 2654435761 * self->_appUsageCount2Min;
    if ((*(_BYTE *)&has & 2) != 0)
    {
LABEL_3:
      v33 = 2654435761 * self->_appUsageCount10Min;
      if ((*(_BYTE *)&has & 4) != 0)
        goto LABEL_4;
      goto LABEL_35;
    }
  }
  else
  {
    v34 = 0;
    if ((*(_BYTE *)&has & 2) != 0)
      goto LABEL_3;
  }
  v33 = 0;
  if ((*(_BYTE *)&has & 4) != 0)
  {
LABEL_4:
    v32 = 2654435761 * self->_appUsageCount1Hr;
    if ((*(_BYTE *)&has & 8) != 0)
      goto LABEL_5;
    goto LABEL_36;
  }
LABEL_35:
  v32 = 0;
  if ((*(_BYTE *)&has & 8) != 0)
  {
LABEL_5:
    v31 = 2654435761 * self->_appUsageCount6Hrs;
    if ((*(_BYTE *)&has & 0x10) != 0)
      goto LABEL_6;
    goto LABEL_37;
  }
LABEL_36:
  v31 = 0;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
LABEL_6:
    v30 = 2654435761 * self->_appUsageCount1Day;
    if ((*(_BYTE *)&has & 0x20) != 0)
      goto LABEL_7;
    goto LABEL_38;
  }
LABEL_37:
  v30 = 0;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
LABEL_7:
    v3 = 2654435761 * self->_appUsageCount7Days;
    if ((*(_BYTE *)&has & 0x40) != 0)
      goto LABEL_8;
    goto LABEL_39;
  }
LABEL_38:
  v3 = 0;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
LABEL_8:
    v4 = 2654435761 * self->_appUsageCount14Days;
    if ((*(_BYTE *)&has & 0x80) != 0)
      goto LABEL_9;
    goto LABEL_40;
  }
LABEL_39:
  v4 = 0;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
LABEL_9:
    v5 = 2654435761 * self->_appUsageCount28Days;
    if ((*(_WORD *)&has & 0x100) != 0)
      goto LABEL_10;
    goto LABEL_41;
  }
LABEL_40:
  v5 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_10:
    v6 = 2654435761 * self->_appUsageCountInf;
    if ((*(_WORD *)&has & 0x200) != 0)
      goto LABEL_11;
    goto LABEL_42;
  }
LABEL_41:
  v6 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_11:
    v7 = 2654435761 * self->_recencyOrderOfAppUsed;
    if ((*(_WORD *)&has & 0x400) != 0)
      goto LABEL_12;
    goto LABEL_43;
  }
LABEL_42:
  v7 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_12:
    v8 = 2654435761 * self->_timeSinceAppUsedInSec;
    if ((*(_WORD *)&has & 0x800) != 0)
      goto LABEL_13;
    goto LABEL_44;
  }
LABEL_43:
  v8 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_13:
    v9 = 2654435761 * self->_appUsageCountFromSiri2Min;
    if ((*(_WORD *)&has & 0x1000) != 0)
      goto LABEL_14;
    goto LABEL_45;
  }
LABEL_44:
  v9 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_14:
    v10 = 2654435761 * self->_appUsageCountFromSiri10Min;
    if ((*(_WORD *)&has & 0x2000) != 0)
      goto LABEL_15;
    goto LABEL_46;
  }
LABEL_45:
  v10 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_15:
    v11 = 2654435761 * self->_appUsageCountFromSiri1Hr;
    if ((*(_WORD *)&has & 0x4000) != 0)
      goto LABEL_16;
    goto LABEL_47;
  }
LABEL_46:
  v11 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_16:
    v12 = 2654435761 * self->_appUsageCountFromSiri6Hrs;
    if ((*(_WORD *)&has & 0x8000) != 0)
      goto LABEL_17;
    goto LABEL_48;
  }
LABEL_47:
  v12 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_17:
    v13 = 2654435761 * self->_appUsageCountFromSiri1Day;
    if ((*(_DWORD *)&has & 0x10000) != 0)
      goto LABEL_18;
    goto LABEL_49;
  }
LABEL_48:
  v13 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_18:
    v14 = 2654435761 * self->_appUsageCountFromSiri7Days;
    if ((*(_DWORD *)&has & 0x20000) != 0)
      goto LABEL_19;
    goto LABEL_50;
  }
LABEL_49:
  v14 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_19:
    v15 = 2654435761 * self->_appUsageCountFromSiri14Days;
    if ((*(_DWORD *)&has & 0x40000) != 0)
      goto LABEL_20;
    goto LABEL_51;
  }
LABEL_50:
  v15 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_20:
    v16 = 2654435761 * self->_appUsageCountFromSiri28Days;
    if ((*(_DWORD *)&has & 0x80000) != 0)
      goto LABEL_21;
    goto LABEL_52;
  }
LABEL_51:
  v16 = 0;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
LABEL_21:
    v17 = 2654435761 * self->_appUsageCountFromSiriInf;
    if ((*(_DWORD *)&has & 0x100000) != 0)
      goto LABEL_22;
    goto LABEL_53;
  }
LABEL_52:
  v17 = 0;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_22:
    v18 = 2654435761 * self->_recencyOrderOfAppUsageFromSiri;
    if ((*(_DWORD *)&has & 0x200000) != 0)
      goto LABEL_23;
    goto LABEL_54;
  }
LABEL_53:
  v18 = 0;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_23:
    v19 = 2654435761 * self->_timeSinceAppUsedFromSiriInSec;
    if ((*(_DWORD *)&has & 0x400000) != 0)
      goto LABEL_24;
    goto LABEL_55;
  }
LABEL_54:
  v19 = 0;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_24:
    v20 = 2654435761 * self->_taskAbandonCountInUsingApp2Min;
    if ((*(_DWORD *)&has & 0x800000) != 0)
      goto LABEL_25;
    goto LABEL_56;
  }
LABEL_55:
  v20 = 0;
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
LABEL_25:
    v21 = 2654435761 * self->_taskAbandonCountInUsingApp10Min;
    if ((*(_DWORD *)&has & 0x1000000) != 0)
      goto LABEL_26;
    goto LABEL_57;
  }
LABEL_56:
  v21 = 0;
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
LABEL_26:
    v22 = 2654435761 * self->_taskAbandonCountInUsingApp1Hr;
    if ((*(_DWORD *)&has & 0x2000000) != 0)
      goto LABEL_27;
    goto LABEL_58;
  }
LABEL_57:
  v22 = 0;
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
LABEL_27:
    v23 = 2654435761 * self->_taskAbandonCountInUsingApp6Hrs;
    if ((*(_DWORD *)&has & 0x4000000) != 0)
      goto LABEL_28;
    goto LABEL_59;
  }
LABEL_58:
  v23 = 0;
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
LABEL_28:
    v24 = 2654435761 * self->_taskAbandonCountInUsingApp1Day;
    if ((*(_DWORD *)&has & 0x8000000) != 0)
      goto LABEL_29;
    goto LABEL_60;
  }
LABEL_59:
  v24 = 0;
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
LABEL_29:
    v25 = 2654435761 * self->_taskAbandonCountInUsingApp7Days;
    if ((*(_DWORD *)&has & 0x10000000) != 0)
      goto LABEL_30;
    goto LABEL_61;
  }
LABEL_60:
  v25 = 0;
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
LABEL_30:
    v26 = 2654435761 * self->_taskAbandonCountInUsingApp14Days;
    if ((*(_DWORD *)&has & 0x20000000) != 0)
      goto LABEL_31;
LABEL_62:
    v27 = 0;
    if ((*(_DWORD *)&has & 0x40000000) != 0)
      goto LABEL_32;
LABEL_63:
    v28 = 0;
    return v33 ^ v34 ^ v32 ^ v31 ^ v30 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28;
  }
LABEL_61:
  v26 = 0;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
    goto LABEL_62;
LABEL_31:
  v27 = 2654435761 * self->_taskAbandonCountInUsingApp28Days;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
    goto LABEL_63;
LABEL_32:
  v28 = 2654435761 * self->_taskAbandonCountInUsingAppInf;
  return v33 ^ v34 ^ v32 ^ v31 ^ v30 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28;
}

- (id)dictionaryRepresentation
{
  void *v3;
  $6C0861D200E4D330AE256ED4C8F76FC1 has;
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = self->_has;
  if ((*(_BYTE *)&has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals appUsageCount10Min](self, "appUsageCount10Min"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("appUsageCount10Min"));

    has = self->_has;
    if ((*(_BYTE *)&has & 0x40) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_36;
    }
  }
  else if ((*(_BYTE *)&has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals appUsageCount14Days](self, "appUsageCount14Days"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("appUsageCount14Days"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_5;
    goto LABEL_37;
  }
LABEL_36:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals appUsageCount1Day](self, "appUsageCount1Day"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("appUsageCount1Day"));

  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_38;
  }
LABEL_37:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals appUsageCount1Hr](self, "appUsageCount1Hr"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("appUsageCount1Hr"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_7;
    goto LABEL_39;
  }
LABEL_38:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals appUsageCount28Days](self, "appUsageCount28Days"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("appUsageCount28Days"));

  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_8;
    goto LABEL_40;
  }
LABEL_39:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals appUsageCount2Min](self, "appUsageCount2Min"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("appUsageCount2Min"));

  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_41;
  }
LABEL_40:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals appUsageCount6Hrs](self, "appUsageCount6Hrs"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("appUsageCount6Hrs"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_10;
    goto LABEL_42;
  }
LABEL_41:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals appUsageCount7Days](self, "appUsageCount7Days"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("appUsageCount7Days"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_11;
    goto LABEL_43;
  }
LABEL_42:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals appUsageCountFromSiri10Min](self, "appUsageCountFromSiri10Min"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("appUsageCountFromSiri10Min"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_12;
    goto LABEL_44;
  }
LABEL_43:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals appUsageCountFromSiri14Days](self, "appUsageCountFromSiri14Days"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("appUsageCountFromSiri14Days"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_13;
    goto LABEL_45;
  }
LABEL_44:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals appUsageCountFromSiri1Day](self, "appUsageCountFromSiri1Day"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("appUsageCountFromSiri1Day"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_14;
    goto LABEL_46;
  }
LABEL_45:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals appUsageCountFromSiri1Hr](self, "appUsageCountFromSiri1Hr"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("appUsageCountFromSiri1Hr"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_15;
    goto LABEL_47;
  }
LABEL_46:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals appUsageCountFromSiri28Days](self, "appUsageCountFromSiri28Days"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("appUsageCountFromSiri28Days"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_16;
    goto LABEL_48;
  }
LABEL_47:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals appUsageCountFromSiri2Min](self, "appUsageCountFromSiri2Min"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("appUsageCountFromSiri2Min"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_17;
    goto LABEL_49;
  }
LABEL_48:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals appUsageCountFromSiri6Hrs](self, "appUsageCountFromSiri6Hrs"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("appUsageCountFromSiri6Hrs"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_18;
    goto LABEL_50;
  }
LABEL_49:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals appUsageCountFromSiri7Days](self, "appUsageCountFromSiri7Days"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("appUsageCountFromSiri7Days"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_19;
    goto LABEL_51;
  }
LABEL_50:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals appUsageCountFromSiriInf](self, "appUsageCountFromSiriInf"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("appUsageCountFromSiriInf"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_20;
    goto LABEL_52;
  }
LABEL_51:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals appUsageCountInf](self, "appUsageCountInf"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("appUsageCountInf"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_21;
    goto LABEL_53;
  }
LABEL_52:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals recencyOrderOfAppUsageFromSiri](self, "recencyOrderOfAppUsageFromSiri"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("recencyOrderOfAppUsageFromSiri"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_22;
    goto LABEL_54;
  }
LABEL_53:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals recencyOrderOfAppUsed](self, "recencyOrderOfAppUsed"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("recencyOrderOfAppUsed"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_23;
    goto LABEL_55;
  }
LABEL_54:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals taskAbandonCountInUsingApp10Min](self, "taskAbandonCountInUsingApp10Min"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("taskAbandonCountInUsingApp10Min"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_24;
    goto LABEL_56;
  }
LABEL_55:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals taskAbandonCountInUsingApp14Days](self, "taskAbandonCountInUsingApp14Days"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("taskAbandonCountInUsingApp14Days"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_25;
    goto LABEL_57;
  }
LABEL_56:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals taskAbandonCountInUsingApp1Day](self, "taskAbandonCountInUsingApp1Day"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("taskAbandonCountInUsingApp1Day"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_26;
    goto LABEL_58;
  }
LABEL_57:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals taskAbandonCountInUsingApp1Hr](self, "taskAbandonCountInUsingApp1Hr"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("taskAbandonCountInUsingApp1Hr"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_27;
    goto LABEL_59;
  }
LABEL_58:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals taskAbandonCountInUsingApp28Days](self, "taskAbandonCountInUsingApp28Days"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("taskAbandonCountInUsingApp28Days"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_28;
    goto LABEL_60;
  }
LABEL_59:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals taskAbandonCountInUsingApp2Min](self, "taskAbandonCountInUsingApp2Min"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("taskAbandonCountInUsingApp2Min"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_29;
    goto LABEL_61;
  }
LABEL_60:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals taskAbandonCountInUsingApp6Hrs](self, "taskAbandonCountInUsingApp6Hrs"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("taskAbandonCountInUsingApp6Hrs"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x40000000) == 0)
      goto LABEL_30;
    goto LABEL_62;
  }
LABEL_61:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals taskAbandonCountInUsingApp7Days](self, "taskAbandonCountInUsingApp7Days"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("taskAbandonCountInUsingApp7Days"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_31;
LABEL_63:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals timeSinceAppUsedFromSiriInSec](self, "timeSinceAppUsedFromSiriInSec"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("timeSinceAppUsedFromSiriInSec"));

    if ((*(_DWORD *)&self->_has & 0x400) == 0)
      goto LABEL_33;
    goto LABEL_32;
  }
LABEL_62:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals taskAbandonCountInUsingAppInf](self, "taskAbandonCountInUsingAppInf"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("taskAbandonCountInUsingAppInf"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) != 0)
    goto LABEL_63;
LABEL_31:
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_32:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals timeSinceAppUsedInSec](self, "timeSinceAppUsedInSec"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("timeSinceAppUsedInSec"));

  }
LABEL_33:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals)initWithJSON:(id)a3
{
  void *v4;
  INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals *v5;
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
    self = -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals)initWithDictionary:(id)a3
{
  id v4;
  INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals *v5;
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
  uint64_t v25;
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
  INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals *v42;
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
  objc_super v68;

  v4 = a3;
  v68.receiver = self;
  v68.super_class = (Class)INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals;
  v5 = -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals init](&v68, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appUsageCount2Min"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setAppUsageCount2Min:](v5, "setAppUsageCount2Min:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appUsageCount10Min"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setAppUsageCount10Min:](v5, "setAppUsageCount10Min:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appUsageCount1Hr"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setAppUsageCount1Hr:](v5, "setAppUsageCount1Hr:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appUsageCount6Hrs"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setAppUsageCount6Hrs:](v5, "setAppUsageCount6Hrs:", objc_msgSend(v9, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appUsageCount1Day"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setAppUsageCount1Day:](v5, "setAppUsageCount1Day:", objc_msgSend(v10, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appUsageCount7Days"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setAppUsageCount7Days:](v5, "setAppUsageCount7Days:", objc_msgSend(v11, "intValue"));
    v57 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appUsageCount14Days"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setAppUsageCount14Days:](v5, "setAppUsageCount14Days:", objc_msgSend(v12, "intValue"));
    v51 = v12;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appUsageCount28Days"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v67 = v13;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setAppUsageCount28Days:](v5, "setAppUsageCount28Days:", objc_msgSend(v13, "intValue"));
    v14 = v10;
    v56 = v7;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appUsageCountInf"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setAppUsageCountInf:](v5, "setAppUsageCountInf:", objc_msgSend(v15, "intValue"));
    v16 = v9;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recencyOrderOfAppUsed"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v66 = v17;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setRecencyOrderOfAppUsed:](v5, "setRecencyOrderOfAppUsed:", objc_msgSend(v17, "intValue"));
    v18 = v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeSinceAppUsedInSec"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setTimeSinceAppUsedInSec:](v5, "setTimeSinceAppUsedInSec:", objc_msgSend(v19, "longLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appUsageCountFromSiri2Min"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v65 = v20;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setAppUsageCountFromSiri2Min:](v5, "setAppUsageCountFromSiri2Min:", objc_msgSend(v20, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appUsageCountFromSiri10Min"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setAppUsageCountFromSiri10Min:](v5, "setAppUsageCountFromSiri10Min:", objc_msgSend(v21, "intValue"));
    v48 = v21;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appUsageCountFromSiri1Hr"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v64 = v22;
    v55 = v18;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setAppUsageCountFromSiri1Hr:](v5, "setAppUsageCountFromSiri1Hr:", objc_msgSend(v22, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appUsageCountFromSiri6Hrs"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v63 = v23;
    v54 = v16;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setAppUsageCountFromSiri6Hrs:](v5, "setAppUsageCountFromSiri6Hrs:", objc_msgSend(v23, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appUsageCountFromSiri1Day"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v62 = v24;
    v53 = v14;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setAppUsageCountFromSiri1Day:](v5, "setAppUsageCountFromSiri1Day:", objc_msgSend(v24, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appUsageCountFromSiri7Days"));
    v25 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v61 = (void *)v25;
    v26 = v11;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setAppUsageCountFromSiri7Days:](v5, "setAppUsageCountFromSiri7Days:", objc_msgSend(v61, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appUsageCountFromSiri14Days"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setAppUsageCountFromSiri14Days:](v5, "setAppUsageCountFromSiri14Days:", objc_msgSend(v27, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appUsageCountFromSiri28Days"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v60 = v28;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setAppUsageCountFromSiri28Days:](v5, "setAppUsageCountFromSiri28Days:", objc_msgSend(v28, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appUsageCountFromSiriInf"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setAppUsageCountFromSiriInf:](v5, "setAppUsageCountFromSiriInf:", objc_msgSend(v29, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recencyOrderOfAppUsageFromSiri"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v59 = v30;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setRecencyOrderOfAppUsageFromSiri:](v5, "setRecencyOrderOfAppUsageFromSiri:", objc_msgSend(v30, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeSinceAppUsedFromSiriInSec"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setTimeSinceAppUsedFromSiriInSec:](v5, "setTimeSinceAppUsedFromSiriInSec:", objc_msgSend(v31, "longLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("taskAbandonCountInUsingApp2Min"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v58 = v32;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setTaskAbandonCountInUsingApp2Min:](v5, "setTaskAbandonCountInUsingApp2Min:", objc_msgSend(v32, "intValue"));
    v50 = v15;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("taskAbandonCountInUsingApp10Min"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setTaskAbandonCountInUsingApp10Min:](v5, "setTaskAbandonCountInUsingApp10Min:", objc_msgSend(v33, "intValue"));
    v49 = v19;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("taskAbandonCountInUsingApp1Hr"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setTaskAbandonCountInUsingApp1Hr:](v5, "setTaskAbandonCountInUsingApp1Hr:", objc_msgSend(v34, "intValue"));
    v44 = v34;
    v47 = v29;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("taskAbandonCountInUsingApp6Hrs"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setTaskAbandonCountInUsingApp6Hrs:](v5, "setTaskAbandonCountInUsingApp6Hrs:", objc_msgSend(v35, "intValue"));
    v46 = v31;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("taskAbandonCountInUsingApp1Day"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setTaskAbandonCountInUsingApp1Day:](v5, "setTaskAbandonCountInUsingApp1Day:", objc_msgSend(v36, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("taskAbandonCountInUsingApp7Days"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setTaskAbandonCountInUsingApp7Days:](v5, "setTaskAbandonCountInUsingApp7Days:", objc_msgSend(v37, "intValue"));
    v45 = v33;
    v52 = v26;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("taskAbandonCountInUsingApp14Days"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setTaskAbandonCountInUsingApp14Days:](v5, "setTaskAbandonCountInUsingApp14Days:", objc_msgSend(v38, "intValue"));
    v39 = v27;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("taskAbandonCountInUsingApp28Days"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setTaskAbandonCountInUsingApp28Days:](v5, "setTaskAbandonCountInUsingApp28Days:", objc_msgSend(v40, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("taskAbandonCountInUsingAppInf"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setTaskAbandonCountInUsingAppInf:](v5, "setTaskAbandonCountInUsingAppInf:", objc_msgSend(v41, "intValue"));
    v42 = v5;

  }
  return v5;
}

- (int)appUsageCount2Min
{
  return self->_appUsageCount2Min;
}

- (int)appUsageCount10Min
{
  return self->_appUsageCount10Min;
}

- (int)appUsageCount1Hr
{
  return self->_appUsageCount1Hr;
}

- (int)appUsageCount6Hrs
{
  return self->_appUsageCount6Hrs;
}

- (int)appUsageCount1Day
{
  return self->_appUsageCount1Day;
}

- (int)appUsageCount7Days
{
  return self->_appUsageCount7Days;
}

- (int)appUsageCount14Days
{
  return self->_appUsageCount14Days;
}

- (int)appUsageCount28Days
{
  return self->_appUsageCount28Days;
}

- (int)appUsageCountInf
{
  return self->_appUsageCountInf;
}

- (int)recencyOrderOfAppUsed
{
  return self->_recencyOrderOfAppUsed;
}

- (int64_t)timeSinceAppUsedInSec
{
  return self->_timeSinceAppUsedInSec;
}

- (int)appUsageCountFromSiri2Min
{
  return self->_appUsageCountFromSiri2Min;
}

- (int)appUsageCountFromSiri10Min
{
  return self->_appUsageCountFromSiri10Min;
}

- (int)appUsageCountFromSiri1Hr
{
  return self->_appUsageCountFromSiri1Hr;
}

- (int)appUsageCountFromSiri6Hrs
{
  return self->_appUsageCountFromSiri6Hrs;
}

- (int)appUsageCountFromSiri1Day
{
  return self->_appUsageCountFromSiri1Day;
}

- (int)appUsageCountFromSiri7Days
{
  return self->_appUsageCountFromSiri7Days;
}

- (int)appUsageCountFromSiri14Days
{
  return self->_appUsageCountFromSiri14Days;
}

- (int)appUsageCountFromSiri28Days
{
  return self->_appUsageCountFromSiri28Days;
}

- (int)appUsageCountFromSiriInf
{
  return self->_appUsageCountFromSiriInf;
}

- (int)recencyOrderOfAppUsageFromSiri
{
  return self->_recencyOrderOfAppUsageFromSiri;
}

- (int64_t)timeSinceAppUsedFromSiriInSec
{
  return self->_timeSinceAppUsedFromSiriInSec;
}

- (int)taskAbandonCountInUsingApp2Min
{
  return self->_taskAbandonCountInUsingApp2Min;
}

- (int)taskAbandonCountInUsingApp10Min
{
  return self->_taskAbandonCountInUsingApp10Min;
}

- (int)taskAbandonCountInUsingApp1Hr
{
  return self->_taskAbandonCountInUsingApp1Hr;
}

- (int)taskAbandonCountInUsingApp6Hrs
{
  return self->_taskAbandonCountInUsingApp6Hrs;
}

- (int)taskAbandonCountInUsingApp1Day
{
  return self->_taskAbandonCountInUsingApp1Day;
}

- (int)taskAbandonCountInUsingApp7Days
{
  return self->_taskAbandonCountInUsingApp7Days;
}

- (int)taskAbandonCountInUsingApp14Days
{
  return self->_taskAbandonCountInUsingApp14Days;
}

- (int)taskAbandonCountInUsingApp28Days
{
  return self->_taskAbandonCountInUsingApp28Days;
}

- (int)taskAbandonCountInUsingAppInf
{
  return self->_taskAbandonCountInUsingAppInf;
}

@end
