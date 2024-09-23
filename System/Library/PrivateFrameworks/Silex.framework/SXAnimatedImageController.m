@implementation SXAnimatedImageController

- (id)initWithImageComponentView:(void *)a3 viewport:(void *)a4 imageView:
{
  id v7;
  id v8;
  id v9;
  id *v10;
  objc_super v12;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)SXAnimatedImageController;
    v10 = (id *)objc_msgSendSuper2(&v12, sel_init);
    a1 = v10;
    if (v10)
    {
      objc_storeWeak(v10 + 5, v7);
      objc_storeWeak(a1 + 2, v8);
      objc_storeStrong(a1 + 3, a4);
    }
  }

  return a1;
}

- (void)viewport:(id)a3 dynamicBoundsDidChangeFromBounds:(CGRect)a4
{
  id WeakRetained;
  uint64_t v6;
  id v7;
  double v8;
  double v9;
  double Height;
  id v11;
  double v12;
  SXImageView *imageView;
  void *v14;
  double v15;
  SXImageView *v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  double previousYOffset;
  SXImageView *v21;
  void *v22;
  unint64_t v23;
  uint64_t v24;
  SXImageView *v25;
  id v26;
  CGRect v27;
  CGRect v28;

  v26 = a3;
  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_componentView);
  else
    WeakRetained = 0;
  v6 = objc_msgSend(WeakRetained, "visibilityState");

  if (v6 != 1)
    goto LABEL_35;
  if (self)
    v7 = objc_loadWeakRetained((id *)&self->_viewport);
  else
    v7 = 0;
  objc_msgSend(v7, "dynamicBounds");
  v9 = v8;

  objc_msgSend(v26, "bounds");
  Height = CGRectGetHeight(v27);
  if (self)
    v11 = objc_loadWeakRetained((id *)&self->_componentView);
  else
    v11 = 0;
  objc_msgSend(v11, "frame");
  v12 = Height + CGRectGetHeight(v28) * -0.6;
  if (self)
    imageView = self->_imageView;
  else
    imageView = 0;
  -[SXImageView animatedImage](imageView, "animatedImage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v12 / (double)(unint64_t)objc_msgSend(v14, "numberOfFrames");

  if (self)
    v16 = self->_imageView;
  else
    v16 = 0;
  v17 = fmin(v15, 15.0);
  v18 = -[SXImageView frameIndex](v16, "frameIndex");
  v19 = v18;
  if (self)
  {
    previousYOffset = self->_previousYOffset;
    if (v9 > v17 + previousYOffset)
    {
      v21 = self->_imageView;
      goto LABEL_15;
    }
LABEL_25:
    if (v9 < previousYOffset - v17)
    {
      if (v18 <= 1)
        v24 = 1;
      else
        v24 = v18;
      v19 = v24 - 1;
    }
    goto LABEL_30;
  }
  previousYOffset = 0.0;
  if (v9 <= v17 + 0.0)
    goto LABEL_25;
  v21 = 0;
LABEL_15:
  -[SXImageView animatedImage](v21, "animatedImage");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "numberOfFrames") - 1;

  if (v19 + 1 < v23)
    ++v19;
  else
    v19 = v23;
LABEL_30:
  if (self)
    v25 = self->_imageView;
  else
    v25 = 0;
  if (v19 != -[SXImageView frameIndex](v25, "frameIndex"))
  {
    if (self)
    {
      -[SXImageView setFrameIndex:](self->_imageView, "setFrameIndex:", v19);
      self->_previousYOffset = v9;
    }
    else
    {
      objc_msgSend(0, "setFrameIndex:", v19);
    }
  }
LABEL_35:

}

- (void)registerForViewportChanges
{
  id WeakRetained;

  if (a1)
  {
    if (!*(_BYTE *)(a1 + 8))
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
      objc_msgSend(WeakRetained, "addViewportChangeListener:forOptions:", a1, 2);

    }
    *(_BYTE *)(a1 + 8) = 1;
  }
}

- (void)unregisterForViewportChanges
{
  id WeakRetained;

  if (a1)
  {
    if (*(_BYTE *)(a1 + 8))
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
      objc_msgSend(WeakRetained, "removeViewportChangeListener:forOptions:", a1, 2);

    }
    *(_BYTE *)(a1 + 8) = 0;
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_componentView);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_destroyWeak((id *)&self->_viewport);
}

@end
