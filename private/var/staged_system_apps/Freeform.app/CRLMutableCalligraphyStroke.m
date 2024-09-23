@implementation CRLMutableCalligraphyStroke

- (CRLColor)color
{
  return -[CRLStroke i_color](self, "i_color");
}

- (double)actualWidth
{
  double result;

  -[CRLStroke i_actualWidth](self, "i_actualWidth");
  return result;
}

- (unint64_t)join
{
  return -[CRLStroke i_join](self, "i_join");
}

- (double)miterLimit
{
  double result;

  -[CRLStroke i_miterLimit](self, "i_miterLimit");
  return result;
}

- (CRLStrokePattern)pattern
{
  return -[CRLStroke i_pattern](self, "i_pattern");
}

- (void)setWidth:(double)a3
{
  -[CRLStroke i_setWidth:](self, "i_setWidth:");
  -[CRLStroke i_setActualWidth:](self, "i_setActualWidth:", a3);
}

- (void)setPropertiesFromStroke:(id)a3
{
  -[CRLStroke i_setPropertiesFromStroke:](self, "i_setPropertiesFromStroke:", a3);
}

- (void)setPatternPropertiesFromStroke:(id)a3
{
  -[CRLStroke i_setPatternPropertiesFromStroke:](self, "i_setPatternPropertiesFromStroke:", a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  CRLCalligraphyStroke *v4;
  void *v5;
  double v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  double v11;
  CRLCalligraphyStroke *v12;

  v4 = +[CRLCalligraphyStroke allocWithZone:](CRLCalligraphyStroke, "allocWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMutableCalligraphyStroke color](self, "color"));
  -[CRLMutableCalligraphyStroke width](self, "width");
  v7 = v6;
  v8 = -[CRLMutableCalligraphyStroke cap](self, "cap");
  v9 = -[CRLMutableCalligraphyStroke join](self, "join");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMutableCalligraphyStroke pattern](self, "pattern"));
  -[CRLMutableCalligraphyStroke miterLimit](self, "miterLimit");
  v12 = -[CRLCalligraphyStroke initWithColor:width:cap:join:pattern:miterLimit:](v4, "initWithColor:width:cap:join:pattern:miterLimit:", v5, v8, v9, v10, v7, v11);

  return v12;
}

@end
