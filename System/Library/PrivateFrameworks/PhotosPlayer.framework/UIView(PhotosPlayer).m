@implementation UIView(PhotosPlayer)

- (void)is_setBlurRadius:()PhotosPlayer
{
  id v3;

  objc_msgSend(a1, "layer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "is_setBlurRadius:", a2);

}

- (double)is_blurRadius
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "layer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "is_blurRadius");
  v3 = v2;

  return v3;
}

- (id)is_actionForKey:()PhotosPlayer
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("filters.LivePhotoBlur.inputRadius")))
  {
    objc_msgSend(a1, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueForKeyPath:", CFSTR("filters.LivePhotoBlur.inputRadius"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "presentationLayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "valueForKeyPath:", CFSTR("filters.LivePhotoBlur.inputRadius"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("filters.LivePhotoBlur.inputRadius"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFromValue:", v7);
    objc_msgSend(v8, "setToValue:", v5);

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

@end
