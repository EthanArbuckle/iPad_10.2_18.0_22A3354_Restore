@implementation ICStoreRadioStreamAssetInfo

- (ICStoreRadioStreamAssetInfo)initWithItemResponseDictionary:(id)a3
{
  id v4;
  ICStoreRadioStreamAssetInfo *v5;
  uint64_t v6;
  NSDictionary *itemResponseDictionary;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICStoreRadioStreamAssetInfo;
  v5 = -[ICStoreRadioStreamAssetInfo init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    itemResponseDictionary = v5->_itemResponseDictionary;
    v5->_itemResponseDictionary = (NSDictionary *)v6;

  }
  return v5;
}

- (int64_t)flavor
{
  void *v3;
  int64_t v4;

  -[NSDictionary objectForKey:](self->_itemResponseDictionary, "objectForKey:", CFSTR("flavor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString() && objc_msgSend(v3, "length"))
    v4 = -[ICStoreRadioStreamAssetInfo ICStoreRadioStreamFlavorWithString:](self, "ICStoreRadioStreamFlavorWithString:", v3);
  else
    v4 = 0;

  return v4;
}

- (int64_t)streamProtocol
{
  void *v3;
  int64_t v4;

  -[NSDictionary objectForKey:](self->_itemResponseDictionary, "objectForKey:", CFSTR("stream-protocol"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString() && objc_msgSend(v3, "length"))
    v4 = -[ICStoreRadioStreamAssetInfo ICStoreRadioStreamProtocolWithString:](self, "ICStoreRadioStreamProtocolWithString:", v3);
  else
    v4 = 0;

  return v4;
}

- (NSURL)streamURL
{
  void *v2;
  void *v3;

  -[NSDictionary objectForKey:](self->_itemResponseDictionary, "objectForKey:", CFSTR("stream-url"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString() && objc_msgSend(v2, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSURL *)v3;
}

- (NSURL)keyCertificateURL
{
  void *v2;
  void *v3;

  -[NSDictionary objectForKey:](self->_itemResponseDictionary, "objectForKey:", CFSTR("stream-key-cert-url"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString() && objc_msgSend(v2, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSURL *)v3;
}

- (NSURL)keyServerURL
{
  void *v2;
  void *v3;

  -[NSDictionary objectForKey:](self->_itemResponseDictionary, "objectForKey:", CFSTR("stream-key-server-url"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString() && objc_msgSend(v2, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSURL *)v3;
}

- (BOOL)isiTunesStoreStream
{
  void *v2;
  char v3;

  -[NSDictionary objectForKey:](self->_itemResponseDictionary, "objectForKey:", CFSTR("is-itunes-stream"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (int64_t)ICStoreRadioStreamFlavorWithString:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if (objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("LWHQ")))
    v4 = objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("SLW")) == 0;
  else
    v4 = 2;

  return v4;
}

- (int64_t)ICStoreRadioStreamProtocolWithString:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if (objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("HLS")))
    v4 = 2 * (objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("SHOUTCAST")) == 0);
  else
    v4 = 1;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemResponseDictionary, 0);
}

@end
