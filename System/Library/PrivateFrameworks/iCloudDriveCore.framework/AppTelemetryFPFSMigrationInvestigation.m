@implementation AppTelemetryFPFSMigrationInvestigation

- (void)setIsSuccessful:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x40000000uLL;
  self->_isSuccessful = a3;
}

- (void)setHasIsSuccessful:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000;
  if (!a3)
    v3 = 0;
  self->_has = ($03CFB5B8B6ED84BF2F9A3941B0FD4455)(*(_QWORD *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3);
}

- (BOOL)hasIsSuccessful
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (void)setItemsNotMigratedCount:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x400uLL;
  self->_itemsNotMigratedCount = a3;
}

- (void)setHasItemsNotMigratedCount:(BOOL)a3
{
  uint64_t v3;

  v3 = 1024;
  if (!a3)
    v3 = 0;
  self->_has = ($03CFB5B8B6ED84BF2F9A3941B0FD4455)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (BOOL)hasItemsNotMigratedCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setTotalItemCount:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x200000uLL;
  self->_totalItemCount = a3;
}

- (void)setHasTotalItemCount:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000;
  if (!a3)
    v3 = 0;
  self->_has = ($03CFB5B8B6ED84BF2F9A3941B0FD4455)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3);
}

- (BOOL)hasTotalItemCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setAccountQuotaUsage:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 1uLL;
  self->_accountQuotaUsage = a3;
}

- (void)setHasAccountQuotaUsage:(BOOL)a3
{
  self->_has = ($03CFB5B8B6ED84BF2F9A3941B0FD4455)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3);
}

- (BOOL)hasAccountQuotaUsage
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setIsAccountDataSeparated:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x10000000uLL;
  self->_isAccountDataSeparated = a3;
}

- (void)setHasIsAccountDataSeparated:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000;
  if (!a3)
    v3 = 0;
  self->_has = ($03CFB5B8B6ED84BF2F9A3941B0FD4455)(*(_QWORD *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3);
}

- (BOOL)hasIsAccountDataSeparated
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setImportTime:(double)a3
{
  *(_QWORD *)&self->_has |= 0x80uLL;
  self->_importTime = a3;
}

- (void)setHasImportTime:(BOOL)a3
{
  uint64_t v3;

  v3 = 128;
  if (!a3)
    v3 = 0;
  self->_has = ($03CFB5B8B6ED84BF2F9A3941B0FD4455)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasImportTime
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setTypesOfMigratedItemsMask:(int)a3
{
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  self->_typesOfMigratedItemsMask = a3;
}

- (void)setHasTypesOfMigratedItemsMask:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000;
  if (!a3)
    v3 = 0;
  self->_has = ($03CFB5B8B6ED84BF2F9A3941B0FD4455)(*(_QWORD *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3);
}

- (BOOL)hasTypesOfMigratedItemsMask
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setTypesOfNonMigratedItemsMask:(int)a3
{
  *(_QWORD *)&self->_has |= 0x8000000uLL;
  self->_typesOfNonMigratedItemsMask = a3;
}

- (void)setHasTypesOfNonMigratedItemsMask:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000;
  if (!a3)
    v3 = 0;
  self->_has = ($03CFB5B8B6ED84BF2F9A3941B0FD4455)(*(_QWORD *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3);
}

- (BOOL)hasTypesOfNonMigratedItemsMask
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setItemsNotFoundInDB:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x200uLL;
  self->_itemsNotFoundInDB = a3;
}

- (void)setHasItemsNotFoundInDB:(BOOL)a3
{
  uint64_t v3;

  v3 = 512;
  if (!a3)
    v3 = 0;
  self->_has = ($03CFB5B8B6ED84BF2F9A3941B0FD4455)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)hasItemsNotFoundInDB
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setBouncedItemsCount:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 2uLL;
  self->_bouncedItemsCount = a3;
}

- (void)setHasBouncedItemsCount:(BOOL)a3
{
  uint64_t v3;

  v3 = 2;
  if (!a3)
    v3 = 0;
  self->_has = ($03CFB5B8B6ED84BF2F9A3941B0FD4455)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasBouncedItemsCount
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setBouncedItemsMatrix:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 4uLL;
  self->_bouncedItemsMatrix = a3;
}

- (void)setHasBouncedItemsMatrix:(BOOL)a3
{
  uint64_t v3;

  v3 = 4;
  if (!a3)
    v3 = 0;
  self->_has = ($03CFB5B8B6ED84BF2F9A3941B0FD4455)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasBouncedItemsMatrix
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasTreatmentId
{
  return self->_treatmentId != 0;
}

- (BOOL)hasExperimentId
{
  return self->_experimentId != 0;
}

- (BOOL)hasRampId
{
  return self->_rampId != 0;
}

- (void)setBusyDateNotMigratedCount:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 8uLL;
  self->_busyDateNotMigratedCount = a3;
}

- (void)setHasBusyDateNotMigratedCount:(BOOL)a3
{
  uint64_t v3;

  v3 = 8;
  if (!a3)
    v3 = 0;
  self->_has = ($03CFB5B8B6ED84BF2F9A3941B0FD4455)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasBusyDateNotMigratedCount
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setChildItemsNotMigratedCount:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x10uLL;
  self->_childItemsNotMigratedCount = a3;
}

- (void)setHasChildItemsNotMigratedCount:(BOOL)a3
{
  uint64_t v3;

  v3 = 16;
  if (!a3)
    v3 = 0;
  self->_has = ($03CFB5B8B6ED84BF2F9A3941B0FD4455)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasChildItemsNotMigratedCount
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setIgnoredFromSyncItemsNotMigratedCount:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x40uLL;
  self->_ignoredFromSyncItemsNotMigratedCount = a3;
}

- (void)setHasIgnoredFromSyncItemsNotMigratedCount:(BOOL)a3
{
  uint64_t v3;

  v3 = 64;
  if (!a3)
    v3 = 0;
  self->_has = ($03CFB5B8B6ED84BF2F9A3941B0FD4455)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasIgnoredFromSyncItemsNotMigratedCount
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setItemsReconciledInFileProvider:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x1000uLL;
  self->_itemsReconciledInFileProvider = a3;
}

- (void)setHasItemsReconciledInFileProvider:(BOOL)a3
{
  uint64_t v3;

  v3 = 4096;
  if (!a3)
    v3 = 0;
  self->_has = ($03CFB5B8B6ED84BF2F9A3941B0FD4455)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)hasItemsReconciledInFileProvider
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setItemsMigratedWithoutAlreadyMayExistFlag:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x100uLL;
  self->_itemsMigratedWithoutAlreadyMayExistFlag = a3;
}

- (void)setHasItemsMigratedWithoutAlreadyMayExistFlag:(BOOL)a3
{
  uint64_t v3;

  v3 = 256;
  if (!a3)
    v3 = 0;
  self->_has = ($03CFB5B8B6ED84BF2F9A3941B0FD4455)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasItemsMigratedWithoutAlreadyMayExistFlag
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setDurationBetweenDbCreationAndMigrationStart:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x20uLL;
  self->_durationBetweenDbCreationAndMigrationStart = a3;
}

- (void)setHasDurationBetweenDbCreationAndMigrationStart:(BOOL)a3
{
  uint64_t v3;

  v3 = 32;
  if (!a3)
    v3 = 0;
  self->_has = ($03CFB5B8B6ED84BF2F9A3941B0FD4455)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasDurationBetweenDbCreationAndMigrationStart
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setIsStreamResetRunning:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x20000000uLL;
  self->_isStreamResetRunning = a3;
}

- (void)setHasIsStreamResetRunning:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000;
  if (!a3)
    v3 = 0;
  self->_has = ($03CFB5B8B6ED84BF2F9A3941B0FD4455)(*(_QWORD *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3);
}

- (BOOL)hasIsStreamResetRunning
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setStateOfDownloadJobs:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x40000uLL;
  self->_stateOfDownloadJobs = a3;
}

- (void)setHasStateOfDownloadJobs:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000;
  if (!a3)
    v3 = 0;
  self->_has = ($03CFB5B8B6ED84BF2F9A3941B0FD4455)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3);
}

- (BOOL)hasStateOfDownloadJobs
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setStateOfUploadJobs:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x100000uLL;
  self->_stateOfUploadJobs = a3;
}

- (void)setHasStateOfUploadJobs:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000;
  if (!a3)
    v3 = 0;
  self->_has = ($03CFB5B8B6ED84BF2F9A3941B0FD4455)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3);
}

- (BOOL)hasStateOfUploadJobs
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setStateOfOtherJobs:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x80000uLL;
  self->_stateOfOtherJobs = a3;
}

- (void)setHasStateOfOtherJobs:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000;
  if (!a3)
    v3 = 0;
  self->_has = ($03CFB5B8B6ED84BF2F9A3941B0FD4455)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3);
}

- (BOOL)hasStateOfOtherJobs
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setNumberOfItemsPendingReconciliation:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x4000uLL;
  self->_numberOfItemsPendingReconciliation = a3;
}

- (void)setHasNumberOfItemsPendingReconciliation:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000;
  if (!a3)
    v3 = 0;
  self->_has = ($03CFB5B8B6ED84BF2F9A3941B0FD4455)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (BOOL)hasNumberOfItemsPendingReconciliation
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setNumberOfItemsPendingSelection:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x20000uLL;
  self->_numberOfItemsPendingSelection = a3;
}

- (void)setHasNumberOfItemsPendingSelection:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000;
  if (!a3)
    v3 = 0;
  self->_has = ($03CFB5B8B6ED84BF2F9A3941B0FD4455)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3);
}

- (BOOL)hasNumberOfItemsPendingSelection
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setNumberOfItemsPendingScanningDisk:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x8000uLL;
  self->_numberOfItemsPendingScanningDisk = a3;
}

- (void)setHasNumberOfItemsPendingScanningDisk:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000;
  if (!a3)
    v3 = 0;
  self->_has = ($03CFB5B8B6ED84BF2F9A3941B0FD4455)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3);
}

- (BOOL)hasNumberOfItemsPendingScanningDisk
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setNumberOfItemsPendingScanningProvider:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x10000uLL;
  self->_numberOfItemsPendingScanningProvider = a3;
}

- (void)setHasNumberOfItemsPendingScanningProvider:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000;
  if (!a3)
    v3 = 0;
  self->_has = ($03CFB5B8B6ED84BF2F9A3941B0FD4455)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3);
}

- (BOOL)hasNumberOfItemsPendingScanningProvider
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setXpcActivityRegisteredWithDuet:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x100000000uLL;
  self->_xpcActivityRegisteredWithDuet = a3;
}

- (void)setHasXpcActivityRegisteredWithDuet:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (!a3)
    v3 = 0;
  self->_has = ($03CFB5B8B6ED84BF2F9A3941B0FD4455)(*(_QWORD *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | v3);
}

- (BOOL)hasXpcActivityRegisteredWithDuet
{
  return *((_BYTE *)&self->_has + 4) & 1;
}

