@implementation _UIStatusBarCycleAnimation

- (_UIStatusBarCycleAnimation)initWithLayerAnimations:(id)a3
{
  NSArray *v5;
  _UIStatusBarCycleAnimation *v6;
  NSArray *layerAnimations;
  NSArray *v8;
  uint64_t v9;
  NSMutableArray *completionHandlers;
  void *v12;
  objc_super v13;

  v5 = (NSArray *)a3;
  v13.receiver = self;
  v13.super_class = (Class)_UIStatusBarCycleAnimation;
  v6 = -[_UIStatusBarCycleAnimation init](&v13, sel_init);
  if (!-[NSArray count](v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("_UIStatusBarCycleAnimation.m"), 67, CFSTR("There must be at least one animation"));

  }
  layerAnimations = v6->_layerAnimations;
  v6->_layerAnimations = v5;
  v8 = v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = objc_claimAutoreleasedReturnValue();
  completionHandlers = v6->_completionHandlers;
  v6->_completionHandlers = (NSMutableArray *)v9;

  v6->_visible = 1;
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[_UIStatusBarCycleAnimation _stopAnimations](self, "_stopAnimations");
  v3.receiver = self;
  v3.super_class = (Class)_UIStatusBarCycleAnimation;
  -[_UIStatusBarCycleAnimation dealloc](&v3, sel_dealloc);
}

- (_UIStatusBarCycleLayerAnimation)mainLayerAnimation
{
  return (_UIStatusBarCycleLayerAnimation *)-[NSArray firstObject](self->_layerAnimations, "firstObject");
}

- (void)start
{
  int64_t state;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (self->_visible)
  {
    state = self->_state;
    if (state == 2)
    {
      -[_UIStatusBarCycleAnimation _stopStoppingAnimations](self, "_stopStoppingAnimations");
      -[_UIStatusBarCycleAnimation mainLayerAnimation](self, "mainLayerAnimation");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "animation");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "layer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "key");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeAnimationForKey:", v7);
      objc_msgSend(v6, "addAnimation:forKey:", v5, v7);
      -[_UIStatusBarCycleAnimation _sendCompletionsWithFinished:](self, "_sendCompletionsWithFinished:", 0);

    }
    else if (!state)
    {
      -[_UIStatusBarCycleAnimation _startAnimations](self, "_startAnimations");
    }
  }
  self->_state = 1;
}

- (void)stopWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  int64_t state;
  NSMutableArray *completionHandlers;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  NSArray *v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  uint64_t i;
  void *v21;
  double v22;
  double v23;
  double v24;
  NSArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  double v35;
  NSMutableArray *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD v50[2];
  double (*v51)(uint64_t);
  void *v52;
  id v53;
  _UIStatusBarCycleAnimation *v54;
  uint64_t *v55;
  uint64_t *v56;
  uint64_t *v57;
  double v58;
  double v59;
  uint64_t v60;
  double *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  double *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  double *v69;
  uint64_t v70;
  double v71;
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!self->_visible)
  {
    self->_state = 0;
LABEL_7:
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
    goto LABEL_31;
  }
  state = self->_state;
  if (state == 2)
  {
    completionHandlers = self->_completionHandlers;
    v8 = _Block_copy(v4);
    -[NSMutableArray addObject:](completionHandlers, "addObject:", v8);

    goto LABEL_31;
  }
  if (state != 1)
  {
    if (state)
      goto LABEL_31;
    goto LABEL_7;
  }
  -[_UIStatusBarCycleAnimation mainLayerAnimation](self, "mainLayerAnimation");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "animation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "layer");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "key");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v9, "beginTime");
  v12 = v11;
  v13 = CACurrentMediaTime();
  objc_msgSend(v9, "duration");
  v15 = v14;
  v68 = 0;
  v69 = (double *)&v68;
  v70 = 0x2020000000;
  v71 = (v13 - v12) / v14;
  v64 = 0;
  v65 = (double *)&v64;
  v66 = 0x2020000000;
  v67 = 0;
  v60 = 0;
  v61 = (double *)&v60;
  v62 = 0x2020000000;
  v63 = 0;
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v51 = __56___UIStatusBarCycleAnimation_stopWithCompletionHandler___block_invoke;
  v52 = &unk_1E16E2580;
  v55 = &v64;
  v56 = &v68;
  v58 = v14;
  v38 = v9;
  v53 = v38;
  v54 = self;
  v57 = &v60;
  v59 = v12;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v16 = self->_stoppingLayerAnimations;
  v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v46, v73, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v47;
    v19 = 0.0;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v47 != v18)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * i), "originalAnimation", v38);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "duration");
        v23 = v22;

        if (v19 < v23)
          v19 = v23;
      }
      v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v46, v73, 16);
    }
    while (v17);
  }
  else
  {
    v19 = 0.0;
  }

  v51((uint64_t)v50);
  if (v19 > 0.0)
  {
    v24 = v19 - (v61[3] - v13);
    if (v24 > 0.0)
    {
      v69[3] = ceil(v24 / v15) + v69[3];
      v51((uint64_t)v50);
    }
  }
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v25 = self->_stoppingLayerAnimations;
  v26 = -[NSArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v42, v72, 16);
  if (v26)
  {
    v27 = *(_QWORD *)v43;
    do
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v43 != v27)
          objc_enumerationMutation(v25);
        v29 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * j);
        objc_msgSend(v29, "originalAnimation", v38);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v61[3];
        objc_msgSend(v30, "duration");
        objc_msgSend(v30, "setBeginTime:", v31 - v32);
        objc_msgSend(v29, "layer");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "key");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "addAnimation:forKey:", v30, v34);

      }
      v26 = -[NSArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v42, v72, 16);
    }
    while (v26);
  }

  v35 = v65[3];
  *(float *)&v35 = v35;
  objc_msgSend(v10, "setRepeatCount:", v35);
  objc_msgSend(v10, "setDelegate:", self);
  objc_msgSend(v40, "removeAnimationForKey:", v39);
  objc_msgSend(v40, "addAnimation:forKey:", v10, v39);
  v36 = self->_completionHandlers;
  v37 = _Block_copy(v5);
  -[NSMutableArray addObject:](v36, "addObject:", v37);

  self->_state = 2;
  _Block_object_dispose(&v60, 8);
  _Block_object_dispose(&v64, 8);
  _Block_object_dispose(&v68, 8);

