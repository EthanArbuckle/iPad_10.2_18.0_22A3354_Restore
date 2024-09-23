@implementation PLCloudPhotoLibraryError

+ (id)userMessageForErrorType:(int64_t)a3
{
  PLServicesLocalizedFrameworkStringForAssetsd();
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)createErrorWithType:(int64_t)a3
{
  return +[PLCloudPhotoLibraryError createErrorWithType:withDebugMessage:](PLCloudPhotoLibraryError, "createErrorWithType:withDebugMessage:", a3, 0);
}

+ (id)createErrorWithType:(int64_t)a3 withDebugMessage:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  +[PLCloudPhotoLibraryError userMessageForErrorType:](PLCloudPhotoLibraryError, "userMessageForErrorType:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forKey:", v6, *MEMORY[0x1E0CB2D50]);
  if (v5)
    objc_msgSend(v7, "setValue:forKey:", v5, *MEMORY[0x1E0CB2938]);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PLCloudPhotoLibraryErrorDomain"), a3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
