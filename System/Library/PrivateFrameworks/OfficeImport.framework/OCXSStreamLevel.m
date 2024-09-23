@implementation OCXSStreamLevel

- (void)setName:(const char *)a3
{
  self->mName = a3;
}

- (void)setDepth:(int)a3
{
  self->mDepth = a3;
}

- (int)depth
{
  return self->mDepth;
}

- (const)name
{
  return self->mName;
}

@end
