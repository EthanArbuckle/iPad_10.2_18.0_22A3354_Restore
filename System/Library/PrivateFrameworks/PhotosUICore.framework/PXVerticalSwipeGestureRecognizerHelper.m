@implementation PXVerticalSwipeGestureRecognizerHelper

- (PXVerticalSwipeGestureRecognizerHelper)init
{
  char *v2;
  uint64_t v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXVerticalSwipeGestureRecognizerHelper;
  v2 = -[PXVerticalSwipeGestureRecognizerHelper init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = v3;

    *(_WORD *)(v2 + 9) = 257;
  }
  return (PXVerticalSwipeGestureRecognizerHelper *)v2;
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateRespondsTo.shouldRecognizeSwipeDownGestureRecognizer = objc_opt_respondsToSelector() & 1;
  }

}

- (BOOL)verticalSwipeGestureRecognizerShouldBegin:(id)a3
{
  return -[PXVerticalSwipeGestureRecognizerHelper verticalSwipeGestureRecognizerShouldBegin:ignoringScrollViews:](self, "verticalSwipeGestureRecognizerShouldBegin:ignoringScrollViews:", a3, 0);
}

- (BOOL)verticalSwipeGestureRecognizerShouldBegin:(id)a3 ignoringScrollViews:(BOOL)a4
{
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  int v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  int v28;
  int v29;
  int v30;
  int v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  -[PXVerticalSwipeGestureRecognizerHelper _panGestureRecognizerForVerticalSwipeGestureRecognizer:](self, "_panGestureRecognizerForVerticalSwipeGestureRecognizer:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "velocityInView:", v7);
  v9 = v8;
  v11 = v10;

  MEMORY[0x1A85CCC64](fabs(v9), fabs(v11));
  PXRadiansToDegrees();
  v13 = v12;
  +[PXKitSettings sharedInstance](PXKitSettings, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v11 <= 0.0)
    objc_msgSend(v14, "upGesturesAngularToleranceInDegrees");
  else
    objc_msgSend(v14, "downGesturesAngularToleranceInDegrees");
  if (v13 < v16
    && (-[PXVerticalSwipeGestureRecognizerHelper allowSwipeUp](self, "allowSwipeUp") || v11 > 0.0)
    && (-[PXVerticalSwipeGestureRecognizerHelper allowSwipeDown](self, "allowSwipeDown") || v11 <= 0.0))
  {
    if (self->_delegateRespondsTo.shouldRecognizeSwipeDownGestureRecognizer)
    {
      -[PXVerticalSwipeGestureRecognizerHelper delegate](self, "delegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v20, "verticalSwipeGestureRecognizerHelper:shouldRecognizeSwipeDownGestureRecognizer:", self, v6);

      if (!v17)
        goto LABEL_10;
    }
    else
    {
      v17 = 1;
    }
    if (!a4)
    {
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      -[PXVerticalSwipeGestureRecognizerHelper dependentScrollViews](self, "dependentScrollViews");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectForKey:", v6);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v33;
        while (2)
        {
          for (i = 0; i != v24; ++i)
          {
            if (*(_QWORD *)v33 != v25)
              objc_enumerationMutation(v22);
            v27 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
            if ((objc_msgSend(v27, "px_hasHiddenAncestor") & 1) == 0)
            {
              v28 = objc_msgSend(v27, "px_isScrolledAtEdge:", 1);
              v29 = objc_msgSend(v27, "px_isScrolledAtEdge:", 3);
              v30 = ((v11 > 0.0) & (v28 ^ 1)) != 0 ? 0 : v17;
              v31 = (v28 & v29) != 0 ? v17 : 0;
              v17 = v11 <= 0.0 ? v31 : v30;
              if ((v17 & 1) == 0)
              {

                LOBYTE(v17) = 0;
                goto LABEL_10;
              }
            }
          }
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
          if (v24)
            continue;
          break;
        }
      }

      LOBYTE(v17) = v17 & 1;
    }
  }
  else
  {
    LOBYTE(v17) = 0;
  }
LABEL_10:
  -[PXVerticalSwipeGestureRecognizerHelper dependentScrollViews](self, "dependentScrollViews");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "removeObjectForKey:", v6);

  return v17;
}

- (BOOL)verticalSwipeGestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;

  v6 = a4;
  -[PXVerticalSwipeGestureRecognizerHelper _panGestureRecognizerForVerticalSwipeGestureRecognizer:](self, "_panGestureRecognizerForVerticalSwipeGestureRecognizer:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v8 = objc_msgSend(v6, "px_isPanGestureRecognizerOfScrollView:", &v15);

  v9 = v15;
  v10 = v9;
  if (v8 && (objc_msgSend(v9, "px_hasHiddenAncestor") & 1) == 0)
  {
    -[PXVerticalSwipeGestureRecognizerHelper dependentScrollViews](self, "dependentScrollViews");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXVerticalSwipeGestureRecognizerHelper dependentScrollViews](self, "dependentScrollViews");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKey:", v12, v7);

    }
    objc_msgSend(v12, "addObject:", v10);

  }
  return v8;
}

- (id)_panGestureRecognizerForVerticalSwipeGestureRecognizer:(id)a3
{
  id v5;
  void *v7;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXVerticalSwipeGestureRecognizerHelper.m"), 114, CFSTR("unexpected class for verticalSwipeGestureRecognizer %@"), v5);

  }
  return v5;
}

- (PXVerticalSwipeGestureRecognizerHelperDelegate)delegate
{
  return (PXVerticalSwipeGestureRecognizerHelperDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)allowSwipeUp
{
  return self->_allowSwipeUp;
}

- (void)setAllowSwipeUp:(BOOL)a3
{
  self->_allowSwipeUp = a3;
}

- (BOOL)allowSwipeDown
{
  return self->_allowSwipeDown;
}

- (void)setAllowSwipeDown:(BOOL)a3
{
  self->_allowSwipeDown = a3;
}

- (NSMapTable)dependentScrollViews
{
  return self->_dependentScrollViews;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dependentScrollViews, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
