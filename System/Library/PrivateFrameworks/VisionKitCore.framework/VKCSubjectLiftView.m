@implementation VKCSubjectLiftView

- (void)setShadowsVisible:(BOOL)a3
{
  float v4;
  void *v5;
  double v6;
  float v7;
  double v8;
  id v9;

  if (self->_shadowsVisible != a3)
  {
    self->_shadowsVisible = a3;
    if (a3)
      v4 = 0.2;
    else
      v4 = 0.0;
    -[VKCSubjectLiftView diffuseShadowLayer](self, "diffuseShadowLayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v6 = v4;
    objc_msgSend(v5, "setShadowOpacity:", v6);

    if (self->_shadowsVisible)
      v7 = 0.1;
    else
      v7 = 0.0;
    -[VKCSubjectLiftView rimShadowLayer](self, "rimShadowLayer");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    *(float *)&v8 = v7;
    objc_msgSend(v9, "setShadowOpacity:", v8);

  }
}

- (CALayer)diffuseShadowLayer
{
  return (CALayer *)objc_loadWeakRetained((id *)&self->_diffuseShadowLayer);
}

- (void)setDiffuseShadowLayer:(id)a3
{
  objc_storeWeak((id *)&self->_diffuseShadowLayer, a3);
}

- (CALayer)rimShadowLayer
{
  return (CALayer *)objc_loadWeakRetained((id *)&self->_rimShadowLayer);
}

- (void)setRimShadowLayer:(id)a3
{
  objc_storeWeak((id *)&self->_rimShadowLayer, a3);
}

- (BOOL)shadowsVisible
{
  return self->_shadowsVisible;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_rimShadowLayer);
  objc_destroyWeak((id *)&self->_diffuseShadowLayer);
}

@end
