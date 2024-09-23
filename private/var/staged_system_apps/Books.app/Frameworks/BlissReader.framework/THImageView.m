@implementation THImageView

- (THImageView)initWithFrame:(CGRect)a3
{
  THImageView *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THImageView;
  result = -[THImageView initWithFrame:](&v4, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
  {
    result->mNativeSize.width = 0.0;
    result->mNativeSize.height = 0.0;
  }
  return result;
}

- (void)setImageData:(id)a3 maxSize:(CGSize)a4 setLayerBounds:(BOOL)a5
{
  _QWORD v5[5];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_11D830;
  v5[3] = &unk_429D50;
  v5[4] = a3;
  objc_msgSend(-[THImageView layer](self, "layer"), "setImageProviderBlock:setLayerBounds:maxSize:outNativeSize:", objc_msgSend(v5, "copy"), a5, &self->mNativeSize, a4.width, a4.height);
}

+ (Class)layerClass
{
  return (Class)objc_opt_class(THImageLayer, a2);
}

- (CGSize)nativeSize
{
  double width;
  double height;
  CGSize result;

  width = self->mNativeSize.width;
  height = self->mNativeSize.height;
  result.height = height;
  result.width = width;
  return result;
}

@end
