@implementation AppTelemetryFPFSMigrationNonMigratedItemInvestigation

- (void)setItemNumber:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x2000000uLL;
  self->_itemNumber = a3;
}

- (void)setHasItemNumber:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3;
}

- (BOOL)hasItemNumber
{
  return (*(_QWORD *)&self->_has >> 25) & 1;
}

- (void)setItemType:(int)a3
{
  *(_QWORD *)&self->_has |= 0x80000000000uLL;
  self->_itemType = a3;
}

- (void)setHasItemType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFF7FFFFFFFFFFLL | v3;
}

- (BOOL)hasItemType
{
  return (*(_QWORD *)&self->_has >> 43) & 1;
}

- (void)setDataProtectionClass:(int)a3
{
  *(_QWORD *)&self->_has |= 0x40000000000uLL;
  self->_dataProtectionClass = a3;
}

- (void)setHasDataProtectionClass:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFBFFFFFFFFFFLL | v3;
}

- (BOOL)hasDataProtectionClass
{
  return (*(_QWORD *)&self->_has >> 42) & 1;
}

- (void)setIsOwnedByLoggedInUser:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x800000000000000uLL;
  self->_isOwnedByLoggedInUser = a3;
}

- (void)setHasIsOwnedByLoggedInUser:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xF7FFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasIsOwnedByLoggedInUser
{
  return (*(_QWORD *)&self->_has >> 59) & 1;
}

- (void)setIsOwnedByRoot:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x1000000000000000uLL;
  self->_isOwnedByRoot = a3;
}

- (void)setHasIsOwnedByRoot:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xEFFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasIsOwnedByRoot
{
  return (*(_QWORD *)&self->_has >> 60) & 1;
}

- (void)setXattrCount:(int)a3
{
  *(_QWORD *)&self->_has |= 0x200000000000uLL;
  self->_xattrCount = a3;
}

- (void)setHasXattrCount:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFDFFFFFFFFFFFLL | v3;
}

- (BOOL)hasXattrCount
{
  return (*(_QWORD *)&self->_has >> 45) & 1;
}

- (void)setIsAppleDouble:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x100000000000000uLL;
  self->_isAppleDouble = a3;
}

- (void)setHasIsAppleDouble:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFEFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasIsAppleDouble
{
  return HIBYTE(*(_QWORD *)&self->_has) & 1;
}

- (void)setIsResourceFork:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x8000000000000000;
  self->_isResourceFork = a3;
}

- (void)setHasIsResourceFork:(BOOL)a3
{
  unint64_t v3;

  v3 = 0x8000000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = v3 & 0x8000000000000000 | *(_QWORD *)&self->_has & 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)hasIsResourceFork
{
  return *(_QWORD *)&self->_has >> 63;
}

- (void)setIsQuarantined:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x4000000000000000uLL;
  self->_isQuarantined = a3;
}

- (void)setHasIsQuarantined:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xBFFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasIsQuarantined
{
  return (*(_QWORD *)&self->_has >> 62) & 1;
}

- (BOOL)hasUtType
{
  return self->_utType != 0;
}

- (void)setIsBundleBit:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x200000000000000uLL;
  self->_isBundleBit = a3;
}

- (void)setHasIsBundleBit:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFDFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasIsBundleBit
{
  return (*(_QWORD *)&self->_has >> 57) & 1;
}

- (void)setIsSparseFile:(BOOL)a3
{
  *((_WORD *)&self->_has + 4) |= 1u;
  self->_isSparseFile = a3;
}

- (void)setHasIsSparseFile:(BOOL)a3
{
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFFFE | a3;
}

- (BOOL)hasIsSparseFile
{
  return *((_WORD *)&self->_has + 4) & 1;
}

- (void)setCompressionType:(int)a3
{
  *(_QWORD *)&self->_has |= 0x20000000000uLL;
  self->_compressionType = a3;
}

- (void)setHasCompressionType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFDFFFFFFFFFFLL | v3;
}

- (BOOL)hasCompressionType
{
  return (*(_QWORD *)&self->_has >> 41) & 1;
}

- (void)setReadErrorCode:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x100000000uLL;
  self->_readErrorCode = a3;
}

- (void)setHasReadErrorCode:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | v3;
}

- (BOOL)hasReadErrorCode
{
  return HIDWORD(*(_QWORD *)&self->_has) & 1;
}

- (void)setCloneErrorCode:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x20uLL;
  self->_cloneErrorCode = a3;
}

- (void)setHasCloneErrorCode:(BOOL)a3
{
  uint64_t v3;

  v3 = 32;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3;
}

- (BOOL)hasCloneErrorCode
{
  return (*(_QWORD *)&self->_has >> 5) & 1;
}

- (void)setSyncRootEnum:(int)a3
{
  *(_QWORD *)&self->_has |= 0x100000000000uLL;
  self->_syncRootEnum = a3;
}

- (void)setHasSyncRootEnum:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFEFFFFFFFFFFFLL | v3;
}

- (BOOL)hasSyncRootEnum
{
  return (*(_QWORD *)&self->_has >> 44) & 1;
}

- (void)setPathLength:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x10000000uLL;
  self->_pathLength = a3;
}

- (void)setHasPathLength:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3;
}

- (BOOL)hasPathLength
{
  return (*(_QWORD *)&self->_has >> 28) & 1;
}

- (void)setFileNameLength:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x200000uLL;
  self->_fileNameLength = a3;
}

- (void)setHasFileNameLength:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3;
}

- (BOOL)hasFileNameLength
{
  return (*(_QWORD *)&self->_has >> 21) & 1;
}

- (void)setStMode:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x400000000uLL;
  self->_stMode = a3;
}

- (void)setHasStMode:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3;
}

- (BOOL)hasStMode
{
  return (*(_QWORD *)&self->_has >> 34) & 1;
}

- (void)setStFlags:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x200000000uLL;
  self->_stFlags = a3;
}

- (void)setHasStFlags:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3;
}

- (BOOL)hasStFlags
{
  return (*(_QWORD *)&self->_has >> 33) & 1;
}

- (void)setHasAcls:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x40000000000000uLL;
  self->_hasAcls = a3;
}

- (void)setHasHasAcls:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFBFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasHasAcls
{
  return (*(_QWORD *)&self->_has >> 54) & 1;
}

- (void)setParentHasAcls:(BOOL)a3
{
  *((_WORD *)&self->_has + 4) |= 0x20u;
  self->_parentHasAcls = a3;
}

- (void)setHasParentHasAcls:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFFDF | v3;
}

- (BOOL)hasParentHasAcls
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 5) & 1;
}

- (void)setIsPurgable:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x2000000000000000uLL;
  self->_isPurgable = a3;
}

- (void)setHasIsPurgable:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xDFFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasIsPurgable
{
  return (*(_QWORD *)&self->_has >> 61) & 1;
}

- (void)setIsUrgent:(BOOL)a3
{
  *((_WORD *)&self->_has + 4) |= 4u;
  self->_isUrgent = a3;
}

- (void)setHasIsUrgent:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFFFB | v3;
}

- (BOOL)hasIsUrgent
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 2) & 1;
}

- (void)setIsUnderDirStatFolder:(BOOL)a3
{
  *((_WORD *)&self->_has + 4) |= 2u;
  self->_isUnderDirStatFolder = a3;
}

- (void)setHasIsUnderDirStatFolder:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFFFD | v3;
}

- (BOOL)hasIsUnderDirStatFolder
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 1) & 1;
}

- (void)setIsFileNameNonAscii:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x400000000000000uLL;
  self->_isFileNameNonAscii = a3;
}

- (void)setHasIsFileNameNonAscii:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFBFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasIsFileNameNonAscii
{
  return (*(_QWORD *)&self->_has >> 58) & 1;
}

- (BOOL)hasFinderInfoFlagsBase64
{
  return self->_finderInfoFlagsBase64 != 0;
}

- (void)setHasMoreLinks:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x1000000uLL;
  self->_hasMoreLinks = a3;
}

- (void)setHasHasMoreLinks:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3;
}

- (BOOL)hasHasMoreLinks
{
  return (*(_QWORD *)&self->_has >> 24) & 1;
}

- (void)setFsGenCount:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x400000uLL;
  self->_fsGenCount = a3;
}

- (void)setHasFsGenCount:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3;
}

- (BOOL)hasFsGenCount
{
  return (*(_QWORD *)&self->_has >> 22) & 1;
}

- (void)setDbGenCount:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x8000uLL;
  self->_dbGenCount = a3;
}

- (void)setHasDbGenCount:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3;
}

- (BOOL)hasDbGenCount
{
  return (*(_QWORD *)&self->_has >> 15) & 1;
}

- (void)setHasLocalChanges:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x80000000000000uLL;
  self->_hasLocalChanges = a3;
}

- (void)setHasHasLocalChanges:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFF7FFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasHasLocalChanges
{
  return (*(_QWORD *)&self->_has >> 55) & 1;
}

- (void)setDoGenCountsMatchInFileId:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x10000000000000uLL;
  self->_doGenCountsMatchInFileId = a3;
}

- (void)setHasDoGenCountsMatchInFileId:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFEFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasDoGenCountsMatchInFileId
{
  return (*(_QWORD *)&self->_has >> 52) & 1;
}

- (BOOL)hasFileNameExtension
{
  return self->_fileNameExtension != 0;
}

- (void)setPathDepth:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x8000000uLL;
  self->_pathDepth = a3;
}

- (void)setHasPathDepth:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3;
}

- (BOOL)hasPathDepth
{
  return (*(_QWORD *)&self->_has >> 27) & 1;
}

- (void)setXattrHasDemotion:(BOOL)a3
{
  *((_WORD *)&self->_has + 4) |= 0x200u;
  self->_xattrHasDemotion = a3;
}

- (void)setHasXattrHasDemotion:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFDFF | v3;
}

- (BOOL)hasXattrHasDemotion
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 9) & 1;
}

- (void)setXattrHasPromotion:(BOOL)a3
{
  *((_WORD *)&self->_has + 4) |= 0x400u;
  self->_xattrHasPromotion = a3;
}

- (void)setHasXattrHasPromotion:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFBFF | v3;
}

- (BOOL)hasXattrHasPromotion
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 10) & 1;
}

- (BOOL)hasDbErrorDomain
{
  return self->_dbErrorDomain != 0;
}

- (void)setDbErrorCode:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x100uLL;
  self->_dbErrorCode = a3;
}

- (void)setHasDbErrorCode:(BOOL)a3
{
  uint64_t v3;

  v3 = 256;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3;
}

- (BOOL)hasDbErrorCode
{
  return (*(_QWORD *)&self->_has >> 8) & 1;
}

- (void)setDbCapabilities:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x40uLL;
  self->_dbCapabilities = a3;
}

- (void)setHasDbCapabilities:(BOOL)a3
{
  uint64_t v3;

  v3 = 64;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3;
}

- (BOOL)hasDbCapabilities
{
  return (*(_QWORD *)&self->_has >> 6) & 1;
}

- (void)setDbTransferState:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x20000uLL;
  self->_dbTransferState = a3;
}

- (void)setHasDbTransferState:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3;
}

- (BOOL)hasDbTransferState
{
  return (*(_QWORD *)&self->_has >> 17) & 1;
}

- (void)setDbSharingState:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x10000uLL;
  self->_dbSharingState = a3;
}

- (void)setHasDbSharingState:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3;
}

- (BOOL)hasDbSharingState
{
  return (*(_QWORD *)&self->_has >> 16) & 1;
}

- (void)setDbIsApplibrary:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x2000000000000uLL;
  self->_dbIsApplibrary = a3;
}

- (void)setHasDbIsApplibrary:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFDFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasDbIsApplibrary
{
  return (*(_QWORD *)&self->_has >> 49) & 1;
}

- (void)setDbEffectiveContentPolicy:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x80uLL;
  self->_dbEffectiveContentPolicy = a3;
}

- (void)setHasDbEffectiveContentPolicy:(BOOL)a3
{
  uint64_t v3;

  v3 = 128;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3;
}

- (BOOL)hasDbEffectiveContentPolicy
{
  return (*(_QWORD *)&self->_has >> 7) & 1;
}

- (void)setDbIsPackage:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x4000000000000uLL;
  self->_dbIsPackage = a3;
}

- (void)setHasDbIsPackage:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFBFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasDbIsPackage
{
  return (*(_QWORD *)&self->_has >> 50) & 1;
}

- (void)setDbFsContentStatus:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x1000uLL;
  self->_dbFsContentStatus = a3;
}

- (void)setHasDbFsContentStatus:(BOOL)a3
{
  uint64_t v3;

  v3 = 4096;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3;
}

- (BOOL)hasDbFsContentStatus
{
  return (*(_QWORD *)&self->_has >> 12) & 1;
}

- (void)setDbFpContentStatus:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x200uLL;
  self->_dbFpContentStatus = a3;
}

- (void)setHasDbFpContentStatus:(BOOL)a3
{
  uint64_t v3;

  v3 = 512;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3;
}

- (BOOL)hasDbFpContentStatus
{
  return (*(_QWORD *)&self->_has >> 9) & 1;
}

- (void)setDbFsDeletionStatus:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x2000uLL;
  self->_dbFsDeletionStatus = a3;
}

- (void)setHasDbFsDeletionStatus:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3;
}

- (BOOL)hasDbFsDeletionStatus
{
  return (*(_QWORD *)&self->_has >> 13) & 1;
}

- (void)setDbFpDeletionStatus:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x400uLL;
  self->_dbFpDeletionStatus = a3;
}

- (void)setHasDbFpDeletionStatus:(BOOL)a3
{
  uint64_t v3;

  v3 = 1024;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3;
}

- (BOOL)hasDbFpDeletionStatus
{
  return (*(_QWORD *)&self->_has >> 10) & 1;
}

- (void)setDbFsImportStatus:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x4000uLL;
  self->_dbFsImportStatus = a3;
}

- (void)setHasDbFsImportStatus:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3;
}

- (BOOL)hasDbFsImportStatus
{
  return (*(_QWORD *)&self->_has >> 14) & 1;
}

- (void)setDbFpImportStatus:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x800uLL;
  self->_dbFpImportStatus = a3;
}

- (void)setHasDbFpImportStatus:(BOOL)a3
{
  uint64_t v3;

  v3 = 2048;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3;
}

- (BOOL)hasDbFpImportStatus
{
  return (*(_QWORD *)&self->_has >> 11) & 1;
}

- (void)setDbIsSuper:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x8000000000000uLL;
  self->_dbIsSuper = a3;
}

- (void)setHasDbIsSuper:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFF7FFFFFFFFFFFFLL | v3;
}

- (BOOL)hasDbIsSuper
{
  return (*(_QWORD *)&self->_has >> 51) & 1;
}

- (void)setGencountDiff:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x800000uLL;
  self->_gencountDiff = a3;
}

- (void)setHasGencountDiff:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3;
}

- (BOOL)hasGencountDiff
{
  return (*(_QWORD *)&self->_has >> 23) & 1;
}

- (void)setParentMatches:(BOOL)a3
{
  *((_WORD *)&self->_has + 4) |= 0x40u;
  self->_parentMatches = a3;
}

- (void)setHasParentMatches:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFFBF | v3;
}

- (BOOL)hasParentMatches
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 6) & 1;
}

- (void)setAppLibraryMatches:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x800000000000uLL;
  self->_appLibraryMatches = a3;
}

- (void)setHasAppLibraryMatches:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFF7FFFFFFFFFFFLL | v3;
}

- (BOOL)hasAppLibraryMatches
{
  return (*(_QWORD *)&self->_has >> 47) & 1;
}

- (void)setMTimeBeforeMigrationStarted:(BOOL)a3
{
  *((_WORD *)&self->_has + 4) |= 8u;
  self->_mTimeBeforeMigrationStarted = a3;
}

- (void)setHasMTimeBeforeMigrationStarted:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFFF7 | v3;
}

- (BOOL)hasMTimeBeforeMigrationStarted
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 3) & 1;
}

- (void)setDocIDMatches:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x20000000000000uLL;
  self->_docIDMatches = a3;
}

- (void)setHasDocIDMatches:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFDFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasDocIDMatches
{
  return (*(_QWORD *)&self->_has >> 53) & 1;
}

- (void)setMTime:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  self->_mTime = a3;
}

- (void)setHasMTime:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3;
}

- (BOOL)hasMTime
{
  return (*(_QWORD *)&self->_has >> 26) & 1;
}

- (void)setBTime:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x10uLL;
  self->_bTime = a3;
}

- (void)setHasBTime:(BOOL)a3
{
  uint64_t v3;

  v3 = 16;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3;
}

- (BOOL)hasBTime
{
  return (*(_QWORD *)&self->_has >> 4) & 1;
}

- (void)setBTimeIsBusy:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x1000000000000uLL;
  self->_bTimeIsBusy = a3;
}

- (void)setHasBTimeIsBusy:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFEFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasBTimeIsBusy
{
  return HIWORD(*(_QWORD *)&self->_has) & 1;
}

- (void)setXattrHasBeforeBounce:(BOOL)a3
{
  *((_WORD *)&self->_has + 4) |= 0x100u;
  self->_xattrHasBeforeBounce = a3;
}

- (void)setHasXattrHasBeforeBounce:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFEFF | v3;
}

- (BOOL)hasXattrHasBeforeBounce
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 8) & 1;
}

- (BOOL)hasNameUnicodeNorm
{
  return self->_nameUnicodeNorm != 0;
}

- (void)setNameIsTrashed:(BOOL)a3
{
  *((_WORD *)&self->_has + 4) |= 0x10u;
  self->_nameIsTrashed = a3;
}

- (void)setHasNameIsTrashed:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFFEF | v3;
}

- (BOOL)hasNameIsTrashed
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 4) & 1;
}

- (void)setSysPageSize:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x8000000000uLL;
  self->_sysPageSize = a3;
}

- (void)setHasSysPageSize:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFF7FFFFFFFFFLL | v3;
}

- (BOOL)hasSysPageSize
{
  return (*(_QWORD *)&self->_has >> 39) & 1;
}

- (void)setSysUID:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x10000000000uLL;
  self->_sysUID = a3;
}

- (void)setHasSysUID:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFEFFFFFFFFFFLL | v3;
}

- (BOOL)hasSysUID
{
  return (*(_QWORD *)&self->_has >> 40) & 1;
}

- (void)setSysDocIDResolutionOK:(BOOL)a3
{
  *((_WORD *)&self->_has + 4) |= 0x80u;
  self->_sysDocIDResolutionOK = a3;
}

- (void)setHasSysDocIDResolutionOK:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFF7F | v3;
}

- (BOOL)hasSysDocIDResolutionOK
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 7) & 1;
}

- (void)setPurgeGenCount:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x40000000uLL;
  self->_purgeGenCount = a3;
}

- (void)setHasPurgeGenCount:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3;
}

- (BOOL)hasPurgeGenCount
{
  return (*(_QWORD *)&self->_has >> 30) & 1;
}

- (void)setPurgeATime:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x20000000uLL;
  self->_purgeATime = a3;
}

- (void)setHasPurgeATime:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3;
}

- (BOOL)hasPurgeATime
{
  return (*(_QWORD *)&self->_has >> 29) & 1;
}

- (void)setPurgeSyncRoot:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x80000000uLL;
  self->_purgeSyncRoot = a3;
}

- (void)setHasPurgeSyncRoot:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3;
}

- (BOOL)hasPurgeSyncRoot
{
  return (*(_QWORD *)&self->_has >> 31) & 1;
}

- (void)setDiagFailuresBitmap:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x80000uLL;
  self->_diagFailuresBitmap = a3;
}

- (void)setHasDiagFailuresBitmap:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3;
}

- (BOOL)hasDiagFailuresBitmap
{
  return (*(_QWORD *)&self->_has >> 19) & 1;
}

- (void)setDiagErrorCode:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x40000uLL;
  self->_diagErrorCode = a3;
}

- (void)setHasDiagErrorCode:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3;
}

- (BOOL)hasDiagErrorCode
{
  return (*(_QWORD *)&self->_has >> 18) & 1;
}

- (void)setDiagUnderlyingErrorCode:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x100000uLL;
  self->_diagUnderlyingErrorCode = a3;
}

- (void)setHasDiagUnderlyingErrorCode:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3;
}

- (BOOL)hasDiagUnderlyingErrorCode
{
  return (*(_QWORD *)&self->_has >> 20) & 1;
}

- (BOOL)hasDiagErrorDomain
{
  return self->_diagErrorDomain != 0;
}

- (BOOL)hasDiagUnderlyingErrorDomain
{
  return self->_diagUnderlyingErrorDomain != 0;
}

- (void)setApfsAvailableSpace:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 1uLL;
  self->_apfsAvailableSpace = a3;
}

- (void)setHasApfsAvailableSpace:(BOOL)a3
{
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3;
}

- (BOOL)hasApfsAvailableSpace
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setApfsFlags:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 4uLL;
  self->_apfsFlags = a3;
}

- (void)setHasApfsFlags:(BOOL)a3
{
  uint64_t v3;

  v3 = 4;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3;
}

- (BOOL)hasApfsFlags
{
  return (*(_QWORD *)&self->_has >> 2) & 1;
}

- (void)setApfsBlockSize:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 2uLL;
  self->_apfsBlockSize = a3;
}

- (void)setHasApfsBlockSize:(BOOL)a3
{
  uint64_t v3;

  v3 = 2;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3;
}

- (BOOL)hasApfsBlockSize
{
  return (*(_QWORD *)&self->_has >> 1) & 1;
}

- (void)setApfsRole:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 8uLL;
  self->_apfsRole = a3;
}

- (void)setHasApfsRole:(BOOL)a3
{
  uint64_t v3;

  v3 = 8;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3;
}

- (BOOL)hasApfsRole
{
  return (*(_QWORD *)&self->_has >> 3) & 1;
}

- (void)setApfsEncrypted:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x400000000000uLL;
  self->_apfsEncrypted = a3;
}

- (void)setHasApfsEncrypted:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFBFFFFFFFFFFFLL | v3;
}

- (BOOL)hasApfsEncrypted
{
  return (*(_QWORD *)&self->_has >> 46) & 1;
}

- (void)setStatDocID:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x1000000000uLL;
  self->_statDocID = a3;
}

- (void)setHasStatDocID:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFEFFFFFFFFFLL | v3;
}

- (BOOL)hasStatDocID
{
  return (*(_QWORD *)&self->_has >> 36) & 1;
}

- (void)setStatLogicalSize:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x2000000000uLL;
  self->_statLogicalSize = a3;
}

- (void)setHasStatLogicalSize:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFDFFFFFFFFFLL | v3;
}

- (BOOL)hasStatLogicalSize
{
  return (*(_QWORD *)&self->_has >> 37) & 1;
}

- (void)setStatPhysicalSize:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x4000000000uLL;
  self->_statPhysicalSize = a3;
}

- (void)setHasStatPhysicalSize:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFBFFFFFFFFFLL | v3;
}

- (BOOL)hasStatPhysicalSize
{
  return (*(_QWORD *)&self->_has >> 38) & 1;
}

- (void)setStatDirEntryCount:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x800000000uLL;
  self->_statDirEntryCount = a3;
}

- (void)setHasStatDirEntryCount:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFF7FFFFFFFFLL | v3;
}

- (BOOL)hasStatDirEntryCount
{
  return (*(_QWORD *)&self->_has >> 35) & 1;
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
  v8.super_class = (Class)AppTelemetryFPFSMigrationNonMigratedItemInvestigation;
  -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  $2082CF93F90B3E6732D9C5A72A2BCBB8 *p_has;
  uint64_t has;
  void *v6;
  NSString *utType;
  uint64_t v8;
  void *v9;
  __int16 v10;
  void *v11;
  NSString *finderInfoFlagsBase64;
  $2082CF93F90B3E6732D9C5A72A2BCBB8 *v13;
  uint64_t v14;
  void *v15;
  NSString *fileNameExtension;
  void *v17;
  __int16 v18;
  void *v19;
  void *v20;
  NSString *dbErrorDomain;
  uint64_t v22;
  void *v23;
  __int16 v24;
  void *v25;
  NSString *nameUnicodeNorm;
  $2082CF93F90B3E6732D9C5A72A2BCBB8 *v27;
  __int16 v28;
  uint64_t v29;
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
  NSString *diagErrorDomain;
  NSString *diagUnderlyingErrorDomain;
  $2082CF93F90B3E6732D9C5A72A2BCBB8 *v82;
  uint64_t v83;
  void *v84;
  id v85;
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

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  p_has = &self->_has;
  has = (uint64_t)self->_has;
  if ((has & 0x2000000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_itemNumber);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("itemNumber"));

    has = *(_QWORD *)p_has;
    if ((*(_QWORD *)p_has & 0x80000000000) == 0)
    {
LABEL_3:
      if ((has & 0x40000000000) == 0)
        goto LABEL_4;
      goto LABEL_81;
    }
  }
  else if ((has & 0x80000000000) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_itemType);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("itemType"));

  has = (uint64_t)self->_has;
  if ((has & 0x40000000000) == 0)
  {
LABEL_4:
    if ((has & 0x800000000000000) == 0)
      goto LABEL_5;
    goto LABEL_82;
  }
LABEL_81:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_dataProtectionClass);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("dataProtectionClass"));

  has = (uint64_t)self->_has;
  if ((has & 0x800000000000000) == 0)
  {
LABEL_5:
    if ((has & 0x1000000000000000) == 0)
      goto LABEL_6;
    goto LABEL_83;
  }
LABEL_82:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isOwnedByLoggedInUser);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("isOwnedByLoggedInUser"));

  has = (uint64_t)self->_has;
  if ((has & 0x1000000000000000) == 0)
  {
LABEL_6:
    if ((has & 0x200000000000) == 0)
      goto LABEL_7;
    goto LABEL_84;
  }
LABEL_83:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isOwnedByRoot);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v34, CFSTR("isOwnedByRoot"));

  has = (uint64_t)self->_has;
  if ((has & 0x200000000000) == 0)
  {
LABEL_7:
    if ((has & 0x100000000000000) == 0)
      goto LABEL_8;
    goto LABEL_85;
  }
LABEL_84:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_xattrCount);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v35, CFSTR("xattrCount"));

  has = (uint64_t)self->_has;
  if ((has & 0x100000000000000) == 0)
  {
LABEL_8:
    if ((has & 0x8000000000000000) == 0)
      goto LABEL_9;
    goto LABEL_86;
  }
LABEL_85:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isAppleDouble);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v36, CFSTR("isAppleDouble"));

  has = (uint64_t)self->_has;
  if ((has & 0x8000000000000000) == 0)
  {
LABEL_9:
    if ((has & 0x4000000000000000) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_86:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isResourceFork);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v37, CFSTR("isResourceFork"));

  if ((*(_QWORD *)&self->_has & 0x4000000000000000) != 0)
  {
LABEL_10:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isQuarantined);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("isQuarantined"));

  }
