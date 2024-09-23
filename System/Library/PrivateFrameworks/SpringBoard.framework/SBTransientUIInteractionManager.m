@implementation SBTransientUIInteractionManager

- (SBTransientUIInteractionManager)initWithSystemGestureManager:(id)a3
{
  id v4;
  SBTransientUIInteractionManager *v5;
  SBTransientUIInteractionManager *v6;
  uint64_t v7;
  NSHashTable *tapToDismissParticipants;
  uint64_t v9;
  NSHashTable *tapToUnhideParticipants;
  uint64_t v11;
  NSHashTable *indirectPanToParticipants;
  SBFailingSystemGestureRecognizer *dismissGestureRecognizer;
  UITapGestureRecognizer *unhideTapRecognizer;
  UITapGestureRecognizer *unhideDoubleTapRecognizer;
  UIPanGestureRecognizer *indirectPanRecognizer;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SBTransientUIInteractionManager;
  v5 = -[SBTransientUIInteractionManager init](&v18, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_systemGestureManager, v4);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v7 = objc_claimAutoreleasedReturnValue();
    tapToDismissParticipants = v6->_tapToDismissParticipants;
    v6->_tapToDismissParticipants = (NSHashTable *)v7;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v9 = objc_claimAutoreleasedReturnValue();
    tapToUnhideParticipants = v6->_tapToUnhideParticipants;
    v6->_tapToUnhideParticipants = (NSHashTable *)v9;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v11 = objc_claimAutoreleasedReturnValue();
    indirectPanToParticipants = v6->_indirectPanToParticipants;
    v6->_indirectPanToParticipants = (NSHashTable *)v11;

    dismissGestureRecognizer = v6->_dismissGestureRecognizer;
    v6->_dismissGestureRecognizer = 0;

    unhideTapRecognizer = v6->_unhideTapRecognizer;
    v6->_unhideTapRecognizer = 0;

    unhideDoubleTapRecognizer = v6->_unhideDoubleTapRecognizer;
    v6->_unhideDoubleTapRecognizer = 0;

    indirectPanRecognizer = v6->_indirectPanRecognizer;
    v6->_indirectPanRecognizer = 0;

  }
  return v6;
}

- (UIWindow)window
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_systemGestureManager);
  objc_msgSend(WeakRetained, "windowForSystemGestures");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIWindow *)v3;
}

- (void)_screenWasTappedToUnhide:(id)a3
{
  UITapGestureRecognizer *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (UITapGestureRecognizer *)a3;
  if (self->_unhideTapRecognizer == v4)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = (void *)-[NSHashTable copy](self->_tapToUnhideParticipants, "copy", 0);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "transientUI:wasTappedToUnhideFromGestureRecognizer:", self, v4);
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
}

