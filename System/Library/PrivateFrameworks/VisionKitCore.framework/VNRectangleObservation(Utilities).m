@implementation VNRectangleObservation(Utilities)

- (VKQuad)vkQuad
{
  uint64_t v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  VKQuad *v17;
  double v19;
  double v20;

  v2 = objc_opt_class();
  VKDynamicCast(v2, a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "topLeft");
    VKMFlipPoint();
    v19 = v6;
    v20 = v5;
    objc_msgSend(v4, "topRight");
    VKMFlipPoint();
    v8 = v7;
    v10 = v9;
    objc_msgSend(v4, "bottomLeft");
    VKMFlipPoint();
    v12 = v11;
    v14 = v13;
    objc_msgSend(v4, "bottomRight");
    VKMFlipPoint();
    v17 = -[VKQuad initWithBottomLeft:bottomRight:topLeft:topRight:]([VKQuad alloc], "initWithBottomLeft:bottomRight:topLeft:topRight:", v12, v14, v15, v16, v20, v19, v8, v10);
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)vk_quadConvertedToView:()Utilities withContentsRect:
{
  id v12;
  void *v13;
  void *v14;

  v12 = a7;
  objc_msgSend(a1, "vkQuad");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "quadByConvertingFromNormalizedRectToView:contentsRect:", v12, a2, a3, a4, a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end
