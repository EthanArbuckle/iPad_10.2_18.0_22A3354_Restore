@implementation CRLFreehandDrawingToolInputPoint

- (CRLFreehandDrawingToolInputPoint)initWithUnscaledPoint:(CGPoint)a3 time:(double)a4 inputType:(int64_t)a5 isPredicted:(BOOL)a6 activeInputProperties:(unint64_t)a7 altitudeAngleInRadians:(double)a8 azimuthAngleInRadians:(double)a9 rollAngleInRadians:(double)a10 force:(double)a11 estimationUpdateIndex:(int64_t)a12 hasEstimatedAltitudeAndAzimuth:(BOOL)a13 wasAddedByTouchesEnded:(BOOL)a14
{
  CGFloat y;
  CGFloat x;
  CRLFreehandDrawingToolInputPoint *result;
  objc_super v28;

  y = a3.y;
  x = a3.x;
  v28.receiver = self;
  v28.super_class = (Class)CRLFreehandDrawingToolInputPoint;
  result = -[CRLFreehandDrawingToolInputPoint init](&v28, "init");
  if (result)
  {
    result->_unscaledPoint.x = x;
    result->_unscaledPoint.y = y;
    result->_time = a4;
    result->_isPredicted = a6;
    result->_inputType = a5;
    result->_activeInputProperties = a7;
    result->_altitudeAngleInRadians = a8;
    result->_azimuthAngleInRadians = a9;
    result->_rollAngleInRadians = a10;
    result->_force = a11;
    result->_estimationUpdateIndex = a12;
    result->_hasEstimatedAltitudeAndAzimuth = a13;
    result->_wasAddedByTouchesEnded = a14;
  }
  return result;
}

- (CRLFreehandDrawingToolInputPoint)initWithUnscaledPoint:(CGPoint)a3 touch:(id)a4 activeInputProperties:(unint64_t)a5 isPredicted:(BOOL)a6 wasAddedByTouchesEnded:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  double y;
  double x;
  id v13;
  double v14;
  double v15;
  _BOOL8 v16;
  double v17;
  double v18;
  uint64_t v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  CRLFreehandDrawingToolInputPoint *v40;

  v7 = a7;
  v8 = a6;
  y = a3.y;
  x = a3.x;
  v13 = a4;
  if (objc_msgSend(v13, "type") == (id)2)
  {
    objc_msgSend(v13, "altitudeAngle");
    if (fabs(v14) == INFINITY)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124C7F8);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E18F40();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124C818);
      v21 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE87A4(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolInputPoint initWithUnscaledPoint:touch:activeInputProperties:isPredicted:wasAddedByTouchesEnded:]"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolInputPoint.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v22, v23, 90, 0, "UITouch altitudeAngle is invalid; using a default in its place.");

      v15 = 0.785398163;
    }
    else
    {
      v15 = 1.57079633 - v14;
    }
    objc_msgSend(v13, "azimuthAngleInView:", 0);
    if (fabs(v24) == INFINITY)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124C838);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E18EC0();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124C858);
      v25 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE87A4(v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolInputPoint initWithUnscaledPoint:touch:activeInputProperties:isPredicted:wasAddedByTouchesEnded:]"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolInputPoint.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v26, v27, 97, 0, "UITouch azimuth is invalid; using a default in its place.");

      v20 = 0.0;
    }
    else
    {
      v20 = v24 + -3.14159265;
    }
    objc_msgSend(v13, "_rollAngle");
    if (fabs(v28) == INFINITY)
      v28 = 0.0;
    v17 = v28;
    objc_msgSend(v13, "maximumPossibleForce");
    v18 = -1.0;
    if (v29 > 0.0)
    {
      objc_msgSend(v13, "force");
      if (fabs(v30) == INFINITY)
      {
        objc_msgSend(v13, "maximumPossibleForce");
        v33 = v32;
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10124C878);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E18E40();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10124C898);
        v34 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE87A4(v34);
        v18 = v33 * 0.5;
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolInputPoint initWithUnscaledPoint:touch:activeInputProperties:isPredicted:wasAddedByTouchesEnded:]"));
        v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolInputPoint.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v35, v36, 114, 0, "UITouch force is invalid; using a default in its place.");

      }
      else
      {
        objc_msgSend(v13, "force");
        v18 = v31;
      }
    }
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "estimationUpdateIndex"));
    v38 = v37;
    if (v37)
      v19 = (uint64_t)objc_msgSend(v37, "integerValue");
    else
      v19 = -1;
    v16 = ((unint64_t)objc_msgSend(v13, "estimatedProperties") & 6) != 0;

  }
  else
  {
    v16 = 0;
    v17 = 0.0;
    v18 = -1.0;
    v19 = -1;
    v15 = 0.785398163;
    v20 = 0.0;
  }
  objc_msgSend(v13, "timestamp");
  v40 = -[CRLFreehandDrawingToolInputPoint initWithUnscaledPoint:time:inputType:isPredicted:activeInputProperties:altitudeAngleInRadians:azimuthAngleInRadians:rollAngleInRadians:force:estimationUpdateIndex:hasEstimatedAltitudeAndAzimuth:wasAddedByTouchesEnded:](self, "initWithUnscaledPoint:time:inputType:isPredicted:activeInputProperties:altitudeAngleInRadians:azimuthAngleInRadians:rollAngleInRadians:force:estimationUpdateIndex:hasEstimatedAltitudeAndAzimuth:wasAddedByTouchesEnded:", sub_10033831C((_BOOL8)objc_msgSend(v13, "type")), v8, a5, v19, v16, v7, x, y, v39, v15, v20, v17, v18);

  return v40;
}

