@implementation SUICProgressIndicatorViewController

- (id)_stateMachine
{
  void *v3;
  void *v4;

  -[SUICProgressIndicatorViewController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stateMachineForProgressIndicatorViewController:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_shouldAcceptEventsFromStateMachine:(id)a3
{
  id v4;
  void *v5;
  id v6;
  BOOL v7;

  v4 = a3;
  -[SUICProgressIndicatorViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[SUICProgressIndicatorViewController _stateMachine](self, "_stateMachine");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = v6 == v4;

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (void)loadView
{
  SUICProgressIndicatorView *v3;
  SUICProgressIndicatorView *progressIndicatorView;
  id v5;

  v3 = objc_alloc_init(SUICProgressIndicatorView);
  progressIndicatorView = self->_progressIndicatorView;
  self->_progressIndicatorView = v3;

  if (self->_progressIndicatorView)
  {
    -[SUICProgressIndicatorViewController setView:](self, "setView:");
  }
  else
  {
    v5 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    -[SUICProgressIndicatorViewController setView:](self, "setView:", v5);

  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)progressStateMachine:(id)a3 didTransitionToState:(unint64_t)a4 fromState:(unint64_t)a5 forEvent:(unint64_t)a6
{
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  SUICProgressIndicatorView *progressIndicatorView;
  SUICProgressIndicatorView *v18;
  void *v19;
  void *v20;
  SUICProgressIndicatorView *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  char v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  char v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  if (-[SUICProgressIndicatorViewController _shouldAcceptEventsFromStateMachine:](self, "_shouldAcceptEventsFromStateMachine:", v10))
  {
    -[SUICProgressIndicatorViewController dataSource](self, "dataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v12 = objc_msgSend(v11, "shouldAnimateTransitionToState:fromState:forProgressIndicatorViewController:", a4, a5, self);
    else
      v12 = 1;
    switch(a4)
    {
      case 0uLL:
        -[SUICProgressIndicatorView setProgressValue:animated:completion:](self->_progressIndicatorView, "setProgressValue:animated:completion:", v12, 0, 1.0);
        -[SUICProgressIndicatorView setSpinning:](self->_progressIndicatorView, "setSpinning:", 0);
        objc_initWeak((id *)buf, self);
        progressIndicatorView = self->_progressIndicatorView;
        v32[0] = MEMORY[0x1E0C809B0];
        v32[1] = 3221225472;
        v32[2] = __100__SUICProgressIndicatorViewController_progressStateMachine_didTransitionToState_fromState_forEvent___block_invoke;
        v32[3] = &unk_1E4A54FC0;
        objc_copyWeak(&v33, (id *)buf);
        v34 = v12;
        -[SUICProgressIndicatorView setDarkened:animated:completion:](progressIndicatorView, "setDarkened:animated:completion:", 0, v12, v32);
        -[SUICProgressIndicatorView setCheckmarkVisible:animated:completion:](self->_progressIndicatorView, "setCheckmarkVisible:animated:completion:", 0, v12, 0);
        objc_destroyWeak(&v33);
        objc_destroyWeak((id *)buf);
        break;
      case 1uLL:
        -[SUICProgressIndicatorView setArrowVisible:delay:animated:completion:](self->_progressIndicatorView, "setArrowVisible:delay:animated:completion:", 0, v12, 0, 0.0);
        objc_initWeak((id *)buf, self);
        v18 = self->_progressIndicatorView;
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __100__SUICProgressIndicatorViewController_progressStateMachine_didTransitionToState_fromState_forEvent___block_invoke_2;
        v30[3] = &unk_1E4A54FE8;
        objc_copyWeak(&v31, (id *)buf);
        -[SUICProgressIndicatorView setProgressValue:animated:completion:](v18, "setProgressValue:animated:completion:", v12, v30, 0.8);
        objc_destroyWeak(&v31);
        objc_destroyWeak((id *)buf);
        break;
      case 2uLL:
        -[SUICProgressIndicatorViewController dataSource](self, "dataSource");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "progress");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        -[SUICProgressIndicatorView setSpinning:](self->_progressIndicatorView, "setSpinning:", 0);
        -[SUICProgressIndicatorView setDarkened:animated:completion:](self->_progressIndicatorView, "setDarkened:animated:completion:", 0, v12, 0);
        -[SUICProgressIndicatorView setCheckmarkVisible:animated:completion:](self->_progressIndicatorView, "setCheckmarkVisible:animated:completion:", 0, v12, 0);
        -[SUICProgressIndicatorView setProgressValue:animated:completion:](self->_progressIndicatorView, "setProgressValue:animated:completion:", v12, 0, (double)objc_msgSend(v20, "completedUnitCount") / (double)objc_msgSend(v20, "totalUnitCount"));

        break;
      case 3uLL:
        objc_initWeak((id *)buf, self);
        v21 = self->_progressIndicatorView;
        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = __100__SUICProgressIndicatorViewController_progressStateMachine_didTransitionToState_fromState_forEvent___block_invoke_3;
        v27[3] = &unk_1E4A54FC0;
        objc_copyWeak(&v28, (id *)buf);
        v29 = v12;
        -[SUICProgressIndicatorView setArrowVisible:delay:animated:completion:](v21, "setArrowVisible:delay:animated:completion:", 0, v12, v27, 0.0);
        -[SUICProgressIndicatorView setSpinning:](self->_progressIndicatorView, "setSpinning:", 0);
        objc_destroyWeak(&v28);
        objc_destroyWeak((id *)buf);
        break;
      default:
        break;
    }
    v22 = (void *)*MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_INFO))
    {
      v23 = v22;
      SUICProgressStateNameForState(a4);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      SUICProgressStateNameForState(a5);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      SUICProgressEventNameForEvent(a6);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136316162;
      v36 = "-[SUICProgressIndicatorViewController progressStateMachine:didTransitionToState:fromState:forEvent:]";
      v37 = 2112;
      v38 = v10;
      v39 = 2112;
      v40 = v24;
      v41 = 2112;
      v42 = v25;
      v43 = 2112;
      v44 = v26;
      _os_log_impl(&dword_1A3752000, v23, OS_LOG_TYPE_INFO, "%s State machine %@ transitioned to state %@ from state %@ for event %@", buf, 0x34u);

    }
  }
  else
  {
    v13 = (void *)*MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_ERROR))
    {
      v14 = v13;
      -[SUICProgressIndicatorViewController _stateMachine](self, "_stateMachine");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      SUICProgressEventNameForEvent(a6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v36 = "-[SUICProgressIndicatorViewController progressStateMachine:didTransitionToState:fromState:forEvent:]";
      v37 = 2112;
      v38 = v10;
      v39 = 2112;
      v40 = v15;
      v41 = 2112;
      v42 = v16;
      _os_log_error_impl(&dword_1A3752000, v14, OS_LOG_TYPE_ERROR, "%s State machine %@ doesn't match data source state machine %@, not listening to event %@", buf, 0x2Au);

    }
  }

}

void __100__SUICProgressIndicatorViewController_progressStateMachine_didTransitionToState_fromState_forEvent___block_invoke(uint64_t a1, int a2)
{
  id *WeakRetained;
  id *v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (a2 && WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained[121], "setArrowVisible:delay:animated:completion:", 1, *(unsigned __int8 *)(a1 + 40), 0, 0.25);
    WeakRetained = v5;
  }

}

void __100__SUICProgressIndicatorViewController_progressStateMachine_didTransitionToState_fromState_forEvent___block_invoke_2(uint64_t a1, int a2)
{
  id *WeakRetained;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (a2 && WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained[121], "setSpinning:", 1);
    WeakRetained = v4;
  }

}

