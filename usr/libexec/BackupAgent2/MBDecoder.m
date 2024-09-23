@implementation MBDecoder

+ (id)decoderWithData:(id)a3
{
  return -[MBDecoder initWithData:]([MBDecoder alloc], "initWithData:", a3);
}

- (MBDecoder)initWithData:(id)a3
{
  char *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MBDecoder;
  v4 = -[MBDecoder init](&v6, "init");
  if (v4)
  {
    *((_QWORD *)v4 + 3) = a3;
    *(_OWORD *)(v4 + 8) = xmmword_10009D230;
  }
  return (MBDecoder *)v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MBDecoder;
  -[MBDecoder dealloc](&v3, "dealloc");
}

- (unint64_t)offset
{
  return self->_offset;
}

- (void)setOffset:(unint64_t)a3
{
  if (-[NSData length](self->_data, "length") < a3)
    objc_exception_throw(objc_msgSend(objc_alloc((Class)MBException), "initWithCode:format:", 12, CFSTR("Offset out of range: offset=%lu, length=%lu"), a3, -[NSData length](self->_data, "length")));
  self->_offset = a3;
}

- (BOOL)isDone
{
  unint64_t offset;

  offset = self->_offset;
  return offset == -[NSData length](self->_data, "length");
}

- (char)decodeInt8
{
  char v3;

  v3 = 0;
  -[MBDecoder decodeBytes:length:](self, "decodeBytes:length:", &v3, 1);
  return v3;
}

- (signed)decodeInt16
{
  unsigned __int16 v4;

  v4 = 0;
  -[MBDecoder decodeBytes:length:](self, "decodeBytes:length:", &v4, 2);
  return (int)bswap32(v4) >> 16;
}

- (int)decodeInt32
{
  unsigned int v3;

  v3 = 0;
  -[MBDecoder decodeBytes:length:](self, "decodeBytes:length:", &v3, 4);
  return bswap32(v3);
}

- (int64_t)decodeInt64
{
  unint64_t v3;

  v3 = 0;
  -[MBDecoder decodeBytes:length:](self, "decodeBytes:length:", &v3, 8);
  return bswap64(v3);
}

- (double)decodeVersion
{
  int v3;
  int v4;
  id v6;

  v3 = -[MBDecoder decodeInt8](self, "decodeInt8");
  v4 = -[MBDecoder decodeInt8](self, "decodeInt8");
  if (v3 <= 0)
  {
    v6 = objc_msgSend(objc_alloc((Class)MBException), "initWithCode:format:", 11, CFSTR("Invalid major version: %d"), v3);
    goto LABEL_6;
  }
  if (v4 >= 0xA)
  {
    v6 = objc_msgSend(objc_alloc((Class)MBException), "initWithCode:format:", 11, CFSTR("Invalid minor version: %d"), v4);
LABEL_6:
    objc_exception_throw(v6);
  }
  return (double)v3 + (double)v4 * 0.1;
}

- (id)decodeData
{
  unsigned int v3;
  uint64_t v4;
  void *v5;

  v3 = -[MBDecoder decodeInt16](self, "decodeInt16");
  if ((v3 & 0x80000000) != 0)
    return 0;
  v4 = (unsigned __int16)v3;
  v5 = malloc_type_malloc((unsigned __int16)v3, 0xCC141341uLL);
  -[MBDecoder decodeBytes:length:](self, "decodeBytes:length:", v5, v4);
  return objc_msgSend(objc_alloc((Class)NSData), "initWithBytesNoCopy:length:freeWhenDone:", v5, v4, 1);
}

- (id)decodeDate
{
  int v2;

  v2 = -[MBDecoder decodeInt32](self, "decodeInt32");
  if (v2 < 0)
    return 0;
  else
    return +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", (double)v2);
}

- (id)decodeString
{
  unsigned int v3;
  uint64_t v4;
  void *v5;

  v3 = -[MBDecoder decodeInt16](self, "decodeInt16");
  if ((v3 & 0x80000000) != 0)
    return 0;
  v4 = (unsigned __int16)v3;
  v5 = malloc_type_malloc((unsigned __int16)v3, 0xEB8AF092uLL);
  -[MBDecoder decodeBytes:length:](self, "decodeBytes:length:", v5, v4);
  return objc_msgSend(objc_alloc((Class)NSString), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v5, v4, 4, 1);
}

- (void)decodeBytes:(void *)a3 length:(unint64_t)a4
{
  unint64_t v7;

  v7 = self->_offset + a4;
  if (v7 > -[NSData length](self->_data, "length"))
    objc_exception_throw(objc_msgSend(objc_alloc((Class)MBException), "initWithCode:format:", 12, CFSTR("Bytes out of range: bytes=%lu, offset=%lu, length=%lu"), a4, self->_offset, -[NSData length](self->_data, "length")));
  -[NSData getBytes:range:](self->_data, "getBytes:range:", a3, self->_offset, a4);
  self->_offset += a4;
}

- (void)mark
{
  self->_mark = self->_offset;
}

- (void)reset
{
  unint64_t mark;

  mark = self->_mark;
  if ((mark & 0x8000000000000000) != 0)
  {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBDecoder.m"), 138, CFSTR("Mark not set"));
    mark = self->_mark;
  }
  self->_offset = mark;
  self->_mark = -1;
}

- (void)close
{

  self->_data = 0;
}

- (NSData)data
{
  return self->_data;
}

@end
