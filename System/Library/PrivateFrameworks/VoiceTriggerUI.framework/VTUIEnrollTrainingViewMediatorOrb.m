@implementation VTUIEnrollTrainingViewMediatorOrb

- (VTUIEnrollTrainingViewMediatorOrb)initWithTrainingView:(id)a3
{
  id v5;
  VTUIEnrollTrainingViewMediatorOrb *v6;
  VTUIEnrollTrainingViewMediatorOrb *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VTUIEnrollTrainingViewMediatorOrb;
  v6 = -[VTUIEnrollTrainingViewMediatorOrb init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_enrollTrainingView, a3);

  return v7;
}

- (void)hideTrainingElements
{
  void *v3;

  -[VTUIEnrollTrainingView orbView](self->_enrollTrainingView, "orbView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  -[VTUIEnrollTrainingView setCheckMarkViewHidden:](self->_enrollTrainingView, "setCheckMarkViewHidden:", 1);
}

- (void)showTrainingElements
{
  void *v3;

  -[VTUIEnrollTrainingView orbView](self->_enrollTrainingView, "orbView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 0);

  -[VTUIEnrollTrainingView setCheckMarkViewHidden:](self->_enrollTrainingView, "setCheckMarkViewHidden:", 0);
}

- (void)setNeedsUpdateConstraints
{
  -[VTUIEnrollTrainingView setNeedsUpdateConstraints](self->_enrollTrainingView, "setNeedsUpdateConstraints");
}

- (void)clearInstructionLabel
{
  -[VTUIEnrollTrainingView clearInstructionLabel](self->_enrollTrainingView, "clearInstructionLabel");
}

- (void)animateSuccessfulStep:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  _BOOL4 v11;
  uint64_t v12;

  v4 = a3;
  v12 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = *MEMORY[0x24BE09000];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE09000], OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315394;
    v9 = "-[VTUIEnrollTrainingViewMediatorOrb animateSuccessfulStep:completion:]";
    v10 = 1024;
    v11 = v4;
    _os_log_impl(&dword_229EF7000, v7, OS_LOG_TYPE_DEFAULT, "%s Animate. For Success: %d", (uint8_t *)&v8, 0x12u);
  }
  -[VTUIEnrollTrainingView startCheckMarkAnimation:completion:](self->_enrollTrainingView, "startCheckMarkAnimation:completion:", v4, v6);

}

- (void)hideSkipButton:(BOOL)a3
{
  -[VTUIEnrollTrainingView setSkipButtonHidden:](self->_enrollTrainingView, "setSkipButtonHidden:", a3);
}

- (void)hideRadarButton:(BOOL)a3
{
  -[VTUIEnrollTrainingView setRadarButtonHidden:](self->_enrollTrainingView, "setRadarButtonHidden:", a3);
}

- (void)hideTrainingView:(BOOL)a3
{
  VTUIEnrollTrainingView *enrollTrainingView;

  enrollTrainingView = self->_enrollTrainingView;
  if (enrollTrainingView)
    -[VTUIEnrollTrainingView setHidden:](enrollTrainingView, "setHidden:", 1);
}

- (void)showTrainingView
{
  VTUIEnrollTrainingView *enrollTrainingView;

  enrollTrainingView = self->_enrollTrainingView;
  if (enrollTrainingView)
    -[VTUIEnrollTrainingView setHidden:](enrollTrainingView, "setHidden:", 0);
}

- (void)hideContinuationAndPreludeLabel:(BOOL)a3
{
  -[VTUIEnrollTrainingView setContinuationAndPreludeLabelHidden:](self->_enrollTrainingView, "setContinuationAndPreludeLabelHidden:", a3);
}

- (void)hidePreludeLabel:(BOOL)a3
{
  -[VTUIEnrollTrainingView setPreludeLabelHidden:](self->_enrollTrainingView, "setPreludeLabelHidden:", a3);
}

- (void)hideContinuationLabel:(BOOL)a3
{
  -[VTUIEnrollTrainingView setContinuationLabelHidden:animated:](self->_enrollTrainingView, "setContinuationLabelHidden:animated:", a3, 0);
}

- (void)hideInstructions
{
  -[VTUIEnrollTrainingView clearInstructionLabel](self->_enrollTrainingView, "clearInstructionLabel");
  -[VTUIEnrollTrainingViewMediatorOrb hideContinuationAndPreludeLabel:](self, "hideContinuationAndPreludeLabel:", 1);
}

- (void)slideInText:(id)a3 afterDelay:(double)a4 completion:(id)a5
{
  -[VTUIEnrollTrainingView slideInText:afterDelay:completion:](self->_enrollTrainingView, "slideInText:afterDelay:completion:", a3, a5, a4);
}

