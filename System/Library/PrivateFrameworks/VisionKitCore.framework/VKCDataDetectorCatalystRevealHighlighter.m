@implementation VKCDataDetectorCatalystRevealHighlighter

- (VKCDataDetectorCatalystRevealHighlighterDelegate)delegate
{
  return (VKCDataDetectorCatalystRevealHighlighterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (VKCDataDetectorElementView)elementView
{
  return (VKCDataDetectorElementView *)objc_loadWeakRetained((id *)&self->_elementView);
}

- (void)setElementView:(id)a3
{
  objc_storeWeak((id *)&self->_elementView, a3);
}

- (BOOL)highlighting
{
  return self->_highlighting;
}

- (void)setHighlighting:(BOOL)a3
{
  self->_highlighting = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_elementView);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
