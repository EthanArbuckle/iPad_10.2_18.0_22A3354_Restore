@implementation WFSiriExecutionMetrics

- (WFSiriExecutionMetrics)init
{
  WFSiriExecutionMetrics *v2;
  WFSiriExecutionMetrics *v3;
  WFSiriExecutionMetrics *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFSiriExecutionMetrics;
  v2 = -[WFSiriExecutionMetrics init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_siriInteractionCount = 0;
    v2->_shortcutActionCount = 0;
    v4 = v2;
  }

  return v3;
}

- (unint64_t)shortcutActionCount
{
  return self->_shortcutActionCount;
}

- (void)setShortcutActionCount:(unint64_t)a3
{
  self->_shortcutActionCount = a3;
}

- (unint64_t)currentShortcutStep
{
  return self->_currentShortcutStep;
}

- (void)setCurrentShortcutStep:(unint64_t)a3
{
  self->_currentShortcutStep = a3;
}

- (unint64_t)siriInteractionCount
{
  return self->_siriInteractionCount;
}

- (void)setSiriInteractionCount:(unint64_t)a3
{
  self->_siriInteractionCount = a3;
}

@end
