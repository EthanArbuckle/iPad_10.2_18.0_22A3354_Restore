@implementation INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setAppUsageCountForEntity2Min:(int)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_appUsageCountForEntity2Min = a3;
}

- (BOOL)hasAppUsageCountForEntity2Min
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setHasAppUsageCountForEntity2Min:(BOOL)a3
{
  self->_has = ($9375210CE62556719FB562F58417832B)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (void)deleteAppUsageCountForEntity2Min
{
  -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setAppUsageCountForEntity2Min:](self, "setAppUsageCountForEntity2Min:", 0);
  *(_DWORD *)&self->_has &= ~1u;
}

- (void)setAppUsageCountForEntity10Min:(int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_appUsageCountForEntity10Min = a3;
}

- (BOOL)hasAppUsageCountForEntity10Min
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasAppUsageCountForEntity10Min:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($9375210CE62556719FB562F58417832B)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (void)deleteAppUsageCountForEntity10Min
{
  -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setAppUsageCountForEntity10Min:](self, "setAppUsageCountForEntity10Min:", 0);
  *(_DWORD *)&self->_has &= ~2u;
}

- (void)setAppUsageCountForEntity1Hr:(int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_appUsageCountForEntity1Hr = a3;
}

- (BOOL)hasAppUsageCountForEntity1Hr
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasAppUsageCountForEntity1Hr:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($9375210CE62556719FB562F58417832B)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (void)deleteAppUsageCountForEntity1Hr
{
  -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setAppUsageCountForEntity1Hr:](self, "setAppUsageCountForEntity1Hr:", 0);
  *(_DWORD *)&self->_has &= ~4u;
}

- (void)setAppUsageCountForEntity6Hrs:(int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_appUsageCountForEntity6Hrs = a3;
}

- (BOOL)hasAppUsageCountForEntity6Hrs
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasAppUsageCountForEntity6Hrs:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($9375210CE62556719FB562F58417832B)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (void)deleteAppUsageCountForEntity6Hrs
{
  -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setAppUsageCountForEntity6Hrs:](self, "setAppUsageCountForEntity6Hrs:", 0);
  *(_DWORD *)&self->_has &= ~8u;
}

- (void)setAppUsageCountForEntity1Day:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_appUsageCountForEntity1Day = a3;
}

- (BOOL)hasAppUsageCountForEntity1Day
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasAppUsageCountForEntity1Day:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($9375210CE62556719FB562F58417832B)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (void)deleteAppUsageCountForEntity1Day
{
  -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setAppUsageCountForEntity1Day:](self, "setAppUsageCountForEntity1Day:", 0);
  *(_DWORD *)&self->_has &= ~0x10u;
}

- (void)setAppUsageCountForEntity7Days:(int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_appUsageCountForEntity7Days = a3;
}

- (BOOL)hasAppUsageCountForEntity7Days
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setHasAppUsageCountForEntity7Days:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($9375210CE62556719FB562F58417832B)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (void)deleteAppUsageCountForEntity7Days
{
  -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setAppUsageCountForEntity7Days:](self, "setAppUsageCountForEntity7Days:", 0);
  *(_DWORD *)&self->_has &= ~0x20u;
}

- (void)setAppUsageCountForEntity14Days:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_appUsageCountForEntity14Days = a3;
}

- (BOOL)hasAppUsageCountForEntity14Days
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setHasAppUsageCountForEntity14Days:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($9375210CE62556719FB562F58417832B)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (void)deleteAppUsageCountForEntity14Days
{
  -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setAppUsageCountForEntity14Days:](self, "setAppUsageCountForEntity14Days:", 0);
  *(_DWORD *)&self->_has &= ~0x40u;
}

- (void)setAppUsageCountForEntity28Days:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_appUsageCountForEntity28Days = a3;
}

- (BOOL)hasAppUsageCountForEntity28Days
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setHasAppUsageCountForEntity28Days:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($9375210CE62556719FB562F58417832B)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (void)deleteAppUsageCountForEntity28Days
{
  -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setAppUsageCountForEntity28Days:](self, "setAppUsageCountForEntity28Days:", 0);
  *(_DWORD *)&self->_has &= ~0x80u;
}

- (void)setAppUsageCountForEntityInf:(int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_appUsageCountForEntityInf = a3;
}

- (BOOL)hasAppUsageCountForEntityInf
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setHasAppUsageCountForEntityInf:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($9375210CE62556719FB562F58417832B)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (void)deleteAppUsageCountForEntityInf
{
  -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setAppUsageCountForEntityInf:](self, "setAppUsageCountForEntityInf:", 0);
  *(_DWORD *)&self->_has &= ~0x100u;
}

- (void)setRecencyOrderOfAppUsedForEntity:(int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_recencyOrderOfAppUsedForEntity = a3;
}

- (BOOL)hasRecencyOrderOfAppUsedForEntity
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setHasRecencyOrderOfAppUsedForEntity:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($9375210CE62556719FB562F58417832B)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (void)deleteRecencyOrderOfAppUsedForEntity
{
  -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setRecencyOrderOfAppUsedForEntity:](self, "setRecencyOrderOfAppUsedForEntity:", 0);
  *(_DWORD *)&self->_has &= ~0x200u;
}

- (void)setTimeSinceAppUsedForEntityInSec:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_timeSinceAppUsedForEntityInSec = a3;
}

- (BOOL)hasTimeSinceAppUsedForEntityInSec
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setHasTimeSinceAppUsedForEntityInSec:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($9375210CE62556719FB562F58417832B)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (void)deleteTimeSinceAppUsedForEntityInSec
{
  -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setTimeSinceAppUsedForEntityInSec:](self, "setTimeSinceAppUsedForEntityInSec:", 0);
  *(_DWORD *)&self->_has &= ~0x400u;
}

- (void)setAppUsageCountForEntityFromSiri2Min:(int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_appUsageCountForEntityFromSiri2Min = a3;
}

- (BOOL)hasAppUsageCountForEntityFromSiri2Min
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setHasAppUsageCountForEntityFromSiri2Min:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($9375210CE62556719FB562F58417832B)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (void)deleteAppUsageCountForEntityFromSiri2Min
{
  -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setAppUsageCountForEntityFromSiri2Min:](self, "setAppUsageCountForEntityFromSiri2Min:", 0);
  *(_DWORD *)&self->_has &= ~0x800u;
}

- (void)setAppUsageCountForEntityFromSiri10Min:(int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_appUsageCountForEntityFromSiri10Min = a3;
}

- (BOOL)hasAppUsageCountForEntityFromSiri10Min
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setHasAppUsageCountForEntityFromSiri10Min:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($9375210CE62556719FB562F58417832B)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (void)deleteAppUsageCountForEntityFromSiri10Min
{
  -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setAppUsageCountForEntityFromSiri10Min:](self, "setAppUsageCountForEntityFromSiri10Min:", 0);
  *(_DWORD *)&self->_has &= ~0x1000u;
}

- (void)setAppUsageCountForEntityFromSiri1Hr:(int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_appUsageCountForEntityFromSiri1Hr = a3;
}

- (BOOL)hasAppUsageCountForEntityFromSiri1Hr
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setHasAppUsageCountForEntityFromSiri1Hr:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($9375210CE62556719FB562F58417832B)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (void)deleteAppUsageCountForEntityFromSiri1Hr
{
  -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setAppUsageCountForEntityFromSiri1Hr:](self, "setAppUsageCountForEntityFromSiri1Hr:", 0);
  *(_DWORD *)&self->_has &= ~0x2000u;
}

- (void)setAppUsageCountForEntityFromSiri6Hrs:(int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_appUsageCountForEntityFromSiri6Hrs = a3;
}

