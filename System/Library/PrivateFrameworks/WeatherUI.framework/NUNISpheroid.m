@implementation NUNISpheroid

- (NUNISpheroid)initWithScene:(id)a3 parent:(id)a4 type:(unint64_t)a5
{
  id v8;
  id v9;
  NUNISpheroid *v10;
  NUNISpheroid *v11;
  id v12;
  id v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  float v22;
  float v23;
  float v24;
  float v25;
  objc_super v27;

  v8 = a3;
  v9 = a4;
  v27.receiver = self;
  v27.super_class = (Class)NUNISpheroid;
  v10 = -[NUNISpheroid init](&v27, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_parent, a4);
    v12 = objc_storeWeak((id *)&v11->_scene, v8);
    v11->_structure.type = a5;
    *(_QWORD *)&v11->_anon_30[88] = 1;
    *(_DWORD *)&v11->_anon_30[56] = 1065353216;
    *(_QWORD *)&v11->_anon_30[32] = 0;
    *(_QWORD *)&v11->_anon_30[40] = 0;
    v11->_structure.distanceScale = 1.0;
    __asm { FMOV            V0.2S, #1.0 }
    *(_QWORD *)&v11->_anon_30[16] = _D0;
    v11->_anon_30[120] = 1;
    *(_OWORD *)v11->_anon_30 = xmmword_1B000C980;
    v18 = v12;
    v19 = objc_msgSend(v8, "collectionType");

    *(float *)&v11->_anon_30[52] = _NUNISphereoidComputeRadius(a5, v19);
    if (((1 << a5) & 0xFBF3FE) != 0)
    {
      v20 = a5;
      if (((1 << a5) & 0xFFC000) != 0)
      {
        v20 = a5 - 14;
        *(_QWORD *)&v11->_anon_30[88] = 1;
        *(_QWORD *)&v11->_anon_30[96] = a5 - 13;
        v11->_anon_30[121] = 1;
        *(_DWORD *)&v11->_anon_30[16] = 0;
      }
      v21 = 7;
      if (((1 << a5) & 0x3000) == 0)
        v21 = v20;
      if ((v21 & 0xFFFFFFFFFFFFFFFBLL) != 0)
      {
        v22 = s_distance[v21];
        if (v19)
        {
          v23 = (float)(v22 * 10.0) + 3.0;
          v24 = 48.0;
        }
        else
        {
          v23 = (float)(v22 * 18.0) + 4.0;
          v24 = 156.0;
        }
        v25 = (float)(v23 / v24) * 0.5;
      }
      else
      {
        v25 = 0.0;
      }
      v11->_structure.distance = v25;
      if ((uint64_t)a5 > 11)
      {
        if (a5 - 12 < 2)
        {
          *(_QWORD *)&v11->_anon_30[88] = 1;
          *(_QWORD *)&v11->_anon_30[96] = a5 - 1;
        }
      }
      else if (a5)
      {
        if (a5 == 3)
        {
          *(_QWORD *)&v11->_anon_30[88] = 0;
        }
        else if (a5 == 4)
        {
          *(_QWORD *)&v11->_anon_30[88] = 2;
        }
      }
      else
      {
        *(int64x2_t *)&v11->_anon_30[88] = vdupq_n_s64(1uLL);
        v11->_anon_30[121] = 1;
        v11->_structure.distance = 0.0;
      }
    }
    else
    {
      if (a5 != 11 && a5 != 10)
        -[NUNISpheroid initWithScene:parent:type:].cold.1();
      *(_OWORD *)&v11->_anon_30[64] = xmmword_1B0024860;
      *(_OWORD *)&v11->_anon_30[88] = xmmword_1B0024870;
    }
  }

  return v11;
}

