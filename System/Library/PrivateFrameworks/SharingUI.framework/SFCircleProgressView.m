@implementation SFCircleProgressView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (SFCircleProgressView)initWithFrame:(CGRect)a3
{
  SFCircleProgressView *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SFCircleProgressView;
  v3 = -[SFCircleProgressView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCircleProgressView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scale");
    v7 = v6;
    -[SFCircleProgressView layer](v3, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setContentsScale:", v7);

  }
  return v3;
}

- (void)layoutSubviews
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SFCircleProgressView;
  -[SFCircleProgressView layoutSubviews](&v2, sel_layoutSubviews);
}

- (void)setProgressStartPoint:(int64_t)a3
{
  id v4;

  -[SFCircleProgressView layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProgressStartPoint:", a3);

}

- (int64_t)progressStartPoint
{
  void *v2;
  int64_t v3;

  -[SFCircleProgressView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "progressStartPoint");

  return v3;
}

- (void)setProgressColor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SFCircleProgressView layer](self, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setProgressColor:", v4);

}

- (UIColor)progressColor
{
  void *v2;
  void *v3;

  -[SFCircleProgressView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "progressColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (void)setProgressBackgroundColor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SFCircleProgressView layer](self, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setProgressBackgroundColor:", v4);

}

- (UIColor)progressBackgroundColor
{
  void *v2;
  void *v3;

  -[SFCircleProgressView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "progressBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (void)setProgressLineWidth:(double)a3
{
  id v4;

  -[SFCircleProgressView layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProgressLineWidth:", a3);

}

- (double)progressLineWidth
{
  void *v2;
  double v3;
  double v4;

  -[SFCircleProgressView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "progressLineWidth");
  v4 = v3;

  return v4;
}

- (void)setUsesRoundedLineCap:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SFCircleProgressView layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUsesRoundedLineCap:", v3);

}

- (BOOL)usesRoundedLineCap
{
  void *v2;
  char v3;

  -[SFCircleProgressView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "usesRoundedLineCap");

  return v3;
}

- (void)setShowProgressTray:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SFCircleProgressView layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowProgressTray:", v3);

}

- (BOOL)showProgressTray
{
  void *v2;
  char v3;

  -[SFCircleProgressView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showProgressTray");

  return v3;
}

- (double)progress
{
  void *v2;
  double v3;
  double v4;

  -[SFCircleProgressView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "progress");
  v4 = v3;

  return v4;
}

- (void)setProgress:(double)a3
{
  id v4;

  -[SFCircleProgressView layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProgress:", a3);

}

- (void)setProgress:(double)a3 animated:(BOOL)a4 completion:(id)a5
{
  -[SFCircleProgressView setProgress:animated:forced:completion:](self, "setProgress:animated:forced:completion:", a4, 0, a5, a3);
}

- (void)setProgress:(double)a3 animated:(BOOL)a4 forced:(BOOL)a5 completion:(id)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  void (**v10)(_QWORD);
  void (**v11)(_QWORD);
  void *v12;
  double v13;
  double v14;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  id *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  void (**v33)(_QWORD);

  v6 = a5;
  v7 = a4;
  v10 = (void (**)(_QWORD))a6;
  if (v10)
    v11 = v10;
  else
    v11 = (void (**)(_QWORD))&__block_literal_global_2;
  -[SFCircleProgressView layer](self, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "progress");
  v14 = v13;

  if (v14 == a3 && !v6)
    goto LABEL_13;
  if (!v7)
  {
    -[SFCircleProgressView layer](self, "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "removeAnimationForKey:", CFSTR("SFCircleProgressViewAnimationKey"));

    -[SFCircleProgressView setProgress:](self, "setProgress:", a3);
LABEL_13:
    v11[2](v11);
    goto LABEL_21;
  }
  -[SFCircleProgressView progressPresentationValue](self, "progressPresentationValue");
  v17 = v16;
  v18 = vabdd_f64(a3, v16);
  v19 = 1.0;
  if (v18 <= 0.9)
  {
    if (v18 <= 0.5)
    {
      v19 = 0.25;
      if (v18 > 0.2)
        v19 = 0.4;
    }
    else
    {
      v19 = 0.7;
    }
  }
  -[SFCircleProgressView layer](self, "layer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "animationKeys");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "containsObject:", CFSTR("SFCircleProgressViewAnimationKey"));

  v24 = (id *)MEMORY[0x24BDE5D20];
  if (v23)
    v24 = (id *)MEMORY[0x24BDE5D28];
  v25 = *v24;
  if (v17 < a3)
  {
    objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("progress"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setTimingFunction:", v27);

    objc_msgSend(v26, "setDuration:", v19);
    objc_msgSend(v26, "setFillMode:", *MEMORY[0x24BDE5968]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v17);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setFromValue:", v28);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setToValue:", v29);

    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    v30 = (void *)MEMORY[0x24BDE57D8];
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __63__SFCircleProgressView_setProgress_animated_forced_completion___block_invoke_2;
    v32[3] = &unk_24CE0F3C0;
    v33 = v11;
    objc_msgSend(v30, "setCompletionBlock:", v32);
    -[SFCircleProgressView layer](self, "layer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addAnimation:forKey:", v26, CFSTR("SFCircleProgressViewAnimationKey"));

    objc_msgSend(MEMORY[0x24BDE57D8], "commit");
  }
  -[SFCircleProgressView setProgress:](self, "setProgress:", a3);

LABEL_21:
}

uint64_t __63__SFCircleProgressView_setProgress_animated_forced_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)animateProgressCompletedWithCompletion:(id)a3
{
  void (**v4)(void);
  double v5;
  void (**v6)(void);

  v4 = (void (**)(void))a3;
  if (!v4)
    v4 = (void (**)(void))&__block_literal_global_157;
  v6 = v4;
  -[SFCircleProgressView progressPresentationValue](self, "progressPresentationValue");
  if (v5 == 1.0)
    v6[2]();
  else
    -[SFCircleProgressView setProgress:animated:forced:completion:](self, "setProgress:animated:forced:completion:", 1, 1, v6, 1.0);

}

- (double)progressPresentationValue
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[SFCircleProgressView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentationLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "progress");
  v5 = v4;

  return v5;
}

@end
