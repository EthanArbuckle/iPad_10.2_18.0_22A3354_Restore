@implementation BICImageMetadata

- (BICImageMetadata)initWithIdentifier:(id)a3 intrinsicAspectRatio:(id)a4 imageColor:(id)a5
{
  id v8;
  id v9;
  id v10;
  BICImageMetadata *v11;
  NSString *v12;
  NSString *identifier;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BICImageMetadata;
  v11 = -[BICImageMetadata init](&v15, "init");
  if (v11)
  {
    v12 = (NSString *)objc_msgSend(v8, "copy");
    identifier = v11->_identifier;
    v11->_identifier = v12;

    objc_storeStrong((id *)&v11->_intrinsicAspectRatio, a4);
    objc_storeStrong((id *)&v11->_imageColor, a5);
  }

  return v11;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)intrinsicAspectRatio
{
  return self->_intrinsicAspectRatio;
}

- (void)setIntrinsicAspectRatio:(id)a3
{
  objc_storeStrong((id *)&self->_intrinsicAspectRatio, a3);
}

- (UIColor)imageColor
{
  return self->_imageColor;
}

- (void)setImageColor:(id)a3
{
  objc_storeStrong((id *)&self->_imageColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageColor, 0);
  objc_storeStrong((id *)&self->_intrinsicAspectRatio, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
