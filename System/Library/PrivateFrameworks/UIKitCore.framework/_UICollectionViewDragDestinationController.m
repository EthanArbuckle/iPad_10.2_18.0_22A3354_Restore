@implementation _UICollectionViewDragDestinationController

- (uint64_t)isActive
{
  _DWORD *v1;
  unsigned int v2;
  BOOL v3;
  unsigned int v4;
  uint64_t v5;

  if (!a1)
    return 0;
  -[_UICollectionViewDragDestinationController sessionState](a1);
  v1 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    v2 = v1[2];
    v3 = v2 > 9;
    v4 = (0x2FEu >> v2) & 1;
    if (v3)
      v5 = 0;
    else
      v5 = v4;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (_QWORD)sessionState
{
  _QWORD *v1;
  void *v2;
  _UIDragDestinationControllerSessionState *v3;
  void *v4;

  if (a1)
  {
    v1 = a1;
    v2 = (void *)a1[5];
    if (!v2)
    {
      v3 = objc_alloc_init(_UIDragDestinationControllerSessionState);
      v4 = (void *)v1[5];
      v1[5] = v3;

      v2 = (void *)v1[5];
    }
    a1 = v2;
  }
  return a1;
}

+ (id)controllerForCollectionView:(void *)a3 delegate:
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = a2;
  v6 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_self()), "initWithCollectionView:delegate:", v5, v4);

  return v6;
}

- (_UICollectionViewDragDestinationController)initWithCollectionView:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  _UICollectionViewDragDestinationController *v8;
  _UICollectionViewDragDestinationController *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_UICollectionViewDragDestinationController;
  v8 = -[_UICollectionViewDragDestinationController init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_collectionView, v6);
    objc_storeWeak((id *)&v9->_delegate, v7);
    -[_UICollectionViewDragDestinationController _configureInteraction](v9, "_configureInteraction");
  }

  return v9;
}

- (void)_configureInteraction
{
  id WeakRetained;
  UIDropInteraction *obj;

  obj = -[UIDropInteraction initWithDelegate:]([UIDropInteraction alloc], "initWithDelegate:", self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  objc_msgSend(WeakRetained, "addInteraction:", obj);

  if (self)
    objc_storeWeak((id *)&self->_dropInteraction, obj);

}

- (void)dealloc
{
  objc_super v3;

  -[_UICollectionViewDragDestinationController deactivate]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)_UICollectionViewDragDestinationController;
  -[_UICollectionViewDragDestinationController dealloc](&v3, sel_dealloc);
}

- (void)deactivate
{
  void *v2;
  id WeakRetained;
  _DWORD *v4;
  id v5;
  int v6;
  id v7;
  void *v8;
  id v9;
  id v10;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 32), "invalidate");
    v2 = *(void **)(a1 + 32);
    *(_QWORD *)(a1 + 32) = 0;

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    if (WeakRetained)
    {
      -[_UICollectionViewDragDestinationController sessionState]((_QWORD *)a1);
      v4 = (_DWORD *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      if (v4)
      {
        v6 = v4[2];
        if ((v6 - 1) < 7 || v6 == 9)
        {

          v7 = objc_loadWeakRetained((id *)(a1 + 24));
          v8 = v7;
          if (v7)
            objc_msgSend(v7, "_decrementSessionRefCount");

          v5 = objc_loadWeakRetained((id *)(a1 + 8));
          objc_msgSend(v5, "_resetDropTargetAppearance");
        }
      }

      v9 = objc_loadWeakRetained((id *)(a1 + 8));
      v10 = objc_loadWeakRetained((id *)(a1 + 16));
      objc_msgSend(v9, "removeInteraction:", v10);

      objc_storeWeak((id *)(a1 + 16), 0);
    }
    *(_QWORD *)(a1 + 64) = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dropProposalState, 0);
  objc_storeStrong((id *)&self->_reorderingState, 0);
  objc_storeStrong((id *)&self->_sessionState, 0);
  objc_storeStrong((id *)&self->_reorderDisplayLink, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dropInteraction);
  objc_destroyWeak((id *)&self->_collectionView);
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionViewDragDestinationController sessionState](self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionViewDragDestinationController reorderingState]((id *)&self->super.isa);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionViewDragDestinationController dropProposalState](self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p; sessionState = %@; reorderingState = %@; dropProposalState = %@>"),
    v5,
    self,
    v6,
    v7,
    v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (id)reorderingState
{
  id *v1;
  id v2;
  _UIDragDestinationControllerReorderingState *v3;
  void *v4;
  id WeakRetained;
  id v6;
  id v7;
  _UIDragDestinationControllerReorderingState *v8;
  _UIVelocityIntegrator *v9;
  _UIVelocityIntegrator *velocityIntegrator;
  id v11;
  objc_super v13;

  if (a1)
  {
    v1 = a1;
    v2 = a1[6];
    if (!v2)
    {
      v3 = [_UIDragDestinationControllerReorderingState alloc];
      -[_UICollectionViewDragDestinationController sessionState](v1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained(v1 + 1);
      v6 = v4;
      v7 = WeakRetained;
      if (v3)
      {
        v13.receiver = v3;
        v13.super_class = (Class)_UIDragDestinationControllerReorderingState;
        v8 = (_UIDragDestinationControllerReorderingState *)objc_msgSendSuper2(&v13, sel_init);
        v3 = v8;
        if (v8)
        {
          objc_storeStrong((id *)&v8->_sessionState, v4);
          objc_storeWeak((id *)&v3->_collectionView, v7);
          v9 = objc_alloc_init(_UIVelocityIntegrator);
          velocityIntegrator = v3->_velocityIntegrator;
          v3->_velocityIntegrator = v9;

          -[_UIVelocityIntegrator setMinimumRequiredMovement:](v3->_velocityIntegrator, "setMinimumRequiredMovement:", 0.0);
          v3->_dragMovementPhase = 0;
        }
      }

      v11 = v1[6];
      v1[6] = v3;

      v2 = v1[6];
    }
    a1 = (id *)v2;
  }
  return a1;
}

- (_QWORD)dropProposalState
{
  _QWORD *v1;
  void *v2;
  _UIDragDestinationControllerDropProposalState *v3;
  void *v4;

  if (a1)
  {
    v1 = a1;
    v2 = (void *)a1[7];
    if (!v2)
    {
      v3 = objc_alloc_init(_UIDragDestinationControllerDropProposalState);
      v4 = (void *)v1[7];
      v1[7] = v3;

      v2 = (void *)v1[7];
    }
    a1 = v2;
  }
  return a1;
}

- (BOOL)supportsLocalSessionReordering
{
  _BYTE *v1;
  _BOOL8 v2;

  if (!a1)
    return 0;
  -[_UICollectionViewDragDestinationController reorderingState](a1);
  v1 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  if (v1)
    v2 = v1[8] != 0;
  else
    v2 = 0;

  return v2;
}

- (id)currentIndexPath
{
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;

  if (a1)
  {
    -[_UICollectionViewDragDestinationController dropProposalState](a1);
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)v1;
    if (v1)
      v3 = *(void **)(v1 + 24);
    else
      v3 = 0;
    v4 = v3;

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)currentDropProposal
{
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;

  if (a1)
  {
    -[_UICollectionViewDragDestinationController dropProposalState](a1);
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)v1;
    if (v1)
      v3 = *(void **)(v1 + 16);
    else
      v3 = 0;
    v4 = v3;

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)currentDropSession
{
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;

  if (a1)
  {
    -[_UICollectionViewDragDestinationController sessionState](a1);
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)v1;
    if (v1)
      v3 = *(void **)(v1 + 16);
    else
      v3 = 0;
    v4 = v3;

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)dragSourceSelectedItemCountDidChangeWithCount:(id *)a1
{
  unsigned __int8 *v4;
  int v5;
  _DWORD *v6;

  if (a1)
  {
    -[_UICollectionViewDragDestinationController reorderingState](a1);
    v4 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = v4[8];

      if (a2 >= 2)
      {
        if (v5)
        {
          objc_msgSend(a1, "_cancelCurrentInteractiveReorder");
          -[_UICollectionViewDragDestinationController sessionState](a1);
          v6 = (_DWORD *)objc_claimAutoreleasedReturnValue();
          if (v6)
          {
            if (v6[2] != 5)
              v6[2] = 5;
          }

        }
      }
    }
  }
}

- (void)dropWasCancelled
{
  _DWORD *v2;
  int v3;
  id WeakRetained;

  if (a1)
  {
    -[_UICollectionViewDragDestinationController sessionState]((_QWORD *)a1);
    v2 = (_DWORD *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = v2[2];
      if ((v3 - 1) < 7 || v3 == 9)
      {

        objc_msgSend((id)a1, "_cancelInteractiveReorderingIfNeeded");
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
        objc_msgSend(WeakRetained, "_resetDropTargetAppearance");

        -[_UICollectionViewDragDestinationController sessionState]((_QWORD *)a1);
        v2 = (_DWORD *)objc_claimAutoreleasedReturnValue();
        if (v2)
        {
          if (v2[2] != 7)
            v2[2] = 7;
        }
      }
    }

  }
}

- (void)dropInsertionRolledBack
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
    -[_UICollectionViewDragDestinationController currentIndexPath]((_QWORD *)a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "indexPathBeforeShadowUpdates:", v3);
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[_UICollectionViewDragDestinationController dropProposalState]((_QWORD *)a1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UICollectionCompositionalLayoutSolverOptions setLayoutAttributesClass:]((uint64_t)v4, v5);

    }
  }
}

