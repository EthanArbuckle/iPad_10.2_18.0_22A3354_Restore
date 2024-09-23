@implementation OSASafeCreateDirectoryOptions

- (BOOL)createIntermediates
{
  return self->_createIntermediates;
}

- (void)setCreateIntermediates:(BOOL)a3
{
  self->_createIntermediates = a3;
}

- (NSNumber)userID
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void)setUserID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSNumber)groupID
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)setGroupID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (BOOL)fileProtectionNone
{
  return self->_fileProtectionNone;
}

- (void)setFileProtectionNone:(BOOL)a3
{
  self->_fileProtectionNone = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_userID, 0);
}

@end
