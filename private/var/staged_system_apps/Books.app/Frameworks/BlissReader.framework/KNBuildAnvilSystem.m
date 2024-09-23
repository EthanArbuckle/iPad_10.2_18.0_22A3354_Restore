@implementation KNBuildAnvilSystem

- (double)p_anvilGlobalScale
{
  double v3;
  double v4;
  id v5;
  double v6;
  double v7;
  double v8;

  -[KNBuildAnvilSystem objectSize](self, "objectSize");
  v4 = v3;
  v5 = -[KNBuildAnvilSystem slideSize](self, "slideSize");
  v7 = TSDMixFloats(v5, 1.25, 0.75, v4 / v6);
  -[KNBuildAnvilSystem objectSize](self, "objectSize");
  return v7 * v8 / 7.0;
}

@end