- (BOOL)hasPerformedReordering
{
  uint64_t v2;
  BOOL v3;

  -[_UICollectionViewDragDestinationController reorderingState]((id *)&self->super.isa);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2 && *(uint64_t *)(v2 + 24) >= 1 && *(_BYTE *)(v2 + 8) != 0;

  return v3;
}

- (void)suspendDrops
{
  uint64_t v2;
  _DWORD *v3;
  unsigned int v4;
  uint64_t v6;
  void *v7;
  void *v8;
  id WeakRetained;
  void *v10;
  _DWORD *v11;
  id *v12;
  id v13;
  void *v14;
  char v15;
  void *v16;
  id v17;
  void *v18;
  char v19;
  _DWORD *v20;

  if (a1)
  {
    v2 = *(_QWORD *)(a1 + 64);
    *(_QWORD *)(a1 + 64) = v2 + 1;
    if (!v2)
    {
      -[_UICollectionViewDragDestinationController sessionState]((_QWORD *)a1);
      v3 = (_DWORD *)objc_claimAutoreleasedReturnValue();
      if (!v3)
        goto LABEL_24;
      v4 = v3[2];
      if (v4 >= 6 && v4 != 9)
        goto LABEL_24;

      -[_UICollectionViewDragDestinationController sessionState]((_QWORD *)a1);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v6;
      v8 = v6 ? *(void **)(v6 + 16) : 0;
      v20 = v8;

      v3 = v20;
      if (!v20)
        goto LABEL_24;
      objc_msgSend((id)a1, "_pauseReorderingDisplayLink");
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
      v10 = WeakRetained;
      if (WeakRetained)
        objc_msgSend(WeakRetained, "_updatePreferredDraggedCellAppearanceForSessionUpdate");

      -[_UICollectionViewDragDestinationController sessionState]((_QWORD *)a1);
      v11 = (_DWORD *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        if (v11[2] != 8)
          v11[2] = 8;
      }

      v12 = (id *)(a1 + 8);
      v13 = objc_loadWeakRetained((id *)(a1 + 8));
      objc_msgSend(v13, "_resetDropTargetAppearance");

      objc_msgSend((id)a1, "_dropDelegateActual");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_opt_respondsToSelector();

      if ((v15 & 1) != 0)
      {
        objc_msgSend((id)a1, "_dropDelegateProxy");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_loadWeakRetained(v12);
        objc_msgSend(v16, "collectionView:dropSessionDidExit:", v17, v20);
      }
      else
      {
        objc_msgSend((id)a1, "_dragDestinationDelegateActual");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_opt_respondsToSelector();

        if ((v19 & 1) == 0)
        {
LABEL_23:
          v3 = v20;
LABEL_24:

          return;
        }
        objc_msgSend((id)a1, "_dragDestinationDelegateProxy");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_loadWeakRetained(v12);
        objc_msgSend(v16, "_collectionView:dropSessionDidExit:", v17, v20);
      }

      goto LABEL_23;
    }
  }
}

- (void)resumeDrops
{
  uint64_t v2;
  uint64_t v3;
  _DWORD *v4;
  int v5;
  _DWORD *v6;
  unint64_t v7;
  NSObject *v8;
  NSObject *v9;
  id WeakRetained;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  v2 = *(_QWORD *)(a1 + 64);
  if (v2)
  {
    v3 = v2 - 1;
    *(_QWORD *)(a1 + 64) = v3;
    if (!v3)
    {
      -[_UICollectionViewDragDestinationController sessionState]((_QWORD *)a1);
      v4 = (_DWORD *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        v5 = v4[2];

        if (v5 == 8)
        {
          -[_UICollectionViewDragDestinationController sessionState]((_QWORD *)a1);
          v6 = (_DWORD *)objc_claimAutoreleasedReturnValue();
          if (v6)
          {
            if (v6[2] != 9)
              v6[2] = 9;
          }

        }
      }
    }
    return;
  }
  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      goto LABEL_16;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    v11 = 136315650;
    v12 = "-[_UICollectionViewDragDestinationController resumeDrops]";
    v13 = 2112;
    v14 = WeakRetained;
    v15 = 2112;
    v16 = a1;
    _os_log_fault_impl(&dword_185066000, v9, OS_LOG_TYPE_FAULT, "Unbalanced call to %s. Collection view: %@; destination controller: %@",
      (uint8_t *)&v11,
      0x20u);
LABEL_15:

LABEL_16:
    return;
  }
  v7 = resumeDrops___s_category;
  if (!resumeDrops___s_category)
  {
    v7 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v7, (unint64_t *)&resumeDrops___s_category);
  }
  v8 = *(NSObject **)(v7 + 8);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v9 = v8;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    v11 = 136315650;
    v12 = "-[_UICollectionViewDragDestinationController resumeDrops]";
    v13 = 2112;
    v14 = WeakRetained;
    v15 = 2112;
    v16 = a1;
    _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "Unbalanced call to %s. Collection view: %@; destination controller: %@",
      (uint8_t *)&v11,
      0x20u);
    goto LABEL_15;
  }
}

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  char v9;
  void *v10;
  char v11;
  BOOL v12;

  v5 = a4;
  -[_UICollectionViewDragDestinationController _dropDelegateActual](self, "_dropDelegateActual");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[_UICollectionViewDragDestinationController _dropDelegateProxy](self, "_dropDelegateProxy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      self = (_UICollectionViewDragDestinationController *)objc_loadWeakRetained((id *)&self->_collectionView);
    v9 = objc_msgSend(v8, "collectionView:canHandleDropSession:", self, v5);
  }
  else
  {
    -[_UICollectionViewDragDestinationController _dragDestinationDelegateActual](self, "_dragDestinationDelegateActual");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) == 0)
    {
      v12 = 1;
      goto LABEL_11;
    }
    -[_UICollectionViewDragDestinationController _dragDestinationDelegateProxy](self, "_dragDestinationDelegateProxy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      self = (_UICollectionViewDragDestinationController *)objc_loadWeakRetained((id *)&self->_collectionView);
    v9 = objc_msgSend(v8, "_collectionView:canHandleDropSesson:", self, v5);
  }
  v12 = v9;

LABEL_11:
  return v12;
}

- (void)_beginOrResumeDropSession:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  _BOOL4 v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  void *v12;
  char v13;
  int v14;
  unint64_t v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  UICollectionViewDropProposal *v21;
  uint64_t v22;
  UICollectionViewDropProposal *v23;
  id WeakRetained;
  _QWORD *v25;
  void *v26;
  uint64_t v27;
  double v28;
  double v29;
  double v30;
  double v31;
  id v32;
  void *v33;
  void *v34;
  _QWORD *v35;
  void *v36;
  void *v37;
  id v38;
  _QWORD *v39;
  void *v40;
  _BOOL4 v41;
  _BYTE *v42;
  _DWORD *v43;
  int v44;
  _QWORD *v45;
  void *v46;
  char v47;
  void *v48;
  void *v49;
  char v50;
  NSObject *v51;
  int v52;
  id v53;
  uint8_t buf[16];
  uint8_t v55[16];

  v5 = a3;
  -[_UICollectionViewDragDestinationController sessionState](self);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = *(_DWORD *)(v6 + 8) == 9;
  else
    v8 = 0;
  -[_UICollectionViewDragDestinationController sessionState](self);
  v9 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v52 = v8;
  if (v9 && (v10 = v9[2], v9, v10))
  {
    -[_UICollectionViewDragDestinationController sessionState](self);
    v11 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
      v11 = (_QWORD *)v11[2];
    v13 = objc_msgSend(v11, "isEqual:", v5);

    if ((v13 & 1) == 0)
    {
      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v55 = 0;
          _os_log_fault_impl(&dword_185066000, v51, OS_LOG_TYPE_FAULT, "UIKit Internal Bug: UICollectionView entered a new UIDropSession whilst an existing session was active. This can lead to unexpected results at runtime.", v55, 2u);
        }

      }
      else
      {
        v15 = _beginOrResumeDropSession____s_category;
        if (!_beginOrResumeDropSession____s_category)
        {
          v15 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v15, (unint64_t *)&_beginOrResumeDropSession____s_category);
        }
        v16 = *(NSObject **)(v15 + 8);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_185066000, v16, OS_LOG_TYPE_ERROR, "UIKit Internal Bug: UICollectionView entered a new UIDropSession whilst an existing session was active. This can lead to unexpected results at runtime.", buf, 2u);
        }
      }
    }
    v14 = 0;
  }
  else
  {
    v14 = 1;
  }
  -[_UICollectionViewDragDestinationController sessionState](self);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (v17)
    objc_storeStrong((id *)(v17 + 16), a3);

  -[_UICollectionViewDragDestinationController setReorderingState:]((uint64_t)self);
  if (self)
    objc_storeStrong((id *)&self->_dropProposalState, 0);
  v19 = -[_UICollectionViewDragDestinationController _isLocalInteractiveMove](self, "_isLocalInteractiveMove");
  -[_UICollectionViewDragDestinationController dropProposalState](self);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = [UICollectionViewDropProposal alloc];
  if (v19)
    v22 = 0;
  else
    v22 = 2;
  v23 = -[UICollectionViewDropProposal initWithDropOperation:intent:](v21, "initWithDropOperation:intent:", v22, 0);
  if (v20)
    objc_msgSend(v20, "setProposal:", v23);

  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  else
    WeakRetained = 0;
  -[_UICollectionViewDragDestinationController dropProposalState](self);
  v25 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v25)
    v25 = (_QWORD *)v25[2];
  v27 = objc_msgSend(v25, "intent");

  objc_msgSend(v5, "locationInView:", WeakRetained);
  v29 = v28;
  v31 = v30;
  if (self)
  {
    v32 = objc_loadWeakRetained((id *)&self->_delegate);
    v33 = v32;
    if (v32)
    {
      v34 = (void *)*((_QWORD *)v32 + 7);
      goto LABEL_32;
    }
  }
  else
  {
    v33 = 0;
  }
  v34 = 0;
