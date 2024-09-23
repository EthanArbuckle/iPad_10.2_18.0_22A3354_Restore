@implementation VKCameraRegionRestriction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapRegion, 0);
}

- (Matrix<double,)clampedPosition:()Matrix<double
{
  double v3;
  double v4;
  double v6;
  double v7;
  double v8;
  double v9;
  Matrix<double, 2, 1> result;

  v3 = a3._e[1];
  v4 = a3._e[0];
  if (!-[VKCameraRegionRestriction isEmpty](self, "isEmpty"))
  {
    for (; v4 < 0.0; v4 = v4 + 1.0)
      ;
    for (; v4 > 1.0; v4 = v4 + -1.0)
      ;
    -[VKCameraRegionRestriction clampedPosition:usingSingleRestriction:westOfDatelineRestriction:eastOfDatelineRestriction:wrapRange:](self, "clampedPosition:usingSingleRestriction:westOfDatelineRestriction:eastOfDatelineRestriction:wrapRange:", v4, v3, self->_singleRestrictionMercator._minimum._e[0], self->_singleRestrictionMercator._minimum._e[1], self->_singleRestrictionMercator._maximum._e[0], self->_singleRestrictionMercator._maximum._e[1], *(_QWORD *)&self->_westOfDatelineMercator._minimum._e[0], *(_QWORD *)&self->_westOfDatelineMercator._minimum._e[1], *(_QWORD *)&self->_westOfDatelineMercator._maximum._e[0], *(_QWORD *)&self->_westOfDatelineMercator._maximum._e[1], *(_QWORD *)&self->_eastOfDatelineMercator._minimum._e[0], *(_QWORD *)&self->_eastOfDatelineMercator._minimum._e[1], *(_QWORD *)&self->_eastOfDatelineMercator._maximum._e[0], *(_QWORD *)&self->_eastOfDatelineMercator._maximum._e[1], 0, 0x3FF0000000000000);
    v4 = v6;
    v3 = v7;
  }
  v8 = v4;
  v9 = v3;
  result._e[1] = v9;
  result._e[0] = v8;
  return result;
}

- (BOOL)isEmpty
{
  return self->_empty;
}

