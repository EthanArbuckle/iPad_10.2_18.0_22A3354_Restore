@implementation MSDContentFilesContext

+ (void)initialize
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;

  v3 = objc_opt_self(MSDContentFilesContext, a2);
  v4 = (id)objc_claimAutoreleasedReturnValue(v3);

  if (v4 == a1)
  {
    v5 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v6 = (void *)qword_1001753E8;
    qword_1001753E8 = v5;

  }
}

+ (NSMutableSet)processedContainers
{
  return (NSMutableSet *)(id)qword_1001753E8;
}

+ (id)defaultContextForBackupItem:(id)a3
{
  id v3;
  MSDContentFilesContext *v4;

  v3 = a3;
  v4 = objc_alloc_init(MSDContentFilesContext);
  -[MSDOperationContext setIdentifier:](v4, "setIdentifier:", v3);

  -[MSDContentFilesContext setContentRootPath:](v4, "setContentRootPath:", CFSTR("/"));
  -[MSDContentFilesContext setContainerType:](v4, "setContainerType:", CFSTR("BackupData"));
  -[MSDContentFilesContext setContainerized:](v4, "setContainerized:", 0);
  return v4;
}

+ (id)defaultContextForContainerizedAppDataItem:(id)a3
{
  id v3;
  MSDContentFilesContext *v4;

  v3 = a3;
  v4 = objc_alloc_init(MSDContentFilesContext);
  -[MSDOperationContext setIdentifier:](v4, "setIdentifier:", v3);

  -[MSDContentFilesContext setContentRootPath:](v4, "setContentRootPath:", 0);
  -[MSDContentFilesContext setContainerized:](v4, "setContainerized:", 1);
  -[MSDContentFilesContext setContentBeingInstalled:](v4, "setContentBeingInstalled:", 0x7FFFFFFFFFFFFFFFLL, 0);
  return v4;
}

+ (id)defaultContextForNonContainerizedAppDataItem:(id)a3
{
  id v3;
  MSDContentFilesContext *v4;

  v3 = a3;
  v4 = objc_alloc_init(MSDContentFilesContext);
  -[MSDOperationContext setIdentifier:](v4, "setIdentifier:", v3);

  -[MSDContentFilesContext setContentRootPath:](v4, "setContentRootPath:", CFSTR("/"));
  -[MSDContentFilesContext setContainerized:](v4, "setContainerized:", 0);
  -[MSDContentFilesContext setContentBeingInstalled:](v4, "setContentBeingInstalled:", 0x7FFFFFFFFFFFFFFFLL, 0);
  return v4;
}

- (id)uniqueName
{
  NSString *uniqueName;
  void *v4;
  void *v5;
  NSString *v6;
  NSString *v7;

  uniqueName = self->_uniqueName;
  if (!uniqueName)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentFilesContext containerType](self, "containerType"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationContext identifier](self, "identifier"));
    v6 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v4, v5));
    v7 = self->_uniqueName;
    self->_uniqueName = v6;

    uniqueName = self->_uniqueName;
  }
  return uniqueName;
}

- (id)secondaryStagingRootPath
{
  void *v3;
  __CFString *v4;
  NSString *v5;
  NSString *secondaryStagingRootPath;

  if (!self->_secondaryStagingRootPath)
  {
    if (+[MSDOperationContext downloadOnly](MSDOperationContext, "downloadOnly"))
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentFilesContext uniqueName](self, "uniqueName"));
      v4 = CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/MSDWorkContainer/MSD_secondary_staging");
    }
    else
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentFilesContext appIdentifier](self, "appIdentifier"));
      v4 = CFSTR("/var/MSDWorkContainer/MSD_secondary_staging");
    }
    v5 = (NSString *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingPathComponent:](v4, "stringByAppendingPathComponent:", v3));
    secondaryStagingRootPath = self->_secondaryStagingRootPath;
    self->_secondaryStagingRootPath = v5;

  }
  return self->_secondaryStagingRootPath;
}

