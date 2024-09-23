@implementation PDAnimationCacheState

- (PDAnimationCacheState)init
{
  PDAnimationCacheState *v2;
  OITSUNoCopyDictionary *v3;
  OITSUNoCopyDictionary *mMediaNodeMap;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PDAnimationCacheState;
  v2 = -[PDAnimationCacheState init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(OITSUNoCopyDictionary);
    mMediaNodeMap = v2->mMediaNodeMap;
    v2->mMediaNodeMap = v3;

  }
  return v2;
}

- (BOOL)isValid:(id)a3
{
  return 1;
}

- (id)mediaNodeMap
{
  return self->mMediaNodeMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mMediaNodeMap, 0);
}

@end
