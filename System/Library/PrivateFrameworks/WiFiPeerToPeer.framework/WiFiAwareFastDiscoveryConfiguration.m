@implementation WiFiAwareFastDiscoveryConfiguration

- (WiFiAwareFastDiscoveryConfiguration)init
{
  WiFiAwareFastDiscoveryConfiguration *v2;
  WiFiAwareFastDiscoveryConfiguration *v3;
  NSNumber *instantCommunicationChannel;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WiFiAwareFastDiscoveryConfiguration;
  v2 = -[WiFiAwareFastDiscoveryConfiguration init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    instantCommunicationChannel = v2->_instantCommunicationChannel;
    v2->_instantCommunicationChannel = 0;

    v3->_peerBandInformation = 0;
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WiFiAwareFastDiscoveryConfiguration)initWithCoder:(id)a3
{
  id v4;
  WiFiAwareFastDiscoveryConfiguration *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = -[WiFiAwareFastDiscoveryConfiguration init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WiFiAwareFastDiscoveryConfiguration.instantCommunicationChannel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WiFiAwareFastDiscoveryConfiguration setInstantCommunicationChannel:](v5, "setInstantCommunicationChannel:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WiFiAwareFastDiscoveryConfiguration.peerBandInformation"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WiFiAwareFastDiscoveryConfiguration setPeerBandInformation:](v5, "setPeerBandInformation:", objc_msgSend(v7, "unsignedCharValue"));

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[WiFiAwareFastDiscoveryConfiguration instantCommunicationChannel](self, "instantCommunicationChannel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("WiFiAwareFastDiscoveryConfiguration.instantCommunicationChannel"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", -[WiFiAwareFastDiscoveryConfiguration peerBandInformation](self, "peerBandInformation"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("WiFiAwareFastDiscoveryConfiguration.peerBandInformation"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  WiFiAwareFastDiscoveryConfiguration *v4;
  void *v5;
  void *v6;

  v4 = objc_alloc_init(WiFiAwareFastDiscoveryConfiguration);
  -[WiFiAwareFastDiscoveryConfiguration instantCommunicationChannel](self, "instantCommunicationChannel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  -[WiFiAwareFastDiscoveryConfiguration setInstantCommunicationChannel:](v4, "setInstantCommunicationChannel:", v6);

  -[WiFiAwareFastDiscoveryConfiguration setPeerBandInformation:](v4, "setPeerBandInformation:", -[WiFiAwareFastDiscoveryConfiguration peerBandInformation](self, "peerBandInformation"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  WiFiAwareFastDiscoveryConfiguration *v6;
  WiFiAwareFastDiscoveryConfiguration *v7;
  void *v8;
  void *v9;
  BOOL v10;
  int v11;
  int v12;

  v6 = (WiFiAwareFastDiscoveryConfiguration *)a3;
  if (self == v6)
  {
    v7 = 0;
LABEL_12:
    v10 = 1;
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    -[WiFiAwareFastDiscoveryConfiguration instantCommunicationChannel](self, "instantCommunicationChannel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WiFiAwareFastDiscoveryConfiguration instantCommunicationChannel](v7, "instantCommunicationChannel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 != v9)
    {
      -[WiFiAwareFastDiscoveryConfiguration instantCommunicationChannel](self, "instantCommunicationChannel");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[WiFiAwareFastDiscoveryConfiguration instantCommunicationChannel](v7, "instantCommunicationChannel");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v3, "isEqual:", v4))
      {

LABEL_13:
        v10 = 0;
        goto LABEL_14;
      }
    }
    v11 = -[WiFiAwareFastDiscoveryConfiguration peerBandInformation](self, "peerBandInformation");
    v12 = -[WiFiAwareFastDiscoveryConfiguration peerBandInformation](v7, "peerBandInformation");
    if (v8 == v9)
    {

    }
    else
    {

    }
    if (v11 != v12)
      goto LABEL_13;
    goto LABEL_12;
  }
  v10 = 0;
  v7 = 0;
LABEL_14:

  return v10;
}

- (id)description
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[WiFiAwareFastDiscoveryConfiguration peerBandInformation](self, "peerBandInformation");
  -[WiFiAwareFastDiscoveryConfiguration instantCommunicationChannel](self, "instantCommunicationChannel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<enabled (peer band: %u, channel: %@)>"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSNumber)instantCommunicationChannel
{
  return self->_instantCommunicationChannel;
}

- (void)setInstantCommunicationChannel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unsigned)peerBandInformation
{
  return self->_peerBandInformation;
}

- (void)setPeerBandInformation:(unsigned __int8)a3
{
  self->_peerBandInformation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instantCommunicationChannel, 0);
}

@end
