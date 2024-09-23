@implementation _UIMotionAnalyzer

- (_UIMotionAnalyzerSettings)settings
{
  return self->_settings;
}

- (_UIViewerRelativeDevicePose)viewerRelativeDevicePose
{
  return self->_viewerRelativeDevicePose;
}

- (_UIMotionAnalyzer)initWithSettings:(id)a3
{
  id v5;
  _UIMotionAnalyzer *v6;
  _UIMotionAnalyzer *v7;
  _UIViewerRelativeDevicePose *v8;
  _UIViewerRelativeDevicePose *viewerRelativeDevicePose;
  _UIMotionAnalyzer *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UIMotionAnalyzer;
  v6 = -[_UIMotionAnalyzer init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_settings, a3);
    v8 = objc_alloc_init(_UIViewerRelativeDevicePose);
    viewerRelativeDevicePose = v7->_viewerRelativeDevicePose;
    v7->_viewerRelativeDevicePose = v8;

    v10 = v7;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewerRelativeDevicePose, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

- (_UIMotionAnalyzer)init
{
  _UIMotionAnalyzerSettings *v3;
  _UIMotionAnalyzer *v4;

  v3 = objc_alloc_init(_UIMotionAnalyzerSettings);
  v4 = -[_UIMotionAnalyzer initWithSettings:](self, "initWithSettings:", v3);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  _UIMotionAnalyzerSettings *settings;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  settings = self->_settings;
  -[_UIMotionAnalyzer viewerRelativeDevicePose](self, "viewerRelativeDevicePose");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p settings=%@ viewerRelativeDevicePose=%@>"), v5, self, settings, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)applyHysteresisWithReceivedEventTimestamp:(double)a3 timeSinceLastNewMotionEvent:(double)a4 slowUpdatesEnabled:(BOOL)a5 returningShouldToggleSlowUpdates:(BOOL *)a6 logger:(id)a7
{
  return 0;
}

@end
