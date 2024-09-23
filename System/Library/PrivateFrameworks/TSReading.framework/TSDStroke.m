@implementation TSDStroke

- (TSDStroke)initWithColor:(id)a3 width:(double)a4 cap:(int)a5 join:(int)a6 pattern:(id)a7 miterLimit:(double)a8
{
  id v14;
  id v15;
  TSDStroke *v16;
  uint64_t v17;
  TSUColor *color;
  uint64_t v19;
  TSDStrokePattern *pattern;
  objc_super v22;

  v14 = a3;
  v15 = a7;
  v22.receiver = self;
  v22.super_class = (Class)TSDStroke;
  v16 = -[TSDStroke init](&v22, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v14, "copy");
    color = v16->_color;
    v16->_color = (TSUColor *)v17;

    v16->_width = a4;
    v16->_actualWidth = a4;
    v16->_cap = a5;
    v16->_join = a6;
    v19 = objc_msgSend(v15, "copy");
    pattern = v16->_pattern;
    v16->_pattern = (TSDStrokePattern *)v19;

    v16->_miterLimit = a8;
    if (objc_msgSend(v15, "isRoundDash"))
      v16->_cap = 1;
  }

  return v16;
}

- (TSDStroke)init
{
  void *v3;
  void *v4;
  TSDStroke *v5;

  objc_msgSend(MEMORY[0x24BEB3C40], "blackColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[TSDStrokePattern solidPattern](TSDStrokePattern, "solidPattern");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[TSDStroke initWithColor:width:cap:join:pattern:](self, "initWithColor:width:cap:join:pattern:", v3, 0, 0, v4, 1.0);

  return v5;
}

- (TSDStroke)initWithColor:(id)a3 width:(double)a4 cap:(int)a5 join:(int)a6 pattern:(id)a7
{
  return -[TSDStroke initWithColor:width:cap:join:pattern:miterLimit:](self, "initWithColor:width:cap:join:pattern:miterLimit:", a3, *(_QWORD *)&a5, *(_QWORD *)&a6, a7, a4, 4.0);
}

+ (Class)mutableClass
{
  return (Class)objc_opt_class();
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  TSDMutableStroke *v4;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  double v11;
  TSDMutableStroke *v12;

  v4 = +[TSDMutableStroke allocWithZone:](TSDMutableStroke, "allocWithZone:", a3);
  -[TSDStroke color](self, "color");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSDStroke width](self, "width");
  v7 = v6;
  v8 = -[TSDStroke cap](self, "cap");
  v9 = -[TSDStroke join](self, "join");
  -[TSDStroke pattern](self, "pattern");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSDStroke miterLimit](self, "miterLimit");
  v12 = -[TSDStroke initWithColor:width:cap:join:pattern:miterLimit:](v4, "initWithColor:width:cap:join:pattern:miterLimit:", v5, v8, v9, v10, v7, v11);

  -[TSDStroke actualWidth](self, "actualWidth");
  -[TSDStroke setI_actualWidth:](v12, "setI_actualWidth:");
  return v12;
}

- (void)i_setCap:(int)a3
{
  void *v5;
  void *v6;
  id v7;

  if (self->_cap != a3)
  {
    if (-[TSDStroke isRoundDash](self, "isRoundDash"))
    {
      objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDStroke i_setCap:]");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDStroke.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v5, v6, 518, CFSTR("Cannot change cap style on a round-dash stroke."));

    }
    else
    {
      self->_cap = a3;
    }
  }
}

- (void)i_setPattern:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  TSDStrokePattern *v7;
  TSDStrokePattern *pattern;
  uint64_t v9;
  id v10;

  v10 = a3;
  -[TSDStroke pattern](self, "pattern");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v10;
  if (v4 != v10)
  {
    v6 = -[TSDStroke isRoundDash](self, "isRoundDash");
    v7 = (TSDStrokePattern *)objc_msgSend(v10, "copy");
    pattern = self->_pattern;
    self->_pattern = v7;

    if (objc_msgSend(v10, "isRoundDash"))
    {
      v5 = v10;
      if (!v6)
      {
        v9 = 1;
LABEL_7:
        -[TSDStroke i_setCap:](self, "i_setCap:", v9);
        v5 = v10;
      }
    }
    else
    {
      v5 = v10;
      if (v6)
      {
        v9 = 0;
        goto LABEL_7;
      }
    }
  }

}

+ (id)i_newStroke
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x24BEB3C40], "blackColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[TSDStrokePattern solidPattern](TSDStrokePattern, "solidPattern");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithColor:width:cap:join:pattern:", v3, 0, 0, v4, 1.0);

  return v5;
}

+ (id)i_newEmptyStroke
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x24BEB3C40], "blackColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[TSDStrokePattern emptyPattern](TSDStrokePattern, "emptyPattern");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithColor:width:cap:join:pattern:", v3, 0, 0, v4, 1.0);

  return v5;
}

+ (id)stroke
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __19__TSDStroke_stroke__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (stroke_pred != -1)
    dispatch_once(&stroke_pred, block);
  return (id)stroke_sDefaultStroke;
}

void __19__TSDStroke_stroke__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(*(id *)(a1 + 32), "i_newStroke");
  v2 = (void *)stroke_sDefaultStroke;
  stroke_sDefaultStroke = v1;

}

+ (id)emptyStroke
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __24__TSDStroke_emptyStroke__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (emptyStroke_pred != -1)
    dispatch_once(&emptyStroke_pred, block);
  return (id)emptyStroke_sEmptyStroke;
}

