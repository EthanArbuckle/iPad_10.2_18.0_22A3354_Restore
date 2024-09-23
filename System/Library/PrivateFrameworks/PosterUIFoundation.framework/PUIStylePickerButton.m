@implementation PUIStylePickerButton

- (PUIStylePickerButton)initWithFrame:(CGRect)a3
{
  PUIStylePickerButton *v3;
  PUIStylePickerButton *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PUIStylePickerButton;
  v3 = -[PUIStylePickerButton initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PUIStylePickerButton layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCornerCurve:", *MEMORY[0x24BDE58E8]);

    -[PUIStylePickerButton layer](v4, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCornerRadius:", 14.0);

    -[PUIStylePickerButton layer](v4, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v7, "setBorderColor:", objc_msgSend(v8, "CGColor"));

  }
  return v4;
}

- (void)setSelected:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  double v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PUIStylePickerButton;
  -[PUIStylePickerButton setSelected:](&v8, sel_setSelected_);
  -[PUIStylePickerButton layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = 0.0;
  if (v3)
    v7 = 3.0;
  objc_msgSend(v5, "setBorderWidth:", v7);

}

@end
