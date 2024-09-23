@implementation MTAStopwatchController

- (MTAStopwatchController)initWithTarget:(id)a3
{
  id v4;
  MTAStopwatchController *v5;
  MTAStopwatchController *v6;
  MTACircleButton *v7;
  MTACircleButton *startStopButton;
  MTACircleButton *v9;
  void *v10;
  void *v11;
  void *v12;
  MTACircleButton *v13;
  MTACircleButton *lapControlButton;
  MTACircleButton *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MTAStopwatchController;
  v5 = -[MTAStopwatchController init](&v20, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_target, v4);
    v7 = objc_alloc_init(MTACircleButton);
    startStopButton = v6->_startStopButton;
    v6->_startStopButton = v7;

    v9 = v6->_startStopButton;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[MTACircleButton setBackgroundColor:](v9, "setBackgroundColor:", v10);

    -[MTACircleButton addTarget:action:forControlEvents:](v6->_startStopButton, "addTarget:action:forControlEvents:", v6, "_startStopButtonDown:", 64);
    -[MTACircleButton setButtonCircleSize:](v6->_startStopButton, "setButtonCircleSize:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIShape circleShape](UIShape, "circleShape"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTACircleButton hoverStyle](v6->_startStopButton, "hoverStyle"));
    objc_msgSend(v12, "setShape:", v11);

    v13 = objc_alloc_init(MTACircleButton);
    lapControlButton = v6->_lapControlButton;
    v6->_lapControlButton = v13;

    v15 = v6->_lapControlButton;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[MTACircleButton setBackgroundColor:](v15, "setBackgroundColor:", v16);

    -[MTACircleButton addTarget:action:forControlEvents:](v6->_lapControlButton, "addTarget:action:forControlEvents:", v6, "_lapControlButtonDown:", 64);
    -[MTACircleButton setButtonCircleSize:](v6->_lapControlButton, "setButtonCircleSize:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIShape circleShape](UIShape, "circleShape"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTACircleButton hoverStyle](v6->_lapControlButton, "hoverStyle"));
    objc_msgSend(v18, "setShape:", v17);

  }
  return v6;
}

- (void)setButtonSize:(unint64_t)a3
{
  -[MTACircleButton setButtonCircleSize:](self->_startStopButton, "setButtonCircleSize:");
  -[MTACircleButton setButtonCircleSize:](self->_lapControlButton, "setButtonCircleSize:", a3);
}

- (void)_startStopButtonDown:(id)a3
{
  id v4;
  unint64_t mode;
  id WeakRetained;
  id v7;

  v4 = a3;
  mode = self->_mode;
  switch(mode)
  {
    case 3uLL:
      v7 = v4;
      WeakRetained = objc_loadWeakRetained((id *)&self->_target);
      objc_msgSend(WeakRetained, "resumeLapTimer");
      goto LABEL_7;
    case 2uLL:
      v7 = v4;
      WeakRetained = objc_loadWeakRetained((id *)&self->_target);
      objc_msgSend(WeakRetained, "pauseLapTimer");
      goto LABEL_7;
    case 1uLL:
      v7 = v4;
      WeakRetained = objc_loadWeakRetained((id *)&self->_target);
      objc_msgSend(WeakRetained, "startLapTimer");
LABEL_7:

      v4 = v7;
      break;
  }

}

- (void)_lapControlButtonDown:(id)a3
{
  id v4;
  unint64_t mode;
  id WeakRetained;
  id v7;

  v4 = a3;
  mode = self->_mode;
  switch(mode)
  {
    case 3uLL:
      goto LABEL_4;
    case 2uLL:
      v7 = v4;
      WeakRetained = objc_loadWeakRetained((id *)&self->_target);
      objc_msgSend(WeakRetained, "lapLapTimer");
      goto LABEL_6;
    case 1uLL:
LABEL_4:
      v7 = v4;
      WeakRetained = objc_loadWeakRetained((id *)&self->_target);
      objc_msgSend(WeakRetained, "resetLapTimer");
LABEL_6:

      v4 = v7;
      break;
  }

}

- (void)setMode:(unint64_t)a3
{
  -[MTAStopwatchController setMode:force:](self, "setMode:force:", a3, 0);
}

- (void)setMode:(unint64_t)a3 force:(BOOL)a4
{
  MTACircleButton *v5;
  void *v6;
  void *v7;
  MTACircleButton *v8;
  void *v9;
  MTACircleButton *v10;
  void *v11;
  MTACircleButton *v12;
  void *v13;
  void *v14;
  MTACircleButton *v15;
  void *v16;
  MTACircleButton *v17;
  uint64_t v18;
  MTACircleButton *startStopButton;
  void *v20;
  void *v21;
  MTACircleButton *v22;
  void *v23;
  MTACircleButton *v24;
  void *v25;
  MTACircleButton *lapControlButton;
  void *v27;
  void *v28;
  const __CFString *v29;
  MTACircleButton *v30;
  void *v31;
  void *v32;
  MTACircleButton *v33;
  void *v34;
  MTACircleButton *v35;
  void *v36;
  void *v37;
  MTACircleButton *v38;
  void *v39;
  id v40;

  if (!a4 && self->_mode == a3)
    return;
  self->_mode = a3;
  switch(a3)
  {
    case 3uLL:
      startStopButton = self->_startStopButton;
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("RESUME_STOPWATCH"), &stru_10009A4D0, 0));
      -[MTACircleButton setTitle:forState:](startStopButton, "setTitle:forState:", v21, 0);

      v22 = self->_startStopButton;
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_startResumeButtonTextColor](UIColor, "mtui_startResumeButtonTextColor"));
      -[MTACircleButton setTitleColor:forState:](v22, "setTitleColor:forState:", v23, 0);

      v24 = self->_startStopButton;
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_startResumeButtonTintColor](UIColor, "mtui_startResumeButtonTintColor"));
      -[MTACircleButton setTintColor:](v24, "setTintColor:", v25);

      lapControlButton = self->_lapControlButton;
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v28 = v27;
      v29 = CFSTR("RESET_STOPWATCH");
