@implementation VGMLFloatIOData

- (VGMLFloatIOData)initWithData:(id)a3
{
  id v5;
  VGMLFloatIOData *v6;
  VGMLFloatIOData *v7;
  VGMLFloatIOData *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VGMLFloatIOData;
  v6 = -[VGMLFloatIOData init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_data, a3);
    v8 = v7;
  }

  return v7;
}

- (VGMLFloatIOData)initWithSize:(unint64_t)a3 withData:(const float *)a4
{
  void *v5;
  VGMLFloatIOData *v6;

  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", a4, 4 * a3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[VGMLFloatIOData initWithData:](self, "initWithData:", v5);

  return v6;
}

- (unint64_t)getSize
{
  return -[NSData length](self->_data, "length") >> 2;
}

- (const)getData
{
  return (const float *)-[NSData bytes](self->_data, "bytes");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *data;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    data = self->_data;
    objc_msgSend(v4, "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NSData isEqual:](data, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSData)data
{
  return self->_data;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
