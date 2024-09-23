@implementation CRLPKStrokeGenerator

+ (void)initialize
{
  uint64_t v2;
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___CRLPKStrokeGenerator;
  objc_msgSendSuper2(&v3, "initialize");
  objc_opt_class(CRLPKStrokeGenerator, v2);
}

- (CRLPKStrokeGenerator)init
{
  CRLPKStrokeGenerator *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *inputQueue;
  dispatch_queue_t v7;
  OS_dispatch_queue *outputQueue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CRLPKStrokeGenerator;
  v2 = -[CRLPKStrokeGenerator init](&v10, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("com.apple.freeform.pencilkit.draw-input", v4);
    inputQueue = v2->_inputQueue;
    v2->_inputQueue = (OS_dispatch_queue *)v5;

    v7 = dispatch_queue_create("com.apple.freeform.pencilkit.draw-output", v4);
    outputQueue = v2->_outputQueue;
    v2->_outputQueue = (OS_dispatch_queue *)v7;

    v2->_inputScale = 1.0;
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  void *inputProvider;
  void *pixelSmoothingFilter;
  void *pointReductionFilter;
  void *noiseSmoother;
  void *startHookFilter;
  void *endHookFilter;
  void *velocityFilter;
  void *inputSmoother;
  void *inputToOutputFilter;
  void *startCapFilter;
  void *azimuthFilter;
  void *endCapFilter;
  void *compressionFilter;
  void *decompressionFilter;
  void *rulerExtremaFilter;
  void *estimatedAltitudeAndAzimuthFilter;
  objc_super v19;

  inputProvider = self->_inputProvider;
  if (inputProvider)
    (*(void (**)(void *, SEL))(*(_QWORD *)inputProvider + 8))(inputProvider, a2);
  pixelSmoothingFilter = self->_pixelSmoothingFilter;
  if (pixelSmoothingFilter)
    (*(void (**)(void *, SEL))(*(_QWORD *)pixelSmoothingFilter + 8))(pixelSmoothingFilter, a2);
  pointReductionFilter = self->_pointReductionFilter;
  if (pointReductionFilter)
    (*(void (**)(void *, SEL))(*(_QWORD *)pointReductionFilter + 8))(pointReductionFilter, a2);
  noiseSmoother = self->_noiseSmoother;
  if (noiseSmoother)
    (*(void (**)(void *, SEL))(*(_QWORD *)noiseSmoother + 8))(noiseSmoother, a2);
  startHookFilter = self->_startHookFilter;
  if (startHookFilter)
    (*(void (**)(void *, SEL))(*(_QWORD *)startHookFilter + 8))(startHookFilter, a2);
  endHookFilter = self->_endHookFilter;
  if (endHookFilter)
    (*(void (**)(void *, SEL))(*(_QWORD *)endHookFilter + 8))(endHookFilter, a2);
  velocityFilter = self->_velocityFilter;
  if (velocityFilter)
    (*(void (**)(void *, SEL))(*(_QWORD *)velocityFilter + 8))(velocityFilter, a2);
  inputSmoother = self->_inputSmoother;
  if (inputSmoother)
    (*(void (**)(void *, SEL))(*(_QWORD *)inputSmoother + 8))(inputSmoother, a2);
  inputToOutputFilter = self->_inputToOutputFilter;
  if (inputToOutputFilter)
    (*(void (**)(void *, SEL))(*(_QWORD *)inputToOutputFilter + 8))(inputToOutputFilter, a2);
  startCapFilter = self->_startCapFilter;
  if (startCapFilter)
    (*(void (**)(void *, SEL))(*(_QWORD *)startCapFilter + 8))(startCapFilter, a2);
  azimuthFilter = self->_azimuthFilter;
  if (azimuthFilter)
    (*(void (**)(void *, SEL))(*(_QWORD *)azimuthFilter + 8))(azimuthFilter, a2);
  endCapFilter = self->_endCapFilter;
  if (endCapFilter)
    (*(void (**)(void *, SEL))(*(_QWORD *)endCapFilter + 8))(endCapFilter, a2);
  compressionFilter = self->_compressionFilter;
  if (compressionFilter)
    (*(void (**)(void *, SEL))(*(_QWORD *)compressionFilter + 8))(compressionFilter, a2);
  decompressionFilter = self->_decompressionFilter;
  if (decompressionFilter)
    (*(void (**)(void *, SEL))(*(_QWORD *)decompressionFilter + 8))(decompressionFilter, a2);
  rulerExtremaFilter = self->_rulerExtremaFilter;
  if (rulerExtremaFilter)
    (*(void (**)(void *, SEL))(*(_QWORD *)rulerExtremaFilter + 8))(rulerExtremaFilter, a2);
  estimatedAltitudeAndAzimuthFilter = self->_estimatedAltitudeAndAzimuthFilter;
  if (estimatedAltitudeAndAzimuthFilter)
    (*(void (**)(void *, SEL))(*(_QWORD *)estimatedAltitudeAndAzimuthFilter + 8))(estimatedAltitudeAndAzimuthFilter, a2);
  v19.receiver = self;
  v19.super_class = (Class)CRLPKStrokeGenerator;
  -[CRLPKStrokeGenerator dealloc](&v19, "dealloc");
}

- (void)drawingBeganWithStroke:(id)a3 inputType:(int64_t)a4 inputScale:(double)a5 start:(id)a6
{
  id v10;
  id v11;
  NSObject *inputQueue;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  int64_t v18;
  double v19;

  v10 = a3;
  v11 = a6;
  inputQueue = self->_inputQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001556E4;
  block[3] = &unk_10123C2C8;
  block[4] = self;
  v16 = v10;
  v19 = a5;
  v17 = v11;
  v18 = a4;
  v13 = v11;
  v14 = v10;
  dispatch_async(inputQueue, block);

}

- (void)allowSnappingToRuler:(CGAffineTransform *)a3 width:(double)a4
{
  __int128 v4;
  NSObject *inputQueue;
  _QWORD v6[5];
  __int128 v7;
  __int128 v8;
  __int128 v9;
  double v10;

  v6[1] = 3221225472;
  v4 = *(_OWORD *)&a3->c;
  v7 = *(_OWORD *)&a3->a;
  inputQueue = self->_inputQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[2] = sub_1001558FC;
  v6[3] = &unk_10123C2F0;
  v6[4] = self;
  v8 = v4;
  v9 = *(_OWORD *)&a3->tx;
  v10 = a4;
  dispatch_async(inputQueue, v6);
}

- (CGPoint)getRulerSnapLineOriginAndTangent:(CGPoint *)a3 andNormal:(CGPoint *)a4
{
  double v7;
  double v8;
  unsigned int v9;
  double v10;
  float64x2_t v11;
  float64x2_t v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  float64x2_t v21[3];
  float64x2_t v22;
  float64x2_t v23;
  float64x2_t v24;
  CGPoint result;

  v23 = 0u;
  v24 = 0u;
  v22 = 0u;
  -[CRLPKStrokeGenerator rulerTransform](self, "rulerTransform");
  -[CRLPKStrokeGenerator rulerWidth](self, "rulerWidth");
  v8 = v7 * 0.5;
  if (-[CRLPKStrokeGenerator isSnappedToRuler](self, "isSnappedToRuler"))
    v8 = v8 + 1.0;
  v9 = -[CRLPKStrokeGenerator isSnappedToRulerTopSide](self, "isSnappedToRulerTopSide");
  v10 = -v8;
  if (v9)
    v10 = v8;
  v11 = v22;
  v12 = v24;
  v13 = v10 * v23.f64[0];
  v14 = v10 * v23.f64[1];
  if (a3)
  {
    v15 = v24.f64[1] + v14 + v22.f64[1] * 100.0;
    a3->x = v24.f64[0] + v13 + v22.f64[0] * 100.0;
    a3->y = v15;
  }
  if (a4)
  {
    v21[0] = v22;
    v21[1] = v23;
    v21[2] = v24;
    v16 = sub_10006214C(v21, 0.0, v10 + v10);
    a4->x = sub_100060398(v16, v17);
    a4->y = v18;
  }
  v19 = v12.f64[0] + v13 + v11.f64[0] * -100.0;
  v20 = v12.f64[1] + v14 + v11.f64[1] * -100.0;
  result.y = v20;
  result.x = v19;
  return result;
}

- (double)distanceToRulerCenter:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  float64x2_t v15;
  double v16;

  y = a3.y;
  x = a3.x;
  -[CRLPKStrokeGenerator rulerTransform](self, "rulerTransform");
  *(_QWORD *)&v16 = *(_OWORD *)&vaddq_f64((float64x2_t)0, vmlaq_n_f64(vmulq_n_f64((float64x2_t)0, CGPointZero.y), (float64x2_t)0, CGPointZero.x));
  -[CRLPKStrokeGenerator rulerWidth](self, "rulerWidth");
  v15 = vaddq_f64((float64x2_t)0, vmlaq_f64(vmulq_n_f64((float64x2_t)0, v6 * 0.5), (float64x2_t)0, (float64x2_t)0));
  v7 = sub_1000603B8(x, y, v16);
  v9 = v8;
  v10 = sub_1000603B8(v15.f64[0], v15.f64[1], v16);
  v12 = sub_100060398(v10, v11);
  return sub_1000603C4(v7, v9, v12, v13);
}

