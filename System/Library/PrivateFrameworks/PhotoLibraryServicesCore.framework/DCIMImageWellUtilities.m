@implementation DCIMImageWellUtilities

+ (id)cameraPreviewWellImage
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "cameraPreviewWellImageFileURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  DCIM_newPLImageWithContentsOfFile(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)cameraPreviewWellImageFileURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  +[DCIMDirectoryUtilities photoDataMiscDirectory](DCIMDirectoryUtilities, "photoDataMiscDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("PreviewWellImage.jpg"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileURLWithPath:isDirectory:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
