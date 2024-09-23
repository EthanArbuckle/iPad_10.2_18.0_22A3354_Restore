@implementation PSGBackupDisabledAppsInfo

- (NSArray)backupDisabledAppsForDisplay
{
  return self->_backupDisabledAppsForDisplay;
}

- (void)setBackupDisabledAppsForDisplay:(id)a3
{
  objc_storeStrong((id *)&self->_backupDisabledAppsForDisplay, a3);
}

- (BOOL)includePhoto
{
  return self->_includePhoto;
}

- (void)setIncludePhoto:(BOOL)a3
{
  self->_includePhoto = a3;
}

- (int64_t)backupDisabledAppCount
{
  return self->_backupDisabledAppCount;
}

- (void)setBackupDisabledAppCount:(int64_t)a3
{
  self->_backupDisabledAppCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backupDisabledAppsForDisplay, 0);
}

@end