- (BOOL)hasAppUsageCountForEntityFromSiri6Hrs
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setHasAppUsageCountForEntityFromSiri6Hrs:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($9375210CE62556719FB562F58417832B)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (void)deleteAppUsageCountForEntityFromSiri6Hrs
{
  -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setAppUsageCountForEntityFromSiri6Hrs:](self, "setAppUsageCountForEntityFromSiri6Hrs:", 0);
  *(_DWORD *)&self->_has &= ~0x4000u;
}

- (void)setAppUsageCountForEntityFromSiri1Day:(int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_appUsageCountForEntityFromSiri1Day = a3;
}

- (BOOL)hasAppUsageCountForEntityFromSiri1Day
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setHasAppUsageCountForEntityFromSiri1Day:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($9375210CE62556719FB562F58417832B)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (void)deleteAppUsageCountForEntityFromSiri1Day
{
  -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setAppUsageCountForEntityFromSiri1Day:](self, "setAppUsageCountForEntityFromSiri1Day:", 0);
  *(_DWORD *)&self->_has &= ~0x8000u;
}

- (void)setAppUsageCountForEntityFromSiri7Days:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_appUsageCountForEntityFromSiri7Days = a3;
}

- (BOOL)hasAppUsageCountForEntityFromSiri7Days
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setHasAppUsageCountForEntityFromSiri7Days:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($9375210CE62556719FB562F58417832B)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (void)deleteAppUsageCountForEntityFromSiri7Days
{
  -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setAppUsageCountForEntityFromSiri7Days:](self, "setAppUsageCountForEntityFromSiri7Days:", 0);
  *(_DWORD *)&self->_has &= ~0x10000u;
}

- (void)setAppUsageCountForEntityFromSiri14Days:(int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_appUsageCountForEntityFromSiri14Days = a3;
}

- (BOOL)hasAppUsageCountForEntityFromSiri14Days
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setHasAppUsageCountForEntityFromSiri14Days:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($9375210CE62556719FB562F58417832B)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (void)deleteAppUsageCountForEntityFromSiri14Days
{
  -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setAppUsageCountForEntityFromSiri14Days:](self, "setAppUsageCountForEntityFromSiri14Days:", 0);
  *(_DWORD *)&self->_has &= ~0x20000u;
}

- (void)setAppUsageCountForEntityFromSiri28Days:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_appUsageCountForEntityFromSiri28Days = a3;
}

- (BOOL)hasAppUsageCountForEntityFromSiri28Days
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setHasAppUsageCountForEntityFromSiri28Days:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($9375210CE62556719FB562F58417832B)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (void)deleteAppUsageCountForEntityFromSiri28Days
{
  -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setAppUsageCountForEntityFromSiri28Days:](self, "setAppUsageCountForEntityFromSiri28Days:", 0);
  *(_DWORD *)&self->_has &= ~0x40000u;
}

- (void)setAppUsageCountForEntityFromSiriInf:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_appUsageCountForEntityFromSiriInf = a3;
}

- (BOOL)hasAppUsageCountForEntityFromSiriInf
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setHasAppUsageCountForEntityFromSiriInf:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_has = ($9375210CE62556719FB562F58417832B)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (void)deleteAppUsageCountForEntityFromSiriInf
{
  -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setAppUsageCountForEntityFromSiriInf:](self, "setAppUsageCountForEntityFromSiriInf:", 0);
  *(_DWORD *)&self->_has &= ~0x80000u;
}

- (void)setRecencyOrderOfAppUsageForEntityFromSiri:(int)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_recencyOrderOfAppUsageForEntityFromSiri = a3;
}

- (BOOL)hasRecencyOrderOfAppUsageForEntityFromSiri
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setHasRecencyOrderOfAppUsageForEntityFromSiri:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  self->_has = ($9375210CE62556719FB562F58417832B)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (void)deleteRecencyOrderOfAppUsageForEntityFromSiri
{
  -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setRecencyOrderOfAppUsageForEntityFromSiri:](self, "setRecencyOrderOfAppUsageForEntityFromSiri:", 0);
  *(_DWORD *)&self->_has &= ~0x100000u;
}

- (void)setTimeSinceAppUsedForEntityFromSiriInSec:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_timeSinceAppUsedForEntityFromSiriInSec = a3;
}

- (BOOL)hasTimeSinceAppUsedForEntityFromSiriInSec
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setHasTimeSinceAppUsedForEntityFromSiriInSec:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x200000;
  else
    v3 = 0;
  self->_has = ($9375210CE62556719FB562F58417832B)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (void)deleteTimeSinceAppUsedForEntityFromSiriInSec
{
  -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setTimeSinceAppUsedForEntityFromSiriInSec:](self, "setTimeSinceAppUsedForEntityFromSiriInSec:", 0);
  *(_DWORD *)&self->_has &= ~0x200000u;
}

- (void)setTaskAbandonCountForEntityInUsingApp2Min:(int)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_taskAbandonCountForEntityInUsingApp2Min = a3;
}

- (BOOL)hasTaskAbandonCountForEntityInUsingApp2Min
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setHasTaskAbandonCountForEntityInUsingApp2Min:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x400000;
  else
    v3 = 0;
  self->_has = ($9375210CE62556719FB562F58417832B)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (void)deleteTaskAbandonCountForEntityInUsingApp2Min
{
  -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setTaskAbandonCountForEntityInUsingApp2Min:](self, "setTaskAbandonCountForEntityInUsingApp2Min:", 0);
  *(_DWORD *)&self->_has &= ~0x400000u;
}

- (void)setTaskAbandonCountForEntityInUsingApp10Min:(int)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_taskAbandonCountForEntityInUsingApp10Min = a3;
}

- (BOOL)hasTaskAbandonCountForEntityInUsingApp10Min
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setHasTaskAbandonCountForEntityInUsingApp10Min:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x800000;
  else
    v3 = 0;
  self->_has = ($9375210CE62556719FB562F58417832B)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (void)deleteTaskAbandonCountForEntityInUsingApp10Min
{
  -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setTaskAbandonCountForEntityInUsingApp10Min:](self, "setTaskAbandonCountForEntityInUsingApp10Min:", 0);
  *(_DWORD *)&self->_has &= ~0x800000u;
}

- (void)setTaskAbandonCountForEntityInUsingApp1Hr:(int)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_taskAbandonCountForEntityInUsingApp1Hr = a3;
}

- (BOOL)hasTaskAbandonCountForEntityInUsingApp1Hr
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (void)setHasTaskAbandonCountForEntityInUsingApp1Hr:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x1000000;
  else
    v3 = 0;
  self->_has = ($9375210CE62556719FB562F58417832B)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (void)deleteTaskAbandonCountForEntityInUsingApp1Hr
{
  -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setTaskAbandonCountForEntityInUsingApp1Hr:](self, "setTaskAbandonCountForEntityInUsingApp1Hr:", 0);
  *(_DWORD *)&self->_has &= ~0x1000000u;
}

- (void)setTaskAbandonCountForEntityInUsingApp6Hrs:(int)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_taskAbandonCountForEntityInUsingApp6Hrs = a3;
}

- (BOOL)hasTaskAbandonCountForEntityInUsingApp6Hrs
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setHasTaskAbandonCountForEntityInUsingApp6Hrs:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000000;
  else
    v3 = 0;
  self->_has = ($9375210CE62556719FB562F58417832B)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (void)deleteTaskAbandonCountForEntityInUsingApp6Hrs
{
  -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setTaskAbandonCountForEntityInUsingApp6Hrs:](self, "setTaskAbandonCountForEntityInUsingApp6Hrs:", 0);
  *(_DWORD *)&self->_has &= ~0x2000000u;
}

- (void)setTaskAbandonCountForEntityInUsingApp1Day:(int)a3
{
  *(_DWORD *)&self->_has |= 0x4000000u;
  self->_taskAbandonCountForEntityInUsingApp1Day = a3;
}