void __24__TSDStroke_emptyStroke__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(*(id *)(a1 + 32), "i_newEmptyStroke");
  v2 = (void *)emptyStroke_sEmptyStroke;
  emptyStroke_sEmptyStroke = v1;

}

+ (id)strokeWithColor:(id)a3 width:(double)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a3;
  v6 = objc_alloc((Class)objc_opt_class());
  +[TSDStrokePattern solidPattern](TSDStrokePattern, "solidPattern");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithColor:width:cap:join:pattern:", v5, 0, 0, v7, a4);

  return v8;
}

+ (id)strokeWithColor:(id)a3 width:(double)a4 cap:(int)a5 join:(int)a6 pattern:(id)a7
{
  uint64_t v7;
  uint64_t v8;
  id v11;
  id v12;
  void *v13;

  v7 = *(_QWORD *)&a6;
  v8 = *(_QWORD *)&a5;
  v11 = a7;
  v12 = a3;
  v13 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithColor:width:cap:join:pattern:", v12, v8, v7, v11, a4);

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  TSDStroke *v4;
  uint64_t v5;
  BOOL v6;
  _BOOL4 v7;
  _BOOL4 v8;
  double v9;
  double v10;
  double v11;
  _BOOL4 v12;
  _BOOL4 v13;
  int v14;
  int v15;
  double v16;
  double v17;
  double v18;
  _BOOL4 v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  char v23;
  _BOOL4 v24;
  _BOOL4 v25;
  TSUColor *color;
  uint64_t v27;
  void *v28;
  char v29;

  v4 = (TSDStroke *)a3;
  if (v4 == self)
    goto LABEL_29;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_5;
  v5 = objc_msgSend((id)objc_opt_class(), "mutableClass");
  if (v5 != objc_msgSend((id)objc_opt_class(), "mutableClass"))
    goto LABEL_5;
  v7 = -[TSDStroke supportsWidth](self, "supportsWidth");
  v8 = -[TSDStroke supportsWidth](v4, "supportsWidth");
  if (v7)
  {
    if (!v8)
      goto LABEL_5;
    -[TSDStroke width](self, "width");
    v10 = v9;
    -[TSDStroke width](v4, "width");
    if (vabdd_f64(v10, v11) >= 0.00999999978)
      goto LABEL_5;
  }
  else if (v8)
  {
    goto LABEL_5;
  }
  v12 = -[TSDStroke supportsLineOptions](self, "supportsLineOptions");
  v13 = -[TSDStroke supportsLineOptions](v4, "supportsLineOptions");
  if (v12)
  {
    if (!v13)
      goto LABEL_5;
    v14 = -[TSDStroke cap](self, "cap");
    if (v14 != -[TSDStroke cap](v4, "cap"))
      goto LABEL_5;
    v15 = -[TSDStroke join](self, "join");
    if (v15 != -[TSDStroke join](v4, "join"))
      goto LABEL_5;
    -[TSDStroke miterLimit](self, "miterLimit");
    v17 = v16;
    -[TSDStroke miterLimit](v4, "miterLimit");
    if (v17 != v18)
      goto LABEL_5;
  }
  else if (v13)
  {
    goto LABEL_5;
  }
  v19 = -[TSDStroke supportsPattern](self, "supportsPattern");
  v20 = -[TSDStroke supportsPattern](v4, "supportsPattern");
  if (v19)
  {
    if (!v20)
      goto LABEL_5;
    -[TSDStroke pattern](self, "pattern");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSDStroke pattern](v4, "pattern");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "isEqual:", v22);

    if ((v23 & 1) == 0)
      goto LABEL_5;
  }
  else if (v20)
  {
    goto LABEL_5;
  }
  v24 = -[TSDStroke supportsColor](self, "supportsColor");
  v25 = -[TSDStroke supportsColor](v4, "supportsColor");
  if (v24)
  {
    if (v25)
    {
      color = self->_color;
      -[TSDStroke color](v4, "color");
      v27 = objc_claimAutoreleasedReturnValue();
      if (!((unint64_t)color | v27))
        goto LABEL_29;
      v28 = (void *)v27;
      v29 = -[TSUColor isEqual:](color, "isEqual:", v27);

      if ((v29 & 1) != 0)
        goto LABEL_29;
    }
  }
  else if (!v25)
  {
LABEL_29:
    v6 = 1;
    goto LABEL_30;
  }
LABEL_5:
  v6 = 0;
