@implementation CRLMutableBrushStroke

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
  CRLBrushStroke *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  double v12;
  CRLBrushStroke *v13;

  v4 = [CRLBrushStroke alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLSmartStroke strokeName](self, "strokeName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMutableBrushStroke color](self, "color"));
  -[CRLMutableBrushStroke width](self, "width");
  v8 = v7;
  v9 = -[CRLMutableBrushStroke cap](self, "cap");
  v10 = -[CRLMutableBrushStroke join](self, "join");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMutableBrushStroke pattern](self, "pattern"));
  -[CRLMutableBrushStroke miterLimit](self, "miterLimit");
  v13 = -[CRLBrushStroke initWithName:color:width:cap:join:pattern:miterLimit:](v4, "initWithName:color:width:cap:join:pattern:miterLimit:", v5, v6, v9, v10, v11, v8, v12);

  return v13;
}

@end
