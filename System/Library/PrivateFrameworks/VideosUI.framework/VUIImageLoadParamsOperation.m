@implementation VUIImageLoadParamsOperation

- (void)setScalingResult:(unint64_t)a3
{
  self->_scalingResult = a3;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (unint64_t)scalingResult
{
  return self->_scalingResult;
}

- (VUIImageLoadParams)params
{
  return self->_params;
}

- (VUIImageLoadParamsOperation)initWithParams:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5
{
  _BOOL4 v5;
  double height;
  double width;
  id v10;
  VUIImageLoadParamsOperation *v13;
  VUIImageLoadParamsOperation *v14;
  objc_super v16;

  v5 = a5;
  height = a4.height;
  width = a4.width;
  v10 = a3;
  if (width == *MEMORY[0x1E0C9D820] && height == *(double *)(MEMORY[0x1E0C9D820] + 8) && v5)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The cropToFit parameter cannot be set to YES when no scale size is given"));
  v16.receiver = self;
  v16.super_class = (Class)VUIImageLoadParamsOperation;
  v13 = -[VUIImageLoadParamsOperation init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_params, a3);
    v14->_scaleToSize.width = width;
    v14->_scaleToSize.height = height;
    v14->_cropToFit = v5;
  }

  return v14;
}

- (TVImage)image
{
  return self->_image;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_params, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

- (VUIImageLoadParamsOperation)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The %@ initializer is not available."), v5);

  return 0;
}

- (CGSize)scaleToSize
{
  double width;
  double height;
  CGSize result;

  width = self->_scaleToSize.width;
  height = self->_scaleToSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setScaleToSize:(CGSize)a3
{
  self->_scaleToSize = a3;
}

- (BOOL)cropToFit
{
  return self->_cropToFit;
}

- (void)setCropToFit:(BOOL)a3
{
  self->_cropToFit = a3;
}

- (void)setError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (void)setParams:(id)a3
{
  objc_storeStrong((id *)&self->_params, a3);
}

@end
