@implementation PLActionButtonsPresentingView

- (PLActionButtonsPresentingView)initWithActionButtonsView:(id)a3 interfaceEdge:(unint64_t)a4 layoutLocation:(unint64_t)a5
{
  id v9;
  PLActionButtonsPresentingView *v10;
  PLActionButtonsPresentingView *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PLActionButtonsPresentingView;
  v10 = -[PLActionButtonsPresentingView initWithFrame:](&v13, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_actionButtonsView, a3);
    v11->_interfaceEdge = a4;
    v11->_layoutLocation = a5;
    v11->_defaultActionTriggered = 0;
    -[PLActionButtonsPresentingView addSubview:](v11, "addSubview:", v11->_actionButtonsView);
    -[PLActionButtonsPresentingView setClipsToBounds:](v11, "setClipsToBounds:", 1);
    -[PLActionButtonsPresentingView setAlpha:](v11, "setAlpha:", 0.0);
    -[PLActionButtonsPresentingView setUserInteractionEnabled:](v11, "setUserInteractionEnabled:", 1);
    -[PLActionButtonsPresentingView _setContinuousCornerRadius:](v11, "_setContinuousCornerRadius:", 13.0);
  }

  return v11;
}

- (PLPlatterActionButtonsView)actionButtonsView
{
  return self->_actionButtonsView;
}

- (void)setActionButtonsView:(id)a3
{
  objc_storeStrong((id *)&self->_actionButtonsView, a3);
}

- (unint64_t)interfaceEdge
{
  return self->_interfaceEdge;
}

- (void)setInterfaceEdge:(unint64_t)a3
{
  self->_interfaceEdge = a3;
}

- (unint64_t)layoutLocation
{
  return self->_layoutLocation;
}

- (void)setLayoutLocation:(unint64_t)a3
{
  self->_layoutLocation = a3;
}

- (BOOL)defaultActionTriggered
{
  return self->_defaultActionTriggered;
}

- (void)setDefaultActionTriggered:(BOOL)a3
{
  self->_defaultActionTriggered = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionButtonsView, 0);
}

@end
