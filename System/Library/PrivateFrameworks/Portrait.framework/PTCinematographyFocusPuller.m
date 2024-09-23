@implementation PTCinematographyFocusPuller

+ (unint64_t)defaultStrategy
{
  if (defaultStrategy_onceToken != -1)
    dispatch_once(&defaultStrategy_onceToken, &__block_literal_global);
  return 0;
}

+ (float)defaultEMASampleCount
{
  if (defaultEMASampleCount_onceToken != -1)
    dispatch_once(&defaultEMASampleCount_onceToken, &__block_literal_global_6);
  return *(float *)&defaultEMASampleCount_sDefaultEMASampleCount;
}

void __52__PTCinematographyFocusPuller_defaultEMASampleCount__block_invoke()
{
  defaultEMASampleCount_sDefaultEMASampleCount = 1088421888;
}

+ (float)defaultMaximumVelocity
{
  if (defaultMaximumVelocity_onceToken != -1)
    dispatch_once(&defaultMaximumVelocity_onceToken, &__block_literal_global_7);
  return *(float *)&defaultMaximumVelocity_sDefaultMaximumVelocity;
}

void __53__PTCinematographyFocusPuller_defaultMaximumVelocity__block_invoke()
{
  defaultMaximumVelocity_sDefaultMaximumVelocity = 1091567616;
}

+ (float)defaultResistance
{
  if (defaultResistance_onceToken != -1)
    dispatch_once(&defaultResistance_onceToken, &__block_literal_global_8);
  return *(float *)&defaultResistance_sDefaultResistance;
}

void __48__PTCinematographyFocusPuller_defaultResistance__block_invoke()
{
  defaultResistance_sDefaultResistance = 1036831949;
}

- (PTCinematographyFocusPuller)init
{
  uint64_t v3;
  void *v4;
  int v5;
  int v6;
  int v7;
  double v8;
  double v9;
  PTCinematographyFocusPuller *v10;
  float v11;
  PTCinematographyFocusPuller *v12;

  v3 = objc_msgSend((id)objc_opt_class(), "defaultStrategy");
  v4 = (void *)objc_opt_class();
  if (v3 == 1)
  {
    objc_msgSend(v4, "defaultMaximumVelocity");
    v6 = v5;
    objc_msgSend((id)objc_opt_class(), "defaultResistance");
    LODWORD(v8) = v7;
    LODWORD(v9) = v6;
    v10 = -[PTCinematographyFocusPuller initWithMaximumVelocity:resistance:](self, "initWithMaximumVelocity:resistance:", v9, v8);
  }
  else
  {
    objc_msgSend(v4, "defaultEMASampleCount");
    v10 = -[PTCinematographyFocusPuller initWithExponentialMovingAverageSampleCount:](self, "initWithExponentialMovingAverageSampleCount:", (unint64_t)v11);
  }
  v12 = v10;

  return v12;
}

- (PTCinematographyFocusPuller)initWithExponentialMovingAverageAlpha:(float)a3
{
  PTCinematographyFocusPuller *v4;
  double v5;
  PTCinematographyFocusPuller *v6;
  NSObject *v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PTCinematographyFocusPuller;
  v4 = -[PTCinematographyFocusPuller init](&v10, sel_init);
  v6 = v4;
  if (v4)
  {
    v4->_strategy = 0;
    *(float *)&v5 = a3;
    -[PTCinematographyFocusPuller setAlpha:](v4, "setAlpha:", v5);
    _PTLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[PTCinematographyFocusPuller initWithExponentialMovingAverageAlpha:].cold.1((uint64_t)v6, v7, v8);

  }
  return v6;
}

- (PTCinematographyFocusPuller)initWithExponentialMovingAverageSampleCount:(unint64_t)a3
{
  PTCinematographyFocusPuller *v4;
  PTCinematographyFocusPuller *v5;
  NSObject *v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PTCinematographyFocusPuller;
  v4 = -[PTCinematographyFocusPuller init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_strategy = 0;
    -[PTCinematographyFocusPuller setSampleCount:](v4, "setSampleCount:", a3);
    _PTLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[PTCinematographyFocusPuller initWithExponentialMovingAverageSampleCount:].cold.1((uint64_t)v5, v6, v7);

  }
  return v5;
}

