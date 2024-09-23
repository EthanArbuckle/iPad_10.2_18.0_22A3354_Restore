@implementation _PBFPosterRoleProcessorTransactionResult

- (NSDictionary)collectionDiffsPerRole
{
  return self->_collectionDiffsPerRole;
}

- (void)setCollectionDiffsPerRole:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSSet)affectedRoles
{
  return self->_affectedRoles;
}

- (void)setAffectedRoles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDictionary)preCommitActivePosterConfigurationForRole
{
  return self->_preCommitActivePosterConfigurationForRole;
}

- (void)setPreCommitActivePosterConfigurationForRole:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDictionary)postCommitActivePosterConfigurationForRole
{
  return self->_postCommitActivePosterConfigurationForRole;
}

- (void)setPostCommitActivePosterConfigurationForRole:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)emittedEvents
{
  return self->_emittedEvents;
}

- (void)setEmittedEvents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emittedEvents, 0);
  objc_storeStrong((id *)&self->_postCommitActivePosterConfigurationForRole, 0);
  objc_storeStrong((id *)&self->_preCommitActivePosterConfigurationForRole, 0);
  objc_storeStrong((id *)&self->_affectedRoles, 0);
  objc_storeStrong((id *)&self->_collectionDiffsPerRole, 0);
}

@end