- (void)setXpcActivityTimeSinceLastRegistration:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x2000000uLL;
  self->_xpcActivityTimeSinceLastRegistration = a3;
}

- (void)setHasXpcActivityTimeSinceLastRegistration:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000;
  if (!a3)
    v3 = 0;
  self->_has = ($03CFB5B8B6ED84BF2F9A3941B0FD4455)(*(_QWORD *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3);
}

- (BOOL)hasXpcActivityTimeSinceLastRegistration
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setXpcActivityIsActive:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x80000000uLL;
  self->_xpcActivityIsActive = a3;
}

- (void)setHasXpcActivityIsActive:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000;
  if (!a3)
    v3 = 0;
  self->_has = ($03CFB5B8B6ED84BF2F9A3941B0FD4455)(*(_QWORD *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3);
}

- (BOOL)hasXpcActivityIsActive
{
  return *((unsigned __int8 *)&self->_has + 3) >> 7;
}

- (void)setXpcActivityTimeSinceLastActivation:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x1000000uLL;
  self->_xpcActivityTimeSinceLastActivation = a3;
}

- (void)setHasXpcActivityTimeSinceLastActivation:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000;
  if (!a3)
    v3 = 0;
  self->_has = ($03CFB5B8B6ED84BF2F9A3941B0FD4455)(*(_QWORD *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3);
}

- (BOOL)hasXpcActivityTimeSinceLastActivation
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (void)setXpcActivityDasdContext:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x400000uLL;
  self->_xpcActivityDasdContext = a3;
}

- (void)setHasXpcActivityDasdContext:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000;
  if (!a3)
    v3 = 0;
  self->_has = ($03CFB5B8B6ED84BF2F9A3941B0FD4455)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3);
}

- (BOOL)hasXpcActivityDasdContext
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setItemsNotMigratedDelta:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x800uLL;
  self->_itemsNotMigratedDelta = a3;
}

- (void)setHasItemsNotMigratedDelta:(BOOL)a3
{
  uint64_t v3;

  v3 = 2048;
  if (!a3)
    v3 = 0;
  self->_has = ($03CFB5B8B6ED84BF2F9A3941B0FD4455)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (BOOL)hasItemsNotMigratedDelta
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setItemsReconciledInFileProviderDelta:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x2000uLL;
  self->_itemsReconciledInFileProviderDelta = a3;
}

- (void)setHasItemsReconciledInFileProviderDelta:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000;
  if (!a3)
    v3 = 0;
  self->_has = ($03CFB5B8B6ED84BF2F9A3941B0FD4455)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (BOOL)hasItemsReconciledInFileProviderDelta
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setXpcActivityTimeSinceLastAbleToRun:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x800000uLL;
  self->_xpcActivityTimeSinceLastAbleToRun = a3;
}

- (void)setHasXpcActivityTimeSinceLastAbleToRun:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000;
  if (!a3)
    v3 = 0;
  self->_has = ($03CFB5B8B6ED84BF2F9A3941B0FD4455)(*(_QWORD *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3);
}

- (BOOL)hasXpcActivityTimeSinceLastAbleToRun
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)AppTelemetryFPFSMigrationInvestigation;
  -[AppTelemetryFPFSMigrationInvestigation description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AppTelemetryFPFSMigrationInvestigation dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 has;
  void *v5;
  NSString *treatmentId;
  NSString *experimentId;
  NSString *rampId;
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v9;
  void *v10;
  id v11;
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

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isSuccessful);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("isSuccessful"));

    has = self->_has;
    if ((*(_WORD *)&has & 0x400) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x200000) == 0)
        goto LABEL_4;
      goto LABEL_45;
    }
  }
  else if ((*(_WORD *)&has & 0x400) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_itemsNotMigratedCount);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("itemsNotMigratedCount"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_5;
    goto LABEL_46;
  }
LABEL_45:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_totalItemCount);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("totalItemCount"));

  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_6;
    goto LABEL_47;
  }
LABEL_46:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_accountQuotaUsage);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("accountQuotaUsage"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_48;
  }
LABEL_47:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isAccountDataSeparated);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("isAccountDataSeparated"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_8;
    goto LABEL_49;
  }
LABEL_48:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_importTime);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("importTime"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_9;
    goto LABEL_50;
  }
LABEL_49:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_typesOfMigratedItemsMask);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("typesOfMigratedItemsMask"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_51;
  }
LABEL_50:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_typesOfNonMigratedItemsMask);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("typesOfNonMigratedItemsMask"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_11;
    goto LABEL_52;
  }
LABEL_51:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_itemsNotFoundInDB);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("itemsNotFoundInDB"));

  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_52:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_bouncedItemsCount);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("bouncedItemsCount"));

  if ((*(_QWORD *)&self->_has & 4) != 0)
  {
LABEL_12:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_bouncedItemsMatrix);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("bouncedItemsMatrix"));

  }
LABEL_13:
  treatmentId = self->_treatmentId;
  if (treatmentId)
    objc_msgSend(v3, "setObject:forKey:", treatmentId, CFSTR("treatmentId"));
  experimentId = self->_experimentId;
  if (experimentId)
    objc_msgSend(v3, "setObject:forKey:", experimentId, CFSTR("experimentId"));
  rampId = self->_rampId;
  if (rampId)
    objc_msgSend(v3, "setObject:forKey:", rampId, CFSTR("rampId"));
  v9 = self->_has;
  if ((*(_BYTE *)&v9 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_busyDateNotMigratedCount);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("busyDateNotMigratedCount"));

    v9 = self->_has;
    if ((*(_BYTE *)&v9 & 0x10) == 0)
    {
LABEL_21:
      if ((*(_BYTE *)&v9 & 0x40) == 0)
        goto LABEL_22;
      goto LABEL_56;
    }
  }
  else if ((*(_BYTE *)&v9 & 0x10) == 0)
  {
    goto LABEL_21;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_childItemsNotMigratedCount);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("childItemsNotMigratedCount"));

  v9 = self->_has;
  if ((*(_BYTE *)&v9 & 0x40) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&v9 & 0x1000) == 0)
      goto LABEL_23;
    goto LABEL_57;
  }
LABEL_56:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_ignoredFromSyncItemsNotMigratedCount);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("ignoredFromSyncItemsNotMigratedCount"));

  v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x1000) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&v9 & 0x100) == 0)
      goto LABEL_24;
    goto LABEL_58;
  }
LABEL_57:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_itemsReconciledInFileProvider);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("itemsReconciledInFileProvider"));

  v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x100) == 0)
  {
LABEL_24:
    if ((*(_BYTE *)&v9 & 0x20) == 0)
      goto LABEL_25;
    goto LABEL_59;
  }
LABEL_58:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_itemsMigratedWithoutAlreadyMayExistFlag);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("itemsMigratedWithoutAlreadyMayExistFlag"));

  v9 = self->_has;
  if ((*(_BYTE *)&v9 & 0x20) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&v9 & 0x20000000) == 0)
      goto LABEL_26;
    goto LABEL_60;
  }
LABEL_59:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_durationBetweenDbCreationAndMigrationStart);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("durationBetweenDbCreationAndMigrationStart"));

  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x20000000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&v9 & 0x40000) == 0)
      goto LABEL_27;
    goto LABEL_61;
  }
LABEL_60:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isStreamResetRunning);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("isStreamResetRunning"));

  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x40000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&v9 & 0x100000) == 0)
      goto LABEL_28;
    goto LABEL_62;
  }
LABEL_61:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_stateOfDownloadJobs);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("stateOfDownloadJobs"));

  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x100000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v9 & 0x80000) == 0)
      goto LABEL_29;
    goto LABEL_63;
  }
LABEL_62:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_stateOfUploadJobs);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("stateOfUploadJobs"));

  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x80000) == 0)
  {
LABEL_29:
    if ((*(_WORD *)&v9 & 0x4000) == 0)
      goto LABEL_30;
    goto LABEL_64;
  }
LABEL_63:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_stateOfOtherJobs);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("stateOfOtherJobs"));

  v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x4000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&v9 & 0x20000) == 0)
      goto LABEL_31;
    goto LABEL_65;
  }
LABEL_64:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_numberOfItemsPendingReconciliation);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("numberOfItemsPendingReconciliation"));

  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x20000) == 0)
  {
LABEL_31:
    if ((*(_WORD *)&v9 & 0x8000) == 0)
      goto LABEL_32;
    goto LABEL_66;
  }
LABEL_65:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_numberOfItemsPendingSelection);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v34, CFSTR("numberOfItemsPendingSelection"));

  v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x8000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&v9 & 0x10000) == 0)
      goto LABEL_33;
    goto LABEL_67;
  }
LABEL_66:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_numberOfItemsPendingScanningDisk);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v35, CFSTR("numberOfItemsPendingScanningDisk"));

  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x10000) == 0)
  {
LABEL_33:
    if ((*(_QWORD *)&v9 & 0x100000000) == 0)
      goto LABEL_34;
    goto LABEL_68;
  }
LABEL_67:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_numberOfItemsPendingScanningProvider);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v36, CFSTR("numberOfItemsPendingScanningProvider"));

  v9 = self->_has;
  if ((*(_QWORD *)&v9 & 0x100000000) == 0)
  {
LABEL_34:
    if ((*(_DWORD *)&v9 & 0x2000000) == 0)
      goto LABEL_35;
    goto LABEL_69;
  }
LABEL_68:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_xpcActivityRegisteredWithDuet);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v37, CFSTR("xpcActivityRegisteredWithDuet"));

  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x2000000) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&v9 & 0x80000000) == 0)
      goto LABEL_36;
    goto LABEL_70;
  }
LABEL_69:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_xpcActivityTimeSinceLastRegistration);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v38, CFSTR("xpcActivityTimeSinceLastRegistration"));

  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x80000000) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&v9 & 0x1000000) == 0)
      goto LABEL_37;
    goto LABEL_71;
  }
LABEL_70:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_xpcActivityIsActive);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v39, CFSTR("xpcActivityIsActive"));

  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x1000000) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&v9 & 0x400000) == 0)
      goto LABEL_38;
    goto LABEL_72;
  }
LABEL_71:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_xpcActivityTimeSinceLastActivation);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v40, CFSTR("xpcActivityTimeSinceLastActivation"));

  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x400000) == 0)
  {
LABEL_38:
    if ((*(_WORD *)&v9 & 0x800) == 0)
      goto LABEL_39;
    goto LABEL_73;
  }
LABEL_72:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_xpcActivityDasdContext);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v41, CFSTR("xpcActivityDasdContext"));

  v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x800) == 0)
  {
LABEL_39:
    if ((*(_WORD *)&v9 & 0x2000) == 0)
      goto LABEL_40;
LABEL_74:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_itemsReconciledInFileProviderDelta);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v43, CFSTR("itemsReconciledInFileProviderDelta"));

    if ((*(_QWORD *)&self->_has & 0x800000) == 0)
      goto LABEL_42;
    goto LABEL_41;
  }
LABEL_73:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_itemsNotMigratedDelta);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v42, CFSTR("itemsNotMigratedDelta"));

  v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x2000) != 0)
    goto LABEL_74;
