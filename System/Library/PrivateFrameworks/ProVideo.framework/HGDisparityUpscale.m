@implementation HGDisparityUpscale

- (HGDisparityUpscale)initWithDevice:(id)a3 disparitySize:(CGSize)a4 colorSize:(CGSize)a5 portraitUtil:(id)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat v8;
  CGFloat v9;
  HGDisparityUpscale *result;
  objc_super v12;

  height = a5.height;
  width = a5.width;
  v8 = a4.height;
  v9 = a4.width;
  v12.receiver = self;
  v12.super_class = (Class)HGDisparityUpscale;
  result = -[HGDisparityUpscale init](&v12, sel_init, a3, a6);
  if (result)
  {
    result->_colorSize.width = width;
    result->_colorSize.height = height;
    result->_depthSize.width = v9;
    result->_depthSize.height = v8;
    result->_device = (MTLDevice *)a3;
    result->_depthTex = 0;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HGDisparityUpscale;
  -[HGDisparityUpscale dealloc](&v3, sel_dealloc);
}

- (id)newTextureArrayFromTexture:(id)a3
{
  if (objc_msgSend(a3, "textureType") == 3)
    return 0;
  else
    return (id)objc_msgSend(a3, "newTextureViewWithPixelFormat:textureType:levels:slices:", objc_msgSend(a3, "pixelFormat"), 3, 0, 1, 0, 1);
}

- (id)upscaleDisparity:(id)a3 inRGBA:(id)a4 commandBuffer:(id)a5
{
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;

  v9 = (void *)objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 25, (unint64_t)self->_colorSize.width, (unint64_t)self->_colorSize.height, 0);
  objc_msgSend(v9, "setUsage:", 19);
  self->_depthTex = (MTLTexture *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v9);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC6E08]), "initWithDevice:", self->_device);
  objc_msgSend(v10, "encodeToCommandBuffer:sourceTexture:destinationTexture:", a5, a3, self->_depthTex);
  v11 = -[HGDisparityUpscale newTextureArrayFromTexture:](self, "newTextureArrayFromTexture:", a3);
  v12 = -[HGDisparityUpscale newTextureArrayFromTexture:](self, "newTextureArrayFromTexture:", a4);
  v13 = -[HGDisparityUpscale newTextureArrayFromTexture:](self, "newTextureArrayFromTexture:", self->_depthTex);

  return self->_depthTex;
}

@end