- (BOOL)hasTaskAbandonCountForEntityInUsingApp1Day
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setHasTaskAbandonCountForEntityInUsingApp1Day:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000000;
  else
    v3 = 0;
  self->_has = ($9375210CE62556719FB562F58417832B)(*(_DWORD *)&self->_has & 0xFBFFFFFF | v3);
}

- (void)deleteTaskAbandonCountForEntityInUsingApp1Day
{
  -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setTaskAbandonCountForEntityInUsingApp1Day:](self, "setTaskAbandonCountForEntityInUsingApp1Day:", 0);
  *(_DWORD *)&self->_has &= ~0x4000000u;
}

- (void)setTaskAbandonCountForEntityInUsingApp7Days:(int)a3
{
  *(_DWORD *)&self->_has |= 0x8000000u;
  self->_taskAbandonCountForEntityInUsingApp7Days = a3;
}

- (BOOL)hasTaskAbandonCountForEntityInUsingApp7Days
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setHasTaskAbandonCountForEntityInUsingApp7Days:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000000;
  else
    v3 = 0;
  self->_has = ($9375210CE62556719FB562F58417832B)(*(_DWORD *)&self->_has & 0xF7FFFFFF | v3);
}

- (void)deleteTaskAbandonCountForEntityInUsingApp7Days
{
  -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setTaskAbandonCountForEntityInUsingApp7Days:](self, "setTaskAbandonCountForEntityInUsingApp7Days:", 0);
  *(_DWORD *)&self->_has &= ~0x8000000u;
}

- (void)setTaskAbandonCountForEntityInUsingApp14Days:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10000000u;
  self->_taskAbandonCountForEntityInUsingApp14Days = a3;
}

- (BOOL)hasTaskAbandonCountForEntityInUsingApp14Days
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setHasTaskAbandonCountForEntityInUsingApp14Days:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000000;
  else
    v3 = 0;
  self->_has = ($9375210CE62556719FB562F58417832B)(*(_DWORD *)&self->_has & 0xEFFFFFFF | v3);
}

- (void)deleteTaskAbandonCountForEntityInUsingApp14Days
{
  -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setTaskAbandonCountForEntityInUsingApp14Days:](self, "setTaskAbandonCountForEntityInUsingApp14Days:", 0);
  *(_DWORD *)&self->_has &= ~0x10000000u;
}

- (void)setTaskAbandonCountForEntityInUsingApp28Days:(int)a3
{
  *(_DWORD *)&self->_has |= 0x20000000u;
  self->_taskAbandonCountForEntityInUsingApp28Days = a3;
}

- (BOOL)hasTaskAbandonCountForEntityInUsingApp28Days
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setHasTaskAbandonCountForEntityInUsingApp28Days:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000000;
  else
    v3 = 0;
  self->_has = ($9375210CE62556719FB562F58417832B)(*(_DWORD *)&self->_has & 0xDFFFFFFF | v3);
}

- (void)deleteTaskAbandonCountForEntityInUsingApp28Days
{
  -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setTaskAbandonCountForEntityInUsingApp28Days:](self, "setTaskAbandonCountForEntityInUsingApp28Days:", 0);
  *(_DWORD *)&self->_has &= ~0x20000000u;
}

- (void)setTaskAbandonCountForEntityInUsingAppInf:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40000000u;
  self->_taskAbandonCountForEntityInUsingAppInf = a3;
}

- (BOOL)hasTaskAbandonCountForEntityInUsingAppInf
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (void)setHasTaskAbandonCountForEntityInUsingAppInf:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000000;
  else
    v3 = 0;
  self->_has = ($9375210CE62556719FB562F58417832B)(*(_DWORD *)&self->_has & 0xBFFFFFFF | v3);
}