LABEL_40:
  if ((*(_DWORD *)&v9 & 0x800000) != 0)
  {
LABEL_41:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_xpcActivityTimeSinceLastAbleToRun);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("xpcActivityTimeSinceLastAbleToRun"));

  }
LABEL_42:
  v11 = v3;

  return v11;
}

- (BOOL)readFrom:(id)a3
{
  return AppTelemetryFPFSMigrationInvestigationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 has;
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v5;
  id v6;

  v6 = a3;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = self->_has;
    if ((*(_WORD *)&has & 0x400) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x200000) == 0)
        goto LABEL_4;
      goto LABEL_45;
    }
  }
  else if ((*(_WORD *)&has & 0x400) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_5;
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_6;
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_8;
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteDoubleField();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_9;
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_11;
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_52:
  PBDataWriterWriteInt64Field();
  if ((*(_QWORD *)&self->_has & 4) != 0)
LABEL_12:
    PBDataWriterWriteInt64Field();
LABEL_13:
  if (self->_treatmentId)
    PBDataWriterWriteStringField();
  if (self->_experimentId)
    PBDataWriterWriteStringField();
  if (self->_rampId)
    PBDataWriterWriteStringField();
  v5 = self->_has;
  if ((*(_BYTE *)&v5 & 8) != 0)
  {
    PBDataWriterWriteInt64Field();
    v5 = self->_has;
    if ((*(_BYTE *)&v5 & 0x10) == 0)
    {
LABEL_21:
      if ((*(_BYTE *)&v5 & 0x40) == 0)
        goto LABEL_22;
      goto LABEL_56;
    }
  }
  else if ((*(_BYTE *)&v5 & 0x10) == 0)
  {
    goto LABEL_21;
  }
  PBDataWriterWriteInt64Field();
  v5 = self->_has;
  if ((*(_BYTE *)&v5 & 0x40) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&v5 & 0x1000) == 0)
      goto LABEL_23;
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteInt64Field();
  v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x1000) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&v5 & 0x100) == 0)
      goto LABEL_24;
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteInt64Field();
  v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x100) == 0)
  {
LABEL_24:
    if ((*(_BYTE *)&v5 & 0x20) == 0)
      goto LABEL_25;
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteInt64Field();
  v5 = self->_has;
  if ((*(_BYTE *)&v5 & 0x20) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&v5 & 0x20000000) == 0)
      goto LABEL_26;
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteInt64Field();
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x20000000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&v5 & 0x40000) == 0)
      goto LABEL_27;
    goto LABEL_61;
  }
LABEL_60:
  PBDataWriterWriteBOOLField();
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x40000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&v5 & 0x100000) == 0)
      goto LABEL_28;
    goto LABEL_62;
  }
LABEL_61:
  PBDataWriterWriteInt64Field();
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x100000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v5 & 0x80000) == 0)
      goto LABEL_29;
    goto LABEL_63;
  }
LABEL_62:
  PBDataWriterWriteInt64Field();
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x80000) == 0)
  {
LABEL_29:
    if ((*(_WORD *)&v5 & 0x4000) == 0)
      goto LABEL_30;
    goto LABEL_64;
  }
LABEL_63:
  PBDataWriterWriteInt64Field();
  v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x4000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&v5 & 0x20000) == 0)
      goto LABEL_31;
    goto LABEL_65;
  }
LABEL_64:
  PBDataWriterWriteInt64Field();
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x20000) == 0)
  {
LABEL_31:
    if ((*(_WORD *)&v5 & 0x8000) == 0)
      goto LABEL_32;
    goto LABEL_66;
  }
LABEL_65:
  PBDataWriterWriteInt64Field();
  v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x8000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&v5 & 0x10000) == 0)
      goto LABEL_33;
    goto LABEL_67;
  }
LABEL_66:
  PBDataWriterWriteInt64Field();
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x10000) == 0)
  {
LABEL_33:
    if ((*(_QWORD *)&v5 & 0x100000000) == 0)
      goto LABEL_34;
    goto LABEL_68;
  }
LABEL_67:
  PBDataWriterWriteInt64Field();
  v5 = self->_has;
  if ((*(_QWORD *)&v5 & 0x100000000) == 0)
  {
LABEL_34:
    if ((*(_DWORD *)&v5 & 0x2000000) == 0)
      goto LABEL_35;
    goto LABEL_69;
  }
LABEL_68:
  PBDataWriterWriteBOOLField();
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x2000000) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&v5 & 0x80000000) == 0)
      goto LABEL_36;
    goto LABEL_70;
  }
LABEL_69:
  PBDataWriterWriteInt64Field();
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x80000000) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&v5 & 0x1000000) == 0)
      goto LABEL_37;
    goto LABEL_71;
  }
LABEL_70:
  PBDataWriterWriteBOOLField();
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x1000000) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&v5 & 0x400000) == 0)
      goto LABEL_38;
    goto LABEL_72;
  }
LABEL_71:
  PBDataWriterWriteInt64Field();
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x400000) == 0)
  {
LABEL_38:
    if ((*(_WORD *)&v5 & 0x800) == 0)
      goto LABEL_39;
    goto LABEL_73;
  }
LABEL_72:
  PBDataWriterWriteInt64Field();
  v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x800) == 0)
  {
LABEL_39:
    if ((*(_WORD *)&v5 & 0x2000) == 0)
      goto LABEL_40;
LABEL_74:
    PBDataWriterWriteInt64Field();
    if ((*(_QWORD *)&self->_has & 0x800000) == 0)
      goto LABEL_42;
    goto LABEL_41;
  }
LABEL_73:
  PBDataWriterWriteInt64Field();
  v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x2000) != 0)
    goto LABEL_74;
LABEL_40:
  if ((*(_DWORD *)&v5 & 0x800000) != 0)
LABEL_41:
    PBDataWriterWriteInt64Field();
LABEL_42:

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 has;
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v6;
  _BYTE *v7;

  v4 = a3;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
    v4[250] = self->_isSuccessful;
    *((_QWORD *)v4 + 32) |= 0x40000000uLL;
    has = self->_has;
    if ((*(_WORD *)&has & 0x400) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x200000) == 0)
        goto LABEL_4;
      goto LABEL_45;
    }
  }
  else if ((*(_WORD *)&has & 0x400) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)v4 + 11) = self->_itemsNotMigratedCount;
  *((_QWORD *)v4 + 32) |= 0x400uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_5;
    goto LABEL_46;
  }
LABEL_45:
  *((_QWORD *)v4 + 22) = self->_totalItemCount;
  *((_QWORD *)v4 + 32) |= 0x200000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_6;
    goto LABEL_47;
  }
LABEL_46:
  *((_QWORD *)v4 + 1) = self->_accountQuotaUsage;
  *((_QWORD *)v4 + 32) |= 1uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_48;
  }
LABEL_47:
  v4[248] = self->_isAccountDataSeparated;
  *((_QWORD *)v4 + 32) |= 0x10000000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_8;
    goto LABEL_49;
  }
LABEL_48:
  *((_QWORD *)v4 + 8) = *(_QWORD *)&self->_importTime;
  *((_QWORD *)v4 + 32) |= 0x80uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_9;
    goto LABEL_50;
  }
LABEL_49:
  *((_DWORD *)v4 + 60) = self->_typesOfMigratedItemsMask;
  *((_QWORD *)v4 + 32) |= 0x4000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_51;
  }
LABEL_50:
  *((_DWORD *)v4 + 61) = self->_typesOfNonMigratedItemsMask;
  *((_QWORD *)v4 + 32) |= 0x8000000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_11;
    goto LABEL_52;
  }
LABEL_51:
  *((_QWORD *)v4 + 10) = self->_itemsNotFoundInDB;
  *((_QWORD *)v4 + 32) |= 0x200uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_52:
  *((_QWORD *)v4 + 2) = self->_bouncedItemsCount;
  *((_QWORD *)v4 + 32) |= 2uLL;
  if ((*(_QWORD *)&self->_has & 4) != 0)
  {
LABEL_12:
    *((_QWORD *)v4 + 3) = self->_bouncedItemsMatrix;
    *((_QWORD *)v4 + 32) |= 4uLL;
  }
LABEL_13:
  v7 = v4;
  if (self->_treatmentId)
  {
    objc_msgSend(v4, "setTreatmentId:");
    v4 = v7;
  }
  if (self->_experimentId)
  {
    objc_msgSend(v7, "setExperimentId:");
    v4 = v7;
  }
  if (self->_rampId)
  {
    objc_msgSend(v7, "setRampId:");
    v4 = v7;
  }
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 8) != 0)
  {
    *((_QWORD *)v4 + 4) = self->_busyDateNotMigratedCount;
    *((_QWORD *)v4 + 32) |= 8uLL;
    v6 = self->_has;
    if ((*(_BYTE *)&v6 & 0x10) == 0)
    {
LABEL_21:
      if ((*(_BYTE *)&v6 & 0x40) == 0)
        goto LABEL_22;
      goto LABEL_56;
    }
  }
  else if ((*(_BYTE *)&v6 & 0x10) == 0)
  {
    goto LABEL_21;
  }
  *((_QWORD *)v4 + 5) = self->_childItemsNotMigratedCount;
  *((_QWORD *)v4 + 32) |= 0x10uLL;
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 0x40) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&v6 & 0x1000) == 0)
      goto LABEL_23;
    goto LABEL_57;
  }
LABEL_56:
  *((_QWORD *)v4 + 7) = self->_ignoredFromSyncItemsNotMigratedCount;
  *((_QWORD *)v4 + 32) |= 0x40uLL;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x1000) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&v6 & 0x100) == 0)
      goto LABEL_24;
    goto LABEL_58;
  }
LABEL_57:
  *((_QWORD *)v4 + 13) = self->_itemsReconciledInFileProvider;
  *((_QWORD *)v4 + 32) |= 0x1000uLL;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x100) == 0)
  {
LABEL_24:
    if ((*(_BYTE *)&v6 & 0x20) == 0)
      goto LABEL_25;
    goto LABEL_59;
  }
LABEL_58:
  *((_QWORD *)v4 + 9) = self->_itemsMigratedWithoutAlreadyMayExistFlag;
  *((_QWORD *)v4 + 32) |= 0x100uLL;
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 0x20) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&v6 & 0x20000000) == 0)
      goto LABEL_26;
    goto LABEL_60;
  }
LABEL_59:
  *((_QWORD *)v4 + 6) = self->_durationBetweenDbCreationAndMigrationStart;
  *((_QWORD *)v4 + 32) |= 0x20uLL;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x20000000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&v6 & 0x40000) == 0)
      goto LABEL_27;
    goto LABEL_61;
  }
LABEL_60:
  v4[249] = self->_isStreamResetRunning;
  *((_QWORD *)v4 + 32) |= 0x20000000uLL;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x40000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&v6 & 0x100000) == 0)
      goto LABEL_28;
    goto LABEL_62;
  }
