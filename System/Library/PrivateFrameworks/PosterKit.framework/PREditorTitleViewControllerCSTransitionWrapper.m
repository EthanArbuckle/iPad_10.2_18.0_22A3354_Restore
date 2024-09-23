@implementation PREditorTitleViewControllerCSTransitionWrapper

- (PREditorTitleViewControllerCSTransitionWrapper)initWithCSTransitioning:(id)a3
{
  id v5;
  PREditorTitleViewControllerCSTransitionWrapper *v6;
  PREditorTitleViewControllerCSTransitionWrapper *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PREditorTitleViewControllerCSTransitionWrapper;
  v6 = -[PREditorTitleViewControllerCSTransitionWrapper init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_csTransitioning, a3);

  return v7;
}

- (void)updateInteractiveTransition:(double)a3
{
  -[CSProminentDisplayTransitioning updateInteractiveTransition:](self->_csTransitioning, "updateInteractiveTransition:", a3);
}

- (void)finishInteractiveTransition
{
  -[CSProminentDisplayTransitioning finishInteractiveTransition](self->_csTransitioning, "finishInteractiveTransition");
}

- (void)cancelInteractiveTransition
{
  -[CSProminentDisplayTransitioning cancelInteractiveTransition](self->_csTransitioning, "cancelInteractiveTransition");
}

- (CSProminentDisplayTransitioning)csTransitioning
{
  return self->_csTransitioning;
}

- (void)setCsTransitioning:(id)a3
{
  objc_storeStrong((id *)&self->_csTransitioning, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_csTransitioning, 0);
}

@end
