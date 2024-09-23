@implementation ARUIRingGroup

- (CGPoint)center
{
  ARUIRingGroup *v2;
  float v3;
  double v4;
  float v5;
  double v6;
  double v7;
  float v8;
  CGPoint result;

  v2 = self;
  -[ARUIRingGroup translation](v2, "translation");
  v4 = v3;
  -[ARUIRingGroup translation](v2, "translation");
  v8 = v5;

  v6 = v8;
  v7 = v4;
  result.y = v6;
  result.x = v7;
  return result;
}

- (void)setCenter:(CGPoint)a3
{
  CGFloat y;

  y = a3.y;
  -[ARUIRingGroup setTranslation:](self, "setTranslation:", COERCE_DOUBLE(vcvt_f32_f64((float64x2_t)a3)));
}

@end