- (id)stashedStagingRootPath
{
  NSString *stashedStagingRootPath;
  void *v4;
  NSString *v5;
  NSString *v6;

  stashedStagingRootPath = self->_stashedStagingRootPath;
  if (!stashedStagingRootPath)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentFilesContext uniqueName](self, "uniqueName"));
    v5 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/MSDWorkContainer/MSD_stashed_staging"), "stringByAppendingPathComponent:", v4));
    v6 = self->_stashedStagingRootPath;
    self->_stashedStagingRootPath = v5;

    stashedStagingRootPath = self->_stashedStagingRootPath;
  }
  return stashedStagingRootPath;
}

- (NSString)appIdentifier
{
  return self->_appIdentifier;
}

- (void)setAppIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_appIdentifier, a3);
}

- (MSDManifest)masterManifest
{
  return self->_masterManifest;
}

- (void)setMasterManifest:(id)a3
{
  objc_storeStrong((id *)&self->_masterManifest, a3);
}

- (MSDManifest)deviceManifest
{
  return self->_deviceManifest;
}

- (void)setDeviceManifest:(id)a3
{
  objc_storeStrong((id *)&self->_deviceManifest, a3);
}

- (NSString)originServer
{
  return self->_originServer;
}

- (void)setOriginServer:(id)a3
{
  objc_storeStrong((id *)&self->_originServer, a3);
}

- (NSString)rootFileSystemPath
{
  return self->_rootFileSystemPath;
}

- (void)setRootFileSystemPath:(id)a3
{
  objc_storeStrong((id *)&self->_rootFileSystemPath, a3);
}

- (NSString)contentRootPath
{
  return self->_contentRootPath;
}

- (void)setContentRootPath:(id)a3
{
  objc_storeStrong((id *)&self->_contentRootPath, a3);
}

- (NSString)pseudoContentRootPath
{
  return self->_pseudoContentRootPath;
}

- (void)setPseudoContentRootPath:(id)a3
{
  objc_storeStrong((id *)&self->_pseudoContentRootPath, a3);
}

- (NSString)containerType
{
  return self->_containerType;
}

- (void)setContainerType:(id)a3
{
  objc_storeStrong((id *)&self->_containerType, a3);
}

- (BOOL)containerized
{
  return self->_containerized;
}

- (void)setContainerized:(BOOL)a3
{
  self->_containerized = a3;
}

- (NSMutableArray)alreadyHaveList
{
  return self->_alreadyHaveList;
}

- (void)setAlreadyHaveList:(id)a3
{
  objc_storeStrong((id *)&self->_alreadyHaveList, a3);
}

- (NSMutableArray)cloneFailedList
{
  return self->_cloneFailedList;
}

- (void)setCloneFailedList:(id)a3
{
  objc_storeStrong((id *)&self->_cloneFailedList, a3);
}

- (NSMutableArray)creationList
{
  return self->_creationList;
}

- (void)setCreationList:(id)a3
{
  objc_storeStrong((id *)&self->_creationList, a3);
}

- (BOOL)verifyFileHash
{
  return self->_verifyFileHash;
}

- (void)setVerifyFileHash:(BOOL)a3
{
  self->_verifyFileHash = a3;
}

- (_NSRange)contentBeingInstalled
{
  _NSRange *p_contentBeingInstalled;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_contentBeingInstalled = &self->_contentBeingInstalled;
  location = self->_contentBeingInstalled.location;
  length = p_contentBeingInstalled->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setContentBeingInstalled:(_NSRange)a3
{
  self->_contentBeingInstalled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationList, 0);
  objc_storeStrong((id *)&self->_cloneFailedList, 0);
  objc_storeStrong((id *)&self->_alreadyHaveList, 0);
  objc_storeStrong((id *)&self->_containerType, 0);
  objc_storeStrong((id *)&self->_pseudoContentRootPath, 0);
  objc_storeStrong((id *)&self->_contentRootPath, 0);
  objc_storeStrong((id *)&self->_rootFileSystemPath, 0);
  objc_storeStrong((id *)&self->_originServer, 0);
  objc_storeStrong((id *)&self->_deviceManifest, 0);
  objc_storeStrong((id *)&self->_masterManifest, 0);
  objc_storeStrong((id *)&self->_appIdentifier, 0);
  objc_storeStrong((id *)&self->_stashedStagingRootPath, 0);
  objc_storeStrong((id *)&self->_secondaryStagingRootPath, 0);
  objc_storeStrong((id *)&self->_uniqueName, 0);
}

@end
