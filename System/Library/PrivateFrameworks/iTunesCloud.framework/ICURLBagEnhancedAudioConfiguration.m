@implementation ICURLBagEnhancedAudioConfiguration

- (ICURLBagEnhancedAudioConfiguration)initWithBagEnhancedAudioDictionary:(id)a3
{
  id v5;
  ICURLBagEnhancedAudioConfiguration *v6;
  ICURLBagEnhancedAudioConfiguration *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICURLBagEnhancedAudioConfiguration;
  v6 = -[ICURLBagEnhancedAudioConfiguration init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_bagEnhancedAudioDictionary, a3);

  return v7;
}

- (NSURL)certificateURL
{
  return (NSURL *)-[ICURLBagEnhancedAudioConfiguration _urlForBagEnhancedAudioKey:](self, "_urlForBagEnhancedAudioKey:", CFSTR("hls-cert"));
}

- (NSURL)keyServerURL
{
  return (NSURL *)-[ICURLBagEnhancedAudioConfiguration _urlForBagEnhancedAudioKey:](self, "_urlForBagEnhancedAudioKey:", CFSTR("hls-key-server-url"));
}

- (NSArray)prefetchSKDs
{
  void *v2;
  id v3;

  -[NSDictionary objectForKey:](self->_bagEnhancedAudioDictionary, "objectForKey:", CFSTR("hls-prefetch-skd-urls"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSArray())
    v3 = v2;
  else
    v3 = 0;

  return (NSArray *)v3;
}

- (id)_urlForBagEnhancedAudioKey:(id)a3
{
  void *v3;
  void *v4;

  -[NSDictionary objectForKey:](self->_bagEnhancedAudioDictionary, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (NSDictionary)bagEnhancedAudioDictionary
{
  return self->_bagEnhancedAudioDictionary;
}

- (void)setBagEnhancedAudioDictionary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bagEnhancedAudioDictionary, 0);
}

@end
