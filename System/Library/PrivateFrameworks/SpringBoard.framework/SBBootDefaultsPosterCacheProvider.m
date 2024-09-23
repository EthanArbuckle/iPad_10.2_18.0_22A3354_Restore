@implementation SBBootDefaultsPosterCacheProvider

- (SBBootDefaultsPosterCacheProvider)init
{
  SBBootDefaultsPosterCacheProvider *v2;
  void *v3;
  uint64_t v4;
  SBBootDefaults *bootDefaults;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBBootDefaultsPosterCacheProvider;
  v2 = -[SBBootDefaultsPosterCacheProvider init](&v7, sel_init);
  if (v2)
  {
    +[SBDefaults localDefaults](SBDefaults, "localDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bootDefaults");
    v4 = objc_claimAutoreleasedReturnValue();
    bootDefaults = v2->_bootDefaults;
    v2->_bootDefaults = (SBBootDefaults *)v4;

  }
  return v2;
}

- (NSData)lastActiveLockPoster
{
  return (NSData *)-[SBBootDefaults lastActiveLockPoster](self->_bootDefaults, "lastActiveLockPoster");
}

- (NSData)lastActiveHomePoster
{
  return (NSData *)-[SBBootDefaults lastActiveHomePoster](self->_bootDefaults, "lastActiveHomePoster");
}

- (void)setLastActiveLockPoster:(id)a3
{
  -[SBBootDefaults setLastActiveLockPoster:](self->_bootDefaults, "setLastActiveLockPoster:", a3);
}

- (void)setLastActiveHomePoster:(id)a3
{
  -[SBBootDefaults setLastActiveHomePoster:](self->_bootDefaults, "setLastActiveHomePoster:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bootDefaults, 0);
}

@end
