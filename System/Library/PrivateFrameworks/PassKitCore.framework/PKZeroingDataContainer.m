@implementation PKZeroingDataContainer

- (PKZeroingDataContainer)initWithData:(id)a3
{
  id v5;
  PKZeroingDataContainer *v6;
  PKZeroingDataContainer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKZeroingDataContainer;
  v6 = -[PKZeroingDataContainer init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_data, a3);

  return v7;
}

- (void)dealloc
{
  rsize_t v3;
  objc_super v4;

  v3 = -[NSData length](self->_data, "length");
  if (v3)
    memset_s((void *)-[NSData bytes](self->_data, "bytes"), v3, 0, v3);
  v4.receiver = self;
  v4.super_class = (Class)PKZeroingDataContainer;
  -[PKZeroingDataContainer dealloc](&v4, sel_dealloc);
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
