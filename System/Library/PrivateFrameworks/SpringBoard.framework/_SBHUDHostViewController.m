@implementation _SBHUDHostViewController

- (uint64_t)presentedHUDs
{
  if (result)
    return *(_QWORD *)(result + 976);
  return result;
}

- (uint64_t)presentingHUDs
{
  if (result)
    return *(_QWORD *)(result + 984);
  return result;
}

- (BOOL)isHUDBeingDismissed:(_QWORD *)a1
{
  void *v2;
  _BOOL8 v3;

  if (!a1)
    return 0;
  objc_msgSend(a1, "_transitionContextMatchingHUD:withinContainer:", a2, a1[126]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)reverseHUDDismissal:(id *)a1
{
  void *v3;
  id v4;

  if (a1)
  {
    objc_msgSend(a1, "_transitionContextMatchingHUD:withinContainer:", a2, a1[126]);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "animator");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(a1[126], "containsObject:", v4))
    {
      objc_msgSend(a1[126], "removeObject:", v4);
      objc_msgSend(a1[125], "addObject:", v4);
      objc_msgSend(v3, "reverseAnimation");
    }

  }
}

- (void)presentHUD:(uint64_t)a3 animated:(void *)a4 completion:
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  if (a1)
  {
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", sel_presentHUD_animated_completion_, a1, CFSTR("SBHUDController.m"), 843, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("HUD"));

    }
    SBLogHUD();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)MEMORY[0x1D17E5550](v8);
      *(_DWORD *)buf = 138412802;
      v17 = v7;
      v18 = 1024;
      v19 = a3;
      v20 = 2112;
      v21 = v10;
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "presentHUD:%@ animated:%{BOOL}d completion:%@", buf, 0x1Cu);

    }
    objc_msgSend(a1, "_transitionContextMatchingHUD:withinContainer:", v7, a1[126]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      SBLogHUD();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v7;
        _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "Reversing dismissal for HUD %@", buf, 0xCu);
      }

      -[_SBHUDHostViewController reverseHUDDismissal:]((id *)a1, (uint64_t)v7);
    }
    else
    {
      objc_msgSend(a1, "_transitionContextMatchingHUD:withinContainer:", v7, a1[125]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        SBLogHUD();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v17 = v7;
          _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "Already presenting HUD %@; doing nothing.",
            buf,
            0xCu);
        }

      }
      else
      {
        objc_msgSend(a1, "_executePresentNewHUD:animated:completion:", v7, a3, v8);
      }

    }
  }

}

- (BOOL)isHUDBeingPresented:(_QWORD *)a1
{
  void *v2;
  _BOOL8 v3;

  if (!a1)
    return 0;
  objc_msgSend(a1, "_transitionContextMatchingHUD:withinContainer:", a2, a1[125]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)reverseHUDPresentation:(id *)a1
{
  void *v3;
  id v4;

  if (a1)
  {
    objc_msgSend(a1, "_transitionContextMatchingHUD:withinContainer:", a2, a1[125]);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "animator");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(a1[125], "containsObject:", v4))
    {
      objc_msgSend(a1[126], "addObject:", v4);
      objc_msgSend(a1[125], "removeObject:", v4);
      objc_msgSend(v3, "reverseAnimation");
    }

  }
}

- (void)dismissHUD:(uint64_t)a3 animated:(void *)a4 completion:
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  int v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  if (a1)
  {
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", sel_dismissHUD_animated_completion_, a1, CFSTR("SBHUDController.m"), 864, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("HUD"));

    }
    SBLogHUD();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)MEMORY[0x1D17E5550](v8);
      *(_DWORD *)buf = 138412802;
      v22 = v7;
      v23 = 1024;
      v24 = a3;
      v25 = 2112;
      v26 = v10;
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "dismissHUD:%@ animated:%{BOOL}d completion:%@", buf, 0x1Cu);

    }
    objc_msgSend(a1, "_transitionContextMatchingHUD:withinContainer:", v7, a1[126]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      SBLogHUD();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v7;
        _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "Already dismissing HUD %@; doing nothing.", buf, 0xCu);
      }
    }
    else
    {
      objc_msgSend(a1, "_transitionContextMatchingHUD:withinContainer:", v7, a1[125]);
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        SBLogHUD();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v22 = v7;
          _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "HUD %@ is presenting; reversing presenting...",
            buf,
            0xCu);
        }

        -[_SBHUDHostViewController reverseHUDPresentation:]((id *)a1, (uint64_t)v7);
      }
      else
      {
        objc_msgSend(v7, "HUDViewController");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if ((_DWORD)a3 && objc_msgSend(v14, "definesAnimatedDismissal"))
        {
          SBLogHUD();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v22 = v7;
            _os_log_impl(&dword_1D0540000, v16, OS_LOG_TYPE_DEFAULT, "HUD %@ is defines its own animated dismissal; executing and cleaning up state.",
              buf,
              0xCu);
          }

          objc_initWeak((id *)buf, v7);
          v18[0] = MEMORY[0x1E0C809B0];
          v18[1] = 3221225472;
          v18[2] = __59___SBHUDHostViewController_dismissHUD_animated_completion___block_invoke;
          v18[3] = &unk_1E8E9E158;
          objc_copyWeak(&v20, (id *)buf);
          v18[4] = a1;
          v19 = v8;
          objc_msgSend(v15, "dismissAnimatedWithCompletion:", v18);

          objc_destroyWeak(&v20);
          objc_destroyWeak((id *)buf);
        }
        else
        {
          objc_msgSend(a1, "_executeDismissHUD:animated:completion:", v7, a3, v8);
        }

      }
    }

  }
}

