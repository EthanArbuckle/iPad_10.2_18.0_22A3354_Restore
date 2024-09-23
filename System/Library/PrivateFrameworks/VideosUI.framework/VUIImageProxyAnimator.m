@implementation VUIImageProxyAnimator

- (VUIImageProxyAnimator)init
{
  id v3;
  VUIImageProxyAnimator *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0DB18B0]);
  v4 = -[VUIImageProxyAnimator initWithImageView:andProxies:](self, "initWithImageView:andProxies:", v3, 0);

  return v4;
}

- (VUIImageProxyAnimator)initWithImageView:(id)a3 andProxies:(id)a4
{
  id v7;
  id v8;
  VUIImageProxyAnimator *v9;
  VUIImageProxyAnimator *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)VUIImageProxyAnimator;
  v9 = -[VUIImageProxyAnimator init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_cachingEnabled = 1;
    objc_storeStrong((id *)&v9->_imageProxies, a4);
    *(_OWORD *)&v10->_displayImageIndex = xmmword_1DA1C1C60;
    objc_storeStrong((id *)&v10->_imageView, a3);
    v10->_animating = 0;
    v10->_animationOptions = 5243008;
    *(_OWORD *)&v10->_animationDuration = xmmword_1DA1C1C70;
    -[VUIImageProxyAnimator _fetchNext](v10, "_fetchNext");
  }

  return v10;
}

- (void)startAnimation
{
  void *v3;
  unint64_t v4;
  void *v5;
  id v6;

  -[VUIImageProxyAnimator imageProxies](self, "imageProxies");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 >= 2)
  {
    -[VUIImageProxyAnimator setAnimating:](self, "setAnimating:", 1);
    v5 = (void *)MEMORY[0x1E0C99E88];
    -[VUIImageProxyAnimator transitionInterval](self, "transitionInterval");
    objc_msgSend(v5, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__displayIntervalTimerFired_, 0, 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[VUIImageProxyAnimator setTransitionTimer:](self, "setTransitionTimer:", v6);

  }
}

- (void)stopAnimation
{
  void *v3;

  -[VUIImageProxyAnimator transitionTimer](self, "transitionTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[VUIImageProxyAnimator setTransitionTimer:](self, "setTransitionTimer:", 0);
  -[VUIImageProxyAnimator setAnimating:](self, "setAnimating:", 0);
}

- (void)_setImage:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  unint64_t v12;
  void *v13;
  _QWORD v14[5];
  id v15;

  v4 = a4;
  v6 = a3;
  -[VUIImageProxyAnimator imageView](self, "imageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (v4)
    {
      v8 = (void *)MEMORY[0x1E0DC3F10];
      -[VUIImageProxyAnimator imageView](self, "imageView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIImageProxyAnimator animationDuration](self, "animationDuration");
      v11 = v10;
      v12 = -[VUIImageProxyAnimator animationOptions](self, "animationOptions");
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __44__VUIImageProxyAnimator__setImage_animated___block_invoke;
      v14[3] = &unk_1E9F98FD8;
      v14[4] = self;
      v15 = v6;
      objc_msgSend(v8, "transitionWithView:duration:options:animations:completion:", v9, v12, v14, 0, v11);

    }
    else
    {
      -[VUIImageProxyAnimator imageView](self, "imageView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setImage:", v6);

    }
  }

}

void __44__VUIImageProxyAnimator__setImage_animated___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "imageView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setImage:", *(_QWORD *)(a1 + 40));

}

- (void)loadImageProxy:(id)a3 withWeakObject:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id from;
  id location;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_initWeak(&location, v8);
  objc_initWeak(&from, v7);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73__VUIImageProxyAnimator_loadImageProxy_withWeakObject_completionHandler___block_invoke;
  v11[3] = &unk_1E9F9B788;
  objc_copyWeak(&v13, &from);
  objc_copyWeak(&v14, &location);
  v10 = v9;
  v12 = v10;
  objc_msgSend(v7, "setCompletionHandler:", v11);
  objc_msgSend(v7, "load");

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

void __73__VUIImageProxyAnimator_loadImageProxy_withWeakObject_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id WeakRetained;
  id v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setCompletionHandler:", 0);

  v9 = objc_loadWeakRetained((id *)(a1 + 48));
  if (v9)
  {
    v10 = *(_QWORD *)(a1 + 32);
    if (v10)
      (*(void (**)(uint64_t, id, id, id, uint64_t))(v10 + 16))(v10, v9, v11, v7, a4);
  }

}

