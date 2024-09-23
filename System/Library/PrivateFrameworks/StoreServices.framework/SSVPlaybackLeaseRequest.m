@implementation SSVPlaybackLeaseRequest

- (void)setHTTPHeaderFields:(id)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *httpHeaderFields;

  if (self->_httpHeaderFields != a3)
  {
    v4 = (NSMutableDictionary *)objc_msgSend(a3, "mutableCopy");
    httpHeaderFields = self->_httpHeaderFields;
    self->_httpHeaderFields = v4;

  }
}

- (void)setParameterValues:(id)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *parameters;

  if (self->_parameters != a3)
  {
    v4 = (NSMutableDictionary *)objc_msgSend(a3, "mutableCopy");
    parameters = self->_parameters;
    self->_parameters = v4;

  }
}

- (void)setValue:(id)a3 forHTTPHeaderField:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSMutableDictionary *httpHeaderFields;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  v7 = v12;
  v8 = v6;
  httpHeaderFields = self->_httpHeaderFields;
  if (v12)
  {
    if (!httpHeaderFields)
    {
      v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v11 = self->_httpHeaderFields;
      self->_httpHeaderFields = v10;

      v7 = v12;
      httpHeaderFields = self->_httpHeaderFields;
    }
    -[NSMutableDictionary setObject:forKey:](httpHeaderFields, "setObject:forKey:", v7, v8);
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](httpHeaderFields, "removeObjectForKey:", v8);
  }

}

- (void)setValue:(id)a3 forParameter:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSMutableDictionary *parameters;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  v7 = v12;
  v8 = v6;
  parameters = self->_parameters;
  if (v12)
  {
    if (!parameters)
    {
      v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v11 = self->_parameters;
      self->_parameters = v10;

      v7 = v12;
      parameters = self->_parameters;
    }
    -[NSMutableDictionary setObject:forKey:](parameters, "setObject:forKey:", v7, v8);
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](parameters, "removeObjectForKey:", v8);
  }

}

- (id)valueForHTTPHeaderField:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_httpHeaderFields, "objectForKey:", a3);
}

- (id)valueForParameter:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_parameters, "objectForKey:", a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v4[7] = self->_leaseType;
  -[SSVPlaybackLeaseRequest _applyValuesToCopy:](self, "_applyValuesToCopy:", v4);
  return v4;
}

+ (id)_requestWithType:(int64_t)a3
{
  __objc2_class **v4;
  _QWORD *v5;

  if (a3 == 1)
  {
    v4 = off_1E47B6FA0;
  }
  else
  {
    if (a3)
    {
      v5 = 0;
      goto LABEL_7;
    }
    v4 = off_1E47B6FC8;
  }
  v5 = objc_alloc_init(*v4);
LABEL_7:
  v5[7] = a3;
  return v5;
}

- (id)_copyWithLeaseType:(int64_t)a3
{
  void *v4;

  objc_msgSend((id)objc_opt_class(), "_requestWithType:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSVPlaybackLeaseRequest _applyValuesToCopy:](self, "_applyValuesToCopy:", v4);
  return v4;
}

- (NSString)_actionParameterValue
{
  return 0;
}

- (id)_copyBodyDictionaryWithFairPlaySession:(void *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[SSVPlaybackLeaseRequest _actionParameterValue](self, "_actionParameterValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("action"));
  +[SSDevice currentDevice](SSDevice, "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uniqueDeviceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("guid"));
  if (self->_parameters)
    objc_msgSend(v4, "addEntriesFromDictionary:");

  return v4;
}

- (NSString)_URLBagKey
{
  return 0;
}

- (void)_applyValuesToCopy:(id)a3
{
  unint64_t kdChannelIdentifier;
  id v5;

  kdChannelIdentifier = self->_kdChannelIdentifier;
  v5 = a3;
  objc_msgSend(v5, "setKDChannelIdentifier:", kdChannelIdentifier);
  objc_msgSend(v5, "_setKDMovieIdentifier:", self->_kdMovieIdentifier);
  objc_msgSend(v5, "setParameterValues:", self->_parameters);
  objc_msgSend(v5, "setStartsLeaseSession:", self->_startsLeaseSession);
  objc_msgSend(v5, "setHTTPHeaderFields:", self->_httpHeaderFields);
  objc_msgSend(v5, "_setActionType:", self->_actionType);
  objc_msgSend(v5, "_setCertificateData:", self->_certificateData);
  objc_msgSend(v5, "_setURL:", self->_url);

}

- (unint64_t)KDChannelIdentifier
{
  return self->_kdChannelIdentifier;
}

- (void)setKDChannelIdentifier:(unint64_t)a3
{
  self->_kdChannelIdentifier = a3;
}

- (NSDictionary)parameterValues
{
  return &self->_parameters->super;
}

- (NSDictionary)HTTPHeaderFields
{
  return &self->_httpHeaderFields->super;
}

- (BOOL)startsLeaseSession
{
  return self->_startsLeaseSession;
}

- (void)setStartsLeaseSession:(BOOL)a3
{
  self->_startsLeaseSession = a3;
}

- (int64_t)_actionType
{
  return self->_actionType;
}

- (void)_setActionType:(int64_t)a3
{
  self->_actionType = a3;
}

- (NSData)_certificateData
{
  return self->_certificateData;
}

- (void)_setCertificateData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)_leaseType
{
  return self->_leaseType;
}

- (unint64_t)_KDMovieIdentifier
{
  return self->_kdMovieIdentifier;
}

- (void)_setKDMovieIdentifier:(unint64_t)a3
{
  self->_kdMovieIdentifier = a3;
}

- (NSURL)_URL
{
  return self->_url;
}

- (void)_setURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_httpHeaderFields, 0);
  objc_storeStrong((id *)&self->_certificateURL, 0);
  objc_storeStrong((id *)&self->_certificateData, 0);
}

@end
