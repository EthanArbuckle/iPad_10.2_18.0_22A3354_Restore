@implementation RCPSyntheticEventStream

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointerChildEventStream, 0);
  objc_storeStrong((id *)&self->_senderProperties, 0);
  objc_storeStrong((id *)&self->_pointerCurveFunction, 0);
  objc_storeStrong((id *)&self->_touchCurveFunction, 0);
  objc_storeStrong((id *)&self->_processingEventBuffer, 0);
}

+ (id)eventStreamWithEventActions:(id)a3
{
  void (**v3)(id, _QWORD *);
  _QWORD *v4;
  void *v5;

  v3 = (void (**)(id, _QWORD *))a3;
  v4 = (_QWORD *)objc_opt_new();
  v3[2](v3, v4);

  objc_msgSend(v4, "_finalizeProcessingEventBuffer");
  objc_msgSend(v4, "setEvents:", v4[3]);
  v5 = (void *)v4[3];
  v4[3] = 0;

  return v4;
}

- (RCPSyntheticEventStream)init
{
  RCPSyntheticEventStream *v2;
  RCPSyntheticEventStream *v3;
  uint64_t v4;
  NSMutableArray *processingEventBuffer;
  RCPPointerTrackingChildEventStream *v6;
  RCPPointerTrackingChildEventStream *v7;
  double v8;
  double v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)RCPSyntheticEventStream;
  v2 = -[RCPEventStream init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    -[RCPSyntheticEventStream _initScreenProperties](v2, "_initScreenProperties");
    v3->_activePoints = ($47924B278A36D4A2860F70134BF18786 *)malloc_type_calloc(5uLL, 0x50uLL, 0x10000404A7914ACuLL);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = objc_claimAutoreleasedReturnValue();
    processingEventBuffer = v3->_processingEventBuffer;
    v3->_processingEventBuffer = (NSMutableArray *)v4;

    v3->_transducerType = 2;
    v3->_scalePointerPhaseScrollToPixels = 0;
    -[RCPSyntheticEventStream setActivePointCount:](v3, "setActivePointCount:", 0);
    v6 = [RCPPointerTrackingChildEventStream alloc];
    v7 = -[RCPPointerTrackingChildEventStream initWithCurrentPointerLocation:](v6, "initWithCurrentPointerLocation:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
    -[RCPSyntheticEventStream setPointerChildEventStream:](v3, "setPointerChildEventStream:", v7);

    -[RCPSyntheticEventStream pointerFrequency](v3, "pointerFrequency");
    v9 = v8;
    -[RCPSyntheticEventStream pointerChildEventStream](v3, "pointerChildEventStream");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFrequency:", v9);

  }
  return v3;
}

- (void)setPointerChildEventStream:(id)a3
{
  objc_storeStrong((id *)&self->_pointerChildEventStream, a3);
}

- (double)pointerFrequency
{
  return self->_pointerFrequency;
}

- (RCPPointerTrackingChildEventStream)pointerChildEventStream
{
  return self->_pointerChildEventStream;
}

- (void)_initScreenProperties
{
  void *v3;
  void *v4;
  id v5;

  -[RCPEventStream environment](self, "environment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "screens");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[RCPSyntheticEventStream _initScreenPropertiesForScreen:](self, "_initScreenPropertiesForScreen:", v5);
}

- (void)_initScreenPropertiesForScreen:(id)a3
{
  CGSize *p_screenSize;
  id v5;
  CGFloat v6;
  CGFloat v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double width;

  p_screenSize = &self->_screenSize;
  v5 = a3;
  objc_msgSend(v5, "pointSize");
  p_screenSize->width = v6;
  p_screenSize->height = v7;
  -[RCPEventStream environment](self, "environment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  self->_touchFrequency = (int)objc_msgSend(v8, "touchScanRate");

  -[RCPEventStream environment](self, "environment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  self->_pointerFrequency = (double)(int)objc_msgSend(v9, "pointerScanRate");

  self->_gsScreenPointSize = *p_screenSize;
  objc_msgSend(v5, "scale");
  v11 = v10;

  self->_gsScreenScaleFactor = v11;
  width = self->_gsScreenPointSize.width;
  self->_gsScreenPointSize.height = v11 * self->_gsScreenPointSize.height;
  self->_gsScreenPointSize.width = self->_gsScreenScaleFactor * width;
}

- (void)_finalizeProcessingEventBuffer
{
  -[RCPSyntheticEventStream _finalizeHomeButtonEvents](self, "_finalizeHomeButtonEvents");
  -[RCPSyntheticEventStream _finalizePointerButtonMasks](self, "_finalizePointerButtonMasks");
}

- (void)_touchDownAtPoints:(CGPoint *)a3 touchCount:(unint64_t)a4 pressure:(double)a5 radius:(double)a6 edgeMaskOptions:(id *)a7
{
  unint64_t v11;
  unint64_t v13;
  double x;
  double y;
  double v16;
  double v17;
  double v18;
  double v19;
  unsigned int var0;
  uint64_t v21;
  __IOHIDEvent *v22;

  if (a4)
  {
    v11 = a4;
    do
    {
      v13 = -[RCPSyntheticEventStream activePointCount](self, "activePointCount");
      x = a3->x;
      y = a3->y;
      *(CGPoint *)(-[RCPSyntheticEventStream activePoints](self, "activePoints") + 80 * v13 + 32) = *a3;
      *(double *)(-[RCPSyntheticEventStream activePoints](self, "activePoints") + 80 * v13 + 56) = a5;
      if (a7 && !a7->var1)
      {
        var0 = a7->var0;
        *(_DWORD *)(-[RCPSyntheticEventStream activePoints](self, "activePoints") + 80 * v13 + 68) = var0;
      }
      else
      {
        -[RCPSyntheticEventStream _normalizePoint:](self, "_normalizePoint:", x, y);
        v17 = v16;
        v19 = v18;
        *(_DWORD *)(-[RCPSyntheticEventStream activePoints](self, "activePoints") + 80 * v13 + 68) = 0;
        -[RCPSyntheticEventStream _isEdgePoint:getMask:](self, "_isEdgePoint:getMask:", -[RCPSyntheticEventStream activePoints](self, "activePoints") + 80 * v13 + 68, v17, v19);
      }
      v21 = 5 * v13;
      *(_BYTE *)(-[RCPSyntheticEventStream activePoints](self, "activePoints") + 16 * v21 + 72) = 0;
      *(double *)(-[RCPSyntheticEventStream activePoints](self, "activePoints") + 16 * v21 + 48) = a6;
      -[RCPSyntheticEventStream setActivePointCount:](self, "setActivePointCount:", -[RCPSyntheticEventStream activePointCount](self, "activePointCount") + 1);
      ++a3;
      --v11;
    }
    while (v11);
  }
  v22 = -[RCPSyntheticEventStream _createIOHIDWithEventType:](self, "_createIOHIDWithEventType:", 1, a5, a6);
  -[RCPSyntheticEventStream _addIOHIDEventToProcessingBuffer:](self, "_addIOHIDEventToProcessingBuffer:", v22);
  CFRelease(v22);
}

- (__IOHIDEvent)_createIOHIDWithEventType:(int64_t)a3
{
  $47924B278A36D4A2860F70134BF18786 *v5;
  double x;
  double y;
  int v8;
  unint64_t v9;
  uint64_t v10;
  __IOHIDEvent *DigitizerEvent;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  $47924B278A36D4A2860F70134BF18786 *v21;
  $47924B278A36D4A2860F70134BF18786 *v22;
  $47924B278A36D4A2860F70134BF18786 *v23;
  double v24;
  double v25;
  $47924B278A36D4A2860F70134BF18786 *v26;
  const void *DigitizerFingerEvent;
  $47924B278A36D4A2860F70134BF18786 *v28;
  uint64_t v30;
  __IOHIDEvent *v31;

  v5 = -[RCPSyntheticEventStream activePoints](self, "activePoints");
  x = v5->var4.x;
  y = v5->var4.y;
  -[RCPSyntheticEventStream activePoints](self, "activePoints");
  -[RCPSyntheticEventStream _normalizePoint:](self, "_normalizePoint:", x, y);
  -[RCPSyntheticEventStream activePoints](self, "activePoints");
  -[RCPSyntheticEventStream activePoints](self, "activePoints");
  -[RCPSyntheticEventStream activePoints](self, "activePoints");
  if ((unint64_t)(a3 - 1) > 0xB)
    v8 = 0;
  else
    v8 = dword_1A5EA8D14[a3 - 1];
  if (-[RCPSyntheticEventStream activePointCount](self, "activePointCount"))
  {
    v9 = 0;
    v10 = 68;
    do
    {
      v8 |= -[RCPSyntheticEventStream activePoints](self, "activePoints")[v10];
      ++v9;
      v10 += 80;
    }
    while (v9 < -[RCPSyntheticEventStream activePointCount](self, "activePointCount"));
  }
  -[RCPSyntheticEventStream _currentMachTime](self, "_currentMachTime");
  DigitizerEvent = (__IOHIDEvent *)IOHIDEventCreateDigitizerEvent();
  -[RCPSyntheticEventStream senderProperties](self, "senderProperties", ((unint64_t)a3 < 0xD) & (0x1026u >> a3) | 0x4000000000);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = DigitizerEvent;
  if (v12)
  {
    -[RCPSyntheticEventStream senderProperties](self, "senderProperties");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "properties");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("DisplayIntegrated"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "BOOLValue");

    IOHIDEventSetIntegerValue();
    -[RCPSyntheticEventStream senderProperties](self, "senderProperties");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "properties");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("Built-In"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "BOOLValue");

    DigitizerEvent = v31;
  }
  else
  {
    IOHIDEventSetIntegerValue();
  }
  IOHIDEventSetIntegerValue();
  if (-[RCPSyntheticEventStream activePointCount](self, "activePointCount"))
  {
    v19 = 0;
    v20 = 0;
    do
    {
      v21 = -[RCPSyntheticEventStream activePoints](self, "activePoints", v30);
      v22 = v21;
      if (a3 == 1)
      {
        v23 = &v21[v19];
        if (v21[v19].var5 == 0.0)
        {
          -[RCPSyntheticEventStream defaultRadius](self, "defaultRadius");
          v23->var5 = v24;
        }
        if (v23->var6 == 0.0)
        {
          -[RCPSyntheticEventStream defaultPressure](self, "defaultPressure");
          v23->var6 = v25;
        }
        if (!v22[v19].var7)
          v22[v19].var7 = 3;
      }
      else
      {
        v26 = &v21[v19];
        if (!v21[v19].var9)
        {
          v26->var5 = 0.0;
          v26->var6 = 0.0;
          v26->var7 = 0;
        }
      }
      -[RCPSyntheticEventStream _normalizePoint:](self, "_normalizePoint:", v22[v19].var4.x, v22[v19].var4.y);
      if (self->_transducerType)
      {
        DigitizerFingerEvent = (const void *)IOHIDEventCreateDigitizerFingerEvent();
      }
      else
      {
        LODWORD(v30) = 64;
        DigitizerFingerEvent = (const void *)IOHIDEventCreateDigitizerStylusEventWithPolarOrientation();
        IOHIDEventSetFloatValue();
        IOHIDEventSetFloatValue();
        IOHIDEventSetFloatValue();
        DigitizerEvent = v31;
        IOHIDEventSetIntegerValue();
        ++self->_generationCount;
        IOHIDEventSetIntegerValue();
        IOHIDEventSetFloatValue();
        IOHIDEventSetFloatValue();
        IOHIDEventSetIntegerValue();
        IOHIDEventSetIntegerValue();
      }
      v28 = &v22[v19];
      IOHIDEventSetFloatValue();
      IOHIDEventAppendEvent();
      if (a3 == 1 && !v28->var9)
        v28->var9 = 1;
      CFRelease(DigitizerFingerEvent);
      ++v20;
      ++v19;
    }
    while (v20 < -[RCPSyntheticEventStream activePointCount](self, "activePointCount"));
  }
  return DigitizerEvent;
}

- ($47924B278A36D4A2860F70134BF18786)activePoints
{
  return self->_activePoints;
}

- (unint64_t)activePointCount
{
  return self->_activePointCount;
}

- (CGPoint)_normalizePoint:(CGPoint)a3
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
  double v14;
  double v15;
  double v16;
  void *v17;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[RCPSyntheticEventStream gsScreenPointSize](self, "gsScreenPointSize");
  -[RCPSyntheticEventStream gsScreenPointSize](self, "gsScreenPointSize");
  -[RCPSyntheticEventStream gsScreenPointSize](self, "gsScreenPointSize");
  if (v6 == 0.0 || (-[RCPSyntheticEventStream gsScreenPointSize](self, "gsScreenPointSize"), v7 == 0.0))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Normalization failed due to the screen width and height was unexpectedly 0 or NaN."));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[RCPSyntheticEventStream _normalizePoint:].cold.1((uint64_t)v17);
    objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
  else
  {
    -[RCPSyntheticEventStream gsScreenPointSize](self, "gsScreenPointSize");
    v9 = x / v8;
    -[RCPSyntheticEventStream gsScreenPointSize](self, "gsScreenPointSize");
    v11 = y / v10;
    -[RCPSyntheticEventStream gsScreenScaleFactor](self, "gsScreenScaleFactor");
    v13 = v9 * v12;
    -[RCPSyntheticEventStream gsScreenScaleFactor](self, "gsScreenScaleFactor");
    v15 = v11 * v14;
    v16 = v13;
  }
  result.y = v15;
  result.x = v16;
  return result;
}

- (CGSize)gsScreenPointSize
{
  double width;
  double height;
  CGSize result;

  width = self->_gsScreenPointSize.width;
  height = self->_gsScreenPointSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)gsScreenScaleFactor
{
  return self->_gsScreenScaleFactor;
}

- (RCPEventSenderProperties)senderProperties
{
  return self->_senderProperties;
}

- (void)_addIOHIDEventToProcessingBuffer:(__IOHIDEvent *)a3
{
  id v4;

  +[RCPEvent eventWithHIDEvent:deliveryTimeStamp:senderProperties:preActions:](RCPEvent, "eventWithHIDEvent:deliveryTimeStamp:senderProperties:preActions:", a3, -[RCPSyntheticEventStream _currentMachTime](self, "_currentMachTime"), self->_senderProperties, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](self->_processingEventBuffer, "addObject:", v4);

}

- (void)liftUp:(CGPoint)a3 touchCount:(unint64_t)a4
{
  unint64_t v4;
  char *v5;
  unint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (a4 >= 5)
    v4 = 5;
  else
    v4 = a4;
  if (v4)
  {
    v5 = (char *)&v7[1] - (16 * v4);
    v6 = v4;
    do
    {
      *(CGPoint *)(v5 - 8) = a3;
      v5 += 16;
      --v6;
    }
    while (v6);
  }
  -[RCPSyntheticEventStream liftUpAtPoints:touchCount:](self, "liftUpAtPoints:touchCount:", a3.x, a3.y);
}

- (void)setActivePointCount:(unint64_t)a3
{
  self->_activePointCount = a3;
}

- (void)liftUpAtPoints:(CGPoint *)a3 touchCount:(unint64_t)a4
{
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  $47924B278A36D4A2860F70134BF18786 *v10;
  CGPoint v11;
  __IOHIDEvent *v12;

  v7 = -[RCPSyntheticEventStream activePointCount](self, "activePointCount");
  v8 = v7 - a4;
  if (a4)
  {
    v9 = 80 * v7 - 80 * a4;
    do
    {
      v10 = -[RCPSyntheticEventStream activePoints](self, "activePoints");
      v11 = *a3++;
      *(CGPoint *)((char *)&v10->var4 + v9) = v11;
      *(_BYTE *)(-[RCPSyntheticEventStream activePoints](self, "activePoints") + v9 + 72) = 0;
      v9 += 80;
      --a4;
    }
    while (a4);
  }
  v12 = -[RCPSyntheticEventStream _createIOHIDWithEventType:](self, "_createIOHIDWithEventType:", 6);
  -[RCPSyntheticEventStream _addIOHIDEventToProcessingBuffer:](self, "_addIOHIDEventToProcessingBuffer:", v12);
  CFRelease(v12);
  -[RCPSyntheticEventStream setActivePointCount:](self, "setActivePointCount:", v8);
}

