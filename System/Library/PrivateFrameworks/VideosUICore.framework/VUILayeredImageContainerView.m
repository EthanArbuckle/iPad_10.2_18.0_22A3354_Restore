@implementation VUILayeredImageContainerView

- (VUILayeredImageContainerView)initWithFrame:(CGRect)a3
{
  VUILayeredImageContainerView *v3;
  VUILayeredImageContainerView *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VUILayeredImageContainerView;
  v3 = -[_UIStackedImageContainerView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[_UIStackedImageContainerView config](v3, "config");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMaximumParallaxImages:", 6);

  }
  return v4;
}

- (VUILayeredImageContainerView)initWithLayeredImageProxy:(id)a3
{
  id v5;
  VUILayeredImageContainerView *v6;
  VUILayeredImageContainerView *v7;

  v5 = a3;
  v6 = -[VUILayeredImageContainerView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_layeredImageProxy, a3);
    -[VUILayeredImageContainerView setAutoresizingMask:](v7, "setAutoresizingMask:", 18);
  }

  return v7;
}

- (void)setOverlayView:(id)a3
{
  -[VUILayeredImageContainerView setOverlayView:masked:](self, "setOverlayView:masked:", a3, 1);
}

- (void)setOverlayView:(id)a3 masked:(BOOL)a4
{
  _BOOL4 v4;
  UIView **p_overlayView;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a4;
  v13 = a3;
  p_overlayView = &self->_overlayView;
  objc_storeStrong((id *)&self->_overlayView, a3);
  -[VUILayeredImageContainerView layeredImageContainerLayer](self, "layeredImageContainerLayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v4)
  {
    -[UIView layer](*p_overlayView, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_setOverlayLayer:", v10);

    -[VUILayeredImageContainerView layeredImageContainerLayer](self, "layeredImageContainerLayer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_setUnmaskedOverlayLayer:", 0);
  }
  else
  {
    objc_msgSend(v8, "_setOverlayLayer:", 0);

    -[VUILayeredImageContainerView layeredImageContainerLayer](self, "layeredImageContainerLayer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView layer](*p_overlayView, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_setUnmaskedOverlayLayer:", v12);

  }
}

- (void)setFixedFrameOverlayView:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v3 = a3;
  -[_UIStackedImageContainerView config](self, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[_UIStackedImageContainerView config](self, "config");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setOverlayFixedFrame:", v3);

  }
  if (v3
    || (-[VUILayeredImageContainerView layeredImageContainerLayer](self, "layeredImageContainerLayer"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "_selectionStyle"),
        v8,
        v9 == 1))
  {
    -[_UIStackedImageContainerView config](self, "config");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSpecularOpacity:", 0.0);
  }
  else
  {
    -[_UIStackedImageContainerView config](self, "config");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(MEMORY[0x1E0CEAEB8], "newStandardConfiguration");
    objc_msgSend(v10, "specularOpacity");
    objc_msgSend(v11, "setSpecularOpacity:");

  }
}

- (BOOL)fixedFrameOverlayView
{
  void *v3;
  char v4;
  void *v5;
  char v6;

  -[_UIStackedImageContainerView config](self, "config");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return 0;
  -[_UIStackedImageContainerView config](self, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "overlayFixedFrame");

  return v6;
}

- (void)setLayeredImageProxy:(id)a3
{
  VUILayeredImageProxy **p_layeredImageProxy;
  void *v6;
  id v7;

  p_layeredImageProxy = &self->_layeredImageProxy;
  v7 = a3;
  if ((objc_msgSend(v7, "isEqual:", *p_layeredImageProxy) & 1) == 0)
  {
    -[VUILayeredImageProxy cancel](*p_layeredImageProxy, "cancel");
    objc_storeStrong((id *)&self->_layeredImageProxy, a3);
    -[VUILayeredImageContainerView setLayeredImageLoaded:](self, "setLayeredImageLoaded:", 0);
    -[VUILayeredImageContainerView window](self, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      -[VUILayeredImageContainerView _loadLayeredImage](self, "_loadLayeredImage");
  }

}

- (UIEdgeInsets)selectionMarginsForSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  UIEdgeInsets result;

  if (a3.width == 0.0 || (height = a3.height, a3.height == 0.0))
  {
    -[VUILayeredImageContainerView bounds](self, "bounds");
    width = v6;
    height = v7;
  }
  else
  {
    width = a3.width;
  }
  v8 = (void *)MEMORY[0x1E0CEAEC0];
  -[_UIStackedImageContainerView config](self, "config");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scaleSizeIncrease");
  v11 = v10;
  -[VUILayeredImageContainerView layeredImageContainerLayer](self, "layeredImageContainerLayer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_scaledSizeForSize:focusSizeIncrease:selectionStyle:", objc_msgSend(v12, "_selectionStyle"), width, height, v11);
  v14 = v13;
  v16 = v15;

  v17 = floor((v14 - width) * 0.5);
  v18 = floor((v16 - height) * 0.5);
  v19 = v18;
  v20 = v17;
  result.right = v20;
  result.bottom = v19;
  result.left = v17;
  result.top = v18;
  return result;
}

- (void)willMoveToWindow:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VUILayeredImageContainerView;
  -[VUILayeredImageContainerView willMoveToWindow:](&v5, sel_willMoveToWindow_);
  if (a3)
  {
    if (!-[VUILayeredImageContainerView isLayeredImageLoaded](self, "isLayeredImageLoaded"))
      -[VUILayeredImageContainerView _loadLayeredImage](self, "_loadLayeredImage");
  }
  else
  {
    -[VUILayeredImageProxy cancel](self->_layeredImageProxy, "cancel");
  }
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;

  v4 = a4;
  v5 = a3;
  -[_UIStackedImageContainerView setStackFocused:](self, "setStackFocused:");
  -[UIView vui_setSelected:animated:withAnimationCoordinator:](self->_overlayView, "vui_setSelected:animated:withAnimationCoordinator:", v5, v4, 0);
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 withAnimationCoordinator:(id)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  -[_UIStackedImageContainerView setStackFocused:withFocusAnimationCoordinator:](self, "setStackFocused:withFocusAnimationCoordinator:", v6, v8);
  -[UIView vui_setSelected:animated:withAnimationCoordinator:](self->_overlayView, "vui_setSelected:animated:withAnimationCoordinator:", v6, v5, v8);

}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 focusAnimationCoordinator:(id)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  -[_UIStackedImageContainerView setStackFocused:withFocusAnimationCoordinator:](self, "setStackFocused:withFocusAnimationCoordinator:", v6, v8);
  -[UIView vui_setSelected:animated:withAnimationCoordinator:](self->_overlayView, "vui_setSelected:animated:withAnimationCoordinator:", v6, v5, v8);

}

