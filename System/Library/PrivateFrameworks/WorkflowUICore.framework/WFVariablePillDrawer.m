@implementation WFVariablePillDrawer

+ (id)drawVariableNamed:(id)a3 icon:(id)a4 font:(id)a5 tint:(id)a6 size:(CGSize)a7 state:(unint64_t)a8 isAvailable:(BOOL)a9
{
  return +[VariablePillDrawer drawVariableNamed:icon:font:tint:size:state:isAvailable:](_TtC14WorkflowUICore18VariablePillDrawer, "drawVariableNamed:icon:font:tint:size:state:isAvailable:", a3, a4, a5, a6, a8, a9, a7.width, a7.height);
}

+ (void)drawVariableForAppIconNamed:(id)a3 icon:(id)a4 font:(id)a5 tint:(id)a6 size:(CGSize)a7 state:(unint64_t)a8 isAvailable:(BOOL)a9 completion:(id)a10
{
  +[VariablePillDrawer drawVariableForAppIconNamed:appIcon:font:tint:size:state:isAvailable:completionBlock:](_TtC14WorkflowUICore18VariablePillDrawer, "drawVariableForAppIconNamed:appIcon:font:tint:size:state:isAvailable:completionBlock:", a3, a4, a5, a6, a8, a9, a7.width, a7.height);
}

@end
