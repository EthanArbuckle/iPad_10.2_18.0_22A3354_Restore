@implementation CALayer(Utilities)

- (id)vk_quadFromConvertingBoundsToLayer:()Utilities
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "bounds");
  objc_msgSend(a1, "vk_quadFromConvertingRect:toLayer:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (VKQuad)vk_quadFromConvertingRect:()Utilities toLayer:
{
  id v12;
  VKQuad *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  VKQuad *v30;

  v12 = a7;
  v13 = -[VKQuad initWithRect:]([VKQuad alloc], "initWithRect:", a2, a3, a4, a5);
  -[VKQuad topLeft](v13, "topLeft");
  objc_msgSend(a1, "convertPoint:toLayer:", v12);
  v15 = v14;
  v17 = v16;
  -[VKQuad topRight](v13, "topRight");
  objc_msgSend(a1, "convertPoint:toLayer:", v12);
  v19 = v18;
  v21 = v20;
  -[VKQuad bottomLeft](v13, "bottomLeft");
  objc_msgSend(a1, "convertPoint:toLayer:", v12);
  v23 = v22;
  v25 = v24;
  -[VKQuad bottomRight](v13, "bottomRight");
  objc_msgSend(a1, "convertPoint:toLayer:", v12);
  v27 = v26;
  v29 = v28;

  v30 = -[VKQuad initWithBottomLeft:bottomRight:topLeft:topRight:]([VKQuad alloc], "initWithBottomLeft:bottomRight:topLeft:topRight:", v23, v25, v27, v29, v15, v17, v19, v21);
  return v30;
}

- (VKAutoFadeOutLayer)vk_autoFadeOutShapePointLayer
{
  VKAutoFadeOutLayer *v2;
  void *v3;
  id v4;
  uint64_t v5;
  VKAutoFadeOutLayer *v6;
  _QWORD v8[4];
  VKAutoFadeOutLayer *v9;

  v2 = objc_alloc_init(VKAutoFadeOutLayer);
  objc_msgSend(MEMORY[0x1E0CEA478], "vk_randomColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "colorWithAlphaComponent:", 0.8);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[VKAutoFadeOutLayer setBackgroundColor:](v2, "setBackgroundColor:", objc_msgSend(v4, "CGColor"));

  VKMRectWithOriginAndSize(v5, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), 10.0, 10.0);
  -[VKAutoFadeOutLayer setBounds:](v2, "setBounds:");
  objc_msgSend(a1, "addSublayer:", v2);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__CALayer_Utilities__vk_autoFadeOutShapePointLayer__block_invoke;
  v8[3] = &unk_1E94625B8;
  v6 = v2;
  v9 = v6;
  vk_dispatchMainAfterDelay(v8, 1.0);

  return v6;
}

- (id)vk_autoFadeOutShapeRectLayer
{
  void *v1;
  id v2;

  objc_msgSend(a1, "vk_autoFadeOutShapePointLayer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setBorderColor:", objc_msgSend(v1, "backgroundColor"));
  objc_msgSend(v1, "setBorderWidth:", 2.0);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v1, "setBackgroundColor:", objc_msgSend(v2, "CGColor"));

  return v1;
}

@end