- (void)setPressed:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[VUILayeredImageContainerView layeredImageContainerLayer](self, "layeredImageContainerLayer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPressed:", v3);

}

- (void)setPressed:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  id v6;

  v4 = a4;
  v5 = a3;
  -[VUILayeredImageContainerView layeredImageContainerLayer](self, "layeredImageContainerLayer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPressed:animated:", v5, v4);

}

- (void)setPressed:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  id v9;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  -[VUILayeredImageContainerView layeredImageContainerLayer](self, "layeredImageContainerLayer");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPressed:animated:completion:", v6, v5, v8);

}

- (void)_loadLayeredImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12[3];
  id from;
  id location;

  if (!-[VUILayeredImageProxy isLoading](self->_layeredImageProxy, "isLoading"))
  {
    -[_UIStackedImageContainerView constructedStackImage](self, "constructedStackImage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIStackedImageContainerView stackImage](self, "stackImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIStackedImageContainerView setConstructedStackImage:](self, "setConstructedStackImage:", 0);
    -[_UIStackedImageContainerView setStackImage:](self, "setStackImage:", 0);
    -[VUILayeredImageContainerView setLoadedImage:](self, "setLoadedImage:", 0);
    if (v3)
      VUIDeferredRelease(v3);
    if (v4)
      VUIDeferredRelease(v4);
    objc_initWeak(&location, self);
    objc_initWeak(&from, self->_layeredImageProxy);
    -[VUILayeredImageContainerView bounds](self, "bounds");
    v6 = v5;
    v8 = v7;
    v9 = objc_loadWeakRetained(&from);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __49__VUILayeredImageContainerView__loadLayeredImage__block_invoke;
    v10[3] = &unk_1E9F2C268;
    objc_copyWeak(&v11, &location);
    v12[1] = v6;
    v12[2] = v8;
    objc_copyWeak(v12, &from);
    objc_msgSend(v9, "loadWithCompletion:", v10);

    objc_destroyWeak(v12);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);

  }
}

