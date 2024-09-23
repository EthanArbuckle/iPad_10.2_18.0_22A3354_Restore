@implementation _UITextPasteSession

- (id)positionedPasteResult
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[_UITextPasteSession pasteResult](self, "pasteResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[_UITextPasteSession pasteResult](self, "pasteResult");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextPasteSession range](self, "range");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "start");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIPositionedAttributedString attributedString:atPosition:](_UIPositionedAttributedString, "attributedString:atPosition:", v4, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)animationStarted
{
  void *v3;

  -[_UITextPasteSession hiddenRange](self, "hiddenRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    self->_animating = 1;
}

- (void)animationCompleted
{
  id WeakRetained;

  if (self->_animating)
  {
    self->_animating = 0;
    WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
    objc_msgSend(WeakRetained, "_restorePasteResultForSession:", self);

  }
}

- (UITextPasteSessionDelegate)delegate
{
  return (UITextPasteSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UITextPasteController)controller
{
  return (UITextPasteController *)objc_loadWeakRetained((id *)&self->_controller);
}

- (void)setController:(id)a3
{
  objc_storeWeak((id *)&self->_controller, a3);
}

- (UITextPasteCoordinator)coordinator
{
  return self->_coordinator;
}

- (void)setCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_coordinator, a3);
}

- (UITextRange)range
{
  return self->_range;
}

- (void)setRange:(id)a3
{
  objc_storeStrong((id *)&self->_range, a3);
}

- (_UITextPasteProgressSupport)progressSupport
{
  return self->_progressSupport;
}

- (void)setProgressSupport:(id)a3
{
  objc_storeStrong((id *)&self->_progressSupport, a3);
}

- (NSAttributedString)pasteResult
{
  return self->_pasteResult;
}

- (void)setPasteResult:(id)a3
{
  objc_storeStrong((id *)&self->_pasteResult, a3);
}

- (NSArray)originalItems
{
  return self->_originalItems;
}

- (void)setOriginalItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (UITextRange)hiddenRange
{
  return self->_hiddenRange;
}

- (void)setHiddenRange:(id)a3
{
  objc_storeStrong((id *)&self->_hiddenRange, a3);
}

- (BOOL)isAnimating
{
  return self->_animating;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hiddenRange, 0);
  objc_storeStrong((id *)&self->_originalItems, 0);
  objc_storeStrong((id *)&self->_pasteResult, 0);
  objc_storeStrong((id *)&self->_progressSupport, 0);
  objc_storeStrong((id *)&self->_range, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_destroyWeak((id *)&self->_controller);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
