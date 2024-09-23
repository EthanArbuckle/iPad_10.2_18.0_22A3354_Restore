@implementation UIFloatingShadowView

uint64_t __39___UIFloatingShadowView_initWithFrame___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setShadowContentsCenter:", 0.5, 0.5, 0.01, 0.01);
  objc_msgSend(*(id *)(a1 + 32), "setShadowRadius:", 20.0);
  objc_msgSend(*(id *)(a1 + 32), "setShadowOpacity:", 0.2);
  objc_msgSend(*(id *)(a1 + 32), "setShadowVerticalOffset:", 25.0);
  objc_msgSend(*(id *)(a1 + 32), "setShadowExpansion:", 35.0);
  objc_msgSend(*(id *)(a1 + 32), "setShadowEnabled:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setCornerRadius:", 6.0);
  return objc_msgSend(*(id *)(a1 + 32), "_updateShadowLayer");
}

void __48___UIFloatingShadowView__setShadowImageIfNeeded__block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  _UIStretchableShadow *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "shadowRadius");
  v3 = v2;
  objc_msgSend(*(id *)(a1 + 32), "cornerRadius");
  v5 = +[_UIStretchableShadow shadowWithRadius:cornerRadius:](_UIStretchableShadow, "shadowWithRadius:cornerRadius:", v3, v4);
  v6 = *(void **)(a1 + 32);
  +[UIImage imageWithCGImage:](UIImage, "imageWithCGImage:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setShadowImage:", v7);

}

void __51___UIFloatingShadowView__shadowPathForSize_radius___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
  v1 = (void *)_MergedGlobals_3_1;
  _MergedGlobals_3_1 = v0;

}

@end