- (BOOL)shouldSnapPointToRuler:(CGPoint)a3
{
  double y;
  double x;
  _BOOL4 v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v13;

  y = a3.y;
  x = a3.x;
  v6 = -[CRLPKStrokeGenerator useRuler](self, "useRuler");
  if (v6)
  {
    if (self->_currentInputType == 1)
      v7 = 25.0;
    else
      v7 = 45.0;
    -[CRLPKStrokeGenerator rulerWidth](self, "rulerWidth");
    v9 = v8 * 0.5 + v7;
    -[CRLPKStrokeGenerator rulerTransform](self, "rulerTransform");
    v10 = v9 * sub_10007922C(&v13);
    -[CRLPKStrokeGenerator distanceToRulerCenter:](self, "distanceToRulerCenter:", x, y);
    LOBYTE(v6) = fabs(v11) < v10;
  }
  return v6;
}

- (void)snapToRuler
{
  double v3;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;
  uint64_t v6;
  uint64_t v7;

  -[CRLPKStrokeGenerator distanceToRulerCenter:](self, "distanceToRulerCenter:", *(double *)self->_drawPoints.__begin_, *((double *)self->_drawPoints.__begin_ + 1));
  -[CRLPKStrokeGenerator setIsSnappedToRulerTopSide:](self, "setIsSnappedToRulerTopSide:", v3 > 0.0);
  -[CRLPKStrokeGenerator setIsSnappedToRuler:](self, "setIsSnappedToRuler:", 1);
  -[CRLPKStroke _setIsClipped:](self->_currentStroke, "_setIsClipped:", 0);
  begin = self->_drawPoints.__begin_;
  end = self->_drawPoints.__end_;
  while (begin != end)
  {
    -[CRLPKStrokeGenerator snapPointToRuler:](self, "snapPointToRuler:", *(double *)begin, *((double *)begin + 1));
    *(_QWORD *)begin = v6;
    *((_QWORD *)begin + 1) = v7;
    begin = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + 88);
  }
}

- (void)maskToRuler
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8[2];

  -[CRLPKStrokeGenerator distanceToRulerCenter:](self, "distanceToRulerCenter:", *(double *)self->_drawPoints.__begin_, *((double *)self->_drawPoints.__begin_ + 1));
  -[CRLPKStrokeGenerator setIsSnappedToRulerTopSide:](self, "setIsSnappedToRulerTopSide:", v3 > 0.0);
  -[CRLPKStrokeGenerator setIsSnappedToRuler:](self, "setIsSnappedToRuler:", 0);
  -[CRLPKStrokeGenerator getRulerSnapLineOriginAndTangent:andNormal:](self, "getRulerSnapLineOriginAndTangent:andNormal:", 0, v8);
  v5 = v4;
  v7 = v6;
  -[CRLPKStroke _setIsClipped:](self->_currentStroke, "_setIsClipped:", 1);
  -[CRLPKStroke _setClipOrigin:](self->_currentStroke, "_setClipOrigin:", v5, v7);
  -[CRLPKStroke _setClipNormal:](self->_currentStroke, "_setClipNormal:", v8[0], v8[1]);
}

