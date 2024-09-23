@implementation CRLPKStrokePoint

+ (CRLPKCompressedStrokePoint)compressStrokePoint:(SEL)a3 withTimestamp:(_CRLPKStrokePoint *)a4
{
  float v7;
  CRLPKCompressedStrokePoint *result;

  v7 = a4->timestamp - a5;
  retstr->var0 = v7;
  retstr->var1 = (_CRLPKPoint)vcvt_f32_f64((float64x2_t)a4->location);
  retstr->var2 = (int)sub_1003C65EC(a4->radius * 10.0, 0.0, 65535.0);
  retstr->var3 = (int)sub_1003C65EC(a4->aspectRatio * 1000.0, 0.0, 65535.0);
  retstr->var4 = (int)sub_1003C65EC(a4->edgeWidth * 10.0, 0.0, 65535.0);
  retstr->var5 = (int)sub_1003C65EC(a4->force * 1000.0, 0.0, 65535.0);
  sub_100075650((uint64_t)retstr, a4->azimuth);
  retstr->var7 = (int)sub_1003C65EC(a4->altitude * 162.338042, 0.0, 255.0);
  retstr->var8 = (int)sub_1003C65EC(a4->opacity * 255.0, 0.0, 255.0);
  return result;
}

+ (_CRLPKStrokePoint)decompressStrokePoint:(SEL)a3 withTimestamp:(CRLPKCompressedStrokePoint *)a4
{
  unint64_t v5;
  float64x2_t v6;
  unint64_t v7;
  unint64_t v8;

  retstr->timestamp = a4->var0 + a5;
  v6 = vcvtq_f64_f32((float32x2_t)a4->var1);
  retstr->location = (CGPoint)v6;
  LOWORD(v6.f64[0]) = a4->var2;
  v7 = 10.0;
  v6.f64[0] = (double)*(unint64_t *)&v6.f64[0] / 10.0;
  LOWORD(v5) = a4->var3;
  retstr->radius = v6.f64[0];
  retstr->aspectRatio = (double)v5 / 1000.0;
  LOWORD(v6.f64[0]) = a4->var4;
  v6.f64[0] = (double)*(unint64_t *)&v6.f64[0] / 10.0;
  LOWORD(v7) = a4->var5;
  retstr->edgeWidth = v6.f64[0];
  retstr->force = (double)v7 / 1000.0;
  LOWORD(v6.f64[0]) = a4->var6;
  v8 = 0x40C45F1C0E995AB9;
  v6.f64[0] = (double)*(unint64_t *)&v6.f64[0] / 10430.2192;
  LOBYTE(v8) = a4->var7;
  retstr->azimuth = v6.f64[0];
  retstr->altitude = (double)v8 / 162.338042;
  LOBYTE(v6.f64[0]) = a4->var8;
  retstr->opacity = (double)*(unint64_t *)&v6.f64[0] / 255.0;
  return result;
}

- (CRLPKStrokePoint)init
{
  CRLPKStrokePoint *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRLPKStrokePoint;
  v2 = -[CRLPKStrokePoint init](&v4, "init");
  v2->_inflight = 1;
  v2->_pointOwned = 1;
  v2->_point = malloc_type_calloc(1uLL, 0x50uLL, 0x1000040BF3E2410uLL);
  return v2;
}

- (CRLPKStrokePoint)initWithStroke:(id)a3 strokePoint:(void *)a4 inflight:(BOOL)a5
{
  CRLPKStroke *v8;
  CRLPKStrokePoint *v9;
  CRLPKStroke *stroke;
  objc_super v12;

  v8 = (CRLPKStroke *)a3;
  v12.receiver = self;
  v12.super_class = (Class)CRLPKStrokePoint;
  v9 = -[CRLPKStrokePoint init](&v12, "init");
  v9->_inflight = a5;
  stroke = v9->_stroke;
  v9->_stroke = v8;

  v9->_pointOwned = 0;
  v9->_point = a4;
  return v9;
}

- (void)_strokePoint
{
  return self->_point;
}

- (void)setTimestamp:(double)a3
{
  _DWORD *point;
  double v5;

  point = self->_point;
  -[CRLPKStroke timestamp](self->_stroke, "timestamp");
  *(float *)&v5 = a3 - v5;
  *point = LODWORD(v5);
}

- (double)timestamp
{
  float *point;
  double v3;

  point = (float *)self->_point;
  -[CRLPKStroke timestamp](self->_stroke, "timestamp");
  return v3 + *point;
}

- (void)setLocation:(CGPoint)a3
{
  float *point;
  float x;
  float y;

  point = (float *)self->_point;
  x = a3.x;
  y = a3.y;
  point[1] = x;
  point[2] = y;
}

