@implementation UIWindowSceneGeometryPreferencesMac

+ (double)defaultSystemFrameAnimationDuration
{
  return 0.25;
}

+ (int64_t)defaultSystemFrameAnimationCurve
{
  return 5;
}

- (UIWindowSceneGeometryPreferencesMac)init
{
  UIWindowSceneGeometryPreferencesMac *result;
  CGSize v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIWindowSceneGeometryPreferencesMac;
  result = -[UIWindowSceneGeometryPreferences _init](&v4, sel__init);
  if (result)
  {
    v3 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    result->_systemFrame.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    result->_systemFrame.size = v3;
  }
  return result;
}

- (UIWindowSceneGeometryPreferencesMac)initWithSystemFrame:(CGRect)systemFrame
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  UIWindowSceneGeometryPreferencesMac *result;

  height = systemFrame.size.height;
  width = systemFrame.size.width;
  y = systemFrame.origin.y;
  x = systemFrame.origin.x;
  result = -[UIWindowSceneGeometryPreferencesMac init](self, "init");
  if (result)
  {
    result->_systemFrame.origin.x = x;
    result->_systemFrame.origin.y = y;
    result->_systemFrame.size.width = width;
    result->_systemFrame.size.height = height;
  }
  return result;
}

- (int64_t)_type
{
  return 1;
}

- (unint64_t)hash
{
  int8x16_t v2;

  v2 = veorq_s8((int8x16_t)vcvtq_u64_f64((float64x2_t)self->_systemFrame.origin), (int8x16_t)vcvtq_u64_f64((float64x2_t)self->_systemFrame.size));
  return (unint64_t)veor_s8(*(int8x8_t *)v2.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v2, v2, 8uLL));
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  BOOL v9;
  objc_super v11;
  CGRect v12;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UIWindowSceneGeometryPreferencesMac;
  if (-[UIWindowSceneGeometryPreferences isEqual:](&v11, sel_isEqual_, v4))
  {
    objc_msgSend(v4, "systemFrame");
    v12.origin.x = v5;
    v12.origin.y = v6;
    v12.size.width = v7;
    v12.size.height = v8;
    v9 = CGRectEqualToRect(self->_systemFrame, v12);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (CGRect)systemFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_systemFrame.origin.x;
  y = self->_systemFrame.origin.y;
  width = self->_systemFrame.size.width;
  height = self->_systemFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSystemFrame:(CGRect)systemFrame
{
  self->_systemFrame = systemFrame;
}

@end
