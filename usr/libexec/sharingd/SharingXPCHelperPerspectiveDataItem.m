@implementation SharingXPCHelperPerspectiveDataItem

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SharingXPCHelperPerspectiveDataItem)init
{
  NSData *v3;
  NSData *v4;
  SharingXPCHelperPerspectiveDataItem *v5;

  v3 = objc_opt_new(NSData);
  v4 = objc_opt_new(NSData);
  v5 = -[SharingXPCHelperPerspectiveDataItem initWithPerspectiveData:perspectiveDataSize:CGImageData:](self, "initWithPerspectiveData:perspectiveDataSize:CGImageData:", v3, v4, 0.0, 0.0);

  return v5;
}

- (SharingXPCHelperPerspectiveDataItem)initWithPerspectiveData:(id)a3 perspectiveDataSize:(CGSize)a4 CGImageData:(id)a5
{
  CGFloat height;
  CGFloat width;
  id v10;
  id v11;
  SharingXPCHelperPerspectiveDataItem *v12;
  SharingXPCHelperPerspectiveDataItem *v13;
  objc_super v15;

  height = a4.height;
  width = a4.width;
  v10 = a3;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SharingXPCHelperPerspectiveDataItem;
  v12 = -[SharingXPCHelperPerspectiveDataItem init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_perspectiveData, a3);
    v13->_perspectiveDataSize.width = width;
    v13->_perspectiveDataSize.height = height;
    objc_storeStrong((id *)&v13->_CGImageData, a5);
  }

  return v13;
}

- (id)description
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *perspectiveData;
  double v5;
  double v6;
  double v7;
  NSData *CGImageData;
  id v9;

  v9 = a3;
  perspectiveData = self->_perspectiveData;
  if (perspectiveData)
    objc_msgSend(v9, "encodeObject:forKey:", perspectiveData, CFSTR("SharingXPCHelperPerspectiveDataItem-PerspectiveData"));
  -[SharingXPCHelperPerspectiveDataItem perspectiveDataSize](self, "perspectiveDataSize");
  *(float *)&v5 = v5;
  objc_msgSend(v9, "encodeFloat:forKey:", CFSTR("SharingXPCHelperPerspectiveDataItem-PerspectiveDataWidth"), v5);
  -[SharingXPCHelperPerspectiveDataItem perspectiveDataSize](self, "perspectiveDataSize");
  *(float *)&v7 = v6;
  objc_msgSend(v9, "encodeFloat:forKey:", CFSTR("SharingXPCHelperPerspectiveDataItem-PerspectiveDataHeight"), v7);
  CGImageData = self->_CGImageData;
  if (CGImageData)
    objc_msgSend(v9, "encodeObject:forKey:", CGImageData, CFSTR("SharingXPCHelperPerspectiveDataItem-CGImageData"));

}

- (SharingXPCHelperPerspectiveDataItem)initWithCoder:(id)a3
{
  id v4;
  SharingXPCHelperPerspectiveDataItem *v5;
  id v6;
  uint64_t v7;
  float v8;
  CGFloat v9;
  float v10;
  id v11;
  uint64_t v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SharingXPCHelperPerspectiveDataItem;
  v5 = -[SharingXPCHelperPerspectiveDataItem init](&v14, "init");
  if (v5)
  {
    v6 = v4;
    v7 = objc_opt_class(NSData);
    NSDecodeObjectIfPresent(v6, CFSTR("SharingXPCHelperPerspectiveDataItem-PerspectiveData"), v7, &v5->_perspectiveData);

    objc_msgSend(v6, "decodeFloatForKey:", CFSTR("SharingXPCHelperPerspectiveDataItem-PerspectiveDataWidth"));
    v9 = v8;
    objc_msgSend(v6, "decodeFloatForKey:", CFSTR("SharingXPCHelperPerspectiveDataItem-PerspectiveDataHeight"));
    v5->_perspectiveDataSize.width = v9;
    v5->_perspectiveDataSize.height = v10;
    v11 = v6;
    v12 = objc_opt_class(NSData);
    NSDecodeObjectIfPresent(v11, CFSTR("SharingXPCHelperPerspectiveDataItem-CGImageData"), v12, &v5->_CGImageData);

  }
  return v5;
}

- (NSData)perspectiveData
{
  return self->_perspectiveData;
}

- (CGSize)perspectiveDataSize
{
  double width;
  double height;
  CGSize result;

  width = self->_perspectiveDataSize.width;
  height = self->_perspectiveDataSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (NSData)CGImageData
{
  return self->_CGImageData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_CGImageData, 0);
  objc_storeStrong((id *)&self->_perspectiveData, 0);
}

@end
