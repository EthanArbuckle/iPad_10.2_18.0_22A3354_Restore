@implementation _TUILayerContainerClip

- (_TUILayerContainerClip)initWithLayer:(id)a3
{
  id v5;
  _TUILayerContainerClip *v6;
  _TUILayerContainerClip *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_TUILayerContainerClip;
  v6 = -[_TUILayerContainerClip init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_layer, a3);

  return v7;
}

- (void)addAnimation:(id)a3
{
  unint64_t count;

  objc_msgSend(a3, "setDelegate:", self);
  count = self->_count;
  if (!count)
  {
    -[CALayer setMasksToBounds:](self->_layer, "setMasksToBounds:", 1);
    count = self->_count;
  }
  self->_count = count + 1;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  id v5;
  unint64_t count;
  unint64_t v7;
  id v8;

  v5 = a3;
  count = self->_count;
  if (count)
  {
    v7 = count - 1;
    self->_count = v7;
    if (!v7)
    {
      v8 = v5;
      -[CALayer setMasksToBounds:](self->_layer, "setMasksToBounds:", 0);
      v5 = v8;
    }
  }

}

- (unint64_t)count
{
  return self->_count;
}

- (CALayer)layer
{
  return self->_layer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layer, 0);
}

@end
