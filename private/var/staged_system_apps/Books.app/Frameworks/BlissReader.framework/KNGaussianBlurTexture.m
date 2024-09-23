@implementation KNGaussianBlurTexture

- (KNGaussianBlurTexture)initWithTextureName:(unsigned int)a3 frame:(CGRect)a4 blurAmount:(double)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  KNGaussianBlurTexture *result;
  objc_super v12;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v12.receiver = self;
  v12.super_class = (Class)KNGaussianBlurTexture;
  result = -[KNGaussianBlurTexture init](&v12, "init");
  if (result)
  {
    result->_textureName = a3;
    result->_frame.origin.y = y;
    result->_frame.size.width = width;
    result->_frame.size.height = height;
    result->_blurAmount = a5;
    result->_frame.origin.x = x;
    result->_isMetalTexture = 0;
  }
  return result;
}

- (KNGaussianBlurTexture)initWithMetalTexture:(id)a3 frame:(CGRect)a4 blurAmount:(double)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v12;
  KNGaussianBlurTexture *v13;
  KNGaussianBlurTexture *v14;
  objc_super v16;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v12 = a3;
  v16.receiver = self;
  v16.super_class = (Class)KNGaussianBlurTexture;
  v13 = -[KNGaussianBlurTexture init](&v16, "init");
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_texture, a3);
    v14->_frame.origin.y = y;
    v14->_frame.size.width = width;
    v14->_frame.size.height = height;
    v14->_blurAmount = a5;
    v14->_frame.origin.x = x;
    v14->_isMetalTexture = 1;
  }

  return v14;
}

- (void)teardown
{
  MTLTexture *texture;

  if (-[KNGaussianBlurTexture isMetalTexture](self, "isMetalTexture"))
  {
    texture = self->_texture;
    self->_texture = 0;

  }
  self->_didTeardown = 1;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  if (!self->_didTeardown)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNGaussianBlurTexture dealloc]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/KNGaussianBlurEffect.m"));
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, v5, 111, CFSTR("Didn't call -teardown! Leaking!!"));

  }
  v6.receiver = self;
  v6.super_class = (Class)KNGaussianBlurTexture;
  -[KNGaussianBlurTexture dealloc](&v6, "dealloc");
}

- (id)description
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSString *v8;
  void *v9;
  NSString *v10;
  void *v11;
  void *v12;
  objc_super v14;
  CGRect v15;
  CGRect v16;

  v14.receiver = self;
  v14.super_class = (Class)KNGaussianBlurTexture;
  v3 = -[KNGaussianBlurTexture description](&v14, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = -[KNGaussianBlurTexture textureName](self, "textureName");
  -[KNGaussianBlurTexture blurAmount](self, "blurAmount");
  v7 = v6;
  -[KNGaussianBlurTexture frame](self, "frame");
  v8 = NSStringFromCGRect(v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  -[KNGaussianBlurTexture bounds](self, "bounds");
  v10 = NSStringFromCGRect(v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: name:%d, blur:%0.1f, frame:%@, bounds:%@"), v4, v5, v7, v9, v11));

  return v12;
}

- (MTLTexture)texture
{
  return self->_texture;
}

- (void)setTexture:(id)a3
{
  objc_storeStrong((id *)&self->_texture, a3);
}

- (CGRect)frame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frame.origin.x;
  y = self->_frame.origin.y;
  width = self->_frame.size.width;
  height = self->_frame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  self->_frame = a3;
}

- (CGRect)bounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_bounds.origin.x;
  y = self->_bounds.origin.y;
  width = self->_bounds.size.width;
  height = self->_bounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  self->_bounds = a3;
}

- (double)blurAmount
{
  return self->_blurAmount;
}

- (void)setBlurAmount:(double)a3
{
  self->_blurAmount = a3;
}

- (BOOL)isMetalTexture
{
  return self->_isMetalTexture;
}

- (unsigned)textureName
{
  return self->_textureName;
}

- (void)setTextureName:(unsigned int)a3
{
  self->_textureName = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_texture, 0);
}

@end
