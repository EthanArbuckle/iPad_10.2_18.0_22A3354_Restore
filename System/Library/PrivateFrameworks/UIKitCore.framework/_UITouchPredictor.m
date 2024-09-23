@implementation _UITouchPredictor

- (_UITouchPredictor)init
{
  _UITouchPredictor *v2;
  uint64_t v3;
  NSMutableArray *predictions;
  _UIValuePredictor *v5;
  _UIValuePredictor *xValuePredictor;
  _UIValuePredictor *v7;
  _UIValuePredictor *yValuePredictor;
  _UIValuePredictor *v9;
  _UIValuePredictor *angleValuePredictor;
  _UIValuePredictor *v11;
  _UIValuePredictor *azimuthValuePredictor;
  _UIValuePredictor *v13;
  _UIValuePredictor *forceValuePredictor;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)_UITouchPredictor;
  v2 = -[_UITouchPredictor init](&v16, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    predictions = v2->_predictions;
    v2->_predictions = (NSMutableArray *)v3;

    v2->_predictionsValid = 0;
    v2->_numPredictionsBufferCount = 0;
    v2->_averageTouchInterval = 0.0;
    v2->_lastTouchTimestamp = 0.0;
    v5 = -[_UIValuePredictor initWithNumPredictions:numDerivatives:]([_UIValuePredictor alloc], "initWithNumPredictions:numDerivatives:", 4, 4);
    xValuePredictor = v2->_xValuePredictor;
    v2->_xValuePredictor = v5;

    -[_UIValuePredictor setMinHistoricalAccuracyThreshold:](v2->_xValuePredictor, "setMinHistoricalAccuracyThreshold:", 0.5);
    -[_UIValuePredictor setMaxHistoricalAccuracyThreshold:](v2->_xValuePredictor, "setMaxHistoricalAccuracyThreshold:", 2.0);
    -[_UIValuePredictor setDerivativeStabilityThreshold:](v2->_xValuePredictor, "setDerivativeStabilityThreshold:", 1.5);
    -[_UIValuePredictor setMinVelocityThreshold:](v2->_xValuePredictor, "setMinVelocityThreshold:", 0.5);
    -[_UIValuePredictor setMaxVelocityThreshold:](v2->_xValuePredictor, "setMaxVelocityThreshold:", 1.5);
    v7 = -[_UIValuePredictor initWithNumPredictions:numDerivatives:]([_UIValuePredictor alloc], "initWithNumPredictions:numDerivatives:", 4, 4);
    yValuePredictor = v2->_yValuePredictor;
    v2->_yValuePredictor = v7;

    -[_UIValuePredictor setMinHistoricalAccuracyThreshold:](v2->_yValuePredictor, "setMinHistoricalAccuracyThreshold:", 0.5);
    -[_UIValuePredictor setMaxHistoricalAccuracyThreshold:](v2->_yValuePredictor, "setMaxHistoricalAccuracyThreshold:", 2.0);
    -[_UIValuePredictor setDerivativeStabilityThreshold:](v2->_yValuePredictor, "setDerivativeStabilityThreshold:", 1.5);
    -[_UIValuePredictor setMinVelocityThreshold:](v2->_yValuePredictor, "setMinVelocityThreshold:", 0.5);
    -[_UIValuePredictor setMaxVelocityThreshold:](v2->_yValuePredictor, "setMaxVelocityThreshold:", 1.5);
    v9 = -[_UIValuePredictor initWithNumPredictions:numDerivatives:]([_UIValuePredictor alloc], "initWithNumPredictions:numDerivatives:", 4, 4);
    angleValuePredictor = v2->_angleValuePredictor;
    v2->_angleValuePredictor = v9;

    -[_UIValuePredictor setMinConstraint:](v2->_angleValuePredictor, "setMinConstraint:", 0.0);
    -[_UIValuePredictor setMaxConstraint:](v2->_angleValuePredictor, "setMaxConstraint:", 1.57079633);
    v11 = -[_UIValuePredictor initWithNumPredictions:numDerivatives:]([_UIValuePredictor alloc], "initWithNumPredictions:numDerivatives:", 4, 4);
    azimuthValuePredictor = v2->_azimuthValuePredictor;
    v2->_azimuthValuePredictor = v11;

    -[_UIValuePredictor setMinConstraint:](v2->_azimuthValuePredictor, "setMinConstraint:", 0.0);
    -[_UIValuePredictor setMaxConstraint:](v2->_azimuthValuePredictor, "setMaxConstraint:", 6.28318531);
    -[_UIValuePredictor setWrapConstraint:](v2->_azimuthValuePredictor, "setWrapConstraint:", 1);
    v13 = -[_UIValuePredictor initWithNumPredictions:numDerivatives:]([_UIValuePredictor alloc], "initWithNumPredictions:numDerivatives:", 4, 4);
    forceValuePredictor = v2->_forceValuePredictor;
    v2->_forceValuePredictor = v13;

    -[_UIValuePredictor setMinConstraint:](v2->_forceValuePredictor, "setMinConstraint:", 0.0);
    -[_UIValuePredictor setMaxConstraint:](v2->_forceValuePredictor, "setMaxConstraint:", 500.0);
  }
  return v2;
}

