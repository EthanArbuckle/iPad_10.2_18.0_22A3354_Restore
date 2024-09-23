@implementation PKImageDescriptorBitmap

+ (id)createForImage:(id)a3 withTintColor:(int64_t)a4
{
  return (id)objc_msgSend(a1, "createForImage:withTintColor:hasBackground:", a3, a4, 1);
}

+ (id)createForImage:(id)a3 withTintColor:(int64_t)a4 hasBackground:(BOOL)a5
{
  id v8;
  id *v9;
  uint64_t v10;
  id v11;

  v8 = a3;
  if (v8)
  {
    v9 = (id *)+[PKImageDescriptor _createForType:withTintColor:hasBackground:]((uint64_t)PKImageDescriptor, 0, a4, a5);
    objc_storeStrong(v9 + 5, a3);
    objc_msgSend(v8, "imageHash");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v9[4];
    v9[4] = (id)v10;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKImageDescriptorBitmap)initWithCoder:(id)a3
{
  id v4;
  PKImageDescriptorBitmap *v5;
  uint64_t v6;
  PKImage *image;
  uint64_t v8;
  NSData *imageHash;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKImageDescriptorBitmap;
  v5 = -[PKImageDescriptor initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("image"));
    v6 = objc_claimAutoreleasedReturnValue();
    image = v5->_image;
    v5->_image = (PKImage *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageHash"));
    v8 = objc_claimAutoreleasedReturnValue();
    imageHash = v5->_imageHash;
    v5->_imageHash = (NSData *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKImageDescriptorBitmap;
  v4 = a3;
  -[PKImageDescriptor encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_image, CFSTR("image"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_imageHash, CFSTR("imageHash"));

}

- (PKImage)image
{
  return self->_image;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_imageHash, 0);
}

@end
