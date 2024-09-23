@implementation SOSUIAnimatingSpriteImageView

- (SOSUIAnimatingSpriteImageView)initWithFrame:(CGRect)a3
{
  SOSUIAnimatingSpriteImageView *v3;
  SOSUIAnimatingSpriteImageView *v4;
  CALayer *v5;
  CALayer *imageLayer;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SOSUIAnimatingSpriteImageView;
  v3 = -[SOSUIAnimatingSpriteImageView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SOSUIAnimatingSpriteImageView setClipsToBounds:](v3, "setClipsToBounds:", 1);
    v4->_framesPerSecond = 60;
    v5 = (CALayer *)objc_alloc_init(MEMORY[0x24BDE56D0]);
    imageLayer = v4->_imageLayer;
    v4->_imageLayer = v5;

    -[SOSUIAnimatingSpriteImageView layer](v4, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSublayer:", v4->_imageLayer);

  }
  return v4;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v3 = *MEMORY[0x24BDBF090];
  v4 = *(double *)(MEMORY[0x24BDBF090] + 8);
  -[UIImage size](self->_spriteImage, "size");
  v6 = v5;
  v8 = v7;
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  -[CALayer setFrame:](self->_imageLayer, "setFrame:", v3, v4, v6, v8);
  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

- (CGSize)_spriteFrameSize
{
  UIImage *spriteImage;
  int64_t spriteFrameCount;
  int64_t spriteColumnCount;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  spriteImage = self->_spriteImage;
  if (spriteImage)
  {
    spriteFrameCount = self->_spriteFrameCount;
    spriteColumnCount = self->_spriteColumnCount;
    if (spriteFrameCount % spriteColumnCount)
      v6 = spriteFrameCount / spriteColumnCount + 1;
    else
      v6 = spriteFrameCount / spriteColumnCount;
    -[UIImage size](spriteImage, "size");
    v8 = v7 / (double)self->_spriteColumnCount;
    -[UIImage size](self->_spriteImage, "size");
    v10 = v9 / (double)v6;
  }
  else
  {
    v8 = *MEMORY[0x24BDBF148];
    v10 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }
  v11 = v8;
  result.height = v10;
  result.width = v11;
  return result;
}

- (void)setSpriteImage:(id)a3
{
  id v4;
  void *v5;
  UIImage *v6;
  UIImage *spriteImage;

  v4 = a3;
  -[SOSUIAnimatingSpriteImageView stopAnimatingFinishingCycle:](self, "stopAnimatingFinishingCycle:", 0);
  -[SOSUIAnimatingSpriteImageView tintColor](self, "tintColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageWithTintColor:renderingMode:", v5, 2);
  v6 = (UIImage *)objc_claimAutoreleasedReturnValue();

  spriteImage = self->_spriteImage;
  self->_spriteImage = v6;

  -[CALayer setContents:](self->_imageLayer, "setContents:", -[UIImage CGImage](self->_spriteImage, "CGImage"));
  -[SOSUIAnimatingSpriteImageView updateLayerWithTintColor](self, "updateLayerWithTintColor");
  -[SOSUIAnimatingSpriteImageView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setTintColor:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SOSUIAnimatingSpriteImageView;
  -[SOSUIAnimatingSpriteImageView setTintColor:](&v4, sel_setTintColor_, a3);
  if (self->_spriteImage)
    -[SOSUIAnimatingSpriteImageView setSpriteImage:](self, "setSpriteImage:");
}

- (void)updateLayerWithTintColor
{
  CALayer *imageLayer;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  imageLayer = self->_imageLayer;
  -[SOSUIAnimatingSpriteImageView layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMask:", imageLayer);

  -[SOSUIAnimatingSpriteImageView tintColor](self, "tintColor");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = objc_msgSend(v7, "CGColor");
  -[SOSUIAnimatingSpriteImageView layer](self, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v5);

}

- (id)_centerPointValues
{
  id v3;
  int64_t v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[SOSUIAnimatingSpriteImageView _spriteFrameSize](self, "_spriteFrameSize");
  -[UIImage size](self->_spriteImage, "size");
  if (self->_spriteFrameCount >= 1)
  {
    v4 = 0;
    do
    {
      v5 = (void *)MEMORY[0x24BDD1968];
      UIRectGetCenter();
      objc_msgSend(v5, "valueWithCGPoint:");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v6);

      ++v4;
    }
    while (v4 < self->_spriteFrameCount);
  }
  return v3;
}

- (unint64_t)_findSpriteIndex:(CGPoint)a3 centerPoints:(id)a4
{
  double y;
  double x;
  void *v6;
  id v7;
  void *v8;
  unint64_t v9;

  y = a3.y;
  x = a3.x;
  v6 = (void *)MEMORY[0x24BDD1968];
  v7 = a4;
  objc_msgSend(v6, "valueWithCGPoint:", x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "indexOfObject:", v8);

  return v9;
}

+ (id)_createNewSpriteArray:(id)a3 currentFrame:(unint64_t)a4 arraySize:(unint64_t)a5 interrupted:(BOOL)a6
{
  id v9;
  void *v10;
  id v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;

  v9 = a3;
  v10 = v9;
  if (a5 - 1 == a4)
  {
    v11 = v9;
  }
  else
  {
    v12 = ~a4 + a5;
    v13 = a4 + 1;
    objc_msgSend(v9, "subarrayWithRange:", a4 + 1, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (a6)
    {
      objc_msgSend(v10, "subarrayWithRange:", 0, v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "arrayByAddingObjectsFromArray:", v16);
      v11 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = v14;
    }

  }
  return v11;
}

- (void)startAnimating
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  CALayer *imageLayer;
  void *v14;
  id v15;
  CGRect v16;

  if (self->_spriteImage)
  {
    -[SOSUIAnimatingSpriteImageView frame](self, "frame");
    if (!CGRectIsEmpty(v16))
    {
      if (-[SOSUIAnimatingSpriteImageView isAnimating](self, "isAnimating"))
      {
        -[CALayer presentationLayer](self->_imageLayer, "presentationLayer");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "position");
        v5 = v4;
        v7 = v6;

        -[SOSUIAnimatingSpriteImageView _centerPointValues](self, "_centerPointValues");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[SOSUIAnimatingSpriteImageView _findSpriteIndex:centerPoints:](self, "_findSpriteIndex:centerPoints:", v8, v5, v7);

        -[SOSUIAnimatingSpriteImageView _centerPointValues](self, "_centerPointValues");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "count");

        -[CALayer removeAnimationForKey:](self->_imageLayer, "removeAnimationForKey:", CFSTR("PositionKeyframeAnimation"));
        -[SOSUIAnimatingSpriteImageView _centerPointValues](self, "_centerPointValues");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[SOSUIAnimatingSpriteImageView _createNewSpriteArray:currentFrame:arraySize:interrupted:](SOSUIAnimatingSpriteImageView, "_createNewSpriteArray:currentFrame:arraySize:interrupted:", v12, v9, v11, 1);
        v15 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        -[SOSUIAnimatingSpriteImageView _centerPointValues](self, "_centerPointValues");
        v15 = (id)objc_claimAutoreleasedReturnValue();
      }
      imageLayer = self->_imageLayer;
      _PositionAnimation(v15, (double)self->_spriteFrameCount / (double)self->_framesPerSecond, 3.4028e38);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CALayer addAnimation:forKey:](imageLayer, "addAnimation:forKey:", v14, CFSTR("PositionKeyframeAnimation"));

    }
  }
}