- (void)_screenWasIndirectPannedToDismiss:(id)a3
{
  UIPanGestureRecognizer *v4;
  UIPanGestureRecognizer *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (UIPanGestureRecognizer *)a3;
  v5 = v4;
  if (self->_indirectPanRecognizer == v4 && -[UIPanGestureRecognizer state](v4, "state") == 1)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = (void *)-[NSHashTable copy](self->_indirectPanToParticipants, "copy", 0);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "transientUI:wasIndirectPannedToDismissFromGestureRecognizer:", self, v5);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  UITapGestureRecognizer *v6;
  id v7;
  uint64_t v8;
  void *v9;
  char v10;
  uint64_t v11;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = (UITapGestureRecognizer *)a3;
  v7 = a4;
  if ((UITapGestureRecognizer *)self->_dismissGestureRecognizer == v6)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v9 = (void *)-[NSHashTable copy](self->_tapToDismissParticipants, "copy", 0);
    v8 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v10 = 0;
      v11 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v9);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "transientUIHandledTouch:withSystemGestureRecognizer:", v7, v6))v10 = 1;
        }
        v8 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
      LOBYTE(v8) = v10 & 1;
    }

  }
  else
  {
    LOBYTE(v8) = self->_unhideTapRecognizer == v6 || self->_unhideDoubleTapRecognizer == v6;
  }

  return v8;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (id)viewForSystemGestureRecognizer:(id)a3
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_systemGestureManager);
  objc_msgSend(WeakRetained, "windowForSystemGestures");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)registerParticipantForTapToDismiss:(id)a3
{
  SBFailingSystemGestureRecognizer *v4;
  SBFailingSystemGestureRecognizer *dismissGestureRecognizer;
  id WeakRetained;
  id v7;

  v7 = a3;
  if (!-[NSHashTable containsObject:](self->_tapToDismissParticipants, "containsObject:"))
    -[NSHashTable addObject:](self->_tapToDismissParticipants, "addObject:", v7);
  if (-[NSHashTable count](self->_tapToDismissParticipants, "count") && !self->_dismissGestureRecognizer)
  {
    v4 = objc_alloc_init(SBFailingSystemGestureRecognizer);
    dismissGestureRecognizer = self->_dismissGestureRecognizer;
    self->_dismissGestureRecognizer = v4;

    -[SBFailingSystemGestureRecognizer setName:](self->_dismissGestureRecognizer, "setName:", CFSTR("transientUI.dismiss"));
    -[SBFailingSystemGestureRecognizer setAllowedTouchTypes:](self->_dismissGestureRecognizer, "setAllowedTouchTypes:", &unk_1E91CE5F0);
    -[SBFailingSystemGestureRecognizer setDelegate:](self->_dismissGestureRecognizer, "setDelegate:", self);
    WeakRetained = objc_loadWeakRetained((id *)&self->_systemGestureManager);
    objc_msgSend(WeakRetained, "addGestureRecognizer:withType:", self->_dismissGestureRecognizer, 33);

  }
}

- (void)unregisterParticipantForTapToDismiss:(id)a3
{
  id WeakRetained;
  SBFailingSystemGestureRecognizer *dismissGestureRecognizer;
  id v6;

  v6 = a3;
  if (-[NSHashTable containsObject:](self->_tapToDismissParticipants, "containsObject:"))
    -[NSHashTable removeObject:](self->_tapToDismissParticipants, "removeObject:", v6);
  if (!-[NSHashTable count](self->_tapToDismissParticipants, "count") && self->_dismissGestureRecognizer)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_systemGestureManager);
    objc_msgSend(WeakRetained, "removeGestureRecognizer:", self->_dismissGestureRecognizer);

    dismissGestureRecognizer = self->_dismissGestureRecognizer;
    self->_dismissGestureRecognizer = 0;

  }
}

