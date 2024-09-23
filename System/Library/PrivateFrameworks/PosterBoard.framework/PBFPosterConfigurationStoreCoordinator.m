@implementation PBFPosterConfigurationStoreCoordinator

+ (int64_t)type
{
  return 3;
}

+ (BOOL)shouldBeExcludedFromBackup
{
  return 0;
}

+ (BOOL)requiresDescriptorIdentifier
{
  return 0;
}

- (id)_accessQueue_buildIdentityForVersion:(unint64_t)a3 supplement:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[PBFPosterModelStoreCoordinator extensionIdentifier](self, "extensionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFPosterModelStoreCoordinator posterUUID](self, "posterUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFPosterModelStoreCoordinator descriptorIdentifier](self, "descriptorIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFPosterModelStoreCoordinator role](self, "role");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D7F8E0], "configurationIdentityWithProvider:identifier:role:posterUUID:version:supplement:", v7, v9, v10, v8, a3, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
