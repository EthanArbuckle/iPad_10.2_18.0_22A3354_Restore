@implementation VUINavigationController

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VUINavigationController;
  -[VUINavigationController viewDidLayoutSubviews](&v5, sel_viewDidLayoutSubviews);
  -[VUINavigationController setNavigationBarHidden:](self, "setNavigationBarHidden:", -[VUIDocumentUIConfiguration isNavigationBarHidden](self->_configuration, "isNavigationBarHidden"));
  if (-[VUIDocumentUIConfiguration isInteractivePopGestureAllowed](self->_configuration, "isInteractivePopGestureAllowed"))
  {
    -[VUINavigationController interactivePopGestureRecognizer](self, "interactivePopGestureRecognizer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setDelegate:", self);

    -[VUINavigationController interactivePopGestureRecognizer](self, "interactivePopGestureRecognizer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEnabled:", 1);

  }
}

- (UITapGestureRecognizer)gesture
{
  return self->_gesture;
}

- (void)setGesture:(id)a3
{
  objc_storeStrong((id *)&self->_gesture, a3);
}

- (VUIDocumentUIConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_gesture, 0);
}

@end
