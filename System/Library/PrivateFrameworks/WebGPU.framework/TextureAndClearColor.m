@implementation TextureAndClearColor

- (TextureAndClearColor)initWithTexture:(id)a3
{
  id v5;
  TextureAndClearColor *v6;
  TextureAndClearColor *v7;
  TextureAndClearColor *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TextureAndClearColor;
  v6 = -[TextureAndClearColor init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_texture, a3);
    *(_OWORD *)&v7->_clearColor.blue = 0u;
    *(_OWORD *)&v7->_clearColor.red = 0u;
    v8 = v7;
  }

  return v7;
}

- (MTLTexture)texture
{
  return self->_texture;
}

- (void)setTexture:(id)a3
{
  objc_storeStrong((id *)&self->_texture, a3);
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)clearColor
{
  double red;
  double green;
  double blue;
  double alpha;
  $01BB1521EC52D44A8E7628F5261DCEC8 result;

  red = self->_clearColor.red;
  green = self->_clearColor.green;
  blue = self->_clearColor.blue;
  alpha = self->_clearColor.alpha;
  result.var3 = alpha;
  result.var2 = blue;
  result.var1 = green;
  result.var0 = red;
  return result;
}

- (void)setClearColor:(id)a3
{
  self->_clearColor = ($3ED934EFF50B3E737D3D4A62C605F33B)a3;
}

- (unint64_t)depthPlane
{
  return self->_depthPlane;
}

- (void)setDepthPlane:(unint64_t)a3
{
  self->_depthPlane = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_texture, 0);
}

@end
