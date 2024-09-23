@implementation _UIONavigationBarTitleRenamerViewMetricsUpdateActionResponse

- (_UIONavigationBarTitleRenamerViewMetricsUpdateActionResponse)initWithRenderID:(unint64_t)a3 contextID:(unsigned int)a4 intrinsicContentSize:(CGSize)a5 bounds:(CGRect)a6 horizontalTextInset:(double)a7
{
  double height;
  double width;
  double y;
  double x;
  double v12;
  double v13;
  uint64_t v14;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _UIONavigationBarTitleRenamerViewMetricsUpdateActionResponse *v23;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v12 = a5.height;
  v13 = a5.width;
  v14 = *(_QWORD *)&a4;
  v17 = objc_alloc_init(MEMORY[0x1E0D017D0]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forSetting:", v18, 0);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forSetting:", v19, 1);

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", v13, v12);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forSetting:", v20, 2);

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", x, y, width, height);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forSetting:", v21, 3);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a7);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forSetting:", v22, 4);

  v23 = -[BSActionResponse initWithInfo:error:](self, "initWithInfo:error:", v17, 0);
  return v23;
}

- (unint64_t)sourceLayerRenderId
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[BSActionResponse info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedLongLongValue");

  return v4;
}

- (unsigned)sourceContextId
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

- (CGSize)intrinsicContentSize
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[BSActionResponse info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "CGSizeValue");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGRect)bounds
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

- (double)horizontalTextInset
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[BSActionResponse info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

@end
