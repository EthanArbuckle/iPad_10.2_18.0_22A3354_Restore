@implementation MTATimerButtonsController

- (MTATimerButtonsController)initWithTarget:(id)a3
{
  id v4;
  MTATimerButtonsController *v5;
  MTATimerButtonsController *v6;
  MTACircleButton *v7;
  MTACircleButton *startStopButton;
  void *v9;
  void *v10;
  void *v11;
  MTACircleButton *v12;
  MTACircleButton *cancelButton;
  void *v14;
  void *v15;
  void *v16;
  MTACircleButton *v17;
  void *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MTATimerButtonsController;
  v5 = -[MTATimerButtonsController init](&v20, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_target, v4);
    v6->_shouldEnableStartButton = 1;
    v7 = objc_alloc_init(MTACircleButton);
    startStopButton = v6->_startStopButton;
    v6->_startStopButton = v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[MTACircleButton setBackgroundColor:](v6->_startStopButton, "setBackgroundColor:", v9);

    -[MTACircleButton addTarget:action:forControlEvents:](v6->_startStopButton, "addTarget:action:forControlEvents:", v6, "_startStopButtonTapped:", 64);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIShape circleShape](UIShape, "circleShape"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTACircleButton hoverStyle](v6->_startStopButton, "hoverStyle"));
    objc_msgSend(v11, "setShape:", v10);

    v12 = objc_alloc_init(MTACircleButton);
    cancelButton = v6->_cancelButton;
    v6->_cancelButton = v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[MTACircleButton setBackgroundColor:](v6->_cancelButton, "setBackgroundColor:", v14);

    -[MTACircleButton addTarget:action:forControlEvents:](v6->_cancelButton, "addTarget:action:forControlEvents:", v6, "_cancelButtonTapped:", 64);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIShape circleShape](UIShape, "circleShape"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTACircleButton hoverStyle](v6->_cancelButton, "hoverStyle"));
    objc_msgSend(v16, "setShape:", v15);

    v17 = v6->_cancelButton;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_buttonBackgroundColor](UIColor, "mtui_buttonBackgroundColor"));
    -[MTACircleButton setTintColor:](v17, "setTintColor:", v18);

  }
  return v6;
}

- (void)handleContentSizeChange
{
  -[MTACircleButton handleContentSizeChange](self->_startStopButton, "handleContentSizeChange");
  -[MTACircleButton handleContentSizeChange](self->_cancelButton, "handleContentSizeChange");
}

- (void)setButtonSize:(unint64_t)a3
{
  self->_buttonSize = a3;
  -[MTACircleButton setButtonCircleSize:](self->_startStopButton, "setButtonCircleSize:");
  -[MTACircleButton setButtonCircleSize:](self->_cancelButton, "setButtonCircleSize:", a3);
  -[MTATimerButtonsController setState:](self, "setState:", self->_state);
}

- (void)setShouldEnableStartButton:(BOOL)a3
{
  if (self->_shouldEnableStartButton != a3)
  {
    self->_shouldEnableStartButton = a3;
    -[MTATimerButtonsController setState:](self, "setState:", self->_state);
  }
}

- (void)_startStopButtonTapped:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  unint64_t state;
  id WeakRetained;
  int v10;
  MTATimerButtonsController *v11;
  __int16 v12;
  unint64_t v13;

  v4 = a3;
  v6 = MTLogForCategory(8, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    state = self->_state;
    v10 = 138543618;
    v11 = self;
    v12 = 2050;
    v13 = state;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ start/stop button tapped with state: %{public}lu", (uint8_t *)&v10, 0x16u);
  }

  switch(self->_state)
  {
    case 0uLL:
    case 4uLL:
      NSLog(CFSTR("Attempting to start/stop timer in an unknown state"));
      break;
    case 1uLL:
      WeakRetained = objc_loadWeakRetained((id *)&self->_target);
      objc_msgSend(WeakRetained, "startTimer:", v4);
      goto LABEL_7;
    case 2uLL:
    case 3uLL:
      WeakRetained = objc_loadWeakRetained((id *)&self->_target);
      objc_msgSend(WeakRetained, "pauseResumeTimer:", v4);
LABEL_7:

      break;
    default:
      break;
  }

}

- (void)_cancelButtonTapped:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  unint64_t state;
  unint64_t v9;
  id WeakRetained;
  int v11;
  MTATimerButtonsController *v12;
  __int16 v13;
  unint64_t v14;

  v4 = a3;
  v6 = MTLogForCategory(8, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    state = self->_state;
    v11 = 138543618;
    v12 = self;
    v13 = 2050;
    v14 = state;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ cancel button tapped with state: %{public}lu", (uint8_t *)&v11, 0x16u);
  }

  v9 = self->_state;
  if (v9 <= 4)
  {
    if (((1 << v9) & 0x13) != 0)
    {
      NSLog(CFSTR("Attempting to cancel a timer in a stopped or unknown state"));
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_target);
      objc_msgSend(WeakRetained, "cancelTimer:", v4);

    }
  }

}

