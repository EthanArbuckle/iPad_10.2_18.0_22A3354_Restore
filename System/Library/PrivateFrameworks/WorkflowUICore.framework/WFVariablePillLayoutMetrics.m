@implementation WFVariablePillLayoutMetrics

- (WFVariablePillLayoutMetrics)initWithName:(id)a3 icon:(id)a4 font:(id)a5 height:(double)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;

  v9 = sub_227101370();
  v11 = v10;
  v12 = a4;
  v13 = a5;
  return (WFVariablePillLayoutMetrics *)VariablePillLayoutMetrics.init(name:icon:font:height:)(a6, v9, v11, a4, a5);
}

- (double)totalWidth
{
  return sub_227087644();
}

- (WFVariablePillLayoutMetrics)init
{
  VariablePillLayoutMetrics.init()();
}

- (void).cxx_destruct
{

}

@end
