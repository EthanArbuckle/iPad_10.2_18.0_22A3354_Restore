@implementation PXGExposureBlurKernel

- (PXGExposureBlurKernel)init
{
  PXGExposureBlurKernel *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXGExposureBlurKernel;
  result = -[PXGExposureBlurKernel init](&v3, sel_init);
  if (result)
    result->_multiplier = 1.0;
  return result;
}

- (void)_encodeExposure:(float)a3 texture:(id)a4 toCommandBuffer:(id)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  _QWORD v27[3];
  _QWORD v28[3];
  float v29;

  v29 = a3;
  v6 = a4;
  v7 = a5;
  objc_msgSend(v7, "computeCommandEncoder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pushDebugGroup:", CFSTR("PXGExposureBlur.exposure"));
  v9 = (void *)objc_opt_class();
  objc_msgSend(v7, "device");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_exposurePipelineStateForDevice:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setComputePipelineState:", v11);
  objc_msgSend(v8, "setTexture:atIndex:", v6, 0);
  objc_msgSend(v8, "setTexture:atIndex:", v6, 1);
  objc_msgSend(v8, "setBytes:length:atIndex:", &v29, 4, 0);
  v12 = objc_msgSend(v6, "width");
  v13 = objc_msgSend(v6, "height");
  v14 = v11;
  v15 = objc_msgSend(v14, "threadExecutionWidth");
  v16 = objc_msgSend(v14, "maxTotalThreadsPerThreadgroup");
  v17 = v16 / v15;
  if (v15 <= v16)
  {
    v19 = 0;
    v20 = -1;
    v18 = v15;
    v21 = -1;
    v22 = v16 / v15;
    do
    {
      if (v15 + v19 <= v22)
        v23 = v22;
      else
        v23 = v15 + v19;
      if (v15 + v19 >= v22)
        v24 = v22;
      else
        v24 = v15 + v19;
      if ((v22 + v13 - 1) / v22 * v22 * (v12 + v15 + v19 - 1) / (v15 + v19) * (v15 + v19) - v13 * v12 <= v20)
      {
        v25 = v23 / v24;
        if (v25 <= v21)
        {
          v17 = v22;
          v18 = v15 + v19;
          v21 = v25;
          v20 = (v22 + v13 - 1) / v22 * v22 * (v12 + v15 + v19 - 1) / (v15 + v19) * (v15 + v19) - v13 * v12;
        }
      }
      v26 = 2 * v15 + v19;
      v19 += v15;
      v22 = v16 / v26;
    }
    while (v15 + v19 <= v16);
  }
  else
  {
    v18 = v15;
  }

  v28[0] = (v12 + v18 - 1) / v18;
  v28[1] = (v13 + v17 - 1) / v17;
  v28[2] = 1;
  v27[0] = v18;
  v27[1] = v17;
  v27[2] = 1;
  objc_msgSend(v8, "dispatchThreadgroups:threadsPerThreadgroup:", v28, v27);
  objc_msgSend(v8, "popDebugGroup");
  objc_msgSend(v8, "endEncoding");

}

- (void)encodeToCommandBuffer:(id)a3 sourceTexture:(id)a4 destinationTexture:(id)a5 targetScale:(double)a6
{
  id v10;
  id v11;
  double v12;
  float v13;
  double v14;
  long double v15;
  long double v16;
  id v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  id v22;

  v22 = a3;
  v10 = a4;
  v11 = a5;
  -[PXGExposureBlurKernel multiplier](self, "multiplier");
  v13 = v12;
  -[PXGExposureBlurKernel exposure](self, "exposure");
  v15 = fabs(v14);
  if (v15 > 0.001)
  {
    -[PXGExposureBlurKernel exposure](self, "exposure");
    v15 = exp2(v16);
    *(float *)&v15 = v15;
    v13 = v13 * *(float *)&v15;
  }
  if (v13 != 1.0)
  {
    *(float *)&v15 = v13;
    -[PXGExposureBlurKernel _encodeExposure:texture:toCommandBuffer:](self, "_encodeExposure:texture:toCommandBuffer:", v10, v22, (double)v15);
  }
  v17 = objc_alloc(MEMORY[0x24BDDE3C8]);
  objc_msgSend(v22, "device");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGExposureBlurKernel radius](self, "radius");
  v20 = v19 * a6;
  *(float *)&v20 = v20;
  *(float *)&v20 = fabsf(*(float *)&v20);
  v21 = (void *)objc_msgSend(v17, "initWithDevice:sigma:", v18, v20);

  objc_msgSend(v21, "setLabel:", CFSTR("PXGExposureBlur.gaussianBlur"));
  objc_msgSend(v21, "setEdgeMode:", 1);
  objc_msgSend(v21, "setOptions:", 2);
  objc_msgSend(v21, "encodeToCommandBuffer:sourceTexture:destinationTexture:", v22, v10, v11);

}

- (void)preloadWithDevice:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  _QWORD block[4];
  id v9;

  v3 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__PXGExposureBlurKernel_preloadWithDevice___block_invoke;
  block[3] = &unk_251A6E710;
  v9 = v3;
  v4 = preloadWithDevice__onceToken;
  v5 = v3;
  v7 = v5;
  if (v4 == -1)
  {
    v6 = v5;
  }
  else
  {
    dispatch_once(&preloadWithDevice__onceToken, block);
    v6 = v9;
  }

}

- (double)radius
{
  return self->_radius;
}

- (void)setRadius:(double)a3
{
  self->_radius = a3;
}

- (double)exposure
{
  return self->_exposure;
}

- (void)setExposure:(double)a3
{
  self->_exposure = a3;
}

- (double)multiplier
{
  return self->_multiplier;
}

- (void)setMultiplier:(double)a3
{
  self->_multiplier = a3;
}

void __43__PXGExposureBlurKernel_preloadWithDevice___block_invoke(uint64_t a1)
{
  id v2;
  double v3;

  v2 = objc_alloc(MEMORY[0x24BDDE3C8]);
  LODWORD(v3) = 1.0;

}

+ (id)_exposurePipelineStateForDevice:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v13;
  id v14;

  v4 = a3;
  v5 = a1;
  objc_sync_enter(v5);
  objc_getAssociatedObject(v4, sel__exposurePipelineStateForDevice_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    v8 = (void *)objc_msgSend(v4, "newDefaultLibraryWithBundle:error:", v7, &v14);
    v9 = v14;

    if (v8)
    {
      v10 = (void *)objc_msgSend(v8, "newFunctionWithName:", CFSTR("PXGExposure"));
      if (v10)
      {
        v13 = v9;
        v6 = (void *)objc_msgSend(v4, "newComputePipelineStateWithFunction:error:", v10, &v13);
        v11 = v13;

        if (v6)
        {
          objc_setAssociatedObject(v4, sel__exposurePipelineStateForDevice_, v6, (void *)0x301);
        }
        else
        {
          NSLog(CFSTR("*** could not load Metal library: %@"), v11);
          v6 = 0;
        }
      }
      else
      {
        NSLog(CFSTR("*** could not load Metal kernel"));
        v6 = 0;
        v11 = v9;
      }

      v9 = v11;
    }
    else
    {
      NSLog(CFSTR("*** could not load Metal library: %@"), v9);
      v6 = 0;
    }

  }
  objc_sync_exit(v5);

  return v6;
}

@end
