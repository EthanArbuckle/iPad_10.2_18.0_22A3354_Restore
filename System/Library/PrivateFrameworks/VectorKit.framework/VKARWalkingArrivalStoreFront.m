@implementation VKARWalkingArrivalStoreFront

- (VKARWalkingArrivalStoreFront)initWithOrientedRect:(const void *)a3
{
  return -[VKARWalkingArrivalStoreFront initWithOrientedRect:undulationProvider:](self, "initWithOrientedRect:undulationProvider:", a3, 0);
}

- (VKARWalkingArrivalStoreFront)initWithGEOOrientedBox:(id)a3 undulationProvider:(id)a4
{
  id v6;
  id v7;
  void *v8;
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
  double v19;
  double v20;
  double v21;
  double v22;
  float v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  VKARWalkingArrivalStoreFront *v29;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "hasPosition")
    && objc_msgSend(v6, "hasWidth")
    && (objc_msgSend(v6, "hasHeight") & 1) != 0)
  {
    objc_msgSend(v6, "position");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "hasX")
      && objc_msgSend(v8, "hasY")
      && objc_msgSend(v8, "hasZ")
      && objc_msgSend(v8, "hasYaw")
      && objc_msgSend(v8, "hasPitch")
      && (objc_msgSend(v8, "hasRoll") & 1) != 0)
    {
      objc_msgSend(v8, "yaw");
      v10 = v9;
      objc_msgSend(v8, "pitch");
      v12 = v11;
      objc_msgSend(v8, "roll");
      v14 = v13;
      objc_msgSend(v8, "x");
      v16 = v15;
      objc_msgSend(v8, "y");
      v18 = v17;
      objc_msgSend(v8, "z");
      v20 = v19;
      objc_msgSend(v6, "width");
      v22 = v21;
      objc_msgSend(v6, "height");
      v23 = v10;
      *(float *)&v24 = v12;
      *(float *)&v25 = v14;
      *(float *)&v26 = v22;
      *(float *)&v28 = v27;
      *(float *)&v27 = v23;
      self = -[VKARWalkingArrivalStoreFront initWithYaw:pitch:roll:x:y:z:w:h:undulationProvider:](self, "initWithYaw:pitch:roll:x:y:z:w:h:undulationProvider:", v7, v27, v24, v25, v16, v18, v20, v26, v28);
      v29 = self;
    }
    else
    {
      v29 = 0;
    }

  }
  else
  {
    v29 = 0;
  }

  return v29;
}

- (VKARWalkingArrivalStoreFront)initWithYaw:(float)a3 pitch:(float)a4 roll:(float)a5 x:(double)a6 y:(double)a7 z:(double)a8 w:(float)a9 h:(float)a10 undulationProvider:(id)a11
{
  id v17;
  __float2 v18;
  __float2 v19;
  __float2 v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float32x2_t v31;
  float32_t v32;
  float32x2_t v33;
  VKARWalkingArrivalStoreFront *v34;
  _QWORD v39[3];
  float64x2_t v40;
  float64x2_t v41;
  double v42;
  double v43;
  double v44;
  double v45;

  v17 = a11;
  v18 = __sincosf_stret(a3 * 0.5);
  v19 = __sincosf_stret(a4 * 0.5);
  v20 = __sincosf_stret(a5 * 0.5);
  v21 = (float)((float)(v19.__cosval * v18.__cosval) * v20.__cosval)
      + (float)((float)(v19.__sinval * v18.__sinval) * v20.__sinval);
  v22 = -(float)((float)((float)(v19.__sinval * v18.__sinval) * v20.__cosval)
               - (float)((float)(v19.__cosval * v18.__cosval) * v20.__sinval));
  v23 = -(float)((float)((float)(v19.__sinval * v18.__cosval) * v20.__sinval)
               - (float)((float)(v19.__cosval * v18.__sinval) * v20.__cosval));
  v24 = v21 * -0.5;
  v25 = v21 * 0.5;
  v26 = v22 * 0.5;
  v27 = (float)((float)((float)(v19.__sinval * v18.__cosval) * v20.__cosval)
              + (float)((float)(v19.__cosval * v18.__sinval) * v20.__sinval))
      * 0.5;
  v28 = v23 * 0.5;
  v29 = v23 * -0.5;
  v30 = v22 * -0.5;
  v31.f32[0] = (float)((float)((float)(v22 * 0.5) + v24) + v27) - v29;
  v32 = (float)(v24 - v26) + (float)(v27 + v29);
  v33.f32[0] = (float)(v30 + v25) + (float)(v27 + v28);
  v31.f32[1] = v32;
  v33.f32[1] = (float)(v25 + v27) - (float)(v30 + v28);
  *(double *)v39 = a6;
  *(double *)&v39[1] = a7;
  *(double *)&v39[2] = a8;
  v40 = vcvtq_f64_f32(v31);
  v41 = vcvtq_f64_f32(v33);
  v42 = -(a9 * 0.5);
  v43 = -(a10 * 0.5);
  v44 = a9 * 0.5;
  v45 = a10 * 0.5;
  v34 = -[VKARWalkingArrivalStoreFront initWithOrientedRect:undulationProvider:](self, "initWithOrientedRect:undulationProvider:", v39, v17);

  return v34;
}

