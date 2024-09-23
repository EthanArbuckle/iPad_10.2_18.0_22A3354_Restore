@implementation PUSlideshowSpeedCell

- (void)updateConstraints
{
  UIImageView *slowerGlyphImageView;
  UIImageView *fasterGlyphImageView;
  void *v5;
  NSArray *v6;
  void *v7;
  void *v8;
  UISlider *slider;
  void *v10;
  void *v11;
  void *v12;
  UIImageView *v13;
  void *v14;
  void *v15;
  void *v16;
  UIImageView *v17;
  void *v18;
  void *v19;
  NSArray *speedConstraints;
  objc_super v21;

  if (self->_slider)
  {
    slowerGlyphImageView = self->_slowerGlyphImageView;
    if (slowerGlyphImageView)
    {
      fasterGlyphImageView = self->_fasterGlyphImageView;
      if (fasterGlyphImageView)
      {
        if (!self->_speedConstraints)
        {
          _NSDictionaryOfVariableBindings(CFSTR("_slowerGlyphImageView, _fasterGlyphImageView, _slider"), slowerGlyphImageView, fasterGlyphImageView, self->_slider, 0);
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-[_slowerGlyphImageView]-[_slider]-[_fasterGlyphImageView]-|"), 0, 0, v5);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray addObjectsFromArray:](v6, "addObjectsFromArray:", v7);

          v8 = (void *)MEMORY[0x1E0CB3718];
          slider = self->_slider;
          -[PUSlideshowSpeedCell contentView](self, "contentView");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", slider, 10, 0, v10, 10, 1.0, 0.0);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray addObject:](v6, "addObject:", v11);

          v12 = (void *)MEMORY[0x1E0CB3718];
          v13 = self->_slowerGlyphImageView;
          -[PUSlideshowSpeedCell contentView](self, "contentView");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v13, 10, 0, v14, 10, 1.0, 0.0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray addObject:](v6, "addObject:", v15);

          v16 = (void *)MEMORY[0x1E0CB3718];
          v17 = self->_fasterGlyphImageView;
          -[PUSlideshowSpeedCell contentView](self, "contentView");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v17, 10, 0, v18, 10, 1.0, 0.0);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray addObject:](v6, "addObject:", v19);

          objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v6);
          speedConstraints = self->_speedConstraints;
          self->_speedConstraints = v6;

        }
      }
    }
  }
  v21.receiver = self;
  v21.super_class = (Class)PUSlideshowSpeedCell;
  -[PUSlideshowSpeedCell updateConstraints](&v21, sel_updateConstraints);
}

- (PUSlideshowSpeedCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PUSlideshowSpeedCell *v4;
  PUSlideshowSpeedCell *v5;
  void *v6;
  UIImageView *v7;
  void *v8;
  void *v9;
  UIImageView *fasterGlyphImageView;
  UIImageView *v11;
  void *v12;
  UIImageView *v13;
  void *v14;
  void *v15;
  UIImageView *slowerGlyphImageView;
  UIImageView *v17;
  UISlider *v18;
  double v19;
  double v20;
  void *v21;
  UISlider *slider;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)PUSlideshowSpeedCell;
  v4 = -[PUSlideshowSpeedCell initWithStyle:reuseIdentifier:](&v24, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_enabled = 1;
    -[PUSlideshowSpeedCell setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PUSlideshowSpeedCell setSelectionStyle:](v5, "setSelectionStyle:", 0);
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("hare.fill"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v6);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v7, "setTintColor:", v8);

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PUSlideshowSpeedCell contentView](v5, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v7);

    fasterGlyphImageView = v5->_fasterGlyphImageView;
    v5->_fasterGlyphImageView = v7;
    v11 = v7;

    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("tortoise.fill"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v12);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v13, "setTintColor:", v14);

    -[PUSlideshowSpeedCell contentView](v5, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSubview:", v13);

    slowerGlyphImageView = v5->_slowerGlyphImageView;
    v5->_slowerGlyphImageView = v13;
    v17 = v13;

    v18 = (UISlider *)objc_alloc_init(MEMORY[0x1E0DC3C80]);
    -[UISlider setTranslatesAutoresizingMaskIntoConstraints:](v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v19) = 2.0;
    -[UISlider setMinimumValue:](v18, "setMinimumValue:", v19);
    LODWORD(v20) = 10.0;
    -[UISlider setMaximumValue:](v18, "setMaximumValue:", v20);
    -[UISlider setContinuous:](v18, "setContinuous:", 0);
    -[UISlider addTarget:action:forControlEvents:](v18, "addTarget:action:forControlEvents:", v5, sel__stepDurationValueChanged_, 4096);
    -[PUSlideshowSpeedCell contentView](v5, "contentView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addSubview:", v18);

    slider = v5->_slider;
    v5->_slider = v18;

  }
  return v5;
}

- (void)_updateView
{
  -[UISlider setEnabled:](self->_slider, "setEnabled:", self->_enabled);
}

- (void)_stepDurationValueChanged:(id)a3
{
  PUSlideshowSpeedCellDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    -[PUSlideshowSpeedCell stepDuration](self, "stepDuration");
    objc_msgSend(v7, "PUSlideshowSpeedCell:stepDurationDidChange:", self);

  }
}

- (double)stepDuration
{
  float v2;

  -[UISlider value](self->_slider, "value");
  return 10.0 - (double)(uint64_t)v2 + 2.0;
}

- (void)setStepDuration:(double)a3
{
  *(float *)&a3 = (float)(12 - (uint64_t)a3);
  -[UISlider setValue:](self->_slider, "setValue:", a3);
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    -[PUSlideshowSpeedCell _updateView](self, "_updateView");
  }
}

- (PUSlideshowSpeedCellDelegate)delegate
{
  return (PUSlideshowSpeedCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_speedConstraints, 0);
  objc_storeStrong((id *)&self->_slider, 0);
  objc_storeStrong((id *)&self->_fasterGlyphImageView, 0);
  objc_storeStrong((id *)&self->_slowerGlyphImageView, 0);
}

@end
