@implementation PUTemporaryImageTable

- (int)nextCacheIndex
{
  unsigned int *v2;
  unsigned int v3;
  int result;

  v2 = (unsigned int *)(&self->super._imageFormatID + 2);
  do
  {
    v3 = __ldaxr(v2);
    result = v3 + 1;
  }
  while (__stlxr(v3 + 1, v2));
  return result;
}

@end
