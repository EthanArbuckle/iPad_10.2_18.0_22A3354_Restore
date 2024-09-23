@implementation BRCMigrationStats

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t sideFaultsCount;
  id v5;

  sideFaultsCount = self->sideFaultsCount;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", sideFaultsCount, CFSTR("sideFaultsCount"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->clonedFolders, CFSTR("clonedFolders"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->clonedFiles, CFSTR("clonedFiles"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->clonedSideFaults, CFSTR("clonedSideFaults"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->clonedAppLibraries, CFSTR("clonedAppLibraries"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->cloningFailures, CFSTR("cloningFailures"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->reconciledItems, CFSTR("reconciledItems"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->reconciliationFailures, CFSTR("reconciliationFailures"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->migratedSideFaults, CFSTR("migratedSideFaults"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->nonMigratedItems, CFSTR("nonMigratedItems"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->expectedMigrations, CFSTR("expectedMigrations"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->materialisedInCloudDocs, CFSTR("materialisedInCloudDocs"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->materializedInFPFS, CFSTR("materializedInFPFS"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->itemsNotFoundInDB, CFSTR("itemsNotFoundInDB"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->itemsChangedDuringCloning, CFSTR("itemsChangedDuringCloning"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->ignoredContentProtectedItems, CFSTR("ignoredContentProtectedItems"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->packagesWithoutBundleBit, CFSTR("packagesWithoutBundleBit"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->bouncedDocumentsFolders, CFSTR("bouncedDocumentsFolders"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->symlinkedDocumentsFolders, CFSTR("symlinkedDocumentsFolders"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->documentsFoldersWithoutItemID, CFSTR("documentsFoldersWithoutItemID"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->datalessItems, CFSTR("datalessItems"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->unexpectedCreations, CFSTR("unexpectedCreations"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->bouncedItems, CFSTR("bouncedItems"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->totalItemCount, CFSTR("totalItemCount"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("duration"), self->duration);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("cloningDuration"), self->cloningDuration);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("importDuration"), self->importDuration);
  objc_msgSend(v5, "encodeObject:forKey:", self->uuid, CFSTR("uuid"));

}

- (BRCMigrationStats)initWithCoder:(id)a3
{
  id v4;
  BRCMigrationStats *v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  NSUUID *uuid;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BRCMigrationStats;
  v5 = -[BRCMigrationStats init](&v12, sel_init);
  if (v5)
  {
    v5->sideFaultsCount = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("sideFaultsCount"));
    v5->clonedFolders = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("clonedFolders"));
    v5->clonedFiles = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("clonedFiles"));
    v5->clonedSideFaults = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("clonedSideFaults"));
    v5->clonedAppLibraries = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("clonedAppLibraries"));
    v5->cloningFailures = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("cloningFailures"));
    v5->reconciledItems = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("reconciledItems"));
    v5->reconciliationFailures = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("reconciliationFailures"));
    v5->migratedSideFaults = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("migratedSideFaults"));
    v5->nonMigratedItems = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("nonMigratedItems"));
    v5->expectedMigrations = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("expectedMigrations"));
    v5->materialisedInCloudDocs = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("materialisedInCloudDocs"));
    v5->materializedInFPFS = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("materializedInFPFS"));
    v5->itemsNotFoundInDB = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("itemsNotFoundInDB"));
    v5->itemsChangedDuringCloning = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("itemsChangedDuringCloning"));
    v5->ignoredContentProtectedItems = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("ignoredContentProtectedItems"));
    v5->packagesWithoutBundleBit = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("packagesWithoutBundleBit"));
    v5->bouncedDocumentsFolders = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("bouncedDocumentsFolders"));
    v5->symlinkedDocumentsFolders = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("symlinkedDocumentsFolders"));
    v5->documentsFoldersWithoutItemID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("documentsFoldersWithoutItemID"));
    v5->datalessItems = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("datalessItems"));
    v5->unexpectedCreations = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("unexpectedCreations"));
    v5->bouncedItems = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("bouncedItems"));
    v5->totalItemCount = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("totalItemCount"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("duration"));
    v5->duration = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("cloningDuration"));
    v5->cloningDuration = v7;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("importDuration"));
    v5->importDuration = v8;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuid"));
    v9 = objc_claimAutoreleasedReturnValue();
    uuid = v5->uuid;
    v5->uuid = (NSUUID *)v9;

  }
  return v5;
}

- (unint64_t)sideFaultsCount
{
  return self->sideFaultsCount;
}

- (void)setSideFaultsCount:(unint64_t)a3
{
  self->sideFaultsCount = a3;
}

- (unint64_t)clonedFolders
{
  return self->clonedFolders;
}

- (void)setClonedFolders:(unint64_t)a3
{
  self->clonedFolders = a3;
}

- (unint64_t)clonedFiles
{
  return self->clonedFiles;
}

- (void)setClonedFiles:(unint64_t)a3
{
  self->clonedFiles = a3;
}