- (_UITouchPredictor)initWithTouchPredictor:(id)a3
{
  id v4;
  _UITouchPredictor *v5;
  uint64_t v6;
  NSMutableArray *predictions;
  void *v8;
  uint64_t v9;
  _UIValuePredictor *xValuePredictor;
  void *v11;
  uint64_t v12;
  _UIValuePredictor *yValuePredictor;
  void *v14;
  uint64_t v15;
  _UIValuePredictor *angleValuePredictor;
  void *v17;
  uint64_t v18;
  _UIValuePredictor *azimuthValuePredictor;
  void *v20;
  uint64_t v21;
  _UIValuePredictor *forceValuePredictor;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)_UITouchPredictor;
  v5 = -[_UITouchPredictor init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    predictions = v5->_predictions;
    v5->_predictions = (NSMutableArray *)v6;

    v5->_predictionsValid = 0;
    v5->_numPredictionsBufferCount = 0;
    v5->_averageTouchInterval = 0.0;
    v5->_lastTouchTimestamp = 0.0;
    objc_msgSend(v4, "_xValuePredictor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");
    xValuePredictor = v5->_xValuePredictor;
    v5->_xValuePredictor = (_UIValuePredictor *)v9;

    objc_msgSend(v4, "_yValuePredictor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    yValuePredictor = v5->_yValuePredictor;
    v5->_yValuePredictor = (_UIValuePredictor *)v12;

    objc_msgSend(v4, "_angleValuePredictor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "copy");
    angleValuePredictor = v5->_angleValuePredictor;
    v5->_angleValuePredictor = (_UIValuePredictor *)v15;

    objc_msgSend(v4, "_azimuthValuePredictor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "copy");
    azimuthValuePredictor = v5->_azimuthValuePredictor;
    v5->_azimuthValuePredictor = (_UIValuePredictor *)v18;

    objc_msgSend(v4, "_forceValuePredictor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "copy");
    forceValuePredictor = v5->_forceValuePredictor;
    v5->_forceValuePredictor = (_UIValuePredictor *)v21;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTouchPredictor:", self);
}

- (void)addTouch:(id)a3
{
  double v4;
  double v5;
  double averageTouchInterval;
  double v7;
  double v8;
  double v9;
  id v10;

  v10 = a3;
  -[NSMutableArray removeAllObjects](self->_predictions, "removeAllObjects");
  self->_predictionsValid = 0;
  if (self->_lastTouchTimestamp == 0.0)
  {
    v8 = 1.0;
  }
  else
  {
    objc_msgSend(v10, "timestamp");
    v5 = v4 - self->_lastTouchTimestamp;
    if (self->_averageTouchInterval == 0.0)
      averageTouchInterval = v5;
    else
      averageTouchInterval = self->_averageTouchInterval;
    v7 = (v5 + averageTouchInterval) * 0.5;
    self->_averageTouchInterval = v7;
    v8 = v7 / v5;
  }
  objc_msgSend(v10, "timestamp");
  self->_lastTouchTimestamp = v9;
  -[_UITouchPredictor _updatePredictionsForTouch:weight:](self, "_updatePredictionsForTouch:weight:", v10, v8);

}

- (unint64_t)_numPredictionsAtIndex:(unint64_t)a3 hardLimit:(unint64_t *)a4
{
  double *v7;
  double *v8;
  double *v9;
  double *v10;
  unint64_t v11;
  unint64_t v12;
  double v13;

  -[_UIValuePredictor _predictionsAtIndex:](self->_xValuePredictor, "_predictionsAtIndex:");
  -[_UIValuePredictor _predictionsAtIndex:](self->_yValuePredictor, "_predictionsAtIndex:", a3);
  v7 = -[_UIValuePredictor _confidenceFactorsAtIndex:](self->_xValuePredictor, "_confidenceFactorsAtIndex:", a3);
  v8 = -[_UIValuePredictor _confidenceFactorsAtIndex:](self->_yValuePredictor, "_confidenceFactorsAtIndex:", a3);
  v9 = -[_UIValuePredictor _confidenceFactorsForVelocityAtIndex:](self->_xValuePredictor, "_confidenceFactorsForVelocityAtIndex:", a3);
  v10 = -[_UIValuePredictor _confidenceFactorsForVelocityAtIndex:](self->_yValuePredictor, "_confidenceFactorsForVelocityAtIndex:", a3);
  v11 = 0;
  v12 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v12 = v11;
      if ((v9[v11] + v10[v11]) * 0.5 >= 0.3)
      {
        v13 = (double)(v11 + 1) * 0.75 * 0.25;
        if (v7[v11] >= v13 && v8[v11] >= v13)
          v12 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v12 = v11;
      }
    }
    ++v11;
  }
  while (v11 != 4);
  *a4 = 4;
  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
    return 4;
  else
    return v12;
}

- (unint64_t)_dampenedNumPredictionsAtIndex:(unint64_t)a3
{
  unint64_t v4;
  int64_t numPredictionsBufferCount;
  double *v6;
  uint64_t v7;
  double *numPredictionsBuffer;
  double v9;
  uint64_t v10;
  double v11;
  __int128 v12;
  double v13;
  unint64_t v15;

  v15 = 4;
  v4 = -[_UITouchPredictor _numPredictionsAtIndex:hardLimit:](self, "_numPredictionsAtIndex:hardLimit:", a3, &v15);
  numPredictionsBufferCount = self->_numPredictionsBufferCount;
  if (numPredictionsBufferCount <= 4)
  {
    v6 = (double *)(&self->super.isa + numPredictionsBufferCount);
    v7 = numPredictionsBufferCount + 1;
    self->_numPredictionsBufferCount = v7;
    v6[10] = (double)v4;
    if (v7)
      goto LABEL_3;
LABEL_7:
    v9 = 0.0;
    goto LABEL_8;
  }
  v12 = *(_OWORD *)&self->_numPredictionsBuffer[3];
  *(_OWORD *)self->_numPredictionsBuffer = *(_OWORD *)&self->_numPredictionsBuffer[1];
  *(_OWORD *)&self->_numPredictionsBuffer[2] = v12;
  self->_numPredictionsBuffer[4] = (double)v4;
  v7 = self->_numPredictionsBufferCount;
  if (!v7)
    goto LABEL_7;
LABEL_3:
  numPredictionsBuffer = self->_numPredictionsBuffer;
  v9 = 0.0;
  v10 = v7;
  do
  {
    v11 = *numPredictionsBuffer++;
    v9 = v9 + v11;
    --v10;
  }
  while (v10);
LABEL_8:
  v13 = round(v9 / (double)v7);
  if (v13 > (double)v15)
    return (unint64_t)(double)v15;
  return (unint64_t)v13;
}

- (id)_predictedTouchesAtIndex:(unint64_t)a3 forTouch:(id)a4
{
  id v6;
  double *v7;
  double *v8;
  double *v9;
  double *v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  double averageTouchInterval;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  NSMutableArray *v29;
  id v31;
  double *v32;

  v6 = a4;
  if (!self->_predictionsValid)
  {
    v32 = -[_UIValuePredictor _predictionsAtIndex:](self->_xValuePredictor, "_predictionsAtIndex:", a3);
    v7 = -[_UIValuePredictor _predictionsAtIndex:](self->_yValuePredictor, "_predictionsAtIndex:", a3);
    v8 = -[_UIValuePredictor _predictionsAtIndex:](self->_angleValuePredictor, "_predictionsAtIndex:", a3);
    v9 = -[_UIValuePredictor _predictionsAtIndex:](self->_azimuthValuePredictor, "_predictionsAtIndex:", a3);
    v10 = -[_UIValuePredictor _predictionsAtIndex:](self->_forceValuePredictor, "_predictionsAtIndex:", a3);
    v31 = v6;
    v11 = v6;
    objc_msgSend(v11, "window");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "contentScaleFactor");
    v14 = v13;

    averageTouchInterval = self->_averageTouchInterval;
    v16 = -[_UITouchPredictor _dampenedNumPredictionsAtIndex:](self, "_dampenedNumPredictionsAtIndex:", a3);
    if (v16 >= 1)
    {
      v17 = 0;
      v18 = v16;
      v19 = (uint64_t)v11;
      while (1)
      {
        v20 = (void *)v19;
        objc_msgSend(v11, "_clone", v31);
        v19 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v19, "_setPreviousTouch:", v20);
        v21 = v32[v17];
        v22 = round(v14 * v21) / v14;
        v23 = v7[v17];
        v24 = round(v14 * v23) / v14;
        if (v19)
        {
          *(_OWORD *)(v19 + 128) = *(_OWORD *)(v19 + 112);
          *(_OWORD *)(v19 + 160) = *(_OWORD *)(v19 + 144);
          *(double *)(v19 + 112) = v22;
          *(double *)(v19 + 120) = v24;
          *(double *)(v19 + 144) = v21;
          *(double *)(v19 + 152) = v23;
        }
        if ((v17 & 0x8000000000000000) == 0)
        {
          -[UITouch _setAltitudeAngle:](v19, v8[v17]);
          if (v19)
          {
            *(double *)(v19 + 368) = v9[v17];
            -[UITouch _computeAzimuthAngleInWindow](v19);
          }
        }
        if (v17 < 0)
          goto LABEL_14;
        v25 = v10[v17];
        if (v19)
          break;
        objc_msgSend(v20, "timestamp", v25);
        objc_msgSend(0, "setTimestamp:", averageTouchInterval + v28);
LABEL_16:
        -[NSMutableArray addObject:](self->_predictions, "addObject:", v19);

        if (++v17 == v18)
          goto LABEL_20;
      }
      v26 = *(double *)(v19 + 224);
      if (v26 < v25)
        v26 = v10[v17];
      *(_QWORD *)(v19 + 176) = *(_QWORD *)(v19 + 216);
      *(double *)(v19 + 216) = v25;
      *(double *)(v19 + 224) = v26;
LABEL_14:
      objc_msgSend(v20, "timestamp");
      objc_msgSend((id)v19, "setTimestamp:", averageTouchInterval + v27);
      if (v19)
        *(_WORD *)(v19 + 236) |= 0x80u;
      goto LABEL_16;
    }
    v19 = (uint64_t)v11;
LABEL_20:
    self->_predictionsValid = 1;

    v6 = v31;
  }
  v29 = self->_predictions;

  return v29;
}