- (CGPoint)snapPointToRuler:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11[2];
  CGPoint result;

  y = a3.y;
  x = a3.x;
  if (-[CRLPKStrokeGenerator isSnappedToRuler](self, "isSnappedToRuler"))
  {
    -[CRLPKStrokeGenerator getRulerSnapLineOriginAndTangent:andNormal:](self, "getRulerSnapLineOriginAndTangent:andNormal:", v11, 0);
    x = sub_100060350(v6, v7, v11[0], v11[1], x, y);
    y = v8;
  }
  v9 = x;
  v10 = y;
  result.y = v10;
  result.x = v9;
  return result;
}

- (void)updateRulerSnapping
{
  double *begin;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;
  double v5;
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
  float64x2_t v17[3];

  if (-[CRLPKStrokeGenerator canSnapToRuler](self, "canSnapToRuler"))
  {
    begin = (double *)self->_drawPoints.__begin_;
    end = self->_drawPoints.__end_;
    if (end != ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)begin)
    {
      if ((unint64_t)(0x2E8BA2E8BA2E8BA3 * ((end - ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)begin) >> 3)) >= 2)
      {
        v5 = sub_1000603B8(*((double *)end - 11), *((double *)end - 10), *begin);
        v7 = v6;
        -[CRLPKStrokeGenerator rulerTransform](self, "rulerTransform");
        v8 = sub_10006214C(v17, 1.0, 0.0);
        v10 = v9;
        if (sub_100061080(v5, v7) > self->_inputScale * (self->_inputScale * 225.0))
        {
          v11 = sub_100060398(v5, v7);
          v13 = v12;
          v14 = sub_100060398(v8, v10);
          v16 = sub_1000603C4(v11, v13, v14, v15);
          if (-[CRLPKStrokeGenerator shouldSnapPointToRuler:](self, "shouldSnapPointToRuler:", *(double *)self->_drawPoints.__begin_, *((double *)self->_drawPoints.__begin_ + 1))&& fabs(v16) > 0.86)
          {
            -[CRLPKStrokeGenerator snapToRuler](self, "snapToRuler");
          }
          else
          {
            -[CRLPKStrokeGenerator maskToRuler](self, "maskToRuler");
          }
          -[CRLPKStrokeGenerator setCanSnapToRuler:](self, "setCanSnapToRuler:", 0);
        }
      }
      if (-[CRLPKStrokeGenerator canSnapToRuler](self, "canSnapToRuler"))
      {
        if (!-[CRLPKStroke _isClipped](self->_currentStroke, "_isClipped"))
          -[CRLPKStrokeGenerator maskToRuler](self, "maskToRuler");
      }
    }
  }
}

- (BOOL)lastPointIsMasked
{
  double v3;
  double v4;
  BOOL v5;
  BOOL result;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  -[CRLPKStrokeGenerator lastPoint](self, "lastPoint");
  v5 = v4 == INFINITY && v3 == INFINITY;
  result = 0;
  if (!v5
    && -[CRLPKStrokeGenerator useRuler](self, "useRuler")
    && !-[CRLPKStrokeGenerator isSnappedToRuler](self, "isSnappedToRuler"))
  {
    -[CRLPKStrokeGenerator lastPoint](self, "lastPoint");
    -[CRLPKStrokeGenerator distanceToRulerCenter:](self, "distanceToRulerCenter:");
    v8 = v7;
    -[CRLPKStrokeGenerator rulerWidth](self, "rulerWidth");
    v10 = v9 * 0.5;
    -[CRLPKStrokeGenerator rulerTransform](self, "rulerTransform");
    v11 = v10 * sub_10007922C(&v12);
    if (-[CRLPKStrokeGenerator isSnappedToRulerTopSide](self, "isSnappedToRulerTopSide"))
    {
      if (v8 < v11)
        return 1;
    }
    if (!-[CRLPKStrokeGenerator isSnappedToRulerTopSide](self, "isSnappedToRulerTopSide") && v11 > -v8)
      return 1;
  }
  return result;
}

- (void)setSmoothingThresholdMultiplier:(double)a3
{
  sub_1003A4980((uint64_t)self->_inputSmoother, a3);
}

- (void)setPointReductionFilterThresholdMultiplier:(double)a3
{
  sub_100155FFC((uint64_t)self->_pointReductionFilter, a3);
}

- (void)outputFilter
{
  return -[CRLPKStrokeGenerator decompressionFilter](self, "decompressionFilter");
}

- (void)getUpdatedRangeFromIndex:(unint64_t *)a3
{
  NSObject *outputQueue;
  void *v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  outputQueue = self->_outputQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10015625C;
  block[3] = &unk_10123C318;
  block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(outputQueue, block);
  v4 = (void *)v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)getInputUpdatedRangeFromIndex:(unint64_t *)a3
{
  operator new();
}

- (unint64_t)copyInputUpdatedRangeFromIndex:(unint64_t)a3 into:(void *)a4
{
  sub_100007908((uint64_t)a4, *((_QWORD *)a4 + 1), (char *)self->_drawPoints.__begin_ + 88 * a3, (char *)self->_drawPoints.__end_, 0x2E8BA2E8BA2E8BA3* ((self->_drawPoints.__end_ - ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)self->_drawPoints.__begin_ + 88 * a3)) >> 3));
  return self->_immutableCount;
}

- (void)reset
{
  self->_drawPoints.__end_ = self->_drawPoints.__begin_;
  self->_immutableCount = 0;
  -[CRLPKStrokeGenerator setIsSnappedToRuler:](self, "setIsSnappedToRuler:", 0);
  sub_10015639C((uint64_t)&self->_outputPoints, 0);
  self->_outputImmutableCount = 0;
  self->_inputHasChanged = 0;
}

