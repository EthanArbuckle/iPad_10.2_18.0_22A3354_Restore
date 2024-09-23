@implementation FMSongAsset(PhotosGraph)

- (uint64_t)pg_requestDownloadIfNeeded
{
  uint64_t result;

  if (!objc_msgSend(a1, "localURLExists"))
    return objc_msgSend(a1, "requestDownload");
  result = objc_msgSend(a1, "contentUpdateAvailable");
  if ((_DWORD)result)
    return objc_msgSend(a1, "requestDownload");
  return result;
}

@end
