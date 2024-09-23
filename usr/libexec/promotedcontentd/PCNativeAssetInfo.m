@implementation PCNativeAssetInfo

- (id)initWithAssetInfo:(id)a3
{
  id v4;
  PCNativeAssetInfo *v5;
  PCNativeAssetInfo *v6;
  void *v7;
  void *v8;
  float v9;

  v4 = a3;
  v5 = -[PCNativeAssetInfo init](self, "init");
  v6 = v5;
  if (v4 && v5)
  {
    -[PCNativeAssetInfo setContentType:](v5, "setContentType:", (int)objc_msgSend(v4, "contentType"));
    -[PCNativeAssetInfo setWidth:](v6, "setWidth:", (int)objc_msgSend(v4, "width"));
    -[PCNativeAssetInfo setHeight:](v6, "setHeight:", (int)objc_msgSend(v4, "height"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "url"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v7));
    -[PCNativeAssetInfo setUrl:](v6, "setUrl:", v8);

    objc_msgSend(v4, "length");
    -[PCNativeAssetInfo setLength:](v6, "setLength:", (uint64_t)v9);
    objc_msgSend(v4, "bitrate");
    -[PCNativeAssetInfo setBitrate:](v6, "setBitrate:");
    -[PCNativeAssetInfo setAutoloop:](v6, "setAutoloop:", objc_msgSend(v4, "autoloop"));
  }

  return v6;
}

@end
