@implementation BKDisplayRenderOverlaySpinny

- (BKDisplayRenderOverlaySpinny)initWithOverlayDescriptor:(id)a3 level:(float)a4
{
  BKDisplayRenderOverlaySpinny *v4;
  BKDisplayRenderOverlaySpinny *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKDisplayRenderOverlaySpinny;
  v4 = -[BKDisplayBootUIRenderOverlay initWithOverlayDescriptor:level:](&v7, "initWithOverlayDescriptor:level:", a3);
  v5 = v4;
  if (v4)
  {
    -[BKDisplayRenderOverlay _setType:](v4, "_setType:", 2);
    v5->_background = 0;
  }
  return v5;
}

- (void)_startAnimating
{
  CAKeyframeAnimation *v3;
  void *v4;
  void *v5;
  void *v6;
  CAKeyframeAnimation *animation;

  v3 = (CAKeyframeAnimation *)objc_alloc_init((Class)CAKeyframeAnimation);
  -[CAKeyframeAnimation setKeyPath:](v3, "setKeyPath:", CFSTR("contents"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayRenderOverlaySpinny _spinnyImageSequence](self, "_spinnyImageSequence"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allImages"));
  -[CAKeyframeAnimation setValues:](v3, "setValues:", v5);

  -[CAKeyframeAnimation setCalculationMode:](v3, "setCalculationMode:", kCAAnimationDiscrete);
  -[CAKeyframeAnimation setRepeatCount:](v3, "setRepeatCount:", 3.53369517e72);
  -[CAKeyframeAnimation setDuration:](v3, "setDuration:", 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayBootUIRenderOverlay contentLayer](self, "contentLayer"));
  objc_msgSend(v6, "addAnimation:forKey:", v3, CFSTR("contents"));

  animation = self->_animation;
  self->_animation = v3;

}

- (id)_prepareContentLayerForPresentation:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  CGImage *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double Width;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayRenderOverlay display](self, "display", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uniqueId"));

  sub_100035738(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayRenderOverlaySpinny _spinnyImageSequence](self, "_spinnyImageSequence"));
  v7 = (CGImage *)objc_msgSend(v6, "imageAtIndex:", 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
  -[BKDisplayBootUIRenderOverlay _bounds](self, "_bounds");
  v10 = v9 * 0.5;
  v12 = v11 * 0.5;
  Width = (double)CGImageGetWidth(v7);
  objc_msgSend(v8, "setBounds:", 0.0, 0.0, Width, (double)CGImageGetHeight(v7));
  objc_msgSend(v8, "setPosition:", v10, v12);
  objc_msgSend(v8, "setContents:", v7);

  return v8;
}

- (void)_cleanUpContentLayer
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayBootUIRenderOverlay contentLayer](self, "contentLayer"));
  objc_msgSend(v3, "removeAllAnimations");

  -[BKDisplayRenderOverlaySpinny _unloadSpinnyImageSequence](self, "_unloadSpinnyImageSequence");
}

- (void)_setScale:(double)a3
{
  CAKeyframeAnimation *animation;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKDisplayRenderOverlaySpinny;
  -[BKDisplayRenderOverlay _setScale:](&v7, "_setScale:", a3);
  -[BKDisplayRenderOverlaySpinny _unloadSpinnyImageSequence](self, "_unloadSpinnyImageSequence");
  animation = self->_animation;
  if (animation)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayRenderOverlaySpinny _spinnyImageSequence](self, "_spinnyImageSequence"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allImages"));
    -[CAKeyframeAnimation setValues:](animation, "setValues:", v6);

  }
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BKDisplayRenderOverlaySpinny;
  v4 = -[BKDisplayBootUIRenderOverlay descriptionBuilderWithMultilinePrefix:](&v8, "descriptionBuilderWithMultilinePrefix:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = objc_msgSend(v5, "appendUnsignedInteger:withName:", self->_background, CFSTR("_background"));
  return v5;
}

- (id)_spinnyImageSequence
{
  BKImageSequence *imageSequence;
  id v4;
  NSObject *v5;
  uint64_t v6;
  NSBundle *v7;
  void *v8;
  void *v9;
  BKImageSequence *v10;
  BKImageSequence *v11;
  BKImageSequence *v12;
  int v14;
  BKDisplayRenderOverlaySpinny *v15;

  imageSequence = self->_imageSequence;
  if (!imageSequence)
  {
    v4 = sub_1000597D0();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v14 = 134217984;
      v15 = self;
      _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%p load spinny", (uint8_t *)&v14, 0xCu);
    }

    v7 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(BKSDisplayRenderOverlay, v6));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayRenderOverlaySpinny _assetPrefix](self, "_assetPrefix"));
    v10 = [BKImageSequence alloc];
    -[BKDisplayRenderOverlay _scale](self, "_scale");
    v11 = -[BKImageSequence initWithBasename:bundle:imageCount:scale:](v10, "initWithBasename:bundle:imageCount:scale:", v9, v8, 24);
    v12 = self->_imageSequence;
    self->_imageSequence = v11;

    imageSequence = self->_imageSequence;
  }
  return imageSequence;
}

- (void)_unloadSpinnyImageSequence
{
  id v3;
  NSObject *v4;
  BKImageSequence *imageSequence;
  int v6;
  BKDisplayRenderOverlaySpinny *v7;

  v3 = sub_1000597D0();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v6 = 134217984;
    v7 = self;
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%p unload spinny", (uint8_t *)&v6, 0xCu);
  }

  imageSequence = self->_imageSequence;
  self->_imageSequence = 0;

}

- (BOOL)_useLightBackground
{
  unint64_t background;
  objc_super v5;

  background = self->_background;
  if (!background)
  {
    v5.receiver = self;
    v5.super_class = (Class)BKDisplayRenderOverlaySpinny;
    if (-[BKDisplayBootUIRenderOverlay _useLightBackground](&v5, "_useLightBackground"))
      return 1;
    background = self->_background;
  }
  return background == 2;
}

- (id)_assetPrefix
{
  return CFSTR("gear");
}

- (unint64_t)background
{
  return self->_background;
}

- (void)setBackground:(unint64_t)a3
{
  self->_background = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animation, 0);
  objc_storeStrong((id *)&self->_imageSequence, 0);
}

+ (id)overlayWithLevel:(float)a3 display:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  id v12;
  BKDisplayRenderOverlaySpinny *v13;
  double v14;
  BKDisplayRenderOverlaySpinny *v15;

  v6 = a4;
  v7 = objc_alloc((Class)BKSDisplayRenderOverlayDescriptor);
  v9 = (objc_class *)objc_opt_class(a1, v8);
  v10 = NSStringFromClass(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = objc_msgSend(v7, "initWithName:display:", v11, v6);

  objc_msgSend(v12, "setLockBacklight:", 0);
  v13 = [BKDisplayRenderOverlaySpinny alloc];
  *(float *)&v14 = a3;
  v15 = -[BKDisplayRenderOverlaySpinny initWithOverlayDescriptor:level:](v13, "initWithOverlayDescriptor:level:", v12, v14);

  return v15;
}

@end
