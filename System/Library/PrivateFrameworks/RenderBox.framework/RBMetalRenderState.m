@implementation RBMetalRenderState

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RBMetalRenderState;
  -[RBMetalRenderState dealloc](&v3, sel_dealloc);
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_flags = a3;
}

- (int)blendMode
{
  return self->_blendMode;
}

- (void)setBlendMode:(int)a3
{
  self->_blendMode = a3;
}

- (float)alpha
{
  return self->_alpha;
}

- (void)setAlpha:(float)a3
{
  self->_alpha = a3;
}

- (MTLCommandBuffer)commandBuffer
{
  return self->_commandBuffer;
}

- (void)setCommandBuffer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (MTLRenderPassDescriptor)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (unint64_t)formatKey
{
  return self->_formatKey;
}

- (void)setFormatKey:(unint64_t)a3
{
  self->_formatKey = a3;
}

- (MTLRenderCommandEncoder)encoder
{
  return self->_encoder;
}

- (void)setEncoder:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- ($3CC19D079FD0B010EE84973AA846B91B)bounds
{
  __int128 v3;

  v3 = *(_OWORD *)&self[2].var3;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[2].var1;
  *(_OWORD *)&retstr->var2 = v3;
  return self;
}

- (void)setBounds:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  *(_OWORD *)&self->_bounds.width = *(_OWORD *)&a3->var2;
  *(_OWORD *)&self->_bounds.x = v3;
}

- (CGAffineTransform)CTM
{
  __int128 v3;

  v3 = *(_OWORD *)&self[2].d;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[2].b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[2].ty;
  return self;
}

- (void)setCTM:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_CTM.tx = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_CTM.c = v4;
  *(_OWORD *)&self->_CTM.a = v3;
}

@end
