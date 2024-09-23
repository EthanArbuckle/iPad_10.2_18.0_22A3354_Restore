@implementation SKUIBackgroundImageWrapperForHorizontalLockup

- (SKUIBackgroundImageWrapperForHorizontalLockup)initWithImage:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  SKUIBackgroundImageWrapperForHorizontalLockup *v13;
  SKUIBackgroundImageWrapperForHorizontalLockup *v14;
  objc_super v16;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIBackgroundImageWrapperForHorizontalLockup initWithImage:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v16.receiver = self;
  v16.super_class = (Class)SKUIBackgroundImageWrapperForHorizontalLockup;
  v13 = -[SKUIBackgroundImageWrapperForHorizontalLockup init](&v16, sel_init);
  v14 = v13;
  if (v13)
    objc_storeWeak((id *)&v13->_imageView, v4);

  return v14;
}

- (void)setImage:(id)a3
{
  void *v4;
  id WeakRetained;
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  -[SKUIBackgroundImageWrapperForHorizontalLockup imageView](self, "imageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_imageView);
    objc_msgSend(WeakRetained, "setImage:", v8);

  }
  -[SKUIBackgroundImageWrapperForHorizontalLockup lockup](self, "lockup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_loadWeakRetained((id *)&self->_lockup);
    objc_msgSend(v7, "setContainerBackgroundImageForPlayButton:", v8);

  }
}

- (void)setLockup:(id)a3
{
  SKUIHorizontalLockupView **p_lockup;
  id WeakRetained;
  void *v6;
  SKUIImageView **p_imageView;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id obj;

  obj = a3;
  p_lockup = &self->_lockup;
  WeakRetained = objc_loadWeakRetained((id *)&self->_lockup);

  v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_lockup, obj);
    p_imageView = &self->_imageView;
    v8 = objc_loadWeakRetained((id *)p_imageView);
    v6 = obj;
    if (v8)
    {
      v9 = v8;
      v10 = objc_loadWeakRetained((id *)p_imageView);
      objc_msgSend(v10, "image");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = obj;
      if (v11)
      {
        v12 = objc_loadWeakRetained((id *)p_lockup);
        v13 = objc_loadWeakRetained((id *)p_imageView);
        objc_msgSend(v13, "image");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setContainerBackgroundImageForPlayButton:", v14);

        v6 = obj;
      }
    }
  }

}

- (SKUIHorizontalLockupView)lockup
{
  return (SKUIHorizontalLockupView *)objc_loadWeakRetained((id *)&self->_lockup);
}

- (SKUIImageView)imageView
{
  return (SKUIImageView *)objc_loadWeakRetained((id *)&self->_imageView);
}

- (void)setImageView:(id)a3
{
  objc_storeWeak((id *)&self->_imageView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_imageView);
  objc_destroyWeak((id *)&self->_lockup);
}

- (void)initWithImage:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
