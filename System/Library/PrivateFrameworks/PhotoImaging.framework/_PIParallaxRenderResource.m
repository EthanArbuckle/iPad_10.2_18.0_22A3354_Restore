@implementation _PIParallaxRenderResource

- (PFParallaxColor)medianColor
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

  -[_PIParallaxRenderResource imageHistogram](self, "imageHistogram");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "red");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "median");
  v6 = v5;

  -[_PIParallaxRenderResource imageHistogram](self, "imageHistogram");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "green");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "median");
  v10 = v9;

  -[_PIParallaxRenderResource imageHistogram](self, "imageHistogram");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "blue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "median");
  v14 = v13;

  return (PFParallaxColor *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0D75170]), "initWithRed:green:blue:", v6, v10, v14);
}

- (PFParallaxColor)dominantColor
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;

  -[_PIParallaxRenderResource imageHistogram](self, "imageHistogram");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "smoothWithFunction:windowSize:sampleMode:", 1, 13, 0);
  objc_msgSend(v3, "red");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mode");
  v6 = v5;

  objc_msgSend(v3, "green");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mode");
  v9 = v8;

  objc_msgSend(v3, "blue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "mode");
  v12 = v11;

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D75170]), "initWithRed:green:blue:", v6, v9, v12);
  return (PFParallaxColor *)v13;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NUPurgeableStorage)destination
{
  return self->_destination;
}

- (void)setDestination:(id)a3
{
  objc_storeStrong((id *)&self->_destination, a3);
}

- (CIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (CIRenderTask)task
{
  return self->_task;
}

- (void)setTask:(id)a3
{
  objc_storeStrong((id *)&self->_task, a3);
}

- (NUImageHistogram)imageHistogram
{
  return self->_imageHistogram;
}

- (void)setImageHistogram:(id)a3
{
  objc_storeStrong((id *)&self->_imageHistogram, a3);
}

- ($C28CD4A45FD07A4F97CC9D5F91F25271)luminanceWeights
{
  float r;
  float g;
  float b;
  float a;
  $C28CD4A45FD07A4F97CC9D5F91F25271 result;

  r = self->_luminanceWeights.r;
  g = self->_luminanceWeights.g;
  b = self->_luminanceWeights.b;
  a = self->_luminanceWeights.a;
  result.var3 = a;
  result.var2 = b;
  result.var1 = g;
  result.var0 = r;
  return result;
}

- (void)setLuminanceWeights:(id)a3
{
  self->_luminanceWeights = ($43F634250C0E94E2A09AB0840E4770D1)a3;
}

- ($C28CD4A45FD07A4F97CC9D5F91F25271)luminanceThresholds
{
  float r;
  float g;
  float b;
  float a;
  $C28CD4A45FD07A4F97CC9D5F91F25271 result;

  r = self->_luminanceThresholds.r;
  g = self->_luminanceThresholds.g;
  b = self->_luminanceThresholds.b;
  a = self->_luminanceThresholds.a;
  result.var3 = a;
  result.var2 = b;
  result.var1 = g;
  result.var0 = r;
  return result;
}

- (void)setLuminanceThresholds:(id)a3
{
  self->_luminanceThresholds = ($43F634250C0E94E2A09AB0840E4770D1)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageHistogram, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