- (void)_updatePositionFromAngle
{
  NUNISpheroid *parent;
  __int128 v4;
  float32x2_t v5;
  unint64_t v6;
  float32x4_t v7;

  parent = self->_parent;
  if (parent)
    -[NUNISpheroid position](parent, "position");
  else
    v4 = xmmword_1B0024860;
  v7 = (float32x4_t)v4;
  v5 = vmul_n_f32((float32x2_t)__sincosf_stret(self->_structure.angle), self->_structure.distance * self->_structure.distanceScale);
  LODWORD(v6) = v5.i32[1];
  *((float *)&v6 + 1) = -v5.f32[0];
  *(float32x4_t *)&self->_anon_30[64] = vaddq_f32(v7, (float32x4_t)v6);
  -[NUNISpheroid _updateCamera](self, "_updateCamera");
}

- (void)date:(NUNISpheroid *)self toCameraPosition:(SEL)a2 toCameraTarget:(id)a3
{
  float32x4_t *v3;
  float32x4_t *v4;
  float32x4_t *v5;
  float32x4_t *v6;
  id v8;
  float32x4_t v9;
  float32x2_t v10;
  unint64_t v11;
  id WeakRetained;
  float32x2_t *v13;
  __n128 v14;
  float32x4_t v15;
  float32x4_t v16;
  uint64_t v17;
  uint64_t v18;
  float v19;
  float v20;

  v5 = v4;
  v6 = v3;
  v20 = 0.0;
  v19 = 0.0;
  v17 = 0;
  v18 = 0;
  v8 = a3;
  -[NUNISpheroid date:toEquatorRotation:toAngle:toLight:toDistance:toRadius:](self, "date:toEquatorRotation:toAngle:toLight:toDistance:toRadius:", v8, &v20, &v19, &v17, (char *)&v18 + 4, &v18);
  *(double *)v9.i64 = NUNIComputeSpheroidParentPosition(self->_parent, v8);
  v15 = v9;

  v10 = vmul_n_f32((float32x2_t)__sincosf_stret(v19), *((float *)&v18 + 1));
  LODWORD(v11) = v10.i32[1];
  *((float *)&v11 + 1) = -v10.f32[0];
  v16 = vaddq_f32(v15, (float32x4_t)v11);
  WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  v13 = (float32x2_t *)objc_msgSend(WeakRetained, "structure");

  v14 = NUNIComputeCameraView(self->_structure.type, *(_QWORD *)&vadd_f32(*(float32x2_t *)&self->_anon_30[104], v13[13]), v20);
  *v6 = vmlaq_n_f32(v16, vmulq_n_f32(vnegq_f32((float32x4_t)v14), *(float *)&v18), v13[6].f32[0]);
  *v5 = v16;
}

