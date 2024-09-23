@implementation CLLocation

- (CLLocationCoordinate2D)roundCoordinateValuesToGeohashOfLength:(unint64_t)a3
{
  unint64_t v3;
  unint64_t v5;
  unint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  unint64_t v13;
  double v14;
  unint64_t v15;
  BOOL v16;
  _BYTE *v17;
  _BYTE *v18;
  uint64_t v19;
  _BYTE *v20;
  id v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  CLLocationCoordinate2D result;

  v3 = a3;
  if (a3 > 0xB)
  {
    v28 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "Geohash length is too big (%lu), maximum is 12", v3);
    goto LABEL_24;
  }
  v5 = 0;
  v6 = 1 << (5 * a3 - 1);
  v7 = 180.0;
  v8 = -180.0;
  v9 = 90.0;
  v10 = -90.0;
  do
  {
    v11 = v8 + (v7 - v8) * 0.5;
    -[CLLocation coordinate](self, "coordinate");
    if (v12 >= v11)
      v13 = v6;
    else
      v13 = 0;
    v5 |= v13;
    if (v6 == 1)
      break;
    if (v12 < v11)
      v7 = v8 + (v7 - v8) * 0.5;
    else
      v8 = v8 + (v7 - v8) * 0.5;
    -[CLLocation coordinate](self, "coordinate");
    if (v14 >= v10 + (v9 - v10) * 0.5)
    {
      v10 = v10 + (v9 - v10) * 0.5;
      v15 = v6 >> 1;
    }
    else
    {
      v9 = v10 + (v9 - v10) * 0.5;
      v15 = 0;
    }
    v5 |= v15;
    v16 = v6 > 3;
    v6 >>= 2;
  }
  while (v16);
  v17 = malloc_type_malloc(v3 + 1, 0x9F4DE9D5uLL);
  if (!v17)
  {
    v28 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "Failed to allocate %lu bytes for the geohash", v3 + 1);
LABEL_24:
    objc_autoreleasePoolPop(v28);
    v21 = 0;
    v23 = 0.0;
    v25 = 0.0;
    goto LABEL_19;
  }
  v18 = v17;
  bzero(v17, v3 + 1);
  if (v3)
  {
    v19 = 5 * v3 - 5;
    v20 = v18;
    do
    {
      *v20++ = a0123456789bcde[(v5 >> v19) & 0x1F];
      v19 -= 5;
      --v3;
    }
    while (v3);
  }
  v21 = objc_msgSend(objc_alloc((Class)NSString), "initWithCString:encoding:", v18, 4);
  -[CLLocation _geoHashToCoordinates:](self, "_geoHashToCoordinates:", v21);
  v23 = v22;
  v25 = v24;
  free(v18);
LABEL_19:

  v26 = v23;
  v27 = v25;
  result.longitude = v27;
  result.latitude = v26;
  return result;
}

- (CLLocationCoordinate2D)_geoHashToCoordinates:(id)a3
{
  const char *v4;
  size_t v5;
  CLLocationCoordinate2D v6;
  size_t v7;
  size_t v8;
  uint64_t v9;
  size_t v10;
  _BYTE *v11;
  unint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  BOOL v17;
  double latitude;
  double longitude;
  CLLocationCoordinate2D v20;
  void *v21;
  CLLocationCoordinate2D result;

  v4 = (const char *)objc_msgSend(a3, "UTF8String");
  v5 = 5 * strlen(v4);
  v6 = CLLocationCoordinate2DMake(0.0, 0.0);
  v7 = strlen(v4);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = v5 - 5;
    while (1)
    {
      v11 = memchr("0123456789bcdefghjkmnpqrstuvwxyz", *v4, 0x21uLL);
      if (!v11)
        break;
      v9 |= (v11 - "0123456789bcdefghjkmnpqrstuvwxyz") << v10;
      ++v4;
      v10 -= 5;
      if (!--v8)
        goto LABEL_7;
    }
    v21 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "Invalid character in geohash %@: %c", a3, *v4);
    objc_autoreleasePoolPop(v21);
    latitude = v6.latitude;
    longitude = v6.longitude;
  }
  else
  {
    v9 = 0;
LABEL_7:
    v12 = 1 << (v5 - 1);
    v13 = -90.0;
    v14 = 90.0;
    v15 = -180.0;
    v16 = 180.0;
    do
    {
      if ((v12 & v9) != 0)
        v15 = v15 + (v16 - v15) * 0.5;
      else
        v16 = v15 + (v16 - v15) * 0.5;
      if (v12 == 1)
        break;
      if ((v9 & (v12 >> 1)) != 0)
        v13 = v13 + (v14 - v13) * 0.5;
      else
        v14 = v13 + (v14 - v13) * 0.5;
      v17 = v12 > 3;
      v12 >>= 2;
    }
    while (v17);
    v20 = CLLocationCoordinate2DMake(v13 + (v13 - v14) * 0.5, v15 + (v15 - v16) * 0.5);
    longitude = v20.longitude;
    latitude = v20.latitude;
  }
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

@end
