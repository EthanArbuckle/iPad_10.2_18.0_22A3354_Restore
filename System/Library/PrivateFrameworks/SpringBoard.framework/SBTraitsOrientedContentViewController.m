@implementation SBTraitsOrientedContentViewController

- (void)setContentParticipant:(id)a3
{
  objc_storeWeak((id *)&self->_contentParticipant, a3);
}

- (void)setContainerParticipant:(id)a3
{
  objc_storeWeak((id *)&self->_containerParticipant, a3);
}

- (void)updateOrientationIfNeeded
{
  TRAParticipant **p_contentParticipant;
  id WeakRetained;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void (**actuateAlongsideBlock)(id, uint64_t, double, double);
  double v13;
  double v14;
  void *v15;
  id v16;

  p_contentParticipant = &self->_contentParticipant;
  WeakRetained = objc_loadWeakRetained((id *)&self->_contentParticipant);

  if (!WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v16 = objc_loadWeakRetained((id *)p_contentParticipant);
  v6 = objc_loadWeakRetained((id *)&self->_containerParticipant);
  if (v16)
  {
    -[SBTraitsOrientedContentViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v8 = objc_msgSend(v6, "sbf_currentOrientation");
    }
    else
    {
      -[SBTraitsOrientedContentViewController view](self, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "window");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v10, "interfaceOrientation");

    }
    v11 = objc_msgSend(v16, "sbf_currentOrientation");
    objc_msgSend(MEMORY[0x1E0CEAC18], "_synchronizeDrawing");
    objc_msgSend(v7, "setContainerOrientation:", v8);
    objc_msgSend(v7, "setContentOrientation:", v11);
    actuateAlongsideBlock = (void (**)(id, uint64_t, double, double))self->_actuateAlongsideBlock;
    if (actuateAlongsideBlock)
    {
      objc_msgSend(v7, "contentViewBoundsInReferenceSpace");
      actuateAlongsideBlock[2](actuateAlongsideBlock, v11, v13, v14);
    }
    objc_msgSend(v7, "setNeedsLayout");
    objc_msgSend(v7, "layoutIfNeeded");

  }
}

- (SBTraitsOrientedContentViewControllerView)view
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBTraitsOrientedContentViewController;
  -[SBTraitsOrientedContentViewController view](&v3, sel_view);
  return (SBTraitsOrientedContentViewControllerView *)(id)objc_claimAutoreleasedReturnValue();
}

uint64_t __92__SBTraitsOrientedContentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateOrientationIfNeeded");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  id WeakRetained;
  _QWORD v9[5];
  objc_super v10;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)SBTraitsOrientedContentViewController;
  -[SBTraitsOrientedContentViewController viewWillTransitionToSize:withTransitionCoordinator:](&v10, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  WeakRetained = objc_loadWeakRetained((id *)&self->_contentParticipant);

  if (WeakRetained)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __92__SBTraitsOrientedContentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
    v9[3] = &unk_1E8E9EA28;
    v9[4] = self;
    objc_msgSend(v7, "animateAlongsideTransition:completion:", v9, 0);
  }

}

- (void)loadView
{
  SBTraitsOrientedContentViewControllerView *v3;
  SBTraitsOrientedContentViewControllerView *v4;

  v3 = [SBTraitsOrientedContentViewControllerView alloc];
  v4 = -[SBTraitsOrientedContentViewControllerView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[SBTraitsOrientedContentViewController setView:](self, "setView:", v4);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (TRAParticipant)contentParticipant
{
  return (TRAParticipant *)objc_loadWeakRetained((id *)&self->_contentParticipant);
}

- (TRAParticipant)containerParticipant
{
  return (TRAParticipant *)objc_loadWeakRetained((id *)&self->_containerParticipant);
}

- (id)actuateAlongsideBlock
{
  return self->_actuateAlongsideBlock;
}

- (void)setActuateAlongsideBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 984);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_actuateAlongsideBlock, 0);
  objc_destroyWeak((id *)&self->_containerParticipant);
  objc_destroyWeak((id *)&self->_contentParticipant);
}

@end
