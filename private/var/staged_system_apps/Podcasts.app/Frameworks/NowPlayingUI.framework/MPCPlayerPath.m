@implementation MPCPlayerPath

- (BOOL)isSystemPodcastsPath
{
  void *v3;
  uint64_t Client;
  void *v5;
  uint64_t v6;
  unsigned __int8 v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MPCPlayerPath bundleID](self, "bundleID"));
  if (-[MPCPlayerPath mediaRemotePlayerPath](self, "mediaRemotePlayerPath"))
  {
    Client = MRNowPlayingPlayerPathGetClient(-[MPCPlayerPath mediaRemotePlayerPath](self, "mediaRemotePlayerPath"));
    v5 = (void *)MRNowPlayingClientCopyBundleIdentifierHierarchy(Client);
    if (objc_msgSend(v5, "count"))
    {
      v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastObject"));

      v3 = (void *)v6;
    }

  }
  v7 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.podcasts"));

  return v7;
}

@end