LABEL_61:
  *((_QWORD *)v4 + 19) = self->_stateOfDownloadJobs;
  *((_QWORD *)v4 + 32) |= 0x40000uLL;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x100000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v6 & 0x80000) == 0)
      goto LABEL_29;
    goto LABEL_63;
  }
LABEL_62:
  *((_QWORD *)v4 + 21) = self->_stateOfUploadJobs;
  *((_QWORD *)v4 + 32) |= 0x100000uLL;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x80000) == 0)
  {
LABEL_29:
    if ((*(_WORD *)&v6 & 0x4000) == 0)
      goto LABEL_30;
    goto LABEL_64;
  }
LABEL_63:
  *((_QWORD *)v4 + 20) = self->_stateOfOtherJobs;
  *((_QWORD *)v4 + 32) |= 0x80000uLL;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x4000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&v6 & 0x20000) == 0)
      goto LABEL_31;
    goto LABEL_65;
  }
LABEL_64:
  *((_QWORD *)v4 + 15) = self->_numberOfItemsPendingReconciliation;
  *((_QWORD *)v4 + 32) |= 0x4000uLL;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x20000) == 0)
  {
LABEL_31:
    if ((*(_WORD *)&v6 & 0x8000) == 0)
      goto LABEL_32;
    goto LABEL_66;
  }
LABEL_65:
  *((_QWORD *)v4 + 18) = self->_numberOfItemsPendingSelection;
  *((_QWORD *)v4 + 32) |= 0x20000uLL;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x8000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&v6 & 0x10000) == 0)
      goto LABEL_33;
    goto LABEL_67;
  }
LABEL_66:
  *((_QWORD *)v4 + 16) = self->_numberOfItemsPendingScanningDisk;
  *((_QWORD *)v4 + 32) |= 0x8000uLL;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x10000) == 0)
  {
LABEL_33:
    if ((*(_QWORD *)&v6 & 0x100000000) == 0)
      goto LABEL_34;
    goto LABEL_68;
  }
LABEL_67:
  *((_QWORD *)v4 + 17) = self->_numberOfItemsPendingScanningProvider;
  *((_QWORD *)v4 + 32) |= 0x10000uLL;
  v6 = self->_has;
  if ((*(_QWORD *)&v6 & 0x100000000) == 0)
  {
LABEL_34:
    if ((*(_DWORD *)&v6 & 0x2000000) == 0)
      goto LABEL_35;
    goto LABEL_69;
  }
LABEL_68:
  v4[252] = self->_xpcActivityRegisteredWithDuet;
  *((_QWORD *)v4 + 32) |= 0x100000000uLL;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x2000000) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&v6 & 0x80000000) == 0)
      goto LABEL_36;
    goto LABEL_70;
  }
LABEL_69:
  *((_QWORD *)v4 + 26) = self->_xpcActivityTimeSinceLastRegistration;
  *((_QWORD *)v4 + 32) |= 0x2000000uLL;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x80000000) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&v6 & 0x1000000) == 0)
      goto LABEL_37;
    goto LABEL_71;
  }
LABEL_70:
  v4[251] = self->_xpcActivityIsActive;
  *((_QWORD *)v4 + 32) |= 0x80000000uLL;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x1000000) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&v6 & 0x400000) == 0)
      goto LABEL_38;
    goto LABEL_72;
  }
LABEL_71:
  *((_QWORD *)v4 + 25) = self->_xpcActivityTimeSinceLastActivation;
  *((_QWORD *)v4 + 32) |= 0x1000000uLL;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x400000) == 0)
  {
LABEL_38:
    if ((*(_WORD *)&v6 & 0x800) == 0)
      goto LABEL_39;
    goto LABEL_73;
  }
LABEL_72:
  *((_QWORD *)v4 + 23) = self->_xpcActivityDasdContext;
  *((_QWORD *)v4 + 32) |= 0x400000uLL;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x800) == 0)
  {
LABEL_39:
    if ((*(_WORD *)&v6 & 0x2000) == 0)
      goto LABEL_40;
LABEL_74:
    *((_QWORD *)v4 + 14) = self->_itemsReconciledInFileProviderDelta;
    *((_QWORD *)v4 + 32) |= 0x2000uLL;
    if ((*(_QWORD *)&self->_has & 0x800000) == 0)
      goto LABEL_42;
    goto LABEL_41;
  }
LABEL_73:
  *((_QWORD *)v4 + 12) = self->_itemsNotMigratedDelta;
  *((_QWORD *)v4 + 32) |= 0x800uLL;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x2000) != 0)
    goto LABEL_74;
LABEL_40:
  if ((*(_DWORD *)&v6 & 0x800000) != 0)
  {
LABEL_41:
    *((_QWORD *)v4 + 24) = self->_xpcActivityTimeSinceLastAbleToRun;
    *((_QWORD *)v4 + 32) |= 0x800000uLL;
  }
LABEL_42:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 has;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v14;
  id v15;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
    *(_BYTE *)(v5 + 250) = self->_isSuccessful;
    *(_QWORD *)(v5 + 256) |= 0x40000000uLL;
    has = self->_has;
    if ((*(_WORD *)&has & 0x400) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x200000) == 0)
        goto LABEL_4;
      goto LABEL_39;
    }
  }
  else if ((*(_WORD *)&has & 0x400) == 0)
  {
    goto LABEL_3;
  }
  *(_QWORD *)(v5 + 88) = self->_itemsNotMigratedCount;
  *(_QWORD *)(v5 + 256) |= 0x400uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_5;
    goto LABEL_40;
  }
LABEL_39:
  *(_QWORD *)(v5 + 176) = self->_totalItemCount;
  *(_QWORD *)(v5 + 256) |= 0x200000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_6;
    goto LABEL_41;
  }
LABEL_40:
  *(_QWORD *)(v5 + 8) = self->_accountQuotaUsage;
  *(_QWORD *)(v5 + 256) |= 1uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_42;
  }
LABEL_41:
  *(_BYTE *)(v5 + 248) = self->_isAccountDataSeparated;
  *(_QWORD *)(v5 + 256) |= 0x10000000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_8;
    goto LABEL_43;
  }
LABEL_42:
  *(double *)(v5 + 64) = self->_importTime;
  *(_QWORD *)(v5 + 256) |= 0x80uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_9;
    goto LABEL_44;
  }
LABEL_43:
  *(_DWORD *)(v5 + 240) = self->_typesOfMigratedItemsMask;
  *(_QWORD *)(v5 + 256) |= 0x4000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_45;
  }
LABEL_44:
  *(_DWORD *)(v5 + 244) = self->_typesOfNonMigratedItemsMask;
  *(_QWORD *)(v5 + 256) |= 0x8000000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_11;
    goto LABEL_46;
  }
LABEL_45:
  *(_QWORD *)(v5 + 80) = self->_itemsNotFoundInDB;
  *(_QWORD *)(v5 + 256) |= 0x200uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_46:
  *(_QWORD *)(v5 + 16) = self->_bouncedItemsCount;
  *(_QWORD *)(v5 + 256) |= 2uLL;
  if ((*(_QWORD *)&self->_has & 4) != 0)
  {
LABEL_12:
    *(_QWORD *)(v5 + 24) = self->_bouncedItemsMatrix;
    *(_QWORD *)(v5 + 256) |= 4uLL;
  }
LABEL_13:
  v8 = -[NSString copyWithZone:](self->_treatmentId, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 232);
  *(_QWORD *)(v6 + 232) = v8;

  v10 = -[NSString copyWithZone:](self->_experimentId, "copyWithZone:", a3);
  v11 = *(void **)(v6 + 216);
  *(_QWORD *)(v6 + 216) = v10;

  v12 = -[NSString copyWithZone:](self->_rampId, "copyWithZone:", a3);
  v13 = *(void **)(v6 + 224);
  *(_QWORD *)(v6 + 224) = v12;

  v14 = self->_has;
  if ((*(_BYTE *)&v14 & 8) != 0)
  {
    *(_QWORD *)(v6 + 32) = self->_busyDateNotMigratedCount;
    *(_QWORD *)(v6 + 256) |= 8uLL;
    v14 = self->_has;
    if ((*(_BYTE *)&v14 & 0x10) == 0)
    {
LABEL_15:
      if ((*(_BYTE *)&v14 & 0x40) == 0)
        goto LABEL_16;
      goto LABEL_50;
    }
  }
  else if ((*(_BYTE *)&v14 & 0x10) == 0)
  {
    goto LABEL_15;
  }
  *(_QWORD *)(v6 + 40) = self->_childItemsNotMigratedCount;
  *(_QWORD *)(v6 + 256) |= 0x10uLL;
  v14 = self->_has;
  if ((*(_BYTE *)&v14 & 0x40) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&v14 & 0x1000) == 0)
      goto LABEL_17;
    goto LABEL_51;
  }
LABEL_50:
  *(_QWORD *)(v6 + 56) = self->_ignoredFromSyncItemsNotMigratedCount;
  *(_QWORD *)(v6 + 256) |= 0x40uLL;
  v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x1000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&v14 & 0x100) == 0)
      goto LABEL_18;
    goto LABEL_52;
  }
LABEL_51:
  *(_QWORD *)(v6 + 104) = self->_itemsReconciledInFileProvider;
  *(_QWORD *)(v6 + 256) |= 0x1000uLL;
  v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x100) == 0)
  {
LABEL_18:
    if ((*(_BYTE *)&v14 & 0x20) == 0)
      goto LABEL_19;
    goto LABEL_53;
  }
LABEL_52:
  *(_QWORD *)(v6 + 72) = self->_itemsMigratedWithoutAlreadyMayExistFlag;
  *(_QWORD *)(v6 + 256) |= 0x100uLL;
  v14 = self->_has;
  if ((*(_BYTE *)&v14 & 0x20) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&v14 & 0x20000000) == 0)
      goto LABEL_20;
    goto LABEL_54;
  }
LABEL_53:
  *(_QWORD *)(v6 + 48) = self->_durationBetweenDbCreationAndMigrationStart;
  *(_QWORD *)(v6 + 256) |= 0x20uLL;
  v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x20000000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&v14 & 0x40000) == 0)
      goto LABEL_21;
    goto LABEL_55;
  }
LABEL_54:
  *(_BYTE *)(v6 + 249) = self->_isStreamResetRunning;
  *(_QWORD *)(v6 + 256) |= 0x20000000uLL;
  v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x40000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&v14 & 0x100000) == 0)
      goto LABEL_22;
    goto LABEL_56;
  }
LABEL_55:
  *(_QWORD *)(v6 + 152) = self->_stateOfDownloadJobs;
  *(_QWORD *)(v6 + 256) |= 0x40000uLL;
  v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x100000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&v14 & 0x80000) == 0)
      goto LABEL_23;
    goto LABEL_57;
  }
LABEL_56:
  *(_QWORD *)(v6 + 168) = self->_stateOfUploadJobs;
  *(_QWORD *)(v6 + 256) |= 0x100000uLL;
  v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x80000) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&v14 & 0x4000) == 0)
      goto LABEL_24;
    goto LABEL_58;
  }