LABEL_11:
  utType = self->_utType;
  if (utType)
    objc_msgSend(v3, "setObject:forKey:", utType, CFSTR("utType"));
  v8 = (uint64_t)self->_has;
  if ((v8 & 0x200000000000000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isBundleBit);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("isBundleBit"));

    v8 = (uint64_t)self->_has;
  }
  v10 = *((_WORD *)&self->_has + 4);
  if ((v10 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isSparseFile);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v38, CFSTR("isSparseFile"));

    v8 = (uint64_t)self->_has;
    v10 = *((_WORD *)&self->_has + 4);
    if ((v8 & 0x20000000000) == 0)
    {
LABEL_17:
      if ((v8 & 0x100000000) == 0)
        goto LABEL_18;
      goto LABEL_90;
    }
  }
  else if ((v8 & 0x20000000000) == 0)
  {
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_compressionType);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v39, CFSTR("compressionType"));

  v8 = (uint64_t)self->_has;
  v10 = *((_WORD *)&self->_has + 4);
  if ((v8 & 0x100000000) == 0)
  {
LABEL_18:
    if ((v8 & 0x20) == 0)
      goto LABEL_19;
    goto LABEL_91;
  }
LABEL_90:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_readErrorCode);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v40, CFSTR("readErrorCode"));

  v8 = (uint64_t)self->_has;
  v10 = *((_WORD *)&self->_has + 4);
  if ((v8 & 0x20) == 0)
  {
LABEL_19:
    if ((v8 & 0x100000000000) == 0)
      goto LABEL_20;
    goto LABEL_92;
  }
LABEL_91:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_cloneErrorCode);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v41, CFSTR("cloneErrorCode"));

  v8 = (uint64_t)self->_has;
  v10 = *((_WORD *)&self->_has + 4);
  if ((v8 & 0x100000000000) == 0)
  {
LABEL_20:
    if ((v8 & 0x10000000) == 0)
      goto LABEL_21;
    goto LABEL_93;
  }
LABEL_92:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_syncRootEnum);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v42, CFSTR("syncRootEnum"));

  v8 = (uint64_t)self->_has;
  v10 = *((_WORD *)&self->_has + 4);
  if ((v8 & 0x10000000) == 0)
  {
LABEL_21:
    if ((v8 & 0x200000) == 0)
      goto LABEL_22;
    goto LABEL_94;
  }
LABEL_93:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_pathLength);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v43, CFSTR("pathLength"));

  v8 = (uint64_t)self->_has;
  v10 = *((_WORD *)&self->_has + 4);
  if ((v8 & 0x200000) == 0)
  {
LABEL_22:
    if ((v8 & 0x400000000) == 0)
      goto LABEL_23;
    goto LABEL_95;
  }
LABEL_94:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_fileNameLength);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v44, CFSTR("fileNameLength"));

  v8 = (uint64_t)self->_has;
  v10 = *((_WORD *)&self->_has + 4);
  if ((v8 & 0x400000000) == 0)
  {
LABEL_23:
    if ((v8 & 0x200000000) == 0)
      goto LABEL_24;
    goto LABEL_96;
  }
LABEL_95:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_stMode);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v45, CFSTR("st_mode"));

  v8 = (uint64_t)self->_has;
  v10 = *((_WORD *)&self->_has + 4);
  if ((v8 & 0x200000000) == 0)
  {
LABEL_24:
    if ((v8 & 0x40000000000000) == 0)
      goto LABEL_25;
    goto LABEL_97;
  }
LABEL_96:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_stFlags);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v46, CFSTR("st_flags"));

  v8 = (uint64_t)self->_has;
  v10 = *((_WORD *)&self->_has + 4);
  if ((v8 & 0x40000000000000) == 0)
  {
LABEL_25:
    if ((v10 & 0x20) == 0)
      goto LABEL_26;
    goto LABEL_98;
  }
LABEL_97:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_hasAcls);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v47, CFSTR("hasAcls"));

  v8 = (uint64_t)self->_has;
  v10 = *((_WORD *)&self->_has + 4);
  if ((v10 & 0x20) == 0)
  {
LABEL_26:
    if ((v8 & 0x2000000000000000) == 0)
      goto LABEL_27;
    goto LABEL_99;
  }
LABEL_98:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_parentHasAcls);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v48, CFSTR("parentHasAcls"));

  v8 = (uint64_t)self->_has;
  v10 = *((_WORD *)&self->_has + 4);
  if ((v8 & 0x2000000000000000) == 0)
  {
LABEL_27:
    if ((v10 & 4) == 0)
      goto LABEL_28;
    goto LABEL_100;
  }
LABEL_99:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isPurgable);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v49, CFSTR("isPurgable"));

  v8 = (uint64_t)self->_has;
  v10 = *((_WORD *)&self->_has + 4);
  if ((v10 & 4) == 0)
  {
LABEL_28:
    if ((v10 & 2) == 0)
      goto LABEL_29;
    goto LABEL_101;
  }
LABEL_100:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isUrgent);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v50, CFSTR("isUrgent"));

  v8 = (uint64_t)self->_has;
  if ((*((_WORD *)&self->_has + 4) & 2) == 0)
  {
LABEL_29:
    if ((v8 & 0x400000000000000) == 0)
      goto LABEL_31;
    goto LABEL_30;
  }
LABEL_101:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isUnderDirStatFolder);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v51, CFSTR("isUnderDirStatFolder"));

  if ((*(_QWORD *)&self->_has & 0x400000000000000) != 0)
  {
LABEL_30:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isFileNameNonAscii);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("isFileNameNonAscii"));

  }
LABEL_31:
  finderInfoFlagsBase64 = self->_finderInfoFlagsBase64;
  if (finderInfoFlagsBase64)
    objc_msgSend(v3, "setObject:forKey:", finderInfoFlagsBase64, CFSTR("finderInfoFlagsBase64"));
  v13 = &self->_has;
  v14 = (uint64_t)self->_has;
  if ((v14 & 0x1000000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_hasMoreLinks);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v52, CFSTR("hasMoreLinks"));

    v14 = *(_QWORD *)v13;
    if ((*(_QWORD *)v13 & 0x400000) == 0)
    {
LABEL_35:
      if ((v14 & 0x8000) == 0)
        goto LABEL_36;
      goto LABEL_105;
    }
  }
  else if ((v14 & 0x400000) == 0)
  {
    goto LABEL_35;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_fsGenCount);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v53, CFSTR("fsGenCount"));

  v14 = (uint64_t)self->_has;
  if ((v14 & 0x8000) == 0)
  {
LABEL_36:
    if ((v14 & 0x80000000000000) == 0)
      goto LABEL_37;
    goto LABEL_106;
  }
LABEL_105:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_dbGenCount);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v54, CFSTR("dbGenCount"));

  v14 = (uint64_t)self->_has;
  if ((v14 & 0x80000000000000) == 0)
  {
LABEL_37:
    if ((v14 & 0x10000000000000) == 0)
      goto LABEL_39;
    goto LABEL_38;
  }
LABEL_106:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_hasLocalChanges);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v55, CFSTR("hasLocalChanges"));

  if ((*(_QWORD *)&self->_has & 0x10000000000000) != 0)
  {
LABEL_38:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_doGenCountsMatchInFileId);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("doGenCountsMatchInFileId"));

  }
LABEL_39:
  fileNameExtension = self->_fileNameExtension;
  if (fileNameExtension)
    objc_msgSend(v3, "setObject:forKey:", fileNameExtension, CFSTR("fileNameExtension"));
  if ((*(_QWORD *)&self->_has & 0x8000000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_pathDepth);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("pathDepth"));

  }
  v18 = *((_WORD *)&self->_has + 4);
  if ((v18 & 0x200) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_xattrHasDemotion);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("xattrHasDemotion"));

    v18 = *((_WORD *)&self->_has + 4);
  }
  if ((v18 & 0x400) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_xattrHasPromotion);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("xattrHasPromotion"));

  }
  dbErrorDomain = self->_dbErrorDomain;
  if (dbErrorDomain)
    objc_msgSend(v3, "setObject:forKey:", dbErrorDomain, CFSTR("dbErrorDomain"));
  v22 = (uint64_t)self->_has;
  if ((v22 & 0x100) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_dbErrorCode);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("dbErrorCode"));

    v22 = (uint64_t)self->_has;
  }
  v24 = *((_WORD *)&self->_has + 4);
  if ((v22 & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_dbCapabilities);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v56, CFSTR("dbCapabilities"));

    v22 = (uint64_t)self->_has;
    v24 = *((_WORD *)&self->_has + 4);
    if ((v22 & 0x20000) == 0)
    {
LABEL_53:
      if ((v22 & 0x10000) == 0)
        goto LABEL_54;
      goto LABEL_110;
    }
  }
  else if ((v22 & 0x20000) == 0)
  {
    goto LABEL_53;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_dbTransferState);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v57, CFSTR("dbTransferState"));

  v22 = (uint64_t)self->_has;
  v24 = *((_WORD *)&self->_has + 4);
  if ((v22 & 0x10000) == 0)
  {
LABEL_54:
    if ((v22 & 0x2000000000000) == 0)
      goto LABEL_55;
    goto LABEL_111;
  }
LABEL_110:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_dbSharingState);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v58, CFSTR("dbSharingState"));

  v22 = (uint64_t)self->_has;
  v24 = *((_WORD *)&self->_has + 4);
  if ((v22 & 0x2000000000000) == 0)
  {
LABEL_55:
    if ((v22 & 0x80) == 0)
      goto LABEL_56;
    goto LABEL_112;
  }
LABEL_111:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_dbIsApplibrary);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v59, CFSTR("dbIsApplibrary"));

  v22 = (uint64_t)self->_has;
  v24 = *((_WORD *)&self->_has + 4);
  if ((v22 & 0x80) == 0)
  {
LABEL_56:
    if ((v22 & 0x4000000000000) == 0)
      goto LABEL_57;
    goto LABEL_113;
  }
LABEL_112:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_dbEffectiveContentPolicy);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v60, CFSTR("dbEffectiveContentPolicy"));

  v22 = (uint64_t)self->_has;
  v24 = *((_WORD *)&self->_has + 4);
  if ((v22 & 0x4000000000000) == 0)
  {
LABEL_57:
    if ((v22 & 0x1000) == 0)
      goto LABEL_58;
    goto LABEL_114;
  }
LABEL_113:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_dbIsPackage);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v61, CFSTR("dbIsPackage"));

  v22 = (uint64_t)self->_has;
  v24 = *((_WORD *)&self->_has + 4);
  if ((v22 & 0x1000) == 0)
  {
LABEL_58:
    if ((v22 & 0x200) == 0)
      goto LABEL_59;
    goto LABEL_115;
  }
LABEL_114:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_dbFsContentStatus);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v62, CFSTR("dbFsContentStatus"));

  v22 = (uint64_t)self->_has;
  v24 = *((_WORD *)&self->_has + 4);
  if ((v22 & 0x200) == 0)
  {
LABEL_59:
    if ((v22 & 0x2000) == 0)
      goto LABEL_60;
    goto LABEL_116;
  }
LABEL_115:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_dbFpContentStatus);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v63, CFSTR("dbFpContentStatus"));

  v22 = (uint64_t)self->_has;
  v24 = *((_WORD *)&self->_has + 4);
  if ((v22 & 0x2000) == 0)
  {
LABEL_60:
    if ((v22 & 0x400) == 0)
      goto LABEL_61;
    goto LABEL_117;
  }
LABEL_116:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_dbFsDeletionStatus);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v64, CFSTR("dbFsDeletionStatus"));

  v22 = (uint64_t)self->_has;
  v24 = *((_WORD *)&self->_has + 4);
  if ((v22 & 0x400) == 0)
  {
LABEL_61:
    if ((v22 & 0x4000) == 0)
      goto LABEL_62;
    goto LABEL_118;
  }
LABEL_117:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_dbFpDeletionStatus);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v65, CFSTR("dbFpDeletionStatus"));

  v22 = (uint64_t)self->_has;
  v24 = *((_WORD *)&self->_has + 4);
  if ((v22 & 0x4000) == 0)
  {
LABEL_62:
    if ((v22 & 0x800) == 0)
      goto LABEL_63;
    goto LABEL_119;
  }
LABEL_118:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_dbFsImportStatus);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v66, CFSTR("dbFsImportStatus"));

  v22 = (uint64_t)self->_has;
  v24 = *((_WORD *)&self->_has + 4);
  if ((v22 & 0x800) == 0)
  {
LABEL_63:
    if ((v22 & 0x8000000000000) == 0)
      goto LABEL_64;
    goto LABEL_120;
  }
LABEL_119:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_dbFpImportStatus);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v67, CFSTR("dbFpImportStatus"));

  v22 = (uint64_t)self->_has;
  v24 = *((_WORD *)&self->_has + 4);
  if ((v22 & 0x8000000000000) == 0)
  {
LABEL_64:
    if ((v22 & 0x800000) == 0)
      goto LABEL_65;
    goto LABEL_121;
  }
LABEL_120:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_dbIsSuper);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v68, CFSTR("dbIsSuper"));

  v22 = (uint64_t)self->_has;
  v24 = *((_WORD *)&self->_has + 4);
  if ((v22 & 0x800000) == 0)
  {
LABEL_65:
    if ((v24 & 0x40) == 0)
      goto LABEL_66;
    goto LABEL_122;
  }
LABEL_121:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_gencountDiff);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v69, CFSTR("gencountDiff"));

  v22 = (uint64_t)self->_has;
  v24 = *((_WORD *)&self->_has + 4);
  if ((v24 & 0x40) == 0)
  {
LABEL_66:
    if ((v22 & 0x800000000000) == 0)
      goto LABEL_67;
    goto LABEL_123;
  }
LABEL_122:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_parentMatches);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v70, CFSTR("parentMatches"));

  v22 = (uint64_t)self->_has;
  v24 = *((_WORD *)&self->_has + 4);
  if ((v22 & 0x800000000000) == 0)
  {
LABEL_67:
    if ((v24 & 8) == 0)
      goto LABEL_68;
    goto LABEL_124;
  }
LABEL_123:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_appLibraryMatches);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v71, CFSTR("appLibraryMatches"));

  v22 = (uint64_t)self->_has;
  v24 = *((_WORD *)&self->_has + 4);
  if ((v24 & 8) == 0)
  {
LABEL_68:
    if ((v22 & 0x20000000000000) == 0)
      goto LABEL_69;
    goto LABEL_125;
  }
LABEL_124:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_mTimeBeforeMigrationStarted);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v72, CFSTR("mTimeBeforeMigrationStarted"));

  v22 = (uint64_t)self->_has;
  v24 = *((_WORD *)&self->_has + 4);
  if ((v22 & 0x20000000000000) == 0)
  {
LABEL_69:
    if ((v22 & 0x4000000) == 0)
      goto LABEL_70;
    goto LABEL_126;
  }
LABEL_125:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_docIDMatches);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v73, CFSTR("docIDMatches"));

  v22 = (uint64_t)self->_has;
  v24 = *((_WORD *)&self->_has + 4);
  if ((v22 & 0x4000000) == 0)
  {
LABEL_70:
    if ((v22 & 0x10) == 0)
      goto LABEL_71;
    goto LABEL_127;
  }
LABEL_126:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_mTime);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v74, CFSTR("mTime"));

  v22 = (uint64_t)self->_has;
  v24 = *((_WORD *)&self->_has + 4);
  if ((v22 & 0x10) == 0)
  {
LABEL_71:
    if ((v22 & 0x1000000000000) == 0)
      goto LABEL_72;
    goto LABEL_128;
  }
LABEL_127:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_bTime);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v75, CFSTR("bTime"));

  v24 = *((_WORD *)&self->_has + 4);
  if ((*(_QWORD *)&self->_has & 0x1000000000000) == 0)
  {
LABEL_72:
    if ((v24 & 0x100) == 0)
      goto LABEL_74;
    goto LABEL_73;
  }
LABEL_128:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_bTimeIsBusy);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v76, CFSTR("bTimeIsBusy"));

  if ((*((_WORD *)&self->_has + 4) & 0x100) != 0)
  {
LABEL_73:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_xattrHasBeforeBounce);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("xattrHasBeforeBounce"));

  }
LABEL_74:
  nameUnicodeNorm = self->_nameUnicodeNorm;
  if (nameUnicodeNorm)
    objc_msgSend(v3, "setObject:forKey:", nameUnicodeNorm, CFSTR("nameUnicodeNorm"));
  v27 = &self->_has;
  v28 = *((_WORD *)&self->_has + 4);
  if ((v28 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_nameIsTrashed);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v77, CFSTR("nameIsTrashed"));

    v29 = *(_QWORD *)v27;
    v28 = *((_WORD *)&self->_has + 4);
    if ((*(_QWORD *)v27 & 0x8000000000) == 0)
      goto LABEL_132;
    goto LABEL_131;
  }
  v29 = *(_QWORD *)v27;
  if ((*(_QWORD *)v27 & 0x8000000000) != 0)
  {
LABEL_131:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_sysPageSize);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v78, CFSTR("sysPageSize"));

    v29 = (uint64_t)self->_has;
    v28 = *((_WORD *)&self->_has + 4);
  }
LABEL_132:
  if ((v29 & 0x10000000000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_sysUID);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v87, CFSTR("sysUID"));

    v29 = (uint64_t)self->_has;
    if ((*((_WORD *)&self->_has + 4) & 0x80) == 0)
    {
LABEL_134:
      if ((v29 & 0x40000000) == 0)
        goto LABEL_135;
      goto LABEL_158;
    }
  }
  else if ((v28 & 0x80) == 0)
  {
    goto LABEL_134;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_sysDocIDResolutionOK);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v88, CFSTR("sysDocIDResolutionOK"));

  v29 = (uint64_t)self->_has;
  if ((v29 & 0x40000000) == 0)
  {
LABEL_135:
    if ((v29 & 0x20000000) == 0)
      goto LABEL_136;
    goto LABEL_159;
  }
LABEL_158:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_purgeGenCount);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v89, CFSTR("purgeGenCount"));

  v29 = (uint64_t)self->_has;
  if ((v29 & 0x20000000) == 0)
  {
LABEL_136:
    if ((v29 & 0x80000000) == 0)
      goto LABEL_137;
    goto LABEL_160;
  }
LABEL_159:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_purgeATime);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v90, CFSTR("purgeATime"));

  v29 = (uint64_t)self->_has;
  if ((v29 & 0x80000000) == 0)
  {
LABEL_137:
    if ((v29 & 0x80000) == 0)
      goto LABEL_138;
    goto LABEL_161;
  }
LABEL_160:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_purgeSyncRoot);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v91, CFSTR("purgeSyncRoot"));

  v29 = (uint64_t)self->_has;
  if ((v29 & 0x80000) == 0)
  {
LABEL_138:
    if ((v29 & 0x40000) == 0)
      goto LABEL_139;
    goto LABEL_162;
  }
LABEL_161:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_diagFailuresBitmap);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v92, CFSTR("diagFailuresBitmap"));

  v29 = (uint64_t)self->_has;
  if ((v29 & 0x40000) == 0)
  {
LABEL_139:
    if ((v29 & 0x100000) == 0)
      goto LABEL_141;
    goto LABEL_140;
  }
LABEL_162:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_diagErrorCode);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v93, CFSTR("diagErrorCode"));

  if ((*(_QWORD *)&self->_has & 0x100000) != 0)
  {
LABEL_140:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_diagUnderlyingErrorCode);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v79, CFSTR("diagUnderlyingErrorCode"));

  }
LABEL_141:
  diagErrorDomain = self->_diagErrorDomain;
  if (diagErrorDomain)
    objc_msgSend(v3, "setObject:forKey:", diagErrorDomain, CFSTR("diagErrorDomain"));
  diagUnderlyingErrorDomain = self->_diagUnderlyingErrorDomain;
  if (diagUnderlyingErrorDomain)
    objc_msgSend(v3, "setObject:forKey:", diagUnderlyingErrorDomain, CFSTR("diagUnderlyingErrorDomain"));
  v82 = &self->_has;
  v83 = (uint64_t)self->_has;
  if ((v83 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_apfsAvailableSpace);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v94, CFSTR("apfsAvailableSpace"));

    v83 = *(_QWORD *)v82;
    if ((*(_QWORD *)v82 & 4) == 0)
    {
LABEL_147:
      if ((v83 & 2) == 0)
        goto LABEL_148;
      goto LABEL_166;
    }
  }
  else if ((v83 & 4) == 0)
  {
    goto LABEL_147;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_apfsFlags);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v95, CFSTR("apfsFlags"));

  v83 = (uint64_t)self->_has;
  if ((v83 & 2) == 0)
  {
LABEL_148:
    if ((v83 & 8) == 0)
      goto LABEL_149;
    goto LABEL_167;
  }
LABEL_166:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_apfsBlockSize);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v96, CFSTR("apfsBlockSize"));

  v83 = (uint64_t)self->_has;
  if ((v83 & 8) == 0)
  {
LABEL_149:
    if ((v83 & 0x400000000000) == 0)
      goto LABEL_150;
    goto LABEL_168;
  }
LABEL_167:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_apfsRole);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v97, CFSTR("apfsRole"));

  v83 = (uint64_t)self->_has;
  if ((v83 & 0x400000000000) == 0)
  {
LABEL_150:
    if ((v83 & 0x1000000000) == 0)
      goto LABEL_151;
    goto LABEL_169;
  }
LABEL_168:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_apfsEncrypted);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v98, CFSTR("apfsEncrypted"));

  v83 = (uint64_t)self->_has;
  if ((v83 & 0x1000000000) == 0)
  {
LABEL_151:
    if ((v83 & 0x2000000000) == 0)
      goto LABEL_152;
    goto LABEL_170;
  }
LABEL_169:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_statDocID);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v99, CFSTR("statDocID"));

  v83 = (uint64_t)self->_has;
  if ((v83 & 0x2000000000) == 0)
  {
LABEL_152:
    if ((v83 & 0x4000000000) == 0)
      goto LABEL_153;
LABEL_171:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_statPhysicalSize);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v101, CFSTR("statPhysicalSize"));

    if ((*(_QWORD *)&self->_has & 0x800000000) == 0)
      goto LABEL_155;
    goto LABEL_154;
  }
LABEL_170:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_statLogicalSize);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v100, CFSTR("statLogicalSize"));

  v83 = (uint64_t)self->_has;
  if ((v83 & 0x4000000000) != 0)
    goto LABEL_171;
LABEL_153:
  if ((v83 & 0x800000000) != 0)
  {
LABEL_154:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_statDirEntryCount);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v84, CFSTR("statDirEntryCount"));

  }
LABEL_155:
  v85 = v3;

  return v85;
}

