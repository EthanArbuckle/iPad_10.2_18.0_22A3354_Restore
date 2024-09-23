@implementation MBEncoder

+ (id)encoderToMemory
{
  NSOutputStream *v2;

  v2 = +[NSOutputStream outputStreamToMemory](NSOutputStream, "outputStreamToMemory");
  -[NSOutputStream open](v2, "open");
  return +[MBEncoder encoderWithOutputStream:](MBEncoder, "encoderWithOutputStream:", v2);
}

+ (id)encoderToFile:(id)a3 error:(id *)a4
{
  NSOutputStream *v5;

  v5 = +[NSOutputStream outputStreamToFileAtPath:append:](NSOutputStream, "outputStreamToFileAtPath:append:", a3, 0);
  -[NSOutputStream open](v5, "open");
  if (!-[NSOutputStream streamError](v5, "streamError"))
    return +[MBEncoder encoderWithOutputStream:](MBEncoder, "encoderWithOutputStream:", v5);
  if (a4)
    *a4 = -[NSOutputStream streamError](v5, "streamError");
  return 0;
}

+ (id)encoderWithOutputStream:(id)a3
{
  return -[MBEncoder initWithOutputStream:]([MBEncoder alloc], "initWithOutputStream:", a3);
}

- (MBEncoder)initWithOutputStream:(id)a3
{
  MBEncoder *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MBEncoder;
  v4 = -[MBEncoder init](&v6, "init");
  if (v4)
  {
    v4->_outputStream = (NSOutputStream *)a3;
    v4->_buffer = (NSMutableData *)objc_msgSend(objc_alloc((Class)NSMutableData), "initWithCapacity:", 0x4000);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MBEncoder;
  -[MBEncoder dealloc](&v3, "dealloc");
}

- (void)flush
{
  char *v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger i;
  NSInteger v7;

  v3 = (char *)-[NSMutableData bytes](self->_buffer, "bytes");
  v4 = -[NSMutableData length](self->_buffer, "length");
  if (v4)
  {
    v5 = v4;
    for (i = 0; i < v5; i += v7)
    {
      v7 = -[NSOutputStream write:maxLength:](self->_outputStream, "write:maxLength:", &v3[i], v5 - i);
      if (v7 < 0)
        objc_exception_throw(objc_msgSend(objc_alloc((Class)MBException), "initWithCode:format:", 100, CFSTR("Output stream write error: %@"), -[NSOutputStream streamError](self->_outputStream, "streamError")));
    }
  }
  -[NSMutableData setLength:](self->_buffer, "setLength:", 0);
}

- (void)close
{
  -[MBEncoder flush](self, "flush");
  -[NSOutputStream close](self->_outputStream, "close");
}

- (void)encodeInt8:(char)a3
{
  char v3;

  v3 = a3;
  -[MBEncoder encodeBytes:length:](self, "encodeBytes:length:", &v3, 1);
}

- (void)encodeInt16:(signed __int16)a3
{
  __int16 v3;

  v3 = bswap32(a3) >> 16;
  -[MBEncoder encodeBytes:length:](self, "encodeBytes:length:", &v3, 2);
}

- (void)encodeInt32:(int)a3
{
  unsigned int v3;

  v3 = bswap32(a3);
  -[MBEncoder encodeBytes:length:](self, "encodeBytes:length:", &v3, 4);
}

- (void)encodeInt64:(int64_t)a3
{
  unint64_t v3;

  v3 = bswap64(a3);
  -[MBEncoder encodeBytes:length:](self, "encodeBytes:length:", &v3, 8);
}

- (void)encodeVersion:(double)a3
{
  int v6;
  int v7;

  v6 = (int)a3;
  v7 = llround((a3 - (double)(int)a3) * 10.0);
  if ((double)(int)a3 + (double)v7 * 0.1 != a3)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBEncoder.m"), 102, CFSTR("Couldn't split version number: %0.1f"), *(_QWORD *)&a3);
  if (v6 <= 0)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBEncoder.m"), 103, CFSTR("Invalid major version: %0.1f"), *(_QWORD *)&a3);
  if (v7 >= 0xA)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBEncoder.m"), 104, CFSTR("Invalid minor version: %0.1f"), *(_QWORD *)&a3);
  -[MBEncoder encodeInt8:](self, "encodeInt8:", (char)v6);
  -[MBEncoder encodeInt8:](self, "encodeInt8:", (char)v7);
}

- (void)encodeData:(id)a3
{
  id v5;
  void *v6;

  if (a3)
  {
    v5 = objc_msgSend(a3, "length");
    if ((unint64_t)v5 >= 0x8000)
      +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("Data too long to encode: %d"), v5);
    v6 = malloc_type_malloc((size_t)v5, 0x2118D8EAuLL);
    objc_msgSend(a3, "getBytes:length:", v6, v5);
    -[MBEncoder encodeInt16:](self, "encodeInt16:", (__int16)v5);
    -[MBEncoder encodeBytes:length:](self, "encodeBytes:length:", v6, v5);
    free(v6);
  }
  else
  {
    -[MBEncoder encodeInt16:](self, "encodeInt16:", 0xFFFFFFFFLL);
  }
}

- (void)encodeDate:(id)a3
{
  double v4;
  uint64_t v5;

  if (a3)
  {
    objc_msgSend(a3, "timeIntervalSinceReferenceDate");
    v5 = (int)v4;
  }
  else
  {
    v5 = 0xFFFFFFFFLL;
  }
  -[MBEncoder encodeInt32:](self, "encodeInt32:", v5);
}

- (void)encodeString:(id)a3
{
  id v6;
  void *v7;
  __int16 v8;
  unint64_t v9;

  if (a3)
  {
    v6 = objc_msgSend(a3, "maximumLengthOfBytesUsingEncoding:", 4);
    v7 = malloc_type_malloc((size_t)v6, 0x87D0438FuLL);
    v9 = 0;
    if ((objc_msgSend(a3, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v7, v6, &v9, 4, 0, 0, objc_msgSend(a3, "length"), 0) & 1) == 0)-[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBEncoder.m"), 146, CFSTR("Error encoding string"));
    v8 = v9;
    if (v9 >= 0x8000)
    {
      +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("String too long to encode: %d"), v9);
      v8 = v9;
    }
    -[MBEncoder encodeInt16:](self, "encodeInt16:", v8);
    -[MBEncoder encodeBytes:length:](self, "encodeBytes:length:", v7, v9);
    free(v7);
  }
  else
  {
    -[MBEncoder encodeInt16:](self, "encodeInt16:", 0xFFFFFFFFLL);
  }
}

- (void)encodeBytes:(const void *)a3 length:(unint64_t)a4
{
  -[NSMutableData appendBytes:length:](self->_buffer, "appendBytes:length:", a3);
  self->_offset += a4;
  if (-[NSMutableData length](self->_buffer, "length") >= 0x4000)
    -[MBEncoder flush](self, "flush");
}

- (id)data
{
  -[MBEncoder close](self, "close");
  return -[NSOutputStream propertyForKey:](self->_outputStream, "propertyForKey:", NSStreamDataWrittenToMemoryStreamKey);
}

- (NSOutputStream)outputStream
{
  return self->_outputStream;
}

- (unint64_t)offset
{
  return self->_offset;
}

@end
