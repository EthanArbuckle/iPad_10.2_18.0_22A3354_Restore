@implementation PAEColorWheelChannelData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PAEColorWheelChannelData)initWithRadius:(double)a3 theta:(double)a4 saturation:(double)a5 light:(double)a6
{
  PAEColorWheelChannelData *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PAEColorWheelChannelData;
  result = -[PAEColorWheelChannelData init](&v11, sel_init);
  if (result)
  {
    result->_value.r = fmax(a3, 0.0);
    result->_value.t = a4;
    result->_value.sat = fmax(a5, 0.0);
    result->_value.e = a6;
  }
  return result;
}

+ (id)channelDataWithRadius:(double)a3 theta:(double)a4 saturation:(double)a5 light:(double)a6
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithRadius:theta:saturation:light:", a3, a4, a5, a6);
}

- (void)setRadius:(double)a3
{
  self->_value.r = fmax(a3, 0.0);
}

- (double)radius
{
  return self->_value.r;
}

- (void)setTheta:(double)a3
{
  self->_value.t = a3;
}

- (double)theta
{
  return self->_value.t;
}

- (void)setSaturation:(double)a3
{
  double v3;
  BOOL v4;
  double v5;

  v3 = 5.0;
  if (a3 <= 5.0)
    v3 = a3;
  v4 = a3 < 0.0;
  v5 = 0.0;
  if (!v4)
    v5 = v3;
  self->_value.sat = v5;
}

- (double)saturation
{
  return self->_value.sat;
}

- (void)setLight:(double)a3
{
  double v3;
  double v4;

  v3 = 5.5;
  if (a3 <= 5.5)
    v3 = a3;
  if (a3 >= -5.5)
    v4 = v3;
  else
    v4 = -5.5;
  self->_value.e = v4;
}

- (double)light
{
  return self->_value.e;
}

- (BOOL)isAtDefaults
{
  return self->_value.r == 0.0 && self->_value.t == 0.0 && self->_value.sat == 0.5 && self->_value.e == 0.5;
}

- (void)reset
{
  self->_value.r = 0.0;
  self->_value.t = 0.0;
  __asm { FMOV            V0.2D, #0.5 }
  *(_OWORD *)&self->_value.sat = _Q0;
}

- (PAEColorWheelChannelData)initWithCoder:(id)a3
{
  PAEColorWheelChannelData *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PAEColorWheelChannelData;
  v4 = -[PAEColorWheelChannelData init](&v10, sel_init);
  if (v4)
  {
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("radius"));
    v4->_value.r = v5;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("theta"));
    v4->_value.t = v6;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("saturation"));
    v4->_value.sat = v7;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("light"));
    v4->_value.e = v8;
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;

  -[PAEColorWheelChannelData radius](self, "radius");
  if (v5 != 0.0)
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("radius"));
  -[PAEColorWheelChannelData theta](self, "theta");
  if (v6 != 0.0)
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("theta"));
  -[PAEColorWheelChannelData saturation](self, "saturation");
  if (v7 != 0.0)
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("saturation"));
  -[PAEColorWheelChannelData light](self, "light");
  if (v8 != 0.0)
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("light"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int128 v5;

  result = objc_alloc_init((Class)objc_opt_class());
  if (result)
  {
    v5 = *(_OWORD *)&self->_value.r;
    *(_OWORD *)((char *)result + 24) = *(_OWORD *)&self->_value.sat;
    *(_OWORD *)((char *)result + 8) = v5;
  }
  return result;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  -[PAEColorWheelChannelData radius](self, "radius");
  v7 = v6;
  -[PAEColorWheelChannelData theta](self, "theta");
  v9 = v8;
  -[PAEColorWheelChannelData saturation](self, "saturation");
  v11 = v10;
  -[PAEColorWheelChannelData light](self, "light");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> radius=%f, theta=%f, saturation=%f, light=%f"), v5, self, v7, v9, v11, v12);
}

