@implementation OADSound

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->mName, a3);
}

- (id)soundData
{
  return self->mSoundData;
}

- (void)setSoundData:(id)a3
{
  objc_storeStrong((id *)&self->mSoundData, a3);
}

- (id)name
{
  return self->mName;
}

- (int)sizeInBytes
{
  return self->mSizeInBytes;
}

- (void)setSizeInBytes:(int)a3
{
  self->mSizeInBytes = a3;
}

- (BOOL)isLoaded
{
  objc_super v3;

  if (!self->mSoundData)
    return 0;
  v3.receiver = self;
  v3.super_class = (Class)OADSound;
  return -[OCDDelayedNode isLoaded](&v3, sel_isLoaded);
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADSound;
  -[OADSound description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mName, 0);
  objc_storeStrong((id *)&self->mSoundData, 0);
}

@end
