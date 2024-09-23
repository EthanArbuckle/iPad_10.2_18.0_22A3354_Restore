@implementation PTRenderDebugLayer

- (PTRenderDebugLayer)initWithMetalContext:(id)a3 renderEffects:(id)a4
{
  PTRenderDebugLayer *v4;
  PTRenderDebugLayer *v5;
  PTRenderDebugLayer *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PTRenderDebugLayer;
  v4 = -[PTRenderDebugLayer init](&v8, sel_init, a3, a4);
  v5 = v4;
  if (v4)
    v6 = v4;

  return v5;
}

- (double)getBiasedDisparityVisualizationRange:
{
  return 0.0;
}

@end