- (VKARWalkingArrivalStoreFront)initWithOrientedRect:(const void *)a3 undulationProvider:(id)a4
{
  void (**v6)(_QWORD, double, double);
  VKARWalkingArrivalStoreFront *v7;
  long double v8;
  long double v9;
  long double v10;
  double v11;
  double v12;
  __double2 v13;
  double v14;
  long double v15;
  double v16;
  long double v17;
  long double v18;
  double v19;
  long double v20;
  double v21;
  long double v22;
  __int128 v23;
  long double v24;
  int8x16_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  int8x16_t v34;
  double v35;
  float64x2_t v36;
  double v37;
  double v38;
  __double2 v39;
  double v40;
  __double2 v41;
  long double v42;
  long double v43;
  __double2 v44;
  __double2 v45;
  __double2 v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  float64x2_t v61;
  double v62;
  double v63;
  VKARWalkingArrivalStoreFront *v64;
  double v66;
  double v67;
  long double v68;
  double v69;
  double v70;
  double v71;
  long double v72;
  objc_super v73;
  char v74[24];
  double v75;
  double v76;
  double v77;
  double v78;
  __int128 v79;
  double v80;

  v6 = (void (**)(_QWORD, double, double))a4;
  v73.receiver = self;
  v73.super_class = (Class)VKARWalkingArrivalStoreFront;
  v7 = -[VKARWalkingArrivalStoreFront init](&v73, sel_init);
  if (v7)
  {
    v8 = *(double *)a3;
    v9 = *((double *)a3 + 1);
    v10 = *((double *)a3 + 2);
    v11 = sqrt(v8 * v8 + v9 * v9);
    v12 = atan2(v10, v11 * 0.996647189);
    v13 = __sincos_stret(v12);
    v14 = atan2(v10 + v13.__sinval * v13.__sinval * 42841.3115 * v13.__sinval, v11 + v13.__cosval * v13.__cosval * -42697.6727 * v13.__cosval);
    if (v6)
    {
      v15 = atan2(v9, v8);
      v6[2](v6, v14 * 57.2957795, v15 * 57.2957795);
    }
    else
    {
      v16 = 0.0;
    }
    v71 = v16;
    v7->_undulation._value = v16;
    v17 = cos(v14 + v14) * -559.82 + 111132.92;
    v18 = v17 + cos(v14 * 4.0) * 1.175;
    v70 = v18 + cos(v14 * 6.0) * -0.0023;
    v19 = v14 * 0.5;
    v20 = tan(v14 * 0.5 + 0.78103484);
    v21 = log(v20);
    v22 = tan(v19 + 0.789761487);
    v69 = fabs((log(v22) - v21) * 0.159154943);
    v79 = *(_OWORD *)a3;
    v80 = *((double *)a3 + 2);
    v23 = v79;
    v24 = v80;
    gdc::CameraFrame<geo::Degrees,double>::createLocalEcefFrame((uint64_t)v74, (uint64_t)&v79);
    v26 = *((double *)a3 + 3);
    v27 = *((double *)a3 + 4);
    v28 = *((double *)a3 + 5);
    v29 = *((double *)a3 + 6);
    v30 = v26 * v78 + v27 * v77 - (v28 * v76 + v29 * v75);
    v31 = v27 * v78 + v28 * v75 - (v26 * v77 + v29 * v76);
    v32 = v26 * v76 + v28 * v78 - (v27 * v75 + v29 * v77);
    v33 = v26 * v75 + v27 * v76 + v28 * v77 + v29 * v78;
    *(double *)v34.i64 = -(v30 * v33 - v32 * v31) * -2.0;
    if (fabs(*(double *)v34.i64) >= 1.0)
    {
      v25.i64[0] = 0x3FF921FB54442D18;
      v36.f64[0] = NAN;
      v36.f64[1] = NAN;
      *(_QWORD *)&v35 = vbslq_s8((int8x16_t)vnegq_f64(v36), v25, v34).u64[0];
    }
    else
    {
      v35 = asin(*(long double *)v34.i64);
    }
    v67 = v35;
    v66 = atan2(v33 * v32 + v30 * v31 + v33 * v32 + v30 * v31, 1.0 - (v30 * v30 + v32 * v32) * 2.0);
    v37 = sqrt(*(double *)&v23 * *(double *)&v23 + *((double *)&v23 + 1) * *((double *)&v23 + 1));
    v38 = atan2(v24, v37 * 0.996647189);
    v39 = __sincos_stret(v38);
    v40 = atan2(v24 + v39.__sinval * v39.__sinval * 42841.3115 * v39.__sinval, v37 + v39.__cosval * v39.__cosval * -42697.6727 * v39.__cosval);
    v41 = __sincos_stret(v40);
    v42 = tan(v40 * 0.5 + 0.785398163);
    v72 = log(v42) * 0.159154943 + 0.5;
    v68 = atan2(*((long double *)&v23 + 1), *(long double *)&v23) * 0.159154943 + 0.5;
    v43 = atan2(v33 * v31 + v30 * v32 + v33 * v31 + v30 * v32, 1.0 - (v30 * v30 + v31 * v31) * 2.0);
    v44 = __sincos_stret(v43 * 0.5);
    v45 = __sincos_stret(v66 * -0.5);
    v46 = __sincos_stret(v67 * -0.5);
    v47 = v44.__cosval * v45.__cosval * v46.__cosval + v44.__sinval * v45.__sinval * v46.__sinval;
    v48 = -(v44.__sinval * v45.__sinval * v46.__cosval - v44.__cosval * v45.__cosval * v46.__sinval);
    v49 = v44.__cosval * v45.__sinval * v46.__cosval + v44.__sinval * v45.__cosval * v46.__sinval;
    v50 = -(v44.__cosval * v45.__sinval * v46.__sinval - v44.__sinval * v45.__cosval * v46.__cosval);
    v51 = v48 * -0.0000000309086185;
    v52 = v49 * -0.0000000309086185;
    v53 = v50 * -0.0000000309086185;
    v54 = v47 * -0.0000000309086185;
    v55 = v47 * 0.707106769;
    v56 = v48 * 0.707106769;
    v57 = v51 + v50 * 0.707106769;
    v58 = v54 + v49 * -0.707106769;
    v59 = v49 * -0.0000000309086185 - v53 + v55 + v56;
    v60 = v52 + v53 - v56 + v55;
    v61 = vsubq_f64(*(float64x2_t *)((char *)a3 + 72), *(float64x2_t *)((char *)a3 + 56));
    *(float *)&v53 = v69 * v61.f64[0] / v70;
    *(float *)&v55 = vmuld_lane_f64(0.0000000249532021, v61, 1);
    v7->_dimensionsInMeters = (Matrix<float, 2, 1>)vcvt_f32_f64(v61);
    v62 = *(float *)&v53 * 0.5;
    v63 = *(float *)&v55 * 0.5;
    v7->_face._transform._rotation._imaginary._e[1] = v59;
    v7->_face._transform._rotation._imaginary._e[2] = v60;
    v7->_face._transform._translation._e[0] = v68;
    v7->_face._transform._translation._e[1] = v72;
    v7->_face._transform._translation._e[2] = (v37 / v41.__cosval
                                             - v71
                                             + -6378137.0 / sqrt(v41.__sinval * v41.__sinval * -0.00669437999 + 1.0))
                                            * 0.0000000249532021;
    v7->_face._transform._rotation._imaginary._e[0] = v58 + v57;
    v7->_face._transform._rotation._scalar = v58 - v57;
    v7->_face._bounds._minimum._e[0] = -v62;
    v7->_face._bounds._minimum._e[1] = -v63;
    v7->_face._bounds._maximum._e[0] = v62;
    v7->_face._bounds._maximum._e[1] = v63;
    v64 = v7;
  }

  return v7;
}

