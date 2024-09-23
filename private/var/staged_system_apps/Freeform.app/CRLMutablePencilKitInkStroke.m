@implementation CRLMutablePencilKitInkStroke

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
  CRLPencilKitInkStroke *v4;
  void *v5;
  void *v6;
  CRLPencilKitInkStroke *v7;

  v4 = [CRLPencilKitInkStroke alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPencilKitInkStroke inkType](self, "inkType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMutablePencilKitInkStroke color](self, "color"));
  -[CRLMutablePencilKitInkStroke width](self, "width");
  v7 = -[CRLPencilKitInkStroke initWithInkType:color:adjustedWidth:](v4, "initWithInkType:color:adjustedWidth:", v5, v6);

  return v7;
}

@end