- (void)date:(id)a3 toEquatorRotation:(float *)a4 toAngle:(float *)a5 toLight:toDistance:toRadius:
{
  _QWORD *v5;
  float *v6;
  float *v7;
  float *v8;
  float *v9;
  _QWORD *v10;
  id v14;
  id WeakRetained;
  uint64_t v16;
  unint64_t type;
  unint64_t v18;
  uint64_t v19;
  float v20;
  void *v21;
  double v22;
  float v23;
  float v24;
  float v25;
  void *v26;
  float v27;
  float v28;
  float v29;
  unsigned int v30;
  double *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  float v37;
  simd_float4 v38;
  simd_float4 v39;
  simd_float4 v40;
  simd_float4 v41;
  simd_float4 v42;
  simd_float4 v43;
  simd_float4 v44;
  simd_float4 v45;
  simd_float4 v46;
  simd_float4 v47;
  simd_float4 v48;
  simd_float4 v49;
  simd_float4 v50;
  simd_float4 v51;
  simd_float4 v52;
  simd_float4 v53;
  simd_float4 v54;
  simd_float4 v55;
  simd_float4 v56;
  simd_float4 v57;
  simd_float4 v58;
  simd_float4 v59;
  simd_float4 v60;
  simd_float4 v61;
  float32x4_t v62;
  float32x4_t v63;
  float32x4_t v64;
  float32x4_t v65;
  double v66;
  __int32 v67;
  simd_float4 v68;
  simd_float4 v69;
  simd_float4 v70;
  simd_float4 v71;
  simd_float4 v72;
  simd_float4 v73;
  simd_float4 v74;
  simd_float4 v75;
  simd_float4 v76;
  simd_float4 v77;
  simd_float4 v78;
  simd_float4 v79;
  double v80;
  double v81;
  double v82;
  simd_float4x4 v83;
  simd_float4x4 v84;
  simd_float4x4 v85;
  simd_float4x4 v86;
  simd_float4x4 v87;
  simd_float4x4 v88;

  v8 = v7;
  v9 = v6;
  v10 = v5;
  v14 = a3;
  *v9 = 0.0;
  *a5 = 0.0;
  *a4 = 0.0;
  *v10 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  v16 = objc_msgSend(WeakRetained, "collectionType");

  type = self->_structure.type;
  *v8 = _NUNISphereoidComputeRadius(type, v16);
  if (((1 << type) & 0xFBF3FE) != 0)
  {
    v18 = type - 14;
    if (((1 << type) & 0xFFC000) == 0)
      v18 = type;
    if (((1 << type) & 0x3000) != 0)
      v19 = 7;
    else
      v19 = v18;
    v20 = 0.0;
    if (v19)
    {
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D27550]), "initWithDate:body:", v14, v19);
      objc_msgSend(v21, "longitude");
      *(float *)&v22 = v22;
      *a5 = (float)(*(float *)&v22 * 3.1416) / 180.0;

      if ((v19 & 0xFFFFFFFFFFFFFFFBLL) != 0)
      {
        v23 = s_distance[v19];
        if (v16)
        {
          v24 = (float)(v23 * 10.0) + 3.0;
          v25 = 48.0;
        }
        else
        {
          v24 = (float)(v23 * 18.0) + 4.0;
          v25 = 156.0;
        }
        v20 = (float)(v24 / v25) * 0.5;
      }
    }
    *v9 = v20;
    if (type == 3)
    {
      v26 = (void *)objc_opt_new();
      v81 = 0.0;
      v82 = 0.0;
      v80 = 0.0;
      objc_msgSend(v26, "calculateGeocentricDirectionForSunX:Y:Z:date:", &v82, &v81, &v80, v14);
      v27 = v82;
      v28 = v81;
      v29 = v80;
      *(float *)&v30 = 1.5708 - atan2f(v28, v27);
      *v10 = __PAIR64__(COERCE_UNSIGNED_INT(acosf(v29)), v30);

    }
    else if (type == 4)
    {
      *a4 = *a5;
    }
    else if (type - 1 <= 8)
    {
      v31 = (double *)((char *)&date_toEquatorRotation_toAngle_toLight_toDistance_toRadius__orientations + 32 * type);
      v32 = *v31;
      v33 = v31[1];
      v34 = v31[2];
      v35 = v31[3];
      objc_msgSend(v14, "timeIntervalSince1970");
      v37 = fmod(v34 + v35 * (v36 / 86400.0 + 2440587.5 + -2451545.0), 360.0);
      *(double *)v38.i64 = UMFloat4x4MakeRotateZ(v37 * -0.017453);
      v74 = v39;
      v77 = v38;
      v68 = v41;
      v71 = v40;
      v38.f32[0] = (90.0 - v33) * -0.0174532924;
      *(double *)v42.i64 = UMFloat4x4MakeRotateX(v38.f32[0]);
      v86.columns[0] = v42;
      v86.columns[1] = v43;
      v86.columns[2] = v44;
      v86.columns[3] = v45;
      v83.columns[1] = v74;
      v83.columns[0] = v77;
      v83.columns[3] = v68;
      v83.columns[2] = v71;
      *(double *)v46.i64 = UMMul(v83, v86);
      v75 = v47;
      v78 = v46;
      v69 = v49;
      v72 = v48;
      v46.f32[0] = (v32 + -90.0) * -0.0174532924;
      *(double *)v50.i64 = UMFloat4x4MakeRotateZ(v46.f32[0]);
      v87.columns[0] = v50;
      v87.columns[1] = v51;
      v87.columns[2] = v52;
      v87.columns[3] = v53;
      v84.columns[1] = v75;
      v84.columns[0] = v78;
      v84.columns[3] = v69;
      v84.columns[2] = v72;
      *(double *)v54.i64 = UMMul(v84, v87);
      v76 = v55;
      v79 = v54;
      v70 = v57;
      v73 = v56;
      *(double *)v58.i64 = UMFloat4x4MakeRotateX(-0.40911);
      v88.columns[0] = v58;
      v88.columns[1] = v59;
      v88.columns[2] = v60;
      v88.columns[3] = v61;
      v85.columns[1] = v76;
      v85.columns[0] = v79;
      v85.columns[3] = v70;
      v85.columns[2] = v73;
      *(double *)v62.i64 = UMMul(v85, v88);
      v66 = UMMul(v62, v63, v64, v65, (float32x4_t)xmmword_1B0024880);
      v76.i32[2] = v67;
      v79.f32[0] = atan2f(*((float *)&v66 + 1), *(float *)&v66) + 0.0;
      *v10 = __PAIR64__(COERCE_UNSIGNED_INT(acosf(v76.f32[2])), v79.u32[0]);
    }
  }

}

