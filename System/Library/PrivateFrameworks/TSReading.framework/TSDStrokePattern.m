@implementation TSDStrokePattern

- (TSDStrokePattern)initWithPatternType:(int64_t)a3 pattern:(const double *)a4 count:(unint64_t)a5 phase:(double)a6
{
  TSDStrokePattern *v9;
  TSDStrokePattern *v10;
  double *pattern;
  unint64_t v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)TSDStrokePattern;
  v9 = -[TSDStrokePattern init](&v14, sel_init, a6);
  v10 = v9;
  if (v9)
  {
    v9->_type = a3;
    v9->_count = a5;
    if (a4)
    {
      pattern = v9->_pattern;
      v12 = 6;
      if (a5 < 6)
        v12 = a5;
      memcpy(pattern, a4, 8 * v12);
    }
  }
  return v10;
}

- (TSDStrokePattern)initWithPattern:(const double *)a3 count:(unint64_t)a4 phase:(double)a5
{
  return -[TSDStrokePattern initWithPatternType:pattern:count:phase:](self, "initWithPatternType:pattern:count:phase:", 0, a3, a4, a5);
}

+ (id)solidPattern
{
  if (solidPattern_pred != -1)
    dispatch_once(&solidPattern_pred, &__block_literal_global_26);
  return (id)solidPattern_sPattern;
}

void __32__TSDStrokePattern_solidPattern__block_invoke()
{
  TSDStrokePattern *v0;
  void *v1;

  v0 = -[TSDStrokePattern initWithPatternType:pattern:count:phase:]([TSDStrokePattern alloc], "initWithPatternType:pattern:count:phase:", 1, 0, 0, 0.0);
  v1 = (void *)solidPattern_sPattern;
  solidPattern_sPattern = (uint64_t)v0;

}

+ (id)emptyPattern
{
  if (emptyPattern_pred != -1)
    dispatch_once(&emptyPattern_pred, &__block_literal_global_1_0);
  return (id)emptyPattern_sPattern;
}

void __32__TSDStrokePattern_emptyPattern__block_invoke()
{
  TSDStrokePattern *v0;
  void *v1;

  v0 = -[TSDStrokePattern initWithPatternType:pattern:count:phase:]([TSDStrokePattern alloc], "initWithPatternType:pattern:count:phase:", 2, 0, 0, 0.0);
  v1 = (void *)emptyPattern_sPattern;
  emptyPattern_sPattern = (uint64_t)v0;

}

+ (id)shortDashPattern
{
  if (shortDashPattern_pred != -1)
    dispatch_once(&shortDashPattern_pred, &__block_literal_global_2);
  return (id)shortDashPattern_sPattern;
}

void __36__TSDStrokePattern_shortDashPattern__block_invoke()
{
  TSDStrokePattern *v0;
  void *v1;

  v0 = -[TSDStrokePattern initWithPattern:count:phase:]([TSDStrokePattern alloc], "initWithPattern:count:phase:", &shortDashPattern_pattern1, 2, 0.0);
  v1 = (void *)shortDashPattern_sPattern;
  shortDashPattern_sPattern = (uint64_t)v0;

}

+ (id)mediumDashPattern
{
  if (mediumDashPattern_pred != -1)
    dispatch_once(&mediumDashPattern_pred, &__block_literal_global_3_0);
  return (id)mediumDashPattern_sPattern;
}

void __37__TSDStrokePattern_mediumDashPattern__block_invoke()
{
  TSDStrokePattern *v0;
  void *v1;

  v0 = -[TSDStrokePattern initWithPattern:count:phase:]([TSDStrokePattern alloc], "initWithPattern:count:phase:", &mediumDashPattern_pattern3, 2, 0.0);
  v1 = (void *)mediumDashPattern_sPattern;
  mediumDashPattern_sPattern = (uint64_t)v0;

}

+ (id)longDashPattern
{
  if (longDashPattern_pred != -1)
    dispatch_once(&longDashPattern_pred, &__block_literal_global_4_0);
  return (id)longDashPattern_sPattern;
}