- (CRLFreehandDrawingToolInputPoint)initWithUnscaledPoint:(CGPoint)a3 touch:(id)a4 event:(id)a5 isPredicted:(BOOL)a6 wasAddedByTouchesEnded:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  double y;
  double x;
  id v13;
  CRLFreehandDrawingToolInputPoint *v14;

  v7 = a7;
  v8 = a6;
  y = a3.y;
  x = a3.x;
  v13 = a4;
  v14 = -[CRLFreehandDrawingToolInputPoint initWithUnscaledPoint:touch:activeInputProperties:isPredicted:wasAddedByTouchesEnded:](self, "initWithUnscaledPoint:touch:activeInputProperties:isPredicted:wasAddedByTouchesEnded:", v13, +[PKDrawingGestureRecognizer activeInputPropertiesForTouch:event:](PKDrawingGestureRecognizer, "activeInputPropertiesForTouch:event:", v13, a5), v8, v7, x, y);

  return v14;
}

- (CRLFreehandDrawingToolInputPoint)initWithUnscaledPoint:(CGPoint)a3 time:(double)a4 inputType:(int64_t)a5 isPredicted:(BOOL)a6 wasAddedByTouchesEnded:(BOOL)a7
{
  return -[CRLFreehandDrawingToolInputPoint initWithUnscaledPoint:time:inputType:isPredicted:activeInputProperties:altitudeAngleInRadians:azimuthAngleInRadians:rollAngleInRadians:force:estimationUpdateIndex:hasEstimatedAltitudeAndAzimuth:wasAddedByTouchesEnded:](self, "initWithUnscaledPoint:time:inputType:isPredicted:activeInputProperties:altitudeAngleInRadians:azimuthAngleInRadians:rollAngleInRadians:force:estimationUpdateIndex:hasEstimatedAltitudeAndAzimuth:wasAddedByTouchesEnded:", a3.x, a3.y, a4, 0.785398163, 0.0, 0.0, 0.0);
}

- (int64_t)PKInputType
{
  return (id)-[CRLFreehandDrawingToolInputPoint inputType](self, "inputType") == (id)2;
}

- ($654C69F1690BA7F04119B5E31B4E39CB)PKInputPoint
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  v3 = PKInputPointZero[5];
  v4 = PKInputPointZero[6];
  v5 = PKInputPointZero[3];
  *(_OWORD *)&retstr->var7 = PKInputPointZero[4];
  *(_OWORD *)&retstr->var9 = v3;
  v6 = PKInputPointZero[7];
  *(_OWORD *)&retstr->var11 = v4;
  *(_OWORD *)&retstr->var13 = v6;
  v7 = PKInputPointZero[1];
  *(_OWORD *)&retstr->var3 = PKInputPointZero[2];
  *(_OWORD *)&retstr->var5 = v5;
  retstr->var0 = *($B819F82C29202E081AA078F1B52C391D *)&self->var9;
  *(_OWORD *)&retstr->var1 = v7;
  retstr->var7 = self->var1;
  *(int8x16_t *)&retstr->var2 = vextq_s8(*(int8x16_t *)&self->var4, *(int8x16_t *)&self->var4, 8uLL);
  *(double *)&v4 = self->var7;
  retstr->var12 = self->var6;
  retstr->var8 = LOBYTE(self->var0.var1.y);
  *(_QWORD *)&retstr->var1 = v4;
  retstr->var9 = *(_QWORD *)&self->var8;
  retstr->var11 = BYTE1(self->var0.var1.y);
  return self;
}

- (CGPoint)unscaledPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_unscaledPoint.x;
  y = self->_unscaledPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (double)time
{
  return self->_time;
}

- (int64_t)inputType
{
  return self->_inputType;
}

- (BOOL)isPredicted
{
  return self->_isPredicted;
}

- (unint64_t)activeInputProperties
{
  return self->_activeInputProperties;
}

- (double)altitudeAngleInRadians
{
  return self->_altitudeAngleInRadians;
}

- (double)azimuthAngleInRadians
{
  return self->_azimuthAngleInRadians;
}

- (double)rollAngleInRadians
{
  return self->_rollAngleInRadians;
}

- (double)force
{
  return self->_force;
}

- (int64_t)estimationUpdateIndex
{
  return self->_estimationUpdateIndex;
}

- (BOOL)hasEstimatedAltitudeAndAzimuth
{
  return self->_hasEstimatedAltitudeAndAzimuth;
}

- (BOOL)wasAddedByTouchesEnded
{
  return self->_wasAddedByTouchesEnded;
}

@end
