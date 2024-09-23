@implementation SPTagUserStats

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setOverflowFlag:", -[SPTagUserStats overflowFlag](self, "overflowFlag"));
  objc_msgSend(v4, "setCrashCount:", -[SPTagUserStats crashCount](self, "crashCount"));
  objc_msgSend(v4, "setMultiTime:", -[SPTagUserStats multiTime](self, "multiTime"));
  objc_msgSend(v4, "setNearOwnerTime:", -[SPTagUserStats nearOwnerTime](self, "nearOwnerTime"));
  objc_msgSend(v4, "setWildTime:", -[SPTagUserStats wildTime](self, "wildTime"));
  objc_msgSend(v4, "setOwnerPlaySoundCount:", -[SPTagUserStats ownerPlaySoundCount](self, "ownerPlaySoundCount"));
  objc_msgSend(v4, "setOwnerPlaySoundTime:", -[SPTagUserStats ownerPlaySoundTime](self, "ownerPlaySoundTime"));
  objc_msgSend(v4, "setRangingCount:", -[SPTagUserStats rangingCount](self, "rangingCount"));
  objc_msgSend(v4, "setRangingTime:", -[SPTagUserStats rangingTime](self, "rangingTime"));
  objc_msgSend(v4, "setVersion:", -[SPTagUserStats version](self, "version"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t overflowFlag;
  id v5;

  overflowFlag = self->_overflowFlag;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", overflowFlag, CFSTR("overflowFlag"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_crashCount, CFSTR("crashCount"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_multiTime, CFSTR("multiTime"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_nearOwnerTime, CFSTR("nearOwnerTime"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_wildTime, CFSTR("wildTime"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_ownerPlaySoundCount, CFSTR("ownerPlaySoundCount"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_ownerPlaySoundTime, CFSTR("ownerPlaySoundTime"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_rangingCount, CFSTR("rangingCount"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_rangingTime, CFSTR("rangingTime"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_version, CFSTR("version"));

}

- (SPTagUserStats)initWithCoder:(id)a3
{
  id v4;
  unsigned __int8 v5;

  v4 = a3;
  self->_overflowFlag = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("overflowFlag"));
  self->_crashCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("crashCount"));
  self->_multiTime = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("multiTime"));
  self->_nearOwnerTime = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("nearOwnerTime"));
  self->_wildTime = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("wildTime"));
  self->_ownerPlaySoundCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ownerPlaySoundCount"));
  self->_ownerPlaySoundTime = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ownerPlaySoundTime"));
  self->_rangingCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("rangingCount"));
  self->_rangingTime = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("rangingTime"));
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("version"));

  self->_version = v5;
  return self;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Overflow Flag: %d\n"), -[SPTagUserStats overflowFlag](self, "overflowFlag"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(&stru_1E5E19868, "stringByAppendingString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Crash Count: %d\n"), -[SPTagUserStats crashCount](self, "crashCount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Multi Time: %llu\n"), -[SPTagUserStats multiTime](self, "multiTime"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Near Owner Time: %llu\n"), -[SPTagUserStats nearOwnerTime](self, "nearOwnerTime"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Wild Time: %llu\n"), -[SPTagUserStats wildTime](self, "wildTime"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByAppendingString:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Owner Play Sound Count: %u\n"), -[SPTagUserStats ownerPlaySoundCount](self, "ownerPlaySoundCount"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringByAppendingString:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Owner Play Sound Time: %u\n"), -[SPTagUserStats ownerPlaySoundTime](self, "ownerPlaySoundTime"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringByAppendingString:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Ranging Count: %u\n"), -[SPTagUserStats rangingCount](self, "rangingCount"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringByAppendingString:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Ranging Time: %u\n"), -[SPTagUserStats rangingTime](self, "rangingTime"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringByAppendingString:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Version: %d\n"), -[SPTagUserStats version](self, "version"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringByAppendingString:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (unsigned)overflowFlag
{
  return self->_overflowFlag;
}

- (void)setOverflowFlag:(unsigned __int8)a3
{
  self->_overflowFlag = a3;
}

- (unsigned)crashCount
{
  return self->_crashCount;
}

- (void)setCrashCount:(unsigned __int16)a3
{
  self->_crashCount = a3;
}

- (unint64_t)multiTime
{
  return self->_multiTime;
}

- (void)setMultiTime:(unint64_t)a3
{
  self->_multiTime = a3;
}

- (unint64_t)nearOwnerTime
{
  return self->_nearOwnerTime;
}

- (void)setNearOwnerTime:(unint64_t)a3
{
  self->_nearOwnerTime = a3;
}

- (unint64_t)wildTime
{
  return self->_wildTime;
}

- (void)setWildTime:(unint64_t)a3
{
  self->_wildTime = a3;
}

- (unsigned)ownerPlaySoundCount
{
  return self->_ownerPlaySoundCount;
}

- (void)setOwnerPlaySoundCount:(unsigned int)a3
{
  self->_ownerPlaySoundCount = a3;
}

- (unsigned)ownerPlaySoundTime
{
  return self->_ownerPlaySoundTime;
}

- (void)setOwnerPlaySoundTime:(unsigned int)a3
{
  self->_ownerPlaySoundTime = a3;
}

- (unsigned)rangingCount
{
  return self->_rangingCount;
}

- (void)setRangingCount:(unsigned int)a3
{
  self->_rangingCount = a3;
}

- (unsigned)rangingTime
{
  return self->_rangingTime;
}

- (void)setRangingTime:(unsigned int)a3
{
  self->_rangingTime = a3;
}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned __int8)a3
{
  self->_version = a3;
}

@end
