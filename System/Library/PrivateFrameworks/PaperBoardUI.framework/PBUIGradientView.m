@implementation PBUIGradientView

+ (Class)layerClass
{
  return (Class)objc_opt_self();
}

- (void)setGradient:(id)a3
{
  void *v5;
  PBUIWallpaperGradient *v6;

  v6 = (PBUIWallpaperGradient *)a3;
  if (self->_gradient != v6)
  {
    objc_storeStrong((id *)&self->_gradient, a3);
    -[PBUIGradientView layer](self, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBUIWallpaperGradient configureLayer:](v6, "configureLayer:", v5);

  }
}

- (PBUIWallpaperGradient)gradient
{
  return self->_gradient;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradient, 0);
}

@end