- (BOOL)_isEdgePoint:(CGPoint)a3 getMask:(unsigned int *)a4
{
  int v5;
  int v6;
  void *v7;
  uint64_t v8;
  unsigned int v9;

  if (self->_transducerType != 2)
    goto LABEL_14;
  if (a3.y >= 0.01)
    v5 = (a3.x < 0.01) << 27;
  else
    v5 = ((a3.x < 0.01) << 27) | 0x2000000;
  if (a3.x > 0.99)
    v5 |= 0x4000000u;
  v6 = a3.y <= 0.99 ? v5 : v5 | 0x1000000;
  if (v6)
  {
    -[RCPEventStream environment](self, "environment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "homeButtonHardware");

    v9 = v6 | 0x40000;
    if (v8 == 2)
      v9 = 2048;
  }
  else
  {
LABEL_14:
    v9 = 0;
  }
  *a4 = v9;
  return v9 != 0;
}

- (void)_finalizeHomeButtonEvents
{
  RCPSyntheticEventStream *v2;
  uint64_t v3;
  uint64_t (**v4)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v5;
  void *v6;
  unint64_t v7;
  int v8;
  unint64_t v9;
  unint64_t v10;
  char v11;
  void *v12;
  unint64_t TimeStamp;
  unint64_t v14;
  unint64_t v15;
  BOOL v16;
  int v17;
  uint64_t v18;
  RCPSyntheticEventStream *v19;
  uint64_t v20;
  uint64_t (**v21)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  char v22;
  int v23;
  _QWORD v24[5];
  _QWORD v25[6];

  v2 = self;
  v3 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __52__RCPSyntheticEventStream__finalizeHomeButtonEvents__block_invoke_2;
  v25[3] = &unk_1E4FC2630;
  v25[4] = self;
  v4 = (uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1A85B7660](v25, a2);
  -[RCPEventStream environment](v2, "environment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v5, "machAbsoluteTimeForTimeInterval:", 0.25);

  -[RCPEventStream environment](v2, "environment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v6, "machAbsoluteTimeForTimeInterval:", 0.38);

  v24[0] = v3;
  v24[1] = 3221225472;
  v24[2] = __52__RCPSyntheticEventStream__finalizeHomeButtonEvents__block_invoke_3;
  v24[3] = &unk_1E4FC2630;
  v24[4] = v2;
  v21 = (uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1A85B7660](v24);
  if (!-[NSMutableArray count](v2->_processingEventBuffer, "count"))
    goto LABEL_39;
  v7 = 0;
  v23 = 0;
  v8 = 0;
  v9 = 0;
  v10 = 0;
  v11 = 1;
  v22 = 0;
  v19 = v2;
  do
  {
    -[NSMutableArray objectAtIndexedSubscript:](v2->_processingEventBuffer, "objectAtIndexedSubscript:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "hidEvent");
    TimeStamp = IOHIDEventGetTimeStamp();
    v14 = TimeStamp;
    if (v7)
    {
      if ((v11 & (v10 == 0)) != 0)
        goto LABEL_18;
      if (TimeStamp > v7)
        goto LABEL_10;
    }
    else if (!v10)
    {
      goto LABEL_18;
    }
    if (v10 && TimeStamp > v10)
    {
LABEL_10:
      if ((v11 & 1) == 0)
      {
        if (v7 >= v10)
          v15 = v10;
        else
          v15 = v7;
        v9 = ((uint64_t (**)(_QWORD, NSMutableArray *, unint64_t, unint64_t, _QWORD, _QWORD))v4)[2](v4, v2->_processingEventBuffer, v9, v15, v23, v22 & 1);
        v23 = 0;
        v7 = 0;
      }
      v11 = 1;
      if (v10 && v14 > v10)
      {
        v9 = ((uint64_t (**)(_QWORD, NSMutableArray *, unint64_t, unint64_t, _QWORD, uint64_t))v21)[2](v21, v2->_processingEventBuffer, v9, v10, v8, 1);
        v10 = 0;
      }
      goto LABEL_34;
    }
LABEL_18:
    if (!__52__RCPSyntheticEventStream__finalizeHomeButtonEvents__block_invoke())
      goto LABEL_33;
    if (!IOHIDEventGetIntegerValue())
    {
      IOHIDEventSetIntegerValue();
      v10 = 0;
      v22 = 0;
      v16 = v23 <= 2;
      if (v23 <= 2)
        v17 = v23;
      else
        v17 = 0;
      v23 = v17;
      if (v16)
        v7 = v14 + v18;
      goto LABEL_33;
    }
    if (!v23)
    {
      IOHIDEventSetPhase();
      v11 = 0;
    }
    v10 = v14 + v20;
    v8 = v23 + 1;
    IOHIDEventSetIntegerValue();
    if (v23 < 2)
    {
      v22 = 1;
      goto LABEL_32;
    }
    if ((v11 & 1) != 0)
    {
      v22 = 1;
      v11 = 1;
LABEL_32:
      ++v23;
      v2 = v19;
LABEL_33:
      ++v9;
      goto LABEL_34;
    }
    v2 = v19;
    v22 = 1;
    v9 = ((uint64_t (**)(_QWORD, NSMutableArray *, unint64_t, unint64_t, _QWORD, uint64_t))v4)[2](v4, v19->_processingEventBuffer, v9 + 1, v14, v8, 1);
    v7 = 0;
    v11 = 1;
    ++v23;
LABEL_34:

  }
  while (v9 < -[NSMutableArray count](v2->_processingEventBuffer, "count"));
  if (!((v7 == 0) | v11 & 1))
    ((uint64_t (**)(_QWORD, NSMutableArray *, unint64_t, unint64_t, _QWORD, _QWORD))v4)[2](v4, v2->_processingEventBuffer, v9, v7, v23, 0);
LABEL_39:

}

- (unint64_t)_currentMachTime
{
  void *v3;
  unint64_t v4;

  -[RCPEventStream environment](self, "environment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "machAbsoluteTimeForTimeInterval:", self->_currentTimeOffset);

  return v4;
}

BOOL __52__RCPSyntheticEventStream__finalizeHomeButtonEvents__block_invoke()
{
  uint64_t IntegerValue;
  uint64_t v1;
  _BOOL8 result;

  result = 0;
  if (IOHIDEventGetType() == 3)
  {
    IntegerValue = IOHIDEventGetIntegerValue();
    v1 = IOHIDEventGetIntegerValue();
    if (IntegerValue == 12 && v1 == 64)
      return 1;
  }
  return result;
}

- (void)_finalizePointerButtonMasks
{
  RCPSyntheticEventStream *v2;
  uint64_t v3;
  unint64_t v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char IntegerValue;
  uint64_t v13;
  int v14;
  int v15;
  int v16;
  uint64_t v17;
  RCPSyntheticEventStream *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v2 = self;
  v25 = *MEMORY[0x1E0C80C00];
  v3 = 24;
  if (-[NSMutableArray count](self->_processingEventBuffer, "count"))
  {
    v4 = 0;
    v5 = 0;
    v17 = 24;
    v18 = v2;
    do
    {
      objc_msgSend(*(id *)((char *)&v2->super.super.isa + v3), "objectAtIndexedSubscript:", v4, v17, v18);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "hidEvent");
      if (IOHIDEventGetType() == 17)
      {
        v19 = v6;
        IOHIDEventGetChildren();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v21;
          do
          {
            v11 = 0;
            do
            {
              if (*(_QWORD *)v21 != v10)
                objc_enumerationMutation(v7);
              if (IOHIDEventGetType() == 2)
              {
                IntegerValue = IOHIDEventGetIntegerValue();
                v13 = IOHIDEventGetIntegerValue();
                v14 = 1 << (IntegerValue - 1);
                v15 = v14 | v5;
                v16 = v5 & ~v14;
                if (v13 <= 0)
                  v5 = v16;
                else
                  v5 = v15;
                IOHIDEventSetIntegerValue();
              }
              ++v11;
            }
            while (v9 != v11);
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
          }
          while (v9);
        }
        IOHIDEventSetIntegerValue();

        v3 = v17;
        v2 = v18;
        v6 = v19;
      }
      ++v4;

    }
    while (v4 < objc_msgSend(*(id *)((char *)&v2->super.super.isa + v3), "count"));
  }
}

- (void)tap:(CGPoint)a3
{
  -[RCPSyntheticEventStream taps:location:withNumberOfTouches:](self, "taps:location:withNumberOfTouches:", 1, 1, a3.x, a3.y);
}

- (void)taps:(unint64_t)a3 location:(CGPoint)a4 withNumberOfTouches:(unint64_t)a5
{
  double y;
  double x;
  double v10;
  double v11;
  double v12;

  y = a4.y;
  x = a4.x;
  -[RCPSyntheticEventStream defaultPressure](self, "defaultPressure");
  v11 = v10;
  -[RCPSyntheticEventStream defaultRadius](self, "defaultRadius");
  -[RCPSyntheticEventStream taps:location:withNumberOfTouches:pressure:radius:](self, "taps:location:withNumberOfTouches:pressure:radius:", a3, a5, x, y, v11, v12);
}

- (double)defaultRadius
{
  double result;

  result = 0.027;
  if (!self->_transducerType)
    return 0.0;
  return result;
}

- (double)defaultPressure
{
  if (self->_transducerType)
    return (double)60;
  else
    return (double)120;
}

- (void)taps:(unint64_t)a3 location:(CGPoint)a4 withNumberOfTouches:(unint64_t)a5 pressure:(double)a6 radius:(double)a7
{
  double y;
  double x;
  unint64_t i;

  if (a3)
  {
    y = a4.y;
    x = a4.x;
    for (i = a3 - 1; ; --i)
    {
      -[RCPSyntheticEventStream touchDown:touchCount:pressure:radius:](self, "touchDown:touchCount:pressure:radius:", a5, x, y, a6, a7);
      -[RCPSyntheticEventStream advanceTime:](self, "advanceTime:", 0.05);
      -[RCPSyntheticEventStream liftUp:touchCount:](self, "liftUp:touchCount:", a5, x, y);
      if (!i)
        break;
      -[RCPSyntheticEventStream advanceTime:](self, "advanceTime:", 0.15);
    }
  }
}

- (void)touchDown:(CGPoint)a3 touchCount:(unint64_t)a4 pressure:(double)a5 radius:(double)a6
{
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  unint64_t v12;
  double *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0C80A78](self, a2, (__n128)a3, *(__n128 *)&a3.y, *(__n128 *)&a5, *(__n128 *)&a6);
  if (v7)
  {
    v12 = 0;
    v13 = (double *)&v14[-2 * v7 + 1];
    do
    {
      *(v13 - 1) = v8 + (double)v12;
      *v13 = v9 + (double)v12;
      v12 += 50;
      v13 += 2;
    }
    while (50 * v7 != v12);
  }
  objc_msgSend(v6, "_touchDownAtPoints:touchCount:pressure:radius:edgeMaskOptions:", v10, v11);
}

- (void)advanceTime:(double)a3
{
  self->_currentTimeOffset = self->_currentTimeOffset + a3;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_activePoints);
  v3.receiver = self;
  v3.super_class = (Class)RCPSyntheticEventStream;
  -[RCPSyntheticEventStream dealloc](&v3, sel_dealloc);
}

- (CAMediaTimingFunction)touchCurveFunction
{
  double v2;
  double v3;
  double v4;
  double v5;
  CAMediaTimingFunction *touchCurveFunction;
  CAMediaTimingFunction *v8;
  CAMediaTimingFunction *v9;

  touchCurveFunction = self->_touchCurveFunction;
  if (!touchCurveFunction)
  {
    RCPMediaTimingFunctionForInputType(0, 0, v2, v3, v4, v5);
    v8 = (CAMediaTimingFunction *)objc_claimAutoreleasedReturnValue();
    v9 = self->_touchCurveFunction;
    self->_touchCurveFunction = v8;

    touchCurveFunction = self->_touchCurveFunction;
  }
  return touchCurveFunction;
}

- (CAMediaTimingFunction)pointerCurveFunction
{
  double v2;
  double v3;
  double v4;
  double v5;
  CAMediaTimingFunction *pointerCurveFunction;
  void *v8;

  pointerCurveFunction = self->_pointerCurveFunction;
  if (!pointerCurveFunction)
  {
    RCPMediaTimingFunctionForInputType(0, 1, v2, v3, v4, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[RCPSyntheticEventStream setPointerCurveFunction:](self, "setPointerCurveFunction:", v8);

    pointerCurveFunction = self->_pointerCurveFunction;
  }
  return pointerCurveFunction;
}

- (void)setPointerCurveFunction:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_pointerCurveFunction, a3);
  v5 = a3;
  -[RCPSyntheticEventStream pointerChildEventStream](self, "pointerChildEventStream");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPointerCurveFunction:", v5);

}

- (void)composeDockGestureInMotion:(unsigned __int16)a3 frequency:(unint64_t)a4 actionBlock:(id)a5
{
  -[RCPSyntheticEventStream composeDockGestureOfFlavor:motion:frequency:actionBlock:](self, "composeDockGestureOfFlavor:motion:frequency:actionBlock:", 3, a3, a4, a5);
}

- (void)composeDockGestureOfFlavor:(unsigned __int16)a3 motion:(unsigned __int16)a4 frequency:(unint64_t)a5 actionBlock:(id)a6
{
  uint64_t v7;
  uint64_t v8;
  void (**v10)(id, RCPSyntheticFluidSwipeEventStream *);
  void *v11;
  void *v12;
  NSMutableArray *processingEventBuffer;
  void *v14;
  double v15;
  RCPSyntheticFluidSwipeEventStream *v16;

  v7 = a4;
  v8 = a3;
  v10 = (void (**)(id, RCPSyntheticFluidSwipeEventStream *))a6;
  v16 = -[RCPSyntheticFluidSwipeEventStream initWithEventType:flavor:motion:]([RCPSyntheticFluidSwipeEventStream alloc], "initWithEventType:flavor:motion:", 23, v8, v7);
  -[RCPEventStream environment](self, "environment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCPSyntheticFluidSwipeEventStream setEnvironment:](v16, "setEnvironment:", v11);

  -[RCPSyntheticEventStream senderProperties](self, "senderProperties");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCPSyntheticFluidSwipeEventStream setSenderProperties:](v16, "setSenderProperties:", v12);

  -[RCPSyntheticFluidSwipeEventStream setCurrentTimeOffset:](v16, "setCurrentTimeOffset:", self->_currentTimeOffset);
  -[RCPSyntheticFluidSwipeEventStream setFrequency:](v16, "setFrequency:", (double)a5);
  v10[2](v10, v16);

  processingEventBuffer = self->_processingEventBuffer;
  -[RCPSyntheticFluidSwipeEventStream finalizeEventStream](v16, "finalizeEventStream");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObjectsFromArray:](processingEventBuffer, "addObjectsFromArray:", v14);

  -[RCPSyntheticFluidSwipeEventStream currentTimeOffset](v16, "currentTimeOffset");
  self->_currentTimeOffset = v15;

}

- (void)composeNavigationGestureInMotion:(unsigned __int16)a3 frequency:(unint64_t)a4 actionBlock:(id)a5
{
  uint64_t v6;
  id v8;
  RCPSyntheticFluidSwipeEventStream *v9;
  id v10;
  RCPSyntheticFluidSwipeEventStream *v11;
  _QWORD v12[4];
  RCPSyntheticFluidSwipeEventStream *v13;
  id v14;
  unint64_t v15;

  v6 = a3;
  v8 = a5;
  v9 = -[RCPSyntheticFluidSwipeEventStream initWithEventType:flavor:motion:]([RCPSyntheticFluidSwipeEventStream alloc], "initWithEventType:flavor:motion:", 16, 5, v6);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __82__RCPSyntheticEventStream_composeNavigationGestureInMotion_frequency_actionBlock___block_invoke;
  v12[3] = &unk_1E4FC25E0;
  v14 = v8;
  v15 = a4;
  v13 = v9;
  v10 = v8;
  v11 = v9;
  -[RCPSyntheticEventStream withExclusiveChildStream:perform:](self, "withExclusiveChildStream:perform:", v11, v12);

}

uint64_t __82__RCPSyntheticEventStream_composeNavigationGestureInMotion_frequency_actionBlock___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrequency:", (double)*(unint64_t *)(a1 + 48));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)withExclusiveChildStream:(id)a3 perform:(id)a4
{
  void (**v6)(_QWORD);
  id v7;
  void *v8;
  void *v9;
  NSMutableArray *processingEventBuffer;
  void *v11;
  double v12;
  double v13;

  v6 = (void (**)(_QWORD))a4;
  v7 = a3;
  -[RCPEventStream environment](self, "environment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEnvironment:", v8);

  -[RCPSyntheticEventStream senderProperties](self, "senderProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSenderProperties:", v9);

  objc_msgSend(v7, "setCurrentTimeOffset:", self->_currentTimeOffset);
  v6[2](v6);

  processingEventBuffer = self->_processingEventBuffer;
  objc_msgSend(v7, "finalizeEventStream");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObjectsFromArray:](processingEventBuffer, "addObjectsFromArray:", v11);

  objc_msgSend(v7, "currentTimeOffset");
  v13 = v12;

  self->_currentTimeOffset = v13;
}

+ (id)eventStreamWithCLIArguments:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __55__RCPSyntheticEventStream_eventStreamWithCLIArguments___block_invoke;
  v11[3] = &unk_1E4FC2608;
  v5 = v4;
  v12 = v5;
  v13 = &v14;
  objc_msgSend(a1, "eventStreamWithEventActions:", v11);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (*((_BYTE *)v15 + 24))
    v8 = 0;
  else
    v8 = (void *)v6;
  v9 = v8;

  _Block_object_dispose(&v14, 8);
  return v9;
}

void __55__RCPSyntheticEventStream_eventStreamWithCLIArguments___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  v3 = *(id *)(a1 + 32);
  while (objc_msgSend(v3, "count"))
  {
    parseCommandFromCLIArguments(v3, v5);
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v4;
    if (!v4)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      goto LABEL_6;
    }
  }

LABEL_6:
}

- (__IOHIDEvent)_createIOSButtonHIDEventWithPage:(unsigned int)a3 usage:(unsigned int)a4 down:(BOOL)a5
{
  __IOHIDEvent *KeyboardEvent;

  -[RCPSyntheticEventStream _currentMachTime](self, "_currentMachTime");
  KeyboardEvent = (__IOHIDEvent *)IOHIDEventCreateKeyboardEvent();
  IOHIDEventSetIntegerValue();
  return KeyboardEvent;
}

- (__IOHIDEvent)_createIOSButtonHIDEventWithButtonType:(int64_t)a3 down:(BOOL)a4
{
  _BOOL8 v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a4;
  v5 = a3 - 1;
  if ((unint64_t)(a3 - 1) > 7)
  {
    v7 = 64;
    v6 = 12;
  }
  else
  {
    v6 = dword_1A5EA8CD4[v5];
    v7 = dword_1A5EA8CF4[v5];
  }
  return -[RCPSyntheticEventStream _createIOSButtonHIDEventWithPage:usage:down:](self, "_createIOSButtonHIDEventWithPage:usage:down:", v6, v7, v4);
}

- (__IOHIDEvent)_createIOHIDGameControllerEventForDpadButton:(int64_t)a3
{
  -[RCPSyntheticEventStream _currentMachTime](self, "_currentMachTime");
  return (__IOHIDEvent *)IOHIDEventCreateGameControllerEvent();
}

uint64_t __52__RCPSyntheticEventStream__finalizeHomeButtonEvents__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void *v9;
  id v10;
  const void *v11;
  void *v12;

  v9 = *(void **)(a1 + 32);
  v10 = a2;
  v11 = (const void *)objc_msgSend(v9, "_createIOSButtonHIDEventWithButtonType:down:", 0, a6);
  IOHIDEventSetPhase();
  IOHIDEventSetIntegerValue();
  IOHIDEventSetTimeStamp();
  +[RCPEvent eventWithHIDEvent:deliveryTimeStamp:](RCPEvent, "eventWithHIDEvent:deliveryTimeStamp:", v11, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  CFRelease(v11);
  objc_msgSend(v10, "insertObject:atIndex:", v12, a3);

  return a3 + 1;
}

uint64_t __52__RCPSyntheticEventStream__finalizeHomeButtonEvents__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void *v9;
  id v10;
  const void *v11;
  void *v12;

  v9 = *(void **)(a1 + 32);
  v10 = a2;
  v11 = (const void *)objc_msgSend(v9, "_createIOSButtonHIDEventWithButtonType:down:", 0, a6);
  IOHIDEventSetIntegerValue();
  IOHIDEventSetIntegerValue();
  IOHIDEventSetTimeStamp();
  +[RCPEvent eventWithHIDEvent:deliveryTimeStamp:](RCPEvent, "eventWithHIDEvent:deliveryTimeStamp:", v11, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  CFRelease(v11);
  objc_msgSend(v10, "insertObject:atIndex:", v12, a3);

  return a3 + 1;
}

- (void)_updateTouchPoints:(CGPoint *)a3 count:(unint64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  $47924B278A36D4A2860F70134BF18786 *v9;
  __int128 v10;
  __IOHIDEvent *v11;

  if (-[RCPSyntheticEventStream activePointCount](self, "activePointCount"))
  {
    if (!a4)
    {
      -[RCPSyntheticEventStream setActivePointCount:](self, "setActivePointCount:", 0);
      v7 = 6;
      goto LABEL_12;
    }
    if (-[RCPSyntheticEventStream activePointCount](self, "activePointCount") == a4)
      v7 = 2;
    else
      v7 = 5;
    -[RCPSyntheticEventStream setActivePointCount:](self, "setActivePointCount:", a4);
  }
  else
  {
    -[RCPSyntheticEventStream setActivePointCount:](self, "setActivePointCount:", a4);
    v7 = 1;
    if (!a4)
      goto LABEL_12;
  }
  v8 = 32;
  do
  {
    v9 = -[RCPSyntheticEventStream activePoints](self, "activePoints");
    v10 = (__int128)*a3++;
    *(_OWORD *)((char *)&v9->var0 + v8) = v10;
    v8 += 80;
    --a4;
  }
  while (a4);
LABEL_12:
  v11 = -[RCPSyntheticEventStream _createIOHIDWithEventType:](self, "_createIOHIDWithEventType:", v7);
  -[RCPSyntheticEventStream _addIOHIDEventToProcessingBuffer:](self, "_addIOHIDEventToProcessingBuffer:", v11);
  CFRelease(v11);
}

- (void)_delayBetweenMove:(int)a3 elapsedTime:(double)a4
{
  double v6;
  double v7;

  v6 = (double)a3;
  -[RCPSyntheticEventStream touchMoveInterval](self, "touchMoveInterval");
  -[RCPSyntheticEventStream advanceTime:](self, "advanceTime:", -(a4 - v6 * v7));
}

- (double)_nextTouchLocationFrom:(double)a3 to:(double)a4 at:(double)a5
{
  void *v11;
  double v12;
  double v13;
  double v14;

  if (!a1)
    return 0.0;
  objc_msgSend(a1, "touchCurveFunction");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v12 = a6;
  objc_msgSend(v11, "rcp_solveForStart:end:at:", a2, a3, a4, a5, v12);
  v14 = v13;

  return v14;
}

- (void)composeWithSender:(id)a3 actionBlock:(id)a4
{
  void (**v6)(id, RCPSyntheticEventStream *);
  id v7;
  id v8;

  v6 = (void (**)(id, RCPSyntheticEventStream *))a4;
  v7 = a3;
  -[RCPSyntheticEventStream senderProperties](self, "senderProperties");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[RCPSyntheticEventStream setSenderProperties:](self, "setSenderProperties:", v7);

  v6[2](v6, self);
  -[RCPSyntheticEventStream setSenderProperties:](self, "setSenderProperties:", v8);

}

- (double)touchMoveInterval
{
  return 1.0 / (double)self->_touchFrequency;
}

- (void)setSenderProperties:(id)a3
{
  RCPEventSenderProperties *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  unsigned int v13;
  RCPEventSenderProperties *v14;
  _QWORD v15[4];
  id v16;
  RCPSyntheticEventStream *v17;

  v5 = (RCPEventSenderProperties *)a3;
  if (self->_senderProperties != v5)
  {
    v14 = v5;
    objc_storeStrong((id *)&self->_senderProperties, a3);
    -[RCPEventSenderProperties properties](self->_senderProperties, "properties");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("displayUUID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[RCPEventStream environment](self, "environment");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "screens");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __47__RCPSyntheticEventStream_setSenderProperties___block_invoke;
      v15[3] = &unk_1E4FC2658;
      v16 = v7;
      v17 = self;
      objc_msgSend(v9, "enumerateObjectsUsingBlock:", v15);

    }
    else
    {
      -[RCPSyntheticEventStream _initScreenProperties](self, "_initScreenProperties");
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PrimaryUsagePage"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "intValue") == 13)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PrimaryUsage"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "intValue");

      if (v12 == 32)
      {
        v13 = 0;
LABEL_10:
        self->_transducerType = v13;

        v5 = v14;
        goto LABEL_11;
      }
    }
    else
    {

    }
    v13 = 2;
    goto LABEL_10;
  }
