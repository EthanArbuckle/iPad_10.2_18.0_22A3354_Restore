@implementation TTRIWorldBoundingMKCircle

- ($DA1BCF6CE077296A0BBD1E939DD7545D)boundingMapRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  $DA1BCF6CE077296A0BBD1E939DD7545D result;

  v2 = *MEMORY[0x1E0CC1670];
  v3 = *(double *)(MEMORY[0x1E0CC1670] + 8);
  v4 = *(double *)(MEMORY[0x1E0CC1670] + 16);
  v5 = *(double *)(MEMORY[0x1E0CC1670] + 24);
  result.var1.var1 = v5;
  result.var1.var0 = v4;
  result.var0.var1 = v3;
  result.var0.var0 = v2;
  return result;
}

- ($DA1BCF6CE077296A0BBD1E939DD7545D)originalBoundingMapRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  $DA1BCF6CE077296A0BBD1E939DD7545D result;

  v6.receiver = self;
  v6.super_class = (Class)TTRIWorldBoundingMKCircle;
  -[MKCircle boundingMapRect](&v6, sel_boundingMapRect);
  result.var1.var1 = v5;
  result.var1.var0 = v4;
  result.var0.var1 = v3;
  result.var0.var0 = v2;
  return result;
}

@end
