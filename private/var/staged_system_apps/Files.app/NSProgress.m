@implementation NSProgress

- (BOOL)isDownloadingOperation
{
  return sub_100371F98(self, (uint64_t)a2, (void **)&NSProgressFileOperationKindDownloading);
}

- (BOOL)isUploadingOperation
{
  return sub_100371F98(self, (uint64_t)a2, (void **)&NSProgressFileOperationKindUploading);
}

@end