- (void)updateSunLocationForDate:(id)a3
{
  if (((1 << LODWORD(self->_structure.type)) & 0xFBF3FE) != 0)
  {
    -[NUNISpheroid date:toEquatorRotation:toAngle:toLight:toDistance:toRadius:](self, "date:toEquatorRotation:toAngle:toLight:toDistance:toRadius:", a3, &self->_structure.equatorRotation, &self->_structure.angle, &self->_anon_30[80], &self->_structure.distance, &self->_anon_30[52]);
    -[NUNISpheroid _updatePositionFromAngle](self, "_updatePositionFromAngle");
  }
}

- (double)animatedFloatForKey:(uint64_t)a3
{
  __int128 v3;
  const float *v4;

  switch(a3)
  {
    case 0:
      v3 = *(_OWORD *)(a1 + 112);
      return *(double *)&v3;
    case 1:
      v4 = (const float *)(a1 + 36);
      goto LABEL_14;
    case 2:
      v3 = *(_OWORD *)(a1 + 48);
      return *(double *)&v3;
    case 3:
      *(_QWORD *)&v3 = *(_QWORD *)(a1 + 128);
      return *(double *)&v3;
    case 4:
      v4 = (const float *)(a1 + 24);
      goto LABEL_14;
    case 5:
      v4 = (const float *)(a1 + 100);
      goto LABEL_14;
    case 6:
      v4 = (const float *)(a1 + 104);
      goto LABEL_14;
    case 7:
      v4 = (const float *)(a1 + 32);
      goto LABEL_14;
    case 8:
      v4 = (const float *)(a1 + 64);
      goto LABEL_14;
    case 9:
      *(_QWORD *)&v3 = *(_QWORD *)(a1 + 160);
      return *(double *)&v3;
    case 10:
      v4 = (const float *)(a1 + 96);
      goto LABEL_14;
    case 11:
      v4 = (const float *)(a1 + 68);
LABEL_14:
      *(_QWORD *)&v3 = vld1q_dup_f32(v4).u64[0];
      break;
    default:
      *(_QWORD *)&v3 = 0;
      break;
  }
  return *(double *)&v3;
}

- (void)setAnimatedFloat:(unint64_t)a3 forKey:
{
  __int128 v3;
  float v4;

  switch(a3)
  {
    case 0uLL:
      *(_OWORD *)&self->_anon_30[64] = v3;
      return;
    case 1uLL:
      LODWORD(self->_structure.equatorRotation) = v3;
      goto LABEL_4;
    case 2uLL:
      *(_OWORD *)self->_anon_30 = v3;
      return;
    case 3uLL:
      *(_QWORD *)&self->_anon_30[80] = v3;
      return;
    case 4uLL:
      LODWORD(self->_structure.distance) = v3;
      goto LABEL_4;
    case 5uLL:
      *(_DWORD *)&self->_anon_30[52] = v3;
      return;
    case 6uLL:
      v4 = *((float *)&v3 + 1);
      if (*(float *)&v3 > *((float *)&v3 + 1))
        v4 = *(float *)&v3;
      LODWORD(v3) = DWORD2(v3);
      if (v4 > *((float *)&v3 + 2))
        *(float *)&v3 = v4;
      *(_DWORD *)&self->_anon_30[56] = v3;
      return;
    case 7uLL:
      LODWORD(self->_structure.angle) = v3;
LABEL_4:
      -[NUNISpheroid _updatePositionFromAngle](self, "_updatePositionFromAngle");
      break;
    case 8uLL:
      *(_DWORD *)&self->_anon_30[16] = v3;
      break;
    case 9uLL:
      *(_QWORD *)&self->_anon_30[112] = v3;
      -[NUNISpheroid _updateCamera](self, "_updateCamera");
      break;
    case 0xAuLL:
      *(_DWORD *)&self->_anon_30[48] = v3;
      break;
    case 0xBuLL:
      *(_DWORD *)&self->_anon_30[20] = v3;
      break;
    default:
      return;
  }
}