- (id)predictedTouchesForTouch:(id)a3
{
  _UIValuePredictor *xValuePredictor;
  id v5;
  void *v6;

  xValuePredictor = self->_xValuePredictor;
  v5 = a3;
  -[_UITouchPredictor _predictedTouchesAtIndex:forTouch:](self, "_predictedTouchesAtIndex:forTouch:", -[_UIValuePredictor numValues](xValuePredictor, "numValues") - 1, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_xValuePredictor
{
  return self->_xValuePredictor;
}

- (id)_yValuePredictor
{
  return self->_yValuePredictor;
}

- (id)_angleValuePredictor
{
  return self->_angleValuePredictor;
}

- (id)_azimuthValuePredictor
{
  return self->_azimuthValuePredictor;
}

- (id)_forceValuePredictor
{
  return self->_forceValuePredictor;
}

- (id)descriptionFromIndex:(int)a3 toIndex:(int)a4 includeHeader:(BOOL)a5 includeDetailedConfidence:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a6;
  v7 = a5;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIValuePredictor descriptionFromIndex:toIndex:includeHeader:includeDetailedConfidence:](self->_xValuePredictor, "descriptionFromIndex:toIndex:includeHeader:includeDetailedConfidence:", a3, a4, v7, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appendFormat:", CFSTR("X:\n%@"), v12);

  -[_UIValuePredictor descriptionFromIndex:toIndex:includeHeader:includeDetailedConfidence:](self->_yValuePredictor, "descriptionFromIndex:toIndex:includeHeader:includeDetailedConfidence:", a3, a4, v7, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appendFormat:", CFSTR("Y:\n%@"), v13);

  -[_UIValuePredictor descriptionFromIndex:toIndex:includeHeader:includeDetailedConfidence:](self->_angleValuePredictor, "descriptionFromIndex:toIndex:includeHeader:includeDetailedConfidence:", a3, a4, v7, v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appendFormat:", CFSTR("Angle:\n%@"), v14);

  -[_UIValuePredictor descriptionFromIndex:toIndex:includeHeader:includeDetailedConfidence:](self->_azimuthValuePredictor, "descriptionFromIndex:toIndex:includeHeader:includeDetailedConfidence:", a3, a4, v7, v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appendFormat:", CFSTR("Azimuth:\n%@"), v15);

  -[_UIValuePredictor descriptionFromIndex:toIndex:includeHeader:includeDetailedConfidence:](self->_forceValuePredictor, "descriptionFromIndex:toIndex:includeHeader:includeDetailedConfidence:", a3, a4, v7, v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appendFormat:", CFSTR("Force:\n%@"), v16);

  return v11;
}

- (id)description
{
  return -[_UITouchPredictor descriptionFromIndex:toIndex:includeHeader:includeDetailedConfidence:](self, "descriptionFromIndex:toIndex:includeHeader:includeDetailedConfidence:", 0, -[_UIValuePredictor numValues](self->_xValuePredictor, "numValues") + 3, 1, 1);
}

- (void)_updatePredictionsForTouch:(id)a3 weight:(double)a4
{
  double *v6;
  double v7;
  double v8;
  _UIValuePredictor *angleValuePredictor;
  double v10;
  _UIValuePredictor *forceValuePredictor;
  double v12;
  double v13;

  v6 = (double *)a3;
  objc_msgSend(v6, "preciseLocationInView:", 0);
  v8 = v7;
  -[_UIValuePredictor addValue:weight:](self->_xValuePredictor, "addValue:weight:");
  -[_UIValuePredictor addValue:weight:](self->_yValuePredictor, "addValue:weight:", v8, a4);
  angleValuePredictor = self->_angleValuePredictor;
  objc_msgSend(v6, "altitudeAngle");
  -[_UIValuePredictor addValue:weight:](angleValuePredictor, "addValue:weight:");
  if (v6)
    v10 = v6[46];
  else
    v10 = 0.0;
  -[_UIValuePredictor addValue:weight:](self->_azimuthValuePredictor, "addValue:weight:", v10, a4);
  forceValuePredictor = self->_forceValuePredictor;
  objc_msgSend(v6, "_pressure");
  v13 = v12;

  -[_UIValuePredictor addValue:weight:](forceValuePredictor, "addValue:weight:", v13, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_forceValuePredictor, 0);
  objc_storeStrong((id *)&self->_azimuthValuePredictor, 0);
  objc_storeStrong((id *)&self->_angleValuePredictor, 0);
  objc_storeStrong((id *)&self->_yValuePredictor, 0);
  objc_storeStrong((id *)&self->_xValuePredictor, 0);
  objc_storeStrong((id *)&self->_predictions, 0);
}

@end
