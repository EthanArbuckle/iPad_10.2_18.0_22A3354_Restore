@implementation WFCompactStopButton

- (WFCompactStopButton)initWithFrame:(CGRect)a3
{
  WFCompactStopButton *v3;
  id v4;
  void *v5;
  void *v6;
  WFWorkflowProgressView *progressView;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  WFCompactStopButton *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v25;
  _QWORD v26[5];

  v26[4] = *MEMORY[0x24BDAC8D0];
  v25.receiver = self;
  v25.super_class = (Class)WFCompactStopButton;
  v3 = -[WFCompactStopButton initWithFrame:](&v25, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x24BEC54E8]);
    objc_msgSend(v4, "setStopSize:", 12.0);
    objc_msgSend(v4, "setProgressStrokeWidth:", 3.0);
    objc_msgSend(v4, "setUserInteractionEnabled:", 0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "colorWithAlphaComponent:", 0.800000012);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTintColor:", v6);

    objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[WFCompactStopButton addSubview:](v3, "addSubview:", v4);
    -[WFCompactStopButton sendSubviewToBack:](v3, "sendSubviewToBack:", v4);
    progressView = v3->_progressView;
    v3->_progressView = (WFWorkflowProgressView *)v4;
    v8 = v4;

    v19 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v8, "topAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFCompactStopButton topAnchor](v3, "topAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v23);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v22;
    objc_msgSend(v8, "leadingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFCompactStopButton leadingAnchor](v3, "leadingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v20);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = v9;
    objc_msgSend(v8, "trailingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFCompactStopButton trailingAnchor](v3, "trailingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v26[2] = v12;
    objc_msgSend(v8, "bottomAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFCompactStopButton bottomAnchor](v3, "bottomAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v26[3] = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "activateConstraints:", v16);

    -[WFCompactStopButton addTarget:action:forControlEvents:](v3, "addTarget:action:forControlEvents:", v3, sel_handleTouchUpInside, 64);
    v17 = v3;
  }

  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[NSProgress removeObserver:forKeyPath:context:](self->_progress, "removeObserver:forKeyPath:context:", self, CFSTR("fractionCompleted"), progressContext);
  v3.receiver = self;
  v3.super_class = (Class)WFCompactStopButton;
  -[WFCompactStopButton dealloc](&v3, sel_dealloc);
}

- (void)setProgress:(id)a3
{
  NSProgress *v4;
  NSProgress *progress;
  NSProgress *v6;

  v4 = (NSProgress *)a3;
  -[NSProgress removeObserver:forKeyPath:context:](self->_progress, "removeObserver:forKeyPath:context:", self, CFSTR("fractionCompleted"), progressContext);
  progress = self->_progress;
  self->_progress = v4;
  v6 = v4;

  -[NSProgress addObserver:forKeyPath:options:context:](v6, "addObserver:forKeyPath:options:context:", self, CFSTR("fractionCompleted"), 0, progressContext);
}

- (void)handleTouchUpInside
{
  id v2;

  -[WFCompactStopButton progress](self, "progress");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancel");

}

- (void)setHighlighted:(BOOL)a3
{
  _QWORD v5[5];
  BOOL v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFCompactStopButton;
  -[WFCompactStopButton setHighlighted:](&v7, sel_setHighlighted_);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __38__WFCompactStopButton_setHighlighted___block_invoke;
  v5[3] = &unk_24E604718;
  v5[4] = self;
  v6 = a3;
  objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:", v5, 0.200000003);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v6;
  _QWORD block[5];

  if ((void *)progressContext == a6)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __70__WFCompactStopButton_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_24E604D88;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)WFCompactStopButton;
    -[WFCompactStopButton observeValueForKeyPath:ofObject:change:context:](&v6, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)transitionToCompleted:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  id v6;

  v4 = a4;
  v5 = a3;
  -[WFCompactStopButton progressView](self, "progressView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "transitionToState:animated:", v5, v4);

}

- (NSProgress)progress
{
  return self->_progress;
}

- (WFWorkflowProgressView)progressView
{
  return self->_progressView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_progress, 0);
}

void __70__WFCompactStopButton_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "progress");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fractionCompleted");
  v3 = v2;
  objc_msgSend(*(id *)(a1 + 32), "progressView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFractionCompleted:", v3);

}

void __38__WFCompactStopButton_setHighlighted___block_invoke(uint64_t a1)
{
  double v1;
  id v2;

  if (*(_BYTE *)(a1 + 40))
    v1 = 0.466666669;
  else
    v1 = 1.0;
  objc_msgSend(*(id *)(a1 + 32), "progressView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", v1);

}

@end
