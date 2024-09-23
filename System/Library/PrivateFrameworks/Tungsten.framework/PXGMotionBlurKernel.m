@implementation PXGMotionBlurKernel

- (void)encodeToCommandBuffer:(id)a3 sourceTexture:(id)a4 destinationTexture:(id)a5 targetScale:(double)a6
{
  id v9;
  id v10;
  double size;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  MPSImageBox *v18;
  MPSImageBox *boxKernel;
  id v20;

  v20 = a3;
  v9 = a4;
  v10 = a5;
  size = self->_size;
  if (self->_direction == 1)
  {
    v12 = 1;
    v13 = (2 * vcvtad_u64_f64(fabs(size * (double)(unint64_t)objc_msgSend(v9, "width")) * 0.5)) | 1;
  }
  else
  {
    v13 = 1;
    v12 = (2 * vcvtad_u64_f64(fabs(size * (double)(unint64_t)objc_msgSend(v9, "height")) * 0.5)) | 1;
  }
  if (self->_boxKernel
    || objc_msgSend(0, "kernelWidth") != v12
    || -[MPSImageBox kernelHeight](self->_boxKernel, "kernelHeight") != v13
    || (-[MPSImageBox device](self->_boxKernel, "device"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v20, "device"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v15,
        v14,
        v14 != v15))
  {
    v16 = objc_alloc(MEMORY[0x24BDDE390]);
    objc_msgSend(v20, "device");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (MPSImageBox *)objc_msgSend(v16, "initWithDevice:kernelWidth:kernelHeight:", v17, v12, v13);
    boxKernel = self->_boxKernel;
    self->_boxKernel = v18;

    -[MPSImageBox setEdgeMode:](self->_boxKernel, "setEdgeMode:", 0);
    -[MPSImageBox setOptions:](self->_boxKernel, "setOptions:", 2);
    -[MPSImageBox setLabel:](self->_boxKernel, "setLabel:", CFSTR("PXGMotionBlur"));
  }
  -[MPSImageBox encodeToCommandBuffer:sourceTexture:destinationTexture:](self->_boxKernel, "encodeToCommandBuffer:sourceTexture:destinationTexture:", v20, v9, v10);

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
  block[2] = __41__PXGMotionBlurKernel_preloadWithDevice___block_invoke;
  block[3] = &unk_251A6E710;
  v9 = v3;
  v4 = preloadWithDevice__onceToken_1065[0];
  v5 = v3;
  v7 = v5;
  if (v4 == -1)
  {
    v6 = v5;
  }
  else
  {
    dispatch_once(preloadWithDevice__onceToken_1065, block);
    v6 = v9;
  }

}

- (int64_t)direction
{
  return self->_direction;
}

- (void)setDirection:(int64_t)a3
{
  self->_direction = a3;
}

- (double)size
{
  return self->_size;
}

- (void)setSize:(double)a3
{
  self->_size = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boxKernel, 0);
}

void __41__PXGMotionBlurKernel_preloadWithDevice___block_invoke(uint64_t a1)
{

}

@end
