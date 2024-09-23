@implementation OBAnimationController

- (OBAnimationController)initWithUrlToPackage:(id)a3 animationView:(id)a4 animatedStates:(id)a5 startAtFirstState:(id)a6
{
  return -[OBAnimationController initWithUrlToPackage:animationView:sizingTransformScale:animatedStates:startAtFirstState:](self, "initWithUrlToPackage:animationView:sizingTransformScale:animatedStates:startAtFirstState:", a3, a4, a5, a6, 0.0);
}

- (OBAnimationController)initWithUrlToPackage:(id)a3 animationView:(id)a4 sizingTransformScale:(double)a5 animatedStates:(id)a6 startAtFirstState:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  OBAnimationController *v16;
  uint64_t v17;
  CAPackage *package;
  uint64_t v19;
  NSArray *animatedStates;
  id v21;
  void *v22;
  uint64_t v23;
  CAStateController *stateController;
  objc_super v26;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v26.receiver = self;
  v26.super_class = (Class)OBAnimationController;
  v16 = -[OBAnimationController init](&v26, sel_init);
  if (v16)
  {
    objc_msgSend((id)objc_opt_class(), "packageForURL:", v12);
    v17 = objc_claimAutoreleasedReturnValue();
    package = v16->_package;
    v16->_package = (CAPackage *)v17;

    objc_storeStrong((id *)&v16->_animationView, a4);
    -[OBAnimationView setAppearanceChangeDelegate:](v16->_animationView, "setAppearanceChangeDelegate:", v16);
    objc_msgSend(v13, "setPackage:sizingTransformScale:", v16->_package, a5);
    v19 = objc_msgSend(v14, "copy");
    animatedStates = v16->_animatedStates;
    v16->_animatedStates = (NSArray *)v19;

    objc_storeStrong((id *)&v16->_firstState, a7);
    v21 = objc_alloc(MEMORY[0x1E0CD2868]);
    -[CAPackage rootLayer](v16->_package, "rootLayer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "initWithLayer:", v22);
    stateController = v16->_stateController;
    v16->_stateController = (CAStateController *)v23;

    -[OBAnimationController _initializeStartingStateForStopAnimation:](v16, "_initializeStartingStateForStopAnimation:", 0);
  }

  return v16;
}

- (void)startAnimation
{
  void *v3;
  id v4;

  -[OBAnimationController setCanceled:](self, "setCanceled:", 0);
  -[OBAnimationController package](self, "package");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rootLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBAnimationController _startAnimationForLayer:](self, "_startAnimationForLayer:", v3);

}

- (void)stopAnimation
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:", self);
  -[OBAnimationController stateController](self, "stateController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[OBAnimationController stateController](self, "stateController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancelTimers");

    -[OBAnimationController stateController](self, "stateController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "removeAllStateChanges");

  }
  -[OBAnimationController setStateIndex:](self, "setStateIndex:", 0);
  -[OBAnimationController setCanceled:](self, "setCanceled:", 1);
  -[OBAnimationController _initializeStartingStateForStopAnimation:](self, "_initializeStartingStateForStopAnimation:", 1);
}

- (void)_initializeStartingStateForStopAnimation:(BOOL)a3
{
  void *v5;
  void *v6;
  _QWORD v7[5];
  BOOL v8;

  -[OBAnimationController animationView](self, "animationView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__OBAnimationController__initializeStartingStateForStopAnimation___block_invoke;
  v7[3] = &unk_1E37AA928;
  v7[4] = self;
  v8 = a3;
  objc_msgSend(v6, "performAsCurrentTraitCollection:", v7);

}

void __66__OBAnimationController__initializeStartingStateForStopAnimation___block_invoke(uint64_t a1)
{
  uint64_t v2;
  float v3;
  float v4;
  double v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  id v18;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 56))
  {
    objc_msgSend((id)v2, "_caStateForAnimationState:");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    if (*(_BYTE *)(a1 + 40))
    {
      v3 = 100.0;
    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "transitionSpeed");
      v3 = v5;
    }
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 24);
    objc_msgSend(*(id *)(v6 + 16), "rootLayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v9 = v3;
    objc_msgSend(v7, "setInitialStatesOfLayer:transitionSpeed:", v8, v9);

    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v10 + 24);
    objc_msgSend(*(id *)(v10 + 16), "rootLayer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v13 = v3;
    objc_msgSend(v11, "setState:ofLayer:transitionSpeed:", v18, v12, v13);

  }
  else
  {
    if (*(_BYTE *)(a1 + 40))
    {
      v4 = 100.0;
    }
    else
    {
      objc_msgSend(*(id *)(v2 + 40), "objectAtIndexedSubscript:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "transitionSpeed");
      v4 = v15;

      v2 = *(_QWORD *)(a1 + 32);
    }
    v16 = *(void **)(v2 + 24);
    objc_msgSend(*(id *)(v2 + 16), "rootLayer");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    *(float *)&v17 = v4;
    objc_msgSend(v16, "setInitialStatesOfLayer:transitionSpeed:", v17);
  }

}

