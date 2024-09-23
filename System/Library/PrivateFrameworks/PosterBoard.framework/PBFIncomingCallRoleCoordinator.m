@implementation PBFIncomingCallRoleCoordinator

- (PBFIncomingCallRoleCoordinator)initWithStorage:(id)a3 modelCoordinatorProvider:(id)a4 providers:(id)a5
{
  uint64_t v8;
  objc_super v10;

  v8 = *MEMORY[0x1E0D7FC50];
  v10.receiver = self;
  v10.super_class = (Class)PBFIncomingCallRoleCoordinator;
  return -[PBFPosterRoleCoordinator initWithRole:storage:modelCoordinatorProvider:providers:](&v10, sel_initWithRole_storage_modelCoordinatorProvider_providers_, v8, a3, a4, a5);
}

@end
