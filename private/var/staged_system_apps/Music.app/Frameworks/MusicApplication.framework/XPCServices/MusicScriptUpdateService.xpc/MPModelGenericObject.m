@implementation MPModelGenericObject

- (MPModelObject)innermostModelObject
{
  MPModelGenericObject *v2;
  id v3;

  v2 = self;
  v3 = MPModelGenericObject.innermostModelObject.getter();

  return (MPModelObject *)v3;
}

- (double)preferredArtworkAspectRatio
{
  MPModelGenericObject *v2;
  double v3;
  MPModelGenericObject *v4;
  MPModelGenericObject *v5;
  double v6;

  v2 = self;
  v3 = 1.0;
  if (-[MPModelGenericObject type](v2, "type") == (id)1)
  {
    v4 = (MPModelGenericObject *)-[MPModelGenericObject song](v2, "song");
    if (v4)
    {
      v5 = v4;
      -[MPModelGenericObject preferredArtworkAspectRatio](v4, "preferredArtworkAspectRatio");
      v3 = v6;

      v2 = v5;
    }
  }

  return v3;
}

@end
