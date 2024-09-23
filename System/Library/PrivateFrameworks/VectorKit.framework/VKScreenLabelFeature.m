@implementation VKScreenLabelFeature

- (VKScreenLabelFeature)initWithCGImage:(CGImage *)a3 scale:(double)a4 type:(unsigned int)a5
{
  VKScreenLabelFeature *v8;
  VKScreenLabelFeature *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)VKScreenLabelFeature;
  v8 = -[VKScreenLabelFeature init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_type = a5;
    v8->_image = CGImageRetain(a3);
    v9->_scale = a4;
  }
  return v9;
}

- (void)dealloc
{
  CGImage *image;
  objc_super v4;

  image = self->_image;
  if (image)
    CGImageRelease(image);
  v4.receiver = self;
  v4.super_class = (Class)VKScreenLabelFeature;
  -[VKScreenLabelFeature dealloc](&v4, sel_dealloc);
}

- (unsigned)type
{
  return self->_type;
}

- (CGPoint)position
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->_position, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setPosition:(CGPoint)a3
{
  CGPoint v3;

  v3 = a3;
  objc_copyStruct(&self->_position, &v3, 16, 1, 0);
}

- (CGImage)image
{
  return self->_image;
}

- (double)scale
{
  return self->_scale;
}

@end
