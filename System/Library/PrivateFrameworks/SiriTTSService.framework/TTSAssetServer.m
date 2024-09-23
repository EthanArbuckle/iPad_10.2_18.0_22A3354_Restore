@implementation TTSAssetServer

+ (TTSAssetServer)production
{
  return (TTSAssetServer *)static TTSAssetServer.production.getter();
}

+ (TTSAssetServer)livability
{
  return (TTSAssetServer *)static TTSAssetServer.livability.getter();
}

+ (TTSAssetServer)staging
{
  return (TTSAssetServer *)static TTSAssetServer.staging.getter();
}

- (BOOL)isEqual:(id)a3
{
  return sub_19AD53274(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))TTSAssetServer.isEqual(_:));
}

- (int64_t)hash
{
  TTSAssetServer *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  TTSAssetServer.hash.getter();
  v4 = v3;

  return v4;
}

@end