LABEL_32:
  v35 = v34;
  -[_UICollectionViewDragSourceController dragFromIndexPath](v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v53 = 0;
  objc_msgSend(WeakRetained, "_indexPathForInsertionAtPoint:dropIntent:sourceIndexPath:indicatorLayoutAttributes:", v27, v36, &v53, v29, v31);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v53;
  -[_UICollectionViewDragDestinationController _updateDropProposalByQueryingClientIfNeeded:indicatorLayoutAttributes:](self, "_updateDropProposalByQueryingClientIfNeeded:indicatorLayoutAttributes:", v37, v38);
  if (v19)
  {
    -[_UICollectionViewDragDestinationController dropProposalState](self);
    v39 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v40 = v39;
    if (v39)
      v39 = (_QWORD *)v39[2];
    v41 = objc_msgSend(v39, "operation") != 2;

  }
  else
  {
    v41 = 0;
  }
  -[_UICollectionViewDragDestinationController reorderingState]((id *)&self->super.isa);
  v42 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  if (v42)
    v42[8] = v41;

  -[_UICollectionViewDragDestinationController sessionState](self);
  v43 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  if (v41)
  {
    if (!v43 || v43[2] == 1)
      goto LABEL_47;
    v44 = 1;
  }
  else
  {
    if (!v43 || v43[2] == 2)
      goto LABEL_47;
    v44 = 2;
  }
  v43[2] = v44;
LABEL_47:

  if (self)
    v45 = objc_loadWeakRetained((id *)&self->_delegate);
  else
    v45 = 0;
  -[_UICollectionViewDragAndDropController dragDestinationControllerSessionDidEnter:isNewSession:isResuming:](v45, self, v14, v52);

  -[_UICollectionViewDragDestinationController _dropDelegateActual](self, "_dropDelegateActual");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_opt_respondsToSelector();

  if ((v47 & 1) != 0)
  {
    -[_UICollectionViewDragDestinationController _dropDelegateProxy](self, "_dropDelegateProxy");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "collectionView:dropSessionDidEnter:", WeakRetained, v5);
LABEL_53:

    goto LABEL_54;
  }
  -[_UICollectionViewDragDestinationController _dragDestinationDelegateActual](self, "_dragDestinationDelegateActual");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_opt_respondsToSelector();

  if ((v50 & 1) != 0)
  {
    -[_UICollectionViewDragDestinationController _dragDestinationDelegateProxy](self, "_dragDestinationDelegateProxy");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "_collectionView:dropSessionDidEnter:", WeakRetained, v5);
    goto LABEL_53;
  }
LABEL_54:
  -[_UICollectionViewDragDestinationController _configureReorderingDisplayLinkIfNeeded](self, "_configureReorderingDisplayLinkIfNeeded");
  -[_UICollectionViewDragDestinationController _resumeReorderingDisplayLink](self, "_resumeReorderingDisplayLink");

}

- (void)setReorderingState:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 48), 0);
}

- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4
{
  _DWORD *v5;
  int v6;
  id v7;

  v7 = a4;
  -[_UICollectionViewDragDestinationController sessionState](self);
  v5 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  if (!v5 || (v6 = v5[2], v5, v6 != 8))
    -[_UICollectionViewDragDestinationController _beginOrResumeDropSession:](self, "_beginOrResumeDropSession:", v7);

}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  id v6;
  _DWORD *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  _DWORD *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  void *v22;
  void *v23;
  void *v24;

  v6 = a4;
  -[_UICollectionViewDragDestinationController sessionState](self);
  v7 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  if (v7 && (v8 = v7[2], v7, v8 == 8))
  {
    -[_UICollectionViewDragDestinationController dropProposalState](self);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
      v11 = *(void **)(v9 + 16);
    else
      v11 = 0;
    v12 = v11;

    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[UICollectionViewData collectionView]((id *)&self->super.isa);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UICollectionViewDragDestinationController sessionState](self);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionViewDragDestinationController.m"), 367, CFSTR("Couldn't find a drop proposal to return to the drop interaction. Collection view: %@; drop session: %@; destination controller session state: %@"),
        v23,
        v6,
        v24);

    }
    -[_UICollectionViewDragDestinationController dropProposalState](self);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v13)
      v15 = *(void **)(v13 + 16);
    else
      v15 = 0;
    v16 = v15;

  }
  else
  {
    -[_UICollectionViewDragDestinationController sessionState](self);
    v17 = (_DWORD *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = v17[2];

      if (v18 == 9)
        -[_UICollectionViewDragDestinationController _beginOrResumeDropSession:](self, "_beginOrResumeDropSession:", v6);
    }
    -[_UICollectionViewDragDestinationController dropProposalState](self);
    v19 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v19;
    if (v19)
      v20 = *(_QWORD *)(v19 + 16);
    else
      v20 = 0;
    -[_UICollectionViewDragDestinationController _effectiveDropProposalForProposal:](self, "_effectiveDropProposalForProposal:", v20);
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

- (void)dropInteraction:(id)a3 sessionDidExit:(id)a4
{
  uint64_t v5;
  void *v6;
  _DWORD *v7;
  int v8;
  _BYTE *v9;
  id WeakRetained;
  void *v11;
  _DWORD *v12;
  int v13;
  _DWORD *v14;
  _DWORD *v15;
  int v16;
  id v17;
  void *v18;
  char v19;
  void *v20;
  char v21;
  id v22;

  v22 = a4;
  -[_UICollectionViewDragDestinationController sessionState](self);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5 && *(_DWORD *)(v5 + 8) == 8)
    goto LABEL_32;
  -[_UICollectionViewDragDestinationController sessionState](self);
  v7 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = v7[2];

    if (v8 == 9)
      goto LABEL_33;
  }
  else
  {

  }
  -[_UICollectionViewDragDestinationController _pauseReorderingDisplayLink](self, "_pauseReorderingDisplayLink");
  -[_UICollectionViewDragDestinationController reorderingState]((id *)&self->super.isa);
  v9 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  if (v9)
    v9[8] = 0;

  if (self)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v11 = WeakRetained;
    if (WeakRetained)
      objc_msgSend(WeakRetained, "_updatePreferredDraggedCellAppearanceForSessionUpdate");
  }
  else
  {
    v11 = 0;
  }

  -[_UICollectionViewDragDestinationController sessionState](self);
  v12 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = v12[2];

    if (v13 == 3)
    {
      -[_UICollectionViewDragDestinationController sessionState](self);
      v14 = (_DWORD *)objc_claimAutoreleasedReturnValue();
      if (v14 && v14[2] != 1)
        v14[2] = 1;
LABEL_20:

      -[_UICollectionViewDragDestinationController _cancelInteractiveReorderingIfNeeded](self, "_cancelInteractiveReorderingIfNeeded");
      goto LABEL_21;
    }
  }
  -[_UICollectionViewDragDestinationController sessionState](self);
  v15 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = v15[2];

    if (v16 == 4)
    {
      -[_UICollectionViewDragDestinationController sessionState](self);
      v14 = (_DWORD *)objc_claimAutoreleasedReturnValue();
      if (v14 && v14[2])
        v14[2] = 0;
      goto LABEL_20;
    }
  }