- (void)deleteTaskAbandonCountForEntityInUsingAppInf
{
  -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setTaskAbandonCountForEntityInUsingAppInf:](self, "setTaskAbandonCountForEntityInUsingAppInf:", 0);
  *(_DWORD *)&self->_has &= ~0x40000000u;
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignalsReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $9375210CE62556719FB562F58417832B has;
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
  $9375210CE62556719FB562F58417832B has;
  unsigned int v6;
  int appUsageCountForEntity2Min;
  int v8;
  int appUsageCountForEntity10Min;
  int v10;
  int appUsageCountForEntity1Hr;
  int v12;
  int appUsageCountForEntity6Hrs;
  int v14;
  int appUsageCountForEntity1Day;
  int v16;
  int appUsageCountForEntity7Days;
  int v18;
  int appUsageCountForEntity14Days;
  int v20;
  int appUsageCountForEntity28Days;
  int v22;
  int appUsageCountForEntityInf;
  int v24;
  int recencyOrderOfAppUsedForEntity;
  int v26;
  int64_t timeSinceAppUsedForEntityInSec;
  int v28;
  int appUsageCountForEntityFromSiri2Min;
  int v30;
  int appUsageCountForEntityFromSiri10Min;
  int v32;
  int appUsageCountForEntityFromSiri1Hr;
  int v34;
  int appUsageCountForEntityFromSiri6Hrs;
  int v36;
  int appUsageCountForEntityFromSiri1Day;
  int v38;
  int appUsageCountForEntityFromSiri7Days;
  int v40;
  int appUsageCountForEntityFromSiri14Days;
  int v42;
  int appUsageCountForEntityFromSiri28Days;
  int v44;
  int appUsageCountForEntityFromSiriInf;
  int v46;
  int recencyOrderOfAppUsageForEntityFromSiri;
  int v48;
  int64_t timeSinceAppUsedForEntityFromSiriInSec;
  int v50;
  int taskAbandonCountForEntityInUsingApp2Min;
  int v52;
  int taskAbandonCountForEntityInUsingApp10Min;
  int v54;
  int taskAbandonCountForEntityInUsingApp1Hr;
  int v56;
  int taskAbandonCountForEntityInUsingApp6Hrs;
  int v58;
  int taskAbandonCountForEntityInUsingApp1Day;
  int v60;
  int taskAbandonCountForEntityInUsingApp7Days;
  int v62;
  int taskAbandonCountForEntityInUsingApp14Days;
  int v64;
  int taskAbandonCountForEntityInUsingApp28Days;
  int v66;
  int taskAbandonCountForEntityInUsingAppInf;
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
    appUsageCountForEntity2Min = self->_appUsageCountForEntity2Min;
    if (appUsageCountForEntity2Min != objc_msgSend(v4, "appUsageCountForEntity2Min"))
      goto LABEL_126;
    has = self->_has;
    v6 = v4[35];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_126;
  if (v8)
  {
    appUsageCountForEntity10Min = self->_appUsageCountForEntity10Min;
    if (appUsageCountForEntity10Min != objc_msgSend(v4, "appUsageCountForEntity10Min"))
      goto LABEL_126;
    has = self->_has;
    v6 = v4[35];
  }
  v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_126;
  if (v10)
  {
    appUsageCountForEntity1Hr = self->_appUsageCountForEntity1Hr;
    if (appUsageCountForEntity1Hr != objc_msgSend(v4, "appUsageCountForEntity1Hr"))
      goto LABEL_126;
    has = self->_has;
    v6 = v4[35];
  }
  v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1))
    goto LABEL_126;
  if (v12)
  {
    appUsageCountForEntity6Hrs = self->_appUsageCountForEntity6Hrs;
    if (appUsageCountForEntity6Hrs != objc_msgSend(v4, "appUsageCountForEntity6Hrs"))
      goto LABEL_126;
    has = self->_has;
    v6 = v4[35];
  }
  v14 = (*(unsigned int *)&has >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1))
    goto LABEL_126;
  if (v14)
  {
    appUsageCountForEntity1Day = self->_appUsageCountForEntity1Day;
    if (appUsageCountForEntity1Day != objc_msgSend(v4, "appUsageCountForEntity1Day"))
      goto LABEL_126;
    has = self->_has;
    v6 = v4[35];
  }
  v16 = (*(unsigned int *)&has >> 5) & 1;
  if (v16 != ((v6 >> 5) & 1))
    goto LABEL_126;
  if (v16)
  {
    appUsageCountForEntity7Days = self->_appUsageCountForEntity7Days;
    if (appUsageCountForEntity7Days != objc_msgSend(v4, "appUsageCountForEntity7Days"))
      goto LABEL_126;
    has = self->_has;
    v6 = v4[35];
  }
  v18 = (*(unsigned int *)&has >> 6) & 1;
  if (v18 != ((v6 >> 6) & 1))
    goto LABEL_126;
  if (v18)
  {
    appUsageCountForEntity14Days = self->_appUsageCountForEntity14Days;
    if (appUsageCountForEntity14Days != objc_msgSend(v4, "appUsageCountForEntity14Days"))
      goto LABEL_126;
    has = self->_has;
    v6 = v4[35];
  }
  v20 = (*(unsigned int *)&has >> 7) & 1;
  if (v20 != ((v6 >> 7) & 1))
    goto LABEL_126;
  if (v20)
  {
    appUsageCountForEntity28Days = self->_appUsageCountForEntity28Days;
    if (appUsageCountForEntity28Days != objc_msgSend(v4, "appUsageCountForEntity28Days"))
      goto LABEL_126;
    has = self->_has;
    v6 = v4[35];
  }
  v22 = (*(unsigned int *)&has >> 8) & 1;
  if (v22 != ((v6 >> 8) & 1))
    goto LABEL_126;
  if (v22)
  {
    appUsageCountForEntityInf = self->_appUsageCountForEntityInf;
    if (appUsageCountForEntityInf != objc_msgSend(v4, "appUsageCountForEntityInf"))
      goto LABEL_126;
    has = self->_has;
    v6 = v4[35];
  }
  v24 = (*(unsigned int *)&has >> 9) & 1;
  if (v24 != ((v6 >> 9) & 1))
    goto LABEL_126;
  if (v24)
  {
    recencyOrderOfAppUsedForEntity = self->_recencyOrderOfAppUsedForEntity;
    if (recencyOrderOfAppUsedForEntity != objc_msgSend(v4, "recencyOrderOfAppUsedForEntity"))
      goto LABEL_126;
    has = self->_has;
    v6 = v4[35];
  }
  v26 = (*(unsigned int *)&has >> 10) & 1;
  if (v26 != ((v6 >> 10) & 1))
    goto LABEL_126;
  if (v26)
  {
    timeSinceAppUsedForEntityInSec = self->_timeSinceAppUsedForEntityInSec;
    if (timeSinceAppUsedForEntityInSec != objc_msgSend(v4, "timeSinceAppUsedForEntityInSec"))
      goto LABEL_126;
    has = self->_has;
    v6 = v4[35];
  }
  v28 = (*(unsigned int *)&has >> 11) & 1;
  if (v28 != ((v6 >> 11) & 1))
    goto LABEL_126;
  if (v28)
  {
    appUsageCountForEntityFromSiri2Min = self->_appUsageCountForEntityFromSiri2Min;
    if (appUsageCountForEntityFromSiri2Min != objc_msgSend(v4, "appUsageCountForEntityFromSiri2Min"))
      goto LABEL_126;
    has = self->_has;
    v6 = v4[35];
  }
  v30 = (*(unsigned int *)&has >> 12) & 1;
  if (v30 != ((v6 >> 12) & 1))
    goto LABEL_126;
  if (v30)
  {
    appUsageCountForEntityFromSiri10Min = self->_appUsageCountForEntityFromSiri10Min;
    if (appUsageCountForEntityFromSiri10Min != objc_msgSend(v4, "appUsageCountForEntityFromSiri10Min"))
      goto LABEL_126;
    has = self->_has;
    v6 = v4[35];
  }
  v32 = (*(unsigned int *)&has >> 13) & 1;
  if (v32 != ((v6 >> 13) & 1))
    goto LABEL_126;
  if (v32)
  {
    appUsageCountForEntityFromSiri1Hr = self->_appUsageCountForEntityFromSiri1Hr;
    if (appUsageCountForEntityFromSiri1Hr != objc_msgSend(v4, "appUsageCountForEntityFromSiri1Hr"))
      goto LABEL_126;
    has = self->_has;
    v6 = v4[35];
  }
  v34 = (*(unsigned int *)&has >> 14) & 1;
  if (v34 != ((v6 >> 14) & 1))
    goto LABEL_126;
  if (v34)
  {
    appUsageCountForEntityFromSiri6Hrs = self->_appUsageCountForEntityFromSiri6Hrs;
    if (appUsageCountForEntityFromSiri6Hrs != objc_msgSend(v4, "appUsageCountForEntityFromSiri6Hrs"))
      goto LABEL_126;
    has = self->_has;
    v6 = v4[35];
  }
  v36 = (*(unsigned int *)&has >> 15) & 1;
  if (v36 != ((v6 >> 15) & 1))
    goto LABEL_126;
  if (v36)
  {
    appUsageCountForEntityFromSiri1Day = self->_appUsageCountForEntityFromSiri1Day;
    if (appUsageCountForEntityFromSiri1Day != objc_msgSend(v4, "appUsageCountForEntityFromSiri1Day"))
      goto LABEL_126;
    has = self->_has;
    v6 = v4[35];
  }
  v38 = HIWORD(*(unsigned int *)&has) & 1;
  if (v38 != (HIWORD(v6) & 1))
    goto LABEL_126;
  if (v38)
  {
    appUsageCountForEntityFromSiri7Days = self->_appUsageCountForEntityFromSiri7Days;
    if (appUsageCountForEntityFromSiri7Days != objc_msgSend(v4, "appUsageCountForEntityFromSiri7Days"))
      goto LABEL_126;
    has = self->_has;
    v6 = v4[35];
  }
  v40 = (*(unsigned int *)&has >> 17) & 1;
  if (v40 != ((v6 >> 17) & 1))
    goto LABEL_126;
  if (v40)
  {
    appUsageCountForEntityFromSiri14Days = self->_appUsageCountForEntityFromSiri14Days;
    if (appUsageCountForEntityFromSiri14Days != objc_msgSend(v4, "appUsageCountForEntityFromSiri14Days"))
      goto LABEL_126;
    has = self->_has;
    v6 = v4[35];
  }
  v42 = (*(unsigned int *)&has >> 18) & 1;
  if (v42 != ((v6 >> 18) & 1))
    goto LABEL_126;
  if (v42)
  {
    appUsageCountForEntityFromSiri28Days = self->_appUsageCountForEntityFromSiri28Days;
    if (appUsageCountForEntityFromSiri28Days != objc_msgSend(v4, "appUsageCountForEntityFromSiri28Days"))
      goto LABEL_126;
    has = self->_has;
    v6 = v4[35];
  }
  v44 = (*(unsigned int *)&has >> 19) & 1;
  if (v44 != ((v6 >> 19) & 1))
    goto LABEL_126;
  if (v44)
  {
    appUsageCountForEntityFromSiriInf = self->_appUsageCountForEntityFromSiriInf;
    if (appUsageCountForEntityFromSiriInf != objc_msgSend(v4, "appUsageCountForEntityFromSiriInf"))
      goto LABEL_126;
    has = self->_has;
    v6 = v4[35];
  }
  v46 = (*(unsigned int *)&has >> 20) & 1;
  if (v46 != ((v6 >> 20) & 1))
    goto LABEL_126;
  if (v46)
  {
    recencyOrderOfAppUsageForEntityFromSiri = self->_recencyOrderOfAppUsageForEntityFromSiri;
    if (recencyOrderOfAppUsageForEntityFromSiri != objc_msgSend(v4, "recencyOrderOfAppUsageForEntityFromSiri"))goto LABEL_126;
    has = self->_has;
    v6 = v4[35];
  }
  v48 = (*(unsigned int *)&has >> 21) & 1;
  if (v48 != ((v6 >> 21) & 1))
    goto LABEL_126;
  if (v48)
  {
    timeSinceAppUsedForEntityFromSiriInSec = self->_timeSinceAppUsedForEntityFromSiriInSec;
    if (timeSinceAppUsedForEntityFromSiriInSec != objc_msgSend(v4, "timeSinceAppUsedForEntityFromSiriInSec"))
      goto LABEL_126;
    has = self->_has;
    v6 = v4[35];
  }
  v50 = (*(unsigned int *)&has >> 22) & 1;
  if (v50 != ((v6 >> 22) & 1))
    goto LABEL_126;
  if (v50)
  {
    taskAbandonCountForEntityInUsingApp2Min = self->_taskAbandonCountForEntityInUsingApp2Min;
    if (taskAbandonCountForEntityInUsingApp2Min != objc_msgSend(v4, "taskAbandonCountForEntityInUsingApp2Min"))goto LABEL_126;
    has = self->_has;
    v6 = v4[35];
  }
  v52 = (*(unsigned int *)&has >> 23) & 1;
  if (v52 != ((v6 >> 23) & 1))
    goto LABEL_126;
  if (v52)
  {
    taskAbandonCountForEntityInUsingApp10Min = self->_taskAbandonCountForEntityInUsingApp10Min;
    if (taskAbandonCountForEntityInUsingApp10Min != objc_msgSend(v4, "taskAbandonCountForEntityInUsingApp10Min"))goto LABEL_126;
    has = self->_has;
    v6 = v4[35];
  }
  v54 = HIBYTE(*(unsigned int *)&has) & 1;
  if (v54 != (HIBYTE(v6) & 1))
    goto LABEL_126;
  if (v54)
  {
    taskAbandonCountForEntityInUsingApp1Hr = self->_taskAbandonCountForEntityInUsingApp1Hr;
    if (taskAbandonCountForEntityInUsingApp1Hr != objc_msgSend(v4, "taskAbandonCountForEntityInUsingApp1Hr"))goto LABEL_126;
    has = self->_has;
    v6 = v4[35];
  }
  v56 = (*(unsigned int *)&has >> 25) & 1;
  if (v56 != ((v6 >> 25) & 1))
    goto LABEL_126;
  if (v56)
  {
    taskAbandonCountForEntityInUsingApp6Hrs = self->_taskAbandonCountForEntityInUsingApp6Hrs;
    if (taskAbandonCountForEntityInUsingApp6Hrs != objc_msgSend(v4, "taskAbandonCountForEntityInUsingApp6Hrs"))goto LABEL_126;
    has = self->_has;
    v6 = v4[35];
  }
  v58 = (*(unsigned int *)&has >> 26) & 1;
  if (v58 != ((v6 >> 26) & 1))
    goto LABEL_126;
  if (v58)
  {
    taskAbandonCountForEntityInUsingApp1Day = self->_taskAbandonCountForEntityInUsingApp1Day;
    if (taskAbandonCountForEntityInUsingApp1Day != objc_msgSend(v4, "taskAbandonCountForEntityInUsingApp1Day"))goto LABEL_126;
    has = self->_has;
    v6 = v4[35];
  }
  v60 = (*(unsigned int *)&has >> 27) & 1;
  if (v60 != ((v6 >> 27) & 1))
    goto LABEL_126;
  if (v60)
  {
    taskAbandonCountForEntityInUsingApp7Days = self->_taskAbandonCountForEntityInUsingApp7Days;
    if (taskAbandonCountForEntityInUsingApp7Days != objc_msgSend(v4, "taskAbandonCountForEntityInUsingApp7Days"))goto LABEL_126;
    has = self->_has;
    v6 = v4[35];
  }
  v62 = (*(unsigned int *)&has >> 28) & 1;
  if (v62 != ((v6 >> 28) & 1))
    goto LABEL_126;
  if (v62)
  {
    taskAbandonCountForEntityInUsingApp14Days = self->_taskAbandonCountForEntityInUsingApp14Days;
    if (taskAbandonCountForEntityInUsingApp14Days != objc_msgSend(v4, "taskAbandonCountForEntityInUsingApp14Days"))goto LABEL_126;
    has = self->_has;
    v6 = v4[35];
  }
  v64 = (*(unsigned int *)&has >> 29) & 1;
  if (v64 != ((v6 >> 29) & 1))
    goto LABEL_126;
  if (v64)
  {
    taskAbandonCountForEntityInUsingApp28Days = self->_taskAbandonCountForEntityInUsingApp28Days;
    if (taskAbandonCountForEntityInUsingApp28Days == objc_msgSend(v4, "taskAbandonCountForEntityInUsingApp28Days"))
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
    taskAbandonCountForEntityInUsingAppInf = self->_taskAbandonCountForEntityInUsingAppInf;
    if (taskAbandonCountForEntityInUsingAppInf != objc_msgSend(v4, "taskAbandonCountForEntityInUsingAppInf"))goto LABEL_126;
  }
  v68 = 1;