void __100__SUICProgressIndicatorViewController_progressStateMachine_didTransitionToState_fromState_forEvent___block_invoke_3(uint64_t a1, int a2)
{
  _QWORD *WeakRetained;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  char v10;
  id location;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (a2 && WeakRetained)
  {
    objc_initWeak(&location, WeakRetained);
    v6 = (void *)v5[121];
    v7 = *(unsigned __int8 *)(a1 + 40);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __100__SUICProgressIndicatorViewController_progressStateMachine_didTransitionToState_fromState_forEvent___block_invoke_4;
    v8[3] = &unk_1E4A54FC0;
    objc_copyWeak(&v9, &location);
    v10 = *(_BYTE *)(a1 + 40);
    objc_msgSend(v6, "setProgressValue:animated:completion:", v7, v8, 1.0);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

}

void __100__SUICProgressIndicatorViewController_progressStateMachine_didTransitionToState_fromState_forEvent___block_invoke_4(uint64_t a1, int a2)
{
  id *WeakRetained;
  id *v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (a2 && WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained[121], "setDarkened:animated:completion:", 1, *(unsigned __int8 *)(a1 + 40), 0);
    objc_msgSend(v5[121], "setCheckmarkVisible:animated:completion:", 1, *(unsigned __int8 *)(a1 + 40), 0);
    WeakRetained = v5;
  }

}

- (void)progressStateMachine:(id)a3 ignoredEvent:(unint64_t)a4
{
  id v6;
  BOOL v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = -[SUICProgressIndicatorViewController _shouldAcceptEventsFromStateMachine:](self, "_shouldAcceptEventsFromStateMachine:", v6);
  v8 = (void *)*MEMORY[0x1E0CFE6A0];
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_INFO))
    {
      v9 = v8;
      SUICProgressEventNameForEvent(a4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 136315650;
      v12 = "-[SUICProgressIndicatorViewController progressStateMachine:ignoredEvent:]";
      v13 = 2112;
      v14 = v6;
      v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_1A3752000, v9, OS_LOG_TYPE_INFO, "%s State machine %@ ignored event %@", (uint8_t *)&v11, 0x20u);

    }
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_ERROR))
  {
    -[SUICProgressIndicatorViewController progressStateMachine:ignoredEvent:].cold.1((uint64_t)v6, v8, self);
  }

}

- (SUICProgressIndicatorView)_progressIndicatorView
{
  return self->_progressIndicatorView;
}

- (void)_setProgressIndicatorView:(id)a3
{
  objc_storeStrong((id *)&self->_progressIndicatorView, a3);
}

- (SUICProgressIndicatorViewControllerDataSource)dataSource
{
  return (SUICProgressIndicatorViewControllerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_progressIndicatorView, 0);
}

- (void)progressStateMachine:(void *)a3 ignoredEvent:.cold.1(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(a3, "_stateMachine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 136315650;
  v8 = "-[SUICProgressIndicatorViewController progressStateMachine:ignoredEvent:]";
  v9 = 2112;
  v10 = a1;
  v11 = 2112;
  v12 = v6;
  _os_log_error_impl(&dword_1A3752000, v5, OS_LOG_TYPE_ERROR, "%s State machine %@ doesn't match data source state machine %@, not listening to event", (uint8_t *)&v7, 0x20u);

}

@end
