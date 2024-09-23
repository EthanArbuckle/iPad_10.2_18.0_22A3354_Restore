@implementation FTMutableUserAcousticProfile

- (FTMutableUserAcousticProfile)init
{
  FTMutableUserAcousticProfile *v2;
  uint64_t v3;
  NSMutableDictionary *storage;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FTMutableUserAcousticProfile;
  v2 = -[FTMutableUserAcousticProfile init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[NSMutableDictionary copy](self->super._storage, "copy");
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (NSString)acoustic_profile_version
{
  return (NSString *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("acoustic_profile_version"));
}

- (void)setAcoustic_profile_version:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");

}

- (NSData)acoustic_profile_blob
{
  return (NSData *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("acoustic_profile_blob"));
}

- (void)setAcoustic_profile_blob:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");

}

- (void)acoustic_profile_blob:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void (**v7)(id, uint64_t, uint64_t);

  v7 = (void (**)(id, uint64_t, uint64_t))a3;
  -[FTMutableUserAcousticProfile acoustic_profile_blob](self, "acoustic_profile_blob");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = objc_msgSend(v4, "bytes");
  -[FTMutableUserAcousticProfile acoustic_profile_blob](self, "acoustic_profile_blob");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v5, objc_msgSend(v6, "length"));

}

- (NSString)profile_checksum
{
  return (NSString *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("profile_checksum"));
}

- (void)setProfile_checksum:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");

}

@end
