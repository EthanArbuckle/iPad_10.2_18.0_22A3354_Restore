@implementation OADMovie

- (void)setName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void)setData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADMovie;
  -[OADMovie description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)isAudioOnly
{
  return self->mIsAudioOnly;
}

- (void)setIsAudioOnly:(BOOL)a3
{
  self->mIsAudioOnly = a3;
}

- (float)movieStartPoint
{
  return self->mStart;
}

- (void)setMovieStartPoint:(float)a3
{
  self->mStart = a3;
}

- (float)movieEndPoint
{
  return self->mEnd;
}

- (void)setMovieEndPoint:(float)a3
{
  self->mEnd = a3;
}

- (BOOL)loop
{
  return self->loop;
}

- (void)setLoop:(BOOL)a3
{
  self->loop = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mName, 0);
  objc_storeStrong((id *)&self->mData, 0);
}

@end