- (float)alpha
{
  return self->_alpha;
}

- (void)setAlpha:(float)a3
{
  float v3;
  unint64_t v4;

  if (a3 < 0.0)
    a3 = 0.0;
  v3 = fminf(a3, 1.0);
  self->_alpha = v3;
  if (v3 <= 0.0)
    v4 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v4 = llroundf((float)(2.0 / v3) + -1.0);
  self->_sampleCount = v4;
}

- (unint64_t)sampleCount
{
  return self->_sampleCount;
}

- (void)setSampleCount:(unint64_t)a3
{
  unint64_t v3;

  if (a3 <= 1)
    v3 = 1;
  else
    v3 = a3;
  self->_sampleCount = v3;
  self->_alpha = 2.0 / (float)((float)v3 + 1.0);
}

- (PTCinematographyFocusPuller)initWithMaximumVelocity:(float)a3 resistance:(float)a4
{
  PTCinematographyFocusPuller *v6;
  PTCinematographyFocusPuller *v7;
  float v8;
  float v9;
  float v10;
  NSObject *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PTCinematographyFocusPuller;
  v6 = -[PTCinematographyFocusPuller init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    v8 = fabsf(a4);
    v6->_resistance = v8;
    v6->_strategy = 1;
    v9 = fabsf(a3);
    v6->_maximumVelocity = v9;
    v10 = v9 / v8;
    if (a4 == 0.0)
      v10 = INFINITY;
    v6->_maximumAcceleration = v10;
    _PTLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[PTCinematographyFocusPuller initWithMaximumVelocity:resistance:].cold.1(&v7->_maximumVelocity, &v7->_resistance, v11);

  }
  return v7;
}