+ (_CRLPKStrokePoint)outputPointFromInputPoint:(SEL)a3
{
  __int128 v4;
  double var5;

  v4 = *(_OWORD *)&a4->var1;
  retstr->location = a4->var0;
  var5 = a4->var5;
  *(_OWORD *)&retstr->force = v4;
  retstr->altitude = a4->var3;
  retstr->opacity = 1.0;
  retstr->edgeWidth = 0.0;
  *(_OWORD *)&retstr->radius = xmmword_100EED0A0;
  retstr->timestamp = var5;
  return result;
}

- (_CRLPKStrokePoint)outputCurrentStrokePoint:(SEL)a3
{
  __int128 v5;
  __int128 v6;
  CRLPKStroke *currentStroke;
  _OWORD v9[5];
  _OWORD v10[5];
  uint64_t v11;

  v5 = *(_OWORD *)&a4->var5;
  v10[2] = *(_OWORD *)&a4->var3;
  v10[3] = v5;
  v10[4] = *(_OWORD *)&a4->var7;
  v11 = *(_QWORD *)&a4->var9;
  v6 = *(_OWORD *)&a4->var1;
  v10[0] = a4->var0;
  v10[1] = v6;
  currentStroke = self->_currentStroke;
  if (currentStroke)
    -[CRLPKStroke _baseValues](currentStroke, "_baseValues");
  else
    memset(v9, 0, sizeof(v9));
  return -[CRLPKStrokeGenerator outputPoint:baseValues:](self, "outputPoint:baseValues:", v10, v9);
}

- (_CRLPKStrokePoint)outputPoint:(SEL)a3 baseValues:(id *)a4
{
  double strokeMaxForce;
  __int128 v6;
  __int128 v7;
  _OWORD v9[5];
  uint64_t v10;

  strokeMaxForce = self->_strokeMaxForce;
  if (strokeMaxForce <= a4->var1)
    strokeMaxForce = a4->var1;
  self->_strokeMaxForce = strokeMaxForce;
  self->_eraserIndicatorAlpha = 1.0;
  v6 = *(_OWORD *)&a4->var5;
  v9[2] = *(_OWORD *)&a4->var3;
  v9[3] = v6;
  v9[4] = *(_OWORD *)&a4->var7;
  v10 = *(_QWORD *)&a4->var9;
  v7 = *(_OWORD *)&a4->var1;
  v9[0] = a4->var0;
  v9[1] = v7;
  return +[CRLPKStrokeGenerator outputPointFromInputPoint:](CRLPKStrokeGenerator, "outputPointFromInputPoint:", v9, a5);
}

