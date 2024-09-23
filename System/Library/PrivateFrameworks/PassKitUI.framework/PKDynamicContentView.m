@implementation PKDynamicContentView

- (PKDynamicContentView)initWithImage:(id)a3 emitterImage:(id)a4 dynamicLayerEmitterConfiguration:(id)a5
{
  unint64_t v8;
  unint64_t v9;
  id v10;
  PKDynamicContentView *v11;
  id *p_isa;
  uint64_t v13;
  id v14;
  PKDynamicContentView *v15;
  objc_super v17;

  v8 = (unint64_t)a3;
  v9 = (unint64_t)a4;
  v10 = a5;
  if (v8 | v9)
  {
    v17.receiver = self;
    v17.super_class = (Class)PKDynamicContentView;
    v11 = -[PKDynamicContentView init](&v17, sel_init);
    p_isa = (id *)&v11->super.super.super.isa;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_dynamicLayerEmitterConfiguration, a5);
      if (v8)
      {
        v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v8);
        v14 = p_isa[52];
        p_isa[52] = (id)v13;

        objc_msgSend(p_isa[52], "setContentMode:", 1);
        objc_msgSend(p_isa, "addSubview:", p_isa[52]);
      }
      objc_msgSend(p_isa, "_configureEmitterLayerWithImage:", v9);
    }
    self = p_isa;
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)dealloc
{
  objc_super v3;

  -[PKDynamicContentView invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PKDynamicContentView;
  -[PKDynamicContentView dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  UIImageView *imageView;
  CAEmitterLayer *emitterLayer;

  -[UIImageView removeFromSuperview](self->_imageView, "removeFromSuperview");
  -[CAEmitterLayer removeAllAnimations](self->_emitterLayer, "removeAllAnimations");
  -[CAEmitterLayer removeFromSuperlayer](self->_emitterLayer, "removeFromSuperlayer");
  imageView = self->_imageView;
  self->_imageView = 0;

  emitterLayer = self->_emitterLayer;
  self->_emitterLayer = 0;

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  UIImageView *imageView;
  CAEmitterLayer *emitterLayer;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PKDynamicContentView;
  -[PKDynamicContentView layoutSubviews](&v14, sel_layoutSubviews);
  -[PKDynamicContentView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIImageView image](self->_imageView, "image");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "size");

  PKSizeAspectFit();
  imageView = self->_imageView;
  PKSizeAlignedInRect();
  -[UIImageView setFrame:](imageView, "setFrame:");
  emitterLayer = self->_emitterLayer;
  if (emitterLayer)
  {
    -[CAEmitterLayer setBounds:](emitterLayer, "setBounds:", v4, v6, v8, v10);
    -[CAEmitterLayer setPosition:](self->_emitterLayer, "setPosition:", v8 * 0.5, v10 * 0.5);
    -[PKDynamicLayerEmitterConfiguration configureEmitterLayer:withBounds:](self->_dynamicLayerEmitterConfiguration, "configureEmitterLayer:withBounds:", self->_emitterLayer, v4, v6, v8, v10);
  }
}

- (void)_configureEmitterLayerWithImage:(id)a3
{
  void *v4;
  id v5;
  CAEmitterLayer *v6;
  CAEmitterLayer *emitterLayer;
  PKDynamicLayerEmitterConfiguration *dynamicLayerEmitterConfiguration;
  CAEmitterLayer *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;

  if (a3)
  {
    if (self->_dynamicLayerEmitterConfiguration)
    {
      v4 = (void *)MEMORY[0x1E0CD2770];
      v5 = a3;
      objc_msgSend(v4, "layer");
      v6 = (CAEmitterLayer *)objc_claimAutoreleasedReturnValue();
      emitterLayer = self->_emitterLayer;
      self->_emitterLayer = v6;

      dynamicLayerEmitterConfiguration = self->_dynamicLayerEmitterConfiguration;
      v9 = self->_emitterLayer;
      v10 = objc_retainAutorelease(v5);
      v11 = objc_msgSend(v10, "CGImage");

      -[PKDynamicLayerEmitterConfiguration configureEmitterLayer:withImage:](dynamicLayerEmitterConfiguration, "configureEmitterLayer:withImage:", v9, v11);
      -[PKDynamicContentView layer](self, "layer");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      -[UIImageView layer](self->_imageView, "layer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "insertSublayer:below:", self->_emitterLayer, v12);

    }
  }
}

- (void)setPaused:(BOOL)a3
{
  if (((!self->_paused ^ a3) & 1) == 0)
  {
    self->_paused = a3;
    if (a3)
      -[PKDynamicContentView _pauseEmitters](self, "_pauseEmitters");
    else
      -[PKDynamicContentView _startEmitters](self, "_startEmitters");
  }
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (void)_startEmitters
{
  PKDynamicLayerEmitterConfiguration *dynamicLayerEmitterConfiguration;
  CAEmitterLayer *emitterLayer;
  double v5;
  double v6;
  double v7;

  dynamicLayerEmitterConfiguration = self->_dynamicLayerEmitterConfiguration;
  emitterLayer = self->_emitterLayer;
  if ((unint64_t)dynamicLayerEmitterConfiguration | (unint64_t)emitterLayer)
  {
    -[CAEmitterLayer timeOffset](emitterLayer, "timeOffset");
    v6 = v5;
    LODWORD(v5) = 1.0;
    -[CAEmitterLayer setSpeed:](self->_emitterLayer, "setSpeed:", v5);
    -[CAEmitterLayer setTimeOffset:](self->_emitterLayer, "setTimeOffset:", 0.0);
    -[CAEmitterLayer setBeginTime:](self->_emitterLayer, "setBeginTime:", 0.0);
    -[CAEmitterLayer convertTime:fromLayer:](self->_emitterLayer, "convertTime:fromLayer:", 0, CACurrentMediaTime());
    -[CAEmitterLayer setBeginTime:](self->_emitterLayer, "setBeginTime:", v7 - v6);
  }
}

- (void)_pauseEmitters
{
  double v3;
  double v4;

  if (*(_OWORD *)&self->_dynamicLayerEmitterConfiguration != 0)
  {
    -[CAEmitterLayer convertTime:fromLayer:](self->_emitterLayer, "convertTime:fromLayer:", 0, CACurrentMediaTime());
    v4 = v3;
    LODWORD(v3) = 0;
    -[CAEmitterLayer setSpeed:](self->_emitterLayer, "setSpeed:", v3);
    -[CAEmitterLayer setTimeOffset:](self->_emitterLayer, "setTimeOffset:", v4);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emitterLayer, 0);
  objc_storeStrong((id *)&self->_dynamicLayerEmitterConfiguration, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
