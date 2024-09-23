@implementation _UIMenuPreparationContext

+ (id)contextWithPreparer:(id)a3 firstResponderTarget:(id)a4
{
  id v5;
  id v6;
  _UIMenuPreparationContext *v7;
  id elementSizeSolver;
  id shouldTrackVisibleSelection;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(_UIMenuPreparationContext);
  objc_storeWeak(&v7->_preparer, v6);

  objc_storeWeak((id *)&v7->_firstResponderTarget, v5);
  v7->_tracksSelection = 1;
  elementSizeSolver = v7->_elementSizeSolver;
  v7->_elementSizeSolver = &__block_literal_global_693;

  shouldTrackVisibleSelection = v7->_shouldTrackVisibleSelection;
  v7->_shouldTrackVisibleSelection = &__block_literal_global_2_19;

  return v7;
}

- (BOOL)shouldTrackSelectionForVisibleIndex:(unint64_t)a3 elementSize:(int64_t)a4
{
  uint64_t (**shouldTrackVisibleSelection)(id, unint64_t, int64_t);

  if (!self->_tracksSelection)
    return 0;
  shouldTrackVisibleSelection = (uint64_t (**)(id, unint64_t, int64_t))self->_shouldTrackVisibleSelection;
  if (shouldTrackVisibleSelection)
    return shouldTrackVisibleSelection[2](shouldTrackVisibleSelection, a3, a4);
  else
    return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _UIMenuPreparationContext *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = -[_UIMenuPreparationContext init](+[_UIMenuPreparationContext allocWithZone:](_UIMenuPreparationContext, "allocWithZone:", a3), "init");
  -[_UIMenuPreparationContext preparer](self, "preparer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak(&v4->_preparer, v5);

  -[_UIMenuPreparationContext preparer](self, "preparer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)&v4->_firstResponderTarget, v6);

  -[_UIMenuPreparationContext deferredElementDelegate](self, "deferredElementDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIMenuPreparationContext setDeferredElementDelegate:](v4, "setDeferredElementDelegate:", v7);

  -[_UIMenuPreparationContext sender](self, "sender");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIMenuPreparationContext setSender:](v4, "setSender:", v8);

  -[_UIMenuPreparationContext setSupportsCustomViewMenuElements:](v4, "setSupportsCustomViewMenuElements:", -[_UIMenuPreparationContext supportsCustomViewMenuElements](self, "supportsCustomViewMenuElements"));
  -[_UIMenuPreparationContext setUseSenderAsResponderSender:](v4, "setUseSenderAsResponderSender:", -[_UIMenuPreparationContext useSenderAsResponderSender](self, "useSenderAsResponderSender"));
  -[_UIMenuPreparationContext setSupportsHeaderView:](v4, "setSupportsHeaderView:", -[_UIMenuPreparationContext supportsHeaderView](self, "supportsHeaderView"));
  -[_UIMenuPreparationContext setTracksSelection:](v4, "setTracksSelection:", -[_UIMenuPreparationContext tracksSelection](self, "tracksSelection"));
  -[_UIMenuPreparationContext elementSizeSolver](self, "elementSizeSolver");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIMenuPreparationContext setElementSizeSolver:](v4, "setElementSizeSolver:", v9);

  -[_UIMenuPreparationContext shouldTrackVisibleSelection](self, "shouldTrackVisibleSelection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIMenuPreparationContext setShouldTrackVisibleSelection:](v4, "setShouldTrackVisibleSelection:", v10);

  return v4;
}

- (id)preparer
{
  return objc_loadWeakRetained(&self->_preparer);
}

- (UIResponder)firstResponderTarget
{
  return (UIResponder *)objc_loadWeakRetained((id *)&self->_firstResponderTarget);
}

- (UIDeferredMenuElementDelegate)deferredElementDelegate
{
  return (UIDeferredMenuElementDelegate *)objc_loadWeakRetained((id *)&self->_deferredElementDelegate);
}

- (void)setDeferredElementDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_deferredElementDelegate, a3);
}

- (id)sender
{
  return objc_loadWeakRetained(&self->_sender);
}

- (void)setSender:(id)a3
{
  objc_storeWeak(&self->_sender, a3);
}

- (BOOL)supportsCustomViewMenuElements
{
  return self->_supportsCustomViewMenuElements;
}

- (void)setSupportsCustomViewMenuElements:(BOOL)a3
{
  self->_supportsCustomViewMenuElements = a3;
}

- (BOOL)useSenderAsResponderSender
{
  return self->_useSenderAsResponderSender;
}

- (void)setUseSenderAsResponderSender:(BOOL)a3
{
  self->_useSenderAsResponderSender = a3;
}

- (BOOL)supportsHeaderView
{
  return self->_supportsHeaderView;
}

- (void)setSupportsHeaderView:(BOOL)a3
{
  self->_supportsHeaderView = a3;
}

- (BOOL)tracksSelection
{
  return self->_tracksSelection;
}

- (void)setTracksSelection:(BOOL)a3
{
  self->_tracksSelection = a3;
}

- (id)shouldTrackVisibleSelection
{
  return self->_shouldTrackVisibleSelection;
}

- (void)setShouldTrackVisibleSelection:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)elementSizeSolver
{
  return self->_elementSizeSolver;
}

- (void)setElementSizeSolver:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_elementSizeSolver, 0);
  objc_storeStrong(&self->_shouldTrackVisibleSelection, 0);
  objc_destroyWeak(&self->_sender);
  objc_destroyWeak((id *)&self->_deferredElementDelegate);
  objc_destroyWeak((id *)&self->_firstResponderTarget);
  objc_destroyWeak(&self->_preparer);
}

@end
