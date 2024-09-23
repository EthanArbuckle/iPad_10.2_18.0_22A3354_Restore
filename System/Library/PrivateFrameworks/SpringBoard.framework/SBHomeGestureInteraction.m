@implementation SBHomeGestureInteraction

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a4;
  -[SBHomeGestureInteraction delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = objc_msgSend(v6, "homeGestureInteraction:shouldReceiveTouch:", self, v5);
  else
    v7 = 1;

  return v7;
}

- (SBHomeGestureInteractionDelegate)delegate
{
  return (SBHomeGestureInteractionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (SBHomeGestureInteraction)initWithSystemGestureManager:(id)a3 delegate:(id)a4
{
  id v8;
  id v9;
  SBHomeGestureInteraction *v10;
  void *v12;
  objc_super v13;

  v8 = a3;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SBHomeGestureInteraction;
  v10 = -[SBHomeGestureInteraction init](&v13, sel_init);
  if (v10)
  {
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, CFSTR("SBHomeGestureInteraction.m"), 37, CFSTR("invalid system gesture manager"));

    }
    objc_storeWeak((id *)&v10->_delegate, v9);
    v10->_enabled = 1;
    objc_storeStrong((id *)&v10->_gestureManager, a3);
    -[SBHomeGestureInteraction _configureGestureRecognizers](v10, "_configureGestureRecognizers");
  }

  return v10;
}

- (void)invalidate
{
  -[SBSystemGestureManager removeGestureRecognizer:](self->_gestureManager, "removeGestureRecognizer:", self->_screenEdgePanGestureRecognizer);
  -[SBSystemGestureManager removeGestureRecognizer:](self->_gestureManager, "removeGestureRecognizer:", self->_indirectPanGestureRecognizer);
  -[SBSystemGestureManager removeGestureRecognizer:](self->_gestureManager, "removeGestureRecognizer:", self->_scrunchGestureRecognizer);
}

- (void)dealloc
{
  objc_super v3;

  -[SBHomeGestureInteraction invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBHomeGestureInteraction;
  -[SBHomeGestureInteraction dealloc](&v3, sel_dealloc);
}

- (void)_configureGestureRecognizers
{
  void *v3;
  uint64_t v4;

  -[SBHomeGestureInteraction _configureScreenEdgePanGestureRecognizer](self, "_configureScreenEdgePanGestureRecognizer");
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    -[SBHomeGestureInteraction _configureIndirectPanGestureRecognizer](self, "_configureIndirectPanGestureRecognizer");
    -[SBHomeGestureInteraction _configureScrunchGestureRecognizer](self, "_configureScrunchGestureRecognizer");
  }
}

- (void)_configureScreenEdgePanGestureRecognizer
{
  uint64_t v3;
  uint64_t v4;
  SBHomeGesturePanGestureRecognizer *v5;
  SBHomeGesturePanGestureRecognizer *screenEdgePanGestureRecognizer;
  SBHomeGesturePanGestureRecognizer *v7;
  id v8;

  -[SBHomeGestureInteraction delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v8, "homeGestureInteraction:systemGestureTypeForType:", self, 1);
  if (v3)
  {
    v4 = v3;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v8, "customScreenEdgePanGestureRecognizerForHomeGestureInteraction:", self);
      v5 = (SBHomeGesturePanGestureRecognizer *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[SBHomeGesturePanGestureRecognizer homeGesturePanGestureRecognizerWithTarget:action:](SBHomeGesturePanGestureRecognizer, "homeGesturePanGestureRecognizerWithTarget:action:", 0, 0);
      v5 = (SBHomeGesturePanGestureRecognizer *)objc_claimAutoreleasedReturnValue();
      -[UIScreenEdgePanGestureRecognizer setEdges:](v5, "setEdges:", 4);
      -[SBHomeGesturePanGestureRecognizer setInstalledAsSystemGesture:](v5, "setInstalledAsSystemGesture:", 1);
    }
    -[SBHomeGesturePanGestureRecognizer addTarget:action:](v5, "addTarget:action:", self, sel__handleGestureRecognizer_);
    -[SBHomeGesturePanGestureRecognizer setDelegate:](v5, "setDelegate:", self);
    -[SBHomeGesturePanGestureRecognizer setAllowedTouchTypes:](v5, "setAllowedTouchTypes:", &unk_1E91CE758);
    screenEdgePanGestureRecognizer = self->_screenEdgePanGestureRecognizer;
    self->_screenEdgePanGestureRecognizer = v5;
    v7 = v5;

    -[SBSystemGestureManager addGestureRecognizer:withType:](self->_gestureManager, "addGestureRecognizer:withType:", v7, v4);
  }

}

