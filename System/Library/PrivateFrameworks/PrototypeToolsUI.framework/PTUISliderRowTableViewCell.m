@implementation PTUISliderRowTableViewCell

- (PTUISliderRowTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PTUISliderRowTableViewCell *v4;
  uint64_t v5;
  UISlider *slider;
  uint64_t v7;
  UILabel *label;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  objc_super v22;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  v22.receiver = self;
  v22.super_class = (Class)PTUISliderRowTableViewCell;
  v4 = -[PTUISliderRowTableViewCell initWithStyle:reuseIdentifier:](&v22, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = objc_opt_new();
    slider = v4->_slider;
    v4->_slider = (UISlider *)v5;

    -[UISlider setContinuous:](v4->_slider, "setContinuous:", 1);
    -[UISlider addTarget:action:forControlEvents:](v4->_slider, "addTarget:action:forControlEvents:", v4, sel__valueChanged_, 4096);
    v7 = objc_opt_new();
    label = v4->_label;
    v4->_label = (UILabel *)v7;

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", v4, sel_labelTapped);
    objc_msgSend(v9, "setNumberOfTapsRequired:", 1);
    -[UILabel addGestureRecognizer:](v4->_label, "addGestureRecognizer:", v9);
    -[UILabel setUserInteractionEnabled:](v4->_label, "setUserInteractionEnabled:", 1);
    v10 = objc_alloc(MEMORY[0x24BDF6DD0]);
    v23[0] = v4->_slider;
    v23[1] = v4->_label;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithArrangedSubviews:", v11);

    objc_msgSend(v12, "setAxis:", 0);
    objc_msgSend(v12, "setSpacing:", 10.0);
    objc_msgSend(v12, "frame");
    v14 = v13;
    objc_msgSend(v12, "frame");
    v16 = v15;
    -[PTUISliderRowTableViewCell _tableView](v4, "_tableView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "frame");
    v19 = v18 * 0.5;
    -[PTUISliderRowTableViewCell _tableView](v4, "_tableView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "frame");
    objc_msgSend(v12, "setFrame:", v14, v16, v19);

    -[PTUISliderRowTableViewCell setAccessoryView:](v4, "setAccessoryView:", v12);
  }
  return v4;
}

- (void)updateLabel
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  float v16;
  id v17;
  id v18;

  -[PTUIRowTableViewCell row](self, "row");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  v5 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  if (v7
    && (objc_msgSend(v7, "valueStringFormatter"), v8 = (void *)objc_claimAutoreleasedReturnValue(), v8, v8))
  {
    objc_msgSend(v7, "valueStringFormatter");
    v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x24BDD16E0];
    -[UISlider value](self->_slider, "value");
    objc_msgSend(v10, "numberWithFloat:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTUIRowTableViewCell row](self, "row");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "settings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *))v9)[2](v9, v11, v13);
    v17 = (id)objc_claimAutoreleasedReturnValue();

    v14 = (uint64_t)v17;
  }
  else
  {
    v15 = (void *)MEMORY[0x24BDD17C8];
    -[UISlider value](self->_slider, "value");
    objc_msgSend(v15, "stringWithFormat:", CFSTR("%.02f"), v16);
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v18 = (id)v14;
  -[UILabel setText:](self->_label, "setText:", v14);

}

- (void)updateCellCharacteristics
{
  UISlider *slider;
  void *v4;
  double v5;
  UISlider *v6;
  void *v7;
  double v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PTUISliderRowTableViewCell;
  -[PTUIRowTableViewCell updateCellCharacteristics](&v9, sel_updateCellCharacteristics);
  slider = self->_slider;
  -[PTUIRowTableViewCell row](self, "row");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "minValue");
  *(float *)&v5 = v5;
  -[UISlider setMinimumValue:](slider, "setMinimumValue:", v5);

  v6 = self->_slider;
  -[PTUIRowTableViewCell row](self, "row");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "maxValue");
  *(float *)&v8 = v8;
  -[UISlider setMaximumValue:](v6, "setMaximumValue:", v8);

}

- (void)updateDisplayedValue
{
  void *v3;
  UISlider *slider;
  id v5;

  -[PTUIRowTableViewCell row](self, "row");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  slider = self->_slider;
  objc_msgSend(v5, "floatValue");
  -[UISlider setValue:](slider, "setValue:");
  -[PTUISliderRowTableViewCell updateLabel](self, "updateLabel");

}

- (void)_valueChanged:(id)a3
{
  float v4;
  double v5;
  void *v6;
  void *v7;

  -[UISlider value](self->_slider, "value", a3);
  v5 = v4;
  -[PTUIRowTableViewCell row](self, "row");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:", v7);

  -[PTUISliderRowTableViewCell updateLabel](self, "updateLabel");
}

- (void)labelTapped
{
  void *v3;
  void *v4;
  id v5;

  if (PTUINumericKeypadIsNeeded())
  {
    +[PTUINumericKeypad sharedKeypad](PTUINumericKeypad, "sharedKeypad");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel text](self->_label, "text");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setStringValue:", v4);

    +[PTUINumericKeypad sharedKeypad](PTUINumericKeypad, "sharedKeypad");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "showAnimated:forDelegate:", 1, self);

  }
}

- (void)numericKeypadDidUpdateValue:(id)a3
{
  UISlider *slider;
  double v5;

  slider = self->_slider;
  objc_msgSend(a3, "doubleValue");
  *(float *)&v5 = v5;
  -[UISlider setValue:](slider, "setValue:", v5);
  -[UISlider sendActionsForControlEvents:](self->_slider, "sendActionsForControlEvents:", 4096);
  -[PTUISliderRowTableViewCell updateLabel](self, "updateLabel");
}

- (void)numericKeypadWillDismiss:(id)a3
{
  UISlider *slider;
  double v5;
  id v6;

  slider = self->_slider;
  objc_msgSend(a3, "doubleValue");
  *(float *)&v5 = v5;
  -[UISlider setValue:](slider, "setValue:", v5);
  -[PTUISliderRowTableViewCell updateLabel](self, "updateLabel");
  if (PTUINumericKeypadIsNeeded())
  {
    +[PTUINumericKeypad sharedKeypad](PTUINumericKeypad, "sharedKeypad");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hideAnimated:", 1);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_slider, 0);
}

@end