- (void)registerParticipantForTapToUnhide:(id)a3
{
  id WeakRetained;
  UITapGestureRecognizer *v5;
  UITapGestureRecognizer *unhideTapRecognizer;
  UITapGestureRecognizer *v7;
  UITapGestureRecognizer *unhideDoubleTapRecognizer;
  id v9;

  v9 = a3;
  if (!-[NSHashTable containsObject:](self->_tapToUnhideParticipants, "containsObject:"))
    -[NSHashTable addObject:](self->_tapToUnhideParticipants, "addObject:", v9);
  WeakRetained = objc_loadWeakRetained((id *)&self->_systemGestureManager);
  if (-[NSHashTable count](self->_tapToUnhideParticipants, "count"))
  {
    if (!self->_unhideTapRecognizer)
    {
      v5 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", self, sel__screenWasTappedToUnhide_);
      unhideTapRecognizer = self->_unhideTapRecognizer;
      self->_unhideTapRecognizer = v5;

      -[UITapGestureRecognizer setName:](self->_unhideTapRecognizer, "setName:", CFSTR("transientUI.unhide.tap"));
      -[UITapGestureRecognizer setCancelsTouchesInView:](self->_unhideTapRecognizer, "setCancelsTouchesInView:", 0);
      -[UITapGestureRecognizer setDelaysTouchesBegan:](self->_unhideTapRecognizer, "setDelaysTouchesBegan:", 0);
      -[UITapGestureRecognizer setDelaysTouchesEnded:](self->_unhideTapRecognizer, "setDelaysTouchesEnded:", 0);
      -[UITapGestureRecognizer setAllowedTouchTypes:](self->_unhideTapRecognizer, "setAllowedTouchTypes:", &unk_1E91CE608);
      -[UITapGestureRecognizer setDelegate:](self->_unhideTapRecognizer, "setDelegate:", self);
      objc_msgSend(WeakRetained, "addGestureRecognizer:withType:", self->_unhideTapRecognizer, 35);
    }
    if (!self->_unhideDoubleTapRecognizer)
    {
      v7 = (UITapGestureRecognizer *)objc_alloc_init(MEMORY[0x1E0CEAA88]);
      unhideDoubleTapRecognizer = self->_unhideDoubleTapRecognizer;
      self->_unhideDoubleTapRecognizer = v7;

      -[UITapGestureRecognizer setName:](self->_unhideDoubleTapRecognizer, "setName:", CFSTR("transientUI.unhide.doubleTap"));
      -[UITapGestureRecognizer setNumberOfTapsRequired:](self->_unhideDoubleTapRecognizer, "setNumberOfTapsRequired:", 2);
      -[UITapGestureRecognizer setCancelsTouchesInView:](self->_unhideDoubleTapRecognizer, "setCancelsTouchesInView:", 0);
      -[UITapGestureRecognizer setDelaysTouchesBegan:](self->_unhideDoubleTapRecognizer, "setDelaysTouchesBegan:", 0);
      -[UITapGestureRecognizer setDelaysTouchesEnded:](self->_unhideDoubleTapRecognizer, "setDelaysTouchesEnded:", 0);
      -[UITapGestureRecognizer setAllowedTouchTypes:](self->_unhideDoubleTapRecognizer, "setAllowedTouchTypes:", &unk_1E91CE620);
      -[UITapGestureRecognizer setDelegate:](self->_unhideDoubleTapRecognizer, "setDelegate:", self);
      -[UITapGestureRecognizer requireGestureRecognizerToFail:](self->_unhideTapRecognizer, "requireGestureRecognizerToFail:", self->_unhideDoubleTapRecognizer);
      objc_msgSend(WeakRetained, "addGestureRecognizer:withType:", self->_unhideDoubleTapRecognizer, 36);
    }
  }

}

- (void)unregisterParticipantForTapToUnhide:(id)a3
{
  id WeakRetained;
  UITapGestureRecognizer *unhideTapRecognizer;
  UITapGestureRecognizer *unhideDoubleTapRecognizer;
  id v7;

  v7 = a3;
  if (-[NSHashTable containsObject:](self->_tapToUnhideParticipants, "containsObject:"))
    -[NSHashTable removeObject:](self->_tapToUnhideParticipants, "removeObject:", v7);
  WeakRetained = objc_loadWeakRetained((id *)&self->_systemGestureManager);
  if (!-[NSHashTable count](self->_tapToUnhideParticipants, "count"))
  {
    objc_msgSend(WeakRetained, "removeGestureRecognizer:", self->_unhideTapRecognizer);
    unhideTapRecognizer = self->_unhideTapRecognizer;
    self->_unhideTapRecognizer = 0;

    objc_msgSend(WeakRetained, "removeGestureRecognizer:", self->_unhideDoubleTapRecognizer);
    unhideDoubleTapRecognizer = self->_unhideDoubleTapRecognizer;
    self->_unhideDoubleTapRecognizer = 0;

  }
}

- (void)registerParticipantForIndirectPanToDismiss:(id)a3
{
  UIPanGestureRecognizer *v4;
  UIPanGestureRecognizer *indirectPanRecognizer;
  id WeakRetained;
  id v7;

  v7 = a3;
  if (!-[NSHashTable containsObject:](self->_indirectPanToParticipants, "containsObject:"))
    -[NSHashTable addObject:](self->_indirectPanToParticipants, "addObject:", v7);
  if (-[NSHashTable count](self->_indirectPanToParticipants, "count") && !self->_indirectPanRecognizer)
  {
    v4 = (UIPanGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7F8]), "initWithTarget:action:", self, sel__screenWasIndirectPannedToDismiss_);
    indirectPanRecognizer = self->_indirectPanRecognizer;
    self->_indirectPanRecognizer = v4;

    -[UIPanGestureRecognizer setName:](self->_indirectPanRecognizer, "setName:", CFSTR("transientUI.dismiss.indirectPan"));
    -[UIPanGestureRecognizer setDelegate:](self->_indirectPanRecognizer, "setDelegate:", self);
    -[UIPanGestureRecognizer setAllowedTouchTypes:](self->_indirectPanRecognizer, "setAllowedTouchTypes:", MEMORY[0x1E0C9AA60]);
    -[UIPanGestureRecognizer setAllowedScrollTypesMask:](self->_indirectPanRecognizer, "setAllowedScrollTypesMask:", 3);
    WeakRetained = objc_loadWeakRetained((id *)&self->_systemGestureManager);
    objc_msgSend(WeakRetained, "addGestureRecognizer:withType:", self->_indirectPanRecognizer, 34);

  }
}

