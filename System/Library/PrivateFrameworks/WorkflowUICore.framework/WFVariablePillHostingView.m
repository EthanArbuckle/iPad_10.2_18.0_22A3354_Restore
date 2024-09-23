@implementation WFVariablePillHostingView

- (WFVariablePillHostingView)initWithName:(id)a3 icon:(id)a4 font:(id)a5 available:(BOOL)a6 height:(double)a7 controlState:(unint64_t)a8
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;

  v13 = sub_227101370();
  v15 = v14;
  v16 = a4;
  v17 = a5;
  return (WFVariablePillHostingView *)sub_22704A6C0(v13, v15, a4, a5, a6, a8, a7);
}

- (WFVariablePillHostingView)initWithCoder:(id)a3
{
  sub_22704A97C();
}

- (WFVariablePillHostingView)initWithFrame:(CGRect)a3
{
  sub_22704A9E0();
}

@end