LABEL_30:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;

  if (-[TSDStroke supportsColor](self, "supportsColor"))
    v3 = -[TSUColor hash](self->_color, "hash");
  else
    v3 = *MEMORY[0x24BEB3E78];
  if (-[TSDStroke supportsLineOptions](self, "supportsLineOptions"))
  {
    TSUHashWithSeed();
    TSUHashWithSeed();
    v3 = TSUHashWithSeed();
  }
  if (-[TSDStroke supportsPattern](self, "supportsPattern"))
    v3 ^= -[TSDStrokePattern hash](self->_pattern, "hash");
  return v3;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSDStroke pattern](self, "pattern");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSDStroke width](self, "width");
  v8 = v7;
  -[TSDStroke color](self, "color");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCGLineCap(-[TSDStroke cap](self, "cap"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCGLineJoin(-[TSDStroke join](self, "join"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p pattern=<%@>' width=%f color=<%@> cap=%@ join=%@>"), v5, self, v6, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (double)renderedWidth
{
  return self->_width;
}

- (double)dashSpacing
{
  TSDStrokePattern *pattern;
  double v4;

  pattern = self->_pattern;
  v4 = 0.0;
  if (pattern && -[TSDStrokePattern count](pattern, "count") == 2)
    return -[TSDStrokePattern pattern](self->_pattern, "pattern")[8];
  return v4;
}

- (BOOL)isDash
{
  _BOOL4 v3;

  v3 = -[TSDStrokePattern isDash](self->_pattern, "isDash");
  if (v3)
    LOBYTE(v3) = self->_cap != 1;
  return v3;
}

- (BOOL)isRoundDash
{
  _BOOL4 v3;

  v3 = -[TSDStrokePattern isRoundDash](self->_pattern, "isRoundDash");
  if (v3)
    LOBYTE(v3) = self->_cap == 1;
  return v3;
}

- (BOOL)drawsOutsideStrokeBounds
{
  return 0;
}

- (BOOL)needsToExtendJoinsForBoundsCalculation
{
  return 0;
}

- (CGPath)pathToStrokeFromCGPath:(CGPath *)a3
{
  return a3;
}

- (id)pathToStrokeFromTSDBezierPath:(id)a3
{
  id v4;
  CGPath *v5;
  TSDBezierPath *v6;
  void *v7;

  v4 = a3;
  v5 = -[TSDStroke pathToStrokeFromCGPath:](self, "pathToStrokeFromCGPath:", objc_msgSend(v4, "CGPath"));
  if (v5 == (CGPath *)objc_msgSend(v4, "CGPath"))
  {
    v6 = (TSDBezierPath *)v4;
  }
  else
  {
    v6 = objc_alloc_init(TSDBezierPath);
    objc_msgSend(v4, "copyPathAttributesTo:", v6);
    +[TSDBezierPath bezierPathWithCGPath:](TSDBezierPath, "bezierPathWithCGPath:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSDBezierPath appendBezierPath:](v6, "appendBezierPath:", v7);

  }
  return v6;
}

- (CGRect)boundsForPath:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  objc_msgSend(a3, "boundsIncludingTSDStroke:", self);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (_TSDStrokeOutsets)outsets
{
  _BOOL4 v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  _TSDStrokeOutsets result;

  v3 = -[TSDStroke supportsWidth](self, "supportsWidth");
  v4 = 0.0;
  if (v3)
  {
    -[TSDStroke width](self, "width", 0.0);
    v4 = v5 * 0.5;
  }
  v6 = v4;
  v7 = v4;
  v8 = v4;
  result.var3 = v8;
  result.var2 = v7;
  result.var1 = v6;
  result.var0 = v4;
  return result;
}

- (void)i_setPropertiesFromStroke:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v4 = a3;
  if (objc_msgSend(v4, "isFrame"))
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDStroke i_setPropertiesFromStroke:]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDStroke.m");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, v7, 791, CFSTR("Setting properties for a TSDStroke from a TSDFrame"));

  }
  objc_msgSend(v4, "color");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSDStroke setI_color:](self, "setI_color:", v8);

  objc_msgSend(v4, "width");
  -[TSDStroke setI_width:](self, "setI_width:");
  -[TSDStroke setI_join:](self, "setI_join:", objc_msgSend(v4, "join"));
  objc_msgSend(v4, "miterLimit");
  -[TSDStroke setI_miterLimit:](self, "setI_miterLimit:");
  objc_msgSend(v4, "actualWidth");
  -[TSDStroke setI_actualWidth:](self, "setI_actualWidth:");
  objc_msgSend(v4, "pattern");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSDStroke i_setPattern:](self, "i_setPattern:", v9);

  v10 = objc_msgSend(v4, "cap");
  -[TSDStroke i_setCap:](self, "i_setCap:", v10);
}

- (void)i_setPatternPropertiesFromStroke:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  if (objc_msgSend(v4, "isFrame"))
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDStroke i_setPatternPropertiesFromStroke:]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDStroke.m");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, v7, 802, CFSTR("Setting properties for a TSDStroke from a TSDFrame"));

  }
  -[TSDStroke setI_join:](self, "setI_join:", objc_msgSend(v4, "join"));
  objc_msgSend(v4, "miterLimit");
  -[TSDStroke setI_miterLimit:](self, "setI_miterLimit:");
  objc_msgSend(v4, "pattern");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSDStroke i_setPattern:](self, "i_setPattern:", v8);

  v9 = objc_msgSend(v4, "cap");
  -[TSDStroke i_setCap:](self, "i_setCap:", v9);
}

- (void)applyToContext:(CGContext *)a3
{
  -[TSDStroke applyToContext:insideStroke:](self, "applyToContext:insideStroke:", a3, 0);
}

- (void)applyToContext:(CGContext *)a3 insideStroke:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  double width;
  CGLineCap cap[2];

  v4 = a4;
  -[TSDStroke colorForCGContext:](self, "colorForCGContext:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  CGContextSetStrokeColorWithColor(a3, (CGColorRef)objc_msgSend(v7, "CGColor"));
  width = self->_width;
  if (v4)
    width = width + width;
  CGContextSetLineWidth(a3, width);
  CGContextSetLineJoin(a3, (CGLineJoin)self->_join);
  CGContextSetMiterLimit(a3, self->_miterLimit);
  *(_QWORD *)cap = self->_cap;
  -[TSDStrokePattern i_applyToContext:lineWidth:capStyle:](self->_pattern, "i_applyToContext:lineWidth:capStyle:", a3, cap, self->_width * (self->_actualWidth / self->_width));
  CGContextSetLineCap(a3, cap[0]);

}

- (BOOL)isNullStroke
{
  return -[TSDStrokePattern patternType](self->_pattern, "patternType") == 2;
}

- (BOOL)shouldRender
{
  return self->_width > 0.0 && -[TSDStrokePattern patternType](self->_pattern, "patternType") != 2;
}