- (Unit<geo::MeterUnitDescription,)faceWidthInMeters
{
  double *v2;
  Unit<geo::MeterUnitDescription, double> v3;

  v3._value = self->_dimensionsInMeters._e[0];
  *v2 = v3._value;
  return v3;
}

- (Unit<geo::MeterUnitDescription,)faceHeightInMeters
{
  double *v2;
  Unit<geo::MeterUnitDescription, double> v3;

  v3._value = self->_dimensionsInMeters._e[1];
  *v2 = v3._value;
  return v3;
}

- (Mercator3<double>)bottomCenterPoint
{
  double v2;
  double v3;
  double v4;
  Mercator3<double> result;

  v2 = self->_face._transform._translation._e[0];
  v3 = self->_face._transform._translation._e[1];
  v4 = self->_face._transform._translation._e[2]
     + (self->_face._bounds._minimum._e[1] - self->_face._bounds._maximum._e[1]) * 0.5;
  result._e[2] = v4;
  result._e[1] = v3;
  result._e[0] = v2;
  return result;
}

- (Coordinate3D<geo::Degrees,)bottomCenterCoordinate
{
  float64x2_t *v2;
  float64x2_t *v3;
  double v4;
  double v5;
  double v6;
  long double v7;
  double v8;
  long double v9;
  long double v10;
  long double v11;
  float64x2_t v12;
  double v13;
  float64x2_t v14;
  long double v15;
  Coordinate3D<geo::Degrees, double> result;

  v3 = v2;
  -[VKARWalkingArrivalStoreFront bottomCenterPoint](self, "bottomCenterPoint");
  v5 = v4 * 40075017.0;
  v7 = v6 * 6.28318531;
  v9 = exp(v8 * 6.28318531 + -3.14159265);
  v15 = atan(v9);
  v10 = fmod(v7, 6.28318531);
  v11 = fmod(v10 + 6.28318531, 6.28318531);
  v12.f64[0] = v15;
  v12.f64[1] = v11;
  v13 = 114.591559;
  v14 = vmlaq_f64((float64x2_t)xmmword_19FFB32F0, (float64x2_t)xmmword_19FFB32E0, v12);
  *v3 = v14;
  v3[1].f64[0] = v5;
  result.altitude = *(Unit<geo::MeterUnitDescription, double> *)&v12.f64[0];
  result.longitude = *(Unit<geo::DegreeUnitDescription, double> *)&v14.f64[0];
  result.latitude = *(Unit<geo::DegreeUnitDescription, double> *)&v13;
  return result;
}

