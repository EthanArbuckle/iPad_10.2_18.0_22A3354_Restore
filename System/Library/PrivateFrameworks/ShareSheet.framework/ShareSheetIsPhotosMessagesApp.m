@implementation ShareSheetIsPhotosMessagesApp

void ___ShareSheetIsPhotosMessagesApp_block_invoke()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "processName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v0) = objc_msgSend(v1, "isEqualToString:", CFSTR("PhotosMessagesApp"));
  _ShareSheetIsPhotosMessagesApp_isPhotos = (char)v0;
}

@end