- (int64_t)fetchFilteredPointsFromIndex:(int64_t)a3 intoVector:(void *)a4
{
  NSObject *outputQueue;
  int64_t v5;
  _QWORD v7[8];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  outputQueue = self->_outputQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100156794;
  v7[3] = &unk_10123C380;
  v7[6] = a4;
  v7[7] = a3;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(outputQueue, v7);
  v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (void)drawingUpdatePoint:(id *)a3
{
  __int128 v4;
  __int128 v5;
  NSObject *outputQueue;
  _QWORD v7[5];
  CGPoint var0;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v7[1] = 3221225472;
  v4 = *(_OWORD *)&a3->var5;
  v10 = *(_OWORD *)&a3->var3;
  v11 = v4;
  v12 = *(_OWORD *)&a3->var7;
  v5 = *(_OWORD *)&a3->var1;
  var0 = a3->var0;
  outputQueue = self->_outputQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[2] = sub_1001568F4;
  v7[3] = &unk_10123C3A8;
  v7[4] = self;
  v13 = *(_QWORD *)&a3->var9;
  v9 = v5;
  dispatch_async(outputQueue, v7);
  -[CRLPKStrokeGenerator drawingUpdateAllPoints](self, "drawingUpdateAllPoints");
}

- (void)drawingUpdateAllPoints
{
  NSObject *outputQueue;
  _QWORD block[5];

  outputQueue = self->_outputQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100156ADC;
  block[3] = &unk_101231C50;
  block[4] = self;
  dispatch_async(outputQueue, block);
}

- (void)updateImmutableCount
{
  void *v3;
  double v4;
  double v5;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  uint64_t v7;
  unint64_t v8;
  unint64_t i;
  char *v10;
  _QWORD *v11;
  uint64_t v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  objc_msgSend(v3, "systemUptime");
  v5 = v4;

  if (!-[CRLPKStrokeGenerator canSnapToRuler](self, "canSnapToRuler"))
  {
    begin = self->_drawPoints.__begin_;
    v7 = self->_drawPoints.__end_ - begin;
    if (v7)
    {
      v8 = 0x2E8BA2E8BA2E8BA3 * (v7 >> 3);
      for (i = self->_immutableCount; i < v8; self->_immutableCount = i)
      {
        v10 = (char *)begin + 88 * i;
        v12 = *((_QWORD *)v10 + 8);
        v11 = v10 + 64;
        if ((v12 & 0x8000000000000000) == 0)
        {
          if (*((double *)begin + 11 * i + 6) >= v5 + -0.1)
            return;
          *v11 = -1;
        }
        if (*((_BYTE *)begin + 88 * i + 56))
          break;
        i = self->_immutableCount + 1;
      }
    }
  }
}

- (void)removePredictedTouches
{
  vector<CRLPKInputPoint, std::allocator<CRLPKInputPoint>> *p_drawPoints;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 *i;

  begin = self->_drawPoints.__begin_;
  end = self->_drawPoints.__end_;
  p_drawPoints = &self->_drawPoints;
  v5 = (unsigned __int128)((end - begin) * (__int128)0x2E8BA2E8BA2E8BA3) >> 64;
  v6 = (v5 >> 4) + ((unint64_t)v5 >> 63);
  for (i = (unsigned __int8 *)begin + 88 * v6 - 32; v6-- >= 1; i -= 88)
  {
    if (!*i)
    {
      sub_100007118((uint64_t)p_drawPoints, v6 + 1);
      return;
    }
  }
}

- (void)addPoints:()vector<CRLPKInputPoint
{
  NSObject *inputQueue;
  _QWORD v4[5];
  void *__p;
  void *v6;
  uint64_t v7;

  inputQueue = self->_inputQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3321888768;
  v4[2] = sub_100156E60;
  v4[3] = &unk_10123C3D0;
  v4[4] = self;
  __p = 0;
  v6 = 0;
  v7 = 0;
  sub_10015D70C(&__p, a3->__begin_, (uint64_t)a3->__end_, 0x2E8BA2E8BA2E8BA3 * ((a3->__end_ - a3->__begin_) >> 3));
  dispatch_async(inputQueue, v4);
  if (__p)
  {
    v6 = __p;
    operator delete(__p);
  }
}

- (void)addPoint:(id *)a3
{
  __int128 v3;
  __int128 v4;
  NSObject *inputQueue;
  _QWORD v6[5];
  CGPoint var0;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v6[1] = 3221225472;
  v3 = *(_OWORD *)&a3->var5;
  v9 = *(_OWORD *)&a3->var3;
  v10 = v3;
  v11 = *(_OWORD *)&a3->var7;
  v4 = *(_OWORD *)&a3->var1;
  var0 = a3->var0;
  inputQueue = self->_inputQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[2] = sub_10015707C;
  v6[3] = &unk_10123C3A8;
  v6[4] = self;
  v12 = *(_QWORD *)&a3->var9;
  v8 = v4;
  dispatch_async(inputQueue, v6);
}

- (void)_drawingAddPoint:(id *)a3
{
  CGFloat v5;
  CGFloat v6;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *value;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v13;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char *v19;
  char *v20;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v26;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;

  self->_inputHasChanged = 1;
  if (!a3->var6)
    -[CRLPKStrokeGenerator removePredictedTouches](self, "removePredictedTouches");
  -[CRLPKStrokeGenerator snapPointToRuler:](self, "snapPointToRuler:", a3->var0.x, a3->var0.y);
  a3->var0.x = v5;
  a3->var0.y = v6;
  value = self->_drawPoints.__end_cap_.__value_;
  end = self->_drawPoints.__end_;
  if (end >= value)
  {
    begin = self->_drawPoints.__begin_;
    v15 = 0x2E8BA2E8BA2E8BA3 * ((end - begin) >> 3);
    v16 = v15 + 1;
    if ((unint64_t)(v15 + 1) > 0x2E8BA2E8BA2E8BALL)
      sub_100007810();
    v17 = 0x2E8BA2E8BA2E8BA3 * ((value - begin) >> 3);
    if (2 * v17 > v16)
      v16 = 2 * v17;
    if (v17 >= 0x1745D1745D1745DLL)
      v18 = 0x2E8BA2E8BA2E8BALL;
    else
      v18 = v16;
    if (v18)
      v19 = (char *)sub_100007898((uint64_t)&self->_drawPoints.__end_cap_, v18);
    else
      v19 = 0;
    v20 = &v19[88 * v15];
    v21 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v19[88 * v18];
    v22 = *(_OWORD *)&a3->var1;
    *(CGPoint *)v20 = a3->var0;
    *((_OWORD *)v20 + 1) = v22;
    v23 = *(_OWORD *)&a3->var3;
    v24 = *(_OWORD *)&a3->var5;
    v25 = *(_OWORD *)&a3->var7;
    *((_QWORD *)v20 + 10) = *(_QWORD *)&a3->var9;
    *((_OWORD *)v20 + 3) = v24;
    *((_OWORD *)v20 + 4) = v25;
    *((_OWORD *)v20 + 2) = v23;
    v13 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v20 + 88);
    v27 = self->_drawPoints.__begin_;
    v26 = self->_drawPoints.__end_;
    if (v26 != v27)
    {
      do
      {
        v28 = *(_OWORD *)((char *)v26 - 88);
        *(_OWORD *)(v20 - 72) = *(_OWORD *)((char *)v26 - 72);
        *(_OWORD *)(v20 - 88) = v28;
        v29 = *(_OWORD *)((char *)v26 - 56);
        v30 = *(_OWORD *)((char *)v26 - 40);
        v31 = *(_OWORD *)((char *)v26 - 24);
        *((_QWORD *)v20 - 1) = *((_QWORD *)v26 - 1);
        *(_OWORD *)(v20 - 24) = v31;
        *(_OWORD *)(v20 - 40) = v30;
        *(_OWORD *)(v20 - 56) = v29;
        v20 -= 88;
        v26 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v26 - 88);
      }
      while (v26 != v27);
      v26 = self->_drawPoints.__begin_;
    }
    self->_drawPoints.__begin_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v20;
    self->_drawPoints.__end_ = v13;
    self->_drawPoints.__end_cap_.__value_ = v21;
    if (v26)
      operator delete(v26);
  }
  else
  {
    v9 = *(_OWORD *)&a3->var1;
    *(CGPoint *)end = a3->var0;
    *((_OWORD *)end + 1) = v9;
    v10 = *(_OWORD *)&a3->var3;
    v11 = *(_OWORD *)&a3->var5;
    v12 = *(_OWORD *)&a3->var7;
    *((_QWORD *)end + 10) = *(_QWORD *)&a3->var9;
    *((_OWORD *)end + 3) = v11;
    *((_OWORD *)end + 4) = v12;
    *((_OWORD *)end + 2) = v10;
    v13 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)end + 88);
  }
  self->_drawPoints.__end_ = v13;
  -[CRLPKStrokeGenerator updateRulerSnapping](self, "updateRulerSnapping");
  -[CRLPKStrokeGenerator drawingUpdateAllPoints](self, "drawingUpdateAllPoints");
  -[CRLPKStrokeGenerator updateImmutableCount](self, "updateImmutableCount");
  -[CRLPKStrokeGenerator setLastPoint:](self, "setLastPoint:", a3->var0.x, a3->var0.y);
}

