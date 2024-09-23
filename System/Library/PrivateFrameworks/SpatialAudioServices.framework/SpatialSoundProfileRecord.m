@implementation SpatialSoundProfileRecord

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SpatialSoundProfileRecord soundProfileData](self, "soundProfileData");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_soundProfileData);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, v5);

}

- (SpatialSoundProfileRecord)initWithCoder:(id)a3
{
  id v4;
  SpatialSoundProfileRecord *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SpatialSoundProfileRecord;
  v5 = -[SpatialSoundProfileRecord init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_soundProfileData);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SpatialSoundProfileRecord setSoundProfileData:](v5, "setSoundProfileData:", v8);

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[SpatialSoundProfileRecord soundProfileData](self, "soundProfileData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("SpatialSoundProfileRecord: %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSData)soundProfileData
{
  return self->_soundProfileData;
}

- (void)setSoundProfileData:(id)a3
{
  objc_storeStrong((id *)&self->_soundProfileData, a3);
}

- (NSURL)soundProfileFileURL
{
  return self->_soundProfileFileURL;
}

- (void)setSoundProfileFileURL:(id)a3
{
  objc_storeStrong((id *)&self->_soundProfileFileURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_soundProfileFileURL, 0);
  objc_storeStrong((id *)&self->_soundProfileData, 0);
}

@end
