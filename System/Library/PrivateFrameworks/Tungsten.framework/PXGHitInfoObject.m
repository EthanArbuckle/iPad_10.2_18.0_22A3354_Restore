@implementation PXGHitInfoObject

- (PXGHitInfoObject)init
{
  uint64_t v3;
  int64x2_t v4;
  __int128 v5;
  __int128 v6;

  v5 = 0u;
  v6 = 0u;
  v3 = 0xFFFFFFFFLL;
  v4 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  return -[PXGHitInfoObject initWithHitInfo:](self, "initWithHitInfo:", &v3);
}

- (PXGHitInfoObject)initWithHitInfo:(id *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXGHitInfoObject;
  return -[PXGHitInfoObject init](&v4, sel_init, a3);
}

- ($B1B5C5B0C66BF93902DBED69AB029F5A)hitInfo
{
  return ($B1B5C5B0C66BF93902DBED69AB029F5A *)&self->_hitInfo;
}

- (int64_t)compare:(id)a3
{
  PXGHitInfoObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  v4 = objc_retainAutorelease(self);
  v5 = a3;
  v6 = -[PXGHitInfoObject hitInfo](v4, "hitInfo");
  v7 = objc_retainAutorelease(v5);
  v8 = objc_msgSend(v7, "hitInfo");

  v9 = *(double *)(v6 + 8);
  v10 = *(double *)(v8 + 8);
  if (v9 < v10)
    return -1;
  if (v9 != v10)
    return 1;
  v11 = *(double *)(v6 + 40);
  v12 = *(double *)(v8 + 40);
  if (v11 < v12)
    return -1;
  if (v11 != v12)
    return 1;
  v13 = *(double *)(v6 + 16);
  v14 = *(double *)(v8 + 16);
  if (v13 < v14)
    return -1;
  if (v13 != v14)
    return 1;
  if (*(_DWORD *)v6 > *(_DWORD *)v8)
    return -1;
  return *(_DWORD *)v6 != *(_DWORD *)v8;
}

@end
