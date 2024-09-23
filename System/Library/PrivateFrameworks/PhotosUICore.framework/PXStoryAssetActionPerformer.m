@implementation PXStoryAssetActionPerformer

+ (BOOL)canPerformWithActionManager:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  objc_super v10;

  v4 = a3;
  objc_msgSend(v4, "performerDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "performerDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hostViewControllerForActionPerformer:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v7, "conformsToProtocol:", &unk_1EEBE9748))
  {
    v10.receiver = a1;
    v10.super_class = (Class)&OBJC_METACLASS___PXStoryAssetActionPerformer;
    v8 = objc_msgSendSuper2(&v10, sel_canPerformWithActionManager_, v4);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (PXStoryViewActionPerformer)storyViewActionPerformer
{
  PXStoryViewActionPerformer **p_storyViewActionPerformer;
  void *WeakRetained;
  void *v5;
  int v6;

  p_storyViewActionPerformer = &self->_storyViewActionPerformer;
  WeakRetained = objc_loadWeakRetained((id *)&self->_storyViewActionPerformer);
  if (WeakRetained)
    goto LABEL_4;
  -[PXActionPerformer hostViewController](self, "hostViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "conformsToProtocol:", &unk_1EEBE9748);

  if (v6)
  {
    -[PXActionPerformer hostViewController](self, "hostViewController");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)p_storyViewActionPerformer, WeakRetained);
LABEL_4:

  }
  return (PXStoryViewActionPerformer *)objc_loadWeakRetained((id *)p_storyViewActionPerformer);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_storyViewActionPerformer);
}

@end
