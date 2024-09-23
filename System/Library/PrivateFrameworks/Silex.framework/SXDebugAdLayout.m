@implementation SXDebugAdLayout

- (SXDebugAdLayout)initWithMargin:(_SXConvertibleValue)a3
{
  unint64_t unit;
  double value;
  SXDebugAdLayout *v5;
  SXAutoPlacementMargin *v6;
  SXEdgeSpacing *margin;
  objc_super v9;

  unit = a3.unit;
  value = a3.value;
  v9.receiver = self;
  v9.super_class = (Class)SXDebugAdLayout;
  v5 = -[SXDebugAdLayout init](&v9, sel_init);
  if (v5)
  {
    v6 = -[SXAutoPlacementMargin initWithTop:bottom:]([SXAutoPlacementMargin alloc], "initWithTop:bottom:", *(_QWORD *)&value, unit, *(_QWORD *)&value, unit);
    margin = v5->_margin;
    v5->_margin = (SXEdgeSpacing *)v6;

  }
  return v5;
}

- (SXEdgeSpacing)margin
{
  return self->_margin;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_margin, 0);
}

@end
