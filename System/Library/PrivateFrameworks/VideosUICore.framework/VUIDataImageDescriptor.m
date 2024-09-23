@implementation VUIDataImageDescriptor

- (VUIDataImageDescriptor)initWithData:(id)a3
{
  id v5;
  VUIDataImageDescriptor *v6;
  VUIDataImageDescriptor *v7;
  CGSize v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VUIDataImageDescriptor;
  v6 = -[VUIDataImageDescriptor init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_data, a3);
    v8 = (CGSize)*MEMORY[0x1E0C9D820];
    v7->_renderSize = (CGSize)*MEMORY[0x1E0C9D820];
    v7->_backgroundSize = v8;
    v7->_scaleWithinRenderSize = 1.0;
  }

  return v7;
}

- (NSData)data
{
  return self->_data;
}

- (CGSize)renderSize
{
  double width;
  double height;
  CGSize result;

  width = self->_renderSize.width;
  height = self->_renderSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setRenderSize:(CGSize)a3
{
  self->_renderSize = a3;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (CGSize)backgroundSize
{
  double width;
  double height;
  CGSize result;

  width = self->_backgroundSize.width;
  height = self->_backgroundSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setBackgroundSize:(CGSize)a3
{
  self->_backgroundSize = a3;
}

- (double)scaleWithinRenderSize
{
  return self->_scaleWithinRenderSize;
}

- (void)setScaleWithinRenderSize:(double)a3
{
  self->_scaleWithinRenderSize = a3;
}

- (BOOL)shouldRenderAsTemplate
{
  return self->_renderAsTemplate;
}

- (void)setRenderAsTemplate:(BOOL)a3
{
  self->_renderAsTemplate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