- (void)_configureIndirectPanGestureRecognizer
{
  uint64_t v3;
  uint64_t v4;
  SBIndirectPanGestureRecognizer *v5;
  SBIndirectPanGestureRecognizer *indirectPanGestureRecognizer;
  SBIndirectPanGestureRecognizer *v7;
  id v8;

  -[SBHomeGestureInteraction delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v8, "homeGestureInteraction:systemGestureTypeForType:", self, 2);
  if (v3)
  {
    v4 = v3;
    v5 = -[SBIndirectPanGestureRecognizer initWithTarget:action:edges:]([SBIndirectPanGestureRecognizer alloc], "initWithTarget:action:edges:", self, sel__handleGestureRecognizer_, 4);
    -[SBIndirectPanGestureRecognizer setName:](v5, "setName:", CFSTR("indirectHomeInteractionGestureRecognizer"));
    -[SBIndirectPanGestureRecognizer setDelegate:](v5, "setDelegate:", self);
    -[SBIndirectPanGestureRecognizer setShouldInvertYAxis:](v5, "setShouldInvertYAxis:", 1);
    indirectPanGestureRecognizer = self->_indirectPanGestureRecognizer;
    self->_indirectPanGestureRecognizer = v5;
    v7 = v5;

    -[SBSystemGestureManager addGestureRecognizer:withType:](self->_gestureManager, "addGestureRecognizer:withType:", v7, v4);
  }

}

- (void)_configureScrunchGestureRecognizer
{
  uint64_t v3;
  uint64_t v4;
  SBFluidScrunchGestureRecognizer *v5;
  SBFluidScrunchGestureRecognizer *scrunchGestureRecognizer;
  SBFluidScrunchGestureRecognizer *v7;
  id v8;

  -[SBHomeGestureInteraction delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v8, "homeGestureInteraction:systemGestureTypeForType:", self, 3);
  if (v3)
  {
    v4 = v3;
    v5 = -[SBFluidScrunchGestureRecognizer initWithTarget:action:]([SBFluidScrunchGestureRecognizer alloc], "initWithTarget:action:", self, sel__handleGestureRecognizer_);
    -[SBFluidScrunchGestureRecognizer setDelegate:](v5, "setDelegate:", self);
    scrunchGestureRecognizer = self->_scrunchGestureRecognizer;
    self->_scrunchGestureRecognizer = v5;
    v7 = v5;

    -[SBSystemGestureManager addGestureRecognizer:withType:](self->_gestureManager, "addGestureRecognizer:withType:", v7, v4);
  }

}

- (void)_handleGestureRecognizer:(id)a3
{
  id v4;
  uint64_t v5;
  int64_t v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "state");
  v6 = -[SBHomeGestureInteraction typeOfGestureRecognizer:](self, "typeOfGestureRecognizer:", v4);

  -[SBHomeGestureInteraction delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  switch(v5)
  {
    case 1:
      self->_recognizedGestureType = v6;
      objc_msgSend(v7, "homeGestureInteractionBegan:", self);
      goto LABEL_4;
    case 2:
      objc_msgSend(v7, "homeGestureInteractionChanged:", self);
LABEL_4:
      v7 = v8;
      break;
    case 3:
      objc_msgSend(v7, "homeGestureInteractionEnded:", self);
      goto LABEL_7;
    case 4:
      objc_msgSend(v7, "homeGestureInteractionCancelled:", self);
LABEL_7:
      v7 = v8;
      if (self->_recognizedGestureType == v6)
        self->_recognizedGestureType = 0;
      break;
    default:
      break;
  }

}