LABEL_11:

}

void __47__RCPSyntheticEventStream_setSenderProperties___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  int v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "displayUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 40), "_initScreenPropertiesForScreen:", v8);
    *a4 = 1;
  }

}

- (void)touchDownAtPoints:(CGPoint *)a3 touchCount:(unint64_t)a4 pressure:(double)a5 radius:(double)a6
{
  -[RCPSyntheticEventStream _touchDownAtPoints:touchCount:pressure:radius:edgeMaskOptions:](self, "_touchDownAtPoints:touchCount:pressure:radius:edgeMaskOptions:", a3, a4, 0, a5, a6);
}

- (void)touchDownAtPoints:(CGPoint *)a3 touchCount:(unint64_t)a4 radius:(double)a5
{
  -[RCPSyntheticEventStream defaultPressure](self, "defaultPressure");
  -[RCPSyntheticEventStream _touchDownAtPoints:touchCount:pressure:radius:edgeMaskOptions:](self, "_touchDownAtPoints:touchCount:pressure:radius:edgeMaskOptions:", a3, a4, 0);
}

- (void)touchDownAtPoints:(CGPoint *)a3 touchCount:(unint64_t)a4 pressure:(double)a5
{
  double v9;

  -[RCPSyntheticEventStream defaultRadius](self, "defaultRadius");
  -[RCPSyntheticEventStream _touchDownAtPoints:touchCount:pressure:radius:edgeMaskOptions:](self, "_touchDownAtPoints:touchCount:pressure:radius:edgeMaskOptions:", a3, a4, 0, a5, v9);
}

- (void)touchDownAtPoints:(CGPoint *)a3 touchCount:(unint64_t)a4
{
  double v7;
  double v8;
  double v9;

  -[RCPSyntheticEventStream defaultPressure](self, "defaultPressure");
  v8 = v7;
  -[RCPSyntheticEventStream defaultRadius](self, "defaultRadius");
  -[RCPSyntheticEventStream _touchDownAtPoints:touchCount:pressure:radius:edgeMaskOptions:](self, "_touchDownAtPoints:touchCount:pressure:radius:edgeMaskOptions:", a3, a4, 0, v8, v9);
}

- (void)touchDown:(CGPoint)a3 touchCount:(unint64_t)a4 radius:(double)a5
{
  double y;
  double x;
  double v10;

  y = a3.y;
  x = a3.x;
  -[RCPSyntheticEventStream defaultPressure](self, "defaultPressure");
  -[RCPSyntheticEventStream touchDown:touchCount:pressure:radius:](self, "touchDown:touchCount:pressure:radius:", a4, x, y, v10, a5);
}

- (void)touchDown:(CGPoint)a3 touchCount:(unint64_t)a4 pressure:(double)a5
{
  double y;
  double x;
  double v10;

  y = a3.y;
  x = a3.x;
  -[RCPSyntheticEventStream defaultRadius](self, "defaultRadius");
  -[RCPSyntheticEventStream touchDown:touchCount:pressure:radius:](self, "touchDown:touchCount:pressure:radius:", a4, x, y, a5, v10);
}

- (void)touchDown:(CGPoint)a3 touchCount:(unint64_t)a4
{
  double y;
  double x;
  double v8;
  double v9;
  double v10;

  y = a3.y;
  x = a3.x;
  -[RCPSyntheticEventStream defaultPressure](self, "defaultPressure");
  v9 = v8;
  -[RCPSyntheticEventStream defaultRadius](self, "defaultRadius");
  -[RCPSyntheticEventStream touchDown:touchCount:pressure:radius:](self, "touchDown:touchCount:pressure:radius:", a4, x, y, v9, v10);
}

- (void)touchDown:(CGPoint)a3
{
  double v4;
  double v5;
  double v6;
  uint64_t v7;

  -[RCPSyntheticEventStream defaultPressure](self, "defaultPressure", *(_QWORD *)&a3.x, *(_QWORD *)&a3.y);
  v5 = v4;
  -[RCPSyntheticEventStream defaultRadius](self, "defaultRadius");
  -[RCPSyntheticEventStream _touchDownAtPoints:touchCount:pressure:radius:edgeMaskOptions:](self, "_touchDownAtPoints:touchCount:pressure:radius:edgeMaskOptions:", &v7, 1, 0, v5, v6);
}

- (void)touchTapDown:(CGPoint)a3
{
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  unsigned int v8;
  CGPoint v9;

  v9 = a3;
  v8 = 0;
  -[RCPSyntheticEventStream _isEdgePoint:getMask:](self, "_isEdgePoint:getMask:", &v8);
  v8 |= 0x20000u;
  -[RCPSyntheticEventStream defaultPressure](self, "defaultPressure", v8);
  v5 = v4;
  -[RCPSyntheticEventStream defaultRadius](self, "defaultRadius");
  -[RCPSyntheticEventStream _touchDownAtPoints:touchCount:pressure:radius:edgeMaskOptions:](self, "_touchDownAtPoints:touchCount:pressure:radius:edgeMaskOptions:", &v9, 1, &v7, v5, v6);
}

- (void)edgeOrb:(CGPoint)a3
{
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  unsigned int v8;
  CGPoint v9;

  v9 = a3;
  v8 = 0;
  -[RCPSyntheticEventStream _isEdgePoint:getMask:](self, "_isEdgePoint:getMask:", &v8);
  v8 |= 0x8000u;
  -[RCPSyntheticEventStream defaultPressure](self, "defaultPressure", v8);
  v5 = v4;
  -[RCPSyntheticEventStream defaultRadius](self, "defaultRadius");
  -[RCPSyntheticEventStream _touchDownAtPoints:touchCount:pressure:radius:edgeMaskOptions:](self, "_touchDownAtPoints:touchCount:pressure:radius:edgeMaskOptions:", &v9, 1, &v7, v5, v6);
  -[RCPSyntheticEventStream moveToPoints:touchCount:pressure:duration:](self, "moveToPoints:touchCount:pressure:duration:", &v9, 1, 300.0, 0.5);
  -[RCPSyntheticEventStream moveToPoints:touchCount:pressure:duration:](self, "moveToPoints:touchCount:pressure:duration:", &v9, 1, 150.0, 0.2);
  -[RCPSyntheticEventStream moveToPoints:touchCount:pressure:duration:](self, "moveToPoints:touchCount:pressure:duration:", &v9, 1, 700.0, 1.3);
  -[RCPSyntheticEventStream liftUpAtPoints:touchCount:](self, "liftUpAtPoints:touchCount:", &v9, 1);
}

- (void)edgeOrbSwipe:(CGPoint)a3 withEndLocation:(CGPoint)a4 withDuration:(double)a5
{
  double y;
  double x;
  double v9;
  double v10;
  double v11;
  double currentTimeOffset;
  double v13;
  uint64_t v14;
  double v15;
  double v16;
  uint64_t v17;
  unsigned int v18;
  CGPoint v19;

  y = a4.y;
  x = a4.x;
  v19 = a3;
  v18 = 0;
  -[RCPSyntheticEventStream _isEdgePoint:getMask:](self, "_isEdgePoint:getMask:", &v18);
  v18 |= 0x8000u;
  -[RCPSyntheticEventStream defaultPressure](self, "defaultPressure", v18);
  v10 = v9;
  -[RCPSyntheticEventStream defaultRadius](self, "defaultRadius");
  -[RCPSyntheticEventStream _touchDownAtPoints:touchCount:pressure:radius:edgeMaskOptions:](self, "_touchDownAtPoints:touchCount:pressure:radius:edgeMaskOptions:", &v19, 1, &v17, v10, v11);
  -[RCPSyntheticEventStream moveToPoints:touchCount:pressure:duration:](self, "moveToPoints:touchCount:pressure:duration:", &v19, 1, 300.0, 0.5);
  currentTimeOffset = self->_currentTimeOffset;
  -[RCPSyntheticEventStream touchMoveInterval](self, "touchMoveInterval");
  if (a5 - v13 > 0.0)
  {
    v14 = 0;
    do
    {
      v15 = self->_currentTimeOffset - currentTimeOffset;
      -[RCPSyntheticEventStream _moveLastTouchPoint:eventMask:](self, "_moveLastTouchPoint:eventMask:", 0, -[RCPSyntheticEventStream _nextTouchLocationFrom:to:at:](self, v19.x, v19.y, x, y, v15 / a5 * (v15 / a5)));
      -[RCPSyntheticEventStream _delayBetweenMove:elapsedTime:](self, "_delayBetweenMove:elapsedTime:", v14, v15);
      -[RCPSyntheticEventStream touchMoveInterval](self, "touchMoveInterval");
      v14 = (v14 + 1);
    }
    while (v15 < a5 - v16);
  }
  -[RCPSyntheticEventStream liftUpAtAllActivePoints](self, "liftUpAtAllActivePoints");
}

- (void)liftUpActivePointsByIndex:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  unint64_t v10;
  __IOHIDEvent *v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t j;
  $47924B278A36D4A2860F70134BF18786 *v17;
  $47924B278A36D4A2860F70134BF18786 *v18;
  __int128 v19;
  CGPoint var4;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v4);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "integerValue");
        if (v10 < -[RCPSyntheticEventStream activePointCount](self, "activePointCount"))
        {
          *(_BYTE *)(-[RCPSyntheticEventStream activePoints](self, "activePoints") + 80 * v10 + 72) = 0;
          ++v7;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }
  v11 = -[RCPSyntheticEventStream _createIOHIDWithEventType:](self, "_createIOHIDWithEventType:", 6);
  -[RCPSyntheticEventStream _addIOHIDEventToProcessingBuffer:](self, "_addIOHIDEventToProcessingBuffer:", v11);
  CFRelease(v11);
  v12 = -[RCPSyntheticEventStream activePointCount](self, "activePointCount");
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    do
    {
      if ((_BYTE)(-[RCPSyntheticEventStream activePoints](self, "activePoints") + 80 * v14)[72])
      {
        ++v14;
      }
      else if (v14 <= 3)
      {
        v15 = 80 * v14;
        for (j = 4; j != v14; --j)
        {
          v17 = -[RCPSyntheticEventStream activePoints](self, "activePoints") + v15;
          v18 = -[RCPSyntheticEventStream activePoints](self, "activePoints") + v15;
          *(_OWORD *)&v17->var0 = *(_OWORD *)&v18[1].var0;
          v19 = *(_OWORD *)&v18[1].var7;
          v21 = *(_OWORD *)&v18[1].var2;
          var4 = v18[1].var4;
          *(_OWORD *)&v17->var5 = *(_OWORD *)&v18[1].var5;
          *(_OWORD *)&v17->var7 = v19;
          *(_OWORD *)&v17->var2 = v21;
          v17->var4 = var4;
          v15 += 80;
        }
      }
      --v13;
    }
    while (v13);
  }
  -[RCPSyntheticEventStream setActivePointCount:](self, "setActivePointCount:", -[RCPSyntheticEventStream activePointCount](self, "activePointCount") - v7);

}

- (void)liftUpAtAllActivePointsWithEventType:(int64_t)a3
{
  unint64_t v5;
  uint64_t v6;
  __IOHIDEvent *v7;

  if (-[RCPSyntheticEventStream activePointCount](self, "activePointCount"))
  {
    v5 = 0;
    v6 = 72;
    do
    {
      *(_BYTE *)(-[RCPSyntheticEventStream activePoints](self, "activePoints") + v6) = 0;
      ++v5;
      v6 += 80;
    }
    while (v5 < -[RCPSyntheticEventStream activePointCount](self, "activePointCount"));
  }
  v7 = -[RCPSyntheticEventStream _createIOHIDWithEventType:](self, "_createIOHIDWithEventType:", a3);
  -[RCPSyntheticEventStream _addIOHIDEventToProcessingBuffer:](self, "_addIOHIDEventToProcessingBuffer:", v7);
  CFRelease(v7);
  -[RCPSyntheticEventStream setActivePointCount:](self, "setActivePointCount:", 0);
}

- (void)liftUpAtAllActivePoints
{
  unint64_t v3;
  uint64_t v4;
  __IOHIDEvent *v5;

  if (-[RCPSyntheticEventStream activePointCount](self, "activePointCount"))
  {
    v3 = 0;
    v4 = 72;
    do
    {
      *(_BYTE *)(-[RCPSyntheticEventStream activePoints](self, "activePoints") + v4) = 0;
      ++v3;
      v4 += 80;
    }
    while (v3 < -[RCPSyntheticEventStream activePointCount](self, "activePointCount"));
  }
  v5 = -[RCPSyntheticEventStream _createIOHIDWithEventType:](self, "_createIOHIDWithEventType:", 6);
  -[RCPSyntheticEventStream _addIOHIDEventToProcessingBuffer:](self, "_addIOHIDEventToProcessingBuffer:", v5);
  CFRelease(v5);
  -[RCPSyntheticEventStream setActivePointCount:](self, "setActivePointCount:", 0);
}

- (void)liftUp:(CGPoint)a3
{
  -[RCPSyntheticEventStream liftUp:touchCount:](self, "liftUp:touchCount:", 1, a3.x, a3.y);
}

- (void)_moveLastTouchPoint:(CGPoint)a3 eventMask:(unint64_t)a4
{
  CGFloat y;
  CGFloat x;
  $47924B278A36D4A2860F70134BF18786 *v8;
  $47924B278A36D4A2860F70134BF18786 *v9;
  $47924B278A36D4A2860F70134BF18786 *v10;
  __IOHIDEvent *v11;

  y = a3.y;
  x = a3.x;
  v8 = -[RCPSyntheticEventStream activePoints](self, "activePoints");
  v9 = &v8[-[RCPSyntheticEventStream activePointCount](self, "activePointCount")];
  v9[-1].var4.x = x;
  v9[-1].var4.y = y;
  if (a4)
  {
    v10 = -[RCPSyntheticEventStream activePoints](self, "activePoints");
    v10[-[RCPSyntheticEventStream activePointCount](self, "activePointCount") - 1].var8 = a4;
  }
  v11 = -[RCPSyntheticEventStream _createIOHIDWithEventType:](self, "_createIOHIDWithEventType:", 2);
  -[RCPSyntheticEventStream _addIOHIDEventToProcessingBuffer:](self, "_addIOHIDEventToProcessingBuffer:", v11);
  CFRelease(v11);
}

- (void)moveToPoints:(CGPoint *)a3 touchCount:(unint64_t)a4 pressure:(double)a5 duration:(double)a6 radius:(double)a7
{
  unint64_t v11;
  char *v12;
  double v13;
  double v14;
  double currentTimeOffset;
  double v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  double *v23;
  double *v24;
  double *v25;
  double v26;
  double v27;
  uint64_t v28;
  double v29;
  uint64_t v30;
  CGPoint *v31;
  double *v32;
  double *p_y;
  double *v34;
  uint64_t v35;

  v31 = a3;
  v35 = *MEMORY[0x1E0C80C00];
  if (a4 >= 5)
    v11 = 5;
  else
    v11 = a4;
  v34 = (double *)((char *)&v30 - (16 * v11));
  v12 = (char *)v34;
  -[RCPSyntheticEventStream defaultPressure](self, "defaultPressure");
  v14 = v13;
  currentTimeOffset = self->_currentTimeOffset;
  -[RCPSyntheticEventStream touchMoveInterval](self, "touchMoveInterval");
  if (a6 - v16 > 0.0)
  {
    v17 = 0;
    v18 = a5 - v14;
    v32 = (double *)(v12 + 8);
    p_y = &v31->y;
    do
    {
      v19 = self->_currentTimeOffset - currentTimeOffset;
      v20 = v19 / a6;
      if (v19 / a6 > 1.0)
        v20 = 1.0;
      v21 = fmax(v20, 0.0);
      if (v11)
      {
        v22 = 0;
        v24 = v32;
        v23 = p_y;
        v25 = v34;
        do
        {
          if (!(_DWORD)v17)
            *(_OWORD *)v25 = (_OWORD)(-[RCPSyntheticEventStream activePoints](self, "activePoints") + v22)[32];
          v26 = *v25;
          v27 = v25[1];
          v25 += 2;
          *(v24 - 1) = -[RCPSyntheticEventStream _nextTouchLocationFrom:to:at:](self, v26, v27, *(v23 - 1), *v23, v21);
          *(_QWORD *)v24 = v28;
          v22 += 80;
          v23 += 2;
          v24 += 2;
        }
        while (80 * v11 != v22);
      }
      -[RCPSyntheticEventStream _setPressureForAllPoints:](self, "_setPressureForAllPoints:", v14 + v18 * v21);
      -[RCPSyntheticEventStream _setMajorRadiusForAllPoints:](self, "_setMajorRadiusForAllPoints:", a7);
      -[RCPSyntheticEventStream _updateTouchPoints:count:](self, "_updateTouchPoints:count:", v12, v11);
      -[RCPSyntheticEventStream _delayBetweenMove:elapsedTime:](self, "_delayBetweenMove:elapsedTime:", v17, v19);
      -[RCPSyntheticEventStream touchMoveInterval](self, "touchMoveInterval");
      v17 = (v17 + 1);
    }
    while (v19 < a6 - v29);
  }
  -[RCPSyntheticEventStream _updateTouchPoints:count:](self, "_updateTouchPoints:count:", v31, v11);
}

- (void)moveToPoints:(CGPoint *)a3 touchCount:(unint64_t)a4 pressure:(double)a5 duration:(double)a6
{
  double v11;

  -[RCPSyntheticEventStream defaultRadius](self, "defaultRadius");
  -[RCPSyntheticEventStream moveToPoints:touchCount:pressure:duration:radius:](self, "moveToPoints:touchCount:pressure:duration:radius:", a3, a4, a5, a6, v11);
}

- (void)moveToPoints:(CGPoint *)a3 touchCount:(unint64_t)a4 duration:(double)a5
{
  -[RCPSyntheticEventStream defaultPressure](self, "defaultPressure");
  -[RCPSyntheticEventStream moveToPoints:touchCount:pressure:duration:](self, "moveToPoints:touchCount:pressure:duration:", a3, a4);
}

- (void)moveToPoint:(CGPoint)a3 duration:(double)a4
{
  CGPoint v4;

  v4 = a3;
  -[RCPSyntheticEventStream moveToPoints:touchCount:duration:](self, "moveToPoints:touchCount:duration:", &v4, 1, a4);
}

- (void)_setPressureForAllPoints:(double)a3
{
  uint64_t v5;

  v5 = 5;
  do
  {
    *(double *)(-[RCPSyntheticEventStream activePoints](self, "activePoints") + 56) = a3;
    --v5;
  }
  while (v5);
}

- (void)_setMajorRadiusForAllPoints:(double)a3
{
  uint64_t v5;

  v5 = 5;
  do
  {
    *(double *)(-[RCPSyntheticEventStream activePoints](self, "activePoints") + 48) = a3;
    --v5;
  }
  while (v5);
}

- (void)tap:(CGPoint)a3 radius:(double)a4
{
  double y;
  double x;
  double v8;

  y = a3.y;
  x = a3.x;
  -[RCPSyntheticEventStream defaultPressure](self, "defaultPressure");
  -[RCPSyntheticEventStream taps:location:withNumberOfTouches:pressure:radius:](self, "taps:location:withNumberOfTouches:pressure:radius:", 1, 1, x, y, v8, a4);
}

- (void)tap:(CGPoint)a3 pressure:(double)a4
{
  double y;
  double x;
  double v8;

  y = a3.y;
  x = a3.x;
  -[RCPSyntheticEventStream defaultRadius](self, "defaultRadius");
  -[RCPSyntheticEventStream taps:location:withNumberOfTouches:pressure:radius:](self, "taps:location:withNumberOfTouches:pressure:radius:", 1, 1, x, y, a4, v8);
}

- (void)tap:(CGPoint)a3 withPressure:(double)a4 radius:(double)a5
{
  -[RCPSyntheticEventStream taps:location:withNumberOfTouches:pressure:radius:](self, "taps:location:withNumberOfTouches:pressure:radius:", 1, 1, a3.x, a3.y, a4, a5);
}

