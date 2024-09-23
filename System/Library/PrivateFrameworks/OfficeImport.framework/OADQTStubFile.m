@implementation OADQTStubFile

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADQTStubFile;
  -[OADMovie description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isAudioOnly
{
  return *(&self->super.super.loop + 1);
}

- (void)setIsAudioOnly:(BOOL)a3
{
  *(&self->super.super.loop + 1) = a3;
}

@end