LABEL_57:
  *(_QWORD *)(v6 + 160) = self->_stateOfOtherJobs;
  *(_QWORD *)(v6 + 256) |= 0x80000uLL;
  v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x4000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&v14 & 0x20000) == 0)
      goto LABEL_25;
    goto LABEL_59;
  }
LABEL_58:
  *(_QWORD *)(v6 + 120) = self->_numberOfItemsPendingReconciliation;
  *(_QWORD *)(v6 + 256) |= 0x4000uLL;
  v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x20000) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&v14 & 0x8000) == 0)
      goto LABEL_26;
    goto LABEL_60;
  }
LABEL_59:
  *(_QWORD *)(v6 + 144) = self->_numberOfItemsPendingSelection;
  *(_QWORD *)(v6 + 256) |= 0x20000uLL;
  v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x8000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&v14 & 0x10000) == 0)
      goto LABEL_27;
    goto LABEL_61;
  }
LABEL_60:
  *(_QWORD *)(v6 + 128) = self->_numberOfItemsPendingScanningDisk;
  *(_QWORD *)(v6 + 256) |= 0x8000uLL;
  v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x10000) == 0)
  {
LABEL_27:
    if ((*(_QWORD *)&v14 & 0x100000000) == 0)
      goto LABEL_28;
    goto LABEL_62;
  }
LABEL_61:
  *(_QWORD *)(v6 + 136) = self->_numberOfItemsPendingScanningProvider;
  *(_QWORD *)(v6 + 256) |= 0x10000uLL;
  v14 = self->_has;
  if ((*(_QWORD *)&v14 & 0x100000000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v14 & 0x2000000) == 0)
      goto LABEL_29;
    goto LABEL_63;
  }
LABEL_62:
  *(_BYTE *)(v6 + 252) = self->_xpcActivityRegisteredWithDuet;
  *(_QWORD *)(v6 + 256) |= 0x100000000uLL;
  v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x2000000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&v14 & 0x80000000) == 0)
      goto LABEL_30;
    goto LABEL_64;
  }
LABEL_63:
  *(_QWORD *)(v6 + 208) = self->_xpcActivityTimeSinceLastRegistration;
  *(_QWORD *)(v6 + 256) |= 0x2000000uLL;
  v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x80000000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&v14 & 0x1000000) == 0)
      goto LABEL_31;
    goto LABEL_65;
  }
LABEL_64:
  *(_BYTE *)(v6 + 251) = self->_xpcActivityIsActive;
  *(_QWORD *)(v6 + 256) |= 0x80000000uLL;
  v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x1000000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&v14 & 0x400000) == 0)
      goto LABEL_32;
    goto LABEL_66;
  }
LABEL_65:
  *(_QWORD *)(v6 + 200) = self->_xpcActivityTimeSinceLastActivation;
  *(_QWORD *)(v6 + 256) |= 0x1000000uLL;
  v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x400000) == 0)
  {
LABEL_32:
    if ((*(_WORD *)&v14 & 0x800) == 0)
      goto LABEL_33;
    goto LABEL_67;
  }
LABEL_66:
  *(_QWORD *)(v6 + 184) = self->_xpcActivityDasdContext;
  *(_QWORD *)(v6 + 256) |= 0x400000uLL;
  v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x800) == 0)
  {
LABEL_33:
    if ((*(_WORD *)&v14 & 0x2000) == 0)
      goto LABEL_34;
LABEL_68:
    *(_QWORD *)(v6 + 112) = self->_itemsReconciledInFileProviderDelta;
    *(_QWORD *)(v6 + 256) |= 0x2000uLL;
    if ((*(_QWORD *)&self->_has & 0x800000) == 0)
      goto LABEL_36;
    goto LABEL_35;
  }
LABEL_67:
  *(_QWORD *)(v6 + 96) = self->_itemsNotMigratedDelta;
  *(_QWORD *)(v6 + 256) |= 0x800uLL;
  v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x2000) != 0)
    goto LABEL_68;
LABEL_34:
  if ((*(_DWORD *)&v14 & 0x800000) != 0)
  {
LABEL_35:
    *(_QWORD *)(v6 + 192) = self->_xpcActivityTimeSinceLastAbleToRun;
    *(_QWORD *)(v6 + 256) |= 0x800000uLL;
  }
LABEL_36:
  v15 = (id)v6;

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 has;
  uint64_t v6;
  NSString *treatmentId;
  NSString *experimentId;
  NSString *rampId;
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v10;
  uint64_t v11;
  BOOL v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_188;
  has = self->_has;
  v6 = *((_QWORD *)v4 + 32);
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
    if ((v6 & 0x40000000) == 0)
      goto LABEL_188;
    if (self->_isSuccessful)
    {
      if (!*((_BYTE *)v4 + 250))
        goto LABEL_188;
    }
    else if (*((_BYTE *)v4 + 250))
    {
      goto LABEL_188;
    }
  }
  else if ((v6 & 0x40000000) != 0)
  {
    goto LABEL_188;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0 || self->_itemsNotMigratedCount != *((_QWORD *)v4 + 11))
      goto LABEL_188;
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_188;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v6 & 0x200000) == 0 || self->_totalItemCount != *((_QWORD *)v4 + 22))
      goto LABEL_188;
  }
  else if ((v6 & 0x200000) != 0)
  {
    goto LABEL_188;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_accountQuotaUsage != *((_QWORD *)v4 + 1))
      goto LABEL_188;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_188;
  }
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
    if ((v6 & 0x10000000) == 0)
      goto LABEL_188;
    if (self->_isAccountDataSeparated)
    {
      if (!*((_BYTE *)v4 + 248))
        goto LABEL_188;
    }
    else if (*((_BYTE *)v4 + 248))
    {
      goto LABEL_188;
    }
  }
  else if ((v6 & 0x10000000) != 0)
  {
    goto LABEL_188;
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_importTime != *((double *)v4 + 8))
      goto LABEL_188;
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_188;
  }
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    if ((v6 & 0x4000000) == 0 || self->_typesOfMigratedItemsMask != *((_DWORD *)v4 + 60))
      goto LABEL_188;
  }
  else if ((v6 & 0x4000000) != 0)
  {
    goto LABEL_188;
  }
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
    if ((v6 & 0x8000000) == 0 || self->_typesOfNonMigratedItemsMask != *((_DWORD *)v4 + 61))
      goto LABEL_188;
  }
  else if ((v6 & 0x8000000) != 0)
  {
    goto LABEL_188;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0 || self->_itemsNotFoundInDB != *((_QWORD *)v4 + 10))
      goto LABEL_188;
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_188;
  }
  if ((*(_BYTE *)&has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_bouncedItemsCount != *((_QWORD *)v4 + 2))
      goto LABEL_188;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_188;
  }
  if ((*(_BYTE *)&has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_bouncedItemsMatrix != *((_QWORD *)v4 + 3))
      goto LABEL_188;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_188;
  }
  treatmentId = self->_treatmentId;
  if ((unint64_t)treatmentId | *((_QWORD *)v4 + 29)
    && !-[NSString isEqual:](treatmentId, "isEqual:"))
  {
    goto LABEL_188;
  }
  experimentId = self->_experimentId;
  if ((unint64_t)experimentId | *((_QWORD *)v4 + 27))
  {
    if (!-[NSString isEqual:](experimentId, "isEqual:"))
      goto LABEL_188;
  }
  rampId = self->_rampId;
  if ((unint64_t)rampId | *((_QWORD *)v4 + 28))
  {
    if (!-[NSString isEqual:](rampId, "isEqual:"))
      goto LABEL_188;
  }
  v10 = self->_has;
  v11 = *((_QWORD *)v4 + 32);
  if ((*(_BYTE *)&v10 & 8) != 0)
  {
    if ((v11 & 8) == 0 || self->_busyDateNotMigratedCount != *((_QWORD *)v4 + 4))
      goto LABEL_188;
  }
  else if ((v11 & 8) != 0)
  {
    goto LABEL_188;
  }
  if ((*(_BYTE *)&v10 & 0x10) != 0)
  {
    if ((v11 & 0x10) == 0 || self->_childItemsNotMigratedCount != *((_QWORD *)v4 + 5))
      goto LABEL_188;
  }
  else if ((v11 & 0x10) != 0)
  {
    goto LABEL_188;
  }
  if ((*(_BYTE *)&v10 & 0x40) != 0)
  {
    if ((v11 & 0x40) == 0 || self->_ignoredFromSyncItemsNotMigratedCount != *((_QWORD *)v4 + 7))
      goto LABEL_188;
  }
  else if ((v11 & 0x40) != 0)
  {
    goto LABEL_188;
  }
  if ((*(_WORD *)&v10 & 0x1000) != 0)
  {
    if ((v11 & 0x1000) == 0 || self->_itemsReconciledInFileProvider != *((_QWORD *)v4 + 13))
      goto LABEL_188;
  }
  else if ((v11 & 0x1000) != 0)
  {
    goto LABEL_188;
  }
  if ((*(_WORD *)&v10 & 0x100) != 0)
  {
    if ((v11 & 0x100) == 0 || self->_itemsMigratedWithoutAlreadyMayExistFlag != *((_QWORD *)v4 + 9))
      goto LABEL_188;
  }
  else if ((v11 & 0x100) != 0)
  {
    goto LABEL_188;
  }
  if ((*(_BYTE *)&v10 & 0x20) != 0)
  {
    if ((v11 & 0x20) == 0 || self->_durationBetweenDbCreationAndMigrationStart != *((_QWORD *)v4 + 6))
      goto LABEL_188;
  }
  else if ((v11 & 0x20) != 0)
  {
    goto LABEL_188;
  }
  if ((*(_DWORD *)&v10 & 0x20000000) != 0)
  {
    if ((v11 & 0x20000000) == 0)
      goto LABEL_188;
    if (self->_isStreamResetRunning)
    {
      if (!*((_BYTE *)v4 + 249))
        goto LABEL_188;
    }
    else if (*((_BYTE *)v4 + 249))
    {
      goto LABEL_188;
    }
  }
  else if ((v11 & 0x20000000) != 0)
  {
    goto LABEL_188;
  }
  if ((*(_DWORD *)&v10 & 0x40000) != 0)
  {
    if ((v11 & 0x40000) == 0 || self->_stateOfDownloadJobs != *((_QWORD *)v4 + 19))
      goto LABEL_188;
  }
  else if ((v11 & 0x40000) != 0)
  {
    goto LABEL_188;
  }
  if ((*(_DWORD *)&v10 & 0x100000) != 0)
  {
    if ((v11 & 0x100000) == 0 || self->_stateOfUploadJobs != *((_QWORD *)v4 + 21))
      goto LABEL_188;
  }
  else if ((v11 & 0x100000) != 0)
  {
    goto LABEL_188;
  }
  if ((*(_DWORD *)&v10 & 0x80000) != 0)
  {
    if ((v11 & 0x80000) == 0 || self->_stateOfOtherJobs != *((_QWORD *)v4 + 20))
      goto LABEL_188;
  }
  else if ((v11 & 0x80000) != 0)
  {
    goto LABEL_188;
  }
  if ((*(_WORD *)&v10 & 0x4000) != 0)
  {
    if ((v11 & 0x4000) == 0 || self->_numberOfItemsPendingReconciliation != *((_QWORD *)v4 + 15))
      goto LABEL_188;
  }
  else if ((v11 & 0x4000) != 0)
  {
    goto LABEL_188;
  }
  if ((*(_DWORD *)&v10 & 0x20000) != 0)
  {
    if ((v11 & 0x20000) == 0 || self->_numberOfItemsPendingSelection != *((_QWORD *)v4 + 18))
      goto LABEL_188;
  }
  else if ((v11 & 0x20000) != 0)
  {
    goto LABEL_188;
  }
  if ((*(_WORD *)&v10 & 0x8000) != 0)
  {
    if ((v11 & 0x8000) == 0 || self->_numberOfItemsPendingScanningDisk != *((_QWORD *)v4 + 16))
      goto LABEL_188;
  }
  else if ((v11 & 0x8000) != 0)
  {
    goto LABEL_188;
  }
  if ((*(_DWORD *)&v10 & 0x10000) != 0)
  {
    if ((v11 & 0x10000) == 0 || self->_numberOfItemsPendingScanningProvider != *((_QWORD *)v4 + 17))
      goto LABEL_188;
  }
  else if ((v11 & 0x10000) != 0)
  {
    goto LABEL_188;
  }
  if ((*(_QWORD *)&v10 & 0x100000000) != 0)
  {
    if ((v11 & 0x100000000) == 0)
      goto LABEL_188;
    if (self->_xpcActivityRegisteredWithDuet)
    {
      if (!*((_BYTE *)v4 + 252))
        goto LABEL_188;
    }
    else if (*((_BYTE *)v4 + 252))
    {
      goto LABEL_188;
    }
  }
  else if ((v11 & 0x100000000) != 0)
  {
    goto LABEL_188;
  }
  if ((*(_DWORD *)&v10 & 0x2000000) != 0)
  {
    if ((v11 & 0x2000000) == 0 || self->_xpcActivityTimeSinceLastRegistration != *((_QWORD *)v4 + 26))
      goto LABEL_188;
  }
  else if ((v11 & 0x2000000) != 0)
  {
    goto LABEL_188;
  }
  if ((*(_DWORD *)&v10 & 0x80000000) != 0)
  {
    if ((v11 & 0x80000000) != 0)
    {
      if (self->_xpcActivityIsActive)
      {
        if (!*((_BYTE *)v4 + 251))
          goto LABEL_188;
        goto LABEL_163;
      }
      if (!*((_BYTE *)v4 + 251))
        goto LABEL_163;
    }
LABEL_188:
    v12 = 0;
    goto LABEL_189;
  }
  if ((v11 & 0x80000000) != 0)
    goto LABEL_188;