- (unint64_t)clonedSideFaults
{
  return self->clonedSideFaults;
}

- (void)setClonedSideFaults:(unint64_t)a3
{
  self->clonedSideFaults = a3;
}

- (unint64_t)clonedAppLibraries
{
  return self->clonedAppLibraries;
}

- (void)setClonedAppLibraries:(unint64_t)a3
{
  self->clonedAppLibraries = a3;
}

- (unint64_t)cloningFailures
{
  return self->cloningFailures;
}

- (void)setCloningFailures:(unint64_t)a3
{
  self->cloningFailures = a3;
}

- (unint64_t)reconciledItems
{
  return self->reconciledItems;
}

- (void)setReconciledItems:(unint64_t)a3
{
  self->reconciledItems = a3;
}

- (unint64_t)reconciliationFailures
{
  return self->reconciliationFailures;
}

- (void)setReconciliationFailures:(unint64_t)a3
{
  self->reconciliationFailures = a3;
}

- (unint64_t)migratedSideFaults
{
  return self->migratedSideFaults;
}

- (void)setMigratedSideFaults:(unint64_t)a3
{
  self->migratedSideFaults = a3;
}

- (unint64_t)nonMigratedItems
{
  return self->nonMigratedItems;
}

- (void)setNonMigratedItems:(unint64_t)a3
{
  self->nonMigratedItems = a3;
}

- (unint64_t)expectedMigrations
{
  return self->expectedMigrations;
}

- (void)setExpectedMigrations:(unint64_t)a3
{
  self->expectedMigrations = a3;
}

- (unint64_t)materialisedInCloudDocs
{
  return self->materialisedInCloudDocs;
}

- (void)setMaterialisedInCloudDocs:(unint64_t)a3
{
  self->materialisedInCloudDocs = a3;
}

- (unint64_t)materializedInFPFS
{
  return self->materializedInFPFS;
}

- (void)setMaterializedInFPFS:(unint64_t)a3
{
  self->materializedInFPFS = a3;
}

- (unint64_t)itemsNotFoundInDB
{
  return self->itemsNotFoundInDB;
}

- (void)setItemsNotFoundInDB:(unint64_t)a3
{
  self->itemsNotFoundInDB = a3;
}

- (unint64_t)itemsChangedDuringCloning
{
  return self->itemsChangedDuringCloning;
}

- (void)setItemsChangedDuringCloning:(unint64_t)a3
{
  self->itemsChangedDuringCloning = a3;
}

- (unint64_t)ignoredContentProtectedItems
{
  return self->ignoredContentProtectedItems;
}

- (void)setIgnoredContentProtectedItems:(unint64_t)a3
{
  self->ignoredContentProtectedItems = a3;
}

- (unint64_t)packagesWithoutBundleBit
{
  return self->packagesWithoutBundleBit;
}

- (void)setPackagesWithoutBundleBit:(unint64_t)a3
{
  self->packagesWithoutBundleBit = a3;
}

- (unint64_t)bouncedDocumentsFolders
{
  return self->bouncedDocumentsFolders;
}

- (void)setBouncedDocumentsFolders:(unint64_t)a3
{
  self->bouncedDocumentsFolders = a3;
}

- (unint64_t)symlinkedDocumentsFolders
{
  return self->symlinkedDocumentsFolders;
}

- (void)setSymlinkedDocumentsFolders:(unint64_t)a3
{
  self->symlinkedDocumentsFolders = a3;
}

- (unint64_t)documentsFoldersWithoutItemID
{
  return self->documentsFoldersWithoutItemID;
}

- (void)setDocumentsFoldersWithoutItemID:(unint64_t)a3
{
  self->documentsFoldersWithoutItemID = a3;
}

- (unint64_t)datalessItems
{
  return self->datalessItems;
}

- (void)setDatalessItems:(unint64_t)a3
{
  self->datalessItems = a3;
}

- (int64_t)unexpectedCreations
{
  return self->unexpectedCreations;
}

- (void)setUnexpectedCreations:(int64_t)a3
{
  self->unexpectedCreations = a3;
}

- (unint64_t)bouncedItems
{
  return self->bouncedItems;
}

- (void)setBouncedItems:(unint64_t)a3
{
  self->bouncedItems = a3;
}

- (unint64_t)totalItemCount
{
  return self->totalItemCount;
}

- (void)setTotalItemCount:(unint64_t)a3
{
  self->totalItemCount = a3;
}

- (double)duration
{
  return self->duration;
}

- (void)setDuration:(double)a3
{
  self->duration = a3;
}

- (double)cloningDuration
{
  return self->cloningDuration;
}

- (void)setCloningDuration:(double)a3
{
  self->cloningDuration = a3;
}

- (double)importDuration
{
  return self->importDuration;
}

- (void)setImportDuration:(double)a3
{
  self->importDuration = a3;
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 224, 1);
}

- (void)setUuid:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 224);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->uuid, 0);
}

@end
