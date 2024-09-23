@implementation OADLinkedMediaFile

- (void)setUrl:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void)setIsExternal:(BOOL)a3
{
  self->mIsExternal = a3;
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 56, 1);
}

- (BOOL)isExternal
{
  return self->mIsExternal;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mUrl, 0);
}

@end
