@implementation PLModelMigrationAction_ResetExternalAssetsFromCamera

+ (id)predicateForFetchingAssetsToReset
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("additionalAttributes.importedByBundleIdentifier"), CFSTR("com.apple.camera"));
}

@end