- (Matrix<double,)normal
{
  double v2;
  double v3;
  double v4;
  double scalar;
  double v6;
  double v7;
  double v8;
  double v9;
  Matrix<double, 3, 1> result;

  v2 = self->_face._transform._rotation._imaginary._e[0];
  v3 = self->_face._transform._rotation._imaginary._e[1];
  v4 = self->_face._transform._rotation._imaginary._e[2];
  scalar = self->_face._transform._rotation._scalar;
  v6 = v2 + v2;
  v7 = -((v4 + v4) * scalar - (v2 + v2) * v3);
  v8 = 1.0 - ((v2 + v2) * v2 + (v4 + v4) * v4);
  v9 = (v4 + v4) * v3 + scalar * v6;
  result._e[2] = v9;
  result._e[1] = v8;
  result._e[0] = v7;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)VKARWalkingArrivalStoreFront;
  if (-[VKARWalkingArrivalStoreFront isEqual:](&v18, sel_isEqual_, v4)
    && (v5 = objc_opt_class(), v5 == objc_opt_class()))
  {
    v8 = v4;
    -[VKARWalkingArrivalStoreFront bottomCenterPoint](self, "bottomCenterPoint");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    objc_msgSend(v8, "bottomCenterPoint");
    v6 = vabdd_f64(v10, v17) < 0.00000001 && vabdd_f64(v12, v15) < 0.00000001 && vabdd_f64(v14, v16) < 0.00000001;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  __int128 v8;
  uint64_t v9;

  -[VKARWalkingArrivalStoreFront bottomCenterCoordinate](self, "bottomCenterCoordinate");
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p position:(%f,%f,%f) undulation:%f>"), v5, self, v8, v9, *(_QWORD *)&self->_undulation._value);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (OrientedBox<double,)face
{
  Matrix<double, 2, 1> v3;

  *(_OWORD *)retstr->_transform._translation._e = *(_OWORD *)&self->_transform._translation._e[1];
  *(_OWORD *)retstr->_transform._rotation._imaginary._e = *(_OWORD *)&self->_transform._rotation._imaginary._e[1];
  retstr->_transform._rotation._scalar = self->_bounds._minimum._e[0];
  v3 = *(Matrix<double, 2, 1> *)((char *)&self->_bounds._maximum + 8);
  retstr->_bounds._minimum = *(Matrix<double, 2, 1> *)((char *)&self->_bounds._minimum + 8);
  retstr->_transform._translation._e[2] = self->_transform._rotation._imaginary._e[0];
  retstr->_transform._rotation._imaginary._e[2] = self->_transform._rotation._scalar;
  retstr->_bounds._maximum = v3;
  return self;
}

- (Unit<geo::MeterUnitDescription,)appliedUndulation
{
  _QWORD *v2;
  Unit<geo::MeterUnitDescription, double> v3;

  v3._value = self->_undulation._value;
  *v2 = *(Unit<geo::MeterUnitDescription, double> *)&v3._value;
  return v3;
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *(_OWORD *)((char *)self + 56) = xmmword_19FFB3010;
  *(_OWORD *)((char *)self + 72) = xmmword_19FFB2E00;
  *((_QWORD *)self + 11) = 0xFFEFFFFFFFFFFFFFLL;
  return self;
}

@end
