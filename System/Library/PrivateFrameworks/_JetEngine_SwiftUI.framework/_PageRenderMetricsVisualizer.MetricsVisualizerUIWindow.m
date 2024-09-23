@implementation _PageRenderMetricsVisualizer.MetricsVisualizerUIWindow

- (BOOL)canBecomeKeyWindow
{
  return 0;
}

- (_TtCC18_JetEngine_SwiftUI28_PageRenderMetricsVisualizer25MetricsVisualizerUIWindow)initWithWindowScene:(id)a3
{
  id v4;
  _TtCC18_JetEngine_SwiftUI28_PageRenderMetricsVisualizer25MetricsVisualizerUIWindow *v5;
  double v6;
  _TtCC18_JetEngine_SwiftUI28_PageRenderMetricsVisualizer25MetricsVisualizerUIWindow *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType();
  v4 = a3;
  v5 = -[_PageRenderMetricsVisualizer.MetricsVisualizerUIWindow initWithWindowScene:](&v9, sel_initWithWindowScene_, v4);
  v6 = *MEMORY[0x24BEBE9E8];
  v7 = v5;
  -[_PageRenderMetricsVisualizer.MetricsVisualizerUIWindow setWindowLevel:](v7, sel_setWindowLevel_, v6, v9.receiver, v9.super_class);
  -[_PageRenderMetricsVisualizer.MetricsVisualizerUIWindow setUserInteractionEnabled:](v7, sel_setUserInteractionEnabled_, 0);

  return v7;
}

- (_TtCC18_JetEngine_SwiftUI28_PageRenderMetricsVisualizer25MetricsVisualizerUIWindow)initWithCoder:(id)a3
{
  _TtCC18_JetEngine_SwiftUI28_PageRenderMetricsVisualizer25MetricsVisualizerUIWindow *result;

  result = (_TtCC18_JetEngine_SwiftUI28_PageRenderMetricsVisualizer25MetricsVisualizerUIWindow *)sub_20E4A6290();
  __break(1u);
  return result;
}

- (void)hideDebugUIWindow
{
  -[_PageRenderMetricsVisualizer.MetricsVisualizerUIWindow setHidden:](self, sel_setHidden_, 1);
}

- (_TtCC18_JetEngine_SwiftUI28_PageRenderMetricsVisualizer25MetricsVisualizerUIWindow)initWithFrame:(CGRect)a3
{
  _TtCC18_JetEngine_SwiftUI28_PageRenderMetricsVisualizer25MetricsVisualizerUIWindow *result;

  result = (_TtCC18_JetEngine_SwiftUI28_PageRenderMetricsVisualizer25MetricsVisualizerUIWindow *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
