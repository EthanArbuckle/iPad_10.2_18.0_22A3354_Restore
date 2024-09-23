@implementation TVRMSDAAPEncoder

- (TVRMSDAAPEncoder)init
{
  TVRMSDAAPEncoder *v2;
  NSMutableData *v3;
  NSMutableData *data;
  TVRMSDAAPEncoder *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TVRMSDAAPEncoder;
  v2 = -[TVRMSDAAPEncoder init](&v7, sel_init);
  if (v2)
  {
    v3 = (NSMutableData *)objc_alloc_init(MEMORY[0x24BDBCEC8]);
    data = v2->_data;
    v2->_data = v3;

    v5 = v2;
  }

  return v2;
}

- (void)encodeInt32:(int)a3 forCode:(unsigned int)a4
{
  unsigned int v4;

  v4 = bswap32(a3);
  -[TVRMSDAAPEncoder encodeBytes:length:forCode:](self, "encodeBytes:length:forCode:", &v4, 4, *(_QWORD *)&a4);
}

- (void)encodeInt64:(int64_t)a3 forCode:(unsigned int)a4
{
  unint64_t v4;

  v4 = bswap64(a3);
  -[TVRMSDAAPEncoder encodeBytes:length:forCode:](self, "encodeBytes:length:forCode:", &v4, 8, *(_QWORD *)&a4);
}

- (void)encodeString:(id)a3 forCode:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  unint64_t v7;
  id v8;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  if (v6)
  {
    v8 = v6;
    v7 = objc_msgSend(v6, "lengthOfBytesUsingEncoding:", 4);
    v6 = v8;
    if (!HIDWORD(v7))
    {
      -[TVRMSDAAPEncoder encodeBytes:length:forCode:](self, "encodeBytes:length:forCode:", objc_msgSend(objc_retainAutorelease(v8), "UTF8String"), v7, v4);
      v6 = v8;
    }
  }

}

- (void)encodeData:(id)a3 forCode:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  uint64_t v7;
  uint64_t v8;

  if (a3)
  {
    v4 = *(_QWORD *)&a4;
    v6 = objc_retainAutorelease(a3);
    v7 = objc_msgSend(v6, "bytes");
    v8 = objc_msgSend(v6, "length");

    -[TVRMSDAAPEncoder encodeBytes:length:forCode:](self, "encodeBytes:length:forCode:", v7, v8, v4);
  }
}

- (void)encodeBytes:(const char *)a3 length:(unint64_t)a4 forCode:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;

  if (a4 - 0x100000000 >= 0xFFFFFFFF00000001)
  {
    v12 = v5;
    v13 = v6;
    v11 = bswap32(a5);
    -[NSMutableData appendBytes:length:](self->_data, "appendBytes:length:", &v11, 4);
    v10 = bswap32(a4);
    -[NSMutableData appendBytes:length:](self->_data, "appendBytes:length:", &v10, 4);
    -[NSMutableData appendBytes:length:](self->_data, "appendBytes:length:", a3, a4);
  }
}

- (NSData)data
{
  return &self->_data->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