- (_QWORD)initWithHUDController:(_QWORD *)a1
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v19;
  objc_super v20;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithHUDController_, a1, CFSTR("SBHUDController.m"), 748, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("HUDController"));

    }
    v20.receiver = a1;
    v20.super_class = (Class)_SBHUDHostViewController;
    v5 = objc_msgSendSuper2(&v20, sel_init);
    a1 = v5;
    if (v5)
    {
      objc_storeWeak((id *)v5 + 127, v4);
      v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v7 = (void *)a1[122];
      a1[122] = v6;

      v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v9 = (void *)a1[123];
      a1[123] = v8;

      v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v11 = (void *)a1[124];
      a1[124] = v10;

      v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v13 = (void *)a1[121];
      a1[121] = v12;

      v14 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v15 = (void *)a1[125];
      a1[125] = v14;

      v16 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v17 = (void *)a1[126];
      a1[126] = v16;

    }
  }

  return a1;
}

- (id)setDelegate:(id *)result
{
  if (result)
    return (id *)objc_storeWeak(result + 128, a2);
  return result;
}

- (uint64_t)numberOfActiveTransitions
{
  uint64_t v1;
  uint64_t v2;

  if (result)
  {
    v1 = result;
    v2 = objc_msgSend(*(id *)(result + 1000), "count");
    return objc_msgSend(*(id *)(v1 + 1008), "count") + v2;
  }
  return result;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[7];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)_SBHUDHostViewController;
  v7 = a4;
  -[_SBHUDHostViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __79___SBHUDHostViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E8EAC0A0;
  v8[4] = self;
  *(double *)&v8[5] = width;
  *(double *)&v8[6] = height;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, &__block_literal_global_302);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)getRotationContentSettings:(id *)a3 forWindow:(id)a4
{
  if (a3)
    a3->var6 = 0;
}

- (NSString)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_presentedHUDs, CFSTR("presentedHUDs"));
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", self->_presentingHUDs, CFSTR("presentingHUDs"));
  v6 = (id)objc_msgSend(v3, "appendObject:withName:", self->_executingDismissalHUDs, CFSTR("executingDismissalHUDs"));
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", self->_activeTransitionContexts, CFSTR("activeTransitionContexts"));
  v8 = (id)objc_msgSend(v3, "appendObject:withName:", self->_presentingHUDsTransitionContexts, CFSTR("presentingHUDsTransitionContexts"));
  v9 = (id)objc_msgSend(v3, "appendObject:withName:", self->_dismissingHUDsTransitionContexts, CFSTR("dismissingHUDsTransitionContexts"));
  v10 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[NSMutableSet count](self->_dismissingHUDsTransitionContexts, "count")+ -[NSMutableSet count](self->_presentingHUDsTransitionContexts, "count"), CFSTR("numberOfActiveTransitions"));
  objc_msgSend(v3, "build");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (id)knownHUDForIdentifier:(id *)a1
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[4];
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!a1)
    goto LABEL_31;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v4 = a1[122];
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v34;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v34 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v9, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v3);

        if ((v11 & 1) != 0)
        {
          a1 = v9;
          goto LABEL_30;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
      if (v6)
        continue;
      break;
    }
  }

  v12 = (void *)MEMORY[0x1E0CB3880];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __50___SBHUDHostViewController_knownHUDForIdentifier___block_invoke;
  v31[3] = &unk_1E8EAC108;
  v32 = v3;
  objc_msgSend(v12, "predicateWithBlock:", v31);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v14 = a1[125];
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v38, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v28;
LABEL_12:
    v18 = 0;
    while (1)
    {
      if (*(_QWORD *)v28 != v17)
        objc_enumerationMutation(v14);
      v19 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v18);
      if ((objc_msgSend(v13, "evaluateWithObject:", v19) & 1) != 0)
        break;
      if (v16 == ++v18)
      {
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v38, 16);
        if (v16)
          goto LABEL_12;
        goto LABEL_18;
      }
    }
  }
  else
  {
LABEL_18:

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v14 = a1[126];
    a1 = (id *)objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v37, 16);
    if (!a1)
      goto LABEL_29;
    v20 = *(_QWORD *)v24;
