@implementation TUISystemInputAssistantLayoutViewSet

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewSetContainer, 0);
  objc_storeStrong((id *)&self->_centerView, 0);
  objc_storeStrong((id *)&self->_unifiedButtonBar, 0);
  objc_storeStrong((id *)&self->_rightButtonBar, 0);
  objc_storeStrong((id *)&self->_leftButtonBar, 0);
}

- (TUIAssistantButtonBarView)leftButtonBar
{
  return self->_leftButtonBar;
}

- (TUIAssistantButtonBarView)rightButtonBar
{
  return self->_rightButtonBar;
}

- (UIView)centerView
{
  return self->_centerView;
}

- (void)setViewSetContainer:(id)a3
{
  objc_storeStrong((id *)&self->_viewSetContainer, a3);
}

- (void)setUnifiedButtonBar:(id)a3
{
  objc_storeStrong((id *)&self->_unifiedButtonBar, a3);
}

- (void)setRightButtonBar:(id)a3
{
  objc_storeStrong((id *)&self->_rightButtonBar, a3);
}

- (void)setLeftButtonBar:(id)a3
{
  objc_storeStrong((id *)&self->_leftButtonBar, a3);
}

- (void)setCenterView:(id)a3
{
  objc_storeStrong((id *)&self->_centerView, a3);
}

- (TUIAssistantButtonBarView)unifiedButtonBar
{
  return self->_unifiedButtonBar;
}

- (UIView)viewSetContainer
{
  return self->_viewSetContainer;
}

@end
