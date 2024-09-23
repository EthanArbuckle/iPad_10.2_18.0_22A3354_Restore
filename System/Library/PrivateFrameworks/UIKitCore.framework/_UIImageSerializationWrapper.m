@implementation _UIImageSerializationWrapper

- (_UIImageSerializationWrapper)initWithImage:(id)a3
{
  id v5;
  _UIImageSerializationWrapper *v6;
  _UIImageSerializationWrapper *v7;

  v5 = a3;
  v6 = -[_UIImageSerializationWrapper init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_image, a3);

  return v7;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[UIImage encodeWithCoder:](self->_image, "encodeWithCoder:", v5);
  _UIImageName(self->_image);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UIImage _canEncodeWithName:coder:](self->_image, "_canEncodeWithName:coder:", v4, v5))
  {
    -[UIImage _encodeDataWithCoder:imageName:](self->_image, "_encodeDataWithCoder:imageName:", v5, v4);
    -[UIImage _encodePropertiesWithCoder:](self->_image, "_encodePropertiesWithCoder:", v5);
  }

}

- (_UIImageSerializationWrapper)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIImageSerializationWrapper;
  return -[_UIImageSerializationWrapper init](&v4, sel_init, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
}

@end
