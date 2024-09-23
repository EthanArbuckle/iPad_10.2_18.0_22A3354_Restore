@implementation UIImage

uint64_t __77__UIImage_WKAdditions__wk_imageWithLightAppearanceImage_darkAppearanceImage___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setUserInterfaceStyle:", 1);
}

uint64_t __77__UIImage_WKAdditions__wk_imageWithLightAppearanceImage_darkAppearanceImage___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setUserInterfaceStyle:", 2);
}

uint64_t __70__UIImage_WKAdditions__wk_overlayForegroundImage_overBackgroundImage___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v2 = *(double *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "size");
  v4 = (v2 - v3) * 0.5;
  v5 = *(double *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "size");
  v7 = (v5 - v6) * 0.5;
  v8 = *(double *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "size");
  v10 = (v8 - v9) * 0.5;
  v11 = *(double *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 40), "size");
  v13 = (v11 - v12) * 0.5;
  objc_msgSend(*(id *)(a1 + 32), "drawAtPoint:", v4, v7);
  return objc_msgSend(*(id *)(a1 + 40), "drawAtPoint:", v10, v13);
}

uint64_t __86__UIImage_WKAdditions__wk_splitThumbnailWithLightAppearanceImage_darkAppearanceImage___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;

  v2 = *(double *)(a1 + 56);
  v3 = *(double *)(a1 + 80);
  v4 = (v2 - *(double *)(a1 + 88)) * 0.5;
  objc_msgSend(*(id *)(a1 + 32), "drawAtPoint:", 0.0, (v2 - *(double *)(a1 + 72)) * 0.5);
  return objc_msgSend(*(id *)(a1 + 40), "drawAtPoint:", v3, v4);
}

@end
