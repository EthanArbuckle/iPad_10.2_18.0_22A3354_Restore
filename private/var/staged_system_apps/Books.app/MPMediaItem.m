@implementation MPMediaItem

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItem valueForProperty:](self, "valueForProperty:", MPMediaItemPropertyStoreID));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItem valueForProperty:](self, "valueForProperty:", MPMediaItemPropertyStorePlaylistID));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItem valueForProperty:](self, "valueForProperty:", MPMediaItemPropertyStoreRedownloadParameters));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItem title](self, "title"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItem albumTitle](self, "albumTitle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItem artist](self, "artist"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItem albumArtist](self, "albumArtist"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@(%p) storeItemAdamID:%@ storePlaylistAdamID:%@ params:%@ title:'%@' albumTitle:'%@' artist:'%@' albumArtist:'%@'>"), v5, self, v6, v7, v8, v9, v10, v11, v12));

  return v13;
}

@end