- (void)tapToWakeAtPoint:(CGPoint)a3
{
  double y;
  double x;

  y = a3.y;
  x = a3.x;
  -[RCPSyntheticEventStream touchTapDown:](self, "touchTapDown:");
  -[RCPSyntheticEventStream advanceTime:](self, "advanceTime:", 0.05);
  -[RCPSyntheticEventStream liftUp:touchCount:](self, "liftUp:touchCount:", 1, x, y);
}

- (void)_tap:(CGPoint)a3 withPressure:(double)a4
{
  double y;
  double x;

  y = a3.y;
  x = a3.x;
  *(_QWORD *)(-[RCPSyntheticEventStream activePoints](self, "activePoints", a3.x, a3.y, a4) + 56) = 0x3FF0000000000000;
  -[RCPSyntheticEventStream tap:](self, "tap:", x, y);
}

- (void)doubleTap:(CGPoint)a3
{
  -[RCPSyntheticEventStream taps:location:withNumberOfTouches:](self, "taps:location:withNumberOfTouches:", 2, 1, a3.x, a3.y);
}

- (void)doubleFingerTap:(CGPoint)a3
{
  -[RCPSyntheticEventStream taps:location:withNumberOfTouches:](self, "taps:location:withNumberOfTouches:", 1, 2, a3.x, a3.y);
}

- (void)tapsNoLift:(unint64_t)a3 location:(CGPoint)a4 withNumberOfTouches:(unint64_t)a5
{
  double y;
  double x;
  unint64_t i;

  if (a3)
  {
    y = a4.y;
    x = a4.x;
    for (i = a3 - 1; ; --i)
    {
      -[RCPSyntheticEventStream touchDown:touchCount:](self, "touchDown:touchCount:", a5, x, y);
      -[RCPSyntheticEventStream advanceTime:](self, "advanceTime:", 0.05);
      if (!i)
        break;
      -[RCPSyntheticEventStream advanceTime:](self, "advanceTime:", 0.15);
    }
  }
}

- (void)pressButtonsWithPages:(id)a3 usages:(id)a4 duration:(double)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  __IOHIDEvent *v15;
  uint64_t j;
  void *v17;
  uint64_t v18;
  void *v19;
  __IOHIDEvent *v20;
  id v21;

  v21 = a3;
  v8 = a4;
  v9 = objc_msgSend(v21, "count");
  if (v9 < 1)
  {
    -[RCPSyntheticEventStream advanceTime:](self, "advanceTime:", a5);
  }
  else
  {
    v10 = v9;
    for (i = 0; i != v10; ++i)
    {
      objc_msgSend(v21, "objectAtIndexedSubscript:", i);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "unsignedIntValue");
      objc_msgSend(v8, "objectAtIndexedSubscript:", i);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[RCPSyntheticEventStream _createIOSButtonHIDEventWithPage:usage:down:](self, "_createIOSButtonHIDEventWithPage:usage:down:", v13, objc_msgSend(v14, "unsignedIntValue"), 1);

      -[RCPSyntheticEventStream advanceTime:](self, "advanceTime:", 0.0001);
      -[RCPSyntheticEventStream _addIOHIDEventToProcessingBuffer:](self, "_addIOHIDEventToProcessingBuffer:", v15);
      CFRelease(v15);
    }
    -[RCPSyntheticEventStream advanceTime:](self, "advanceTime:", a5);
    for (j = 0; j != v10; ++j)
    {
      objc_msgSend(v21, "objectAtIndexedSubscript:", j);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "unsignedIntValue");
      objc_msgSend(v8, "objectAtIndexedSubscript:", j);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[RCPSyntheticEventStream _createIOSButtonHIDEventWithPage:usage:down:](self, "_createIOSButtonHIDEventWithPage:usage:down:", v18, objc_msgSend(v19, "unsignedIntValue"), 0);

      -[RCPSyntheticEventStream advanceTime:](self, "advanceTime:", 0.0001);
      -[RCPSyntheticEventStream _addIOHIDEventToProcessingBuffer:](self, "_addIOHIDEventToProcessingBuffer:", v20);
      CFRelease(v20);
    }
  }

}

- (void)pressButtons:(id)a3 duration:(double)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __IOHIDEvent *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __IOHIDEvent *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v23;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v6);
        v11 = -[RCPSyntheticEventStream _createIOSButtonHIDEventWithButtonType:down:](self, "_createIOSButtonHIDEventWithButtonType:down:", objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v10), "integerValue"), 1);
        -[RCPSyntheticEventStream advanceTime:](self, "advanceTime:", 0.0001);
        -[RCPSyntheticEventStream _addIOHIDEventToProcessingBuffer:](self, "_addIOHIDEventToProcessingBuffer:", v11);
        CFRelease(v11);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v8);
  }
  -[RCPSyntheticEventStream advanceTime:](self, "advanceTime:", a4);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v12 = v6;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v19;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v12);
        v17 = -[RCPSyntheticEventStream _createIOSButtonHIDEventWithButtonType:down:](self, "_createIOSButtonHIDEventWithButtonType:down:", objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v16), "integerValue", (_QWORD)v18), 0);
        -[RCPSyntheticEventStream _addIOHIDEventToProcessingBuffer:](self, "_addIOHIDEventToProcessingBuffer:", v17);
        CFRelease(v17);
        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v14);
  }

}

- (void)beginButtonPressForButtonType:(int64_t)a3
{
  __IOHIDEvent *v4;

  v4 = -[RCPSyntheticEventStream _createIOSButtonHIDEventWithButtonType:down:](self, "_createIOSButtonHIDEventWithButtonType:down:", a3, 1);
  -[RCPSyntheticEventStream _addIOHIDEventToProcessingBuffer:](self, "_addIOHIDEventToProcessingBuffer:", v4);
  CFRelease(v4);
}

- (void)endButtonPressForButtonType:(int64_t)a3
{
  __IOHIDEvent *v4;

  v4 = -[RCPSyntheticEventStream _createIOSButtonHIDEventWithButtonType:down:](self, "_createIOSButtonHIDEventWithButtonType:down:", a3, 0);
  -[RCPSyntheticEventStream _addIOHIDEventToProcessingBuffer:](self, "_addIOHIDEventToProcessingBuffer:", v4);
  CFRelease(v4);
}

- (void)beginButtonPressWithPage:(unint64_t)a3 usage:(unint64_t)a4
{
  __IOHIDEvent *v5;

  v5 = -[RCPSyntheticEventStream _createIOSButtonHIDEventWithPage:usage:down:](self, "_createIOSButtonHIDEventWithPage:usage:down:", a3, a4, 1);
  -[RCPSyntheticEventStream _addIOHIDEventToProcessingBuffer:](self, "_addIOHIDEventToProcessingBuffer:", v5);
  CFRelease(v5);
}

- (void)endButtonPressWithPage:(unint64_t)a3 usage:(unint64_t)a4
{
  __IOHIDEvent *v5;

  v5 = -[RCPSyntheticEventStream _createIOSButtonHIDEventWithPage:usage:down:](self, "_createIOSButtonHIDEventWithPage:usage:down:", a3, a4, 0);
  -[RCPSyntheticEventStream _addIOHIDEventToProcessingBuffer:](self, "_addIOHIDEventToProcessingBuffer:", v5);
  CFRelease(v5);
}

- (void)flipRingerSwitchToValue:(BOOL)a3
{
  __IOHIDEvent *v4;

  v4 = -[RCPSyntheticEventStream _createIOSButtonHIDEventWithPage:usage:down:](self, "_createIOSButtonHIDEventWithPage:usage:down:", 11, 46, a3);
  -[RCPSyntheticEventStream _addIOHIDEventToProcessingBuffer:](self, "_addIOHIDEventToProcessingBuffer:", v4);
  CFRelease(v4);
}

- (void)rotateCrown:(double)a3 direction:(int64_t)a4 duration:(double)a5
{
  double v8;
  double v9;
  int v10;
  double currentTimeOffset;
  double v12;
  double v13;
  double v14;
  int v15;
  const void *ScrollEvent;

  -[RCPSyntheticEventStream touchMoveInterval](self, "touchMoveInterval");
  v9 = v8;
  v10 = llround(a5 / v8);
  if (v10 >= 2)
  {
    currentTimeOffset = self->_currentTimeOffset;
    v12 = (double)(int)llround(a3 * 164.0 / 360.0);
    v14 = *MEMORY[0x1E0C9D538];
    v13 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v15 = v10 - 1;
    do
    {
      -[RCPSyntheticEventStream advanceTime:](self, "advanceTime:", v9);
      -[RCPSyntheticEventStream _nextTouchLocationFrom:to:at:](self, v14, v13, 0.0, v12, (self->_currentTimeOffset - currentTimeOffset) / a5);
      -[RCPSyntheticEventStream _currentMachTime](self, "_currentMachTime");
      ScrollEvent = (const void *)IOHIDEventCreateScrollEvent();
      IOHIDEventSetIntegerValue();
      -[RCPSyntheticEventStream _addIOHIDEventToProcessingBuffer:](self, "_addIOHIDEventToProcessingBuffer:", ScrollEvent);
      CFRelease(ScrollEvent);
      --v15;
    }
    while (v15);
  }
}

- (void)_knobEventForOffset:(CGVector)a3 buttonMask:(unsigned int)a4 oldButtonMask:(unsigned int)a5
{
  const void *RelativePointerEvent;
  const void *v7;

  -[RCPSyntheticEventStream _currentMachTime](self, "_currentMachTime");
  RelativePointerEvent = (const void *)IOHIDEventCreateRelativePointerEvent();
  -[RCPSyntheticEventStream _currentMachTime](self, "_currentMachTime");
  v7 = (const void *)IOHIDEventCreate();
  IOHIDEventSetFloatValue();
  IOHIDEventSetFloatValue();
  if (v7)
  {
    IOHIDEventAppendEvent();
    CFRelease(v7);
  }
  -[RCPSyntheticEventStream _addIOHIDEventToProcessingBuffer:](self, "_addIOHIDEventToProcessingBuffer:", RelativePointerEvent);
  CFRelease(RelativePointerEvent);
}

- (void)knobNudge:(CGVector)a3 buttonMask:(unsigned int)a4 duration:(double)a5
{
  uint64_t v6;

  v6 = *(_QWORD *)&a4;
  -[RCPSyntheticEventStream _knobEventForOffset:buttonMask:oldButtonMask:](self, "_knobEventForOffset:buttonMask:oldButtonMask:", *(_QWORD *)&a4, 0, a3.dx, a3.dy);
  -[RCPSyntheticEventStream advanceTime:](self, "advanceTime:", a5);
  -[RCPSyntheticEventStream _knobEventForOffset:buttonMask:oldButtonMask:](self, "_knobEventForOffset:buttonMask:oldButtonMask:", 0, v6, 0.0, 0.0);
}

- (void)sendUnicodeString:(id)a3
{
  void *v4;
  const void *UnicodeEvent;
  id v6;

  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCPSyntheticEventStream _currentMachTime](self, "_currentMachTime");
  v6 = objc_retainAutorelease(v4);
  objc_msgSend(v6, "bytes");
  objc_msgSend(v6, "length");
  UnicodeEvent = (const void *)IOHIDEventCreateUnicodeEvent();
  -[RCPSyntheticEventStream _addIOHIDEventToProcessingBuffer:](self, "_addIOHIDEventToProcessingBuffer:", UnicodeEvent);
  CFRelease(UnicodeEvent);

}

- (void)sendUnicodeStringByCharacters:(id)a3 durationBetweenEvents:(double)a4
{
  unint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  if (objc_msgSend(v8, "count"))
  {
    v6 = 0;
    do
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[RCPSyntheticEventStream sendUnicodeString:](self, "sendUnicodeString:", v7);

      if (v6 != objc_msgSend(v8, "count") - 1)
        -[RCPSyntheticEventStream advanceTime:](self, "advanceTime:", a4);
      ++v6;
    }
    while (objc_msgSend(v8, "count") > v6);
  }

}

- (void)sendUnicodeString:(id)a3 synthesizePerCharacterEvents:(BOOL)a4 durationBetweenEvents:(double)a5
{
  id v7;

  if (a4)
  {
    -[RCPSyntheticEventStream _splitStringIntoArrayOfCharacters:](self, "_splitStringIntoArrayOfCharacters:", a3);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[RCPSyntheticEventStream sendUnicodeStringByCharacters:durationBetweenEvents:](self, "sendUnicodeStringByCharacters:durationBetweenEvents:", v7, a5);

  }
  else
  {
    -[RCPSyntheticEventStream sendUnicodeString:](self, "sendUnicodeString:", a3, a5);
  }
}

- (id)_splitStringIntoArrayOfCharacters:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v3 = (objc_class *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithCapacity:", objc_msgSend(v4, "length"));
  v6 = objc_msgSend(v4, "length");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61__RCPSyntheticEventStream__splitStringIntoArrayOfCharacters___block_invoke;
  v10[3] = &unk_1E4FC2068;
  v11 = v5;
  v7 = v5;
  objc_msgSend(v4, "enumerateSubstringsInRange:options:usingBlock:", 0, v6, 2, v10);

  v8 = (void *)objc_msgSend(v7, "copy");
  return v8;
}

uint64_t __61__RCPSyntheticEventStream__splitStringIntoArrayOfCharacters___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "addObject:", a2);
  return result;
}

- (void)pressDiscreteGameControllerButton:(int64_t)a3 duration:(double)a4
{
  __IOHIDEvent *v6;
  __IOHIDEvent *v7;

  v6 = -[RCPSyntheticEventStream _createIOHIDGameControllerEventForDpadButton:](self, "_createIOHIDGameControllerEventForDpadButton:", a3);
  -[RCPSyntheticEventStream advanceTime:](self, "advanceTime:", 0.0001);
  -[RCPSyntheticEventStream _addIOHIDEventToProcessingBuffer:](self, "_addIOHIDEventToProcessingBuffer:", v6);
  CFRelease(v6);
  -[RCPSyntheticEventStream advanceTime:](self, "advanceTime:", a4);
  v7 = -[RCPSyntheticEventStream _createIOHIDGameControllerEventForDpadButton:](self, "_createIOHIDGameControllerEventForDpadButton:", 0);
  -[RCPSyntheticEventStream advanceTime:](self, "advanceTime:", 0.0001);
  -[RCPSyntheticEventStream _addIOHIDEventToProcessingBuffer:](self, "_addIOHIDEventToProcessingBuffer:", v7);
  CFRelease(v7);
}

- (void)dragWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 duration:(double)a5
{
  double y;
  double x;
  double v8;
  double v9;
  double v11;
  double v12;
  double v13;

  y = a4.y;
  x = a4.x;
  v8 = a3.y;
  v9 = a3.x;
  -[RCPSyntheticEventStream defaultPressure](self, "defaultPressure");
  v12 = v11;
  -[RCPSyntheticEventStream defaultRadius](self, "defaultRadius");
  -[RCPSyntheticEventStream dragWithStartPoint:endPoint:duration:pressure:radius:](self, "dragWithStartPoint:endPoint:duration:pressure:radius:", v9, v8, x, y, a5, v12, v13);
}

- (void)dragWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 duration:(double)a5 radius:(double)a6
{
  double y;
  double x;
  double v10;
  double v11;
  double v13;

  y = a4.y;
  x = a4.x;
  v10 = a3.y;
  v11 = a3.x;
  -[RCPSyntheticEventStream defaultPressure](self, "defaultPressure");
  -[RCPSyntheticEventStream dragWithStartPoint:endPoint:duration:pressure:radius:](self, "dragWithStartPoint:endPoint:duration:pressure:radius:", v11, v10, x, y, a5, v13, a6);
}

- (void)dragWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 duration:(double)a5 pressure:(double)a6
{
  double y;
  double x;
  double v10;
  double v11;
  double v13;

  y = a4.y;
  x = a4.x;
  v10 = a3.y;
  v11 = a3.x;
  -[RCPSyntheticEventStream defaultRadius](self, "defaultRadius");
  -[RCPSyntheticEventStream dragWithStartPoint:endPoint:duration:pressure:radius:](self, "dragWithStartPoint:endPoint:duration:pressure:radius:", v11, v10, x, y, a5, a6, v13);
}

- (void)dragWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 duration:(double)a5 pressure:(double)a6 radius:(double)a7
{
  -[RCPSyntheticEventStream _dragWithStartPoint:mask:endPoint:mask:duration:tapAndWait:lift:pressure:radius:](self, "_dragWithStartPoint:mask:endPoint:mask:duration:tapAndWait:lift:pressure:radius:", 0, 0, 1, a3.x, a3.y, a4.x, a4.y, a5, 0.0, a6, a7);
}

- (void)dragWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 duration:(double)a5 tapAndWait:(double)a6 lift:(BOOL)a7
{
  _BOOL8 v7;
  double y;
  double x;
  double v12;
  double v13;
  double v15;
  double v16;
  double v17;

  v7 = a7;
  y = a4.y;
  x = a4.x;
  v12 = a3.y;
  v13 = a3.x;
  -[RCPSyntheticEventStream defaultPressure](self, "defaultPressure");
  v16 = v15;
  -[RCPSyntheticEventStream defaultRadius](self, "defaultRadius");
  -[RCPSyntheticEventStream dragWithStartPoint:endPoint:duration:tapAndWait:lift:pressure:radius:](self, "dragWithStartPoint:endPoint:duration:tapAndWait:lift:pressure:radius:", v7, v13, v12, x, y, a5, a6, v16, v17);
}

- (void)dragWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 duration:(double)a5 tapAndWait:(double)a6 lift:(BOOL)a7 radius:(double)a8
{
  _BOOL8 v9;
  double y;
  double x;
  double v14;
  double v15;
  double v17;

  v9 = a7;
  y = a4.y;
  x = a4.x;
  v14 = a3.y;
  v15 = a3.x;
  -[RCPSyntheticEventStream defaultPressure](self, "defaultPressure");
  -[RCPSyntheticEventStream dragWithStartPoint:endPoint:duration:tapAndWait:lift:pressure:radius:](self, "dragWithStartPoint:endPoint:duration:tapAndWait:lift:pressure:radius:", v9, v15, v14, x, y, a5, a6, v17, a8);
}

- (void)dragWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 duration:(double)a5 tapAndWait:(double)a6 lift:(BOOL)a7 pressure:(double)a8
{
  _BOOL8 v9;
  double y;
  double x;
  double v14;
  double v15;
  double v17;

  v9 = a7;
  y = a4.y;
  x = a4.x;
  v14 = a3.y;
  v15 = a3.x;
  -[RCPSyntheticEventStream defaultRadius](self, "defaultRadius");
  -[RCPSyntheticEventStream dragWithStartPoint:endPoint:duration:tapAndWait:lift:pressure:radius:](self, "dragWithStartPoint:endPoint:duration:tapAndWait:lift:pressure:radius:", v9, v15, v14, x, y, a5, a6, a8, v17);
}

- (void)dragWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 duration:(double)a5 tapAndWait:(double)a6 lift:(BOOL)a7 pressure:(double)a8 radius:(double)a9
{
  -[RCPSyntheticEventStream _dragWithStartPoint:mask:endPoint:mask:duration:tapAndWait:lift:pressure:radius:](self, "_dragWithStartPoint:mask:endPoint:mask:duration:tapAndWait:lift:pressure:radius:", 0, 0, a7, a3.x, a3.y, a4.x, a4.y, a5, a6, a8, a9);
}

- (void)dragWithStartPoint:(CGPoint)a3 mask:(unint64_t)a4 endPoint:(CGPoint)a5 mask:(unint64_t)a6 duration:(double)a7
{
  double y;
  double x;
  double v12;
  double v13;
  double v15;
  double v16;
  double v17;

  y = a5.y;
  x = a5.x;
  v12 = a3.y;
  v13 = a3.x;
  -[RCPSyntheticEventStream defaultPressure](self, "defaultPressure");
  v16 = v15;
  -[RCPSyntheticEventStream defaultRadius](self, "defaultRadius");
  -[RCPSyntheticEventStream _dragWithStartPoint:mask:endPoint:mask:duration:tapAndWait:lift:pressure:radius:](self, "_dragWithStartPoint:mask:endPoint:mask:duration:tapAndWait:lift:pressure:radius:", a4, a6, 1, v13, v12, x, y, a7, 0.0, v16, v17);
}

