@implementation VGFloatArray

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *data;
  void *v5;
  id v6;

  v6 = a3;
  data = self->_data;
  NSStringFromSelector(sel_data);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", data, v5);

}

- (VGFloatArray)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  VGFloatArray *v8;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_data);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[VGFloatArray initWithData:](self, "initWithData:", v7);

  return v8;
}

- (VGFloatArray)initWithFloats:(const float *)a3 size:(unint64_t)a4
{
  void *v5;
  VGFloatArray *v6;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", a3, 4 * a4);
  v6 = -[VGFloatArray initWithData:](self, "initWithData:", v5);

  return v6;
}

- (VGFloatArray)initWithFloatsNoOwnership:(const float *)a3 size:(unint64_t)a4
{
  void *v5;
  VGFloatArray *v6;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytesNoCopy:length:freeWhenDone:", a3, 4 * a4, 0);
  v6 = -[VGFloatArray initWithData:](self, "initWithData:", v5);

  return v6;
}

- (VGFloatArray)initWithData:(id)a3
{
  id v5;
  VGFloatArray *v6;
  VGFloatArray *v7;
  VGFloatArray *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VGFloatArray;
  v6 = -[VGFloatArray init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_data, a3);
    v8 = v7;
  }

  return v7;
}

- (const)data
{
  return (const float *)-[NSData bytes](self->_data, "bytes");
}

- (unint64_t)size
{
  return -[NSData length](self->_data, "length") >> 2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
