@implementation ICSInputData

- (ICSInputData)initWithData:(id)a3
{
  id v4;
  ICSInputData *v5;
  uint64_t v6;
  NSData *data;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICSInputData;
  v5 = -[ICSInputData init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    data = v5->_data;
    v5->_data = (NSData *)v6;

    v5->_cursor = 0;
    v5->_rawData = (char *)-[NSData bytes](v5->_data, "bytes");
    v5->_length = -[NSData length](v5->_data, "length");
  }

  return v5;
}

- (char)read
{
  unint64_t cursor;
  char v3;

  cursor = self->_cursor;
  if (cursor >= self->_length)
    return 0;
  v3 = self->_rawData[cursor];
  self->_cursor = cursor + 1;
  return v3;
}

- (BOOL)eos
{
  return self->_cursor >= self->_length;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