- (void)sendFlickWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 duration:(double)a5
{
  double y;
  double x;
  double v8;
  double v9;
  double v11;
  double v12;
  double v13;

  y = a4.y;
  x = a4.x;
  v8 = a3.y;
  v9 = a3.x;
  -[RCPSyntheticEventStream defaultPressure](self, "defaultPressure");
  v12 = v11;
  -[RCPSyntheticEventStream defaultRadius](self, "defaultRadius");
  -[RCPSyntheticEventStream _flickWithStartPoint:endPoint:duration:pressure:radius:](self, "_flickWithStartPoint:endPoint:duration:pressure:radius:", v9, v8, x, y, a5, v12, v13);
}

- (void)sendFlickWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 duration:(double)a5 pressure:(double)a6
{
  double y;
  double x;
  double v10;
  double v11;
  double v13;

  y = a4.y;
  x = a4.x;
  v10 = a3.y;
  v11 = a3.x;
  -[RCPSyntheticEventStream defaultRadius](self, "defaultRadius");
  -[RCPSyntheticEventStream _flickWithStartPoint:endPoint:duration:pressure:radius:](self, "_flickWithStartPoint:endPoint:duration:pressure:radius:", v11, v10, x, y, a5, a6, v13);
}

- (void)sendFlickWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 duration:(double)a5 radius:(double)a6
{
  double y;
  double x;
  double v10;
  double v11;
  double v13;

  y = a4.y;
  x = a4.x;
  v10 = a3.y;
  v11 = a3.x;
  -[RCPSyntheticEventStream defaultPressure](self, "defaultPressure");
  -[RCPSyntheticEventStream _flickWithStartPoint:endPoint:duration:pressure:radius:](self, "_flickWithStartPoint:endPoint:duration:pressure:radius:", v11, v10, x, y, a5, v13, a6);
}

- (void)multifingerDragWithPointArray:(CGPoint *)a3 numPoints:(unint64_t)a4 duration:(double)a5 numFingers:(unint64_t)a6
{
  unint64_t v9;
  double v10;
  double v11;
  uint64_t v12;
  double currentTimeOffset;
  CGPoint *v14;
  CGFloat y;
  double v16;
  double v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  BOOL v28;
  double v29;
  double v30;
  double v31;
  double v32;
  uint64_t v33;
  double *v34;
  double v35;
  _QWORD v36[2];
  double v37;
  double v38;
  double v39;
  double x;
  double v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if (a3 && a4 >= 2)
  {
    v36[1] = v36;
    if (a6 >= 5)
      v9 = 5;
    else
      v9 = a6;
    v10 = ((double (*)(RCPSyntheticEventStream *, SEL, __n128))MEMORY[0x1E0C80A78])(self, a2, *(__n128 *)&a5)
        / (double)(a4 - 1);
    v11 = (double)(v9 >> 1);
    v37 = (double)v9;
    v12 = 1;
    do
    {
      currentTimeOffset = self->_currentTimeOffset;
      v14 = &a3[v12];
      x = v14[-1].x;
      v41 = currentTimeOffset;
      y = v14[-1].y;
      v16 = v14->y;
      v38 = v14->x;
      v39 = y;
      -[RCPSyntheticEventStream touchMoveInterval](self, "touchMoveInterval");
      if (v10 - v17 > 0.0)
      {
        v18 = 0;
        do
        {
          v19 = self->_currentTimeOffset - v41;
          v20 = -[RCPSyntheticEventStream _nextTouchLocationFrom:to:at:](self, x, v39, v38, v16, v19 / v10);
          v22 = v21;
          v23 = v20 - v11;
          v24 = 0.0;
          v25 = 0.0;
          if (v20 - v11 >= 0.0)
          {
            v26 = v23 + v37;
            -[RCPSyntheticEventStream screenSize](self, "screenSize");
            v28 = v26 <= v27;
            v25 = v23;
            if (!v28)
            {
              -[RCPSyntheticEventStream screenSize](self, "screenSize");
              v25 = v29;
            }
          }
          if (v22 - v11 >= 0.0)
          {
            v30 = v22 - v11 + v37;
            -[RCPSyntheticEventStream screenSize](self, "screenSize");
            v28 = v30 <= v31;
            v24 = v22 - v11;
            if (!v28)
            {
              -[RCPSyntheticEventStream screenSize](self, "screenSize");
              v24 = v32;
            }
          }
          if (v9)
          {
            v33 = 0;
            v34 = (double *)&v36[-2 * v9 + 1];
            do
            {
              *(v34 - 1) = v25 + (double)(int)v33;
              *v34 = v24 + (double)(int)v33++;
              v34 += 2;
            }
            while (v9 != v33);
          }
          -[RCPSyntheticEventStream _updateTouchPoints:count:](self, "_updateTouchPoints:count:", &v36[-2 * v9], v9);
          -[RCPSyntheticEventStream _delayBetweenMove:elapsedTime:](self, "_delayBetweenMove:elapsedTime:", v18, v19);
          -[RCPSyntheticEventStream touchMoveInterval](self, "touchMoveInterval");
          v18 = (v18 + 1);
        }
        while (v19 < v10 - v35);
      }
      ++v12;
    }
    while (v12 != a4);
    -[RCPSyntheticEventStream liftUpAtPoints:touchCount:](self, "liftUpAtPoints:touchCount:", &v36[-2 * v9], v9);
    -[RCPSyntheticEventStream setActivePointCount:](self, "setActivePointCount:", 0);
  }
}

- (void)rotate:(CGPoint)a3 withRadius:(double)a4 rotation:(double)a5 duration:(double)a6 touchCount:(unint64_t)a7
{
  double y;
  double x;
  unint64_t v12;
  double v13;
  double *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  double v22;
  double *v23;
  __double2 v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;

  v27 = a5;
  y = a3.y;
  x = a3.x;
  v28 = *MEMORY[0x1E0C80C00];
  if (a7 >= 5)
    v12 = 5;
  else
    v12 = a7;
  v13 = MEMORY[0x1E0C80A78](self, a2, (__n128)a3, *(__n128 *)&a3.y, *(__n128 *)&a4, *(__n128 *)&a5);
  v15 = v14[4];
  objc_msgSend(v14, "touchMoveInterval", v13);
  v17 = v16;
  -[RCPSyntheticEventStream touchMoveInterval](self, "touchMoveInterval");
  if (a6 - v18 > 0.0)
  {
    v19 = 0;
    v20 = (double)(int)llround(a6 / v17);
    do
    {
      if (v12)
      {
        v21 = 0;
        v22 = (double)(int)v19 / v20 * v27;
        v23 = &v27 - 2 * v12 + 1;
        do
        {
          v24 = __sincos_stret(v22 + 6.28318531 / (double)v12 * (double)(int)v21);
          *(v23 - 1) = x + a4 * v24.__cosval;
          *v23 = y + a4 * v24.__sinval;
          ++v21;
          v23 += 2;
        }
        while (v12 != v21);
      }
      -[RCPSyntheticEventStream _updateTouchPoints:count:](self, "_updateTouchPoints:count:", &v27 - 2 * v12, v12, *(_QWORD *)&v27, v28);
      v25 = self->_currentTimeOffset - v15;
      -[RCPSyntheticEventStream _delayBetweenMove:elapsedTime:](self, "_delayBetweenMove:elapsedTime:", v19, v25);
      -[RCPSyntheticEventStream touchMoveInterval](self, "touchMoveInterval");
      v19 = (v19 + 1);
    }
    while (v25 < a6 - v26);
  }
  -[RCPSyntheticEventStream liftUpAtPoints:touchCount:](self, "liftUpAtPoints:touchCount:", &v27 - 2 * v12, v12, *(_QWORD *)&v27);
  -[RCPSyntheticEventStream setActivePointCount:](self, "setActivePointCount:", 0);
}

- (void)_dragWithStartPoint:(CGPoint)a3 mask:(unint64_t)a4 endPoint:(CGPoint)a5 mask:(unint64_t)a6 duration:(double)a7 tapAndWait:(double)a8 lift:(BOOL)a9 pressure:(double)a10 radius:(double)a11
{
  double y;
  double x;
  double v21;
  double v22;
  int v23;
  unsigned int v24;
  double currentTimeOffset;
  unsigned int v26;
  double v27;
  unint64_t v28;
  uint64_t v29;
  CGPoint v30;

  y = a5.y;
  x = a5.x;
  v30 = a3;
  -[RCPSyntheticEventStream touchMoveInterval](self, "touchMoveInterval");
  v22 = v21;
  v29 = a4;
  -[RCPSyntheticEventStream _touchDownAtPoints:touchCount:pressure:radius:edgeMaskOptions:](self, "_touchDownAtPoints:touchCount:pressure:radius:edgeMaskOptions:", &v30, 1, &v29, a10, a11);
  if (a8 > 0.0)
    -[RCPSyntheticEventStream advanceTime:](self, "advanceTime:", a8);
  v23 = llround(a7 / v22);
  if (v23 >= 2)
  {
    v24 = 0;
    currentTimeOffset = self->_currentTimeOffset;
    v26 = v23 - 1;
    do
    {
      -[RCPSyntheticEventStream advanceTime:](self, "advanceTime:", v22);
      v27 = -[RCPSyntheticEventStream _nextTouchLocationFrom:to:at:](self, v30.x, v30.y, x, y, (self->_currentTimeOffset - currentTimeOffset) / a7);
      if (v24 >= v26 / 3)
        v28 = a6;
      else
        v28 = a4;
      -[RCPSyntheticEventStream _moveLastTouchPoint:eventMask:](self, "_moveLastTouchPoint:eventMask:", v28, v27);
      ++v24;
    }
    while (v26 != v24);
  }
  -[RCPSyntheticEventStream advanceTime:](self, "advanceTime:", v22);
  if (a9)
    -[RCPSyntheticEventStream liftUp:](self, "liftUp:", x, y);
}

- (void)_flickWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 duration:(double)a5 pressure:(double)a6 radius:(double)a7
{
  double y;
  double x;
  double v10;
  double v11;
  double currentTimeOffset;
  double v14;
  uint64_t v15;
  double v16;
  double v17;

  y = a4.y;
  x = a4.x;
  v10 = a3.y;
  v11 = a3.x;
  currentTimeOffset = self->_currentTimeOffset;
  -[RCPSyntheticEventStream touchDown:touchCount:pressure:radius:](self, "touchDown:touchCount:pressure:radius:", 1, a3.x, a3.y, a6, a7);
  -[RCPSyntheticEventStream touchMoveInterval](self, "touchMoveInterval");
  if (a5 - v14 > 0.0)
  {
    v15 = 0;
    v16 = 0.0;
    do
    {
      -[RCPSyntheticEventStream _delayBetweenMove:elapsedTime:](self, "_delayBetweenMove:elapsedTime:", v15, v16);
      v16 = self->_currentTimeOffset - currentTimeOffset;
      -[RCPSyntheticEventStream _moveLastTouchPoint:eventMask:](self, "_moveLastTouchPoint:eventMask:", 0, -[RCPSyntheticEventStream _nextTouchLocationFrom:to:at:](self, v11, v10, x, y, v16 / a5 * (v16 / a5)));
      v15 = (v15 + 1);
      -[RCPSyntheticEventStream touchMoveInterval](self, "touchMoveInterval");
    }
    while (v16 < a5 - v17);
  }
  -[RCPSyntheticEventStream liftUp:](self, "liftUp:", x, y);
}

- (void)pinchOpenWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 duration:(double)a5
{
  double y;
  double x;
  double v8;
  double v9;
  double v11;
  double v12;
  double v13;

  y = a4.y;
  x = a4.x;
  v8 = a3.y;
  v9 = a3.x;
  -[RCPSyntheticEventStream defaultPressure](self, "defaultPressure");
  v12 = v11;
  -[RCPSyntheticEventStream defaultRadius](self, "defaultRadius");
  -[RCPSyntheticEventStream pinchOpenWithStartPoint:endPoint:duration:pressure:radius:](self, "pinchOpenWithStartPoint:endPoint:duration:pressure:radius:", v9, v8, x, y, a5, v12, v13);
}

- (void)pinchOpenWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 duration:(double)a5 radius:(double)a6
{
  double y;
  double x;
  double v10;
  double v11;
  double v13;

  y = a4.y;
  x = a4.x;
  v10 = a3.y;
  v11 = a3.x;
  -[RCPSyntheticEventStream defaultPressure](self, "defaultPressure");
  -[RCPSyntheticEventStream pinchOpenWithStartPoint:endPoint:duration:pressure:radius:](self, "pinchOpenWithStartPoint:endPoint:duration:pressure:radius:", v11, v10, x, y, a5, v13, a6);
}

- (void)pinchOpenWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 duration:(double)a5 pressure:(double)a6
{
  double y;
  double x;
  double v10;
  double v11;
  double v13;

  y = a4.y;
  x = a4.x;
  v10 = a3.y;
  v11 = a3.x;
  -[RCPSyntheticEventStream defaultRadius](self, "defaultRadius");
  -[RCPSyntheticEventStream pinchOpenWithStartPoint:endPoint:duration:pressure:radius:](self, "pinchOpenWithStartPoint:endPoint:duration:pressure:radius:", v11, v10, x, y, a5, a6, v13);
}

- (void)pinchOpenWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 duration:(double)a5 pressure:(double)a6 radius:(double)a7
{
  double y;
  double x;
  double v10;
  double v11;
  double currentTimeOffset;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  double v19;
  double v20;

  y = a4.y;
  x = a4.x;
  v10 = a3.y;
  v11 = a3.x;
  currentTimeOffset = self->_currentTimeOffset;
  -[RCPSyntheticEventStream touchDown:touchCount:pressure:radius:](self, "touchDown:touchCount:pressure:radius:", 1, a3.x, a3.y, a6, a7);
  v14 = -[RCPSyntheticEventStream _nextTouchLocationFrom:to:at:](self, v11, v10, x, y, 0.1);
  v16 = v15;
  -[RCPSyntheticEventStream touchDown:touchCount:pressure:radius:](self, "touchDown:touchCount:pressure:radius:", 1);
  -[RCPSyntheticEventStream touchMoveInterval](self, "touchMoveInterval");
  if (a5 - v17 > 0.0)
  {
    v18 = 0;
    do
    {
      v19 = self->_currentTimeOffset - currentTimeOffset;
      -[RCPSyntheticEventStream _moveLastTouchPoint:eventMask:](self, "_moveLastTouchPoint:eventMask:", 0, -[RCPSyntheticEventStream _nextTouchLocationFrom:to:at:](self, v14, v16, x, y, v19 / a5));
      -[RCPSyntheticEventStream _delayBetweenMove:elapsedTime:](self, "_delayBetweenMove:elapsedTime:", v18, v19);
      -[RCPSyntheticEventStream touchMoveInterval](self, "touchMoveInterval");
      v18 = (v18 + 1);
    }
    while (v19 < a5 - v20);
  }
  -[RCPSyntheticEventStream _moveLastTouchPoint:eventMask:](self, "_moveLastTouchPoint:eventMask:", 0, x, y);
  -[RCPSyntheticEventStream advanceTime:](self, "advanceTime:", 0.05);
  -[RCPSyntheticEventStream liftUp:](self, "liftUp:", x, y);
  -[RCPSyntheticEventStream liftUp:](self, "liftUp:", v14, v16);
}

- (void)pinchCloseWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 duration:(double)a5
{
  double y;
  double x;
  double v8;
  double v9;
  double v11;
  double v12;
  double v13;

  y = a4.y;
  x = a4.x;
  v8 = a3.y;
  v9 = a3.x;
  -[RCPSyntheticEventStream defaultPressure](self, "defaultPressure");
  v12 = v11;
  -[RCPSyntheticEventStream defaultRadius](self, "defaultRadius");
  -[RCPSyntheticEventStream pinchCloseWithStartPoint:endPoint:duration:pressure:radius:](self, "pinchCloseWithStartPoint:endPoint:duration:pressure:radius:", v9, v8, x, y, a5, v12, v13);
}

- (void)pinchCloseWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 duration:(double)a5 pressure:(double)a6
{
  double y;
  double x;
  double v10;
  double v11;
  double v13;

  y = a4.y;
  x = a4.x;
  v10 = a3.y;
  v11 = a3.x;
  -[RCPSyntheticEventStream defaultRadius](self, "defaultRadius");
  -[RCPSyntheticEventStream pinchCloseWithStartPoint:endPoint:duration:pressure:radius:](self, "pinchCloseWithStartPoint:endPoint:duration:pressure:radius:", v11, v10, x, y, a5, a6, v13);
}

- (void)pinchCloseWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 duration:(double)a5 radius:(double)a6
{
  double y;
  double x;
  double v10;
  double v11;
  double v13;

  y = a4.y;
  x = a4.x;
  v10 = a3.y;
  v11 = a3.x;
  -[RCPSyntheticEventStream defaultPressure](self, "defaultPressure");
  -[RCPSyntheticEventStream pinchCloseWithStartPoint:endPoint:duration:pressure:radius:](self, "pinchCloseWithStartPoint:endPoint:duration:pressure:radius:", v11, v10, x, y, a5, v13, a6);
}

- (void)pinchCloseWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 duration:(double)a5 pressure:(double)a6 radius:(double)a7
{
  double y;
  double x;
  double v10;
  double v11;
  double currentTimeOffset;
  double v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;

  y = a4.y;
  x = a4.x;
  v10 = a3.y;
  v11 = a3.x;
  currentTimeOffset = self->_currentTimeOffset;
  -[RCPSyntheticEventStream touchDown:](self, "touchDown:", a4.x, a4.y);
  -[RCPSyntheticEventStream touchDown:](self, "touchDown:", v11, v10);
  -[RCPSyntheticEventStream touchMoveInterval](self, "touchMoveInterval");
  if (a5 - v14 > 0.0)
  {
    v15 = 0;
    do
    {
      v16 = self->_currentTimeOffset - currentTimeOffset;
      -[RCPSyntheticEventStream _moveLastTouchPoint:eventMask:](self, "_moveLastTouchPoint:eventMask:", 0, -[RCPSyntheticEventStream _nextTouchLocationFrom:to:at:](self, v11, v10, x, y, v16 / a5));
      -[RCPSyntheticEventStream _delayBetweenMove:elapsedTime:](self, "_delayBetweenMove:elapsedTime:", v15, v16);
      -[RCPSyntheticEventStream touchMoveInterval](self, "touchMoveInterval");
      v15 = (v15 + 1);
    }
    while (v16 < a5 - v17);
  }
  v18 = -[RCPSyntheticEventStream _nextTouchLocationFrom:to:at:](self, v11, v10, x, y, 0.9);
  v20 = v19;
  -[RCPSyntheticEventStream _moveLastTouchPoint:eventMask:](self, "_moveLastTouchPoint:eventMask:", 0);
  -[RCPSyntheticEventStream liftUp:](self, "liftUp:", v18, v20);
  -[RCPSyntheticEventStream advanceTime:](self, "advanceTime:", 0.05);
  -[RCPSyntheticEventStream liftUp:](self, "liftUp:", x, y);
}

- (void)peekAndPop:(CGPoint)a3 commit:(BOOL)a4 duration:(double)a5
{
  _BOOL8 v6;
  double y;
  double x;
  double v10;
  double v11;
  double v12;

  v6 = a4;
  y = a3.y;
  x = a3.x;
  -[RCPSyntheticEventStream defaultPressure](self, "defaultPressure");
  v11 = v10;
  -[RCPSyntheticEventStream defaultRadius](self, "defaultRadius");
  -[RCPSyntheticEventStream peekAndPop:commit:duration:pressure:radius:](self, "peekAndPop:commit:duration:pressure:radius:", v6, x, y, a5, v11, v12);
}

- (void)peekAndPop:(CGPoint)a3 commit:(BOOL)a4 duration:(double)a5 presure:(double)a6
{
  _BOOL8 v8;
  double y;
  double x;
  double v12;

  v8 = a4;
  y = a3.y;
  x = a3.x;
  -[RCPSyntheticEventStream defaultRadius](self, "defaultRadius");
  -[RCPSyntheticEventStream peekAndPop:commit:duration:pressure:radius:](self, "peekAndPop:commit:duration:pressure:radius:", v8, x, y, a5, a6, v12);
}

- (void)peekAndPop:(CGPoint)a3 commit:(BOOL)a4 duration:(double)a5 radius:(double)a6
{
  _BOOL8 v8;
  double y;
  double x;
  double v12;

  v8 = a4;
  y = a3.y;
  x = a3.x;
  -[RCPSyntheticEventStream defaultPressure](self, "defaultPressure");
  -[RCPSyntheticEventStream peekAndPop:commit:duration:pressure:radius:](self, "peekAndPop:commit:duration:pressure:radius:", v8, x, y, a5, v12, a6);
}