LABEL_21:
  if (self)
    v17 = objc_loadWeakRetained((id *)&self->_collectionView);
  else
    v17 = 0;
  objc_msgSend(v17, "_resetDropTargetAppearance");

  -[_UICollectionViewDragDestinationController _dropDelegateActual](self, "_dropDelegateActual");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_opt_respondsToSelector();

  if ((v19 & 1) != 0)
  {
    -[_UICollectionViewDragDestinationController _dropDelegateProxy](self, "_dropDelegateProxy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      self = (_UICollectionViewDragDestinationController *)objc_loadWeakRetained((id *)&self->_collectionView);
    objc_msgSend(v6, "collectionView:dropSessionDidExit:", self, v22);
LABEL_31:

LABEL_32:
    goto LABEL_33;
  }
  -[_UICollectionViewDragDestinationController _dragDestinationDelegateActual](self, "_dragDestinationDelegateActual");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_opt_respondsToSelector();

  if ((v21 & 1) != 0)
  {
    -[_UICollectionViewDragDestinationController _dragDestinationDelegateProxy](self, "_dragDestinationDelegateProxy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      self = (_UICollectionViewDragDestinationController *)objc_loadWeakRetained((id *)&self->_collectionView);
    objc_msgSend(v6, "_collectionView:dropSessionDidExit:", self, v22);
    goto LABEL_31;
  }
LABEL_33:

}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  id *v5;
  _BYTE *v6;
  void *v7;
  id WeakRetained;
  void *v9;
  uint64_t v10;
  void *v11;
  _DWORD *v12;
  void *v13;
  id v14;
  _DWORD *v15;
  int v16;
  _DWORD *v17;
  void *v18;
  _DWORD *v19;
  int v20;
  id v21;

  -[_UICollectionViewDragDestinationController _pauseReorderingDisplayLink](self, "_pauseReorderingDisplayLink", a3, a4);
  -[_UICollectionViewDragDestinationController dropProposalState](self);
  v5 = (id *)objc_claimAutoreleasedReturnValue();
  -[_UIDragDestinationControllerDropProposalState effectiveIndexPath](v5);
  v21 = (id)objc_claimAutoreleasedReturnValue();

  -[_UICollectionViewDragDestinationController dropProposalState](self);
  v6 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v6[8] = objc_msgSend(v6, "_hasDropActionTarget");

  if (self)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v9 = WeakRetained;
    if (WeakRetained)
      objc_msgSend(WeakRetained, "_incrementSessionRefCount");
  }
  else
  {
    v9 = 0;
  }

  -[_UICollectionViewDragDestinationController sessionState](self);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10 && *(_DWORD *)(v10 + 8) == 3)
    goto LABEL_11;
  -[_UICollectionViewDragDestinationController sessionState](self);
  v12 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12 && v12[2] == 1)
  {

LABEL_11:
LABEL_12:
    -[_UICollectionViewDragDestinationController _commitCurrentInteractiveReordering](self, "_commitCurrentInteractiveReordering");
    goto LABEL_13;
  }
  -[_UICollectionViewDragDestinationController sessionState](self);
  v15 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = v15[2];

    if (v16 == 5)
      goto LABEL_12;
  }
  else
  {

  }
  -[_UICollectionViewDragDestinationController sessionState](self);
  v17 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17 && v17[2] == 4)
  {

LABEL_23:
    -[_UICollectionViewDragDestinationController _commitCurrentDragAndDropSession](self, "_commitCurrentDragAndDropSession");
    goto LABEL_13;
  }
  -[_UICollectionViewDragDestinationController sessionState](self);
  v19 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = v19[2];

    if (v20 != 2)
      goto LABEL_13;
    goto LABEL_23;
  }

LABEL_13:
  if (self)
    v14 = objc_loadWeakRetained((id *)&self->_delegate);
  else
    v14 = 0;

}

- (void)dropInteraction:(id)a3 concludeDrop:(id)a4
{
  id WeakRetained;
  id v5;

  if (self && (WeakRetained = objc_loadWeakRetained((id *)&self->_delegate)) != 0)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "_invokeAllCompletionHandlers");
    objc_msgSend(v5, "_resetAllAnimationHandlers");
    objc_msgSend(v5, "_decrementSessionRefCount");

  }
  else
  {

  }
}

- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4
{
  _QWORD *v5;
  id v6;
  void *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  id v13;
  void *v14;
  char v15;
  id v16;

  v16 = a4;
  -[_UICollectionViewDragDestinationController sessionState](self);
  v5 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = (id)v5[2];
  else
    v6 = 0;

  v7 = v16;
  if (v6 != v16)
    goto LABEL_19;
  -[_UICollectionViewDragDestinationController _cancelCurrentInteractiveReorder](self, "_cancelCurrentInteractiveReorder");
  if (self)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v9 = WeakRetained;
    if (WeakRetained)
      objc_msgSend(WeakRetained, "_decrementSessionRefCount");
  }
  else
  {
    v9 = 0;
  }

  -[_UICollectionViewDragDestinationController _dropDelegateActual](self, "_dropDelegateActual");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[_UICollectionViewDragDestinationController _dropDelegateProxy](self, "_dropDelegateProxy");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      v13 = objc_loadWeakRetained((id *)&self->_collectionView);
    else
      v13 = 0;
    objc_msgSend(v12, "collectionView:dropSessionDidEnd:", v13, v16);
LABEL_15:

    goto LABEL_16;
  }
  -[_UICollectionViewDragDestinationController _dragDestinationDelegateActual](self, "_dragDestinationDelegateActual");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_opt_respondsToSelector();

  if ((v15 & 1) != 0)
  {
    -[_UICollectionViewDragDestinationController _dragDestinationDelegateProxy](self, "_dragDestinationDelegateProxy");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      v13 = objc_loadWeakRetained((id *)&self->_collectionView);
    else
      v13 = 0;
    objc_msgSend(v12, "_collectionView:dropSessionDidEnd:", v13, v16);
    goto LABEL_15;
  }
LABEL_16:
  if (self)
  {
    objc_storeStrong((id *)&self->_sessionState, 0);
    -[_UICollectionViewDragDestinationController setReorderingState:]((uint64_t)self);
    self = (_UICollectionViewDragDestinationController *)objc_loadWeakRetained((id *)&self->_collectionView);
  }
  else
  {
    -[_UICollectionViewDragDestinationController setReorderingState:](0);
  }
  -[_UICollectionViewDragDestinationController _resetDropTargetAppearance](self, "_resetDropTargetAppearance");

  v7 = v16;
LABEL_19:

}

- (id)dropInteraction:(id)a3 previewForDroppingItem:(id)a4 withDefault:(id)a5
{
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  void *v12;
  int v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  UIDragPreviewParameters *v18;
  void *v19;
  UITargetedDragPreview *v20;
  id v21;
  void *v22;
  void *v23;
  void (**v24)(_QWORD, _QWORD);
  void *v25;
  UIDragPreviewTarget *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  unint64_t v36;
  NSObject *v37;
  UIDragPreviewTarget *v38;
  NSObject *v40;
  uint8_t v41[16];
  _OWORD v42[3];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  else
    WeakRetained = 0;
  objc_msgSend(WeakRetained, "_dropCoordinatorItemForDragItem:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
LABEL_26:
    v20 = 0;
    goto LABEL_34;
  }
  v13 = objc_msgSend(v12, "kind");
  if (v13 == 2)
  {
    if (self)
      v21 = objc_loadWeakRetained((id *)&self->_delegate);
    else
      v21 = 0;
    objc_msgSend(v21, "_cellForDropCoordinatorItem:", v12);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v12, "previewParametersProvider");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23
        && (objc_msgSend(v12, "previewParametersProvider"),
            v24 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(),
            ((void (**)(_QWORD, void *))v24)[2](v24, v22),
            v25 = (void *)objc_claimAutoreleasedReturnValue(),
            v24,
            v25))
      {
        v20 = -[UITargetedPreview initWithView:parameters:]([UITargetedDragPreview alloc], "initWithView:parameters:", v22, v25);

      }
      else
      {
        v20 = -[UITargetedDragPreview initWithView:]([UITargetedDragPreview alloc], "initWithView:", v22);
      }
    }
    else
    {
      v20 = 0;
    }

    goto LABEL_34;
  }
  if (v13 == 1)
  {
    v26 = [UIDragPreviewTarget alloc];
    objc_msgSend(v12, "target");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "container");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "target");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "center");
    v31 = v30;
    v33 = v32;
    objc_msgSend(v12, "target");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v34;
    if (v34)
      objc_msgSend(v34, "transform");
    else
      memset(v42, 0, sizeof(v42));
    v38 = -[UIPreviewTarget initWithContainer:center:transform:](v26, "initWithContainer:center:transform:", v28, v42, v31, v33);

    objc_msgSend(v10, "retargetedPreviewWithTarget:", v38);
    v20 = (UITargetedDragPreview *)objc_claimAutoreleasedReturnValue();

    goto LABEL_34;
  }
  if (v13)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v41 = 0;
        _os_log_fault_impl(&dword_185066000, v40, OS_LOG_TYPE_FAULT, "Unknown drop coordinator item kind.", v41, 2u);
      }

    }
    else
    {
      v36 = dropInteraction_previewForDroppingItem_withDefault____s_category;
      if (!dropInteraction_previewForDroppingItem_withDefault____s_category)
      {
        v36 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v36, (unint64_t *)&dropInteraction_previewForDroppingItem_withDefault____s_category);
      }
      v37 = *(NSObject **)(v36 + 8);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v41 = 0;
        _os_log_impl(&dword_185066000, v37, OS_LOG_TYPE_ERROR, "Unknown drop coordinator item kind.", v41, 2u);
      }
    }
    goto LABEL_26;
  }
  if (self)
    v14 = objc_loadWeakRetained((id *)&self->_collectionView);
  else
    v14 = 0;
  objc_msgSend(v12, "destinationIndexPath");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_cellForItemAtIndexPath:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "destinationIndexPath");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionViewDragDestinationController _queryClientForPreviewParametersForItemAtIndexPath:](self, "_queryClientForPreviewParametersForItemAtIndexPath:", v17);
  v18 = (UIDragPreviewParameters *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    if (!v18)
    {
      v18 = objc_alloc_init(UIDragPreviewParameters);
      objc_msgSend(v16, "_visiblePathForBackgroundConfiguration");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPreviewParameters setVisiblePath:](v18, "setVisiblePath:", v19);

    }
    -[UIPreviewParameters setHidesSourceViewDuringDropAnimation:](v18, "setHidesSourceViewDuringDropAnimation:", 1);
    v20 = -[UITargetedPreview initWithView:parameters:]([UITargetedDragPreview alloc], "initWithView:parameters:", v16, v18);
  }
  else
  {
    v20 = 0;
  }