- (void)setCenterCoordinate:(CLLocationCoordinate2D)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  double longitude;
  double latitude;
  id WeakRetained;
  NUNIAnimation *v9;
  unsigned int v10;
  unsigned int v11;
  NUNIAnimation *v12;
  float v13;
  float v14;
  id v15;

  v4 = a4;
  longitude = a3.longitude;
  latitude = a3.latitude;
  WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  v15 = WeakRetained;
  if (v4)
  {
    v9 = [NUNIAnimation alloc];
    *(float *)&v10 = longitude;
    *(float *)&v11 = latitude;
    v12 = -[NUNIAnimation initWithAnimatable:value:key:](v9, "initWithAnimatable:value:key:", self, 9, COERCE_DOUBLE(__PAIR64__(v11, v10)));
    objc_msgSend(v15, "addAnimation:", v12);

  }
  else
  {
    objc_msgSend(WeakRetained, "removeAllAnimationsFor:withKeys:", self, 512);

    v13 = longitude;
    v14 = latitude;
    *(float *)&self->_anon_30[112] = v13;
    *(float *)&self->_anon_30[116] = v14;
    -[NUNISpheroid _updateCamera](self, "_updateCamera");
  }
}

- (void)_updateCamera
{
  NUNIScene **p_scene;
  NUNISpheroid *v4;
  id v5;
  char v6;
  id v7;
  float v8;
  float v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  float v14;
  float32x4_t v15;
  double v16;
  id WeakRetained;
  __n128 v18;

  p_scene = &self->_scene;
  WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  objc_msgSend(WeakRetained, "focus");
  v4 = (NUNISpheroid *)objc_claimAutoreleasedReturnValue();
  if (v4 == self)
  {
    v5 = objc_loadWeakRetained((id *)p_scene);
    v6 = objc_msgSend(v5, "isAnimating:forKeys:", v5, 15);

    if ((v6 & 1) != 0)
      return;
    v18 = NUNIComputeCameraView(self->_structure.type, *(_QWORD *)&self->_anon_30[112], self->_structure.equatorRotation);
    v14 = *(float *)&self->_anon_30[52];
    v15 = *(float32x4_t *)&self->_anon_30[64];
    v7 = objc_loadWeakRetained((id *)p_scene);
    objc_msgSend(v7, "cameraOrbit");
    *(_QWORD *)&v16 = vmlaq_n_f32(v15, vmulq_n_f32(vnegq_f32((float32x4_t)v18), v14), v8).u64[0];

    v9 = 0.0;
    if (self->_structure.type == 4)
    {
      v10 = objc_loadWeakRetained((id *)p_scene);
      objc_msgSend(v10, "spheroidOfType:", 3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "homeCoordinate");
      *(float *)&v12 = v12;
      if (*(float *)&v12 >= 0.0)
        v9 = 0.0;
      else
        v9 = 3.1416;

    }
    WeakRetained = objc_loadWeakRetained((id *)p_scene);
    *(float *)&v13 = v9;
    objc_msgSend(WeakRetained, "setCamera:target:up:roll:", v16, *(double *)&self->_anon_30[64], 0.0, v13);
  }
  else
  {

  }
}