- (void)reset
{
  self->_time = *($95D729B680665BEAEFA1D6FCA8238556 *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
}

- (void)setFocusDistance:(float)a3 time:(id *)a4
{
  __int128 v4;

  v4 = *(_OWORD *)&a4->var0;
  self->_time.epoch = a4->var3;
  *(_OWORD *)&self->_time.value = v4;
  self->_velocity = 0.0;
  self->_focusDistance = a3;
  self->_targetDistance = a3;
}

- (float)_emaDelta:(float)a3
{
  return self->_alpha * a3;
}

- (float)_weightedDialDelta:(float)a3 timeDelta:(float)a4
{
  float v6;
  float v7;
  int8x16_t v8;
  int8x16_t v9;
  int8x16_t v10;
  int8x16_t v11;
  unsigned __int32 v12;
  float v13;
  float v14;
  float v15;
  int8x16_t v16;
  float v17;
  int8x16_t v18;
  float result;
  int8x16_t v20;
  int8x16_t v21;

  v21.i64[0] = *(_QWORD *)&a3;
  -[PTCinematographyFocusPuller maximumVelocity](self, "maximumVelocity");
  v7 = v6;
  -[PTCinematographyFocusPuller maximumAcceleration](self, "maximumAcceleration");
  v8 = v21;
  *(float *)v9.i32 = (float)(*(float *)v10.i32 * a4) * a4;
  *(float *)v10.i32 = fabsf(*(float *)v21.i32);
  v20 = v9;
  if (*(float *)v10.i32 > *(float *)v9.i32)
  {
    v10.i32[0] = v21.i32[0];
    -[PTCinematographyFocusPuller _minimumTimestepsToMoveBy:maxddx:](self, "_minimumTimestepsToMoveBy:maxddx:", *(double *)v10.i64);
    *(float *)v10.i32 = *(float *)v20.i32 * *(float *)v10.i32;
    v9.i64[0] = 0x8000000080000000;
    v9.i64[1] = 0x8000000080000000;
    v8 = vbslq_s8(v9, v10, v21);
    *(float *)v10.i32 = fabsf(*(float *)v10.i32);
  }
  *(float *)v9.i32 = v7 * a4;
  v11.i64[0] = 0x8000000080000000;
  v11.i64[1] = 0x8000000080000000;
  v12 = vbslq_s8(v11, v9, v8).u32[0];
  if (*(float *)v10.i32 <= (float)(v7 * a4))
    v13 = *(float *)v8.i32;
  else
    v13 = *(float *)&v12;
  -[PTCinematographyFocusPuller velocity](self, "velocity", v20.i64[0]);
  v15 = v14 * a4;
  *(float *)v16.i32 = v13 - v15;
  v17 = vabds_f32(v13, v15);
  v18.i64[0] = 0x8000000080000000;
  v18.i64[1] = 0x8000000080000000;
  result = v15 + *(float *)vbslq_s8(v18, v20, v16).i32;
  if (v17 <= *(float *)v20.i32)
    return v13;
  return result;
}

- (float)pullTowardFocusDistance:(float)a3 time:(id *)a4
{
  float result;
  float Seconds;
  int v9;
  float v12;
  float v13;
  double v14;
  double v15;
  float v16;
  float v17;
  __int128 v18;
  CMTime v19;
  CMTime time;
  CMTime lhs;
  char v22;

  -[PTCinematographyFocusPuller time](self, "time");
  if ((v22 & 1) != 0)
  {
    self->_targetDistance = a3;
    -[PTCinematographyFocusPuller time](self, "time");
    lhs = (CMTime)*a4;
    CMTimeSubtract(&time, &lhs, &v19);
    Seconds = CMTimeGetSeconds(&time);
    v9 = LODWORD(Seconds) & 0x7FFFFFFF;
    -[PTCinematographyFocusPuller focusDistance](self, "focusDistance");
    if ((LODWORD(Seconds) & 0x7FFFFFFFu) <= 0x7F800000 && v9 != 2139095040 && v9 != 0)
    {
      v12 = fabsf(Seconds);
      v13 = a3 - result;
      if (-[PTCinematographyFocusPuller strategy](self, "strategy"))
      {
        *(float *)&v14 = v13;
        *(float *)&v15 = v12;
        -[PTCinematographyFocusPuller _weightedDialDelta:timeDelta:](self, "_weightedDialDelta:timeDelta:", v14, v15);
      }
      else
      {
        *(float *)&v14 = v13;
        -[PTCinematographyFocusPuller _emaDelta:](self, "_emaDelta:", v14);
      }
      v17 = v16;
      v18 = *(_OWORD *)&a4->var0;
      self->_time.epoch = a4->var3;
      *(_OWORD *)&self->_time.value = v18;
      result = v17 + self->_focusDistance;
      self->_focusDistance = result;
      self->_velocity = v17 / v12;
    }
  }
  else
  {
    -[PTCinematographyFocusPuller setFocusDistance:time:](self, "setFocusDistance:time:", &lhs, COERCE_DOUBLE(__PAIR64__(HIDWORD(a4->var0), LODWORD(a3))));
    return a3;
  }
  return result;
}

- (float)pullTowardFocusDistance:(float)a3 time:(id *)a4 missing:(BOOL)a5
{
  PTCinematographyFocusPuller *v7;
  __int128 v8;
  float v9;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11;
  char v12;

  v7 = self;
  if (!a5)
  {
    v8 = *(_OWORD *)&a4->var0;
    v11 = *a4;
    *(float *)&v8 = a3;
    goto LABEL_5;
  }
  -[PTCinematographyFocusPuller time](self, "time");
  if ((v12 & 1) != 0)
  {
    *(float *)&v8 = v7->_targetDistance;
    v11 = *a4;
    self = v7;
LABEL_5:
    -[PTCinematographyFocusPuller pullTowardFocusDistance:time:](self, "pullTowardFocusDistance:time:", &v11, *(double *)&v8, *(_OWORD *)&v11.var0, v11.var3);
    return v9;
  }
  return a3;
}

- (float)_minimumTimestepsToMoveBy:(float)a3 maxddx:(float)a4
{
  return (float)(sqrtf((float)((float)(fabsf(a3) * 8.0) / a4) + 1.0) + -1.0) * 0.5;
}

- (id)_initWithCinematographyDictionary:(id)a3
{
  id v4;
  void *v5;
  float v6;
  float v7;
  void *v8;
  float v9;
  float v10;
  void *v11;
  int v12;
  int v13;
  double v14;
  double v15;
  PTCinematographyFocusPuller *v16;
  PTCinematographyFocusPuller *v17;
  PTCinematographyFocusPuller *v18;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_alpha"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatValue");
  v7 = v6;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_maxv"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "floatValue");
  v10 = v9;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_resistance"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "floatValue");
  v13 = v12;

  if (v7 > 0.0)
  {
    v16 = self;
    *(float *)&v14 = v7;
LABEL_6:
    v17 = -[PTCinematographyFocusPuller initWithExponentialMovingAverageAlpha:](v16, "initWithExponentialMovingAverageAlpha:", v14);
    goto LABEL_7;
  }
  if (v10 <= 0.0)
  {
    LODWORD(v14) = 1.0;
    v16 = self;
    goto LABEL_6;
  }
  *(float *)&v14 = v10;
  LODWORD(v15) = v13;
  v17 = -[PTCinematographyFocusPuller initWithMaximumVelocity:resistance:](self, "initWithMaximumVelocity:resistance:", v14, v15);
LABEL_7:
  v18 = v17;

  return v18;
}