LABEL_34:
  return v20;
}

- (void)dropInteraction:(id)a3 item:(id)a4 willAnimateDropWithAnimator:(id)a5
{
  id v7;
  id v8;
  id *WeakRetained;
  id v10;
  _QWORD v11[5];
  id v12;

  v7 = a4;
  v8 = a5;
  if (self)
    WeakRetained = (id *)objc_loadWeakRetained((id *)&self->_delegate);
  else
    WeakRetained = 0;
  -[_UICollectionViewDragAndDropController dragDestinationController:willBeginDropAnimationForDragItem:animator:](WeakRetained, (uint64_t)self, v7, v8);

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __95___UICollectionViewDragDestinationController_dropInteraction_item_willAnimateDropWithAnimator___block_invoke;
  v11[3] = &unk_1E16BE3C0;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v8, "addCompletion:", v11);

}

- (int64_t)_dropInteraction:(id)a3 dataOwnerForSession:(id)a4
{
  id v5;
  void *v6;
  char v7;
  id WeakRetained;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  int64_t v17;

  v5 = a4;
  -[_UICollectionViewDragDestinationController _dropDelegateActual](self, "_dropDelegateActual");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    if (self)
      WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
    else
      WeakRetained = 0;
    objc_msgSend(v5, "locationInView:", WeakRetained);
    v10 = v9;
    v12 = v11;

    if (self)
      v13 = objc_loadWeakRetained((id *)&self->_collectionView);
    else
      v13 = 0;
    objc_msgSend(v13, "indexPathForItemAtPoint:", v10, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UICollectionViewDragDestinationController _dropDelegateProxy](self, "_dropDelegateProxy");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      v16 = objc_loadWeakRetained((id *)&self->_collectionView);
    else
      v16 = 0;
    v17 = objc_msgSend(v15, "_collectionView:dataOwnerForDropSession:withDestinationIndexPath:", v16, v5, v14);

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)_dragDestinationDelegateProxy
{
  id WeakRetained;
  void *v3;

  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  else
    WeakRetained = 0;
  objc_msgSend(WeakRetained, "_dragDestinationDelegateProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_dragDestinationDelegateActual
{
  id WeakRetained;
  void *v3;

  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  else
    WeakRetained = 0;
  objc_msgSend(WeakRetained, "_dragDestinationDelegateActual");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_dropDelegateProxy
{
  id WeakRetained;
  void *v3;

  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  else
    WeakRetained = 0;
  objc_msgSend(WeakRetained, "_dropDelegateProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_dropDelegateActual
{
  id WeakRetained;
  void *v3;

  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  else
    WeakRetained = 0;
  objc_msgSend(WeakRetained, "_dropDelegateActual");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_cancelInteractiveReorderingIfNeeded
{
  unsigned __int8 *v3;
  int v4;
  _BYTE *v5;
  id WeakRetained;
  id v7;

  -[_UICollectionViewDragDestinationController reorderingState]((id *)&self->super.isa);
  v3 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3[9];

    if (v4)
    {
      -[_UICollectionViewDragDestinationController reorderingState]((id *)&self->super.isa);
      v5 = (_BYTE *)objc_claimAutoreleasedReturnValue();
      if (v5)
        v5[9] = 0;

      if (self)
        WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
      else
        WeakRetained = 0;
      v7 = WeakRetained;
      objc_msgSend(WeakRetained, "cancelInteractiveMovement");

    }
  }
}

- (void)_endInteractiveReorderingIfNeeded
{
  unsigned __int8 *v3;
  int v4;
  _BYTE *v5;
  id WeakRetained;
  id v7;

  -[_UICollectionViewDragDestinationController reorderingState]((id *)&self->super.isa);
  v3 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3[9];

    if (v4)
    {
      -[_UICollectionViewDragDestinationController reorderingState]((id *)&self->super.isa);
      v5 = (_BYTE *)objc_claimAutoreleasedReturnValue();
      if (v5)
        v5[9] = 0;

      if (self)
        WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
      else
        WeakRetained = 0;
      v7 = WeakRetained;
      objc_msgSend(WeakRetained, "endInteractiveMovement");

    }
  }
}

- (id)_queryClientForPreviewParametersForItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  id WeakRetained;
  void *v9;

  v4 = a3;
  -[_UICollectionViewDragDestinationController _dropDelegateActual](self, "_dropDelegateActual");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[_UICollectionViewDragDestinationController _dropDelegateProxy](self, "_dropDelegateProxy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
    else
      WeakRetained = 0;
    objc_msgSend(v7, "collectionView:dropPreviewParametersForItemAtIndexPath:", WeakRetained, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_configureReorderingDisplayLinkIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  CADisplayLink *v7;
  void *v8;
  CADisplayLink *reorderDisplayLink;
  void *v10;
  CADisplayLink *v11;
  void *v12;
  CADisplayLink *v13;
  void *v14;

  if (!self || !self->_reorderDisplayLink)
  {
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "displayLinkWithTarget:selector:", self, sel__reorderingDisplayLinkDidTick);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (self)
    {
      objc_storeStrong((id *)&self->_reorderDisplayLink, v4);

      v6 = (void *)MEMORY[0x1E0C99E58];
      v7 = self->_reorderDisplayLink;
      objc_msgSend(v6, "mainRunLoop");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CADisplayLink addToRunLoop:forMode:](v7, "addToRunLoop:forMode:", v8, *MEMORY[0x1E0C99860]);

      reorderDisplayLink = self->_reorderDisplayLink;
    }
    else
    {

      objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(0, "addToRunLoop:forMode:", v14, *MEMORY[0x1E0C99860]);

      reorderDisplayLink = 0;
    }
    v10 = (void *)MEMORY[0x1E0C99E58];
    v11 = reorderDisplayLink;
    objc_msgSend(v10, "mainRunLoop");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CADisplayLink addToRunLoop:forMode:](v11, "addToRunLoop:forMode:", v12, CFSTR("UITrackingRunLoopMode"));

    if (self)
      v13 = self->_reorderDisplayLink;
    else
      v13 = 0;
    -[CADisplayLink setPaused:](v13, "setPaused:", 1);
  }
}

- (void)_pauseReorderingDisplayLink
{
  if (self)
    self = (_UICollectionViewDragDestinationController *)self->_reorderDisplayLink;
  -[_UICollectionViewDragDestinationController setPaused:](self, "setPaused:", 1);
}

- (void)_resumeReorderingDisplayLink
{
  if (self)
    self = (_UICollectionViewDragDestinationController *)self->_reorderDisplayLink;
  -[_UICollectionViewDragDestinationController setPaused:](self, "setPaused:", 0);
}

- (BOOL)_isLocalInteractiveMove
{
  _QWORD *v3;
  uint64_t v4;
  id WeakRetained;
  void *v6;
  void *v7;
  _QWORD *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;

  -[_UICollectionViewDragDestinationController sessionState](self);
  v3 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v8 = 0;
    v12 = 0;
LABEL_16:

    return v12;
  }
  v4 = v3[2];

  if (v4)
  {
    if (self)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v6 = WeakRetained;
      if (WeakRetained)
      {
        v7 = (void *)*((_QWORD *)WeakRetained + 7);
LABEL_6:
        v8 = v7;

        -[_UICollectionViewDragDestinationController sessionState](self);
        v9 = (_QWORD *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v9)
          v9 = (_QWORD *)v9[2];
        objc_msgSend(v9, "localDragSession");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = 0;
        if (v8 && v11)
        {
          -[_UICollectionViewDragSourceController dragSession](v8);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11 == v13)
            v12 = objc_msgSend(v11, "allowsMoveOperation");
          else
            v12 = 0;

        }
        goto LABEL_16;
      }
    }
    else
    {
      v6 = 0;
    }
    v7 = 0;
    goto LABEL_6;
  }
  return 0;
}

