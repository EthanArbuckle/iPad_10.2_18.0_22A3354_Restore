@implementation TIGaussianErrorGenerator

- (TIGaussianErrorGenerator)initWithAttributes:(id)a3
{
  id v4;
  TIGaussianErrorGenerator *v5;
  TIGaussianErrorGenerator *v6;
  void *v7;
  void *v8;
  float v9;
  void *v10;
  void *v11;
  float v12;
  void *v13;
  void *v14;
  float v15;
  void *v16;
  void *v17;
  float v18;
  void *v19;
  void *v20;
  float v21;
  float v22;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)TIGaussianErrorGenerator;
  v5 = -[TIErrorGenerator initWithAttributes:](&v24, sel_initWithAttributes_, v4);
  v6 = v5;
  if (v5)
  {
    v5->_perTouchStdevX = 0.0;
    v5->_perTouchStdevY = 0.0;
    v5->_globalStdevX = 0.0;
    v5->_globalStdevY = 0.0;
    objc_msgSend(v4, "valueForKey:", CFSTR("GAUSSIAN_ERROR_STDDEV_X"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("GAUSSIAN_ERROR_STDDEV_X"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "floatValue");
      v6->_perTouchStdevX = v9;

    }
    objc_msgSend(v4, "valueForKey:", CFSTR("GAUSSIAN_ERROR_STDDEV_Y"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("GAUSSIAN_ERROR_STDDEV_Y"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "floatValue");
      v6->_perTouchStdevY = v12;

    }
    objc_msgSend(v4, "valueForKey:", CFSTR("SKEW_STDDEV_X"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v4, "valueForKey:", CFSTR("SKEW_STDDEV_X"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "floatValue");
      v6->_globalStdevX = v15;

    }
    objc_msgSend(v4, "valueForKey:", CFSTR("SKEW_STDDEV_Y"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v4, "valueForKey:", CFSTR("SKEW_STDDEV_Y"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "floatValue");
      v6->_globalStdevY = v18;

    }
    objc_msgSend(v4, "valueForKey:", CFSTR("SCALE_ERROR_UNITS_TO_POINTS"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v4, "valueForKey:", CFSTR("SCALE_ERROR_UNITS_TO_POINTS"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "floatValue");
      v22 = v21;

    }
    else
    {
      v22 = 6.4173;
    }
    v6->_perTouchStdevX = v22 * v6->_perTouchStdevX;
    v6->_perTouchStdevY = v22 * v6->_perTouchStdevY;
    v6->_globalStdevX = v22 * v6->_globalStdevX;
    v6->_globalStdevY = v22 * v6->_globalStdevY;
  }
  -[TIGaussianErrorGenerator reset](v6, "reset");

  return v6;
}

- (CGPoint)randomPointWithStandardDeviationX:(float)a3 Y:(float)a4
{
  double v7;
  float v8;
  double v9;
  float v10;
  float v11;
  float v12;
  double v13;
  double v14;
  CGPoint result;

  do
  {
    -[TIErrorGenerator uniformRandomNumber](self, "uniformRandomNumber");
    v8 = v7 * 2.0 + -1.0;
    -[TIErrorGenerator uniformRandomNumber](self, "uniformRandomNumber");
    v10 = v9 * 2.0 + -1.0;
    v11 = (float)(v10 * v10) + (float)(v8 * v8);
  }
  while (v11 > 1.0);
  v12 = sqrtf((float)(logf((float)(v10 * v10) + (float)(v8 * v8)) * -2.0) / v11);
  v13 = (float)((float)(v12 * v8) * a3);
  v14 = (float)((float)(v12 * v10) * a4);
  result.y = v14;
  result.x = v13;
  return result;
}

- (CGPoint)randomPointInDistribution
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGPoint result;

  *(float *)&v2 = self->_perTouchStdevX;
  *(float *)&v3 = self->_perTouchStdevY;
  -[TIGaussianErrorGenerator randomPointWithStandardDeviationX:Y:](self, "randomPointWithStandardDeviationX:Y:", v2, v3);
  result.y = v5;
  result.x = v4;
  return result;
}

- (void)updateGlobalBias
{
  double v2;
  double v3;
  double v5;
  double v6;
  double x;
  double y;
  double v9;
  double v10;
  float globalStdevX;
  float v12;
  float v13;
  double v14;
  float globalStdevY;
  float v16;
  double v17;

  *(float *)&v2 = self->_globalStdevX;
  *(float *)&v3 = self->_globalStdevY;
  if (*(float *)&v2 != 0.0 || *(float *)&v3 != 0.0)
  {
    *(float *)&v2 = *(float *)&v2 * 0.2;
    *(float *)&v3 = *(float *)&v3 * 0.2;
    -[TIGaussianErrorGenerator randomPointWithStandardDeviationX:Y:](self, "randomPointWithStandardDeviationX:Y:", v2, v3);
    v6 = v5;
    x = self->_globalBias.x;
    y = self->_globalBias.y;
    v10 = v9 + x;
    globalStdevX = self->_globalStdevX;
    v12 = 1.0;
    if (globalStdevX > 0.0)
    {
      v13 = (x * x - v10 * v10) / (float)(globalStdevX * (float)(globalStdevX + globalStdevX));
      v12 = expf(v13);
    }
    v14 = v6 + y;
    globalStdevY = self->_globalStdevY;
    if (globalStdevY > 0.0)
    {
      v16 = (y * y - v14 * v14) / (float)(globalStdevY * (float)(globalStdevY + globalStdevY));
      v12 = v12 * expf(v16);
    }
    if (v12 > 1.0)
      v12 = 1.0;
    -[TIErrorGenerator uniformRandomNumber](self, "uniformRandomNumber");
    *(float *)&v17 = v17;
    if (v12 > *(float *)&v17)
    {
      self->_globalBias.x = v10;
      self->_globalBias.y = v14;
    }
  }
}

- (CGPoint)randomTargetForSpaceBarRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  objc_super v17;
  CGPoint result;
  CGRect v19;
  CGRect v20;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v17.receiver = self;
  v17.super_class = (Class)TIGaussianErrorGenerator;
  -[TIErrorGenerator persistentBiasForSpaceBarRect:](&v17, sel_persistentBiasForSpaceBarRect_);
  v9 = v8;
  v11 = v10;
  if (-[TIErrorGenerator spaceHorizontalErrorMode](self, "spaceHorizontalErrorMode") == 1)
  {
    v19.origin.x = x;
    v19.origin.y = y;
    v19.size.width = width;
    v19.size.height = height;
    v12 = CGRectGetHeight(v19);
    v20.origin.x = x;
    v20.origin.y = y;
    v20.size.width = width;
    v20.size.height = height;
    v13 = CGRectGetWidth(v20) - v12;
    -[TIErrorGenerator uniformRandomNumber](self, "uniformRandomNumber");
    v9 = v9 + v13 * -0.5 + v14 * v13;
  }
  v15 = v9;
  v16 = v11;
  result.y = v16;
  result.x = v15;
  return result;
}

- (CGPoint)globalBias
{
  CGFloat x;
  CGFloat y;
  double v4;
  double v5;
  CGPoint result;

  x = self->_globalBias.x;
  y = self->_globalBias.y;
  -[TIGaussianErrorGenerator updateGlobalBias](self, "updateGlobalBias");
  v4 = x;
  v5 = y;
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGPoint)randomErrorForKeyString:(id)a3 rect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGPoint result;
  CGRect v22;
  CGRect v23;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  *(float *)&v10 = self->_perTouchStdevX;
  *(float *)&v11 = self->_perTouchStdevY;
  -[TIGaussianErrorGenerator randomPointWithStandardDeviationX:Y:](self, "randomPointWithStandardDeviationX:Y:", v10, v11);
  v13 = v12;
  v15 = v14;
  if (objc_msgSend(v9, "isEqualToString:", CFSTR(" "))
    && -[TIErrorGenerator spaceHorizontalErrorMode](self, "spaceHorizontalErrorMode") == 1)
  {
    v22.origin.x = x;
    v22.origin.y = y;
    v22.size.width = width;
    v22.size.height = height;
    v16 = CGRectGetHeight(v22);
    v23.origin.x = x;
    v23.origin.y = y;
    v23.size.width = width;
    v23.size.height = height;
    v17 = CGRectGetWidth(v23);
    -[TIErrorGenerator uniformRandomNumber](self, "uniformRandomNumber");
    v13 = v13 + (v17 - v16) * -0.5 + v18 * (v17 - v16);
  }

  v19 = v13;
  v20 = v15;
  result.y = v20;
  result.x = v19;
  return result;
}

- (void)reset
{
  double v3;
  double v4;
  CGFloat v5;
  CGFloat v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TIGaussianErrorGenerator;
  -[TIErrorGenerator reset](&v7, sel_reset);
  *(float *)&v3 = self->_globalStdevX;
  *(float *)&v4 = self->_globalStdevY;
  -[TIGaussianErrorGenerator randomPointWithStandardDeviationX:Y:](self, "randomPointWithStandardDeviationX:Y:", v3, v4);
  self->_globalBias.x = v5;
  self->_globalBias.y = v6;
}

@end