- (VKCameraRegionRestriction)initWithMapRegion:(id)a3
{
  id v5;
  VKCameraRegionRestriction *v6;
  VKCameraRegionRestriction *v7;
  double v8;
  double v9;
  double v10;
  int64x2_t v11;
  int64x2_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  long double v19;
  long double v20;
  long double v21;
  long double v22;
  double v23;
  long double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  long double v29;
  long double v30;
  float64x2_t v31;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  double v64;
  double v65;
  double v66;
  double v67;
  long double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  long double v73;
  long double v74;
  float64x2_t v75;
  uint64_t v77;
  uint64_t v78;
  unint64_t v79;
  float64_t v81;
  float64_t v82;
  objc_super v83;

  v5 = a3;
  v83.receiver = self;
  v83.super_class = (Class)VKCameraRegionRestriction;
  v6 = -[VKCameraRegionRestriction init](&v83, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mapRegion, a3);
    if (v5)
    {
      objc_msgSend(v5, "westLng");
      v9 = v8;
      objc_msgSend(v5, "eastLng");
      if (v9 > v10)
      {
        v11 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
        v7->_singleRestrictionMercator._minimum = (Matrix<double, 2, 1>)v11;
        v12 = vdupq_n_s64(0xFFEFFFFFFFFFFFFFLL);
        v7->_singleRestrictionMercator._maximum = (Matrix<double, 2, 1>)v12;
        v7->_singleRestrictionCoord._minimum = (Matrix<double, 2, 1>)v11;
        v7->_singleRestrictionCoord._maximum = (Matrix<double, 2, 1>)v12;
        objc_msgSend(v5, "southLat");
        v14 = v13;
        objc_msgSend(v5, "westLng");
        v16 = v15;
        objc_msgSend(v5, "northLat");
        v18 = v17;
        v19 = tan(v14 * 0.00872664626 + 0.785398163);
        v20 = log(v19) * 0.159154943 + 0.5;
        v21 = tan(v18 * 0.00872664626 + 0.785398163);
        v22 = log(v21);
        v7->_westOfDatelineMercator._minimum._e[0] = v16 * 0.00277777778 + 0.5;
        v7->_westOfDatelineMercator._minimum._e[1] = v20;
        v7->_westOfDatelineMercator._maximum._e[0] = 1.0;
        v7->_westOfDatelineMercator._maximum._e[1] = v22 * 0.159154943 + 0.5;
        objc_msgSend(v5, "southLat");
        v24 = tan(v23 * 0.00872664626 + 0.785398163);
        v25 = log(v24);
        objc_msgSend(v5, "northLat");
        v27 = v26;
        objc_msgSend(v5, "eastLng");
        v81 = v28;
        v29 = tan(v27 * 0.00872664626 + 0.785398163);
        v30 = log(v29);
        v7->_eastOfDatelineMercator._minimum._e[0] = 0.0;
        v31.f64[0] = v81;
        v31.f64[1] = v30;
        v7->_eastOfDatelineMercator._minimum._e[1] = v25 * 0.159154943 + 0.5;
        __asm { FMOV            V1.2D, #0.5 }
        v7->_eastOfDatelineMercator._maximum = (Matrix<double, 2, 1>)vmlaq_f64(_Q1, (float64x2_t)xmmword_19FFB32D0, v31);
        objc_msgSend(v5, "westLng");
        v38 = v37;
        objc_msgSend(v5, "southLat");
        v40 = v39;
        objc_msgSend(v5, "northLat");
        v7->_westOfDatelineCoord._minimum._e[0] = v38;
        v7->_westOfDatelineCoord._minimum._e[1] = v40;
        v7->_westOfDatelineCoord._maximum._e[0] = 180.0;
        v7->_westOfDatelineCoord._maximum._e[1] = v41;
        objc_msgSend(v5, "southLat");
        v43 = v42;
        objc_msgSend(v5, "eastLng");
        v45 = v44;
        objc_msgSend(v5, "northLat");
        v47 = 0xC066800000000000;
LABEL_8:
        *(_QWORD *)&v7->_eastOfDatelineCoord._minimum._e[0] = v47;
        *(_QWORD *)&v7->_eastOfDatelineCoord._minimum._e[1] = v43;
        *(_QWORD *)&v7->_eastOfDatelineCoord._maximum._e[0] = v45;
        *(_QWORD *)&v7->_eastOfDatelineCoord._maximum._e[1] = v46;
        goto LABEL_9;
      }
      objc_msgSend(v5, "southLat");
      v65 = v64;
      objc_msgSend(v5, "westLng");
      v67 = v66;
      v68 = tan(v65 * 0.00872664626 + 0.785398163);
      v69 = log(v68);
      objc_msgSend(v5, "northLat");
      v71 = v70;
      objc_msgSend(v5, "eastLng");
      v82 = v72;
      v73 = tan(v71 * 0.00872664626 + 0.785398163);
      v74 = log(v73);
      v75.f64[0] = v82;
      v75.f64[1] = v74;
      v7->_singleRestrictionMercator._minimum._e[0] = v67 * 0.00277777778 + 0.5;
      v7->_singleRestrictionMercator._minimum._e[1] = v69 * 0.159154943 + 0.5;
      __asm { FMOV            V1.2D, #0.5 }
      v7->_singleRestrictionMercator._maximum = (Matrix<double, 2, 1>)vmlaq_f64(_Q1, (float64x2_t)xmmword_19FFB32D0, v75);
      objc_msgSend(v5, "westLng");
      v60 = v77;
      objc_msgSend(v5, "southLat");
      v62 = v78;
      objc_msgSend(v5, "eastLng");
      v57 = v79;
      objc_msgSend(v5, "northLat");
      v48 = 96;
      v49 = 88;
      v50 = 80;
      v51 = 72;
      v52 = 64;
      v53 = 56;
      v54 = 48;
      v55 = 40;
      v56 = 128;
      v58 = 120;
      v59 = 112;
      v61 = 104;
    }
    else
    {
      v7->_empty = 1;
      v7->_singleRestrictionMercator._minimum = (Matrix<double, 2, 1>)vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
      v48 = 128;
      v49 = 120;
      v50 = 112;
      v51 = 104;
      v52 = 96;
      v53 = 88;
      v54 = 80;
      v55 = 72;
      v7->_singleRestrictionMercator._maximum = (Matrix<double, 2, 1>)vdupq_n_s64(0xFFEFFFFFFFFFFFFFLL);
      v56 = 64;
      v57 = 0xFFEFFFFFFFFFFFFFLL;
      v58 = 56;
      v59 = 48;
      v60 = 0x7FEFFFFFFFFFFFFFLL;
      v61 = 40;
      v62 = 0x7FEFFFFFFFFFFFFFLL;
      v63 = 0xFFEFFFFFFFFFFFFFLL;
    }
    *(Class *)((char *)&v7->super.isa + v61) = (Class)v60;
    *(Class *)((char *)&v7->super.isa + v59) = (Class)v62;
    *(Class *)((char *)&v7->super.isa + v58) = (Class)v57;
    *(Class *)((char *)&v7->super.isa + v56) = (Class)v63;
    *(Class *)((char *)&v7->super.isa + v55) = (Class)0x7FEFFFFFFFFFFFFFLL;
    *(Class *)((char *)&v7->super.isa + v54) = (Class)0x7FEFFFFFFFFFFFFFLL;
    *(Class *)((char *)&v7->super.isa + v53) = (Class)0xFFEFFFFFFFFFFFFFLL;
    *(Class *)((char *)&v7->super.isa + v52) = (Class)0xFFEFFFFFFFFFFFFFLL;
    *(Class *)((char *)&v7->super.isa + v51) = (Class)0x7FEFFFFFFFFFFFFFLL;
    *(Class *)((char *)&v7->super.isa + v50) = (Class)0x7FEFFFFFFFFFFFFFLL;
    *(Class *)((char *)&v7->super.isa + v49) = (Class)0xFFEFFFFFFFFFFFFFLL;
    *(Class *)((char *)&v7->super.isa + v48) = (Class)0xFFEFFFFFFFFFFFFFLL;
    v7->_westOfDatelineCoord._minimum = (Matrix<double, 2, 1>)vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    v7->_westOfDatelineCoord._maximum = (Matrix<double, 2, 1>)vdupq_n_s64(0xFFEFFFFFFFFFFFFFLL);
    v45 = 0xFFEFFFFFFFFFFFFFLL;
    v47 = 0x7FEFFFFFFFFFFFFFLL;
    v43 = 0x7FEFFFFFFFFFFFFFLL;
    v46 = 0xFFEFFFFFFFFFFFFFLL;
    goto LABEL_8;
  }
LABEL_9:

  return v7;
}

- (BOOL)containsCoordinate:(id)a3
{
  double var1;
  double var0;
  double v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;
  BOOL v12;

  var1 = a3.var1;
  var0 = a3.var0;
  if (-[VKCameraRegionRestriction isEmpty](self, "isEmpty"))
    return 1;
  v7 = self->_singleRestrictionCoord._maximum._e[0];
  v8 = self->_singleRestrictionCoord._minimum._e[0];
  if (v7 >= v8
    && (v9 = self->_singleRestrictionCoord._maximum._e[1], v10 = self->_singleRestrictionCoord._minimum._e[1], v9 >= v10))
  {
    v11 = var1 >= v8;
    if (var1 >= v7)
      v11 = 0;
    if (var0 < v10)
      v11 = 0;
    v12 = var0 < v9;
  }
  else
  {
    if (var1 >= self->_westOfDatelineCoord._minimum._e[0]
      && var1 < self->_westOfDatelineCoord._maximum._e[0]
      && var0 >= self->_westOfDatelineCoord._minimum._e[1]
      && var0 < self->_westOfDatelineCoord._maximum._e[1])
    {
      return 1;
    }
    if (var1 < self->_eastOfDatelineCoord._minimum._e[0]
      || var1 >= self->_eastOfDatelineCoord._maximum._e[0]
      || var0 < self->_eastOfDatelineCoord._minimum._e[1])
    {
      return 0;
    }
    v12 = var0 < self->_eastOfDatelineCoord._maximum._e[1];
    v11 = 1;
  }
  return v12 && v11;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)clampedCoordinate:(id)a3
{
  double var1;
  double var0;
  double v6;
  double v7;
  double v8;
  double v9;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  var1 = a3.var1;
  var0 = a3.var0;
  if (!-[VKCameraRegionRestriction isEmpty](self, "isEmpty"))
  {
    -[VKCameraRegionRestriction clampedPosition:usingSingleRestriction:westOfDatelineRestriction:eastOfDatelineRestriction:wrapRange:](self, "clampedPosition:usingSingleRestriction:westOfDatelineRestriction:eastOfDatelineRestriction:wrapRange:", var1, var0, self->_singleRestrictionCoord._minimum._e[0], self->_singleRestrictionCoord._minimum._e[1], self->_singleRestrictionCoord._maximum._e[0], self->_singleRestrictionCoord._maximum._e[1], *(_QWORD *)&self->_westOfDatelineCoord._minimum._e[0], *(_QWORD *)&self->_westOfDatelineCoord._minimum._e[1], *(_QWORD *)&self->_westOfDatelineCoord._maximum._e[0], *(_QWORD *)&self->_westOfDatelineCoord._maximum._e[1], *(_QWORD *)&self->_eastOfDatelineCoord._minimum._e[0], *(_QWORD *)&self->_eastOfDatelineCoord._minimum._e[1], *(_QWORD *)&self->_eastOfDatelineCoord._maximum._e[0], *(_QWORD *)&self->_eastOfDatelineCoord._maximum._e[1], 0xC066800000000000, 0x4066800000000000);
    var1 = v6;
    var0 = v7;
  }
  v8 = var0;
  v9 = var1;
  result.var1 = v9;
  result.var0 = v8;
  return result;
}

- (void)clampedPosition:(double)a3 usingSingleRestriction:(double)a4 westOfDatelineRestriction:(double)a5 eastOfDatelineRestriction:(double)a6 wrapRange:(double)a7
{
  double v25;
  double v26;
  long double v27;
  long double v28;
  long double v29;

  if (a5 >= a3 && a6 >= a4 && (a1 < a3 || (a1 >= a5 || a2 < a4 || a2 >= a6) && a1 > a5))
  {
    v25 = a17 + (a18 + a17) * -0.5;
    v26 = v25 + a1;
    v27 = a18 - a17;
    v28 = fmod(a3 - (v25 + a1), a18 - a17);
    fabs(fmod(v28 + v27, v27) + v25);
    v29 = fmod(a5 - v26, a18 - a17);
    fmod(v29 + v27, v27);
  }
}

- (Matrix<double,)clampedPositionForOrigin:()Matrix<double delta:()2
{
  double v4;
  double v5;
  double v6;
  double v8;
  double v9;
  Matrix<double, 2, 1> maximum;
  double v11;
  double v12;
  double v13;
  double v14;
  double v20;
  double v21;
  double v22;
  double v23;
  Matrix<double, 2, 1> minimum;
  float64x2_t v25;
  float64x2_t v26;
  double v27;
  double v31;
  Matrix<double, 2, 1> result;

  v4 = a4._e[0];
  v5 = a3._e[1];
  v6 = a3._e[0];
  v8 = a4._e[0] + a3._e[0];
  v9 = a4._e[1] + a3._e[1];
  if (-[VKCameraRegionRestriction isEmpty](self, "isEmpty"))
    goto LABEL_2;
  v11 = self->_singleRestrictionMercator._minimum._e[0];
  v12 = self->_singleRestrictionMercator._minimum._e[1];
  v14 = self->_singleRestrictionMercator._maximum._e[0];
  v13 = self->_singleRestrictionMercator._maximum._e[1];
  if (v14 >= v11 && v13 >= v12 && v6 >= v11 && v6 <= v14 && v5 >= v12 && v5 <= v13)
  {
    maximum._e[0] = fmin(fmax(v8, v11), v14);
    v9 = fmin(fmax(v9, v12), v13);
    goto LABEL_40;
  }
  v20 = self->_westOfDatelineMercator._minimum._e[0];
  v21 = self->_westOfDatelineMercator._minimum._e[1];
  v22 = self->_westOfDatelineMercator._maximum._e[0];
  v23 = self->_westOfDatelineMercator._maximum._e[1];
  minimum = self->_eastOfDatelineMercator._minimum;
  v25.f64[0] = v23;
  v25.f64[1] = v22;
  maximum = self->_eastOfDatelineMercator._maximum;
  v26.f64[0] = v21;
  v26.f64[1] = v20;
  if ((vmaxv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vcgtq_f64(v26, v25), (int32x4_t)vcgtq_f64((float64x2_t)minimum, (float64x2_t)maximum))), 0xFuLL))) & 1) != 0)
  {
LABEL_20:
    -[VKCameraRegionRestriction clampedPosition:](self, "clampedPosition:", v8, v9);
    v9 = v27;
    goto LABEL_40;
  }
  v9 = fmin(fmax(v9, v21), v23);
  if (v6 >= v20 && v6 <= v22 && v5 >= v21 && v5 <= v23)
  {
    if (v4 < 0.0 && v8 < v20)
      goto LABEL_43;
    if (v4 <= 0.0 || v22 >= v8)
    {
LABEL_2:
      maximum._e[0] = v8;
      goto LABEL_40;
    }
    if (v8 + -1.0 < maximum._e[0])
      maximum._e[0] = v8 + -1.0;
  }
  else
  {
    if (v6 < minimum._e[0] || v6 > maximum._e[0] || v5 < minimum._e[1] || v5 > maximum._e[1])
      goto LABEL_20;
    if (v4 < 0.0 && v8 < minimum._e[0])
    {
      maximum._e[0] = v8 + 1.0;
      if (v20 < v8 + 1.0)
        goto LABEL_40;
LABEL_43:
      maximum._e[0] = self->_westOfDatelineMercator._minimum._e[0];
      goto LABEL_40;
    }
    if (maximum._e[0] >= v8 || v4 <= 0.0)
      maximum._e[0] = v8;
  }