LABEL_20:
    v21 = 0;
    while (1)
    {
      if (*(_QWORD *)v24 != v20)
        objc_enumerationMutation(v14);
      v19 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v21);
      if ((objc_msgSend(v13, "evaluateWithObject:", v19, (_QWORD)v23) & 1) != 0)
        break;
      if (a1 == (id *)++v21)
      {
        a1 = (id *)objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v37, 16);
        if (a1)
          goto LABEL_20;
        goto LABEL_29;
      }
    }
  }
  objc_msgSend(v19, "userInfo");
  a1 = (id *)objc_claimAutoreleasedReturnValue();
LABEL_29:

  v4 = v32;
LABEL_30:

LABEL_31:
  return a1;
}

- (void)transitionDidFinish:(id)a3
{
  NSMutableSet **p_presentingHUDsTransitionContexts;
  id v5;

  p_presentingHUDsTransitionContexts = &self->_presentingHUDsTransitionContexts;
  v5 = a3;
  if ((-[NSMutableSet containsObject:](*p_presentingHUDsTransitionContexts, "containsObject:") & 1) != 0
    || (p_presentingHUDsTransitionContexts = &self->_dismissingHUDsTransitionContexts,
        -[NSMutableSet containsObject:](self->_dismissingHUDsTransitionContexts, "containsObject:", v5)))
  {
    -[NSMutableSet removeObject:](*p_presentingHUDsTransitionContexts, "removeObject:", v5);
  }
  -[NSMutableArray removeObject:](self->_activeTransitionContexts, "removeObject:", v5);

}

- (id)_transitionContextMatchingHUD:(id)a3 withinContainer:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = a4;
  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "userInfo", (_QWORD)v13);
        v11 = (id)objc_claimAutoreleasedReturnValue();

        if (v11 == v5)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)_buildTransitionContextToPresentHUD:(id)a3 dismissHUD:(id)a4 animated:(BOOL)a5 delegate:(id)a6 containerView:(id)a7 completion:(id)a8
{
  _BOOL8 v11;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _QWORD v47[4];
  id v48;
  _SBHUDHostViewController *v49;
  id v50;
  id v51;
  _QWORD v52[4];
  id v53;
  id v54;
  _SBHUDHostViewController *v55;
  id v56;

  v11 = a5;
  v15 = a3;
  v16 = a4;
  v17 = a6;
  v18 = a7;
  v42 = a8;
  if ((v15 != 0) != (v16 != 0))
  {
    if (v18)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHUDController.m"), 962, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(dismissalHUD && !presentationHUD) || (!dismissalHUD && presentationHUD)"));

    if (v18)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHUDController.m"), 963, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("containerView"));

