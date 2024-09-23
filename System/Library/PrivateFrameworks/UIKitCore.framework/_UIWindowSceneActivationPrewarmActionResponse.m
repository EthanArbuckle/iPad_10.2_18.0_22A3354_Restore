@implementation _UIWindowSceneActivationPrewarmActionResponse

+ (id)responseWithSceneContainer:(id)a3 expectedSceneFrame:(CGRect)a4 cornerRadii:(UIRectCornerRadii)a5
{
  double topRight;
  double bottomRight;
  double bottomLeft;
  double topLeft;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t RenderId;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v30[4];

  topRight = a5.topRight;
  bottomRight = a5.bottomRight;
  bottomLeft = a5.bottomLeft;
  topLeft = a5.topLeft;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v14 = a3;
  v15 = (void *)objc_opt_new();
  objc_msgSend(v14, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "context");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "contextId");

  objc_msgSend(v14, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  RenderId = CALayerGetRenderId();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forSetting:", v21, 1);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", RenderId);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forSetting:", v22, 2);

  *(CGFloat *)v30 = x;
  *(CGFloat *)&v30[1] = y;
  *(CGFloat *)&v30[2] = width;
  *(CGFloat *)&v30[3] = height;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v30, "{CGRect={CGPoint=dd}{CGSize=dd}}");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forSetting:", v23, 3);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", topLeft);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forSetting:", v24, 4);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", topRight);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forSetting:", v25, 5);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", bottomRight);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forSetting:", v26, 6);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", bottomLeft);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forSetting:", v27, 7);

  objc_msgSend(a1, "responseWithInfo:", v15);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (unsigned)sceneContainerContextId
{
  void *v2;
  void *v3;
  unsigned int v4;

  -[BSActionResponse info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntValue");

  return v4;
}

- (unint64_t)sceneContainerRenderId
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[BSActionResponse info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedLongLongValue");

  return v4;
}

- (CGRect)sceneFrame
{
  void *v2;
  void *v3;
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
  double v14;
  double v15;
  CGRect result;

  -[BSActionResponse info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "CGRectValue");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (UIRectCornerRadii)sceneCornerRadii
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  UIRectCornerRadii result;

  -[BSActionResponse info](self, "info");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForSetting:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  -[BSActionResponse info](self, "info");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForSetting:", 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  -[BSActionResponse info](self, "info");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForSetting:", 7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  v14 = v13;

  -[BSActionResponse info](self, "info");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForSetting:", 6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "doubleValue");
  v18 = v17;

  v19 = v6;
  v20 = v14;
  v21 = v18;
  v22 = v10;
  result.topRight = v22;
  result.bottomRight = v21;
  result.bottomLeft = v20;
  result.topLeft = v19;
  return result;
}

@end