- (CGPoint)location
{
  float *point;
  double v3;
  double v4;
  CGPoint result;

  point = (float *)self->_point;
  v3 = point[1];
  v4 = point[2];
  result.y = v4;
  result.x = v3;
  return result;
}

- (void)_setHasEstimatedLocation:(BOOL)a3
{
  if (self->_inflight)
    *((_BYTE *)self->_point + 56) = a3;
}

- (BOOL)_hasEstimatedLocation
{
  return self->_inflight && *((_BYTE *)self->_point + 56) != 0;
}

- (void)setForce:(double)a3
{
  _WORD *point;

  point = self->_point;
  point[9] = (int)sub_1003C65EC(a3 * 1000.0, 0.0, 65535.0);
}

- (double)force
{
  unint64_t v2;

  LOWORD(v2) = *((_WORD *)self->_point + 9);
  return (double)v2 / 1000.0;
}

- (void)_setHasEstimatedForce:(BOOL)a3
{
  if (self->_inflight)
    *((_BYTE *)self->_point + 57) = a3;
}

- (BOOL)_hasEstimatedForce
{
  return self->_inflight && *((_BYTE *)self->_point + 57) != 0;
}

- (void)setAzimuth:(double)a3
{
  sub_100075650((uint64_t)self->_point, a3);
}

- (double)azimuth
{
  unint64_t v2;

  LOWORD(v2) = *((_WORD *)self->_point + 10);
  return (double)v2 / 10430.2192;
}

- (void)setAltitude:(double)a3
{
  _BYTE *point;

  point = self->_point;
  point[22] = (int)sub_1003C65EC(a3 * 162.338042, 0.0, 255.0);
}

- (double)altitude
{
  unint64_t v2;

  LOBYTE(v2) = *((_BYTE *)self->_point + 22);
  return (double)v2 / 162.338042;
}

- (void)_setHasEstimatedAzimuthAndAltitude:(BOOL)a3
{
  if (self->_inflight)
    *((_BYTE *)self->_point + 58) = a3;
}

- (BOOL)_hasEstimatedAzimuthAndAltitude
{
  return self->_inflight && *((_BYTE *)self->_point + 58) != 0;
}

- (double)velocity
{
  return 0.0;
}

- (void)_setHasEstimatedVelocity:(BOOL)a3
{
  if (self->_inflight)
    *((_BYTE *)self->_point + 59) = a3;
}

- (BOOL)_hasEstimatedVelocity
{
  return self->_inflight && *((_BYTE *)self->_point + 59) != 0;
}

- (void)_setEstimationUpdateIndex:(int64_t)a3
{
  if (self->_inflight)
    *((_QWORD *)self->_point + 8) = a3;
}

- (int64_t)_estimationUpdateIndex
{
  if (self->_inflight)
    return *((_QWORD *)self->_point + 8);
  else
    return -1;
}

- (void)_setLength:(double)a3
{
  if (self->_inflight)
    *((double *)self->_point + 9) = a3;
}

- (double)_length
{
  if (self->_inflight)
    return *((double *)self->_point + 9);
  else
    return 0.0;
}

- (void)_setRadius:(double)a3
{
  _WORD *point;

  if (!self->_inflight)
  {
    point = self->_point;
    point[6] = (int)sub_1003C65EC(a3 * 10.0, 0.0, 65535.0);
  }
}

- (double)_radius
{
  double result;

  result = 0.0;
  if (!self->_inflight)
  {
    LOWORD(result) = *((_WORD *)self->_point + 6);
    return (double)*(unint64_t *)&result / 10.0;
  }
  return result;
}

- (void)_setOpacity:(double)a3
{
  _BYTE *point;

  if (!self->_inflight)
  {
    point = self->_point;
    point[23] = (int)sub_1003C65EC(a3 * 255.0, 0.0, 255.0);
  }
}

- (double)_opacity
{
  double result;

  result = 0.0;
  if (!self->_inflight)
  {
    LOBYTE(result) = *((_BYTE *)self->_point + 23);
    return (double)*(unint64_t *)&result / 255.0;
  }
  return result;
}

- (void)_setEdgeWidth:(double)a3
{
  _WORD *point;

  if (!self->_inflight)
  {
    point = self->_point;
    point[8] = (int)sub_1003C65EC(a3 * 10.0, 0.0, 65535.0);
  }
}

- (double)_edgeWidth
{
  double result;

  result = 0.0;
  if (!self->_inflight)
  {
    LOWORD(result) = *((_WORD *)self->_point + 8);
    return (double)*(unint64_t *)&result / 10.0;
  }
  return result;
}

- (void)_setAspectRatio:(double)a3
{
  _WORD *point;

  if (!self->_inflight)
  {
    point = self->_point;
    point[7] = (int)sub_1003C65EC(a3 * 1000.0, 0.0, 65535.0);
  }
}

