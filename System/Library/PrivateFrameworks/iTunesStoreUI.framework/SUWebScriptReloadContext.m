@implementation SUWebScriptReloadContext

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[SUWebScriptReloadContext URL](self, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setURL:", v5);

  -[SUWebScriptReloadContext referringUserAgent](self, "referringUserAgent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReferringUserAgent:", v6);

  -[SUWebScriptReloadContext referrerURL](self, "referrerURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReferrerURL:", v7);

  return v4;
}

- (id)_copyScriptDictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  SUScriptDictionary *v9;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[SUWebScriptReloadContext URL](self, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("url"));
  -[SUWebScriptReloadContext referringUserAgent](self, "referringUserAgent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("referringUserAgent"));
  -[SUWebScriptReloadContext referrerURL](self, "referrerURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "absoluteString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("referrerURL"));
  v9 = -[SUScriptDictionary initWithDictionary:]([SUScriptDictionary alloc], "initWithDictionary:", v3);

  return v9;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_storeStrong((id *)&self->_URL, a3);
}

- (NSString)referringUserAgent
{
  return self->_referringUserAgent;
}

- (void)setReferringUserAgent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSURL)referrerURL
{
  return self->_referrerURL;
}

- (void)setReferrerURL:(id)a3
{
  objc_storeStrong((id *)&self->_referrerURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referrerURL, 0);
  objc_storeStrong((id *)&self->_referringUserAgent, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end
