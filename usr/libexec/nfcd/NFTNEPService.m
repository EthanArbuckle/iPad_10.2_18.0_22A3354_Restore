@implementation NFTNEPService

+ (id)serviceWithURI:(id)a3 minWaitTime:(unsigned __int8)a4 maxWaitTimeExtension:(unsigned __int8)a5 maxMessageSize:(unsigned __int16)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  NFTNEPService *v10;
  NFTNEPService *v11;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_opt_new(NFTNEPService);
  v11 = v10;
  if (v10)
  {
    -[NFTNEPService setUri:](v10, "setUri:", v9);
    -[NFTNEPService setMinWaitTime:](v11, "setMinWaitTime:", v8);
    -[NFTNEPService setMaxWaitTimeExtension:](v11, "setMaxWaitTimeExtension:", v7);
    -[NFTNEPService setMaxMessageSize:](v11, "setMaxMessageSize:", v6);
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;

  v5 = objc_alloc_init((Class)objc_opt_class(self));
  if (v5)
  {
    v6 = -[NSString copyWithZone:](self->_uri, "copyWithZone:", a3);
    v7 = (void *)v5[2];
    v5[2] = v6;

    *((_BYTE *)v5 + 8) = self->_minWaitTime;
    *((_BYTE *)v5 + 9) = self->_maxWaitTimeExtension;
    *((_WORD *)v5 + 5) = self->_maxMessageSize;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *uri;
  id v5;

  uri = self->_uri;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", uri, CFSTR("uri"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_minWaitTime, CFSTR("minWaitTime"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_maxWaitTimeExtension, CFSTR("maxWaitTimeExtension"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_maxMessageSize, CFSTR("maxMessageSize"));

}

- (NFTNEPService)initWithCoder:(id)a3
{
  id v4;
  NFTNEPService *v5;
  id v6;
  uint64_t v7;
  NSString *uri;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NFTNEPService;
  v5 = -[NFTNEPService init](&v10, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("uri"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    uri = v5->_uri;
    v5->_uri = (NSString *)v7;

    v5->_minWaitTime = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("minWaitTime"));
    v5->_maxWaitTimeExtension = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("maxWaitTimeExtension"));
    v5->_maxMessageSize = (unsigned __int16)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("maxMessageSize"));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  id v3;
  void *v4;
  id v5;

  v3 = objc_alloc((Class)NSString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NFTNEPService uri](self, "uri"));
  v5 = objc_msgSend(v3, "initWithFormat:", CFSTR("{uri=%@, Nwait=%d, twait=%d, maxMsgSize=%d}"), v4, -[NFTNEPService maxWaitTimeExtension](self, "maxWaitTimeExtension"), -[NFTNEPService minWaitTime](self, "minWaitTime"), -[NFTNEPService maxMessageSize](self, "maxMessageSize"));

  return v5;
}

- (NSString)uri
{
  return self->_uri;
}

- (void)setUri:(id)a3
{
  objc_storeStrong((id *)&self->_uri, a3);
}

- (unsigned)minWaitTime
{
  return self->_minWaitTime;
}

- (void)setMinWaitTime:(unsigned __int8)a3
{
  self->_minWaitTime = a3;
}

- (unsigned)maxWaitTimeExtension
{
  return self->_maxWaitTimeExtension;
}

- (void)setMaxWaitTimeExtension:(unsigned __int8)a3
{
  self->_maxWaitTimeExtension = a3;
}

- (unsigned)maxMessageSize
{
  return self->_maxMessageSize;
}

- (void)setMaxMessageSize:(unsigned __int16)a3
{
  self->_maxMessageSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uri, 0);
}

@end