- (void)setInstructionPreludeLabel:(id)a3
{
  VTUIEnrollTrainingView *enrollTrainingView;
  id v4;
  id v5;

  enrollTrainingView = self->_enrollTrainingView;
  v4 = a3;
  -[VTUIEnrollTrainingView instructionPreludeLabel](enrollTrainingView, "instructionPreludeLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (void)setInstructionContinuationLabel:(id)a3
{
  VTUIEnrollTrainingView *enrollTrainingView;
  id v4;
  id v5;

  enrollTrainingView = self->_enrollTrainingView;
  v4 = a3;
  -[VTUIEnrollTrainingView instructionContinuationLabel](enrollTrainingView, "instructionContinuationLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (void)animateToOff
{
  id v2;

  -[VTUIEnrollTrainingView orbView](self->_enrollTrainingView, "orbView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "animateToOffWithCompletion:", 0);

}

- (void)animateToListeningState
{
  id v2;

  -[VTUIEnrollTrainingView orbView](self->_enrollTrainingView, "orbView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setMode:", 1);

}

- (void)showRadarExitButton:(id)a3
{
  -[VTUIEnrollTrainingView showRadarExitButton:](self->_enrollTrainingView, "showRadarExitButton:", a3);
}

- (void)addTargetToRadarExitButton:(id)a3 action:(SEL)a4 forControlEvents:(unint64_t)a5
{
  VTUIEnrollTrainingView *enrollTrainingView;
  id v8;
  id v9;

  enrollTrainingView = self->_enrollTrainingView;
  v8 = a3;
  -[VTUIEnrollTrainingView radarExitButton](enrollTrainingView, "radarExitButton");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addTarget:action:forControlEvents:", v8, a4, a5);

}

- (void)showStatusMessage:(id)a3 afterDelay:(double)a4 completion:(id)a5
{
  id v8;
  id v9;
  dispatch_time_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id location;

  v8 = a3;
  v9 = a5;
  objc_initWeak(&location, self);
  v10 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __77__VTUIEnrollTrainingViewMediatorOrb_showStatusMessage_afterDelay_completion___block_invoke;
  v13[3] = &unk_24F33E210;
  objc_copyWeak(&v16, &location);
  v14 = v8;
  v15 = v9;
  v11 = v8;
  v12 = v9;
  dispatch_after(v10, MEMORY[0x24BDAC9B8], v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __77__VTUIEnrollTrainingViewMediatorOrb_showStatusMessage_afterDelay_completion___block_invoke(id *a1)
{
  id *WeakRetained;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void (**v12)(void);
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  _QWORD v16[4];
  id v17;
  _QWORD v18[5];

  WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    v3 = objc_msgSend(a1[4], "length");
    objc_msgSend(WeakRetained[1], "statusLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v3)
    {
      objc_msgSend(v4, "setAlpha:", 0.0);

      objc_msgSend(WeakRetained[1], "statusLabel");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setText:", a1[4]);

      v7 = (void *)MEMORY[0x24BEBDB00];
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __77__VTUIEnrollTrainingViewMediatorOrb_showStatusMessage_afterDelay_completion___block_invoke_2;
      v18[3] = &unk_24F33DA28;
      v18[4] = WeakRetained;
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __77__VTUIEnrollTrainingViewMediatorOrb_showStatusMessage_afterDelay_completion___block_invoke_3;
      v16[3] = &unk_24F33DE20;
      v17 = a1[5];
      objc_msgSend(v7, "animateWithDuration:animations:completion:", v18, v16, 0.3);
      v8 = v17;
LABEL_6:

      goto LABEL_9;
    }
    objc_msgSend(v4, "alpha");
    v10 = v9;

    if (v10 > 0.0)
    {
      v11 = (void *)MEMORY[0x24BEBDB00];
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __77__VTUIEnrollTrainingViewMediatorOrb_showStatusMessage_afterDelay_completion___block_invoke_4;
      v15[3] = &unk_24F33DA28;
      v15[4] = WeakRetained;
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __77__VTUIEnrollTrainingViewMediatorOrb_showStatusMessage_afterDelay_completion___block_invoke_5;
      v13[3] = &unk_24F33DE48;
      v13[4] = WeakRetained;
      v14 = a1[5];
      objc_msgSend(v11, "animateWithDuration:animations:completion:", v15, v13, 0.3);
      v8 = v14;
      goto LABEL_6;
    }
  }
  v12 = (void (**)(void))a1[5];
  if (v12)
    v12[2]();
LABEL_9:

}

void __77__VTUIEnrollTrainingViewMediatorOrb_showStatusMessage_afterDelay_completion___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "statusLabel");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

uint64_t __77__VTUIEnrollTrainingViewMediatorOrb_showStatusMessage_afterDelay_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __77__VTUIEnrollTrainingViewMediatorOrb_showStatusMessage_afterDelay_completion___block_invoke_4(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "statusLabel");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

uint64_t __77__VTUIEnrollTrainingViewMediatorOrb_showStatusMessage_afterDelay_completion___block_invoke_5(uint64_t a1)
{
  void *v2;
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "statusLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setText:", 0);

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)setPowerLevel:(float)a3
{
  double v4;
  id v5;

  -[VTUIEnrollTrainingView orbView](self->_enrollTrainingView, "orbView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setPowerLevel:", v4);

}

- (VTUIEnrollTrainingView)enrollTrainingView
{
  return self->_enrollTrainingView;
}

- (void)setEnrollTrainingView:(id)a3
{
  objc_storeStrong((id *)&self->_enrollTrainingView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enrollTrainingView, 0);
}

@end