void __35__TSDStrokePattern_longDashPattern__block_invoke()
{
  TSDStrokePattern *v0;
  void *v1;

  v0 = -[TSDStrokePattern initWithPattern:count:phase:]([TSDStrokePattern alloc], "initWithPattern:count:phase:", &longDashPattern_pattern6, 2, 0.0);
  v1 = (void *)longDashPattern_sPattern;
  longDashPattern_sPattern = (uint64_t)v0;

}

+ (id)roundDashPattern
{
  if (roundDashPattern_pred != -1)
    dispatch_once(&roundDashPattern_pred, &__block_literal_global_5);
  return (id)roundDashPattern_sPattern;
}

void __36__TSDStrokePattern_roundDashPattern__block_invoke()
{
  TSDStrokePattern *v0;
  void *v1;

  v0 = -[TSDStrokePattern initWithPattern:count:phase:]([TSDStrokePattern alloc], "initWithPattern:count:phase:", &roundDashPattern_roundPattern, 2, 0.0);
  v1 = (void *)roundDashPattern_sPattern;
  roundDashPattern_sPattern = (uint64_t)v0;

}

+ (id)roundDashPatternWithSpacing:(double)a3
{
  _QWORD v4[3];

  v4[2] = *MEMORY[0x24BDAC8D0];
  v4[0] = 0x3F50624DD2F1A9FCLL;
  *(double *)&v4[1] = a3;
  +[TSDStrokePattern strokePatternWithPattern:count:phase:](TSDStrokePattern, "strokePatternWithPattern:count:phase:", v4, 2, 0.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)dashPatternWithSpacing:(double)a3
{
  _QWORD v4[3];

  v4[2] = *MEMORY[0x24BDAC8D0];
  *(double *)v4 = a3;
  *(double *)&v4[1] = a3;
  +[TSDStrokePattern strokePatternWithPattern:count:phase:](TSDStrokePattern, "strokePatternWithPattern:count:phase:", v4, 2, 0.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)strokePatternWithPattern:(const double *)a3 count:(unint64_t)a4 phase:(double)a5
{
  return -[TSDStrokePattern initWithPattern:count:phase:]([TSDStrokePattern alloc], "initWithPattern:count:phase:", a3, a4, a5);
}

- (BOOL)isEqual:(id)a3
{
  TSDStrokePattern *v4;
  void *v5;
  int64_t v6;
  double v7;
  double v8;
  double v9;
  unint64_t v10;
  unint64_t v11;
  double *v12;
  BOOL v13;
  double *pattern;
  unint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  BOOL v22;

  v4 = (TSDStrokePattern *)a3;
  objc_opt_class();
  TSUDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_10;
  if (v4 == self)
  {
LABEL_9:
    v13 = 1;
    goto LABEL_11;
  }
  if (-[TSDStrokePattern patternType](self, "patternType")
    && (v6 = -[TSDStrokePattern patternType](self, "patternType"), v6 != objc_msgSend(v5, "patternType"))
    || (-[TSDStrokePattern phase](self, "phase"), v8 = v7, objc_msgSend(v5, "phase"), vabdd_f64(v8, v9) >= 0.00999999978)
    || (v10 = -[TSDStrokePattern count](self, "count"), v10 != objc_msgSend(v5, "count")))
  {
LABEL_10:
    v13 = 0;
    goto LABEL_11;
  }
  if (-[TSDStrokePattern count](self, "count") >= 6)
  {
    v12 = (double *)objc_msgSend(v5, "pattern");
    v11 = 6;
  }
  else
  {
    v11 = -[TSDStrokePattern count](self, "count");
    v12 = (double *)objc_msgSend(v5, "pattern");
    if (!v11)
      goto LABEL_9;
  }
  pattern = self->_pattern;
  v16 = v11 - 1;
  do
  {
    v17 = *pattern++;
    v18 = v17;
    v19 = *v12++;
    v20 = vabdd_f64(v18, v19);
    v22 = v16-- != 0;
    v13 = v20 < 0.00999999978;
  }
  while (v20 < 0.00999999978 && v22);
LABEL_11:

  return v13;
}

- (unint64_t)hash
{
  TSUHash();
  return TSUHashWithSeed();
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;

  -[TSDStrokePattern p_patternString](self, "p_patternString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSDStrokePattern p_typeString](self, "p_typeString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ (%p) pattern: %@ count: %ld phase: %f type: %@"), v7, self, v3, self->_count, *(_QWORD *)&self->_phase, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)p_patternString
{
  unint64_t v3;
  __CFString *v4;
  double *pattern;
  __CFString *v6;
  uint64_t v8;

  if (self->_count)
  {
    v3 = 0;
    v4 = CFSTR("none");
    pattern = self->_pattern;
    do
    {
      if (v3)
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@, %f"), v4, *(_QWORD *)&pattern[v3]);
      else
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%f"), *(_QWORD *)pattern, v8);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

      ++v3;
      v4 = v6;
    }
    while (v3 < self->_count);
  }
  else
  {
    v6 = CFSTR("none");
  }
  return v6;
}

- (id)p_typeString
{
  unint64_t type;

  type = self->_type;
  if (type > 2)
    return CFSTR("unknown");
  else
    return off_24D82B9D0[type];
}

- (double)pattern
{
  return self->_pattern;
}

- (BOOL)isDash
{
  double v2;
  BOOL result;

  result = self->_count == 2
        && (v2 = self->_pattern[0], vabdd_f64(v2, self->_pattern[1]) < 0.0001)
        && fabs(v2 + -0.001) >= 0.0001;
  return result;
}

- (BOOL)isRoundDash
{
  double v2;
  BOOL result;

  result = self->_count == 2
        && (v2 = self->_pattern[0], vabdd_f64(v2, self->_pattern[1]) >= 0.0001)
        && fabs(v2 + -0.001) < 0.0001;
  return result;
}

- (void)applyToContext:(CGContext *)a3 lineWidth:(double)a4
{
  -[TSDStrokePattern i_applyToContext:lineWidth:capStyle:](self, "i_applyToContext:lineWidth:capStyle:", a3, 0, a4);
}

- (void)i_applyToContext:(CGContext *)a3 lineWidth:(double)a4 capStyle:(unint64_t *)a5
{
  double *v9;
  unint64_t count;
  CGFloat *v11;
  double v12;
  double phase;
  double v14;
  float v15;
  CGAffineTransform v16;
  CGAffineTransform v17;
  CGFloat lengths[2];
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v19 = 0u;
  v20 = 0u;
  *(_OWORD *)lengths = 0u;
  v9 = -[TSDStrokePattern pattern](self, "pattern");
  count = self->_count;
  if (count)
  {
    v11 = lengths;
    do
    {
      v12 = *v9++;
      *v11++ = v12 * a4;
      --count;
    }
    while (count);
  }
  phase = self->_phase;
  if (-[TSDStrokePattern isRoundDash](self, "isRoundDash"))
  {
    memset(&v17, 0, sizeof(v17));
    CGContextGetCTM(&v17, a3);
    v16 = v17;
    v14 = TSDTransformScale(&v16.a);
    if (a5 && *a5 == 1 && v14 * a4 <= 2.0)
    {
      lengths[0] = a4;
      *a5 = 0;
      v15 = 0.0;
    }
    else
    {
      lengths[1] = lengths[1] + a4;
      v15 = 0.5;
    }
  }
  else
  {
    v15 = phase * a4;
  }
  CGContextSetLineDash(a3, v15, lengths, self->_count);
}

- (double)p_renderableLengthForUnclippedPatternWithLineWidth:(double)a3 withinAvailableLength:(double)a4
{
  double v7;
  double v8;
  double v9;
  double v10;
  _BOOL4 v11;
  double v12;
  double v13;
  double v14;
  float v15;
  float v16;
  float v17;
  double v18;

  if (-[TSDStrokePattern count](self, "count") == 2)
  {
    v7 = *-[TSDStrokePattern pattern](self, "pattern") * a3;
    v8 = -[TSDStrokePattern pattern](self, "pattern")[8] * a3;
    -[TSDStrokePattern phase](self, "phase");
    v10 = v9 * a3;
    v11 = -[TSDStrokePattern isRoundDash](self, "isRoundDash");
    v12 = -0.0;
    if (v11)
      v12 = a3;
    v13 = v7 + v12;
    v14 = 0.5;
    if (!v11)
      v14 = v10;
    v15 = a4 - (v8 + v13 - v14);
    v16 = v8 + v13;
    v17 = fmodf(v15, v16);
    v18 = v17;
    if (v17 > 0.0 && v17 < 5.0 && v13 > v18)
    {
      a4 = a4 - v18;
      if (-[TSDStrokePattern isRoundDash](self, "isRoundDash"))
        return a4 + v8 * -0.5;
    }
  }
  return a4;
}

- (void)applyToShapeRenderable:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v8 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDStrokePattern applyToShapeRenderable:]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDStroke.m");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, v7, 342, CFSTR("invalid nil value for '%s'"), "shapeRenderable");

    v4 = 0;
  }
  objc_msgSend(v4, "lineWidth");
  -[TSDStrokePattern p_applyToShapeRenderable:lineWidth:](self, "p_applyToShapeRenderable:lineWidth:", v8);

}

- (void)p_applyToShapeRenderable:(id)a3 lineWidth:(double)a4
{
  id v6;
  double *v7;
  double *v8;
  unint64_t v9;
  double v10;
  void *v11;
  id v12;

  v12 = a3;
  if (-[TSDStrokePattern patternType](self, "patternType") == 1)
  {
    objc_msgSend(v12, "setLineDashPattern:", 0);
  }
  else if (!-[TSDStrokePattern patternType](self, "patternType"))
  {
    objc_msgSend(v12, "setLineDashPhase:", self->_phase * a4);
    v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = -[TSDStrokePattern pattern](self, "pattern");
    if (self->_count)
    {
      v8 = v7;
      v9 = 0;
      do
      {
        v10 = v8[v9] * a4;
        if (v9 == 1 && -[TSDStrokePattern isRoundDash](self, "isRoundDash"))
        {
          objc_msgSend(v12, "setLineDashPhase:", 0.5);
          v10 = v10 + a4;
        }
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v11);

        ++v9;
      }
      while (v9 < self->_count);
    }
    objc_msgSend(v12, "setLineDashPattern:", v6);

  }
}