- (void)peekAndPop:(CGPoint)a3 commit:(BOOL)a4 duration:(double)a5 pressure:(double)a6 radius:(double)a7
{
  _BOOL4 v9;
  CGPoint v11;

  v9 = a4;
  v11 = a3;
  -[RCPSyntheticEventStream _touchDownAtPoints:touchCount:pressure:radius:edgeMaskOptions:](self, "_touchDownAtPoints:touchCount:pressure:radius:edgeMaskOptions:", &v11, 1, 0, a6, a7);
  -[RCPSyntheticEventStream moveToPoints:touchCount:pressure:duration:radius:](self, "moveToPoints:touchCount:pressure:duration:radius:", &v11, 1, 300.0, 0.5, a7);
  -[RCPSyntheticEventStream moveToPoints:touchCount:pressure:duration:radius:](self, "moveToPoints:touchCount:pressure:duration:radius:", &v11, 1, 150.0, 0.2, a7);
  -[RCPSyntheticEventStream advanceTime:](self, "advanceTime:", a5);
  if (v9)
    -[RCPSyntheticEventStream moveToPoints:touchCount:pressure:duration:radius:](self, "moveToPoints:touchCount:pressure:duration:radius:", &v11, 1, 700.0, 0.8, a7);
  -[RCPSyntheticEventStream liftUpAtPoints:touchCount:](self, "liftUpAtPoints:touchCount:", &v11, 1);
}

- (__IOHIDEvent)_parentZeroPointerEvent
{
  const void *RelativePointerEvent;

  -[RCPSyntheticEventStream _currentMachTime](self, "_currentMachTime");
  RelativePointerEvent = (const void *)IOHIDEventCreateRelativePointerEvent();
  return (__IOHIDEvent *)CFAutorelease(RelativePointerEvent);
}

- (void)_wrapInPointerParentAndAddToProcessingBuffer:(__IOHIDEvent *)a3
{
  const void *RelativePointerEvent;

  -[RCPSyntheticEventStream _currentMachTime](self, "_currentMachTime");
  RelativePointerEvent = (const void *)IOHIDEventCreateRelativePointerEvent();
  IOHIDEventAppendEvent();
  -[RCPSyntheticEventStream _addIOHIDEventToProcessingBuffer:](self, "_addIOHIDEventToProcessingBuffer:", RelativePointerEvent);
  CFRelease(RelativePointerEvent);
}

- (void)pointerSetAbsolutePosition:(CGPoint)a3
{
  double y;
  double x;
  const void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;

  y = a3.y;
  x = a3.x;
  -[RCPSyntheticEventStream _currentMachTime](self, "_currentMachTime");
  v6 = (const void *)IOHIDEventCreate();
  -[RCPSyntheticEventStream pointerChildEventStream](self, "pointerChildEventStream");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCurrentPointerLocation:", x, y);

  -[RCPSyntheticEventStream _normalizePoint:](self, "_normalizePoint:", x, y);
  v9 = v8;
  v11 = v10;
  -[RCPSyntheticEventStream pointerChildEventStream](self, "pointerChildEventStream");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "orientedNormalPoint:", v9, v11);

  IOHIDEventSetFloatValue();
  IOHIDEventSetFloatValue();
  -[RCPSyntheticEventStream _addIOHIDEventToProcessingBuffer:](self, "_addIOHIDEventToProcessingBuffer:", v6);
  CFRelease(v6);
}

- (void)pointerMoveDelta:(CGPoint)a3 duration:(double)a4 frequency:(int64_t)a5
{
  _QWORD v5[5];
  CGPoint v6;
  double v7;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__RCPSyntheticEventStream_pointerMoveDelta_duration_frequency___block_invoke;
  v5[3] = &unk_1E4FC25B8;
  v5[4] = self;
  v6 = a3;
  v7 = a4;
  -[RCPSyntheticEventStream _withPointerEventStreamAtFrequency:perform:](self, "_withPointerEventStreamAtFrequency:perform:", a5, v5);
}

uint64_t __63__RCPSyntheticEventStream_pointerMoveDelta_duration_frequency___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "pointerMoveByDelta:duration:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
}

- (void)pointerMoveByDelta:(CGVector)a3 duration:(double)a4
{
  CGFloat dy;
  CGFloat dx;
  void *v8;
  _QWORD v9[8];

  dy = a3.dy;
  dx = a3.dx;
  -[RCPSyntheticEventStream pointerChildEventStream](self, "pointerChildEventStream");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__RCPSyntheticEventStream_pointerMoveByDelta_duration___block_invoke;
  v9[3] = &unk_1E4FC25B8;
  v9[4] = self;
  *(CGFloat *)&v9[5] = dx;
  *(CGFloat *)&v9[6] = dy;
  *(double *)&v9[7] = a4;
  -[RCPSyntheticEventStream withExclusiveChildStream:perform:](self, "withExclusiveChildStream:perform:", v8, v9);

}

void __55__RCPSyntheticEventStream_pointerMoveByDelta_duration___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "pointerChildEventStream");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "moveByDelta:duration:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));

}

- (void)pointerMoveToPoint:(CGPoint)a3 duration:(double)a4
{
  CGFloat y;
  CGFloat x;
  void *v8;
  _QWORD v9[8];

  y = a3.y;
  x = a3.x;
  -[RCPSyntheticEventStream pointerChildEventStream](self, "pointerChildEventStream");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__RCPSyntheticEventStream_pointerMoveToPoint_duration___block_invoke;
  v9[3] = &unk_1E4FC25B8;
  v9[4] = self;
  *(CGFloat *)&v9[5] = x;
  *(CGFloat *)&v9[6] = y;
  *(double *)&v9[7] = a4;
  -[RCPSyntheticEventStream withExclusiveChildStream:perform:](self, "withExclusiveChildStream:perform:", v8, v9);

}

void __55__RCPSyntheticEventStream_pointerMoveToPoint_duration___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "pointerChildEventStream");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "moveToPoint:duration:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));

}

- (void)pointerMoveFromOriginPoint:(CGPoint)a3 toDestinationPoint:(CGPoint)a4 duration:(double)a5 frequency:(int64_t)a6
{
  _QWORD v6[5];
  CGPoint v7;
  CGPoint v8;
  double v9;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __92__RCPSyntheticEventStream_pointerMoveFromOriginPoint_toDestinationPoint_duration_frequency___block_invoke;
  v6[3] = &unk_1E4FC2680;
  v6[4] = self;
  v7 = a3;
  v8 = a4;
  v9 = a5;
  -[RCPSyntheticEventStream _withPointerEventStreamAtFrequency:perform:](self, "_withPointerEventStreamAtFrequency:perform:", a6, v6);
}

uint64_t __92__RCPSyntheticEventStream_pointerMoveFromOriginPoint_toDestinationPoint_duration_frequency___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "pointerMoveToPoint:duration:", *(double *)(a1 + 40), *(double *)(a1 + 48), 0.1);
  return objc_msgSend(*(id *)(a1 + 32), "pointerMoveToPoint:duration:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

- (double)_nextPointerDeltaFrom:(uint64_t)a3 to:(double)a4 step:(double)a5 steps:(double)a6
{
  void *v13;
  double v14;
  double v15;

  if (!a1)
    return 0.0;
  objc_msgSend(a1, "pointerCurveFunction");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "rcp_solveForDelta:withSteps:step:", a3, a2, a6 - a4, a7 - a5);
  v15 = v14;

  return v15;
}

- (void)pointerDiscreteScroll:(CGPoint)a3 duration:(double)a4 frequency:(int64_t)a5
{
  double y;
  double x;
  uint64_t v7;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  const void *ScrollEvent;

  y = a3.y;
  x = a3.x;
  v7 = vcvtpd_s64_f64((double)a5 * a4);
  if (v7 >= 1)
  {
    v9 = 0;
    v10 = *MEMORY[0x1E0C9D538];
    v11 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v12 = 1.0 / (double)a5;
    do
    {
      -[RCPSyntheticEventStream _nextPointerDeltaFrom:to:step:steps:](self, v9, v7, v10, v11, x, y);
      -[RCPSyntheticEventStream _currentMachTime](self, "_currentMachTime");
      ScrollEvent = (const void *)IOHIDEventCreateScrollEvent();
      -[RCPSyntheticEventStream _addIOHIDEventToProcessingBuffer:](self, "_addIOHIDEventToProcessingBuffer:", ScrollEvent);
      CFRelease(ScrollEvent);
      -[RCPSyntheticEventStream advanceTime:](self, "advanceTime:", v12);
      ++v9;
    }
    while (v7 != v9);
  }
}

- (void)pointerDiscreteScroll:(CGPoint)a3 duration:(double)a4
{
  double y;
  double x;
  double v8;

  y = a3.y;
  x = a3.x;
  -[RCPSyntheticEventStream pointerFrequency](self, "pointerFrequency");
  -[RCPSyntheticEventStream pointerDiscreteScroll:duration:frequency:](self, "pointerDiscreteScroll:duration:frequency:", (uint64_t)v8, x, y, a4);
}

- (void)pointerPhasedScroll:(CGPoint)a3 duration:(double)a4 frequency:(int64_t)a5
{
  CGFloat y;
  CGFloat x;
  RCPScrollEventStream *v10;
  void *v11;
  RCPScrollEventStream *v12;
  _QWORD v13[4];
  RCPScrollEventStream *v14;
  CGFloat v15;
  CGFloat v16;
  double v17;

  y = a3.y;
  x = a3.x;
  v10 = objc_alloc_init(RCPScrollEventStream);
  -[RCPScrollEventStream setFrequency:](v10, "setFrequency:", (double)a5);
  if (self->_scalePointerPhaseScrollToPixels)
  {
    -[RCPSyntheticEventStream gsScreenScaleFactor](self, "gsScreenScaleFactor");
    -[RCPScrollEventStream setDeltaToPixelsScaleFactor:](v10, "setDeltaToPixelsScaleFactor:");
  }
  -[RCPSyntheticEventStream pointerCurveFunction](self, "pointerCurveFunction");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCPScrollEventStream setPointerCurveFunction:](v10, "setPointerCurveFunction:", v11);

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __66__RCPSyntheticEventStream_pointerPhasedScroll_duration_frequency___block_invoke;
  v13[3] = &unk_1E4FC25B8;
  v14 = v10;
  v15 = x;
  v16 = y;
  v17 = a4;
  v12 = v10;
  -[RCPSyntheticEventStream withExclusiveChildStream:perform:](self, "withExclusiveChildStream:perform:", v12, v13);

}

uint64_t __66__RCPSyntheticEventStream_pointerPhasedScroll_duration_frequency___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "advanceByDelta:duration:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
}

- (void)pointerPhasedScroll:(CGPoint)a3 duration:(double)a4
{
  double y;
  double x;
  double v8;

  y = a3.y;
  x = a3.x;
  -[RCPSyntheticEventStream pointerFrequency](self, "pointerFrequency");
  -[RCPSyntheticEventStream pointerPhasedScroll:duration:frequency:](self, "pointerPhasedScroll:duration:frequency:", (uint64_t)v8, x, y, a4);
}

- (void)pointerPhasedFlick:(CGPoint)a3 duration:(double)a4 frequency:(int64_t)a5
{
  CGFloat y;
  CGFloat x;
  RCPScrollEventStream *v10;
  void *v11;
  void *v12;
  RCPScrollEventStream *v13;
  _QWORD v14[4];
  RCPScrollEventStream *v15;
  CGFloat v16;
  CGFloat v17;
  double v18;

  y = a3.y;
  x = a3.x;
  v10 = objc_alloc_init(RCPScrollEventStream);
  -[RCPScrollEventStream setFrequency:](v10, "setFrequency:", (double)a5);
  if (self->_scalePointerPhaseScrollToPixels)
  {
    -[RCPSyntheticEventStream gsScreenScaleFactor](self, "gsScreenScaleFactor");
    -[RCPScrollEventStream setDeltaToPixelsScaleFactor:](v10, "setDeltaToPixelsScaleFactor:");
  }
  -[RCPSyntheticEventStream pointerCurveFunction](self, "pointerCurveFunction");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "rcp_functionWithLinearEnd");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCPScrollEventStream setPointerCurveFunction:](v10, "setPointerCurveFunction:", v12);

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __65__RCPSyntheticEventStream_pointerPhasedFlick_duration_frequency___block_invoke;
  v14[3] = &unk_1E4FC25B8;
  v15 = v10;
  v16 = x;
  v17 = y;
  v18 = a4;
  v13 = v10;
  -[RCPSyntheticEventStream withExclusiveChildStream:perform:](self, "withExclusiveChildStream:perform:", v13, v14);

}

uint64_t __65__RCPSyntheticEventStream_pointerPhasedFlick_duration_frequency___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "advanceByDelta:duration:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
}

- (void)pointerPhasedFlick:(CGPoint)a3 duration:(double)a4
{
  double y;
  double x;
  double v8;

  y = a3.y;
  x = a3.x;
  -[RCPSyntheticEventStream pointerFrequency](self, "pointerFrequency");
  -[RCPSyntheticEventStream pointerPhasedFlick:duration:frequency:](self, "pointerPhasedFlick:duration:frequency:", (uint64_t)v8, x, y, a4);
}

- (void)pointerDiscreteGesture:(id)a3 duration:(double)a4 frequency:(int64_t)a5
{
  double v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  __IOHIDEvent *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  uint64_t ScaleEvent;
  double v25;
  double v26;
  double v27;
  double v28;
  const void *v29;
  double v30;
  double v31;
  double v32;
  const void *TranslationEvent;
  uint64_t v34;
  double v35;
  id v36;
  id obj;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v36 = a3;
  v8 = (double)a5;
  v9 = vcvtpd_s64_f64((double)a5 * a4);
  if (v9 >= 1)
  {
    v10 = 0;
    v11 = *MEMORY[0x1E0C9D538];
    v12 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v35 = 1.0 / v8;
    do
    {
      v13 = -[RCPSyntheticEventStream _parentZeroPointerEvent](self, "_parentZeroPointerEvent");
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      obj = v36;
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      if (!v14)
        goto LABEL_18;
      v15 = v14;
      v16 = *(_QWORD *)v39;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v39 != v16)
            objc_enumerationMutation(obj);
          v18 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v17);
          if (objc_msgSend(v18, "isScale"))
          {
            LODWORD(v19) = 1056437569;
            LODWORD(v20) = 1026291025;
            LODWORD(v21) = 1057228128;
            LODWORD(v22) = 1064648875;
            objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v19, v20, v21, v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "z");
            objc_msgSend(v23, "rcp_solveForDelta:withSteps:step:", v9, v10);
            -[RCPSyntheticEventStream _currentMachTime](self, "_currentMachTime");
            ScaleEvent = IOHIDEventCreateScaleEvent();
LABEL_12:
            v29 = (const void *)ScaleEvent;
            IOHIDEventAppendEvent();
            CFRelease(v29);

            goto LABEL_13;
          }
          if (objc_msgSend(v18, "isRotation"))
          {
            LODWORD(v25) = 1056437569;
            LODWORD(v26) = 1026291025;
            LODWORD(v27) = 1057228128;
            LODWORD(v28) = 1064648875;
            objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v25, v26, v27, v28);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "z");
            objc_msgSend(v23, "rcp_solveForDelta:withSteps:step:", v9, v10);
            -[RCPSyntheticEventStream _currentMachTime](self, "_currentMachTime");
            ScaleEvent = IOHIDEventCreateRotationEvent();
            goto LABEL_12;
          }
          if (objc_msgSend(v18, "isTranslation"))
          {
            objc_msgSend(v18, "x");
            v31 = v30;
            objc_msgSend(v18, "y");
            -[RCPSyntheticEventStream _nextPointerDeltaFrom:to:step:steps:](self, v9, v10, v11, v12, v31, v32);
            -[RCPSyntheticEventStream _currentMachTime](self, "_currentMachTime");
            TranslationEvent = (const void *)IOHIDEventCreateTranslationEvent();
            IOHIDEventAppendEvent();
            CFRelease(TranslationEvent);
          }
LABEL_13:
          ++v17;
        }
        while (v15 != v17);
        v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
        v15 = v34;
      }
      while (v34);
LABEL_18:

      -[RCPSyntheticEventStream _addIOHIDEventToProcessingBuffer:](self, "_addIOHIDEventToProcessingBuffer:", v13);
      -[RCPSyntheticEventStream advanceTime:](self, "advanceTime:", v35);
      ++v10;
    }
    while (v10 != v9);
  }

}

- (void)pointerScale:(double)a3 duration:(double)a4 frequency:(int64_t)a5
{
  void *v8;
  void *v9;
  id v10;

  v8 = (void *)MEMORY[0x1E0C99E60];
  +[RCPDiscreteGestureSpec scaleZ:](RCPDiscreteGestureSpec, "scaleZ:", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithObject:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCPSyntheticEventStream pointerDiscreteGesture:duration:frequency:](self, "pointerDiscreteGesture:duration:frequency:", v9, a5, a4);

}

- (void)pointerRotation:(double)a3 duration:(double)a4 frequency:(int64_t)a5
{
  void *v8;
  void *v9;
  id v10;

  v8 = (void *)MEMORY[0x1E0C99E60];
  +[RCPDiscreteGestureSpec rotationZ:](RCPDiscreteGestureSpec, "rotationZ:", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithObject:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCPSyntheticEventStream pointerDiscreteGesture:duration:frequency:](self, "pointerDiscreteGesture:duration:frequency:", v9, a5, a4);

}

- (void)pointerTranslatation:(CGPoint)a3 duration:(double)a4 frequency:(int64_t)a5
{
  void *v8;
  void *v9;
  id v10;

  v8 = (void *)MEMORY[0x1E0C99E60];
  +[RCPDiscreteGestureSpec translation:](RCPDiscreteGestureSpec, "translation:", a3.x, a3.y);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithObject:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCPSyntheticEventStream pointerDiscreteGesture:duration:frequency:](self, "pointerDiscreteGesture:duration:frequency:", v9, a5, a4);

}

- (void)_pressButtonEventForIndex:(int64_t)a3 down:(BOOL)a4
{
  const void *v5;

  -[RCPSyntheticEventStream _currentMachTime](self, "_currentMachTime");
  v5 = (const void *)IOHIDEventCreate();
  IOHIDEventSetIntegerValue();
  IOHIDEventSetIntegerValue();
  IOHIDEventSetIntegerValue();
  -[RCPSyntheticEventStream _wrapInPointerParentAndAddToProcessingBuffer:](self, "_wrapInPointerParentAndAddToProcessingBuffer:", v5);
  CFRelease(v5);
}

- (void)pointerBeginPressingButton:(int64_t)a3
{
  -[RCPSyntheticEventStream _pressButtonEventForIndex:down:](self, "_pressButtonEventForIndex:down:", a3, 1);
}

- (void)pointerEndPressingButton:(int64_t)a3
{
  -[RCPSyntheticEventStream _pressButtonEventForIndex:down:](self, "_pressButtonEventForIndex:down:", a3, 0);
}

- (void)_withPointerEventStreamAtFrequency:(int64_t)a3 perform:(id)a4
{
  void (**v6)(_QWORD);
  void *v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  id v12;

  v6 = (void (**)(_QWORD))a4;
  -[RCPSyntheticEventStream pointerChildEventStream](self, "pointerChildEventStream");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frequency");
  v9 = v8;

  v10 = (double)a3;
  -[RCPSyntheticEventStream pointerChildEventStream](self, "pointerChildEventStream");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrequency:", v10);

  v6[2](v6);
  -[RCPSyntheticEventStream pointerChildEventStream](self, "pointerChildEventStream");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrequency:", (double)(uint64_t)v9);

}

