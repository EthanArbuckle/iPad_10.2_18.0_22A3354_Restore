@implementation VKMuninMarker

- (VKMuninMarker)initWithCollectionPoint:(const void *)a3
{
  VKMuninMarker *v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  void *v8;
  _QWORD *v9;
  _QWORD *v10;
  void *v11;
  long double v12;
  long double v13;
  double v14;
  long double v15;
  long double v16;
  double v17;
  VKMuninMarker *v18;
  objc_super v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  _BYTE *v29;
  _BYTE *v30;
  _BYTE *v31;
  uint64_t v32;
  _BYTE v33[1728];
  _QWORD v34[2];
  _BYTE v35[96];
  void *v36;
  _QWORD *v37;
  _QWORD *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)VKMuninMarker;
  v4 = -[VKMuninMarker init](&v20, sel_init);
  if (v4)
  {
    v21 = *(_QWORD *)a3;
    v22 = *(_OWORD *)((char *)a3 + 8);
    v5 = *((_QWORD *)a3 + 4);
    v23 = *((_QWORD *)a3 + 3);
    v24 = v5;
    v25 = *((_DWORD *)a3 + 10);
    v26 = *(_QWORD *)((char *)a3 + 44);
    v27 = *(_OWORD *)((char *)a3 + 56);
    v28 = *(_OWORD *)((char *)a3 + 72);
    v29 = v33;
    v30 = v33;
    v31 = v33;
    v32 = 6;
    geo::small_vector_base<md::mun::PhotoInfo>::append<md::mun::PhotoInfo const*>((uint64_t)&v29, *((__int128 **)a3 + 11), *((__int128 **)a3 + 12));
    *(_QWORD *)((char *)v34 + 5) = *(_QWORD *)((char *)a3 + 1853);
    v34[0] = *((_QWORD *)a3 + 231);
    geo::optional<md::mun::CollectionPoint>::optional((uint64_t)v35, (uint64_t)&v21);
    v6 = v29;
    v7 = v30;
    if (v29 != v30)
    {
      do
      {
        v8 = (void *)v6[31];
        if (v8 != (void *)v6[33])
          free(v8);
        v6 += 36;
      }
      while (v6 != v7);
      v6 = v29;
    }
    if (v6 != (_QWORD *)v31)
      free(v6);
    geo::optional<md::mun::CollectionPoint>::operator=((uint64_t)&v4->_collectionPoint, (uint64_t)v35);
    if (v35[0])
    {
      v9 = v36;
      v10 = v37;
      if (v36 != v37)
      {
        do
        {
          v11 = (void *)v9[31];
          if (v11 != (void *)v9[33])
            free(v11);
          v9 += 36;
        }
        while (v9 != v10);
        v9 = v36;
      }
      if (v9 != v38)
        free(v9);
    }
    v12 = *((double *)a3 + 7) * 6.28318531;
    v13 = exp(*((double *)a3 + 8) * 6.28318531 + -3.14159265);
    v14 = atan(v13);
    v15 = fmod(v12, 6.28318531);
    v16 = fmod(v15 + 6.28318531, 6.28318531);
    v17 = *((double *)a3 + 9);
    v4->_coordinate.latitude = v14 * 114.591559 + -90.0;
    v4->_coordinate.longitude = v16 * 57.2957795 + -180.0;
    v4->_coordinate.altitude = v17;
    v18 = v4;
  }

  return v4;
}

- (VKMuninMarker)initWithCoordinate:(id)a3
{
  double var2;
  double var1;
  double var0;
  VKMuninMarker *v6;
  VKMuninMarker *v7;
  VKMuninMarker *v8;
  objc_super v10;

  var2 = a3.var2;
  var1 = a3.var1;
  var0 = a3.var0;
  v10.receiver = self;
  v10.super_class = (Class)VKMuninMarker;
  v6 = -[VKMuninMarker init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_coordinate.latitude = var0;
    v6->_coordinate.longitude = var1;
    v6->_coordinate.altitude = var2;
    v8 = v6;
  }

  return v7;
}

- (const)collectionPoint
{
  if (self->_collectionPoint._hasValue)
    return &self->_collectionPoint._value;
  else
    return 0;
}

- (NSDate)collectionDate
{
  if (self->_collectionPoint._hasValue)
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)*(unint64_t *)&self->_anon_18[72] * 0.001);
  else
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
  return (NSDate *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)canMoveToMarker
{
  return self->_collectionPoint._hasValue;
}

- (unint64_t)pointId
{
  if (self->_collectionPoint._hasValue)
    return *(_QWORD *)&self->_collectionPoint._value.type;
  else
    return 0;
}

- (unsigned)buildId
{
  if (self->_collectionPoint._hasValue)
    return *(_DWORD *)&self->_anon_18[1844];
  else
    return 0;
}

- ($1AB5FA073B851C12C2339EC22442E995)coordinate
{
  double latitude;
  double longitude;
  double altitude;
  $1AB5FA073B851C12C2339EC22442E995 result;

  latitude = self->_coordinate.latitude;
  longitude = self->_coordinate.longitude;
  altitude = self->_coordinate.altitude;
  result.var2 = altitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (void).cxx_destruct
{
  _QWORD *v3;
  _QWORD *v4;
  void *v5;

  if (self->_collectionPoint._hasValue)
  {
    v3 = *(_QWORD **)&self->_anon_18[80];
    v4 = *(_QWORD **)&self->_anon_18[88];
    if (v3 != v4)
    {
      do
      {
        v5 = (void *)v3[31];
        if (v5 != (void *)v3[33])
          free(v5);
        v3 += 36;
      }
      while (v3 != v4);
      v3 = *(_QWORD **)&self->_anon_18[80];
    }
    if (v3 != *(_QWORD **)&self->_anon_18[96])
      free(v3);
    self->_collectionPoint._hasValue = 0;
  }
}

- (id).cxx_construct
{
  *((_BYTE *)self + 8) = 0;
  return self;
}

@end