- (double)_aspectRatio
{
  double result;

  result = 0.0;
  if (!self->_inflight)
  {
    LOWORD(result) = *((_WORD *)self->_point + 7);
    return (double)*(unint64_t *)&result / 1000.0;
  }
  return result;
}

- (id)description
{
  _BOOL4 inflight;
  objc_class *v4;
  NSString *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;
  uint64_t v11;
  uint64_t v12;
  const __CFString *v13;
  uint64_t v14;
  uint64_t v15;
  const __CFString *v16;
  uint64_t v17;
  uint64_t v18;
  const __CFString *v19;
  uint64_t v20;
  uint64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const __CFString *v42;

  inflight = self->_inflight;
  v4 = (objc_class *)objc_opt_class(self, a2);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (self->_inflight)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  if (inflight)
  {
    v42 = v7;
    -[CRLPKStrokePoint location](self, "location");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPKStrokePoint _stringFromPoint:](self, "_stringFromPoint:"));
    v9 = CFSTR("(estimated)");
    if (-[CRLPKStrokePoint _hasEstimatedLocation](self, "_hasEstimatedLocation"))
      v10 = CFSTR("(estimated)");
    else
      v10 = &stru_1012A72B0;
    -[CRLPKStrokePoint force](self, "force");
    v12 = v11;
    if (-[CRLPKStrokePoint _hasEstimatedForce](self, "_hasEstimatedForce"))
      v13 = CFSTR("(estimated)");
    else
      v13 = &stru_1012A72B0;
    -[CRLPKStrokePoint azimuth](self, "azimuth");
    v15 = v14;
    if (-[CRLPKStrokePoint _hasEstimatedAzimuthAndAltitude](self, "_hasEstimatedAzimuthAndAltitude"))
      v16 = CFSTR("(estimated)");
    else
      v16 = &stru_1012A72B0;
    -[CRLPKStrokePoint altitude](self, "altitude");
    v18 = v17;
    if (-[CRLPKStrokePoint _hasEstimatedAzimuthAndAltitude](self, "_hasEstimatedAzimuthAndAltitude"))
      v19 = CFSTR("(estimated)");
    else
      v19 = &stru_1012A72B0;
    -[CRLPKStrokePoint velocity](self, "velocity");
    v21 = v20;
    if (!-[CRLPKStrokePoint _hasEstimatedVelocity](self, "_hasEstimatedVelocity"))
      v9 = &stru_1012A72B0;
    v22 = -[CRLPKStrokePoint _estimationUpdateIndex](self, "_estimationUpdateIndex");
    -[CRLPKStrokePoint _length](self, "_length");
    v24 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %p\n\tinflight: %@\n\tlocation: %@ %@\n\tforce: %f %@\n\tazimuth: %f %@\n\taltitude: %f %@\n\tvelocity: %f %@\n\testimationUpdateIndex: %d\n\tlength: %f\n"), v6, self, v42, v8, v10, v12, v13, v15, v16, v18, v19, v21, v9, v22, v23));
  }
  else
  {
    -[CRLPKStrokePoint location](self, "location");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPKStrokePoint _stringFromPoint:](self, "_stringFromPoint:"));
    -[CRLPKStrokePoint force](self, "force");
    v26 = v25;
    -[CRLPKStrokePoint azimuth](self, "azimuth");
    v28 = v27;
    -[CRLPKStrokePoint altitude](self, "altitude");
    v30 = v29;
    -[CRLPKStrokePoint velocity](self, "velocity");
    v32 = v31;
    -[CRLPKStrokePoint _radius](self, "_radius");
    v34 = v33;
    -[CRLPKStrokePoint _opacity](self, "_opacity");
    v36 = v35;
    -[CRLPKStrokePoint _edgeWidth](self, "_edgeWidth");
    v38 = v37;
    -[CRLPKStrokePoint _aspectRatio](self, "_aspectRatio");
    v24 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %p\n\tinflight: %@\n\tlocation: %@\n\tforce: %f\n\tazimuth: %f\n\taltitude: %f\n\tvelocity: %f\n\tradius: %f\n\topacity: %f\n\tedgeWidth: %f\n\taspectRatio: %f\n"), v6, self, v7, v8, v26, v28, v30, v32, v34, v36, v38, v39));
  }
  v40 = (void *)v24;

  return v40;
}

- (id)_stringFromPoint:(CGPoint)a3
{
  CGPoint v4;

  -[CRLPKStrokePoint location](self, "location", a3.x, a3.y);
  return NSStringFromCGPoint(v4);
}

- (void)dealloc
{
  objc_super v3;

  if (self->_pointOwned)
  {
    free(self->_point);
    self->_point = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)CRLPKStrokePoint;
  -[CRLPKStrokePoint dealloc](&v3, "dealloc");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stroke, 0);
}

@end