- (BOOL)readFrom:(id)a3
{
  return AppTelemetryFPFSMigrationNonMigratedItemInvestigationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $2082CF93F90B3E6732D9C5A72A2BCBB8 *p_has;
  uint64_t has;
  uint64_t v6;
  __int16 v7;
  $2082CF93F90B3E6732D9C5A72A2BCBB8 *v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  $2082CF93F90B3E6732D9C5A72A2BCBB8 *v13;
  __int16 v14;
  uint64_t v15;
  $2082CF93F90B3E6732D9C5A72A2BCBB8 *v16;
  uint64_t v17;
  id v18;

  v18 = a3;
  p_has = &self->_has;
  has = (uint64_t)self->_has;
  if ((has & 0x2000000) != 0)
  {
    PBDataWriterWriteInt64Field();
    has = *(_QWORD *)p_has;
    if ((*(_QWORD *)p_has & 0x80000000000) == 0)
    {
LABEL_3:
      if ((has & 0x40000000000) == 0)
        goto LABEL_4;
      goto LABEL_81;
    }
  }
  else if ((has & 0x80000000000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  has = (uint64_t)self->_has;
  if ((has & 0x40000000000) == 0)
  {
LABEL_4:
    if ((has & 0x800000000000000) == 0)
      goto LABEL_5;
    goto LABEL_82;
  }
LABEL_81:
  PBDataWriterWriteInt32Field();
  has = (uint64_t)self->_has;
  if ((has & 0x800000000000000) == 0)
  {
LABEL_5:
    if ((has & 0x1000000000000000) == 0)
      goto LABEL_6;
    goto LABEL_83;
  }
LABEL_82:
  PBDataWriterWriteBOOLField();
  has = (uint64_t)self->_has;
  if ((has & 0x1000000000000000) == 0)
  {
LABEL_6:
    if ((has & 0x200000000000) == 0)
      goto LABEL_7;
    goto LABEL_84;
  }
LABEL_83:
  PBDataWriterWriteBOOLField();
  has = (uint64_t)self->_has;
  if ((has & 0x200000000000) == 0)
  {
LABEL_7:
    if ((has & 0x100000000000000) == 0)
      goto LABEL_8;
    goto LABEL_85;
  }
LABEL_84:
  PBDataWriterWriteInt32Field();
  has = (uint64_t)self->_has;
  if ((has & 0x100000000000000) == 0)
  {
LABEL_8:
    if ((has & 0x8000000000000000) == 0)
      goto LABEL_9;
    goto LABEL_86;
  }
LABEL_85:
  PBDataWriterWriteBOOLField();
  has = (uint64_t)self->_has;
  if ((has & 0x8000000000000000) == 0)
  {
LABEL_9:
    if ((has & 0x4000000000000000) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_86:
  PBDataWriterWriteBOOLField();
  if ((*(_QWORD *)&self->_has & 0x4000000000000000) != 0)
LABEL_10:
    PBDataWriterWriteBOOLField();
LABEL_11:
  if (self->_utType)
    PBDataWriterWriteStringField();
  v6 = (uint64_t)self->_has;
  if ((v6 & 0x200000000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v6 = (uint64_t)self->_has;
  }
  v7 = *((_WORD *)&self->_has + 4);
  if ((v7 & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v6 = (uint64_t)self->_has;
    v7 = *((_WORD *)&self->_has + 4);
    if ((v6 & 0x20000000000) == 0)
    {
LABEL_17:
      if ((v6 & 0x100000000) == 0)
        goto LABEL_18;
      goto LABEL_90;
    }
  }
  else if ((v6 & 0x20000000000) == 0)
  {
    goto LABEL_17;
  }
  PBDataWriterWriteInt32Field();
  v6 = (uint64_t)self->_has;
  v7 = *((_WORD *)&self->_has + 4);
  if ((v6 & 0x100000000) == 0)
  {
LABEL_18:
    if ((v6 & 0x20) == 0)
      goto LABEL_19;
    goto LABEL_91;
  }
LABEL_90:
  PBDataWriterWriteInt64Field();
  v6 = (uint64_t)self->_has;
  v7 = *((_WORD *)&self->_has + 4);
  if ((v6 & 0x20) == 0)
  {
LABEL_19:
    if ((v6 & 0x100000000000) == 0)
      goto LABEL_20;
    goto LABEL_92;
  }
LABEL_91:
  PBDataWriterWriteInt64Field();
  v6 = (uint64_t)self->_has;
  v7 = *((_WORD *)&self->_has + 4);
  if ((v6 & 0x100000000000) == 0)
  {
LABEL_20:
    if ((v6 & 0x10000000) == 0)
      goto LABEL_21;
    goto LABEL_93;
  }
LABEL_92:
  PBDataWriterWriteInt32Field();
  v6 = (uint64_t)self->_has;
  v7 = *((_WORD *)&self->_has + 4);
  if ((v6 & 0x10000000) == 0)
  {
LABEL_21:
    if ((v6 & 0x200000) == 0)
      goto LABEL_22;
    goto LABEL_94;
  }
LABEL_93:
  PBDataWriterWriteInt64Field();
  v6 = (uint64_t)self->_has;
  v7 = *((_WORD *)&self->_has + 4);
  if ((v6 & 0x200000) == 0)
  {
LABEL_22:
    if ((v6 & 0x400000000) == 0)
      goto LABEL_23;
    goto LABEL_95;
  }
LABEL_94:
  PBDataWriterWriteInt64Field();
  v6 = (uint64_t)self->_has;
  v7 = *((_WORD *)&self->_has + 4);
  if ((v6 & 0x400000000) == 0)
  {
LABEL_23:
    if ((v6 & 0x200000000) == 0)
      goto LABEL_24;
    goto LABEL_96;
  }
LABEL_95:
  PBDataWriterWriteInt64Field();
  v6 = (uint64_t)self->_has;
  v7 = *((_WORD *)&self->_has + 4);
  if ((v6 & 0x200000000) == 0)
  {
LABEL_24:
    if ((v6 & 0x40000000000000) == 0)
      goto LABEL_25;
    goto LABEL_97;
  }
LABEL_96:
  PBDataWriterWriteInt64Field();
  v6 = (uint64_t)self->_has;
  v7 = *((_WORD *)&self->_has + 4);
  if ((v6 & 0x40000000000000) == 0)
  {
LABEL_25:
    if ((v7 & 0x20) == 0)
      goto LABEL_26;
    goto LABEL_98;
  }
LABEL_97:
  PBDataWriterWriteBOOLField();
  v6 = (uint64_t)self->_has;
  v7 = *((_WORD *)&self->_has + 4);
  if ((v7 & 0x20) == 0)
  {
LABEL_26:
    if ((v6 & 0x2000000000000000) == 0)
      goto LABEL_27;
    goto LABEL_99;
  }
LABEL_98:
  PBDataWriterWriteBOOLField();
  v6 = (uint64_t)self->_has;
  v7 = *((_WORD *)&self->_has + 4);
  if ((v6 & 0x2000000000000000) == 0)
  {
LABEL_27:
    if ((v7 & 4) == 0)
      goto LABEL_28;
    goto LABEL_100;
  }
LABEL_99:
  PBDataWriterWriteBOOLField();
  v6 = (uint64_t)self->_has;
  v7 = *((_WORD *)&self->_has + 4);
  if ((v7 & 4) == 0)
  {
LABEL_28:
    if ((v7 & 2) == 0)
      goto LABEL_29;
    goto LABEL_101;
  }
LABEL_100:
  PBDataWriterWriteBOOLField();
  v6 = (uint64_t)self->_has;
  if ((*((_WORD *)&self->_has + 4) & 2) == 0)
  {
LABEL_29:
    if ((v6 & 0x400000000000000) == 0)
      goto LABEL_31;
    goto LABEL_30;
  }
LABEL_101:
  PBDataWriterWriteBOOLField();
  if ((*(_QWORD *)&self->_has & 0x400000000000000) != 0)
LABEL_30:
    PBDataWriterWriteBOOLField();
LABEL_31:
  if (self->_finderInfoFlagsBase64)
    PBDataWriterWriteStringField();
  v8 = &self->_has;
  v9 = (uint64_t)self->_has;
  if ((v9 & 0x1000000) != 0)
  {
    PBDataWriterWriteInt64Field();
    v9 = *(_QWORD *)v8;
    if ((*(_QWORD *)v8 & 0x400000) == 0)
    {
LABEL_35:
      if ((v9 & 0x8000) == 0)
        goto LABEL_36;
      goto LABEL_105;
    }
  }
  else if ((v9 & 0x400000) == 0)
  {
    goto LABEL_35;
  }
  PBDataWriterWriteInt64Field();
  v9 = (uint64_t)self->_has;
  if ((v9 & 0x8000) == 0)
  {
LABEL_36:
    if ((v9 & 0x80000000000000) == 0)
      goto LABEL_37;
    goto LABEL_106;
  }
LABEL_105:
  PBDataWriterWriteInt64Field();
  v9 = (uint64_t)self->_has;
  if ((v9 & 0x80000000000000) == 0)
  {
LABEL_37:
    if ((v9 & 0x10000000000000) == 0)
      goto LABEL_39;
    goto LABEL_38;
  }
LABEL_106:
  PBDataWriterWriteBOOLField();
  if ((*(_QWORD *)&self->_has & 0x10000000000000) != 0)
LABEL_38:
    PBDataWriterWriteBOOLField();
LABEL_39:
  if (self->_fileNameExtension)
    PBDataWriterWriteStringField();
  if ((*(_QWORD *)&self->_has & 0x8000000) != 0)
    PBDataWriterWriteInt64Field();
  v10 = *((_WORD *)&self->_has + 4);
  if ((v10 & 0x200) != 0)
  {
    PBDataWriterWriteBOOLField();
    v10 = *((_WORD *)&self->_has + 4);
  }
  if ((v10 & 0x400) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_dbErrorDomain)
    PBDataWriterWriteStringField();
  v11 = (uint64_t)self->_has;
  if ((v11 & 0x100) != 0)
  {
    PBDataWriterWriteInt64Field();
    v11 = (uint64_t)self->_has;
  }
  v12 = *((_WORD *)&self->_has + 4);
  if ((v11 & 0x40) != 0)
  {
    PBDataWriterWriteInt64Field();
    v11 = (uint64_t)self->_has;
    v12 = *((_WORD *)&self->_has + 4);
    if ((v11 & 0x20000) == 0)
    {
LABEL_53:
      if ((v11 & 0x10000) == 0)
        goto LABEL_54;
      goto LABEL_110;
    }
  }
  else if ((v11 & 0x20000) == 0)
  {
    goto LABEL_53;
  }
  PBDataWriterWriteInt64Field();
  v11 = (uint64_t)self->_has;
  v12 = *((_WORD *)&self->_has + 4);
  if ((v11 & 0x10000) == 0)
  {
LABEL_54:
    if ((v11 & 0x2000000000000) == 0)
      goto LABEL_55;
    goto LABEL_111;
  }
LABEL_110:
  PBDataWriterWriteInt64Field();
  v11 = (uint64_t)self->_has;
  v12 = *((_WORD *)&self->_has + 4);
  if ((v11 & 0x2000000000000) == 0)
  {
LABEL_55:
    if ((v11 & 0x80) == 0)
      goto LABEL_56;
    goto LABEL_112;
  }
LABEL_111:
  PBDataWriterWriteBOOLField();
  v11 = (uint64_t)self->_has;
  v12 = *((_WORD *)&self->_has + 4);
  if ((v11 & 0x80) == 0)
  {
LABEL_56:
    if ((v11 & 0x4000000000000) == 0)
      goto LABEL_57;
    goto LABEL_113;
  }
LABEL_112:
  PBDataWriterWriteInt64Field();
  v11 = (uint64_t)self->_has;
  v12 = *((_WORD *)&self->_has + 4);
  if ((v11 & 0x4000000000000) == 0)
  {
LABEL_57:
    if ((v11 & 0x1000) == 0)
      goto LABEL_58;
    goto LABEL_114;
  }
LABEL_113:
  PBDataWriterWriteBOOLField();
  v11 = (uint64_t)self->_has;
  v12 = *((_WORD *)&self->_has + 4);
  if ((v11 & 0x1000) == 0)
  {
LABEL_58:
    if ((v11 & 0x200) == 0)
      goto LABEL_59;
    goto LABEL_115;
  }
LABEL_114:
  PBDataWriterWriteInt64Field();
  v11 = (uint64_t)self->_has;
  v12 = *((_WORD *)&self->_has + 4);
  if ((v11 & 0x200) == 0)
  {
LABEL_59:
    if ((v11 & 0x2000) == 0)
      goto LABEL_60;
    goto LABEL_116;
  }
LABEL_115:
  PBDataWriterWriteInt64Field();
  v11 = (uint64_t)self->_has;
  v12 = *((_WORD *)&self->_has + 4);
  if ((v11 & 0x2000) == 0)
  {
LABEL_60:
    if ((v11 & 0x400) == 0)
      goto LABEL_61;
    goto LABEL_117;
  }
LABEL_116:
  PBDataWriterWriteInt64Field();
  v11 = (uint64_t)self->_has;
  v12 = *((_WORD *)&self->_has + 4);
  if ((v11 & 0x400) == 0)
  {
LABEL_61:
    if ((v11 & 0x4000) == 0)
      goto LABEL_62;
    goto LABEL_118;
  }
LABEL_117:
  PBDataWriterWriteInt64Field();
  v11 = (uint64_t)self->_has;
  v12 = *((_WORD *)&self->_has + 4);
  if ((v11 & 0x4000) == 0)
  {
LABEL_62:
    if ((v11 & 0x800) == 0)
      goto LABEL_63;
    goto LABEL_119;
  }
LABEL_118:
  PBDataWriterWriteInt64Field();
  v11 = (uint64_t)self->_has;
  v12 = *((_WORD *)&self->_has + 4);
  if ((v11 & 0x800) == 0)
  {
LABEL_63:
    if ((v11 & 0x8000000000000) == 0)
      goto LABEL_64;
    goto LABEL_120;
  }
LABEL_119:
  PBDataWriterWriteInt64Field();
  v11 = (uint64_t)self->_has;
  v12 = *((_WORD *)&self->_has + 4);
  if ((v11 & 0x8000000000000) == 0)
  {
LABEL_64:
    if ((v11 & 0x800000) == 0)
      goto LABEL_65;
    goto LABEL_121;
  }
LABEL_120:
  PBDataWriterWriteBOOLField();
  v11 = (uint64_t)self->_has;
  v12 = *((_WORD *)&self->_has + 4);
  if ((v11 & 0x800000) == 0)
  {
LABEL_65:
    if ((v12 & 0x40) == 0)
      goto LABEL_66;
    goto LABEL_122;
  }
LABEL_121:
  PBDataWriterWriteInt64Field();
  v11 = (uint64_t)self->_has;
  v12 = *((_WORD *)&self->_has + 4);
  if ((v12 & 0x40) == 0)
  {
LABEL_66:
    if ((v11 & 0x800000000000) == 0)
      goto LABEL_67;
    goto LABEL_123;
  }
LABEL_122:
  PBDataWriterWriteBOOLField();
  v11 = (uint64_t)self->_has;
  v12 = *((_WORD *)&self->_has + 4);
  if ((v11 & 0x800000000000) == 0)
  {
LABEL_67:
    if ((v12 & 8) == 0)
      goto LABEL_68;
    goto LABEL_124;
  }
LABEL_123:
  PBDataWriterWriteBOOLField();
  v11 = (uint64_t)self->_has;
  v12 = *((_WORD *)&self->_has + 4);
  if ((v12 & 8) == 0)
  {
LABEL_68:
    if ((v11 & 0x20000000000000) == 0)
      goto LABEL_69;
    goto LABEL_125;
  }
LABEL_124:
  PBDataWriterWriteBOOLField();
  v11 = (uint64_t)self->_has;
  v12 = *((_WORD *)&self->_has + 4);
  if ((v11 & 0x20000000000000) == 0)
  {
LABEL_69:
    if ((v11 & 0x4000000) == 0)
      goto LABEL_70;
    goto LABEL_126;
  }
LABEL_125:
  PBDataWriterWriteBOOLField();
  v11 = (uint64_t)self->_has;
  v12 = *((_WORD *)&self->_has + 4);
  if ((v11 & 0x4000000) == 0)
  {
LABEL_70:
    if ((v11 & 0x10) == 0)
      goto LABEL_71;
    goto LABEL_127;
  }
LABEL_126:
  PBDataWriterWriteInt64Field();
  v11 = (uint64_t)self->_has;
  v12 = *((_WORD *)&self->_has + 4);
  if ((v11 & 0x10) == 0)
  {
LABEL_71:
    if ((v11 & 0x1000000000000) == 0)
      goto LABEL_72;
    goto LABEL_128;
  }
LABEL_127:
  PBDataWriterWriteInt64Field();
  v12 = *((_WORD *)&self->_has + 4);
  if ((*(_QWORD *)&self->_has & 0x1000000000000) == 0)
  {
LABEL_72:
    if ((v12 & 0x100) == 0)
      goto LABEL_74;
    goto LABEL_73;
  }
LABEL_128:
  PBDataWriterWriteBOOLField();
  if ((*((_WORD *)&self->_has + 4) & 0x100) != 0)
LABEL_73:
    PBDataWriterWriteBOOLField();
LABEL_74:
  if (self->_nameUnicodeNorm)
    PBDataWriterWriteStringField();
  v13 = &self->_has;
  v14 = *((_WORD *)&self->_has + 4);
  if ((v14 & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    v15 = *(_QWORD *)v13;
    v14 = *((_WORD *)&self->_has + 4);
    if ((*(_QWORD *)v13 & 0x8000000000) == 0)
      goto LABEL_132;
    goto LABEL_131;
  }
  v15 = *(_QWORD *)v13;
  if ((*(_QWORD *)v13 & 0x8000000000) != 0)
  {
LABEL_131:
    PBDataWriterWriteInt64Field();
    v15 = (uint64_t)self->_has;
    v14 = *((_WORD *)&self->_has + 4);
  }
LABEL_132:
  if ((v15 & 0x10000000000) != 0)
  {
    PBDataWriterWriteInt64Field();
    v15 = (uint64_t)self->_has;
    if ((*((_WORD *)&self->_has + 4) & 0x80) == 0)
    {
LABEL_134:
      if ((v15 & 0x40000000) == 0)
        goto LABEL_135;
      goto LABEL_158;
    }
  }
  else if ((v14 & 0x80) == 0)
  {
    goto LABEL_134;
  }
  PBDataWriterWriteBOOLField();
  v15 = (uint64_t)self->_has;
  if ((v15 & 0x40000000) == 0)
  {
LABEL_135:
    if ((v15 & 0x20000000) == 0)
      goto LABEL_136;
    goto LABEL_159;
  }
LABEL_158:
  PBDataWriterWriteInt64Field();
  v15 = (uint64_t)self->_has;
  if ((v15 & 0x20000000) == 0)
  {
LABEL_136:
    if ((v15 & 0x80000000) == 0)
      goto LABEL_137;
    goto LABEL_160;
  }
LABEL_159:
  PBDataWriterWriteInt64Field();
  v15 = (uint64_t)self->_has;
  if ((v15 & 0x80000000) == 0)
  {
LABEL_137:
    if ((v15 & 0x80000) == 0)
      goto LABEL_138;
    goto LABEL_161;
  }
LABEL_160:
  PBDataWriterWriteInt64Field();
  v15 = (uint64_t)self->_has;
  if ((v15 & 0x80000) == 0)
  {
LABEL_138:
    if ((v15 & 0x40000) == 0)
      goto LABEL_139;
    goto LABEL_162;
  }
LABEL_161:
  PBDataWriterWriteInt64Field();
  v15 = (uint64_t)self->_has;
  if ((v15 & 0x40000) == 0)
  {
LABEL_139:
    if ((v15 & 0x100000) == 0)
      goto LABEL_141;
    goto LABEL_140;
  }
LABEL_162:
  PBDataWriterWriteInt64Field();
  if ((*(_QWORD *)&self->_has & 0x100000) != 0)
LABEL_140:
    PBDataWriterWriteInt64Field();
LABEL_141:
  if (self->_diagErrorDomain)
    PBDataWriterWriteStringField();
  if (self->_diagUnderlyingErrorDomain)
    PBDataWriterWriteStringField();
  v16 = &self->_has;
  v17 = (uint64_t)self->_has;
  if ((v17 & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v17 = *(_QWORD *)v16;
    if ((*(_QWORD *)v16 & 4) == 0)
    {
LABEL_147:
      if ((v17 & 2) == 0)
        goto LABEL_148;
      goto LABEL_166;
    }
  }
  else if ((v17 & 4) == 0)
  {
    goto LABEL_147;
  }
  PBDataWriterWriteInt64Field();
  v17 = (uint64_t)self->_has;
  if ((v17 & 2) == 0)
  {
LABEL_148:
    if ((v17 & 8) == 0)
      goto LABEL_149;
    goto LABEL_167;
  }
LABEL_166:
  PBDataWriterWriteInt64Field();
  v17 = (uint64_t)self->_has;
  if ((v17 & 8) == 0)
  {
LABEL_149:
    if ((v17 & 0x400000000000) == 0)
      goto LABEL_150;
    goto LABEL_168;
  }
LABEL_167:
  PBDataWriterWriteInt64Field();
  v17 = (uint64_t)self->_has;
  if ((v17 & 0x400000000000) == 0)
  {
LABEL_150:
    if ((v17 & 0x1000000000) == 0)
      goto LABEL_151;
    goto LABEL_169;
  }
LABEL_168:
  PBDataWriterWriteBOOLField();
  v17 = (uint64_t)self->_has;
  if ((v17 & 0x1000000000) == 0)
  {
LABEL_151:
    if ((v17 & 0x2000000000) == 0)
      goto LABEL_152;
    goto LABEL_170;
  }
LABEL_169:
  PBDataWriterWriteInt64Field();
  v17 = (uint64_t)self->_has;
  if ((v17 & 0x2000000000) == 0)
  {
LABEL_152:
    if ((v17 & 0x4000000000) == 0)
      goto LABEL_153;
LABEL_171:
    PBDataWriterWriteInt64Field();
    if ((*(_QWORD *)&self->_has & 0x800000000) == 0)
      goto LABEL_155;
    goto LABEL_154;
  }
LABEL_170:
  PBDataWriterWriteInt64Field();
  v17 = (uint64_t)self->_has;
  if ((v17 & 0x4000000000) != 0)
    goto LABEL_171;
LABEL_153:
  if ((v17 & 0x800000000) != 0)
LABEL_154:
    PBDataWriterWriteInt64Field();
LABEL_155:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  $2082CF93F90B3E6732D9C5A72A2BCBB8 *p_has;
  uint64_t has;
  uint64_t v7;
  __int16 v8;
  $2082CF93F90B3E6732D9C5A72A2BCBB8 *v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  $2082CF93F90B3E6732D9C5A72A2BCBB8 *v14;
  __int16 v15;
  uint64_t v16;
  $2082CF93F90B3E6732D9C5A72A2BCBB8 *v17;
  uint64_t v18;
  _QWORD *v19;

  v4 = a3;
  p_has = &self->_has;
  has = (uint64_t)self->_has;
  if ((has & 0x2000000) != 0)
  {
    v4[26] = self->_itemNumber;
    *(_QWORD *)((char *)v4 + 452) |= 0x2000000uLL;
    has = *(_QWORD *)p_has;
    if ((*(_QWORD *)p_has & 0x80000000000) == 0)
    {
LABEL_3:
      if ((has & 0x40000000000) == 0)
        goto LABEL_4;
      goto LABEL_81;
    }
  }
  else if ((has & 0x80000000000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 96) = self->_itemType;
  *(_QWORD *)((char *)v4 + 452) |= 0x80000000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x40000000000) == 0)
  {
LABEL_4:
    if ((has & 0x800000000000000) == 0)
      goto LABEL_5;
    goto LABEL_82;
  }
LABEL_81:
  *((_DWORD *)v4 + 85) = self->_dataProtectionClass;
  *(_QWORD *)((char *)v4 + 452) |= 0x40000000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x800000000000000) == 0)
  {
LABEL_5:
    if ((has & 0x1000000000000000) == 0)
      goto LABEL_6;
    goto LABEL_83;
  }
LABEL_82:
  *((_BYTE *)v4 + 433) = self->_isOwnedByLoggedInUser;
  *(_QWORD *)((char *)v4 + 452) |= 0x800000000000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x1000000000000000) == 0)
  {
LABEL_6:
    if ((has & 0x200000000000) == 0)
      goto LABEL_7;
    goto LABEL_84;
  }
LABEL_83:
  *((_BYTE *)v4 + 434) = self->_isOwnedByRoot;
  *(_QWORD *)((char *)v4 + 452) |= 0x1000000000000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x200000000000) == 0)
  {
LABEL_7:
    if ((has & 0x100000000000000) == 0)
      goto LABEL_8;
    goto LABEL_85;
  }
LABEL_84:
  *((_DWORD *)v4 + 104) = self->_xattrCount;
  *(_QWORD *)((char *)v4 + 452) |= 0x200000000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x100000000000000) == 0)
  {
LABEL_8:
    if ((has & 0x8000000000000000) == 0)
      goto LABEL_9;
    goto LABEL_86;
  }
