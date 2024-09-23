@implementation BKFlowingBookFontSizeConfiguration

- (BKFlowingBookFontSizeConfiguration)initWithViewController:(id)a3 configurationEnvironment:(id)a4
{
  BKFlowingBookFontSizeConfiguration *v4;
  BKFlowingBookFontSizeConfiguration *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKFlowingBookFontSizeConfiguration;
  v4 = -[BKFlowingBookFontSizeConfiguration initWithViewController:configurationEnvironment:](&v7, "initWithViewController:configurationEnvironment:", a3, a4);
  v5 = v4;
  if (v4)
    -[BKFlowingBookFontSizeConfiguration viewSizeChanged](v4, "viewSizeChanged");
  return v5;
}

- (void)_reloadFontSizes
{
  void *v3;
  float64x2_t *sizes;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  __int128 v10;
  double v11;
  id v12;
  double v13;
  double v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  self->_useOldFontStepsAndSpacing = objc_msgSend(v3, "BOOLForKey:", CFSTR("BKUseOldFontStepsAndSpacing"));

  self->_largeSizeFactor = 1.0;
  sizes = (float64x2_t *)self->_sizes;
  *(_OWORD *)self->_sizes = xmmword_173210;
  self->_sizes[2] = 1.0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKFlowingBookFontSizeConfiguration environment](self, "environment"));
  objc_msgSend(v5, "size");
  v7 = v6;
  v9 = v8;

  if (v7 >= kIMConfigurationSize_superPhone)
  {
    if (v7 <= kIMConfigurationSize_proMaxPhone)
    {
      *sizes = (float64x2_t)xmmword_173220;
      v11 = 2.2;
    }
    else
    {
      if (v7 >= 1366.0)
        v10 = xmmword_173230;
      else
        v10 = xmmword_173240;
      *sizes = (float64x2_t)v10;
      v11 = 4.0;
    }
    self->_sizes[2] = v11;
  }
  else
  {
    *sizes = (float64x2_t)xmmword_173220;
  }
  objc_opt_class(self);
  objc_msgSend(v12, "fontSizeFactorForViewportSize:useOldFontStepsAndSpacing:", self->_useOldFontStepsAndSpacing, v7, v9);
  *sizes = vmulq_n_f64(*sizes, v13);
  self->_sizes[2] = v13 * self->_sizes[2];
  -[BKFlowingBookFontSizeConfiguration largeSizeFactor](self, "largeSizeFactor");
  self->_sizes[2] = v14 * self->_sizes[2];
}

- (void)viewSizeChanged
{
  -[BKFlowingBookFontSizeConfiguration _reloadFontSizes](self, "_reloadFontSizes");
}

+ (double)fontSizeFactorForViewportSize:(CGSize)a3 useOldFontStepsAndSpacing:(BOOL)a4
{
  double v4;

  if (a4)
  {
    v4 = 1.0;
    if (a3.width >= 1366.0)
      return 1.13;
  }
  else if (a3.width >= 375.0)
  {
    v4 = 1.0;
    if (a3.width >= 768.0)
      return dbl_173250[a3.width < 1024.0];
  }
  else
  {
    return 0.96;
  }
  return v4;
}

- (double)smallSize
{
  return self->_sizes[0];
}

- (double)mediumSize
{
  return self->_sizes[1];
}

- (double)largeSize
{
  return self->_sizes[2];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  double v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKFlowingBookFontSizeConfiguration;
  v4 = -[BKFlowingBookFontSizeConfiguration copyWithZone:](&v7, "copyWithZone:", a3);
  if (v4)
  {
    -[BKFlowingBookFontSizeConfiguration largeSizeFactor](self, "largeSizeFactor");
    objc_msgSend(v4, "setLargeSizeFactor:");
    v5 = self->_sizes[2];
    *((_OWORD *)v4 + 1) = *(_OWORD *)self->_sizes;
    *((double *)v4 + 4) = v5;
  }
  return v4;
}

- (BOOL)isEqualToFlowingBookFontSizeConfiguration:(id)a3
{
  _QWORD *v4;
  double v5;
  double v6;
  double v7;
  BOOL v10;

  v4 = a3;
  -[BKFlowingBookFontSizeConfiguration largeSizeFactor](self, "largeSizeFactor");
  v6 = v5;
  objc_msgSend(v4, "largeSizeFactor");
  v10 = v6 == v7
     && *(_QWORD *)&self->_sizes[0] == v4[2]
     && *(_QWORD *)&self->_sizes[1] == v4[3]
     && *(_QWORD *)&self->_sizes[2] == v4[4];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  BKFlowingBookFontSizeConfiguration *v4;
  uint64_t v5;
  BOOL v6;

  v4 = (BKFlowingBookFontSizeConfiguration *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class(BKFlowingBookFontSizeConfiguration);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
      v6 = -[BKFlowingBookFontSizeConfiguration isEqualToFlowingBookFontSizeConfiguration:](self, "isEqualToFlowingBookFontSizeConfiguration:", v4);
    else
      v6 = 0;
  }

  return v6;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BKFlowingBookFontSizeConfiguration;
  v3 = -[BKFlowingBookFontSizeConfiguration description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  -[BKFlowingBookFontSizeConfiguration largeSizeFactor](self, "largeSizeFactor");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@\nBKFlowingBookFontSizeConfiguration: largeSizeFactor:%@"), v4, v5));

  return v6;
}

- (double)largeSizeFactor
{
  return self->_largeSizeFactor;
}

- (void)setLargeSizeFactor:(double)a3
{
  self->_largeSizeFactor = a3;
}

@end
