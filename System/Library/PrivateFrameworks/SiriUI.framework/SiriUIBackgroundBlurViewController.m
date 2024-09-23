@implementation SiriUIBackgroundBlurViewController

- (SiriUIBackgroundBlurViewController)initWithDelegate:(id)a3
{
  id v4;
  SiriUIBackgroundBlurViewController *v5;
  SiriUIBackgroundBlurViewController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SiriUIBackgroundBlurViewController;
  v5 = -[SiriUIBackgroundBlurViewController initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, 0, 0);
  v6 = v5;
  if (v5)
    -[SiriUIBackgroundBlurViewController setBackgroundBlurViewControllerDelegate:](v5, "setBackgroundBlurViewControllerDelegate:", v4);

  return v6;
}

- (SiriUIBackgroundBlurViewController)init
{
  return -[SiriUIBackgroundBlurViewController initWithDelegate:](self, "initWithDelegate:", 0);
}

- (void)viewDidLoad
{
  SiriUIBackgroundBlurView *v3;
  void *v4;
  SiriUIBackgroundBlurView *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SiriUIBackgroundBlurViewController;
  -[SiriUIBackgroundBlurViewController viewDidLoad](&v8, sel_viewDidLoad);
  -[SiriUIBackgroundBlurViewController setBackgroundBlurIsVisible:](self, "setBackgroundBlurIsVisible:", 0);
  -[SiriUIBackgroundBlurViewController setBackgroundBlurVisibleReason:](self, "setBackgroundBlurVisibleReason:", 5);
  v3 = [SiriUIBackgroundBlurView alloc];
  -[SiriUIBackgroundBlurViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v5 = -[SiriUIBackgroundBlurView initWithFrame:](v3, "initWithFrame:");
  -[SiriUIBackgroundBlurViewController setBackgroundBlurView:](self, "setBackgroundBlurView:", v5);

  -[SiriUIBackgroundBlurViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUIBackgroundBlurViewController backgroundBlurView](self, "backgroundBlurView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v7);

}

- (void)requestBackgroundBlurVisible:(BOOL)a3 forReason:(int64_t)a4
{
  _BOOL4 v5;
  os_log_t *v8;
  void *v9;
  const __CFString *v10;
  NSObject *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  NSObject *v15;
  os_log_t v16;
  NSObject *v17;
  __CFString *v18;
  os_log_t v19;
  NSObject *v20;
  __CFString *v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  os_log_t v25;
  __CFString *v26;
  os_log_t v27;
  NSObject *v28;
  __CFString *v29;
  void *v30;
  void *v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  const __CFString *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  const __CFString *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v5 = a3;
  v42 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SiriUIBackgroundBlurViewController requestBackgroundBlurVisible:forReason:]");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SiriUIBackgroundBlurViewController.m"), 55, CFSTR("%@ can only be used on the main thread"), v31);

  }
  v8 = (os_log_t *)MEMORY[0x24BE08FB0];
  v9 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    if (v5)
      v10 = CFSTR("show");
    else
      v10 = CFSTR("hide");
    v11 = v9;
    +[SiriUIUtilities stringForSiriUIBackgroundBlurReason:](SiriUIUtilities, "stringForSiriUIBackgroundBlurReason:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[SiriUIBackgroundBlurViewController backgroundBlurIsVisible](self, "backgroundBlurIsVisible"))
      v13 = CFSTR("showing");
    else
      v13 = CFSTR("hidden");
    +[SiriUIUtilities stringForSiriUIBackgroundBlurReason:](SiriUIUtilities, "stringForSiriUIBackgroundBlurReason:", -[SiriUIBackgroundBlurViewController backgroundBlurVisibleReason](self, "backgroundBlurVisibleReason"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316162;
    v33 = "-[SiriUIBackgroundBlurViewController requestBackgroundBlurVisible:forReason:]";
    v34 = 2112;
    v35 = v10;
    v36 = 2112;
    v37 = v12;
    v38 = 2112;
    v39 = v13;
    v40 = 2112;
    v41 = v14;
    _os_log_impl(&dword_21764F000, v11, OS_LOG_TYPE_DEFAULT, "%s Request to %@ blur for reason %@. Current visibility: %@ and reason: %@", buf, 0x34u);

  }
  if (-[SiriUIBackgroundBlurViewController backgroundBlurIsVisible](self, "backgroundBlurIsVisible") != v5)
  {
    if (v5)
    {
      if (!a4)
      {
        v15 = *v8;
        if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
          -[SiriUIBackgroundBlurViewController requestBackgroundBlurVisible:forReason:].cold.1(v15);
        return;
      }
      goto LABEL_23;
    }
    goto LABEL_26;
  }
  if (v5 && -[SiriUIBackgroundBlurViewController backgroundBlurVisibleReason](self, "backgroundBlurVisibleReason") > a4)
  {
    -[SiriUIBackgroundBlurViewController setBackgroundBlurVisibleReason:](self, "setBackgroundBlurVisibleReason:", a4);
    v16 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      v17 = v16;
      +[SiriUIUtilities stringForSiriUIBackgroundBlurReason:](SiriUIUtilities, "stringForSiriUIBackgroundBlurReason:", a4);
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v33 = "-[SiriUIBackgroundBlurViewController requestBackgroundBlurVisible:forReason:]";
      v34 = 2112;
      v35 = v18;
      _os_log_impl(&dword_21764F000, v17, OS_LOG_TYPE_DEFAULT, "%s Background blur is visible for reason: %@", buf, 0x16u);

    }
  }
  if (a4 == 4
    && -[SiriUIBackgroundBlurViewController backgroundBlurVisibleReason](self, "backgroundBlurVisibleReason") >= 4)
  {
    if (v5)
    {
LABEL_23:
      -[SiriUIBackgroundBlurViewController setBackgroundBlurVisibleReason:](self, "setBackgroundBlurVisibleReason:", a4);
      -[SiriUIBackgroundBlurViewController setBackgroundBlurIsVisible:](self, "setBackgroundBlurIsVisible:", 1);
      v19 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
      {
        v20 = v19;
        +[SiriUIUtilities stringForSiriUIBackgroundBlurReason:](SiriUIUtilities, "stringForSiriUIBackgroundBlurReason:", a4);
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v33 = "-[SiriUIBackgroundBlurViewController requestBackgroundBlurVisible:forReason:]";
        v34 = 2112;
        v35 = v21;
        _os_log_impl(&dword_21764F000, v20, OS_LOG_TYPE_DEFAULT, "%s Showing the background blur for reason: %@", buf, 0x16u);

      }
      -[SiriUIBackgroundBlurViewController backgroundBlurView](self, "backgroundBlurView");
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = v22;
      v24 = 1;
      goto LABEL_32;
    }
LABEL_26:
    if (-[SiriUIBackgroundBlurViewController backgroundBlurVisibleReason](self, "backgroundBlurVisibleReason") < a4)
    {
      v25 = *v8;
      if (!os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
        return;
      v23 = v25;
      +[SiriUIUtilities stringForSiriUIBackgroundBlurReason:](SiriUIUtilities, "stringForSiriUIBackgroundBlurReason:", a4);
      v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v33 = "-[SiriUIBackgroundBlurViewController requestBackgroundBlurVisible:forReason:]";
      v34 = 2112;
      v35 = v26;
      _os_log_impl(&dword_21764F000, v23, OS_LOG_TYPE_DEFAULT, "%s NOT hiding the background blur for reason: %@", buf, 0x16u);

      goto LABEL_33;
    }
    -[SiriUIBackgroundBlurViewController setBackgroundBlurVisibleReason:](self, "setBackgroundBlurVisibleReason:", 5);
    -[SiriUIBackgroundBlurViewController setBackgroundBlurIsVisible:](self, "setBackgroundBlurIsVisible:", 0);
    v27 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      v28 = v27;
      +[SiriUIUtilities stringForSiriUIBackgroundBlurReason:](SiriUIUtilities, "stringForSiriUIBackgroundBlurReason:", a4);
      v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v33 = "-[SiriUIBackgroundBlurViewController requestBackgroundBlurVisible:forReason:]";
      v34 = 2112;
      v35 = v29;
      _os_log_impl(&dword_21764F000, v28, OS_LOG_TYPE_DEFAULT, "%s Hiding the background blur for reason: %@", buf, 0x16u);

    }
    -[SiriUIBackgroundBlurViewController backgroundBlurView](self, "backgroundBlurView");
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v22;
    v24 = 0;
LABEL_32:
    -[NSObject setVisible:](v22, "setVisible:", v24);
LABEL_33:

  }
}

