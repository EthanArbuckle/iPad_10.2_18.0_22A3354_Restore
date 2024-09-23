@implementation ICURLBagRadioConfiguration

- (BOOL)isContinueListeningAvailable
{
  void *v2;
  BOOL v3;

  -[NSDictionary objectForKeyedSubscript:](self->_bagRadioDictionary, "objectForKeyedSubscript:", CFSTR("continue-listening"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (ICURLBagRadioConfiguration)initWithBagRadioDictionary:(id)a3
{
  id v5;
  ICURLBagRadioConfiguration *v6;
  ICURLBagRadioConfiguration *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICURLBagRadioConfiguration;
  v6 = -[ICURLBagRadioConfiguration init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_bagRadioDictionary, a3);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bagRadioDictionary, 0);
}

- (NSURL)baseURL
{
  return (NSURL *)-[ICURLBagRadioConfiguration urlForBagRadioKey:](self, "urlForBagRadioKey:", CFSTR("base-url"));
}

- (int64_t)getTracksDPInfoKBSyncCount
{
  void *v2;
  int64_t v3;

  -[NSDictionary objectForKey:](self->_bagRadioDictionary, "objectForKey:", CFSTR("num-kbsyncs-to-include-for-getTracks"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "integerValue");
  else
    v3 = 1;

  return v3;
}

- (int64_t)maxSupportedProtocolVersion
{
  void *v2;
  uint64_t v3;
  int64_t v4;

  -[NSDictionary objectForKey:](self->_bagRadioDictionary, "objectForKey:", CFSTR("max-protocol-version"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = objc_msgSend(v2, "integerValue");
    if (v3 >= 8)
      v4 = 8;
    else
      v4 = v3;
  }
  else
  {
    v4 = 5;
  }

  return v4;
}

- (int64_t)continueListeningMaxQueueSizeInRequest
{
  void *v2;
  void *v3;
  int64_t v4;

  -[NSDictionary objectForKeyedSubscript:](self->_bagRadioDictionary, "objectForKeyedSubscript:", CFSTR("continue-listening"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("max-queue-size-in-request"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (int64_t)continueListeningMaxUpcomingTracksSizeToMaintain
{
  void *v2;
  void *v3;
  int64_t v4;

  -[NSDictionary objectForKeyedSubscript:](self->_bagRadioDictionary, "objectForKeyedSubscript:", CFSTR("continue-listening"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("max-upcoming-tracks-to-maintain"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (int64_t)continueListeningLoadStationThreshold
{
  void *v2;
  void *v3;
  int64_t v4;

  -[NSDictionary objectForKeyedSubscript:](self->_bagRadioDictionary, "objectForKeyedSubscript:", CFSTR("continue-listening"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("max-queue-size-for-autoplay"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (BOOL)shouldIncludeHTTPHeaderField:(id)a3 forRequestURL:(id)a4
{
  id v6;
  id v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("X-Guid")) & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    objc_msgSend(v7, "lastPathComponent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](self->_bagRadioDictionary, "objectForKey:", CFSTR("header-actions"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSDictionary())
    {
      objc_msgSend(v10, "objectForKey:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (_NSIsNSArray())
        v8 = objc_msgSend(v11, "containsObject:", v9);
      else
        v8 = 0;

    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (id)urlForBagRadioKey:(id)a3
{
  void *v3;
  void *v4;

  -[NSDictionary objectForKey:](self->_bagRadioDictionary, "objectForKey:", a3);
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

@end
