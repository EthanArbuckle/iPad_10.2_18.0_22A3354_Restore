@implementation WLKContinuationMetadata

- (id)tvun_channelImageURLString:(BOOL *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WLKContinuationMetadata playable](self, "playable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "channelDetails"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "images"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "artworkVariantOfType:", 10));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "images"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "artworkVariantOfType:", 18));

  if (objc_msgSend(v5, "isApSubscription") && v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "artworkURLString"));
    if (a3)
    {
      v11 = 1;
LABEL_8:
      *a3 = v11;
    }
  }
  else
  {
    if (!v7)
    {
      v10 = 0;
      goto LABEL_10;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "artworkURLString"));
    if (a3)
    {
      v11 = 0;
      goto LABEL_8;
    }
  }
LABEL_10:

  return v10;
}

- (id)tvun_punchoutURL
{
  return -[WLKContinuationMetadata tvun_punchoutURL:](self, "tvun_punchoutURL:", 1);
}

- (id)tvun_punchoutURL:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WLKContinuationMetadata playable](self, "playable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "playPunchoutURL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[WLKContinuationMetadata playable](self, "playable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "channelDetails"));

  if ((objc_msgSend(v5, "isiTunes") & 1) != 0)
    v9 = 0;
  else
    v9 = objc_msgSend(v8, "isApSubscription") ^ 1;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "tvAppDeeplinkURL"));
  v11 = v10;
  if (!v10 || (v9 & 1) != 0)
  {

  }
  else
  {
    v12 = objc_msgSend(v5, "isEntitled");

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "tvAppDeeplinkURL"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[WLKPlayableUtilities _punchoutURLForDirectPlayback:ignoreExtras:](WLKPlayableUtilities, "_punchoutURLForDirectPlayback:ignoreExtras:", v13, 1));

      goto LABEL_16;
    }
  }
  if (v3
    && objc_msgSend(v5, "isEntitled")
    && objc_msgSend(v5, "isAppInstalled")
    && objc_msgSend(v6, "length"))
  {
    v15 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v6));
  }
  else
  {
    v15 = objc_claimAutoreleasedReturnValue(-[WLKContinuationMetadata contentTVAppDeeplinkURL](self, "contentTVAppDeeplinkURL"));
  }
  v14 = (void *)v15;
LABEL_16:

  return v14;
}

@end