- (void)_hoverAtPoints:(CGPoint *)a3 touchCount:(unint64_t)a4 pressure:(double)a5 radius:(double)a6 edgeMaskOptions:(id *)a7 withEventType:(int64_t)a8 withZPosition:(double)a9 withAzimuthAngle:(double)a10 withRollAngle:(double)a11 withAltitudeAngle:(double)a12
{
  unint64_t v21;
  unint64_t v23;
  double x;
  double y;
  double v26;
  double v27;
  double v28;
  double v29;
  unsigned int var0;
  uint64_t v31;
  __IOHIDEvent *v32;

  if (a4)
  {
    v21 = a4;
    do
    {
      v23 = -[RCPSyntheticEventStream activePointCount](self, "activePointCount");
      x = a3->x;
      y = a3->y;
      *(CGPoint *)(-[RCPSyntheticEventStream activePoints](self, "activePoints") + 80 * v23 + 32) = *a3;
      *(double *)(-[RCPSyntheticEventStream activePoints](self, "activePoints") + 80 * v23 + 56) = a5;
      *(double *)(-[RCPSyntheticEventStream activePoints](self, "activePoints") + 80 * v23) = a9;
      *(double *)(-[RCPSyntheticEventStream activePoints](self, "activePoints") + 80 * v23 + 16) = a10;
      *(double *)(-[RCPSyntheticEventStream activePoints](self, "activePoints") + 80 * v23 + 8) = a11;
      *(double *)(-[RCPSyntheticEventStream activePoints](self, "activePoints") + 80 * v23 + 24) = a12;
      if (a7 && !a7->var1)
      {
        var0 = a7->var0;
        *(_DWORD *)(-[RCPSyntheticEventStream activePoints](self, "activePoints") + 80 * v23 + 68) = var0;
      }
      else
      {
        -[RCPSyntheticEventStream _normalizePoint:](self, "_normalizePoint:", x, y);
        v27 = v26;
        v29 = v28;
        *(_DWORD *)(-[RCPSyntheticEventStream activePoints](self, "activePoints") + 80 * v23 + 68) = 0;
        -[RCPSyntheticEventStream _isEdgePoint:getMask:](self, "_isEdgePoint:getMask:", -[RCPSyntheticEventStream activePoints](self, "activePoints") + 80 * v23 + 68, v27, v29);
      }
      v31 = 5 * v23;
      *(_BYTE *)(-[RCPSyntheticEventStream activePoints](self, "activePoints") + 16 * v31 + 72) = 0;
      *(double *)(-[RCPSyntheticEventStream activePoints](self, "activePoints") + 16 * v31 + 48) = a6;
      -[RCPSyntheticEventStream setActivePointCount:](self, "setActivePointCount:", -[RCPSyntheticEventStream activePointCount](self, "activePointCount") + 1);
      ++a3;
      --v21;
    }
    while (v21);
  }
  v32 = -[RCPSyntheticEventStream _createIOHIDWithEventType:](self, "_createIOHIDWithEventType:", a8, a5, a6, a9, a10, a11, a12);
  -[RCPSyntheticEventStream _addIOHIDEventToProcessingBuffer:](self, "_addIOHIDEventToProcessingBuffer:", v32);
  CFRelease(v32);
}

- (void)hoverAtLocation:(CGPoint)a3 withDuration:(double)a4
{
  CGPoint v6;

  v6 = a3;
  -[RCPSyntheticEventStream _hoverAtPoints:touchCount:pressure:radius:edgeMaskOptions:withEventType:withZPosition:withAzimuthAngle:withRollAngle:withAltitudeAngle:](self, "_hoverAtPoints:touchCount:pressure:radius:edgeMaskOptions:withEventType:withZPosition:withAzimuthAngle:withRollAngle:withAltitudeAngle:", &v6, 1, 0, 9, 0.0, 0.0, 5.0, 0.0, 0.0, 0.785398163);
  -[RCPSyntheticEventStream advanceTime:](self, "advanceTime:", a4);
  -[RCPSyntheticEventStream liftUpAtAllActivePointsWithEventType:](self, "liftUpAtAllActivePointsWithEventType:", 9);
}

- (void)hoverToTapAtLocation:(CGPoint)a3 withDuration:(double)a4
{
  CGPoint v6;

  v6 = a3;
  -[RCPSyntheticEventStream _hoverAtPoints:touchCount:pressure:radius:edgeMaskOptions:withEventType:withZPosition:withAzimuthAngle:withRollAngle:withAltitudeAngle:](self, "_hoverAtPoints:touchCount:pressure:radius:edgeMaskOptions:withEventType:withZPosition:withAzimuthAngle:withRollAngle:withAltitudeAngle:", &v6, 1, 0, 12, 0.0, 0.0, 5.0, 0.0, 0.0, 0.785398163);
  -[RCPSyntheticEventStream advanceTime:](self, "advanceTime:", a4);
  -[RCPSyntheticEventStream liftUpAtAllActivePointsWithEventType:](self, "liftUpAtAllActivePointsWithEventType:", 10);
}

- (void)hoverAtLocation:(CGPoint)a3 withDuration:(double)a4 withZPosition:(double)a5
{
  CGPoint v7;

  v7 = a3;
  -[RCPSyntheticEventStream _hoverAtPoints:touchCount:pressure:radius:edgeMaskOptions:withEventType:withZPosition:withAzimuthAngle:withRollAngle:withAltitudeAngle:](self, "_hoverAtPoints:touchCount:pressure:radius:edgeMaskOptions:withEventType:withZPosition:withAzimuthAngle:withRollAngle:withAltitudeAngle:", &v7, 1, 0, 9, 0.0, 0.0, a5, 0.0, 0.0, 0.785398163);
  -[RCPSyntheticEventStream advanceTime:](self, "advanceTime:", a4);
  -[RCPSyntheticEventStream liftUpAtAllActivePointsWithEventType:](self, "liftUpAtAllActivePointsWithEventType:", 10);
}

- (void)hoverAtLocation:(CGPoint)a3 withDuration:(double)a4 withZPosition:(double)a5 withAltitudeAngle:(double)a6 withAzimuthAngle:(double)a7 withRollAngle:(double)a8
{
  CGPoint v10;

  v10 = a3;
  -[RCPSyntheticEventStream _hoverAtPoints:touchCount:pressure:radius:edgeMaskOptions:withEventType:withZPosition:withAzimuthAngle:withRollAngle:withAltitudeAngle:](self, "_hoverAtPoints:touchCount:pressure:radius:edgeMaskOptions:withEventType:withZPosition:withAzimuthAngle:withRollAngle:withAltitudeAngle:", &v10, 1, 0, 9, 0.0, 0.0, a5, a7, a8, a6);
  -[RCPSyntheticEventStream advanceTime:](self, "advanceTime:", a4);
  -[RCPSyntheticEventStream liftUpAtAllActivePointsWithEventType:](self, "liftUpAtAllActivePointsWithEventType:", 10);
}

- (void)hover:(CGPoint)a3 withZPosition:(double)a4 withAltitudeAngle:(double)a5 withAzimuthAngle:(double)a6 withRollAngle:(double)a7
{
  CGPoint v7;

  v7 = a3;
  -[RCPSyntheticEventStream _hoverAtPoints:touchCount:pressure:radius:edgeMaskOptions:withEventType:withZPosition:withAzimuthAngle:withRollAngle:withAltitudeAngle:](self, "_hoverAtPoints:touchCount:pressure:radius:edgeMaskOptions:withEventType:withZPosition:withAzimuthAngle:withRollAngle:withAltitudeAngle:", &v7, 1, 0, 9, 0.0, 0.0, a4, a6, a7, a5);
}

- (void)hoverToTapAtLocation:(CGPoint)a3 withDuration:(double)a4 withZPosition:(double)a5
{
  CGPoint v7;

  v7 = a3;
  -[RCPSyntheticEventStream _hoverAtPoints:touchCount:pressure:radius:edgeMaskOptions:withEventType:withZPosition:withAzimuthAngle:withRollAngle:withAltitudeAngle:](self, "_hoverAtPoints:touchCount:pressure:radius:edgeMaskOptions:withEventType:withZPosition:withAzimuthAngle:withRollAngle:withAltitudeAngle:", &v7, 1, 0, 12, 0.0, 0.0, a5, 0.0, 0.0, 0.785398163);
  -[RCPSyntheticEventStream advanceTime:](self, "advanceTime:", a4);
  -[RCPSyntheticEventStream liftUpAtAllActivePointsWithEventType:](self, "liftUpAtAllActivePointsWithEventType:", 10);
}

- (void)hover:(CGPoint)a3 withZPosition:(double)a4
{
  CGPoint v4;

  v4 = a3;
  -[RCPSyntheticEventStream _hoverAtPoints:touchCount:pressure:radius:edgeMaskOptions:withEventType:withZPosition:withAzimuthAngle:withRollAngle:withAltitudeAngle:](self, "_hoverAtPoints:touchCount:pressure:radius:edgeMaskOptions:withEventType:withZPosition:withAzimuthAngle:withRollAngle:withAltitudeAngle:", &v4, 1, 0, 9, 0.0, 0.0, a4, 0.0, 0.0, 0.785398163);
}

- (void)hoverToTap:(CGPoint)a3 withZPosition:(double)a4
{
  CGPoint v4;

  v4 = a3;
  -[RCPSyntheticEventStream _hoverAtPoints:touchCount:pressure:radius:edgeMaskOptions:withEventType:withZPosition:withAzimuthAngle:withRollAngle:withAltitudeAngle:](self, "_hoverAtPoints:touchCount:pressure:radius:edgeMaskOptions:withEventType:withZPosition:withAzimuthAngle:withRollAngle:withAltitudeAngle:", &v4, 1, 0, 12, 0.0, 0.0, a4, 0.0, 0.0, 0.785398163);
}

- (void)stylusBarrelDoubleTap
{
  const void *GenericGestureEvent;

  -[RCPSyntheticEventStream _currentMachTime](self, "_currentMachTime");
  GenericGestureEvent = (const void *)IOHIDEventCreateGenericGestureEvent();
  IOHIDEventSetIntegerValue();
  IOHIDEventSetPhase();
  -[RCPSyntheticEventStream _addIOHIDEventToProcessingBuffer:](self, "_addIOHIDEventToProcessingBuffer:", GenericGestureEvent);
  CFRelease(GenericGestureEvent);
}

- (void)barrelRollAtLocation:(CGPoint)a3 withZPosition:(double)a4 withAltitudeAngle:(double)a5 withAzimuthAngle:(double)a6 withRollAngle:(double)a7
{
  const void *GenericGestureEvent;
  CGPoint v9;

  v9 = a3;
  -[RCPSyntheticEventStream _hoverAtPoints:touchCount:pressure:radius:edgeMaskOptions:withEventType:withZPosition:withAzimuthAngle:withRollAngle:withAltitudeAngle:](self, "_hoverAtPoints:touchCount:pressure:radius:edgeMaskOptions:withEventType:withZPosition:withAzimuthAngle:withRollAngle:withAltitudeAngle:", &v9, 1, 0, 9, 0.0, 0.0, a4, 0.0, 0.0, 0.785398163);
  -[RCPSyntheticEventStream _currentMachTime](self, "_currentMachTime");
  GenericGestureEvent = (const void *)IOHIDEventCreateGenericGestureEvent();
  IOHIDEventSetFloatValue();
  IOHIDEventSetFloatValue();
  IOHIDEventSetFloatValue();
  IOHIDEventSetPhase();
  -[RCPSyntheticEventStream _addIOHIDEventToProcessingBuffer:](self, "_addIOHIDEventToProcessingBuffer:", GenericGestureEvent);
  CFRelease(GenericGestureEvent);
}

- (void)_squeezeWithPhase:(unsigned __int16)a3 withPage:(id)a4 withUsage:(id)a5 withVersion:(unsigned __int8)a6 withStage:(unsigned int)a7 withTransition:(unsigned int)a8 withNextThreshold:(double)a9 withPressedThreshold:(double)a10 withReleasedThreshold:(double)a11 withNormalizedForce:(double)a12 withNormalizedForceVelocity:(double)a13
{
  id v15;
  id v16;
  const void *GenericGestureEvent;
  void *v18;
  id v19;
  unint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;

  v20 = __PAIR64__(a8, a7);
  v21 = a9;
  v22 = a11;
  v23 = a12;
  v24 = a13;
  v15 = a5;
  v16 = a4;
  -[RCPSyntheticEventStream _currentMachTime](self, "_currentMachTime", v20, *(_QWORD *)&v21, 0, *(_QWORD *)&v22, *(_QWORD *)&v23, *(_QWORD *)&v24);
  GenericGestureEvent = (const void *)IOHIDEventCreateGenericGestureEvent();
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v20, 48);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCPSyntheticEventStream _currentMachTime](self, "_currentMachTime");
  objc_msgSend(v16, "unsignedIntValue");

  objc_msgSend(v15, "unsignedIntValue");
  v19 = objc_retainAutorelease(v18);
  objc_msgSend(v19, "bytes");
  objc_msgSend(v19, "length");
  IOHIDEventCreateVendorDefinedEvent();
  IOHIDEventAppendEvent();
  IOHIDEventSetPhase();
  -[RCPSyntheticEventStream _addIOHIDEventToProcessingBuffer:](self, "_addIOHIDEventToProcessingBuffer:", GenericGestureEvent);
  CFRelease(GenericGestureEvent);

}

- (void)squeeze
{
  -[RCPSyntheticEventStream _squeezeWithPhase:withPage:withUsage:withVersion:withStage:withTransition:withNextThreshold:withPressedThreshold:withReleasedThreshold:withNormalizedForce:withNormalizedForceVelocity:](self, "_squeezeWithPhase:withPage:withUsage:withVersion:withStage:withTransition:withNextThreshold:withPressedThreshold:withReleasedThreshold:withNormalizedForce:withNormalizedForceVelocity:", 1, &unk_1E4FCCA20, &unk_1E4FCCA38, 0, 1, 1, 1.0, 5.0, 4.0, 5.01, 4.5);
  -[RCPSyntheticEventStream _squeezeWithPhase:withPage:withUsage:withVersion:withStage:withTransition:withNextThreshold:withPressedThreshold:withReleasedThreshold:withNormalizedForce:withNormalizedForceVelocity:](self, "_squeezeWithPhase:withPage:withUsage:withVersion:withStage:withTransition:withNextThreshold:withPressedThreshold:withReleasedThreshold:withNormalizedForce:withNormalizedForceVelocity:", 2, &unk_1E4FCCA20, &unk_1E4FCCA38, 0, 1, 0, 1.0, 5.0, 5.0, 0.8, 4.5);
  -[RCPSyntheticEventStream _squeezeWithPhase:withPage:withUsage:withVersion:withStage:withTransition:withNextThreshold:withPressedThreshold:withReleasedThreshold:withNormalizedForce:withNormalizedForceVelocity:](self, "_squeezeWithPhase:withPage:withUsage:withVersion:withStage:withTransition:withNextThreshold:withPressedThreshold:withReleasedThreshold:withNormalizedForce:withNormalizedForceVelocity:", 4, &unk_1E4FCCA20, &unk_1E4FCCA38, 0, 1, 2, 1.0, 5.0, 4.0, 3.99, 4.5);
}

- (void)squeezeAtLocation:(CGPoint)a3
{
  CGPoint v4;

  v4 = a3;
  -[RCPSyntheticEventStream _hoverAtPoints:touchCount:pressure:radius:edgeMaskOptions:withEventType:withZPosition:withAzimuthAngle:withRollAngle:withAltitudeAngle:](self, "_hoverAtPoints:touchCount:pressure:radius:edgeMaskOptions:withEventType:withZPosition:withAzimuthAngle:withRollAngle:withAltitudeAngle:", &v4, 1, 0, 9, 0.0, 0.0, 5.0, 0.0, 0.0, 0.785398163);
  -[RCPSyntheticEventStream squeeze](self, "squeeze");
}

- (void)_touchSensitiveButtonEventWithPhase:(unsigned __int16)a3 withPage:(id)a4 withUsage:(id)a5 withStage:(unsigned int)a6 withTransition:(unsigned int)a7 withNormalizedForce:(double)a8 withNormalizedForceVelocity:(double)a9 withNormalizedPositionX:(double)a10 withNormalizedPositionDeltaX:(double)a11 withNormalizedPositionY:(double)a12 withNormalizedPositionDeltaY:(double)a13 withMajorRadius:(double)a14 withMinorRadius:(double)a15 withMask:(unsigned int)a16 withTouch:(int)a17 withNextThreshold:(double)a18 withPressedThreshold:(double)a19 withReleasedThreshold:(double)a20
{
  id v22;
  id v23;
  const void *TouchSensitiveButtonEventWithRadius;

  v22 = a5;
  v23 = a4;
  -[RCPSyntheticEventStream _currentMachTime](self, "_currentMachTime");
  objc_msgSend(v22, "unsignedIntValue");

  objc_msgSend(v23, "unsignedIntValue");
  TouchSensitiveButtonEventWithRadius = (const void *)IOHIDEventCreateTouchSensitiveButtonEventWithRadius();
  -[RCPSyntheticEventStream _currentMachTime](self, "_currentMachTime");
  IOHIDEventCreateForceStageEvent();
  IOHIDEventAppendEvent();
  IOHIDEventSetPhase();
  -[RCPSyntheticEventStream _addIOHIDEventToProcessingBuffer:](self, "_addIOHIDEventToProcessingBuffer:", TouchSensitiveButtonEventWithRadius);
  CFRelease(TouchSensitiveButtonEventWithRadius);
}

- (void)touchSensitiveButtonClickWithPage:(id)a3 withUsage:(id)a4 withTouch:(int)a5 withNormalizedPositionY:(double)a6 withNormalizedPositionDeltaY:(double)a7
{
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v12 = a4;
  v15 = a3;
  LODWORD(v13) = a5;
  -[RCPSyntheticEventStream _touchSensitiveButtonEventWithPhase:withPage:withUsage:withStage:withTransition:withNormalizedForce:withNormalizedForceVelocity:withNormalizedPositionX:withNormalizedPositionDeltaX:withNormalizedPositionY:withNormalizedPositionDeltaY:withMajorRadius:withMinorRadius:withMask:withTouch:withNextThreshold:withPressedThreshold:withReleasedThreshold:](self, "_touchSensitiveButtonEventWithPhase:withPage:withUsage:withStage:withTransition:withNormalizedForce:withNormalizedForceVelocity:withNormalizedPositionX:withNormalizedPositionDeltaX:withNormalizedPositionY:withNormalizedPositionDeltaY:withMajorRadius:withMinorRadius:withMask:withTouch:withNextThreshold:withPressedThreshold:withReleasedThreshold:", 1, v15, v12, 4, 1, 8, 0.002, 0.0, NAN, NAN, a6, a7, 0.0, 0.0, v13,
    0x7FF8000000000000,
    0x7FF8000000000000,
    0x7FF8000000000000);
  LODWORD(v14) = a5;
  -[RCPSyntheticEventStream _touchSensitiveButtonEventWithPhase:withPage:withUsage:withStage:withTransition:withNormalizedForce:withNormalizedForceVelocity:withNormalizedPositionX:withNormalizedPositionDeltaX:withNormalizedPositionY:withNormalizedPositionDeltaY:withMajorRadius:withMinorRadius:withMask:withTouch:withNextThreshold:withPressedThreshold:withReleasedThreshold:](self, "_touchSensitiveButtonEventWithPhase:withPage:withUsage:withStage:withTransition:withNormalizedForce:withNormalizedForceVelocity:withNormalizedPositionX:withNormalizedPositionDeltaX:withNormalizedPositionY:withNormalizedPositionDeltaY:withMajorRadius:withMinorRadius:withMask:withTouch:withNextThreshold:withPressedThreshold:withReleasedThreshold:", 4, v15, v12, 4, 2, 8, 0.002, 0.0, NAN, NAN, a6, a7, 0.0, 0.0, v14,
    0x7FF8000000000000,
    0x7FF8000000000000,
    0x7FF8000000000000);

}