- (double)lineEndInsetAdjustment
{
  return 0.5;
}

- (id)strokeLineEnd:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && objc_msgSend(v4, "rangeOfString:", CFSTR(":")) != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v5, "substringFromIndex:", objc_msgSend(v5, "rangeOfString:", CFSTR(":")) + 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[TSDLineEnd lineEndWithIdentifier:](TSDLineEnd, "lineEndWithIdentifier:", v7);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = v3;
  }

  return v6;
}

- (id)colorForCGContext:(CGContext *)a3
{
  if ((TSDCGContextHasBackgroundsSuppressed((uint64_t)a3) & 1) != 0)
    objc_msgSend(MEMORY[0x24BEB3C40], "blackColor");
  else
    -[TSDStroke color](self, "color");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)paintRect:(CGRect)a3 inContext:(CGContext *)a4
{
  -[TSDStroke paintRect:wantsInteriorStroke:inContext:](self, "paintRect:wantsInteriorStroke:inContext:", 0, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)paintRect:(CGRect)a3 wantsInteriorStroke:(BOOL)a4 inContext:(CGContext *)a5
{
  _BOOL8 v6;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGPath *Mutable;
  CGRect v13;

  v6 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  Mutable = CGPathCreateMutable();
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  CGPathAddRect(Mutable, 0, v13);
  -[TSDStroke paintPath:wantsInteriorStroke:inContext:](self, "paintPath:wantsInteriorStroke:inContext:", Mutable, v6, a5);
  CGPathRelease(Mutable);
}

- (void)paintPath:(CGPath *)a3 inContext:(CGContext *)a4
{
  -[TSDStroke paintPath:wantsInteriorStroke:inContext:](self, "paintPath:wantsInteriorStroke:inContext:", a3, 0, a4);
}

- (void)paintPath:(CGPath *)a3 wantsInteriorStroke:(BOOL)a4 inContext:(CGContext *)a5
{
  -[TSDStroke paintPath:wantsInteriorStroke:inContext:useFastDrawing:parameterized:shouldReverseDrawOrder:](self, "paintPath:wantsInteriorStroke:inContext:useFastDrawing:parameterized:shouldReverseDrawOrder:", a3, a4, a5, 0, 0, 0);
}

- (void)paintPath:(CGPath *)a3 wantsInteriorStroke:(BOOL)a4 inContext:(CGContext *)a5 useFastDrawing:(BOOL)a6 parameterized:(BOOL)a7 shouldReverseDrawOrder:(BOOL)a8
{
  _BOOL8 v9;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  CGFloat v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v9 = a4;
  v32 = *MEMORY[0x24BDAC8D0];
  if (-[TSDStroke shouldRender](self, "shouldRender", a3, a4, a5, a6, a7, a8))
  {
    CGContextSaveGState(a5);
    if ((unint64_t)TSDPathGetSegmentCount(a3) > 0x9C40)
    {
      +[TSDBezierPath bezierPathWithCGPath:](TSDBezierPath, "bezierPathWithCGPath:", a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "pathSplitAtSubpathBoundariesWithSoftElementLimit:hardElementLimit:", 40000, 50000);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[TSDStroke color](self, "color");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "alphaComponent");
      v16 = v15;

      if (v16 >= 1.0)
      {
        -[TSDStroke applyToContext:insideStroke:](self, "applyToContext:insideStroke:", a5, v9);
      }
      else
      {
        -[TSDStroke color](self, "color");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "alphaComponent");
        CGContextSetAlpha(a5, v18);

        CGContextBeginTransparencyLayer(a5, 0);
        v19 = (void *)-[TSDStroke mutableCopy](self, "mutableCopy");
        objc_msgSend(v19, "color");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "colorWithAlphaComponent:", 1.0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setColor:", v21);

        objc_msgSend(v19, "applyToContext:insideStroke:", a5, v9);
      }
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v22 = v13;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v28;
        do
        {
          for (i = 0; i != v24; ++i)
          {
            if (*(_QWORD *)v28 != v25)
              objc_enumerationMutation(v22);
            -[TSDStroke p_strokePathChunk:inContext:wantsInteriorStroke:](self, "p_strokePathChunk:inContext:wantsInteriorStroke:", objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "CGPath", (_QWORD)v27), a5, v9);
          }
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        }
        while (v24);
      }

      if (v16 < 1.0)
        CGContextEndTransparencyLayer(a5);

    }
    else
    {
      -[TSDStroke applyToContext:insideStroke:](self, "applyToContext:insideStroke:", a5, v9);
      -[TSDStroke p_strokePathChunk:inContext:wantsInteriorStroke:](self, "p_strokePathChunk:inContext:wantsInteriorStroke:", a3, a5, v9);
    }
    CGContextRestoreGState(a5);
  }
}

- (void)p_strokePathChunk:(CGPath *)a3 inContext:(CGContext *)a4 wantsInteriorStroke:(BOOL)a5
{
  _BOOL4 v5;

  v5 = a5;
  CGContextSaveGState(a4);
  if (v5)
  {
    CGContextAddPath(a4, a3);
    CGContextClip(a4);
  }
  CGContextAddPath(a4, a3);
  CGContextStrokePath(a4);
  CGContextRestoreGState(a4);
}

- (void)paintLineEnd:(id)a3 atPoint:(CGPoint)a4 atAngle:(double)a5 withScale:(double)a6 inContext:(CGContext *)a7
{
  -[TSDStroke paintLineEnd:atPoint:atAngle:withScale:inContext:useFastDrawing:](self, "paintLineEnd:atPoint:atAngle:withScale:inContext:useFastDrawing:", a3, a7, 0, a4.x, a4.y, a5, a6);
}

