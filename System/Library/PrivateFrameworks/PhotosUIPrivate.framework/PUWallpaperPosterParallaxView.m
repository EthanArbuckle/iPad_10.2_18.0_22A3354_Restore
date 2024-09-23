@implementation PUWallpaperPosterParallaxView

- (PUWallpaperPosterParallaxView)initWithFrame:(CGRect)a3 parallaxHandler:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  PUWallpaperPosterParallaxView *v10;
  uint64_t v11;
  id parallaxHandler;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PUWallpaperPosterParallaxView;
  v10 = -[PUWallpaperPosterParallaxView initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  if (v10)
  {
    v11 = objc_msgSend(v9, "copy");
    parallaxHandler = v10->_parallaxHandler;
    v10->_parallaxHandler = (id)v11;

  }
  return v10;
}

- (void)startParallax
{
  void *v3;
  PUWallpaperPosterMotionEffect *v4;
  id v5;

  -[PUWallpaperPosterParallaxView motionEffect](self, "motionEffect");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(PUWallpaperPosterMotionEffect);
    -[PUWallpaperPosterParallaxView setMotionEffect:](self, "setMotionEffect:", v4);

    -[PUWallpaperPosterParallaxView motionEffect](self, "motionEffect");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[PUWallpaperPosterParallaxView addMotionEffect:](self, "addMotionEffect:", v5);

  }
}

- (void)stopParallax
{
  void *v3;
  void *v4;

  -[PUWallpaperPosterParallaxView motionEffect](self, "motionEffect");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PUWallpaperPosterParallaxView motionEffect](self, "motionEffect");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUWallpaperPosterParallaxView removeMotionEffect:](self, "removeMotionEffect:", v4);

    -[PUWallpaperPosterParallaxView setMotionEffect:](self, "setMotionEffect:", 0);
  }
}

- (BOOL)_applyKeyPathsAndRelativeValues:(id)a3 forMotionEffect:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void (**v11)(double, double);

  v5 = a3;
  -[PUWallpaperPosterParallaxView motionEffect](self, "motionEffect");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "parallaxVectorFromKeyPathsAndRelativeValues:", v5);
  v8 = v7;
  v10 = v9;

  -[PUWallpaperPosterParallaxView parallaxHandler](self, "parallaxHandler");
  v11 = (void (**)(double, double))objc_claimAutoreleasedReturnValue();
  v11[2](v8, v10);

  return 1;
}

- (id)parallaxHandler
{
  return self->_parallaxHandler;
}

- (PUWallpaperPosterMotionEffect)motionEffect
{
  return self->_motionEffect;
}

- (void)setMotionEffect:(id)a3
{
  objc_storeStrong((id *)&self->_motionEffect, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_motionEffect, 0);
  objc_storeStrong(&self->_parallaxHandler, 0);
}

@end
