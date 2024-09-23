@implementation UIGradient

- (id)initVerticalWithValues:(id *)a3
{
  $3CC2805F0189FCCE51047C0D2B5A52A9 *v3;
  UIGradient *v4;
  int v5;
  unsigned int v6;
  double var4;
  size_t v8;
  $3CC2805F0189FCCE51047C0D2B5A52A9 *v9;
  objc_super v11;

  v3 = a3;
  v4 = self;
  if (!a3)
  {
    NSLog(CFSTR("-[UIGradient initAxialWithValues:] called with NULL values array"), a2);
    goto LABEL_12;
  }
  v5 = 0;
  do
  {
    v6 = v5 + 1;
    var4 = a3[v5++].var4;
  }
  while (var4 < 1.0);
  if (v6 > 1)
  {
    v11.receiver = self;
    v11.super_class = (Class)UIGradient;
    v4 = -[UIGradient init](&v11, sel_init, 1.0);
    if (v4)
    {
      v8 = 40 * v6;
      v9 = ($3CC2805F0189FCCE51047C0D2B5A52A9 *)malloc_type_malloc(v8, 0x10000400A747E1EuLL);
      v4->_values = v9;
      if (!v9)
        goto LABEL_6;
      memcpy(v9, v3, v8);
    }
    v4 = v4;
    v3 = ($3CC2805F0189FCCE51047C0D2B5A52A9 *)v4;
    goto LABEL_12;
  }
  NSLog(CFSTR("-[UIGradient initAxialWithValues:] requires at least 2 values for initialization"), a2, 1.0);
LABEL_6:
  v3 = 0;
LABEL_12:

  return v3;
}

- (void)fillRect:(CGRect)a3 inContext:(CGContext *)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v10;
  CGShading *shader;
  $3CC2805F0189FCCE51047C0D2B5A52A9 *values;
  CGFunction *v13;
  CGFunctionCallbacks v14;
  CGPoint v15;
  CGRect v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = self->_height;
  shader = self->_shader;
  if (a3.size.height == v10)
  {
    if (shader)
    {
LABEL_10:
      CGContextSaveGState(a4);
      v16.origin.x = x;
      v16.origin.y = y;
      v16.size.width = width;
      v16.size.height = height;
      CGContextClipToRect(a4, v16);
      CGContextTranslateCTM(a4, x, y);
      CGContextDrawShading(a4, self->_shader);
      CGContextRestoreGState(a4);
      return;
    }
  }
  else
  {
    if (shader)
    {
      CGShadingRelease(shader);
      self->_shader = 0;
    }
    self->_height = height;
  }
  if (!fillRect_inContext____gradientColorSpace)
    fillRect_inContext____gradientColorSpace = (uint64_t)CGColorSpaceCreateDeviceRGB();
  values = self->_values;
  *(_OWORD *)&v14.version = xmmword_1E16CAD70;
  v14.releaseInfo = 0;
  v13 = CGFunctionCreate(values, 1uLL, createGradientShaderFunction_domain, 4uLL, createGradientShaderFunction_range, &v14);
  v15.y = self->_height;
  v15.x = 0.0;
  self->_shader = CGShadingCreateAxial((CGColorSpaceRef)fillRect_inContext____gradientColorSpace, *MEMORY[0x1E0C9D538], v15, v13, 0, 0);
  CGFunctionRelease(v13);
  if (self->_shader)
    goto LABEL_10;
}

- (void)fillRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _QWORD *ContextStack;
  uint64_t v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1)
    v9 = 0;
  else
    v9 = ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  -[UIGradient fillRect:inContext:](self, "fillRect:inContext:", v9, x, y, width, height);
}

- (void)dealloc
{
  CGShading *shader;
  objc_super v4;

  shader = self->_shader;
  if (shader)
    CGShadingRelease(shader);
  free(self->_values);
  v4.receiver = self;
  v4.super_class = (Class)UIGradient;
  -[UIGradient dealloc](&v4, sel_dealloc);
}

@end