LABEL_40:
  v31 = v9;
  result._e[0] = maximum._e[0];
  result._e[1] = v31;
  return result;
}

- (void)radianSingleRect:(void *)a3 westOfDatelineRect:(void *)a4 eastOfDatelineRect:(void *)a5
{
  float64x2_t v5;
  float64x2_t v6;
  float64x2_t v7;
  float64x2_t v8;
  float64x2_t v9;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v13;

  if (a3)
  {
    v5 = (float64x2_t)vdupq_n_s64(0x3F91DF46A2529D39uLL);
    v6 = vmulq_f64((float64x2_t)self->_singleRestrictionCoord._minimum, v5);
    v7 = vmulq_f64((float64x2_t)self->_singleRestrictionCoord._maximum, v5);
    *(float64x2_t *)a3 = v6;
    *((float64x2_t *)a3 + 1) = v7;
  }
  if (a4)
  {
    v8 = (float64x2_t)vdupq_n_s64(0x3F91DF46A2529D39uLL);
    v9 = vmulq_f64((float64x2_t)self->_westOfDatelineCoord._minimum, v8);
    v10 = vmulq_f64((float64x2_t)self->_westOfDatelineCoord._maximum, v8);
    *(float64x2_t *)a4 = v9;
    *((float64x2_t *)a4 + 1) = v10;
  }
  if (a5)
  {
    v11 = (float64x2_t)vdupq_n_s64(0x3F91DF46A2529D39uLL);
    v12 = vmulq_f64((float64x2_t)self->_eastOfDatelineCoord._minimum, v11);
    v13 = vmulq_f64((float64x2_t)self->_eastOfDatelineCoord._maximum, v11);
    *(float64x2_t *)a5 = v12;
    *((float64x2_t *)a5 + 1) = v13;
  }
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  GEOMapRegion *mapRegion;
  GEOMapRegion *v7;
  void *v8;
  char v9;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    mapRegion = self->_mapRegion;
    v7 = mapRegion;
    if (!mapRegion)
    {
      objc_msgSend(v5, "mapRegion");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v3)
      {
        v9 = 1;
LABEL_9:

        goto LABEL_10;
      }
      v7 = self->_mapRegion;
    }
    objc_msgSend(v5, "mapRegion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[GEOMapRegion isEqual:](v7, "isEqual:", v8);

    if (!mapRegion)
      goto LABEL_9;
  }
  else
  {
    v9 = 0;
  }
LABEL_10:

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  GEOMapRegion *mapRegion;
  void *v5;
  id v6;

  v6 = a3;
  mapRegion = self->_mapRegion;
  if (mapRegion)
  {
    -[GEOMapRegion data](mapRegion, "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("VKCameraRegionRestrictionMapRegion"));

  }
}

- (VKCameraRegionRestriction)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  VKCameraRegionRestriction *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("VKCameraRegionRestrictionMapRegion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D27208]), "initWithData:", v5);
  else
    v6 = 0;
  v7 = -[VKCameraRegionRestriction initWithMapRegion:](self, "initWithMapRegion:", v6);

  return v7;
}

- (GEOMapRegion)mapRegion
{
  return self->_mapRegion;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
