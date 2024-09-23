@implementation _SBPIPEndStashTabSuppressionGestureManager

- (_SBPIPEndStashTabSuppressionGestureManager)initWithSystemGestureManager:(id)a3
{
  id v5;
  _SBPIPEndStashTabSuppressionGestureManager *v6;
  _SBPIPEndStashTabSuppressionGestureManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SBPIPEndStashTabSuppressionGestureManager;
  v6 = -[_SBPIPEndStashTabSuppressionGestureManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_systemGestureManager, a3);

  return v7;
}

- (void)dealloc
{
  NSMutableSet *targets;
  objc_super v4;

  -[NSMutableSet removeAllObjects](self->_targets, "removeAllObjects");
  targets = self->_targets;
  self->_targets = 0;

  -[_SBPIPEndStashTabSuppressionGestureManager _removeGestureRecognizers](self, "_removeGestureRecognizers");
  v4.receiver = self;
  v4.super_class = (Class)_SBPIPEndStashTabSuppressionGestureManager;
  -[_SBPIPEndStashTabSuppressionGestureManager dealloc](&v4, sel_dealloc);
}

- (void)addTarget:(id)a3 action:(SEL)a4
{
  id v6;
  NSObject *v7;
  UITapGestureRecognizer *singleTapRecognizer;
  NSMutableSet *targets;
  NSMutableSet *v10;
  NSMutableSet *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  SBLogPIP();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = v6;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "[_SBPIPEndStashTabSuppressionGestureManager] addTarget %@", (uint8_t *)&v12, 0xCu);
  }

  if ((-[NSMutableSet containsObject:](self->_targets, "containsObject:", v6) & 1) == 0)
  {
    singleTapRecognizer = self->_singleTapRecognizer;
    if (!singleTapRecognizer)
    {
      -[_SBPIPEndStashTabSuppressionGestureManager _addSystemRecognizers](self, "_addSystemRecognizers");
      singleTapRecognizer = self->_singleTapRecognizer;
    }
    -[UITapGestureRecognizer addTarget:action:](singleTapRecognizer, "addTarget:action:", v6, a4);
    targets = self->_targets;
    if (!targets)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 1);
      v10 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
      v11 = self->_targets;
      self->_targets = v10;

      targets = self->_targets;
    }
    -[NSMutableSet addObject:](targets, "addObject:", v6);
  }

}