- (id)interpolateBetween:(id)a3 withWeight:(float)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  float v19;
  int32x4_t v20;
  float v21;
  float32x2_t v22;
  float v23;
  float v24;
  int8x16_t v25;
  double v26;
  int v27;
  float v28;
  double v29;
  float v30;
  double v31;
  float v32;
  float v33;
  int32x4_t v34;
  float v35;
  float v36;
  int8x16_t v37;
  float v38;
  int8x16_t v39;
  double v40;
  int v41;
  float v42;
  double v43;
  float v44;
  double v45;
  float v46;
  float64x2_t v47;
  float64x2_t v52;
  float v53;
  int8x16_t v54;
  float v55;
  float v56;
  float v57;
  float32x2_t v58;
  float v59;
  float v60;
  float v61;
  float v62;
  float v63;
  float v64;
  double v65;
  double v66;
  float v67;
  float v68;
  double v70;
  double v71;
  float v72;
  float v73;
  double v74;
  float v75;
  float v76;
  float v77;
  float v78;
  float v79;
  double v82;
  double v83;

  -[PAEColorWheelChannelData saturation](self, "saturation");
  v7 = v6;
  -[PAEColorWheelChannelData light](self, "light");
  v9 = v8;
  -[PAEColorWheelChannelData radius](self, "radius");
  v83 = v10;
  -[PAEColorWheelChannelData theta](self, "theta");
  v12 = v11;
  objc_msgSend(a3, "saturation");
  v14 = v13;
  objc_msgSend(a3, "light");
  v16 = v15;
  objc_msgSend(a3, "radius");
  v82 = v17;
  objc_msgSend(a3, "theta");
  v19 = v12 * 0.159154943;
  v20.i64[0] = __PAIR64__(1.0, LODWORD(v19));
  v20.i64[1] = COERCE_UNSIGNED_INT(0.5);
  if (v19 <= 1.0)
  {
    if (v19 >= 0.0)
      goto LABEL_6;
    v21 = (float)(v19 + (float)(int)(float)-v19) + 1.0;
  }
  else
  {
    v21 = v19 - (float)(int)v19;
  }
  *(float *)v20.i32 = v21;
LABEL_6:
  v22.f32[0] = a4;
  if (*(float *)v20.i32 <= 1.0)
  {
    if (*(float *)v20.i32 >= 0.0)
      v23 = *(float *)v20.i32;
    else
      v23 = (float)(*(float *)v20.i32 + (float)(int)(float)-*(float *)v20.i32) + 1.0;
  }
  else
  {
    v23 = *(float *)v20.i32 - (float)(int)*(float *)v20.i32;
  }
  v24 = (1.0 + 1.0) * 0.5;
  if (1.0 >= 0.00000011921)
  {
    v26 = v23 * 6.0;
    v27 = (int)v26;
    v28 = 0.5 + 0.5 - v24;
    v29 = (v26 - floor(v26)) * (float)(v24 - v28);
    v30 = v29 + v28;
    v31 = v24 - v29;
    v32 = v31;
    switch(v27)
    {
      case 1:
        v25.i32[3] = 0;
        *(float *)v25.i32 = v31;
        *(float *)&v25.i32[1] = (1.0 + 1.0) * 0.5;
        goto LABEL_16;
      case 2:
        v25.i64[0] = __PAIR64__(LODWORD(v24), LODWORD(v28));
        v25.i64[1] = LODWORD(v30);
        break;
      case 3:
        v25.i32[3] = 0;
        v25.i64[0] = __PAIR64__(LODWORD(v32), LODWORD(v28));
        goto LABEL_20;
      case 4:
        v25.i32[3] = 0;
        v25.i64[0] = __PAIR64__(LODWORD(v28), LODWORD(v30));
LABEL_20:
        *(float *)&v25.i32[2] = (1.0 + 1.0) * 0.5;
        break;
      case 5:
        v25.i64[0] = __PAIR64__(LODWORD(v28), LODWORD(v24));
        v25.i64[1] = LODWORD(v32);
        break;
      default:
        v25.i32[3] = 0;
        v25.i64[0] = __PAIR64__(LODWORD(v30), LODWORD(v24));
LABEL_16:
        *(float *)&v25.i32[2] = 0.5 + 0.5 - v24;
        break;
    }
  }
  else
  {
    v25 = (int8x16_t)vdupq_laneq_s32(v20, 2);
    v25.i32[3] = 0;
  }
  v33 = v18 * 0.159154943;
  v34.i64[0] = __PAIR64__(1.0, LODWORD(v33));
  v34.i64[1] = COERCE_UNSIGNED_INT(0.5);
  if (v33 <= 1.0)
  {
    if (v33 >= 0.0)
      goto LABEL_27;
    v35 = (float)(v33 + (float)(int)(float)-v33) + 1.0;
  }
  else
  {
    v35 = v33 - (float)(int)v33;
  }
  *(float *)v34.i32 = v35;
