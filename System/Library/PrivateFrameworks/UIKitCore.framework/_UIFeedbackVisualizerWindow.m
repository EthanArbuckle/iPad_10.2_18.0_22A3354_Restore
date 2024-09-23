@implementation _UIFeedbackVisualizerWindow

- (_UIFeedbackVisualizerWindow)initWithWindowScene:(id)a3
{
  _UIFeedbackVisualizerWindow *v3;
  uint64_t v4;
  NSMapTable *engineLayers;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIFeedbackVisualizerWindow;
  v3 = -[UIWindow initWithWindowScene:](&v7, sel_initWithWindowScene_, a3);
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v4 = objc_claimAutoreleasedReturnValue();
  engineLayers = v3->_engineLayers;
  v3->_engineLayers = (NSMapTable *)v4;

  return v3;
}

- (BOOL)isInternalWindow
{
  return 1;
}

- (NSMapTable)engineLayers
{
  return self->_engineLayers;
}

- (void)setEngineLayers:(id)a3
{
  objc_storeStrong((id *)&self->_engineLayers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_engineLayers, 0);
}

@end