- (void)_updateImageWithIndex:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10[2];
  id location;

  -[VUIImageProxyAnimator imageProxies](self, "imageProxies");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 > a3)
  {
    -[VUIImageProxyAnimator imageProxies](self, "imageProxies");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[VUIImageProxyAnimator isCachingEnabled](self, "isCachingEnabled"))
    {
      objc_msgSend(v8, "setLoadSynchronouslyIfCached:", 1);
      objc_msgSend(v8, "setCacheOnLoad:", 1);
    }
    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __47__VUIImageProxyAnimator__updateImageWithIndex___block_invoke;
    v9[3] = &unk_1E9F9B7D8;
    v10[1] = (id)a3;
    v9[4] = self;
    objc_copyWeak(v10, &location);
    -[VUIImageProxyAnimator loadImageProxy:withWeakObject:completionHandler:](self, "loadImageProxy:withWeakObject:completionHandler:", v8, self, v9);
    objc_destroyWeak(v10);
    objc_destroyWeak(&location);

  }
}

void __47__VUIImageProxyAnimator__updateImageWithIndex___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  uint64_t v13;
  id v14[2];

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__VUIImageProxyAnimator__updateImageWithIndex___block_invoke_2;
  block[3] = &unk_1E9F9B7B0;
  v11 = v6;
  v12 = v5;
  v7 = *(_QWORD *)(a1 + 32);
  v14[1] = *(id *)(a1 + 48);
  v13 = v7;
  v8 = v5;
  v9 = v6;
  objc_copyWeak(v14, (id *)(a1 + 40));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(v14);

}

void __47__VUIImageProxyAnimator__updateImageWithIndex___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  id WeakRetained;
  id v16;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = *(void **)(a1 + 40);
    objc_msgSend(v2, "uiImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_setImage:animated:", v4, 1);

    objc_msgSend(*(id *)(a1 + 40), "setDisplayImageIndex:", *(_QWORD *)(a1 + 64));
    if (objc_msgSend(*(id *)(a1 + 48), "isAnimating"))
    {
      objc_msgSend(*(id *)(a1 + 40), "transitionTimer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
LABEL_14:

        return;
      }
      objc_msgSend(*(id *)(a1 + 40), "imageProxies");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "count");

      if (v7 >= 2)
      {
        v8 = (void *)MEMORY[0x1E0C99E88];
        objc_msgSend(*(id *)(a1 + 40), "transitionInterval");
        objc_msgSend(v8, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", *(_QWORD *)(a1 + 40), sel__displayIntervalTimerFired_, 0, 0);
        v16 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "setTransitionTimer:", v16);
LABEL_13:
        v5 = v16;
        goto LABEL_14;
      }
    }
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 40), "imageProxies");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v9 < v11)
    {
      objc_msgSend(*(id *)(a1 + 40), "imageProxies");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (id)objc_msgSend(v12, "mutableCopy");

      objc_msgSend(v16, "removeObjectAtIndex:", *(_QWORD *)(a1 + 64));
      objc_msgSend(*(id *)(a1 + 40), "setImageProxies:", v16);
      v13 = *(_QWORD *)(a1 + 64);
      if (v13 >= objc_msgSend(v16, "count"))
        v14 = 0;
      else
        v14 = *(_QWORD *)(a1 + 64);
      if (objc_msgSend(v16, "count"))
      {
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
        objc_msgSend(WeakRetained, "_updateImageWithIndex:", v14);

      }
      goto LABEL_13;
    }
  }
}