- (int64_t)mixingTypeWithObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  unint64_t v10;
  int v11;
  int v12;
  int64_t v13;

  v4 = a3;
  objc_opt_class();
  TSUDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDStrokePattern mixingTypeWithObject:]");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDStroke.m");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, v8, 377, CFSTR("nil object after cast"));

  }
  v9 = -[TSDStrokePattern patternType](self, "patternType");
  if (v9 == objc_msgSend(v5, "patternType")
    && (v10 = -[TSDStrokePattern count](self, "count"), v10 == objc_msgSend(v5, "count"))
    && (v11 = -[TSDStrokePattern isDash](self, "isDash"), v11 == objc_msgSend(v5, "isDash"))
    && (v12 = -[TSDStrokePattern isRoundDash](self, "isRoundDash"), v12 == objc_msgSend(v5, "isRoundDash")))
  {
    v13 = 5;
  }
  else
  {
    v13 = TSDMixingTypeBestFromMixingTypes(5, 2);
  }

  return v13;
}

- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[7];

  v19[6] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_opt_class();
  TSUDynamicCast();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (-[TSDStrokePattern count](self, "count"))
    {
      v8 = 0;
      do
      {
        *(double *)&v19[v8] = TSDMixFloats(-[TSDStrokePattern pattern](self, "pattern")[8 * v8], *(double *)(objc_msgSend(v7, "pattern") + 8 * v8), a3);
        ++v8;
      }
      while (v8 < -[TSDStrokePattern count](self, "count"));
    }
    v9 = -[TSDStrokePattern count](self, "count");
    -[TSDStrokePattern phase](self, "phase");
    v11 = v10;
    objc_msgSend(v7, "phase");
    +[TSDStrokePattern strokePatternWithPattern:count:phase:](TSDStrokePattern, "strokePatternWithPattern:count:phase:", v19, v9, TSDMixFloats(v11, v12, a3));
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDStrokePattern mixedObjectWithFraction:ofObject:]");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDStroke.m");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, v16, 393, CFSTR("nil object after cast"));

    +[TSDStrokePattern emptyPattern](TSDStrokePattern, "emptyPattern");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v17 = (void *)v13;

  return v17;
}

- (int64_t)patternType
{
  return self->_type;
}

- (unint64_t)count
{
  return self->_count;
}

- (double)phase
{
  return self->_phase;
}

@end
