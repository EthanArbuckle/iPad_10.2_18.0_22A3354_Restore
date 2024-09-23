@implementation TTKSimpleContinuousPathGenerator

- (TTKSimpleContinuousPathGenerator)initWithParams:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TTKSimpleContinuousPathGenerator;
  return -[TTKDefaultContinuousPathGenerator initWithParams:](&v4, sel_initWithParams_, a3);
}

- (id)generatePathFromInflectionPoints:(id)a3 segmentTiming:(id)a4 keys:(id)a5 string:(id)a6 layout:(id)a7
{
  return -[TTKSimpleContinuousPathGenerator generatePathFromInflectionPoints:timestamp:segmentTiming:keys:string:layout:](self, "generatePathFromInflectionPoints:timestamp:segmentTiming:keys:string:layout:", a3, a4, a5, a6, a7, 0.0);
}

- (id)generatePathFromInflectionPoints:(id)a3 timestamp:(double)a4 segmentTiming:(id)a5 keys:(id)a6 string:(id)a7 layout:(id)a8
{
  return -[TTKSimpleContinuousPathGenerator generatePathFromInflectionPoints:timestamp:duration:segmentTiming:keys:string:layout:](self, "generatePathFromInflectionPoints:timestamp:duration:segmentTiming:keys:string:layout:", a3, a5, a6, a7, a8, a4, -1.0);
}

- (id)generatePathFromInflectionPoints:(id)a3 timestamp:(double)a4 duration:(double)a5 segmentTiming:(id)a6 keys:(id)a7 string:(id)a8 layout:(id)a9
{
  id v13;
  id v14;
  TIContinuousPath *v15;
  double v16;
  double v17;
  unint64_t v18;
  double v19;
  uint64_t v20;
  unint64_t v21;
  void *v22;
  void *v23;
  unint64_t v24;
  void *v25;
  void *v26;
  unint64_t v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  float v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  TIContinuousPathSample *v40;
  double currentTimestamp;
  double v42;
  TIContinuousPathSample *v43;
  __int128 v45;
  __int128 v46;

  v13 = a3;
  v14 = a6;
  v15 = objc_alloc_init(TIContinuousPath);
  self->_currentTimestamp = a4;
  -[TTKDefaultContinuousPathGenerator timeDelta](self, "timeDelta");
  v17 = v16;
  if (a5 != -1.0)
  {
    v18 = objc_msgSend(v13, "count");
    v19 = 0.0;
    if (v18 >= 2)
    {
      v20 = 0;
      v21 = 1;
      do
      {
        objc_msgSend(v14, "objectAtIndexedSubscript:", v21 - 1, v19);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v20 += objc_msgSend(v22, "count");

        ++v21;
      }
      while (v21 < objc_msgSend(v13, "count"));
      v19 = (double)v20;
    }
    v17 = a5 / v19;
  }
  v46 = 0uLL;
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "getValue:", &v46);

  if ((unint64_t)objc_msgSend(v13, "count") >= 2)
  {
    v24 = 1;
    do
    {
      objc_msgSend(v13, "objectAtIndexedSubscript:", v24, 0, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "getValue:", &v45);

      objc_msgSend(v14, "objectAtIndexedSubscript:", v24 - 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v26, "count"))
      {
        v27 = 0;
        do
        {
          -[TTKDefaultContinuousPathGenerator subtractPoint:byPoint:](self, "subtractPoint:byPoint:", v45, v46);
          v29 = v28;
          v31 = v30;
          objc_msgSend(v26, "objectAtIndex:", v27);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "floatValue");
          -[TTKDefaultContinuousPathGenerator scalarMultiplyPoint:by:](self, "scalarMultiplyPoint:by:", v29, v31, v33);
          -[TTKDefaultContinuousPathGenerator addPoint:andPoint:](self, "addPoint:andPoint:", v46, v34, v35);
          v37 = v36;
          v39 = v38;

          v40 = [TIContinuousPathSample alloc];
          currentTimestamp = self->_currentTimestamp;
          -[TTKDefaultContinuousPathGenerator force](self, "force");
          v43 = -[TIContinuousPathSample initWithPoint:timeStamp:force:radius:stage:pathIndex:](v40, "initWithPoint:timeStamp:force:radius:stage:pathIndex:", 7, -1, v37, v39, currentTimestamp, v42, 0.0);
          -[TIContinuousPath addSample:](v15, "addSample:", v43);
          self->_currentTimestamp = v17 + self->_currentTimestamp;

          ++v27;
        }
        while (v27 < objc_msgSend(v26, "count"));
      }
      v46 = v45;

      ++v24;
    }
    while (v24 < objc_msgSend(v13, "count"));
  }

  return v15;
}

- (BOOL)canHandleDoubleLetter
{
  return 0;
}

@end