- (void)drawingEndedWithCompletion:(id)a3
{
  id v4;
  NSObject *inputQueue;
  id v6;
  void **v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  CRLPKStrokeGenerator *v11;
  id v12;

  v4 = a3;
  inputQueue = self->_inputQueue;
  v7 = _NSConcreteStackBlock;
  v8 = 3221225472;
  v9 = sub_1001573DC;
  v10 = &unk_10123C430;
  v11 = self;
  v12 = v4;
  v6 = v4;
  dispatch_async(inputQueue, &v7);
  -[CRLPKStrokeGenerator setLastPoint:](self, "setLastPoint:", INFINITY, INFINITY, v7, v8, v9, v10, v11);

}

- (void)drawingCancelledWithCompletion:(id)a3
{
  id v4;
  NSObject *inputQueue;
  id v6;
  void **v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  CRLPKStrokeGenerator *v11;
  id v12;

  v4 = a3;
  inputQueue = self->_inputQueue;
  v7 = _NSConcreteStackBlock;
  v8 = 3221225472;
  v9 = sub_1001577E8;
  v10 = &unk_10123C458;
  v11 = self;
  v12 = v4;
  v6 = v4;
  dispatch_async(inputQueue, &v7);
  -[CRLPKStrokeGenerator setLastPoint:](self, "setLastPoint:", INFINITY, INFINITY, v7, v8, v9, v10, v11);

}

+ (vector<CRLPKInputPoint,)inputPointsFromPath:(id)a2
{
  double v5;
  double v6;
  double v7;
  double *v8;
  unint64_t v9;
  double v10;
  double *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char *v16;
  double *v17;
  double *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  double *v24;
  double v25;
  vector<CRLPKInputPoint, std::allocator<CRLPKInputPoint>> *v26;
  double v27;
  unint64_t v28;
  __compressed_pair<CRLPKInputPoint *, std::allocator<CRLPKInputPoint>> *p_end_cap;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;
  unint64_t v31;
  double v32;
  __int128 *v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  char *v37;
  char *v38;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v39;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  vector<CRLPKInputPoint, std::allocator<CRLPKInputPoint>> *result;
  __int128 v47;
  double *v48;
  double *v49;
  double *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *__p;
  void *v61;
  uint64_t v62;
  double *v63;
  double *v64;
  uint64_t v65;
  vector<CRLPKInputPoint, std::allocator<CRLPKInputPoint>> *v66;
  vector<CRLPKInputPoint, std::allocator<CRLPKInputPoint>> *v67;
  uint64_t v68;

  v66 = 0;
  v67 = 0;
  v68 = 0;
  sub_100194A88(a4, &v66);
  v63 = 0;
  v64 = 0;
  v65 = 0;
  v61 = 0;
  v62 = 0;
  __p = 0;
  sub_10015D7D8(&__p, v66, (uint64_t)v67, ((char *)v67 - (char *)v66) >> 4);
  sub_100194B08((uint64_t *)&__p, (uint64_t)&v63);
  if (__p)
  {
    v61 = __p;
    operator delete(__p);
  }
  v57 = 0;
  v58 = 0;
  v59 = 0;
  sub_10015D7D8(&v57, v66, (uint64_t)v67, ((char *)v67 - (char *)v66) >> 4);
  v5 = sub_1001943D4(&v57) * 0.01;
  v6 = fabs(sqrt(v5));
  if (v5 == -INFINITY)
    v7 = INFINITY;
  else
    v7 = v6;
  if (v57)
  {
    v58 = v57;
    operator delete(v57);
  }
  v54 = 0;
  v55 = 0;
  v56 = 0;
  v52 = 0;
  v53 = 0;
  v51 = 0;
  sub_10015D7D8(&v51, v66, (uint64_t)v67, ((char *)v67 - (char *)v66) >> 4);
  sub_1004056FC((uint64_t)&v51, (uint64_t)&v54);
  if (v51)
  {
    v52 = v51;
    operator delete(v51);
  }
  v48 = 0;
  v49 = 0;
  v50 = 0;
  if (v67 != v66)
  {
    v8 = 0;
    v9 = 0;
    v10 = 0.0;
    do
    {
      v10 = v10 + v63[v9] * *((double *)v54 + v9);
      if (v8 >= v50)
      {
        v11 = v48;
        v12 = v8 - v48;
        v13 = v12 + 1;
        if ((unint64_t)(v12 + 1) >> 61)
          sub_100007810();
        v14 = (char *)v50 - (char *)v48;
        if (((char *)v50 - (char *)v48) >> 2 > v13)
          v13 = v14 >> 2;
        if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFF8)
          v15 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v15 = v13;
        if (v15)
        {
          v16 = (char *)sub_10002BA34((uint64_t)&v50, v15);
          v11 = v48;
          v8 = v49;
        }
        else
        {
          v16 = 0;
        }
        v17 = (double *)&v16[8 * v12];
        *v17 = v10;
        v18 = v17 + 1;
        while (v8 != v11)
        {
          v19 = *((_QWORD *)v8-- - 1);
          *((_QWORD *)v17-- - 1) = v19;
        }
        v48 = v17;
        v50 = (double *)&v16[8 * v15];
        if (v11)
          operator delete(v11);
        v8 = v18;
      }
      else
      {
        *v8++ = v10;
      }
      v49 = v8;
      ++v9;
    }
    while (v9 < ((char *)v67 - (char *)v66) >> 4);
    v20 = (char *)v8 - (char *)v48;
    if (v20)
    {
      v21 = v20 >> 3;
      v22 = v20 >> 3 != 0;
      v23 = (v20 >> 3) - 1;
      if (v23 == 0 || !v22)
        v21 = 1;
      v24 = v48;
      do
      {
        *v24 = *v24 / v48[v23];
        ++v24;
        --v21;
      }
      while (v21);
    }
  }
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v26 = v66;
  if (v67 != v66)
  {
    v27 = v25;
    v28 = 0;
    p_end_cap = &retstr->__end_cap_;
    end = retstr->__end_;
    do
    {
      v31 = v49 - v48 - 1;
      if (v28 < v31)
        v31 = v28;
      v32 = v27 + v7 * v48[v31];
      v33 = (__int128 *)((char *)v26 + 16 * v28);
      v47 = *v33;
      if (end >= p_end_cap->__value_)
      {
        v34 = 0x2E8BA2E8BA2E8BA3 * ((end - retstr->__begin_) >> 3);
        v35 = v34 + 1;
        if ((unint64_t)(v34 + 1) > 0x2E8BA2E8BA2E8BALL)
          sub_100007810();
        if (0x5D1745D1745D1746 * ((p_end_cap->__value_ - retstr->__begin_) >> 3) > v35)
          v35 = 0x5D1745D1745D1746 * ((p_end_cap->__value_ - retstr->__begin_) >> 3);
        if ((unint64_t)(0x2E8BA2E8BA2E8BA3 * ((p_end_cap->__value_ - retstr->__begin_) >> 3)) >= 0x1745D1745D1745DLL)
          v36 = 0x2E8BA2E8BA2E8BALL;
        else
          v36 = v35;
        if (v36)
          v37 = (char *)sub_100007898((uint64_t)&retstr->__end_cap_, v36);
        else
          v37 = 0;
        v38 = &v37[88 * v34];
        *(_OWORD *)v38 = v47;
        *((_QWORD *)v38 + 4) = 0;
        *((_QWORD *)v38 + 5) = 0;
        *((_QWORD *)v38 + 2) = 0xBFF0000000000000;
        *((_QWORD *)v38 + 3) = 0;
        *((double *)v38 + 6) = v32;
        *(_OWORD *)(v38 + 56) = xmmword_100EEC720;
        *((_QWORD *)v38 + 9) = 0;
        *((_QWORD *)v38 + 10) = 0;
        begin = retstr->__begin_;
        v39 = retstr->__end_;
        v41 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v38;
        if (v39 != retstr->__begin_)
        {
          do
          {
            v42 = *(_OWORD *)((char *)v39 - 88);
            *(_OWORD *)((char *)v41 - 72) = *(_OWORD *)((char *)v39 - 72);
            *(_OWORD *)((char *)v41 - 88) = v42;
            v43 = *(_OWORD *)((char *)v39 - 56);
            v44 = *(_OWORD *)((char *)v39 - 40);
            v45 = *(_OWORD *)((char *)v39 - 24);
            *((_QWORD *)v41 - 1) = *((_QWORD *)v39 - 1);
            *(_OWORD *)((char *)v41 - 24) = v45;
            *(_OWORD *)((char *)v41 - 40) = v44;
            *(_OWORD *)((char *)v41 - 56) = v43;
            v41 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v41 - 88);
            v39 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v39 - 88);
          }
          while (v39 != begin);
          v39 = begin;
        }
        end = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v38 + 88);
        retstr->__begin_ = v41;
        retstr->__end_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v38 + 88);
        retstr->__end_cap_.__value_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v37[88 * v36];
        if (v39)
          operator delete(v39);
      }
      else
      {
        *(_OWORD *)end = *v33;
        *((_QWORD *)end + 2) = 0xBFF0000000000000;
        *(_OWORD *)((char *)end + 24) = 0uLL;
        *((_QWORD *)end + 5) = 0;
        *((double *)end + 6) = v32;
        *(_OWORD *)((char *)end + 56) = xmmword_100EEC720;
        *(_OWORD *)((char *)end + 72) = 0uLL;
        end = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)end + 88);
      }
      retstr->__end_ = end;
      ++v28;
      v26 = v66;
    }
    while (v28 < ((char *)v67 - (char *)v66) >> 4);
  }
  if (v48)
    operator delete(v48);
  if (v54)
  {
    v55 = v54;
    operator delete(v54);
  }
  if (v63)
  {
    v64 = v63;
    operator delete(v63);
  }
  result = v66;
  if (v66)
  {
    v67 = v66;
    operator delete(v66);
  }
  return result;
}