- (unint64_t)type
{
  return self->_structure.type;
}

- (float)blend
{
  return *(float *)&self->_anon_30[48];
}

- (float)radius
{
  return *(float *)&self->_anon_30[52];
}

- (__n128)position
{
  return a1[7];
}

- (double)light
{
  return *(double *)(a1 + 128);
}

- (unint64_t)programType
{
  return *(_QWORD *)&self->_anon_30[88];
}

- (unint64_t)spriteType
{
  return *(_QWORD *)&self->_anon_30[96];
}

- (const)structure
{
  return &self->_structure;
}

- (float)distance
{
  return self->_structure.distance;
}

- (float)distanceScale
{
  return self->_structure.distanceScale;
}

- (float)angle
{
  return self->_structure.angle;
}

- (float)equatorRotation
{
  return self->_structure.equatorRotation;
}

- (float)opacity
{
  return *(float *)&self->_anon_30[16];
}

- (float)cloudOpacity
{
  return *(float *)&self->_anon_30[20];
}

- (float)radiusScale
{
  return *(float *)&self->_anon_30[56];
}

- (__n128)colorize
{
  return a1[5];
}

- (__n128)orientation
{
  return a1[3];
}

- (CLLocationCoordinate2D)homeCoordinate
{
  double v2;
  double v3;
  CLLocationCoordinate2D result;

  v2 = *(float *)&self->_anon_30[108];
  v3 = *(float *)&self->_anon_30[104];
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

- (CLLocationCoordinate2D)centerCoordinate
{
  double v2;
  double v3;
  CLLocationCoordinate2D result;

  v2 = *(float *)&self->_anon_30[116];
  v3 = *(float *)&self->_anon_30[112];
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

- (BOOL)isVisible
{
  return self->_anon_30[120];
}

- (BOOL)isFacing
{
  return self->_anon_30[121];
}

- (void)setDistance:(float)a3
{
  self->_structure.distance = a3;
}

- (void)setAngle:(float)a3
{
  self->_structure.angle = a3;
}

- (void)setEquatorRotation:(float)a3
{
  self->_structure.equatorRotation = a3;
}

- (void)setOpacity:(float)a3
{
  *(float *)&self->_anon_30[16] = a3;
}

- (void)setCloudOpacity:(float)a3
{
  *(float *)&self->_anon_30[20] = a3;
}

- (void)setRadiusScale:(float)a3
{
  *(float *)&self->_anon_30[56] = a3;
}

- (void)setColorize:(NUNISpheroid *)self
{
  __int128 v2;

  *(_OWORD *)&self->_anon_30[32] = v2;
}

- (__n128)setOrientation:(__n128 *)result
{
  result[3] = a2;
  return result;
}

- (void)setHomeCoordinate:(CLLocationCoordinate2D)a3
{
  float longitude;
  float latitude;

  longitude = a3.longitude;
  latitude = a3.latitude;
  *(float *)&self->_anon_30[104] = longitude;
  *(float *)&self->_anon_30[108] = latitude;
}

- (void)setVisible:(BOOL)a3
{
  self->_anon_30[120] = a3;
}

- (void)setFacing:(BOOL)a3
{
  self->_anon_30[121] = a3;
}

- (void)setDistanceScale:(float)a3
{
  self->_structure.distanceScale = a3;
  -[NUNISpheroid _updatePositionFromAngle](self, "_updatePositionFromAngle");
}

- (void)setCenterCoordinate:(CLLocationCoordinate2D)a3
{
  -[NUNISpheroid setCenterCoordinate:animated:](self, "setCenterCoordinate:animated:", 0, a3.latitude, a3.longitude);
}

- (NUNIScene)scene
{
  return (NUNIScene *)objc_loadWeakRetained((id *)&self->_scene);
}

- (NUNISpheroid)parent
{
  return self->_parent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parent, 0);
  objc_destroyWeak((id *)&self->_scene);
}

- (void)initWithScene:parent:type:.cold.1()
{
  __assert_rtn("-[NUNISpheroid initWithScene:parent:type:]", "NUNISpheroid.m", 157, "false");
}

@end
