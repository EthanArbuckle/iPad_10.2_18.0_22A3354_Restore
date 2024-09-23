@implementation _UIPreviewInteractionFailureRelationshipGestureRecognizer

- (_UIPreviewInteractionFailureRelationshipGestureRecognizer)initWithPreviewInteraction:(id)a3
{
  id v4;
  _UIPreviewInteractionFailureRelationshipGestureRecognizer *v5;
  _UIPreviewInteractionFailureRelationshipGestureRecognizer *v6;
  _UIPreviewInteractionFailureRelationshipGestureRecognizer *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIPreviewInteractionFailureRelationshipGestureRecognizer;
  v5 = -[UIGestureRecognizer initWithTarget:action:](&v9, sel_initWithTarget_action_, 0, 0);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_previewInteraction, v4);
    -[_UIPreviewInteractionFailureRelationshipGestureRecognizer setDelegate:](v6, "setDelegate:", v6);
    v7 = v6;
  }

  return v6;
}

- (void)setStateToFailed
{
  -[UIGestureRecognizer setState:](self, "setState:", 5);
}

- (void)setStateToRecognized
{
  -[UIGestureRecognizer setState:](self, "setState:", 3);
}

- (void)setDelegate:(id)a3
{
  _UIPreviewInteractionFailureRelationshipGestureRecognizer *v5;
  void *v6;
  objc_super v7;

  v5 = (_UIPreviewInteractionFailureRelationshipGestureRecognizer *)a3;
  if (v5 != self)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPreviewInteractionFailureRelationshipGestureRecognizer.m"), 49, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("delegate == self"));

  }
  v7.receiver = self;
  v7.super_class = (Class)_UIPreviewInteractionFailureRelationshipGestureRecognizer;
  -[UIGestureRecognizer setDelegate:](&v7, sel_setDelegate_, v5);

}

- (void)_gestureRecognizerFailed:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_previewInteraction);
  objc_msgSend(WeakRetained, "cancelInteraction");

}

- (UIPreviewInteraction)previewInteraction
{
  return (UIPreviewInteraction *)objc_loadWeakRetained((id *)&self->_previewInteraction);
}

- (void)setPreviewInteraction:(id)a3
{
  objc_storeWeak((id *)&self->_previewInteraction, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_previewInteraction);
}

@end