- (id)strokeFromPath:(CGPath *)a3 inputScale:(double)a4
{
  void *v7;
  dispatch_semaphore_t v8;
  NSObject *v9;
  id v10;
  _QWORD v12[4];
  NSObject *v13;
  uint64_t *v14;
  void *__p;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  CRLPKStroke *v23;
  void *v24;
  _BYTE *v25;
  uint64_t v26;

  v7 = (void *)objc_opt_class(self, a2);
  if (v7)
  {
    objc_msgSend(v7, "inputPointsFromPath:", a3);
  }
  else
  {
    v24 = 0;
    v25 = 0;
    v26 = 0;
  }
  v8 = dispatch_semaphore_create(0);
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_100158020;
  v22 = sub_100158030;
  v23 = objc_alloc_init(CRLPKStroke);
  -[CRLPKStrokeGenerator drawingBeganWithStroke:inputType:inputScale:start:](self, "drawingBeganWithStroke:inputType:inputScale:start:", v19[5], 0, 0, a4);
  __p = 0;
  v16 = 0;
  v17 = 0;
  sub_10015D70C(&__p, v24, (uint64_t)v25, 0x2E8BA2E8BA2E8BA3 * ((v25 - (_BYTE *)v24) >> 3));
  -[CRLPKStrokeGenerator addPoints:](self, "addPoints:", &__p);
  if (__p)
  {
    v16 = __p;
    operator delete(__p);
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100158038;
  v12[3] = &unk_10123C480;
  v14 = &v18;
  v9 = v8;
  v13 = v9;
  -[CRLPKStrokeGenerator drawingEndedWithCompletion:](self, "drawingEndedWithCompletion:", v12);
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  v10 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  if (v24)
  {
    v25 = v24;
    operator delete(v24);
  }
  return v10;
}

- (void)whenFinishedProcessingPointsCallCompletion:(id)a3
{
  id v4;
  NSObject *inputQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  inputQueue = self->_inputQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100158100;
  v7[3] = &unk_10123C430;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(inputQueue, v7);

}

- (CGAffineTransform)rulerTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[7].d;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[7].b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[7].ty;
  return self;
}

- (void)setRulerTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_rulerTransform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_rulerTransform.tx = v4;
  *(_OWORD *)&self->_rulerTransform.a = v3;
}

