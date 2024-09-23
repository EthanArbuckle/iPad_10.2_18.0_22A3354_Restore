@implementation BLDownloadStatus

- (id)bk_assetIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BLDownloadStatus storeID](self, "storeID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringValue"));

  if (!objc_msgSend(v4, "length"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BLDownloadStatus permLink](self, "permLink"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v5));

    if (v6)
      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifierFromPermlink"));
    else
      v7 = 0;

    v4 = (void *)v7;
  }
  return v4;
}

@end
