@implementation NSURL

- (BOOL)bk_isStreamingAssetURL
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL pathExtension](self, "pathExtension"));
  v3 = objc_msgSend(v2, "bk_isPlaylistExtension");

  return v3;
}

@end
