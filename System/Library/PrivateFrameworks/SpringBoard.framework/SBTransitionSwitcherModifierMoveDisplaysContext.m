@implementation SBTransitionSwitcherModifierMoveDisplaysContext

+ (id)moveDisplaysContextWithCoordinatedLayoutStateTransitionContext:(id)a3 relativeToSwitcherController:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCoordinatedLayoutStateTransitionContext:switcherController:", v7, v6);

  return v8;
}

- (SBTransitionSwitcherModifierMoveDisplaysContext)initWithCoordinatedLayoutStateTransitionContext:(id)a3 switcherController:(id)a4
{
  id v7;
  id v8;
  SBTransitionSwitcherModifierMoveDisplaysContext *v9;
  SBTransitionSwitcherModifierMoveDisplaysContext *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBTransitionSwitcherModifierMoveDisplaysContext;
  v9 = -[SBTransitionSwitcherModifierMoveDisplaysContext init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_coordinatedLayoutStateTransitionContext, a3);
    objc_storeStrong((id *)&v10->_switcherController, a4);
  }

  return v10;
}

- (NSSet)movingDisplayItems
{
  return -[SBSwitcherCoordinatedLayoutStateTransitionContext displayItems](self->_coordinatedLayoutStateTransitionContext, "displayItems");
}

- (BOOL)pertainsToAppLayout:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a3, "allItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBSwitcherCoordinatedLayoutStateTransitionContext displayItems](self->_coordinatedLayoutStateTransitionContext, "displayItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v6, "intersectsSet:", v7);

  return (char)v5;
}

- (BOOL)pertainsToDisplayItem:(id)a3
{
  SBSwitcherCoordinatedLayoutStateTransitionContext *coordinatedLayoutStateTransitionContext;
  id v4;
  void *v5;
  char v6;

  coordinatedLayoutStateTransitionContext = self->_coordinatedLayoutStateTransitionContext;
  v4 = a3;
  -[SBSwitcherCoordinatedLayoutStateTransitionContext displayItems](coordinatedLayoutStateTransitionContext, "displayItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (CGRect)fromFrameForDisplayItem:(id)a3
{
  id v4;
  SBSwitcherController *switcherController;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  SBSwitcherController *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect result;

  v4 = a3;
  switcherController = self->_switcherController;
  -[SBSwitcherCoordinatedLayoutStateTransitionContext fromSwitcherController](self->_coordinatedLayoutStateTransitionContext, "fromSwitcherController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(switcherController) = -[SBSwitcherController isEqual:](switcherController, "isEqual:", v6);

  if ((_DWORD)switcherController)
  {
    -[SBSwitcherCoordinatedLayoutStateTransitionContext fromFrameInFromSwitcherForDisplayItem:](self->_coordinatedLayoutStateTransitionContext, "fromFrameInFromSwitcherForDisplayItem:", v4);
  }
  else
  {
    v11 = self->_switcherController;
    -[SBSwitcherCoordinatedLayoutStateTransitionContext toSwitcherController](self->_coordinatedLayoutStateTransitionContext, "toSwitcherController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v11) = -[SBSwitcherController isEqual:](v11, "isEqual:", v12);

    if (!(_DWORD)v11)
    {
      v13 = *MEMORY[0x1E0C9D648];
      v14 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v15 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v16 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      goto LABEL_7;
    }
    -[SBSwitcherCoordinatedLayoutStateTransitionContext fromFrameInToSwitcherForDisplayItem:](self->_coordinatedLayoutStateTransitionContext, "fromFrameInToSwitcherForDisplayItem:", v4);
  }
  v13 = v7;
  v14 = v8;
  v15 = v9;
  v16 = v10;
LABEL_7:

  v17 = v13;
  v18 = v14;
  v19 = v15;
  v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (CGRect)toFrameForDisplayItem:(id)a3
{
  id v4;
  SBSwitcherController *switcherController;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  SBSwitcherController *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect result;

  v4 = a3;
  switcherController = self->_switcherController;
  -[SBSwitcherCoordinatedLayoutStateTransitionContext fromSwitcherController](self->_coordinatedLayoutStateTransitionContext, "fromSwitcherController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(switcherController) = -[SBSwitcherController isEqual:](switcherController, "isEqual:", v6);

  if ((_DWORD)switcherController)
  {
    -[SBSwitcherCoordinatedLayoutStateTransitionContext toFrameInFromSwitcherForDisplayItem:](self->_coordinatedLayoutStateTransitionContext, "toFrameInFromSwitcherForDisplayItem:", v4);
  }
  else
  {
    v11 = self->_switcherController;
    -[SBSwitcherCoordinatedLayoutStateTransitionContext toSwitcherController](self->_coordinatedLayoutStateTransitionContext, "toSwitcherController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v11) = -[SBSwitcherController isEqual:](v11, "isEqual:", v12);

    if (!(_DWORD)v11)
    {
      v13 = *MEMORY[0x1E0C9D648];
      v14 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v15 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v16 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      goto LABEL_7;
    }
    -[SBSwitcherCoordinatedLayoutStateTransitionContext toFrameInToSwitcherForDisplayItem:](self->_coordinatedLayoutStateTransitionContext, "toFrameInToSwitcherForDisplayItem:", v4);
  }
  v13 = v7;
  v14 = v8;
  v15 = v9;
  v16 = v10;
LABEL_7:

  v17 = v13;
  v18 = v14;
  v19 = v15;
  v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (SBSwitcherCoordinatedLayoutStateTransitionContext)coordinatedLayoutStateTransitionContext
{
  return self->_coordinatedLayoutStateTransitionContext;
}

- (SBSwitcherController)switcherController
{
  return self->_switcherController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_switcherController, 0);
  objc_storeStrong((id *)&self->_coordinatedLayoutStateTransitionContext, 0);
}

@end