LABEL_127:

  return v68;
}

- (unint64_t)hash
{
  $9375210CE62556719FB562F58417832B has;
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
    v34 = 2654435761 * self->_appUsageCountForEntity2Min;
    if ((*(_BYTE *)&has & 2) != 0)
    {
LABEL_3:
      v33 = 2654435761 * self->_appUsageCountForEntity10Min;
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
    v32 = 2654435761 * self->_appUsageCountForEntity1Hr;
    if ((*(_BYTE *)&has & 8) != 0)
      goto LABEL_5;
    goto LABEL_36;
  }
LABEL_35:
  v32 = 0;
  if ((*(_BYTE *)&has & 8) != 0)
  {
LABEL_5:
    v31 = 2654435761 * self->_appUsageCountForEntity6Hrs;
    if ((*(_BYTE *)&has & 0x10) != 0)
      goto LABEL_6;
    goto LABEL_37;
  }
LABEL_36:
  v31 = 0;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
LABEL_6:
    v30 = 2654435761 * self->_appUsageCountForEntity1Day;
    if ((*(_BYTE *)&has & 0x20) != 0)
      goto LABEL_7;
    goto LABEL_38;
  }
LABEL_37:
  v30 = 0;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
LABEL_7:
    v3 = 2654435761 * self->_appUsageCountForEntity7Days;
    if ((*(_BYTE *)&has & 0x40) != 0)
      goto LABEL_8;
    goto LABEL_39;
  }
LABEL_38:
  v3 = 0;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
LABEL_8:
    v4 = 2654435761 * self->_appUsageCountForEntity14Days;
    if ((*(_BYTE *)&has & 0x80) != 0)
      goto LABEL_9;
    goto LABEL_40;
  }
LABEL_39:
  v4 = 0;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
LABEL_9:
    v5 = 2654435761 * self->_appUsageCountForEntity28Days;
    if ((*(_WORD *)&has & 0x100) != 0)
      goto LABEL_10;
    goto LABEL_41;
  }
LABEL_40:
  v5 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_10:
    v6 = 2654435761 * self->_appUsageCountForEntityInf;
    if ((*(_WORD *)&has & 0x200) != 0)
      goto LABEL_11;
    goto LABEL_42;
  }
LABEL_41:
  v6 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_11:
    v7 = 2654435761 * self->_recencyOrderOfAppUsedForEntity;
    if ((*(_WORD *)&has & 0x400) != 0)
      goto LABEL_12;
    goto LABEL_43;
  }
LABEL_42:
  v7 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_12:
    v8 = 2654435761 * self->_timeSinceAppUsedForEntityInSec;
    if ((*(_WORD *)&has & 0x800) != 0)
      goto LABEL_13;
    goto LABEL_44;
  }