- (void)stopAnimatingFinishingCycle:(BOOL)a3
{
  CALayer *imageLayer;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  CALayer *v16;
  void *v17;
  id v18;

  imageLayer = self->_imageLayer;
  if (a3)
  {
    -[CALayer presentationLayer](imageLayer, "presentationLayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "position");
    v7 = v6;
    v9 = v8;

    -[SOSUIAnimatingSpriteImageView _centerPointValues](self, "_centerPointValues");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[SOSUIAnimatingSpriteImageView _findSpriteIndex:centerPoints:](self, "_findSpriteIndex:centerPoints:", v10, v7, v9);

    -[SOSUIAnimatingSpriteImageView _centerPointValues](self, "_centerPointValues");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    -[CALayer removeAnimationForKey:](self->_imageLayer, "removeAnimationForKey:", CFSTR("PositionKeyframeAnimation"));
    if (v11 != v13 - 1)
    {
      -[SOSUIAnimatingSpriteImageView _centerPointValues](self, "_centerPointValues");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[SOSUIAnimatingSpriteImageView _createNewSpriteArray:currentFrame:arraySize:interrupted:](SOSUIAnimatingSpriteImageView, "_createNewSpriteArray:currentFrame:arraySize:interrupted:", v14, v11, v13, 0);
      v18 = (id)objc_claimAutoreleasedReturnValue();

      v15 = objc_msgSend(v18, "count");
      v16 = self->_imageLayer;
      _PositionAnimation(v18, (double)v15 / (double)self->_framesPerSecond, 0.0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[CALayer addAnimation:forKey:](v16, "addAnimation:forKey:", v17, CFSTR("PositionKeyframeAnimation"));

    }
  }
  else
  {
    -[CALayer removeAnimationForKey:](imageLayer, "removeAnimationForKey:", CFSTR("PositionKeyframeAnimation"));
  }
}

- (BOOL)isAnimating
{
  void *v2;
  BOOL v3;

  -[CALayer animationForKey:](self->_imageLayer, "animationForKey:", CFSTR("PositionKeyframeAnimation"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)animateOnce
{
  CALayer *imageLayer;
  void *v4;
  void *v5;
  id v6;

  if (-[SOSUIAnimatingSpriteImageView isAnimating](self, "isAnimating"))
    -[CALayer removeAnimationForKey:](self->_imageLayer, "removeAnimationForKey:", CFSTR("PositionKeyframeAnimation"));
  -[SOSUIAnimatingSpriteImageView _centerPointValues](self, "_centerPointValues");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  imageLayer = self->_imageLayer;
  _PositionAnimation(v6, (double)self->_spriteFrameCount / (double)self->_framesPerSecond, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALayer addAnimation:forKey:](imageLayer, "addAnimation:forKey:", v4, CFSTR("PositionKeyframeAnimation"));

  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  objc_msgSend(v6, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "CGPointValue");
  -[CALayer setPosition:](self->_imageLayer, "setPosition:");

  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

- (UIImage)spriteImage
{
  return self->_spriteImage;
}

- (int64_t)spriteFrameCount
{
  return self->_spriteFrameCount;
}

- (void)setSpriteFrameCount:(int64_t)a3
{
  self->_spriteFrameCount = a3;
}

- (int64_t)spriteColumnCount
{
  return self->_spriteColumnCount;
}

- (void)setSpriteColumnCount:(int64_t)a3
{
  self->_spriteColumnCount = a3;
}

- (unint64_t)framesPerSecond
{
  return self->_framesPerSecond;
}

- (void)setFramesPerSecond:(unint64_t)a3
{
  self->_framesPerSecond = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spriteImage, 0);
  objc_storeStrong((id *)&self->_imageLayer, 0);
}

@end
