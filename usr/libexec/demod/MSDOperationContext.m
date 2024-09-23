@implementation MSDOperationContext

+ (BOOL)downloadOnly
{
  return byte_100175310;
}

+ (void)setDownloadOnly:(BOOL)a3
{
  byte_100175310 = a3;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationContext uniqueName](self, "uniqueName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@[%p]: %@>"), v5, self, v6));

  return v7;
}

- (NSString)uniqueName
{
  NSString *uniqueName;
  objc_class *v4;
  NSString *v5;
  void *v6;
  void *v7;
  NSString *v8;
  NSString *v9;

  uniqueName = self->_uniqueName;
  if (!uniqueName)
  {
    v4 = (objc_class *)objc_opt_class(self, a2);
    v5 = NSStringFromClass(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationContext identifier](self, "identifier"));
    v8 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v6, v7));
    v9 = self->_uniqueName;
    self->_uniqueName = v8;

    uniqueName = self->_uniqueName;
  }
  return uniqueName;
}

- (NSString)stagingRootPath
{
  unsigned int v3;
  void *v4;
  __CFString *v5;
  NSString *v6;
  NSString *stagingRootPath;

  if (!self->_stagingRootPath)
  {
    v3 = +[MSDOperationContext downloadOnly](MSDOperationContext, "downloadOnly");
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationContext uniqueName](self, "uniqueName"));
    if (v3)
      v5 = CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/MSDWorkContainer/MSD_staging");
    else
      v5 = CFSTR("/var/MSDWorkContainer/MSD_staging");
    v6 = (NSString *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingPathComponent:](v5, "stringByAppendingPathComponent:", v4));
    stagingRootPath = self->_stagingRootPath;
    self->_stagingRootPath = v6;

  }
  return self->_stagingRootPath;
}

- (NSString)secondaryStagingRootPath
{
  return 0;
}

- (NSString)stashedStagingRootPath
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setIdentifier:", self->_identifier);
  objc_msgSend(v4, "setDiskSpacedRequired:", self->_diskSpacedRequired);
  objc_msgSend(v4, "setSkipped:", self->_skipped);
  objc_msgSend(v4, "setRestored:", self->_restored);
  return v4;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSNumber)diskSpacedRequired
{
  return self->_diskSpacedRequired;
}

- (void)setDiskSpacedRequired:(id)a3
{
  objc_storeStrong((id *)&self->_diskSpacedRequired, a3);
}

- (BOOL)skipped
{
  return self->_skipped;
}

- (void)setSkipped:(BOOL)a3
{
  self->_skipped = a3;
}

- (BOOL)restored
{
  return self->_restored;
}

- (void)setRestored:(BOOL)a3
{
  self->_restored = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diskSpacedRequired, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_stagingRootPath, 0);
  objc_storeStrong((id *)&self->_uniqueName, 0);
}

@end