LABEL_85:
  *((_BYTE *)v4 + 430) = self->_isAppleDouble;
  *(_QWORD *)((char *)v4 + 452) |= 0x100000000000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x8000000000000000) == 0)
  {
LABEL_9:
    if ((has & 0x4000000000000000) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_86:
  *((_BYTE *)v4 + 437) = self->_isResourceFork;
  *(_QWORD *)((char *)v4 + 452) |= 0x8000000000000000;
  if ((*(_QWORD *)&self->_has & 0x4000000000000000) != 0)
  {
LABEL_10:
    *((_BYTE *)v4 + 436) = self->_isQuarantined;
    *(_QWORD *)((char *)v4 + 452) |= 0x4000000000000000uLL;
  }
LABEL_11:
  v19 = v4;
  if (self->_utType)
  {
    objc_msgSend(v4, "setUtType:");
    v4 = v19;
  }
  v7 = (uint64_t)self->_has;
  if ((v7 & 0x200000000000000) != 0)
  {
    *((_BYTE *)v4 + 431) = self->_isBundleBit;
    *(_QWORD *)((char *)v4 + 452) |= 0x200000000000000uLL;
    v7 = (uint64_t)self->_has;
  }
  v8 = *((_WORD *)&self->_has + 4);
  if ((v8 & 1) != 0)
  {
    *((_BYTE *)v4 + 438) = self->_isSparseFile;
    *((_WORD *)v4 + 230) |= 1u;
    v7 = (uint64_t)self->_has;
    v8 = *((_WORD *)&self->_has + 4);
    if ((v7 & 0x20000000000) == 0)
    {
LABEL_17:
      if ((v7 & 0x100000000) == 0)
        goto LABEL_18;
      goto LABEL_90;
    }
  }
  else if ((v7 & 0x20000000000) == 0)
  {
    goto LABEL_17;
  }
  *((_DWORD *)v4 + 84) = self->_compressionType;
  *(_QWORD *)((char *)v4 + 452) |= 0x20000000000uLL;
  v7 = (uint64_t)self->_has;
  v8 = *((_WORD *)&self->_has + 4);
  if ((v7 & 0x100000000) == 0)
  {
LABEL_18:
    if ((v7 & 0x20) == 0)
      goto LABEL_19;
    goto LABEL_91;
  }
LABEL_90:
  v4[33] = self->_readErrorCode;
  *(_QWORD *)((char *)v4 + 452) |= 0x100000000uLL;
  v7 = (uint64_t)self->_has;
  v8 = *((_WORD *)&self->_has + 4);
  if ((v7 & 0x20) == 0)
  {
LABEL_19:
    if ((v7 & 0x100000000000) == 0)
      goto LABEL_20;
    goto LABEL_92;
  }
LABEL_91:
  v4[6] = self->_cloneErrorCode;
  *(_QWORD *)((char *)v4 + 452) |= 0x20uLL;
  v7 = (uint64_t)self->_has;
  v8 = *((_WORD *)&self->_has + 4);
  if ((v7 & 0x100000000000) == 0)
  {
LABEL_20:
    if ((v7 & 0x10000000) == 0)
      goto LABEL_21;
    goto LABEL_93;
  }
LABEL_92:
  *((_DWORD *)v4 + 100) = self->_syncRootEnum;
  *(_QWORD *)((char *)v4 + 452) |= 0x100000000000uLL;
  v7 = (uint64_t)self->_has;
  v8 = *((_WORD *)&self->_has + 4);
  if ((v7 & 0x10000000) == 0)
  {
LABEL_21:
    if ((v7 & 0x200000) == 0)
      goto LABEL_22;
    goto LABEL_94;
  }
LABEL_93:
  v4[29] = self->_pathLength;
  *(_QWORD *)((char *)v4 + 452) |= 0x10000000uLL;
  v7 = (uint64_t)self->_has;
  v8 = *((_WORD *)&self->_has + 4);
  if ((v7 & 0x200000) == 0)
  {
LABEL_22:
    if ((v7 & 0x400000000) == 0)
      goto LABEL_23;
    goto LABEL_95;
  }
LABEL_94:
  v4[22] = self->_fileNameLength;
  *(_QWORD *)((char *)v4 + 452) |= 0x200000uLL;
  v7 = (uint64_t)self->_has;
  v8 = *((_WORD *)&self->_has + 4);
  if ((v7 & 0x400000000) == 0)
  {
LABEL_23:
    if ((v7 & 0x200000000) == 0)
      goto LABEL_24;
    goto LABEL_96;
  }
LABEL_95:
  v4[35] = self->_stMode;
  *(_QWORD *)((char *)v4 + 452) |= 0x400000000uLL;
  v7 = (uint64_t)self->_has;
  v8 = *((_WORD *)&self->_has + 4);
  if ((v7 & 0x200000000) == 0)
  {
LABEL_24:
    if ((v7 & 0x40000000000000) == 0)
      goto LABEL_25;
    goto LABEL_97;
  }
LABEL_96:
  v4[34] = self->_stFlags;
  *(_QWORD *)((char *)v4 + 452) |= 0x200000000uLL;
  v7 = (uint64_t)self->_has;
  v8 = *((_WORD *)&self->_has + 4);
  if ((v7 & 0x40000000000000) == 0)
  {
LABEL_25:
    if ((v8 & 0x20) == 0)
      goto LABEL_26;
    goto LABEL_98;
  }
LABEL_97:
  *((_BYTE *)v4 + 428) = self->_hasAcls;
  *(_QWORD *)((char *)v4 + 452) |= 0x40000000000000uLL;
  v7 = (uint64_t)self->_has;
  v8 = *((_WORD *)&self->_has + 4);
  if ((v8 & 0x20) == 0)
  {
LABEL_26:
    if ((v7 & 0x2000000000000000) == 0)
      goto LABEL_27;
    goto LABEL_99;
  }
LABEL_98:
  *((_BYTE *)v4 + 443) = self->_parentHasAcls;
  *((_WORD *)v4 + 230) |= 0x20u;
  v7 = (uint64_t)self->_has;
  v8 = *((_WORD *)&self->_has + 4);
  if ((v7 & 0x2000000000000000) == 0)
  {
LABEL_27:
    if ((v8 & 4) == 0)
      goto LABEL_28;
    goto LABEL_100;
  }
LABEL_99:
  *((_BYTE *)v4 + 435) = self->_isPurgable;
  *(_QWORD *)((char *)v4 + 452) |= 0x2000000000000000uLL;
  v7 = (uint64_t)self->_has;
  v8 = *((_WORD *)&self->_has + 4);
  if ((v8 & 4) == 0)
  {
LABEL_28:
    if ((v8 & 2) == 0)
      goto LABEL_29;
    goto LABEL_101;
  }
LABEL_100:
  *((_BYTE *)v4 + 440) = self->_isUrgent;
  *((_WORD *)v4 + 230) |= 4u;
  v7 = (uint64_t)self->_has;
  if ((*((_WORD *)&self->_has + 4) & 2) == 0)
  {
LABEL_29:
    if ((v7 & 0x400000000000000) == 0)
      goto LABEL_31;
    goto LABEL_30;
  }
LABEL_101:
  *((_BYTE *)v4 + 439) = self->_isUnderDirStatFolder;
  *((_WORD *)v4 + 230) |= 2u;
  if ((*(_QWORD *)&self->_has & 0x400000000000000) != 0)
  {
LABEL_30:
    *((_BYTE *)v4 + 432) = self->_isFileNameNonAscii;
    *(_QWORD *)((char *)v4 + 452) |= 0x400000000000000uLL;
  }
LABEL_31:
  if (self->_finderInfoFlagsBase64)
  {
    objc_msgSend(v19, "setFinderInfoFlagsBase64:");
    v4 = v19;
  }
  v9 = &self->_has;
  v10 = (uint64_t)self->_has;
  if ((v10 & 0x1000000) != 0)
  {
    v4[25] = self->_hasMoreLinks;
    *(_QWORD *)((char *)v4 + 452) |= 0x1000000uLL;
    v10 = *(_QWORD *)v9;
    if ((*(_QWORD *)v9 & 0x400000) == 0)
    {
LABEL_35:
      if ((v10 & 0x8000) == 0)
        goto LABEL_36;
      goto LABEL_105;
    }
  }
  else if ((v10 & 0x400000) == 0)
  {
    goto LABEL_35;
  }
  v4[23] = self->_fsGenCount;
  *(_QWORD *)((char *)v4 + 452) |= 0x400000uLL;
  v10 = (uint64_t)self->_has;
  if ((v10 & 0x8000) == 0)
  {
LABEL_36:
    if ((v10 & 0x80000000000000) == 0)
      goto LABEL_37;
    goto LABEL_106;
  }
LABEL_105:
  v4[16] = self->_dbGenCount;
  *(_QWORD *)((char *)v4 + 452) |= 0x8000uLL;
  v10 = (uint64_t)self->_has;
  if ((v10 & 0x80000000000000) == 0)
  {
LABEL_37:
    if ((v10 & 0x10000000000000) == 0)
      goto LABEL_39;
    goto LABEL_38;
  }
LABEL_106:
  *((_BYTE *)v4 + 429) = self->_hasLocalChanges;
  *(_QWORD *)((char *)v4 + 452) |= 0x80000000000000uLL;
  if ((*(_QWORD *)&self->_has & 0x10000000000000) != 0)
  {
LABEL_38:
    *((_BYTE *)v4 + 426) = self->_doGenCountsMatchInFileId;
    *(_QWORD *)((char *)v4 + 452) |= 0x10000000000000uLL;
  }
LABEL_39:
  if (self->_fileNameExtension)
  {
    objc_msgSend(v19, "setFileNameExtension:");
    v4 = v19;
  }
  if ((*(_QWORD *)&self->_has & 0x8000000) != 0)
  {
    v4[28] = self->_pathDepth;
    *(_QWORD *)((char *)v4 + 452) |= 0x8000000uLL;
  }
  v11 = *((_WORD *)&self->_has + 4);
  if ((v11 & 0x200) != 0)
  {
    *((_BYTE *)v4 + 447) = self->_xattrHasDemotion;
    *((_WORD *)v4 + 230) |= 0x200u;
    v11 = *((_WORD *)&self->_has + 4);
  }
  if ((v11 & 0x400) != 0)
  {
    *((_BYTE *)v4 + 448) = self->_xattrHasPromotion;
    *((_WORD *)v4 + 230) |= 0x400u;
  }
  if (self->_dbErrorDomain)
  {
    objc_msgSend(v19, "setDbErrorDomain:");
    v4 = v19;
  }
  v12 = (uint64_t)self->_has;
  if ((v12 & 0x100) != 0)
  {
    v4[9] = self->_dbErrorCode;
    *(_QWORD *)((char *)v4 + 452) |= 0x100uLL;
    v12 = (uint64_t)self->_has;
  }
  v13 = *((_WORD *)&self->_has + 4);
  if ((v12 & 0x40) != 0)
  {
    v4[7] = self->_dbCapabilities;
    *(_QWORD *)((char *)v4 + 452) |= 0x40uLL;
    v12 = (uint64_t)self->_has;
    v13 = *((_WORD *)&self->_has + 4);
    if ((v12 & 0x20000) == 0)
    {
LABEL_53:
      if ((v12 & 0x10000) == 0)
        goto LABEL_54;
      goto LABEL_110;
    }
  }
  else if ((v12 & 0x20000) == 0)
  {
    goto LABEL_53;
  }
  v4[18] = self->_dbTransferState;
  *(_QWORD *)((char *)v4 + 452) |= 0x20000uLL;
  v12 = (uint64_t)self->_has;
  v13 = *((_WORD *)&self->_has + 4);
  if ((v12 & 0x10000) == 0)
  {
LABEL_54:
    if ((v12 & 0x2000000000000) == 0)
      goto LABEL_55;
    goto LABEL_111;
  }
LABEL_110:
  v4[17] = self->_dbSharingState;
  *(_QWORD *)((char *)v4 + 452) |= 0x10000uLL;
  v12 = (uint64_t)self->_has;
  v13 = *((_WORD *)&self->_has + 4);
  if ((v12 & 0x2000000000000) == 0)
  {
LABEL_55:
    if ((v12 & 0x80) == 0)
      goto LABEL_56;
    goto LABEL_112;
  }
LABEL_111:
  *((_BYTE *)v4 + 423) = self->_dbIsApplibrary;
  *(_QWORD *)((char *)v4 + 452) |= 0x2000000000000uLL;
  v12 = (uint64_t)self->_has;
  v13 = *((_WORD *)&self->_has + 4);
  if ((v12 & 0x80) == 0)
  {
LABEL_56:
    if ((v12 & 0x4000000000000) == 0)
      goto LABEL_57;
    goto LABEL_113;
  }
LABEL_112:
  v4[8] = self->_dbEffectiveContentPolicy;
  *(_QWORD *)((char *)v4 + 452) |= 0x80uLL;
  v12 = (uint64_t)self->_has;
  v13 = *((_WORD *)&self->_has + 4);
  if ((v12 & 0x4000000000000) == 0)
  {
LABEL_57:
    if ((v12 & 0x1000) == 0)
      goto LABEL_58;
    goto LABEL_114;
  }
LABEL_113:
  *((_BYTE *)v4 + 424) = self->_dbIsPackage;
  *(_QWORD *)((char *)v4 + 452) |= 0x4000000000000uLL;
  v12 = (uint64_t)self->_has;
  v13 = *((_WORD *)&self->_has + 4);
  if ((v12 & 0x1000) == 0)
  {
LABEL_58:
    if ((v12 & 0x200) == 0)
      goto LABEL_59;
    goto LABEL_115;
  }
LABEL_114:
  v4[13] = self->_dbFsContentStatus;
  *(_QWORD *)((char *)v4 + 452) |= 0x1000uLL;
  v12 = (uint64_t)self->_has;
  v13 = *((_WORD *)&self->_has + 4);
  if ((v12 & 0x200) == 0)
  {
LABEL_59:
    if ((v12 & 0x2000) == 0)
      goto LABEL_60;
    goto LABEL_116;
  }
LABEL_115:
  v4[10] = self->_dbFpContentStatus;
  *(_QWORD *)((char *)v4 + 452) |= 0x200uLL;
  v12 = (uint64_t)self->_has;
  v13 = *((_WORD *)&self->_has + 4);
  if ((v12 & 0x2000) == 0)
  {
LABEL_60:
    if ((v12 & 0x400) == 0)
      goto LABEL_61;
    goto LABEL_117;
  }
LABEL_116:
  v4[14] = self->_dbFsDeletionStatus;
  *(_QWORD *)((char *)v4 + 452) |= 0x2000uLL;
  v12 = (uint64_t)self->_has;
  v13 = *((_WORD *)&self->_has + 4);
  if ((v12 & 0x400) == 0)
  {
LABEL_61:
    if ((v12 & 0x4000) == 0)
      goto LABEL_62;
    goto LABEL_118;
  }
LABEL_117:
  v4[11] = self->_dbFpDeletionStatus;
  *(_QWORD *)((char *)v4 + 452) |= 0x400uLL;
  v12 = (uint64_t)self->_has;
  v13 = *((_WORD *)&self->_has + 4);
  if ((v12 & 0x4000) == 0)
  {
LABEL_62:
    if ((v12 & 0x800) == 0)
      goto LABEL_63;
    goto LABEL_119;
  }
LABEL_118:
  v4[15] = self->_dbFsImportStatus;
  *(_QWORD *)((char *)v4 + 452) |= 0x4000uLL;
  v12 = (uint64_t)self->_has;
  v13 = *((_WORD *)&self->_has + 4);
  if ((v12 & 0x800) == 0)
  {
LABEL_63:
    if ((v12 & 0x8000000000000) == 0)
      goto LABEL_64;
    goto LABEL_120;
  }
LABEL_119:
  v4[12] = self->_dbFpImportStatus;
  *(_QWORD *)((char *)v4 + 452) |= 0x800uLL;
  v12 = (uint64_t)self->_has;
  v13 = *((_WORD *)&self->_has + 4);
  if ((v12 & 0x8000000000000) == 0)
  {
LABEL_64:
    if ((v12 & 0x800000) == 0)
      goto LABEL_65;
    goto LABEL_121;
  }
LABEL_120:
  *((_BYTE *)v4 + 425) = self->_dbIsSuper;
  *(_QWORD *)((char *)v4 + 452) |= 0x8000000000000uLL;
  v12 = (uint64_t)self->_has;
  v13 = *((_WORD *)&self->_has + 4);
  if ((v12 & 0x800000) == 0)
  {
LABEL_65:
    if ((v13 & 0x40) == 0)
      goto LABEL_66;
    goto LABEL_122;
  }
LABEL_121:
  v4[24] = self->_gencountDiff;
  *(_QWORD *)((char *)v4 + 452) |= 0x800000uLL;
  v12 = (uint64_t)self->_has;
  v13 = *((_WORD *)&self->_has + 4);
  if ((v13 & 0x40) == 0)
  {
LABEL_66:
    if ((v12 & 0x800000000000) == 0)
      goto LABEL_67;
    goto LABEL_123;
  }
LABEL_122:
  *((_BYTE *)v4 + 444) = self->_parentMatches;
  *((_WORD *)v4 + 230) |= 0x40u;
  v12 = (uint64_t)self->_has;
  v13 = *((_WORD *)&self->_has + 4);
  if ((v12 & 0x800000000000) == 0)
  {
LABEL_67:
    if ((v13 & 8) == 0)
      goto LABEL_68;
    goto LABEL_124;
  }
LABEL_123:
  *((_BYTE *)v4 + 421) = self->_appLibraryMatches;
  *(_QWORD *)((char *)v4 + 452) |= 0x800000000000uLL;
  v12 = (uint64_t)self->_has;
  v13 = *((_WORD *)&self->_has + 4);
  if ((v13 & 8) == 0)
  {
LABEL_68:
    if ((v12 & 0x20000000000000) == 0)
      goto LABEL_69;
    goto LABEL_125;
  }
LABEL_124:
  *((_BYTE *)v4 + 441) = self->_mTimeBeforeMigrationStarted;
  *((_WORD *)v4 + 230) |= 8u;
  v12 = (uint64_t)self->_has;
  v13 = *((_WORD *)&self->_has + 4);
  if ((v12 & 0x20000000000000) == 0)
  {
LABEL_69:
    if ((v12 & 0x4000000) == 0)
      goto LABEL_70;
    goto LABEL_126;
  }
LABEL_125:
  *((_BYTE *)v4 + 427) = self->_docIDMatches;
  *(_QWORD *)((char *)v4 + 452) |= 0x20000000000000uLL;
  v12 = (uint64_t)self->_has;
  v13 = *((_WORD *)&self->_has + 4);
  if ((v12 & 0x4000000) == 0)
  {
LABEL_70:
    if ((v12 & 0x10) == 0)
      goto LABEL_71;
    goto LABEL_127;
  }
LABEL_126:
  v4[27] = self->_mTime;
  *(_QWORD *)((char *)v4 + 452) |= 0x4000000uLL;
  v12 = (uint64_t)self->_has;
  v13 = *((_WORD *)&self->_has + 4);
  if ((v12 & 0x10) == 0)
  {
LABEL_71:
    if ((v12 & 0x1000000000000) == 0)
      goto LABEL_72;
    goto LABEL_128;
  }
LABEL_127:
  v4[5] = self->_bTime;
  *(_QWORD *)((char *)v4 + 452) |= 0x10uLL;
  v13 = *((_WORD *)&self->_has + 4);
  if ((*(_QWORD *)&self->_has & 0x1000000000000) == 0)
  {
LABEL_72:
    if ((v13 & 0x100) == 0)
      goto LABEL_74;
    goto LABEL_73;
  }
LABEL_128:
  *((_BYTE *)v4 + 422) = self->_bTimeIsBusy;
  *(_QWORD *)((char *)v4 + 452) |= 0x1000000000000uLL;
  if ((*((_WORD *)&self->_has + 4) & 0x100) != 0)
  {
LABEL_73:
    *((_BYTE *)v4 + 446) = self->_xattrHasBeforeBounce;
    *((_WORD *)v4 + 230) |= 0x100u;
  }
LABEL_74:
  if (self->_nameUnicodeNorm)
  {
    objc_msgSend(v19, "setNameUnicodeNorm:");
    v4 = v19;
  }
  v14 = &self->_has;
  v15 = *((_WORD *)&self->_has + 4);
  if ((v15 & 0x10) != 0)
  {
    *((_BYTE *)v4 + 442) = self->_nameIsTrashed;
    *((_WORD *)v4 + 230) |= 0x10u;
    v16 = *(_QWORD *)v14;
    v15 = *((_WORD *)&self->_has + 4);
    if ((*(_QWORD *)v14 & 0x8000000000) == 0)
      goto LABEL_132;
    goto LABEL_131;
  }
  v16 = *(_QWORD *)v14;
  if ((*(_QWORD *)v14 & 0x8000000000) != 0)
  {
LABEL_131:
    v4[40] = self->_sysPageSize;
    *(_QWORD *)((char *)v4 + 452) |= 0x8000000000uLL;
    v16 = (uint64_t)self->_has;
    v15 = *((_WORD *)&self->_has + 4);
  }
LABEL_132:
  if ((v16 & 0x10000000000) != 0)
  {
    v4[41] = self->_sysUID;
    *(_QWORD *)((char *)v4 + 452) |= 0x10000000000uLL;
    v16 = (uint64_t)self->_has;
    if ((*((_WORD *)&self->_has + 4) & 0x80) == 0)
    {
LABEL_134:
      if ((v16 & 0x40000000) == 0)
        goto LABEL_135;
      goto LABEL_158;
    }
  }
  else if ((v15 & 0x80) == 0)
  {
    goto LABEL_134;
  }
  *((_BYTE *)v4 + 445) = self->_sysDocIDResolutionOK;
  *((_WORD *)v4 + 230) |= 0x80u;
  v16 = (uint64_t)self->_has;
  if ((v16 & 0x40000000) == 0)
  {
LABEL_135:
    if ((v16 & 0x20000000) == 0)
      goto LABEL_136;
    goto LABEL_159;
  }
LABEL_158:
  v4[31] = self->_purgeGenCount;
  *(_QWORD *)((char *)v4 + 452) |= 0x40000000uLL;
  v16 = (uint64_t)self->_has;
  if ((v16 & 0x20000000) == 0)
  {
LABEL_136:
    if ((v16 & 0x80000000) == 0)
      goto LABEL_137;
    goto LABEL_160;
  }
LABEL_159:
  v4[30] = self->_purgeATime;
  *(_QWORD *)((char *)v4 + 452) |= 0x20000000uLL;
  v16 = (uint64_t)self->_has;
  if ((v16 & 0x80000000) == 0)
  {
LABEL_137:
    if ((v16 & 0x80000) == 0)
      goto LABEL_138;
    goto LABEL_161;
  }
LABEL_160:
  v4[32] = self->_purgeSyncRoot;
  *(_QWORD *)((char *)v4 + 452) |= 0x80000000uLL;
  v16 = (uint64_t)self->_has;
  if ((v16 & 0x80000) == 0)
  {
LABEL_138:
    if ((v16 & 0x40000) == 0)
      goto LABEL_139;
    goto LABEL_162;
  }
LABEL_161:
  v4[20] = self->_diagFailuresBitmap;
  *(_QWORD *)((char *)v4 + 452) |= 0x80000uLL;
  v16 = (uint64_t)self->_has;
  if ((v16 & 0x40000) == 0)
  {
LABEL_139:
    if ((v16 & 0x100000) == 0)
      goto LABEL_141;
    goto LABEL_140;
  }
LABEL_162:
  v4[19] = self->_diagErrorCode;
  *(_QWORD *)((char *)v4 + 452) |= 0x40000uLL;
  if ((*(_QWORD *)&self->_has & 0x100000) != 0)
  {
LABEL_140:
    v4[21] = self->_diagUnderlyingErrorCode;
    *(_QWORD *)((char *)v4 + 452) |= 0x100000uLL;
  }
LABEL_141:
  if (self->_diagErrorDomain)
  {
    objc_msgSend(v19, "setDiagErrorDomain:");
    v4 = v19;
  }
  if (self->_diagUnderlyingErrorDomain)
  {
    objc_msgSend(v19, "setDiagUnderlyingErrorDomain:");
    v4 = v19;
  }
  v17 = &self->_has;
  v18 = (uint64_t)self->_has;
  if ((v18 & 1) != 0)
  {
    v4[1] = self->_apfsAvailableSpace;
    *(_QWORD *)((char *)v4 + 452) |= 1uLL;
    v18 = *(_QWORD *)v17;
    if ((*(_QWORD *)v17 & 4) == 0)
    {
LABEL_147:
      if ((v18 & 2) == 0)
        goto LABEL_148;
      goto LABEL_166;
    }
  }
  else if ((v18 & 4) == 0)
  {
    goto LABEL_147;
  }
  v4[3] = self->_apfsFlags;
  *(_QWORD *)((char *)v4 + 452) |= 4uLL;
  v18 = (uint64_t)self->_has;
  if ((v18 & 2) == 0)
  {
LABEL_148:
    if ((v18 & 8) == 0)
      goto LABEL_149;
    goto LABEL_167;
  }
LABEL_166:
  v4[2] = self->_apfsBlockSize;
  *(_QWORD *)((char *)v4 + 452) |= 2uLL;
  v18 = (uint64_t)self->_has;
  if ((v18 & 8) == 0)
  {
LABEL_149:
    if ((v18 & 0x400000000000) == 0)
      goto LABEL_150;
    goto LABEL_168;
  }
LABEL_167:
  v4[4] = self->_apfsRole;
  *(_QWORD *)((char *)v4 + 452) |= 8uLL;
  v18 = (uint64_t)self->_has;
  if ((v18 & 0x400000000000) == 0)
  {
LABEL_150:
    if ((v18 & 0x1000000000) == 0)
      goto LABEL_151;
    goto LABEL_169;
  }
LABEL_168:
  *((_BYTE *)v4 + 420) = self->_apfsEncrypted;
  *(_QWORD *)((char *)v4 + 452) |= 0x400000000000uLL;
  v18 = (uint64_t)self->_has;
  if ((v18 & 0x1000000000) == 0)
  {
LABEL_151:
    if ((v18 & 0x2000000000) == 0)
      goto LABEL_152;
    goto LABEL_170;
  }
LABEL_169:
  v4[37] = self->_statDocID;
  *(_QWORD *)((char *)v4 + 452) |= 0x1000000000uLL;
  v18 = (uint64_t)self->_has;
  if ((v18 & 0x2000000000) == 0)
  {
LABEL_152:
    if ((v18 & 0x4000000000) == 0)
      goto LABEL_153;
LABEL_171:
    v4[39] = self->_statPhysicalSize;
    *(_QWORD *)((char *)v4 + 452) |= 0x4000000000uLL;
    if ((*(_QWORD *)&self->_has & 0x800000000) == 0)
      goto LABEL_155;
    goto LABEL_154;
  }
LABEL_170:
  v4[38] = self->_statLogicalSize;
  *(_QWORD *)((char *)v4 + 452) |= 0x2000000000uLL;
  v18 = (uint64_t)self->_has;
  if ((v18 & 0x4000000000) != 0)
    goto LABEL_171;
LABEL_153:
  if ((v18 & 0x800000000) != 0)
  {
LABEL_154:
    v4[36] = self->_statDirEntryCount;
    *(_QWORD *)((char *)v4 + 452) |= 0x800000000uLL;
  }
LABEL_155:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  $2082CF93F90B3E6732D9C5A72A2BCBB8 *p_has;
  uint64_t has;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  void *v14;
  $2082CF93F90B3E6732D9C5A72A2BCBB8 *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  void *v25;
  $2082CF93F90B3E6732D9C5A72A2BCBB8 *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  $2082CF93F90B3E6732D9C5A72A2BCBB8 *v33;
  uint64_t v34;
  id v35;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  p_has = &self->_has;
  has = (uint64_t)self->_has;
  if ((has & 0x2000000) != 0)
  {
    *(_QWORD *)(v5 + 208) = self->_itemNumber;
    *(_QWORD *)(v5 + 452) |= 0x2000000uLL;
    has = *(_QWORD *)p_has;
    if ((*(_QWORD *)p_has & 0x80000000000) == 0)
    {
LABEL_3:
      if ((has & 0x40000000000) == 0)
        goto LABEL_4;
      goto LABEL_71;
    }
  }
  else if ((has & 0x80000000000) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 384) = self->_itemType;
  *(_QWORD *)(v5 + 452) |= 0x80000000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x40000000000) == 0)
  {
LABEL_4:
    if ((has & 0x800000000000000) == 0)
      goto LABEL_5;
    goto LABEL_72;
  }
LABEL_71:
  *(_DWORD *)(v5 + 340) = self->_dataProtectionClass;
  *(_QWORD *)(v5 + 452) |= 0x40000000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x800000000000000) == 0)
  {
LABEL_5:
    if ((has & 0x1000000000000000) == 0)
      goto LABEL_6;
    goto LABEL_73;
  }
LABEL_72:
  *(_BYTE *)(v5 + 433) = self->_isOwnedByLoggedInUser;
  *(_QWORD *)(v5 + 452) |= 0x800000000000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x1000000000000000) == 0)
  {
LABEL_6:
    if ((has & 0x200000000000) == 0)
      goto LABEL_7;
    goto LABEL_74;
  }
LABEL_73:
  *(_BYTE *)(v5 + 434) = self->_isOwnedByRoot;
  *(_QWORD *)(v5 + 452) |= 0x1000000000000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x200000000000) == 0)
  {
LABEL_7:
    if ((has & 0x100000000000000) == 0)
      goto LABEL_8;
    goto LABEL_75;
  }
LABEL_74:
  *(_DWORD *)(v5 + 416) = self->_xattrCount;
  *(_QWORD *)(v5 + 452) |= 0x200000000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x100000000000000) == 0)
  {
LABEL_8:
    if ((has & 0x8000000000000000) == 0)
      goto LABEL_9;
    goto LABEL_76;
  }