- (BOOL)useRuler
{
  return self->_useRuler;
}

- (void)setUseRuler:(BOOL)a3
{
  self->_useRuler = a3;
}

- (double)rulerWidth
{
  return self->_rulerWidth;
}

- (void)setRulerWidth:(double)a3
{
  self->_rulerWidth = a3;
}

- (BOOL)isSnappedToRulerTopSide
{
  return self->_isSnappedToRulerTopSide;
}

- (void)setIsSnappedToRulerTopSide:(BOOL)a3
{
  self->_isSnappedToRulerTopSide = a3;
}

- (BOOL)canSnapToRuler
{
  return self->_canSnapToRuler;
}

- (void)setCanSnapToRuler:(BOOL)a3
{
  self->_canSnapToRuler = a3;
}

- (double)strokeMaxForce
{
  return self->_strokeMaxForce;
}

- (void)setStrokeMaxForce:(double)a3
{
  self->_strokeMaxForce = a3;
}

- (CGPoint)lastPoint
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->_lastPoint, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setLastPoint:(CGPoint)a3
{
  CGPoint v3;

  v3 = a3;
  objc_copyStruct(&self->_lastPoint, &v3, 16, 1, 0);
}

- (OS_dispatch_queue)outputQueue
{
  return self->_outputQueue;
}

- (void)setOutputQueue:(id)a3
{
  objc_storeStrong((id *)&self->_outputQueue, a3);
}

- (void)inputProvider
{
  return self->_inputProvider;
}

- (void)setInputProvider:(void *)a3
{
  self->_inputProvider = a3;
}

- (void)pixelSmoothingFilter
{
  return self->_pixelSmoothingFilter;
}

- (void)setPixelSmoothingFilter:(void *)a3
{
  self->_pixelSmoothingFilter = a3;
}

- (void)pointReductionFilter
{
  return self->_pointReductionFilter;
}

- (void)setPointReductionFilter:(void *)a3
{
  self->_pointReductionFilter = a3;
}

- (void)startHookFilter
{
  return self->_startHookFilter;
}

- (void)setStartHookFilter:(void *)a3
{
  self->_startHookFilter = a3;
}

- (void)endHookFilter
{
  return self->_endHookFilter;
}

- (void)setEndHookFilter:(void *)a3
{
  self->_endHookFilter = a3;
}

- (void)velocityFilter
{
  return self->_velocityFilter;
}

- (void)setVelocityFilter:(void *)a3
{
  self->_velocityFilter = a3;
}

- (void)inputSmoother
{
  return self->_inputSmoother;
}

- (void)setInputSmoother:(void *)a3
{
  self->_inputSmoother = a3;
}

- (void)inputToOutputFilter
{
  return self->_inputToOutputFilter;
}

- (void)setInputToOutputFilter:(void *)a3
{
  self->_inputToOutputFilter = a3;
}

- (void)startCapFilter
{
  return self->_startCapFilter;
}

- (void)setStartCapFilter:(void *)a3
{
  self->_startCapFilter = a3;
}

- (void)azimuthFilter
{
  return self->_azimuthFilter;
}

- (void)setAzimuthFilter:(void *)a3
{
  self->_azimuthFilter = a3;
}

- (void)endCapFilter
{
  return self->_endCapFilter;
}

- (void)setEndCapFilter:(void *)a3
{
  self->_endCapFilter = a3;
}

- (void)rulerExtremaFilter
{
  return self->_rulerExtremaFilter;
}

- (void)setRulerExtremaFilter:(void *)a3
{
  self->_rulerExtremaFilter = a3;
}

- (void)estimatedAltitudeAndAzimuthFilter
{
  return self->_estimatedAltitudeAndAzimuthFilter;
}

- (void)setEstimatedAltitudeAndAzimuthFilter:(void *)a3
{
  self->_estimatedAltitudeAndAzimuthFilter = a3;
}

- (void)compressionFilter
{
  return self->_compressionFilter;
}

- (void)setCompressionFilter:(void *)a3
{
  self->_compressionFilter = a3;
}

- (void)decompressionFilter
{
  return self->_decompressionFilter;
}

- (void)setDecompressionFilter:(void *)a3
{
  self->_decompressionFilter = a3;
}

- (BOOL)isSnappedToRuler
{
  return self->_isSnappedToRuler;
}

- (void)setIsSnappedToRuler:(BOOL)a3
{
  self->_isSnappedToRuler = a3;
}

- (double)eraserIndicatorAlpha
{
  return self->_eraserIndicatorAlpha;
}

- (void)setEraserIndicatorAlpha:(double)a3
{
  self->_eraserIndicatorAlpha = a3;
}

- (double)inputScale
{
  return self->_inputScale;
}

- (void)setInputScale:(double)a3
{
  self->_inputScale = a3;
}

- (double)touchSensitivity
{
  return self->_touchSensitivity;
}

- (void)setTouchSensitivity:(double)a3
{
  self->_touchSensitivity = a3;
}

- (void)noiseSmoother
{
  return self->_noiseSmoother;
}

- (void)setNoiseSmoother:(void *)a3
{
  self->_noiseSmoother = a3;
}

- (void).cxx_destruct
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  _CRLPKStrokePoint *v4;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v5;

  objc_storeStrong((id *)&self->_outputQueue, 0);
  objc_storeStrong((id *)&self->_drawingWaitForFinishSemaphore, 0);
  begin = self->_updatedDrawPoints.__begin_;
  if (begin)
  {
    self->_updatedDrawPoints.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_currentStroke, 0);
  objc_storeStrong((id *)&self->_inputQueue, 0);
  v4 = self->_outputPoints.__begin_;
  if (v4)
  {
    self->_outputPoints.__end_ = v4;
    operator delete(v4);
  }
  v5 = self->_drawPoints.__begin_;
  if (v5)
  {
    self->_drawPoints.__end_ = v5;
    operator delete(v5);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 13) = 0;
  *((_QWORD *)self + 14) = 0;
  *((_QWORD *)self + 15) = 0;
  *(_OWORD *)((char *)self + 8) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  return self;
}

@end