LABEL_3:
  v19 = (void *)objc_opt_new();
  objc_msgSend(v19, "setContainerView:", v18);
  objc_msgSend(v19, "setWantsAnimation:", v11);
  v46 = v16;
  objc_msgSend(v16, "HUDViewController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v15;
  objc_msgSend(v15, "HUDViewController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SBHUDHostViewController HUDController]((id *)&self->super.super.super.super.isa);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "transitioningDelegate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    v25 = v23;
  }
  else
  {
    -[_SBHUDHostViewController HUDController]((id *)&self->super.super.super.super.isa);
    v25 = (id)objc_claimAutoreleasedReturnValue();
  }
  v44 = v25;
  v26 = v17;

  objc_msgSend(v21, "transitioningDelegate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (v27)
  {
    v29 = v27;
  }
  else
  {
    -[_SBHUDHostViewController HUDController]((id *)&self->super.super.super.super.isa);
    v29 = (id)objc_claimAutoreleasedReturnValue();
  }
  v30 = v29;

  if (v20)
  {
    objc_msgSend(v44, "animationControllerForDismissedController:", v20);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v45)
    {
      objc_msgSend(v22, "animationControllerForDismissedController:", v20);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v45 = 0;
  }
  v40 = v30;
  v41 = v22;
  if (v21
    && ((objc_msgSend(v30, "animationControllerForPresentedController:presentingController:sourceController:", v21, self, self), (v31 = (void *)objc_claimAutoreleasedReturnValue()) != 0)|| (objc_msgSend(v22, "animationControllerForPresentedController:presentingController:sourceController:", v21, self, self), (v31 = (void *)objc_claimAutoreleasedReturnValue()) != 0)))
  {
    objc_opt_self();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    SBSafeCast((uint64_t)v32, v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_opt_self();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    SBSafeCast((uint64_t)v31, v45);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v19, "setWantsAnimation:", v11);
  if (v20)
  {
    objc_msgSend(v20, "view");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setView:forKey:", v34, *MEMORY[0x1E0CEBDB0]);

    objc_msgSend(v19, "setViewController:forKey:", v20, *MEMORY[0x1E0CEBDA8]);
    objc_msgSend(v18, "bounds");
    objc_msgSend(v19, "setInitialFrame:forViewController:", v20);
    objc_msgSend(v18, "bounds");
    objc_msgSend(v19, "setFinalFrame:forViewController:", v20);
    objc_msgSend(v20, "willMoveToParentViewController:", 0);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v26, "hudViewController:willDismissHUD:", self, v46);
  }
  if (v21)
  {
    -[_SBHUDHostViewController addChildViewController:](self, "addChildViewController:", v21);
    objc_msgSend(v21, "view");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setView:forKey:", v35, *MEMORY[0x1E0CEBDC0]);

    objc_msgSend(v19, "setViewController:forKey:", v21, *MEMORY[0x1E0CEBDB8]);
    objc_msgSend(v18, "bounds");
    objc_msgSend(v19, "setInitialFrame:forViewController:", v21);
    objc_msgSend(v18, "bounds");
    objc_msgSend(v19, "setFinalFrame:forViewController:", v21);
    objc_msgSend(v21, "didMoveToParentViewController:", self);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v26, "hudViewController:willPresentHUD:", self, v43);
  }
  v36 = MEMORY[0x1E0C809B0];
  if (v20)
  {
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __118___SBHUDHostViewController__buildTransitionContextToPresentHUD_dismissHUD_animated_delegate_containerView_completion___block_invoke;
    v52[3] = &unk_1E8EAC130;
    v53 = v20;
    v54 = v26;
    v55 = self;
    v56 = v46;
    objc_msgSend(v33, "addCompletion:", v52);

  }
  if (v21)
  {
    v47[0] = v36;
    v47[1] = 3221225472;
    v47[2] = __118___SBHUDHostViewController__buildTransitionContextToPresentHUD_dismissHUD_animated_delegate_containerView_completion___block_invoke_2;
    v47[3] = &unk_1E8EAC130;
    v48 = v21;
    v49 = self;
    v50 = v26;
    v51 = v43;
    objc_msgSend(v33, "addCompletion:", v47);

  }
  objc_msgSend(v33, "addCompletion:", v42);
  objc_msgSend(v19, "setAnimator:", v33);

  return v19;
}

- (id)HUDController
{
  if (WeakRetained)
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 127);
  return WeakRetained;
}

- (void)_executePresentNewHUD:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void (**v15)(_QWORD, _QWORD);
  id v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  _SBHUDHostViewController *v21;
  _QWORD v22[5];
  id v23;
  id v24;

  v8 = a3;
  v9 = a5;
  -[_SBHUDHostViewController delegate]((id *)&self->super.super.super.super.isa);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SBHUDHostViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __70___SBHUDHostViewController__executePresentNewHUD_animated_completion___block_invoke;
  v22[3] = &unk_1E8EAC158;
  v22[4] = self;
  v13 = v8;
  v23 = v13;
  v14 = v9;
  v24 = v14;
  v15 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17E5550](v22);
  if (a4)
  {
    -[NSMutableSet addObject:](self->_presentingHUDs, "addObject:", v13);
    -[_SBHUDHostViewController _buildTransitionContextToPresentHUD:dismissHUD:animated:delegate:containerView:completion:](self, "_buildTransitionContextToPresentHUD:dismissHUD:animated:delegate:containerView:completion:", v13, 0, 1, v10, v11, v15);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setUserInfo:", v13);
    -[NSMutableSet addObject:](self->_presentingHUDsTransitionContexts, "addObject:", v16);
    -[_SBHUDHostViewController _executeViewControllerTransitionContext:](self, "_executeViewControllerTransitionContext:", v16);
  }
  else
  {
    objc_msgSend(v13, "HUDViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v10, "hudViewController:willPresentHUD:", self, v13);
    objc_msgSend(v17, "willMoveToParentViewController:", self);
    -[_SBHUDHostViewController addChildViewController:](self, "addChildViewController:", v17);
    v18 = (void *)MEMORY[0x1E0CEABB0];
    v19[0] = v12;
    v19[1] = 3221225472;
    v19[2] = __70___SBHUDHostViewController__executePresentNewHUD_animated_completion___block_invoke_2;
    v19[3] = &unk_1E8E9E820;
    v16 = v17;
    v20 = v16;
    v21 = self;
    objc_msgSend(v18, "performWithoutAnimation:", v19);
    objc_msgSend(v16, "didMoveToParentViewController:", self);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v10, "hudViewController:didPresentHUD:", self, v13);
    v15[2](v15, 0);

  }
}

