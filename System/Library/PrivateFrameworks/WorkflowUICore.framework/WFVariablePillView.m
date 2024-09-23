@implementation WFVariablePillView

- (WFVariablePillView)initWithName:(id)a3 icon:(id)a4 font:(id)a5 available:(BOOL)a6 height:(double)a7 controlState:(unint64_t)a8
{
  _BOOL8 v10;
  id v14;
  id v15;
  id v16;
  WFVariablePillView *v17;
  WFVariablePillHostingView *v18;
  WFVariablePillView *v19;
  objc_super v21;

  v10 = a6;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v21.receiver = self;
  v21.super_class = (Class)WFVariablePillView;
  v17 = -[WFVariablePillView initWithFrame:](&v21, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  if (v17)
  {
    v18 = -[WFVariablePillHostingView initWithName:icon:font:available:height:controlState:]([WFVariablePillHostingView alloc], "initWithName:icon:font:available:height:controlState:", v14, v15, v16, v10, a8, a7);
    -[WFVariablePillHostingView setTranslatesAutoresizingMaskIntoConstraints:](v18, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
    -[WFVariablePillHostingView setAutoresizingMask:](v18, "setAutoresizingMask:", 18);
    -[WFVariablePillView addSubview:](v17, "addSubview:", v18);
    v19 = v17;

  }
  return v17;
}

+ (double)widthForVariableViewWithName:(id)a3 icon:(id)a4 font:(id)a5 height:(double)a6
{
  id v9;
  id v10;
  id v11;
  WFVariablePillLayoutMetrics *v12;
  double v13;
  double v14;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = -[WFVariablePillLayoutMetrics initWithName:icon:font:height:]([WFVariablePillLayoutMetrics alloc], "initWithName:icon:font:height:", v11, v10, v9, a6);

  -[WFVariablePillLayoutMetrics totalWidth](v12, "totalWidth");
  v14 = v13;

  return v14;
}

@end