- (id)_asCinematographyDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_opt_new();
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[PTCinematographyFocusPuller alpha](self, "alpha");
  objc_msgSend(v4, "numberWithFloat:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("_alpha"));

  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[PTCinematographyFocusPuller maximumVelocity](self, "maximumVelocity");
  objc_msgSend(v6, "numberWithFloat:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("_maxv"));

  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[PTCinematographyFocusPuller resistance](self, "resistance");
  objc_msgSend(v8, "numberWithFloat:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("_resistance"));

  v10 = (void *)objc_msgSend(v3, "copy");
  return v10;
}

- (unint64_t)strategy
{
  return self->_strategy;
}

- (float)maximumVelocity
{
  return self->_maximumVelocity;
}

- (float)resistance
{
  return self->_resistance;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_time, 24, 1, 0);
  return result;
}

- (void)setTime:(id *)a3
{
  objc_copyStruct(&self->_time, a3, 24, 1, 0);
}

- (float)focusDistance
{
  return self->_focusDistance;
}

- (void)setFocusDistance:(float)a3
{
  self->_focusDistance = a3;
}

- (float)velocity
{
  return self->_velocity;
}

- (void)setVelocity:(float)a3
{
  self->_velocity = a3;
}

- (float)maximumAcceleration
{
  return self->_maximumAcceleration;
}

- (float)targetDistance
{
  return self->_targetDistance;
}

- (void)setTargetDistance:(float)a3
{
  self->_targetDistance = a3;
}

- (void)initWithExponentialMovingAverageAlpha:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  double v3;
  uint64_t v4;
  int v5;
  double v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = *(float *)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = 134218240;
  v6 = v3;
  v7 = 2048;
  v8 = v4;
  OUTLINED_FUNCTION_13(&dword_1C9281000, a2, a3, "focus puller: EMA (alpha: %g, sampleCount: %lu)", (uint8_t *)&v5);
  OUTLINED_FUNCTION_1();
}

- (void)initWithExponentialMovingAverageSampleCount:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  double v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  double v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(float *)(a1 + 8);
  v5 = 134218240;
  v6 = v3;
  v7 = 2048;
  v8 = v4;
  OUTLINED_FUNCTION_13(&dword_1C9281000, a2, a3, "focus puller: EMA (sampleCount: %lu, alpha: %g)", (uint8_t *)&v5);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMaximumVelocity:(NSObject *)a3 resistance:.cold.1(float *a1, float *a2, NSObject *a3)
{
  double v3;
  double v4;
  int v5;
  double v6;
  __int16 v7;
  double v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = *a2;
  v5 = 134218240;
  v6 = v3;
  v7 = 2048;
  v8 = v4;
  OUTLINED_FUNCTION_13(&dword_1C9281000, a3, (uint64_t)a3, "focus puller: weighted dial (maxv: %g, resistance: %g)", (uint8_t *)&v5);
  OUTLINED_FUNCTION_1();
}

@end