LABEL_75:
  *(_BYTE *)(v5 + 430) = self->_isAppleDouble;
  *(_QWORD *)(v5 + 452) |= 0x100000000000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x8000000000000000) == 0)
  {
LABEL_9:
    if ((has & 0x4000000000000000) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_76:
  *(_BYTE *)(v5 + 437) = self->_isResourceFork;
  *(_QWORD *)(v5 + 452) |= 0x8000000000000000;
  if ((*(_QWORD *)&self->_has & 0x4000000000000000) != 0)
  {
LABEL_10:
    *(_BYTE *)(v5 + 436) = self->_isQuarantined;
    *(_QWORD *)(v5 + 452) |= 0x4000000000000000uLL;
  }
LABEL_11:
  v9 = -[NSString copyWithZone:](self->_utType, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 408);
  *(_QWORD *)(v6 + 408) = v9;

  v11 = (uint64_t)self->_has;
  if ((v11 & 0x200000000000000) != 0)
  {
    *(_BYTE *)(v6 + 431) = self->_isBundleBit;
    *(_QWORD *)(v6 + 452) |= 0x200000000000000uLL;
    v11 = (uint64_t)self->_has;
  }
  v12 = *((_WORD *)&self->_has + 4);
  if ((v12 & 1) != 0)
  {
    *(_BYTE *)(v6 + 438) = self->_isSparseFile;
    *(_WORD *)(v6 + 460) |= 1u;
    v11 = (uint64_t)self->_has;
    v12 = *((_WORD *)&self->_has + 4);
    if ((v11 & 0x20000000000) == 0)
    {
LABEL_15:
      if ((v11 & 0x100000000) == 0)
        goto LABEL_16;
      goto LABEL_80;
    }
  }
  else if ((v11 & 0x20000000000) == 0)
  {
    goto LABEL_15;
  }
  *(_DWORD *)(v6 + 336) = self->_compressionType;
  *(_QWORD *)(v6 + 452) |= 0x20000000000uLL;
  v11 = (uint64_t)self->_has;
  v12 = *((_WORD *)&self->_has + 4);
  if ((v11 & 0x100000000) == 0)
  {
LABEL_16:
    if ((v11 & 0x20) == 0)
      goto LABEL_17;
    goto LABEL_81;
  }
LABEL_80:
  *(_QWORD *)(v6 + 264) = self->_readErrorCode;
  *(_QWORD *)(v6 + 452) |= 0x100000000uLL;
  v11 = (uint64_t)self->_has;
  v12 = *((_WORD *)&self->_has + 4);
  if ((v11 & 0x20) == 0)
  {
LABEL_17:
    if ((v11 & 0x100000000000) == 0)
      goto LABEL_18;
    goto LABEL_82;
  }
LABEL_81:
  *(_QWORD *)(v6 + 48) = self->_cloneErrorCode;
  *(_QWORD *)(v6 + 452) |= 0x20uLL;
  v11 = (uint64_t)self->_has;
  v12 = *((_WORD *)&self->_has + 4);
  if ((v11 & 0x100000000000) == 0)
  {
LABEL_18:
    if ((v11 & 0x10000000) == 0)
      goto LABEL_19;
    goto LABEL_83;
  }
LABEL_82:
  *(_DWORD *)(v6 + 400) = self->_syncRootEnum;
  *(_QWORD *)(v6 + 452) |= 0x100000000000uLL;
  v11 = (uint64_t)self->_has;
  v12 = *((_WORD *)&self->_has + 4);
  if ((v11 & 0x10000000) == 0)
  {
LABEL_19:
    if ((v11 & 0x200000) == 0)
      goto LABEL_20;
    goto LABEL_84;
  }
LABEL_83:
  *(_QWORD *)(v6 + 232) = self->_pathLength;
  *(_QWORD *)(v6 + 452) |= 0x10000000uLL;
  v11 = (uint64_t)self->_has;
  v12 = *((_WORD *)&self->_has + 4);
  if ((v11 & 0x200000) == 0)
  {
LABEL_20:
    if ((v11 & 0x400000000) == 0)
      goto LABEL_21;
    goto LABEL_85;
  }
LABEL_84:
  *(_QWORD *)(v6 + 176) = self->_fileNameLength;
  *(_QWORD *)(v6 + 452) |= 0x200000uLL;
  v11 = (uint64_t)self->_has;
  v12 = *((_WORD *)&self->_has + 4);
  if ((v11 & 0x400000000) == 0)
  {
LABEL_21:
    if ((v11 & 0x200000000) == 0)
      goto LABEL_22;
    goto LABEL_86;
  }
LABEL_85:
  *(_QWORD *)(v6 + 280) = self->_stMode;
  *(_QWORD *)(v6 + 452) |= 0x400000000uLL;
  v11 = (uint64_t)self->_has;
  v12 = *((_WORD *)&self->_has + 4);
  if ((v11 & 0x200000000) == 0)
  {
LABEL_22:
    if ((v11 & 0x40000000000000) == 0)
      goto LABEL_23;
    goto LABEL_87;
  }
LABEL_86:
  *(_QWORD *)(v6 + 272) = self->_stFlags;
  *(_QWORD *)(v6 + 452) |= 0x200000000uLL;
  v11 = (uint64_t)self->_has;
  v12 = *((_WORD *)&self->_has + 4);
  if ((v11 & 0x40000000000000) == 0)
  {
LABEL_23:
    if ((v12 & 0x20) == 0)
      goto LABEL_24;
    goto LABEL_88;
  }
LABEL_87:
  *(_BYTE *)(v6 + 428) = self->_hasAcls;
  *(_QWORD *)(v6 + 452) |= 0x40000000000000uLL;
  v11 = (uint64_t)self->_has;
  v12 = *((_WORD *)&self->_has + 4);
  if ((v12 & 0x20) == 0)
  {
LABEL_24:
    if ((v11 & 0x2000000000000000) == 0)
      goto LABEL_25;
    goto LABEL_89;
  }
LABEL_88:
  *(_BYTE *)(v6 + 443) = self->_parentHasAcls;
  *(_WORD *)(v6 + 460) |= 0x20u;
  v11 = (uint64_t)self->_has;
  v12 = *((_WORD *)&self->_has + 4);
  if ((v11 & 0x2000000000000000) == 0)
  {
LABEL_25:
    if ((v12 & 4) == 0)
      goto LABEL_26;
    goto LABEL_90;
  }
LABEL_89:
  *(_BYTE *)(v6 + 435) = self->_isPurgable;
  *(_QWORD *)(v6 + 452) |= 0x2000000000000000uLL;
  v11 = (uint64_t)self->_has;
  v12 = *((_WORD *)&self->_has + 4);
  if ((v12 & 4) == 0)
  {
LABEL_26:
    if ((v12 & 2) == 0)
      goto LABEL_27;
    goto LABEL_91;
  }
LABEL_90:
  *(_BYTE *)(v6 + 440) = self->_isUrgent;
  *(_WORD *)(v6 + 460) |= 4u;
  v11 = (uint64_t)self->_has;
  if ((*((_WORD *)&self->_has + 4) & 2) == 0)
  {
LABEL_27:
    if ((v11 & 0x400000000000000) == 0)
      goto LABEL_29;
    goto LABEL_28;
  }
LABEL_91:
  *(_BYTE *)(v6 + 439) = self->_isUnderDirStatFolder;
  *(_WORD *)(v6 + 460) |= 2u;
  if ((*(_QWORD *)&self->_has & 0x400000000000000) != 0)
  {
LABEL_28:
    *(_BYTE *)(v6 + 432) = self->_isFileNameNonAscii;
    *(_QWORD *)(v6 + 452) |= 0x400000000000000uLL;
  }
LABEL_29:
  v13 = -[NSString copyWithZone:](self->_finderInfoFlagsBase64, "copyWithZone:", a3);
  v14 = *(void **)(v6 + 376);
  *(_QWORD *)(v6 + 376) = v13;

  v15 = &self->_has;
  v16 = (uint64_t)self->_has;
  if ((v16 & 0x1000000) != 0)
  {
    *(_QWORD *)(v6 + 200) = self->_hasMoreLinks;
    *(_QWORD *)(v6 + 452) |= 0x1000000uLL;
    v16 = *(_QWORD *)v15;
    if ((*(_QWORD *)v15 & 0x400000) == 0)
    {
LABEL_31:
      if ((v16 & 0x8000) == 0)
        goto LABEL_32;
      goto LABEL_95;
    }
  }
  else if ((v16 & 0x400000) == 0)
  {
    goto LABEL_31;
  }
  *(_QWORD *)(v6 + 184) = self->_fsGenCount;
  *(_QWORD *)(v6 + 452) |= 0x400000uLL;
  v16 = (uint64_t)self->_has;
  if ((v16 & 0x8000) == 0)
  {
LABEL_32:
    if ((v16 & 0x80000000000000) == 0)
      goto LABEL_33;
    goto LABEL_96;
  }
LABEL_95:
  *(_QWORD *)(v6 + 128) = self->_dbGenCount;
  *(_QWORD *)(v6 + 452) |= 0x8000uLL;
  v16 = (uint64_t)self->_has;
  if ((v16 & 0x80000000000000) == 0)
  {
LABEL_33:
    if ((v16 & 0x10000000000000) == 0)
      goto LABEL_35;
    goto LABEL_34;
  }
LABEL_96:
  *(_BYTE *)(v6 + 429) = self->_hasLocalChanges;
  *(_QWORD *)(v6 + 452) |= 0x80000000000000uLL;
  if ((*(_QWORD *)&self->_has & 0x10000000000000) != 0)
  {
LABEL_34:
    *(_BYTE *)(v6 + 426) = self->_doGenCountsMatchInFileId;
    *(_QWORD *)(v6 + 452) |= 0x10000000000000uLL;
  }
LABEL_35:
  v17 = -[NSString copyWithZone:](self->_fileNameExtension, "copyWithZone:", a3);
  v18 = *(void **)(v6 + 368);
  *(_QWORD *)(v6 + 368) = v17;

  if ((*(_QWORD *)&self->_has & 0x8000000) != 0)
  {
    *(_QWORD *)(v6 + 224) = self->_pathDepth;
    *(_QWORD *)(v6 + 452) |= 0x8000000uLL;
  }
  v19 = *((_WORD *)&self->_has + 4);
  if ((v19 & 0x200) != 0)
  {
    *(_BYTE *)(v6 + 447) = self->_xattrHasDemotion;
    *(_WORD *)(v6 + 460) |= 0x200u;
    v19 = *((_WORD *)&self->_has + 4);
  }
  if ((v19 & 0x400) != 0)
  {
    *(_BYTE *)(v6 + 448) = self->_xattrHasPromotion;
    *(_WORD *)(v6 + 460) |= 0x400u;
  }
  v20 = -[NSString copyWithZone:](self->_dbErrorDomain, "copyWithZone:", a3);
  v21 = *(void **)(v6 + 344);
  *(_QWORD *)(v6 + 344) = v20;

  v22 = (uint64_t)self->_has;
  if ((v22 & 0x100) != 0)
  {
    *(_QWORD *)(v6 + 72) = self->_dbErrorCode;
    *(_QWORD *)(v6 + 452) |= 0x100uLL;
    v22 = (uint64_t)self->_has;
  }
  v23 = *((_WORD *)&self->_has + 4);
  if ((v22 & 0x40) != 0)
  {
    *(_QWORD *)(v6 + 56) = self->_dbCapabilities;
    *(_QWORD *)(v6 + 452) |= 0x40uLL;
    v22 = (uint64_t)self->_has;
    v23 = *((_WORD *)&self->_has + 4);
    if ((v22 & 0x20000) == 0)
    {
LABEL_45:
      if ((v22 & 0x10000) == 0)
        goto LABEL_46;
      goto LABEL_100;
    }
  }
  else if ((v22 & 0x20000) == 0)
  {
    goto LABEL_45;
  }
  *(_QWORD *)(v6 + 144) = self->_dbTransferState;
  *(_QWORD *)(v6 + 452) |= 0x20000uLL;
  v22 = (uint64_t)self->_has;
  v23 = *((_WORD *)&self->_has + 4);
  if ((v22 & 0x10000) == 0)
  {
LABEL_46:
    if ((v22 & 0x2000000000000) == 0)
      goto LABEL_47;
    goto LABEL_101;
  }
LABEL_100:
  *(_QWORD *)(v6 + 136) = self->_dbSharingState;
  *(_QWORD *)(v6 + 452) |= 0x10000uLL;
  v22 = (uint64_t)self->_has;
  v23 = *((_WORD *)&self->_has + 4);
  if ((v22 & 0x2000000000000) == 0)
  {
LABEL_47:
    if ((v22 & 0x80) == 0)
      goto LABEL_48;
    goto LABEL_102;
  }
LABEL_101:
  *(_BYTE *)(v6 + 423) = self->_dbIsApplibrary;
  *(_QWORD *)(v6 + 452) |= 0x2000000000000uLL;
  v22 = (uint64_t)self->_has;
  v23 = *((_WORD *)&self->_has + 4);
  if ((v22 & 0x80) == 0)
  {
LABEL_48:
    if ((v22 & 0x4000000000000) == 0)
      goto LABEL_49;
    goto LABEL_103;
  }
LABEL_102:
  *(_QWORD *)(v6 + 64) = self->_dbEffectiveContentPolicy;
  *(_QWORD *)(v6 + 452) |= 0x80uLL;
  v22 = (uint64_t)self->_has;
  v23 = *((_WORD *)&self->_has + 4);
  if ((v22 & 0x4000000000000) == 0)
  {
LABEL_49:
    if ((v22 & 0x1000) == 0)
      goto LABEL_50;
    goto LABEL_104;
  }
LABEL_103:
  *(_BYTE *)(v6 + 424) = self->_dbIsPackage;
  *(_QWORD *)(v6 + 452) |= 0x4000000000000uLL;
  v22 = (uint64_t)self->_has;
  v23 = *((_WORD *)&self->_has + 4);
  if ((v22 & 0x1000) == 0)
  {
LABEL_50:
    if ((v22 & 0x200) == 0)
      goto LABEL_51;
    goto LABEL_105;
  }
LABEL_104:
  *(_QWORD *)(v6 + 104) = self->_dbFsContentStatus;
  *(_QWORD *)(v6 + 452) |= 0x1000uLL;
  v22 = (uint64_t)self->_has;
  v23 = *((_WORD *)&self->_has + 4);
  if ((v22 & 0x200) == 0)
  {
LABEL_51:
    if ((v22 & 0x2000) == 0)
      goto LABEL_52;
    goto LABEL_106;
  }
LABEL_105:
  *(_QWORD *)(v6 + 80) = self->_dbFpContentStatus;
  *(_QWORD *)(v6 + 452) |= 0x200uLL;
  v22 = (uint64_t)self->_has;
  v23 = *((_WORD *)&self->_has + 4);
  if ((v22 & 0x2000) == 0)
  {
LABEL_52:
    if ((v22 & 0x400) == 0)
      goto LABEL_53;
    goto LABEL_107;
  }
LABEL_106:
  *(_QWORD *)(v6 + 112) = self->_dbFsDeletionStatus;
  *(_QWORD *)(v6 + 452) |= 0x2000uLL;
  v22 = (uint64_t)self->_has;
  v23 = *((_WORD *)&self->_has + 4);
  if ((v22 & 0x400) == 0)
  {
LABEL_53:
    if ((v22 & 0x4000) == 0)
      goto LABEL_54;
    goto LABEL_108;
  }
LABEL_107:
  *(_QWORD *)(v6 + 88) = self->_dbFpDeletionStatus;
  *(_QWORD *)(v6 + 452) |= 0x400uLL;
  v22 = (uint64_t)self->_has;
  v23 = *((_WORD *)&self->_has + 4);
  if ((v22 & 0x4000) == 0)
  {
LABEL_54:
    if ((v22 & 0x800) == 0)
      goto LABEL_55;
    goto LABEL_109;
  }
LABEL_108:
  *(_QWORD *)(v6 + 120) = self->_dbFsImportStatus;
  *(_QWORD *)(v6 + 452) |= 0x4000uLL;
  v22 = (uint64_t)self->_has;
  v23 = *((_WORD *)&self->_has + 4);
  if ((v22 & 0x800) == 0)
  {
LABEL_55:
    if ((v22 & 0x8000000000000) == 0)
      goto LABEL_56;
    goto LABEL_110;
  }
LABEL_109:
  *(_QWORD *)(v6 + 96) = self->_dbFpImportStatus;
  *(_QWORD *)(v6 + 452) |= 0x800uLL;
  v22 = (uint64_t)self->_has;
  v23 = *((_WORD *)&self->_has + 4);
  if ((v22 & 0x8000000000000) == 0)
  {
LABEL_56:
    if ((v22 & 0x800000) == 0)
      goto LABEL_57;
    goto LABEL_111;
  }
LABEL_110:
  *(_BYTE *)(v6 + 425) = self->_dbIsSuper;
  *(_QWORD *)(v6 + 452) |= 0x8000000000000uLL;
  v22 = (uint64_t)self->_has;
  v23 = *((_WORD *)&self->_has + 4);
  if ((v22 & 0x800000) == 0)
  {
LABEL_57:
    if ((v23 & 0x40) == 0)
      goto LABEL_58;
    goto LABEL_112;
  }
LABEL_111:
  *(_QWORD *)(v6 + 192) = self->_gencountDiff;
  *(_QWORD *)(v6 + 452) |= 0x800000uLL;
  v22 = (uint64_t)self->_has;
  v23 = *((_WORD *)&self->_has + 4);
  if ((v23 & 0x40) == 0)
  {
LABEL_58:
    if ((v22 & 0x800000000000) == 0)
      goto LABEL_59;
    goto LABEL_113;
  }
LABEL_112:
  *(_BYTE *)(v6 + 444) = self->_parentMatches;
  *(_WORD *)(v6 + 460) |= 0x40u;
  v22 = (uint64_t)self->_has;
  v23 = *((_WORD *)&self->_has + 4);
  if ((v22 & 0x800000000000) == 0)
  {
LABEL_59:
    if ((v23 & 8) == 0)
      goto LABEL_60;
    goto LABEL_114;
  }
LABEL_113:
  *(_BYTE *)(v6 + 421) = self->_appLibraryMatches;
  *(_QWORD *)(v6 + 452) |= 0x800000000000uLL;
  v22 = (uint64_t)self->_has;
  v23 = *((_WORD *)&self->_has + 4);
  if ((v23 & 8) == 0)
  {
LABEL_60:
    if ((v22 & 0x20000000000000) == 0)
      goto LABEL_61;
    goto LABEL_115;
  }
LABEL_114:
  *(_BYTE *)(v6 + 441) = self->_mTimeBeforeMigrationStarted;
  *(_WORD *)(v6 + 460) |= 8u;
  v22 = (uint64_t)self->_has;
  v23 = *((_WORD *)&self->_has + 4);
  if ((v22 & 0x20000000000000) == 0)
  {
LABEL_61:
    if ((v22 & 0x4000000) == 0)
      goto LABEL_62;
    goto LABEL_116;
  }
LABEL_115:
  *(_BYTE *)(v6 + 427) = self->_docIDMatches;
  *(_QWORD *)(v6 + 452) |= 0x20000000000000uLL;
  v22 = (uint64_t)self->_has;
  v23 = *((_WORD *)&self->_has + 4);
  if ((v22 & 0x4000000) == 0)
  {
LABEL_62:
    if ((v22 & 0x10) == 0)
      goto LABEL_63;
    goto LABEL_117;
  }
LABEL_116:
  *(_QWORD *)(v6 + 216) = self->_mTime;
  *(_QWORD *)(v6 + 452) |= 0x4000000uLL;
  v22 = (uint64_t)self->_has;
  v23 = *((_WORD *)&self->_has + 4);
  if ((v22 & 0x10) == 0)
  {
LABEL_63:
    if ((v22 & 0x1000000000000) == 0)
      goto LABEL_64;
    goto LABEL_118;
  }
LABEL_117:
  *(_QWORD *)(v6 + 40) = self->_bTime;
  *(_QWORD *)(v6 + 452) |= 0x10uLL;
  v23 = *((_WORD *)&self->_has + 4);
  if ((*(_QWORD *)&self->_has & 0x1000000000000) == 0)
  {
LABEL_64:
    if ((v23 & 0x100) == 0)
      goto LABEL_66;
    goto LABEL_65;
  }
LABEL_118:
  *(_BYTE *)(v6 + 422) = self->_bTimeIsBusy;
  *(_QWORD *)(v6 + 452) |= 0x1000000000000uLL;
  if ((*((_WORD *)&self->_has + 4) & 0x100) != 0)
  {
LABEL_65:
    *(_BYTE *)(v6 + 446) = self->_xattrHasBeforeBounce;
    *(_WORD *)(v6 + 460) |= 0x100u;
  }
LABEL_66:
  v24 = -[NSString copyWithZone:](self->_nameUnicodeNorm, "copyWithZone:", a3);
  v25 = *(void **)(v6 + 392);
  *(_QWORD *)(v6 + 392) = v24;

  v26 = &self->_has;
  v27 = *((_WORD *)&self->_has + 4);
  if ((v27 & 0x10) != 0)
  {
    *(_BYTE *)(v6 + 442) = self->_nameIsTrashed;
    *(_WORD *)(v6 + 460) |= 0x10u;
    v28 = *(_QWORD *)v26;
    v27 = *((_WORD *)&self->_has + 4);
    if ((*(_QWORD *)v26 & 0x8000000000) == 0)
      goto LABEL_122;
    goto LABEL_121;
  }
  v28 = *(_QWORD *)v26;
  if ((*(_QWORD *)v26 & 0x8000000000) != 0)
  {
LABEL_121:
    *(_QWORD *)(v6 + 320) = self->_sysPageSize;
    *(_QWORD *)(v6 + 452) |= 0x8000000000uLL;
    v28 = (uint64_t)self->_has;
    v27 = *((_WORD *)&self->_has + 4);
  }
LABEL_122:
  if ((v28 & 0x10000000000) != 0)
  {
    *(_QWORD *)(v6 + 328) = self->_sysUID;
    *(_QWORD *)(v6 + 452) |= 0x10000000000uLL;
    v28 = (uint64_t)self->_has;
    if ((*((_WORD *)&self->_has + 4) & 0x80) == 0)
    {
LABEL_124:
      if ((v28 & 0x40000000) == 0)
        goto LABEL_125;
      goto LABEL_144;
    }
  }
  else if ((v27 & 0x80) == 0)
  {
    goto LABEL_124;
  }
  *(_BYTE *)(v6 + 445) = self->_sysDocIDResolutionOK;
  *(_WORD *)(v6 + 460) |= 0x80u;
  v28 = (uint64_t)self->_has;
  if ((v28 & 0x40000000) == 0)
  {
LABEL_125:
    if ((v28 & 0x20000000) == 0)
      goto LABEL_126;
    goto LABEL_145;
  }
LABEL_144:
  *(_QWORD *)(v6 + 248) = self->_purgeGenCount;
  *(_QWORD *)(v6 + 452) |= 0x40000000uLL;
  v28 = (uint64_t)self->_has;
  if ((v28 & 0x20000000) == 0)
  {
LABEL_126:
    if ((v28 & 0x80000000) == 0)
      goto LABEL_127;
    goto LABEL_146;
  }
LABEL_145:
  *(_QWORD *)(v6 + 240) = self->_purgeATime;
  *(_QWORD *)(v6 + 452) |= 0x20000000uLL;
  v28 = (uint64_t)self->_has;
  if ((v28 & 0x80000000) == 0)
  {
LABEL_127:
    if ((v28 & 0x80000) == 0)
      goto LABEL_128;
    goto LABEL_147;
  }
LABEL_146:
  *(_QWORD *)(v6 + 256) = self->_purgeSyncRoot;
  *(_QWORD *)(v6 + 452) |= 0x80000000uLL;
  v28 = (uint64_t)self->_has;
  if ((v28 & 0x80000) == 0)
  {
LABEL_128:
    if ((v28 & 0x40000) == 0)
      goto LABEL_129;
    goto LABEL_148;
  }
LABEL_147:
  *(_QWORD *)(v6 + 160) = self->_diagFailuresBitmap;
  *(_QWORD *)(v6 + 452) |= 0x80000uLL;
  v28 = (uint64_t)self->_has;
  if ((v28 & 0x40000) == 0)
  {
LABEL_129:
    if ((v28 & 0x100000) == 0)
      goto LABEL_131;
    goto LABEL_130;
  }
LABEL_148:
  *(_QWORD *)(v6 + 152) = self->_diagErrorCode;
  *(_QWORD *)(v6 + 452) |= 0x40000uLL;
  if ((*(_QWORD *)&self->_has & 0x100000) != 0)
  {
LABEL_130:
    *(_QWORD *)(v6 + 168) = self->_diagUnderlyingErrorCode;
    *(_QWORD *)(v6 + 452) |= 0x100000uLL;
  }
LABEL_131:
  v29 = -[NSString copyWithZone:](self->_diagErrorDomain, "copyWithZone:", a3);
  v30 = *(void **)(v6 + 352);
  *(_QWORD *)(v6 + 352) = v29;

  v31 = -[NSString copyWithZone:](self->_diagUnderlyingErrorDomain, "copyWithZone:", a3);
  v32 = *(void **)(v6 + 360);
  *(_QWORD *)(v6 + 360) = v31;

  v33 = &self->_has;
  v34 = (uint64_t)self->_has;
  if ((v34 & 1) != 0)
  {
    *(_QWORD *)(v6 + 8) = self->_apfsAvailableSpace;
    *(_QWORD *)(v6 + 452) |= 1uLL;
    v34 = *(_QWORD *)v33;
    if ((*(_QWORD *)v33 & 4) == 0)
    {
LABEL_133:
      if ((v34 & 2) == 0)
        goto LABEL_134;
      goto LABEL_152;
    }
  }
  else if ((v34 & 4) == 0)
  {
    goto LABEL_133;
  }
  *(_QWORD *)(v6 + 24) = self->_apfsFlags;
  *(_QWORD *)(v6 + 452) |= 4uLL;
  v34 = (uint64_t)self->_has;
  if ((v34 & 2) == 0)
  {
LABEL_134:
    if ((v34 & 8) == 0)
      goto LABEL_135;
    goto LABEL_153;
  }
LABEL_152:
  *(_QWORD *)(v6 + 16) = self->_apfsBlockSize;
  *(_QWORD *)(v6 + 452) |= 2uLL;
  v34 = (uint64_t)self->_has;
  if ((v34 & 8) == 0)
  {
LABEL_135:
    if ((v34 & 0x400000000000) == 0)
      goto LABEL_136;
    goto LABEL_154;
  }
LABEL_153:
  *(_QWORD *)(v6 + 32) = self->_apfsRole;
  *(_QWORD *)(v6 + 452) |= 8uLL;
  v34 = (uint64_t)self->_has;
  if ((v34 & 0x400000000000) == 0)
  {
LABEL_136:
    if ((v34 & 0x1000000000) == 0)
      goto LABEL_137;
    goto LABEL_155;
  }
LABEL_154:
  *(_BYTE *)(v6 + 420) = self->_apfsEncrypted;
  *(_QWORD *)(v6 + 452) |= 0x400000000000uLL;
  v34 = (uint64_t)self->_has;
  if ((v34 & 0x1000000000) == 0)
  {
LABEL_137:
    if ((v34 & 0x2000000000) == 0)
      goto LABEL_138;
    goto LABEL_156;
  }
LABEL_155:
  *(_QWORD *)(v6 + 296) = self->_statDocID;
  *(_QWORD *)(v6 + 452) |= 0x1000000000uLL;
  v34 = (uint64_t)self->_has;
  if ((v34 & 0x2000000000) == 0)
  {
LABEL_138:
    if ((v34 & 0x4000000000) == 0)
      goto LABEL_139;
LABEL_157:
    *(_QWORD *)(v6 + 312) = self->_statPhysicalSize;
    *(_QWORD *)(v6 + 452) |= 0x4000000000uLL;
    if ((*(_QWORD *)&self->_has & 0x800000000) == 0)
      goto LABEL_141;
    goto LABEL_140;
  }
LABEL_156:
  *(_QWORD *)(v6 + 304) = self->_statLogicalSize;
  *(_QWORD *)(v6 + 452) |= 0x2000000000uLL;
  v34 = (uint64_t)self->_has;
  if ((v34 & 0x4000000000) != 0)
    goto LABEL_157;
LABEL_139:
  if ((v34 & 0x800000000) != 0)
  {
LABEL_140:
    *(_QWORD *)(v6 + 288) = self->_statDirEntryCount;
    *(_QWORD *)(v6 + 452) |= 0x800000000uLL;
  }
LABEL_141:
  v35 = (id)v6;

  return v35;
}

- (BOOL)isEqual:(id)a3
{
  char *v4;
  __int16 v5;
  uint64_t has;
  uint64_t v7;
  NSString *utType;
  uint64_t v9;
  __int16 v10;
  NSString *finderInfoFlagsBase64;
  uint64_t v12;
  NSString *fileNameExtension;
  uint64_t v14;
  NSString *dbErrorDomain;
  uint64_t v16;
  __int16 v17;
  NSString *nameUnicodeNorm;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  NSString *diagErrorDomain;
  NSString *diagUnderlyingErrorDomain;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;

  v4 = (char *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_482;
  v5 = *((_WORD *)&self->_has + 4);
  has = (uint64_t)self->_has;
  v7 = *(_QWORD *)(v4 + 452);
  if ((has & 0x2000000) != 0)
  {
    if ((v7 & 0x2000000) == 0 || self->_itemNumber != *((_QWORD *)v4 + 26))
      goto LABEL_482;
  }
  else if ((v7 & 0x2000000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x80000000000) != 0)
  {
    if ((v7 & 0x80000000000) == 0 || self->_itemType != *((_DWORD *)v4 + 96))
      goto LABEL_482;
  }
  else if ((v7 & 0x80000000000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x40000000000) != 0)
  {
    if ((v7 & 0x40000000000) == 0 || self->_dataProtectionClass != *((_DWORD *)v4 + 85))
      goto LABEL_482;
  }
  else if ((v7 & 0x40000000000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x800000000000000) != 0)
  {
    if ((v7 & 0x800000000000000) == 0)
      goto LABEL_482;
    if (self->_isOwnedByLoggedInUser)
    {
      if (!v4[433])
        goto LABEL_482;
    }
    else if (v4[433])
    {
      goto LABEL_482;
    }
  }
  else if ((v7 & 0x800000000000000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x1000000000000000) != 0)
  {
    if ((v7 & 0x1000000000000000) == 0)
      goto LABEL_482;
    if (self->_isOwnedByRoot)
    {
      if (!v4[434])
        goto LABEL_482;
    }
    else if (v4[434])
    {
      goto LABEL_482;
    }
  }
  else if ((v7 & 0x1000000000000000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x200000000000) != 0)
  {
    if ((v7 & 0x200000000000) == 0 || self->_xattrCount != *((_DWORD *)v4 + 104))
      goto LABEL_482;
  }
  else if ((v7 & 0x200000000000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x100000000000000) != 0)
  {
    if ((v7 & 0x100000000000000) == 0)
      goto LABEL_482;
    if (self->_isAppleDouble)
    {
      if (!v4[430])
        goto LABEL_482;
    }
    else if (v4[430])
    {
      goto LABEL_482;
    }
  }
  else if ((v7 & 0x100000000000000) != 0)
  {
    goto LABEL_482;
  }
  if (has < 0)
  {
    if ((v7 & 0x8000000000000000) == 0)
      goto LABEL_482;
    if (self->_isResourceFork)
    {
      if (!v4[437])
        goto LABEL_482;
    }
    else if (v4[437])
    {
      goto LABEL_482;
    }
  }
  else if (v7 < 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x4000000000000000) != 0)
  {
    if ((v7 & 0x4000000000000000) == 0)
      goto LABEL_482;
    if (self->_isQuarantined)
    {
      if (!v4[436])
        goto LABEL_482;
    }
    else if (v4[436])
    {
      goto LABEL_482;
    }
  }
  else if ((v7 & 0x4000000000000000) != 0)
  {
    goto LABEL_482;
  }
  utType = self->_utType;
  if ((unint64_t)utType | *((_QWORD *)v4 + 51))
  {
    if (!-[NSString isEqual:](utType, "isEqual:"))
      goto LABEL_482;
    has = (uint64_t)self->_has;
    v5 = *((_WORD *)&self->_has + 4);
  }
  v9 = *(_QWORD *)(v4 + 452);
  v10 = *((_WORD *)v4 + 230);
  if ((has & 0x200000000000000) != 0)
  {
    if ((v9 & 0x200000000000000) == 0)
      goto LABEL_482;
    if (self->_isBundleBit)
    {
      if (!v4[431])
        goto LABEL_482;
    }
    else if (v4[431])
    {
      goto LABEL_482;
    }
  }
  else if ((v9 & 0x200000000000000) != 0)
  {
    goto LABEL_482;
  }
  if ((v5 & 1) != 0)
  {
    if ((v10 & 1) == 0)
      goto LABEL_482;
    if (self->_isSparseFile)
    {
      if (!v4[438])
        goto LABEL_482;
    }
    else if (v4[438])
    {
      goto LABEL_482;
    }
  }
  else if ((v10 & 1) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x20000000000) != 0)
  {
    if ((v9 & 0x20000000000) == 0 || self->_compressionType != *((_DWORD *)v4 + 84))
      goto LABEL_482;
  }
  else if ((v9 & 0x20000000000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x100000000) != 0)
  {
    if ((v9 & 0x100000000) == 0 || self->_readErrorCode != *((_QWORD *)v4 + 33))
      goto LABEL_482;
  }
  else if ((v9 & 0x100000000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x20) != 0)
  {
    if ((v9 & 0x20) == 0 || self->_cloneErrorCode != *((_QWORD *)v4 + 6))
      goto LABEL_482;
  }
  else if ((v9 & 0x20) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x100000000000) != 0)
  {
    if ((v9 & 0x100000000000) == 0 || self->_syncRootEnum != *((_DWORD *)v4 + 100))
      goto LABEL_482;
  }
  else if ((v9 & 0x100000000000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x10000000) != 0)
  {
    if ((v9 & 0x10000000) == 0 || self->_pathLength != *((_QWORD *)v4 + 29))
      goto LABEL_482;
  }
  else if ((v9 & 0x10000000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x200000) != 0)
  {
    if ((v9 & 0x200000) == 0 || self->_fileNameLength != *((_QWORD *)v4 + 22))
      goto LABEL_482;
  }
  else if ((v9 & 0x200000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x400000000) != 0)
  {
    if ((v9 & 0x400000000) == 0 || self->_stMode != *((_QWORD *)v4 + 35))
      goto LABEL_482;
  }
  else if ((v9 & 0x400000000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x200000000) != 0)
  {
    if ((v9 & 0x200000000) == 0 || self->_stFlags != *((_QWORD *)v4 + 34))
      goto LABEL_482;
  }
  else if ((v9 & 0x200000000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x40000000000000) != 0)
  {
    if ((v9 & 0x40000000000000) == 0)
      goto LABEL_482;
    if (self->_hasAcls)
    {
      if (!v4[428])
        goto LABEL_482;
    }
    else if (v4[428])
    {
      goto LABEL_482;
    }
  }
  else if ((v9 & 0x40000000000000) != 0)
  {
    goto LABEL_482;
  }
  if ((v5 & 0x20) != 0)
  {
    if ((v10 & 0x20) == 0)
      goto LABEL_482;
    if (self->_parentHasAcls)
    {
      if (!v4[443])
        goto LABEL_482;
    }
    else if (v4[443])
    {
      goto LABEL_482;
    }
  }
  else if ((v10 & 0x20) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x2000000000000000) != 0)
  {
    if ((v9 & 0x2000000000000000) == 0)
      goto LABEL_482;
    if (self->_isPurgable)
    {
      if (!v4[435])
        goto LABEL_482;
    }
    else if (v4[435])
    {
      goto LABEL_482;
    }
  }
  else if ((v9 & 0x2000000000000000) != 0)
  {
    goto LABEL_482;
  }
  if ((v5 & 4) != 0)
  {
    if ((v10 & 4) == 0)
      goto LABEL_482;
    if (self->_isUrgent)
    {
      if (!v4[440])
        goto LABEL_482;
    }
    else if (v4[440])
    {
      goto LABEL_482;
    }
  }
  else if ((v10 & 4) != 0)
  {
    goto LABEL_482;
  }
  if ((v5 & 2) != 0)
  {
    if ((v10 & 2) == 0)
      goto LABEL_482;
    if (self->_isUnderDirStatFolder)
    {
      if (!v4[439])
        goto LABEL_482;
    }
    else if (v4[439])
    {
      goto LABEL_482;
    }
  }
  else if ((v10 & 2) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x400000000000000) != 0)
  {
    if ((v9 & 0x400000000000000) == 0)
      goto LABEL_482;
    if (self->_isFileNameNonAscii)
    {
      if (!v4[432])
        goto LABEL_482;
    }
    else if (v4[432])
    {
      goto LABEL_482;
    }
  }
  else if ((v9 & 0x400000000000000) != 0)
  {
    goto LABEL_482;
  }
  finderInfoFlagsBase64 = self->_finderInfoFlagsBase64;
  if ((unint64_t)finderInfoFlagsBase64 | *((_QWORD *)v4 + 47))
  {
    if (!-[NSString isEqual:](finderInfoFlagsBase64, "isEqual:"))
      goto LABEL_482;
    has = (uint64_t)self->_has;
    v5 = *((_WORD *)&self->_has + 4);
  }
  v12 = *(_QWORD *)(v4 + 452);
  if ((has & 0x1000000) != 0)
  {
    if ((v12 & 0x1000000) == 0 || self->_hasMoreLinks != *((_QWORD *)v4 + 25))
      goto LABEL_482;
  }
  else if ((v12 & 0x1000000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x400000) != 0)
  {
    if ((v12 & 0x400000) == 0 || self->_fsGenCount != *((_QWORD *)v4 + 23))
      goto LABEL_482;
  }
  else if ((v12 & 0x400000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x8000) != 0)
  {
    if ((v12 & 0x8000) == 0 || self->_dbGenCount != *((_QWORD *)v4 + 16))
      goto LABEL_482;
  }
  else if ((v12 & 0x8000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x80000000000000) != 0)
  {
    if ((v12 & 0x80000000000000) == 0)
      goto LABEL_482;
    if (self->_hasLocalChanges)
    {
      if (!v4[429])
        goto LABEL_482;
    }
    else if (v4[429])
    {
      goto LABEL_482;
    }
  }
  else if ((v12 & 0x80000000000000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x10000000000000) != 0)
  {
    if ((v12 & 0x10000000000000) == 0)
      goto LABEL_482;
    if (self->_doGenCountsMatchInFileId)
    {
      if (!v4[426])
        goto LABEL_482;
    }
    else if (v4[426])
    {
      goto LABEL_482;
    }
  }
  else if ((v12 & 0x10000000000000) != 0)
  {
    goto LABEL_482;
  }
  fileNameExtension = self->_fileNameExtension;
  if ((unint64_t)fileNameExtension | *((_QWORD *)v4 + 46))
  {
    if (!-[NSString isEqual:](fileNameExtension, "isEqual:"))
      goto LABEL_482;
    has = (uint64_t)self->_has;
    v5 = *((_WORD *)&self->_has + 4);
  }
  v14 = *(_QWORD *)(v4 + 452);
  if ((has & 0x8000000) != 0)
  {
    if ((v14 & 0x8000000) == 0 || self->_pathDepth != *((_QWORD *)v4 + 28))
      goto LABEL_482;
  }
  else if ((v14 & 0x8000000) != 0)
  {
    goto LABEL_482;
  }
  if ((v5 & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 230) & 0x200) == 0)
      goto LABEL_482;
    if (self->_xattrHasDemotion)
    {
      if (!v4[447])
        goto LABEL_482;
    }
    else if (v4[447])
    {
      goto LABEL_482;
    }
  }
  else if ((*((_WORD *)v4 + 230) & 0x200) != 0)
  {
    goto LABEL_482;
  }
  if ((v5 & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 230) & 0x400) == 0)
      goto LABEL_482;
    if (self->_xattrHasPromotion)
    {
      if (!v4[448])
        goto LABEL_482;
    }
    else if (v4[448])
    {
      goto LABEL_482;
    }
  }
  else if ((*((_WORD *)v4 + 230) & 0x400) != 0)
  {
    goto LABEL_482;
  }
  dbErrorDomain = self->_dbErrorDomain;
  if ((unint64_t)dbErrorDomain | *((_QWORD *)v4 + 43))
  {
    if (!-[NSString isEqual:](dbErrorDomain, "isEqual:"))
      goto LABEL_482;
    has = (uint64_t)self->_has;
    v5 = *((_WORD *)&self->_has + 4);
  }
  v16 = *(_QWORD *)(v4 + 452);
  v17 = *((_WORD *)v4 + 230);
  if ((has & 0x100) != 0)
  {
    if ((v16 & 0x100) == 0 || self->_dbErrorCode != *((_QWORD *)v4 + 9))
      goto LABEL_482;
  }
  else if ((v16 & 0x100) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x40) != 0)
  {
    if ((v16 & 0x40) == 0 || self->_dbCapabilities != *((_QWORD *)v4 + 7))
      goto LABEL_482;
  }
  else if ((v16 & 0x40) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x20000) != 0)
  {
    if ((v16 & 0x20000) == 0 || self->_dbTransferState != *((_QWORD *)v4 + 18))
      goto LABEL_482;
  }
  else if ((v16 & 0x20000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x10000) != 0)
  {
    if ((v16 & 0x10000) == 0 || self->_dbSharingState != *((_QWORD *)v4 + 17))
      goto LABEL_482;
  }
  else if ((v16 & 0x10000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x2000000000000) != 0)
  {
    if ((v16 & 0x2000000000000) == 0)
      goto LABEL_482;
    if (self->_dbIsApplibrary)
    {
      if (!v4[423])
        goto LABEL_482;
    }
    else if (v4[423])
    {
      goto LABEL_482;
    }
  }
  else if ((v16 & 0x2000000000000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x80) != 0)
  {
    if ((v16 & 0x80) == 0 || self->_dbEffectiveContentPolicy != *((_QWORD *)v4 + 8))
      goto LABEL_482;
  }
  else if ((v16 & 0x80) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x4000000000000) != 0)
  {
    if ((v16 & 0x4000000000000) == 0)
      goto LABEL_482;
    if (self->_dbIsPackage)
    {
      if (!v4[424])
        goto LABEL_482;
    }
    else if (v4[424])
    {
      goto LABEL_482;
    }
  }
  else if ((v16 & 0x4000000000000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x1000) != 0)
  {
    if ((v16 & 0x1000) == 0 || self->_dbFsContentStatus != *((_QWORD *)v4 + 13))
      goto LABEL_482;
  }
  else if ((v16 & 0x1000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x200) != 0)
  {
    if ((v16 & 0x200) == 0 || self->_dbFpContentStatus != *((_QWORD *)v4 + 10))
      goto LABEL_482;
  }
  else if ((v16 & 0x200) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x2000) != 0)
  {
    if ((v16 & 0x2000) == 0 || self->_dbFsDeletionStatus != *((_QWORD *)v4 + 14))
      goto LABEL_482;
  }
  else if ((v16 & 0x2000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x400) != 0)
  {
    if ((v16 & 0x400) == 0 || self->_dbFpDeletionStatus != *((_QWORD *)v4 + 11))
      goto LABEL_482;
  }
  else if ((v16 & 0x400) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x4000) != 0)
  {
    if ((v16 & 0x4000) == 0 || self->_dbFsImportStatus != *((_QWORD *)v4 + 15))
      goto LABEL_482;
  }
  else if ((v16 & 0x4000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x800) != 0)
  {
    if ((v16 & 0x800) == 0 || self->_dbFpImportStatus != *((_QWORD *)v4 + 12))
      goto LABEL_482;
  }
  else if ((v16 & 0x800) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x8000000000000) != 0)
  {
    if ((v16 & 0x8000000000000) == 0)
      goto LABEL_482;
    if (self->_dbIsSuper)
    {
      if (!v4[425])
        goto LABEL_482;
    }
    else if (v4[425])
    {
      goto LABEL_482;
    }
  }
  else if ((v16 & 0x8000000000000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x800000) != 0)
  {
    if ((v16 & 0x800000) == 0 || self->_gencountDiff != *((_QWORD *)v4 + 24))
      goto LABEL_482;
  }
  else if ((v16 & 0x800000) != 0)
  {
    goto LABEL_482;
  }
  if ((v5 & 0x40) != 0)
  {
    if ((v17 & 0x40) == 0)
      goto LABEL_482;
    if (self->_parentMatches)
    {
      if (!v4[444])
        goto LABEL_482;
    }
    else if (v4[444])
    {
      goto LABEL_482;
    }
  }
  else if ((v17 & 0x40) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x800000000000) != 0)
  {
    if ((v16 & 0x800000000000) == 0)
      goto LABEL_482;
    if (self->_appLibraryMatches)
    {
      if (!v4[421])
        goto LABEL_482;
    }
    else if (v4[421])
    {
      goto LABEL_482;
    }
  }
  else if ((v16 & 0x800000000000) != 0)
  {
    goto LABEL_482;
  }
  if ((v5 & 8) != 0)
  {
    if ((v17 & 8) == 0)
      goto LABEL_482;
    if (self->_mTimeBeforeMigrationStarted)
    {
      if (!v4[441])
        goto LABEL_482;
    }
    else if (v4[441])
    {
      goto LABEL_482;
    }
  }
  else if ((v17 & 8) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x20000000000000) != 0)
  {
    if ((v16 & 0x20000000000000) == 0)
      goto LABEL_482;
    if (self->_docIDMatches)
    {
      if (!v4[427])
        goto LABEL_482;
    }
    else if (v4[427])
    {
      goto LABEL_482;
    }
  }
  else if ((v16 & 0x20000000000000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x4000000) != 0)
  {
    if ((v16 & 0x4000000) == 0 || self->_mTime != *((_QWORD *)v4 + 27))
      goto LABEL_482;
  }
  else if ((v16 & 0x4000000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x10) != 0)
  {
    if ((v16 & 0x10) == 0 || self->_bTime != *((_QWORD *)v4 + 5))
      goto LABEL_482;
  }
  else if ((v16 & 0x10) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x1000000000000) != 0)
  {
    if ((v16 & 0x1000000000000) == 0)
      goto LABEL_482;
    if (self->_bTimeIsBusy)
    {
      if (!v4[422])
        goto LABEL_482;
    }
    else if (v4[422])
    {
      goto LABEL_482;
    }
  }
  else if ((v16 & 0x1000000000000) != 0)
  {
    goto LABEL_482;
  }
  if ((v5 & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 230) & 0x100) == 0)
      goto LABEL_482;
    if (self->_xattrHasBeforeBounce)
    {
      if (!v4[446])
        goto LABEL_482;
    }
    else if (v4[446])
    {
      goto LABEL_482;
    }
  }
  else if ((*((_WORD *)v4 + 230) & 0x100) != 0)
  {
    goto LABEL_482;
  }
  nameUnicodeNorm = self->_nameUnicodeNorm;
  if ((unint64_t)nameUnicodeNorm | *((_QWORD *)v4 + 49)
    && !-[NSString isEqual:](nameUnicodeNorm, "isEqual:"))
  {
    goto LABEL_482;
  }
  v19 = (uint64_t)self->_has;
  v20 = *((_WORD *)&self->_has + 4);
  v21 = *(_QWORD *)(v4 + 452);
  v22 = *((_WORD *)v4 + 230);
  if ((v20 & 0x10) != 0)
  {
    if ((v22 & 0x10) == 0)
      goto LABEL_482;
    if (self->_nameIsTrashed)
    {
      if (!v4[442])
        goto LABEL_482;
    }
    else if (v4[442])
    {
      goto LABEL_482;
    }
  }
  else if ((v22 & 0x10) != 0)
  {
    goto LABEL_482;
  }
  if ((v19 & 0x8000000000) != 0)
  {
    if ((v21 & 0x8000000000) == 0 || self->_sysPageSize != *((_QWORD *)v4 + 40))
      goto LABEL_482;
  }
  else if ((v21 & 0x8000000000) != 0)
  {
    goto LABEL_482;
  }
  if ((v19 & 0x10000000000) != 0)
  {
    if ((v21 & 0x10000000000) == 0 || self->_sysUID != *((_QWORD *)v4 + 41))
      goto LABEL_482;
  }
  else if ((v21 & 0x10000000000) != 0)
  {
    goto LABEL_482;
  }
  if ((v20 & 0x80) != 0)
  {
    if ((v22 & 0x80) == 0)
      goto LABEL_482;
    if (self->_sysDocIDResolutionOK)
    {
      if (!v4[445])
        goto LABEL_482;
    }
    else if (v4[445])
    {
      goto LABEL_482;
    }
  }
  else if ((v22 & 0x80) != 0)
  {
    goto LABEL_482;
  }
  if ((v19 & 0x40000000) != 0)
  {
    if ((v21 & 0x40000000) == 0 || self->_purgeGenCount != *((_QWORD *)v4 + 31))
      goto LABEL_482;
  }
  else if ((v21 & 0x40000000) != 0)
  {
    goto LABEL_482;
  }
  if ((v19 & 0x20000000) != 0)
  {
    if ((v21 & 0x20000000) == 0 || self->_purgeATime != *((_QWORD *)v4 + 30))
      goto LABEL_482;
  }
  else if ((v21 & 0x20000000) != 0)
  {
    goto LABEL_482;
  }
  if ((v19 & 0x80000000) != 0)
  {
    if ((v21 & 0x80000000) == 0 || self->_purgeSyncRoot != *((_QWORD *)v4 + 32))
      goto LABEL_482;
  }
  else if ((v21 & 0x80000000) != 0)
  {
    goto LABEL_482;
  }
  if ((v19 & 0x80000) != 0)
  {
    if ((v21 & 0x80000) == 0 || self->_diagFailuresBitmap != *((_QWORD *)v4 + 20))
      goto LABEL_482;
  }
  else if ((v21 & 0x80000) != 0)
  {
    goto LABEL_482;
  }
  if ((v19 & 0x40000) != 0)
  {
    if ((v21 & 0x40000) == 0 || self->_diagErrorCode != *((_QWORD *)v4 + 19))
      goto LABEL_482;
  }
  else if ((v21 & 0x40000) != 0)
  {
    goto LABEL_482;
  }
  if ((v19 & 0x100000) != 0)
  {
    if ((v21 & 0x100000) == 0 || self->_diagUnderlyingErrorCode != *((_QWORD *)v4 + 21))
      goto LABEL_482;
  }
  else if ((v21 & 0x100000) != 0)
  {
    goto LABEL_482;
  }
  diagErrorDomain = self->_diagErrorDomain;
  if ((unint64_t)diagErrorDomain | *((_QWORD *)v4 + 44)
    && !-[NSString isEqual:](diagErrorDomain, "isEqual:"))
  {
    goto LABEL_482;
  }
  diagUnderlyingErrorDomain = self->_diagUnderlyingErrorDomain;
  if ((unint64_t)diagUnderlyingErrorDomain | *((_QWORD *)v4 + 45))
  {
    if (!-[NSString isEqual:](diagUnderlyingErrorDomain, "isEqual:"))
      goto LABEL_482;
  }
  v25 = (uint64_t)self->_has;
  v26 = *(_QWORD *)(v4 + 452);
  if ((v25 & 1) != 0)
  {
    if ((v26 & 1) == 0 || self->_apfsAvailableSpace != *((_QWORD *)v4 + 1))
      goto LABEL_482;
  }
  else if ((v26 & 1) != 0)
  {
    goto LABEL_482;
  }
  if ((v25 & 4) != 0)
  {
    if ((v26 & 4) == 0 || self->_apfsFlags != *((_QWORD *)v4 + 3))
      goto LABEL_482;
  }
  else if ((v26 & 4) != 0)
  {
    goto LABEL_482;
  }
  if ((v25 & 2) != 0)
  {
    if ((v26 & 2) == 0 || self->_apfsBlockSize != *((_QWORD *)v4 + 2))
      goto LABEL_482;
  }
  else if ((v26 & 2) != 0)
  {
    goto LABEL_482;
  }
  if ((v25 & 8) != 0)
  {
    if ((v26 & 8) == 0 || self->_apfsRole != *((_QWORD *)v4 + 4))
      goto LABEL_482;
  }
  else if ((v26 & 8) != 0)
  {
    goto LABEL_482;
  }
  if ((v25 & 0x400000000000) != 0)
  {
    if ((v26 & 0x400000000000) == 0)
      goto LABEL_482;
    if (self->_apfsEncrypted)
    {
      if (!v4[420])
        goto LABEL_482;
    }
    else if (v4[420])
    {
      goto LABEL_482;
    }
  }
  else if ((v26 & 0x400000000000) != 0)
  {
    goto LABEL_482;
  }
  if ((v25 & 0x1000000000) != 0)
  {
    if ((v26 & 0x1000000000) == 0 || self->_statDocID != *((_QWORD *)v4 + 37))
      goto LABEL_482;
  }
  else if ((v26 & 0x1000000000) != 0)
  {
    goto LABEL_482;
  }
  if ((v25 & 0x2000000000) != 0)
  {
    if ((v26 & 0x2000000000) == 0 || self->_statLogicalSize != *((_QWORD *)v4 + 38))
      goto LABEL_482;
  }
  else if ((v26 & 0x2000000000) != 0)
  {
    goto LABEL_482;
  }
  if ((v25 & 0x4000000000) == 0)
  {
    if ((v26 & 0x4000000000) == 0)
      goto LABEL_477;
LABEL_482:
    v27 = 0;
    goto LABEL_483;
  }
  if ((v26 & 0x4000000000) == 0 || self->_statPhysicalSize != *((_QWORD *)v4 + 39))
    goto LABEL_482;
