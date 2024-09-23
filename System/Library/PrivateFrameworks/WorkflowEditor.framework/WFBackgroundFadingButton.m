@implementation WFBackgroundFadingButton

- (NSMutableDictionary)backgroundColorsByState
{
  NSMutableDictionary *backgroundColorsByState;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;

  backgroundColorsByState = self->_backgroundColorsByState;
  if (!backgroundColorsByState)
  {
    v4 = (NSMutableDictionary *)objc_opt_new();
    v5 = self->_backgroundColorsByState;
    self->_backgroundColorsByState = v4;

    backgroundColorsByState = self->_backgroundColorsByState;
  }
  return backgroundColorsByState;
}

- (void)setBackgroundColor:(id)a3 forState:(unint64_t)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[WFBackgroundFadingButton backgroundColorsByState](self, "backgroundColorsByState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v6, "setObject:forKey:", v8, v7);
  else
    objc_msgSend(v6, "removeObjectForKey:", v7);

  if (-[WFBackgroundFadingButton state](self, "state") == a4)
    -[WFBackgroundFadingButton updateBackgroundColorAnimated:](self, "updateBackgroundColorAnimated:", 0);

}

- (void)setDerivesTitleColorFromTintColor:(BOOL)a3
{
  void *v4;
  id v5;

  if (self->_derivesTitleColorFromTintColor != a3)
  {
    self->_derivesTitleColorFromTintColor = a3;
    if (a3)
    {
      -[WFBackgroundFadingButton tintColor](self, "tintColor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFBackgroundFadingButton setTitleColor:forState:](self, "setTitleColor:forState:", v4, 0);

      objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      -[WFBackgroundFadingButton setTitleColor:forState:](self, "setTitleColor:forState:", v5, 2);

    }
  }
}

- (void)setDerivesBackgroundColorFromTintColor:(BOOL)a3
{
  if (self->_derivesBackgroundColorFromTintColor != a3)
  {
    self->_derivesBackgroundColorFromTintColor = a3;
    -[WFBackgroundFadingButton updateBackgroundColorAnimated:](self, "updateBackgroundColorAnimated:", 0);
  }
}

- (void)tintColorDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFBackgroundFadingButton;
  -[WFBackgroundFadingButton tintColorDidChange](&v4, sel_tintColorDidChange);
  if (-[WFBackgroundFadingButton derivesTitleColorFromTintColor](self, "derivesTitleColorFromTintColor"))
  {
    -[WFBackgroundFadingButton tintColor](self, "tintColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFBackgroundFadingButton setTitleColor:forState:](self, "setTitleColor:forState:", v3, 0);

  }
  if (-[WFBackgroundFadingButton derivesBackgroundColorFromTintColor](self, "derivesBackgroundColorFromTintColor"))
    -[WFBackgroundFadingButton updateBackgroundColorAnimated:](self, "updateBackgroundColorAnimated:", 0);
}

- (void)updateBackgroundColorAnimated:(BOOL)a3
{
  double v3;
  _QWORD v4[5];

  v3 = 0.100000001;
  if (!a3)
    v3 = 0.0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __58__WFBackgroundFadingButton_updateBackgroundColorAnimated___block_invoke;
  v4[3] = &unk_24EE25C70;
  v4[4] = self;
  objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:", v4, v3);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  objc_super v6;

  v3 = a3;
  v5 = -[WFBackgroundFadingButton isHighlighted](self, "isHighlighted");
  v6.receiver = self;
  v6.super_class = (Class)WFBackgroundFadingButton;
  -[WFBackgroundFadingButton setHighlighted:](&v6, sel_setHighlighted_, v3);
  if (v5 != v3)
    -[WFBackgroundFadingButton updateBackgroundColorAnimated:](self, "updateBackgroundColorAnimated:", 1);
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  objc_super v6;

  v3 = a3;
  v5 = -[WFBackgroundFadingButton isSelected](self, "isSelected");
  v6.receiver = self;
  v6.super_class = (Class)WFBackgroundFadingButton;
  -[WFBackgroundFadingButton setSelected:](&v6, sel_setSelected_, v3);
  if (v5 != v3)
    -[WFBackgroundFadingButton updateBackgroundColorAnimated:](self, "updateBackgroundColorAnimated:", 1);
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  objc_super v6;

  v3 = a3;
  v5 = -[WFBackgroundFadingButton isEnabled](self, "isEnabled");
  v6.receiver = self;
  v6.super_class = (Class)WFBackgroundFadingButton;
  -[WFBackgroundFadingButton setEnabled:](&v6, sel_setEnabled_, v3);
  if (v5 != v3)
    -[WFBackgroundFadingButton updateBackgroundColorAnimated:](self, "updateBackgroundColorAnimated:", 1);
}

- (BOOL)derivesTitleColorFromTintColor
{
  return self->_derivesTitleColorFromTintColor;
}

- (BOOL)derivesBackgroundColorFromTintColor
{
  return self->_derivesBackgroundColorFromTintColor;
}

- (void)setBackgroundColorsByState:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColorsByState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColorsByState, 0);
}

void __58__WFBackgroundFadingButton_updateBackgroundColorAnimated___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;

  v2 = objc_msgSend(*(id *)(a1 + 32), "state");
  if (!objc_msgSend(*(id *)(a1 + 32), "derivesBackgroundColorFromTintColor"))
  {
    objc_msgSend(*(id *)(a1 + 32), "backgroundColorsByState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v7);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }
  if (!v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "tintColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = 0.100000001;
    goto LABEL_8;
  }
  if ((v2 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "secondarySystemBackgroundColor");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
      goto LABEL_10;
LABEL_12:
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v10 = objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(a1 + 32);
    v12 = (id)v10;
    goto LABEL_13;
  }
  if ((v2 & 5) == 0)
    goto LABEL_12;
  objc_msgSend(*(id *)(a1 + 32), "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = 0.300000012;
LABEL_8:
  objc_msgSend(v3, "colorWithAlphaComponent:", v5);
  v11 = (id)objc_claimAutoreleasedReturnValue();

LABEL_9:
  v8 = (uint64_t)v11;
  if (!v11)
    goto LABEL_12;
LABEL_10:
  v9 = *(void **)(a1 + 32);
  v12 = (id)v8;
  v10 = v8;
LABEL_13:
  objc_msgSend(v9, "setBackgroundColor:", v10);

}

@end
