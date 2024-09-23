@implementation MPModelObject

- (NSString)shortDescription
{
  return (NSString *)String._bridgeToObjectiveC()();
}

- (double)preferredArtworkAspectRatio
{
  void *v3;
  double result;

  objc_opt_self(MPModelGenericObject);
  v3 = (void *)swift_dynamicCastObjCClass(self);
  if (!v3)
  {
    objc_opt_self(MPModelSong);
    v3 = (void *)swift_dynamicCastObjCClass(self);
    if (!v3)
      return 1.0;
  }
  objc_msgSend(v3, "preferredArtworkAspectRatio");
  return result;
}

@end
