@implementation VKTransitLineMarker

- (VKTransitLineMarker)initWithFeature:(void *)a3 transitLink:(const void *)a4
{
  char *v6;
  id v7;
  uint64_t v8;
  std::__shared_weak_count *v9;
  std::__shared_weak_count *v10;
  double v11;
  double v12;
  uint64_t v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  uint8x8_t v24;
  id v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  char *v31;
  objc_super v33;
  std::__shared_weak_count *v34;
  std::__shared_weak_count *v35;
  _QWORD v36[3];

  v36[2] = *MEMORY[0x1E0C80C00];
  v33.receiver = self;
  v33.super_class = (Class)VKTransitLineMarker;
  v6 = -[VKTransitLineMarker init](&v33, sel_init);
  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x1E0D271C0]);
    v8 = *((_QWORD *)a3 + 5);
    if (a4 && geo::codec::transitLinkFirstPoint((uint64_t)a4))
    {
      v34 = 0;
      v35 = 0;
      v9 = (std::__shared_weak_count *)*((_QWORD *)a4 + 1);
      if (v9)
      {
        v9 = std::__shared_weak_count::lock(v9);
        v10 = v9;
        v35 = v9;
        if (v9)
        {
          v9 = *(std::__shared_weak_count **)a4;
          v34 = *(std::__shared_weak_count **)a4;
        }
      }
      else
      {
        v10 = 0;
      }
      geo::codec::VectorTile::key((geo::codec::VectorTile *)v9);
      v36[0] = GEOTileKeyMake();
      v36[1] = v13;
      if (v10)
      {
        p_shared_owners = (unint64_t *)&v10->__shared_owners_;
        do
          v15 = __ldaxr(p_shared_owners);
        while (__stlxr(v15 - 1, p_shared_owners));
        if (!v15)
        {
          ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
          std::__shared_weak_count::__release_weak(v10);
        }
      }
      GEOMapRectForGEOTileKey();
      GEOCoordinate2DForMapPoint();
    }
    else
    {
      v11 = -180.0;
      v12 = -180.0;
    }
    v16 = objc_msgSend(v7, "initWithMUID:resultProviderID:coordinate:", v8, 0, v11, v12);
    v17 = (void *)*((_QWORD *)v6 + 1);
    *((_QWORD *)v6 + 1) = v16;

    *((_QWORD *)v6 + 9) = a4;
    if (geo::codec::featureGetNativeShieldCount((uint64_t)a3))
    {
      v36[0] = 0;
      v34 = 0;
      geo::codec::featureGetNativeShield((uint64_t)a3, 0, v36, (_QWORD *)v6 + 4, &v34);
      if (v36[0])
      {
        v18 = objc_alloc(MEMORY[0x1E0CB3940]);
        v19 = objc_msgSend(v18, "initWithUTF8String:", v36[0]);
        v20 = (void *)*((_QWORD *)v6 + 2);
        *((_QWORD *)v6 + 2) = v19;

      }
      if (v34)
      {
        v21 = objc_alloc(MEMORY[0x1E0CB3940]);
        v22 = objc_msgSend(v21, "initWithUTF8String:", v34);
        v23 = (void *)*((_QWORD *)v6 + 3);
        *((_QWORD *)v6 + 3) = v22;

      }
    }
    if (geo::codec::featureGetNativeLabelCount((uint64_t)a3))
    {
      v36[0] = 0;
      v34 = 0;
      geo::codec::featureGetNativeLabel((uint64_t)a3, 0, v36, &v34);
      if (v36[0])
      {
        v25 = objc_alloc(MEMORY[0x1E0CB3940]);
        v26 = objc_msgSend(v25, "initWithUTF8String:", v36[0]);
        v27 = (void *)*((_QWORD *)v6 + 7);
        *((_QWORD *)v6 + 7) = v26;

      }
      if (v34)
      {
        v28 = objc_alloc(MEMORY[0x1E0CB3940]);
        v29 = objc_msgSend(v28, "initWithUTF8String:", v34);
        v30 = (void *)*((_QWORD *)v6 + 8);
        *((_QWORD *)v6 + 8) = v29;

      }
    }
    v24.i32[0] = *((_DWORD *)a3 + 20);
    *(float32x4_t *)(v6 + 40) = vmulq_f32(vcvtq_f32_u32(vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(v24))), (float32x4_t)vdupq_n_s32(0x3B808081u));
    v31 = v6;
  }

  return (VKTransitLineMarker *)v6;
}

- (VKTransitLineMarker)initWithIdentifier:(id)a3
{
  id v5;
  VKTransitLineMarker *v6;
  VKTransitLineMarker *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VKTransitLineMarker;
  v6 = -[VKTransitLineMarker init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_identifier, a3);

  return v7;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), -[GEOMapItemIdentifier muid](self->_identifier, "muid"));
}

- (unint64_t)featureID
{
  return -[GEOMapItemIdentifier muid](self->_identifier, "muid");
}

- (GEOMapItemIdentifier)identifier
{
  return self->_identifier;
}

- (NSString)shieldText
{
  return self->_shieldText;
}

- (NSString)shieldLocale
{
  return self->_shieldLocale;
}

- (int64_t)shieldType
{
  return self->_shieldType;
}

- ($C28CD4A45FD07A4F97CC9D5F91F25271)shieldColor
{
  float r;
  float g;
  float b;
  float a;
  $C28CD4A45FD07A4F97CC9D5F91F25271 result;

  r = self->_shieldColor.r;
  g = self->_shieldColor.g;
  b = self->_shieldColor.b;
  a = self->_shieldColor.a;
  result.var3 = a;
  result.var2 = b;
  result.var1 = g;
  result.var0 = r;
  return result;
}

- (NSString)labelText
{
  return self->_labelText;
}

- (NSString)labelLocale
{
  return self->_labelLocale;
}

- (void)transitLinkID
{
  return self->_transitLinkID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelLocale, 0);
  objc_storeStrong((id *)&self->_labelText, 0);
  objc_storeStrong((id *)&self->_shieldLocale, 0);
  objc_storeStrong((id *)&self->_shieldText, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)markerWithFeature:(void *)a3 transitLink:(const void *)a4
{
  return -[VKTransitLineMarker initWithFeature:transitLink:]([VKTransitLineMarker alloc], "initWithFeature:transitLink:", a3, a4);
}

@end