LABEL_43:
  v8 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_13:
    v9 = 2654435761 * self->_appUsageCountForEntityFromSiri2Min;
    if ((*(_WORD *)&has & 0x1000) != 0)
      goto LABEL_14;
    goto LABEL_45;
  }
LABEL_44:
  v9 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_14:
    v10 = 2654435761 * self->_appUsageCountForEntityFromSiri10Min;
    if ((*(_WORD *)&has & 0x2000) != 0)
      goto LABEL_15;
    goto LABEL_46;
  }
LABEL_45:
  v10 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_15:
    v11 = 2654435761 * self->_appUsageCountForEntityFromSiri1Hr;
    if ((*(_WORD *)&has & 0x4000) != 0)
      goto LABEL_16;
    goto LABEL_47;
  }
LABEL_46:
  v11 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_16:
    v12 = 2654435761 * self->_appUsageCountForEntityFromSiri6Hrs;
    if ((*(_WORD *)&has & 0x8000) != 0)
      goto LABEL_17;
    goto LABEL_48;
  }
LABEL_47:
  v12 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_17:
    v13 = 2654435761 * self->_appUsageCountForEntityFromSiri1Day;
    if ((*(_DWORD *)&has & 0x10000) != 0)
      goto LABEL_18;
    goto LABEL_49;
  }
LABEL_48:
  v13 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_18:
    v14 = 2654435761 * self->_appUsageCountForEntityFromSiri7Days;
    if ((*(_DWORD *)&has & 0x20000) != 0)
      goto LABEL_19;
    goto LABEL_50;
  }
LABEL_49:
  v14 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_19:
    v15 = 2654435761 * self->_appUsageCountForEntityFromSiri14Days;
    if ((*(_DWORD *)&has & 0x40000) != 0)
      goto LABEL_20;
    goto LABEL_51;
  }
LABEL_50:
  v15 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_20:
    v16 = 2654435761 * self->_appUsageCountForEntityFromSiri28Days;
    if ((*(_DWORD *)&has & 0x80000) != 0)
      goto LABEL_21;
    goto LABEL_52;
  }
LABEL_51:
  v16 = 0;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
LABEL_21:
    v17 = 2654435761 * self->_appUsageCountForEntityFromSiriInf;
    if ((*(_DWORD *)&has & 0x100000) != 0)
      goto LABEL_22;
    goto LABEL_53;
  }
LABEL_52:
  v17 = 0;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_22:
    v18 = 2654435761 * self->_recencyOrderOfAppUsageForEntityFromSiri;
    if ((*(_DWORD *)&has & 0x200000) != 0)
      goto LABEL_23;
    goto LABEL_54;
  }
LABEL_53:
  v18 = 0;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_23:
    v19 = 2654435761 * self->_timeSinceAppUsedForEntityFromSiriInSec;
    if ((*(_DWORD *)&has & 0x400000) != 0)
      goto LABEL_24;
    goto LABEL_55;
  }
LABEL_54:
  v19 = 0;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_24:
    v20 = 2654435761 * self->_taskAbandonCountForEntityInUsingApp2Min;
    if ((*(_DWORD *)&has & 0x800000) != 0)
      goto LABEL_25;
    goto LABEL_56;
  }
LABEL_55:
  v20 = 0;
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
LABEL_25:
    v21 = 2654435761 * self->_taskAbandonCountForEntityInUsingApp10Min;
    if ((*(_DWORD *)&has & 0x1000000) != 0)
      goto LABEL_26;
    goto LABEL_57;
  }
LABEL_56:
  v21 = 0;
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
LABEL_26:
    v22 = 2654435761 * self->_taskAbandonCountForEntityInUsingApp1Hr;
    if ((*(_DWORD *)&has & 0x2000000) != 0)
      goto LABEL_27;
    goto LABEL_58;
  }
LABEL_57:
  v22 = 0;
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
LABEL_27:
    v23 = 2654435761 * self->_taskAbandonCountForEntityInUsingApp6Hrs;
    if ((*(_DWORD *)&has & 0x4000000) != 0)
      goto LABEL_28;
    goto LABEL_59;
  }
LABEL_58:
  v23 = 0;
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
LABEL_28:
    v24 = 2654435761 * self->_taskAbandonCountForEntityInUsingApp1Day;
    if ((*(_DWORD *)&has & 0x8000000) != 0)
      goto LABEL_29;
    goto LABEL_60;
  }
LABEL_59:
  v24 = 0;
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
LABEL_29:
    v25 = 2654435761 * self->_taskAbandonCountForEntityInUsingApp7Days;
    if ((*(_DWORD *)&has & 0x10000000) != 0)
      goto LABEL_30;
    goto LABEL_61;
  }
LABEL_60:
  v25 = 0;
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
LABEL_30:
    v26 = 2654435761 * self->_taskAbandonCountForEntityInUsingApp14Days;
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
  v27 = 2654435761 * self->_taskAbandonCountForEntityInUsingApp28Days;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
    goto LABEL_63;
LABEL_32:
  v28 = 2654435761 * self->_taskAbandonCountForEntityInUsingAppInf;
  return v33 ^ v34 ^ v32 ^ v31 ^ v30 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28;
}

- (id)dictionaryRepresentation
{
  void *v3;
  $9375210CE62556719FB562F58417832B has;
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
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals appUsageCountForEntity10Min](self, "appUsageCountForEntity10Min"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("appUsageCountForEntity10Min"));

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
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals appUsageCountForEntity14Days](self, "appUsageCountForEntity14Days"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("appUsageCountForEntity14Days"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_5;
    goto LABEL_37;
  }
LABEL_36:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals appUsageCountForEntity1Day](self, "appUsageCountForEntity1Day"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("appUsageCountForEntity1Day"));

  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_38;
  }
LABEL_37:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals appUsageCountForEntity1Hr](self, "appUsageCountForEntity1Hr"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("appUsageCountForEntity1Hr"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_7;
    goto LABEL_39;
  }
LABEL_38:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals appUsageCountForEntity28Days](self, "appUsageCountForEntity28Days"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("appUsageCountForEntity28Days"));

  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_8;
    goto LABEL_40;
  }
LABEL_39:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals appUsageCountForEntity2Min](self, "appUsageCountForEntity2Min"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("appUsageCountForEntity2Min"));

  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_41;
  }
