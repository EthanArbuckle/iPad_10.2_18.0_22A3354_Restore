@implementation PIManualRedEyeAutoCalculator

- (PIManualRedEyeAutoCalculator)initWithComposition:(id)a3 location:(CGPoint)a4 touchDiameter:(double)a5
{
  CGFloat y;
  CGFloat x;
  id v9;
  PIManualRedEyeAutoCalculator *v10;
  objc_super v12;

  y = a4.y;
  x = a4.x;
  v9 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PIManualRedEyeAutoCalculator;
  v10 = -[NURenderRequest initWithComposition:](&v12, sel_initWithComposition_, v9);
  v10->_location.x = x;
  v10->_location.y = y;
  v10->_touchDiameter = a5;
  -[PIRedEyeAutoCalculator setForce:](v10, "setForce:", 1);

  return v10;
}

- (id)_options
{
  CGPoint *p_location;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  p_location = &self->_location;
  if (*MEMORY[0x1E0C9D538] == self->_location.x && *(double *)(MEMORY[0x1E0C9D538] + 8) == self->_location.y)
  {
    v10.receiver = self;
    v10.super_class = (Class)PIManualRedEyeAutoCalculator;
    -[PIRedEyeAutoCalculator _options](&v10, sel__options);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11[0] = CFSTR("locationX");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v5;
    v11[1] = CFSTR("locationY");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", p_location->y);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v6;
    v11[2] = CFSTR("touchDiameter");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_touchDiameter);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    return v8;
  }
}

- (void)_configureRequest:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PIManualRedEyeAutoCalculator;
  -[PIRedEyeAutoCalculator _configureRequest:](&v6, sel__configureRequest_, v4);
  objc_msgSend(MEMORY[0x1E0D520E0], "oneToOneScalePolicy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setScalePolicy:", v5);

}

@end