- (void)_reorderingDisplayLinkDidTick
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id WeakRetained;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  double v17;
  long double v18;
  long double v19;
  double v20;
  double v21;
  _QWORD *v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  _QWORD *v28;
  void *v29;
  void *v30;
  id v31;
  int v32;
  void *v33;
  id v34;
  uint64_t v35;
  _BYTE *v36;
  id v37;

  -[_UICollectionViewDragDestinationController reorderingState]((id *)&self->super.isa);
  v3 = objc_claimAutoreleasedReturnValue();
  -[_UICollectionViewDragDestinationController sessionState](self);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && *(_QWORD *)(v4 + 16))
  {
    if (self)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
      if (WeakRetained && *(_DWORD *)(v5 + 8) != 6)
      {
        objc_msgSend(*(id *)(v5 + 16), "locationInView:", WeakRetained);
        v9 = v7;
        v10 = v8;
        v11 = v3 ? *(void **)(v3 + 16) : 0;
        objc_msgSend(v11, "addSample:", v7, v8);
        if (v3)
        {
          v12 = *(_QWORD *)(v3 + 16);
          if (v12)
          {
            if (*(uint64_t *)(v12 + 48) >= 12)
            {
              if (fabs(*(double *)(v3 + 56)) < 2.22044605e-16)
                *(CFTimeInterval *)(v3 + 56) = CACurrentMediaTime();
              v13 = *(void **)(v3 + 32);
              if (!v13)
              {
                objc_msgSend((id)v3, "_reorderCadenceSettings");
                v14 = objc_claimAutoreleasedReturnValue();
                v15 = *(void **)(v3 + 32);
                *(_QWORD *)(v3 + 32) = v14;

                v13 = *(void **)(v3 + 32);
              }
              v16 = v13;
              objc_msgSend(v16, "dwellTimeThreshold");
              if (fabs(*(double *)(v3 + 56)) >= 2.22044605e-16 && CACurrentMediaTime() - *(double *)(v3 + 56) >= v17)
              {
                objc_msgSend(*(id *)(v3 + 16), "velocity");
                v20 = hypot(v18, v19);
                objc_msgSend(v16, "velocityMagnitudeThreshold");
                if (fabs(v21) < 2.22044605e-16 || v20 <= v21)
                {
                  -[_UICollectionViewDragDestinationController dropProposalState](self);
                  v22 = (_QWORD *)objc_claimAutoreleasedReturnValue();
                  v23 = v22;
                  if (v22)
                    v22 = (_QWORD *)v22[2];
                  v24 = objc_msgSend(v22, "intent");

                  v25 = objc_loadWeakRetained((id *)&self->_delegate);
                  v26 = v25;
                  if (v25)
                    v27 = (void *)*((_QWORD *)v25 + 7);
                  else
                    v27 = 0;
                  v28 = v27;
                  -[_UICollectionViewDragSourceController dragFromIndexPath](v28);
                  v29 = (void *)objc_claimAutoreleasedReturnValue();

                  v37 = 0;
                  objc_msgSend(WeakRetained, "_indexPathForInsertionAtPoint:dropIntent:sourceIndexPath:indicatorLayoutAttributes:", v24, v29, &v37, v9, v10);
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  v31 = v37;
                  -[_UICollectionViewDragDestinationController _updateDropProposalByQueryingClientIfNeeded:indicatorLayoutAttributes:](self, "_updateDropProposalByQueryingClientIfNeeded:indicatorLayoutAttributes:", v30, v31);
                  v32 = *(_DWORD *)(v5 + 8);
                  switch(v32)
                  {
                    case 3:
                      if (-[_UICollectionViewDragDestinationController shouldPerformMovementForCurrentProposal](self))
                      {
                        objc_msgSend(WeakRetained, "updateInteractiveMovementTargetPosition:", v9, v10);
                        -[_UIDragDestinationControllerReorderingState didReorder]((_QWORD *)v3);
                      }
                      break;
                    case 2:
                      if (v30
                        && -[_UICollectionViewDragDestinationController shouldPerformMovementForCurrentProposal](self))
                      {
                        if (*(_DWORD *)(v5 + 8) != 4)
                          *(_DWORD *)(v5 + 8) = 4;
                        v34 = objc_loadWeakRetained((id *)&self->_delegate);
                        v35 = -[_UICollectionViewDragAndDropController effectiveDragDestinationVisualStyle]((uint64_t)v34);

                        if (v35 != 2)
                          objc_msgSend(WeakRetained, "_beginReorderingItemAtIndexPath:isLegacyMovement:", v30, 0);
                        -[_UICollectionViewDragDestinationController reorderingState]((id *)&self->super.isa);
                        v36 = (_BYTE *)objc_claimAutoreleasedReturnValue();
                        if (v36)
                          v36[9] = 1;

                      }
                      break;
                    case 1:
                      if (v29
                        && -[_UICollectionViewDragDestinationController shouldPerformMovementForCurrentProposal](self))
                      {
                        objc_msgSend(WeakRetained, "_cellForItemAtIndexPath:", v29);
                        v33 = (void *)objc_claimAutoreleasedReturnValue();

                        if (v33)
                        {
                          objc_msgSend(WeakRetained, "_beginReorderingItemAtIndexPath:isLegacyMovement:", v29, 0);
                          objc_msgSend(WeakRetained, "updateInteractiveMovementTargetPosition:", v9, v10);
                          *(_BYTE *)(v3 + 9) = 1;
                          if (*(_DWORD *)(v5 + 8) != 3)
                            *(_DWORD *)(v5 + 8) = 3;
                        }
                        else if ((objc_msgSend(WeakRetained, "isScrollAnimating") & 1) == 0
                               && objc_msgSend(WeakRetained, "_globalIndexPathForItemAtIndexPath:", v29) != 0x7FFFFFFFFFFFFFFFLL)
                        {
                          objc_msgSend(WeakRetained, "_scrollToItemAtPresentationIndexPath:atScrollPosition:additionalInsets:animated:", v29, 0, 1, 0.0, 0.0, 0.0, 0.0);
                        }
                      }
                      break;
                    default:
                      if (v32 == 4
                        && v30
                        && -[_UICollectionViewDragDestinationController shouldPerformMovementForCurrentProposal](self))
                      {
                        objc_msgSend(WeakRetained, "updateInteractiveMovementTargetPosition:", v9, v10);
                      }
                      break;
                  }

                }
                else
                {
                  *(_QWORD *)(v3 + 56) = 0;
                }
              }

            }
          }
        }
      }
    }
    else
    {
      WeakRetained = 0;
    }

  }
}

- (BOOL)shouldPerformMovementForCurrentProposal
{
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _BOOL4 v6;
  _BOOL8 v7;

  if (!a1)
    return 0;
  -[_UICollectionViewDragDestinationController dropProposalState](a1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)v1;
  if (v1)
    v3 = *(void **)(v1 + 16);
  else
    v3 = 0;
  v4 = v3;

  v5 = objc_msgSend(v4, "intent");
  v6 = objc_msgSend(v4, "operation") == 2 || objc_msgSend(v4, "operation") == 3;
  v7 = v5 == 1 && v6;

  return v7;
}

- (void)_commitCurrentDragAndDropSession
{
  id *p_isa;
  _DWORD *v3;
  void *v4;
  char v5;
  id WeakRetained;
  void *v7;
  char v8;
  id v9;

  p_isa = (id *)&self->super.isa;
  -[_UICollectionViewDragDestinationController sessionState](self);
  v3 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  if (v3 && v3[2] != 6)
    v3[2] = 6;

  objc_msgSend(p_isa, "_endInteractiveReorderingIfNeeded");
  objc_msgSend(p_isa, "_dropDelegateActual");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    objc_msgSend(p_isa, "_dropDelegateProxy");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (p_isa)
    {
      WeakRetained = objc_loadWeakRetained(p_isa + 1);
      p_isa = (id *)objc_loadWeakRetained(p_isa + 3);
    }
    else
    {
      WeakRetained = 0;
    }
    objc_msgSend(v9, "collectionView:performDropWithCoordinator:", WeakRetained, p_isa);
LABEL_12:

    return;
  }
  objc_msgSend(p_isa, "_dragDestinationDelegateActual");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    objc_msgSend(p_isa, "_dragDestinationDelegateProxy");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (p_isa)
    {
      WeakRetained = objc_loadWeakRetained(p_isa + 1);
      p_isa = (id *)objc_loadWeakRetained(p_isa + 3);
    }
    else
    {
      WeakRetained = 0;
    }
    objc_msgSend(v9, "_collectionView:performDropWithCoordinator:", WeakRetained, p_isa);
    goto LABEL_12;
  }
}

- (void)_cancelCurrentInteractiveReorder
{
  _DWORD *v3;
  int v4;

  -[_UICollectionViewDragDestinationController sessionState](self);
  v3 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3[2];

    if (v4 == 3)
      -[_UICollectionViewDragDestinationController _cancelInteractiveReorderingIfNeeded](self, "_cancelInteractiveReorderingIfNeeded");
  }
}

- (void)_commitCurrentInteractiveReordering
{
  id WeakRetained;
  _DWORD *v5;
  id *v6;
  void *v7;
  void *v8;
  int v9;
  _BOOL4 v10;
  id *v11;
  void *v12;
  id v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  _QWORD *v21;
  _BOOL4 v22;
  _BOOL8 v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  id *v49;
  id v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _QWORD v56[4];
  id v57;
  _BYTE v58[128];
  _QWORD v59[3];

  v59[1] = *MEMORY[0x1E0C80C00];
  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  else
    WeakRetained = 0;
  -[_UICollectionViewDragDestinationController sessionState](self);
  v5 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  if (v5 && v5[2] != 6)
    v5[2] = 6;

  if (self)
    v6 = (id *)objc_loadWeakRetained((id *)&self->_delegate);
  else
    v6 = 0;
  if (!objc_msgSend(WeakRetained, "_dataSourceImplementsReorderingHandlers"))
  {
    v9 = objc_msgSend(WeakRetained, "_supportsAutomaticCatalystDragAndDropReordering");
    if (v6)
      v10 = (unint64_t)objc_msgSend(v6[21], "count") < 2;
    else
      v10 = 1;
    if ((v9 & v10 & 1) != 0)
    {
      v7 = 0;
      goto LABEL_17;
    }
LABEL_32:
    -[_UICollectionViewDragDestinationController _cancelInteractiveReorderingIfNeeded](self, "_cancelInteractiveReorderingIfNeeded");
    -[_UICollectionViewDragDestinationController _dropDelegateActual](self, "_dropDelegateActual");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_opt_respondsToSelector();

    if ((v25 & 1) != 0)
    {
      -[_UICollectionViewDragDestinationController _dropDelegateProxy](self, "_dropDelegateProxy");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "collectionView:performDropWithCoordinator:", WeakRetained, v6);
    }
    else
    {
      -[_UICollectionViewDragDestinationController _dragDestinationDelegateActual](self, "_dragDestinationDelegateActual");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_opt_respondsToSelector();

      if ((v28 & 1) == 0)
        goto LABEL_37;
      -[_UICollectionViewDragDestinationController _dragDestinationDelegateProxy](self, "_dragDestinationDelegateProxy");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "_collectionView:performDropWithCoordinator:", WeakRetained, v6);
    }

    goto LABEL_37;
  }
  if (v6 && (unint64_t)objc_msgSend(v6[21], "count") > 1)
    goto LABEL_32;
  objc_msgSend(WeakRetained, "_diffableDataSourceImpl");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionViewDragDestinationController.m"), 791, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dataSourceImpl"));

  }