LABEL_10:
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "localizedStringForKey:value:table:", v29, &stru_10009A4D0, 0));
      -[MTACircleButton setTitle:forState:](lapControlButton, "setTitle:forState:", v37, 0);

      v38 = self->_lapControlButton;
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_primaryColor](UIColor, "mtui_primaryColor"));
      -[MTACircleButton setTitleColor:forState:](v38, "setTitleColor:forState:", v39, 0);

      v17 = self->_lapControlButton;
      v18 = objc_claimAutoreleasedReturnValue(+[UIColor mtui_lapResetButtonTintColor](UIColor, "mtui_lapResetButtonTintColor"));
      goto LABEL_11;
    case 2uLL:
      v30 = self->_startStopButton;
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("PAUSE_STOPWATCH"), &stru_10009A4D0, 0));
      -[MTACircleButton setTitle:forState:](v30, "setTitle:forState:", v32, 0);

      v33 = self->_startStopButton;
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_stopButtonTextColor](UIColor, "mtui_stopButtonTextColor"));
      -[MTACircleButton setTitleColor:forState:](v33, "setTitleColor:forState:", v34, 0);

      v35 = self->_startStopButton;
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_stopButtonTintColor](UIColor, "mtui_stopButtonTintColor"));
      -[MTACircleButton setTintColor:](v35, "setTintColor:", v36);

      lapControlButton = self->_lapControlButton;
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v28 = v27;
      v29 = CFSTR("MARK_LAP_STOPWATCH");
      goto LABEL_10;
    case 1uLL:
      v5 = self->_startStopButton;
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("START_STOPWATCH"), &stru_10009A4D0, 0));
      -[MTACircleButton setTitle:forState:](v5, "setTitle:forState:", v7, 0);

      v8 = self->_startStopButton;
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_startResumeButtonTextColor](UIColor, "mtui_startResumeButtonTextColor"));
      -[MTACircleButton setTitleColor:forState:](v8, "setTitleColor:forState:", v9, 0);

      v10 = self->_startStopButton;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_startResumeButtonTintColor](UIColor, "mtui_startResumeButtonTintColor"));
      -[MTACircleButton setTintColor:](v10, "setTintColor:", v11);

      v12 = self->_lapControlButton;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("MARK_LAP_STOPWATCH"), &stru_10009A4D0, 0));
      -[MTACircleButton setTitle:forState:](v12, "setTitle:forState:", v14, 0);

      v15 = self->_lapControlButton;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_disabledTextColor](UIColor, "mtui_disabledTextColor"));
      -[MTACircleButton setTitleColor:forState:](v15, "setTitleColor:forState:", v16, 0);

      v17 = self->_lapControlButton;
      v18 = objc_claimAutoreleasedReturnValue(+[UIColor mtui_disabledButtonTintColor](UIColor, "mtui_disabledButtonTintColor"));
LABEL_11:
      v40 = (id)v18;
      -[MTACircleButton setTintColor:](v17, "setTintColor:", v18);

      break;
  }
}

- (MTAStopwatchControlsTarget)target
{
  return (MTAStopwatchControlsTarget *)objc_loadWeakRetained((id *)&self->_target);
}

- (MTACircleButton)startStopButton
{
  return self->_startStopButton;
}

- (MTACircleButton)lapControlButton
{
  return self->_lapControlButton;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lapControlButton, 0);
  objc_storeStrong((id *)&self->_startStopButton, 0);
  objc_destroyWeak((id *)&self->_target);
}

@end