- (void)paintLineEnd:(id)a3 atPoint:(CGPoint)a4 atAngle:(double)a5 withScale:(double)a6 inContext:(CGContext *)a7 useFastDrawing:(BOOL)a8
{
  CGFloat y;
  CGFloat x;
  id v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  CGAffineTransform v19;
  CGAffineTransform transform;
  CGAffineTransform v21;

  y = a4.y;
  x = a4.x;
  v14 = a3;
  CGContextSaveGState(a7);
  memset(&v21, 0, sizeof(v21));
  CGAffineTransformMakeTranslation(&v21, x, y);
  v19 = v21;
  CGAffineTransformScale(&transform, &v19, a6, a6);
  v21 = transform;
  v19 = transform;
  CGAffineTransformRotate(&transform, &v19, a5);
  v21 = transform;
  objc_msgSend(v14, "endPoint");
  v16 = -v15;
  objc_msgSend(v14, "endPoint");
  v19 = v21;
  CGAffineTransformTranslate(&transform, &v19, v16, -v17);
  v21 = transform;
  CGContextConcatCTM(a7, &transform);
  CGContextAddPath(a7, (CGPathRef)objc_msgSend(v14, "path"));
  if (objc_msgSend(v14, "isFilled"))
  {
    CGContextFillPath(a7);
  }
  else
  {
    -[TSDStroke width](self, "width");
    CGContextSetLineWidth(a7, v18 / a6);
    CGContextSetLineJoin(a7, (CGLineJoin)objc_msgSend(v14, "lineJoin"));
    CGContextStrokePath(a7);
  }
  CGContextRestoreGState(a7);

}

