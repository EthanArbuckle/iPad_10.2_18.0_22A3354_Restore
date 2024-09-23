@implementation WFPossibleMobileDocumentsFileProviderDomainIDs

void __WFPossibleMobileDocumentsFileProviderDomainIDs_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[5];

  v4[4] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("com.apple.CloudDocs.MobileDocumentsFileProvider");
  v4[1] = CFSTR("com.apple.CloudDocs.MobileDocumentsFileProviderManaged");
  v4[2] = CFSTR("com.apple.CloudDocs.iCloudDriveFileProvider");
  v4[3] = CFSTR("com.apple.CloudDocs.iCloudDriveFileProviderManaged");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)WFPossibleMobileDocumentsFileProviderDomainIDs_possibleDomainIDs;
  WFPossibleMobileDocumentsFileProviderDomainIDs_possibleDomainIDs = v2;

}

@end
