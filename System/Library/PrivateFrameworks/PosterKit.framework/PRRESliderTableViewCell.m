@implementation PRRESliderTableViewCell

- (PRRESliderTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PRRESliderTableViewCell *v4;
  UISlider *v5;
  UISlider *slider;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PRRESliderTableViewCell;
  v4 = -[PRRESliderTableViewCell initWithStyle:reuseIdentifier:](&v8, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = (UISlider *)objc_alloc_init(MEMORY[0x1E0DC3C80]);
    slider = v4->_slider;
    v4->_slider = v5;

    -[UISlider addTarget:action:forControlEvents:](v4->_slider, "addTarget:action:forControlEvents:", v4, sel__valueChanged_, 4096);
    -[PRRESliderTableViewCell setAccessoryView:](v4, "setAccessoryView:", v4->_slider);
  }
  return v4;
}

- (void)_configure
{
  double v3;
  double v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PRRESliderTableViewCell;
  -[PRRETableViewCell _configure](&v5, sel__configure);
  LODWORD(v3) = 0;
  -[UISlider setMinimumValue:](self->_slider, "setMinimumValue:", v3);
  LODWORD(v4) = 1.0;
  -[UISlider setMaximumValue:](self->_slider, "setMaximumValue:", v4);
}

- (id)_currentValue
{
  void *v2;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  -[UISlider value](self->_slider, "value");
  return (id)objc_msgSend(v2, "numberWithFloat:");
}

- (void)_setCurrentValue:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  UISlider *slider;
  int v9;
  int v10;
  double v11;
  id v12;

  v4 = a3;
  v5 = objc_opt_class();
  v12 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v12;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  slider = self->_slider;
  objc_msgSend(v7, "floatValue");
  v10 = v9;

  LODWORD(v11) = v10;
  -[UISlider setValue:](slider, "setValue:", v11);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_slider, 0);
}

@end