- (CGRect)boundsForLineEnd:(id)a3 atPoint:(CGPoint)a4 atAngle:(double)a5 withScale:(double)a6 transform:(CGAffineTransform *)a7
{
  CGFloat y;
  CGFloat x;
  id v13;
  double v14;
  CGFloat v15;
  double v16;
  __int128 v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGAffineTransform v31;
  CGAffineTransform t1;
  CGAffineTransform v33;
  CGAffineTransform v34;
  CGRect result;

  y = a4.y;
  x = a4.x;
  v13 = a3;
  memset(&v34, 0, sizeof(v34));
  CGAffineTransformMakeTranslation(&v34, x, y);
  t1 = v34;
  CGAffineTransformScale(&v33, &t1, a6, a6);
  v34 = v33;
  t1 = v33;
  CGAffineTransformRotate(&v33, &t1, a5);
  v34 = v33;
  objc_msgSend(v13, "endPoint");
  v15 = -v14;
  objc_msgSend(v13, "endPoint");
  t1 = v34;
  CGAffineTransformTranslate(&v33, &t1, v15, -v16);
  v34 = v33;
  t1 = v33;
  v17 = *(_OWORD *)&a7->c;
  *(_OWORD *)&v31.a = *(_OWORD *)&a7->a;
  *(_OWORD *)&v31.c = v17;
  *(_OWORD *)&v31.tx = *(_OWORD *)&a7->tx;
  CGAffineTransformConcat(&v33, &t1, &v31);
  v34 = v33;
  +[TSDBezierPath bezierPathWithCGPath:](TSDBezierPath, "bezierPathWithCGPath:", objc_msgSend(v13, "path"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v34;
  objc_msgSend(v18, "transformUsingAffineTransform:", &v33);
  if (objc_msgSend(v13, "isFilled"))
  {
    objc_msgSend(v18, "bounds");
  }
  else
  {
    -[TSDStroke width](self, "width");
    objc_msgSend(v18, "setLineWidth:");
    objc_msgSend(v18, "setLineJoinStyle:", (int)objc_msgSend(v13, "lineJoin"));
    objc_msgSend(v18, "boundsIncludingStroke");
  }
  v23 = v19;
  v24 = v20;
  v25 = v21;
  v26 = v22;

  v27 = v23;
  v28 = v24;
  v29 = v25;
  v30 = v26;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.y = v28;
  result.origin.x = v27;
  return result;
}

- (id)pathForLineEnd:(id)a3 wrapPath:(BOOL)a4 atPoint:(CGPoint)a5 atAngle:(double)a6 withScale:(double)a7
{
  CGFloat y;
  CGFloat x;
  _BOOL4 v11;
  id v13;
  double v14;
  CGFloat v15;
  double v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  CGAffineTransform v21;
  CGAffineTransform v22;
  CGAffineTransform v23;

  y = a5.y;
  x = a5.x;
  v11 = a4;
  v13 = a3;
  memset(&v23, 0, sizeof(v23));
  CGAffineTransformMakeTranslation(&v23, x, y);
  v21 = v23;
  CGAffineTransformScale(&v22, &v21, a7, a7);
  v23 = v22;
  v21 = v22;
  CGAffineTransformRotate(&v22, &v21, a6);
  v23 = v22;
  objc_msgSend(v13, "endPoint");
  v15 = -v14;
  objc_msgSend(v13, "endPoint");
  v21 = v23;
  CGAffineTransformTranslate(&v22, &v21, v15, -v16);
  v23 = v22;
  v17 = objc_msgSend(v13, "path");
  if (v11)
    v17 = objc_msgSend(v13, "wrapPath");
  +[TSDBezierPath bezierPathWithCGPath:](TSDBezierPath, "bezierPathWithCGPath:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v23;
  objc_msgSend(v18, "transformUsingAffineTransform:", &v22);
  if (objc_msgSend(v13, "isFilled"))
  {
    objc_msgSend(v18, "setLineWidth:", 0.0);
  }
  else
  {
    -[TSDStroke width](self, "width");
    objc_msgSend(v18, "setLineWidth:");
    objc_msgSend(v18, "setLineJoinStyle:", (int)objc_msgSend(v13, "lineJoin"));
    objc_msgSend(v18, "outlineStroke");
    v19 = objc_claimAutoreleasedReturnValue();

    v18 = (void *)v19;
  }

  return v18;
}

- (double)horizontalMarginForSwatch
{
  void *v2;
  int v3;
  double result;

  -[TSDStroke pattern](self, "pattern");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isRoundDash");

  result = 0.0;
  if (v3)
    return -3.0;
  return result;
}

- (void)drawSwatchInRect:(CGRect)a3 inContext:(CGContext *)a4
{
  double height;
  double width;
  double y;
  double x;
  double v10;
  double v11;
  float v12;
  CGFloat v13;
  CGFloat v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  CGFloat v23;
  double MidY;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  void *v29;
  double v30;
  CGFloat v31;
  CGPath *Mutable;
  CGFloat MinX;
  CGFloat v34;
  CGFloat MaxX;
  CGFloat v36;
  uint64_t v37;
  void *v38;
  CGFloat lengths[3];
  uint64_t v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v40 = *MEMORY[0x24BDAC8D0];
  -[TSDStroke horizontalMarginForSwatch](self, "horizontalMarginForSwatch");
  v11 = v10;
  if (-[TSDStroke isNullStroke](self, "isNullStroke"))
  {
    CGContextSaveGState(a4);
    v12 = (height + -35.0) * 0.5;
    v13 = y + floorf(v12) + 0.5;
    v14 = width + v11 * -2.0 + -1.0;
    -[TSDStroke color](self, "color");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    CGContextSetStrokeColorWithColor(a4, (CGColorRef)objc_msgSend(v15, "CGColor"));

    *(_OWORD *)lengths = xmmword_217C29330;
    CGContextSetLineWidth(a4, 1.0);
    CGContextSetLineDash(a4, 0.0, lengths, 2uLL);
    v41.origin.x = x + v11 + 0.5;
    v41.origin.y = v13;
    v41.size.width = v14;
    v41.size.height = 35.0;
    CGContextStrokeRect(a4, v41);
    CGContextRestoreGState(a4);
    -[TSDStroke color](self, "color");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    CGContextSetFillColorWithColor(a4, (CGColorRef)objc_msgSend(v16, "CGColor"));

    TSDBundle();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("None"), &stru_24D82FEB0, CFSTR("TSDrawables"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    UIGraphicsPushContext(a4);
    objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", 16.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = *MEMORY[0x24BDF65F8];
    v38 = v19;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "sizeWithAttributes:", v20);
    *(float *)&v21 = (v14 - v21) * 0.5;
    *(float *)&v22 = (35.0 - v22) * 0.5;
    objc_msgSend(v18, "drawAtPoint:withAttributes:", v20, x + v11 + 0.5 + floorf(*(float *)&v21), v13 + floorf(*(float *)&v22));
    UIGraphicsPopContext();

  }
  else
  {
    v42.origin.x = x;
    v42.origin.y = y;
    v42.size.width = width;
    v42.size.height = height;
    *(_QWORD *)&v23 = (unint64_t)CGRectInset(v42, v11, 0.0);
    v43.origin.x = x;
    v43.origin.y = y;
    v43.size.width = width;
    v43.size.height = height;
    MidY = CGRectGetMidY(v43);
    -[TSDStroke width](self, "width");
    v26 = MidY + v25 * -0.5;
    -[TSDStroke width](self, "width");
    v28 = v27;
    -[TSDStroke pattern](self, "pattern");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSDStroke width](self, "width");
    objc_msgSend(v29, "p_renderableLengthForUnclippedPatternWithLineWidth:withinAvailableLength:");
    v31 = v30;

    Mutable = CGPathCreateMutable();
    v44.origin.x = v23;
    v44.origin.y = v26;
    v44.size.width = v31;
    v44.size.height = v28;
    MinX = CGRectGetMinX(v44);
    v45.origin.x = v23;
    v45.origin.y = v26;
    v45.size.width = v31;
    v45.size.height = v28;
    v34 = CGRectGetMidY(v45);
    CGPathMoveToPoint(Mutable, 0, MinX, v34);
    v46.origin.x = v23;
    v46.origin.y = v26;
    v46.size.width = v31;
    v46.size.height = v28;
    MaxX = CGRectGetMaxX(v46);
    v47.origin.x = v23;
    v47.origin.y = v26;
    v47.size.width = v31;
    v47.size.height = v28;
    v36 = CGRectGetMidY(v47);
    CGPathAddLineToPoint(Mutable, 0, MaxX, v36);
    -[TSDStroke paintPath:inContext:](self, "paintPath:inContext:", Mutable, a4);
    CGPathRelease(Mutable);
  }
}

- (BOOL)supportsPattern
{
  return 1;
}

- (BOOL)supportsWidth
{
  return -[TSDStrokePattern patternType](self->_pattern, "patternType") != 2;
}

- (BOOL)supportsColor
{
  return -[TSDStrokePattern patternType](self->_pattern, "patternType") != 2;
}

- (BOOL)supportsLineOptions
{
  return 1;
}

- (double)suggestedMinimumLineWidth
{
  return 0.0;
}

- (BOOL)isFrame
{
  return 0;
}

- (BOOL)isNearlyWhite
{
  void *v4;
  char v5;

  if (-[TSDStroke isNullStroke](self, "isNullStroke"))
    return 0;
  -[TSDStroke color](self, "color");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isNearlyWhite");

  return v5;
}

- (BOOL)canApplyDirectlyToRepRenderable
{
  void *v3;
  int v4;
  void *v5;
  BOOL v6;
  BOOL v7;
  int v8;
  BOOL v9;

  if (!-[TSDStroke shouldRender](self, "shouldRender"))
    return 1;
  -[TSDStroke color](self, "color");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isOpaque");

  -[TSDStroke pattern](self, "pattern");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
    v6 = 1;
  else
    v6 = objc_msgSend(v5, "patternType") != 1;
  v8 = -[TSDStroke cap](self, "cap");
  v9 = (v8 | -[TSDStroke join](self, "join")) == 0;
  if (v6)
    v9 = 0;
  if (v4)
    v7 = v9;
  else
    v7 = 0;

  return v7;
}

- (void)applyToRepRenderable:(id)a3 withScale:(double)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  id v12;

  v12 = a3;
  if (!-[TSDStroke canApplyDirectlyToRepRenderable](self, "canApplyDirectlyToRepRenderable"))
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDStroke applyToRepRenderable:withScale:]");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDStroke.m");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, v8, 1115, CFSTR("Applying stroke with unsupported properties to renderable"));

  }
  if (-[TSDStroke shouldRender](self, "shouldRender"))
  {
    -[TSDStroke color](self, "color");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBorderColor:", objc_msgSend(v9, "CGColor"));

    -[TSDStroke width](self, "width");
    v11 = v10 * a4;
  }
  else
  {
    objc_msgSend(v12, "setBorderColor:", 0);
    v11 = 0.0;
  }
  objc_msgSend(v12, "setBorderWidth:", v11);

}