LABEL_163:
  if ((*(_DWORD *)&v10 & 0x1000000) != 0)
  {
    if ((v11 & 0x1000000) == 0 || self->_xpcActivityTimeSinceLastActivation != *((_QWORD *)v4 + 25))
      goto LABEL_188;
  }
  else if ((v11 & 0x1000000) != 0)
  {
    goto LABEL_188;
  }
  if ((*(_DWORD *)&v10 & 0x400000) != 0)
  {
    if ((v11 & 0x400000) == 0 || self->_xpcActivityDasdContext != *((_QWORD *)v4 + 23))
      goto LABEL_188;
  }
  else if ((v11 & 0x400000) != 0)
  {
    goto LABEL_188;
  }
  if ((*(_WORD *)&v10 & 0x800) != 0)
  {
    if ((v11 & 0x800) == 0 || self->_itemsNotMigratedDelta != *((_QWORD *)v4 + 12))
      goto LABEL_188;
  }
  else if ((v11 & 0x800) != 0)
  {
    goto LABEL_188;
  }
  if ((*(_WORD *)&v10 & 0x2000) != 0)
  {
    if ((v11 & 0x2000) == 0 || self->_itemsReconciledInFileProviderDelta != *((_QWORD *)v4 + 14))
      goto LABEL_188;
  }
  else if ((v11 & 0x2000) != 0)
  {
    goto LABEL_188;
  }
  if ((*(_DWORD *)&v10 & 0x800000) != 0)
  {
    if ((v11 & 0x800000) == 0 || self->_xpcActivityTimeSinceLastAbleToRun != *((_QWORD *)v4 + 24))
      goto LABEL_188;
    v12 = 1;
  }
  else
  {
    v12 = (v11 & 0x800000) == 0;
  }
LABEL_189:

  return v12;
}