- (void)setState:(unint64_t)a3
{
  MTACircleButton *v4;
  void *v5;
  void *v6;
  MTACircleButton *v7;
  void *v8;
  MTACircleButton *v9;
  uint64_t v10;
  MTACircleButton *startStopButton;
  void *v12;
  void *v13;
  MTACircleButton *v14;
  void *v15;
  MTACircleButton *v16;
  uint64_t v17;
  MTACircleButton *v18;
  void *v19;
  void *v20;
  MTACircleButton *v21;
  void *v22;
  void *v23;
  MTACircleButton *cancelButton;
  void *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  MTACircleButton *v29;
  uint64_t v30;
  void *v31;
  MTACircleButton *v32;
  void *v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  void *v37;

  self->_state = a3;
  switch(a3)
  {
    case 3uLL:
      startStopButton = self->_startStopButton;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("PAUSE_TIMER"), &stru_10009A4D0, 0));
      -[MTACircleButton setTitle:forState:](startStopButton, "setTitle:forState:", v13, 0);

      v14 = self->_startStopButton;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_pauseButtonTextColor](UIColor, "mtui_pauseButtonTextColor"));
      -[MTACircleButton setTitleColor:forState:](v14, "setTitleColor:forState:", v15, 0);

      v16 = self->_startStopButton;
      v17 = objc_claimAutoreleasedReturnValue(+[UIColor mtui_pauseButtonTintColor](UIColor, "mtui_pauseButtonTintColor"));
LABEL_8:
      v23 = (void *)v17;
      -[MTACircleButton setTintColor:](v16, "setTintColor:", v17);

      cancelButton = self->_cancelButton;
      LODWORD(v23) = MTUIIsPhoneIdiom();
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v26 = v25;
      if ((_DWORD)v23)
        v27 = CFSTR("CANCEL_TIMER");
      else
        v27 = CFSTR("CANCEL");
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedStringForKey:value:table:", v27, &stru_10009A4D0, 0));
      -[MTACircleButton setTitle:forState:](cancelButton, "setTitle:forState:", v28, 0);

      v29 = self->_cancelButton;
      v30 = objc_claimAutoreleasedReturnValue(+[UIColor mtui_primaryColor](UIColor, "mtui_primaryColor"));
      goto LABEL_17;
    case 2uLL:
      v18 = self->_startStopButton;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("RESUME_TIMER"), &stru_10009A4D0, 0));
      -[MTACircleButton setTitle:forState:](v18, "setTitle:forState:", v20, 0);

      v21 = self->_startStopButton;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_startResumeButtonTextColor](UIColor, "mtui_startResumeButtonTextColor"));
      -[MTACircleButton setTitleColor:forState:](v21, "setTitleColor:forState:", v22, 0);

      v16 = self->_startStopButton;
      v17 = objc_claimAutoreleasedReturnValue(+[UIColor mtui_startResumeButtonTintColor](UIColor, "mtui_startResumeButtonTintColor"));
      goto LABEL_8;
    case 1uLL:
      v4 = self->_startStopButton;
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("START_TIMER"), &stru_10009A4D0, 0));
      -[MTACircleButton setTitle:forState:](v4, "setTitle:forState:", v6, 0);

      v7 = self->_startStopButton;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_startResumeButtonTextColor](UIColor, "mtui_startResumeButtonTextColor"));
      -[MTACircleButton setTitleColor:forState:](v7, "setTitleColor:forState:", v8, 0);

      v9 = self->_startStopButton;
      if (self->_shouldEnableStartButton)
        v10 = objc_claimAutoreleasedReturnValue(+[UIColor mtui_startResumeButtonTintColor](UIColor, "mtui_startResumeButtonTintColor"));
      else
        v10 = objc_claimAutoreleasedReturnValue(+[UIColor mtui_disabledStartButtonTintColor](UIColor, "mtui_disabledStartButtonTintColor"));
      v31 = (void *)v10;
      -[MTACircleButton setTintColor:](v9, "setTintColor:", v10);

      v32 = self->_cancelButton;
      LODWORD(v31) = MTUIIsPhoneIdiom();
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v34 = v33;
      if ((_DWORD)v31)
        v35 = CFSTR("CANCEL_TIMER");
      else
        v35 = CFSTR("CANCEL");
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "localizedStringForKey:value:table:", v35, &stru_10009A4D0, 0));
      -[MTACircleButton setTitle:forState:](v32, "setTitle:forState:", v36, 0);

      v29 = self->_cancelButton;
      v30 = objc_claimAutoreleasedReturnValue(+[UIColor mtui_tertiaryColor](UIColor, "mtui_tertiaryColor"));
LABEL_17:
      v37 = (void *)v30;
      -[MTACircleButton setTitleColor:forState:](v29, "setTitleColor:forState:", v30, 0);

      break;
  }
  -[MTACircleButton setEnabled:](self->_startStopButton, "setEnabled:", self->_shouldEnableStartButton);
  -[MTACircleButton cancelTrackingWithEvent:](self->_startStopButton, "cancelTrackingWithEvent:", 0);
  -[MTACircleButton cancelTrackingWithEvent:](self->_cancelButton, "cancelTrackingWithEvent:", 0);
}

- (TimerControlsTarget)target
{
  return (TimerControlsTarget *)objc_loadWeakRetained((id *)&self->_target);
}

- (void)setTarget:(id)a3
{
  objc_storeWeak((id *)&self->_target, a3);
}

- (MTACircleButton)startStopButton
{
  return self->_startStopButton;
}

- (MTACircleButton)cancelButton
{
  return self->_cancelButton;
}

- (unint64_t)state
{
  return self->_state;
}

- (unint64_t)buttonSize
{
  return self->_buttonSize;
}

- (BOOL)shouldEnableStartButton
{
  return self->_shouldEnableStartButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_startStopButton, 0);
  objc_destroyWeak((id *)&self->_target);
}

@end