LABEL_17:
  v11 = v6;
  objc_msgSend(v11, "proposal");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "operation") != 3 || objc_msgSend(v12, "intent") != 1)
    goto LABEL_31;
  if (v11)
    v13 = v11[7];
  else
    v13 = 0;
  v14 = v13;
  -[_UICollectionViewDragSourceController dragFromIndexPath](v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "destinationIndexPath");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (!v15 || !v16)
  {

LABEL_31:
    goto LABEL_32;
  }
  -[_UICollectionViewDragDestinationController _endInteractiveReorderingIfNeeded](self, "_endInteractiveReorderingIfNeeded");
  v18 = -[_UICollectionViewDragAndDropController effectiveDragDestinationVisualStyle]((uint64_t)v11);
  v19 = v18;
  v51 = v17;
  v48 = v7;
  v49 = v6;
  v47 = v12;
  if (v7)
  {
    if (v11)
      v20 = v11[7];
    else
      v20 = 0;
    v21 = v20;
    v22 = -[_UICollectionViewDragSourceController dragItemsCreatedForReordering](v21);
    v23 = v19 == 2 && v22;

    objc_msgSend(v7, "_commitReorderingForItemAtIndexPath:toDestinationIndexPath:shouldPerformViewAnimations:", v15, v17, v23);
  }
  else if (v18 == 2)
  {
    v29 = -[UICollectionViewUpdateItem initWithOldIndexPath:newIndexPath:]([UICollectionViewUpdateItem alloc], v15, v17);
    objc_msgSend(off_1E167C258, "snapshotterForDataSourceBackedView:", WeakRetained);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v59[0] = v29;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIDataSourceUpdateMap mapForInitialSnapshot:orderedUpdateItems:](_UIDataSourceUpdateMap, "mapForInitialSnapshot:orderedUpdateItems:", v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v56[0] = MEMORY[0x1E0C809B0];
    v56[1] = 3221225472;
    v56[2] = __81___UICollectionViewDragDestinationController__commitCurrentInteractiveReordering__block_invoke;
    v56[3] = &unk_1E16BDC20;
    v57 = v32;
    v33 = v32;
    -[_UICollectionViewDragAndDropController rebaseCellAppearanceStatesForUpdates:]((uint64_t)v11, v56);
    objc_msgSend(WeakRetained, "_notifyDataSourceForMoveOfItemFromIndexPath:toIndexPath:", v15, v51);
    objc_msgSend(WeakRetained, "moveItemAtIndexPath:toIndexPath:", v15, v51);

  }
  v50 = WeakRetained;
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v34 = v11;
  objc_msgSend(v11, "items");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v37; ++i)
      {
        if (*(_QWORD *)v53 != v38)
          objc_enumerationMutation(v35);
        v40 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
        objc_msgSend(v40, "sourceIndexPath");
        v41 = objc_claimAutoreleasedReturnValue();
        if (v41)
        {
          v42 = (void *)v41;
          objc_msgSend(v40, "sourceIndexPath");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = objc_msgSend(v43, "isEqual:", v15);

          if (v44)
          {
            objc_msgSend(v40, "dragItem");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = (id)objc_msgSend(v34, "dropItem:toItemAtIndexPath:", v45, v51);

          }
        }
      }
      v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
    }
    while (v37);
  }

  v6 = v49;
  WeakRetained = v50;
LABEL_37:

}

- (BOOL)_isMultiItemSource
{
  id WeakRetained;
  void *v3;
  void *v4;
  _QWORD *v5;
  BOOL v6;

  if (self)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v3 = WeakRetained;
    if (WeakRetained)
    {
      v4 = (void *)*((_QWORD *)WeakRetained + 7);
      goto LABEL_4;
    }
  }
  else
  {
    v3 = 0;
  }
  v4 = 0;
LABEL_4:
  v5 = v4;

  if (v5)
    v6 = -[_UICollectionViewDragSourceController currentSessionItemCount](v5) > 1;
  else
    v6 = 0;

  return v6;
}

- (void)_updateDropProposalByQueryingClientIfNeeded:(id)a3 indicatorLayoutAttributes:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  UICollectionViewDropProposal *v21;
  void *v22;
  void *v23;
  void *v24;
  id WeakRetained;
  void *v26;
  void *v27;
  _QWORD *v28;
  _BOOL4 v29;
  UICollectionViewDropProposal *v30;
  UICollectionViewDropProposal *v31;
  uint64_t v32;
  void *v33;
  id v34;
  void *v35;
  id v36;

  v36 = a3;
  v6 = a4;
  if (!-[_UICollectionViewDragDestinationController _shouldQueryDropActionForIndexPath:](self, "_shouldQueryDropActionForIndexPath:", v36))goto LABEL_37;
  if (v36)
  {
    -[_UICollectionViewDragDestinationController dropProposalState](self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UICollectionCompositionalLayoutSolverOptions setLayoutAttributesClass:]((uint64_t)v7, v36);

  }
  -[_UICollectionViewDragDestinationController _dragDestinationDelegateActual](self, "_dragDestinationDelegateActual");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    -[_UICollectionViewDragDestinationController _dropDelegateActual](self, "_dropDelegateActual");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
      goto LABEL_7;
    if (!-[_UICollectionViewDragDestinationController _isLocalInteractiveMove](self, "_isLocalInteractiveMove"))
    {
      v30 = [UICollectionViewDropProposal alloc];
      v32 = 2;
      goto LABEL_30;
    }
    if (self)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v26 = WeakRetained;
      if (WeakRetained)
      {
        v27 = (void *)*((_QWORD *)WeakRetained + 7);
LABEL_26:
        v28 = v27;
        v29 = -[_UICollectionViewDragSourceController dragItemsCreatedForReordering](v28);

        v30 = [UICollectionViewDropProposal alloc];
        if (v29)
        {
          v31 = -[UICollectionViewDropProposal initWithDropOperation:intent:](v30, "initWithDropOperation:intent:", 3, 1);
          -[_UICollectionViewDragDestinationController _effectiveDropProposalForProposal:](self, "_effectiveDropProposalForProposal:", v31);
          v21 = (UICollectionViewDropProposal *)objc_claimAutoreleasedReturnValue();

          goto LABEL_31;
        }
        v32 = 0;
LABEL_30:
        v21 = -[UICollectionViewDropProposal initWithDropOperation:intent:](v30, "initWithDropOperation:intent:", v32, 0);
LABEL_31:
        -[_UICollectionViewDragDestinationController dropProposalState](self);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v33;
        if (v33)
          objc_msgSend(v33, "setProposal:", v21);
        goto LABEL_33;
      }
    }
    else
    {
      v26 = 0;
    }
    v27 = 0;
    goto LABEL_26;
  }

LABEL_7:
  -[_UICollectionViewDragDestinationController _dropDelegateActual](self, "_dropDelegateActual");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    -[_UICollectionViewDragDestinationController _dropDelegateProxy](self, "_dropDelegateProxy");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      v14 = objc_loadWeakRetained((id *)&self->_collectionView);
    else
      v14 = 0;
    -[_UICollectionViewDragDestinationController sessionState](self);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (v15)
      v17 = *(_QWORD *)(v15 + 16);
    else
      v17 = 0;
    objc_msgSend(v13, "collectionView:dropSessionDidUpdate:withDestinationIndexPath:", v14, v17, v36);
    v18 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[_UICollectionViewDragDestinationController _dragDestinationDelegateProxy](self, "_dragDestinationDelegateProxy");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      v14 = objc_loadWeakRetained((id *)&self->_collectionView);
    else
      v14 = 0;
    -[_UICollectionViewDragDestinationController sessionState](self);
    v19 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v19;
    if (v19)
      v20 = *(_QWORD *)(v19 + 16);
    else
      v20 = 0;
    objc_msgSend(v13, "_collectionView:dropSessionDidUpdate:withDestinationIndexPath:", v14, v20, v36);
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v21 = (UICollectionViewDropProposal *)v18;

  if (!v21)
    goto LABEL_34;
  -[_UICollectionViewDragDestinationController _effectiveDropProposalForProposal:](self, "_effectiveDropProposalForProposal:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionViewDragDestinationController dropProposalState](self);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
    objc_msgSend(v23, "setProposal:", v22);

LABEL_33:
LABEL_34:

  if (self)
    v34 = objc_loadWeakRetained((id *)&self->_collectionView);
  else
    v34 = 0;
  -[_UICollectionViewDragDestinationController currentDropProposal](self);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "_updateDropTargetAppearanceWithTargetIndexPath:intent:indicatorLayoutAttributes:", v36, objc_msgSend(v35, "intent"), v6);

