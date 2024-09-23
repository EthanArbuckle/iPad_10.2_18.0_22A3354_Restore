@implementation PRREColorTableViewCell

- (PRREColorTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PRREColorTableViewCell *v4;
  UIColorWell *v5;
  UIColorWell *well;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PRREColorTableViewCell;
  v4 = -[PRREColorTableViewCell initWithStyle:reuseIdentifier:](&v8, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = (UIColorWell *)objc_alloc_init(MEMORY[0x1E0DC3670]);
    well = v4->_well;
    v4->_well = v5;

    -[UIColorWell setSupportsAlpha:](v4->_well, "setSupportsAlpha:", 0);
    -[UIColorWell addTarget:action:forControlEvents:](v4->_well, "addTarget:action:forControlEvents:", v4, sel__valueChanged_, 4096);
    -[UIColorWell addTarget:action:forControlEvents:](v4->_well, "addTarget:action:forControlEvents:", v4, sel__tapped_, 64);
    -[PRREColorTableViewCell setAccessoryView:](v4, "setAccessoryView:", v4->_well);
  }
  return v4;
}

- (void)_configure
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PRREColorTableViewCell;
  -[PRRETableViewCell _configure](&v3, sel__configure);
  -[UIColorWell sizeToFit](self->_well, "sizeToFit");
  -[PRREColorTableViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (id)_currentValue
{
  return -[UIColorWell selectedColor](self->_well, "selectedColor");
}

- (void)_setCurrentValue:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = objc_opt_class();
  v6 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  -[UIColorWell setSelectedColor:](self->_well, "setSelectedColor:", v8);
}

- (void)_tapped:(id)a3
{
  id v4;

  v4 = objc_alloc_init(MEMORY[0x1E0DC3668]);
  objc_msgSend(v4, "setDelegate:", self);
  objc_msgSend(v4, "setSupportsAlpha:", 0);

}

- (void)colorPickerViewController:(id)a3 didSelectColor:(id)a4 continuously:(BOOL)a5
{
  -[PRREColorTableViewCell _setCurrentValue:](self, "_setCurrentValue:", a4);
}

- (void)colorPickerViewControllerDidFinish:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "selectedColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRREColorTableViewCell _setCurrentValue:](self, "_setCurrentValue:", v4);

  -[PRRETableViewCell _valueChanged:](self, "_valueChanged:", self);
  objc_msgSend(v5, "setDelegate:", 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_well, 0);
}

@end