- (id)delegate
{
  if (WeakRetained)
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 128);
  return WeakRetained;
}

- (void)_executeDismissHUD:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void (**v15)(_QWORD, _QWORD);
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;

  v8 = a3;
  v9 = a5;
  -[_SBHUDHostViewController delegate]((id *)&self->super.super.super.super.isa);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SBHUDHostViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __67___SBHUDHostViewController__executeDismissHUD_animated_completion___block_invoke;
  v24[3] = &unk_1E8EAC158;
  v24[4] = self;
  v13 = v8;
  v25 = v13;
  v14 = v9;
  v26 = v14;
  v15 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17E5550](v24);
  if (a4)
  {
    -[_SBHUDHostViewController _buildTransitionContextToPresentHUD:dismissHUD:animated:delegate:containerView:completion:](self, "_buildTransitionContextToPresentHUD:dismissHUD:animated:delegate:containerView:completion:", 0, v13, 1, v10, v11, v15);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setUserInfo:", v13);
    -[NSMutableSet addObject:](self->_dismissingHUDsTransitionContexts, "addObject:", v16);
    -[_SBHUDHostViewController _executeViewControllerTransitionContext:](self, "_executeViewControllerTransitionContext:", v16);
LABEL_9:

    goto LABEL_10;
  }
  if ((-[NSMutableSet containsObject:](self->_executingDismissalHUDs, "containsObject:", v13) & 1) == 0)
  {
    -[NSMutableSet addObject:](self->_executingDismissalHUDs, "addObject:", v13);
    objc_msgSend(v13, "HUDViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v10, "hudViewController:willDismissHUD:", self, v13);
    objc_msgSend(v17, "bs_beginAppearanceTransition:animated:", 0, 0);
    objc_msgSend(v17, "willMoveToParentViewController:", 0);
    v18 = (void *)MEMORY[0x1E0CEABB0];
    v19 = v12;
    v20 = 3221225472;
    v21 = __67___SBHUDHostViewController__executeDismissHUD_animated_completion___block_invoke_2;
    v22 = &unk_1E8E9DED8;
    v16 = v17;
    v23 = v16;
    objc_msgSend(v18, "performWithoutAnimation:", &v19);
    -[_SBHUDHostViewController removeChildViewController:](self, "removeChildViewController:", v16, v19, v20, v21, v22);
    objc_msgSend(v16, "didMoveToParentViewController:", 0);
    objc_msgSend(v16, "bs_endAppearanceTransition");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v10, "hudViewController:didDismissHUD:", self, v13);
    v15[2](v15, 0);
    -[NSMutableSet removeObject:](self->_executingDismissalHUDs, "removeObject:", v13);

    goto LABEL_9;
  }
LABEL_10:

}

- (void)_executeViewControllerTransitionContext:(id)a3
{
  NSMutableArray *activeTransitionContexts;
  id v5;

  activeTransitionContexts = self->_activeTransitionContexts;
  v5 = a3;
  -[NSMutableArray addObject:](activeTransitionContexts, "addObject:", v5);
  objc_msgSend(v5, "setDelegate:", self);
  objc_msgSend(v5, "startTransition");

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_HUDController);
  objc_storeStrong((id *)&self->_dismissingHUDsTransitionContexts, 0);
  objc_storeStrong((id *)&self->_presentingHUDsTransitionContexts, 0);
  objc_storeStrong((id *)&self->_executingDismissalHUDs, 0);
  objc_storeStrong((id *)&self->_presentingHUDs, 0);
  objc_storeStrong((id *)&self->_presentedHUDs, 0);
  objc_storeStrong((id *)&self->_activeTransitionContexts, 0);
}

@end