LABEL_37:
}

- (id)_effectiveDropProposalForProposal:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  void *v8;
  int v9;
  id WeakRetained;
  void *v11;
  void *v12;
  id *v13;
  void *v14;

  v4 = a3;
  v5 = objc_msgSend(v4, "intent");
  v6 = objc_msgSend(v4, "operation");

  if (v6 == 3)
  {
    -[_UICollectionViewDragDestinationController sessionState](self);
    v7 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      v7 = (_QWORD *)v7[2];
    v9 = objc_msgSend(v7, "allowsMoveOperation");

    if (v9)
      v6 = 3;
    else
      v6 = 0;
  }
  if (-[_UICollectionViewDragDestinationController _isLocalInteractiveMove](self, "_isLocalInteractiveMove"))
  {
    if (-[_UICollectionViewDragDestinationController _isMultiItemSource](self, "_isMultiItemSource"))
    {
      if (v5 == 1)
      {
        v6 = 0;
        v5 = 0;
      }
    }
    else if ((dyld_program_sdk_at_least() & 1) == 0)
    {
      if (self)
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      else
        WeakRetained = 0;
      -[_UICollectionViewDragAndDropController sourceIndexPaths]((uint64_t)WeakRetained);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      -[_UICollectionViewDragDestinationController dropProposalState](self);
      v13 = (id *)objc_claimAutoreleasedReturnValue();
      -[_UIDragDestinationControllerDropProposalState effectiveIndexPath](v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12 && objc_msgSend(v12, "isEqual:", v14))
      {
        v6 = 0;
        v5 = 0;
      }

    }
  }
  return -[UICollectionViewDropProposal initWithDropOperation:intent:]([UICollectionViewDropProposal alloc], "initWithDropOperation:intent:", v6, v5);
}

- (BOOL)_shouldQueryDropActionForIndexPath:(id)a3
{
  id *v5;
  void *v6;
  BOOL v7;
  id WeakRetained;
  void *v9;
  id *v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  void *v25;

  -[_UICollectionViewDragDestinationController dropProposalState](self);
  v5 = (id *)objc_claimAutoreleasedReturnValue();
  -[_UIDragDestinationControllerDropProposalState effectiveIndexPath](v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 1;
  if (!a3 && v6)
  {
    if (self)
      WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
    else
      WeakRetained = 0;
    objc_msgSend(WeakRetained, "collectionViewLayout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UICollectionViewDragDestinationController dropProposalState](self);
    v10 = (id *)objc_claimAutoreleasedReturnValue();
    -[_UIDragDestinationControllerDropProposalState effectiveIndexPath](v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layoutAttributesForItemAtIndexPath:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[_UICollectionViewDragDestinationController sessionState](self);
      v13 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        v25 = 0;
        v7 = 1;
        goto LABEL_14;
      }
      v14 = v13[2];

      if (v14)
      {
        -[_UICollectionViewDragDestinationController sessionState](self);
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)v15;
        v17 = v15 ? *(void **)(v15 + 16) : 0;
        v18 = v17;
        v19 = self ? objc_loadWeakRetained((id *)&self->_collectionView) : 0;
        objc_msgSend(v18, "locationInView:", v19);
        v21 = v20;
        v23 = v22;

        -[_UICollectionViewDragDestinationController _computeNextItemAttributesStartingFromItemAttributes:withCurrentDragLocation:](self, "_computeNextItemAttributesStartingFromItemAttributes:withCurrentDragLocation:", v12, v21, v23);
        v24 = objc_claimAutoreleasedReturnValue();
        if (v24)
        {
          v25 = (void *)v24;
          v7 = -[_UICollectionViewDragDestinationController _hasGapLargeEnoughToRequireDropActionCallForCurrentItemAttributes:proposedNextItemAttributes:](self, "_hasGapLargeEnoughToRequireDropActionCallForCurrentItemAttributes:proposedNextItemAttributes:", v12, v24);
LABEL_14:

LABEL_16:
          return v7;
        }
      }
    }
    v7 = 1;
    goto LABEL_16;
  }
  return v7;
}

- (id)_computeNextItemAttributesStartingFromItemAttributes:(id)a3 withCurrentDragLocation:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  double v9;
  double v10;
  double width;
  double height;
  CGFloat v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id WeakRetained;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  id v27;
  void *v28;
  double v30;
  double v31;
  double v32;
  double v33;
  _QWORD v34[6];
  _QWORD v35[4];
  id v36;
  id v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "frame");
    v9 = v38.origin.x;
    v10 = v38.origin.y;
    width = v38.size.width;
    height = v38.size.height;
    v13 = CGRectGetWidth(v38) * 0.25;
    v39.origin.x = v9;
    v39.origin.y = v10;
    v39.size.width = width;
    v39.size.height = height;
    v14 = CGRectGetHeight(v39) * 0.25;
    v40.origin.x = v9;
    v40.origin.y = v10;
    v40.size.width = width;
    v40.size.height = height;
    v41 = CGRectInset(v40, v13, v14);
    v31 = v41.origin.y;
    v32 = v41.origin.x;
    v30 = v41.size.width;
    v15 = v41.size.height;
    v33 = v9 + width * 0.5;
    v16 = x - v33;
    v17 = y - (v10 + height * 0.5);
    v41.origin.x = v9;
    v41.origin.y = v10;
    v41.size.width = width;
    v41.size.height = height;
    v18 = CGRectGetWidth(v41);
    v42.origin.x = v9;
    v42.origin.y = v10;
    v42.size.width = width;
    v42.size.height = height;
    v19 = CGRectGetHeight(v42);
    if (v18 >= v19)
      v19 = v18;
    v20 = v19 * 4.0;
    if (self)
      WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
    else
      WeakRetained = 0;
    objc_msgSend(WeakRetained, "collectionViewLayout");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "_layoutAttributesForElementsInProjectedRect:withProjectionVector:projectionDistance:", v32, v31, v30, v15, v16, v17, v20);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v23, "mutableCopy");

    v25 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    v26 = MEMORY[0x1E0C809B0];
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __123___UICollectionViewDragDestinationController__computeNextItemAttributesStartingFromItemAttributes_withCurrentDragLocation___block_invoke;
    v35[3] = &unk_1E16BE480;
    v36 = v25;
    v37 = v8;
    v27 = v25;
    objc_msgSend(v24, "enumerateObjectsUsingBlock:", v35);
    objc_msgSend(v24, "removeObjectsAtIndexes:", v27);
    v34[0] = v26;
    v34[1] = 3221225472;
    v34[2] = __123___UICollectionViewDragDestinationController__computeNextItemAttributesStartingFromItemAttributes_withCurrentDragLocation___block_invoke_2;
    v34[3] = &__block_descriptor_48_e79_q24__0__UICollectionViewLayoutAttributes_8__UICollectionViewLayoutAttributes_16l;
    *(double *)&v34[4] = v33;
    *(double *)&v34[5] = v10 + height * 0.5;
    objc_msgSend(v24, "sortUsingComparator:", v34);
    objc_msgSend(v24, "firstObject");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (BOOL)_hasGapLargeEnoughToRequireDropActionCallForCurrentItemAttributes:(id)a3 proposedNextItemAttributes:(id)a4
{
  id v5;
  id v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  long double v28;
  long double v29;
  long double v30;
  double Height;
  CGFloat v33;
  CGFloat v34;
  double v35;
  double v36;
  CGFloat v37;
  CGRect v38;
  CGRect v39;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "frame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend(v6, "center");
  v35 = v16;
  v36 = v15;

  objc_msgSend(v5, "frame");
  v33 = v18;
  v34 = v17;
  v20 = v19;
  v22 = v21;
  objc_msgSend(v5, "center");
  v24 = v23;
  v26 = v25;

  v37 = v10;
  v27 = UIDistanceBetweenRects(v8, v10, v12, v14, v34, v20, v33, v22);
  v28 = v24 - v36;
  v29 = v26 - v35;
  v30 = hypot(v28, v29);
  if (fabs(v28 / v30) <= fabs(v29 / v30))
  {
    v39.origin.x = v8;
    v39.origin.y = v37;
    v39.size.width = v12;
    v39.size.height = v14;
    Height = CGRectGetHeight(v39);
  }
  else
  {
    v38.origin.x = v8;
    v38.origin.y = v37;
    v38.size.width = v12;
    v38.size.height = v14;
    Height = CGRectGetWidth(v38);
  }
  return v27 > Height * 0.5;
}

- (void)rebaseForUpdates:(_QWORD *)a1
{
  unsigned __int8 *v3;
  int v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void (**v10)(id, _QWORD);

  v10 = a2;
  if (a1)
  {
    -[_UICollectionViewDragDestinationController dropProposalState](a1);
    v3 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
    if (!v3 || (v4 = v3[8], v3, !v4))
    {
      -[_UICollectionViewDragDestinationController dropProposalState](a1);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)v5;
      if (v5)
        v7 = *(_QWORD *)(v5 + 24);
      else
        v7 = 0;
      v10[2](v10, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[_UICollectionViewDragDestinationController dropProposalState](a1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UICollectionCompositionalLayoutSolverOptions setLayoutAttributesClass:]((uint64_t)v9, v8);

    }
  }

}

@end
