@implementation PLLocationUtils

+ (BOOL)canUseCoordinate:(CLLocationCoordinate2D)a3
{
  double longitude;
  double latitude;
  _BOOL4 v5;
  _BOOL4 v6;

  longitude = a3.longitude;
  latitude = a3.latitude;
  v5 = CLLocationCoordinate2DIsValid(a3);
  if (v5)
  {
    v6 = latitude != 0.0;
    if (longitude != 0.0)
      v6 = 1;
    LOBYTE(v5) = v6 && (longitude != -100.0 || latitude != 40.0);
  }
  return v5;
}

+ (CLLocationCoordinate2D)defaultLocationCoordinate2D
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D v4;
  CLLocationCoordinate2D result;

  v4 = CLLocationCoordinate2DMake(-180.0, -180.0);
  longitude = v4.longitude;
  latitude = v4.latitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

+ (id)predicateForAssetWithLocation
{
  uint64_t v2;
  uint64_t v3;

  objc_msgSend(a1, "defaultLocationCoordinate2D");
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("latitude > %f && longitude > %f"), v2, v3);
}

+ (id)predicateForMomentWithLocation
{
  uint64_t v2;
  uint64_t v3;

  objc_msgSend(a1, "defaultLocationCoordinate2D");
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("approximateLatitude > %f && approximateLongitude > %f"), v2, v3);
}

+ (BOOL)locationIsCoarse:(id)a3
{
  objc_msgSend(a3, "horizontalAccuracy");
  return objc_msgSend(a1, "horizontalAccuracyIsCoarse:");
}

+ (BOOL)horizontalAccuracyIsCoarse:(double)a3
{
  return a3 >= 1000.0;
}

+ (PLCartesianCoordinate3D)cartesianCoordinateFromLatitude:(float)a3 longitude:(float)a4
{
  float v4;
  __float2 v5;
  __float2 v6;
  float v7;
  float v8;
  float sinval;
  PLCartesianCoordinate3D result;

  v4 = a3 * 0.017453;
  v5 = __sincosf_stret(a4 * 0.017453);
  v6 = __sincosf_stret(v4);
  v7 = v6.__cosval * v5.__sinval;
  v8 = v6.__cosval * v5.__cosval;
  sinval = v6.__sinval;
  result.var2 = v8;
  result.var1 = sinval;
  result.var0 = v7;
  return result;
}

@end