- (void)removeTarget:(id)a3 action:(SEL)a4
{
  id v6;
  NSObject *v7;
  NSMutableSet *targets;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  SBLogPIP();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "[_SBPIPEndStashTabSuppressionGestureManager] removeTarget %@", (uint8_t *)&v9, 0xCu);
  }

  if (-[NSMutableSet containsObject:](self->_targets, "containsObject:", v6))
  {
    -[UITapGestureRecognizer removeTarget:action:](self->_singleTapRecognizer, "removeTarget:action:", v6, a4);
    -[NSMutableSet removeObject:](self->_targets, "removeObject:", v6);
    if (!-[NSMutableSet count](self->_targets, "count"))
    {
      targets = self->_targets;
      self->_targets = 0;

      -[_SBPIPEndStashTabSuppressionGestureManager _removeGestureRecognizers](self, "_removeGestureRecognizers");
    }
  }

}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)_addSystemRecognizers
{
  NSObject *v4;
  UITapGestureRecognizer *v5;
  UITapGestureRecognizer *v6;
  UITapGestureRecognizer *singleTapRecognizer;
  UITapGestureRecognizer *v8;
  UITapGestureRecognizer *doubleTapRecognizer;
  UITapGestureRecognizer *v10;
  void *v11;
  uint8_t buf[4];
  _SBPIPEndStashTabSuppressionGestureManager *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (*(_OWORD *)&self->_singleTapRecognizer != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBWindowScenePIPManager.m"), 478, CFSTR("Re-adding recognizers to %@."), self);

  }
  SBLogPIP();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v13 = self;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "[_SBPIPEndStashTabSuppressionGestureManager] _addSystemRecognizers %@", buf, 0xCu);
  }

  v5 = (UITapGestureRecognizer *)objc_alloc_init(MEMORY[0x1E0CEAA88]);
  -[UITapGestureRecognizer setName:](v5, "setName:", CFSTR("pip.stashtab.endsuppression.tap"));
  -[UITapGestureRecognizer setCancelsTouchesInView:](v5, "setCancelsTouchesInView:", 0);
  -[UITapGestureRecognizer setDelaysTouchesBegan:](v5, "setDelaysTouchesBegan:", 0);
  -[UITapGestureRecognizer setDelaysTouchesEnded:](v5, "setDelaysTouchesEnded:", 0);
  -[UITapGestureRecognizer setAllowedTouchTypes:](v5, "setAllowedTouchTypes:", &unk_1E91CDF00);
  -[UITapGestureRecognizer setDelegate:](v5, "setDelegate:", self);
  v6 = (UITapGestureRecognizer *)objc_alloc_init(MEMORY[0x1E0CEAA88]);
  -[UITapGestureRecognizer setName:](v6, "setName:", CFSTR("pip.stashtab.endsuppression.doubletap"));
  -[UITapGestureRecognizer setNumberOfTapsRequired:](v6, "setNumberOfTapsRequired:", 2);
  -[UITapGestureRecognizer setCancelsTouchesInView:](v6, "setCancelsTouchesInView:", 0);
  -[UITapGestureRecognizer setDelaysTouchesBegan:](v6, "setDelaysTouchesBegan:", 0);
  -[UITapGestureRecognizer setDelaysTouchesEnded:](v6, "setDelaysTouchesEnded:", 0);
  -[UITapGestureRecognizer setAllowedTouchTypes:](v6, "setAllowedTouchTypes:", &unk_1E91CDF18);
  -[UITapGestureRecognizer setDelegate:](v6, "setDelegate:", self);
  -[UITapGestureRecognizer requireGestureRecognizerToFail:](v5, "requireGestureRecognizerToFail:", v6);
  singleTapRecognizer = self->_singleTapRecognizer;
  self->_singleTapRecognizer = v5;
  v8 = v5;

  doubleTapRecognizer = self->_doubleTapRecognizer;
  self->_doubleTapRecognizer = v6;
  v10 = v6;

  -[SBSystemGestureManager addGestureRecognizer:withType:](self->_systemGestureManager, "addGestureRecognizer:withType:", self->_singleTapRecognizer, 124);
  -[SBSystemGestureManager addGestureRecognizer:withType:](self->_systemGestureManager, "addGestureRecognizer:withType:", self->_doubleTapRecognizer, 125);

}

- (void)_removeGestureRecognizers
{
  NSObject *v4;
  UITapGestureRecognizer *singleTapRecognizer;
  UITapGestureRecognizer *doubleTapRecognizer;
  void *v7;
  uint8_t buf[4];
  _SBPIPEndStashTabSuppressionGestureManager *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  SBLogPIP();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v9 = self;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "[_SBPIPEndStashTabSuppressionGestureManager] _removeGestureRecognizers %@", buf, 0xCu);
  }

  if (-[NSMutableSet count](self->_targets, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBWindowScenePIPManager.m"), 509, CFSTR("[_SBPIPEndStashTabSuppressionGestureManager] removed gesture recognizers %@ with active targets."), self);

  }
  if (self->_singleTapRecognizer)
  {
    -[SBSystemGestureManager removeGestureRecognizer:](self->_systemGestureManager, "removeGestureRecognizer:");
    singleTapRecognizer = self->_singleTapRecognizer;
    self->_singleTapRecognizer = 0;

  }
  if (self->_doubleTapRecognizer)
  {
    -[SBSystemGestureManager removeGestureRecognizer:](self->_systemGestureManager, "removeGestureRecognizer:");
    doubleTapRecognizer = self->_doubleTapRecognizer;
    self->_doubleTapRecognizer = 0;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemGestureManager, 0);
  objc_storeStrong((id *)&self->_doubleTapRecognizer, 0);
  objc_storeStrong((id *)&self->_singleTapRecognizer, 0);
  objc_storeStrong((id *)&self->_targets, 0);
}

@end