- (void)unregisterParticipantForIndirectPanToDismiss:(id)a3
{
  id WeakRetained;
  UIPanGestureRecognizer *indirectPanRecognizer;
  id v6;

  v6 = a3;
  if (-[NSHashTable containsObject:](self->_indirectPanToParticipants, "containsObject:"))
    -[NSHashTable removeObject:](self->_indirectPanToParticipants, "removeObject:", v6);
  if (!-[NSHashTable count](self->_indirectPanToParticipants, "count") && self->_indirectPanRecognizer)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_systemGestureManager);
    objc_msgSend(WeakRetained, "removeGestureRecognizer:", self->_indirectPanRecognizer);

    indirectPanRecognizer = self->_indirectPanRecognizer;
    self->_indirectPanRecognizer = 0;

  }
}

- (SBFailingSystemGestureRecognizer)dismissGestureRecognizer
{
  return self->_dismissGestureRecognizer;
}

- (void)setDismissGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_dismissGestureRecognizer, a3);
}

- (UITapGestureRecognizer)unhideTapRecognizer
{
  return self->_unhideTapRecognizer;
}

- (void)setUnhideTapRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_unhideTapRecognizer, a3);
}

- (UITapGestureRecognizer)unhideDoubleTapRecognizer
{
  return self->_unhideDoubleTapRecognizer;
}

- (void)setUnhideDoubleTapRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_unhideDoubleTapRecognizer, a3);
}

- (UIPanGestureRecognizer)indirectPanRecognizer
{
  return self->_indirectPanRecognizer;
}

- (void)setIndirectPanRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_indirectPanRecognizer, a3);
}

- (NSHashTable)tapToDismissParticipants
{
  return self->_tapToDismissParticipants;
}

- (void)setTapToDismissParticipants:(id)a3
{
  objc_storeStrong((id *)&self->_tapToDismissParticipants, a3);
}

- (NSHashTable)tapToUnhideParticipants
{
  return self->_tapToUnhideParticipants;
}

- (void)setTapToUnhideParticipants:(id)a3
{
  objc_storeStrong((id *)&self->_tapToUnhideParticipants, a3);
}

- (NSHashTable)indirectPanToParticipants
{
  return self->_indirectPanToParticipants;
}

- (void)setIndirectPanToParticipants:(id)a3
{
  objc_storeStrong((id *)&self->_indirectPanToParticipants, a3);
}

- (SBSystemGestureManager)systemGestureManager
{
  return (SBSystemGestureManager *)objc_loadWeakRetained((id *)&self->_systemGestureManager);
}

- (void)setSystemGestureManager:(id)a3
{
  objc_storeWeak((id *)&self->_systemGestureManager, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_systemGestureManager);
  objc_storeStrong((id *)&self->_indirectPanToParticipants, 0);
  objc_storeStrong((id *)&self->_tapToUnhideParticipants, 0);
  objc_storeStrong((id *)&self->_tapToDismissParticipants, 0);
  objc_storeStrong((id *)&self->_indirectPanRecognizer, 0);
  objc_storeStrong((id *)&self->_unhideDoubleTapRecognizer, 0);
  objc_storeStrong((id *)&self->_unhideTapRecognizer, 0);
  objc_storeStrong((id *)&self->_dismissGestureRecognizer, 0);
}

@end
