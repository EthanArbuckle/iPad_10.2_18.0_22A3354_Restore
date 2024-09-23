@implementation W5PeerDiscoveryConfiguration

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  W5DescriptionForPeerDiscoveryFlags(-[W5PeerDiscoveryConfiguration discoveryFlags](self, "discoveryFlags"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  W5DescriptionForPeerControlFlags(-[W5PeerDiscoveryConfiguration controlFlags](self, "controlFlags"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Discovery='%@' Control='%@'"), v4, v5);

  v6 = (void *)objc_msgSend(v3, "copy");
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  W5PeerDiscoveryConfiguration *v4;

  v4 = -[W5PeerDiscoveryConfiguration init](+[W5PeerDiscoveryConfiguration allocWithZone:](W5PeerDiscoveryConfiguration, "allocWithZone:", a3), "init");
  -[W5PeerDiscoveryConfiguration setDiscoveryFlags:](v4, "setDiscoveryFlags:", self->_discoveryFlags);
  -[W5PeerDiscoveryConfiguration setControlFlags:](v4, "setControlFlags:", self->_controlFlags);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t controlFlags;
  id v5;

  controlFlags = self->_controlFlags;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", controlFlags, CFSTR("_controlFlags"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_discoveryFlags, CFSTR("_discoveryFlags"));

}

- (W5PeerDiscoveryConfiguration)initWithCoder:(id)a3
{
  id v4;
  W5PeerDiscoveryConfiguration *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)W5PeerDiscoveryConfiguration;
  v5 = -[W5PeerDiscoveryConfiguration init](&v7, sel_init);
  if (v5)
  {
    v5->_controlFlags = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_controlFlags"));
    v5->_discoveryFlags = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_discoveryFlags"));
  }

  return v5;
}

- (int64_t)discoveryFlags
{
  return self->_discoveryFlags;
}

- (void)setDiscoveryFlags:(int64_t)a3
{
  self->_discoveryFlags = a3;
}

- (int64_t)controlFlags
{
  return self->_controlFlags;
}

- (void)setControlFlags:(int64_t)a3
{
  self->_controlFlags = a3;
}

@end
