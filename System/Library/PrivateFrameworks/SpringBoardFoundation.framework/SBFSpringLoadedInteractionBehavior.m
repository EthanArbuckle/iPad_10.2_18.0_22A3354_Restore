@implementation SBFSpringLoadedInteractionBehavior

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)shouldAllowInteraction:(id)a3 withContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "dropSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "locationInView:", v9);
  v11 = v10;
  v13 = v12;
  -[SBFSpringLoadedInteractionBehavior delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "targetItemForSpringLoadingInteractionInView:atLocation:forDropSession:", v9, v8, v11, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setTargetItem:", v15);
  return v15 != 0;
}

- (void)interactionDidFinish:(id)a3
{
  id v3;

  -[SBFSpringLoadedInteractionBehavior delegate](self, "delegate", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "springLoadedInteractionDidFinish");

}

- (SBFSpringLoadedInteractionBehaviorDelegate)delegate
{
  return (SBFSpringLoadedInteractionBehaviorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