LABEL_40:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals appUsageCountForEntity6Hrs](self, "appUsageCountForEntity6Hrs"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("appUsageCountForEntity6Hrs"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_10;
    goto LABEL_42;
  }
LABEL_41:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals appUsageCountForEntity7Days](self, "appUsageCountForEntity7Days"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("appUsageCountForEntity7Days"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_11;
    goto LABEL_43;
  }
LABEL_42:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals appUsageCountForEntityFromSiri10Min](self, "appUsageCountForEntityFromSiri10Min"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("appUsageCountForEntityFromSiri10Min"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_12;
    goto LABEL_44;
  }
LABEL_43:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals appUsageCountForEntityFromSiri14Days](self, "appUsageCountForEntityFromSiri14Days"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("appUsageCountForEntityFromSiri14Days"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_13;
    goto LABEL_45;
  }
LABEL_44:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals appUsageCountForEntityFromSiri1Day](self, "appUsageCountForEntityFromSiri1Day"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("appUsageCountForEntityFromSiri1Day"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_14;
    goto LABEL_46;
  }
LABEL_45:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals appUsageCountForEntityFromSiri1Hr](self, "appUsageCountForEntityFromSiri1Hr"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("appUsageCountForEntityFromSiri1Hr"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_15;
    goto LABEL_47;
  }
LABEL_46:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals appUsageCountForEntityFromSiri28Days](self, "appUsageCountForEntityFromSiri28Days"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("appUsageCountForEntityFromSiri28Days"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_16;
    goto LABEL_48;
  }
LABEL_47:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals appUsageCountForEntityFromSiri2Min](self, "appUsageCountForEntityFromSiri2Min"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("appUsageCountForEntityFromSiri2Min"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_17;
    goto LABEL_49;
  }
LABEL_48:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals appUsageCountForEntityFromSiri6Hrs](self, "appUsageCountForEntityFromSiri6Hrs"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("appUsageCountForEntityFromSiri6Hrs"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_18;
    goto LABEL_50;
  }
LABEL_49:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals appUsageCountForEntityFromSiri7Days](self, "appUsageCountForEntityFromSiri7Days"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("appUsageCountForEntityFromSiri7Days"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_19;
    goto LABEL_51;
  }
LABEL_50:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals appUsageCountForEntityFromSiriInf](self, "appUsageCountForEntityFromSiriInf"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("appUsageCountForEntityFromSiriInf"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_20;
    goto LABEL_52;
  }
LABEL_51:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals appUsageCountForEntityInf](self, "appUsageCountForEntityInf"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("appUsageCountForEntityInf"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_21;
    goto LABEL_53;
  }
LABEL_52:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals recencyOrderOfAppUsageForEntityFromSiri](self, "recencyOrderOfAppUsageForEntityFromSiri"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("recencyOrderOfAppUsageForEntityFromSiri"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_22;
    goto LABEL_54;
  }
LABEL_53:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals recencyOrderOfAppUsedForEntity](self, "recencyOrderOfAppUsedForEntity"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("recencyOrderOfAppUsedForEntity"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_23;
    goto LABEL_55;
  }
LABEL_54:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals taskAbandonCountForEntityInUsingApp10Min](self, "taskAbandonCountForEntityInUsingApp10Min"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("taskAbandonCountForEntityInUsingApp10Min"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_24;
    goto LABEL_56;
  }
LABEL_55:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals taskAbandonCountForEntityInUsingApp14Days](self, "taskAbandonCountForEntityInUsingApp14Days"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("taskAbandonCountForEntityInUsingApp14Days"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_25;
    goto LABEL_57;
  }
LABEL_56:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals taskAbandonCountForEntityInUsingApp1Day](self, "taskAbandonCountForEntityInUsingApp1Day"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("taskAbandonCountForEntityInUsingApp1Day"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_26;
    goto LABEL_58;
  }
LABEL_57:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals taskAbandonCountForEntityInUsingApp1Hr](self, "taskAbandonCountForEntityInUsingApp1Hr"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("taskAbandonCountForEntityInUsingApp1Hr"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_27;
    goto LABEL_59;
  }
LABEL_58:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals taskAbandonCountForEntityInUsingApp28Days](self, "taskAbandonCountForEntityInUsingApp28Days"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("taskAbandonCountForEntityInUsingApp28Days"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_28;
    goto LABEL_60;
  }
LABEL_59:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals taskAbandonCountForEntityInUsingApp2Min](self, "taskAbandonCountForEntityInUsingApp2Min"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("taskAbandonCountForEntityInUsingApp2Min"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_29;
    goto LABEL_61;
  }
LABEL_60:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals taskAbandonCountForEntityInUsingApp6Hrs](self, "taskAbandonCountForEntityInUsingApp6Hrs"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("taskAbandonCountForEntityInUsingApp6Hrs"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x40000000) == 0)
      goto LABEL_30;
    goto LABEL_62;
  }
LABEL_61:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals taskAbandonCountForEntityInUsingApp7Days](self, "taskAbandonCountForEntityInUsingApp7Days"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("taskAbandonCountForEntityInUsingApp7Days"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_31;
LABEL_63:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals timeSinceAppUsedForEntityFromSiriInSec](self, "timeSinceAppUsedForEntityFromSiriInSec"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("timeSinceAppUsedForEntityFromSiriInSec"));

    if ((*(_DWORD *)&self->_has & 0x400) == 0)
      goto LABEL_33;
    goto LABEL_32;
  }
LABEL_62:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals taskAbandonCountForEntityInUsingAppInf](self, "taskAbandonCountForEntityInUsingAppInf"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("taskAbandonCountForEntityInUsingAppInf"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) != 0)
    goto LABEL_63;
LABEL_31:
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_32:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals timeSinceAppUsedForEntityInSec](self, "timeSinceAppUsedForEntityInSec"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("timeSinceAppUsedForEntityInSec"));

  }
