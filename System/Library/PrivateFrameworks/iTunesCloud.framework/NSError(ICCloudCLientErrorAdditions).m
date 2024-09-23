@implementation NSError(ICCloudCLientErrorAdditions)

+ (uint64_t)ic_cloudClientErrorWithCode:()ICCloudCLientErrorAdditions userInfo:
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICCloudClientErrorDomain"), a3, a4);
}

+ (uint64_t)ic_cloudClientLibraryUploadErrorWithCode:()ICCloudCLientErrorAdditions userInfo:
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICCloudClientLibraryUploadErrorDomain"), a3, a4);
}

@end