- (BOOL)canApplyToShapeRenderable
{
  if ((-[TSDStroke isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
    return 1;
  else
    return -[TSDStroke isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class());
}

- (void)applyToShapeRenderable:(id)a3 withScale:(double)a4
{
  -[TSDStroke applyToShapeRenderable:insideStroke:withScale:](self, "applyToShapeRenderable:insideStroke:withScale:", a3, 0, a4);
}

- (void)applyToShapeRenderable:(id)a3 insideStroke:(BOOL)a4 withScale:(double)a5
{
  _BOOL4 v6;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  float v12;
  void *v13;
  float v14;
  void *v15;
  id v16;

  v6 = a4;
  v16 = a3;
  if (!-[TSDStroke canApplyToShapeRenderable](self, "canApplyToShapeRenderable"))
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDStroke applyToShapeRenderable:insideStroke:withScale:]");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDStroke.m");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, v10, 1141, CFSTR("don't try to apply this stroke to a shape renderable"));

  }
  if (-[TSDStroke shouldRender](self, "shouldRender"))
  {
    -[TSDStroke width](self, "width");
    v12 = v11 * a5;
    -[TSDStroke color](self, "color");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setStrokeColor:", objc_msgSend(v13, "CGColor"));

    v14 = v12 + v12;
    if (!v6)
      v14 = v12;
    objc_msgSend(v16, "setLineWidth:", v14);
    -[TSDStroke miterLimit](self, "miterLimit");
    objc_msgSend(v16, "setMiterLimit:");
    objc_msgSend(v16, "setCGLineCap:", -[TSDStroke cap](self, "cap"));
    objc_msgSend(v16, "setCGLineJoin:", -[TSDStroke join](self, "join"));
    if (-[TSDStroke supportsPattern](self, "supportsPattern"))
    {
      -[TSDStroke pattern](self, "pattern");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "p_applyToShapeRenderable:lineWidth:", v16, v12);

    }
    else
    {
      objc_msgSend(v16, "setLineDashPattern:", 0);
    }
  }
  else
  {
    objc_msgSend(v16, "setStrokeColor:", 0);
  }

}

- (BOOL)drawsInOneStep
{
  return 1;
}

- (BOOL)shouldAntialiasDefeat
{
  return 1;
}

- (int64_t)mixingTypeWithObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;

  v4 = a3;
  objc_opt_class();
  TSUDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[TSDStroke pattern](self, "pattern");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pattern");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = TSDMixingTypeWithObjects((unint64_t)v6, (unint64_t)v7);
    v9 = TSDMixingTypeBestFromMixingTypes(4, v8);

    LODWORD(v6) = -[TSDStroke isNullStroke](self, "isNullStroke");
    if ((_DWORD)v6 != objc_msgSend(v5, "isNullStroke")
      || (v10 = -[TSDStroke shouldRender](self, "shouldRender"), v10 != objc_msgSend(v5, "shouldRender"))
      || (v11 = -[TSDStroke isFrame](self, "isFrame"), v11 != objc_msgSend(v5, "isFrame")))
    {
      v9 = TSDMixingTypeBestFromMixingTypes(v9, 2);
    }
    -[TSDStroke width](self, "width");
    v13 = v12;
    objc_msgSend(v5, "width");
    if (v13 != v14
      || (-[TSDStroke miterLimit](self, "miterLimit"), v16 = v15, objc_msgSend(v5, "miterLimit"), v16 != v17))
    {
      v9 = TSDMixingTypeBestFromMixingTypes(v9, 3);
    }
  }
  else
  {
    v9 = 3;
  }

  return v9;
}

- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4
{
  id v6;
  TSDStroke *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v14;
  TSDStroke *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  void *v27;
  double v28[5];

  v28[4] = *(double *)MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_opt_class();
  TSUDynamicCast();
  v7 = (TSDStroke *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_alloc((Class)objc_opt_class());
    -[TSDStroke color](self, "color");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSDStroke color](v7, "color");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v9;
    objc_msgSend(v9, "blendedColorWithFraction:ofColor:", v10, a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSDStroke width](self, "width");
    -[TSDStroke width](v7, "width");
    TSUMix();
    v13 = v12;
    if (a3 >= 0.5)
    {
      v14 = -[TSDStroke cap](v7, "cap");
      v15 = v7;
    }
    else
    {
      v14 = -[TSDStroke cap](self, "cap");
      v15 = self;
    }
    v21 = -[TSDStroke join](v15, "join");
    -[TSDStroke pattern](self, "pattern");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSDStroke pattern](v7, "pattern");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    TSDMixingMixedObjectWithFractionEx(v22, (unint64_t)v23, a3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSDStroke miterLimit](self, "miterLimit");
    -[TSDStroke miterLimit](v7, "miterLimit");
    TSUMix();
    v16 = (void *)objc_msgSend(v8, "initWithColor:width:cap:join:pattern:miterLimit:", v11, v14, v21, v24, v13, v25);

  }
  else
  {
    v16 = (void *)-[TSDStroke mutableCopy](self, "mutableCopy");
    -[TSDStroke color](self, "color");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "getRGBAComponents:", v28);

    objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", v28[0], v28[1], v28[2], 0.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSDStroke color](self, "color");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "blendedColorWithFraction:ofColor:", v19, a3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setI_color:", v20);

  }
  return v16;
}

+ (BOOL)canMixWithNilObjects
{
  return 1;
}

- (id)strokeByTransformingByTransform:(CGAffineTransform *)a3
{
  double v3;
  void *v4;
  double v5;

  v3 = fmin(a3->a, a3->d);
  v4 = (void *)-[TSDStroke mutableCopy](self, "mutableCopy");
  objc_msgSend(v4, "width");
  objc_msgSend(v4, "setWidth:", fmax(floor(v3 * v5), 0.25));
  return v4;
}

- (TSUColor)i_color
{
  return self->_color;
}

- (void)setI_color:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (double)i_width
{
  return self->_width;
}

- (void)setI_width:(double)a3
{
  self->_width = a3;
}

- (int)i_cap
{
  return self->_cap;
}

- (int)i_join
{
  return self->_join;
}

- (void)setI_join:(int)a3
{
  self->_join = a3;
}

- (double)i_miterLimit
{
  return self->_miterLimit;
}

- (void)setI_miterLimit:(double)a3
{
  self->_miterLimit = a3;
}

- (TSDStrokePattern)i_pattern
{
  return self->_pattern;
}

- (double)i_actualWidth
{
  return self->_actualWidth;
}

- (void)setI_actualWidth:(double)a3
{
  self->_actualWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pattern, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

+ (int64_t)indexOfStroke:(id)a3 strokeArray:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  char v21;
  int64_t v22;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_opt_class();
  TSUDynamicCast();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "strokeName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(v5, "pattern");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (!v11)
  {
    v22 = -1;
    goto LABEL_21;
  }
  v12 = v11;
  v24 = v8;
  v25 = v5;
  v13 = 0;
  v14 = *(_QWORD *)v29;
  while (2)
  {
    v15 = 0;
    v26 = v13 + v12;
    do
    {
      if (*(_QWORD *)v29 != v14)
        objc_enumerationMutation(v10);
      v16 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v15);
      objc_opt_class();
      TSUDynamicCast();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v9 && v17)
      {
        objc_msgSend(v17, "strokeName");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v9, "isEqualToString:", v19);
      }
      else
      {
        if (v9)
          goto LABEL_15;
        objc_msgSend(v16, "pattern");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v27, "isEqual:", v19);
      }
      v21 = v20;

      if ((v21 & 1) != 0)
      {

        v22 = v13 + v15;
        goto LABEL_19;
      }
LABEL_15:

      ++v15;
    }
    while (v12 != v15);
    v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    v13 = v26;
    if (v12)
      continue;
    break;
  }
  v22 = -1;
LABEL_19:
  v8 = v24;
  v5 = v25;
LABEL_21:

  return v22;
}

+ (id)editedStrokeFromModelStroke:(id)a3 selectedStroke:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  if ((objc_msgSend(v5, "isFrame") & 1) == 0)
    objc_msgSend(v7, "setPropertiesFromStroke:", v5);
  objc_msgSend(v7, "width");
  v9 = v8;
  objc_msgSend(v7, "suggestedMinimumLineWidth");
  if (v9 < v10)
  {
    objc_msgSend(v7, "suggestedMinimumLineWidth");
    objc_msgSend(v7, "setWidth:");
  }
  objc_msgSend(v7, "setPatternPropertiesFromStroke:", v6);

  return v7;
}

- (BOOL)dontClearBackground
{
  return objc_msgSend(objc_getAssociatedObject(self, "TSTStrokeAssociatedObject"), "dontClearBackground");
}

- (BOOL)empty
{
  return !-[TSDStroke pattern](self, "pattern")
      || -[TSDStrokePattern patternType](-[TSDStroke pattern](self, "pattern"), "patternType") == 2;
}

- (BOOL)solid
{
  return !-[TSDStroke pattern](self, "pattern")
      || -[TSDStrokePattern patternType](-[TSDStroke pattern](self, "pattern"), "patternType") == 1;
}

- (BOOL)isEqualToStroke:(id)a3
{
  int v5;
  BOOL result;

  result = 0;
  if (-[TSDStroke isEqual:](self, "isEqual:"))
  {
    v5 = -[TSDStroke dontClearBackground](self, "dontClearBackground");
    if (v5 == objc_msgSend(a3, "dontClearBackground"))
      return 1;
  }
  return result;
}

@end
