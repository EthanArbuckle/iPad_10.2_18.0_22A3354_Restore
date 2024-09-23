@implementation TCMPSRandomPadAugmenter

- (TCMPSRandomPadAugmenter)init
{
  TCMPSRandomPadAugmenter *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TCMPSRandomPadAugmenter;
  result = -[TCMPSRandomPadAugmenter init](&v3, sel_init);
  if (result)
  {
    *(_OWORD *)&result->_skipProbability = xmmword_2186F3480;
    *(_OWORD *)&result->_maxAspectRatio = xmmword_2186F34B0;
    result->_maxAreaFraction = 2.0;
    result->_maxAttempts = 50;
  }
  return result;
}

- (id)imageAugmentedFromImage:(id)a3 generator:(id)a4
{
  id v6;
  double (**v7)(double, double);
  double v8;
  double v9;
  double v10;
  double Height;
  double Width;
  unint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  CGRect v38;
  CGRect v39;

  v6 = a3;
  v7 = (double (**)(double, double))a4;
  v8 = 1.0;
  v9 = v7[2](0.0, 1.0);
  -[TCMPSRandomPadAugmenter skipProbability](self, "skipProbability");
  if (v9 < v10)
    goto LABEL_14;
  objc_msgSend(v6, "bounds");
  Height = CGRectGetHeight(v38);
  objc_msgSend(v6, "bounds");
  Width = CGRectGetWidth(v39);
  if (-[TCMPSRandomPadAugmenter maxAttempts](self, "maxAttempts"))
  {
    v13 = 0;
    do
    {
      -[TCMPSRandomPadAugmenter minAspectRatio](self, "minAspectRatio");
      v15 = v14;
      -[TCMPSRandomPadAugmenter maxAspectRatio](self, "maxAspectRatio");
      v8 = ((double (*)(double (**)(double, double), double, double))v7[2])(v7, v15, v16);
      if (Height >= Width / v8)
        v17 = Height;
      else
        v17 = Width / v8;
      -[TCMPSRandomPadAugmenter minAreaFraction](self, "minAreaFraction");
      *(float *)&v18 = Width * (Height * v18) / v8;
      v19 = sqrtf(*(float *)&v18);
      if (v17 < v19)
        v17 = v19;
      -[TCMPSRandomPadAugmenter maxAreaFraction](self, "maxAreaFraction");
      *(float *)&v20 = Height * Width * v20 / v8;
      v21 = sqrtf(*(float *)&v20);
      if (v17 < v21)
        break;
      ++v13;
    }
    while (v13 < -[TCMPSRandomPadAugmenter maxAttempts](self, "maxAttempts"));
  }
  else
  {
    v21 = Height;
    v17 = Height;
  }
  if (v17 <= v21)
  {
    v23 = ((double (*)(double (**)(double, double), double, double))v7[2])(v7, v17, v21);
    v24 = v8 * v23;
    v25 = ((double (*)(double (**)(double, double), double, double))v7[2])(v7, 0.0, v24 - Width);
    v26 = ((double (*)(double (**)(double, double), double, double))v7[2])(v7, 0.0, v23 - Height);
    objc_msgSend(MEMORY[0x24BDBF638], "colorWithRed:green:blue:", 0.5, 0.5, 0.5);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBF660], "imageWithColor:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "image");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    objc_msgSend(v29, "imageByCroppingToRect:");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v30, "imageByCompositingOverImage:", v28);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v33 = v32 - v25;
    objc_msgSend(v6, "bounds");
    v35 = v34 - v26;
    v22 = (id)objc_opt_new();
    objc_msgSend(v22, "setImage:", v31);
    objc_msgSend(v22, "setBounds:", v33, v35, v24, v23);
    objc_msgSend(v6, "annotations");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setAnnotations:", v36);

  }
  else
  {
LABEL_14:
    v22 = v6;
  }

  return v22;
}

- (double)skipProbability
{
  return self->_skipProbability;
}

- (void)setSkipProbability:(double)a3
{
  self->_skipProbability = a3;
}

- (double)minAspectRatio
{
  return self->_minAspectRatio;
}

- (void)setMinAspectRatio:(double)a3
{
  self->_minAspectRatio = a3;
}

- (double)maxAspectRatio
{
  return self->_maxAspectRatio;
}

- (void)setMaxAspectRatio:(double)a3
{
  self->_maxAspectRatio = a3;
}

- (double)minAreaFraction
{
  return self->_minAreaFraction;
}

- (void)setMinAreaFraction:(double)a3
{
  self->_minAreaFraction = a3;
}

- (double)maxAreaFraction
{
  return self->_maxAreaFraction;
}

- (void)setMaxAreaFraction:(double)a3
{
  self->_maxAreaFraction = a3;
}

- (unint64_t)maxAttempts
{
  return self->_maxAttempts;
}

- (void)setMaxAttempts:(unint64_t)a3
{
  self->_maxAttempts = a3;
}

@end
