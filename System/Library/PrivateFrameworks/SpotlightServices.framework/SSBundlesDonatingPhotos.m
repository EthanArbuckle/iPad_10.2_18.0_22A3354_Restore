@implementation SSBundlesDonatingPhotos

void __SSBundlesDonatingPhotos_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[8];

  v2[7] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("com.apple.mobileslideshow");
  v2[1] = CFSTR("com.apple.mobilenotes");
  v2[2] = CFSTR("com.apple.MobileSMS");
  v2[3] = CFSTR("com.apple.CloudDocs.MobileDocumentsFileProvider");
  v2[4] = CFSTR("com.apple.FileProvider.LocalStorage");
  v2[5] = CFSTR("com.apple.CloudDocs.iCloudDriveFileProvider");
  v2[6] = CFSTR("com.apple.CloudDocs.iCloudDriveFileProviderManaged");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 7);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)SSBundlesDonatingPhotos_bundlesDonatingPhotos;
  SSBundlesDonatingPhotos_bundlesDonatingPhotos = v0;

}

@end
