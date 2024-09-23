@implementation OISFUZipArchiveMemoryDataRepresentation

- (OISFUZipArchiveMemoryDataRepresentation)initWithData:(id)a3
{
  OISFUZipArchiveMemoryDataRepresentation *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OISFUZipArchiveMemoryDataRepresentation;
  v4 = -[OISFUZipArchiveMemoryDataRepresentation init](&v6, sel_init);
  if (v4)
    v4->mData = (NSData *)objc_msgSend(a3, "copy");
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OISFUZipArchiveMemoryDataRepresentation;
  -[OISFUZipArchiveMemoryDataRepresentation dealloc](&v3, sel_dealloc);
}

- (id)data
{
  return self->mData;
}

- (BOOL)isReadable
{
  return 1;
}

- (int64_t)dataLength
{
  return -[NSData length](self->mData, "length");
}

- (id)inputStream
{
  return -[OISFUZipArchiveMemoryDataRepresentation bufferedInputStreamWithOffset:length:](self, "bufferedInputStreamWithOffset:length:", 0, -[OISFUZipArchiveMemoryDataRepresentation dataLength](self, "dataLength"));
}

- (id)bufferedInputStream
{
  return -[OISFUZipArchiveMemoryDataRepresentation bufferedInputStreamWithOffset:length:](self, "bufferedInputStreamWithOffset:length:", 0, -[OISFUZipArchiveMemoryDataRepresentation dataLength](self, "dataLength"));
}

- (id)bufferedInputStreamWithBufferSize:(unint64_t)a3
{
  return -[OISFUZipArchiveMemoryDataRepresentation bufferedInputStreamWithOffset:length:](self, "bufferedInputStreamWithOffset:length:", 0, -[OISFUZipArchiveMemoryDataRepresentation dataLength](self, "dataLength", a3));
}

- (BOOL)hasSameLocationAs:(id)a3
{
  id v5;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v5 = -[OISFUZipArchiveMemoryDataRepresentation data](self, "data");
  return v5 == (id)objc_msgSend(a3, "data");
}

- (id)bufferedInputStreamWithOffset:(int64_t)a3 length:(int64_t)a4
{
  int64_t v7;
  BOOL v8;

  v7 = -[NSData length](self->mData, "length");
  if ((a4 | a3) < 0 || (v7 >= a4 ? (v8 = v7 - a4 < a3) : (v8 = 1), v8))
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Bad input stream range."));
  return -[OISFUMemoryInputStream initWithData:offset:length:]([OISFUMemoryInputStream alloc], "initWithData:offset:length:", self->mData, a3, a4);
}

@end