- (void)touchSensitiveButtonHoldWithPage:(id)a3 withUsage:(id)a4 withTouch:(int)a5 withNormalizedPositionY:(double)a6 withNormalizedPositionDeltaY:(double)a7
{
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v12 = a4;
  v15 = a3;
  LODWORD(v13) = a5;
  -[RCPSyntheticEventStream _touchSensitiveButtonEventWithPhase:withPage:withUsage:withStage:withTransition:withNormalizedForce:withNormalizedForceVelocity:withNormalizedPositionX:withNormalizedPositionDeltaX:withNormalizedPositionY:withNormalizedPositionDeltaY:withMajorRadius:withMinorRadius:withMask:withTouch:withNextThreshold:withPressedThreshold:withReleasedThreshold:](self, "_touchSensitiveButtonEventWithPhase:withPage:withUsage:withStage:withTransition:withNormalizedForce:withNormalizedForceVelocity:withNormalizedPositionX:withNormalizedPositionDeltaX:withNormalizedPositionY:withNormalizedPositionDeltaY:withMajorRadius:withMinorRadius:withMask:withTouch:withNextThreshold:withPressedThreshold:withReleasedThreshold:", 1, v15, v12, 4, 1, 8, 0.002, 0.0, NAN, NAN, a6, a7, 0.0, 0.0, v13,
    0x7FF8000000000000,
    0x7FF8000000000000,
    0x7FF8000000000000);
  LODWORD(v14) = a5;
  -[RCPSyntheticEventStream _touchSensitiveButtonEventWithPhase:withPage:withUsage:withStage:withTransition:withNormalizedForce:withNormalizedForceVelocity:withNormalizedPositionX:withNormalizedPositionDeltaX:withNormalizedPositionY:withNormalizedPositionDeltaY:withMajorRadius:withMinorRadius:withMask:withTouch:withNextThreshold:withPressedThreshold:withReleasedThreshold:](self, "_touchSensitiveButtonEventWithPhase:withPage:withUsage:withStage:withTransition:withNormalizedForce:withNormalizedForceVelocity:withNormalizedPositionX:withNormalizedPositionDeltaX:withNormalizedPositionY:withNormalizedPositionDeltaY:withMajorRadius:withMinorRadius:withMask:withTouch:withNextThreshold:withPressedThreshold:withReleasedThreshold:", 2, v15, v12, 4, 0, 8, 0.002, 0.0, NAN, NAN, a6, a7, 0.0, 0.0, v14,
    0x7FF8000000000000,
    0x7FF8000000000000,
    0x7FF8000000000000);

}

- (void)touchSensitiveButtonHoldWithDuration:(double)a3 withPage:(id)a4 withUsage:(id)a5 withTouch:(int)a6 withNormalizedPositionY:(double)a7 withNormalizedPositionDeltaY:(double)a8
{
  -[RCPSyntheticEventStream touchSensitiveButtonHoldWithPage:withUsage:withTouch:withNormalizedPositionY:withNormalizedPositionDeltaY:](self, "touchSensitiveButtonHoldWithPage:withUsage:withTouch:withNormalizedPositionY:withNormalizedPositionDeltaY:", a4, a5, *(_QWORD *)&a6, a7, a8);
  -[RCPSyntheticEventStream advanceTime:](self, "advanceTime:", a3);
}

- (void)touchSensitiveButtonReleaseHoldWithPage:(id)a3 withUsage:(id)a4 withTouch:(int)a5 withNormalizedPositionY:(double)a6 withNormalizedPositionDeltaY:(double)a7
{
  id v12;
  uint64_t v13;
  id v14;

  v12 = a4;
  v14 = a3;
  LODWORD(v13) = a5;
  -[RCPSyntheticEventStream _touchSensitiveButtonEventWithPhase:withPage:withUsage:withStage:withTransition:withNormalizedForce:withNormalizedForceVelocity:withNormalizedPositionX:withNormalizedPositionDeltaX:withNormalizedPositionY:withNormalizedPositionDeltaY:withMajorRadius:withMinorRadius:withMask:withTouch:withNextThreshold:withPressedThreshold:withReleasedThreshold:](self, "_touchSensitiveButtonEventWithPhase:withPage:withUsage:withStage:withTransition:withNormalizedForce:withNormalizedForceVelocity:withNormalizedPositionX:withNormalizedPositionDeltaX:withNormalizedPositionY:withNormalizedPositionDeltaY:withMajorRadius:withMinorRadius:withMask:withTouch:withNextThreshold:withPressedThreshold:withReleasedThreshold:", 2, v14, v12, 4, 2, 4, 0.002, 0.0, NAN, NAN, a6, a7, 0.0, 0.0, v13,
    0x7FF8000000000000,
    0x7FF8000000000000,
    0x7FF8000000000000);
  -[RCPSyntheticEventStream touchSensitiveButtonLiftWithPage:withUsage:](self, "touchSensitiveButtonLiftWithPage:withUsage:", v14, v12);

}

- (void)touchSensitiveButtonIntermediatePressWithPage:(id)a3 withUsage:(id)a4 withTouch:(int)a5 withNormalizedPositionY:(double)a6 withNormalizedPositionDeltaY:(double)a7
{
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  v12 = a4;
  v16 = a3;
  LODWORD(v13) = a5;
  -[RCPSyntheticEventStream _touchSensitiveButtonEventWithPhase:withPage:withUsage:withStage:withTransition:withNormalizedForce:withNormalizedForceVelocity:withNormalizedPositionX:withNormalizedPositionDeltaX:withNormalizedPositionY:withNormalizedPositionDeltaY:withMajorRadius:withMinorRadius:withMask:withTouch:withNextThreshold:withPressedThreshold:withReleasedThreshold:](self, "_touchSensitiveButtonEventWithPhase:withPage:withUsage:withStage:withTransition:withNormalizedForce:withNormalizedForceVelocity:withNormalizedPositionX:withNormalizedPositionDeltaX:withNormalizedPositionY:withNormalizedPositionDeltaY:withMajorRadius:withMinorRadius:withMask:withTouch:withNextThreshold:withPressedThreshold:withReleasedThreshold:", 1, v16, v12, 1, 1, 0, 0.009602, 0.0, NAN, NAN, a6, a7, 3.3405, 0.0, v13,
    0x3FC0000000000000,
    0x3FA999999999999ALL,
    0x3FA999999999999ALL);
  LODWORD(v14) = a5;
  -[RCPSyntheticEventStream _touchSensitiveButtonEventWithPhase:withPage:withUsage:withStage:withTransition:withNormalizedForce:withNormalizedForceVelocity:withNormalizedPositionX:withNormalizedPositionDeltaX:withNormalizedPositionY:withNormalizedPositionDeltaY:withMajorRadius:withMinorRadius:withMask:withTouch:withNextThreshold:withPressedThreshold:withReleasedThreshold:](self, "_touchSensitiveButtonEventWithPhase:withPage:withUsage:withStage:withTransition:withNormalizedForce:withNormalizedForceVelocity:withNormalizedPositionX:withNormalizedPositionDeltaX:withNormalizedPositionY:withNormalizedPositionDeltaY:withMajorRadius:withMinorRadius:withMask:withTouch:withNextThreshold:withPressedThreshold:withReleasedThreshold:", 2, v16, v12, 2, 1, 0, 0.12584, 0.0, NAN, NAN, a6, a7, 10.314577, 0.0, v14,
    0x3FC03C4B09E98DCELL,
    0x3FC0000000000000,
    0x3FB999999999999ALL);
  LODWORD(v15) = a5;
  -[RCPSyntheticEventStream _touchSensitiveButtonEventWithPhase:withPage:withUsage:withStage:withTransition:withNormalizedForce:withNormalizedForceVelocity:withNormalizedPositionX:withNormalizedPositionDeltaX:withNormalizedPositionY:withNormalizedPositionDeltaY:withMajorRadius:withMinorRadius:withMask:withTouch:withNextThreshold:withPressedThreshold:withReleasedThreshold:](self, "_touchSensitiveButtonEventWithPhase:withPage:withUsage:withStage:withTransition:withNormalizedForce:withNormalizedForceVelocity:withNormalizedPositionX:withNormalizedPositionDeltaX:withNormalizedPositionY:withNormalizedPositionDeltaY:withMajorRadius:withMinorRadius:withMask:withTouch:withNextThreshold:withPressedThreshold:withReleasedThreshold:", 2, v16, v12, 3, 1, 0, 0.169056, 0.0, NAN, NAN, a6, a7, 9.957315, 0.0, v15,
    0x7FF8000000000000,
    0x3FC0000000000000,
    0x3FB999999999999ALL);

}

- (void)touchSensitiveButtonIntermediatePressWithDuration:(double)a3 withPage:(id)a4 withUsage:(id)a5 withTouch:(int)a6 withNormalizedPositionY:(double)a7 withNormalizedPositionDeltaY:(double)a8
{
  uint64_t v10;
  id v14;
  id v15;

  v10 = *(_QWORD *)&a6;
  v14 = a5;
  v15 = a4;
  -[RCPSyntheticEventStream touchSensitiveButtonIntermediatePressWithPage:withUsage:withTouch:withNormalizedPositionY:withNormalizedPositionDeltaY:](self, "touchSensitiveButtonIntermediatePressWithPage:withUsage:withTouch:withNormalizedPositionY:withNormalizedPositionDeltaY:", v15, v14, v10, a7, a8);
  -[RCPSyntheticEventStream advanceTime:](self, "advanceTime:", a3);
  -[RCPSyntheticEventStream touchSensitiveButtonLiftWithPage:withUsage:](self, "touchSensitiveButtonLiftWithPage:withUsage:", v15, v14);

}

- (void)touchSensitiveButtonLiftWithPage:(id)a3 withUsage:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v6 = a4;
  v10 = a3;
  LODWORD(v7) = 0;
  -[RCPSyntheticEventStream _touchSensitiveButtonEventWithPhase:withPage:withUsage:withStage:withTransition:withNormalizedForce:withNormalizedForceVelocity:withNormalizedPositionX:withNormalizedPositionDeltaX:withNormalizedPositionY:withNormalizedPositionDeltaY:withMajorRadius:withMinorRadius:withMask:withTouch:withNextThreshold:withPressedThreshold:withReleasedThreshold:](self, "_touchSensitiveButtonEventWithPhase:withPage:withUsage:withStage:withTransition:withNormalizedForce:withNormalizedForceVelocity:withNormalizedPositionX:withNormalizedPositionDeltaX:withNormalizedPositionY:withNormalizedPositionDeltaY:withMajorRadius:withMinorRadius:withMask:withTouch:withNextThreshold:withPressedThreshold:withReleasedThreshold:", 2, v10, v6, 3, 2, 0, 0.002767, 0.0, NAN, NAN, 0.0, 0.0, 0.0, 0.0, v7,
    0x7FF8000000000000,
    0x3FC0000000000000,
    0x3FB999999999999ALL);
  LODWORD(v8) = 0;
  -[RCPSyntheticEventStream _touchSensitiveButtonEventWithPhase:withPage:withUsage:withStage:withTransition:withNormalizedForce:withNormalizedForceVelocity:withNormalizedPositionX:withNormalizedPositionDeltaX:withNormalizedPositionY:withNormalizedPositionDeltaY:withMajorRadius:withMinorRadius:withMask:withTouch:withNextThreshold:withPressedThreshold:withReleasedThreshold:](self, "_touchSensitiveButtonEventWithPhase:withPage:withUsage:withStage:withTransition:withNormalizedForce:withNormalizedForceVelocity:withNormalizedPositionX:withNormalizedPositionDeltaX:withNormalizedPositionY:withNormalizedPositionDeltaY:withMajorRadius:withMinorRadius:withMask:withTouch:withNextThreshold:withPressedThreshold:withReleasedThreshold:", 2, v10, v6, 2, 2, 0, 0.002767, 0.0, NAN, NAN, 0.0, 0.0, 0.0, 0.0, v8,
    0x3F6EDBF8B9BAA151,
    0x3FC0000000000000,
    0x3FB999999999999ALL);
  LODWORD(v9) = 0;
  -[RCPSyntheticEventStream _touchSensitiveButtonEventWithPhase:withPage:withUsage:withStage:withTransition:withNormalizedForce:withNormalizedForceVelocity:withNormalizedPositionX:withNormalizedPositionDeltaX:withNormalizedPositionY:withNormalizedPositionDeltaY:withMajorRadius:withMinorRadius:withMask:withTouch:withNextThreshold:withPressedThreshold:withReleasedThreshold:](self, "_touchSensitiveButtonEventWithPhase:withPage:withUsage:withStage:withTransition:withNormalizedForce:withNormalizedForceVelocity:withNormalizedPositionX:withNormalizedPositionDeltaX:withNormalizedPositionY:withNormalizedPositionDeltaY:withMajorRadius:withMinorRadius:withMask:withTouch:withNextThreshold:withPressedThreshold:withReleasedThreshold:", 4, v10, v6, 1, 2, 0, 0.002767, 0.0, NAN, NAN, 0.0, 0.0, 0.0, 0.0, v9,
    0x3FC0000000000000,
    0x3FA999999999999ALL,
    0x3FA999999999999ALL);

}

- (void)touchSensitiveButtonEngagedWithPage:(id)a3 withUsage:(id)a4 withTouch:(int)a5 withNormalizedPositionY:(double)a6 withNormalizedPositionDeltaY:(double)a7
{
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  v12 = a4;
  v16 = a3;
  LODWORD(v13) = a5;
  -[RCPSyntheticEventStream _touchSensitiveButtonEventWithPhase:withPage:withUsage:withStage:withTransition:withNormalizedForce:withNormalizedForceVelocity:withNormalizedPositionX:withNormalizedPositionDeltaX:withNormalizedPositionY:withNormalizedPositionDeltaY:withMajorRadius:withMinorRadius:withMask:withTouch:withNextThreshold:withPressedThreshold:withReleasedThreshold:](self, "_touchSensitiveButtonEventWithPhase:withPage:withUsage:withStage:withTransition:withNormalizedForce:withNormalizedForceVelocity:withNormalizedPositionX:withNormalizedPositionDeltaX:withNormalizedPositionY:withNormalizedPositionDeltaY:withMajorRadius:withMinorRadius:withMask:withTouch:withNextThreshold:withPressedThreshold:withReleasedThreshold:", 1, v16, v12, 1, 1, 1, 0.005953, 0.0, NAN, NAN, a6, a7, 3.964151, 0.0, v13,
    0x3FC0000000000000,
    0x3FA999999999999ALL,
    0x3FA999999999999ALL);
  LODWORD(v14) = a5;
  -[RCPSyntheticEventStream _touchSensitiveButtonEventWithPhase:withPage:withUsage:withStage:withTransition:withNormalizedForce:withNormalizedForceVelocity:withNormalizedPositionX:withNormalizedPositionDeltaX:withNormalizedPositionY:withNormalizedPositionDeltaY:withMajorRadius:withMinorRadius:withMask:withTouch:withNextThreshold:withPressedThreshold:withReleasedThreshold:](self, "_touchSensitiveButtonEventWithPhase:withPage:withUsage:withStage:withTransition:withNormalizedForce:withNormalizedForceVelocity:withNormalizedPositionX:withNormalizedPositionDeltaX:withNormalizedPositionY:withNormalizedPositionDeltaY:withMajorRadius:withMinorRadius:withMask:withTouch:withNextThreshold:withPressedThreshold:withReleasedThreshold:", 2, v16, v12, 1, 0, 1, 0.023871, 0.0, NAN, NAN, a6, a7, 1.715379, 0.0, v14,
    0x3FC0000000000000,
    0x3FA999999999999ALL,
    0x3FA999999999999ALL);
  LODWORD(v15) = a5;
  -[RCPSyntheticEventStream _touchSensitiveButtonEventWithPhase:withPage:withUsage:withStage:withTransition:withNormalizedForce:withNormalizedForceVelocity:withNormalizedPositionX:withNormalizedPositionDeltaX:withNormalizedPositionY:withNormalizedPositionDeltaY:withMajorRadius:withMinorRadius:withMask:withTouch:withNextThreshold:withPressedThreshold:withReleasedThreshold:](self, "_touchSensitiveButtonEventWithPhase:withPage:withUsage:withStage:withTransition:withNormalizedForce:withNormalizedForceVelocity:withNormalizedPositionX:withNormalizedPositionDeltaX:withNormalizedPositionY:withNormalizedPositionDeltaY:withMajorRadius:withMinorRadius:withMask:withTouch:withNextThreshold:withPressedThreshold:withReleasedThreshold:", 4, v16, v12, 1, 2, 1, 0.006992, 0.0, NAN, NAN, a6, a7, 0.0, 0.0, v15,
    0x3FC0000000000000,
    0x3FA999999999999ALL,
    0x3FA999999999999ALL);

}

- (void)touchSensitiveButtonEngagedWithDuration:(double)a3 withPage:(id)a4 withUsage:(id)a5 withTouch:(int)a6 withNormalizedPositionY:(double)a7 withNormalizedPositionDeltaY:(double)a8
{
  uint64_t v10;
  id v14;
  id v15;

  v10 = *(_QWORD *)&a6;
  v14 = a5;
  v15 = a4;
  -[RCPSyntheticEventStream advanceTime:](self, "advanceTime:", a3);
  -[RCPSyntheticEventStream touchSensitiveButtonEngagedWithPage:withUsage:withTouch:withNormalizedPositionY:withNormalizedPositionDeltaY:](self, "touchSensitiveButtonEngagedWithPage:withUsage:withTouch:withNormalizedPositionY:withNormalizedPositionDeltaY:", v15, v14, v10, a7, a8);

}

- (void)touchSensitiveButtonEngagedWithLiftWithDuration:(double)a3 withPage:(id)a4 withUsage:(id)a5 withTouch:(int)a6 withNormalizedPositionY:(double)a7 withNormalizedPositionDeltaY:(double)a8
{
  uint64_t v10;
  id v14;
  id v15;

  v10 = *(_QWORD *)&a6;
  v14 = a5;
  v15 = a4;
  -[RCPSyntheticEventStream advanceTime:](self, "advanceTime:", a3);
  -[RCPSyntheticEventStream touchSensitiveButtonEngagedWithPage:withUsage:withTouch:withNormalizedPositionY:withNormalizedPositionDeltaY:](self, "touchSensitiveButtonEngagedWithPage:withUsage:withTouch:withNormalizedPositionY:withNormalizedPositionDeltaY:", v15, v14, v10, a7, a8);
  -[RCPSyntheticEventStream touchSensitiveButtonLiftWithPage:withUsage:](self, "touchSensitiveButtonLiftWithPage:withUsage:", v15, v14);

}

- (void)vendorEventWithPage:(id)a3 withUsage:(id)a4 withVersion:(unsigned __int8)a5
{
  -[RCPSyntheticEventStream vendorEventWithPage:withUsage:withVersion:withData:](self, "vendorEventWithPage:withUsage:withVersion:withData:", a3, a4, a5, 0);
}

- (void)vendorEventWithPage:(id)a3 withUsage:(id)a4 withVersion:(unsigned __int8)a5 withData:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  const void *VendorDefinedEvent;

  v9 = a6;
  v10 = a4;
  v11 = a3;
  -[RCPSyntheticEventStream _currentMachTime](self, "_currentMachTime");
  objc_msgSend(v11, "unsignedIntValue");

  objc_msgSend(v10, "unsignedIntValue");
  v12 = objc_retainAutorelease(v9);
  objc_msgSend(v12, "bytes");
  objc_msgSend(v12, "length");

  VendorDefinedEvent = (const void *)IOHIDEventCreateVendorDefinedEvent();
  -[RCPSyntheticEventStream _addIOHIDEventToProcessingBuffer:](self, "_addIOHIDEventToProcessingBuffer:", VendorDefinedEvent);
  CFRelease(VendorDefinedEvent);
}

- (int64_t)touchFrequency
{
  return self->_touchFrequency;
}

- (void)setTouchFrequency:(int64_t)a3
{
  self->_touchFrequency = a3;
}

- (void)setTouchCurveFunction:(id)a3
{
  objc_storeStrong((id *)&self->_touchCurveFunction, a3);
}

- (void)setPointerFrequency:(double)a3
{
  self->_pointerFrequency = a3;
}

- (BOOL)scalePointerPhaseScrollToPixels
{
  return self->_scalePointerPhaseScrollToPixels;
}

- (void)setScalePointerPhaseScrollToPixels:(BOOL)a3
{
  self->_scalePointerPhaseScrollToPixels = a3;
}

- (CGSize)screenSize
{
  double width;
  double height;
  CGSize result;

  width = self->_screenSize.width;
  height = self->_screenSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setGsScreenPointSize:(CGSize)a3
{
  self->_gsScreenPointSize = a3;
}

- (void)setGsScreenScaleFactor:(double)a3
{
  self->_gsScreenScaleFactor = a3;
}

- (unsigned)transducerType
{
  return self->_transducerType;
}

- (void)setTransducerType:(unsigned int)a3
{
  self->_transducerType = a3;
}

- (void)_normalizePoint:(uint64_t)a1 .cold.1(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  __int16 v5;
  const __CFString *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[RCPSyntheticEventStream _normalizePoint:]");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 138544130;
  v4 = v2;
  v5 = 2114;
  v6 = CFSTR("RCPSyntheticEventStream.m");
  v7 = 1024;
  v8 = 1980;
  v9 = 2114;
  v10 = a1;
  _os_log_error_impl(&dword_1A5E84000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", (uint8_t *)&v3, 0x26u);

}

@end
