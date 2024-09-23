@implementation SBSystemNotesPlaceholderContentProvider

- (SBSystemNotesPlaceholderContentProvider)initWithSnapshot:(id)a3
{
  id v5;
  SBSystemNotesPlaceholderContentProvider *v6;
  SBSystemNotesPlaceholderContentProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSystemNotesPlaceholderContentProvider;
  v6 = -[SBSystemNotesPlaceholderContentProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_snapshot, a3);

  return v7;
}

- (id)sceneView:(id)a3 requestsPlaceholderContentViewWithContext:(id)a4
{
  return -[SBPIPSceneContentPlaceholderView initWithImage:]([SBPIPSceneContentPlaceholderView alloc], "initWithImage:", self->_snapshot);
}

- (void)setSnapshot:(id)a3
{
  id WeakRetained;
  id v6;

  v6 = a3;
  if ((-[UIImage isEqual:](self->_snapshot, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_snapshot, a3);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "placeholderContentViewProviderContentDidUpdate:", self);

  }
}

- (SBScenePlaceholderContentViewProviderDelegate)delegate
{
  return (SBScenePlaceholderContentViewProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIImage)snapshot
{
  return self->_snapshot;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