- (void)_fetchNext
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *, void *);
  void *v11;
  id v12;
  id location;

  if (-[VUIImageProxyAnimator indexOfFetchedImage](self, "indexOfFetchedImage") == 0x7FFFFFFFFFFFFFFFLL)
    v3 = 0;
  else
    v3 = -[VUIImageProxyAnimator indexOfFetchedImage](self, "indexOfFetchedImage") + 1;
  -[VUIImageProxyAnimator imageProxies](self, "imageProxies");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v3 < v5)
  {
    while (1)
    {
      -[VUIImageProxyAnimator imageProxies](self, "imageProxies");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndex:", v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v7, "isImageAvailable") & 1) == 0)
        break;
      ++v3;

      if (v5 == v3)
        return;
    }
    objc_initWeak(&location, v7);
    -[VUIImageProxyAnimator setIndexOfFetchedImage:](self, "setIndexOfFetchedImage:", v3);
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __35__VUIImageProxyAnimator__fetchNext__block_invoke;
    v11 = &unk_1E9F9B800;
    objc_copyWeak(&v12, &location);
    -[VUIImageProxyAnimator loadImageProxy:withWeakObject:completionHandler:](self, "loadImageProxy:withWeakObject:completionHandler:", v7, self, &v8);
    objc_msgSend(v7, "load", v8, v9, v10, v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);

  }
}

void __35__VUIImageProxyAnimator__fetchNext__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__VUIImageProxyAnimator__fetchNext__block_invoke_2;
  block[3] = &unk_1E9F99000;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  v10 = v6;
  v11 = v5;
  v7 = v5;
  v8 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v12);
}

void __35__VUIImageProxyAnimator__fetchNext__block_invoke_2(uint64_t a1)
{
  void *v3;
  void *v4;
  uint64_t v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!*(_QWORD *)(a1 + 32)
    && objc_msgSend(*(id *)(a1 + 40), "indexOfFetchedImage") != 0x7FFFFFFFFFFFFFFFLL
    && WeakRetained != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "imageProxies");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "mutableCopy");

    v5 = objc_msgSend(v4, "indexOfObjectIdenticalTo:", WeakRetained);
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v4, "removeObjectAtIndex:", v5);
      objc_msgSend(*(id *)(a1 + 40), "setImageProxies:", v4);
    }

  }
  objc_msgSend(*(id *)(a1 + 40), "_fetchNext");

}

- (void)_displayIntervalTimerFired:(id)a3
{
  void *v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;

  -[VUIImageProxyAnimator transitionTimer](self, "transitionTimer", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  -[VUIImageProxyAnimator setTransitionTimer:](self, "setTransitionTimer:", 0);
  v5 = -[VUIImageProxyAnimator displayImageIndex](self, "displayImageIndex") + 1;
  -[VUIImageProxyAnimator imageProxies](self, "imageProxies");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  if (v5 < objc_msgSend(v6, "count"))
    v7 = -[VUIImageProxyAnimator displayImageIndex](self, "displayImageIndex") + 1;

  -[VUIImageProxyAnimator _updateImageWithIndex:](self, "_updateImageWithIndex:", v7);
}

- (NSArray)imageProxies
{
  return self->_imageProxies;
}

- (void)setImageProxies:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)animationOptions
{
  return self->_animationOptions;
}

- (void)setAnimationOptions:(unint64_t)a3
{
  self->_animationOptions = a3;
}

- (double)animationDuration
{
  return self->_animationDuration;
}

- (void)setAnimationDuration:(double)a3
{
  self->_animationDuration = a3;
}

- (double)transitionInterval
{
  return self->_transitionInterval;
}

- (void)setTransitionInterval:(double)a3
{
  self->_transitionInterval = a3;
}

- (BOOL)isAnimating
{
  return self->_animating;
}

- (void)setAnimating:(BOOL)a3
{
  self->_animating = a3;
}

- (unint64_t)displayImageIndex
{
  return self->_displayImageIndex;
}

- (void)setDisplayImageIndex:(unint64_t)a3
{
  self->_displayImageIndex = a3;
}

- (unint64_t)indexOfFetchedImage
{
  return self->_indexOfFetchedImage;
}

- (void)setIndexOfFetchedImage:(unint64_t)a3
{
  self->_indexOfFetchedImage = a3;
}

- (_TVImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (NSTimer)transitionTimer
{
  return (NSTimer *)objc_loadWeakRetained((id *)&self->_transitionTimer);
}

- (void)setTransitionTimer:(id)a3
{
  objc_storeWeak((id *)&self->_transitionTimer, a3);
}

- (BOOL)isCachingEnabled
{
  return self->_cachingEnabled;
}

- (void)setCachingEnabled:(BOOL)a3
{
  self->_cachingEnabled = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_transitionTimer);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_imageProxies, 0);
}

@end