LABEL_477:
  if ((v25 & 0x800000000) != 0)
  {
    if ((v26 & 0x800000000) == 0 || self->_statDirEntryCount != *((_QWORD *)v4 + 36))
      goto LABEL_482;
    v27 = 1;
  }
  else
  {
    v27 = (v26 & 0x800000000) == 0;
  }
LABEL_483:

  return v27;
}

- (unint64_t)hash
{
  uint64_t has;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSUInteger v17;
  NSUInteger v18;
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
  NSUInteger v35;
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
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  NSUInteger v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  NSUInteger v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  NSUInteger v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  NSUInteger v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;

  has = (uint64_t)self->_has;
  if ((has & 0x2000000) != 0)
  {
    v95 = 2654435761 * self->_itemNumber;
    if ((has & 0x80000000000) != 0)
    {
LABEL_3:
      v94 = 2654435761 * self->_itemType;
      if ((has & 0x40000000000) != 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else
  {
    v95 = 0;
    if ((has & 0x80000000000) != 0)
      goto LABEL_3;
  }
  v94 = 0;
  if ((has & 0x40000000000) != 0)
  {
LABEL_4:
    v93 = 2654435761 * self->_dataProtectionClass;
    if ((has & 0x800000000000000) != 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  v93 = 0;
  if ((has & 0x800000000000000) != 0)
  {
LABEL_5:
    v92 = 2654435761 * self->_isOwnedByLoggedInUser;
    if ((has & 0x1000000000000000) != 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  v92 = 0;
  if ((has & 0x1000000000000000) != 0)
  {
LABEL_6:
    v91 = 2654435761 * self->_isOwnedByRoot;
    if ((has & 0x200000000000) != 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  v91 = 0;
  if ((has & 0x200000000000) != 0)
  {
LABEL_7:
    v90 = 2654435761 * self->_xattrCount;
    if ((has & 0x100000000000000) != 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  v90 = 0;
  if ((has & 0x100000000000000) != 0)
  {
LABEL_8:
    v89 = 2654435761 * self->_isAppleDouble;
    if (has < 0)
      goto LABEL_9;
LABEL_18:
    v88 = 0;
    if ((has & 0x4000000000000000) != 0)
      goto LABEL_10;
    goto LABEL_19;
  }
LABEL_17:
  v89 = 0;
  if ((has & 0x8000000000000000) == 0)
    goto LABEL_18;
LABEL_9:
  v88 = 2654435761 * self->_isResourceFork;
  if ((has & 0x4000000000000000) != 0)
  {
LABEL_10:
    v87 = 2654435761 * self->_isQuarantined;
    goto LABEL_20;
  }
LABEL_19:
  v87 = 0;
LABEL_20:
  v86 = -[NSString hash](self->_utType, "hash");
  v4 = (uint64_t)self->_has;
  v5 = *((_WORD *)&self->_has + 4);
  if ((v4 & 0x200000000000000) != 0)
  {
    v85 = 2654435761 * self->_isBundleBit;
    if ((v5 & 1) != 0)
    {
LABEL_22:
      v84 = 2654435761 * self->_isSparseFile;
      if ((v4 & 0x20000000000) != 0)
        goto LABEL_23;
      goto LABEL_39;
    }
  }
  else
  {
    v85 = 0;
    if ((v5 & 1) != 0)
      goto LABEL_22;
  }
  v84 = 0;
  if ((v4 & 0x20000000000) != 0)
  {
LABEL_23:
    v83 = 2654435761 * self->_compressionType;
    if ((v4 & 0x100000000) != 0)
      goto LABEL_24;
    goto LABEL_40;
  }
LABEL_39:
  v83 = 0;
  if ((v4 & 0x100000000) != 0)
  {
LABEL_24:
    v82 = 2654435761 * self->_readErrorCode;
    if ((v4 & 0x20) != 0)
      goto LABEL_25;
    goto LABEL_41;
  }
LABEL_40:
  v82 = 0;
  if ((v4 & 0x20) != 0)
  {
LABEL_25:
    v81 = 2654435761 * self->_cloneErrorCode;
    if ((v4 & 0x100000000000) != 0)
      goto LABEL_26;
    goto LABEL_42;
  }
LABEL_41:
  v81 = 0;
  if ((v4 & 0x100000000000) != 0)
  {
LABEL_26:
    v80 = 2654435761 * self->_syncRootEnum;
    if ((v4 & 0x10000000) != 0)
      goto LABEL_27;
    goto LABEL_43;
  }
LABEL_42:
  v80 = 0;
  if ((v4 & 0x10000000) != 0)
  {
LABEL_27:
    v79 = 2654435761 * self->_pathLength;
    if ((v4 & 0x200000) != 0)
      goto LABEL_28;
    goto LABEL_44;
  }
LABEL_43:
  v79 = 0;
  if ((v4 & 0x200000) != 0)
  {
LABEL_28:
    v78 = 2654435761 * self->_fileNameLength;
    if ((v4 & 0x400000000) != 0)
      goto LABEL_29;
    goto LABEL_45;
  }
LABEL_44:
  v78 = 0;
  if ((v4 & 0x400000000) != 0)
  {
LABEL_29:
    v77 = 2654435761 * self->_stMode;
    if ((v4 & 0x200000000) != 0)
      goto LABEL_30;
    goto LABEL_46;
  }
LABEL_45:
  v77 = 0;
  if ((v4 & 0x200000000) != 0)
  {
LABEL_30:
    v76 = 2654435761 * self->_stFlags;
    if ((v4 & 0x40000000000000) != 0)
      goto LABEL_31;
    goto LABEL_47;
  }
LABEL_46:
  v76 = 0;
  if ((v4 & 0x40000000000000) != 0)
  {
LABEL_31:
    v75 = 2654435761 * self->_hasAcls;
    if ((v5 & 0x20) != 0)
      goto LABEL_32;
    goto LABEL_48;
  }
LABEL_47:
  v75 = 0;
  if ((v5 & 0x20) != 0)
  {
LABEL_32:
    v74 = 2654435761 * self->_parentHasAcls;
    if ((v4 & 0x2000000000000000) != 0)
      goto LABEL_33;
    goto LABEL_49;
  }
LABEL_48:
  v74 = 0;
  if ((v4 & 0x2000000000000000) != 0)
  {
LABEL_33:
    v73 = 2654435761 * self->_isPurgable;
    if ((v5 & 4) != 0)
      goto LABEL_34;
    goto LABEL_50;
  }
LABEL_49:
  v73 = 0;
  if ((v5 & 4) != 0)
  {
LABEL_34:
    v72 = 2654435761 * self->_isUrgent;
    if ((v5 & 2) != 0)
      goto LABEL_35;
LABEL_51:
    v71 = 0;
    if ((v4 & 0x400000000000000) != 0)
      goto LABEL_36;
    goto LABEL_52;
  }
LABEL_50:
  v72 = 0;
  if ((v5 & 2) == 0)
    goto LABEL_51;
LABEL_35:
  v71 = 2654435761 * self->_isUnderDirStatFolder;
  if ((v4 & 0x400000000000000) != 0)
  {
LABEL_36:
    v70 = 2654435761 * self->_isFileNameNonAscii;
    goto LABEL_53;
  }
LABEL_52:
  v70 = 0;
LABEL_53:
  v69 = -[NSString hash](self->_finderInfoFlagsBase64, "hash");
  v6 = (uint64_t)self->_has;
  if ((v6 & 0x1000000) != 0)
  {
    v68 = 2654435761 * self->_hasMoreLinks;
    if ((v6 & 0x400000) != 0)
    {
LABEL_55:
      v67 = 2654435761 * self->_fsGenCount;
      if ((v6 & 0x8000) != 0)
        goto LABEL_56;
      goto LABEL_61;
    }
  }
  else
  {
    v68 = 0;
    if ((v6 & 0x400000) != 0)
      goto LABEL_55;
  }
  v67 = 0;
  if ((v6 & 0x8000) != 0)
  {
LABEL_56:
    v66 = 2654435761 * self->_dbGenCount;
    if ((v6 & 0x80000000000000) != 0)
      goto LABEL_57;
LABEL_62:
    v65 = 0;
    if ((v6 & 0x10000000000000) != 0)
      goto LABEL_58;
    goto LABEL_63;
  }
LABEL_61:
  v66 = 0;
  if ((v6 & 0x80000000000000) == 0)
    goto LABEL_62;
LABEL_57:
  v65 = 2654435761 * self->_hasLocalChanges;
  if ((v6 & 0x10000000000000) != 0)
  {
LABEL_58:
    v64 = 2654435761 * self->_doGenCountsMatchInFileId;
    goto LABEL_64;
  }
LABEL_63:
  v64 = 0;
LABEL_64:
  v63 = -[NSString hash](self->_fileNameExtension, "hash");
  if ((*(_QWORD *)&self->_has & 0x8000000) == 0)
  {
    v62 = 0;
    if ((*((_WORD *)&self->_has + 4) & 0x200) != 0)
      goto LABEL_66;
LABEL_69:
    v61 = 0;
    if ((*((_WORD *)&self->_has + 4) & 0x400) != 0)
      goto LABEL_67;
    goto LABEL_70;
  }
  v62 = 2654435761 * self->_pathDepth;
  if ((*((_WORD *)&self->_has + 4) & 0x200) == 0)
    goto LABEL_69;
LABEL_66:
  v61 = 2654435761 * self->_xattrHasDemotion;
  if ((*((_WORD *)&self->_has + 4) & 0x400) != 0)
  {
LABEL_67:
    v60 = 2654435761 * self->_xattrHasPromotion;
    goto LABEL_71;
  }
LABEL_70:
  v60 = 0;
LABEL_71:
  v59 = -[NSString hash](self->_dbErrorDomain, "hash");
  v7 = *((_WORD *)&self->_has + 4);
  v8 = (uint64_t)self->_has;
  if ((v8 & 0x100) != 0)
  {
    v58 = 2654435761 * self->_dbErrorCode;
    if ((v8 & 0x40) != 0)
    {
LABEL_73:
      v57 = 2654435761 * self->_dbCapabilities;
      if ((v8 & 0x20000) != 0)
        goto LABEL_74;
      goto LABEL_97;
    }
  }
  else
  {
    v58 = 0;
    if ((v8 & 0x40) != 0)
      goto LABEL_73;
  }
  v57 = 0;
  if ((v8 & 0x20000) != 0)
  {
LABEL_74:
    v56 = 2654435761 * self->_dbTransferState;
    if ((v8 & 0x10000) != 0)
      goto LABEL_75;
    goto LABEL_98;
  }
LABEL_97:
  v56 = 0;
  if ((v8 & 0x10000) != 0)
  {
LABEL_75:
    v55 = 2654435761 * self->_dbSharingState;
    if ((v8 & 0x2000000000000) != 0)
      goto LABEL_76;
    goto LABEL_99;
  }
LABEL_98:
  v55 = 0;
  if ((v8 & 0x2000000000000) != 0)
  {
LABEL_76:
    v54 = 2654435761 * self->_dbIsApplibrary;
    if ((v8 & 0x80) != 0)
      goto LABEL_77;
    goto LABEL_100;
  }
LABEL_99:
  v54 = 0;
  if ((v8 & 0x80) != 0)
  {
LABEL_77:
    v53 = 2654435761 * self->_dbEffectiveContentPolicy;
    if ((v8 & 0x4000000000000) != 0)
      goto LABEL_78;
    goto LABEL_101;
  }
LABEL_100:
  v53 = 0;
  if ((v8 & 0x4000000000000) != 0)
  {
LABEL_78:
    v52 = 2654435761 * self->_dbIsPackage;
    if ((v8 & 0x1000) != 0)
      goto LABEL_79;
    goto LABEL_102;
  }
LABEL_101:
  v52 = 0;
  if ((v8 & 0x1000) != 0)
  {
LABEL_79:
    v51 = 2654435761 * self->_dbFsContentStatus;
    if ((v8 & 0x200) != 0)
      goto LABEL_80;
    goto LABEL_103;
  }
LABEL_102:
  v51 = 0;
  if ((v8 & 0x200) != 0)
  {
LABEL_80:
    v50 = 2654435761 * self->_dbFpContentStatus;
    if ((v8 & 0x2000) != 0)
      goto LABEL_81;
    goto LABEL_104;
  }
LABEL_103:
  v50 = 0;
  if ((v8 & 0x2000) != 0)
  {
LABEL_81:
    v49 = 2654435761 * self->_dbFsDeletionStatus;
    if ((v8 & 0x400) != 0)
      goto LABEL_82;
    goto LABEL_105;
  }
LABEL_104:
  v49 = 0;
  if ((v8 & 0x400) != 0)
  {
LABEL_82:
    v48 = 2654435761 * self->_dbFpDeletionStatus;
    if ((v8 & 0x4000) != 0)
      goto LABEL_83;
    goto LABEL_106;
  }
LABEL_105:
  v48 = 0;
  if ((v8 & 0x4000) != 0)
  {
LABEL_83:
    v47 = 2654435761 * self->_dbFsImportStatus;
    if ((v8 & 0x800) != 0)
      goto LABEL_84;
    goto LABEL_107;
  }
LABEL_106:
  v47 = 0;
  if ((v8 & 0x800) != 0)
  {
LABEL_84:
    v46 = 2654435761 * self->_dbFpImportStatus;
    if ((v8 & 0x8000000000000) != 0)
      goto LABEL_85;
    goto LABEL_108;
  }
LABEL_107:
  v46 = 0;
  if ((v8 & 0x8000000000000) != 0)
  {
LABEL_85:
    v45 = 2654435761 * self->_dbIsSuper;
    if ((v8 & 0x800000) != 0)
      goto LABEL_86;
    goto LABEL_109;
  }
LABEL_108:
  v45 = 0;
  if ((v8 & 0x800000) != 0)
  {
LABEL_86:
    v44 = 2654435761 * self->_gencountDiff;
    if ((v7 & 0x40) != 0)
      goto LABEL_87;
    goto LABEL_110;
  }
LABEL_109:
  v44 = 0;
  if ((v7 & 0x40) != 0)
  {
LABEL_87:
    v43 = 2654435761 * self->_parentMatches;
    if ((v8 & 0x800000000000) != 0)
      goto LABEL_88;
    goto LABEL_111;
  }
LABEL_110:
  v43 = 0;
  if ((v8 & 0x800000000000) != 0)
  {
LABEL_88:
    v42 = 2654435761 * self->_appLibraryMatches;
    if ((v7 & 8) != 0)
      goto LABEL_89;
    goto LABEL_112;
  }
LABEL_111:
  v42 = 0;
  if ((v7 & 8) != 0)
  {
LABEL_89:
    v41 = 2654435761 * self->_mTimeBeforeMigrationStarted;
    if ((v8 & 0x20000000000000) != 0)
      goto LABEL_90;
    goto LABEL_113;
  }
LABEL_112:
  v41 = 0;
  if ((v8 & 0x20000000000000) != 0)
  {
LABEL_90:
    v40 = 2654435761 * self->_docIDMatches;
    if ((v8 & 0x4000000) != 0)
      goto LABEL_91;
    goto LABEL_114;
  }
LABEL_113:
  v40 = 0;
  if ((v8 & 0x4000000) != 0)
  {
LABEL_91:
    v39 = 2654435761 * self->_mTime;
    if ((v8 & 0x10) != 0)
      goto LABEL_92;
    goto LABEL_115;
  }
LABEL_114:
  v39 = 0;
  if ((v8 & 0x10) != 0)
  {
LABEL_92:
    v38 = 2654435761 * self->_bTime;
    if ((v8 & 0x1000000000000) != 0)
      goto LABEL_93;
LABEL_116:
    v37 = 0;
    if ((*((_WORD *)&self->_has + 4) & 0x100) != 0)
      goto LABEL_94;
    goto LABEL_117;
  }
LABEL_115:
  v38 = 0;
  if ((v8 & 0x1000000000000) == 0)
    goto LABEL_116;
LABEL_93:
  v37 = 2654435761 * self->_bTimeIsBusy;
  if ((*((_WORD *)&self->_has + 4) & 0x100) != 0)
  {
LABEL_94:
    v36 = 2654435761 * self->_xattrHasBeforeBounce;
    goto LABEL_118;
  }
LABEL_117:
  v36 = 0;
LABEL_118:
  v35 = -[NSString hash](self->_nameUnicodeNorm, "hash");
  v9 = (uint64_t)self->_has;
  v10 = *((_WORD *)&self->_has + 4);
  if ((v10 & 0x10) != 0)
  {
    v34 = 2654435761 * self->_nameIsTrashed;
    if ((v9 & 0x8000000000) != 0)
    {
LABEL_120:
      v33 = 2654435761 * self->_sysPageSize;
      if ((v9 & 0x10000000000) != 0)
        goto LABEL_121;
      goto LABEL_131;
    }
  }
  else
  {
    v34 = 0;
    if ((v9 & 0x8000000000) != 0)
      goto LABEL_120;
  }
  v33 = 0;
  if ((v9 & 0x10000000000) != 0)
  {
LABEL_121:
    v32 = 2654435761 * self->_sysUID;
    if ((v10 & 0x80) != 0)
      goto LABEL_122;
    goto LABEL_132;
  }
LABEL_131:
  v32 = 0;
  if ((v10 & 0x80) != 0)
  {
LABEL_122:
    v30 = 2654435761 * self->_sysDocIDResolutionOK;
    if ((v9 & 0x40000000) != 0)
      goto LABEL_123;
    goto LABEL_133;
  }
LABEL_132:
  v30 = 0;
  if ((v9 & 0x40000000) != 0)
  {
LABEL_123:
    v11 = 2654435761 * self->_purgeGenCount;
    if ((v9 & 0x20000000) != 0)
      goto LABEL_124;
    goto LABEL_134;
  }
LABEL_133:
  v11 = 0;
  if ((v9 & 0x20000000) != 0)
  {
LABEL_124:
    v12 = 2654435761 * self->_purgeATime;
    if ((v9 & 0x80000000) != 0)
      goto LABEL_125;
    goto LABEL_135;
  }
LABEL_134:
  v12 = 0;
  if ((v9 & 0x80000000) != 0)
  {
LABEL_125:
    v13 = 2654435761 * self->_purgeSyncRoot;
    if ((v9 & 0x80000) != 0)
      goto LABEL_126;
    goto LABEL_136;
  }
LABEL_135:
  v13 = 0;
  if ((v9 & 0x80000) != 0)
  {
LABEL_126:
    v14 = 2654435761 * self->_diagFailuresBitmap;
    if ((v9 & 0x40000) != 0)
      goto LABEL_127;
LABEL_137:
    v15 = 0;
    if ((v9 & 0x100000) != 0)
      goto LABEL_128;
    goto LABEL_138;
  }
LABEL_136:
  v14 = 0;
  if ((v9 & 0x40000) == 0)
    goto LABEL_137;
LABEL_127:
  v15 = 2654435761 * self->_diagErrorCode;
  if ((v9 & 0x100000) != 0)
  {
LABEL_128:
    v16 = 2654435761 * self->_diagUnderlyingErrorCode;
    goto LABEL_139;
  }
LABEL_138:
  v16 = 0;
LABEL_139:
  v17 = -[NSString hash](self->_diagErrorDomain, "hash", v30);
  v18 = -[NSString hash](self->_diagUnderlyingErrorDomain, "hash");
  v19 = (uint64_t)self->_has;
  if ((v19 & 1) != 0)
  {
    v20 = 2654435761 * self->_apfsAvailableSpace;
    if ((v19 & 4) != 0)
    {
LABEL_141:
      v21 = 2654435761 * self->_apfsFlags;
      if ((v19 & 2) != 0)
        goto LABEL_142;
      goto LABEL_151;
    }
  }
  else
  {
    v20 = 0;
    if ((v19 & 4) != 0)
      goto LABEL_141;
  }
  v21 = 0;
  if ((v19 & 2) != 0)
  {
LABEL_142:
    v22 = 2654435761 * self->_apfsBlockSize;
    if ((v19 & 8) != 0)
      goto LABEL_143;
    goto LABEL_152;
  }
LABEL_151:
  v22 = 0;
  if ((v19 & 8) != 0)
  {
LABEL_143:
    v23 = 2654435761 * self->_apfsRole;
    if ((v19 & 0x400000000000) != 0)
      goto LABEL_144;
    goto LABEL_153;
  }
LABEL_152:
  v23 = 0;
  if ((v19 & 0x400000000000) != 0)
  {
LABEL_144:
    v24 = 2654435761 * self->_apfsEncrypted;
    if ((v19 & 0x1000000000) != 0)
      goto LABEL_145;
    goto LABEL_154;
  }
LABEL_153:
  v24 = 0;
  if ((v19 & 0x1000000000) != 0)
  {
LABEL_145:
    v25 = 2654435761 * self->_statDocID;
    if ((v19 & 0x2000000000) != 0)
      goto LABEL_146;
    goto LABEL_155;
  }
LABEL_154:
  v25 = 0;
  if ((v19 & 0x2000000000) != 0)
  {
LABEL_146:
    v26 = 2654435761 * self->_statLogicalSize;
    if ((v19 & 0x4000000000) != 0)
      goto LABEL_147;
LABEL_156:
    v27 = 0;
    if ((v19 & 0x800000000) != 0)
      goto LABEL_148;
LABEL_157:
    v28 = 0;
    return v94 ^ v95 ^ v93 ^ v92 ^ v91 ^ v90 ^ v89 ^ v88 ^ v87 ^ v85 ^ v84 ^ v83 ^ v82 ^ v81 ^ v80 ^ v79 ^ v86 ^ v78 ^ v77 ^ v76 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28;
  }
LABEL_155:
  v26 = 0;
  if ((v19 & 0x4000000000) == 0)
    goto LABEL_156;
LABEL_147:
  v27 = 2654435761 * self->_statPhysicalSize;
  if ((v19 & 0x800000000) == 0)
    goto LABEL_157;
LABEL_148:
  v28 = 2654435761 * self->_statDirEntryCount;
  return v94 ^ v95 ^ v93 ^ v92 ^ v91 ^ v90 ^ v89 ^ v88 ^ v87 ^ v85 ^ v84 ^ v83 ^ v82 ^ v81 ^ v80 ^ v79 ^ v86 ^ v78 ^ v77 ^ v76 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28;
}

- (void)mergeFrom:(id)a3
{
  char *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  __int16 v8;
  uint64_t *v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char *v19;

  v4 = (char *)a3;
  v5 = (uint64_t *)(v4 + 452);
  v6 = *(_QWORD *)(v4 + 452);
  if ((v6 & 0x2000000) != 0)
  {
    self->_itemNumber = *((_QWORD *)v4 + 26);
    *(_QWORD *)&self->_has |= 0x2000000uLL;
    v6 = *v5;
    if ((*v5 & 0x80000000000) == 0)
    {
LABEL_3:
      if ((v6 & 0x40000000000) == 0)
        goto LABEL_4;
      goto LABEL_81;
    }
  }
  else if ((v6 & 0x80000000000) == 0)
  {
    goto LABEL_3;
  }
  self->_itemType = *((_DWORD *)v4 + 96);
  *(_QWORD *)&self->_has |= 0x80000000000uLL;
  v6 = *(_QWORD *)(v4 + 452);
  if ((v6 & 0x40000000000) == 0)
  {
LABEL_4:
    if ((v6 & 0x800000000000000) == 0)
      goto LABEL_5;
    goto LABEL_82;
  }
LABEL_81:
  self->_dataProtectionClass = *((_DWORD *)v4 + 85);
  *(_QWORD *)&self->_has |= 0x40000000000uLL;
  v6 = *(_QWORD *)(v4 + 452);
  if ((v6 & 0x800000000000000) == 0)
  {
LABEL_5:
    if ((v6 & 0x1000000000000000) == 0)
      goto LABEL_6;
    goto LABEL_83;
  }
LABEL_82:
  self->_isOwnedByLoggedInUser = v4[433];
  *(_QWORD *)&self->_has |= 0x800000000000000uLL;
  v6 = *(_QWORD *)(v4 + 452);
  if ((v6 & 0x1000000000000000) == 0)
  {
LABEL_6:
    if ((v6 & 0x200000000000) == 0)
      goto LABEL_7;
    goto LABEL_84;
  }
LABEL_83:
  self->_isOwnedByRoot = v4[434];
  *(_QWORD *)&self->_has |= 0x1000000000000000uLL;
  v6 = *(_QWORD *)(v4 + 452);
  if ((v6 & 0x200000000000) == 0)
  {
LABEL_7:
    if ((v6 & 0x100000000000000) == 0)
      goto LABEL_8;
    goto LABEL_85;
  }
LABEL_84:
  self->_xattrCount = *((_DWORD *)v4 + 104);
  *(_QWORD *)&self->_has |= 0x200000000000uLL;
  v6 = *(_QWORD *)(v4 + 452);
  if ((v6 & 0x100000000000000) == 0)
  {
LABEL_8:
    if ((v6 & 0x8000000000000000) == 0)
      goto LABEL_9;
    goto LABEL_86;
  }
LABEL_85:
  self->_isAppleDouble = v4[430];
  *(_QWORD *)&self->_has |= 0x100000000000000uLL;
  v6 = *(_QWORD *)(v4 + 452);
  if ((v6 & 0x8000000000000000) == 0)
  {
LABEL_9:
    if ((v6 & 0x4000000000000000) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_86:
  self->_isResourceFork = v4[437];
  *(_QWORD *)&self->_has |= 0x8000000000000000;
  if ((*(_QWORD *)(v4 + 452) & 0x4000000000000000) != 0)
  {
LABEL_10:
    self->_isQuarantined = v4[436];
    *(_QWORD *)&self->_has |= 0x4000000000000000uLL;
  }
LABEL_11:
  v19 = v4;
  if (*((_QWORD *)v4 + 51))
  {
    -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation setUtType:](self, "setUtType:");
    v4 = v19;
  }
  v7 = *(_QWORD *)(v4 + 452);
  if ((v7 & 0x200000000000000) != 0)
  {
    self->_isBundleBit = v4[431];
    *(_QWORD *)&self->_has |= 0x200000000000000uLL;
    v7 = *(_QWORD *)(v4 + 452);
  }
  v8 = *((_WORD *)v4 + 230);
  if ((v8 & 1) != 0)
  {
    self->_isSparseFile = v4[438];
    *((_WORD *)&self->_has + 4) |= 1u;
    v7 = *(_QWORD *)(v4 + 452);
    v8 = *((_WORD *)v4 + 230);
    if ((v7 & 0x20000000000) == 0)
    {
LABEL_17:
      if ((v7 & 0x100000000) == 0)
        goto LABEL_18;
      goto LABEL_90;
    }
  }
  else if ((v7 & 0x20000000000) == 0)
  {
    goto LABEL_17;
  }
  self->_compressionType = *((_DWORD *)v4 + 84);
  *(_QWORD *)&self->_has |= 0x20000000000uLL;
  v7 = *(_QWORD *)(v4 + 452);
  v8 = *((_WORD *)v4 + 230);
  if ((v7 & 0x100000000) == 0)
  {
LABEL_18:
    if ((v7 & 0x20) == 0)
      goto LABEL_19;
    goto LABEL_91;
  }
LABEL_90:
  self->_readErrorCode = *((_QWORD *)v4 + 33);
  *(_QWORD *)&self->_has |= 0x100000000uLL;
  v7 = *(_QWORD *)(v4 + 452);
  v8 = *((_WORD *)v4 + 230);
  if ((v7 & 0x20) == 0)
  {
LABEL_19:
    if ((v7 & 0x100000000000) == 0)
      goto LABEL_20;
    goto LABEL_92;
  }
LABEL_91:
  self->_cloneErrorCode = *((_QWORD *)v4 + 6);
  *(_QWORD *)&self->_has |= 0x20uLL;
  v7 = *(_QWORD *)(v4 + 452);
  v8 = *((_WORD *)v4 + 230);
  if ((v7 & 0x100000000000) == 0)
  {
LABEL_20:
    if ((v7 & 0x10000000) == 0)
      goto LABEL_21;
    goto LABEL_93;
  }
LABEL_92:
  self->_syncRootEnum = *((_DWORD *)v4 + 100);
  *(_QWORD *)&self->_has |= 0x100000000000uLL;
  v7 = *(_QWORD *)(v4 + 452);
  v8 = *((_WORD *)v4 + 230);
  if ((v7 & 0x10000000) == 0)
  {
LABEL_21:
    if ((v7 & 0x200000) == 0)
      goto LABEL_22;
    goto LABEL_94;
  }
LABEL_93:
  self->_pathLength = *((_QWORD *)v4 + 29);
  *(_QWORD *)&self->_has |= 0x10000000uLL;
  v7 = *(_QWORD *)(v4 + 452);
  v8 = *((_WORD *)v4 + 230);
  if ((v7 & 0x200000) == 0)
  {
LABEL_22:
    if ((v7 & 0x400000000) == 0)
      goto LABEL_23;
    goto LABEL_95;
  }
LABEL_94:
  self->_fileNameLength = *((_QWORD *)v4 + 22);
  *(_QWORD *)&self->_has |= 0x200000uLL;
  v7 = *(_QWORD *)(v4 + 452);
  v8 = *((_WORD *)v4 + 230);
  if ((v7 & 0x400000000) == 0)
  {
LABEL_23:
    if ((v7 & 0x200000000) == 0)
      goto LABEL_24;
    goto LABEL_96;
  }
LABEL_95:
  self->_stMode = *((_QWORD *)v4 + 35);
  *(_QWORD *)&self->_has |= 0x400000000uLL;
  v7 = *(_QWORD *)(v4 + 452);
  v8 = *((_WORD *)v4 + 230);
  if ((v7 & 0x200000000) == 0)
  {
LABEL_24:
    if ((v7 & 0x40000000000000) == 0)
      goto LABEL_25;
    goto LABEL_97;
  }
LABEL_96:
  self->_stFlags = *((_QWORD *)v4 + 34);
  *(_QWORD *)&self->_has |= 0x200000000uLL;
  v7 = *(_QWORD *)(v4 + 452);
  v8 = *((_WORD *)v4 + 230);
  if ((v7 & 0x40000000000000) == 0)
  {
LABEL_25:
    if ((v8 & 0x20) == 0)
      goto LABEL_26;
    goto LABEL_98;
  }
LABEL_97:
  self->_hasAcls = v4[428];
  *(_QWORD *)&self->_has |= 0x40000000000000uLL;
  v7 = *(_QWORD *)(v4 + 452);
  v8 = *((_WORD *)v4 + 230);
  if ((v8 & 0x20) == 0)
  {
LABEL_26:
    if ((v7 & 0x2000000000000000) == 0)
      goto LABEL_27;
    goto LABEL_99;
  }
LABEL_98:
  self->_parentHasAcls = v4[443];
  *((_WORD *)&self->_has + 4) |= 0x20u;
  v7 = *(_QWORD *)(v4 + 452);
  v8 = *((_WORD *)v4 + 230);
  if ((v7 & 0x2000000000000000) == 0)
  {
LABEL_27:
    if ((v8 & 4) == 0)
      goto LABEL_28;
    goto LABEL_100;
  }
LABEL_99:
  self->_isPurgable = v4[435];
  *(_QWORD *)&self->_has |= 0x2000000000000000uLL;
  v7 = *(_QWORD *)(v4 + 452);
  v8 = *((_WORD *)v4 + 230);
  if ((v8 & 4) == 0)
  {
LABEL_28:
    if ((v8 & 2) == 0)
      goto LABEL_29;
    goto LABEL_101;
  }
LABEL_100:
  self->_isUrgent = v4[440];
  *((_WORD *)&self->_has + 4) |= 4u;
  v7 = *(_QWORD *)(v4 + 452);
  if ((*((_WORD *)v4 + 230) & 2) == 0)
  {
LABEL_29:
    if ((v7 & 0x400000000000000) == 0)
      goto LABEL_31;
    goto LABEL_30;
  }
LABEL_101:
  self->_isUnderDirStatFolder = v4[439];
  *((_WORD *)&self->_has + 4) |= 2u;
  if ((*(_QWORD *)(v4 + 452) & 0x400000000000000) != 0)
  {
LABEL_30:
    self->_isFileNameNonAscii = v4[432];
    *(_QWORD *)&self->_has |= 0x400000000000000uLL;
  }
LABEL_31:
  if (*((_QWORD *)v4 + 47))
  {
    -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation setFinderInfoFlagsBase64:](self, "setFinderInfoFlagsBase64:");
    v4 = v19;
  }
  v9 = (uint64_t *)(v4 + 452);
  v10 = *(_QWORD *)(v4 + 452);
  if ((v10 & 0x1000000) != 0)
  {
    self->_hasMoreLinks = *((_QWORD *)v4 + 25);
    *(_QWORD *)&self->_has |= 0x1000000uLL;
    v10 = *v9;
    if ((*v9 & 0x400000) == 0)
    {
LABEL_35:
      if ((v10 & 0x8000) == 0)
        goto LABEL_36;
      goto LABEL_105;
    }
  }
  else if ((v10 & 0x400000) == 0)
  {
    goto LABEL_35;
  }
  self->_fsGenCount = *((_QWORD *)v4 + 23);
  *(_QWORD *)&self->_has |= 0x400000uLL;
  v10 = *(_QWORD *)(v4 + 452);
  if ((v10 & 0x8000) == 0)
  {
LABEL_36:
    if ((v10 & 0x80000000000000) == 0)
      goto LABEL_37;
    goto LABEL_106;
  }
LABEL_105:
  self->_dbGenCount = *((_QWORD *)v4 + 16);
  *(_QWORD *)&self->_has |= 0x8000uLL;
  v10 = *(_QWORD *)(v4 + 452);
  if ((v10 & 0x80000000000000) == 0)
  {
LABEL_37:
    if ((v10 & 0x10000000000000) == 0)
      goto LABEL_39;
    goto LABEL_38;
  }
LABEL_106:
  self->_hasLocalChanges = v4[429];
  *(_QWORD *)&self->_has |= 0x80000000000000uLL;
  if ((*(_QWORD *)(v4 + 452) & 0x10000000000000) != 0)
  {
LABEL_38:
    self->_doGenCountsMatchInFileId = v4[426];
    *(_QWORD *)&self->_has |= 0x10000000000000uLL;
  }
LABEL_39:
  if (*((_QWORD *)v4 + 46))
  {
    -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation setFileNameExtension:](self, "setFileNameExtension:");
    v4 = v19;
  }
  if ((*(_QWORD *)(v4 + 452) & 0x8000000) != 0)
  {
    self->_pathDepth = *((_QWORD *)v4 + 28);
    *(_QWORD *)&self->_has |= 0x8000000uLL;
  }
  v11 = *((_WORD *)v4 + 230);
  if ((v11 & 0x200) != 0)
  {
    self->_xattrHasDemotion = v4[447];
    *((_WORD *)&self->_has + 4) |= 0x200u;
    v11 = *((_WORD *)v4 + 230);
  }
  if ((v11 & 0x400) != 0)
  {
    self->_xattrHasPromotion = v4[448];
    *((_WORD *)&self->_has + 4) |= 0x400u;
  }
  if (*((_QWORD *)v4 + 43))
  {
    -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation setDbErrorDomain:](self, "setDbErrorDomain:");
    v4 = v19;
  }
  v12 = *(_QWORD *)(v4 + 452);
  if ((v12 & 0x100) != 0)
  {
    self->_dbErrorCode = *((_QWORD *)v4 + 9);
    *(_QWORD *)&self->_has |= 0x100uLL;
    v12 = *(_QWORD *)(v4 + 452);
  }
  v13 = *((_WORD *)v4 + 230);
  if ((v12 & 0x40) != 0)
  {
    self->_dbCapabilities = *((_QWORD *)v4 + 7);
    *(_QWORD *)&self->_has |= 0x40uLL;
    v12 = *(_QWORD *)(v4 + 452);
    v13 = *((_WORD *)v4 + 230);
    if ((v12 & 0x20000) == 0)
    {
LABEL_53:
      if ((v12 & 0x10000) == 0)
        goto LABEL_54;
      goto LABEL_110;
    }
  }
  else if ((v12 & 0x20000) == 0)
  {
    goto LABEL_53;
  }
  self->_dbTransferState = *((_QWORD *)v4 + 18);
  *(_QWORD *)&self->_has |= 0x20000uLL;
  v12 = *(_QWORD *)(v4 + 452);
  v13 = *((_WORD *)v4 + 230);
  if ((v12 & 0x10000) == 0)
  {
LABEL_54:
    if ((v12 & 0x2000000000000) == 0)
      goto LABEL_55;
    goto LABEL_111;
  }
LABEL_110:
  self->_dbSharingState = *((_QWORD *)v4 + 17);
  *(_QWORD *)&self->_has |= 0x10000uLL;
  v12 = *(_QWORD *)(v4 + 452);
  v13 = *((_WORD *)v4 + 230);
  if ((v12 & 0x2000000000000) == 0)
  {
LABEL_55:
    if ((v12 & 0x80) == 0)
      goto LABEL_56;
    goto LABEL_112;
  }
LABEL_111:
  self->_dbIsApplibrary = v4[423];
  *(_QWORD *)&self->_has |= 0x2000000000000uLL;
  v12 = *(_QWORD *)(v4 + 452);
  v13 = *((_WORD *)v4 + 230);
  if ((v12 & 0x80) == 0)
  {
LABEL_56:
    if ((v12 & 0x4000000000000) == 0)
      goto LABEL_57;
    goto LABEL_113;
  }
LABEL_112:
  self->_dbEffectiveContentPolicy = *((_QWORD *)v4 + 8);
  *(_QWORD *)&self->_has |= 0x80uLL;
  v12 = *(_QWORD *)(v4 + 452);
  v13 = *((_WORD *)v4 + 230);
  if ((v12 & 0x4000000000000) == 0)
  {
LABEL_57:
    if ((v12 & 0x1000) == 0)
      goto LABEL_58;
    goto LABEL_114;
  }
LABEL_113:
  self->_dbIsPackage = v4[424];
  *(_QWORD *)&self->_has |= 0x4000000000000uLL;
  v12 = *(_QWORD *)(v4 + 452);
  v13 = *((_WORD *)v4 + 230);
  if ((v12 & 0x1000) == 0)
  {
LABEL_58:
    if ((v12 & 0x200) == 0)
      goto LABEL_59;
    goto LABEL_115;
  }
LABEL_114:
  self->_dbFsContentStatus = *((_QWORD *)v4 + 13);
  *(_QWORD *)&self->_has |= 0x1000uLL;
  v12 = *(_QWORD *)(v4 + 452);
  v13 = *((_WORD *)v4 + 230);
  if ((v12 & 0x200) == 0)
  {
LABEL_59:
    if ((v12 & 0x2000) == 0)
      goto LABEL_60;
    goto LABEL_116;
  }
LABEL_115:
  self->_dbFpContentStatus = *((_QWORD *)v4 + 10);
  *(_QWORD *)&self->_has |= 0x200uLL;
  v12 = *(_QWORD *)(v4 + 452);
  v13 = *((_WORD *)v4 + 230);
  if ((v12 & 0x2000) == 0)
  {
LABEL_60:
    if ((v12 & 0x400) == 0)
      goto LABEL_61;
    goto LABEL_117;
  }
LABEL_116:
  self->_dbFsDeletionStatus = *((_QWORD *)v4 + 14);
  *(_QWORD *)&self->_has |= 0x2000uLL;
  v12 = *(_QWORD *)(v4 + 452);
  v13 = *((_WORD *)v4 + 230);
  if ((v12 & 0x400) == 0)
  {
LABEL_61:
    if ((v12 & 0x4000) == 0)
      goto LABEL_62;
    goto LABEL_118;
  }
LABEL_117:
  self->_dbFpDeletionStatus = *((_QWORD *)v4 + 11);
  *(_QWORD *)&self->_has |= 0x400uLL;
  v12 = *(_QWORD *)(v4 + 452);
  v13 = *((_WORD *)v4 + 230);
  if ((v12 & 0x4000) == 0)
  {
LABEL_62:
    if ((v12 & 0x800) == 0)
      goto LABEL_63;
    goto LABEL_119;
  }
LABEL_118:
  self->_dbFsImportStatus = *((_QWORD *)v4 + 15);
  *(_QWORD *)&self->_has |= 0x4000uLL;
  v12 = *(_QWORD *)(v4 + 452);
  v13 = *((_WORD *)v4 + 230);
  if ((v12 & 0x800) == 0)
  {
LABEL_63:
    if ((v12 & 0x8000000000000) == 0)
      goto LABEL_64;
    goto LABEL_120;
  }
LABEL_119:
  self->_dbFpImportStatus = *((_QWORD *)v4 + 12);
  *(_QWORD *)&self->_has |= 0x800uLL;
  v12 = *(_QWORD *)(v4 + 452);
  v13 = *((_WORD *)v4 + 230);
  if ((v12 & 0x8000000000000) == 0)
  {
LABEL_64:
    if ((v12 & 0x800000) == 0)
      goto LABEL_65;
    goto LABEL_121;
  }
LABEL_120:
  self->_dbIsSuper = v4[425];
  *(_QWORD *)&self->_has |= 0x8000000000000uLL;
  v12 = *(_QWORD *)(v4 + 452);
  v13 = *((_WORD *)v4 + 230);
  if ((v12 & 0x800000) == 0)
  {
LABEL_65:
    if ((v13 & 0x40) == 0)
      goto LABEL_66;
    goto LABEL_122;
  }
LABEL_121:
  self->_gencountDiff = *((_QWORD *)v4 + 24);
  *(_QWORD *)&self->_has |= 0x800000uLL;
  v12 = *(_QWORD *)(v4 + 452);
  v13 = *((_WORD *)v4 + 230);
  if ((v13 & 0x40) == 0)
  {
LABEL_66:
    if ((v12 & 0x800000000000) == 0)
      goto LABEL_67;
    goto LABEL_123;
  }
LABEL_122:
  self->_parentMatches = v4[444];
  *((_WORD *)&self->_has + 4) |= 0x40u;
  v12 = *(_QWORD *)(v4 + 452);
  v13 = *((_WORD *)v4 + 230);
  if ((v12 & 0x800000000000) == 0)
  {
LABEL_67:
    if ((v13 & 8) == 0)
      goto LABEL_68;
    goto LABEL_124;
  }
LABEL_123:
  self->_appLibraryMatches = v4[421];
  *(_QWORD *)&self->_has |= 0x800000000000uLL;
  v12 = *(_QWORD *)(v4 + 452);
  v13 = *((_WORD *)v4 + 230);
  if ((v13 & 8) == 0)
  {
LABEL_68:
    if ((v12 & 0x20000000000000) == 0)
      goto LABEL_69;
    goto LABEL_125;
  }
LABEL_124:
  self->_mTimeBeforeMigrationStarted = v4[441];
  *((_WORD *)&self->_has + 4) |= 8u;
  v12 = *(_QWORD *)(v4 + 452);
  v13 = *((_WORD *)v4 + 230);
  if ((v12 & 0x20000000000000) == 0)
  {
LABEL_69:
    if ((v12 & 0x4000000) == 0)
      goto LABEL_70;
    goto LABEL_126;
  }
LABEL_125:
  self->_docIDMatches = v4[427];
  *(_QWORD *)&self->_has |= 0x20000000000000uLL;
  v12 = *(_QWORD *)(v4 + 452);
  v13 = *((_WORD *)v4 + 230);
  if ((v12 & 0x4000000) == 0)
  {
LABEL_70:
    if ((v12 & 0x10) == 0)
      goto LABEL_71;
    goto LABEL_127;
  }
LABEL_126:
  self->_mTime = *((_QWORD *)v4 + 27);
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  v12 = *(_QWORD *)(v4 + 452);
  v13 = *((_WORD *)v4 + 230);
  if ((v12 & 0x10) == 0)
  {
LABEL_71:
    if ((v12 & 0x1000000000000) == 0)
      goto LABEL_72;
    goto LABEL_128;
  }
LABEL_127:
  self->_bTime = *((_QWORD *)v4 + 5);
  *(_QWORD *)&self->_has |= 0x10uLL;
  v13 = *((_WORD *)v4 + 230);
  if ((*(_QWORD *)(v4 + 452) & 0x1000000000000) == 0)
  {
LABEL_72:
    if ((v13 & 0x100) == 0)
      goto LABEL_74;
    goto LABEL_73;
  }
LABEL_128:
  self->_bTimeIsBusy = v4[422];
  *(_QWORD *)&self->_has |= 0x1000000000000uLL;
  if ((*((_WORD *)v4 + 230) & 0x100) != 0)
  {
LABEL_73:
    self->_xattrHasBeforeBounce = v4[446];
    *((_WORD *)&self->_has + 4) |= 0x100u;
  }
LABEL_74:
  if (*((_QWORD *)v4 + 49))
  {
    -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation setNameUnicodeNorm:](self, "setNameUnicodeNorm:");
    v4 = v19;
  }
  v14 = (uint64_t *)(v4 + 452);
  v15 = *((_WORD *)v4 + 230);
  if ((v15 & 0x10) != 0)
  {
    self->_nameIsTrashed = v4[442];
    *((_WORD *)&self->_has + 4) |= 0x10u;
    v16 = *v14;
    v15 = *((_WORD *)v4 + 230);
    if ((*v14 & 0x8000000000) == 0)
      goto LABEL_132;
    goto LABEL_131;
  }
  v16 = *v14;
  if ((*v14 & 0x8000000000) != 0)
  {
LABEL_131:
    self->_sysPageSize = *((_QWORD *)v4 + 40);
    *(_QWORD *)&self->_has |= 0x8000000000uLL;
    v16 = *(_QWORD *)(v4 + 452);
    v15 = *((_WORD *)v4 + 230);
  }
LABEL_132:
  if ((v16 & 0x10000000000) != 0)
  {
    self->_sysUID = *((_QWORD *)v4 + 41);
    *(_QWORD *)&self->_has |= 0x10000000000uLL;
    v16 = *(_QWORD *)(v4 + 452);
    if ((*((_WORD *)v4 + 230) & 0x80) == 0)
    {
LABEL_134:
      if ((v16 & 0x40000000) == 0)
        goto LABEL_135;
      goto LABEL_158;
    }
  }
  else if ((v15 & 0x80) == 0)
  {
    goto LABEL_134;
  }
  self->_sysDocIDResolutionOK = v4[445];
  *((_WORD *)&self->_has + 4) |= 0x80u;
  v16 = *(_QWORD *)(v4 + 452);
  if ((v16 & 0x40000000) == 0)
  {
LABEL_135:
    if ((v16 & 0x20000000) == 0)
      goto LABEL_136;
    goto LABEL_159;
  }
LABEL_158:
  self->_purgeGenCount = *((_QWORD *)v4 + 31);
  *(_QWORD *)&self->_has |= 0x40000000uLL;
  v16 = *(_QWORD *)(v4 + 452);
  if ((v16 & 0x20000000) == 0)
  {
LABEL_136:
    if ((v16 & 0x80000000) == 0)
      goto LABEL_137;
    goto LABEL_160;
  }
LABEL_159:
  self->_purgeATime = *((_QWORD *)v4 + 30);
  *(_QWORD *)&self->_has |= 0x20000000uLL;
  v16 = *(_QWORD *)(v4 + 452);
  if ((v16 & 0x80000000) == 0)
  {
LABEL_137:
    if ((v16 & 0x80000) == 0)
      goto LABEL_138;
    goto LABEL_161;
  }
LABEL_160:
  self->_purgeSyncRoot = *((_QWORD *)v4 + 32);
  *(_QWORD *)&self->_has |= 0x80000000uLL;
  v16 = *(_QWORD *)(v4 + 452);
  if ((v16 & 0x80000) == 0)
  {
LABEL_138:
    if ((v16 & 0x40000) == 0)
      goto LABEL_139;
    goto LABEL_162;
  }
LABEL_161:
  self->_diagFailuresBitmap = *((_QWORD *)v4 + 20);
  *(_QWORD *)&self->_has |= 0x80000uLL;
  v16 = *(_QWORD *)(v4 + 452);
  if ((v16 & 0x40000) == 0)
  {
LABEL_139:
    if ((v16 & 0x100000) == 0)
      goto LABEL_141;
    goto LABEL_140;
  }
LABEL_162:
  self->_diagErrorCode = *((_QWORD *)v4 + 19);
  *(_QWORD *)&self->_has |= 0x40000uLL;
  if ((*(_QWORD *)(v4 + 452) & 0x100000) != 0)
  {
LABEL_140:
    self->_diagUnderlyingErrorCode = *((_QWORD *)v4 + 21);
    *(_QWORD *)&self->_has |= 0x100000uLL;
  }
LABEL_141:
  if (*((_QWORD *)v4 + 44))
  {
    -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation setDiagErrorDomain:](self, "setDiagErrorDomain:");
    v4 = v19;
  }
  if (*((_QWORD *)v4 + 45))
  {
    -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation setDiagUnderlyingErrorDomain:](self, "setDiagUnderlyingErrorDomain:");
    v4 = v19;
  }
  v17 = (uint64_t *)(v4 + 452);
  v18 = *(_QWORD *)(v4 + 452);
  if ((v18 & 1) != 0)
  {
    self->_apfsAvailableSpace = *((_QWORD *)v4 + 1);
    *(_QWORD *)&self->_has |= 1uLL;
    v18 = *v17;
    if ((*v17 & 4) == 0)
    {
LABEL_147:
      if ((v18 & 2) == 0)
        goto LABEL_148;
      goto LABEL_166;
    }
  }
  else if ((v18 & 4) == 0)
  {
    goto LABEL_147;
  }
  self->_apfsFlags = *((_QWORD *)v4 + 3);
  *(_QWORD *)&self->_has |= 4uLL;
  v18 = *(_QWORD *)(v4 + 452);
  if ((v18 & 2) == 0)
  {
LABEL_148:
    if ((v18 & 8) == 0)
      goto LABEL_149;
    goto LABEL_167;
  }
LABEL_166:
  self->_apfsBlockSize = *((_QWORD *)v4 + 2);
  *(_QWORD *)&self->_has |= 2uLL;
  v18 = *(_QWORD *)(v4 + 452);
  if ((v18 & 8) == 0)
  {
LABEL_149:
    if ((v18 & 0x400000000000) == 0)
      goto LABEL_150;
    goto LABEL_168;
  }
LABEL_167:
  self->_apfsRole = *((_QWORD *)v4 + 4);
  *(_QWORD *)&self->_has |= 8uLL;
  v18 = *(_QWORD *)(v4 + 452);
  if ((v18 & 0x400000000000) == 0)
  {
LABEL_150:
    if ((v18 & 0x1000000000) == 0)
      goto LABEL_151;
    goto LABEL_169;
  }
LABEL_168:
  self->_apfsEncrypted = v4[420];
  *(_QWORD *)&self->_has |= 0x400000000000uLL;
  v18 = *(_QWORD *)(v4 + 452);
  if ((v18 & 0x1000000000) == 0)
  {
LABEL_151:
    if ((v18 & 0x2000000000) == 0)
      goto LABEL_152;
    goto LABEL_170;
  }
LABEL_169:
  self->_statDocID = *((_QWORD *)v4 + 37);
  *(_QWORD *)&self->_has |= 0x1000000000uLL;
  v18 = *(_QWORD *)(v4 + 452);
  if ((v18 & 0x2000000000) == 0)
  {
LABEL_152:
    if ((v18 & 0x4000000000) == 0)
      goto LABEL_153;
LABEL_171:
    self->_statPhysicalSize = *((_QWORD *)v4 + 39);
    *(_QWORD *)&self->_has |= 0x4000000000uLL;
    if ((*(_QWORD *)(v4 + 452) & 0x800000000) == 0)
      goto LABEL_155;
    goto LABEL_154;
  }
LABEL_170:
  self->_statLogicalSize = *((_QWORD *)v4 + 38);
  *(_QWORD *)&self->_has |= 0x2000000000uLL;
  v18 = *(_QWORD *)(v4 + 452);
  if ((v18 & 0x4000000000) != 0)
    goto LABEL_171;
LABEL_153:
  if ((v18 & 0x800000000) != 0)
  {
LABEL_154:
    self->_statDirEntryCount = *((_QWORD *)v4 + 36);
    *(_QWORD *)&self->_has |= 0x800000000uLL;
  }
LABEL_155:

}

- (int64_t)itemNumber
{
  return self->_itemNumber;
}

- (int)itemType
{
  return self->_itemType;
}

- (int)dataProtectionClass
{
  return self->_dataProtectionClass;
}

- (BOOL)isOwnedByLoggedInUser
{
  return self->_isOwnedByLoggedInUser;
}

- (BOOL)isOwnedByRoot
{
  return self->_isOwnedByRoot;
}

- (int)xattrCount
{
  return self->_xattrCount;
}

- (BOOL)isAppleDouble
{
  return self->_isAppleDouble;
}

- (BOOL)isResourceFork
{
  return self->_isResourceFork;
}

- (BOOL)isQuarantined
{
  return self->_isQuarantined;
}

- (NSString)utType
{
  return self->_utType;
}

- (void)setUtType:(id)a3
{
  objc_storeStrong((id *)&self->_utType, a3);
}

- (BOOL)isBundleBit
{
  return self->_isBundleBit;
}

- (BOOL)isSparseFile
{
  return self->_isSparseFile;
}

- (int)compressionType
{
  return self->_compressionType;
}

- (int64_t)readErrorCode
{
  return self->_readErrorCode;
}

- (int64_t)cloneErrorCode
{
  return self->_cloneErrorCode;
}

- (int)syncRootEnum
{
  return self->_syncRootEnum;
}

- (int64_t)pathLength
{
  return self->_pathLength;
}

- (int64_t)fileNameLength
{
  return self->_fileNameLength;
}

- (int64_t)stMode
{
  return self->_stMode;
}

- (int64_t)stFlags
{
  return self->_stFlags;
}

- (BOOL)hasAcls
{
  return self->_hasAcls;
}

- (BOOL)parentHasAcls
{
  return self->_parentHasAcls;
}

- (BOOL)isPurgable
{
  return self->_isPurgable;
}

- (BOOL)isUrgent
{
  return self->_isUrgent;
}

- (BOOL)isUnderDirStatFolder
{
  return self->_isUnderDirStatFolder;
}

- (BOOL)isFileNameNonAscii
{
  return self->_isFileNameNonAscii;
}

- (NSString)finderInfoFlagsBase64
{
  return self->_finderInfoFlagsBase64;
}

- (void)setFinderInfoFlagsBase64:(id)a3
{
  objc_storeStrong((id *)&self->_finderInfoFlagsBase64, a3);
}

- (int64_t)hasMoreLinks
{
  return self->_hasMoreLinks;
}

- (int64_t)fsGenCount
{
  return self->_fsGenCount;
}

- (int64_t)dbGenCount
{
  return self->_dbGenCount;
}

- (BOOL)hasLocalChanges
{
  return self->_hasLocalChanges;
}

- (BOOL)doGenCountsMatchInFileId
{
  return self->_doGenCountsMatchInFileId;
}

- (NSString)fileNameExtension
{
  return self->_fileNameExtension;
}

- (void)setFileNameExtension:(id)a3
{
  objc_storeStrong((id *)&self->_fileNameExtension, a3);
}

- (int64_t)pathDepth
{
  return self->_pathDepth;
}

- (BOOL)xattrHasDemotion
{
  return self->_xattrHasDemotion;
}

- (BOOL)xattrHasPromotion
{
  return self->_xattrHasPromotion;
}

- (NSString)dbErrorDomain
{
  return self->_dbErrorDomain;
}

- (void)setDbErrorDomain:(id)a3
{
  objc_storeStrong((id *)&self->_dbErrorDomain, a3);
}

- (int64_t)dbErrorCode
{
  return self->_dbErrorCode;
}

- (int64_t)dbCapabilities
{
  return self->_dbCapabilities;
}

- (int64_t)dbTransferState
{
  return self->_dbTransferState;
}

- (int64_t)dbSharingState
{
  return self->_dbSharingState;
}

- (BOOL)dbIsApplibrary
{
  return self->_dbIsApplibrary;
}

- (int64_t)dbEffectiveContentPolicy
{
  return self->_dbEffectiveContentPolicy;
}

- (BOOL)dbIsPackage
{
  return self->_dbIsPackage;
}

- (int64_t)dbFsContentStatus
{
  return self->_dbFsContentStatus;
}

- (int64_t)dbFpContentStatus
{
  return self->_dbFpContentStatus;
}

- (int64_t)dbFsDeletionStatus
{
  return self->_dbFsDeletionStatus;
}

- (int64_t)dbFpDeletionStatus
{
  return self->_dbFpDeletionStatus;
}

- (int64_t)dbFsImportStatus
{
  return self->_dbFsImportStatus;
}

- (int64_t)dbFpImportStatus
{
  return self->_dbFpImportStatus;
}

- (BOOL)dbIsSuper
{
  return self->_dbIsSuper;
}

- (int64_t)gencountDiff
{
  return self->_gencountDiff;
}

- (BOOL)parentMatches
{
  return self->_parentMatches;
}

- (BOOL)appLibraryMatches
{
  return self->_appLibraryMatches;
}

- (BOOL)mTimeBeforeMigrationStarted
{
  return self->_mTimeBeforeMigrationStarted;
}

- (BOOL)docIDMatches
{
  return self->_docIDMatches;
}

- (int64_t)mTime
{
  return self->_mTime;
}

- (int64_t)bTime
{
  return self->_bTime;
}

- (BOOL)bTimeIsBusy
{
  return self->_bTimeIsBusy;
}

- (BOOL)xattrHasBeforeBounce
{
  return self->_xattrHasBeforeBounce;
}

- (NSString)nameUnicodeNorm
{
  return self->_nameUnicodeNorm;
}

- (void)setNameUnicodeNorm:(id)a3
{
  objc_storeStrong((id *)&self->_nameUnicodeNorm, a3);
}

- (BOOL)nameIsTrashed
{
  return self->_nameIsTrashed;
}

- (int64_t)sysPageSize
{
  return self->_sysPageSize;
}

- (int64_t)sysUID
{
  return self->_sysUID;
}

- (BOOL)sysDocIDResolutionOK
{
  return self->_sysDocIDResolutionOK;
}

- (int64_t)purgeGenCount
{
  return self->_purgeGenCount;
}

- (int64_t)purgeATime
{
  return self->_purgeATime;
}

- (int64_t)purgeSyncRoot
{
  return self->_purgeSyncRoot;
}

- (int64_t)diagFailuresBitmap
{
  return self->_diagFailuresBitmap;
}

- (int64_t)diagErrorCode
{
  return self->_diagErrorCode;
}

- (int64_t)diagUnderlyingErrorCode
{
  return self->_diagUnderlyingErrorCode;
}

- (NSString)diagErrorDomain
{
  return self->_diagErrorDomain;
}

- (void)setDiagErrorDomain:(id)a3
{
  objc_storeStrong((id *)&self->_diagErrorDomain, a3);
}

- (NSString)diagUnderlyingErrorDomain
{
  return self->_diagUnderlyingErrorDomain;
}

- (void)setDiagUnderlyingErrorDomain:(id)a3
{
  objc_storeStrong((id *)&self->_diagUnderlyingErrorDomain, a3);
}

- (int64_t)apfsAvailableSpace
{
  return self->_apfsAvailableSpace;
}

- (int64_t)apfsFlags
{
  return self->_apfsFlags;
}

- (int64_t)apfsBlockSize
{
  return self->_apfsBlockSize;
}

- (int64_t)apfsRole
{
  return self->_apfsRole;
}

- (BOOL)apfsEncrypted
{
  return self->_apfsEncrypted;
}

- (int64_t)statDocID
{
  return self->_statDocID;
}

- (int64_t)statLogicalSize
{
  return self->_statLogicalSize;
}

- (int64_t)statPhysicalSize
{
  return self->_statPhysicalSize;
}

- (int64_t)statDirEntryCount
{
  return self->_statDirEntryCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utType, 0);
  objc_storeStrong((id *)&self->_nameUnicodeNorm, 0);
  objc_storeStrong((id *)&self->_finderInfoFlagsBase64, 0);
  objc_storeStrong((id *)&self->_fileNameExtension, 0);
  objc_storeStrong((id *)&self->_diagUnderlyingErrorDomain, 0);
  objc_storeStrong((id *)&self->_diagErrorDomain, 0);
  objc_storeStrong((id *)&self->_dbErrorDomain, 0);
}

@end
