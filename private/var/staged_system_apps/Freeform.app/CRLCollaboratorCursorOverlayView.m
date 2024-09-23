@implementation CRLCollaboratorCursorOverlayView

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  void *v5;

  if (!-[CRLCollaboratorCursorOverlayView interactionInView](self, "interactionInView", a3, a4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCollaboratorCursorOverlayView interactionDelegate](self, "interactionDelegate"));
    objc_msgSend(v5, "userInteractionBeganForView:", self);

    -[CRLCollaboratorCursorOverlayView setInteractionInView:](self, "setInteractionInView:", 1);
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  void *v5;

  if (-[CRLCollaboratorCursorOverlayView interactionInView](self, "interactionInView", a3, a4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCollaboratorCursorOverlayView interactionDelegate](self, "interactionDelegate"));
    objc_msgSend(v5, "userInteractionEndedForView:", self);

    -[CRLCollaboratorCursorOverlayView setInteractionInView:](self, "setInteractionInView:", 0);
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  void *v5;

  if (-[CRLCollaboratorCursorOverlayView interactionInView](self, "interactionInView", a3, a4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCollaboratorCursorOverlayView interactionDelegate](self, "interactionDelegate"));
    objc_msgSend(v5, "userInteractionCancelledForView:", self);

    -[CRLCollaboratorCursorOverlayView setInteractionInView:](self, "setInteractionInView:", 0);
  }
}

- (CRLCollaboratorCursorOverlayViewDelegate)interactionDelegate
{
  return (CRLCollaboratorCursorOverlayViewDelegate *)objc_loadWeakRetained((id *)&self->_interactionDelegate);
}

- (void)setInteractionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_interactionDelegate, a3);
}

- (BOOL)interactionInView
{
  return self->_interactionInView;
}

- (void)setInteractionInView:(BOOL)a3
{
  self->_interactionInView = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_interactionDelegate);
}

@end
