@implementation SFUMemoryDataRepresentation

- (SFUMemoryDataRepresentation)initWithData:(id)a3
{
  SFUMemoryDataRepresentation *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFUMemoryDataRepresentation;
  v4 = -[SFUMemoryDataRepresentation init](&v6, sel_init);
  if (v4)
    v4->mData = (NSData *)objc_msgSend(a3, "copy");
  return v4;
}

- (SFUMemoryDataRepresentation)initWithDataNoCopy:(id)a3
{
  SFUMemoryDataRepresentation *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFUMemoryDataRepresentation;
  v4 = -[SFUMemoryDataRepresentation init](&v6, sel_init);
  if (v4)
    v4->mData = (NSData *)a3;
  return v4;
}

- (SFUMemoryDataRepresentation)initWithDataRepresentation:(id)a3
{
  SFUMemoryDataRepresentation *v4;
  SFUMemoryDataRepresentation *v5;
  id v6;
  int64_t v7;
  char *v8;
  void *v9;
  char *v10;
  char *v11;
  uint64_t v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SFUMemoryDataRepresentation;
  v4 = -[SFUMemoryDataRepresentation init](&v14, sel_init);
  v5 = v4;
  if (v4)
  {
    if (a3)
    {
      v6 = objc_alloc_init(MEMORY[0x24BDD1460]);
      v7 = objc_msgSend(a3, "dataLength");
      v8 = (char *)malloc_type_malloc(v7, 0xA3DB0B43uLL);
      if (!v8)
        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("SFUMemoryDataRepresentationError"), CFSTR("Could not allocate data"));
      v9 = (void *)objc_msgSend(a3, "inputStream");
      if (v7 >= 1)
      {
        v10 = &v8[v7];
        v11 = v8;
        do
        {
          v12 = objc_msgSend(v9, "readToBuffer:size:", v11, v10 - v11);
          if (!v12)
            objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("SFUMemoryDataRepresentationError"), CFSTR("Couldn't read enough data"));
          v11 += v12;
        }
        while (v11 < v10);
      }
      objc_msgSend(v9, "close");
      v5->mData = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytesNoCopy:length:", v8, v7);

    }
    else
    {

      return 0;
    }
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFUMemoryDataRepresentation;
  -[SFUMemoryDataRepresentation dealloc](&v3, sel_dealloc);
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

- (id)bufferedInputStream
{
  return -[SFUMemoryInputStream initWithData:]([SFUMemoryInputStream alloc], "initWithData:", self->mData);
}

- (BOOL)hasSameLocationAs:(id)a3
{
  id v5;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v5 = -[SFUMemoryDataRepresentation data](self, "data");
  return v5 == (id)objc_msgSend(a3, "data");
}

- (unint64_t)readIntoData:(id)a3
{
  uint64_t v5;

  v5 = objc_msgSend(a3, "length");
  objc_msgSend(a3, "appendData:", -[SFUMemoryDataRepresentation data](self, "data"));
  return objc_msgSend(a3, "length") - v5;
}

@end