- (void)setBackgroundBlurIsVisible:(BOOL)a3
{
  id v4;

  if (self->_backgroundBlurIsVisible != a3)
  {
    self->_backgroundBlurIsVisible = a3;
    -[SiriUIBackgroundBlurViewController backgroundBlurViewControllerDelegate](self, "backgroundBlurViewControllerDelegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "backgroundBlurViewController:didSetBlurVisibilityTo:", self, self->_backgroundBlurIsVisible);

  }
}

- (SiriUIBackgroundBlurView)backgroundBlurView
{
  return self->_backgroundBlurView;
}

- (void)setBackgroundBlurView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundBlurView, a3);
}

- (BOOL)backgroundBlurIsVisible
{
  return self->_backgroundBlurIsVisible;
}

- (int64_t)backgroundBlurVisibleReason
{
  return self->_backgroundBlurVisibleReason;
}

- (void)setBackgroundBlurVisibleReason:(int64_t)a3
{
  self->_backgroundBlurVisibleReason = a3;
}

- (SiriUIBackgroundBlurViewControllerDelegate)backgroundBlurViewControllerDelegate
{
  return (SiriUIBackgroundBlurViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_backgroundBlurViewControllerDelegate);
}

- (void)setBackgroundBlurViewControllerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_backgroundBlurViewControllerDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_backgroundBlurViewControllerDelegate);
  objc_storeStrong((id *)&self->_backgroundBlurView, 0);
}

- (void)requestBackgroundBlurVisible:(os_log_t)log forReason:.cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "-[SiriUIBackgroundBlurViewController requestBackgroundBlurVisible:forReason:]";
  _os_log_error_impl(&dword_21764F000, log, OS_LOG_TYPE_ERROR, "%s Cannot request visibility with the force dismissal reason", (uint8_t *)&v1, 0xCu);
}

@end
