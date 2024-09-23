@implementation PKDisplayTraitCollection

- (void)setCanvasSize:(CGSize)a3
{
  self->_canvasSize = a3;
}

- (void)setCanvasScale:(double)a3
{
  self->_canvasScale = a3;
}

- (PKDisplayTraitCollection)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKDisplayTraitCollection;
  return -[PKDisplayTraitCollection init](&v3, sel_init);
}

- (CGSize)canvasSize
{
  double width;
  double height;
  CGSize result;

  width = self->_canvasSize.width;
  height = self->_canvasSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)canvasScale
{
  return self->_canvasScale;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKDisplayTraitCollection)initWithDefaultTraits
{
  PKDisplayTraitCollection *v2;
  CGFloat v3;

  v2 = -[PKDisplayTraitCollection init](self, "init");
  if (v2)
  {
    v2->_canvasSize.width = PKScreenSize();
    v2->_canvasSize.height = v3;
    v2->_canvasScale = PKScreenScale();
  }
  return v2;
}

- (PKDisplayTraitCollection)initWithCoder:(id)a3
{
  id v4;
  PKDisplayTraitCollection *v5;
  CGFloat v6;
  CGFloat v7;
  double v8;

  v4 = a3;
  v5 = -[PKDisplayTraitCollection init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeSizeForKey:", CFSTR("size"));
    v5->_canvasSize.width = v6;
    v5->_canvasSize.height = v7;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("scale"));
    v5->_canvasScale = v8;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double width;
  double height;
  id v6;

  width = self->_canvasSize.width;
  height = self->_canvasSize.height;
  v6 = a3;
  objc_msgSend(v6, "encodeSize:forKey:", CFSTR("size"), width, height);
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("scale"), self->_canvasScale);

}

@end
