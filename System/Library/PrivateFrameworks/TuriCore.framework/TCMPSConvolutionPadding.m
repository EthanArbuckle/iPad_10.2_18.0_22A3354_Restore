@implementation TCMPSConvolutionPadding

+ (BOOL)supportsSecureCoding
{
  return 0;
}

- (TCMPSConvolutionPadding)initWithParams:(unint64_t)a3 paddingHeight:(unint64_t)a4 strideWidth:(unint64_t)a5 strideHeight:(unint64_t)a6
{
  TCMPSConvolutionPadding *result;

  result = -[TCMPSConvolutionPadding init](self, "init");
  if (result)
  {
    result->_paddingWidth = a3;
    result->_paddingHeight = a4;
    result->_strideWidth = a5;
    result->_strideHeight = a6;
  }
  return result;
}

- (unint64_t)paddingMethod
{
  return 0x4000;
}

- (id)destinationImageDescriptorForSourceImages:(id)a3 sourceStates:(id)a4 forKernel:(id)a5 suggestedDescriptor:(id)a6
{
  id v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  int paddingHeight;
  _QWORD v14[3];

  v8 = a6;
  v9 = a5;
  v10 = (int)(((unint64_t)objc_msgSend(v9, "kernelWidth") >> 1) - LODWORD(self->_paddingWidth));
  v11 = objc_msgSend(v9, "kernelHeight");
  paddingHeight = self->_paddingHeight;
  v14[0] = v10;
  v14[1] = (int)((v11 >> 1) - paddingHeight);
  v14[2] = 0;
  objc_msgSend(v9, "setOffset:", v14);
  objc_msgSend(v9, "setEdgeMode:", 0);

  objc_msgSend(v8, "setWidth:", objc_msgSend(v8, "width") + 2 * self->_paddingWidth / self->_strideWidth);
  objc_msgSend(v8, "setHeight:", objc_msgSend(v8, "height") + 2 * self->_paddingHeight / self->_strideHeight);
  return v8;
}

- (unint64_t)paddingWidth
{
  return self->_paddingWidth;
}

- (void)setPaddingWidth:(unint64_t)a3
{
  self->_paddingWidth = a3;
}

- (unint64_t)paddingHeight
{
  return self->_paddingHeight;
}

- (void)setPaddingHeight:(unint64_t)a3
{
  self->_paddingHeight = a3;
}

- (unint64_t)strideWidth
{
  return self->_strideWidth;
}

- (void)setStrideWidth:(unint64_t)a3
{
  self->_strideWidth = a3;
}

- (unint64_t)strideHeight
{
  return self->_strideHeight;
}

- (void)setStrideHeight:(unint64_t)a3
{
  self->_strideHeight = a3;
}

@end
