@implementation CLLocation(Geohash)

- (uint64_t)sh_toGeohash
{
  return objc_msgSend(a1, "sh_geohashOfLength:", 12);
}

- (double)sh_roundCoordinateValuesToGeohashOfLength:()Geohash
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(a1, "sh_geohashOfLength:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sh_geoHashToCoordinates:", v2);
  v4 = v3;

  return v4;
}

- (id)sh_geohashOfLength:()Geohash
{
  uint64_t v3;
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
  void *v17;
  uint64_t v18;
  _BYTE *v19;
  void *v20;

  v3 = a3;
  v5 = 0;
  v6 = 1 << (5 * a3 - 1);
  v7 = 180.0;
  v8 = -180.0;
  v9 = 90.0;
  v10 = -90.0;
  do
  {
    v11 = v8 + (v7 - v8) * 0.5;
    objc_msgSend(a1, "coordinate");
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
    objc_msgSend(a1, "coordinate");
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
  v17 = malloc_type_malloc(v3 + 1, 0xEF328385uLL);
  bzero(v17, v3 + 1);
  if (v3)
  {
    v18 = 5 * v3 - 5;
    v19 = v17;
    do
    {
      *v19++ = a0123456789bcde[(v5 >> v18) & 0x1F];
      v18 -= 5;
      --v3;
    }
    while (v3);
  }
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCString:encoding:", v17, 4);
  if (v17)
    free(v17);
  return v20;
}

- (double)sh_geoHashToCoordinates:()Geohash
{
  id v3;
  const char *v4;
  size_t v5;
  double v6;
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
  NSObject *v18;
  int v19;
  int v21;
  id v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = objc_retainAutorelease(a3);
  v4 = (const char *)objc_msgSend(v3, "UTF8String");
  v5 = 5 * strlen(v4);
  *(_QWORD *)&v6 = *(_OWORD *)&CLLocationCoordinate2DMake(0.0, 0.0);
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
    shcore_log_object();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = *v4;
      v21 = 138412546;
      v22 = v3;
      v23 = 1024;
      v24 = v19;
      _os_log_impl(&dword_21A508000, v18, OS_LOG_TYPE_ERROR, "Invalid character in geohash %@: %c", (uint8_t *)&v21, 0x12u);
    }

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
    *(_QWORD *)&v6 = *(_OWORD *)&CLLocationCoordinate2DMake(v13 + (v13 - v14) * 0.5, v15 + (v15 - v16) * 0.5);
  }

  return v6;
}

@end