- (void)_startAnimationForLayer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:", self);
  -[OBAnimationController animationView](self, "animationView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__OBAnimationController__startAnimationForLayer___block_invoke;
  v8[3] = &unk_1E37AA950;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "performAsCurrentTraitCollection:", v8);

}

uint64_t __49__OBAnimationController__startAnimationForLayer___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stepAnimationStatesForLayer:", *(_QWORD *)(a1 + 40));
}

- (void)_stepAnimationStatesForLayer:(id)a3
{
  unint64_t v4;
  id v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v11 = a3;
  v4 = -[OBAnimationController stateIndex](self, "stateIndex");
  -[OBAnimationController animatedStates](self, "animatedStates");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 >= objc_msgSend(v5, "count"))
    goto LABEL_4;
  v6 = -[OBAnimationController canceled](self, "canceled");

  if (!v6)
  {
    -[OBAnimationController animatedStates](self, "animatedStates");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", -[OBAnimationController stateIndex](self, "stateIndex"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[OBAnimationController animationView](self, "animationView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "traitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __54__OBAnimationController__stepAnimationStatesForLayer___block_invoke;
    v12[3] = &unk_1E37AA978;
    v12[4] = self;
    v13 = v8;
    v14 = v11;
    v5 = v8;
    objc_msgSend(v10, "performAsCurrentTraitCollection:", v12);

LABEL_4:
  }

}

void __54__OBAnimationController__stepAnimationStatesForLayer___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  double v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_caStateForAnimationState:", *(_QWORD *)(a1 + 40));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setStateIndex:", objc_msgSend(*(id *)(a1 + 32), "stateIndex") + 1);
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "stateController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "transitionSpeed");
    *(float *)&v4 = v4;
    objc_msgSend(v2, "setState:ofLayer:transitionSpeed:", v7, v3, v4);

    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:", *(_QWORD *)(a1 + 32));
    v5 = *(_QWORD *)(a1 + 48);
    v6 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "transitionDuration");
    objc_msgSend(v6, "performSelector:withObject:afterDelay:", sel__stepAnimationStatesForLayer_, v5);
  }

}

+ (id)packageForURL:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  id v10;

  v3 = a3;
  v4 = *MEMORY[0x1E0CD3078];
  v10 = 0;
  objc_msgSend(MEMORY[0x1E0CD27F8], "packageWithContentsOfURL:type:options:error:", v3, v4, 0, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;
  if (v6)
  {
    _OBLoggingFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[OBAnimationController packageForURL:].cold.1(v3, v6, v7);

    v8 = 0;
  }
  else
  {
    v8 = v5;
  }

  return v8;
}

- (id)_caStateForAnimationState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[OBAnimationController package](self, "package");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rootLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stateForLayer:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)updateAnimationForAppearanceChange
{
  void *v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  id v13;

  -[OBAnimationController animatedStates](self, "animatedStates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[OBAnimationController stateIndex](self, "stateIndex");
  -[OBAnimationController animatedStates](self, "animatedStates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count") - 1;

  if (v4 >= v6)
    v7 = v6;
  else
    v7 = v4;
  objc_msgSend(v3, "objectAtIndexedSubscript:", v7);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  -[OBAnimationController _caStateForAnimationState:](self, "_caStateForAnimationState:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBAnimationController stateController](self, "stateController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBAnimationController package](self, "package");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rootLayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v12) = 0;
  objc_msgSend(v9, "setState:ofLayer:transitionSpeed:", v8, v11, v12);

}

- (CAPackage)package
{
  return self->_package;
}

- (void)setPackage:(id)a3
{
  objc_storeStrong((id *)&self->_package, a3);
}

- (CAStateController)stateController
{
  return self->_stateController;
}

- (void)setStateController:(id)a3
{
  objc_storeStrong((id *)&self->_stateController, a3);
}

- (OBAnimationView)animationView
{
  return self->_animationView;
}

- (void)setAnimationView:(id)a3
{
  objc_storeStrong((id *)&self->_animationView, a3);
}

- (NSArray)animatedStates
{
  return self->_animatedStates;
}

- (void)setAnimatedStates:(id)a3
{
  objc_storeStrong((id *)&self->_animatedStates, a3);
}

- (BOOL)canceled
{
  return self->_canceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

- (unint64_t)stateIndex
{
  return self->_stateIndex;
}

- (void)setStateIndex:(unint64_t)a3
{
  self->_stateIndex = a3;
}

- (OBAnimationState)firstState
{
  return self->_firstState;
}

- (void)setFirstState:(id)a3
{
  objc_storeStrong((id *)&self->_firstState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstState, 0);
  objc_storeStrong((id *)&self->_animatedStates, 0);
  objc_storeStrong((id *)&self->_animationView, 0);
  objc_storeStrong((id *)&self->_stateController, 0);
  objc_storeStrong((id *)&self->_package, 0);
}

+ (void)packageForURL:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v5;
  v9 = 2114;
  v10 = v6;
  _os_log_error_impl(&dword_199FE5000, a3, OS_LOG_TYPE_ERROR, "Unable to load package with url %@: %{public}@", (uint8_t *)&v7, 0x16u);

}

@end