void __49__VUILayeredImageContainerView__loadLayeredImage__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id WeakRetained;
  void *v10;
  void *v11;
  double v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB32E8]))
  {
    v8 = objc_msgSend(v6, "code");

    if (v8 == -999)
      goto LABEL_12;
  }
  else
  {

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "config");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (+[VUICoreUtilities canHandleDecodingOnRenderThread](VUICoreUtilities, "canHandleDecodingOnRenderThread"))
    {
      +[VUINamedLayerStack namedLayerStackWithImage:](VUINamedLayerStack, "namedLayerStackWithImage:", v5);
    }
    else
    {
      objc_msgSend(v10, "cornerRadius");
      +[VUINamedLayerStack decodedNamedLayerStackWithImage:size:cornerRadius:](VUINamedLayerStack, "decodedNamedLayerStackWithImage:size:cornerRadius:", v5, *(double *)(a1 + 48), *(double *)(a1 + 56), v12);
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __49__VUILayeredImageContainerView__loadLayeredImage__block_invoke_2;
  v14[3] = &unk_1E9F2C240;
  objc_copyWeak(&v17, (id *)(a1 + 32));
  objc_copyWeak(&v18, (id *)(a1 + 40));
  v15 = v11;
  v16 = v5;
  v13 = v11;
  dispatch_async(MEMORY[0x1E0C80D38], v14);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v17);

LABEL_12:
}

void __49__VUILayeredImageContainerView__loadLayeredImage__block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = v2;
  if (WeakRetained && (id)WeakRetained[58] == v2)
  {
    objc_msgSend(WeakRetained, "setLayeredImageLoaded:", 1);
    objc_msgSend(WeakRetained, "setConstructedStackImage:", *(_QWORD *)(a1 + 32));
    if (*(_QWORD *)(a1 + 32))
      v4 = 0;
    else
      v4 = *(_QWORD *)(a1 + 40);
    objc_msgSend(WeakRetained, "setStackImage:", v4);
    if (+[VUICoreUtilities canHandleDecodingOnRenderThread](VUICoreUtilities, "canHandleDecodingOnRenderThread"))
    {
      objc_msgSend(WeakRetained, "setLoadedImage:", *(_QWORD *)(a1 + 40));
    }
  }

}

- (UIView)overlayView
{
  return self->_overlayView;
}

- (VUILayeredImageProxy)layeredImageProxy
{
  return self->_layeredImageProxy;
}

- (BOOL)isLayeredImageLoaded
{
  return self->_layeredImageLoaded;
}

- (void)setLayeredImageLoaded:(BOOL)a3
{
  self->_layeredImageLoaded = a3;
}

- (UIImage)loadedImage
{
  return self->_loadedImage;
}

- (void)setLoadedImage:(id)a3
{
  objc_storeStrong((id *)&self->_loadedImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadedImage, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_layeredImageProxy, 0);
}

@end