- (unint64_t)hash
{
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 has;
  double importTime;
  double v5;
  long double v6;
  double v7;
  unint64_t v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v13;
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
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
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

  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
    v46 = 2654435761 * self->_isSuccessful;
    if ((*(_WORD *)&has & 0x400) != 0)
    {
LABEL_3:
      v45 = 2654435761 * self->_itemsNotMigratedCount;
      if ((*(_DWORD *)&has & 0x200000) != 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else
  {
    v46 = 0;
    if ((*(_WORD *)&has & 0x400) != 0)
      goto LABEL_3;
  }
  v45 = 0;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_4:
    v44 = 2654435761 * self->_totalItemCount;
    if ((*(_BYTE *)&has & 1) != 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  v44 = 0;
  if ((*(_BYTE *)&has & 1) != 0)
  {
LABEL_5:
    v43 = 2654435761 * self->_accountQuotaUsage;
    if ((*(_DWORD *)&has & 0x10000000) != 0)
      goto LABEL_6;
LABEL_15:
    v42 = 0;
    if ((*(_BYTE *)&has & 0x80) != 0)
      goto LABEL_7;
LABEL_16:
    v8 = 0;
    goto LABEL_19;
  }
LABEL_14:
  v43 = 0;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
    goto LABEL_15;
LABEL_6:
  v42 = 2654435761 * self->_isAccountDataSeparated;
  if ((*(_BYTE *)&has & 0x80) == 0)
    goto LABEL_16;
LABEL_7:
  importTime = self->_importTime;
  v5 = -importTime;
  if (importTime >= 0.0)
    v5 = self->_importTime;
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
LABEL_19:
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    v41 = 2654435761 * self->_typesOfMigratedItemsMask;
    if ((*(_DWORD *)&has & 0x8000000) != 0)
    {
LABEL_21:
      v40 = 2654435761 * self->_typesOfNonMigratedItemsMask;
      if ((*(_WORD *)&has & 0x200) != 0)
        goto LABEL_22;
      goto LABEL_27;
    }
  }
  else
  {
    v41 = 0;
    if ((*(_DWORD *)&has & 0x8000000) != 0)
      goto LABEL_21;
  }
  v40 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_22:
    v39 = 2654435761 * self->_itemsNotFoundInDB;
    if ((*(_BYTE *)&has & 2) != 0)
      goto LABEL_23;
LABEL_28:
    v38 = 0;
    if ((*(_BYTE *)&has & 4) != 0)
      goto LABEL_24;
    goto LABEL_29;
  }
LABEL_27:
  v39 = 0;
  if ((*(_BYTE *)&has & 2) == 0)
    goto LABEL_28;
LABEL_23:
  v38 = 2654435761 * self->_bouncedItemsCount;
  if ((*(_BYTE *)&has & 4) != 0)
  {
LABEL_24:
    v9 = -[NSString hash](self->_treatmentId, "hash", 2654435761 * self->_bouncedItemsMatrix);
    goto LABEL_30;
  }
LABEL_29:
  v9 = -[NSString hash](self->_treatmentId, "hash", 0);
LABEL_30:
  v10 = v9;
  v11 = -[NSString hash](self->_experimentId, "hash");
  v12 = -[NSString hash](self->_rampId, "hash");
  v13 = self->_has;
  if ((*(_BYTE *)&v13 & 8) != 0)
  {
    v14 = 2654435761 * self->_busyDateNotMigratedCount;
    if ((*(_BYTE *)&v13 & 0x10) != 0)
    {
LABEL_32:
      v15 = 2654435761 * self->_childItemsNotMigratedCount;
      if ((*(_BYTE *)&v13 & 0x40) != 0)
        goto LABEL_33;
      goto LABEL_55;
    }
  }
  else
  {
    v14 = 0;
    if ((*(_BYTE *)&v13 & 0x10) != 0)
      goto LABEL_32;
  }
  v15 = 0;
  if ((*(_BYTE *)&v13 & 0x40) != 0)
  {
LABEL_33:
    v16 = 2654435761 * self->_ignoredFromSyncItemsNotMigratedCount;
    if ((*(_WORD *)&v13 & 0x1000) != 0)
      goto LABEL_34;
    goto LABEL_56;
  }
LABEL_55:
  v16 = 0;
  if ((*(_WORD *)&v13 & 0x1000) != 0)
  {
LABEL_34:
    v17 = 2654435761 * self->_itemsReconciledInFileProvider;
    if ((*(_WORD *)&v13 & 0x100) != 0)
      goto LABEL_35;
    goto LABEL_57;
  }
LABEL_56:
  v17 = 0;
  if ((*(_WORD *)&v13 & 0x100) != 0)
  {
LABEL_35:
    v18 = 2654435761 * self->_itemsMigratedWithoutAlreadyMayExistFlag;
    if ((*(_BYTE *)&v13 & 0x20) != 0)
      goto LABEL_36;
    goto LABEL_58;
  }
LABEL_57:
  v18 = 0;
  if ((*(_BYTE *)&v13 & 0x20) != 0)
  {
LABEL_36:
    v19 = 2654435761 * self->_durationBetweenDbCreationAndMigrationStart;
    if ((*(_DWORD *)&v13 & 0x20000000) != 0)
      goto LABEL_37;
    goto LABEL_59;
  }
LABEL_58:
  v19 = 0;
  if ((*(_DWORD *)&v13 & 0x20000000) != 0)
  {
LABEL_37:
    v20 = 2654435761 * self->_isStreamResetRunning;
    if ((*(_DWORD *)&v13 & 0x40000) != 0)
      goto LABEL_38;
    goto LABEL_60;
  }
LABEL_59:
  v20 = 0;
  if ((*(_DWORD *)&v13 & 0x40000) != 0)
  {
LABEL_38:
    v21 = 2654435761 * self->_stateOfDownloadJobs;
    if ((*(_DWORD *)&v13 & 0x100000) != 0)
      goto LABEL_39;
    goto LABEL_61;
  }
LABEL_60:
  v21 = 0;
  if ((*(_DWORD *)&v13 & 0x100000) != 0)
  {
LABEL_39:
    v22 = 2654435761 * self->_stateOfUploadJobs;
    if ((*(_DWORD *)&v13 & 0x80000) != 0)
      goto LABEL_40;
    goto LABEL_62;
  }
LABEL_61:
  v22 = 0;
  if ((*(_DWORD *)&v13 & 0x80000) != 0)
  {
LABEL_40:
    v23 = 2654435761 * self->_stateOfOtherJobs;
    if ((*(_WORD *)&v13 & 0x4000) != 0)
      goto LABEL_41;
    goto LABEL_63;
  }
LABEL_62:
  v23 = 0;
  if ((*(_WORD *)&v13 & 0x4000) != 0)
  {
LABEL_41:
    v24 = 2654435761 * self->_numberOfItemsPendingReconciliation;
    if ((*(_DWORD *)&v13 & 0x20000) != 0)
      goto LABEL_42;
    goto LABEL_64;
  }
LABEL_63:
  v24 = 0;
  if ((*(_DWORD *)&v13 & 0x20000) != 0)
  {
LABEL_42:
    v25 = 2654435761 * self->_numberOfItemsPendingSelection;
    if ((*(_WORD *)&v13 & 0x8000) != 0)
      goto LABEL_43;
    goto LABEL_65;
  }
LABEL_64:
  v25 = 0;
  if ((*(_WORD *)&v13 & 0x8000) != 0)
  {
LABEL_43:
    v26 = 2654435761 * self->_numberOfItemsPendingScanningDisk;
    if ((*(_DWORD *)&v13 & 0x10000) != 0)
      goto LABEL_44;
    goto LABEL_66;
  }
LABEL_65:
  v26 = 0;
  if ((*(_DWORD *)&v13 & 0x10000) != 0)
  {
LABEL_44:
    v27 = 2654435761 * self->_numberOfItemsPendingScanningProvider;
    if ((*(_QWORD *)&v13 & 0x100000000) != 0)
      goto LABEL_45;
    goto LABEL_67;
  }
LABEL_66:
  v27 = 0;
  if ((*(_QWORD *)&v13 & 0x100000000) != 0)
  {
LABEL_45:
    v28 = 2654435761 * self->_xpcActivityRegisteredWithDuet;
    if ((*(_DWORD *)&v13 & 0x2000000) != 0)
      goto LABEL_46;
    goto LABEL_68;
  }
LABEL_67:
  v28 = 0;
  if ((*(_DWORD *)&v13 & 0x2000000) != 0)
  {
LABEL_46:
    v29 = 2654435761 * self->_xpcActivityTimeSinceLastRegistration;
    if ((*(_DWORD *)&v13 & 0x80000000) != 0)
      goto LABEL_47;
    goto LABEL_69;
  }
LABEL_68:
  v29 = 0;
  if ((*(_DWORD *)&v13 & 0x80000000) != 0)
  {
LABEL_47:
    v30 = 2654435761 * self->_xpcActivityIsActive;
    if ((*(_DWORD *)&v13 & 0x1000000) != 0)
      goto LABEL_48;
    goto LABEL_70;
  }
LABEL_69:
  v30 = 0;
  if ((*(_DWORD *)&v13 & 0x1000000) != 0)
  {
LABEL_48:
    v31 = 2654435761 * self->_xpcActivityTimeSinceLastActivation;
    if ((*(_DWORD *)&v13 & 0x400000) != 0)
      goto LABEL_49;
    goto LABEL_71;
  }
LABEL_70:
  v31 = 0;
  if ((*(_DWORD *)&v13 & 0x400000) != 0)
  {
LABEL_49:
    v32 = 2654435761 * self->_xpcActivityDasdContext;
    if ((*(_WORD *)&v13 & 0x800) != 0)
      goto LABEL_50;
    goto LABEL_72;
  }
LABEL_71:
  v32 = 0;
  if ((*(_WORD *)&v13 & 0x800) != 0)
  {
LABEL_50:
    v33 = 2654435761 * self->_itemsNotMigratedDelta;
    if ((*(_WORD *)&v13 & 0x2000) != 0)
      goto LABEL_51;
LABEL_73:
    v34 = 0;
    if ((*(_DWORD *)&v13 & 0x800000) != 0)
      goto LABEL_52;
LABEL_74:
    v35 = 0;
    return v45 ^ v46 ^ v44 ^ v43 ^ v42 ^ v8 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29 ^ v30 ^ v31 ^ v32 ^ v33 ^ v34 ^ v35;
  }
LABEL_72:
  v33 = 0;
  if ((*(_WORD *)&v13 & 0x2000) == 0)
    goto LABEL_73;
LABEL_51:
  v34 = 2654435761 * self->_itemsReconciledInFileProviderDelta;
  if ((*(_DWORD *)&v13 & 0x800000) == 0)
    goto LABEL_74;
LABEL_52:
  v35 = 2654435761 * self->_xpcActivityTimeSinceLastAbleToRun;
  return v45 ^ v46 ^ v44 ^ v43 ^ v42 ^ v8 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29 ^ v30 ^ v31 ^ v32 ^ v33 ^ v34 ^ v35;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v4 = a3;
  v5 = *((_QWORD *)v4 + 32);
  if ((v5 & 0x40000000) != 0)
  {
    self->_isSuccessful = *((_BYTE *)v4 + 250);
    *(_QWORD *)&self->_has |= 0x40000000uLL;
    v5 = *((_QWORD *)v4 + 32);
    if ((v5 & 0x400) == 0)
    {
LABEL_3:
      if ((v5 & 0x200000) == 0)
        goto LABEL_4;
      goto LABEL_45;
    }
  }
  else if ((v5 & 0x400) == 0)
  {
    goto LABEL_3;
  }
  self->_itemsNotMigratedCount = *((_QWORD *)v4 + 11);
  *(_QWORD *)&self->_has |= 0x400uLL;
  v5 = *((_QWORD *)v4 + 32);
  if ((v5 & 0x200000) == 0)
  {
LABEL_4:
    if ((v5 & 1) == 0)
      goto LABEL_5;
    goto LABEL_46;
  }
LABEL_45:
  self->_totalItemCount = *((_QWORD *)v4 + 22);
  *(_QWORD *)&self->_has |= 0x200000uLL;
  v5 = *((_QWORD *)v4 + 32);
  if ((v5 & 1) == 0)
  {
LABEL_5:
    if ((v5 & 0x10000000) == 0)
      goto LABEL_6;
    goto LABEL_47;
  }
LABEL_46:
  self->_accountQuotaUsage = *((_QWORD *)v4 + 1);
  *(_QWORD *)&self->_has |= 1uLL;
  v5 = *((_QWORD *)v4 + 32);
  if ((v5 & 0x10000000) == 0)
  {
LABEL_6:
    if ((v5 & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_48;
  }
LABEL_47:
  self->_isAccountDataSeparated = *((_BYTE *)v4 + 248);
  *(_QWORD *)&self->_has |= 0x10000000uLL;
  v5 = *((_QWORD *)v4 + 32);
  if ((v5 & 0x80) == 0)
  {
LABEL_7:
    if ((v5 & 0x4000000) == 0)
      goto LABEL_8;
    goto LABEL_49;
  }
LABEL_48:
  self->_importTime = *((double *)v4 + 8);
  *(_QWORD *)&self->_has |= 0x80uLL;
  v5 = *((_QWORD *)v4 + 32);
  if ((v5 & 0x4000000) == 0)
  {
LABEL_8:
    if ((v5 & 0x8000000) == 0)
      goto LABEL_9;
    goto LABEL_50;
  }
LABEL_49:
  self->_typesOfMigratedItemsMask = *((_DWORD *)v4 + 60);
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  v5 = *((_QWORD *)v4 + 32);
  if ((v5 & 0x8000000) == 0)
  {
LABEL_9:
    if ((v5 & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_51;
  }
LABEL_50:
  self->_typesOfNonMigratedItemsMask = *((_DWORD *)v4 + 61);
  *(_QWORD *)&self->_has |= 0x8000000uLL;
  v5 = *((_QWORD *)v4 + 32);
  if ((v5 & 0x200) == 0)
  {
LABEL_10:
    if ((v5 & 2) == 0)
      goto LABEL_11;
    goto LABEL_52;
  }
LABEL_51:
  self->_itemsNotFoundInDB = *((_QWORD *)v4 + 10);
  *(_QWORD *)&self->_has |= 0x200uLL;
  v5 = *((_QWORD *)v4 + 32);
  if ((v5 & 2) == 0)
  {
LABEL_11:
    if ((v5 & 4) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_52:
  self->_bouncedItemsCount = *((_QWORD *)v4 + 2);
  *(_QWORD *)&self->_has |= 2uLL;
  if ((*((_QWORD *)v4 + 32) & 4) != 0)
  {
LABEL_12:
    self->_bouncedItemsMatrix = *((_QWORD *)v4 + 3);
    *(_QWORD *)&self->_has |= 4uLL;
  }
LABEL_13:
  v7 = v4;
  if (*((_QWORD *)v4 + 29))
  {
    -[AppTelemetryFPFSMigrationInvestigation setTreatmentId:](self, "setTreatmentId:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 27))
  {
    -[AppTelemetryFPFSMigrationInvestigation setExperimentId:](self, "setExperimentId:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 28))
  {
    -[AppTelemetryFPFSMigrationInvestigation setRampId:](self, "setRampId:");
    v4 = v7;
  }
  v6 = *((_QWORD *)v4 + 32);
  if ((v6 & 8) != 0)
  {
    self->_busyDateNotMigratedCount = *((_QWORD *)v4 + 4);
    *(_QWORD *)&self->_has |= 8uLL;
    v6 = *((_QWORD *)v4 + 32);
    if ((v6 & 0x10) == 0)
    {
LABEL_21:
      if ((v6 & 0x40) == 0)
        goto LABEL_22;
      goto LABEL_56;
    }
  }
  else if ((v6 & 0x10) == 0)
  {
    goto LABEL_21;
  }
  self->_childItemsNotMigratedCount = *((_QWORD *)v4 + 5);
  *(_QWORD *)&self->_has |= 0x10uLL;
  v6 = *((_QWORD *)v4 + 32);
  if ((v6 & 0x40) == 0)
  {
LABEL_22:
    if ((v6 & 0x1000) == 0)
      goto LABEL_23;
    goto LABEL_57;
  }
LABEL_56:
  self->_ignoredFromSyncItemsNotMigratedCount = *((_QWORD *)v4 + 7);
  *(_QWORD *)&self->_has |= 0x40uLL;
  v6 = *((_QWORD *)v4 + 32);
  if ((v6 & 0x1000) == 0)
  {
LABEL_23:
    if ((v6 & 0x100) == 0)
      goto LABEL_24;
    goto LABEL_58;
  }
LABEL_57:
  self->_itemsReconciledInFileProvider = *((_QWORD *)v4 + 13);
  *(_QWORD *)&self->_has |= 0x1000uLL;
  v6 = *((_QWORD *)v4 + 32);
  if ((v6 & 0x100) == 0)
  {
LABEL_24:
    if ((v6 & 0x20) == 0)
      goto LABEL_25;
    goto LABEL_59;
  }
LABEL_58:
  self->_itemsMigratedWithoutAlreadyMayExistFlag = *((_QWORD *)v4 + 9);
  *(_QWORD *)&self->_has |= 0x100uLL;
  v6 = *((_QWORD *)v4 + 32);
  if ((v6 & 0x20) == 0)
  {
LABEL_25:
    if ((v6 & 0x20000000) == 0)
      goto LABEL_26;
    goto LABEL_60;
  }
LABEL_59:
  self->_durationBetweenDbCreationAndMigrationStart = *((_QWORD *)v4 + 6);
  *(_QWORD *)&self->_has |= 0x20uLL;
  v6 = *((_QWORD *)v4 + 32);
  if ((v6 & 0x20000000) == 0)
  {
LABEL_26:
    if ((v6 & 0x40000) == 0)
      goto LABEL_27;
    goto LABEL_61;
  }
LABEL_60:
  self->_isStreamResetRunning = *((_BYTE *)v4 + 249);
  *(_QWORD *)&self->_has |= 0x20000000uLL;
  v6 = *((_QWORD *)v4 + 32);
  if ((v6 & 0x40000) == 0)
  {
LABEL_27:
    if ((v6 & 0x100000) == 0)
      goto LABEL_28;
    goto LABEL_62;
  }
LABEL_61:
  self->_stateOfDownloadJobs = *((_QWORD *)v4 + 19);
  *(_QWORD *)&self->_has |= 0x40000uLL;
  v6 = *((_QWORD *)v4 + 32);
  if ((v6 & 0x100000) == 0)
  {
LABEL_28:
    if ((v6 & 0x80000) == 0)
      goto LABEL_29;
    goto LABEL_63;
  }
LABEL_62:
  self->_stateOfUploadJobs = *((_QWORD *)v4 + 21);
  *(_QWORD *)&self->_has |= 0x100000uLL;
  v6 = *((_QWORD *)v4 + 32);
  if ((v6 & 0x80000) == 0)
  {
LABEL_29:
    if ((v6 & 0x4000) == 0)
      goto LABEL_30;
    goto LABEL_64;
  }
LABEL_63:
  self->_stateOfOtherJobs = *((_QWORD *)v4 + 20);
  *(_QWORD *)&self->_has |= 0x80000uLL;
  v6 = *((_QWORD *)v4 + 32);
  if ((v6 & 0x4000) == 0)
  {
LABEL_30:
    if ((v6 & 0x20000) == 0)
      goto LABEL_31;
    goto LABEL_65;
  }
LABEL_64:
  self->_numberOfItemsPendingReconciliation = *((_QWORD *)v4 + 15);
  *(_QWORD *)&self->_has |= 0x4000uLL;
  v6 = *((_QWORD *)v4 + 32);
  if ((v6 & 0x20000) == 0)
  {
LABEL_31:
    if ((v6 & 0x8000) == 0)
      goto LABEL_32;
    goto LABEL_66;
  }
LABEL_65:
  self->_numberOfItemsPendingSelection = *((_QWORD *)v4 + 18);
  *(_QWORD *)&self->_has |= 0x20000uLL;
  v6 = *((_QWORD *)v4 + 32);
  if ((v6 & 0x8000) == 0)
  {
LABEL_32:
    if ((v6 & 0x10000) == 0)
      goto LABEL_33;
    goto LABEL_67;
  }
LABEL_66:
  self->_numberOfItemsPendingScanningDisk = *((_QWORD *)v4 + 16);
  *(_QWORD *)&self->_has |= 0x8000uLL;
  v6 = *((_QWORD *)v4 + 32);
  if ((v6 & 0x10000) == 0)
  {
LABEL_33:
    if ((v6 & 0x100000000) == 0)
      goto LABEL_34;
    goto LABEL_68;
  }
LABEL_67:
  self->_numberOfItemsPendingScanningProvider = *((_QWORD *)v4 + 17);
  *(_QWORD *)&self->_has |= 0x10000uLL;
  v6 = *((_QWORD *)v4 + 32);
  if ((v6 & 0x100000000) == 0)
  {
LABEL_34:
    if ((v6 & 0x2000000) == 0)
      goto LABEL_35;
    goto LABEL_69;
  }
LABEL_68:
  self->_xpcActivityRegisteredWithDuet = *((_BYTE *)v4 + 252);
  *(_QWORD *)&self->_has |= 0x100000000uLL;
  v6 = *((_QWORD *)v4 + 32);
  if ((v6 & 0x2000000) == 0)
  {
LABEL_35:
    if ((v6 & 0x80000000) == 0)
      goto LABEL_36;
    goto LABEL_70;
  }
LABEL_69:
  self->_xpcActivityTimeSinceLastRegistration = *((_QWORD *)v4 + 26);
  *(_QWORD *)&self->_has |= 0x2000000uLL;
  v6 = *((_QWORD *)v4 + 32);
  if ((v6 & 0x80000000) == 0)
  {
LABEL_36:
    if ((v6 & 0x1000000) == 0)
      goto LABEL_37;
    goto LABEL_71;
  }
LABEL_70:
  self->_xpcActivityIsActive = *((_BYTE *)v4 + 251);
  *(_QWORD *)&self->_has |= 0x80000000uLL;
  v6 = *((_QWORD *)v4 + 32);
  if ((v6 & 0x1000000) == 0)
  {
LABEL_37:
    if ((v6 & 0x400000) == 0)
      goto LABEL_38;
    goto LABEL_72;
  }
LABEL_71:
  self->_xpcActivityTimeSinceLastActivation = *((_QWORD *)v4 + 25);
  *(_QWORD *)&self->_has |= 0x1000000uLL;
  v6 = *((_QWORD *)v4 + 32);
  if ((v6 & 0x400000) == 0)
  {
LABEL_38:
    if ((v6 & 0x800) == 0)
      goto LABEL_39;
    goto LABEL_73;
  }
LABEL_72:
  self->_xpcActivityDasdContext = *((_QWORD *)v4 + 23);
  *(_QWORD *)&self->_has |= 0x400000uLL;
  v6 = *((_QWORD *)v4 + 32);
  if ((v6 & 0x800) == 0)
  {
LABEL_39:
    if ((v6 & 0x2000) == 0)
      goto LABEL_40;
LABEL_74:
    self->_itemsReconciledInFileProviderDelta = *((_QWORD *)v4 + 14);
    *(_QWORD *)&self->_has |= 0x2000uLL;
    if ((*((_QWORD *)v4 + 32) & 0x800000) == 0)
      goto LABEL_42;
    goto LABEL_41;
  }
LABEL_73:
  self->_itemsNotMigratedDelta = *((_QWORD *)v4 + 12);
  *(_QWORD *)&self->_has |= 0x800uLL;
  v6 = *((_QWORD *)v4 + 32);
  if ((v6 & 0x2000) != 0)
    goto LABEL_74;
LABEL_40:
  if ((v6 & 0x800000) != 0)
  {
LABEL_41:
    self->_xpcActivityTimeSinceLastAbleToRun = *((_QWORD *)v4 + 24);
    *(_QWORD *)&self->_has |= 0x800000uLL;
  }
LABEL_42:

}

- (BOOL)isSuccessful
{
  return self->_isSuccessful;
}

- (int64_t)itemsNotMigratedCount
{
  return self->_itemsNotMigratedCount;
}

- (int64_t)totalItemCount
{
  return self->_totalItemCount;
}

- (int64_t)accountQuotaUsage
{
  return self->_accountQuotaUsage;
}

- (BOOL)isAccountDataSeparated
{
  return self->_isAccountDataSeparated;
}

- (double)importTime
{
  return self->_importTime;
}

- (int)typesOfMigratedItemsMask
{
  return self->_typesOfMigratedItemsMask;
}

- (int)typesOfNonMigratedItemsMask
{
  return self->_typesOfNonMigratedItemsMask;
}

- (int64_t)itemsNotFoundInDB
{
  return self->_itemsNotFoundInDB;
}

- (int64_t)bouncedItemsCount
{
  return self->_bouncedItemsCount;
}

- (int64_t)bouncedItemsMatrix
{
  return self->_bouncedItemsMatrix;
}

- (NSString)treatmentId
{
  return self->_treatmentId;
}

- (void)setTreatmentId:(id)a3
{
  objc_storeStrong((id *)&self->_treatmentId, a3);
}

- (NSString)experimentId
{
  return self->_experimentId;
}

- (void)setExperimentId:(id)a3
{
  objc_storeStrong((id *)&self->_experimentId, a3);
}

- (NSString)rampId
{
  return self->_rampId;
}

- (void)setRampId:(id)a3
{
  objc_storeStrong((id *)&self->_rampId, a3);
}

- (int64_t)busyDateNotMigratedCount
{
  return self->_busyDateNotMigratedCount;
}

- (int64_t)childItemsNotMigratedCount
{
  return self->_childItemsNotMigratedCount;
}

- (int64_t)ignoredFromSyncItemsNotMigratedCount
{
  return self->_ignoredFromSyncItemsNotMigratedCount;
}

- (int64_t)itemsReconciledInFileProvider
{
  return self->_itemsReconciledInFileProvider;
}

- (int64_t)itemsMigratedWithoutAlreadyMayExistFlag
{
  return self->_itemsMigratedWithoutAlreadyMayExistFlag;
}

- (int64_t)durationBetweenDbCreationAndMigrationStart
{
  return self->_durationBetweenDbCreationAndMigrationStart;
}

- (BOOL)isStreamResetRunning
{
  return self->_isStreamResetRunning;
}

- (int64_t)stateOfDownloadJobs
{
  return self->_stateOfDownloadJobs;
}

- (int64_t)stateOfUploadJobs
{
  return self->_stateOfUploadJobs;
}

- (int64_t)stateOfOtherJobs
{
  return self->_stateOfOtherJobs;
}

- (int64_t)numberOfItemsPendingReconciliation
{
  return self->_numberOfItemsPendingReconciliation;
}

- (int64_t)numberOfItemsPendingSelection
{
  return self->_numberOfItemsPendingSelection;
}

- (int64_t)numberOfItemsPendingScanningDisk
{
  return self->_numberOfItemsPendingScanningDisk;
}

- (int64_t)numberOfItemsPendingScanningProvider
{
  return self->_numberOfItemsPendingScanningProvider;
}

- (BOOL)xpcActivityRegisteredWithDuet
{
  return self->_xpcActivityRegisteredWithDuet;
}

- (int64_t)xpcActivityTimeSinceLastRegistration
{
  return self->_xpcActivityTimeSinceLastRegistration;
}

- (BOOL)xpcActivityIsActive
{
  return self->_xpcActivityIsActive;
}

- (int64_t)xpcActivityTimeSinceLastActivation
{
  return self->_xpcActivityTimeSinceLastActivation;
}

- (int64_t)xpcActivityDasdContext
{
  return self->_xpcActivityDasdContext;
}

- (int64_t)itemsNotMigratedDelta
{
  return self->_itemsNotMigratedDelta;
}

- (int64_t)itemsReconciledInFileProviderDelta
{
  return self->_itemsReconciledInFileProviderDelta;
}

- (int64_t)xpcActivityTimeSinceLastAbleToRun
{
  return self->_xpcActivityTimeSinceLastAbleToRun;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_rampId, 0);
  objc_storeStrong((id *)&self->_experimentId, 0);
}

@end
