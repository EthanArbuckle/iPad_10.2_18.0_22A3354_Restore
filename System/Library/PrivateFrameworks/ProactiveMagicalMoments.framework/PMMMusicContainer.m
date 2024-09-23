@implementation PMMMusicContainer

- (PMMMusicContainer)initWithCoder:(id)a3
{
  id v4;
  PMMMusicContainer *v5;
  uint64_t v6;
  NSString *bundleId;
  uint64_t v8;
  NSString *trackIdentifier;
  uint64_t v10;
  NSDate *playTime;
  uint64_t v12;
  NSDate *pauseTime;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PMMMusicContainer;
  v5 = -[PMMMusicContainer init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleId"));
    v6 = objc_claimAutoreleasedReturnValue();
    bundleId = v5->_bundleId;
    v5->_bundleId = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("trackIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    trackIdentifier = v5->_trackIdentifier;
    v5->_trackIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("playTime"));
    v10 = objc_claimAutoreleasedReturnValue();
    playTime = v5->_playTime;
    v5->_playTime = (NSDate *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pauseTime"));
    v12 = objc_claimAutoreleasedReturnValue();
    pauseTime = v5->_pauseTime;
    v5->_pauseTime = (NSDate *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *bundleId;
  id v5;

  bundleId = self->_bundleId;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", bundleId, CFSTR("bundleId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_trackIdentifier, CFSTR("trackIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_playTime, CFSTR("playTime"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_pauseTime, CFSTR("pauseTime"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setPlayingWithBundleId:(id)a3 trackIdentifier:(id)a4 playTime:(id)a5
{
  NSString *v8;
  NSString *v9;
  NSDate *v10;
  NSString *bundleId;
  NSString *trackIdentifier;
  NSString *v13;
  NSDate *playTime;
  NSDate *v15;
  NSDate *pauseTime;
  NSString *v17;

  v8 = (NSString *)a3;
  v9 = (NSString *)a4;
  v10 = (NSDate *)a5;
  bundleId = self->_bundleId;
  self->_bundleId = v8;
  v17 = v8;

  trackIdentifier = self->_trackIdentifier;
  self->_trackIdentifier = v9;
  v13 = v9;

  playTime = self->_playTime;
  self->_playTime = v10;
  v15 = v10;

  pauseTime = self->_pauseTime;
  self->_pauseTime = 0;

}

- (void)setPauseIfUnset
{
  NSDate *v3;
  NSDate *pauseTime;

  if (!self->_pauseTime)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
    pauseTime = self->_pauseTime;
    self->_pauseTime = v3;

  }
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("MusicContainer bundleId: %@, trackIdentifier: %@, playTime: %@, pauseTime: %@"), self->_bundleId, self->_trackIdentifier, self->_playTime, self->_pauseTime);
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (NSString)trackIdentifier
{
  return self->_trackIdentifier;
}

- (NSDate)playTime
{
  return self->_playTime;
}

- (NSDate)pauseTime
{
  return self->_pauseTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pauseTime, 0);
  objc_storeStrong((id *)&self->_playTime, 0);
  objc_storeStrong((id *)&self->_trackIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end