- (id)viewForSystemGestureRecognizer:(id)a3
{
  SBHomeGestureInteractionDelegate **p_delegate;
  id v4;
  id WeakRetained;
  void *v6;

  p_delegate = &self->_delegate;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "viewForSystemGestureRecognizer:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[SBHomeGestureInteraction delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = objc_msgSend(v5, "homeGestureInteraction:shouldBeginGestureRecognizerOfType:", self, -[SBHomeGestureInteraction typeOfGestureRecognizer:](self, "typeOfGestureRecognizer:", v4));
  else
    v6 = 1;

  return v6;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  -[SBHomeGestureInteraction delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9 = objc_msgSend(v8, "homeGestureInteraction:shouldRecognizeSimultaneouslyWithGestureRecognizer:", self, v7);
  }
  else
  {
    -[SBHomeGestureInteraction gestureRecognizers](self, "gestureRecognizers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "containsObject:", v6) && (objc_msgSend(v10, "containsObject:", v7) & 1) != 0;

  }
  return v9;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a4;
  -[SBHomeGestureInteraction delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = objc_msgSend(v6, "homeGestureInteraction:shouldRequireFailureOfGestureRecognizer:", self, v5);
  else
    v7 = 0;

  return v7;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a4;
  -[SBHomeGestureInteraction delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = objc_msgSend(v6, "homeGestureInteraction:shouldBeRequiredToFailByGestureRecognizer:", self, v5);
  else
    v7 = 0;

  return v7;
}

- (CGPoint)locationInView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint result;

  v4 = a3;
  -[SBHomeGestureInteraction gestureRecognizerForType:](self, "gestureRecognizerForType:", self->_recognizedGestureType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "locationInView:", v4);
    v8 = v7;
    v10 = v9;
  }
  else
  {
    v8 = *MEMORY[0x1E0C9D538];
    v10 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }

  v11 = v8;
  v12 = v10;
  result.y = v12;
  result.x = v11;
  return result;
}

- (CGPoint)translationInView:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  v4 = a3;
  -[SBHomeGestureInteraction gestureRecognizerForType:](self, "gestureRecognizerForType:", self->_recognizedGestureType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "translationInView:", v4);
    v7 = v6;
    v9 = v8;
  }
  else
  {
    v7 = *MEMORY[0x1E0C9D538];
    v9 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }

  v10 = v7;
  v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (CGPoint)velocityInView:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  v4 = a3;
  -[SBHomeGestureInteraction gestureRecognizerForType:](self, "gestureRecognizerForType:", self->_recognizedGestureType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "velocityInView:", v4);
    v7 = v6;
    v9 = v8;
  }
  else
  {
    v7 = *MEMORY[0x1E0C9D538];
    v9 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }

  v10 = v7;
  v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_enabled != a3)
  {
    v3 = a3;
    self->_enabled = a3;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[SBHomeGestureInteraction gestureRecognizers](self, "gestureRecognizers", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setEnabled:", v3);
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

- (id)gestureRecognizerForType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
    return 0;
  else
    return *((id *)&self->_recognizedGestureType + a3);
}

- (int64_t)typeOfGestureRecognizer:(id)a3
{
  SBFluidScrunchGestureRecognizer *v4;
  int64_t v5;

  v4 = (SBFluidScrunchGestureRecognizer *)a3;
  if ((SBFluidScrunchGestureRecognizer *)self->_screenEdgePanGestureRecognizer == v4)
  {
    v5 = 1;
  }
  else if ((SBFluidScrunchGestureRecognizer *)self->_indirectPanGestureRecognizer == v4)
  {
    v5 = 2;
  }
  else if (self->_scrunchGestureRecognizer == v4)
  {
    v5 = 3;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSSet)gestureRecognizers
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_safeAddObject:", self->_screenEdgePanGestureRecognizer);
  objc_msgSend(v3, "bs_safeAddObject:", self->_indirectPanGestureRecognizer);
  objc_msgSend(v3, "bs_safeAddObject:", self->_scrunchGestureRecognizer);
  return (NSSet *)v3;
}

- (UIGestureRecognizer)recognizedGestureRecognizer
{
  return (UIGestureRecognizer *)-[SBHomeGestureInteraction gestureRecognizerForType:](self, "gestureRecognizerForType:", self->_recognizedGestureType);
}

- (double)indirectScreenEdgeGestureRecognitionDistance
{
  double result;

  if (self->_recognizedGestureType != 2)
    return 0.0;
  -[SBIndirectPanGestureRecognizer activationRecognitionDistance](self->_indirectPanGestureRecognizer, "activationRecognitionDistance");
  return result;
}

- (BOOL)_isGestureRunning:(id)a3
{
  return (unint64_t)(objc_msgSend(a3, "state") - 1) < 3;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (int64_t)recognizedGestureType
{
  return self->_recognizedGestureType;
}

- (void)setRecognizedGestureType:(int64_t)a3
{
  self->_recognizedGestureType = a3;
}

- (SBHomeGesturePanGestureRecognizer)screenEdgePanGestureRecognizer
{
  return self->_screenEdgePanGestureRecognizer;
}

- (void)setScreenEdgePanGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_screenEdgePanGestureRecognizer, a3);
}

- (SBIndirectPanGestureRecognizer)indirectPanGestureRecognizer
{
  return self->_indirectPanGestureRecognizer;
}

- (void)setIndirectPanGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_indirectPanGestureRecognizer, a3);
}

- (SBFluidScrunchGestureRecognizer)scrunchGestureRecognizer
{
  return self->_scrunchGestureRecognizer;
}

- (void)setScrunchGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_scrunchGestureRecognizer, a3);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SBSystemGestureManager)gestureManager
{
  return self->_gestureManager;
}

- (void)setGestureManager:(id)a3
{
  objc_storeStrong((id *)&self->_gestureManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gestureManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_scrunchGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_indirectPanGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_screenEdgePanGestureRecognizer, 0);
}

@end