LABEL_27:
  if (*(float *)v34.i32 <= 1.0)
  {
    if (*(float *)v34.i32 >= 0.0)
      v36 = *(float *)v34.i32;
    else
      v36 = (float)(*(float *)v34.i32 + (float)(int)(float)-*(float *)v34.i32) + 1.0;
  }
  else
  {
    v36 = *(float *)v34.i32 - (float)(int)*(float *)v34.i32;
  }
  v22.f32[1] = 1.0 - a4;
  v37 = (int8x16_t)vcvtq_f64_f32(v22);
  v38 = (1.0 + 1.0) * 0.5;
  if (1.0 >= 0.00000011921)
  {
    v40 = v36 * 6.0;
    v41 = (int)v40;
    v42 = 0.5 + 0.5 - v38;
    v43 = (v40 - floor(v40)) * (float)(v38 - v42);
    v44 = v43 + v42;
    v45 = v38 - v43;
    v46 = v45;
    switch(v41)
    {
      case 1:
        v39.i32[3] = 0;
        *(float *)v39.i32 = v45;
        *(float *)&v39.i32[1] = (1.0 + 1.0) * 0.5;
        goto LABEL_37;
      case 2:
        v39.i64[0] = __PAIR64__(LODWORD(v38), LODWORD(v42));
        v39.i64[1] = LODWORD(v44);
        break;
      case 3:
        v39.i32[3] = 0;
        v39.i64[0] = __PAIR64__(LODWORD(v46), LODWORD(v42));
        goto LABEL_41;
      case 4:
        v39.i32[3] = 0;
        v39.i64[0] = __PAIR64__(LODWORD(v42), LODWORD(v44));
LABEL_41:
        *(float *)&v39.i32[2] = (1.0 + 1.0) * 0.5;
        break;
      case 5:
        v39.i64[0] = __PAIR64__(LODWORD(v42), LODWORD(v38));
        v39.i64[1] = LODWORD(v46);
        break;
      default:
        v39.i32[3] = 0;
        v39.i64[0] = __PAIR64__(LODWORD(v44), LODWORD(v38));
LABEL_37:
        *(float *)&v39.i32[2] = 0.5 + 0.5 - v38;
        break;
    }
  }
  else
  {
    v39 = (int8x16_t)vdupq_laneq_s32(v34, 2);
    v39.i32[3] = 0;
  }
  v47.f64[0] = v82;
  v47.f64[1] = v83;
  __asm { FMOV            V4.2D, #1.0 }
  v52 = vsubq_f64(_Q4, v47);
  v53 = 0.0;
  v54 = (int8x16_t)vmulq_f64(v52, (float64x2_t)0);
  v55 = *(double *)&v54.i64[1] + v83 * *(float *)v25.i32;
  v56 = *(double *)v54.i64 + v82 * *(float *)v39.i32;
  v57 = vmuld_lane_f64(v55, (float64x2_t)v37, 1) + v56 * *(double *)v37.i64;
  v58 = vcvt_f32_f64(vaddq_f64(vmulq_f64((float64x2_t)v37, vcvtq_f64_f32(vcvt_f32_f64(vaddq_f64((float64x2_t)v54, vmulq_f64(v47, vcvtq_f64_f32((float32x2_t)vext_s8(*(int8x8_t *)v39.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v25, v25, 8uLL), 4uLL))))))), vmulq_f64((float64x2_t)vextq_s8(v37, v37, 8uLL), vcvtq_f64_f32(vcvt_f32_f64(vaddq_f64((float64x2_t)vextq_s8(v54, v54, 8uLL),
                    vmulq_f64((float64x2_t)vextq_s8((int8x16_t)v47, (int8x16_t)v47, 8uLL), vcvtq_f64_f32((float32x2_t)vext_s8(*(int8x8_t *)v25.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v39, v39, 8uLL), 4uLL)))))))));
  v59 = v58.f32[1];
  if (v58.f32[0] >= v58.f32[1])
    v60 = v58.f32[1];
  else
    v60 = v58.f32[0];
  if (v58.f32[0] <= v58.f32[1])
    v61 = v58.f32[1];
  else
    v61 = v58.f32[0];
  if (v60 <= v57)
    v62 = v60;
  else
    v62 = v57;
  if (v61 >= v57)
    v63 = v61;
  else
    v63 = v57;
  v64 = v63 - v62;
  v65 = -(float)(v63 - v62);
  if ((float)(v63 - v62) >= 0.0)
    v65 = (float)(v63 - v62);
  if (v65 >= 0.00000011920929)
  {
    v66 = v62;
    v67 = v57 - v63;
    if ((float)(v57 - v63) < 0.0)
      v67 = -(float)(v57 - v63);
    if (v67 >= 0.00000011921)
    {
      v72 = v58.f32[0] - v63;
      if ((float)(v58.f32[0] - v63) < 0.0)
        v72 = -(float)(v58.f32[0] - v63);
      v73 = v57 - v62;
      if ((float)(v57 - v62) < 0.0)
        v73 = -(float)(v57 - v62);
      v74 = (float)((float)(v63 - v57) / v64);
      v70 = (float)((float)(v63 - v58.f32[0]) / v64) + 3.0;
      if (v73 >= 0.00000011921)
        v70 = 5.0 - v74;
      v75 = v59 - v62;
      if (v75 < 0.0)
        v75 = -v75;
      v71 = 3.0 - (float)((float)(v63 - v59) / v64);
      if (v75 < 0.00000011921)
        v71 = v74 + 1.0;
      _NF = v72 < 0.00000011921;
    }
    else
    {
      v68 = v58.f32[0] - v62;
      if (v68 < 0.0)
        v68 = -v68;
      _NF = v68 < 0.00000011921;
      v70 = 1.0 - (float)((float)(v63 - v58.f32[0]) / v64);
      v71 = (float)((float)(v63 - v59) / v64) + 5.0;
    }
    if (!_NF)
      v71 = v70;
    v76 = v71;
    v77 = v76 / 6.0;
    v53 = v77;
    if (v77 <= 1.0)
    {
      if (v77 >= 0.0)
        goto LABEL_83;
      v78 = (float)(v77 + (float)(int)(float)-v77) + 1.0;
    }
    else
    {
      v78 = v77 - (float)(int)v77;
    }
    v53 = v78;
    goto LABEL_83;
  }
  v66 = v62;
LABEL_83:
  v79 = v53 * 3.14159265 + v53 * 3.14159265;
  return +[PAEColorWheelChannelData channelDataWithRadius:theta:saturation:light:](PAEColorWheelChannelData, "channelDataWithRadius:theta:saturation:light:", v63 - v66, v79, v7 * *(double *)&v37.i64[1] + v14 * *(double *)v37.i64, v9 * *(double *)&v37.i64[1] + v16 * *(double *)v37.i64);
}

- (BOOL)isEqual:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v15;
  double v16;
  double v17;

  -[PAEColorWheelChannelData saturation](self, "saturation");
  v6 = v5;
  objc_msgSend(a3, "saturation");
  if (v6 != v7)
    return 0;
  -[PAEColorWheelChannelData light](self, "light");
  v9 = v8;
  objc_msgSend(a3, "light");
  if (v9 != v10)
    return 0;
  -[PAEColorWheelChannelData radius](self, "radius");
  v12 = v11;
  objc_msgSend(a3, "radius");
  if (v12 != v13)
    return 0;
  -[PAEColorWheelChannelData theta](self, "theta");
  v16 = v15;
  objc_msgSend(a3, "theta");
  return v16 == v17;
}

@end
