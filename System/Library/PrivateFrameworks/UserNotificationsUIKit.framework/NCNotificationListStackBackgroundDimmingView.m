@implementation NCNotificationListStackBackgroundDimmingView

- (void)configureStackDimmingForTransform:(CGAffineTransform *)a3
{
  double v3;
  double v4;

  v3 = 2.0;
  if (a3->a >= 0.94)
    v3 = 1.0;
  if (a3->a > 0.94)
    v3 = 0.0;
  v4 = dbl_1CFD91690[v3 == 1.0];
  if (a3->a > 0.94)
    v4 = 0.0;
  self->_absoluteStackingBrightnessFilterInput = v4;
  -[NCNotificationListStackBackgroundDimmingView _updateDimming](self, "_updateDimming");
}

- (void)setBackgroundColor:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NCNotificationListStackBackgroundDimmingView;
  -[NCNotificationListStackBackgroundDimmingView setBackgroundColor:](&v4, sel_setBackgroundColor_, a3);
  -[NCNotificationListStackBackgroundDimmingView _updateDimming](self, "_updateDimming");
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("filters.colorBrightness.inputAmount")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)NCNotificationListStackBackgroundDimmingView;
    v5 = -[NCNotificationListStackBackgroundDimmingView _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4);
  }

  return v5;
}

- (void)_updateDimming
{
  double absoluteStackingBrightnessFilterInput;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  absoluteStackingBrightnessFilterInput = self->_absoluteStackingBrightnessFilterInput;
  -[NCNotificationListStackBackgroundDimmingView backgroundColor](self, "backgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_luminance");
  v6 = v5;

  -[NCNotificationListStackBackgroundDimmingView layer](self, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "filters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2BB8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setName:", CFSTR("colorBrightness"));
    -[NCNotificationListStackBackgroundDimmingView layer](self, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFilters:", v11);

  }
  if (v6 <= 0.5)
    v12 = absoluteStackingBrightnessFilterInput;
  else
    v12 = -absoluteStackingBrightnessFilterInput;
  -[NCNotificationListStackBackgroundDimmingView layer](self, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setValue:forKeyPath:", v14, CFSTR("filters.colorBrightness.inputAmount"));

}

@end
