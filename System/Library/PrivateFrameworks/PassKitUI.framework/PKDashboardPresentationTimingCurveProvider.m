@implementation PKDashboardPresentationTimingCurveProvider

- (int64_t)timingCurveType
{
  return self->_type == 0;
}

- (UICubicTimingParameters)cubicTimingParameters
{
  unint64_t type;
  id v3;
  void *v4;

  type = self->_type;
  v3 = objc_alloc(MEMORY[0x1E0DC36D8]);
  if (type)
    v4 = (void *)objc_msgSend(v3, "initWithAnimationCurve:", 2);
  else
    v4 = (void *)objc_msgSend(v3, "initWithControlPoint1:controlPoint2:", 0.4, 0.0, 0.6, 1.0);
  return (UICubicTimingParameters *)v4;
}

- (UISpringTimingParameters)springTimingParameters
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInteger:forKey:", self->_type, CFSTR("type"));
}

- (PKDashboardPresentationTimingCurveProvider)initWithCoder:(id)a3
{
  id v4;
  PKDashboardPresentationTimingCurveProvider *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PKDashboardPresentationTimingCurveProvider;
  v5 = -[PKDashboardPresentationTimingCurveProvider init](&v7, sel_init);
  if (v5)
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = -[PKDashboardPresentationTimingCurveProvider init](+[PKDashboardPresentationTimingCurveProvider allocWithZone:](PKDashboardPresentationTimingCurveProvider, "allocWithZone:", a3), "init");
  *((_QWORD *)result + 2) = self->_type;
  return result;
}

- (double)fractionComplete
{
  return self->_fractionComplete;
}

- (void)setFractionComplete:(double)a3
{
  self->_fractionComplete = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

@end
