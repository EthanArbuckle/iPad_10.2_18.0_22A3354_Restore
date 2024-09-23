@implementation DCIMDirectoryUtilities

+ (id)photoDCIMDirectory
{
  return +[PLFileUtilities defaultSystemPhotoDCIMDirectory](PLFileUtilities, "defaultSystemPhotoDCIMDirectory");
}

+ (id)photoDataMiscDirectory
{
  return +[PLFileUtilities defaultSystemPhotoDataMiscDirectory](PLFileUtilities, "defaultSystemPhotoDataMiscDirectory");
}

+ (id)photoDataDirectory
{
  return +[PLFileUtilities defaultSystemPhotoDataDirectory](PLFileUtilities, "defaultSystemPhotoDataDirectory");
}

+ (id)nebuladkeepalivepath
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "photoDCIMDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR(".MISC"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("nebuladkeepalive"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)takingPhotoIndicatorFilePath
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "photoDataDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("takingphoto"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)takingVideoIndicatorFilePath
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "photoDataDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("takingvideo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