LABEL_33:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals)initWithJSON:(id)a3
{
  void *v4;
  INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals *v5;
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
    self = -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals)initWithDictionary:(id)a3
{
  id v4;
  INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals *v5;
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
  INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals *v42;
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
  v68.super_class = (Class)INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals;
  v5 = -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals init](&v68, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appUsageCountForEntity2Min"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setAppUsageCountForEntity2Min:](v5, "setAppUsageCountForEntity2Min:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appUsageCountForEntity10Min"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setAppUsageCountForEntity10Min:](v5, "setAppUsageCountForEntity10Min:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appUsageCountForEntity1Hr"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setAppUsageCountForEntity1Hr:](v5, "setAppUsageCountForEntity1Hr:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appUsageCountForEntity6Hrs"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setAppUsageCountForEntity6Hrs:](v5, "setAppUsageCountForEntity6Hrs:", objc_msgSend(v9, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appUsageCountForEntity1Day"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setAppUsageCountForEntity1Day:](v5, "setAppUsageCountForEntity1Day:", objc_msgSend(v10, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appUsageCountForEntity7Days"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setAppUsageCountForEntity7Days:](v5, "setAppUsageCountForEntity7Days:", objc_msgSend(v11, "intValue"));
    v57 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appUsageCountForEntity14Days"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setAppUsageCountForEntity14Days:](v5, "setAppUsageCountForEntity14Days:", objc_msgSend(v12, "intValue"));
    v51 = v12;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appUsageCountForEntity28Days"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v67 = v13;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setAppUsageCountForEntity28Days:](v5, "setAppUsageCountForEntity28Days:", objc_msgSend(v13, "intValue"));
    v14 = v10;
    v56 = v7;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appUsageCountForEntityInf"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setAppUsageCountForEntityInf:](v5, "setAppUsageCountForEntityInf:", objc_msgSend(v15, "intValue"));
    v16 = v9;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recencyOrderOfAppUsedForEntity"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v66 = v17;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setRecencyOrderOfAppUsedForEntity:](v5, "setRecencyOrderOfAppUsedForEntity:", objc_msgSend(v17, "intValue"));
    v18 = v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeSinceAppUsedForEntityInSec"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setTimeSinceAppUsedForEntityInSec:](v5, "setTimeSinceAppUsedForEntityInSec:", objc_msgSend(v19, "longLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appUsageCountForEntityFromSiri2Min"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v65 = v20;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setAppUsageCountForEntityFromSiri2Min:](v5, "setAppUsageCountForEntityFromSiri2Min:", objc_msgSend(v20, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appUsageCountForEntityFromSiri10Min"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setAppUsageCountForEntityFromSiri10Min:](v5, "setAppUsageCountForEntityFromSiri10Min:", objc_msgSend(v21, "intValue"));
    v48 = v21;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appUsageCountForEntityFromSiri1Hr"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v64 = v22;
    v55 = v18;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setAppUsageCountForEntityFromSiri1Hr:](v5, "setAppUsageCountForEntityFromSiri1Hr:", objc_msgSend(v22, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appUsageCountForEntityFromSiri6Hrs"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v63 = v23;
    v54 = v16;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setAppUsageCountForEntityFromSiri6Hrs:](v5, "setAppUsageCountForEntityFromSiri6Hrs:", objc_msgSend(v23, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appUsageCountForEntityFromSiri1Day"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v62 = v24;
    v53 = v14;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setAppUsageCountForEntityFromSiri1Day:](v5, "setAppUsageCountForEntityFromSiri1Day:", objc_msgSend(v24, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appUsageCountForEntityFromSiri7Days"));
    v25 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v61 = (void *)v25;
    v26 = v11;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setAppUsageCountForEntityFromSiri7Days:](v5, "setAppUsageCountForEntityFromSiri7Days:", objc_msgSend(v61, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appUsageCountForEntityFromSiri14Days"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setAppUsageCountForEntityFromSiri14Days:](v5, "setAppUsageCountForEntityFromSiri14Days:", objc_msgSend(v27, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appUsageCountForEntityFromSiri28Days"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v60 = v28;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setAppUsageCountForEntityFromSiri28Days:](v5, "setAppUsageCountForEntityFromSiri28Days:", objc_msgSend(v28, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appUsageCountForEntityFromSiriInf"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setAppUsageCountForEntityFromSiriInf:](v5, "setAppUsageCountForEntityFromSiriInf:", objc_msgSend(v29, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recencyOrderOfAppUsageForEntityFromSiri"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v59 = v30;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setRecencyOrderOfAppUsageForEntityFromSiri:](v5, "setRecencyOrderOfAppUsageForEntityFromSiri:", objc_msgSend(v30, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeSinceAppUsedForEntityFromSiriInSec"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setTimeSinceAppUsedForEntityFromSiriInSec:](v5, "setTimeSinceAppUsedForEntityFromSiriInSec:", objc_msgSend(v31, "longLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("taskAbandonCountForEntityInUsingApp2Min"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v58 = v32;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setTaskAbandonCountForEntityInUsingApp2Min:](v5, "setTaskAbandonCountForEntityInUsingApp2Min:", objc_msgSend(v32, "intValue"));
    v50 = v15;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("taskAbandonCountForEntityInUsingApp10Min"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setTaskAbandonCountForEntityInUsingApp10Min:](v5, "setTaskAbandonCountForEntityInUsingApp10Min:", objc_msgSend(v33, "intValue"));
    v49 = v19;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("taskAbandonCountForEntityInUsingApp1Hr"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setTaskAbandonCountForEntityInUsingApp1Hr:](v5, "setTaskAbandonCountForEntityInUsingApp1Hr:", objc_msgSend(v34, "intValue"));
    v44 = v34;
    v47 = v29;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("taskAbandonCountForEntityInUsingApp6Hrs"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setTaskAbandonCountForEntityInUsingApp6Hrs:](v5, "setTaskAbandonCountForEntityInUsingApp6Hrs:", objc_msgSend(v35, "intValue"));
    v46 = v31;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("taskAbandonCountForEntityInUsingApp1Day"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setTaskAbandonCountForEntityInUsingApp1Day:](v5, "setTaskAbandonCountForEntityInUsingApp1Day:", objc_msgSend(v36, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("taskAbandonCountForEntityInUsingApp7Days"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setTaskAbandonCountForEntityInUsingApp7Days:](v5, "setTaskAbandonCountForEntityInUsingApp7Days:", objc_msgSend(v37, "intValue"));
    v45 = v33;
    v52 = v26;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("taskAbandonCountForEntityInUsingApp14Days"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setTaskAbandonCountForEntityInUsingApp14Days:](v5, "setTaskAbandonCountForEntityInUsingApp14Days:", objc_msgSend(v38, "intValue"));
    v39 = v27;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("taskAbandonCountForEntityInUsingApp28Days"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setTaskAbandonCountForEntityInUsingApp28Days:](v5, "setTaskAbandonCountForEntityInUsingApp28Days:", objc_msgSend(v40, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("taskAbandonCountForEntityInUsingAppInf"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setTaskAbandonCountForEntityInUsingAppInf:](v5, "setTaskAbandonCountForEntityInUsingAppInf:", objc_msgSend(v41, "intValue"));
    v42 = v5;

  }
  return v5;
}

- (int)appUsageCountForEntity2Min
{
  return self->_appUsageCountForEntity2Min;
}

- (int)appUsageCountForEntity10Min
{
  return self->_appUsageCountForEntity10Min;
}

- (int)appUsageCountForEntity1Hr
{
  return self->_appUsageCountForEntity1Hr;
}

- (int)appUsageCountForEntity6Hrs
{
  return self->_appUsageCountForEntity6Hrs;
}

- (int)appUsageCountForEntity1Day
{
  return self->_appUsageCountForEntity1Day;
}

- (int)appUsageCountForEntity7Days
{
  return self->_appUsageCountForEntity7Days;
}

- (int)appUsageCountForEntity14Days
{
  return self->_appUsageCountForEntity14Days;
}

- (int)appUsageCountForEntity28Days
{
  return self->_appUsageCountForEntity28Days;
}

- (int)appUsageCountForEntityInf
{
  return self->_appUsageCountForEntityInf;
}

- (int)recencyOrderOfAppUsedForEntity
{
  return self->_recencyOrderOfAppUsedForEntity;
}

- (int64_t)timeSinceAppUsedForEntityInSec
{
  return self->_timeSinceAppUsedForEntityInSec;
}

- (int)appUsageCountForEntityFromSiri2Min
{
  return self->_appUsageCountForEntityFromSiri2Min;
}

- (int)appUsageCountForEntityFromSiri10Min
{
  return self->_appUsageCountForEntityFromSiri10Min;
}

- (int)appUsageCountForEntityFromSiri1Hr
{
  return self->_appUsageCountForEntityFromSiri1Hr;
}

- (int)appUsageCountForEntityFromSiri6Hrs
{
  return self->_appUsageCountForEntityFromSiri6Hrs;
}

- (int)appUsageCountForEntityFromSiri1Day
{
  return self->_appUsageCountForEntityFromSiri1Day;
}

- (int)appUsageCountForEntityFromSiri7Days
{
  return self->_appUsageCountForEntityFromSiri7Days;
}

- (int)appUsageCountForEntityFromSiri14Days
{
  return self->_appUsageCountForEntityFromSiri14Days;
}

- (int)appUsageCountForEntityFromSiri28Days
{
  return self->_appUsageCountForEntityFromSiri28Days;
}

- (int)appUsageCountForEntityFromSiriInf
{
  return self->_appUsageCountForEntityFromSiriInf;
}

- (int)recencyOrderOfAppUsageForEntityFromSiri
{
  return self->_recencyOrderOfAppUsageForEntityFromSiri;
}

- (int64_t)timeSinceAppUsedForEntityFromSiriInSec
{
  return self->_timeSinceAppUsedForEntityFromSiriInSec;
}

- (int)taskAbandonCountForEntityInUsingApp2Min
{
  return self->_taskAbandonCountForEntityInUsingApp2Min;
}

- (int)taskAbandonCountForEntityInUsingApp10Min
{
  return self->_taskAbandonCountForEntityInUsingApp10Min;
}

- (int)taskAbandonCountForEntityInUsingApp1Hr
{
  return self->_taskAbandonCountForEntityInUsingApp1Hr;
}

- (int)taskAbandonCountForEntityInUsingApp6Hrs
{
  return self->_taskAbandonCountForEntityInUsingApp6Hrs;
}

- (int)taskAbandonCountForEntityInUsingApp1Day
{
  return self->_taskAbandonCountForEntityInUsingApp1Day;
}

- (int)taskAbandonCountForEntityInUsingApp7Days
{
  return self->_taskAbandonCountForEntityInUsingApp7Days;
}

- (int)taskAbandonCountForEntityInUsingApp14Days
{
  return self->_taskAbandonCountForEntityInUsingApp14Days;
}

- (int)taskAbandonCountForEntityInUsingApp28Days
{
  return self->_taskAbandonCountForEntityInUsingApp28Days;
}

- (int)taskAbandonCountForEntityInUsingAppInf
{
  return self->_taskAbandonCountForEntityInUsingAppInf;
}

@end
