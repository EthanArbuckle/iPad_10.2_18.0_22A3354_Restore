@implementation _SBUIWidgetViewController

- (_SBUIWidgetHost)widgetHost
{
  void *WeakRetained;
  void *v4;
  _SBUIWidgetHost *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_widgetHost);
  v4 = WeakRetained;
  if (!WeakRetained)
    WeakRetained = self;
  v5 = WeakRetained;

  return v5;
}

- (CGSize)preferredViewSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x1E0C9D820];
  v3 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (NSString)widgetIdentifier
{
  return self->_widgetIdentifier;
}

- (void)setWidgetIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 968);
}

- (void)setWidgetHost:(id)a3
{
  objc_storeWeak((id *)&self->_widgetHost, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_widgetHost);
  objc_storeStrong((id *)&self->_widgetIdentifier, 0);
}

@end