LABEL_31:
}

- (void)pausePersistentAnimation
{
  self->_visible = 0;
  -[_UIStatusBarCycleAnimation _stopAnimations](self, "_stopAnimations");
}

- (void)resumePersistentAnimation
{
  self->_visible = 1;
  if (self->_state == 1)
    -[_UIStatusBarCycleAnimation _startAnimations](self, "_startAnimations");
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  -[_UIStatusBarCycleAnimation _stopAnimations](self, "_stopAnimations", a3, a4);
  if (self->_state == 2)
  {
    self->_state = 0;
    -[_UIStatusBarCycleAnimation _sendCompletionsWithFinished:](self, "_sendCompletionsWithFinished:", 1);
  }
}

- (void)_startAnimations
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = self->_layerAnimations;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v7, "animation", (_QWORD)v12);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setBeginTime:", CACurrentMediaTime());
        LODWORD(v9) = 2139095040;
        objc_msgSend(v8, "setRepeatCount:", v9);
        objc_msgSend(v7, "layer");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "key");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addAnimation:forKey:", v8, v11);

      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }

}

- (void)_stopAnimations
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = self->_layerAnimations;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v8, "layer", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "key");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "removeAnimationForKey:", v10);

      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  -[_UIStatusBarCycleAnimation _stopStoppingAnimations](self, "_stopStoppingAnimations");
}

- (void)_stopStoppingAnimations
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  NSArray *stoppingLayerAnimations;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = self->_stoppingLayerAnimations;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v8, "layer", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "key");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "removeAnimationForKey:", v10);

      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  stoppingLayerAnimations = self->_stoppingLayerAnimations;
  self->_stoppingLayerAnimations = (NSArray *)MEMORY[0x1E0C9AA60];

}

- (void)_sendCompletionsWithFinished:(BOOL)a3
{
  NSMutableArray *v4;
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
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_completionHandlers;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
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
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8) + 16))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

  -[NSMutableArray removeAllObjects](self->_completionHandlers, "removeAllObjects", (_QWORD)v9);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(sel_state);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  NSStringFromSelector(sel_layerAnimations);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIDescriptionBuilder descriptionForObject:keys:](UIDescriptionBuilder, "descriptionForObject:keys:", self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSArray)layerAnimations
{
  return self->_layerAnimations;
}

- (int64_t)state
{
  return self->_state;
}

- (BOOL)stopsAfterReversing
{
  return self->_stopsAfterReversing;
}

- (void)setStopsAfterReversing:(BOOL)a3
{
  self->_stopsAfterReversing = a3;
}

- (NSArray)stoppingLayerAnimations
{
  return self->_stoppingLayerAnimations;
}

- (void)setStoppingLayerAnimations:(id)a3
{
  objc_storeStrong((id *)&self->_stoppingLayerAnimations, a3);
}

- (BOOL)visible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (NSMutableArray)completionHandlers
{
  return self->_completionHandlers;
}

- (void)setCompletionHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_completionHandlers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_stoppingLayerAnimations, 0);
  objc_storeStrong((id *)&self->_layerAnimations, 0);
}

@end
