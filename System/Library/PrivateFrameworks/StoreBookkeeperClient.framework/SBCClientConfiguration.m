@implementation SBCClientConfiguration

- (SBCClientConfiguration)initWithPlaybackPositionDomain:(id)a3
{
  id v5;
  SBCClientConfiguration *v6;
  SBCClientConfiguration *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBCClientConfiguration;
  v6 = -[SBCClientConfiguration init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_playbackPositionDomain, a3);

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v7.receiver = self;
  v7.super_class = (Class)SBCClientConfiguration;
  -[SBCClientConfiguration description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, self->_playbackPositionDomain);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_playbackPositionDomain, CFSTR("SBCPlaybackPositionDomain"));
}

- (SBCClientConfiguration)initWithCoder:(id)a3
{
  void *v4;
  SBCClientConfiguration *v5;

  objc_msgSend(a3, "decodeObjectForKey:", CFSTR("SBCPlaybackPositionDomain"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SBCClientConfiguration initWithPlaybackPositionDomain:](self, "initWithPlaybackPositionDomain:", v4);

  return v5;
}

- (SBCPlaybackPositionDomain)playbackPositionDomain
{
  return self->_playbackPositionDomain;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackPositionDomain, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
