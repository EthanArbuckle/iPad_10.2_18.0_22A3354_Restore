@implementation PUIColorStatistics

- (_UILegibilitySettings)legibilitySettings
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[_UILegibilitySettingsProvider settings](self->_legibilityProvider, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return (_UILegibilitySettings *)v4;
}

- (PUIColorStatistics)initWithAverageColor:(id)a3 contrast:(double)a4
{
  id v6;
  PUIColorStatistics *v7;
  PUIColorStatistics *v8;

  v6 = a3;
  v7 = -[PUIColorStatistics initWithDelegate:](self, "initWithDelegate:", 0);
  v8 = v7;
  if (v7)
    -[PUIColorStatistics updateWithAverageColor:contrast:](v7, "updateWithAverageColor:contrast:", v6, a4);

  return v8;
}

- (PUIColorStatistics)initWithAverageColor:(id)a3
{
  id v4;
  PUIColorStatistics *v5;
  PUIColorStatistics *v6;

  v4 = a3;
  v5 = -[PUIColorStatistics initWithDelegate:](self, "initWithDelegate:", 0);
  v6 = v5;
  if (v5)
    -[PUIColorStatistics resetWithColor:](v5, "resetWithColor:", v4);

  return v6;
}

- (PUIColorStatistics)initWithDelegate:(id)a3
{
  id v4;
  PUIColorStatistics *v5;
  PUIColorStatistics *v6;
  uint64_t v7;
  UIColor *averageColor;
  double v9;
  _UILegibilitySettingsProvider *v10;
  _UILegibilitySettingsProvider *legibilityProvider;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PUIColorStatistics;
  v5 = -[PUIColorStatistics init](&v13, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x24BDF6950], "systemGrayColor");
    v7 = objc_claimAutoreleasedReturnValue();
    averageColor = v6->_averageColor;
    v6->_averageColor = (UIColor *)v7;

    -[UIColor _luminance](v6->_averageColor, "_luminance");
    v6->_averageContrast = v9;
    v10 = (_UILegibilitySettingsProvider *)objc_alloc_init(MEMORY[0x24BDF70F8]);
    legibilityProvider = v6->_legibilityProvider;
    v6->_legibilityProvider = v10;

    -[_UILegibilitySettingsProvider accumulateChangesToContentColor:](v6->_legibilityProvider, "accumulateChangesToContentColor:", v6->_averageColor);
  }

  return v6;
}

- (UIColor)averageColor
{
  os_unfair_lock_s *p_lock;
  UIColor *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_averageColor;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (double)averageContrast
{
  os_unfair_lock_s *p_lock;
  double averageContrast;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  averageContrast = self->_averageContrast;
  os_unfair_lock_unlock(p_lock);
  return averageContrast;
}

- (void)resetWithColor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "colorWithAlphaComponent:", 1.0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_luminance");
  -[PUIColorStatistics updateWithAverageColor:contrast:](self, "updateWithAverageColor:contrast:", v4);

}

- (void)updateWithAverageColor:(id)a3 contrast:(double)a4
{
  UIColor *v7;
  id WeakRetained;
  void *v9;
  char v10;
  id v11;
  id v12;

  v12 = a3;
  os_unfair_lock_lock(&self->_lock);
  v7 = self->_averageColor;
  objc_storeStrong((id *)&self->_averageColor, a3);
  self->_averageContrast = a4;
  -[_UILegibilitySettingsProvider clearContentColorAccumulator](self->_legibilityProvider, "clearContentColorAccumulator");
  -[_UILegibilitySettingsProvider accumulateChangesToContentColor:contrast:](self->_legibilityProvider, "accumulateChangesToContentColor:contrast:", self->_averageColor, self->_averageContrast);
  os_unfair_lock_unlock(&self->_lock);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v9 = WeakRetained;
    v10 = -[UIColor _isSimilarToColor:withinPercentage:](v7, "_isSimilarToColor:withinPercentage:", v12, 0.00000011920929);

    if ((v10 & 1) == 0)
    {
      v11 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v11, "colorStatisticsDidChange:", self);

    }
  }

}

- (void)updateWithColorBoxes:(id)a3
{
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  id v8;
  void *v9;
  double v10;

  v4 = *MEMORY[0x24BDBF028];
  v5 = *(double *)(MEMORY[0x24BDBF028] + 8);
  v6 = *(double *)(MEMORY[0x24BDBF028] + 16);
  v7 = *(double *)(MEMORY[0x24BDBF028] + 24);
  v8 = a3;
  PUIAverageColorFromColorBoxes(v8, v4, v5, v6, v7, 0.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -1.0;
  PUICalculateContrastFromColorBoxes(v8, 0, &v10, v4, v5, v6, v7);

  -[PUIColorStatistics updateWithAverageColor:contrast:](self, "updateWithAverageColor:contrast:", v9, v10);
}

- (BOOL)isSimilarToColorStatistics:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  BOOL v10;

  v4 = a3;
  if (v4)
  {
    -[PUIColorStatistics averageColor](self, "averageColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "averageColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "_isSimilarToColor:withinPercentage:", v6, 0.00000011920929))
    {
      -[PUIColorStatistics averageContrast](self, "averageContrast");
      v8 = v7;
      objc_msgSend(v4, "averageContrast");
      v10 = vabdd_f64(v8, v9) <= 0.00000011920929;
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)invalidate
{
  objc_storeWeak((id *)&self->_delegate, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[PUIColorStatistics initWithAverageColor:contrast:]([PUIColorStatistics alloc], "initWithAverageColor:contrast:", self->_averageColor, self->_averageContrast);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[PUIColorStatistics averageColor](self, "averageColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "BSColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("averageColor"));

  -[PUIColorStatistics averageContrast](self, "averageContrast");
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("averageContrast"));

}

- (PUIColorStatistics)initWithCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  PUIColorStatistics *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("averageContrast"));
  v6 = v5;
  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, CFSTR("averageColor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "UIColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PUIColorStatistics initWithAverageColor:contrast:](self, "initWithAverageColor:contrast:", v9, v6);

  return v10;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIColorStatistics averageColor](self, "averageColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIColorStatistics averageContrast](self, "averageContrast");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; color: %@; contrast: %.2f>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (PUIColorStatisticsDelegate)delegate
{
  return (PUIColorStatisticsDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_averageColor, 0);
  objc_storeStrong((id *)&self->_legibilityProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
